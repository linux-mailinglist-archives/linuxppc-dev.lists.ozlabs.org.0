Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C523C6773
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jul 2021 02:26:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GP1dc3x3wz3bkX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jul 2021 10:26:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.128.46; helo=mail-wm1-f46.google.com;
 envelope-from=kswilczynski@gmail.com; receiver=<UNKNOWN>)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GP1cs5s6Zz2yP6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jul 2021 10:25:32 +1000 (AEST)
Received: by mail-wm1-f46.google.com with SMTP id
 i2-20020a05600c3542b02902058529ea07so1119952wmq.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Jul 2021 17:25:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Q1JaKWz4ljmDgmlS6XOgBpL8dJbggktcA486snVdwEo=;
 b=CB/bTjAIQEYVD2dhjzHj7jcf3u4kGaGQfvp3TbHQHfMG2LYNrkZExd5TA1ERrXqkLS
 BvEfZWDdrO37/WjVeXi8JQ80LramM9ThycRAcY2Tpr+70FP/WEdvaIhZOugJyIVKz20S
 aZnqXuJh1OTgK5F08O33FYYQ5wfPNNaVIEgybBqxZ2CwwcXHSTxnpYqs/yxYRdo29H7m
 LCwJo9z4W/+mvvKLRuXgE5nUc/6cSK5bxHPqZAAOUYHII7qvscUUfKAJxccv9iQ5269z
 aYSQuPsRkulJVXw9i9lAy+fND8Q4+CqpLaoC39yGu8K21PcnaOP7tyXNGNadJOMr/jZf
 lFkg==
X-Gm-Message-State: AOAM533akPv7K8yORphPqh5GneTFJUVYYIGz0ZG1LyBTdu69VL8KBrmc
 7FFi8R55MshR0oDzNSyrF6Q=
X-Google-Smtp-Source: ABdhPJziVUbprznFZuoOf+eG8kg08hyPDAKraPFSp2ML3Rde1dpKkVWCkubdOfyTsnbJzZC0XgepIQ==
X-Received: by 2002:a05:600c:a45:: with SMTP id
 c5mr17728264wmq.153.1626135927526; 
 Mon, 12 Jul 2021 17:25:27 -0700 (PDT)
Received: from workstation.lan ([95.155.85.46])
 by smtp.gmail.com with ESMTPSA id p5sm38895wme.2.2021.07.12.17.25.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 17:25:27 -0700 (PDT)
From: =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH 1/2] PCI: Use pcie_reset_state_t type in function arguments
Date: Tue, 13 Jul 2021 00:25:24 +0000
Message-Id: <20210713002525.203840-1-kw@linux.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pcie_reset_state_t type has been introduced in the commit
f7bdd12d234d ("pci: New PCI-E reset API") along with the enum
pcie_reset_state, but it has never been used for anything else
other than to define the members of the enumeration set in the
enum pcie_reset_state.

Thus, replace the direct use of enum pcie_reset_state in function
arguments and replace it with pcie_reset_state_t type so that the
argument type matches the type used in enum pcie_reset_state.

Signed-off-by: Krzysztof Wilczyński <kw@linux.com>
---
 drivers/pci/pci.c   | 4 ++--
 include/linux/pci.h | 5 ++---
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index aacf575c15cf..5c3386a73eb1 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -2194,7 +2194,7 @@ EXPORT_SYMBOL(pci_disable_device);
  * implementation. Architecture implementations can override this.
  */
 int __weak pcibios_set_pcie_reset_state(struct pci_dev *dev,
-					enum pcie_reset_state state)
+					pcie_reset_state_t state)
 {
 	return -EINVAL;
 }
@@ -2206,7 +2206,7 @@ int __weak pcibios_set_pcie_reset_state(struct pci_dev *dev,
  *
  * Sets the PCI reset state for the device.
  */
-int pci_set_pcie_reset_state(struct pci_dev *dev, enum pcie_reset_state state)
+int pci_set_pcie_reset_state(struct pci_dev *dev, pcie_reset_state_t state)
 {
 	return pcibios_set_pcie_reset_state(dev, state);
 }
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 540b377ca8f6..15f93de69e6a 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -191,7 +191,6 @@ enum {
 };
 
 typedef unsigned int __bitwise pcie_reset_state_t;
-
 enum pcie_reset_state {
 	/* Reset is NOT asserted (Use to deassert reset) */
 	pcie_deassert_reset = (__force pcie_reset_state_t) 1,
@@ -1205,7 +1204,7 @@ extern unsigned int pcibios_max_latency;
 void pci_set_master(struct pci_dev *dev);
 void pci_clear_master(struct pci_dev *dev);
 
-int pci_set_pcie_reset_state(struct pci_dev *dev, enum pcie_reset_state state);
+int pci_set_pcie_reset_state(struct pci_dev *dev, pcie_reset_state_t state);
 int pci_set_cacheline_size(struct pci_dev *dev);
 int __must_check pci_set_mwi(struct pci_dev *dev);
 int __must_check pcim_set_mwi(struct pci_dev *dev);
@@ -2079,7 +2078,7 @@ extern u8 pci_cache_line_size;
 void pcibios_disable_device(struct pci_dev *dev);
 void pcibios_set_master(struct pci_dev *dev);
 int pcibios_set_pcie_reset_state(struct pci_dev *dev,
-				 enum pcie_reset_state state);
+				 pcie_reset_state_t state);
 int pcibios_add_device(struct pci_dev *dev);
 void pcibios_release_device(struct pci_dev *dev);
 #ifdef CONFIG_PCI
-- 
2.32.0

