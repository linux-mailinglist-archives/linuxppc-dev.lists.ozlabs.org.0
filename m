Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2FB6BC64
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jul 2019 14:31:32 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45pc813LYPzDqHf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jul 2019 22:31:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (mailfrom)
 smtp.mailfrom=bombadil.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org; envelope-from=mchehab@bombadil.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="BGj84pr1"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45pc4n2CyBzDq9k
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Jul 2019 22:28:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=a1f4A6Onw2TGLoQVYrLa3Wksuml1J+AJk0g2E7frTGU=; b=BGj84pr1MWDarfYujDXWI47uk7
 umdBeTBQr7+/GlhkgSwfJWMJBvuABPl7XXXaUU80Wy9lsOvqm6rvNmsBteRSksJkMiWc0CXJCoUjB
 W75WEyao7t0g1G8avAE9zxh//woydMC5QimCj16jiEKalYPrpk7tBRIq0vZkyDlBsptx+Ywj+XdFl
 XC3hpObUYuaSUnNCC8Crw5Fxt/71SDQLZU1Zjb78E+sYAxHJLElCTMjKIEo+rsQOZL8T9w8ElpjG4
 RLGtkmoXFTJ/c3sBKoY1K95EwdIeVid72B0cYfzWPUrAkFDc6NHebkn2uOdGYQRT+zTvNP2NQ29yv
 6MqxkErQ==;
Received: from [191.33.154.161] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hnj2n-0006fj-5U; Wed, 17 Jul 2019 12:28:25 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
 (envelope-from <mchehab@bombadil.infradead.org>)
 id 1hnj2k-00052e-3l; Wed, 17 Jul 2019 09:28:22 -0300
From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To: gregkh@linuxfoundation.org
Subject: [PATCH v4 12/15] docs: ABI: stable: make files ReST compatible
Date: Wed, 17 Jul 2019 09:28:16 -0300
Message-Id: <1c1ce4b491edf2137c47059bf23f0e76b8cca21b.1563365880.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1563365880.git.mchehab+samsung@kernel.org>
References: <cover.1563365880.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 linux-wireless@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Paul Mackerras <paulus@samba.org>, Johannes Berg <johannes@sipsolutions.net>,
 linuxppc-dev@lists.ozlabs.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Several entries at the stable ABI files won't parse if we pass
them directly to the ReST output.

Adjust them, in order to allow adding their contents as-is at
the stable ABI book.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 Documentation/ABI/stable/firewire-cdev        |  4 +
 Documentation/ABI/stable/sysfs-acpi-pmprofile | 22 +++--
 Documentation/ABI/stable/sysfs-bus-firewire   |  3 +
 Documentation/ABI/stable/sysfs-bus-nvmem      | 19 ++--
 Documentation/ABI/stable/sysfs-bus-usb        |  6 +-
 .../ABI/stable/sysfs-class-backlight          |  1 +
 .../ABI/stable/sysfs-class-infiniband         | 95 +++++++++++++------
 Documentation/ABI/stable/sysfs-class-rfkill   | 13 ++-
 Documentation/ABI/stable/sysfs-class-tpm      | 90 +++++++++---------
 Documentation/ABI/stable/sysfs-devices        |  5 +-
 Documentation/ABI/stable/sysfs-driver-ib_srp  |  1 +
 .../ABI/stable/sysfs-firmware-efi-vars        |  4 +
 .../ABI/stable/sysfs-firmware-opal-dump       |  5 +
 .../ABI/stable/sysfs-firmware-opal-elog       |  2 +
 Documentation/ABI/stable/sysfs-hypervisor-xen |  3 +
 Documentation/ABI/stable/vdso                 |  5 +-
 Documentation/admin-guide/abi-stable.rst      |  1 +
 17 files changed, 179 insertions(+), 100 deletions(-)

diff --git a/Documentation/ABI/stable/firewire-cdev b/Documentation/ABI/stable/firewire-cdev
index f72ed653878a..c9e8ff026154 100644
--- a/Documentation/ABI/stable/firewire-cdev
+++ b/Documentation/ABI/stable/firewire-cdev
@@ -14,12 +14,14 @@ Description:
 		Each /dev/fw* is associated with one IEEE 1394 node, which can
 		be remote or local nodes.  Operations on a /dev/fw* file have
 		different scope:
+
 		  - The 1394 node which is associated with the file:
 			  - Asynchronous request transmission
 			  - Get the Configuration ROM
 			  - Query node ID
 			  - Query maximum speed of the path between this node
 			    and local node
+
 		  - The 1394 bus (i.e. "card") to which the node is attached to:
 			  - Isochronous stream transmission and reception
 			  - Asynchronous stream transmission and reception
@@ -31,6 +33,7 @@ Description:
 			    manager
 			  - Query cycle time
 			  - Bus reset initiation, bus reset event reception
+
 		  - All 1394 buses:
 			  - Allocation of IEEE 1212 address ranges on the local
 			    link layers, reception of inbound requests to such
@@ -43,6 +46,7 @@ Description:
 		userland implement different access permission models, some
 		operations are restricted to /dev/fw* files that are associated
 		with a local node:
+
 			  - Addition of descriptors or directories to the local
 			    nodes' Configuration ROM
 			  - PHY packet transmission and reception
