Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D29765440DE
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jun 2022 03:03:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LJQp15LK6z3fDf
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jun 2022 11:03:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=eJSPJ8HH;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=UtNPpVY1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=dongli.zhang@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=eJSPJ8HH;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=UtNPpVY1;
	dkim-atps=neutral
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LJQjN56nRz3bqk
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jun 2022 10:59:36 +1000 (AEST)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 258LaE84005815;
	Thu, 9 Jun 2022 00:58:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=XtvlHDdZh3gD4230vY7FcyRi2a6AYz+OtBd4ItiFTG4=;
 b=eJSPJ8HHx9J6N9zOTSz6dFfNp9L1IsrA4/WXY/tUAFTIngJnbmyZjPYbe9Z1hIWlJhBU
 53+G4q3kQcYmnbiZwTfQrvx8hiPzgCQYoZwxYRiGTIusN7MjsN0cWNmFHu2n1BpQRRlv
 GJ5L4tkoQ760fLOe6vRXzkHujsM4BmcavFzsKpqp9/5uqrpqsp3lDGtBt2xOphXQcQKU
 WmX/LxAY40IZi1+8EaWMdoohqvnk44Fysh1nF6CPyEswnMc9JrGBzzFAYmrV/cBP7Jvl
 S0fQjZQqvWRb9vIPE+MKiSCBJtUBD78h//w6hFgfgQxWajFqf1YIdl3VheqrDN57iVf0 1w== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gfyekhsew-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 09 Jun 2022 00:58:47 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 2590ub2w032517;
	Thu, 9 Jun 2022 00:58:46 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id 3gfwu433k8-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 09 Jun 2022 00:58:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=neEi6gW5dVlPDc8Abw2PHApm4mkg58z6NDgBPF6R0QJFJ4KpG96uVc6P8j7lLU76YTj+ci46Rd65Ba8hff6aE8YNonG9xWftFdwf9BmjA9UOEFO7NyUoFhsbkYzGcyq+nfzMJ9rTFCFguHdImE0qP/bMpSr1zMv1cGV2j8IpkUgRyxEwnCGnumcEIC7y9ufHhGTTIjkq4+w+7HhLCWVlbeVycX3434+9XDVrY5NPQnEDRmPWYSBBStm6NVQ0dl0Ypi4SMYB6HndHjJzn76oVRI3stuEghYb1tUBxB3xkaFw5HIjmkMK8OjGkIaonNZAQwFoqZdcvQVnG8UV05kD19w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XtvlHDdZh3gD4230vY7FcyRi2a6AYz+OtBd4ItiFTG4=;
 b=Xu6juY4on7MX5uideiigQaNrlT7hIJLVAB0ZYvALl4l/Dte2HDePMNm7Mi91KiMUPMEVzKFUC7nKnisLpiM46iHvusYWhgUE39PhMEzD8m6w6s4t0Y8HeHfCM1xNz/SLIKmtITanvczQ36Euex9KgLfbVHp6Prwv0jA8vnSimvEjH4qzYUdHUpezYMcGDQp6D/iJgvkQKdB1TxAVv6APayBs7Cme7XtCIcOKlwQ5v7re7A3TTQIA756UoqSkNSH3sUdoUeWsEm38NsiP6h2qwf/7RlWwISVZDhMRXlpM8mxHJf9UelpXGW0SrYqk2wW6Z23x2N1yyrzRD8+TarUdTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XtvlHDdZh3gD4230vY7FcyRi2a6AYz+OtBd4ItiFTG4=;
 b=UtNPpVY1ACRpgMmRrmRcjBu5VwUBRbxUqNex05R5ujyAi7KxnzvR9QVGglpNfXeHKxjtmC6ahJ+ykjHmFIPEYsAV4itK9mQbXfvyv7zysuiFqk973Q1fsRyjFg0TUVcKSHuPHGKi81xqZfWODnBfSjK5GrxMkggoDDzGmNztkx0=
Received: from BYAPR10MB2663.namprd10.prod.outlook.com (2603:10b6:a02:a9::20)
 by BN0PR10MB5126.namprd10.prod.outlook.com (2603:10b6:408:129::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Thu, 9 Jun
 2022 00:58:43 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::7081:e264:cc58:37b9]) by BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::7081:e264:cc58:37b9%3]) with mapi id 15.20.5314.019; Thu, 9 Jun 2022
 00:58:43 +0000
