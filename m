Return-Path: <linuxppc-dev+bounces-15176-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C06CEF8B4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 03 Jan 2026 01:28:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4djhHB0zJlz2xpl;
	Sat, 03 Jan 2026 11:28:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.208.47
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767400086;
	cv=none; b=aYLp2uNNxM3CdYhSfF51/DqZcnTvgbAN3NSLOnE4nG2cARHHu0UYZ/xnPAGieU8/6iTb2A7ivCr7jG122UJfQRlPXjkmqE8t8ho8Fq09/mlFFuBK+A+PREyvw1ybSmdNi94iKoXxqLdE3HftyMoFmon1/yBxJMHTaF6lCPPybLT+6IZd8P4znwQrXDSzbM4A7VLRGoKox5A+cN9cHp7fwKINQpSOOi4vy0fbNoCn11zl/gWE7akstGSvQB6yT8rbrHsKKRMy8FyDsHwWxgmqUwAlyFl60koHDWYGhITHQYhHGtPMONQ/9XEhZ82B//2IfnjVyAPtLrjjDygpTCHn8A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767400086; c=relaxed/relaxed;
	bh=Lu2XOwAewPAf2hIqWYAVG0zECJ1HMFf+2EIxiKJs26A=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YvQjXd9LSIp1QWXKiMI+35+6bwc22Cr3yYpXZSY3msqnTipqu9LRrfCmgWSs7L3PtuvhQZZnYOY5LxSTESZXhJ2c5ScLAOtCE5vwf7cDoM78B6oeTV6H7o72s/VTcBnN82oWfzGQzifHbMoEh6hJeL8RqAmQHL3TlgCTsZcHXKQWhnhAiniCkgUMfKfkEamQVyGLlQQ2mWlK2JHLHLPLwKIIAtehUSQ9Ak9J9OfBO1C0Yc0IJ4uyMxrrs/Dly0E4HRkVGAI9ODWAFrHmYwgEgRzrQ751AD8aGG9Z8+FBFkUz3wDPPpfkRkZkbOXy6lox47YYkxAZeP3qsQ54KeaCug==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ahE0ofvY; dkim-atps=neutral; spf=pass (client-ip=209.85.208.47; helo=mail-ed1-f47.google.com; envelope-from=david.laight.linux@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ahE0ofvY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.208.47; helo=mail-ed1-f47.google.com; envelope-from=david.laight.linux@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4djhH83JrWz2xl0
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 03 Jan 2026 11:28:03 +1100 (AEDT)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-64b560e425eso16393095a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Jan 2026 16:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767400020; x=1768004820; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lu2XOwAewPAf2hIqWYAVG0zECJ1HMFf+2EIxiKJs26A=;
        b=ahE0ofvYXkH6qdsmo3ZOYRo3a3Dm7WSY0JnaKfACQisFWuplAVbXneeCvQ7NUeru69
         J2GhGRiwg5L9lKyOcTStHB/HHyFlDtqEyR6rgHccsQxqm+UEWG4yedX/b1jqJRMowrfg
         GomnzKDzYpJtH7dMZviHNNPbf9/RMim0crop2BoJE6lXTFxpe/xtup107HeW8Evwsd9W
         VTSNFTLNYvkSBfXAKEnWvn8UJTdEcdoHe4mwQ4VivoOL0DRrohnMryn8UYrIP4S5ge6S
         +2XyMtOSanGiU5EP69McmVBQpRi+FQ6hem6iVKjENu83weqLpimNTXFZaPC8AFLK9xw5
         t7UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767400020; x=1768004820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Lu2XOwAewPAf2hIqWYAVG0zECJ1HMFf+2EIxiKJs26A=;
        b=UrKjBeaffxNkjL66GnKL2V9xy+YVm40+tyKHSb7bv4oJcdkluw3L1Og9jAFgDTvx8U
         HkXB0BsEyNpn1YuD77t5ADYIhznQXhGvJJ3sp2NxEcispTc8FzainwkRxNs/DWtE6qNO
         EAiD76xc6v7CnUQ6C5dZmcFpEZomncBqaROu/jXDYQbmIfe01JJKP0S0YS33G7Y4bJxX
         CZyHjbDJleDNvP5bIm+uKssZeyyCMNWhBUXM6GKaUuyJvuaV0VxH3nbPYQVfQCsut6BI
         bEbeqtS8Rd9Kphu5lOlTHO9lll5Yc9T+wpvh+2rLHQ4NqJX8n59QEoW6kL7/zvlRFtah
         nL1w==
X-Forwarded-Encrypted: i=1; AJvYcCXKSlrUktPY/jDM0qqkPHgpVuR5CL1vYsF6OBSaG9t+iVtvIxhAJDuwUvCfKfDZnNi5yAckvfQKC50Gesk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzAk6To6KuTCHz+gJ3k0ESj1odr9saxloXl7DUegLqnGPASEb93
	JZcdYONNxz5dhWtsoLB1Bqwd/JL1v8QLldvDovHmcV308zQQv2lviexgfSMHhw==
X-Gm-Gg: AY/fxX6dtanK9OH4zu6XvsIOTRWFuVt+GRoM7kymMpJXnRJjEHodR82U1+6LR0ph3aM
	WQaT2YBDMDIeFANkCzxD+bzBWAGOLKAGZxEzIQ/uWAb8khvb0rowwlxf17LQBaleND80bWLf+uN
	qGpiSzC3DwSphiJrVcqTAmj4MnQPravAwd1b1FVN6C0655lagXVC+88nTih1D82P9tQtguQpj2p
	6sm9cLl5yxrJNcTaWDhIFCnc0pxMUcU1DS9f1AceKcFBNCjSqGYvwFyw4OMWnxJZsuSxATBVUKV
	TOO/tD3WDvAkO7DGWWrAhnOLitlkk1KeNsJPDAEcm6Q20vn/mt+6De+vuKfPmHSi6xRW+y/rR7E
	CIZBHpJX1B9P43z+SVyvblDhPbF7i/HaUTzvTy5mtCoeiNMOUxzVZIEVpmW+oWx9qh4uu6gEYme
	TIypU+UWFprqOwBUuH9UhOSdxZx7/4qTR1j3MWL8N4n4C6RaW0EUz4
X-Google-Smtp-Source: AGHT+IFdvdEcrAIYSA22XzNr2wKPflwtXqsVf2mK8AXHiedc5sR4d+y6uOcJKoLds0TT7gNd5aiiog==
X-Received: by 2002:a05:600c:458e:b0:47a:9560:ec28 with SMTP id 5b1f17b1804b1-47d19566d27mr540529425e9.13.1767393875116;
        Fri, 02 Jan 2026 14:44:35 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6d452c69sm6169675e9.9.2026.01.02.14.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 14:44:34 -0800 (PST)
Date: Fri, 2 Jan 2026 22:44:32 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik
 <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Thomas
 Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, Kees Cook
 <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, Arnd
 Bergmann <arnd@arndb.de>, Mark Rutland <mark.rutland@arm.com>, "Jason A.
 Donenfeld" <Jason@zx2c4.com>, Ard Biesheuvel <ardb@kernel.org>, Jeremy
 Linton <jeremy.linton@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-hardening@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH v3 1/3] randomize_kstack: Maintain kstack_offset per
 task
