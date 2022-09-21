Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 17FDC5E56CC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Sep 2022 01:42:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXw1W07qfz3c9L
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Sep 2022 09:42:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=0ssqCNPk;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=Hiyk5OVt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=mike.kravetz@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=0ssqCNPk;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=Hiyk5OVt;
	dkim-atps=neutral
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXw0h2stCz2yph
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Sep 2022 09:41:16 +1000 (AEST)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28LMwfoL011434;
	Wed, 21 Sep 2022 23:41:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2022-7-12;
 bh=ZZyVgKycGthUoE/6/TzvozWzgVzb2muKkm65pRziE4o=;
 b=0ssqCNPkWiPPKHSgMGuC6t5jwNvvnyaV7V9AuNxfqfDuDfRI78k7q0FUFCnSogHZ4sci
 XU52o8UVygP5aTGq6+DaIwmKNjLc0urbdGHYKIt6oSBGydUxy3ecoD9EGCJq0phlt94g
 N9Wag4W/j5JlhvrHcw3SEliduQWR396p3jiMn48kLfbx/FPm8S7xhS0/l/YRJTiT8gc6
 uAdgYUwmhGjmYg42iYvqJBaBKyZQsiI4VOJGhONwM/U4EA7h8nqx5hTRZFHFCTZrUcYl
 yizu/ke7JqUrTTVRp0kY76NDUY9QJO/gTfeL7aTnI+woqQ/xs7Dc303yDPYwbNgx/omT zw== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3jn68rku0y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 Sep 2022 23:41:09 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 28LLcj2D006900;
	Wed, 21 Sep 2022 23:41:08 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3jp3cpympt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 Sep 2022 23:41:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CWIBpybYCKVPqvfXmRgvG8q+Qh6n0dVzzGemqcON5KLj6ZSfdKJ2h3aEPyfFKV7g7qL3XAecvN8Td653ljyCGvGobbqxtjT14RO+0qOFYdrgHkV0SuGXBaWeyvHxhBfxP0tCy3pYZA2jv6A/YkscB3Ko0gjeQ3iCfQfKvsVjs3dULx4cd6KbFFeUOMDpl0pJTvhAjnhSl6EwIP82RJ7z8pELE1sf4hHeJtv9zcLiYST8f2ZWx9IJ6X/a8r6iQFCRjXdx8muA6dt7lRHW9s5i8DVAWPbJGKqP61QmYLZ/pWtbL5RYtq1AuDf1+dx9zOC7IRapZVAC1UOxPOvneAklZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZZyVgKycGthUoE/6/TzvozWzgVzb2muKkm65pRziE4o=;
 b=SHBU/AFkXcqg7czog3sKZeg9B83IJE7dTHrLDMptWSI+RKZvaquYO/2TTq7B94mCkuywpPo9ag/dSESOnkWKp6yDqeTjv5ZnS0zuqpWcTq8EmFYYe9QHElt6FbZKodhM3VuqZx8DrTp7fcsQzW95OFdD6AAuTXrMvmkrCaLewEbiAo2Mta6ityXTGcgdGk5VozwsIQ61WdeVJJehQyeb6W1N5yN8DLIeJtiL43W2MKl0DxT16ts+HyyBlfR1lrpS5whnLye5ZTh4m5YxGd9619dATkJMFnC0bYwVmh0+yi28TygdAayqVs7+R0N9V4ccqlt/AnfBK4VfqF2z3VNLcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZZyVgKycGthUoE/6/TzvozWzgVzb2muKkm65pRziE4o=;
 b=Hiyk5OVt7WsZ+B5DPEZJhJv9xT6NCtyo4mV+1KsSY9UDXDpMO/X/CBn8nWogkEV3PdGWIwUCYNVKItV8immCkuMFJopKhGVFhurWae9m880xnEp0BtwDgl94xBVB+2gaSi9MjkvOul/tDfo4t35ScgNC/dkEtBR6VU0dRM3xIMY=
