Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9FD05440E1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jun 2022 03:05:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LJQqk55q9z3cGf
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jun 2022 11:05:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=M7ozWCOa;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=NXncSQgf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=dongli.zhang@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=M7ozWCOa;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=NXncSQgf;
	dkim-atps=neutral
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LJQkX71m8z3cj8
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jun 2022 11:00:30 +1000 (AEST)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 258LZ7rl017866;
	Thu, 9 Jun 2022 00:58:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : content-type : mime-version;
 s=corp-2021-07-09; bh=3SsoYUhartg9823tFAK+tRiIVPElf2jSv9+cjvVkLE8=;
 b=M7ozWCOa3+TfeNQwOa7gpxd6yF1zY09Ju/Ua5AF2i4a+U0N0tYT6jd4AgcPfgt3VJg4L
 mf43BzUEdhRAyNu9OJXAG7BmRswA912dPbMmBC4czuQUiufxvHP8zkmjUCN/oPjc5fqe
 /07g4anPGymLFyAqaBykDLXyvCKuio5RL/xHeJeXdvV4BuYj4QCsuNjHBMGFj5hLfw8/
 QxzsXc+LSifuibdoZtGFiVe/t7uCQQo42tuDKldAJBynWlMP9zOTw2rJXXpbHU/G5oTw
 I4x3Xt0UDGKNwmMfJbyeR8oPodKHdovuWA0+Bp1ku29N9/ITu6tsNs6teSxg6h5phS6O QQ== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ghexefa60-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 09 Jun 2022 00:58:46 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 2590ub2v032517;
	Thu, 9 Jun 2022 00:58:45 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id 3gfwu433k8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 09 Jun 2022 00:58:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=idy4vGYje4vaAx7bI5YnHt2whCNmdGL3p1mv7u9rNj4WZ9iMgD5paaaqFCcqaNPcCTAdF/VZJanjvYcNAJYHfnKG5A6HFVtS7juVmr6umgM0FTXp4YU7NXRpZPSonbkTPk2fbFNKXYXG9MPr3DB9fU+2uOkHCObu7trKnZOb4yawwFEttsO/ZiSEBy7hUfRgIcJvwmPb2Luq2XT8lpjl+05O/SaCbBDCSRvAqHzVIxbI/guMSFMvyCglMU+6QKmfPksYe88L42eLV5LNziZ4ktacscyaraznquN6IE9apVVW2Vk6XUOfhqLCRI6CepTGUsXpaBKoe9PvrWJYVXwtvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3SsoYUhartg9823tFAK+tRiIVPElf2jSv9+cjvVkLE8=;
 b=OrzNLs5L2oDowsnZEhb9imoQmZGNI1om7SDzWikUSRhgHvYwrjIeWZ4ZLAsxHtV1hpfkK2nDtNLIezUGAlBy4AkxwsANj5tRlfVY4Yhdynrditrm8XAeMfhtVVa+KGF2dV+ARsqWg0YMZSwtWu0H1tkJw0fq5QbAfiOVnbvLyGdMO0/3iRL+qoGD1uMi1o5JMs9Ev/zdraYJW6RImQId2h20D2ONdqMadjvLK61VJsifO2SbKXk+hMXMcThWli+CckbWW4gnP3etp+iKuTeo4t2PXYKy7yVlhiyuFya8G49nHtMNYKfRFaZ15t9VtIEJUNxHdRaeIA6ccyCypWCezA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3SsoYUhartg9823tFAK+tRiIVPElf2jSv9+cjvVkLE8=;
 b=NXncSQgfGOTZYlykBnhqLvNUMWyXStN+cMfunC05/2R/j5aV5n/M90jBRFomdHVEHjemXHEBPKy8IjiWhwznojDtUcLYRYIWIgN8gs6EYtYijHRTsbk33AZuimaOSOE9Qx4JWqWle878j7LbIiNoW0La0JpOwPgjuQ6+majAVQI=
Received: from BYAPR10MB2663.namprd10.prod.outlook.com (2603:10b6:a02:a9::20)
 by BN0PR10MB5126.namprd10.prod.outlook.com (2603:10b6:408:129::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Thu, 9 Jun
 2022 00:58:42 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::7081:e264:cc58:37b9]) by BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::7081:e264:cc58:37b9%3]) with mapi id 15.20.5314.019; Thu, 9 Jun 2022
 00:58:42 +0000
