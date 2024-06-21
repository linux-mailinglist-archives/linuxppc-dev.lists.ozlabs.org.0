Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 160C19127A8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2024 16:27:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Wpx/YFsG;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NpqZ8/fO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W5KSK4KcWz3cYW
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jun 2024 00:27:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Wpx/YFsG;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NpqZ8/fO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W5KQ3419tz30Vr
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jun 2024 00:25:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718979913;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MJ/z3oUyfvIT45NLtsICo4unaxlXJrC1yYznR3c5j0M=;
	b=Wpx/YFsGRLC5tpB5q52HiUsqXeq24PUVeH/fAU+X8MpeJe10cqj2RgxP/0lgdSBeyxKYyK
	cBmM25evru53i9jqtGKud4j9cfH4xZTCk91FxuwHDN2VXcQSEdJU/v5dVa4mzQ0ZLrYNuF
	dGewGR0fpNB1z+vx9KLRoenJUMxxkko=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718979914;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MJ/z3oUyfvIT45NLtsICo4unaxlXJrC1yYznR3c5j0M=;
	b=NpqZ8/fOrv1cewustaaU796vG3luK/b5RL7FojUBAPomRp2Q6nRkIHynjvVaw9dDwLw3Nv
	8TfOY81+vQp6EpDrqkPrxQmwr0Xu99MH9rRX8/5F1/meU82Qx3ZOnDL1bok8Di6zGpWwPC
	D9VFDXZyUqXjHnTKRvhdwUHZvWzMVfU=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-114-6fzXBbfANqaKSkWahHwJ5A-1; Fri, 21 Jun 2024 10:25:12 -0400
X-MC-Unique: 6fzXBbfANqaKSkWahHwJ5A-1
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-798084906ddso13082385a.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jun 2024 07:25:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718979911; x=1719584711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MJ/z3oUyfvIT45NLtsICo4unaxlXJrC1yYznR3c5j0M=;
        b=icd2bguYyATr0z6dYbotaXefhIfrNg8n2/pkKRRe5FqxIIQt178x7f39r6iKr+Mncw
         9wBJCB5V7WsrrBTC8H7GNw6nPCEgiyk45YXHFCfxomgQIp9kwkyS5UFVukBc/1zUCp2/
         5Jw+2wEOLRHCUf5uSC8uhqo9BfuAYlsJ6IdJG87qTVSr64dZHwRWaLM45jgS7qrZ/v+B
         5ysIddXz3FbNXTPvYGVEqMCyIkwNbHfW2bXaDpYk750xk55UfXNuTeaY12sefW4aF3em
         THsqqvi+cpWK69ELtnCzZefjdc67pyp5q7qvCRgTlTnGkCJ7t1n5H9g1Woo69+3q56ul
         D2iA==
X-Forwarded-Encrypted: i=1; AJvYcCXHOgAR60AKlL/6L263yGBTnMlye1htDtFebvkoelp7VAEwTA+/9AD9uZRDu0z0PkspwuNnUMXjfy6KCBcVGA07jEpS2aNNtXH8gWiCYQ==
X-Gm-Message-State: AOJu0YzWQEz9cI23aH4hO7huQPX3yRAfcXTpwjZfkhrrp+8bG/UtLMlD
	Rvm1DvtX7iwV8zV/S2+sj/IxUpAeDBVKodM/+wGde/y5VRBo14lcb+6fcNTEbkqy/aBPIV3vDNz
	z16XW4WGT6fx26pl4r0xII27KBh2YEmIko9p1QDkwxlG1j42lRxKWbZ5xpJV/Xpg=
X-Received: by 2002:a05:620a:4610:b0:79b:be0b:7815 with SMTP id af79cd13be357-79bbe0b7c0fmr735911885a.1.1718979911272;
        Fri, 21 Jun 2024 07:25:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1JVg4Gm5x1JzvXAIal9/bHLuF/aojpegzJFLEbRVA7h1M8KnWp/bZUR1LNlUwbmLSWaEiNQ==
X-Received: by 2002:a05:620a:4610:b0:79b:be0b:7815 with SMTP id af79cd13be357-79bbe0b7c0fmr735907585a.1.1718979910823;
        Fri, 21 Jun 2024 07:25:10 -0700 (PDT)
