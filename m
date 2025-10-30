Return-Path: <linuxppc-dev+bounces-13558-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AB455C20CAF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Oct 2025 16:00:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cy6jL2p0Jz3ccr;
	Fri, 31 Oct 2025 02:00:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761836406;
	cv=none; b=NkcXKOKgM+uz295CzjAOZDtRzgWFheW1ZxVluwvav+pXt7RcqI/fAVpEB8sfCdnOoUliDi7j4lk/yarjFcDLIUGekVrUE5UNQj0vClo6uimj692vtKSC8pRxoA2/McZNu0Hi+yAu8CyY4O/mY6Rjf7pYZNQuPWltNMh5xXNT2V/ngcvOy62V0SwXwmHK0pLjkgoQtR04HLi9skM6S3jAVrYcTBg9tz5Abu7DrcUgfusfqq/YISf+l8mKyhmltq8kFm/VGUfmkYE1L2o/3ciyihqmq2B6VqXpjvM0+rxZ5FywaQs4RZ0YghRn34N4PScg2xDBlAkzML40jF+Su2JK7A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761836406; c=relaxed/relaxed;
	bh=vJb96IflEzDyGMKrbWgZ0EtREE8uI+XwhVJjEXFJea8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kOW1VPWPgFcdo2p9qvx/gW6KW+zC0Az/EmYRvCpXDo0d2JjceoWQ6i89zPw1Xbrchry1+AIam9IiMYPxQahjh2WQuyhXbRP0qWWZ2m5Df16rMxwD/0NX4B5Gdus1eMYAwCnKwIph9Eh4qZoY/Ept8qHb8e/yScgaLtyCWaoQ8Mx+xgFfuriBQp7H7/5ZwlITFHXH6n4EN7r72XT0/X6LxCnDTP/SuADLB2iPtsjHN5UGwD0LjEgE4SfklFdwo7PwAIaD2eITI2csEpuPiFqzz3Nxk22awogbPwZL0sBzrZqsKh4VgVGAwpZZazEjmfwc6+AJ9fdg261xWXpnk1GllQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=b5PDUsyn; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=b5PDUsyn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cy6jK45sDz3cbF
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Oct 2025 02:00:05 +1100 (AEDT)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-7811a02316bso987319b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Oct 2025 08:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761836403; x=1762441203; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vJb96IflEzDyGMKrbWgZ0EtREE8uI+XwhVJjEXFJea8=;
        b=b5PDUsynr/tO5dv1sGekIpPr9BQZst/6R6k2v9gAF2y+lTyOGzl78fBwkrS7cuGQHX
         nUGCHtVVyWVGxc2jASopnQLEkvgn9UA+ZItgv8703aCTgwc4Jy27ieIaTVFitqbDzWnA
         +dvtL6A7Yxvh3OrtBSvO5HNB7wlbsrL6fEFKQfgNFJOzrKw2t15QHG/cf1BWOajaVSEv
         qen6hFzvVtaYzR0J58uhWdWL65keaXZr27OYPsbN+xmbu/7CMCMkxgHmXmgWLEtarK52
         hFRRTPTmRd6Qob0wyOw9gm8bzQWSuu/hdBgMIeXjAtkuEMkI28xkB5L6LjHWJtNnf0bb
         Flww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761836403; x=1762441203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vJb96IflEzDyGMKrbWgZ0EtREE8uI+XwhVJjEXFJea8=;
        b=Mf3WMILty49d1p0GMnKAOWs82R9Jo+man5/iqRMKdgz9bZ6Y05DjIapWJyc4983rHB
         4XHIhuIxPPnkdF+B//tYJLQzyNrvT+AKB4ENHTMAW34Hb04EEJdfy4ylP3wUFjR1WJUG
         I2hApfE5L/1saRX2y6pwZcIkFxjuTPwlTJVi/IxWiYXgG+PmVCg2K5e8BHhdnYRtYvTX
         Jfvd3Qn/4+ARtHaSXGKP7eKnBSyIZUJHL4nFVDa3I2U3JNxjzDbJxjQhUGPpnlTfx8zZ
         mjZMrTFdFxMFFUbTIX8wkzWWyZFOvsx9BYk0Z27DzRMB+xZ3IHUwtnFbXKes78YzHkxM
         Ysmw==
X-Gm-Message-State: AOJu0Yx/LkyowYhW/YWl5tf1SSgtzm7QhGbWT+op8xhCxPHH/eqGKTs+
	SbRrWllMI0gRvoB19x7Nym6ufhiL5KQPO/i3fS05p/ow+Q5BFNBSFmEeiinoKd6A
