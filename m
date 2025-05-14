Return-Path: <linuxppc-dev+bounces-8581-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D180AB7160
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 May 2025 18:29:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZyJhm4KQLz2ywh;
	Thu, 15 May 2025 02:29:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747240184;
	cv=none; b=SswiPrCkLSt/0sacwG33P27lNcH40NSnQu+kQaZj8vSplbSACp9O84LcT/WSrWpQZ3RIJtR3IT+6E6IBMJhaHVzpEAS1nW532QNbSD3dPVI8zcGgrWAG/dy6vT7k+2fvxSFZsWXMNkmgIULiZu61vQq8hLqHW85PCCcVnFT78JUdY9b0V04cs+rsf6/fsO+02Hca3e2NJYnG+kqna3umDOHEefwe2rCVfIeZhk057uVS1LUQzfIBuqWjWlwd8F8l/8+LvVZ2gH5KEq1uomunMQZnH9+yxSLEISjjGX/wah1Zw6LGz6L8a7BCsFpC76xGEUiN27cSTbOPTGvZki8O3w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747240184; c=relaxed/relaxed;
	bh=wJxYorE69NSrMrnVHCNoayopmsJOx3uJlDSWpzQxVOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fDoMlVhK6SLD+Dp1fqiyd5vU9DboD5KaT3G6yMjBGWtWmxIssU/Gwvwk0zvB1fo3b7N99thPHTaGYxYnOtW8MQOwCUz4D/k7i3wKy2cln1vD6yxNJYB86WjdX795hDimXArkUxGWo+zPDim8+bZUxnN6ywXNtSWGGrf45ajdb4z3RyHOtI5vnOG3xqjOY6q68aZ3mKQybypw4dbOk1ywnmvsDYgIgGMMmGfNqraUAoIZXNCNYdaSAzhiGMe6xz0RjRRZTcf+Q10LkZCafU+/20sm2Lb+bjrBlYGTOJ7CHjNibDCh3nWHTrnGRL2wd8kZsLWD5377RTX/jAX85ySHmQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=n0Hz+2qT; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=n0Hz+2qT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZyJhl17jKz2yw7
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 May 2025 02:29:42 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A10785C6141;
	Wed, 14 May 2025 16:27:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49AF8C4CEE3;
	Wed, 14 May 2025 16:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747240179;
	bh=viHRzIvyfWm6Z/Hx1NafsPkUVC0n611P4vJNmAOjXhg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n0Hz+2qT7JlqFqIdhMkIf/FZS59SAcmunTrJe24zF6ImEDjtBid7Z/R0NnZeRevEW
	 sWoZWTF/BcIW7FEQ2SSNphEXHZtyXGaG3PaDdoJ0l2eXCDzV4VCFRtInmygmiHRwVi
	 Em/RO7XV4MgUVDWY6ARSyc8/W8oRlDbv9m9KE2pR9qRemS3EYuHdYd5T7K7ANLNVnh
	 6at9sOk9/6tKuT7Y77aFXMIYD7cPigRCng6UwhNYTG7xeoATlHWsHD24iFDbsTf38M
	 D3Da2oZS+i9uUho2wzhmIENiG23x1GphFdldsM5DtzQqOK927IugNtM7tiY4QIgUZb
	 b1iEoflih8IjA==
Date: Wed, 14 May 2025 09:29:33 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
	christophe.leroy@csgroup.eu, naveen@kernel.org, dtsen@linux.ibm.com,
	segher@kernel.crashing.org, stable@vger.kernel.org
Subject: Re: [PATCH] crypto: powerpc/poly1305 - add depends on BROKEN for now
Message-ID: <20250514162933.GB1236@sol>
References: <20250514051847.193996-1-ebiggers@kernel.org>
 <aCRlU0J7QoSJs5sy@gondor.apana.org.au>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCRlU0J7QoSJs5sy@gondor.apana.org.au>
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, May 14, 2025 at 05:41:39PM +0800, Herbert Xu wrote:
> Eric Biggers <ebiggers@kernel.org> wrote:
> > From: Eric Biggers <ebiggers@google.com>
> > 
> > As discussed in the thread containing
> > https://lore.kernel.org/linux-crypto/20250510053308.GB505731@sol/, the
> > Power10-optimized Poly1305 code is currently not safe to call in softirq
> > context.  Disable it for now.  It can be re-enabled once it is fixed.
> > 
> > Fixes: ba8f8624fde2 ("crypto: poly1305-p10 - Glue code for optmized Poly1305 implementation for ppc64le")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Eric Biggers <ebiggers@google.com>
> > ---
> > arch/powerpc/lib/crypto/Kconfig | 1 +
> > 1 file changed, 1 insertion(+)
> 
> I thought this fix should be enough, no?
> 
> https://patchwork.kernel.org/project/linux-crypto/patch/aB8Yy0JGvoErc0ns@gondor.apana.org.au/

I didn't notice that.  Probably, though I don't have time to review this subtle
Poly1305 code.  Especially with all the weird unions in the code.  Would be
great if the PowerPC folks would take a look.

- Eric

