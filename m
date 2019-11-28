Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 62AAB10CC96
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Nov 2019 17:16:32 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47P2nn4XJxzDqT2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Nov 2019 03:16:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rasmusvillemoes.dk (client-ip=2a00:1450:4864:20::142;
 helo=mail-lf1-x142.google.com; envelope-from=linux@rasmusvillemoes.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=rasmusvillemoes.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk
 header.b="CN9YU6VS"; dkim-atps=neutral
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47P12v1cHQzDqsL
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Nov 2019 01:57:43 +1100 (AEDT)
Received: by mail-lf1-x142.google.com with SMTP id r14so4005121lfm.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Nov 2019 06:57:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wvlhqumPXoiRXhmMPssagicWIgA5Ru8XODiT5R8bOXM=;
 b=CN9YU6VSFbgrBRIOZMJdlo9d5rUqjdT2wqIFqLPh+j3Bd7fr8lxq+FE/m7AmP3su+I
 7MR5CAJ2nm7X5PXVhCs00lycdMHq9J94klGvonaeCudorwMLg/Vn3hI5K71ZCHHcxqs6
 IbUwjtvcOBPy3U6xjdGd3GzWYHwS6nFSCaC/k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wvlhqumPXoiRXhmMPssagicWIgA5Ru8XODiT5R8bOXM=;
 b=YfV6Xz9Z5YyhEkD4bUaju/nyIejmTkQwh9IAOcXQEC5j1MrME5Kh6cZpjuVaMkyCDU
 OaGPwNj8cIBRE5JXHdqdGUOUkp/pqbCoNEIWrERwjgO98eGBAuQT9vUVQqj+409zH+p7
 PgaZrCM4lnP6kus2A6+4bZxciEeHwD1U3mnGxjZr2IcSX8xaFPwfNccCyTGtWPl2HnJM
 sK+5dei88eQjy4VTVwHr1XSfCMw60APKtjn71tzjJzI7uKChqBE6Gzdfr5DuG1UC2xuB
 mgYRc+WCsGScXnW0t5QsdGnLmreU5L9N2USKi2RkI+jdCrlmlL1yMXKk3kEciRP1AU6O
 eMXg==
X-Gm-Message-State: APjAAAW2tD/KqoglVRGsqQuq+SOzGyIOhA4ifUQhxI+6ErZp2pW1Sjuj
 td2xSDRNncZy8SWctay7Rdz57w==
X-Google-Smtp-Source: APXvYqxTcYoUhOuDVYcHwKIcv003EFyL6zJBeWmcabLDUigAcf4SBTlUweyEefVQO8z9dDxQk9TW8Q==
X-Received: by 2002:ac2:5dfa:: with SMTP id z26mr4762609lfq.103.1574953058597; 
 Thu, 28 Nov 2019 06:57:38 -0800 (PST)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id u2sm2456803lfl.18.2019.11.28.06.57.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Nov 2019 06:57:38 -0800 (PST)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v6 26/49] soc: fsl: move cpm.h from powerpc/include/asm to
 include/soc/fsl
Date: Thu, 28 Nov 2019 15:55:31 +0100
Message-Id: <20191128145554.1297-27-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191128145554.1297-1-linux@rasmusvillemoes.dk>
References: <20191128145554.1297-1-linux@rasmusvillemoes.dk>
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
Cc: Timur Tabi <timur@kernel.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 linux-kernel@vger.kernel.org, Scott Wood <oss@buserror.net>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Some drivers, e.g. ucc_uart, need definitions from cpm.h. In order to
allow building those drivers for non-ppc based SOCs, move the header
to include/soc/fsl. For now, leave a trivial wrapper at the old
location so drivers can be updated one by one.

Reviewed-by: Timur Tabi <timur@kernel.org>
Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 arch/powerpc/include/asm/cpm.h | 172 +--------------------------------
 include/soc/fsl/cpm.h          | 171 ++++++++++++++++++++++++++++++++
 2 files changed, 172 insertions(+), 171 deletions(-)
 create mode 100644 include/soc/fsl/cpm.h

