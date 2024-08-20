Return-Path: <linuxppc-dev+bounces-219-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 462709581BE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2024 11:13:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wp3fl6Jf0z2y8d;
	Tue, 20 Aug 2024 19:13:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=mark.rutland@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wp3fl0Bd0z2y33
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2024 19:13:32 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DB16ADA7;
	Tue, 20 Aug 2024 02:13:25 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3BA6B3F66E;
	Tue, 20 Aug 2024 02:12:55 -0700 (PDT)
Date: Tue, 20 Aug 2024 10:12:47 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Tong Tiangen <tongtiangen@huawei.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	James Morse <james.morse@arm.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	wangkefeng.wang@huawei.com, Guohanjun <guohanjun@huawei.com>
Subject: Re: [PATCH v12 2/6] arm64: add support for ARCH_HAS_COPY_MC
Message-ID: <ZsReD722byCipuNm@J2N7QTR9R3>
References: <20240528085915.1955987-1-tongtiangen@huawei.com>
 <20240528085915.1955987-3-tongtiangen@huawei.com>
 <ZsOA8WD_5Sp0DJhS@J2N7QTR9R3.cambridge.arm.com>
 <4436d172-c474-8ecd-b5e4-4c21088baf49@huawei.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4436d172-c474-8ecd-b5e4-4c21088baf49@huawei.com>

On Tue, Aug 20, 2024 at 10:11:45AM +0800, Tong Tiangen wrote:
> 在 2024/8/20 1:29, Mark Rutland 写道:
> > Hi Tong,
> > 
> > On Tue, May 28, 2024 at 04:59:11PM +0800, Tong Tiangen wrote:
> > > For the arm64 kernel, when it processes hardware memory errors for
> > > synchronize notifications(do_sea()), if the errors is consumed within the
> > > kernel, the current processing is panic. However, it is not optimal.
> > > 
> > > Take copy_from/to_user for example, If ld* triggers a memory error, even in
> > > kernel mode, only the associated process is affected. Killing the user
> > > process and isolating the corrupt page is a better choice.
> > > 
> > > New fixup type EX_TYPE_KACCESS_ERR_ZERO_ME_SAFE is added to identify insn
> > > that can recover from memory errors triggered by access to kernel memory.
> > > 
> > > Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>

[...]

> > > diff --git a/arch/arm64/include/asm/asm-extable.h b/arch/arm64/include/asm/asm-extable.h
> > > index 980d1dd8e1a3..9c0664fe1eb1 100644
> > > --- a/arch/arm64/include/asm/asm-extable.h
> > > +++ b/arch/arm64/include/asm/asm-extable.h
> > > @@ -5,11 +5,13 @@
> > >   #include <linux/bits.h>
> > >   #include <asm/gpr-num.h>
> > > -#define EX_TYPE_NONE			0
> > > -#define EX_TYPE_BPF			1
> > > -#define EX_TYPE_UACCESS_ERR_ZERO	2
> > > -#define EX_TYPE_KACCESS_ERR_ZERO	3
> > > -#define EX_TYPE_LOAD_UNALIGNED_ZEROPAD	4
> > > +#define EX_TYPE_NONE				0
> > > +#define EX_TYPE_BPF				1
> > > +#define EX_TYPE_UACCESS_ERR_ZERO		2
> > > +#define EX_TYPE_KACCESS_ERR_ZERO		3
> > > +#define EX_TYPE_LOAD_UNALIGNED_ZEROPAD		4
> > > +/* kernel access memory error safe */
> > > +#define EX_TYPE_KACCESS_ERR_ZERO_ME_SAFE	5
> > 
> > Could we please use 'MEM_ERR', and likewise for the macros below? That's
> > more obvious than 'ME_SAFE', and we wouldn't need the comment here.
> > Likewise elsewhere in this patch and the series.
> > 
> > To Jonathan's comment, I do prefer these numbers are aligned, so aside
> > from the naming, the diff above looks good.
> 
> OK, I also modified other locations to use 'MEM_ERR'.

Thanks!

[...]

