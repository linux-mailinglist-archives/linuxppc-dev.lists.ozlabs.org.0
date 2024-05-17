Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81FD48C8CC1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2024 21:23:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=gnawUFF3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VgxhX03X0z78GT
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 May 2024 05:23:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=gnawUFF3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2009::600; helo=nam10-bn7-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:2009::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vgxg90M2fz3vdr
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 May 2024 05:22:26 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YQdzzeLNigCtby0WP6Hn2Im6dDpwriBNzqB/ZotGc8XKqF8bu5caEBWb6atbPTEqLBBFQzdeePd80g5lp2+uaEOfW4hQnAVgSOz3t8gQ0m/XOdsH7LfnGj5FIV4fQFjbdhMlD3UiN1jdJNW+aR3IWlF62n2aGirdf3YfaAXsi9smWJianFhqu7xswALxkidCvJXnQP3pTIop42PNivCRV5wfftGW7KqlcJCw0aanJajHMsguTUd9oyyzWRGfBYWrYeoaI3T80Apl7g7bvkEGexBGqQVLXv2+DkgdLTEFiJVCDH2Bkg1g+wIjxVJnBD+O/+V5KGMmL8nF8u5nT1STZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kiG+61wRT+qlWZYFcgZliknRCXmE4rVFDX/82PIOK/4=;
 b=ZuwXXy385+QgClw4zE/lMsBq5MCSMNQXR9AfFMAvIgSE1ovZ4PfBiNm5/nP1ltpTMVXSSu+8Nl0aJrwdqUzGtErPJrf8jsCKK8BdfbpDsZiirE03yqoJ4zV45UR1IbLZvKcAqvo926ZNMP/70A0z4ePUBDjz6BIrgFi3jjaU0T6nsNLa1eabULb7lgSpZuue+isEJQDWa7r8omlKzTT2oBgpmd4eNZPly/urmSqIXKuTGkGzFCx+esboWYAU7uqZqev5GiI1+KlbJGO9MP9ffmbpyxUnZvJnQtJnXDkjSzxtBobNguL3V5rhICVZnl/30pUMSJ4V6ihAc/2EcxYO/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kiG+61wRT+qlWZYFcgZliknRCXmE4rVFDX/82PIOK/4=;
 b=gnawUFF3h7IxW/AE0EYKijZ6s1+f35NH7P9HgmOKYlc4OCXvaQFWMJbKM//FlYuD5WtPcxdUqdFX4h3lAUZKQwKnitTNgepKLcOyWsMwQ8fOSWmhJ5z1p0sNS2Rczq70s8qjB4zw+IYdgbBViOAYzAL0Gn5W/5C4ZZb7RUJbzBJmXIIkSmBUS5R4MjT9B5EyvbVl+03YMi+15YvImxTmecQWqbm3W8AALXKCqInkBQ3FLeLCkbgqr8lsdO+DwFm+zGtzmxuU4H3RFvdB6+V+P+Ciq58nrSt5HMHUumuqVYNGPiFU4jn7Wt0ajP0wvNt+3gV9QVdmmJmomaHGbNiemQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3849.namprd12.prod.outlook.com (2603:10b6:5:1c7::26)
 by IA1PR12MB7733.namprd12.prod.outlook.com (2603:10b6:208:423::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.27; Fri, 17 May
 2024 19:06:14 +0000
Received: from DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::c296:774b:a5fc:965e]) by DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::c296:774b:a5fc:965e%4]) with mapi id 15.20.7587.028; Fri, 17 May 2024
 19:06:14 +0000
Date: Fri, 17 May 2024 16:06:13 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [RFC PATCH v2 00/20] Reimplement huge pages without hugepd on
 powerpc (8xx, e500, book3s/64)
