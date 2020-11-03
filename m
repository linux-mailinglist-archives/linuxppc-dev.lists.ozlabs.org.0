Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 565702A3BBD
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 06:19:35 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CQJ4M5CF4zDqD8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 16:19:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=DI9WvxbX; dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CQHzk25cYzDqYL
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Nov 2020 16:15:28 +1100 (AEDT)
Received: by mail-pl1-x644.google.com with SMTP id p4so688115plr.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Nov 2020 21:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/8SIl9t4EdzHmTbWoJI841YI1z4iRoVO0uV2E5/2YaI=;
 b=DI9WvxbXiVJQrGfLgCL9j/d2RB14rxTiXGlrN+OHhr9ylkeFh1p2e8S1jd5MPbkPeJ
 7GNIoMTBb4DqxfkZaWOzJFglIOzToxMc3qZRnIy6aSeM9oLv7t5H5jKugvA/906iX48I
 s6w9RAC/zHDPSvu8yQ8FFri80DVPSMvV13oeoyo1xDzKhlrwRCfTPhZJGndBCDCPO7ME
 zDA41XMFrlP0GEBZhPFG2LIDMi8rRVpEFOwbbpwRf8X1mYQ8f7b4t2+1YKpdqwkERbkG
 Xxzhs00N7ZZ71u9torAVZlcm1Qg2CochIKLAY4rtigq1rQMCwfvlbACw6A9Ds40v0VMv
 bhAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/8SIl9t4EdzHmTbWoJI841YI1z4iRoVO0uV2E5/2YaI=;
 b=VIcKdFGBfNYkrlZ6pl6BJDAp9cEz2AX0DAa/ZXIc9md1VoED7lWJJ5n5pBICoKE40J
 oHZYlH8Pzd+d92HvoYu0L6lMz4mn3MTRNczH02UFoNn7Cvor7biTlK1iniCqsg7vWalI
 YqwKxkby+QCgY2SfP2zIazGIneXsibugvC+U4epyp5csOjgKJM2ZkyzjdsCK4be0XTxu
 uMwxrDhITJ49bGFjCCNd2OqWqXJhSyyTORGPyBQGlCBQlkp26wjW5+xJoqadDzRLpB4i
 mFDfyY919VOkjSn/TXtxttwFDqKw9X17WJJv9K9MPyqyvg3Ys2FXr0iEdTnXelGM1hBz
 ycWg==
X-Gm-Message-State: AOAM532IvWKYy+girTlSYQJiFL1eq1GVHyoC4xUEga33CMMVJ8VvKWzk
 uVTxtCr6FsTmMIfyu0gyy7qOfxdLaYM=
X-Google-Smtp-Source: ABdhPJzBOUQt1GqbG9fPE/YDnqpOiKRtfdvdS35q5K+ygQYevI8MDeLxcooopbwRWSdfW4TbXQCPaQ==
X-Received: by 2002:a17:902:c152:b029:d6:33a:c46f with SMTP id
 18-20020a170902c152b02900d6033ac46fmr24514229plj.38.1604380524549; 
 Mon, 02 Nov 2020 21:15:24 -0800 (PST)
Received: from wafer.ozlabs.ibm.com.ozlabs.ibm.com
 (110-175-254-242.static.tpgi.com.au. [110.175.254.242])
 by smtp.gmail.com with ESMTPSA id 26sm4225357pgm.92.2020.11.02.21.15.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 21:15:24 -0800 (PST)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/2] powerpc/eeh: Add a debugfs interface to check if a driver
 supports recovery
Date: Tue,  3 Nov 2020 16:15:12 +1100
Message-Id: <20201103051512.919333-2-oohall@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201103051512.919333-1-oohall@gmail.com>
References: <20201103051512.919333-1-oohall@gmail.com>
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
Cc: Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

If a PCI device's current driver implements the error handling callbacks
EEH can use them to recover the device after an error occurs. For devices
without the error handling callbacks we recover them by removing the device
and re-scanning it so the PCI core puts the device back into a known good
state.

Currently there's no way for userspace to determine if the driver supports
recovery or not which makes it difficult to write automated tests for EEH.
This patch addressing that by adding a debugfs interface for querying if
a specific device can be recovered or not.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/kernel/eeh.c | 50 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
index f9182ff57804..cd60bc1c8701 100644
--- a/arch/powerpc/kernel/eeh.c
+++ b/arch/powerpc/kernel/eeh.c
@@ -1868,6 +1868,53 @@ static const struct file_operations eeh_dev_break_fops = {
 	.read   = eeh_debugfs_dev_usage,
 };
 
+static ssize_t eeh_dev_can_recover(struct file *filp,
+				   const char __user *user_buf,
+				   size_t count, loff_t *ppos)
+{
+	struct pci_driver *drv;
+	struct pci_dev *pdev;
+	size_t ret;
+
+	pdev = eeh_debug_lookup_pdev(filp, user_buf, count, ppos);
+	if (IS_ERR(pdev))
+		return PTR_ERR(pdev);
+
+	/*
+	 * In order for error recovery to work the driver needs to implement
+	 * .error_detected(), so it can quiesce IO to the device, and
+	 * .slot_reset() so it can re-initialise the device after a reset.
+	 *
+	 * Ideally they'd implement .resume() too, but some drivers which
+	 * we need to support (notably IPR) don't so I guess we can tolerate
+	 * that.
+	 *
+	 * .mmio_enabled() is mostly there as a work-around for devices which
+	 * take forever to re-init after a hot reset. Implementing that is
+	 * strictly optional.
+	 */
+	drv = pci_dev_driver(pdev);
+	if (drv &&
+	    drv->err_handler &&
+	    drv->err_handler->error_detected &&
+	    drv->err_handler->slot_reset) {
+		ret = count;
+	} else {
+		ret = -EOPNOTSUPP;
+	}
+
+	pci_dev_put(pdev);
+
+	return ret;
+}
+
+static const struct file_operations eeh_dev_can_recover_fops = {
+	.open	= simple_open,
+	.llseek	= no_llseek,
+	.write	= eeh_dev_can_recover,
+	.read   = eeh_debugfs_dev_usage,
+};
+
 #endif
 
 static int __init eeh_init_proc(void)
@@ -1892,6 +1939,9 @@ static int __init eeh_init_proc(void)
 		debugfs_create_file_unsafe("eeh_force_recover", 0600,
 				powerpc_debugfs_root, NULL,
 				&eeh_force_recover_fops);
+		debugfs_create_file_unsafe("eeh_dev_can_recover", 0600,
+				powerpc_debugfs_root, NULL,
+				&eeh_dev_can_recover_fops);
 		eeh_cache_debugfs_init();
 #endif
 	}
-- 
2.26.2

