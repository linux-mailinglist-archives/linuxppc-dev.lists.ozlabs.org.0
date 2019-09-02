Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 19644A5556
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2019 13:54:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46MT5h4tlDzDqdq
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2019 21:54:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46MT3V0T3jzDqYY
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Sep 2019 21:52:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 46MT3T6XlYz9sN1; Mon,  2 Sep 2019 21:52:37 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46MT3T1Rzqz9s7T;
 Mon,  2 Sep 2019 21:52:37 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nayna Jain <nayna@linux.ibm.com>, linuxppc-dev@ozlabs.org,
 linux-integrity@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/2] powerpc: detect the secure boot mode of the system
In-Reply-To: <1566218108-12705-2-git-send-email-nayna@linux.ibm.com>
References: <1566218108-12705-1-git-send-email-nayna@linux.ibm.com>
 <1566218108-12705-2-git-send-email-nayna@linux.ibm.com>
Date: Mon, 02 Sep 2019 21:52:36 +1000
Message-ID: <87tv9usynv.fsf@mpe.ellerman.id.au>
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

Sorry I've taken so long to get to this series, there's just too many
patches that need reviewing :/

Nayna Jain <nayna@linux.ibm.com> writes:
> Secure boot on POWER defines different IMA policies based on the secure
> boot state of the system.

The terminology throughout is a bit vague, we have POWER, PowerPC, Linux
on POWER etc.

What this patch is talking about is a particular implemention of secure
boot on some OpenPOWER machines running bare metal - am I right?

So saying "Secure boot on POWER defines different IMA policies" is a bit
broad I think. Really we've just decided that a way to implement secure
boot is to use IMA policies.

> This patch defines a function to detect the secure boot state of the
> system.
>
> The PPC_SECURE_BOOT config represents the base enablement of secureboot
> on POWER.
>
> Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
> ---
>  arch/powerpc/Kconfig               | 11 +++++
>  arch/powerpc/include/asm/secboot.h | 27 ++++++++++++
>  arch/powerpc/kernel/Makefile       |  2 +
>  arch/powerpc/kernel/secboot.c      | 71 ++++++++++++++++++++++++++++++
>  4 files changed, 111 insertions(+)
>  create mode 100644 arch/powerpc/include/asm/secboot.h
>  create mode 100644 arch/powerpc/kernel/secboot.c
>
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 77f6ebf97113..c902a39124dc 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -912,6 +912,17 @@ config PPC_MEM_KEYS
>  
>  	  If unsure, say y.
>  
> +config PPC_SECURE_BOOT
> +	prompt "Enable PowerPC Secure Boot"

How about "Enable secure boot support"

> +	bool
> +	default n

The default is 'n', so you don't need that default line.

> +	depends on PPC64

Should it just depend on POWERNV for now? AFAIK there's nothing in here
that's necessarily going to be shared with the guest secure boot code is
there?

> +	help
> +	  Linux on POWER with firmware secure boot enabled needs to define
> +	  security policies to extend secure boot to the OS.This config
> +	  allows user to enable OS Secure Boot on PowerPC systems that
> +	  have firmware secure boot support.

Again POWER vs PowerPC.

I think something like:

"Enable support for secure boot on some systems that have firmware
support for it. If in doubt say N."


> diff --git a/arch/powerpc/include/asm/secboot.h b/arch/powerpc/include/asm/secboot.h

secure_boot.h would be fine.

> new file mode 100644
> index 000000000000..e726261bb00b
> --- /dev/null
> +++ b/arch/powerpc/include/asm/secboot.h
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * PowerPC secure boot definitions
> + *
> + * Copyright (C) 2019 IBM Corporation
> + * Author: Nayna Jain <nayna@linux.ibm.com>

I prefer to not have email addresses in copyright headers, as they just
bit rot. Your email is in the git log.

> + *
> + */
> +#ifndef POWERPC_SECBOOT_H
> +#define POWERPC_SECBOOT_H

We usually do _ASM_POWERPC_SECBOOT_H (or _ASM_POWERPC_SECURE_BOOT_H).

> +#ifdef CONFIG_PPC_SECURE_BOOT
> +extern struct device_node *is_powerpc_secvar_supported(void);
> +extern bool get_powerpc_secureboot(void);

You don't need 'extern' for functions in headers.

