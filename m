Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C539E5025
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2019 17:29:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4707MM651BzDql6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Oct 2019 02:29:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.orG
Delivered-To: linuxppc-dev@lists.ozlabs.orG
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gondor.apana.org.au (client-ip=216.24.177.18;
 helo=deadmen.hmeau.com; envelope-from=herbert@gondor.apana.org.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=gondor.apana.org.au
Received: from deadmen.hmeau.com (helcar.hmeau.com [216.24.177.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4707C95d9SzDqjR
 for <linuxppc-dev@lists.ozlabs.orG>; Sat, 26 Oct 2019 02:19:44 +1100 (AEDT)
Received: from gondobar.mordor.me.apana.org.au ([192.168.128.4] helo=gondobar)
 by deadmen.hmeau.com with esmtps (Exim 4.89 #2 (Debian))
 id 1iO1N3-0001fp-1E; Fri, 25 Oct 2019 23:19:21 +0800
Received: from herbert by gondobar with local (Exim 4.89)
 (envelope-from <herbert@gondor.apana.org.au>)
 id 1iO1Mw-0007o6-Gy; Fri, 25 Oct 2019 23:19:14 +0800
Date: Fri, 25 Oct 2019 23:19:14 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Subject: Re: [PATCH v2 0/3] crypto: powerpc - convert SPE AES algorithms to
 skcipher API
Message-ID: <20191025151914.4qxbl4at6cfwtj2n@gondor.apana.org.au>
References: <20191015024517.52790-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191015024517.52790-1-ebiggers@kernel.org>
User-Agent: NeoMutt/20170113 (1.7.2)
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
Cc: Markus Stockhausen <stockhausen@collogia.de>, linux-crypto@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Oct 14, 2019 at 07:45:14PM -0700, Eric Biggers wrote:
> This series converts the glue code for the PowerPC SPE implementations
> of AES-ECB, AES-CBC, AES-CTR, and AES-XTS from the deprecated
> "blkcipher" API to the "skcipher" API.  This is needed in order for the
> blkcipher API to be removed.
> 
> Patch 1-2 are fixes.  Patch 3 is the actual conversion.
> 
> Tested with:
> 
> 	export ARCH=powerpc CROSS_COMPILE=powerpc-linux-gnu-
> 	make mpc85xx_defconfig
> 	cat >> .config << EOF
> 	# CONFIG_MODULES is not set
> 	# CONFIG_CRYPTO_MANAGER_DISABLE_TESTS is not set
> 	CONFIG_DEBUG_KERNEL=y
> 	CONFIG_CRYPTO_MANAGER_EXTRA_TESTS=y
> 	CONFIG_CRYPTO_AES=y
> 	CONFIG_CRYPTO_CBC=y
> 	CONFIG_CRYPTO_CTR=y
> 	CONFIG_CRYPTO_ECB=y
> 	CONFIG_CRYPTO_XTS=y
> 	CONFIG_CRYPTO_AES_PPC_SPE=y
> 	EOF
> 	make olddefconfig
> 	make -j32
> 	qemu-system-ppc -M mpc8544ds -cpu e500 -nographic \
> 		-kernel arch/powerpc/boot/zImage \
> 		-append cryptomgr.fuzz_iterations=1000
> 
> Note that xts-ppc-spe still fails the comparison tests due to the lack
> of ciphertext stealing support.  This is not addressed by this series.
> 
> Changed since v1:
> 
> - Split fixes into separate patches.
> 
> - Made ppc_aes_setkey_skcipher() call ppc_aes_setkey(), rather than
>   creating a separate expand_key() function.  This keeps the code
>   shorter.
> 
> Eric Biggers (3):
>   crypto: powerpc - don't unnecessarily use atomic scatterwalk
>   crypto: powerpc - don't set ivsize for AES-ECB
>   crypto: powerpc - convert SPE AES algorithms to skcipher API
> 
>  arch/powerpc/crypto/aes-spe-glue.c | 389 ++++++++++++-----------------
>  crypto/Kconfig                     |   1 +
>  2 files changed, 166 insertions(+), 224 deletions(-)

All applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
