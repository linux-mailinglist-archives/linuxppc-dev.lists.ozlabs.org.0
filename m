Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1C6800801
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Dec 2023 11:13:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ShTRT4WQ2z3dT1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Dec 2023 21:13:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gondor.apana.org.au (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org)
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ShTQm4kxbz3dBl
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Dec 2023 21:13:02 +1100 (AEDT)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1r90Vp-005hmD-EH; Fri, 01 Dec 2023 18:12:46 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 01 Dec 2023 18:12:54 +0800
Date: Fri, 1 Dec 2023 18:12:54 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH][next] powerpc/crypto: Avoid -Wstringop-overflow warnings
Message-ID: <ZWmxpmuBcAhsE1wf@gondor.apana.org.au>
References: <ZVz8fLtrYTz+YSjn@work>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZVz8fLtrYTz+YSjn@work>
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
Cc: linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Nov 21, 2023 at 12:52:44PM -0600, Gustavo A. R. Silva wrote:
> The compiler doesn't know that `32` is an offset into the Hash table:
> 
>  56 struct Hash_ctx {
>  57         u8 H[16];       /* subkey */
>  58         u8 Htable[256]; /* Xi, Hash table(offset 32) */
>  59 };
> 
> So, it legitimately complains about a potential out-of-bounds issue
> if `256 bytes` are accessed in `htable` (this implies going
> `32 bytes` beyond the boundaries of `Htable`):
> 
> arch/powerpc/crypto/aes-gcm-p10-glue.c: In function 'gcmp10_init':
> arch/powerpc/crypto/aes-gcm-p10-glue.c:120:9: error: 'gcm_init_htable' accessing 256 bytes in a region of size 224 [-Werror=stringop-overflow=]
>   120 |         gcm_init_htable(hash->Htable+32, hash->H);
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> arch/powerpc/crypto/aes-gcm-p10-glue.c:120:9: note: referencing argument 1 of type 'unsigned char[256]'
> arch/powerpc/crypto/aes-gcm-p10-glue.c:120:9: note: referencing argument 2 of type 'unsigned char[16]'
> arch/powerpc/crypto/aes-gcm-p10-glue.c:40:17: note: in a call to function 'gcm_init_htable'
>    40 | asmlinkage void gcm_init_htable(unsigned char htable[256], unsigned char Xi[16]);
>       |                 ^~~~~~~~~~~~~~~
> 
> Address this by avoiding specifying the size of `htable` in the function
> prototype; and just for consistency, do the same for parameter `Xi`.
> 
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/linux-next/20231121131903.68a37932@canb.auug.org.au/
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---
>  arch/powerpc/crypto/aes-gcm-p10-glue.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
