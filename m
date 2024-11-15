Return-Path: <linuxppc-dev+bounces-3247-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F34D9CDDE4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Nov 2024 12:58:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XqbC873PLz2yQJ;
	Fri, 15 Nov 2024 22:58:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=144.6.53.87
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731671924;
	cv=none; b=GVNnNSdIfThklLzUU/RHYgiC4OC6v8uLhpY7qHOTfjeqxTH4I9FwUtWhfE/4JlUdiMlLQlztkbefsRVsLig3scxIZSKTTqRs+DS+bH/YbMkqDJz+16RGpiCTErAYBaDlDBoh88wIEoxtsR2YsObL7hX2Nrz/a40Afq5hYcvyjeftKfOChsjeMSXBLUqg7CRpee1NaaGMue+zHkYMq91t2gtXdiEv41o4sIadl+h+PpkbSFSbsc2Z3hFTATPld/a1RuVvBNPW/fs2P1Orl25rAJ12hm52NPPQTReHFVegX8OkLuFxXVzCtIhkGHr0jREIczxDZUN9a/adU+JOI/Uamw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731671924; c=relaxed/relaxed;
	bh=ln6NUFo2qRXRfJFl/RulvjbR0lolf2yFHeb6Il/5kl8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iebCOrKjtgUH1kNGYAUEDm6Ojla144qBNptt7Oh+QkbNJDo+X7+A2VpkaoSs3lWVUsb6uK5+YVbjXS2LOqABlRmYjfxDARm5zWxJe1Cy87FOs3BrP23xlJE/ucn21vpC1yEmJLN3oyBwi4K8EjoHzr+DTMdPNsYBrFWSiBlOx7JZEcQTGJXwKLFgWVebTie0kMtwXqTxTiMoNrYGZB5k6HE5BoMGNWmBc6hvcFCutcNo9HFYQtB7gRYf4uLVdg83qOsGFdF5NgBKq8gldt4Tq5eDynWeOmHS5nhqeMLmk62aaCBaI+S98POdI2p6t/jgI5rIriIdo1fCepvyZ6SDTA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=AdJQJaBA; dkim-atps=neutral; spf=pass (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org) smtp.mailfrom=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=AdJQJaBA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gondor.apana.org.au (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org)
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XqbC70pG1z2yMP
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2024 22:58:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=ln6NUFo2qRXRfJFl/RulvjbR0lolf2yFHeb6Il/5kl8=; b=AdJQJaBAWwAXJEsrsvth3BJ0xd
	EShv8PQUIgwXqdbV4VJhtB8N1V8PZAGLCjMratcIou5WEASpf+20CbKdi9LHIdct9/Vov9k8+2x+O
	SprrVl4US0j9Ev+PWllTbiSVOAIxYuZYgVtjh25w6LUAzASJMNxDuGu8hepsR0r77Fzh2eaafrYoW
	QOi8CkMk40kALSP73u5a8De7MWeYKdhs/CTmXXcJRQaW0qSOOp+H5crJ5QZ7FS532uiGSeBKE/xqi
	hdt16PBVKfsptTaa8c8RIRdPwpsHNnyIDppRwXqEpLxQ2CkUTAXQ0Vr5ztjojXE5FAwCBfgxruoaf
	ViEv09pg==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1tBuy5-00H20E-1l;
	Fri, 15 Nov 2024 19:58:30 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 15 Nov 2024 19:58:29 +0800
Date: Fri, 15 Nov 2024 19:58:29 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Lukas Bulwahn <lbulwahn@redhat.com>
Cc: Olivia Mackall <olivia@selenic.com>, linux-crypto@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	linuxppc-dev@lists.ozlabs.org, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: Re: [PATCH] hwrng: amd - remove reference to removed PPC_MAPLE config
Message-ID: <Zzc3ZUgMVFAd8xN6@gondor.apana.org.au>
References: <20241106081343.66479-1-lukas.bulwahn@redhat.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241106081343.66479-1-lukas.bulwahn@redhat.com>
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Nov 06, 2024 at 09:13:43AM +0100, Lukas Bulwahn wrote:
> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> 
> Commit 62f8f307c80e ("powerpc/64: Remove maple platform") removes the
> PPC_MAPLE config as a consequence of the platform’s removal.
> 
> The config definition of HW_RANDOM_AMD refers to this removed config option
> in its dependencies.
> 
> Remove the reference to the removed config option.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> ---
>  drivers/char/hw_random/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

