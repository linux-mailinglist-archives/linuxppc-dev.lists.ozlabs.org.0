Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DD090753594
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jul 2023 10:50:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R2QDV67Lzz3cBJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jul 2023 18:50:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gondor.apana.org.au (client-ip=167.179.156.38; helo=167-179-156-38.a7b39c.syd.nbn.aussiebb.net; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org)
Received: from 167-179-156-38.a7b39c.syd.nbn.aussiebb.net (167-179-156-38.a7b39c.syd.nbn.aussiebb.net [167.179.156.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R2QD16g1Kz3Wtt
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jul 2023 18:50:24 +1000 (AEST)
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.103.7])
	by fornost.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1qKEV3-001RdB-GM; Fri, 14 Jul 2023 18:50:06 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation); Fri, 14 Jul 2023 18:49:58 +1000
Date: Fri, 14 Jul 2023 18:49:58 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Danny Tsen <dtsen@linux.ibm.com>
Subject: Re: [PATCH v2 0/5] crypto: Accelerated Chacha20/Poly1305
 implementation
Message-ID: <ZLEMNpZ4M4U/4t6j@gondor.apana.org.au>
References: <20230426191147.60610-1-dtsen@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230426191147.60610-1-dtsen@linux.ibm.com>
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

On Wed, Apr 26, 2023 at 03:11:42PM -0400, Danny Tsen wrote:
> This patch series provide an accelerated/optimized Chacha20 and Poly1305
> implementation for Power10 or later CPU (ppc64le).  This module
> implements algorithm specified in RFC7539.  The implementation
> provides 3.5X better performance than the baseline for Chacha20 and
> Poly1305 individually and 1.5X improvement for Chacha20/Poly1305
> operation.
> 
> This patch has been tested with the kernel crypto module tcrypt.ko and
> has passed the selftest.  The patch is also tested with
> CONFIG_CRYPTO_MANAGER_EXTRA_TESTS enabled.
> 
> 
> Danny Tsen (5):
>   An optimized Chacha20 implementation with 8-way unrolling for ppc64le.
>   Glue code for optmized Chacha20 implementation for ppc64le.
>   An optimized Poly1305 implementation with 4-way unrolling for ppc64le.
>   Glue code for optmized Poly1305 implementation for ppc64le.
>   Update Kconfig and Makefile.
> 
>  arch/powerpc/crypto/Kconfig             |   26 +
>  arch/powerpc/crypto/Makefile            |    4 +
>  arch/powerpc/crypto/chacha-p10-glue.c   |  221 +++++
>  arch/powerpc/crypto/chacha-p10le-8x.S   |  842 ++++++++++++++++++
>  arch/powerpc/crypto/poly1305-p10-glue.c |  186 ++++
>  arch/powerpc/crypto/poly1305-p10le_64.S | 1075 +++++++++++++++++++++++
>  6 files changed, 2354 insertions(+)
>  create mode 100644 arch/powerpc/crypto/chacha-p10-glue.c
>  create mode 100644 arch/powerpc/crypto/chacha-p10le-8x.S
>  create mode 100644 arch/powerpc/crypto/poly1305-p10-glue.c
>  create mode 100644 arch/powerpc/crypto/poly1305-p10le_64.S
> 
> -- 
> 2.31.1

All applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
