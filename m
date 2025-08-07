Return-Path: <linuxppc-dev+bounces-10724-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1DAB1D8B5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Aug 2025 15:14:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bySLQ6jllz3cRJ;
	Thu,  7 Aug 2025 23:14:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2413::626" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754572478;
	cv=pass; b=AzJX3A12ssVdyZXkyS8ZTT3NIYvgQFyJ9JRn4bsJBYPBws73suVoGfx812OWaTc3ZymU6fACeH+OtzqdklaKklkQqr0S94mqAqM8249yY9xI24qgqH1+AkMreQH5aZAH4AewuVe3G4O/rveh4RT2ik9ItKAH9FSs8Q/3YD8iq8ECuD1OjGoVQ/6A6M2I+nTX6dyosGeTjkPvO75e9vWvsEzIK/XynXig6+yNpduo0Gwfrl8bRfEU9T+ikZhRGP7RUirtrY3j91RFjN/h6wrHKLo94jl3O2iDfiE8j4SJ3fmlk/2kGf1vfJfTuC2AnjjWC4u7hYIgjZ3YjsEescgHxQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754572478; c=relaxed/relaxed;
	bh=El+thOM+nhiCDBrRZrRPm7X53YNuufqNBvCOI8akTxY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Ho9pluNtCNvO018iZlff3MHWBVniWu/+/VCINN2GXTD9N3LjawokP2Hn+wbbjLY8RmjU1L2NeRdQ+kfGJ/aG9uQnyCrsI5/FYd0AZq2PO0HSuT3JxtEW6b6G/eIGnxj8wiDE14trXLtO37u4fg5qvIgHoF7rwP1B7BzzeLypXdDvp7QjoS2RyPr//q/kLe63PLkbNG80DLwCyGmvV7qbVp0CHe7pHNj/EMKFzEfvhu+m5EWqjgJPHukOHIypZNoSO/zxXVh18IBXlZ7OilZqNGMhDhXiOT8hQU51dkCD+7R7BeBIdOU/P0xp0d+FG0svAYaUdt0nu9DnhD9brBSswg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=FY4nlR+s; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2413::626; helo=nam10-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=FY4nlR+s;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2413::626; helo=nam10-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on20626.outbound.protection.outlook.com [IPv6:2a01:111:f403:2413::626])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bySLQ1wklz2xCd
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Aug 2025 23:14:38 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vBn1JdBGA9x4xZIh1Qb9LferC/kfi8XJFZfqbibzERq7ivOz94Pqpmj8hALck63PYHMaNDP9L9YrNX8ObqtwtGunWhbQbTgpLrGB6/X9ElhBJaDgn1abG4YpCI+EU5ptES0IWBZD4eqKTZRRX6CGeneHwhcai9Fci3WhBQuIr7pPCFNLfzate68J43+y9MO3c5uLpaBkU0Oin8ngYrkx1QPliu0NDEoluMFyMhGsdt1A2dMWEGLp983mLtY1N0mqmHwDhTsHHDsMpsIEBn/N1z81ITYGqNvu+kzGN88sE4kVREINHIb8zgZakf83P6s42eOpACkbdUNyY3p/H9d0gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=El+thOM+nhiCDBrRZrRPm7X53YNuufqNBvCOI8akTxY=;
 b=KA9FpaUt08qX2CppQq8pBakpUps1iarFcu0wmxsKbKq1UGZAmIuhfFai4EPbMLG9gwCcljlU4yGxuS3j9ZKLTVvHFNccMjLLKaG8Xc2409IrN3gMgZxjGmSTkyecxKEMw/caN0COZyGxqaTvMQAON2oNev8OgIuo36jLIGgZOi9wNRkahl2UE+s6RESu2vzK5Xxs7Je4/pgR5gsskjP0TSyyewdJ6+dC6gE0V4pAJB1dmVFkuHc0Z9nadC5a9OXgyWSQVug9oKGc57edWruLaxTdGQsgnD2xSrenTLYmo6+i2oXIDrn7nMyw3t2CCaM6E+qUitFeVKAPfkJJZPOXOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=El+thOM+nhiCDBrRZrRPm7X53YNuufqNBvCOI8akTxY=;
 b=FY4nlR+soJsM8klSrOPAOrg31kLGJYSQ1tRih89ZOhYX8cHF0e5Kr7JsUhzT++XuWV1fRQqYXYlaMp6Gv4SEhA7EOajLWicC5/kViZyYXEQwudBSyIfSuDuy9EB7crZH7Jpn60upm4FhetklY+OzV1NhH/JgQC8npA1jViXcfZRhnbL1NagLlzV8gsdhULttxhS/HnNp7g334yoINUiQq3PBG+ee/IbYQf2TiTFErVLk4IeEcUIwVtVmbSBBPtJPXMrTB3bM+gKjf+FVEV7NNONnAAuTtK2c6L7OnI49Eq8GXFJsDAxK5quucGyc2kNQSIzvzGosJbJvuekvXUuvmw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by SJ2PR12MB7848.namprd12.prod.outlook.com (2603:10b6:a03:4ca::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.15; Thu, 7 Aug
 2025 13:14:19 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.9009.017; Thu, 7 Aug 2025
 13:14:19 +0000
Date: Thu, 7 Aug 2025 10:14:18 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Leon Romanovsky <leon@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Leon Romanovsky <leonro@nvidia.com>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Christoph Hellwig <hch@lst.de>, Danilo Krummrich <dakr@kernel.org>,
	iommu@lists.linux.dev, Jason Wang <jasowang@redhat.com>,
	Jens Axboe <axboe@kernel.dk>, Joerg Roedel <joro@8bytes.org>,
	Jonathan Corbet <corbet@lwn.net>, Juergen Gross <jgross@suse.com>,
	kasan-dev@googlegroups.com, Keith Busch <kbusch@kernel.org>,
	linux-block@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-nvme@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	linux-trace-kernel@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, rust-for-linux@vger.kernel.org,
	Sagi Grimberg <sagi@grimberg.me>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	virtualization@lists.linux.dev, Will Deacon <will@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 13/16] mm/hmm: properly take MMIO path
