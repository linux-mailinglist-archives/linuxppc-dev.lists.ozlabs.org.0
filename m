Return-Path: <linuxppc-dev+bounces-5698-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A227AA22675
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2025 23:53:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yjy9Y2JW2z30Q3;
	Thu, 30 Jan 2025 09:53:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip="2a01:111:f403:2612::612"
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738191185;
	cv=fail; b=luDS6DsEWjDI6XnONIIEfnnQT7XmTQRnLc4TxXgRG5BY7QrdV1wZdwJBZh2YMPo0wshgX0QJMk3Fh97yVQauH0KPEEdLnLzpflxufw3BLuKXpTEXAH05sZugXKxGiotpBLJ8JMUBPsc3Zu0+OUMtv4NgoH3EvhmLLYx3iriVdQxYw9SJEDx17+XKK9w8MZ51ljBlgAXsL22UtT+Zt4X2QbBspatp4mgkfZ5dx0fylEUtM85VWdqqn0hLBcL0aPj9bBP0K3Te6r/q5c/JRWknPdsxq0emVEoXp0iqJqulzHquWuhv/jzxSWRiKJCDdzZ/HN3gBaskwhFB3WoMXEHprg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738191185; c=relaxed/relaxed;
	bh=U1VcafojalOq7yBsnAl+X4ImjvbskEpOSxzPHw6+KTw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=mnF+LGtoWJb9Hsa1OEIBRBc3VfZyW1bCdRUsElvDNPXIh6u3Ayg6gM9PT8+ONAlq0QmOWy6bEyh+mu46G/pfmO17HdKGOhAK+HtX1THCOpphWiSbMku9VonEfYbvwdMIv6QEGcnhiNOT/mGk8C+Yt6yjQfdDFXCmtOZDICKGxjQpGM9D9Sr9MWTcXe0OFzhdMIL7TUMI037qXzg1/XuH33+wgYmCNBQn8R2vYcYqkL2MLiZHZgyL4TFDn/QnGD4xHgZZud2FOMBAN76FLz3+GNYTaGqCD8em7Vagp5U3xw1KgTJhctrwS2WxTluGu6G6pIJvbA367kvUvEtr3rAlUQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=nxp.com; dkim=fail (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=Jf4XF8VZ reason="signature verification failed"; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2612::612; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=Jf4XF8VZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2612::612; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on20612.outbound.protection.outlook.com [IPv6:2a01:111:f403:2612::612])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yjy9X0Msfz30NP
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jan 2025 09:53:03 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HbxQgZhxI1d4WPHmJz1+QYn89OfhllpL9eBiEBLFqTaLkUupfDSLTzDOSLpZYficJCP1qSs0J3yhXwCha9B1cVmkz5lThWNwO1YOmHH3C/PTxKIYTgsKzynPU2RT3z3DrcEQZszIRt1JuCqSTyERMml3t47rPPpJdFer4LuIiBnI3UxR6dE+zKxi6fErY5baGH2Ddqo6H9ahGTCUCGOH+u4gqkjsoj7UxPOF3owOPWGkUxVaqAGBjXJqF98SwEz+MGSModSuaZ1tyo5VEouqDabiv1jNnl964u3ZQhNwsRf5awj+/AzrUr7SxaBpa60OGgME+i1jYssh2R6JsYvdKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TDrtkvHypkByOE371wT8Cyn/RWGp/oe5mZ0SFjdAZhY=;
 b=ZPAJ0lkkPIsvYaeb71iMmyYOG0Nb/LMpyjXedf19myfvcu6vsDNMlPAeCPem4DvdP+H/f0P+d+z3RU5E8PwQS/REehtwSZuy0Laf48pYfLIarx8oWtEjvy0r0t0g149s1wm/qpC41uwHnc5vGw6R4QFrdTZfWfnV3nHbM2Q1DRMVEaT+aL0Oa5fLIx8KhAZjV80P6bCRPO2M6O0euHxV1BHqk/l3+z9cYe4tGI652/7X+L7yHGcBqU2SZTsZw0wejJbJKUonSB8vrnWmjO9wvKaqa0uGi/66emw4nE/txiUs7djoj2Zw/hhvPmcSCq82zMBKC/GuaEFlH1P9EfxVcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TDrtkvHypkByOE371wT8Cyn/RWGp/oe5mZ0SFjdAZhY=;
 b=Jf4XF8VZDUqbuy6na9Zwl95DJtqwhdnuksakBJdwBDxTK/gRRFxQVWdglCK5uYMCkx/m2C+yvHKFfvfW25w2s+LWUcLP1zAIDUz2YlrciuBgUltwL/tnmlOSlDE8itA6f7n9sD/7GXAWHTUFHJTRgoXqYKzY2mhF5WnqstrRda/VA6liHgwQLxuCe+mAGjDUXQRHREZo2sYEuHEAlY4vJfvOqg1MlD2GaRvl5lbSbm32F5YdM7ehdP65LEJLtdYE65mJ4z5vt10kxC1WNaAd9gZFQoUiQtd7e5jytbjwpobSIE7L3Cw0TjVIbBt09PrrKVQyKY+8mHzDW7bsBOt2Sw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU6PR04MB11207.eurprd04.prod.outlook.com (2603:10a6:10:5c2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.17; Wed, 29 Jan
 2025 22:52:44 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8377.021; Wed, 29 Jan 2025
 22:52:44 +0000
Date: Wed, 29 Jan 2025 17:52:31 -0500
From: Frank Li <Frank.li@nxp.com>
To: =?iso-8859-1?Q?J=2E_Neusch=E4fer?= <j.ne@posteo.net>
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
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
Subject: Re: [PATCH 5/9] dt-bindings: dma: Convert fsl,elo*-dma bindings to
 YAML
Message-ID: <Z5qxLxa7z22Fk+Dv@lizhi-Precision-Tower-5810>
References: <20250126-ppcyaml-v1-0-50649f51c3dd@posteo.net>
 <20250126-ppcyaml-v1-5-50649f51c3dd@posteo.net>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250126-ppcyaml-v1-5-50649f51c3dd@posteo.net>
X-ClientProxiedBy: BYAPR07CA0104.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::45) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
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
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU6PR04MB11207:EE_
X-MS-Office365-Filtering-Correlation-Id: c69ffaee-cc9b-40a6-cc88-08dd40b7a4b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|13003099007|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?8p6kwKhMLhSDFHVWkRcSTV2x1/Xx8MLGUveeU0X6AVYT1bZyFW1B5yApwj?=
 =?iso-8859-1?Q?koZQQoGK+VnskoBTEJ2XJ4lKiTRu8O1Tk1XoHSllWd9MTGUKv4+yQA/ZQh?=
 =?iso-8859-1?Q?cLWqKq/9iBB0foRCVisDK8ekN8DvfzbXIAx3YDKQ5Qo9GU9ZHW3gMIwKJV?=
 =?iso-8859-1?Q?p4TlWhrgReQpPXfPGBLL1YJa2YK5KXQqsyks3ZDYCpcH/U3ybOaJyH8jz0?=
 =?iso-8859-1?Q?2q/1tVgo9Ckkt8IsPN/9jWQc53stEiw4RQuTa4yAPHjk93WaJ9VvdhbcM5?=
 =?iso-8859-1?Q?PDootBZN30W8zzp3ZgfeZ5QZyWKMvptyiFy3KUdqlXnM7lQC2PnL0aTN8i?=
 =?iso-8859-1?Q?5FbTjeNtk2hrMbgYeTN0y0ZZFEJ+92ZS37yoxiD0ixXp3mEhwpDeeFFm/m?=
 =?iso-8859-1?Q?pq3MqIRzx7e6NJ7SLWGm217DsMwLHpXf4guWZH0KvAk4NE3qpHT4/E/ZrP?=
 =?iso-8859-1?Q?DLDfaqO5tKrYhUYaEwJYM3PIEw1yIy2PSIdpnVNcXwvV4+W9b1W8JAh9SA?=
 =?iso-8859-1?Q?No9LhKuJd07ZO9lPHfHfXZKbz0uewokGoCx2MTfsfFdwzF4728sSMLIRq3?=
 =?iso-8859-1?Q?9kpsGXobAg4+dHsLcjVwRP1kDWp8ZcnjrnS0ogpJDmRdkBWQlaGwCHp/MN?=
 =?iso-8859-1?Q?e+wLrGrlSoXickknmTx3ViF1befoce18gUj4CZznOX8zjeiy4YT203hmhE?=
 =?iso-8859-1?Q?ORQwsuZT+J3UF3RLMYAYMh5YPg6B/au6uLbR6PVJKZw0KWyUHnqW6fzKz7?=
 =?iso-8859-1?Q?7puHedg5GGkQV6/l9/L1bEQNK+3Xa6Xfqw8hU9uZWpwcATayj2hV0LTt41?=
 =?iso-8859-1?Q?p4ytCtR1/1Lbxb+KMeodWNLTyZ9s5B+nDIfCvwqY6IGpmnytKXKcYRiTqk?=
 =?iso-8859-1?Q?Cn5C1QhITeZ55qPNEnpvEWrAW/1NqeexLLNKSPLXQAb6RmWp183NOAHpXq?=
 =?iso-8859-1?Q?pNZ39Wpf2raxQ4BvkX7TRHV0vl/kwhtjrAcFHiIYToIq16vVbzSovnsICp?=
 =?iso-8859-1?Q?tSj91Bc/PXhwVXviEhAQwVJBcpqZ1fuLKDMABJPiFp4qPf/INus0o7s9qM?=
 =?iso-8859-1?Q?MaGMEXV/Ohz5rndUAgSjqMcnzQaJgsLx2etXn+03eMSyWeUqObf3cSENQd?=
 =?iso-8859-1?Q?ZVHEvwX5Aul/l8HHmMwYILTpObS8kfOaOquKc9Z+TMQcTmRtVNbo7CV4x8?=
 =?iso-8859-1?Q?c6+Rxu5WJqqx4aWWWpDT6wLvi9KLc8b/FD6N5G3Yopjln3fhWkXf6i64l8?=
 =?iso-8859-1?Q?p5vXbqQw3ZgoNVYcVFw8/IQsdHAqcEgpzZli49oFMRWIfLP3IgqHbfDLJ1?=
 =?iso-8859-1?Q?09zOH34EJZ46Rk+kFEkJSa9eUhvODnuHiuQDCKBKY2eMQcvPJEGCfmdf9l?=
 =?iso-8859-1?Q?qApn/U/02iO/sF+7U9p+7LvwpJUAmSKBBRuhEksu3JROWPCgicIThvdiDH?=
 =?iso-8859-1?Q?pJHW80mTGi9FfQA5?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(13003099007)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?QzGQVj4zcXUOzghcIVHti/NXMOtdQJneCnpRWz21dJ+9XKVgZI8XUn+2oW?=
 =?iso-8859-1?Q?xVKuMJZqB5UGOfiTsDmx8Zbt3WRtKd//xYgtzwULcduJ5o/JTs/TH7kwE7?=
 =?iso-8859-1?Q?nwQN5FWghifjwXqAmmXFiZnWGhHJkbgXEtMGd19uFL2ke+cGwDb+21/hCY?=
 =?iso-8859-1?Q?ktcV9//uGSLzIp+DBhy7n40/LSnWm1+bUc71A+50ZZC0wpgycHYajKPgZq?=
 =?iso-8859-1?Q?roh1exsx3j8AjjA4SSykaOebODDhsu6DI59e+8VAe8RrjkoQv10ATxuxOL?=
 =?iso-8859-1?Q?WDEhgthhGN/RM2feqaPqDF+aD8gr7dk/xgjkAvWQwB+mRi991sWs1q9KMG?=
 =?iso-8859-1?Q?iE/53YExeMvCEv57awygBmnM1UlGAClzuLwRudCxrzwW9RrJ/iK1NXtbgK?=
 =?iso-8859-1?Q?ZNikjgarXaXDvVDjc5mNuFrnChBZSymboyushwwRiCl0bLzOLLNMD8aAAe?=
 =?iso-8859-1?Q?Juu6ImrIoxiJ2s667qUpDHUacHGE6FasZXGaQ9SO7M1ravhpoeBhrfzpf9?=
 =?iso-8859-1?Q?X5jW/cDknxboMYU+w8vMS8kmunjvjaOrcZbe4HRrU7+Cu5UJZxdvb4cXmH?=
 =?iso-8859-1?Q?hercJmMQMnt4sL2fLLy00oNZdfm6WIk4b4lrlYc/XdYzP3HsKJQOBUDkRK?=
 =?iso-8859-1?Q?kRkQ3IlMkHdgSj4vlDkD1RDbV6D4zhZs/lnBMy0rhlI4ClvQvoL84aZZTO?=
 =?iso-8859-1?Q?mJZnfbxUgfwsshgEb/taAVAQP3YjrQXULpsg4h02e7lbxTjL4SpUJaNc8b?=
 =?iso-8859-1?Q?lyQao8od8jf6sR/wHYxOTRVkZJ2cTorLqnSNAc2fxOtP6QKb+Is71y/pMZ?=
 =?iso-8859-1?Q?iM9h9k0IqbiaUpoTQw19PiCFe7Sq1Fw37XTcEzTOmkk1LuvarydD1POdlJ?=
 =?iso-8859-1?Q?VsrNA0rXdewadELDLz+qtgpsMz2IEYuTF6zabdTzfYMxmySn715jQCClQs?=
 =?iso-8859-1?Q?ChIFoecftbdnfQdsiz/ASTgU/o0oSV2BGXF4YaquSbN/Ql0zsvkZzE1aJF?=
 =?iso-8859-1?Q?lmxV1kSzjL/3VYUPXjJ8kRYicZJ3cvvtbFoIZ5foGe+UlSv7P78OLnHeUw?=
 =?iso-8859-1?Q?tK8Txv3iwdZehyXUoi8LeZFiNE+xgiy5F2kVk8C5HTC5FCkXtcceaQwYKo?=
 =?iso-8859-1?Q?pt/ae0fIFd/B/K9U2cq9jCq70EgMpzSks5h1mrfcrfCKbVf1NWNuzjjiPf?=
 =?iso-8859-1?Q?ZN/9kYoA2jhrQeVKPofzT8bMAxm/EN9mLRiaTRRol1CdW20XSr2aevxM6p?=
 =?iso-8859-1?Q?Dll2GMYOy7tqt5Yt3rhyEuzVhcISpTL+Kga7fw0hqyfI0oTiD+t/vIK0i0?=
 =?iso-8859-1?Q?rXuVLJDZNQzXLTO3fYJ99uDI/eYDugb5pnjF1ecVjyUea4H9CIQlTRb4KJ?=
 =?iso-8859-1?Q?B2EDgv+qLewDvEKkSSFXI6RUNz6MW6is6+PlPWGGd8FUifr07vmOgCufaO?=
 =?iso-8859-1?Q?ReCNQcEO7K0rkTj+MTyYf4OrC9YETBl28TJyL0nCjW13zmK3kJBhHrPkt7?=
 =?iso-8859-1?Q?nYmY+N5PT5/+bWbSOhwnG8Su3hTJ3BZ4ltTVgrUDyZUxb6IQiqc2X2n90E?=
 =?iso-8859-1?Q?+0tU+Oy9fiKGIZ2Z7k2Wt9A1qNUds8PCOOIzFItWni0tNdNhYB0N0HYLiR?=
 =?iso-8859-1?Q?zSLTMr9UhhotQrkGVa9rJA1eghEvT6+57p?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c69ffaee-cc9b-40a6-cc88-08dd40b7a4b7
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2025 22:52:44.5908
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d+Y1uCmVKQDuYw3PK36XRIs6OJVGFmUPpFAcwsdfFMlFutevaCG1hXR6b5mvCm0lg4+k3okZbCuRjGHFc6j81A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU6PR04MB11207
X-Spam-Status: No, score=1.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_INVALID,DKIM_SIGNED,FORGED_SPF_HELO,RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sun, Jan 26, 2025 at 07:59:00PM +0100, J. Neuschäfer wrote:
> The devicetree bindings for Freescale DMA engines have so far existed as
> a text file. This patch converts them to YAML, and specifies all the
> compatible strings currently in use in arch/powerpc/boot/dts.
>
> Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
> ---
>  .../devicetree/bindings/dma/fsl,elo-dma.yaml       | 129 +++++++++++++
>  .../devicetree/bindings/dma/fsl,elo3-dma.yaml      | 105 +++++++++++
>  .../devicetree/bindings/dma/fsl,eloplus-dma.yaml   | 120 ++++++++++++
>  .../devicetree/bindings/powerpc/fsl/dma.txt        | 204 ---------------------
>  4 files changed, 354 insertions(+), 204 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/dma/fsl,elo-dma.yaml b/Documentation/devicetree/bindings/dma/fsl,elo-dma.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..d1f4978a672c1217c322c27f243470b2de8c99d4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dma/fsl,elo-dma.yaml
> @@ -0,0 +1,129 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/dma/fsl,elo-dma.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale Elo DMA Controller
> +
> +maintainers:
> +  - J. Neuschäfer <j.ne@posteo.net>
> +
> +description: |

