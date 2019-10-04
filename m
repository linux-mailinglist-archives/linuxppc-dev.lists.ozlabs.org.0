Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 22896CBF2D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Oct 2019 17:30:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46lDMf0M1MzDqdt
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Oct 2019 01:30:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gondor.apana.org.au
 (client-ip=216.24.177.18; helo=fornost.hmeau.com;
 envelope-from=herbert@gondor.apana.org.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=gondor.apana.org.au
Received: from fornost.hmeau.com (helcar.hmeau.com [216.24.177.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46lDKg0GkgzDqdm
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Oct 2019 01:28:14 +1000 (AEST)
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.0.7])
 by fornost.hmeau.com with smtp (Exim 4.89 #2 (Debian))
 id 1iGPUs-0000oG-E8; Sat, 05 Oct 2019 01:27:59 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation);
 Sat, 05 Oct 2019 01:27:56 +1000
Date: Sat, 5 Oct 2019 01:27:56 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH] crypto: talitos - fix hash result for VMAP_STACK
Message-ID: <20191004152756.GC5148@gondor.apana.org.au>
References: <20190910060414.C1E3D6B734@pc16032vm.idsi0.si.c-s.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190910060414.C1E3D6B734@pc16032vm.idsi0.si.c-s.fr>
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
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
 Eric Biggers <ebiggers@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Sep 10, 2019 at 06:04:14AM +0000, Christophe Leroy wrote:
> When VMAP_STACK is selected, stack cannot be DMA-mapped.
> Therefore, the hash result has to be DMA-mapped in the request
> context and copied into areq->result at completion.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> ---
>  drivers/crypto/talitos.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
