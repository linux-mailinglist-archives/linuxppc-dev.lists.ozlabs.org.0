Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB97A0D7F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 00:23:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46JgHh2bgJzDqHR
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 08:23:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::443; helo=mail-pf1-x443.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="K/MHq7V5"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46JgDh0wvJzDqwy
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2019 08:20:51 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id i30so656134pfk.9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2019 15:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=SEd83uPf3pv5cb0oqzKxWTBiD7peAMNy7bu6+MQAUYU=;
 b=K/MHq7V55P7UJiFjw28i2HIwrHpAHThqXLI4teLz/2bXr2gL2MVxGbcSRKaHmIdked
 V7dc+Ho0Nz1NlBswDjThiXAvqJhkLWRmslaEl6ho4YWa3EFNgNkhELZCpr2x3X71t5UW
 n8E4ruZ8PV0rCcAvfKYbyNJTae346fQpN+EpJGs8vGmuV39bjUKUW6Gwbh9IVzYWS/ig
 2/PPcNZoeiLE3jYk/IvY0Mu2Q9ArJj/hFRtzDs8uexzouE8EWHofO+n74mKhTfrew4eC
 dr17rHFT7NdHG0IlyzZKDvGsgoFlkotO/ALKdauYd2eAbaUiHMCzXp+km49HNJ9Z5Bjt
 Tpsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=SEd83uPf3pv5cb0oqzKxWTBiD7peAMNy7bu6+MQAUYU=;
 b=oryfZfxXY9YGdnCjtHnn1k6p4IOWqCSuheFnYWD9a4jD3CJGLTFnzHUhibO2wW5AHy
 H2CxxzXtFzeKjXYPK64zTPqXAQ9bxWvvj990YnKikSByE5wTXqgd+YKVNzcwPeY35pfH
 R2IfsiUUv/NChmcDb3tcpy+0NIVZA4fW5/h8gJrsrOgSG8jg5lJFRw8rbZwxvP1fSx68
 kCZ1OemEIkkEsZQM28r9lmSZ/vICoNjfy8xUHqBEhhAGdavuM9wTEUlth+0hf5qHF1y7
 SEoWfuwR0054hsOm4/Vb5c1HGzsHiQCRiWPfk8konh+GKKxilwibY8823ENV6WQ/NVM9
 JRZA==
X-Gm-Message-State: APjAAAVW+8wkvzGaZa2Q5qlLuRcBIC9bR80wbJMn0mWLyOazEXqW85rt
 Ov6shoFwLfFt3fPP6htn+0o=
X-Google-Smtp-Source: APXvYqzWiBdyRJc1taGM+YTNEzXPngmV3p6zIwhY0QlYH8Vo4vXoloL/dpyCX5Y58ARYKytWS86/Ow==
X-Received: by 2002:a62:1d8a:: with SMTP id d132mr7406367pfd.187.1567030848047; 
 Wed, 28 Aug 2019 15:20:48 -0700 (PDT)
Received: from localhost ([220.240.228.48])
 by smtp.gmail.com with ESMTPSA id j1sm166695pgl.12.2019.08.28.15.20.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 15:20:47 -0700 (PDT)
Date: Thu, 29 Aug 2019 08:19:27 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 4/4] powerpc/64: system call implement the bulk of the
 logic in C
To: Michal =?iso-8859-1?q?Such=E1nek?= <msuchanek@suse.de>
References: <20190827135548.21457-1-npiggin@gmail.com>
 <20190827135548.21457-5-npiggin@gmail.com> <20190828173049.3a34df30@naga>
In-Reply-To: <20190828173049.3a34df30@naga>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1567030004.rlm2jnj82c.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
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

