Return-Path: <linuxppc-dev+bounces-15851-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA44D25142
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jan 2026 15:53:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dsQwW0gLVz309H;
	Fri, 16 Jan 2026 01:53:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c201::6" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768488826;
	cv=pass; b=GqT/AADP3BcE/psEJ3Ls2bkVf5EJX18oR1kJl2w6Ka4pVvQu8rp5BzjCDJsofuizSoWgiSb/2CIsAjgLA+MAd2H1EHLqzZ+o6C6luOfkXaPj5m9f6ZsY7Nd7xWwfuz/lTbZO7MLqYa/xPt2KjePfnpEqKLNvv2VBVu/QoIglzyguNcwxNhRPrCVj91TPtIn6mnD/zkAuFmhrNRJ6X6Qnrx6GUb7NZwP6tRhZlJRrW/4cxu+j6oIpnpSUoGnpyc8x44IHOSLQb8Vr+kbmNxGVFKj0QLmhTbDNUUZwFRxEPrpAIOwSM2AJte4chWlmgjuLQ1okziA0LBCiZsSiQs0U9A==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768488826; c=relaxed/relaxed;
	bh=NwEpN3ULZ0pGo24iuVPoGe7uONTgEMh7VJlpEv+0nVE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=a+C4AJ0E9oZkWUvgFRdRQ1qTjXZXoU0mQIkW5KgQtmRPcSxbnV++SGEfZkg3M0pfomKiE1AUdqsiXAtxaC3kPzeT7qYHuQ2KoxEKQipISc0iTOrIleA2p4UYB0+7X5uqrRms5rZL2B90dbkdqwp0HWJNrgdZmfQmVA/UhFfsDBlcMi+6DvMooYMehsWmuOHLaku4pYJ+cxGCDa3qgU2RYK9I+O2oT9jo62s6KzEziV0Uj7VxwI+adSaBn6+80+D49rr68jXM29JSmbjwNYCZPW6l2MzRiyTreR9D6TzH8rlHVVToGPF7EpU3iDYuJsPffTJvFcq1jom5sBfc1XpcQQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=inRJDC6A; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c201::6; helo=am0pr02cu008.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=inRJDC6A;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c201::6; helo=am0pr02cu008.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazlp170130006.outbound.protection.outlook.com [IPv6:2a01:111:f403:c201::6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dsQwT2Jwkz2xNg
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jan 2026 01:53:45 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rOIOZTQikC2k1c+oT/CBzP4MoODpdwu/TY3f3vcDPmxph+zI2RqGzphqWq/zzLWdTOcu/nZlfhFPC28HprDEO4b6B3l3WmftlRALrH3LID+NqavNYIzAtvy+VqWwwuPiaGdp6Y3FX5SoRbZdRPwBlVUM6sFuxHGIGnpn1DYlprtLg90qe3y+LyqgAIKKbXHg3UoctischuHxkMOq2ev2Xtgvb/4llRipUntCU1onu/cCdlt/HdQBWMqpbm5v1QW2wetY44DmYRJzAZW9eWm/T+/CVEq2S+Qv1wJ9aw3WBlU4cmy6rdkA85al/MNi12a5zGH7pGbQw0IEnKLRkvJHnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NwEpN3ULZ0pGo24iuVPoGe7uONTgEMh7VJlpEv+0nVE=;
 b=Qbyc5q8spFQhNZqAcvdFzzlB4iRhZRDQOJndfG4JQhGAAGV9/byfoxyQdLzeNWPUPKafmLZB7znduvZ9qhQFVaA3T2SM4yBQqaNwQLxP2LDye3SB800+oDGtPTx/8o+8Wnu7b+FPCwdmHyrBjoQ2CfVldupsNSmXwPY2EuVBKs9HVBHaBgcmg6HChvPwJqVK9mx9KBR6Gh8KKj4AR+k6nl+YMXssaE06CgzrteFdeUpJ08Ivtq/NS8uBG39WG61/HGj9WzFCvBROFem4FCEQbrSRSaa1X95WighPzJtd2mBfxkEoGT0/t/XsY9YZA6sTR0NAfcB2shPmw1IJ304K2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NwEpN3ULZ0pGo24iuVPoGe7uONTgEMh7VJlpEv+0nVE=;
 b=inRJDC6AHwuv1SLiT2EGfXY+yXfLtQJnYY5T7KRqwpz2A+sXIbybDXP/otA6n35YvTDvQgesDx7ekiO9U8FX+fZeX9cEfrFKgEZIzxkqgP6JQwNkQRbfKpRQhEfpVZtC4bLE2jVe5OAL5AE67q/Nja2I9B6Y8ppkuq35Zk0nSlPJR6AfYHom71LWSLiAgOhdCWa33Mbhrv/yCM4LAI+roadUXtT9QUc49cqOLUVjgChzDTpBjB0nLCCQRPKjy6r+j3ZpUmmmhAcxWWLH8MJ28z/0/esM3wFI/BKRmZedWh+rZCcmeMWghMIYCvkp8W/csjrr5+iLujV/2TyRkzxmgQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8948.eurprd04.prod.outlook.com (2603:10a6:20b:42f::17)
 by AS8PR04MB9078.eurprd04.prod.outlook.com (2603:10a6:20b:445::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Thu, 15 Jan
 2026 14:53:15 +0000
Received: from AS8PR04MB8948.eurprd04.prod.outlook.com
 ([fe80::843f:752e:60d:3e5e]) by AS8PR04MB8948.eurprd04.prod.outlook.com
 ([fe80::843f:752e:60d:3e5e%4]) with mapi id 15.20.9499.002; Thu, 15 Jan 2026
 14:53:14 +0000
Date: Thu, 15 Jan 2026 09:52:58 -0500
From: Frank Li <Frank.li@nxp.com>
To: Koichiro Den <den@valinux.co.jp>
Cc: jingoohan1@gmail.com, mani@kernel.org, lpieralisi@kernel.org,
	kwilczynski@kernel.org, robh@kernel.org, bhelgaas@google.com,
	cassel@kernel.org, vigneshr@ti.com, s-vadapalli@ti.com,
	hongxing.zhu@nxp.com, l.stach@pengutronix.de, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	minghuan.Lian@nxp.com, mingkai.hu@nxp.com, roy.zang@nxp.com,
	jesper.nilsson@axis.com, heiko@sntech.de,
	srikanth.thokala@intel.com, marek.vasut+renesas@gmail.com,
	yoshihiro.shimoda.uh@renesas.com, geert+renesas@glider.be,
	magnus.damm@gmail.com, christian.bruel@foss.st.com,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	thierry.reding@gmail.com, jonathanh@nvidia.com,
	hayashi.kunihiko@socionext.com, mhiramat@kernel.org,
	kishon@kernel.org, jirislaby@kernel.org, rongqianfeng@vivo.com,
	18255117159@163.com, shawn.lin@rock-chips.com,
	nicolas.frattaroli@collabora.com, linux.amoon@gmail.com,
	vidyas@nvidia.com, linux-omap@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@axis.com,
	linux-rockchip@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH v8 2/5] PCI: endpoint: Add BAR subrange mapping support
Message-ID: <aWj/Sr63+hl7CBe/@lizhi-Precision-Tower-5810>
References: <20260115084928.55701-1-den@valinux.co.jp>
 <20260115084928.55701-3-den@valinux.co.jp>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115084928.55701-3-den@valinux.co.jp>
X-ClientProxiedBy: SJ0PR05CA0086.namprd05.prod.outlook.com
 (2603:10b6:a03:332::31) To AS8PR04MB8948.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::17)
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
X-MS-TrafficTypeDiagnostic: AS8PR04MB8948:EE_|AS8PR04MB9078:EE_
X-MS-Office365-Filtering-Correlation-Id: d1855dd9-67f5-4be6-d9a5-08de5445cfa6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|19092799006|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5oPQsfVSg2tVwfrFS7kGEJlXFL+/D29UV0ZPSyPgHGui2OuZfIqiFNR40GGx?=
 =?us-ascii?Q?aV8EdK14s0oOoNzvVszWTFFqADZGyRhgrgbYE0knJ7Irw4NZTp+QwOuam1fP?=
 =?us-ascii?Q?Jtf2I3hFN7y3M38YfeFU3LToDoRrDV3tQeaKSwbvZ+IcOD2/gpPoiglqQO7r?=
 =?us-ascii?Q?mF4Aag2LX4JUZthue29cABz+idg6Lc223QXEjRQmrzN3TCI23wN8ohsrBB+7?=
 =?us-ascii?Q?xLzyuWiX9X5obTT7VhpiC525mS9PXte4k67fRsY9FfI7w1spB3WhWYP9q/us?=
 =?us-ascii?Q?Kdaqi8zXpFR8MJYCDbh6RXuDm8azk/M0/LNfj9yZqNp7Qmxjxp4FIFPE9pth?=
 =?us-ascii?Q?0MOc98fC9ZA/gXLBAahud8fnilLXJ+RuuAOl74bIKjGG3SnCJaNxL+qyDUXx?=
 =?us-ascii?Q?R8o42x9NNcJchJBaHMhIJj2Z8V8bNPJRDV/EuxPKVjv+++jf+rj/GAirXtKf?=
 =?us-ascii?Q?90jkMFi+yu2KdaIVl00nbIBUccc6X/l0NF4qf/+FZpBDTqwKcorVLm6WUGtx?=
 =?us-ascii?Q?jxiilJFdskSw8xkaEc1F19BF5frwvMZeGFsNdje32rIa3+dDoCt8hTt44ot1?=
 =?us-ascii?Q?Uz+w6GYECW2k7yXB6BcW7KZnBVlhagpdpJZ2/oY1Oo2UfOcj7yQKudKIhLLw?=
 =?us-ascii?Q?YXoPYx1XOZbi+h7PpKpXuG+nKdJk072V3rmwswVW9DeyVnOoptfQFG77n/m+?=
 =?us-ascii?Q?hMW5Dz6+ObwY8okgQh8A4t/cHkOmaU7ATfo73MEWqL3OoZVtb4O/NFC53UDd?=
 =?us-ascii?Q?Anqg0KTdsa5yLUz0vy/YWhODAHuyYPuNX4bgdV4K+gVC0ra0KCL0UFngpidt?=
 =?us-ascii?Q?2qXnc6KolDl9FdtA7dtSPhaPDYtsU9CYBqVLDAVhhgyxsa9IhSlwUfJEIblT?=
 =?us-ascii?Q?qkWn386xA1b+LOJOuWNRp9JBAYlm8unXQ+jm5M+/04iiq+bWBFssr3AcvnZz?=
 =?us-ascii?Q?Psgv79NVCy4q7+wHX3J9EzSAX1D5X53fETQKPel0HNzVv99oAM8N9ak9fneP?=
 =?us-ascii?Q?2jsYyX3RTmBbzAsAsOmnWcf6lPp7v3lancoz29wh0fwXgUmjPQ/JKnjIAXb9?=
 =?us-ascii?Q?KpKQ+sYV6B/sM1XeaNlMHzDjbNMsbfZiTR9+esHc4xfLwP1sgmelVr8HrWXh?=
 =?us-ascii?Q?0Ulpr6mAxk5qVKn/SaZZ1Nvp0wJ2LU3Ih0GPzBmnuTSTPBf7yIcSgCnjjeHy?=
 =?us-ascii?Q?t2S72M7yA1supVevjfPXwTpjLykm9TzDDvDZoY2UMG9QHIdSqx/MCmvMV6op?=
 =?us-ascii?Q?iymNES2gIg//mjU1TzVwshXpcfd3EteVQdmt5NByzTfGS5SZm7h6XUAURHWv?=
 =?us-ascii?Q?139oENR/xlFaYaKMzHRa56Ez0RIPqs/AtAcdkbVsouhyE/M3Tvonvp3tstW8?=
 =?us-ascii?Q?ln9K0XuvckAmZrZy/AHWvTxf3Np0b9Jsw+whh81pIjLzOM2zvw8Jet3etrwu?=
 =?us-ascii?Q?KxVODVPS9hhBJVID1v5ag2tNhOvFcGaICUO6MtNyJbK8CLMkB9Z/GmQDhF7L?=
 =?us-ascii?Q?Inip/BOM7/UNuoNxxGV94jZV1BIWJjuseMdjWGMWtAKne2R2drBYO3Vy3WhO?=
 =?us-ascii?Q?PgBMBpOPy0O+DLU5A9kSSDxz7em4BN4mXFtQOMqioAI2wJ7xkiYWpc+1vAL6?=
 =?us-ascii?Q?K5nSOxfZXpRVGkE+TWV/+ic=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8948.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(19092799006)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mGorIfuBD0t/E/vR/ZVygIBGuAo6AmKqW9zNkMrT/qxRhOkA6NpPb7j0Apx5?=
 =?us-ascii?Q?VQQBb2zV3gUcw1hY10cR8pg9ubnXXfWqDmYQVvEOwPaTorDqsUhjkZ2IoHV1?=
 =?us-ascii?Q?+2zjSv2k9taFabuwPPT60pVMRWRKQMYnr0ZzelUhurRACNbD4kOr16iET4DZ?=
 =?us-ascii?Q?a990gEi45jaq/rFfEQ2n8Z0appi4uRk92lG4MeD/pXhIl+VVS8CdsrqSIe4t?=
 =?us-ascii?Q?l4kUyZgjthLHPg55qyl0Eh6zYoNax8jU6y9DVGjU8CQ3xA5LfcTizjHIwbHu?=
 =?us-ascii?Q?n6f2D0HeYi+0NfNUErkCy1OxER884AoM5m8ITAIItUrZTIdyZ2xSktn45l9L?=
 =?us-ascii?Q?xFKH+vvztihhZ8SEk4PGUwo7oL6X6KigFY7oFBe/ftJZWIhFCmnkNqoJRDSb?=
 =?us-ascii?Q?uxnYaB9X9tv4BUZQzh8zadJDl4Mw208RQEeMX0xFCcg/WktKYShkaTypMs2f?=
 =?us-ascii?Q?n8xB5mAKAxfNkONcHq/PBjZo598wSle6MQx1h62AwtooU5g67xLQWzVPMVZb?=
 =?us-ascii?Q?FtppfLXIhkI8/JmHWM3A4KuLvXQCkNHYITpLdese3kpyb/MDioVOSXhkiCxO?=
 =?us-ascii?Q?4/LTnHyuJBL/FNT0HGBpQj0WlSHmlMax/LUk0sqXws+kWwFoiYTSbskG6V79?=
 =?us-ascii?Q?QflxUIQKSPPqchvRNKxecydkdylu+1h5I8eDYazlqm9LAXg9INUJlwxrlZxZ?=
 =?us-ascii?Q?YDfIVyV7GHwB6Fil44qG/gO3mPcPs4jtOPgVmcDpROIv4Nwmsju7EibeUDvj?=
 =?us-ascii?Q?OwcxOz5uD144ycq951B3GfbhKdKwdgedaVTedjrj8RUIIQJCfP/r8qu7Rr7u?=
 =?us-ascii?Q?lheqayY74VhzgHr6c79G3nif7CySa0VprmDgDREI4mBJdERl8jGsQCt7pmfW?=
 =?us-ascii?Q?Xn3HLo7aoVN1CQid36MiAdNCbxYn0X1UEA7lXD+u8hnwZzVpxBoUrJqC1boB?=
 =?us-ascii?Q?zs9YEkPcuFht0ZchMD1ry6RAp7L15doZZHbLDOEiv0p3UoMgQS2XR2L/eRmK?=
 =?us-ascii?Q?yBoeSEtGzTPASTEQ2nLMH+WwnKDHC/lUDqdZRBMKMIlfoFSN+3a2dOAi0sHR?=
 =?us-ascii?Q?HaM9oBb3IbYke5764DR3N8SL/Wy97/7UujIlKvKYPbJFaMFBCjHE3U238HGT?=
 =?us-ascii?Q?tJG9y99TXtXmuftDaB6koSuAXFax1F59tFkMcZ3R1YNUQ7GxgcmUlcKPbfWH?=
 =?us-ascii?Q?A/lWP8VHsZ8aqQZyIX5l21EQPtqiP/78SZBDOKMYJe0k+XWgrKS65eGg/5s2?=
 =?us-ascii?Q?4aJzaht0JH9Y82Rn7/BQ/7L5CGpbzKLYA3qtzuihrV3Zc4iI7M+m6kkiJCWM?=
 =?us-ascii?Q?jIt8ziJ1ZKeIXjiQhMbjP09QXt+QF46AVbCMT0JhWgg7Xx/XQiW+0t6Jk1z4?=
 =?us-ascii?Q?LHqMfxgNuFY2x/eWNiMs/hO/wkSD3epDtkZP6NzStMqcxq0204fsXXILLTQf?=
 =?us-ascii?Q?uNWLvKMW9DHNfnBoxpw1rlpHtVDaIzjftoamgKoINTLq0b5NaiWNLB5Jhk10?=
 =?us-ascii?Q?cXu6qO8+cECKRbR9uVUTHiUWnkuQ0BPsm+RtXjXzm1eVHqASN/262HY0g2Bo?=
 =?us-ascii?Q?o7pPKBqa0za2THjqgQ7W/HYYdnohY3lAC7SzNcl/Lmop/Qz10oe1kQ6jy3SF?=
 =?us-ascii?Q?SxgDzISdGDk4Yl0WmnDB590qP8ZJF5EUKGL3TVNRv1FdIJE1XFFiD2wTbzJA?=
 =?us-ascii?Q?l+ysdKJnUq9ea/UTIAtk6eHX75lYfWu7tbHYO04RxK2OUqtL?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1855dd9-67f5-4be6-d9a5-08de5445cfa6
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8948.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 14:53:14.9123
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uB0nZ/zYaCU/l+931547YwTgX5ALaF2R0xSLJ7XW0S+IqJjGXoFOLyRA2iYBEKXxXVHQbUwCt8fFSTQVTvX6uQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9078
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Jan 15, 2026 at 05:49:25PM +0900, Koichiro Den wrote:
> Extend the PCI endpoint core to support mapping subranges within a BAR.
> Add an optional 'submap' field in struct pci_epf_bar so an endpoint
> function driver can request inbound mappings that fully cover the BAR.
>
> Introduce a new EPC feature bit, subrange_mapping, and reject submap
> requests from pci_epc_set_bar() unless the controller advertises both
> subrange_mapping and dynamic_inbound_mapping features.
>
> The submap array describes the complete BAR layout (no overlaps and no
> gaps are allowed to avoid exposing untranslated address ranges). This
> provides the generic infrastructure needed to map multiple logical
> regions into a single BAR at different offsets, without assuming a
> controller-specific inbound address translation mechanism.
>
> Signed-off-by: Koichiro Den <den@valinux.co.jp>
> ---
>  drivers/pci/endpoint/pci-epc-core.c |  8 ++++++++
>  include/linux/pci-epc.h             |  4 ++++
>  include/linux/pci-epf.h             | 27 +++++++++++++++++++++++++++
>  3 files changed, 39 insertions(+)
>
> diff --git a/drivers/pci/endpoint/pci-epc-core.c b/drivers/pci/endpoint/pci-epc-core.c
> index ca7f19cc973a..068155819c57 100644
> --- a/drivers/pci/endpoint/pci-epc-core.c
> +++ b/drivers/pci/endpoint/pci-epc-core.c
> @@ -596,6 +596,14 @@ int pci_epc_set_bar(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
>  	if (!epc_features)
>  		return -EINVAL;
>
> +	if (epf_bar->num_submap && !epf_bar->submap)
> +		return -EINVAL;
> +
> +	if (epf_bar->num_submap &&
> +	    !(epc_features->dynamic_inbound_mapping &&
> +	      epc_features->subrange_mapping))
> +		return -EINVAL;
> +
>  	if (epc_features->bar[bar].type == BAR_RESIZABLE &&
>  	    (epf_bar->size < SZ_1M || (u64)epf_bar->size > (SZ_128G * 1024)))
>  		return -EINVAL;
> diff --git a/include/linux/pci-epc.h b/include/linux/pci-epc.h
> index 4c8516756c56..c021c7af175f 100644
> --- a/include/linux/pci-epc.h
> +++ b/include/linux/pci-epc.h
> @@ -227,6 +227,9 @@ struct pci_epc_bar_desc {
>   *                           inbound mappings for an already configured BAR
>   *                           (i.e. allow calling pci_epc_set_bar() again
>   *                           without first calling pci_epc_clear_bar())
> + * @subrange_mapping: indicate if the EPC device can map inbound subranges for a
> + *                    BAR. This feature depends on @dynamic_inbound_mapping
> + *                    feature.
>   * @msi_capable: indicate if the endpoint function has MSI capability
>   * @msix_capable: indicate if the endpoint function has MSI-X capability
>   * @intx_capable: indicate if the endpoint can raise INTx interrupts
> @@ -236,6 +239,7 @@ struct pci_epc_bar_desc {
>  struct pci_epc_features {
>  	unsigned int	linkup_notifier : 1;
>  	unsigned int	dynamic_inbound_mapping : 1;
> +	unsigned int	subrange_mapping : 1;
>  	unsigned int	msi_capable : 1;
>  	unsigned int	msix_capable : 1;
>  	unsigned int	intx_capable : 1;
> diff --git a/include/linux/pci-epf.h b/include/linux/pci-epf.h
> index 48f68c4dcfa5..46f817da6e24 100644
> --- a/include/linux/pci-epf.h
> +++ b/include/linux/pci-epf.h
> @@ -110,6 +110,26 @@ struct pci_epf_driver {
>
>  #define to_pci_epf_driver(drv) container_of_const((drv), struct pci_epf_driver, driver)
>
> +/**
> + * struct pci_epf_bar_submap - BAR subrange for inbound mapping
> + * @phys_addr: target physical/DMA address for this subrange
> + * @size: the size of the subrange to be mapped
> + *
> + * When pci_epf_bar.num_submap is >0, pci_epf_bar.submap describes the
> + * complete BAR layout. This allows an EPC driver to program multiple
> + * inbound translation windows for a single BAR when supported by the
> + * controller. The array order defines the BAR layout (submap[0] at offset
> + * 0, and each immediately follows the previous one).
> + *
> + * Note that the subranges:
> + * - must be non-overlapping
> + * - must exactly cover the BAR (i.e. no holes)

It is impossible after use 'size'. It can be removed.

> + */
> +struct pci_epf_bar_submap {
> +	dma_addr_t	phys_addr;
> +	size_t		size;
> +};
> +
>  /**
>   * struct pci_epf_bar - represents the BAR of EPF device
>   * @phys_addr: physical address that should be mapped to the BAR
> @@ -119,6 +139,9 @@ struct pci_epf_driver {
>   *            requirement
>   * @barno: BAR number
>   * @flags: flags that are set for the BAR
> + * @num_submap: number of entries in @submap
> + * @submap: array of subrange descriptors allocated by the caller. See
> + *          struct pci_epf_bar_submap for the restrictions in detail.
>   */
>  struct pci_epf_bar {
>  	dma_addr_t	phys_addr;
> @@ -127,6 +150,10 @@ struct pci_epf_bar {
>  	size_t		mem_size;
>  	enum pci_barno	barno;
>  	int		flags;
> +
> +	/* Optional sub-range mapping */
> +	unsigned int	num_submap;
> +	struct pci_epf_bar_submap	*submap;

struct pci_epf_bar_submap submap[] __counted_by(num_submap);

Not sure if use this simplify alloc/free.

Frank
>  };
>
>  /**
> --
> 2.51.0
>

