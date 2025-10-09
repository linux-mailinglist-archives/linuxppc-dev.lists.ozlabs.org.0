Return-Path: <linuxppc-dev+bounces-12734-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 24701BC7C67
	for <lists+linuxppc-dev@lfdr.de>; Thu, 09 Oct 2025 09:50:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cj29S5g5Wz3cDN;
	Thu,  9 Oct 2025 18:50:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759996236;
	cv=none; b=ceQwZmgHxndc7Nyj3j5319RCF7jAL649YmZ6QteQXF3/8/WU7JRWFtWdhZbb2L7zHbP3HXZlnNx/wYZPoedihMayBZgIR5prb7xbgFMTA3RwemZgVjBYw3///WjcPPxSEdIyjvZe5gfUxnyv3l6UO4AnWWTJz/KTgE/dMDN2oAJewx22o6GptemnavCmxgZKn2Gtw404w9uSpxC7JvC4li9ALlAO4VW253QC7yFbwYZnaa4TvGqPdCde4/+eiN644aBvSWI+PVP/3WGLBOXkkDrhMnDb8t9JIF7TfYHwpTrk4mheOXUPgDaLyrQFeqjsnG/WVHm1qDk8OSoOsVT1Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759996236; c=relaxed/relaxed;
	bh=s+XtmwdKc8QKMPTZ9xcrxbfmEnkdKPymPLn6kJMJIBg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rhlh9yaHW1cfZLjRP9l0QzQEBP8/vyvhh83TqkVCpzCUPljAhaktvWkH74CTTZcqhLCtP9SEOkt+tBzjKMvR7ZU+OXvN9Ae7uo0Em8JMK8hDxI5E3TKnEb6Epi5o3uOEtGnym1snV0KWZVe2dhEJekT7HY5Jxe4p7/eQAwZ9u/qsPkIHGmA4qz7BVpHl2bwa8r1xIcndaard6J2dKbMBM0o70MV2tkJzeuAil6cmgbaoMfjcHXZRBygHhflfPuTGITEEpVLhKT8w0PRnI1IVTNkAZEYQqZk6dNZ4l3lq6MyUMTH8NtZt9NdH1oa7hS8NrAhFGxgf6hQz+IIIm5oS5g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cj29S0T9Mz2xQ0
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Oct 2025 18:50:35 +1100 (AEDT)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cj22T4GVLz9sSy;
	Thu,  9 Oct 2025 09:44:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e-hrpkSiMM5A; Thu,  9 Oct 2025 09:44:33 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cj22T2bCVz9sSq;
	Thu,  9 Oct 2025 09:44:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 3E1858B768;
	Thu,  9 Oct 2025 09:44:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id iEsvyTlwygx4; Thu,  9 Oct 2025 09:44:33 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 4940A8B767;
	Thu,  9 Oct 2025 09:44:31 +0200 (CEST)
Message-ID: <1fb2259f-65e1-4cd0-ae70-b355843970e4@csgroup.eu>
Date: Thu, 9 Oct 2025 09:44:30 +0200
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
 <3e043453-3f27-48ad-b987-cc39f523060a@csgroup.eu>
 <d3fc12d4-0b59-4b1f-bb5c-13189a01e13d@redhat.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <d3fc12d4-0b59-4b1f-bb5c-13189a01e13d@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 09/10/2025 à 09:22, David Hildenbrand a écrit :
> On 09.10.25 09:14, Christophe Leroy wrote:
>> Hi David,
>>
>> Le 01/09/2025 à 17:03, David Hildenbrand a écrit :
>>> Let's check that no hstate that corresponds to an unreasonable folio 
>>> size
>>> is registered by an architecture. If we were to succeed registering, we
>>> could later try allocating an unsupported gigantic folio size.
>>>
>>> Further, let's add a BUILD_BUG_ON() for checking that HUGETLB_PAGE_ORDER
>>> is sane at build time. As HUGETLB_PAGE_ORDER is dynamic on powerpc, 
>>> we have
>>> to use a BUILD_BUG_ON_INVALID() to make it compile.
>>>
>>> No existing kernel configuration should be able to trigger this check:
>>> either SPARSEMEM without SPARSEMEM_VMEMMAP cannot be configured or
>>> gigantic folios will not exceed a memory section (the case on sparse).
>>>
>>> Reviewed-by: Zi Yan <ziy@nvidia.com>
>>> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>>> Reviewed-by: Liam R. Howlett <Liam.Howlett@oracle.com>
>>> Signed-off-by: David Hildenbrand <david@redhat.com>
>>
>> I get following warning on powerpc with linus tree, bisected to commit
>> 7b4f21f5e038 ("mm/hugetlb: check for unreasonable folio sizes when
>> registering hstate")
> 
> Do you have the kernel config around? Is it 32bit?
> 
> That would be helpful.

That's corenet64_smp_defconfig

Boot on QEMU with:

	qemu-system-ppc64 -smp 2 -nographic -M ppce500 -cpu e5500 -m 1G



Christophe

