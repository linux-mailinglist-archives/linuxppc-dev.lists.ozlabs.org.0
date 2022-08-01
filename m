Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA03586C23
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Aug 2022 15:41:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LxK5S0Prlz3c3T
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Aug 2022 23:41:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=vZsF5JXt;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=HMNxuNm0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.220.28; helo=smtp-out1.suse.de; envelope-from=msuchanek@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=vZsF5JXt;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=HMNxuNm0;
	dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LxK4l5N3Gz2xkr
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Aug 2022 23:40:23 +1000 (AEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id 7B6ED38C76;
	Mon,  1 Aug 2022 13:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1659361219; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=a/15e5KZCnNKb0azDiCVDEz20SQoPdOtelD54ZT3HrI=;
	b=vZsF5JXt0yunqdghLnL8szmYGnecduZ5VaUF50ssv6NhWp/sQ/Eoqo26SQgkJghY6gmXSI
	2yUH4JSJxYyzwbRG69QWbS8VhnlIvOs2vK1vMqgrN9cmcPTxGc4YaB6ORGS3ggcUhw5Y6h
	IUBr3gPcpkJNVdZqb7IRrfvb0+LZeGM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1659361219;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=a/15e5KZCnNKb0azDiCVDEz20SQoPdOtelD54ZT3HrI=;
	b=HMNxuNm0lGxkGLz2Wj+1OUU44LycDhShMQHSDOcCtFhc0cGYVlZ4pNxYPg7V5AqsB2Llw9
	jbnAZv4hyp16SwBA==
Received: from kitsune.suse.cz (kitsune.suse.cz [10.100.12.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id 4520B2C141;
	Mon,  1 Aug 2022 13:40:19 +0000 (UTC)
Date: Mon, 1 Aug 2022 15:40:18 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: gjoyce@linux.vnet.ibm.com
Subject: Re: [PATCH v3 1/2] lib: generic accessor functions for arch keystore
Message-ID: <20220801134018.GY17705@kitsune.suse.cz>
References: <20220801123426.585801-1-gjoyce@linux.vnet.ibm.com>
 <20220801123426.585801-2-gjoyce@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220801123426.585801-2-gjoyce@linux.vnet.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: axboe@kernel.dk, nayna@linux.ibm.com, linux-block@vger.kernel.org, jonathan.derrick@linux.dev, brking@linux.vnet.ibm.com, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, gjoyce@ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

On Mon, Aug 01, 2022 at 07:34:25AM -0500, gjoyce@linux.vnet.ibm.com wrote:
> From: Greg Joyce <gjoyce@linux.vnet.ibm.com>
> 
> Generic kernel subsystems may rely on platform specific persistent
> KeyStore to store objects containing sensitive key material. In such case,
> they need to access architecture specific functions to perform read/write
> operations on these variables.
> 
> Define the generic variable read/write prototypes to be implemented by
> architecture specific versions. The default(weak) implementations of
> these prototypes return -EOPNOTSUPP unless overridden by architecture
> versions.
> 
> Signed-off-by: Greg Joyce <gjoyce@linux.vnet.ibm.com>
> ---
>  include/linux/arch_vars.h | 23 +++++++++++++++++++++++
>  lib/Makefile              |  2 +-
>  lib/arch_vars.c           | 25 +++++++++++++++++++++++++
>  3 files changed, 49 insertions(+), 1 deletion(-)
>  create mode 100644 include/linux/arch_vars.h
>  create mode 100644 lib/arch_vars.c
> 
> diff --git a/include/linux/arch_vars.h b/include/linux/arch_vars.h
> new file mode 100644
> index 000000000000..9c280ff9432e
> --- /dev/null
> +++ b/include/linux/arch_vars.h
> @@ -0,0 +1,23 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Platform variable opearations.
> + *
> + * Copyright (C) 2022 IBM Corporation
> + *
> + * These are the accessor functions (read/write) for architecture specific
> + * variables. Specific architectures can provide overrides.
> + *
> + */
> +
> +#include <linux/kernel.h>
> +
> +enum arch_variable_type {
> +	ARCH_VAR_OPAL_KEY      = 0,     /* SED Opal Authentication Key */
> +	ARCH_VAR_OTHER         = 1,     /* Other type of variable */
> +	ARCH_VAR_MAX           = 1,     /* Maximum type value */
> +};
> +
> +int arch_read_variable(enum arch_variable_type type, char *varname,
> +		       void *varbuf, u_int *varlen);
> +int arch_write_variable(enum arch_variable_type type, char *varname,
> +			void *varbuf, u_int varlen);
> diff --git a/lib/Makefile b/lib/Makefile
> index f99bf61f8bbc..b90c4cb0dbbb 100644
> --- a/lib/Makefile
> +++ b/lib/Makefile
> @@ -48,7 +48,7 @@ obj-y += bcd.o sort.o parser.o debug_locks.o random32.o \
>  	 bsearch.o find_bit.o llist.o memweight.o kfifo.o \
>  	 percpu-refcount.o rhashtable.o \
>  	 once.o refcount.o usercopy.o errseq.o bucket_locks.o \
> -	 generic-radix-tree.o
> +	 generic-radix-tree.o arch_vars.o
>  obj-$(CONFIG_STRING_SELFTEST) += test_string.o
>  obj-y += string_helpers.o
>  obj-$(CONFIG_TEST_STRING_HELPERS) += test-string_helpers.o
> diff --git a/lib/arch_vars.c b/lib/arch_vars.c
> new file mode 100644
> index 000000000000..e6f16d7d09c1
> --- /dev/null
> +++ b/lib/arch_vars.c
> @@ -0,0 +1,25 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Platform variable operations.
> + *
> + * Copyright (C) 2022 IBM Corporation
> + *
> + * These are the accessor functions (read/write) for architecture specific
> + * variables. Specific architectures can provide overrides.
> + *
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/arch_vars.h>
> +
> +int __weak arch_read_variable(enum arch_variable_type type, char *varname,
> +			      void *varbuf, u_int *varlen)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +int __weak arch_write_variable(enum arch_variable_type type, char *varname,
> +			       void *varbuf, u_int varlen)
> +{
> +	return -EOPNOTSUPP;
> +}
> -- 

Doesn't EFI already have some variables?

And even powernv?

Shouldn't this generalize the already existing variables?

Or move to powerpc and at least generalize the powerpc ones?

Thanks

Michal
