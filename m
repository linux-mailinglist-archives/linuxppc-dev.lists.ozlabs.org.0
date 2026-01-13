Return-Path: <linuxppc-dev+bounces-15652-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BE4D1A3EB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jan 2026 17:28:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4drF6K2ljrz2yRG;
	Wed, 14 Jan 2026 03:28:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=52.101.229.90 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768321689;
	cv=pass; b=a2fuoIbn0LRk/S8L8aAC6QrbHWFqSO4v5N2hMdWGrS9VCGzJg/34kHOVGmq8nJmzIRnXvlvzCggzN1uPPuivH3fTvyfaJj9fbOp+HfXc7QyxMnpuce/PkfSwL7LAE9rwbOWbq9eksxko4UCmZZe+Hz6cnLjWQ/yiWpgN0FKXVvt5InUj3FyN0kfjte+9yK2uiL2WHzxcZTj3giPDEucN+HHFlCGqL8PDDjW8Vl0753s+gVm3Br0CN3SSIqzS+VFA8YqgEItas6tO9EzjJBPDURVQMJ3US8MJ81r/8ZYX1l2aM1vmqokSrlUr48sU6k7wJQqlun9In89NXWMbiYj/DA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768321689; c=relaxed/relaxed;
	bh=c1vYwFlaFbg02i+yPgaDCU6Hr8JAesl2qe7CExleuoY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EDP37NUpyMTZJHvBCpskbVkBo4kv33FwV97xPAV0MwsOsL4qAD0e7ZzyT+G7ZTnCIlFQlVG2Nq4ihfNau1Y82k5/4BmqHTemb9+ZJKfcC3JqySuoPOhcJX9SmS0kqyaBvJax71Eb3MxBiSlM74yzV/pG+K6ywcajxthcV6818Q0HT1skgKtyyzioKsQO6NLbbb4TfDuJnVIuNCLTsl5DZGFKLk81PefWI4OUAo62oKaXN+7yMuAdO7MLrYKEUO8PbHuTYdeib3i335PEwc5pZHPOo4BaBGWb7udQ3TCJKL2cXP9Ttiw0KV7wPMPEuz429wkKPCKopyyfzd6X9W8/jA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; dkim=pass (1024-bit key; unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=dzqY1ptB; dkim-atps=neutral; spf=pass (client-ip=52.101.229.90; helo=ty3p286cu002.outbound.protection.outlook.com; envelope-from=den@valinux.co.jp; receiver=lists.ozlabs.org) smtp.mailfrom=valinux.co.jp
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=dzqY1ptB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=valinux.co.jp (client-ip=52.101.229.90; helo=ty3p286cu002.outbound.protection.outlook.com; envelope-from=den@valinux.co.jp; receiver=lists.ozlabs.org)
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11020090.outbound.protection.outlook.com [52.101.229.90])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drF6J1s0Yz2yCL
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jan 2026 03:28:08 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kwdggBV7zAmi7MglRGXh0KcmMs7tHYRXHoxq4zllybD/4ZIJiD1jFz/SjBNCAL2dBQl0Xvh0iwJJ5r65ovFNLIIju5VRLWdR5PtRqJH4adYX+mHTt8I+hYs49ciYjTvD7H5qA2GQglLKfaeP5gh7WKzpD86l8O+Kd3JEsR903/d3Dn+mYvynP4V1Vt7yrfcb3SD1QRBSXUHn9SDgFvbfGy1KH888L/WSpupODJhIIlQ3091JPQbG5pIg6PKxSZuHooVkRBVQgsPv6oxE+Bcv8/FH3q9RXZL8QLn5nzQ4geo2q7Issb5JQhPQgiEzoST7fB4XQGBD/TJtfCV89hTZjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c1vYwFlaFbg02i+yPgaDCU6Hr8JAesl2qe7CExleuoY=;
 b=IMMJmjYuvTYCGBJfCdTisZLTt5rATd7Dve8bsw4LMbNp1ba5rhALbUnJOXrEmRzQH1LDnF+0VFC7h1S07qeufIHyiCJs4d/18ppdgS06/j4oRZWw5guLuUp1m+BGdINsobG8rZThekj7GC1iev3Y2DS9S0ZvYFFLysRRVM5dRocN34F70VQg/4lcxPHQWkSyuhEr61RtxThHUdvWvIsnoTkMOD0eaoyN+6IL+0RT55QhPSAK6fEJ/Xp1KceL6I0Z1Y4RfCyrWr1n+OYcvMJgqXQB1M/Gbqtq8e77VkVmfalAoeSyc/ApGNnw2EOeyH0hJEQKAnaop6St0TZC1Mfb1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c1vYwFlaFbg02i+yPgaDCU6Hr8JAesl2qe7CExleuoY=;
 b=dzqY1ptBPpAk3JWYuL0IQNIUs/XCF5jkHp74ZrBP3rs3ESzDiklAzY7mdadWeeNXo8j+tW1S2xpWS8NQLmgAqwNrJAq/uaQbtZPgtHD4Vt3chrmLbTUixvGBhSE23Sg4KwK2LFfaQVzQ+tHgYI+7NF6YrgznIFIsdj54lNxDKGE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYWP286MB3400.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:2dd::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Tue, 13 Jan
 2026 16:27:28 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 16:27:28 +0000
