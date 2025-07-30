Return-Path: <linuxppc-dev+bounces-10476-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BADB167C6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Jul 2025 22:51:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bsksB3m4lz2yFK;
	Thu, 31 Jul 2025 06:51:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.79.88.28
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753908686;
	cv=none; b=Fr6CkPuueaEN9zbRx1ztGH7IftA4HP88dj3fmAhZMGf41Y8lmf3kVGEFsrhQO81QwxK9eG+9whV7rXyuhNMtsrqqqHFpIn+YNvwZ5PzxIEyvXDbWf7xj6OpnTna0YvLWXyhCt/NdB2OuX0IKd7XsyYnjq8kC2tdx+mg6sDSrQIiOnbhCZDqwtpiEHThQiwFeVpXZYngMdw0Ebv1RklNpBviPx9yoBer26uNMzzAMgmR8P8wh2DedIvJIGNluCCDp/jKSPHgcUqhS+Fy9Da9qbORtbSbGdBTIX6Q+1buARg85PUEPLuZ+5Ew7/uKzkpQT6Ak3LncGVJ4eRJmjSKZ5MA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753908686; c=relaxed/relaxed;
	bh=02MqzAQL13wGSkiV79PTgEwMNUoLXFSOZapwySxtdHs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=YFgxIgXcqsvf5x3au6Kh3zUIBDqmh4dGNiGNZwa0BKJXFXhWdupMjqX0NWUXBg7XrkRVwxN5PnGB1jFCCTMvDOoHtfi2pNDkJLOVT3V42HcI/vYTjHYh1ICoxJn0I9HLFypASDfXRuDqf5dR7TELjNbjI6sDRTsCr0oD44WGFLoDqVEBedm963lWDZHpi+YBOxtUYqAGlimuuWFSZplMBjbRztID35Rq9IjRZAGbV3NkE1MLkRp75gV4wpz80jcKzg9NGIX7mqB5izHgYbgpisEhGDn2GOXQEPL3CK4aZW7c3Xn4icwiXpYZUrDeBb/eZPie4xgm4NhOBcGRVQobyw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lwn.net; dkim=pass (2048-bit key; unprotected) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=U39lTtPt; dkim-atps=neutral; spf=pass (client-ip=45.79.88.28; helo=ms.lwn.net; envelope-from=corbet@lwn.net; receiver=lists.ozlabs.org) smtp.mailfrom=lwn.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=U39lTtPt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lwn.net (client-ip=45.79.88.28; helo=ms.lwn.net; envelope-from=corbet@lwn.net; receiver=lists.ozlabs.org)
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bsks859v3z2xtt
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Jul 2025 06:51:23 +1000 (AEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 1A49D406F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1753908681; bh=02MqzAQL13wGSkiV79PTgEwMNUoLXFSOZapwySxtdHs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=U39lTtPtf4k9A2d2EgfZUKo2Ists2QHrOkoBrC7tz7IDvbDfTiLnYdeaQE6c2wiRA
	 JGpMR+9yUCXoFuz5Ki76yYTxkKZOoPiQbWyrvfMEhGlRHOyqIP4Z/Bil7Pm2fHwjdN
	 POfd4IK2EchMQYKKsIg9aZWKClpCV+vDcavVNtQPhOOjmGCY2J4VBzAgTkvHgFqVmy
	 qZNS2GYGNab3u/1N4JM79Unz8qGnaNFPe5IeKeZkhr/OAnVbJD8NGZfhlACNwvGf/b
	 KmBB3Z3LIBvQFFpz2qjBawRdx62UvZVYaJI+Iw73nfoplxq1OMK7KsyGG8btXlMVX4
	 sOelNx303hhuA==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 1A49D406F8;
	Wed, 30 Jul 2025 20:51:21 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Kriish Sharma <kriish.sharma2006@gmail.com>, skhan@linuxfoundation.org,
 maddy@linux.ibm.com, mpe@ellerman.id.au
Cc: linuxppc-dev@lists.ozlabs.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, christophe.leroy@csgroup.eu,
 npiggin@gmail.com, linux-kernel-mentees@lists.linux.dev, Kriish Sharma
 <kriish.sharma2006@gmail.com>
Subject: Re: [PATCH] docs/powerpc: add htm.rst to toctree to fix warning
In-Reply-To: <20250730202752.8508-1-kriish.sharma2006@gmail.com>
References: <20250730202752.8508-1-kriish.sharma2006@gmail.com>
Date: Wed, 30 Jul 2025 14:51:20 -0600
Message-ID: <87qzxxtnav.fsf@trenco.lwn.net>
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
Content-Type: text/plain
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Kriish Sharma <kriish.sharma2006@gmail.com> writes:

> The htm.rst file was not included in any toctree, leading to a Sphinx
> warning when building documentation.
>
> Include it in Documentation/arch/powerpc/index.rst to fix the warning.
>
> Signed-off-by: Kriish Sharma <kriish.sharma2006@gmail.com>
> ---
>  Documentation/arch/powerpc/index.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/arch/powerpc/index.rst b/Documentation/arch/powerpc/index.rst
> index 0560cbae5fa1..ae0280383315 100644
> --- a/Documentation/arch/powerpc/index.rst
> +++ b/Documentation/arch/powerpc/index.rst
> @@ -36,7 +36,7 @@ powerpc
>      vas-api
>      vcpudispatch_stats
>      vmemmap_dedup
> -
> +    htm
>      features

Thanks...but we already have two conflicting versions of this fix headed
upstream, so a third is probably not needed :)

jo

