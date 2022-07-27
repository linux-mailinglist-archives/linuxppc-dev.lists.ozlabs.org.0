Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 582E3581E61
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Jul 2022 05:54:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lt0Jt2PGxz3cgT
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Jul 2022 13:54:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=TTb6Ern0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com; envelope-from=chenzhuo.1@bytedance.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=TTb6Ern0;
	dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lt0JJ1Wd3z3blV
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Jul 2022 13:53:50 +1000 (AEST)
Received: by mail-pj1-x1036.google.com with SMTP id b10so15223189pjq.5
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Jul 2022 20:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7jhbj5Abg4TXA2patlqLjYtOIDWLphgG/ZlRWxSbkmg=;
        b=TTb6Ern0vF5/xiSQCYnJ6Gg46rjWaD0lesX5iMjCWYSKagGQwasI8rZx4GE+f9WmcK
         Ggv2fbmEV69lUNGSXnrr+YM+YEHUekKd1nY4FlYQgZ5IPWhBmUq4u3xQYvHkfcPHMh6B
         md+w4lFiGy8n1GDONsIK9I1uT+huTwHEDmCv2krKvh0VI6EyRv5Sj4SHZWfjm6CEmXfw
         80lGsC8h0lp/ctlJKfildkSPLMZzf3dpVDNzZgd0dKZhEV5SMPL2f5tJFQHUvLIxhbtl
         Yq71FexWR0TTqYK6VkaK+pSjM5vZ3HTz7nMJvhMRrekFbAAZZmXc6weE0qBWmJXMsG3A
         15+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7jhbj5Abg4TXA2patlqLjYtOIDWLphgG/ZlRWxSbkmg=;
        b=p76M8l4o4AeK6I3GXnzUff+Iwjv+81BKylRV+Jol5IHMqQMyu69KwaAv2blpCPnedB
         jC7ogL/D8ccfqR493bKcoZYFJOmAkEAxnQ1OEs+Q9ZLnOFSq8OingSKGBmMKoncOXWtn
         +8q12W8j8cEYvKfT6YlMEZC+cpUgZAVfbSyIUqjLALVoiUTJRsoq4PdUKBaIE2lC3Hmo
         9rI37Kp3HW465ulykTJCPaVFdXgrf5TXij68eOysk0i1c8XXQajf4iVXhHEkcUteqxTv
         3aGaIZcA+nrzxiN+/ot+28SO2C/GqgWn+z+2VIYrS3OLtbWymx8FgY5VXIwo7n0tFmB0
         flng==
X-Gm-Message-State: AJIora+JLYATo2sc/aWOd3g7ncPOuH3bMG97rkPqEcpPva3wlDkbMI33
	X1mVrRdHTLlFgkAO7CTRfSepCQ==
X-Google-Smtp-Source: AGRyM1s980FWuq1gVlztoVmgOxTY3rsrl6DOXaqVSgmqR8KVUchf4hKTtG0e9jsYHw4zD/h04NZfrA==
X-Received: by 2002:a17:903:2601:b0:16d:b055:2985 with SMTP id jd1-20020a170903260100b0016db0552985mr1722624plb.161.1658894025876;
        Tue, 26 Jul 2022 20:53:45 -0700 (PDT)
Received: from C02F63J9MD6R.bytedance.net ([61.120.150.78])
        by smtp.gmail.com with ESMTPSA id t9-20020a1709027fc900b0016bb24f5d19sm12516515plb.209.2022.07.26.20.53.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Jul 2022 20:53:45 -0700 (PDT)
From: Zhuo Chen <chenzhuo.1@bytedance.com>
To: ruscur@russell.cc,
	oohall@gmail.com,
	bhelgaas@google.com,
	sathyanarayanan.kuppuswamy@linux.intel.com
Subject: [PATCH v3] PCI/ERR: Use pcie_aer_is_native() to judge whether OS owns AER
Date: Wed, 27 Jul 2022 11:53:34 +0800
Message-Id: <20220727035334.9997-1-chenzhuo.1@bytedance.com>
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
in pcie_do_recovery().

Replace "dev->aer_cap && (pcie_ports_native || host->native_aer)" in
get_port_device_capability() with pcie_aer_is_native(), which has no
functional changes.

Signed-off-by: Zhuo Chen <chenzhuo.1@bytedance.com>
---
Changelog:
v3:
- Simplify why we use pcie_aer_is_native().
- Revert modification of pci_aer_clear_nonfatal_status() and comments.
v2:
- Add details and note in commit log.
---
 drivers/pci/pcie/err.c          | 3 +--
 drivers/pci/pcie/portdrv_core.c | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

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

