Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C319390DB5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 May 2021 03:02:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FqXjt45Vtz30L4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 May 2021 11:02:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=oHVrEdNn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=oHVrEdNn; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FqXjR1fycz2xvP
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 May 2021 11:02:18 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FqXjH4nDhz9s1l;
 Wed, 26 May 2021 11:02:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1621990932;
 bh=7YFaEXfPr9zaWFglhtnONuAD5PnCnM4K1fEPjwflXkk=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=oHVrEdNnGr2oj9KRqvebzUCeS+mmscnS/EH66JqawKZP922vwiSxH10iV5/+2mhQH
 OLbb8bi7+AuooHvmyQiAS2NrrzFTIx56EigazAl/Ja4jPyvlw+Nr0rA53ukrCBra2G
 V8roIGSpzVK96pg1XYHKa+cr6s1zLDHC/BYd6ABr3rEdh9ngdnQzeMWsHQK8uILXbL
 ADPab14Rqui7tx6TE7Zw6D19DHPkW+faFNLtIDVUQKnh+Rul/TGO72b2HR3oHIBwqf
 dIW0KHamcspLPKd/T09N2KT/BWIly+XS9lsV5k+KK60GyxtiLmiOcyjbmz6rcFPFbK
 ecugbPRrEnlMA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>, wsa@kernel.org,
 andriy.shevchenko@linux.intel.com, andy.shevchenko@gmail.com,
 robh+dt@kernel.org
Subject: Re: [PATCH v3 2/4] powerpc/fsl: set fsl,i2c-erratum-a004447 flag
 for P2041 i2c controllers
In-Reply-To: <20210511212052.27242-3-chris.packham@alliedtelesis.co.nz>
References: <20210511212052.27242-1-chris.packham@alliedtelesis.co.nz>
 <20210511212052.27242-3-chris.packham@alliedtelesis.co.nz>
Date: Wed, 26 May 2021 11:02:05 +1000
Message-ID: <874keqi9yq.fsf@mpe.ellerman.id.au>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Paul Mackerras <paulus@samba.org>, linux-i2c@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Chris Packham <chris.packham@alliedtelesis.co.nz> writes:
> The i2c controllers on the P2040/P2041 have an erratum where the
> documented scheme for i2c bus recovery will not work (A-004447). A
> different mechanism is needed which is documented in the P2040 Chip
> Errata Rev Q (latest available at the time of writing).
>
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
>  arch/powerpc/boot/dts/fsl/p2041si-post.dtsi | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)

Acked-by: Michael Ellerman <mpe@ellerman.id.au>

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
> 2.31.1