From: Dongli Zhang <dongli.zhang@oracle.com>
To: iommu@lists.linux-foundation.org, xen-devel@lists.xenproject.org,
        x86@kernel.org, linuxppc-dev@lists.ozlabs.org,
        virtualization@lists.linux-foundation.org
Subject: [PATCH RFC v1 0/7] swiotlb: extra 64-bit buffer for dev->dma_io_tlb_mem
Date: Wed,  8 Jun 2022 17:55:46 -0700
Message-Id: <20220609005553.30954-1-dongli.zhang@oracle.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0075.namprd05.prod.outlook.com
 (2603:10b6:a03:332::20) To BYAPR10MB2663.namprd10.prod.outlook.com
 (2603:10b6:a02:a9::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2cb2e478-077a-4474-2b82-08da49b3329d
X-MS-TrafficTypeDiagnostic: BN0PR10MB5126:EE_
X-Microsoft-Antispam-PRVS: 	<BN0PR10MB512612A37D72D4478347F88AF0A79@BN0PR10MB5126.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	phOFzr6us0qxhf4BlGC3EWXqNEz4CBGDjH5s96GZyLoh7N7Uncb5zBgg9UZs1cWlABTdKJf3vVcy6UmmAe1FwkKCHedsPsZ3H66G/pLWfxIfF8ung6ESlpj1+wKgmZ2t8ar9tRRY7m/rj6de43oS32Ixsa1WrhOnpOUPdjIQKHAclCD1b9jmp0WGnC68WQk8arYJDaMd0KuAFAe5HPzu6JY+cqhD+lAt2e6f94pzitLkW5GG6h9k7ccFEhxsmEhRk0RVbKI3laZ3EyuvS7s8jFwBWnH0S1niRu7jR52/HWQ8JN5ocj8w9r0sFL36Mdr0JReqh5O4gHzs0QnHlbJQrv3OUYK6DivggUKlG/teKz0f+QbGmGgeCgqNEKM77uFBIeNJunDSbCYY5UJcrXNjC74s7eW5csyNUJzt3fW4vEcdB3hSaYa/zUTOk69jLrWK8taPs/XkVxSHl5MT8ugrEiR0yon9SEkVjBBvSYbDOuA1G9ahAWHTp7yzqhV2Msdic4ZYt/Uh3vsrFSTFFYam7FBaInuPUUvp9VKonsmBIgnv6OgXx5/03R7JcpE1/PlDarM0ixweZt8OBrQYU6DQl1oBacXHBiFOH37pbjaNS5oZa5jobwFRbA5CTBX8K4HiZNtvcJCQlGtbyJafF7ABgIYnhjwmnP+cCzJMKnEZgn3kq8tfoGbubGD6eM2EzwQHX8olfXNxDpUFKAXDwLXvVaSZkF63C1FiYaos4aASYkWTDv3ezZCM6v2ZZ5pfO/yUkVeJnsPHfOz5uIzx1XEG27QkgyqaFFQWzoA6NceVcOY=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB2663.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8936002)(6486002)(966005)(5660300002)(186003)(66556008)(508600001)(4326008)(66946007)(7416002)(66476007)(2616005)(8676002)(107886003)(1076003)(2906002)(38100700002)(38350700002)(26005)(316002)(6512007)(36756003)(83380400001)(86362001)(44832011)(6506007)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?pBO4BPbogLXOZu6vcAtGBYD2Ytg0IwKr8vEIZF/oWiSMFol+V2mrETdzXMMy?=
 =?us-ascii?Q?RJZuyCI8Jn+4MwL9ESFnHzPQpHjV0YWAXpC/IAHuyMPuUH+JE7GdFRHal5lL?=
 =?us-ascii?Q?rofuZhUPvU157zGW0V8sssCE/racWWq7ixXUOp3gDPoSHBHKabOXHCE+HEEm?=
 =?us-ascii?Q?H1yfS/a6Tms6oxIASg4FtKjSdzI0HPHHOsAEqkD0J2Gos0kuLp2HpelOUuFs?=
 =?us-ascii?Q?J7mueZgg7b8o7ndpugpXcG+ksyGd5EmGRQlgpGgQLBotFD7ChbOekaQeY7JU?=
 =?us-ascii?Q?IsHP4BovrgCHVvA4xJ+3mz4AAWwSWmL9wgJeEmv4j9W7uQSHFBSM8+CHr/6f?=
 =?us-ascii?Q?QlH+eH3wtS4XS6cUE90EQ7jR5UyI2UhJn5J/wE3Wb2khsNoBlm3TnulBVOQx?=
 =?us-ascii?Q?Vu2A474nl6ZkutUCasH7oaOtEuVOoi0u3pgo9RBD38DGRNt15QDfS7ODiS0w?=
 =?us-ascii?Q?w9ffKLh2PdQTaDgJpyz97jgVb4nAYvRb7PCOdlXeVHkpyP73GPPKKKY9uLQ0?=
 =?us-ascii?Q?CBPbziO/bLFHGZmU1sLGOU7WXWy/6HNiUvzBS5lV//Fwx30wibzQAW9ZIynl?=
 =?us-ascii?Q?Ikuw58DrW1xSDAEbnRKqRIM3IFj1G3h0s8Rm94i8fsbjs76ini8UsfSnz7Vz?=
 =?us-ascii?Q?rrJvkT4ZkuMJbAsZIT9MKUVlS5f3atIFr1yGE0WdaDMPdfktXnolOEuHG/vf?=
 =?us-ascii?Q?p4PfN0BW5eOmjqaW3eZ8UmKDyBx9c1/owhR+zQUCtmEuzbCXTbkmojk6DfUN?=
 =?us-ascii?Q?K4f/ncRuLApExOnX2f/8U/dt+r3MhQtkB1L5bfM4qUVtKiylYQGNyUVzYo9H?=
 =?us-ascii?Q?yJiZPlkX8XnikFLZcjm6pGre5oD/9RVz4aB/L+8DKgJggpmbXtqeKJti1kRA?=
 =?us-ascii?Q?Lzg+L3SoduiF5Zbygo5JPk34J65BTsBQFy05MWitv0txouxXVsJbl1YulBH1?=
 =?us-ascii?Q?PK9mfQvo6lYzrjWrYOG0w5KlFKWBJ+wcYkYAmL7Wl90cuzpYe4sUO0cteCUo?=
 =?us-ascii?Q?Smr2IRaJxAkzmylP9IEHBHQFkI0sC/X2IIWry7Lx7XEr42OlPgT6ta++5MKe?=
 =?us-ascii?Q?xHDjrLSCfZLkuhRqfK6yoluD+MEDinjpm4n1tBSZe7iSHXflMx1kOyjQqfO+?=
 =?us-ascii?Q?8XC+uIjHeVrEGXvsbenYPE6b6mSdzatBmFWMMY/6vbu2ttN9WbFhfgJ5//VJ?=
 =?us-ascii?Q?IkWFfA0knnqk5Xy0Z/nCCH2Mt5spgiHPsdduCXDRDYSnWQCQKM8uejH7hH9N?=
 =?us-ascii?Q?If6gj8TN1WhdvXDFjdewbR4zRDfz2KeURnp0Qq4gdx/Wn8rt9wLoGhBIdqey?=
 =?us-ascii?Q?rD+wPBor5Yx3leapfg9c2xG6JJeZHvCyMJaFGHnE8gKR//J3ZbADpveVGz92?=
 =?us-ascii?Q?LlOyrvOjSqaIOlAHGH5Th+uqLKi1UAV1tsvBu5wy5ub2M/lArZQflQ1qf5i0?=
 =?us-ascii?Q?QY9IbOAIQicb3hRE8QatxxUOSN1lRG4NvfzN0pIOnyQWp4+g+CNij4xHQF+J?=
 =?us-ascii?Q?7lH7mEMURJjAMJTRMQnj1zpfa4MA3yYuV3SvxgrfN7C1Q+7LN/QY4uTK9Jg2?=
 =?us-ascii?Q?8CxYSRXdCswRp3xmCt9fXbcnv77AkCk2ed3x1+IsymnKL1WKzKL69798mvKt?=
 =?us-ascii?Q?RcwC2hWB/fD1saq523+lxUz5udoypGglKYB11mfIYhpdiph6UZePHPSFdfcH?=
 =?us-ascii?Q?2Vlh1metT/Nc9OMwlsrC1lPfEhXad9mHU6QcZzpIjvd/liUtYYMcL3nBhxTR?=
 =?us-ascii?Q?ErEl00F4MWXhCg2PWr9NV+5MweXyXX4=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cb2e478-077a-4474-2b82-08da49b3329d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2663.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2022 00:58:42.5199
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V3CtjPGlpYbIwnKPmsX+TYmcM+xROYmmG5MAt7VRiQB4NPCI9kvN1yLPZJGKUDf05jU/U/2TttCXRFFAEQIScQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5126
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517,18.0.874
 definitions=2022-06-08_04:2022-06-07,2022-06-08 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206090001
