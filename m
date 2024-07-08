Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D961392A6C3
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jul 2024 18:05:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Zv64vPdr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WHpqN2Tglz30Wl
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2024 02:05:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Zv64vPdr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WHpph0Dz4z2ysd
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jul 2024 02:04:27 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 23040CE0E5D;
	Mon,  8 Jul 2024 16:04:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D915C116B1;
	Mon,  8 Jul 2024 16:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720454663;
	bh=B+wgdQOGBCJumVIrWn6svGrdoWlDkgcqo510Z+SmmF4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zv64vPdrwmX3RZ/8XTQyyyazgJhxqmXoVpgxynC7Ym2Gx2kfPGByiTvjznRhIyWjU
	 Yw78ddCOk9aQNqKbk9ErcZh6E36/AQGcPsKsDtRRXic4NuJ41yirYE3ij0OOsXHIh6
	 G2FbBQxAbTdHadfYYJQ0mZIyxKKiGkzM2HTOWFL9swaxQkpu+2lwT5q3BIjH9q/JcR
	 sBm7fdCCoXdZqX74/js6i58mE6060hAT8ZgCR2UCqHMLvZByzZeqQ8jQsD+U0g/xJf
	 MSb0oFXcaEgbirQZKm8hvDmNRFCjwN1xom6zl/mNfI26he0kUX0p5ZWhphdZKirnAv
	 2zDpv6wAZBEcw==
Date: Mon, 8 Jul 2024 10:04:21 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 1/2] dt-bindings: soc: fsl: cpm_qe: convert to yaml format
Message-ID: <172045465945.3262448.18446369145755550940.robh@kernel.org>
References: <20240703-ls_qe_warning-v1-0-7fe4af5b0bb0@nxp.com>
 <20240703-ls_qe_warning-v1-1-7fe4af5b0bb0@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240703-ls_qe_warning-v1-1-7fe4af5b0bb0@nxp.com>
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
Cc: imx@lists.linux.dev, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On Wed, 03 Jul 2024 12:49:39 -0400, Frank Li wrote:
> Convert binding doc qe.txt to yaml format. Split it to
> fsl,qe-firmware.yaml, fsl,qe-ic.yaml, fsl,qe-muram.yaml, fsl,qe-si.yaml
> fsl,qe-siram.yaml, fsl,qe.yaml.
> 
> Additional Changes:
> - Fix error in example.
> - Change to low case for hex value.
> - Remove fsl,qe-num-riscs and fsl,qe-snums from required list.
> - Add #address-cell and #size-cell.
> - Add interrupts description for qe-ic.
> - Add compatible string fsl,ls1043-qe-si for fsl,qe-si.yaml
> - Add compatible string fsl,ls1043-qe-siram for fsl,qe-siram.yaml
> - Add child node for fsl,qe.yaml
> 
> Fix below warning:
> arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: /soc/uqe@2400000/muram@10000: failed to match any schema with compatible: ['fsl,qe-muram', 'fsl,cpm-muram']
> arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: /soc/uqe@2400000/muram@10000: failed to match any schema with compatible: ['fsl,qe-muram', 'fsl,cpm-muram']
> arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: /soc/uqe@2400000/muram@10000/data-only@0: failed to match any schema with compatible: ['fsl,qe-muram-data', 'fsl,cpm-muram-data']
> arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: /soc/uqe@2400000: failed to match any schema with compatible: ['fsl,qe', 'simple-bus']
> arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: /soc/uqe@2400000/muram@10000/data-only@0: failed to match any schema with compatible: ['fsl,qe-muram-data', 'fsl,cpm-muram-data']
> arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: /soc/uqe@2400000/qeic@80: failed to match any schema with compatible: ['fsl,qe-ic']
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../bindings/soc/fsl/cpm_qe/fsl,qe-firmware.yaml   |  48 ++++++
>  .../bindings/soc/fsl/cpm_qe/fsl,qe-ic.yaml         |  47 ++++++
>  .../bindings/soc/fsl/cpm_qe/fsl,qe-muram.yaml      |  71 ++++++++
>  .../bindings/soc/fsl/cpm_qe/fsl,qe-si.yaml         |  40 +++++
>  .../bindings/soc/fsl/cpm_qe/fsl,qe-siram.yaml      |  39 +++++
>  .../devicetree/bindings/soc/fsl/cpm_qe/fsl,qe.yaml | 148 +++++++++++++++++
>  .../devicetree/bindings/soc/fsl/cpm_qe/qe.txt      | 178 ---------------------
>  7 files changed, 393 insertions(+), 178 deletions(-)
> 

Applied, thanks!

