Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1AB8506CBE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Apr 2022 14:47:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KjNqy60krz2yw9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Apr 2022 22:47:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RnKtPUGk;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CO2ZpUXD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=RnKtPUGk; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=CO2ZpUXD; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KjNqC3tjYz2xnM
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Apr 2022 22:47:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650372416;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JIdJvCM/nzvVsX3gP8Of74a/GoE/TyZ8c3A83vketQk=;
 b=RnKtPUGkE9L1McwSaDNVB1nD8oGCxIhJgsD3XvuVfHH3jdVQ4Ojdzs6B+wRxoASQm0iiYw
 k43R47EtlY187MDW+ohxOXRH33a1aydVtfsdLJp9aagJ37IKMv892vkKusSty6xT2T9wHr
 c2xjaBIbdUku2bJfk4raQrfJY+PEuE8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650372417;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JIdJvCM/nzvVsX3gP8Of74a/GoE/TyZ8c3A83vketQk=;
 b=CO2ZpUXD87rVSUlp6k2aUMctcdRiPDutxgrX4iuHNWoLNNtDJbiXNy8j0Q57Ev0xxhAcAO
 tMvYkDdLM7Zi/zbsJAYCekyIN58y/ROD6s7HWqAMVmk/z6Kz7ldgIEPJqs+gMTFGzI6mZz
 rlOV5qiNxY6U3fm2xx1Tv3QB5Pxq0o4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-426-NxaHO3rlObKMbOaa37o-ow-1; Tue, 19 Apr 2022 08:46:55 -0400
X-MC-Unique: NxaHO3rlObKMbOaa37o-ow-1
Received: by mail-wm1-f69.google.com with SMTP id
 bg8-20020a05600c3c8800b0038e6a989925so9251808wmb.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Apr 2022 05:46:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:organization:subject
 :in-reply-to:content-transfer-encoding;
 bh=JIdJvCM/nzvVsX3gP8Of74a/GoE/TyZ8c3A83vketQk=;
 b=lyjOe2nIEYvEj6KkIA7BVkEi3E9stJYCY5nCZhtnq0i6TkF5znPU8g8iDoEC4cUHyd
 yuZPPya4l4nhY3l8V0u31GjpghvwMGRYV1yqHd3RmBDAWnMXVxX4SoFjkHiD4LWS6K8L
 PbVIkAOGjJhzqww0rT3J6zruJjP9H6h3bbw8UM1cX4RPcyrpyvTwxF1mVHqU3+gYvZEz
 u+HNg6ThXow3XRIgfIDPdyKnERcokWHEu6NFt52qZ1Pfykrvz3aXNelpOZDI/NfdT3TQ
 2AkzJyuCxVrTFPnqA02zwgtd1nYu/YZ3gICOiRoo3tb3BRgtUz9ld8Hga4mcGyEhBW11
 1eiA==
X-Gm-Message-State: AOAM531bnLhGpmaqs9Hu5kBGIco6SVd+FhECrNIQSIABLhelPzXT7dHf
 NS4HOBpAM6/ofWC09PrdH/DXZZIuHOoFxdAC56ryFB641bn42+N5FLxk8IrzNmZWi2S1C9Rfntj
 G/vGxQQ50AFPkfg7OEllIdHLxjw==
X-Received: by 2002:a5d:6c61:0:b0:20a:a261:876a with SMTP id
 r1-20020a5d6c61000000b0020aa261876amr3888825wrz.251.1650372414465; 
 Tue, 19 Apr 2022 05:46:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzdMM5QdzCOMem9yase7YYuZlZxCCL7y7FebP52SLMHsNQ3htbJhnS/K27BEXI5r4m/9jMYRg==
X-Received: by 2002:a5d:6c61:0:b0:20a:a261:876a with SMTP id
 r1-20020a5d6c61000000b0020aa261876amr3888803wrz.251.1650372414247; 
 Tue, 19 Apr 2022 05:46:54 -0700 (PDT)
Received: from ?IPV6:2003:cb:c704:5d00:d8c2:fbf6:a608:957a?
 (p200300cbc7045d00d8c2fbf6a608957a.dip0.t-ipconnect.de.
 [2003:cb:c704:5d00:d8c2:fbf6:a608:957a])
 by smtp.gmail.com with ESMTPSA id
 s7-20020a5d6a87000000b00207aad420c4sm12434616wru.101.2022.04.19.05.46.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Apr 2022 05:46:53 -0700 (PDT)
Message-ID: <d875c292-46b3-f281-65ae-71d0b0c6f592@redhat.com>
Date: Tue, 19 Apr 2022 14:46:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
To: linux-kernel@vger.kernel.org
References: <20220329164329.208407-1-david@redhat.com>
 <20220329164329.208407-4-david@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v2 3/8] x86/pgtable: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
