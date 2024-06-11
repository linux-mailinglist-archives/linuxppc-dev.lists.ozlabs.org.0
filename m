Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B63D903A21
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2024 13:32:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VAPR5LKt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vz63F3MpKz3dBs
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2024 21:32:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VAPR5LKt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vz62Y3Dzcz3cYF
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2024 21:31:49 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 083D8CE1ADA;
	Tue, 11 Jun 2024 11:31:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D952C2BD10;
	Tue, 11 Jun 2024 11:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718105503;
	bh=OnCmFVAhBCd6GUVnj8XGIwoQY2qJ3+hZAJEHD8rdoAw=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=VAPR5LKtdZJ6ltEsaabGN+ZyGfFgpu+JS10QeGq3FnDRMjJ2/hX3jobTHRnsIn1RT
	 vPf5p22bqGFbojZ9HcMlb1sxHIag/WuW1y7fk58G0YX7HaBTw+BX1yvq96yE7Bc4Hl
	 SKizL1thSGFnmhmiktsJ/NaoWPiCCjopEGaVm+sxBTxX59fQkCp2vdH2YH2sDfQ18J
	 lHdh3C8qQfbvUL6VWpNnZW9AF636vlKCHwWvuKVOOpg9ob8f3ilfE4EJ8OZWbj7RRU
	 +NfW1ubhfQMgnpZmj0OSbzoPwMAmUpUtOTPxgS7G8SfF9Z+rcWA2DIblkXjZvyrU/g
	 5xneH846+zizw==
Date: Tue, 11 Jun 2024 05:31:42 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
In-Reply-To: <20240611094810.27475-2-piotr.wojtaszczyk@timesys.com>
References: <[PATCH] ASoC: fsl: Add i2s and pcm drivers for LPC32xx CPUs>
 <20240611094810.27475-1-piotr.wojtaszczyk@timesys.com>
 <20240611094810.27475-2-piotr.wojtaszczyk@timesys.com>
Message-Id: <171810550202.1047088.17292010858616719651.robh@kernel.org>
Subject: Re: [Patch v2 2/2] ASoC: dt-bindings: lpc32xx: Add lpc32xx i2s DT
 binding
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, Vladimir Zapolskiy <vz@mleia.com>, Mark Brown <broonie@kernel.org>, Chancel Liu <chancel.liu@nxp.com>, Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On Tue, 11 Jun 2024 11:47:52 +0200, Piotr Wojtaszczyk wrote:
> Add nxp,lpc3220-i2s DT binding documentation.
> 
> Signed-off-by: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
> ---
> Changes for v2:
> - Added maintainers field
> - Dropped clock-names
> - Dropped unused unneded interrupts field
> 
>  .../bindings/sound/nxp,lpc3220-i2s.yaml       | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/nxp,lpc3220-i2s.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/nxp,lpc3220-i2s.example.dtb: i2s@20094000: 'clock-names' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/sound/nxp,lpc3220-i2s.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240611094810.27475-2-piotr.wojtaszczyk@timesys.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

