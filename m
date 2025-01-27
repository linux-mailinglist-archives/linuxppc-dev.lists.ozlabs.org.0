Return-Path: <linuxppc-dev+bounces-5578-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BC787A1D010
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jan 2025 05:23:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YhFfc3QLkz302b;
	Mon, 27 Jan 2025 15:23:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737951832;
	cv=none; b=J6md5YM0q/qxyWvvNTsi5U9y3OouyO4b87H/jZSjTp663M/xc4LOljod+rTirITb8yBkxn6aR8wvkgly5fYzLGfwYJJhKncVBsn9UgFPQrymZh94fGT9/hB4opl4SVIouWZLg/6RnFouwnp/Cct2WVQ7sdQoPI7ctx3PsJ686VQzf7x+aI31KJK+Xuj6aPOKDDj+v3p/EIb60YVvn6sJdsDKIJQbJONDNJfqe8LkzlTy3iaUTUubXIFeFm+OuqVCMeL5MSQQaypFDNC/+N85g+ZqZsCy8Img1Y5WIxLgbtkACRoY/j96bF5aI2knv2LOqlxqfOuOAtRPk3tocY4hXA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737951832; c=relaxed/relaxed;
	bh=/iLPeeTCoZFzXqdg9kWWyGdnpjHVrKmFvE7GNsT/MhI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UhBHB9LyWXspLgWFpTCOKvUczQkgb5oma6onWc0eiG7fLSAtrH64QCFXTFs/Ibz0HgDvsReT6gfKOPOEW6NFZFHTBOvPLgACT5vgqeSEABjK8RiVnuu3iwNwbmg3RFOdAw18N/YZYYfrp1FTM960paP5PvMYj3NMN0Vclp6RN/ZOjMVA1/vkBSeeyFkWuoUJNdt6b40BHM2LntGg5BpfnETL/jxQCXdFz1iEjD4q/e/TtVxD33/d2Rz+IWmZN+AK5Byzkrc/6LOd+5JLigZUtww4YxWT4ba66lisZFPto1yjVpauBggU5EK41chf4VvQmiB6DEfXUsMXvOyvzZ4WMQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EcrPn4L2; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EcrPn4L2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YhFfb25dRz3028
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jan 2025 15:23:51 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9D16D5C062D;
	Mon, 27 Jan 2025 04:23:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43B73C4CED2;
	Mon, 27 Jan 2025 04:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737951828;
	bh=miZrlNghDbxyTZzrKu3L8ab88Zt9rpvC1n4KYw977rU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EcrPn4L2165qqoi43IdQ1t9rM+v8XNG69QGvAvJ3iSoflVUZeAXt69KcSbRo686Be
	 ZkILmYE9nHp+zy6B4DbBnuZE5k39PftQDd4SkMfrhpXXVZM8z1mxUnSg8Uv3eHZ9Ep
	 FQmu6JtSGaKqI8JKmU99H8KpzLOMkxDnYJ5HsMCA2sfHQJdWcaN+8lG/KspJQIS+hP
	 Y5JxKllSRH0zn13yviPft9eA8GiVP/vlYDeI1PaK3ReKqgfyY2wRvfOJAaES98tuBK
	 lEgCNpGrS2XcJOskwkSyowom86AbjkrNxyoNb1AcXeRpPaKW+HFKFyq15Uo9Yl0+QE
	 I6vuL2F2uj0zA==
Date: Sun, 26 Jan 2025 22:23:47 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: =?iso-8859-1?Q?J=2E_Neusch=E4fer?= <j.ne@posteo.net>
Cc: linux-spi@vger.kernel.org,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	devicetree@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Scott Wood <oss@buserror.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Naveen N Rao <naveen@kernel.org>, linuxppc-dev@lists.ozlabs.org,
	Conor Dooley <conor+dt@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Michael Ellerman <mpe@ellerman.id.au>, linux-crypto@vger.kernel.org,
	Niklas Cassel <cassel@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	"David S. Miller" <davem@davemloft.net>, linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
	linux-watchdog@vger.kernel.org, Lee Jones <lee@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	=?iso-8859-1?Q?J=2E_Neusch=E4fer?= <j.neuschaefer@gmx.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-mtd@lists.infradead.org, dmaengine@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mark Brown <broonie@kernel.org>, linux-pci@vger.kernel.org,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Damien Le Moal <dlemoal@kernel.org>
Subject: Re: [PATCH 1/9] dt-bindings: powerpc: Add binding for Freescale/NXP
 MPC83xx SoCs
Message-ID: <173795182667.3090530.5101657106637409770.robh@kernel.org>
References: <20250126-ppcyaml-v1-0-50649f51c3dd@posteo.net>
 <20250126-ppcyaml-v1-1-50649f51c3dd@posteo.net>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250126-ppcyaml-v1-1-50649f51c3dd@posteo.net>
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org


On Sun, 26 Jan 2025 19:58:56 +0100, J. Neuschäfer wrote:
> Add a new binding for MPC83xx platforms, describing the board compatible
> strings used in currently existing device trees.
> 
> Note that the SoC bus is called immr@... in many existing devicetrees,
> but this contradicts the simple-bus binding.
> 
> Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
> ---
>  .../bindings/powerpc/fsl/fsl,mpc83xx.yaml          | 67 ++++++++++++++++++++++
>  1 file changed, 67 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


