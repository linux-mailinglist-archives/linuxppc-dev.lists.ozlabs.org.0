Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7AE49CB58
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jan 2022 14:51:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JkQ9c5PpNz3bVZ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jan 2022 00:51:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=eDVh20gL;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=BBoRHEAc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=205.220.165.32;
 helo=mx0a-00069f02.pphosted.com; envelope-from=dan.carpenter@oracle.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2021-07-09 header.b=eDVh20gL; 
 dkim=pass (1024-bit key;
 unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com
 header.b=BBoRHEAc; dkim-atps=neutral
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JkQ8l4TZZz2xgb
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jan 2022 00:50:25 +1100 (AEDT)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20QA5llj010061; 
 Wed, 26 Jan 2022 13:50:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=ozbBZFB21wtwh1qyNo+8oIhDzu27B04ztIElTIASC4g=;
 b=eDVh20gL6JPhN7qUpYrKTvFy8fBSNNWKHCkrf6jVtjEMtDNlQ/nkgK/ddMUsUBGd2zJ3
 C4RDpT3vCNtNFFYesohRLUreKoJYiYmLsCDzzhNxc8ScN0fY1yPAiF8MbOUaT3yikWF3
 9E41xDwv+l5bq1+iv01dqxg4TrTNupbPRCZRq4xE/D4lxZVKnDzQGSaOdBJdlMnm2Nap
 hpHqeIVj5ep7lM7qxwvGTpA5WU25OUmLH5ufeCZMGppIA3DWR+UKG0pSxP2mxBrXJEb+
 Lm+52ePZE9G70yqsqxklU/pEvlRDHGD1WB6PTw5XNwbbxb6ru70Ea7/CfqGBek51hoFw OA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dsxvfnxp5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Jan 2022 13:50:09 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20QDknBG055216;
 Wed, 26 Jan 2022 13:50:08 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2109.outbound.protection.outlook.com [104.47.58.109])
 by aserp3020.oracle.com with ESMTP id 3dtax8duyj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Jan 2022 13:50:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JJWSywnD0cg3WHCE0+jeIwgmxUTUk9IRkVXsoUKoeKsZn/SpX4EpH07Ky/zHJys8vbnbxFZTKLa8HNMeZiPMrLwnJZ0PW6R63sQ+o+KAM9YEkvsh4T6XhrW5x6PcLh5qTJlsJOdYnOq1SclFNIsa7p/bN2GKQ8DlyKN2RQ6cYSmCOCK0+5v60/dQUM0IMoqumdpRCn4G/Ik/BZ07XgfPQl/Z1omsF2TvlWS2Z+FKoY30XTWJXunJlVHODwUW91POnwxS4I4jtWaldcc8VmTlczBwUBvVgNmf4PPHfs0DtjqCCcLkvOea/+uqxK4hdE2FCvUh2T9hS5Fi77IA4gBCpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ozbBZFB21wtwh1qyNo+8oIhDzu27B04ztIElTIASC4g=;
 b=AmMU3xDwl2FUY5UKM3aez5ptbYDdrPberjiOsFaMrj+cgrizwtcdJMKYMSb2wzPevvdtIzriZli9hTtXNi9DXCbWRCkSLzCybyP2YsyulqI5JqtMbt8RT9MbhTu2PV4WRSkLSkMoaolma+1zIippNdb7SMkal6a4gBmS4T3mxYKLVgwnY4JDtaRjyIjygn0wAbOgal/dEa8L18kGWxnk6rvCHgRrZVQkE0XRKEU6vWf5lV+mZDHdHL/YNTwPzokOjS+Vg6M+GknekshaN7Cm3aOi0memLWUhV7felcVpA9wV6QddNXejkAXQUhWK9pCxuhLzIK6vRV1l9+y8BP+6ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ozbBZFB21wtwh1qyNo+8oIhDzu27B04ztIElTIASC4g=;
 b=BBoRHEAcaypXWvOtphknYPKk23kNiasVrZCzlU4WH1/PE8hXYwFVCyFt62og5ssHWaHRcBolkZ+zmy/t6Gmk/7Py+muB4VWfbkfudMMVtUGFHM7eQ3/PRkDxescysR7Fdw0UMZbjtL9FpBgiGv4XSPFYrTRZHoVFonwDZkMoQd0=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BYAPR10MB3589.namprd10.prod.outlook.com
 (2603:10b6:a03:129::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.12; Wed, 26 Jan
 2022 13:50:06 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c13b:5812:a403:6d96]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c13b:5812:a403:6d96%6]) with mapi id 15.20.4909.019; Wed, 26 Jan 2022
 13:50:06 +0000
