Return-Path: <linuxppc-dev+bounces-5738-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA76A23D2B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jan 2025 12:34:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ykv122p7Rz30VV;
	Fri, 31 Jan 2025 22:33:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.67.36.65
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738323238;
	cv=none; b=cxNbC8Z2eJJIbuKRP50SqJ1/5TBGvVWWemMPSimwxHBOOhCJLSaJxT1sMw+cI9I/WOLl/cOqou5IAPVPCn0YCIbzFk3mj9zc1ObD0WOjRF+pSpVZZ80X5NLRTF5v14CPZa9FtvyGLgWvzNwWeuG98epm6J9TLeLjOB7Zewm+D5jGdLeg6Z4qah3Y7evKoxIfe8F8GBKj5t4+uEhk0FDSTXhI3kLy/5diN/6+0iPaAiSdCeK7Q6I7WuUqsU2rmhw8+zthDm1I6IYeEV1IaUKebjRWld8avT2ZID6xJ+P04uLCanWA0Pta976yHMw246ZaQT129wA66OmRzh16wOH9ew==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738323238; c=relaxed/relaxed;
	bh=qQs7oU43E7+3t4qOpoSVpFx4mhxfSchhsfuB9dh0v8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cVFRz/gF05wa+tJm8+wmeTAII0ylBds66mph6VcCIhcLcnyBycjJjYMwAFdURtIuWiURTofAzoa0Egtrizeb3GhFhRi057MVESSsu4BpSXQY6i8b2GKCEqpNreGBp1eDcd/UshxXImCJceObrM4w5xBIoLNfsf7z8YirTCyGg9P7MZmerwnsStdi5Rg7KLjmQncnbS/GmdUnaHica0Oc7liMEDYuXLcJKezVPXDLmtEzm53UWCIOr5Z+xEO54RoDeckQve8/VHtt5MAUy62n6UAZ6/sU6dJmNNc0DL4j/NxVgZ9kDXknqblG5/rxVfft2/k5IQba/i1MOyxkd4p2mw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=posteo.net; dkim=pass (2048-bit key; secure) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=2017 header.b=Yz9CI78/; dkim-atps=neutral; spf=pass (client-ip=185.67.36.65; helo=mout01.posteo.de; envelope-from=j.ne@posteo.net; receiver=lists.ozlabs.org) smtp.mailfrom=posteo.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=2017 header.b=Yz9CI78/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=posteo.net (client-ip=185.67.36.65; helo=mout01.posteo.de; envelope-from=j.ne@posteo.net; receiver=lists.ozlabs.org)
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ykv0y71kYz30MM
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Jan 2025 22:33:53 +1100 (AEDT)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id B1587240028
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Jan 2025 12:33:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1738323226; bh=476EBTGgcI5xdYOaJ6LQa3tfmwSruyF9mYzvA+HovWU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=Yz9CI78/fovWb2L5arMhqzICRpUn5PDCJglnqxot979BF/cz24B57yuu4aqG+WEsA
	 SwkGWcjgcrBU0WNZOH5ITMaS93rkXZ5MKtflImxIJt3OEmQhmszJJZmMatbXyhZ4bj
	 9eN6uGxkTzbO3lC3ZbMVIteudpPKS6+AdjcAQogx5QcbvxPI4VmDx8o1g4HJVTxM3n
	 wFVcW3I0tdDAt9EwDVnVPV8xr9ykgPT5lxzvCP/k4JSgJgzI22+ncddHWp5ZTvMMz0
	 Xps9MsPE2HzxePqW35oCBQWUWRgqSQV/OvOk7usYRAPfrme2gy7aX9OnJUFBT91Osg
	 whcxqOR2a8c7w==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4Ykv0g42F0z9rxF;
	Fri, 31 Jan 2025 12:33:39 +0100 (CET)
Date: Fri, 31 Jan 2025 11:33:39 +0000
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
Subject: Re: [PATCH 0/9] YAML conversion of several Freescale/PowerPC DT
 bindings
Message-ID: <Z5y1E6TUclqzV2Rp@probook>
References: <20250126-ppcyaml-v1-0-50649f51c3dd@posteo.net>
 <Z5qr1VkKSlyBE/E4@lizhi-Precision-Tower-5810>
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
In-Reply-To: <Z5qr1VkKSlyBE/E4@lizhi-Precision-Tower-5810>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H5,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Jan 29, 2025 at 05:29:41PM -0500, Frank Li wrote:
> On Sun, Jan 26, 2025 at 07:58:55PM +0100, J. Neuschäfer wrote:
> > This is a spin-off of the series titled
> > "powerpc: MPC83xx cleanup and LANCOM NWAPP2 board".
> >
> > During the development of that series, it became clear that many
> > devicetree bindings for Freescale MPC8xxx platforms are still in the old
> > plain-text format, or don't exist at all, and in any case don't mention
> > all valid compatible strings.
> >
> > Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
> 
> Please cc imx@lists.linux.dev next time
> 
> Frank

Will do.

Best regards,
J. Neuschäfer

