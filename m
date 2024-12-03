Return-Path: <linuxppc-dev+bounces-3709-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA3C9E1835
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Dec 2024 10:48:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y2bRz0jSHz30Bt;
	Tue,  3 Dec 2024 20:47:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733219279;
	cv=none; b=kDrL1qWHyMq3mLyU9i/nM/Ue8STJJ4hqLt2xujNnOf6pH584TxK5/ogPG1OKuDWpgPXURfZBR1ul14gfBTydigUDW6DdiNtBVApYzCgFPwzN8YOnrVLrt8nFazNeum5m0Ya60+PNXMtsgsDQgkzyegQLE4kn9rys6IKy/eBNjr8lrGFIgCgXxQTPrkmbhTdBGefWSP6dml8/zPb5LXgeQvja5mbE3PgPMW/Ap3Nn4E5G6aHL7oeuMX7121cCmxvxuqd2gIx5q2KugENtW0eg0isCHY3sPyQHIRUCUX9oaEejvOAwMzXm+fSNTojr5iIvWWvUiuVD4wHq7klwQJgR9w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733219279; c=relaxed/relaxed;
	bh=xX/Q3/3Rp0ILyMXyKGOcZrJDDur/TZdwfSuBal5fAnM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=IxY9a56AlXXk/ZgKAG2KIepe4gjNiczh8CJeEy5ekRqW0K6KxSJWPHcLBsXu86IVPjaavavpUxL9Rt9E4QcWOlE9vq9wSW/eepcnk2ZOFMJcV90t1/jkEajRDACTnPClUqb4dWZN6Kh0+dwLJJpbkU9nca3GMNLAegf2/NeRTUaVQAsgOcUnrZY4m1UdH4ZNgONwLkncLB1F+5ASp7WEGDoCmAk1DXUjAOtfA9cTFG3Mx7NpnetMQPxuQbyQVBitSDyb69xNpwwosTJYbFaZZo7v3zdQTuiZWZc3P67jTIaKMl3CF0wipReYX9vbiedzgNQNhZKXURWy2ljo+3aTew==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IXulOmKM; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IXulOmKM; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IXulOmKM;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IXulOmKM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y2bRy1NXfz30Bj
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Dec 2024 20:47:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733219275;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xX/Q3/3Rp0ILyMXyKGOcZrJDDur/TZdwfSuBal5fAnM=;
	b=IXulOmKMu5wxyW43yzFUuxRR4gwP4R0hARlPCbzOlityI0bvSp+D7tf/I7J9fUBNaq6lB0
	Q28Kd7839XYC0nquBxV90qHulUm7G2UIurvfNC4X7k/Q90dGXdy3due4KaBz2/4dA6EMbu
	VjUEEcaD60k2EhXdE3heUxMDtqU4U8k=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733219275;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xX/Q3/3Rp0ILyMXyKGOcZrJDDur/TZdwfSuBal5fAnM=;
	b=IXulOmKMu5wxyW43yzFUuxRR4gwP4R0hARlPCbzOlityI0bvSp+D7tf/I7J9fUBNaq6lB0
	Q28Kd7839XYC0nquBxV90qHulUm7G2UIurvfNC4X7k/Q90dGXdy3due4KaBz2/4dA6EMbu
	VjUEEcaD60k2EhXdE3heUxMDtqU4U8k=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-215-RTy8E6ekMsKCImyfwvU2sg-1; Tue, 03 Dec 2024 04:47:54 -0500
X-MC-Unique: RTy8E6ekMsKCImyfwvU2sg-1
X-Mimecast-MFC-AGG-ID: RTy8E6ekMsKCImyfwvU2sg
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43499c1342aso37402255e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Dec 2024 01:47:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733219273; x=1733824073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xX/Q3/3Rp0ILyMXyKGOcZrJDDur/TZdwfSuBal5fAnM=;
        b=K3eJ3YrLQ15DRScg/3IRpP4sNZlaQEpNBymNmJaCjOjHdff3ITOvzRCuFFGJI/ma6m
         zyMfvB7k39GBWrw/DGCIxR9kBVw7HOkKTGfWEsMVVn6pr44nk5DC4/n3MnE/z89D9yCD
         4j3utxse5UGr5kGJx2pLAMTQs9p0C3jnYSUIwv5NPpT1O9PUkVFPgLE4jJfNtFoT0IUO
         tRxq1IVy11tHvIDv/tTVhvoZ3P7oUndL7MIPtY37PV+e0UVuZDncPZ6gBJVdGMsVXyct
         9sgwLlY57IgKIeko4cK97Q5iYNuLiga+bdeCVpBzieXqtcmcQe7saBoX7KvCohrflazH
         jAFw==
X-Forwarded-Encrypted: i=1; AJvYcCXPfyAjFL6JxYkw6inVHj1WqpmWUxMWkBELwqGA67JkXR9amOIlagKfOe8mKMQjqXv1fHh3vDLXZ6sBJgs=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxN37g9EYobmzXoAIbyAty2OfTN7o6rOSsHKpu2jl7Y+q6zN792
	cO/v3FpRhxQbK1nbXjZQhkozHmkceq5PGG1VT7msrP+gKKHXZ6yiKjUvkF7XhXLumrme9pkEbYL
	F3HBmHioYxNKA9CbP+cQzWuRl1TJI2O9ri6s4ffBUCdRzYAMMfD5cG+dXLJG9BciRupBi8a/b6Q
	==
