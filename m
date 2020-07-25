Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E8622D611
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jul 2020 10:27:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BDK1F5YjSzF1WH
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jul 2020 18:26:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1044;
 helo=mail-pj1-x1044.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=EoWval5C; dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BDJjC4fy6zF1LQ
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Jul 2020 18:13:03 +1000 (AEST)
Received: by mail-pj1-x1044.google.com with SMTP id 8so6579485pjj.1
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Jul 2020 01:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DiEMW1zoMLmlanZZKdFLL8VnyAZrke6w90z/ocog+7k=;
 b=EoWval5C0YrQWH1VmZTXTmwR6BtgdrPwIkWt0JQkmfnPGqDFY3dj+4uLXxiaXl2/sk
 nIVjjIeEDC4dug31P2stITy3aPWplE0aRkILH3U2hL3xtqQnek2seUssvX6RNGcBFZR7
 yqDUwcAB7tjtisaYjXMknEvL3P4pgettwhEM7oQWFL2trYcf3zajBwTaF1eH2/vK2WqN
 V2gEB6ypIlXvpjsfpr8GmgVccR+6C4a8yaGh4Hmm4RP2xkZ7yaGFYlAJ8EsPEjh2AFYE
 ISy2Jir309Xw6FMaGvCI6c4tjYCZXvk4AVsSt3r1rbRZIsGBjZoEQBx7/TwyzKRVoA1y
 ZVvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DiEMW1zoMLmlanZZKdFLL8VnyAZrke6w90z/ocog+7k=;
 b=q+txE0QrMCt6So93C+Mm8WTZqZgKPb3NbtadZ+N2DvEEUmUFxTaQXOpcNsiatuttIr
 vKM0xoDECZMNQ8Rtm2Rw3auMTeiEDRDDazCK1j+opDqVygZSnyYL7s/0/ubedS8dfbs0
 25CEEgTzfHVGqIFRUTU3fNAZt6a1j+uULuKsOsU5KW9i/hggJL3aoh7ONpQS4bS7TBoT
 dLixvMACrQfsESr0Lp5Da7u4NsqYh3XxrZ/1n157krETCzhJmuUvPHpwXLd5OpMS4izz
 cqHicnDp7vgYJDhdHnZrUbE5UOEGPTG1xXTM6w4F3ZcCFEEKmx1DFz4AB5+btRqKG+oh
 m77w==
X-Gm-Message-State: AOAM5316SA6zbmZTvkc7KNqlmWdSw22dzdfUPz70qVguQP7nca7uKsB3
 BwcR9k4As5a9a9nyp041P2GgRA5H5s0=
X-Google-Smtp-Source: ABdhPJydqYAyEBmcsrel4pWP4d2C76sHKMYochHnq8WoNB1oanK8cooeTolLYAUYZORXOE4/3E2SGg==
X-Received: by 2002:a17:90a:3689:: with SMTP id
 t9mr9093290pjb.28.1595664781017; 
 Sat, 25 Jul 2020 01:13:01 -0700 (PDT)
Received: from localhost.localdomain ([118.210.60.180])
 by smtp.gmail.com with ESMTPSA id a26sm8647360pgm.20.2020.07.25.01.12.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Jul 2020 01:13:00 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 08/14] powerpc/eeh: Pass eeh_dev to eeh_ops->resume_notify()
Date: Sat, 25 Jul 2020 18:12:25 +1000
Message-Id: <20200725081231.39076-8-oohall@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200725081231.39076-1-oohall@gmail.com>
References: <20200725081231.39076-1-oohall@gmail.com>
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
Cc: Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Mechanical conversion of the eeh_ops interfaces to use eeh_dev to reference
a specific device rather than pci_dn. No functional changes.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
v2: no changes
v3: no changes
---
 arch/powerpc/include/asm/eeh.h               | 2 +-
 arch/powerpc/kernel/eeh_driver.c             | 4 ++--
 arch/powerpc/kernel/eeh_sysfs.c              | 2 +-
 arch/powerpc/platforms/pseries/eeh_pseries.c | 4 +---
 4 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/include/asm/eeh.h b/arch/powerpc/include/asm/eeh.h
index c23c8fd5229d..73e6a73a3684 100644
--- a/arch/powerpc/include/asm/eeh.h
+++ b/arch/powerpc/include/asm/eeh.h
@@ -230,7 +230,7 @@ struct eeh_ops {
 	int (*write_config)(struct pci_dn *pdn, int where, int size, u32 val);
 	int (*next_error)(struct eeh_pe **pe);
 	int (*restore_config)(struct eeh_dev *edev);
-	int (*notify_resume)(struct pci_dn *pdn);
+	int (*notify_resume)(struct eeh_dev *edev);
 };
 
 extern int eeh_subsystem_flags;
diff --git a/arch/powerpc/kernel/eeh_driver.c b/arch/powerpc/kernel/eeh_driver.c
index b70b9273f45a..b84d3cb2532e 100644
--- a/arch/powerpc/kernel/eeh_driver.c
+++ b/arch/powerpc/kernel/eeh_driver.c
@@ -425,8 +425,8 @@ static enum pci_ers_result eeh_report_resume(struct eeh_dev *edev,
 
 	pci_uevent_ers(edev->pdev, PCI_ERS_RESULT_RECOVERED);
 #ifdef CONFIG_PCI_IOV
-	if (eeh_ops->notify_resume && eeh_dev_to_pdn(edev))
-		eeh_ops->notify_resume(eeh_dev_to_pdn(edev));
+	if (eeh_ops->notify_resume)
+		eeh_ops->notify_resume(edev);
 #endif
 	return PCI_ERS_RESULT_NONE;
 }
diff --git a/arch/powerpc/kernel/eeh_sysfs.c b/arch/powerpc/kernel/eeh_sysfs.c
index 4fb0f1e1017a..429620da73ba 100644
--- a/arch/powerpc/kernel/eeh_sysfs.c
+++ b/arch/powerpc/kernel/eeh_sysfs.c
@@ -99,7 +99,7 @@ static ssize_t eeh_notify_resume_store(struct device *dev,
 	if (!edev || !edev->pe || !eeh_ops->notify_resume)
 		return -ENODEV;
 
-	if (eeh_ops->notify_resume(pci_get_pdn(pdev)))
+	if (eeh_ops->notify_resume(edev))
 		return -EIO;
 
 	return count;
diff --git a/arch/powerpc/platforms/pseries/eeh_pseries.c b/arch/powerpc/platforms/pseries/eeh_pseries.c
index 39cdf447dfa6..426227ddee32 100644
--- a/arch/powerpc/platforms/pseries/eeh_pseries.c
+++ b/arch/powerpc/platforms/pseries/eeh_pseries.c
@@ -793,10 +793,8 @@ static int pseries_call_allow_unfreeze(struct eeh_dev *edev)
 	return rc;
 }
 
-static int pseries_notify_resume(struct pci_dn *pdn)
+static int pseries_notify_resume(struct eeh_dev *edev)
 {
-	struct eeh_dev *edev = pdn_to_eeh_dev(pdn);
-
 	if (!edev)
 		return -EEXIST;
 
-- 
2.26.2

