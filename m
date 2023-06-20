Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3F4736416
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jun 2023 09:11:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=Qfx4iSwm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qld8w1NnZz3bZK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jun 2023 17:11:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=Qfx4iSwm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qld7x37j3z2yyT
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jun 2023 17:10:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Ak1na8GbY5x4+XXN0A9MfARgJ99cd/S+45Z1mbNGHDM=; b=Qfx4iSwmEU0wrndFg+bhUU71CJ
	WSXMR57xcYsp6J6A7JG8bhxgS0nfDiM5r14j5FCwTdRXWA+cUIKyuUluush1FZfpWkBCK/4H3nV8e
	w2xrI+cVdgeF0M7Ht04eo2mQkHYb+5cBq1Bgm3wZsoNUfhdbPVkBvp03mBWyKOFBJSgqYecTk9RKK
	7NVnLCb0VhPirp26pVVSa3FJOfGAdIp30vUyCXQqFkakQsdA1WYjCRREQ2cdRS1AEcEHVXZ311am5
	BNW8zWbFCdnDc1+a+dvOmVG7bYbTiz1vp8ccQWLXpuqvhOqvt1d5fF1jeUM7Kl5PPwBYitEJTqqJI
	mTq8IMlw==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qBVVB-00CmmP-QS; Tue, 20 Jun 2023 07:10:09 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 1D673300137;
	Tue, 20 Jun 2023 09:10:06 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 0237D20A3B6D3; Tue, 20 Jun 2023 09:10:05 +0200 (CEST)
Date: Tue, 20 Jun 2023 09:10:05 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Naveen N Rao <naveen@kernel.org>
Subject: Re: [RFC PATCH v1 1/3] Revert "powerpc/bug: Provide better
 flexibility to WARN_ON/__WARN_FLAGS() with asm goto"
Message-ID: <20230620071005.GR4253@hirez.programming.kicks-ass.net>
References: <cover.1686922583.git.christophe.leroy@csgroup.eu>
 <8dd72199549e76e0e9c2aba1c89d5fe2b0cb1663.1686922583.git.christophe.leroy@csgroup.eu>
 <1687237941.1wok7iiqm0.naveen@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1687237941.1wok7iiqm0.naveen@kernel.org>
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
Cc: linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Sathvika Vasireddy <sv@linux.ibm.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Josh Poimboeuf <jpoimboe@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 20, 2023 at 10:51:25AM +0530, Naveen N Rao wrote:
> Christophe Leroy wrote:
> > This reverts commit 1e688dd2a3d6759d416616ff07afc4bb836c4213.
> > 
> > That commit aimed at optimising the code around generation of
> > WARN_ON/BUG_ON but this leads to a lot of dead code erroneously
> > generated by GCC.
> > 
> >      text	   data	    bss	    dec	    hex	filename
> >   9551585	3627834	 224376	13403795	 cc8693	vmlinux.before
> >   9535281	3628358	 224376	13388015	 cc48ef	vmlinux.after
> > 
> > Once this change is reverted, in a standard configuration (pmac32 +
> > function tracer) the text is reduced by 16k which is around 1.7%
> 
> Aneesh recently reported a build failure due to the use of 'asm goto' in
> WARN_ON(). We were able to root-cause it to the use of 'asm goto' with two
> config options: CONFIG_CC_OPTIMIZE_FOR_SIZE and
> CONFIG_DEBUG_SECTION_MISMATCH.

FWIW;

I recently had clang-powerpc report a very dodgy build error that was
due to a combination of these asm-goto and the usage of __cleanup__.
For some reason the label of the asm-goto crossed over the __cleanup__
variable declaration -- which is not valid, but also was completely
insane for that's not what the code called for.

  https://lkml.kernel.org/r/20230610082005.GB1370249@hirez.programming.kicks-ass.net

But in my book that's a compiler issue, not a kernel issue and I'd be
hesitant to pull the asm-goto use just for that.


