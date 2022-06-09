Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 573185440D1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jun 2022 03:00:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LJQkg1N16z2xKm
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jun 2022 11:00:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=GMBqDZK+;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=dojvVz+u;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=dongli.zhang@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=GMBqDZK+;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=dojvVz+u;
	dkim-atps=neutral
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LJQjG75nkz307B
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jun 2022 10:59:30 +1000 (AEST)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 258LYAah017875;
	Thu, 9 Jun 2022 00:58:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=nekokp8TW4nxfgOy/dsnG3rVJSWVzWzy9psuFT1B75U=;
 b=GMBqDZK+PAwYlUzMbGQhxJM5l0kHoHp/ZTShoUcvDMnTueiJYk7+aWp6Dj8jhcWPSI85
 HeFi1msOXWEebXsuQs1i7XKs3ebwu6vMtnK/JARTCRvIUgDqmFHyy/W4PCC00z8ijQvQ
 4r20InFx8Xhj4L/EnpqcmmpVxVMhXYAhwqK7sJiKY6BlaVmjw/zVzW8m/gdyN4iI70VW
 Ded2/qDF/G0dNbQ1PaqJRau4rQ5AjJ0Amm2C05c+iSglP36FPGwDtyIyakQ9DDsja2aq
 W7PbYRN+70zFkFMWe1whg4CYR1RfWkWgVDagxpmagbGN9jAEQf0kX71EqvCueEscQ/1c XQ== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ghexefa62-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 09 Jun 2022 00:58:49 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 2590ub31032517;
	Thu, 9 Jun 2022 00:58:48 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id 3gfwu433k8-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 09 Jun 2022 00:58:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WgZ33u82gVHs+34+LlKyvBPTKxqgvVMrF7pZnmHxZoHs4VsmdXTjQEMQ56/POBJxCufdYYdhrz83mDE0B4QLYIf665CyWmISA+qnx5hgDmIRuzQcgjYtK0psUtczzzhLVPDMN9es9WbCt6aFkFy82Winj5Ikgke0rFySDD7/X4EJ0d2f0yf9rtbxnOOA9E/4E5dz1RVShZ0bbLu8UZjdUGV0y+5/oz8OpsCFKeXCLzG6jn2VB7EgoOH2/X/vQJeP6Z+pxYGy5YW4q1wIed8LPB1Pbt2LjfYs86+OwwsGt5+LhuohRVe41kR6w3VHiOhUXcHWvZCKkvPSJSkHXJO4eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nekokp8TW4nxfgOy/dsnG3rVJSWVzWzy9psuFT1B75U=;
 b=LGgfjynM+7CwFq5AdgRrUhcTWXYmRVXc1aqmvpTcUeIirRwi1ZoO993xAbmC6vp988oyQAP0BJ2+E/E4VA0xSVRe8oFj93rt7Jm7Ye+WgxpVzO5CCYkbHj6xNwcfjx283HBB75OGDKrlDF1+6PtZWgPa0XxGVemfV7KfmfuYq46fMWvMAsMq08M1HxXFjLj3SLVi5VYwUXyqBQMgGqh1HkkgNd3wahqvJLxEXUhXfELMViecAqofkTYI938n39nKzW2H7HoiDcU+TVKKgTt5J0tYw8F8efuItONUq/ILwMq9Mq+br9jqlxMYLKao/jcQ3fYFD21TtN6JDcjRCL44eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nekokp8TW4nxfgOy/dsnG3rVJSWVzWzy9psuFT1B75U=;
 b=dojvVz+u0/uvYoSYrL0wtDfV4g0AvMj6XWxh0nY0t+RCakvbkLBxGGndrgt+UGfpmA7BzLpm+LMNziv0ffJG5xiPDAmSkMNzCK0/L9YwbNBqZd7UOay0Z4WH68HPd2OKtiktyYDwF3IIRyR3rq7bA/dFxDup7+u7IlnYgVWbRcg=
