Return-Path: <linuxppc-dev+bounces-5273-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BAD2A11917
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jan 2025 06:36:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YXvqz55Rpz30gG;
	Wed, 15 Jan 2025 16:36:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2405::620" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736919391;
	cv=pass; b=L33tV/0fw8isbFQO0eF4w4Hkrshf8cGIJDrah8l/mN7ItjFhKTsBZ99Ke/HpxSLuAF2g+MCIhYKzyp3+cU35me9BOqGvAnU61jGs0xed9Du41NzQDt/aYw1dKhr7AW6e2q2NO2rxfpWEVlHXHEWszzryTS2Jbp+l4kgn4EChnqvKnTDQf8x5Hv0/qfw3Q7ywaWsX/YNLzY+eqqqaDV155zqDOkFbaXH3ordWUZlhCWLoF+lR8fA6f3QaSvSxkWKKYxDdqpkOZqkM7TmovTc5fxI/gPGdRcq/aJg0XujghSByDmNvSEZpWhUc8oPQn7dZVs++Mo/iwdYu8oDj+ayNDg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736919391; c=relaxed/relaxed;
	bh=VFwMqah+UjKU7QuTF7xIO0fEkduIHJwzVI5tuC2FxZk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=CpsVKytoDXrF4NIIEfYN5gVZaCruvk3QVs+xaPRvGZc2bLDY3z8whL2C6Xrz3cmxbApypOm2Og3kS20gS7gepjKli5YqPFS4Ox53yvQZktNQHXbOcLS00IUQNNXepPvwqUWWmMg8dJHd/i9GMA7ZXe7uqcD5MdqlvIpmcOGwydhLCVur1Z/cB8N6tb8ie/72WYuNnldcs+ONfST6q2OXjgLzRDiddFsVJiGEzJCkKvjAVu36NDozmu2Tu8Psrd4FgBOPmP5A9+t0tiLRK8gfcWzWA3t7XzTf+N9z394lXeUyPMv+h23WX8O6MOM/V3XhEdahsAJ4m1+dbDy9ZUYO+A==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=irWr9NnT; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2405::620; helo=nam02-dm3-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=irWr9NnT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2405::620; helo=nam02-dm3-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on20620.outbound.protection.outlook.com [IPv6:2a01:111:f403:2405::620])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YXvqz0NkGz30Tf
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jan 2025 16:36:30 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XQFneUgtMgwf+zs6NrDp0eV8cawQlis1Tl+QPQEJQKyOzHgeUceJEhViklLwuf586sGiMVG4fQpex49+qkz3cytifq0Puq9oRJ6/3AR2wCCTh5ucQaN2ocZlaHbvgqptyn8bPaHMRyM/XIvfpupy2R2GLnQiejTOx5xAeWP6ErytT7gWpZeI80ZUu0hws4L3CQ50z5AVi6YUu8G+aWQkBcVVFSA+5GgUIU6ih64X0JLpL05xAqhFEESMAChee2MsDbKS8selTnM5ZCa6VkYVwL2nFrJ0EH8oYfRQJjLbpiKfTFZghbtXBskng5CFHOpoBRVMBy8J7wAMAJdfvsAGcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VFwMqah+UjKU7QuTF7xIO0fEkduIHJwzVI5tuC2FxZk=;
 b=HQw4BJry5K90FAyrkrzZiksR6gMBmRvqeDUErEIl4eadydS/ElfKbYc7SVwWcI8xb4wXgtsqTxmOs7/dZVkaUTH2bXbScbIeDNNF21FQ/gRE9Z3zIx/i/jiD1P94I5Sp+53zwvgBsr3OEDSXxamD/EdeSHVDqjWAPp6q1EwNyxKwr/AiwjbM+WA5ZRDseZoYWgVF8f8/TD88PdheN0LNPrXigqCebvPWbjyN7KsxDf46BI1ikK3pVQmTRa4z4rOFPC0LPKC8VIoENno8AXmuWhDQJbIOinxGrobpYrLL64U6zZWN9ABaMCUJtk1vBbV5gl6od/tm/z4SsQNqmnRysA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VFwMqah+UjKU7QuTF7xIO0fEkduIHJwzVI5tuC2FxZk=;
 b=irWr9NnTbrtmaQwV9DmajfKzF5HeP8itKaPGytWvrTydLkWpEaFtHOChkIPYl6GidAtBS+bEe0wNa2rmhYaKRdW3+tsq++X7w/srj2cWnxvvc2hnDa9Jw5VTA2hTT1IRe2020SiKypdtHsTK5ia7KFTJqP9yrJnYpdcnNSyFHUmQmR5efUFh95ZyHrJbDhIiGUSgUl6OTk42Q/gfzPJwIzbGaZrv/XXOP1UpjDZi9OF0PhMP63A94N2F3e8/aaFxDT1dt5oT5pMF57HCmFFSRczpCXgN+t9zY7RPc61AoyXqjy68rYK+OYTO0lqRqMb5YzCmKNpqJG2G0oBDN3zY5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 IA1PR12MB6355.namprd12.prod.outlook.com (2603:10b6:208:3e1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Wed, 15 Jan
 2025 05:36:12 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%7]) with mapi id 15.20.8335.017; Wed, 15 Jan 2025
 05:36:11 +0000
