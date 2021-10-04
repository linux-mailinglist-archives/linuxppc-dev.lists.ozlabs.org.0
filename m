Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A31B8421A2A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 00:35:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNbCN4HZjz304y
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 09:35:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=DCLTSaQ0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102f;
 helo=mail-pj1-x102f.google.com; envelope-from=naveennaidu479@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=DCLTSaQ0; dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNT6n2YKGz2xfD
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Oct 2021 05:01:21 +1100 (AEDT)
Received: by mail-pj1-x102f.google.com with SMTP id ls18so2027194pjb.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Oct 2021 11:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=B7sq5HEJs5lGnG+J8tujUids2AjtGM7weFegW7/rlp0=;
 b=DCLTSaQ07PyQGYWXH1+2Xsfdvw5DGV/I8XtRyOJbPaLb7kUI5hE9bZs5tBKfKfnEZv
 yJWA9rYnr0brHhmOMVeV+trr2fiBrUYwjSZbYSZwDmP9r/JS76OU6s/3AdycKZWfYTFw
 CIclJY0tQH0UeDsZcm6RtmrZGNXAT160EC6VgsC9hOtIq0iSkaWcZ0KkM1D96wVVTdxM
 U+yKA9jvbDs9v12WOHtt4EpvmMzklJn+8vLlgMBPU0VuViSjzLx2CwTYViJ73cL/+5xP
 vGqSeNgUdhH7az1nnmJYLp6QV6XxCG8nLT0xkZmBoClJDUKZ/T4ZfTcgZV5MYU4BQyQC
 CewA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B7sq5HEJs5lGnG+J8tujUids2AjtGM7weFegW7/rlp0=;
 b=ACyDxeGtP1/swUrcGypeiCq1KPB8wFRCkWREanK8Jeyvg9CTJ/3oY8N74gjsptAGqi
 TUm02uvnR83zpIUq/k9aOwMJdXu0dPcLIjK5OOZUKiyoVOH1rVU9eINipzyg98kozGfd
 CDvbLJ2d1XVghYx0r41dzmUepZt9eBixVRMr+fAvv3ALSarKHyEU8OFCxlBttRoAhd8L
 G387VXB/xStuPlivdT3GVmx7FFrGz+zvhtSNHank9FDeHmm1Cw8KZ17udICJEK3sqHM+
 V0nWsapgIrCTk/7g8d+xDtnQMNQ6cbunqHk/p9Cl/Gr5NsiO04gpJR252lNzD7MtScl1
 jr0g==
X-Gm-Message-State: AOAM5323sPxWqGCNxpd5x2CxQgABNH6fDLqX1dGkCv7Ibe6mMhY0JHS7
 BFUxZ49k7amExtHA0RUSzis=
X-Google-Smtp-Source: ABdhPJxqQ1dbB0F5R2hGORk15/5zZpFg9rCi0DkVZQ7y0tE2wiTwWP4DlAOal+8YQvciNlfn7Vn2pw==
X-Received: by 2002:a17:902:a503:b029:12b:2429:385e with SMTP id
 s3-20020a170902a503b029012b2429385emr966754plq.64.1633370478701; 
 Mon, 04 Oct 2021 11:01:18 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:e8f0:c2a7:3579:5fe8:31d9])
 by smtp.gmail.com with ESMTPSA id
 z2sm3641004pfe.210.2021.10.04.11.01.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 11:01:18 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com, tsbogend@alpha.franken.de, ruscur@russell.cc,
 oohall@gmail.com
Subject: [PATCH 1/6] PCI/AER: Enable COR/UNCOR error reporting in
 set_device_error_reporting()
Date: Mon,  4 Oct 2021 23:29:27 +0530
Message-Id: <b583172ece1fb1dab3d75c6007ec8c443323158d.1633369560.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1633369560.git.naveennaidu479@gmail.com>
References: <cover.1633369560.git.naveennaidu479@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 05 Oct 2021 09:16:56 +1100
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
Cc: linux-pci@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 Naveen Naidu <naveennaidu479@gmail.com>, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The (PCIe r5.0, sec 7.6.4.3, Table 7-101) and  (PCIe r5.0, sec 7.8.4.6,
Table 7-104) states that the default values for the Uncorrectable Error
Mask and Correctable Error Mask should be 0b. But the current code does
not set the default value of these registers when the PCIe bus loads the
AER service driver.

Enable reporting of all correctable and uncorrectable errors during
aer_probe()

Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
---
 drivers/pci/pcie/aer.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index 9784fdcf3006..88c4ca6098fb 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -1212,6 +1212,7 @@ static int set_device_error_reporting(struct pci_dev *dev, void *data)
 {
 	bool enable = *((bool *)data);
 	int type = pci_pcie_type(dev);
+	int aer = dev->aer_cap;
 
 	if ((type == PCI_EXP_TYPE_ROOT_PORT) ||
 	    (type == PCI_EXP_TYPE_RC_EC) ||
@@ -1223,8 +1224,18 @@ static int set_device_error_reporting(struct pci_dev *dev, void *data)
 			pci_disable_pcie_error_reporting(dev);
 	}
 
-	if (enable)
+	if (enable) {
+
+		/* Enable reporting of all uncorrectable errors */
+		/* Uncorrectable Error Mask - turned on bits disable errors */
+		pci_write_config_dword(dev, aer + PCI_ERR_UNCOR_MASK, 0);
+
+		/* Enable reporting of all correctable errors */
+		/* Correctable Error Mask - turned on bits disable errors */
+		pci_write_config_dword(dev, aer + PCI_ERR_COR_MASK, 0);
+
 		pcie_set_ecrc_checking(dev);
+	}
 
 	return 0;
 }
-- 
2.25.1

