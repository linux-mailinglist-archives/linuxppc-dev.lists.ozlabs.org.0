Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E91883A90C3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Jun 2021 06:45:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G4Xgk4Td3z30CT
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Jun 2021 14:45:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=PxTDjmjS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52f;
 helo=mail-pg1-x52f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=PxTDjmjS; dkim-atps=neutral
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G4XgG1lBzz302V
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Jun 2021 14:45:27 +1000 (AEST)
Received: by mail-pg1-x52f.google.com with SMTP id w31so948613pga.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 21:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=R4qQAh4JYS+kFi0j9lWegPv3ph2ncLp26Wd63jcZywc=;
 b=PxTDjmjSKfdd9tWazknafMJZ+OoJ3QSlIjVxHkkWd2gkWFqpw6P6ySUKaw+xLvMc0h
 /UayZj/PT6aVdHnRzoTPldnUF24ZMh4o2Ky4dj86hNQTT2YCksb8R1ZOVnbW4YWVdDWj
 0bFLc1+FAoGMPYhDeqhbl7mopvQwg3fh57Darkj3bIIbECtJfRmpLnDmyaNUvJFNVmN8
 O9s+trXGWGWU0T6hH6qatgJVp8Omvb3iF9fZMde1d/a8bdzl5JNsqiKLWXAJGYabjV//
 Ow3dt0pHO2TjjVC3kdXmvmPcTWVYiMA3A5NBRL8gaqVo4PAUwW10j4bG94xxRkTgbLwH
 ptSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=R4qQAh4JYS+kFi0j9lWegPv3ph2ncLp26Wd63jcZywc=;
 b=bjRFjzk0qWW58K/p3axb0LAX2H4ILu9KutseCWvBfe/uYa4vK8YLVDWRy+U77oKs3X
 WY5X4ySmqR/xV4jNuEmwW8qjZLUr3rXWQcaPGLBCFP6WZZ28l2QS/Jn78ifP71EZy0/1
 8Zs5zjQyrJ0nXhfzecxmsE333Oo4qpceprfclcSC2Urd0os89Ipgtt657l2K4KvpC7XI
 czFjSct2tZODqJEguHG09vCX1JBZkn4AuG7yNe6WIZU0CcegBM3syVNXBrLzM//5t1z9
 u7XoeusyQCdzSQtcIHhUWTzQH5xtS3H7/Vwm5uWNPTdDHw5jJXXxPetwJd+CKVOMWnAt
 geuQ==
X-Gm-Message-State: AOAM533WuXsDoV7T045U1CrCokWmXjuHIseNabG4IHKmI3QqxFN+d73o
 CgWbKZnXP1JIGns52NgOUEM=
X-Google-Smtp-Source: ABdhPJzKWQHcdRFvkjJhIwe6rEdEZq9XgxMKt5jg74/iOHN2+9q2iJ2kHYU49LlrCm+wVOWZC+tGyA==
X-Received: by 2002:a63:ad0f:: with SMTP id g15mr3091230pgf.415.1623818725228; 
 Tue, 15 Jun 2021 21:45:25 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id ev11sm4013620pjb.36.2021.06.15.21.45.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 21:45:24 -0700 (PDT)
Date: Wed, 16 Jun 2021 14:45:20 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 8/8] membarrier: Rewrite sync_core_before_usermode() and
 improve documentation
To: Andy Lutomirski <luto@kernel.org>, x86@kernel.org
References: <cover.1623813516.git.luto@kernel.org>
 <07a8b963002cb955b7516e61bad19514a3acaa82.1623813516.git.luto@kernel.org>
In-Reply-To: <07a8b963002cb955b7516e61bad19514a3acaa82.1623813516.git.luto@kernel.org>
MIME-Version: 1.0
Message-Id: <1623818343.eko1v01gvr.astroid@bobo.none>
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
Cc: Will Deacon <will@kernel.org>, linux-mm@kvack.org,
 Peter Zijlstra <peterz@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 stable@vger.kernel.org, Dave Hansen <dave.hansen@intel.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Andy Lutomirski's message of June 16, 2021 1:21 pm:
