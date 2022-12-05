Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B541D642289
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Dec 2022 06:15:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NQWvj3cZJz3bfV
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Dec 2022 16:15:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gondor.apana.org.au (client-ip=216.24.177.18; helo=formenos.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=<UNKNOWN>)
X-Greylist: delayed 2561 seconds by postgrey-1.36 at boromir; Mon, 05 Dec 2022 16:14:42 AEDT
Received: from formenos.hmeau.com (helcar.hmeau.com [216.24.177.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NQWv66SNPz3bW2
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Dec 2022 16:14:42 +1100 (AEDT)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1p238q-003w68-I8; Mon, 05 Dec 2022 12:31:45 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Mon, 05 Dec 2022 12:31:44 +0800
Date: Mon, 5 Dec 2022 12:31:44 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH] crypto: api - Use linux/cache.h instead of asm/cache.h
Message-ID: <Y410MAxoqND62k1r@gondor.apana.org.au>
References: <20221205104857.2dab1586@canb.auug.org.au>
 <20221205105225.502d2278@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221205105225.502d2278@canb.auug.org.au>
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>, Linux Crypto List <linux-crypto@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Dec 05, 2022 at 10:52:25AM +1100, Stephen Rothwell wrote:
>
> Or maybe you should have included linux/cache.h instead of asm/cache.h?

You're right Stephen.  Thanks!

---8<---
Directly including asm/cache.h leads to build failures on powerpc
so replace it with linux/cache.h instead.

Fixes: e634ac4a8aaa ("crypto: api - Add crypto_tfm_ctx_dma")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

diff --git a/include/crypto/algapi.h b/include/crypto/algapi.h
index 8722fd67f40a..61b327206b55 100644
--- a/include/crypto/algapi.h
+++ b/include/crypto/algapi.h
@@ -7,8 +7,8 @@
 #ifndef _CRYPTO_ALGAPI_H
 #define _CRYPTO_ALGAPI_H
 
-#include <asm/cache.h>
 #include <linux/align.h>
+#include <linux/cache.h>
 #include <linux/crypto.h>
 #include <linux/kconfig.h>
 #include <linux/list.h>
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
