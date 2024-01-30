Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D67E584244D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jan 2024 13:02:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TPP1V5xRkz3cYB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jan 2024 23:02:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=mark.rutland@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TPP0z4Kkdz3bqQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jan 2024 23:02:08 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3DDFDDA7;
	Tue, 30 Jan 2024 04:02:19 -0800 (PST)
Received: from FVFF77S0Q05N (unknown [10.57.48.92])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 57FCA3F762;
	Tue, 30 Jan 2024 04:01:31 -0800 (PST)
Date: Tue, 30 Jan 2024 12:01:26 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Tong Tiangen <tongtiangen@huawei.com>
Subject: Re: [PATCH v10 3/6] arm64: add uaccess to machine check safe
Message-ID: <ZbjlFXVC_ZPYbKhR@FVFF77S0Q05N>
References: <20240129134652.4004931-1-tongtiangen@huawei.com>
 <20240129134652.4004931-4-tongtiangen@huawei.com>
 <ZbfjvD1_yKK6IVVY@FVFF77S0Q05N>
 <23795738-b86e-7709-bc2b-5abba2e77b68@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <23795738-b86e-7709-bc2b-5abba2e77b68@huawei.com>
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
Cc: wangkefeng.wang@huawei.com, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org, Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, kasan-dev@googlegroups.com, "H. Peter Anvin" <hpa@zytor.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, Will Deacon <will@kernel.org>, x86@kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Ingo Molnar <mingo@redhat.com>, linux-arm-kernel@lists.infradead.org, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>, Thomas Gleixner <tglx@linutronix.de>, Dmitry Vyukov <dvyukov@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, linuxppc-dev@lists.ozlabs.org, Guohanjun <guohanjun@huawei.com>, linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>, Andrew Morton <akpm@linux-foundation.org>, Robin Murphy <robin.murphy@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jan 30, 2024 at 07:14:35PM +0800, Tong Tiangen wrote:
> 在 2024/1/30 1:43, Mark Rutland 写道:
> > On Mon, Jan 29, 2024 at 09:46:49PM +0800, Tong Tiangen wrote:
> > Further, this change will also silently fixup unexpected kernel faults if we
> > pass bad kernel pointers to copy_{to,from}_user, which will hide real bugs.
> 
> I think this is better than the panic kernel, because the real bugs
> belongs to the user process. Even if the wrong pointer is
> transferred, the page corresponding to the wrong pointer has a memroy
> error.

I think you have misunderstood my point; I'm talking about the case of a bad
kernel pointer *without* a memory error.

For example, consider some buggy code such as:

	void __user *uptr = some_valid_user_pointer;
	void *kptr = NULL; // or any other bad pointer

	ret = copy_to_user(uptr, kptr, size);
	if (ret)
		return -EFAULT;

Before this patch, when copy_to_user() attempted to load from NULL it would
fault, there would be no fixup handler for the LDR, and the kernel would die(),
reporting the bad kernel access.

After this patch (which adds fixup handlers to all the LDR*s in
copy_to_user()), the fault (which is *not* a memory error) would be handled by
the fixup handler, and copy_to_user() would return an error without *any*
indication of the horrible kernel bug.

This will hide kernel bugs, which will make those harder to identify and fix,
and will also potentially make it easier to exploit the kernel: if the user
somehow gains control of the kernel pointer, they can rely on the fixup handler
returning an error, and can scan through memory rather than dying as soon as
they pas a bad pointer.

> In addition, the panic information contains necessary information
> for users to check.

There is no panic() in the case I am describing.

> > So NAK to this change as-is; likewise for the addition of USER() to other ldr*
> > macros in copy_from_user.S and the addition of USER() str* macros in
> > copy_to_user.S.
> > 
> > If we want to handle memory errors on some kaccesses, we need a new EX_TYPE_*
> > separate from the usual EX_TYPE_KACESS_ERR_ZERO that means "handle memory
> > errors, but treat other faults as fatal". That should come with a rationale and
> > explanation of why it's actually useful.
> 
> This makes sense. Add kaccess types that can be processed properly.
> 
> > 
> > [...]
> > 
> > > diff --git a/arch/arm64/mm/extable.c b/arch/arm64/mm/extable.c
> > > index 478e639f8680..28ec35e3d210 100644
> > > --- a/arch/arm64/mm/extable.c
> > > +++ b/arch/arm64/mm/extable.c
> > > @@ -85,10 +85,10 @@ bool fixup_exception_mc(struct pt_regs *regs)
> > >   	if (!ex)
> > >   		return false;
> > > -	/*
> > > -	 * This is not complete, More Machine check safe extable type can
> > > -	 * be processed here.
> > > -	 */
> > > +	switch (ex->type) {
> > > +	case EX_TYPE_UACCESS_ERR_ZERO:
> > > +		return ex_handler_uaccess_err_zero(ex, regs);
> > > +	}
> > 
> > Please fold this part into the prior patch, and start ogf with *only* handling
> > errors on accesses already marked with EX_TYPE_UACCESS_ERR_ZERO. I think that
> > change would be relatively uncontroversial, and it would be much easier to
> > build atop that.
> 
> OK, the two patches will be merged in the next release.

Thanks.

Mark.
