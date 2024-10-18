Return-Path: <linuxppc-dev+bounces-2391-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE639A44BA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Oct 2024 19:31:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XVWvs1cN9z3bwp;
	Sat, 19 Oct 2024 04:31:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::535"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729272681;
	cv=none; b=V8PQFqqhRwQoTuhZ3egQVxbq9A5+4zJ70VuYACxTPVtXhAPkylMq6ZHlCeN5hvbMbis2V4QSKbERkIJkNqXe0NdYTY8Bjw3sYQG51srKK/ymSCdWcoI07vINGHpudM8QtJ+Y8ax9kJF19kABNW19/OturXDbWuhD9vYqKo3cJQnmqLaqyS/sTL0LmSvWEsh8B1UydRpgOcBrxkgFIZ1msYk48qHBiolrqgUMZQK/P37MDH70++YPozgrcRxOeHajm9YThMM8AbnZc8LaLigAsg+V9rtfZJgp8ns6HuSokMp5HLXBuYubF64l+1JPwofUCyviQA6YvAi6NQBSqp391g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729272681; c=relaxed/relaxed;
	bh=M+pQKseSbUwQ7nDgMGbwYxJsHyJez2ZBxycyN9iER7I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XuAwwYnch6mSl8tUf6PZiaaytOENZVLmjJQyKnCcsMYeGdSVxI5Y3v3NL+SUbEEIdXigsSfDQ4PwxEqvnLZc2x7BELqeVUj5BGq/UktN1nkcCAfU8epsFHqkCJPl5UaB2HC5TgStd3BKqwwoVHonx+avIVXpn1u5d475MP/u+BFKg3o2oM9gEV4PqYGpruzezcAhLYtjyxEL84aWZCfLdM5vM4I/LWVTl10Pj75OO549dmD2CMfaXhwq/fm0JZSkkcBBl8JkQuDwHOZFJFwYJZc/OGGaT3BnyBnlrXWWQSpggKW9qTu9rLg2/pcEJpLc/Sl53akCasehptFWbw4Z3w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PMnNarOp; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::535; helo=mail-pg1-x535.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PMnNarOp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::535; helo=mail-pg1-x535.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XVWvr2hvPz3btj
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Oct 2024 04:31:20 +1100 (AEDT)
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-7ea7e250c54so1705553a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Oct 2024 10:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729272677; x=1729877477; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M+pQKseSbUwQ7nDgMGbwYxJsHyJez2ZBxycyN9iER7I=;
        b=PMnNarOpA1jioyYLrZ3lW0H0GkivMKtQEGnPLJZyYxRPIrXWFsTcKGtd9sVmZvQjNX
         ETh1nt/j6u96oDPyrfMvjfqgEzudUYQtpK9PSK4I2rJg0BMNtSwZLqGCbBMZ3mW33ELW
         nCLRCRmA5PV0oQdLaM3xmCd37J9XEJnd0+46VJeL6Xg7dv/p/qS9vTpRvjBcFehZZvj8
         4jg6BXCzxe0WYiHEkGIS0iTQUA832Q94KTB+fQCvqhDe6A4b4rqPzPb99SL80scSk+Ig
         mRDE6HttbSoxbDYkANdycJ2amGKJhvyZTelpyT5dmMDJPfzIE9OL6vGzQEUKblI35oPk
         bYoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729272677; x=1729877477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M+pQKseSbUwQ7nDgMGbwYxJsHyJez2ZBxycyN9iER7I=;
        b=XI91AVYsMyBIh/0Ehz2XNRSu75u2ohiJizY7cpcJJgfz6hI58Et6rfZikXGkdaUlkU
         C0fW3bLpqdB5WUZd/OVx+4ssXraeERM+DiXHMCfS8piz8v1FWfZenF1lPhAN2/I0kuNZ
         SxXOwgoUU7e+fVPG3/ubBQLjrbFOZwbHAnHeyN47CMI1UB3VcsXJAbQyHCsxGDIWV+X+
         1BJ2161wFTfKrHFGyHfptUthfKB/GW5NK5SWbNVZ3EB7CqkKIOUJzEnsd4WBptaQ5Dt4
         FIBVbtHOVKPuBeQiLWmQIGScHIOKvf5npPUXsBg8O//1gky5DAVPEXDUvVz43u8vhl25
         057A==
X-Gm-Message-State: AOJu0YwC+TxopxHQVR4L9kb06wDEWvV2gmgZcIG4onxVe+5Gr2faTDk3
	1kEHlXjlFPY0Z+EaiOQatDa38AMUIUoOjPoI/EHUMxPfnPbT0YlTbsM36wEP
X-Google-Smtp-Source: AGHT+IFVWe1xUi/sLyBKrxUXKe/50HIPEi+N9laTmy/mjDBIPEDqbRrd1jNCsq8LdLHdy/KQ/lg9Ig==
X-Received: by 2002:a05:6a21:168d:b0:1d9:61b:9607 with SMTP id adf61e73a8af0-1d92c4a0231mr4271987637.6.1729272677039;
        Fri, 18 Oct 2024 10:31:17 -0700 (PDT)
Received: from dw-tp.ibmuc.com ([171.76.80.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ea3311f51sm1725242b3a.36.2024.10.18.10.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 10:31:16 -0700 (PDT)
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
Subject: [PATCH v3 11/12] book3s64/hash: Disable kfence if not early init
Date: Fri, 18 Oct 2024 22:59:52 +0530
Message-ID: <4a6eea8cfd1cd28fccfae067026bff30cbec1d4b.1729271995.git.ritesh.list@gmail.com>
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

Enable kfence on book3s64 hash only when early init is enabled.
This is because, kfence could cause the kernel linear map to be mapped
at PAGE_SIZE level instead of 16M (which I guess we don't want).

Also currently there is no way to -
1. Make multiple page size entries for the SLB used for kernel linear
   map.
2. No easy way of getting the hash slot details after the page table
   mapping for kernel linear setup. So even if kfence allocate the
   pool in late init, we won't be able to get the hash slot details in
   kfence linear map.

Thus this patch disables kfence on hash if kfence early init is not
enabled.

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/mm/book3s64/hash_utils.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index 558d6f5202b9..2f5dd6310a8f 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -410,6 +410,8 @@ static phys_addr_t kfence_pool;
 
 static inline void hash_kfence_alloc_pool(void)
 {
+	if (!kfence_early_init_enabled())
+		goto err;
 
 	/* allocate linear map for kfence within RMA region */
 	linear_map_kf_hash_count = KFENCE_POOL_SIZE >> PAGE_SHIFT;
@@ -1074,7 +1076,7 @@ static void __init htab_init_page_sizes(void)
 	bool aligned = true;
 	init_hpte_page_sizes();
 
-	if (!debug_pagealloc_enabled_or_kfence()) {
+	if (!debug_pagealloc_enabled() && !kfence_early_init_enabled()) {
 		/*
 		 * Pick a size for the linear mapping. Currently, we only
 		 * support 16M, 1M and 4K which is the default
-- 
2.46.0