Received: from BYAPR10MB2663.namprd10.prod.outlook.com (2603:10b6:a02:a9::20)
 by BN0PR10MB5126.namprd10.prod.outlook.com (2603:10b6:408:129::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Thu, 9 Jun
 2022 00:58:45 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::7081:e264:cc58:37b9]) by BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::7081:e264:cc58:37b9%3]) with mapi id 15.20.5314.019; Thu, 9 Jun 2022
 00:58:45 +0000
From: Dongli Zhang <dongli.zhang@oracle.com>
To: iommu@lists.linux-foundation.org, xen-devel@lists.xenproject.org,
        x86@kernel.org, linuxppc-dev@lists.ozlabs.org,
        virtualization@lists.linux-foundation.org
Subject: [PATCH RFC v1 4/7] swiotlb: to implement io_tlb_high_mem
Date: Wed,  8 Jun 2022 17:55:50 -0700
Message-Id: <20220609005553.30954-5-dongli.zhang@oracle.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220609005553.30954-1-dongli.zhang@oracle.com>
References: <20220609005553.30954-1-dongli.zhang@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0075.namprd05.prod.outlook.com
 (2603:10b6:a03:332::20) To BYAPR10MB2663.namprd10.prod.outlook.com
 (2603:10b6:a02:a9::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f6344bf6-302d-401e-7fea-08da49b33378
X-MS-TrafficTypeDiagnostic: BN0PR10MB5126:EE_
X-Microsoft-Antispam-PRVS: 	<BN0PR10MB5126C91F431E8CD443CABD44F0A79@BN0PR10MB5126.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	3AvNmZ5CCbdviHODH6y40fVAdyczC50JrU2fTllizQb59n8MhDlm8SZEkseXDAEeDHWBLifws7IWqQOkcOZPR2OVPpRRTgt5SC1nQm5iM27IzypGZINdflLDL6Auj807bsC74y2XMW1Ng3LV4GE20UR4+mNpWss/3Ob4V7lMx8Tmt2jFNGvcOg9GjVsIPrLbSytpXSRRnKfYm+7UvYQ6CKlGyMFly1Q4JLgezsxSEd9uJMbBiqshXmcADXPOfrFSTNuI9VvvvgdJX65Ny5QQFclwEV/URAWY79qVFLy8bagdBBsP0JmXgydi1XrpIDV0p6TXXb1a1dzBtD3BNnW8nFx67xtFSpnGxW1dK08FXCUEPPlT92Bqd5Q4BAY7gx5b/+5y5yDVuI0m/gZKqxsmF4zCG4OD7wb0lDRdfWkh8oJNN2iPd+uPTgAHGBsvEAIA7+kdt5SX3XqfJwKru28/GMJ271AoTcTNxWQTqqGF5HRf5rsiLdpMIZ163wg1nj9tmmYIETm3s1tXJc399/fBE8FiyxdGpNZ8vz59anD9JuLHP10UqBNk8MyT4xGEImA+jVNHHcGSQ4aI78BMItdRCgsk9ENcMDwyHk841vno8ubcUCWbVsp+i5fAZT4k3x01RLtO56QIey15lnfBGRZMzggG5lIfw+7Qw42xZ0M2zkUMvXNgPd0cXuUpf/PYvjdYnQWag9b3C7WtnyFnxYceIQ==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB2663.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8936002)(6486002)(5660300002)(186003)(66556008)(508600001)(4326008)(66946007)(7416002)(66476007)(2616005)(8676002)(107886003)(1076003)(2906002)(38100700002)(38350700002)(26005)(6666004)(316002)(6512007)(36756003)(83380400001)(86362001)(44832011)(6506007)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?0qxQmydipRe6x+4KxK/g0yP+vjf71C3oD4ELdMTU1X/iKIpS+rxB2yX5GvM3?=
 =?us-ascii?Q?6MtwxwutCpdqbBYsfo3VT9u3RSG76AeGDcE1ucqRUEE+gR/Y/+miL7ipgUSa?=
 =?us-ascii?Q?aegXAuOF8vpCiMuoiUXymqfPoQQIwqZdhqorKtfLN13LJYLZ+FtH/3RS353c?=
 =?us-ascii?Q?EXJogWzkX/XDGwDKL9lVyJETfVqAkDhFq/m/MpY4aXdHXvMk0+4Ud2VGWEQS?=
 =?us-ascii?Q?yvhNYimXq0fh6vkXIGwiYMAU6y9v5kipTvr9lKlF5CRMEBi3YNWkZhRjjgf2?=
 =?us-ascii?Q?UTT0GW4kuCXH89ZRI/o2fw198IQqazPm2N0K60oK27B1LH8KfcOs86klF2xK?=
 =?us-ascii?Q?6KPvQjXVo7HqKpDriZgVBEbQQ0utNRanaOiiIm+pNH1phpwugf0Se2ihR2a1?=
 =?us-ascii?Q?8fjEeMDBGEfHVkpbzuEkgm+nyvfGdy3xwVFOCgrrHeyus4Sh/A6HzYnsK/L/?=
 =?us-ascii?Q?9M+lujldAGUX62k1Mq/bjRZ28fqENPpxWYGTfQR4TgfnnshYvfGHU+AmkLvL?=
 =?us-ascii?Q?dGIMlRW7Bd9QXtDVhUDFXiYyWqWQzplmhuba8A2B5DQEIzIjWmzXEX6B/nKB?=
 =?us-ascii?Q?/rsNPtny1+F5RcuNFYCvgobBcTQGXUulYsxgSgx12YG3RbjKs+P9DucAalP+?=
 =?us-ascii?Q?003uhcfM7IL2XPhSlDnzwKIp6SUAawebkfjhyFgJZ8p02QOh33F1pcBEszlp?=
 =?us-ascii?Q?Q9TgWlYulY/I8ZJHrWdNi1cM+tWrNlx1w0tx+WVUOz328tDrbzRJJKsXO7mq?=
 =?us-ascii?Q?kG9zYI04x7URSothWZgPiyfQlw1CUHBxb+hHRsRnawGys2LUXG5haUzxr1+M?=
 =?us-ascii?Q?F8Qo6ky6PQeXaDtF5rGpAG8u8K/pnOJ/T0jlzZxkbnJTw+V19S0143VQXJzR?=
 =?us-ascii?Q?n+ijzGDkK7CG0dFizF2nQkJ9F/6M3yHL6CN/hya2RG3hFswMSnxSnlDOfY0f?=
 =?us-ascii?Q?7txGA9j0jJlbGn9H3ea1yCkWk5fWsUcACyBzAb8BTaZti/dq6y6x5qBhtZbw?=
 =?us-ascii?Q?+mTj6AUSIMdqgX0UBUEDs/smbljYrdVT1J+VlLRicdNVgMw58bQy3JJ4RukZ?=
 =?us-ascii?Q?QkbQC3KZM+Wri4UBNdERQa6GfJMIaSCyNb9bpUfbiuxcLt6C6pdxj/11gyEv?=
 =?us-ascii?Q?qIbdFMtw9+hu6Necp2x0aCk2Jb7Y6ceGd5+MF8zlLuIC/TXeJeUCs0pOLOqy?=
 =?us-ascii?Q?bik+I+aPJ45+RXQQ8PnuaJG2rXGUxY9B9nRjpyBA+1OUk7egs8RFKJkrZBMa?=
 =?us-ascii?Q?z6X+3PnfrpccXeVz71pXC9rh7oe9exNxMSBA4Mq3UMJpxL1V1CMLh2CplbJj?=
 =?us-ascii?Q?GR3XK3vBpn3CIB0b+lAW+ywA69KMx1RbICb8OFfYHMu7rsLLx5r3DDHKgMTN?=
 =?us-ascii?Q?DbBtqRC9uMF/yBg9GpFy9ZCFhM1FHy2r5SN8il6c9SOJGeAdHI9CnR8xf5sI?=
 =?us-ascii?Q?GedOgs+Q1a9zKnRb8FZqgxzXq4pxrL3Fp3kax/TIbApfT8iaYoksiyZP5kme?=
 =?us-ascii?Q?JM7pkU+oHFfbpnwm6BYH+JWnuC5zoutucLIVtZB0v6Q9dKOBqXszL+OdHFf+?=
 =?us-ascii?Q?Sgz/okE2R/63J7LqBfOVv4thINQQHneM8TJnQOWirmgbpkGPxsRXdYk7Jtsi?=
 =?us-ascii?Q?WkZ5zG5vX8uGJPjyp7+JwEXbCEDZiCspHkafW/XjyhX5yIh6Ucchra4RINU8?=
 =?us-ascii?Q?VT8Jzs2qNRxmts7a3BUn2iQ1QaxYjgQLJSMbINAJNmza9Nd5VPKjjLybRuNF?=
 =?us-ascii?Q?e13WfbMEfIezRj5QybDpVXZUPH9CzB8=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6344bf6-302d-401e-7fea-08da49b33378
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2663.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2022 00:58:43.9105
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QbmrOfoWVaceqq7p3y9j6JLtOdNu500cOzOywMJ88LRFf9Aw04woiaUj2UrEnUplKciIQVh3+lFqRiN3fhajwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5126
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517,18.0.874
 definitions=2022-06-08_04:2022-06-07,2022-06-08 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206090001
