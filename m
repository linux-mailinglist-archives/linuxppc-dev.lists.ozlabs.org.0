Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2DC98AAA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2019 07:04:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46DXWp0fX0zDr68
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2019 15:04:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46DXTf0nHDzDr1P
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2019 15:02:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="SRFi5P2N"; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46DXTc5YWqz8t5T
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2019 15:02:44 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46DXTc4YsRz9sML; Thu, 22 Aug 2019 15:02:44 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::541; helo=mail-pg1-x541.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="SRFi5P2N"; 
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 46DXTc1ZV5z9s3Z;
 Thu, 22 Aug 2019 15:02:44 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id d1so2776314pgp.4;
 Wed, 21 Aug 2019 22:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=G2YwCsG49ayjEsfaaTfZWksO9ojMqS2MFaqkKcrZSO4=;
 b=SRFi5P2NOcEPpmh3gv0H7a6qYusKyqO+o+e/y8U0ZVKyy/ymbT2J1QXRscnuYNeVSP
 wfSiHaJsIgnPx04q9XcHHDuQlJZsDuwiyiQVFKMtjQmWz+2qo5IIMQ6fqcWADVSTR+mH
 Q2e8qoGQAhDcOpco7fTUvoEteO1jhipWYq4ar3Vye+Ld+GOdgedkDEAMEGNL7wN81t4Q
 Y4AbBg7vCHRZtvOhuEe2nCzvOlYbihj9pWQ7aYffxT2r3mQx/4mYDsXFkbDXaKWF9Q+u
 mPBo6zBV/UJngPPBUA3ZuSOJj3DlokDR/b3bf/oxvQNoJPe9onKjZC7uqNkuztKO65Ga
 RnzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=G2YwCsG49ayjEsfaaTfZWksO9ojMqS2MFaqkKcrZSO4=;
 b=XyIZEehGQNc3Vs32gDysNBysryJCh4hBeUyIEjEtlW3T+H098/OzCRM7YNMdNEkneM
 wu1ZlUXDOmdavY5UJBYui7794F2liYmuiItYX6hLNNrTRt12cxAgA3OxoqUyuYouOd0F
 ogljQ1XmVFsNG0S1PAAnnBt1fBB/vwriSPY7jvW3zGlWBVo+XUbAhcvRnLCaFi/hwbY5
 TgyHR+q6JjEE1MZoCOjlJAntoGF5X5kDbBLwBfF10wcSH8PUH4ehUcGjXbDHo8PXVe05
 LrJJL6MwemmXyDWXIwguDhI5cUscySK6secI2UBy4ADov6asFjzAxIfBjg/ZEkPa+KCz
 bIhQ==
X-Gm-Message-State: APjAAAXpGC2fmfSAF0Yc3TIQ0ewU02Qv4t79ub/DF/4tfSvR9ttReccn
 P9rCv4ndYE0s5mByhIX4aq0=
X-Google-Smtp-Source: APXvYqylwS76fFFNKVMNqsFFQIUDfM9JN8RuhINp6htDvT03HL1BOrss1q7POwvQWI3qLcmpnXF93A==
X-Received: by 2002:a63:6106:: with SMTP id v6mr31564529pgb.36.1566450160714; 
 Wed, 21 Aug 2019 22:02:40 -0700 (PDT)
Received: from wafer.ozlabs.ibm.com ([122.99.82.10])
 by smtp.googlemail.com with ESMTPSA id j11sm1921312pjb.11.2019.08.21.22.02.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 22:02:39 -0700 (PDT)
Message-ID: <eda9210b56ab220519642d272079eeca60a18265.camel@gmail.com>
Subject: Re: [PATCH v2 1/4] powerpc/powernv: Add OPAL API interface to
 access secure variable
From: Oliver O'Halloran <oohall@gmail.com>
To: Nayna Jain <nayna@linux.ibm.com>, linuxppc-dev@ozlabs.org, 
 linux-efi@vger.kernel.org, linux-integrity@vger.kernel.org