Message-ID: <20240517190613.GC20229@nvidia.com>
References: <cover.1715971869.git.christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1715971869.git.christophe.leroy@csgroup.eu>
X-ClientProxiedBy: YT3PR01CA0021.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:86::32) To DM6PR12MB3849.namprd12.prod.outlook.com
 (2603:10b6:5:1c7::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3849:EE_|IA1PR12MB7733:EE_
X-MS-Office365-Filtering-Correlation-Id: 07e7c1c6-0141-413c-fc78-08dc76a46c47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?ky14PJg0gN/RBz5IlitIqRA3IzY9RugVfMofNYQDNiFRC+TkmAhPBnLVvu2A?=
 =?us-ascii?Q?MWISeFwzJMhQzL8Bb5niPixzDnnMCRN/ZEAMmpg3xt/bPy2et2vl975EGvdZ?=
 =?us-ascii?Q?nTQLGnoqD7UVunaVD2tXJl5ETjRgdw4UF/3ROG4X3EDHKeWCkAxYM/1BWwBF?=
 =?us-ascii?Q?e9aTKNCYaZWqAoendOHwZxFYgjP80RP4eAMGzaXoe7Xs9k69HjSa1A6UOcau?=
 =?us-ascii?Q?fD1SI3Zd5+qNfhjZveXXcQt1CK5pkAYS9wtvVhCBATgYIoqZJ1YVS0A1SgFY?=
 =?us-ascii?Q?aOkhHW9sTnW3C4MnmTXocTrthbWs1U3EUqaCVHTfY2+zXzxCMlp/tsGAXkqJ?=
 =?us-ascii?Q?6vczz+pNugyfI4IFpe45Tm+a+LogIZWmIg+NQRwpOkIzK/LrfrHU3fRVrORh?=
 =?us-ascii?Q?8k6N8sTQKWOFPsGaVDbt/mFge05JqvuMWw0BSjPWp7J9b459UUbn9FDkSV/6?=
 =?us-ascii?Q?u+laYOrAORcbyvVN0tLP6iw4WLZhLuGM46IlP8awj2IGvEnK5Vwwn5nqOnnQ?=
 =?us-ascii?Q?f1x90kbf9YrsxeCZdh4ozOiLNKdZOjg5RUQdnChRtmAo1xsw5N/vcCpoYdMW?=
 =?us-ascii?Q?pz4QbNhA6y6xRiJGcgQWaVSAxpPoPtU2YQupV9VUzS5gyiYpQWhULACFugUS?=
 =?us-ascii?Q?FpOcDxPgKMGlRLQE1KUBdwuNj/sD1aDBDlsFgsD9B1x9G2pgjB4yEZ5btSTC?=
 =?us-ascii?Q?S7SmEUkS/cqTatmgzkm0UyixVycOk/gn8xKQUXNW8+nhgifSOh3c6f+9O8n6?=
 =?us-ascii?Q?UnwSROPBFUpmCx8FiSm6LmyI3/VNryG3i4fTOd6tLw21qx+EF1btqq18Es1+?=
 =?us-ascii?Q?o7t9ZEN0mJksYzaKLwJuueR95malOVrt3MQmpHwDG4Qt4IbuEntRb3EzQuEl?=
 =?us-ascii?Q?oEaSq7O73lPM0g5gi15kCqbR1ucWBHfjsaaVUCopwfspn7Mw6r8unUmwQv2j?=
 =?us-ascii?Q?gadLtcXNlb7Nlk69PcA1/ZvYNk4jSy3R1kxYdKM/YjLgOiMj6X1fvd875Q+R?=
 =?us-ascii?Q?GpgdXhwNMgYOvMdrVRVGfvFg428FZBOuv6ejzjwUOv2Gig06yzw+J6p3IvdA?=
 =?us-ascii?Q?bIwfLgdKGTkBrzuMSNaDkjI9dKvg1k+XYl9MfzQ13qRzLLFJbMKqGqkfSyzw?=
 =?us-ascii?Q?Jxyl7ygnltsgeu7Xe++34bnPjimft2+jEVp7a29H3ug4k6b/GMSN8xxqXQtR?=
 =?us-ascii?Q?eDPdiJMNxyGOKPudskgS3i5nXVQrMOYoNNQwaPlivIODKHRJzFirlgamjnCl?=
 =?us-ascii?Q?U/W4lbnENzPSFfb/jit6wcL7+mtv/3wMQKeWIArTtQ=3D=3D?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB3849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?/84UMeYSayL8VuUCQWaL8vDU21/fEK3ECwBgfFTJO+UWnWKYl7ykfrqTH/LE?=
 =?us-ascii?Q?ENvruM+PkvQuyUbP4gLJtKnyUQh8qhpk8JxSQdipWc8v0VucsGHZrYLOj6Jo?=
 =?us-ascii?Q?26G6RIJ6yh8mAp9z+HamDHrm1xAWVdhQFj28i825AIruDSB2XUIlOrgqXZZO?=
 =?us-ascii?Q?azcT4i7OmIBnIb4O1CmxA1yBJ2KmaHiZ9yg53dzieL0uJrOVO1+cNvYByruY?=
 =?us-ascii?Q?eToXunxagg4nRNhBv8iGiR7YfzhFGY+7kDQWptfrwLAeSYrFE+ywRnNGAqED?=
 =?us-ascii?Q?xo4Iu/0RMPrc4Pyn/uFoDNEenOWR8bzP0/fXeN9ffHezPaqKdkwQC5TqeSQl?=
 =?us-ascii?Q?Rp3YHQAXkVEf5JxXE9ICLkmRLTkgWbcF4t+sI0DHQJDq+JrLbj8lRA1p9UYG?=
 =?us-ascii?Q?PXv40PQvLMke+C/bvkQk7ecnUooAXqoemYsgDzBzZptyjsOfZA7G+eZ0yQxD?=
 =?us-ascii?Q?uNMjKON9JjGm5F8qdM8mYfR3hFN5H2D0Op48IpQT2w6rBX53Xqmv81K+ST2z?=
 =?us-ascii?Q?ZHPOern1sONIvwRnsE+ppx1MicwBsiRP0FdiHMyPErKj5o3OvMfEKqN/3v5y?=
 =?us-ascii?Q?DzKk2+ufPU1JPs4XKt/xqL+0LUTFPS6okoBZB3cTGkm+PteG4HXArNfpBeg/?=
 =?us-ascii?Q?BIVp59bL+NKX6lCxvWOfKp97ZSR16/tBF3sw2RrJUeu9t2FhdVHQtrDD1cZC?=
 =?us-ascii?Q?AIFcXVo9rQh+NlTaFEjGQ16+HlV+eGkk462p0g1ksIPiN8NVG/PoZRgm2omT?=
 =?us-ascii?Q?ObVcAfHuZzKhuhOvFAj+DgMYpWIhNHtj1d5+PpOGzH9PpMC21uPANEwPqCu0?=
 =?us-ascii?Q?nZe8lo1woK4XfYLQ+rGhBk2u6L9y+OIvFcUr9JmQeoOUUknUIyTAdFj3TGRV?=
 =?us-ascii?Q?FuTP7fxMdEiU24w5Prd63TlCOe7ebQ8ka3xiNgB8cnPIgbV9ZhetnYDD6Moa?=
 =?us-ascii?Q?1bTk5pb6poMb5bvPVn+mgqNFvVGs/edTc5VuzRrTNVJBB+Z5MtnLjh99R1BU?=
 =?us-ascii?Q?46LxzyxSy4Ay+sy/kTpfqSF1Cj8s52KYfmhjV/kEzfhcFJ4NVpE4a5sFnpdI?=
 =?us-ascii?Q?bixMp6WvHhsNtiadDjTfNWptCDNj6VuV91kvnetJIWypUE/AIk0DBjEobAc6?=
 =?us-ascii?Q?ssbIci9U9K0PBkAE/SAE0Ur1hJWr+MLiqhgmBOSrdXF98HTmWBjZQv6hAHpb?=
 =?us-ascii?Q?69F69FQByxWOybH3NQgCD/2TBzGNaWLBVUhiViD5sLBmAq52zodIllPWP+Hd?=
 =?us-ascii?Q?BKucMb/MnaLjbuOoyuBDGKFC+W6UgmRI/ngWZGwxbVVUKQE/1p6yv1gIQW+c?=
 =?us-ascii?Q?/WGpIrijrGYChMrBPSLs+xa3jfB9IhBL8PofZRzGoTSbwe9F3ixRohrQs4dy?=
 =?us-ascii?Q?rRA5XnAaYInHZSl2B0+oOGUTb+Jvx7I/LS/zxuJAX7QbwPT1h15UEhY4MI1K?=
 =?us-ascii?Q?nt1rGQMc36ZuIuGEeVgElyFEmiutNviY1bp3oM3CiRCiWyI542iEzl51wkLT?=
 =?us-ascii?Q?Y6mkXsOP5B5HrOR1f8wmftVGkx5+rElgKCPqcH4/mWQLTaRwdHrv/uq4onOc?=
 =?us-ascii?Q?o8Z9aZLLaC3HIBJWy2rgEQikWf2tdtV2kHmev2nh?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07e7c1c6-0141-413c-fc78-08dc76a46c47
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2024 19:06:14.4313
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DvgwwW5MinO2kgcDm7Y8+4TyK7QF9HU/FhwpU88EChKgmCMcSGZEtLnR4UX5acIy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7733
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
Cc: linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linux-mm@kvack.org, Peter Xu <peterx@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 17, 2024 at 08:59:54PM +0200, Christophe Leroy wrote:
> This is the continuation of the RFC v1 series "Reimplement huge pages
> without hugepd on powerpc 8xx". It now get rid of hugepd completely
> after handling also e500 and book3s/64

This is really amazing, thank you for doing it!

Jason
