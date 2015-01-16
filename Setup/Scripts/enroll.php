<?php

require_once( 'cfpropertylist-1.1.2/CFPropertyList.php' );

// Get the varibles passed by the enroll script
$identifier = $_GET["identifier"];
$hostname   = $_GET["hostname"];

// Added by Kyle Fieldus : K.Fieldus@sussex.ac.uk
$hostname_split = explode(".", $hostname);

// Split the manifest path up to determine directory structure
$directories		= explode( "/", $identifier, -1 ); 
$total				= count( $directories );
$n					= 0;
$identifier_path	= "";
while ( $n < $total )
    {
        $identifier_path .= $directories[$n] . '/';
        $n++;
    }

// Check if manifest already exists for this machine
if ( file_exists( '../manifests/' . $identifier_path . '/clients/' . $hostname ) )
    {
        echo "Computer manifest already exists.";
    }
else
    {
        echo "Computer manifest does not exist. Will create.";
        
        if ( !is_dir( '../manifests/' . $identifier_path . 'clients/' ) )
            {
                mkdir( '../manifests/' . $identifier_path . 'clients/', 0755, true );
            }
        
        // Create the new manifest plist
        $plist = new CFPropertyList();
        $plist->add( $dict = new CFDictionary() );
        
        // Add manifest to production catalog by default
        $dict->add( 'catalogs', $array = new CFArray() );
        $array->add( new CFString( 'production' ) );
        
        // Add parent manifest to included_manifests to achieve waterfall effect
        $dict->add( 'included_manifests', $array = new CFArray() );
        $array->add( new CFString( test ) );
        
        switch ($host_split[1]) { // $host_split[1] is the main domain identifier e.g. .staff .user
        	case "staff":                             # Substitute 'staff' with appropriate domain identifer
        		$array->add( new CFString( staff ) );   # Substitute 'staff' with manifest to be included for domain identifer
        		break;
        }
        
        
        // Save the newly created plist
        $plist->saveXML( '../manifests/' . $identifier_path . 'clients/' . $hostname );
        
    }

?>
