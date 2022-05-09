Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B33A451F852
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 May 2022 11:38:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kxbgq5643z3cLf
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 May 2022 19:37:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GY0YdynW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=ilpo.jarvinen@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=GY0YdynW; dkim-atps=neutral
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kxbdq5ffCz3byl
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 May 2022 19:36:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652088975; x=1683624975;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=arouB8mgqwzEZAp6BFZV/OOehMWNwJG4YFeLCHeENb4=;
 b=GY0YdynWV0a9B5H/5KifxxOPnjLeTD7M9KwXJyD9KqsbBmacLJ1x8cPJ
 xArMBMndkBQ4XPlOa4i0O9GeOlA0HXOVeiGsn6PTePX7NYT6Jk4LPCzlk
 bew3XWrjniQIfVcXvbNKi20Dy/+kHmGWAGy2GWCYkOQE3ab23ozDepStM
 sskPvx6VLSli4jRX28arjqvY9Lb+MYoRYmzrnb/4IRvgiaDxXWLmuxcfJ
 hfJb1i65dEXUcvhc98Zsp4qXDm9i+zB2hxsWedNi0+khTAuLxEQBsAwPw
 DZ84KRY0mjcKZZlBHdB7Rcgi54+AfqPNHXZYHnPcaMDjy8D607j9sp3us Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10341"; a="249533336"
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="249533336"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 02:35:13 -0700
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="564969606"
Received: from mfuent2x-mobl1.amr.corp.intel.com (HELO
 ijarvine-MOBL2.ger.corp.intel.com) ([10.251.220.67])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 02:35:07 -0700
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
Subject: [PATCH 2/3] termbits.h: Align lines & format
Date: Mon,  9 May 2022 12:34:45 +0300
Message-Id: <20220509093446.6677-3-ilpo.jarvinen@linux.intel.com>
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

- Align c_cc defines.
- Remove extra newlines.
- Realign & adjust number of leading zeros.
- Reorder c_cflag defines to ascending order
- Make comment ending shorted (=remove period and one extra space from
  the comments in mips).

Co-developed-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 arch/alpha/include/uapi/asm/termbits.h   | 130 +++++++++---------
 arch/mips/include/uapi/asm/termbits.h    | 156 ++++++++++-----------
 arch/parisc/include/uapi/asm/termbits.h  |  77 +++++------
 arch/powerpc/include/uapi/asm/termbits.h | 100 +++++++-------
 arch/sparc/include/uapi/asm/termbits.h   | 168 +++++++++++------------
 include/uapi/asm-generic/termbits.h      |  76 +++++-----
 6 files changed, 346 insertions(+), 361 deletions(-)

diff --git a/arch/alpha/include/uapi/asm/termbits.h b/arch/alpha/include/uapi/asm/termbits.h
index 3c7a9afc4333..735e9ffe2795 100644
--- a/arch/alpha/include/uapi/asm/termbits.h
+++ b/arch/alpha/include/uapi/asm/termbits.h
@@ -53,60 +53,58 @@ struct ktermios {
 };
 
 /* c_cc characters */
-#define VEOF 0
-#define VEOL 1
-#define VEOL2 2
-#define VERASE 3
-#define VWERASE 4
-#define VKILL 5
-#define VREPRINT 6
-#define VSWTC 7
-#define VINTR 8
-#define VQUIT 9
-#define VSUSP 10
-#define VSTART 12
-#define VSTOP 13
-#define VLNEXT 14
-#define VDISCARD 15
-#define VMIN 16
-#define VTIME 17
+#define VEOF		 0
+#define VEOL		 1
+#define VEOL2		 2
+#define VERASE		 3
+#define VWERASE		 4
+#define VKILL		 5
+#define VREPRINT	 6
+#define VSWTC		 7
+#define VINTR		 8
+#define VQUIT		 9
+#define VSUSP		10
+#define VSTART		12
+#define VSTOP		13
+#define VLNEXT		14
+#define VDISCARD	15
+#define VMIN		16
+#define VTIME		17
 
 /* c_iflag bits */
-#define IXON	0x00200
-#define IXOFF	0x00400
-#define IUCLC	0x01000
-#define IMAXBEL	0x02000
-#define IUTF8	0x04000
+#define IXON	0x0200
+#define IXOFF	0x0400
+#define IUCLC	0x1000
+#define IMAXBEL	0x2000
+#define IUTF8	0x4000
 
 /* c_oflag bits */
 #define ONLCR	0x00002
 #define OLCUC	0x00004
