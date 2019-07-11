Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6783D65789
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2019 15:02:38 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45kx6g4wgmzDqgH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2019 23:02:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45kx0T72GxzDqdh
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jul 2019 22:57:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 45kx0T4yPQz9sNg; Thu, 11 Jul 2019 22:57:13 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45kx0T2lMSz9sNT;
 Thu, 11 Jul 2019 22:57:13 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Claudio Carvalho <cclaudio@linux.ibm.com>, linuxppc-dev@ozlabs.org
Subject: Re: [PATCH v4 3/8] KVM: PPC: Ultravisor: Add generic ultravisor call
 handler
In-Reply-To: <20190628200825.31049-4-cclaudio@linux.ibm.com>
References: <20190628200825.31049-1-cclaudio@linux.ibm.com>
 <20190628200825.31049-4-cclaudio@linux.ibm.com>
Date: Thu, 11 Jul 2019 22:57:12 +1000
Message-ID: <87lfx4g253.fsf@concordia.ellerman.id.au>
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
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Michael Anderson <andmike@linux.ibm.com>, Ram Pai <linuxram@us.ibm.com>,
 Claudio Carvalho <cclaudio@linux.ibm.com>, kvm-ppc@vger.kernel.org,
 Bharata B Rao <bharata@linux.ibm.com>, Ryan Grimm <grimm@linux.ibm.com>,
 Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>,
 Thiago Bauermann <bauerman@linux.ibm.com>,
 Anshuman Khandual <khandual@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Claudio Carvalho <cclaudio@linux.ibm.com> writes:
> From: Ram Pai <linuxram@us.ibm.com>
>
> Add the ucall() function, which can be used to make ultravisor calls
> with varied number of in and out arguments. Ultravisor calls can be made
> from the host or guests.
>
> This copies the implementation of plpar_hcall().

.. with quite a few changes?

This is one of the things I'd like to see in a Documentation file, so
that people can review the implementation vs the specification.

> Signed-off-by: Ram Pai <linuxram@us.ibm.com>
> [ Change ucall.S to not save CR, rename and move headers, build ucall.S
>   if CONFIG_PPC_POWERNV set, use R3 for the ucall number and add some
>   comments in the code ]

Why are we not saving CR? See previous comment about Documentation :)

> Signed-off-by: Claudio Carvalho <cclaudio@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/ultravisor-api.h | 20 +++++++++++++++
>  arch/powerpc/include/asm/ultravisor.h     | 20 +++++++++++++++
>  arch/powerpc/kernel/Makefile              |  2 +-
>  arch/powerpc/kernel/ucall.S               | 30 +++++++++++++++++++++++
>  arch/powerpc/kernel/ultravisor.c          |  4 +++
>  5 files changed, 75 insertions(+), 1 deletion(-)
>  create mode 100644 arch/powerpc/include/asm/ultravisor-api.h
>  create mode 100644 arch/powerpc/kernel/ucall.S
>
> diff --git a/arch/powerpc/include/asm/ultravisor-api.h b/arch/powerpc/include/asm/ultravisor-api.h
> new file mode 100644
> index 000000000000..49e766adabc7
> --- /dev/null
> +++ b/arch/powerpc/include/asm/ultravisor-api.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Ultravisor API.
> + *
> + * Copyright 2019, IBM Corporation.
> + *
> + */
> +#ifndef _ASM_POWERPC_ULTRAVISOR_API_H
> +#define _ASM_POWERPC_ULTRAVISOR_API_H
> +
> +#include <asm/hvcall.h>
> +
> +/* Return codes */
> +#define U_NOT_AVAILABLE		H_NOT_AVAILABLE
> +#define U_SUCCESS		H_SUCCESS
> +#define U_FUNCTION		H_FUNCTION
> +#define U_PARAMETER		H_PARAMETER

Is there any benefit in redefining these?

> diff --git a/arch/powerpc/include/asm/ultravisor.h b/arch/powerpc/include/asm/ultravisor.h
> index e5009b0d84ea..a78a2dacfd0b 100644
> --- a/arch/powerpc/include/asm/ultravisor.h
> +++ b/arch/powerpc/include/asm/ultravisor.h
> @@ -8,8 +8,28 @@
>  #ifndef _ASM_POWERPC_ULTRAVISOR_H
>  #define _ASM_POWERPC_ULTRAVISOR_H
>  
> +#include <asm/ultravisor-api.h>
> +
> +#if !defined(__ASSEMBLY__)

