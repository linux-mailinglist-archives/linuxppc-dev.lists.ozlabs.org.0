Return-Path: <linuxppc-dev+bounces-4947-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D52A0875E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jan 2025 07:03:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YTrfd5wk4z3cBW;
	Fri, 10 Jan 2025 17:02:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2414::612" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736488969;
	cv=pass; b=mRKQlWYm19TOrxK+nEvZ1tGj7vFoW/K/KfBK0jEfq0SSER/FFqFnoDyB43wAPLfq/B2cBKWwos9DhviCYjebq8Y3YsMQOKI0ysv2qz4aMKozaHBl5uKe1kagTkCH8SQVI4p0Td/i37yEL2eyzz4Q9HzypbrF8KgaIEPS2GbZEAszPrEV5cDuzK+ZViTBE/KS8FhfT9hUNqfTsaouptEW8uW2qZuWEjiKRXSh3TC60k2O3Ied8Ga7LTWbJqe+Q7E8SF/2tmmUuw+wR5yiTshZQ704cbKgTZrhXe7kf/NNm/Y7ONXe927XgYgVvrY0dDfJvYLw/peqp9zKVNaMgsBNsQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736488969; c=relaxed/relaxed;
	bh=+9o8oGrOgJpv8PsI2SVSe8sCr9mOhej1hlJlpTOMAz0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=F3AEWJuHM7m1uTv62gumBo8ZTIGIw4mcGkcRrwrO1fiwLNbEqObrdLufg+jJCV1diMlmxU6nG5bYm98mgD41Clzvmr+BhMequeNGPyRzOabHRIGABeoHC0Tui/K9dm5OHvNsDRSuBSE8PHuw6y6R9vN7bCJBF14JQdEqSJsP85lulsmAHBs8lbohhxDmJxQMOt6GWmL5MlU8t9p0m60vpH6PW2YRx2Wz82Jj+NWg0+1sF7EO1EVBgLRYHI//ldl1FAATDcdIgVNu4OcOvZ8C0KmZeYNYKL4OcWgxjgmPVZ/bikdchAO8VPNSZbMb38wedLzCD7YAN+gzsCh6eXD6mA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=TmzZLIWI; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2414::612; helo=nam11-bn8-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=TmzZLIWI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2414::612; helo=nam11-bn8-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on20612.outbound.protection.outlook.com [IPv6:2a01:111:f403:2414::612])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YTrfd1Rp2z3cBK
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2025 17:02:49 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LEf35A+hvPeAnARCIysiRHXxTjQxDKeEZ8SKiWAxm0YFVimdY5wVOPjXyOyZ9mpsnO0trJoGlR6yQUX5tHUsxp7h+AcZeWWB5tmpk/+g0cC4CNOQrPyr4pQcair/isoEm5ibRUlSvkL/EkqE7dDlDjugXS4czvP3kkO3w4odkY0//7feoaWdSGNWtk1LEQfR3FnnarP6QroHeCnd6+NopK7rsv1h0rCzRhiZMuquPucomCKKpCS9ocaTdGr1cazYt0RtFoNp5pXqrZAUUrBxiFC81stZyMfjnlrBfB98+CNBnCNyAE6ntqOFVejQSuT2diRW3IX2YOtjUbTNT2KNZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+9o8oGrOgJpv8PsI2SVSe8sCr9mOhej1hlJlpTOMAz0=;
 b=RUK+WUymSuw1qzqgLDvXv0vDd3IyNl7z8+0DqsF/fiY7S51EFAjbKyjnyPSgd/anV2OPlOVrQXhNsmFA8i8UR/DukOc8S3yZXlbvKl9X5KQrASBUumUfeKo2lTxDggsB6GaXIBwGdF3iFeDAxiE2HLU45glVL4+B13M5rNMB6QQnN30ZNb5m2GYkSuCGT5ehqH6uDZAQfbV2FDzg/yDOAkiraPztp/Ny4v5/0K8r5Cow/edp8BZIAMJapYpf+tdfgfOFT4L4fAX1iSw3ekoUEWe24mysy504GXteQ1zRoXThTRSEh5OXIECWvTvBlKP9Sup+/4E8ok8xlrbBwH5YWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+9o8oGrOgJpv8PsI2SVSe8sCr9mOhej1hlJlpTOMAz0=;
 b=TmzZLIWIWVl0POQdoVssezp21nJt8kUg5+K3mWVKl8KC0m+gK51E0hpy0WBTB/R6Slqktm5c5dCPW/qMDf0VCUqewB06ilKQgmV7fTnzSJCHPNwJTtztQGQBVA9qCs8qf1Xk8vxA3d0cVYjTIZv9JABloOVPgv1kvl50cBlrEOBt/7MeQ7xSNQqoBefeZdIeqj5iNvQgt31qidpHszX8muSAGhQQ0uGwq23dGECq9ledkgqI4h3NjdHpsdRvdUl/ARAjP0opGwMIEQzmcN/UuZ1dE+rGHpY6mNz0qpcoQUk7Xym/pHEkRxY+Wl4P4Sl/sjvPLi5YchL2Ydeq9s379w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 BY5PR12MB4132.namprd12.prod.outlook.com (2603:10b6:a03:209::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Fri, 10 Jan
 2025 06:02:44 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%7]) with mapi id 15.20.8335.011; Fri, 10 Jan 2025
 06:02:44 +0000
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
	loongarch@lists.linux.dev
