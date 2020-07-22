Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 14FA9228F48
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 06:42:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBN9F5pgzzDqKP
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 14:42:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1042;
 helo=mail-pj1-x1042.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=iT6WPK6z; dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBMqk5vgyzDqkR
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 14:26:58 +1000 (AEST)
Received: by mail-pj1-x1042.google.com with SMTP id k1so488461pjt.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jul 2020 21:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ze20ksTuBhoZApK5NwZljmBFYwqiIv+Z+d5XrcsgsJY=;
 b=iT6WPK6zCZ0vJSGyZLFG4PIET6TJqLQtI7P0xu7ujTgPndYcYVnTX6F2FUsWoQZs48
 bg2mBSGV9Uo7sB3yclvCYwlhO8I3b9EdD/QNIXkC20nx5Ma+goKaNId4664wxqzVURwI
 JoiZic7eWIm+0nM/D4nMUMtIL9SoLN7wfWtqEwpKpw6gy4wROzjm7R8UOyRTHdsmkFm3
 tNWoNdy05j0JVUjsy4fsY/2MN482eOcPvac9Q54m31Pf16QyWsYywiPAYBSHI6TRAV94
 rLd0ouNNUp7GcVTSjv0EiiXFjMZwkGrvkwyRtaWN5ABhyO3S54AGaW650a2ziVfJcBvQ
 hZFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ze20ksTuBhoZApK5NwZljmBFYwqiIv+Z+d5XrcsgsJY=;
 b=gXJnorqIS1uDCFGG4L6bag7zxEc4RHeUoh0sOaGHkw27rJzETBViEvpO11NCgQDzsV
 mMcnFNpFamCVwd8vz0E/hVaJSotVa3yvBsmve9FrfuerTYKWdPAPXZqEhUKOwEf9mR1e
 I4Yecs1Ip0VBbMargtLuYQEPC+ajl9BYe3/B5CIpecO/gduzN9MbgaD6aEFAknJ6p7p5
 xlRf7ak3Rnn4tk3X3TImKTc8Ycps+u4/1sgm3ve/ADL0INOYZQNoeUVk07B5qHGuR6md
 UNxsIG3/Yq34q6ZJcmmuuklJsziqac8oBYnYZpb7w5vBIelSwSPTYvQ1bQnHecPA0RTO
 3PmQ==
X-Gm-Message-State: AOAM533fnHV22hT9Qa5I9opKhVZSKNKT4bsvgQX8DoC/t/z60gKAmAPV
 EThGllfBwnNNLvSLrveXll1ASMNjbfU=
X-Google-Smtp-Source: ABdhPJw6cGRwAm7HcK9Oo3L6QmRB00utSK3rNffDFscPEinosZDe+OumgMTQNGz5ViED7CciM2PNyw==
X-Received: by 2002:a17:90a:668f:: with SMTP id
 m15mr8192670pjj.32.1595392016413; 
 Tue, 21 Jul 2020 21:26:56 -0700 (PDT)
Received: from localhost.ibm.com (203-219-159-24.tpgi.com.au. [203.219.159.24])
 by smtp.gmail.com with ESMTPSA id d4sm20583709pgf.9.2020.07.21.21.26.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 21:26:55 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 07/14] powerpc/eeh: Pass eeh_dev to
 eeh_ops->restore_config()
Date: Wed, 22 Jul 2020 14:26:21 +1000
Message-Id: <20200722042628.1425880-7-oohall@gmail.com>
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
 arch/powerpc/kernel/eeh.c                    | 5 ++---
 arch/powerpc/kernel/eeh_pe.c                 | 6 ++----
 arch/powerpc/platforms/powernv/eeh-powernv.c | 6 ++----
 4 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/include/asm/eeh.h b/arch/powerpc/include/asm/eeh.h
