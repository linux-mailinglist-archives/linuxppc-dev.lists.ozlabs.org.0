Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 961F5685ED
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2019 11:04:25 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45nHdx1lYDzDqQN
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2019 19:04:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="iwHnF4Tv"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45nHSv4wKgzDqQT
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jul 2019 18:56:31 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id t16so7093125pfe.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jul 2019 01:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zdiFcOQdpxvyzMoMOi7bPjgrBc4m1TxaTwRnN2L23Fs=;
 b=iwHnF4Tvyz/EIsstgDUUqlbgf4VBeTsI7VIDEZt1DUdKikIpuu+84UW9mNNWJe+o+o
 RTBRJE0BA1h9rivXUCpA1p1J46t+x5qK7KBizauNs7gDkKXMBWueF0WTqqbI/XvS6aOn
 hyRLfyWHwd2ZRSHOfgxmZ6dtTZkogg+yWqi4m1Wp3Ng2NO7AOAaV/Fm1JnvYmmFsyJv3
 /L9U+N9ej8v05lbinT4FyMRhpxU5vmAvGGaRYeMJYwT5ek0UKDgChZ1WTWHSNqSaGKob
 24z6qRHn4jK4PMkxSbFkloEWmNhQVk/G6QwLdCi2szupB8mmLnB+ULqrl7gGcKJ8yZYm
 lxsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zdiFcOQdpxvyzMoMOi7bPjgrBc4m1TxaTwRnN2L23Fs=;
 b=m2L0cdGNMsVQcRGL8mRi9GARI+yBAwHVtl+wM1ejeflJUP5LNtjt6eT3o16KA0BIeU
 eqQXZ4udD9F8mWmHYmFvICjI6IWz9OqBBHVtB5sxpEAZiqk+MkLDGKlhPozfx6uuXwvX
 74PE6NPLCQBp3QQwvfYhKINi0CUm6vNwyoKDUrjRW9PjDBsZe0L4FI9m8Xmbw3OWI9bs
 tH/iNMGcx3SyN3iDLFHM3SGn4esoq7VN1Cn2TyuFytVw9DU/03mKunSTL5Eqm+ecY19U
 A7HGT4jJr61gezEViNXAo5N3KoKM5w11msN8exFN4e+lsq/g8wdq9l4iBzm63GxAZ8Xp
 Hdtw==
X-Gm-Message-State: APjAAAXDNByrjD+FgvNHylQezx6AvQVwzOtQXdjapIT3HexWcOKfZONi
 Bjxmt0B3sl5W+/PT0hfj/bfB0gRbWU4=
X-Google-Smtp-Source: APXvYqw38CWQ/zvMSVqnehzFfCUWmMsluGFer5nDDJVosG9A5dBeo5uGKFAhklptr3dA9CZNc1ILCg==
X-Received: by 2002:a17:90a:30e4:: with SMTP id
 h91mr26930773pjb.37.1563180989505; 
 Mon, 15 Jul 2019 01:56:29 -0700 (PDT)
Received: from wafer.ozlabs.ibm.com.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id d14sm22514815pfo.154.2019.07.15.01.56.27
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 01:56:29 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/5] powerpc/eeh_sysfs: ifdef pseries sr-iov sysfs properties
Date: Mon, 15 Jul 2019 18:56:10 +1000
Message-Id: <20190715085612.8802-4-oohall@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190715085612.8802-1-oohall@gmail.com>
References: <20190715085612.8802-1-oohall@gmail.com>
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
Cc: sbobroff@linux.ibm.com, Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There are several EEH sysfs properties that only exists when the
"ibm,is-open-sriov-pf" property appears in the device tree node of the PCI
device. This used on pseries to indicate to the guest that the hypervisor
allows the guest to configure the SR-IOV capability. Doing this requires
some handshaking between the guest, hypervisor and userspace when a VF is
EEH frozen which is why these properties exist.

This is all dead code on non-pseries platforms so wrap it in an #ifdef
CONFIG_PPC_PSERIES to make the dependency clearer.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/kernel/eeh_sysfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/eeh_sysfs.c b/arch/powerpc/kernel/eeh_sysfs.c
index 6a2c2886f..3adf8cd 100644
--- a/arch/powerpc/kernel/eeh_sysfs.c
+++ b/arch/powerpc/kernel/eeh_sysfs.c
@@ -91,7 +91,7 @@ static ssize_t eeh_pe_state_store(struct device *dev,
 
 static DEVICE_ATTR_RW(eeh_pe_state);
 
-#ifdef CONFIG_PCI_IOV
+#if defined(CONFIG_PCI_IOV) && defined(CONFIG_PPC_PSERIES)
 static ssize_t eeh_notify_resume_show(struct device *dev,
 				      struct device_attribute *attr, char *buf)
 {
@@ -148,7 +148,7 @@ static void eeh_notify_resume_remove(struct pci_dev *pdev)
 #else
 static inline int eeh_notify_resume_add(struct pci_dev *pdev) { return 0; }
 static inline void eeh_notify_resume_remove(struct pci_dev *pdev) { }
-#endif /* CONFIG_PCI_IOV */
+#endif /* CONFIG_PCI_IOV && CONFIG PPC_PSERIES*/
 
 void eeh_sysfs_add_device(struct pci_dev *pdev)
 {
-- 
2.9.5

