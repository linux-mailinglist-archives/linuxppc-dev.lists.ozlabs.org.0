Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 195ED66AC7A
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Jan 2023 17:10:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NvNYg43hlz3fCW
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Jan 2023 03:10:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hPkbBY7S;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hPkbBY7S;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hPkbBY7S;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hPkbBY7S;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NvNXg5S5qz2xBF
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 Jan 2023 03:09:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673712591;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q3R4pvBr6dG+A0u3o+nBNguX6qX9S+oXSEacD+sP77s=;
	b=hPkbBY7SFYtRUagQPUF4ycp2cXd7aF0wMzS2q/WufQKehCkdRzzr0vbxc+9/hCM1lMZWaD
	bzLHlL2i5TcyktTHMkhe1qZeRaGfSM7/C2o59+L6qoUbPIpKez91dMGu2jczxDkJbe/EGt
	l8TkpuuPR3TugD7iVDQCcJkxjeWz5Qk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673712591;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q3R4pvBr6dG+A0u3o+nBNguX6qX9S+oXSEacD+sP77s=;
	b=hPkbBY7SFYtRUagQPUF4ycp2cXd7aF0wMzS2q/WufQKehCkdRzzr0vbxc+9/hCM1lMZWaD
	bzLHlL2i5TcyktTHMkhe1qZeRaGfSM7/C2o59+L6qoUbPIpKez91dMGu2jczxDkJbe/EGt
	l8TkpuuPR3TugD7iVDQCcJkxjeWz5Qk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-70-sBY9loeAOk2DyDVFOfTrFg-1; Sat, 14 Jan 2023 11:09:39 -0500
X-MC-Unique: sBY9loeAOk2DyDVFOfTrFg-1
Received: by mail-wm1-f69.google.com with SMTP id ay38-20020a05600c1e2600b003da7c41fafcso722924wmb.7
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Jan 2023 08:09:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:organization:from
         :references:cc:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q3R4pvBr6dG+A0u3o+nBNguX6qX9S+oXSEacD+sP77s=;
        b=Uh9z4NTcsv8RGb/lQ17Qh/PrRWt59su8IN4qKBphYy38cYBjDriBFE9wgLHfAvGjxX
         jur4ai6CoBCwLxsDmXwf3jms4sRt4rhbZB3z/VXyPx82z+TqVe7An12kcXgDIc+bDO6t
         A9PGOeNNhDtghftcEsByOnKE8vCw8+lw3T3y/aV0Hq3ulBO+zuAwwLFJbC5os33TtKXy
         yBShmrrFHt3b0DxgZUAarXA2c29p4DMuAcFXhMNWnB7hgKyNhxGvjLlIB8zgvofYSf+l
         iGBP/bbm/Ppzl9ASA2VmmKswyUMwtgPP57jv1aqf4IkdGjLEjgvTcxviz0O1Babx0ngi
         WUDA==
X-Gm-Message-State: AFqh2kosm6Zs063EHpS8cbVWW5MMZN/axgyTrgrdPRivi6QrdNn8Tqv7
	n8jLx/BeIOjPt0k6z9x1CA+CnKuf28egzmBHcolyZHzjOdFoZdhcz9w076wJxuIieCZAkwIQATT
	2IG10QtdH3crNTe8cF4udRIR4fQ==
X-Received: by 2002:a05:600c:348b:b0:3d1:f16b:30e6 with SMTP id a11-20020a05600c348b00b003d1f16b30e6mr62422466wmq.28.1673712578325;
        Sat, 14 Jan 2023 08:09:38 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtvXECQ77f+OwG9Mdcw6TdAWlLhcG76s2TeMh5Hr9A1VofwYXs3lPZWG9daADyc7xNo4jh7zQ==
X-Received: by 2002:a05:600c:348b:b0:3d1:f16b:30e6 with SMTP id a11-20020a05600c348b00b003d1f16b30e6mr62422426wmq.28.1673712578037;
        Sat, 14 Jan 2023 08:09:38 -0800 (PST)
Received: from ?IPV6:2003:cb:c71c:9800:fa4a:c1fc:a860:85af? (p200300cbc71c9800fa4ac1fca86085af.dip0.t-ipconnect.de. [2003:cb:c71c:9800:fa4a:c1fc:a860:85af])
        by smtp.gmail.com with ESMTPSA id q18-20020adfdfd2000000b002bdc129c8f6sm10260315wrn.43.2023.01.14.08.09.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Jan 2023 08:09:37 -0800 (PST)
