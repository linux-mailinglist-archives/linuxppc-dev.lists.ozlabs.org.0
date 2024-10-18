Return-Path: <linuxppc-dev+bounces-2392-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D6EB69A44BC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Oct 2024 19:31:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XVWvx3HLKz3bxC;
	Sat, 19 Oct 2024 04:31:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::432"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729272685;
	cv=none; b=JykUWo+/NSC8HOEztA6K0wTbT3kXWE+xTr7oL72KrEyxm4dOLTrk5HUuoqN8vjnhp2ZUhYdzlIJYxc9CwdbqZwsKrlxCXsrePn66jC7RgNkE+9+bNoB+Y21vfjkqAnZfoYXKD4KlBHKD4gcwfUOtyI+YjIZWzFH7CN5HoOLIllNVxyiCs/OXJmpG5oNynSDddv6bU99JM2bDbFW8LYyHM1G+2dGYSDbRXBMFNtRxIAxiNc4wqJJ/FD96839A24ymX/GerV8cvb8v1GupayujTLwFR7wJ248F9FsfEH+4KtKFaZgAKisbLciOi5H6+StQdt0eC7wwnbce5cj7iaRFaw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729272685; c=relaxed/relaxed;
	bh=1QLaMyzhWv0h56bpJNLe2thoYBckgfAdM8HvqGdr41M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mKZm2ARWOFgrrwoz388DAcfvFFsoTMhsfdiVULLgxpogzpfw4heHCnQ/auvL25ofJg8R+EQrhSkWSXm5ovJ5/DkktB/b3kqXu7wXtrW4NYf9FBCKUL8YrqR5s1qs7HjjNEkgPq/WyQ0n09ysFD6wjY6pkm69LmG7oYV39mz7NTMH9eRTvMsvZbeM+u+cPvCnCZpM/hdNd4JaaViMYF43/muXN0zF5obxgo2ABP60ybnqM/MwxjkX8NMrQh/JQuVfkTFwpv0tGifnpsXWHSvAfz3XO5ulbIBtQ5YBqbnHIIzqBW2DqKnyCwyUkkFMF4kz2aYBF8/pOlGAXwfz1dQdwQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NzDfps5G; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NzDfps5G;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XVWvw3Xhdz3btj
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Oct 2024 04:31:24 +1100 (AEDT)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-71e953f4e7cso1514426b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Oct 2024 10:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729272682; x=1729877482; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1QLaMyzhWv0h56bpJNLe2thoYBckgfAdM8HvqGdr41M=;
        b=NzDfps5Gk+yjsmA51wxaQfqSdHg2EYhLF/naGHqrgUVMQ7fwrFgA4XPBGzPuloJVje
         k/hOVJXNxrg3BOaU2N/o6XF8wfVtP7FQFe9oGJh3t69oLB/WJFYoaxYEhUlYEOuO6Csv
         ADZuurAEnDB9l64YCff7rnDlvSPMJDKQS6ZAg9cnSOI+h8RU/XLjOT+0qgDByu3exPsw
         b0gxzAl8UGzvxKSYcMGRHTXO/ePH/PnguM2o7M2ZrCGwNvUWbXBBS6NgPpEXhjRBLz/a
         6TEjRHNyu5J4W8bB2dTPcx9oymiYq63p43Sy2XnDSi83VzZ/vO+K3oSiOFB5Ll05mJ2K
         sEPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729272682; x=1729877482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1QLaMyzhWv0h56bpJNLe2thoYBckgfAdM8HvqGdr41M=;
        b=oSqBmV1RNCFdmdk7WV1dbRrra5ZIzLrjsYlAs4MgmbHIyKN0jvRhcOZvGaeG6tvYMJ
         bU08SLLLI3qhuXZFQPSk340e2kC8NeIlfvPz/YdwQewELUXgDZjsogRBV+Ct6KysRZMA
         0y/Ehre7PzRPCjpKW1aI971b6MBTwnOkDfkqcFnY+t/FkSGaEWzigP7bSt3Az0kYg4Yr
         mJHnkp968PwDXk7UuMn3SAWfP5hGE+V2ctk2W0rOgS8gyJUqOSgor4ezkswjHyIumx0i
         cC1PYNgjcHcFbJgUX0wgatEsfdZ314GansD7WzKsjMUM/+0zULC4prV/Eu5t2lKb/ne/
         zKbw==
