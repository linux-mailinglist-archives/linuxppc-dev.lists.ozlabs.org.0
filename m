Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 691355E725
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2019 16:52:02 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45f3wb72XNzDqXG
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2019 00:51:59 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45f3Nb5qsSzDqSm
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jul 2019 00:27:40 +1000 (AEST)
Received: from gondobar.mordor.me.apana.org.au ([192.168.128.4] helo=gondobar)
 by deadmen.hmeau.com with esmtps (Exim 4.89 #2 (Debian))
 id 1higEJ-0000cD-5e; Wed, 03 Jul 2019 22:27:27 +0800
Received: from herbert by gondobar with local (Exim 4.89)
 (envelope-from <herbert@gondor.apana.org.au>)
 id 1higEF-0000UZ-Ar; Wed, 03 Jul 2019 22:27:23 +0800
Date: Wed, 3 Jul 2019 22:27:23 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH v5 0/4] *** SUBJECT HERE ***
Message-ID: <20190703142723.zueylnlwzajpdtvs@gondor.apana.org.au>
References: <cover.1561360551.git.christophe.leroy@c-s.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1561360551.git.christophe.leroy@c-s.fr>
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
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>, horia.geanta@nxp.com,
 linux-crypto@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 24, 2019 at 07:20:13AM +0000, Christophe Leroy wrote:
> This series is the last set of fixes for the Talitos driver.
> 
> We now get a fully clean boot on both SEC1 (SEC1.2 on mpc885) and
> SEC2 (SEC2.2 on mpc8321E) with CONFIG_CRYPTO_MANAGER_EXTRA_TESTS:
> 
> [    3.385197] bus: 'platform': really_probe: probing driver talitos with device ff020000.crypto
> [    3.450982] random: fast init done
> [   12.252548] alg: No test for authenc(hmac(md5),cbc(aes)) (authenc-hmac-md5-cbc-aes-talitos-hsna)
> [   12.262226] alg: No test for authenc(hmac(md5),cbc(des3_ede)) (authenc-hmac-md5-cbc-3des-talitos-hsna)
> [   43.310737] Bug in SEC1, padding ourself
> [   45.603318] random: crng init done
> [   54.612333] talitos ff020000.crypto: fsl,sec1.2 algorithms registered in /proc/crypto
> [   54.620232] driver: 'talitos': driver_bound: bound to device 'ff020000.crypto'
> 
> [    1.193721] bus: 'platform': really_probe: probing driver talitos with device b0030000.crypto
> [    1.229197] random: fast init done
> [    2.714920] alg: No test for authenc(hmac(sha224),cbc(aes)) (authenc-hmac-sha224-cbc-aes-talitos)
> [    2.724312] alg: No test for authenc(hmac(sha224),cbc(aes)) (authenc-hmac-sha224-cbc-aes-talitos-hsna)
> [    4.482045] alg: No test for authenc(hmac(md5),cbc(aes)) (authenc-hmac-md5-cbc-aes-talitos)
> [    4.490940] alg: No test for authenc(hmac(md5),cbc(aes)) (authenc-hmac-md5-cbc-aes-talitos-hsna)
> [    4.500280] alg: No test for authenc(hmac(md5),cbc(des3_ede)) (authenc-hmac-md5-cbc-3des-talitos)
> [    4.509727] alg: No test for authenc(hmac(md5),cbc(des3_ede)) (authenc-hmac-md5-cbc-3des-talitos-hsna)
> [    6.631781] random: crng init done
> [   11.521795] talitos b0030000.crypto: fsl,sec2.2 algorithms registered in /proc/crypto
> [   11.529803] driver: 'talitos': driver_bound: bound to device 'b0030000.crypto'
> 
> v2: dropped patch 1 which was irrelevant due to a rebase weirdness. Added Cc to stable on the 2 first patches.
> 
> v3:
>  - removed stable reference in patch 1
>  - reworded patch 1 to include name of patch 2 for the dependency.
>  - mentionned this dependency in patch 2 as well.
>  - corrected the Fixes: sha1 in patch 4
>  
> v4:
>  - using scatterwalk_ffwd() instead of opencodying SG list forwarding.
>  - Added a patch to fix sg_copy_to_buffer() when sg->offset() is greater than PAGE_SIZE,
>  otherwise sg_copy_to_buffer() fails when the list has been forwarded with scatterwalk_ffwd().
>  - taken the patch "crypto: talitos - eliminate unneeded 'done' functions at build time"
>  out of the series because it is independent.
>  - added a helper to find the header field associated to a request in flush_channe()
>  
> v5:
>  - Replacing the while loop by a direct shift/mask operation, as suggested by Herbert in patch 1.
> 
> Christophe Leroy (4):
>   lib/scatterlist: Fix mapping iterator when sg->offset is greater than
>     PAGE_SIZE
>   crypto: talitos - move struct talitos_edesc into talitos.h
>   crypto: talitos - fix hash on SEC1.
>   crypto: talitos - drop icv_ool
> 
>  drivers/crypto/talitos.c | 102 +++++++++++++++++++----------------------------
>  drivers/crypto/talitos.h |  28 +++++++++++++
>  lib/scatterlist.c        |   9 +++--
>  3 files changed, 74 insertions(+), 65 deletions(-)

All applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
