Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4786788FD58
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 11:47:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V50bR0Tl6z3vXB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 21:46:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gondor.apana.org.au (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org)
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V50b15mwRz3dhR
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Mar 2024 21:46:35 +1100 (AEDT)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1rpnGx-00C8E0-FJ; Thu, 28 Mar 2024 18:46:16 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Thu, 28 Mar 2024 18:46:32 +0800
Date: Thu, 28 Mar 2024 18:46:32 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH][next] crypto/nx: Avoid -Wflex-array-member-not-at-end
 warning
Message-ID: <ZgVKiK2A+of/+vGr@gondor.apana.org.au>
References: <Zed5RIGqPgxUt/9T@neat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zed5RIGqPgxUt/9T@neat>
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
Cc: Kees Cook <keescook@chromium.org>, Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, linux-hardening@vger.kernel.org, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 05, 2024 at 01:57:56PM -0600, Gustavo A. R. Silva wrote:
> -Wflex-array-member-not-at-end is coming in GCC-14, and we are getting
> ready to enable it globally. So, we are deprecating flexible-array
> members in the middle of another structure.
> 
> There is currently an object (`header`) in `struct nx842_crypto_ctx`
> that contains a flexible structure (`struct nx842_crypto_header`):
> 
> struct nx842_crypto_ctx {
> 	...
>         struct nx842_crypto_header header;
>         struct nx842_crypto_header_group group[NX842_CRYPTO_GROUP_MAX];
> 	...
> };
> 
> So, in order to avoid ending up with a flexible-array member in the
> middle of another struct, we use the `struct_group_tagged()` helper to
> separate the flexible array from the rest of the members in the flexible
> structure:
> 
> struct nx842_crypto_header {
> 	struct_group_tagged(nx842_crypto_header_hdr, hdr,
> 
> 		... the rest of the members
> 
> 	);
>         struct nx842_crypto_header_group group[];
> } __packed;
> 
> With the change described above, we can now declare an object of the
> type of the tagged struct, without embedding the flexible array in the
> middle of another struct:
> 
> struct nx842_crypto_ctx {
> 	...
>         struct nx842_crypto_header_hdr header;
>         struct nx842_crypto_header_group group[NX842_CRYPTO_GROUP_MAX];
> 	...
>  } __packed;
> 
> We also use `container_of()` whenever we need to retrieve a pointer to
> the flexible structure, through which we can access the flexible
> array if needed.
> 
> So, with these changes, fix the following warning:
> 
> In file included from drivers/crypto/nx/nx-842.c:55:
> drivers/crypto/nx/nx-842.h:174:36: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
>   174 |         struct nx842_crypto_header header;
>       |                                    ^~~~~~
> 
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---
>  drivers/crypto/nx/nx-842.c |  6 ++++--
>  drivers/crypto/nx/nx-842.h | 10 ++++++----
>  2 files changed, 10 insertions(+), 6 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
