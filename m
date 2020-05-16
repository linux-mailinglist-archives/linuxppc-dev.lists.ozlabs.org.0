Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BAB11D5F71
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 May 2020 09:38:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49PHFN11bJzDr5l
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 May 2020 17:38:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=DuPPJcWV; dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49PHCg51YQzDr0N
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 May 2020 17:36:45 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id x10so1877011plr.4
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 May 2020 00:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=a9I7yRiqq2YjmcjOT4auUHd44ncIAoOgvFdRgFa+edA=;
 b=DuPPJcWVsJhXS2lemdDvfdc6suYxZ9xvfX2nRyRxxju0deHqV4clNQUNpZ6MStZzU3
 l/zga/yclRO7BgaZsZWlQKrDu0QJcAbSahjzTFggKxfs0WxLTUmTyahSH1KMTTmMHBtf
 ufIxrE/P2HGT9l94YZMhH9efp/98L7UrqC2ggsgNV1/rZC0m/ge1F7WWFZUAqHJAipOV
 ByzqfCoVXhEpxNwlbGcw/t0NDcH1PfXVG5IozZgp7Il3fhsPcFZWdExGgIyImQ0eXbzP
 6AfoUMBgbYmSv6xCNXK2AUXJX1c0bwudejNX9CgIOwu/3zDukQSIUXh7u9z+SF+tYb39
 tGQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=a9I7yRiqq2YjmcjOT4auUHd44ncIAoOgvFdRgFa+edA=;
 b=j8vcCM3tnCDAXSbJN5Jy+G0zm0NxkcDG631LOd19ztPe+peSdMhpnnqeeQEW4k/O4c
 sFMkjeXf2KTjkiWFtjDjUFKf/YqS1SwlxGiaINNF0qSoL28vBYb3ImmHD0jKxbhQumVI
 3Zz9Olr7EsdQg8Vw7vH1RRvmzlWigZHuOSjJNPoEGEfjK5PIydVWtZqfAIqRBvOKMVjU
 295UY90gkUMHg1mbJWnCpv8BQDPYUfhIg8oPkF062VE5+gNiXAks3FbCY2FReMRILXrG
 S56vuDYkupnDtnaEoLLLuWFLPK99qZNNRTB3bXEycAEPV+Q8fTHBwpHKiWcyAJp/boDG
 3Dpg==
X-Gm-Message-State: AOAM530qdvG1lN2J4iIFPp06LoVfrh98a8VcREHQvkngkMyQnj4fopr9
 9/JKJIGv2gOuXgUBQ3YTqF8=
X-Google-Smtp-Source: ABdhPJxaz28PYQ35Wfmym28CU2K+2NUsw0eru7iNFYFgvSreRZB/Bh/RywuhliZ94EGhT1iapAfnXA==
X-Received: by 2002:a17:90b:1016:: with SMTP id
 gm22mr7628862pjb.60.1589614599904; 
 Sat, 16 May 2020 00:36:39 -0700 (PDT)
Received: from localhost ([61.68.67.54])
 by smtp.gmail.com with ESMTPSA id 192sm3553340pfu.182.2020.05.16.00.36.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 May 2020 00:36:39 -0700 (PDT)
Date: Sat, 16 May 2020 17:36:33 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v5 2/2] powerpc/rtas: Implement reentrant rtas call
To: Allison Randal <allison@lohutok.net>, Thiago Jung Bauermann
 <bauerman@linux.ibm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Daniel Axtens <dja@axtens.net>, "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Anshuman Khandual
 <khandual@linux.vnet.ibm.com>, Leonardo Bras <leobras.c@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nadav Amit <namit@vmware.com>,
 Nathan Lynch <nathanl@linux.ibm.com>, Paul Mackerras <paulus@samba.org>,
 Thomas Gleixner <tglx@linutronix.de>
References: <20200516052137.175881-1-leobras.c@gmail.com>
 <20200516052137.175881-3-leobras.c@gmail.com>