index c7d5a234bb51..70a686d731f6 100644
--- a/arch/powerpc/include/asm/eeh.h
+++ b/arch/powerpc/include/asm/eeh.h
@@ -229,7 +229,7 @@ struct eeh_ops {
 	int (*read_config)(struct pci_dn *pdn, int where, int size, u32 *val);
 	int (*write_config)(struct pci_dn *pdn, int where, int size, u32 val);
 	int (*next_error)(struct eeh_pe **pe);
-	int (*restore_config)(struct pci_dn *pdn);
+	int (*restore_config)(struct eeh_dev *edev);
 	int (*notify_resume)(struct pci_dn *pdn);
 };
 
diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
index a4df6f6de0bd..1cef0f4bb2d5 100644
--- a/arch/powerpc/kernel/eeh.c
+++ b/arch/powerpc/kernel/eeh.c
@@ -726,7 +726,6 @@ static void eeh_disable_and_save_dev_state(struct eeh_dev *edev,
 
 static void eeh_restore_dev_state(struct eeh_dev *edev, void *userdata)
 {
-	struct pci_dn *pdn = eeh_dev_to_pdn(edev);
 	struct pci_dev *pdev = eeh_dev_to_pci_dev(edev);
 	struct pci_dev *dev = userdata;
 
@@ -734,8 +733,8 @@ static void eeh_restore_dev_state(struct eeh_dev *edev, void *userdata)
 		return;
 
 	/* Apply customization from firmware */
-	if (pdn && eeh_ops->restore_config)
-		eeh_ops->restore_config(pdn);
+	if (eeh_ops->restore_config)
+		eeh_ops->restore_config(edev);
 
 	/* The caller should restore state for the specified device */
 	if (pdev != dev)
diff --git a/arch/powerpc/kernel/eeh_pe.c b/arch/powerpc/kernel/eeh_pe.c
index 177852e39a25..d71493f66917 100644
--- a/arch/powerpc/kernel/eeh_pe.c
+++ b/arch/powerpc/kernel/eeh_pe.c
@@ -843,16 +843,14 @@ static void eeh_restore_device_bars(struct eeh_dev *edev)
  */
 static void eeh_restore_one_device_bars(struct eeh_dev *edev, void *flag)
 {
-	struct pci_dn *pdn = eeh_dev_to_pdn(edev);
-
 	/* Do special restore for bridges */
 	if (edev->mode & EEH_DEV_BRIDGE)
 		eeh_restore_bridge_bars(edev);
 	else
 		eeh_restore_device_bars(edev);
 
-	if (eeh_ops->restore_config && pdn)
-		eeh_ops->restore_config(pdn);
+	if (eeh_ops->restore_config)
+		eeh_ops->restore_config(edev);
 }
 
 /**
diff --git a/arch/powerpc/platforms/powernv/eeh-powernv.c b/arch/powerpc/platforms/powernv/eeh-powernv.c
index 8f3a7611efc1..a41e67f674e6 100644
--- a/arch/powerpc/platforms/powernv/eeh-powernv.c
+++ b/arch/powerpc/platforms/powernv/eeh-powernv.c
@@ -1619,12 +1619,10 @@ static int pnv_eeh_next_error(struct eeh_pe **pe)
 	return ret;
 }
 
-static int pnv_eeh_restore_config(struct pci_dn *pdn)
+static int pnv_eeh_restore_config(struct eeh_dev *edev)
 {
-	struct eeh_dev *edev = pdn_to_eeh_dev(pdn);
 	struct pnv_phb *phb;
 	s64 ret = 0;
-	int config_addr = (pdn->busno << 8) | (pdn->devfn);
 
 	if (!edev)
 		return -EEXIST;
@@ -1638,7 +1636,7 @@ static int pnv_eeh_restore_config(struct pci_dn *pdn)
 
 	if (ret) {
 		pr_warn("%s: Can't reinit PCI dev 0x%x (%lld)\n",
-			__func__, config_addr, ret);
+			__func__, edev->bdfn, ret);
 		return -EIO;
 	}
 
-- 
2.26.2

