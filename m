Return-Path: <linuxppc-dev+bounces-6261-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F90BA37E87
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Feb 2025 10:31:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YxHTp51Xrz30Jc;
	Mon, 17 Feb 2025 20:31:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4b98:dc4:8::226"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739784686;
	cv=none; b=bKHhAt6k0D4KKzKxH+eoE8Rcd/LT2w6Eete4qFiJigavy1UHHY0l6CKYh8SHd9sXTOjy1R7scShCkna2KmqeRbE/a544vkZ1j+tFNWIYnXzMskXsToxNqp79MQcGnem/Ljw76nbvLvecwBpnDKmR9TEZT/bJAD0W4uUTkseFN0oq/UdxtZqLl8rD7Scz/tLMOGj26KvW2XrSLH5gy1WHaTM/60n1iKRpQ824vQHBbJlw7Z4o0ASoRdT4+Lv4kiia0seIQ22Qt+1gvt8FmhRZuBwe45C7zvhQYzJvR6zzS7vw6JE7GUlkYTAT3krrT1GYS/gUYU7hOnvwH73fOOf+tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739784686; c=relaxed/relaxed;
	bh=gzSgtFsogf3LvL+ai4nE5Lt4B+3+Fu9VUwcYPOuEIZQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=OO5Dwtvp4lRqk3THBf5frGLnX4tnH37doRVC18IV4+N4prgFohgmZq8qgB48ZmZr5L1T05fL+SpP5782O33zdM10NrQaF4foskK68Ye1aRavlPJt+BF5QWAzgx0ovm64nL9qkM9Qk8RjqIn5cycZrUhY9Ucmu3fOo49XK4zfm3nuuhk4XQrBSgTIPYSAzpQj7UArKwEeLYAbNYTN6dd6hpsIDEs8SO4C6euJ55naOcDtwzYFx5pJYcYGoIB1eMy7OKJuE/3YnrtCjhgSqJ/aexOpmqdlF0jMBVQcbyjTK3n8H+JU6k0wNoOSJcp7EQA1gv8sB82QkVieG48VSqfVbA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=fK/H46QJ; dkim-atps=neutral; spf=pass (client-ip=2001:4b98:dc4:8::226; helo=relay6-d.mail.gandi.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=fK/H46QJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::226; helo=relay6-d.mail.gandi.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::226])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YxHTm4yRyz302c
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Feb 2025 20:31:24 +1100 (AEDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6D2C04328A;
	Mon, 17 Feb 2025 09:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739784672;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gzSgtFsogf3LvL+ai4nE5Lt4B+3+Fu9VUwcYPOuEIZQ=;
	b=fK/H46QJFMLPMcRVkjjcBvXz3suQapWq9E5PCchE4muxik4Ug0FIztPKlE1SGb5DuDwz5a
	Uoo/64V/Eik/EAM40u63rxPdOzMTUc5FKFGxbkaMwRtBN5QXugz6xEKYFf59C2CPI3qGmh
	u2dWyZ6LCPd2sA0i6Nm2l6QZWCbNwHDiaPP9GOa9zcetatAYq2HNqRYOpUPYEdK/9SEZcv
	QBSU/EiTcIELPURB8EgJ9MV8wakky8b0GJorTq/QHU9O5rUi5u4wERdnNw3OTb4gL4kLQh
	1ripd4J1y7IWjqrj7Anhj4dIEqUdf7WF3Tl1AosWjOQZfn//HL8/QDLv01yDpA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: J. =?utf-8?Q?Neusch=C3=A4fer?= <j.ne@posteo.net>
Cc: J. =?utf-8?Q?Neusch=C3=A4fer?= via B4 Relay
 <devnull+j.ne.posteo.net@kernel.org>,
  devicetree@vger.kernel.org,  linuxppc-dev@lists.ozlabs.org,  Krzysztof
 Kozlowski <krzk@kernel.org>,  imx@lists.linux.dev,  Scott Wood
 <oss@buserror.net>,  Madhavan Srinivasan <maddy@linux.ibm.com>,  Michael
 Ellerman <mpe@ellerman.id.au>,  Nicholas Piggin <npiggin@gmail.com>,
  Christophe Leroy <christophe.leroy@csgroup.eu>,  Naveen N Rao
 <naveen@kernel.org>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Damien Le Moal
 <dlemoal@kernel.org>,  Niklas Cassel <cassel@kernel.org>,  Herbert Xu
 <herbert@gondor.apana.org.au>,  "David S. Miller" <davem@davemloft.net>,
  Lee Jones <lee@kernel.org>,  Vinod Koul <vkoul@kernel.org>,  Lorenzo
 Pieralisi <lpieralisi@kernel.org>,  Krzysztof =?utf-8?Q?Wilczy=C5=84ski?=
 <kw@linux.com>,
  Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,  Bjorn Helgaas
 <bhelgaas@google.com>,  J. =?utf-8?Q?Neusch=C3=A4fer?=
 <j.neuschaefer@gmx.net>,  Wim Van
 Sebroeck <wim@linux-watchdog.org>,  Guenter Roeck <linux@roeck-us.net>,
  Mark Brown <broonie@kernel.org>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  linux-kernel@vger.kernel.org,
  linux-ide@vger.kernel.org,  linux-crypto@vger.kernel.org,
  dmaengine@vger.kernel.org,  linux-pci@vger.kernel.org,
  linux-watchdog@vger.kernel.org,  linux-spi@vger.kernel.org,
  linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 12/12] dt-bindings: mtd: raw-nand-chip: Relax node
 name pattern
