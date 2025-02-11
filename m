Return-Path: <linuxppc-dev+bounces-6082-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0FBBA30DE1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Feb 2025 15:13:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ysk2D5p8Kz305X;
	Wed, 12 Feb 2025 01:13:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739283220;
	cv=none; b=egma6c7R4UuY+DG1Bvj57CWFS5E0Iz7PYW6MiLmNQ0EC7n2gxIvoviinZntR6wGE34mdkhHMWSW4I7xkokANTuKIiHwxGdTEgNKOtkqAlERkY8p/qxPYOd+asOgGUaM1IPFumXo7J+3tQXEa3G1mvxbZTuWihRpuMnbCfrk2DP5HHQAy1R9CSLq46auOY38YC+0F0pOM4bo/YYbnQ2Fco+2Slv6wjx1w0ZhXGdERQ1BFUu4xc0KzKRD1mLCC/i8tAckSXjr3XyZt7s5ycJn1T1s8R3FUztQuSSpcgWW7Kbn4VRyw/yYgCf3cmWucqiHs22lNH7WnEbEFL6jlFiAazg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739283220; c=relaxed/relaxed;
	bh=+XdUiUZN1aCGXsc/zBEiQeATMB964dgGZANTcCMf7rM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gwaq1aHzR4efK1QDbzb8u+LCG/OawROSberf20Z4OgL9RBMC6drpVZAIu0/iZoS94qw4ra8ooUnqIrkqKT1hMZdKE1V7rbekuizPJDGhC4XIvkrJ1KhqHmNJ+N+gztjhohq2HtiVvmjZVs7nBN2kKo3e7mIuvzlfp/qIFD4IONR0kih+LdCB10lh1Ssi09JPjOnsWAHHpEaCjQlD/LTGbFdmhTpQbkuVzxjsBPrITZGTzrutFL89IsuE/kmSGo9+2ZdPdPIqKXUfUONytCoZAIAtNIUJZXETkdQeS+B9JGoKjPe60v9qrlWnE08i0TiULnWXjvDHbVyidXBcT0/u5Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UWXtA3oT; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=lee@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UWXtA3oT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=lee@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ysk2C4Rvnz2yMX
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Feb 2025 01:13:39 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9475FA40451;
	Tue, 11 Feb 2025 14:11:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71FA2C4CEDD;
	Tue, 11 Feb 2025 14:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739283215;
	bh=vDix81U6Ld3DReX03VSDWokaA9gTIex+ysGARHYBa4w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=UWXtA3oTS+v0q5G+sC9wAGrQZjODEQAnaR0oVQTshDp+I9TwaC8dSIgVEox+pVhiv
	 WWcvOT3MmyWJ75dZACpkY8Ja3QESry9PBuQV9mlp1VMqI/238hvWLqFYRuZ9Jqm0oN
	 cwTz0p2oIVVzONSb4lDc9caK6gmpqGWLqfw/lwN56VuXEYaARH68C1tUya+W8JUVg9
	 3U5dEFvvQsZXw3u7N+8B3j4rIFzCmvZVl7xl2QxnqTdoxo6WV51ZbZRiK96/YKQpV9
	 1kOSZLQ8BBJBrMsbguCncwtdh8zf2Crfw5Wgh4QQqqYCFFWPSquZBXcWueQ4cHPvb6
	 srLbfkvAlWIXA==
From: Lee Jones <lee@kernel.org>
To: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Cc: Scott Wood <oss@buserror.net>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Damien Le Moal <dlemoal@kernel.org>, 
 Niklas Cassel <cassel@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, Lee Jones <lee@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Mark Brown <broonie@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org, 
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org
In-Reply-To: <20250126-ppcyaml-v1-4-50649f51c3dd@posteo.net>
References: <20250126-ppcyaml-v1-0-50649f51c3dd@posteo.net>
 <20250126-ppcyaml-v1-4-50649f51c3dd@posteo.net>
Subject: Re: (subset) [PATCH 4/9] dt-bindings: mfd: Convert
 fsl,mcu-mpc8349emitx binding to YAML
Message-Id: <173928320921.2188572.3955959141357602902.b4-ty@kernel.org>
Date: Tue, 11 Feb 2025 14:13:29 +0000
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sun, 26 Jan 2025 19:58:59 +0100, J. Neuschäfer wrote:
> Convert mcu-mpc8349emitx.txt to YAML and list the compatible strings
> currently in use.
> 
> 

Applied, thanks!

[4/9] dt-bindings: mfd: Convert fsl,mcu-mpc8349emitx binding to YAML
      commit: 252c95ec3802a5f447df58253575b52aa741c1a1

--
Lee Jones [李琼斯]


