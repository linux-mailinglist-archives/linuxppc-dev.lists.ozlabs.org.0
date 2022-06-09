Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB8A5440D8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jun 2022 03:01:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LJQlT2G30z3dqr
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jun 2022 11:01:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=c8ecfA8I;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=u+e8Yh1d;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=dongli.zhang@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=c8ecfA8I;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=u+e8Yh1d;
	dkim-atps=neutral
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LJQjH04KXz308C
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jun 2022 10:59:30 +1000 (AEST)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 258LWi9k005804;
	Thu, 9 Jun 2022 00:58:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=fg5JBE/9uMN3vIcpEYAyJ0dIp33/fBmQIiC1iTsr1WI=;
 b=c8ecfA8I9303nu/0kGzmJIYtPOzcKd590kKlDyQrHDCr8JpfAvlj0+lybJYLbrC11QAC
 grlG6RfxSfiuxg4B0fQYmoZ714LR5cuJSDS+NUyoO55oAaD1Cy7q1xUiivKRTUaB4u6l
 1ychTytz6BbmcAFGk8ZOWsmWtn3EBkI07oH6tXSeOZlL6XMzOK5Lzyex+uZwT82ssde4
 4jGsQUYfHnqmBn0bRu/LpIGPN3/d/LwdrTdBCN//OKHMYBJ0PHsAkenQcXmX06gJ/zRB
 u/WGbSW0HjjoPhw2Jo3AkzV7S0cPJOWstCuWAKPhXyQ4l19GIae9YYGkOsv2Wn1aNZz0 sg== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gfyekhsey-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 09 Jun 2022 00:58:49 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 2590u8Rw003540;
	Thu, 9 Jun 2022 00:58:48 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id 3gfwua5eeu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 09 Jun 2022 00:58:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UaxlOS4FSWP+dY8KXuHtKJoZaZ0sy2JK0zEgDdp9/+1ipm/bPO3EQE5KEaHVAGeu5ICjvdNXVmm2w1gwcSRZgjduXewAOvQRhoNHFtLzpKupGdRgfruQskk5qhKKWM0Pj393MvVFWL2fL174lbIuYquGEKBZyqsfjSkWxfnM2KrrphzJ9QXlNRv8uKH4/GwQ6N6/0GYFkMLosxGVEfELcaQsP7Ia0LZE3n6tqVMSb3VBsseoChQenPSL0RLbKot3W2lG64/Cxefj+9fEA/hV3VPi/wJSHwB+c5FMbHS3wYFc3JYaO1InDbi7ncPjZQevSwcj7UNW1m+THaqmlIxyhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fg5JBE/9uMN3vIcpEYAyJ0dIp33/fBmQIiC1iTsr1WI=;
 b=fKLmA99xmJ0FTMfqsHuuH6sqfvQWQSLdbwiWtD1L+k9GKCP0OGwz0gEGIhcSGXTBBIuByTXArZg+cVyU+CxGQbXFriu+izrIb5xsItvafXQ2CarzDQPPAmopm7aCyNfSN423dLpQ3v5uS3/H3jZEqPyclLXKfqm2PWnQfHfCuW9Dsee6oOnk/QkWWzgH0eYyoDhJapegEnk3MG0p4zXwoGT6V7mCyttgWq7jfvv9Kg7fE1iA4NF4DVuhR3QfZSC1st/HpJfDfYnZ/sq8+osdxDSU4acsOwNC9eORu+yc7bJhT80vEH8njAiRRj9VQ0F7dSKcdqDmWYsGVdfbS/qF1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fg5JBE/9uMN3vIcpEYAyJ0dIp33/fBmQIiC1iTsr1WI=;
 b=u+e8Yh1d4As1vyyiJemOOK4t02FrXNJv8mA4Y+RWupf5VkGizwVDoSIw+aH1Dq0SHnGuc+0/pp84az59LgrTKbErcBYQXq0VBJQQWlUHI5qZP1ri6uhTavFhVTkQeCnkRAnzf02vOZdR/BJ9EZM2e6U69vKCVrZTlNmpdU8RtSc=
Received: from BYAPR10MB2663.namprd10.prod.outlook.com (2603:10b6:a02:a9::20)
 by BYAPR10MB2488.namprd10.prod.outlook.com (2603:10b6:a02:b9::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Thu, 9 Jun
 2022 00:58:46 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::7081:e264:cc58:37b9]) by BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::7081:e264:cc58:37b9%3]) with mapi id 15.20.5314.019; Thu, 9 Jun 2022
 00:58:46 +0000
From: Dongli Zhang <dongli.zhang@oracle.com>
To: iommu@lists.linux-foundation.org, xen-devel@lists.xenproject.org,
        x86@kernel.org, linuxppc-dev@lists.ozlabs.org,
        virtualization@lists.linux-foundation.org
