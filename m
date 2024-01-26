Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A0983D607
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jan 2024 10:22:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TLsfh68MNz3dWC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jan 2024 20:22:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gondor.apana.org.au (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org)
X-Greylist: delayed 1412 seconds by postgrey-1.37 at boromir; Fri, 26 Jan 2024 20:22:13 AEDT
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TLsfF72H1z3d9t
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jan 2024 20:22:13 +1100 (AEDT)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1rTI2L-006EZR-QN; Fri, 26 Jan 2024 16:58:10 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 26 Jan 2024 16:58:22 +0800
Date: Fri, 26 Jan 2024 16:58:22 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Danny Tsen <dtsen@linux.ibm.com>
Subject: Re: [PATCH] crypto:vmx: Move ppc vmx diirectory to
 arch/powerpc/crypto.
Message-ID: <ZbN0LufXZ6YZmn3E@gondor.apana.org.au>
References: <20240102205856.370103-1-dtsen@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240102205856.370103-1-dtsen@linux.ibm.com>
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
Cc: dtsen@us.ibm.com, nayna@linux.ibm.com, linux-kernel@vger.kernel.org, appro@cryptogams.org, linux-crypto@vger.kernel.org, ltcgcw@linux.vnet.ibm.com, leitao@debian.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jan 02, 2024 at 03:58:56PM -0500, Danny Tsen wrote:
> Relocate all crypto files in vmx driver to arch/powerpc/crypto directory
> and remove vmx directory.
> 
> drivers/crypto/vmx/aes.c rename to arch/powerpc/crypto/aes.c
> drivers/crypto/vmx/aes_cbc.c rename to arch/powerpc/crypto/aes_cbc.c
> drivers/crypto/vmx/aes_ctr.c rename to arch/powerpc/crypto/aes_ctr.c
> drivers/crypto/vmx/aes_xts.c rename to arch/powerpc/crypto/aes_xts.c
> drivers/crypto/vmx/aesp8-ppc.h rename to arch/powerpc/crypto/aesp8-ppc.h
> drivers/crypto/vmx/aesp8-ppc.pl rename to arch/powerpc/crypto/aesp8-ppc.pl
> drivers/crypto/vmx/ghash.c rename to arch/powerpc/crypto/ghash.c
> drivers/crypto/vmx/ghashp8-ppc.pl rename to arch/powerpc/crypto/ghashp8-ppc.pl
> drivers/crypto/vmx/vmx.c rename to arch/powerpc/crypto/vmx.c
> 
> deleted files:
> drivers/crypto/vmx/Makefile
> drivers/crypto/vmx/Kconfig
> drivers/crypto/vmx/ppc-xlate.pl
> 
> This patch has been tested has passed the selftest.  The patch is also tested with
> CONFIG_CRYPTO_MANAGER_EXTRA_TESTS enabled.
> 
> Signed-off-by: Danny Tsen <dtsen@linux.ibm.com>
> ---
>  arch/powerpc/crypto/Kconfig                   |  20 ++
>  arch/powerpc/crypto/Makefile                  |  20 +-
>  .../crypto/vmx => arch/powerpc/crypto}/aes.c  |   0
>  .../vmx => arch/powerpc/crypto}/aes_cbc.c     |   0
>  .../vmx => arch/powerpc/crypto}/aes_ctr.c     |   0
>  .../vmx => arch/powerpc/crypto}/aes_xts.c     |   0
>  .../vmx => arch/powerpc/crypto}/aesp8-ppc.h   |   0
>  .../vmx => arch/powerpc/crypto}/aesp8-ppc.pl  |   0
>  .../vmx => arch/powerpc/crypto}/ghash.c       |   0
>  .../powerpc/crypto}/ghashp8-ppc.pl            |   0
>  .../crypto/vmx => arch/powerpc/crypto}/vmx.c  |   0
>  drivers/crypto/Kconfig                        |  14 +-
>  drivers/crypto/Makefile                       |   2 +-
>  drivers/crypto/vmx/.gitignore                 |   3 -
>  drivers/crypto/vmx/Kconfig                    |  14 --
>  drivers/crypto/vmx/Makefile                   |  23 --
>  drivers/crypto/vmx/ppc-xlate.pl               | 231 ------------------
>  17 files changed, 46 insertions(+), 281 deletions(-)
>  rename {drivers/crypto/vmx => arch/powerpc/crypto}/aes.c (100%)
>  rename {drivers/crypto/vmx => arch/powerpc/crypto}/aes_cbc.c (100%)
>  rename {drivers/crypto/vmx => arch/powerpc/crypto}/aes_ctr.c (100%)
>  rename {drivers/crypto/vmx => arch/powerpc/crypto}/aes_xts.c (100%)
>  rename {drivers/crypto/vmx => arch/powerpc/crypto}/aesp8-ppc.h (100%)
>  rename {drivers/crypto/vmx => arch/powerpc/crypto}/aesp8-ppc.pl (100%)
>  rename {drivers/crypto/vmx => arch/powerpc/crypto}/ghash.c (100%)
>  rename {drivers/crypto/vmx => arch/powerpc/crypto}/ghashp8-ppc.pl (100%)
>  rename {drivers/crypto/vmx => arch/powerpc/crypto}/vmx.c (100%)
>  delete mode 100644 drivers/crypto/vmx/.gitignore
>  delete mode 100644 drivers/crypto/vmx/Kconfig
>  delete mode 100644 drivers/crypto/vmx/Makefile
>  delete mode 100644 drivers/crypto/vmx/ppc-xlate.pl

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
