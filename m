Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5057258D186
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Aug 2022 02:55:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M1vky0zXnz3c1n
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Aug 2022 10:55:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm2 header.b=CzGTGTgK;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=5L8V7bmU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=russell.cc (client-ip=64.147.123.21; helo=wout5-smtp.messagingengine.com; envelope-from=ruscur@russell.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm2 header.b=CzGTGTgK;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=5L8V7bmU;
	dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M1vkG4ZvWz2xGv
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Aug 2022 10:55:18 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id 04EED320091E;
	Mon,  8 Aug 2022 20:55:15 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Mon, 08 Aug 2022 20:55:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1660006515; x=
	1660092915; bh=6xntsoaAiy5Smvdj0weA8UbmtSnD0dZE3iKSdHF1N4E=; b=C
	zGTGTgKLC97pe8QZWEdtgaoYG14VzcA0ed6KrVtZxxVarLesCLFBzX2V4FlHY8Bm
	q0qbuKCd+Kl6XBBqyFZ3HfHTO+6L4pZF4xVOVFtN4qQ8UC1NjKkJxG/AmMBo1LPG
	YOYyOMJhco/b3NYY+M/zRY9kG8mF6K6WBX2Q7s61qXKEZS+H0JLOEUjFl5wLGDxk
	CLBL4VICQ50ZDRbX8OR/1fH5Fq4wPpq+H9E6YmX3P0e8e0V0SfFnnoLF1xwUIuqa
	kOINSwAh7IW6bVRQX5GmI0AvPt3UqQoK/+CMSFHXAMA60QGGpVoQxv5oUehg+cBK
	xnXktVwerA+usLb/v84jA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1660006515; x=
	1660092915; bh=6xntsoaAiy5Smvdj0weA8UbmtSnD0dZE3iKSdHF1N4E=; b=5
	L8V7bmUoUASpiSNLahv1mVsT3FGOROxoQ//czkzYH9t1gjwZed7wru8gsLtrIOxY
	CMZCnt/zTNSLG5xuQfFNJ9BN8DRXXUdR3s6KTNGn4qqq3zAaqOW7kTONgWqpJZnF
	vj6lvtjMbivb7LqUpYAUzalyKmXRjLIzKleuHm+5eQa9BUbgFlDM1nDLHst20vUX
	8EwOKiTqTeZRIxHy7qYPVKqXU3ERvxq4jRnJJ3LZ8rVjhDkGNy9OcL4RD1XvOcNT
	huz/iJHlN50tNwNlNGwvgbNDqLVMqBE6Elit8gI7SEAOvn7NKThkDO3BWDikdaUF
	ZzmDFHUnblUZLJtwY8lMA==
X-ME-Sender: <xms:c7DxYuh9lZyGiWrIaWw60EEeKZBWo9idJluRno1zh0lAh41Rzb-iag>
    <xme:c7DxYvAnm4QOqocaSKA4ZVjLEIbOEutetUz1KDca3t-zfVTGlRp2c5azU97rxL_jN
    wkzpzZtCU492JCUXg>
X-ME-Received: <xmr:c7DxYmH5kcQqPtsmn0-Jk73Ng2AuBae7E3arMwskbM6Us_gxIHgV3zynfsooA4859E3GJZDLb2Gbj3jT6C8MU3V2OBtCRvBd42ewjP7itErw4g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdefledggeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdlfedtmdenucfjughrpefkuffhvfevffgjfhgtgfgfggesthhqredt
    tderjeenucfhrhhomheptfhushhsvghllhcuvehurhhrvgihuceorhhushgtuhhrsehruh
    hsshgvlhhlrdgttgeqnecuggftrfgrthhtvghrnheptefgieelhfeufeevvdekheeifeej
    gfefgeehtedukeeigfduuddtueekteevleelnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomheprhhushgtuhhrsehruhhsshgvlhhlrdgttg
X-ME-Proxy: <xmx:c7DxYnTAgyD4vUjr6sQIE88JYsVdIvswRDsUA5oUF3uzS8o5_Z1Ixg>
    <xmx:c7DxYrztNHbbWlVUza8xMmDAQiQTXOeXmDJoK2981TA0uTPyEl0_-w>
    <xmx:c7DxYl69VpQbspLaAuIZok870jCTGxp1mnFYRb9Mep354aXNmgizdw>
    <xmx:c7DxYtv6yddSz-s8-jqWdCpjRb9ErD59ZyG8kQrgxZ6UXTWfe50WQA>
Feedback-ID: i4421424f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 8 Aug 2022 20:55:13 -0400 (EDT)
Message-ID: <4dcd228ceb2693c6159465fa6dbccf9d0682b19c.camel@russell.cc>
Subject: Re: [PATCH v2 1/2] powerpc/mm: Move vm_get_page_prot() out of
 book3s64 code
From: Russell Currey <ruscur@russell.cc>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, 
	"linuxppc-dev@lists.ozlabs.org"
	 <linuxppc-dev@lists.ozlabs.org>
Date: Tue, 09 Aug 2022 10:55:10 +1000
In-Reply-To: <95e380d0-f681-4c6f-d70b-2b5fdf911fa8@csgroup.eu>
References: <20220808130109.30738-1-ruscur@russell.cc>
	 <95e380d0-f681-4c6f-d70b-2b5fdf911fa8@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.3 (3.44.3-1.fc36) 
MIME-Version: 1.0
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
Cc: "aneesh.kumar@linux.ibm.com" <aneesh.kumar@linux.ibm.com>, "ajd@linux.ibm.com" <ajd@linux.ibm.com>, "npiggin@gmail.com" <npiggin@gmail.com>, "anshuman.khandual@arm.com" <anshuman.khandual@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2022-08-08 at 14:32 +0000, Christophe Leroy wrote:
>=20
>=20
> Le 08/08/2022 =C3=A0 15:01, Russell Currey a =C3=A9crit=C2=A0:
> > protection_map is about to be __ro_after_init instead of const, so
> > move
> > the only non-local function that consumes it to the same file so it
> > can
> > at least be static.
>=20
> What's the advantage of doing that ? Why does it need to be static=C2=A0 =
?
>=20
> Christophe

It doesn't need to be, I didn't like having it exposed unnecessarily.=20
Aneesh's suggestion lets it stay const so I can drop this patch anyway.

- Russell

>=20
> >=20
> > Signed-off-by: Russell Currey <ruscur@russell.cc>
> > ---
> > v2: new
> >=20
> > =C2=A0 arch/powerpc/mm/book3s64/pgtable.c | 16 ----------------
> > =C2=A0 arch/powerpc/mm/pgtable.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 21 +++++++++++++++++++--
> > =C2=A0 2 files changed, 19 insertions(+), 18 deletions(-)
> >=20
> > diff --git a/arch/powerpc/mm/book3s64/pgtable.c
> > b/arch/powerpc/mm/book3s64/pgtable.c
> > index 7b9966402b25..e2a4ea5eb960 100644
> > --- a/arch/powerpc/mm/book3s64/pgtable.c
> > +++ b/arch/powerpc/mm/book3s64/pgtable.c
> > @@ -550,19 +550,3 @@ unsigned long memremap_compat_align(void)
> > =C2=A0 }
> > =C2=A0 EXPORT_SYMBOL_GPL(memremap_compat_align);
> > =C2=A0 #endif
> > -
> > -pgprot_t vm_get_page_prot(unsigned long vm_flags)
> > -{
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unsigned long prot =3D pgpro=
t_val(protection_map[vm_flags &
> > -
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0(VM_READ|VM_WRITE|VM_EXEC|VM_
> > SHARED)]);
> > -
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (vm_flags & VM_SAO)
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0prot |=3D _PAGE_SAO;
> > -
> > -#ifdef CONFIG_PPC_MEM_KEYS
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0prot |=3D vmflag_to_pte_pkey=
_bits(vm_flags);
> > -#endif
> > -
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return __pgprot(prot);
> > -}
> > -EXPORT_SYMBOL(vm_get_page_prot);
> > diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
> > index cb2dcdb18f8e..0b2bbde5fb65 100644
> > --- a/arch/powerpc/mm/pgtable.c
> > +++ b/arch/powerpc/mm/pgtable.c
> > @@ -27,6 +27,7 @@
> > =C2=A0 #include <asm/tlb.h>
> > =C2=A0 #include <asm/hugetlb.h>
> > =C2=A0 #include <asm/pte-walk.h>
> > +#include <asm/pkeys.h>
> > =C2=A0=20
> > =C2=A0 #ifdef CONFIG_PPC64
> > =C2=A0 #define PGD_ALIGN (sizeof(pgd_t) * MAX_PTRS_PER_PGD)
> > @@ -493,6 +494,22 @@ const pgprot_t protection_map[16] =3D {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0[VM_SHARED | VM_EXEC | =
VM_WRITE | VM_READ]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=3D
> > PAGE_SHARED_X
> > =C2=A0 };
> > =C2=A0=20
> > -#ifndef CONFIG_PPC_BOOK3S_64
> > -DECLARE_VM_GET_PAGE_PROT
> > +#ifdef CONFIG_PPC_BOOK3S_64
> > +pgprot_t vm_get_page_prot(unsigned long vm_flags)
> > +{
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unsigned long prot =3D pgpro=
t_val(protection_map[vm_flags &
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0(VM_READ|VM_WRITE|VM_EXEC|V
> > M_SHARED)]);
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (vm_flags & VM_SAO)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0prot |=3D _PAGE_SAO;
> > +
> > +#ifdef CONFIG_PPC_MEM_KEYS
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0prot |=3D vmflag_to_pte_pkey=
_bits(vm_flags);
> > =C2=A0 #endif
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return __pgprot(prot);
> > +}
> > +EXPORT_SYMBOL(vm_get_page_prot);
> > +#else
> > +DECLARE_VM_GET_PAGE_PROT
> > +#endif /* CONFIG_PPC_BOOK3S_64 */

