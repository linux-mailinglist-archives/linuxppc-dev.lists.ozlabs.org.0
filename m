Return-Path: <linuxppc-dev+bounces-12651-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A55BB73BC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 03 Oct 2025 16:48:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cdWkJ5mlKz3cyd;
	Sat,  4 Oct 2025 00:48:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c112::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759502904;
	cv=pass; b=msliPdUi0iO+djUobi0XERrjVb+zmb+4JIbEIwikbxV8hlVDfON8cU5LjIgrJF1h5mmD1MyN78RNLwQno1T7fvfgNR6ajaT6ZFIj7cirJuXTL1ja52O4j+L0ivXD9/TtcVxbJ/C86wTz8qABrCiicDiJHbfp9lG+ip1YaZyRfouiY/zUtO4r/VFbIwFPlmtzN9VKf1fSie2RD2q5V8Ns0zsLwS/lAO7Z2hmPU1qSjqD1UQisSn86g/jpD1IJIVSfsfdWwswhxz/LZe8GzEyt2kQcif+NLhr13Qd4hyF5PlDo1oICq6hQxJvMG/ila2+vmJoKLZ5hyayRWMRKokKKkw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759502904; c=relaxed/relaxed;
	bh=LJ475V8TnBe1+YnOi0OM13gHXwCbc9iPBrWJTa0MFkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZyUiBVhUX8jYR0hjTp4PpY3jeNIZUp9OBMlkxqcUbNnxFJLc3rRyvB4LRnC0wnWIDqMjhFk2cnwLIpNzNwmHUOhG0hMDZbha79m91dPUA54a0Dje5xTHhrgT8oDsDVSXwUqHuy6odL7uwnN7CfYqO0hOq0mDHZaaqKgRuWvDiJXS9+F8sOjfLuV+1X6R67A/gFQVfPv3qALFNvA8OP4igqmr9mDb+DIkJasS7LBqMpskMp5QV0N/C97GpuCwubcK49JylzgDZyg1nzk32ZQUy7dhMTZK9X7PrORIkhSeWWWc8uhVLejJLnfKvqM7nd+4TG0mc9i6jSBBLFyNgNjsCg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=CVQi0FkG; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c112::7; helo=cy3pr05cu001.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=CVQi0FkG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c112::7; helo=cy3pr05cu001.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c112::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cdWkG73ZNz3cYP
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Oct 2025 00:48:21 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JJAex6hzFHaZgvbm/OE74QjeS9s/42DgvA4BnKLZaI3JlvUThHBtiBZB2x9xuh5W5TSF6BRK2RBbKbqCMJQX2o1lqBIwdW2TE1ufhWqyq+gfsUwTgBK5mM1Wse6rhAVub5PKMkhO/AfijZFbUYqEXSEDi3RKo9nOdBgEX2cMyWhBv0s2TwKjUTnjbVushiHNojBkhNDKnX4c1fjJ4eM0Gd6j1qnBGNbpmfzRS0wjYxFsDc6yDd8+OpOtTpyYIYUL0M5LGcQuqcrDWK854WOSi0pRkkloFN69O/cziU8mcywdAIk4Q519yRg48aVEkPQf+7Tiy5HAQLxRIGTTWyKSsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LJ475V8TnBe1+YnOi0OM13gHXwCbc9iPBrWJTa0MFkQ=;
 b=Jqw56dUVoJWsrmso4GKllsEj1uNpwiMGwEa15e9zSrPaArN96laluIgd4+dAjzGuQGEXUfS9gRlsvXNkpw1A6fdL+ZJ6m0HAeI7K9nVHU9kfAD9IR5+ZnFNJk2zj4ujUikM1tR5WJ0IOjtoQqGBaQ/ScFyQ8Dxlaw/DSpo+sAzfRLDWsjxV8Z0kDreXljvumBGen0wuQf9pyNnyLrVbdtRTHggVzlkrZZhieE/MPO9PzP6tz8LKilpBeNnaHKoFWm3NMjZocAqIVjtsL0USiRM+Sv4qVqkUcEHdkSuDdByJGCkftN16WzogBHYCDmKQ4MehZiXktFlRggqkDzugvKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LJ475V8TnBe1+YnOi0OM13gHXwCbc9iPBrWJTa0MFkQ=;
 b=CVQi0FkGYw8tlvGd5rYCASujlT3TXQh1NNuKC8PNe3ypxa0kZKqkkS31/uu7/btZpaYD6T6mZVlwVPFdvmfxehDwmXHpkOqVwVRjwJ56BEozsv+DIkaasYTmGFiNfhn2Se+jisZe2Nf3JFe4FQCxYy+RGqr7V8L3ZSyvQGmiMc1EiJ4slogpaIOf4AmA2B+gdBdPDWNQNGc7BvLwOYQG9L2eL8qqdhUHCqvRCapnib0ntNGBC43GKgv62x5e2B1037VEnO/lWOWyJy1b7IJGtcKdmYC9BrDSIBJx/um67LLXDip6HWjKwku9o3cJOZQvrsvLD8pfn5iHmGEf8pKB6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB5757.namprd12.prod.outlook.com (2603:10b6:510:1d0::13)
 by DS7PR12MB5984.namprd12.prod.outlook.com (2603:10b6:8:7f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Fri, 3 Oct
 2025 14:47:52 +0000
Received: from PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632]) by PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632%2]) with mapi id 15.20.9182.015; Fri, 3 Oct 2025
 14:47:52 +0000
