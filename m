Return-Path: <linuxppc-dev+bounces-16960-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oAf5Mc5/l2kOzQIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16960-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Feb 2026 22:25:34 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9419162C26
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Feb 2026 22:25:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fH5yL4JVbz2xQB;
	Fri, 20 Feb 2026 08:25:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c105::5" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771524889;
	cv=pass; b=mphCM0uaWKsjTuJZ7nKmYVvla8hDhibYacD8dt1Zo8fEukkRYPlEtSRz8JdQeyK3B/erzS6Uo9AiBGFqNyLmJyow3dzDuWDqpZfcUgO4Y+EYWInnxom0rE0kxfMIMe3lwpFVqv7csjO8/Gjs7pZbqqjlMUjnb4aU+0YjqVHgz1D1s6zXbkzBZzLhjQzUnYvSW0tChfDENQLyd68nCaUEevJ7qbQxRLmYYiMGemp6GnACn6KcUM83tgjqUS7IhgAOPK1lfPWPl+yP509TUiud75ThzB15V7NKsgK/O0YNe7Y5U2XTZZlsQk0UmZ5ZJNoJqgMMBzA1SjFozWuTpKVpSQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771524889; c=relaxed/relaxed;
	bh=hOkmfkIj6WgREey6ecUB3rSZwMxNq83K8wUgYIDfWT4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WwCdDL3CdcEJILEx/u+8nXOcE1qRNuVFbu6Dep0VqsaTDAArLAnrMj5hD1ib9O6kKsM/nt6rElIYHaPlYxW3u2c8C4kQO7Iln1vlu8q4z+bk3ICDAIpEXjtu/9jyVvtYwjgnhJSJTjODq7knGupu9Xzpww9ZRYGxxwSkMZBuyoz+kaKH4ADWPOPQ14dbfFiVfGl0mgyo/LBB74F1nDtldW+FsK3RYHnrgXRWG4Xm7ba/rChxsbPAsSshKqGGBoiflRrJDmw+vXPjHxvod9GcMBs/EVwnRVA1NuuOXdZqlKe+VqPb47Kj98B6B9mcjnVfKoPVf9ctUUE9MRzl32+w+Q==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=fTbelJaR; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c105::5; helo=ch5pr02cu005.outbound.protection.outlook.com; envelope-from=ynorov@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=fTbelJaR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c105::5; helo=ch5pr02cu005.outbound.protection.outlook.com; envelope-from=ynorov@nvidia.com; receiver=lists.ozlabs.org)
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazlp170120005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c105::5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fH1kJ51gqz2yFQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Feb 2026 05:14:48 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CMhgNESaXFSXeYeK6Rkbeu3eEEg/eCom7/OQOxg/2FukkOL4P+Xx09H8x6PS7oud2QvrIul8kLE7TdtcEWefoYPVKbE4c2k9g2lp8I1+zIoOI31FUlC1m7+4BA4C4J4eqPrk2176uBIAgeWuiUXwBkrwJS1ExDEZ90fiBe2GpurW6YoD33tKva3r7YshmPaBl4Hsnk0xiEhlXUcz8rdeY4xyOIi+ECZbI/zIHRyq/RGlpAPJC6aWFG6nf2f5UgqGWbqLHOmLZDlkhuZv3pEgSXgRY8y1L1wtbiTMe1FsfHiDo80dfmSUUfEXZ5BYRils/FwCfUoZZ+W2LsYVeXDaFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hOkmfkIj6WgREey6ecUB3rSZwMxNq83K8wUgYIDfWT4=;
 b=PKR0ubTkE62Ze9HbapzG3FCKrcECKVEXIKDXAJ3CQyzdXCkbV4IrNXBZgLNGW2NRqHjDE+LqN0oblwkd47m/H2cgAgXBQZVbc7BY3psZVyR6qYY5Wo1sM2/fKbhkXPmJy0e+3JvRhhbZnPdOFf59tYGqA93iOjlwQb2dBBT99Kw3YQmrIMWWo0L7DiTECchsGLvebUXwpPbGeQET2L4LIGyZfhGkP1oJIuk4moxS2WkFmMcespcfQrDPzBAHIo7r5r6Lktvo6cE8s+qup6tZxxRyWFdQOJsNbXVvHoM4oO+qmhct1ymrnp2JOaGbghS2e6+sErDdzEvhm8hNtc2m1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hOkmfkIj6WgREey6ecUB3rSZwMxNq83K8wUgYIDfWT4=;
 b=fTbelJaRZIiK3iR30iRfVz28vsljMVACNMlVpo7x5DkyrvROhkKmU3AE5q264/csBw7nZ9Oy6tKHsBw4EWnMaAsZVVu48wgPtQuTG4gTBbHV7u30+vd3LuSYcxQFCSo1pvrBxWpelTmL8XPeozpc5BjStQ0x+fc7WuZzryK5XiOGUrqCPDu7Xvi/dw6nr2dkxJZModWFYCkT1XthgqAKaDfVG1orH5ae+7RggxQEOvOU5W/NoJbcbQ6o3mM6tJPBSITv52h43c0LU8ExY87AL9r3TMFtBhB0l8+K1+220hNVIxr/T09lrRRIbi2vKSNXH8ThcqWnGXoRwDq7oyOI9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH0PR12MB8800.namprd12.prod.outlook.com (2603:10b6:510:26f::12)
 by IA0PR12MB7674.namprd12.prod.outlook.com (2603:10b6:208:434::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Thu, 19 Feb
 2026 18:14:27 +0000
Received: from PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d]) by PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d%4]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 18:14:27 +0000
From: Yury Norov <ynorov@nvidia.com>
To: linux-kernel@vger.kernel.org,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Andrew Morton <akpm@linux-foundation.org>,
	Antoine Tenart <atenart@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Eric Dumazet <edumazet@google.com>,
	Geetha sowjanya <gakula@marvell.com>,
	Ingo Molnar <mingo@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Jerin Jacob <jerinj@marvell.com>,
	Linu Cherian <lcherian@marvell.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Mike Leach <mike.leach@linaro.org>,
	Moritz Fischer <mdf@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Simon Horman <horms@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Subbaraya Sundeep <sbhatta@marvell.com>,
	Sunil Goutham <sgoutham@marvell.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Tom Rix <trix@redhat.com>,
	Xu Yilun <yilun.xu@intel.com>,
	Yajun Deng <yajun.deng@linux.dev>,
	Yury Norov <yury.norov@gmail.com>,
	Zhang Rui <rui.zhang@intel.com>,
	hariprasad <hkelam@marvell.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-fpga@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	netdev@vger.kernel.org
