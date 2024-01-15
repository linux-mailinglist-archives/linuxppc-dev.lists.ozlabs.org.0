Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5910782DE8E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jan 2024 18:38:52 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=SNf+iQrQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TDKBK2bC1z3cTQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jan 2024 04:38:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=SNf+iQrQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e88::62b; helo=nam10-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2062b.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e88::62b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TDK9R1rXVz3bXw
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jan 2024 04:38:00 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h5MMHCk7xO/UIIn5O27hNF/DQmdUYPdbnme72mtgCWT4HrOYFFmSvOAky5LsBhG+4ogC+g/kICk2zuwvMmywY9lS1v4NdhxjfMZ/KME5zSLgEsFL1wbcq0x0cS1M9G00h8dkovb+8Cqsz+Ln9MQcBm+sWkvogyqFfhJl7jvknRuW58TkwWYmIGEGlgpsZzuS8wrwII+yFLeZyEjjKNRfQtqgS6gxy3QnJcRgnCSSAUhIF1lXmVgZZOfpYXWS3dcenubwMmyqxBqOxj5l7PRy4h1wO+WA9KtmmHIwbqDiffu0idjydFCXJXiWbJKtEK1naXjCwC7WFHZIMya0WxLz8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vD2ieV+QhIAdP4Nxoh7wp6iOLdhI7YZTqHvxT13czYo=;
 b=Cj/75vZGRQLUHamStBND8J2+Ncr5eM+KScAxhN/zZIIh3lBG5I4dzKDZdkQ+EfHXM4aqa3Vgrmc/Wy5KmdFchQtcPZD0hv55V1Cr6U//2CvMaG5YzTlRwYWLMFL3w9c4oU8P8nbJSOCXSgRTiGx8DzwjmdIkc6e1bXQr51JyQupigv+g3XsIP+Gr0jrD07VvDf9mstRWz3uIJpuiavU41p3zhW784rbwRFEYhh432AhXJm50UAa5uP110pSb4NhaGWj2KntnKVMzBknMDwLdNBWIHap6FBGCs2LqAHXPnmcVNRjbvc20/UO7ykkqo176luZvjeSnrwv+I/97dXfJfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vD2ieV+QhIAdP4Nxoh7wp6iOLdhI7YZTqHvxT13czYo=;
 b=SNf+iQrQ3JzJVk//UZiufNM2+xWgstykTUwPJMbVO5GXAMSfszRJY9yblY5gjPHKW4E6pCPkSqDiS8yraHiRdgiOvODCZyWcPy80+iwViQpFv1zB/quFnlZUTHDwRLFVdDe3Pw612IGy4FKCEmnkF+Q8A45VK+b8XLxvp5xF+HARAPIh96uraMV4NwvBNHd/0ynWS8M2RUvH3PL/MoK+krx/d6WBr0U3CcKZUVhjsBxocDXCvqJGN9WXwSh3diCcw3jGhfAeLBUUeDEl5vMoBA+AutSLDmg0MeQfbDv3CwTPN5YJEFZhZOfzmuc1fyAghZBinC6ACRbswOV9bcKMOA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by SN7PR12MB6838.namprd12.prod.outlook.com (2603:10b6:806:266::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.18; Mon, 15 Jan
 2024 17:37:38 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::96dd:1160:6472:9873]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::96dd:1160:6472:9873%6]) with mapi id 15.20.7181.020; Mon, 15 Jan 2024
 17:37:38 +0000
Date: Mon, 15 Jan 2024 13:37:37 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: peterx@redhat.com
Subject: Re: [PATCH v2 01/13] mm/Kconfig: CONFIG_PGTABLE_HAS_HUGE_LEAVES
Message-ID: <20240115173737.GO734935@nvidia.com>
References: <20240103091423.400294-1-peterx@redhat.com>
 <20240103091423.400294-2-peterx@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240103091423.400294-2-peterx@redhat.com>
X-ClientProxiedBy: MN2PR22CA0006.namprd22.prod.outlook.com
 (2603:10b6:208:238::11) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SN7PR12MB6838:EE_