Date: Thu, 22 Aug 2019 15:02:32 +1000
In-Reply-To: <1566400103-18201-2-git-send-email-nayna@linux.ibm.com>
References: <1566400103-18201-1-git-send-email-nayna@linux.ibm.com>
 <1566400103-18201-2-git-send-email-nayna@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
 Eric Ricther <erichte@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Mimi Zohar <zohar@linux.ibm.com>, Claudio Carvalho <cclaudio@linux.ibm.com>,
 Matthew Garret <matthew.garret@nebula.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Paul Mackerras <paulus@samba.org>, Jeremy Kerr <jk@ozlabs.org>,
 Elaine Palmer <erpalmer@us.ibm.com>, George Wilson <gcwilson@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2019-08-21 at 11:08 -0400, Nayna Jain wrote:
> The X.509 certificates trusted by the platform and required to secure boot
> the OS kernel are wrapped in secure variables, which are controlled by
> OPAL.
> 
> This patch adds firmware/kernel interface to read and write OPAL secure
> variables based on the unique key.
> 
> This support can be enabled using CONFIG_OPAL_SECVAR.
> 
> Signed-off-by: Claudio Carvalho <cclaudio@linux.ibm.com>
> Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/opal-api.h          |   5 +-
>  arch/powerpc/include/asm/opal.h              |   6 ++
>  arch/powerpc/include/asm/secvar.h            |  55 ++++++++++
>  arch/powerpc/kernel/Makefile                 |   2 +-
>  arch/powerpc/kernel/secvar-ops.c             |  25 +++++
>  arch/powerpc/platforms/powernv/Kconfig       |   6 ++
>  arch/powerpc/platforms/powernv/Makefile      |   1 +
>  arch/powerpc/platforms/powernv/opal-call.c   |   3 +
>  arch/powerpc/platforms/powernv/opal-secvar.c | 102 +++++++++++++++++++
>  arch/powerpc/platforms/powernv/opal.c        |   5 +
>  10 files changed, 208 insertions(+), 2 deletions(-)
>  create mode 100644 arch/powerpc/include/asm/secvar.h
>  create mode 100644 arch/powerpc/kernel/secvar-ops.c
>  create mode 100644 arch/powerpc/platforms/powernv/opal-secvar.c
> 
> diff --git a/arch/powerpc/include/asm/opal-api.h b/arch/powerpc/include/asm/opal-api.h
> index 383242eb0dea..b238b4f26c5b 100644
> --- a/arch/powerpc/include/asm/opal-api.h
> +++ b/arch/powerpc/include/asm/opal-api.h
> @@ -208,7 +208,10 @@
>  #define OPAL_HANDLE_HMI2			166
>  #define	OPAL_NX_COPROC_INIT			167
>  #define OPAL_XIVE_GET_VP_STATE			170
> -#define OPAL_LAST				170
> +#define OPAL_SECVAR_GET                         173
> +#define OPAL_SECVAR_GET_NEXT                    174
> +#define OPAL_SECVAR_ENQUEUE_UPDATE              175
> +#define OPAL_LAST                               175
>  
>  #define QUIESCE_HOLD			1 /* Spin all calls at entry */
>  #define QUIESCE_REJECT			2 /* Fail all calls with OPAL_BUSY */
> diff --git a/arch/powerpc/include/asm/opal.h b/arch/powerpc/include/asm/opal.h
> index 57bd029c715e..247adec2375f 100644
> --- a/arch/powerpc/include/asm/opal.h
> +++ b/arch/powerpc/include/asm/opal.h
> @@ -388,6 +388,12 @@ void opal_powercap_init(void);
>  void opal_psr_init(void);
>  void opal_sensor_groups_init(void);

Put these with the rest of the OPAL API wrapper prototypes
(i.e. just after opal_nx_coproc_init()) rather than with the
internal functions.
 
> > +extern int opal_secvar_get(uint64_t k_key, uint64_t k_key_len,
> +			   uint64_t k_data, uint64_t k_data_size);
> +extern int opal_secvar_get_next(uint64_t k_key, uint64_t k_key_len,
> +				uint64_t k_key_size);
> +extern int opal_secvar_enqueue_update(uint64_t k_key, uint64_t k_key_len,
> +				      uint64_t k_data, uint64_t k_data_size);

