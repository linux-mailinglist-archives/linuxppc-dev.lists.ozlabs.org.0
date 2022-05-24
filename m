Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A060D53263F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 11:20:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6pZP4DcZz3bk9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 19:20:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HUS4ndvo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=HUS4ndvo; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6pYq5Llmz2yYd
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 May 2022 19:19:43 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E4E6261645;
 Tue, 24 May 2022 09:19:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C40DC385AA;
 Tue, 24 May 2022 09:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653383981;
 bh=CQoTVzWSYGPxn/PhSbq4IWD9fRMZJsmF2LJ5awP5PHE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HUS4ndvoSW4jDh9uLc2sMoq07gNQKuNlkXCVuvpm70SYFzpoFAVIw9+8bFTCS5nN4
 c2Vr7C0pSA+Z0ajJa7F653EIvX7VeAjvqA4Jd/0BPBXEQ8KgnsnDuK2tJDGkHkIhb6
 l848JIxyN0vasK+LwzRIdyhI5RwI42zCrF6xqRSyiyabinDErgtRRmPUS9yCpBHWca
 b68Et/UjPcwUZ9scNm9mVcKNByCcGx1XbhI/vGHTMWVWeTV6nbJhyo5nY2ZyMkxFHa
 sFYOVTSREW5+Scr5L4KD+ZL6Zxv6mU/VnGQkeNV1t5MOZ3lJpAqRcNcpG053nGMoXC
 e9WU0cYJ1UVcA==
Received: by pali.im (Postfix)
 id BF8C49ED; Tue, 24 May 2022 11:19:38 +0200 (CEST)
Date: Tue, 24 May 2022 11:19:38 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH] powerpc/85xx: P2020: Add fsl,mpc8548-pmc node
Message-ID: <20220524091938.myq5pf4imaczgbqa@pali>
References: <20220506203621.26314-1-pali@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220506203621.26314-1-pali@kernel.org>
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
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Friday 06 May 2022 22:36:21 Pali Rohár wrote:
> P2020 also contains Power Management Controller and their registers at
> offset 0xe0070 compatible with mpc8548. So add PMC node into DTS include
> file fsl/p2020si-post.dtsi

PING?

> Signed-off-by: Pali Rohár <pali@kernel.org>
> ---
>  arch/powerpc/boot/dts/fsl/p2020si-post.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/powerpc/boot/dts/fsl/p2020si-post.dtsi b/arch/powerpc/boot/dts/fsl/p2020si-post.dtsi
> index 6345629524fe..81b9ab2119be 100644
> --- a/arch/powerpc/boot/dts/fsl/p2020si-post.dtsi
> +++ b/arch/powerpc/boot/dts/fsl/p2020si-post.dtsi
> @@ -201,4 +201,9 @@
>  		reg = <0xe0000 0x1000>;
>  		fsl,has-rstcr;
>  	};
> +
> +	pmc: power@e0070 {
> +		compatible = "fsl,mpc8548-pmc";
> +		reg = <0xe0070 0x20>;
> +	};
>  };
> -- 
> 2.20.1
> 