Message-ID: <20260102224432.172b1247@pumpkin>
In-Reply-To: <20260102131156.3265118-2-ryan.roberts@arm.com>
References: <20260102131156.3265118-1-ryan.roberts@arm.com>
	<20260102131156.3265118-2-ryan.roberts@arm.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri,  2 Jan 2026 13:11:52 +0000
Ryan Roberts <ryan.roberts@arm.com> wrote:

> kstack_offset was previously maintained per-cpu, but this caused a
> couple of issues. So let's instead make it per-task.
> 
> Issue 1: add_random_kstack_offset() and choose_random_kstack_offset()
> expected and required to be called with interrupts and preemption
> disabled so that it could manipulate per-cpu state. But arm64, loongarch
> and risc-v are calling them with interrupts and preemption enabled. I
> don't _think_ this causes any functional issues, but it's certainly
> unexpected and could lead to manipulating the wrong cpu's state, which
> could cause a minor performance degradation due to bouncing the cache
> lines. By maintaining the state per-task those functions can safely be
> called in preemptible context.
> 
> Issue 2: add_random_kstack_offset() is called before executing the
> syscall and expands the stack using a previously chosen rnadom offset.
                                                           <>
	David

> choose_random_kstack_offset() is called after executing the syscall and
> chooses and stores a new random offset for the next syscall. With
> per-cpu storage for this offset, an attacker could force cpu migration
> during the execution of the syscall and prevent the offset from being
> updated for the original cpu such that it is predictable for the next
> syscall on that cpu. By maintaining the state per-task, this problem
> goes away because the per-task random offset is updated after the
> syscall regardless of which cpu it is executing on.
> 
> Fixes: 39218ff4c625 ("stack: Optionally randomize kernel stack offset each syscall")
> Closes: https://lore.kernel.org/all/dd8c37bc-795f-4c7a-9086-69e584d8ab24@arm.com/
> Cc: stable@vger.kernel.org
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> ---
>  include/linux/randomize_kstack.h | 26 +++++++++++++++-----------
>  include/linux/sched.h            |  4 ++++
>  init/main.c                      |  1 -
>  kernel/fork.c                    |  2 ++
>  4 files changed, 21 insertions(+), 12 deletions(-)
> 
> diff --git a/include/linux/randomize_kstack.h b/include/linux/randomize_kstack.h
> index 1d982dbdd0d0..5d3916ca747c 100644
> --- a/include/linux/randomize_kstack.h
> +++ b/include/linux/randomize_kstack.h
> @@ -9,7 +9,6 @@
>  
>  DECLARE_STATIC_KEY_MAYBE(CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT,
>  			 randomize_kstack_offset);
> -DECLARE_PER_CPU(u32, kstack_offset);
>  
>  /*
>   * Do not use this anywhere else in the kernel. This is used here because
> @@ -50,15 +49,14 @@ DECLARE_PER_CPU(u32, kstack_offset);
>   * add_random_kstack_offset - Increase stack utilization by previously
>   *			      chosen random offset
>   *
> - * This should be used in the syscall entry path when interrupts and
> - * preempt are disabled, and after user registers have been stored to
> - * the stack. For testing the resulting entropy, please see:
> - * tools/testing/selftests/lkdtm/stack-entropy.sh
> + * This should be used in the syscall entry path after user registers have been
> + * stored to the stack. Preemption may be enabled. For testing the resulting
> + * entropy, please see: tools/testing/selftests/lkdtm/stack-entropy.sh
>   */
>  #define add_random_kstack_offset() do {					\
>  	if (static_branch_maybe(CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT,	\
>  				&randomize_kstack_offset)) {		\
> -		u32 offset = raw_cpu_read(kstack_offset);		\
> +		u32 offset = current->kstack_offset;			\
>  		u8 *ptr = __kstack_alloca(KSTACK_OFFSET_MAX(offset));	\
>  		/* Keep allocation even after "ptr" loses scope. */	\
>  		asm volatile("" :: "r"(ptr) : "memory");		\
> @@ -69,9 +67,9 @@ DECLARE_PER_CPU(u32, kstack_offset);
>   * choose_random_kstack_offset - Choose the random offset for the next
>   *				 add_random_kstack_offset()
>   *
> - * This should only be used during syscall exit when interrupts and
> - * preempt are disabled. This position in the syscall flow is done to
> - * frustrate attacks from userspace attempting to learn the next offset:
> + * This should only be used during syscall exit. Preemption may be enabled. This
> + * position in the syscall flow is done to frustrate attacks from userspace
> + * attempting to learn the next offset:
>   * - Maximize the timing uncertainty visible from userspace: if the
>   *   offset is chosen at syscall entry, userspace has much more control
>   *   over the timing between choosing offsets. "How long will we be in
> @@ -85,14 +83,20 @@ DECLARE_PER_CPU(u32, kstack_offset);
>  #define choose_random_kstack_offset(rand) do {				\
>  	if (static_branch_maybe(CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT,	\
>  				&randomize_kstack_offset)) {		\
> -		u32 offset = raw_cpu_read(kstack_offset);		\
> +		u32 offset = current->kstack_offset;			\
>  		offset = ror32(offset, 5) ^ (rand);			\
> -		raw_cpu_write(kstack_offset, offset);			\
> +		current->kstack_offset = offset;			\
>  	}								\
>  } while (0)
> +
> +static inline void random_kstack_task_init(struct task_struct *tsk)
> +{
> +	tsk->kstack_offset = 0;
> +}
>  #else /* CONFIG_RANDOMIZE_KSTACK_OFFSET */
>  #define add_random_kstack_offset()		do { } while (0)
>  #define choose_random_kstack_offset(rand)	do { } while (0)
> +#define random_kstack_task_init(tsk)		do { } while (0)
>  #endif /* CONFIG_RANDOMIZE_KSTACK_OFFSET */
>  
>  #endif
> diff --git a/include/linux/sched.h b/include/linux/sched.h
> index d395f2810fac..9e0080ed1484 100644
> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
> @@ -1591,6 +1591,10 @@ struct task_struct {
>  	unsigned long			prev_lowest_stack;
>  #endif
>  
> +#ifdef CONFIG_RANDOMIZE_KSTACK_OFFSET
> +	u32				kstack_offset;
> +#endif
> +
>  #ifdef CONFIG_X86_MCE
>  	void __user			*mce_vaddr;
>  	__u64				mce_kflags;
> diff --git a/init/main.c b/init/main.c
> index b84818ad9685..27fcbbde933e 100644
> --- a/init/main.c
> +++ b/init/main.c
> @@ -830,7 +830,6 @@ static inline void initcall_debug_enable(void)
>  #ifdef CONFIG_RANDOMIZE_KSTACK_OFFSET
>  DEFINE_STATIC_KEY_MAYBE_RO(CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT,
>  			   randomize_kstack_offset);
> -DEFINE_PER_CPU(u32, kstack_offset);
>  
>  static int __init early_randomize_kstack_offset(char *buf)
>  {
> diff --git a/kernel/fork.c b/kernel/fork.c
> index b1f3915d5f8e..b061e1edbc43 100644
> --- a/kernel/fork.c
> +++ b/kernel/fork.c
> @@ -95,6 +95,7 @@
>  #include <linux/thread_info.h>
>  #include <linux/kstack_erase.h>
>  #include <linux/kasan.h>
> +#include <linux/randomize_kstack.h>
>  #include <linux/scs.h>
>  #include <linux/io_uring.h>
>  #include <linux/bpf.h>
> @@ -2231,6 +2232,7 @@ __latent_entropy struct task_struct *copy_process(
>  	if (retval)
>  		goto bad_fork_cleanup_io;
>  
> +	random_kstack_task_init(p);
>  	stackleak_task_init(p);
>  
>  	if (pid != &init_struct_pid) {


