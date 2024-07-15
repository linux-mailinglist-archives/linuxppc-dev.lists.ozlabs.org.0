Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F79E931ACD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2024 21:23:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HwQQOaBv;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HwQQOaBv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WNBvV3mcpz3cY9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2024 05:23:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HwQQOaBv;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HwQQOaBv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WNBsK4CgGz3cXD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2024 05:21:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721071314;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uDSHiwJLCIYvvzv2DOw1kewa0irBZ6HqHLZp2ORNUK8=;
	b=HwQQOaBvM05u+WKw2CcM6W34Adv/lBJY+1ZbaU7rRamzy0iXS3j1o/32IyKZoe0zpF0BQ+
	J4XWgRBCm8WVzRQ88MX+A9b1Vp6vRVQdiFeHk+c6bzKuz96MHo+HBzXDkhOz69uMf7jRo9
	7e/oqaAwFeblYiQmnSd0L6eKCNWHMRM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721071314;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uDSHiwJLCIYvvzv2DOw1kewa0irBZ6HqHLZp2ORNUK8=;
	b=HwQQOaBvM05u+WKw2CcM6W34Adv/lBJY+1ZbaU7rRamzy0iXS3j1o/32IyKZoe0zpF0BQ+
	J4XWgRBCm8WVzRQ88MX+A9b1Vp6vRVQdiFeHk+c6bzKuz96MHo+HBzXDkhOz69uMf7jRo9
	7e/oqaAwFeblYiQmnSd0L6eKCNWHMRM=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-130-jjeMQHM1OBGaV66PLvH-uA-1; Mon, 15 Jul 2024 15:21:51 -0400
X-MC-Unique: jjeMQHM1OBGaV66PLvH-uA-1
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6b5e4f6e95bso7236466d6.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jul 2024 12:21:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721071310; x=1721676110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uDSHiwJLCIYvvzv2DOw1kewa0irBZ6HqHLZp2ORNUK8=;
        b=FjHVCVFXuCcDTH+V1JB4d1q/iWPgsBgj0oHA7szkSmIMpsIHq/oElKpOsw+ZOrFMUV
         Bcx6BNPo01AnUW4y1o+z2Kip3a+G/x6Ard6Lg2JMSVX3ByC3iwpGLnx2fU+Esp1cdz48
         TUhIHvYoU6MLxtmeBGkAdi3o9pFIUsMdFvf6AfU1Sn63JxsdcizMl9Z7jBTJcgC7zyLd
         fP6JYhTzWTO1Sh2Hcl7KSxXYV0/zTldXPOBpc/AT/wTVrZfBc4Sum+amrFnqrIE4dTQm
         dw/iQeFqOQ9MrVwo9qFmcr+7IuImzpBmRHRKNMYEVPEZWGmDW2kYEkPUz35DTCk27kD8
         yfCg==
X-Forwarded-Encrypted: i=1; AJvYcCVHJDMN2KzNXyl7LmIfFDO4GucLN864jI+qbvy9U/wLFZpGkHs2nuXGRYp+TTpVCuW2QkZ4BYpXrsaKpFedYhrITCBrCRv+SZup4YE4rQ==
X-Gm-Message-State: AOJu0Yz6HLsaikotXsOUknJdeR6bmKd34jflLRN0cRZek3joH9/9d2C2
	4SGxCUr1+6/5VS+SJk1zl2rXLBPBpzsTIMCV7j81I1W2XeJHI1t/5yaHTILGWsXDPNsaqdBg9ux
	GdGVQTRDt3lGMsr51Iu8pY+WsayuiuYoMFI/C7PSH3V0jbyqhZrQVwcLWcDSniFE=
X-Received: by 2002:a05:6214:2d44:b0:6b5:4bf:e0b2 with SMTP id 6a1803df08f44-6b77df230d0mr4738366d6.6.1721071310697;
        Mon, 15 Jul 2024 12:21:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHXNZWcX+OGChgQMRYaFRNal2nxEfRlz+I/X26JLEslV+UpQEodY5JY9Fmq0XZviJ4grHRk9w==
X-Received: by 2002:a05:6214:2d44:b0:6b5:4bf:e0b2 with SMTP id 6a1803df08f44-6b77df230d0mr4738076d6.6.1721071310396;
        Mon, 15 Jul 2024 12:21:50 -0700 (PDT)
Received: from x1n.redhat.com (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b761978d30sm24039356d6.31.2024.07.15.12.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 12:21:49 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/8] mm/mprotect: Remove NUMA_HUGE_PTE_UPDATES
Date: Mon, 15 Jul 2024 15:21:36 -0400
Message-ID: <20240715192142.3241557-3-peterx@redhat.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240715192142.3241557-1-peterx@redhat.com>
References: <20240715192142.3241557-1-peterx@redhat.com>
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
Cc: Dave Hansen <dave.hansen@linux.intel.com>, peterx@redhat.com, Christophe Leroy <christophe.leroy@csgroup.eu>, Dan Williams <dan.j.williams@intel.com>, Dave Jiang <dave.jiang@intel.com>, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, x86@kernel.org, Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, Ingo Molnar <mingo@redhat.com>, Huang Ying <ying.huang@intel.com>, Alex Thorlton <athorlton@sgi.com>, Rik van Riel <riel@surriel.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, "Kirill A . Shutemov" <kirill@shutemov.name>, Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>, Oscar Salvador <osalvador@suse.de>, linuxppc-dev@lists.ozlabs.org, Andrew Morton <akpm@linux-foundation.org>, Rick P Edgecombe <rick.p.edgecombe@intel.com>, Mel Gorman <mgorman@techsingularity.net>
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
index 747943bc8cc2..2a3797fb6742 100644
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
index 73d791d1caad..53656227f70d 100644
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

