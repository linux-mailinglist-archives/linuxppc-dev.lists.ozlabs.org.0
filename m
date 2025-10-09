Return-Path: <linuxppc-dev+bounces-12732-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E39ABC7A9E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 09 Oct 2025 09:20:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cj1Vs682sz3cDN;
	Thu,  9 Oct 2025 18:20:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759994437;
	cv=none; b=UaJlz67v5xPTyOwbeurWC4V7/ji5XjNoCfGF3PGLMObiiIhdyxgP/w7beNg+iw5QXn/Wojj8ncnm5Ko5BgQVhOgp7HXsU7hxYK3097884R6F+nIhlrKqvf8TqAn5cJ73QdZrSnYaauH1NfTPMAWq//bI+C3Y9RSYMjaivxgfaOpGaNTdkbCmFHmhkiWAYycnJ+9FZFv/TlqzBFRu04e24heJ0WmcIqVdtXecTxL2FCjpsNu8ABXX7DAyYpWQvEUYIKigsBNxXdL1Z+P24XBgj9+tSN01eJk3/SzgII61TSuby86T/GJBr8PA0wcI/vrOQr08oMeq8LxPAFtWZ8Gcpw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759994437; c=relaxed/relaxed;
	bh=K8cf0AOs/mVNsDWJRMHcPMT4OicAVe2fATkFfoZ8F9E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UgrQfteQ4W1Tnw07WwTz/+IaB+J1U2f4vjYUZk47IP7d8PJ0eb9DhhrvO+GE83KrMBKg50Tmw9y2ujsWEaSquoyUOSXduMK5yWvjU5VCLG/zOo7EeVB6ZNSDPGXgLex4CDc7seMvlgBc6NaJmkojUxnmTx2JHSkIG7F9i9FZ/H0ir6ncQVGpU2/31peyG1shMUVVb6H/+PrRrLtku1b3swfILSon82DjCOCw9rOtiYBTed5BkJKmWfQXtJq7F7ONlLpAFm4vrK5imm+oQ4VzNIspxEo9ysvoyU5SKrs22fnChr4o4EoU7VyC65xfWju5v8/W3kpqOz4mjlZLWYzuKg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cj1Vr6xPfz2yPS
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Oct 2025 18:20:36 +1100 (AEDT)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cj1Mm20R5z9sSd;
	Thu,  9 Oct 2025 09:14:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IrXIuvb4y-IU; Thu,  9 Oct 2025 09:14:28 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cj1Mm0p1dz9sSb;
	Thu,  9 Oct 2025 09:14:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id F24048B76C;
	Thu,  9 Oct 2025 09:14:27 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id wHEaqnf6dd0R; Thu,  9 Oct 2025 09:14:27 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D85288B768;
	Thu,  9 Oct 2025 09:14:25 +0200 (CEST)
Message-ID: <3e043453-3f27-48ad-b987-cc39f523060a@csgroup.eu>
Date: Thu, 9 Oct 2025 09:14:24 +0200
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
User-Agent: Mozilla Thunderbird
Subject: Re: (bisected) [PATCH v2 08/37] mm/hugetlb: check for unreasonable
 folio sizes when registering hstate
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
Cc: Zi Yan <ziy@nvidia.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Alexander Potapenko <glider@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Brendan Jackman <jackmanb@google.com>, Christoph Lameter <cl@gentwo.org>,
 Dennis Zhou <dennis@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 iommu@lists.linux.dev, io-uring@vger.kernel.org,
 Jason Gunthorpe <jgg@nvidia.com>, Jens Axboe <axboe@kernel.dk>,
 Johannes Weiner <hannes@cmpxchg.org>, John Hubbard <jhubbard@nvidia.com>,
 kasan-dev@googlegroups.com, kvm@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-arm-kernel@axis.com,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, Marco Elver <elver@google.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Muchun Song <muchun.song@linux.dev>,
 netdev@vger.kernel.org, Oscar Salvador <osalvador@suse.de>,
 Peter Xu <peterx@redhat.com>, Robin Murphy <robin.murphy@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Tejun Heo <tj@kernel.org>,
 virtualization@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>,
 wireguard@lists.zx2c4.com, x86@kernel.org,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <20250901150359.867252-1-david@redhat.com>
 <20250901150359.867252-9-david@redhat.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20250901150359.867252-9-david@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi David,

