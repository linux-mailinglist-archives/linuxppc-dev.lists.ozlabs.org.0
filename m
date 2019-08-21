Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E662980A4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2019 18:49:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46DDCv2xqVzDqN6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2019 02:49:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46DD8T3r7KzDqXl
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2019 02:46:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="V+bfxgzi"; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46DD8R75MYz8tQW
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2019 02:46:47 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46DD8R6NWYz9sN1; Thu, 22 Aug 2019 02:46:47 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linuxfoundation.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="V+bfxgzi"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 46DD8R29Gnz9sBp;
 Thu, 22 Aug 2019 02:46:45 +1000 (AEST)
Received: from localhost (wsip-184-188-36-2.sd.sd.cox.net [184.188.36.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3487D22D6D;
 Wed, 21 Aug 2019 16:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566406003;
 bh=WQ2BlRv9mAl/kq+zQd+AH1qq87Y+Uvy3hDKIZvT8V28=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=V+bfxgzitOAgmD3JoQz1FwTEvVsSra+bN8CblJi8UOvJ1nxyg0FOHGtPtAo758uIN
 b0c1KihRa1iKO2CDB3W4YkzKzYugI9s0tXhUxYuWu8tkx5bHWcqAyWfxUaerqSwdWL
 DwkJKMGD+XsH0HINst1IbsxbD8j3b5Ykc9ZEMbqg=
Date: Wed, 21 Aug 2019 09:32:24 -0700
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Nayna Jain <nayna@linux.ibm.com>
Subject: Re: [PATCH v2 4/4] powerpc: load firmware trusted keys into kernel
 keyring
Message-ID: <20190821163224.GC28571@kroah.com>
References: <1566400103-18201-1-git-send-email-nayna@linux.ibm.com>
 <1566400103-18201-5-git-send-email-nayna@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1566400103-18201-5-git-send-email-nayna@linux.ibm.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
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
Cc: linux-efi@vger.kernel.org, Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Eric Ricther <erichte@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Mimi Zohar <zohar@linux.ibm.com>, Claudio Carvalho <cclaudio@linux.ibm.com>,
 Matthew Garret <matthew.garret@nebula.com>, linuxppc-dev@ozlabs.org,
 Paul Mackerras <paulus@samba.org>, Jeremy Kerr <jk@ozlabs.org>,
 Elaine Palmer <erpalmer@us.ibm.com>, Oliver O'Halloran <oohall@gmail.com>,
 linux-integrity@vger.kernel.org, George Wilson <gcwilson@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Aug 21, 2019 at 11:08:23AM -0400, Nayna Jain wrote:
> The keys used to verify the Host OS kernel are managed by OPAL as secure
> variables. This patch loads the verification keys into the .platform
> keyring and revocation keys into .blacklist keyring. This enables
> verification and loading of the kernels signed by the boot time keys which
> are trusted by firmware.
> 
> Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
> ---
>  security/integrity/Kconfig                    |  9 ++
>  security/integrity/Makefile                   |  3 +
>  .../integrity/platform_certs/load_powerpc.c   | 94 +++++++++++++++++++
>  3 files changed, 106 insertions(+)
>  create mode 100644 security/integrity/platform_certs/load_powerpc.c
> 
> diff --git a/security/integrity/Kconfig b/security/integrity/Kconfig
> index 0bae6adb63a9..2b4109c157e2 100644
> --- a/security/integrity/Kconfig
> +++ b/security/integrity/Kconfig
> @@ -72,6 +72,15 @@ config LOAD_IPL_KEYS
>         depends on S390
>         def_bool y
>  
> +config LOAD_PPC_KEYS
> +	bool "Enable loading of platform and revocation keys for POWER"
> +	depends on INTEGRITY_PLATFORM_KEYRING
> +	depends on PPC_SECURE_BOOT
> +	def_bool y

def_bool y only for things that the system will not boot if it is not
enabled because you added a new feature.  Otherwise just do not set the
default.

> +	help
> +	  Enable loading of db keys to the .platform keyring and dbx keys to
> +	  the .blacklist keyring for powerpc based platforms.
> +
>  config INTEGRITY_AUDIT
>  	bool "Enables integrity auditing support "
>  	depends on AUDIT
> diff --git a/security/integrity/Makefile b/security/integrity/Makefile
> index 525bf1d6e0db..9eeb6b053de3 100644
> --- a/security/integrity/Makefile
> +++ b/security/integrity/Makefile
> @@ -14,6 +14,9 @@ integrity-$(CONFIG_LOAD_UEFI_KEYS) += platform_certs/efi_parser.o \
>  				      platform_certs/load_uefi.o \
>  				      platform_certs/keyring_handler.o
>  integrity-$(CONFIG_LOAD_IPL_KEYS) += platform_certs/load_ipl_s390.o
> +integrity-$(CONFIG_LOAD_PPC_KEYS) += platform_certs/efi_parser.o \
> +					 platform_certs/load_powerpc.o \
> +					 platform_certs/keyring_handler.o
>  $(obj)/load_uefi.o: KBUILD_CFLAGS += -fshort-wchar
  
>  subdir-$(CONFIG_IMA)			+= ima
> diff --git a/security/integrity/platform_certs/load_powerpc.c b/security/integrity/platform_certs/load_powerpc.c
> new file mode 100644
> index 000000000000..f4d869171062
> --- /dev/null
> +++ b/security/integrity/platform_certs/load_powerpc.c
> @@ -0,0 +1,94 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2019 IBM Corporation
> + * Author: Nayna Jain <nayna@linux.ibm.com>
> + *
> + * load_powernv.c

That's not the name of this file :(

And the perfect example of why you NEVER have the name of the file in
the file itself, as it's not needed and easy to get wrong :)

thanks,

greg k-h