> The old sync_core_before_usermode() comments suggested that a non-icache-=
syncing
> return-to-usermode instruction is x86-specific and that all other
> architectures automatically notice cross-modified code on return to
> userspace.
>=20
> This is misleading.  The incantation needed to modify code from one
> CPU and execute it on another CPU is highly architecture dependent.
> On x86, according to the SDM, one must modify the code, issue SFENCE
> if the modification was WC or nontemporal, and then issue a "serializing
> instruction" on the CPU that will execute the code.  membarrier() can do
> the latter.
>=20
> On arm64 and powerpc, one must flush the icache and then flush the pipeli=
ne
> on the target CPU, although the CPU manuals don't necessarily use this
> language.
>=20
> So let's drop any pretense that we can have a generic way to define or
> implement membarrier's SYNC_CORE operation and instead require all
> architectures to define the helper and supply their own documentation as =
to
> how to use it.  This means x86, arm64, and powerpc for now.  Let's also
> rename the function from sync_core_before_usermode() to
> membarrier_sync_core_before_usermode() because the precise flushing detai=
ls
> may very well be specific to membarrier, and even the concept of
> "sync_core" in the kernel is mostly an x86-ism.
>=20
> (It may well be the case that, on real x86 processors, synchronizing the
>  icache (which requires no action at all) and "flushing the pipeline" is
>  sufficient, but trying to use this language would be confusing at best.
>  LFENCE does something awfully like "flushing the pipeline", but the SDM
>  does not permit LFENCE as an alternative to a "serializing instruction"
>  for this purpose.)
>=20
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: x86@kernel.org
> Cc: stable@vger.kernel.org
> Fixes: 70216e18e519 ("membarrier: Provide core serializing command, *_SYN=
C_CORE")
> Signed-off-by: Andy Lutomirski <luto@kernel.org>
> ---
>  .../membarrier-sync-core/arch-support.txt     | 68 ++++++-------------
>  arch/arm64/include/asm/sync_core.h            | 19 ++++++
>  arch/powerpc/include/asm/sync_core.h          | 14 ++++
>  arch/x86/Kconfig                              |  1 -
>  arch/x86/include/asm/sync_core.h              |  7 +-
>  arch/x86/kernel/alternative.c                 |  2 +-
>  arch/x86/kernel/cpu/mce/core.c                |  2 +-
>  arch/x86/mm/tlb.c                             |  3 +-
>  drivers/misc/sgi-gru/grufault.c               |  2 +-
>  drivers/misc/sgi-gru/gruhandles.c             |  2 +-
>  drivers/misc/sgi-gru/grukservices.c           |  2 +-
>  include/linux/sched/mm.h                      |  1 -
>  include/linux/sync_core.h                     | 21 ------
>  init/Kconfig                                  |  3 -
>  kernel/sched/membarrier.c                     | 15 ++--
>  15 files changed, 75 insertions(+), 87 deletions(-)
>  create mode 100644 arch/arm64/include/asm/sync_core.h
>  create mode 100644 arch/powerpc/include/asm/sync_core.h
>  delete mode 100644 include/linux/sync_core.h
>=20
> diff --git a/Documentation/features/sched/membarrier-sync-core/arch-suppo=
rt.txt b/Documentation/features/sched/membarrier-sync-core/arch-support.txt
> index 883d33b265d6..41c9ebcb275f 100644
> --- a/Documentation/features/sched/membarrier-sync-core/arch-support.txt
> +++ b/Documentation/features/sched/membarrier-sync-core/arch-support.txt
> @@ -5,51 +5,25 @@
>  #
>  # Architecture requirements
>  #
> -# * arm/arm64/powerpc
>  #
> -# Rely on implicit context synchronization as a result of exception retu=
rn
> -# when returning from IPI handler, and when returning to user-space.
> -#
> -# * x86
> -#
> -# x86-32 uses IRET as return from interrupt, which takes care of the IPI=
.
> -# However, it uses both IRET and SYSEXIT to go back to user-space. The I=
RET
> -# instruction is core serializing, but not SYSEXIT.
> -#
> -# x86-64 uses IRET as return from interrupt, which takes care of the IPI=
.
> -# However, it can return to user-space through either SYSRETL (compat co=
de),
> -# SYSRETQ, or IRET.
> -#
> -# Given that neither SYSRET{L,Q}, nor SYSEXIT, are core serializing, we =
rely
> -# instead on write_cr3() performed by switch_mm() to provide core serial=
ization
> -# after changing the current mm, and deal with the special case of kthre=
ad ->
> -# uthread (temporarily keeping current mm into active_mm) by issuing a
> -# sync_core_before_usermode() in that specific case.
> -#
> -    -----------------------
> -    |         arch |status|
> -    -----------------------
> -    |       alpha: | TODO |
> -    |         arc: | TODO |
> -    |         arm: |  ok  |
> -    |       arm64: |  ok  |
> -    |        csky: | TODO |
> -    |       h8300: | TODO |
> -    |     hexagon: | TODO |
> -    |        ia64: | TODO |
> -    |        m68k: | TODO |
> -    |  microblaze: | TODO |
> -    |        mips: | TODO |
> -    |       nds32: | TODO |
> -    |       nios2: | TODO |
> -    |    openrisc: | TODO |
> -    |      parisc: | TODO |
> -    |     powerpc: |  ok  |
> -    |       riscv: | TODO |
> -    |        s390: | TODO |
> -    |          sh: | TODO |
> -    |       sparc: | TODO |
> -    |          um: | TODO |
> -    |         x86: |  ok  |
> -    |      xtensa: | TODO |
> -    -----------------------
> +# An architecture that wants to support
> +# MEMBARRIER_CMD_PRIVATE_EXPEDITED_SYNC_CORE needs to define precisely w=
hat it
> +# is supposed to do and implement membarrier_sync_core_before_usermode()=
 to
