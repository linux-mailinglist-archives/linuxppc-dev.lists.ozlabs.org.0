Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 97DBBD70CE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Oct 2019 10:13:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46sp8l3jKqzDqy6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Oct 2019 19:13:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46sp6m3wvMzDqsQ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Oct 2019 19:11:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="H1pCqtXo"; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46sp6m2B5yz8tD6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Oct 2019 19:11:44 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 46sp6m1ks9z9sPZ; Tue, 15 Oct 2019 19:11:44 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="H1pCqtXo"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 46sp6m03Q1z9sPT;
 Tue, 15 Oct 2019 19:11:42 +1100 (AEDT)
Received: by mail-pf1-x441.google.com with SMTP id a2so11943515pfo.10;
 Tue, 15 Oct 2019 01:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=vW64wZu6/l4vzC6/hJKJXXrKXyjo7LzLgs4fHBIy1QM=;
 b=H1pCqtXo3KPG2AQy9za70n5OPdLiSxS5zCLmImJiUS8mH4grCUSf1jhXGonToEG8xI
 VWdKYJBYNPBNOHTihCIerMHsI/2mroL50QSlDBJS3RJuZ7TijsngtMA9bywNoUeKedlR
 DQW54vXFAc0UmtNOvHosgfLk8GPVJo9AhbJ5tJLHSkKIm4Fzm946DlOwCZLjCZuHkby5
 u0qLekHyrNR7k2boeVwsQcaJBn/f+VUMxyL2UtsPLSNP8xsCvBfgQHdXfzYREErigh2V
 qckN4CpbMkqIydM3NuBSvEGnTIdeQkKuHizCUTBNjqo6uA9/ACIRsjpp1kPgmhCnlrJ2
 65xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=vW64wZu6/l4vzC6/hJKJXXrKXyjo7LzLgs4fHBIy1QM=;
 b=dU+glILyaH7ipypbhuFUseNXIOPt0n+t/cP/RhLLkRbZUqVGHIxHBXRd05p+YiU+4k
 BLUtvvyFQDyfI9HH6nKYzbD3OIGKfn22DAGOE4lLiX0PWYI+Bqa+1dY+41On6A+ZBJIp
 iYuqizd5SZ9jSo/enFkZHwkkBezqtqLJsjo94Dm8eTp8l//FK/WUU16Dv3Arih52C75L
 8oAxfHbLXtigimKractOrGXKbo0GeOT33gIIBrXMxatSLKHCUJal5lsyD/Y9v0w+31OU
 s7p1Lw3OrccUZIMn0B0WpF1JeEwZZPbRoLhKYUhh2BDarHKumdQXHY6aKvEMZiaeZmIF
 w1jQ==
X-Gm-Message-State: APjAAAWIj1FwYQzAl3RqzfPkCXYdsqLtfZ+nmf5npXnjHwyOFC7ZMmqh
 JOV9szQQqLcfxHqcrixqDFM=
X-Google-Smtp-Source: APXvYqx5yXyL9mlUlnKinHbU9b5qNCRd+TYGMY/1JZE9nX888uZUA8PkvkKlCGcCOFstzpA5ThHBog==
X-Received: by 2002:a62:e807:: with SMTP id c7mr36571526pfi.18.1571127099701; 
 Tue, 15 Oct 2019 01:11:39 -0700 (PDT)
Received: from wafer.ozlabs.ibm.com ([122.99.82.10])
 by smtp.googlemail.com with ESMTPSA id a11sm23324851pfg.94.2019.10.15.01.11.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2019 01:11:37 -0700 (PDT)
Message-ID: <6ebe7ed1577115664ad7d82200c6a30ea2a93658.camel@gmail.com>
Subject: Re: [PATCH v4 1/4] powerpc/powernv: Add OPAL API interface to
 access secure variable
From: Oliver O'Halloran <oohall@gmail.com>
To: Nayna Jain <nayna@linux.ibm.com>, linuxppc-dev@ozlabs.org, 
 linux-efi@vger.kernel.org, linux-integrity@vger.kernel.org
