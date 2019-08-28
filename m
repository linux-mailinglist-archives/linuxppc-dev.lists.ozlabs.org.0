Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F86A0666
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2019 17:33:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46JVBV2kc4zDqjW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 01:33:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx1.suse.de; envelope-from=msuchanek@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46JV7f0Rb0zDr74
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2019 01:30:53 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 90CD1ABE3;
 Wed, 28 Aug 2019 15:30:50 +0000 (UTC)
Date: Wed, 28 Aug 2019 17:30:49 +0200
From: Michal =?UTF-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 4/4] powerpc/64: system call implement the bulk of
 the logic in C
Message-ID: <20190828173049.3a34df30@naga>
In-Reply-To: <20190827135548.21457-5-npiggin@gmail.com>
References: <20190827135548.21457-1-npiggin@gmail.com>
 <20190827135548.21457-5-npiggin@gmail.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 27 Aug 2019 23:55:48 +1000
Nicholas Piggin <npiggin@gmail.com> wrote:

> System call entry and particularly exit code is beyond the limit of what
> is reasonable to implement in asm.
>=20
> This conversion moves all conditional branches out of the asm code,
> except for the case that all GPRs should be restored at exit.
>=20
> Null syscall test is about 5% faster after this patch, because the exit
> work is handled under local_irq_disable, and the hard mask and pending
> interrupt replay is handled after that, which avoids games with MSR.
>=20
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
> Changes since v1:
> - Improve changelog
> - Lot of code cleanups, moving helpers out to proper header locations,
>   etc (Christophe).
> - Split unnecessary change that affected ppc32 out. I will submit it
>   independently (Christophe).
>=20
>  arch/powerpc/include/asm/asm-prototypes.h     |  11 -
>  .../powerpc/include/asm/book3s/64/kup-radix.h |  12 +-
>  arch/powerpc/include/asm/cputime.h            |  22 ++
>  arch/powerpc/include/asm/ptrace.h             |   3 +
>  arch/powerpc/include/asm/signal.h             |   2 +
>  arch/powerpc/include/asm/switch_to.h          |   5 +
>  arch/powerpc/include/asm/time.h               |   3 +
>  arch/powerpc/kernel/Makefile                  |   3 +-
>  arch/powerpc/kernel/entry_64.S                | 340 +++---------------
>  arch/powerpc/kernel/signal.h                  |   2 -
>  arch/powerpc/kernel/syscall_64.c              | 177 +++++++++
>  11 files changed, 273 insertions(+), 307 deletions(-)
>  create mode 100644 arch/powerpc/kernel/syscall_64.c
>=20
> diff --git a/arch/powerpc/include/asm/asm-prototypes.h b/arch/powerpc/inc=
lude/asm/asm-prototypes.h
> index ec1c97a8e8cb..f00ef8924a99 100644
> --- a/arch/powerpc/include/asm/asm-prototypes.h
> +++ b/arch/powerpc/include/asm/asm-prototypes.h
> @@ -92,14 +92,6 @@ long sys_switch_endian(void);
>  notrace unsigned int __check_irq_replay(void);
>  void notrace restore_interrupts(void);
> =20
> -/* ptrace */
> -long do_syscall_trace_enter(struct pt_regs *regs);
> -void do_syscall_trace_leave(struct pt_regs *regs);
> -
> -/* process */
> -void restore_math(struct pt_regs *regs);
> -void restore_tm_state(struct pt_regs *regs);
> -
>  /* prom_init (OpenFirmware) */
>  unsigned long __init prom_init(unsigned long r3, unsigned long r4,
>  			       unsigned long pp,
> @@ -110,9 +102,6 @@ unsigned long __init prom_init(unsigned long r3, unsi=
gned long r4,
>  void __init early_setup(unsigned long dt_ptr);
>  void early_setup_secondary(void);
> =20
> -/* time */
> -void accumulate_stolen_time(void);
> -
>  /* misc runtime */
>  extern u64 __bswapdi2(u64);
>  extern s64 __lshrdi3(s64, int);
> diff --git a/arch/powerpc/include/asm/book3s/64/kup-radix.h b/arch/powerp=
c/include/asm/book3s/64/kup-radix.h
> index f254de956d6a..ef2e65ea8a73 100644
> --- a/arch/powerpc/include/asm/book3s/64/kup-radix.h
> +++ b/arch/powerpc/include/asm/book3s/64/kup-radix.h
> @@ -3,6 +3,7 @@
>  #define _ASM_POWERPC_BOOK3S_64_KUP_RADIX_H
> =20
>  #include <linux/const.h>
> +#include <asm/reg.h>
> =20
>  #define AMR_KUAP_BLOCK_READ	UL(0x4000000000000000)
>  #define AMR_KUAP_BLOCK_WRITE	UL(0x8000000000000000)
> @@ -56,7 +57,16 @@
> =20
>  #ifdef CONFIG_PPC_KUAP
> =20
> -#include <asm/reg.h>
> +#include <asm/mmu.h>
> +#include <asm/ptrace.h>
> +
> +static inline void kuap_check_amr(void)
> +{
> +#ifdef CONFIG_PPC_KUAP_DEBUG
> +	if (mmu_has_feature(MMU_FTR_RADIX_KUAP))
> +		WARN_ON_ONCE(mfspr(SPRN_AMR) !=3D AMR_KUAP_BLOCKED);
> +#endif
> +}
> =20
>  /*
>   * We support individually allowing read or write, but we don't support =
nesting
> diff --git a/arch/powerpc/include/asm/cputime.h b/arch/powerpc/include/as=
m/cputime.h
> index 2431b4ada2fa..f3aa9db1a3cc 100644
> --- a/arch/powerpc/include/asm/cputime.h
> +++ b/arch/powerpc/include/asm/cputime.h
> @@ -60,6 +60,28 @@ static inline void arch_vtime_task_switch(struct task_=
struct *prev)
>  }
>  #endif
> =20
> +static inline void account_cpu_user_entry(void)
> +{
> +	unsigned long tb =3D mftb();
> +
> +	get_accounting(current)->utime +=3D (tb - get_accounting(current)->star=
ttime_user);
> +	get_accounting(current)->starttime =3D tb;
> +}
> +static inline void account_cpu_user_exit(void)
> +{
> +	unsigned long tb =3D mftb();
> +
> +	get_accounting(current)->stime +=3D (tb - get_accounting(current)->star=
ttime);
> +	get_accounting(current)->starttime_user =3D tb;
> +}
> +
>  #endif /* __KERNEL__ */
> +#else /* CONFIG_VIRT_CPU_ACCOUNTING_NATIVE */
> +static inline void account_cpu_user_entry(void)
> +{
> +}
> +static inline void account_cpu_user_exit(void)
> +{
> +}
>  #endif /* CONFIG_VIRT_CPU_ACCOUNTING_NATIVE */
>  #endif /* __POWERPC_CPUTIME_H */
> diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/asm=
/ptrace.h
> index feee1b21bbd5..af363086403a 100644
> --- a/arch/powerpc/include/asm/ptrace.h
> +++ b/arch/powerpc/include/asm/ptrace.h
> @@ -138,6 +138,9 @@ extern unsigned long profile_pc(struct pt_regs *regs);
>  #define profile_pc(regs) instruction_pointer(regs)
>  #endif
> =20
> +long do_syscall_trace_enter(struct pt_regs *regs);
> +void do_syscall_trace_leave(struct pt_regs *regs);
> +
>  #define kernel_stack_pointer(regs) ((regs)->gpr[1])
>  static inline int is_syscall_success(struct pt_regs *regs)
>  {
> diff --git a/arch/powerpc/include/asm/signal.h b/arch/powerpc/include/asm=
/signal.h
> index 0803ca8b9149..0113be8dcb59 100644
> --- a/arch/powerpc/include/asm/signal.h
> +++ b/arch/powerpc/include/asm/signal.h
> @@ -6,4 +6,6 @@
>  #include <uapi/asm/signal.h>
>  #include <uapi/asm/ptrace.h>
> =20
> +void do_notify_resume(struct pt_regs *regs, unsigned long thread_info_fl=
ags);
> +
/srv/kernel/arch/powerpc/include/asm/signal.h:9:30: warning: =E2=80=98struc=
t pt_regs=E2=80=99 declared inside parameter list will not be visible outsi=
de of this definition or declaration
 void do_notify_resume(struct pt_regs *regs, unsigned long thread_info_flag=
s);

uapi/asm/ptrace.h defines user_pt_regs and asm/ptrace.h pt_regs.

I am not really sure which you wanted.

Thanks

Michal