X-Gm-Gg: ASbGncsV1CZ1WkyKFLj2sRy61gEyDv6HVyIul+igF/+6y9l8aNqRkK+u7sQkTinUPXb
	WkCCD6p7pahnBJvbgPbwViz2EDccTDytWk6TNHHx4Avo6GLathJFmCv4UaZ8LkmCLPBioI8mq/s
	lNVcMfJgzCppTLIsjdO9ZPk9nY0HbcTio2NVCT7Wb280hcYcPyvKrjpL+yOK+9bV4Lfqv9UKYXX
	rvBwWvfQzC5ewEa/jx0gM+8Q+IqiAN9kykCHoRT4CN0Q1PkSb6SuvzyiiB8KxGgjKzQW7j1FNdn
	Hlf+6aDJTJK7+UXS/hJPFO5Z32gSFpi8G/vjjFZUcFOV2vWcMpY0pxsK/N3pbDrdJr0yMTozUyT
	8AlXQLaOaSXAy/jkKGT/w9JZpRjNw68r64uPQEREnOxeRIK+Fe0Tz+glYkWmUgKhhfGhKyw==
X-Google-Smtp-Source: AGHT+IFp1j/DQ46Yd3jzyYBwuPqMFmxylEuzAmf/qtgdMTx1utI60DIauX3ZcEE8+GVzYEYHAbSUWg==
X-Received: by 2002:a05:6a21:998d:b0:2e3:a914:aab7 with SMTP id adf61e73a8af0-34654eed7demr8864805637.47.1761836402988;
        Thu, 30 Oct 2025 08:00:02 -0700 (PDT)
Received: from dw-tp ([171.76.85.117])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a41404987esm18594112b3a.36.2025.10.30.07.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 08:00:02 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Mackerras <paulus@ozlabs.org>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Donet Tom <donettom@linux.ibm.com>,
	Pavithra Prakash <pavrampu@linux.ibm.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [PATCH v2 02/11] powerpc/64s/hash: Restrict stress_hpt_struct memblock region to within RMA limit
Date: Thu, 30 Oct 2025 20:27:27 +0530
Message-ID: <ada1173933ea7617a994d6ee3e54ced8797339fc.1761834163.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1761834163.git.ritesh.list@gmail.com>
References: <cover.1761834163.git.ritesh.list@gmail.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

When HV=0 & IR/DR=0, the Hash MMU is said to be in Virtual Real
Addressing Mode during early boot. During this, we should ensure that
memory region allocations for stress_hpt_struct should happen from
within RMA region as otherwise the boot might get stuck while doing
memset of this region.

History behind why do we have RMA region limitation is better explained
in these 2 patches [1] & [2]. This patch ensures that memset to
stress_hpt_struct during early boot does not cross ppc64_rma_size
boundary.

[1]: https://lore.kernel.org/all/20190710052018.14628-1-sjitindarsingh@gmail.com/
[2]: https://lore.kernel.org/all/87wp54usvj.fsf@linux.vnet.ibm.com/

Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Paul Mackerras <paulus@ozlabs.org>
Cc: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
Cc: Donet Tom <donettom@linux.ibm.com>
Cc: <linuxppc-dev@lists.ozlabs.org>
Fixes: 6b34a099faa12 ("powerpc/64s/hash: add stress_hpt kernel boot option to increase hash faults")
Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/mm/book3s64/hash_utils.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index 3aee3af614af..c99be1286d51 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -1302,11 +1302,14 @@ static void __init htab_initialize(void)
 	unsigned long table;
 	unsigned long pteg_count;
 	unsigned long prot;
-	phys_addr_t base = 0, size = 0, end;
+	phys_addr_t base = 0, size = 0, end, limit = MEMBLOCK_ALLOC_ANYWHERE;
 	u64 i;
 
 	DBG(" -> htab_initialize()\n");
 
+	if (firmware_has_feature(FW_FEATURE_LPAR))
+		limit = ppc64_rma_size;
+
 	if (mmu_has_feature(MMU_FTR_1T_SEGMENT)) {
 		mmu_kernel_ssize = MMU_SEGSIZE_1T;
 		mmu_highuser_ssize = MMU_SEGSIZE_1T;
@@ -1322,7 +1325,7 @@ static void __init htab_initialize(void)
 		// Too early to use nr_cpu_ids, so use NR_CPUS
 		tmp = memblock_phys_alloc_range(sizeof(struct stress_hpt_struct) * NR_CPUS,
 						__alignof__(struct stress_hpt_struct),
-						0, MEMBLOCK_ALLOC_ANYWHERE);
+						MEMBLOCK_LOW_LIMIT, limit);
 		memset((void *)tmp, 0xff, sizeof(struct stress_hpt_struct) * NR_CPUS);
 		stress_hpt_struct = __va(tmp);
 
@@ -1356,11 +1359,10 @@ static void __init htab_initialize(void)
 			mmu_hash_ops.hpte_clear_all();
 #endif
 	} else {
-		unsigned long limit = MEMBLOCK_ALLOC_ANYWHERE;
 
 		table = memblock_phys_alloc_range(htab_size_bytes,
 						  htab_size_bytes,
-						  0, limit);
+						  MEMBLOCK_LOW_LIMIT, limit);
 		if (!table)
 			panic("ERROR: Failed to allocate %pa bytes below %pa\n",
 			      &htab_size_bytes, &limit);
-- 
2.51.0


