Return-Path: <linuxppc-dev+bounces-5969-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6068CA2D1A2
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Feb 2025 00:45:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YqVvN4pd8z30Vg;
	Sat,  8 Feb 2025 10:45:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738971904;
	cv=none; b=IE9tg9w/6MmOE8Sm/miReTlbZSBsMGhQaVqGl0meoXoRqmSGxDBu3XKFgCRe5hwoRxwjRZ+fxPxH77+m5Va7FXBu5BJdwjqBfwWuWg+yQkrHI3cDoiGR/1lN/W4ceMySy8ml3RAhXw0fpgSVe82nCwjp9ounX+mreqbJbIw7s3DQ7/JYVANKjmCavx60gMKtOHAn6aXqxFJfBto7Pa/yLQ5KiOaabw1V7Owict90HWxzcbJzdyqchugT1OSZ7E0Vo44Q/QF+20CyKu+BVrEI39iUOZu4PsyCZGlZ1V9dZKkErTJN4m2EfsvVAS/3+sUoi7Lnl13wdpZbZPQDxwDWqg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738971904; c=relaxed/relaxed;
	bh=P2vzpHh4/YUwmIMId5ePAaNByZ3jzodjNWjakjm9iVs=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=HJBxPIV/Wh8rkaswa+ASv6OBXNio2mlUecG0zvmgBchYL16Y6npVdaHm4BVPYdrQ6pL5OzuwQfFXy+wu5cCzU1gjydiv6TSLQZ4kdX12J7IGB0MFeYgUYT4SRjSxhgfj+yI8OPeIVlK9KXZBe/3LvkHQWEJeYLR9PgaaOYIv6gzWazUeJc4AHRGGfyf8D4C4dnUHjAnV2oxWsorQ7TE6ksCrNh/VYUWzNupaRa3ZgO6XU6R5G+hriqWKM/F39g4qgIAiK7z0kOC7DU8t/+QQaXZzLmV4R8rUEZR04BtYQlvO3A9/5JLxOj140dcfOn1i+7FinwiuteKVnEVKUirZPg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cskSHgtk; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cskSHgtk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YqVvM3hTKz2yZN
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Feb 2025 10:45:03 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0B7F75C704D;
	Fri,  7 Feb 2025 23:44:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28EBCC4CEED;
	Fri,  7 Feb 2025 23:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738971900;
	bh=oxDEJrSuRw9jHuBedmerkRKEsabLePL5ItoY++NvcWI=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=cskSHgtkDNZpjrroSTdfIB2pBrFWA/I8lyqrwRM3VEsMsQJ8xJ8HgHGrqbX3gKw8p
	 uxzQNr1B8LTK0QWKcrCpaseaC5vB6Bb8PaNk9IeKqu1/r7oLuL7Zz9L9+Eg+NlKvsi
	 YXjY65GMCfwsS4caD9gupEyizInImvIclQf6R+0epDHm0rRw5hBOartRJHhiMeCSTs
	 3KGvQS+zSo92/eXSV7+l1PwvSUyLoI358WwuktySbalbHOg+XnYGZKWgTA/IeFP+Bh
	 X2pRORuLGKSwryBQvt56Ldi77izopX6xGKBTIQVbndi6y7PsSQnjFMS04O38gPVaNA
	 HPK4MwWUSENUw==
Date: Fri, 07 Feb 2025 17:44:59 -0600
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
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Damien Le Moal <dlemoal@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-ide@vger.kernel.org, 
 "David S. Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org, 
 Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org, 
 Herbert Xu <herbert@gondor.apana.org.au>, linuxppc-dev@lists.ozlabs.org, 
 linux-spi@vger.kernel.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 Guenter Roeck <linux@roeck-us.net>, Nicholas Piggin <npiggin@gmail.com>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
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
To: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
In-Reply-To: <20250207-ppcyaml-v2-9-8137b0c42526@posteo.net>
References: <20250207-ppcyaml-v2-0-8137b0c42526@posteo.net>
 <20250207-ppcyaml-v2-9-8137b0c42526@posteo.net>
Message-Id: <173897189669.2630636.11579554304003668196.robh@kernel.org>
Subject: Re: [PATCH v2 09/12] dt-bindings: memory-controllers: Convert
 fsl,elbc to YAML
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org


On Fri, 07 Feb 2025 22:30:26 +0100, J. Neuschäfer wrote:
> Convert the Freescale localbus controller bindings from text form to
> YAML. The updated list of compatible strings reflects current usage
> in arch/powerpc/boot/dts/, except that many existing device trees
> erroneously specify "simple-bus" in addition to fsl,*elbc.
> 
> Changes compared to the txt version:
>  - removed the board-control (fsl,mpc8272ads-bcsr) node because it only
>    appears in this example and nowhere else
>  - added a new example with NAND flash
>  - updated list of compatible strings
> 
> Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
> ---
> 
> V2:
> - fix order of properties in examples, according to dts coding style
> - move to Documentation/devicetree/bindings/memory-controllers
> - clarify the commit message a tiny bit
> - remove unnecessary multiline markers (|)
> - define address format in patternProperties
> - trim subject line (remove "binding")
> - remove use of "simple-bus", because it's technically incorrect
> ---
>  .../bindings/memory-controllers/fsl,elbc.yaml      | 146 +++++++++++++++++++++
>  .../devicetree/bindings/powerpc/fsl/lbc.txt        |  43 ------
>  2 files changed, 146 insertions(+), 43 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/memory-controllers/fsl,elbc.example.dtb: /example-0/localbus@f0010100/simple-periph@2,0: failed to match any schema with compatible: ['fsl,elbc-gpcm-uio']
Documentation/devicetree/bindings/memory-controllers/fsl,elbc.example.dtb: /example-1/localbus@e0005000/nand@1,0: failed to match any schema with compatible: ['fsl,mpc8315-fcm-nand', 'fsl,elbc-fcm-nand']
Documentation/devicetree/bindings/memory-controllers/fsl,elbc.example.dtb: /example-1/localbus@e0005000/nand@1,0: failed to match any schema with compatible: ['fsl,mpc8315-fcm-nand', 'fsl,elbc-fcm-nand']

doc reference errors (make refcheckdocs):
Warning: Documentation/devicetree/bindings/display/ssd1289fb.txt references a file that doesn't exist: Documentation/devicetree/bindings/powerpc/fsl/lbc.txt
Documentation/devicetree/bindings/display/ssd1289fb.txt: Documentation/devicetree/bindings/powerpc/fsl/lbc.txt

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250207-ppcyaml-v2-9-8137b0c42526@posteo.net

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


