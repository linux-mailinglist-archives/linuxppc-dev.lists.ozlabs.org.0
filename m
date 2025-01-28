Return-Path: <linuxppc-dev+bounces-5630-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B81D4A20CD5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jan 2025 16:20:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yj89M3B7Bz2yDS;
	Wed, 29 Jan 2025 02:20:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738077607;
	cv=none; b=NVZi/GhtG5sl6V9+rqeGrbPj+NoPpcqnrI9Bpz6S+cD1oFB4Rr5Qg6USrI+C/VoO8m7nDlamyz6Vp+Xa0L/noih+eWrhPti6XIU1jVBXaAn2kI1d+WmZSWm2BhHnuYzIjHpMW8jNS0aQRBl0i+UTSLjN104L+6i6FVZZh0tqwB9RivUUJ8H4TM+FAJQwIBRtpx7dEGQsWJlprFbS7BKIbRxs1HOZimwM2XLpO7SpaXwIMyAnyQR9ee8XhT4vtiNqF5aNJAIRkBdXSm6PwVlrn/Y0qmoCewSg1TfxcEUyJ8vAM8orUv33thsaHsA/xU79BEVkfTchrImG93ADtBQAiw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738077607; c=relaxed/relaxed;
	bh=uW1GyR5ZQhUYrsvG6sVph7keYa9ixFMKckL0vKUv/lg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XUox35p2zB1SUgumnWzEs+HmEvtnRxKk7qO/IHbdAVv4Z24FlsMxY1x/kYDfIYJTpes3sXiwqPMZ0Gc6wxn8jtEG9PhMhG2DxRZ/bBImCT5SDecqkS2hvj7aq7l/OJ5G/5pRkV9Lrqo8IUH0XCuYJCN7ZvDucoeg+JfmnUEDORyNvaggStSv42saOkuaT0H7Lk8L4HMQM2S1XCHsdo21lElARI1mlX99sUHzu+Hgmu21gvhuYci+373munHevP7g4XyfW6SCne+XnNNSxQMNxn9FUwPyfKVCdh4ow40Z2tHDxjV5QuJQYeIcaWC/kif0iCrGvDs0blQccDM9rUdsCg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yj89K4Mvtz300C
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2025 02:20:05 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Yj7qW139Lz9sSL;
	Tue, 28 Jan 2025 16:04:39 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SG--bol4XQv9; Tue, 28 Jan 2025 16:04:39 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Yj7qV0J3hz9sRy;
	Tue, 28 Jan 2025 16:04:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D97518B76D;
	Tue, 28 Jan 2025 16:04:37 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 1V511-fPm10Y; Tue, 28 Jan 2025 16:04:37 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 0160A8B763;
	Tue, 28 Jan 2025 16:04:34 +0100 (CET)
Message-ID: <df7441ae-e478-4a40-aaa7-461d9b589e06@csgroup.eu>
Date: Tue, 28 Jan 2025 16:04:34 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] syscall.h: add syscall_set_arguments() and
 syscall_set_return_value()
To: "Dmitry V. Levin" <ldv@strace.io>, Oleg Nesterov <oleg@redhat.com>
Cc: Alexey Gladkov <legion@kernel.org>, Charlie Jenkins
 <charlie@rivosinc.com>, Eugene Syromyatnikov <evgsyr@gmail.com>,
 Mike Frysinger <vapier@gentoo.org>, Renzo Davoli <renzo@cs.unibo.it>,
 Davide Berardi <berardi.dav@gmail.com>, strace-devel@lists.strace.io,
 Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
 Brian Cain <bcain@quicinc.com>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Naveen N Rao <naveen@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 "David S. Miller" <davem@davemloft.net>,
 Andreas Larsson <andreas@gaisler.com>, Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-snps-arc@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
 linux-arch@vger.kernel.org
References: <20250128091626.GB8601@strace.io>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250128091626.GB8601@strace.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 28/01/2025 à 10:16, Dmitry V. Levin a écrit :
> These functions are going to be needed on all HAVE_ARCH_TRACEHOOK
> architectures to implement PTRACE_SET_SYSCALL_INFO API.