X-Proofpoint-GUID: jVJJJsSBSr0KhW_JAr0g-MNbDxv5_E8_
X-Proofpoint-ORIG-GUID: jVJJJsSBSr0KhW_JAr0g-MNbDxv5_E8_
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

This patch is to implement the extra 'io_tlb_high_mem'. In the future, the
device drivers may choose to use either 'io_tlb_default_mem' or
'io_tlb_high_mem' as dev->dma_io_tlb_mem.

The highmem buffer is regarded as active if
(high_nslabs && io_tlb_high_mem.nslabs) returns true.

Cc: Konrad Wilk <konrad.wilk@oracle.com>
Cc: Joe Jin <joe.jin@oracle.com>
Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
---
 arch/powerpc/kernel/dma-swiotlb.c |   8 ++-
 arch/x86/kernel/pci-dma.c         |   5 +-
 include/linux/swiotlb.h           |   2 +-
 kernel/dma/swiotlb.c              | 103 +++++++++++++++++++++---------
 4 files changed, 84 insertions(+), 34 deletions(-)

diff --git a/arch/powerpc/kernel/dma-swiotlb.c b/arch/powerpc/kernel/dma-swiotlb.c
index ba256c37bcc0..f18694881264 100644
--- a/arch/powerpc/kernel/dma-swiotlb.c
+++ b/arch/powerpc/kernel/dma-swiotlb.c
@@ -20,9 +20,11 @@ void __init swiotlb_detect_4g(void)
 
 static int __init check_swiotlb_enabled(void)
 {
-	if (ppc_swiotlb_enable)
-		swiotlb_print_info();
-	else
+	if (ppc_swiotlb_enable) {
+		swiotlb_print_info(false);
+		if (swiotlb_high_active())
+			swiotlb_print_info(true);
+	} else
 		swiotlb_exit();
 
 	return 0;
diff --git a/arch/x86/kernel/pci-dma.c b/arch/x86/kernel/pci-dma.c
index 30bbe4abb5d6..1504b349b312 100644
--- a/arch/x86/kernel/pci-dma.c
+++ b/arch/x86/kernel/pci-dma.c
@@ -196,7 +196,10 @@ static int __init pci_iommu_init(void)
 	/* An IOMMU turned us off. */
 	if (x86_swiotlb_enable) {
 		pr_info("PCI-DMA: Using software bounce buffering for IO (SWIOTLB)\n");
-		swiotlb_print_info();
+
+		swiotlb_print_info(false);
+		if (swiotlb_high_active())
+			swiotlb_print_info(true);
 	} else {
 		swiotlb_exit();
 	}
diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index e61c074c55eb..8196bf961aab 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -166,7 +166,7 @@ static inline void swiotlb_adjust_size(unsigned long size)
 #endif /* CONFIG_SWIOTLB */
 
 extern bool swiotlb_high_active(void);
-extern void swiotlb_print_info(void);
+extern void swiotlb_print_info(bool high);
 
 #ifdef CONFIG_DMA_RESTRICTED_POOL
 struct page *swiotlb_alloc(struct device *dev, size_t size);
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 7988883ca7f9..ff82b281ce01 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -101,6 +101,21 @@ setup_io_tlb_npages(char *str)
 }
 early_param("swiotlb", setup_io_tlb_npages);
 