Just #ifndef is fine.

>  /* Internal functions */

How is it internal?

>  extern int early_init_dt_scan_ultravisor(unsigned long node, const char *uname,
>  					 int depth, void *data);
>  
> +/* API functions */
> +#define UCALL_BUFSIZE 4

Please don't copy this design from the hcall code, it has led to bugs in
the past.

See my (still unmerged) attempt to fix this for the hcall case:
  https://patchwork.ozlabs.org/patch/683577/

Basically instead of asking callers nicely to define a certain sized
buffer, and them forgetting, define a proper type that has the right size.

> +/**
> + * ucall: Make a powerpc ultravisor call.
> + * @opcode: The ultravisor call to make.
> + * @retbuf: Buffer to store up to 4 return arguments in.
> + *
> + * This call supports up to 6 arguments and 4 return arguments. Use
> + * UCALL_BUFSIZE to size the return argument buffer.
> + */
> +#if defined(CONFIG_PPC_POWERNV)

#ifdef

> +long ucall(unsigned long opcode, unsigned long *retbuf, ...);
> +#endif
> +
> +#endif /* !__ASSEMBLY__ */
> +
>  #endif	/* _ASM_POWERPC_ULTRAVISOR_H */
> diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
> index f0caa302c8c0..f28baccc0a79 100644
> --- a/arch/powerpc/kernel/Makefile
> +++ b/arch/powerpc/kernel/Makefile
> @@ -154,7 +154,7 @@ endif
>  
>  obj-$(CONFIG_EPAPR_PARAVIRT)	+= epapr_paravirt.o epapr_hcalls.o
>  obj-$(CONFIG_KVM_GUEST)		+= kvm.o kvm_emul.o
> -obj-$(CONFIG_PPC_POWERNV)	+= ultravisor.o
> +obj-$(CONFIG_PPC_POWERNV)	+= ultravisor.o ucall.o

Same comment about being platforms/powernv ?
> 
> diff --git a/arch/powerpc/kernel/ucall.S b/arch/powerpc/kernel/ucall.S
> new file mode 100644
> index 000000000000..1678f6eb7230
> --- /dev/null
> +++ b/arch/powerpc/kernel/ucall.S
> @@ -0,0 +1,30 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Generic code to perform an ultravisor call.
> + *
> + * Copyright 2019, IBM Corporation.
> + *
> + */
> +#include <asm/ppc_asm.h>
> +
> +/*
> + * This function is based on the plpar_hcall()

I don't think it meaningfully is any more.

> + */
> +_GLOBAL_TOC(ucall)

You don't need the TOC setup here (unless a later patch does?).

> +	std	r4,STK_PARAM(R4)(r1)	/* Save ret buffer */
> +	mr	r4,r5
> +	mr	r5,r6
> +	mr	r6,r7
> +	mr	r7,r8
> +	mr	r8,r9
> +	mr	r9,r10

Below you space the arguments, here you don't. Pick one or the other please.

> +
> +	sc 2				/* Invoke the ultravisor */
> +
> +	ld	r12,STK_PARAM(R4)(r1)
> +	std	r4,  0(r12)
> +	std	r5,  8(r12)
> +	std	r6, 16(r12)
> +	std	r7, 24(r12)
> +
> +	blr				/* Return r3 = status */
> diff --git a/arch/powerpc/kernel/ultravisor.c b/arch/powerpc/kernel/ultravisor.c
> index dc6021f63c97..02ddf79a9522 100644
> --- a/arch/powerpc/kernel/ultravisor.c
> +++ b/arch/powerpc/kernel/ultravisor.c
> @@ -8,10 +8,14 @@
>  #include <linux/init.h>
>  #include <linux/printk.h>
>  #include <linux/string.h>
> +#include <linux/export.h>
>  
>  #include <asm/ultravisor.h>
>  #include <asm/firmware.h>
>  
> +/* in ucall.S */
> +EXPORT_SYMBOL_GPL(ucall);

This should be in ucall.S

cheers
