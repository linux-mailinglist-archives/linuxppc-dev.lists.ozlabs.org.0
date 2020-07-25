Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2785B22D60D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jul 2020 10:25:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BDJz82hH6zDqKP
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jul 2020 18:25:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=kNV9cvQ9; dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BDJj94NgWzDqcx
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Jul 2020 18:13:01 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id b9so5743700plx.6
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Jul 2020 01:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3l4YCCa0zDgS7uaiWa0400gRrKnoLhdj30sebYbvbIU=;
 b=kNV9cvQ9+DYPOOBaOewGdkVmnfUMlVcva83zcAqGB9voCL2Xgy/eZEk9ntIQTFWyVD
 tAXDpytR+IHpa+DRYd1c8tnYpDI1vSyif+OcvQHvCo8ewNCxXfOCK9+dab3ThXWRd/Bh
 rPw1LcrPmr9lWR4kco9jf8oyUrgnWdCVNYNe861k05t8KL787n8Vzkl28Y/gaJcrTy9p
 3M1/5H/S8ajqESkyNT2fw4kLVx/03BpZ2BQknwt3m5V+leYd9beCBBfXDoEYo9KxRykP
 0RPEjY7ToKYXU4Gb7TO7qFp4LAwwAuC5xVUZrtYXS9595kp4SWckT6Q9Y4MTvyEoTAFq
 aWWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3l4YCCa0zDgS7uaiWa0400gRrKnoLhdj30sebYbvbIU=;
 b=BnMi+PlQOoi4EnvW6c3oF4J9z2Pb4GxxC7FlXbUXq7vua5OfrOXO2lgv6+XqZedD5D
 noAaBiCz3iY8pekVMK7gmUmaVmymJSDlWVE9EYpkuArU8YAW5hGZ3nRRKRdMW4GRt8eh
 WIBpOYoPiRq6Q+31dLMnHn4ViuO02hIXrPJIEhw/gAutyCJ/meVaXykvVEmyP98cpQB3
 Y/Q4AqYlW245WM7X5CGKFBjnNtTnvLpTMf57FfIF11G3T0Un8Im7oJBT4JtHkA4eVxx0
 /aoJxxgM+fwrZp5SrczvBdX3F/D5DJu09gxkMK4oQiEwd44bFvW4/Eqb9DtNwVUH3w1a
 eCSQ==
X-Gm-Message-State: AOAM5319y6FlHBQPGrepjNr39W+4wTzfDMMaP9pD5jXrYRus51dMH5jh
 fL8rFMW42uh+u79FQgI6+YvkUZr4a+w=
X-Google-Smtp-Source: ABdhPJwejdYf4Uk7UrKEb8dP5zN4uczgu9Vz6dTBm0mG43nJg14JqLh/E4iPVPh7RsAVHjZGMw04Hg==
X-Received: by 2002:a17:90a:f00d:: with SMTP id
 bt13mr7479673pjb.109.1595664778747; 
 Sat, 25 Jul 2020 01:12:58 -0700 (PDT)
Received: from localhost.localdomain ([118.210.60.180])
 by smtp.gmail.com with ESMTPSA id a26sm8647360pgm.20.2020.07.25.01.12.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Jul 2020 01:12:58 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 07/14] powerpc/eeh: Pass eeh_dev to
 eeh_ops->restore_config()
Date: Sat, 25 Jul 2020 18:12:24 +1000
Message-Id: <20200725081231.39076-7-oohall@gmail.com>
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
 arch/powerpc/kernel/eeh.c                    | 5 ++---
 arch/powerpc/kernel/eeh_pe.c                 | 6 ++----
 arch/powerpc/platforms/powernv/eeh-powernv.c | 6 ++----
 4 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/include/asm/eeh.h b/arch/powerpc/include/asm/eeh.h
index 091d1ed28798..c23c8fd5229d 100644
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