diff --git a/Documentation/ABI/stable/sysfs-acpi-pmprofile b/Documentation/ABI/stable/sysfs-acpi-pmprofile
index 964c7a8afb26..fd97d22b677f 100644
--- a/Documentation/ABI/stable/sysfs-acpi-pmprofile
+++ b/Documentation/ABI/stable/sysfs-acpi-pmprofile
@@ -6,17 +6,21 @@ Description: 	The ACPI pm_profile sysfs interface exports the platform
 		power management (and performance) requirement expectations
 		as provided by BIOS. The integer value is directly passed as
 		retrieved from the FADT ACPI table.
-Values:         For possible values see ACPI specification:
+
+Values:	        For possible values see ACPI specification:
 		5.2.9 Fixed ACPI Description Table (FADT)
 		Field: Preferred_PM_Profile
 
 		Currently these values are defined by spec:
-		0 Unspecified
-		1 Desktop
-		2 Mobile
-		3 Workstation
-		4 Enterprise Server
-		5 SOHO Server
-		6 Appliance PC
-		7 Performance Server
+
+		== =================
+		0  Unspecified
+		1  Desktop
+		2  Mobile
+		3  Workstation
+		4  Enterprise Server
+		5  SOHO Server
+		6  Appliance PC
+		7  Performance Server
 		>7 Reserved
+		== =================
diff --git a/Documentation/ABI/stable/sysfs-bus-firewire b/Documentation/ABI/stable/sysfs-bus-firewire
index 41e5a0cd1e3e..9ac9eddb82ef 100644
--- a/Documentation/ABI/stable/sysfs-bus-firewire
+++ b/Documentation/ABI/stable/sysfs-bus-firewire
@@ -47,6 +47,7 @@ Description:
 		IEEE 1394 node device attribute.
 		Read-only and immutable.
 Values:		1: The sysfs entry represents a local node (a controller card).
+
 		0: The sysfs entry represents a remote node.
 
 
@@ -125,7 +126,9 @@ Description:
 		Read-only attribute, immutable during the target's lifetime.
 		Format, as exposed by firewire-sbp2 since 2.6.22, May 2007:
 		Colon-separated hexadecimal string representations of
+
 			u64 EUI-64 : u24 directory_ID : u16 LUN
+
 		without 0x prefixes, without whitespace.  The former sbp2 driver
 		(removed in 2.6.37 after being superseded by firewire-sbp2) used
 		a somewhat shorter format which was not as close to SAM.
diff --git a/Documentation/ABI/stable/sysfs-bus-nvmem b/Documentation/ABI/stable/sysfs-bus-nvmem
index 9ffba8576f7b..c399323f37de 100644
--- a/Documentation/ABI/stable/sysfs-bus-nvmem
+++ b/Documentation/ABI/stable/sysfs-bus-nvmem
@@ -9,13 +9,14 @@ Description:
 		Note: This file is only present if CONFIG_NVMEM_SYSFS
 		is enabled
 
-		ex:
-		hexdump /sys/bus/nvmem/devices/qfprom0/nvmem
+		ex::
 
-		0000000 0000 0000 0000 0000 0000 0000 0000 0000
-		*
-		00000a0 db10 2240 0000 e000 0c00 0c00 0000 0c00
-		0000000 0000 0000 0000 0000 0000 0000 0000 0000
-		...
-		*
-		0001000
+		  hexdump /sys/bus/nvmem/devices/qfprom0/nvmem
+
+		  0000000 0000 0000 0000 0000 0000 0000 0000 0000
+		  *
+		  00000a0 db10 2240 0000 e000 0c00 0c00 0000 0c00
+		  0000000 0000 0000 0000 0000 0000 0000 0000 0000
+		  ...
+		  *
+		  0001000
diff --git a/Documentation/ABI/stable/sysfs-bus-usb b/Documentation/ABI/stable/sysfs-bus-usb
index b832eeff9999..cad4bc232520 100644
--- a/Documentation/ABI/stable/sysfs-bus-usb
+++ b/Documentation/ABI/stable/sysfs-bus-usb
@@ -50,8 +50,10 @@ Description:
 
 		Tools can use this file and the connected_duration file to
 		compute the percentage of time that a device has been active.
-		For example,
-		echo $((100 * `cat active_duration` / `cat connected_duration`))
+		For example::
+
+		  echo $((100 * `cat active_duration` / `cat connected_duration`))
+
 		will give an integer percentage.  Note that this does not
 		account for counter wrap.
 Users:
diff --git a/Documentation/ABI/stable/sysfs-class-backlight b/Documentation/ABI/stable/sysfs-class-backlight
index 70302f370e7e..023fb52645f8 100644
--- a/Documentation/ABI/stable/sysfs-class-backlight
+++ b/Documentation/ABI/stable/sysfs-class-backlight
@@ -4,6 +4,7 @@ KernelVersion:	2.6.12
 Contact:	Richard Purdie <rpurdie@rpsys.net>
 Description:
 		Control BACKLIGHT power, values are FB_BLANK_* from fb.h
+
 		 - FB_BLANK_UNBLANK (0)   : power on.
 		 - FB_BLANK_POWERDOWN (4) : power off
 Users:		HAL
diff --git a/Documentation/ABI/stable/sysfs-class-infiniband b/Documentation/ABI/stable/sysfs-class-infiniband
index aed21b8916a2..ac774d36a512 100644
--- a/Documentation/ABI/stable/sysfs-class-infiniband
+++ b/Documentation/ABI/stable/sysfs-class-infiniband
@@ -8,12 +8,14 @@ Date:		Apr, 2005
 KernelVersion:	v2.6.12
 Contact:	linux-rdma@vger.kernel.org
 Description:
