Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F316551F850
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 May 2022 11:37:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kxbfy5w8cz3bph
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 May 2022 19:37:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Py9yOELu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=ilpo.jarvinen@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Py9yOELu; dkim-atps=neutral
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kxbdk0FjQz2yp5
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 May 2022 19:36:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652088970; x=1683624970;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uRaL2cSJJVQ48WBOzW1FukHaEfokPCsTxRrUfKF/a5c=;
 b=Py9yOELuFS6tydrW+BYUmXmrx+OFkcFvcAhalplebCPdcuXxyBRSkbd5
 VAZI5YkPXzteXq19TMShtjV51mft07LLEnv84H3FIQnp9t3g8wHTfEwr0
 gIhEpi4im6rHyXqqRxYKhhPWSArdiSISAH/zFD4EJHvbFDl9qQH4sguG4
 SD4wsyFTqLbK0vprapyjD7oPQLqSTQehjgc9lMxLoEGr18O0uEkRg1sJf
 cep1qA5Ycf/w7C/1kxLE8cWoE5Cerxd9qF4jeDQRhYOwAkX+rTsiPvXTg
 946eh+jbTyFIdAN2Vw0ntJIWCfN4hcQY0D9SeC6+WCNccLLTeRSUefvhR Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10341"; a="266585804"
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="266585804"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 02:35:06 -0700
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="564969571"
Received: from mfuent2x-mobl1.amr.corp.intel.com (HELO
 ijarvine-MOBL2.ger.corp.intel.com) ([10.251.220.67])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 02:35:00 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-serial@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Matt Turner <mattst88@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, "David S. Miller" <davem@davemloft.net>,
 Arnd Bergmann <arnd@arndb.de>, linux-alpha@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, linux-arch@vger.kernel.org
Subject: [PATCH 1/3] termbits.h: create termbits-common.h for identical bits
Date: Mon,  9 May 2022 12:34:44 +0300
Message-Id: <20220509093446.6677-2-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220509093446.6677-1-ilpo.jarvinen@linux.intel.com>
References: <20220509093446.6677-1-ilpo.jarvinen@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Some defines are the same across all archs. Move the most obvious
intersection to termbits-common.h.

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 arch/alpha/include/uapi/asm/termbits.h     | 52 +----------------
 arch/mips/include/uapi/asm/termbits.h      | 53 +-----------------
 arch/parisc/include/uapi/asm/termbits.h    | 54 +-----------------
 arch/powerpc/include/uapi/asm/termbits.h   | 52 +----------------
 arch/sparc/include/uapi/asm/termbits.h     | 53 +-----------------
 include/uapi/asm-generic/termbits-common.h | 65 ++++++++++++++++++++++
 include/uapi/asm-generic/termbits.h        | 53 +-----------------
 7 files changed, 76 insertions(+), 306 deletions(-)
 create mode 100644 include/uapi/asm-generic/termbits-common.h

diff --git a/arch/alpha/include/uapi/asm/termbits.h b/arch/alpha/include/uapi/asm/termbits.h
index 30dc7ff777b8..3c7a9afc4333 100644
--- a/arch/alpha/include/uapi/asm/termbits.h
+++ b/arch/alpha/include/uapi/asm/termbits.h
@@ -4,8 +4,8 @@
 
 #include <linux/posix_types.h>
 
-typedef unsigned char	cc_t;
-typedef unsigned int	speed_t;
+#include <asm-generic/termbits-common.h>
+
 typedef unsigned int	tcflag_t;
 
 /*
@@ -72,33 +72,17 @@ struct ktermios {
 #define VTIME 17
 
 /* c_iflag bits */
-#define IGNBRK	0x00001
-#define BRKINT	0x00002
-#define IGNPAR	0x00004
-#define PARMRK	0x00008
-#define INPCK	0x00010
-#define ISTRIP	0x00020
-#define INLCR	0x00040
-#define IGNCR	0x00080
-#define ICRNL	0x00100
 #define IXON	0x00200
 #define IXOFF	0x00400
-#define IXANY	0x00800
 #define IUCLC	0x01000
 #define IMAXBEL	0x02000
 #define IUTF8	0x04000
 
 /* c_oflag bits */
-#define OPOST	0x00001
 #define ONLCR	0x00002
 #define OLCUC	0x00004
 
