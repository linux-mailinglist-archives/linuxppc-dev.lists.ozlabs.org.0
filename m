Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE3D70F3F0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 May 2023 12:18:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QR6Zd3372z3fGC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 May 2023 20:18:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gondor.apana.org.au (client-ip=167.179.156.38; helo=167-179-156-38.a7b39c.syd.nbn.aussiebb.net; envelope-from=herbert@gondor.apana.org.au; receiver=<UNKNOWN>)
Received: from 167-179-156-38.a7b39c.syd.nbn.aussiebb.net (167-179-156-38.a7b39c.syd.nbn.aussiebb.net [167.179.156.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QR6Z911XWz3bhD
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 May 2023 20:17:35 +1000 (AEST)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1q1lXr-00Cl6E-Rk; Wed, 24 May 2023 18:16:40 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Wed, 24 May 2023 18:16:39 +0800
Date: Wed, 24 May 2023 18:16:39 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] powerpc/crypto: fix build warnings when DEBUG_FS is not
 enabled
Message-ID: <ZG3kB4Mlmlc4I0Ck@gondor.apana.org.au>
References: <20230519223334.11992-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230519223334.11992-1-rdunlap@infradead.org>
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
Cc: Nayna Jain <nayna@linux.ibm.com>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Paulo Flabiano Smorigo <pfsmorigo@gmail.com>, linux-crypto@vger.kernel.org, Breno =?iso-8859-1?Q?Leit=E3o?= <leitao@debian.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 19, 2023 at 03:33:34PM -0700, Randy Dunlap wrote:
> Fix build warnings when DEBUG_FS is not enabled by using an empty
> do-while loop instead of a value:
> 
> In file included from ../drivers/crypto/nx/nx.c:27:
> ../drivers/crypto/nx/nx.c: In function 'nx_register_algs':
> ../drivers/crypto/nx/nx.h:173:33: warning: statement with no effect [-Wunused-value]
>   173 | #define NX_DEBUGFS_INIT(drv)    (0)
> ../drivers/crypto/nx/nx.c:573:9: note: in expansion of macro 'NX_DEBUGFS_INIT'
>   573 |         NX_DEBUGFS_INIT(&nx_driver);
> ../drivers/crypto/nx/nx.c: In function 'nx_remove':
> ../drivers/crypto/nx/nx.h:174:33: warning: statement with no effect [-Wunused-value]
>   174 | #define NX_DEBUGFS_FINI(drv)    (0)
> ../drivers/crypto/nx/nx.c:793:17: note: in expansion of macro 'NX_DEBUGFS_FINI'
>   793 |                 NX_DEBUGFS_FINI(&nx_driver);
> 
> Also, there is no need to build nx_debugfs.o when DEBUG_FS is not
> enabled, so change the Makefile to accommodate that.
> 
> Fixes: ae0222b7289d ("powerpc/crypto: nx driver code supporting nx encryption")
> Fixes: aef7b31c8833 ("powerpc/crypto: Build files for the nx device driver")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Breno Leitão <leitao@debian.org>
> Cc: Nayna Jain <nayna@linux.ibm.com>
> Cc: Paulo Flabiano Smorigo <pfsmorigo@gmail.com>
> Cc: Herbert Xu <herbert@gondor.apana.org.au>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: linux-crypto@vger.kernel.org
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: linuxppc-dev@lists.ozlabs.org
> ---
>  drivers/crypto/nx/Makefile |    2 +-
>  drivers/crypto/nx/nx.h     |    4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