Everything in asm/opal.h is intended for consumption by the kernel, so
use a useful kernel type (or annotation) rather than blank uint64_t for
the parameters that are actually pointers. You should also ditch the k_
prefix since it doesn't make much sense having it inside the kernel.

As a general comment, don't use extern on function prototypes. They're
extern by default and, more importantly, it's contrary to the normal
kernel style.

>  #endif /* __ASSEMBLY__ */
>  
>  #endif /* _ASM_POWERPC_OPAL_H */
> diff --git a/arch/powerpc/include/asm/secvar.h b/arch/powerpc/include/asm/secvar.h
> new file mode 100644
> index 000000000000..645654456265
> --- /dev/null
> +++ b/arch/powerpc/include/asm/secvar.h
> @@ -0,0 +1,55 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * PowerPC secure variable operations.
> + *
> + * Copyright (C) 2019 IBM Corporation
> + * Author: Nayna Jain <nayna@linux.ibm.com>
> + *
> + */
> +#ifndef SECVAR_OPS_H
> +#define SECVAR_OPS_H
> +
> +#include<linux/types.h>
> +#include<linux/errno.h>
missing space

> +
> +struct secvar_operations {
> +	int (*get_variable)(const char *key, unsigned long key_len, u8 *data,
> +			    unsigned long *data_size);
> +	int (*get_next_variable)(const char *key, unsigned long *key_len,
> +				 unsigned long keysize);
> +	int (*set_variable)(const char *key, unsigned long key_len, u8 *data,
> +			    unsigned long data_size);
> +};


Calling them requires writing code like:

	secvar_ops->get_variable(blah);

Why not shorten it to:
	secvar_ops->get(blah);


> +#ifdef CONFIG_PPC_SECURE_BOOT
> +
> +extern void set_secvar_ops(struct secvar_operations *ops);
> +extern struct secvar_operations *get_secvar_ops(void);
> +
> +#else
> +
> +static inline void set_secvar_ops(struct secvar_operations *ops)
> +{
> +}
> +
> +static inline struct secvar_operations *get_secvar_ops(void)
> +{
> +	return NULL;
> +}
> +
> +#endif
> +#ifdef CONFIG_OPAL_SECVAR
> +
> +extern int secvar_init(void);
> +
> +#else
> +
> +static inline int secvar_init(void)
> +{
> +	return -EINVAL;
> +}
> +
> +#endif

The init function is always going to be platform specific so having an
opal-specific secvar_init() in a generic header doesn't make much sense
to me.

> +
> +#endif
> diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
> index 520b1c814197..9041563f1c74 100644
> --- a/arch/powerpc/kernel/Makefile
> +++ b/arch/powerpc/kernel/Makefile
> @@ -157,7 +157,7 @@ endif
>  obj-$(CONFIG_EPAPR_PARAVIRT)	+= epapr_paravirt.o epapr_hcalls.o
>  obj-$(CONFIG_KVM_GUEST)		+= kvm.o kvm_emul.o
>  
> -obj-$(CONFIG_PPC_SECURE_BOOT)	+= secboot.o ima_arch.o
> +obj-$(CONFIG_PPC_SECURE_BOOT)	+= secboot.o ima_arch.o secvar-ops.o
>  
>  # Disable GCOV, KCOV & sanitizers in odd or sensitive code
>  GCOV_PROFILE_prom_init.o := n
> diff --git a/arch/powerpc/kernel/secvar-ops.c b/arch/powerpc/kernel/secvar-ops.c
> new file mode 100644
> index 000000000000..198222499848
> --- /dev/null
> +++ b/arch/powerpc/kernel/secvar-ops.c
> @@ -0,0 +1,25 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2019 IBM Corporation
> + * Author: Nayna Jain <nayna@linux.ibm.com>
> + *
> + * secvar-ops.c
> + *      - initialize secvar operations for PowerPC Secureboot
> + */
> +

> +#include<stddef.h>
> +#include<asm/secvar.h>
missing space

> +
> +static struct secvar_operations *secvars_ops;
should be const