Subject: [PATCH v6 16/26] huge_memory: Add vmf_insert_folio_pmd()
Date: Fri, 10 Jan 2025 17:00:44 +1100
Message-ID: <02216c30a733ecc84951f9aeb1130cef7497125d.1736488799.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.11189864684e31260d1408779fac9db80122047b.1736488799.git-series.apopple@nvidia.com>
References: <cover.11189864684e31260d1408779fac9db80122047b.1736488799.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY6PR01CA0072.ausprd01.prod.outlook.com
 (2603:10c6:10:ea::23) To DS0PR12MB7726.namprd12.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 43d7f782-c91f-4c6a-0915-08dd313c6694
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HvXjjACobzp1B8YY5uBCUaDv6FBxY+mtSrmGv1NK2nPRaOPfDnkUxOTnf09T?=
 =?us-ascii?Q?Tpkm2NWN/q5dL7+9fifeA2nARcUekVYoRi8zRhmv8AuSTMfT+xUmzca/TuLu?=
 =?us-ascii?Q?eMmACIeLzgVJTT7jtylampjuCBPUrR78j4DhilJqCWCRNpeq0v6FLmkq2nJj?=
 =?us-ascii?Q?VrVpXxhnGvFyf4TNJZ4cwYb8c4FUxRYorkb7xEnGvJVr6dXa1LFaHaxaD1gp?=
 =?us-ascii?Q?/4f1lCob96FG7WpShw9Vma23wCXg5zccT5a7Dd8uis3lW5y+IdO4AUiAY0a0?=
 =?us-ascii?Q?HOEc40iP742Qb4FH9ENJ4DuhPv3tmxLWz28GKdHn64VYIveZlSPmpB0pVL1j?=
 =?us-ascii?Q?NSdwCtEeqIzZqB3pdQxQuJclLwkDTY0amjfHM2KokBz/5FYPbjsiaOEvIX8y?=
 =?us-ascii?Q?QPLGjr3aC3xIPbxjxG/BxVry/ruxIqW6kQnuOQi2AF5uC8DScqVUdfZHLPyE?=
 =?us-ascii?Q?yYB1jXCkgk8RprVV68CmS6cydw+PZfFoTgS/Fml5n8CPJvtjT+235nBsRB7h?=
 =?us-ascii?Q?pafPfzNwpfp0CqWlhtGH7xYbRlHuJbmxS4wOWqul9EPeDZcI5zJQbgLgCWzP?=
 =?us-ascii?Q?JyoO7DaQ9Afy2HWMhXAkM8MbUf3E1bpE/kGuf/YFXu6JYFOIIbxDSY0M2f47?=
 =?us-ascii?Q?dBPhRSKlRnnxs4VpSOp7r6A3Z0WyxzP2fal2D79JolfappJljCoT8eVszbWh?=
 =?us-ascii?Q?be+OkN2B4MAwk0PFfV10j2FsVUelHF9b+Joh4DFSxalfVJ2GZs0UxxI2e4L4?=
 =?us-ascii?Q?XgShOZzk2iMBb200tnFtpQj250941HW73GOZ+I98Mg4Rn18KQf1MvNeYh4MT?=
 =?us-ascii?Q?K1lCzJ8XadZ4lfQxlu2Wyjz31Uqm/FdEyCEuic0OR4dYIXTZzILbl6/RtiUY?=
 =?us-ascii?Q?79aNtSjSiy75IjCOhL7K5mb6PK/5NDJx3DGVDldhJM8/RvJZkYHa7wF4wMRJ?=
 =?us-ascii?Q?wHhLx5kx7x1yvJbKkM/r8hQzchCYDuPBc0g5/fEOnvabLAN6OXENk7rq4Q61?=
 =?us-ascii?Q?+zIusf4Ei9xstgucYGaGEkC43MMG1d8VQBKNSS9gayDqrUn0sUrdaGgsI7b4?=
 =?us-ascii?Q?jJDVWRMOq+5Iy33jwjXM9LSTa1jQCFeC0Xo7Yw3d7r8L1TVktfwrIcKa1dJN?=
 =?us-ascii?Q?v9JRdqBS681e1zEJiLNwD6c/0vWgTvnJMk4rN4bCQ47PyDQDJmXGWJvXVuwK?=
 =?us-ascii?Q?aNJyRNLyZ50Kwt3rFNGe/FVo8Hkysiq0i1ljU1+TABm0gbS9SVKSrlaasYzP?=
 =?us-ascii?Q?4XvnBikE5h2TEXNqiyRZGhUuadUnCdzKcPlzw6HJrMLrKoKxtr8t7GH5zor0?=
 =?us-ascii?Q?HnftJf2Zxt0h841Tkgl2DGgXkwxX7Q/zeCBXATPCe6ZKlQKizUBVghFDgOjk?=
 =?us-ascii?Q?BK6PvIMBtDXtTLE2rFLjrE+x76Z/?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0Xzwlx/Vqfnirbp9RJ60P5udUjYzo/YKdwJ+G4jYBy1+ovqY7d5FdqwFpOOC?=
 =?us-ascii?Q?N5r7khDMzbrnHVDaB76Afko2c4ar6zh9q1tbuA392QsV3PUYBwIC1JjTltPj?=
 =?us-ascii?Q?2z1k6Z4KlnYphP+/4C8R/xPQGPrYZ7tV5NdqQMiNUQakt/QDc4lcPQjkvc1J?=
 =?us-ascii?Q?sWLtVmxjox4OIxG+VGyMi1QifSQbhn21MdNX4DRfaB99uGSADrLJH9lX1AkA?=
 =?us-ascii?Q?9u9Pt5C9hQ5rC83cba2D3CVWt11P7DXKLfhpqTrK4gV7JbSE+ekA/zn9VFAu?=
 =?us-ascii?Q?fn3Gds1UhpvwJh8X+6rwXbiS4hIJTFB6ADDiN5TwNJpoRv4eq2e+6khzLeC/?=
 =?us-ascii?Q?VQev7aIR4/SjCNrhHhR5Vjhqr0wMHEqhuCU22fpLMh86o10cCJQGfs7IfnJD?=
 =?us-ascii?Q?TSoYSZ0y/GGCJzzJi7pEnqMqazNLQFlDiUQpos5oNAeyaCHi0KV9wnwvJzkQ?=
 =?us-ascii?Q?HFpj84aqFe1eqRayiRsR/F+UAJ7KrRRvCbRGhjB4xeByKkooAIWB3uRKDq3Z?=
 =?us-ascii?Q?Jljur+aJv+a2II039LoWfGOVgzJVqDAiUzlmV+jEbVRDgLvjGZQkj7Br65TE?=
 =?us-ascii?Q?wNClcPDWTffrRndoJxPgs7k4L17TQdjpfOKGGHom2eQi45XcOsnJdtmfvosg?=
 =?us-ascii?Q?KZhCfQuhjxzHNKODZ5xZuBYq6w1y1kGx5gswUgjqPLOgi6wZS7CIUPZ0kOmc?=
 =?us-ascii?Q?1qEGgmxgQq04XqX9lv2ONIifpQsc6ViLA6zZhPZ1HOK/yXfMfalpYvibxIJe?=
 =?us-ascii?Q?Gp9hKquUAZ2619Ed7BB52UHteOqpzYRUZ4qjQyhsNs64m2TkmetSnWeMwosv?=
 =?us-ascii?Q?tXvbLvif8EqNz3Xpa87TGt6qwc9kXQZOZVK156y6dh2NZ9EkGDa8QksrHzQr?=
 =?us-ascii?Q?2Qju3wgCHVFlCDzEu/2Hcrx2EJ5RzsIt5P/sMuDs54Q0AZOiitm58N7GlJnq?=
 =?us-ascii?Q?eFV4yhADaXEr3o0zCppejKS7tnVoXTlPB+RT0qdYil0nQJwU5+e9nSU9Z8Nf?=
 =?us-ascii?Q?RJ3zNtRQp6viQmwDz9sbMKHPPKqsGeIb1uZtk0f1oFcw3ttkyWPJZ8FPDAzp?=
 =?us-ascii?Q?IKzXn3H7Ir15X0cFPym3jN2r606CTYgPEtteaDkAt6arGisrGbnQWdEFyFrL?=
 =?us-ascii?Q?+YpGsj+JDhAk+MHRkeVbxkQNnyvDFy/WgAXFf9e/EaLL/ba1TNBfijrrwDU4?=
 =?us-ascii?Q?uRUuuf/ctsM8bBYzTBEARKN1O+Yeqf39qMrWu8TYIs5WSt8pQJPjFjSqJA3Z?=
 =?us-ascii?Q?/MoGioWl14vBQS2gw/rwAsvnRq3P+HD7WjwZ/8dRctidIOaoTY9qScrX6zmu?=
 =?us-ascii?Q?rqMt9Fj0FR3Z4j9etOgw6Iefg1QWTMskv076+RWs9c05KA4kcT6OUFosIgtl?=
 =?us-ascii?Q?pCBgqK6mhk/HVbU9tJSQc6GopJqMKylMZw8l0rirLkuDFQcgEXkhueDjEvhd?=
 =?us-ascii?Q?CYPiKL+IdlUAUih/rlhC2335Pfg198w2FFX9YZUev6MMTFf6IHk7uyhnZqU/?=
 =?us-ascii?Q?GDl+Mt/kv1ynoF1HBp2WwOytp5vMggjwXoDZSPhvUNWzqRyqyoRM1QRWVnSL?=
 =?us-ascii?Q?sAgUMIBvoIhQzF/0IvTVQNHD9rBZfRtR+fNRzEA3?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43d7f782-c91f-4c6a-0915-08dd313c6694
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 06:02:44.8101
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LErK2sPAfpAjR3Kre2FeKFIYQtUQFXGP0p/bxy1r4D9WjNRYJ8WKyUmkEEnVz7L1M1iIuOpMViHM3BfZZoRZsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4132
X-Spam-Status: No, score=-0.5 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Currently DAX folio/page reference counts are managed differently to
normal pages. To allow these to be managed the same as normal pages
introduce vmf_insert_folio_pmd. This will map the entire PMD-sized folio
and take references as it would for a normally mapped page.