Cc: Yury Norov <ynorov@nvidia.com>
Subject: [PATCH 07/12] mm: add rest_of_page() macro
Date: Thu, 19 Feb 2026 13:13:59 -0500
Message-ID: <20260219181407.290201-8-ynorov@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260219181407.290201-1-ynorov@nvidia.com>
References: <20260219181407.290201-1-ynorov@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0878.namprd03.prod.outlook.com
 (2603:10b6:408:13c::13) To PH0PR12MB8800.namprd12.prod.outlook.com
 (2603:10b6:510:26f::12)
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
X-MS-TrafficTypeDiagnostic: PH0PR12MB8800:EE_|IA0PR12MB7674:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bd64e21-d91b-446e-424e-08de6fe2b7ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|10070799003|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mRZKk8UL3Zt17DxLjwKxSL4EmKTMd+XVwz6WQQqRqZbDSUipjaaPli00GSKf?=
 =?us-ascii?Q?QcTxqUGg/DQqMjf1t3thXyLds0Ag7I2vgdWrTYRnJXlYY2Vdgbb5KhDWguBF?=
 =?us-ascii?Q?PxgCiskmFNiVtnhBPeNGAoBsQAWWIjQQE03GjLt0XBHLxNvmm3mg70HOC9/n?=
 =?us-ascii?Q?tbeBj2USz2Y9MqkwVZVetjv3WtuuYPyn0TnoQUfcNIIGHwCsdhmH5A7h5den?=
 =?us-ascii?Q?anxYD7/eyOXKQtdcwHavdRPBX8UDjUoaIGxHqdUfprlnskfJL0UEqmZu8SIb?=
 =?us-ascii?Q?eCBBmS8WpgwPZVJGEbwqYWtK30AVTZrhhX5qHxWuHsFLwJjLuQe+uzQaa0ff?=
 =?us-ascii?Q?4+EiUcFQwThxhow2FwOEyvOJzAetNJPr2KH3fR25Eya76t54Hr/G3iyCYXg2?=
 =?us-ascii?Q?YYZxz1Y58DyzdhgM/FleXreAZNQ+GWbD/p75IxdHIV5iBTAuf9C9KK/Qzq7+?=
 =?us-ascii?Q?U+O2EO5Z7T2J2Obg0KQmBLLLlvlBryzIZJfOKps/opzzYD4IWgrgpETel7KD?=
 =?us-ascii?Q?tg6tewweGlcKa7wzyuDUewVfL4k8ML8XhM2Utq/jOShaJUtP0pmRPKDBLY6j?=
 =?us-ascii?Q?HZX3lytByrgpSDfhtWnvn9UXEeSSEeDcnZ3R5prSvI017oLqgwQmSrLyVXFS?=
 =?us-ascii?Q?rkRcYz/EjsfLS/6kD7a+fFBxOhk5wjU/sP4J/fk0k9AIHSVK/UJg8GavDUn0?=
 =?us-ascii?Q?OCFsB+1O6WFOFhWkuPMBh+XG9uKM/VXZPqlnDRuTZ+cTTubewhAQ343Lc/ft?=
 =?us-ascii?Q?78ZxBkccFcT0D/jZF4keA/oC9uiujaqrmc9o55H4KgtjAV206BBFzXyCYbAN?=
 =?us-ascii?Q?YhNaGUf8qA64Yrd2hZ0UYsDk+rHb85J4aUZ/7hcTgRRsCO7El81MiTYaIJ6f?=
 =?us-ascii?Q?eejUSkPy3ku9S58J51LsAU0OpD+bmd/NUwZ66Um/dCqAzGKDxs0WfTgyWhTu?=
 =?us-ascii?Q?gPphmdx2XerLb8syKfaTCka9dZF0Qv/mqzgWZVhKG6NIcEhzoJkh0DiZY8Za?=
 =?us-ascii?Q?HKSd5z/B1k0xvBRie0XkUgzA0bcZB/sle9rFUfXMTiPji41fYS1vwe/gDaeU?=
 =?us-ascii?Q?nLilzALhFLJwuYZdQO8JHymYkKBx9Dn6fRbTlKPelwRx31PH4F3Pv39wOr+d?=
 =?us-ascii?Q?pn+yXx3BzjH/nJlSh+CxM5+IXJM9AaQeUDlPhOdKFs9ciSK4d0YOhzUg/Aj4?=
 =?us-ascii?Q?WQmNRUvL6Cg6/eewkPsNoWY2y7tscRLPXKp+wmau5AabpODGDnsPoYwGIIUM?=
 =?us-ascii?Q?AfSI9FzPpmiN+xt+naH1P2QxmxHERuLfeTdKsnvWY5KnBR3HsI6+8nw0GGi/?=
 =?us-ascii?Q?1H6SoAkvUYbglZATTt7YEAKTrBGHKAez9xir9ROVo4oKffrtyIL/4oy7fl9n?=
 =?us-ascii?Q?0qP4aHJdMosnJjsfBwijxgreMQ/zWP5ucfu7qBjWqv9oxgYflhykkQv2uF8q?=
 =?us-ascii?Q?inIP5ZGZ+hExpacttf8/gsDisBaWcKUrCHnDskaN1NApe6iiVTPxsAOApuf8?=
 =?us-ascii?Q?o8bmOmoNn31T4TCr9XCIKDRjBC1VBt3bXwvfsuceVRtrrWe2SG+KZkwnRKBk?=
 =?us-ascii?Q?ohkHkZE3xEt6qoC5kEu1Rky1ujpqwLDdLYBSPVZeh6AMG0W4hvbPdh1Ew3rV?=
 =?us-ascii?Q?Gw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB8800.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(10070799003)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?j3PKrEuiCrjXB99nPlKDYmo5v0DnO0sQE/fnpEi7GAyKAHhipzjW5CyNNDCH?=
 =?us-ascii?Q?LXV2HcpmdmX7MmWKQrbR9Gh/EM2f+qAW9VEB9OgYTogxWUfq8FfDee+KrME4?=
 =?us-ascii?Q?XjW1uhbeMZvQd8/HLU+zGt2FTeDzgpMF30C3+dQfyGgk86kJrxvb7sXgiiDJ?=
 =?us-ascii?Q?2QRAvD8zq+SNba++TZXCQVhnQ7+UsJZwVOTUF5y4cvb4ZI3B7GQY+a1Z07FU?=
 =?us-ascii?Q?ooqCz6O+auErNxzdJDiJ1/L6NUq55jp1pcCJ0Ur2/ZK+ljzNKpyhLRDDxvy0?=
 =?us-ascii?Q?5aL8WHxlkKDEOe3+e4J0xKO6ZxQo8uDF8dBBF6goVoYs4zmxnvmT9o0dP6l0?=
 =?us-ascii?Q?L+ehLOKKGG4d5gLZuWXYTD5xazsqr+M56EhNu8YZB9xx/u4hXOphn2cTkzgj?=
 =?us-ascii?Q?pCAW8RW+faPxbHmrOLWlg0CI1VMERpDfNYFc14uRN5oYrfVANwdwRi8yQ6ZP?=
 =?us-ascii?Q?dzvgMlr68ow66llkCNtcbEUeVzShbC0iy4+whtoKDOm7ZBwCRwuUcwa7C8LZ?=
 =?us-ascii?Q?psqFZfoGNLliPySaK07fwTDHa+MRnmOXQhNQtOL7NulR+kBkKF3a1BH4sgOw?=
 =?us-ascii?Q?yO4OxHDbuAtEJ7xC7n+mvfmNsJVMHvnIm0TrgBKl7Vv5s3SZqUI9hBpZ5s5V?=
 =?us-ascii?Q?mgayz3p4A+0hOfmFRWgXPvqsOwqcgewQFVF6NjRWo/A423a5D+Iew8VrnRas?=
 =?us-ascii?Q?Le//9BUw0wm8VGIDbEKXUpPDn/N1/UkYFC5FEemTem8WGZiVEWbcQ59PUv9w?=
 =?us-ascii?Q?N/hRkNk2JOhCbhfwgV2Xpk5q4R0a/oFsSQHoziorQRRsOw9ULu4g/vGv5+Sf?=
 =?us-ascii?Q?3EhS8TeoGv3/398z3czdD1oDQgJISf3lNbnoxCC1aG6MiEzT+htBnnxMxhJ6?=
 =?us-ascii?Q?HSY/vWKzwcD8x3+hqPvI0/azrtOM/RbCI4Fti9diJd3pEGXuSxrm23de57u4?=
 =?us-ascii?Q?mqtiJDDZnA0BR1zf9/orWDbUKLMzmy1/xVA1FpZCwvZ104HtTHfWlns60R+z?=
 =?us-ascii?Q?ED04t2kUzraRrFcGH6ZiBASSLuIsXDr0HoTfZKycT45qRXCtWLVuecnPVJvQ?=
 =?us-ascii?Q?kHvR1sSgWbagTXJYzwDReQYsKKSe3n+7GRUzfOb3RtxiMSX3RUnCqTVdTIuL?=
 =?us-ascii?Q?JYY4FeUl2l4EinwUAlByZbFTENAnbZ8cEJPpDwOQIPIAt2e3ZjtoPGNS09OM?=
 =?us-ascii?Q?AGoq+b2sXTOslxF6KOnlmj7PfgNnpYWB/aqRgG/yp7vFpOzKUiGNydEDA/+9?=
 =?us-ascii?Q?i5UZMHZgfMRohkEMqNUqdT2Plhxx1RpqC+96Q9caCpwFfy5yA5xE2CyBW/ct?=
 =?us-ascii?Q?1tNzaPjS8UNeDKiqVH8bVsw/iPaIVFbTnZyXkaWUS662Jd7LlsdoQLmBDJZF?=
 =?us-ascii?Q?LnbKHcBuWjHiSgolGyQS5ZSLhHTJ1xuUtzGVRuEBe+lkiIA55uivgk7vzGE/?=
 =?us-ascii?Q?NIsxddXcF4a4DvM59CT0cdAwS8SbIOffBgLlFcCQGc1AQWFswxuS0aJs45ow?=
 =?us-ascii?Q?YifxskV1u+2LcL65A8p1VMYGgyxp6cjBxQ6g4IkNBOqk4j9hbwb6zwJTmBSP?=
 =?us-ascii?Q?jAumYfsbMMX3G9Wr3lqgWSVf32nwTqg4Ocojewf988z6x+PPJKfKQeKRRmfC?=
 =?us-ascii?Q?Jl5XiZoeSi1FDrmpRnx7lYpJMoACZRJp/iJlTeDGhNsm7AnTe+PALYdxp2MV?=
 =?us-ascii?Q?b2N0E+YF5d0Eszm+O1VxHaDxhX8XsuX90c6xFEkcOShFmm58oI+XOUAJpqIf?=
 =?us-ascii?Q?AU6vQrrEeeRAl9kKkMLNHO3/AkVqQqwYhxwyXqFuav8UZr036Ru3?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bd64e21-d91b-446e-424e-08de6fe2b7ed
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB8800.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 18:14:27.5979
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ORggo27GFyJnvWJHwf0BGasEhfGiKRjU/HJi9C67Vaq0BG0l/s8NexrH4zPEBqHe93V/uWkz0RQq1EzXrNJ49Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7674
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[vger.kernel.org,kernel.org,davemloft.net,infradead.org,linux.intel.com,lunn.ch,linux-foundation.org,linaro.org,google.com,marvell.com,arm.com,linux.ibm.com,ellerman.id.au,gmail.com,redhat.com,rasmusvillemoes.dk,fomichev.me,intel.com,linux.dev,lists.linaro.org,lists.infradead.org,lists.ozlabs.org];
	FORGED_SENDER(0.00)[ynorov@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[44];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:chleroy@kernel.org,m:davem@davemloft.net,m:peterz@infradead.org,m:rafael@kernel.org,m:alexander.shishkin@linux.intel.com,m:andrew+netdev@lunn.ch,m:akpm@linux-foundation.org,m:atenart@kernel.org,m:brauner@kernel.org,m:daniel.lezcano@linaro.org,m:edumazet@google.com,m:gakula@marvell.com,m:mingo@kernel.org,m:kuba@kernel.org,m:james.clark@linaro.org,m:jerinj@marvell.com,m:lcherian@marvell.com,m:lukasz.luba@arm.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:mike.leach@linaro.org,m:mdf@kernel.org,m:npiggin@gmail.com,m:pabeni@redhat.com,m:linux@rasmusvillemoes.dk,m:horms@kernel.org,m:sdf@fomichev.me,m:sbhatta@marvell.com,m:sgoutham@marvell.com,m:suzuki.poulose@arm.com,m:trix@redhat.com,m:yilun.xu@intel.com,m:yajun.deng@linux.dev,m:yury.norov@gmail.com,m:rui.zhang@intel.com,m:hkelam@marvell.com,m:coresight@lists.linaro.org,m:linux-arm-kernel@lists.infradead.org,m:linux-fpga@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linuxppc-dev@l
 ists.ozlabs.org,m:netdev@vger.kernel.org,m:ynorov@nvidia.com,m:andrew@lunn.ch,m:yurynorov@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-16960-lists,linuxppc-dev=lfdr.de];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ynorov@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email]
