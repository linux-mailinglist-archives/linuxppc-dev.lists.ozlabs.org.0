Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD84D917445
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jun 2024 00:33:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W80312ShNz3fr2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jun 2024 08:33:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gondor.apana.org.au (client-ip=216.24.177.18; helo=norbury.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org)
X-Greylist: delayed 1519 seconds by postgrey-1.37 at boromir; Wed, 26 Jun 2024 08:32:36 AEST
Received: from norbury.hmeau.com (helcar.hmeau.com [216.24.177.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W802Y00k3z3cYh
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jun 2024 08:32:36 +1000 (AEST)
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.103.7])
	by norbury.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1sMEJN-003cFI-0Q;
	Wed, 26 Jun 2024 08:06:50 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation); Wed, 26 Jun 2024 08:06:49 +1000
Date: Wed, 26 Jun 2024 08:06:49 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH 1/4] soc: fsl: qbman: FSL_DPAA depends on COMPILE_TEST
Message-ID: <Zns/eVVBc7pdv0yM@gondor.apana.org.au>
References: <20240624162128.1665620-1-leitao@debian.org>
 <20240625073926.15591595@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240625073926.15591595@kernel.org>
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
Cc: Horia =?utf-8?Q?Geant=C4=83?= <horia.geanta@nxp.com>, Gaurav Jain <gaurav.jain@nxp.com>, netdev@vger.kernel.org, Roy.Pledge@nxp.com, open list <linux-kernel@vger.kernel.org>, Pankaj Gupta <pankaj.gupta@nxp.com>, horms@kernel.org, Breno Leitao <leitao@debian.org>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 25, 2024 at 07:39:26AM -0700, Jakub Kicinski wrote:
> On Mon, 24 Jun 2024 09:21:19 -0700 Breno Leitao wrote:
> > As most of the drivers that depend on ARCH_LAYERSCAPE, make FSL_DPAA
> > depend on COMPILE_TEST for compilation and testing.
> > 
> > 	# grep -r depends.\*ARCH_LAYERSCAPE.\*COMPILE_TEST | wc -l
> > 	29
> 
> Cover letter would be good..
> 
> Herbert, (Pankaj | Gaurav | Horia) - no rush but once reviewed can we
> take this via netdev (or a shared branch)? As Breno linked we want to
> change the netdev allocation API, this is the last chunk of drivers
> we need to convert.

Sure, please feel free to take this via netdev.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
