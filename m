Return-Path: <linuxppc-dev+bounces-16645-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iDZ0BFhIhWkN/QMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16645-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Feb 2026 02:48:08 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65582F90B5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Feb 2026 02:48:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f6cRN4Nbwz3btg;
	Fri, 06 Feb 2026 12:47:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c200::5" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770342464;
	cv=pass; b=jeBAxPHtvysnlbCUX32sMTo/tLUoC+p47igJzPvA6+CL6BdH8FB47lMNseJpmtPA6KCsy5oxjDhUcrsYpEt1QSMHNsZ6kchAPZq1ikYOV2FBpMKjiawg8kh9K7a/8c2TkogoWx4M6FDXonlhJYq1HAC7+yuzbIoP5Ls5HoGTBPjcik4jjFC8q08mmXJ4E6cHx+rKyGfLQpniFmuH8/1/q6n8ACyhXR3F9+GUJisbGu4OywcjI6fY90qS7zVLNpNtE3Kap8S8yojg70T1zMrQKTDqDPTJoyViAjpMfWHHB8y2e/7EwQx6bCOzjr1uZb5fbkxxTApRBbcZDqvNJbCXvw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770342464; c=relaxed/relaxed;
	bh=UgmZ3Q46qMQ6i3qnVDkQh/SWdMqy8DhavFvnNEtR8nI=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YQDvYP6AsrDIGK4pRXu+rsqDJUqeVmfarhbf5jVQByPh/MjEizqE6wLZxpVl2MJxFtZdTv2skD0G+fmhVtd4MaJb7evTv+ngq5tQ9zau9ju4U/cM0VJ+gpLgKN6GtWMLZ8NRX/cd0Rk998z2LRQF1G1XK92AA5rtieiQTvAHyMq8tD2EAY0I9q9EhsgIvTjPkIclH2IgNhDRM2UthAhE07MiZUCXjRajDhH6hVvoLOhfiAwNJJ1xxDfkhsbXVXOkhcU7ZS3wERiPWAaaVICKo6D32yl2la8k0T72g+uy0jEITNZ5QD58GLP1H1IR/OmXtFSNYAcOTfMO5cPBhMtGqw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=ntxmhZv/; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c200::5; helo=duzpr83cu001.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=ntxmhZv/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c200::5; helo=duzpr83cu001.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazlp170120005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c200::5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f6cRM5F2lz3bkq
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Feb 2026 12:47:43 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lyp6QrnWnXjtfCfSun30swIuDuSktI+LHCe8NdZn9DedhRyz9dyWije993+YtQIXMllHf3ASbvkkcKAXzeoTN8OcENa2Qrh7EZEOcC8UGQlyJvHaMI6+ChIybZwY7zwcVWzDH6b4+husE+h6jPwSY6r62GjfouW3YX7RQO63r5wuimiHA5mIJEcaSry1Nc17RF+BZ8hPBNx+3plL11dD7Zb+GMLiq7asdC69FGHM4mpaSZIQUt2s3R/S/3bmxxxdNiEZ/mvrESrAn5M5CM2in1+7C1dpTC+UqxAi4hSeCLZ4GsSl5UtJAvVvh96PvES7mymaC1Z0OaSMHJlwrde2bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UgmZ3Q46qMQ6i3qnVDkQh/SWdMqy8DhavFvnNEtR8nI=;
 b=RkpDuIImTb80gcBBx6A8upA5mI8yIXhU37ipuZtqFFrXC1nLvJuwiaowD1nEZhsLpTrhgh4wZsqk10qXOLw8rbIl1Kg5SyU1FnOWaSErIfYkzwS6jPXAsj76ULq3PvGd0y4AevhyXxKVkycd401XptgFMy7zn+FC+4Rb7yHIUPCv0WhrbqbML3iHCotOQ8GknC71zpzBzUzI19bEHUA3GB+t849IYt2vCjj7leMBYo55StXUOc/VpXFnpIm1t0wPVAIDbDC5jLLN7WigtcdOU6mUISbPU/yORVouoomsGwQNuegp8MMT+++Uz7n5dRPddRvWQn9m02DEx6IRLHBcQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UgmZ3Q46qMQ6i3qnVDkQh/SWdMqy8DhavFvnNEtR8nI=;
 b=ntxmhZv/KdemuZEyi+kn65cLpT4bvB4I8oFaiACTBzcMm3FjHXW4GRdJzHsvjym/LC0n3QhZQTHkWz23DJMP0KhRfJQOPL35sEUsNfAhRp6+TzZHDHPxD6hTO99rxHzjOwYwWIkWtntA2ks7AyjT9gev6mDCej9/mszpTSJtXeWUkTTjdIIGyVvtPIv/NvXJioc44SvGURvBgu2Qi+o0cbaZ8gP1vR/rxlBhOmsSGq9gNJ6s12oFtI2DIQOC36LlDKsWlFJRvECpx4QzRThzVtAxZKK8ZECHjV6CtLzuH0G8qMHkjbf8reX5N7QSF2odIyO42+H/X7WixS4jSk+jaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB7055.eurprd04.prod.outlook.com (2603:10a6:800:123::21)
 by VI0PR04MB12210.eurprd04.prod.outlook.com (2603:10a6:800:335::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Fri, 6 Feb
 2026 01:47:26 +0000
Received: from VI1PR04MB7055.eurprd04.prod.outlook.com
 ([fe80::d6ab:1538:d868:bf8]) by VI1PR04MB7055.eurprd04.prod.outlook.com
 ([fe80::d6ab:1538:d868:bf8%7]) with mapi id 15.20.9564.014; Fri, 6 Feb 2026
 01:47:26 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	nicoleotsuka@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 3/4] ASoC: fsl_asrc: Add support for i.MX952 platform
