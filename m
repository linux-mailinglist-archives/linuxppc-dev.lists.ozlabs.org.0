Return-Path: <linuxppc-dev+bounces-14841-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B27F3CC8D11
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Dec 2025 17:38:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dWfd959dfz304f;
	Thu, 18 Dec 2025 03:38:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765989533;
	cv=none; b=iR6GMw38FW39O33GJ1s1Ou++NRyfrsjT5PNngS5iI3sGCRZov3nCQP4C4zTG0RsCOJWEUGb1e8TgJ5IquUpWAkNNnlq0LzSkxTrgkIbaHQ9ZQ04aWboTe4MViR2bqbugsovjwkLcqVOeEsiUeGYgzm4zg9+/g4JQfYCZIf8wPH+T3cYjpBEO1bnq/mJcHXIIANv9HH4d03QgjK7foT0b0ZUPAlFJSFl0amp8Ahn/ioVlZSlYV/lwd8se0Zq9Gi6UzKsnfHhiK9t5DMvhRlKRIeWlcn/MXkmGUTStvi+geIsF/InkvJWpSgMCOUsHGFwRADF44TVf4iO96l8fvAPhPg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765989533; c=relaxed/relaxed;
	bh=N6Z/uKu8uJebQEVGTnY1Mg7FtwLddEoZVb/3GgOmPIs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e7puCpu8Po/bFwgdrLkxeCPR2953wl5DPfIWYyWJEMANXktOaI4TNu9wG4Apat0WBF/oy9ty1XBTgey6IZD3hkzV9flG9rGvrUF/4OS8zpgtWur6yNUnv1DuxZAfFmUg4lMUM41EaT+YQD62JyrWVN/JIpdyLDAX7RNKXMY4F5zIfSmMwSnJaq83IMlD0yduhQJc5U/OnF18FKW0petICOwhPkadKWjcMFsPuaS1GNTLdPZTKFwNEv2iewhaJ1pQT0SzR7jmybzwKEyLqiIHJE2WLYs3gDyPqobp70kWJvclaCtbb44S+NfQZ5JqMELb5cCgIx6x096HNB55cwZPqg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dWfd826SLz2yvM
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Dec 2025 03:38:50 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 99F1EFEC;
	Wed, 17 Dec 2025 08:38:11 -0800 (PST)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 806BA3F5CA;
	Wed, 17 Dec 2025 08:38:17 -0800 (PST)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org,
	Ryan Roberts <ryan.roberts@arm.com>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	Kevin Brodsky <kevin.brodsky@arm.com>
Subject: [PATCH] powerpc/mm: export symbols for lazy_mmu_mode KUnit tests
Date: Wed, 17 Dec 2025 16:38:11 +0000
Message-ID: <20251217163812.2633648-1-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251216201403.4647a4f9861d3122ee9e90d7@linux-foundation.org>
References: <20251216201403.4647a4f9861d3122ee9e90d7@linux-foundation.org>
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
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Upcoming KUnit tests will call lazy_mmu_mode_{enable,disable}.
These tests may be built as a module, and because of inlining this
means that symbols referenced by arch_{enter,leave}_lazy_mmu_mode
need to be exported.

Suggested-by: Ryan Roberts <ryan.roberts@arm.com>
Suggested-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---

Andrew, please add this patch just before the last patch in the series
("mm: Add basic tests for lazy_mmu"). Thanks!
---
 arch/powerpc/mm/book3s64/hash_tlb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/mm/book3s64/hash_tlb.c b/arch/powerpc/mm/book3s64/hash_tlb.c
index fbdeb8981ae7..9e622519a423 100644
--- a/arch/powerpc/mm/book3s64/hash_tlb.c
+++ b/arch/powerpc/mm/book3s64/hash_tlb.c
@@ -30,6 +30,7 @@
 #include <trace/events/thp.h>
 
 DEFINE_PER_CPU(struct ppc64_tlb_batch, ppc64_tlb_batch);
+EXPORT_SYMBOL_IF_KUNIT(ppc64_tlb_batch); /* For lazy_mmu_mode KUnit tests */
 
 /*
  * A linux PTE was changed and the corresponding hash table entry
@@ -154,6 +155,7 @@ void __flush_tlb_pending(struct ppc64_tlb_batch *batch)
 		flush_hash_range(i, local);
 	batch->index = 0;
 }
+EXPORT_SYMBOL_IF_KUNIT(__flush_tlb_pending); /* For lazy_mmu_mode KUnit tests */
 
 void hash__tlb_flush(struct mmu_gather *tlb)
 {

base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
-- 
2.51.2