-
-
-#define NLDLY	0x000300
-#define   NL0	0x000000
-#define   NL1	0x000100
-#define   NL2	0x000200
-#define   NL3	0x000300
-#define TABDLY	0x000c00
-#define   TAB0	0x000000
-#define   TAB1	0x000400
-#define   TAB2	0x000800
-#define   TAB3	0x000c00
-#define CRDLY	0x003000
-#define   CR0	0x000000
-#define   CR1	0x001000
-#define   CR2	0x002000
-#define   CR3	0x003000
-#define FFDLY	0x004000
-#define   FF0	0x000000
-#define   FF1	0x004000
-#define BSDLY	0x008000
-#define   BS0	0x000000
-#define   BS1	0x008000
-#define VTDLY	0x010000
-#define   VT0	0x000000
-#define   VT1	0x010000
+#define NLDLY	0x00300
+#define   NL0	0x00000
+#define   NL1	0x00100
+#define   NL2	0x00200
+#define   NL3	0x00300
+#define TABDLY	0x00c00
+#define   TAB0	0x00000
+#define   TAB1	0x00400
+#define   TAB2	0x00800
+#define   TAB3	0x00c00
+#define CRDLY	0x03000
+#define   CR0	0x00000
+#define   CR1	0x01000
+#define   CR2	0x02000
+#define   CR3	0x03000
+#define FFDLY	0x04000
+#define   FF0	0x00000
+#define   FF1	0x04000
+#define BSDLY	0x08000
+#define   BS0	0x00000
+#define   BS1	0x08000
+#define VTDLY	0x10000
+#define   VT0	0x00000
+#define   VT1	0x10000
 /*
  * Should be equivalent to TAB3, see description of TAB3 in
  * POSIX.1-2008, Ch. 11.2.3 "Output Modes"
@@ -116,38 +114,34 @@ struct ktermios {
 /* c_cflag bit meaning */
 #define CBAUD		0x0000001f
 #define CBAUDEX		0x00000000
-#define  B57600		0x00000010
-#define  B115200	0x00000011
-#define  B230400	0x00000012
-#define  B460800	0x00000013
-#define  B500000	0x00000014
-#define  B576000	0x00000015
-#define  B921600	0x00000016
-#define B1000000	0x00000017
-#define B1152000	0x00000018
-#define B1500000	0x00000019
-#define B2000000	0x0000001a
-#define B2500000	0x0000001b
-#define B3000000	0x0000001c
-#define B3500000	0x0000001d
-#define B4000000	0x0000001e
 #define BOTHER		0x0000001f
-
+#define     B57600	0x00000010
+#define    B115200	0x00000011
+#define    B230400	0x00000012
+#define    B460800	0x00000013
+#define    B500000	0x00000014
+#define    B576000	0x00000015
+#define    B921600	0x00000016
+#define   B1000000	0x00000017
+#define   B1152000	0x00000018
+#define   B1500000	0x00000019
+#define   B2000000	0x0000001a
+#define   B2500000	0x0000001b
+#define   B3000000	0x0000001c
+#define   B3500000	0x0000001d
+#define   B4000000	0x0000001e
 #define CSIZE		0x00000300
 #define   CS5		0x00000000
 #define   CS6		0x00000100
 #define   CS7		0x00000200
 #define   CS8		0x00000300
-
 #define CSTOPB		0x00000400
 #define CREAD		0x00000800
 #define PARENB		0x00001000
 #define PARODD		0x00002000
 #define HUPCL		0x00004000
-
 #define CLOCAL		0x00008000
-
-#define CIBAUD		0x1f0000
+#define CIBAUD		0x001f0000
 
 /* c_lflag bits */
 #define ISIG	0x00000080
diff --git a/arch/mips/include/uapi/asm/termbits.h b/arch/mips/include/uapi/asm/termbits.h
index b33f514315ce..8fa3e79d4f94 100644
--- a/arch/mips/include/uapi/asm/termbits.h
+++ b/arch/mips/include/uapi/asm/termbits.h
@@ -15,7 +15,7 @@
 
 #include <asm-generic/termbits-common.h>
 
-typedef unsigned int tcflag_t;
+typedef unsigned int	tcflag_t;
 
 /*
  * The ABI says nothing about NCC but seems to use NCCS as
@@ -54,64 +54,64 @@ struct ktermios {
 };
 
 /* c_cc characters */
-#define VINTR		 0		/* Interrupt character [ISIG].	*/
-#define VQUIT		 1		/* Quit character [ISIG].  */
-#define VERASE		 2		/* Erase character [ICANON].  */
-#define VKILL		 3		/* Kill-line character [ICANON].  */
-#define VMIN		 4		/* Minimum number of bytes read at once [!ICANON].  */
-#define VTIME		 5		/* Time-out value (tenths of a second) [!ICANON].  */
-#define VEOL2		 6		/* Second EOL character [ICANON].  */
+#define VINTR		 0		/* Interrupt character [ISIG] */
+#define VQUIT		 1		/* Quit character [ISIG] */
+#define VERASE		 2		/* Erase character [ICANON] */
+#define VKILL		 3		/* Kill-line character [ICANON] */
+#define VMIN		 4		/* Minimum number of bytes read at once [!ICANON] */
+#define VTIME		 5		/* Time-out value (tenths of a second) [!ICANON] */
+#define VEOL2		 6		/* Second EOL character [ICANON] */
 #define VSWTC		 7		/* ??? */
 #define VSWTCH		VSWTC
