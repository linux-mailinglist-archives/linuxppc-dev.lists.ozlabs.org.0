Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1C6916AB0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2024 16:40:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oK1oA7w2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W7nYK2Fr9z3fq0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jun 2024 00:40:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oK1oA7w2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W7nXd3mWbz3bsj
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jun 2024 00:39:29 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DF8F061491;
	Tue, 25 Jun 2024 14:39:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17AB2C32781;
	Tue, 25 Jun 2024 14:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719326367;
	bh=LyB86D3k1vBzWqSbP53281A2OWOSd8SaUo1kRPk9I8A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=oK1oA7w2L4+qOb1hhZC+cUiVIQH5UemsLT3orNl2Xe7zTjApMTptv0Ugu83Y+GFfZ
	 lXx9HFddmRZG4j4mB4pi6rpOKEtIDe9IY45uOhyeQ9SGbjRpbDDOZsDCwkPruEXa+w
	 yAfW2a1klXD7gKpKIgB7YafR4rX2jzLnLy5pBH8b8fWRk0hI/zVb9VkIVeDe7uDbLc
	 rnE+uIVRh/z35hyz8KLao0dgq1MoAxQxbONe1AtmRyAJs5xoNnb0xVsORSGshrzw54
	 o8Ymto7TJ7g8eBIvK4k6fo7D/V14FfRWZfSnYXtIZhc943Xjn1+TJL9MD/4pOaLSBQ
	 haeZv6CaJPm9g==
Date: Tue, 25 Jun 2024 07:39:26 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Breno Leitao <leitao@debian.org>
Subject: Re: [PATCH 1/4] soc: fsl: qbman: FSL_DPAA depends on COMPILE_TEST
Message-ID: <20240625073926.15591595@kernel.org>
In-Reply-To: <20240624162128.1665620-1-leitao@debian.org>
References: <20240624162128.1665620-1-leitao@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Horia =?UTF-8?B?R2VhbnTEgw==?= <horia.geanta@nxp.com>, Gaurav Jain <gaurav.jain@nxp.com>, netdev@vger.kernel.org, Roy.Pledge@nxp.com, open list <linux-kernel@vger.kernel.org>, Pankaj Gupta <pankaj.gupta@nxp.com>, horms@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 24 Jun 2024 09:21:19 -0700 Breno Leitao wrote:
> As most of the drivers that depend on ARCH_LAYERSCAPE, make FSL_DPAA
> depend on COMPILE_TEST for compilation and testing.
> 
> 	# grep -r depends.\*ARCH_LAYERSCAPE.\*COMPILE_TEST | wc -l
> 	29

Cover letter would be good..

Herbert, (Pankaj | Gaurav | Horia) - no rush but once reviewed can we
take this via netdev (or a shared branch)? As Breno linked we want to
change the netdev allocation API, this is the last chunk of drivers
we need to convert.
