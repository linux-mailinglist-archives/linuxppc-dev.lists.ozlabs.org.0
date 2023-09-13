Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3A279EF73
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 18:57:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aQO3QsS5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rm67T5zbSz3c04
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 02:57:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aQO3QsS5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rm66Y1Zstz3bdG
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Sep 2023 02:56:20 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id E2310CE220F;
	Wed, 13 Sep 2023 16:56:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74457C433C8;
	Wed, 13 Sep 2023 16:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694624175;
	bh=/a4Rj8k0aXUiWCBROrFSRnI23PLNyS55VKYUAVzglmw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aQO3QsS5c5sXpOhHVkUcFbBYRREActZwBsgfSZy/tSoWougO62jr84mGSdpTkKKau
	 ZE+091G2Xf3M8HmgZYxpRAUgCqbQ+Pk6+3vFRxqzgnRRsGmdNEV0c4EKOrxCkQQqfL
	 oGHHqbkzTp/joFOHaN2BskKMtWJj56ubF9LuJjxXh4kCFstVPH+6wszNQo8eWIgFIQ
	 GggIGaqDas2P0lr4/BTRFFaeDV1grRED6P2HuBOEb0GMqbmJaQibbBwZhiSZ+ERwjB
	 kXF69WPf8al6lVnsizb7QEUmV5SHrOeFGzFcsfQiA18iuTgwH/+oAVCJxSxE1VhVMN
	 zMw3Hru9mOAfQ==
Date: Wed, 13 Sep 2023 09:56:12 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: gjoyce@linux.vnet.ibm.com
Subject: Re: [PATCH v7 1/3 RESEND] block:sed-opal: SED Opal keystore
Message-ID: <20230913165612.GA2213586@dev-arch.thelio-3990X>
References: <20230908153056.3503975-1-gjoyce@linux.vnet.ibm.com>
 <20230908153056.3503975-2-gjoyce@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230908153056.3503975-2-gjoyce@linux.vnet.ibm.com>
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
Cc: axboe@kernel.dk, llvm@lists.linux.dev, nayna@linux.ibm.com, linux-block@vger.kernel.org, jarkko@kernel.org, keyrings@vger.kernel.org, jonathan.derrick@linux.dev, brking@linux.vnet.ibm.com, akpm@linux-foundation.org, msuchanek@suse.de, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Greg,

On Fri, Sep 08, 2023 at 10:30:54AM -0500, gjoyce@linux.vnet.ibm.com wrote:
> From: Greg Joyce <gjoyce@linux.vnet.ibm.com>
> 
> Add read and write functions that allow SED Opal keys to stored
> in a permanent keystore.
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
> index 46ada9dc8bbf..ea07d80402a6 100644
> --- a/block/Makefile
> +++ b/block/Makefile
> @@ -34,7 +34,7 @@ obj-$(CONFIG_BLK_DEV_ZONED)	+= blk-zoned.o
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

This change causes a build failure for certain clang configurations due
to an unfortunate issue [1] with recordmcount, clang's integrated
assembler, and object files that contain a section with only weak
functions/symbols (in this case, the .text section in sed-opal-key.c),
resulting in

  Cannot find symbol for section 2: .text.
  block/sed-opal-key.o: failed

when building this file.

Is there any real reason to have a separate translation unit for these
two functions versus just having them living in sed-opal.c? Those two
object files share the same Kconfig dependency. I am happy to send a
patch if that is an acceptable approach.

[1]: https://github.com/ClangBuiltLinux/linux/issues/981

Cheers,
Nathan
