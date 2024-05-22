Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id 589448CC148
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 May 2024 14:31:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=faHQ43JD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vkr9B2gdVz78sB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 May 2024 22:25:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=faHQ43JD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2414::600; helo=nam11-bn8-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:2414::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vkr8T618lz3wFk
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 May 2024 22:24:23 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F3KswqAcMfEuj/gaKkuLgRoi/D5xnF7axEnUrWVc1rriCRc+wtAOhIBeZrtUCURh4hoWKb/h4urmED7qf3UWKYSsbxrys2eTfjubBZLPtbxAGHFW1ES+5gs9vxQHcoHaLbdJOnoPZ9vyashK08kd2lPgwrhiCOBJYrnWmyVU6Y/lZP3nQK1edOLEbGhXD9yHcUQPgo6ctfXeF1sXMWF0k6f00lyfqgv5AkH7vODim78o76WlFaeEUUXm/3YlEVtKQNOnoyl4tjnrpCbeL8kuGH52VLHsaHuTbyAp11nm/KHHacxRVG01+mTJC8M4eQCn48e13bSC92qMOTkhLID2pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SSbvVyX2UW7i3gXl4aA5qOmp/W3Ow+5HG9O3i8ovLEc=;
 b=G3T8e1F0ewudUtlu4lXUwqQOSVq6C/8fEztQxykL6bAxTSQXjiJc4/sEQ6TWyaUN16sAgWO5trUCH8j2hnElXNlbniTavotLBRHELdW88RPvXk7Je2COJfrai6OOefpRUQ7rL2txWb5AJ7vs3JUE+Pk96+Mw0P/vxSuGQqvNE0AXSZfMluh1GlElFVbYOAfyAIB9S+kdnOfxoewnp+VZjB+kjjrCP+Sxhd4F66PYcW2EscwzqZ16ZXA4UhjowWQJWYW9IhB7JiGq/01x5mE9xGPBLWZenMDiOpPoVBfVJYgPkmgQK4RCKzLa2AUa4oIT1wpnzlpwzgHZQrRey2OjXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SSbvVyX2UW7i3gXl4aA5qOmp/W3Ow+5HG9O3i8ovLEc=;
 b=faHQ43JDgoNMC5obsL4E8kwWuJB0GLRSHf8xzozBOxU6Ehne7bTz346xY/Z42L3P6q3SiMDQJsv7abTDi4qfOEIx4vD08RPLEwH/zUIzXu+ECRLxJ6o8yWFIGFDXqJnimQ29FRntAGobM0vsv4pnxJtOGIfSE16Jpj0iQ8+BohBsDeE92YhHAF+ISU1pngoop1d2e+4XpOMieJmIhAZ5LU0DMi92tkniDTXFLmqd/ykylLGt9827pfjJBefLfYnCkKi8Kt0+RSBOTGHnszACY+Y1WSW+ERnFzi1TtmS/UzrIwbG0n2A1kYRr30ZhWfJPx2715Gv+DbP4cIXEoNU3FA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3849.namprd12.prod.outlook.com (2603:10b6:5:1c7::26)
 by PH8PR12MB6915.namprd12.prod.outlook.com (2603:10b6:510:1bc::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19; Wed, 22 May
 2024 12:23:58 +0000
Received: from DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::c296:774b:a5fc:965e]) by DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::c296:774b:a5fc:965e%4]) with mapi id 15.20.7587.035; Wed, 22 May 2024
 12:23:57 +0000
Date: Wed, 22 May 2024 09:23:55 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC PATCH v2 18/20] powerpc/64s: Use contiguous PMD/PUD instead
 of HUGEPD
Message-ID: <20240522122355.GR20229@nvidia.com>
References: <cover.1715971869.git.christophe.leroy@csgroup.eu>
 <ac9f4f2d6e571e4579a8125b81eaa88fbddd6187.1715971869.git.christophe.leroy@csgroup.eu>
 <D1EHK0STZ19E.3CTOAWG7LVBPK@gmail.com>
 <99575c2c-7840-4fa4-b84e-aaddc7fef4cb@csgroup.eu>
 <D1FRWM5DHHOT.3EAJGCLO0YTND@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D1FRWM5DHHOT.3EAJGCLO0YTND@gmail.com>