Date: Wed, 26 Jan 2022 16:49:48 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: WARN_ON() is buggy for 32 bit systems
Message-ID: <20220126134948.GA1978@kadam>
References: <20220126115616.GY1978@kadam>
 <8bfa7bbe-7343-2d2f-d20b-d4789523c89c@csgroup.eu>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8bfa7bbe-7343-2d2f-d20b-d4789523c89c@csgroup.eu>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0061.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4f::19)
 To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d68aef39-0736-43a6-4161-08d9e0d2c29a
X-MS-TrafficTypeDiagnostic: BYAPR10MB3589:EE_
X-Microsoft-Antispam-PRVS: <BYAPR10MB358906802AACE1FDDB4C6BD18E209@BYAPR10MB3589.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1247;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pptuptFjsZGqxEOTGwGkUazt/T3/HeQljVOKuB+yFxEcmWg9XKRTfyC3sNEq6sJoUIB0EpMxErk2tYEty+fNP1wPPXnzLpPsgcCvae18vIlrCWx76VFtpj5SqBLLwMlvC8wpPOgpRq7FFnxRoMexXEMkl8/P7ioG8p1+cCWsyjRw1LpUP0xFNwYnkKv5LFtJkXiFVIKULEMGIz+GiraJFROAApC2+3pbQAwZ0sgoZsKxLQj9LJwM2qKcFZHvneSTDO47YQq7O096DU23qijeghMFgsMKFhmIEE3b0CLtei0fqoDzFuiS8ZvSp5c+QK2QRPR3hUyWIifEDG84hq224vEP+MdkuEJmuPhJMBglSGXQDH4KAzeNPPv6s0jIPOTGie+1PsKWrWIMXmBQD8Yx2rP7cYDBqYkaHm219l59cIx9NMZhhXA5e44DvLMPU8QjGF4iYrIP7Zv/lguofY/PIRQIL2DxZmFpGvTg1kK/r7QiQts1WmXNv29eBKjMPWimt2/dAKWW/0RZlcwSduxFtlefvwk4JMHefbMQjlQAEODG8/mXDcFmv4XYCddaThetxlzk0/TO85kLaqP2gDbOHm8x3S1Q0s2GzQlI5utbklZxSvvA0IDlhHEIZkenkZ5G3sevA87E3UXyl7QucIE4Lj+1XjK7/ObqWxPVpelg2WRtDK4p/C6w9pc/y9p7agD93EfHQdPE+TVjkWNeY/ZfAg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(366004)(83380400001)(1076003)(5660300002)(33656002)(8936002)(33716001)(44832011)(8676002)(4744005)(6512007)(316002)(9686003)(26005)(186003)(6666004)(54906003)(6506007)(508600001)(66476007)(86362001)(6486002)(4326008)(2906002)(52116002)(66556008)(38350700002)(6916009)(38100700002)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8d20raNQZbiZWCLON796aF3G18luAv1n6R3Ipxy+KphYFUvRNBcEbCTEpaEW?=
 =?us-ascii?Q?5QHGgnC20omntOlWFwWLY6edPgkAUCM31yjfVaEvGQlPBWdkBxAEFgs6byiv?=
 =?us-ascii?Q?Xe/o3jnOAG5QEU0hjuA5uSeYYbxQ741OhRG12m/AxFRVxIOE2fwYp5yw5han?=
 =?us-ascii?Q?H1ks0xU0wRH4ZosgKfwQIKQFRx3CExpT7JHDMcBZEZL74PrYl30b611k3moi?=
 =?us-ascii?Q?ZUU5533EGnMoT6C9fIjTONSBwLi2z0oKS7NxyuUx4FMKM7takg4sv1W8ydbW?=
 =?us-ascii?Q?9wZ55OqkeUM8+Rr/B1q+jQFy7vxMxKKeULL4t0aBOMUnd2/V0IcjVYGxMZe9?=
 =?us-ascii?Q?PQREBNi/fa6r49KDsyGibFeSutMT1imlamuYFmkfuoJ8eI61zgjWNrUrhyBd?=
 =?us-ascii?Q?bt84ntacMqtkoGRs8098tK4IA2gi85r/W7ZnNRz2e5faZfEByp/B8lb/296p?=
 =?us-ascii?Q?4Abk11g91DNHK7Syx+JIT2LOq4QqVJ2Pkf1fsrPItZ6gnDKrXkL9MmkVcHFz?=
 =?us-ascii?Q?l9coC3LeH7I4/DJs4MA+95vUuDroalQwPB0gJT5wc5Pw0PGwT3oJK7k08HU+?=
 =?us-ascii?Q?0BRYYD4hliI6oO3lyGEOAa4hL2RGrncrkRFFgsKlUa0zVq7UyNfjISggBp0k?=
 =?us-ascii?Q?0b1WEqSgW+fyD1Ntvljhbbydz17uX7cmxpASt9IG7KtkfnWGf1VzcubYVz3K?=
 =?us-ascii?Q?0AA7LZgD2+DvAtH1+qhttX9pcN3wLokeXS+0/OACKHD3fHBeV6/FXA1NqEf2?=
 =?us-ascii?Q?2uYqKUpBseLh7dZC1yZ/Aw/yrbU+43aSju6c+JYNM7Wq1SsvHIrZU2c+z0rm?=
 =?us-ascii?Q?CH29FIRXZnbPF4WYVq2X5BnFpN9M9TS2G1WAGwx8J8ev+KQYvjG0RLzLpq/6?=
 =?us-ascii?Q?gsJMzUsD/NGxO372/GeDL+6fzA1Ub2IijOYiCY+TRmMRtGf6HC1XFaFXz6jf?=
 =?us-ascii?Q?vJGV+pYFFhKGGfrvnihaJNxhdbGZS1TjFWB0jSg+dQCR/WaawWCPBsLp8vHF?=
 =?us-ascii?Q?EWD7GxNeBRPMVPMp38X6SKuW5i4IEljmm2VKPQ94csAPOlE+C5Xh7o0HFtZI?=
 =?us-ascii?Q?vBinzaKGZMdHfd0RmEvPOKXzBwRAGaF9Xx6SQx5UKGb3MjmWa1e4UqQ6ALl3?=
 =?us-ascii?Q?CBDzvYSrD3rZ6Ej6PeQRPpRNDf4kLPdNBLgIBrX8Fl8kQAbXfUXa5bR2RrUN?=
 =?us-ascii?Q?2nEgZFyfDt+GR9izWK5bTS9J+JfSqqNroxnCufNhzBmWlV8Kfs6QLl/fZBlB?=
 =?us-ascii?Q?jozBSwwvApTkVPDo/GVefQkaM32J5biCVSsqDEBXos9GdqZpZ/I0IbyEzcBc?=
 =?us-ascii?Q?+5xjX2fXyjbLq5GxhdR/njOB59J51glXabyzeWxhJYwzbzNVSqxU/ZK7rUKg?=
 =?us-ascii?Q?i0K3pxamM0ADeRtzlR5hGwiIkSp5RVHZ6jZJcFkGWqnwV/koKocHMyBhryRC?=
 =?us-ascii?Q?thCvNYjxnkMavSO2OJJanvexTtvWRXtw/BAoWDyAUIM0oIOvjo4S6M3NfP1T?=
 =?us-ascii?Q?2Oo2cmRQZe7KSDuY4SegLusK3Jn3Xm8+TaroPkaPPxT81qXOYm1SmCH/g10/?=
 =?us-ascii?Q?znP9qeReyg2XiiMYN2jxXf/CB3EUuv2BzVoyg9BiYm8NzNDiQe4ZUaCGgu4V?=
 =?us-ascii?Q?bV6cAiQLFUcZnnhaX49GQl20DLMZ8CE6R6r2LlzqfwNo5GvYE6K+lzXPAOD9?=
 =?us-ascii?Q?HEX4AoF34BaNtMIGqz8xXwdAXns=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d68aef39-0736-43a6-4161-08d9e0d2c29a
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2022 13:50:06.4153 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UpuR4NTXivDotarOOS1RuIN2VdCdvI2sZwF9t30huobLVKE9gdesPTxQBFMFQU8W74MG28eBUmyw8hI6C6cvyJ2wO24ceC+qELEJ7UCRAgw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3589
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10238
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0 mlxscore=0
 phishscore=0 suspectscore=0 spamscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201260083
X-Proofpoint-GUID: iRt4vCeiP9dQyv5NLk-CJ27fZ63CoVUV
X-Proofpoint-ORIG-GUID: iRt4vCeiP9dQyv5NLk-CJ27fZ63CoVUV
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 26, 2022 at 12:21:49PM +0000, Christophe Leroy wrote:
> The code is enclosed in a #ifdef CONFIG_PPC64, it is not used for PPC32:
> 
> /arch/powerpc/include/asm/bug.h
>    99  #ifdef CONFIG_PPC64

Ah...

You know, life would be a lot easier for me personally if we added an
#ifndef __CHECKER__ as well...  I can't compile PowerPC code so I can't
test a patch like that.

regards,
dan carpenter

