Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BDF3A555B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2019 13:56:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46MT7m0PLhzDqdp
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2019 21:56:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46MT3j1VJFzDqbh
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Sep 2019 21:52:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 46MT3f2jkGz9sNx; Mon,  2 Sep 2019 21:52:46 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46MT3f0ptxz9sNk;
 Mon,  2 Sep 2019 21:52:46 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nayna Jain <nayna@linux.ibm.com>, linuxppc-dev@ozlabs.org,
 linux-integrity@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/2] powerpc: Add support to initialize ima policy rules
In-Reply-To: <1566218108-12705-3-git-send-email-nayna@linux.ibm.com>
References: <1566218108-12705-1-git-send-email-nayna@linux.ibm.com>
 <1566218108-12705-3-git-send-email-nayna@linux.ibm.com>
Date: Mon, 02 Sep 2019 21:52:46 +1000
Message-ID: <87sgpesynl.fsf@mpe.ellerman.id.au>
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
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Eric Ricther <erichte@linux.ibm.com>, Nayna Jain <nayna@linux.ibm.com>,
 Claudio Carvalho <cclaudio@linux.ibm.com>, Mimi Zohar <zohar@linux.ibm.com>,
 Matthew Garret <matthew.garret@nebula.com>, Paul Mackerras <paulus@samba.org>,
 Jeremy Kerr <jk@ozlabs.org>, Elaine Palmer <erpalmer@us.ibm.com>,
 George Wilson <gcwilson@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Nayna,

Some more comments below.

Nayna Jain <nayna@linux.ibm.com> writes:
> POWER secure boot relies on the kernel IMA security subsystem to
> perform the OS kernel image signature verification.

Again this is just a design choice we've made, it's not specified
anywhere or anything like that. And it only applies to bare metal secure
boot, at least so far. AIUI.

> Since each secure
> boot mode has different IMA policy requirements, dynamic definition of
> the policy rules based on the runtime secure boot mode of the system is
> required. On systems that support secure boot, but have it disabled,
> only measurement policy rules of the kernel image and modules are
> defined.

It's probably worth mentioning that we intend to use this in our
Linux-based boot loader, which uses kexec, and that's one of the reasons
why we're particularly interested in defining the rules for kexec?

> This patch defines the arch-specific implementation to retrieve the
> secure boot mode of the system and accordingly configures the IMA policy
> rules.
>
> This patch provides arch-specific IMA policies if PPC_SECURE_BOOT
> config is enabled.
>
> Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
> ---
>  arch/powerpc/Kconfig           |  2 ++
>  arch/powerpc/kernel/Makefile   |  2 +-
>  arch/powerpc/kernel/ima_arch.c | 50 ++++++++++++++++++++++++++++++++++
>  include/linux/ima.h            |  3 +-
>  4 files changed, 55 insertions(+), 2 deletions(-)
>  create mode 100644 arch/powerpc/kernel/ima_arch.c
>
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index c902a39124dc..42109682b727 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -917,6 +917,8 @@ config PPC_SECURE_BOOT
>  	bool
>  	default n
>  	depends on PPC64
> +	depends on IMA
> +	depends on IMA_ARCH_POLICY
>  	help
>  	  Linux on POWER with firmware secure boot enabled needs to define
>  	  security policies to extend secure boot to the OS.This config
> diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
> index d310ebb4e526..520b1c814197 100644
> --- a/arch/powerpc/kernel/Makefile
> +++ b/arch/powerpc/kernel/Makefile
> @@ -157,7 +157,7 @@ endif
>  obj-$(CONFIG_EPAPR_PARAVIRT)	+= epapr_paravirt.o epapr_hcalls.o
>  obj-$(CONFIG_KVM_GUEST)		+= kvm.o kvm_emul.o
>  
> -obj-$(CONFIG_PPC_SECURE_BOOT)	+= secboot.o
> +obj-$(CONFIG_PPC_SECURE_BOOT)	+= secboot.o ima_arch.o
>  
>  # Disable GCOV, KCOV & sanitizers in odd or sensitive code
>  GCOV_PROFILE_prom_init.o := n
> diff --git a/arch/powerpc/kernel/ima_arch.c b/arch/powerpc/kernel/ima_arch.c
> new file mode 100644
> index 000000000000..ac90fac83338
> --- /dev/null
> +++ b/arch/powerpc/kernel/ima_arch.c
> @@ -0,0 +1,50 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2019 IBM Corporation
> + * Author: Nayna Jain <nayna@linux.ibm.com>
> + *
> + * ima_arch.c
> + *      - initialize ima policies for PowerPC Secure Boot
> + */
> +
> +#include <linux/ima.h>
> +#include <asm/secboot.h>
> +
> +bool arch_ima_get_secureboot(void)
> +{
> +	return get_powerpc_secureboot();
> +}
> +
> +/*
> + * File signature verification is not needed, include only measurements
> + */
> +static const char *const default_arch_rules[] = {
> +	"measure func=KEXEC_KERNEL_CHECK",
> +	"measure func=MODULE_CHECK",
> +	NULL
> +};

The rules above seem fairly self explanatory.

> +
> +/* Both file signature verification and measurements are needed */
> +static const char *const sb_arch_rules[] = {
> +	"measure func=KEXEC_KERNEL_CHECK template=ima-modsig",
> +	"appraise func=KEXEC_KERNEL_CHECK appraise_type=imasig|modsig",
> +#if IS_ENABLED(CONFIG_MODULE_SIG)
> +	"measure func=MODULE_CHECK",
> +#else
> +	"measure func=MODULE_CHECK template=ima-modsig",
> +	"appraise func=MODULE_CHECK appraise_type=imasig|modsig",
> +#endif

But these ones are not so obvious, at least to me who knows very little
about IMA.

Can you add a one line comment to each of the ones in here saying what
it does and why we want it?

> +	NULL
> +};
> +
> +/*
> + * On PowerPC, file measurements are to be added to the IMA measurement list
> + * irrespective of the secure boot state of the system.

Why? Just because we think it's useful? Would be good to provide some
further justification.

    * Signature verification
> + * is conditionally enabled based on the secure boot state.
> + */
> +const char *const *arch_get_ima_policy(void)
> +{
> +	if (IS_ENABLED(CONFIG_IMA_ARCH_POLICY) && arch_ima_get_secureboot())
> +		return sb_arch_rules;
> +	return default_arch_rules;
> +}
> diff --git a/include/linux/ima.h b/include/linux/ima.h
> index a20ad398d260..10af09b5b478 100644
> --- a/include/linux/ima.h
> +++ b/include/linux/ima.h
> @@ -29,7 +29,8 @@ extern void ima_kexec_cmdline(const void *buf, int size);
>  extern void ima_add_kexec_buffer(struct kimage *image);
>  #endif
>  
> -#if (defined(CONFIG_X86) && defined(CONFIG_EFI)) || defined(CONFIG_S390)
> +#if (defined(CONFIG_X86) && defined(CONFIG_EFI)) || defined(CONFIG_S390) \
> +	|| defined(CONFIG_PPC_SECURE_BOOT)
>  extern bool arch_ima_get_secureboot(void);
>  extern const char * const *arch_get_ima_policy(void);
>  #else


cheers
