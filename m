Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1112845106
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Feb 2024 06:52:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TQSj768Vyz3cYZ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Feb 2024 16:52:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gondor.apana.org.au (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org)
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TQShk35gvz2ytp
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Feb 2024 16:51:48 +1100 (AEDT)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1rVPzD-008Ubc-Uc; Thu, 01 Feb 2024 13:51:45 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Thu, 01 Feb 2024 13:51:57 +0800
Date: Thu, 1 Feb 2024 13:51:57 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: Re: [PATCH] MAINTAINERS: adjust file entries after crypto vmx file
 movement
Message-ID: <ZbsxfYVKqxwn5gl5@gondor.apana.org.au>
References: <20240129131729.4311-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240129131729.4311-1-lukas.bulwahn@gmail.com>
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
Cc: kernel-janitors@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-crypto@vger.kernel.org, Danny Tsen <dtsen@linux.ibm.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jan 29, 2024 at 02:17:29PM +0100, Lukas Bulwahn wrote:
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2fb944964be5..15bc79e80e28 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10307,12 +10307,12 @@ M:	Nayna Jain <nayna@linux.ibm.com>
>  M:	Paulo Flabiano Smorigo <pfsmorigo@gmail.com>
>  L:	linux-crypto@vger.kernel.org
>  S:	Supported
> -F:	drivers/crypto/vmx/Kconfig
> -F:	drivers/crypto/vmx/Makefile
> -F:	drivers/crypto/vmx/aes*
> -F:	drivers/crypto/vmx/ghash*
> -F:	drivers/crypto/vmx/ppc-xlate.pl
> -F:	drivers/crypto/vmx/vmx.c
> +F:	arch/powerpc/crypto/Kconfig
> +F:	arch/powerpc/crypto/Makefile
> +F:	arch/powerpc/crypto/aes*

Are you sure about this? There are non-vmx aes* files in that
directory.  Perhaps something more specific is needed here?

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
