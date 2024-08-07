Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8EC994AD78
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2024 17:57:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=HYkkRPDb;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=NuN5zFGt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WfFDW4hSFz30Sv
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 01:57:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=HYkkRPDb;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=NuN5zFGt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=liam.howlett@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WfFCr4ZBTz2xSN
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Aug 2024 01:56:39 +1000 (AEST)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 477EBWG5002968;
	Wed, 7 Aug 2024 15:56:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:content-transfer-encoding:in-reply-to:mime-version; s=
	corp-2023-11-20; bh=5y4drrJC6nH5XZrauhVR8CF65CCznyZLIULfJ1G0ANU=; b=
	HYkkRPDbE3RVjzwpMCXs2nlkaJbMND2oc/Q96SfUzTH8Q8LWfw6qxeLCf3UQtIZY
	kf4cl4fhTdaydu+BkJR98bLP/R3+TXA35b5jWfeHgb7fAsAaV4obnm8vZH0x3rCa
	s2bdKXr8q64v7Ip+DkyzF1wCDFviyBb4+y6aeVkanGAftUM1kBkzufDQAQPnpf6A
	sUpm8YuVhpoS9zLFJCGNayfTckKK3oMPBloBTvqYw97gI3QFdCpPERhWDp50ytJp
	COCqiv51+fEng7d2ka5DxjSWPrlN2vDAerJqR00jXJd9dJnbVk0c5e/C2Bah2s5s
	U5ZbfOil5gVuugvpyAygAQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40sd3uqwcy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 07 Aug 2024 15:56:22 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 477FPkGH017079;
	Wed, 7 Aug 2024 15:56:20 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2173.outbound.protection.outlook.com [104.47.58.173])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40sb0bg2kh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 07 Aug 2024 15:56:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eodTcZoiP67S0K9zc873nwPwC6zITFDONiCLsR2Bi3ZmeXEGsI6tGm5CFlqgIqL3wd+NMX+3gTAaQx/7vOzTcYpHNeZan9R2ECEiN861+9D9xftLxY9Af2Ql7pt3bSu5x3Nx9M1ErTEBp4bzxowVp+o8cBfc32A9R3xvdsGL93I87mZFj5drhbYI5Njkc24LWUB10zHBuST12ll/DKobWYepEqceghj0LtT0PbC37hVgNC9i6NaKMdSkKokyW9lZpMUVDyjEClezanHymKtbvYocCzmERlOIwz8hDS6AZY0ANq2yzpn2dK7xWnnoKn7gRbW4zHR8QAgg2ZBjpk0e9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5y4drrJC6nH5XZrauhVR8CF65CCznyZLIULfJ1G0ANU=;
 b=csdOgMY1B04k/GZXsEWm/rncu/1iWIZD2MPv0gk5L4x9RqHLb8XVUgY/Kfvs3Dea07zMDC8c6+6pc9eoUui+LMWTDFaAYPl14yYCP+cvJwqqBbvulBD7fjGYcjQMh+/xCxO71rdDza7ai5FA28QfA7xradVRAkvimQsO/TTNkv3zthttMjZJdPyCddA6qdNi3CfXmJkB9uEgoirMwspUVswOoaUJc/JwZqu+qIUZ3bsWC6110XkUnStg5CdYEhbnrRqK8A5A5A8TZm3b2ndZtSzWKPtYrenT1LVzPFbHBeHszo4FxUxamMgHQZ3GdH+HS9LhPmaHgM/bRrtJQdDICQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5y4drrJC6nH5XZrauhVR8CF65CCznyZLIULfJ1G0ANU=;
 b=NuN5zFGtlod55iUsJBh2fgh4GsGBmzdDL4+bwDauckQ3eug6JYyI+aqdhwDwEgXfenKp9LgxY/SJX5sqI7Kv2QZmKG26spWsUvX0XLxLaP3YGlm9S77cjam3g+Eq2exEayqV3gjT8PQ7tqb6zZrCaxD7ndfg8devakZOoy6Sw3w=
