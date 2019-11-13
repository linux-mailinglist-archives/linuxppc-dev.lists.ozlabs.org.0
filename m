Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1519CFAD64
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 10:44:28 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47CfpK02NczF4Ml
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 20:44:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Z2XOngh2"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47CfkQ38qlzF6nW
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2019 20:40:59 +1100 (AEDT)
Received: by mail-pg1-x543.google.com with SMTP id f19so1018961pgk.11
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2019 01:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6x5Ma/2fYehRTG5ezWaSxGaEsScRbdPNlXvlApAmtyE=;
 b=Z2XOngh2lAHBpwR0Oc1QhMrcpxkGjqXQn/4HTOf7Ps5ckQJ6U4Wf8Vdc70VPHQ4xEa
 AEHwAsw47GYMr2vFITmwNt2eZMkHpmgjrfcdnK1+g8Y69P1Eeq2G0iwYdMlF1WzxO2oQ
 oTgKY7Qpu6kuNX7TXwdc8PD0ZUbcinRYepk127lEDCb8TrMELmKcSJqAaBHGNb0kNVMH
 7mum5jJvv8OGsTnwfxxXPJBRZU+J7ROeSBwsRAExAX7aG3qbGwPaO3JfR8HjOOZdUWO/
 WVA5ifpyELJDGXbKwD4m5XR39PIBtOVK0ntT9o8TS+Yz+pPNJi0vLUqoiMT9FimU8SAK
 qyOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6x5Ma/2fYehRTG5ezWaSxGaEsScRbdPNlXvlApAmtyE=;
 b=WIDwV5vKNHxNItNnzj6RWuUMPCIEkNHI5qNMPsNzrMikgw/U3UOwvXY8nDhQW5M67O
 SmATz0K0BTxSUbydZgvoyP/yTIEwYIOKLBAUIhduZT0dzeV4PJMcEM6h+iDEgsN2v7Yi
 Lv4/xHUg0R7IbCU47E6ai3NHjKJezB8NMnB6jHVbGBftBJDQRg8gy+CeRF9rPvYLeamU
 HOSf7Luw1tNMqceepMAXjsTB8SoeLStTndKPJ1GM5tWIZ1EZA17j61mwtkuhamtNZ/eM
 +DKa8+wWHunZuRlc4zriVuXbo05vuWxh6IWvj/of2vT45BWU35UtFoooRQZmPnkP1G+y
 9m0Q==
X-Gm-Message-State: APjAAAUYl9y69eVnt+XoFOTlgTvf9i/k2DBRzwPxFE3lVqENjVv6olnP
 1rE97wWnOQMsLj20MFykJrVY8y2Q1Pw=
X-Google-Smtp-Source: APXvYqwappcsOkJS+WTdmpv81YLqZONxehLVgBUJrsb7Im2JtGAqkgESh0/vFs2XU5d5nuf96yl+Yw==
X-Received: by 2002:a63:3281:: with SMTP id y123mr2671190pgy.252.1573638055898; 
 Wed, 13 Nov 2019 01:40:55 -0800 (PST)
Received: from wafer.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id s202sm2524461pfs.24.2019.11.13.01.40.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Nov 2019 01:40:55 -0800 (PST)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/powernv: Disable native PCIe port management
Date: Wed, 13 Nov 2019 20:40:35 +1100
Message-Id: <20191113094035.22394-1-oohall@gmail.com>
X-Mailer: git-send-email 2.21.0
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
Cc: linux-pci@vger.kernel.org, Oliver O'Halloran <oohall@gmail.com>,
 Sergey Miroshnichenko <s.miroshnichenko@yadro.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On PowerNV the PCIe topology is (currently) managed the powernv platform
code in cooperation with firmware. The PCIe-native service drivers bypass
both and this can cause problems.

Historically this hasn't been a big deal since the only port service
driver that saw much use was the AER driver. The AER driver relies
a kernel service to report when errors occur rather than acting autonmously
so it's fairly easy to ignore. On PowerNV (and pseries) AER events are
handled through EEH, which ignores the AER service, so it's never been
an issue.

Unfortunately, the hotplug port service driver (pciehp) does act
autonomously and conflicts with the platform specific hotplug
driver (pnv_php). The main issue is that pciehp claims the interrupt
associated with the PCIe capability which in turn prevents pnv_php from
claiming it.

This results in hotplug events being handled by pciehp which does not
notify firmware when the PCIe topology changes, and does not setup/teardown
the arch specific PCI device structures (pci_dn) when the topology changes.
The end result is that hot-added devices cannot be enabled and hot-removed
devices may not be fully torn-down on removal.

We can fix these problems by setting the "pcie_ports_disabled" flag during
platform initialisation. The flag indicates the platform owns the PCIe
ports which stops the portbus driver being registered.

Cc: Sergey Miroshnichenko <s.miroshnichenko@yadro.com>
Fixes: 66725152fb9f ("PCI/hotplug: PowerPC PowerNV PCI hotplug driver")
Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
Sergey, just FYI. I'll try sort out the rest of the hotplug
trainwreck in 5.6.

The Fixes: here is for the patch that added pnv_php in 4.8. It's been
a problem since then, but wasn't noticed until people started testing
it after the EEH fixes in commit 799abe283e51 ("powerpc/eeh: Clean up
EEH PEs after recovery finishes") went in earlier in the 5.4 cycle.
---
 arch/powerpc/platforms/powernv/pci.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/powerpc/platforms/powernv/pci.c b/arch/powerpc/platforms/powernv/pci.c
index 2825d00..ae62583 100644
--- a/arch/powerpc/platforms/powernv/pci.c
+++ b/arch/powerpc/platforms/powernv/pci.c
@@ -941,6 +941,23 @@ void __init pnv_pci_init(void)
 
 	pci_add_flags(PCI_CAN_SKIP_ISA_ALIGN);
 
+#ifdef CONFIG_PCIEPORTBUS
+	/*
+	 * On PowerNV PCIe devices are (currently) managed in cooperation
+	 * with firmware. This isn't *strictly* required, but there's enough
+	 * assumptions baked into both firmware and the platform code that
+	 * it's unwise to allow the portbus services to be used.
+	 *
+	 * We need to fix this eventually, but for now set this flag to disable
+	 * the portbus driver. The AER service isn't required since that AER
+	 * events are handled via EEH. The pciehp hotplug driver can't work
+	 * without kernel changes (and portbus binding breaks pnv_php). The
+	 * other services also require some thinking about how we're going
+	 * to integrate them.
+	 */
+	pcie_ports_disabled = true;
+#endif
+
 	/* If we don't have OPAL, eg. in sim, just skip PCI probe */
 	if (!firmware_has_feature(FW_FEATURE_OPAL))
 		return;
-- 
2.9.5