-#define VSTART		 8		/* Start (X-ON) character [IXON, IXOFF].  */
-#define VSTOP		 9		/* Stop (X-OFF) character [IXON, IXOFF].  */
-#define VSUSP		10		/* Suspend character [ISIG].  */
+#define VSTART		 8		/* Start (X-ON) character [IXON, IXOFF] */
+#define VSTOP		 9		/* Stop (X-OFF) character [IXON, IXOFF] */
+#define VSUSP		10		/* Suspend character [ISIG] */
 #if 0
 /*
  * VDSUSP is not supported
  */
-#define VDSUSP		11		/* Delayed suspend character [ISIG].  */
+#define VDSUSP		11		/* Delayed suspend character [ISIG] */
 #endif
-#define VREPRINT	12		/* Reprint-line character [ICANON].  */
-#define VDISCARD	13		/* Discard character [IEXTEN].	*/
-#define VWERASE		14		/* Word-erase character [ICANON].  */
-#define VLNEXT		15		/* Literal-next character [IEXTEN].  */
-#define VEOF		16		/* End-of-file character [ICANON].  */
-#define VEOL		17		/* End-of-line character [ICANON].  */
+#define VREPRINT	12		/* Reprint-line character [ICANON] */
+#define VDISCARD	13		/* Discard character [IEXTEN] */
+#define VWERASE		14		/* Word-erase character [ICANON] */
+#define VLNEXT		15		/* Literal-next character [IEXTEN] */
+#define VEOF		16		/* End-of-file character [ICANON] */
+#define VEOL		17		/* End-of-line character [ICANON] */
 
 /* c_iflag bits */
-#define IUCLC	0x00200		/* Map upper case to lower case on input.  */
-#define IXON	0x00400		/* Enable start/stop output control.  */
-#define IXOFF	0x01000		/* Enable start/stop input control.  */
-#define IMAXBEL	0x02000		/* Ring bell when input queue is full.	*/
-#define IUTF8	0x04000		/* Input is UTF-8 */
+#define IUCLC	0x0200		/* Map upper case to lower case on input */
+#define IXON	0x0400		/* Enable start/stop output control */
+#define IXOFF	0x1000		/* Enable start/stop input control */
+#define IMAXBEL	0x2000		/* Ring bell when input queue is full */
+#define IUTF8	0x4000		/* Input is UTF-8 */
 
 /* c_oflag bits */
-#define OLCUC	0x00002		/* Map lower case to upper case on output.  */
-#define ONLCR	0x00004		/* Map NL to CR-NL on output.  */
+#define OLCUC	0x00002		/* Map lower case to upper case on output */
+#define ONLCR	0x00004		/* Map NL to CR-NL on output */
 #define NLDLY	0x00100
-#define	  NL0	0x00000
-#define	  NL1	0x00100
+#define   NL0	0x00000
+#define   NL1	0x00100
 #define CRDLY	0x00600
-#define	  CR0	0x00000
-#define	  CR1	0x00200
-#define	  CR2	0x00400
-#define	  CR3	0x00600
+#define   CR0	0x00000
+#define   CR1	0x00200
+#define   CR2	0x00400
+#define   CR3	0x00600
 #define TABDLY	0x01800
-#define	  TAB0	0x00000
-#define	  TAB1	0x00800
-#define	  TAB2	0x01000
-#define	  TAB3	0x01800
-#define	  XTABS	0x01800
+#define   TAB0	0x00000
+#define   TAB1	0x00800
+#define   TAB2	0x01000
+#define   TAB3	0x01800
+#define   XTABS	0x01800
 #define BSDLY	0x02000
-#define	  BS0	0x00000
-#define	  BS1	0x02000
+#define   BS0	0x00000
+#define   BS1	0x02000
 #define VTDLY	0x04000
-#define	  VT0	0x00000
-#define	  VT1	0x04000
+#define   VT0	0x00000
+#define   VT1	0x04000
 #define FFDLY	0x08000
-#define	  FF0	0x00000
-#define	  FF1	0x08000
+#define   FF0	0x00000
+#define   FF1	0x08000
 /*
 #define PAGEOUT ???
 #define WRAP	???
@@ -120,10 +120,10 @@ struct ktermios {
 /* c_cflag bit meaning */
 #define CBAUD		0x0000100f
 #define CSIZE		0x00000030	/* Number of bits per byte (mask) */
