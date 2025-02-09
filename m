Return-Path: <linuxppc-dev+bounces-6009-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 987A9A2E093
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Feb 2025 21:52:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yrfz30m1Gz2yb9;
	Mon, 10 Feb 2025 07:52:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=165.227.176.147
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739134335;
	cv=none; b=ESo1PEikqdsZ6TsbL3Rvq9WzM8gG9qiGKemv+vPs8o6w04qjgEfTdjv2iyTrvRsCzlvC9AIbcM/tkpWmE1OEXSRuHHwl0CUKtzhdijMehBmqK3H6uSK9OE+/C/w4LWIJtF8Oah9hpSAB6rUkZerFuaze5EaBVEizGy8F5UZOBTl8aMIQrwEDgsEUej1IIoFziI4tjymi+ALqMghQSi7psFaoyUN+KZukTud6tcbrAdbs+ji9fIPC/hn7hWco3GVxqwDQGsYEsi4N+dFPAMgonQMTDFliDk4XLVRX/DTnW1UlG27a+phu7RYlKOE7vH0BzYf49PSJyNJ0siwCnnpXDA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739134335; c=relaxed/relaxed;
	bh=MuELZahnfjB2zfNBXkn/7vS+YWEIHeJmEyTF3bHn8yY=;
	h=Date:From:To:Cc:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Subject; b=Z4X9ZVYs3Dgbd0vMyrTS/o4KeeMMOAse0gC6obfxo9v5+XTcoDLrwf3FKOJtl4Sf+sU5cCpHMTzJrOCLZZhhJKmHhmgWPNV5Lv2atUzswG99lh/zmuXN7/ESwFHAlR38Ywknoknv1Q62ocP4hiKccX4Kl51PkTbjP75IjLUbaAwBEzFivWhFwmcLLV9yftlghKEADzn3JVqGJJVUyEWgSHY9Y2yItjC1cGq00wlzAMZMJUQR0QkZn9YuvY7LYG/rHrQ8hkGUqyNPpcWWe/ZKIMgc0lv/a/OErSZKVQ4eRFd2hFk8qaDZEs4vsy2LxVkWT9ByELluOG98t1ntNID+6A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=buserror.net; dkim=pass (2048-bit key; unprotected) header.d=buserror.net header.i=@buserror.net header.a=rsa-sha256 header.s=rsa_sel header.b=JwerkDeF; dkim-atps=neutral; spf=pass (client-ip=165.227.176.147; helo=baldur.buserror.net; envelope-from=oss@buserror.net; receiver=lists.ozlabs.org) smtp.mailfrom=buserror.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=buserror.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=buserror.net header.i=@buserror.net header.a=rsa-sha256 header.s=rsa_sel header.b=JwerkDeF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=buserror.net (client-ip=165.227.176.147; helo=baldur.buserror.net; envelope-from=oss@buserror.net; receiver=lists.ozlabs.org)
X-Greylist: delayed 1095 seconds by postgrey-1.37 at boromir; Mon, 10 Feb 2025 07:52:13 AEDT
Received: from baldur.buserror.net (baldur.buserror.net [165.227.176.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yrfz15ZzBz2yDH
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Feb 2025 07:52:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=buserror.net; s=rsa_sel; h=Subject:In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Cc:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=MuELZahnfjB2zfNBXkn/7vS+YWEIHeJmEyTF3bHn8yY=; b=JwerkDeFpUYmUtvgiyfDWFRcyc
	M1SayaRB+qccNqxuZLeR/Bh0Zi4doXvs2AuwQ4bXULgliRwmuL+46mVeaEmUJnjt20xSeByKQCeF7
	pqQnatSRU4+zfcORETcgPqMoDuz9Ijk4jbJsPiKiaLEQcbpIHWc/P0F4c/jFvX5d56ebaA3NJGjAd
	XSH27+KqmV7Z5IMLaNqwxgX15BzUCAKWCpbNvQyD4qc8VY5U6w9qaUHRzKdRGVNRg0Fih8GzX5jbP
	YQTGOo2FWDlTffHnVVvamHnt6obLmm/skiwsWgFKjykOnhriFwqciL6UJ9O4Wfc6dQ7QoO2ga6o7N
	QoWK9LuQ==;
Received: from oss by baldur.buserror.net with local (Exim 4.96)
	(envelope-from <oss@buserror.net>)
	id 1thEFY-00C5fM-1y;
	Sun, 09 Feb 2025 14:49:57 -0600
Date: Sun, 9 Feb 2025 14:49:56 -0600
From: Crystal Wood <oss@buserror.net>
To: j.ne@posteo.net
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	Krzysztof Kozlowski <krzk@kernel.org>, imx@lists.linux.dev,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>, Rob Herring <robh@kernel.org>,
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
	linux-mtd@lists.infradead.org, Li Yang <leoyang.li@nxp.com>,
	John Ogness <john.ogness@linutronix.de>
Message-ID: <Z6kU9G4u3BbBJn5p@buserror.net>
References: <20250207-ppcyaml-v2-0-8137b0c42526@posteo.net>
 <20250207-ppcyaml-v2-9-8137b0c42526@posteo.net>
 <Z6kQpuQf5m-bXTyt@buserror.net>
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
In-Reply-To: <Z6kQpuQf5m-bXTyt@buserror.net>
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Rcpt-To: j.ne@posteo.net, devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, krzk@kernel.org, imx@lists.linux.dev, maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, dlemoal@kernel.org, cassel@kernel.org, herbert@gondor.apana.org.au, davem@davemloft.net, lee@kernel.org, vkoul@kernel.org, lpieralisi@kernel.org, kw@linux.com, manivannan.sadhasivam@linaro.org, bhelgaas@google.com, j.neuschaefer@gmx.net, wim@linux-watchdog.org, linux@roeck-us.net, broonie@kernel.org, miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org, linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org, linux-pci@vger.kernel.org, linux-watchdog@vger.kernel.org, linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org, leoyang.li@nxp.com, john.ogness@linutronix.de
X-SA-Exim-Mail-From: oss@buserror.net
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
Subject: Re: [PATCH v2 09/12] dt-bindings: memory-controllers: Convert
 fsl,elbc to YAML
X-SA-Exim-Version: 4.2.1 (built Wed, 06 Jul 2022 17:57:39 +0000)
X-SA-Exim-Scanned: Yes (on baldur.buserror.net)

On Sun, Feb 09, 2025 at 02:31:35PM -0600, Crystal Wood wrote:
> On Fri, Feb 07, 2025 at 10:30:26PM +0100, J. Neuschäfer via B4 Relay wrote:
> > +        simple-periph@2,0 {
> > +            compatible = "fsl,elbc-gpcm-uio";
> > +            reg = <0x2 0x0 0x10000>;
> > +            elbc-gpcm-br = <0xfd810800>;
> > +            elbc-gpcm-or = <0xffff09f7>;
> > +        };
> 
> I know this isn't new, but... since we're using this as an example,
> where is the documentation for this fsl,elbc-gpcm-uio and
> elbc-gpcm-br/or?  What exactly is a simple-periph?
> 
> There are no in-tree device trees that use this either.  The bcsr
> node was actually a much more normal example, despite that particular
> platform having been removed.  There are other bcsr nodes that still
> exist that could be used instead.

OK, I noticed patch 10 after I sent this :-P

Seems I didn't like it too much when it was new either:
https://lkml.org/lkml/2014/12/9/530

And it's still a bad example for how GPCM devices on this bus should
normally be represented.

-Crystal