X-Rspamd-Queue-Id: D9419162C26
X-Rspamd-Action: no action

The net/9p networking driver adds a handy macro to calculate the
amount of bytes from a given pointer to the end of page. Move it
to mm, and use tree-wide.

No functional changes intended.

Signed-off-by: Yury Norov <ynorov@nvidia.com>
---
 arch/arm64/kernel/patching.c                |  4 +---
 arch/powerpc/lib/code-patching.c            |  6 +++---
 arch/riscv/kernel/sbi.c                     |  4 ++--
 arch/s390/kvm/gaccess.c                     |  6 +++---
 arch/x86/kvm/emulate.c                      |  4 ++--
 drivers/block/null_blk/main.c               |  6 ++----
 drivers/gpu/drm/i915/gt/shmem_utils.c       |  5 ++---
 drivers/md/dm-pcache/backing_dev.h          |  2 +-
 drivers/net/ethernet/meta/fbnic/fbnic_tlv.c |  6 +++---
 drivers/s390/net/qeth_core_main.c           |  6 ++----
 drivers/spi/spi-pl022.c                     |  3 +--
 drivers/spi/spi.c                           |  4 +---
 fs/ext4/verity.c                            |  3 +--
 fs/f2fs/verity.c                            |  6 ++----
 fs/fuse/dev.c                               |  4 ++--
 fs/iomap/buffered-io.c                      |  2 +-
 fs/nfs/pagelist.c                           |  2 +-
 fs/remap_range.c                            |  3 +--
 fs/xfs/scrub/xfile.c                        |  3 +--
 include/crypto/scatterwalk.h                |  2 +-
 include/linux/highmem.h                     | 24 +++++++++------------
 include/linux/iomap.h                       |  2 +-
 include/linux/iov_iter.h                    |  3 +--
 include/linux/mm.h                          |  2 ++
 kernel/events/ring_buffer.c                 |  2 +-
 lib/bitmap-str.c                            |  2 +-
 lib/iov_iter.c                              |  5 ++---
 net/9p/trans_virtio.c                       |  6 ------
 sound/virtio/virtio_pcm_msg.c               |  4 ++--
 29 files changed, 53 insertions(+), 78 deletions(-)

