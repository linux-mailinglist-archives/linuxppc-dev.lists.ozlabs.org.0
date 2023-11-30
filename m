Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F25267FFE7E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Nov 2023 23:32:53 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=C+OuN7+y;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sh9tq3ZWtz3dDh
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Dec 2023 09:32:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=C+OuN7+y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sh9t03vLwz2xdq
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Dec 2023 09:32:07 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 40BB262013;
	Thu, 30 Nov 2023 22:32:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7115C433C8;
	Thu, 30 Nov 2023 22:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1701383522;
	bh=15PK2iNoEdJqQGu4Y59xZHRAisUs8d1YcFlFM7D9rm4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=C+OuN7+yM+sxavjVw4ZrcIBrT0DvHOfPbhPXXrX/U19VBrV2Ee89qctdK6Xk3Mc76
	 64IbiuxS/dQSrMry0JwhugX5ynF6MKtviT1+UEppQDdD+p6YalkV2n1DjzlZFnmRB6
	 R0qK8DvoAPQld9ht5Mg/WLLCleifoU+Gb2lBMmt4=
Date: Thu, 30 Nov 2023 14:32:02 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the mm tree
Message-Id: <20231130143202.70d56b3818ee48b0e4edd213@linux-foundation.org>
In-Reply-To: <20231201090439.7ae92c13@canb.auug.org.au>
References: <20231127132809.45c2b398@canb.auug.org.au>
	<20231127144852.069b2e7e@canb.auug.org.au>
	<20231201090439.7ae92c13@canb.auug.org.au>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 1 Dec 2023 09:04:39 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> > > diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
> > > index be229290a6a7..3438ab72c346 100644
> > > --- a/arch/powerpc/mm/book3s64/pgtable.c
> > > +++ b/arch/powerpc/mm/book3s64/pgtable.c
> > > @@ -542,6 +542,7 @@ void ptep_modify_prot_commit(struct vm_area_struct *vma, unsigned long addr,
> > >  	set_pte_at(vma->vm_mm, addr, ptep, pte);
> > >  }
> > >  
> > > +#ifdef CONFIG_TRANSPARENT_HUGEPAGE
> > >  /*
> > >   * For hash translation mode, we use the deposited table to store hash slot
> > >   * information and they are stored at PTRS_PER_PMD offset from related pmd
> > > @@ -563,6 +564,7 @@ int pmd_move_must_withdraw(struct spinlock *new_pmd_ptl,
> > >  
> > >  	return true;
> > >  }
> > > +#endif
> > >  
> > >  /*
> > >   * Does the CPU support tlbie?
> > > -- 
> > > 2.40.1  
> 
> I am still carrying this patch (it should probably go into the mm
> tree).  Is someone going to pick it up (assuming it is correct)?

AFAIK we're still awaiting input from the ppc team.

I'll grab it.  If it breaks things then we-told-you-so!