Date: Fri,  6 Feb 2026 09:48:04 +0800
Message-Id: <20260206014805.3897764-4-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260206014805.3897764-1-shengjiu.wang@nxp.com>
References: <20260206014805.3897764-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0004.apcprd04.prod.outlook.com
 (2603:1096:4:197::22) To VI1PR04MB7055.eurprd04.prod.outlook.com
 (2603:10a6:800:123::21)
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
X-MS-TrafficTypeDiagnostic: VI1PR04MB7055:EE_|VI0PR04MB12210:EE_
X-MS-Office365-Filtering-Correlation-Id: 45bf195b-9610-46bc-962a-08de6521ade6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|52116014|1800799024|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?V7H8p3oM90qPFQVEGUp9oV6+HQcowbGYo4Sbmbxh/o6ZaI3L9y4rR5dBh/zS?=
 =?us-ascii?Q?AyfcbX2Yl6IqMrd1ebvTjkoj3BloBzU1eKNEl5oAMtQgV/T31BDu4EJjKbIZ?=
 =?us-ascii?Q?hargt9f2TBNvciaCQukNIvqDI9wtiZJATgTH0hXSKW9idd4BbJd1vGR6lEDL?=
 =?us-ascii?Q?jH0gI64DKOkIht04vf1Ums1b5h1eIiBXZgzUEL8FTupvNKcgJaJT1S1NPla0?=
 =?us-ascii?Q?aSOt24hfVi46il0Px6pa7qK7u6untinCxTYRS2EfJuvbLPiDrZOuBRQtJ/aG?=
 =?us-ascii?Q?9urcscNTRZ9LiPeqWK5RwqWTBqtEUVcXY56p5C9vlyS9eawPrIpFFACAEIXl?=
 =?us-ascii?Q?ej4zxtVFBiXyi2ZBEl8TIfPl+OBFLmjug3lbIYYR7egZZWZJnmwXhKAMHzLQ?=
 =?us-ascii?Q?A/0IF//5FXYZZysX4tLTFPDnRiadFKKkL4BklrVnSvIV8RnOHq3iurNJKexk?=
 =?us-ascii?Q?kfEGwPKOwFhAQtknR/O8UawjOHdM1hlFaXoyq0cfPUoW6i4npMORdOnPAHu0?=
 =?us-ascii?Q?w4BsNa+tyqr/zN3x6BchAGRa0kRYYokMTOphCrhmftiBXgFK1v3mpd52gfJH?=
 =?us-ascii?Q?VxIWPP6ekMoU5HtoFrIQ0yxSoY4iEphc45xPgkvp6Na4nltYHdl0xZ3y8rs+?=
 =?us-ascii?Q?qd0ETKsqkR1eLDiCXw83gCDTVMRoKxJEo5GmWHy8VRAqyO48kYM5Ddds5Bfb?=
 =?us-ascii?Q?m2IIljaZW13DvMI1TMDbq/bJlr7w9j16rzT5Fngq6+H0RjPzuKEB2Vum9KIQ?=
 =?us-ascii?Q?7fsfbwE/Kf0c424PXqsb+hUoGR9jsQDQv+4WRSDK8Vdd37yqPcvEs/C/j0su?=
 =?us-ascii?Q?BccG1f3bTW5wSZgxd9gShufSOz9zsB3rPhX9wdu2wwqJ/xDOPP+Y9CHR7POE?=
 =?us-ascii?Q?qXrkYXZyif/4yq9oWyNlkTZKcLS4xEZC3qN5S3BNJ2qHpUKQHQWgFiEw4HRK?=
 =?us-ascii?Q?Al9pOV7xdWsPTTGEUxoaAYA9OUVi2T87JWpfm3TbYTh3dwRCY/uq1GcmHJO1?=
 =?us-ascii?Q?PFaXwGnfjHbUXi152CK0NVnHCZ2vQf7vAdNfc5wyLHTwGE+L3/DzAtkLDVTx?=
 =?us-ascii?Q?aFdjZkd5w5J4P6W7zjfZozxLIeTdxcThYDydE1QAnLfWtuEZ+cYq1pdMo0pp?=
 =?us-ascii?Q?2wM9GepzuCcwse0TPugEN+NFFtGpOZGzUnR/IPKXAYstgNN2RWkE9risNhxC?=
 =?us-ascii?Q?THo2sXe3R2/BkAiWuVB/EzvbCkr6NXOOTrH+Fpn2HarYBdIUADf8p58/EDfE?=
 =?us-ascii?Q?dwe73nzTh0mVhLkbfKOa26fBsllgyB/xLUgQD5YkQbhu6EOWS7fMj9ZDb/os?=
 =?us-ascii?Q?Q1sBOq6oXiqn39XwYd3Lf0+rig4EjDNuAfTfa2XTtcDeCaUILagEFQldgqhd?=
 =?us-ascii?Q?CeOkSzj0WiyuFOPf5sIGbwchx4qM3SXGWWsuA8Kz76I+0GHPepkoBG2pg1ej?=
 =?us-ascii?Q?dWeE+Rl9ilvwnMJJlSpCxDOcXRYvqvcOF/PA7m6lxhFL5CySKSZwY2MUHETu?=
 =?us-ascii?Q?IvDQWwVYaIrrK2UmtEYwv8uiPWvqmr0p3b8WNno3EYTb8ahy6K+ycEcGbagL?=
 =?us-ascii?Q?uPQEzBZ0pmwXE859rIXgz+DsYoqmM87ajN5e48B/SoYD7+kvAHaOSVl5xu8q?=
 =?us-ascii?Q?iLe0JF4TfEI15r4FyuRDqdpeWUjAz3SXQhrF7hraXPKV?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7055.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(19092799006)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/Cc5QOPE9/eNn2qKonmD+9tBa5hrnu0Mo0QK/0OveHIPPsk0Yq8eNdvJNwPd?=
 =?us-ascii?Q?x3iLuKQRG+lOPbEOVuQn2w5YL17fygpAjwJiA9Y4/4CsMw5N6aSqefgGie9Q?=
 =?us-ascii?Q?Sgcazl/ly3ArLD94uYn4vxNiSp7CjKPeUccKITcTJuAmirqj1Uuf172RR6bA?=
 =?us-ascii?Q?2nPdxzRcr8BHOjc6mBtKUA9kT+CvPxpTFPn5NLC0CCi8GJhJrsVHGXqab4kA?=
 =?us-ascii?Q?leBZ3qJ2s1AC/015J6kXHUXMWec2xs66SfACIdDxYA7zt6bsNSxo28+3XsgZ?=
 =?us-ascii?Q?PYrdt2UKA0Yx2ldF209i9cxxSBMerJonbvFdDYW6dg3BG9/Ooi2BFySAheXQ?=
 =?us-ascii?Q?En7+cd0VK8dBzDcMf/ACi1uhtJoKOFCe1xLhatXxiYmSt4tad1wLH616MdD1?=
 =?us-ascii?Q?7zXXC3Y2CKGvK11XDUvTHU+uFqw4DukCUIycUEe9V0GxCJbO0J8yehhzL+Y7?=
 =?us-ascii?Q?3bXc0wUMML8fz4XyM/R1N8E1xdHD1v6qmBPSMRTwFjKcIucOI2ZTaY7EryUa?=
 =?us-ascii?Q?s9AdCzIjjLDHAIZycTbRPIV5dtqivyQP39SMsnBGWRUeeVZu19N8ERhrhJiA?=
 =?us-ascii?Q?sErCfPh7L3Kcmryi8/F2RWMJMewYWQ9EFhQbvKdV3Bk4oGTSaPNS7guMgJaw?=
 =?us-ascii?Q?5AzRBR0vzkwe1nZ5gs369eiTYkQnpjfgqkcYStn5jF8Ce1myu41zrrQyxf/X?=
 =?us-ascii?Q?ZKzf9m3l+AfvtGBJfePJdIs+r1OYMmM+f21gL7kYdGCBpaGkujsz3Aadu/G5?=
 =?us-ascii?Q?jUqwqes8jdnO490KEV5rRoOes1Z9D0XP8kyiINsl05xEO7SRahzAm7XK9XIK?=
 =?us-ascii?Q?5Hkkxx4zlHPFi4tp4dmKSSOg8g1ARQ/0nienpPgiD1oxIx2IP3JgvBGepYoH?=
 =?us-ascii?Q?FjNVoPh+yVTJfgi1eLL0gA9XjP9zoZx1n7npQJJGixpZ/hT1SqJmA48oIjU6?=
 =?us-ascii?Q?ll+IoxK6tUIth0qKeVIeyopxqsTujivUfc/HxDRb+hyOSOfoMxeXUYbOQzRF?=
 =?us-ascii?Q?grGI83B/XmsCTTAttkRV92UIj4/KoZj8dquKANsD/ybXgJyxeZN0OyK7PfEq?=
 =?us-ascii?Q?4tiBtJz0JoO7b/m31aRY1/LBYFpoGL+Rmgrq4Zr2fvjOFpIYuhr6jvFTCwz4?=
 =?us-ascii?Q?IVLvuzQbvpMUASfQ5Lz6T7XmUEatAET04qOR+71IiLKmAvCdJ9JOE/vAVx86?=
 =?us-ascii?Q?JSHKc/esXUfflHEoZKmSHDwLWrR4jv4Wx2aND5xs8WjzplMrh0Jjzovy+waC?=
 =?us-ascii?Q?n4fOqAWkXzJo4E6qOxCj00peK2SyVt9/0yFJqVfQWwl3T1ge1e2QQqLmEa9P?=
 =?us-ascii?Q?pYtjNS4p/wtTjOlUYHoJAvc5t+s+HRzY/ACPcvxCk3X63YYMJF5hvdkLow1a?=
 =?us-ascii?Q?kEcTGYlrBzh8S5IHOE0fbalOeGrluw7JTIpQJuXCNpaLHJhFdFha0RreSUG7?=
 =?us-ascii?Q?YNQn5NBsBXADw9O3Cy+tg5bRybIDu+5NMx7mLialsOzwoU3WGyC3b5Ht1Pig?=
 =?us-ascii?Q?I6Oxi7DfVWliHdmoFRZub8z/Jg0C9g8qh2O2Xs/GThT22dD4AEF+eJQ8jXWB?=
 =?us-ascii?Q?Szt1o9FuHxvWn//I5pfOZvIFDRTswtnKcPY0jxdVkB3esKsaTFg9LVGI/+3c?=
 =?us-ascii?Q?bB/6DlCoqgTzdOp4zyqDaG3qBiomFgKIhD/7dvk3b7+jleMye+bXTUeFel2x?=
 =?us-ascii?Q?hlgIdhuSPnm+sTU007+wRb7O5W5s8u3z6tFPDC+AZASQV3CI5YvoCwX2Binv?=
 =?us-ascii?Q?PvxWpZaWpQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45bf195b-9610-46bc-962a-08de6521ade6
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7055.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 01:47:26.0683
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +qpFhCB0B1szsg4m9VM2U/vb7ANqtoCllu/yH8Etr1YEGmEKIgCtBtY8hY9p+fcShU6g9wkjH9hMpxCQ5D4nxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB12210
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-16645-lists,linuxppc-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,pengutronix.de,vger.kernel.org,lists.linux.dev,lists.infradead.org,perex.cz,suse.com,lists.ozlabs.org];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[shengjiu.wang@nxp.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS(0.00)[m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:shengjiu.wang@gmail.com,m:Xiubo.Lee@gmail.com,m:nicoleotsuka@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:linuxppc-dev@lists.ozlabs.org,m:krzk@kernel.org,m:conor@kernel.org,m:shengjiuwang@gmail.com,m:XiuboLee@gmail.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengjiu.wang@nxp.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,nxp.com:dkim,nxp.com:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 65582F90B5
X-Rspamd-Action: no action

Add a compatible string, clock mapping table and enable the option
'start_before_dma' to support ASRC on the i.MX952 platform.

The clock mapping table is to map the clock sources on i.MX952 to the
clock ids in the driver, the clock ids are for all the clock sources on
all supported platforms.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 sound/soc/fsl/fsl_asrc.c | 16 ++++++++++++++++
 sound/soc/fsl/fsl_asrc.h | 14 ++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index 2fe25667c888..5fda9b647c70 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -106,6 +106,12 @@ static unsigned char clk_map_imx8qxp[2][ASRC_CLK_MAP_LEN] = {
 	},
 };
 
+static unsigned char clk_map_imx952[ASRC_CLK_MAP_LEN] = {
+	0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0x0,
+	0x0, 0x1, 0x2, 0x3, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0x4, 0x5, 0x6, 0x8, 0xf, 0xf,
+	0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0x7, 0x9, 0xa, 0xb, 0xc, 0xd, 0xf, 0xf, 0xf, 0xf,
+};
+
 /*
  * According to RM, the divider range is 1 ~ 8,
  * prescaler is power of 2 from 1 ~ 128.
@@ -1337,6 +1343,9 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 			asrc_priv->clk_map[IN] = clk_map_imx8qxp[map_idx];
 			asrc_priv->clk_map[OUT] = clk_map_imx8qxp[map_idx];
 		}
+	} else if (of_device_is_compatible(np, "fsl,imx952-asrc")) {
+		asrc_priv->clk_map[IN] = clk_map_imx952;
+		asrc_priv->clk_map[OUT] = clk_map_imx952;
 	}
 
 	asrc->channel_avail = 10;
@@ -1575,11 +1584,18 @@ static const struct fsl_asrc_soc_data fsl_asrc_imx8qxp_data = {
 	.channel_bits = 4,
 };
 
+static const struct fsl_asrc_soc_data fsl_asrc_imx952_data = {
+	.use_edma = true,
+	.channel_bits = 4,
+	.start_before_dma = true,
+};
+
 static const struct of_device_id fsl_asrc_ids[] = {
 	{ .compatible = "fsl,imx35-asrc", .data = &fsl_asrc_imx35_data },
 	{ .compatible = "fsl,imx53-asrc", .data = &fsl_asrc_imx53_data },
 	{ .compatible = "fsl,imx8qm-asrc", .data = &fsl_asrc_imx8qm_data },
 	{ .compatible = "fsl,imx8qxp-asrc", .data = &fsl_asrc_imx8qxp_data },
+	{ .compatible = "fsl,imx952-asrc", .data = &fsl_asrc_imx952_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, fsl_asrc_ids);
diff --git a/sound/soc/fsl/fsl_asrc.h b/sound/soc/fsl/fsl_asrc.h
index 60b6865ca952..7a81366a0ee4 100644
--- a/sound/soc/fsl/fsl_asrc.h
+++ b/sound/soc/fsl/fsl_asrc.h
@@ -326,6 +326,13 @@ enum asrc_inclk {
 	INCLK_SAI6_TX_BCLK     = 0x22,
 	INCLK_HDMI_RX_SAI0_RX_BCLK     = 0x24,
 	INCLK_HDMI_TX_SAI0_TX_BCLK     = 0x25,
+
+	INCLK_SAI2_TX_BCLK	= 0x26,
+	INCLK_SAI3_TX_BCLK	= 0x27,
+	INCLK_SAI4_RX_BCLK	= 0x28,
+	INCLK_SAI4_TX_BCLK	= 0x29,
+	INCLK_SAI5_RX_BCLK	= 0x2a,
+	INCLK_SAI5_TX_BCLK	= 0x2b,
 };
 
 enum asrc_outclk {
@@ -366,6 +373,13 @@ enum asrc_outclk {
 	OUTCLK_SAI6_TX_BCLK     = 0x22,
 	OUTCLK_HDMI_RX_SAI0_RX_BCLK     = 0x24,
 	OUTCLK_HDMI_TX_SAI0_TX_BCLK     = 0x25,
+
+	OUTCLK_SAI2_TX_BCLK	= 0x26,
+	OUTCLK_SAI3_TX_BCLK	= 0x27,
+	OUTCLK_SAI4_RX_BCLK	= 0x28,
+	OUTCLK_SAI4_TX_BCLK	= 0x29,
+	OUTCLK_SAI5_RX_BCLK	= 0x2a,
+	OUTCLK_SAI5_TX_BCLK	= 0x2b,
 };
 
 #define ASRC_CLK_MAX_NUM	16
-- 
2.34.1


