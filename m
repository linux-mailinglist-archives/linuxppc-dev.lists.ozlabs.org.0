Return-Path: <linuxppc-dev+bounces-5850-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 481D0A27FA4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Feb 2025 00:34:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ynfph6xBQz30NP;
	Wed,  5 Feb 2025 10:34:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.67.36.65
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738712076;
	cv=none; b=iiiQqIDuUk55FvWkkbNRHVJ2+GfINuS8ZzFycAwvVMor+9Xk0Db7qzBQ0iu7kFHmB4U05Mx7WCofWiBPtW4AnpnHXr1CQQjboIbbCcohZnWUI7GI5kN7Xso7XCT9Bwa/WB64mJtESx97AyBGTr6JvdDvuFQLESeRuS4o6xd2pCtLwP8LOcUGJAQ7VlAIHw5LX38Z5cva1Bgye5b3N4SE2HzS1MCMzu5CspwioVFZ6rjz52k9OiW2bzDL1mpM5OoRfvHsq6I/Yksl43vr3ff/rqCX5B+RRSZe4C7iUsrrqRKdvCoqNwDu6CR9QFFZSqEUZ1LK24F3pCLkJMBUvHgBug==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738712076; c=relaxed/relaxed;
	bh=3FHL4pL5hRIQjRqgOl7fmqz04t/eMn2ruZMxdeEZJmw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NroJ5cMhgbKJkDKBzM5VYYVeLV99pyKNaIRJt/qTQD9nvDlIWWUS+Axet0klWP+7gEHtkzfPzO6XtMuwvgN7NODngcmuqjGVvAYWBWztVcHOEFFJZbjSgF7etZUoY0dvWS2YZvMY+aIYByBY2n9VebAlo00wguDefy7rlFxKvcib3M9HPOvtDlisjGyjNrSa64gRpdiTefoa36Cm9zr3hYkAK340NYdt5+3QKfT+/ljyeQYeKe1e1qmOBrjJ/ac7jTyuynUEmYLCsel4esGAgO/Jo8hcarlaAsXnomXI6uWxiXxv/jJ/MUkCwRYo0ownNxm8yfIcARoG54LxECXW/g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=posteo.net; dkim=pass (2048-bit key; secure) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=2017 header.b=X3B5ghUA; dkim-atps=neutral; spf=pass (client-ip=185.67.36.65; helo=mout01.posteo.de; envelope-from=j.ne@posteo.net; receiver=lists.ozlabs.org) smtp.mailfrom=posteo.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=2017 header.b=X3B5ghUA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=posteo.net (client-ip=185.67.36.65; helo=mout01.posteo.de; envelope-from=j.ne@posteo.net; receiver=lists.ozlabs.org)
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ynfph088Dz30MR
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Feb 2025 10:34:36 +1100 (AEDT)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 09454240027
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Feb 2025 00:34:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1738712072; bh=ZyVExCqzB2iyA3bGQRpDduhuvKS4WRQAEUDFtlqCUyc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=X3B5ghUATVfidVkzCioxvsw6PgUSFM99XhmDnCgGcqBgi0Mxvy4xniTB2fhNFRvch
	 0EUwiUBdnbgn9wJ9nSOC1btV8mIssMpkAJKCoJxN7jCQgbcwuov8HZ93D4DbplDk/d
	 mnpVbWwHz393REo7TCAc4dmTV7uk6iFEeeIRXS5mGbzAq05sAW+7LS9QFY3ZlNTMMQ
	 BQ8MQaN3Idt1zc4g41Ao6yolcJ2HgyJzxumslueoyQZvebdyjZmJ/FZ8G9aafEst79
	 eSrcFikp9vJoFKBJxJGvlk2lKoFbr6pEPmoV2u1fCnSsw8GB6n7MARUZj3iVG5K3h9
	 49NKOeUFcXYDw==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4YnfpX3DL2z6tyt;
	Wed,  5 Feb 2025 00:34:28 +0100 (CET)
Date: Tue,  4 Feb 2025 23:34:28 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: Frank Li <Frank.li@nxp.com>
Cc: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>,
	devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
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
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
	linux-ide@vger.kernel.org, linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH 6/9] dt-bindings: pci: Add fsl,mpc83xx-pcie bindings
Message-ID: <Z6KkBEaGTkSyWiE_@probook>
References: <20250126-ppcyaml-v1-0-50649f51c3dd@posteo.net>
 <20250126-ppcyaml-v1-6-50649f51c3dd@posteo.net>
 <Z5qx3jAFE81Ni2cJ@lizhi-Precision-Tower-5810>
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
In-Reply-To: <Z5qx3jAFE81Ni2cJ@lizhi-Precision-Tower-5810>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H5,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Jan 29, 2025 at 05:55:26PM -0500, Frank Li wrote:
> On Sun, Jan 26, 2025 at 07:59:01PM +0100, J. Neuschäfer wrote:
> > Supplement Documentation/devicetree/bindings/pci/fsl,pci.txt with a more
> > formal binding in YAML format.
> >
> > Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
> > ---
> >  .../devicetree/bindings/pci/fsl,mpc8xxx-pci.yaml   | 83 ++++++++++++++++++++++
> >  1 file changed, 83 insertions(+)
[...]
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +
> > +    pci1: pcie@e0009000 {
> 
> needn't label here

Will change.


Thanks,
J. Neuschäfer

