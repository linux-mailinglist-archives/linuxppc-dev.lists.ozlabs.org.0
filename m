Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 538445F821E
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Oct 2022 03:47:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mkp3J0zBvz3dyh
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Oct 2022 12:47:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=aD9UptPg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:2:267::; helo=out0.migadu.com; envelope-from=jonathan.derrick@linux.dev; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=aD9UptPg;
	dkim-atps=neutral
X-Greylist: delayed 973 seconds by postgrey-1.36 at boromir; Sat, 08 Oct 2022 05:23:28 AEDT
Received: from out0.migadu.com (out0.migadu.com [IPv6:2001:41d0:2:267::])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MkcBS4qrLz3cSh
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Oct 2022 05:23:28 +1100 (AEDT)
Message-ID: <80bb74f7-5198-51bd-82f1-ce3453647e7d@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1665167005;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a4EFSYNlAsWZCuH+Dz+haHcFzJ2ablsybQCXXVn+XQA=;
	b=aD9UptPgn1Wi0vIeER14YwpOm8GvyS3KMYSeFBqKDAp7FsoAPSP4PzLxKG1z84Clfgb5yQ
	rUIliIdqMmzbT41nJ2WPP+zHo2MI+tIODwE70OlTAS8Wr49inYHPvAi60Qtiimey34BcBO
	EnG5kUHY6LEovmnasibnHrcOLowIHZY=
Date: Fri, 7 Oct 2022 12:23:21 -0600
MIME-Version: 1.0
Subject: Re: [PATCH v4 1/3] block: sed-opal: SED Opal keystore
Content-Language: en-US
To: gjoyce@linux.vnet.ibm.com, linux-block@vger.kernel.org
References: <20220819223138.1457091-1-gjoyce@linux.vnet.ibm.com>
 <20220819223138.1457091-2-gjoyce@linux.vnet.ibm.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Jonathan Derrick <jonathan.derrick@linux.dev>
In-Reply-To: <20220819223138.1457091-2-gjoyce@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Sat, 08 Oct 2022 12:28:34 +1100
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
Cc: axboe@kernel.dk, linux-efi@vger.kernel.org, nayna@linux.ibm.com, dhowells@redhat.com, jarkko@kernel.org, keyrings@vger.kernel.org, brking@linux.vnet.ibm.com, akpm@linux-foundation.org, msuchanek@suse.de, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Reviewed-by: Jonathan Derrick <jonathan.derrick@linux.dev>

On 8/19/2022 4:31 PM, gjoyce@linux.vnet.ibm.com wrote:
> From: Greg Joyce <gjoyce@linux.vnet.ibm.com>
> 
> Add read and write functions that allow SED Opal keys to stored
> in a permanent keystore.
> 
> Signed-off-by: Greg Joyce <gjoyce@linux.vnet.ibm.com>
> ---
>  block/Makefile               |  2 +-
>  block/sed-opal-key.c         | 23 +++++++++++++++++++++++
>  include/linux/sed-opal-key.h | 15 +++++++++++++++
>  3 files changed, 39 insertions(+), 1 deletion(-)
>  create mode 100644 block/sed-opal-key.c
>  create mode 100644 include/linux/sed-opal-key.h
> 
> diff --git a/block/Makefile b/block/Makefile
> index 4e01bb71ad6e..464a9f209552 100644
> --- a/block/Makefile
> +++ b/block/Makefile
> @@ -35,7 +35,7 @@ obj-$(CONFIG_BLK_DEV_ZONED)	+= blk-zoned.o
>  obj-$(CONFIG_BLK_WBT)		+= blk-wbt.o
>  obj-$(CONFIG_BLK_DEBUG_FS)	+= blk-mq-debugfs.o
>  obj-$(CONFIG_BLK_DEBUG_FS_ZONED)+= blk-mq-debugfs-zoned.o
> -obj-$(CONFIG_BLK_SED_OPAL)	+= sed-opal.o
> +obj-$(CONFIG_BLK_SED_OPAL)	+= sed-opal.o sed-opal-key.o
>  obj-$(CONFIG_BLK_PM)		+= blk-pm.o
>  obj-$(CONFIG_BLK_INLINE_ENCRYPTION)	+= blk-crypto.o blk-crypto-profile.o \
>  					   blk-crypto-sysfs.o
> diff --git a/block/sed-opal-key.c b/block/sed-opal-key.c
> new file mode 100644
> index 000000000000..32ef988cd53b
> --- /dev/null
> +++ b/block/sed-opal-key.c
> @@ -0,0 +1,23 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * SED key operations.
> + *
> + * Copyright (C) 2022 IBM Corporation
> + *
> + * These are the accessor functions (read/write) for SED Opal
> + * keys. Specific keystores can provide overrides.
> + *
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/sed-opal-key.h>
> +
> +int __weak sed_read_key(char *keyname, char *key, u_int *keylen)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +int __weak sed_write_key(char *keyname, char *key, u_int keylen)
> +{
> +	return -EOPNOTSUPP;
> +}
> diff --git a/include/linux/sed-opal-key.h b/include/linux/sed-opal-key.h
> new file mode 100644
> index 000000000000..c9b1447986d8
> --- /dev/null
> +++ b/include/linux/sed-opal-key.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * SED key operations.
> + *
> + * Copyright (C) 2022 IBM Corporation
> + *
> + * These are the accessor functions (read/write) for SED Opal
> + * keys. Specific keystores can provide overrides.
> + *
> + */
> +
> +#include <linux/kernel.h>
> +
> +int sed_read_key(char *keyname, char *key, u_int *keylen);
> +int sed_write_key(char *keyname, char *key, u_int keylen);
