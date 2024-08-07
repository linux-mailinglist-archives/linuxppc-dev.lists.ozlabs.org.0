Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 150F594AD6C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2024 17:54:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=KJbGtagu;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=laVr4Hrc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WfF8r08qsz3dFS
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 01:54:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=KJbGtagu;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=laVr4Hrc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=liam.howlett@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WfF873GZFz3cy9
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Aug 2024 01:53:26 +1000 (AEST)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 477EBYt9004888;
	Wed, 7 Aug 2024 15:53:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=Z0LvRFAq5vncv1/
	u129MGHoCWlObuI80q82rQMWKLtM=; b=KJbGtaguoVroKKof/4rG93IH+4PnHZr
	hFxxHXs7j/M94KZJrPa5YmBpL17VqStMd/DyrSBv2guqYhjbBrAgQnnX0YexKNJS
	vkF34np3P9yqeH4KfbW46KUQvlNhLgomj01NecxX9NkCtqBcRmlfUbLyZ+56wRd7
	quDQmJhE6Qzscpb7ev/32CV1p3REBk3TEPv4fbuC79LB+dUhniFH4g34kwV8ryow
	LTNSafvPqVx5ZT5u1qjnQY0ONFTnUMP+hLycMQsLFdkTfqHBIb8uoreJRUa+X6Xx
	lVfSIaRMBqS3MSATtNDwvaKuAGSDve8abpbIzCz2Uk9/J+hH2DW1jYA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40sce97tat-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 07 Aug 2024 15:53:06 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 477EvxZa034990;
	Wed, 7 Aug 2024 15:53:05 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2045.outbound.protection.outlook.com [104.47.55.45])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 40sb0afqed-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 07 Aug 2024 15:53:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GoKePrsidqiRuE+1SDkrFdCZVY5qqP+e2z1X9BuSDaWiIZCe6CDuitFZsSu16Sb4SFUflVGqvfjgFLEdrVrDwRCqkxX9hOTnYm3rcOHm7ToYHsGHKohEjedRQaC3k3AjKn6wtXj72v3/sIJDp/7urfxtZqh+nqJivfBBnmZIch/bbj3fpZXOCpJDjR5/eNWCn1vrQgpGFoupWGf0w/7vnsAp+bo2WotPXtBqyw+PXAZ+yv7ff2CfEevFNLJ0xi9b6yN0kmhpSYRQf4DQgtHNQyem06UgrbHrDtBasP+lVbU9SPjb1z+K2p6eQDfmr1mllzYBUM/fLI5pK/6zW+tv7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z0LvRFAq5vncv1/u129MGHoCWlObuI80q82rQMWKLtM=;
 b=OlIsHNAoTuR+l2dwSv34zYMzq76iRKKPBSO/e9NFF0dQI4bLFXudYDtvMYMOAVBed6tPmdaorPo9Zmb0ugoys6SjDuH0JZG8ejb1QKVw/fIjVjJ0RjR1ACE8vTrTyiV2KxCWTKC6h+rV/9NjbW3WPKDsUtzm1mvNiSfpe12e5v9Nfde9JUUQhuStSEahzqTg+n6Mm40cDXr5WjEhd9WJqFnXLtA7hZuJLD0OdClQNuN+hFwykDPHBEhae5jfZkVLHqCzxPjMfgkoMCW0/OmfuonDVGPBPfa9elh5diYvTlNZbkjzjyZHYS7nnUeM0GL+SEqVpcootW0/dtUy25Iglw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z0LvRFAq5vncv1/u129MGHoCWlObuI80q82rQMWKLtM=;
 b=laVr4Hrc2M4wJlpAPATiyBkVLYHhN8icybHPeiAn0eIaZoBItXYsOCkEuM5DK50KBV/n8PMHe+CpHOvJiM+E79y3bUv1Sn0RQqiizToXCu00AIEgq1vxhMTNqNdFUrlmM+KjdYOy7cBmCOA1AUECoiam7unVEwtUyEqaQhryU/w=
