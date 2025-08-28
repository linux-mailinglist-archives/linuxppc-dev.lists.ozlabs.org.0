Return-Path: <linuxppc-dev+bounces-11431-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1A7B3A405
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Aug 2025 17:18:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cCQ5m1cdKz2yg0;
	Fri, 29 Aug 2025 01:18:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2417::626" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756394316;
	cv=pass; b=aVeyJAexfnG0wzt3kSGISyoptMfHzbnYbumlZiS9z5daoeWWtwYvsa2GPXBfh92ONkQrCkyDGR5Gl+7mInR/AtNW445DeGMca/jilKqvItA4RKZEGjxJTZOJV6s+mJ3RDRZYeHwxvJGn0TAOUsSPDpSwVsorBv9GUMPwYVN9gFjkMd2Pdm5iLvfcR/ZWmJYL5MMVQ+KbvoJ99Cfi1eKSpPTcNKPeSlSZWTEIiD3nsE93k7L88tiBpSz8V6bWKB/1RfJD+9K0bhK1woJsHEgxZdjIgnleVL91u3Yr2+cf8iKcFUyDQmH5wCiML40qS+Y7SoDiZUU7FIvlGAh+w9DutQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756394316; c=relaxed/relaxed;
	bh=ShzJl56LtBJiyc6AvhGBzUtrjJqdBYzQ4xRpuGpa/mA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=M3BRYqHUfva64cqgZHKYC6mAU96R2ffbnuZTn09QOwuCInPA3pIyrJLimowzkF+A8F6iE9PO3+EE/k12647CSJqPtgwr754dqvGvYbCLzRLYf/XgXhdcXfR+xoQumbUt8iEfiCQl3i8XEIueZTkl6ko5D+TIQv1nVTXhTE+2sSOk9oAtOKQAvpupljK6ofYR19JmQ+4QEyw8NT9rdtYUbdJFFCB5qDYvtoG/DlGsnfbT4YrH4yDYFEcMvJr1r51EtpdTNzcboKNxNEeO+/tGV8QRwR/cKoGycmU86nMCYc4jT1CVbHgIEBd7D3tIpS5fMViN139usitNR3crtOl+AQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=KsbQQi04; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2417::626; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=KsbQQi04;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2417::626; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20626.outbound.protection.outlook.com [IPv6:2a01:111:f403:2417::626])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cCQ5l4bYXz2yTK
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Aug 2025 01:18:35 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FkSjHrXPQJ5QevAHuZHJ/1ZwysYAMlC7WLt2JCr7Ib0Dydjs7sKLrTxQSSaq9nl+JVVSxyHw0Kfpfu/Z4GIRbSJCKw3HQMGLAItWwxkac7jZhJ3Nl3dGY0Yir2Oc/Pp09/aLRfP4lc+mpPwSeMadoqiTX3csI9w5yHYRwmvFEp6CnmJurYj1hK2HH7XM4NwqCT9iGJfNmr1p3RPibLOhjbmZeJJmv0q6RYwXGKrZkxbIFS3nw+VChZJ6yEp5vffLQbvxcrNfAv4jRN5WhS32p6E/KS7CGL/Lb97c+Mccf9SrP+3+3W8rSj3q10nK2ztu0H2pf/pO5QE9DqexMha15A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ShzJl56LtBJiyc6AvhGBzUtrjJqdBYzQ4xRpuGpa/mA=;
 b=OHiOqUdHm0E05MtpTY4RH3OHpFQ5fKxczpNO/mQKtc3e+nGtntYnzGc164HvBvuMoAuYQGr6pa4n1fmav+/ZZ9nWSVTWg7qtZdITSOP4bWOtxk3CAcIQ8bCx13rcVCsyfMzsbx0g7ea+wa2uT2I8TM2zHa/K36+CM5zUYVZS7u57MAIXobqtceaR8Srk3Wr9EWFy9HZI90DNDBZ+JJ/G73Q5qwNts0s9rr7R6Qnf9J+3Jbg4QPIpHYDDw/3fhdJanulZo/2E2I8I2OrLpt126W+b26WnCHm3kcip0J1VuJdh4JIFxLtP7Qwe1y5i5wqVoNJp17Kfijn0H4c9LlJd4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ShzJl56LtBJiyc6AvhGBzUtrjJqdBYzQ4xRpuGpa/mA=;
 b=KsbQQi04w5SQpVCOeNANBYpgQiyJY62prH1NVBUsc3pYx5vRLata6nrv/vv2k3tUQ3jolIs+3wyqpZyd109pNKsOm/RoBjXIPUnjkjruSXm51GRvNIqLfrTreD71AwGnYRVoCkdvUchnnqwFiBHo+r6jcXRLV2IHAIR7r5cTKRKzlsLD8SCHF2ws873zlwnW5E7qXKXY3zDF/eoLUDDN8ckhJXGzqG5sYHPIr0GXcq1UQOK48ePgeERnTjl59WGDe/TdDNgWaaFrkDFHTi7HksLDKlxb2eb2gQFhxRvFEw0YuxZktFZyeZIpKTiJBQUEFLHpBIPrVLTOuXZvfHwPgA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by CH3PR12MB9342.namprd12.prod.outlook.com (2603:10b6:610:1cb::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.13; Thu, 28 Aug
 2025 15:18:08 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.9073.010; Thu, 28 Aug 2025
 15:18:07 +0000
Date: Thu, 28 Aug 2025 12:18:06 -0300
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
Subject: Re: [PATCH v4 10/16] xen: swiotlb: Open code map_resource callback
Message-ID: <20250828151806.GI9469@nvidia.com>
References: <cover.1755624249.git.leon@kernel.org>
 <babeeb62fcfbafa39f352da1040a5dfa9d2a2719.1755624249.git.leon@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <babeeb62fcfbafa39f352da1040a5dfa9d2a2719.1755624249.git.leon@kernel.org>
X-ClientProxiedBy: YT4PR01CA0049.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:111::14) To CH3PR12MB8659.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|CH3PR12MB9342:EE_
X-MS-Office365-Filtering-Correlation-Id: c9a8fe0e-ab8a-4b0e-9c1c-08dde64617ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oqSoLix/bZqS47pHIAGHVakZEvG5PSc8iYv/rmXgsfkYORsMBVjbq18sAgdd?=
 =?us-ascii?Q?JpJDdM8tXa0kdShcYqB6KAwmvHTd4TLJKGG9vtlxgEO1gTJES3Xope2wf0+Z?=
 =?us-ascii?Q?PurpTn8Tim2ec0HMoXDAc102Gz1jtY/GxQJplLKGRIK5/+fJ2Xs3f0zlNONR?=
 =?us-ascii?Q?TgLDEJb8NPzYuAbfx+RH9/zLE4goolhrIRCy0dS/lp+0hdeoc9tqjswL1SBi?=
 =?us-ascii?Q?4y0mtVWW1XyTOchcXnnp166l23c63mi6lAfJdTYe4038WfjF+wSslahP9C+n?=
 =?us-ascii?Q?l7H4E0Hwyr8/BkA47Tdf6r9BR6g7L4wCmJGjg8kU2fW2zd1vZ8u59bZvYRg1?=
 =?us-ascii?Q?b0nci2jQ4l7SgbZISC4v7IaQG+L/FM48n2mTlMJ1Lqv//SNV3EOwWpcGVvIl?=
 =?us-ascii?Q?9dOrHg6H0jqvwdiuoGZtBKqGlfgW+d3puwbsSKM1FN1gufdZoWMODRLpzZBg?=
 =?us-ascii?Q?8gk30CXhiEcPevSP62jWIcbBB73Pb8MipOf90GU+al4rHVY2110H1bkpHAmO?=
 =?us-ascii?Q?tV2WHUrcGblYKtPx6XqVy13zUlx9h4oFp5yCou+IIkzHBbNG49La+0V4o8Z4?=
 =?us-ascii?Q?JovufQO8cfEC/Mm2Nl+qSv//iVYD0UUaBAIZP3toe5MIHuDCZO3NlVmhrF4U?=
 =?us-ascii?Q?qr7vpAnE+SqHmn+2uygfOLj23NMar/5tgQFmJM+2PuULLcKpiu3/72y2JzP6?=
 =?us-ascii?Q?wzG8IaDPhSttMjbCg5ERwNV4hD7FD6nDv940DhboyiTG4Ebn/VPraIJiByzj?=
 =?us-ascii?Q?Fzpq9eN1HHRjJN0C9UH+J3ZZFHGe6POmqmFxHM4yhpni818t3EnbXfpIH1Lv?=
 =?us-ascii?Q?u+6DerHqDv6jwhJmbS1ppHca8CFNpY9SUlnh4biMi9MdR+U/7+a6UAQP+fy5?=
 =?us-ascii?Q?oLkD3TV+3SE+TUI+7FewYdStGaIMoSZt9VmzG+85mTMd3beXQochnuiSnFpD?=
 =?us-ascii?Q?Vmo+stGI/evpj/N/zUidySQ9BF/rJ51OsyEjlxjm/2kLdCFfgtOx/L1aIU8G?=
 =?us-ascii?Q?psXNMQq6GGRtFbwB/iniuxeOOdh7YrNJJ4TnQzd7HgneLiNYK8BEG/1cxSSI?=
 =?us-ascii?Q?rn+GY9vx2shgiIrTMQR3kveX65m1rFdDc68dIWEuXKAv/t4LvsBv+Moj0sxL?=
 =?us-ascii?Q?zaXzbz6QiETi/sLmzDdbMGJrQIrUv9CAJCDQCYSWQrbywJ+vM4ha4mL2RK+V?=
 =?us-ascii?Q?s+s0zDyzB/ZsdtDN9ZotHVPK1OLNBoSUBfc36/qc2VEj3gVwTpKeEIJ4hEL4?=
 =?us-ascii?Q?y0hxqabJCAktbd+Ijp5Ep9uAD284Qw3QRc3cU4pbyzo3cZMrpqs4m2aKaE2J?=
 =?us-ascii?Q?F6iXkFZyIz96/Hb8GvidWBUzgeOslT9ItcOu+fYmCCfn1x4tR1Ke0JrQuSdf?=
 =?us-ascii?Q?49Qav6F45JGc19e7b3PJyyArLIqH3b/CpnICeVdUyDis9UgfrENHRcpMufqe?=
 =?us-ascii?Q?2KLbDfqMUXI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LwdE8kNQDkMKKJ5rXqpqVvkwqMB9l8K6/oWhNiANt6Z4Y/ZnePMfu5HEFkyy?=
 =?us-ascii?Q?jr0zoaTniBJgxtRnfrumXkBdLmv0ru7UodNZcWt/DsTkdWUu7rAs80J6BqMp?=
 =?us-ascii?Q?ZywTLUTGmDBZcc4DewUK0cI1XvolLo3ttcm62/7P53kAgoHnyWx5sTIC/zxK?=
 =?us-ascii?Q?59UMpMQa6t4SfM6gkDIcHfYyXWtVetuYZGNufECsCocFaRCYnhXNYXets9t5?=
 =?us-ascii?Q?f2QSuV1zoSPS4FjfR9frHj5v/uFOg62C/QTnnk9/lDP53nlPUBNWI4GlqoKV?=
 =?us-ascii?Q?ULi1kWY4kczaRMaQb8WL59uqp4eKbAYVEuX0qG5W3NvgVSapHXBctoUaweS0?=
 =?us-ascii?Q?fEEscsNkUj3m6y5zyzJRUj5Zd7MTM2ZU5BXJ5s1VehJx/879JXa9ZpGVTLPl?=
 =?us-ascii?Q?PbJ+1zwxyje7KkOavPstP+NHmbykhHHCu+8NKq2MqXxjfqA/g8KDa4c+xzS8?=
 =?us-ascii?Q?rUrlw7xa/KCbyrd0EULbUiq4ZoyE99ja+zyfmXRgR8aivNjyV4TQvr/r6FWv?=
 =?us-ascii?Q?gMLMFyyT0Kbvcw2HYc5uzKdmXmd8/V9NAJt68riy5pVEFXbHFTzKFHVMTGrM?=
 =?us-ascii?Q?4FSfkJvP6AZClojotovAHVkOTxQ6snacKtW04e6OAVUiZghnrzLhRH2uD0XD?=
 =?us-ascii?Q?fkwvh/6SHZ2liUnfaEAgVYCmF0akKHWE7z6t/cqgVeE25ZBpyoh+VYtsrVkE?=
 =?us-ascii?Q?B1jexYP1TfS0wWvroBwMOU9DysMREcTgJrsaI/M+9wXtV192ss1eyFvTyUPF?=
 =?us-ascii?Q?CzvS8ZmGi+W1pk0HiYa1GQf2K6Zwk8lBZQwuhnYQ0BJ4aC0jZ0piHGHbJCXb?=
 =?us-ascii?Q?2uz9v+PZ7LWh0TnXJ6pp3aHS4u221oipY7ZBQpRD88E7m+hoO/Pq5TZp5/wf?=
 =?us-ascii?Q?PXRKbUtKTKij/2LQTlKt5Y6jFQs+oX7lGX9zh6PX4nD6PX/Uso9uvc6xfkLU?=
 =?us-ascii?Q?hH4skOlX0nlTlRdaMFmAHFbGVOwouiR2Zb/fgBdPf2UC7t6t7MyfSrn4jtbM?=
 =?us-ascii?Q?SkQgkI6xJdj14vpV2mvZV2PG6H2hmA4P2efJdbDDUZu0ihpxbiFsMs7Jrg/b?=
 =?us-ascii?Q?i5m5kZpgtu0v51alc0DPrdiae7NqRYJ2TX5U/MNkkcurCXarEm2GO9ppw4CX?=
 =?us-ascii?Q?nU0n4A7Pe8dTlZdfyiNyM/DcRz5zWwevHv4Of71DTuy0lBvjgJlYs4Bn8602?=
 =?us-ascii?Q?rgSYtsV55kMA7oikMFgn/IKtaOvvm673iFH0LKD1jWXtaRHU0o/LJjgosaXN?=
 =?us-ascii?Q?Fjpkk2QJwpavQgK52/mzYeKO5Fs5GFIxuEAPVe7xbV7DUM8nSGwhb1KyH8ey?=
 =?us-ascii?Q?nMcop9oYFaDdb7bGQ6yAcbmvyNAfnkDI6Zz6dPZGjm1oUkIowdZZxBFIipK1?=
 =?us-ascii?Q?6/T1GJrlZg7nfwJ2AJRsVkV/ASnPv4XVMMdYSg1x/uR6MPlWHiHnFWiVOfPd?=
 =?us-ascii?Q?xOFz3rHVyyL8ahYblMs+6Tyg3a7m8ftAa2CIxmxwFhsCa8F+e0qQFI4S3ovv?=
 =?us-ascii?Q?ZZXC8Wy6N04pOM6MFqtIQ4rPl1tUAj2YLUxVA8rGFk3n29eQcDnW0rsr4HWJ?=
 =?us-ascii?Q?8nmuh6lwpWFzoV5Zk/I=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9a8fe0e-ab8a-4b0e-9c1c-08dde64617ae
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 15:18:07.8386
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QlZhJ6HzsDCusgLC65y89JvqHplC/ffmSYiANNkGEgk5HivPxH1g+zuer3/GiDLW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9342
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Aug 19, 2025 at 08:36:54PM +0300, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> General dma_direct_map_resource() is going to be removed
> in next patch, so simply open-code it in xen driver.
> 
> Reviewed-by: Juergen Gross <jgross@suse.com>
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> ---
>  drivers/xen/swiotlb-xen.c | 21 ++++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

