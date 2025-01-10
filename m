Return-Path: <linuxppc-dev+bounces-4932-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6492AA0872F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jan 2025 07:01:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YTrdT28yzz2yhD;
	Fri, 10 Jan 2025 17:01:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2415::610" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736488909;
	cv=pass; b=lgTOlT3SClLL8JliE7SRjojgvChuDXp24MnX7VDtkjAHjAXvF1BItwAU7Vgak6tjAAq3LBJ9WmZ+NaQHADMJ060u/mDOWbZlRFOyeCzV175sRn2mMpnSOUF9v+LjdUZAyIp9ysh3LHKprCe83LPjg97N6X3S1E54N76OtftLlkTlqERjF1Vf2TI1OlTLklPC9DcRsH1PaHL26dRhWyAfEIv8qh4q12jeDWxncSS57ulXpUfvFTBxky17v+driu62rTzzYbWbu+bC139vQfwQmlmRyUqai9LkfCD/h2lb/FaPz+oWP8bC7yu9fybs6Xwi8eHpFesCEH/PZ1jEhg6ftw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736488909; c=relaxed/relaxed;
	bh=LbBcp8B+/Sn0jziT5hc2amOpZmSK5V3jlPqrQF2ZsC4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oAKfZk+XJVmkHwA4ifetX2NZxoY6lPe0SEGvJMs1fLtmiVz6KqgQzzlxOZUXY9+oTyppYOyynWLmM9ko0Xqclu669ittmTlcvpVLAE+ZvLSEdRvF8Ssup8itWXpQDwQdsp1x165Ncac16pDszS5+g08ReqY7fu8md9M2zZTLw/cUMXOnbwqWl7ebtWenpJdjjiu04Hk1ONEfsmnCMZ3w+haa/yDpaNiuoAbuMini+ZF1CxyazD/KiuZkKEFPNQyygkFgMMYBDBq52mdkq7gd77ioi+yaBMhYV1sZVqQpPSl9K1ilKGacsin/291IQRUOWvSHqdoroWMQoOpQDGCvIg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=mf3LZHqK; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2415::610; helo=nam11-dm6-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=mf3LZHqK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2415::610; helo=nam11-dm6-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on20610.outbound.protection.outlook.com [IPv6:2a01:111:f403:2415::610])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YTrdS3gLvz30Nl
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2025 17:01:48 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U5GZBIzNet1G4cQFRU+Q54xBT5t5qrRgDTv5jA5pTLG3nya+VeqCpzi32GtMqwHaqzMjNu/y0QWwSvcJtcKgwmyj3a4fnUbijiANwCqqhWzGUHzvC8BpNpiKKysUC0hZo0ZT4Ym9P1hRuH3twz/WYnUbg+XBXOzBJ6JYJoVQJxKo3ODpwHlUxqVZE9vGdwMNJB2BdoOxsV50TC6wrdixQ269yH4IYSbpkzTm/tjvCsxiFRVt8+klO/J1aQvGo6OUkNyjqYkp1jtJlTURkBAXy9k2orscRnCGAsyKTT/IL6mFkO1/gXOKxNERvphpQNi163/BVmStsl6ICgNDvLHJjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LbBcp8B+/Sn0jziT5hc2amOpZmSK5V3jlPqrQF2ZsC4=;
 b=Ix+ieebpZGBChCvt0i49n+lUM4YRIcOZJCF5TSNbeYyEt0/7B0Oq+EPr4tdFbpjkTgaXxuA+7J+8jgsffcHIv19SC0xiBRDfdAd9olJGxBQDn4Av2dNZh+IBNcaIQVTuNkvHQWkkPEONsHdOJEttj5T7kmZ5lbEeH3mRJkM/TfVFdVflFwt0XIj9OjGEeQ6lkDdW7g3QLYrGMfdmVbgla9o/eFPCHzuMgJQbOujyxPmDwycJUYezZiIoFPbTPRqiYWiv0A+6A/P2Wqv5JAdA/JYq6k83UReoWCNTowAQ1VijtGwcgIgYsscv8ngNn2ZWbFKXfTrl+he8pRXPD9DXrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LbBcp8B+/Sn0jziT5hc2amOpZmSK5V3jlPqrQF2ZsC4=;
 b=mf3LZHqKIAUnFplAYMAuYYYfszMf2Uc3vP0gadUYGUhugrNWO4u0844JDCgyvNdu3x8pgkgO7K4PogfXqOYOk15R5ljKoVW0oaSitmgLdtS/MHkxVHMMsG/oGr5FeZ+eOWVyLh84N5b8N+cI9gR4K2gEnDRy1H2yimYTr7h22HVMTSplgCnh5gtcJda7HmAMW0dm/t0Uy4hPhQrbU0Jg4RXpBKiEo5WG054ryCQ8RMY8Yb1xHqwnXHlOTC7/hK5dp4Z6sFU6zRptkfyDTcutG2XnmPFrHHe7yjByiWDxBcQTmry6FFmhgcuGDvknp6HA4XRgmMDpOMpBZZw1OPzxUw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 BY5PR12MB4132.namprd12.prod.outlook.com (2603:10b6:a03:209::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Fri, 10 Jan
 2025 06:01:23 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%7]) with mapi id 15.20.8335.011; Fri, 10 Jan 2025
 06:01:23 +0000
