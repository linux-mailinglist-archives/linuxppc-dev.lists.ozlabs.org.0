Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EAB1247DA7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 06:47:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BVz1G00BNzDqYB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 14:47:45 +1000 (AEST)
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
 header.s=20161025 header.b=O1Bwea3J; dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BVyzT6RllzDqY5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Aug 2020 14:46:13 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id s14so2668291plp.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 21:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Fv3Nf87ocgC6VzLljM7P91Jh0f1r0BGot+nwPpJXIk0=;
 b=O1Bwea3J+owqCd7JkrtVx6GRJy9OoNmL/GbxwpPTGsTg0f/1OmUO2LHsH7ET7761+i
 rC99YEpnCJJtF/CWQMuuPNHUtFcbCtL6shqLtlYBlyR3eRd0JPGwZ07t9gf4wmwAE2EA
 9OZSc5FehIMyOf2vZfcQrur/cMUJmz4eB23DbBy07GW3YKNLGv2cod7xQfHzCBNnKrMt
 NphP0l5z0vc8IT1zoFxv8xIYDxvhC392w9y7LIO9o/lc+PdqqKE/WnUL8t83zOSPbcZt
 PKQVbq87m28vxsBrWVoJXQ2ONWC3Eqk8K8yEThFy3rVtGGa1uGave/IupDDS0b6keeBa
 ti8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Fv3Nf87ocgC6VzLljM7P91Jh0f1r0BGot+nwPpJXIk0=;
 b=cASEmLovgaI92broCveDWgsDmv/JtfBYdjvZo4M9J80VtvTHgMWA5hs60JZ6gnljyF
 yFY8dEUB7OD/OHXvNAHM4ugzHUkiFOeMyj2x/Bj214k8B+i/ZONdB4EWlVGUYegP6vsh
 tyT7PBYDW9mTKPfbvSV9WtZgUcA532lHRMRrzBUeBKl4dIhR4xbrVko/xqagk7fmJwfw
 mG/wAjeFjUTn6akUlNkIBlGmBivHn9ttUGJUFBRPGeBltlApwAOFAsCIRfS79V9yoRjr
 UePH9gqG8B1HvcEzcoG/1ymPT6UR13OX2jZDDLcJYn2yWWe/vYzlkQqiSGoS4UjB2Xa5
 Z4Pw==
X-Gm-Message-State: AOAM5312tM1UuB+M4b3wB1AwhZHKnc/kp/L+3AhfsxcD50iIr/Tdhb7N
 9COlmE+O/No58t6gsIlWa1z37yO25wPpBg==
X-Google-Smtp-Source: ABdhPJwYciSm4Ey9qjcbd/q6/96kq2r0pn8Bozo6vNIlzHPqCeHTfvJTxEAqfPkp3FPlBhd6MzLJzw==
X-Received: by 2002:a17:902:6f:: with SMTP id
 102mr13855232pla.163.1597725970007; 
 Mon, 17 Aug 2020 21:46:10 -0700 (PDT)
Received: from localhost.ibm.com (194-193-34-182.tpgi.com.au. [194.193.34.182])
 by smtp.gmail.com with ESMTPSA id f43sm20324498pjg.35.2020.08.17.21.46.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 21:46:09 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/pseries/eeh: Fix dumb linebreaks
Date: Tue, 18 Aug 2020 14:45:57 +1000
Message-Id: <20200818044557.135497-1-oohall@gmail.com>
X-Mailer: git-send-email 2.26.2
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

These annoy me every time I see them. Why are they here? They're not even
needed for 80cols compliance.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/platforms/pseries/eeh_pseries.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/eeh_pseries.c b/arch/powerpc/platforms/pseries/eeh_pseries.c
index cb2d9a970b7b..1db74cec72bc 100644
--- a/arch/powerpc/platforms/pseries/eeh_pseries.c
+++ b/arch/powerpc/platforms/pseries/eeh_pseries.c
@@ -161,8 +161,7 @@ static int pseries_eeh_phb_reset(struct pci_controller *phb, int config_addr, in
 			BUID_LO(phb->buid), option);
 
 	/* If fundamental-reset not supported, try hot-reset */
-	if (option == EEH_RESET_FUNDAMENTAL &&
-	    ret == -8) {
+	if (option == EEH_RESET_FUNDAMENTAL && ret == -8) {
 		option = EEH_RESET_HOT;
 		ret = rtas_call(ibm_set_slot_reset, 4, 1, NULL,
 				config_addr, BUID_HI(phb->buid),
@@ -170,8 +169,7 @@ static int pseries_eeh_phb_reset(struct pci_controller *phb, int config_addr, in
 	}
 
 	/* We need reset hold or settlement delay */
-	if (option == EEH_RESET_FUNDAMENTAL ||
-	    option == EEH_RESET_HOT)
+	if (option == EEH_RESET_FUNDAMENTAL || option == EEH_RESET_HOT)
 		msleep(EEH_PE_RST_HOLD_TIME);
 	else
 		msleep(EEH_PE_RST_SETTLE_TIME);
@@ -621,8 +619,7 @@ static int pseries_eeh_set_option(struct eeh_pe *pe, int option)
 		/* Not support */
 		return 0;
 	default:
-		pr_err("%s: Invalid option %d\n",
-			__func__, option);
+		pr_err("%s: Invalid option %d\n", __func__, option);
 		return -EINVAL;
 	}
 
@@ -954,8 +951,7 @@ static int pseries_notify_resume(struct eeh_dev *edev)
 	if (!edev)
 		return -EEXIST;
 
-	if (rtas_token("ibm,open-sriov-allow-unfreeze")
-	    == RTAS_UNKNOWN_SERVICE)
+	if (rtas_token("ibm,open-sriov-allow-unfreeze") == RTAS_UNKNOWN_SERVICE)
 		return -EINVAL;
 
 	if (edev->pdev->is_physfn || edev->pdev->is_virtfn)
-- 
2.26.2

