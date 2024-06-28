Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56EAE91C6AE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2024 21:34:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SW7PCzVX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W9lxz5pWgz3c5q
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jun 2024 05:34:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SW7PCzVX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W9lxH2lLWz3cYM
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Jun 2024 05:34:11 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id DD954CE3C55;
	Fri, 28 Jun 2024 19:34:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0591C116B1;
	Fri, 28 Jun 2024 19:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719603246;
	bh=yjCUTIYEfShWpFf89z1mVEG427+uOb9/A8IYTG9e/NM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SW7PCzVX3hluUKlCIYLBXkd409r8ZtagalI+cC5oRATkdJDzhkspjuEdvljwoAKC3
	 vQJ6YP+YPTnI5dsUIFpD1ZVwU48sbb7jgwrNVxoffS6u43IRf2AbrH/u2cWXBSnFcH
	 rsh1ICVvPDoNrqHLF5AA1sB0NAkCq78Xvh5+lXIBJ/LHOlwyS8HS2NbM+5NVU3sB2H
	 sk17EFxOOkmgv1h6WKuFOcAdyiGcaMsE0liX1Eu9dh+jHH4ZTMo93ZnOuGthcH70E2
	 cmC8ybSf6k7OOUusaGff9Nv2//61BM93dz8t39YZkNywe9Uo843EKpWeYM5nnj9j3k
	 hTjcmmuNRi43A==
Date: Fri, 28 Jun 2024 13:34:04 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v2 1/1] dt-bindings: soc: fsl: Convert q(b)man-* to yaml
 format
Message-ID: <171960324209.86780.5210954798222723537.robh@kernel.org>
References: <20240626193753.2088926-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240626193753.2088926-1-Frank.Li@nxp.com>
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
Cc: imx@lists.linux.dev, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, krzk+dt@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On Wed, 26 Jun 2024 15:37:53 -0400, Frank Li wrote:
> Convert qman, bman, qman-portals, bman-portals to yaml format.
> 
> Additional Change for fsl,q(b)man-portal:
> - Only keep one example.
> - Add fsl,qman-channel-id property.
> - Use interrupt type macro.
> - Remove top level qman-portals@ff4200000 at example.
> 
> Additional change for fsl,q(b)man:
> - Fixed example error.
> - Remove redundent part, only keep fsl,qman node.
> - Change memory-regions to memory-region.
> - fsl,q(b)man-portals is not required property
> 
> Additional change for fsl,qman-fqd.yaml:
> - Fixed example error.
> - Only keep one example.
> - Ref to reserve-memory.yaml
> - Merge fsl,bman reserver memory part
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Change from v1 to v2
> - fix typo chang
> - fix typo porta
> - Add | for reg description
> - wrap to 80 for reg descritption
> - memory-region set maxItems: 2
> - fix regex parttern
> - drop  See clock-bindings.txt
> - "see reserved-memory.yaml" change to
> "see reserved-memory/reserved-memory.yaml in dtschema project"
> 
> - A strange thing in fsl,qman-fqd.yaml, if example compatible string
> change to fsl,qman-fqd, dt_binding_check report below error.
> 	qman-fqd: False schema does not allow {'compatible': ['fsl,qman-fqd'], 'size': [[4194304]], 'alignment': [[4194304]], 'no-map': True, '$nodename': ['qman-fqd']}
> 
> but I replace "fsl,qman-fqd" with "abc", it pass check.
> ---
>  .../bindings/soc/fsl/bman-portals.txt         |  56 ------
>  .../devicetree/bindings/soc/fsl/bman.txt      | 137 -------------
>  .../bindings/soc/fsl/fsl,bman-portal.yaml     |  52 +++++
>  .../devicetree/bindings/soc/fsl/fsl,bman.yaml |  83 ++++++++
>  .../bindings/soc/fsl/fsl,qman-fqd.yaml        |  69 +++++++
>  .../bindings/soc/fsl/fsl,qman-portal.yaml     | 110 +++++++++++
>  .../devicetree/bindings/soc/fsl/fsl,qman.yaml |  93 +++++++++
>  .../bindings/soc/fsl/qman-portals.txt         | 134 -------------
>  .../devicetree/bindings/soc/fsl/qman.txt      | 187 ------------------
>  9 files changed, 407 insertions(+), 514 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/soc/fsl/bman-portals.txt
>  delete mode 100644 Documentation/devicetree/bindings/soc/fsl/bman.txt
>  create mode 100644 Documentation/devicetree/bindings/soc/fsl/fsl,bman-portal.yaml
>  create mode 100644 Documentation/devicetree/bindings/soc/fsl/fsl,bman.yaml
>  create mode 100644 Documentation/devicetree/bindings/soc/fsl/fsl,qman-fqd.yaml
>  create mode 100644 Documentation/devicetree/bindings/soc/fsl/fsl,qman-portal.yaml
>  create mode 100644 Documentation/devicetree/bindings/soc/fsl/fsl,qman.yaml
>  delete mode 100644 Documentation/devicetree/bindings/soc/fsl/qman-portals.txt
>  delete mode 100644 Documentation/devicetree/bindings/soc/fsl/qman.txt
> 

Applied, thanks!