Date: Tue, 15 Oct 2019 19:11:29 +1100
In-Reply-To: <1569973311-3047-2-git-send-email-nayna@linux.ibm.com>
References: <1569973311-3047-1-git-send-email-nayna@linux.ibm.com>
 <1569973311-3047-2-git-send-email-nayna@linux.ibm.com>
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

On Tue, 2019-10-01 at 19:41 -0400, Nayna Jain wrote:
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
>  arch/powerpc/include/asm/opal.h              |   8 ++
>  arch/powerpc/include/asm/powernv.h           |   2 +
>  arch/powerpc/include/asm/secvar.h            |  35 +++++
>  arch/powerpc/kernel/Makefile                 |   2 +-
>  arch/powerpc/kernel/secvar-ops.c             |  19 +++
>  arch/powerpc/platforms/powernv/Kconfig       |   6 +
>  arch/powerpc/platforms/powernv/Makefile      |   1 +
>  arch/powerpc/platforms/powernv/opal-call.c   |   3 +
>  arch/powerpc/platforms/powernv/opal-secvar.c | 137 +++++++++++++++++++
>  arch/powerpc/platforms/powernv/opal.c        |   5 +
>  11 files changed, 221 insertions(+), 2 deletions(-)
>  create mode 100644 arch/powerpc/include/asm/secvar.h
>  create mode 100644 arch/powerpc/kernel/secvar-ops.c
>  create mode 100644 arch/powerpc/platforms/powernv/opal-secvar.c
> 
> diff --git a/arch/powerpc/include/asm/opal-api.h b/arch/powerpc/include/asm/opal-api.h
> index 378e3997845a..c1f25a760eb1 100644
> --- a/arch/powerpc/include/asm/opal-api.h
> +++ b/arch/powerpc/include/asm/opal-api.h
> @@ -211,7 +211,10 @@
>  #define OPAL_MPIPL_UPDATE			173
>  #define OPAL_MPIPL_REGISTER_TAG			174
>  #define OPAL_MPIPL_QUERY_TAG			175
> -#define OPAL_LAST				175
> +#define OPAL_SECVAR_GET				176
> +#define OPAL_SECVAR_GET_NEXT			177
> +#define OPAL_SECVAR_ENQUEUE_UPDATE		178
> +#define OPAL_LAST				178
>  
>  #define QUIESCE_HOLD			1 /* Spin all calls at entry */
>  #define QUIESCE_REJECT			2 /* Fail all calls with OPAL_BUSY */
> diff --git a/arch/powerpc/include/asm/opal.h b/arch/powerpc/include/asm/opal.h
> index a0cf8fba4d12..03392dc3f5e2 100644
> --- a/arch/powerpc/include/asm/opal.h
> +++ b/arch/powerpc/include/asm/opal.h
> @@ -298,6 +298,13 @@ int opal_sensor_group_clear(u32 group_hndl, int token);
>  int opal_sensor_group_enable(u32 group_hndl, int token, bool enable);
>  int opal_nx_coproc_init(uint32_t chip_id, uint32_t ct);
>  
> +int opal_secvar_get(const char *key, uint64_t key_len, u8 *data,
> +		    uint64_t *data_size);
> +int opal_secvar_get_next(const char *key, uint64_t *key_len,
> +			 uint64_t key_buf_size);
> +int opal_secvar_enqueue_update(const char *key, uint64_t key_len, u8 *data,
> +			       uint64_t data_size);
> +
>  s64 opal_mpipl_update(enum opal_mpipl_ops op, u64 src, u64 dest, u64 size);
>  s64 opal_mpipl_register_tag(enum opal_mpipl_tags tag, u64 addr);
>  s64 opal_mpipl_query_tag(enum opal_mpipl_tags tag, u64 *addr);
> @@ -392,6 +399,7 @@ void opal_wake_poller(void);
>  void opal_powercap_init(void);
>  void opal_psr_init(void);
>  void opal_sensor_groups_init(void);
> +void opal_secvar_init(void);
>  
>  #endif /* __ASSEMBLY__ */
>  
> diff --git a/arch/powerpc/include/asm/powernv.h b/arch/powerpc/include/asm/powernv.h
> index e1a858718716..cff980a85dd2 100644
> --- a/arch/powerpc/include/asm/powernv.h
> +++ b/arch/powerpc/include/asm/powernv.h
> @@ -12,10 +12,12 @@ extern void powernv_set_nmmu_ptcr(unsigned long ptcr);
>  void pnv_program_cpu_hotplug_lpcr(unsigned int cpu, u64 lpcr_val);
>  
>  void pnv_tm_init(void);
> +
>  #else
>  static inline void powernv_set_nmmu_ptcr(unsigned long ptcr) { }
>  
>  static inline void pnv_tm_init(void) { }
> +
>  #endif
>  
>  #endif /* _ASM_POWERNV_H */
> diff --git a/arch/powerpc/include/asm/secvar.h b/arch/powerpc/include/asm/secvar.h
> new file mode 100644
> index 000000000000..4cc35b58b986
> --- /dev/null
> +++ b/arch/powerpc/include/asm/secvar.h
> @@ -0,0 +1,35 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2019 IBM Corporation
> + * Author: Nayna Jain
> + *
> + * PowerPC secure variable operations.
> + */
> +#ifndef SECVAR_OPS_H
> +#define SECVAR_OPS_H
> +
> +#include <linux/types.h>
> +#include <linux/errno.h>
> +
> +extern const struct secvar_operations *secvar_ops;
> +
> +struct secvar_operations {
> +	int (*get)(const char *key, uint64_t key_len, u8 *data,
> +		   uint64_t *data_size);
> +	int (*get_next)(const char *key, uint64_t *key_len,
> +			uint64_t keybufsize);
> +	int (*set)(const char *key, uint64_t key_len, u8 *data,
> +		   uint64_t data_size);
> +};
> +
> +#ifdef CONFIG_PPC_SECURE_BOOT
> +
> +extern void set_secvar_ops(const struct secvar_operations *ops);
> +
> +#else
> +
> +static inline void set_secvar_ops(const struct secvar_operations *ops) { }
> +
> +#endif
> +
> +#endif
> diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
> index e8eb2955b7d5..3cf26427334f 100644
> --- a/arch/powerpc/kernel/Makefile
> +++ b/arch/powerpc/kernel/Makefile
> @@ -161,7 +161,7 @@ ifneq ($(CONFIG_PPC_POWERNV)$(CONFIG_PPC_SVM),)
>  obj-y				+= ucall.o
>  endif
>  
> -obj-$(CONFIG_PPC_SECURE_BOOT)	+= secure_boot.o ima_arch.o
> +obj-$(CONFIG_PPC_SECURE_BOOT)	+= secure_boot.o ima_arch.o secvar-ops.o
>  
>  # Disable GCOV, KCOV & sanitizers in odd or sensitive code
>  GCOV_PROFILE_prom_init.o := n
> diff --git a/arch/powerpc/kernel/secvar-ops.c b/arch/powerpc/kernel/secvar-ops.c
> new file mode 100644
> index 000000000000..4331a5b66ec0
> --- /dev/null
> +++ b/arch/powerpc/kernel/secvar-ops.c
> @@ -0,0 +1,19 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2019 IBM Corporation
> + * Author: Nayna Jain
> + *
> + * This file initializes secvar operations for PowerPC Secureboot
> + */
> +
> +#include <stddef.h>
> +#include <asm/secvar.h>
> +
> +const struct secvar_operations *secvar_ops;
> +

