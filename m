Return-Path: <linuxppc-dev+bounces-2747-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 201C59B807B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2024 17:45:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XfVH21Dr8z2yPq;
	Fri,  1 Nov 2024 03:45:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2612::62b" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730393134;
	cv=pass; b=fUBEpl99Y+6VCoCQmZSILSKGKM7ny8nxk+BDDpZfmM1CAodJRWiotpS3zKLG5t615vYcWzGoZmWInhPWi5cyJpNec8syurvo68eQrfnaVJR386tT4VFelziHqJz2qttNCw47gVOu4itK6PyyhySY9rp1QFR165iPmTykFh+FE3yCMeqPK0jkaFcm5xfGJg/HY4dxzVP1+7jcqnt4lLC2bxjX2HSA/8tkwMHuG9STCUqM+OJSBgKRm9kNeNJwUB97OvhspUwM0c6aFDQSZwCnyp3TgBFiMtS34wfbkgnftTv4saPErbrQmDBT8jGP82wUa8hKLH1tsARXK42nE31LQg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730393134; c=relaxed/relaxed;
	bh=8cP+A4+/zIKX/hTj8QtQL6JQG5l6PTiSzrXTMwJmi+8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Q4Hv+Ym8lr4k6f0rzHySvAjjkIUzn+S6rtCHyAbZFhooxVf94m9/cOtb5JpYEF7M8BYdgi+z9GaU/BhrlxsQQsEwKaP5yv9a/yVJCMGlqDJAp7ZVP86B/MgWP9myv3++/6dNQ/GBMIU3UYHX9+SodokEiMsyJKHfQUflaKyBtr75E1ft79fcSkjgWMKOpd7DIMYqp5On1k59ZOwUyT2nolFX5UfGtiut07FdnI4lgwG2cTIEMXTfDyMH+lo5nLsdjrwYG5g1RjGXRwunmDhs9URbXGLP/svsEaXPAyX9blM4RGoZqzQD9lOIDRsERA9flIKzSXpDBYNMSlcbfDm4VA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=LEbDjhzg; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2612::62b; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=vladimir.oltean@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=LEbDjhzg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2612::62b; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=vladimir.oltean@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2062b.outbound.protection.outlook.com [IPv6:2a01:111:f403:2612::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XfVH02gSXz2y8k
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Nov 2024 03:45:31 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ttxjmpbokx9a3RUz2EqaSHPcsiD346EKyXq1l1IVD+2XGXhz1f3GdCXSiYJfRUmU65lnvmUXkAIhx1Xh+T331kVJKFoKN4LS6QnUVCh6jcK3YAKR2d45vcVlFrqzQo5/nKTTddVIcZot0hR8Rn9IQA3pgXdFWfcDUL0Vn1jyBzm+Q5gQ7XQVcxcWJd559uXoERn98RjAsiplYYfdTI0O/ZMzssA3s3h2Phn59LwQRN3EXqKPU6HIkCfhipPv7QmIGzIn9G+6fyT1n/f8l6OOrYGTw3JYnGO2dQf4JxULg0yih5LpOmj4afRQ4HRShOFnHFUqfEfTDhmpBPAuZaWPvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8cP+A4+/zIKX/hTj8QtQL6JQG5l6PTiSzrXTMwJmi+8=;
 b=O3Mn+KmL1Lh0SvhA/lH5kWs0wzF3mpkt9G3zA9G19YoRNjTsSl0Srsds7QQ2c0jbTQky62wR8FRwT7PBAf2zAIFf2SRnhQKCxy194Sdsayeh+SYoyzzFbJ5TqIKqdD4qcz8nAxFVaohssEPWtq3WpCUcTzRz85keDy/yOtfv9O2pKFUonDEEycrl1aIzlT5R9Ie+xhwsh/IbzWF140MTF+cq8ehoQfM0108t+qHpZEpm0U90F+Vbe698R1AWSqFEEuJ0JCzpad4TJfrzip3HWniUODgTUYJQk6xYZxvLZpiH9DNEb2Ypuy2Nps1NVvDZsO1AO7ACeGPq90B9b0shdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8cP+A4+/zIKX/hTj8QtQL6JQG5l6PTiSzrXTMwJmi+8=;
 b=LEbDjhzgJVihBFK1/L4oIwabZGEXk0N2JcQllJ+lOcbuTuhdXNOf6N1/246ltEx/Is1J8P39iPd71JeajGyTKTzhPdHKTmjO2owFIdDO8dsKYfAg+IHwX8kTKVp0pT7ppynVaUA5pkocIsQp8MLL2u4RQQpVFGjUI4WTMdVmIR965oheg+AnWsaBWvA3CouK0PVuxLk8ZmW/Ue4vPEO1xGTLvQLpgcDeB5R8DKOoYsmwNaMQRA6uxB7aU1RYW7AX+1BSOcXUY+jTGbZDOa6XIFeM0535cvA505tdYucZ9XnUjOZ1rR+2onaHzlPoI+mFiVOamDlrHdvRWcFlELkbfw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by DBBPR04MB7801.eurprd04.prod.outlook.com (2603:10a6:10:1eb::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Thu, 31 Oct
 2024 16:45:01 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2%3]) with mapi id 15.20.8093.027; Thu, 31 Oct 2024
 16:45:01 +0000