> +#else
> +static inline struct device_node *is_powerpc_secvar_supported(void)
> +{
> +	return NULL;
> +}
> +
> +static inline bool get_powerpc_secureboot(void)
> +{
> +	return false;
> +}
> +
> +#endif
> +#endif
> diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
> index ea0c69236789..d310ebb4e526 100644
> --- a/arch/powerpc/kernel/Makefile
> +++ b/arch/powerpc/kernel/Makefile
> @@ -157,6 +157,8 @@ endif
>  obj-$(CONFIG_EPAPR_PARAVIRT)	+= epapr_paravirt.o epapr_hcalls.o
>  obj-$(CONFIG_KVM_GUEST)		+= kvm.o kvm_emul.o
>  
> +obj-$(CONFIG_PPC_SECURE_BOOT)	+= secboot.o
> +
>  # Disable GCOV, KCOV & sanitizers in odd or sensitive code
>  GCOV_PROFILE_prom_init.o := n
>  KCOV_INSTRUMENT_prom_init.o := n
> diff --git a/arch/powerpc/kernel/secboot.c b/arch/powerpc/kernel/secboot.c
> new file mode 100644
> index 000000000000..5ea0d52d64ef
> --- /dev/null
> +++ b/arch/powerpc/kernel/secboot.c
> @@ -0,0 +1,71 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2019 IBM Corporation
> + * Author: Nayna Jain <nayna@linux.ibm.com>
> + *
> + * secboot.c
> + *      - util function to get powerpc secboot state

That's not really necessary.

> + */
> +#include <linux/types.h>
> +#include <linux/of.h>
> +#include <asm/secboot.h>
> +
> +struct device_node *is_powerpc_secvar_supported(void)

This is a pretty weird signature. The "is_" implies it will return a
bool, but then it actually returns a device node *.

> +{
> +	struct device_node *np;
> +	int status;
> +
> +	np = of_find_node_by_name(NULL, "ibm,secureboot");
> +	if (!np) {
> +		pr_info("secureboot node is not found\n");
> +		return NULL;
> +	}

There's no good reason to search by name. You should just search by compatible.

eg. of_find_compatible_node()

> +	status = of_device_is_compatible(np, "ibm,secureboot-v3");
> +	if (!status) {
> +		pr_info("Secure variables are not supported by this firmware\n");
> +		return NULL;
> +	}
> +
> +	return np;
> +}
> +
> +bool get_powerpc_secureboot(void)
> +{
> +	struct device_node *np;
> +	struct device_node *secvar_np;
> +	const u64 *psecboot;
> +	u64 secboot = 0;
> +
> +	np = is_powerpc_secvar_supported();
> +	if (!np)
> +		goto disabled;
> +
> +	/* Fail-safe for any failure related to secvar */
> +	secvar_np = of_get_child_by_name(np, "secvar");

Finding a child by name is not ideal, it encodes the structure of the
tree in the API. It's better to just search by compatible.

eg. of_find_compatible_node("ibm,secvar-v1")

You should also define what that means, ie. write a little snippet of
doc to define what the expected properties are and their meaning and so
on.

> +	if (!secvar_np) {
> +		pr_err("Expected secure variables support, fail-safe\n");

I'm a bit confused by this. This is the exact opposite of what I
understand fail-safe to mean. We shouldn't tell the user the system is
securely booted unless we're 100% sure it is. Right?

> +		goto enabled;
> +	}
> +
> +	if (!of_device_is_available(secvar_np)) {
> +		pr_err("Secure variables support is in error state, fail-safe\n");
> +		goto enabled;
> +	}

It seems a little weird to use the status property to indicate ok/error
and then also have a "secure-mode" property. Wouldn't just "secure-mode"
be sufficient with several states to represent what we need?

> +	psecboot = of_get_property(secvar_np, "secure-mode", NULL);
> +	if (!psecboot)
> +		goto enabled;

Please use of_read_property_u64() or similar.

> +	secboot = be64_to_cpup((__be64 *)psecboot);
> +	if (!(secboot & (~0x0)))

I'm not sure what that's trying to do.

> +		goto disabled;

> +
> +enabled:
> +	pr_info("secureboot mode enabled\n");
> +	return true;
> +
> +disabled:
> +	pr_info("secureboot mode disabled\n");
> +	return false;
> +}


cheers