Message-ID: <6aaad548-cf48-77fa-9d6c-db83d724b2eb@redhat.com>
Date: Sat, 14 Jan 2023 17:09:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
To: linux-kernel@vger.kernel.org
References: <20230113171026.582290-1-david@redhat.com>
 <20230113171026.582290-2-david@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH mm-unstable v1 01/26] mm/debug_vm_pgtable: more
 pte_swp_exclusive() sanity checks
In-Reply-To: <20230113171026.582290-2-david@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Yang Shi <shy828301@gmail.com>, Peter Xu <peterx@redhat.com>, linux-mm@kvack.org, Nadav Amit <namit@vmware.com>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Andrea Arcangeli <aarcange@redhat.com>, linux-s390@vger.kernel.org, linux-hexagon@vger.kernel.org, x86@kernel.org, Hugh Dickins <hughd@google.com>, linux-csky@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>, Vlastimil Babka <vbabka@suse.cz>, Jason Gunthorpe <jgg@nvidia.com>, linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org, John Hubbard <jhubbard@nvidia.com>, linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org, loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org, linux-alpha@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 13.01.23 18:10, David Hildenbrand wrote:
> We want to implement __HAVE_ARCH_PTE_SWP_EXCLUSIVE on all architectures.
> Let's extend our sanity checks, especially testing that our PTE bit
> does not affect:
> * is_swap_pte() -> pte_present() and pte_none()
> * the swap entry + type
> * pte_swp_soft_dirty()
> 
> Especially, the pfn_pte() is dodgy when the swap PTE layout differs
> heavily from ordinary PTEs. Let's properly construct a swap PTE from
> swap type+offset.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---

The following fixup for !CONFIG_SWAP on top, which makes it compile for me and
passes when booting on x86_64 with CONFIG_DEBUG_VM_PGTABLE:

...
[    0.347112] Loaded X.509 cert 'Build time autogenerated kernel key: ee6afc0578f6475656fec8a4f9d02832'
[    0.350112] debug_vm_pgtable: [debug_vm_pgtable         ]: Validating architecture page table helpers
[    0.351217] page_owner is disabled
...


 From 6a6162e8af62a4b3f7b9d823fdfae86de3f34a9d Mon Sep 17 00:00:00 2001
From: David Hildenbrand <david@redhat.com>
Date: Sat, 14 Jan 2023 16:47:12 +0100
Subject: [PATCH] fixup: mm/debug_vm_pgtable: more pte_swp_exclusive() sanity
  checks

generic_max_swapfile_size() is only available with CONFIG_SWAP -- which
makes sense, because without SWAP there are no swap files. Let's
simply probe manually which bits we can obtain after storing them in a
PTE, and properly call it "max swap offset", which is more generic for
a swap entry.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
  mm/debug_vm_pgtable.c | 8 +++++---
  1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
index 3da0cc380c35..af59cc7bd307 100644
--- a/mm/debug_vm_pgtable.c
+++ b/mm/debug_vm_pgtable.c
@@ -810,15 +810,17 @@ static void __init pmd_swap_soft_dirty_tests(struct pgtable_debug_args *args) {
  
  static void __init pte_swap_exclusive_tests(struct pgtable_debug_args *args)
  {
-	unsigned long max_swapfile_size = generic_max_swapfile_size();
+	unsigned long max_swap_offset;
  	swp_entry_t entry, entry2;
  	pte_t pte;
  
  	pr_debug("Validating PTE swap exclusive\n");
  
+	/* See generic_max_swapfile_size(): probe the maximum offset */
+	max_swap_offset = swp_offset(pte_to_swp_entry(swp_entry_to_pte(swp_entry(0, ~0UL))));
+
  	/* Create a swp entry with all possible bits set */
-	entry = swp_entry((1 << MAX_SWAPFILES_SHIFT) - 1,
-			  max_swapfile_size - 1);
+	entry = swp_entry((1 << MAX_SWAPFILES_SHIFT) - 1, max_swap_offset);
  
  	pte = swp_entry_to_pte(entry);
  	WARN_ON(pte_swp_exclusive(pte));
-- 
2.39.0



-- 
Thanks,

David / dhildenb

