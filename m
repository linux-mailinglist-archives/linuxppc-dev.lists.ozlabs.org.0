Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5828534A48B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Mar 2021 10:35:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F6GzW2BWzz3c32
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Mar 2021 20:35:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gondor.apana.org.au (client-ip=216.24.177.18;
 helo=fornost.hmeau.com; envelope-from=herbert@gondor.apana.org.au;
 receiver=<UNKNOWN>)
Received: from fornost.hmeau.com (helcar.hmeau.com [216.24.177.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F6GzB2pHCz2yqB
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Mar 2021 20:35:02 +1100 (AEDT)
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.103.7])
 by fornost.hmeau.com with smtp (Exim 4.92 #5 (Debian))
 id 1lPirI-0003cX-LR; Fri, 26 Mar 2021 20:34:25 +1100
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation);
 Fri, 26 Mar 2021 20:34:24 +1100
Date: Fri, 26 Mar 2021 20:34:24 +1100
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Aditya Srivastava <yashsri421@gmail.com>
Subject: Re: [PATCH] crypto: vmx: fix incorrect kernel-doc comment syntax in
 files
Message-ID: <20210326093424.GP12658@gondor.apana.org.au>
References: <20210320202525.12562-1-yashsri421@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210320202525.12562-1-yashsri421@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: nayna@linux.ibm.com, corbet@lwn.net, rdunlap@infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 pfsmorigo@gmail.com, linux-crypto@vger.kernel.org, leitao@debian.org,
 lukas.bulwahn@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org,
 davem@davemloft.net, paulus@samba.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Mar 21, 2021 at 01:55:25AM +0530, Aditya Srivastava wrote:
> The opening comment mark '/**' is used for highlighting the beginning of
> kernel-doc comments.
> There are certain files in drivers/crypto/vmx, which follow this syntax,
> but the content inside does not comply with kernel-doc.
> Such lines were probably not meant for kernel-doc parsing, but are parsed
> due to the presence of kernel-doc like comment syntax(i.e, '/**'), which
> causes unexpected warnings from kernel-doc.
> 
> E.g., presence of kernel-doc like comment in the header line for
> drivers/crypto/vmx/vmx.c causes this warning by kernel-doc:
> 
> "warning: expecting prototype for Routines supporting VMX instructions on the Power 8(). Prototype was for p8_init() instead"
> 
> Similarly for other files too.
> 
> Provide a simple fix by replacing such occurrences with general comment
> format, i.e. '/*', to prevent kernel-doc from parsing it.
> 
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> ---
> * Applies perfectly on next-20210319
> 
>  drivers/crypto/vmx/aes.c     | 2 +-
>  drivers/crypto/vmx/aes_cbc.c | 2 +-
>  drivers/crypto/vmx/aes_ctr.c | 2 +-
>  drivers/crypto/vmx/aes_xts.c | 2 +-
>  drivers/crypto/vmx/ghash.c   | 2 +-
>  drivers/crypto/vmx/vmx.c     | 2 +-
>  6 files changed, 6 insertions(+), 6 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
