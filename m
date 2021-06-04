Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8514739AF2B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Jun 2021 02:42:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fx3rc0JCqz3046
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Jun 2021 10:42:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=XCSoOX7+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=XCSoOX7+; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fx3r95ySpz2xv2
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Jun 2021 10:42:17 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Fx3r76hVPz9s24;
 Fri,  4 Jun 2021 10:42:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1622767336;
 bh=DQpYo9q9ZGmy3/Mz9ZsYTiA+IvTCwyCbRWUrvMTeOWg=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=XCSoOX7+qd0hTsKT5E44LzCwxhYBrifdK2aZAP+aS3g3Jkr2lirTl4yXlsasbfpV1
 0NIqKavfSaGn/V+8EA0FmH3rpG5eBR/UWn8HJbjnpvWY/crHolu/n65SJNszrhRk/+
 9oJBMq6EJweWntk3gTnGz6NKGowoEF6BTLyFOvshwr+/a6sIqEhABPUf9OMcEQ8S2i
 2nN5ebs9M1/7a8fUFX/ceCS9JoCRZostRS311xpHia8fHEwiagVGDzFUtNTTX0BZVm
 3B09zc7XiTN3lI4OUQBhZGBiDzvcF6LIjC7fbXiQgdcoSqlLaiD8WW69Sx6NzYQLuR
 v2gUjE0842asw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH AUTOSEL 5.12 42/43] powerpc/fsl: set
 fsl,i2c-erratum-a004447 flag for P2041 i2c controllers
In-Reply-To: <20210603170734.3168284-42-sashal@kernel.org>
References: <20210603170734.3168284-1-sashal@kernel.org>
 <20210603170734.3168284-42-sashal@kernel.org>
Date: Fri, 04 Jun 2021 10:42:15 +1000
Message-ID: <87y2bqfok8.fsf@mpe.ellerman.id.au>
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
Cc: Wolfram Sang <wsa@kernel.org>, Sasha Levin <sashal@kernel.org>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sasha Levin <sashal@kernel.org> writes:
> From: Chris Packham <chris.packham@alliedtelesis.co.nz>
>
> [ Upstream commit 7adc7b225cddcfd0f346d10144fd7a3d3d9f9ea7 ]
>
> The i2c controllers on the P2040/P2041 have an erratum where the
> documented scheme for i2c bus recovery will not work (A-004447). A
> different mechanism is needed which is documented in the P2040 Chip
> Errata Rev Q (latest available at the time of writing).
>
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Acked-by: Michael Ellerman <mpe@ellerman.id.au>
> Signed-off-by: Wolfram Sang <wsa@kernel.org>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  arch/powerpc/boot/dts/fsl/p2041si-post.dtsi | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)

This patch (and the subsequent one), just set a flag in the device tree.

They have no effect unless you also backport the code change that looks
for that flag, which was upstream commit:

  8f0cdec8b5fd ("i2c: mpc: implement erratum A-004447 workaround")

AFAICS you haven't picked that one up for any of the stable trees.

I'll defer to Chris & Wolfram on whether it's a good idea to take the
code change for stable.

I guess it's harmless to pick these two patches, but it's also
pointless. So I think you either want to take all three, or drop these
two.

cheers

> diff --git a/arch/powerpc/boot/dts/fsl/p2041si-post.dtsi b/arch/powerpc/boot/dts/fsl/p2041si-post.dtsi
> index 872e4485dc3f..ddc018d42252 100644
> --- a/arch/powerpc/boot/dts/fsl/p2041si-post.dtsi
> +++ b/arch/powerpc/boot/dts/fsl/p2041si-post.dtsi
> @@ -371,7 +371,23 @@ sdhc@114000 {
>  	};
>  
>  /include/ "qoriq-i2c-0.dtsi"
> +	i2c@118000 {
> +		fsl,i2c-erratum-a004447;
> +	};
> +
> +	i2c@118100 {
> +		fsl,i2c-erratum-a004447;
> +	};
> +
>  /include/ "qoriq-i2c-1.dtsi"
> +	i2c@119000 {
> +		fsl,i2c-erratum-a004447;
> +	};
> +
> +	i2c@119100 {
> +		fsl,i2c-erratum-a004447;
> +	};
> +
>  /include/ "qoriq-duart-0.dtsi"
>  /include/ "qoriq-duart-1.dtsi"
>  /include/ "qoriq-gpio-0.dtsi"
> -- 
> 2.30.2