> +
> +void set_secvar_ops(struct secvar_operations *ops)
> +{
> +	if (!ops)
> +		secvars_ops = NULL;
> +	secvars_ops = ops;
> +}
> +
> +struct secvar_operations *get_secvar_ops(void)
> +{
> +	return secvars_ops;
> +}

Is this really any better than just making the ops pointer global?

> diff --git a/arch/powerpc/platforms/powernv/Kconfig b/arch/powerpc/platforms/powernv/Kconfig
> index 850eee860cf2..65b060539b5c 100644
> --- a/arch/powerpc/platforms/powernv/Kconfig
> +++ b/arch/powerpc/platforms/powernv/Kconfig
> @@ -47,3 +47,9 @@ config PPC_VAS
>  	  VAS adapters are found in POWER9 based systems.
>  
>  	  If unsure, say N.
> +
> +config OPAL_SECVAR
> +	bool "OPAL Secure Variables"
> +	depends on PPC_POWERNV
> +	help
> +	  This enables the kernel to access OPAL secure variables.
> diff --git a/arch/powerpc/platforms/powernv/Makefile b/arch/powerpc/platforms/powernv/Makefile
> index da2e99efbd04..6651c742e530 100644
> --- a/arch/powerpc/platforms/powernv/Makefile
> +++ b/arch/powerpc/platforms/powernv/Makefile
> @@ -16,3 +16,4 @@ obj-$(CONFIG_PERF_EVENTS) += opal-imc.o
>  obj-$(CONFIG_PPC_MEMTRACE)	+= memtrace.o
>  obj-$(CONFIG_PPC_VAS)	+= vas.o vas-window.o vas-debug.o
>  obj-$(CONFIG_OCXL_BASE)	+= ocxl.o
> +obj-$(CONFIG_OPAL_SECVAR) += opal-secvar.o
> diff --git a/arch/powerpc/platforms/powernv/opal-call.c b/arch/powerpc/platforms/powernv/opal-call.c
> index 29ca523c1c79..93106e867924 100644
> --- a/arch/powerpc/platforms/powernv/opal-call.c
> +++ b/arch/powerpc/platforms/powernv/opal-call.c
> @@ -287,3 +287,6 @@ OPAL_CALL(opal_pci_set_pbcq_tunnel_bar,		OPAL_PCI_SET_PBCQ_TUNNEL_BAR);
>  OPAL_CALL(opal_sensor_read_u64,			OPAL_SENSOR_READ_U64);
>  OPAL_CALL(opal_sensor_group_enable,		OPAL_SENSOR_GROUP_ENABLE);
>  OPAL_CALL(opal_nx_coproc_init,			OPAL_NX_COPROC_INIT);
> +OPAL_CALL(opal_secvar_get,                     OPAL_SECVAR_GET);
> +OPAL_CALL(opal_secvar_get_next,                 OPAL_SECVAR_GET_NEXT);
> +OPAL_CALL(opal_secvar_enqueue_update,           OPAL_SECVAR_ENQUEUE_UPDATE);
> diff --git a/arch/powerpc/platforms/powernv/opal-secvar.c b/arch/powerpc/platforms/powernv/opal-secvar.c
> new file mode 100644
> index 000000000000..b0f97cea7675
> --- /dev/null
> +++ b/arch/powerpc/platforms/powernv/opal-secvar.c
> @@ -0,0 +1,102 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * PowerNV code for secure variables
> + *
> + * Copyright (C) 2019 IBM Corporation
> + * Author: Claudio Carvalho <cclaudio@linux.ibm.com>
> + *
> + * APIs to access secure variables managed by OPAL.
> + *
> + */
> +
> +#define pr_fmt(fmt) "secvar: "fmt
> +
> +#include <linux/types.h>
> +#include <asm/opal.h>
> +#include <asm/secvar.h>
> +
> +static bool is_opal_secvar_supported(void)
> +{
> +	static bool opal_secvar_supported;
> +	static bool initialized;
> +
> +	if (initialized)
> +		return opal_secvar_supported;
> +
> +	if (!opal_check_token(OPAL_SECVAR_GET)
> +			|| !opal_check_token(OPAL_SECVAR_GET_NEXT)
> +			|| !opal_check_token(OPAL_SECVAR_ENQUEUE_UPDATE)) {

> +		pr_err("OPAL doesn't support secure variables\n");

This should only print an error if OPAL has advertised support for
secure variables through the DT, but doesn't support the OPAL
calls. Otherwise we'll get a spurious error message on any system
running currently released firmware.

> +		opal_secvar_supported = false;
> +	} else {
> +		opal_secvar_supported = true;
> +	}
> +
> +	initialized = true;
> +
> +	return opal_secvar_supported;
> +}
> +
> +static int opal_get_variable(const char *key, unsigned long ksize,
> +			     u8 *data, unsigned long *dsize)
> +{
> +	int rc;
> +
> +	if (!is_opal_secvar_supported())
> +		return OPAL_UNSUPPORTED;

This should be -ENXIO or -ENOSUPP. OPAL_UNSUPPORTED is an OPAL return
code, not a kernel one. That said, if the firmware doesn't support
secure variables we should never be calling this function anyway since
the ops pointer is never set.

> +
> +	if (dsize)
> +		*dsize = cpu_to_be64(*dsize);
> +
> +	rc = opal_secvar_get(__pa(key), ksize,
> +			__pa(data), __pa(dsize));
> +
> +	if (dsize)
> +		*dsize = be64_to_cpu(*dsize);
> +
> +	return rc;
> +}
> +
> +static int opal_get_next_variable(const char *key, unsigned long *keylen,
> +				  unsigned long keysize)
> +{
> +	int rc;
> +
> +	if (!is_opal_secvar_supported())
> +		return OPAL_UNSUPPORTED;
> +
> +	if (keylen)
> +		*keylen = cpu_to_be64(*keylen);
> +
> +	rc = opal_secvar_get_next(__pa(key), __pa(keylen), keysize);
> +
> +	if (keylen)
> +		*keylen = be64_to_cpu(*keylen);
> +
> +	return rc;
> +}
> +
> +static int opal_set_variable(const char *key, unsigned long ksize, u8 *data,
> +			     unsigned long dsize)
> +{
> +	int rc;
> +
> +	if (!is_opal_secvar_supported())
> +		return OPAL_UNSUPPORTED;
> +
> +	rc = opal_secvar_enqueue_update(__pa(key), ksize, __pa(data), dsize);
> +
> +	return rc;
> +}
> +