X-Gm-Message-State: AOJu0YzKds8QeDqj3teReovOQZiFEDqbhNtlk7zIXb4y029x53c4MWQF
	EV+r5DNvpnRW+ctxMgHFpSZ1ENwWA8fTSXoeHtGr6Fv1HVrfI3yMhnXvlOUI
X-Google-Smtp-Source: AGHT+IFTSMl8QW5ycN4XEBU+MJ3K9NfWvdEojOEp7QlJ+1fDl8flZ96NMrdY+IbWH9uWHYWgBiWu4A==
X-Received: by 2002:a05:6a00:cd4:b0:71e:cf8:d6f1 with SMTP id d2e1a72fcca58-71ea316bf4emr3925702b3a.14.1729272682003;
        Fri, 18 Oct 2024 10:31:22 -0700 (PDT)
Received: from dw-tp.ibmuc.com ([171.76.80.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ea3311f51sm1725242b3a.36.2024.10.18.10.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 10:31:21 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: kasan-dev@googlegroups.com,
	linux-mm@kvack.org,
	Marco Elver <elver@google.com>,
	Alexander Potapenko <glider@google.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Hari Bathini <hbathini@linux.ibm.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Donet Tom <donettom@linux.vnet.ibm.com>,
	Pavithra Prakash <pavrampu@linux.vnet.ibm.com>,
	LKML <linux-kernel@vger.kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [PATCH v3 12/12] book3s64/hash: Early detect debug_pagealloc size requirement
Date: Fri, 18 Oct 2024 22:59:53 +0530
Message-ID: <c33c6691b2a2cf619cc74ac100118ca4dbf21a48.1729271995.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1729271995.git.ritesh.list@gmail.com>
References: <cover.1729271995.git.ritesh.list@gmail.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Add hash_supports_debug_pagealloc() helper to detect whether
debug_pagealloc can be supported on hash or not. This checks for both,
whether debug_pagealloc config is enabled and the linear map should
fit within rma_size/4 region size.

This can then be used early during htab_init_page_sizes() to decide
linear map pagesize if hash supports either debug_pagealloc or
kfence.

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/mm/book3s64/hash_utils.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index 2f5dd6310a8f..2674f763f5db 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -329,25 +329,26 @@ static void kernel_unmap_linear_page(unsigned long vaddr, unsigned long idx,
 }
 #endif
 
+static inline bool hash_supports_debug_pagealloc(void)
+{
+	unsigned long max_hash_count = ppc64_rma_size / 4;
+	unsigned long linear_map_count = memblock_end_of_DRAM() >> PAGE_SHIFT;
+
+	if (!debug_pagealloc_enabled() || linear_map_count > max_hash_count)
+		return false;
+	return true;
+}
+
 #ifdef CONFIG_DEBUG_PAGEALLOC
 static u8 *linear_map_hash_slots;
 static unsigned long linear_map_hash_count;
 static DEFINE_RAW_SPINLOCK(linear_map_hash_lock);
 static void hash_debug_pagealloc_alloc_slots(void)
 {
-	unsigned long max_hash_count = ppc64_rma_size / 4;
-
-	if (!debug_pagealloc_enabled())
-		return;
-	linear_map_hash_count = memblock_end_of_DRAM() >> PAGE_SHIFT;
-	if (unlikely(linear_map_hash_count > max_hash_count)) {
-		pr_info("linear map size (%llu) greater than 4 times RMA region (%llu). Disabling debug_pagealloc\n",
-			((u64)linear_map_hash_count << PAGE_SHIFT),
-			ppc64_rma_size);
-		linear_map_hash_count = 0;
+	if (!hash_supports_debug_pagealloc())
 		return;
-	}
 
+	linear_map_hash_count = memblock_end_of_DRAM() >> PAGE_SHIFT;
 	linear_map_hash_slots = memblock_alloc_try_nid(
 			linear_map_hash_count, 1, MEMBLOCK_LOW_LIMIT,
 			ppc64_rma_size,	NUMA_NO_NODE);
@@ -1076,7 +1077,7 @@ static void __init htab_init_page_sizes(void)
 	bool aligned = true;
 	init_hpte_page_sizes();
 
-	if (!debug_pagealloc_enabled() && !kfence_early_init_enabled()) {
+	if (!hash_supports_debug_pagealloc() && !kfence_early_init_enabled()) {
 		/*
 		 * Pick a size for the linear mapping. Currently, we only
 		 * support 16M, 1M and 4K which is the default
-- 
2.46.0