This is distinct from the current mechanism, vmf_insert_pfn_pmd, which
simply inserts a special devmap PMD entry into the page table without
holding a reference to the page for the mapping.

Signed-off-by: Alistair Popple <apopple@nvidia.com>

---

Changes for v5:
 - Minor code cleanup suggested by David
---
 include/linux/huge_mm.h |  1 +-
 mm/huge_memory.c        | 54 ++++++++++++++++++++++++++++++++++--------
 2 files changed, 45 insertions(+), 10 deletions(-)

diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
index 5bd1ff7..3633bd3 100644
--- a/include/linux/huge_mm.h
+++ b/include/linux/huge_mm.h
@@ -39,6 +39,7 @@ int change_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
 
 vm_fault_t vmf_insert_pfn_pmd(struct vm_fault *vmf, pfn_t pfn, bool write);
 vm_fault_t vmf_insert_pfn_pud(struct vm_fault *vmf, pfn_t pfn, bool write);
+vm_fault_t vmf_insert_folio_pmd(struct vm_fault *vmf, struct folio *folio, bool write);
 vm_fault_t vmf_insert_folio_pud(struct vm_fault *vmf, struct folio *folio, bool write);
 
 enum transparent_hugepage_flag {
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 256adc3..d1ea76e 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1381,14 +1381,12 @@ static void insert_pfn_pmd(struct vm_area_struct *vma, unsigned long addr,
 {
 	struct mm_struct *mm = vma->vm_mm;
 	pmd_t entry;
-	spinlock_t *ptl;
 
-	ptl = pmd_lock(mm, pmd);
 	if (!pmd_none(*pmd)) {
 		if (write) {
 			if (pmd_pfn(*pmd) != pfn_t_to_pfn(pfn)) {
 				WARN_ON_ONCE(!is_huge_zero_pmd(*pmd));
-				goto out_unlock;
+				return;
 			}
 			entry = pmd_mkyoung(*pmd);
 			entry = maybe_pmd_mkwrite(pmd_mkdirty(entry), vma);
@@ -1396,7 +1394,7 @@ static void insert_pfn_pmd(struct vm_area_struct *vma, unsigned long addr,
 				update_mmu_cache_pmd(vma, addr, pmd);
 		}
 
-		goto out_unlock;
+		return;
 	}
 
 	entry = pmd_mkhuge(pfn_t_pmd(pfn, prot));
@@ -1417,11 +1415,6 @@ static void insert_pfn_pmd(struct vm_area_struct *vma, unsigned long addr,
 
 	set_pmd_at(mm, addr, pmd, entry);
 	update_mmu_cache_pmd(vma, addr, pmd);
-
-out_unlock:
-	spin_unlock(ptl);
-	if (pgtable)
-		pte_free(mm, pgtable);
 }
 
 /**
@@ -1440,6 +1433,7 @@ vm_fault_t vmf_insert_pfn_pmd(struct vm_fault *vmf, pfn_t pfn, bool write)
 	struct vm_area_struct *vma = vmf->vma;
 	pgprot_t pgprot = vma->vm_page_prot;
 	pgtable_t pgtable = NULL;
+	spinlock_t *ptl;
 
 	/*
 	 * If we had pmd_special, we could avoid all these restrictions,
@@ -1462,12 +1456,52 @@ vm_fault_t vmf_insert_pfn_pmd(struct vm_fault *vmf, pfn_t pfn, bool write)
 	}
 
 	track_pfn_insert(vma, &pgprot, pfn);
-
+	ptl = pmd_lock(vma->vm_mm, vmf->pmd);
 	insert_pfn_pmd(vma, addr, vmf->pmd, pfn, pgprot, write, pgtable);
+	spin_unlock(ptl);
+	if (pgtable)
+		pte_free(vma->vm_mm, pgtable);
+
 	return VM_FAULT_NOPAGE;
 }
 EXPORT_SYMBOL_GPL(vmf_insert_pfn_pmd);
 
+vm_fault_t vmf_insert_folio_pmd(struct vm_fault *vmf, struct folio *folio, bool write)
+{
+	struct vm_area_struct *vma = vmf->vma;
+	unsigned long addr = vmf->address & PMD_MASK;
+	struct mm_struct *mm = vma->vm_mm;
+	spinlock_t *ptl;
+	pgtable_t pgtable = NULL;
+
+	if (addr < vma->vm_start || addr >= vma->vm_end)
+		return VM_FAULT_SIGBUS;
+
+	if (WARN_ON_ONCE(folio_order(folio) != PMD_ORDER))
+		return VM_FAULT_SIGBUS;
+
+	if (arch_needs_pgtable_deposit()) {
+		pgtable = pte_alloc_one(vma->vm_mm);
+		if (!pgtable)
+			return VM_FAULT_OOM;
+	}
+
+	ptl = pmd_lock(mm, vmf->pmd);
+	if (pmd_none(*vmf->pmd)) {
+		folio_get(folio);
+		folio_add_file_rmap_pmd(folio, &folio->page, vma);
+		add_mm_counter(mm, mm_counter_file(folio), HPAGE_PMD_NR);
+	}
+	insert_pfn_pmd(vma, addr, vmf->pmd, pfn_to_pfn_t(folio_pfn(folio)),
+		       vma->vm_page_prot, write, pgtable);
+	spin_unlock(ptl);
+	if (pgtable)
+		pte_free(mm, pgtable);
+
+	return VM_FAULT_NOPAGE;
+}
+EXPORT_SYMBOL_GPL(vmf_insert_folio_pmd);
+
 #ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
 static pud_t maybe_pud_mkwrite(pud_t pud, struct vm_area_struct *vma)
 {
-- 
git-series 0.9.1