Date: Wed, 15 Jan 2025 16:36:07 +1100
From: Alistair Popple <apopple@nvidia.com>
To: Dan Williams <dan.j.williams@intel.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, 
	alison.schofield@intel.com, lina@asahilina.net, zhang.lyra@gmail.com, 
	gerald.schaefer@linux.ibm.com, vishal.l.verma@intel.com, dave.jiang@intel.com, 
	logang@deltatee.com, bhelgaas@google.com, jack@suse.cz, jgg@ziepe.ca, 
	catalin.marinas@arm.com, will@kernel.org, mpe@ellerman.id.au, npiggin@gmail.com, 
	dave.hansen@linux.intel.com, ira.weiny@intel.com, willy@infradead.org, djwong@kernel.org, 
	tytso@mit.edu, linmiaohe@huawei.com, david@redhat.com, peterx@redhat.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, nvdimm@lists.linux.dev, 
	linux-cxl@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org, 
	linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de, david@fromorbit.com, 
	chenhuacai@kernel.org, kernel@xen0n.name, loongarch@lists.linux.dev
Subject: Re: [PATCH v6 12/26] mm/memory: Enhance
 insert_page_into_pte_locked() to create writable mappings
Message-ID: <i76sf75dj6skqziydajr5dgvlwkt26f5oteajobwdx226joer2@6esrutdjyqsp>
References: <cover.11189864684e31260d1408779fac9db80122047b.1736488799.git-series.apopple@nvidia.com>
 <68974d46091eea460f404f8ced3c6de5964c9ec4.1736488799.git-series.apopple@nvidia.com>
 <6785b90f300d8_20fa29465@dwillia2-xfh.jf.intel.com.notmuch>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6785b90f300d8_20fa29465@dwillia2-xfh.jf.intel.com.notmuch>
X-ClientProxiedBy: SY5PR01CA0101.ausprd01.prod.outlook.com
 (2603:10c6:10:207::11) To DS0PR12MB7726.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|IA1PR12MB6355:EE_
