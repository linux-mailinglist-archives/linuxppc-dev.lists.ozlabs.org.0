Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5083F21510C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jul 2020 03:56:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B0TFq68krzDqQv
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jul 2020 11:56:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::443;
 helo=mail-wr1-x443.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=iA79hKzo; dkim-atps=neutral
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B0Spz1F3zzDqZq
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Jul 2020 11:36:59 +1000 (AEST)
Received: by mail-wr1-x443.google.com with SMTP id q5so39109333wru.6
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 05 Jul 2020 18:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wQTMjfwqff3bZE+V6/dOs28Rc+7D6ZJEYu2WHLbNgsw=;
 b=iA79hKzow92vqI/ldyQ99Ano3fY+rC5Zzq85mESI9DrkRAPqP8OzeS0r+2MhVRP5dT
 kG/UA+ot7g13lxqLB6ZBc+ren5Df4YYRl7xtEiTAVSeq+GQojH/Ao7S8dWpP7vzO9yZU
 1tU15XZWUsdW/rSOn46hyAc32Z9PfOsoqzyGbOge5UBIuHgaeEw/Gw0xYRqoKjPUCw2+
 CZzP1YdGyU7gIgKEsGwRGnh+ta9l5s19hWdP9v44XorjpUJwZI/RXHoh4PGTtcclSJB8
 y3Lz8J6VO5xY3XcwzRC2zpL+vyczmGDI4UlVbUDrAm9DXPQyYHzpj4GXouddGFaLB1Qu
 m21A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wQTMjfwqff3bZE+V6/dOs28Rc+7D6ZJEYu2WHLbNgsw=;
 b=cXpsZoTRlAuzvrPkwaQjAjl5nztpAqYtReeDwfDaWmlrplyYoHfWSHaAWhKEy7cW6y
 +HjW/W1ulvrZXovtB5UODmV20ShRcL6+hPfm1iwPw6ye1sa4m1mb06tRVvH3fJlZHFVO
 vcffcUmlRmxAnSf5Y+ama3yiJvPFktZiw6ZsxoI+VrqcEM5elLHrXRHdV2u3sNzxXbaf
 tpr3QWuoB8PU6YK/W2mPc/tS3WFhNnd47jXE2kPiohlc4THikX5lZkidYXof22IfqAo5
 +kAjFpfM9n1pE2fRtBVjL26hrGJ5yNFGY8x8IP7EKLBF6S0Lt+1RP3D+x1Yl/taByZCE
 UewA==
X-Gm-Message-State: AOAM532nkLxTrsx3BortIR1uyqP7lUYg+FsWEqUDbTQuk6LFtp1xwGRG
 vaqjXgjz966AMxr8dTHacYat8j74/1E=
X-Google-Smtp-Source: ABdhPJxc0FIpIM9eNemcXPRv4NxWczA3esjk1ln3TfmyFcDXN3mA9CNVA5mBuMKkS2L+xgxAKtCeBg==
X-Received: by 2002:adf:c542:: with SMTP id s2mr19414583wrf.132.1593999416348; 
 Sun, 05 Jul 2020 18:36:56 -0700 (PDT)
Received: from 192-168-1-18.tpgi.com.au (59-102-73-59.tpgi.com.au.
 [59.102.73.59])
 by smtp.gmail.com with ESMTPSA id v6sm9533392wrr.85.2020.07.05.18.36.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jul 2020 18:36:55 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 07/14] powerpc/eeh: Pass eeh_dev to eeh_ops->restore_config()
Date: Mon,  6 Jul 2020 11:36:12 +1000
Message-Id: <20200706013619.459420-8-oohall@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200706013619.459420-1-oohall@gmail.com>
References: <20200706013619.459420-1-oohall@gmail.com>
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
Cc: Oliver O'Halloran <oohall@gmail.com>, mahesh@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Mechanical conversion of the eeh_ops interfaces to use eeh_dev to reference
a specific device rather than pci_dn. No functional changes.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/include/asm/eeh.h               | 2 +-
 arch/powerpc/kernel/eeh.c                    | 5 ++---
 arch/powerpc/kernel/eeh_pe.c                 | 6 ++----
 arch/powerpc/platforms/powernv/eeh-powernv.c | 6 ++----
 4 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/include/asm/eeh.h b/arch/powerpc/include/asm/eeh.h
index 046c5a2fe411..3eeaa5ef852f 100644
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

