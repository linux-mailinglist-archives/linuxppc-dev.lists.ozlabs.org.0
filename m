Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2491FCFDE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jun 2020 16:41:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49n76d5nhFzDqyB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jun 2020 00:41:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2607:7c80:54:e::133; helo=bombadil.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=bombadil.20170209 header.b=Zc3NNU9C; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49n73l04DTzDqRp
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jun 2020 00:38:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Kz+LMLXOVZt0DhWuklquEirxsE+Y/8beNA/Kd+7/KLk=; b=Zc3NNU9CE/FA3EHevP4Wvy/DuS
 rPJVvum9vS4DXvB7GyGP/8H/UMmfIUTxk6PeluJOy7vk8JPg15tEY6xlEgc0F2gRKq8ezhPWPALwN
 UpIEIDhfYr49Z43uzuRCQuvtbQFTsbS4DvAm2Zd0IfHLbJDBSmSWnH0zokWENblhaHWUPGsJ/cdbR
 nHKvmLmdU+cvsMP3a35uS3EfDG8NifkmMbP9JX4zBy3okUv7uOPgVeY511J/NQcQUL/gwE+y+YwW7
 P0TRxeyJVJR288qi6jFtJZNSgCNG/mnmqQqAJr6OONb2iAxquFrCmcFklCLFNV3bQ77frYWq4rVIH
 Ihc5AFoA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlZCx-0007S4-A5; Wed, 17 Jun 2020 14:38:31 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id C2736301A32;
 Wed, 17 Jun 2020 16:38:26 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id A5C0A203CE7EE; Wed, 17 Jun 2020 16:38:26 +0200 (CEST)
Date: Wed, 17 Jun 2020 16:38:26 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 3/3] powerpc/8xx: Provide ptep_get() with 16k pages
Message-ID: <20200617143826.GJ2531@hirez.programming.kicks-ass.net>
References: <cover.1592225557.git.christophe.leroy@csgroup.eu>
 <341688399c1b102756046d19ea6ce39db1ae4742.1592225558.git.christophe.leroy@csgroup.eu>
 <20200615132244.GR2531@hirez.programming.kicks-ass.net>
 <87wo45db8d.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wo45db8d.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 18, 2020 at 12:21:22AM +1000, Michael Ellerman wrote:
> Peter Zijlstra <peterz@infradead.org> writes:
> > On Mon, Jun 15, 2020 at 12:57:59PM +0000, Christophe Leroy wrote:

> >> +#if defined(CONFIG_PPC_8xx) && defined(CONFIG_PPC_16K_PAGES)
> >> +#define __HAVE_ARCH_PTEP_GET
> >> +static inline pte_t ptep_get(pte_t *ptep)
> >> +{
> >> +	pte_t pte = {READ_ONCE(ptep->pte), 0, 0, 0};
> >> +
> >> +	return pte;
> >> +}
> >> +#endif
> >
> > Would it make sense to have a comment with this magic? The casual reader
> > might wonder WTH just happened when he stumbles on this :-)
> 
> I tried writing a helpful comment but it's too late for my brain to form
> sensible sentences.
> 
> Christophe can you send a follow-up with a comment explaining it? In
> particular the zero entries stand out, it's kind of subtle that those
> entries are only populated with the right value when we write to the
> page table.

static inline pte_t ptep_get(pte_t *ptep)
{
	unsigned long val = READ_ONCE(ptep->pte);
	/* 16K pages have 4 identical value 4K entries */
	pte_t pte = {val, val, val, val);
	return pte;
}

Maybe something like that?