In-Reply-To: <Z7Iqir-qaZDt6tsx@probook> ("J. =?utf-8?Q?Neusch=C3=A4fer=22'?=
 =?utf-8?Q?s?= message of "Sun, 16
	Feb 2025 18:12:26 +0000")
References: <20250207-ppcyaml-v2-0-8137b0c42526@posteo.net>
	<20250207-ppcyaml-v2-12-8137b0c42526@posteo.net>
	<87o6zaurv9.fsf@bootlin.com> <Z7Iqir-qaZDt6tsx@probook>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 17 Feb 2025 10:31:08 +0100
Message-ID: <87tt8svrxf.fsf@bootlin.com>
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
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehkedtgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptdevhffgtdfhhefggeeftdeiffduiedtgffftddutdehteejhfevieelveegveetnecuffhomhgrihhnpeguvghvihgtvghtrhgvvgdrohhrghenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefledprhgtphhtthhopehjrdhnvgesphhoshhtvghordhnvghtpdhrtghpthhtohepuggvvhhnuhhllhdojhdrnhgvrdhpohhsthgvohdrnhgvtheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugihpphgtqdguvghvsehlihhsthhsrdhoi
 ihlrggsshdrohhrghdprhgtphhtthhopehkrhiikheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepihhmgieslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehoshhssegsuhhsvghrrhhorhdrnhgvthdprhgtphhtthhopehmrgguugihsehlihhnuhigrdhisghmrdgtohhm
X-GND-Sasl: miquel.raynal@bootlin.com
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hello,

>> > In some scenarios, such as under the Freescale eLBC bus, there are raw
>> > NAND chips with a unit address that has a comma in it (cs,offset).
>> > Relax the $nodename pattern in raw-nand-chip.yaml to allow such unit
>> > addresses.
>>=20
>> This is super specific to this controller, I'd rather avoid that in the
>> main (shared) files. I believe you can force another node name in the
>> controller's binding instead?
>
> It's a bit tricky. AFAICS, when I declare a node name pattern in my
> specific binding in addition to the generic binding, the result is that
> both of them apply, so I can't relax stricter requirements:
>
> # raw-nand-chip.yaml
> properties:
>   $nodename:
>     pattern: "^nand@[a-f0-9]$"
>
> # fsl,elbc-fcm-nand.yaml
> properties:
>   $nodename:
>     pattern: "^nand@[a-f0-9](,[0-9a-f]*)?$"

Well, I guess this is creating a second possible node name.

> # dtc
> /.../fsl,elbc-fcm-nand.example.dtb:
> nand@1,0: $nodename:0: 'nand@1,0' does not match '^nand@[a-f0-9]$'
>         from schema $id:
> 	http://devicetree.org/schemas/mtd/fsl,elbc-fcm-nand.yaml#

What about fixing the DT instead?

> (I changed the second pattern to nand-fail@... and dtc warned about it
>  mismatching too.)
>
> Perhaps I'm missing a DT-schema trick to override a value/pattern.
>
> Alternatively (pending discussion on patch 11/12), I might end up not
> referencing raw-nand-chip.yaml.

Ok.

Thanks,
Miqu=C3=A8l

