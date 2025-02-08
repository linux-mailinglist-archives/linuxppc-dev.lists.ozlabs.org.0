Return-Path: <linuxppc-dev+bounces-5972-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3E8A2D30F
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Feb 2025 03:21:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YqZMS49bvz30Nc;
	Sat,  8 Feb 2025 13:21:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.67.36.65
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738981268;
	cv=none; b=c2jW16Gz7NMNi2s3ncHkUEre0jcgVM/xhEkxaOSeEy/XU8NQI8SKx9+MRlPxfSMourErbnhVyOOoyT9XSJzYMlCpebeejgrnWviLR/aWVa6HggUgFHiEKaCzkkyWr/usfvhpeqkHQK+lHR92h04kuA1avCTGDpQhlFKOwpbl5B9VIMeChxh6vgQrpNSd8leCAqE8ZqUicpVH50/xDrrIKa04dbGd+PSB/fL5b/kaLPTEyObZDJJT50RDo7VwR/LNVCsywxVLb3dbrXkqG+66GBaJo71Yq9HJQipVIFjY+HtXfzEtrfkjC8ishAuzwbDiUUkyRCALJlU9O4L0qHmejg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738981268; c=relaxed/relaxed;
	bh=QhuxYzs6EPPLQd8hZgEhvMdJhL9zbzO3RueqpKHooa0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YsfwhSZFMMG5V/zge+bwpEBMlsQd1QbcAqUMVEATgSf3ZPeJh19wwPZH771e1Hv1lK9Cip9os2jT96seKSSM/Mx7SESdfRQndCovZIF7+PAyUXtZOY89RDVdKZsbUpVSILcHB0x9rGwcfvayOKxiAP1CMS+WGkZ+yF8PHDq4x6VTCbWhFuFjeFExOnpz85JWfoRrIq1MNS33zBnbWAEiPgsWoiPSiKv0nx+XX6TtCdn7fbLK5t505JrfZzl5v73pdI/Mot+Tg5Ch2jom/zCh3xL9Xd4RqHaRxyclBGiSXgkvOYw6H18Od19DVExbkyRwV4QXRIeAw2HNuL95gquKEQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=posteo.net; dkim=pass (2048-bit key; secure) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=2017 header.b=A78rJooZ; dkim-atps=neutral; spf=pass (client-ip=185.67.36.65; helo=mout01.posteo.de; envelope-from=j.ne@posteo.net; receiver=lists.ozlabs.org) smtp.mailfrom=posteo.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=2017 header.b=A78rJooZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=posteo.net (client-ip=185.67.36.65; helo=mout01.posteo.de; envelope-from=j.ne@posteo.net; receiver=lists.ozlabs.org)
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YqZML5ZgKz2ypW
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Feb 2025 13:21:00 +1100 (AEDT)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 22AED240027
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Feb 2025 03:20:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1738981254; bh=X/9UQWBS5m7Ib3mDDNhFlWLQ3zPrVaQFBwT1jLZLH3k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=A78rJooZN8UtN3+vX1NHzW5GxE8tztAy6ovu2FBjQcSf1io3nYqEo2OUdgj0cSrZE
	 VrdhXd4ZP4qXBfZrgzi6QaW6wT9eeBlkiqPhxEsQHOdzxlgkeh18AIiTNcI4i+f9Co
	 l3XGq4UzkfR7QDLqgAyXpGsC7M8JbHFHYvYKm0Kq9HfspPykKeNCwGEMlS4UK6ZpmO
	 bKKpcemYzXNkRt2e48In5cmQAdCxY2QWz1WyBAd0GdU9tfOJ64akKLXgWn3VPUN952
	 LHTWH0F7L3NRiUHEGq79kL+wKRk1yX5rk7zQFg1pb14Y6jxf39/8Cle2JYNi/49wzq
	 V6T7FV87eJSfw==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4YqZM431Sgz9rxL;
	Sat,  8 Feb 2025 03:20:48 +0100 (CET)
Date: Sat,  8 Feb 2025 02:20:47 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: Mark Brown <broonie@kernel.org>
Cc: j.ne@posteo.net, devicetree@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	Krzysztof Kozlowski <krzk@kernel.org>, imx@lists.linux.dev,
	Scott Wood <oss@buserror.net>,
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
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
	linux-ide@vger.kernel.org, linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 00/12] YAML conversion of several Freescale/PowerPC DT
 bindings
Message-ID: <Z6a_f03Ct9aB7Bbn@probook>
References: <20250207-ppcyaml-v2-0-8137b0c42526@posteo.net>
 <611e47da-ba87-4c21-a6b7-cf051dc88158@sirena.org.uk>
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
In-Reply-To: <611e47da-ba87-4c21-a6b7-cf051dc88158@sirena.org.uk>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H5,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Feb 07, 2025 at 09:38:05PM +0000, Mark Brown wrote:
> On Fri, Feb 07, 2025 at 10:30:17PM +0100, J. Neuschäfer via B4 Relay wrote:
> 
> > This is a spin-off of the series titled
> > "powerpc: MPC83xx cleanup and LANCOM NWAPP2 board".
> 
> > During the development of that series, it became clear that many
> > devicetree bindings for Freescale MPC8xxx platforms are still in the old
> > plain-text format, or don't exist at all, and in any case don't mention
> > all valid compatible strings.
> 
> What's the story with dependencies here - why is all this stuff in one
> series?

The patches are independent of each other, except for the four elbc/nand
patches. They are in the same series because they came up during the
same project and achieve similar goals, but it isn't necessary.


> Normally I'd expect bindings conversions to be standalone.

Noted.


J. Neuschäfer