needn't | here

> +  This is a little-endian 4-channel DMA controller, used in Freescale mpc83xx
> +  series chips such as mpc8315, mpc8349, mpc8379 etc.
> +
> +  Note on DMA channel compatible properties: The compatible property must say
> +  "fsl,elo-dma-channel" or "fsl,eloplus-dma-channel" to be used by the Elo DMA

There are not 'fsl,eloplus-dma-channel' under "^dma-channel@.*$". I suggest
remove this because 'compatible': items already show such information.

> +  driver (fsldma).  Any DMA channel used by fsldma cannot be used by another
> +  DMA driver, such as the SSI sound drivers for the MPC8610.  Therefore, any
> +  DMA channel that should be used for another driver should not use
> +  "fsl,elo-dma-channel" or "fsl,eloplus-dma-channel".  For the SSI drivers, for
> +  example, the compatible property should be "fsl,ssi-dma-channel".  See
> +  ssi.txt for more information.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - fsl,mpc8313-dma
> +          - fsl,mpc8315-dma
> +          - fsl,mpc8323-dma
> +          - fsl,mpc8347-dma
> +          - fsl,mpc8349-dma
> +          - fsl,mpc8360-dma
> +          - fsl,mpc8377-dma
> +          - fsl,mpc8378-dma
> +          - fsl,mpc8379-dma
> +      - const: fsl,elo-dma
> +
> +  reg:
> +    maxItems: 1
> +    description:
> +      DMA General Status Register, i.e. DGSR which contains status for
> +      all the 4 DMA channels.
> +
> +  ranges: true
> +
> +  cell-index:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Controller index. 0 for controller @ 0x8100.
> +
> +  interrupts:
> +    maxItems: 1
> +
> +patternProperties:
> +  "^dma-channel@.*$":
> +    type: object
> +
> +    properties:
> +      compatible:
> +        items:
> +          - enum:
> +              - fsl,mpc8315-dma-channel
> +              - fsl,mpc8323-dma-channel
> +              - fsl,mpc8347-dma-channel
> +              - fsl,mpc8349-dma-channel
> +              - fsl,mpc8360-dma-channel
> +              - fsl,mpc8377-dma-channel
> +              - fsl,mpc8378-dma-channel
> +              - fsl,mpc8379-dma-channel
> +          - const: fsl,elo-dma-channel
> +
> +      reg:
> +        maxItems: 1
> +
> +      cell-index:
> +        description: DMA channel index starts at 0.
> +
> +      interrupts: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +additionalProperties: true
> +
> +examples:
> +  - |
> +    dma@82a8 {
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        compatible = "fsl,mpc8349-dma", "fsl,elo-dma";
> +        reg = <0x82a8 4>;

compatible and reg should be first two property.

> +        ranges = <0 0x8100 0x1a4>;
> +        interrupt-parent = <&ipic>;
> +        interrupts = <71 8>;
> +        cell-index = <0>;

need space line here.

> +        dma-channel@0 {
> +            compatible = "fsl,mpc8349-dma-channel", "fsl,elo-dma-channel";
> +            cell-index = <0>;
> +            reg = <0 0x80>;
> +            interrupt-parent = <&ipic>;
> +            interrupts = <71 8>;
> +        };

need space line here. check other's example dts

> +        dma-channel@80 {
> +            compatible = "fsl,mpc8349-dma-channel", "fsl,elo-dma-channel";
> +            cell-index = <1>;
> +            reg = <0x80 0x80>;
> +            interrupt-parent = <&ipic>;
> +            interrupts = <71 8>;
> +        };
> +        dma-channel@100 {
> +            compatible = "fsl,mpc8349-dma-channel", "fsl,elo-dma-channel";
> +            cell-index = <2>;
> +            reg = <0x100 0x80>;
> +            interrupt-parent = <&ipic>;
> +            interrupts = <71 8>;
> +        };
> +        dma-channel@180 {
> +            compatible = "fsl,mpc8349-dma-channel", "fsl,elo-dma-channel";
> +            cell-index = <3>;
> +            reg = <0x180 0x80>;
> +            interrupt-parent = <&ipic>;
> +            interrupts = <71 8>;
> +        };
> +    };
> +
> +...
> diff --git a/Documentation/devicetree/bindings/dma/fsl,elo3-dma.yaml b/Documentation/devicetree/bindings/dma/fsl,elo3-dma.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..d4853ffd40dc75c7fcdc0dfb15e497ec56f3e1ba
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dma/fsl,elo3-dma.yaml
> @@ -0,0 +1,105 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/dma/fsl,elo3-dma.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale Elo3 DMA Controller
> +
> +maintainers:
> +  - J. Neuschäfer <j.ne@posteo.net>
> +
> +description: |
> +  DMA controller which has same function as EloPlus except that Elo3 has 8
> +  channels while EloPlus has only 4, it is used in Freescale Txxx and Bxxx
> +  series chips, such as t1040, t4240, b4860.
> +
> +  Note on DMA channel compatible properties: The compatible property must say
> +  "fsl,elo-dma-channel" or "fsl,eloplus-dma-channel" to be used by the Elo DMA
> +  driver (fsldma).  Any DMA channel used by fsldma cannot be used by another
> +  DMA driver, such as the SSI sound drivers for the MPC8610.  Therefore, any DMA
> +  channel that should be used for another driver should not use
> +  "fsl,elo-dma-channel" or "fsl,eloplus-dma-channel".  For the SSI drivers, for
> +  example, the compatible property should be "fsl,ssi-dma-channel".  See ssi.txt
> +  for more information.
> +
> +properties:
> +  compatible:
> +    const: fsl,elo3-dma
> +
> +  reg:
> +    maxItems: 2
> +    description: |
> +      contains two entries for DMA General Status Registers, i.e. DGSR0 which
> +      includes status for channel 1~4, and DGSR1 for channel 5~8
> +
> +  interrupts:
> +    maxItems: 1
> +
> +patternProperties:
> +  "^dma-channel@.*$":
> +    type: object
> +
> +    properties:
> +      compatible:
> +        const: fsl,eloplus-dma-channel
> +
> +      reg:
> +        maxItems: 1
> +
> +      interrupts: true
> +
> +examples:
> +  - |
> +    dma@100300 {
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        compatible = "fsl,elo3-dma";
> +        reg = <0x100300 0x4>,
> +              <0x100600 0x4>;
> +        ranges = <0x0 0x100100 0x500>;
> +        dma-channel@0 {
> +            compatible = "fsl,eloplus-dma-channel";
> +            reg = <0x0 0x80>;
> +            interrupts = <28 2 0 0>;
> +        };
> +        dma-channel@80 {
> +            compatible = "fsl,eloplus-dma-channel";
> +            reg = <0x80 0x80>;
> +            interrupts = <29 2 0 0>;
> +        };
> +        dma-channel@100 {
> +            compatible = "fsl,eloplus-dma-channel";
> +            reg = <0x100 0x80>;
> +            interrupts = <30 2 0 0>;
> +        };
> +        dma-channel@180 {
> +            compatible = "fsl,eloplus-dma-channel";
> +            reg = <0x180 0x80>;
> +            interrupts = <31 2 0 0>;
> +        };
> +        dma-channel@300 {
> +            compatible = "fsl,eloplus-dma-channel";
> +            reg = <0x300 0x80>;
> +            interrupts = <76 2 0 0>;
> +        };
> +        dma-channel@380 {
> +            compatible = "fsl,eloplus-dma-channel";
> +            reg = <0x380 0x80>;
> +            interrupts = <77 2 0 0>;
> +        };
> +        dma-channel@400 {
> +            compatible = "fsl,eloplus-dma-channel";
> +            reg = <0x400 0x80>;
> +            interrupts = <78 2 0 0>;
> +        };
> +        dma-channel@480 {
> +            compatible = "fsl,eloplus-dma-channel";
> +            reg = <0x480 0x80>;
> +            interrupts = <79 2 0 0>;
> +        };
> +    };
> +
> +additionalProperties: true
> +
> +...
> diff --git a/Documentation/devicetree/bindings/dma/fsl,eloplus-dma.yaml b/Documentation/devicetree/bindings/dma/fsl,eloplus-dma.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..680d64332ddf4d6d68ee8c607ac71211a7e19e6e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dma/fsl,eloplus-dma.yaml
> @@ -0,0 +1,120 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale EloPlus DMA Controller
> +
> +maintainers:
> +  - J. Neuschäfer <j.ne@posteo.net>
> +
> +description: |
> +  This is a 4-channel DMA controller with extended addresses and chaining,
> +  mainly used in Freescale mpc85xx/86xx, Pxxx and BSC series chips, such as
> +  mpc8540, mpc8641 p4080, bsc9131 etc.
> +
> +  Note on DMA channel compatible properties: The compatible property must say
> +  "fsl,elo-dma-channel" or "fsl,eloplus-dma-channel" to be used by the Elo DMA
> +  driver (fsldma).  Any DMA channel used by fsldma cannot be used by another
> +  DMA driver, such as the SSI sound drivers for the MPC8610.  Therefore, any DMA
> +  channel that should be used for another driver should not use
> +  "fsl,elo-dma-channel" or "fsl,eloplus-dma-channel".  For the SSI drivers, for
> +  example, the compatible property should be "fsl,ssi-dma-channel".  See ssi.txt
> +  for more information.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - fsl,mpc8540-dma
> +              - fsl,mpc8541-dma
> +              - fsl,mpc8548-dma
> +              - fsl,mpc8555-dma
> +              - fsl,mpc8560-dma
> +              - fsl,mpc8572-dma
> +              - fsl,mpc8641-dma
> +          - const: fsl,eloplus-dma
> +      - const: fsl,eloplus-dma
> +
> +  reg:
> +    maxItems: 1
> +    description:
> +      DMA General Status Register, i.e. DGSR which contains
> +      status for all the 4 DMA channels
> +
> +  cell-index:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      controller index.  0 for controller @ 0x21000, 1 for controller @ 0xc000
> +
> +  interrupts:
> +    maxItems: 1
> +
> +patternProperties:
> +  "^dma-channel@.*$":
> +    type: object
> +
> +    properties:
> +      compatible:
> +        items:
> +          - enum:
> +              - fsl,mpc8540-dma-channel
> +              - fsl,mpc8541-dma-channel
> +              - fsl,mpc8548-dma-channel
> +              - fsl,mpc8555-dma-channel
> +              - fsl,mpc8560-dma-channel
> +              - fsl,mpc8572-dma-channel
> +          - const: fsl,eloplus-dma-channel