The subject is misleading. syscall_set_return_value() already exists on 
most architectures and was not addressed by commit 7962c2eddbfe.

Maybe it would be better to handle syscall_set_return_value() in a 
separate commit.

> 
> This partially reverts commit 7962c2eddbfe ("arch: remove unused
> function syscall_set_arguments()") by reusing some of old
> syscall_set_arguments() implementations.
> 
> Signed-off-by: Dmitry V. Levin <ldv@strace.io>
> Tested-by: Charlie Jenkins <charlie@rivosinc.com>
> Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
> ---
>   arch/arc/include/asm/syscall.h        | 14 +++++++++++
>   arch/arm/include/asm/syscall.h        | 13 ++++++++++
>   arch/arm64/include/asm/syscall.h      | 13 ++++++++++
>   arch/csky/include/asm/syscall.h       | 13 ++++++++++
>   arch/hexagon/include/asm/syscall.h    | 14 +++++++++++
>   arch/loongarch/include/asm/syscall.h  |  8 ++++++
>   arch/mips/include/asm/syscall.h       | 32 ++++++++++++++++++++++++
>   arch/nios2/include/asm/syscall.h      | 11 ++++++++
>   arch/openrisc/include/asm/syscall.h   |  7 ++++++
>   arch/parisc/include/asm/syscall.h     | 12 +++++++++
>   arch/powerpc/include/asm/syscall.h    | 10 ++++++++
>   arch/riscv/include/asm/syscall.h      |  9 +++++++
>   arch/s390/include/asm/syscall.h       | 12 +++++++++
>   arch/sh/include/asm/syscall_32.h      | 12 +++++++++
>   arch/sparc/include/asm/syscall.h      | 10 ++++++++
>   arch/um/include/asm/syscall-generic.h | 14 +++++++++++
>   arch/x86/include/asm/syscall.h        | 36 +++++++++++++++++++++++++++
>   arch/xtensa/include/asm/syscall.h     | 11 ++++++++
>   include/asm-generic/syscall.h         | 16 ++++++++++++
>   19 files changed, 267 insertions(+)
> 
> diff --git a/arch/arc/include/asm/syscall.h b/arch/arc/include/asm/syscall.h
> index 9709256e31c8..89c1e1736356 100644
> --- a/arch/arc/include/asm/syscall.h
> +++ b/arch/arc/include/asm/syscall.h
> @@ -67,6 +67,20 @@ syscall_get_arguments(struct task_struct *task, struct pt_regs *regs,
>   	}
>   }
>   
> +static inline void
> +syscall_set_arguments(struct task_struct *task, struct pt_regs *regs,
> +		      unsigned long *args)
> +{
> +	unsigned long *inside_ptregs = &regs->r0;
> +	unsigned int n = 6;
> +	unsigned int i = 0;
> +
> +	while (n--) {
> +		*inside_ptregs = args[i++];
> +		inside_ptregs--;
> +	}
> +}
> +
>   static inline int
>   syscall_get_arch(struct task_struct *task)
>   {
> diff --git a/arch/arm/include/asm/syscall.h b/arch/arm/include/asm/syscall.h
> index fe4326d938c1..21927fa0ae2b 100644
> --- a/arch/arm/include/asm/syscall.h
> +++ b/arch/arm/include/asm/syscall.h
> @@ -80,6 +80,19 @@ static inline void syscall_get_arguments(struct task_struct *task,
>   	memcpy(args, &regs->ARM_r0 + 1, 5 * sizeof(args[0]));
>   }
>   
> +static inline void syscall_set_arguments(struct task_struct *task,
> +					 struct pt_regs *regs,
> +					 const unsigned long *args)
> +{
> +	memcpy(&regs->ARM_r0, args, 6 * sizeof(args[0]));
> +	/*
> +	 * Also copy the first argument into ARM_ORIG_r0
> +	 * so that syscall_get_arguments() would return it
> +	 * instead of the previous value.
> +	 */
> +	regs->ARM_ORIG_r0 = regs->ARM_r0;
> +}
> +
>   static inline int syscall_get_arch(struct task_struct *task)
>   {
>   	/* ARM tasks don't change audit architectures on the fly. */
> diff --git a/arch/arm64/include/asm/syscall.h b/arch/arm64/include/asm/syscall.h
> index ab8e14b96f68..76020b66286b 100644
> --- a/arch/arm64/include/asm/syscall.h
> +++ b/arch/arm64/include/asm/syscall.h
> @@ -73,6 +73,19 @@ static inline void syscall_get_arguments(struct task_struct *task,
>   	memcpy(args, &regs->regs[1], 5 * sizeof(args[0]));
>   }
>   
> +static inline void syscall_set_arguments(struct task_struct *task,
> +					 struct pt_regs *regs,
> +					 const unsigned long *args)
> +{
> +	memcpy(&regs->regs[0], args, 6 * sizeof(args[0]));
> +	/*
> +	 * Also copy the first argument into orig_x0
> +	 * so that syscall_get_arguments() would return it
> +	 * instead of the previous value.
> +	 */
> +	regs->orig_x0 = regs->regs[0];
> +}
> +
>   /*
>    * We don't care about endianness (__AUDIT_ARCH_LE bit) here because
>    * AArch64 has the same system calls both on little- and big- endian.
> diff --git a/arch/csky/include/asm/syscall.h b/arch/csky/include/asm/syscall.h
> index 0de5734950bf..30403f7a0487 100644
> --- a/arch/csky/include/asm/syscall.h
> +++ b/arch/csky/include/asm/syscall.h
> @@ -59,6 +59,19 @@ syscall_get_arguments(struct task_struct *task, struct pt_regs *regs,
>   	memcpy(args, &regs->a1, 5 * sizeof(args[0]));
>   }
>   
> +static inline void
> +syscall_set_arguments(struct task_struct *task, struct pt_regs *regs,
> +		      const unsigned long *args)
> +{
> +	memcpy(&regs->a0, args, 6 * sizeof(regs->a0));
> +	/*
> +	 * Also copy the first argument into orig_x0
> +	 * so that syscall_get_arguments() would return it
> +	 * instead of the previous value.
> +	 */
> +	regs->orig_a0 = regs->a0;
> +}
> +
>   static inline int
>   syscall_get_arch(struct task_struct *task)
>   {
> diff --git a/arch/hexagon/include/asm/syscall.h b/arch/hexagon/include/asm/syscall.h
> index f6e454f18038..1024a6548d78 100644
> --- a/arch/hexagon/include/asm/syscall.h
> +++ b/arch/hexagon/include/asm/syscall.h
> @@ -33,6 +33,13 @@ static inline void syscall_get_arguments(struct task_struct *task,
>   	memcpy(args, &(&regs->r00)[0], 6 * sizeof(args[0]));
>   }
>   
> +static inline void syscall_set_arguments(struct task_struct *task,
> +					 struct pt_regs *regs,
> +					 unsigned long *args)
> +{
> +	memcpy(&(&regs->r00)[0], args, 6 * sizeof(args[0]));
> +}
> +
>   static inline long syscall_get_error(struct task_struct *task,
>   				     struct pt_regs *regs)
>   {
> @@ -45,6 +52,13 @@ static inline long syscall_get_return_value(struct task_struct *task,
>   	return regs->r00;
>   }
>   
> +static inline void syscall_set_return_value(struct task_struct *task,
> +					    struct pt_regs *regs,
> +					    int error, long val)
> +{
> +	regs->r00 = (long) error ?: val;
> +}
> +
>   static inline int syscall_get_arch(struct task_struct *task)
>   {
>   	return AUDIT_ARCH_HEXAGON;
> diff --git a/arch/loongarch/include/asm/syscall.h b/arch/loongarch/include/asm/syscall.h
> index e286dc58476e..ff415b3c0a8e 100644
> --- a/arch/loongarch/include/asm/syscall.h
> +++ b/arch/loongarch/include/asm/syscall.h
> @@ -61,6 +61,14 @@ static inline void syscall_get_arguments(struct task_struct *task,
>   	memcpy(&args[1], &regs->regs[5], 5 * sizeof(long));
>   }
>   
> +static inline void syscall_set_arguments(struct task_struct *task,
> +					 struct pt_regs *regs,
> +					 unsigned long *args)
> +{
> +	regs->orig_a0 = args[0];
> +	memcpy(&regs->regs[5], &args[1], 5 * sizeof(long));
> +}
> +
>   static inline int syscall_get_arch(struct task_struct *task)
>   {
>   	return AUDIT_ARCH_LOONGARCH64;
> diff --git a/arch/mips/include/asm/syscall.h b/arch/mips/include/asm/syscall.h
> index b3f00ede8bb3..2dcc1d01b405 100644
> --- a/arch/mips/include/asm/syscall.h
> +++ b/arch/mips/include/asm/syscall.h
> @@ -74,6 +74,23 @@ static inline void mips_get_syscall_arg(unsigned long *arg,
>   #endif
>   }
>   
> +static inline void mips_set_syscall_arg(unsigned long *arg,
> +	struct task_struct *task, struct pt_regs *regs, unsigned int n)
> +{
> +#ifdef CONFIG_32BIT
> +	switch (n) {
> +	case 0: case 1: case 2: case 3:
> +		regs->regs[4 + n] = *arg;
> +		return;
> +	case 4: case 5: case 6: case 7:
> +		*arg = regs->pad0[n] = *arg;
> +		return;
> +	}
> +#else
> +	regs->regs[4 + n] = *arg;
> +#endif
> +}
> +
>   static inline long syscall_get_error(struct task_struct *task,
>   				     struct pt_regs *regs)
>   {
> @@ -120,6 +137,21 @@ static inline void syscall_get_arguments(struct task_struct *task,
>   		mips_get_syscall_arg(args++, task, regs, i++);
>   }
>   
> +static inline void syscall_set_arguments(struct task_struct *task,
> +					 struct pt_regs *regs,
> +					 unsigned long *args)
> +{
> +	unsigned int i = 0;
> +	unsigned int n = 6;
> +
> +	/* O32 ABI syscall() */
> +	if (mips_syscall_is_indirect(task, regs))
> +		i++;
> +
> +	while (n--)
> +		mips_set_syscall_arg(args++, task, regs, i++);
> +}
> +
>   extern const unsigned long sys_call_table[];
>   extern const unsigned long sys32_call_table[];
>   extern const unsigned long sysn32_call_table[];
> diff --git a/arch/nios2/include/asm/syscall.h b/arch/nios2/include/asm/syscall.h
> index fff52205fb65..526449edd768 100644
> --- a/arch/nios2/include/asm/syscall.h
> +++ b/arch/nios2/include/asm/syscall.h
> @@ -58,6 +58,17 @@ static inline void syscall_get_arguments(struct task_struct *task,
>   	*args   = regs->r9;
>   }
>   
> +static inline void syscall_set_arguments(struct task_struct *task,
> +	struct pt_regs *regs, const unsigned long *args)
> +{
> +	regs->r4 = *args++;
> +	regs->r5 = *args++;
> +	regs->r6 = *args++;
> +	regs->r7 = *args++;
> +	regs->r8 = *args++;
> +	regs->r9 = *args;
> +}
> +
>   static inline int syscall_get_arch(struct task_struct *task)
>   {
>   	return AUDIT_ARCH_NIOS2;
> diff --git a/arch/openrisc/include/asm/syscall.h b/arch/openrisc/include/asm/syscall.h
> index 903ed882bdec..e6383be2a195 100644
> --- a/arch/openrisc/include/asm/syscall.h
> +++ b/arch/openrisc/include/asm/syscall.h
> @@ -57,6 +57,13 @@ syscall_get_arguments(struct task_struct *task, struct pt_regs *regs,
>   	memcpy(args, &regs->gpr[3], 6 * sizeof(args[0]));
>   }
>   
> +static inline void
> +syscall_set_arguments(struct task_struct *task, struct pt_regs *regs,
> +		      const unsigned long *args)
> +{
> +	memcpy(&regs->gpr[3], args, 6 * sizeof(args[0]));
> +}
> +
>   static inline int syscall_get_arch(struct task_struct *task)
>   {
>   	return AUDIT_ARCH_OPENRISC;
> diff --git a/arch/parisc/include/asm/syscall.h b/arch/parisc/include/asm/syscall.h
> index 00b127a5e09b..b146d0ae4c77 100644
> --- a/arch/parisc/include/asm/syscall.h
> +++ b/arch/parisc/include/asm/syscall.h
> @@ -29,6 +29,18 @@ static inline void syscall_get_arguments(struct task_struct *tsk,
>   	args[0] = regs->gr[26];
>   }
>   
> +static inline void syscall_set_arguments(struct task_struct *tsk,
> +					 struct pt_regs *regs,
> +					 unsigned long *args)
> +{
> +	regs->gr[21] = args[5];
> +	regs->gr[22] = args[4];
> +	regs->gr[23] = args[3];
> +	regs->gr[24] = args[2];
> +	regs->gr[25] = args[1];
> +	regs->gr[26] = args[0];
> +}
> +
>   static inline long syscall_get_error(struct task_struct *task,
>   				     struct pt_regs *regs)
>   {
> diff --git a/arch/powerpc/include/asm/syscall.h b/arch/powerpc/include/asm/syscall.h
> index 422d7735ace6..521f279e6b33 100644
> --- a/arch/powerpc/include/asm/syscall.h
> +++ b/arch/powerpc/include/asm/syscall.h
> @@ -114,6 +114,16 @@ static inline void syscall_get_arguments(struct task_struct *task,
>   	}
>   }
>   
> +static inline void syscall_set_arguments(struct task_struct *task,
> +					 struct pt_regs *regs,
> +					 const unsigned long *args)
> +{
> +	memcpy(&regs->gpr[3], args, 6 * sizeof(args[0]));
> +
> +	/* Also copy the first argument into orig_gpr3 */
> +	regs->orig_gpr3 = args[0];
> +}
> +
>   static inline int syscall_get_arch(struct task_struct *task)
>   {
>   	if (is_tsk_32bit_task(task))
> diff --git a/arch/riscv/include/asm/syscall.h b/arch/riscv/include/asm/syscall.h
> index 121fff429dce..8d389ba995c8 100644
> --- a/arch/riscv/include/asm/syscall.h
> +++ b/arch/riscv/include/asm/syscall.h
> @@ -66,6 +66,15 @@ static inline void syscall_get_arguments(struct task_struct *task,
>   	memcpy(args, &regs->a1, 5 * sizeof(args[0]));
>   }
>   
> +static inline void syscall_set_arguments(struct task_struct *task,
> +					 struct pt_regs *regs,
> +					 const unsigned long *args)
> +{
> +	regs->orig_a0 = args[0];
> +	args++;
> +	memcpy(&regs->a1, args, 5 * sizeof(regs->a1));
> +}
> +
>   static inline int syscall_get_arch(struct task_struct *task)
>   {
>   #ifdef CONFIG_64BIT
> diff --git a/arch/s390/include/asm/syscall.h b/arch/s390/include/asm/syscall.h
> index 27e3d804b311..b3dd883699e7 100644
> --- a/arch/s390/include/asm/syscall.h
> +++ b/arch/s390/include/asm/syscall.h
> @@ -78,6 +78,18 @@ static inline void syscall_get_arguments(struct task_struct *task,
>   	args[0] = regs->orig_gpr2 & mask;
>   }
>   
> +static inline void syscall_set_arguments(struct task_struct *task,
> +					 struct pt_regs *regs,
> +					 const unsigned long *args)
> +{
> +	unsigned int n = 6;
> +
> +	while (n-- > 0)
> +		if (n > 0)
> +			regs->gprs[2 + n] = args[n];
> +	regs->orig_gpr2 = args[0];
> +}
> +
>   static inline int syscall_get_arch(struct task_struct *task)
>   {
>   #ifdef CONFIG_COMPAT
> diff --git a/arch/sh/include/asm/syscall_32.h b/arch/sh/include/asm/syscall_32.h
> index d87738eebe30..cb51a7528384 100644
> --- a/arch/sh/include/asm/syscall_32.h
> +++ b/arch/sh/include/asm/syscall_32.h
> @@ -57,6 +57,18 @@ static inline void syscall_get_arguments(struct task_struct *task,
>   	args[0] = regs->regs[4];
>   }
>   
> +static inline void syscall_set_arguments(struct task_struct *task,
> +					 struct pt_regs *regs,
> +					 const unsigned long *args)
> +{
> +	regs->regs[1] = args[5];
> +	regs->regs[0] = args[4];
> +	regs->regs[7] = args[3];
> +	regs->regs[6] = args[2];
> +	regs->regs[5] = args[1];
> +	regs->regs[4] = args[0];
> +}
> +
>   static inline int syscall_get_arch(struct task_struct *task)
>   {
>   	int arch = AUDIT_ARCH_SH;
> diff --git a/arch/sparc/include/asm/syscall.h b/arch/sparc/include/asm/syscall.h
> index 20c109ac8cc9..62a5a78804c4 100644
> --- a/arch/sparc/include/asm/syscall.h
> +++ b/arch/sparc/include/asm/syscall.h
> @@ -117,6 +117,16 @@ static inline void syscall_get_arguments(struct task_struct *task,
>   	}
>   }
>   
> +static inline void syscall_set_arguments(struct task_struct *task,
> +					 struct pt_regs *regs,
> +					 const unsigned long *args)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < 6; i++)
> +		regs->u_regs[UREG_I0 + i] = args[i];
> +}
> +
>   static inline int syscall_get_arch(struct task_struct *task)
>   {
>   #if defined(CONFIG_SPARC64) && defined(CONFIG_COMPAT)
> diff --git a/arch/um/include/asm/syscall-generic.h b/arch/um/include/asm/syscall-generic.h
> index 172b74143c4b..2984feb9d576 100644
> --- a/arch/um/include/asm/syscall-generic.h
> +++ b/arch/um/include/asm/syscall-generic.h
> @@ -62,6 +62,20 @@ static inline void syscall_get_arguments(struct task_struct *task,
>   	*args   = UPT_SYSCALL_ARG6(r);
>   }
>   
> +static inline void syscall_set_arguments(struct task_struct *task,
> +					 struct pt_regs *regs,
> +					 const unsigned long *args)
> +{
> +	struct uml_pt_regs *r = &regs->regs;
> +
> +	UPT_SYSCALL_ARG1(r) = *args++;
> +	UPT_SYSCALL_ARG2(r) = *args++;
> +	UPT_SYSCALL_ARG3(r) = *args++;
> +	UPT_SYSCALL_ARG4(r) = *args++;
> +	UPT_SYSCALL_ARG5(r) = *args++;
> +	UPT_SYSCALL_ARG6(r) = *args;
> +}
> +
>   /* See arch/x86/um/asm/syscall.h for syscall_get_arch() definition. */
>   
>   #endif	/* __UM_SYSCALL_GENERIC_H */
> diff --git a/arch/x86/include/asm/syscall.h b/arch/x86/include/asm/syscall.h
> index 7c488ff0c764..b9c249dd9e3d 100644
> --- a/arch/x86/include/asm/syscall.h
> +++ b/arch/x86/include/asm/syscall.h
> @@ -90,6 +90,18 @@ static inline void syscall_get_arguments(struct task_struct *task,
>   	args[5] = regs->bp;
>   }
>   
> +static inline void syscall_set_arguments(struct task_struct *task,
> +					 struct pt_regs *regs,
> +					 const unsigned long *args)
> +{
> +	regs->bx = args[0];
> +	regs->cx = args[1];
> +	regs->dx = args[2];
> +	regs->si = args[3];
> +	regs->di = args[4];
> +	regs->bp = args[5];
> +}
> +
>   static inline int syscall_get_arch(struct task_struct *task)
>   {
>   	return AUDIT_ARCH_I386;
> @@ -121,6 +133,30 @@ static inline void syscall_get_arguments(struct task_struct *task,
>   	}
>   }
>   
> +static inline void syscall_set_arguments(struct task_struct *task,
> +					 struct pt_regs *regs,
> +					 const unsigned long *args)
> +{
> +# ifdef CONFIG_IA32_EMULATION
> +	if (task->thread_info.status & TS_COMPAT) {
> +		regs->bx = *args++;
> +		regs->cx = *args++;
> +		regs->dx = *args++;
> +		regs->si = *args++;
> +		regs->di = *args++;
> +		regs->bp = *args;
> +	} else
> +# endif
> +	{
> +		regs->di = *args++;
> +		regs->si = *args++;
> +		regs->dx = *args++;
> +		regs->r10 = *args++;
> +		regs->r8 = *args++;
> +		regs->r9 = *args;
> +	}
> +}
> +
>   static inline int syscall_get_arch(struct task_struct *task)
>   {
>   	/* x32 tasks should be considered AUDIT_ARCH_X86_64. */
> diff --git a/arch/xtensa/include/asm/syscall.h b/arch/xtensa/include/asm/syscall.h
> index 5ee974bf8330..f9a671cbf933 100644
> --- a/arch/xtensa/include/asm/syscall.h
> +++ b/arch/xtensa/include/asm/syscall.h
> @@ -68,6 +68,17 @@ static inline void syscall_get_arguments(struct task_struct *task,
>   		args[i] = regs->areg[reg[i]];
>   }
>   
> +static inline void syscall_set_arguments(struct task_struct *task,
> +					 struct pt_regs *regs,
> +					 const unsigned long *args)
> +{
> +	static const unsigned int reg[] = XTENSA_SYSCALL_ARGUMENT_REGS;
> +	unsigned int i;
> +
> +	for (i = 0; i < 6; ++i)
> +		regs->areg[reg[i]] = args[i];
> +}
> +
>   asmlinkage long xtensa_rt_sigreturn(void);
>   asmlinkage long xtensa_shmat(int, char __user *, int);
>   asmlinkage long xtensa_fadvise64_64(int, int,
> diff --git a/include/asm-generic/syscall.h b/include/asm-generic/syscall.h
> index 5a80fe728dc8..0f7b9a493de7 100644
> --- a/include/asm-generic/syscall.h
> +++ b/include/asm-generic/syscall.h
> @@ -117,6 +117,22 @@ void syscall_set_return_value(struct task_struct *task, struct pt_regs *regs,
>   void syscall_get_arguments(struct task_struct *task, struct pt_regs *regs,
>   			   unsigned long *args);
>   
> +/**
> + * syscall_set_arguments - change system call parameter value
> + * @task:	task of interest, must be in system call entry tracing
> + * @regs:	task_pt_regs() of @task
> + * @args:	array of argument values to store
> + *
> + * Changes 6 arguments to the system call.
> + * The first argument gets value @args[0], and so on.
> + *
> + * It's only valid to call this when @task is stopped for tracing on
> + * entry to a system call, due to %SYSCALL_WORK_SYSCALL_TRACE or
> + * %SYSCALL_WORK_SYSCALL_AUDIT.
> + */
> +void syscall_set_arguments(struct task_struct *task, struct pt_regs *regs,
> +			   const unsigned long *args);
> +
>   /**
>    * syscall_get_arch - return the AUDIT_ARCH for the current system call
>    * @task:	task of interest, must be blocked


