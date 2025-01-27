Return-Path: <linuxppc-dev+bounces-5584-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E89A1D083
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jan 2025 05:51:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YhGGQ0v5dz305C;
	Mon, 27 Jan 2025 15:51:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737953486;
	cv=none; b=ArUupxtqMJ/ie1DQ6EaW63f3wdMeqyXZFOabT5GJE48iToFFk9/9wsT7d3f7ajPSeKTlNXKz7h8pZKRx+v+sW7GCgx0q2UfN6tiKCxqfESOwxpkS4hWSS96E8TlJOsi2/sJNEpEucpN08EMdD2Yav+9TcFMEp7ilwu8Va7FBO2CIKC/HCV+RIY52hEOpTWkft89V7xw0ljcGP+beXff3f9gNZCI31srFOiNorbPeHuV6QOQ8qHFxGUWBj1zcmR2q/KYkjQ+cxim670YQHawFZNUHXzTmAR6h6zstjyZL5wvu328Ubm9/w3wRfLW+RqJnKbI4/TTdd7RjLiXhpk5nrg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737953486; c=relaxed/relaxed;
	bh=VLjmUhR1hOHdUfEIJ7BsBdKlFspDZ8wB5EB/vF5Wgj0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EB/i5ggC3bYUVk5N8Z/Y6P4irY4hKvVpFKtR83aaqCXHCWsIoC/8EyTOyr6XlWhs0bjVwmEMIKJe5JygNUUWcqOW+s6k3tjTY06/TgngGo+WJbtuLy0GL9119mjN7DfM7xy81ADx7o4wfZ5hMgtE7v0aPthbpjJVAbFsZs40AOZqVs6ZSU8AqTw+mJWTEbjtdpAH5rFa54l3DhfDXsJBK8+hsbP607ui8a3h+4pTSvICfF1mkl2I8kk/fZtwF3DD+3DWHYBBLe8roSuICObZedF1cUrSm2ijbA1hC3zBcsjLQ1eTt3tq0patbpfzEgG33iyy5uRDGlEfq4TlLPLK7g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Lew5dHJX; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Lew5dHJX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YhGGP3qSTz301B
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jan 2025 15:51:25 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 442725C477D;
	Mon, 27 Jan 2025 04:50:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E852BC4CED2;
	Mon, 27 Jan 2025 04:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737953483;
	bh=MP5quvHBDN7k35e6RGGtxX0t8y8u7jhKsU/FGhI5zdU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Lew5dHJXknFjzOW36Rib15BHiM3vLvNHrw4+kpJxAGzdWQz5Wq6HPBohWme5nANCz
	 piXRw8aSDn7kVz6tulHNLkQpmPqa1Tn1vtMN1SOOFSAOFgh64D4rPUYtUkLT/zqiD7
	 2wgbPJIDprlCiTfrmpva/60u0FRYruucYIVbBsVj0cww4ClYUV86AvgSR4LOGsA6E0
	 4N10dQycFwXGFCk0nAbHFIldS80TvjVzflSoPBGNS3CQYVT5enq13GgmgfpZwMybHq
	 eKc/FPstif+ganbHJP2xQMSfBCYI/O3hXVhd08UdlbKZXcq7cz4Bnj3NvwDbQa80o4
	 yF3B4YlkIt9hw==
Date: Sun, 26 Jan 2025 22:51:22 -0600
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
Subject: Re: [PATCH 7/9] dt-bindings: watchdog: Convert mpc8xxx-wdt binding
 to YAML
Message-ID: <20250127045122.GA3127337-robh@kernel.org>
References: <20250126-ppcyaml-v1-0-50649f51c3dd@posteo.net>
 <20250126-ppcyaml-v1-7-50649f51c3dd@posteo.net>
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
In-Reply-To: <20250126-ppcyaml-v1-7-50649f51c3dd@posteo.net>
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sun, Jan 26, 2025 at 07:59:02PM +0100, J. Neuschäfer wrote:
> Convert mpc83xx-wdt.txt to YAML to enable automatic schema validation.
> 
> Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
> ---
>  .../devicetree/bindings/watchdog/mpc8xxx-wdt.txt   | 25 ---------
>  .../devicetree/bindings/watchdog/mpc8xxx-wdt.yaml  | 64 ++++++++++++++++++++++
>  2 files changed, 64 insertions(+), 25 deletions(-)

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

