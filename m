Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 65190191EC6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Mar 2020 03:01:26 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48nBDg30plzDqs6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Mar 2020 13:01:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48nBBQ3G2qzDqNN
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Mar 2020 12:59:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=BkZ9AsjD; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48nBBP1jKDz9sQt;
 Wed, 25 Mar 2020 12:59:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1585101566;
 bh=DbtFmqRT8V9GpajJ1kFCBoHEqZgLl/5/UANC/xKI3s0=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=BkZ9AsjDqXY8v+ztK0YKORVmsZMcDINt9MZK0b/uxGLYdi9Coy+Bz+Ubi9x6rHiS4
 YociJuOWuZmr41ZDgMWphIS2vP/JI2F4YWmAsGsE5KcLrK5EWamNPzxi3jg3eyhcP5
 u4jS63ly4k/YU6faqB/XVJa9grwHX7l/mWZnnJkiDnlSoflH9NC3Y0tHf7CohJZ74m
 nXrO5b8UBQg/7OPLaglOpfYQzhKQ7rVnA93tTMu9l0WywejpwoV/c2gnW/xB/G9P9S
 jIXwkxXK+iaAlt3BJSj/IhLVWlmPWHeCLnalZ7f/MVJCXg2o2SMfqUPCdPGa85QI4u
 QKJOerRLbJeag==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>, robh+dt@kernel.org,
 mark.rutland@arm.com, paulus@samba.org, benh@kernel.crashing.org
Subject: Re: [PATCH] powerpc/fsl: Add cache properties for T2080/T2081
In-Reply-To: <20200324213612.31614-1-chris.packham@alliedtelesis.co.nz>
References: <20200324213612.31614-1-chris.packham@alliedtelesis.co.nz>
Date: Wed, 25 Mar 2020 12:59:28 +1100
Message-ID: <877dz9xkhr.fsf@mpe.ellerman.id.au>
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
Cc: devicetree@vger.kernel.org,
 Hamish Martin <hamish.martin@alliedtelesis.co.nz>,
 linux-kernel@vger.kernel.org, Scott Wood <oss@buserror.net>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Chris Packham <chris.packham@alliedtelesis.co.nz> writes:
> Add the d-cache/i-cache properties for the T208x SoCs. The L1 cache on
> these SoCs is 32KiB and is split into 64 byte blocks (lines).
>
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
>  arch/powerpc/boot/dts/fsl/t208xsi-pre.dtsi | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)

LGTM.

I'll wait a few days to see if Scott wants to ack it.

cheers


> diff --git a/arch/powerpc/boot/dts/fsl/t208xsi-pre.dtsi b/arch/powerpc/boot/dts/fsl/t208xsi-pre.dtsi
> index 3f745de44284..2ad27e16ac16 100644
> --- a/arch/powerpc/boot/dts/fsl/t208xsi-pre.dtsi
> +++ b/arch/powerpc/boot/dts/fsl/t208xsi-pre.dtsi
> @@ -81,6 +81,10 @@ cpus {
>  		cpu0: PowerPC,e6500@0 {
>  			device_type = "cpu";
>  			reg = <0 1>;
> +			d-cache-line-size = <64>;
> +			i-cache-line-size = <64>;
> +			d-cache-size = <32768>;
> +			i-cache-size = <32768>;
>  			clocks = <&clockgen 1 0>;
>  			next-level-cache = <&L2_1>;
>  			fsl,portid-mapping = <0x80000000>;
> @@ -88,6 +92,10 @@ cpu0: PowerPC,e6500@0 {
>  		cpu1: PowerPC,e6500@2 {
>  			device_type = "cpu";
>  			reg = <2 3>;
> +			d-cache-line-size = <64>;
> +			i-cache-line-size = <64>;
> +			d-cache-size = <32768>;
> +			i-cache-size = <32768>;
>  			clocks = <&clockgen 1 0>;
>  			next-level-cache = <&L2_1>;
>  			fsl,portid-mapping = <0x80000000>;
> @@ -95,6 +103,10 @@ cpu1: PowerPC,e6500@2 {
>  		cpu2: PowerPC,e6500@4 {
>  			device_type = "cpu";
>  			reg = <4 5>;
> +			d-cache-line-size = <64>;
> +			i-cache-line-size = <64>;
> +			d-cache-size = <32768>;
> +			i-cache-size = <32768>;
>  			clocks = <&clockgen 1 0>;
>  			next-level-cache = <&L2_1>;
>  			fsl,portid-mapping = <0x80000000>;
> @@ -102,6 +114,10 @@ cpu2: PowerPC,e6500@4 {
>  		cpu3: PowerPC,e6500@6 {
>  			device_type = "cpu";
>  			reg = <6 7>;
> +			d-cache-line-size = <64>;
> +			i-cache-line-size = <64>;
> +			d-cache-size = <32768>;
> +			i-cache-size = <32768>;
>  			clocks = <&clockgen 1 0>;
>  			next-level-cache = <&L2_1>;
>  			fsl,portid-mapping = <0x80000000>;
> -- 
> 2.25.1
