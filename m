Return-Path: <linuxppc-dev+bounces-6930-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA52A5D8A9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Mar 2025 09:53:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZCPXv21RKz3bvW;
	Wed, 12 Mar 2025 19:53:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741769583;
	cv=none; b=dp4BWNknADUgJbpc8XYQNA+DBmUVEP2MSb7b82TNE/lYdNODeCOgXm5iWPnBwcWrRexowb4qj/dJ0uJ5642w2/i4K8tuqdAGa90tqJT/jSJ5Twf7KE2d+AgK2tbGBRo+f7UNBUHaLU9LbEftJraDRaxcEaw25SAJAFBwaR1QscXecacnByBQUuRD+JFcixaeke7riuhfZ8JtMXvmjTrZlpnocMfgabgAAYTnu3GVTlA/qW7lu2eZ+65lBdJGhqNHXPgtr1i5Td1mpwsJet0U59cyM/lbjsDwiYuK7Qld+Wwz8kmw2qMJQDez5WaC6LwzJAccbWjtoBg7WInu1hMaTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741769583; c=relaxed/relaxed;
	bh=IzlkiB3hkkmniXUAFmUYzMFlZc9R1k/hKfSe408pAKw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FtLmnweqZUERrKeHi8YGkaRmb9OlO/gfVhRYA4IxBsp9cr8MsLGv+VAL5U7qgvvk8mPrVMRKisJnBX8Y9+WULtWDfcCevm9H0Zi071ybBegprJrGFyZUXLcftCQCNXQTjotob9TVmHovHfNR7EQcHoe4LZjrYBX2S4ZIAWAgZGyJU2tonUAJ8R4zSs6mwF5AL7fHZQ4J01dozo09jOV8Mnugi+P7rWzkAOOXwx5MHokDcd0xUR/Q2vTbFPn4LkvlSg3Ed7UZUbTQ154kt5L07ftZjSGVv/fBnxFkid6SvBCt1cdpXXL6eKGRMG3fCSZ0KmhBh7Pls6yYKBAvaVTCyA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XVll58nx; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=arnd@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XVll58nx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=arnd@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZCPXs0t3Fz30Vj
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Mar 2025 19:53:01 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D84A95C02D6;
	Wed, 12 Mar 2025 08:50:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BF88C4CEE3;
	Wed, 12 Mar 2025 08:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741769578;
	bh=VKn/QddO2U6b+BFotkyYzqLDobvayR/ScBxFMZqD1Wc=;
	h=From:To:Cc:Subject:Date:From;
	b=XVll58nxdIOoI9kKeaVCZoHWxQuloy8xCr9S6HJOag58ltz9Y0EFiGJVVmKd69P8m
	 Q6wweFRSPbeWOQg59fel16PIXThoKY2/n/z6hlfdgmK3pysJM4Ab9JPlRux0/1o11K
	 NtzqP4LAhbqgRq+wpLZkMvfZpgrdaUpADNOE5kNtIqBI1EXM31CKk47qNTjni6zKVx
	 HyyrqYXGBprojTEKkfhS1URDh1RWBg4mY0iUP2mbPBmC3qjWvhSigl7vWNo0ydiKmp
	 m30GxAB9pHgedvSLGMIV8FL7az9v0OwYVq13VOpqj5vOn1ldfpcC5WrCDCllZG7GDX
	 vTh4ZCWd+dOAw==
From: Arnd Bergmann <arnd@kernel.org>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	netdev@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-acpi@vger.kernel.org
Subject: [PATCH] net: remove sb1000 cable modem driver
Date: Wed, 12 Mar 2025 09:51:19 +0100
Message-Id: <20250312085236.2531870-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,URIBL_SBL_A autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Arnd Bergmann <arnd@arndb.de>

This one is hilariously outdated, it provided a faster downlink over
TV cable for users of analog modems in the 1990s, through an ISA card.

The web page for the userspace tools has been broken for 25 years, and
the driver has only ever seen mechanical updates.

Link: http://web.archive.org/web/20000611165545/http://home.adelphia.net:80/~siglercm/sb1000.html
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 .../networking/device_drivers/cable/index.rst |   18 -
 .../device_drivers/cable/sb1000.rst           |  222 ----
 .../networking/device_drivers/index.rst       |    1 -
 arch/powerpc/configs/ppc6xx_defconfig         |    1 -
 drivers/acpi/acpi_pnp.c                       |    2 -
 drivers/net/Kconfig                           |   24 -
 drivers/net/Makefile                          |    1 -
 drivers/net/sb1000.c                          | 1179 -----------------
 include/uapi/linux/if_cablemodem.h            |   23 -
 9 files changed, 1471 deletions(-)
 delete mode 100644 Documentation/networking/device_drivers/cable/index.rst
 delete mode 100644 Documentation/networking/device_drivers/cable/sb1000.rst
 delete mode 100644 drivers/net/sb1000.c
 delete mode 100644 include/uapi/linux/if_cablemodem.h

