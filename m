Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AAA4587628
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Aug 2022 06:09:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LxhML0DXzz3c69
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Aug 2022 14:09:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=rpCpGLlL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::102d; helo=mail-pj1-x102d.google.com; envelope-from=chenzhuo.1@bytedance.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=rpCpGLlL;
	dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LxhLk0H52z2xGw
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Aug 2022 14:08:43 +1000 (AEST)
Received: by mail-pj1-x102d.google.com with SMTP id p14-20020a17090a74ce00b001f4d04492faso7920538pjl.4
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 Aug 2022 21:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=qt2lrz7hBi6/NHKhZYMSJYVUWY56n9uxWwwqraR3638=;
        b=rpCpGLlLp7TBtQ479cZ7kwRr9lCjE+DaLznlPfNFZu01VkPz1WwcASUTwlw1Bweluo
         jXkYKLsDxBsWEDMBp73X7qDXF1L60OJeyvIuShjF/k1o1KeTPFOxyxlNd3PquLOKnJkH
         +5ymXZtQ9nLxD0+xsUB3xAHJXC/8116SdFPoQOeOcpBZjPGsokL66mz3v+M9IJ07peAL
         CQRZfNAU5xFYMCWJldyjxal32EFt0rOJWA8XHb/NY6E0OToq1QINeBh9zcJpZD1DWQHw
         LdIe1ckvpddfm5pqA18mn0Ti5O9Ri29pmza/EvlfqtfdRHicttKir5eRMXZpz55MXpdJ
         ybjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=qt2lrz7hBi6/NHKhZYMSJYVUWY56n9uxWwwqraR3638=;
        b=Fehl/ZpAzCdKgeyU8IN/JFiHLIK4zafjWxl1zo6le3zyHJ4LNh7J8sHur+fYqRXU96
         XRLXrhaB0j+OqSW2+d1DwPWoHlFK9FS9a+1nubfAJsketR8FQ1IHWQ/Rn9bLgwcw9NHh
         DAQdvQ40vAVwR/D1TLtYMzDfQzsAlxTh4cDFggr6AoTY/8aBrpT8GvoMYqf/aJerXhkV
         gQXAbIRuPqALWtlAQPqR7KywU4OtA32fvNB6SybNKa3FnsE3QIsz7UeqVWzlPkgHH2ZQ
         gAJvN9RrwzEZhPvN9QLW2gT4FtvDVl78/z1HB/adKvxBNx8V7M35sQwOtZIv6esoNYAg
         DAGw==
X-Gm-Message-State: ACgBeo1toMKfoEYSn5wUQyOrZuoqe7Q4piHqto9xVgvoIUVe+Duger1T
	2nSi7LoPAl/TXIx6dzoSRy/QXQ==
X-Google-Smtp-Source: AA6agR5cH95rwmZABqpRvDzA2yYBgzz7vgM9rP0eLpQPg/wXljKfQHFd3F9EZLzviOll+6w4XaXFIw==
X-Received: by 2002:a17:902:e5c3:b0:16e:d968:634e with SMTP id u3-20020a170902e5c300b0016ed968634emr11974551plf.80.1659413319426;
        Mon, 01 Aug 2022 21:08:39 -0700 (PDT)
Received: from C02F63J9MD6R.bytedance.net ([61.120.150.78])
        by smtp.gmail.com with ESMTPSA id m18-20020a63f612000000b003fba1a97c49sm8238014pgh.61.2022.08.01.21.08.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Aug 2022 21:08:39 -0700 (PDT)
From: Zhuo Chen <chenzhuo.1@bytedance.com>
To: ruscur@russell.cc,
	oohall@gmail.com,
	bhelgaas@google.com,
	sathyanarayanan.kuppuswamy@linux.intel.com
Subject: [PATCH v4] PCI/ERR: Use pcie_aer_is_native() to judge whether OS owns AER
Date: Tue,  2 Aug 2022 12:08:30 +0800
Message-Id: <20220802040830.28514-1-chenzhuo.1@bytedance.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
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
Cc: lukas@wunner.de, linux-pci@vger.kernel.org, chenzhuo.1@bytedance.com, linux-kernel@vger.kernel.org, stuart.w.hayes@gmail.com, jan.kiszka@siemens.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use pcie_aer_is_native() in place of "host->native_aer ||
pcie_ports_native" to judge whether OS has native control of AER
in aer_root_reset() and pcie_do_recovery().

