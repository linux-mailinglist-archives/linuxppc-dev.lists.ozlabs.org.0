Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D6EC410CCCE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Nov 2019 17:25:53 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47P30Z6ncHzDr5N
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Nov 2019 03:25:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rasmusvillemoes.dk (client-ip=2a00:1450:4864:20::243;
 helo=mail-lj1-x243.google.com; envelope-from=linux@rasmusvillemoes.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=rasmusvillemoes.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk
 header.b="Dwl4dqLd"; dkim-atps=neutral
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47P1302hq3zDqsL
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Nov 2019 01:57:48 +1100 (AEDT)
Received: by mail-lj1-x243.google.com with SMTP id k8so18299213ljh.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Nov 2019 06:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PS8hZ/FNZ5fnmFnMC7wpuYE5CME6gqxRCzSgU7yOKOk=;
 b=Dwl4dqLdHHKnldphnAGAr1ToN610EqBZwSqoR/hgQSNxfsV/4wXOcOzAUM9uz6FotW
 9qwt38QjaaeFHldetsUOgPoIM24I2pCcWdKTSDI7nv8y8op+zapWHlf8st+tVkHCz7P5
 bh30cwYMxpmBmbI75/QPPKlSxYLuOhMWYJifE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PS8hZ/FNZ5fnmFnMC7wpuYE5CME6gqxRCzSgU7yOKOk=;
 b=QLeLT8gIxrCP4x06LN8jm/cXjLmUbGB65X5qnlm5iY3/U23sLRndtkvqsqVw0S1OBn
 j9Qet7QmisFz4N0EOM4PAEMy/7VfIZ9rmF+yoaj83goueXaxiw6QjL8RvrfOBFGUYhmx
 aa4Cn5wiP4lVQ3KU7lQQw/1Kg189f590oCz2x61B0lVpE6TADK2RhMvdtPJRVBNPdg3/
 sqb64lQ4bwnjuWXwH+prFzY0XMkCddIA3uVAyohr5s5Ysxm6DxekMgPVYZ1we78xp9nQ
 mOg1+JBku0vowEJ7fSN53Lae540EfupOto3SoFhLha/m9g/GsG9qZUV4KnvZjbClqKMu
 /w2g==
X-Gm-Message-State: APjAAAXFaMoesJ+boQdG2vOwWWtJ8d+HuxPcY3LgA837UbXvZRGNjSgl
 wDUcdWlSWW55ke0XyZ/O5+Vd3g==
X-Google-Smtp-Source: APXvYqxr+KXWNUM6J8K1e3cWke7H28D8dBWc6wxWxJZiGdbp/JimSWw2nVOwCFqjHzoiT5BiVmBGsA==
X-Received: by 2002:a2e:3e08:: with SMTP id l8mr5147340lja.236.1574953064981; 
 Thu, 28 Nov 2019 06:57:44 -0800 (PST)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id u2sm2456803lfl.18.2019.11.28.06.57.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Nov 2019 06:57:44 -0800 (PST)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v6 30/49] serial: ucc_uart: factor out soft_uart initialization
Date: Thu, 28 Nov 2019 15:55:35 +0100
Message-Id: <20191128145554.1297-31-linux@rasmusvillemoes.dk>
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
 linux-serial@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The "soft uart" mechanism is a workaround for a silicon bug which (as
far as I know) only affects some PPC-based SOCs.

The code that determines which microcode blob to request relies on
some powerpc-specific bits (e.g. the mfspr(SPRN_SVR) and hence also
the asm/reg.h header). This makes it a little awkward to allow this
driver to be built for non-PPC based SOCs with a QE, even if they are
not affected by that silicon bug and thus don't need any of the Soft
UART logic.

There's no way around guarding those bits with some ifdeffery, so to
keep that isolated, factor out the
do-we-need-soft-uart-and-if-so-handle-the-firmware to a separate
function, which we can then easily stub out for non-PPC.

Reviewed-by: Timur Tabi <timur@kernel.org>
Acked-by: Timur Tabi <timur@kernel.org>
Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 drivers/tty/serial/ucc_uart.c | 110 ++++++++++++++++++----------------
 1 file changed, 58 insertions(+), 52 deletions(-)

diff --git a/drivers/tty/serial/ucc_uart.c b/drivers/tty/serial/ucc_uart.c
index 8a378ee5d34f..f286e91714cb 100644
--- a/drivers/tty/serial/ucc_uart.c
+++ b/drivers/tty/serial/ucc_uart.c
@@ -1183,70 +1183,76 @@ static void uart_firmware_cont(const struct firmware *fw, void *context)
 	release_firmware(fw);
 }
 
