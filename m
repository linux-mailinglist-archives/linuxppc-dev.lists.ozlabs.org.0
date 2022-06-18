Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFB55504CF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Jun 2022 14:41:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LQFrm3Mxsz2yZc
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Jun 2022 22:41:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=mark.rutland@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LQFrK262bz2yZc
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Jun 2022 22:40:45 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1EF68113E;
	Sat, 18 Jun 2022 05:40:13 -0700 (PDT)
Received: from FVFF77S0Q05N (unknown [10.57.35.139])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6859A3F792;
	Sat, 18 Jun 2022 05:40:08 -0700 (PDT)
Date: Sat, 18 Jun 2022 13:40:01 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Tong Tiangen <tongtiangen@huawei.com>
Subject: Re: [PATCH -next v5 2/8] arm64: extable: make uaaccess helper use
 extable type EX_TYPE_UACCESS_ERR_ZERO
Message-ID: <Yq3HoUyEcnKKk1AY@FVFF77S0Q05N>
References: <20220528065056.1034168-1-tongtiangen@huawei.com>
 <20220528065056.1034168-3-tongtiangen@huawei.com>
 <Yqw6TP3MhEqnQ+2o@FVFF77S0Q05N>
 <4371a7c9-8766-9fee-2558-e6f43f06ad19@huawei.com>
 <0da734f3-5743-3df3-3f90-d92e5bd585ce@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0da734f3-5743-3df3-3f90-d92e5bd585ce@huawei.com>
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>, Guohanjun <guohanjun@huawei.com>, Will Deacon <will@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Ingo Molnar <mingo@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, Xie XiuQi <xiexiuqi@huawei.com>, Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Jun 18, 2022 at 04:42:06PM +0800, Tong Tiangen wrote:
> > > > diff --git a/arch/arm64/include/asm/asm-extable.h
> > > > b/arch/arm64/include/asm/asm-extable.h
> > > > index 56ebe183e78b..9c94ac1f082c 100644
> > > > --- a/arch/arm64/include/asm/asm-extable.h
> > > > +++ b/arch/arm64/include/asm/asm-extable.h
> > > > @@ -28,6 +28,14 @@
> > > >       __ASM_EXTABLE_RAW(\insn, \fixup, EX_TYPE_FIXUP, 0)
> > > >       .endm
> > > > +/*
> > > > + * Create an exception table entry for uaccess `insn`, which
> > > > will branch to `fixup`
> > > > + * when an unhandled fault is taken.
> > > > + * ex->data = ~0 means both reg_err and reg_zero is set to wzr(x31).
> > > > + */
> > > > +    .macro          _asm_extable_uaccess, insn, fixup
> > > > +    __ASM_EXTABLE_RAW(\insn, \fixup, EX_TYPE_UACCESS_ERR_ZERO, ~0)
> > > > +    .endm
> > > 
> > > I'm not too keen on using `~0` here, since that also sets other bits
> > > in the
> > > data field, and its somewhat opaque.
> > > 
> > > How painful is it to generate the data fields as with the C version
> > > of this
> > > macro, so that we can pass in wzr explciitly for the two sub-fields?
> > > 
> > > Other than that, this looks good to me.
> > > 
> > > Thanks,
> > > Mark.
> > 
> > ok, will fix next version.
> > 
> > Thanks,
> > Tong.
> 
> I tried to using data filelds as with C version, but here assembly code we
> can not using operator such as << and |, if we use lsl and orr instructions,
> the gpr will be occupied.
> 
> So how about using 0x3ff directly here? it means err register and zero
> register both set to x31.

I had a go at implementing this, and it seems simple enough. Please see:

  https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/log/?h=arm64/extable/asm-uaccess

Mark.
