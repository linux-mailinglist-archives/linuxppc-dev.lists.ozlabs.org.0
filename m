Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2253E58D18D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Aug 2022 02:56:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M1vlh0GjCz3bqY
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Aug 2022 10:56:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm2 header.b=Lb+GxQC9;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=ba2Xizge;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=russell.cc (client-ip=64.147.123.21; helo=wout5-smtp.messagingengine.com; envelope-from=ruscur@russell.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm2 header.b=Lb+GxQC9;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=ba2Xizge;
	dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M1vkv1qCyz3blT
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Aug 2022 10:55:51 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id D2429320077A;
	Mon,  8 Aug 2022 20:55:48 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Mon, 08 Aug 2022 20:55:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1660006548; x=
	1660092948; bh=tbncLDCccotlYNwGe5SNuhD2bqhUcmPTX32vtzbXlsc=; b=L
	b+GxQC9y5xeSSqfoqRGb5+MyIWoesWnhTR5uHJm6xVPrlCJ0c6plMkrWXhyfyd7p
	tI+uNsS5ggOszFL8LV0tRSRdwasUWGbrmWqWm2cjisQOVS2ehjS3VBVQ+4WqP73a
	iZ+G54gi1Whlx57tU/7kTDFp41LTbUUlYkor6Nghs1PW7I9Z4rtxOM1o102pF24w
	I7/mUU5SYXyMbkMNhfkvVZQgxgZEd7tR9EqLuQUbMhVgZY/q8RBi1cbDLih146K3
	kN4rITEoFe2h/K1Cq2IdCAxxDpOv9LFl1Y45j8IJSag66HY1JgVTPmFHP0QuiizO
	KYiBma2ywBeO7n0xHVxpQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1660006548; x=
	1660092948; bh=tbncLDCccotlYNwGe5SNuhD2bqhUcmPTX32vtzbXlsc=; b=b
	a2XizgeP9ZTevTskmwurkPtkb2OLvgdWhGFsaiMGVxEKPVYpUVDeiM1KdjfasL8X
	j3qlsgCHwmVJdcaTGSciWNVPin/B9MN9mmWf76vWfSat26U9Ty71JePKRVIZgA+r
	OJB0WOTf+G4EYBoNEU17jR+rGzl3Z37aC6RH1bK6D40YQKHZZG+wwa6velb8n/Bp
	jwLrGwf5/B+hYorD9gCNi/VvUycVJY7ZhEG0fcYwkXsFo84zE8Un8slTqi27z8aD
	+gyQ9LczTUr/MY2eucSlT+ZtzcwjhM1eplgQCU8OWiT62XCGPSGmeWKkKwOc42vM
	wCwPTyzMOQIdLawTLEKog==
X-ME-Sender: <xms:k7DxYnC01mf79eYWEZAMqwnzBD4MchmNV49lA5bH-HRh8I9fi-EibQ>
    <xme:k7DxYtiPvdseHJ439DI9B-Fe4NjjjuaX3Fj2bnytxPp2ElviW6EmPkBaEwSBYfQMJ
    Mjb0gQEpSsVkz3sKg>
X-ME-Received: <xmr:k7DxYimncsHx5CxrXmbySycyuP7KVm9ZbZtaoKw2kAk4gBP_KPbiuteduh9Teez7ixIJ601FIywioO2yA58SyM2a3z-6jWpkkUlbk65CiIizMA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdefledggedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdludehmdenucfjughrpefkuffhvfevffgjfhgtgfgfggesthhqredt
    tderjeenucfhrhhomheptfhushhsvghllhcuvehurhhrvgihuceorhhushgtuhhrsehruh
    hsshgvlhhlrdgttgeqnecuggftrfgrthhtvghrnhepieelteelhfeiheektdeuteeuueeh
    udeitdefveejgfdvkeelvdefieejtdegfeehnecuffhomhgrihhnpehgihhthhhusghush
    gvrhgtohhnthgvnhhtrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
    pehmrghilhhfrhhomheprhhushgtuhhrsehruhhsshgvlhhlrdgttg
X-ME-Proxy: <xmx:k7DxYpxur0xuQvAODXnjqB1ySWV20gUyF0d3375R_jJhd4cIE4Ugvw>
    <xmx:k7DxYsQEJsCUlPLrfwIgnJUNsfbiRPkmGGi0riW6vEBzSbWUFgnbJg>
    <xmx:k7DxYsa7DtbY5OkqYEEtstg7ZnrAhxYw8u9z_ATfnhqD9hoRDji-Hg>
    <xmx:lLDxYieUzMFWMe3NHUOr6d9VluxLpDQ2mOQVGuh7QcJTLhwSl86xoQ>
Feedback-ID: i4421424f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 8 Aug 2022 20:55:45 -0400 (EDT)
Message-ID: <faca43c31743a45df143fdb32b4cf37c65b08ffe.camel@russell.cc>
Subject: Re: [PATCH] powerpc/mm: Support execute-only memory on the Radix MMU
From: Russell Currey <ruscur@russell.cc>
To: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>, 
	linuxppc-dev@lists.ozlabs.org
Date: Tue, 09 Aug 2022 10:55:44 +1000
In-Reply-To: <503c1fca-8a6a-d11f-1b9f-d6987fdee59d@linux.ibm.com>
References: <20220808115828.20113-1-ruscur@russell.cc>
	 <503c1fca-8a6a-d11f-1b9f-d6987fdee59d@linux.ibm.com>
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
Cc: ajd@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2022-08-08 at 18:28 +0530, Aneesh Kumar K V wrote:
> On 8/8/22 5:28 PM, Russell Currey wrote:
> > The Hash MMU already supports XOM (i.e. mmap with PROT_EXEC only)
> > through the execute-only pkey.=C2=A0 A PROT_ONLY mapping will actually
> > map to
> > RX, and then the pkey will be applied on top of it.
> >=20
> > Radix doesn't have pkeys, but it does have execute permissions
> > built-in
> > to the MMU, so all we have to do to support XOM is expose it.
> >=20
> > Signed-off-by: Russell Currey <ruscur@russell.cc>
> > ---
> > quick test:
> > https://raw.githubusercontent.com/ruscur/junkcode/main/mmap_test.c
> > I can make it a selftest.
> >=20
> > =C2=A0arch/powerpc/include/asm/book3s/64/radix.h |=C2=A0 3 +++
> > =C2=A0arch/powerpc/mm/book3s64/radix_pgtable.c=C2=A0=C2=A0 |=C2=A0 4 ++=
++
> > =C2=A0arch/powerpc/mm/fault.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | =
10 ++++++++++
> > =C2=A03 files changed, 17 insertions(+)
> >=20
> > diff --git a/arch/powerpc/include/asm/book3s/64/radix.h
> > b/arch/powerpc/include/asm/book3s/64/radix.h
> > index 686001eda936..bf316b773d73 100644
> > --- a/arch/powerpc/include/asm/book3s/64/radix.h
> > +++ b/arch/powerpc/include/asm/book3s/64/radix.h
> > @@ -19,6 +19,9 @@
> > =C2=A0#include <asm/cpu_has_feature.h>
> > =C2=A0#endif
> > =C2=A0
> > +/* Execute-only page protections, Hash can use RX + execute-only
> > pkey */
> > +#define PAGE_EXECONLY=C2=A0=C2=A0__pgprot(_PAGE_BASE | _PAGE_EXEC)
> > +
> > =C2=A0/* An empty PTE can still have a R or C writeback */
> > =C2=A0#define RADIX_PTE_NONE_MASK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(_PAGE_DIRTY |
> > _PAGE_ACCESSED)
> > =C2=A0
> > diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c
> > b/arch/powerpc/mm/book3s64/radix_pgtable.c
> > index 698274109c91..2edb56169805 100644
> > --- a/arch/powerpc/mm/book3s64/radix_pgtable.c
> > +++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
> > @@ -617,6 +617,10 @@ void __init radix__early_init_mmu(void)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0__pmd_frag_nr =3D RADIX=
_PMD_FRAG_NR;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0__pmd_frag_size_shift =
=3D RADIX_PMD_FRAG_SIZE_SHIFT;
> > =C2=A0
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Radix directly supports e=
xecute-only page protections */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0protection_map[VM_EXEC] =3D =
PAGE_EXECONLY;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0protection_map[VM_EXEC | VM_=
SHARED] =3D PAGE_EXECONLY;
> > +
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0radix_init_pgtable();
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!firmware_has_featu=
re(FW_FEATURE_LPAR)) {
> > diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
> > index 014005428687..887c0cc45ca6 100644
> > --- a/arch/powerpc/mm/fault.c
> > +++ b/arch/powerpc/mm/fault.c
> > @@ -270,6 +270,16 @@ static bool access_error(bool is_write, bool
> > is_exec, struct vm_area_struct *vma
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0return false;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> > =C2=A0
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (unlikely(!(vma->vm_flags=
 & VM_READ))) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0/*
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 * If we're on Radix, then this could be a read
> > attempt on
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 * execute-only memory.=C2=A0 On other MMUs, an "exec-
> > only" page
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 * will be given RX flags, so this might be
> > redundant.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0if (radix_enabled())
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return=
 true;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> > +
>=20
>=20
> should we do=20
>=20
> /* This cover both PROT_NONE (due to check above) and exec only
> mapping */
> if (radix_enabled() && !(vma->vm_flags & VM_READ)) {
> =C2=A0=C2=A0=C2=A0 return true;
> /* PROT_NONE check */
> else if (!vma_is_accessible(vma))=20
> =C2=A0=C2=A0 return true;
>=20
> return false;

That is better, thanks.

- Russell

>=20
>=20
>=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (unlikely(!vma_is_ac=
cessible(vma)))
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0return true;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/*
>=20
> -aneesh

