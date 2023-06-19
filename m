Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8CE736004
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jun 2023 01:12:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=2ko/9cH9;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=MOI6mtfg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QlQWx02Gkz300v
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jun 2023 09:12:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=2ko/9cH9;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=MOI6mtfg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QlCZh1pFnz2ydd
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jun 2023 00:58:50 +1000 (AEST)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35J9nd67030275;
	Mon, 19 Jun 2023 14:58:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-03-30; bh=Jb1WHDJ5NFGzhYGWXkIj4BLtXsbHmNL3RB67Tz30+Eo=;
 b=2ko/9cH93e/3XDGl+rOP+R7WciLNShPPLuLVsKcAR86aBsgkrx0e9JW5xItSI+mnh2Ow
 MFsKEOGso6vFY1tSQd1fRomCPp26n91JpQ3aW/rO1zpnph1E2DuwwvvMc/sCoTm/AFqt
 rbsIbz+zk2+3jDrhioiNSu4hmf+eRUpYpAGrknYSLrnlWp8VwQ+RUXkuZeFudApXTiIX
 982jJf3M2LKXPuabPHUfhcGL6gT9O6ztIRXUKP7LQoe91RpjXsdyeZGe0NLzPL5En+y0
 PMhMAMSaVwnmmtoHOm8PPGYEMWB+AuhaAFqDpm9htyQ/8Wd6JHI59C+8BFPjDlPBLXnK Ig== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3r95cttv1w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Jun 2023 14:58:31 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 35JD9md9005929;
	Mon, 19 Jun 2023 14:58:29 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2047.outbound.protection.outlook.com [104.47.74.47])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3r93939jdk-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Jun 2023 14:58:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NktQOvk1dHwMlr5KV5+6B2EUnp5V/XyyQ5JvyYbv02j3gakAoTQu5QsGqB2DyCN+cbYb2z56PSptJzffRXi4L6lz5Ds0FiPH0SxftGkkeM6exiuOhzvnHNTaoq2JS8uhGhixQJw4bX8m7v9fgkDHN0PE7M3B7qWn0wlZ0h2ScyyacePMTGWubCEY7F2qsZBRIP+rqW2dzDMyZknOs/HSvJvwF5fMw62UIQLHY5QzYSYbryrxChE95TybgkgUk/tndEluAeE0Khv2n8fciEqvSsQtKSiKPCgLT0H1/8m8iKIjRBvsSEDqGC909fO+Kl4dztIUnmDXLgNe8XzMjqQ8Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jb1WHDJ5NFGzhYGWXkIj4BLtXsbHmNL3RB67Tz30+Eo=;
 b=jssx1ZKN6L3X+0gqzOhtpHZVGWk7g3mXzyA93k4XYem5Ke5c26zZlJyqhvA6OaSBN/X0b0rqPNdUcaum5g4Bb0eb3XPdQgeBAXRFeBm8dnNmi5tYBA6cM5Pp7XhTcR+e45b0IR1ebvYV35YUbfpl8DTpQUhsfYm0R39zWyPWr5cHcaJUAWAaZTCfUDFWTovnfpI98aW+od3ywN+DkSYoheJBFwWWJEOTZpgYp3uY5MoJjIrvl4ePaDyGNj22RIUjHfQ78RUIwTB3HmLUdeaYiKZ1w5wUaa4fYct0VsZR97/5zN9GBFGnTzaRGP4yYC3QnUdI5Xy/Qw4rPOVshZsFxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jb1WHDJ5NFGzhYGWXkIj4BLtXsbHmNL3RB67Tz30+Eo=;
 b=MOI6mtfgSYfXhqsHzFxHSY4o+iaS99Q3BmAIaoUxQR2EHUkfA9zgGg2dJxcgr4GgDyJjAXLu+ErhPcLybddCDMM9/WAXr2GS8gpfqqYeOXertr89C1JRVXPQS9jK3dQEPj85R+cgi6OjVm2gVq2G9bznqTRvwYaxNNT86s7mbV0=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by SA1PR10MB6543.namprd10.prod.outlook.com (2603:10b6:806:2bc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.36; Mon, 19 Jun
 2023 14:58:16 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6500.036; Mon, 19 Jun 2023
 14:58:13 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org,
        chenhuacai@kernel.org, geert@linux-m68k.org, tsbogend@alpha.franken.de,
        James.Bottomley@HansenPartnership.com, deller@gmx.de,
        ysato@users.sourceforge.jp, dalias@libc.org,
        glaubitz@physik.fu-berlin.de, tglx@linutronix.de, mingo@redhat.com,
        bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org
Subject: [PATCH v2 01/13] kexec: consolidate kexec and crash options into kernel/Kconfig.kexec
Date: Mon, 19 Jun 2023 10:57:49 -0400
Message-Id: <20230619145801.1064716-2-eric.devolder@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230619145801.1064716-1-eric.devolder@oracle.com>
References: <20230619145801.1064716-1-eric.devolder@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DM6PR06CA0085.namprd06.prod.outlook.com
 (2603:10b6:5:336::18) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|SA1PR10MB6543:EE_
X-MS-Office365-Filtering-Correlation-Id: a0721874-1b29-4c90-e547-08db70d59af9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	nOTZJgdlls9eZZLHhmYhSGmjQG7dhaLS1uftQAxMauNgMCwNlsTuWkmCu9Q/KHHJB1flu4GJOUE7GD+ZUy+27YjG/vfRPb5f0mgMKxV1lbDFDJKhD3ZpIgEHOjrBbgFgio+v1QfLHck5LDjcoblzkviJvYU68/2XCnltsn74KyPb/snI18MqRayxl30S4AyzK4ed31iqTvA5xSqdeD/gYc2nyYEYNvihNQLo9/BsM+SwZI2KZTeDhTLHSi5jyXj/Mri+7qvCv+Pe3d8OxM/1yvO2HBvQ2lqMJl7k4+yiVmOaupZSI+ed1SVHovMisd2Pq3GMxDX0lCutN9pWVehipmgzw9DN0Jk8Xp5oslz7afiaddszA+hnuMUK+qHb/YgRriF0EYomXLWOEF+x7Zo0IkUc0AMVEloJ8gpF5Izoj7yZUOqoN6v2RLlyzsN62IGj3Hy3Yp87UA6BdwgL9gR7coh2FQgoDeUgpAVJQmk62wIt6oghV29Anaz6dWh5O1WOos2FXr9vTIq8a2x2571pYAj0zqD6sHsK/cbEKLS9MWoKY4sCF97DOVWEX5ruoSz6AyCfl1L2d3j+s3gZJQlozMTIhPmd/OCS+NsATx8hR5I=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(396003)(346002)(366004)(136003)(376002)(451199021)(7416002)(7366002)(66946007)(7406005)(8936002)(8676002)(66556008)(66476007)(107886003)(1076003)(26005)(186003)(6506007)(6512007)(36756003)(83380400001)(41300700001)(38100700002)(5660300002)(4326008)(316002)(2616005)(921005)(6666004)(6486002)(478600001)(2906002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?WNE2kpkmjVDNO/im1rfUQU3qbaANaUbJRF7M37gDCCF7Q1kSIa639Ozqozis?=
 =?us-ascii?Q?bm7gLio4T9Ze2E9Ua0rJ8re5gsT7HYRUYVkdeUYI7TswAgz13kZapn7oqxui?=
 =?us-ascii?Q?IVSmMi9wXCcbJU99bGLy3XY2q2xCylsLXVw3H6UKTL60uXye62Xp78Ggai8H?=
 =?us-ascii?Q?P+3CTmhhFCPWsDnMZBiRb39B6Ase27N0wuAQoPjHFg4eAagBX7vOKU3nRLeX?=
 =?us-ascii?Q?vQiMBQc1bqBS8a1PG4lrP9Ay9YH4NAf2Dl1aoC0TYdyGTTmAX0XDhwCU+WuM?=
 =?us-ascii?Q?KzlqMlIZRStL1swUxG7B62ddBEzl52+OH/WBoODrcRbexHCnZ4uscRbTCwkI?=
 =?us-ascii?Q?9D6DRjW1M8oPLMHhNcHMEvFWacjfgOkrpC5K3cceWPQfyBzzwqxOicYDWRZw?=
 =?us-ascii?Q?wdUD/1GWUysiTh7bd/UZM7+lxR+V+DRU3UWhJpCLsdejf5oVKKPm6jpNjGRa?=
 =?us-ascii?Q?k1y7tmq7lCVfJFo/DAUGjZjEw6tmmWMlpoirvxuKYIPO+SCPGnsqYh68NqZ8?=
 =?us-ascii?Q?8xyoIVFV21hBZPwVvIg1cf4Blmu6jrXSlDZYRNAx22m72u1O6fkcfVo/A88S?=
 =?us-ascii?Q?zUVpt1kt4JAxRHsmWojJ8nYnT+2pAmQW/JE8dd1u1DYv7EdgTnhPfRxsPA9V?=
 =?us-ascii?Q?51DNoTXCk6y2uBzlX04N9s9DqsC8wid0cdmtWZs3HF3sJj/JumzkNVEe6Rz4?=
 =?us-ascii?Q?yll/Lw7jTrBWZd06hovyJkPXocRMSZa0Gq1vF5WSvCKvbyJCKtxiG7lEmTIn?=
 =?us-ascii?Q?nxqr2A7yIx5m5loQaP9BqLQTkhE9dGo+9zDW7KHbfj5YSF+fgcJMXC8pIMBS?=
 =?us-ascii?Q?0iX92LbnM27BVxORbw2mYs0fSQCoCDHDsvT8MdliZFbYp+FdDG2ApoEGxeVs?=
 =?us-ascii?Q?YQsgcZcMtWj4M1enGYigx0ikhp84zwBAxEa0QVSaaouAsS49sfgX+IsFH1nA?=
 =?us-ascii?Q?PLUBRTZeZ1FcakWfLfjUwFQ55mrzd1VXuka5awgsBViEaVxeGkQBrDhq70x6?=
 =?us-ascii?Q?hsE9ioriKF/zl6x8bGNbrodaG6S4JJH/oHBRiKz81rS8l+ssKXm3cpa9wVbs?=
 =?us-ascii?Q?Yvg4qNT9fusB3abGGkBFC/P5i8sz/XdVtlKCD/5hHvWmyjGShUBH0Qc2V/n8?=
 =?us-ascii?Q?pvxLcbkpE6utTu/uUWFs+UI3XDSeQWQcTqKw/p8ltigv70T9v7msIKiTO8Cf?=
 =?us-ascii?Q?0+zzKemmILG2S0crB1iRT9JhrhF8nkTmFVdTVB/GjMjNximOU1loHRs9XQjJ?=
 =?us-ascii?Q?HdzNsG4lgWUcmlbkida6Sls581sMkygOVAi2m7qiQKBIbk6f1KJroRCf1+eO?=
 =?us-ascii?Q?AVNFks6bJW2dmR8bM9vATMqZMEbfPA/7W4bGeLCTrSiV9cFTHd/6Bvj/6a8I?=
 =?us-ascii?Q?RyCWBONfXEULka5oToX9BGbNk3qEtpzwgyYt1tlWBbNxTW1n7wEaiVVLivoM?=
 =?us-ascii?Q?gERhM6rG/YMCUmcUQ3XOPXFOfIu0PD5wcBlckAoimjPbnOml2vBUG1KJWwyo?=
 =?us-ascii?Q?0F5s+rq2RGsQavB2yedwcQwZlCYCKiN+8DAyiDgKf45DpuqjFxslUJkLhS3I?=
 =?us-ascii?Q?bgbHQW+K0qH2QMBlD33CwR+lywIXUkU6ilKJ54n+MxeYKno6U8YvvHpFCp76?=
 =?us-ascii?Q?ig=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?JrpIWkbL7vS4zUlL7WQ29hWg5eFKHd7s4kDpOlkxIwpR8x+Y74rZcVTb44VK?=
 =?us-ascii?Q?iY8/xIz64ul/+KuELkGjQ0Fs1bXXGCCpQf1k89I0I52yB9s3pMEyM82u+zdp?=
 =?us-ascii?Q?lByuyC7EjNo165Rw707MKNywpR/bSR/zO68GxBJPuzwIiOm6MmONNzYuMWGj?=
 =?us-ascii?Q?nKw2n/7j1NaYvpm4IASsEz0zyV3Z7PzkWiQK1+gZsKCp7uAXyjaWzsqD4S7Z?=
 =?us-ascii?Q?Uoe/YBInFbJPyjilTKSzhwm6/Xzj3A/X1pEUT9GIUxNLJ2Mme+bFtCpl7/hc?=
 =?us-ascii?Q?167AXv12zWgm/ZmwRxYoqBcyGgsZa+RQ7CTsZGJZY12UY1tdF9ZTCQheHdIY?=
 =?us-ascii?Q?B7EBVgVMl5abG4JCM97XETAQMPOQaVBS7mHLaSg5BHSswOvHIVHGvL+2yteP?=
 =?us-ascii?Q?SKaG/pFiWmbhlbmX4TLZtTrPBVjDVUw3EpVhUUM4KJMh632eqVDJDXGOMDj+?=
 =?us-ascii?Q?IsvgU6wMf1NhWBE4U1BFfmKygLZLFuH/m2V08veise81yy8LQ0Ck8ZDZeomb?=
 =?us-ascii?Q?eNbBko5WRuI9Lnz0mrxnoBnjFgtIGivXYdYVFXttkT7B6sJszjLI4zJIh0WJ?=
 =?us-ascii?Q?SBBTipkoJQUCMFrGV5exHamrwDKGIk7w6OfUZBwLKkyOjTgIg82KN0v97j/r?=
 =?us-ascii?Q?mlCa1scgC5i7Et170pbx0O45yaCg7hAX8oCzxTpHDzv4sYXjpdFXg3MvxSBd?=
 =?us-ascii?Q?ho00Ae3/5p5iJngieW5AnYmlZrWi1xDZJIJWlVexs5DPuHzXZ4da8j+7jlF0?=
 =?us-ascii?Q?xA7ehIGqFQrpJAmM42CAGXWPil9zY3haepPBoGuJc/0X1SX5+7TlpD23wxC/?=
 =?us-ascii?Q?8rlzQ5OaqntRevVB+Z32URM7b3TfuvvNI/hvM91g0wmdK9XxBI+rxG6HOcE7?=
 =?us-ascii?Q?tRVG/+GTYl4j3Mg1ddEpoVTetFYFoEXNeqzpy3mj9I4xjke912VgfXPhe1wm?=
 =?us-ascii?Q?qVadokLs3rqZHI7DdiqZ3Tu38XAvNFfBFIF0LLCll9+FFuTKDCm0zcI6Tf7D?=
 =?us-ascii?Q?eEnosazgkBo0ECCVxZuxYudcfGx2ge0SWUKAULHg+YVoRCPO2bAX8oKCgrw7?=
 =?us-ascii?Q?W7lcDksZWIYMnEVvu/HEFknEgilgYJ4P6FhRhItkwx8pYB1kkWs4AGz6KjAk?=
 =?us-ascii?Q?6p7PCJIeaJ6TKuSn7VevtzumOfBjz5ANaCVjPttfCeFLTRIrLxtioxCRn5uh?=
 =?us-ascii?Q?RJfLdu95JOAUFMQf50isSz3Ohb858yQmiyMNZpM4rqxi3vk7oZ7J4sdZUPOW?=
 =?us-ascii?Q?yJzH789gj67ke3l5rnCgUfhSDP5Fro4QgNPxFstmNfuLZBOIILvvSxHAWjYb?=
 =?us-ascii?Q?jicTsbHlY+391aq/oU5YEqFeaIKolalmGmWlfDtgSi2GHyJw7onp2RgVTWiz?=
 =?us-ascii?Q?uFcasDieNv/EEkUbhFOvEubU5nJXF60ts5yjkJLSMKlRqv+3SPSYpkY2iikF?=
 =?us-ascii?Q?BDNgr2/eLUa+UmmHSYT2cMcnyQkSsL/2fS4p+4eNhsVtCfFravrv547Xu8Mz?=
 =?us-ascii?Q?yi79fiKWSRALcpff5nPORVpqFEN84M25tKOyCKC6s17w6o9lSq2iG3lqQZd2?=
 =?us-ascii?Q?8esfJPgouu+V/8wOWmMpMZKBrMJD43demvn3qBOq0wkKeqV4tc4XB14dc6rS?=
 =?us-ascii?Q?YU5FZHkXR2mwvdvEelEqx/6rY/kMVK7suI3gEbTrvZ7dq9KjKubrqjutGK/T?=
 =?us-ascii?Q?8KFpmuNmNqum7NQmg3LFr3sVheQC0/0qw3w1xxwrXoIzrPxPpaaJDKYJGwVM?=
 =?us-ascii?Q?DSteEfXQYIHl2NfW1au70CYQRce3tHD7mLa2Pz4pP1LuVBXCFAmkfKaa9h6c?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	bj3GZE1Qk9qJGO0sfPCNOQASImFx2hasK+uYAWLHKF2kxkj6vV+5XBCm5zzs3tqNGME6XJczbYTzz5VerJpXxtqQPB0LYm/ZOnOqay351lVnUGs5S2kf3eyFMHgDgW7d6XdUxK/5BK5NYBI2L1q2j+P+a8S7RfJ5Qj/tPJ5G1XqLpoaifkutZ8DfZzgyJC27ybWp16m1zNmDMxf31LlYdphA0ousD2Vq3gxbiN/47SM11IAT31q1QvIEyL6jid79mMVtoAShLOPB+hd1bkbnPSR4JqNIavxvFRAy1OuC6bp+l5XqdhwG2h+wtBEQQe9Q/OIBL2gUIn/JOP6vwvIzlnXUZC9NdhfS6uHPqc9BoJsXygLYGpZP0X6GHQTycCZYLoemEz1+04PwgHffKEQZsriheu6oxjCzF0YqtlfzUJVQ3Tt+Hi2J7hwHQ/VIJ/IhzN8LzNmvvWn3rg==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0721874-1b29-4c90-e547-08db70d59af9
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2023 14:58:13.4842
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mr0aEaQHPPjBPdJXtsL8GVJSL9dTBX1q4MPdonxQ8VAIyASokYn5F1R2HL+bufcaL/1niNzjOxwl7FKy60hKlF0rL8GWfWUN2v+pfoKHDF4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6543
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-19_11,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 spamscore=0 bulkscore=0 malwarescore=0 phishscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306190137
X-Proofpoint-GUID: XVcus6t9SsaBSRbxiEba_Q-kMxU2JwX1
X-Proofpoint-ORIG-GUID: XVcus6t9SsaBSRbxiEba_Q-kMxU2JwX1
X-Mailman-Approved-At: Tue, 20 Jun 2023 09:11:26 +1000
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
Cc: peterz@infradead.org, linus.walleij@linaro.org, thunder.leizhen@huawei.com, hpa@zytor.com, kernel@xen0n.name, eric.devolder@oracle.com, ardb@kernel.org, tsi@tuyoix.net, agordeev@linux.ibm.com, paulmck@kernel.org, bhe@redhat.com, masahiroy@kernel.org, konrad.wilk@oracle.com, sebastian.reichel@collabora.com, samitolvanen@google.com, ojeda@kernel.org, juerg.haefliger@canonical.com, borntraeger@linux.ibm.com, frederic@kernel.org, arnd@arndb.de, mhiramat@kernel.org, aou@eecs.berkeley.edu, keescook@chromium.org, gor@linux.ibm.com, anshuman.khandual@arm.com, hca@linux.ibm.com, xin3.li@intel.com, npiggin@gmail.com, rmk+kernel@armlinux.org.uk, paul.walmsley@sifive.com, boris.ostrovsky@oracle.com, ziy@nvidia.com, hbathini@linux.ibm.com, gregkh@linuxfoundation.org, kirill.shutemov@linux.intel.com, ndesaulniers@google.com, sourabhjain@linux.ibm.com, palmer@dabbelt.com, svens@linux.ibm.com, tj@kernel.org, akpm@linux-foundation.org, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The config options for kexec and crash features are consolidated
into new file kernel/Kconfig.kexec. Under the "General Setup" submenu
is a new submenu "Kexec and crash handling" where all the kexec and
crash options that were once in the arch-dependent submenu "Processor
type and features" are now consolidated.

The following options are impacted:

 - KEXEC
 - KEXEC_FILE
 - KEXEC_SIG
 - KEXEC_SIG_FORCE
 - KEXEC_BZIMAGE_VERIFY_SIG
 - KEXEC_JUMP
 - CRASH_DUMP

The three main options are KEXEC, KEXEC_FILE and CRASH_DUMP.

Architectures specify support of certain KEXEC and CRASH features with
similarly named new ARCH_SUPPORTS_<option> config options.

Architectures can utilize the new ARCH_SELECTS_<option> config
options to specify additional components when <option> is enabled.

To summarize, the ARCH_SUPPORTS_<option> permits the <option> to be
enabled, and the ARCH_SELECTS_<option> handles side effects (ie.
select statements).

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
---
 arch/Kconfig         |  13 -----
 init/Kconfig         |   2 +
 kernel/Kconfig.kexec | 110 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 112 insertions(+), 13 deletions(-)
 create mode 100644 kernel/Kconfig.kexec

diff --git a/arch/Kconfig b/arch/Kconfig
index 205fd23e0cad..a37730679730 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -11,19 +11,6 @@ source "arch/$(SRCARCH)/Kconfig"
 
 menu "General architecture-dependent options"
 
-config CRASH_CORE
-	bool
-
-config KEXEC_CORE
-	select CRASH_CORE
-	bool
-
-config KEXEC_ELF
-	bool
-
-config HAVE_IMA_KEXEC
-	bool
-
 config ARCH_HAS_SUBPAGE_FAULTS
 	bool
 	help
diff --git a/init/Kconfig b/init/Kconfig
index 32c24950c4ce..4424447e23a5 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1917,6 +1917,8 @@ config BINDGEN_VERSION_TEXT
 config TRACEPOINTS
 	bool
 
+source "kernel/Kconfig.kexec"
+
 endmenu		# General setup
 
 source "arch/Kconfig"
diff --git a/kernel/Kconfig.kexec b/kernel/Kconfig.kexec
new file mode 100644
index 000000000000..5d576ddfd999
--- /dev/null
+++ b/kernel/Kconfig.kexec
@@ -0,0 +1,110 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+menu "Kexec and crash features"
+
+config CRASH_CORE
+	bool
+
+config KEXEC_CORE
+	select CRASH_CORE
+	bool
+
+config KEXEC_ELF
+	bool
+
+config HAVE_IMA_KEXEC
+	bool
+
+config KEXEC
+	bool "Enable kexec system call"
+	default ARCH_DEFAULT_KEXEC
+	depends on ARCH_SUPPORTS_KEXEC
+	select KEXEC_CORE
+	help
+	  kexec is a system call that implements the ability to shutdown your
+	  current kernel, and to start another kernel. It is like a reboot
+	  but it is independent of the system firmware. And like a reboot
+	  you can start any kernel with it, not just Linux.
+
+	  The name comes from the similarity to the exec system call.
+
+	  It is an ongoing process to be certain the hardware in a machine
+	  is properly shutdown, so do not be surprised if this code does not
+	  initially work for you. As of this writing the exact hardware
+	  interface is strongly in flux, so no good recommendation can be
+	  made.
+
+config KEXEC_FILE
+	bool "Enable kexec file based system call"
+	depends on ARCH_SUPPORTS_KEXEC_FILE
+	select KEXEC_CORE
+	help
+	  This is new version of kexec system call. This system call is
+	  file based and takes file descriptors as system call argument
+	  for kernel and initramfs as opposed to list of segments as
+	  accepted by kexec system call.
+
+config KEXEC_SIG
+	bool "Verify kernel signature during kexec_file_load() syscall"
+	depends on KEXEC_FILE
+	help
+	  This option makes the kexec_file_load() syscall check for a valid
+	  signature of the kernel image. The image can still be loaded without
+	  a valid signature unless you also enable KEXEC_SIG_FORCE, though if
+	  there's a signature that we can check, then it must be valid.
+
+	  In addition to this option, you need to enable signature
+	  verification for the corresponding kernel image type being
+	  loaded in order for this to work.
+
+config KEXEC_SIG_FORCE
+	bool "Require a valid signature in kexec_file_load() syscall"
+	depends on KEXEC_SIG
+	help
+	  This option makes kernel signature verification mandatory for
+	  the kexec_file_load() syscall.
+
+config KEXEC_IMAGE_VERIFY_SIG
+	bool "Enable Image signature verification support"
+	default ARCH_DEFAULT_KEXEC_IMAGE_VERIFY_SIG
+	depends on KEXEC_SIG
+	depends on EFI && SIGNED_PE_FILE_VERIFICATION
+	help
+	  Enable Image signature verification support.
+
+config KEXEC_BZIMAGE_VERIFY_SIG
+	bool "Enable bzImage signature verification support"
+	depends on KEXEC_SIG
+	depends on SIGNED_PE_FILE_VERIFICATION
+	select SYSTEM_TRUSTED_KEYRING
+	help
+	  Enable bzImage signature verification support.
+
+config KEXEC_JUMP
+	bool "kexec jump"
+	depends on KEXEC && HIBERNATION
+	depends on ARCH_SUPPORTS_KEXEC_JUMP
+	help
+	  Jump between original kernel and kexeced kernel and invoke
+	  code in physical address mode via KEXEC
+
+config CRASH_DUMP
+	bool "kernel crash dumps"
+	depends on ARCH_SUPPORTS_CRASH_DUMP
+	select KEXEC_CORE
+	select CRASH_CORE
+	help
+	  Generate crash dump after being started by kexec.
+	  This should be normally only set in special crash dump kernels
+	  which are loaded in the main kernel with kexec-tools into
+	  a specially reserved region and then later executed after
+	  a crash by kdump/kexec. The crash dump kernel must be compiled
+	  to a memory address not used by the main kernel or BIOS using
+	  PHYSICAL_START, or it must be built as a relocatable image
+	  (CONFIG_RELOCATABLE=y).
+	  For more details see Documentation/admin-guide/kdump/kdump.rst
+
+	  For s390, this option also enables zfcpdump.
+	  See also <file:Documentation/s390/zfcpdump.rst>
+
+endmenu
-- 
2.31.1

