Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E7177D9CB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Aug 2023 07:36:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=p/1faKlB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RQcLc4F6Nz3ck4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Aug 2023 15:36:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=p/1faKlB;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RQcKj20g8z3c1Q
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Aug 2023 15:35:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1692164120;
	bh=1XQDjGNYbykrfK9ci4ZbulfmW5e7btpf3Feb7gvDwyo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=p/1faKlBCgOy58t1H4V4ztkIAK/ikTxQI4KkBGe2fTXMJNqKFci1ZruF08B+6e77k
	 hvf48FAJ+xwbd5QAHnkgsZFly7LxAZeDAwMsEfnkuJn6obwaopljl/HRQAcpqEZ/nb
	 pC+thgwpHyX4qU6Y3wq1nFI68mheF7iEyK0SaCgjS7xwhQiegxIwVPjSRW8OzJ/X9l
	 P/qLKqDAYJEM7yX3HvBQFzmV8cDg8E29KEugHOw2GUYxJw19RIC5FXHPTP1TjC+nW5
	 Fxxwk9pDY3s1rNgnXeZ6A3pwWFRmJzzzkKLnwlxEdL/3UySAzFomZeYyix2r7K2vCV
	 XXxKUpFV34e4A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RQcKg6s00z4wZn;
	Wed, 16 Aug 2023 15:35:19 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Nicholas Piggin
 <npiggin@gmail.com>