> > > diff --git a/arch/arm64/lib/copy_to_user.S b/arch/arm64/lib/copy_to_user.S
> > > index 802231772608..2ac716c0d6d8 100644
> > > --- a/arch/arm64/lib/copy_to_user.S
> > > +++ b/arch/arm64/lib/copy_to_user.S
> > > @@ -20,7 +20,7 @@
> > >    *	x0 - bytes not copied
> > >    */
> > >   	.macro ldrb1 reg, ptr, val
> > > -	ldrb  \reg, [\ptr], \val
> > > +	KERNEL_ME_SAFE(9998f, ldrb  \reg, [\ptr], \val)
> > >   	.endm
> > >   	.macro strb1 reg, ptr, val
> > > @@ -28,7 +28,7 @@
> > >   	.endm
> > >   	.macro ldrh1 reg, ptr, val
> > > -	ldrh  \reg, [\ptr], \val
> > > +	KERNEL_ME_SAFE(9998f, ldrh  \reg, [\ptr], \val)
> > >   	.endm
> > >   	.macro strh1 reg, ptr, val
> > > @@ -36,7 +36,7 @@
> > >   	.endm
> > >   	.macro ldr1 reg, ptr, val
> > > -	ldr \reg, [\ptr], \val
> > > +	KERNEL_ME_SAFE(9998f, ldr \reg, [\ptr], \val)
> > >   	.endm
> > >   	.macro str1 reg, ptr, val
> > > @@ -44,7 +44,7 @@
> > >   	.endm
> > >   	.macro ldp1 reg1, reg2, ptr, val
> > > -	ldp \reg1, \reg2, [\ptr], \val
> > > +	KERNEL_ME_SAFE(9998f, ldp \reg1, \reg2, [\ptr], \val)
> > >   	.endm
> > >   	.macro stp1 reg1, reg2, ptr, val
> > 
> > These changes mean that regular copy_to_user() will handle kernel memory
> > errors, rather than only doing that in copy_mc_to_user(). If that's
> > intentional, please call that out explicitly in the commit message.
> 
> Yes. This is the purpose of the modification. If the copy_to_user()
> function encounters a memory error, this uaccess affects only the
> current process. and only need to kill the current process instead of
> the entire kernel panic. Do not add copy_mc_to_user() so that
> copy_to_user() can process memory errors.
> 
> I'll add a description in the commit msg next version.

Ok; why do powerpc and x86 have separate copy_mc_to_user()
implementations, then?

[...]

> > > +/*
> > > + * APEI claimed this as a firmware-first notification.
> > > + * Some processing deferred to task_work before ret_to_user().
> > > + */
> > > +static bool do_apei_claim_sea(struct pt_regs *regs)
> > > +{
> > > +	if (user_mode(regs)) {
> > > +		if (!apei_claim_sea(regs))
> > > +			return true;
> > > +	} else if (IS_ENABLED(CONFIG_ARCH_HAS_COPY_MC)) {
> > > +		if (fixup_exception_me(regs) && !apei_claim_sea(regs))
> > > +			return true;
> > > +	}
> > > +
> > > +	return false;
> > > +}
> > 
> > Hmm... that'll fixup the exception even if we don't manage to claim a
> > the SEA. I suspect this should probably be:
> > 
> > static bool do_apei_claim_sea(struct pt_regs *regs)
> > {
> > 	if (apei_claim_sea(regs))
> > 		return false;
> > 	if (user_mode(regs))
> > 		return true;
> > 	if (IS_ENABLED(CONFIG_ARCH_HAS_COPY_MC))
> > 		return !fixup_excepton_mem_err(regs);
> > 	
> > 	return false;
> > }
> > 
> > ... unless we *don't* want to claim the SEA in the case we don't have a
> > fixup?
> > 
> > Mark.
> > 
> 
> Yes. My original meaning here is that if not have fixup, panic is
> performed in do_sea() according to the original logic, and claim sea is
> not required.

AFAICT my suggestion doesn't change that; if we don't have a fixup the
proprosed do_apei_claim_sea() would return false, and so do_sea() would
caryy on to arm64_notify_die(...).

I'm specifically asking if we need to avoid calling apei_claim_sea()
when we don't have a fixup handler, or if calling that would be fine.

One important thing is that if apei_claim_sea() fails to claim the SEA,
we'd like to panic(), and in that case it'd be good to have not applied
the fixup handler, so that the pt_regs::pc shows where the fault was
taken from.

Mark.

