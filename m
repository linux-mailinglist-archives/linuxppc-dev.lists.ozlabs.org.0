Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2466E900A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Apr 2023 12:23:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q2DJw6cpYz3fX1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Apr 2023 20:23:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gondor.apana.org.au (client-ip=167.179.156.38; helo=167-179-156-38.a7b39c.syd.nbn.aussiebb.net; envelope-from=herbert@gondor.apana.org.au; receiver=<UNKNOWN>)
Received: from 167-179-156-38.a7b39c.syd.nbn.aussiebb.net (167-179-156-38.a7b39c.syd.nbn.aussiebb.net [167.179.156.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q2DJR3XHJz3c7Q
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Apr 2023 20:23:17 +1000 (AEST)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1ppRQx-000Ydo-4C; Thu, 20 Apr 2023 18:22:37 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Thu, 20 Apr 2023 18:22:36 +0800
Date: Thu, 20 Apr 2023 18:22:36 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Danny Tsen <dtsen@linux.ibm.com>
Subject: Re: [PATCH v2 0/2] Remove POWER10_CPU dependency and move
 PPC_MODULE_FEATURE_P10.
Message-ID: <ZEESbNOBirwSksig@gondor.apana.org.au>
References: <20230413194625.10631-1-dtsen@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230413194625.10631-1-dtsen@linux.ibm.com>
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

On Thu, Apr 13, 2023 at 03:46:23PM -0400, Danny Tsen wrote:
> Remove Power10 dependency in Kconfig and detect Power10 feature at runtime.
> Move PPC_MODULE_FEATURE_P10 definition to be in
> arch/powerpc/include/asm/cpufeature.h.
> 
> Signed-off-by: Danny Tsen <dtsen@linux.ibm.com>
> 
> Danny Tsen (2):
>   Kconfig: Remove POWER10_CPU dependency.
>   aes-gcm-p10-glue.c, cpufeature.h: Move Power10 feature, PPC_MODULE_FEATURE_P10.
> 
>  arch/powerpc/crypto/Kconfig            | 2 +-
>  arch/powerpc/crypto/aes-gcm-p10-glue.c | 1 -
>  arch/powerpc/include/asm/cpufeature.h  | 1 +
>  3 files changed, 2 insertions(+), 2 deletions(-)
> 
> -- 
> 2.31.1

All applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
