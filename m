Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3589390DB9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 May 2021 03:03:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FqXkK5F2Yz3bxb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 May 2021 11:03:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=p6bYg521;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=p6bYg521; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FqXjb5fvvz304G
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 May 2021 11:02:27 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FqXjZ6tj2z9s1l;
 Wed, 26 May 2021 11:02:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1621990947;
 bh=ovmd0QF/+rpAnQrJvBUm7otUcw+qV5Ofv5ggDfLR6Xc=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=p6bYg521w6h6ZLZ4HKv4fMMUYE1um6gMHa4CCo11P+CNv8k3t4VY708RdlLJKQ7BN
 FfeoldeuFU+NKz8DfiDtrZACNYxwH/Fphp2P4M3Dv0SEsF2FBt5yoVuhO5NyIyCeLb
 zr0OEXpyVuZE7e0N072prtqci6KDWDLoPHU/ny4/BMheg+eBHayHSgyH7FaOEgrpQZ
 xSRSWkPHHjdY8TYncZj5Uk/w/0PGTiKUWoGsStN4qqqmAYVnT+7duEx84qjd+3V24V
 UGbofM4eKqRN8smR3tP/hNAtxcDKQLoD0BpfkkWMD1yn+M+89Kenc4jNSWwIWWg1q+
 eFESgryfTEU8Q==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>, wsa@kernel.org,
 andriy.shevchenko@linux.intel.com, andy.shevchenko@gmail.com,
 robh+dt@kernel.org
Subject: Re: [PATCH v3 3/4] powerpc/fsl: set fsl,i2c-erratum-a004447 flag
 for P1010 i2c controllers
In-Reply-To: <20210511212052.27242-4-chris.packham@alliedtelesis.co.nz>
References: <20210511212052.27242-1-chris.packham@alliedtelesis.co.nz>
 <20210511212052.27242-4-chris.packham@alliedtelesis.co.nz>
Date: Wed, 26 May 2021 11:02:26 +1000
Message-ID: <871r9ui9y5.fsf@mpe.ellerman.id.au>
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
> The i2c controllers on the P1010 have an erratum where the documented
> scheme for i2c bus recovery will not work (A-004447). A different
> mechanism is needed which is documented in the P1010 Chip Errata Rev L.
>
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
>
> Notes:
>     Changes in v3:
>     - New
>
>  arch/powerpc/boot/dts/fsl/p1010si-post.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)

Acked-by: Michael Ellerman <mpe@ellerman.id.au>

cheers

> diff --git a/arch/powerpc/boot/dts/fsl/p1010si-post.dtsi b/arch/powerpc/boot/dts/fsl/p1010si-post.dtsi
> index c2717f31925a..ccda0a91abf0 100644
> --- a/arch/powerpc/boot/dts/fsl/p1010si-post.dtsi
> +++ b/arch/powerpc/boot/dts/fsl/p1010si-post.dtsi
> @@ -122,7 +122,15 @@ memory-controller@2000 {
>  	};
>  
>  /include/ "pq3-i2c-0.dtsi"
> +	i2c@3000 {
> +		fsl,i2c-erratum-a004447;
> +	};
> +
>  /include/ "pq3-i2c-1.dtsi"
> +	i2c@3100 {
> +		fsl,i2c-erratum-a004447;
> +	};
> +
>  /include/ "pq3-duart-0.dtsi"
>  /include/ "pq3-espi-0.dtsi"
>  	spi0: spi@7000 {
> -- 
> 2.31.1
