Return-Path: <linuxppc-dev+bounces-15864-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B91B8D282EF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jan 2026 20:44:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dsYNC2G2Vz309H;
	Fri, 16 Jan 2026 06:44:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c20f::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768506283;
	cv=pass; b=Ae/1PBkv+nGCZgM7OsEe7c3RPcEs4hYxPzjq1CjK97KvyELYtyNPe1ZqMP+7ooof6TXskXs6BakBGBe/WFhbogaRN4lXOwLX0edXxhJkNUQx+OnW3EfI/wpwsjzfah3l2J2ob2dHuhMa9C3nn9RK+4Nylk+BPHPu1AGxPMl3vkTe4Tw3txY70rA10QcjgmvPlCx8v7sTVqAH7yqCmxM/rU7NrxObbs9BTIlsBeLsqjYTMVTy1hWl2+LVaZQQKJYU/MfGzrHSGQ2HHdhXzTOWda+S0r3lZMNq34WkTpHg8znN0BsXZTVi8DbQ3oC61ClSOagOouzr3nMq4MwbWJw7ng==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768506283; c=relaxed/relaxed;
	bh=nz7nJoh5ZQU5iu985hFc0YwRr5/63zf+pbplMs9yD9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fg8yRBwR4TQ/WsZmxlwLotgnqoj6QS7njsEdGFBxw9ZSnz8SayrTBlX8ksXPvhm0Xxu3wipaDp4RdHWuh0A/LkvbSU8iz/JJagKhRCCvnE3eSUfTIqhZawXjbJmy2NZgtg8QOehj/YyPHfa60fc0knUfgW/d+XXYewgKkALyaZ4irzWdyGCVZ63awQ78NoQDHcDX2CaZlOplxW7BE0ksKuhFHehjsv5NHFbzJB4Pax2jBwpOu1334RaMHVN+zQBiAxe7WsBI/dvdlPnZGLy8fNiBLl7P2tjcf6Wl5g1ua0E7ylt67JFDHrP0n4QCGHffhHS5fqTuxYOeoM4feqf3Mg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=OwjmBssp; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c20f::7; helo=osppr02cu001.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=OwjmBssp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c20f::7; helo=osppr02cu001.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20f::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dsYN93F0Qz2xNg
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jan 2026 06:44:40 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gilxc0E1m68XWlBMaKAViW3yFECr30tueP7P02zYraw17cUmzNX6BwhTNGMyJ2vyb1Q4laiOX4Y9237ZWlVXAE//YyqsyEvBGvwmzOrfELXhLBf2rBQSnIFSChbueET+RcDID/9IIi5foPCV3CIaUtW1D2TUWyZXVeWnOTxJ8/QHnLo4+F4SJXzkf6NlqAbiLs+mGk8h5WO6JZfZycozMmy56TdU4DXfrr4pnsFevIVmde7HoB1VXRdWGa9g9GDwqp/DoCsoev36ILf3DGo37UApHvwhTQ1aoATty35Jz8sEEHIfyCiVTWc9INmYpHnJ4w61iCbWyr882p1v3tLfQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nz7nJoh5ZQU5iu985hFc0YwRr5/63zf+pbplMs9yD9Q=;
 b=tpGBEYWYlhh5YLepkEBwjjGHkhc1BZg4rDmoVm7gJpjwQNmnbczMH8j0AVabap2mLqXeoA0pZ4mieYs2ZToUQJD0nqZiW3JcGuHiXuU8SkCqSRygoAlQN8nBCg3qnh2sFZiGCUokxnQg6OS0WLP5nN7biTF9dqLqfZU3D79MZhzLlIhlJ92mdVnUY21W7L2AuB1lYvr2/SvzI0k2awIZW26OuYh1hIYQB4vAjereB0O9Ig+BMp6Bc9ODbuKtxEksluKAtZmsBVrtoOX8otQDNo2s3gB4KOfG66UgQOs8Lvm2xceJokh6qyDTNI6mlFXtcTBTVyJfPY7/PzEVvhngcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nz7nJoh5ZQU5iu985hFc0YwRr5/63zf+pbplMs9yD9Q=;
 b=OwjmBsspCHldKKcLyLZ/G4WOuYEF+aco1wwltI+xIgr3IErZy7+cbP5y+JJGxIBxfBwBp9IvI9d934Lo+c0DAKZiiGnlFPktC++I4N3KpmaI5r4uKdoTfXZdK26oG6ZVdMQtis8okiQ9BnaQ4llOFym2uO4yxpCWaXvGhRSR277Wj4/f/Y7ukLgRvdYbN3kUgHQfGEKJH33afTYabcJgh9NY9tbYVN9Ne+9+mMh1dqPlWIyEOHAffoNVFhyxKlapeT4kitmv5egXLdCPBpk9oTft7x7Y/GzUAN08MndeHJoODTB+2dGjysT1rLypwhqPESohPPFWlSJzGsc0K4n/aw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8948.eurprd04.prod.outlook.com (2603:10a6:20b:42f::17)
 by VI0PR04MB11046.eurprd04.prod.outlook.com (2603:10a6:800:269::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Thu, 15 Jan
 2026 19:44:16 +0000
Received: from AS8PR04MB8948.eurprd04.prod.outlook.com
 ([fe80::843f:752e:60d:3e5e]) by AS8PR04MB8948.eurprd04.prod.outlook.com
 ([fe80::843f:752e:60d:3e5e%4]) with mapi id 15.20.9499.002; Thu, 15 Jan 2026
 19:44:15 +0000
Date: Thu, 15 Jan 2026 14:44:00 -0500
From: Frank Li <Frank.li@nxp.com>
To: Niklas Cassel <cassel@kernel.org>
Cc: Koichiro Den <den@valinux.co.jp>, jingoohan1@gmail.com, mani@kernel.org,
	lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org,
	bhelgaas@google.com, vigneshr@ti.com, s-vadapalli@ti.com,
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
Message-ID: <aWlDgFZVC+TK088Z@lizhi-Precision-Tower-5810>
References: <20260115084928.55701-1-den@valinux.co.jp>
 <20260115084928.55701-3-den@valinux.co.jp>
 <aWj/Sr63+hl7CBe/@lizhi-Precision-Tower-5810>
 <aWkF6rT0Du7iJwHh@ryzen>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWkF6rT0Du7iJwHh@ryzen>
X-ClientProxiedBy: PH8P220CA0028.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:348::6) To AS8PR04MB8948.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AS8PR04MB8948:EE_|VI0PR04MB11046:EE_
X-MS-Office365-Filtering-Correlation-Id: de586239-6bba-4670-9627-08de546e7743
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1c3sbuaKBRUjV2PZ8Jd6F6GqSD1B3qir2eyJss6U53J1Mdk+JaxTeirGD/fi?=
 =?us-ascii?Q?Bp1oGeCt50ThcgSsdWtcnLiwZbRhOsPcb76fpZAHo1UMO88oA8n4U62Pyaan?=
 =?us-ascii?Q?17oDfX1Uq5mcc8FvioEEbJl692IsMh1uOvC0LVcJw/DbjeleJCw0P/uKqYmm?=
 =?us-ascii?Q?9UmZAAnxeCSJikLXG18a52TvTbtGPj7IzNOcdxP28ycUwfVTef+VBkz6Kw9M?=
 =?us-ascii?Q?kqDyiAKWzyL8Jt/ysSexf8iTPMVeFMDYUgcgZ5CYsFjv97yCG8TB/3RB6+cB?=
 =?us-ascii?Q?anOi62NA3hwdxfUgYh4FaHwg97+qqE+uaDOSpDA9WUutTwKBD5Cvw0ZBNktF?=
 =?us-ascii?Q?o/mBWRPomfLUxkkpcLP2mA8Gd5n9FL6yfXjdPyl8O/P1z9v9rgRzUzVk2mUN?=
 =?us-ascii?Q?5At6j8thqu/zSEphBjLGpXK+fQdhyRDkNHRO0/VnalFFxijU8wV/aLxnlUtN?=
 =?us-ascii?Q?wtEJ5onvBcjGoOfzigVemTiYHgW38TftWjjNgkWmLC9SgI5SWZqvUhFulWFt?=
 =?us-ascii?Q?P7u6dq6CaZANI7CXEWHlcASvBAdAh9fISWQwVMiaQ7QSLjUDVT608ZizdKbi?=
 =?us-ascii?Q?XAJEHVxsnKConiFuWDR/DXOcU8eKViYbcymmE42jmZAk5iSEDQoBg6NYC+v7?=
 =?us-ascii?Q?9VZTCMoAOKN4oueZkUhkJEbUsZvmw0LMqIUt4iI1COLx4sWIx1WDJECYYgq2?=
 =?us-ascii?Q?WvIMzfC7hztfP/bLR5U/cLhBE78bSDcFK2uLczwWuDCsa8EAWOxNdcZkq/LK?=
 =?us-ascii?Q?ibLE1c4JHsL4Ml2bbHuL35AlnKOaRz+yayM+EMHjlkNSgIvCqJy2WjL0uvVv?=
 =?us-ascii?Q?73YAiQiYfeE6v/D/XhMpdD6y8z/pYHjbb9DE6bAtf3XL7GAgrLAoU1bHBeKA?=
 =?us-ascii?Q?oU2reQC005YSQe53zwmjLjuLH9iLF74c6gvV0FqpSup5JKIPhtHNwLYYdazB?=
 =?us-ascii?Q?J58Vv9UOLTJugrefFgzSzKrKUvHbjnVAJgCOkzw5odfJgH+UByQx8ooEYDSC?=
 =?us-ascii?Q?2Zm6+Nk2QksNReGWzPrOD+vlk3DN94oBtDmPHQa3GcPEn0CxpcPw3LC6yY/X?=
 =?us-ascii?Q?gP1AENS/SODpduSLdpO3/TzflXXnky6N9LYYIDQdA0qjKojFhM2eA9a+UtlD?=
 =?us-ascii?Q?9kAyknpCDHFVvtOCDztUPfNJT+Xok+GQNtH5q4w4b+5V0UNY8LvtMv8291Z/?=
 =?us-ascii?Q?OfJWqfCHflv5DW91saKjESfdrpTwHm7p6hTuha16l79y0P4aikYEPy13UCog?=
 =?us-ascii?Q?A0lpDKzGRxRugdgDzZuApnXtzxiK//yIL+fXh59Cf9QDv6IKW6FKVBXZcGKv?=
 =?us-ascii?Q?g07KBmOvuQhWlhhdXKc3lTBQvH5FnsTCpKik4TSazy/Tl20zrX4+UDds1aeL?=
 =?us-ascii?Q?HdEB+bXoe2y+JVXGBF1mnZyfLM/uSwHzbQ6mr7Eg46oee4nIU8xvvsCk5GW8?=
 =?us-ascii?Q?zA6Nd3MXngXyMhSaw99WOSF2G35gZ7BGQAbQNo9tllbFqgnJtZ+7YGC4brZ9?=
 =?us-ascii?Q?0WoH0l0JMDqOVn2v4rYcJlgoqanUI5wIaONvpXyS5tLS8w4uMtSzWthTSVn3?=
 =?us-ascii?Q?ZP3VcONFkdN1fV2pYJ0BDM9sPfjF6sD1/ticzCDQMi00ejdcjhoGD97vrdpR?=
 =?us-ascii?Q?7Hum9iosowEmaKPK+/lZLvY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8948.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CZ7wxUSEQSiOTI6SoseikPMJImtKwO99XvKoZEZLXmhEHRKUcK60zTBBZYhB?=
 =?us-ascii?Q?00NIQDFbVhBrFhc+zjuw8n0EZhlFHtGzOU9l0pJY2xaFxzUciy+oWUpuW49Q?=
 =?us-ascii?Q?gqHAbuwa4dLoH0OyeXL1psZMV/y8V2VTa3r3BQY2NYdhQ6wpegg4lPs7AzIS?=
 =?us-ascii?Q?DF/kYfnrl3Yp94d8d7IknjDaG4TCeXOVIiTdgw1yBw/QIReWMKbISWUpdBOZ?=
 =?us-ascii?Q?lQW8fA/5ehc5sfPRfhEsjJkyAHoRh+PE7Xrk81LYdBRD3TlWgjzFWQuvwsdE?=
 =?us-ascii?Q?JXPJkM5m3ht2kd6ANTJmWB6B1n+/CeE+HnwGwwAmiLQ1ygASZNzAWPTT5J5I?=
 =?us-ascii?Q?EFPNlAGFoF+BFuLQ6vp/xPej2t2/zu1hfx/LMi5GKe9Dk6akKAFUozws+wCy?=
 =?us-ascii?Q?tLANiJnfcJl8rJlqRFz1sJzGCs6KKcsNujtCvtooyMO8YPrQqTWLTN3EnPZS?=
 =?us-ascii?Q?yKhoCCM0bLFUbx0pM06ONTIVX1KdLxQ6Ft7dSqMG68j+Tfh589uR26uculs4?=
 =?us-ascii?Q?y7kCA6Z5okh+k178TZkA7Si37KIAVBflTbNupLNvT4F8aXlbyG0e77su4/sr?=
 =?us-ascii?Q?o2+0EJcukUM/46ngOsZkLfM4zkRKblvp+dPoKuQ1jM8HraUHGHZE1XoPR/o0?=
 =?us-ascii?Q?ppfqsJJ412XTsKbPss6hlXfi1r4G6YdMhAlv3kz39sOPi1rzvnbg0WnSshGh?=
 =?us-ascii?Q?eG8QeNcAF0xNWDZZHlQPufZmyxIOkC1X0JlACgEKv1Hn51JWtXF0OKr/ouXS?=
 =?us-ascii?Q?rN56PP9GAXYlq0OcbXmhM8AePOB1KO0S0DYjVEu0Psn8IGpH1ZZ71iZtNXBC?=
 =?us-ascii?Q?aUZFtwrGhUNditxFDujn1qLbPWW+kA3qfgIhhiZCbV33wdomoLbHi9kvmgMU?=
 =?us-ascii?Q?hEROdASaWqygzXjQto2SJ2V4ql19QZj3k9Q4hqpE6n3BfBb9HQJkTIDGqOZD?=
 =?us-ascii?Q?did7oNlit3achxD3ZXD+brWbcvv1Af3nYJDFivQzphshsflD4lJ+G2JvGoQJ?=
 =?us-ascii?Q?kSy5YFobKbENcLYFpkHuRSyRTiaz9BXSDQKFJk4Uue//4IvBP1NPQ5VIqKd5?=
 =?us-ascii?Q?dLsLfR3KwdnFcHE8alcxDLzgAbpwBdEIdPj3utgFk2PIXaY4L/76uTLH9H/N?=
 =?us-ascii?Q?v5uFeIWuug1mjPCbrbytrwfUUyyCO5xjTDTh+t6NtKnDdh6sAhG5gF6LbjWi?=
 =?us-ascii?Q?hE63ISCBMFWPUycRfLh7jDHz2K0Hi7RBLCui9wcp3ko1OByC6iki2rlnHnrN?=
 =?us-ascii?Q?PKvXtg3EXUUSmJsYc5BvvjYCZDCYGnlPIlK9LMewaoijGAGtlbDpmlFPjJMo?=
 =?us-ascii?Q?vbHLZbOAY4efdyCEaDjxTZB04eGYMyxnM098M5QXLot32McGqg1vr7n1ACpt?=
 =?us-ascii?Q?26qV/Uu3r11hUpmrvj5XbK1Dt+4FEkQxyS39lyasZ257xIJ3XrVd9HhJfluw?=
 =?us-ascii?Q?da3GguXIL6l2Us4Y2bUwy0UspYO6XTlEwqcCnzdabjAJJoSIvrKR3K5gratG?=
 =?us-ascii?Q?aKMxT1EK0RiIqqKinClYYyedU84MhC9bmu/EgseciScMwCI0dBFw6vLbP8L0?=
 =?us-ascii?Q?1QwgmCIedhXB3cHRo+qxF7wid+ugr7qR3A92S+jDlyar3NYcwN6sneAdFVoF?=
 =?us-ascii?Q?nt7UpnmXlFI/9d1CkmnkX2+On1HrqiCvqU2JvRko7lnVSJsyYTuChVQpyqjG?=
 =?us-ascii?Q?mPHa2YYSxv2etuqNSB5ko+hhzYyevAUY9dr85IqjmahXlQOn9tk+B4T84Dio?=
 =?us-ascii?Q?E1YPAs7ohQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de586239-6bba-4670-9627-08de546e7743
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8948.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 19:44:15.9174
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mhomkJ9X/LI6WGxfaJZ1pMoLeNeMYoM3Qv4lJ+YDKxkWFCHR1z4n8T8bOZPgLRbIUZiGioL9AsZoIIPB2RBLCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11046
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Jan 15, 2026 at 04:21:21PM +0100, Niklas Cassel wrote:
> On Thu, Jan 15, 2026 at 09:52:58AM -0500, Frank Li wrote:
> > > @@ -127,6 +150,10 @@ struct pci_epf_bar {
> > >  	size_t		mem_size;
> > >  	enum pci_barno	barno;
> > >  	int		flags;
> > > +
> > > +	/* Optional sub-range mapping */
> > > +	unsigned int	num_submap;
> > > +	struct pci_epf_bar_submap	*submap;
> >
> > struct pci_epf_bar_submap submap[] __counted_by(num_submap);
> >
> > Not sure if use this simplify alloc/free.
>
> Your suggestion changes the submap from a pointer to a flexible array
> member.
>
> A flexible array member must always be last in the struct,
> and you can only have one flexible array member per struct.
>
> Additionally, using a flexible array member requires the struct to
> always be allocated on the heap. You can't allocate a struct with a
> flexible array member on the stack.
>
> So I'm not sure that if your suggestion is something we want.

Yes, forget my comments if not fit.

Frank
>
>
> Kind regards,
> Niklas