In-Reply-To: <20220329164329.208407-4-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: x86@kernel.org, Jan Kara <jack@suse.cz>,
 Catalin Marinas <catalin.marinas@arm.com>, Yang Shi <shy828301@gmail.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Peter Xu <peterx@redhat.com>,
 Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org,
 Donald Dutile <ddutile@redhat.com>, Liang Zhang <zhangliang5@huawei.com>,
 Borislav Petkov <bp@alien8.de>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Paul Mackerras <paulus@samba.org>, Andrea Arcangeli <aarcange@redhat.com>,
 linux-s390@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>,
 Rik van Riel <riel@surriel.com>, Hugh Dickins <hughd@google.com>,
 Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, linux-arm-kernel@lists.infradead.org,
 Jason Gunthorpe <jgg@nvidia.com>, David Rientjes <rientjes@google.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Pedro Gomes <pedrodemargomes@gmail.com>, Jann Horn <jannh@google.com>,
 John Hubbard <jhubbard@nvidia.com>, Heiko Carstens <hca@linux.ibm.com>,
 Shakeel Butt <shakeelb@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Vlastimil Babka <vbabka@suse.cz>, Oded Gabbay <oded.gabbay@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, Oleg Nesterov <oleg@redhat.com>,
 Nadav Amit <namit@vmware.com>, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, Roman Gushchin <guro@fb.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 29.03.22 18:43, David Hildenbrand wrote:
> Let's use bit 3 to remember PG_anon_exclusive in swap ptes.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---

Looks like I ignored that 32bit uses a different (undocumented) swap layout
and bit 3 falls into the swp type. We'll restrict this to x86-64 for now, just
like for the other architectures.

The following seems to fly. @Andrew, let me know if you prefer a v3.


From bafb5ba914e89ad20c46f4e841a36909e610b81e Mon Sep 17 00:00:00 2001
From: David Hildenbrand <david@redhat.com>
Date: Wed, 9 Mar 2022 09:47:29 +0100
Subject: [PATCH] x86/pgtable: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE on x86_64

Let's use bit 3 to remember PG_anon_exclusive in swap ptes.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/x86/include/asm/pgtable.h          | 17 +++++++++++++++++
 arch/x86/include/asm/pgtable_64.h       |  4 +++-
 arch/x86/include/asm/pgtable_64_types.h |  5 +++++
 3 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index 62ab07e24aef..a1c555abed26 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -1291,6 +1291,23 @@ static inline void update_mmu_cache_pud(struct vm_area_struct *vma,
 		unsigned long addr, pud_t *pud)
 {
 }
+#ifdef _PAGE_SWP_EXCLUSIVE
+#define __HAVE_ARCH_PTE_SWP_EXCLUSIVE
+static inline pte_t pte_swp_mkexclusive(pte_t pte)
+{
+	return pte_set_flags(pte, _PAGE_SWP_EXCLUSIVE);
+}
+
+static inline int pte_swp_exclusive(pte_t pte)
+{
+	return pte_flags(pte) & _PAGE_SWP_EXCLUSIVE;
+}
+
+static inline pte_t pte_swp_clear_exclusive(pte_t pte)
+{
+	return pte_clear_flags(pte, _PAGE_SWP_EXCLUSIVE);
+}
+#endif /* _PAGE_SWP_EXCLUSIVE */
 
 #ifdef CONFIG_HAVE_ARCH_SOFT_DIRTY
 static inline pte_t pte_swp_mksoft_dirty(pte_t pte)
diff --git a/arch/x86/include/asm/pgtable_64.h b/arch/x86/include/asm/pgtable_64.h
index 56d0399a0cd1..e479491da8d5 100644
--- a/arch/x86/include/asm/pgtable_64.h
+++ b/arch/x86/include/asm/pgtable_64.h
@@ -186,7 +186,7 @@ static inline void native_pgd_clear(pgd_t *pgd)
  *
  * |     ...            | 11| 10|  9|8|7|6|5| 4| 3|2| 1|0| <- bit number
  * |     ...            |SW3|SW2|SW1|G|L|D|A|CD|WT|U| W|P| <- bit names
- * | TYPE (59-63) | ~OFFSET (9-58)  |0|0|X|X| X| X|F|SD|0| <- swp entry
+ * | TYPE (59-63) | ~OFFSET (9-58)  |0|0|X|X| X| E|F|SD|0| <- swp entry
  *
  * G (8) is aliased and used as a PROT_NONE indicator for
  * !present ptes.  We need to start storing swap entries above
@@ -203,6 +203,8 @@ static inline void native_pgd_clear(pgd_t *pgd)
  * F (2) in swp entry is used to record when a pagetable is
  * writeprotected by userfaultfd WP support.
  *
+ * E (3) in swp entry is used to rememeber PG_anon_exclusive.
+ *
  * Bit 7 in swp entry should be 0 because pmd_present checks not only P,
  * but also L and G.
  *
diff --git a/arch/x86/include/asm/pgtable_64_types.h b/arch/x86/include/asm/pgtable_64_types.h
index 91ac10654570..70e360a2e5fb 100644
--- a/arch/x86/include/asm/pgtable_64_types.h
+++ b/arch/x86/include/asm/pgtable_64_types.h
@@ -163,4 +163,9 @@ extern unsigned int ptrs_per_p4d;
 
 #define PGD_KERNEL_START	((PAGE_SIZE / 2) / sizeof(pgd_t))
 
+/*
+ * We borrow bit 3 to remember PG_anon_exclusive.
+ */
+#define _PAGE_SWP_EXCLUSIVE	_PAGE_PWT
+
 #endif /* _ASM_X86_PGTABLE_64_DEFS_H */
-- 
2.35.1





-- 
Thanks,

David / dhildenb