X-Proofpoint-GUID: dNBDCVqEeGfksdhDcpmZcy8m6vklENs5
X-Proofpoint-ORIG-GUID: dNBDCVqEeGfksdhDcpmZcy8m6vklENs5
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
Cc: jgross@suse.com, sstabellini@kernel.org, mst@redhat.com, konrad.wilk@oracle.com, jasowang@redhat.com, dave.hansen@linux.intel.com, joe.jin@oracle.com, linux-kernel@vger.kernel.org, hch@infradead.org, mingo@redhat.com, bp@alien8.de, tglx@linutronix.de, m.szyprowski@samsung.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

I used to send out a patchset on 64-bit buffer and people thought it was
the same as Restricted DMA. However, the 64-bit buffer is still not supported.

https://lore.kernel.org/all/20210203233709.19819-1-dongli.zhang@oracle.com/

This RFC is to introduce the extra swiotlb buffer with SWIOTLB_ANY flag,
to support 64-bit swiotlb.

The core ideas are:

1. Create an extra io_tlb_mem with SWIOTLB_ANY flags.

2. The dev->dma_io_tlb_mem is set to either default or the extra io_tlb_mem,
   depending on dma mask.


Would you please help suggest for below questions in the RFC?

- Is it fine to create the extra io_tlb_mem?

