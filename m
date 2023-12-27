Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9047F81EB91
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Dec 2023 03:41:30 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=cE3ZkEt0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T0G9h2mRrz3cV9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Dec 2023 13:41:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=cE3ZkEt0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102b; helo=mail-pj1-x102b.google.com; envelope-from=kernelfans@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T0G7y3K33z2xcn
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Dec 2023 13:39:58 +1100 (AEDT)
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-28b06be7cf6so1724461a91.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Dec 2023 18:39:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703644795; x=1704249595; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eIL9z1K+903Rh3aHRwyuDGVekLCKVq2u3rRzi6i5f88=;
        b=cE3ZkEt0RIpUz9FILUFAd46D3HqD3Q/6pR6OCxQksSepfVstO6mXxT6OM3Kko2haY9
         RNa0jXGCzeLYZZR4qZbkvPcdZAY1faeX5Mwh0XlEr3S1TN4nvjGBVRP/KYcy9HC5qQ5e
         fQffnLm62QYjIrQaolI5wD2f90U5iNdB89+1XHxhoxHljtlrGClP3PTwsoXy+uEqROqg
         lt4+Y2jtyQihSMZkKOAMlQn2lwtW9i8g6btEnb4zgs2dfLZE6Y7hAn+DPFjzpAqTCOuu
         FniOLjk1nilZk+KN/NLIIw5IVIMnWarO8s2ONkTyFztd1NVNe3Jv4F798zHbnkjhcpfX
         uwyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703644795; x=1704249595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eIL9z1K+903Rh3aHRwyuDGVekLCKVq2u3rRzi6i5f88=;
        b=fj1YSuNIlD0EA5dz6f9+lXH+/31Uz5AmApX9KllagUjdiOcM6iSzD0DgRjlrndcaZp
         +gkaxRc5Dq1Ysc1C0bbbtPZDAuq6fD1QpY/96VClWUDDxifMSffQMWgDec22BwW0lL8t
         Idn3im9Pz1zNqkm7c9e7tcBGEi9wu941B/gVuCIFVskK/uwK8n5XtO7lRNXuEyXj1xDT
         RYCqRd3SRZWueUdnI5weVw4A+JD1lwbtuN15MwHMoVJWjGo797e3rQrJoffYyHAczmjN
         Lc/aZrFXBQKDOEhxFdEDyJy+n1DAwMmGyQqwguPdxrMmP9jk4TtH//TgFRPub6hbfL7X
         jdWg==
X-Gm-Message-State: AOJu0Yw34oQGrZEsaQCJ1rNMe3pTvc7nJ8ZVozbRcE33InRWUzyBv4Qh
	ftTn0/PpaWdE8nw7kFzkaGSlawVRNQCF
X-Google-Smtp-Source: AGHT+IGZvG3gCfSUeZvM4P88xxoLyrISs0xdog3hM2HWUCBOAqPUfCfKMA7wSU2kc9npPVA0sBX3jw==
X-Received: by 2002:a17:90a:b396:b0:285:adb1:6acb with SMTP id e22-20020a17090ab39600b00285adb16acbmr2089744pjr.29.1703644795539;
        Tue, 26 Dec 2023 18:39:55 -0800 (PST)
Received: from piliu.users.ipa.redhat.com ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id y8-20020a17090a134800b0028c387b2528sm6727454pjf.8.2023.12.26.18.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Dec 2023 18:39:54 -0800 (PST)
From: Pingfan Liu <kernelfans@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCHv10 1/3] powerpc/kernel: Remove check on paca_ptrs_size
Date: Wed, 27 Dec 2023 10:39:32 +0800
Message-Id: <20231227023934.12299-2-kernelfans@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20231227023934.12299-1-kernelfans@gmail.com>
References: <20231227023934.12299-1-kernelfans@gmail.com>
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
Cc: Baoquan He <bhe@redhat.com>, Pingfan Liu <piliu@redhat.com>, kexec@lists.infradead.org, Mahesh Salgaonkar <mahesh@linux.ibm.com>, Ming Lei <ming.lei@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, Sourabh Jain <sourabhjain@linux.ibm.com>, Hari Bathini <hbathini@linux.ibm.com>, Wen Xiong <wenxiong@us.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Pingfan Liu <piliu@redhat.com>

Between early_setup()->allocate_paca_ptrs() and
smp_setup_cpu_maps()->free_unused_pacas(), there is no call to
set_nr_cpu_ids(), which means nr_cpu_ids is unchanged.

Hence removing the check.

Signed-off-by: Pingfan Liu <piliu@redhat.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Cc: Wen Xiong <wenxiong@us.ibm.com>
Cc: Baoquan He <bhe@redhat.com>
Cc: Ming Lei <ming.lei@redhat.com>
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: Hari Bathini <hbathini@linux.ibm.com>
Cc: kexec@lists.infradead.org
To: linuxppc-dev@lists.ozlabs.org
---
 arch/powerpc/kernel/paca.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/arch/powerpc/kernel/paca.c b/arch/powerpc/kernel/paca.c
index cda4e00b67c1..760f371cf096 100644
--- a/arch/powerpc/kernel/paca.c
+++ b/arch/powerpc/kernel/paca.c
@@ -286,16 +286,6 @@ void __init allocate_paca(int cpu)
 
 void __init free_unused_pacas(void)
 {
-	int new_ptrs_size;
-
-	new_ptrs_size = sizeof(struct paca_struct *) * nr_cpu_ids;
-	if (new_ptrs_size < paca_ptrs_size)
-		memblock_phys_free(__pa(paca_ptrs) + new_ptrs_size,
-				   paca_ptrs_size - new_ptrs_size);
-
-	paca_nr_cpu_ids = nr_cpu_ids;
-	paca_ptrs_size = new_ptrs_size;
-
 #ifdef CONFIG_PPC_64S_HASH_MMU
 	if (early_radix_enabled()) {
 		/* Ugly fixup, see new_slb_shadow() */
@@ -304,9 +294,6 @@ void __init free_unused_pacas(void)
 		paca_ptrs[boot_cpuid]->slb_shadow_ptr = NULL;
 	}
 #endif
-
-	printk(KERN_DEBUG "Allocated %u bytes for %u pacas\n",
-			paca_ptrs_size + paca_struct_size, nr_cpu_ids);
 }
 
 #ifdef CONFIG_PPC_64S_HASH_MMU
-- 
2.31.1