Le 01/09/2025 à 17:03, David Hildenbrand a écrit :
> Let's check that no hstate that corresponds to an unreasonable folio size
> is registered by an architecture. If we were to succeed registering, we
> could later try allocating an unsupported gigantic folio size.
> 
> Further, let's add a BUILD_BUG_ON() for checking that HUGETLB_PAGE_ORDER
> is sane at build time. As HUGETLB_PAGE_ORDER is dynamic on powerpc, we have
> to use a BUILD_BUG_ON_INVALID() to make it compile.
> 
> No existing kernel configuration should be able to trigger this check:
> either SPARSEMEM without SPARSEMEM_VMEMMAP cannot be configured or
> gigantic folios will not exceed a memory section (the case on sparse).
> 
> Reviewed-by: Zi Yan <ziy@nvidia.com>
> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Reviewed-by: Liam R. Howlett <Liam.Howlett@oracle.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>

I get following warning on powerpc with linus tree, bisected to commit 
7b4f21f5e038 ("mm/hugetlb: check for unreasonable folio sizes when 
registering hstate")

------------[ cut here ]------------
WARNING: CPU: 0 PID: 0 at mm/hugetlb.c:4744 hugetlb_add_hstate+0xc0/0x180
Modules linked in:
CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 
6.17.0-rc4-00275-g7b4f21f5e038 #1683 NONE
Hardware name: QEMU ppce500 e5500 0x80240020 QEMU e500
NIP:  c000000001357408 LR: c000000001357c90 CTR: 0000000000000003
REGS: c00000000152bad0 TRAP: 0700   Not tainted 
(6.17.0-rc4-00275-g7b4f21f5e038)
MSR:  0000000080021002 <CE,ME>  CR: 44000448  XER: 20000000
IRQMASK: 1
GPR00: c000000001357c90 c00000000152bd70 c000000001339000 0000000000000012
GPR04: 000000000000000a 0000000000001000 000000000000001e 0000000000000000
GPR08: 0000000000000000 0000000000000000 0000000000000001 000000000000000a
GPR12: c000000001357b68 c000000001590000 0000000000000000 0000000000000000
GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
GPR24: c0000000011adb40 c00000000156b528 0000000000000000 c00000000156b4b0
GPR28: c00000000156b528 0000000000000012 0000000040000000 0000000000000000
NIP [c000000001357408] hugetlb_add_hstate+0xc0/0x180
LR [c000000001357c90] hugepagesz_setup+0x128/0x150
Call Trace:
[c00000000152bd70] [c00000000152bda0] init_stack+0x3da0/0x4000 (unreliable)
[c00000000152be10] [c000000001357c90] hugepagesz_setup+0x128/0x150
[c00000000152be80] [c00000000135841c] hugetlb_bootmem_alloc+0x84/0x104
[c00000000152bec0] [c00000000135143c] mm_core_init+0x30/0x174
[c00000000152bf30] [c000000001332ed4] start_kernel+0x540/0x880
[c00000000152bfe0] [c000000000000a50] start_here_common+0x1c/0x20
Code: 2c09000f 39000001 38e00000 39400001 7d00401e 0b080000 281d0001 
7d00505e 79080020 0b080000 281d000c 7d4a385e <0b0a0000> 1f5a00b8 
38bf0020 3c82ffe8
---[ end trace 0000000000000000 ]---
------------[ cut here ]------------
WARNING: CPU: 0 PID: 0 at mm/hugetlb.c:4744 hugetlb_add_hstate+0xc0/0x180
Modules linked in:
CPU: 0 UID: 0 PID: 0 Comm: swapper Tainted: G        W 
6.17.0-rc4-00275-g7b4f21f5e038 #1683 NONE
Tainted: [W]=WARN
Hardware name: QEMU ppce500 e5500 0x80240020 QEMU e500
NIP:  c000000001357408 LR: c000000001357c90 CTR: 0000000000000005
REGS: c00000000152bad0 TRAP: 0700   Tainted: G        W 
(6.17.0-rc4-00275-g7b4f21f5e038)
MSR:  0000000080021002 <CE,ME>  CR: 48000448  XER: 20000000
IRQMASK: 1
GPR00: c000000001357c90 c00000000152bd70 c000000001339000 000000000000000e
GPR04: 000000000000000a 0000000000001000 0000000040000000 0000000000000000
GPR08: 0000000000000000 0000000000000001 0000000000000001 0000000000000280
GPR12: c000000001357b68 c000000001590000 0000000000000000 0000000000000000
GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
GPR24: c0000000011adb40 c00000000156b5e0 0000000000000001 c00000000156b4b0
GPR28: c00000000156b528 000000000000000e 0000000004000000 00000000000000b8
NIP [c000000001357408] hugetlb_add_hstate+0xc0/0x180
LR [c000000001357c90] hugepagesz_setup+0x128/0x150
Call Trace:
[c00000000152bd70] [c000000000f27048] __func__.0+0x0/0x18 (unreliable)
[c00000000152be10] [c000000001357c90] hugepagesz_setup+0x128/0x150
[c00000000152be80] [c00000000135841c] hugetlb_bootmem_alloc+0x84/0x104
[c00000000152bec0] [c00000000135143c] mm_core_init+0x30/0x174
[c00000000152bf30] [c000000001332ed4] start_kernel+0x540/0x880
[c00000000152bfe0] [c000000000000a50] start_here_common+0x1c/0x20
Code: 2c09000f 39000001 38e00000 39400001 7d00401e 0b080000 281d0001 
7d00505e 79080020 0b080000 281d000c 7d4a385e <0b0a0000> 1f5a00b8 
38bf0020 3c82ffe8
---[ end trace 0000000000000000 ]---
------------[ cut here ]------------
WARNING: CPU: 0 PID: 0 at mm/hugetlb.c:4744 hugetlb_add_hstate+0xc0/0x180
Modules linked in:
CPU: 0 UID: 0 PID: 0 Comm: swapper Tainted: G        W 
6.17.0-rc4-00275-g7b4f21f5e038 #1683 NONE
Tainted: [W]=WARN
Hardware name: QEMU ppce500 e5500 0x80240020 QEMU e500
NIP:  c000000001357408 LR: c000000001357c90 CTR: 0000000000000004
REGS: c00000000152bad0 TRAP: 0700   Tainted: G        W 
(6.17.0-rc4-00275-g7b4f21f5e038)
MSR:  0000000080021002 <CE,ME>  CR: 48000448  XER: 20000000
IRQMASK: 1
GPR00: c000000001357c90 c00000000152bd70 c000000001339000 0000000000000010
GPR04: 000000000000000a 0000000000001000 0000000004000000 0000000000000000
GPR08: 0000000000000000 0000000000000002 0000000000000001 0000000000000a00
GPR12: c000000001357b68 c000000001590000 0000000000000000 0000000000000000
GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
GPR24: c0000000011adb40 c00000000156b698 0000000000000002 c00000000156b4b0
GPR28: c00000000156b528 0000000000000010 0000000010000000 0000000000000170
NIP [c000000001357408] hugetlb_add_hstate+0xc0/0x180
LR [c000000001357c90] hugepagesz_setup+0x128/0x150
Call Trace:
[c00000000152bd70] [c000000000f27048] __func__.0+0x0/0x18 (unreliable)
[c00000000152be10] [c000000001357c90] hugepagesz_setup+0x128/0x150
[c00000000152be80] [c00000000135841c] hugetlb_bootmem_alloc+0x84/0x104
[c00000000152bec0] [c00000000135143c] mm_core_init+0x30/0x174
[c00000000152bf30] [c000000001332ed4] start_kernel+0x540/0x880
[c00000000152bfe0] [c000000000000a50] start_here_common+0x1c/0x20
Code: 2c09000f 39000001 38e00000 39400001 7d00401e 0b080000 281d0001 
7d00505e 79080020 0b080000 281d000c 7d4a385e <0b0a0000> 1f5a00b8 
38bf0020 3c82ffe8
---[ end trace 0000000000000000 ]---


> ---
>   mm/hugetlb.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index 1e777cc51ad04..d3542e92a712e 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -4657,6 +4657,7 @@ static int __init hugetlb_init(void)
>   
>   	BUILD_BUG_ON(sizeof_field(struct page, private) * BITS_PER_BYTE <
>   			__NR_HPAGEFLAGS);
> +	BUILD_BUG_ON_INVALID(HUGETLB_PAGE_ORDER > MAX_FOLIO_ORDER);
>   
>   	if (!hugepages_supported()) {
>   		if (hugetlb_max_hstate || default_hstate_max_huge_pages)
> @@ -4740,6 +4741,7 @@ void __init hugetlb_add_hstate(unsigned int order)
>   	}
>   	BUG_ON(hugetlb_max_hstate >= HUGE_MAX_HSTATE);
>   	BUG_ON(order < order_base_2(__NR_USED_SUBPAGE));
> +	WARN_ON(order > MAX_FOLIO_ORDER);
>   	h = &hstates[hugetlb_max_hstate++];
>   	__mutex_init(&h->resize_lock, "resize mutex", &h->resize_key);
>   	h->order = order;


