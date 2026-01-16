Return-Path: <linuxppc-dev+bounces-15913-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 806BDD32FEE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jan 2026 16:01:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dt32V0JGKz309H;
	Sat, 17 Jan 2026 02:01:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c201::6" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768575665;
	cv=pass; b=Suvk08Ayj5rFuBC19JGVJ7efF5d/JmPA8weJcjKSFhHEV7C7W14I9B4wTvBelREG5msfN5Zvm+rOxMjCROH8VW3XrinhSISv9PKdwAWacFXoTgR71z/xcHmuV7W9uTx2R9YW16O4EtOsjg8YQfzqP0YPc7jAMW7xSHTuU9+qG+1qmAFRRqxXIUUKeEyy5r3mHZp4PTn8e7+mNFtoNFlpA1kdO8Fb5IJXWGq4Lsc4MiTUPKEgwrJhDFNBhbn7spUGLLzHohvf2rziLHqH/GB7xFPmydc1DRdWtMSrWKTgxHfZxpU9u15fdn4yfMOn3BXlwASRSxqppCD+RmXnLP8aGA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768575665; c=relaxed/relaxed;
	bh=ymqiORfwp/JDERMW+0nRKhtlm9DqN/cSW3GKb75Grqo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=FrvJwUP2MVyl2ttED4ZiqjlJFmaNZEjy8GXEv8syQn9U3y4GmHFWJS6jAbbjQKGckIzUNvV4Rbxfc/9Zmg642s6Xtp1D3RL04VAvhqSbz6qVlv2IvgP97fqxjEifRLEUR5amViNstMAalJKmu+a/PvOnWBLNr3MPBYQEfwzixjf5MMaRylkASDQJvptZfl0jsKKnOO+H4gvt5w+PZdYVQgHYM5RGbk8111Wz2/zlrJoxew1lPG2jH2J7KPR+Y4ASMq4Ty4weztEZz8luQzAPpzRVNCuYu/XpYmhAjtGAazS7VfKz2eBRnL2UONIJzG7HLichaGqtwiWsAqAashPGpg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=HyCkDs/W; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c201::6; helo=am0pr02cu008.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=HyCkDs/W;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c201::6; helo=am0pr02cu008.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazlp170130006.outbound.protection.outlook.com [IPv6:2a01:111:f403:c201::6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dt32S421qz2xm3
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jan 2026 02:01:04 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jbOE6ArurCXgFH97E4NccDDuFqJq7kXuDe/Zwnnqv2evMFpZvRMDBIdSP0vBjLgZLMjWbwyBLxWI+XxZgNALju4JgTImIt7bN1EOIFKOdzbbFsue0xdhXCbur5d0gQ7D2tOjw5roFoJdfd85g+8CW3iOWlzgABfHbCSCEIMKafZoxYBBm4nHKQ7pJv9GxKPTBWaZnmJD1kSsixXGZSQav5w0gHKuBEeK73KismA5Vq6miu/8Olniw3BqqriYhqu+fpCDKLPpfOCKPYBm2Insiqsrx0AsD7odSc/x3VPZlGGZwyh4smtPtm7pw/mD6Kn7BSOMhPeFzp+H7xz2FVZNRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ymqiORfwp/JDERMW+0nRKhtlm9DqN/cSW3GKb75Grqo=;
 b=WmA79l16mAHcoCTEEkCCfAk03t9nTIJrXNSfLpYkyX9Abn31QHdZ3KqIfzmBSR/L80C2flrI0KxKEbJE7Za12nIEI+GVH4LiHDLAUmVlNjTGpEeTF0bSQAf6WrEOWYU35mm19FUV1cUimcmLLafbLsDbILyphhkSdT0BPDn6CIt4YUu0pIbSIT8yx61anT2P9rOB71RJ5Vmbsg50MwYPn5ERRDQnKtgLfXVXypviGhiM+C4zP4T9pqbFgoBA0xaj7xRs+BM5fC8HJmF9FeIb8mtZr6DAjVXocCG4v1Bz+mp+6DVcxo6w6X0wiC0l5Xyv9NxYbIU4kIxPSuIHHmSC9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ymqiORfwp/JDERMW+0nRKhtlm9DqN/cSW3GKb75Grqo=;
 b=HyCkDs/WGOK1F/ikRFSo+qUEBv259oRU5Q6MjSp0JrkpiB4Se6QmuXpBoqLqfzI4M2BUXk5yPKUreuBv4b7V6kewqMpUG9l33HHE4lKyUSjSU++myQD0VfEMr0xQiHOELYUnZWP4h9AbRBGRnxlYD7d7lsC4iEtgsYtfvK71k6eBavoZqlzNhaN1JyDO5t85z4OwOtG/vBvgFB8HxvVE/46w/J2VvBT+vKFXO5cayeziajgcKJcJ8F00h9EtpiXcldR+FMCCiinI4nOa40KmG6OSLQE7fU4YwEoNGzXdE4SXGph/xE78TDgpLPvqaBq3rxLxj6ABgWg6N3A438Mu0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by VI0PR04MB10437.eurprd04.prod.outlook.com (2603:10a6:800:216::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Fri, 16 Jan
 2026 15:00:35 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9478.004; Fri, 16 Jan 2026
 15:00:35 +0000
Date: Fri, 16 Jan 2026 10:00:25 -0500
From: Frank Li <Frank.li@nxp.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
	perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: fsl,audmix: Add support for
 i.MX952 platform
Message-ID: <aWpSiZuAWQkrbfAj@lizhi-Precision-Tower-5810>
References: <20260116101648.377952-1-shengjiu.wang@nxp.com>
 <20260116101648.377952-2-shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260116101648.377952-2-shengjiu.wang@nxp.com>
X-ClientProxiedBy: SJ0PR03CA0231.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::26) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
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
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|VI0PR04MB10437:EE_
X-MS-Office365-Filtering-Correlation-Id: f22b28c0-3474-4af5-dceb-08de55100079
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|19092799006|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gDpe8FDDEa1YarWUFgWEXYnItDRVkgT2hWiLxR7UBbfvffGA6EQF2I6N7JFd?=
 =?us-ascii?Q?BOmBvvFESt2JqeS3X06MEDh6kumCFfhkaqL+uBa38J5YMaYoj7QuFwykildx?=
 =?us-ascii?Q?noNBK58GOOLML/PzHSOoXu8qJ77Ap+ndkEvt6vXwgEmVMWKQKa/a1hIRjcD0?=
 =?us-ascii?Q?utuMuDU957c3vu/0PpNiBppZOXhvRx+BFPiRRHyR+nEGzkITkOi3m2WCT6S0?=
 =?us-ascii?Q?9iKmOkiWTki2MycSvATcX0JVx8l+d+Tw2eKTe4Fog1kS8QJ9sNTrG/085vOO?=
 =?us-ascii?Q?+H1Tzfmi48qqSk67J9oQCp4jvncDZBKosjMxgx7HqgwDvYp/py2E15pBzVqg?=
 =?us-ascii?Q?blXhDOJiOXKCzRkt+za+hGaH/lirGvPGorDrzECzQ9MnNJz0XQ9QAYczik9K?=
 =?us-ascii?Q?346lGH3bPcEdqpGWvXZgm9yX8AmAbdtzRvC+HDlY4MnQvGFl/WsSs9IZPDU5?=
 =?us-ascii?Q?slpGTy2kWr6jmBmVLF0YewD7wEfjS/6TbFVM4iV1FaqGCLHvCHsGqlpePXzk?=
 =?us-ascii?Q?RQMMJigP8Wf6dg9i5K+Bb0MzOqPgf0FdQD+iySC0LifezjOidcU/cfWyBpG6?=
 =?us-ascii?Q?yJfDMS9Ml8KMQW7kHrvKX9/4ZQ2MZAJnD4IJ3sxvV6+s/dQ1oN/Fuzf3a8ae?=
 =?us-ascii?Q?pb1H4ew+BljT/+kYmcBJ1SfF7uM4uJLo9ujmYcJ7Q+Pfsn8aoJcNt+gGKvP/?=
 =?us-ascii?Q?hJTRLIYmcSpwxbIh0QKtLq5VAAxHClUwHUBzn2+9i8n/WiFjgRT/6w5yTsDm?=
 =?us-ascii?Q?wAyzgkAU29XFeOZSb9Uqyty6Ux00u411B6tfNNdJyEQg90dvYqEcQk+rAyLu?=
 =?us-ascii?Q?KOEbqRrzhjS5m6Om9Lnk4xuFnnS2EjfXlnNdtSPzMRpdxbZyd2Dh3SuevNdh?=
 =?us-ascii?Q?vmGPygXyG7NUWgP9wa81PSB5Wzpwp5hRmS1PuRK+B+iHvZJ7aqT1MfkskN0U?=
 =?us-ascii?Q?5dyt3pBWodEbridi4tyqtuDmKR/gXoAoywUpLP+AXcIbmfRCaZjeSPUECLkh?=
 =?us-ascii?Q?G9TXKXj25zC1HVhLBFrbxw/r1XwPykOj+kW+GKhqMHAEqRuwMqYXOlA7lSP5?=
 =?us-ascii?Q?NGFApcjAucEgbmyB+I8R2ZiMD4WQjacxwU90GR6wQcfWacb6A/ROh9Sm0WcF?=
 =?us-ascii?Q?pqEThno+lpWq+TAdQr5m//BtjWtF484qlYYeO7YtO34Zv0l2ut9jwdHqxIgg?=
 =?us-ascii?Q?e2vQCX7bV19RbMMwhIt45I/VYzORP2H3B9Fx58tm0MNa7CERRH8dzfKKSd+2?=
 =?us-ascii?Q?TYNYvTLamZysLF4oa3UJ+uOgWT9bvYCOd2Tj1s01OVTJaYGI8P7UYz7LCVUc?=
 =?us-ascii?Q?jXtP6GTvsl5nzl1JlnK3f1rTgLPY4D4jrD3V6bWr4+iR30jOiEzafu3Fwsmt?=
 =?us-ascii?Q?QfwJNYwoAGnnHFHlXl1We6zjzKrWB9Y6IGGW9UydNw4dwes3qc/FiXGxpLN9?=
 =?us-ascii?Q?p2f6Q2XXZ0ElABpJie9st5xOmOrBQBMaHmGfQ8BqUHwoMptZaMxp/d3rGWJ3?=
 =?us-ascii?Q?T8E6EzQNiPUTOepvKhSAcleO3p6N0gSQorEWMQEO7NefTn+2A9RTh12z/9nP?=
 =?us-ascii?Q?tzJVjlX82LDpwFauUlHJNMAemsPbq0uy+QaMsH9DkK0bHH1WERmUuXBVkqLU?=
 =?us-ascii?Q?poyazQRmjkz8EapSch7h4Qg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(19092799006)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xi21JxZDZON6wzZvo7UvSdX9aAuxU8UHYbs0vCEjSldHJSGxUXluzJgNQ5sT?=
 =?us-ascii?Q?Nu6xplulTSiNy9OD1mhBcshpzUzxyHG/soRcZYElQ7GCNB0jPrZUXNVt/ePN?=
 =?us-ascii?Q?XgRFEIvVo473jK8hMY6jVKH4ATmPVWKiz2+oQ7Een3lU9B910+cX/Z8biCjM?=
 =?us-ascii?Q?/8DUKfSDUcezFCBVntnjEX7thXj4clgWRGyzUPXW97zafhdHW3q34rmHfKdA?=
 =?us-ascii?Q?y3ySSHJ6aCFKzOAQDw43uaWiMqD24X22uQa/vcLMg9Dc10MoEeUeBINwuXSv?=
 =?us-ascii?Q?lkBSreqNyymzpxEWLQsMwVRFoRHtChGRgf6uToSVcwH+75KYM6a2lEgW3rmH?=
 =?us-ascii?Q?s9PqgA3mlzUAWXRZ9d9xKTPOS+/sMxeTVBQ4XWEaVU0IsTG4ghCWv3CCxzfD?=
 =?us-ascii?Q?w7TrxVkR8VI+hlU0l+GrFAVzinTasevIHk2NiDtmNB2gmPS23Jp0qZ1DSt/3?=
 =?us-ascii?Q?V95iB7VFh/9lCfccwsSjQEtYksqsjHkElW1RAcfvYu+SaYop+A3gcGOeOE9b?=
 =?us-ascii?Q?V9Byiiv8vvuLE5eUaIXo3oGmkOSQZ/aEvv8q0A00aS1lZsv0P7TX39zqi8Sp?=
 =?us-ascii?Q?dELt3X3HFdQeZ4OFahbhcMumqNmOc7qeqik9czNRX3KQ863vDb6pF3l3C4ZP?=
 =?us-ascii?Q?Qm0ORgEpaTE6RpGZ54MkqyFi/8amAOYZ7rg3Ltoz4xkv4ZS//aO5/fT8BLUK?=
 =?us-ascii?Q?T55zNnTnOG6/B/3dTBOnJNf6itncN5H4hnvdoRUkZkvHLru9vej8eiq8950l?=
 =?us-ascii?Q?POnWgkXoQhwusnJg/5bWrLQvb05gldoVGidT28msMGdb0VEZQf6jOEYMAQkR?=
 =?us-ascii?Q?JoQuI0yDdkRlm/rWmk57xv/pF1e1H3bF3C+ZygLtsfF8WeAqtuFGEQeSuHv3?=
 =?us-ascii?Q?lBLKslC53EDcEq7IVG/42arj4IJ0PVekWoN7nR4s2Cf5MxE2Hfl3UiTN5FIx?=
 =?us-ascii?Q?ABwUF9NTFrteNi1oc1UiTNUcs1Id76aa6m5JN0OyRSj5vr5/9k7S3jSOcK1R?=
 =?us-ascii?Q?MjQ2w7xS5smlzh1bF84JSEsG3I/zDISQTvcy3PNNZf63ua8uwUeq5+cfgaBu?=
 =?us-ascii?Q?2Iz/krnmyPr2qnNNorqZmVo9bX7+x0h1vOb5WnO9oNB6oPL6Ut/nnLCv2SMO?=
 =?us-ascii?Q?m1WS+8qcraDE+3vR1PyuYWS98qO+m4UWh+kjMNTFOPkdSv8j1X0NOFhXhQr4?=
 =?us-ascii?Q?NbPY/Nbw4HuwLa8eRJ76k5FQxqIRzUviCzVvQPKbMEEz+Q4ICCq5ctt+gFFM?=
 =?us-ascii?Q?VSeHipUc0An9owvnKuW24YUonZILoUwcRcCHdSbCjjgBgLerYWU2izvPvbTQ?=
 =?us-ascii?Q?ml2kKVobohp6VfEV9GBdzdLGELlHB9T+bBJW491VyOq0F9OkwBllNaMIoOSz?=
 =?us-ascii?Q?Bvm+X+gjEOCuBkWfKT3K6oUU4mHZC19yDcd1hljZvWOGVKSiypU0bKblsBgY?=
 =?us-ascii?Q?6bd+ranwIUjAL0yJu2kkupcwq5HEDoyrGlGNQg/cmiJyxnYwvJRCNILLMn47?=
 =?us-ascii?Q?CJbUfW7CrHU/gi+mOBqFRshyB1Tp0zZ+LNknSLwl4YzNZiW0OCoHCkwJqe21?=
 =?us-ascii?Q?LiIrJdigD3Nek56yHx4dioUvgiBIFVfE1ciCBDjiMSyC4C3Ia+O8n8Qjn1DC?=
 =?us-ascii?Q?wPjImecSXIFP+DElC0Nl5GLiH3dSjfM93UI9lmJadBFb0rU33fwAOucmXRkV?=
 =?us-ascii?Q?EzE/xnTskKWLvn+qcTEOAPU+jCz9qzvfxGMgauSZWaqq2DKkZ/Nlg86WzAZN?=
 =?us-ascii?Q?Thcptov7TQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f22b28c0-3474-4af5-dceb-08de55100079
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 15:00:35.0877
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d+nnoEzI6VbAHY5mei7Uz7KOoGvjmHb6GOar+LKvmz4Nu0tvx9nQJetPcw+CmNyq3zKzp3FZRCHRa4MkJaYF7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10437
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Jan 16, 2026 at 06:16:47PM +0800, Shengjiu Wang wrote:
> The specific feature for AUDMIX on i.MX952 is that it can be bypassed,
> so add fsl,amix-bypass property for this feature, besides this there is

Need judgement why need 'fsl,amix-bypass', like difference board design
will use bypass or not.

Frank

> no power domain defined on i.MX952, so make power-domains to be
> dedicated to i.MX8QM.
>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  .../devicetree/bindings/sound/fsl,audmix.yaml | 35 +++++++++++++++++--
>  1 file changed, 33 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/sound/fsl,audmix.yaml b/Documentation/devicetree/bindings/sound/fsl,audmix.yaml
> index 3ad197b3c82c..50fb08460b4f 100644
> --- a/Documentation/devicetree/bindings/sound/fsl,audmix.yaml
> +++ b/Documentation/devicetree/bindings/sound/fsl,audmix.yaml
> @@ -34,7 +34,9 @@ description: |
>
>  properties:
>    compatible:
> -    const: fsl,imx8qm-audmix
> +    enum:
> +      - fsl,imx8qm-audmix
> +      - fsl,imx952-audmix
>
>    reg:
>      maxItems: 1
> @@ -75,12 +77,41 @@ properties:
>          unevaluatedProperties: false
>          description: Output port to SAI RX
>
> +  fsl,amix-bypass:
> +    type: boolean
> +    description:
> +      The audmix module is bypassed from hardware.
> +
>  required:
>    - compatible
>    - reg
>    - clocks
>    - clock-names
> -  - power-domains
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - fsl,imx8qm-audmix
> +    then:
> +      required:
> +        - power-domains
> +      not:
> +        required:
> +          - fsl,amix-bypass
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - fsl,imx952-audmix
> +    then:
> +      not:
> +        required:
> +          - power-domains
>
>  unevaluatedProperties: false
>
> --
> 2.34.1
>

