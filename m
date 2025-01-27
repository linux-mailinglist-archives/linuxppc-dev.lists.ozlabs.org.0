Return-Path: <linuxppc-dev+bounces-5581-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E08AA1D052
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jan 2025 05:42:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YhG3d2dnZz3045;
	Mon, 27 Jan 2025 15:42:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737952925;
	cv=none; b=E3nV3HL60XKWyc7e2lXR1/2sXE1/ek9uO7CynHukkjNfWiwiPOuiyW6qxiC7fiSbIPFeghUaHPTviVHljYTkmSO35daohjRq84WsBMoxQpmfKplOjRrzEikNKHIgI6uMBtcb2pJzwDStYecG2uMnY3Z6Nf5qNWs/06AIREi2LEuLhR0rNs6q/Oe9J8dVCdffq+Dy6uxXy66R2T2vG/W1VEMg3ldf8PSzVc3b7S16RfaoDzhaN2YuRSCKeFXNquDmplvJp2454VIpKEQrLz2Fp7nvG0ZV9ZmsJvIbzvD7pXScjCuMqWQnTaMIxpNEsMk/t/iu5vxflCVgVqbtvlukRw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737952925; c=relaxed/relaxed;
	bh=FHgNMQdwWDQfQxUULeigtKhos2vSjbPGoOnxNDarM+0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PlV4RirkaUOH2jpqhwua50iuFgBDOK+s5+5cvZ57z0DeMZjn60qEVGxBa3wa4ZEGIuGQNOj1m658rntYKXGvlyBqugNK1JP0yE/7MDgbzSDCKGp3tXS+tZIEcyK4Vr3gyaFHVIMI5Tmqj8a94Erx7MO7AQBCeD/uKtJ/w9E9z9cvIlhyNURZd6t0+RGmGtJKVAsgBIIHf5B0C95G7kzWQwxsGnqN4WIyqjqGURVAXx+oAOQXDr44MvUou0E7VGS353Z4wHrN05kFLNtBwDWCp4KNKk/ogTqT0hqLbbKGKKlb579Ymwa/z0rehs9AFe/R49nNutJwUp1n7SoU+JjtLA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qrYmahB0; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qrYmahB0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YhG3c5Xfqz301B
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jan 2025 15:42:04 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C178B5C422A;
	Mon, 27 Jan 2025 04:41:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D1E1C4CED2;
	Mon, 27 Jan 2025 04:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737952922;
	bh=7RQPPYx18JlZ50CfItwadjRZng2k8lf+GHrJCgW0IU0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qrYmahB0F636L75RgPUrLxwR7KwywZjht6ZMLJWlp1dFhE7Jihu77/xMPP9kRdhpS
	 KHPAsLOQg2T3D/73CbIvksNqop9rM8onqD6VbxwZMVTaXn68kJfRnvoVgVmgbL+sx+
	 K6PY84jZ9c/YVC7vVjOSKnrLa2veVumMr2wasfmvGEE65fgjd/9YZ/qLhQaWhrPJX8
	 PS83Z4BeE7D2PMoZuYswAuZkAJtnNkhhReImAuPUwU30XHAlbwLMU2hJyvPBUehjk7
	 XAHMtm0Sn36T4yaaksKIikH1W83WXXS05LgjjPEYkntwQ6QjEM2l9YFbrfWVXRZp6d
	 llzr4d/cYd1Jg==
Date: Sun, 26 Jan 2025 22:42:01 -0600
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?J=2E_Neusch=E4fer?= <j.ne@posteo.net>
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	Scott Wood <oss@buserror.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>, Lee Jones <lee@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	=?iso-8859-1?Q?J=2E_Neusch=E4fer?= <j.neuschaefer@gmx.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Mark Brown <broonie@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
	linux-ide@vger.kernel.org, linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH 4/9] dt-bindings: mfd: Convert fsl,mcu-mpc8349emitx
 binding to YAML
Message-ID: <20250127044201.GC3106458-robh@kernel.org>
References: <20250126-ppcyaml-v1-0-50649f51c3dd@posteo.net>
 <20250126-ppcyaml-v1-4-50649f51c3dd@posteo.net>
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
In-Reply-To: <20250126-ppcyaml-v1-4-50649f51c3dd@posteo.net>
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sun, Jan 26, 2025 at 07:58:59PM +0100, J. Neuschäfer wrote:
> Convert mcu-mpc8349emitx.txt to YAML and list the compatible strings
> currently in use.
> 
> Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
> ---
>  .../bindings/mfd/fsl,mcu-mpc8349emitx.yaml         | 53 ++++++++++++++++++++++
>  .../bindings/powerpc/fsl/mcu-mpc8349emitx.txt      | 17 -------
>  2 files changed, 53 insertions(+), 17 deletions(-)

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