Date: Thu, 31 Oct 2024 18:44:56 +0200
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Caleb Sander Mateos <csander@purestorage.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Arthur Kiyanovski <akiyano@amazon.com>,
	Brett Creeley <brett.creeley@amd.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	David Arinzon <darinzon@amazon.com>,
	"David S. Miller" <davem@davemloft.net>,
	Doug Berger <opendmb@gmail.com>, Eric Dumazet <edumazet@google.com>,
	Eugenio =?utf-8?B?UMODwqlyZXo=?= <eperezma@redhat.com>,
	Felix Fietkau <nbd@nbd.name>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Geetha sowjanya <gakula@marvell.com>,
	hariprasad <hkelam@marvell.com>, Jakub Kicinski <kuba@kernel.org>,
	Jason Wang <jasowang@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
	Leon Romanovsky <leon@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Louis Peens <louis.peens@corigine.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Michael Chan <michael.chan@broadcom.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Noam Dagan <ndagan@amazon.com>, Paolo Abeni <pabeni@redhat.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Roy Pledge <Roy.Pledge@nxp.com>, Saeed Bishara <saeedb@amazon.com>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Shannon Nelson <shannon.nelson@amd.com>,
	Shay Agroskin <shayagr@amazon.com>, Simon Horman <horms@kernel.org>,
	Subbaraya Sundeep <sbhatta@marvell.com>,
	Sunil Goutham <sgoutham@marvell.com>, Tal Gilboa <talgi@nvidia.com>,
	Tariq Toukan <tariqt@nvidia.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	intel-wired-lan@lists.osuosl.org,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, linux-rdma@vger.kernel.org,
	netdev@vger.kernel.org, oss-drivers@corigine.com,
	virtualization@lists.linux.dev
Subject: Re: [resend PATCH 1/2] dim: make dim_calc_stats() inputs const
 pointers
Message-ID: <20241031164456.rifatscfu6gzht7z@skbuf>
References: <20241031002326.3426181-1-csander@purestorage.com>
 <20241031002326.3426181-1-csander@purestorage.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241031002326.3426181-1-csander@purestorage.com>
 <20241031002326.3426181-1-csander@purestorage.com>