Received: from BY5PR10MB4196.namprd10.prod.outlook.com (2603:10b6:a03:20d::23)
 by PH0PR10MB5402.namprd10.prod.outlook.com (2603:10b6:510:e2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.19; Wed, 21 Sep
 2022 23:41:06 +0000
Received: from BY5PR10MB4196.namprd10.prod.outlook.com
 ([fe80::dfde:308:42fe:6c5a]) by BY5PR10MB4196.namprd10.prod.outlook.com
 ([fe80::dfde:308:42fe:6c5a%3]) with mapi id 15.20.5654.014; Wed, 21 Sep 2022
 23:41:06 +0000
Date: Wed, 21 Sep 2022 16:41:03 -0700
From: Mike Kravetz <mike.kravetz@oracle.com>
To: Sachin Sant <sachinp@linux.ibm.com>
Subject: Re: [powerpc] Kernel crash with THP tests (next-20220920)
Message-ID: <YyuhD+7N022PgRA+@monkey>
References: <C2C8DA4F-F00F-43E9-ACD8-2A8BACA55893@linux.ibm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <C2C8DA4F-F00F-43E9-ACD8-2A8BACA55893@linux.ibm.com>
X-ClientProxiedBy: MW4PR03CA0096.namprd03.prod.outlook.com
 (2603:10b6:303:b7::11) To BY5PR10MB4196.namprd10.prod.outlook.com
 (2603:10b6:a03:20d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR10MB4196:EE_|PH0PR10MB5402:EE_
X-MS-Office365-Filtering-Correlation-Id: e06be7bf-c99a-47a4-9246-08da9c2ac088
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	B1FBMipgupnt889n1yVCgjsIimFCheOaAGEYmoDGVmxAVfrvG3FNl7xXxABya42I+xcSLxUimNGPUYs27DnHqySwwjpF1chICjVxzvVx3H61IWNhoQkptsuvbezSHLlWgjx0VnmYJMfHMuWs+jHAPbY0blCV5cQ/GDkPrP8YSDsRyNpfafPrNAxYGUsSfo6jSkD1C0Ada93MZAZKG1WGnpHME9SJqxeQSqhQ9RQCldvkGq8BqtTnGtsYurH6EZX49kDKY8OL1n037AXa0OEsJuhEAONMZC2lX44knmOPyv+QylgEJF6aPkd+nnCrytqxUVfFemGSpukjSzzGuVvAkVfK/dOWZUcmaWaUvssjcJcyGnvmX4XY62PaHlLfGX7Yzfg9AOpqsH60TJUyISPUyrhwtQryKrb0WLO/WV0Dk+Mz20u0x8B5hCH3sltSOqhu2nbHlm4nr4G9hKJP9I4rgHKLCTBTuaq0Y61JPvhpbXwNWFGOBsL89zI3SiDPynuRTJDYKvlBwd03Ktrp43owLBgkuWb7zS2/6RdO7E6+G2mYjzmI/YXceHELZInZqmo0H4qEwYaUIqYSAHd7mGTOdtE93y8qluB8IFjBJlMgIL/hTim0HkKwRsjaM7aITfjQu+fXVeoLwl41g1tUEQotFBycnoOTZZdJnoaAuxIb5xo9maQD2Im55hOfU6pzk8zauHIsHOBwHAzQFCulc79VIFsbQop3b19YL0c0+wXN4NkSAfiYbKOUHmgBj/UeDIdZZbFvErqVctzwQpT2cpyHlA==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB4196.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(346002)(366004)(39860400002)(136003)(396003)(376002)(451199015)(316002)(478600001)(6916009)(6486002)(45080400002)(966005)(86362001)(41300700001)(186003)(38100700002)(5660300002)(83380400001)(54906003)(26005)(6666004)(53546011)(6512007)(9686003)(66946007)(66556008)(66476007)(8936002)(6506007)(2906002)(33716001)(44832011)(8676002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?8NE2jApXoHKsk+YkADa5MEUYQIWWjYBTCm1oDs+Jbei5R729miBKlb4l8+NH?=
 =?us-ascii?Q?lOAkXaj1bSE51sakMsleMBf1ICBVrhBL/nQcLLXDH35sjuILCAThaAuJ5uEo?=
 =?us-ascii?Q?kP7phsau+Q/jxU5ZgbAqW6JIzoClckDNNT374CxMj53y6iHb9Pdrct1GR/TT?=
 =?us-ascii?Q?PageTn2xVZq4w1ezIAgTSi1P2N3C6k5Yk59ijePWhBz33d5LMus5VjDatAQb?=
 =?us-ascii?Q?PMIULmYXe17P9IRsddF0yAuwr6h6avP2nvNiHtNQjo6UsHxE00Z75a8S8ndR?=
 =?us-ascii?Q?3+05k+v7TDnP1EvDHGslvrP7tAi8fG0Aa9E8Sjr2cWS2guTNuqijGN8JEjpH?=
 =?us-ascii?Q?oHrqiTTtf3hjS7QnYx09CSB9ZNbNrwNmq8kyhiEeU5rBUx06QKU1VxZJhzsZ?=
 =?us-ascii?Q?sZJ3yzeZyt7ra49JyIu94Yj2AA7zdIlWwDtY0ZfFdpr7N3ZRFyONtZCns5Zm?=
 =?us-ascii?Q?eyychEJFZkKoBje2SMR6YP99JifY73t1vlF4L7hWcWrLdAUeLUYmO1TXW12d?=
 =?us-ascii?Q?/PgTsCSxVgybEfTTm8e8aZf/wZJe3n8yB5Zc7HAlmLcSFvrlwZ6AWsh0crya?=
 =?us-ascii?Q?31Efj4k1J6o76W+OwNyJvsNTmEbVFv24F9udobFv8FMe/CYCd84JKOJDT4rT?=
 =?us-ascii?Q?1bcoja9Mz1m0H/zDwVI2F7t+8gGmbjnaKTUrFIgtz+u56te+xdRnmztffMcY?=
 =?us-ascii?Q?KtNXhXTrCF0c5Q3BTVZqZCuhtcrI1HHADGXCy+wA4t3zVPJneDnzA+eVXlYR?=
 =?us-ascii?Q?trayk35Uzw+RFs1xsxw5oC8ntN0eZpEx2n5hPUwXCQZsYwIZ5xeXFN7aSpFn?=
 =?us-ascii?Q?cx5JOgS9l6vXbmKrC6vIPaQml+ve7R+zDXJYp2XFLMuMhCy++IeR31O5e9gf?=
 =?us-ascii?Q?gnWKHz87MueSOs1BfDVOLSJxn29j6qsBC59FCjHssrl4Av+cyAP522mrGiUL?=
 =?us-ascii?Q?8z8e0uOfkIY9OJZSuhRjW7xVAb4UQyWQNNGW4a1bgS+GRwyiuDT6qiDIquj+?=
 =?us-ascii?Q?j967pQ3SFFEyQR72yh/IkAsphKD+qOukCMZme298g5uiChsLnSxATIgvUY25?=
 =?us-ascii?Q?5nBXrMHto/RoK+aADqfQh+IJSkHT3Ep8HNCmWPLstZWovZeMqSu82w/ubI08?=
 =?us-ascii?Q?p5JCNxaiYKyUuv9kZFih7wP4PC3KuJjeOZ1PBYO6kakrj+Vk9eHevkBl1/rn?=
 =?us-ascii?Q?pZh7vPWdm1n66hxIIshdo88CTXNDWk06ymGlRn7GA+KlCja8TquLBYd+I05n?=
 =?us-ascii?Q?MtqGTvbwHxXpeq6aJzBjG6vnMU8+BPMHXuorA4c6NLK8UvMpSwgYxEGHcfA3?=
 =?us-ascii?Q?0dAcqnIf+prOen8m4gjfeo0MTPvd7XVpjiWifwlYgzJ1dQ/1o9SF+6J/uGmK?=
 =?us-ascii?Q?7Pj0LYwEqBGAHQ8fClJ7hCp9jjwWoaIV+KZb6Ezgq9D6ctNRSAQ5gvrWtAkR?=
 =?us-ascii?Q?HqpMGzLXKJsxtk5ooz6RKjRqbgvZ7pKenr2K8F1XKcH3VJ1Kzw9BwwuVER8l?=
 =?us-ascii?Q?E9PdoI3ueR/qIdaopD78aOBnL4uoEo6kIiJG/ULh1kRyAPg5PZWknHLFQ97D?=
 =?us-ascii?Q?PPQ9aO9NVxxrH+W4ZRwBHXWzJ5b5mSBfbVMkz3jtcInZ45d+p1KKmKWKXAgC?=
 =?us-ascii?Q?sw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e06be7bf-c99a-47a4-9246-08da9c2ac088
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB4196.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2022 23:41:06.1278
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xCf+ARfLQqp7WRMscZoKZNsG/XkuFQyIvCrGWpU5H4yZT5AmrV7e1D0W8lB5FdDipZSFTW1Gek99Iv5D8ZE+dQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5402
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-21_12,2022-09-20_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxlogscore=999
 spamscore=0 adultscore=0 mlxscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209210159
X-Proofpoint-GUID: lXi_34LWTEGEJd3P-rjA2rgbZMHWNP6x
X-Proofpoint-ORIG-GUID: lXi_34LWTEGEJd3P-rjA2rgbZMHWNP6x
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
Cc: linux-mm@kvack.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, open list <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 09/21/22 12:00, Sachin Sant wrote:
> While running transparent huge page tests [1] against 6.0.0-rc6-next-20220920
> following crash is seen on IBM Power server.

Thanks Sachin,

Naoya reported this, with my analysis here:
https://lore.kernel.org/linux-mm/YyqCS6+OXAgoqI8T@monkey/

An updated version of the patch was posted here,
https://lore.kernel.org/linux-mm/20220921202702.106069-1-mike.kravetz@oracle.com/

Sorry about that,
-- 
Mike Kravetz

> 
> Kernel attempted to read user page (34) - exploit attempt? (uid: 0)
> BUG: Kernel NULL pointer dereference on read at 0x00000034
> Faulting instruction address: 0xc0000000004d2744
> Oops: Kernel access of bad area, sig: 11 [#1]
> LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=2048 NUMA pSeries
> Modules linked in: dm_mod(E) bonding(E) rfkill(E) tls(E) sunrpc(E) nd_pmem(E) nd_btt(E) dax_pmem(E) papr_scm(E) libnvdimm(E) pseries_rng(E) vmx_crypto(E) ext4(E) mbcache(E) jbd2(E) sd_mod(E) t10_pi(E) crc64_rocksoft(E) crc64(E) sg(E) ibmvscsi(E) scsi_transport_srp(E) ibmveth(E) fuse(E)
> CPU: 37 PID: 2219255 Comm: sysctl Tainted: G            E      6.0.0-rc6-next-20220920 #1
> NIP:  c0000000004d2744 LR: c0000000004d2734 CTR: 0000000000000000
> REGS: c0000012801bf660 TRAP: 0300   Tainted: G            E       (6.0.0-rc6-next-20220920)
> MSR:  8000000000009033 <SF,EE,ME,IR,DR,RI,LE>  CR: 24048222  XER: 20040000
> CFAR: c0000000004b0eac DAR: 0000000000000034 DSISR: 40000000 IRQMASK: 0 
> GPR00: c0000000004d2734 c0000012801bf900 c000000002a92300 0000000000000000 
> GPR04: c000000002ac8ac0 c000000001209340 0000000000000005 c000001286714b80 
> GPR08: 0000000000000034 0000000000000000 0000000000000000 0000000000000000 
> GPR12: 0000000028048242 c00000167fff6b00 0000000000000000 0000000000000000 
> GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
> GPR20: c0000012801bfae8 0000000000000001 0000000000000100 0000000000000001 
> GPR24: c0000012801bfae8 c000000002ac8ac0 0000000000000002 0000000000000005 
> GPR28: 0000000000000000 0000000000000001 0000000000000000 0000000000346cca 
> NIP [c0000000004d2744] alloc_buddy_huge_page+0xd4/0x240
> LR [c0000000004d2734] alloc_buddy_huge_page+0xc4/0x240
> Call Trace:
> [c0000012801bf900] [c0000000004d2734] alloc_buddy_huge_page+0xc4/0x240 (unreliable)
> [c0000012801bf9b0] [c0000000004d46a4] alloc_fresh_huge_page.part.72+0x214/0x2a0
> [c0000012801bfa40] [c0000000004d7f88] alloc_pool_huge_page+0x118/0x190
> [c0000012801bfa90] [c0000000004d84dc] __nr_hugepages_store_common+0x4dc/0x610
> [c0000012801bfb70] [c0000000004d88bc] hugetlb_sysctl_handler_common+0x13c/0x180
> [c0000012801bfc10] [c0000000006380e0] proc_sys_call_handler+0x210/0x350
> [c0000012801bfc90] [c000000000551c00] vfs_write+0x2e0/0x460
> [c0000012801bfd50] [c000000000551f5c] ksys_write+0x7c/0x140
> [c0000012801bfda0] [c000000000033f58] system_call_exception+0x188/0x3f0
> [c0000012801bfe10] [c00000000000c53c] system_call_common+0xec/0x270
> --- interrupt: c00 at 0x7fffa9520c34
> NIP:  00007fffa9520c34 LR: 00000001024754bc CTR: 0000000000000000
> REGS: c0000012801bfe80 TRAP: 0c00   Tainted: G            E       (6.0.0-rc6-next-20220920)
> MSR:  800000000280f033 <SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 28002202  XER: 00000000
> IRQMASK: 0 
> GPR00: 0000000000000004 00007fffccd76cd0 00007fffa9607300 0000000000000003 
> GPR04: 0000000138da6970 0000000000000006 fffffffffffffff6 0000000000000000 
> GPR08: 0000000138da6970 0000000000000000 0000000000000000 0000000000000000 
> GPR12: 0000000000000000 00007fffa9a40940 0000000000000000 0000000000000000 
> GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
> GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
> GPR24: 0000000000000001 0000000000000010 0000000000000006 0000000138da8aa0 
> GPR28: 00007fffa95fc2c8 0000000138da8aa0 0000000000000006 0000000138da6930 
> NIP [00007fffa9520c34] 0x7fffa9520c34
> LR [00000001024754bc] 0x1024754bc
> --- interrupt: c00
> Instruction dump:
> 3b400002 3ba00001 3b800000 7f26cb78 7fc5f378 7f64db78 7fe3fb78 4bfde5b9 
> 60000000 7c691b78 39030034 7c0004ac <7d404028> 7c0ae800 40c20010 7f80412d 
> ---[ end trace 0000000000000000 ]---
> 
> Kernel panic - not syncing: Fatal exception
> 
> Bisect points to following patch:
> commit f2f3c25dea3acfb17aecb7273541e7266dfc8842
>     hugetlb: freeze allocated pages before creating hugetlb pages
> 
> Reverting the patch allows the test to run successfully.
> 
> Thanks
> - Sachin
> 
> [1] https://github.com/avocado-framework-tests/avocado-misc-tests/blob/master/memory/transparent_hugepages_defrag.py
