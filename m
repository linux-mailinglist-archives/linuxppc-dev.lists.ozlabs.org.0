Return-Path: <linuxppc-dev+bounces-6004-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D02A2DF5F
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Feb 2025 18:28:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YrZS56txMz2xk1;
	Mon, 10 Feb 2025 04:28:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.67.36.66
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739122117;
	cv=none; b=eqB/6z/IuXIQC/SkfAHak16flRFbzq/hCiQ1Y9nVrHR55TXtcIEpv7Gs77iCCsEGFYk5ZyPxmczpVFgu4fZpClDyP5nZCPgobFh8DSdSuNTxUN0V+VAiXLaVC0AUyDGsVmOI1vNLA7PivHJYbHXgMnemuC5sU1TubAJHXlBA46E9F5r/xebNLNxAPlW/y2aK74V/I5J4oP9fB3cdGb1cTx/4JL95Br9gOIhzSFPVWJKFuP4rCbK0g1rsiZTKq4S+7dVN0iHvbC0C1sPqbj/pVHDrvDUHrFLJ2gC5QGElDEpJDewrJi2xsmeeB1BueGYFZ9AYfSPgpt0w2LPJK71ZQw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739122117; c=relaxed/relaxed;
	bh=OCFPSbNt1Snq9/Wi7bvy7SV50U3EuS5ZpnyTiZwe9dk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iT4Xhnh95kQyf0KWjlUI3jNdSYx0CoVPnz1bCJsB5hypJrXpId/d61I4nBpTdwSNb5L6Hdn054tunx6iSjABVbKFg+2kAms83EJaIqKHG0UsSpGTeF0UnGLNbUcJipDydVuM0h7iAVAri6xjaCPMnIgZuOCSAmKOkJr8SAIrOCyh6ywcEsbgZ/8Jbess6Fbz4R9SFOmHkSqlAlui1FfJcnwvad35AK21vkjBXTV2CWW8B6xzwPKh/H3bCjxQOBIh0JyqACl08hSlhZCcuiDZ4ksNEosnL0/K87eurLay8uqxTrpIpnxBmSGJWXwQYLodvrDor92cIpuh6pRNNMlqVg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=posteo.net; dkim=pass (2048-bit key; secure) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=2017 header.b=RHnN+wDK; dkim-atps=neutral; spf=pass (client-ip=185.67.36.66; helo=mout02.posteo.de; envelope-from=j.ne@posteo.net; receiver=lists.ozlabs.org) smtp.mailfrom=posteo.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=2017 header.b=RHnN+wDK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=posteo.net (client-ip=185.67.36.66; helo=mout02.posteo.de; envelope-from=j.ne@posteo.net; receiver=lists.ozlabs.org)
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YrZS271Gwz2xgp
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Feb 2025 04:28:30 +1100 (AEDT)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 0B874240103
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Feb 2025 18:28:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1739122101; bh=3qpw2bQ12DB6YGamFBnTxyKWuhTs/kDLk94p3S330Xg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=RHnN+wDKAMU0dOwFT1Pu7fyGsT0Gt9DsPRzfHDfqEPrdS6Qf2YK2JJbyvmVX0ooh4
	 EcSNJH+559vYooXaiUo4suSNha8ozsDhaK0855yvWR7FowQZHkM5intMA3Xm8631mg
	 fwcitB6a3NHfwWk/AOkYnottBn4nxixjXVY4sV+irUOpblwVZDLNmNTWGa9LunO/ea
	 GhBbXZquiNiSXqobyOmRe6R04m2y2qX7QMm6KCtHF/CbbFSgw4C1PaK0DgG5VDF8DF
	 40s8seJG1eG99kWjdKwGXpTWUw8q1BthHVVojmnH/cU7wXLVR9miP+A7QZwlizo+9r
	 uU2hyqwUMjw3A==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4YrZRd3h87z9rxG;
	Sun,  9 Feb 2025 18:28:13 +0100 (CET)
Date: Sun,  9 Feb 2025 17:28:13 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Mark Brown <broonie@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-ide@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	linux-crypto@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	dmaengine@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>,
	linuxppc-dev@lists.ozlabs.org, linux-spi@vger.kernel.org,
	=?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	Guenter Roeck <linux@roeck-us.net>,
	Nicholas Piggin <npiggin@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Naveen N Rao <naveen@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>, imx@lists.linux.dev,
	Niklas Cassel <cassel@kernel.org>, Scott Wood <oss@buserror.net>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Richard Weinberger <richard@nod.at>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Lee Jones <lee@kernel.org>, linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-mtd@lists.infradead.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-kernel@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-pci@vger.kernel.org
Subject: Re: [PATCH v2 09/12] dt-bindings: memory-controllers: Convert
 fsl,elbc to YAML
Message-ID: <Z6jlrU7EPeATjK8s@probook>
References: <20250207-ppcyaml-v2-0-8137b0c42526@posteo.net>
 <20250207-ppcyaml-v2-9-8137b0c42526@posteo.net>
 <173897189669.2630636.11579554304003668196.robh@kernel.org>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <173897189669.2630636.11579554304003668196.robh@kernel.org>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Feb 07, 2025 at 05:44:59PM -0600, Rob Herring (Arm) wrote:
> On Fri, 07 Feb 2025 22:30:26 +0100, J. Neuschäfer wrote:
[...]
> >  .../bindings/memory-controllers/fsl,elbc.yaml      | 146 +++++++++++++++++++++
> >  .../devicetree/bindings/powerpc/fsl/lbc.txt        |  43 ------
> >  2 files changed, 146 insertions(+), 43 deletions(-)
[...]
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/memory-controllers/fsl,elbc.example.dtb: /example-0/localbus@f0010100/simple-periph@2,0: failed to match any schema with compatible: ['fsl,elbc-gpcm-uio']
> Documentation/devicetree/bindings/memory-controllers/fsl,elbc.example.dtb: /example-1/localbus@e0005000/nand@1,0: failed to match any schema with compatible: ['fsl,mpc8315-fcm-nand', 'fsl,elbc-fcm-nand']
> Documentation/devicetree/bindings/memory-controllers/fsl,elbc.example.dtb: /example-1/localbus@e0005000/nand@1,0: failed to match any schema with compatible: ['fsl,mpc8315-fcm-nand', 'fsl,elbc-fcm-nand']

I think this is due to how the patches are ordered in the series.
This patch uses fsl,elbc-gpcm-uio and fsl,elbc-fcm-nand in examples, but
comes before the patches that define the corresponding bindings.

