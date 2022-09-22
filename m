Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 655F75E6307
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Sep 2022 14:59:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYFjr1JgVz3c46
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Sep 2022 22:59:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=C5K9katg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=C5K9katg;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MYFjF2cLrz307C
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Sep 2022 22:59:13 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6D4CF60B85;
	Thu, 22 Sep 2022 12:59:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB745C433D6;
	Thu, 22 Sep 2022 12:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663851548;
	bh=kjCrlxn5MWJzNix0IkpTAY0rn59Ak576azpNmksfi9s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C5K9katgCOicYBFjYNqebhR/FBqYSAD39th+KVN+PAC9y+MQgzQIb/pQ7OwbHKmZQ
	 GKvtor2+GsExawlb5oFBdRXWq2hSJaFE3d1Z/mfke4Jph8dkuhtX7d5g4qE8aH3AOY
	 XsLtUtehEjdVUDHFJ20uz6ocsDlskarTs1Z1q4KwdqACwsfYqkcxIwA865Kx8KZofP
	 C0kH3nhI7A8/K5JMYdRBai9wCFNMFIIKNbogbMPI8U9U/QuspT9IDwMTJYI19UHZwx
	 jBUTojf5pqEKZmH17QHFH49t5K9q/0MO51PTxnQ8kXmKZF1Z3FlXUVyFpqzOjTbofu
	 ZzCqAmCJROyag==
Received: by pali.im (Postfix)
	id CC26B858; Thu, 22 Sep 2022 14:59:05 +0200 (CEST)
Date: Thu, 22 Sep 2022 14:59:05 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc: dts: turris1x.dts: Fix labels in DSA cpu port
 nodes
Message-ID: <20220922125905.sk6e55r7eljohkld@pali>
References: <20220827131538.14577-1-pali@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220827131538.14577-1-pali@kernel.org>
User-Agent: NeoMutt/20180716
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Saturday 27 August 2022 15:15:38 Pali Rohár wrote:
> DSA cpu port node has to be marked with "cpu" label.
> So fix it for both cpu port nodes.
> 
> Fixes: 54c15ec3b738 ("powerpc: dts: Add DTS file for CZ.NIC Turris 1.x routers")
> Signed-off-by: Pali Rohár <pali@kernel.org>

Ping?

> ---
>  arch/powerpc/boot/dts/turris1x.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/boot/dts/turris1x.dts b/arch/powerpc/boot/dts/turris1x.dts
> index 8277e0d7fd91..64c0dd733e40 100644
> --- a/arch/powerpc/boot/dts/turris1x.dts
> +++ b/arch/powerpc/boot/dts/turris1x.dts
> @@ -147,7 +147,7 @@
>  
>  					port@0 {
>  						reg = <0>;
> -						label = "cpu1";
> +						label = "cpu";
>  						ethernet = <&enet1>;
>  						phy-mode = "rgmii-id";
>  
> @@ -184,7 +184,7 @@
>  
>  					port@6 {
>  						reg = <6>;
> -						label = "cpu0";
> +						label = "cpu";
>  						ethernet = <&enet0>;
>  						phy-mode = "rgmii-id";
>  
> -- 
> 2.20.1
> 
