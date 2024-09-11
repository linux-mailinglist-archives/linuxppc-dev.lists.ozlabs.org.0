Return-Path: <linuxppc-dev+bounces-1229-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C59A49747A9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2024 03:12:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X3MxC3ZMWz2y92;
	Wed, 11 Sep 2024 11:12:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2418::62b" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726017135;
	cv=pass; b=BXLFhe0B4NV4rCfaaoUIsQ8hrTC+qmPLkihXW1FaC5yygQGeWOQ2ZlDPUhm8H+evIkmMvvSLd1S78x4vdZHOM0C5M71MjqqbP0tht6QjQnLkB0e68NYfWPw0roRAy1pBWOP3h4zBaMxCAW2SV4aVx6Vc1HScSY3UDhm3ZmGDuCWa9qmwUwLaYCoGJwmTOJd70W5z2kdHoXEvFPtGRVuuArDTa0vDuVMQsII4MoBFk5qPS9/qDFooPkEoLfLg/T4QK//qZWjgUMB7FiYwp5qnwlM2e17N12B/jOwoZecAN+nf6qJ1aYm20ejcIUCq2n2gC6k5QNv7gjJeNGG4tAh9HQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726017135; c=relaxed/relaxed;
	bh=LNGFiracZQdbq+3bCmMY9lvhPx98OOObsHzcjX8Os7Y=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:Message-ID:
	 Content-Type:MIME-Version; b=mic2hyCBpsz/53IR7gjWIo1juFMg7L4jUWJkWODIj8zSvoINqVv99K4s0iZS668YrhXtatok1LYR4cI8xmYb+6bimTt+AECcMaodsSTg1zU/1qAfsXikIEMqA9j3d8ZWMXLTaYM2/A3vCK/fbCygdwoq4DPFaOz31QO/lNQRAnexa0rXNcAqKQ3Z1w29H5scsHmzKbzdX47f3xrSX9cRYFToN9dutcgU/1Cz7bnFpEwIpMc8ZWLwGgy0v8/WYrRTiIvtp4DEZr8Ip4S3NM1CPLyr4ntUb3iYKPSBpNwiSSPXlWMOf7woW4y6DEHKuHymc7LwYRZpk/CNcxZ/A5BXNQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=IUymFC0G; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2418::62b; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=IUymFC0G;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2418::62b; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2062b.outbound.protection.outlook.com [IPv6:2a01:111:f403:2418::62b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X3MxB6hYCz2xs4
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Sep 2024 11:12:12 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HaoR9j25RA3zd89Ta/t8HgRjIcf11Id//ry/WailMwYUndq60whpXiY1ksrthUFBp1Shs5/aQcXTAsp4kSKTVHmd5PyzwIiHXZ+a61mzNSe1MoWU+ITT3L3cx4ZCU/4YF9K/yNYBro3mHSCvfEa2+8UElPpwLYrI5R9spTX4cD4vu/JJcB5jdYFMlyLS0OZfKHetT91i2sKex9eShU6/haV5zkmGXeC0VtMKpliXkUBVercYhKLFLfSphhXFsriL6r3ZNkM3oGDKE4Ly8m7FOl2WXo8iuZBL0kbXhkg/qq5LQCyx3//PTkA1VYFXsdnFtYn+pSWQe51DR4KL5OJkEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LNGFiracZQdbq+3bCmMY9lvhPx98OOObsHzcjX8Os7Y=;
 b=bKcsVZidMoK9MNYaDvH2J37oSSdjhDG+Z4688ngACjrWDhDdWDtFdgxkWfpbXGxVOZPAj6/9KOKppxHq1BOcvxKSjTJtSSn47Ku8wG4muLDFKHc6dk0yhb8w5LALfhZCgJxxXiT/om9L1RgYezSNWbmXoBHmRGVR75t1OD46rKqrOJsuZRC+VPZJYgzSbza+WB8JkaQfM1s2yhVWlDbF4OjDFDLbTMfgTxykWHQX69ulyD14DHOqCTUnV9U/IzAaxZi2xMPjy40Mr9WxajEzxDFA+5AvfVQo4pWItlJSH73iFAH0AQjOSfonBQKc+fhP3CeCSK0R1iIdcjnKjcwAdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LNGFiracZQdbq+3bCmMY9lvhPx98OOObsHzcjX8Os7Y=;
 b=IUymFC0G9I1F64I8vQ1UwDMO+Fuw2OZxNI46zUNd66tt7/rHBRKOvLbaLDiEdCzhqzDh4nq9UT6TtDacW/6nRdGfsaYfQ7fvMzvxZp4s6UMiOamrkkQYXhq4FnbrMAVQeVXA9RgBrmfLThWqu64tLMxbduDKRfVgAKrMaA82Efp5ejTmlVKx+8otaxY3Kh0A/aTetzue0d68Uj5InAqJUIhIMTHjkCLIUNRnbKcnti5VKFU86anCagLE96Veb+FzR4ii89VanjMV0vgQS39g1iVGpegLNMrc95+9pRvl+mfzc6JMYEYz5ZUNtTIHYzASMaD+aL2a1Z8o51w5rqKtjw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 PH7PR12MB5734.namprd12.prod.outlook.com (2603:10b6:510:1e1::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7962.17; Wed, 11 Sep 2024 01:11:50 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%3]) with mapi id 15.20.7962.016; Wed, 11 Sep 2024
 01:11:50 +0000
