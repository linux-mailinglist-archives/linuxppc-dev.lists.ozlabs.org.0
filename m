Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA83534CC5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 May 2022 11:51:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L839g6kmFz3blX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 May 2022 19:51:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=mark.rutland@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L839C6DhDz2yw1
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 May 2022 19:51:07 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 665981474;
	Thu, 26 May 2022 02:50:33 -0700 (PDT)
Received: from FVFF77S0Q05N (unknown [10.57.2.68])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 28ACF3F73D;
	Thu, 26 May 2022 02:50:27 -0700 (PDT)
Date: Thu, 26 May 2022 10:50:23 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Tong Tiangen <tongtiangen@huawei.com>
Subject: Re: [PATCH -next v4 3/7] arm64: add support for machine check error
 safe
Message-ID: <Yo9NX8BvQQXryHDV@FVFF77S0Q05N>
References: <20220420030418.3189040-1-tongtiangen@huawei.com>
 <20220420030418.3189040-4-tongtiangen@huawei.com>
 <Yn54mA7KnlAs1dER@lakrids>
 <46e5954c-a9a8-f4a8-07cc-de42e2753051@huawei.com>
 <Yo3pP/Y+6HHuVBns@FVFF77S0Q05N>
 <87bdb1c6-5803-d9c0-9208-432027ae1d8b@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87bdb1c6-5803-d9c0-9208-432027ae1d8b@huawei.com>
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

On Thu, May 26, 2022 at 11:36:41AM +0800, Tong Tiangen wrote:
> 
> 
> 在 2022/5/25 16:30, Mark Rutland 写道:
> > On Thu, May 19, 2022 at 02:29:54PM +0800, Tong Tiangen wrote:
> > > 
> > > 
> > > 在 2022/5/13 23:26, Mark Rutland 写道:
> > > > On Wed, Apr 20, 2022 at 03:04:14AM +0000, Tong Tiangen wrote:
> > > > > During the processing of arm64 kernel hardware memory errors(do_sea()), if
> > > > > the errors is consumed in the kernel, the current processing is panic.
> > > > > However, it is not optimal.
> > > > > 
> > > > > Take uaccess for example, if the uaccess operation fails due to memory
> > > > > error, only the user process will be affected, kill the user process
> > > > > and isolate the user page with hardware memory errors is a better choice.
> > > > 
> > > > Conceptually, I'm fine with the idea of constraining what we do for a
> > > > true uaccess, but I don't like the implementation of this at all, and I
> > > > think we first need to clean up the arm64 extable usage to clearly
> > > > distinguish a uaccess from another access.
> > > 
> > > OK,using EX_TYPE_UACCESS and this extable type could be recover, this is
> > > more reasonable.
> > 
> > Great.
> > 
> > > For EX_TYPE_UACCESS_ERR_ZERO, today we use it for kernel accesses in a
> > > couple of cases, such as
> > > get_user/futex/__user_cache_maint()/__user_swpX_asm(),
> > 
> > Those are all user accesses.
> > 
> > However, __get_kernel_nofault() and __put_kernel_nofault() use
> > EX_TYPE_UACCESS_ERR_ZERO by way of __{get,put}_mem_asm(), so we'd need to
> > refactor that code to split the user/kernel cases higher up the callchain.
> > 
> > > your suggestion is:
> > > get_user continues to use EX_TYPE_UACCESS_ERR_ZERO and the other cases use
> > > new type EX_TYPE_FIXUP_ERR_ZERO?
> > 
> > Yes, that's the rough shape. We could make the latter EX_TYPE_KACCESS_ERR_ZERO
> > to be clearly analogous to EX_TYPE_UACCESS_ERR_ZERO, and with that I susepct we
> > could remove EX_TYPE_FIXUP.
> > 
> > Thanks,
> > Mark.
> According to your suggestion, i think the definition is like this:
> 
> #define EX_TYPE_NONE                    0
> #define EX_TYPE_FIXUP                   1    --> delete
> #define EX_TYPE_BPF                     2
> #define EX_TYPE_UACCESS_ERR_ZERO        3
> #define EX_TYPE_LOAD_UNALIGNED_ZEROPAD  4
> #define EX_TYPE_UACCESS		        xx   --> add
> #define EX_TYPE_KACCESS_ERR_ZERO        xx   --> add
> [The value defined by the macro here is temporary]

Almost; you don't need to add EX_TYPE_UACCESS here, as you can use
EX_TYPE_UACCESS_ERR_ZERO for that.

We already have:

| #define _ASM_EXTABLE_UACCESS_ERR(insn, fixup, err)		\
|         _ASM_EXTABLE_UACCESS_ERR_ZERO(insn, fixup, err, wzr)

... and we can add:

| #define _ASM_EXTABLE_UACCESS(insn, fixup)			\
|         _ASM_EXTABLE_UACCESS_ERR_ZERO(insn, fixup, wzr, wzr)


... and maybe we should use 'xzr' rather than 'wzr' for clarity.

> There are two points to modify:
> 
> 1、_get_kernel_nofault() and __put_kernel_nofault()  using
> EX_TYPE_KACCESS_ERR_ZERO, Other positions using EX_TYPE_UACCESS_ERR_ZERO
> keep unchanged.

That sounds right to me. This will require refactoring __raw_{get,put}_mem()
and __{get,put}_mem_asm().

> 2、delete EX_TYPE_FIXUP.
> 
> There is no doubt about others. As for EX_TYPE_FIXUP, I think it needs to be
> retained, _cond_extable(EX_TYPE_FIXUP) is still in use in assembler.h.

We use _cond_extable for cache maintenance uaccesses, so those should be moved
over to to EX_TYPE_UACCESS_ERR_ZERO. We can rename _cond_extable to
_cond_uaccess_extable for clarity.

That will require restructuring asm-extable.h a bit. If that turns out to be
painful I'm happy to take a look.

Thanks,
Mark.