- Which one is better: to create a separate variable for the extra
  io_tlb_mem, or make it an array of two io_tlb_mem?

- Should I set dev->dma_io_tlb_mem in each driver (e.g., virtio driver as
  in this patchset)based on the value of
  min_not_zero(*dev->dma_mask, dev->bus_dma_limit), or at higher level
  (e.g., post pci driver)?


This patchset is to demonstrate that the idea works. Since this is just a
RFC, I have only tested virtio-blk on qemu-7.0 by enforcing swiotlb. It is
not tested on AMD SEV environment.

qemu-system-x86_64 -cpu host -name debug-threads=on \
-smp 8 -m 16G -machine q35,accel=kvm -vnc :5 -hda boot.img \
-kernel mainline-linux/arch/x86_64/boot/bzImage \
-append "root=/dev/sda1 init=/sbin/init text console=ttyS0 loglevel=7 swiotlb=327680,3145728,force" \
-device virtio-blk-pci,id=vblk0,num-queues=8,drive=drive0,disable-legacy=on,iommu_platform=true \
-drive file=test.raw,if=none,id=drive0,cache=none \
-net nic -net user,hostfwd=tcp::5025-:22 -serial stdio


The kernel command line "swiotlb=327680,3145728,force" is to allocate 6GB for
the extra swiotlb.

[    2.826676] PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
[    2.826693] software IO TLB: default mapped [mem 0x0000000037000000-0x000000005f000000] (640MB)
[    2.826697] software IO TLB: high mapped [mem 0x00000002edc80000-0x000000046dc80000] (6144MB)

The highmem swiotlb is being used by virtio-blk.

$ cat /sys/kernel/debug/swiotlb/swiotlb-hi/io_tlb_nslabs 
3145728
$ cat /sys/kernel/debug/swiotlb/swiotlb-hi/io_tlb_used 
8960


Dongli Zhang (7):
  swiotlb: introduce the highmem swiotlb buffer
  swiotlb: change the signature of remap function
  swiotlb-xen: support highmem for xen specific code
  swiotlb: to implement io_tlb_high_mem
  swiotlb: add interface to set dev->dma_io_tlb_mem
  virtio: use io_tlb_high_mem if it is active
  swiotlb: fix the slot_addr() overflow

arch/powerpc/kernel/dma-swiotlb.c      |   8 +-
arch/x86/include/asm/xen/swiotlb-xen.h |   2 +-
arch/x86/kernel/pci-dma.c              |   5 +-
drivers/virtio/virtio.c                |   8 ++
drivers/xen/swiotlb-xen.c              |  16 +++-
include/linux/swiotlb.h                |  14 ++-
kernel/dma/swiotlb.c                   | 136 +++++++++++++++++++++-------
7 files changed, 145 insertions(+), 44 deletions(-)

Thank you very much for feedback and suggestion!

Dongli Zhang


