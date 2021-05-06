Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B2B3757C4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 17:43:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FbdBt50ZLz3dGW
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 May 2021 01:43:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=YVhe6nO+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=40.107.223.45;
 helo=nam11-dm6-obe.outbound.protection.outlook.com;
 envelope-from=ziy@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=YVhe6nO+; 
 dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2045.outbound.protection.outlook.com [40.107.223.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FbdBM6s0hz2yxl
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 May 2021 01:42:34 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dx/dmGGM15ZW+bF21IjhUl3gkZ6vYezzb2zm0usd58O95C3BBfSG05drKwp/rhAZ5QjDiXx94rAn/NqkhV359KXz2w1knJEw4dEg1QEkjxahyL6UUwH1lcKLq2A2vVwAkWCwJg7EoNS6CsACmroNDyGZBD/c/5yTtsKjTP4Rv1xgHP2kNDd/rVGzz0cfYtj6OdO2rPAgUAQ/Wgzh+4BwSGR7cKtPpIfej/zMqEw9Vl9LJ5AQ6XqFZ0q3kDijlsL9srLhi5SF78AP0e+KkH8OeHnbhCuQqo6K+SDANkb5+bqvSlqJ3M/0rEBZXy+esompSWxHRb7xwnQt2w9BnmGmqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j6myb+20wi3Gpq15L10UZ3yQVqwVNDsaA0bYAukQdEw=;
 b=cYBulYlwtD21GWQwoqnFwA7p8dlLotl33616o3BRnn1WcOImgvjeFqca4VW5QbiywgToaBvLFWG6edkGib6uI7vKh4x0qnH30toNt3VcJX6mV7ff/JVUl5WFmbUSS31X/kGjJazF0Pqs2Ij0X0uUdWOblVTK0zdfsGaMMTPxouBPnEpB2P4vFfmBoEG+iSrY3TrD86AaQCcSFk05aWbVeVSNgNG6lWccD+BJt7LhNR+ZaOZdM2IYaF+Ld+6w6kV9adK8aeKRExOOiU10prjj8jEQBYo8RsnXP+7Yg1pEKNLE9tiW4FP1IXcACG6l84/U7Ht97ZUxgsLWGCX//JqdVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j6myb+20wi3Gpq15L10UZ3yQVqwVNDsaA0bYAukQdEw=;
 b=YVhe6nO+oJkXsDGspjuOw+z2hrjxVijV+Jve/zrqrqkaxo9rUITYckC8vL47OS3SaZ5DrXQTcLLtNfjO6+5CuoyUouy5PJG2W32JetBhziEU9dEgaVvyZe2/76cv2xCJcUMycFncyxc21BaANZm720SBW1qsAjHWLKaf6VkwNuCWW8A93at0ziy3tETxD/n0jXRU/TzShi7JQH8u+sJmJSklsXrS2q7HIJ6ts0Q+e1dFAS9jVO528i9sxDXsx4yegEe2ox2uO9hx/zi1SN8UQkRCaLhKv+2SfDzdeTnOoNJCchp8qpOWM/+IP8J2m7BWa2g01bg4doEXP8Fvo++7Cw==
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3823.namprd12.prod.outlook.com (2603:10b6:208:168::26)
 by BL0PR12MB2337.namprd12.prod.outlook.com (2603:10b6:207:45::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.27; Thu, 6 May
 2021 15:42:28 +0000
Received: from MN2PR12MB3823.namprd12.prod.outlook.com
 ([fe80::ccd7:fb49:6f2d:acf2]) by MN2PR12MB3823.namprd12.prod.outlook.com
 ([fe80::ccd7:fb49:6f2d:acf2%7]) with mapi id 15.20.4108.026; Thu, 6 May 2021
 15:42:28 +0000
From: "Zi Yan" <ziy@nvidia.com>
To: David Hildenbrand <david@redhat.com>, Oscar Salvador <osalvador@suse.de>
Subject: Re: [RFC PATCH 0/7] Memory hotplug/hotremove at subsection size
Date: Thu, 06 May 2021 11:42:21 -0400
X-Mailer: MailMate (1.14r5757)
Message-ID: <25C004DA-44C1-4331-B290-F4473A3AF05D@nvidia.com>
In-Reply-To: <20210506152623.178731-1-zi.yan@sent.com>
References: <20210506152623.178731-1-zi.yan@sent.com>
Content-Type: multipart/signed;
 boundary="=_MailMate_09B22BBF-03CA-4BD7-90B5-4F00D05F266E_=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
X-Originating-IP: [216.228.112.22]
X-ClientProxiedBy: BL1PR13CA0337.namprd13.prod.outlook.com
 (2603:10b6:208:2c6::12) To MN2PR12MB3823.namprd12.prod.outlook.com
 (2603:10b6:208:168::26)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.2.63.7] (216.228.112.22) by
 BL1PR13CA0337.namprd13.prod.outlook.com (2603:10b6:208:2c6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.11 via Frontend
 Transport; Thu, 6 May 2021 15:42:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 85f120c6-c40c-4af6-0a70-08d910a58d94
X-MS-TrafficTypeDiagnostic: BL0PR12MB2337:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB23372E380E9C93BE8C460F77C2589@BL0PR12MB2337.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fpx2UOznQ2K0XHXGnfHrWqDjldwuzQivCDlGBRQ0dJjs3w9d0g9lKzYmapwwg5ykZ7knuQNpFHu5pzpvTaPC3LcyV6/rQYIezjBWdDwC00tizNSXQqZyCAubvIy/oS8+ZYUNc19Sv8I62NgrbHhjkgdgLrmH9w6rKGO2fMBfusCjJisfFFXXp0yGkYYypXS+Fsv3pDlvTuRUXgquRWsP7VfVNli6LElw9wna1AUQXnk0Iqp5PvlejPRjQj2Q9w4NVkO9xG+0EQkPxLbduJrJYgkouXg1VkHcS6F3m2HjMiuv0orbOgjavcoQ85XAGJH3k+m5JzePL9y0fwei6B7x0YL/oomSkWC3ZMeIIP67k456U2obN3fw5b2h+TV0Y1Gz+b2/p6t9pjL/8/UdDgHQFE0cq2q4j6czY380T1h8GRmP9UiEugrVeueCFIZMqDhNB0ErGPEz7wniy2Jo1L33yS23rvO4ZdkEl8sO3+8vzgJorezRw3ufCWDMtFCUmEpdQCuA3fmt8HkAe9HCY50rEWvMU5dBka/++/wXJvSWm3gS18UcuSi8t5Y4GMWpLr31dbXjCdjejMKkdQBk0ngLBo2FgHhRdtRs7+yb6yigz6rqOYUxZolz/Jsnhjnkl8TPzqjm0FBYOd6r+PyWpWeEXp9Q360W1Tpuw8NyDR95S/0aZYcsWaNxV1UFVPbHZwYvvnASMdvGv3h3WM5ZLZXsrlG0HWVgOqx5OI99To+YR53cl7yQikGKPxMRwNYWkuU5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3823.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(346002)(39860400002)(136003)(376002)(83380400001)(33656002)(316002)(53546011)(6666004)(36756003)(2616005)(235185007)(5660300002)(6486002)(66556008)(66946007)(66476007)(16576012)(7416002)(110136005)(478600001)(2906002)(966005)(4326008)(26005)(956004)(186003)(107886003)(8936002)(16526019)(38100700002)(8676002)(33964004)(54906003)(86362001)(45980500001)(72826003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?YWdhSzJuVk1ldDBrRjJld04weUQrV2JkUHR2R3dacEVrTkZDcjN3OEdqR1VI?=
 =?utf-8?B?bmN6TlIyeHV2NFh5cnRrQUtWMCtzYVNTWVRrMmx2R2NOaEZXcFhWWDMzTk9K?=
 =?utf-8?B?LzFGRkZWWlRxd0VveHpGemlENHNVUHM4T0ZxKzhuSGNQL0RTcGw1ZFZOKzdB?=
 =?utf-8?B?bE5zUlRCSVF5TFVvRWlJUGJTbmZMd21UQit2STRkVWQ0cDZDOU02YTBGTFVl?=
 =?utf-8?B?em8vZCsydUdZQ0V4c2U0N0k1RWIwdUhkUSs3UFRMWnV0dTFHbXpYRDZkK3J0?=
 =?utf-8?B?Ujg0WmJQTTIvUjlXSm5RcUtXVWRGQnJmUFV3UDhBSjNLc0pVWGFLcDhOdy9z?=
 =?utf-8?B?blVEMDZURlFaeG9EY2tBZ29xSFM3VWNkOXdoZWVZWUxIS1FRWmJpc0k5TXcx?=
 =?utf-8?B?dzVXa2l3SERkdXhtNkVCTU1MRWxzRjNBWnQrY0ZvMThyaEpoVWYweUVyS2hH?=
 =?utf-8?B?SXBvTzNMNWdqQWY4dnFhbnV4YjllQ3ppZjVvd250MnJDbWFkRlljKzE2UDZs?=
 =?utf-8?B?L2Iwc2dKUWRJYkVZeVBBRGVqNmRMN29MVVBMbmRWWkN5eWxTNjdZK1lGbFFz?=
 =?utf-8?B?MnJFY1NNWXdZalZ1TVUwSytZTk5Ra0k5ZnNta2huQWlnS0VGckNTeGMwS3M2?=
 =?utf-8?B?Uk9waTNiR0wrWHBMOUU3VVRBd01KY2xCbjZFMnlkUWswR1Z4ekdGTXorRmdu?=
 =?utf-8?B?b3diYkkxTGVPdVlxd01QMUxrT2owaFZucmZQSmVZM1lCNXFaeEZIdjBXeWwr?=
 =?utf-8?B?d3UrWEZVZnVRWUdrZWlHMEpEVmc5MkpZOXlFcTB3cUI1ZEZwY2dycGh1dUtk?=
 =?utf-8?B?Q2x3ZG1kWEd5NmlxQzgvTVYyUHYvTEVnUE4vdU5ER0ZpcHBXYXNsSTdJSG1u?=
 =?utf-8?B?dkl4SzkraTFBUk5TVVcyUkhkQVllZ1hDYjRONWNSVjVQYXdnclFWWURIWjdQ?=
 =?utf-8?B?c2M0Mks5Sk9TamV4Z2dYNmRFd2VrWGd4cm10VVNmSElLSGRYWmpEWDRnM1JL?=
 =?utf-8?B?WEpvWno0R1FVUDNFaWFKNTZVZkFmQkt2Tm5MUU1lVVlVNW1xZlowbERZdlBC?=
 =?utf-8?B?YXFkU1Y0Si9FenhZNThobi9qY0JHYnB6WVhNUklQVTVNMmV1WGVpVWtLTDRj?=
 =?utf-8?B?bDRGMzNCOVJwN1JZZTFObW0zVWsyNXdTMmhIb0hHam1mcTVoN2FzeTMwOEs0?=
 =?utf-8?B?NFZHMFBzcmE4UStBeEdWdm96RjF4NWhSWHVYdFB2c2pzdWo2S1ZJTVZVSjRB?=
 =?utf-8?B?ejUxY3o3U2M0M1FlM3gxVkcrYlpzeEhZL0RNQjd0MytMTldKOUtKVlEwbFdj?=
 =?utf-8?B?U2FtWHcrdEQzWmZkTk54dmdHTEtpcDNYZ210S3pVM1RRR0hpYzRHRE1xOVlV?=
 =?utf-8?B?cWdWWHIzMFkxa0JLbHp0cng4VFN1UHQrNVBlZmU3WlFnK3lHa05SNGZBakt2?=
 =?utf-8?B?MGVYcmcyYTMvSllSV2lrY2ZrZHlTbnVMc2pwakFNenY5VGFMZnBjVzMwTXZG?=
 =?utf-8?B?UDdVN29lcmpGQVRYWEd3N0g1NktQVHNHcm44aktNZ2NMdTIwcWQ3aFJlQW5K?=
 =?utf-8?B?Ym5DdG5zTWI0T3RRSXk2MlBUZ2pzRWFKQ3JBMFpScnhqWEpMOHJMYmZYZS9w?=
 =?utf-8?B?Y2U1STFaR3cxSkJFWlNBc2Q1MjlERUhwcDN3dHpYTUlMVkdnS3hMUzVvSXNI?=
 =?utf-8?B?YUhRT1RuUmxmRjVBdm9SdHplaDFOVUhsUWNvRm1pS0FTT1dSdHJJVk5scy9r?=
 =?utf-8?Q?PuBOwIBSVBgLhBguerT2ItLkl9RMV1Z0GpLuvWo?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85f120c6-c40c-4af6-0a70-08d910a58d94
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3823.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2021 15:42:28.2912 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BKFOmxzHDBFWVTLpxSLzZdNnAanTpYjNYuU7Kolj09fTueYFdBBSooXNExhwpssd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2337
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
Cc: Michal Hocko <mhocko@suse.com>, linux-ia64@vger.kernel.org,
 Wei Yang <richard.weiyang@linux.alibaba.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, x86@kernel.org,
 Dan Williams <dan.j.williams@intel.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Zi Yan <ziy@nvidia.com>,
 linuxppc-dev@lists.ozlabs.org, Andrew Morton <akpm@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--=_MailMate_09B22BBF-03CA-4BD7-90B5-4F00D05F266E_=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 6 May 2021, at 11:26, Zi Yan wrote:

> From: Zi Yan <ziy@nvidia.com>
>
> Hi all,
>
> This patchset tries to remove the restriction on memory hotplug/hotremo=
ve
> granularity, which is always greater or equal to memory section size[1]=
=2E
> With the patchset, kernel is able to online/offline memory at a size in=
dependent
> of memory section size, as small as 2MB (the subsection size).
>
> The motivation is to increase MAX_ORDER of the buddy allocator and page=
block
> size without increasing memory hotplug/hotremove granularity at the sam=
e time,
> so that the kernel can allocator 1GB pages using buddy allocator and ut=
ilizes
> existing pageblock based anti-fragmentation, paving the road for 1GB TH=
P
> support[2].
>
> The patchset utilizes the existing subsection support[3] and changes th=
e
> section size alignment checks to subsection size alignment checks. Ther=
e are
> also changes to pageblock code to support partial pageblocks, when page=
block
> size is increased along with MAX_ORDER. Increasing pageblock size can e=
nable
> kernel to utilize existing anti-fragmentation mechanism for gigantic pa=
ge
> allocations.
>
> The last patch increases SECTION_SIZE_BITS to demonstrate the use of me=
mory
> hotplug/hotremove subsection, but is not intended to be merged as is. I=
t is
> there in case one wants to try this out and will be removed during the =
final
> submission.
>
> Feel free to give suggestions and comments. I am looking forward to you=
r
> feedback.
>
> Thanks.

Added the missing references.

[1] https://lore.kernel.org/linux-mm/4b3006cf-3391-6839-904e-b415613198cb=
@redhat.com/
[2] https://lore.kernel.org/linux-mm/20200928175428.4110504-1-zi.yan@sent=
=2Ecom/
[3] https://patchwork.kernel.org/project/linux-nvdimm/cover/156092349300.=
979959.17603710711957735135.stgit@dwillia2-desk3.amr.corp.intel.com/

>
> Zi Yan (7):
>   mm: sparse: set/clear subsection bitmap when pages are
>     onlined/offlined.
>   mm: set pageblock_order to the max of HUGETLB_PAGE_ORDER and
>     MAX_ORDER-1
>   mm: memory_hotplug: decouple memory_block size with section size.
>   mm: pageblock: allow set/unset migratetype for partial pageblock
>   mm: memory_hotplug, sparse: enable memory hotplug/hotremove
>     subsections
>   arch: x86: no MAX_ORDER exceeds SECTION_SIZE check for 32bit vdso.
>   [not for merge] mm: increase SECTION_SIZE_BITS to 31
>
>  arch/ia64/Kconfig                |   1 -
>  arch/powerpc/Kconfig             |   1 -
>  arch/x86/Kconfig                 |  15 +++
>  arch/x86/entry/vdso/Makefile     |   1 +
>  arch/x86/include/asm/sparsemem.h |   2 +-
>  drivers/base/memory.c            | 176 +++++++++++++++----------------=

>  drivers/base/node.c              |   2 +-
>  include/linux/memory.h           |   8 +-
>  include/linux/mmzone.h           |   2 +
>  include/linux/page-isolation.h   |   8 +-
>  include/linux/pageblock-flags.h  |   9 --
>  mm/Kconfig                       |   7 --
>  mm/memory_hotplug.c              |  22 ++--
>  mm/page_alloc.c                  |  40 ++++---
>  mm/page_isolation.c              |  30 +++---
>  mm/sparse.c                      |  55 ++++++++--
>  16 files changed, 219 insertions(+), 160 deletions(-)
>
> -- =

> 2.30.2


=E2=80=94
Best Regards,
Yan Zi

--=_MailMate_09B22BBF-03CA-4BD7-90B5-4F00D05F266E_=
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename=signature.asc
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQJDBAEBCgAtFiEEh7yFAW3gwjwQ4C9anbJR82th+ooFAmCUDl0PHHppeUBudmlk
aWEuY29tAAoJEJ2yUfNrYfqKwfIP/j4mtx3y0ccLIUsgx7lvwtos8eCqs2V7JGeD
jAcbXTqiE2jHoRA2+tIXQ/181PPSnYoWtMHIX8heOBzdIANslGpI96cgMfKFuDpZ
r0+c7/0LfndyxXEi/avRGsGvdmKwa3gG/cxq69dOxUuG23z4NIYwaSjKMYBS55GV
ML98nqEGwnQQC0mDc3pcic6LMCHQjeQcff3r/wNMUZL4Mm8MEAbxnHdcPJIdQtLU
eSNXQCJg0QCrQd0LEokCieDPvmsa9WxPjPjAu5TB85mr0reT9MHb1uac2TLpQTRo
F36hRpneJnu+4WACSUHPhw2l4rFiwHi00Y83lc8TIOCqK3qAt5h04mNdkTczeMBg
F9oGPrBLQA6GFtaQoWQ12t79gwTloJEJyVhtsYbrYix9XdQy9SltbrpDHaU5TvYz
mg4jPZe9CZwYngFHd61GS7chKrK7hVrIevPNTS+khgnCiDDdxs5WJl2pILfbXNDI
CZHoX6Vvsr6aZeqFYNTv004Q20D+4yH51hEOVZ3Z5KjLY3iHnghk0GvrZkb2wiAr
mqd1tkWYW3ZVxz8jfF9fpHWDvl8WgPLdXKl2wJtiStfp5qCUr724oQyrsMHx3BiP
2bPdalSxc+cd+fS4zj0gAWbH+l1M5NhPYM2OphiJcjAmX2Y4v81n59jf6ksvsFf+
23wXbePJ
=JdYV
-----END PGP SIGNATURE-----

--=_MailMate_09B22BBF-03CA-4BD7-90B5-4F00D05F266E_=--
