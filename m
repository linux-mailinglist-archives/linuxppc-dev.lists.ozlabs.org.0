Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C530B11812
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 May 2019 13:16:36 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44vt4f1ZF8zDqNK
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 May 2019 21:16:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44vt2m66HtzDqD1
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 May 2019 21:14:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 44vt2m2kCrz9s7T;
 Thu,  2 May 2019 21:14:56 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH v1 2/4] powerpc/mm: Move book3s64 specifics in
 subdirectory mm/book3s64
In-Reply-To: <7dbe8476-bfa3-29ac-5155-a67823d39ef4@c-s.fr>
References: <cover.1553853405.git.christophe.leroy@c-s.fr>
 <c4afde657ef9e4ad0266ae62e9907313c41c4a16.1553853405.git.christophe.leroy@c-s.fr>
 <87sgtx5o0j.fsf@concordia.ellerman.id.au>
 <7dbe8476-bfa3-29ac-5155-a67823d39ef4@c-s.fr>
Date: Thu, 02 May 2019 21:14:55 +1000
Message-ID: <87woj9xg40.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@c-s.fr> writes:
> Le 02/05/2019 =C3=A0 09:11, Michael Ellerman a =C3=A9crit=C2=A0:
>> Christophe Leroy <christophe.leroy@c-s.fr> writes:
>>=20
>>> Many files in arch/powerpc/mm are only for book3S64. This patch
>>> creates a subdirectory for them.
>>>
>>> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
>>> ---
>>>   arch/powerpc/mm/Makefile                           | 25 +++----------=
------
>>>   arch/powerpc/mm/book3s64/Makefile                  | 28 +++++++++++++=
+++++++++
>>>   arch/powerpc/mm/{ =3D> book3s64}/hash64_4k.c         |  0
>>>   arch/powerpc/mm/{ =3D> book3s64}/hash64_64k.c        |  0
>>>   arch/powerpc/mm/{ =3D> book3s64}/hash_native_64.c    |  0
>>>   arch/powerpc/mm/{ =3D> book3s64}/hash_utils_64.c     |  0
>>>   arch/powerpc/mm/{ =3D> book3s64}/hugepage-hash64.c   |  0
>>>   .../powerpc/mm/{ =3D> book3s64}/hugetlbpage-hash64.c |  0
>>>   arch/powerpc/mm/{ =3D> book3s64}/hugetlbpage-radix.c |  0
>>>   .../mm/{ =3D> book3s64}/mmu_context_book3s64.c       |  0
>>>   arch/powerpc/mm/{ =3D> book3s64}/mmu_context_iommu.c |  0
>>>   arch/powerpc/mm/{ =3D> book3s64}/pgtable-book3s64.c  |  0
>>>   arch/powerpc/mm/{ =3D> book3s64}/pgtable-hash64.c    |  0
>>>   arch/powerpc/mm/{ =3D> book3s64}/pgtable-radix.c     |  0
>>>   arch/powerpc/mm/{ =3D> book3s64}/pkeys.c             |  0
>>>   arch/powerpc/mm/{ =3D> book3s64}/slb.c               |  0
>>>   arch/powerpc/mm/{ =3D> book3s64}/subpage-prot.c      |  0
>>>   arch/powerpc/mm/{ =3D> book3s64}/tlb-radix.c         |  0
>>>   arch/powerpc/mm/{ =3D> book3s64}/tlb_hash64.c        |  0
>>>   arch/powerpc/mm/{ =3D> book3s64}/vphn.c              |  0
>>>   arch/powerpc/mm/{ =3D> book3s64}/vphn.h              |  0
>>>   arch/powerpc/mm/numa.c                             |  2 +-
>>>   22 files changed, 32 insertions(+), 23 deletions(-)
>>>   create mode 100644 arch/powerpc/mm/book3s64/Makefile
>>>   rename arch/powerpc/mm/{ =3D> book3s64}/hash64_4k.c (100%)
>>>   rename arch/powerpc/mm/{ =3D> book3s64}/hash64_64k.c (100%)
>>>   rename arch/powerpc/mm/{ =3D> book3s64}/hash_native_64.c (100%)
>>>   rename arch/powerpc/mm/{ =3D> book3s64}/hash_utils_64.c (100%)
>>>   rename arch/powerpc/mm/{ =3D> book3s64}/hugepage-hash64.c (100%)
>>>   rename arch/powerpc/mm/{ =3D> book3s64}/hugetlbpage-hash64.c (100%)
>>>   rename arch/powerpc/mm/{ =3D> book3s64}/hugetlbpage-radix.c (100%)
>>>   rename arch/powerpc/mm/{ =3D> book3s64}/mmu_context_book3s64.c (100%)
>>>   rename arch/powerpc/mm/{ =3D> book3s64}/mmu_context_iommu.c (100%)
>>>   rename arch/powerpc/mm/{ =3D> book3s64}/pgtable-book3s64.c (100%)
>>>   rename arch/powerpc/mm/{ =3D> book3s64}/pgtable-hash64.c (100%)
>>>   rename arch/powerpc/mm/{ =3D> book3s64}/pgtable-radix.c (100%)
>>>   rename arch/powerpc/mm/{ =3D> book3s64}/pkeys.c (100%)
>>>   rename arch/powerpc/mm/{ =3D> book3s64}/slb.c (100%)
>>>   rename arch/powerpc/mm/{ =3D> book3s64}/subpage-prot.c (100%)
>>>   rename arch/powerpc/mm/{ =3D> book3s64}/tlb-radix.c (100%)
>>>   rename arch/powerpc/mm/{ =3D> book3s64}/tlb_hash64.c (100%)
>>=20
>> Do you mind if I take this but rework the destination names in the proce=
ss?
>
> I don't mind, I think it's a good idea.
>
>>=20
>> I don't like having eg. book3s64/pgtable-book3s64.c
>>=20
>> And some of the other names could use a bit of cleanup too.
>>=20
>> What about:
>>=20
>>   arch/powerpc/mm/{hash64_4k.c =3D> book3s64/hash_4k.c}
>>   arch/powerpc/mm/{hash64_64k.c =3D> book3s64/hash_64k.c}
>>   arch/powerpc/mm/{hugepage-hash64.c =3D> book3s64/hash_hugepage.c}
>>   arch/powerpc/mm/{hugetlbpage-hash64.c =3D> book3s64/hash_hugetlbpage.c}
>>   arch/powerpc/mm/{hash_native_64.c =3D> book3s64/hash_native.c}
>>   arch/powerpc/mm/{pgtable-hash64.c =3D> book3s64/hash_pgtable.c}
>>   arch/powerpc/mm/{tlb_hash64.c =3D> book3s64/hash_tlb.c}
>>   arch/powerpc/mm/{hash_utils_64.c =3D> book3s64/hash_utils.c}
>>   arch/powerpc/mm/{mmu_context_iommu.c =3D> book3s64/iommu_api.c}
>>   arch/powerpc/mm/{mmu_context_book3s64.c =3D> book3s64/mmu_context.c}
>>   arch/powerpc/mm/{pgtable-book3s64.c =3D> book3s64/pgtable.c}
>>   arch/powerpc/mm/{hugetlbpage-radix.c =3D> book3s64/radix_hugetlbpage.c}
>>   arch/powerpc/mm/{pgtable-radix.c =3D> book3s64/radix_pgtable.c}
>>   arch/powerpc/mm/{tlb-radix.c =3D> book3s64/radix_tlb.c}
>
> Looks good

Thanks. I'll do something similar for 32-bit & nohash.

cheers
