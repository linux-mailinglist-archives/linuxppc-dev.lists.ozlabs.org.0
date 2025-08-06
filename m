Return-Path: <linuxppc-dev+bounces-10695-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E712B1CAD3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Aug 2025 19:31:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bxy5l69xnz30W5;
	Thu,  7 Aug 2025 03:31:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2412::630" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754501515;
	cv=pass; b=cS/OaE8cWAvcDJC+xLkPFBrMeLbUEbOpClHPhV2vpG3d5tHGoxIUPeT9cNdd1ssFL0gdfoUtRId550U+mKfjAws4ZHlAlNvZd3WWNUC2eA/FkR+nL57dumvgO+sWQuXvu9cTptGzCOpxCQBslKszdI9yZA+esSIhGM/IVAhJUYTldq24JxABvCaoBFzsP/JVr7oZo6QGo9ya2Q9s4UUBmsp8cKPVefvyt5juiGCc6iBckXy1f5/T8HPRU4A9PGJlM8C1Tqz94pnoixZMY4+G1rVRjU5iRF3Gljgwmz7xPd8MfCFeNU/tEa29Y6GxwThbBan7RGHiIDhnmUneZWf3/A==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754501515; c=relaxed/relaxed;
	bh=iyBBtGtiRatUjTAS6JqftkIY0Yr20GlVu4ehze8ZHrE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=k1rnAwJxsPRQCAJj0QBBDhthsWyJqhjCPuLfXIiO6rd1QgV17bZEaCYsg+rHMyIYkUqI63LKaKOU9uExzjCmSpEUhitisvqGFHVr21Jue9f0V5PqPPStqoULZ3m8ZzfwGBTI+MYqkKJywLkz/2SaE+8dQztYUzkPhjn1MXdpwhWIGRXDY2l5wPtArpXRnJRs+RY9Lr9BXmGaXWP3S5rLOhjq6cuv1UyfnBzY2TduZmYc1EpQVI/8fpcvg85PsI45BDfvB59Cprrd+SV/1SYbHngM1HSY65lijNvJoeI2ALghBPN4PcCP7UrAxff3kWI3WMopZ2YHlTl7YjVB7Rizuw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=hKJ5KbXB; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2412::630; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=hKJ5KbXB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2412::630; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on20630.outbound.protection.outlook.com [IPv6:2a01:111:f403:2412::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bxy5k2Mb1z2ySY
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Aug 2025 03:31:53 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pEcD/7UswNX8ydTSitOoL5xD5wfTPUt6w5nbCvLZLizVbrDofFEImCT/DPqSWLnH0A7hX0CfKqaUfnfGsRLYgcVT97KHHnjAFhaoSyLh/PHfNq8zs6jUXO+UsJf856K9EWmxC3XTnQTvVsO3IPxnQarf/7xtSMHroFmk9U17LEPcssPtoXh7fTJzuGPDm3Fh6+EkHY9o6IJ5je+ZEBtpxZ2/djzM+sy329snCwH+U5yCoZmMZr3HlUUePcAfPtENaYVHX9yVEpcSNKtJPiQtmnoqzeN5D3L6en6UuRslDOG+R51ARbkKrz5EpCoARP7njow0SQMr1YyIF0wjzi6HUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iyBBtGtiRatUjTAS6JqftkIY0Yr20GlVu4ehze8ZHrE=;
 b=h2mjP5taYqiZXxIdCNIHs6ise3BGw/D0zku5eHum1BuSzOE25o08l18BIyH99khQnB0tDTid7UtDirscdJkSLNAZrB3xmQWyIFCJB1wIUssXO5iiIi7WQrES7i6s8ybjxs6uel8+ZVBzKZHYkvQgNObe23E5yrf8OO1UpDhwaa5XvnFJJC/ar+rrcqQf/fPM3bvyusSKDDKhmV8XBGu/v37s84w6OhsmIc7rnFsStRAyoXjlYp5CNhTzaIr0GflIzeTIwiz0FXRZsCbN2J4oCnfL0OSRGQ7p7A9dM5eOmna335SWQrHmhKXBpyBLZq9by3uYKiGdpb8w/9hjG0OMiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iyBBtGtiRatUjTAS6JqftkIY0Yr20GlVu4ehze8ZHrE=;
 b=hKJ5KbXBT/VxNcbJGVjEuubofK8WW5IcX9+LqVjH9PnS1bYfr2bVYahRRKi5pkNT6fEjFUlfNPGpuUtkO1pYO0hxdfLv7l4iulZDGkWlSeXLWS4fk6BhRgKk7afXw11JQ3rq611oz/FjXJk0omQqgmCKtFa3ukE1RkM6OnRUMtbEmSF11/NbylnTwRJX6Z8Yt2Ylr6fjUhuHmmGEW8DXV7jQ1ymiYwahSjpeYJnDZpMbQ+vnE5hJKdPnbQTn5fFh7zd4OeEBDQ/9IcskqAOhRweqaVVWuvTwVRyxWKw8mtVoXRg65mvdldA1tiHVKUPsV1DhtEYhCz8C9BFc0mHThA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by BL1PR12MB5898.namprd12.prod.outlook.com (2603:10b6:208:396::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Wed, 6 Aug
 2025 17:31:33 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.9009.013; Wed, 6 Aug 2025
 17:31:33 +0000
Date: Wed, 6 Aug 2025 14:31:32 -0300
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
Subject: Re: [PATCH v1 01/16] dma-mapping: introduce new DMA attribute to
 indicate MMIO memory
Message-ID: <20250806173132.GA184255@nvidia.com>
References: <cover.1754292567.git.leon@kernel.org>
 <f749c597980592ecc7aeb5ecca974c8dfb76f834.1754292567.git.leon@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f749c597980592ecc7aeb5ecca974c8dfb76f834.1754292567.git.leon@kernel.org>
X-ClientProxiedBy: YT4PR01CA0214.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:ad::21) To CH3PR12MB8659.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|BL1PR12MB5898:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a97b1ac-fbf8-4645-964a-08ddd50f1627
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yaJthfZ6S1NFLAIf+giyUFeFb5HmHR4/JaN7jHXzGsOaznN1NxyhWOd9L7lt?=
 =?us-ascii?Q?H9Vs8zU4xb5p15mZ+CWJn/+7dnF61xL/sW3AGiLTq3kgMHTWk2G2VX3r3UF+?=
 =?us-ascii?Q?Q3h3nMz7FqX7X/d3YZ0NxOTPVV0pHfMOTTaflPytq9k1LF0h5RqGkz1OLqVZ?=
 =?us-ascii?Q?EemC3bPnW4VDo14bQaBjics3HW9FprJ/eLtO0D+t1GB/9qei2YiL1xavzgnb?=
 =?us-ascii?Q?nnkyW47WyqJlgImvhfaezt2Buu3LrOJRNUgS7egN1TzbWEOMpWC5+gxhoJpz?=
 =?us-ascii?Q?lW1phaq7PI/6pl/OvOt2WBqz9bbOfSLYlhWWL5YdAruSAtSKuM5AGfiWBKcd?=
 =?us-ascii?Q?T44SfhFtzD7sdCgejc8APg4OTwQBsd9vJA9XbKzMmfUBvnbstU0DWim+7HJK?=
 =?us-ascii?Q?efSAIfCAyYJZZF+379y+MRSSImbSvZm6beHfofM155XGzn6Qh4zirCoJylnn?=
 =?us-ascii?Q?uYEhc5p2BUPzUFkXsYoeufDTIy62n0L4xaqujdP2fm9Rj8EE2jatkFwEMJod?=
 =?us-ascii?Q?cE4xKPjR0XZzDeOPKtkL+DXX+01qFbma0kp6KvYBaFKShf3tL4wSdj0rxD0R?=
 =?us-ascii?Q?ARNk8i9K48OKmJy1XsjX4YzI50PrB08PeQjL+2zyJKkYRifoG8THB9a5oe1e?=
 =?us-ascii?Q?omxP5C8m8zfONa716RcASgZKS0CpVePWSB/ehmT7CvfcxWU9OmN0giAYEkBh?=
 =?us-ascii?Q?4OQpGrTblaY9gb5RMCNoD7+ueq6nKrH/wop1aio07NwHyrTlz/V52fkD+o6O?=
 =?us-ascii?Q?mEMNLj30dsATsEX+FZjypCM6hxbZhvjh2k/1oKNW4YR1UdKmOGIepMX+TG5V?=
 =?us-ascii?Q?U8IpM7DifIBa6JhwA2zTuOcdxxTQ+DnLiqpc9OD7gg+zGrkcHpLsV6Y/ER+d?=
 =?us-ascii?Q?3mPE3nXz8GMmRhyqPThiOGXAqLZA+RtZjb9WG/XvSgBpkGWeduNrmai0a/t9?=
 =?us-ascii?Q?dn0q/eYJ7cpltoJOwwAyOtucxfTqu0/Hqc3K/Am1QJSCqecFm2bEcjqUV6+8?=
 =?us-ascii?Q?q7XEdaom3j4CiikrGlsv2Tzh3X6QNxcyG5UIzsJSRSvnPjkwWiCnc77Ov6sN?=
 =?us-ascii?Q?q6NBtoagpMLjt3QJF/r1of/Jn2BuoOewljNauQSsO3KoxXdPko3gLU+59YH+?=
 =?us-ascii?Q?Y1nJYhOUkMZjeCfxDGr9wByWXiV1mXiQxlD/r5t3HvjJpLb366fmd9SLGgbM?=
 =?us-ascii?Q?DgzdRPXiFg89YcR27s8Nh2/Ftqs11/CLGdq6wlZC4ldBOBPHXOLRQqkk/37M?=
 =?us-ascii?Q?g0bA52S0l9tS3IwSvn/OAeEIlws8/3XoLqI7Di8gtHcmvCwOto7hS9Nqd6d7?=
 =?us-ascii?Q?ZiHxarnrtq+R5eGLP8NbLdB1+X7VlP2lGRRamhU+n5nL9zh7cpoWWc22VwO7?=
 =?us-ascii?Q?SiIUNIS8qJPOizGnA+hsoYD19+EC3TtSfxa6663hM2PgRUBj8fAgZQWs6Yc0?=
 =?us-ascii?Q?Wk2Dj6XcM/g=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Fr/6CZwZ3kEMrGMBC1lhp0GWYqcvajTxzIaycEtiDW7Fajfod/FOnW7lw8Jy?=
 =?us-ascii?Q?N3dxzqfJfP4dYyq8QGLZEXZSXAswRCVM0FEAhzUmrhF0GqictvMu8LNC8V8I?=
 =?us-ascii?Q?9wne+n6y7p9uslMkaj5VB80csBRjMb3NlatXuZfydZrs8hZp5UC1h4PK5NZn?=
 =?us-ascii?Q?qeNMKBdm1xkZ8tCFwBAwqeE7bbJ9EEGEt2/Y7UBH2ZbKvw1QV3YTUwicKV2Z?=
 =?us-ascii?Q?3UkoquP1UFDeMxh5zXsa6uxrhAc6TaE9Vkv899rJbXFcADwsAliOIFkUO0pp?=
 =?us-ascii?Q?rcKHikt6sLx1Ej54cFZ/tBh+HotVw+7IVnUzJ8lGthaa0s8pN6gkTb3LW9Ri?=
 =?us-ascii?Q?CBcDmY+hhYovu+e51IfKZ/sQHQzaZgOKoELs8cCsaRtw928hUOHFJdzx5NOf?=
 =?us-ascii?Q?nbAZPCTTk8vdizcOrLQr13i7pN/+5Ra7yuwq2UwqBnYhlz1vL6EJXJoRY862?=
 =?us-ascii?Q?Ir0xruuDxqsMfHOk/fea9muX3WbNOW0PyFvuKlUmhV8jlxE9CbCMuEJha2W1?=
 =?us-ascii?Q?aqGY8XO5Nxi8vp5lR88FXlLK6bfGkM5Zj0UIRwlklItBuSKFkc54tQzBQnxb?=
 =?us-ascii?Q?THl4+O5qoq9Zsi5AGkaCF9+56x7S1OO22/L+YagOtW1AGFkk6NIr8LmpXTLL?=
 =?us-ascii?Q?wY2N3oC5Imf7hGi/7dIyGrDOI0hFgDwyILSxWFwMQmyH0uxsjDaYh/W10OZd?=
 =?us-ascii?Q?vAiFRRm/81FGKiiUeKmMfRwrY8WA3ERRBran5a/j5fbqnzIo1sjUp2Xq4yAM?=
 =?us-ascii?Q?gOakIFaYg9Q6bQMcqhtp7O7NnEKbYXZD9JkEEOCUDqjZ+mFQLHqogXmbwUp1?=
 =?us-ascii?Q?SecpZy33gDty+jNSCmgOxLxOyYTXZSj71kHhHXfKMH9g2I0VXmCxLa8mAA/4?=
 =?us-ascii?Q?y8ukTVZH3K4p7wTSRS6kRoOAmKPQOnbffGt9HUUD5Faf9XBloR8aveDEOMAP?=
 =?us-ascii?Q?yzjBMQlw+BniFN7rLzW1trAB9pykzYTVxPElPukSiEkjRsvfqgT8Xft/q0Z9?=
 =?us-ascii?Q?DpgptqDhG/24Tb3+MZe7PS4rh9US1CyXI8WiqmSdrZk14wopmqg/b3DqWtkZ?=
 =?us-ascii?Q?5uKk+1axBMhTCDc/jTXGQyDVB7Roimd8aQH5CSpqUC7fn0STLjNqSNiVdHdg?=
 =?us-ascii?Q?ASvVSeIi+tbJJZF6QkZH8qH2XpXdFQlbBgu2hhMlctm0k7UMJPjTmpgmO+Lx?=
 =?us-ascii?Q?VtT3ve9pJFZ5HVjWkHtKlfYZuiEzTFLVJq3MwLxNft67QSGH1bmM6gZFiqoD?=
 =?us-ascii?Q?cpxQP4R0xP4+GHLksnuEotgp0a2gu4d4LwiD9Cz3WVHKbAM6/d5HvJIAMzN3?=
 =?us-ascii?Q?DtsFVWu1JMvo7oi6VstNgi3x8owAY+emgvzYirbf3+Y0g55mv6+/RiB+Gp4d?=
 =?us-ascii?Q?2tEaCZ9nANHvV7JDcB6kiZ2RdQVsxGe0iLUY7susz1QyqaNfGVPlEtrIWTKm?=
 =?us-ascii?Q?G7xqQ2V/JEO6S6UFkG6bqYNdMvZvyFn1x7vjxerjlGRBaqKB2cl74rFxK4hT?=
 =?us-ascii?Q?uVVB15nB1uRdSHbejfc7xvy2NYPbQ6ueMyXzTO61gC89CjWEBK7uq9uQzeQ7?=
 =?us-ascii?Q?ubr9roeGWrQpckaiErI=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a97b1ac-fbf8-4645-964a-08ddd50f1627
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 17:31:33.1882
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UIDPQM7vQxkJhwVkF52UEyIoAZthU14Jt3NMldnpBtNcPLTqx0R1ij/KXDTxkOBv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5898
X-Spam-Status: No, score=-3.1 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Aug 04, 2025 at 03:42:35PM +0300, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> This patch introduces the DMA_ATTR_MMIO attribute to mark DMA buffers
> that reside in memory-mapped I/O (MMIO) regions, such as device BARs
> exposed through the host bridge, which are accessible for peer-to-peer
> (P2P) DMA.
> 
> This attribute is especially useful for exporting device memory to other
> devices for DMA without CPU involvement, and avoids unnecessary or
> potentially detrimental CPU cache maintenance calls.

It is worth mentioning here that dma_map_resource() and DMA_ATTR_MMIO
are intended to be the same thing.

> --- a/Documentation/core-api/dma-attributes.rst
> +++ b/Documentation/core-api/dma-attributes.rst
> @@ -130,3 +130,10 @@ accesses to DMA buffers in both privileged "supervisor" and unprivileged
>  subsystem that the buffer is fully accessible at the elevated privilege
>  level (and ideally inaccessible or at least read-only at the
>  lesser-privileged levels).
> +
> +DMA_ATTR_MMIO
> +-------------
> +
> +This attribute is especially useful for exporting device memory to other
> +devices for DMA without CPU involvement, and avoids unnecessary or
> +potentially detrimental CPU cache maintenance calls.

How about

This attribute indicates the physical address is not normal system
memory. It may not be used with kmap*()/phys_to_virt()/phys_to_page()
functions, it may not be cachable, and access using CPU load/store
instructions may not be allowed.

Usually this will be used to describe MMIO addresses, or other non
cachable register addresses. When DMA mapping this sort of address we
call the operation Peer to Peer as a one device is DMA'ing to another
device. For PCI devices the p2pdma APIs must be used to determine if
DMA_ATTR_MMIO is appropriate.

For architectures that require cache flushing for DMA coherence
DMA_ATTR_MMIO will not perform any cache flushing. The address
provided must never be mapped cachable into the CPU.

> +/*
> + * DMA_ATTR_MMIO - Indicates memory-mapped I/O (MMIO) region for DMA mapping
> + *
> + * This attribute is used for MMIO memory regions that are exposed through
> + * the host bridge and are accessible for peer-to-peer (P2P) DMA. Memory
> + * marked with this attribute is not system RAM and may represent device
> + * BAR windows or peer-exposed memory.
> + *
> + * Typical usage is for mapping hardware memory BARs or exporting device
> + * memory to other devices for DMA without involving main system RAM.
> + * The attribute guarantees no CPU cache maintenance calls will be made.
> + */

I'd copy the Documentation/ text

Jason