References: <4f8326d9d9e81f1cb893c2bd6f17878b138cf93d.1725941415.git-series.apopple@nvidia.com>
 <20240910134745.GA577955@bhelgaas>
User-agent: mu4e 1.10.8; emacs 29.1
From: Alistair Popple <apopple@nvidia.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: dan.j.williams@intel.com, linux-mm@kvack.org, vishal.l.verma@intel.com,
 dave.jiang@intel.com, logang@deltatee.com, bhelgaas@google.com,
 jack@suse.cz, jgg@ziepe.ca, catalin.marinas@arm.com, will@kernel.org,
 mpe@ellerman.id.au, npiggin@gmail.com, dave.hansen@linux.intel.com,
 ira.weiny@intel.com, willy@infradead.org, djwong@kernel.org,
 tytso@mit.edu, linmiaohe@huawei.com, david@redhat.com, peterx@redhat.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 nvdimm@lists.linux.dev, linux-cxl@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de,
 david@fromorbit.com
Subject: Re: [PATCH 02/12] pci/p2pdma: Don't initialise page refcount to one
Date: Wed, 11 Sep 2024 11:07:51 +1000
In-reply-to: <20240910134745.GA577955@bhelgaas>
Message-ID: <87r09rgfjj.fsf@nvdebian.thelocal>
Content-Type: text/plain
X-ClientProxiedBy: SY5P282CA0057.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:20a::9) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|PH7PR12MB5734:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ac3c709-a737-40e2-d939-08dcd1feb700
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cBDBIrJ8OrLjAsWuHRNYw2uKW0jIq3VA6xb4XmP6tbTuVxJ3S1bK1hFbMjsK?=
 =?us-ascii?Q?LMyuzab6b/wDavmzXe2vUXudYsY7cy+WpBf/os8/FuU9j3CsQc1Tf+ZBlHvj?=
 =?us-ascii?Q?rYgPdoNPxLgw+m0Yjk5cut0A5yb5B8ya4Bjso6WJoAGQ0qfDSq0qzJK6m2oL?=
 =?us-ascii?Q?jSwNpMfIhK8+vBV/HXPhmqJq99ighx7uBBmZVLY/4b8DucBfiamUYssVjiKS?=
 =?us-ascii?Q?5RZDWvn35xgWLQDy+QpA4wIzlqiT7/bKWc+jl6SKL8OYmSI7MYp6ffOfGSv0?=
 =?us-ascii?Q?qH7AhOivR+4nVMwOZ9mk0aYEsKLQMc0AnS9sspb8mTZLdacVuiqmd5Rlmw1l?=
 =?us-ascii?Q?pwDdt4Od06WhCJ9QtIXaYvLPtFRidS0BFPujnaWjpK5G+X2/IqMnq5S7m8ot?=
 =?us-ascii?Q?w7QD8NBpOv1RFTm0ktTBP4+wdQfo1OjYe8L57jHTBU6090yoqgIrGns73XEE?=
 =?us-ascii?Q?Y4Dc1qDnowHp+RTSR43VkxfRxde5pNEobVbxNyAEkU5zE7hm1qfzB0GvZCRj?=
 =?us-ascii?Q?oa0Xw9XadTTlmZAFkOScMXGuhh3l9k1jn3CEQH13SHi9iRMi2Jt2n/P4akW+?=
 =?us-ascii?Q?vh6MlZUDI9nDc6q2vKIP7MehPoTV1zjLKCQoS9tAQtQf8Ulop+LCxlPQkHzs?=
 =?us-ascii?Q?gwuyzKoMw50Iz0HFixDQW48qs90cD1KEdNK5mc1acYlGmchKzlpLMlkbUg6h?=
 =?us-ascii?Q?I+Wl8L3mRPhPebGJBieDXvbQr5TmVVRyKtQ1vEc+gTkcUVIMV0gBbHkR7cOV?=
 =?us-ascii?Q?UCMHEerqEULafJyrUonDKKaRWNmzVAl5pnfpYlq3IUHtMMMDYd61/n+R2Ipt?=
 =?us-ascii?Q?xa9b4pljSDviyaUjYez0XiAY/1H9llUK26zMDe5ZJARFBdYKpaxJtySxzHpP?=
 =?us-ascii?Q?gKqvbPp49OagAPNBwpWI3qhmDByUWU6R28XECphgIx7YenWXqOoyArvOhaza?=
 =?us-ascii?Q?b/yt+jWa7c0hQ5puWKV1Tx7LhPdL95jFxvxNN897N8lYIaQHYTmSTmshSGTr?=
 =?us-ascii?Q?d0v7BhSJwXevGxJD7RYscPFqRj2MbH4d6GpP8+gLqtffPqD87hRUjgJKtSmO?=
 =?us-ascii?Q?EahuquTAfCWRc6N1r4DbaONgkvazCET5oMhlGvuh2/zR/YMI+/glgwfulB/7?=
 =?us-ascii?Q?DVCgZODZ4PbQl/sG6MIviaDMAzf+llJtAjQ3xomsDzf3RGlq1n/EgW0ybiRX?=
 =?us-ascii?Q?wDtnpksb4kF85Bt24vJGKbWDZ81+lVtxKCoz06GjhDY+q9WH8gW/IBQN1Zkl?=
 =?us-ascii?Q?UhJ6a2DknDpAbT3+CpfdWFLIWFdvMApPuyBFTvIoLlg1vRdDem1f91Ab291W?=
 =?us-ascii?Q?2v9/pLMiiHYYSu6HO5r5Q280KifVl0trnt09GLniin44OA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vbPvEpJFm4+Qoc5RrhjWhwh2PYX3edGwwOy2CsC28qkO4qePg7ktorQOpMFl?=
 =?us-ascii?Q?L514MjYJ6catUT9uz8HRLvKHE+UZmDeHKmB5B28Lpv7cX+ltU035Zb9AwA/n?=
 =?us-ascii?Q?wd8e0f96g1adyl73b6mfnNDwQyWb8IDZL6Ehirfi/sHJdiKzrCXU5203ep+S?=
 =?us-ascii?Q?RZrXAQJns7z/TZo+Dq36IlsTpY4bVhr40Dq4pSQrGLWe/wQsdx1YqMTJroOe?=
 =?us-ascii?Q?u7uP+CXlYI+yOsia4lkU4uNJuFw0u+EjBMjynCpPnEPJg1KyyjVdaezw0tU7?=
 =?us-ascii?Q?GhpY+mj+CGIyb8XFEwg7NNkRJfeFquvc5YrAo6CY2bmwnYuOISqndV4crIVG?=
 =?us-ascii?Q?Ytmsxm0D98JDEIGZwooXqYBhYfFpzAWC5nOIXrmxfqmkf9x1llttxKLF0q51?=
 =?us-ascii?Q?ACND6fHmk4oqb/R9Wcb3bnE4R1JAaKv+8SCd2pQdvbhxTArr315PWArjMAdP?=
 =?us-ascii?Q?unAqQB8369eUKMuzoO5JvLO8w9+e/lDC/Gb3OvqrcDESVKW595zPALS0cBe5?=
 =?us-ascii?Q?pL7m7ahVgCyfKnmYQLkGKDmZUCcVa7PdjsHLrUwCEWNgFsSz0oHDpKbPH5lS?=
 =?us-ascii?Q?4d373CxwyuQpZQj+C20RRS7z+BfuHMnlyLp3NyRyMW+IG95oJ5nv1iNPtq3H?=
 =?us-ascii?Q?OfSSbJmwMNdopIwI9yc53sNlXk11WsxdKMhmTD1rX5QzDuiB3vtVwosBwK5u?=
 =?us-ascii?Q?6lpC8ygdDUdt1/R+VnvGf/MN1eF/AAfUq3BlHZG/qonCj8TJPmyK6f5PzVLO?=
 =?us-ascii?Q?hlSLnQAX+Z9jCCS9myAcwQQbNbN1xY2xr59ydHP9a3Fc1eZLGG7ENvtW+vRi?=
 =?us-ascii?Q?QZZA1Qxzgb45P5XbTiRMwm3EBm74hacFQdnxf0I1yquOAXFXu5ELnDEyL8gp?=
 =?us-ascii?Q?k6rZnOcFDXoQJOJngholQqdTf2kggSFR3B+jPW6ZkYENpoB3XQrWUaZalkgf?=
 =?us-ascii?Q?SGcmdhBqyQVLghtG9o67ltHh9JIz+O8A/gmX0M8tgUEGulKC1eiR9Y2mYa8c?=
 =?us-ascii?Q?LaN1OA9Q6inxSBr1vAvuzTvMUQfsP136oO6q+eljQ8q4c3AiwNzny94Lnc8B?=
 =?us-ascii?Q?oUh85dseessTzpkcQONtA/UOnYSwYz0fnhySJ5zCJn+SG4lCXAVH+sMCzVos?=
 =?us-ascii?Q?AP29Cb5WAwjt4c8tJdE690LRawl01NoNuskwuhAkFCAavlD3D/MdV8E5gXM8?=
 =?us-ascii?Q?7/niNEsO/2qb4BWzZQitFlcgRyQ1mHoZK1AT1GpE1H3Cn3HvTNw1yElKx+2P?=
 =?us-ascii?Q?quMMX1FATIQZ4lH3D6PXVWdOa26Wz12bT7IRGqO4yPNsBdUiX0pOBHoQegpW?=
 =?us-ascii?Q?J4SvdtMeek4nMS2m3rPikwhIhUWI3ShMIGTmojGy1TOGLodIQZ7yKgxbzlzL?=
 =?us-ascii?Q?qsk3kJx/3fZ2vbjozHMmgEHO0d7ihnBQ5oY7bPqYh6CcYZ1L+jI1+X4cDtGe?=
 =?us-ascii?Q?9hg4b4kXEodRoVg76YVlWXynsrSkDE9jA3vRavyqURYBN538iHOqA7dpYGJI?=
 =?us-ascii?Q?QVoUNRqFe0R/N5DOrzOY3VZFZUZ6paxvVhRo2QLfZLw462QFcwzmy4l+1cvS?=
 =?us-ascii?Q?f6sDRRyi4eT/VcWx0jBo4hxzd30T6GU54mT1nCrO?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ac3c709-a737-40e2-d939-08dcd1feb700
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 01:11:50.3499
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4uvWxDbuKK6GcLtDR3Z+yE4WUrUbmD3+tPTS8/xhNg1ZKLnfwnSFswTrRfSaytLxOzv5CDcfAkc5PP6pU38mmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5734


>> diff --git a/drivers/pci/p2pdma.c b/drivers/pci/p2pdma.c
>> index 4f47a13..210b9f4 100644
>> --- a/drivers/pci/p2pdma.c
>> +++ b/drivers/pci/p2pdma.c
>> @@ -129,6 +129,12 @@ static int p2pmem_alloc_mmap(struct file *filp, struct kobject *kobj,
>>  	}
>>  
>>  	/*
>> +	 * Initialise the refcount for the freshly allocated page. As we have
>> +	 * just allocated the page no one else should be using it.
>> +	 */
>> +	set_page_count(virt_to_page(kaddr), 1);
>
> No doubt the subject line is true in some overall context, but it does
> seem to say the opposite of what happens here.

Fair. It made sense to me from the mm context I was coming from (it was
being initialised to 1 there) but not overall. Something like "move page
refcount initialisation to p2pdma driver" would make more sense?

 - Alistair

> Bjorn