Received: from x1n.redhat.com (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-79bce944cb2sm90564785a.125.2024.06.21.07.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 07:25:10 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 2/7] mm/mprotect: Remove NUMA_HUGE_PTE_UPDATES
Date: Fri, 21 Jun 2024 10:24:59 -0400
Message-ID: <20240621142504.1940209-3-peterx@redhat.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240621142504.1940209-1-peterx@redhat.com>
References: <20240621142504.1940209-1-peterx@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Dave Hansen <dave.hansen@linux.intel.com>, peterx@redhat.com, Christophe Leroy <christophe.leroy@csgroup.eu>, Dan Williams <dan.j.williams@intel.com>, Dave Jiang <dave.jiang@intel.com>, x86@kernel.org, Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, Ingo Molnar <mingo@redhat.com>, Huang Ying <ying.huang@intel.com>, Alex Thorlton <athorlton@sgi.com>, Rik van Riel <riel@surriel.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, "Kirill A . Shutemov" <kirill@shutemov.name>, Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>, Oscar Salvador <osalvador@suse.de>, linuxppc-dev@lists.ozlabs.org, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, Mel Gorman <mgorman@techsingularity.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In 2013, commit 72403b4a0fbd ("mm: numa: return the number of base pages
altered by protection changes") introduced "numa_huge_pte_updates" vmstat
entry, trying to capture how many huge ptes (in reality, PMD thps at that
time) are marked by NUMA balancing.

This patch proposes to remove it for some reasons.

Firstly, the name is misleading. We can have more than one way to have a
"huge pte" at least nowadays, and that's also the major goal of this patch,
where it paves way for PUD handling in change protection code paths.

PUDs are coming not only for dax (which has already came and yet broken..),
but also for pfnmaps and hugetlb pages.  The name will simply stop making
sense when PUD will start to be involved in mprotect() world.

It'll also make it not reasonable either if we boost the counter for both
pmd/puds.  In short, current accounting won't be right when PUD comes, so
the scheme was only suitable at that point in time where PUD wasn't even
possible.

Secondly, the accounting was simply not right from the start as long as it
was also affected by other call sites besides NUMA.  mprotect() is one,
while userfaultfd-wp also leverages change protection path to modify
pgtables.  If it wants to do right it needs to check the caller but it
never did; at least mprotect() should be there even in 2013.

It gives me the impression that nobody is seriously using this field, and
it's also impossible to be serious.

We may want to do it right if any NUMA developers would like it to exist,
but we should do that with all above resolved, on both considering PUDs,
but also on correct accountings.  That should be able to be done on top
when there's a real need of such.

Cc: Huang Ying <ying.huang@intel.com>
Cc: Mel Gorman <mgorman@techsingularity.net>
Cc: Alex Thorlton <athorlton@sgi.com>
Cc: Rik van Riel <riel@surriel.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 include/linux/vm_event_item.h | 1 -
 mm/mprotect.c                 | 8 +-------
 mm/vmstat.c                   | 1 -
 3 files changed, 1 insertion(+), 9 deletions(-)

diff --git a/include/linux/vm_event_item.h b/include/linux/vm_event_item.h
index 73fa5fbf33a3..a76b75d6a8f4 100644
--- a/include/linux/vm_event_item.h
+++ b/include/linux/vm_event_item.h
@@ -59,7 +59,6 @@ enum vm_event_item { PGPGIN, PGPGOUT, PSWPIN, PSWPOUT,
 		OOM_KILL,
 #ifdef CONFIG_NUMA_BALANCING
 		NUMA_PTE_UPDATES,
-		NUMA_HUGE_PTE_UPDATES,
 		NUMA_HINT_FAULTS,
 		NUMA_HINT_FAULTS_LOCAL,
 		NUMA_PAGE_MIGRATE,
diff --git a/mm/mprotect.c b/mm/mprotect.c
index 222ab434da54..21172272695e 100644
--- a/mm/mprotect.c
+++ b/mm/mprotect.c
@@ -363,7 +363,6 @@ static inline long change_pmd_range(struct mmu_gather *tlb,
 	pmd_t *pmd;
 	unsigned long next;
 	long pages = 0;
-	unsigned long nr_huge_updates = 0;
 	struct mmu_notifier_range range;
 
 	range.start = 0;
@@ -411,11 +410,8 @@ static inline long change_pmd_range(struct mmu_gather *tlb,
 				ret = change_huge_pmd(tlb, vma, pmd,
 						addr, newprot, cp_flags);
 				if (ret) {
-					if (ret == HPAGE_PMD_NR) {
+					if (ret == HPAGE_PMD_NR)
 						pages += HPAGE_PMD_NR;
-						nr_huge_updates++;
-					}
-
 					/* huge pmd was handled */
 					goto next;
 				}
@@ -435,8 +431,6 @@ static inline long change_pmd_range(struct mmu_gather *tlb,
 	if (range.start)
 		mmu_notifier_invalidate_range_end(&range);
 
-	if (nr_huge_updates)
-		count_vm_numa_events(NUMA_HUGE_PTE_UPDATES, nr_huge_updates);
 	return pages;
 }
 
diff --git a/mm/vmstat.c b/mm/vmstat.c
index 6e3347789eb2..be774893f69e 100644
--- a/mm/vmstat.c
+++ b/mm/vmstat.c
@@ -1313,7 +1313,6 @@ const char * const vmstat_text[] = {
 
 #ifdef CONFIG_NUMA_BALANCING
 	"numa_pte_updates",
-	"numa_huge_pte_updates",
 	"numa_hint_faults",
 	"numa_hint_faults_local",
 	"numa_pages_migrated",
-- 
2.45.0

