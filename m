Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3B88B69C0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2024 07:11:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mmLLtt1I;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VT7b738Wwz3cW2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2024 15:11:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mmLLtt1I;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=aneesh.kumar@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VT7ZM5c5fz3bZN
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2024 15:10:51 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 805256034B;
	Tue, 30 Apr 2024 05:10:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92E3BC2BBFC;
	Tue, 30 Apr 2024 05:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714453849;
	bh=VSb98eDGVt9SRHwNWupysddHqD5t16DQXrkFIt7miX8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=mmLLtt1IjTxdV3+ONX64hPElmV2URptISu3dJ9Ur/sPFTsnfI8psoqvcGlu8HPapq
	 9pWz3+Q5BvmxMqzMjVJXRM06NFj5htoZtgPInMX4JAfM1O8Q4WzBSgTCtoupH10xmV
	 ZGpUZb/RjyKYZowxX/FyikB01620CxhBT/6tkye8bdDGJVj9IPk56ve4ktHND4JnYj
	 XF3Pgpu32kWK1xWGp4hvH94/fQuwhqw09ykTuyr9obaJ2PSSRMy7MJKY7V4NKia+IU
	 VBLO7woLLoC2CfRb8S0OfmsCF43lItdaVjIwqe4f5cIFRFXWcPuy09TLxMBtMByYvN
	 F2mO584cEi5Cg==
X-Mailer: emacs 29.3 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] MAINTAINERS: powerpc: Remove Aneesh
In-Reply-To: <20240430044228.49015-1-mpe@ellerman.id.au>
References: <20240430044228.49015-1-mpe@ellerman.id.au>
Date: Tue, 30 Apr 2024 10:40:42 +0530
Message-ID: <yq5attjj306l.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: naveen.n.rao@linux.ibm.com, npiggin@gmail.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> writes:

> Aneesh is stepping down from powerpc maintenance.
>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Acked-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>

> ---
>  MAINTAINERS | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7c121493f43d..93af33ee8541 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12478,7 +12478,6 @@ LINUX FOR POWERPC (32-BIT AND 64-BIT)
>  M:	Michael Ellerman <mpe@ellerman.id.au>
>  R:	Nicholas Piggin <npiggin@gmail.com>
>  R:	Christophe Leroy <christophe.leroy@csgroup.eu>
> -R:	Aneesh Kumar K.V <aneesh.kumar@kernel.org>
>  R:	Naveen N. Rao <naveen.n.rao@linux.ibm.com>
>  L:	linuxppc-dev@lists.ozlabs.org
>  S:	Supported
> -- 
> 2.44.0
