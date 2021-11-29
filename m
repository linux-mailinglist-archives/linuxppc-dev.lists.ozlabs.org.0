Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30118460D17
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 04:15:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J2Vq4716bz3f5J
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 14:15:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=QiYfSGuK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42d;
 helo=mail-pf1-x42d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=QiYfSGuK; dkim-atps=neutral
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J2Vft5jKRz3cGq
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Nov 2021 14:08:38 +1100 (AEDT)
Received: by mail-pf1-x42d.google.com with SMTP id z6so15305209pfe.7
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Nov 2021 19:08:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=taZLnlPrXdCP99uSGAqCJpCbv2P0WZx06q/5cluHg4Y=;
 b=QiYfSGuKDtmemg/JXHpYfBg+za67r5EsWY1XmX9NdmCsHXDHI1bCxY9tfYQip8VI5f
 gaaXx9Zv1znoHZIsdXp+oiQZZ8JgscMO6y24Qw2ggy1MuTD+6agp3xO7prFTPMfp25RC
 pNWvr5HLveTC1sR9TXbFKjot5fiMj1V2HHR6g/OoniLFcnSLI4bhQRkwAto5EZ9MVtlC
 MxzYvMBVwo7vcCj/xOkOKpEN5K5gmTyt543VIOpLy3AJ5CnLjy4AATCN7Af+ll61h9dI
 qWX151O3l3kyMbQ39Zcn6E/y436ozT9+7MI7qAOjeJBSFxArdkgBcIrKJ9ilo7NKn2cf
 3I3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=taZLnlPrXdCP99uSGAqCJpCbv2P0WZx06q/5cluHg4Y=;
 b=Wxm8ikR7Spe6Q+NIFAqShLk8obbbMmB93WvG4/EoDSaIsBlyK9TmHcHI0Q8Uux4YV8
 OjetHLbDDLxTTOeJvkl7gd5L8YN9bQOeJz9R5pVXpU/j9evS+i44FuC7ErqkLXfZFh/G
 iGev7mYnTwBgx2J9+lWSfjoatvlOZL5m2+qDmIFELbShm20AaCE1ArZhDruex/wC0a6g
 dZ+hq4p4GYuZAFxCT9veZGz0UJJhvoCp1I2NRewilRYci7zPWA9FEdt/X4KyzAHLADt2
 OVNRS6mtQZfG7Fi5bNRo5tzwnOvbBjiZSWYfgiXWxktXoh9b8vXyz0wdAAm98j3RXAVY
 Jvlg==
X-Gm-Message-State: AOAM53188OOys9Vxbgx09x4t7HHBx9GSosmwf11QuvYtENvruOoUmUNN
 Ct+INLHVJldCeSlpxw06nZm3jR/kDE4=
X-Google-Smtp-Source: ABdhPJz4lvBTNyunFR2Wlj7Kh0BZrvODMmXBZk1aKIx/A2NfPipgp0yrO6JH33CKRBY0FHv+051PIg==
X-Received: by 2002:aa7:9af6:0:b0:4a2:fa4a:714c with SMTP id
 y22-20020aa79af6000000b004a2fa4a714cmr36497343pfp.40.1638155316815; 
 Sun, 28 Nov 2021 19:08:36 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (115-64-213-93.static.tpgi.com.au.
 [115.64.213.93])
 by smtp.gmail.com with ESMTPSA id h8sm15462908pfh.10.2021.11.28.19.08.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 19:08:36 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 11/17] powerpc/64: pcpu setup avoid reading
 mmu_linear_psize on 64e or radix
Date: Mon, 29 Nov 2021 13:07:57 +1000
Message-Id: <20211129030803.1888161-12-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211129030803.1888161-1-npiggin@gmail.com>
References: <20211129030803.1888161-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Radix never sets mmu_linear_psize so it's always 4K, which causes pcpu
atom_size to always be PAGE_SIZE. 64e sets it to 1GB always.

Make paths for these platforms to be explicit about what value they set
atom_size to.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/setup_64.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
index 6052f5d5ded3..9a493796ce66 100644
--- a/arch/powerpc/kernel/setup_64.c
+++ b/arch/powerpc/kernel/setup_64.c
@@ -880,14 +880,23 @@ void __init setup_per_cpu_areas(void)
 	int rc = -EINVAL;
 
 	/*
-	 * Linear mapping is one of 4K, 1M and 16M.  For 4K, no need
-	 * to group units.  For larger mappings, use 1M atom which
-	 * should be large enough to contain a number of units.
+	 * BookE and BookS radix are historical values and should be revisited.
 	 */
-	if (mmu_linear_psize == MMU_PAGE_4K)
+	if (IS_ENABLED(CONFIG_PPC_BOOK3E)) {
+		atom_size = SZ_1M;
+	} else if (radix_enabled()) {
 		atom_size = PAGE_SIZE;
-	else
-		atom_size = 1 << 20;
+	} else {
+		/*
+		 * Linear mapping is one of 4K, 1M and 16M.  For 4K, no need
+		 * to group units.  For larger mappings, use 1M atom which
+		 * should be large enough to contain a number of units.
+		 */
+		if (mmu_linear_psize == MMU_PAGE_4K)
+			atom_size = PAGE_SIZE;
+		else
+			atom_size = SZ_1M;
+	}
 
 	if (pcpu_chosen_fc != PCPU_FC_PAGE) {
 		rc = pcpu_embed_first_chunk(0, dyn_size, atom_size, pcpu_cpu_distance,
-- 
2.23.0