> +# make it do that.  Then it can select ARCH_HAS_MEMBARRIER_SYNC_CORE via
> +# Kconfig.Unfortunately, MEMBARRIER_CMD_PRIVATE_EXPEDITED_SYNC_CORE is n=
ot a
> +# fantastic API and may not make sense on all architectures.  Once an
> +# architecture meets these requirements,
> +#
> +# On x86, a program can safely modify code, issue
> +# MEMBARRIER_CMD_PRIVATE_EXPEDITED_SYNC_CORE, and then execute that code=
, via
> +# the modified address or an alias, from any thread in the calling proce=
ss.
> +#
> +# On arm64, a program can modify code, flush the icache as needed, and i=
ssue
> +# MEMBARRIER_CMD_PRIVATE_EXPEDITED_SYNC_CORE to force a "context synchro=
nizing
> +# event", aka pipeline flush on all CPUs that might run the calling proc=
ess.
> +# Then the program can execute the modified code as long as it is execut=
ed
> +# from an address consistent with the icache flush and the CPU's cache t=
ype.
> +#
> +# On powerpc, a program can use MEMBARRIER_CMD_PRIVATE_EXPEDITED_SYNC_CO=
RE
> +# similarly to arm64.  It would be nice if the powerpc maintainers could
> +# add a more clear explanantion.
> diff --git a/arch/arm64/include/asm/sync_core.h b/arch/arm64/include/asm/=
sync_core.h
> new file mode 100644
> index 000000000000..74996bf533bb
> --- /dev/null
> +++ b/arch/arm64/include/asm/sync_core.h
> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ASM_ARM64_SYNC_CORE_H
> +#define _ASM_ARM64_SYNC_CORE_H
> +
> +#include <asm/barrier.h>
> +
> +/*
> + * On arm64, anyone trying to use membarrier() to handle JIT code is
> + * required to first flush the icache and then do SYNC_CORE.  All that's
> + * needed after the icache flush is to execute a "context synchronizatio=
n
> + * event".  Right now, ERET does this, and we are guaranteed to ERET bef=
ore
> + * any user code runs.  If Linux ever programs the CPU to make ERET stop
> + * being a context synchronizing event, then this will need to be adjust=
ed.
> + */
> +static inline void membarrier_sync_core_before_usermode(void)
> +{
> +}
> +
> +#endif /* _ASM_ARM64_SYNC_CORE_H */
> diff --git a/arch/powerpc/include/asm/sync_core.h b/arch/powerpc/include/=
asm/sync_core.h
> new file mode 100644
> index 000000000000..589fdb34beab
> --- /dev/null
> +++ b/arch/powerpc/include/asm/sync_core.h
> @@ -0,0 +1,14 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ASM_POWERPC_SYNC_CORE_H
> +#define _ASM_POWERPC_SYNC_CORE_H
> +
> +#include <asm/barrier.h>
> +
> +/*
> + * XXX: can a powerpc person put an appropriate comment here?
> + */
> +static inline void membarrier_sync_core_before_usermode(void)
> +{
> +}
> +
> +#endif /* _ASM_POWERPC_SYNC_CORE_H */

