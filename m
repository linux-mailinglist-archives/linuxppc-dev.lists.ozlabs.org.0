Return-Path: <linuxppc-dev+bounces-5943-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB2FA2C3CC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Feb 2025 14:37:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YqFQF25PZz2yh2;
	Sat,  8 Feb 2025 00:37:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.67.36.65
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738935445;
	cv=none; b=fDRZ+I2Cd5grSKFjB6S6fvxMGyaGhHoTVzLRACMe5OAPDS11H1QAitoxPAe/hFUs8Lc2tcHcVX/6vzTym7AdAFLCOu+E7YW83fog5km2+B5udhy/q0SbUM5YJzTfdDzNzSMe7nvHgxrRA1rxLi95xMp64NbLhtTO689lATjunSAGanpAHwAkQGPiWemIiDa2g4RmGg9S9eFW0Vk4j6OoosS5AGsI7Atj80fuiL+bc55ZX9B/+cN84/UEJm4SgncJRLZO4dEakVyUmHm5kDaDJqmiQW1fC97IsiizP+iA7kPEPUMwgoLH8gslDQ8+dRbtaxBFbMPOJaxfmdKN+FveHw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738935445; c=relaxed/relaxed;
	bh=IdbOi6N0+bHgyQ08uTaIC9JomsdE+10WelxdSZmGp0A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IJ+igITDQUu78NvRJ0gFAjJjgAFs3Yf8rDl7DnFRzzJofdEjuIrwTq0K66+tjFq7IZOp3h64ej2KSAGnrIErDrVre9BHrM6rf8iiwDZ0774DPDSKuAbiU9/paGWNFBk2oqTgYD4mfI9wRZ4iZhyv0ckzSAv4lvYP+T/ub8twu2zQozVABCk2ietiWV/7AYJ3rUUERTiyOOugp3kyproBz4JIPgWDbS9DU6NwhjvQVZnql54LZGyiHw2vJ5z2WAf6zRkTyhsQ8ILUztA3ZEshrIFVBar1GzfC2qkf5Ap/olxm3ch2HdEz8T5ZHz2GeQRguPvNHcKdCzzWBch2ZI65vQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=posteo.net; dkim=pass (2048-bit key; secure) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=2017 header.b=DsxxJJur; dkim-atps=neutral; spf=pass (client-ip=185.67.36.65; helo=mout01.posteo.de; envelope-from=j.ne@posteo.net; receiver=lists.ozlabs.org) smtp.mailfrom=posteo.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=2017 header.b=DsxxJJur;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=posteo.net (client-ip=185.67.36.65; helo=mout01.posteo.de; envelope-from=j.ne@posteo.net; receiver=lists.ozlabs.org)
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YqFQC1kKCz2y8X
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Feb 2025 00:37:19 +1100 (AEDT)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 9EA97240027
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Feb 2025 14:37:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1738935432; bh=IdbOi6N0+bHgyQ08uTaIC9JomsdE+10WelxdSZmGp0A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=DsxxJJuriK7OP/3VAdpJyhOhoqIowUPkuVAs6bIe7RSHnrSQTmrd8/a1Pz3A6wfGk
	 wWBvQqRkfXbmrjUzJDJ7qee4Nx96J2fYuvMUgNF9+MRVjdPg0ygKTXHWT9QUgmaEiU
	 f2ZMTrVA6WyCwliBTXfACOYXbu5IpQAOLzMHbdyDQsMGMte9ag2XeoYgPJ11DGHzzZ
	 YI9B9h8pkDWmEnNuaW1rDdp+sLu0MCREo5AVPVKurrL3bOGq3FkN5/yoTx5fVxFB1W
	 AmgPoDINAPQX7MwC4V3xUd+MxEDsh65nfvE2xVC5HDdaKnXih39UhBaEcb6MnJcx47
	 qZeYjzYclbBpg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4YqFPs4w9Pz9rxF;
	Fri,  7 Feb 2025 14:37:05 +0100 (CET)
Date: Fri,  7 Feb 2025 13:37:04 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Cc: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Frank Li <Frank.li@nxp.com>, devicetree@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, Scott Wood <oss@buserror.net>,
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
Message-ID: <Z6YMgETdCZGMJI4i@probook>
References: <20250126-ppcyaml-v1-0-50649f51c3dd@posteo.net>
 <20250126-ppcyaml-v1-6-50649f51c3dd@posteo.net>
 <Z5qx3jAFE81Ni2cJ@lizhi-Precision-Tower-5810>
 <Z6KkBEaGTkSyWiE_@probook>
 <689302c6-8fba-4fd1-a4b7-557cb2f8fa4d@quicinc.com>
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
In-Reply-To: <689302c6-8fba-4fd1-a4b7-557cb2f8fa4d@quicinc.com>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H5,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Feb 06, 2025 at 06:12:47PM +0530, Mukesh Kumar Savaliya wrote:
> neat: subject: since binding is already mentioned in the prefix of the
> subject, no need to add bindings word again.

Sounds reasonable, thanks
J. Neuschäfer

