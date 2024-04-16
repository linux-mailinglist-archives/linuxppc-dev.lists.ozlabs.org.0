Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 209BF8A626F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Apr 2024 06:34:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=NKOtAfue;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VJWQT735fz3vXV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Apr 2024 14:34:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=NKOtAfue;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=canonical.com (client-ip=185.125.188.121; helo=smtp-relay-canonical-1.canonical.com; envelope-from=kai.heng.feng@canonical.com; receiver=lists.ozlabs.org)
Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VJWPk6MN6z3d2c
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Apr 2024 14:33:29 +1000 (AEST)
Received: from localhost.localdomain (unknown [10.101.196.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 656BC3F0FA;
	Tue, 16 Apr 2024 04:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1713242003;
	bh=EIqb3ZhtP6vTc/Ol0BEJS2EDfRh93Z4lytIAwmN5HBw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=NKOtAfue4ui49NMuPLL0XAKGEFXav6o4C68s62FY4mxrjwrfM4IlFO/o2T99SB7h1
	 E9GAlvpSYHu6NAZtGms4ab9wfWZ9jAovmt+67i/pQuMRuWXWKL2+rkLy9MJxJPaF+s
	 KEIUrUBacCuEPfQK6v3CfSFewEZ5Wy8L2kuC6LwlzrA3xyzo89DEDkJCNJRKNCO6wR
	 Q68K9/AN2CaAUfc5//i/czP84EqEosxaTqfRNf4uLUWVg6etOiZW1UigHHln3r1eMj
	 StHCFMAMxZL78xsjzt4zV6Cm/poJOsXEvB65i2FW7B7WNkqzX1AGEd1eff45PPOhfu
	 m27lNjrJFS3Eg==
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
To: bhelgaas@google.com
Subject: [PATCH v8 1/3] PCI: Add helper to check if any of ancestor device support D3cold
Date: Tue, 16 Apr 2024 12:32:23 +0800
Message-Id: <20240416043225.1462548-1-kai.heng.feng@canonical.com>
X-Mailer: git-send-email 2.34.1
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
Cc: kch@nvidia.com, regressions@lists.linux.dev, linux-pci@vger.kernel.org, mahesh@linux.ibm.com, linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, Kai-Heng Feng <kai.heng.feng@canonical.com>, oohall@gmail.com, hare@suse.de, bagasdotme@gmail.com, kbusch@kernel.org, gloriouseggroll@gmail.com, linuxppc-dev@lists.ozlabs.org, hch@lst.de, sagi@grimberg.me
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In addition to nearest upstream bridge, driver may want to know if the
entire hierarchy can be powered off to perform different action.

So walk higher up the hierarchy to find out if any device has valid
_PR3.

The user will be introduced in next patch.

Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
---
v8:
 - No change.

 drivers/pci/pci.c   | 16 ++++++++++++++++
 include/linux/pci.h |  2 ++
 2 files changed, 18 insertions(+)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index e5f243dd4288..7a5662f116b8 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -6225,6 +6225,22 @@ bool pci_pr3_present(struct pci_dev *pdev)
 		acpi_has_method(adev->handle, "_PR3");
 }
 EXPORT_SYMBOL_GPL(pci_pr3_present);
+
+bool pci_ancestor_pr3_present(struct pci_dev *pdev)
+{
+	struct pci_dev *parent = pdev;
+
+	if (acpi_disabled)
+		return false;
+
+	while ((parent = pci_upstream_bridge(parent))) {
+		if (pci_pr3_present(pdev))
+			return true;
+	}
+
+	return false;
+}
+EXPORT_SYMBOL_GPL(pci_ancestor_pr3_present);
 #endif
 
 /**
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 16493426a04f..cd71ebfd0f89 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -2620,10 +2620,12 @@ struct irq_domain *pci_host_bridge_acpi_msi_domain(struct pci_bus *bus);
 void
 pci_msi_register_fwnode_provider(struct fwnode_handle *(*fn)(struct device *));
 bool pci_pr3_present(struct pci_dev *pdev);
+bool pci_ancestor_pr3_present(struct pci_dev *pdev);
 #else
 static inline struct irq_domain *
 pci_host_bridge_acpi_msi_domain(struct pci_bus *bus) { return NULL; }
 static inline bool pci_pr3_present(struct pci_dev *pdev) { return false; }
+static inline bool pci_ancestor_pr3_present(struct pci_dev *pdev) { return false; }
 #endif
 
 #ifdef CONFIG_EEH
-- 
2.34.1

