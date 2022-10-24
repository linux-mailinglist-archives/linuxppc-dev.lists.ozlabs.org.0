Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F2A6098E5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Oct 2022 05:31:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MwgZt3yBzz3cBc
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Oct 2022 14:31:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm1 header.b=8FfUxYGV;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=hVy1eFOw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=russell.cc (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com; envelope-from=ruscur@russell.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm1 header.b=8FfUxYGV;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=hVy1eFOw;
	dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MwgYy1sFPz2xjr
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Oct 2022 14:30:14 +1100 (AEDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 396B95C00DB;
	Sun, 23 Oct 2022 23:30:12 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Sun, 23 Oct 2022 23:30:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1666582212; x=
	1666668612; bh=wUyUo3ivr0Z69paIJPRzOJLAJoCE3FkjJH4q6xBTylM=; b=8
	FfUxYGVkbGvaJ9V1b44Fw9rj8saPd5NXCH5AEKwIyC096ezrsvm3J4qVS/D+ft4i
	zzBoCgX8xKVinqTgW9A9LB67YD5KH7ixsW+liiEK+5v7B3nsJbdUTDhh9CAdr9sz
	7xl6dzFAoXmA6lfYNKBJ1Ktnpq8BcWNhGt9iyvbhOue9VIpliZrfyUlil9QuLS2E
	FEuEPlec+g1RkELrxkXW1ODzlPvE47u+ADx6ii8/lrswRlvegrCcZwPMc5pnnXSI
	7jPR2YaYiIvsND/wMdcrd232SlY9SpsbCE8KprsC8nRuP7eyauv3ny/B9monqea8
	FGkLwuzW/kfNxWYy9rN6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1666582212; x=
	1666668612; bh=wUyUo3ivr0Z69paIJPRzOJLAJoCE3FkjJH4q6xBTylM=; b=h
	Vy1eFOw0ep006BFMbBQ7z904eNlkQ9dhPBZNusQSrTHMvUUgRW8E6C3RT+lUJQ29
	ldgkunPb6b2evfVpmCCp+836N54hXf+RK8jgApUXmTNSHHwd0ya4fB1gHde3Bw9v
	GLhD/eux10zpdBPT9bLa4OxKv1I8TWZOvLw2HgMLr2awlAZDnrTLEn12yuDRMco/
	EHa649RTs16P6kC5P/NbZCsjH3y775BG2lwcsqO5SKxuGhSBFmbwOCvJRu5TMq2+
	OhbuzMdP9SRnKCb10nCmClZaLAgyLAgzYg0Q3mB3QhsOp884KlOsRtJ+faFouKEp
	oQp6QocIsyN+BL2OfCI6w==
X-ME-Sender: <xms:xAZWYyMZB4uQzHCjzkkc4UINPCnXEt_AGbXDPXfPXwGBTy1GJ0z_3g>
    <xme:xAZWYw9C1WAOWllgyzzqrIVYlEFWr5WgO2Gxy_PPYHSrAhK113DWDizejwVxzbZnB
    qeC4qmzoU0k9DQCzA>
X-ME-Received: <xmr:xAZWY5TyWrOCjvFhMaCC4OBBIN5mNXcoES86sUnaW0Spuqfqw0LqaRfAvgOLwEiobot3Ggn2lhdTJ8cnnZGLqEwQCU_v62TlCwtI0ZAnujl8qw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgedtfedgjedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdludehmdenucfjughrpefkuffhvfevffgjfhgtgfgfggesthhqredt
    tderjeenucfhrhhomheptfhushhsvghllhcuvehurhhrvgihuceorhhushgtuhhrsehruh
    hsshgvlhhlrdgttgeqnecuggftrfgrthhtvghrnheptefgieelhfeufeevvdekheeifeej
    gfefgeehtedukeeigfduuddtueekteevleelnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomheprhhushgtuhhrsehruhhsshgvlhhlrdgttg
X-ME-Proxy: <xmx:xAZWYyut_VCIXd2Yhw_e0Zr2UOJNYnPB3Al13Y9sUJleSMhQRYr4Eg>
    <xmx:xAZWY6chf4-X7lzvrHgm5SRewVgik7FhUk5WMQuM4ky45f1pxf-ypg>
    <xmx:xAZWY236N6oFjxdUucXmSEMA_c2MGv9OtyyoHbU_VYNhbVin5jG7Fg>
    <xmx:xAZWY3GGQODMz9BG0PV85Y8QbpvqWCOCQ2dgXCPE4CCeYvY1kRjLoQ>
Feedback-ID: i4421424f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 23 Oct 2022 23:30:09 -0400 (EDT)
Message-ID: <491120551489673b614d2f058ea580dc9a1534f0.camel@russell.cc>
Subject: Re: [PATCH v8 4/6] powerpc/tlb: Add local flush for page given
 mm_struct and psize
From: Russell Currey <ruscur@russell.cc>
To: Benjamin Gray <bgray@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Date: Mon, 24 Oct 2022 14:30:07 +1100
In-Reply-To: <20221021052238.580986-5-bgray@linux.ibm.com>
References: <20221021052238.580986-1-bgray@linux.ibm.com>
	 <20221021052238.580986-5-bgray@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
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
Cc: jniethe5@gmail.com, cmr@bluescreens.de, npiggin@gmail.com, ajd@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2022-10-21 at 16:22 +1100, Benjamin Gray wrote:
> Adds a local TLB flush operation that works given an mm_struct, VA to
> flush, and page size representation.
>=20
> This removes the need to create a vm_area_struct, which the temporary
> patching mm work does not need.
>=20
> Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
> ---
> =C2=A0arch/powerpc/include/asm/book3s/32/tlbflush.h=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 9 +++++++++
> =C2=A0arch/powerpc/include/asm/book3s/64/tlbflush-hash.h | 5 +++++
> =C2=A0arch/powerpc/include/asm/book3s/64/tlbflush.h=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 8 ++++++++
> =C2=A0arch/powerpc/include/asm/nohash/tlbflush.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +
> =C2=A04 files changed, 23 insertions(+)
>=20
> diff --git a/arch/powerpc/include/asm/book3s/32/tlbflush.h
> b/arch/powerpc/include/asm/book3s/32/tlbflush.h
> index ba1743c52b56..e5a688cebf69 100644
> --- a/arch/powerpc/include/asm/book3s/32/tlbflush.h
> +++ b/arch/powerpc/include/asm/book3s/32/tlbflush.h
> @@ -2,6 +2,8 @@
> =C2=A0#ifndef _ASM_POWERPC_BOOK3S_32_TLBFLUSH_H
> =C2=A0#define _ASM_POWERPC_BOOK3S_32_TLBFLUSH_H
> =C2=A0
> +#include <linux/build_bug.h>
> +
> =C2=A0#define MMU_NO_CONTEXT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (0)
> =C2=A0/*
> =C2=A0 * TLB flushing for "classic" hash-MMU 32-bit CPUs, 6xx, 7xx, 7xxx
> @@ -74,6 +76,13 @@ static inline void local_flush_tlb_page(struct
> vm_area_struct *vma,
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0flush_tlb_page(vma, vmadd=
r);
> =C2=A0}
> +
> +static inline void local_flush_tlb_page_psize(struct mm_struct *mm,
> unsigned long vmaddr, int psize)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0BUILD_BUG_ON(psize !=3D MMU_PA=
GE_4K);

Is there any utility in adding this for 32bit if the following patches
are only for Radix?

> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0flush_range(mm, vmaddr, vmaddr=
 + PAGE_SIZE);
> +}
> +
> =C2=A0static inline void local_flush_tlb_mm(struct mm_struct *mm)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0flush_tlb_mm(mm);
> diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
> b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
> index fab8332fe1ad..8fd9dc49b2a1 100644
> --- a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
> +++ b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
> @@ -94,6 +94,11 @@ static inline void
> hash__local_flush_tlb_page(struct vm_area_struct *vma,
> =C2=A0{
> =C2=A0}
> =C2=A0
> +static inline void hash__local_flush_tlb_page_psize(struct mm_struct
> *mm,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 unsigned long
> vmaddr, int psize)
> +{
> +}
> +
> =C2=A0static inline void hash__flush_tlb_page(struct vm_area_struct *vma,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned lo=
ng vmaddr)
> =C2=A0{
> diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush.h
> b/arch/powerpc/include/asm/book3s/64/tlbflush.h
> index 67655cd60545..2d839dd5c08c 100644
> --- a/arch/powerpc/include/asm/book3s/64/tlbflush.h
> +++ b/arch/powerpc/include/asm/book3s/64/tlbflush.h
> @@ -92,6 +92,14 @@ static inline void local_flush_tlb_page(struct
> vm_area_struct *vma,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return hash__local_flush_=
tlb_page(vma, vmaddr);
> =C2=A0}
> =C2=A0
> +static inline void local_flush_tlb_page_psize(struct mm_struct *mm,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long vmaddr,
> int psize)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (radix_enabled())
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0return radix__local_flush_tlb_page_psize(mm, vmaddr,
> psize);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return hash__local_flush_tlb_p=
age_psize(mm, vmaddr, psize);
> +}
> +
> =C2=A0static inline void local_flush_all_mm(struct mm_struct *mm)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (radix_enabled())
> diff --git a/arch/powerpc/include/asm/nohash/tlbflush.h
> b/arch/powerpc/include/asm/nohash/tlbflush.h
> index bdaf34ad41ea..59bce0ebdcf4 100644
> --- a/arch/powerpc/include/asm/nohash/tlbflush.h
> +++ b/arch/powerpc/include/asm/nohash/tlbflush.h
> @@ -58,6 +58,7 @@ static inline void flush_tlb_kernel_range(unsigned
> long start, unsigned long end
> =C2=A0extern void flush_tlb_kernel_range(unsigned long start, unsigned
> long end);
> =C2=A0extern void local_flush_tlb_mm(struct mm_struct *mm);
> =C2=A0extern void local_flush_tlb_page(struct vm_area_struct *vma,
> unsigned long vmaddr);
> +extern void local_flush_tlb_page_psize(struct mm_struct *mm,
> unsigned long vmaddr, int psize);
> =C2=A0
> =C2=A0extern void __local_flush_tlb_page(struct mm_struct *mm, unsigned
> long vmaddr,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int tsize, int in=
d);

