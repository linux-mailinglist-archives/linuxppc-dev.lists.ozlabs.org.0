Return-Path: <linuxppc-dev+bounces-15398-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE0BD008D4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 08 Jan 2026 02:30:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dmnQX0THkz2yG3;
	Thu, 08 Jan 2026 12:30:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=40.107.209.49 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767835811;
	cv=pass; b=YluyH3i46xDlXjoy9tmuQRbZ6ukPNDuP8/7g8iBUJCiK6hpxl2uOnYryD8Y4q+ysgUAl/stFJdxlcgLOgnRxm1+/uxpIVk3EKKzDdZ+YF1kf5y7J2AkVG29gHUlLdcSOhzybhkiVwg3IIEvGH6MSzjq6nHtA51/q8Csmcdnedj9SKA2OdBNpgABwPjIwgPKSWgRmjcP0Qpcf+Xc69bXG4+yQa6+Ob6oOzZQJ3rS75iuJ24xTEroEONO7KmBfZinNWqrJp4SV5vIccoG4Plfbb435GBYhXjToxnkiagn+NOInOmQtkaWeV2rErNxjf+ponHbRxrXq0V2EblxjgLc8Cw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767835811; c=relaxed/relaxed;
	bh=JZM5g8Fsm40lY9IKMTZ9GP0l5I8u7cd2Ddm0hwXpwpw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=SIQVxFpTq+Qht5yJuDGQCkr1imvjab7rRbjRLzt7arZviAjoTnA06TDtrLmgHbz7IAIjNROcGUShmmFVNUpw5MF3PlvtWSjK77gxtcFWBr/PdiNIUOZN7BPI7cQFRU79V47JzsJtPtpvYkdjnAr/Q2vIm6chCcOF0GinA5HIVNlORIy86CtJtmj2wdzCaA8TPOEFD0vvc3mPNqqlLEato60aXMByqIzbUSgQG+o/T+qlpl7M1b3zfmJZo/OalILjXP/f/OztnHUI6N7EmOAWBRzi+nL2ZnoiYIcGwbCNDGulgx5hmmSZmErKBBeq5Ic8U8e1ScazG2UGZLV6DF3HRQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=XFPiHdNn; dkim-atps=neutral; spf=pass (client-ip=40.107.209.49; helo=ph8pr06cu001.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=XFPiHdNn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=40.107.209.49; helo=ph8pr06cu001.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012049.outbound.protection.outlook.com [40.107.209.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dmnQW0MWhz2yF1
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Jan 2026 12:30:10 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K/KTeJNnSWKvyh3PNgCX/b+qCY5qczTIl2lkkuxsBmUQGjX1BV2nqSsPqOYdfAIWzk+Fq/f3sOicOvSKjSYQDdaSxXZ7pQdhfEQL9RkbHU0Hfpn7pY3tv+xMmw1ZrlPT/kOfj1HbExxBicrj9mLMtAFOc6Am/dr0datwe4+c9DeTd9VZX13xt2QTTppo4T4CY64qKcjYWmJIclucVB2RMUiVWNL6USO2YChYWiyytfawNB3B5Hzg6KM6k5OLkoWHfog4jBV0uiI6vgrDxPQbwvW6goWSj9NJrwiDD2yevP26jLaJu28DNrC5YrMe5zBOP3KCZGIxSVEG2830NjgHdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JZM5g8Fsm40lY9IKMTZ9GP0l5I8u7cd2Ddm0hwXpwpw=;
 b=DfDFjp2ZIP7KCQDQXAyPa3MEphiozk6W5EAQSctLC+OlK0FO1pva7Jx3U/sRQWpPKavZotjPX5ipKFjnuPF8AAkH/d6KLXn5YKSysNfLYhIQAigOHJKyVhNFTkFKHhgvh4IQDQGx4fiAFdjrOnGTJ2KUN0NELul6q89vfmK8GmYgJRNN+Gy00nwPuw6TTzmVuiQpfvldp/rrdFofd2tSNE3c5Vinsc7L83lX8m8p4VZ0st5Msh26LBq357v55psXyqcLFoFoEzOytpKIkHEmtbP+Hz6YmeyaG1KQlOkswQeiL9hoGfcjgyp/jiuKzVdetVby+dpvrwnN+mhnTi4Kng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JZM5g8Fsm40lY9IKMTZ9GP0l5I8u7cd2Ddm0hwXpwpw=;
 b=XFPiHdNnIsfyNhnrG8qnVUQ/zVtAaB4jwCW/yvD/shqjGDqBMltH0UV/Nd/ny28fjWbSh+UPq2Hl3Kfqo8FF09Ip1PAvNHM58gphHyafiS9SD22Dl8zWnYFAQeKBGjwKOiaddGx6rmynBswmSVen3rLYTOTdigy2SfuVzbc3ZodXTJOPuIWrOD+rqmCxGQC2kzdYjWW+cuKQETz0y04xtiX9v2TvNUlUgNFEi9yMsY6g9D8CkHiV8bNxf/y6u1lmY8ecWnT30WbCC6Xuh4/emkKs43ubw5Cj7yrKr8109dSfpZhPi258YS9kdLQDdPASJ5Xh0onu9+7xJ/Qtjv+XRA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 IA1PR12MB7496.namprd12.prod.outlook.com (2603:10b6:208:418::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 8 Jan
 2026 01:29:26 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9499.001; Thu, 8 Jan 2026
 01:29:26 +0000
Date: Thu, 8 Jan 2026 12:29:21 +1100
From: Alistair Popple <apopple@nvidia.com>
To: Balbir Singh <balbirs@nvidia.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Jordan Niethe <jniethe@nvidia.com>, linux-mm@kvack.org, 
	matthew.brost@intel.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	david@redhat.com, ziy@nvidia.com, lorenzo.stoakes@oracle.com, lyude@redhat.com, 
	dakr@kernel.org, airlied@gmail.com, simona@ffwll.ch, rcampbell@nvidia.com, 
	mpenttil@redhat.com, willy@infradead.org, linuxppc-dev@lists.ozlabs.org, 
	intel-xe@lists.freedesktop.org, Felix.Kuehling@amd.com
Subject: Re: [PATCH v2 00/11] Remove device private pages from physical
 address space
Message-ID: <xbyzuogb4axcl26dozux5tahoj64mgfgweiq7ppelvsl7emzu5@ovvqsjm7xyue>
References: <20260107091823.68974-1-jniethe@nvidia.com>
 <20260107120608.5ccd2cc7e4227d2e80028bd9@linux-foundation.org>
 <20260107205404.GI293394@nvidia.com>
 <c288bda8-66c4-4971-9322-e1450855f93b@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c288bda8-66c4-4971-9322-e1450855f93b@nvidia.com>
X-ClientProxiedBy: SY5P282CA0125.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:209::14) To DS0PR12MB7726.namprd12.prod.outlook.com
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
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|IA1PR12MB7496:EE_
X-MS-Office365-Filtering-Correlation-Id: 6725c405-351d-48b4-5771-08de4e555c4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7AZpyj5dOVytlkNmYpyNxaikPSbJyUMrte3dJaNSnqsdZUlaGn+Q9eH6lyJ1?=
 =?us-ascii?Q?oAgimmj87BnZ0yEVhF6TcUcpDFYGASP1d0xSJLWMAsowCwm/le8+YFVw7T1h?=
 =?us-ascii?Q?KVWeTn6wXimwghVS0ksLDIlj6QK8l5lRAWl8fZpY5MHxDRpBjeg0Zts7MOE+?=
 =?us-ascii?Q?nVuexwJ5alVKX48NKBU+89rXzeleMZzl0qW1dwIvhhQihCHYGeKItnDfZ5GV?=
 =?us-ascii?Q?vm43lnWfcRIs3E5wg0Sl2s4EPe8Ry95iRCLksmnNFHRPtlK0IjePF5G4twJL?=
 =?us-ascii?Q?kDroPLYX3mklD8usCkViGiKvBE5x1M/eAR/ay+4GT+E123ROLapA4B2Q+CvB?=
 =?us-ascii?Q?JfvhboYCAsPru5fZ/vgo9koGt7ATXRDWe20oLFS85RSSenc9Nyz+/pSb7VGB?=
 =?us-ascii?Q?CYyGG/sCHP1zmp1Z+54BJjUTdw6Fbc3aVpyw2OiXcbHIRM5fmLwxldKJYAb/?=
 =?us-ascii?Q?LFjGvhsiFFkD/pORXr7loCSsALpiy11XGb8Htsa2OGXhh6SByV+ZjH+9Xhql?=
 =?us-ascii?Q?hOO06Nr5ztjecu5TF1Ks8vfGH81ejIY1Z1CthT7eqx44cl8hvZliLIdjQoxd?=
 =?us-ascii?Q?C5MNMfgNQWn58hcSTCh7HNIGxO8ZFUUtnEOP9WBgcU8jobXD+2tYpG1qN+n6?=
 =?us-ascii?Q?mS1WyXdxItvZ/p1UNgWi+Qlw/VpYyWCm8pMhBGlG7zu5x7BEDEzEZB/bhBGB?=
 =?us-ascii?Q?IAdMWISKq1/xicuKe4AhYnLZHOnQXKLHx+K4i8l/Kwpsgu3nbVEYyAOGiXA1?=
 =?us-ascii?Q?vCqaLO5OkIlhiSM0VdNge5hRG9CXdJCQQ9oL0KbtGFsRS76vpxtAp6WSqTOA?=
 =?us-ascii?Q?hi0kmC9KdaKF0mE3ArUzmQnIrFCMH3YM0ZmVlkcYxEq3OyCncfFHTk9HmZhY?=
 =?us-ascii?Q?krDSoiSMLECmXdVyHiAv/3yqXtmQ/e+ijqcm+ojwNHK2lvMYq0V4SahL3Ubq?=
 =?us-ascii?Q?xBGQHg2PMKEkNxr5mptn+DcGZsEDbfymacARSrdrYHPueXv64PAJzBNv72Wl?=
 =?us-ascii?Q?aOQ2iBBog3v5dMlvdO7BjTADz6ff+l1jgH1s0Ktnm9paa5qEi0ZiaDNC4q3W?=
 =?us-ascii?Q?B9jzLZyKP6VyZ7W30QVGAbAZQkVc2Gmf1xxUHOW9NZjpF4M+4DxaccELbTho?=
 =?us-ascii?Q?tXDTGJMCGjKbVKPuppcNnPPY9CJFhhm3CRTjqCUqh52VXJxk+pgp67ogsrux?=
 =?us-ascii?Q?BsLKpgr6aCRjvg8mRelBJl2cu1oExVHCM/k/8jVcN5PbhuQdy34Qz/oVtgmq?=
 =?us-ascii?Q?oRD9cZyHID+589qwsB8DxEedd6Mo2B3hsUi4o8b/SO2GR+EdmlZt9Ae2E26n?=
 =?us-ascii?Q?b5qmTiAsoJiRsxrDbJ1mcs8kIPL5AmCnf11oYnaDZU1ihOMsGFwf3JHhS3jh?=
 =?us-ascii?Q?rMydxplsEHmi4zMp8LS1PjZepWxFTTj9omY2k2QZBNzsiEZPAX6dCZJFzLvf?=
 =?us-ascii?Q?R7Jepy7whIWpy7vV8zPXoNWDb+gXeHdHVAjfwdzlbdE+hK6ulKK5pQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ge+qKoeoN5aOb30shbTPBSOp8YcSnogKad59x3vEyzvIkcCjFn3JMPG1WZMJ?=
 =?us-ascii?Q?NMfzde25HX+arpAkDAM5O1MUUTntPU+apKpNnLGk51jtR7ntNbdcMBwem6hk?=
 =?us-ascii?Q?rH479JRi2Wcd3/Aez97zwsDmkdL3U8FN252hI1m8sS5NFiYB3Rr5Pk1V1n1y?=
 =?us-ascii?Q?wNqSdAFGnnZcn8HHYB8I1p4u1jrOM0l75rym0v8m2a9dWDCr+1v1WHnkAgon?=
 =?us-ascii?Q?VXtMAWp898PskpchsRJxCbhQOnGWZo0X2uDH5szqd31Ix1sjvoHUg3iol4YA?=
 =?us-ascii?Q?N9J00gCIYkMPmRTwBBysz5m+QygEpdOqdVo+TBgzdsrrvOQfQsOzdSCz4KFh?=
 =?us-ascii?Q?gyCBEzpCirPMHcsoujP16otBp8mkwRE6PEeejomLG6x4QEekz9b+7I13wjP+?=
 =?us-ascii?Q?T1cOaBUI8YvOn18RIhqH0wT8DGJ7tcwGzGEUxmhluiU2hQHjLOZBta+IYNv5?=
 =?us-ascii?Q?a5f/sPAaxg32ZhQPCv0ldeQjPQkuzo3IV62Wlh2AkSnzIMNTBec4UuQTDbBK?=
 =?us-ascii?Q?cdAHBNR3Tk/g453J259tWvpCmT/j1r/0r4oaMa70ksMURD/Ckqcf6nsYIno4?=
 =?us-ascii?Q?IxSZ8wiUDz3wD+iv5prAixush9s1E1Gtg2FLGvTEcURgMPYEkIniuPet/Wto?=
 =?us-ascii?Q?kujv0sruVjYpFg01SjGiAh2wCPMLU4ACs/hDjubUhF50xhN5MF63YC71Ofib?=
 =?us-ascii?Q?wWvHeBOQdkYX5WTh+I8XQ8LQ6wJnF22scJZ5Kpm3y4WBXKEnf66bohGFwNbk?=
 =?us-ascii?Q?R9OhYXYFvCA0RDmW8Mqt3jJtsUJqBB8WdYUu/Z1sNmkHLFoGjtmKU2TG0R+B?=
 =?us-ascii?Q?dXxwO+hWgr5ZpaMcveX5nL9ZtYirZ0enfAz+1hZsAt1giMGknk4xsxWa2b5Q?=
 =?us-ascii?Q?H3eqDYcRWQQh4udAGiabhpllh++qeFEUOJX+WI/6wiuaCJWK290ozuPZSaKc?=
 =?us-ascii?Q?KhAsBbq+JK+c7Rds7TisF6iZ8l3BjhlQkJaOon1zSzGWhv0B46FsF7SEx874?=
 =?us-ascii?Q?f/rsmiPe4YW+SEXfAum/TLMuRI2sBhHLKb4vMf/OkfXqbd6aaZuma4rdh09g?=
 =?us-ascii?Q?ajP1a2MEfxk6R1nUUlbhQAXf6wCGHUSqwbezkc5esF2+eFzYucgW4fqd8C8/?=
 =?us-ascii?Q?urHnPm3GAwVzyWXJpUN4L6kfzVhS9TWRNW3IOmIpZgefVXYqa7g1ZmrhO3kg?=
 =?us-ascii?Q?fcKvWLqe2u+h+CQV53EVC95TcXeb7qZXG60MWYxJrLX0wFPcFqZqNwlnk60g?=
 =?us-ascii?Q?Wqy+CnW1zTA6kyRin7t7rvnMQ2uiQuEuRHfKAz/MvoLLkJviVNPQN2UIzBVJ?=
 =?us-ascii?Q?A8X1ZCqKfk5yJ4m+3kDoVXBUwPf/LmK6bNmN/OBK5z5Lc5Bk8TqRbduBVlfk?=
 =?us-ascii?Q?CXf9Fl+zoMW2p/aR+Xu0B6XC+LEk/ufZMK1XbNVgqAMyMltjp8TWO1X0Tgdg?=
 =?us-ascii?Q?i4Tc6NQSAvi4gFhxZG3A1QNpvzCBXxAE/Ax+myB1LLXYt5Ysw9ak5XGjCl5t?=
 =?us-ascii?Q?IV02OaZtFQeeIa2vzSIw08hxYWktp7SxPtzfwoNx03CXy6pDzOgSv+rjTY+q?=
 =?us-ascii?Q?N4zdjgxxtVI4Ic4dbWbR4ScosyhknYOiEm9XHuwJn+AUayxlnxjUChbdN/T4?=
 =?us-ascii?Q?82pZbO2cnCODx6uMeeBI7WkOO43vd0o2AbF6MpYTHCPc/aoMlsdJ7gmvIXkO?=
 =?us-ascii?Q?hJxw/FfIRm4QCCx5zRyvDiEakhtxWVK0HECIw4rlF9qk0gzbNdCK8v9h7cGn?=
 =?us-ascii?Q?oG9Wkic6iQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6725c405-351d-48b4-5771-08de4e555c4f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 01:29:26.2648
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qYCZ5kIZbhTVJ445SVL39CbzaWOOmexftEqkpj1dTx9ZUdX45dB1W6UjmBnmUgUYAX4v0TkkreUha/NTqLrkow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7496
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 2026-01-08 at 08:02 +1100, Balbir Singh <balbirs@nvidia.com> wrote...
> On 1/8/26 06:54, Jason Gunthorpe wrote:
> > On Wed, Jan 07, 2026 at 12:06:08PM -0800, Andrew Morton wrote:
> > 
> >>>   2) Attempting to add the device private pages to the linear map at
> >>>      addresses beyond the actual physical memory causes issues on
> >>>      architectures like aarch64  - meaning the feature does not work there [0].
> >>
> >> Can you better help us understand the seriousness of these problems? 
> >> How much are our users really hurting from this?
> > 
> > We think it is pretty serious, in the future HW support sense, as it
> > means real systems being built do not work :)