Replace "dev->aer_cap && (pcie_ports_native || host->native_aer)" in
get_port_device_capability() with pcie_aer_is_native(), which has no
functional changes.

Signed-off-by: Zhuo Chen <chenzhuo.1@bytedance.com>
---
Changelog:
v4:
- Use pcie_aer_is_native() instead in aer_root_reset().
v3:
- Simplify why we use pcie_aer_is_native().
- Revert modification of pci_aer_clear_nonfatal_status() and comments.
v2:
- Add details and note in commit log.
---
 drivers/pci/pcie/aer.c          | 5 ++---
 drivers/pci/pcie/err.c          | 3 +--
 drivers/pci/pcie/portdrv_core.c | 3 +--
 3 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index 7952e5efd6cf..796810c49008 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -1383,7 +1383,6 @@ static pci_ers_result_t aer_root_reset(struct pci_dev *dev)
 	int type = pci_pcie_type(dev);
 	struct pci_dev *root;
 	int aer;
-	struct pci_host_bridge *host = pci_find_host_bridge(dev->bus);
 	u32 reg32;
 	int rc;
 
@@ -1404,7 +1403,7 @@ static pci_ers_result_t aer_root_reset(struct pci_dev *dev)
 	 */
 	aer = root ? root->aer_cap : 0;
 
-	if ((host->native_aer || pcie_ports_native) && aer) {
+	if (pcie_aer_is_native(dev) && aer) {
 		/* Disable Root's interrupt in response to error messages */
 		pci_read_config_dword(root, aer + PCI_ERR_ROOT_COMMAND, &reg32);
 		reg32 &= ~ROOT_PORT_INTR_ON_MESG_MASK;
@@ -1423,7 +1422,7 @@ static pci_ers_result_t aer_root_reset(struct pci_dev *dev)
 			pci_is_root_bus(dev->bus) ? "Root" : "Downstream", rc);
 	}
 
-	if ((host->native_aer || pcie_ports_native) && aer) {
+	if (pcie_aer_is_native(dev) && aer) {
 		/* Clear Root Error Status */
 		pci_read_config_dword(root, aer + PCI_ERR_ROOT_STATUS, &reg32);
 		pci_write_config_dword(root, aer + PCI_ERR_ROOT_STATUS, reg32);
diff --git a/drivers/pci/pcie/err.c b/drivers/pci/pcie/err.c
index 0c5a143025af..121a53338e44 100644
--- a/drivers/pci/pcie/err.c
+++ b/drivers/pci/pcie/err.c
@@ -184,7 +184,6 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
 	int type = pci_pcie_type(dev);
 	struct pci_dev *bridge;
 	pci_ers_result_t status = PCI_ERS_RESULT_CAN_RECOVER;
-	struct pci_host_bridge *host = pci_find_host_bridge(dev->bus);
 
 	/*
 	 * If the error was detected by a Root Port, Downstream Port, RCEC,
@@ -243,7 +242,7 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
 	 * it is responsible for clearing this status.  In that case, the
 	 * signaling device may not even be visible to the OS.
 	 */
-	if (host->native_aer || pcie_ports_native) {
+	if (pcie_aer_is_native(dev)) {
 		pcie_clear_device_status(dev);
 		pci_aer_clear_nonfatal_status(dev);
 	}
diff --git a/drivers/pci/pcie/portdrv_core.c b/drivers/pci/pcie/portdrv_core.c
index 604feeb84ee4..98c18f4a01b2 100644
--- a/drivers/pci/pcie/portdrv_core.c
+++ b/drivers/pci/pcie/portdrv_core.c
@@ -221,8 +221,7 @@ static int get_port_device_capability(struct pci_dev *dev)
 	}
 
 #ifdef CONFIG_PCIEAER
-	if (dev->aer_cap && pci_aer_available() &&
-	    (pcie_ports_native || host->native_aer)) {
+	if (pcie_aer_is_native(dev) && pci_aer_available()) {
 		services |= PCIE_PORT_SERVICE_AER;
 
 		/*
-- 
2.30.1 (Apple Git-130)

