Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE1492A726
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jul 2024 18:18:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YRh2TeNj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WHq724Ddlz3cVt
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2024 02:18:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YRh2TeNj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WHq6M5v5Qz30WC
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jul 2024 02:18:03 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 8A2E2CE0E6C;
	Mon,  8 Jul 2024 16:18:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84310C116B1;
	Mon,  8 Jul 2024 16:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720455481;
	bh=QoaVgsZD8hy36oHKbzcku1hqiZ0FKuot0Efhu3zp1+U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YRh2TeNjZr2EOLI59bZofrPETHvNYt49E+lp7HQCFNsGyN5P9nWocMv/CXnrpvznf
	 qoBYIYPn9mVH1Dms0kXDUWqFSG/+KzWIE9yE1y5OXQsSk5DsWiyoW3jBcEu2saAglP
	 T3GOwIsSkhWgRqRzTS/7SbjHfx7ncJ6o78yS/0Lstmp5hod0hYY0F3zgsULLf0iHy0
	 RfYq2zIHEf/4r+kLRzXKVH/g2vK0ARpswtbrEJ7p4pz2fDa2rJOySzd0br8NNQkxjZ
	 jSRNUPqG1i9jndyTBHFRpTZO6ryNe1SVRH4YuVbF3Juj3plaL4dgeJpiU+NOLhTeQQ
	 4s+tj5GYsz4mg==
Date: Mon, 8 Jul 2024 10:18:00 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 1/2] dt-bindings: soc: fsl: Add fsl,ls1028a-reset for
 reset syscon node
Message-ID: <172045547768.3343964.18121524325838710438.robh@kernel.org>
References: <20240703-ls_reset_syscon-v1-0-338f41b3902d@nxp.com>
 <20240703-ls_reset_syscon-v1-1-338f41b3902d@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240703-ls_reset_syscon-v1-1-338f41b3902d@nxp.com>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On Wed, 03 Jul 2024 14:08:11 -0400, Frank Li wrote:
> ls1028a has a reset module that includes reboot, reset control word, and
> service processor control.
> 
> Add platform specific compatible string to fix the below warning.
> 
> syscon@1e60000: compatible: 'anyOf' conditional failed, one must be fixed:
>         ['syscon'] is too short
>         'syscon' is not one of ['al,alpine-sysfabric-service', ...]
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../bindings/soc/fsl/fsl,ls1028a-reset.yaml        | 56 ++++++++++++++++++++++
>  1 file changed, 56 insertions(+)
> 

Applied, thanks!

