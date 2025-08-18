Return-Path: <linuxppc-dev+bounces-11107-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA97CB2B251
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Aug 2025 22:25:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c5PN06tMZz3chL;
	Tue, 19 Aug 2025 06:25:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755548704;
	cv=none; b=TP0rRYAkqNi6DUrapneuzk5kqGseNotLLXBbJCXUKwX2Zz13Z8fbxBln8hNJ2YV5WxK7iAS/BWOlWtJDF6GkpEIKddtZHs6LZssvorLKWazwxR+Zy+yfKqLDut+pV77tAIs8qMucjiMlI4yKJE8xwTb0aYCNlVYvqWrj5AOIlvbpzDfg3jTOt6hSRZRD2zG4r/imz9RYjmkDspLoj7sy/qA7gMC/9Z6Hm8XradRjKOB3VLvzY4wVTP0Zql26Wjq1s8K478UA2xdO6+9B6gLZ6apa49siE2mdgYfs99w2KMj7Ef709KrAFVGpTreXPwhDyc3TC/Zsp2bsLS75N0QpTw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755548704; c=relaxed/relaxed;
	bh=qMTwWo2tpRt6tDLmvE1xF9OpcaykN/9Fdm0DYL6pKLw=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=Y9OI/4r51VcWFTX7Sw1Ip5qIGfV0DZAjcJULbUh8l3+ADptmWfUFVrFIShEgbfZ/vAqcOHw/xiWdnuTfSQ6TfBNSEhYXFrJer1zanERfT/Wl0kylQ6rMjX/YsJPjgCwoEe1BZw5a1dzW9xnjbXBAADcVP/jaadXiUAhQSJENC7Plds7n2OOTMKGP44rGJDRM0g5cfPNK85vARWtuWlmdMVkD04GYQ1VE87/JxkLgDmoLQYhsx/CggPa4rWa3qqHLSeJy7Mlwbve5dBJX+I0ZMHcO/3ehRWTo123P6+N0zonjqGEKyOHq8f+5+BVsp3lA7GI7Y6Jw7G/c2GNvILla0A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ic8tObN8; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ic8tObN8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c5PMz6TrLz3cgl
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Aug 2025 06:25:03 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0B22D601FF;
	Mon, 18 Aug 2025 20:25:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8369DC4CEEB;
	Mon, 18 Aug 2025 20:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755548700;
	bh=DWORNPSoaH+MkjUCn75Qd2KiRx9On7Gotf+b7ngssYs=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=ic8tObN8DjU6IWxKiOeUkHXlkzm6Ho162M8Ov3UaeqzH7pN/YMUQuwGmAuFx47ius
	 MdA34L14QpFsZUs0iM3927gfqeD5/OwbmXbmADzTqvPTVUhqeniEQdqJkfBxHM+0yg
	 5e/+nxMtA8SxUGZ9YQwSyOk/r7QlfQTMtlQwRtxIXDCImfQ/GQq1LXZ/w/4ShPCFKQ
	 APvr+K1EZSLsflkmA4kop8gVAnr0ol6ed1pbWwh1JdxLppWSA6UZ/6fYBoKvBEYFOG
	 UJuwBDZqBqgBAwFk3VLgWTX+vIn8FA+oOmyNXxzmA6bca0NeuEWNjfTIi06cPAIwJP
	 qcpCS8jBN+WXA==
Date: Mon, 18 Aug 2025 15:24:59 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: imx@lists.linux.dev, Conor Dooley <conor+dt@kernel.org>, 
 linuxppc-dev@lists.ozlabs.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
To: Frank Li <Frank.Li@nxp.com>
In-Reply-To: <20250818183427.3601986-1-Frank.Li@nxp.com>
References: <20250818183427.3601986-1-Frank.Li@nxp.com>
Message-Id: <175554869942.1999698.5388783109628696157.robh@kernel.org>
Subject: Re: [RESEND v2 1/1] dt-bindings: soc: add vf610 reboot syscon
 controller
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On Mon, 18 Aug 2025 14:34:26 -0400, Frank Li wrote:
> Add vf610 reboot controller, which used to reboot whole system. Fix below
> CHECK_DTB warnings:
> 
> arch/arm/boot/dts/nxp/vf/vf610-bk4.dtb: /soc/bus@40000000/src@4006e000:
>     failed to match any schema with compatible: ['fsl,vf610-src', 'syscon']
> 
> IC reference manual call it as system reset controller(SRC), but it is not
> module as linux reset controller, which used to reset individual device.
> SRC work as reboot controller, which reboot whole system. It provides a
> syscon interface to syscon-reboot.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Change in v2
> - change description to avoid confuse about reset controller.
> - it is legacy device, more than 10 year. So try keep existed dts as it.
> ---
>  .../bindings/soc/fsl/fsl,vf610-src.yaml       | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/fsl/fsl,vf610-src.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/fsl/fsl,vf610-src.yaml: $id: 'http://devicetree.org/schemas//soc/fsl/fsl,vf610-src.yaml#' does not match 'http://devicetree.org/schemas(/[^/ ]+)+\\.yaml#'
	from schema $id: http://devicetree.org/meta-schemas/base.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250818183427.3601986-1-Frank.Li@nxp.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