Message-ID: <20250807131418.GJ184255@nvidia.com>
References: <cover.1754292567.git.leon@kernel.org>
 <79cf36301cc05d6dd1c88e9c3812ac5c3f57e32b.1754292567.git.leon@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <79cf36301cc05d6dd1c88e9c3812ac5c3f57e32b.1754292567.git.leon@kernel.org>
X-ClientProxiedBy: YT3PR01CA0030.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:86::18) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
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
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|SJ2PR12MB7848:EE_
X-MS-Office365-Filtering-Correlation-Id: a23f7666-f381-44ed-7261-08ddd5b45152
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Yx6kIC87cr6QGSDO2/ocsFrHfxDyWPJob8ClpG/b1iCCx7jQl9SbfJdYwGmA?=
 =?us-ascii?Q?0SCnTP5cEZ+3uAVFbD78BsFna0duU7C0od9AcX5Dw8Mzrz+nbkwFg/hdTaHt?=
 =?us-ascii?Q?gv2QpU2TCx0BrBLg4ywaxeRFc4u5BKvtUAXQ67WyVcg0OqaJlrQYfjbUe9Z3?=
 =?us-ascii?Q?CqAbguL+FG4tumyFaizqRh4k+dp2hCN9HXtGKrxEWkA5W3mydAEWUtGfTiH/?=
 =?us-ascii?Q?yFyGlLM3CUYv0UANPgz8OLGYtCb/v0dj0gkGIYwqZG+lWYwusuturuNdWh7+?=
 =?us-ascii?Q?GVjp/Bgo2X3M5DMMnUMa9Ep7r7l5GssZTr/5bbS8Y1v+cKsUrLa7BPvkk1ZP?=
 =?us-ascii?Q?s70SpOqcSGdkND8E942R5iRoXPupjZ3kkVPf+DYptPKaqjd5fbq9Z+6gTuXV?=
 =?us-ascii?Q?a3y8riXtmpbtg28ZYqedgMM+CfTcEuf4cU280lroq1gFO3YEk0gazAmuuGBx?=
 =?us-ascii?Q?R6+0vZP5txw7pvYcOtgZKl1JFHdEc6fTKbude7jN/aJjR//mVPt01KfIM2fs?=
 =?us-ascii?Q?08kPqK0J/g3uGNao1I/+Fnuu+FOXB2jz7qwrIGSkDh7rw1PB6mnz8sB1rpz8?=
 =?us-ascii?Q?Jn27l2c1oQALl352iCNwsf0c6ITtO6moNQe533xtAhdO0FFEsfKEVIOknrRC?=
 =?us-ascii?Q?DWp2BJCXq6NTEFjdqMBC0XQ5kCyJk1S0a8DXyVt6G9ce+mRxNqW8GfjZXrfQ?=
 =?us-ascii?Q?Mmmo+Jl+pvKHt9DipPEWPQeBHFgzP5lMcc8WDaeQvLRV2ag3LKM2wFvbjKoO?=
 =?us-ascii?Q?tsR8cITmN8/qPhDOrc3kjiw5h3MTe9v9jt5yiPv1iQc3NMUlOsc6xNkZKlo5?=
 =?us-ascii?Q?mb0zVO8Alu64x/hQnn3jI+IRDejbHOp/lSM3EimbbBwEuYcHpussF4L8onAA?=
 =?us-ascii?Q?2aL0esT331BhR8he7KtMygbYUbRU3fQppAKtbivq5MwrNN+sPdtjY5r2Jmm+?=
 =?us-ascii?Q?mXTPBVAbzctgZlFjhuNWr4ywRaPhc+qdz057kgKpQcfPeO8hzfmslfYjiQyH?=
 =?us-ascii?Q?WJdBQ+BnKG2lf58O0d08gaplR1D0rbUnLpQ13+jStDLHFl+BR/dtxQ1Mo2hF?=
 =?us-ascii?Q?FIW9fKzat4N7O1IgCwfshwUU2SsJzohB4z5GcWgESxNrhD9iO/zb8/fPPCJx?=
 =?us-ascii?Q?ofJFTmayXtZt6G5/Wq9qUYF1iXoIDFkMLkJQp2txvODyOLoK8gbf2zUi1b/Z?=
 =?us-ascii?Q?seAoFm/rc/BwrTiZRJoCEV9Z9olZ/6sEDTDynIGyQnzfZqdOV5cWEWGrx9Oq?=
 =?us-ascii?Q?KDo+hdwdZ8gUL2N2BozkcLAq+12z9JijoLk3kCmmkjiRgDIaPndijasGwCuy?=
 =?us-ascii?Q?vetI4XxhmWoShno5QwSD24G85Kp7wA4KwhKDacRBp5HBY+5qsDfWYlwLq54C?=
 =?us-ascii?Q?hwRnM2A48KDse6KJxxem1NUwmWDBdjBbH/G5U5bEX5SL6PwpnGTjy6NEtvFr?=
 =?us-ascii?Q?wZLYwWVsRiA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GuZggLyOM7OO92e5S7fOJyVVd1bi7L4yafMEFEoOjse8ZKlxA1U3xm6kb291?=
 =?us-ascii?Q?Fj+QvjYgFaJiEiHxz5PqGjBzSZyXfw8Gjo33jyJMkZCwVmN0oF8qzg/kWFRH?=
 =?us-ascii?Q?gz611O6P7nTz22JW/wGyCc4xb/huGIMzl2GxhhGQxoJseBpF9zTTW7WKa/hg?=
 =?us-ascii?Q?96RAlndKeft0qoeyV64IK0vKmAEgKE7P4FV53P82XuczrJQQ8eTRpXz4kHwE?=
 =?us-ascii?Q?zugrV0R5VcFO+4fQT2J8AFhQPRfx0/oHI59iuFu+CybYJfFgLe05oVISv/5z?=
 =?us-ascii?Q?74C/mjVWkPueRZsZIPympDwkezhDUinEz3vqUqiggYVth9f90CbJkHizkLQB?=
 =?us-ascii?Q?D1vQhwNCzvUA4Ro7Ke72OslLV0q0U9Bbd6n5jj4kfvhwlsXfc/7oJBWqmzRn?=
 =?us-ascii?Q?t4gib6TNBZTNjGXdk4ONqP11TZXn6lr5hX6MTdTKJNmhJGEoZEQVFT/4e8Ko?=
 =?us-ascii?Q?sQvfbNamaMosU0aQrvUKrtUT/fyBQXJ+1shPUdRuJau11/VW7SwXv469h6vP?=
 =?us-ascii?Q?sVP7HGe5m/6t9TiaSNPdbyPNjpBfiCyfqdVEs9IxULDQ9LgLCPeXLzXf9W4w?=
 =?us-ascii?Q?2qyPMxhaFptcLSikYv7DGdoxO0CYlCTu9nsjh7zg7iGE3mw2LJnY7i58YVul?=
 =?us-ascii?Q?p2uLUsm8/8i4cuw6IUDE+DsWF1H2w+BE3rUZ7sNDlus0JkAs8252gQ8XWn6O?=
 =?us-ascii?Q?sC5RD9aM9WHFQX6c/sGHiLkAZj68TjQsO//jT90tqz21eYHdJTbfWBhZ4aqO?=
 =?us-ascii?Q?U21fyMUfaIM3lElqIgSEuaH/vO5AH9lwLLjCP03Te+j44kFq5d/HqFct5Ma9?=
 =?us-ascii?Q?78beNahziuj+Y2QHuLZKiUwl+SUYIeUEJQcmL1in7UrD5QRMVYKayZ8LGFKM?=
 =?us-ascii?Q?x52Twm9SDMpnOZSWhmNPIPoLEomznG8BUEh3zBZNqFZpFmjJ+RHYj5CYOAXt?=
 =?us-ascii?Q?u+eHw2MSAHczRemjOUlW+orG41QG/hJOistp8cNZgH3dL51L8WIZJPgI7U8i?=
 =?us-ascii?Q?/xBRu9Xrg9FNYZ7UTObMqQwFNu/z8SVkBAItFtESetAg2twGmOiiCXC21CUM?=
 =?us-ascii?Q?LlEMSJkGdenL40iXOQO1gcxqnnkDQ/togw57I64AcBIUbcwUdekwE+cjb1bn?=
 =?us-ascii?Q?uUgiwo/Cg3vq6go3nQfYav2gtskkL6QgrgQeni0cZpPw0g6KVIGRMKohBywz?=
 =?us-ascii?Q?xZfGb27F+pTKeerTEMXeGaeEKywXmOseZYA0Avrtso12WDZS0/Pq23eFHDko?=
 =?us-ascii?Q?D+ShdTL9LuRZH0/Q036D5ymT6YSGnNLmr57e3O2ObempFdRETN/iHb+eByUJ?=
 =?us-ascii?Q?kgCKRYpnDnqlGCtg3s+P2/AMRrtScL4IE7P0xfCUesPrAC1GWIl0snuSZOl+?=
 =?us-ascii?Q?lcbn5RpD41vxbKtjUCR7qXezT1h38mkBHEFa+0an4/ybVHzhh+AaCZW9TYyQ?=
 =?us-ascii?Q?NJEvG2UWsBKfjnnmZIZUawI/79M/asPB821CK+zuhJC80V9BYs/Ctxopy123?=
 =?us-ascii?Q?bXBFCOfdSfDPTtVNYGbmXrXS72FHDUg49E4abuhNnFKOZdW+2Qvo71nq0iz+?=
 =?us-ascii?Q?T9+TW6anY1irc05J9FU=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a23f7666-f381-44ed-7261-08ddd5b45152
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2025 13:14:19.4548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +hIdqSIgATwRq7OJckpehDxKPFDImSL8By+RE0tqZl/FgfZFXraRXFcwjhcsQya2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7848
X-Spam-Status: No, score=-3.1 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Aug 04, 2025 at 03:42:47PM +0300, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> In case peer-to-peer transaction traverses through host bridge,
> the IOMMU needs to have IOMMU_MMIO flag, together with skip of
> CPU sync.
> 
> The latter was handled by provided DMA_ATTR_SKIP_CPU_SYNC flag,
> but IOMMU flag was missed, due to assumption that such memory
> can be treated as regular one.
> 
> Reuse newly introduced DMA attribute to properly take MMIO path.
> 
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> ---
>  mm/hmm.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/mm/hmm.c b/mm/hmm.c
> index 015ab243f0813..6556c0e074ba8 100644
> --- a/mm/hmm.c
> +++ b/mm/hmm.c
> @@ -746,7 +746,7 @@ dma_addr_t hmm_dma_map_pfn(struct device *dev, struct hmm_dma_map *map,
>  	case PCI_P2PDMA_MAP_NONE:
>  		break;
>  	case PCI_P2PDMA_MAP_THRU_HOST_BRIDGE:
> -		attrs |= DMA_ATTR_SKIP_CPU_SYNC;
> +		attrs |= DMA_ATTR_MMIO;
>  		pfns[idx] |= HMM_PFN_P2PDMA;
>  		break;

Yeah, this is a lot cleaner

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