> +void set_secvar_ops(const struct secvar_operations *ops)
> +{
> +	if (!ops)
> +		secvar_ops = NULL;
> +	secvar_ops = ops;
> +}

Seems a little redundant.

> diff --git a/arch/powerpc/platforms/powernv/Kconfig b/arch/powerpc/platforms/powernv/Kconfig
> index 938803eab0ad..a1c7c8e2e683 100644
> --- a/arch/powerpc/platforms/powernv/Kconfig
> +++ b/arch/powerpc/platforms/powernv/Kconfig
> @@ -50,3 +50,9 @@ config PPC_VAS
>  config SCOM_DEBUGFS
>  	bool "Expose SCOM controllers via debugfs"
>  	depends on DEBUG_FS
> +
> +config OPAL_SECVAR
> +	bool "OPAL Secure Variables"
> +	depends on PPC_POWERNV
> +	help
> +	  This enables the kernel to access OPAL secure variables.
> diff --git a/arch/powerpc/platforms/powernv/Makefile b/arch/powerpc/platforms/powernv/Makefile
> index a3ac9646119d..0ae688bde9b7 100644
> --- a/arch/powerpc/platforms/powernv/Makefile
> +++ b/arch/powerpc/platforms/powernv/Makefile
> @@ -20,3 +20,4 @@ obj-$(CONFIG_PPC_MEMTRACE)	+= memtrace.o
>  obj-$(CONFIG_PPC_VAS)	+= vas.o vas-window.o vas-debug.o
>  obj-$(CONFIG_OCXL_BASE)	+= ocxl.o
>  obj-$(CONFIG_SCOM_DEBUGFS) += opal-xscom.o
> +obj-$(CONFIG_OPAL_SECVAR) += opal-secvar.o
> diff --git a/arch/powerpc/platforms/powernv/opal-call.c b/arch/powerpc/platforms/powernv/opal-call.c
> index a2aa5e433ac8..5cd0f52d258f 100644
> --- a/arch/powerpc/platforms/powernv/opal-call.c
> +++ b/arch/powerpc/platforms/powernv/opal-call.c
> @@ -290,3 +290,6 @@ OPAL_CALL(opal_nx_coproc_init,			OPAL_NX_COPROC_INIT);
>  OPAL_CALL(opal_mpipl_update,			OPAL_MPIPL_UPDATE);
>  OPAL_CALL(opal_mpipl_register_tag,		OPAL_MPIPL_REGISTER_TAG);
>  OPAL_CALL(opal_mpipl_query_tag,			OPAL_MPIPL_QUERY_TAG);
> +OPAL_CALL(opal_secvar_get,			OPAL_SECVAR_GET);
> +OPAL_CALL(opal_secvar_get_next,			OPAL_SECVAR_GET_NEXT);
> +OPAL_CALL(opal_secvar_enqueue_update,		OPAL_SECVAR_ENQUEUE_UPDATE);
> diff --git a/arch/powerpc/platforms/powernv/opal-secvar.c b/arch/powerpc/platforms/powernv/opal-secvar.c
> new file mode 100644
> index 000000000000..ad5c6b8019dd
> --- /dev/null
> +++ b/arch/powerpc/platforms/powernv/opal-secvar.c
> @@ -0,0 +1,137 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * PowerNV code for secure variables
> + *
> + * Copyright (C) 2019 IBM Corporation
> + * Author: Claudio Carvalho
> + *         Nayna Jain
> + *
> + * APIs to access secure variables managed by OPAL.
> + */
> +
> +#define pr_fmt(fmt) "secvar: "fmt
> +
> +#include <linux/types.h>
> +#include <asm/opal.h>
> +#include <asm/secvar.h>
> +#include <asm/secure_boot.h>
> +
> +static int opal_status_to_err(int rc)
> +{
> +	int err;
> +
> +	switch (rc) {
> +	case OPAL_SUCCESS:
> +		err = 0;
> +		break;
> +	case OPAL_UNSUPPORTED:
> +		err = -ENXIO;
> +		break;
> +	case OPAL_PARAMETER:
> +		err = -EINVAL;
> +		break;
> +	case OPAL_RESOURCE:
> +		err = -ENOSPC;
> +		break;
> +	case OPAL_HARDWARE:
> +		err = -EIO;
> +		break;
> +	case OPAL_NO_MEM:
> +		err = -ENOMEM;
> +		break;
> +	case OPAL_EMPTY:
> +		err = -ENOENT;
> +		break;
> +	case OPAL_PARTIAL:
> +		err = -EFBIG;
> +		break;
> +	default:
> +		err = -EINVAL;
> +	}
> +
> +	return err;
> +}
> +
> +static bool is_opal_secvar_supported(void)
> +{
> +	static bool opal_secvar_supported;
> +	static bool initialized;
> +
> +	if (initialized)
> +		return opal_secvar_supported;
> +
> +	if (!is_powerpc_os_sb_supported()) {
> +		opal_secvar_supported = false;
> +		goto out;
> +	}
> +
> +	if (!opal_check_token(OPAL_SECVAR_GET)
> +			|| !opal_check_token(OPAL_SECVAR_GET_NEXT)
> +			|| !opal_check_token(OPAL_SECVAR_ENQUEUE_UPDATE)) {
> +		pr_err("OPAL doesn't support secure variables\n");
> +		opal_secvar_supported = false;
> +	} else {
> +		opal_secvar_supported = true;
> +	}
> +
> +out:
> +	initialized = true;
> +
> +	return opal_secvar_supported;
> +}
> +

