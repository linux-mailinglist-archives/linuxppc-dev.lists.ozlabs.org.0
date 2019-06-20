Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB664C829
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 09:17:10 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45TtRl20HgzDr3T
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 17:17:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gondor.apana.org.au
 (client-ip=216.24.177.18; helo=deadmen.hmeau.com;
 envelope-from=herbert@gondor.apana.org.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=gondor.apana.org.au
Received: from deadmen.hmeau.com (helcar.hmeau.com [216.24.177.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Trnz2hL7zDqYP
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2019 16:02:45 +1000 (AEST)
Received: from gondobar.mordor.me.apana.org.au ([192.168.128.4] helo=gondobar)
 by deadmen.hmeau.com with esmtps (Exim 4.89 #2 (Debian))
 id 1hdq9X-0008UB-3U; Thu, 20 Jun 2019 14:02:31 +0800
Received: from herbert by gondobar with local (Exim 4.89)
 (envelope-from <herbert@gondor.apana.org.au>)
 id 1hdq9N-0006tl-Hn; Thu, 20 Jun 2019 14:02:21 +0800
Date: Thu, 20 Jun 2019 14:02:21 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH v4 1/4] lib/scatterlist: Fix mapping iterator when
 sg->offset is greater than PAGE_SIZE
Message-ID: <20190620060221.q4pbsqzsza3pxs42@gondor.apana.org.au>
References: <cover.1560805614.git.christophe.leroy@c-s.fr>
 <f28c6b0e2f9510f42ca934f19c4315084e668c21.1560805614.git.christophe.leroy@c-s.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f28c6b0e2f9510f42ca934f19c4315084e668c21.1560805614.git.christophe.leroy@c-s.fr>
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
Cc: horia.geanta@nxp.com, Imre Deak <imre.deak@intel.com>,
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 17, 2019 at 09:15:02PM +0000, Christophe Leroy wrote:
> All mapping iterator logic is based on the assumption that sg->offset
> is always lower than PAGE_SIZE.
> 
> But there are situations where sg->offset is such that the SG item
> is on the second page. In that case sg_copy_to_buffer() fails
> properly copying the data into the buffer. One of the reason is
> that the data will be outside the kmapped area used to access that
> data.
> 
> This patch fixes the issue by adjusting the mapping iterator
> offset and pgoffset fields such that offset is always lower than
> PAGE_SIZE.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> Fixes: 4225fc8555a9 ("lib/scatterlist: use page iterator in the mapping iterator")
> Cc: stable@vger.kernel.org
> ---
>  lib/scatterlist.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)

Good catch.

> @@ -686,7 +686,12 @@ static bool sg_miter_get_next_page(struct sg_mapping_iter *miter)
>  		sg = miter->piter.sg;
>  		pgoffset = miter->piter.sg_pgoffset;
>  
> -		miter->__offset = pgoffset ? 0 : sg->offset;
> +		offset = pgoffset ? 0 : sg->offset;
> +		while (offset >= PAGE_SIZE) {
> +			miter->piter.sg_pgoffset = ++pgoffset;
> +			offset -= PAGE_SIZE;
> +		}

How about

	miter->piter.sg_pgoffset += offset >> PAGE_SHIFT;
	offset &= PAGE_SIZE - 1;

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
