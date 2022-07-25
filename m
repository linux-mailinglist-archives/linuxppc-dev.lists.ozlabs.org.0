Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D39525806F4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jul 2022 23:52:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LsDKY5cxhz3c2W
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jul 2022 07:52:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=3zsZRztK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::1035; helo=mail-pj1-x1035.google.com; envelope-from=chenzhuo.1@bytedance.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=3zsZRztK;
	dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ls4Yt68P2z2xn1
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Jul 2022 02:02:25 +1000 (AEST)
Received: by mail-pj1-x1035.google.com with SMTP id t3-20020a17090a3b4300b001f21eb7e8b0so14190129pjf.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Jul 2022 09:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JKqeLialV+6vbEP9iLh1rw+b+hmjByPHU1zMv6k/ebc=;
        b=3zsZRztKOEhwhcwxTyuAJc8jmK7Yd5DM5WDlQ8uNoCD0B0JdzO0Zr6i0fvzBbIeHGL
         K1J9803VZkOtPHjBJjT4QvcPcrBqPmlyBibQFNfoLnJL2nH/8cmJZUl6jIbQx7NGbPNN
         08+Ll+QxTbHmmBtibJ4KKjfXAbYDVI3PjoT0djdSDPSnUr00wKWUXUem3GEA9s+0sqso
         vpZFIY0eOy38/uhvApzUMyDSDhHH3jPQ1VTXer2Cyum9Ff5GijNMSLUXAyVfmk/nlRqL
         c0WLgAt1NLkoXArDAkcdqPEZWBzIV/RYls6whvzrjgsVYeCHBq/VtW9q21vfsycSgx3Y
         CQZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JKqeLialV+6vbEP9iLh1rw+b+hmjByPHU1zMv6k/ebc=;
        b=C5dpiUH7fyirDDyzuYpPW38o6oeNfN6eP+Zuhy8c8HFD8kYdXMJvCcw8PnPfxOnKee
         FLPW07NNy2541XKQVW++Qx18MQx7tLOno/LJTgyuhP9oHC8JafaXuQYI1Bz8nPgryTz4
         YGrSpOBP2XliO3c9+z1hsXsHLkyYN8y0nH6xDsEpfR/Jit438mReSfPKwHLNHuDmFyXY
         P+z/Xr8Lb4ZGeZkDVYbfWJmFMAJIc1farliV5DVtAXydKD5uZQ9dnvsmOpldgjKjVVxi
         t5dfOUpd0yoNROZpGlcDEYpXJSr8XZ20RLwQi+BUgWcQZ9jqHtqTjNrnKHzucMPs9ouT
         Mk+g==
X-Gm-Message-State: AJIora+9PNcFlDZaXaBvDr20Fca79R4pzsUwQuK7xbHzUhOkPYmTNg+q
	2Pj6GT+nXD204Mw+jaz6eZ5QAw==
X-Google-Smtp-Source: AGRyM1tqvaWk/DDOXJIx1or0Y+22nYb/JgOeC2l2098PgfKLfLZkKZF0XasYDv3WsyNFz03m/6wFVA==
X-Received: by 2002:a17:90b:3ec5:b0:1f0:3986:4502 with SMTP id rm5-20020a17090b3ec500b001f039864502mr15647381pjb.6.1658764940683;
        Mon, 25 Jul 2022 09:02:20 -0700 (PDT)
Received: from C02F63J9MD6R.bytedance.net ([61.120.150.78])
        by smtp.gmail.com with ESMTPSA id o6-20020a1709026b0600b0015e8d4eb2easm9273441plk.308.2022.07.25.09.02.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 25 Jul 2022 09:02:19 -0700 (PDT)
From: Zhuo Chen <chenzhuo.1@bytedance.com>
To: ruscur@russell.cc,
	oohall@gmail.com,
	bhelgaas@google.com
Subject: [PATCH] PCI/ERR: Use pcie_aer_is_native() to judge whether OS owns AER
Date: Tue, 26 Jul 2022 00:01:31 +0800
Message-Id: <20220725160131.83687-1-chenzhuo.1@bytedance.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 26 Jul 2022 07:51:48 +1000
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

After commit 7d7cbeaba5b7 ("PCI/ERR: Clear status of the reporting
device"), the AER status of the device that reported the error
rather than the first downstream port is cleared. So the problem
in commit aa344bc8b727 ("PCI/ERR: Clear AER status only when we
control AER") is no longer existent, and we change to use
pcie_aer_is_native() here.

pci_aer_clear_nonfatal_status() already has pcie_aer_is_native(),
so we move pci_aer_clear_nonfatal_status() out of
pcie_aer_is_native().

Replace statements that judge whether OS owns AER in
get_port_device_capability() with pcie_aer_is_native().

Signed-off-by: Zhuo Chen <chenzhuo.1@bytedance.com>
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