Michal Such=C3=A1nek's on August 29, 2019 1:30 am:
> On Tue, 27 Aug 2019 23:55:48 +1000
> Nicholas Piggin <npiggin@gmail.com> wrote:
>=20
>> System call entry and particularly exit code is beyond the limit of what
>> is reasonable to implement in asm.
>>=20
>> This conversion moves all conditional branches out of the asm code,
>> except for the case that all GPRs should be restored at exit.
>>=20
>> Null syscall test is about 5% faster after this patch, because the exit
>> work is handled under local_irq_disable, and the hard mask and pending
>> interrupt replay is handled after that, which avoids games with MSR.
>>=20
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>> Changes since v1:
>> - Improve changelog
>> - Lot of code cleanups, moving helpers out to proper header locations,
>>   etc (Christophe).
>> - Split unnecessary change that affected ppc32 out. I will submit it
>>   independently (Christophe).
>>=20
>>  arch/powerpc/include/asm/asm-prototypes.h     |  11 -
>>  .../powerpc/include/asm/book3s/64/kup-radix.h |  12 +-
>>  arch/powerpc/include/asm/cputime.h            |  22 ++
>>  arch/powerpc/include/asm/ptrace.h             |   3 +
>>  arch/powerpc/include/asm/signal.h             |   2 +
>>  arch/powerpc/include/asm/switch_to.h          |   5 +
>>  arch/powerpc/include/asm/time.h               |   3 +
>>  arch/powerpc/kernel/Makefile                  |   3 +-
>>  arch/powerpc/kernel/entry_64.S                | 340 +++---------------
>>  arch/powerpc/kernel/signal.h                  |   2 -
>>  arch/powerpc/kernel/syscall_64.c              | 177 +++++++++
>>  11 files changed, 273 insertions(+), 307 deletions(-)
>>  create mode 100644 arch/powerpc/kernel/syscall_64.c
>>=20
>> diff --git a/arch/powerpc/include/asm/asm-prototypes.h b/arch/powerpc/in=
clude/asm/asm-prototypes.h
>> index ec1c97a8e8cb..f00ef8924a99 100644
>> --- a/arch/powerpc/include/asm/asm-prototypes.h
>> +++ b/arch/powerpc/include/asm/asm-prototypes.h
>> @@ -92,14 +92,6 @@ long sys_switch_endian(void);
>>  notrace unsigned int __check_irq_replay(void);
>>  void notrace restore_interrupts(void);
>> =20
>> -/* ptrace */
>> -long do_syscall_trace_enter(struct pt_regs *regs);
>> -void do_syscall_trace_leave(struct pt_regs *regs);
>> -
>> -/* process */
>> -void restore_math(struct pt_regs *regs);
>> -void restore_tm_state(struct pt_regs *regs);
>> -
>>  /* prom_init (OpenFirmware) */
>>  unsigned long __init prom_init(unsigned long r3, unsigned long r4,
>>  			       unsigned long pp,
>> @@ -110,9 +102,6 @@ unsigned long __init prom_init(unsigned long r3, uns=
igned long r4,
>>  void __init early_setup(unsigned long dt_ptr);
>>  void early_setup_secondary(void);
>> =20
>> -/* time */
>> -void accumulate_stolen_time(void);
>> -
>>  /* misc runtime */
>>  extern u64 __bswapdi2(u64);
>>  extern s64 __lshrdi3(s64, int);
>> diff --git a/arch/powerpc/include/asm/book3s/64/kup-radix.h b/arch/power=
pc/include/asm/book3s/64/kup-radix.h
>> index f254de956d6a..ef2e65ea8a73 100644
>> --- a/arch/powerpc/include/asm/book3s/64/kup-radix.h
>> +++ b/arch/powerpc/include/asm/book3s/64/kup-radix.h
>> @@ -3,6 +3,7 @@
>>  #define _ASM_POWERPC_BOOK3S_64_KUP_RADIX_H
>> =20
>>  #include <linux/const.h>
>> +#include <asm/reg.h>
>> =20
>>  #define AMR_KUAP_BLOCK_READ	UL(0x4000000000000000)
>>  #define AMR_KUAP_BLOCK_WRITE	UL(0x8000000000000000)
>> @@ -56,7 +57,16 @@
>> =20
>>  #ifdef CONFIG_PPC_KUAP
>> =20
>> -#include <asm/reg.h>
>> +#include <asm/mmu.h>
>> +#include <asm/ptrace.h>
>> +
>> +static inline void kuap_check_amr(void)
>> +{
>> +#ifdef CONFIG_PPC_KUAP_DEBUG
>> +	if (mmu_has_feature(MMU_FTR_RADIX_KUAP))
>> +		WARN_ON_ONCE(mfspr(SPRN_AMR) !=3D AMR_KUAP_BLOCKED);
>> +#endif
>> +}
>> =20
>>  /*
>>   * We support individually allowing read or write, but we don't support=
 nesting
>> diff --git a/arch/powerpc/include/asm/cputime.h b/arch/powerpc/include/a=
sm/cputime.h
>> index 2431b4ada2fa..f3aa9db1a3cc 100644
>> --- a/arch/powerpc/include/asm/cputime.h
>> +++ b/arch/powerpc/include/asm/cputime.h
>> @@ -60,6 +60,28 @@ static inline void arch_vtime_task_switch(struct task=
_struct *prev)
>>  }
>>  #endif
>> =20
>> +static inline void account_cpu_user_entry(void)
>> +{
>> +	unsigned long tb =3D mftb();
>> +
>> +	get_accounting(current)->utime +=3D (tb - get_accounting(current)->sta=
rttime_user);
>> +	get_accounting(current)->starttime =3D tb;
>> +}
>> +static inline void account_cpu_user_exit(void)
>> +{
>> +	unsigned long tb =3D mftb();
>> +
>> +	get_accounting(current)->stime +=3D (tb - get_accounting(current)->sta=
rttime);
>> +	get_accounting(current)->starttime_user =3D tb;
>> +}
>> +
>>  #endif /* __KERNEL__ */
>> +#else /* CONFIG_VIRT_CPU_ACCOUNTING_NATIVE */
>> +static inline void account_cpu_user_entry(void)
>> +{
>> +}
>> +static inline void account_cpu_user_exit(void)
>> +{
>> +}
>>  #endif /* CONFIG_VIRT_CPU_ACCOUNTING_NATIVE */
>>  #endif /* __POWERPC_CPUTIME_H */
>> diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/as=
m/ptrace.h
>> index feee1b21bbd5..af363086403a 100644
>> --- a/arch/powerpc/include/asm/ptrace.h
>> +++ b/arch/powerpc/include/asm/ptrace.h
>> @@ -138,6 +138,9 @@ extern unsigned long profile_pc(struct pt_regs *regs=
);
>>  #define profile_pc(regs) instruction_pointer(regs)
>>  #endif
>> =20
>> +long do_syscall_trace_enter(struct pt_regs *regs);
>> +void do_syscall_trace_leave(struct pt_regs *regs);
>> +
>>  #define kernel_stack_pointer(regs) ((regs)->gpr[1])
>>  static inline int is_syscall_success(struct pt_regs *regs)
>>  {
>> diff --git a/arch/powerpc/include/asm/signal.h b/arch/powerpc/include/as=
m/signal.h
>> index 0803ca8b9149..0113be8dcb59 100644
>> --- a/arch/powerpc/include/asm/signal.h
>> +++ b/arch/powerpc/include/asm/signal.h
>> @@ -6,4 +6,6 @@
>>  #include <uapi/asm/signal.h>
>>  #include <uapi/asm/ptrace.h>
>> =20
>> +void do_notify_resume(struct pt_regs *regs, unsigned long thread_info_f=
lags);
>> +
> /srv/kernel/arch/powerpc/include/asm/signal.h:9:30: warning: =E2=80=98str=
uct pt_regs=E2=80=99 declared inside parameter list will not be visible out=
side of this definition or declaration
>  void do_notify_resume(struct pt_regs *regs, unsigned long thread_info_fl=
ags);

Thanks I didn't see that.

> uapi/asm/ptrace.h defines user_pt_regs and asm/ptrace.h pt_regs.
>=20
> I am not really sure which you wanted.

pt_regs. That is the struct that gets saved on the kernel stack by=20
interrupts. user_pt_regs is part of the ptrace user ABI.

Thanks,
Nick
=
