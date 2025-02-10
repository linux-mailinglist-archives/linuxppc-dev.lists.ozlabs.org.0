Return-Path: <linuxppc-dev+bounces-6024-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 12178A2E6B9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Feb 2025 09:45:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yryp605V6z2ynf;
	Mon, 10 Feb 2025 19:45:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4b98:dc4:8:216:3eff:fe9d:e7b4"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739177133;
	cv=none; b=gzfzy9B7Q16FJjCmQKCxE72lMzHyfSbx37jLGByzVc4fksGXGqrn5hGTq7AX0SV9b/ejNHcwNp1lkctdoLbK2h3FEXb+2p02nredGs7F+z6XJMdP9QLEhqwBHwkXngntRhDdZj0SkPC0TJzGqvRqLnh0Qm1Ig+8f1myG1uzHQmlEyfBJboWYSfIgnQ4vLp5ZhICEfWt5Jw5MqgQ0jBbATHoEEWWPR3RHF2LaE6xaJXkjWfXPZYs2i+PyU090ARu9z7ZEEL8DQyckh4UCqkJozKLLUPnGKtrhMwImwb30rW30jk0V3bsyI89BmwOOSBef6bA0Y8Jv/LY5aMDRjMDJdw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739177133; c=relaxed/relaxed;
	bh=8e9TvzMvnN655dD9mW3ziQ4pedVgVTCtFygXZeQGWbI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=j1V8zGSu7PPjIPU3VMj/djQBHS8YX5DCwXYRvgSesJBmNrosGFLPj2HTIv4Ujh05QKmu75Y58+sbeHiS/FzVvJ/a5Li1pr0ewmmu6pw3YBmsmCQbpGzNp2FImiHTaJuw0j6mXbD50/ni8XhZtjXCjWrfMIt5qfNqajG5DyhjMljefOmtE1JDNR3GdQrnjWVYE0XzTqlGbIFEl9EUMfpHjvrpEmdwFe92SGl9/tm6EyqEYozaiT4CyPbVFLbkySKsNEfFKp2FjFPlvFTb2hdZhX9A5N/smzSbkRRWkUUyPhfNOVs1rPMpVu2PZ0fnNoz/cSBew8CQW8Sfjc/iH6Q6nQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=ZY02NguF; dkim-atps=neutral; spf=pass (client-ip=2001:4b98:dc4:8:216:3eff:fe9d:e7b4; helo=mslow3.mail.gandi.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=ZY02NguF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8:216:3eff:fe9d:e7b4; helo=mslow3.mail.gandi.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 1077 seconds by postgrey-1.37 at boromir; Mon, 10 Feb 2025 19:45:31 AEDT
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [IPv6:2001:4b98:dc4:8:216:3eff:fe9d:e7b4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yryp370YBz2xjL
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Feb 2025 19:45:31 +1100 (AEDT)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id 1434E582D0F
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Feb 2025 08:27:39 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6E7EC441F0;
	Mon, 10 Feb 2025 08:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739176047;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8e9TvzMvnN655dD9mW3ziQ4pedVgVTCtFygXZeQGWbI=;
	b=ZY02NguFvp2D4ou3No/QCzpfSTJ/vEq/6qT+XJ/nvm4ksYAK39lFMb0mQgDBqM0QIBRl1F
	8lQkkIF/mc8rfl0l4flqx4G6JMtztvl8iq4f4mpGpYsw9F+0rmgop6/sp/OOfQsixdP9Hn
	F5EBu6cuuY9MfhzpBOyfm3OiCFVmX2cf9gRlizM56NuNZNK60icbcTT+3/d+T/Unba6ad9
	nIAJD/b54HfwpeWm89ATdYeoXB7ZO5w+IHsHy0eoz3L543OybW2v5YkqjOB1Y1pInLZonw
	gvl82hS9MNgYZaE0ZItYKARh4AqYqBh+HH0IcpFf14eU4/gDM4YqjQJ7ekjhow==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: J. =?utf-8?Q?Neusch=C3=A4fer?= via B4 Relay
 <devnull+j.ne.posteo.net@kernel.org>
Cc: devicetree@vger.kernel.org,  linuxppc-dev@lists.ozlabs.org,  Krzysztof
 Kozlowski <krzk@kernel.org>,  j.ne@posteo.net,  imx@lists.linux.dev,
  Scott Wood <oss@buserror.net>,  Madhavan Srinivasan
 <maddy@linux.ibm.com>,  Michael Ellerman <mpe@ellerman.id.au>,  Nicholas
 Piggin <npiggin@gmail.com>,  Christophe Leroy
 <christophe.leroy@csgroup.eu>,  Naveen N Rao <naveen@kernel.org>,  Rob
 Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>,  Damien Le Moal <dlemoal@kernel.org>,
  Niklas Cassel <cassel@kernel.org>,  Herbert Xu
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
In-Reply-To: <20250207-ppcyaml-v2-12-8137b0c42526@posteo.net> ("J.
 =?utf-8?Q?Neusch=C3=A4fer?=
	via B4 Relay"'s message of "Fri, 07 Feb 2025 22:30:29 +0100")
References: <20250207-ppcyaml-v2-0-8137b0c42526@posteo.net>
	<20250207-ppcyaml-v2-12-8137b0c42526@posteo.net>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 10 Feb 2025 09:27:22 +0100
Message-ID: <87o6zaurv9.fsf@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefjeehkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffeghfejtdefieeguddukedujeektdeihfelleeuieeuveehkedvleduheeivdefnecukfhppeelvddrudekgedrleekrdekgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeelvddrudekgedrleekrdekgedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfeelpdhrtghpthhtohepuggvvhhnuhhllhdojhdrnhgvrdhpohhsthgvohdrnhgvtheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugihpphgtqdguvghvsehlihhsthhsrdhoiihlrggsshdrohhrghdprhgtphhtthhopehkrhiikheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhdrnhgvsehpohhst
 hgvohdrnhgvthdprhgtphhtthhopehimhigsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtohepohhsshessghushgvrhhrohhrrdhnvghtpdhrtghpthhtohepmhgrugguhieslhhinhhugidrihgsmhdrtghomh
X-GND-Sasl: miquel.raynal@bootlin.com
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hello,

On 07/02/2025 at 22:30:29 +01, J. Neusch=C3=A4fer via B4 Relay <devnull+j.n=
e.posteo.net@kernel.org> wrote:

> From: "J. Neusch=C3=A4fer" <j.ne@posteo.net>
>
> In some scenarios, such as under the Freescale eLBC bus, there are raw
> NAND chips with a unit address that has a comma in it (cs,offset).
> Relax the $nodename pattern in raw-nand-chip.yaml to allow such unit
> addresses.

This is super specific to this controller, I'd rather avoid that in the
main (shared) files. I believe you can force another node name in the
controller's binding instead?

Thanks,
Miqu=C3=A8l