From: Alistair Popple <apopple@nvidia.com>
To: akpm@linux-foundation.org,
	dan.j.williams@intel.com,
	linux-mm@kvack.org
Cc: alison.schofield@intel.com,
	Alistair Popple <apopple@nvidia.com>,
	lina@asahilina.net,
	zhang.lyra@gmail.com,
	gerald.schaefer@linux.ibm.com,
	vishal.l.verma@intel.com,
	dave.jiang@intel.com,
	logang@deltatee.com,
	bhelgaas@google.com,
	jack@suse.cz,
	jgg@ziepe.ca,
	catalin.marinas@arm.com,
	will@kernel.org,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	dave.hansen@linux.intel.com,
	ira.weiny@intel.com,
	willy@infradead.org,
	djwong@kernel.org,
	tytso@mit.edu,
	linmiaohe@huawei.com,
	david@redhat.com,
	peterx@redhat.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	nvdimm@lists.linux.dev,
	linux-cxl@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	linux-xfs@vger.kernel.org,
	jhubbard@nvidia.com,
	hch@lst.de,
	david@fromorbit.com,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	loongarch@lists.linux.dev,
	Vivek Goyal <vgoyal@redhat.com>
Subject: [PATCH v6 01/26] fuse: Fix dax truncate/punch_hole fault path
Date: Fri, 10 Jan 2025 17:00:29 +1100
Message-ID: <bfae590045c7fc37b7ccef10b9cec318012979fd.1736488799.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.11189864684e31260d1408779fac9db80122047b.1736488799.git-series.apopple@nvidia.com>
References: <cover.11189864684e31260d1408779fac9db80122047b.1736488799.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY6PR01CA0102.ausprd01.prod.outlook.com
 (2603:10c6:10:111::17) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
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
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|BY5PR12MB4132:EE_
X-MS-Office365-Filtering-Correlation-Id: 7415fded-2293-4465-edb8-08dd313c35ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iUiea6TcIoFaGltYHqp4MCOBxiDcafpaNHe3Va/E4WoJj2inejH6vzjtX+Od?=
 =?us-ascii?Q?shioydj0ySbzw2THNGM6Buf6C4HaudO9wLKjFGqVU19NXoQkr5hs7/8AYFvd?=
 =?us-ascii?Q?wULm9GNCK+KaqKZWhPT2zgpwm5xIyyEVxgL9sdPrqOwGUQ8xkcHGXj2qd5iE?=
 =?us-ascii?Q?9Oreal2H4alhTMzWo0ZvrWDESqMwUxEYVStyXK2hbM+6LxwOBZcuH5xKPrVF?=
 =?us-ascii?Q?fL6n8DWf/G5VJ2pOnzpOOsYsylGMnRLgeCol2ALKN8lB2LD/MI0KzELLvId9?=
 =?us-ascii?Q?YD8G9mypE/2DrA/dfKMT5ORSo9Ie9ojxRRPuZpfud7Qd9LyuEthq+AI2u/oo?=
 =?us-ascii?Q?NDYnSUexgyCtPpDnM8xe8GfY8jKX/nFl79dvWepJ5KOt8qc8IfX2vpHLfWlV?=
 =?us-ascii?Q?N81DvodEZ8blgSYILgv+z6UtxxEUs1+veBlyT6CUrJE1dyD6ZNuVqcJNLbIr?=
 =?us-ascii?Q?2Otei3fAwuYfN6jP8CmHOj9pcok48FSxJWfVcF3Ln9yVF4KjBq6xCBaQPmR5?=
 =?us-ascii?Q?xWvJEPu+ehbalBJBLpxWV3doq9ZdsRnArfbQel42/+0ZoIDYqommf9fkHDpR?=
 =?us-ascii?Q?8FQPU4/zCA8b7zRo3N98tuVcwLedOrBoEzZVw5K4r2KXOOLf9IzOaFnjnp4K?=
 =?us-ascii?Q?lDaHdwmufiZesdEtWJJ6fLe7cZ1KWJCtoghVo9QTKVZx4yBWiue4FN8oO9yF?=
 =?us-ascii?Q?JR01Nsz0GEVw7PtDaeLAEaXLTYpS0Lg2hZuKfUuKvJ6ZEAuTqYWdykZcuiEs?=
 =?us-ascii?Q?ccT5Wj8HDKuKq5ogqKA3U79V5S4uulqgpeWGI/SYzA3N3oqWbmB8+0klectq?=
 =?us-ascii?Q?e4YIypwkXtkWcTEinyGA8IBwPeG6J1uo01V8NjxB6aQQ91szyuJjdhViC1SD?=
 =?us-ascii?Q?mpM2ZdCKbwumfQEjoumejpTotawicXeiwnLY1ioHKqRwhnLC8NS4BFOHOViu?=
 =?us-ascii?Q?U9p4E37PhFRQsbB5W3Rvm8amvBIufqYK29GnNfCqQR2P5miCDfWIajiLfFIu?=
 =?us-ascii?Q?nWmQekqLvnPXDRUjiEv7FhNdFPSp/2lUrHBkjljiWRt1DLTlDLWg+TXuYVrP?=
 =?us-ascii?Q?89MGhRk/N47kjFsTIKxfF9Uj+zLpgqLQkSxwcsBtJE53Udw1FYpw95WF8xLL?=
 =?us-ascii?Q?xfBFSrdLIN+al2IGgPDR0A9GRSe/5IBZibfKpNYO8skpvVdlsP6+eMLBKwBe?=
 =?us-ascii?Q?V0EO1l55GwX8iXBbOHUiataVQ094e5JWhIi9t07Ni9figZ+FsWipZ8uaZaCL?=
 =?us-ascii?Q?LvWziuQEL8/aeLB5b1Tu59nk3JZ2Jdu6nTwcUX+qoO6hnxIAJYk5aceJ7ILZ?=
 =?us-ascii?Q?97cw6fZ/1N2NyX+MW+CngLIDoLF7R3+u0k0uZ0a+B1+IzYahQg9altLFJrAW?=
 =?us-ascii?Q?BQEqc3QITago+C4aGBZG/RZgqh7M?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?q3WholDKedmVRDQSIdDEqbsTSX+QtxlNOzU8klTKMUAoO8pcfltOLqWeBycu?=
 =?us-ascii?Q?K86n69nSLq0Y+oaIy4tSYoO4opXy0nNhtwpycVXqJCzHL1XO6WuYfp9ODXme?=
 =?us-ascii?Q?oVuurBlx2A90d98TxlGWCkRNWTnW+ycSr0UYBdhRwnl7g1XQdQB2CQL3bvwv?=
 =?us-ascii?Q?ly4HNzRCSFasFMaWMMBPilYPTJFqNcyhum/MAvkehnhAAftxTk6QJCuE7CG3?=
 =?us-ascii?Q?BRqc6/vsaVGeZtIZ/nyhdm4UOC61xjbkP52/XOopAsBfQSPI1WPXmWaDNSRB?=
 =?us-ascii?Q?51jWrHzS6wljLHGtLGUgxgT6Gqm0c7SHG5YdCorgWdxcz6o4cND9X1clAIeY?=
 =?us-ascii?Q?lAeXYWrgxBDITrWKvv/eLlwuaVSDfFLTum4j5pXJJnYrr1w2hPKvPiI76XAo?=
 =?us-ascii?Q?Cy7JjCbIqYAhNsp3y8Ov8rcpNDx0QnffAlI6jkii04PcJblgmDO/hyEZnf8X?=
 =?us-ascii?Q?9fURHtsYR3XexbCynYVGfcYYA/jBw6IxvO+lNaMzwmkcPlPL//nTBMnDM8fj?=
 =?us-ascii?Q?vDJOQUPhBScVurKsa0xZmXjOueeiaxWPVnBbb4UII6H161mhX5zXPzYBRi3s?=
 =?us-ascii?Q?hCJw/IssRLg9SP1tOmBs1Ub+hSA7IJksaXZj2Je8S35WkTQvgXP17OeTPbch?=
 =?us-ascii?Q?AffrUBEB6SRz65aO7vdRJh+uQA0aHTzHVG4REVDxzNBO9fPZTsZUIi7TQAlH?=
 =?us-ascii?Q?0LV8+6BDlfmI04adpTBHVFH9NJu7voSz/TWgg9GzmN9e+SjzEq5s1wi4uzfC?=
 =?us-ascii?Q?BJvEAlRn2BrgQ45EFTPhVv4bIkr2S2gGBiYerkW0UNBxVM0zfbXPuuaSjV8z?=
 =?us-ascii?Q?SaAhNUf7W+9lzam1bK+MODQQzFTT+UiMSjYzARzFiaX1mFRwj+6NMsIRB7+D?=
 =?us-ascii?Q?1wGLlWoyr7Gewr1oHm2dA9c/duqPTe4Xm1IToMfd+2BfpQH2QTTPiK0VatU3?=
 =?us-ascii?Q?Dwip/reM2T83BpfKQDrJD8gscDtTOGEX0msymHD1N2CeMXCLjV/8iPskUMl/?=
 =?us-ascii?Q?JUAptQRJxJquwUUb773SNnGRW4+kEGXqwMiPiRXJVeleWMODA2W7umMN6EJQ?=
 =?us-ascii?Q?vVpglYfQTvW5uGNk9JApiS3RbIA/l7ZZmXlCs8REcspHQ0y6PellaXFH1tki?=
 =?us-ascii?Q?mPm6EYmN9UoNH8ogH3vVfpQUuNl39J1gY+ZBDKRl8Q+6zuLr7tbZZFnqmsT4?=
 =?us-ascii?Q?8QhZh+ZcNCGZMqp+FYrPQcWMKeMFncdiIvFjOj4nlZwDhVg3IDvFitbluFav?=
 =?us-ascii?Q?QMgcYoDfOAm8LhsO+c+6/AjqAtoW/TPx8rld0wiV88WFiaprEDUMBjz6YoGw?=
 =?us-ascii?Q?Hxrxza0+c4pmttmw7kqObyFzWaiZ9jKcmUs0D8xXPeo4lb/cWYw1LZeIqu7Z?=
 =?us-ascii?Q?ditXXGLcjhtZvYhyRzsuMIWjXcp5EPWf5a3WSZPE1aN+CtqqHy+q00MU7h7q?=
 =?us-ascii?Q?mDWuDu3ZuHCtC3VF1hjVbke1OitAv9m/xG7XKUFTuldkaRInZEI7YvqOKhDi?=
 =?us-ascii?Q?ziRnd1rtz100clKwX+crn8vl1FMzM7nlCQJ0BRanuAqvf/DVWQCzU0aqvlzO?=
 =?us-ascii?Q?1D/dG2hNVUkf2k0aG2uvA8BA2qjXlJe4AgiN7Fxl?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7415fded-2293-4465-edb8-08dd313c35ab
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 06:01:22.7610
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: htroSdF/dxS3nzKIpqIjntV3q4KRTiTTAbDZsGM2Eik3FUjh4pHnShiH+zMQv3HN3QbULE+UgyXuEwMBIg5CQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4132
X-Spam-Status: No, score=-0.5 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

