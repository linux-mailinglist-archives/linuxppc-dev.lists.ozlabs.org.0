Return-Path: <linuxppc-dev+bounces-6228-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4579A3767D
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 Feb 2025 19:12:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ywv5k21C7z2ynL;
	Mon, 17 Feb 2025 05:12:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.67.36.66
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739729562;
	cv=none; b=ICJs8b3qCa8sY11YKkyaG2om2GJekf1GFszUA4awEC7koeC1YBbgYviMoYJpzDpKzOZN7xLcw3ozU98o+mDg1COBPJG8IlqwPmOklW+z23rjB2P84PniKALFabc9Ho+9PDFB4VGjL9DpyqNPDI6vTbTT/+zewsa3Ma+kLETrhGuwzNwKJZafs1+rjoB4QZ2r/YmygNp683MQKeLcHbYqiOZBpNh8SrsN1nFEN9wl9Q4Ar0V3ZBzhQT5PxeeA9JYTLzmGB+PK0OTCkKTRkCWVfHyDyYLF/i+9WiZ/YU/tqL8tcIcv/XGelCAwHcdYns24ZEHZwtgmchduHwN/z0J4WA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739729562; c=relaxed/relaxed;
	bh=qVB8NN9vX12nDLgmhzMMrmEXyWXM/f/a7KCKShP/PqY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eIw5bDSkE7aubhXuQxbDqeuhk5rNhMzy4NDytLyFwuJc+kx9hNOXfCgdsE6lvPwOHA85mCuJ14hnmjTiSByIRTRcgjMfDrGUnaS5PqeVwVBrvUZM0QR3m+wXlzbQD0XbLL3Mk7tPPLrdCvxKHqTdG06ce2PHVR8sKVqNx0cDA0ZxYB/zu4ESUIJ0wgXw6Q0G1+MWLDRB7blfXIKpCQGkmDwbm3dAK0uD14vfCXQG15qj8/jkdlji4uL03UWSY2HaboSWQCc65IU9kWhaDuXJbsHGSj1ToE6VgOgXWMwLakTclVTEQQhUWpWAJoxKsMc30HY2A7uSRl5CrKiqspL3ww==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=posteo.net; dkim=pass (2048-bit key; secure) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=2017 header.b=I2rqNOjd; dkim-atps=neutral; spf=pass (client-ip=185.67.36.66; helo=mout02.posteo.de; envelope-from=j.ne@posteo.net; receiver=lists.ozlabs.org) smtp.mailfrom=posteo.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=2017 header.b=I2rqNOjd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=posteo.net (client-ip=185.67.36.66; helo=mout02.posteo.de; envelope-from=j.ne@posteo.net; receiver=lists.ozlabs.org)
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ywv5g6xV4z2xHT
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Feb 2025 05:12:37 +1100 (AEDT)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 0A276240101
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 Feb 2025 19:12:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1739729553; bh=YUqph/b4fBwdoaZ+voCpRWWS6XtVpDBsEp5ssxllxE8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=I2rqNOjdcHljXSahNd1ZyY1+Jeko7aYItS6qG2VPuES6zYiIWhqRSVnE8BLydEpDv
	 aLq85CwZoyDBj7rFL3VHID/Y26/KsHws2l3TQRADgbPXopdRfqB58AJuegtk6r/8XN
	 8afnoRm+hFAmSYG/1g5bkRtAEAZbE5nMzo9WOglSz7iWincbGhEHB+qkqm1GxeTB3d
	 ti9smVlnT3TLueMpPer3K7qcw2eEo7qKyVqU4g5aYhTM8DCQAlp2Pd349ndxqStfyu
	 o3RTGahp2nbfPe0C9tyv/vSevGTWFmLmuPCezUPIA2ymIg5oAhW4vDEDI9THNbzioJ
	 MDRQktyK6PajA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4Ywv5R2d3Hz9rxK;
	Sun, 16 Feb 2025 19:12:27 +0100 (CET)
Date: Sun, 16 Feb 2025 18:12:26 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= via B4 Relay <devnull+j.ne.posteo.net@kernel.org>,
	devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	Krzysztof Kozlowski <krzk@kernel.org>, j.ne@posteo.net,
	imx@lists.linux.dev, Scott Wood <oss@buserror.net>,
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
Message-ID: <Z7Iqir-qaZDt6tsx@probook>
References: <20250207-ppcyaml-v2-0-8137b0c42526@posteo.net>
 <20250207-ppcyaml-v2-12-8137b0c42526@posteo.net>
 <87o6zaurv9.fsf@bootlin.com>
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
In-Reply-To: <87o6zaurv9.fsf@bootlin.com>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Feb 10, 2025 at 09:27:22AM +0100, Miquel Raynal wrote:
> Hello,
> 
> On 07/02/2025 at 22:30:29 +01, J. Neuschäfer via B4 Relay <devnull+j.ne.posteo.net@kernel.org> wrote:
> 
> > From: "J. Neuschäfer" <j.ne@posteo.net>
> >
> > In some scenarios, such as under the Freescale eLBC bus, there are raw
> > NAND chips with a unit address that has a comma in it (cs,offset).
> > Relax the $nodename pattern in raw-nand-chip.yaml to allow such unit
> > addresses.
> 
> This is super specific to this controller, I'd rather avoid that in the
> main (shared) files. I believe you can force another node name in the
> controller's binding instead?

It's a bit tricky. AFAICS, when I declare a node name pattern in my
specific binding in addition to the generic binding, the result is that
both of them apply, so I can't relax stricter requirements:

# raw-nand-chip.yaml
properties:
  $nodename:
    pattern: "^nand@[a-f0-9]$"

# fsl,elbc-fcm-nand.yaml
properties:
  $nodename:
    pattern: "^nand@[a-f0-9](,[0-9a-f]*)?$"

# dtc
/.../fsl,elbc-fcm-nand.example.dtb:
nand@1,0: $nodename:0: 'nand@1,0' does not match '^nand@[a-f0-9]$'
        from schema $id:
	http://devicetree.org/schemas/mtd/fsl,elbc-fcm-nand.yaml#

(I changed the second pattern to nand-fail@... and dtc warned about it
 mismatching too.)

Perhaps I'm missing a DT-schema trick to override a value/pattern.

Alternatively (pending discussion on patch 11/12), I might end up not
referencing raw-nand-chip.yaml.


Best regards,
J. Neuschäfer

