Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D2160991C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Oct 2022 06:23:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mwhkr1qLPz3cBn
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Oct 2022 15:23:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm1 header.b=wOzDrish;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=uRVx3YqX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=russell.cc (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com; envelope-from=ruscur@russell.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm1 header.b=wOzDrish;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=uRVx3YqX;
	dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mwhjs4sK9z30MT
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Oct 2022 15:22:09 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 9D57F5C005A;
	Mon, 24 Oct 2022 00:22:07 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Mon, 24 Oct 2022 00:22:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1666585327; x=
	1666671727; bh=YbW0LaIu83zkXNGn4rNC9R0jw5RWaUnf5a3/L0B+5bg=; b=w
	OzDrishxO6+f+1r6b6C+YDP+pvCKkw17yiJKhF6cPfYvtTsLYthvQYd8heew5oc9
	6tAxtthq+nC3NgRjllJFmgSkL+vug7EnJO/yx+BIpyNVYlX/dEY2pGUSyNGMDHhg
	zB4dHC30RbeRDUpipG7wHQSRz+7KBsl8tiZe7Rfe0hqawmjHCrLmQPiTBB4OJFdt
	TKHY9IAFii9w2qIjwrHK1Yb11zLvjeoaF+T/Akie7jPM83Si1xTLVAVMHMda79QK
	w7x9p4Kd6WGuhWWQx08XOvnmTt9ij+GhHpVO2oRINsKmQy+EyPLJ0l/iNEdDOFsT
	DoQX6IG/hwX7r1bHBHWOQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1666585327; x=
	1666671727; bh=YbW0LaIu83zkXNGn4rNC9R0jw5RWaUnf5a3/L0B+5bg=; b=u
	RVx3YqXKj4ynlIDHvo15rxCt0Xta9hQLV4molVQJZhsjo4t7yGdEC5TPeY1mhcD5
	0cNuGmwjzxG6BY79CD93FCiDq54WujpYRpijNSg6xBaaQdU6lbh8QnW17/uZAZdL
	CbUGXrW1+rS7Du+Cx2AULJhUK57oe1/cTGePyy03NUFxdNgMd+s3lN+GJGG36rzu
	K7yZchX2nKfCcQ/H89saZe7o9UNBBGUDPDiH4CL/LpaGnAVIHIQ9Iaw8KWEOd9xQ
	aZ8opxWYFUTwsmFbpx03Y6RXJ8MbJeCh86IPir0sgze7CH4Ourycd8jvvXNftjeR
	lzSQaqDtVpTfbtZCSx9nA==
X-ME-Sender: <xms:7xJWY2syiOLWjEGO8yyZkDVp3gTgId0ULJrmJzwUCOrtd_wDoo2p3w>
    <xme:7xJWY7e1410QX_DI66xBHh-jWcUSCPkG0y_pgN4DtrrnF2Zl1hgaryiC3iK4s-Cd_
    huWE_FAuj-YhxO2iQ>
X-ME-Received: <xmr:7xJWYxwhS70HiQuAb7aLl9H8449aKhxX0_-PEW93DvXn-V648VwtKn04_p5xLXeCW0pX7anNMkQgBkK4QFkOz_OZVx47aOxHL01I227N6yw4sA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgedtfedgkeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdludehmdenucfjughrpefkuffhvfevffgjfhgtgfgfggesthhqredt
    tderjeenucfhrhhomheptfhushhsvghllhcuvehurhhrvgihuceorhhushgtuhhrsehruh
    hsshgvlhhlrdgttgeqnecuggftrfgrthhtvghrnhepkeeutdeiffegffefffffleekheff
    tdelueelhfeifefhvddtkeekvedtleekgeeunecuffhomhgrihhnpehgihhthhhusgdrtg
    homhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehr
    uhhstghurhesrhhushhsvghllhdrtggt
X-ME-Proxy: <xmx:7xJWYxOtbyuBOqaWHeprUOgDRqFJ7N4jTK1Nxjmzbj6ETOaDJYek6g>
    <xmx:7xJWY2-H0xdtTR86VRNZya5XHMTdDgA_pCrP2_o-hfRjfgdEgsEQXw>
    <xmx:7xJWY5UA-c0lXiUAI4J5fs6YfV7D1W60xrLh20hrQ0SzVObrq5hxmA>
    <xmx:7xJWY9kBvwpwzVUv_RcP2n5-SmcNDsRyJz5JqLojuizCm0oci3mTrg>
Feedback-ID: i4421424f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 24 Oct 2022 00:22:05 -0400 (EDT)
Message-ID: <1d076a44ba1b01c8e8c1fd5be11e22f35291cc13.camel@russell.cc>
Subject: Re: [PATCH v8 4/6] powerpc/tlb: Add local flush for page given
 mm_struct and psize
From: Russell Currey <ruscur@russell.cc>
To: Benjamin Gray <bgray@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Date: Mon, 24 Oct 2022 15:22:03 +1100
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

This misses a definition for PPC_8xx which leads to a build failure as
found by snowpatch here:
https://github.com/ruscur/linux-ci/actions/runs/3295033018/jobs/5433162658#=
step:4:116

> =C2=A0
> =C2=A0extern void __local_flush_tlb_page(struct mm_struct *mm, unsigned
> long vmaddr,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int tsize, int in=
d);

