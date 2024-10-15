Return-Path: <linuxppc-dev+bounces-2252-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1ED199DBA2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Oct 2024 03:34:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XSGq575RMz3c3H;
	Tue, 15 Oct 2024 12:34:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::535"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728956065;
	cv=none; b=ltIWFhtx1CtEYq0eMTJH3giVXfG16qp3bq93N4weVG1pLy5tjrh+FQyTQ2cVa5MI79pT9dKtSloYnUcxqvtc7BPjmWFwM35pnXFq8WHO5jwqEwJY+z7DLmybLr6QxMkFGvvppPzsSeeJqvhz5Tkz9XMOV29TfwOKe8cWNORiNQ4uUhAXR5fZVaisNTL6br5edyYM0przQUYcqZRvQfdYHDTY020LGtRIpe32SBTzzo/suD93zr+feTZvhsFOTor+iyXBrmLW3HXA5RASFQ9lxoiwneqp8tkvRd6UpSpnfLm7JhNrnq5kIMzrqwgn2VX8OxtMRbgVas/eqoRL0bc71g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728956065; c=relaxed/relaxed;
	bh=oTnklaF1aF0bTWeWldi91Sj9bwNgHQZw6gVAVQdUYd0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mm+sCjQkn7nmNyRxOUkbesF06oLCJzPlokEqe4aGbaobPYG7JUqzT1XO7DALWOxmKILltxSWczmD/BUOrE8PoHL91joHcED+DKTuDIva5k1gcwgchLL0f3LyAdIooV7jRpggAClE7kVNts2lnR50SR9IopkcOxIlEEz4XC4/MiqV8peBFuuTcn8F8nOfTtDw7XTaDKO2CEzjY2JIHf45rqwk9ID//M8YFLwukbWXY3yYPqjXmrwDZP4QVTygpp8p2KtjrG9Zy+dMCflx3uQmcEZYHruGALFKZIxUZgnNVt1sUDOF1GxV9OL5hpu3Lz7KWweci2gQdJoh2Xxk/zOpPg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ZVlXfwUM; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::535; helo=mail-pg1-x535.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ZVlXfwUM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::535; helo=mail-pg1-x535.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XSGq50T96z3bw9
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Oct 2024 12:34:25 +1100 (AEDT)
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-7d4f85766f0so3650707a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2024 18:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728956061; x=1729560861; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oTnklaF1aF0bTWeWldi91Sj9bwNgHQZw6gVAVQdUYd0=;
        b=ZVlXfwUM3umBLmI5+gkVrQKgrf15NYZyZF5z3gpdm3nfCq3sa3oD5IIBacQyiOU7Wj
         D3dicdUjfIKl6ojtQ9DOnYEGtjz61Gls4Tu+ftZGRcZ05/T8s8DURJGx0HpmBjC8poMd
         u0C2v1syVwke2hcZEeey0cL4jaC6StywyxOgar5oLfplfLmKfW06P83ZQpXuHofqJbZg
         in6HqptRRU90Mo+xFLK7edeaJgO1RUquQg+ZBchrs1nDeYaLwNTuGiPUmlc+Oycwe1sB
         knGItyGw1TOIfq3fwy+tiVe+2BzNp7qK7h6ez448rKyv3yYQmOXKemRXcBpzUPdPT3p2
         NDPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728956061; x=1729560861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oTnklaF1aF0bTWeWldi91Sj9bwNgHQZw6gVAVQdUYd0=;
        b=u4bVTFmSmHkLc8ilVCmN8PMrvv/tFlyPWF+YcLG/J5MZP5ole9JcXLnp24ZulDhKij
         Ec6UcB2+6XEs7ljmh/WXt4xy52U23J6X8p8RJtMgV6VWfLOBXBAKgKk4O014m/DTHGgE
         8EwQ8M9pNLmiWHxP6Xxj9Vl7y2Jl0qs38pEAiZKe8W3x7LwnneUKjLbZV7CjA9DRyfhL
         cbZVFKrLT2o0aVCkNb+TVTLPcttJzKnDN/DvxE8sH8ahVRZD68hUuccXpajSkAZyffRw
         USJr+6lofem80VkDar/GwWqj/vDBNLySuoenVkLfUFFZopnGYNvwqagVpF3FC/2R2VQe
         fNrw==
X-Gm-Message-State: AOJu0YzU1ZXIiGWWf6pObPaN9T+h0cbh+Ni2K3zzyhHOOccdYJ0mYGNk
	j2GzJtctFAmgrt3+r8a9Emz0mHyYHhSvzsych2zHyMJ9KLZUT3gXoJEdaw==
X-Google-Smtp-Source: AGHT+IFT6UGlq+wYgtgPhE6bzO8Rllrurc9EHvyW/SZWzz7xpV6AjzAWDpsP/H6dyEXrivEMXbEKOw==
X-Received: by 2002:a05:6a20:cfa4:b0:1d2:e92f:2f48 with SMTP id adf61e73a8af0-1d8bcfa7ef1mr19096796637.40.1728956061028;
        Mon, 14 Oct 2024 18:34:21 -0700 (PDT)
Received: from dw-tp.. ([171.76.80.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e77508562sm189349b3a.186.2024.10.14.18.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 18:34:20 -0700 (PDT)
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
Subject: [RFC RESEND v2 07/13] book3s64/hash: Refactor hash__kernel_map_pages() function
Date: Tue, 15 Oct 2024 07:03:30 +0530
Message-ID: <efa3cff65f71cf492702e835250667cb976b9e6d.1728954719.git.ritesh.list@gmail.com>
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

This refactors hash__kernel_map_pages() function to call
hash_debug_pagealloc_map_pages(). This will come useful when we will add
kfence support.

No functionality changes in this patch.

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/mm/book3s64/hash_utils.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index 030c120d1399..da9b089c8e8b 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -349,7 +349,8 @@ static inline void hash_debug_pagealloc_add_slot(phys_addr_t paddr, int slot)
 		linear_map_hash_slots[paddr >> PAGE_SHIFT] = slot | 0x80;
 }
 
-int hash__kernel_map_pages(struct page *page, int numpages, int enable)
+static int hash_debug_pagealloc_map_pages(struct page *page, int numpages,
+					  int enable)
 {
 	unsigned long flags, vaddr, lmi;
 	int i;
@@ -368,6 +369,12 @@ int hash__kernel_map_pages(struct page *page, int numpages, int enable)
 	local_irq_restore(flags);
 	return 0;
 }
+
+int hash__kernel_map_pages(struct page *page, int numpages, int enable)
+{
+	return hash_debug_pagealloc_map_pages(page, numpages, enable);
+}
+
 #else /* CONFIG_DEBUG_PAGEALLOC */
 int hash__kernel_map_pages(struct page *page, int numpages,
 					 int enable)
-- 
2.46.0


