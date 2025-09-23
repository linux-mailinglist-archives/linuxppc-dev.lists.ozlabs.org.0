Return-Path: <linuxppc-dev+bounces-12548-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1B4B97B44
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Sep 2025 00:22:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cWZHC1cM4z2xgp;
	Wed, 24 Sep 2025 08:22:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c111::9" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758666167;
	cv=pass; b=nhqTQvqGnyg0gnwdupOkrKKu4CJY4wRZeKQodoExSSuPallgYJJkTq1NUrqmnWqgxj6mqu+feyssK07fNU+0C8AsYBwHuzcEErlju6EZym6keuYCLn4wntGyV7YV++TrVMwQGki5jliuG7pU4XZLfXnrJHrcSRMFgXVRdhKpFzk1o2Fbjf7D6QARCw4SNBPCQ8R2bb22z8UrXpZaMcihWmohoy6zytsveQDE7lriRk6k6dgtm/lJ44XVV04J9Cif+EZ/r2CFOAa0iWQPNgJU6mc2c02IIve3gZultuR8iwntMzVq+uXXFn19ZiwQqNYq4oLfMhFLiLcf+J1LFxzelQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758666167; c=relaxed/relaxed;
	bh=6hQxSPueRjqivytB2WxD4yT9ZIay1EdItgh7HO++yOU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=efSAgSI52OJTWOdboO7yvm2bT57zBywmrqg6YLgpzHR2lncGfXtGqROXDXV9M/nve0zVRC2z/K9n5JTVjdOLP9N7HNnGlUZHSIvjpPWF3hzCFoTKy/iDqjmeg5rsBiAI9BpqBi+0Vq0k9LFlJxEylIVB+Ge3mUowJoqG5hyVYoQaW42NiUwsULB4hY/FdnF7KIJnTMq6uXLQ8+GWsyzTszZfe70JZclkUXEFJjYyJ10gzMmcwKbDiOPwaAWYU5OXOfW2OGlQYrzHC29sWnWz69WYJNAqwp4AXdoBrtqIW7YTOTAUgJ/b5l/93Dj1hsVUkDU+q0205Cj8sNr1J+5C9g==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=o6lXNIV2; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c111::9; helo=dm5pr21cu001.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=o6lXNIV2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c111::9; helo=dm5pr21cu001.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazlp170110009.outbound.protection.outlook.com [IPv6:2a01:111:f403:c111::9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cWZH96ytZz2xcB
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Sep 2025 08:22:45 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iAi4sSpYU9zuO+eSlj02D1mT2vZrlCE9aXEYDzIMmitSqBQN+2VX1ibr/mnZKWw3OrO8UObY54jLJ8nPhouBUlHrKK0TI/5UrLPi6iTMXVIMSDrwPXT54A/HWJST6s9TH8x4fuVHLPtNeQ/GPsgSm8G6Cxrm0oPjOp/dv4CQ2FIev4ns7z6x7ZSAqa/50wrjuoBY13BrPTMGIIvubM/9cKpAyI2F6Zb8ZiHjmKJKykdT6ZCs6cS1iCCfGtYQXg+uE12N+DopvzfWy7JkzScecOd/cT8esGFZZGJblulMzMY7qLbqcAgFogLzfmhiy8juUJnIyLO5vYIHPKdQx4SEBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6hQxSPueRjqivytB2WxD4yT9ZIay1EdItgh7HO++yOU=;
 b=HvIek/lX0cBUYLNPcCkNtxHIxjUBoUl+vCN0NfSnVju3LMp/5msW9gaUGEMk5/HjQWrwPTvU+XIafpSQR75SjAXzCdycH2xD5Vo7bKXuWS3d6I6o7hXuO6lgfG/UrY1JiYp77HsUFLrqxGVq9z4Vb+SH9Q3OYbx4wSR67er4Fp6XCmObaF2iUzMgSxtdPrYx803AN9Pn1acmlVMd1vGI4t2mkGIw9plvILU4jU8XIgIj5o4cWItiXzHgn5+o/iohSI4ff//MX5KCr6Ds3GVi9FCNG5jJOyJgmIs+DqXz1JQI0S7uqoyfvYwo4O7QqfiLZtU1nU4iYSnmvum6bIq+ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6hQxSPueRjqivytB2WxD4yT9ZIay1EdItgh7HO++yOU=;
 b=o6lXNIV2qcDbOVBz3hScRzhykjeJrAvH7uSY94JvgF+nxPIuz0abEbY8ZddkS1WLHE8Xj5MaFxug5Mn8T0Up/ObnQ01ZScIvPOLF/LI8trb/QBejrpCBAsKZXBny0IbHrhbe/p6FJgiesrH8kpLwKipC9Hqiy3t5qi5JIiGG2KOv1tcExgLAzKLXArBLQv2ck5tJtncJzhYxKwESG4lSQpaG1tpUCzf+5p6CloJTmHQBvMBH25Y8qSO84C8Mib4pJUIQeNAhMniB/ntJWYePSk40kipGvmTUOOL6iz3CpmaFQ5IxbBOy+hkdElhG352ld4WLKDZpkALEgbB2VuMWiw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB5757.namprd12.prod.outlook.com (2603:10b6:510:1d0::13)
 by PH7PR12MB7353.namprd12.prod.outlook.com (2603:10b6:510:20c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Tue, 23 Sep
 2025 22:22:19 +0000
Received: from PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632]) by PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632%2]) with mapi id 15.20.9137.018; Tue, 23 Sep 2025
 22:22:18 +0000
