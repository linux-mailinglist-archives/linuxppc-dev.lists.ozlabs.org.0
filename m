Return-Path: <linuxppc-dev+bounces-5852-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9F7A282C5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Feb 2025 04:20:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ynlq61jR4z2yyR;
	Wed,  5 Feb 2025 14:20:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2415::62c" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738724898;
	cv=pass; b=NW43XPacgpIZuNfqT4cGjIBiZTcKpNnActgwFrgSvQp9jpE5h6y0ebeAAcF4ZpqT8Tl6h0YbYqdPwNkoq3fE4PJgrN8chQ46v+hHskee/rqXRgZmTG+YLKlvZro/2++RNUugdyvtvFurLT4LRtMb5Rc/MTw+3hxIFOy5Ar6c6gqS5sveNggOW4qcvt5HAWbCa4Q3fE/5PydYmvU5jDKl6xVV0GmWDYIBw6hOfUfK8QDSOTEJes56ziZDM8lizfcia0tM2Z/Yu9wpxj+BBBkSCr2Ul+MubXSNINp1UtETzqof3SrpJVQ7WAiohq912O/r1yRMX34ymLK2g5XY78VB0w==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738724898; c=relaxed/relaxed;
	bh=9ZnwxVPqsgGdFLdc6IIUlNUNIszkuY0kexSUWRS8Y8A=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=CBOLFV9aimCGLcuwfIOFwvXJuWI5XFhz66Cp8JQnRGHUxPolBGFPA522hc8QtnBN+M76Sqd9qsNtXwth3+GznNumejP34nmZI5n338B8J03ZRHE/da0F1oBf6qrr8bmAbPZj5tYifJiNZypLcyltHrhvDDQSddsZs+jMEfHBLsKiwhrlsAwB5tE31FS+lu3IWNTId26NHLal7sNsTzEsUGC8PmC9xn6EK7/RfZG5zzVJ9O3isX2lE7lUaLT8CIHq4HZC1Y/rqxZoi29KjV1wvE7bp86Pn8UnlNuiSQ3VAjO6EXfNrmg17HztadWgHaDYp9tfRhfr3Dq6Lz8hSF6Pgw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=PrNp2Zby; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2415::62c; helo=nam11-dm6-obe.outbound.protection.outlook.com; envelope-from=balbirs@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=PrNp2Zby;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2415::62c; helo=nam11-dm6-obe.outbound.protection.outlook.com; envelope-from=balbirs@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2062c.outbound.protection.outlook.com [IPv6:2a01:111:f403:2415::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YnlYD4QP9z2xKN
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Feb 2025 14:08:16 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b3A2W1gR4re2HmLwCx1BDEguwvAhlnw+CX3vdUApvUBOgaAujsZcxU6Nb/wAM7iRQZLBNxJT0s6BcrKbO2NAeKMRBq0KhZfhHlTaQ1UO9ls1FoWb5hd5uohz7zmcenf4/Oo0OVTxh+SjY962p/uT3GjdFmpYEJGtKDJ0X69/CIZo+m5OSEkkbHZoX4n+BWymLviEkXhgbVPfwGIY4mJmt96z4Rwtqamb/DdnqXrVw9L+mnp1bGPaLvSsvZ0v4ZMQws0sesCoDZfQ+MrXqI6WwASyEPYU/+ci/32b77p78+g41w48ocDMn6ezZCnkaymj48DRgLvhNXj1jDM6zCj6kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ZnwxVPqsgGdFLdc6IIUlNUNIszkuY0kexSUWRS8Y8A=;
 b=USF2OMhXZjkBBbN4uC6nMz1T0fZpxZgy/kD7+cbdnhY3VePOQMqJPeoAIfXKjOQNoWhot8GR/2xUi/J/3HMwuQ6ABWKXfBcB2LOQ+9f9d7L15RbBa/FWyaHoD9ziPsH1xpUAvR5TzXWsTm2OleHImmxI2AIilQ5R3A6JkAgdwInEnYruse+FKlJpu1NQxvW1ejbT/WDuq/U2+0bGJlVv2RgyeMJSbO42DnRjaQiodFI+7aXjXMszzT7Hugat7QbFw0ykOZtYcpN1skswBYEJheXzzC5DKgvhpwOVMaZf5HFib0vL03xyxk15SPxtkfTlt1Ro4RYGvTK0x2YcgK00EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ZnwxVPqsgGdFLdc6IIUlNUNIszkuY0kexSUWRS8Y8A=;
 b=PrNp2ZbyN7B0UEodg6JuyXOpGEQVQo5wyZIyPZd1f7elcLZSwU5X7eh0Ya/khtr5fcJrbNIOxpMsVDdx6A1Wg/4JVcPXGXhf9cjtjtYUrQX3PylAeQUdchaNHNCyL1ikw4TnNbzc/CorH/qY/QudZMjBJLwfT2VnPe3Joey07/eHzlnRz6IoU1E8jtqk4wPjayygKVLPxvH0NbN7/wSWolfwN3BHLHvGAtMWd2LyKNucod4QKTQorlQXyC1/KIgw9VwxYv9vyHSiAbcqmRJ2kydKxBzMVDAk88GlRc8ty7qtufO0hPf+CoGua+dHhDYdtz1irkMf1+YekbOA7FzizQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SA1PR12MB7272.namprd12.prod.outlook.com (2603:10b6:806:2b6::7)
 by BL1PR12MB5756.namprd12.prod.outlook.com (2603:10b6:208:393::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.23; Wed, 5 Feb
 2025 03:07:55 +0000
Received: from SA1PR12MB7272.namprd12.prod.outlook.com
 ([fe80::a970:b87e:819a:1868]) by SA1PR12MB7272.namprd12.prod.outlook.com
 ([fe80::a970:b87e:819a:1868%7]) with mapi id 15.20.8398.018; Wed, 5 Feb 2025
 03:07:54 +0000
Message-ID: <73f9d8f1-6fad-43bc-bcd3-c1de44322dbf@nvidia.com>
Date: Wed, 5 Feb 2025 14:07:43 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 01/20] fuse: Fix dax truncate/punch_hole fault path
To: Alistair Popple <apopple@nvidia.com>, akpm@linux-foundation.org,
 dan.j.williams@intel.com, linux-mm@kvack.org
Cc: Alison Schofield <alison.schofield@intel.com>, lina@asahilina.net,
 zhang.lyra@gmail.com, gerald.schaefer@linux.ibm.com,
 vishal.l.verma@intel.com, dave.jiang@intel.com, logang@deltatee.com,
 bhelgaas@google.com, jack@suse.cz, jgg@ziepe.ca, catalin.marinas@arm.com,
 will@kernel.org, mpe@ellerman.id.au, npiggin@gmail.com,
 dave.hansen@linux.intel.com, ira.weiny@intel.com, willy@infradead.org,
 djwong@kernel.org, tytso@mit.edu, linmiaohe@huawei.com, david@redhat.com,
 peterx@redhat.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 nvdimm@lists.linux.dev, linux-cxl@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de,
 david@fromorbit.com, chenhuacai@kernel.org, kernel@xen0n.name,
 loongarch@lists.linux.dev, Vivek Goyal <vgoyal@redhat.com>
References: <cover.472dfc700f28c65ecad7591096a1dc7878ff6172.1738709036.git-series.apopple@nvidia.com>
 <8aa3a20b072f60344e1d7e9b77a95aaa4b6dfceb.1738709036.git-series.apopple@nvidia.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <8aa3a20b072f60344e1d7e9b77a95aaa4b6dfceb.1738709036.git-series.apopple@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR11CA0038.namprd11.prod.outlook.com
 (2603:10b6:a03:80::15) To SA1PR12MB7272.namprd12.prod.outlook.com
 (2603:10b6:806:2b6::7)
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
X-MS-TrafficTypeDiagnostic: SA1PR12MB7272:EE_|BL1PR12MB5756:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b09a479-5c56-4eae-c6ba-08dd459248ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dWYzTTc1NnVSWlJMY05Rb1ZkdTFXSi9NTjJLRVJSeEVIb1U4dkd6d1dLb0hp?=
 =?utf-8?B?OE9ESllPRFJKRUJZMElNenVxL2xxVlRscWdYOEFBeis4cG9DYkxLOC9oUlFW?=
 =?utf-8?B?Mk5YQ2JqcmhBbkVWWWdySkdMb3JOd05nZ2grRXpwajh2a2N6WU5hcGdHRG0w?=
 =?utf-8?B?WTNMT3FObGVPZkwyOEpqQzN1L2JFc2VmVGkyZ0JNaTFxcm9rYVVlNFV5ekVv?=
 =?utf-8?B?S1hWMXoya3ZPNWNiekhrZXpRYS9adlQ4SmdPOHRxT3o0Zk5qMTg4Wm4vMTZU?=
 =?utf-8?B?a1VWaGdDeDV1SDI4cXk4RTRyZnZuU0hRNGR4K2ZQQ1Q4SEdwbWUxaHM0UEVG?=
 =?utf-8?B?NTB1YUNhblgwbGhiTUkrN3J1Q1BreEFzSmxhTGh0MHVCeU5sS3ZTZURHd1NR?=
 =?utf-8?B?TGpZWjVKYVpIdWFNd0F3MlNXSXVDRldQRm5MODdUOEc1K3hzZUl2Tm81NjNq?=
 =?utf-8?B?WkFXaHVPa0cvVGx1ZVMzVjgwclFEZDF6ZURJQXVtTEU1UjlxZFh6cUROdXU0?=
 =?utf-8?B?L0JNL2ZWdlhTMno3QXhWeUNEMjB0S1ZyV3hNSUJhVWtqeWNBbXdQTkdGRzll?=
 =?utf-8?B?VE5hUitHRDhKWFdvdENaZUdVOS9FTlBZL3liMzFlemFLbkJqcEpLZ2ZBSFdz?=
 =?utf-8?B?TUpKVDh4ZU5Rd2dVZWV4dFRUQlJIMFRkcGFvWGhna0V3dWZPbHFoMEpWNWxX?=
 =?utf-8?B?RC9ZRFFIVExaNFIwdmlxNHQxenlRbXZoNU9IVkFia1o5NzV5TkhwTllzdnhq?=
 =?utf-8?B?VTQ1MGtsdkJPY3Nlc3ROV1lXOXh4UmQwZTBBV0JkUVY3NXlhZjA4SGZUTnFJ?=
 =?utf-8?B?eVh0OXlXTFhwZENKWU1ZdnJEUG12RFI5Zi9BQUNFUzdJZzNCYjFqUXhNZisy?=
 =?utf-8?B?dTNvRTF1cWtvdXZPYlVpcHp2V3hmSGxvVHdBMGR3U2tWeFRBYkJTem5BQ0FU?=
 =?utf-8?B?Y1lFOVFPeFc2ejZnWUhLQWV4Q1pPMUt5K05WZTVBSDR3NUdrREdodExuNVNS?=
 =?utf-8?B?R3FpekJzbU81T04yK3llaVdkeVJWbmJIcG12SE9YSXRKd1hNWmtiTGtwMGdw?=
 =?utf-8?B?dEpsc1BBMWtFLzMzbkZ4UURhemp6aTNwWmZXTFFtL09PM3Bod0lUWHh5ZDZH?=
 =?utf-8?B?NUFqTExNSTE4SjhaN1ZVU1FOYUMxbGpXbFEvM0cyVVZ2V2tjZ3B3VDNsSHV2?=
 =?utf-8?B?bTU2Vno4RG0wK1JkU3dubldsUE1Rdy9QZmVOaHdEYzBPbzlSV1p5VWt1Yy9s?=
 =?utf-8?B?VVlJd0kwSGI3T1NGWFRxUE9KVURmRlEwZWhXVVg1d3lWcXZLcSthZFNmZVR2?=
 =?utf-8?B?K2NEeGlvTHhydzhrZXpwS1luR3FYN2lFUUNZZjFjTkYwWnZjMlc2Q1R2eGFF?=
 =?utf-8?B?OUliL0JROGdkQ0p4eEpLSEY2NStvTmtlS3dpTis1VjhhWjQzR2hOYU5aMlVD?=
 =?utf-8?B?Q2d1dWMzbkdicFFpamdPd2F1RHF2eEJsNlFMaFg5OThGTDRsUE15NCtxWG1k?=
 =?utf-8?B?MGdJZmp1NGJ5b0Q4RC85VW96Y1gyaEhZOThFR2Qyb3FUbi9Za3VuQTcwOUZE?=
 =?utf-8?B?cFB2WFp2ckhaWGRDdkE1WHBSclM1NjVNd3FQV2RSS3c1Rll4VlRSM1p1S2Fn?=
 =?utf-8?B?c09iNll2cGcxR2hYUVN3NDR3UEJwa1dXU0JST1k1VWhaVUlZU3N5WnoxcEwy?=
 =?utf-8?B?MWNJNmRzbkdYTHIzaXBoYW1CczNTOUhHcldnTnJuQ3UyQ1VqOXY2Qkx2RmFS?=
 =?utf-8?B?eGdmL2ZZR1pzSGJaU2F2UWlUZWhTMGNxak9lZVcwNzBIWHFuWVlXUUJBNHV0?=
 =?utf-8?B?ZG0zNkEvVkdvZ1FJT0pNeFZzdDJJd0Y0YjFMYkt5VHZFWXBNSmsvZTBXNmwz?=
 =?utf-8?Q?fi1qlm7qC4JR0?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR12MB7272.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SllLcDhyRGtjMGRaRjJVWHFNcTk1OWZNOFBtaUhVTWE0QmhMVXJkMDdCbUJG?=
 =?utf-8?B?eUgzQ1hJRHZRL2RDZVQzOExyTWhBa0l3dGVkV0VLMTcwSUxabmhLVkJLbW9P?=
 =?utf-8?B?aTN4SU9sSGRMSWhOS1pMVUMvMHcrSUdwRXdUWWl1cUJOZ3MvcjgrMm5rSDlt?=
 =?utf-8?B?RzQxV1EreHE4S1A4L3IrQ0JqdktyejJQenlIRUtGNjdVSjVmZWdzN1ZtZG5l?=
 =?utf-8?B?aTZZcHdycDZtclRUcytDTGxPTzFaMFVlWUtkdWljUyt3dHJZUUZUVFBOSCtE?=
 =?utf-8?B?SGxmRm1LK3NWVXJlaTh2SXV2eTBBU09EY05oZ0d6ZUd0UTlHVEFFYTRHUlpt?=
 =?utf-8?B?QW80dUxwZlFkMisxQnBHY3VMQlBTTzFJcW15OWcxNzBvaUxnWVJEcmF4cjNx?=
 =?utf-8?B?RzVyZlcvaW4vS05MYzZua3J3b0hwQ2J5cWdJeXlWMFVDZTdFdHJBYytpUFI5?=
 =?utf-8?B?QmxEQWxHNzNIVHBYakZtZTM2RFZXTW5HSDZOaHMwWEdhWU9UTkoxSk1oeTNZ?=
 =?utf-8?B?eWl1Z1p0cDA2cFpkaSs0WEtLdGJJbUhJTTlWTTk2UGljYThzdGhFMmtTKzU0?=
 =?utf-8?B?dGl4aXdOZzE4Z2JZUk0rcWlOMmlWSVozZS82eVpvYi8xVWlNZWd6dXdMMHMx?=
 =?utf-8?B?Z2ZnVjRBaWovUzE2MDMvZmIycU8xSmtEd2pTWStnYTdTQnBjbldnOS8ybWps?=
 =?utf-8?B?ZXh4bUpYMXNlZEJSTkZvNTNsZVZiVnFCT0xEUDlramp2c1QxeFF0bGdYK3pl?=
 =?utf-8?B?QllvTGNOVlhid0xHcWMvQ2ZQU3pTQXFhK25GaU1sOVZ0SUMzK1ViMTJta3Rp?=
 =?utf-8?B?ejA1bE9QQWRDSFUxNVVSS2tsaXdNTjhaN3hEakdLR1VOVlM2Y3ZaVkxYekZX?=
 =?utf-8?B?OS9uOE9XbDRQWEtoZXIzT0hBT0R3d3cvZmJ0Vm5vS1JZZmRMUC8xcjd1L0ZM?=
 =?utf-8?B?UVJsaWNvNzVyTUhvWUNMbHRNZUJTM3ZZaVVKUmRtb250a2pDQ200TUZCemUv?=
 =?utf-8?B?eiswSEVPZld3RXBpNG1CSnU2ck5ZN2VLMUVJS3p1aUtNRmpiU01lWGNBVDlC?=
 =?utf-8?B?b09leU1ENEtZVVdhbjJJOVAweFpEYjE5OGt5V0l1Vms5OHEvRUs1aWNQWlhN?=
 =?utf-8?B?UkFoSTJSYXBTVEZaZnpXcWhTTzJJQmdyaDE4RUl6YUl1OFFSWlE0SmNtOTZC?=
 =?utf-8?B?ajBkeEVoU3JQa3BXZG1PamZZcjU3OUR3REhQUHRER0RDejFhcUxKZ0xwcUds?=
 =?utf-8?B?cVNmYk51S3l3dzlqYStRbU45RVRDTjE3QVBDeVRJTklHc29JSlRYa0xSVUVR?=
 =?utf-8?B?SGYzY3NXQTMzKzAyVllvM1VFUVlTMmRsRU0zNHVUNGYxek9ocC9KQjB1K1BF?=
 =?utf-8?B?ZEQ0dDBIUzFmL0xpTFFsNWhWRnF1UHFHOFVXSHZIQzBpbHNBQ0pKYUgwM2I3?=
 =?utf-8?B?Nk9tWDU3NTg2QitHYjh6K3FiZ2htK1hTaHlidEU0NDdvNGFLeENOck5MN25M?=
 =?utf-8?B?Wk4xcUNJK2xpMWxJUGlIam9PRGRaYWFKU1NSUFg0VmtrSmY5b0NFZE9YK3dX?=
 =?utf-8?B?MXBlYnhtM3hoQzh5aXV2K0R4bmNiUzVhUjZYQ29kbnNzc0NhSlhQZW15eC8x?=
 =?utf-8?B?WGhua3lmWEc0UVdTa0wvSEl4N1ZrMHBNbUx5UlBxQVBtamJkZzR5SnhOcDlz?=
 =?utf-8?B?SkZucnBndnNPYmx6ODhCZzFjaWVaQ1U4cXB3cFcvclJsSklwMHdQb1NLOUdR?=
 =?utf-8?B?U3FndkRyRGZtUlRjczhmZTdPV3hxUnFBOHdPSHNJTllaRTkrRkQrc3BWRlQw?=
 =?utf-8?B?QWlQaXMrbDgrMHdMdnFkanlQZ0IycEZBdzZwQ3krZ0Z6WFBFSDVBOXpnNUpm?=
 =?utf-8?B?TUxuNzJEVUtaYUZhY2hxRkNtRTZqWXFYbU10ai9kM3J4aVE2dGgzYnRYWW9L?=
 =?utf-8?B?RHEwT0NKM0FTZzRNSjZONHppVEw3K0V6ZzhEbGFrOGtrUEx6dXFlaXZXWGdI?=
 =?utf-8?B?cFgvMXpjZzE2NlFkSFRRS1BJWlFsQjVxemNtUmpnMjdzeXlZUGwrS1hMZUFK?=
 =?utf-8?B?U1ZFclNPdHZML1VhdUhzQnUzRWpxVjRPQXRyTi9wUWJ2Szh3cnZWSjVpVnFj?=
 =?utf-8?Q?viTGs1xoVlXiMg/bvlibzGP2h?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b09a479-5c56-4eae-c6ba-08dd459248ef
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB7272.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 03:07:54.9044
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XpxGzoFRqWaZRo7urNGIVjxR/lOa2b3eemuZBUv7Ik9iaUKnEJ36OWXv2y3zmSjfMj7J4t3/5URH3c4VsPhRpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5756
X-Spam-Status: No, score=-0.5 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 2/5/25 09:47, Alistair Popple wrote:
> FS DAX requires file systems to call into the DAX layout prior to unlinking
> inodes to ensure there is no ongoing DMA or other remote access to the
> direct mapped page. The fuse file system implements
> fuse_dax_break_layouts() to do this which includes a comment indicating
> that passing dmap_end == 0 leads to unmapping of the whole file.
> 
> However this is not true - passing dmap_end == 0 will not unmap anything
> before dmap_start, and further more dax_layout_busy_page_range() will not
> scan any of the range to see if there maybe ongoing DMA access to the
> range. Fix this by passing -1 for dmap_end to fuse_dax_break_layouts()
> which will invalidate the entire file range to
> dax_layout_busy_page_range().
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Co-developed-by: Dan Williams <dan.j.williams@intel.com>
> Signed-off-by: Dan Williams <dan.j.williams@intel.com>
> Fixes: 6ae330cad6ef ("virtiofs: serialize truncate/punch_hole and dax fault path")
> Cc: Vivek Goyal <vgoyal@redhat.com>
> 

Looks good

Reviewed-by: Balbir Singh <balbirs@nvidia.com>