Date: Fri, 3 Oct 2025 11:47:50 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Leon Romanovsky <leon@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Leon Romanovsky <leonro@nvidia.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Geoff Levand <geoff@infradead.org>, Helge Deller <deller@gmx.de>,
	Ingo Molnar <mingo@redhat.com>, iommu@lists.linux.dev,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Jason Wang <jasowang@redhat.com>, Juergen Gross <jgross@suse.com>,
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Matt Turner <mattst88@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	sparclinux@vger.kernel.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	virtualization@lists.linux.dev, x86@kernel.org,
	xen-devel@lists.xenproject.org, Magnus Lindholm <linmag7@gmail.com>
Subject: Re: [PATCH v1 1/9] alpha: Convert mapping routine to rely on
 physical address
Message-ID: <20251003144750.GA3360665@nvidia.com>
References: <cover.1759071169.git.leon@kernel.org>
 <512d4c498103fcfccd8c60ce1982cd961434d30b.1759071169.git.leon@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <512d4c498103fcfccd8c60ce1982cd961434d30b.1759071169.git.leon@kernel.org>
X-ClientProxiedBy: BN0PR04CA0173.namprd04.prod.outlook.com
 (2603:10b6:408:eb::28) To PH7PR12MB5757.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PH7PR12MB5757:EE_|DS7PR12MB5984:EE_
