Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 36AD29496E8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Aug 2024 19:33:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YSRolU2z;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WdgQ50NFMz3cyY
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2024 03:33:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YSRolU2z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WdgPQ3bxcz3bnL
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Aug 2024 03:32:58 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id BB43DCE0AD8;
	Tue,  6 Aug 2024 17:32:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B09DDC32786;
	Tue,  6 Aug 2024 17:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722965574;
	bh=iYGx1LftSjngQ6YEqIPXIbwfGvux/WnzXNe7WghOVlk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YSRolU2zH2EXyoEKYdK4iTJWVOBDCHAhiP61kWYWoYXFAWuAiAAE1gfUqUKRTL3E4
	 BD+Z8W+nxXi5TFO4JKA8IHcSMO1+Fm9AGcGhFMOphWpa4s6QkgkE/xDmMd9Wxdn0+a
	 //FemNjLpovl+nKy9kIVH7zhzA7Wqna2fnxm9c9/gvaXK1UsI6rOy/ILtRjEXpwUm4
	 0E1g+WCkrznvUD5LxLfL84pcfs3KxDYrrKb72k3AQ4TFMqnn3/mJWE8IEeDRcNz21D
	 jSx+G4jlBfnVtyZ1krabkEzG3z72jcldCz2/d5FlUE1oUAw6jrJC7acuFc0TuWA4B7
	 3dfp29BjPG2sw==
Date: Tue, 6 Aug 2024 11:32:53 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v4 1/1] dt-bindings: soc: fsl: Convert rcpm to yaml format
Message-ID: <172296557246.1846723.1942293394651649986.robh@kernel.org>
References: <20240802152219.2740137-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240802152219.2740137-1-Frank.Li@nxp.com>
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
Cc: linux-rtc@vger.kernel.org, imx@lists.linux.dev, conor+dt@kernel.org, alexandre.belloni@bootlin.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, christophe.leroy@csgroup.eu, krzk+dt@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On Fri, 02 Aug 2024 11:22:19 -0400, Frank Li wrote:
> Convert dt-binding rcpm from txt to yaml format.
> Add fsl,ls1028a-rcpm compatible string.
> 
> Additional changes:
> - Add missed compatible string fsl,<chip>-rcpm.
> - Remove map fsl,<chip>-rcpm to fsl,qoriq-rcpm-<version>.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Change from v3 to v4
> - Add missed fsl,ls1088a-rcpm, fsl,ls208xa-rcpm, fsl,lx2160a-rcpm
> 
> Chagne from v2 to v3
> - fallback use const
> - order as fallback compatible string
> - remove minItems for compatible string
> - Fix typo 1045a
> 
> Change from v1 to v2
> - add missed compatible string
> - Remove compatible string map table
> - use oneof Item to align compatible string map table
> ---
>  .../bindings/rtc/fsl,ls-ftm-alarm.yaml        |  2 +-
>  .../devicetree/bindings/soc/fsl/fsl,rcpm.yaml | 96 +++++++++++++++++++
>  .../devicetree/bindings/soc/fsl/rcpm.txt      | 69 -------------
>  3 files changed, 97 insertions(+), 70 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/soc/fsl/fsl,rcpm.yaml
>  delete mode 100644 Documentation/devicetree/bindings/soc/fsl/rcpm.txt
> 

Applied, thanks!

