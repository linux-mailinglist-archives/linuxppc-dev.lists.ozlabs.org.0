Return-Path: <linuxppc-dev+bounces-6006-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F76A2DF8B
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Feb 2025 18:45:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YrZqr3Gkqz2yLJ;
	Mon, 10 Feb 2025 04:45:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.67.36.65
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739123144;
	cv=none; b=GsKc7+HTRI1llYAR67z5XFqbqkeJzSkU6+53n4RBsLMMB0SYgIkRbzVgQzHMHepukBKvFyhLTTa9vrlaY09V1Nk4tf2Ej3aqdMFCXdJvX4mP6C2rk6qBGCGlYq2uh5Fj6r8BQOFzCYxOlQXf3n0i/qCt/70gvjFEEd1ixgXM3dJb/xb8wSCknJmuee/g6Jd8z++eP8YAwxQwEbQnKeHyO6cE3r2ssFp86Q0P1U+sxvesWALjLkbEfz8kBjsKonbk80uZqs5Mgyp8LaQTfO969fgseDAQL/JDAd+RSci5/xa0Pu83+UjsQoelErXUo8BAtWn7EsbjEjRWQlpWrTmb9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739123144; c=relaxed/relaxed;
	bh=aKJiNvl4OtxHwe/jC/7dAguFKhAdY0zfct0XRINhm44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TgZfrBqMIYkyIUHlQvrP4sAmhzwUa/F74ijOaap2pvF/SpnC/WMzddh6UhwFC0m9kGIof2gPMx3Go7mW5ZK1qv6JUvq+PX/hqvx6K0TTkclaAnWD/NQkvnPf8kYiQ5ekIKgd6lw5vI4fuhDgtCZjlj+56MmhmxNrSdm7mGslweIhZeolGnnffKq8RSkrdrSuukX024kSUURAMiflAMMe6+d8+9i5PhY3TKHfKB46H/Dq03llt2wiMfhi8INpSnoydutSw1qjYyiylv8bRKSGXFlSmyBcIMgV9eWUwCZSoO4SgjwSi2XkpoT5LtIUH4UlspjoojjVcTh8dGPAoHDWRQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=posteo.net; dkim=pass (2048-bit key; secure) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=2017 header.b=pFQz+Mcg; dkim-atps=neutral; spf=pass (client-ip=185.67.36.65; helo=mout01.posteo.de; envelope-from=j.ne@posteo.net; receiver=lists.ozlabs.org) smtp.mailfrom=posteo.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=2017 header.b=pFQz+Mcg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=posteo.net (client-ip=185.67.36.65; helo=mout01.posteo.de; envelope-from=j.ne@posteo.net; receiver=lists.ozlabs.org)
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YrZql5QC3z2xjd
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Feb 2025 04:45:39 +1100 (AEDT)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id A9020240027
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Feb 2025 18:45:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1739123132; bh=wwaN1MEN5EN7ialSuuoReLLWAW4uA92LExoXB3rQqdE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=pFQz+McgXOD4SJpqS3t88fYmh0f5343D1MX9fCQZ5W5ZdV5d90NJnQIiHn4PjdCht
	 jpzs5EMtNx/SAOBHAvluntIEwLOprerzu70UzAecNitIGH8k0ZnZrhUFsPPYt30bPa
	 5W++llA90llvNmYGZGg6pjdtnttlirT0AnVYIO3h/V52Nxuo2QcmZfdHQ5yO7Q21SW
	 jvIRtzOr5XZUGt9zXBs5HlCATqYCjE2JIiSc7GPY4SJyuH2VUSeO6sOP/akjsfoNL7
	 NQWpd+m9PlYAgJGrD6+VmVwjqa+7KOvmx5tud7mokjtobj+GT1nLVBwQhE74lhhlhe
	 V93cWZaX8J0/A==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4YrZqX2D0Mz9rxK;
	Sun,  9 Feb 2025 18:45:28 +0100 (CET)
Date: Sun,  9 Feb 2025 17:45:27 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-ide@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	linux-crypto@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	dmaengine@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>,
	linuxppc-dev@lists.ozlabs.org, linux-spi@vger.kernel.org,
	=?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	Guenter Roeck <linux@roeck-us.net>,
	Nicholas Piggin <npiggin@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Naveen N Rao <naveen@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>, imx@lists.linux.dev,
	Niklas Cassel <cassel@kernel.org>, Scott Wood <oss@buserror.net>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Richard Weinberger <richard@nod.at>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Lee Jones <lee@kernel.org>, linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-mtd@lists.infradead.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-kernel@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-pci@vger.kernel.org
Subject: Re: [PATCH v2 09/12] dt-bindings: memory-controllers: Convert
 fsl,elbc to YAML
Message-ID: <Z6jptzP7KLxmIJeL@probook>
References: <20250207-ppcyaml-v2-0-8137b0c42526@posteo.net>
 <20250207-ppcyaml-v2-9-8137b0c42526@posteo.net>
 <173897189669.2630636.11579554304003668196.robh@kernel.org>
 <Z6jlrU7EPeATjK8s@probook>
 <4c41a8e2-b097-4b95-ba0a-115dbbfc4e1a@kernel.org>
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
In-Reply-To: <4c41a8e2-b097-4b95-ba0a-115dbbfc4e1a@kernel.org>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H5,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sun, Feb 09, 2025 at 06:30:44PM +0100, Krzysztof Kozlowski wrote:
> On 09/02/2025 18:28, J. Neuschäfer wrote:
> > On Fri, Feb 07, 2025 at 05:44:59PM -0600, Rob Herring (Arm) wrote:
> >> On Fri, 07 Feb 2025 22:30:26 +0100, J. Neuschäfer wrote:
> > [...]
> >>>  .../bindings/memory-controllers/fsl,elbc.yaml      | 146 +++++++++++++++++++++
> >>>  .../devicetree/bindings/powerpc/fsl/lbc.txt        |  43 ------
> >>>  2 files changed, 146 insertions(+), 43 deletions(-)
> > [...]
> >> dtschema/dtc warnings/errors:
> >> Documentation/devicetree/bindings/memory-controllers/fsl,elbc.example.dtb: /example-0/localbus@f0010100/simple-periph@2,0: failed to match any schema with compatible: ['fsl,elbc-gpcm-uio']
> >> Documentation/devicetree/bindings/memory-controllers/fsl,elbc.example.dtb: /example-1/localbus@e0005000/nand@1,0: failed to match any schema with compatible: ['fsl,mpc8315-fcm-nand', 'fsl,elbc-fcm-nand']
> >> Documentation/devicetree/bindings/memory-controllers/fsl,elbc.example.dtb: /example-1/localbus@e0005000/nand@1,0: failed to match any schema with compatible: ['fsl,mpc8315-fcm-nand', 'fsl,elbc-fcm-nand']
> > 
> > I think this is due to how the patches are ordered in the series.
> 
> If that's possible, this should be fixed, e.g.  by re-ordering the patches.

Yes, I'll do that for the next iteration


Best regards,
J. Neuschäfer

