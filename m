Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E451FDAA6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jun 2020 02:59:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49nNqk2fMGzDr10
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jun 2020 10:59:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49nNpD3FnkzDqmd
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jun 2020 10:57:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=NHTZlTX/; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49nNpC6gn1z9sSc;
 Thu, 18 Jun 2020 10:57:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1592441876;
 bh=6zbfkIJEcTCwhluvkJvBqEMwTUGHoNtvQJF2+Rj1LaM=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=NHTZlTX/5g6rn40qsPCUdD6fSYs3H/O96lPB5Od0iDL+byhDWHWQIQLE27MzX0zhE
 9gsbQEXMgI1UPVY4mdvDy4wx0BLwEFro2ntSpgtfXzlbJHxHhgyLf98H4FhbaT8dY5
 T91UAEm4lqMTVsgNKXUL0DxccrN73ibptXw5UT1d41o6J5a9E8Z3t7whaBu9ZvCQ4s
 5Fc//tbxV8gTmwVK6YMSylhlNXJT4WpKvPERA/V1PRuNcd3MzmBiYkdJdjpJ0qgybm
 I3vWexaORUZkpPuXQ/95I8XjjaSBfuKhGXTJ2Ixrv/l/P0xbKvBR/VShg2ea7diDVv
 Li/WBRKe9KZ6Q==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH 3/3] powerpc/8xx: Provide ptep_get() with 16k pages
In-Reply-To: <20200617143826.GJ2531@hirez.programming.kicks-ass.net>
References: <cover.1592225557.git.christophe.leroy@csgroup.eu>
 <341688399c1b102756046d19ea6ce39db1ae4742.1592225558.git.christophe.leroy@csgroup.eu>
 <20200615132244.GR2531@hirez.programming.kicks-ass.net>
 <87wo45db8d.fsf@mpe.ellerman.id.au>
 <20200617143826.GJ2531@hirez.programming.kicks-ass.net>
Date: Thu, 18 Jun 2020 10:58:26 +1000
Message-ID: <87pn9xchql.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Peter Zijlstra <peterz@infradead.org> writes:
> On Thu, Jun 18, 2020 at 12:21:22AM +1000, Michael Ellerman wrote:
>> Peter Zijlstra <peterz@infradead.org> writes:
>> > On Mon, Jun 15, 2020 at 12:57:59PM +0000, Christophe Leroy wrote:
>
>> >> +#if defined(CONFIG_PPC_8xx) && defined(CONFIG_PPC_16K_PAGES)
>> >> +#define __HAVE_ARCH_PTEP_GET
>> >> +static inline pte_t ptep_get(pte_t *ptep)
>> >> +{
>> >> +	pte_t pte = {READ_ONCE(ptep->pte), 0, 0, 0};
>> >> +
>> >> +	return pte;
>> >> +}
>> >> +#endif
>> >
>> > Would it make sense to have a comment with this magic? The casual reader
>> > might wonder WTH just happened when he stumbles on this :-)
>> 
>> I tried writing a helpful comment but it's too late for my brain to form
>> sensible sentences.
>> 
>> Christophe can you send a follow-up with a comment explaining it? In
>> particular the zero entries stand out, it's kind of subtle that those
>> entries are only populated with the right value when we write to the
>> page table.
>
> static inline pte_t ptep_get(pte_t *ptep)
> {
> 	unsigned long val = READ_ONCE(ptep->pte);
> 	/* 16K pages have 4 identical value 4K entries */
> 	pte_t pte = {val, val, val, val);
> 	return pte;
> }
>
> Maybe something like that?

I think val wants to be pte_basic_t, but otherwise yeah I like that much
better.

cheers