+static struct io_tlb_mem *io_tlb_mem_get(bool high)
+{
+	return high ? &io_tlb_high_mem : &io_tlb_default_mem;
+}
+
+static unsigned long nslabs_get(bool high)
+{
+	return high ? high_nslabs : default_nslabs;
+}
+
+static char *swiotlb_name_get(bool high)
+{
+	return high ? "high" : "default";
+}
+
 bool swiotlb_high_active(void)
 {
 	return high_nslabs && io_tlb_high_mem.nslabs;
@@ -133,17 +148,18 @@ void __init swiotlb_adjust_size(unsigned long size)
 	pr_info("SWIOTLB bounce buffer size adjusted to %luMB", size >> 20);
 }
 
-void swiotlb_print_info(void)
+void swiotlb_print_info(bool high)
 {
-	struct io_tlb_mem *mem = &io_tlb_default_mem;
+	struct io_tlb_mem *mem = io_tlb_mem_get(high);
 
 	if (!mem->nslabs) {
 		pr_warn("No low mem\n");
 		return;
 	}
 
-	pr_info("mapped [mem %pa-%pa] (%luMB)\n", &mem->start, &mem->end,
-	       (mem->nslabs << IO_TLB_SHIFT) >> 20);
+	pr_info("%s mapped [mem %pa-%pa] (%luMB)\n",
+		swiotlb_name_get(high), &mem->start, &mem->end,
+		(mem->nslabs << IO_TLB_SHIFT) >> 20);
 }
 
 static inline unsigned long io_tlb_offset(unsigned long val)
