Return-Path: <linuxppc-dev+bounces-2257-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CE19F99DBAE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Oct 2024 03:35:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XSGqY4Hlzz3cF6;
	Tue, 15 Oct 2024 12:34:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::436"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728956089;
	cv=none; b=AZF7uO85lRapRmhSSStKsT5mEM9VZrDd9QGk/t+UqjwseYp8nCtaBbt6fciPDVd6xP8BHl7hhenRykaAO/cnJC0D2UpE4+gklsyBbRtZcsD9prlGA2PBMeqHMqnjykVZ3HV/UfTv7Aql8bCEuDW4VQFZVhJCm29tiEU+FWe77YQW/jKd8XLNEzLF5F9lYE/N26LQ88kMkpDtUC/SYuN4HAEirMxkNRMYaHI29FGwIUKXFxX7gCd2qOhVkfjCIbfUUbBhT4iBglnkHKJ38kFgxrEMkwIMdshAlWvNYptAy5PbP8gJ/Ct+A3H3p/2rvc8CATzmg4+hoeiFOsJx0bmOkw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728956089; c=relaxed/relaxed;
	bh=t5daj1tikBz1GmvjDxbc2gCsvgSNJoz/zYutj+6dtSk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OyO/u1KKe46JLcWtOW1hAibQnITyn3JTE0rNjkP/u0jB1xNcJbUS6oNBkLxcjl/OCdkTVYfPkxP3IxHzXlNWwqutYr4LUSW1ZJ8MaGwLydykxIASs2IA1St2sgH/QgOBZcksNBRCV6LWxioIjmOS5MCPSVtx+dLwTEPGUlh9laFa84RShJORkmipoD3l38+aiWcQbYpNETsJXlDnPvnkLxaYU5TIOUS/na0rocDbOgZShWA7bnmvqGwl6dygnW/Iz5t4oHmJR1e3R0ghwcpKZn8p66TP4STlrun8asvIEDIqqYxHuj2uZtw7HQjwMhmce1FJgBPwKH98piF3eD4N0Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=e9GXboeh; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=e9GXboeh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XSGqX4mZgz3bps
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Oct 2024 12:34:48 +1100 (AEDT)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-71e4fa3ea7cso2089950b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2024 18:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728956085; x=1729560885; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t5daj1tikBz1GmvjDxbc2gCsvgSNJoz/zYutj+6dtSk=;
        b=e9GXboehu4X5+DuW5nOWju4/KwchatNdw1E3VHkObevzHk53YKiYfQBUp3c/SoC7kV
         Z6oDH5h8W4duyV+9DUx8ULzP9Ks3WMQRcJn4NiMLifJyGhkDBOZR0nUxW9AJKyAhtJwS
         l5uhujOVTAnc50tz1o0aeCHMFbEYKssUm+cp6C12Oa/p18i6nZPlHWivSOcHIQYKDNlA
         x2pWYpszEuTq+aEwZVaQewQFnMxDv+cOzuIkp70k3AdSYh8lqrjKA5alyfRbmtJNguo+
         581liMAQMclczwkwyTkE+WYxZot6NPaFDpzenBOysbHejwH64IYA74R1T0D6d50Ncpgv
         odxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728956085; x=1729560885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t5daj1tikBz1GmvjDxbc2gCsvgSNJoz/zYutj+6dtSk=;
        b=GBSKYpcycBKc6vCkbP0bgJdx4KlBgvUxV7V2BDej9BQ2KJqzY+TdgREGvqs8iYffbk
         /4R2kIPtRxCSw9FzBWiGyJb38s8aPmpYSETGzc8AThR0aLVYq4v9kZiq0nOlOyYbVAB7
         rG3X6gaHATQpoun+G/DE2xetu6buU5Lf3fPjv9BNLe5fwMYNFpit9/fLw7CqOlFOEVIl
         C6cMQlt8GL+Yyfo/UHFNplFE7y50OW09N8gZxVJKfyu0RqbTGs/Kt5hd7RWOxUd4gulv
         qG9aSrSuTKlCih5N7IBdC43VDdM4t4QgIB8cRPSDChADfGVw6H8rPJ5wAnHh4dSS3Yrk
         O2kw==
X-Gm-Message-State: AOJu0Yy1b0aq71k3rShTcgYFq4RyPB3TSldIZRUgJFQaqbV0ir3uASEz
	oZlIO8JGoKuIALi4H2Iy5ZNOqtqsTMzWw/2ntL49mpVzbC8WLjqjjqSCxw==
X-Google-Smtp-Source: AGHT+IEs2IxrBsPT6YXEgz2epQyHoorcOdT0d4hm7NYr74rGWRI5/0uchu7H7p2tlDXCJav5W/E8eg==
X-Received: by 2002:a05:6a00:3e03:b0:71e:3eed:95c9 with SMTP id d2e1a72fcca58-71e4c1bfba9mr15531178b3a.22.1728956085196;
        Mon, 14 Oct 2024 18:34:45 -0700 (PDT)
Received: from dw-tp.. ([171.76.80.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e77508562sm189349b3a.186.2024.10.14.18.34.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 18:34:44 -0700 (PDT)
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
Subject: [RFC RESEND v2 12/13] book3s64/hash: Disable kfence if not early init
Date: Tue, 15 Oct 2024 07:03:35 +0530
Message-ID: <29cca55915a923d1823644b37fa571234f9ea549.1728954719.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1728954719.git.ritesh.list@gmail.com>
References: <cover.1728954719.git.ritesh.list@gmail.com>
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