> +static struct secvar_operations secvar_ops = {
> +	.get_variable = opal_get_variable,
> +	.get_next_variable = opal_get_next_variable,
> +	.set_variable = opal_set_variable,
> +};

should be const

> +int secvar_init(void)
> +{
> +	set_secvar_ops(&secvar_ops);
> +	return 0;
> +}

Rename this to opal_secvar_init() and put the prototype in
arch/powerpc/platforms/powernv/powernv.h

> diff --git a/arch/powerpc/platforms/powernv/opal.c b/arch/powerpc/platforms/powernv/opal.c
> index aba443be7daa..ffe6f1cf0830 100644
> --- a/arch/powerpc/platforms/powernv/opal.c
> +++ b/arch/powerpc/platforms/powernv/opal.c
> @@ -32,6 +32,8 @@
>  #include <asm/mce.h>
>  #include <asm/imc-pmu.h>
>  #include <asm/bug.h>
> +#include <asm/secvar.h>
> +#include <asm/secboot.h>
>  
>  #include "powernv.h"
>  
> @@ -988,6 +990,9 @@ static int __init opal_init(void)
>  	/* Initialise OPAL Power control interface */
>  	opal_power_control_init();
>  
> +	if (is_powerpc_secvar_supported())
> +		secvar_init();
> +

The usual pattern here is to have the init function check for support
internally.

Also, is_powerpc_secvar_supported() doesn't appear to be defined
anywhere. Is that supposed to be is_opal_secvar_supported()? Or is this
series supposed to be applied on top of another series?

>  	return 0;
>  }
>  machine_subsys_initcall(powernv, opal_init);