From: Dongli Zhang <dongli.zhang@oracle.com>
To: iommu@lists.linux-foundation.org, xen-devel@lists.xenproject.org,
        x86@kernel.org, linuxppc-dev@lists.ozlabs.org,
        virtualization@lists.linux-foundation.org
Subject: [PATCH RFC v1 1/7] swiotlb: introduce the highmem swiotlb buffer
Date: Wed,  8 Jun 2022 17:55:47 -0700
Message-Id: <20220609005553.30954-2-dongli.zhang@oracle.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220609005553.30954-1-dongli.zhang@oracle.com>
References: <20220609005553.30954-1-dongli.zhang@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0075.namprd05.prod.outlook.com
 (2603:10b6:a03:332::20) To BYAPR10MB2663.namprd10.prod.outlook.com
 (2603:10b6:a02:a9::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0283aaf6-5349-4a61-c529-08da49b332d8
X-MS-TrafficTypeDiagnostic: BN0PR10MB5126:EE_
X-Microsoft-Antispam-PRVS: 	<BN0PR10MB5126CF1B1C76AC85950DD2C4F0A79@BN0PR10MB5126.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	yPsJ0mcCuuSfLdYeZdr85LUR1IrndxSqKmXjvE/QCfV3Glv4mFXezwYdKQsj445Cz72sMs8oWf9USVgd7pxiIKmd+V/r7ROA+oMAUC5prZoBw0JfIcteSBEeU37bLC/2wWfhOPwIWs7RzefRrNQ2kaQyl2AnoteVqv/y5ZCuYkNpFHYBe0wsOkeYk3pR2M71eu7lcFdKaR6sbYsbthQdr9x3YE2IHX7Hs5xLdTKUiWN6hD3pX+ZM4nzNxz2JzxgjxtPt9/EYg4sm9xpgb8NwLJhpuw+HIUenzhdM/J06ImbJ19ipRMjewIGkHoOumAL5tMoWHOAE4bwkGKLUFn9o7MoNxUgFyQYj3TeMgX2HnL8xNi7oio4kTtbWY/JGams1cI/DZQoE59dr4ey6dszjwkSuxTxWXtq44Rq3NZWfyEFJQJbeYau4LS7Q0eny01ZljqSCYCEPcGZPPYBi4/0j+PFlWob+T9GW+EH9HGDGAqlXkXzKX5ciQM3Ej3zE2bYINdU2IeroynBKQlaUk4cOHRjyju0LjsVQZKcqzz34we+J3Rogj9rK6dBMOdXSdtILerV2pUt6u+6rUlXmMHqks3Hn1mCeGMhuVumjFoz/3HP1/whFOOG4jk7S3Zgx2mg345noWyszIbzBzzBzRrNuMCkCBVPCBcw+yZaAZrYLdgGsCu3THNL98nx/2vBcsNq75FBuEXb/GqaE1GjJWSuw6g==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB2663.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8936002)(6486002)(5660300002)(186003)(66556008)(508600001)(4326008)(66946007)(7416002)(66476007)(2616005)(8676002)(107886003)(1076003)(2906002)(38100700002)(38350700002)(26005)(316002)(6512007)(36756003)(86362001)(44832011)(6506007)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?OqkleaNu0ccMHkAYb5Iyd995KHh8covlVc3N71W+JHTtwXDk9T77taMWjGte?=
 =?us-ascii?Q?jkVl7Uu8L/egAwuuzNUMxBR8risBPQvWjmP1jwzkER42SNQK6SkMlVB7w9dU?=
 =?us-ascii?Q?8Umhl/3i1jNaqFp4s6TFNkBNQ+8spMfS3anOpFwuS1rZJ6k52KLgqxltuzGW?=
 =?us-ascii?Q?48MkHUxBhcsD91dfYJ+UjSNdj+bzcap7rJS/4DL42akjnCvEZLy9WbTh8i1/?=
 =?us-ascii?Q?V1KIY5fDzvfwYpbIo/E/08R2ghFHu4jQdYm9MGJowujN5DAyuH/QfAaPNrKD?=
 =?us-ascii?Q?AwuV/YIVu3jdXCRj+g/gNypKhzYVXNizqX/moA6m5of63SFGJgM9Y38WxSin?=
 =?us-ascii?Q?dQUuHvAHxi1Jqeon1VGwd0T9CCPjzh2mBUe46HIK6kjIZo2v1jbz+48ZGIg9?=
 =?us-ascii?Q?RMR3s7D4176RS6SOCdmQpRdCkhBbk4EwbMzfFutldKsv6nv63q0afDXw25te?=
 =?us-ascii?Q?rxQrA+LLWEdLfMnexiShlPr8jpCAVrpoEijJFwGXUSZ3ce/6uMckX+xHGw2f?=
 =?us-ascii?Q?sY3tE5MIPsWZ7dmFNoeJZ9GBqIyJQwleGpVr6wQxhmDmKV8NTGFWXv8jRg3H?=
 =?us-ascii?Q?WNG7PU3ueNRZBVyG6l8sovU5ksgRQM5iWDR+D8cYEO8qq39ffmLBaaWhdQz+?=
 =?us-ascii?Q?4rdiFotxbazqyrrEIwj3H4YvNLv8LumBMm8ml/U00CZLnysRzJYyofTvybOW?=
 =?us-ascii?Q?f3BS4P8oq4Vq0nVi4zRxE82kSigtjxe+pYj/yS289DOU2utHNpAvM9XpA5mt?=
 =?us-ascii?Q?/aAL8IWU2DTVKazq+MHY5y0sN3i4ReCr5V8iDo/i2AArDv0dIiIIsvS6f4pT?=
 =?us-ascii?Q?RHWgG98xVXrksreTymj0s0zUzF1vZTZ+pKoiLSFvePT5pfEg180oFlozn9IZ?=
 =?us-ascii?Q?RAsDVgtRdZy0T6CVZw3vPHd8i9U1vqpYfjLhyjZb4wbCzCE+5XwkQl/dgH6F?=
 =?us-ascii?Q?LYMAOt63A3HqMcKliCkIBm7z8n/OveU5c+tFR+BegYW85FkPMvgJgst1xb1l?=
 =?us-ascii?Q?wT7m2wQNDczMr3qQNpEFEWyBiwWatt7VnoQNXzmjZgiiJ/Q4p9z5PmmX4CWm?=
 =?us-ascii?Q?UT+R6mGgU7coMk7nxmxArlImO1SfQ6RVM/xaNvbxKwgOevUmCWhZJlPv4QDN?=
 =?us-ascii?Q?hHJenoFlUswDfwxxYoyydYI2jfaDTUInxKfMDGiHFMnQle42nyje3/1kjeE1?=
 =?us-ascii?Q?Wt2YiiZu6XFbkmPbLyw0XrpbLfM1CZWF7kp2PFuJVxKcobbaOTkdOi6LMFWL?=
 =?us-ascii?Q?R73nkEh7mRxCRThVmNVk7tkn3knij2dRiHeA4Xv9fdU7/SwJg5fVZCLRTnAY?=
 =?us-ascii?Q?J+J56HMPI6nRCDhZfouIoG2Sy8NcQt/2+6XCL70FuDAhauIsw28d9hb60ChE?=
 =?us-ascii?Q?+XK7HPKqDXU2agHClo2l1xi2BEhtl9DTTtwlrlLrFPoxwyb/kUheVp3vPHAg?=
 =?us-ascii?Q?Mrr3rj0htNQcfLT+9UVNrdrzxprl1yZekIzuXSwkmzqUFtmVp7K0Z00R9MHm?=
 =?us-ascii?Q?RjlV8ly5vjBlSkPxJKrjZ8zU6NigNF0/obFc1kHVa1Dh+wHaKw9oJ629f5/M?=
 =?us-ascii?Q?Jf2oZwICcxPMc5HOBVtiH4bxrHSJDg1lnWZTpfncgzUFfBU8sEgOTo4jhENJ?=
 =?us-ascii?Q?M9jTgp6rbnrciG7JcAcA6jyB+6v1PskzB1B0If5gQLFhgG3D36maN+vw+G0m?=
 =?us-ascii?Q?TlSrr2KVWiNMhvKCIi3gorpTPSm5rqaPjHQUqeK9TsJR4xTz2TwEt3jibXem?=
 =?us-ascii?Q?72E70f07mcHTcwtpDjfTPIQnYK4S0+Y=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0283aaf6-5349-4a61-c529-08da49b332d8
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2663.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2022 00:58:42.8637
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6qGMG3KJcVcpGVdNQeNdjoOh0/Ul5HGLy4Lj9qvJIJO+iV3Z8Cd3/6La03DSQPhWEx6oyqf4xUWaHv7lwO7/pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5126
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517,18.0.874
 definitions=2022-06-08_04:2022-06-07,2022-06-08 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206090001
