Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB9B83A183
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jan 2024 06:46:02 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=O1skpl4y;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TKXxh1BZqz3cRq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jan 2024 16:46:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=O1skpl4y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=aneesh.kumar@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TKXww3Dt3z30hG
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jan 2024 16:45:20 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7A30E60FDB;
	Wed, 24 Jan 2024 05:45:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAA06C433F1;
	Wed, 24 Jan 2024 05:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706075117;
	bh=5dLOTB19eqgu6rIiWX9LXiC2Xe6lJz1n50JwsYBoJ6w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=O1skpl4y2xjw6BP+gzZ5mPe0LKyiUIrkGJSxeRvOjofb/gZvo6wl7nFZdgUFQ8p8g
	 mKeTO4ObwcUC2+OyxrBUFcF6ovICMunK8lCIQIgR+AqdvzCkI0GjG8X1Rp61fv1x0O
	 sXYkIvLLfqVyEudSZNXUQ7C6skbTv82wU+p9IkYysxMfhaPHouWfsN/hk5ltc2+h0S
	 XzFm2ohqjonzRS2gKeLXiMhGX5iu1V+ZgCwo5e1vYgDR7B50640MCgmUl3IJbLWDcS
	 qOgK2IzFJaPYHpWQn+N9JUVQLiSVJ/DJXQoM6urufjCoLD8pjAm5mcQutss0xfdEOG
	 C2zeUU0iz2qHw==
X-Mailer: emacs 29.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: David Hildenbrand <david@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 01/11] arm/pgtable: define PFN_PTE_SHIFT on arm and
 arm64
In-Reply-To: <794c1dc3-520c-4030-b0fe-e24782576347@redhat.com>
References: <20240122194200.381241-1-david@redhat.com>
 <20240122194200.381241-2-david@redhat.com>
 <fdaeb9a5-d890-499a-92c8-d171df43ad01@arm.com>
 <46080ac1-7789-499b-b7f3-0231d7bd6de7@redhat.com>
 <6703b648-10ab-4fea-b7f1-75421319465b@arm.com>
 <ae3d826f-758f-4738-b72a-e99f098bb2b3@csgroup.eu>
 <3a970289-a72f-418e-b43c-89f67f0d5283@redhat.com>
 <e0d9caab-39c7-446a-aeef-5d914d321c72@arm.com>
 <794c1dc3-520c-4030-b0fe-e24782576347@redhat.com>
Date: Wed, 24 Jan 2024 11:15:03 +0530
Message-ID: <8734unqo80.fsf@kernel.org>
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Dinh Nguyen <dinguyen@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, "linuxpp
 c-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

David Hildenbrand <david@redhat.com> writes:

> On 23.01.24 12:38, Ryan Roberts wrote:
>> On 23/01/2024 11:31, David Hildenbrand wrote:
>>>>>
>>>>>> If high bits are used for
>>>>>> something else, then we might produce a garbage PTE on overflow, but=
 that
>>>>>> shouldn't really matter I concluded for folio_pte_batch() purposes, =
we'd not
>>>>>> detect "belongs to this folio batch" either way.
>>>>>
>>>>> Exactly.
>>>>>
>>>>>>
>>>>>> Maybe it's likely cleaner to also have a custom pte_next_pfn() on pp=
c, I just
>>>>>> hope that we don't lose any other arbitrary PTE bits by doing the pt=
e_pgprot().
>>>>>
>>>>> I don't see the need for ppc to implement pte_next_pfn().
>>>>
>>>> Agreed.
>>>
>>> So likely we should then do on top for powerpc (whitespace damage):
>>>
>>> diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
>>> index a04ae4449a025..549a440ed7f65 100644
>>> --- a/arch/powerpc/mm/pgtable.c
>>> +++ b/arch/powerpc/mm/pgtable.c
>>> @@ -220,10 +220,7 @@ void set_ptes(struct mm_struct *mm, unsigned long =
addr,
>>> pte_t *ptep,
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 ptep++;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 addr +=3D PAGE_SIZE;
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 /*
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 * increment the pfn.
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 */
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 pte =3D pfn_pte(pte_pfn(pte) + 1, pte_pgprot((pte)));
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 pte =3D pte_next_pfn(pte);
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>  =C2=A0}
>>=20
>> Looks like commit 47b8def9358c ("powerpc/mm: Avoid calling
>> arch_enter/leave_lazy_mmu() in set_ptes") changed from doing the simple
>> increment to this more complex approach, but the log doesn't say why.
>
> @Aneesh, was that change on purpose?
>

Because we had a bug with the patch that introduced the change and that
line was confusing. The right thing should have been to add
pte_pfn_next() to make it clear. It was confusing because not all pte
format had pfn at PAGE_SHIFT offset (even though we did use the correct
PTE_RPN_SHIFT in this specific case). To make it simpler I ended up
switching that line to pte_pfn(pte) + 1 .

-aneesh