In-Reply-To: <20200516052137.175881-3-leobras.c@gmail.com>
MIME-Version: 1.0
Message-Id: <1589614523.yfijifo1n6.astroid@bobo.none>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Leonardo Bras's message of May 16, 2020 3:21 pm:
> Implement rtas_call_reentrant() for reentrant rtas-calls:
> "ibm,int-on", "ibm,int-off",ibm,get-xive" and  "ibm,set-xive".
>=20
> On LoPAPR Version 1.1 (March 24, 2016), from 7.3.10.1 to 7.3.10.4,
> items 2 and 3 say:
>=20
> 2 - For the PowerPC External Interrupt option: The * call must be
> reentrant to the number of processors on the platform.
> 3 - For the PowerPC External Interrupt option: The * argument call
> buffer for each simultaneous call must be physically unique.
>=20
> So, these rtas-calls can be called in a lockless way, if using
> a different buffer for each cpu doing such rtas call.
>=20
> For this, it was suggested to add the buffer (struct rtas_args)
> in the PACA struct, so each cpu can have it's own buffer.
> The PACA struct received a pointer to rtas buffer, which is
> allocated in the memory range available to rtas 32-bit.
>=20
> Reentrant rtas calls are useful to avoid deadlocks in crashing,
> where rtas-calls are needed, but some other thread crashed holding
> the rtas.lock.
>=20
> This is a backtrace of a deadlock from a kdump testing environment:
>=20
>   #0 arch_spin_lock
>   #1  lock_rtas ()
>   #2  rtas_call (token=3D8204, nargs=3D1, nret=3D1, outputs=3D0x0)
>   #3  ics_rtas_mask_real_irq (hw_irq=3D4100)
>   #4  machine_kexec_mask_interrupts
>   #5  default_machine_crash_shutdown
>   #6  machine_crash_shutdown
>   #7  __crash_kexec
>   #8  crash_kexec
>   #9  oops_end
>=20
> Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> ---
>  arch/powerpc/include/asm/paca.h     |  2 ++
>  arch/powerpc/include/asm/rtas.h     |  1 +
>  arch/powerpc/kernel/paca.c          | 20 +++++++++++
>  arch/powerpc/kernel/rtas.c          | 52 +++++++++++++++++++++++++++++
>  arch/powerpc/sysdev/xics/ics-rtas.c | 22 ++++++------
>  5 files changed, 86 insertions(+), 11 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/paca.h b/arch/powerpc/include/asm/p=
aca.h
> index e3cc9eb9204d..87cd9c2220cc 100644
> --- a/arch/powerpc/include/asm/paca.h
> +++ b/arch/powerpc/include/asm/paca.h
> @@ -29,6 +29,7 @@
>  #include <asm/hmi.h>
>  #include <asm/cpuidle.h>
>  #include <asm/atomic.h>
> +#include <asm/rtas-types.h>
> =20
>  #include <asm-generic/mmiowb_types.h>
> =20
> @@ -270,6 +271,7 @@ struct paca_struct {
>  #ifdef CONFIG_MMIOWB
>  	struct mmiowb_state mmiowb_state;
>  #endif
> +	struct rtas_args *reentrant_args;
>  } ____cacheline_aligned;
> =20
>  extern void copy_mm_to_paca(struct mm_struct *mm);
> diff --git a/arch/powerpc/include/asm/rtas.h b/arch/powerpc/include/asm/r=
tas.h
> index c35c5350b7e4..fa7509c85881 100644
> --- a/arch/powerpc/include/asm/rtas.h
> +++ b/arch/powerpc/include/asm/rtas.h
> @@ -236,6 +236,7 @@ extern struct rtas_t rtas;
>  extern int rtas_token(const char *service);
>  extern int rtas_service_present(const char *service);
>  extern int rtas_call(int token, int, int, int *, ...);
> +int rtas_call_reentrant(int token, int nargs, int nret, int *outputs, ..=
.);
>  void rtas_call_unlocked(struct rtas_args *args, int token, int nargs,
>  			int nret, ...);
>  extern void __noreturn rtas_restart(char *cmd);
> diff --git a/arch/powerpc/kernel/paca.c b/arch/powerpc/kernel/paca.c
> index 3f91ccaa9c74..88c9b61489fc 100644
> --- a/arch/powerpc/kernel/paca.c
> +++ b/arch/powerpc/kernel/paca.c
> @@ -16,6 +16,7 @@
>  #include <asm/kexec.h>
>  #include <asm/svm.h>
>  #include <asm/ultravisor.h>
> +#include <asm/rtas.h>
> =20
>  #include "setup.h"
> =20
> @@ -164,6 +165,23 @@ static struct slb_shadow * __init new_slb_shadow(int=
 cpu, unsigned long limit)
> =20
>  #endif /* CONFIG_PPC_BOOK3S_64 */
> =20
> +/**
> + * new_rtas_args() - Allocates rtas args
> + * @cpu:	CPU number
> + * @limit:	Memory limit for this allocation
> + *
> + * Allocates a struct rtas_args and return it's pointer.
> + *
> + * Return:	Pointer to allocated rtas_args
> + */
> +static struct rtas_args * __init new_rtas_args(int cpu, unsigned long li=
mit)
> +{
> +	limit =3D min_t(unsigned long, limit, RTAS_INSTANTIATE_MAX);
> +
> +	return alloc_paca_data(sizeof(struct rtas_args), L1_CACHE_BYTES,
> +			       limit, cpu);
> +}
> +
>  /* The Paca is an array with one entry per processor.  Each contains an
>   * lppaca, which contains the information shared between the
>   * hypervisor and Linux.
> @@ -202,6 +220,7 @@ void __init __nostackprotector initialise_paca(struct=
 paca_struct *new_paca, int
>  	/* For now -- if we have threads this will be adjusted later */
>  	new_paca->tcd_ptr =3D &new_paca->tcd;
>  #endif
> +	new_paca->reentrant_args =3D NULL;
>  }
> =20
>  /* Put the paca pointer into r13 and SPRG_PACA */
> @@ -274,6 +293,7 @@ void __init allocate_paca(int cpu)
>  #ifdef CONFIG_PPC_BOOK3S_64
>  	paca->slb_shadow_ptr =3D new_slb_shadow(cpu, limit);
>  #endif
> +	paca->reentrant_args =3D new_rtas_args(cpu, limit);

Good, I think tihs should work as you want now. Can you allocate it like=20
lppacas? Put it under PSERIES (and in the paca) and check for !HV?

Thanks,
Nick