X-Proofpoint-GUID: EzEjAVIO1vtQw7P_H2VxyecUKO4JRZzM
X-Proofpoint-ORIG-GUID: EzEjAVIO1vtQw7P_H2VxyecUKO4JRZzM
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

Currently, the virtio driver is not able to use 4+ GB memory when the
swiotlb is enforced, e.g., when amd sev is involved.

Fortunately, the SWIOTLB_ANY flag has been introduced since
commit 8ba2ed1be90f ("swiotlb: add a SWIOTLB_ANY flag to lift the low
memory restriction") to allocate swiotlb buffer from high memory.

While the default swiotlb is 'io_tlb_default_mem', the extra
'io_tlb_high_mem' is introduced to allocate with SWIOTLB_ANY flag in the
future patches. E.g., the user may configure the extra highmem swiotlb
buffer via "swiotlb=327680,4194304" to allocate 8GB memory.

In the future, the driver will be able to decide to use whether
'io_tlb_default_mem' or 'io_tlb_high_mem'.

The highmem swiotlb is enabled by user if io_tlb_high_mem is set. It can
be actively used if swiotlb_high_active() returns true.

The kernel command line "swiotlb=32768,3145728,force" is to allocate 64MB
for default swiotlb, and 6GB for the extra highmem swiotlb.

Cc: Konrad Wilk <konrad.wilk@oracle.com>
Cc: Joe Jin <joe.jin@oracle.com>
Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
---
 include/linux/swiotlb.h |  2 ++
 kernel/dma/swiotlb.c    | 16 ++++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index 7ed35dd3de6e..e67e605af2dd 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -109,6 +109,7 @@ struct io_tlb_mem {
 	} *slots;
 };
 extern struct io_tlb_mem io_tlb_default_mem;
