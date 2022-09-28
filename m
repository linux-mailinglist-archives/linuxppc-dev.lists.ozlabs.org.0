Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E605EDB19
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 13:05:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mctty1njqz3fLR
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 21:05:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=g54oFMId;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com; envelope-from=chenzhuo.1@bytedance.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=g54oFMId;
	dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mctnx1myzz3cd4
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Sep 2022 21:00:53 +1000 (AEST)
Received: by mail-pj1-x1029.google.com with SMTP id cp18so3051595pjb.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Sep 2022 04:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=u9XQU41RsTUx8hAj0GByCivfHFYNLe/LcJ7HOx2cRk8=;
        b=g54oFMIdCF2dlMlWqBJXb2ajXcmoOjcmAclllhhmqpL/PbWxV//uy2iXv81V0hzVm0
         aLaAZ6+mer1bqH8611CebeDTcEHTIxWNAEILUMzm607EsRzinibmRhNx+T14qbAMFTMi
         deCvTYPrRQQAs0CrFDT6LPJFXI2rTfm5hdWox09u0jb5HlpwgLk2qQ90/AEQIPdMq1P4
         RP9nGHaoCYBIXKTXvNHto/IRYqqNt5gMGyMua828z4SXp/lAqHMpUZUYFelzp/iuDfYZ
         +4NxDQtAvtILUhS8r6L9rmxbQj1w4czfQ2xpYtCJUVoRjjtFTfaHnn0CHPuANhp+SPpR
         0inw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=u9XQU41RsTUx8hAj0GByCivfHFYNLe/LcJ7HOx2cRk8=;
        b=dDvUpbApQ6kNEfGpeNKWVGZ+NqyUr6aLZbnz57mLXwTI0wWrSade0RDdbAbzPoan+Y
         d+I52hDkQqF/YnSL6Q6JynrzT8IsM8+tsQ7aEbyNEsvBAGwaOXaavRS8I5363ebHIGbj
         MYdaqbyLaDzE372lIr0xs87onXEt1FZ38mLQnW16vu4CP3Z22shKDOuWEKrnMkspmNsR
         oC7Ko9U3gfHPCZ+p66tjYV29zfhNzESd8Fa+i8hPQTxpk7+5vVsFFQoL9afisGV5LpN7
         BZ83TRUA9PDDeMWVmZXvXGbCpYs2V1wWMHy6yVsrQKRa1AiYfog311+AlmRAGRIQMe5q
         x59w==
X-Gm-Message-State: ACrzQf2hhWoi+Rlu4EyZmg+X+rZQq3dEWDLTXMuaSmCNJHInE1zI9fP/
	Dtme78aqKt9oI3DFi+R628VoSQ==
X-Google-Smtp-Source: AMsMyM4kXAU4ifKn51M7WYKqFKeegfH0I0bkzWrZ+DYNC5KIZDtAkk16LDFcF/7vrBJSgxjKlw6Exw==
X-Received: by 2002:a17:902:bb98:b0:178:8e09:5675 with SMTP id m24-20020a170902bb9800b001788e095675mr31940670pls.91.1664362851153;
        Wed, 28 Sep 2022 04:00:51 -0700 (PDT)
Received: from C02F63J9MD6R.bytedance.net ([61.120.150.77])
        by smtp.gmail.com with ESMTPSA id b13-20020a170902d50d00b00177efb56475sm1539524plg.85.2022.09.28.04.00.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 28 Sep 2022 04:00:50 -0700 (PDT)
From: Zhuo Chen <chenzhuo.1@bytedance.com>
To: sathyanarayanan.kuppuswamy@linux.intel.com,
	bhelgaas@google.com,
	ruscur@russell.cc,
	oohall@gmail.com,
	fancer.lancer@gmail.com,
	jdmason@kudzu.us,
	dave.jiang@intel.com,
	allenbh@gmail.com,
	james.smart@broadcom.com,
	dick.kennedy@broadcom.com,
	jejb@linux.ibm.com,
	martin.petersen@oracle.com
Subject: [PATCH v3 7/9] PCI/AER: Use pcie_aer_is_native() to judge whether OS owns AER
Date: Wed, 28 Sep 2022 18:59:44 +0800
Message-Id: <20220928105946.12469-8-chenzhuo.1@bytedance.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20220928105946.12469-1-chenzhuo.1@bytedance.com>
References: <20220928105946.12469-1-chenzhuo.1@bytedance.com>
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
Cc: linux-scsi@vger.kernel.org, linux-pci@vger.kernel.org, chenzhuo.1@bytedance.com, linux-kernel@vger.kernel.org, ntb@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use pcie_aer_is_native() in place of "host->native_aer ||
pcie_ports_native" to judge whether OS owns AER in aer_root_reset().

Replace "dev->aer_cap && (pcie_ports_native || host->native_aer)" in
get_port_device_capability() with pcie_aer_is_native(), which has no
functional changes.

Signed-off-by: Zhuo Chen <chenzhuo.1@bytedance.com>
---
 drivers/pci/pcie/aer.c          | 5 ++---
 drivers/pci/pcie/portdrv_core.c | 3 +--
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index e2320ab27a31..a6d29269ccf2 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -1403,7 +1403,6 @@ static pci_ers_result_t aer_root_reset(struct pci_dev *dev)
 	int type = pci_pcie_type(dev);
 	struct pci_dev *root;
 	int aer;
-	struct pci_host_bridge *host = pci_find_host_bridge(dev->bus);
 	u32 reg32;
 	int rc;
 
@@ -1424,7 +1423,7 @@ static pci_ers_result_t aer_root_reset(struct pci_dev *dev)
 	 */
 	aer = root ? root->aer_cap : 0;
 
-	if ((host->native_aer || pcie_ports_native) && aer) {
+	if (aer && pcie_aer_is_native(root)) {
 		/* Disable Root's interrupt in response to error messages */
 		pci_read_config_dword(root, aer + PCI_ERR_ROOT_COMMAND, &reg32);
 		reg32 &= ~ROOT_PORT_INTR_ON_MESG_MASK;
@@ -1443,7 +1442,7 @@ static pci_ers_result_t aer_root_reset(struct pci_dev *dev)
 			pci_is_root_bus(dev->bus) ? "Root" : "Downstream", rc);
 	}
 
-	if ((host->native_aer || pcie_ports_native) && aer) {
+	if (aer && pcie_aer_is_native(root)) {
 		/* Clear Root Error Status */
 		pci_read_config_dword(root, aer + PCI_ERR_ROOT_STATUS, &reg32);
 		pci_write_config_dword(root, aer + PCI_ERR_ROOT_STATUS, reg32);
diff --git a/drivers/pci/pcie/portdrv_core.c b/drivers/pci/pcie/portdrv_core.c
index 1ac7fec47d6f..844297c0c85e 100644
--- a/drivers/pci/pcie/portdrv_core.c
+++ b/drivers/pci/pcie/portdrv_core.c
@@ -221,8 +221,7 @@ static int get_port_device_capability(struct pci_dev *dev)
 	}
 
 #ifdef CONFIG_PCIEAER
-	if (dev->aer_cap && pci_aer_available() &&
-	    (pcie_ports_native || host->native_aer))
+	if (pcie_aer_is_native(dev) && pci_aer_available())
 		services |= PCIE_PORT_SERVICE_AER;
 #endif
 
-- 
2.30.1 (Apple Git-130)