X-Gm-Gg: ASbGncsIolvIHaGkjdJgnto58GAvq3cyIeIwwslUbike6fsBdkuwUtGYJCOxyzsY3RU
	8HbUzKlSCCGXRZWAzONYwaVrHQEwqqpa8lkeZMUofxfO+6HZ5dn08IQFwNorc5EqBUxAO7F9S4o
	C6FdrO8dMGvP1IfvUiFzbhptiKFAUyM74K8ABdziJDxcPhwcYYuF/Vi5o0QemGnoWEEcBEDuT4T
	VnbRTc4RO/Sw698nFGPa0ELVIU0pp61UckWzWmvKr/sqJZEchI0fyK6NluIZIyi5uWECN0gF5B+
	/kDxH8Sq1MdMpEo9VlbC7JRhIjUHjdeg6AE=
X-Received: by 2002:a5d:64e8:0:b0:385:d7f9:f15d with SMTP id ffacd0b85a97d-385fd3f2203mr1331590f8f.11.1733219273169;
        Tue, 03 Dec 2024 01:47:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGDQ5OaqVY3m0DLSpLsQFBtVdXjpTP6F01guYNPwPEOIqC9M1Xr0t++bvv36PMaxbsj7juBag==
X-Received: by 2002:a5d:64e8:0:b0:385:d7f9:f15d with SMTP id ffacd0b85a97d-385fd3f2203mr1331571f8f.11.1733219272794;
        Tue, 03 Dec 2024 01:47:52 -0800 (PST)
Received: from localhost (p200300cbc7461b00fd9ec26cc5521de7.dip0.t-ipconnect.de. [2003:cb:c746:1b00:fd9e:c26c:c552:1de7])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-385ccd68c1bsm15299309f8f.84.2024.12.03.01.47.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Dec 2024 01:47:52 -0800 (PST)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Oscar Salvador <osalvador@suse.de>,
	Zi Yan <ziy@nvidia.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: [PATCH RESEND v2 6/6] powernv/memtrace: use __GFP_ZERO with alloc_contig_pages()
Date: Tue,  3 Dec 2024 10:47:32 +0100
Message-ID: <20241203094732.200195-7-david@redhat.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241203094732.200195-1-david@redhat.com>
References: <20241203094732.200195-1-david@redhat.com>
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
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SCZOayN90O2UCxlsLLnN5YFudejsg6cbuZtcXnunOTs_1733219273
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

alloc_contig_pages()->alloc_contig_range() now supports __GFP_ZERO,
so let's use that instead to resolve our TODO.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/powerpc/platforms/powernv/memtrace.c | 31 +++++------------------
 1 file changed, 6 insertions(+), 25 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/memtrace.c b/arch/powerpc/platforms/powernv/memtrace.c
index 877720c64515..4ac9808e55a4 100644
--- a/arch/powerpc/platforms/powernv/memtrace.c
+++ b/arch/powerpc/platforms/powernv/memtrace.c
@@ -88,26 +88,6 @@ static void flush_dcache_range_chunked(unsigned long start, unsigned long stop,
 	}
 }
 
-static void memtrace_clear_range(unsigned long start_pfn,
-				 unsigned long nr_pages)
-{
-	unsigned long pfn;
-
-	/* As HIGHMEM does not apply, use clear_page() directly. */
-	for (pfn = start_pfn; pfn < start_pfn + nr_pages; pfn++) {
-		if (IS_ALIGNED(pfn, PAGES_PER_SECTION))
-			cond_resched();
-		clear_page(__va(PFN_PHYS(pfn)));
-	}
-	/*
-	 * Before we go ahead and use this range as cache inhibited range
-	 * flush the cache.
-	 */
-	flush_dcache_range_chunked((unsigned long)pfn_to_kaddr(start_pfn),
-				   (unsigned long)pfn_to_kaddr(start_pfn + nr_pages),
-				   FLUSH_CHUNK_SIZE);
-}
-
 static u64 memtrace_alloc_node(u32 nid, u64 size)
 {
 	const unsigned long nr_pages = PHYS_PFN(size);
@@ -119,17 +99,18 @@ static u64 memtrace_alloc_node(u32 nid, u64 size)
 	 * by alloc_contig_pages().
 	 */
 	page = alloc_contig_pages(nr_pages, GFP_KERNEL | __GFP_THISNODE |
-				  __GFP_NOWARN, nid, NULL);
+				  __GFP_NOWARN | __GFP_ZERO, nid, NULL);
 	if (!page)
 		return 0;
 	start_pfn = page_to_pfn(page);
 
 	/*
-	 * Clear the range while we still have a linear mapping.
-	 *
-	 * TODO: use __GFP_ZERO with alloc_contig_pages() once supported.
+	 * Before we go ahead and use this range as cache inhibited range
+	 * flush the cache.
 	 */
-	memtrace_clear_range(start_pfn, nr_pages);
+	flush_dcache_range_chunked((unsigned long)pfn_to_kaddr(start_pfn),
+				   (unsigned long)pfn_to_kaddr(start_pfn + nr_pages),
+				   FLUSH_CHUNK_SIZE);
 
 	/*
 	 * Set pages PageOffline(), to indicate that nobody (e.g., hibernation,
-- 
2.47.1


