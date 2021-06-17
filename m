Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C92DD3AAE5A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 10:01:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5DzH3RyFz3c0k
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 18:01:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gondor.apana.org.au (client-ip=216.24.177.18;
 helo=deadmen.hmeau.com; envelope-from=herbert@gondor.apana.org.au;
 receiver=<UNKNOWN>)
Received: from deadmen.hmeau.com (helcar.hmeau.com [216.24.177.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5Dyt4nwvz2xv2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jun 2021 18:01:24 +1000 (AEST)
Received: from gondobar.mordor.me.apana.org.au ([192.168.128.4] helo=gondobar)
 by deadmen.hmeau.com with esmtp (Exim 4.92 #5 (Debian))
 id 1ltmxT-0003hK-78; Thu, 17 Jun 2021 16:01:03 +0800
Received: from herbert by gondobar with local (Exim 4.92)
 (envelope-from <herbert@gondor.apana.org.au>)
 id 1ltmx9-0002mO-VK; Thu, 17 Jun 2021 16:00:43 +0800
Date: Thu, 17 Jun 2021 16:00:43 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: trix@redhat.com
Subject: Re: [PATCH 04/11] crypto: marvell: cesa: change FPGA indirect
 article to an
Message-ID: <20210617080043.GA10662@gondor.apana.org.au>
References: <20210608212350.3029742-1-trix@redhat.com>
 <20210608212350.3029742-6-trix@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210608212350.3029742-6-trix@redhat.com>
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
Cc: devicetree@vger.kernel.org, arno@natisbad.org, Sven.Auhagen@voleatech.de,
 ajd@linux.ibm.com, corbet@lwn.net, gregkh@linuxfoundation.org,
 linux-fpga@vger.kernel.org, bbrezillon@kernel.org, linux-doc@vger.kernel.org,
 schalla@marvell.com, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev, robh+dt@kernel.org, mdf@kernel.org,
 linux-crypto@vger.kernel.org, grandmaster@al2klimov.de, fbarrat@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net, hao.wu@intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 08, 2021 at 02:23:43PM -0700, trix@redhat.com wrote:
> From: Tom Rix <trix@redhat.com>
> 
> Change use of 'a fpga' to 'an fpga'
> 
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/crypto/marvell/cesa/cesa.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
