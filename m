Return-Path: <linuxppc-dev+bounces-6163-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF50A35422
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Feb 2025 03:04:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YvFjH52msz30Sy;
	Fri, 14 Feb 2025 13:04:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.67.36.66
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739498659;
	cv=none; b=IWBO24OxH1u8dFkcKTC/eGXv35HQj976dCpu4y9BJ8ttrn4SHby2O83Q3XVFRYbwZz4lY75qz08l4Noty4hKHKd8l1rxnG/E4hWvjJ5COL3njRS6Ml9yjf5qrmEJ3xi6bCRfApNbOahzTkwqnFj/F/XmS0ILpslFuITKJ54m5+FJ/RImkmvHgjkkQxfKc4icbC5AIUDPvhszj/5RpYJL+QqrcK3J2gc1pw537UB2ZiUUsfl5PxGC55I9eblwJUIGqT8rHmawTE1GHR5S0XhloAMqzkyqNJLT/UGHs7oPRxLTOLLNgceDsF+kuzchRyoZW5Tx0YYsk1Cric4A8yTy7g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739498659; c=relaxed/relaxed;
	bh=EAIg7P9NijZgjwq+VDVW+hbvRMb79rSCrOfw1wR+Kr0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W7wSlMQqJWDbeglq3aZEYKBTFTQOFAg11pmCreygGAWM7b0M/ZX/Nqb285QLYQt1KU4y2TMkE+1tAxJ3ereIaD0N5WfEI3p9LgxqNLz9xF5fU2RBGZ60bOqX52NV2Jy3ZqLSsOkHl/SEWm16/b2ZRA0OPg+/n4ywHtnmU0u9vDS0geZ9gNoZBO6R6V+HNCnKp3GxwShF7ktDOQxU7ADxLtF0rIoZzb3VyRtkXNZD+evhY01anGBQsFz2+7BnjFGfdYtLOSvuyiANzJL9808zCKwBdTlJS9mzt68++csHK95TXtOGL4x2Xz0uk402rwCWzofuaZVaSwC5C7zUHKdXIw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=posteo.net; dkim=pass (2048-bit key; secure) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=2017 header.b=C9aC+pKo; dkim-atps=neutral; spf=pass (client-ip=185.67.36.66; helo=mout02.posteo.de; envelope-from=j.ne@posteo.net; receiver=lists.ozlabs.org) smtp.mailfrom=posteo.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=2017 header.b=C9aC+pKo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=posteo.net (client-ip=185.67.36.66; helo=mout02.posteo.de; envelope-from=j.ne@posteo.net; receiver=lists.ozlabs.org)
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YvFjF0Ypwz2xjL
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Feb 2025 13:04:15 +1100 (AEDT)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 1B91D240103
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Feb 2025 03:04:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1739498649; bh=WhJmekLyQeapuWa9J6WUco9/aFXXshTQJPKudksd1Lo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=C9aC+pKotBYDBvwHbTDmEtOZK2Ra+f7bAYQUvCM/dtbWfMsQsGWZeEeLwJx9349oL
	 VxAMuJYr8FI+lA2ZTwXdk1IHX8nxBWiIDWcaKSKQ2tfVREADwwe6KiERJCt8BKkoBU
	 bGHbtXZ2beiPazOifUexm8mkWOOGP5rxS8iFWrcTZKzehaUBbKSpAQfJmIABYJp2oA
	 mtnZUD0G1r1VMuy8HKzuxK15FKZNo/eieV5v3tmYwVsxcTFZ9kM/w2JcFmiiEa/Hw5
	 pBJm8Hy6SO+D2nmLRNTdzOzXsFvlGdE4b4eqbYvNh97fXyQ5mP91+yuXP2h75bCoyt
	 FQQyOSPQmdtcA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4YvFhy67kgz9rxF;
	Fri, 14 Feb 2025 03:04:02 +0100 (CET)
Date: Fri, 14 Feb 2025 02:04:02 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: Rob Herring <robh@kernel.org>
Cc: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>,
	devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	Krzysztof Kozlowski <krzk@kernel.org>, imx@lists.linux.dev,
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
Subject: Re: [PATCH v2 03/12] dt-bindings: crypto: Convert fsl,sec-2.0 to YAML
Message-ID: <Z66kksKzsknmOy5Q@probook>
References: <20250207-ppcyaml-v2-0-8137b0c42526@posteo.net>
 <20250207-ppcyaml-v2-3-8137b0c42526@posteo.net>
 <20250212193314.GA4134845-robh@kernel.org>
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
In-Reply-To: <20250212193314.GA4134845-robh@kernel.org>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Feb 12, 2025 at 01:33:14PM -0600, Rob Herring wrote:
> On Fri, Feb 07, 2025 at 10:30:20PM +0100, J. Neuschäfer wrote:
> > Convert the Freescale security engine (crypto accelerator) binding from
> > text form to YAML. The list of compatible strings reflects what was
> > previously described in prose; not all combinations occur in existing
> > devicetrees.
> > 
> > Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
> > ---
> > 
> > V2:
> > - several improvements suggested by Rob Herring:
> >   - remove unnecessary multiline markers
> >   - constrain fsl,num-channels to enum: [1,4]
> >   - constrain fsl,channel-fifo-len to plausible limits
> >   - constrain fsl,exec-units-mask to maximum=0xfff
> > - trim subject line (remove "binding")
> > ---
> >  .../devicetree/bindings/crypto/fsl,sec2.0.yaml     | 142 +++++++++++++++++++++
> >  .../devicetree/bindings/crypto/fsl-sec2.txt        |  65 ----------
> >  2 files changed, 142 insertions(+), 65 deletions(-)
[...]
> > +title: Freescale SoC SEC Security Engines versions 1.x-2.x-3.x
> > +
> > +maintainers:
> > +  - J. Neuschäfer <j.ne@posteo.net.
> 
> missing >

Good catch, will fix.


> > +  fsl,descriptor-types-mask:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: |
> > +      The bitmask representing what descriptors are available. Descriptor type
> > +      information should be encoded following the SEC's Descriptor Header Dword
> > +      DESC_TYPE field documentation, i.e. as follows:
> > +
> > +        bit 0  = set if SEC supports the aesu_ctr_nonsnoop desc. type
> > +        bit 1  = set if SEC supports the ipsec_esp descriptor type
> > +        bit 2  = set if SEC supports the common_nonsnoop desc. type
> > +        bit 3  = set if SEC supports the 802.11i AES ccmp desc. type
> > +        bit 4  = set if SEC supports the hmac_snoop_no_afeu desc. type
> > +        bit 5  = set if SEC supports the srtp descriptor type
> > +        bit 6  = set if SEC supports the non_hmac_snoop_no_afeu desc.type
> > +        bit 7  = set if SEC supports the pkeu_assemble descriptor type
> > +        bit 8  = set if SEC supports the aesu_key_expand_output desc.type
> > +        bit 9  = set if SEC supports the pkeu_ptmul descriptor type
> > +        bit 10 = set if SEC supports the common_nonsnoop_afeu desc. type
> > +        bit 11 = set if SEC supports the pkeu_ptadd_dbl descriptor type
> 
> Why 3 variations of 'descriptor type'?

The reasons have been lost in time, I suppose. I'll normalize the spelling.


Thanks,
J. Neuschäfer