+		=============== ===========================================
 		node_type:	(RO) Node type (CA, RNIC, usNIC, usNIC UDP,
 				switch or router)
 
 		node_guid:	(RO) Node GUID
 
 		sys_image_guid:	(RO) System image GUID
+		=============== ===========================================
 
 
 What:		/sys/class/infiniband/<device>/node_desc
@@ -47,6 +49,7 @@ KernelVersion:	v2.6.12
 Contact:	linux-rdma@vger.kernel.org
 Description:
 
+		=============== ===============================================
 		lid:		(RO) Port LID
 
 		rate:		(RO) Port data rate (active width * active
@@ -66,8 +69,9 @@ Description:
 
 		cap_mask:	(RO) Port capability mask. 2 bits here are
 				settable- IsCommunicationManagementSupported
-				(set when CM module is loaded) and IsSM (set via
-				open of issmN file).
+				(set when CM module is loaded) and IsSM (set
+				via open of issmN file).
+		=============== ===============================================
 
 
 What:		/sys/class/infiniband/<device>/ports/<port-num>/link_layer
@@ -103,8 +107,7 @@ Date:		Apr, 2005
 KernelVersion:	v2.6.12
 Contact:	linux-rdma@vger.kernel.org
 Description:
-		Errors info:
-		-----------
+		**Errors info**:
 
 		symbol_error: (RO) Total number of minor link errors detected on
 		one or more physical lanes.
@@ -142,8 +145,7 @@ Description:
 		intervention. It can also indicate hardware issues or extremely
 		poor link signal integrity
 
-		Data info:
-		---------
+		**Data info**:
 
 		port_xmit_data: (RO) Total number of data octets, divided by 4
 		(lanes), transmitted on all VLs. This is 64 bit counter
@@ -176,8 +178,7 @@ Description:
 		transmitted on all VLs from the port. This may include multicast
 		packets with errors.
 
-		Misc info:
-		---------
+		**Misc info**:
 
 		port_xmit_discards: (RO) Total number of outbound packets
 		discarded by the port because the port is down or congested.
@@ -244,9 +245,11 @@ Description:
 		two umad devices and two issm devices, while a switch will have
 		one device of each type (for switch port 0).
 
+		======= =====================================
 		ibdev:	(RO) Show Infiniband (IB) device name
 
 		port:	(RO) Display port number
+		======= =====================================
 
 
 What:		/sys/class/infiniband_mad/abi_version
@@ -281,10 +284,12 @@ Date:		Sept, 2005
 KernelVersion:	v2.6.14
 Contact:	linux-rdma@vger.kernel.org
 Description:
+		=============== ===========================================
 		ibdev:		(RO) Display Infiniband (IB) device name
 
 		abi_version:	(RO) Show ABI version of IB device specific
 				interfaces.
+		=============== ===========================================
 
 
 What:		/sys/class/infiniband_verbs/abi_version
@@ -306,12 +311,14 @@ Date:		Apr, 2005
 KernelVersion:	v2.6.12
 Contact:	linux-rdma@vger.kernel.org
 Description:
+		=============== ================================================
 		hw_rev:		(RO) Hardware revision number
 
 		hca_type:	(RO) Host Channel Adapter type: MT23108, MT25208
 				(MT23108 compat mode), MT25208 or MT25204
 
 		board_id:	(RO) Manufacturing board ID
+		=============== ================================================
 
 
 sysfs interface for Chelsio T3 RDMA Driver (cxgb3)
@@ -324,6 +331,7 @@ Date:		Feb, 2007
 KernelVersion:	v2.6.21
 Contact:	linux-rdma@vger.kernel.org
 Description:
+		=============== ==============================================
 		hw_rev:		(RO) Hardware revision number
 
 		hca_type:	(RO) HCA type. Here it is a driver short name.
@@ -331,6 +339,7 @@ Description:
 				driver structure (e.g.  pci_driver::name).
 
 		board_id:	(RO) Manufacturing board id
+		=============== ==============================================
 
 
 sysfs interface for Mellanox ConnectX HCA IB driver (mlx4)
@@ -343,11 +352,13 @@ Date:		Sep, 2007
 KernelVersion:	v2.6.24
 Contact:	linux-rdma@vger.kernel.org
 Description:
+		=============== ===============================
 		hw_rev:		(RO) Hardware revision number
 
 		hca_type:	(RO) Host channel adapter type
 
 		board_id:	(RO) Manufacturing board ID
+		=============== ===============================
 
 
 What:		/sys/class/infiniband/mlx4_X/iov/ports/<port-num>/gids/<n>
@@ -373,6 +384,7 @@ Description:
 		example, ports/1/pkeys/10 contains the value at index 10 in port
 		1's P_Key table.
 
+		======================= ==========================================
 		gids/<n>:		(RO) The physical port gids n = 0..127
 
 		admin_guids/<n>:	(RW) Allows examining or changing the
@@ -401,6 +413,7 @@ Description:
 					guest, whenever it uses its pkey index
 					1, will actually be using the real pkey
 					index 10.
+		======================= ==========================================
 
 
 What:		/sys/class/infiniband/mlx4_X/iov/<pci-slot-num>/ports/<m>/smi_enabled
@@ -412,12 +425,14 @@ Description:
 		Enabling QP0 on VFs for selected VF/port. By default, no VFs are
 		enabled for QP0 operation.
 
-		smi_enabled:	(RO) Indicates whether smi is currently enabled
-				for the indicated VF/port
+		================= ==== ===========================================
+		smi_enabled:	  (RO) Indicates whether smi is currently enabled
+				       for the indicated VF/port
 
-		enable_smi_admin:(RW) Used by the admin to request that smi
-				capability be enabled or disabled for the
-				indicated VF/port. 0 = disable, 1 = enable.
+		enable_smi_admin: (RW) Used by the admin to request that smi
+				       capability be enabled or disabled for the
+				       indicated VF/port. 0 = disable, 1 = enable.
+		================= ==== ===========================================
 
 		The requested enablement will occur at the next reset of the VF
 		(e.g. driver restart on the VM which owns the VF).
@@ -434,6 +449,7 @@ KernelVersion:	v2.6.35
 Contact:	linux-rdma@vger.kernel.org
 Description:
 
+		=============== =============================================
 		hw_rev:		(RO) Hardware revision number
 
 		hca_type:	(RO) Driver short name. Should normally match
@@ -442,6 +458,7 @@ Description:
 
 		board_id:	(RO) Manufacturing board id. (Vendor + device
 				information)
+		=============== =============================================
 
 
 sysfs interface for Intel IB driver qib
@@ -462,6 +479,7 @@ Date:		May, 2010
 KernelVersion:	v2.6.35
 Contact:	linux-rdma@vger.kernel.org
 Description:
+		=============== ======================================================
 		version:	(RO) Display version information of installed software
 				and drivers.
 
@@ -488,6 +506,7 @@ Description:
 		chip_reset:	(WO) Reset the chip if possible by writing
 				"reset" to this file. Only allowed if no user
 				contexts are open that use chip resources.
+		=============== ======================================================
 
 
 What:		/sys/class/infiniband/qibX/ports/N/sl2vl/[0-15]
@@ -507,14 +526,16 @@ Contact:	linux-rdma@vger.kernel.org
 Description:
 		Per-port congestion control. Both are binary attributes.
 
-		cc_table_bin:	(RO) Congestion control table size followed by
+		=============== ================================================
+		cc_table_bin	(RO) Congestion control table size followed by
 				table entries.
 
-		cc_settings_bin:(RO) Congestion settings: port control, control
+		cc_settings_bin (RO) Congestion settings: port control, control
 				map and an array of 16 entries for the
 				congestion entries - increase, timer, event log
 				trigger threshold and the minimum injection rate
 				delay.
+		=============== ================================================
 
 What:		/sys/class/infiniband/qibX/ports/N/linkstate/loopback
 What:		/sys/class/infiniband/qibX/ports/N/linkstate/led_override
@@ -527,6 +548,7 @@ Contact:	linux-rdma@vger.kernel.org
 Description:
 		[to be documented]
 
+		=============== ===============================================
 		loopback:	(WO)
 		led_override:	(WO)
 		hrtbt_enable:	(RW)
@@ -537,6 +559,7 @@ Description:
 				errors. Possible states are- "Initted",
 				"Present", "IB_link_up", "IB_configured" or
 				"Fatal_Hardware_Error".
+		=============== ===============================================
 
 What:		/sys/class/infiniband/qibX/ports/N/diag_counters/rc_resends
 What:		/sys/class/infiniband/qibX/ports/N/diag_counters/seq_naks
@@ -585,6 +608,7 @@ Contact:	Christian Benvenuti <benve@cisco.com>,
 		linux-rdma@vger.kernel.org
 Description:
 
+		=============== ===============================================
 		board_id:	(RO) Manufacturing board id
 
 		config:		(RO) Report the configuration for this PF
@@ -597,6 +621,7 @@ Description:
 
 		iface:		(RO) Shows which network interface this usNIC
 				entry is associated to (visible with ifconfig).
+		=============== ===============================================
 
 What:		/sys/class/infiniband/usnic_X/qpn/summary
 What:		/sys/class/infiniband/usnic_X/qpn/context
@@ -641,6 +666,7 @@ Date:		May, 2016
 KernelVersion:	v4.6
 Contact:	linux-rdma@vger.kernel.org
 Description:
+		=============== =============================================
 		hw_rev:		(RO) Hardware revision number
 
 		board_id:	(RO) Manufacturing board id
@@ -659,6 +685,7 @@ Description:
 				available.
 
 		tempsense:	(RO) Thermal sense information
+		=============== =============================================
 
 
 What:		/sys/class/infiniband/hfi1_X/ports/N/CCMgtA/cc_settings_bin
@@ -670,19 +697,21 @@ Contact:	linux-rdma@vger.kernel.org
 Description:
 		Per-port congestion control.
 
-		cc_table_bin:	(RO) CCA tables used by PSM2 Congestion control
+		=============== ================================================
+		cc_table_bin	(RO) CCA tables used by PSM2 Congestion control
 				table size followed by table entries. Binary
 				attribute.
 
-		cc_settings_bin:(RO) Congestion settings: port control, control
+		cc_settings_bin (RO) Congestion settings: port control, control
 				map and an array of 16 entries for the
 				congestion entries - increase, timer, event log
 				trigger threshold and the minimum injection rate
 				delay. Binary attribute.
 
-		cc_prescan:	(RW) enable prescanning for faster BECN
+		cc_prescan	(RW) enable prescanning for faster BECN
 				response. Write "on" to enable and "off" to
 				disable.
+		=============== ================================================
 
 What:		/sys/class/infiniband/hfi1_X/ports/N/sc2vl/[0-31]
 What:		/sys/class/infiniband/hfi1_X/ports/N/sl2sc/[0-31]
@@ -691,11 +720,13 @@ Date:		May, 2016
 KernelVersion:	v4.6
 Contact:	linux-rdma@vger.kernel.org
 Description:
+		=============== ===================================================
 		sc2vl/:		(RO) 32 files (0 - 31) used to translate sl->vl
 
 		sl2sc/:		(RO) 32 files (0 - 31) used to translate sl->sc
 
 		vl2mtu/:	(RO) 16 files (0 - 15) used to determine MTU for vl
+		=============== ===================================================
 
 
 What:		/sys/class/infiniband/hfi1_X/sdma_N/cpu_list
@@ -706,26 +737,28 @@ Contact:	linux-rdma@vger.kernel.org
 Description:
 		sdma<N>/ contains one directory per sdma engine (0 - 15)
 
+		=============== ==============================================
 		cpu_list:	(RW) List of cpus for user-process to sdma
 				engine assignment.
 
 		vl:		(RO) Displays the virtual lane (vl) the sdma
 				engine maps to.
+		=============== ==============================================
 
 		This interface gives the user control on the affinity settings
 		for the device. As an example, to set an sdma engine irq
 		affinity and thread affinity of a user processes to use the
 		sdma engine, which is "near" in terms of NUMA configuration, or
-		physical cpu location, the user will do:
+		physical cpu location, the user will do::
 
-		echo "3" > /proc/irq/<N>/smp_affinity_list
-		echo "4-7" > /sys/devices/.../sdma3/cpu_list
-		cat /sys/devices/.../sdma3/vl
-		0
-		echo "8" > /proc/irq/<M>/smp_affinity_list
-		echo "9-12" > /sys/devices/.../sdma4/cpu_list
-		cat /sys/devices/.../sdma4/vl
-		1
+		  echo "3" > /proc/irq/<N>/smp_affinity_list
+		  echo "4-7" > /sys/devices/.../sdma3/cpu_list
+		  cat /sys/devices/.../sdma3/vl
+		  0
+		  echo "8" > /proc/irq/<M>/smp_affinity_list
+		  echo "9-12" > /sys/devices/.../sdma4/cpu_list
+		  cat /sys/devices/.../sdma4/vl
+		  1
 
 		to make sure that when a process runs on cpus 4,5,6, or 7, and
 		uses vl=0, then sdma engine 3 is selected by the driver, and
@@ -747,11 +780,13 @@ Date:		Jan, 2016
 KernelVersion:	v4.10
 Contact:	linux-rdma@vger.kernel.org
 Description:
+		=============== ==== ========================
 		hw_rev:		(RO) Hardware revision number
 
 		hca_type:	(RO) Show HCA type (I40IW)
 
 		board_id:	(RO) I40IW board ID
+		=============== ==== ========================
 
 
 sysfs interface for QLogic qedr NIC Driver
@@ -764,9 +799,11 @@ KernelVersion:	v4.10
 Contact:	linux-rdma@vger.kernel.org
 Description:
 
+		=============== ==== ========================
 		hw_rev:		(RO) Hardware revision number
 
 		hca_type:	(RO) Display HCA type
+		=============== ==== ========================
 
 
 sysfs interface for VMware Paravirtual RDMA driver
@@ -780,11 +817,13 @@ KernelVersion:	v4.10
 Contact:	linux-rdma@vger.kernel.org
 Description:
 
+		=============== ==== =====================================
 		hw_rev:		(RO) Hardware revision number
 
 		hca_type:	(RO) Host channel adapter type
 
 		board_id:	(RO) Display PVRDMA manufacturing board ID
+		=============== ==== =====================================
 
 
 sysfs interface for Broadcom NetXtreme-E RoCE driver
@@ -796,6 +835,8 @@ Date:		Feb, 2017
 KernelVersion:	v4.11
 Contact:	linux-rdma@vger.kernel.org
 Description:
+		=============== ==== =========================
 		hw_rev:		(RO) Hardware revision number
 
 		hca_type:	(RO) Host channel adapter type
+		=============== ==== =========================
diff --git a/Documentation/ABI/stable/sysfs-class-rfkill b/Documentation/ABI/stable/sysfs-class-rfkill
index 5b154f922643..037979f7dc4b 100644
--- a/Documentation/ABI/stable/sysfs-class-rfkill
+++ b/Documentation/ABI/stable/sysfs-class-rfkill
@@ -2,7 +2,7 @@ rfkill - radio frequency (RF) connector kill switch support
 
 For details to this subsystem look at Documentation/driver-api/rfkill.rst.
 
-For the deprecated /sys/class/rfkill/*/claim knobs of this interface look in
+For the deprecated ``/sys/class/rfkill/*/claim`` knobs of this interface look in
 Documentation/ABI/removed/sysfs-class-rfkill.
 
 What: 		/sys/class/rfkill
@@ -36,9 +36,10 @@ KernelVersion	v2.6.22
 Contact:	linux-wireless@vger.kernel.org
 Description: 	Whether the soft blocked state is initialised from non-volatile
 		storage at startup.
-Values: 	A numeric value.
-		0: false
-		1: true
+Values: 	A numeric value:
+
+		- 0: false
+		- 1: true
 
 
 What:		/sys/class/rfkill/rfkill[0-9]+/state
@@ -54,6 +55,7 @@ Description: 	Current state of the transmitter.
 		through this interface. There will likely be another attempt to
 		remove it in the future.
 Values: 	A numeric value.
+
 		0: RFKILL_STATE_SOFT_BLOCKED
 			transmitter is turned off by software
 		1: RFKILL_STATE_UNBLOCKED
@@ -69,6 +71,7 @@ KernelVersion	v2.6.34
 Contact:	linux-wireless@vger.kernel.org
 Description: 	Current hardblock state. This file is read only.
 Values: 	A numeric value.
+
 		0: inactive
 			The transmitter is (potentially) active.
 		1: active
@@ -82,7 +85,9 @@ KernelVersion	v2.6.34
 Contact:	linux-wireless@vger.kernel.org
 Description:	Current softblock state. This file is read and write.
 Values: 	A numeric value.
+
 		0: inactive
 			The transmitter is (potentially) active.
+
 		1: active
 			The transmitter is turned off by software.
diff --git a/Documentation/ABI/stable/sysfs-class-tpm b/Documentation/ABI/stable/sysfs-class-tpm
index c0e23830f56a..bbee8899a90e 100644
--- a/Documentation/ABI/stable/sysfs-class-tpm
+++ b/Documentation/ABI/stable/sysfs-class-tpm
@@ -32,11 +32,11 @@ KernelVersion:	2.6.12
 Contact:	tpmdd-devel@lists.sf.net
 Description:	The "caps" property contains TPM manufacturer and version info.
 
-		Example output:
+		Example output::
 
-		Manufacturer: 0x53544d20
-		TCG version: 1.2
-		Firmware version: 8.16
+		  Manufacturer: 0x53544d20
+		  TCG version: 1.2
+		  Firmware version: 8.16
 
 		Manufacturer is a hex dump of the 4 byte manufacturer info
 		space in a TPM. TCG version shows the TCG TPM spec level that
@@ -54,9 +54,9 @@ Description:	The "durations" property shows the 3 vendor-specific values
 		any longer than necessary before starting to poll for a
 		result.
 
-		Example output:
+		Example output::
 
-		3015000 4508000 180995000 [original]
+		  3015000 4508000 180995000 [original]
 
 		Here the short, medium and long durations are displayed in
 		usecs. "[original]" indicates that the values are displayed
@@ -92,14 +92,14 @@ Description:	The "pcrs" property will dump the current value of all Platform
 		values may be constantly changing, the output is only valid
 		for a snapshot in time.
 
-		Example output:
+		Example output::
 
-		PCR-00: 3A 3F 78 0F 11 A4 B4 99 69 FC AA 80 CD 6E 39 57 C3 3B 22 75
-		PCR-01: 3A 3F 78 0F 11 A4 B4 99 69 FC AA 80 CD 6E 39 57 C3 3B 22 75
-		PCR-02: 3A 3F 78 0F 11 A4 B4 99 69 FC AA 80 CD 6E 39 57 C3 3B 22 75
-		PCR-03: 3A 3F 78 0F 11 A4 B4 99 69 FC AA 80 CD 6E 39 57 C3 3B 22 75
-		PCR-04: 3A 3F 78 0F 11 A4 B4 99 69 FC AA 80 CD 6E 39 57 C3 3B 22 75
-		...
+		  PCR-00: 3A 3F 78 0F 11 A4 B4 99 69 FC AA 80 CD 6E 39 57 C3 3B 22 75
+		  PCR-01: 3A 3F 78 0F 11 A4 B4 99 69 FC AA 80 CD 6E 39 57 C3 3B 22 75
+		  PCR-02: 3A 3F 78 0F 11 A4 B4 99 69 FC AA 80 CD 6E 39 57 C3 3B 22 75
+		  PCR-03: 3A 3F 78 0F 11 A4 B4 99 69 FC AA 80 CD 6E 39 57 C3 3B 22 75
+		  PCR-04: 3A 3F 78 0F 11 A4 B4 99 69 FC AA 80 CD 6E 39 57 C3 3B 22 75
+		  ...
 
 		The number of PCRs and hex bytes needed to represent a PCR
 		value will vary depending on TPM chip version. For TPM 1.1 and
@@ -119,44 +119,44 @@ Description:	The "pubek" property will return the TPM's public endorsement
 		ated at TPM manufacture time and exists for the life of the
 		chip.
 
-		Example output:
+		Example output::
 
-		Algorithm: 00 00 00 01
-		Encscheme: 00 03
-		Sigscheme: 00 01
-		Parameters: 00 00 08 00 00 00 00 02 00 00 00 00
-		Modulus length: 256
-		Modulus:
-		B4 76 41 82 C9 20 2C 10 18 40 BC 8B E5 44 4C 6C
-		3A B2 92 0C A4 9B 2A 83 EB 5C 12 85 04 48 A0 B6
-		1E E4 81 84 CE B2 F2 45 1C F0 85 99 61 02 4D EB
-		86 C4 F7 F3 29 60 52 93 6B B2 E5 AB 8B A9 09 E3
-		D7 0E 7D CA 41 BF 43 07 65 86 3C 8C 13 7A D0 8B
-		82 5E 96 0B F8 1F 5F 34 06 DA A2 52 C1 A9 D5 26
-		0F F4 04 4B D9 3F 2D F2 AC 2F 74 64 1F 8B CD 3E
-		1E 30 38 6C 70 63 69 AB E2 50 DF 49 05 2E E1 8D
-		6F 78 44 DA 57 43 69 EE 76 6C 38 8A E9 8E A3 F0
-		A7 1F 3C A8 D0 12 15 3E CA 0E BD FA 24 CD 33 C6
-		47 AE A4 18 83 8E 22 39 75 93 86 E6 FD 66 48 B6
-		10 AD 94 14 65 F9 6A 17 78 BD 16 53 84 30 BF 70
-		E0 DC 65 FD 3C C6 B0 1E BF B9 C1 B5 6C EF B1 3A
-		F8 28 05 83 62 26 11 DC B4 6B 5A 97 FF 32 26 B6
-		F7 02 71 CF 15 AE 16 DD D1 C1 8E A8 CF 9B 50 7B
-		C3 91 FF 44 1E CF 7C 39 FE 17 77 21 20 BD CE 9B
+		  Algorithm: 00 00 00 01
+		  Encscheme: 00 03
+		  Sigscheme: 00 01
+		  Parameters: 00 00 08 00 00 00 00 02 00 00 00 00
+		  Modulus length: 256
+		  Modulus:
+		  B4 76 41 82 C9 20 2C 10 18 40 BC 8B E5 44 4C 6C
+		  3A B2 92 0C A4 9B 2A 83 EB 5C 12 85 04 48 A0 B6
+		  1E E4 81 84 CE B2 F2 45 1C F0 85 99 61 02 4D EB
+		  86 C4 F7 F3 29 60 52 93 6B B2 E5 AB 8B A9 09 E3
+		  D7 0E 7D CA 41 BF 43 07 65 86 3C 8C 13 7A D0 8B
+		  82 5E 96 0B F8 1F 5F 34 06 DA A2 52 C1 A9 D5 26
+		  0F F4 04 4B D9 3F 2D F2 AC 2F 74 64 1F 8B CD 3E
+		  1E 30 38 6C 70 63 69 AB E2 50 DF 49 05 2E E1 8D
+		  6F 78 44 DA 57 43 69 EE 76 6C 38 8A E9 8E A3 F0
+		  A7 1F 3C A8 D0 12 15 3E CA 0E BD FA 24 CD 33 C6
+		  47 AE A4 18 83 8E 22 39 75 93 86 E6 FD 66 48 B6
+		  10 AD 94 14 65 F9 6A 17 78 BD 16 53 84 30 BF 70
+		  E0 DC 65 FD 3C C6 B0 1E BF B9 C1 B5 6C EF B1 3A
+		  F8 28 05 83 62 26 11 DC B4 6B 5A 97 FF 32 26 B6
+		  F7 02 71 CF 15 AE 16 DD D1 C1 8E A8 CF 9B 50 7B
+		  C3 91 FF 44 1E CF 7C 39 FE 17 77 21 20 BD CE 9B
 
-		Possible values:
+		Possible values::
 
-		Algorithm:	TPM_ALG_RSA			(1)
-		Encscheme:	TPM_ES_RSAESPKCSv15		(2)
+		  Algorithm:	TPM_ALG_RSA			(1)
+		  Encscheme:	TPM_ES_RSAESPKCSv15		(2)
 				TPM_ES_RSAESOAEP_SHA1_MGF1	(3)
-		Sigscheme:	TPM_SS_NONE			(1)
-		Parameters, a byte string of 3 u32 values:
+		  Sigscheme:	TPM_SS_NONE			(1)
+		  Parameters, a byte string of 3 u32 values:
 			Key Length (bits):	00 00 08 00	(2048)
 			Num primes:		00 00 00 02	(2)
 			Exponent Size:		00 00 00 00	(0 means the
 								 default exp)
-		Modulus Length: 256 (bytes)
-		Modulus:	The 256 byte Endorsement Key modulus
+		  Modulus Length: 256 (bytes)
+		  Modulus:	The 256 byte Endorsement Key modulus
 
 What:		/sys/class/tpm/tpmX/device/temp_deactivated
 Date:		April 2006
@@ -176,9 +176,9 @@ Description:	The "timeouts" property shows the 4 vendor-specific values
 		timeouts is defined by the TPM interface spec that the chip
 		conforms to.
 
-		Example output:
+		Example output::
 
-		750000 750000 750000 750000 [original]
+		  750000 750000 750000 750000 [original]
 
 		The four timeout values are shown in usecs, with a trailing
 		"[original]" or "[adjusted]" depending on whether the values
diff --git a/Documentation/ABI/stable/sysfs-devices b/Documentation/ABI/stable/sysfs-devices
index 4404bd9b96c1..42bf1eab5677 100644
--- a/Documentation/ABI/stable/sysfs-devices
+++ b/Documentation/ABI/stable/sysfs-devices
@@ -1,5 +1,6 @@
-# Note: This documents additional properties of any device beyond what
-# is documented in Documentation/admin-guide/sysfs-rules.rst
+Note:
+  This documents additional properties of any device beyond what
+  is documented in Documentation/admin-guide/sysfs-rules.rst
 
 What:		/sys/devices/*/of_node
 Date:		February 2015
diff --git a/Documentation/ABI/stable/sysfs-driver-ib_srp b/Documentation/ABI/stable/sysfs-driver-ib_srp
index 7049a2b50359..2d706b4900ce 100644
--- a/Documentation/ABI/stable/sysfs-driver-ib_srp
+++ b/Documentation/ABI/stable/sysfs-driver-ib_srp
@@ -6,6 +6,7 @@ Description:	Interface for making ib_srp connect to a new target.
 		One can request ib_srp to connect to a new target by writing
 		a comma-separated list of login parameters to this sysfs
 		attribute. The supported parameters are:
+
 		* id_ext, a 16-digit hexadecimal number specifying the eight
 		  byte identifier extension in the 16-byte SRP target port
 		  identifier. The target port identifier is sent by ib_srp
diff --git a/Documentation/ABI/stable/sysfs-firmware-efi-vars b/Documentation/ABI/stable/sysfs-firmware-efi-vars
index 5def20b9019e..46ccd233e359 100644
--- a/Documentation/ABI/stable/sysfs-firmware-efi-vars
+++ b/Documentation/ABI/stable/sysfs-firmware-efi-vars
@@ -17,6 +17,7 @@ Description:
 		directory has a name of the form "<key>-<vendor guid>"
 		and contains the following files:
 
+		=============== ========================================
 		attributes:	A read-only text file enumerating the
 				EFI variable flags.  Potential values
 				include:
@@ -59,12 +60,14 @@ Description:
 
 		size:		As ASCII representation of the size of
 				the variable's value.
+		=============== ========================================
 
 
 		In addition, two other magic binary files are provided
 		in the top-level directory and are used for adding and
 		removing variables:
 
+		=============== ========================================
 		new_var:	Takes a "struct efi_variable" and
 				instructs the EFI firmware to create a
 				new variable.
@@ -73,3 +76,4 @@ Description:
 				instructs the EFI firmware to remove any
 				variable that has a matching vendor GUID
 				and variable key name.
+		=============== ========================================
diff --git a/Documentation/ABI/stable/sysfs-firmware-opal-dump b/Documentation/ABI/stable/sysfs-firmware-opal-dump
index 32fe7f5c4880..1f74f45327ba 100644
--- a/Documentation/ABI/stable/sysfs-firmware-opal-dump
+++ b/Documentation/ABI/stable/sysfs-firmware-opal-dump
@@ -7,6 +7,7 @@ Description:
 
 		This is only for the powerpc/powernv platform.
 
+		=============== ===============================================
 		initiate_dump:	When '1' is written to it,
 				we will initiate a dump.
 				Read this file for supported commands.
@@ -19,8 +20,11 @@ Description:
 				and ID of the dump, use the id and type files.
 				Do not rely on any particular size of dump
 				type or dump id.
+		=============== ===============================================
 
 		Each dump has the following files:
+
+		=============== ===============================================
 		id:		An ASCII representation of the dump ID
 				in hex (e.g. '0x01')
 		type:		An ASCII representation of the type of
@@ -39,3 +43,4 @@ Description:
 				inaccessible.
 				Reading this file will get a list of
 				supported actions.
+		=============== ===============================================
diff --git a/Documentation/ABI/stable/sysfs-firmware-opal-elog b/Documentation/ABI/stable/sysfs-firmware-opal-elog
index 2536434d49d0..7c8a61a2d005 100644
--- a/Documentation/ABI/stable/sysfs-firmware-opal-elog
+++ b/Documentation/ABI/stable/sysfs-firmware-opal-elog
@@ -38,6 +38,7 @@ Description:
 		For each log entry (directory), there are the following
 		files:
 
+		==============  ================================================
 		id:		An ASCII representation of the ID of the
 				error log, in hex - e.g. "0x01".
 
@@ -58,3 +59,4 @@ Description:
 				entry will be removed from sysfs.
 				Reading this file will list the supported
 				operations (currently just acknowledge).
+		==============  ================================================
diff --git a/Documentation/ABI/stable/sysfs-hypervisor-xen b/Documentation/ABI/stable/sysfs-hypervisor-xen
index 3cf5cdfcd9a8..748593c64568 100644
--- a/Documentation/ABI/stable/sysfs-hypervisor-xen
+++ b/Documentation/ABI/stable/sysfs-hypervisor-xen
@@ -33,6 +33,8 @@ Description:	If running under Xen:
 		Space separated list of supported guest system types. Each type
 		is in the format: <class>-<major>.<minor>-<arch>
 		With:
+
+			======== ============================================
 			<class>: "xen" -- x86: paravirtualized, arm: standard
 				 "hvm" -- x86 only: fully virtualized
 			<major>: major guest interface version
@@ -43,6 +45,7 @@ Description:	If running under Xen:
 				 "x86_64": 64 bit x86 guest
 				 "armv7l": 32 bit arm guest
 				 "aarch64": 64 bit arm guest
+			======== ============================================
 
 What:		/sys/hypervisor/properties/changeset
 Date:		March 2009
diff --git a/Documentation/ABI/stable/vdso b/Documentation/ABI/stable/vdso
index 55406ec8a35a..73ed1240a5c0 100644
--- a/Documentation/ABI/stable/vdso
+++ b/Documentation/ABI/stable/vdso
@@ -23,6 +23,7 @@ Unless otherwise noted, the set of symbols with any given version and the
 ABI of those symbols is considered stable.  It may vary across architectures,
 though.
 
-(As of this writing, this ABI documentation as been confirmed for x86_64.
+Note:
+ As of this writing, this ABI documentation as been confirmed for x86_64.
  The maintainers of the other vDSO-using architectures should confirm
- that it is correct for their architecture.)
+ that it is correct for their architecture.
diff --git a/Documentation/admin-guide/abi-stable.rst b/Documentation/admin-guide/abi-stable.rst
index 7495d7a35048..70490736e0d3 100644
--- a/Documentation/admin-guide/abi-stable.rst
+++ b/Documentation/admin-guide/abi-stable.rst
@@ -11,3 +11,4 @@ Most interfaces (like syscalls) are expected to never change and always
 be available.
 
 .. kernel-abi:: $srctree/Documentation/ABI/stable
+   :rst:
-- 
2.21.0