X-ClientProxiedBy: VI1PR09CA0138.eurprd09.prod.outlook.com
 (2603:10a6:803:12c::22) To AM8PR04MB7779.eurprd04.prod.outlook.com
 (2603:10a6:20b:24b::14)
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
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|DBBPR04MB7801:EE_
X-MS-Office365-Filtering-Correlation-Id: d9735c66-0446-4f39-511d-08dcf9cb5ce6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hoq/KtHorIomLu/jaYJfBOaXa0hXrKIBGRHe3hi+ScJfWNWNBqFRYJYK7hbj?=
 =?us-ascii?Q?GknBv0Emx9DF/YW+DidYhTQNNpwmxLvd4HpO3Pd5uA78kDLty3Nz6K5CQuF2?=
 =?us-ascii?Q?ii7MHR/tTogFeGaIDq0mZDu8MByT/rqeBF7cPTd3Ec+wd0d4x//3PVjzqXYd?=
 =?us-ascii?Q?zVDCrn+7z3ohfpvxTqVGtiwNWi7V4kV85ueUrN3QSsUaQAomhnD9MXF3uVR7?=
 =?us-ascii?Q?e6NZTXAJBIOxtUYzbVPfC+AE4j/158ohmpEV2eLsVyF2AG+Hnp7PFT1pSFxR?=
 =?us-ascii?Q?ZGub5VLj39a1ja9RN0atmWiHPyM4rdY0mizj7uDlcec1IW6RNxi1AySTv0go?=
 =?us-ascii?Q?qGxOz5b3ifpd2gEzw/ZuYhmBJyH+rdgaaD3ALW1wgtdgJyPHlKJW1/VGXfLM?=
 =?us-ascii?Q?j+Q1A1kHkqZR5NuSdASQaS921kCMBp8Ol1x8m/4zFr1zC4HHphBbXTfkcRCm?=
 =?us-ascii?Q?Htgp83g4O8j5Fm0hPsr5ooFE+LIjTKD+DCwFlqXB0ZxvtUCwD7xmmOVwuDuX?=
 =?us-ascii?Q?4cEPJwMvPm21XXy9ezQtk+oGkxp65/DNY3Dr83gwAvjhMajCZqBZnbABa4pe?=
 =?us-ascii?Q?6W5SpKz2XqdJU0izaJI0JY9QOnCg08pGuwRofSm5SgQey/DaihzxtF7BXFPF?=
 =?us-ascii?Q?XOPgAXN+elk9OigCbRQ8bGNGN07ZBG/PEHlVP9o04w+/ekl/xikCjIFad2mI?=
 =?us-ascii?Q?S4YXyKVKurOldAx+nK0xuO+AzD+UI/quRFpUY/SG1hZoUtOeSN6r9HLG262H?=
 =?us-ascii?Q?lFvm67lhNAJeIh+1ykDNe13O4KIN8q66wm3rPPU1zq6Fo+6HgqVBRPy24UPU?=
 =?us-ascii?Q?R3ftPhDA4UdbHqb5Iiz7Ei65KWXA2LRhRahf/fDWEhTxO3rzQruLfKNjshff?=
 =?us-ascii?Q?1KcAb8W7AUXTmvyX5FjphdXx57UfGx0Y6Tw50UchDUrP9KDqEGpB4J8j/vNP?=
 =?us-ascii?Q?MmzmWD4qzZFJ1/sE0jscOetp8ORfNL3TQYCw/23TsCMuadl3tq/Jv6y9Ncy7?=
 =?us-ascii?Q?HxTP8ujgXepdCIXSX/XCYmS7yu4bE0aCN9QbTzBanQt4oNjwMOB0AN/FZ7gW?=
 =?us-ascii?Q?jLcQFZiiOF23F0HrkWPWRVenodR5YFBn8uKgBcU3of0Qb8nv5xj78IdaYGUN?=
 =?us-ascii?Q?U3wfzdqOPFquga9SFYt5wvpSIks0YUGuWWGI5fNArWsIjQV4b5Wm1AQlGv3Q?=
 =?us-ascii?Q?BBrPeVibGzpZOnHh+e7XQwKhfE/D8YX9FyR8nvJwQsC5AtNiYqSK/vbewQBZ?=
 =?us-ascii?Q?fRZSsy12UNKZcDespUysPNPYJJ82ThNHRwTvG6jW7C2/IkTwOGDVP4oBVTJg?=
 =?us-ascii?Q?W2oREsCYnG99ZZ9zyQYuweBf?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7779.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Jurdo9911Pa6E7fwXxeRLdntxNkPhfgCIiEIpUdNI3haM9KEecWK1KusJq0M?=
 =?us-ascii?Q?fD1Y3jmdnHXab2RUuYdUMo3zI0kg7DFWwss1nhI8npDZtLFZLJX19uoCVjEr?=
 =?us-ascii?Q?7ivZXaZfMn/Bn79lw0VXClMy4/G8Np+0BbuoFJQtwhvxe7XjjLjL1hPeR/VB?=
 =?us-ascii?Q?uuZQhN6xHttd2TTEnlK5ck5iourwXq9VuGwu5o5OnjKYYIezM6waHOa+i46v?=
 =?us-ascii?Q?kgP+IM/l2T2pLiguobNlkl0+vxLLrhQa3Uvpb3b1e50Dmn/4XQaakxg5i1aA?=
 =?us-ascii?Q?TRne+bDom9jQcXi93b8OhduibKwwK9vpzWZF+6LFZCVD7Q/awFBNmgIZ4F2s?=
 =?us-ascii?Q?2OayjpJ+/t589Xz9h243pJ9m9L04Stl1lvDeGye2DPHBZDmofCxQz+gcMRkB?=
 =?us-ascii?Q?F73S5NFd4TmjRaJxhejQvNoQQQuCV3fN+PQ293kJCwL9/NBr/bsuIEVm7IMF?=
 =?us-ascii?Q?dOFeKGHsQEM1oum3YJ2jBkeIdOOz1U/ph42OH8WEgUl31wbYKo0wFD6mJN+5?=
 =?us-ascii?Q?8RCSLCEKObcLjWRSTPYPbIwWliefytAfF/uP0w7AGpBrghgL9Yki68WOJH70?=
 =?us-ascii?Q?QUcyDDmJZudltAC6BBZ9jjcBaoWevmBX6pKXHqccnqxXk3zf7zXl0Xp02htH?=
 =?us-ascii?Q?yMjyGXUXr/OV2qoezR3wjZkYCjnsR4JLZy/s+KMMpD9jhYPgeVtxoMzyu1GX?=
 =?us-ascii?Q?bLPyvM7yIU3IoNVisD65EYd1EkupRl33wD2KiMJc3iXyJMOPd1z0GeKvexP3?=
 =?us-ascii?Q?1QnGBKM6iybcnt6WzzBKpZGQEtzUsnfMIpkzm5bEw1lT1qi13VDJtKf/u5Cz?=
 =?us-ascii?Q?wxClLEBVby7iMsyTCjRhLzorqeC7I55Vk72rkOPQkwqhfpENqV2ccwisDhiY?=
 =?us-ascii?Q?VJ8eOOo0A87Lx5AAqDEhGec6oOoj+n9cbwOn9xCIMBvk/VtlQgBEVNkQ0JeK?=
 =?us-ascii?Q?fJJQaScEzJL/k2LXcFaUdFGfs8jBDDy6egGBv7HjkbyZfaFrLJ9OsT9ayNm3?=
 =?us-ascii?Q?MC8xqePhjxA0gcB0sWSkxvs4Jsax99x/IFG8HGqklhrdr1qu92BzEu+bvhfM?=
 =?us-ascii?Q?cevQ7ayaShrWohmUmBvy8aZHQ8JQdAHr9+O9lorr+vcI35sCzvjR9+AgtKvJ?=
 =?us-ascii?Q?AgtZI8/ENED6XWi/qnFeWWIDNBwULw0ApQ0ZqBjPwXp0dPZfTm1lV628Bob9?=
 =?us-ascii?Q?tqsEg6HkRNlurDEFDET2kPHYGmOY8DlFBQCo+ImcyPeib643/31cS4O+jF6T?=
 =?us-ascii?Q?5yYekeAgNAU74yg1bUVu9GM3I4sblHbX0AEGaZUPjO4uQJDr0KAdg4AhTJmL?=
 =?us-ascii?Q?pqws9kvjpdybadeMQBMjDzC3GvWTNd1TE7BoF5r2pqCTcbi6dZf7R88su+KJ?=
 =?us-ascii?Q?+jn0IoH4YekKK7mnq7fQ2BBclhADbfBj4u1g9L9P8vy3i+HgcytU6T9gtoDX?=
 =?us-ascii?Q?lvwYkb5gJWUNKLJjG4AykcXRHPyJm+skbs9txpG+vgABbmqBz78TWbs3naeb?=
 =?us-ascii?Q?17ar+D8eaCN/S+boGUuH0H4HkmiBtTwkKuxl3zB6I65tdalKkrNX/gdEb9Vh?=
 =?us-ascii?Q?93UkVDPhJ3KL3AkJOOx04MmBIEVVXahLe2NHyov2lnyI38GDCxJB4VruTjM2?=
 =?us-ascii?Q?AA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9735c66-0446-4f39-511d-08dcf9cb5ce6
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7779.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2024 16:45:01.4503
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BD2jmB3mdMF+Tm+pICQa/YQ7v7oWTRwJp8V/OWR6M5keSrsWE7LM17IV6VEU9LFeZu80oPgir6Y8642WxkeZmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7801
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Oct 30, 2024 at 06:23:25PM -0600, Caleb Sander Mateos wrote:
> Make the start and end arguments to dim_calc_stats() const pointers
> to clarify that the function does not modify their values.
> 
> Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>
> ---

Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>