diff --git a/Documentation/networking/device_drivers/cable/index.rst b/Documentation/networking/device_drivers/cable/index.rst
deleted file mode 100644
index cce3c4392972..000000000000
--- a/Documentation/networking/device_drivers/cable/index.rst
+++ /dev/null
@@ -1,18 +0,0 @@
-.. SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-
-Cable Modem Device Drivers
-==========================
-
-Contents:
-
-.. toctree::
-   :maxdepth: 2
-
-   sb1000
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/networking/device_drivers/cable/sb1000.rst b/Documentation/networking/device_drivers/cable/sb1000.rst
deleted file mode 100644
index c8582ca4034d..000000000000
--- a/Documentation/networking/device_drivers/cable/sb1000.rst
+++ /dev/null
@@ -1,222 +0,0 @@
-.. SPDX-License-Identifier: GPL-2.0
-
-===================
-SB100 device driver
-===================
-
-sb1000 is a module network device driver for the General Instrument (also known
-as NextLevel) SURFboard1000 internal cable modem board.  This is an ISA card
-which is used by a number of cable TV companies to provide cable modem access.
-It's a one-way downstream-only cable modem, meaning that your upstream net link
-is provided by your regular phone modem.
-
-This driver was written by Franco Venturi <fventuri@mediaone.net>.  He deserves
-a great deal of thanks for this wonderful piece of code!
-
-Needed tools
-============
-
-Support for this device is now a part of the standard Linux kernel.  The
-driver source code file is drivers/net/sb1000.c.  In addition to this
-you will need:
-
-1. The "cmconfig" program.  This is a utility which supplements "ifconfig"
-   to configure the cable modem and network interface (usually called "cm0");
-
-2. Several PPP scripts which live in /etc/ppp to make connecting via your
-   cable modem easy.
-
-   These utilities can be obtained from:
-
-      http://www.jacksonville.net/~fventuri/
-
-   in Franco's original source code distribution .tar.gz file.  Support for
-   the sb1000 driver can be found at:
-
-      - http://web.archive.org/web/%2E/http://home.adelphia.net/~siglercm/sb1000.html
-      - http://web.archive.org/web/%2E/http://linuxpower.cx/~cable/
-
-   along with these utilities.
-
-3. The standard isapnp tools.  These are necessary to configure your SB1000
-   card at boot time (or afterwards by hand) since it's a PnP card.
-
-   If you don't have these installed as a standard part of your Linux
-   distribution, you can find them at:
-
-      http://www.roestock.demon.co.uk/isapnptools/
-
-   or check your Linux distribution binary CD or their web site.  For help with
-   isapnp, pnpdump, or /etc/isapnp.conf, go to:
-
-      http://www.roestock.demon.co.uk/isapnptools/isapnpfaq.html
-
-Using the driver
-================
-
-To make the SB1000 card work, follow these steps:
-
-1. Run ``make config``, or ``make menuconfig``, or ``make xconfig``, whichever
-   you prefer, in the top kernel tree directory to set up your kernel
-   configuration.  Make sure to say "Y" to "Prompt for development drivers"
-   and to say "M" to the sb1000 driver.  Also say "Y" or "M" to all the standard
-   networking questions to get TCP/IP and PPP networking support.
-
-2. **BEFORE** you build the kernel, edit drivers/net/sb1000.c.  Make sure
-   to redefine the value of READ_DATA_PORT to match the I/O address used
-   by isapnp to access your PnP cards.  This is the value of READPORT in
-   /etc/isapnp.conf or given by the output of pnpdump.
-
-3. Build and install the kernel and modules as usual.
-
-4. Boot your new kernel following the usual procedures.
-
-5. Set up to configure the new SB1000 PnP card by capturing the output
-   of "pnpdump" to a file and editing this file to set the correct I/O ports,
-   IRQ, and DMA settings for all your PnP cards.  Make sure none of the settings
-   conflict with one another.  Then test this configuration by running the
-   "isapnp" command with your new config file as the input.  Check for
-   errors and fix as necessary.  (As an aside, I use I/O ports 0x110 and
-   0x310 and IRQ 11 for my SB1000 card and these work well for me.  YMMV.)
-   Then save the finished config file as /etc/isapnp.conf for proper
-   configuration on subsequent reboots.
-
-6. Download the original file sb1000-1.1.2.tar.gz from Franco's site or one of
-   the others referenced above.  As root, unpack it into a temporary directory
-   and do a ``make cmconfig`` and then ``install -c cmconfig /usr/local/sbin``.
-   Don't do ``make install`` because it expects to find all the utilities built
-   and ready for installation, not just cmconfig.
-
-7. As root, copy all the files under the ppp/ subdirectory in Franco's
-   tar file into /etc/ppp, being careful not to overwrite any files that are
-   already in there.  Then modify ppp@gi-on to set the correct login name,
-   phone number, and frequency for the cable modem.  Also edit pap-secrets
-   to specify your login name and password and any site-specific information
-   you need.
-
-8. Be sure to modify /etc/ppp/firewall to use ipchains instead of
-   the older ipfwadm commands from the 2.0.x kernels.  There's a neat utility to
-   convert ipfwadm commands to ipchains commands:
-
-	http://users.dhp.com/~whisper/ipfwadm2ipchains/
-
-   You may also wish to modify the firewall script to implement a different
-   firewalling scheme.
-
-9. Start the PPP connection via the script /etc/ppp/ppp@gi-on.  You must be
-   root to do this.  It's better to use a utility like sudo to execute
-   frequently used commands like this with root permissions if possible.  If you
-   connect successfully the cable modem interface will come up and you'll see a
-   driver message like this at the console::
-
-	 cm0: sb1000 at (0x110,0x310), csn 1, S/N 0x2a0d16d8, IRQ 11.
-	 sb1000.c:v1.1.2 6/01/98 (fventuri@mediaone.net)
-
-   The "ifconfig" command should show two new interfaces, ppp0 and cm0.
-
-   The command "cmconfig cm0" will give you information about the cable modem
-   interface.
-
-10. Try pinging a site via ``ping -c 5 www.yahoo.com``, for example.  You should
-    see packets received.
-
-11. If you can't get site names (like www.yahoo.com) to resolve into
-    IP addresses (like 204.71.200.67), be sure your /etc/resolv.conf file
-    has no syntax errors and has the right nameserver IP addresses in it.
-    If this doesn't help, try something like ``ping -c 5 204.71.200.67`` to
-    see if the networking is running but the DNS resolution is where the
-    problem lies.
-
-12. If you still have problems, go to the support web sites mentioned above
-    and read the information and documentation there.
-
-Common problems
-===============
-
-1. Packets go out on the ppp0 interface but don't come back on the cm0
-   interface.  It looks like I'm connected but I can't even ping any
-   numerical IP addresses.  (This happens predominantly on Debian systems due
-   to a default boot-time configuration script.)
-
-Solution
-   As root ``echo 0 > /proc/sys/net/ipv4/conf/cm0/rp_filter`` so it
-   can share the same IP address as the ppp0 interface.  Note that this
-   command should probably be added to the /etc/ppp/cablemodem script
-   *right*between* the "/sbin/ifconfig" and "/sbin/cmconfig" commands.
-   You may need to do this to /proc/sys/net/ipv4/conf/ppp0/rp_filter as well.
-   If you do this to /proc/sys/net/ipv4/conf/default/rp_filter on each reboot
-   (in rc.local or some such) then any interfaces can share the same IP
-   addresses.
-
-2. I get "unresolved symbol" error messages on executing ``insmod sb1000.o``.
-
-Solution
-   You probably have a non-matching kernel source tree and
-   /usr/include/linux and /usr/include/asm header files.  Make sure you
-   install the correct versions of the header files in these two directories.
-   Then rebuild and reinstall the kernel.
-
-3. When isapnp runs it reports an error, and my SB1000 card isn't working.
-
-Solution
-   There's a problem with later versions of isapnp using the "(CHECK)"
-   option in the lines that allocate the two I/O addresses for the SB1000 card.
-   This first popped up on RH 6.0.  Delete "(CHECK)" for the SB1000 I/O addresses.
-   Make sure they don't conflict with any other pieces of hardware first!  Then
-   rerun isapnp and go from there.
-
-4. I can't execute the /etc/ppp/ppp@gi-on file.
-
-Solution
-   As root do ``chmod ug+x /etc/ppp/ppp@gi-on``.
-
-5. The firewall script isn't working (with 2.2.x and higher kernels).
-
-Solution
-   Use the ipfwadm2ipchains script referenced above to convert the
-   /etc/ppp/firewall script from the deprecated ipfwadm commands to ipchains.
-
-6. I'm getting *tons* of firewall deny messages in the /var/kern.log,
-   /var/messages, and/or /var/syslog files, and they're filling up my /var
-   partition!!!
-
-Solution
-   First, tell your ISP that you're receiving DoS (Denial of Service)
-   and/or portscanning (UDP connection attempts) attacks!  Look over the deny
-   messages to figure out what the attack is and where it's coming from.  Next,
-   edit /etc/ppp/cablemodem and make sure the ",nobroadcast" option is turned on
-   to the "cmconfig" command (uncomment that line).  If you're not receiving these
-   denied packets on your broadcast interface (IP address xxx.yyy.zzz.255
-   typically), then someone is attacking your machine in particular.  Be careful
-   out there....
-
-7. Everything seems to work fine but my computer locks up after a while
-   (and typically during a lengthy download through the cable modem)!
-
-Solution
-   You may need to add a short delay in the driver to 'slow down' the
-   SURFboard because your PC might not be able to keep up with the transfer rate
-   of the SB1000. To do this, it's probably best to download Franco's
-   sb1000-1.1.2.tar.gz archive and build and install sb1000.o manually.  You'll
-   want to edit the 'Makefile' and look for the 'SB1000_DELAY'
-   define.  Uncomment those 'CFLAGS' lines (and comment out the default ones)
-   and try setting the delay to something like 60 microseconds with:
-   '-DSB1000_DELAY=60'.  Then do ``make`` and as root ``make install`` and try
-   it out.  If it still doesn't work or you like playing with the driver, you may
-   try other numbers.  Remember though that the higher the delay, the slower the
-   driver (which slows down the rest of the PC too when it is actively
-   used). Thanks to Ed Daiga for this tip!
-
-Credits
-=======
-
-This README came from Franco Venturi's original README file which is
-still supplied with his driver .tar.gz archive.  I and all other sb1000 users
-owe Franco a tremendous "Thank you!"  Additional thanks goes to Carl Patten
-and Ralph Bonnell who are now managing the Linux SB1000 web site, and to
-the SB1000 users who reported and helped debug the common problems listed
-above.
-
-
-					Clemmitt Sigler
-					csigler@vt.edu
diff --git a/Documentation/networking/device_drivers/index.rst b/Documentation/networking/device_drivers/index.rst
index 0dd30a84ce25..a254af25b7ef 100644
--- a/Documentation/networking/device_drivers/index.rst
+++ b/Documentation/networking/device_drivers/index.rst
@@ -9,7 +9,6 @@ Contents:
    :maxdepth: 2
 
    atm/index
-   cable/index
    can/index
    cellular/index
    ethernet/index
diff --git a/arch/powerpc/configs/ppc6xx_defconfig b/arch/powerpc/configs/ppc6xx_defconfig
index 364d1a78bc12..a91a766b71a4 100644
--- a/arch/powerpc/configs/ppc6xx_defconfig
+++ b/arch/powerpc/configs/ppc6xx_defconfig
@@ -485,7 +485,6 @@ CONFIG_VIA_VELOCITY=m
 CONFIG_PCMCIA_XIRC2PS=m
 CONFIG_FDDI=y
 CONFIG_SKFP=m