X-ClientProxiedBy: MN2PR14CA0003.namprd14.prod.outlook.com
 (2603:10b6:208:23e::8) To DM6PR12MB3849.namprd12.prod.outlook.com
 (2603:10b6:5:1c7::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3849:EE_|PH8PR12MB6915:EE_
X-MS-Office365-Filtering-Correlation-Id: d1f563b5-f645-4f9d-249c-08dc7a5a0db6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?bZ093FEt6J6BY7oqp9/Ahu17KaLLBLqFh6fTxvXWtRzo1gTQM2K1E/t486gU?=
 =?us-ascii?Q?3+nPJiJGrUfOulInR9AlA0S6GfKKZcYK1KjuyjWbNn/fbA1OL3JVspVl67Zo?=
 =?us-ascii?Q?Gh6S6HZaMVKmbAJgFc5HEj14pU6FhGrFAqpgheCoWvRdV2gCoaJXKRA2qARX?=
 =?us-ascii?Q?kocIWpruXPfXUcqnCwnjtQCnMogJ4/dXfuLxG89SngD2PT080JCNNNVr5evQ?=
 =?us-ascii?Q?M1taIFX2euXDoFhOhwb4Gqyc4Vd9kYSUXsYXKEhD6z9IgcaAEif7UqrlbCGV?=
 =?us-ascii?Q?CPT8pCC50ojEMM7Wam482ACRx6VJ2yi/3CGGO8mhuGRUU60fD+9dLLLLUkAt?=
 =?us-ascii?Q?+bgmHKi2lXSYMzv7u4vcyzklFhOUps4ewWK4gWuC6DlU1j0xMtEZvCqDE8wT?=
 =?us-ascii?Q?20FMkV9arfD9cESIXYI2xEYIAHUadS/RZwJPuCVaIz/lyVD5yroPIX8YFZUu?=
 =?us-ascii?Q?RaWUgUWmkvulBlWrRGbys+OqCrU4wn6Cb4BRzhcNR5YxJ500fSEJJSInnXxy?=
 =?us-ascii?Q?tty55XU/u2FkAx+Nae93UQRbApVf/agZjJF+JYVWkGkb44WfhsRmU13eB8+C?=
 =?us-ascii?Q?Ot2RKlaaLT5URSVJ33LY33HHXS6r7GntOmSi7MDRaTu9/mFTFuKJP5xtYAnX?=
 =?us-ascii?Q?cGzDy6p59tb3djxz7tF/J0O3VIHQLRtwX/H2cOY/KLzrqrWiBYCO8v8URmw1?=
 =?us-ascii?Q?015P810OBwnKA2YNlnBD+wP7r6U4XQzGiUdYqLzbQkMC163w04xLqAamyIUX?=
 =?us-ascii?Q?Q7bxyhgoNKs0cNQlbbf8cC/o+ireDlASSdKlaOYoY/WE1t9IIsG/g68fiPBK?=
 =?us-ascii?Q?VCOvR22OJOkwq2s6ng3Z+8JxRUgQPpZbW59Ev7maf9Hlm0Ygy55ieIo+6vPZ?=
 =?us-ascii?Q?KxX32bcvvmWbo3cSH3/J/CwiD4jBJWPgGe4QQfI2oVey7DgHbeBnP/JG4gOP?=
 =?us-ascii?Q?m06YI8Gw7PGiFRQ9xftfu5AkDgOMg4WUS1ESuBukWqIHatFO2VkmRTRvGCXg?=
 =?us-ascii?Q?sZULJVYiLhKXe48qBfkA3QkXY0d7xMklR4rE1c7WRogdutUYcuQGSOU032Y5?=
 =?us-ascii?Q?/hrq9x7BHw4jAolKXXSTr7n6WsDQOnHaE9/6Zs8kvUMFwla+1fys4HQBr9pt?=
 =?us-ascii?Q?/26khscVFrsH+I58MyKEIvnEFLT68xZ5ZfTBz3ExPvb7nxawu/MAtS0NoGfk?=
 =?us-ascii?Q?OghnRtBbdyquuvDyQQUAkJxLsqARVwgP9TrsQiGLNfmEOXFDYKq8tcuXl6dj?=
 =?us-ascii?Q?Zj1DPm359yFEKqbHxNUn7W6l3HLECzqRXqCMp8Fisw=3D=3D?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB3849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?XBkxbeT3bK2bJRxyCyUyxkaqTeSvIG7NTuciD/T2em/Ovpp50pzInKGany4P?=
 =?us-ascii?Q?HUxhliH958NjjTU2I4uPjfrHBrJN9zsYUkAjKwRx1qhY93X67rBlV+ZQEaqA?=
 =?us-ascii?Q?C8+TL70/bDcJ5FDCDCix3KKh/jp0FYGaU4RUnwbDZtkzWHKSzYZjdAkUk2bY?=
 =?us-ascii?Q?Mm9dO5eTKsY7tBqs3DxNUpzTDYDbzCYU8boWPnd8CSCbHip+YLJSiRMh56Kn?=
 =?us-ascii?Q?aAjg8/A/s3Jr96Qs1q2ur3RsT475nHkWp4YKJ0WaFjJKM47VjTKO2FTC56aA?=
 =?us-ascii?Q?271vdZN7z/CzwhZTu0N1HiBU9UQxvwQ16Y3SYwFh9qXY7cnb+LMv4lLHT9qC?=
 =?us-ascii?Q?1e0e/ygZKp0MzMzSYLxSgbPRMjIDlll6S/0UTWTb1MECch0iNBGjpyqxnS0m?=
 =?us-ascii?Q?4szXaJItJrijx40tiWXoifI1HRKuOZKvHqDkqe98K9NtJhwqmb6SSD18wl/7?=
 =?us-ascii?Q?BGRdrJigOYG/W7eQ6cU90OzAAV8DX17tRxdpI7B3GhlLqfW8S7XaR4zLHJwx?=
 =?us-ascii?Q?G2qcjd3LIaZbNU3ripEyIw+tUtZwzhqSeouaku8OtzDirrdYPw5M71YvR41D?=
 =?us-ascii?Q?dxYkB626ntLU/kFqPXukbUS1LzjrsC9MgergJYOJSlx36MePxQRaFyEYXbgV?=
 =?us-ascii?Q?s5uLAL3ugsFGJuz05rsP8jJOP1GHfag/rzYiHRqAi1HYMmoC6Cbdrm2MizUd?=
 =?us-ascii?Q?pki6yLpb7aqtCmK+aSllcTN1RmBm/bGBdfmigMUGPCvV8x/Vt051JCvOqNz2?=
 =?us-ascii?Q?LrgIVPTsdcl6Rva1J4kSRSX7pVwyUl4kgdpzg/toFjJ9TUr2e4NSuG5f81FU?=
 =?us-ascii?Q?H6B+youwZzviVdsk5tCNL91wRExcZMK9pCOs40OsVzXqMi6/JcPRx/VsyYHB?=
 =?us-ascii?Q?agFcql53B0W/ymF1LiKVa/EBV+djEZQKWalJTHT+O86Oiiz0bKh+LOdt1Gnc?=
 =?us-ascii?Q?g0C2979ExVFmX5b1vTbwTy2yrMgRYNF5x41kZHL+FPDTq9TQZhJMlX5iCMvE?=
 =?us-ascii?Q?uuSuoDbK+A+EQqkS/5eWwswaVpnSHOU/aUXXjhGYpJAiILq92QqS977n0TCt?=
 =?us-ascii?Q?Qr+Ugya1eHSl+RhE8zZAEmha04b84d2DtAPc3nMqjyFt5cR/JvWFovN2KO4y?=
 =?us-ascii?Q?gCfaYw2aJ0bTFQmA50jKwkr1UhQAqdpurrsTOHIWZCAOAF0XvJt29Y+DQMYf?=
 =?us-ascii?Q?XHghMTkG/yHJZF66QazhvF8Bp7gJ5k/dgpRbWfdmO/2iV3TtPEqiHyo/JtTu?=
 =?us-ascii?Q?O2bSSVEzwudsOySVP8zHowv3+sZOn40RUzonFcxxMd8+MB3Ld8pfTJkVMoey?=
 =?us-ascii?Q?mXvZXsMDIN5ifoVN5un+RPF+0dS3p1Hwzrs07hSas5UTZZKE3zuxC4oQnXq0?=
 =?us-ascii?Q?7A9UhGzu5cWX3DxXbhCCecxJnaKrHkIS4csRYz99/qW3IPqFU/7sULQeKYW0?=
 =?us-ascii?Q?SErF67bTlbScq69Z+5Sxsioc7ZZujj9iP2XeTS/zOQIulzGozBZwR9X9NSFJ?=
 =?us-ascii?Q?+pieR7Vpnl1QSMzBPXhEuRF+93KfLe7mUofONSe4wDHbCHxXJQ1nNZ3q9o9X?=
 =?us-ascii?Q?DrkMwznC0fax6rPRKTE=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1f563b5-f645-4f9d-249c-08dc7a5a0db6
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2024 12:23:57.6917
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /UBVWUYyeYK8C6y5JcCkPWDqj+KX2FV/UJ5OnjxkaWxOK0rPrTYbNhtqsqvCb4nN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6915
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Peter Xu <peterx@redhat.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 22, 2024 at 11:13:53AM +1000, Nicholas Piggin wrote:

> From the mm/ side of things, hugetlb page tables are always walked via
> the huge vma which knows the page size and could align address... I
> guess except for fast gup? Which should be read-only. So okay you do
> need to replicate huge ptes for fast gup at least. Any others?

We are trying to get away from this. We want all content in the page
table to be walkable via the normal pud/pmd/pte/etc functions and the
special huge VMA limited to only weird hugetlbfs internals. It should
not leak into the arch.

> There's going to need to be a little more to it. __hash_page_huge sets
> PTE accessed and dirty for example, so if we allow any PTE readers to
> check the non-0th pte we would have to do something about that.

Ryan added a special function to get the access and dirty flags from a
CONTIG PTE, the arch can do the right thing here. The case where there
was a CONTIG PTE that spanned two PMD entries might be some trouble
though.

> How do you deal with dirty/accessed bits for other subarchs?

ARM and RISCV verions will combine the access flags from every sub
pte. Their HW is allowed to set dirty/access bits on any PTE in a
contiguos set.

Jason
