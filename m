Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8349580942
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jul 2022 04:06:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LsKyZ3nLLz3cdw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jul 2022 12:06:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=nTioK+/s;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::533; helo=mail-pg1-x533.google.com; envelope-from=chenzhuo.1@bytedance.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=nTioK+/s;
	dkim-atps=neutral
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LsKxy5VrHz30LS
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Jul 2022 12:05:40 +1000 (AEST)
Received: by mail-pg1-x533.google.com with SMTP id 23so11905141pgc.8
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Jul 2022 19:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PcLN0/0rRk3ozwmqISVR6hRqPCsf6L35JebQehRi1LA=;
        b=nTioK+/s3DBU4jhK/bp6W9HoNaLbn9VTPFlcs/nnOeaSY3yYsAwlorbKuiVR7waFli
         AxujWyUJgbFWM1RSWzgWAot6NAd4pZCKLsDvc0HoF7s+VR5bgVgLdNXLJPLxIyzHIRK4
         dZTAKNdgCB93tMvwtYmp03T0eThljIHTh6fSfcaZulw0c/dHrvS+dfJJOU2Vek4SJ9P9
         RIm02AJVXfyvtCeoZx6qBZIxr8dWPSUmMt8ey9XYpzEl4vsh4ETs7Jwhzi3CAIH58g4Z
         je5gG6n2jX+D76groH6t8w6Ym4ZwYL7z4ZhI/ZxwWmin5anmjrCyI5e1VsfJpb2RWXti
         1jiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PcLN0/0rRk3ozwmqISVR6hRqPCsf6L35JebQehRi1LA=;
        b=SYAV4ZE3H+b9ZY9vKQIVdGFJlDS9WSESlahLhrCBL2zsGQPNAXx4WRctGNM+1LrOep
         83FlKNiHH2CRdi9nqDtND9IFhJShoGDIIfAN9pyXJ+ZMl/b+1yCZ/8aNEUhdl9vxNhZR
         iXWo3WCcCVIAUT/BJnuJumiWiQcv9lnXKGLRJWweejwbr1jSUogLBo7eH4sFr+5AIuEt
         XuhB1ZczmQ9M6QGoP2L/IWIPD9T5BsconjF5uo3M7Lc6gIiuwwYg/HMCAycXbT9nNPrN
         V9zkmnk3N2Ap0U+Sr6NcZgxvMnAbkgm+4vjQ5Kv7TV/49fCn7WhQ80KUsHlOWYn6XEy2
         34gA==
X-Gm-Message-State: AJIora9My3p+A92QgR75zKYkY7enLQl+9c96AsEO6za12CNQPgzn16CZ
	kOsjeN71y7LDgM3ouZ+uhY+ItQ==
X-Google-Smtp-Source: AGRyM1tN5cI8PLb9GQMnAmTK897rbjPgqmQUBbRdtqBmGzc3THxBtOvtBkrHDhPlskpkikFyhQ/6Lw==
X-Received: by 2002:a62:7bd7:0:b0:52b:1d57:e098 with SMTP id w206-20020a627bd7000000b0052b1d57e098mr15017966pfc.19.1658801138825;
        Mon, 25 Jul 2022 19:05:38 -0700 (PDT)
Received: from C02F63J9MD6R.bytedance.net ([61.120.150.78])
        by smtp.gmail.com with ESMTPSA id f4-20020a170902684400b0016bdf0032b9sm9834200pln.110.2022.07.25.19.05.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 25 Jul 2022 19:05:38 -0700 (PDT)
From: Zhuo Chen <chenzhuo.1@bytedance.com>
To: ruscur@russell.cc,
	oohall@gmail.com,
	bhelgaas@google.com,
	sathyanarayanan.kuppuswamy@linux.intel.com
Subject: [PATCH v2] PCI/ERR: Use pcie_aer_is_native() to judge whether OS owns AER
Date: Tue, 26 Jul 2022 10:05:27 +0800
Message-Id: <20220726020527.99816-1-chenzhuo.1@bytedance.com>
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

The AER status of the device that reported the error rather than
the first downstream port is cleared after commit 7d7cbeaba5b7
("PCI/ERR: Clear status of the reporting device"). So "a bridge
may not exist" which commit aa344bc8b727 ("PCI/ERR: Clear AER
status only when we control AER") referring to is no longer
existent, and we just use pcie_aer_is_native() in stead of
"host->native_aer || pcie_ports_native".

pci_aer_clear_nonfatal_status() already has pcie_aer_is_native(),
so we move pci_aer_clear_nonfatal_status() out of
pcie_aer_is_native().

Replace statements that judge whether OS owns AER in
get_port_device_capability() with pcie_aer_is_native(), which has
no functional changes.

Signed-off-by: Zhuo Chen <chenzhuo.1@bytedance.com>
---
v2:
- Add details and note in commit log
---
 drivers/pci/pcie/err.c          | 12 ++----------
 drivers/pci/pcie/portdrv_core.c |  3 +--
 2 files changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/pci/pcie/err.c b/drivers/pci/pcie/err.c
index 0c5a143025af..28339c741555 100644
--- a/drivers/pci/pcie/err.c
+++ b/drivers/pci/pcie/err.c
@@ -184,7 +184,6 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
 	int type = pci_pcie_type(dev);
 	struct pci_dev *bridge;
 	pci_ers_result_t status = PCI_ERS_RESULT_CAN_RECOVER;
-	struct pci_host_bridge *host = pci_find_host_bridge(dev->bus);
 
 	/*
 	 * If the error was detected by a Root Port, Downstream Port, RCEC,
@@ -237,16 +236,9 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
 	pci_dbg(bridge, "broadcast resume message\n");
 	pci_walk_bridge(bridge, report_resume, &status);
 
-	/*
-	 * If we have native control of AER, clear error status in the device
-	 * that detected the error.  If the platform retained control of AER,
-	 * it is responsible for clearing this status.  In that case, the
-	 * signaling device may not even be visible to the OS.
-	 */
-	if (host->native_aer || pcie_ports_native) {
+	if (pcie_aer_is_native(dev))
 		pcie_clear_device_status(dev);
-		pci_aer_clear_nonfatal_status(dev);
-	}
+	pci_aer_clear_nonfatal_status(dev);
 	pci_info(bridge, "device recovery successful\n");
 	return status;
 
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

