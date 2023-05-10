Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF366FE786
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 May 2023 00:51:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QGqy22HBGz3fGx
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 May 2023 08:51:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pxMp9v6S;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pxMp9v6S;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QGqx74xR2z3bnM
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 May 2023 08:50:19 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2392C60F72;
	Wed, 10 May 2023 22:50:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEDE8C433EF;
	Wed, 10 May 2023 22:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683759015;
	bh=YD/Or+PbwlMw5nLqLwUs8WIz+6qSKOgfzTEXUu+LUaU=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=pxMp9v6SeSm35itTUPF90uIEd3/BmkfcgaF7ldUflRCq89EerSR6GUhBiP9OF6r2b
	 Nj/YTlv2HZ9KdE/ssh2GDQ7cn//wWyN+6niR+iggR3x3wBBEKZH56B2SZAoNvGUPXU
	 HVQ4k6OdU+ADi8Lr/a3p/D4vAUN5VT7UANyi16+uBSNE70OEMiExBFFk5MyZWgxvF8
	 fNsBAhkaqjnKzoxAEZpQLqsI0n5fk00X7yrX5FYP5x0S4YDqYSIT2pBVK5JGPWZJE8
	 cAhH7cmhL8xrWtHp2kvheEW5NN1GUtUqlRyEke+aqUHDqhqULfN4wCfLt9JUCJ4J0I
	 5m5jYq0OlF4aA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 11 May 2023 01:50:10 +0300
Message-Id: <CSIYR76Z8U02.30IIQJ49LMY05@suppilovahvero>
Subject: Re: [PATCH 1/4] block:sed-opal: SED Opal keystore
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: <gjoyce@linux.vnet.ibm.com>, <linux-block@vger.kernel.org>
X-Mailer: aerc 0.14.0
References: <20230505194402.2079010-1-gjoyce@linux.vnet.ibm.com>
 <20230505194402.2079010-2-gjoyce@linux.vnet.ibm.com>
In-Reply-To: <20230505194402.2079010-2-gjoyce@linux.vnet.ibm.com>
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
Cc: axboe@kernel.dk, linux-efi@vger.kernel.org, me@benboeckel.net, keyrings@vger.kernel.org, jonathan.derrick@linux.dev, andonnel@au1.ibm.com, brking@linux.vnet.ibm.com, akpm@linux-foundation.org, msuchanek@suse.de, linuxppc-dev@lists.ozlabs.org, elliott@hpe.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri May 5, 2023 at 10:43 PM EEST,  wrote:
> From: Greg Joyce <gjoyce@linux.vnet.ibm.com>
>
> Add read and write functions that allow SED Opal keys to stored
> in a permanent keystore.

Please be more verbose starting from "Self-Encrypting Drive (SED)",
instead of just "SED", and take time to explain what these keys are.

>
> Signed-off-by: Greg Joyce <gjoyce@linux.vnet.ibm.com>
> Reviewed-by: Jonathan Derrick <jonathan.derrick@linux.dev>
> ---
>  block/Makefile               |  2 +-
>  block/sed-opal-key.c         | 24 ++++++++++++++++++++++++
>  include/linux/sed-opal-key.h | 15 +++++++++++++++
>  3 files changed, 40 insertions(+), 1 deletion(-)
>  create mode 100644 block/sed-opal-key.c
>  create mode 100644 include/linux/sed-opal-key.h
>
> diff --git a/block/Makefile b/block/Makefile
> index 4e01bb71ad6e..464a9f209552 100644
> --- a/block/Makefile
> +++ b/block/Makefile
> @@ -35,7 +35,7 @@ obj-$(CONFIG_BLK_DEV_ZONED)	+=3D blk-zoned.o
>  obj-$(CONFIG_BLK_WBT)		+=3D blk-wbt.o
>  obj-$(CONFIG_BLK_DEBUG_FS)	+=3D blk-mq-debugfs.o
>  obj-$(CONFIG_BLK_DEBUG_FS_ZONED)+=3D blk-mq-debugfs-zoned.o
> -obj-$(CONFIG_BLK_SED_OPAL)	+=3D sed-opal.o
> +obj-$(CONFIG_BLK_SED_OPAL)	+=3D sed-opal.o sed-opal-key.o
>  obj-$(CONFIG_BLK_PM)		+=3D blk-pm.o
>  obj-$(CONFIG_BLK_INLINE_ENCRYPTION)	+=3D blk-crypto.o blk-crypto-profile=
.o \
>  					   blk-crypto-sysfs.o
> diff --git a/block/sed-opal-key.c b/block/sed-opal-key.c
> new file mode 100644
> index 000000000000..16f380164c44
> --- /dev/null
> +++ b/block/sed-opal-key.c
> @@ -0,0 +1,24 @@
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
> +#include <linux/errno.h>
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
> --=20
> gjoyce@linux.vnet.ibm.com


BR, Jarkko