@@ -184,15 +200,9 @@ static void *swiotlb_mem_remap(struct io_tlb_mem *mem, unsigned long bytes)
 }
 #endif
 
-/*
- * Early SWIOTLB allocation may be too early to allow an architecture to
- * perform the desired operations.  This function allows the architecture to
- * call SWIOTLB when the operations are possible.  It needs to be called
- * before the SWIOTLB memory is used.
- */
-void __init swiotlb_update_mem_attributes(void)
+static void __init __swiotlb_update_mem_attributes(bool high)
 {
-	struct io_tlb_mem *mem = &io_tlb_default_mem;
+	struct io_tlb_mem *mem = io_tlb_mem_get(high);
 	void *vaddr;
 	unsigned long bytes;
 
@@ -207,6 +217,19 @@ void __init swiotlb_update_mem_attributes(void)
 		mem->vaddr = vaddr;
 }
 
+/*
+ * Early SWIOTLB allocation may be too early to allow an architecture to
+ * perform the desired operations.  This function allows the architecture to
+ * call SWIOTLB when the operations are possible.  It needs to be called
+ * before the SWIOTLB memory is used.
+ */
+void __init swiotlb_update_mem_attributes(void)
+{
+	__swiotlb_update_mem_attributes(false);
+	if (swiotlb_high_active())
+		__swiotlb_update_mem_attributes(true);
+}
+
 static void swiotlb_init_io_tlb_mem(struct io_tlb_mem *mem, phys_addr_t start,
 		unsigned long nslabs, unsigned int flags, bool late_alloc)
 {
@@ -240,15 +263,13 @@ static void swiotlb_init_io_tlb_mem(struct io_tlb_mem *mem, phys_addr_t start,
 	return;
 }
 
-/*
- * Statically reserve bounce buffer space and initialize bounce buffer data
- * structures for the software IO TLB used to implement the DMA API.
- */
-void __init swiotlb_init_remap(bool addressing_limit, unsigned int flags,
-		int (*remap)(void *tlb, unsigned long nslabs, bool high))
+static void __init
+__swiotlb_init_remap(bool addressing_limit, unsigned int flags,
+		     int (*remap)(void *tlb, unsigned long nslabs, bool high),
+		     bool high)
 {
-	struct io_tlb_mem *mem = &io_tlb_default_mem;
-	unsigned long nslabs = default_nslabs;
+	struct io_tlb_mem *mem = io_tlb_mem_get(high);
+	unsigned long nslabs = nslabs_get(high);
 	size_t alloc_size;
 	size_t bytes;
 	void *tlb;
@@ -274,7 +295,7 @@ void __init swiotlb_init_remap(bool addressing_limit, unsigned int flags,
 		return;
 	}
 
-	if (remap && remap(tlb, nslabs, false) < 0) {
+	if (remap && remap(tlb, nslabs, high) < 0) {
 		memblock_free(tlb, PAGE_ALIGN(bytes));
 
 		nslabs = ALIGN(nslabs >> 1, IO_TLB_SEGSIZE);
@@ -293,7 +314,20 @@ void __init swiotlb_init_remap(bool addressing_limit, unsigned int flags,
 	swiotlb_init_io_tlb_mem(mem, __pa(tlb), nslabs, flags, false);
 
 	if (flags & SWIOTLB_VERBOSE)
-		swiotlb_print_info();
+		swiotlb_print_info(high);
+}
+
+/*
+ * Statically reserve bounce buffer space and initialize bounce buffer data
+ * structures for the software IO TLB used to implement the DMA API.
+ */
+void __init swiotlb_init_remap(bool addressing_limit, unsigned int flags,
+		int (*remap)(void *tlb, unsigned long nslabs, bool high))
+{
+	__swiotlb_init_remap(addressing_limit, flags, remap, false);
+	if (high_nslabs)
+		__swiotlb_init_remap(addressing_limit, flags | SWIOTLB_ANY,
+				     remap, true);
 }
 
 void __init swiotlb_init(bool addressing_limit, unsigned int flags)
@@ -364,23 +398,20 @@ int swiotlb_init_late(size_t size, gfp_t gfp_mask,
 			     (nslabs << IO_TLB_SHIFT) >> PAGE_SHIFT);
 	swiotlb_init_io_tlb_mem(mem, virt_to_phys(vstart), nslabs, 0, true);
 
-	swiotlb_print_info();
+	swiotlb_print_info(false);
 	return 0;
 }
 
-void __init swiotlb_exit(void)
+static void __init __swiotlb_exit(bool high)
 {
-	struct io_tlb_mem *mem = &io_tlb_default_mem;
+	struct io_tlb_mem *mem = io_tlb_mem_get(high);
 	unsigned long tbl_vaddr;
 	size_t tbl_size, slots_size;
 
-	if (swiotlb_force_bounce)
-		return;
-
 	if (!mem->nslabs)
 		return;
 
-	pr_info("tearing down default memory pool\n");
+	pr_info("tearing down %s memory pool\n", swiotlb_name_get(high));
 	tbl_vaddr = (unsigned long)phys_to_virt(mem->start);
 	tbl_size = PAGE_ALIGN(mem->end - mem->start);
 	slots_size = PAGE_ALIGN(array_size(sizeof(*mem->slots), mem->nslabs));
@@ -397,6 +428,16 @@ void __init swiotlb_exit(void)
 	memset(mem, 0, sizeof(*mem));
 }
 
+void __init swiotlb_exit(void)
+{
+	if (swiotlb_force_bounce)
+		return;
+
+	__swiotlb_exit(false);
+	if (swiotlb_high_active())
+		__swiotlb_exit(true);
+}
+
 /*
  * Return the offset into a iotlb slot required to keep the device happy.
  */
@@ -786,6 +827,10 @@ static void swiotlb_create_debugfs_files(struct io_tlb_mem *mem,
 static int __init __maybe_unused swiotlb_create_default_debugfs(void)
 {
 	swiotlb_create_debugfs_files(&io_tlb_default_mem, "swiotlb");
+
+	if (swiotlb_high_active())
+		swiotlb_create_debugfs_files(&io_tlb_high_mem, "swiotlb-hi");
+
 	return 0;
 }
 
-- 
2.17.1