diff --git a/arch/arm64/kernel/patching.c b/arch/arm64/kernel/patching.c
index 1041bc67a3ee..4c3a4401719b 100644
--- a/arch/arm64/kernel/patching.c
+++ b/arch/arm64/kernel/patching.c
@@ -116,9 +116,7 @@ static void *__text_poke(text_poke_f func, void *addr, void *src, size_t len)
 
 	while (patched < len) {
 		ptr = addr + patched;
-		size = min_t(size_t, PAGE_SIZE - offset_in_page(ptr),
-			     len - patched);
-
+		size = min_t(size_t, rest_of_page(ptr), len - patched);
 		waddr = patch_map(ptr, FIX_TEXT_POKE0);
 		func(waddr, src, patched, size);
 		patch_unmap(FIX_TEXT_POKE0);
diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index f84e0337cc02..186a9cb79ee3 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -463,7 +463,7 @@ static int __patch_instructions(u32 *patch_addr, u32 *code, size_t len, bool rep
 
 /*
  * A page is mapped and instructions that fit the page are patched.
- * Assumes 'len' to be (PAGE_SIZE - offset_in_page(addr)) or below.
+ * Assumes 'len' to be rest_of_page(addr) or below.
  */
 static int __do_patch_instructions_mm(u32 *addr, u32 *code, size_t len, bool repeat_instr)
 {
@@ -514,7 +514,7 @@ static int __do_patch_instructions_mm(u32 *addr, u32 *code, size_t len, bool rep
 
 /*
  * A page is mapped and instructions that fit the page are patched.
- * Assumes 'len' to be (PAGE_SIZE - offset_in_page(addr)) or below.
+ * Assumes 'len' to be rest_of_page(addr) or below.
  */
 static int __do_patch_instructions(u32 *addr, u32 *code, size_t len, bool repeat_instr)
 {
@@ -554,7 +554,7 @@ int patch_instructions(u32 *addr, u32 *code, size_t len, bool repeat_instr)
 		size_t plen;
 		int err;
 
-		plen = min_t(size_t, PAGE_SIZE - offset_in_page(addr), len);
+		plen = min_t(size_t, rest_of_page(addr), len);
 
 		local_irq_save(flags);
 		if (mm_patch_enabled())
diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
index c443337056ab..9a2f656f776f 100644
--- a/arch/riscv/kernel/sbi.c
+++ b/arch/riscv/kernel/sbi.c
@@ -602,7 +602,7 @@ int sbi_debug_console_write(const char *bytes, unsigned int num_bytes)
 	else
 		base_addr = __pa(bytes);
 	if (PAGE_SIZE < (offset_in_page(bytes) + num_bytes))
-		num_bytes = PAGE_SIZE - offset_in_page(bytes);
+		num_bytes = rest_of_page(bytes);
 
 	if (IS_ENABLED(CONFIG_32BIT))
 		ret = sbi_ecall(SBI_EXT_DBCN, SBI_EXT_DBCN_CONSOLE_WRITE,
@@ -631,7 +631,7 @@ int sbi_debug_console_read(char *bytes, unsigned int num_bytes)
 	else
 		base_addr = __pa(bytes);
 	if (PAGE_SIZE < (offset_in_page(bytes) + num_bytes))
-		num_bytes = PAGE_SIZE - offset_in_page(bytes);
+		num_bytes = rest_of_page(bytes);
 
 	if (IS_ENABLED(CONFIG_32BIT))
 		ret = sbi_ecall(SBI_EXT_DBCN, SBI_EXT_DBCN_CONSOLE_READ,
diff --git a/arch/s390/kvm/gaccess.c b/arch/s390/kvm/gaccess.c
index 4630b2a067ea..40f85b7eca63 100644
--- a/arch/s390/kvm/gaccess.c
+++ b/arch/s390/kvm/gaccess.c
@@ -973,7 +973,7 @@ int access_guest_with_key(struct kvm_vcpu *vcpu, unsigned long ga, u8 ar,
 	if (rc)
 		goto out_unlock;
 	for (idx = 0; idx < nr_pages; idx++) {
-		fragment_len = min(PAGE_SIZE - offset_in_page(gpas[idx]), len);
+		fragment_len = min(rest_of_page(gpas[idx]), len);
 		if (try_fetch_prot_override && fetch_prot_override_applies(ga, fragment_len)) {
 			rc = access_guest_page_gpa(vcpu->kvm, mode, gpas[idx], data, fragment_len);
 		} else {
@@ -1015,7 +1015,7 @@ int access_guest_real(struct kvm_vcpu *vcpu, unsigned long gra,
 
 	while (len && !rc) {
 		gpa = kvm_s390_real_to_abs(vcpu, gra);
-		fragment_len = min(PAGE_SIZE - offset_in_page(gpa), len);
+		fragment_len = min(rest_of_page(gpa), len);
 		rc = access_guest_page_gpa(vcpu->kvm, mode, gpa, data, fragment_len);
 		len -= fragment_len;
 		gra += fragment_len;
@@ -1237,7 +1237,7 @@ int check_gpa_range(struct kvm *kvm, unsigned long gpa, unsigned long length,
 	int rc = 0;
 
 	while (length && !rc) {
-		fragment_len = min(PAGE_SIZE - offset_in_page(gpa), length);
+		fragment_len = min(rest_of_page(gpa), length);
 		rc = vm_check_access_key_gpa(kvm, access_key, mode, gpa);
 		length -= fragment_len;
 		gpa += fragment_len;
diff --git a/arch/x86/kvm/emulate.c b/arch/x86/kvm/emulate.c
index c8e292e9a24d..292a84e97a8a 100644
--- a/arch/x86/kvm/emulate.c
+++ b/arch/x86/kvm/emulate.c
@@ -864,7 +864,7 @@ static int __do_insn_fetch_bytes(struct x86_emulate_ctxt *ctxt, int op_size)
 		return rc;
 
 	size = min_t(unsigned, 15UL ^ cur_size, max_size);
-	size = min_t(unsigned, size, PAGE_SIZE - offset_in_page(linear));
+	size = min_t(unsigned int, size, rest_of_page(linear));
 
 	/*
 	 * One instruction can only straddle two pages,
@@ -1372,7 +1372,7 @@ static int pio_in_emulated(struct x86_emulate_ctxt *ctxt,
 			address_mask(ctxt, reg_read(ctxt, VCPU_REGS_RCX)) : 1;
 		in_page = (ctxt->eflags & X86_EFLAGS_DF) ?
 			offset_in_page(reg_read(ctxt, VCPU_REGS_RDI)) :
-			PAGE_SIZE - offset_in_page(reg_read(ctxt, VCPU_REGS_RDI));
+			rest_of_page(reg_read(ctxt, VCPU_REGS_RDI));
 		n = min3(in_page, (unsigned int)sizeof(rc->data) / size, count);
 		if (n == 0)
 			n = 1;
diff --git a/drivers/block/null_blk/main.c b/drivers/block/null_blk/main.c
index 740a8ac42075..130fbcecedeb 100644
--- a/drivers/block/null_blk/main.c
+++ b/drivers/block/null_blk/main.c
@@ -1147,8 +1147,7 @@ static blk_status_t copy_to_nullb(struct nullb *nullb, void *source,
 	sector_t sector;
 
 	while (count < n) {
-		temp = min3(nullb->dev->blocksize, n - count,
-			    PAGE_SIZE - offset_in_page(pos));
+		temp = min3(nullb->dev->blocksize, n - count, rest_of_page(pos));
 		sector = pos >> SECTOR_SHIFT;
 
 		if (null_cache_active(nullb) && !is_fua)
@@ -1181,8 +1180,7 @@ static void copy_from_nullb(struct nullb *nullb, void *dest, loff_t pos,
 	sector_t sector;
 
 	while (count < n) {
-		temp = min3(nullb->dev->blocksize, n - count,
-			    PAGE_SIZE - offset_in_page(pos));
+		temp = min3(nullb->dev->blocksize, n - count, rest_of_page(pos));
 		sector = pos >> SECTOR_SHIFT;
 
 		t_page = null_lookup_page(nullb, sector, false,
diff --git a/drivers/gpu/drm/i915/gt/shmem_utils.c b/drivers/gpu/drm/i915/gt/shmem_utils.c
index 365c4b8b04f4..f56092acd233 100644
--- a/drivers/gpu/drm/i915/gt/shmem_utils.c
+++ b/drivers/gpu/drm/i915/gt/shmem_utils.c
@@ -98,8 +98,7 @@ static int __shmem_rw(struct file *file, loff_t off,
 	unsigned long pfn;
 
 	for (pfn = off >> PAGE_SHIFT; len; pfn++) {
-		unsigned int this =
-			min_t(size_t, PAGE_SIZE - offset_in_page(off), len);
+		unsigned int this = min_t(size_t, rest_of_page(off), len);
 		struct page *page;
 		void *vaddr;
 
@@ -134,7 +133,7 @@ int shmem_read_to_iosys_map(struct file *file, loff_t off,
 
 	for (pfn = off >> PAGE_SHIFT; len; pfn++) {
 		unsigned int this =
-			min_t(size_t, PAGE_SIZE - offset_in_page(off), len);
+			min_t(size_t, rest_of_page(off), len);
 		struct page *page;
 		void *vaddr;
 
diff --git a/drivers/md/dm-pcache/backing_dev.h b/drivers/md/dm-pcache/backing_dev.h
index b371cba483b9..17e83b38b845 100644
--- a/drivers/md/dm-pcache/backing_dev.h
+++ b/drivers/md/dm-pcache/backing_dev.h
@@ -96,7 +96,7 @@ static inline u32 backing_dev_req_coalesced_max_len(const void *data, u32 len)
 
 	first_page = vmalloc_to_page(p);
 advance:
-	in_page = PAGE_SIZE - offset_in_page(p);
+	in_page = rest_of_page(p);
 	to_advance = min_t(u32, in_page, len - done);
 
 	done += to_advance;
diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_tlv.c b/drivers/net/ethernet/meta/fbnic/fbnic_tlv.c
index 517ed8b2f1cb..2e80c25ba3c8 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic_tlv.c
+++ b/drivers/net/ethernet/meta/fbnic/fbnic_tlv.c
@@ -52,7 +52,7 @@ struct fbnic_tlv_msg *fbnic_tlv_msg_alloc(u16 msg_id)
  **/
 int fbnic_tlv_attr_put_flag(struct fbnic_tlv_msg *msg, const u16 attr_id)
 {
-	int attr_max_len = PAGE_SIZE - offset_in_page(msg) - sizeof(*msg);
+	int attr_max_len = rest_of_page(msg) - sizeof(*msg);
 	struct fbnic_tlv_hdr hdr = { 0 };
 	struct fbnic_tlv_msg *attr;
 
@@ -94,7 +94,7 @@ int fbnic_tlv_attr_put_flag(struct fbnic_tlv_msg *msg, const u16 attr_id)
 int fbnic_tlv_attr_put_value(struct fbnic_tlv_msg *msg, const u16 attr_id,
 			     const void *value, const int len)
 {
-	int attr_max_len = PAGE_SIZE - offset_in_page(msg) - sizeof(*msg);
+	int attr_max_len = rest_of_page(msg) - sizeof(*msg);
 	struct fbnic_tlv_hdr hdr = { 0 };
 	struct fbnic_tlv_msg *attr;
 
@@ -292,7 +292,7 @@ ssize_t fbnic_tlv_attr_get_string(struct fbnic_tlv_msg *attr, char *dst,
 struct fbnic_tlv_msg *fbnic_tlv_attr_nest_start(struct fbnic_tlv_msg *msg,
 						u16 attr_id)
 {
-	int attr_max_len = PAGE_SIZE - offset_in_page(msg) - sizeof(*msg);
+	int attr_max_len = rest_of_page(msg) - sizeof(*msg);
 	struct fbnic_tlv_msg *attr = &msg[le16_to_cpu(msg->hdr.len)];
 	struct fbnic_tlv_hdr hdr = { 0 };
 
diff --git a/drivers/s390/net/qeth_core_main.c b/drivers/s390/net/qeth_core_main.c
index 1c80e8ca67b5..1b983c397fa8 100644
--- a/drivers/s390/net/qeth_core_main.c
+++ b/drivers/s390/net/qeth_core_main.c
@@ -4087,8 +4087,7 @@ static unsigned int qeth_fill_buffer(struct qeth_qdio_out_buffer *buf,
 
 	/* map linear part into buffer element(s) */
 	while (length > 0) {
-		elem_length = min_t(unsigned int, length,
-				    PAGE_SIZE - offset_in_page(data));
+		elem_length = min_t(unsigned int, length, rest_of_page(data));
 
 		buffer->element[element].addr = virt_to_dma64(data);
 		buffer->element[element].length = elem_length;
@@ -4117,8 +4116,7 @@ static unsigned int qeth_fill_buffer(struct qeth_qdio_out_buffer *buf,
 		data = skb_frag_address(frag);
 		length = skb_frag_size(frag);
 		while (length > 0) {
-			elem_length = min_t(unsigned int, length,
-					    PAGE_SIZE - offset_in_page(data));
+			elem_length = min_t(unsigned int, length, rest_of_page(data));
 
 			buffer->element[element].addr = virt_to_dma64(data);
 			buffer->element[element].length = elem_length;
diff --git a/drivers/spi/spi-pl022.c b/drivers/spi/spi-pl022.c
index c32a1fba31ef..da44a37b22df 100644
--- a/drivers/spi/spi-pl022.c
+++ b/drivers/spi/spi-pl022.c
@@ -761,8 +761,7 @@ static void setup_dma_scatter(struct pl022 *pl022,
 			 * we just feed in this, else we stuff in as much
 			 * as we can.
 			 */
-			mapbytes = min_t(int, bytesleft,
-					 PAGE_SIZE - offset_in_page(bufp));
+			mapbytes = min_t(int, bytesleft, rest_of_page(bufp));
 
 			sg_set_page(sg, virt_to_page(bufp),
 				    mapbytes, offset_in_page(bufp));
diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 3887fcf8ec86..ad23fad29b9d 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -1162,9 +1162,7 @@ static int spi_map_buf_attrs(struct spi_controller *ctlr, struct device *dev,
 			 * the desc_len and the remaining buffer length that
 			 * fits in a page.
 			 */
-			min = min_t(size_t, desc_len,
-				    min_t(size_t, len,
-					  PAGE_SIZE - offset_in_page(buf)));
+			min = min_t(size_t, desc_len, min_t(size_t, len, rest_of_page(buf)));
 			if (vmalloced_buf)
 				vm_page = vmalloc_to_page(buf);
 			else
diff --git a/fs/ext4/verity.c b/fs/ext4/verity.c
index ca61da53f313..3dc95581e4b1 100644
--- a/fs/ext4/verity.c
+++ b/fs/ext4/verity.c
@@ -74,8 +74,7 @@ static int pagecache_write(struct inode *inode, const void *buf, size_t count,
 		return -EFBIG;
 
 	while (count) {
-		size_t n = min_t(size_t, count,
-				 PAGE_SIZE - offset_in_page(pos));
+		size_t n = min_t(size_t, count, rest_of_page(pos));
 		struct folio *folio;
 		void *fsdata = NULL;
 		int res;
diff --git a/fs/f2fs/verity.c b/fs/f2fs/verity.c
index 92ebcc19cab0..1c3403fbf2a8 100644
--- a/fs/f2fs/verity.c
+++ b/fs/f2fs/verity.c
@@ -44,8 +44,7 @@ static int pagecache_read(struct inode *inode, void *buf, size_t count,
 			  loff_t pos)
 {
 	while (count) {
-		size_t n = min_t(size_t, count,
-				 PAGE_SIZE - offset_in_page(pos));
+		size_t n = min_t(size_t, count, rest_of_page(pos));
 		struct page *page;
 
 		page = read_mapping_page(inode->i_mapping, pos >> PAGE_SHIFT,
@@ -78,8 +77,7 @@ static int pagecache_write(struct inode *inode, const void *buf, size_t count,
 		return -EFBIG;
 
 	while (count) {
-		size_t n = min_t(size_t, count,
-				 PAGE_SIZE - offset_in_page(pos));
+		size_t n = min_t(size_t, count, rest_of_page(pos));
 		struct folio *folio;
 		void *fsdata = NULL;
 		int res;
diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
index a30c8b57d478..84cd3e277366 100644
--- a/fs/fuse/dev.c
+++ b/fs/fuse/dev.c
@@ -1157,8 +1157,8 @@ static int fuse_copy_folio(struct fuse_copy_state *cs, struct folio **foliop,
 			unsigned int copy = count;
 			unsigned int bytes_copied;
 
-			if (folio_test_highmem(folio) && count > PAGE_SIZE - offset_in_page(offset))
-				copy = PAGE_SIZE - offset_in_page(offset);
+			if (folio_test_highmem(folio) && count > rest_of_page(offset))
+				copy = rest_of_page(offset);
 
 			bytes_copied = fuse_copy_do(cs, &buf, &copy);
 			kunmap_local(mapaddr);
diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index 1fe19b4ee2f4..b5aa0676141f 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -852,7 +852,7 @@ static struct folio *__iomap_get_folio(struct iomap_iter *iter,
 	loff_t pos = iter->pos;
 
 	if (!mapping_large_folio_support(iter->inode->i_mapping))
-		len = min_t(size_t, len, PAGE_SIZE - offset_in_page(pos));
+		len = min_t(size_t, len, rest_of_page(pos));
 
 	if (iter->iomap.flags & IOMAP_F_FOLIO_BATCH) {
 		struct folio *folio = folio_batch_next(iter->fbatch);
diff --git a/fs/nfs/pagelist.c b/fs/nfs/pagelist.c
index 6e69ce43a13f..a5b761304067 100644
--- a/fs/nfs/pagelist.c
+++ b/fs/nfs/pagelist.c
@@ -60,7 +60,7 @@ static struct page *nfs_page_iter_page_get(struct nfs_page_iter_page *i)
 
 	if (i->count != req->wb_bytes) {
 		size_t base = i->count + req->wb_pgbase;
-		size_t len = PAGE_SIZE - offset_in_page(base);
+		size_t len = rest_of_page(base);
 
 		page = nfs_page_to_page(req, base);
 		nfs_page_iter_page_advance(i, len);
diff --git a/fs/remap_range.c b/fs/remap_range.c
index 26afbbbfb10c..83f325e7f96b 100644
--- a/fs/remap_range.c
+++ b/fs/remap_range.c
@@ -199,8 +199,7 @@ static int vfs_dedupe_file_range_compare(struct file *src, loff_t srcoff,
 	while (len) {
 		struct folio *src_folio, *dst_folio;
 		void *src_addr, *dst_addr;
-		loff_t cmp_len = min(PAGE_SIZE - offset_in_page(srcoff),
-				     PAGE_SIZE - offset_in_page(dstoff));
+		loff_t cmp_len = min(rest_of_page(srcoff), rest_of_page(dstoff));
 
 		cmp_len = min(cmp_len, len);
 		if (cmp_len <= 0)
diff --git a/fs/xfs/scrub/xfile.c b/fs/xfs/scrub/xfile.c
index 2998c9b62f4b..e07b153965ae 100644
--- a/fs/xfs/scrub/xfile.c
+++ b/fs/xfs/scrub/xfile.c
@@ -134,8 +134,7 @@ xfile_load(
 			 * No data stored at this offset, just zero the output
 			 * buffer until the next page boundary.
 			 */
-			len = min_t(ssize_t, count,
-				PAGE_SIZE - offset_in_page(pos));
+			len = min_t(ssize_t, count, rest_of_page(pos));
 			memset(buf, 0, len);
 		} else {
 			if (filemap_check_wb_err(inode->i_mapping, 0)) {
diff --git a/include/crypto/scatterwalk.h b/include/crypto/scatterwalk.h
index 624fab589c2c..c671d5383c12 100644
--- a/include/crypto/scatterwalk.h
+++ b/include/crypto/scatterwalk.h
@@ -73,7 +73,7 @@ static inline unsigned int scatterwalk_clamp(struct scatter_walk *walk,
 	 * page due to the data not being aligned to the algorithm's alignmask.
 	 */
 	if (IS_ENABLED(CONFIG_HIGHMEM))
-		limit = PAGE_SIZE - offset_in_page(walk->offset);
+		limit = rest_of_page(walk->offset);
 	else
 		limit = PAGE_SIZE;
 
diff --git a/include/linux/highmem.h b/include/linux/highmem.h
index af03db851a1d..05528ba886fb 100644
--- a/include/linux/highmem.h
+++ b/include/linux/highmem.h
@@ -507,12 +507,10 @@ static inline void memcpy_folio(struct folio *dst_folio, size_t dst_off,
 		const char *src = kmap_local_folio(src_folio, src_off);
 		size_t chunk = len;
 
-		if (folio_test_highmem(dst_folio) &&
-		    chunk > PAGE_SIZE - offset_in_page(dst_off))
-			chunk = PAGE_SIZE - offset_in_page(dst_off);
-		if (folio_test_highmem(src_folio) &&
-		    chunk > PAGE_SIZE - offset_in_page(src_off))
-			chunk = PAGE_SIZE - offset_in_page(src_off);
+		if (folio_test_highmem(dst_folio) && chunk > rest_of_page(dst_off))
+			chunk = rest_of_page(dst_off);
+		if (folio_test_highmem(src_folio) && chunk > rest_of_page(src_off))
+			chunk = rest_of_page(src_off);
 		memcpy(dst, src, chunk);
 		kunmap_local(src);
 		kunmap_local(dst);
@@ -580,9 +578,8 @@ static inline void memcpy_from_folio(char *to, struct folio *folio,
 		const char *from = kmap_local_folio(folio, offset);
 		size_t chunk = len;
 
-		if (folio_test_partial_kmap(folio) &&
-		    chunk > PAGE_SIZE - offset_in_page(offset))
-			chunk = PAGE_SIZE - offset_in_page(offset);
+		if (folio_test_partial_kmap(folio) && chunk > rest_of_page(offset))
+			chunk = rest_of_page(offset);
 		memcpy(to, from, chunk);
 		kunmap_local(from);
 
@@ -608,9 +605,8 @@ static inline void memcpy_to_folio(struct folio *folio, size_t offset,
 		char *to = kmap_local_folio(folio, offset);
 		size_t chunk = len;
 
-		if (folio_test_partial_kmap(folio) &&
-		    chunk > PAGE_SIZE - offset_in_page(offset))
-			chunk = PAGE_SIZE - offset_in_page(offset);
+		if (folio_test_partial_kmap(folio) && chunk > rest_of_page(offset))
+			chunk = rest_of_page(offset);
 		memcpy(to, from, chunk);
 		kunmap_local(to);
 
@@ -642,7 +638,7 @@ static inline __must_check void *folio_zero_tail(struct folio *folio,
 	size_t len = folio_size(folio) - offset;
 
 	if (folio_test_partial_kmap(folio)) {
-		size_t max = PAGE_SIZE - offset_in_page(offset);
+		size_t max = rest_of_page(offset);
 
 		while (len > max) {
 			memset(kaddr, 0, max);
@@ -680,7 +676,7 @@ static inline void folio_fill_tail(struct folio *folio, size_t offset,
 	VM_BUG_ON(offset + len > folio_size(folio));
 
 	if (folio_test_partial_kmap(folio)) {
-		size_t max = PAGE_SIZE - offset_in_page(offset);
+		size_t max = rest_of_page(offset);
 
 		while (len > max) {
 			memcpy(to, from, max);
diff --git a/include/linux/iomap.h b/include/linux/iomap.h
index 99b7209dabd7..6ae549192adb 100644
--- a/include/linux/iomap.h
+++ b/include/linux/iomap.h
@@ -142,7 +142,7 @@ static inline void *iomap_inline_data(const struct iomap *iomap, loff_t pos)
  */
 static inline bool iomap_inline_data_valid(const struct iomap *iomap)
 {
-	return iomap->length <= PAGE_SIZE - offset_in_page(iomap->inline_data);
+	return iomap->length <= rest_of_page(iomap->inline_data);
 }
 
 /*
diff --git a/include/linux/iov_iter.h b/include/linux/iov_iter.h
index f9a17fbbd398..13a9ee653ef8 100644
--- a/include/linux/iov_iter.h
+++ b/include/linux/iov_iter.h
@@ -227,8 +227,7 @@ size_t iterate_xarray(struct iov_iter *iter, size_t len, void *priv, void *priv2
 		while (flen) {
 			void *base = kmap_local_folio(folio, offset);
 
-			part = min_t(size_t, flen,
-				     PAGE_SIZE - offset_in_page(offset));
+			part = min_t(size_t, flen, rest_of_page(offset));
 			remain = step(base, progress, part, priv, priv2);
 			kunmap_local(base);
 
diff --git a/include/linux/mm.h b/include/linux/mm.h
index dc1ad71a2a70..13e93be30501 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2579,6 +2579,8 @@ extern void pagefault_out_of_memory(void);
 #define offset_in_page(p)	((unsigned long)(p) & ~PAGE_MASK)
 #define offset_in_folio(folio, p) ((unsigned long)(p) & (folio_size(folio) - 1))
 
+#define rest_of_page(p)		(PAGE_SIZE - offset_in_page(p))
+
 /*
  * Parameter block passed down to zap_pte_range in exceptional cases.
  */
diff --git a/kernel/events/ring_buffer.c b/kernel/events/ring_buffer.c
index 3e7de2661417..1db2868b90c9 100644
--- a/kernel/events/ring_buffer.c
+++ b/kernel/events/ring_buffer.c
@@ -590,7 +590,7 @@ long perf_output_copy_aux(struct perf_output_handle *aux_handle,
 	to &= (rb->aux_nr_pages << PAGE_SHIFT) - 1;
 
 	do {
-		tocopy = PAGE_SIZE - offset_in_page(from);
+		tocopy = rest_of_page(from);
 		if (to > from)
 			tocopy = min(tocopy, to - from);
 		if (!tocopy)
diff --git a/lib/bitmap-str.c b/lib/bitmap-str.c
index be745209507a..a357342d5d6c 100644
--- a/lib/bitmap-str.c
+++ b/lib/bitmap-str.c
@@ -58,7 +58,7 @@ EXPORT_SYMBOL(bitmap_parse_user);
 int bitmap_print_to_pagebuf(bool list, char *buf, const unsigned long *maskp,
 			    int nmaskbits)
 {
-	ptrdiff_t len = PAGE_SIZE - offset_in_page(buf);
+	ptrdiff_t len = rest_of_page(buf);
 
 	return list ? scnprintf(buf, len, "%*pbl\n", nmaskbits, maskp) :
 		      scnprintf(buf, len, "%*pb\n", nmaskbits, maskp);
diff --git a/lib/iov_iter.c b/lib/iov_iter.c
index 545250507f08..4258cf910fec 100644
--- a/lib/iov_iter.c
+++ b/lib/iov_iter.c
@@ -483,9 +483,8 @@ size_t copy_folio_from_iter_atomic(struct folio *folio, size_t offset,
 		char *to = kmap_local_folio(folio, offset);
 
 		n = bytes - copied;
-		if (folio_test_partial_kmap(folio) &&
-		    n > PAGE_SIZE - offset_in_page(offset))
-			n = PAGE_SIZE - offset_in_page(offset);
+		if (folio_test_partial_kmap(folio) && n > rest_of_page(offset))
+			n = rest_of_page(offset);
 
 		pagefault_disable();
 		n = __copy_from_iter(to, n, i);
diff --git a/net/9p/trans_virtio.c b/net/9p/trans_virtio.c
index 370f4f37dcec..3aded4ba4575 100644
--- a/net/9p/trans_virtio.c
+++ b/net/9p/trans_virtio.c
@@ -87,12 +87,6 @@ struct virtio_chan {
 
 static struct list_head virtio_chan_list;
 
-/* How many bytes left in this page. */
-static unsigned int rest_of_page(void *data)
-{
-	return PAGE_SIZE - offset_in_page(data);
-}
-
 /**
  * p9_virtio_close - reclaim resources of a channel
  * @client: client instance
diff --git a/sound/virtio/virtio_pcm_msg.c b/sound/virtio/virtio_pcm_msg.c
index 9778020a7ba8..2f45664a21ac 100644
--- a/sound/virtio/virtio_pcm_msg.c
+++ b/sound/virtio/virtio_pcm_msg.c
@@ -56,7 +56,7 @@ static int virtsnd_pcm_sg_num(u8 *data, unsigned int length)
 		phys_addr_t pg_address = page_to_phys(pg);
 		size_t pg_length;
 
-		pg_length = PAGE_SIZE - offset_in_page(data);
+		pg_length = rest_of_page(data);
 		if (pg_length > length)
 			pg_length = length;
 
@@ -96,7 +96,7 @@ static void virtsnd_pcm_sg_from(struct scatterlist *sgs, int nsgs, u8 *data,
 		struct page *pg = vmalloc_to_page(data);
 		size_t pg_length;
 
-		pg_length = PAGE_SIZE - offset_in_page(data);
+		pg_length = rest_of_page(data);
 		if (pg_length > length)
 			pg_length = length;
 
-- 
2.43.0