-CONFIG_NET_SB1000=m
 CONFIG_BROADCOM_PHY=m
 CONFIG_CICADA_PHY=m
 CONFIG_DAVICOM_PHY=m
diff --git a/drivers/acpi/acpi_pnp.c b/drivers/acpi/acpi_pnp.c
index 01abf26764b0..435ec60a9682 100644
--- a/drivers/acpi/acpi_pnp.c
+++ b/drivers/acpi/acpi_pnp.c
@@ -120,8 +120,6 @@ static const struct acpi_device_id acpi_pnp_device_ids[] = {
 	{"IBM0071"},
 	/* smsc-ircc2 */
 	{"SMCf010"},
-	/* sb1000 */
-	{"GIC1000"},
 	/* parport_pc */
 	{"PNP0400"},		/* Standard LPT Printer Port */
 	{"PNP0401"},		/* ECP Printer Port */
diff --git a/drivers/net/Kconfig b/drivers/net/Kconfig
index 1fd5acdc73c6..271520510b5f 100644
--- a/drivers/net/Kconfig
+++ b/drivers/net/Kconfig
@@ -518,30 +518,6 @@ source "drivers/net/hippi/Kconfig"
 
 source "drivers/net/ipa/Kconfig"
 
-config NET_SB1000
-	tristate "General Instruments Surfboard 1000"
-	depends on ISA && PNP
-	help
-	  This is a driver for the General Instrument (also known as
-	  NextLevel) SURFboard 1000 internal
-	  cable modem. This is an ISA card which is used by a number of cable
-	  TV companies to provide cable modem access. It's a one-way
-	  downstream-only cable modem, meaning that your upstream net link is
-	  provided by your regular phone modem.
-
-	  At present this driver only compiles as a module, so say M here if
-	  you have this card. The module will be called sb1000. Then read
-	  <file:Documentation/networking/device_drivers/cable/sb1000.rst> for
-	  information on how to use this module, as it needs special ppp
-	  scripts for establishing a connection. Further documentation
-	  and the necessary scripts can be found at:
-
-	  <http://www.jacksonville.net/~fventuri/>
-	  <http://home.adelphia.net/~siglercm/sb1000.html>
-	  <http://linuxpower.cx/~cable/>
-
-	  If you don't have this card, of course say N.
-
 source "drivers/net/phy/Kconfig"
 
 source "drivers/net/pse-pd/Kconfig"
diff --git a/drivers/net/Makefile b/drivers/net/Makefile
index 13743d0e83b5..75333251a01a 100644
--- a/drivers/net/Makefile
+++ b/drivers/net/Makefile
@@ -69,7 +69,6 @@ obj-$(CONFIG_PPPOL2TP) += ppp/
 obj-$(CONFIG_PPTP) += ppp/
 obj-$(CONFIG_SLIP) += slip/
 obj-$(CONFIG_SLHC) += slip/
-obj-$(CONFIG_NET_SB1000) += sb1000.o
 obj-$(CONFIG_SUNGEM_PHY) += sungem_phy.o
 obj-$(CONFIG_WAN) += wan/
 obj-$(CONFIG_WLAN) += wireless/
diff --git a/drivers/net/sb1000.c b/drivers/net/sb1000.c
deleted file mode 100644
index c3f8020571ad..000000000000
--- a/drivers/net/sb1000.c
+++ /dev/null
@@ -1,1179 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/* sb1000.c: A General Instruments SB1000 driver for linux. */
-/*
-	Written 1998 by Franco Venturi.
-
-	Copyright 1998 by Franco Venturi.
-	Copyright 1994,1995 by Donald Becker.
-	Copyright 1993 United States Government as represented by the
-	Director, National Security Agency.
-
-	This driver is for the General Instruments SB1000 (internal SURFboard)
-
-	The author may be reached as fventuri@mediaone.net
-
-
-	Changes:
-
-	981115 Steven Hirsch <shirsch@adelphia.net>
-
-	Linus changed the timer interface.  Should work on all recent
-	development kernels.
-
-	980608 Steven Hirsch <shirsch@adelphia.net>
-
-	Small changes to make it work with 2.1.x kernels. Hopefully,
-	nothing major will change before official release of Linux 2.2.
-
-	Merged with 2.2 - Alan Cox
-*/
-
-static char version[] = "sb1000.c:v1.1.2 6/01/98 (fventuri@mediaone.net)\n";
-
-#include <linux/module.h>
-#include <linux/kernel.h>
-#include <linux/sched.h>
-#include <linux/string.h>
-#include <linux/interrupt.h>
-#include <linux/errno.h>
-#include <linux/if_cablemodem.h> /* for SIOGCM/SIOSCM stuff */
-#include <linux/in.h>
-#include <linux/ioport.h>
-#include <linux/netdevice.h>
-#include <linux/if_arp.h>
-#include <linux/skbuff.h>
-#include <linux/delay.h>	/* for udelay() */
-#include <linux/etherdevice.h>
-#include <linux/pnp.h>
-#include <linux/init.h>
-#include <linux/bitops.h>
-#include <linux/gfp.h>
-
-#include <asm/io.h>
-#include <asm/processor.h>
-#include <linux/uaccess.h>
-
-#ifdef SB1000_DEBUG
-static int sb1000_debug = SB1000_DEBUG;
-#else
-static const int sb1000_debug = 1;
-#endif
-
-static const int SB1000_IO_EXTENT = 8;
-/* SB1000 Maximum Receive Unit */
-static const int SB1000_MRU = 1500; /* octects */
-
-#define NPIDS 4
-struct sb1000_private {
-	struct sk_buff *rx_skb[NPIDS];
-	short rx_dlen[NPIDS];
-	unsigned int rx_frames;
-	short rx_error_count;
-	short rx_error_dpc_count;
-	unsigned char rx_session_id[NPIDS];
-	unsigned char rx_frame_id[NPIDS];
-	unsigned char rx_pkt_type[NPIDS];
-};
-
-/* prototypes for Linux interface */
-extern int sb1000_probe(struct net_device *dev);
-static int sb1000_open(struct net_device *dev);
-static int sb1000_siocdevprivate(struct net_device *dev, struct ifreq *ifr,
-				 void __user *data, int cmd);
-static netdev_tx_t sb1000_start_xmit(struct sk_buff *skb,
-				     struct net_device *dev);
-static irqreturn_t sb1000_interrupt(int irq, void *dev_id);
-static int sb1000_close(struct net_device *dev);
-
-
-/* SB1000 hardware routines to be used during open/configuration phases */
-static int card_wait_for_busy_clear(const int ioaddr[],
-	const char* name);
-static int card_wait_for_ready(const int ioaddr[], const char* name,
-	unsigned char in[]);
-static int card_send_command(const int ioaddr[], const char* name,
-	const unsigned char out[], unsigned char in[]);
-
-/* SB1000 hardware routines to be used during frame rx interrupt */
-static int sb1000_wait_for_ready(const int ioaddr[], const char* name);
-static int sb1000_wait_for_ready_clear(const int ioaddr[],
-	const char* name);
-static void sb1000_send_command(const int ioaddr[], const char* name,
-	const unsigned char out[]);
-static void sb1000_read_status(const int ioaddr[], unsigned char in[]);
-static void sb1000_issue_read_command(const int ioaddr[],
-	const char* name);
-
-/* SB1000 commands for open/configuration */
-static int sb1000_reset(const int ioaddr[], const char* name);
-static int sb1000_check_CRC(const int ioaddr[], const char* name);
-static inline int sb1000_start_get_set_command(const int ioaddr[],
-	const char* name);
-static int sb1000_end_get_set_command(const int ioaddr[],
-	const char* name);
-static int sb1000_activate(const int ioaddr[], const char* name);
-static int sb1000_get_firmware_version(const int ioaddr[],
-	const char* name, unsigned char version[], int do_end);
-static int sb1000_get_frequency(const int ioaddr[], const char* name,
-	int* frequency);
-static int sb1000_set_frequency(const int ioaddr[], const char* name,
-	int frequency);
-static int sb1000_get_PIDs(const int ioaddr[], const char* name,
-	short PID[]);
-static int sb1000_set_PIDs(const int ioaddr[], const char* name,
-	const short PID[]);
-
-/* SB1000 commands for frame rx interrupt */
-static int sb1000_rx(struct net_device *dev);
-static void sb1000_error_dpc(struct net_device *dev);
-
-static const struct pnp_device_id sb1000_pnp_ids[] = {
-	{ "GIC1000", 0 },
-	{ "", 0 }
-};
-MODULE_DEVICE_TABLE(pnp, sb1000_pnp_ids);
-
-static const struct net_device_ops sb1000_netdev_ops = {
-	.ndo_open		= sb1000_open,
-	.ndo_start_xmit		= sb1000_start_xmit,
-	.ndo_siocdevprivate	= sb1000_siocdevprivate,
-	.ndo_stop		= sb1000_close,
-	.ndo_set_mac_address 	= eth_mac_addr,
-	.ndo_validate_addr	= eth_validate_addr,
-};
-
-static int
-sb1000_probe_one(struct pnp_dev *pdev, const struct pnp_device_id *id)
-{
-	struct net_device *dev;
-	unsigned short ioaddr[2], irq;
-	unsigned int serial_number;
-	int error = -ENODEV;
-	u8 addr[ETH_ALEN];
-
-	if (pnp_device_attach(pdev) < 0)
-		return -ENODEV;
-	if (pnp_activate_dev(pdev) < 0)
-		goto out_detach;
-
-	if (!pnp_port_valid(pdev, 0) || !pnp_port_valid(pdev, 1))
-		goto out_disable;
-	if (!pnp_irq_valid(pdev, 0))
-		goto out_disable;
-
-	serial_number = pdev->card->serial;
-
-	ioaddr[0] = pnp_port_start(pdev, 0);
-	ioaddr[1] = pnp_port_start(pdev, 0);
-
-	irq = pnp_irq(pdev, 0);
-
-	if (!request_region(ioaddr[0], 16, "sb1000"))
-		goto out_disable;
-	if (!request_region(ioaddr[1], 16, "sb1000"))
-		goto out_release_region0;
-
-	dev = alloc_etherdev(sizeof(struct sb1000_private));
-	if (!dev) {
-		error = -ENOMEM;
-		goto out_release_regions;
-	}
-
-
-	dev->base_addr = ioaddr[0];
-	/* mem_start holds the second I/O address */
-	dev->mem_start = ioaddr[1];
-	dev->irq = irq;
-
-	if (sb1000_debug > 0)
-		printk(KERN_NOTICE "%s: sb1000 at (%#3.3lx,%#3.3lx), "
-			"S/N %#8.8x, IRQ %d.\n", dev->name, dev->base_addr,
-			dev->mem_start, serial_number, dev->irq);
-
-	/*
-	 * The SB1000 is an rx-only cable modem device.  The uplink is a modem
-	 * and we do not want to arp on it.
-	 */
-	dev->flags = IFF_POINTOPOINT|IFF_NOARP;
-
-	SET_NETDEV_DEV(dev, &pdev->dev);
-
-	if (sb1000_debug > 0)
-		printk(KERN_NOTICE "%s", version);
-
-	dev->netdev_ops	= &sb1000_netdev_ops;
-
-	/* hardware address is 0:0:serial_number */
-	addr[0] = 0;
-	addr[1] = 0;
-	addr[2]	= serial_number >> 24 & 0xff;
-	addr[3]	= serial_number >> 16 & 0xff;
-	addr[4]	= serial_number >>  8 & 0xff;
-	addr[5]	= serial_number >>  0 & 0xff;
-	eth_hw_addr_set(dev, addr);
-
-	pnp_set_drvdata(pdev, dev);
-
-	error = register_netdev(dev);
-	if (error)
-		goto out_free_netdev;
-	return 0;
-
- out_free_netdev:
-	free_netdev(dev);
- out_release_regions:
-	release_region(ioaddr[1], 16);
- out_release_region0:
-	release_region(ioaddr[0], 16);
- out_disable:
-	pnp_disable_dev(pdev);
- out_detach:
-	pnp_device_detach(pdev);
-	return error;
-}
-
-static void
-sb1000_remove_one(struct pnp_dev *pdev)
-{
-	struct net_device *dev = pnp_get_drvdata(pdev);
-
-	unregister_netdev(dev);
-	release_region(dev->base_addr, 16);
-	release_region(dev->mem_start, 16);
-	free_netdev(dev);
-}
-
-static struct pnp_driver sb1000_driver = {
-	.name		= "sb1000",
-	.id_table	= sb1000_pnp_ids,
-	.probe		= sb1000_probe_one,
-	.remove		= sb1000_remove_one,
-};
-
-
-/*
- * SB1000 hardware routines to be used during open/configuration phases
- */
-
-static const int TimeOutJiffies = (875 * HZ) / 100;
-
-/* Card Wait For Busy Clear (cannot be used during an interrupt) */
-static int
-card_wait_for_busy_clear(const int ioaddr[], const char* name)
-{
-	unsigned char a;
-	unsigned long timeout;
-
-	a = inb(ioaddr[0] + 7);
-	timeout = jiffies + TimeOutJiffies;
-	while (a & 0x80 || a & 0x40) {
-		/* a little sleep */
-		yield();
-
-		a = inb(ioaddr[0] + 7);
-		if (time_after_eq(jiffies, timeout)) {
-			printk(KERN_WARNING "%s: card_wait_for_busy_clear timeout\n",
-				name);
-			return -ETIME;
-		}
-	}
-
-	return 0;
-}
-
-/* Card Wait For Ready (cannot be used during an interrupt) */
-static int
-card_wait_for_ready(const int ioaddr[], const char* name, unsigned char in[])
-{
-	unsigned char a;
-	unsigned long timeout;
-
-	a = inb(ioaddr[1] + 6);
-	timeout = jiffies + TimeOutJiffies;
-	while (a & 0x80 || !(a & 0x40)) {
-		/* a little sleep */
-		yield();
-
-		a = inb(ioaddr[1] + 6);
-		if (time_after_eq(jiffies, timeout)) {
-			printk(KERN_WARNING "%s: card_wait_for_ready timeout\n",
-				name);
-			return -ETIME;
-		}
-	}
-
-	in[1] = inb(ioaddr[0] + 1);
-	in[2] = inb(ioaddr[0] + 2);
-	in[3] = inb(ioaddr[0] + 3);
-	in[4] = inb(ioaddr[0] + 4);
-	in[0] = inb(ioaddr[0] + 5);
-	in[6] = inb(ioaddr[0] + 6);
-	in[5] = inb(ioaddr[1] + 6);
-	return 0;
-}
-
-/* Card Send Command (cannot be used during an interrupt) */
-static int
-card_send_command(const int ioaddr[], const char* name,
-	const unsigned char out[], unsigned char in[])
-{
-	int status;
-
-	if ((status = card_wait_for_busy_clear(ioaddr, name)))
-		return status;
-	outb(0xa0, ioaddr[0] + 6);
-	outb(out[2], ioaddr[0] + 1);
-	outb(out[3], ioaddr[0] + 2);
-	outb(out[4], ioaddr[0] + 3);
-	outb(out[5], ioaddr[0] + 4);
-	outb(out[1], ioaddr[0] + 5);
-	outb(0xa0, ioaddr[0] + 6);
-	outb(out[0], ioaddr[0] + 7);
-	if (out[0] != 0x20 && out[0] != 0x30) {
-		if ((status = card_wait_for_ready(ioaddr, name, in)))
-			return status;
-		inb(ioaddr[0] + 7);
-		if (sb1000_debug > 3)
-			printk(KERN_DEBUG "%s: card_send_command "
-				"out: %02x%02x%02x%02x%02x%02x  "
-				"in: %02x%02x%02x%02x%02x%02x%02x\n", name,
-				out[0], out[1], out[2], out[3], out[4], out[5],
-				in[0], in[1], in[2], in[3], in[4], in[5], in[6]);
-	} else {
-		if (sb1000_debug > 3)
-			printk(KERN_DEBUG "%s: card_send_command "
-				"out: %02x%02x%02x%02x%02x%02x\n", name,
-				out[0], out[1], out[2], out[3], out[4], out[5]);
-	}
-
-	if (out[1] != 0x1b) {
-		if (out[0] >= 0x80 && in[0] != (out[1] | 0x80))
-			return -EIO;
-	}
-	return 0;
-}
-
-
-/*
- * SB1000 hardware routines to be used during frame rx interrupt
- */
-static const int Sb1000TimeOutJiffies = 7 * HZ;
-
-/* Card Wait For Ready (to be used during frame rx) */
-static int
-sb1000_wait_for_ready(const int ioaddr[], const char* name)
-{
-	unsigned long timeout;
-
-	timeout = jiffies + Sb1000TimeOutJiffies;
-	while (inb(ioaddr[1] + 6) & 0x80) {
-		if (time_after_eq(jiffies, timeout)) {
-			printk(KERN_WARNING "%s: sb1000_wait_for_ready timeout\n",
-				name);
-			return -ETIME;
-		}
-	}
-	timeout = jiffies + Sb1000TimeOutJiffies;
-	while (!(inb(ioaddr[1] + 6) & 0x40)) {
-		if (time_after_eq(jiffies, timeout)) {
-			printk(KERN_WARNING "%s: sb1000_wait_for_ready timeout\n",
-				name);
-			return -ETIME;
-		}
-	}
-	inb(ioaddr[0] + 7);
-	return 0;
-}
-
-/* Card Wait For Ready Clear (to be used during frame rx) */
-static int
-sb1000_wait_for_ready_clear(const int ioaddr[], const char* name)
-{
-	unsigned long timeout;
-
-	timeout = jiffies + Sb1000TimeOutJiffies;
-	while (inb(ioaddr[1] + 6) & 0x80) {
-		if (time_after_eq(jiffies, timeout)) {
-			printk(KERN_WARNING "%s: sb1000_wait_for_ready_clear timeout\n",
-				name);
-			return -ETIME;
-		}
-	}
-	timeout = jiffies + Sb1000TimeOutJiffies;
-	while (inb(ioaddr[1] + 6) & 0x40) {
-		if (time_after_eq(jiffies, timeout)) {
-			printk(KERN_WARNING "%s: sb1000_wait_for_ready_clear timeout\n",
-				name);
-			return -ETIME;
-		}
-	}
-	return 0;
-}
-
-/* Card Send Command (to be used during frame rx) */
-static void
-sb1000_send_command(const int ioaddr[], const char* name,
-	const unsigned char out[])
-{
-	outb(out[2], ioaddr[0] + 1);
-	outb(out[3], ioaddr[0] + 2);
-	outb(out[4], ioaddr[0] + 3);
-	outb(out[5], ioaddr[0] + 4);
-	outb(out[1], ioaddr[0] + 5);
-	outb(out[0], ioaddr[0] + 7);
-	if (sb1000_debug > 3)
-		printk(KERN_DEBUG "%s: sb1000_send_command out: %02x%02x%02x%02x"
-			"%02x%02x\n", name, out[0], out[1], out[2], out[3], out[4], out[5]);
-}
-
-/* Card Read Status (to be used during frame rx) */
-static void
-sb1000_read_status(const int ioaddr[], unsigned char in[])
-{
-	in[1] = inb(ioaddr[0] + 1);
-	in[2] = inb(ioaddr[0] + 2);
-	in[3] = inb(ioaddr[0] + 3);
-	in[4] = inb(ioaddr[0] + 4);
-	in[0] = inb(ioaddr[0] + 5);
-}
-
-/* Issue Read Command (to be used during frame rx) */
-static void
-sb1000_issue_read_command(const int ioaddr[], const char* name)
-{
-	static const unsigned char Command0[6] = {0x20, 0x00, 0x00, 0x01, 0x00, 0x00};
-
-	sb1000_wait_for_ready_clear(ioaddr, name);
-	outb(0xa0, ioaddr[0] + 6);
-	sb1000_send_command(ioaddr, name, Command0);
-}
-
-
-/*
- * SB1000 commands for open/configuration
- */
-/* reset SB1000 card */
-static int
-sb1000_reset(const int ioaddr[], const char* name)
-{
-	static const unsigned char Command0[6] = {0x80, 0x16, 0x00, 0x00, 0x00, 0x00};
-
-	unsigned char st[7];
-	int port, status;
-
-	port = ioaddr[1] + 6;
-	outb(0x4, port);
-	inb(port);
-	udelay(1000);
-	outb(0x0, port);
-	inb(port);
-	ssleep(1);
-	outb(0x4, port);
-	inb(port);
-	udelay(1000);
-	outb(0x0, port);
-	inb(port);
-	udelay(0);
-
-	if ((status = card_send_command(ioaddr, name, Command0, st)))
-		return status;
-	if (st[3] != 0xf0)
-		return -EIO;
-	return 0;
-}
-
-/* check SB1000 firmware CRC */
-static int
-sb1000_check_CRC(const int ioaddr[], const char* name)
-{
-	static const unsigned char Command0[6] = {0x80, 0x1f, 0x00, 0x00, 0x00, 0x00};
-
-	unsigned char st[7];
-	int status;
-
-	/* check CRC */
-	if ((status = card_send_command(ioaddr, name, Command0, st)))
-		return status;
-	if (st[1] != st[3] || st[2] != st[4])
-		return -EIO;
-	return 0;
-}
-
-static inline int
-sb1000_start_get_set_command(const int ioaddr[], const char* name)
-{
-	static const unsigned char Command0[6] = {0x80, 0x1b, 0x00, 0x00, 0x00, 0x00};
-
-	unsigned char st[7];
-
-	return card_send_command(ioaddr, name, Command0, st);
-}
-
-static int
-sb1000_end_get_set_command(const int ioaddr[], const char* name)
-{
-	static const unsigned char Command0[6] = {0x80, 0x1b, 0x02, 0x00, 0x00, 0x00};
-	static const unsigned char Command1[6] = {0x20, 0x00, 0x00, 0x00, 0x00, 0x00};
-
-	unsigned char st[7];
-	int status;
-
-	if ((status = card_send_command(ioaddr, name, Command0, st)))
-		return status;
-	return card_send_command(ioaddr, name, Command1, st);
-}
-
-static int
-sb1000_activate(const int ioaddr[], const char* name)
-{
-	static const unsigned char Command0[6] = {0x80, 0x11, 0x00, 0x00, 0x00, 0x00};
-	static const unsigned char Command1[6] = {0x80, 0x16, 0x00, 0x00, 0x00, 0x00};
-
-	unsigned char st[7];
-	int status;
-
-	ssleep(1);
-	status = card_send_command(ioaddr, name, Command0, st);
-	if (status)
-		return status;
-	status = card_send_command(ioaddr, name, Command1, st);
-	if (status)
-		return status;
-	if (st[3] != 0xf1) {
-		status = sb1000_start_get_set_command(ioaddr, name);
-		if (status)
-			return status;
-		return -EIO;
-	}
-	udelay(1000);
-	return sb1000_start_get_set_command(ioaddr, name);
-}
-
-/* get SB1000 firmware version */
-static int
-sb1000_get_firmware_version(const int ioaddr[], const char* name,
-	unsigned char version[], int do_end)
-{
-	static const unsigned char Command0[6] = {0x80, 0x23, 0x00, 0x00, 0x00, 0x00};
-
-	unsigned char st[7];
-	int status;
-
-	if ((status = sb1000_start_get_set_command(ioaddr, name)))
-		return status;
-	if ((status = card_send_command(ioaddr, name, Command0, st)))
-		return status;
-	if (st[0] != 0xa3)
-		return -EIO;
-	version[0] = st[1];
-	version[1] = st[2];
-	if (do_end)
-		return sb1000_end_get_set_command(ioaddr, name);
-	else
-		return 0;
-}
-
-/* get SB1000 frequency */
-static int
-sb1000_get_frequency(const int ioaddr[], const char* name, int* frequency)
-{
-	static const unsigned char Command0[6] = {0x80, 0x44, 0x00, 0x00, 0x00, 0x00};
-
-	unsigned char st[7];
-	int status;
-
-	udelay(1000);
-	if ((status = sb1000_start_get_set_command(ioaddr, name)))
-		return status;
-	if ((status = card_send_command(ioaddr, name, Command0, st)))
-		return status;
-	*frequency = ((st[1] << 8 | st[2]) << 8 | st[3]) << 8 | st[4];
-	return sb1000_end_get_set_command(ioaddr, name);
-}
-
-/* set SB1000 frequency */
-static int
-sb1000_set_frequency(const int ioaddr[], const char* name, int frequency)
-{
-	unsigned char st[7];
-	int status;
-	unsigned char Command0[6] = {0x80, 0x29, 0x00, 0x00, 0x00, 0x00};
-
-	const int FrequencyLowerLimit = 57000;
-	const int FrequencyUpperLimit = 804000;
-
-	if (frequency < FrequencyLowerLimit || frequency > FrequencyUpperLimit) {
-		printk(KERN_ERR "%s: frequency chosen (%d kHz) is not in the range "
-			"[%d,%d] kHz\n", name, frequency, FrequencyLowerLimit,
-			FrequencyUpperLimit);
-		return -EINVAL;
-	}
-	udelay(1000);
-	if ((status = sb1000_start_get_set_command(ioaddr, name)))
-		return status;
-	Command0[5] = frequency & 0xff;
-	frequency >>= 8;
-	Command0[4] = frequency & 0xff;
-	frequency >>= 8;
-	Command0[3] = frequency & 0xff;
-	frequency >>= 8;
-	Command0[2] = frequency & 0xff;
-	return card_send_command(ioaddr, name, Command0, st);
-}
-
-/* get SB1000 PIDs */
-static int
-sb1000_get_PIDs(const int ioaddr[], const char* name, short PID[])
-{
-	static const unsigned char Command0[6] = {0x80, 0x40, 0x00, 0x00, 0x00, 0x00};
-	static const unsigned char Command1[6] = {0x80, 0x41, 0x00, 0x00, 0x00, 0x00};
-	static const unsigned char Command2[6] = {0x80, 0x42, 0x00, 0x00, 0x00, 0x00};
-	static const unsigned char Command3[6] = {0x80, 0x43, 0x00, 0x00, 0x00, 0x00};
-
-	unsigned char st[7];
-	int status;
-
-	udelay(1000);
-	if ((status = sb1000_start_get_set_command(ioaddr, name)))
-		return status;
-
-	if ((status = card_send_command(ioaddr, name, Command0, st)))
-		return status;
-	PID[0] = st[1] << 8 | st[2];
-
-	if ((status = card_send_command(ioaddr, name, Command1, st)))
-		return status;
-	PID[1] = st[1] << 8 | st[2];
-
-	if ((status = card_send_command(ioaddr, name, Command2, st)))
-		return status;
-	PID[2] = st[1] << 8 | st[2];
-
-	if ((status = card_send_command(ioaddr, name, Command3, st)))
-		return status;
-	PID[3] = st[1] << 8 | st[2];
-
-	return sb1000_end_get_set_command(ioaddr, name);
-}
-
-/* set SB1000 PIDs */
-static int
-sb1000_set_PIDs(const int ioaddr[], const char* name, const short PID[])
-{
-	static const unsigned char Command4[6] = {0x80, 0x2e, 0x00, 0x00, 0x00, 0x00};
-
-	unsigned char st[7];
-	short p;
-	int status;
-	unsigned char Command0[6] = {0x80, 0x31, 0x00, 0x00, 0x00, 0x00};
-	unsigned char Command1[6] = {0x80, 0x32, 0x00, 0x00, 0x00, 0x00};
-	unsigned char Command2[6] = {0x80, 0x33, 0x00, 0x00, 0x00, 0x00};
-	unsigned char Command3[6] = {0x80, 0x34, 0x00, 0x00, 0x00, 0x00};
-
-	udelay(1000);
-	if ((status = sb1000_start_get_set_command(ioaddr, name)))
-		return status;
-
-	p = PID[0];
-	Command0[3] = p & 0xff;
-	p >>= 8;
-	Command0[2] = p & 0xff;
-	if ((status = card_send_command(ioaddr, name, Command0, st)))
-		return status;
-
-	p = PID[1];
-	Command1[3] = p & 0xff;
-	p >>= 8;
-	Command1[2] = p & 0xff;
-	if ((status = card_send_command(ioaddr, name, Command1, st)))
-		return status;
-
-	p = PID[2];
-	Command2[3] = p & 0xff;
-	p >>= 8;
-	Command2[2] = p & 0xff;
-	if ((status = card_send_command(ioaddr, name, Command2, st)))
-		return status;
-
-	p = PID[3];
-	Command3[3] = p & 0xff;
-	p >>= 8;
-	Command3[2] = p & 0xff;
-	if ((status = card_send_command(ioaddr, name, Command3, st)))
-		return status;
-
-	if ((status = card_send_command(ioaddr, name, Command4, st)))
-		return status;
-	return sb1000_end_get_set_command(ioaddr, name);
-}
-
-
-static void
-sb1000_print_status_buffer(const char* name, unsigned char st[],
-	unsigned char buffer[], int size)
-{
-	int i, j, k;
-
-	printk(KERN_DEBUG "%s: status: %02x %02x\n", name, st[0], st[1]);
-	if (buffer[24] == 0x08 && buffer[25] == 0x00 && buffer[26] == 0x45) {
-		printk(KERN_DEBUG "%s: length: %d protocol: %d from: %d.%d.%d.%d:%d "
-			"to %d.%d.%d.%d:%d\n", name, buffer[28] << 8 | buffer[29],
-			buffer[35], buffer[38], buffer[39], buffer[40], buffer[41],
-            buffer[46] << 8 | buffer[47],
-			buffer[42], buffer[43], buffer[44], buffer[45],
-            buffer[48] << 8 | buffer[49]);
-	} else {
-		for (i = 0, k = 0; i < (size + 7) / 8; i++) {
-			printk(KERN_DEBUG "%s: %s", name, i ? "       " : "buffer:");
-			for (j = 0; j < 8 && k < size; j++, k++)
-				printk(" %02x", buffer[k]);
-			printk("\n");
-		}
-	}
-}
-
-/*
- * SB1000 commands for frame rx interrupt
- */
-/* receive a single frame and assemble datagram
- * (this is the heart of the interrupt routine)
- */
-static int
-sb1000_rx(struct net_device *dev)
-{
-
-#define FRAMESIZE 184
-	unsigned char st[2], buffer[FRAMESIZE], session_id, frame_id;
-	short dlen;
-	int ioaddr, ns;
-	unsigned int skbsize;
-	struct sk_buff *skb;
-	struct sb1000_private *lp = netdev_priv(dev);
-	struct net_device_stats *stats = &dev->stats;
-
-	/* SB1000 frame constants */
-	const int FrameSize = FRAMESIZE;
-	const int NewDatagramHeaderSkip = 8;
-	const int NewDatagramHeaderSize = NewDatagramHeaderSkip + 18;
-	const int NewDatagramDataSize = FrameSize - NewDatagramHeaderSize;
-	const int ContDatagramHeaderSkip = 7;
-	const int ContDatagramHeaderSize = ContDatagramHeaderSkip + 1;
-	const int ContDatagramDataSize = FrameSize - ContDatagramHeaderSize;
-	const int TrailerSize = 4;
-
-	ioaddr = dev->base_addr;
-
-	insw(ioaddr, (unsigned short*) st, 1);
-#ifdef XXXDEBUG
-printk("cm0: received: %02x %02x\n", st[0], st[1]);
-#endif /* XXXDEBUG */
-	lp->rx_frames++;
-
-	/* decide if it is a good or bad frame */
-	for (ns = 0; ns < NPIDS; ns++) {
-		session_id = lp->rx_session_id[ns];
-		frame_id = lp->rx_frame_id[ns];
-		if (st[0] == session_id) {
-			if (st[1] == frame_id || (!frame_id && (st[1] & 0xf0) == 0x30)) {
-				goto good_frame;
-			} else if ((st[1] & 0xf0) == 0x30 && (st[0] & 0x40)) {
-				goto skipped_frame;
-			} else {
-				goto bad_frame;
-			}
-		} else if (st[0] == (session_id | 0x40)) {
-			if ((st[1] & 0xf0) == 0x30) {
-				goto skipped_frame;
-			} else {
-				goto bad_frame;
-			}
-		}
-	}
-	goto bad_frame;
-
-skipped_frame:
-	stats->rx_frame_errors++;
-	skb = lp->rx_skb[ns];
-	if (sb1000_debug > 1)
-		printk(KERN_WARNING "%s: missing frame(s): got %02x %02x "
-			"expecting %02x %02x\n", dev->name, st[0], st[1],
-			skb ? session_id : session_id | 0x40, frame_id);
-	if (skb) {
-		dev_kfree_skb(skb);
-		skb = NULL;
-	}
-
-good_frame:
-	lp->rx_frame_id[ns] = 0x30 | ((st[1] + 1) & 0x0f);
-	/* new datagram */
-	if (st[0] & 0x40) {
-		/* get data length */
-		insw(ioaddr, buffer, NewDatagramHeaderSize / 2);
-#ifdef XXXDEBUG
-printk("cm0: IP identification: %02x%02x  fragment offset: %02x%02x\n", buffer[30], buffer[31], buffer[32], buffer[33]);
-#endif /* XXXDEBUG */
-		if (buffer[0] != NewDatagramHeaderSkip) {
-			if (sb1000_debug > 1)
-				printk(KERN_WARNING "%s: new datagram header skip error: "
-					"got %02x expecting %02x\n", dev->name, buffer[0],
-					NewDatagramHeaderSkip);
-			stats->rx_length_errors++;
-			insw(ioaddr, buffer, NewDatagramDataSize / 2);
-			goto bad_frame_next;
-		}
-		dlen = ((buffer[NewDatagramHeaderSkip + 3] & 0x0f) << 8 |
-			buffer[NewDatagramHeaderSkip + 4]) - 17;
-		if (dlen > SB1000_MRU) {
-			if (sb1000_debug > 1)
-				printk(KERN_WARNING "%s: datagram length (%d) greater "
-					"than MRU (%d)\n", dev->name, dlen, SB1000_MRU);
-			stats->rx_length_errors++;
-			insw(ioaddr, buffer, NewDatagramDataSize / 2);
-			goto bad_frame_next;
-		}
-		lp->rx_dlen[ns] = dlen;
-		/* compute size to allocate for datagram */
-		skbsize = dlen + FrameSize;
-		if ((skb = alloc_skb(skbsize, GFP_ATOMIC)) == NULL) {
-			if (sb1000_debug > 1)
-				printk(KERN_WARNING "%s: can't allocate %d bytes long "
-					"skbuff\n", dev->name, skbsize);
-			stats->rx_dropped++;
-			insw(ioaddr, buffer, NewDatagramDataSize / 2);
-			goto dropped_frame;
-		}
-		skb->dev = dev;
-		skb_reset_mac_header(skb);
-		skb->protocol = (unsigned short) buffer[NewDatagramHeaderSkip + 16];
-		insw(ioaddr, skb_put(skb, NewDatagramDataSize),
-			NewDatagramDataSize / 2);
-		lp->rx_skb[ns] = skb;
-	} else {
-		/* continuation of previous datagram */
-		insw(ioaddr, buffer, ContDatagramHeaderSize / 2);
-		if (buffer[0] != ContDatagramHeaderSkip) {
-			if (sb1000_debug > 1)
-				printk(KERN_WARNING "%s: cont datagram header skip error: "
-					"got %02x expecting %02x\n", dev->name, buffer[0],
-					ContDatagramHeaderSkip);
-			stats->rx_length_errors++;
-			insw(ioaddr, buffer, ContDatagramDataSize / 2);
-			goto bad_frame_next;
-		}
-		skb = lp->rx_skb[ns];
-		insw(ioaddr, skb_put(skb, ContDatagramDataSize),
-			ContDatagramDataSize / 2);
-		dlen = lp->rx_dlen[ns];
-	}
-	if (skb->len < dlen + TrailerSize) {
-		lp->rx_session_id[ns] &= ~0x40;
-		return 0;
-	}
-
-	/* datagram completed: send to upper level */
-	skb_trim(skb, dlen);
-	__netif_rx(skb);
-	stats->rx_bytes+=dlen;
-	stats->rx_packets++;
-	lp->rx_skb[ns] = NULL;
-	lp->rx_session_id[ns] |= 0x40;
-	return 0;
-
-bad_frame:
-	insw(ioaddr, buffer, FrameSize / 2);
-	if (sb1000_debug > 1)
-		printk(KERN_WARNING "%s: frame error: got %02x %02x\n",
-			dev->name, st[0], st[1]);
-	stats->rx_frame_errors++;
-bad_frame_next:
-	if (sb1000_debug > 2)
-		sb1000_print_status_buffer(dev->name, st, buffer, FrameSize);
-dropped_frame:
-	stats->rx_errors++;
-	if (ns < NPIDS) {
-		if ((skb = lp->rx_skb[ns])) {
-			dev_kfree_skb(skb);
-			lp->rx_skb[ns] = NULL;
-		}
-		lp->rx_session_id[ns] |= 0x40;
-	}
-	return -1;
-}
-
-static void
-sb1000_error_dpc(struct net_device *dev)
-{
-	static const unsigned char Command0[6] = {0x80, 0x26, 0x00, 0x00, 0x00, 0x00};
-
-	char *name;
-	unsigned char st[5];
-	int ioaddr[2];
-	struct sb1000_private *lp = netdev_priv(dev);
-	const int ErrorDpcCounterInitialize = 200;
-
-	ioaddr[0] = dev->base_addr;
-	/* mem_start holds the second I/O address */
-	ioaddr[1] = dev->mem_start;
-	name = dev->name;
-
-	sb1000_wait_for_ready_clear(ioaddr, name);
-	sb1000_send_command(ioaddr, name, Command0);
-	sb1000_wait_for_ready(ioaddr, name);
-	sb1000_read_status(ioaddr, st);
-	if (st[1] & 0x10)
-		lp->rx_error_dpc_count = ErrorDpcCounterInitialize;
-}
-
-
-/*
- * Linux interface functions
- */
-static int
-sb1000_open(struct net_device *dev)
-{
-	char *name;
-	int ioaddr[2], status;
-	struct sb1000_private *lp = netdev_priv(dev);
-	const unsigned short FirmwareVersion[] = {0x01, 0x01};
-
-	ioaddr[0] = dev->base_addr;
-	/* mem_start holds the second I/O address */
-	ioaddr[1] = dev->mem_start;
-	name = dev->name;
-
-	/* initialize sb1000 */
-	if ((status = sb1000_reset(ioaddr, name)))
-		return status;
-	ssleep(1);
-	if ((status = sb1000_check_CRC(ioaddr, name)))
-		return status;
-
-	/* initialize private data before board can catch interrupts */
-	lp->rx_skb[0] = NULL;
-	lp->rx_skb[1] = NULL;
-	lp->rx_skb[2] = NULL;
-	lp->rx_skb[3] = NULL;
-	lp->rx_dlen[0] = 0;
-	lp->rx_dlen[1] = 0;
-	lp->rx_dlen[2] = 0;
-	lp->rx_dlen[3] = 0;
-	lp->rx_frames = 0;
-	lp->rx_error_count = 0;
-	lp->rx_error_dpc_count = 0;
-	lp->rx_session_id[0] = 0x50;
-	lp->rx_session_id[1] = 0x48;
-	lp->rx_session_id[2] = 0x44;
-	lp->rx_session_id[3] = 0x42;
-	lp->rx_frame_id[0] = 0;
-	lp->rx_frame_id[1] = 0;
-	lp->rx_frame_id[2] = 0;
-	lp->rx_frame_id[3] = 0;
-	if (request_irq(dev->irq, sb1000_interrupt, 0, "sb1000", dev)) {
-		return -EAGAIN;
-	}
-
-	if (sb1000_debug > 2)
-		printk(KERN_DEBUG "%s: Opening, IRQ %d\n", name, dev->irq);
-
-	/* Activate board and check firmware version */
-	udelay(1000);
-	if ((status = sb1000_activate(ioaddr, name)))
-		return status;
-	udelay(0);
-	if ((status = sb1000_get_firmware_version(ioaddr, name, version, 0)))
-		return status;
-	if (version[0] != FirmwareVersion[0] || version[1] != FirmwareVersion[1])
-		printk(KERN_WARNING "%s: found firmware version %x.%02x "
-			"(should be %x.%02x)\n", name, version[0], version[1],
-			FirmwareVersion[0], FirmwareVersion[1]);
-
-
-	netif_start_queue(dev);
-	return 0;					/* Always succeed */
-}
-
-static int sb1000_siocdevprivate(struct net_device *dev, struct ifreq *ifr,
-				 void __user *data, int cmd)
-{
-	char* name;
-	unsigned char version[2];
-	short PID[4];
-	int ioaddr[2], status, frequency;
-	unsigned int stats[5];
-	struct sb1000_private *lp = netdev_priv(dev);
-
-	if (!(dev && dev->flags & IFF_UP))
-		return -ENODEV;
-
-	ioaddr[0] = dev->base_addr;
-	/* mem_start holds the second I/O address */
-	ioaddr[1] = dev->mem_start;
-	name = dev->name;
-
-	switch (cmd) {
-	case SIOCGCMSTATS:		/* get statistics */
-		stats[0] = dev->stats.rx_bytes;
-		stats[1] = lp->rx_frames;
-		stats[2] = dev->stats.rx_packets;
-		stats[3] = dev->stats.rx_errors;
-		stats[4] = dev->stats.rx_dropped;
-		if (copy_to_user(data, stats, sizeof(stats)))
-			return -EFAULT;
-		status = 0;
-		break;
-
-	case SIOCGCMFIRMWARE:		/* get firmware version */
-		if ((status = sb1000_get_firmware_version(ioaddr, name, version, 1)))
-			return status;
-		if (copy_to_user(data, version, sizeof(version)))
-			return -EFAULT;
-		break;
-
-	case SIOCGCMFREQUENCY:		/* get frequency */
-		if ((status = sb1000_get_frequency(ioaddr, name, &frequency)))
-			return status;
-		if (put_user(frequency, (int __user *)data))
-			return -EFAULT;
-		break;
-
-	case SIOCSCMFREQUENCY:		/* set frequency */
-		if (!capable(CAP_NET_ADMIN))
-			return -EPERM;
-		if (get_user(frequency, (int __user *)data))
-			return -EFAULT;
-		if ((status = sb1000_set_frequency(ioaddr, name, frequency)))
-			return status;
-		break;
-
-	case SIOCGCMPIDS:			/* get PIDs */
-		if ((status = sb1000_get_PIDs(ioaddr, name, PID)))
-			return status;
-		if (copy_to_user(data, PID, sizeof(PID)))
-			return -EFAULT;
-		break;
-
-	case SIOCSCMPIDS:			/* set PIDs */
-		if (!capable(CAP_NET_ADMIN))
-			return -EPERM;
-		if (copy_from_user(PID, data, sizeof(PID)))
-			return -EFAULT;
-		if ((status = sb1000_set_PIDs(ioaddr, name, PID)))
-			return status;
-		/* set session_id, frame_id and pkt_type too */
-		lp->rx_session_id[0] = 0x50 | (PID[0] & 0x0f);
-		lp->rx_session_id[1] = 0x48;
-		lp->rx_session_id[2] = 0x44;
-		lp->rx_session_id[3] = 0x42;
-		lp->rx_frame_id[0] = 0;
-		lp->rx_frame_id[1] = 0;
-		lp->rx_frame_id[2] = 0;
-		lp->rx_frame_id[3] = 0;
-		break;
-
-	default:
-		status = -EINVAL;
-		break;
-	}
-	return status;
-}
-
-/* transmit function: do nothing since SB1000 can't send anything out */
-static netdev_tx_t
-sb1000_start_xmit(struct sk_buff *skb, struct net_device *dev)
-{
-	printk(KERN_WARNING "%s: trying to transmit!!!\n", dev->name);
-	/* sb1000 can't xmit datagrams */
-	dev_kfree_skb(skb);
-	return NETDEV_TX_OK;
-}
-
-/* SB1000 interrupt handler. */
-static irqreturn_t sb1000_interrupt(int irq, void *dev_id)
-{
-	static const unsigned char Command0[6] = {0x80, 0x2c, 0x00, 0x00, 0x00, 0x00};
-	static const unsigned char Command1[6] = {0x80, 0x2e, 0x00, 0x00, 0x00, 0x00};
-
-	char *name;
-	unsigned char st;
-	int ioaddr[2];
-	struct net_device *dev = dev_id;
-	struct sb1000_private *lp = netdev_priv(dev);
-
-	const int MaxRxErrorCount = 6;
-
-	ioaddr[0] = dev->base_addr;
-	/* mem_start holds the second I/O address */
-	ioaddr[1] = dev->mem_start;
-	name = dev->name;
-
-	/* is it a good interrupt? */
-	st = inb(ioaddr[1] + 6);
-	if (!(st & 0x08 && st & 0x20)) {
-		return IRQ_NONE;
-	}
-
-	if (sb1000_debug > 3)
-		printk(KERN_DEBUG "%s: entering interrupt\n", dev->name);
-
-	st = inb(ioaddr[0] + 7);
-	if (sb1000_rx(dev))
-		lp->rx_error_count++;
-#ifdef SB1000_DELAY
-	udelay(SB1000_DELAY);
-#endif /* SB1000_DELAY */
-	sb1000_issue_read_command(ioaddr, name);
-	if (st & 0x01) {
-		sb1000_error_dpc(dev);
-		sb1000_issue_read_command(ioaddr, name);
-	}
-	if (lp->rx_error_dpc_count && !(--lp->rx_error_dpc_count)) {
-		sb1000_wait_for_ready_clear(ioaddr, name);
-		sb1000_send_command(ioaddr, name, Command0);
-		sb1000_wait_for_ready(ioaddr, name);
-		sb1000_issue_read_command(ioaddr, name);
-	}
-	if (lp->rx_error_count >= MaxRxErrorCount) {
-		sb1000_wait_for_ready_clear(ioaddr, name);
-		sb1000_send_command(ioaddr, name, Command1);
-		sb1000_wait_for_ready(ioaddr, name);
-		sb1000_issue_read_command(ioaddr, name);
-		lp->rx_error_count = 0;
-	}
-
-	return IRQ_HANDLED;
-}
-
-static int sb1000_close(struct net_device *dev)
-{
-	int i;
-	int ioaddr[2];
-	struct sb1000_private *lp = netdev_priv(dev);
-
-	if (sb1000_debug > 2)
-		printk(KERN_DEBUG "%s: Shutting down sb1000.\n", dev->name);
-
-	netif_stop_queue(dev);
-
-	ioaddr[0] = dev->base_addr;
-	/* mem_start holds the second I/O address */
-	ioaddr[1] = dev->mem_start;
-
-	free_irq(dev->irq, dev);
-	/* If we don't do this, we can't re-insmod it later. */
-	release_region(ioaddr[1], SB1000_IO_EXTENT);
-	release_region(ioaddr[0], SB1000_IO_EXTENT);
-
-	/* free rx_skb's if needed */
-	for (i=0; i<4; i++) {
-		if (lp->rx_skb[i]) {
-			dev_kfree_skb(lp->rx_skb[i]);
-		}
-	}
-	return 0;
-}
-
-MODULE_AUTHOR("Franco Venturi <fventuri@mediaone.net>");
-MODULE_DESCRIPTION("General Instruments SB1000 driver");
-MODULE_LICENSE("GPL");
-
-module_pnp_driver(sb1000_driver);
diff --git a/include/uapi/linux/if_cablemodem.h b/include/uapi/linux/if_cablemodem.h
deleted file mode 100644
index 1f65130bf2a6..000000000000
--- a/include/uapi/linux/if_cablemodem.h
+++ /dev/null
@@ -1,23 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0+ WITH Linux-syscall-note */
-#ifndef _LINUX_CABLEMODEM_H_
-#define _LINUX_CABLEMODEM_H_
-/*
- *		Author: Franco Venturi <fventuri@mediaone.net>
- *		Copyright 1998 Franco Venturi
- *
- *		This program is free software; you can redistribute it
- *		and/or  modify it under  the terms of  the GNU General
- *		Public  License as  published  by  the  Free  Software
- *		Foundation;  either  version 2 of the License, or  (at
- *		your option) any later version.
- */
-
-/* some useful defines for sb1000.c e cmconfig.c - fv */
-#define SIOCGCMSTATS		(SIOCDEVPRIVATE+0)	/* get cable modem stats */
-#define SIOCGCMFIRMWARE		(SIOCDEVPRIVATE+1)	/* get cm firmware version */
-#define SIOCGCMFREQUENCY	(SIOCDEVPRIVATE+2)	/* get cable modem frequency */
-#define SIOCSCMFREQUENCY	(SIOCDEVPRIVATE+3)	/* set cable modem frequency */
-#define SIOCGCMPIDS			(SIOCDEVPRIVATE+4)	/* get cable modem PIDs */
-#define SIOCSCMPIDS			(SIOCDEVPRIVATE+5)	/* set cable modem PIDs */
-
-#endif
-- 
2.39.5


