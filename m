Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 725194C0757
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 02:47:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K3Jn150xNz3dmf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 12:47:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=dabbelt-com.20210112.gappssmtp.com header.i=@dabbelt-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=d5biXJ9G;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=dabbelt.com (client-ip=2607:f8b0:4864:20::629;
 helo=mail-pl1-x629.google.com; envelope-from=palmer@dabbelt.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=dabbelt-com.20210112.gappssmtp.com
 header.i=@dabbelt-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=d5biXJ9G; dkim-atps=neutral
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K3JhM00V8z3bb0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Feb 2022 12:42:58 +1100 (AEDT)
Received: by mail-pl1-x629.google.com with SMTP id w20so17277269plq.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Feb 2022 17:42:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=CUt3fT/uuV0gaDZr82IxRQYON9jArt/u8BEXVuBiL/k=;
 b=d5biXJ9GxQMu04AFeYHwejSk8w+590qVJOkBF/bpDIzSLkz2zdCw8KJuYjHAwr9mEV
 Wgbr7ud3jGsbz5LBPEJYrd7V5yYHecxcBpDxpZFmS6VjGKbcfMqz1U5KW8TRPCc1Clu7
 D7pff6rpq5wRkJdHsdwndWixeOnUM+Kufa2y/KIsJnJIYuz5j+OM6IjU0RNfxPMrbaIp
 QseC1jQuKkZN6xjj+WQStAksKeqv8OONsbxZSHJAPIQdVeNcdiEkYV17vD6EuzdBzc0E
 MZV1SvJl3WJSlNLmRDubF74JYsSImHzRVaDYYvn94VKmAte8UOWngNBkd+yP/LUJV51J
 Et2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=CUt3fT/uuV0gaDZr82IxRQYON9jArt/u8BEXVuBiL/k=;
 b=6aH4phTDRqzjrxXjZ9hAaV6MEN/6Lauk8J4+bdyeKk6QOYnrS/FvCOSK0QFMLnvySP
 wYOZQs6st+4OCgZa9mOTFbTKrKnX0ti9APiCyOKk7WmELSfO3th66B1khMasBMfdCTsc
 dOJ9F3tXGh2Ye2OIc/NwNthddBkO2hcMf+yXFCrmDIPhD6Mu7YjbD13whW899JzfWqIw
 vul4UNnJDz7oaru7KbodCuqnSdhv6jKESeWaPKAlZPECjmK2L7/LtOglO3UZ3jxuqBMw
 GWDtNJfjeUCENgZSk4OE+QF2zR4WOiJd8EP9piIbkQ6+jC58LN20lCYDw/P2g2ZL/pV7
 jHWQ==
X-Gm-Message-State: AOAM530KWAVs1bkRGfRTl6dYBfLTKQvytrBo5k3iUI545rvI9hBdq2Yy
 RtWyHeD4+TVg7WED6Bgn7zyCzA==
X-Google-Smtp-Source: ABdhPJwY9ROjkjZhywjZODH4CrVkv1z0oVYiAf8UmbEKILysfgr00XRX5op4Thf4kUUL5rGdyPSDrw==
X-Received: by 2002:a17:90a:480e:b0:1bc:1d88:8d4e with SMTP id
 a14-20020a17090a480e00b001bc1d888d4emr6796297pjh.157.1645580577313; 
 Tue, 22 Feb 2022 17:42:57 -0800 (PST)
Received: from localhost ([12.3.194.138])
 by smtp.gmail.com with ESMTPSA id ms7sm882191pjb.56.2022.02.22.17.42.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 17:42:56 -0800 (PST)
Date: Tue, 22 Feb 2022 17:42:56 -0800 (PST)
X-Google-Original-Date: Tue, 22 Feb 2022 17:20:55 PST (-0800)
Subject: Re: [PATCH V5 19/21] riscv: compat: ptrace: Add compat_arch_ptrace
 implement
In-Reply-To: <20220201150545.1512822-20-guoren@kernel.org>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: guoren@kernel.org
Message-ID: <mhng-80d10de0-3b9a-4664-b39c-612f9d1534ee@palmer-ri-x1c9>
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

On Tue, 01 Feb 2022 07:05:43 PST (-0800), guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
>
> Now, you can use native gdb on riscv64 for rv32 app debugging.
>
> $ uname -a
> Linux buildroot 5.16.0-rc4-00036-gbef6b82fdf23-dirty #53 SMP Mon Dec 20 23:06:53 CST 2021 riscv64 GNU/Linux
> $ cat /proc/cpuinfo
> processor       : 0
> hart            : 0
> isa             : rv64imafdcsuh
> mmu             : sv48
>
> $ file /bin/busybox
> /bin/busybox: setuid ELF 32-bit LSB shared object, UCB RISC-V, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-riscv32-ilp32d.so.1, for GNU/Linux 5.15.0, stripped
> $ file /usr/bin/gdb
> /usr/bin/gdb: ELF 32-bit LSB shared object, UCB RISC-V, version 1 (GNU/Linux), dynamically linked, interpreter /lib/ld-linux-riscv32-ilp32d.so.1, for GNU/Linux 5.15.0, stripped
> $ /usr/bin/gdb /bin/busybox
> GNU gdb (GDB) 10.2
> Copyright (C) 2021 Free Software Foundation, Inc.
> License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
> ...
> Reading symbols from /bin/busybox...
> (No debugging symbols found in /bin/busybox)
> (gdb) b main
> Breakpoint 1 at 0x8ddc
> (gdb) r
> Starting program: /bin/busybox
> Failed to read a valid object file image from memory.
>
> Breakpoint 1, 0x555a8ddc in main ()
> (gdb) i r
> ra             0x77df0b74       0x77df0b74
> sp             0x7fdd3d10       0x7fdd3d10
> gp             0x5567e800       0x5567e800 <bb_common_bufsiz1+160>
> tp             0x77f64280       0x77f64280
> t0             0x0      0
> t1             0x555a6fac       1431990188
> t2             0x77dd8db4       2011008436
> fp             0x7fdd3e34       0x7fdd3e34
> s1             0x7fdd3e34       2145205812
> a0             0xffffffff       -1
> a1             0x2000   8192
> a2             0x7fdd3e3c       2145205820
> a3             0x0      0
> a4             0x7fdd3d30       2145205552
> a5             0x555a8dc0       1431997888
> a6             0x77f2c170       2012397936
> a7             0x6a7c7a2f       1786542639
> s2             0x0      0
> s3             0x0      0
> s4             0x555a8dc0       1431997888
> s5             0x77f8a3a8       2012783528
> s6             0x7fdd3e3c       2145205820
> s7             0x5567cecc       1432866508
> --Type <RET> for more, q to quit, c to continue without paging--
> s8             0x1      1
> s9             0x0      0
> s10            0x55634448       1432568904
> s11            0x0      0
> t3             0x77df0bb8       2011106232
> t4             0x42fc   17148
> t5             0x0      0
> t6             0x40     64
> pc             0x555a8ddc       0x555a8ddc <main+28>
> (gdb) si
> 0x555a78f0 in mallopt@plt ()
> (gdb) c
> Continuing.
> BusyBox v1.34.1 (2021-12-19 22:39:48 CST) multi-call binary.
> BusyBox is copyrighted by many authors between 1998-2015.
> Licensed under GPLv2. See source distribution for detailed
> copyright notices.
>
> Usage: busybox [function [arguments]...]
>    or: busybox --list[-full]
> ...
> [Inferior 1 (process 107) exited normally]
> (gdb) q
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> ---
>  arch/riscv/kernel/ptrace.c | 87 +++++++++++++++++++++++++++++++++++---
>  1 file changed, 82 insertions(+), 5 deletions(-)
>
> diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
> index a89243730153..bb387593a121 100644
> --- a/arch/riscv/kernel/ptrace.c
> +++ b/arch/riscv/kernel/ptrace.c
> @@ -12,6 +12,7 @@
>  #include <asm/thread_info.h>
>  #include <asm/switch_to.h>
>  #include <linux/audit.h>
> +#include <linux/compat.h>
>  #include <linux/ptrace.h>
>  #include <linux/elf.h>
>  #include <linux/regset.h>
> @@ -111,11 +112,6 @@ static const struct user_regset_view riscv_user_native_view = {
>  	.n = ARRAY_SIZE(riscv_user_regset),
>  };
>
> -const struct user_regset_view *task_user_regset_view(struct task_struct *task)
> -{
> -	return &riscv_user_native_view;
> -}
> -
>  struct pt_regs_offset {
>  	const char *name;
>  	int offset;
> @@ -273,3 +269,84 @@ __visible void do_syscall_trace_exit(struct pt_regs *regs)
>  		trace_sys_exit(regs, regs_return_value(regs));
>  #endif
>  }
> +
> +#ifdef CONFIG_COMPAT
> +static int compat_riscv_gpr_get(struct task_struct *target,
> +				const struct user_regset *regset,
> +				struct membuf to)
> +{
> +	struct compat_user_regs_struct cregs;
> +
> +	regs_to_cregs(&cregs, task_pt_regs(target));
> +
> +	return membuf_write(&to, &cregs,
> +			    sizeof(struct compat_user_regs_struct));
> +}
> +
> +static int compat_riscv_gpr_set(struct task_struct *target,
> +				const struct user_regset *regset,
> +				unsigned int pos, unsigned int count,
> +				const void *kbuf, const void __user *ubuf)
> +{
> +	int ret;
> +	struct compat_user_regs_struct cregs;
> +
> +	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, &cregs, 0, -1);
> +
> +	cregs_to_regs(&cregs, task_pt_regs(target));
> +
> +	return ret;
> +}
> +
> +static const struct user_regset compat_riscv_user_regset[] = {
> +	[REGSET_X] = {
> +		.core_note_type = NT_PRSTATUS,
> +		.n = ELF_NGREG,
> +		.size = sizeof(compat_elf_greg_t),
> +		.align = sizeof(compat_elf_greg_t),
> +		.regset_get = compat_riscv_gpr_get,
> +		.set = compat_riscv_gpr_set,
> +	},
> +#ifdef CONFIG_FPU
> +	[REGSET_F] = {
> +		.core_note_type = NT_PRFPREG,
> +		.n = ELF_NFPREG,
> +		.size = sizeof(elf_fpreg_t),
> +		.align = sizeof(elf_fpreg_t),
> +		.regset_get = riscv_fpr_get,
> +		.set = riscv_fpr_set,
> +	},
> +#endif
> +};
> +
> +static const struct user_regset_view compat_riscv_user_native_view = {
> +	.name = "riscv",
> +	.e_machine = EM_RISCV,
> +	.regsets = compat_riscv_user_regset,
> +	.n = ARRAY_SIZE(compat_riscv_user_regset),
> +};
> +
> +long compat_arch_ptrace(struct task_struct *child, compat_long_t request,
> +			compat_ulong_t caddr, compat_ulong_t cdata)
> +{
> +	long ret = -EIO;
> +
> +	switch (request) {
> +	default:
> +		ret = compat_ptrace_request(child, request, caddr, cdata);
> +		break;
> +	}
> +
> +	return ret;
> +}
> +#endif /* CONFIG_COMPAT */
> +
> +const struct user_regset_view *task_user_regset_view(struct task_struct *task)
> +{
> +#ifdef CONFIG_COMPAT
> +	if (test_tsk_thread_flag(task, TIF_32BIT))
> +		return &compat_riscv_user_native_view;
> +	else
> +#endif
> +		return &riscv_user_native_view;
> +}

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