X-MS-Office365-Filtering-Correlation-Id: 00ac9d4d-6b2c-433a-4c65-08dd3526852e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DiaPjh2zL/3p7yq6qU64VAaTjw4YEGfi4UV9ChRpbHwCrZhg845NNAikQJLc?=
 =?us-ascii?Q?QuFNwaRbDYwH45wMDvK604w5t7zllhq/Lb8ajp6mvh6tsoiDPIh6yMTn+zaz?=
 =?us-ascii?Q?XqcuWJJYQK34SUoKgHb166wLoIiY1tBEOvdBup2e/txb3j4SuX+1UCnx643F?=
 =?us-ascii?Q?Tx37jVhXrhD8Mwb8hcs28HBupP4UhwV1DM4snb+9dftGrV+ZAjDE3OoeaF9z?=
 =?us-ascii?Q?y6VHdj495QxWsIrnq4Vnr8t3O5ha7gPV9FtyOeDMKBEZq10aahvG1/cZWTyR?=
 =?us-ascii?Q?pX/ddQdZdihUpaqjkDtjxNFK3wH5fFYCWG8oax7Y5B9auVRjJI+S8DkUKPda?=
 =?us-ascii?Q?90NidTTIsvBqjXjS9eidtM7J6SRyTqUqkcE7QNavXpEkkmb3fNm6K83NFQnN?=
 =?us-ascii?Q?1VmbjAlIm77apSHzp2/XZWDVELad8VclLKs88q9B3e3Iv8rfCSKhxgFRO8V/?=
 =?us-ascii?Q?+o6J4uoVrlDg9eMawzyBodI4RVfSbIaatpnrp4Pseho+UPjrZ3Zwy06Ugl6L?=
 =?us-ascii?Q?gP+auy5wTf3tLD0hUDZkhV/WfyEOXFfS1nRlXZlK/8fGkDnEYppn392lCjpP?=
 =?us-ascii?Q?l9UNyo8B1ZNdZMZJG+bLamKYn0KJfr6VNsushHZDAfzc1IZJaWjtnp6aLaVB?=
 =?us-ascii?Q?Ed+QNlEXK71OvXbZMKXK67vhojDkHCXgByAK9m9QtM7aP9/Z9HxZk1m3wzIg?=
 =?us-ascii?Q?vkx7+pP69a4O9k0HjTytWGnGLFrz/KdiL/0L/4cJpzMBvdRxrv0ts2fqnuoo?=
 =?us-ascii?Q?fHKZOz36YDNjfDelS+7ZLLQSrLn7EFRSbSumS8fhsqcWadI1VnfR4Q3Pg3sF?=
 =?us-ascii?Q?rnKjARP3iIMMOokdOoHM5NnF3KVu1iIViq7O+L0+oml5UcVrYfVRO8jMwcOy?=
 =?us-ascii?Q?Mn3QOoRdi8GE3a3tak+8PsUMmUY9HFC4jDa/J0iVInzeJnbGSW4cOwfUzVnI?=
 =?us-ascii?Q?FDPOVdkk+1ygAfS2S4OujqDM9/es0Iz1sgnyGMzbi1/vTWitVJW3z+ux2A7D?=
 =?us-ascii?Q?wSVMAYMDfbW43eHqMy7Kc77dxYJZ2RO2wKKLt9dV+8SxT92nf/k8vXrv9smr?=
 =?us-ascii?Q?Sbd/7uOsk4Wgnh3wrYm+tR7oAzd5zpI+86NbFzLk8hdxEI4t8otZFG1/2iWr?=
 =?us-ascii?Q?N4E7qyjr/jP2IsAc0KqeYdh1WatK5BW4XtZ+UHJgJBASZDvI0C8eg81WzoAB?=
 =?us-ascii?Q?7SQ7kEzYdl4Nq6OYfo5/OtHCznPw3KXQiWEv/Qd9cPPEDmbID8YKaFT1EkLB?=
 =?us-ascii?Q?SMKU3kI409XBDmoO82FNPxzfEJxVokuG1pfc7ShFzFS4KIfmpBpkw3u9JBAl?=
 =?us-ascii?Q?PEqlhAVXX3Dh3ohSGgYNR0Cz+sYl8tbsRnY6bfqZeZtSAq6bieGp6juA531e?=
 =?us-ascii?Q?2NX3XOuJkCiZ218Q65azgGWyhZnS?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Fw9HbQk7fd6Kup6qXVibZqfxG6XXNeHNtMV4QM84e94neNNeEV4/t1aq46X8?=
 =?us-ascii?Q?HTRaIQda97zGnXiw7fsr0be+T63zBmbqwcYTbx+YDve340n9I3MD+lFZZYWh?=
 =?us-ascii?Q?5jO/HHHttPKBSQuye+jkbKRxw1NGgIS5XReKDm3FAPkBjOsBwlaz4wab8KzC?=
 =?us-ascii?Q?nFcmGtEcEeBNDkZqEmrJ5uUciFl6bKA7TTMTGstt/qEm9opRPKcMBOXofJ+u?=
 =?us-ascii?Q?KPwHjQiVrYiE3sA5/njdLfB58xVuHFW2sUe/o46KwJkhkZp/12mjlmZ1BbM7?=
 =?us-ascii?Q?umZ8828bvxRAeKMm+eSiqvSm+Rl/NslDbJqy7v7XOs6LSzK8yXcS8bpRJKyw?=
 =?us-ascii?Q?XeHAcAFHMEJut83G+oyOpacRRqu2okvayQaAMnWO8KJlmLvIOopo61h5FmAd?=
 =?us-ascii?Q?w/8QSV2i8/59UWUddz3+dk0FCQl9TOqU4mzdyJNgK7lUp+ksVdhgxQLP+iXm?=
 =?us-ascii?Q?wBvKn9Xzmk4E5y7zHkq0nhblna1SIvYJT+Lk/3XzyPif4QYxbWIcTopWoKxK?=
 =?us-ascii?Q?2UQZg0AQ6qN4IWsvPiLgkwg5PM+ZQR19CLaXwwxGzyHdbRhrpgcLVSE2MTA+?=
 =?us-ascii?Q?RJupwRQCVvbANI7zhhZbiClJhWhPgM+hMbR1C4XToGNlC+B4v0tzslzG9uEF?=
 =?us-ascii?Q?QfZNzJ+NHs/nzY6U7kOvDeZ9orOzoqK5zK5M9A7o2rE7mQxRL5wXGdkv18Uv?=
 =?us-ascii?Q?sR+4k+UZRGa40Q+6e3a+XkeHNz/bct1z1hWMlWnN0All9jaJZCByhNv4HNi/?=
 =?us-ascii?Q?qoK6qHmLZAFOkbqK3sqjjVh3yGy1SrDFtkLSKRKvqb9sOStGCCmc/KX4Uc2Y?=
 =?us-ascii?Q?0EGIK0DW5deaj6ua1VEpesugEu78apx8NHCC6UWjRzmaABOGvKvUEDwuDANH?=
 =?us-ascii?Q?U55DoG08InNQ0JeD0flsxuFecCR9gcBSYLdKJkc03/TOVnDDu5cv7d3s/Tu+?=
 =?us-ascii?Q?lM1sSprGBSZrZ+uCsFcNC5wYi4W574UO3dlrBoOBohX6nTckoc1iWOFphtBc?=
 =?us-ascii?Q?XImkp+47t5LHLWze5vBQfmubKdPuKnPyLiDa+lZAiZdCVIfaCeFHjJ0UfFG9?=
 =?us-ascii?Q?nEb+8ZUrdxV6wZBLzvVm7v8ctYtnhYYKbvOeNlrCz5SracdVFDTMEJjPgHwP?=
 =?us-ascii?Q?x/BQNa8K1ZYXFi9mn8lH1p3hLXCi7vItE+Ohja7/Ltx8Pgooc7eAi69akmer?=
 =?us-ascii?Q?6PDGCYan5HVCYFQl4Mj7AUdTXp2GcDKUBRCswPYdyGv7bjBhXlgQFRzCUM8c?=
 =?us-ascii?Q?sr27r68jdJ5ynS6N1OSdlYsbYKyhI+7qq4mpy7kQXUiw5WfiixpjKByY8P9e?=
 =?us-ascii?Q?qTFySXbh5q5UO/3VmzwfEdAZj2TniHrvCSe5gOjOWyIYSN15sWwUT4cCqcdT?=
 =?us-ascii?Q?5dqroovkilVfjDb299qOzX/nFru+k44Kf3R+Zau/yrGlS8xVtQhB4Odi+cxR?=
 =?us-ascii?Q?sSvGIYg+LUh1CAB1OdzKz83B/+d72AWyeGzgxKf1CVKEmn222Mb9hSjHnkMg?=
 =?us-ascii?Q?49jZnHNbnhwkhBQM+xw4rIxXSt2RzJyaqGLhAC88qLBsSflWgCZAcIgeOlA8?=
 =?us-ascii?Q?kJDafUJ0ewoCVsCwza3P7dFC5MJNb/kwSQEz/Ogn?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00ac9d4d-6b2c-433a-4c65-08dd3526852e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 05:36:11.8853
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vyxg9vP8FjBRwgGdSb53ETAnYv/TWqIdwjK50OMau6MpS05bDFZxzCJ8xmOqOBnOzMygMBT/BVtHlcYFrNGrVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6355
X-Spam-Status: No, score=-0.5 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Jan 13, 2025 at 05:08:31PM -0800, Dan Williams wrote:
> Alistair Popple wrote:
> > In preparation for using insert_page() for DAX, enhance
> > insert_page_into_pte_locked() to handle establishing writable
> > mappings.  Recall that DAX returns VM_FAULT_NOPAGE after installing a
> > PTE which bypasses the typical set_pte_range() in finish_fault.
> > 
> > Signed-off-by: Alistair Popple <apopple@nvidia.com>
> > Suggested-by: Dan Williams <dan.j.williams@intel.com>
> > 
> > ---
> > 
> > Changes for v5:
> >  - Minor comment/formatting fixes suggested by David Hildenbrand
> > 
> > Changes since v2:
> > 
> >  - New patch split out from "mm/memory: Add dax_insert_pfn"
> > ---
> >  mm/memory.c | 37 +++++++++++++++++++++++++++++--------
> >  1 file changed, 29 insertions(+), 8 deletions(-)
> > 
> > diff --git a/mm/memory.c b/mm/memory.c
> > index 06bb29e..8531acb 100644
> > --- a/mm/memory.c
> > +++ b/mm/memory.c
> > @@ -2126,19 +2126,40 @@ static int validate_page_before_insert(struct vm_area_struct *vma,
> >  }
> >  
> >  static int insert_page_into_pte_locked(struct vm_area_struct *vma, pte_t *pte,
> > -			unsigned long addr, struct page *page, pgprot_t prot)
> > +				unsigned long addr, struct page *page,
> > +				pgprot_t prot, bool mkwrite)
> >  {
> >  	struct folio *folio = page_folio(page);
> > +	pte_t entry = ptep_get(pte);
> >  	pte_t pteval;
> >  
> > -	if (!pte_none(ptep_get(pte)))
> > -		return -EBUSY;
> > +	if (!pte_none(entry)) {
> > +		if (!mkwrite)
> > +			return -EBUSY;
> > +
> > +		/* see insert_pfn(). */
> > +		if (pte_pfn(entry) != page_to_pfn(page)) {
> > +			WARN_ON_ONCE(!is_zero_pfn(pte_pfn(entry)));
> > +			return -EFAULT;
> > +		}
> > +		entry = maybe_mkwrite(entry, vma);
> > +		entry = pte_mkyoung(entry);
> > +		if (ptep_set_access_flags(vma, addr, pte, entry, 1))
> > +			update_mmu_cache(vma, addr, pte);
> > +		return 0;
> > +	}
> 
> This hunk feels like it is begging to be unified with insert_pfn() after
> pfn_t dies. Perhaps a TODO to remember to come back and unify them, or
> you can go append that work to your pfn_t removal series?

No one has complained about removing pfn_t so I do intend to clean that series
up once this has all been merged somewhere, so I will just go append this
work there.

> Other than that you can add:
> 
> Reviewed-by: Dan Williams <dan.j.williams@intel.com>

