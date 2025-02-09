Return-Path: <linuxppc-dev+bounces-6005-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D307DA2DF6E
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Feb 2025 18:31:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YrZVz2YHwz2xy0;
	Mon, 10 Feb 2025 04:31:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739122267;
	cv=none; b=IBXStCf1HxPzYFTyEB5nQ3kC66by7TAQ3kSX+osJy3cD9xdiJE2susZWbW8gyBbwrCsjIYCFKyuSEc4fGlM6RXX5M4Ocy3ANNpLqqK4xkkjdIU6ZTkU4JRmb452/5zATa6h1vEbtoewTMtj1XpFoGURsa4vPjJKNXwRHzAxtTVw63W4kii0B9NnE89IJm3tw/foPkdVZxFXnOKxPd3YlZ+EYdtbE/YH2CYiFuruL9FA+CHRycP6RrxuKbfkI1SGjljjtpL7BhpkQmuJuS6O6T/I8OpNh4UQlYSGKBN8AOoFJEyh4B8SMKHbnvjFnoZ7DI7KZ5hJfvgWWORwCQoOXHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739122267; c=relaxed/relaxed;
	bh=CYeyvm7l7H5+J940t+ifocY8DkTw8N+OvgJFmC0nxFc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OEqsFPjtSyojQctDdlNCIeYGOEfZV58qA3uLcf6IFCEW5vuF+6CsEJF+mlEbfqeEVQ/51ShRRAsoI7uBq3dI15pnRPb/ItJokoVck7wumSSMWy7cCBGWZ8VOWublGhFLy35TRmPLZCyFBPAz19zzFNvI3UQo4MlJYqmn8wZWU2brmih5IDZHo9g20RmgyoJi2bHO/5LKj/RaYJ/TinE2PLGgCIYGXFlgITc4/vN2pAkYmMTgKng4dsp3ipAzwsZni4N5xvRW2Qh/6LIHCh48Pwn9sWTwavAuJSAD2dubr8uXLaisL+OVC5OcPNGr56LYuIbJVWa68bf7YMZo/R/mKA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nzvOo5BG; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nzvOo5BG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YrZVv3SWnz2xm5
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Feb 2025 04:31:03 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 833265C5BCF;
	Sun,  9 Feb 2025 17:30:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B079FC4CEF3;
	Sun,  9 Feb 2025 17:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739122258;
	bh=xH6x/QYtEnKtOblwV4z7BbFUBC1Q4T3epCkfofCCAoQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nzvOo5BGo8/4jIfa3Y9Dvm/ix3FOQgmCTPYJrDTTpnTF8h4ed2s6WH+ZEQJE5DuBM
	 TiXGG2DC/pUa/lpw+2F7ONZG6qBZK4kBuRFyrKA6pwqSRxRdyDdu3EYZGuV4+GXUcM
	 AmJkYJf4cXdsVyVj1cmHJVAIjp7zb+5jJeAaMe+oJmJfvOQgJ0ik7KcaQDDriFHB3k
	 a5TKl2uzSC3/Eea9//uMC9/wAyp471x/l9vtA9ZEAkibIHHiAmV1xHqfuxewICie/I
	 LXlkqYsVeuBj2LyUYImLqEaZCz0IQCgl1n/UR081ULm5viW5EkJpOyMlS9mb4eJLET
	 nPhV2eS0CkvbA==
Message-ID: <4c41a8e2-b097-4b95-ba0a-115dbbfc4e1a@kernel.org>
Date: Sun, 9 Feb 2025 18:30:44 +0100
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/12] dt-bindings: memory-controllers: Convert
 fsl,elbc to YAML
To: =?UTF-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>,
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Damien Le Moal <dlemoal@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-ide@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org,
 Herbert Xu <herbert@gondor.apana.org.au>, linuxppc-dev@lists.ozlabs.org,
 linux-spi@vger.kernel.org, =?UTF-8?Q?J=2E_Neusch=C3=A4fer?=
 <j.neuschaefer@gmx.net>, Guenter Roeck <linux@roeck-us.net>,
 Nicholas Piggin <npiggin@gmail.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Naveen N Rao <naveen@kernel.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, imx@lists.linux.dev,
 Niklas Cassel <cassel@kernel.org>, Scott Wood <oss@buserror.net>,
 Michael Ellerman <mpe@ellerman.id.au>, Richard Weinberger <richard@nod.at>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Lee Jones <lee@kernel.org>,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-mtd@lists.infradead.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, linux-kernel@vger.kernel.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-pci@vger.kernel.org
References: <20250207-ppcyaml-v2-0-8137b0c42526@posteo.net>
 <20250207-ppcyaml-v2-9-8137b0c42526@posteo.net>
 <173897189669.2630636.11579554304003668196.robh@kernel.org>
 <Z6jlrU7EPeATjK8s@probook>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <Z6jlrU7EPeATjK8s@probook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 09/02/2025 18:28, J. Neuschäfer wrote:
> On Fri, Feb 07, 2025 at 05:44:59PM -0600, Rob Herring (Arm) wrote:
>> On Fri, 07 Feb 2025 22:30:26 +0100, J. Neuschäfer wrote:
> [...]
>>>  .../bindings/memory-controllers/fsl,elbc.yaml      | 146 +++++++++++++++++++++
>>>  .../devicetree/bindings/powerpc/fsl/lbc.txt        |  43 ------
>>>  2 files changed, 146 insertions(+), 43 deletions(-)
> [...]
>> dtschema/dtc warnings/errors:
>> Documentation/devicetree/bindings/memory-controllers/fsl,elbc.example.dtb: /example-0/localbus@f0010100/simple-periph@2,0: failed to match any schema with compatible: ['fsl,elbc-gpcm-uio']
>> Documentation/devicetree/bindings/memory-controllers/fsl,elbc.example.dtb: /example-1/localbus@e0005000/nand@1,0: failed to match any schema with compatible: ['fsl,mpc8315-fcm-nand', 'fsl,elbc-fcm-nand']
>> Documentation/devicetree/bindings/memory-controllers/fsl,elbc.example.dtb: /example-1/localbus@e0005000/nand@1,0: failed to match any schema with compatible: ['fsl,mpc8315-fcm-nand', 'fsl,elbc-fcm-nand']
> 
> I think this is due to how the patches are ordered in the series.

If that's possible, this should be fixed, e.g.  by re-ordering the patches.

> This patch uses fsl,elbc-gpcm-uio and fsl,elbc-fcm-nand in examples, but
> comes before the patches that define the corresponding bindings.


Best regards,
Krzysztof

