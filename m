Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 56AC37FFE92
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Nov 2023 23:40:11 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Ca61jVTZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ShB3D65Jqz3cgQ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Dec 2023 09:40:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Ca61jVTZ;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ShB2N4gFGz2xqH
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Dec 2023 09:39:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1701383964;
	bh=5B23+sJ4R/G/IPrsTJiKg5aaAttIL3oIv3CTZW1impU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Ca61jVTZHbsuNs9ja5Izelfn43im4SOW29udCDlIrv8Gn9pCAhrACHlsK0RYR02Nw
	 b90CO9rCG0Ib3P/MwWx+FLMGxhElHJ5IDRK437SCBPO06FSFahe4Mlut5ykAcVs/tn
	 tfZUyyAwUoMb4FAocO/IZp5rRhifgBQFyAELJATDFVMbl1WYyVQYol4hdOJJGg/jpd
	 s341K17crZH6lxFOY/AIST+Z+E01Jp7We5aCd5m3rWA20C0Q6OmlTvr6ZPvPy1Trll
	 7IlQgXf/aETPDKKq/yOKar88IaeKUvOpcOTqGH3oWNle9LSO8GgubPbLaJ1qNI7B9/
	 uB+N43Llqf1IQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ShB2N38Z0z4xWc;
	Fri,  1 Dec 2023 09:39:24 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton
 <akpm@linux-foundation.org>
Subject: Re: linux-next: build failure after merge of the mm tree
In-Reply-To: <20231201090439.7ae92c13@canb.auug.org.au>
References: <20231127132809.45c2b398@canb.auug.org.au>
 <20231127144852.069b2e7e@canb.auug.org.au>
 <20231201090439.7ae92c13@canb.auug.org.au>
Date: Fri, 01 Dec 2023 09:39:20 +1100
Message-ID: <87sf4m27dz.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Stephen Rothwell <sfr@canb.auug.org.au> writes:
> On Mon, 27 Nov 2023 14:48:52 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> 
>> Just cc'ing the PowerPC guys to see if my fix is sensible.
>> 
>> On Mon, 27 Nov 2023 13:28:09 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> >
>> > After merging the mm tree, today's linux-next build (powerpc64
>> > allnoconfig) failed like this:
>> > 
>> > arch/powerpc/mm/book3s64/pgtable.c:557:5: error: no previous prototype for 'pmd_move_must_withdraw' [-Werror=missing-prototypes]
>> >   557 | int pmd_move_must_withdraw(struct spinlock *new_pmd_ptl,
>> >       |     ^~~~~~~~~~~~~~~~~~~~~~
>> > cc1: all warnings being treated as errors
>> > 
>> > Caused by commit
>> > 
>> >   c6345dfa6e3e ("Makefile.extrawarn: turn on missing-prototypes globally")
>> > 
>> > I have added the following patch for today (which could be applied to
>> > the mm or powerpc trees):
>> > 
>> > From 194805b44c11b4c0aa28bdcdc0bb0d82acef394c Mon Sep 17 00:00:00 2001
>> > From: Stephen Rothwell <sfr@canb.auug.org.au>
>> > Date: Mon, 27 Nov 2023 13:08:57 +1100
>> > Subject: [PATCH] powerpc: pmd_move_must_withdraw() is only needed for
>> >  CONFIG_TRANSPARENT_HUGEPAGE
>> > 
>> > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
>> > ---
>> >  arch/powerpc/mm/book3s64/pgtable.c | 2 ++
>> >  1 file changed, 2 insertions(+)
>> > 
>> > diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
>> > index be229290a6a7..3438ab72c346 100644
>> > --- a/arch/powerpc/mm/book3s64/pgtable.c
>> > +++ b/arch/powerpc/mm/book3s64/pgtable.c
>> > @@ -542,6 +542,7 @@ void ptep_modify_prot_commit(struct vm_area_struct *vma, unsigned long addr,
>> >  	set_pte_at(vma->vm_mm, addr, ptep, pte);
>> >  }
>> >  
>> > +#ifdef CONFIG_TRANSPARENT_HUGEPAGE
>> >  /*
>> >   * For hash translation mode, we use the deposited table to store hash slot
>> >   * information and they are stored at PTRS_PER_PMD offset from related pmd
>> > @@ -563,6 +564,7 @@ int pmd_move_must_withdraw(struct spinlock *new_pmd_ptl,
>> >  
>> >  	return true;
>> >  }
>> > +#endif
>> >  
>> >  /*
>> >   * Does the CPU support tlbie?
>> > -- 
>> > 2.40.1  
>
> I am still carrying this patch (it should probably go into the mm
> tree).  Is someone going to pick it up (assuming it is correct)?

I applied it to my next a few days ago, but I must have forgotten to
push. It's in there now.

cheers
