Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39EE1949793
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Aug 2024 20:29:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cAfd8qjd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WdhfN1GPmz3cJl
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2024 04:29:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cAfd8qjd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wdhdj46V0z30Wd
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Aug 2024 04:28:41 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id AF6F8CE0B2C;
	Tue,  6 Aug 2024 18:28:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDE84C32786;
	Tue,  6 Aug 2024 18:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722968918;
	bh=RcyUbLmkg3x/ulEnE34/+p9Y9xgybXLeAECghUBIBCY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cAfd8qjdKq3DCfRyuOXffBVGhfLx3GlKu++u5b/qavxcg7qaJsO9ImhjxycrlqXi2
	 tnijsjH05oM6F6Rxo0bd6fWP5Fon1R2K6QSZeIsUocPWpFMGlb1iw/7V3WBTkgLXE5
	 PsUMmuvhdJynuPKJrCdxYBsh3PqytkWzGARSrX8F/5SrpHZBWX6IaxFJ/3VxKV2D7P
	 fTZVG5okIDrU3O5bmiv0eC91LpBXi+laSYR6zIAi/dvwbk4ca0FJ5wHN6+Fiw6yUgw
	 c9Lfvx7xAP30EEGMmj7RK9Fxdes6ghtxACF1QJCn5NbSS7jr7eQwLDPGEEzT/pYSn0
	 /2HeEXodIEeyg==
Date: Tue, 6 Aug 2024 12:28:37 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v2 1/1] dt-bindings: soc: fsl: add missed compatible
 string fsl,ls*-isc
Message-ID: <172296891618.2031313.14197833960690004919.robh@kernel.org>
References: <20240806162121.2996442-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240806162121.2996442-1-Frank.Li@nxp.com>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev, Shawn Guo <shawnguo@kernel.org>, linux-kernel@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On Tue, 06 Aug 2024 12:21:21 -0400, Frank Li wrote:
> Add compatible string, fsl,ls1088a-isc, fsl,ls2080a-isc, fsl,lx2160a-isc.
> Fix the below warning:
> arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dtb: /soc/syscon@1f70000: failed to match any schema with compatible: ['fsl,ls2080a-isc', 'syscon']
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Change from v1 to v2
> - fixed typo lx2046a with lx2160a
> ---
>  .../devicetree/bindings/soc/fsl/fsl,layerscape-scfg.yaml       | 3 +++
>  1 file changed, 3 insertions(+)
> 

Applied, thanks!