From: Koichiro Den <den@valinux.co.jp>
To: jingoohan1@gmail.com,
	mani@kernel.org,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	robh@kernel.org,
	bhelgaas@google.com,
	cassel@kernel.org
Cc: vigneshr@ti.com,
	s-vadapalli@ti.com,
	hongxing.zhu@nxp.com,
	l.stach@pengutronix.de,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	minghuan.Lian@nxp.com,
	mingkai.hu@nxp.com,
	roy.zang@nxp.com,
	jesper.nilsson@axis.com,
	heiko@sntech.de,
	srikanth.thokala@intel.com,
	marek.vasut+renesas@gmail.com,
	yoshihiro.shimoda.uh@renesas.com,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	christian.bruel@foss.st.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	hayashi.kunihiko@socionext.com,
	mhiramat@kernel.org,
	kishon@kernel.org,
	jirislaby@kernel.org,
	rongqianfeng@vivo.com,
	18255117159@163.com,
	shawn.lin@rock-chips.com,
	nicolas.frattaroli@collabora.com,
	linux.amoon@gmail.com,
	vidyas@nvidia.com,
	Frank.Li@nxp.com,
	linux-omap@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@axis.com,
	linux-rockchip@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-tegra@vger.kernel.org
Subject: [PATCH v7 4/6] PCI: dwc: Advertise dynamic inbound mapping support
Date: Wed, 14 Jan 2026 01:27:17 +0900
Message-ID: <20260113162719.3710268-5-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260113162719.3710268-1-den@valinux.co.jp>
References: <20260113162719.3710268-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P286CA0012.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:26d::10) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
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
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYWP286MB3400:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fa477e8-77e8-4878-ad86-08de52c0a499
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nDdqwioUU/sD1KQf82EUeePi2W4lro/eMf1JTACkm09I0snO9C5Vp38LoFjo?=
 =?us-ascii?Q?f/X5EWTenHGn2I7Dq3hZZEY5IAe6UntS/Ic35wthGM8/vYFwfVdcVPfRIKKZ?=
 =?us-ascii?Q?mS+SzAa9O1BSQ9Riftpzo4JWIkwuFSbBnerdxaKip+0gfUbrh816k43LmceT?=
 =?us-ascii?Q?RiU+Kc9JMry23fHkDSGAib62TyfV6A48zV7ZQ+WXAP1EoCYITs0yKydLtEOF?=
 =?us-ascii?Q?DvtTyizdwegIH+jkoO6rTO0nRkQw3zvlhsk+TmDB9Da2pl84yYNfvqD2AkfA?=
 =?us-ascii?Q?bj9Fk5o5L+Sj4hRS9zGFqhgbkzB7p4i3LIBcSZl6Kjl+V8zLJ1aZ3FR1rgcL?=
 =?us-ascii?Q?03+o8NxBQQmMfh6uILveKh8gz+3087acXkvfeIhWvPSyVrS6BgmpxWJTCLpR?=
 =?us-ascii?Q?ZUAb8i680LcAW2Nv3dsp2PN0jy0FozTFFJ9Vwujy6ZwxgO626LpDAH0HbL6Y?=
 =?us-ascii?Q?saXJ1o8wttt4klqhxsmqZqgZ2HjPbZ78J05ySJCwOiz2ZJ5CdIK00cXhauT7?=
 =?us-ascii?Q?u82MhvOuLTY88YhZYcnobqJBhz6QBhnAw/NqMaFuiPMTHEGME0CFLGt8F6Ep?=
 =?us-ascii?Q?HoCxOaXynP3fq7WltsRNsKJau2AXICAA9wO7OEUWExb1Lc/g7r6Pbz2WFTla?=
 =?us-ascii?Q?okK+2vOmiuPaKE6O/5f3s8aWqkh+6qtW9gKlbMz9l9Zae999QDC57mpoKFVY?=
 =?us-ascii?Q?gOG6T+749F44JcWkPdM5vVRckILNBDkZYdVCdTs/TWT/2w45XI4RF+7X2QR1?=
 =?us-ascii?Q?MQrrjrlg5hI5wdsBqbi6WXh6MGoegTROXM0HuUY4jzUcyUEn8nDj7QhBXzdw?=
 =?us-ascii?Q?I+Yl7YcoMP8DUcc2J0rMVIVPi5EsFmFQgOAANsjL8rgzUB/AJNN8cpRxdDro?=
 =?us-ascii?Q?JfTO8CKq3maMxKxY+hBiQL7vcBPCsms5QpyMOdhPnKTLdqt2qtSgQRmIluZY?=
 =?us-ascii?Q?A2dgTZnca6HBHz5xqLWhVtb0tdMUlDrexaHup9uY7kxk+4zIKNWbIEa8RugQ?=
 =?us-ascii?Q?HGRj4EyXinsNR3fOtDPxljIz6yUwdgK4jti+R3JezDigHES2H+dlDPqbptbW?=
 =?us-ascii?Q?YE1+zqWbL4gIHiBCPk37TY7kaeIX8F8rR8Vm3sWszSoxtUQr72w4gZNm1GGz?=
 =?us-ascii?Q?Io9NjcdzSSm++t/+iyu9o9XOaLEQ2An1lbveP7zRQWdDb+DN8zs90XGjn4Ca?=
 =?us-ascii?Q?eQI/98ZpghcEmQ7TdOqXtD+Un1JbcTzd4lyMJDspYxEF+nre6/PPgR4mnUME?=
 =?us-ascii?Q?fUd7bA2amoJIKLMBx5SNtAtOMuXYoi2cmbBgQ+PnuraVNlR5CKyMeQdUohj2?=
 =?us-ascii?Q?zi0OOsh6Vnav/ST631G71jR88ZKFj4lmhC5JNQN/KKVVVm/31fopm00LneIR?=
 =?us-ascii?Q?s7d2oP3XykNGt4gvuGkIR/Q7k1c8YeOxXn9F462I4mgvy/oAJEOJKot1ImuH?=
 =?us-ascii?Q?Az/SPuMNkfhxswI9pXHZUw3EKfZgSeP1?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(10070799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EK3lwgWJA2HyTF/MSuxkDzUvwfcQrBvlH3vqn64lp9lx881ZCl5jgviYmyX1?=
 =?us-ascii?Q?Rr2mkupINbxx2EEpsYK0S1XBczRXva4tFwMnTUfcOqr0pt1+jOJeih69nZUY?=
 =?us-ascii?Q?02Ydov8Jn/2kDe2YMOOqM5I/2vJoTRh4K1bdL2IrXYvcyep9XAPRKS8hZ1hN?=
 =?us-ascii?Q?WuEwgXvfE6tyn1wzq1Q/WqduXAE/srBEqNhb0ixRel7C9NJWWH/S5yz0rvYP?=
 =?us-ascii?Q?4DD4sUedPcNezAH1Z/Y3xyeFhE5LU8RWas+pYprkRQ8GxpGw46UCJDLXTDqh?=
 =?us-ascii?Q?bhebBQ/SajhJgtpFfcwsPVA/Ts7Y36gbHKzoItHC6fhV7CWCw5PJwJrCt5K2?=
 =?us-ascii?Q?Ldjf3NcBZSyRqDi85pv6qGHMzON5o79cG9hVR5t4TBrKxWq7ZXVrDbmhjLQv?=
 =?us-ascii?Q?dKVbojyrBHCeqsIiltkDGsei5QP1qyiQunv/Jn4EfTaUg5UBnx//A3mToJxG?=
 =?us-ascii?Q?7pI7FGfQht41y9cCugsQ3dREnB9WRNhu0jzEB7F0DyEOY1fr2jDeQb3k0ESs?=
 =?us-ascii?Q?Xi76phE8M9zZANsT7Mk36TH4zZOQeAzW4EGSwuCfrULtV/DEUNLf4tSIGP5t?=
 =?us-ascii?Q?oMsDeUQvlMepPUB/pnmrWg8hI5cx2o2KRMFo/ZRwI0Q8zlnhwpqdXkukiPJ3?=
 =?us-ascii?Q?281OUDkML8Reo64oGnpHFTCswEUJroyubD4Ir7QtRI3HfPGQrY50hioBYrH9?=
 =?us-ascii?Q?x9FoGuJhX17htKtDfpmnW1fE5i44j8W06dbqh1xfwDcf2ggmPzLTHia/stSM?=
 =?us-ascii?Q?wflfPBuCtHP2r7nlYFEPTeyJmd3nq36PkB3lIyShRRx9z3Xu5q10JOk1cLqD?=
 =?us-ascii?Q?Kgd4S4QIYYfHjUNXU1Aj6rcUVQGdCIZQemE7DX0IXybsjy03+O14Z6spzXm6?=
 =?us-ascii?Q?0x6qSib/S/K/XMXS4ApDytuFgUADxlVNMJ8QdT2up5XEFsoi8E97UsNCuWdT?=
 =?us-ascii?Q?6bG3n4aXS5xwoc8cg8g7v9UzFGebngXEzzjBYIdur16jMoTQWrEK3K0aCdxy?=
 =?us-ascii?Q?VteyhAjs+4MpnlubmnHYDjKFTo8+pTNGNBzwTOpeHPvO569TohzJKwGzWBVf?=
 =?us-ascii?Q?tFG5QmlnX60/wD4JaqzDevv8cGEAFHhQwrXMkyruQhWp0SI9jLfPUD+guuK3?=
 =?us-ascii?Q?Rqb/vKuoqAQRrbCfj/zvu7TQMsQ5uzpdtORXeygaB4r42skCmsYv+DrLvoxD?=
 =?us-ascii?Q?WCGBxdq9oaghK4zifUXEB/oBMLj5aryiXaftJdYouAByUtYYFQcNSUZ0eAL3?=
 =?us-ascii?Q?xYprdIIxPHRfW9RsoTapJ5L1ZBl8qT/N3iSbyxDAq13mZd5ZM+i/POoJuGDj?=
 =?us-ascii?Q?gfWmWf8WvGrJYwFQWF3nV4GKxawOBofJLcKfbYwYy5nAb1MhuyI6MJlKX/co?=
 =?us-ascii?Q?klJSZpDM2nK1GcfR84YrdUQZSGfR3MvAPN1kqUpEPJe0yXnWJOtDLtKo7+VU?=
 =?us-ascii?Q?1Zfj7HQLj0PvdT2A5HmGqhmEyXu9VU1mWd/WnsdAU8bdGZrC13uTT0epZLpB?=
 =?us-ascii?Q?PU74x9WgeIAOTJT4j8o+Vv1zFV/oNNLmdEepQGSnQ5Bi1wVyT/XOvj0gdZIN?=
 =?us-ascii?Q?eiyw7G85wf7hQb6YbRa+/ulV0VSQgKAzoizYPd+gw0fwqCaemydqn/Wbk/UO?=
 =?us-ascii?Q?/OLMaMwZ7y4sMQvCiXBGF0EqTYi9IxnOrd+pqsHhmw2LVAPQvTWkt5rsrroq?=
 =?us-ascii?Q?WLogpsYFlP5F8hcRoEgwCMCz1zw7hqhSJawrZaJ9RKys/HLFGAjsraj9dUwa?=
 =?us-ascii?Q?JhnHyKctkAU4sTT4Xw7ax7LBQE1HaBaqc2pQdX+ZYV+nluFTuqzV?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fa477e8-77e8-4878-ad86-08de52c0a499
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 16:27:28.2497
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ir7vUozTSVtKXa6I6UWRyt8Q0JSMROfjm/8DqqkSbaMYdaB2E43jGAhqdevJ077iN2LfOiVef1isM95qmtKMqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWP286MB3400
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The DesignWare EP core has supported updating the inbound iATU mapping
for an already configured BAR (i.e. allowing pci_epc_set_bar() to be
called again without a prior pci_epc_clear_bar()) since
commit 4284c88fff0e ("PCI: designware-ep: Allow pci_epc_set_bar() update
inbound map address").

Now that the EPC layer exposes this capability via the
dynamic_inbound_mapping feature bit, set the bit centrally in the
DesignWare EP layer so that all DWC-based EP glue drivers report it
consistently, without duplicating the same flag in each individual
driver.

No functional change intended. This only advertises existing behavior to
EPF drivers.

Suggested-by: Niklas Cassel <cassel@kernel.org>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
 drivers/pci/controller/dwc/pcie-designware-ep.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index 1195d401df19..0e5a8d200b00 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -626,11 +626,19 @@ static const struct pci_epc_features*
 dw_pcie_ep_get_features(struct pci_epc *epc, u8 func_no, u8 vfunc_no)
 {
 	struct dw_pcie_ep *ep = epc_get_drvdata(epc);
+	struct pci_epc_features *features;
 
 	if (!ep->ops->get_features)
 		return NULL;
 
-	return ep->ops->get_features(ep);
+	features = ep->ops->get_features(ep);
+	if (!features)
+		return NULL;
+
+	/* All DWC-based glue drivers support dynamic inbound mapping */
+	features->dynamic_inbound_mapping = true;
+
+	return features;
 }
 
 static const struct pci_epc_ops epc_ops = {
-- 
2.51.0


