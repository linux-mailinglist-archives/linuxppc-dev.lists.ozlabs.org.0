Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 200C97EBBF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 06:57:32 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 460FJm3FB9zDqkW
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 14:57:28 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 460FGj6WvmzDqRS
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2019 14:55:41 +1000 (AEST)
Received: from gondolin.me.apana.org.au ([192.168.0.6]
 helo=gondolin.hengli.com.au)
 by fornost.hmeau.com with esmtps (Exim 4.89 #2 (Debian))
 id 1htPb6-0006I5-Vn; Fri, 02 Aug 2019 14:55:21 +1000
Received: from herbert by gondolin.hengli.com.au with local (Exim 4.80)
 (envelope-from <herbert@gondor.apana.org.au>)
 id 1htPaz-0004jR-OD; Fri, 02 Aug 2019 14:55:13 +1000
Date: Fri, 2 Aug 2019 14:55:13 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Nishka Dasgupta <nishkadg.linux@gmail.com>
Subject: Re: [PATCH v2] crypto: nx: nx-842-powernv: Add of_node_put() before
 return
Message-ID: <20190802045513.GE18077@gondor.apana.org.au>
References: <20190724075433.9446-1-nishkadg.linux@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190724075433.9446-1-nishkadg.linux@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
Cc: paulus@samba.org, linux-crypto@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 24, 2019 at 01:24:33PM +0530, Nishka Dasgupta wrote:
> Each iteration of for_each_compatible_node puts the previous node, but
> in the case of a return from the middle of the loop, there is no put,
> thus causing a memory leak. Add an of_node_put before the return.
> Issue found with Coccinelle.
> 
> Acked-by: Stewart Smith <stewart@linux.ibm.com>
> Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
> 
> ---
> Changes in v2:
> - Fixed commit message to match the loop in question.
> 
>  drivers/crypto/nx/nx-842-powernv.c | 1 +
>  1 file changed, 1 insertion(+)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