I think you can merge this fsl,mpc83xx-dma yaml file

+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: fsl,elo-dma
+    then:
+      patternProperties:
+        "^dma-channel@.*$":
+          properties:
+            compatible:
+              items:
+                - enum:
			....
+    else
+      patternProperties:
+        "^dma-channel@.*$":
+          properties:
+            compatible:
+              items:
+                - enum:
                        ....
+                - const: fsl,eloplus-dma-channel

Frank

> +
> +      reg:
> +        maxItems: 1
> +
> +      cell-index:
> +        description: DMA channel index starts at 0.
> +
> +      interrupts: true
> +
> +examples:
> +  - |
> +    dma@21300 {
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        compatible = "fsl,mpc8540-dma", "fsl,eloplus-dma";
> +        reg = <0x21300 4>;
> +        ranges = <0 0x21100 0x200>;
> +        cell-index = <0>;
> +        dma-channel@0 {
> +            compatible = "fsl,mpc8540-dma-channel", "fsl,eloplus-dma-channel";
> +            reg = <0 0x80>;
> +            cell-index = <0>;
> +            interrupt-parent = <&mpic>;
> +            interrupts = <20 2>;
> +        };
> +        dma-channel@80 {
> +            compatible = "fsl,mpc8540-dma-channel", "fsl,eloplus-dma-channel";
> +            reg = <0x80 0x80>;
> +            cell-index = <1>;
> +            interrupt-parent = <&mpic>;
> +            interrupts = <21 2>;
> +        };
> +        dma-channel@100 {
> +            compatible = "fsl,mpc8540-dma-channel", "fsl,eloplus-dma-channel";
> +            reg = <0x100 0x80>;
> +            cell-index = <2>;
> +            interrupt-parent = <&mpic>;
> +            interrupts = <22 2>;
> +        };
> +        dma-channel@180 {
> +            compatible = "fsl,mpc8540-dma-channel", "fsl,eloplus-dma-channel";
> +            reg = <0x180 0x80>;
> +            cell-index = <3>;
> +            interrupt-parent = <&mpic>;
> +            interrupts = <23 2>;
> +        };
> +    };
> +
> +additionalProperties: true
> +
> +...
> diff --git a/Documentation/devicetree/bindings/powerpc/fsl/dma.txt b/Documentation/devicetree/bindings/powerpc/fsl/dma.txt
> deleted file mode 100644
> index c11ad5c6db2190bf38c160632d9997122e169945..0000000000000000000000000000000000000000
> --- a/Documentation/devicetree/bindings/powerpc/fsl/dma.txt
> +++ /dev/null
> @@ -1,204 +0,0 @@
> -* Freescale DMA Controllers
> -
> -** Freescale Elo DMA Controller
> -   This is a little-endian 4-channel DMA controller, used in Freescale mpc83xx
> -   series chips such as mpc8315, mpc8349, mpc8379 etc.
> -
> -Required properties:
> -
> -- compatible        : must include "fsl,elo-dma"
> -- reg               : DMA General Status Register, i.e. DGSR which contains
> -                      status for all the 4 DMA channels
> -- ranges            : describes the mapping between the address space of the
> -                      DMA channels and the address space of the DMA controller
> -- cell-index        : controller index.  0 for controller @ 0x8100
> -- interrupts        : interrupt specifier for DMA IRQ
> -
> -- DMA channel nodes:
> -        - compatible        : must include "fsl,elo-dma-channel"
> -                              However, see note below.
> -        - reg               : DMA channel specific registers
> -        - cell-index        : DMA channel index starts at 0.
> -
> -Optional properties:
> -        - interrupts        : interrupt specifier for DMA channel IRQ
> -                              (on 83xx this is expected to be identical to
> -                              the interrupts property of the parent node)
> -
> -Example:
> -	dma@82a8 {
> -		#address-cells = <1>;
> -		#size-cells = <1>;
> -		compatible = "fsl,mpc8349-dma", "fsl,elo-dma";
> -		reg = <0x82a8 4>;
> -		ranges = <0 0x8100 0x1a4>;
> -		interrupt-parent = <&ipic>;
> -		interrupts = <71 8>;
> -		cell-index = <0>;
> -		dma-channel@0 {
> -			compatible = "fsl,mpc8349-dma-channel", "fsl,elo-dma-channel";
> -			cell-index = <0>;
> -			reg = <0 0x80>;
> -			interrupt-parent = <&ipic>;
> -			interrupts = <71 8>;
> -		};
> -		dma-channel@80 {
> -			compatible = "fsl,mpc8349-dma-channel", "fsl,elo-dma-channel";
> -			cell-index = <1>;
> -			reg = <0x80 0x80>;
> -			interrupt-parent = <&ipic>;
> -			interrupts = <71 8>;
> -		};
> -		dma-channel@100 {
> -			compatible = "fsl,mpc8349-dma-channel", "fsl,elo-dma-channel";
> -			cell-index = <2>;
> -			reg = <0x100 0x80>;
> -			interrupt-parent = <&ipic>;
> -			interrupts = <71 8>;
> -		};
> -		dma-channel@180 {
> -			compatible = "fsl,mpc8349-dma-channel", "fsl,elo-dma-channel";
> -			cell-index = <3>;
> -			reg = <0x180 0x80>;
> -			interrupt-parent = <&ipic>;
> -			interrupts = <71 8>;
> -		};
> -	};
> -
> -** Freescale EloPlus DMA Controller
> -   This is a 4-channel DMA controller with extended addresses and chaining,
> -   mainly used in Freescale mpc85xx/86xx, Pxxx and BSC series chips, such as
> -   mpc8540, mpc8641 p4080, bsc9131 etc.
> -
> -Required properties:
> -
> -- compatible        : must include "fsl,eloplus-dma"
> -- reg               : DMA General Status Register, i.e. DGSR which contains
> -                      status for all the 4 DMA channels
> -- cell-index        : controller index.  0 for controller @ 0x21000,
> -                                         1 for controller @ 0xc000
> -- ranges            : describes the mapping between the address space of the
> -                      DMA channels and the address space of the DMA controller
> -
> -- DMA channel nodes:
> -        - compatible        : must include "fsl,eloplus-dma-channel"
> -                              However, see note below.
> -        - cell-index        : DMA channel index starts at 0.
> -        - reg               : DMA channel specific registers
> -        - interrupts        : interrupt specifier for DMA channel IRQ
> -
> -Example:
> -	dma@21300 {
> -		#address-cells = <1>;
> -		#size-cells = <1>;
> -		compatible = "fsl,mpc8540-dma", "fsl,eloplus-dma";
> -		reg = <0x21300 4>;
> -		ranges = <0 0x21100 0x200>;
> -		cell-index = <0>;
> -		dma-channel@0 {
> -			compatible = "fsl,mpc8540-dma-channel", "fsl,eloplus-dma-channel";
> -			reg = <0 0x80>;
> -			cell-index = <0>;
> -			interrupt-parent = <&mpic>;
> -			interrupts = <20 2>;
> -		};
> -		dma-channel@80 {
> -			compatible = "fsl,mpc8540-dma-channel", "fsl,eloplus-dma-channel";
> -			reg = <0x80 0x80>;
> -			cell-index = <1>;
> -			interrupt-parent = <&mpic>;
> -			interrupts = <21 2>;
> -		};
> -		dma-channel@100 {
> -			compatible = "fsl,mpc8540-dma-channel", "fsl,eloplus-dma-channel";
> -			reg = <0x100 0x80>;
> -			cell-index = <2>;
> -			interrupt-parent = <&mpic>;
> -			interrupts = <22 2>;
> -		};
> -		dma-channel@180 {
> -			compatible = "fsl,mpc8540-dma-channel", "fsl,eloplus-dma-channel";
> -			reg = <0x180 0x80>;
> -			cell-index = <3>;
> -			interrupt-parent = <&mpic>;
> -			interrupts = <23 2>;
> -		};
> -	};
> -
> -** Freescale Elo3 DMA Controller
> -   DMA controller which has same function as EloPlus except that Elo3 has 8
> -   channels while EloPlus has only 4, it is used in Freescale Txxx and Bxxx
> -   series chips, such as t1040, t4240, b4860.
> -
> -Required properties:
> -
> -- compatible        : must include "fsl,elo3-dma"
> -- reg               : contains two entries for DMA General Status Registers,
> -                      i.e. DGSR0 which includes status for channel 1~4, and
> -                      DGSR1 for channel 5~8
> -- ranges            : describes the mapping between the address space of the
> -                      DMA channels and the address space of the DMA controller
> -
> -- DMA channel nodes:
> -        - compatible        : must include "fsl,eloplus-dma-channel"
> -        - reg               : DMA channel specific registers
> -        - interrupts        : interrupt specifier for DMA channel IRQ
> -
> -Example:
> -dma@100300 {
> -	#address-cells = <1>;
> -	#size-cells = <1>;
> -	compatible = "fsl,elo3-dma";
> -	reg = <0x100300 0x4>,
> -	      <0x100600 0x4>;
> -	ranges = <0x0 0x100100 0x500>;
> -	dma-channel@0 {
> -		compatible = "fsl,eloplus-dma-channel";
> -		reg = <0x0 0x80>;
> -		interrupts = <28 2 0 0>;
> -	};
> -	dma-channel@80 {
> -		compatible = "fsl,eloplus-dma-channel";
> -		reg = <0x80 0x80>;
> -		interrupts = <29 2 0 0>;
> -	};
> -	dma-channel@100 {
> -		compatible = "fsl,eloplus-dma-channel";
> -		reg = <0x100 0x80>;
> -		interrupts = <30 2 0 0>;
> -	};
> -	dma-channel@180 {
> -		compatible = "fsl,eloplus-dma-channel";
> -		reg = <0x180 0x80>;
> -		interrupts = <31 2 0 0>;
> -	};
> -	dma-channel@300 {
> -		compatible = "fsl,eloplus-dma-channel";
> -		reg = <0x300 0x80>;
> -		interrupts = <76 2 0 0>;
> -	};
> -	dma-channel@380 {
> -		compatible = "fsl,eloplus-dma-channel";
> -		reg = <0x380 0x80>;
> -		interrupts = <77 2 0 0>;
> -	};
> -	dma-channel@400 {
> -		compatible = "fsl,eloplus-dma-channel";
> -		reg = <0x400 0x80>;
> -		interrupts = <78 2 0 0>;
> -	};
> -	dma-channel@480 {
> -		compatible = "fsl,eloplus-dma-channel";
> -		reg = <0x480 0x80>;
> -		interrupts = <79 2 0 0>;
> -	};
> -};
> -
> -Note on DMA channel compatible properties: The compatible property must say
> -"fsl,elo-dma-channel" or "fsl,eloplus-dma-channel" to be used by the Elo DMA
> -driver (fsldma).  Any DMA channel used by fsldma cannot be used by another
> -DMA driver, such as the SSI sound drivers for the MPC8610.  Therefore, any DMA
> -channel that should be used for another driver should not use
> -"fsl,elo-dma-channel" or "fsl,eloplus-dma-channel".  For the SSI drivers, for
> -example, the compatible property should be "fsl,ssi-dma-channel".  See ssi.txt
> -for more information.
>
> --
> 2.48.0.rc1.219.gb6b6757d772
>