There's actually existing HW that could benefit from this support - after all
there is nothing stopping someone plugging a Intel/AMD/NVIDIA GPU into an ARM
machine today :-)

So it would be nice if we could support this feature there as it results in
really sub-optimal performance compared with x86 when using the SVM (shared
virtual memory) feature because data has to be remote mapped (ie. accessed via
PCIe link) rather than migrated to local GPU video memory.

Having the kernel steal physical address space has also caused problems on
x86 - we have encountered virtualised environments which depending on specific
firmware/BIOS don't have enough free physical address space to support device
private pages and hence migration of memory to the GPU device, again leading to
sub-optmial performance.

> > Also Willy and others were cheering this work on at LPC. I think the
> > possible followup to move DEVICE_PRIVATE from struct page and reduce
> > the memory allocation would be well celebrated.

For reference the recording of my LPC presentation covering both this series and
the above is here - https://www.youtube.com/watch?v=CFe_c8-tEuM

The hope is that in addition to enabling support for this more broadly across
other platforms/architectures that it will also enable further clean-ups to
reduce memory allocation overhead (I almost convinced myself we wouldn't need a
struct at all ... almost)

> > The Intel Xe and AMD GPU teams are the two drivers most important to
> > be testing this as they consume the feature.
> > 
> 
> And the ultravisor usage in powerpc as well (book3s_hv_uvmem).

As does Nouveau (which I've tested). But I agree AMD GPU and Intel Xe are the
most important drivers here. I would be surprised if anyone was actually using
the powerpc ultravisor, and I don't have access to a setup for this, so unless
some PPC folk can offer to help I wouldn't like to see testing there hold up
the series.

Especially as I believe most of the driver side changes are relatively straight
forward.

 - Alistair

> Balbir