-static int ucc_uart_probe(struct platform_device *ofdev)
+static int soft_uart_init(struct platform_device *ofdev)
 {
 	struct device_node *np = ofdev->dev.of_node;
-	const unsigned int *iprop;      /* Integer OF properties */
-	const char *sprop;      /* String OF properties */
-	struct uart_qe_port *qe_port = NULL;
-	struct resource res;
+	struct qe_firmware_info *qe_fw_info;
 	int ret;
 
-	/*
-	 * Determine if we need Soft-UART mode
-	 */
 	if (of_find_property(np, "soft-uart", NULL)) {
 		dev_dbg(&ofdev->dev, "using Soft-UART mode\n");
 		soft_uart = 1;
+	} else {
+		return 0;
 	}
 
-	/*
-	 * If we are using Soft-UART, determine if we need to upload the
-	 * firmware, too.
-	 */
-	if (soft_uart) {
-		struct qe_firmware_info *qe_fw_info;
-
-		qe_fw_info = qe_get_firmware_info();
-
-		/* Check if the firmware has been uploaded. */
-		if (qe_fw_info && strstr(qe_fw_info->id, "Soft-UART")) {
-			firmware_loaded = 1;
-		} else {
-			char filename[32];
-			unsigned int soc;
-			unsigned int rev_h;
-			unsigned int rev_l;
-
-			soc = soc_info(&rev_h, &rev_l);
-			if (!soc) {
-				dev_err(&ofdev->dev, "unknown CPU model\n");
-				return -ENXIO;
-			}
-			sprintf(filename, "fsl_qe_ucode_uart_%u_%u%u.bin",
-				soc, rev_h, rev_l);
-
-			dev_info(&ofdev->dev, "waiting for firmware %s\n",
-				filename);
+	qe_fw_info = qe_get_firmware_info();
 
-			/*
-			 * We call request_firmware_nowait instead of
-			 * request_firmware so that the driver can load and
-			 * initialize the ports without holding up the rest of
-			 * the kernel.  If hotplug support is enabled in the
-			 * kernel, then we use it.
-			 */
-			ret = request_firmware_nowait(THIS_MODULE,
-				FW_ACTION_HOTPLUG, filename, &ofdev->dev,
-				GFP_KERNEL, &ofdev->dev, uart_firmware_cont);
-			if (ret) {
-				dev_err(&ofdev->dev,
-					"could not load firmware %s\n",
-					filename);
-				return ret;
-			}
+	/* Check if the firmware has been uploaded. */
+	if (qe_fw_info && strstr(qe_fw_info->id, "Soft-UART")) {
+		firmware_loaded = 1;
+	} else {
+		char filename[32];
+		unsigned int soc;
+		unsigned int rev_h;
+		unsigned int rev_l;
+
+		soc = soc_info(&rev_h, &rev_l);
+		if (!soc) {
+			dev_err(&ofdev->dev, "unknown CPU model\n");
+			return -ENXIO;
+		}
+		sprintf(filename, "fsl_qe_ucode_uart_%u_%u%u.bin",
+			soc, rev_h, rev_l);
+
+		dev_info(&ofdev->dev, "waiting for firmware %s\n",
+			 filename);
+
+		/*
+		 * We call request_firmware_nowait instead of
+		 * request_firmware so that the driver can load and
+		 * initialize the ports without holding up the rest of
+		 * the kernel.  If hotplug support is enabled in the
+		 * kernel, then we use it.
+		 */
+		ret = request_firmware_nowait(THIS_MODULE,
+					      FW_ACTION_HOTPLUG, filename, &ofdev->dev,
+					      GFP_KERNEL, &ofdev->dev, uart_firmware_cont);
+		if (ret) {
+			dev_err(&ofdev->dev,
+				"could not load firmware %s\n",
+				filename);
+			return ret;
 		}
 	}
+	return 0;
+}
+
+static int ucc_uart_probe(struct platform_device *ofdev)
+{
+	struct device_node *np = ofdev->dev.of_node;
+	const unsigned int *iprop;      /* Integer OF properties */
+	const char *sprop;      /* String OF properties */
+	struct uart_qe_port *qe_port = NULL;
+	struct resource res;
+	int ret;
+
+	/*
+	 * Determine if we need Soft-UART mode
+	 */
+	ret = soft_uart_init(ofdev);
+	if (ret)
+		return ret;
 
 	qe_port = kzalloc(sizeof(struct uart_qe_port), GFP_KERNEL);
 	if (!qe_port) {
-- 
2.23.0