FS DAX requires file systems to call into the DAX layout prior to unlinking
inodes to ensure there is no ongoing DMA or other remote access to the
direct mapped page. The fuse file system implements
fuse_dax_break_layouts() to do this which includes a comment indicating
that passing dmap_end == 0 leads to unmapping of the whole file.

However this is not true - passing dmap_end == 0 will not unmap anything
before dmap_start, and further more dax_layout_busy_page_range() will not
scan any of the range to see if there maybe ongoing DMA access to the
range. Fix this by passing -1 for dmap_end to fuse_dax_break_layouts()
which will invalidate the entire file range to
dax_layout_busy_page_range().

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Co-developed-by: Dan Williams <dan.j.williams@intel.com>
Signed-off-by: Dan Williams <dan.j.williams@intel.com>
Fixes: 6ae330cad6ef ("virtiofs: serialize truncate/punch_hole and dax fault path")
Cc: Vivek Goyal <vgoyal@redhat.com>

---

Changes for v6:

 - Original patch had a misplaced hunk due to a bad rebase.
 - Reworked fix based on Dan's comments.
---
 fs/fuse/dax.c  | 1 -
 fs/fuse/dir.c  | 2 +-
 fs/fuse/file.c | 4 ++--
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/fs/fuse/dax.c b/fs/fuse/dax.c
index 9abbc2f..455c4a1 100644
--- a/fs/fuse/dax.c
+++ b/fs/fuse/dax.c
@@ -681,7 +681,6 @@ static int __fuse_dax_break_layouts(struct inode *inode, bool *retry,
 			0, 0, fuse_wait_dax_page(inode));
 }
 