X-MS-Office365-Filtering-Correlation-Id: b1af2300-73e6-4b41-51d4-08de028bd475
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oNMmRh+gl8xprZAvMDs1y5iFJRI/RpEg8XCBTsPvcxRJxqNwT8eu7ICKYqaN?=
 =?us-ascii?Q?wqO8emmbgtdKQmtvOiRhws6RBymzHZIYtzLBrVzU14kr4dNI89N+xgTxd+UH?=
 =?us-ascii?Q?gYyZ0Z5SOpCLR10fZOgRyfJ48d0pSu7aKNqkLYwufDKeoG8COqfEqHEfAp6g?=
 =?us-ascii?Q?sptLFot0qlBrFx82pWnmlRvWI/5Y2nUo5uHExW7qR2W5YTKIejNIMrUqq/CQ?=
 =?us-ascii?Q?Puiq7ew09DAjGjSryVqNqCVKEpq/VlwerHszQC7Mm9AtbPFGqMRnyCRNnezI?=
 =?us-ascii?Q?ekju+P4T+/r0MHN1HcPb6Jxy6C4Wi663GhFCNi9Sj9yw1o1S7ZT+tHAxoar4?=
 =?us-ascii?Q?v/4BhGAS0NX0CmSxd8w+o+dXetUCChr7hSHqZohu9dmlByNCWElnTKqajnh3?=
 =?us-ascii?Q?vO3/3zHgpQpyN8uC+P8+rD+9AciYjPP4vTUOGjiojgPbhVivc5PhPfmJQbVw?=
 =?us-ascii?Q?YB4WshB2JZYvgwD8LQJAGyfBuVS0b4q3zXEF0BgpwuzmGaOyxQqF35cDQB3S?=
 =?us-ascii?Q?gwGzOQePwylOPZ7po67+4fsjzQtq0FfKPZPtYmvpeP/taSy6Keh9Av6tTf36?=
 =?us-ascii?Q?SNEY0nADY2eeVjZ/6cQOBVkmwnaHx4DEgFQ4nUKf/CUhPJ3atUrj636Wo0zm?=
 =?us-ascii?Q?fJXYgAYzqmyrXnCFNnktJ8kf3v1hzmuQIgfcojLxL1EedAdvFkjk4ulOqWUh?=
 =?us-ascii?Q?LS6qpurwT5A9W0pkgrVkwgL/RrHZw+TdY2LFicYBef8N0/6CzBct6Mj9GTxb?=
 =?us-ascii?Q?p/2ZrEnYYCaNffNE+7Dwkf91BNXRmRWHa8KDfmhtzdqUDE4PaAbvdVJ5+kPN?=
 =?us-ascii?Q?3slhe+B3HaHVYTSZG2Uh/1L1RHp52DIEb22CbIFsWf3Vd/A334EKqWIWgOna?=
 =?us-ascii?Q?pUd3EUMHfd3Hwe9KHFA90XNkSBtRV/MhI6MTnbwZyTOfxQIgESWna3Nhju+k?=
 =?us-ascii?Q?JlY+ZtyGPiLBdSdigTSMiTMI0QVdDu/8ZsysrrAFS3oHA/jRaK3Q5RZ32Yfs?=
 =?us-ascii?Q?q5t8njI6sYwZ37YYw4nBFg37BZlpoDg0EixkbXRVeS29cVTc+PQ6vN+5dCE6?=
 =?us-ascii?Q?jbfivo+CdaRoWgQh/JIAsOwVZRdgZI9lksZNlGxpQBJFu2JUNeeBdUpO2wtm?=
 =?us-ascii?Q?IsdFYq46j9F0bqTh8qs/pIlRNPdAzsglbqQ2vvB5hYrBehmauo5BKoNxSi79?=
 =?us-ascii?Q?LekL+Hl0sYZWfXQTfJZL9hs2LrCeQrFOCwb1cQ4eaUp+829gs4m6BdNItBXY?=
 =?us-ascii?Q?oiDYFNK2FGjspVLB8cPqhKLTPNcJSdMC1TaWWsdMOpK4TtjeEus/zIRQCeE+?=
 =?us-ascii?Q?GbWr+SZrhE1snglet0WH5hyjBnNAedGTLYNkZSGNMr1An6sAd5PxOrCT5vu7?=
 =?us-ascii?Q?HzWs90YuVgnSAtg6HvckKJqCsECSi+kAzyxUEl2rjTrVcjdfL1IuyYKcTUZm?=
 =?us-ascii?Q?z4y/tOp5+UlfZ2HBknwtXAKtRY/nuPg6?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5757.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1y+boVQQr9fg/uz3qlMpgeI+/KwvPkxPWSt5aaiS7BsXTr4WfvZqTd5iw3Ic?=
 =?us-ascii?Q?h3ao8N0dZVCVelCkzyp1ANLIkkOZuuKW27A8ioxBuobtfPrFYrqu/xv43t+7?=
 =?us-ascii?Q?WMI/IThM/jmMMYmP+3V530+gtoLtlgYZez58+CTxksvwRGeAArxadnKgM0P9?=
 =?us-ascii?Q?m+IiPsh6b8YFMPkmwgmEnutltlteJ0DXGtpiOTXd8YwOUqWJPuP9aZ5304uj?=
 =?us-ascii?Q?XsyTLdTu2w7VDhP1Z1Suh4B8KVad9lj0sAQ8k1tcu7bc8yUqpCwg75dRSlHi?=
 =?us-ascii?Q?7/JyfN7+bTcIWQp5X5gL6jbOXKuk+/BJ3VjjxAfAVkk6DC7ZwTZIoaz0rtZa?=
 =?us-ascii?Q?uG2trs8eiOB32+03v/57LhFdjZZtSn2E6PoFlHiuSB1RliXEiyLdGdWLLsOw?=
 =?us-ascii?Q?qbxdf8pfLYEbnACzykhR1UQvMw71v+RNmkvLIsammwy4J4RGPTD2atrNu3AZ?=
 =?us-ascii?Q?i9jTwpl69DLdVwex7rHcSXtT+2Ref1/+v+XODQscnVLNXhldoRhTsE4Crcig?=
 =?us-ascii?Q?GTXxikla+PFBLj6T/91qLlD6Ni+LEI4wR3cWL2OW2Z6nUabu4iD19LeUeqr9?=
 =?us-ascii?Q?QyCZb81be1WzegLG1W2JMz8mXWtpmWm3/2m3mH7Bl+/zyVOMU1fNUD8L+lfn?=
 =?us-ascii?Q?wPXaQiEZIUX1IKJzHAxwOcmCXhE8wGkAuw+e+umTWY73Acz1a0t/jgMbuMD0?=
 =?us-ascii?Q?1VqAZ4KHYVlNxAMMLPHRnmqywtLq3knqVj9Da3lmTAq18Dto7gRLyeKsXx5H?=
 =?us-ascii?Q?rlHpiwBDA07iixSYj+YYkJpEiGmS0o/ZPI6knVESOUrfgTvRFSkqkKXeEGEL?=
 =?us-ascii?Q?GYeKs89D80L3zdlezVbW3xdi/g2HmCuriAGvyl0aynb9mhLNY7bibXVyod2o?=
 =?us-ascii?Q?BJfQ8LyLb7IXpXnDW1GFABo64zEZdMmViZyyMYwj4zkFVt4qD8sVFUJtBL89?=
 =?us-ascii?Q?cxuJjhINPN/LCdjGaczap7mYEWx4tsCBg1HDNfue1TT5iCHpCgH5ora2LHZ3?=
 =?us-ascii?Q?qLTJ1ZOGZKp8kW9D1RFR7jXlkobZ7gaM/gB/lv/o9NUkjUunV1iCSqi+LveJ?=
 =?us-ascii?Q?aVNlNHY5NZxcNMzMiMqzKg5qUNzqZVWZFB8hNmtrcCEOicx6Ru9yKOlPIl37?=
 =?us-ascii?Q?hbbiCfCZ9m42mGfRSwnlXoZx3lgmxIb+YOAVYwEbBHNh1tMkyABFvipoi8um?=
 =?us-ascii?Q?NKqMqy7VIHlMrudVN90bXWrVV9IegnNW9HBsgfYwtof+nGy7LqY0JInowAZz?=
 =?us-ascii?Q?9C+SJaUHNN5d0AFQa6LuaplTEw5AP/xxGIGrUd4GacsA2UA9YL5SVPIzuKwY?=
 =?us-ascii?Q?kVAPUmtiCcY3Bbc/lNOuOnq254uVtDswoRd2HheXkdpcppo1HrvqEpLytVjj?=
 =?us-ascii?Q?GCMnohAiwKErfXxguZN+44yml3BKH4NwzzxQsdShu+cUSVEHPCl1OeWVADTV?=
 =?us-ascii?Q?AmoPbQl2JTTBpeLtBbJO/l+R9pnq0NGEFld6RZaIRXnIoJkn+SzcignPS6dC?=
 =?us-ascii?Q?WwPP2bEOy+q9+M8DLzQPwFqnxO/4aemlAKfZ/I9v5aYoV2fiG9sbsF1v/fX1?=
 =?us-ascii?Q?ObuRPHvllMTSsEWaQ18=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1af2300-73e6-4b41-51d4-08de028bd475
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5757.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2025 14:47:52.3304
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kDUjsMcvQLSUKdXsnZ14CcarxBcF2QIdX5Acy16R2ECakBykTEspVxaEQt/ihU4X
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5984
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sun, Sep 28, 2025 at 06:02:21PM +0300, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> Alpha doesn't need struct *page and can perform mapping based on
> physical addresses. So convert it to implement new .map_phys callback.
> 
> As part of this change, remove useless BUG_ON() as DMA mapping layer
> ensures that right direction is provided.
> 
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> ---
>  arch/alpha/kernel/pci_iommu.c | 48 +++++++++++++++--------------------
>  1 file changed, 21 insertions(+), 27 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