powerpc's can just go in asm/membarrier.h

/*
 * The RFI family of instructions are context synchronising, and
 * that is how we return to userspace, so nothing is required here.
 */

> diff --git a/kernel/sched/membarrier.c b/kernel/sched/membarrier.c
> index c32c32a2441e..f72a6ab3fac2 100644
> --- a/kernel/sched/membarrier.c
> +++ b/kernel/sched/membarrier.c
> @@ -5,6 +5,9 @@
>   * membarrier system call
>   */
>  #include "sched.h"
> +#ifdef CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE
> +#include <asm/sync_core.h>
> +#endif

Can you

#else
static inline void membarrier_sync_core_before_usermode(void)
{
 /* this gets constant folded out */
}
#endif

And avoid adding the ifdefs in the following code?

Otherwise I think this is good.

Acked-by: Nicholas Piggin <npiggin@gmail.com>

Thanks,
Nick

> =20
>  /*
>   * The basic principle behind the regular memory barrier mode of membarr=
ier()
> @@ -221,6 +224,7 @@ static void ipi_mb(void *info)
>  	smp_mb();	/* IPIs should be serializing but paranoid. */
>  }
> =20
> +#ifdef CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE
>  static void ipi_sync_core(void *info)
>  {
>  	/*
> @@ -230,13 +234,14 @@ static void ipi_sync_core(void *info)
>  	 * the big comment at the top of this file.
>  	 *
>  	 * A sync_core() would provide this guarantee, but
> -	 * sync_core_before_usermode() might end up being deferred until
> -	 * after membarrier()'s smp_mb().
> +	 * membarrier_sync_core_before_usermode() might end up being deferred
> +	 * until after membarrier()'s smp_mb().
>  	 */
>  	smp_mb();	/* IPIs should be serializing but paranoid. */
> =20
> -	sync_core_before_usermode();
> +	membarrier_sync_core_before_usermode();
>  }
> +#endif
> =20
>  static void ipi_rseq(void *info)
>  {
> @@ -368,12 +373,14 @@ static int membarrier_private_expedited(int flags, =
int cpu_id)
>  	smp_call_func_t ipi_func =3D ipi_mb;
> =20
>  	if (flags =3D=3D MEMBARRIER_FLAG_SYNC_CORE) {
> -		if (!IS_ENABLED(CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE))
> +#ifndef CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE
>  			return -EINVAL;
> +#else
>  		if (!(atomic_read(&mm->membarrier_state) &
>  		      MEMBARRIER_STATE_PRIVATE_EXPEDITED_SYNC_CORE_READY))
>  			return -EPERM;
>  		ipi_func =3D ipi_sync_core;
> +#endif
>  	} else if (flags =3D=3D MEMBARRIER_FLAG_RSEQ) {
>  		if (!IS_ENABLED(CONFIG_RSEQ))
>  			return -EINVAL;
> --=20
> 2.31.1
>=20
>=20
