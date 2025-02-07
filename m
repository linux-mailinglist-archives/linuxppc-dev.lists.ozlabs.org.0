Return-Path: <linuxppc-dev+bounces-5967-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A20A5A2D15E
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Feb 2025 00:17:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YqVHr2k6vz30Gq;
	Sat,  8 Feb 2025 10:17:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738970264;
	cv=none; b=YD2nsBCE39gwJJGW2/spTVRmV9VYH5amAcj8C/2bg+b373MD1NunTVzvayYiHZnub3IGCq+or+RIB5D+KIz6Hwr2MVG5SNF8WTQZr7yN4jpLeVIbaM7sLVM9oUqgEe8VE52+tGizST5I9lTLV0/D2QyCRGhZ6/ce+++4Q/aN1yEjHXyrDRrwyvfYMAyaPa/wcvwycQZRI6AFY2M2msd4K/IiqOkKe/OXA7YUOmkLbPo+Te53AOHEXRvMmPemp73yrf7RtuwPfUiFiURp3jpejhLAvNvynAgZFW8tFV14Q7MCakgimg3Z/OcFH1VTnn9Uf09+Phz3sUTfvR4ExjUyiw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738970264; c=relaxed/relaxed;
	bh=xti1ftiq+X195EGE2ebzSiso+ZPKjIcfncIinD92KQU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QibhzDZKoR3Op9RQRZD+1B1pbB0tMBwNFYFm04PJr6H4kF5TXWHpIQeruBavvnutS3D/KCdKXC7BQUd03V4Fi8cHHyt7SWXkbOuemk2pizFAkJSr0gmc3u+U+OzmPL1MX/LViJTLZ9551QPVJ9mz29n6Gf0mwsw+4aYEMp+fW/vTBHysscyzXIrozPLUdMZbs+PfD6VROU3kMTDy2FFYR19Sa1jNjDO5/6++1MIiekcrLptKh3PBl6NeQYzZdgAw0hOALBlWZLWNRiOo+v6YO7KQNp5RzBMcum5xJ77Sz9FTRJy/kRUDt3Est0VYRzRJPrYTHUli/X9AANdnyrrABg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nvPoqqau; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=dlemoal@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nvPoqqau;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=dlemoal@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YqVHq5HSSz2ykc
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Feb 2025 10:17:43 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B85ADA43E2A;
	Fri,  7 Feb 2025 23:15:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0028C4CEE2;
	Fri,  7 Feb 2025 23:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738970260;
	bh=uBu6t4ty0hQZKKSCZBRKb4E9WpdD1GpGMPNfBVQXDVg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nvPoqqaucbZ+Zi7dcFcDf19MmSlaU676cQ27+TNgNPph5SnE0OcWAbUo6mtU6XA70
	 CRj64dcDZGAl20MNFWj5ElGlRslwwc5/82rTjSJ/eeDkPagVEXOvKsD37lz5OmauQ/
	 BljW5xyk6RVr97YBC4nN3jG9BDk7HPMnGeR5w/afedLrOmISQIhvJXZa2NMYrUgnwM
	 +ems6aj8tw36WCnlJU03Wieogvtqo9kWaQrsmW8KgpgFP0XAmUNUufDSjHc1B4z7ZF
	 HP5wB6OAf2XEnk0gkYoiiGTKTKW1VOfe52a2OyomRnFgIxjFCNSp7ViFtzhQ4/rN4C
	 MKlSVzR3S6BAg==
Message-ID: <8de72c76-6fea-4f8a-b818-72c8de07a78c@kernel.org>
Date: Sat, 8 Feb 2025 08:17:34 +0900
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
Subject: Re: [PATCH v2 02/12] dt-bindings: ata: Convert fsl,pq-sata to YAML
To: j.ne@posteo.net, devicetree@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Krzysztof Kozlowski <krzk@kernel.org>
Cc: imx@lists.linux.dev, Scott Wood <oss@buserror.net>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Niklas Cassel <cassel@kernel.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, Lee Jones <lee@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?Q?J=2E_Neusch=C3=A4fer?=
 <j.neuschaefer@gmx.net>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Mark Brown <broonie@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org
References: <20250207-ppcyaml-v2-0-8137b0c42526@posteo.net>
 <20250207-ppcyaml-v2-2-8137b0c42526@posteo.net>
From: Damien Le Moal <dlemoal@kernel.org>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <20250207-ppcyaml-v2-2-8137b0c42526@posteo.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 2/8/25 06:30, J. Neuschäfer via B4 Relay wrote:
> From: "J. Neuschäfer" <j.ne@posteo.net>
> 
> Convert the Freescale PowerQUICC SATA controller binding from text form
> to YAML. The list of compatible strings reflects current usage.
> 
> To clarify the description, I changed it to mention "each SATA
> controller" instead of each port.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: J. Neuschäfer <j.ne@posteo.net>

Acked-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research