Received: from DS0PR10MB7933.namprd10.prod.outlook.com (2603:10b6:8:1b8::15)
 by IA0PR10MB7230.namprd10.prod.outlook.com (2603:10b6:208:403::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.29; Wed, 7 Aug
 2024 15:53:01 +0000
Received: from DS0PR10MB7933.namprd10.prod.outlook.com
 ([fe80::2561:85b0:ae8f:9490]) by DS0PR10MB7933.namprd10.prod.outlook.com
 ([fe80::2561:85b0:ae8f:9490%3]) with mapi id 15.20.7849.008; Wed, 7 Aug 2024
 15:53:01 +0000
Date: Wed, 7 Aug 2024 11:52:58 -0400
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 1/4] mm: Add optional close() to struct vm_special_mapping
Message-ID: <shiq5v3jrmyi6ncwke7wgl76ojysgbhrchsk32q4lbx2hadqqc@kzyy2igem256>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, 
	torvalds@linux-foundation.org, akpm@linux-foundation.org, christophe.leroy@csgroup.eu, 
	jeffxu@chromium.org, jeffxu@google.com, linux-kernel@vger.kernel.org, 
	npiggin@gmail.com, oliver.sang@intel.com, pedro.falcato@gmail.com
References: <20240807124103.85644-1-mpe@ellerman.id.au>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240807124103.85644-1-mpe@ellerman.id.au>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT4PR01CA0288.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:109::16) To DS0PR10MB7933.namprd10.prod.outlook.com
 (2603:10b6:8:1b8::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7933:EE_|IA0PR10MB7230:EE_
X-MS-Office365-Filtering-Correlation-Id: ded56f54-e1b9-4df7-5801-08dcb6f9041d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?8a3+2bwaA9l2AfnyefC2tyUx+Im4sRa2Lio/1V87DU17rxzPSyc1YSDL7udn?=
 =?us-ascii?Q?KDJ641UABlhVUB7aCGqdV8kTfn9cBBa11CtzC2AluBC5TfL/WoAohR09EEIi?=
 =?us-ascii?Q?JbfFbnemrABHyuB8Ttw9n79NbZRBpAXkbzIOAW/VywVWbuRG1Hk2appuEsK4?=
 =?us-ascii?Q?5us15WDckwjIEy5Q+oV9Cr6uAQNdWrrQYK6ejMiPHOoykZboAQw8i/qSYpt5?=
 =?us-ascii?Q?YaIuGrkMMnWBVHPRRPutvIHXR5LskzQXMBXE+EC95RgalXTHPNmG3dtti6Ae?=
 =?us-ascii?Q?MM/avG5cR1mWs8Bmar14MP/4xd+6Ok2XUja912EKUNTxWcNBhHgJVQrtPATN?=
 =?us-ascii?Q?XpJqaWvk3hAR/emB44sxEu47Z7BbwP00V3U2XMBgHMCQbr21vLQdaO9waAag?=
 =?us-ascii?Q?U3+Q30HchfJ8niNPzVJIHL/fIikxf9XUY81uO4HN0zVulY3WKio9hHQjQUDp?=
 =?us-ascii?Q?xJclmmX3EgObGn8TJlvoSfrTFJ8yrPKWrvdrigyPuADFrXNm7ZeYb8XbR4KC?=
 =?us-ascii?Q?axmxD0aDUMMK4M+r0ZqkIQkp4Ka2c3bmICOA4I5sxoWorX5/JQGIqdQisfbP?=
 =?us-ascii?Q?nbIiJTmaQRBS84+C5W6hiuxjIEgs7fYGnEotBYEppLaNPNODIDKIEyYM+uEp?=
 =?us-ascii?Q?Jjp/pj/rydB9k7SFnf3YrEN7dMlTver4GGePYS5qkI+d/nLoiWrpxnZmftnK?=
 =?us-ascii?Q?sQAQKPfg9Vw6L+7EKEQGnUsbygwC8EkiLWr/vzD8hQXsbYRrmH7QWP2HeRYJ?=
 =?us-ascii?Q?i7kivugb1c5LHAh/ZU9R30r2yt+FA9EnB+7t53A1lmTvhcm4XzJeiuXUlAKn?=
 =?us-ascii?Q?4pDXNf0hbghBXI5awtsOuZn9vxm9EWB4XafVjctzdHzvzNS+L/XHsDsEF/pU?=
 =?us-ascii?Q?qkQ9UMjV5/74gVKwKDwzK+TWiwHW2mycvv2PkWrWwZ1LCdI2Qos50lffrqP/?=
 =?us-ascii?Q?ZLRVSgI09nuPOKJM8ZnDjehJNQcC+EEiJfVAJZTj27JIpdLa/1XJSKoym8aC?=
 =?us-ascii?Q?2zBqwTUTr6hGypharqj2/KtifbnugGc+/Aw641h3zH8AsLPA5CY2NLYDl1Us?=
 =?us-ascii?Q?yL2hHZTW4OzOElCUr48vKJuJoiTa/Ft9QjhVhvDiWtV6evCp/zQA8CvcXLI8?=
 =?us-ascii?Q?6rk+zM7mXyMXmqu9u4u5hS4i+vICrzOKA7X8VXCkRJ4WSXztYdLPozuMpxj6?=
 =?us-ascii?Q?2UREANFNUY3/X8PnvNLimEk2D+S2BZ0W6+EfpG3KxdkCYV4xo9xWAw6qD6Ns?=
 =?us-ascii?Q?uxoZVZ7EXpqnQO7Ak/htNJVVgqH4BK1ql654PyVmUr/HzqqBw+oIwsPw6cCt?=
 =?us-ascii?Q?Tjp/vV6zQlvFO4o/gLHpomM3zeQSrS/MhHcU3bdqNdZEtw=3D=3D?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7933.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?wqmsZFstAtpanbvtnVkP/AoCIIEotCRSykjmvc/WGFQI9EuAJb7d+aK1UiX4?=
 =?us-ascii?Q?b+m3mgTkt8Am9DAC0zSCSZV+PHtPJjD6zOSvJNV4UJUwyQbyLhyBXkQY2BtT?=
 =?us-ascii?Q?or+/85LgHBXCAyAidbJa1fDsqRqHw4tOua3PMJy761h3yvrC76ddqYPPZuEU?=
 =?us-ascii?Q?5iabVp8BKqwTbsCCjC3DsayoYbH3IJ5DbrFS4AaXoHt4snC1JMzqg2bvaM5C?=
 =?us-ascii?Q?1BZr+wt+KH16vWK/w9oQ72H7Hfss9lCxnLub2XFcCcm/NlRhGkcflAT56JI+?=
 =?us-ascii?Q?8nVzU3GeDlcQGdDKNwOAPprpET/5FWpL7g0UwE2QPSkhSoeNx5dbIxILGyiA?=
 =?us-ascii?Q?kFe59097tb9pScJBqfytL6MPlqCn9cVlPZWSVIK/5lf2wBAl0G3ejv2XNPiI?=
 =?us-ascii?Q?/Dy7mR3/T8Z1E25ZM4MU0CO6CYuDtCFZn50yEewbk6x9seFf2uSv6tjlmAWN?=
 =?us-ascii?Q?fDVXSlYsG4u6A2yicAlYvU1arEzdSH+vgkB1zmry6qmLNh5Q0rnaQXeQgbMH?=
 =?us-ascii?Q?0kIsACrwLWtZpLDeQFejyOi3IQNnUwLIAIMKLWoH/UunisLxHwyEzi+CI9lt?=
 =?us-ascii?Q?jD9l7SXDNUxAzwlPeV334d9Y6sQm9S49NR6hA09sdFjp+/cFX5DF1Hz1q5Xp?=
 =?us-ascii?Q?YgZFvK70/uegRt214q3Jl5rrYwrPVpx6/yHycOpDPXhZ+yeU0JHKP+WgV5SH?=
 =?us-ascii?Q?oH8NKkYEkT13zLH2uJW0i17hG2kgQ3we+b4FAhwFJpogtVN7ih6B0kyYzbx8?=
 =?us-ascii?Q?vrNUynoNkfzbcvj5jnqxWB/y7Sl/3uPSoRarr7GkyRvzKlmIFlx9IZe5PcxS?=
 =?us-ascii?Q?jU3WNRKLeGjkgG7IUwOssw5a9GKHIM2wgo32R5U9ryduATMgFF6P1Cicqohz?=
 =?us-ascii?Q?YkL6knEpyNnOqsopL6iwEtnpAcC8qGy9mgFtgN7l5BZkqmrlJpWsmNqnETNO?=
 =?us-ascii?Q?sC4RP1jjrP5mgCayKiCddVKly2KLMV3x362nZ1CTUEXTbYWAHgxoWyQFU0jy?=
 =?us-ascii?Q?kWai01PD6tgqrDnYX+n2WascIHZGL0qT0uolNbsDUwmz76ULid/xg+ycCESl?=
 =?us-ascii?Q?YUYLhUam6P/BUzDhgwVS9n8J0qQfF96z66zclRlrgtPZ8gd43wtJp0ODom9a?=
 =?us-ascii?Q?0FxwNZnlV3uxQ3+Id43TMFpln5i+gc/OdM4W7PIk00VpkM+95TnDGwUhNj8/?=
 =?us-ascii?Q?J64Cvg8r1FlXiBKTgcCmoaNlCcFtCM0PjSaKwAipgVdo5xPaCx3Y/g7JV8I+?=
 =?us-ascii?Q?C6JrGflX+KDEH5CEn3OUPmEKjGmUoPplh51kBfocjM0TaS5MiE7maaVfHEKQ?=
 =?us-ascii?Q?uwb5qUmQntFYY/wHHfd6f+H/roHGmPikL7e2G5m2ySgNJeAkv14IBG3Ozixm?=
 =?us-ascii?Q?uIr3BreXels9xYekRgCyRKDAD7cSlDhu+4Tr2NG+rZxobCIwUCLmDmEKNL8A?=
 =?us-ascii?Q?aBQmzcI8OSW39WTSwwNVqcaasMQ5/GcE6ne7AU2ReIlEkMG+vk3aa+AoYK3Z?=
 =?us-ascii?Q?/A2fAkgcUznszwv8KAqWYRZSYyRKmllb5hWNgP980cMElvFspuTvZZ/TChba?=
 =?us-ascii?Q?bc+iTzoYZoHI3Kj/oQRBqjS6DF6rw9XRhIi7zAxT?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	TNGeFIMifS7ZIYAn3bLnj3CYRORY8D3bC8qGddxgvgSonSNBzhEOOz2UP26IPFzft1cESryfSrc0xYItNpXUTGhVNJ6tVgo5SAeJ5toVxZgq1IErnAEnIxQp5+dWOKswOJr+ZywFo5/b1MVR2IiOGf5Sr0ZB+Op1EgTbTbmGNMvZO+B+O8pwQC/hNVevzaX/fxOwaXB5N86bKvWGcaSPdf+KZlMPjfB2C30+/c9NROOD0Nn5VrC+vr6H0/wfHLL4BSDgwpMvCl5KWov/tFyd0GxyyYOoq1hupY06ibqvdPskt4Ow/3N77S4uSvIOtoFH8kXdTP3wcslMj7YoxwMlj57viH0gisOqHT8XzjP+AGRha2q3XtNBHkufklphd1MZTSWaan3Dt8EIufVYF3m18bz9oTy4njhF8gGkyIHwK1eQvC2Yf9R4gyGSzF/jkP8u5MtfDxKhjZWK92mA3Agq4Ks399g1uSNH3D6j2H2tQY/YTrYXNu0tBJxTnRmgzUKzUZTsMkwXzT/4ZuGT8fFId9CLjpvsK7MUJaNd1jh4QN2+R7gBS9dVc5grAu4wTRbLnGG9XuhMl+xiwMsICtr5CTn46YaSitRmqKkGzoD/n0U=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ded56f54-e1b9-4df7-5801-08dcb6f9041d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7933.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2024 15:53:01.3282
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JQBfWpQ33L6gsGOkng/be3ucBhoU3/IBAzCd2kC2NvBxudG4tqU5DjM9lpDQhNGzakBNlcY4MkC2AbagxIhXyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7230
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-07_11,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0 phishscore=0
 mlxlogscore=999 mlxscore=0 adultscore=0 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408070110
X-Proofpoint-GUID: eJ5vARgVNrVRIYkSXLZ3thzAp3fqs5o6
X-Proofpoint-ORIG-GUID: eJ5vARgVNrVRIYkSXLZ3thzAp3fqs5o6
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
Cc: jeffxu@chromium.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, christophe.leroy@csgroup.eu, jeffxu@google.com, linux-mm@kvack.org, oliver.sang@intel.com, npiggin@gmail.com, akpm@linux-foundation.org, torvalds@linux-foundation.org, pedro.falcato@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Michael Ellerman <mpe@ellerman.id.au> [240807 08:41]:
> Add an optional close() callback to struct vm_special_mapping. It will
> be used, by powerpc at least, to handle unmapping of the VDSO.
> 
> Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>  include/linux/mm_types.h | 2 ++
>  mm/mmap.c                | 3 +++
>  2 files changed, 5 insertions(+)
> 
> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> index 485424979254..ef32d87a3adc 100644
> --- a/include/linux/mm_types.h
> +++ b/include/linux/mm_types.h
> @@ -1313,6 +1313,8 @@ struct vm_special_mapping {
>  
>  	int (*mremap)(const struct vm_special_mapping *sm,
>  		     struct vm_area_struct *new_vma);

nit: missing new line?

> +	void (*close)(const struct vm_special_mapping *sm,
> +		      struct vm_area_struct *vma);
>  };
>  
>  enum tlb_flush_reason {
> diff --git a/mm/mmap.c b/mm/mmap.c
> index d0dfc85b209b..24bd6aa9155c 100644
> --- a/mm/mmap.c
> +++ b/mm/mmap.c
> @@ -3624,6 +3624,9 @@ static vm_fault_t special_mapping_fault(struct vm_fault *vmf);
>   */

The above comment should probably be expanded to explain what this is
about, or removed.

>  static void special_mapping_close(struct vm_area_struct *vma)
>  {
> +	const struct vm_special_mapping *sm = vma->vm_private_data;
> +	if (sm->close)
> +		sm->close(sm, vma);

Right now we have the same sort of situation for mremap calls on
special: we have a call to the specific vma mremap() function.

However, every single one of the vdso mremap() calls that I see:
s390, riscv, powerppc, parisc, loongarch, arm64, arm

seems to do the same thing, except ppc which verifies the size is okay
before doing the same thing.

So, are we missing an opportunity to avoid every arch having the same
implementation here (that will evolve into random bugs existing in some
archs for years before someone realises the cloned code wasn't fixed)?
Do we already have a fix in ppc for the size checking that doesn't exist
in the other archs in the case of mremap?

That is, if it's a special mapping that has the same start as the vdso,
can't all platforms do the same thing and set it to NULL and avoid every
platform cloning the same function?

Since this deals with mm_context_t, which is per-platform data, I think
the easiest way to make this more generic is to make a
generic_vdso_close() and set it in specific vmas on a per-platform
basis.  At least then we can use the same close function across multiple
platforms and make this less error prone to cloned code not receiving
fixes.

...

Thanks,
Liam