Subject: [PATCH RFC v1 6/7] virtio: use io_tlb_high_mem if it is active
Date: Wed,  8 Jun 2022 17:55:52 -0700
Message-Id: <20220609005553.30954-7-dongli.zhang@oracle.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220609005553.30954-1-dongli.zhang@oracle.com>
References: <20220609005553.30954-1-dongli.zhang@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0075.namprd05.prod.outlook.com
 (2603:10b6:a03:332::20) To BYAPR10MB2663.namprd10.prod.outlook.com
 (2603:10b6:a02:a9::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 68ae0a81-e49a-4ce9-8c6f-08da49b333e8
X-MS-TrafficTypeDiagnostic: BYAPR10MB2488:EE_
X-Microsoft-Antispam-PRVS: 	<BYAPR10MB24882BFDD1E7717ABF485D1DF0A79@BYAPR10MB2488.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	rF7S5TckleDeTqTJl6VVjAITpeCO04cKVpBXJL5No918B+UpPSWPDAvoDhIKUJj5kE4dkaJl1aBAB5nS3FwTdF4+pFTt1RedQ62bFE2qnEG73PuVKZT14ps7d0btJGHX+wTLbj8Rpdh4RBbDMQxo24TVWdyML2XjaHrSEcmJo4Kclqb3RBuOafbCOyJPWZ7aFz10aI3cEJ8x8bkZ1gbt95seAPYi2iXR+/dOQOiyJGeVSTRIlY9+c9tJ3l2r/ETWjl/+MAasU3caA3WuL8a1juyHyjoB9unljCMpsAhw9DSu0z0TUejKmao3vo7ivWCakw225d9iWlbQMB1jd/R2+xVW3XnQ0INVlVdx0yejRnH/GJPXAx/Cxg4OQ8xfmkXlyc+YEKuRXOe5CUy3CRPdWsr5m3o6m1XR7Ay0LjpoXArFH5v6yjHqgRBR+NnfBjs20p0Hin5YWDzA4ttFrHN25MnBSj/QRFT70dmd8haKEkSInWRki2Dg3KaAn5Nxmda2A5SrQpD+wwYjPsJRGStm033ClcU2iNGG6PoXD7rbhZIpCNM96V21pf80ZFYBZXqNj0pWRWTlaiB8GTngYPe/4QN8BN/i/GZoZsmqFxsKrsYVU3jX6Ckjh722kl+L/6ICZWGTjOtYenRUfcJD0E0dbbq1yWlIdbsRnTHPvBAC+LGFn3BiRnNcunWOc7iBHxEkJ9ZTzxLEC2E5yt3QzIBgGg==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB2663.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(44832011)(36756003)(5660300002)(38100700002)(38350700002)(4326008)(66946007)(66556008)(66476007)(8676002)(316002)(6486002)(52116002)(26005)(6666004)(2906002)(107886003)(6512007)(86362001)(1076003)(186003)(83380400001)(7416002)(6506007)(8936002)(2616005)(508600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?OfE2mbk/d4ZjDpuW/3GlLsKLX4ZjEXJM2MW+bi0sMEAMQibcTwBr55VTBgcs?=
 =?us-ascii?Q?rS4Zdi4HO1HAhH4w7Yfm/Bq9ptWzNT81nqTPzVVTezeq3sc1WF90tEhqm/ew?=
 =?us-ascii?Q?xYE63zrApzRmTdqOtUb5cb0XjmMlhnBypX8zjlesPPGE5HzF8ecq89svW4RM?=
 =?us-ascii?Q?CUec66iyLeV+NA8fFf6eedhfnfcqwGimehfRxmjEQLWJaNsVvgMSbpuMHshp?=
 =?us-ascii?Q?Yiz+xTdyS1rv1DJCDPrfVcUtpnh/2yzmtMRKnA89HFng1iUmUxifk7E/gZzu?=
 =?us-ascii?Q?P2FagjQIbybNykoETQb4eKVQ8cyp6fOlu5enCExy5NtyaHodrJD9X2lav75l?=
 =?us-ascii?Q?944ZO5RfiiYcxlLaxxEGgfYCcOtnrYJs6H30b3q4Q+sExUSmbamRRl/2opB6?=
 =?us-ascii?Q?xP+Wea46t3Sz84QwQEi9y7QbgMrPE7ij5Wl4xMPZaFTiJiBb9AOfFQxiDjcP?=
 =?us-ascii?Q?aZJVuPZtPoAcIAfYxxlHswP8v145SpvnMUIWAxFo9ZR9U4WUTGH/fyZSqoc+?=
 =?us-ascii?Q?FRyx/0Xx/hQ5A8FBHH5XDJSpjgO5AgnEwzqAR1Bkc7d5d3xbADLuZwsXrTry?=
 =?us-ascii?Q?zo9wUdl3BvnyujTifsp8kdpmmV3adWsK0Wxvo8s3tcJHoxiRuXder16hWLqL?=
 =?us-ascii?Q?MI8XA8gmb0qsJvMdMMGmpiQGhmQv0uMR6M7W6qRiobFMS2x07H8vAumE//ST?=
 =?us-ascii?Q?+p04L0Z6/cK90jHduUzjDJfKw9WNfVS6YoC2ZoY8aHeUqMMpCKDmn+Bno1UW?=
 =?us-ascii?Q?tdK/hRbAXEQgOGs3VkfI/faPBiK9k77fyZ7N5Y5MCENxSPQA1qJlYMghAEMS?=
 =?us-ascii?Q?JiTxmufmPZoZCscb/I1wtszrZ3ClNSSGLUxKdIfxi4/6HyAyJ92LUSYui4C4?=
 =?us-ascii?Q?qtK1ID8U2XSs1ZVr7U7+XlwcpJgwdOd8opBaGNUC6NSipN5tiwRROKmb8+8T?=
 =?us-ascii?Q?vtEW83CbqnkTld3teVvmE9ah5mo98zVbcAGv4VF8jvQlV95jGNV4LdD0gdKG?=
 =?us-ascii?Q?k59TF1smnkFdWnt7uz+bNuOQkfcM+fFmREj9wdXt5AWM3UAwsv6mfVj0lUzo?=
 =?us-ascii?Q?98iLpw7PpAeH/QiuDMYVZK/e558FZcz3E9a+heD5ZoLN9dcJ+RWGqkXXsgEc?=
 =?us-ascii?Q?yq1c9aC0d4pHYV807nCgDw5WoLc+ElIE35AUyLuIkEQezbeMGy9cxnBSITVH?=
 =?us-ascii?Q?sizuYr5e6U1/ZYj5UIM8uo/YDoLVVy3f8FIlPcU8HefuYNvLr8TR0fPdXI4w?=
 =?us-ascii?Q?mLPkWGwHJt/3so8a39OCstGINse96PovSjkF2pwOfTCoYRAEeygoEVgmKv2k?=
 =?us-ascii?Q?d+3RP4qRqNJ/O2mgPAfdxLXIQXSdZt2HxhskT9tmpKN9IPE9nFaX3nixy7IE?=
 =?us-ascii?Q?QY69H7GNZupwMTlt3sQhEYiSfVPZj9bEyQzno8VCvKDaODqGjfOVtIj4e2y3?=
 =?us-ascii?Q?9yhWm/gVOlS1P+8X/RWt55ybWhBFsp6/bzFLvIGj3ieUfLrbzsjAJmYspR3v?=
 =?us-ascii?Q?cBYexcunEJw78dyU3vb+Z2L5DQXTzeEekYqGlhEwmVEBjIHuC2M8ULCJ7eut?=
 =?us-ascii?Q?u31PdLiMoX11iJ7hu5/wQfTYH8j46Iz+sDr67BHkZ+PjronOs6S7fpToYIPw?=
 =?us-ascii?Q?JloM9YYr0bxLYebQMqrSG+ACXMmxfaaWiTPPi5W3D7DoM7O+Kw/AZvkJxU+Y?=
 =?us-ascii?Q?dABYbuZL5llypjK3qk0PPvUegEZeJJd79r8wKGKZdVAPdAHPKxERyv9AEwER?=
 =?us-ascii?Q?yjcm2YFoZlxeTQlkEridJYLjIBaji9I=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68ae0a81-e49a-4ce9-8c6f-08da49b333e8
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2663.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2022 00:58:44.6448
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U8tCX3jI++97fFdKG73OhS/Bsx2w1/ExREvbONLR5S+W7c4dp+9Sa8GIf27TNsZEKgUGIUtn9y4XcoULFtUbpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2488
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517,18.0.874
 definitions=2022-06-08_04:2022-06-07,2022-06-08 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999
 adultscore=0 bulkscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206090001
X-Proofpoint-GUID: pu1VdrVJqh7XmXDZttnPoU3K2016-zGU
X-Proofpoint-ORIG-GUID: pu1VdrVJqh7XmXDZttnPoU3K2016-zGU
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

When the swiotlb is enforced (e.g., when amd sev is involved), the virito
driver will not be able to use 4+ GB memory. Therefore, the virtio driver
uses 'io_tlb_high_mem' as swiotlb.

Cc: Konrad Wilk <konrad.wilk@oracle.com>
Cc: Joe Jin <joe.jin@oracle.com>
Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
---
 drivers/virtio/virtio.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/virtio/virtio.c b/drivers/virtio/virtio.c
index ef04a96942bf..d9ebe3940e2d 100644
--- a/drivers/virtio/virtio.c
+++ b/drivers/virtio/virtio.c
@@ -5,6 +5,8 @@
 #include <linux/module.h>
 #include <linux/idr.h>
 #include <linux/of.h>
+#include <linux/swiotlb.h>
+#include <linux/dma-mapping.h>
 #include <uapi/linux/virtio_ids.h>
 
 /* Unique numbering for virtio devices. */
@@ -241,6 +243,12 @@ static int virtio_dev_probe(struct device *_d)
 	u64 device_features;
 	u64 driver_features;
 	u64 driver_features_legacy;
+	struct device *parent = dev->dev.parent;
+	u64 dma_mask = min_not_zero(*parent->dma_mask,
+				    parent->bus_dma_limit);
+
+	if (dma_mask == DMA_BIT_MASK(64))
+		swiotlb_use_high(parent);
 
 	/* We have a driver! */
 	virtio_add_status(dev, VIRTIO_CONFIG_S_DRIVER);
-- 
2.17.1

