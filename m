Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0283E4C0704
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 02:43:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K3Jhm23YNz3cPv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 12:43:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=dabbelt-com.20210112.gappssmtp.com header.i=@dabbelt-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=R13J0wSy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=dabbelt.com (client-ip=2607:f8b0:4864:20::536;
 helo=mail-pg1-x536.google.com; envelope-from=palmer@dabbelt.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=dabbelt-com.20210112.gappssmtp.com
 header.i=@dabbelt-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=R13J0wSy; dkim-atps=neutral
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K3JhC3ykQz2xtp
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Feb 2022 12:42:49 +1100 (AEDT)
Received: by mail-pg1-x536.google.com with SMTP id h125so18533835pgc.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Feb 2022 17:42:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=0IocTnUQr6FP+/17h4w0x+BM2h/3A2/lnyC/88qg3Bs=;
 b=R13J0wSyZZPNTQom3AZJOiGLek2zrP20pPQ688zl+tgug5wUJZShU6lCFD37V5/kJp
 JeO7jYxVmvhVcvGj1n5KL9Q5leNxho2H+q5Pxlt52gy6+FNyGIRUndYqBBW1rkixsrQn
 peDHM5f+J+9B99sOO5g+TpAf3ONqTdfm/N6vCqEZV2Svnqg/nAqf9vdSl+i+daj3vc1U
 C8XKnTn6BCH4cMwE9k/lY4QUmhsRFQAVjx+L8JdBqx9yHXc+QtTINrhhuO49G4QEA3UA
 Q/dlrczvS2rvMkquPSkn8hn19cg8tRetRtHaz1nW+sYspoWvvZRKxQo1qzIsn7yCtIBK
 sqJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=0IocTnUQr6FP+/17h4w0x+BM2h/3A2/lnyC/88qg3Bs=;
 b=OVEMIwcoZoCjXkM0XqJXQkX/EA0TefL/Qp581G9ZSw8cPaNNSsvKwPPlb3VlJ9WvJE
 PIhytoeoZEmYaT3xsUX3t3IM6s3yo9y3SUDRNiiAW3N1IRUAHGQNrLXX40F2lASbEv4i
 ug04vca9gM5CdAhTyo2M6LLLIBb5k6lz/SgjrwfXb/JR8gFU12LlqSLQNv8eA3pGd4K5
 Tijc4JyOQ8oB4gJ8iiRmtsGHh9zX/B8GysgQ/QfcB8s33BJ1jPIgCMcfWjSzRzd1m7cw
 RQ/y3mz3gQFYI/DQLQ3V5YmJp/rOY8DmwIn7zkVPTmY96EwZhFuJfStS5+bF8kE8qyYw
 8dVA==
X-Gm-Message-State: AOAM532ae4edk3hNnTe2mjY8mzP9/v80fTzdavP1xeMJHDy7OEF00uNX
 PVNr54hQJIIEXXu5EmoEb3yasw==
X-Google-Smtp-Source: ABdhPJylGwlZ4pkklwCsJ/CgsKStHPUR8auG8o6qbIGMxI7Is7rM/BdMqQ7WDy6q2rxlHdpl/ppf/Q==
X-Received: by 2002:a62:7c56:0:b0:4f0:f268:ec03 with SMTP id
 x83-20020a627c56000000b004f0f268ec03mr20977269pfc.8.1645580567591; 
 Tue, 22 Feb 2022 17:42:47 -0800 (PST)
Received: from localhost ([12.3.194.138])
 by smtp.gmail.com with ESMTPSA id j12sm21551414pgf.63.2022.02.22.17.42.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 17:42:47 -0800 (PST)
Date: Tue, 22 Feb 2022 17:42:47 -0800 (PST)
X-Google-Original-Date: Tue, 22 Feb 2022 15:21:36 PST (-0800)
Subject: Re: [PATCH V5 09/21] riscv: compat: Add basic compat data type
 implementation
In-Reply-To: <20220201150545.1512822-10-guoren@kernel.org>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: guoren@kernel.org
Message-ID: <mhng-c74f1c06-0caa-4a71-82fa-7cf58a1ac0ca@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 guoren@linux.alibaba.com, linux-parisc@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Greg KH <gregkh@linuxfoundation.org>,
 drew@beagleboard.org, anup@brainfault.org, wangjunqiang@iscas.ac.cn,
 x86@kernel.org, linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-mips@vger.kernel.org, guoren@kernel.org, liush@allwinnertech.com,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel@lists.infradead.org, wefu@redhat.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 01 Feb 2022 07:05:33 PST (-0800), guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
>
> Implement riscv asm/compat.h for struct compat_xxx,
> is_compat_task, compat_user_regset, regset convert.
>
> The rv64 compat.h has inherited most of the structs
> from the generic one.
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> ---
>  arch/riscv/include/asm/compat.h      | 129 +++++++++++++++++++++++++++
>  arch/riscv/include/asm/thread_info.h |   1 +
>  2 files changed, 130 insertions(+)
>  create mode 100644 arch/riscv/include/asm/compat.h
>
> diff --git a/arch/riscv/include/asm/compat.h b/arch/riscv/include/asm/compat.h
> new file mode 100644
> index 000000000000..2ac955b51148
> --- /dev/null
> +++ b/arch/riscv/include/asm/compat.h
> @@ -0,0 +1,129 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef __ASM_COMPAT_H
> +#define __ASM_COMPAT_H
> +
> +#define COMPAT_UTS_MACHINE	"riscv\0\0"
> +
> +/*
> + * Architecture specific compatibility types
> + */
> +#include <linux/types.h>
> +#include <linux/sched.h>
> +#include <linux/sched/task_stack.h>
> +#include <asm-generic/compat.h>
> +
> +static inline int is_compat_task(void)
> +{
> +	return test_thread_flag(TIF_32BIT);
> +}
> +
> +struct compat_user_regs_struct {
> +	compat_ulong_t pc;
> +	compat_ulong_t ra;
> +	compat_ulong_t sp;
> +	compat_ulong_t gp;
> +	compat_ulong_t tp;
> +	compat_ulong_t t0;
> +	compat_ulong_t t1;
> +	compat_ulong_t t2;
> +	compat_ulong_t s0;
> +	compat_ulong_t s1;
> +	compat_ulong_t a0;
> +	compat_ulong_t a1;
> +	compat_ulong_t a2;
> +	compat_ulong_t a3;
> +	compat_ulong_t a4;
> +	compat_ulong_t a5;
> +	compat_ulong_t a6;
> +	compat_ulong_t a7;
> +	compat_ulong_t s2;
> +	compat_ulong_t s3;
> +	compat_ulong_t s4;
> +	compat_ulong_t s5;
> +	compat_ulong_t s6;
> +	compat_ulong_t s7;
> +	compat_ulong_t s8;
> +	compat_ulong_t s9;
> +	compat_ulong_t s10;
> +	compat_ulong_t s11;
> +	compat_ulong_t t3;
> +	compat_ulong_t t4;
> +	compat_ulong_t t5;
> +	compat_ulong_t t6;
> +};
> +
> +static inline void regs_to_cregs(struct compat_user_regs_struct *cregs,
> +				 struct pt_regs *regs)
> +{
> +	cregs->pc	= (compat_ulong_t) regs->epc;
> +	cregs->ra	= (compat_ulong_t) regs->ra;
> +	cregs->sp	= (compat_ulong_t) regs->sp;
> +	cregs->gp	= (compat_ulong_t) regs->gp;
> +	cregs->tp	= (compat_ulong_t) regs->tp;
> +	cregs->t0	= (compat_ulong_t) regs->t0;
> +	cregs->t1	= (compat_ulong_t) regs->t1;
> +	cregs->t2	= (compat_ulong_t) regs->t2;
> +	cregs->s0	= (compat_ulong_t) regs->s0;
> +	cregs->s1	= (compat_ulong_t) regs->s1;
> +	cregs->a0	= (compat_ulong_t) regs->a0;
> +	cregs->a1	= (compat_ulong_t) regs->a1;
> +	cregs->a2	= (compat_ulong_t) regs->a2;
> +	cregs->a3	= (compat_ulong_t) regs->a3;
> +	cregs->a4	= (compat_ulong_t) regs->a4;
> +	cregs->a5	= (compat_ulong_t) regs->a5;
> +	cregs->a6	= (compat_ulong_t) regs->a6;
> +	cregs->a7	= (compat_ulong_t) regs->a7;
> +	cregs->s2	= (compat_ulong_t) regs->s2;
> +	cregs->s3	= (compat_ulong_t) regs->s3;
> +	cregs->s4	= (compat_ulong_t) regs->s4;
> +	cregs->s5	= (compat_ulong_t) regs->s5;
> +	cregs->s6	= (compat_ulong_t) regs->s6;
> +	cregs->s7	= (compat_ulong_t) regs->s7;
> +	cregs->s8	= (compat_ulong_t) regs->s8;
> +	cregs->s9	= (compat_ulong_t) regs->s9;
> +	cregs->s10	= (compat_ulong_t) regs->s10;
> +	cregs->s11	= (compat_ulong_t) regs->s11;
> +	cregs->t3	= (compat_ulong_t) regs->t3;
> +	cregs->t4	= (compat_ulong_t) regs->t4;
> +	cregs->t5	= (compat_ulong_t) regs->t5;
> +	cregs->t6	= (compat_ulong_t) regs->t6;
> +};
> +
> +static inline void cregs_to_regs(struct compat_user_regs_struct *cregs,
> +				 struct pt_regs *regs)
> +{
> +	regs->epc	= (unsigned long) cregs->pc;
> +	regs->ra	= (unsigned long) cregs->ra;
> +	regs->sp	= (unsigned long) cregs->sp;
> +	regs->gp	= (unsigned long) cregs->gp;
> +	regs->tp	= (unsigned long) cregs->tp;
> +	regs->t0	= (unsigned long) cregs->t0;
> +	regs->t1	= (unsigned long) cregs->t1;
> +	regs->t2	= (unsigned long) cregs->t2;
> +	regs->s0	= (unsigned long) cregs->s0;
> +	regs->s1	= (unsigned long) cregs->s1;
> +	regs->a0	= (unsigned long) cregs->a0;
> +	regs->a1	= (unsigned long) cregs->a1;
> +	regs->a2	= (unsigned long) cregs->a2;
> +	regs->a3	= (unsigned long) cregs->a3;
> +	regs->a4	= (unsigned long) cregs->a4;
> +	regs->a5	= (unsigned long) cregs->a5;
> +	regs->a6	= (unsigned long) cregs->a6;
> +	regs->a7	= (unsigned long) cregs->a7;
> +	regs->s2	= (unsigned long) cregs->s2;
> +	regs->s3	= (unsigned long) cregs->s3;
> +	regs->s4	= (unsigned long) cregs->s4;
> +	regs->s5	= (unsigned long) cregs->s5;
> +	regs->s6	= (unsigned long) cregs->s6;
> +	regs->s7	= (unsigned long) cregs->s7;
> +	regs->s8	= (unsigned long) cregs->s8;
> +	regs->s9	= (unsigned long) cregs->s9;
> +	regs->s10	= (unsigned long) cregs->s10;
> +	regs->s11	= (unsigned long) cregs->s11;
> +	regs->t3	= (unsigned long) cregs->t3;
> +	regs->t4	= (unsigned long) cregs->t4;
> +	regs->t5	= (unsigned long) cregs->t5;
> +	regs->t6	= (unsigned long) cregs->t6;
> +};
> +
> +#endif /* __ASM_COMPAT_H */
> diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
> index 60da0dcacf14..9392e35c689d 100644
> --- a/arch/riscv/include/asm/thread_info.h
> +++ b/arch/riscv/include/asm/thread_info.h
> @@ -91,6 +91,7 @@ struct thread_info {
>  #define TIF_SECCOMP		8	/* syscall secure computing */
>  #define TIF_NOTIFY_SIGNAL	9	/* signal notifications exist */
>  #define TIF_UPROBE		10	/* uprobe breakpoint or singlestep */
> +#define TIF_32BIT		11	/* 32bit process */

Presumably that's just meant for 32-bit processes on rv64?  Probably 
best to have the comment say that explicitly.

>  #define _TIF_SYSCALL_TRACE	(1 << TIF_SYSCALL_TRACE)
>  #define _TIF_NOTIFY_RESUME	(1 << TIF_NOTIFY_RESUME)