X-MS-Office365-Filtering-Correlation-Id: 506a0b26-9973-4664-00ea-08dc15f0aad1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	E0Mp8Ifl8s3RGKOfXk6HncoWfW5pM7ZLwQV4Ep+jIRomnvmb8PgzaKP39fheVDLRF6xKNRG54Kiwr3eqWSjptnikut4DBYFq0WB77KYjTUjFnK/hVAIgYMvUHYrTQZPVJeJMkJJqVaOQ2VBwBma5DcFbLaqsawgnBdfewVrc4fkYUa91D6l3A93yxWeLGdKPxadpiXvX3Av+eRsnne/ZSyYfY+bavOBl9v4EpbtNwBI0rtFVjvkfJbwG8OnkJfpIgOuQamUbZc2NOkiXjHIo6S0LKDKXoJE64PWaM0xSObwpYWCjeZ4Xh727S+qse4oCTU/XrXTk+6VgrtCMWFshaj7kdyppE/WCWijmNw4GA/pdGag+sEWHDO868yaESKR3Rc+6iTEQH6xNdChMEGii6mzx2AsVnVronsR8jQZZYMeNrbCtPd67SWUOprBJeAUxHxgUbS/ZbopDN/D89lnTqw+l37lFMWQ5VBJ30fj3VvS3PAp0Xqfxs9/UWZvwTVPnpEHVEALVI2Y7cxxlO+wqJ/633k+IymlD+kDgUq6p+alzk/JGXvPmqkVaBBerTX99j7zfdULxi+8z6i4Tj/pUO76y3J64KxFHa56N4YVkcwBeXPF/ZkRbCHi2ie/lbCkJlzy46s3axp06mpTp0EebpA==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(136003)(39860400002)(376002)(366004)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(36756003)(6512007)(26005)(8936002)(1076003)(2616005)(54906003)(6506007)(4326008)(4744005)(5660300002)(7416002)(66556008)(8676002)(66476007)(6486002)(2906002)(6916009)(478600001)(316002)(41300700001)(66946007)(33656002)(38100700002)(86362001)(27376004)(14583001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?tPDUEEhNZVRzHujRjD3wiyAdvax6IZnEbGYy+LcDkc0ANGdFRiWX2iS+NQUW?=
 =?us-ascii?Q?6TLIIdo/Dh8h6ZjMVfjzdg/I+55MmDrmJdZTntbVikAAx+Sqyq3o/Aqs19XC?=
 =?us-ascii?Q?VGYgdUGjxxE+oS6uW74QUG6NWs5Vr5NTC04/Apkvq8jj7IXLXYCsccQyDWr0?=
 =?us-ascii?Q?bH+uh0OZHYxt5Mml++qbU9+ihoJAuqkHD2ZUFRldLTfJc+T33ZfgOeEbfbQ0?=
 =?us-ascii?Q?T4qW5potE2Vfqa/g9hhc5u4wwZLCWll0lBE/x1AdwNTYzrNNGzI4ic1T2OUn?=
 =?us-ascii?Q?s/69eW7InGiF4XMFiP/rhBS9u83yr0jdrIWiI/+UcdgX9zdMsKTNVXOVl24v?=
 =?us-ascii?Q?fILrhiYCinvdiIW0H+nPuHfHydMF8pifgcERTs4rsXK/lhKKKhYZPlly1dsW?=
 =?us-ascii?Q?5syZrPELUPXPt+7TRnuvzfXFGdXijUNIUXlc+cwBC1BNXW6kIpAUc0vngN3o?=
 =?us-ascii?Q?7KSjRQ0RYLv6osOgdjknEt5hwlfWtha4S4oAE+FZwTiU2SN8WyL0zOW2y5Wx?=
 =?us-ascii?Q?k6Q52OYGkT9hlOd56OEAX5fmdd0psqliEzOWgjx9R4bVENnze6EPP9F2Vsa9?=
 =?us-ascii?Q?qRRmbSOmYA/ve/cOq5rcN3+aB1UlKM5YMs7euxEeGw29zFet/mEt1P7U+U2w?=
 =?us-ascii?Q?h2ZVak0Rq9v2UojzZiN0KH1aP4E0P0uSMKxZqpwUrcfN+4JqoI36162QCeMy?=
 =?us-ascii?Q?k/tuqJEn2F+ptQ8/ebWK2iz54z+7tzepJ/r13c2PMEWn0ltrFNNKnaJyOeAy?=
 =?us-ascii?Q?uFLGprx1t5E1DDcxGr92qSS1LX9t7JMo5ebKPGl3P+SfRLSZFGUdPiaM3SwI?=
 =?us-ascii?Q?Wvs4TNzL2ouK5shWuX0YHuN8dIS1n2kgfQZivEDPGoRiej6cwrgYR7t1Phq5?=
 =?us-ascii?Q?j0L+P2JW/aYos7XRE+fwScdGkOqienW0kOu2BEkNOfSVCSVH9wG6UFu5/UUo?=
 =?us-ascii?Q?28hNi09wu2DgpdnOUPjfyxKFeMDneu08wIg+n6eUK67aQ+z5IJEJgL1theep?=
 =?us-ascii?Q?T9bwJRIw+39aQjnSFVtKYJx5jhT6vth4CDBjFcyT8d5uxe1p1FVGbp9GoGLa?=
 =?us-ascii?Q?4pYPDeJvMRS0Bt9PJnt59gn1vfHVP/6k1rhrfsJCbmfVAsjxOLBMjRXBOLaX?=
 =?us-ascii?Q?WSvJOtnxiSDia3nr1XzZrZxCUOQFw2T/qapOgeTQlRcA9uzv3dPjofkqxUMd?=
 =?us-ascii?Q?emudmB8uqDHJEjHK2rvVP4Bi56laHDCv2XjDcaWEVTAFxfAFEyFFtyAdze6Z?=
 =?us-ascii?Q?NpML+NDk1PKbl1T4MfWhyFWyn3tyImk7wJETmFw240A17spkIBFhuwBITjIV?=
 =?us-ascii?Q?vCrN9Od5f4RJLMvtP4jxy0Or0asqWxJIAUetA6mXhBUa8a3SdbseMfGXqqYA?=
 =?us-ascii?Q?xFrPtaNeGi+zbNTD6SgCuZlw2lsmUhuoZ6R8eTv6GaXqMjLC8KPFWUt4xY9u?=
 =?us-ascii?Q?3VyqPm/bWHYoGOqWJc347FVOhedOd/MQwh1ES5STeBxkcKWKEA7LjH0GlZdv?=
 =?us-ascii?Q?YKGOE/K3hYkC8DV8UoiJd9tXhNwHKEFNN9e7AZNvRuErqt54oq3FmX7yv8R2?=
 =?us-ascii?Q?u8fAb+w9EriXaFpTTS+wsmBpo7jgqfnnmsk19rPa?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 506a0b26-9973-4664-00ea-08dc15f0aad1
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2024 17:37:38.3346
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a8FptbCfmjA7Pa1W61v9F7jgM35U+hPrqyPaOLhDoCF4h4IKRCL8RI2ReCsPN5MV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6838
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
Cc: James Houghton <jthoughton@google.com>, David Hildenbrand <david@redhat.com>, Yang Shi <shy828301@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, linux-mm@kvack.org, Matthew Wilcox <willy@infradead.org>, linux-riscv@lists.infradead.org, Andrea Arcangeli <aarcange@redhat.com>, Christoph Hellwig <hch@infradead.org>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Vlastimil Babka <vbabka@suse.cz>, Axel Rasmussen <axelrasmussen@google.com>, Rik van Riel <riel@surriel.com>, John Hubbard <jhubbard@nvidia.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, linux-arm-kernel@lists.infradead.org, Lorenzo Stoakes <lstoakes@gmail.com>, Muchun Song <muchun.song@linux.dev>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 03, 2024 at 05:14:11PM +0800, peterx@redhat.com wrote:
> From: Peter Xu <peterx@redhat.com>
> 
> Introduce a config option that will be selected as long as huge leaves are
> involved in pgtable (thp or hugetlbfs).  It would be useful to mark any
> code with this new config that can process either hugetlb or thp pages in
> any level that is higher than pte level.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  mm/Kconfig | 3 +++
>  1 file changed, 3 insertions(+)

So you mean anything that supports page table entires > PAGE_SIZE ?

Makes sense to me, though maybe add a comment in the kconfig?

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