+extern struct io_tlb_mem io_tlb_high_mem;
 
 static inline bool is_swiotlb_buffer(struct device *dev, phys_addr_t paddr)
 {
@@ -164,6 +165,7 @@ static inline void swiotlb_adjust_size(unsigned long size)
 }
 #endif /* CONFIG_SWIOTLB */
 
+extern bool swiotlb_high_active(void);
 extern void swiotlb_print_info(void);
 
 #ifdef CONFIG_DMA_RESTRICTED_POOL
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index cb50f8d38360..569bc30e7b7a 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -66,10 +66,12 @@ static bool swiotlb_force_bounce;
 static bool swiotlb_force_disable;
 
 struct io_tlb_mem io_tlb_default_mem;
+struct io_tlb_mem io_tlb_high_mem;
 
 phys_addr_t swiotlb_unencrypted_base;
 
 static unsigned long default_nslabs = IO_TLB_DEFAULT_SIZE >> IO_TLB_SHIFT;
+static unsigned long high_nslabs;
 
 static int __init
 setup_io_tlb_npages(char *str)
@@ -81,6 +83,15 @@ setup_io_tlb_npages(char *str)
 	}
 	if (*str == ',')
 		++str;
+
+	if (isdigit(*str)) {
+		/* avoid tail segment of size < IO_TLB_SEGSIZE */
+		high_nslabs =
+			ALIGN(simple_strtoul(str, &str, 0), IO_TLB_SEGSIZE);
+	}
+	if (*str == ',')
+		++str;
+
 	if (!strcmp(str, "force"))
 		swiotlb_force_bounce = true;
 	else if (!strcmp(str, "noforce"))
@@ -90,6 +101,11 @@ setup_io_tlb_npages(char *str)
 }
 early_param("swiotlb", setup_io_tlb_npages);
 
+bool swiotlb_high_active(void)
+{
+	return high_nslabs && io_tlb_high_mem.nslabs;
+}
+
 unsigned int swiotlb_max_segment(void)
 {
 	if (!io_tlb_default_mem.nslabs)
-- 
2.17.1

