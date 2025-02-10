Return-Path: <linuxppc-dev+bounces-6061-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E71A2F95D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Feb 2025 20:48:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YsFVc2Ylkz30W1;
	Tue, 11 Feb 2025 06:48:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip="2a01:111:f403:2607::61d"
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739216888;
	cv=fail; b=nS5qOkGzOBE5wNf+g3cb+SkHURjGkluXAifj7YbE5Jlof22KuTXJxnewU0vLYxWDBGxfhgOLdbyySda9KtayxgGySqQfLpT6uirc0NL+9Kw9bzCUATlkSB8Y+wVi4KRzaDCnV6zxhzsJt1dUAKFaG5QZmoPlYW9LpbEmb/qzOEECbM0h/m0ffaxVoIjPeiq5ABaktr7rlfgqsE70UBowh0gQOM+yEYsR4EeQO4Q8dieqtZys9PGrMj9LHm8BW9QhTRTynxE/LOjx0ORQraBnGy5wZ+t586gBFlEyVCx8jqyzdG+/7SIf+N1MdO96z8yVsML0GxelLam+xz/cgTLZaQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739216888; c=relaxed/relaxed;
	bh=cp9K2yprDZb2OL2vXPrSuaMlGZdmtIONXQCHs5yHJ7w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=DhnEA2Fsetx6kopteBsFDaMGLZoKCIxQsd5+w+Jm5cSY4lFLTOS/0tnWq3V4y3LG5CZcawyiv7Zs7huIf4R23CtYzNPmGn/27oDFemA5RElyJzQzxbfdpbs2dL4L8WvsFFWzYGfHLCAxE9s6NF8VUXbTdKcRSUZ1QEvmuxUd94B65ICcVvTeKNpRYBGhxN0+WFuzyUuHzFV+TtqVEXbEPjeAlaR7xFfkutpYK99t8dwsZ/irdX+s3ee7h9rV1NSH9E4+cQ5blEkSCBQBoMbNFLcC6OcM2F7PjU68M3wpaNRVRR2FWnJE6Ut5ZC8myJw6AqKMkWfRQpgrQpZfx2LyOA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=nxp.com; dkim=fail (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=V++nu0qX reason="signature verification failed"; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2607::61d; helo=eur02-vi1-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=V++nu0qX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2607::61d; helo=eur02-vi1-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2061d.outbound.protection.outlook.com [IPv6:2a01:111:f403:2607::61d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YsFVb2r1lz30Vy
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Feb 2025 06:48:07 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CUr2GXzoo4s+LljUNg/l045UnGCB8/Y+F8+uxn24Qfe0WbJD+aDYqRMXZawov7SSrLbJ+dh2KZtlCIERP5jl2mF/7/9DEndnSYQG25klVe1f1I2zqkGU9kMfQWalaeoTvYEmoReeuEKVjS55xDfV39wHwUlAFCosTbjqHfJ8Uo24bfvQDm1j7OjYWz8cG4LFxnpDG+dxYe/UwH++mVm8zj5uWpzlQKeSrQ+QsCcH/ZrVkzcoU6SdkeJevukJTOJZMnYhrjaTCH2TbAYk/H4T8zxaJN9SETBuJZTiJPPl5/SMM16zb3ZSdUTNYvXiw8wx4zPk6hxgpW6H2b5ndIdTHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GGg+shqPUMvDVQzuMJEqgQzgk/VkJ8ceItn9Nb5O4UE=;
 b=Ddl7K3qayIVhjPPWLXzy5EICgilnvIfMeFqpGu95Jl4SGHXHSIH6LLZ7byEQ9r77T8zsXhk9CZ2MOKEIFGwBK3k9qmIT1SLmEqQxGYQ6tO7h3raj0/F4Q1OrLYEUEb+6jQZpmCjvZZ2Hd2rIvoevovzUz760uwfhcjAL3s77dKx2F1XyyUG6aULsGiMNMLSDQh2J4B2OsMNaeiKhaLMbCvQZDGSbT7OySTAYnyXn3TEIYUCmFsjQ+7l+mqmNxRBc7XVG33ufOgAe61RqYAudPLpEL/v47e1Rqe90XxNvxHgttpHfx7MkhlhNDLf9dfRNcfdQTdKnEOnXAsef/Rs0jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GGg+shqPUMvDVQzuMJEqgQzgk/VkJ8ceItn9Nb5O4UE=;
 b=V++nu0qXNFwfv9l523WCQPHgrwaTfCKdGnFaPw2Lep0y3WCM//HynpEKEW+IFZvbZd9wyT+g8oQk03oYUcP2//JCJssJB49081CudlIgDXeX+XDNrBi7Qv0mQ9Z+Py7vURUtW4pkebL5YEdWIKcbxi12up/Y8NYBKRhcDIyz50DcKGhv0XNxgloGFl1yHhS+frC+9oHqxOTU8hTk9EJoB8FK/cO0X5/6CyKspbX+Q0On5IRK/6ghh0ay2jD1eytVf6Qg7llttqcK5iS4JMwUNV4mw6JQyjVWQtlciKixUBlCzAYRiG0fZJvNFvYsi49/QmOjC5jLvR66C02GzcJmjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VE1PR04MB7488.eurprd04.prod.outlook.com (2603:10a6:800:1b0::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 19:47:46 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8422.012; Mon, 10 Feb 2025
 19:47:38 +0000
Date: Mon, 10 Feb 2025 14:47:24 -0500
From: Frank Li <Frank.li@nxp.com>
To: j.ne@posteo.net
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
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
Subject: Re: [PATCH v2 11/12] dt-bindings: nand: Add fsl,elbc-fcm-nandy
Message-ID: <Z6pXzEG74yq2oy3Y@lizhi-Precision-Tower-5810>
References: <20250207-ppcyaml-v2-0-8137b0c42526@posteo.net>
 <20250207-ppcyaml-v2-11-8137b0c42526@posteo.net>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250207-ppcyaml-v2-11-8137b0c42526@posteo.net>
X-ClientProxiedBy: BY5PR16CA0022.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::35) To PAXPR04MB9642.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VE1PR04MB7488:EE_
X-MS-Office365-Filtering-Correlation-Id: dfb5ee90-c525-45cf-9d8e-08dd4a0bc62d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?CDI51zjioheQ8aN9Ag/MSehZKaQ8CQuAbRxHZpOSoBglyYD93+28AYNdwg?=
 =?iso-8859-1?Q?LZuX75lP2FaURnGeVQa6HnUTGVmcDldDgyfisIvwdxcdjCe9yQAj7pDzpA?=
 =?iso-8859-1?Q?HrMXJmguuyhLEQH40rgUoJ8GQ0r5G9mh0UWwpHTKQGN1Eyv6p//fZkD4HM?=
 =?iso-8859-1?Q?PZLvaMS8TMyWzgYPQaDTD90Wfq+DpS0nld6zj0VXCTOc5sjv7kCFX9X1jf?=
 =?iso-8859-1?Q?SKzoqvMPD16fVNOPa8tQAVcmYhKutJ5eIgb4vjIfqKtvpCw6mAkGZHuOms?=
 =?iso-8859-1?Q?OD3SlxSFBPhHvrem2RP+5KKRyAa/WvX+yr+fOhizOn64SHU9SIxW+g9Hwr?=
 =?iso-8859-1?Q?hcbuJQOc8j6Vox63TYSgqXyNzJSZHXvNQCqZUc/DkX910ZbJRpE+XRiAKA?=
 =?iso-8859-1?Q?I2K2ePQ2UTSyVN91L7nUpMxAbM3RxmdOUTAc+ukVLHchc1Rpr7cBjXqmzN?=
 =?iso-8859-1?Q?o8jQO8byy9H57QsrWbsjNhV5qsjHnI4dTX+gvCfcoFzlp4yWpSN7vqQGiO?=
 =?iso-8859-1?Q?Qq5fJuaQJU5JNhWw0dTid658WqcTfnwrx64rCghLktP4WtHZ/JH6wIZiFG?=
 =?iso-8859-1?Q?odUwK3jH2+vlzRJxWWJaGCYgxfnI74HlHBukU6fT23qQwHWdJ365YFtULH?=
 =?iso-8859-1?Q?cZrbhcrFLPy4gc5Ey0Rh29ZpgzD83zu/XLawsorLzq3hp0FW7I/O1RExXw?=
 =?iso-8859-1?Q?dtUxYBzt1tQn/gEYtTPyaLtvw/d1xEbMEZXPbQaC0c2XL/OV/D+POC9bqg?=
 =?iso-8859-1?Q?kDZkz1yQdqv7X+AcytYcILSh0Cvv1ybu++A1erxV/RfZJHcpGTOCRFkqU0?=
 =?iso-8859-1?Q?sa5EHYQ2fxo4pPBvQc7WJY2i4DDPG1TlQhiKSmMd1kHROqQzWCvCodjAaM?=
 =?iso-8859-1?Q?KINt5qy+qTxiEYvuR55EOYJ6ybFeuOYKsmaB6Or6Rgi4jMTHj+J6rjlsRs?=
 =?iso-8859-1?Q?6/Jx4w4KrLooMA7MZQO8y45aSDbA4AaHpOOxWE7CeRq5BW+d1HmQLC9JuC?=
 =?iso-8859-1?Q?5AKKpDyPQy4tPjI6HBjXtv3A/YkXxatxueH1tmY8qXCuRXlgGP/UbQsDIp?=
 =?iso-8859-1?Q?w8HYSafhr8//oe1E7HLHJzdWuAK4i7fyGm8NJR71Q++W/5tB6tIVkMDxdg?=
 =?iso-8859-1?Q?iIQeUSN51vTWPmQSRKakIH2BcwFdEaas/T/cA6c2chzCBcbw4iu3cxb8a9?=
 =?iso-8859-1?Q?kjWsTH6dooQsClS4u3OezEr3qbtS1hrbuJuLsQLa4xA9gPBHQC/xFf7aBk?=
 =?iso-8859-1?Q?IhXDa/VN0Mts1vc6vvZH2XYau9ORizNJimZK1/ndEde8GQTRztUf2AJeos?=
 =?iso-8859-1?Q?jJFGrdJROUJCIjqNXC0RJW3F10hHwgRo0yK3LWLDrn7UnR3g497uH1I6Vx?=
 =?iso-8859-1?Q?sTMuIB1Amx8wFTIiqg9PGeD95hiqVzInOIXbE4jtffVmOSpR0T3atV9/+r?=
 =?iso-8859-1?Q?sOi7OnFGR8SWruUA?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?aLatRDf7Jc4KO0JWTiFu7M26T2qew/P4guf6ueetqqDqd33YEzNawrEKub?=
 =?iso-8859-1?Q?PlYfQOiyqnhnKNJdSJeErsW5qIDA5VX4UZiBGO9wsvw0PnbXpFii0Gr267?=
 =?iso-8859-1?Q?WC9psseI61dumoLctLrpeFErRE/VHxQrelu24pc5trEaZAQzk+F8I3h61B?=
 =?iso-8859-1?Q?1EFk0hjws1qeL4daJUt8EiZsaxmChVp60O6kIZiejD/JFQtyfp99Z3QCMz?=
 =?iso-8859-1?Q?H81Vovfioa02Zm9Z8b5SYj8go7Qwp8wy6PprFxxLb5vN3oo3qaLqIbED1G?=
 =?iso-8859-1?Q?2AZasWh62xFH/Jmw05SyQxmC149Yp3cKZNv9PpfSCHY0LPDt9HhjXt8u/Q?=
 =?iso-8859-1?Q?wyMXzRpxiMASpi7jfZJKd6XHptJ/FpD4OFbZD55I59YoXWZXdNZzR+vPJ9?=
 =?iso-8859-1?Q?XUVj/w2+/fMTU0TVljP8fOnen8aK0ZN5s1+Yw8cYGDorG91i15aSoqabUI?=
 =?iso-8859-1?Q?nU6Yzc0tWMFc7xSM6nyC2YE8tVwNypLOHysID/gyJAbqn5w+JV6pr6yn7K?=
 =?iso-8859-1?Q?5XzMwnFiU4cfiDnFgfkKyMCJYP7f3C16jTrf/gZcDa+nmfHikrwBZ5LLlz?=
 =?iso-8859-1?Q?Om0bJc/8dawCNgPjFZYE9pPJpWTAQ8pDO2o9C57c2uycH22cvSlSTw1soT?=
 =?iso-8859-1?Q?LV9iP3BoYBbSWuXCplyYHz+Z+2wLQXHAYc/tdC9K38AvGI4QA6AYnOl3S5?=
 =?iso-8859-1?Q?5HOchhjflKh6yl1kf0CnQRCuNQQkuU4/jRT0ENadwfO3vJy5CfuzMy8vG5?=
 =?iso-8859-1?Q?sgeQKRAokenlaTfsCOP3iDuflFKOOz8cUH6Vc5mZaCgg8bGNGN+svzESpV?=
 =?iso-8859-1?Q?gr66GBaF/gqJrrHQ5nwlq78O3wnLikyopCpKbzi26VwthhTOr2SHoKIEOq?=
 =?iso-8859-1?Q?FqkzS0mX3/Kz3a5mFVGH7hITXXW3rEOvLCRHBSdNTYNFhpE+Qg/gIAPi7A?=
 =?iso-8859-1?Q?IBoPvz/d20yZiMdA1KD9+M2KyKsOH8vHLMRWYsi3Prl8tmcG2EuXezLfrK?=
 =?iso-8859-1?Q?A5sdU50D63nMRZ7qhcOAK6rRAHQGZWOTjjbJ8k1zQrJp0l39S5+ACF/Rsx?=
 =?iso-8859-1?Q?lVVhIz/2HE08KW1pA+v22x/YtTMvyi+asgbJHoQRYpcPKv5W4rW6i1+/ej?=
 =?iso-8859-1?Q?6QidlTZ3L/kCFdCBaTUlmLNsScWGK7Tt+kKxD70gauG/sXc0i76Fopl+SS?=
 =?iso-8859-1?Q?TuL667Jaocfr2ZWb9RBhZI48b0xB4W/PL6EI7fZZHekLgLMEuGEetaekvE?=
 =?iso-8859-1?Q?PBK9x3gF8kPTuVht6u8JrZO8YnwaAg8ZhEs9TSXLMzpHX73/E+GObIoehH?=
 =?iso-8859-1?Q?8EEOrm5A/A0Ly8d57ypGveoNTpTeLbvBYPL1mjDF2wou3jWSqEefOOVIsj?=
 =?iso-8859-1?Q?11eoubqGCsxNcqUonj+LRfigwtq0NAgatvt4fcsBSCxZK4NvlR3yLv4eVy?=
 =?iso-8859-1?Q?ZtGwInp5weMecDSXHIL2MDsq+nx13XoSKljp87q9w28bxvbqmcUkf71xvO?=
 =?iso-8859-1?Q?RcWSHd42fzjWaaaajTeSx5Vh/FwFUDIaXHbQjIiBJ92EAYqxhKTAg24D8k?=
 =?iso-8859-1?Q?lC9B+k4l+Yq0bUL6Y2tnflmgKhZWs6ahdYn0y2OmzWUh9Vp0SwEiwhRCiX?=
 =?iso-8859-1?Q?oIYC/85q8KG+4=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfb5ee90-c525-45cf-9d8e-08dd4a0bc62d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 19:47:38.7350
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6azSGPEyivsQBpX40uffB6mjdDZ5jJdIo5Qx3EHyuMuc5VTeXwWyTvIfGchdQtRxPZ6T0wq8gjv0MiJNv4M+rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7488
X-Spam-Status: No, score=1.6 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_INVALID,DKIM_SIGNED,FORGED_SPF_HELO,KHOP_HELO_FCRDNS,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Feb 07, 2025 at 10:30:28PM +0100, J. Neuschäfer via B4 Relay wrote:
> From: "J. Neuschäfer" <j.ne@posteo.net>
>
> Formalize the binding already supported by the fsl_elbc_nand.c driver
> and used in several device trees in arch/powerpc/boot/dts/.
>
> Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
> ---
>
> V2:
> - split out from fsl,elbc binding patch
> - constrain #address-cells and #size-cells
> - add a general description
> - use unevaluatedProperties=false instead of additionalProperties=false
> - fix property order to comply with dts coding style
> - include raw-nand-chip.yaml instead of nand-chip.yaml
> ---
>  .../devicetree/bindings/mtd/fsl,elbc-fcm-nand.yaml | 68 ++++++++++++++++++++++
>  1 file changed, 68 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mtd/fsl,elbc-fcm-nand.yaml b/Documentation/devicetree/bindings/mtd/fsl,elbc-fcm-nand.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..1de97bb24fa4a83e2ea5d94ab822dd0e37baa102
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/fsl,elbc-fcm-nand.yaml
> @@ -0,0 +1,68 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/fsl,elbc-fcm-nand.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NAND flash attached to Freescale eLBC
> +
> +description:
> +  The Freescale Enhanced Local Bus controller (eLBC) contains logic to
> +  interface with NAND flash, called the NAND Flash Control Machine (FCM).
> +  This binding describes flash attached to an eLBC using the FCM.
> +
> +maintainers:
> +  - J. Neuschäfer <j.ne@posteo.net>
> +
> +allOf:
> +  - $ref: raw-nand-chip.yaml#
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - fsl,mpc8313-fcm-nand
> +              - fsl,mpc8315-fcm-nand
> +              - fsl,mpc8377-fcm-nand
> +              - fsl,mpc8378-fcm-nand
> +              - fsl,mpc8379-fcm-nand
> +              - fsl,mpc8536-fcm-nand
> +              - fsl,mpc8569-fcm-nand
> +              - fsl,mpc8572-fcm-nand
> +              - fsl,p1020-fcm-nand
> +              - fsl,p1021-fcm-nand
> +              - fsl,p1025-fcm-nand
> +              - fsl,p2020-fcm-nand
> +          - const: fsl,elbc-fcm-nand
> +      - const: fsl,elbc-fcm-nand
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    localbus {
> +        #address-cells = <2>;
> +        #size-cells = <1>;
> +
> +        nand@1,0 {
> +            compatible = "fsl,mpc8315-fcm-nand",
> +                         "fsl,elbc-fcm-nand";
> +            reg = <0x1 0x0 0x2000>;
> +            #address-cells = <1>;
> +            #size-cells = <1>;

needn't  #address-cells and #size-cells because no children nodes.

Reviewed-by: Frank Li <Frank.Li@nxp.com>

Frank
> +        };
> +    };
>
> --
> 2.48.0.rc1.219.gb6b6757d772
>
>

