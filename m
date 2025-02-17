Return-Path: <linuxppc-dev+bounces-6263-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51289A37FE3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Feb 2025 11:22:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YxJcN5lRbz30J8;
	Mon, 17 Feb 2025 21:22:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.67.36.65
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739787732;
	cv=none; b=PYgmK9DIqJ96Ef0wF9ILcu9yvIUGhsBX8to1WcGp1+JBwttIc0UzYIbY34YsBJLPna0UAtMLKq9p/SsJyUHKzsCK8tbZHqvgkYMNNAppvcaIyHqunMbA5LB7IRrr4Bo6Nt/Nw4u19cFd9ldHyUUMCVatdrbS2enbYikUugixEkQu52Wms1skj+sc3i33ZPzugEtPvPzu1xwij9R+X2neqxYLLV3OUNR4bG933Su0sXJyB0YoggBlRhuC65gjkboWkzDC22Q7ZPiFzbm6H7e2VdY3cU4PUFOqNohGKzkeKjgeivFPqHGonXHHhgGatrpitQuaPKAiuWyT8/P9qCh6nw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739787732; c=relaxed/relaxed;
	bh=zhBfujmQzIaxtI47HYD4ign05XCFB5c7QtBDmhkRVQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fde7Iyuym+XxUriMpmBNh0e72ok1VREx0ZT7sMYEm7Kuq/OnW05UVc0seYmdPL1dIXLHsx8PxqLGOWkNuldmm9spYDv9rSB/fIu5fQ2y6oIrt947uUhv1zX3uCffCGewXo9uq2SWw1Gxzzo28fzw/dgUQXF/U/B1LViDixb/Mp0EnwERfdeDe02TPYnGI7Y0cEvpljREpau9Mp9C7iYt7JBfe5V9kAFuFnMnHBN2Ypk/vYHWfJIBBWzWmoecWekAUWJwfrVnSVCbS8EqL1y8KKNPFmRXbu6r40RYVAC3OFhYOAo1t+gVCar/fMHqb5fwc2niXruX5vUtZMiFKUzBnw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=posteo.net; dkim=pass (2048-bit key; secure) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=2017 header.b=OcunxjnO; dkim-atps=neutral; spf=pass (client-ip=185.67.36.65; helo=mout01.posteo.de; envelope-from=j.ne@posteo.net; receiver=lists.ozlabs.org) smtp.mailfrom=posteo.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=2017 header.b=OcunxjnO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=posteo.net (client-ip=185.67.36.65; helo=mout01.posteo.de; envelope-from=j.ne@posteo.net; receiver=lists.ozlabs.org)
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YxJcK2vVgz2yyD
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Feb 2025 21:22:05 +1100 (AEDT)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 764A7240028
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Feb 2025 11:21:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1739787719; bh=jMs/nQgZnmKABPkw9jqt7Jfzzk1OWmU8OV/13GG2QpU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=OcunxjnORlls5HLQbw14IA4MVC0/PZttQcN6Xb1njtYLh9w3V2EzoXxfu1MbezZOa
	 igGczDarQ/HAUaLFutWSSVZmdEUTnRAvvfR4P29OCnKFzGDj486rRUdkvaH84i6NBo
	 UtVpi15+ffpeSxsw3G6Oqlzj3zI0D1KYiw/3TmXPUi6gTvtiqgj/cZnkaLv/OUhc1E
	 fsfgehBww1B2wODO2LaG6+zR8u0MupCI7OX6eePtCGNrHO9DmG7c5+355HtJddRiI9
	 /P2b99by5o6+cqPVP5GNceuHNR2zkqz2Mw/VyF9apCBj1axPsoJPrTYEN9rsaqNlEj
	 BgJ/ZZr20v4Ug==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4YxJc00sngz9rxD;
	Mon, 17 Feb 2025 11:21:51 +0100 (CET)
Date: Mon, 17 Feb 2025 10:21:51 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>,
	=?utf-8?Q?J=2E_Neusch=C3=A4fer?= via B4 Relay <devnull+j.ne.posteo.net@kernel.org>,
	devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
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
	=?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Mark Brown <broonie@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
	linux-ide@vger.kernel.org, linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 12/12] dt-bindings: mtd: raw-nand-chip: Relax node
 name pattern
Message-ID: <Z7MNv4NX8dSztdsP@probook>
References: <20250207-ppcyaml-v2-0-8137b0c42526@posteo.net>
 <20250207-ppcyaml-v2-12-8137b0c42526@posteo.net>
 <87o6zaurv9.fsf@bootlin.com>
 <Z7Iqir-qaZDt6tsx@probook>
 <87tt8svrxf.fsf@bootlin.com>
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
In-Reply-To: <87tt8svrxf.fsf@bootlin.com>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H5,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Feb 17, 2025 at 10:31:08AM +0100, Miquel Raynal wrote:
> Hello,
> 
> >> > In some scenarios, such as under the Freescale eLBC bus, there are raw
> >> > NAND chips with a unit address that has a comma in it (cs,offset).
> >> > Relax the $nodename pattern in raw-nand-chip.yaml to allow such unit
> >> > addresses.
> >> 
> >> This is super specific to this controller, I'd rather avoid that in the
> >> main (shared) files. I believe you can force another node name in the
> >> controller's binding instead?
> >
> > It's a bit tricky. AFAICS, when I declare a node name pattern in my
> > specific binding in addition to the generic binding, the result is that
> > both of them apply, so I can't relax stricter requirements:
> >
> > # raw-nand-chip.yaml
> > properties:
> >   $nodename:
> >     pattern: "^nand@[a-f0-9]$"
> >
> > # fsl,elbc-fcm-nand.yaml
> > properties:
> >   $nodename:
> >     pattern: "^nand@[a-f0-9](,[0-9a-f]*)?$"
> 
> Well, I guess this is creating a second possible node name.
> 
> > # dtc
> > /.../fsl,elbc-fcm-nand.example.dtb:
> > nand@1,0: $nodename:0: 'nand@1,0' does not match '^nand@[a-f0-9]$'
> >         from schema $id:
> > 	http://devicetree.org/schemas/mtd/fsl,elbc-fcm-nand.yaml#
> 
> What about fixing the DT instead?

In this particular context under the Freescale eLBC ("enhanced Local Bus
Controller"), nand@1,0 makes complete sense, because it refers to chip
select 1, offset 0. The eLBC binding (which has existed without YAML
formalization for a long time) specifies that each device address
includes a chip select and a base address under that CS.

The alternative of spelling it as nand@100000000 makes readability
strictly worse (IMO).

Due to the conflicting requirements of keeping compatibility with
historic device trees and complying with modern DT conventions,
I'm already ignoring a validation warning from dtc, which suggests to
use nand@100000000 instead of nand@1,0 because the eLBC bus has
historically been specified with compatible = ..., "simple-bus",
so I guess the fsl,elbc-fcm-nand binding can't be perfect anyway.

In any case, I'll drop this patch during further development.


Thank you for your inputs,

J. Neuschäfer