diff --git a/arch/powerpc/include/asm/cpm.h b/arch/powerpc/include/asm/cpm.h
index 4c24ea8209bb..ce483b0f8a4d 100644
--- a/arch/powerpc/include/asm/cpm.h
+++ b/arch/powerpc/include/asm/cpm.h
@@ -1,171 +1 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __CPM_H
-#define __CPM_H
-
-#include <linux/compiler.h>
-#include <linux/types.h>
-#include <linux/errno.h>
-#include <linux/of.h>
-#include <soc/fsl/qe/qe.h>
-
-/*
- * SPI Parameter RAM common to QE and CPM.
- */
-struct spi_pram {
-	__be16	rbase;	/* Rx Buffer descriptor base address */
-	__be16	tbase;	/* Tx Buffer descriptor base address */
-	u8	rfcr;	/* Rx function code */
-	u8	tfcr;	/* Tx function code */
-	__be16	mrblr;	/* Max receive buffer length */
-	__be32	rstate;	/* Internal */
-	__be32	rdp;	/* Internal */
-	__be16	rbptr;	/* Internal */
-	__be16	rbc;	/* Internal */
-	__be32	rxtmp;	/* Internal */
-	__be32	tstate;	/* Internal */
-	__be32	tdp;	/* Internal */
-	__be16	tbptr;	/* Internal */
-	__be16	tbc;	/* Internal */
-	__be32	txtmp;	/* Internal */
-	__be32	res;	/* Tx temp. */
-	__be16  rpbase;	/* Relocation pointer (CPM1 only) */
-	__be16	res1;	/* Reserved */
-};
-
-/*
- * USB Controller pram common to QE and CPM.
- */
-struct usb_ctlr {
-	u8	usb_usmod;
-	u8	usb_usadr;
-	u8	usb_uscom;
-	u8	res1[1];
-	__be16	usb_usep[4];
-	u8	res2[4];
-	__be16	usb_usber;
-	u8	res3[2];
-	__be16	usb_usbmr;
-	u8	res4[1];
-	u8	usb_usbs;
-	/* Fields down below are QE-only */
-	__be16	usb_ussft;
-	u8	res5[2];
-	__be16	usb_usfrn;
-	u8	res6[0x22];
-} __attribute__ ((packed));
-
-/*
- * Function code bits, usually generic to devices.
- */
-#ifdef CONFIG_CPM1
-#define CPMFCR_GBL	((u_char)0x00)	/* Flag doesn't exist in CPM1 */
-#define CPMFCR_TC2	((u_char)0x00)	/* Flag doesn't exist in CPM1 */
-#define CPMFCR_DTB	((u_char)0x00)	/* Flag doesn't exist in CPM1 */
-#define CPMFCR_BDB	((u_char)0x00)	/* Flag doesn't exist in CPM1 */
-#else
-#define CPMFCR_GBL	((u_char)0x20)	/* Set memory snooping */
-#define CPMFCR_TC2	((u_char)0x04)	/* Transfer code 2 value */
-#define CPMFCR_DTB	((u_char)0x02)	/* Use local bus for data when set */
-#define CPMFCR_BDB	((u_char)0x01)	/* Use local bus for BD when set */
-#endif
-#define CPMFCR_EB	((u_char)0x10)	/* Set big endian byte order */
-
-/* Opcodes common to CPM1 and CPM2
-*/
-#define CPM_CR_INIT_TRX		((ushort)0x0000)
-#define CPM_CR_INIT_RX		((ushort)0x0001)
-#define CPM_CR_INIT_TX		((ushort)0x0002)
-#define CPM_CR_HUNT_MODE	((ushort)0x0003)
-#define CPM_CR_STOP_TX		((ushort)0x0004)
-#define CPM_CR_GRA_STOP_TX	((ushort)0x0005)
-#define CPM_CR_RESTART_TX	((ushort)0x0006)
-#define CPM_CR_CLOSE_RX_BD	((ushort)0x0007)
-#define CPM_CR_SET_GADDR	((ushort)0x0008)
-#define CPM_CR_SET_TIMER	((ushort)0x0008)
-#define CPM_CR_STOP_IDMA	((ushort)0x000b)
-
-/* Buffer descriptors used by many of the CPM protocols. */
-typedef struct cpm_buf_desc {
-	ushort	cbd_sc;		/* Status and Control */
-	ushort	cbd_datlen;	/* Data length in buffer */
-	uint	cbd_bufaddr;	/* Buffer address in host memory */
-} cbd_t;
-
-/* Buffer descriptor control/status used by serial
- */
-
-#define BD_SC_EMPTY	(0x8000)	/* Receive is empty */
-#define BD_SC_READY	(0x8000)	/* Transmit is ready */
-#define BD_SC_WRAP	(0x2000)	/* Last buffer descriptor */
-#define BD_SC_INTRPT	(0x1000)	/* Interrupt on change */
-#define BD_SC_LAST	(0x0800)	/* Last buffer in frame */
-#define BD_SC_TC	(0x0400)	/* Transmit CRC */
-#define BD_SC_CM	(0x0200)	/* Continuous mode */
-#define BD_SC_ID	(0x0100)	/* Rec'd too many idles */
-#define BD_SC_P		(0x0100)	/* xmt preamble */
-#define BD_SC_BR	(0x0020)	/* Break received */
-#define BD_SC_FR	(0x0010)	/* Framing error */
-#define BD_SC_PR	(0x0008)	/* Parity error */
-#define BD_SC_NAK	(0x0004)	/* NAK - did not respond */
-#define BD_SC_OV	(0x0002)	/* Overrun */
-#define BD_SC_UN	(0x0002)	/* Underrun */
-#define BD_SC_CD	(0x0001)	/* */
-#define BD_SC_CL	(0x0001)	/* Collision */
-
-/* Buffer descriptor control/status used by Ethernet receive.
- * Common to SCC and FCC.
- */
-#define BD_ENET_RX_EMPTY	(0x8000)
-#define BD_ENET_RX_WRAP		(0x2000)
-#define BD_ENET_RX_INTR		(0x1000)
-#define BD_ENET_RX_LAST		(0x0800)
-#define BD_ENET_RX_FIRST	(0x0400)
-#define BD_ENET_RX_MISS		(0x0100)
-#define BD_ENET_RX_BC		(0x0080)	/* FCC Only */
-#define BD_ENET_RX_MC		(0x0040)	/* FCC Only */
-#define BD_ENET_RX_LG		(0x0020)
-#define BD_ENET_RX_NO		(0x0010)
-#define BD_ENET_RX_SH		(0x0008)
-#define BD_ENET_RX_CR		(0x0004)
-#define BD_ENET_RX_OV		(0x0002)
-#define BD_ENET_RX_CL		(0x0001)
-#define BD_ENET_RX_STATS	(0x01ff)	/* All status bits */
-
-/* Buffer descriptor control/status used by Ethernet transmit.
- * Common to SCC and FCC.
- */
-#define BD_ENET_TX_READY	(0x8000)
-#define BD_ENET_TX_PAD		(0x4000)
-#define BD_ENET_TX_WRAP		(0x2000)
-#define BD_ENET_TX_INTR		(0x1000)
-#define BD_ENET_TX_LAST		(0x0800)
-#define BD_ENET_TX_TC		(0x0400)
-#define BD_ENET_TX_DEF		(0x0200)
-#define BD_ENET_TX_HB		(0x0100)
-#define BD_ENET_TX_LC		(0x0080)
-#define BD_ENET_TX_RL		(0x0040)
-#define BD_ENET_TX_RCMASK	(0x003c)
-#define BD_ENET_TX_UN		(0x0002)
-#define BD_ENET_TX_CSL		(0x0001)
-#define BD_ENET_TX_STATS	(0x03ff)	/* All status bits */
-
-/* Buffer descriptor control/status used by Transparent mode SCC.
- */
-#define BD_SCC_TX_LAST		(0x0800)
-
-/* Buffer descriptor control/status used by I2C.
- */
-#define BD_I2C_START		(0x0400)
-
-#ifdef CONFIG_CPM
-int cpm_command(u32 command, u8 opcode);
-#else
-static inline int cpm_command(u32 command, u8 opcode)
-{
-	return -ENOSYS;
-}
-#endif /* CONFIG_CPM */
-
-int cpm2_gpiochip_add32(struct device *dev);
-
-#endif
+#include <soc/fsl/cpm.h>
diff --git a/include/soc/fsl/cpm.h b/include/soc/fsl/cpm.h
new file mode 100644
index 000000000000..4c24ea8209bb
--- /dev/null
+++ b/include/soc/fsl/cpm.h
@@ -0,0 +1,171 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __CPM_H
+#define __CPM_H
+
+#include <linux/compiler.h>
+#include <linux/types.h>
+#include <linux/errno.h>
+#include <linux/of.h>
+#include <soc/fsl/qe/qe.h>
+
+/*
+ * SPI Parameter RAM common to QE and CPM.
+ */
+struct spi_pram {
+	__be16	rbase;	/* Rx Buffer descriptor base address */
+	__be16	tbase;	/* Tx Buffer descriptor base address */
+	u8	rfcr;	/* Rx function code */
+	u8	tfcr;	/* Tx function code */
+	__be16	mrblr;	/* Max receive buffer length */
+	__be32	rstate;	/* Internal */
+	__be32	rdp;	/* Internal */
+	__be16	rbptr;	/* Internal */
+	__be16	rbc;	/* Internal */
+	__be32	rxtmp;	/* Internal */
+	__be32	tstate;	/* Internal */
+	__be32	tdp;	/* Internal */
+	__be16	tbptr;	/* Internal */
+	__be16	tbc;	/* Internal */
+	__be32	txtmp;	/* Internal */
+	__be32	res;	/* Tx temp. */
+	__be16  rpbase;	/* Relocation pointer (CPM1 only) */
+	__be16	res1;	/* Reserved */
+};
+
+/*
+ * USB Controller pram common to QE and CPM.
+ */
+struct usb_ctlr {
+	u8	usb_usmod;
+	u8	usb_usadr;
+	u8	usb_uscom;
+	u8	res1[1];
+	__be16	usb_usep[4];
+	u8	res2[4];
+	__be16	usb_usber;
+	u8	res3[2];
+	__be16	usb_usbmr;
+	u8	res4[1];
+	u8	usb_usbs;
+	/* Fields down below are QE-only */
+	__be16	usb_ussft;
+	u8	res5[2];
+	__be16	usb_usfrn;
+	u8	res6[0x22];
+} __attribute__ ((packed));
+
+/*
+ * Function code bits, usually generic to devices.
+ */
+#ifdef CONFIG_CPM1
+#define CPMFCR_GBL	((u_char)0x00)	/* Flag doesn't exist in CPM1 */
+#define CPMFCR_TC2	((u_char)0x00)	/* Flag doesn't exist in CPM1 */
+#define CPMFCR_DTB	((u_char)0x00)	/* Flag doesn't exist in CPM1 */
+#define CPMFCR_BDB	((u_char)0x00)	/* Flag doesn't exist in CPM1 */
+#else
+#define CPMFCR_GBL	((u_char)0x20)	/* Set memory snooping */
+#define CPMFCR_TC2	((u_char)0x04)	/* Transfer code 2 value */
+#define CPMFCR_DTB	((u_char)0x02)	/* Use local bus for data when set */
+#define CPMFCR_BDB	((u_char)0x01)	/* Use local bus for BD when set */
+#endif
+#define CPMFCR_EB	((u_char)0x10)	/* Set big endian byte order */
+
+/* Opcodes common to CPM1 and CPM2
+*/
+#define CPM_CR_INIT_TRX		((ushort)0x0000)
+#define CPM_CR_INIT_RX		((ushort)0x0001)
+#define CPM_CR_INIT_TX		((ushort)0x0002)
+#define CPM_CR_HUNT_MODE	((ushort)0x0003)
+#define CPM_CR_STOP_TX		((ushort)0x0004)
+#define CPM_CR_GRA_STOP_TX	((ushort)0x0005)
+#define CPM_CR_RESTART_TX	((ushort)0x0006)
+#define CPM_CR_CLOSE_RX_BD	((ushort)0x0007)
+#define CPM_CR_SET_GADDR	((ushort)0x0008)
+#define CPM_CR_SET_TIMER	((ushort)0x0008)
+#define CPM_CR_STOP_IDMA	((ushort)0x000b)
+
+/* Buffer descriptors used by many of the CPM protocols. */
+typedef struct cpm_buf_desc {
+	ushort	cbd_sc;		/* Status and Control */
+	ushort	cbd_datlen;	/* Data length in buffer */
+	uint	cbd_bufaddr;	/* Buffer address in host memory */
+} cbd_t;
+
+/* Buffer descriptor control/status used by serial
+ */
+
+#define BD_SC_EMPTY	(0x8000)	/* Receive is empty */
+#define BD_SC_READY	(0x8000)	/* Transmit is ready */
+#define BD_SC_WRAP	(0x2000)	/* Last buffer descriptor */
+#define BD_SC_INTRPT	(0x1000)	/* Interrupt on change */
+#define BD_SC_LAST	(0x0800)	/* Last buffer in frame */
+#define BD_SC_TC	(0x0400)	/* Transmit CRC */
+#define BD_SC_CM	(0x0200)	/* Continuous mode */
+#define BD_SC_ID	(0x0100)	/* Rec'd too many idles */
+#define BD_SC_P		(0x0100)	/* xmt preamble */
+#define BD_SC_BR	(0x0020)	/* Break received */
+#define BD_SC_FR	(0x0010)	/* Framing error */
+#define BD_SC_PR	(0x0008)	/* Parity error */
+#define BD_SC_NAK	(0x0004)	/* NAK - did not respond */
+#define BD_SC_OV	(0x0002)	/* Overrun */
+#define BD_SC_UN	(0x0002)	/* Underrun */
+#define BD_SC_CD	(0x0001)	/* */
+#define BD_SC_CL	(0x0001)	/* Collision */
+
+/* Buffer descriptor control/status used by Ethernet receive.
+ * Common to SCC and FCC.
+ */
+#define BD_ENET_RX_EMPTY	(0x8000)
+#define BD_ENET_RX_WRAP		(0x2000)
+#define BD_ENET_RX_INTR		(0x1000)
+#define BD_ENET_RX_LAST		(0x0800)
+#define BD_ENET_RX_FIRST	(0x0400)
+#define BD_ENET_RX_MISS		(0x0100)
+#define BD_ENET_RX_BC		(0x0080)	/* FCC Only */
+#define BD_ENET_RX_MC		(0x0040)	/* FCC Only */
+#define BD_ENET_RX_LG		(0x0020)
+#define BD_ENET_RX_NO		(0x0010)
+#define BD_ENET_RX_SH		(0x0008)
+#define BD_ENET_RX_CR		(0x0004)
+#define BD_ENET_RX_OV		(0x0002)
+#define BD_ENET_RX_CL		(0x0001)
+#define BD_ENET_RX_STATS	(0x01ff)	/* All status bits */
+
+/* Buffer descriptor control/status used by Ethernet transmit.
+ * Common to SCC and FCC.
+ */
+#define BD_ENET_TX_READY	(0x8000)
+#define BD_ENET_TX_PAD		(0x4000)
+#define BD_ENET_TX_WRAP		(0x2000)
+#define BD_ENET_TX_INTR		(0x1000)
+#define BD_ENET_TX_LAST		(0x0800)
+#define BD_ENET_TX_TC		(0x0400)
+#define BD_ENET_TX_DEF		(0x0200)
+#define BD_ENET_TX_HB		(0x0100)
+#define BD_ENET_TX_LC		(0x0080)
+#define BD_ENET_TX_RL		(0x0040)
+#define BD_ENET_TX_RCMASK	(0x003c)
+#define BD_ENET_TX_UN		(0x0002)
+#define BD_ENET_TX_CSL		(0x0001)
+#define BD_ENET_TX_STATS	(0x03ff)	/* All status bits */
+
+/* Buffer descriptor control/status used by Transparent mode SCC.
+ */
+#define BD_SCC_TX_LAST		(0x0800)
+
+/* Buffer descriptor control/status used by I2C.
+ */
+#define BD_I2C_START		(0x0400)
+
+#ifdef CONFIG_CPM
+int cpm_command(u32 command, u8 opcode);
+#else
+static inline int cpm_command(u32 command, u8 opcode)
+{
+	return -ENOSYS;
+}
+#endif /* CONFIG_CPM */
+
+int cpm2_gpiochip_add32(struct device *dev);
+
+#endif
-- 
2.23.0

