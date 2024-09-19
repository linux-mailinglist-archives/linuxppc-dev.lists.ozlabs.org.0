Return-Path: <linuxppc-dev+bounces-1445-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE5097C301
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Sep 2024 04:57:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X8Ktr6vwzz2yLP;
	Thu, 19 Sep 2024 12:57:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726714644;
	cv=none; b=BTavon7tvup8zjkgRdeEDQeRtPdiyzVBzrCHLDb4V5wzwHbGeDhhjgWQ8ctAYNiGxXik8DoqM8/RhvPEFmFW9bksm9o1EKAj2i+Lm7gHfOtG0YlNVGFloT9jwlgRdIXzBNWLtl9siG8niAqHMVruaHgtkix9PG+eeFCkTLuMSH+XbUQGU1m4TQTARvTqSZdcxKZ1PvwSSpOfuqnEXksIY1hlsy2l3zcRAjJ7yhBOYNnkey7hlX37FGCgAKP4Gx+avspkwDa1oVVJM6vPqkvcFSkkFbisJEEfUTvkeue6yd/JLe/AqRcGPK667eg6ge2FkWfNNTSZmfKtkFb4pKzRGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726714644; c=relaxed/relaxed;
	bh=t5daj1tikBz1GmvjDxbc2gCsvgSNJoz/zYutj+6dtSk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gXz0HvlxEdVD1Dh18iKyOVV9sL4GLa3Czoc3qkKOKtAfnGeUVHBlqEgpH/H9Tb88Xe5pZ/y28EVvwZoNoUBfZDtKZRzGahkW2UTzCCX7CMkeHSUdExGW/bKHy2eCgspQs0PfiTGfpszDvatatQ9HMXwcZWfv/GS6M5MGjPtd/1C19k9v2Grf2fm4SsOd8XuAkXxmAlWzkq9pRJqvjLrE8xPcP84AweaofkW5D7czNyfd6Y5M6zkEx+H49cTCOHO24UKJE6nTjcxaNSkeJ4jGjEW1n6sLuYrzepTZ6nsnh43VI1Om3QkJIUQVc7RyZ842gYorcc2FqjmM4+SG7BuuYQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Ra4xPDF4; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Ra4xPDF4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X8Ktr4l09z2xmk
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Sep 2024 12:57:24 +1000 (AEST)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2057835395aso4877335ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Sep 2024 19:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726714642; x=1727319442; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t5daj1tikBz1GmvjDxbc2gCsvgSNJoz/zYutj+6dtSk=;
        b=Ra4xPDF4SDTeOV2Lt1xRbDWTiCHG2w0WOFUEW1WrzKEv7+VyP7RX64fV9QYQD2GrPN
         NGVNu+jGvOEXCT51lJgNGh9uCyZiDA32f4XB6sViFuBt6QG0mi1lZ3MWyw4zZuiWLXEc
         CE3hVJ2+Uar4hNYpSbc3qmw2R1FwzPkb70/HTI1uffxY4p2cXFfg0SYs0WhTqwZZIgAb
         Dhglhx1cmvvTV8wjLzGyx/rCUMPjKDNzOZ9w5JWy6Q6brJNCOMwbOCdRsNBOSwqDHuFd
         q8Jq5MI8SLCrUi9qO0jbQx8mvNcItbKKhw9bAgvp9WN/Q/g4XDC+1rHbVxJCcUvm1Sq5
         n+BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726714642; x=1727319442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t5daj1tikBz1GmvjDxbc2gCsvgSNJoz/zYutj+6dtSk=;
        b=CjabDjLd+i+LTCeoqvMEQFYdUxOhrmOx/dzqBJQcI8XgJGHAQCrVCittXfi2JSO3qj
         5IpCjDOxwsbXSjhmyifw+d7YOx3w86E2CikiLP/LQNImCYj4sye1z1O7Y87osrXuIviE
         k3ugNF8UkH4cD4uIfOtFWzC038kup++StUWNhuvKzv+CiybSgvZabkmjWwEEFCfz/X5v
         KlFR7bC6p0zIqfcPTYbHGTLeYqK4n/lSgvHjiepM3ebAskXCNQ0KEMfboEbUaYOH22ir
         XByX4rd17499+zcAxy3EtyzxQ9zYI34Q6t5/EGTZ4l1AVCO6XvT+ishTPj/M61g+/SQW
         wVbw==
X-Gm-Message-State: AOJu0Yx9zTgsr3nO3cThP/s0Rt4GRv0gTZ6IFLNCqNn8/YsE+WofCkLr
	vPn6VKDnYzNM1ZZyhNt3FdTpdG4gau/UWdRA4O7lhhTQ6Ip6IFQdo91ddA==
X-Google-Smtp-Source: AGHT+IE3VeS4AWbgmq58tHFaKEJ3AWgWdI2umfqoY9F5wsipy1rAhwBkftW22XvGMU7l7yJyDOWfeA==
X-Received: by 2002:a17:902:ea0b:b0:206:8c4a:7b73 with SMTP id d9443c01a7336-2076e414901mr370597715ad.50.1726714642162;
        Wed, 18 Sep 2024 19:57:22 -0700 (PDT)
Received: from dw-tp.. ([171.76.85.129])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-207946d2823sm71389105ad.148.2024.09.18.19.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 19:57:21 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Hari Bathini <hbathini@linux.ibm.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Donet Tom <donettom@linux.vnet.ibm.com>,
	Pavithra Prakash <pavrampu@linux.vnet.ibm.com>,
	Nirjhar Roy <nirjhar@linux.ibm.com>,
	LKML <linux-kernel@vger.kernel.org>,
	kasan-dev@googlegroups.com,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [RFC v2 12/13] book3s64/hash: Disable kfence if not early init
Date: Thu, 19 Sep 2024 08:26:10 +0530
Message-ID: <43e00322c775645a251c4526484d5bc61c62850d.1726571179.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1726571179.git.ritesh.list@gmail.com>
References: <cover.1726571179.git.ritesh.list@gmail.com>
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
index 53e6f3a524eb..b6da25719e37 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -410,6 +410,8 @@ static phys_addr_t kfence_pool;
 
 static inline void hash_kfence_alloc_pool(void)
 {
+	if (!kfence_early_init_enabled())
+		goto err;
 
 	// allocate linear map for kfence within RMA region
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