Date: Tue, 23 Sep 2025 19:22:16 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Keith Busch <kbusch@kernel.org>
Cc: Leon Romanovsky <leon@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Christoph Hellwig <hch@lst.de>, Danilo Krummrich <dakr@kernel.org>,
	David Hildenbrand <david@redhat.com>, iommu@lists.linux.dev,
	Jason Wang <jasowang@redhat.com>, Jens Axboe <axboe@kernel.dk>,
	Joerg Roedel <joro@8bytes.org>, Jonathan Corbet <corbet@lwn.net>,
	Juergen Gross <jgross@suse.com>, kasan-dev@googlegroups.com,
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
Subject: Re: [PATCH v6 00/16] dma-mapping: migrate to physical address-based
 API
Message-ID: <20250923222216.GC2617119@nvidia.com>
References: <CGME20250909132821eucas1p1051ce9e0270ddbf520e105c913fa8db6@eucas1p1.samsung.com>
 <cover.1757423202.git.leonro@nvidia.com>
 <0db9bce5-40df-4cf5-85ab-f032c67d5c71@samsung.com>
 <20250912090327.GU341237@unreal>
 <aM1_9cS_LGl4GFC5@kbusch-mbp>
 <20250920155352.GH10800@unreal>
 <aM9LH6WSeOPGeleY@kbusch-mbp>
 <20250923170936.GA2614310@nvidia.com>
 <aNLnXwAJveHIqfz0@kbusch-mbp>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aNLnXwAJveHIqfz0@kbusch-mbp>
