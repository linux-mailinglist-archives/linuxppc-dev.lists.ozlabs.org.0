Return-Path: <linuxppc-dev+bounces-1523-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC4E97E4E6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Sep 2024 04:59:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XBnlG5LnFz2xnc;
	Mon, 23 Sep 2024 12:59:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=114.132.58.6
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727060362;
	cv=none; b=Av7iyw1g6lTdXKSAsY5efS/twbyWXzGG+420tC9tB65/jjGU22OJAzQunbvWs0m7T8YM7jwDN29Hpnygyjo4vXxSPKEX2viernwH8OKlh060MTfKZIqw5KQHrYw77+CN5jQynzCsEbVn6cbAxMKK8xKI3No3i8qySgb/PV+1jvLTpt02j4CEIH1EY2nQMOtCwE2fC3k9Cyty2dtrkeNLNLzKi/x9ACTUAsYuiweWJ5d38MY6G/vpILUizc3I3SjACR39hddY9r+utg74cwH87SuSbB7dzz6DfOMB/TkMzajf85xN+7bpYwiDPbyEBMhwLGvuaDqMnP6f5wKyFPbTJA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727060362; c=relaxed/relaxed;
	bh=MRk+STlxowGMELIu7tAVtdGnM8sGeXLAfNLT02F9xfU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bgiMbvB6Efvj+w8fLFQeyl565wwOtS7tPv8Rvfu0vrUgZYQWdIT8Jp455v5N77mIygbyeFwKCMCVMLC+ujO0Ek9jvbrbdtTZF6mcaZ7gXuiMFVqnXqJwxPUc1+3M20PAnSiZ9ip8oJz9+tuT3JhzEsRCO0Vn0wb/AiBef5Nf0EeBJYmPAwEMA27zUKurLmRqfd+7R2RLqEaKWBqqmKwKHb6SrjoGiNb0loQ+CJASdEHrYyroUneutJAqQE504emuZ7Cgkdb1zRre0gXNaW3xHYGF0x+GgeiPQ3wGYvdeKhy6io/my5yx/410nwoUF3Aq06406teKo5QfTiLzg2ik/w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=shingroup.cn; spf=pass (client-ip=114.132.58.6; helo=bg1.exmail.qq.com; envelope-from=luming.yu@shingroup.cn; receiver=lists.ozlabs.org) smtp.mailfrom=shingroup.cn
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=shingroup.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=shingroup.cn (client-ip=114.132.58.6; helo=bg1.exmail.qq.com; envelope-from=luming.yu@shingroup.cn; receiver=lists.ozlabs.org)
Received: from bg1.exmail.qq.com (bg1.exmail.qq.com [114.132.58.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XBnlF25vyz2xHg
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Sep 2024 12:59:20 +1000 (AEST)
X-QQ-mid: bizesmtp86t1727060282tghpij9e
X-QQ-Originating-IP: z6kSYKOZj9tF/CadInEk8vWIdrNPbqJLGykFKaAzUAw=
Received: from HX09040029.powercore.com.cn ( [180.171.104.254])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 23 Sep 2024 10:58:00 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17443238697871441029
Date: Mon, 23 Sep 2024 10:57:27 +0800
From: Luming Yu <luming.yu@shingroup.cn>
To: Ritesh Harjani <ritesh.list@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
	jialong.yang@shingroup.cn, luming.yu@gmail.com
Subject: Re: [RFC PATCH] powerpc/tlb: enable arch want batched unmap tlb flush
Message-ID: <3A7F514D32DFA545+ZvDZF58z6KTRqRjG@HX09040029.powercore.com.cn>
References: <9BC3D1299ECE8428+20240918092515.2121-2-luming.yu@shingroup.cn>
 <87frpsymf2.fsf@gmail.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87frpsymf2.fsf@gmail.com>
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:shingroup.cn:qybglogicsvrgz:qybglogicsvrgz8a-1

On Sun, Sep 22, 2024 at 04:39:53PM +0530, Ritesh Harjani wrote:
> Luming Yu <luming.yu@shingroup.cn> writes:
> 
> > From: Yu Luming <luming.yu@gmail.com>
> >
> > ppc always do its own tracking for batch tlb. By trivially enabling
> > the ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH in ppc, ppc arch can re-use
> > common code in rmap and reduce overhead and do optimization it could not
> > have without a tlb flushing context at low architecture level.
> 
> I looked at this patch and other than the compile failure, this patch
> still won't optimize anything. The idea of this config is that we want
> to batch all the tlb flush operation at the end. By returning false from
> should_defer_flush() (in this patch), we are saying we cannot defer
> the flush and hence we do tlb flush in the same context of unmap.
not exactly, as false return implies, we currently do nothing but relying on
book3S_64's tlb batch implementation which contains a bit of defer optimization
that we need to use a real benchmark to do some performance characterization.

And I need to get my test bed ready for patch testing first. So I have to
defer the real optimization in this area.
> 
> Anyway, I took a quick look at ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH
> and I have a quick PoC for the same. I will soon post it.
thanks for picking up the barton for the future collaboration on the
potential common performance benefits among us for powerpc arch.
> 
> -ritesh
> 
> >
> > Signed-off-by: Luming Yu <luming.yu@shingroup.cn>
> > ---
> >  arch/powerpc/Kconfig                |  1 +
> >  arch/powerpc/include/asm/tlbbatch.h | 30 +++++++++++++++++++++++++++++
> >  2 files changed, 31 insertions(+)
> >  create mode 100644 arch/powerpc/include/asm/tlbbatch.h
> >
> > diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> > index e94e7e4bfd40..e6db84dd014a 100644
> > --- a/arch/powerpc/Kconfig
> > +++ b/arch/powerpc/Kconfig
> > @@ -175,6 +175,7 @@ config PPC
> >  	select ARCH_WANT_IPC_PARSE_VERSION
> >  	select ARCH_WANT_IRQS_OFF_ACTIVATE_MM
> >  	select ARCH_WANT_LD_ORPHAN_WARN
> > +	select ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH
> >  	select ARCH_WANT_OPTIMIZE_DAX_VMEMMAP	if PPC_RADIX_MMU
> >  	select ARCH_WANTS_MODULES_DATA_IN_VMALLOC	if PPC_BOOK3S_32 || PPC_8xx
> >  	select ARCH_WEAK_RELEASE_ACQUIRE
> > diff --git a/arch/powerpc/include/asm/tlbbatch.h b/arch/powerpc/include/asm/tlbbatch.h
> > new file mode 100644
> > index 000000000000..484628460057
> > --- /dev/null
> > +++ b/arch/powerpc/include/asm/tlbbatch.h
> > @@ -0,0 +1,30 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +#ifndef _ARCH_PPC_TLBBATCH_H
> > +#define _ARCH_PPC_TLBBATCH_H
> > +
> > +struct arch_tlbflush_unmap_batch {
> > +	/*
> > +         *
> > +	 */
> > +};
> > +
> > +static inline void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch)
> > +{
> > +}
> > +
> > +static inline void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *batch,
> > +						struct mm_struct *mm,
> > +						unsigned long uarddr)
> > +{
> > +}
> > +
> > +static inline bool arch_tlbbatch_should_defer(struct mm_struct *mm)
> > +{
> > +	/*ppc always do tlb flush in batch*/
> > +	return false;
> > +}
> > +
> > +static inline void arch_flush_tlb_batched_pending(struct mm_struct *mm)
> > +{
> > +}
> > +#endif /* _ARCH_PPC_TLBBATCH_H */
> > -- 
> > 2.42.0.windows.2
> 


