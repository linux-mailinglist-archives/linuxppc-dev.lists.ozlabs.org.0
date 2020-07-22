Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 20039228F53
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 06:44:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBNCS17zDzDqs3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 14:44:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=P7091w6V; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBMqm3wsszDqlW
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 14:27:00 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id e8so528913pgc.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jul 2020 21:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AB9Ka6+610Yg1PaaEJ5G7LhQ7FHKr2tBgldtgukZ6Bw=;
 b=P7091w6VvAi63JVV9FRSXSZoTflkzSUGl+CVyQEjTva4rWcwFg3L1WYkf5kGtsMXXw
 J4ZNOpgBC1O+dPAru9SOCq/yXadVzCgD0n4EZJVibJk3ZZ+aUhCQ0hk3NsGGjBslb4Vp
 uoul4u5lYW1nrVtkD1XlFfTqgKxAHPP3lVTbfHCsrC9vP5XuOoyFvd0FTAteNEuYULRV
 FABDc+1eyWGgEEYrOXU4cD9fMGZRWMqJJ6thCau0sgvB1jHtKXQxdXVIRoROmXpdeADe
 brhUt8Rzc+/p8aTK4KspnvzmU1U9mAzJi7SEmcMS+eHVBQAiLg7piCCrPPNqezqywBfw
 Cr1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AB9Ka6+610Yg1PaaEJ5G7LhQ7FHKr2tBgldtgukZ6Bw=;
 b=msj+F8KiUJZa9bpR1/eEtkTQjl+qc8kglBdM3skvnJ1GGHhKr51vIPEDgKlFTQkaqZ
 QkL0o4erbbYBImiK1tTvgIrnPZscP7dpWBvRbrpbomAFfu7jTJ/aTgekM8kHGHNdKmcW
 QjmewOfNnhN3KR98QIA6H92ZTYeksQ2ZNnnlpYHPb2UMHnD0fvRFZQswTIIetJC9W0wD
 ozgrZHYt8UUqyvbJVYm2La9DpVYPwsclU/8v5AnzEkVARQe4ERq6M5QoMpawLmG1J1Kd
 4fQoJY9cgZ1iCAk+F56lm2GOrO0lW+u0t1JKLBoPVESVjShsImI7hvgpusz2vr4zjkNZ
 NpwQ==
X-Gm-Message-State: AOAM532rIbXZa+x7Mv77DP4s9vnW0VFNB4emhqirv9S7VoE7pXxppiBx
 InVpRMJvSZiECd7bRunZ3cOXIYU09FU=
X-Google-Smtp-Source: ABdhPJzUDP2Of0BzwpnGW24eUDeqJmL2qMwh/iru6fzRFYzDoh55/KvTdI7VgEfKtAQ1iKL3fBdjzw==
X-Received: by 2002:a63:925a:: with SMTP id s26mr25111355pgn.21.1595392018284; 
 Tue, 21 Jul 2020 21:26:58 -0700 (PDT)
Received: from localhost.ibm.com (203-219-159-24.tpgi.com.au. [203.219.159.24])
 by smtp.gmail.com with ESMTPSA id d4sm20583709pgf.9.2020.07.21.21.26.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 21:26:57 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 08/14] powerpc/eeh: Pass eeh_dev to eeh_ops->resume_notify()
Date: Wed, 22 Jul 2020 14:26:22 +1000
Message-Id: <20200722042628.1425880-8-oohall@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200722042628.1425880-1-oohall@gmail.com>
References: <20200722042628.1425880-1-oohall@gmail.com>
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
---
 arch/powerpc/include/asm/eeh.h               | 2 +-
 arch/powerpc/kernel/eeh_driver.c             | 4 ++--
 arch/powerpc/kernel/eeh_sysfs.c              | 2 +-
 arch/powerpc/platforms/pseries/eeh_pseries.c | 4 +---
 4 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/include/asm/eeh.h b/arch/powerpc/include/asm/eeh.h
index 70a686d731f6..8045cede0df9 100644
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