Subject: Re: [PATCH v2] powerpc/ptrace: Split gpr32_set_common
In-Reply-To: <b8d6ae4483fcfd17524e79d803c969694a85cc02.1687428075.git.christophe.leroy@csgroup.eu>
References: <b8d6ae4483fcfd17524e79d803c969694a85cc02.1687428075.git.christophe.leroy@csgroup.eu>
Date: Wed, 16 Aug 2023 15:35:16 +1000
Message-ID: <87fs4jczxn.fsf@mail.lhotse>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> objtool report the following warning:
>
>   arch/powerpc/kernel/ptrace/ptrace-view.o: warning: objtool:
>     gpr32_set_common+0x23c (.text+0x860): redundant UACCESS disable
>
> gpr32_set_common() conditionnaly opens and closes UACCESS based on
> whether kbuf point is NULL or not. This is wackelig.
>
> Split gpr32_set_common() in two fonctions, one for user one for
> kernel.
>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
> v2: Mark gpr32_set_common_kernel() and gpr32_set_common_user() static
> ---
>  arch/powerpc/kernel/ptrace/ptrace-view.c | 106 ++++++++++++++---------
>  1 file changed, 67 insertions(+), 39 deletions(-)
>
> diff --git a/arch/powerpc/kernel/ptrace/ptrace-view.c b/arch/powerpc/kernel/ptrace/ptrace-view.c
> index 3910cd7bb2d9..42abbed452cd 100644
> --- a/arch/powerpc/kernel/ptrace/ptrace-view.c
> +++ b/arch/powerpc/kernel/ptrace/ptrace-view.c
> @@ -716,73 +716,89 @@ int gpr32_get_common(struct task_struct *target,
>  	return membuf_zero(&to, (ELF_NGREG - PT_REGS_COUNT) * sizeof(u32));
>  }
>  
> -int gpr32_set_common(struct task_struct *target,
> -		     const struct user_regset *regset,
> -		     unsigned int pos, unsigned int count,
> -		     const void *kbuf, const void __user *ubuf,
> -		     unsigned long *regs)
> +static int gpr32_set_common_kernel(struct task_struct *target,
> +				   const struct user_regset *regset,
> +				   unsigned int pos, unsigned int count,
> +				   const void *kbuf, unsigned long *regs)
>  {
>  	const compat_ulong_t *k = kbuf;
> +
> +	pos /= sizeof(compat_ulong_t);
> +	count /= sizeof(compat_ulong_t);
> +
> +	for (; count > 0 && pos < PT_MSR; --count)
> +		regs[pos++] = *k++;
> +
> +	if (count > 0 && pos == PT_MSR) {
> +		set_user_msr(target, *k++);
> +		++pos;
> +		--count;
> +	}
> +
> +	for (; count > 0 && pos <= PT_MAX_PUT_REG; --count)
> +		regs[pos++] = *k++;
> +	for (; count > 0 && pos < PT_TRAP; --count, ++pos)
> +		++k;
> +
> +	if (count > 0 && pos == PT_TRAP) {
> +		set_user_trap(target, *k++);
> +		++pos;
> +		--count;
> +	}
> +
> +	kbuf = k;
> +	pos *= sizeof(compat_ulong_t);
> +	count *= sizeof(compat_ulong_t);
> +	user_regset_copyin_ignore(&pos, &count, &kbuf, NULL,
> +				  (PT_TRAP + 1) * sizeof(compat_ulong_t), -1);
> +	return 0;
> +}
> +
> +static int gpr32_set_common_user(struct task_struct *target,
> +				 const struct user_regset *regset,
> +				 unsigned int pos, unsigned int count,
> +				 const void __user *ubuf, unsigned long *regs)
> +{
>  	const compat_ulong_t __user *u = ubuf;
>  	compat_ulong_t reg;
>  
> -	if (!kbuf && !user_read_access_begin(u, count))
> +	if (!user_read_access_begin(u, count))
>  		return -EFAULT;
>  
>  	pos /= sizeof(reg);
>  	count /= sizeof(reg);
>  
> -	if (kbuf)
> -		for (; count > 0 && pos < PT_MSR; --count)
> -			regs[pos++] = *k++;
> -	else
> -		for (; count > 0 && pos < PT_MSR; --count) {
> -			unsafe_get_user(reg, u++, Efault);
> -			regs[pos++] = reg;
> -		}
> -
> +	for (; count > 0 && pos < PT_MSR; --count) {
> +		unsafe_get_user(reg, u++, Efault);
> +		regs[pos++] = reg;
> +	}
>  
>  	if (count > 0 && pos == PT_MSR) {
> -		if (kbuf)
> -			reg = *k++;
> -		else
> -			unsafe_get_user(reg, u++, Efault);
> +		unsafe_get_user(reg, u++, Efault);
>  		set_user_msr(target, reg);
>  		++pos;
>  		--count;
>  	}
>  
> -	if (kbuf) {
> -		for (; count > 0 && pos <= PT_MAX_PUT_REG; --count)
> -			regs[pos++] = *k++;
> -		for (; count > 0 && pos < PT_TRAP; --count, ++pos)
> -			++k;
> -	} else {
> -		for (; count > 0 && pos <= PT_MAX_PUT_REG; --count) {
> -			unsafe_get_user(reg, u++, Efault);
> -			regs[pos++] = reg;
> -		}
> -		for (; count > 0 && pos < PT_TRAP; --count, ++pos)
> -			unsafe_get_user(reg, u++, Efault);
> +	for (; count > 0 && pos <= PT_MAX_PUT_REG; --count) {
> +		unsafe_get_user(reg, u++, Efault);
> +		regs[pos++] = reg;
>  	}
> +	for (; count > 0 && pos < PT_TRAP; --count, ++pos)
> +		unsafe_get_user(reg, u++, Efault);
>  
>  	if (count > 0 && pos == PT_TRAP) {
> -		if (kbuf)
> -			reg = *k++;
> -		else
> -			unsafe_get_user(reg, u++, Efault);
> +		unsafe_get_user(reg, u++, Efault);
>  		set_user_trap(target, reg);
>  		++pos;
>  		--count;
>  	}
> -	if (!kbuf)
> -		user_read_access_end();
> +	user_read_access_end();
>  
> -	kbuf = k;
>  	ubuf = u;
>  	pos *= sizeof(reg);
>  	count *= sizeof(reg);
> -	user_regset_copyin_ignore(&pos, &count, &kbuf, &ubuf,
> +	user_regset_copyin_ignore(&pos, &count, NULL, &ubuf,
>  				  (PT_TRAP + 1) * sizeof(reg), -1);
>  	return 0;

This was oopsing:

    [ 1508.081530][T16432] BUG: Kernel NULL pointer dereference on read at 0x00000000
    [ 1508.081551][T16432] Faulting instruction address: 0xc00000000002c690
    [ 1508.081558][T16432] Oops: Kernel access of bad area, sig: 11 [#2]
    [ 1508.081565][T16432] BE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=64 NUMA pSeries
    [ 1508.081573][T16432] Modules linked in:
    [ 1508.081580][T16432] CPU: 0 PID: 16432 Comm: ptrace-gpr Tainted: G      D            6.5.0-rc3-00069-gb23dade91efd #1
    [ 1508.081589][T16432] Hardware name: IBM,9117-MMA POWER6 (raw) 0x3e0301 0xf000002 of:IBM,EM350_176 hv:phyp pSeries
    [ 1508.081597][T16432] NIP:  c00000000002c690 LR: c00000000002f0f0 CTR: 0000000000000000
    [ 1508.081604][T16432] REGS: c00000002000ba80 TRAP: 0300   Tainted: G      D             (6.5.0-rc3-00069-gb23dade91efd)
    [ 1508.081612][T16432] MSR:  8000000000009032 <SF,EE,ME,IR,DR,RI>  CR: 24004224  XER: 00000000
    [ 1508.081632][T16432] CFAR: c00000000002c82c DAR: 0000000000000000 DSISR: 40000000 IRQMASK: 0
    [ 1508.081632][T16432] GPR00: c00000000002f0f0 c00000002000bd20 c000000001347e00 c00000002116ab80
    [ 1508.081632][T16432] GPR04: 0000000000000005 0000000010030270 000000000000002d c00000002aa3bfb0
    [ 1508.081632][T16432] GPR08: c00000002aa3be80 0000000000000000 0000000000000000 0000000000000000
    [ 1508.081632][T16432] GPR12: c00000000002d370 c0000000019f0000 0000000000000000 0000000000000000
    [ 1508.081632][T16432] GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
    [ 1508.081632][T16432] GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
    [ 1508.081632][T16432] GPR24: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
    [ 1508.081632][T16432] GPR28: 00000000100301d0 00000000100301d0 000000000000000c 00000000000000a4
    [ 1508.081735][T16432] NIP [c00000000002c690] gpr32_set_common_user.isra.0+0x160/0x490
    [ 1508.081748][T16432] LR [c00000000002f0f0] compat_arch_ptrace+0x4a0/0xaf0
    [ 1508.081756][T16432] Call Trace:
    [ 1508.081760][T16432] [c00000002000bd20] [c00000002000bd60] 0xc00000002000bd60 (unreliable)
    [ 1508.081771][T16432] [c00000002000bd50] [c00000000002f0f0] compat_arch_ptrace+0x4a0/0xaf0
    [ 1508.081781][T16432] [c00000002000bdc0] [c000000000176734] compat_sys_ptrace+0x174/0x1e0
    [ 1508.081791][T16432] [c00000002000be10] [c00000000002b404] system_call_exception+0x374/0x380
    [ 1508.081803][T16432] [c00000002000be50] [c00000000000cb54] system_call_common+0xf4/0x258


Because user_regset_copyin_ignore() always dereferences kbuf:

    static inline void user_regset_copyin_ignore(unsigned int *pos,
    					     unsigned int *count,
    					     const void **kbuf,
    					     const void __user **ubuf,
    					     const int start_pos,
    					     const int end_pos)
    {
    	if (*count == 0)
    		return;
    	BUG_ON(*pos < start_pos);
    	if (end_pos < 0 || *pos < end_pos) {
    		unsigned int copy = (end_pos < 0 ? *count
    				     : min(*count, end_pos - *pos));
    		if (*kbuf)
    			*kbuf += copy;


I fixed it with:

diff --git a/arch/powerpc/kernel/ptrace/ptrace-view.c b/arch/powerpc/kernel/ptrace/ptrace-view.c
index 42abbed452cd..584cf5c3df50 100644
--- a/arch/powerpc/kernel/ptrace/ptrace-view.c
+++ b/arch/powerpc/kernel/ptrace/ptrace-view.c
@@ -760,6 +760,7 @@ static int gpr32_set_common_user(struct task_struct *target,
 				 const void __user *ubuf, unsigned long *regs)
 {
 	const compat_ulong_t __user *u = ubuf;
+	const void *kbuf = NULL;
 	compat_ulong_t reg;
 
 	if (!user_read_access_begin(u, count))
@@ -798,7 +799,7 @@ static int gpr32_set_common_user(struct task_struct *target,
 	ubuf = u;
 	pos *= sizeof(reg);
 	count *= sizeof(reg);
-	user_regset_copyin_ignore(&pos, &count, NULL, &ubuf,
+	user_regset_copyin_ignore(&pos, &count, &kbuf, &ubuf,
 				  (PT_TRAP + 1) * sizeof(reg), -1);
 	return 0;
 

cheers
