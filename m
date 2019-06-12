Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 55AB441C1A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 08:19:51 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45NxYJ2hRNzDqnT
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 16:19:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45NxVY6QTSzDr1G
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 16:17:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="PpN6PEFO"; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 45NxVY3Hsbz8sw2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 16:17:25 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 45NxVY2J5Lz9sNC; Wed, 12 Jun 2019 16:17:25 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=axtens.net
 (client-ip=2607:f8b0:4864:20::442; helo=mail-pf1-x442.google.com;
 envelope-from=dja@axtens.net; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="PpN6PEFO"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 45NxVV1b0zz9sBr
 for <linuxppc-dev@ozlabs.org>; Wed, 12 Jun 2019 16:17:21 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id 19so8160322pfa.4
 for <linuxppc-dev@ozlabs.org>; Tue, 11 Jun 2019 23:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=XfFiCk2hi1loFtSR3ZjqlUfAHTiBWq39sAwp51Bhapc=;
 b=PpN6PEFOS8qSJMctngFCBYS8DwxqTL8A0MvDrI8OYBi51IL1MooDjOSwr8kS/34Aa3
 rgN5NL/7KMdG1BJZ7PFBMbNwGoGsLrsUS0ny07dPRed3UTCub5C2nJ6EWPzb/fOIZO3u
 U0KW4ZAje8M3MAei0/BOJqOEndEpk3+NoTxvI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=XfFiCk2hi1loFtSR3ZjqlUfAHTiBWq39sAwp51Bhapc=;
 b=pyBW71J7E0R1+4UR4JMur+xCVrWbBYWOWVZYTe73NPw9h8t/ox0gUiwVWLvK7JbL5C
 NJ1zTyN5a8W3JBR8XFb+1I5WWeOADOBWOWdo3NBFlpiC80OoelTm6uesszPh8dxHNiYq
 ewUR9gt5UweI+3k5ex3jh+snlqsPszhfG1y+UDmb4SgJEC6NtH/7OMvAVzisFm/4pLmM
 +x5EQ+o1hmqZ3nYvxr2prV+ipNt4pwqxtFPSr0Rtnjw5UPhwSP9MjfalP/G6eaJ8Ke85
 XtCyBJIISIMALb7SHIagdbMNLlan6LxanIOvEEV7fPD/V0BlVzX9H7LoPlpy2oHI9xaZ
 nkHw==
X-Gm-Message-State: APjAAAXiEjX+UaiUDVQuwlEv/ewBtoG4iErsrZLICnPo87EbitiLTVLz
 6tZk9x0Shx25vb7nvahcnGLnKw==
X-Google-Smtp-Source: APXvYqySJlPYC22TbdsrGitWsIlEDVh3N6b9eggOHerDOFQzVYMRWmAjE6cTAFrrhQFh7QhZKBhg4g==
X-Received: by 2002:a17:90a:db42:: with SMTP id
 u2mr21939507pjx.48.1560320239501; 
 Tue, 11 Jun 2019 23:17:19 -0700 (PDT)
Received: from localhost (ppp167-251-205.static.internode.on.net.
 [59.167.251.205])
 by smtp.gmail.com with ESMTPSA id x129sm18478568pfb.29.2019.06.11.23.17.17
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 11 Jun 2019 23:17:18 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Nayna Jain <nayna@linux.ibm.com>, linuxppc-dev@ozlabs.org,
 linux-efi@vger.kernel.org, linux-integrity@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] powerpc/powernv: Add OPAL API interface to get
 secureboot state
In-Reply-To: <1560198837-18857-2-git-send-email-nayna@linux.ibm.com>
References: <1560198837-18857-1-git-send-email-nayna@linux.ibm.com>
 <1560198837-18857-2-git-send-email-nayna@linux.ibm.com>
Date: Wed, 12 Jun 2019 16:17:14 +1000
Message-ID: <87ftofpbth.fsf@dja-thinkpad.axtens.net>
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
 Nayna Jain <nayna@linux.ibm.com>, Claudio Carvalho <cclaudio@linux.ibm.com>,
 Mimi Zohar <zohar@linux.ibm.com>, Matthew Garret <matthew.garret@nebula.com>,
 Paul Mackerras <paulus@samba.org>, Jeremy Kerr <jk@ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nayna Jain <nayna@linux.ibm.com> writes:

> From: Claudio Carvalho <cclaudio@linux.ibm.com>
>
> The X.509 certificates trusted by the platform and other information
> required to secure boot the OS kernel are wrapped in secure variables,
> which are controlled by OPAL.
>
> This patch adds support to read OPAL secure variables through
> OPAL_SECVAR_GET call. It returns the metadata and data for a given secure
> variable based on the unique key.
>
> Since OPAL can support different types of backend which can vary in the
> variable interpretation, a new OPAL API call named OPAL_SECVAR_BACKEND, is
> added to retrieve the supported backend version. This helps the consumer
> to know how to interpret the variable.
>

(Firstly, apologies that I haven't got around to asking about this yet!)

Are pluggable/versioned backend a good idea?

There are a few things that worry me about the idea:

 - It adds complexity in crypto (or crypto-adjacent) code, and that
   increases the likelihood that we'll accidentally add a bug with bad
   consequences.

 - Under what circumstances would would we change the kernel-visible
   behaviour of skiboot? Are we expecting to change the behaviour,
   content or names of the variables in future? Otherwise the only
   relevant change I can think of is a change to hardware platforms, and
   I'm not sure how a change in hardware would lead to change in
   behaviour in the kernel. Wouldn't Skiboot hide h/w differences?

 - If we are worried about a long-term-future change to how secure-boot
   works, would it be better to just add more get/set calls to opal at
   the point at which we actually implement the new system?
   
 - UEFI added EFI_VARIABLE_AUTHENTICATION_3 in a way that - as far
   as I know - didn't break backwards compatibility. Is there a reason
   we cannot add features that way instead? (It also dropped v1 of the
   authentication header.)
   
 - What is the correct fallback behaviour if a kernel receives a result
   that it does not expect? If a kernel expecting BackendV1 is instead
   informed that it is running on BackendV2, then the cannot access the
   secure variable at all, so it cannot load keys that are potentially
   required to successfully boot (e.g. to validate the module for
   network card or graphics!)

Kind regards,
Daniel

> This support can be enabled using CONFIG_OPAL_SECVAR
>
> Signed-off-by: Claudio Carvalho <cclaudio@linux.ibm.com>
> Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
> ---
> This patch depends on a new OPAL call that is being added to skiboot.
> The patch set that implements the new call has been posted to
> https://patchwork.ozlabs.org/project/skiboot/list/?series=112868
>
>  arch/powerpc/include/asm/opal-api.h          |  4 +-
>  arch/powerpc/include/asm/opal-secvar.h       | 23 ++++++
>  arch/powerpc/include/asm/opal.h              |  6 ++
>  arch/powerpc/platforms/powernv/Kconfig       |  6 ++
>  arch/powerpc/platforms/powernv/Makefile      |  1 +
>  arch/powerpc/platforms/powernv/opal-call.c   |  2 +
>  arch/powerpc/platforms/powernv/opal-secvar.c | 85 ++++++++++++++++++++
>  7 files changed, 126 insertions(+), 1 deletion(-)
>  create mode 100644 arch/powerpc/include/asm/opal-secvar.h
>  create mode 100644 arch/powerpc/platforms/powernv/opal-secvar.c
>
> diff --git a/arch/powerpc/include/asm/opal-api.h b/arch/powerpc/include/asm/opal-api.h
> index e1577cfa7186..a505e669b4b6 100644
> --- a/arch/powerpc/include/asm/opal-api.h
> +++ b/arch/powerpc/include/asm/opal-api.h
> @@ -212,7 +212,9 @@
>  #define OPAL_HANDLE_HMI2			166
>  #define	OPAL_NX_COPROC_INIT			167
>  #define OPAL_XIVE_GET_VP_STATE			170
> -#define OPAL_LAST				170
> +#define OPAL_SECVAR_GET                         173
> +#define OPAL_SECVAR_BACKEND                     177
> +#define OPAL_LAST				177
>  
>  #define QUIESCE_HOLD			1 /* Spin all calls at entry */
>  #define QUIESCE_REJECT			2 /* Fail all calls with OPAL_BUSY */
> diff --git a/arch/powerpc/include/asm/opal-secvar.h b/arch/powerpc/include/asm/opal-secvar.h
> new file mode 100644
> index 000000000000..b677171a0368
> --- /dev/null
> +++ b/arch/powerpc/include/asm/opal-secvar.h
> @@ -0,0 +1,23 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * PowerNV definitions for secure variables OPAL API.
> + *
> + * Copyright (C) 2019 IBM Corporation
> + * Author: Claudio Carvalho <cclaudio@linux.ibm.com>
> + *
> + */
> +#ifndef OPAL_SECVAR_H
> +#define OPAL_SECVAR_H
> +
> +enum {
> +	BACKEND_NONE = 0,
> +	BACKEND_TC_COMPAT_V1,
> +};
> +
> +extern int opal_get_variable(u8 *key, unsigned long ksize,
> +			     u8 *metadata, unsigned long *mdsize,
> +			     u8 *data, unsigned long *dsize);
> +
> +extern int opal_variable_version(unsigned long *backend);
> +
> +#endif
> diff --git a/arch/powerpc/include/asm/opal.h b/arch/powerpc/include/asm/opal.h
> index 4cc37e708bc7..57d2c2356eda 100644
> --- a/arch/powerpc/include/asm/opal.h
> +++ b/arch/powerpc/include/asm/opal.h
> @@ -394,6 +394,12 @@ void opal_powercap_init(void);
>  void opal_psr_init(void);
>  void opal_sensor_groups_init(void);
>  
> +extern int opal_secvar_get(uint64_t k_key, uint64_t k_key_len,
> +			   uint64_t k_metadata, uint64_t k_metadata_size,
> +			   uint64_t k_data, uint64_t k_data_size);
> +
> +extern int opal_secvar_backend(uint64_t k_backend);
> +
>  #endif /* __ASSEMBLY__ */
>  
>  #endif /* _ASM_POWERPC_OPAL_H */
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
> index 36c8fa3647a2..0445980f294f 100644
> --- a/arch/powerpc/platforms/powernv/opal-call.c
> +++ b/arch/powerpc/platforms/powernv/opal-call.c
> @@ -288,3 +288,5 @@ OPAL_CALL(opal_pci_set_pbcq_tunnel_bar,		OPAL_PCI_SET_PBCQ_TUNNEL_BAR);
>  OPAL_CALL(opal_sensor_read_u64,			OPAL_SENSOR_READ_U64);
>  OPAL_CALL(opal_sensor_group_enable,		OPAL_SENSOR_GROUP_ENABLE);
>  OPAL_CALL(opal_nx_coproc_init,			OPAL_NX_COPROC_INIT);
> +OPAL_CALL(opal_secvar_get,                      OPAL_SECVAR_GET);
> +OPAL_CALL(opal_secvar_backend,                  OPAL_SECVAR_BACKEND);
> diff --git a/arch/powerpc/platforms/powernv/opal-secvar.c b/arch/powerpc/platforms/powernv/opal-secvar.c
> new file mode 100644
> index 000000000000..dba441dd5af1
> --- /dev/null
> +++ b/arch/powerpc/platforms/powernv/opal-secvar.c
> @@ -0,0 +1,85 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * PowerNV code for secure variables
> + *
> + * Copyright (C) 2019 IBM Corporation
> + * Author: Claudio Carvalho <cclaudio@linux.ibm.com>
> + *
> + */
> +
> +/*
> + * The opal wrappers in this file treat the @name, @vendor, and @data
> + * parameters as little endian blobs.
> + * @name is a ucs2 string
> + * @vendor is the vendor GUID. It is converted to LE in the kernel
> + * @data variable data, which layout may be different for each variable
> + */
> +
> +#define pr_fmt(fmt) "secvar: "fmt
> +
> +#include <linux/types.h>
> +#include <asm/opal.h>
> +#include <asm/opal-secvar.h>
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
> +	    || !opal_check_token(OPAL_SECVAR_BACKEND)) {
> +		pr_err("OPAL doesn't support secure variables\n");
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
> +int opal_get_variable(u8 *key, unsigned long ksize, u8 *metadata,
> +		      unsigned long *mdsize, u8 *data, unsigned long *dsize)
> +{
> +	int rc;
> +
> +	if (!is_opal_secvar_supported())
> +		return OPAL_UNSUPPORTED;
> +
> +	if (mdsize)
> +		*mdsize = cpu_to_be64(*mdsize);
> +	if (dsize)
> +		*dsize = cpu_to_be64(*dsize);
> +
> +	rc = opal_secvar_get(__pa(key), ksize, __pa(metadata), __pa(mdsize),
> +			     __pa(data), __pa(dsize));
> +
> +	if (mdsize)
> +		*mdsize = be64_to_cpu(*mdsize);
> +	if (dsize)
> +		*dsize = be64_to_cpu(*dsize);
> +
> +	return rc;
> +}
> +
> +int opal_variable_version(unsigned long *backend)
> +{
> +	int rc;
> +
> +	if (!is_opal_secvar_supported())
> +		return OPAL_UNSUPPORTED;
> +
> +	if (backend)
> +		*backend = cpu_to_be64(*backend);
> +
> +	rc = opal_secvar_backend(__pa(backend));
> +
> +	if (backend)
> +		*backend = be64_to_cpu(*backend);
> +
> +	return rc;
> +}
> -- 
> 2.20.1