-#define	  CS5		0x00000000	/* 5 bits per byte */
-#define	  CS6		0x00000010	/* 6 bits per byte */
-#define	  CS7		0x00000020	/* 7 bits per byte */
-#define	  CS8		0x00000030	/* 8 bits per byte */
+#define   CS5		0x00000000	/* 5 bits per byte */
+#define   CS6		0x00000010	/* 6 bits per byte */
+#define   CS7		0x00000020	/* 7 bits per byte */
+#define   CS8		0x00000030	/* 8 bits per byte */
 #define CSTOPB		0x00000040	/* Two stop bits instead of one */
 #define CREAD		0x00000080	/* Enable receiver */
 #define PARENB		0x00000100	/* Parity enable */
@@ -131,40 +131,40 @@ struct ktermios {
 #define HUPCL		0x00000400	/* Hang up on last close */
 #define CLOCAL		0x00000800	/* Ignore modem status lines */
 #define CBAUDEX		0x00001000
-#define	   BOTHER	0x00001000
-#define	   B57600	0x00001001
-#define	  B115200	0x00001002
-#define	  B230400	0x00001003
-#define	  B460800	0x00001004
-#define	  B500000	0x00001005
-#define	  B576000	0x00001006
-#define	  B921600	0x00001007
-#define	 B1000000	0x00001008
-#define	 B1152000	0x00001009
-#define	 B1500000	0x0000100a
-#define	 B2000000	0x0000100b
-#define	 B2500000	0x0000100c
-#define	 B3000000	0x0000100d
-#define	 B3500000	0x0000100e
-#define	 B4000000	0x0000100f
+#define BOTHER		0x00001000
+#define     B57600	0x00001001
+#define    B115200	0x00001002
+#define    B230400	0x00001003
+#define    B460800	0x00001004
+#define    B500000	0x00001005
+#define    B576000	0x00001006
+#define    B921600	0x00001007
+#define   B1000000	0x00001008
+#define   B1152000	0x00001009
+#define   B1500000	0x0000100a
+#define   B2000000	0x0000100b
+#define   B2500000	0x0000100c
+#define   B3000000	0x0000100d
+#define   B3500000	0x0000100e
+#define   B4000000	0x0000100f
 #define CIBAUD		0x100f0000	/* input baud rate */
 
 /* c_lflag bits */
-#define ISIG	0x00001		/* Enable signals.  */
-#define ICANON	0x00002		/* Do erase and kill processing.  */
+#define ISIG	0x00001		/* Enable signals */
+#define ICANON	0x00002		/* Do erase and kill processing */
 #define XCASE	0x00004
-#define ECHO	0x00008		/* Enable echo.	 */
-#define ECHOE	0x00010		/* Visual erase for ERASE.  */
-#define ECHOK	0x00020		/* Echo NL after KILL.	*/
-#define ECHONL	0x00040		/* Echo NL even if ECHO is off.	 */
-#define NOFLSH	0x00080		/* Disable flush after interrupt.  */
-#define IEXTEN	0x00100		/* Enable DISCARD and LNEXT.  */
-#define ECHOCTL	0x00200		/* Echo control characters as ^X.  */
-#define ECHOPRT	0x00400		/* Hardcopy visual erase.  */
-#define ECHOKE	0x00800		/* Visual erase for KILL.  */
+#define ECHO	0x00008		/* Enable echo */
+#define ECHOE	0x00010		/* Visual erase for ERASE */
+#define ECHOK	0x00020		/* Echo NL after KILL */
+#define ECHONL	0x00040		/* Echo NL even if ECHO is off */
+#define NOFLSH	0x00080		/* Disable flush after interrupt */
+#define IEXTEN	0x00100		/* Enable DISCARD and LNEXT */
+#define ECHOCTL	0x00200		/* Echo control characters as ^X */
+#define ECHOPRT	0x00400		/* Hardcopy visual erase */
+#define ECHOKE	0x00800		/* Visual erase for KILL */
 #define FLUSHO	0x02000
-#define PENDIN	0x04000		/* Retype pending input (state).  */
-#define TOSTOP	0x08000		/* Send SIGTTOU for background output.	*/
+#define PENDIN	0x04000		/* Retype pending input (state) */
+#define TOSTOP	0x08000		/* Send SIGTTOU for background output */
 #define ITOSTOP	TOSTOP
 #define EXTPROC	0x10000		/* External processing on pty */
 
@@ -172,8 +172,8 @@ struct ktermios {
 #define TIOCSER_TEMT	0x01	/* Transmitter physically empty */
 
 /* tcsetattr uses these */
-#define TCSANOW		TCSETS	/* Change immediately.	*/
-#define TCSADRAIN	TCSETSW /* Change when pending output is written.  */
-#define TCSAFLUSH	TCSETSF /* Flush pending input before changing.	 */
+#define TCSANOW		TCSETS	/* Change immediately */
+#define TCSADRAIN	TCSETSW /* Change when pending output is written */
+#define TCSAFLUSH	TCSETSF /* Flush pending input before changing */
 
 #endif /* _ASM_TERMBITS_H */
diff --git a/arch/parisc/include/uapi/asm/termbits.h b/arch/parisc/include/uapi/asm/termbits.h
index 7f74a822b7ea..d72c5ebf3a3a 100644
--- a/arch/parisc/include/uapi/asm/termbits.h
+++ b/arch/parisc/include/uapi/asm/termbits.h
@@ -41,31 +41,30 @@ struct ktermios {
 };
 
 /* c_cc characters */
-#define VINTR 0
-#define VQUIT 1
-#define VERASE 2
-#define VKILL 3
-#define VEOF 4
-#define VTIME 5
-#define VMIN 6
-#define VSWTC 7
-#define VSTART 8
-#define VSTOP 9
-#define VSUSP 10
-#define VEOL 11
-#define VREPRINT 12
-#define VDISCARD 13
-#define VWERASE 14
-#define VLNEXT 15
-#define VEOL2 16
-
+#define VINTR		 0
+#define VQUIT		 1
+#define VERASE		 2
+#define VKILL		 3
+#define VEOF		 4
+#define VTIME		 5
+#define VMIN		 6
+#define VSWTC		 7
+#define VSTART		 8
+#define VSTOP		 9
+#define VSUSP		10
+#define VEOL		11
+#define VREPRINT	12
+#define VDISCARD	13
+#define VWERASE		14
+#define VLNEXT		15
+#define VEOL2		16
 
 /* c_iflag bits */
-#define IUCLC	0x00200
-#define IXON	0x00400
-#define IXOFF	0x01000
-#define IMAXBEL	0x04000
-#define IUTF8	0x08000
+#define IUCLC	0x0200
+#define IXON	0x0400
+#define IXOFF	0x1000
+#define IMAXBEL	0x4000
+#define IUTF8	0x8000
 
 /* c_oflag bits */
 #define OLCUC	0x00002
@@ -108,22 +107,22 @@ struct ktermios {
 #define HUPCL		0x00000400
 #define CLOCAL		0x00000800
 #define CBAUDEX		0x00001000
-#define    BOTHER	0x00001000
-#define    B57600	0x00001001
-#define   B115200	0x00001002
-#define   B230400	0x00001003
-#define   B460800	0x00001004
-#define   B500000	0x00001005
-#define   B576000	0x00001006
-#define   B921600	0x00001007
-#define  B1000000	0x00001008
-#define  B1152000	0x00001009
-#define  B1500000	0x0000100a
-#define  B2000000	0x0000100b
-#define  B2500000	0x0000100c
-#define  B3000000	0x0000100d
-#define  B3500000	0x0000100e
-#define  B4000000	0x0000100f
+#define BOTHER		0x00001000
+#define     B57600	0x00001001
+#define    B115200	0x00001002
+#define    B230400	0x00001003
+#define    B460800	0x00001004
+#define    B500000	0x00001005
+#define    B576000	0x00001006
+#define    B921600	0x00001007
+#define   B1000000	0x00001008
+#define   B1152000	0x00001009
+#define   B1500000	0x0000100a
+#define   B2000000	0x0000100b
+#define   B2500000	0x0000100c
+#define   B3000000	0x0000100d
+#define   B3500000	0x0000100e
+#define   B4000000	0x0000100f
 #define CIBAUD		0x100f0000		/* input baud rate */
 
 /* c_lflag bits */
diff --git a/arch/powerpc/include/uapi/asm/termbits.h b/arch/powerpc/include/uapi/asm/termbits.h
index 19d1350a80bb..21dc86dcb2f1 100644
--- a/arch/powerpc/include/uapi/asm/termbits.h
+++ b/arch/powerpc/include/uapi/asm/termbits.h
@@ -64,78 +64,72 @@ struct ktermios {
 #define VDISCARD	16
 
 /* c_iflag bits */
-#define IXON	0x00200
-#define IXOFF	0x00400
-#define IUCLC	0x01000
-#define IMAXBEL	0x02000
-#define	IUTF8	0x04000
+#define IXON	0x0200
+#define IXOFF	0x0400
+#define IUCLC	0x1000
+#define IMAXBEL	0x2000
+#define IUTF8	0x4000
 
 /* c_oflag bits */
 #define ONLCR	0x00002
 #define OLCUC	0x00004
-
-
-#define NLDLY	0x000300
-#define   NL0	0x000000
-#define   NL1	0x000100
-#define   NL2	0x000200
-#define   NL3	0x000300
-#define TABDLY	0x000c00
-#define   TAB0	0x000000
-#define   TAB1	0x000400
-#define   TAB2	0x000800
-#define   TAB3	0x000c00
-#define   XTABS	0x000c00	/* required by POSIX to == TAB3 */
-#define CRDLY	0x003000
-#define   CR0	0x000000
-#define   CR1	0x001000
-#define   CR2	0x002000
-#define   CR3	0x003000
-#define FFDLY	0x004000
-#define   FF0	0x000000
-#define   FF1	0x004000
-#define BSDLY	0x008000
-#define   BS0	0x000000
-#define   BS1	0x008000
-#define VTDLY	0x010000
-#define   VT0	0x000000
-#define   VT1	0x010000
+#define NLDLY	0x00300
+#define   NL0	0x00000
+#define   NL1	0x00100
+#define   NL2	0x00200
+#define   NL3	0x00300
+#define TABDLY	0x00c00
+#define   TAB0	0x00000
+#define   TAB1	0x00400
+#define   TAB2	0x00800
+#define   TAB3	0x00c00
+#define   XTABS	0x00c00		/* required by POSIX to == TAB3 */
+#define CRDLY	0x03000
+#define   CR0	0x00000
+#define   CR1	0x01000
+#define   CR2	0x02000
+#define   CR3	0x03000
+#define FFDLY	0x04000
+#define   FF0	0x00000
+#define   FF1	0x04000
+#define BSDLY	0x08000
+#define   BS0	0x00000
+#define   BS1	0x08000
+#define VTDLY	0x10000
+#define   VT0	0x00000
+#define   VT1	0x10000
 
 /* c_cflag bit meaning */
 #define CBAUD		0x000000ff
 #define CBAUDEX		0x00000000
-#define  B57600		0x00000010
-#define  B115200	0x00000011
-#define  B230400	0x00000012
-#define  B460800	0x00000013
-#define  B500000	0x00000014
-#define  B576000	0x00000015
-#define  B921600	0x00000016
-#define B1000000	0x00000017
-#define B1152000	0x00000018
-#define B1500000	0x00000019
-#define B2000000	0x0000001a
-#define B2500000	0x0000001b
-#define B3000000	0x0000001c
-#define B3500000	0x0000001d
-#define B4000000	0x0000001e
-#define   BOTHER	0x0000001f
-
-#define CIBAUD		0x00ff0000
-
+#define BOTHER		0x0000001f
+#define    B57600	0x00000010
+#define   B115200	0x00000011
+#define   B230400	0x00000012
+#define   B460800	0x00000013
+#define   B500000	0x00000014
+#define   B576000	0x00000015
+#define   B921600	0x00000016
+#define  B1000000	0x00000017
+#define  B1152000	0x00000018
+#define  B1500000	0x00000019
+#define  B2000000	0x0000001a
+#define  B2500000	0x0000001b
+#define  B3000000	0x0000001c
+#define  B3500000	0x0000001d
+#define  B4000000	0x0000001e
 #define CSIZE		0x00000300
 #define   CS5		0x00000000
 #define   CS6		0x00000100
 #define   CS7		0x00000200
 #define   CS8		0x00000300
-
 #define CSTOPB		0x00000400
 #define CREAD		0x00000800
 #define PARENB		0x00001000
 #define PARODD		0x00002000
 #define HUPCL		0x00004000
-
 #define CLOCAL		0x00008000
+#define CIBAUD		0x00ff0000
 
 /* c_lflag bits */
 #define ISIG	0x00000080
diff --git a/arch/sparc/include/uapi/asm/termbits.h b/arch/sparc/include/uapi/asm/termbits.h
index 854bdd153cca..cfcc4e07ce51 100644
--- a/arch/sparc/include/uapi/asm/termbits.h
+++ b/arch/sparc/include/uapi/asm/termbits.h
@@ -7,9 +7,9 @@
 #include <asm-generic/termbits-common.h>
 
 #if defined(__sparc__) && defined(__arch64__)
-typedef unsigned int    tcflag_t;
+typedef unsigned int	tcflag_t;
 #else
-typedef unsigned long   tcflag_t;
+typedef unsigned long	tcflag_t;
 #endif
 
 #define NCC 8
@@ -60,21 +60,19 @@ struct ktermios {
 };
 
 /* c_cc characters */
-#define VINTR    0
-#define VQUIT    1
-#define VERASE   2
-#define VKILL    3
-#define VEOF     4
-#define VEOL     5
-#define VEOL2    6
-#define VSWTC    7
-#define VSTART   8
-#define VSTOP    9
-
-
+#define VINTR     0
+#define VQUIT     1
+#define VERASE    2
+#define VKILL     3
+#define VEOF      4
+#define VEOL      5
+#define VEOL2     6
+#define VSWTC     7
+#define VSTART    8
+#define VSTOP     9
 
 #define VSUSP    10
-#define VDSUSP   11  /* SunOS POSIX nicety I do believe... */
+#define VDSUSP   11		/* SunOS POSIX nicety I do believe... */
 #define VREPRINT 12
 #define VDISCARD 13
 #define VWERASE  14
@@ -89,83 +87,83 @@ struct ktermios {
 #endif
 
 /* c_iflag bits */
-#define IUCLC	0x00000200
-#define IXON	0x00000400
-#define IXOFF	0x00001000
-#define IMAXBEL	0x00002000
-#define IUTF8   0x00004000
+#define IUCLC	0x0200
+#define IXON	0x0400
+#define IXOFF	0x1000
+#define IMAXBEL	0x2000
+#define IUTF8   0x4000
 
 /* c_oflag bits */
-#define OLCUC	0x00000002
-#define ONLCR	0x00000004
-#define NLDLY	0x00000100
-#define   NL0	0x00000000
-#define   NL1	0x00000100
-#define CRDLY	0x00000600
-#define   CR0	0x00000000
-#define   CR1	0x00000200
-#define   CR2	0x00000400
-#define   CR3	0x00000600
-#define TABDLY	0x00001800
-#define   TAB0	0x00000000
-#define   TAB1	0x00000800
-#define   TAB2	0x00001000
-#define   TAB3	0x00001800
-#define   XTABS	0x00001800
-#define BSDLY	0x00002000
-#define   BS0	0x00000000
-#define   BS1	0x00002000
-#define VTDLY	0x00004000
-#define   VT0	0x00000000
-#define   VT1	0x00004000
-#define FFDLY	0x00008000
-#define   FF0	0x00000000
-#define   FF1	0x00008000
-#define PAGEOUT 0x00010000  /* SUNOS specific */
-#define WRAP    0x00020000  /* SUNOS specific */
+#define OLCUC	0x00002
+#define ONLCR	0x00004
+#define NLDLY	0x00100
+#define   NL0	0x00000
+#define   NL1	0x00100
+#define CRDLY	0x00600
+#define   CR0	0x00000
+#define   CR1	0x00200
+#define   CR2	0x00400
+#define   CR3	0x00600
+#define TABDLY	0x01800
+#define   TAB0	0x00000
+#define   TAB1	0x00800
+#define   TAB2	0x01000
+#define   TAB3	0x01800
+#define   XTABS	0x01800
+#define BSDLY	0x02000
+#define   BS0	0x00000
+#define   BS1	0x02000
+#define VTDLY	0x04000
+#define   VT0	0x00000
+#define   VT1	0x04000
+#define FFDLY	0x08000
+#define   FF0	0x00000
+#define   FF1	0x08000
+#define PAGEOUT 0x10000			/* SUNOS specific */
+#define WRAP    0x20000			/* SUNOS specific */
 
 /* c_cflag bit meaning */
-#define CBAUD	  0x0000100f
-#define  CSIZE    0x00000030
-#define   CS5	  0x00000000
-#define   CS6	  0x00000010
-#define   CS7	  0x00000020
-#define   CS8	  0x00000030
-#define CSTOPB	  0x00000040
-#define CREAD	  0x00000080
-#define PARENB	  0x00000100
-#define PARODD	  0x00000200
-#define HUPCL	  0x00000400
-#define CLOCAL	  0x00000800
-#define CBAUDEX   0x00001000
+#define CBAUD		0x0000100f
+#define CSIZE		0x00000030
+#define   CS5		0x00000000
+#define   CS6		0x00000010
+#define   CS7		0x00000020
+#define   CS8		0x00000030
+#define CSTOPB		0x00000040
+#define CREAD		0x00000080
+#define PARENB		0x00000100
+#define PARODD		0x00000200
+#define HUPCL		0x00000400
+#define CLOCAL		0x00000800
+#define CBAUDEX		0x00001000
 /* We'll never see these speeds with the Zilogs, but for completeness... */
-#define  BOTHER   0x00001000
-#define  B57600   0x00001001
-#define  B115200  0x00001002
-#define  B230400  0x00001003
-#define  B460800  0x00001004
+#define BOTHER		0x00001000
+#define     B57600	0x00001001
+#define    B115200	0x00001002
+#define    B230400	0x00001003
+#define    B460800	0x00001004
 /* This is what we can do with the Zilogs. */
-#define  B76800   0x00001005
+#define     B76800	0x00001005
 /* This is what we can do with the SAB82532. */
-#define  B153600  0x00001006
-#define  B307200  0x00001007
-#define  B614400  0x00001008
-#define  B921600  0x00001009
+#define    B153600	0x00001006
+#define    B307200	0x00001007
+#define    B614400	0x00001008
+#define    B921600	0x00001009
 /* And these are the rest... */
-#define  B500000  0x0000100a
-#define  B576000  0x0000100b
-#define B1000000  0x0000100c
-#define B1152000  0x0000100d
-#define B1500000  0x0000100e
-#define B2000000  0x0000100f
+#define    B500000	0x0000100a
+#define    B576000	0x0000100b
+#define   B1000000	0x0000100c
+#define   B1152000	0x0000100d
+#define   B1500000	0x0000100e
+#define   B2000000	0x0000100f
 /* These have totally bogus values and nobody uses them
    so far. Later on we'd have to use say 0x10000x and
    adjust CBAUD constant and drivers accordingly.
-#define B2500000  0x00001010
-#define B3000000  0x00001011
-#define B3500000  0x00001012
-#define B4000000  0x00001013  */
-#define CIBAUD	  0x100f0000  /* input baud rate (not used) */
+#define   B2500000	0x00001010
+#define   B3000000	0x00001011
+#define   B3500000	0x00001012
+#define   B4000000	0x00001013 */
+#define CIBAUD		0x100f0000	/* input baud rate (not used) */
 
 /* c_lflag bits */
 #define ISIG	0x00000001
@@ -180,7 +178,7 @@ struct ktermios {
 #define ECHOCTL	0x00000200
 #define ECHOPRT	0x00000400
 #define ECHOKE	0x00000800
-#define DEFECHO 0x00001000  /* SUNOS thing, what is it? */
+#define DEFECHO 0x00001000		/* SUNOS thing, what is it? */
 #define FLUSHO	0x00002000
 #define PENDIN	0x00004000
 #define IEXTEN	0x00008000
@@ -206,8 +204,8 @@ struct ktermios {
 #define TIOCSER_TEMT    0x01	/* Transmitter physically empty */
 
 /* tcsetattr uses these */
-#define	TCSANOW		0
-#define	TCSADRAIN	1
-#define	TCSAFLUSH	2
+#define TCSANOW		0
+#define TCSADRAIN	1
+#define TCSAFLUSH	2
 
 #endif /* _UAPI_SPARC_TERMBITS_H */
diff --git a/include/uapi/asm-generic/termbits.h b/include/uapi/asm-generic/termbits.h
index 78a85c326eef..c92179563289 100644
--- a/include/uapi/asm-generic/termbits.h
+++ b/include/uapi/asm-generic/termbits.h
@@ -41,30 +41,30 @@ struct ktermios {
 };
 
 /* c_cc characters */
-#define VINTR 0
-#define VQUIT 1
-#define VERASE 2
-#define VKILL 3
-#define VEOF 4
-#define VTIME 5
-#define VMIN 6
-#define VSWTC 7
-#define VSTART 8
-#define VSTOP 9
-#define VSUSP 10
-#define VEOL 11
-#define VREPRINT 12
-#define VDISCARD 13
-#define VWERASE 14
-#define VLNEXT 15
-#define VEOL2 16
+#define VINTR		 0
+#define VQUIT		 1
+#define VERASE		 2
+#define VKILL		 3
+#define VEOF		 4
+#define VTIME		 5
+#define VMIN		 6
+#define VSWTC		 7
+#define VSTART		 8
+#define VSTOP		 9
+#define VSUSP		10
+#define VEOL		11
+#define VREPRINT	12
+#define VDISCARD	13
+#define VWERASE		14
+#define VLNEXT		15
+#define VEOL2		16
 
 /* c_iflag bits */
-#define IUCLC	0x00200
-#define IXON	0x00400
-#define IXOFF	0x01000
-#define IMAXBEL	0x02000
-#define IUTF8	0x04000
+#define IUCLC	0x0200
+#define IXON	0x0400
+#define IXOFF	0x1000
+#define IMAXBEL	0x2000
+#define IUTF8	0x4000
 
 /* c_oflag bits */
 #define OLCUC	0x00002
@@ -107,22 +107,22 @@ struct ktermios {
 #define HUPCL		0x00000400
 #define CLOCAL		0x00000800
 #define CBAUDEX		0x00001000
-#define    BOTHER	0x00001000
-#define    B57600	0x00001001
-#define   B115200	0x00001002
-#define   B230400	0x00001003
-#define   B460800	0x00001004
-#define   B500000	0x00001005
-#define   B576000	0x00001006
-#define   B921600	0x00001007
-#define  B1000000	0x00001008
-#define  B1152000	0x00001009
-#define  B1500000	0x0000100a
-#define  B2000000	0x0000100b
-#define  B2500000	0x0000100c
-#define  B3000000	0x0000100d
-#define  B3500000	0x0000100e
-#define  B4000000	0x0000100f
+#define BOTHER		0x00001000
+#define     B57600	0x00001001
+#define    B115200	0x00001002
+#define    B230400	0x00001003
+#define    B460800	0x00001004
+#define    B500000	0x00001005
+#define    B576000	0x00001006
+#define    B921600	0x00001007
+#define   B1000000	0x00001008
+#define   B1152000	0x00001009
+#define   B1500000	0x0000100a
+#define   B2000000	0x0000100b
+#define   B2500000	0x0000100c
+#define   B3000000	0x0000100d
+#define   B3500000	0x0000100e
+#define   B4000000	0x0000100f
 #define CIBAUD		0x100f0000	/* input baud rate */
 
 /* c_lflag bits */
-- 
2.30.2