Received: from DS0PR10MB7933.namprd10.prod.outlook.com (2603:10b6:8:1b8::15)
 by MW4PR10MB6419.namprd10.prod.outlook.com (2603:10b6:303:20f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23; Wed, 7 Aug
 2024 15:56:17 +0000
Received: from DS0PR10MB7933.namprd10.prod.outlook.com
 ([fe80::2561:85b0:ae8f:9490]) by DS0PR10MB7933.namprd10.prod.outlook.com
 ([fe80::2561:85b0:ae8f:9490%3]) with mapi id 15.20.7849.008; Wed, 7 Aug 2024
 15:56:16 +0000
Date: Wed, 7 Aug 2024 11:56:01 -0400
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Jeff Xu <jeffxu@google.com>
Subject: Re: [PATCH 2/4] powerpc/mm: Handle VDSO unmapping via close() rather
 than arch_unmap()
Message-ID: <gtz7s4eyzydaomh2msvfhpemhiruexy53nutd3fwumqfpos7v5@4fnqun2olore>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Jeff Xu <jeffxu@google.com>, Michael Ellerman <mpe@ellerman.id.au>, linux-mm@kvack.org, 
	linuxppc-dev@lists.ozlabs.org, torvalds@linux-foundation.org, akpm@linux-foundation.org, 
	christophe.leroy@csgroup.eu, jeffxu@chromium.org, linux-kernel@vger.kernel.org, 
	npiggin@gmail.com, oliver.sang@intel.com, pedro.falcato@gmail.com, 
	Kees Cook <keescook@chromium.org>
References: <20240807124103.85644-1-mpe@ellerman.id.au>
 <20240807124103.85644-2-mpe@ellerman.id.au>
 <CALmYWFsCrMxkA1v58fJxtyGR15ZGxmSP8x7QC=oeKwzcwGL76A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CALmYWFsCrMxkA1v58fJxtyGR15ZGxmSP8x7QC=oeKwzcwGL76A@mail.gmail.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT4PR01CA0255.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10f::8) To DS0PR10MB7933.namprd10.prod.outlook.com
 (2603:10b6:8:1b8::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7933:EE_|MW4PR10MB6419:EE_
X-MS-Office365-Filtering-Correlation-Id: b9852ff5-1722-45ce-3407-08dcb6f97338
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 	=?utf-8?B?RkZkdU85MnNZUExjSmpmT0daV1pVTUVGdVdha2lYZ3dvNXFNOGZlQlAzRUtD?=
 =?utf-8?B?bWFtekpwL0RmV1daZDlMM3JwK1JkNEJzbkJib2huZEN2amFTYnVTejh0bThP?=
 =?utf-8?B?eFl2eTlhQTVmUTFMbFh4cnIvVE5DRlNJWndrR056Rk00eklMRkQ3NUFpUHJn?=
 =?utf-8?B?UFEwanNHeVUxQXU3V2hHWmxqRXo5WWE2bU5GdzN2NXllUmJxVDdhbk1BNHBD?=
 =?utf-8?B?NlVGZ1JVeTZBSkl2Q3JkaDN5QXhpTklVMnAzU0NYeEdJMWVDTHhBTVRDNXFF?=
 =?utf-8?B?NU4rVEdLTzNjUTIxaXZXdGx0KzBSdDFjdURKWUZZaVowZzN5dHVZbjFGNEJw?=
 =?utf-8?B?bkRJQXVHQnhFeXBWUFl4Um40Rlh4a3YzaUlCbUNGQ1J4M2tvTkFaa0NuM0dV?=
 =?utf-8?B?b3l5R0FtcmdDREJ0UEJhaWt5bnE2WHZyaVFKZjJaMW1qUG16NnVRMGNpWHNy?=
 =?utf-8?B?V2N2U3ducUZLa3pzR3FjbGtMeHRHSTJGN25kME9IRTdjdXFFdURyTEh2cXJI?=
 =?utf-8?B?eWFrOG53eWxlbExYc0RJR3lGc2NyNGhyQmRiaHVkU0VMSklNaUVOQWRWYVZU?=
 =?utf-8?B?bjVsK3JFVVlWa0J5RkZBTVpRcENybExQbFV0WktzQ0Z0bVhXTXN4clBHalFn?=
 =?utf-8?B?V00ybWpQVVczMG1FOTNvOWFQUGVtQzE0b08xOEQvTDdJaTRLTldQUWtCL0d0?=
 =?utf-8?B?WkxkRDBSR3YweVpNZGpGdTJycnZSWUxnSU1IVHUvWkJaNERLRlNrdUx3dVhF?=
 =?utf-8?B?VzJSbVZ2NjdhTnlYZTNsTXBDK2ZOZDZ2cnE4d0M3bnZtNFpqSE92bjI4MjY1?=
 =?utf-8?B?aWdhMGVQc2hMcThvY1kxTEZ5MlVrZWdJZ0VERWU0SlZRSC9qZW5kNVRUcDNM?=
 =?utf-8?B?Z0EzMUVVdmk0M1RpZGNoOEY1MkRFUWpydTIrYnpmQXJZOFJkN0dmQnMzOXRr?=
 =?utf-8?B?SnprQzg1bkNFM3lVbzM2TnBtc0l2bFQrZFM5RW1nVUI0ZUkvS3F2TkNPNW1P?=
 =?utf-8?B?cWxlOTdCYnVINkZ6R3RKRkZVY0NTVWR4TGN2RzlTSEk3MzlVTnQrK25abUxj?=
 =?utf-8?B?RTJ5L3NRczFSZUpZMDVrL2ZkVUt0NGRoVXlFOHRFRWNhRStzR0pJbG04NE04?=
 =?utf-8?B?czZ3cXZTUlZWY0t1cHRrUFNRMWhlUUpxSHN5WjhaQW5LYzlRVVI4U3F2UUU2?=
 =?utf-8?B?ZTNVSkRDdWRKam53NlRsd3piMkdoaE11WWlHWHNsMUFSa2hDanlUazdGNVox?=
 =?utf-8?B?dkk1VDhhcE1uc0xXQ3EvTWpQeU5BSlJMZkp3ZU9sM3YyNitQTXZQRU1NS2d0?=
 =?utf-8?B?d2NWRklJWm1YeWNPZnFtVHMyT2ZzOTFQRTBCaVl6Z243UkNNbGxsQWdTczZk?=
 =?utf-8?B?OWpHaDFDWlVMbnhLZXdDOXVWbEtxNmI1dUVKdU1GMktING5ya212aEZDQlZJ?=
 =?utf-8?B?YWRNSmdGZ1RpWUgrNzcyVXkyVjJUeFh0UXBTaVg5M2xyMHF1RWpINm5adHNl?=
 =?utf-8?B?YVpuQmo3ZEYwWDdva204V2VIRGh3bXZMdUFTR2lUbThqa29Za0JCL3RJOTdU?=
 =?utf-8?B?K1oyMEg4cFBJOUZSTS9HZU52d2w0MHBjZjM5QXVzVzJFMUdmUldLbG5UdHBu?=
 =?utf-8?B?eXNvcTBZb2FvcGZGZFNLZVB4RDA1b2lHY2xxTWg0YjRyUU9pYU9TanBHSzBN?=
 =?utf-8?B?Ly9MUVpDR1VyVHNpV0U5VlRYTUIvZDBUWS9wd3NBdlY1M21JaXhrWXBCdWlK?=
 =?utf-8?B?UVVvZTZqMlVpMHJhSHZ1V3h5TTFRcjV0VVh2a1hpSDRNeDBhTUJ3c29yNDhE?=
 =?utf-8?B?SW9tL0x4QlVOOVl5UDZzdz09?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7933.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?Sy9ZTGdIaHlFMzVrRCtWTWNXOTk1bGN1dXVtTmlQbSthU2NmTVZ0aDFYSGU1?=
 =?utf-8?B?WjdKOG1PMTFqL2syODRTakJPUHBtNlpqekk4RCtnZGpHZ3pCLy9NVFlwellN?=
 =?utf-8?B?Zm5ySU5pTlVBUmhFMkJoSzFPZmdFcVVaK3c2OXQyZTkxUmttd0RDUjZDU2JT?=
 =?utf-8?B?REdUTTlBME8wcjM1dllRUC9BMEhDaWEzRGx2Zm41VXp5bEFBS2JHOXF0SWNY?=
 =?utf-8?B?OFBzRGpkUzlzblR0K0xxdjUzdG5oMWJxTXZXZkVtVGJ1QWJHcjZLTEl6KzFO?=
 =?utf-8?B?eDdQZ1VNR1oybmhjTjdpZjBaY2U0UVA4VFNMZXg3clBOeklUNTBnK0RuS2Nq?=
 =?utf-8?B?aCtBaVlVUVJkbldQdXNsbXNUdmNUZ21lWTd1Ym5zMEJhbi9uQld1YWR0MEp0?=
 =?utf-8?B?WmZMcEViSnloa3IwcVNDTjdxQU9wSzJweG54Sk4wMGRYVEpUaURnYXVmcXRL?=
 =?utf-8?B?V3pVWStydnFIbVQyTXRCa0dQcVpNOU9Xd3NGSjJzSjZrZDhmenhhUmlYNGRB?=
 =?utf-8?B?ZkVRbzdxOHZQdVo0RUtVVk5rbUN1dmdOR2tXZUNLTXRvY0FHend4RHNpKzZ6?=
 =?utf-8?B?MTZNd2dYaWM3SE5qbWM2T0kwZDZjRi9jMVY2RUNPMWdjY05tK1pPeis4cWds?=
 =?utf-8?B?d2dJRUFaNU5tMW9zNEtCR1kvZTZmeGpaNUM4ZGk2STN4OWJpMlhZN3J2QXdT?=
 =?utf-8?B?Y0YzQlpqSnZvNkxxZk1kKzNoOGdGUTJBam9Ta1JpYmtHZjFJZmJ1YUxWdzR4?=
 =?utf-8?B?UW5LVFhDb2Z1NmRVcldhNENFSTF5QmFLYU9EK3BMSVNIaW44c0plbjBqeGhD?=
 =?utf-8?B?ajBnWm5lcFhMWDUwME9iYWY4b0JhZUJZK0d4QVdGN3hlV0gzUXA4Ylh4Y1A2?=
 =?utf-8?B?bmFCcmo5aC8xeGgwZkFSd1NpWXV5eFg3YnpDSThHSnpuTEJsVDluWWFHWllI?=
 =?utf-8?B?MEVudUE1b3pnNkFsUlJvMW9Pb0pzTFdleXpsRzJkU2lGaEFYZEtnRk93Zkd5?=
 =?utf-8?B?aTJQcEYzdk9TZ0g0aU84emJyZTRLMVFKRitYS0pMYVcwemN5WEhiaFVMd1lz?=
 =?utf-8?B?ejUrM2NicUcrNnNlaFFhK1FxNlg0R0s2YmVHZlgvVnBrcXZEWXJhdEk2czd4?=
 =?utf-8?B?ZHRwdExqMnRYdjR0QVZCS1N6cXl1UkxDcWdLZ1FRUEVsQ2VDNWorTjNLYlIr?=
 =?utf-8?B?SXNSbkpBaG5zdU0zUjZCVjNjYzgvVDRvWGdXdGhOM3NJa2dYQjA2aEdSZjhq?=
 =?utf-8?B?OFhGQ1VqV0NKRzRBbkR2ei9OSEl0ZEdNTm1wQmJTM004OVc0WWgzaHN3ekho?=
 =?utf-8?B?WDVscjhHQmp0M01jazdsQjl2Tkp4UHlZSkIwcnQ4MTN1eThqSS9zRFk4ZE1V?=
 =?utf-8?B?WCtCaU5NYUlITHhjSlNnQnZXSmhXc1pxM2NtYXNzdGt5Y3JNcW1hM0VwZnV5?=
 =?utf-8?B?cHBFS3pYaEpTNUFqUm5NdE5xMzhiUGZKaTZURExzK2E5OWFocmRIVUZ4SlhH?=
 =?utf-8?B?OTBySlkwTmw3ZlMxaTRGZjdZdDRBejZENGpGMzFwWWNFd3NOTXk2ZDdxKzJG?=
 =?utf-8?B?NDZMaFVLTy8rREc1UjkvZGRYbTlQb3diYkFmZWtLbjdTOGszMUwydDhyMGdN?=
 =?utf-8?B?UUJVWWFNemp3dFp1dnpxVC9nZ0dmWjJYZTdvNFlValBRUlVkeW5hcXpaejBo?=
 =?utf-8?B?aGRIOThEL3RhKzdDVWs5V3pmQlR1RkJaSnl6cjRRM2lwWE45RTg1ZjZ3YVRl?=
 =?utf-8?B?Y0VMS21IVTA2QitxRDlpVFhpU1JMMWFDYWhaa21HZEJKVHUzUGJ5ZDZ1azY0?=
 =?utf-8?B?VWhsSFRaYllxUVAwcHZGR1ZTcUJXWWRNRWJuWXljUWxXODhCVytpdU1nL2J5?=
 =?utf-8?B?NkdWdmF1NzNvZFV3WnhZOFZjQVByb3YvYmwyZ1ZTOGQvYmRxYmt6eStTTFZO?=
 =?utf-8?B?VW5sblhZUDh6Q3pDMUFOK1BCZnU0M1FJVFgvaUlRZnR0RUlldC9GV292OEE3?=
 =?utf-8?B?SjZHT2lxQk1yaDNsSktrNDM3bFpUM1lldzZtQkR0VXZ3b2RmM2x1MTNRU0Rj?=
 =?utf-8?B?aXhUczVNek0wMFdLNUlWNWhnQ0lDZnZCMUZ5WWtWR1Q3R25kVllaV1ZZeUFU?=
 =?utf-8?Q?LuaNzIDnWlViJUg1ig0vaLTgM?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	HCWUgEFQTTRnuunBto7cjhYsjHNVxluX5RXszIM5LqOQbaSK4JZQX+RSTCEBMCR23eT1sMJKQPzmf/cyqKH9K9fhuYsR5XErpfLkg6yL+UcK3fBav9108Sy23HNpQawCW3EZjTKMyHNF4EMC+ievVwpsiyJIr5DbrVL3FkCPR4+UCHESNMhNqfbDd1ZF6JaF1V6hMHNOff9gCXwDsEZSNhQ/lHviVQSM7Luk1S3TxXDrJsII+7c6RvATB3+62azwdFx8zJWMEJE6WF7svAEXAHBdiUK3oR4GMjgxX5xmxyYafhrdO+q+QwN2vdd4FXj7OXDTfQevhbHeINmQzWxUC3sfVwzJDXmLFx14gOPTkYW/n2KsyS6TjuKPK8WP4j3201wbSgsHpMBNiRzua8R/XSNrLgn6eXJB6M1hSMr/LDmfQ2blk2quHJK2SRbdujd/utnD2p6eNt7X0HtgLUOrFatqOseACDICKOKspaSRZD5YR3a8H6e3LEngy55atbEeIOfAo6euH5hR8nxoRUAYBnvrY5X4w/AsJwCuI/AyuZ5WH8ImrgGRCao2QRhEu8sxlUfZjfdHSsiD1FmrewzBLe+2ZxQDWGU4RCnJsMSnBVg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9852ff5-1722-45ce-3407-08dcb6f97338
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7933.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2024 15:56:14.4265
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Hy9y1aBIicVdQu1yTop78khVtxY5qXaTamrOSlCTgdCA3mUVaAOrXuJQGGNj5UY/m5lfoNqfXXN+QU8fyqojg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6419
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-07_11,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 suspectscore=0
 adultscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2408070110
X-Proofpoint-ORIG-GUID: Kwepkv4goQSDPdmop4NZ9pw3vFKnpiQF
X-Proofpoint-GUID: Kwepkv4goQSDPdmop4NZ9pw3vFKnpiQF
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
Cc: Kees Cook <keescook@chromium.org>, jeffxu@chromium.org, linuxppc-dev@lists.ozlabs.org, christophe.leroy@csgroup.eu, linux-kernel@vger.kernel.org, linux-mm@kvack.org, oliver.sang@intel.com, npiggin@gmail.com, akpm@linux-foundation.org, torvalds@linux-foundation.org, pedro.falcato@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Jeff Xu <jeffxu@google.com> [240807 11:44]:
> On Wed, Aug 7, 2024 at 5:41=E2=80=AFAM Michael Ellerman <mpe@ellerman.id.=
au> wrote:
> >
> > Add a close() callback to the VDSO special mapping to handle unmapping
> > of the VDSO. That will make it possible to remove the arch_unmap() hook
> > entirely in a subsequent patch.
> >
> > Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
> > Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> > ---
> >  arch/powerpc/include/asm/mmu_context.h |  4 ----
> >  arch/powerpc/kernel/vdso.c             | 17 +++++++++++++++++
> >  2 files changed, 17 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/powerpc/include/asm/mmu_context.h b/arch/powerpc/incl=
ude/asm/mmu_context.h
> > index 37bffa0f7918..9b8c1555744e 100644
> > --- a/arch/powerpc/include/asm/mmu_context.h
> > +++ b/arch/powerpc/include/asm/mmu_context.h
> > @@ -263,10 +263,6 @@ extern void arch_exit_mmap(struct mm_struct *mm);
> >  static inline void arch_unmap(struct mm_struct *mm,
> >                               unsigned long start, unsigned long end)
> >  {
> > -       unsigned long vdso_base =3D (unsigned long)mm->context.vdso;
> > -
> > -       if (start <=3D vdso_base && vdso_base < end)
> > -               mm->context.vdso =3D NULL;
> >  }
> >
> >  #ifdef CONFIG_PPC_MEM_KEYS
> > diff --git a/arch/powerpc/kernel/vdso.c b/arch/powerpc/kernel/vdso.c
> > index 7a2ff9010f17..220a76cae7c1 100644
> > --- a/arch/powerpc/kernel/vdso.c
> > +++ b/arch/powerpc/kernel/vdso.c
> > @@ -81,6 +81,21 @@ static int vdso64_mremap(const struct vm_special_map=
ping *sm, struct vm_area_str
> >         return vdso_mremap(sm, new_vma, &vdso64_end - &vdso64_start);
> >  }
> >
> > +static void vdso_close(const struct vm_special_mapping *sm, struct vm_=
area_struct *vma)
> > +{
> > +       struct mm_struct *mm =3D vma->vm_mm;
> > +
> > +       /*
> > +        * close() is called for munmap() but also for mremap(). In the=
 mremap()
> > +        * case the vdso pointer has already been updated by the mremap=
() hook
> > +        * above, so it must not be set to NULL here.
> > +        */
> > +       if (vma->vm_start !=3D (unsigned long)mm->context.vdso)
> > +               return;
> > +
> > +       mm->context.vdso =3D NULL;
> > +}
> > +
> >  static vm_fault_t vvar_fault(const struct vm_special_mapping *sm,
> >                              struct vm_area_struct *vma, struct vm_faul=
t *vmf);
> >
> > @@ -92,11 +107,13 @@ static struct vm_special_mapping vvar_spec __ro_af=
ter_init =3D {
> >  static struct vm_special_mapping vdso32_spec __ro_after_init =3D {
> >         .name =3D "[vdso]",
> >         .mremap =3D vdso32_mremap,
> > +       .close =3D vdso_close,
> IIUC, only CHECKPOINT_RESTORE requires this, and
> CHECKPOINT_RESTORE is in init/Kconfig, with default N
>=20
> Can we add #ifdef CONFIG_CHECKPOINT_RESTORE here ?
>=20

No, these can be unmapped and it needs to be cleaned up.  Valgrind is
one application that is known to unmap the vdso and runs into issues on
platforms that do not handle the removal correctly.

Thanks,
Liam
