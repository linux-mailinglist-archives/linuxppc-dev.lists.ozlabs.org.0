Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A679C5928A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 06:20:56 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Zk8j6LKZzDqDN
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 14:20:53 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Zk6V008zzDqcQ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2019 14:18:55 +1000 (AEST)
Received: from gondobar.mordor.me.apana.org.au ([192.168.128.4] helo=gondobar)
 by deadmen.hmeau.com with esmtps (Exim 4.89 #2 (Debian))
 id 1hgiLV-0004t8-PT; Fri, 28 Jun 2019 12:18:45 +0800
Received: from herbert by gondobar with local (Exim 4.89)
 (envelope-from <herbert@gondor.apana.org.au>)
 id 1hgiLT-00025E-UM; Fri, 28 Jun 2019 12:18:43 +0800
Date: Fri, 28 Jun 2019 12:18:43 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH] crypto: talitos - eliminate unneeded 'done' functions at
 build time
Message-ID: <20190628041843.are3ywit6pek7upa@gondor.apana.org.au>
References: <2cb226d8a3e4876ff3d66c32aa4de9c0008b6cb8.1560805489.git.christophe.leroy@c-s.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2cb226d8a3e4876ff3d66c32aa4de9c0008b6cb8.1560805489.git.christophe.leroy@c-s.fr>
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

On Mon, Jun 17, 2019 at 09:14:45PM +0000, Christophe Leroy wrote:
> When building for SEC1 only, talitos2_done functions are unneeded
> and should go away.
> 
> For this, use has_ftr_sec1() which will always return true when only
> SEC1 support is being built, allowing GCC to drop TALITOS2 functions.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> Reviewed-by: Horia Geantă <horia.geanta@nxp.com>
> ---
>  taken out of the "Additional fixes on Talitos driver" series as it can be applied independently
> 
>  drivers/crypto/talitos.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