-#define OCRNL	0x00008
-#define ONOCR	0x00010
-#define ONLRET	0x00020
 
-#define OFILL	0x000040
-#define OFDEL	0x000080
 #define NLDLY	0x000300
 #define   NL0	0x000000
 #define   NL1	0x000100
@@ -131,24 +115,6 @@ struct ktermios {
 
 /* c_cflag bit meaning */
 #define CBAUD		0x0000001f
-#define  B0		0x00000000	/* hang up */
-#define  B50		0x00000001
-#define  B75		0x00000002
-#define  B110		0x00000003
-#define  B134		0x00000004
-#define  B150		0x00000005
-#define  B200		0x00000006
-#define  B300		0x00000007
-#define  B600		0x00000008
-#define  B1200		0x00000009
-#define  B1800		0x0000000a
-#define  B2400		0x0000000b
-#define  B4800		0x0000000c
-#define  B9600		0x0000000d
-#define  B19200		0x0000000e
-#define  B38400		0x0000000f
-#define EXTA B19200
-#define EXTB B38400
 #define CBAUDEX		0x00000000
 #define  B57600		0x00000010
 #define  B115200	0x00000011
@@ -180,11 +146,8 @@ struct ktermios {
 #define HUPCL		0x00004000
 
 #define CLOCAL		0x00008000
-#define CMSPAR		0x40000000	/* mark or space (stick) parity */
-#define CRTSCTS		0x80000000	/* flow control */
 
 #define CIBAUD		0x1f0000
-#define IBSHIFT	16
 
 /* c_lflag bits */
 #define ISIG	0x00000080
@@ -204,17 +167,6 @@ struct ktermios {
 #define IEXTEN	0x00000400
 #define EXTPROC	0x10000000
 
-/* Values for the ACTION argument to `tcflow'.  */
-#define	TCOOFF		0
-#define	TCOON		1
-#define	TCIOFF		2
-#define	TCION		3
-
-/* Values for the QUEUE_SELECTOR argument to `tcflush'.  */
-#define	TCIFLUSH	0
-#define	TCOFLUSH	1
-#define	TCIOFLUSH	2
-
 /* Values for the OPTIONAL_ACTIONS argument to `tcsetattr'.  */
 #define	TCSANOW		0
 #define	TCSADRAIN	1
diff --git a/arch/mips/include/uapi/asm/termbits.h b/arch/mips/include/uapi/asm/termbits.h
index d1315ccdb39a..b33f514315ce 100644
--- a/arch/mips/include/uapi/asm/termbits.h
+++ b/arch/mips/include/uapi/asm/termbits.h
@@ -13,8 +13,8 @@
 
 #include <linux/posix_types.h>
 
-typedef unsigned char cc_t;
-typedef unsigned int speed_t;
+#include <asm-generic/termbits-common.h>
+
 typedef unsigned int tcflag_t;
 
 /*
@@ -80,31 +80,15 @@ struct ktermios {
 #define VEOL		17		/* End-of-line character [ICANON].  */
 
 /* c_iflag bits */
-#define IGNBRK	0x00001		/* Ignore break condition.  */
-#define BRKINT	0x00002		/* Signal interrupt on break.  */
-#define IGNPAR	0x00004		/* Ignore characters with parity errors.  */
-#define PARMRK	0x00008		/* Mark parity and framing errors.  */
-#define INPCK	0x00010		/* Enable input parity check.  */
-#define ISTRIP	0x00020		/* Strip 8th bit off characters.  */
-#define INLCR	0x00040		/* Map NL to CR on input.  */
-#define IGNCR	0x00080		/* Ignore CR.  */
-#define ICRNL	0x00100		/* Map CR to NL on input.  */
 #define IUCLC	0x00200		/* Map upper case to lower case on input.  */
 #define IXON	0x00400		/* Enable start/stop output control.  */
-#define IXANY	0x00800		/* Any character will restart after stop.  */
 #define IXOFF	0x01000		/* Enable start/stop input control.  */
 #define IMAXBEL	0x02000		/* Ring bell when input queue is full.	*/
 #define IUTF8	0x04000		/* Input is UTF-8 */
 
 /* c_oflag bits */
-#define OPOST	0x00001		/* Perform output processing.  */
 #define OLCUC	0x00002		/* Map lower case to upper case on output.  */
 #define ONLCR	0x00004		/* Map NL to CR-NL on output.  */
-#define OCRNL	0x00008
-#define ONOCR	0x00010
-#define ONLRET	0x00020
-#define OFILL	0x00040
-#define OFDEL	0x00080
 #define NLDLY	0x00100
 #define	  NL0	0x00000
 #define	  NL1	0x00100
@@ -135,24 +119,6 @@ struct ktermios {
 
 /* c_cflag bit meaning */
 #define CBAUD		0x0000100f
-#define	 B0		0x00000000	/* hang up */
-#define	 B50		0x00000001
-#define	 B75		0x00000002
-#define	 B110		0x00000003
-#define	 B134		0x00000004
-#define	 B150		0x00000005
-#define	 B200		0x00000006
-#define	 B300		0x00000007
-#define	 B600		0x00000008
-#define	 B1200		0x00000009
-#define	 B1800		0x0000000a
-#define	 B2400		0x0000000b
-#define	 B4800		0x0000000c
-#define	 B9600		0x0000000d
-#define	 B19200		0x0000000e
-#define	 B38400		0x0000000f
-#define EXTA B19200
-#define EXTB B38400
 #define CSIZE		0x00000030	/* Number of bits per byte (mask) */
 #define	  CS5		0x00000000	/* 5 bits per byte */
 #define	  CS6		0x00000010	/* 6 bits per byte */
@@ -182,10 +148,6 @@ struct ktermios {
 #define	 B3500000	0x0000100e
 #define	 B4000000	0x0000100f
 #define CIBAUD		0x100f0000	/* input baud rate */
-#define CMSPAR		0x40000000	/* mark or space (stick) parity */
-#define CRTSCTS		0x80000000	/* flow control */
-
-#define IBSHIFT 16		/* Shift from CBAUD to CIBAUD */
 
 /* c_lflag bits */
 #define ISIG	0x00001		/* Enable signals.  */
@@ -209,17 +171,6 @@ struct ktermios {
 /* ioctl (fd, TIOCSERGETLSR, &result) where result may be as below */
 #define TIOCSER_TEMT	0x01	/* Transmitter physically empty */
 
-/* tcflow() and TCXONC use these */
-#define TCOOFF		0	/* Suspend output.  */
-#define TCOON		1	/* Restart suspended output.  */
-#define TCIOFF		2	/* Send a STOP character.  */
-#define TCION		3	/* Send a START character.  */
-
-/* tcflush() and TCFLSH use these */
-#define TCIFLUSH	0	/* Discard data received but not yet read.  */
-#define TCOFLUSH	1	/* Discard data written but not yet sent.  */
-#define TCIOFLUSH	2	/* Discard all pending data.  */
-
 /* tcsetattr uses these */
 #define TCSANOW		TCSETS	/* Change immediately.	*/
 #define TCSADRAIN	TCSETSW /* Change when pending output is written.  */
diff --git a/arch/parisc/include/uapi/asm/termbits.h b/arch/parisc/include/uapi/asm/termbits.h
index 6017ee08f099..7f74a822b7ea 100644
--- a/arch/parisc/include/uapi/asm/termbits.h
+++ b/arch/parisc/include/uapi/asm/termbits.h
@@ -4,8 +4,8 @@
 
 #include <linux/posix_types.h>
 
-typedef unsigned char	cc_t;
-typedef unsigned int	speed_t;
+#include <asm-generic/termbits-common.h>
+
 typedef unsigned int	tcflag_t;
 
 #define NCCS 19
@@ -61,31 +61,15 @@ struct ktermios {
 
 
 /* c_iflag bits */
-#define IGNBRK	0x00001
-#define BRKINT	0x00002
-#define IGNPAR	0x00004
-#define PARMRK	0x00008
-#define INPCK	0x00010
-#define ISTRIP	0x00020
-#define INLCR	0x00040
-#define IGNCR	0x00080
-#define ICRNL	0x00100
 #define IUCLC	0x00200
 #define IXON	0x00400
-#define IXANY	0x00800
 #define IXOFF	0x01000
 #define IMAXBEL	0x04000
 #define IUTF8	0x08000
 
 /* c_oflag bits */
-#define OPOST	0x00001
 #define OLCUC	0x00002
 #define ONLCR	0x00004
-#define OCRNL	0x00008
-#define ONOCR	0x00010
-#define ONLRET	0x00020
-#define OFILL	0x00040
-#define OFDEL	0x00080
 #define NLDLY	0x00100
 #define   NL0	0x00000
 #define   NL1	0x00100
@@ -112,24 +96,6 @@ struct ktermios {
 
 /* c_cflag bit meaning */
 #define CBAUD		0x0000100f
-#define  B0		0x00000000	/* hang up */
-#define  B50		0x00000001
-#define  B75		0x00000002
-#define  B110		0x00000003
-#define  B134		0x00000004
-#define  B150		0x00000005
-#define  B200		0x00000006
-#define  B300		0x00000007
-#define  B600		0x00000008
-#define  B1200		0x00000009
-#define  B1800		0x0000000a
-#define  B2400		0x0000000b
-#define  B4800		0x0000000c
-#define  B9600		0x0000000d
-#define  B19200		0x0000000e
-#define  B38400		0x0000000f
-#define EXTA B19200
-#define EXTB B38400
 #define CSIZE		0x00000030
 #define   CS5		0x00000000
 #define   CS6		0x00000010
@@ -159,11 +125,6 @@ struct ktermios {
 #define  B3500000	0x0000100e
 #define  B4000000	0x0000100f
 #define CIBAUD		0x100f0000		/* input baud rate */
-#define CMSPAR		0x40000000		/* mark or space (stick) parity */
-#define CRTSCTS		0x80000000		/* flow control */
-
-#define IBSHIFT	16		/* Shift from CBAUD to CIBAUD */
-
 
 /* c_lflag bits */
 #define ISIG	0x00001
@@ -183,17 +144,6 @@ struct ktermios {
 #define IEXTEN	0x08000
 #define EXTPROC	0x10000
 
-/* tcflow() and TCXONC use these */
-#define	TCOOFF		0
-#define	TCOON		1
-#define	TCIOFF		2
-#define	TCION		3
-
-/* tcflush() and TCFLSH use these */
-#define	TCIFLUSH	0
-#define	TCOFLUSH	1
-#define	TCIOFLUSH	2
-
 /* tcsetattr uses these */
 #define	TCSANOW		0
 #define	TCSADRAIN	1
diff --git a/arch/powerpc/include/uapi/asm/termbits.h b/arch/powerpc/include/uapi/asm/termbits.h
index e4892f2d5592..19d1350a80bb 100644
--- a/arch/powerpc/include/uapi/asm/termbits.h
+++ b/arch/powerpc/include/uapi/asm/termbits.h
@@ -9,8 +9,8 @@
  * 2 of the License, or (at your option) any later version.
  */
 
-typedef unsigned char	cc_t;
-typedef unsigned int	speed_t;
+#include <asm-generic/termbits-common.h>
+
 typedef unsigned int	tcflag_t;
 
 /*
@@ -64,33 +64,17 @@ struct ktermios {
 #define VDISCARD	16
 
 /* c_iflag bits */
-#define IGNBRK	0x00001
-#define BRKINT	0x00002
-#define IGNPAR	0x00004
-#define PARMRK	0x00008
-#define INPCK	0x00010
-#define ISTRIP	0x00020
-#define INLCR	0x00040
-#define IGNCR	0x00080
-#define ICRNL	0x00100
 #define IXON	0x00200
 #define IXOFF	0x00400
-#define IXANY	0x00800
 #define IUCLC	0x01000
 #define IMAXBEL	0x02000
 #define	IUTF8	0x04000
 
 /* c_oflag bits */
-#define OPOST	0x00001
 #define ONLCR	0x00002
 #define OLCUC	0x00004
 
-#define OCRNL	0x00008
-#define ONOCR	0x00010
-#define ONLRET	0x00020
 
-#define OFILL	0x000040
-#define OFDEL	0x000080
 #define NLDLY	0x000300
 #define   NL0	0x000000
 #define   NL1	0x000100
@@ -119,24 +103,6 @@ struct ktermios {
 
 /* c_cflag bit meaning */
 #define CBAUD		0x000000ff
-#define  B0		0x00000000	/* hang up */
-#define  B50		0x00000001
-#define  B75		0x00000002
-#define  B110		0x00000003
-#define  B134		0x00000004
-#define  B150		0x00000005
-#define  B200		0x00000006
-#define  B300		0x00000007
-#define  B600		0x00000008
-#define  B1200		0x00000009
-#define  B1800		0x0000000a
-#define  B2400		0x0000000b
-#define  B4800		0x0000000c
-#define  B9600		0x0000000d
-#define  B19200		0x0000000e
-#define  B38400		0x0000000f
-#define  EXTA   B19200
-#define  EXTB   B38400
 #define CBAUDEX		0x00000000
 #define  B57600		0x00000010
 #define  B115200	0x00000011
@@ -156,7 +122,6 @@ struct ktermios {
 #define   BOTHER	0x0000001f
 
 #define CIBAUD		0x00ff0000
-#define IBSHIFT	16		/* Shift from CBAUD to CIBAUD */
 
 #define CSIZE		0x00000300
 #define   CS5		0x00000000
@@ -171,8 +136,6 @@ struct ktermios {
 #define HUPCL		0x00004000
 
 #define CLOCAL		0x00008000
-#define CMSPAR		0x40000000	/* mark or space (stick) parity */
-#define CRTSCTS		0x80000000	/* flow control */
 
 /* c_lflag bits */
 #define ISIG	0x00000080
@@ -192,17 +155,6 @@ struct ktermios {
 #define IEXTEN	0x00000400
 #define EXTPROC	0x10000000
 
-/* Values for the ACTION argument to `tcflow'.  */
-#define	TCOOFF		0
-#define	TCOON		1
-#define	TCIOFF		2
-#define	TCION		3
-
-/* Values for the QUEUE_SELECTOR argument to `tcflush'.  */
-#define	TCIFLUSH	0
-#define	TCOFLUSH	1
-#define	TCIOFLUSH	2
-
 /* Values for the OPTIONAL_ACTIONS argument to `tcsetattr'.  */
 #define	TCSANOW		0
 #define	TCSADRAIN	1
diff --git a/arch/sparc/include/uapi/asm/termbits.h b/arch/sparc/include/uapi/asm/termbits.h
index ce5ad5d0f105..854bdd153cca 100644
--- a/arch/sparc/include/uapi/asm/termbits.h
+++ b/arch/sparc/include/uapi/asm/termbits.h
@@ -4,8 +4,7 @@
 
 #include <linux/posix_types.h>
 
-typedef unsigned char   cc_t;
-typedef unsigned int    speed_t;
+#include <asm-generic/termbits-common.h>
 
 #if defined(__sparc__) && defined(__arch64__)
 typedef unsigned int    tcflag_t;
@@ -90,31 +89,15 @@ struct ktermios {
 #endif
 
 /* c_iflag bits */
-#define IGNBRK	0x00000001
-#define BRKINT	0x00000002
-#define IGNPAR	0x00000004
-#define PARMRK	0x00000008
-#define INPCK	0x00000010
-#define ISTRIP	0x00000020
-#define INLCR	0x00000040
-#define IGNCR	0x00000080
-#define ICRNL	0x00000100
 #define IUCLC	0x00000200
 #define IXON	0x00000400
-#define IXANY	0x00000800
 #define IXOFF	0x00001000
 #define IMAXBEL	0x00002000
 #define IUTF8   0x00004000
 
 /* c_oflag bits */
-#define OPOST	0x00000001
 #define OLCUC	0x00000002
 #define ONLCR	0x00000004
-#define OCRNL	0x00000008
-#define ONOCR	0x00000010
-#define ONLRET	0x00000020
-#define OFILL	0x00000040
-#define OFDEL	0x00000080
 #define NLDLY	0x00000100
 #define   NL0	0x00000000
 #define   NL1	0x00000100
@@ -143,24 +126,6 @@ struct ktermios {
 
 /* c_cflag bit meaning */
 #define CBAUD	  0x0000100f
-#define  B0	  0x00000000   /* hang up */
-#define  B50	  0x00000001
-#define  B75	  0x00000002
-#define  B110	  0x00000003
-#define  B134	  0x00000004
-#define  B150	  0x00000005
-#define  B200	  0x00000006
-#define  B300	  0x00000007
-#define  B600	  0x00000008
-#define  B1200	  0x00000009
-#define  B1800	  0x0000000a
-#define  B2400	  0x0000000b
-#define  B4800	  0x0000000c
-#define  B9600	  0x0000000d
-#define  B19200	  0x0000000e
-#define  B38400	  0x0000000f
-#define EXTA      B19200
-#define EXTB      B38400
 #define  CSIZE    0x00000030
 #define   CS5	  0x00000000
 #define   CS6	  0x00000010
@@ -201,10 +166,6 @@ struct ktermios {
 #define B3500000  0x00001012
 #define B4000000  0x00001013  */
 #define CIBAUD	  0x100f0000  /* input baud rate (not used) */
-#define CMSPAR	  0x40000000  /* mark or space (stick) parity */
-#define CRTSCTS	  0x80000000  /* flow control */
-
-#define IBSHIFT	  16		/* Shift from CBAUD to CIBAUD */
 
 /* c_lflag bits */
 #define ISIG	0x00000001
@@ -244,18 +205,6 @@ struct ktermios {
 /* ioctl (fd, TIOCSERGETLSR, &result) where result may be as below */
 #define TIOCSER_TEMT    0x01	/* Transmitter physically empty */
 
-
-/* tcflow() and TCXONC use these */
-#define	TCOOFF		0
-#define	TCOON		1
-#define	TCIOFF		2
-#define	TCION		3
-
-/* tcflush() and TCFLSH use these */
-#define	TCIFLUSH	0
-#define	TCOFLUSH	1
-#define	TCIOFLUSH	2
-
 /* tcsetattr uses these */
 #define	TCSANOW		0
 #define	TCSADRAIN	1
diff --git a/include/uapi/asm-generic/termbits-common.h b/include/uapi/asm-generic/termbits-common.h
new file mode 100644
index 000000000000..4d084fe8def5
--- /dev/null
+++ b/include/uapi/asm-generic/termbits-common.h
@@ -0,0 +1,65 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+#ifndef __ASM_GENERIC_TERMBITS_COMMON_H
+#define __ASM_GENERIC_TERMBITS_COMMON_H
+
+typedef unsigned char	cc_t;
+typedef unsigned int	speed_t;
+
+/* c_iflag bits */
+#define IGNBRK	0x001			/* Ignore break condition */
+#define BRKINT	0x002			/* Signal interrupt on break */
+#define IGNPAR	0x004			/* Ignore characters with parity errors */
+#define PARMRK	0x008			/* Mark parity and framing errors */
+#define INPCK	0x010			/* Enable input parity check */
+#define ISTRIP	0x020			/* Strip 8th bit off characters */
+#define INLCR	0x040			/* Map NL to CR on input */
+#define IGNCR	0x080			/* Ignore CR */
+#define ICRNL	0x100			/* Map CR to NL on input */
+#define IXANY	0x800			/* Any character will restart after stop */
+
+/* c_oflag bits */
+#define OPOST	0x01			/* Perform output processing */
+#define OCRNL	0x08
+#define ONOCR	0x10
+#define ONLRET	0x20
+#define OFILL	0x40
+#define OFDEL	0x80
+
+/* c_cflag bit meaning */
+/* Common CBAUD rates */
+#define     B0		0x00000000	/* hang up */
+#define    B50		0x00000001
+#define    B75		0x00000002
+#define   B110		0x00000003
+#define   B134		0x00000004
+#define   B150		0x00000005
+#define   B200		0x00000006
+#define   B300		0x00000007
+#define   B600		0x00000008
+#define  B1200		0x00000009
+#define  B1800		0x0000000a
+#define  B2400		0x0000000b
+#define  B4800		0x0000000c
+#define  B9600		0x0000000d
+#define B19200		0x0000000e
+#define B38400		0x0000000f
+#define EXTA		B19200
+#define EXTB		B38400
+
+#define CMSPAR		0x40000000	/* mark or space (stick) parity */
+#define CRTSCTS		0x80000000	/* flow control */
+
+#define IBSHIFT		16		/* Shift from CBAUD to CIBAUD */
+
+/* tcflow() ACTION argument and TCXONC use these */
+#define TCOOFF		0		/* Suspend output */
+#define TCOON		1		/* Restart suspended output */
+#define TCIOFF		2		/* Send a STOP character */
+#define TCION		3		/* Send a START character */
+
+/* tcflush() QUEUE_SELECTOR argument and TCFLSH use these */
+#define TCIFLUSH	0		/* Discard data received but not yet read */
+#define TCOFLUSH	1		/* Discard data written but not yet sent */
+#define TCIOFLUSH	2		/* Discard all pending data */
+
+#endif /* __ASM_GENERIC_TERMBITS_COMMON_H */
diff --git a/include/uapi/asm-generic/termbits.h b/include/uapi/asm-generic/termbits.h
index 470fd673ff84..78a85c326eef 100644
--- a/include/uapi/asm-generic/termbits.h
+++ b/include/uapi/asm-generic/termbits.h
@@ -4,8 +4,8 @@
 
 #include <linux/posix_types.h>
 
-typedef unsigned char	cc_t;
-typedef unsigned int	speed_t;
+#include <asm-generic/termbits-common.h>
+
 typedef unsigned int	tcflag_t;
 
 #define NCCS 19
@@ -60,31 +60,15 @@ struct ktermios {
 #define VEOL2 16
 
 /* c_iflag bits */
-#define IGNBRK	0x00001
-#define BRKINT	0x00002
-#define IGNPAR	0x00004
-#define PARMRK	0x00008
-#define INPCK	0x00010
-#define ISTRIP	0x00020
-#define INLCR	0x00040
-#define IGNCR	0x00080
-#define ICRNL	0x00100
 #define IUCLC	0x00200
 #define IXON	0x00400
-#define IXANY	0x00800
 #define IXOFF	0x01000
 #define IMAXBEL	0x02000
 #define IUTF8	0x04000
 
 /* c_oflag bits */
-#define OPOST	0x00001
 #define OLCUC	0x00002
 #define ONLCR	0x00004
-#define OCRNL	0x00008
-#define ONOCR	0x00010
-#define ONLRET	0x00020
-#define OFILL	0x00040
-#define OFDEL	0x00080
 #define NLDLY	0x00100
 #define   NL0	0x00000
 #define   NL1	0x00100
@@ -111,24 +95,6 @@ struct ktermios {
 
 /* c_cflag bit meaning */
 #define CBAUD		0x0000100f
-#define  B0		0x00000000	/* hang up */
-#define  B50		0x00000001
-#define  B75		0x00000002
-#define  B110		0x00000003
-#define  B134		0x00000004
-#define  B150		0x00000005
-#define  B200		0x00000006
-#define  B300		0x00000007
-#define  B600		0x00000008
-#define  B1200		0x00000009
-#define  B1800		0x0000000a
-#define  B2400		0x0000000b
-#define  B4800		0x0000000c
-#define  B9600		0x0000000d
-#define  B19200		0x0000000e
-#define  B38400		0x0000000f
-#define EXTA B19200
-#define EXTB B38400
 #define CSIZE		0x00000030
 #define   CS5		0x00000000
 #define   CS6		0x00000010
@@ -158,10 +124,6 @@ struct ktermios {
 #define  B3500000	0x0000100e
 #define  B4000000	0x0000100f
 #define CIBAUD		0x100f0000	/* input baud rate */
-#define CMSPAR		0x40000000	/* mark or space (stick) parity */
-#define CRTSCTS		0x80000000	/* flow control */
-
-#define IBSHIFT	  16		/* Shift from CBAUD to CIBAUD */
 
 /* c_lflag bits */
 #define ISIG	0x00001
@@ -181,17 +143,6 @@ struct ktermios {
 #define IEXTEN	0x08000
 #define EXTPROC	0x10000
 
-/* tcflow() and TCXONC use these */
-#define	TCOOFF		0
-#define	TCOON		1
-#define	TCIOFF		2
-#define	TCION		3
-
-/* tcflush() and TCFLSH use these */
-#define	TCIFLUSH	0
-#define	TCOFLUSH	1
-#define	TCIOFLUSH	2
-
 /* tcsetattr uses these */
 #define	TCSANOW		0
 #define	TCSADRAIN	1
-- 
2.30.2