> +static int opal_get_variable(const char *key, uint64_t ksize,
> +			     u8 *data, uint64_t *dsize)
> +{
> +	int rc;
> +
> +	if (dsize)
> +		*dsize = cpu_to_be64(*dsize);

Is passing a NULL size pointer ever a valid thing to do? I'd check with
Eric first, but IIRC OPAL will just reject that with OPAL_PARAMETER.
> +
> +	rc = opal_secvar_get(key, ksize, data, dsize);
> +
> +	if (dsize)
> +		*dsize = be64_to_cpu(*dsize);
> +
> +	return opal_status_to_err(rc);
> +}
> +
> +static int opal_get_next_variable(const char *key, uint64_t *keylen,
> +				  uint64_t keybufsize)
> +{
> +	int rc;
> +
> +	if (keylen)
> +		*keylen = cpu_to_be64(*keylen);same question
same here

> +
> +	rc = opal_secvar_get_next(key, keylen, keybufsize);
> +
> +	if (keylen)
> +		*keylen = be64_to_cpu(*keylen);
> +
> +	return opal_status_to_err(rc);
> +}

*snip*

> +void opal_secvar_init(void)
> +{
> +	if (!is_opal_secvar_supported())
> +		set_secvar_ops(NULL);

You might as well fold is_opal_secvar_supported() into this function
since its the only caller.

> +
> +	set_secvar_ops(&opal_secvar_ops);
> +}

Doesn't this unconditionally set the secvar ops to &opal_secvar_ops?

> diff --git a/arch/powerpc/platforms/powernv/opal.c b/arch/powerpc/platforms/powernv/opal.c
> index 38e90270280b..8e654d3735c1 100644
> --- a/arch/powerpc/platforms/powernv/opal.c
> +++ b/arch/powerpc/platforms/powernv/opal.c
> @@ -32,6 +32,8 @@
>  #include <asm/mce.h>
>  #include <asm/imc-pmu.h>
>  #include <asm/bug.h>
> +#include <asm/secvar.h>
> +#include <asm/secure_boot.h>
>  
>  #include "powernv.h"
>  
> @@ -1002,6 +1004,9 @@ static int __init opal_init(void)
>  	/* Initialise OPAL Power control interface */
>  	opal_power_control_init();
>  
> +	/* Initialize OPAL secure variables */
> +	opal_secvar_init();
> +
>  	return 0;
>  }
>  machine_subsys_initcall(powernv, opal_init);