-/* dmap_end == 0 leads to unmapping of whole file */
 int fuse_dax_break_layouts(struct inode *inode, u64 dmap_start,
 				  u64 dmap_end)
 {
diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
index 0b2f856..bc6c893 100644
--- a/fs/fuse/dir.c
+++ b/fs/fuse/dir.c
@@ -1936,7 +1936,7 @@ int fuse_do_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 	if (FUSE_IS_DAX(inode) && is_truncate) {
 		filemap_invalidate_lock(mapping);
 		fault_blocked = true;
-		err = fuse_dax_break_layouts(inode, 0, 0);
+		err = fuse_dax_break_layouts(inode, 0, -1);
 		if (err) {
 			filemap_invalidate_unlock(mapping);
 			return err;
diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index 082ee37..cef7a8f 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -253,7 +253,7 @@ static int fuse_open(struct inode *inode, struct file *file)
 
 	if (dax_truncate) {
 		filemap_invalidate_lock(inode->i_mapping);
-		err = fuse_dax_break_layouts(inode, 0, 0);
+		err = fuse_dax_break_layouts(inode, 0, -1);
 		if (err)
 			goto out_inode_unlock;
 	}
@@ -2890,7 +2890,7 @@ static long fuse_file_fallocate(struct file *file, int mode, loff_t offset,
 	inode_lock(inode);
 	if (block_faults) {
 		filemap_invalidate_lock(inode->i_mapping);
-		err = fuse_dax_break_layouts(inode, 0, 0);
+		err = fuse_dax_break_layouts(inode, 0, -1);
 		if (err)
 			goto out;
 	}
-- 
git-series 0.9.1