X-ClientProxiedBy: SA9PR13CA0121.namprd13.prod.outlook.com
 (2603:10b6:806:27::6) To PH7PR12MB5757.namprd12.prod.outlook.com
 (2603:10b6:510:1d0::13)
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
X-MS-TrafficTypeDiagnostic: PH7PR12MB5757:EE_|PH7PR12MB7353:EE_
X-MS-Office365-Filtering-Correlation-Id: 52108b48-523e-4f64-a2fa-08ddfaefa842
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HiFBaYaRi7DKEeQsmk6X/SYEgHfzNbu+M4du3xz9VIsxZ0oTPo570go6akJ4?=
 =?us-ascii?Q?2Or3ISNvnQmC1mSqyVZmAV0T2v/xkUXeqZHTEw57a5SxJS8OEIZVRvbzA3M4?=
 =?us-ascii?Q?zUeDxw3aXP1TqOHp/iiZ2FpshQBy2l8J+Nw9WjaXA/oolcCTguOEMyxKwMt1?=
 =?us-ascii?Q?VQvnaXFAXLHFEtkOWiUc9U3JBFrQn626RugY1Kx9u1+zZsLfZwURSftiRyJ2?=
 =?us-ascii?Q?AbRMek5TJ7C/C84eUmGjJf4cI3Fm03XZR7ptnfD76nofpP49hHMx7bOJwLf0?=
 =?us-ascii?Q?AK87VzDSV2liyg0oxstJCPZJ6zjUzy+pFSI1LRXSIL1mEi2bipw1u0pIvevb?=
 =?us-ascii?Q?21wu0KiRuiYmYHdR98L56KVV2qvGXUeT0OWnIrXpR6/tJnK0InA4JAK+q5YB?=
 =?us-ascii?Q?+PNqDo6n/Dz+1BJEAop5huCiDGVdEMB6IUMbGBAAViw6vt+9DYyU+fARydRv?=
 =?us-ascii?Q?VebmValwMPP+ipL63zSb+8coNQCLdhuzjejtPsEFbmo7sFWdRUHZ+SQicAB/?=
 =?us-ascii?Q?by9BGvHbm8YEYES6o68SKe0MRz7M/8DLLJWiGy1FEsX08mAJClRA25ASHqOn?=
 =?us-ascii?Q?9qbt998ToEEpx10C9M08G8UMWKk5IYX9hEmhM6W1XCF3FuIRhHlDniLnnyB/?=
 =?us-ascii?Q?Y0OBUif48DiAy4Qgmx6adV5z4hqXyOAyDd6xu9HSAjwsEbMv7ebhagxAbaJ8?=
 =?us-ascii?Q?tbqGDJJwMHSenWkE8Sp7/kTJx4UYgN1N7X6Pe+3Uw3P+yHCuKVhKmY2E+6Zk?=
 =?us-ascii?Q?r3NpokqBnTBOt6qYL/QF1p/Z/x6u1sKKXW24wlsjStbZNcrk/Ic4iZTA0yp8?=
 =?us-ascii?Q?Ado4kY7x1S6Ce+/bE9t5OGEIHKqSu1XJZaQY2/SC6J9sGb9xY6arvDY/e9yP?=
 =?us-ascii?Q?RWMNN2GEO9PPVY7GQ5mGRFbNn9+jd5o2/Pvz+sPyLUjTtng+O5eji2+cuvtZ?=
 =?us-ascii?Q?t68MCCJgoOVFIxQ4ClfY9/Yu+dqAGIa/AeO+mSDGiCjp4lL5TBWsZdWTubA8?=
 =?us-ascii?Q?5TkQ1oa6XRJcZrXjCwA30d/52w/7HPD57aOxIeQElVE28aV2LTvn2L60eEb1?=
 =?us-ascii?Q?X+ahd1MEFeQy+S/eh00gdgnBmIo5mwR+ubove1EtAoBvfJZQq8fJHRrmPQJu?=
 =?us-ascii?Q?URGBj3q0D1/sVUM+qLwM+taVSl2Q7LWKpCL2sm7O6JkFMotz6AfTRpbA9Xtp?=
 =?us-ascii?Q?R2sdQvjZ0ZX8/+XlV1oRvcz1DrFf2f+xbcy+McKo8J29DmvfmH+cKe1otjcU?=
 =?us-ascii?Q?TmSTeKKjU1L1dBbqDD+Ku+EM5WV4FzyWYRDFGQ1b8mL1qdim6VFY0yN/TAcH?=
 =?us-ascii?Q?DDRNlp83lJc+hT93VKW/mY0ScUrjh61HDhCiPtfRAB43+1vHo7KGLEwIMFwV?=
 =?us-ascii?Q?vvVy7B2jYyZakP+T8+su0vdooier05WIvIUvvLxjdw5XvhJ/DbrG2Rv2rvUk?=
 =?us-ascii?Q?aG+ybpQ9Iz8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5757.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eVGNJdmby9Ocx1dT6CLNPZSYywtZ5BQQPj0z919YXfiHa+uvZCqKScTu7K+h?=
 =?us-ascii?Q?TEhVf3NybTrETxq9+DUNdWg6sUmVul7WgplkbHU8WxcPyscVyqucyWj39Iq9?=
 =?us-ascii?Q?DIBRmS3r1wvzR+ThMQaAl9M3yWH4pN6WhLRib2oK1rlh4sIZv594wK3XES/i?=
 =?us-ascii?Q?ppzmrzxmupDAqwLzMdIybgoOe4Q3FHGa1+jpzZQmCa1PqrEWAgXz8w1OxdMD?=
 =?us-ascii?Q?RqiJd4P4iHVUuNPwNV61LALwTpaQ8wb43sdHVIGPh+WXBNVbn36vYHACN7Wh?=
 =?us-ascii?Q?lEMAUmtTbu8hqVLBIZ727iR6GXDpGJy90XKuqQmGOTzfpqAKdH5s5nAVm68g?=
 =?us-ascii?Q?gCekI4E+feogQTAbMMlwcIR8I5D/NvIhwo6poYenL0IgTSapHG5nXBtDBgy+?=
 =?us-ascii?Q?hLp0loRIWvIQz2FsUDFcxkfGG158SXFVwEmQ7zyKcnwngO3FKZi3ghsoLqQJ?=
 =?us-ascii?Q?h8Hb/47//9zgVehIZ57TYxVhDgNbwBGmJYxSn5ZPB15AUL2LzYZSqWaOaVVs?=
 =?us-ascii?Q?1pH0qxN8vFtk8M0Z3zUjIs8wRAZ2ZnT460HWvYV1B0VGgeCFtU7BdJVfxR2P?=
 =?us-ascii?Q?x4phMDLxNk8HiFuJTLkUvo4PYEeNnO1HWc2Kp6Vt/uQ6K4yuyRFhTO+x0FBf?=
 =?us-ascii?Q?0IpY4BLkzsCYfaApAZtbvUQzIxbIojvg6D1JOBUoD3azc5mW0NKSrI197gYA?=
 =?us-ascii?Q?GJBqME/8N/RhwtzSW/tU9Djna9U8SbbeOjM1A+z4ADhfzf4Tz5Y++RN58UQ1?=
 =?us-ascii?Q?7BneyeEdGNqb3T9E1i4PsGbfTYOREYyhWED0aS4Af4zMcxxZx2yhGsa0hqqT?=
 =?us-ascii?Q?jDFDoe3YmI5+6T8UAwCbiVMixiVSqn01f603+7MB9V76s3Vfyhw+XR8mVpvl?=
 =?us-ascii?Q?NrFMuOvp4BECPmrykWHZzeyE6WKEGSxcZ/ES2liREp9ffszRLshxPBH+TC9A?=
 =?us-ascii?Q?6m7h5pYOfEpB7IMYNxYWiPCtgJ9Gtee/Um9osjzrExO+me55q3Yag8zswFgZ?=
 =?us-ascii?Q?we1jHVNJPK6WenRlpnFTpkW/mxoLeYL8gNcg6JWDNN6eZr1PEycYp8QIgCBV?=
 =?us-ascii?Q?RjiWXfHybAR2sszZ58LyRJkQlICq5jDSB0d4ghx0FGv6J24o6O/DcxJS64Of?=
 =?us-ascii?Q?C5eSS00vfQ/Ydb0l45BZ9TUED86C+Ikm2JIdhnzuuC3Qr4laf95QDbqzWuqH?=
 =?us-ascii?Q?0kRFLVYcKLGqPsWFAM9ExzmqsaxNXvbAytZ2BvK3RdHvgfciBvrB+4csMTIz?=
 =?us-ascii?Q?sQDOIiMdUjkn1dtEnC5Z7O5d142aAKRB/RlkMxYETjhYybWAS7qAvgql/Y4e?=
 =?us-ascii?Q?FQhGrarH+Y0W9rSIm39edFyxw3IMIVAmJ276+/BQYroKqeQ0Swe1Ie87k032?=
 =?us-ascii?Q?DZvlfF55aIXBy9F5zH57lQbqtVteAYQM1eN9kz2jVVXfTsuGiv2tZY/60JCo?=
 =?us-ascii?Q?EagVYUGYoylHGbdohYaptXBcK92YyzJmWukOI7tEEIL0SHsClNhzvktkLOMy?=
 =?us-ascii?Q?bLcjUSWcf6NJUoO+Nz7g3di1JPENGEj44yIOJtSxez3StVK2pe18DCj7Zcld?=
 =?us-ascii?Q?ncLYB5SOSnXrQKAyoRZJT9Q9bI+rqWwmBAZlW0l2?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52108b48-523e-4f64-a2fa-08ddfaefa842
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5757.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 22:22:18.6133
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NGLYkxWEuDdqsEtURp8syALj/D+W0jy8uzr92XEQX0IUKCZEPeugcvMAO9ufQqtp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7353
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Sep 23, 2025 at 12:30:55PM -0600, Keith Busch wrote:
> I don't have a system in this state at the moment, so we checked
> previous logs on machines running older kernels. It's extermely
> uncommon, but this error was happening prior to this series, so I don't
> think this introduced any new problem here. I'll keeping looking, but I
> don't think we'll make much progress if I can't find a more reliable
> reproducer.

Okay, that's great. It needs to get resolved but it is not this series
at fault.

Very rare is a different perspective, I mis-thought it was happening
reproducible all the time..

It seems to me it is actually a legitimate thing for userspace to be
able to trigger this cache line debug. If you do concurrent O_DIRECT
to the very same memory it should trigger if I read it right..

So it may not even be an actual bug???

Jason

