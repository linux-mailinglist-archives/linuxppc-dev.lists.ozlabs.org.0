Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B86E5440E0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jun 2022 03:04:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LJQpq64GMz3fJt
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jun 2022 11:04:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=Gya0bw4J;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=kz7d9eEY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=dongli.zhang@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=Gya0bw4J;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=kz7d9eEY;
	dkim-atps=neutral
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LJQjP1KM4z3brH
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jun 2022 10:59:36 +1000 (AEST)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 258Lidrt019514;
	Thu, 9 Jun 2022 00:58:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=M/N7o1znb6+4t73Rt8rz95E2Jxw2jCfaHcqkKvbe9ys=;
 b=Gya0bw4JEUWXE/atEtc5x/alQ08k/QUchkav3+RzJUTpBnltxNj1U6d6nrZ+bG1YnwuF
 8Y+SmNNcRbaIEuiTJuipSUO2Hri1T8eDz7UHRMc+XhRLa3B51BZE01LRp0UU7SJ3MTHl
 0cwI7+3//OQwsnAxQ070KUix4owodF4AaZHU77LEwJ5OGcx4DSj7tuoiU0NLgZpTnOSd
 rb5kkN9iH7SZbll2odesOVekqkza0OCKjyMjT4YiYWO7s92qA9xivXd2AoHfWkUgn/8n
 j5UD4j9A7DCBZ5BflvUGJNVNX1FVWnkXceLQvYAqC+V95aSi30tdGFbN7PZ06rPsoRgO 2w== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ggvxmyyx8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 09 Jun 2022 00:58:48 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 2590ub30032517;
	Thu, 9 Jun 2022 00:58:47 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id 3gfwu433k8-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 09 Jun 2022 00:58:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UrEJa2uSqi+BAtxWq+iBQ/ga37NHjFLPktbd/xc5ovtpitnSoP9QSineRW7YquRy0jVtdXp9FupCpztSFmKQE6NIzIZ/OA0jFPWF79OBTNTGCWglo/Q4WMtpiR62doLKD8BXKb1zxsdxqdHMhXySyU4AOTzDeUx00pBcGUtegbG/Vek4P9EL+WvcF+aBeQZYooHXu/o2aQy9STv/AD7io+d6pRyFtqvAMgcC/d4kIfGoOK+B83eaKe2cxn2UJTgKJ92zOW3plD7KfiCZnbd04gppM0HCeSeivoBFQ7Inc0/XkUz6CEFu3uwYTBKdEg2FKEc3vGBvaAEDsuVzJ9uxwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M/N7o1znb6+4t73Rt8rz95E2Jxw2jCfaHcqkKvbe9ys=;
 b=NSbA6ZqeZ4xy4CiAFscA/20R0/xH1OsoqjS5b2ZqWD9v2ZvUBKeKgQ9EJ7ADzqGtfbvLUA2XpGbrV41A0yLwoI5MYDb0Jkf/n9zoAMsVMfhB4MDF9xoxJ5fdJ+i6i1OAWwYUAXeprqaqmPexaXpdhvWtrfb7kDOuo45fuWo2CtLpQx8/PCm22HTtEHDQXcLN6TJ9jdTBq4LyE+Yb38Q+IvoLo9ucjy2z1ZDwDGU0ksDGnQWfEY7dQDdQSBKkIUP5qJLIFgVcqggPSYGoPQx3eC09/vQy1gZbwXqVZoj50rBsTU1HkEY7lky3evZO/mu3ROhn+rdxpVQHAZL30S+PAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M/N7o1znb6+4t73Rt8rz95E2Jxw2jCfaHcqkKvbe9ys=;
 b=kz7d9eEYc1z3c4MrHkpSPwQd/nqcZ4UCFnvKXZlzNxjtHNyqxwMzqpjDhRsjjbD8y1SQkrpN5yKWJpq//cQa2clMWs1UrhYA8dDtBNmwgaCL2mdgPILUnZf+h2/iohElky11JTuoiU/0kRGiDFJAzYaZs8WdEDgtevRMoY6vTX8=
Received: from BYAPR10MB2663.namprd10.prod.outlook.com (2603:10b6:a02:a9::20)
 by BN0PR10MB5126.namprd10.prod.outlook.com (2603:10b6:408:129::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Thu, 9 Jun
 2022 00:58:44 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::7081:e264:cc58:37b9]) by BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::7081:e264:cc58:37b9%3]) with mapi id 15.20.5314.019; Thu, 9 Jun 2022
 00:58:44 +0000
From: Dongli Zhang <dongli.zhang@oracle.com>
To: iommu@lists.linux-foundation.org, xen-devel@lists.xenproject.org,
        x86@kernel.org, linuxppc-dev@lists.ozlabs.org,
        virtualization@lists.linux-foundation.org
Subject: [PATCH RFC v1 3/7] swiotlb-xen: support highmem for xen specific code
Date: Wed,  8 Jun 2022 17:55:49 -0700
Message-Id: <20220609005553.30954-4-dongli.zhang@oracle.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220609005553.30954-1-dongli.zhang@oracle.com>
References: <20220609005553.30954-1-dongli.zhang@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0075.namprd05.prod.outlook.com
 (2603:10b6:a03:332::20) To BYAPR10MB2663.namprd10.prod.outlook.com
 (2603:10b6:a02:a9::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ecf46f83-b4e4-4d7c-6f67-08da49b33346
X-MS-TrafficTypeDiagnostic: BN0PR10MB5126:EE_
X-Microsoft-Antispam-PRVS: 	<BN0PR10MB5126D6F1ED1C21EA78AB5946F0A79@BN0PR10MB5126.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	3sK869Yt+t4hcqRY8O5IczGhj4jkhP3lpnIE7kDM1DEGTJOIi0fv7I78m0N7kpbrdCTNaOiWHwuu3sXNF289GBHaP903eyAadm6Uo2DXtnGgkvJWzhi0TKkFpINf8Fo9g4VzQ7d0/fp1yzpomuayG3WJyvBY3pLWv60vSvCx6skdM2quROsETipfArrmlx2hpyzCij5huL8kLAZKLb8/NrrmW8nUTOeUZcchb9mIJ4T8Yh8fgES3t9aQ42U7z8eNt7031TFLEL9CXWFZTiEEbogfuzMaayoeVxPaZRUqsBc4LYpJK8MWEvePeKmGBq0nFBI5yEadA1AnhVDLRW528acSmDb0tdwGWvdRhybLVPhV31YazlmzVKQ6lhRUx0fzpY1wSI5U2aG7nMi2jMU9v7+kK4cXu3lmsfZSqIu2YF2Fy5si0N/B1QQSfbYQHHPAapV5Z6Ki4sENdy0Z2bNRqqWkIJHzsGF3bnqUwGwfFJ5y54Yb7bW1j23rkShFM1yezKQuDh9dX4rkRI00waWugCCtzlC91bmXFn67rUzDg3XkArI/wB90avNI1u2y+SGHltNB4QkffyBNEk+NZ6A2hH1dbdGVY1SLk4L+7x4p1F6ZjRhFBuAbCAsS60O2ybFoVfUsGk0OxNJExKSN7KiAgiuKKS364Afz7yFalcQuCOpEk4CnGaFrBszvlrqQPSlaLCkn68ns+P0RvFe6glI6MQ==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB2663.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8936002)(6486002)(5660300002)(186003)(66556008)(508600001)(4326008)(66946007)(7416002)(66476007)(2616005)(8676002)(107886003)(1076003)(2906002)(38100700002)(38350700002)(26005)(316002)(6512007)(36756003)(83380400001)(86362001)(44832011)(6506007)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?sfgOr+8UOIHRQ9h1HrP2h4gTUpqVmHaZY3cOSyzq5TX5E60Iix8nNwlOk6op?=
 =?us-ascii?Q?qQ3FUKz8pPs+VSYbysYg1f+Zc/RIwYtXJAk7uZtegageY8Y3gpJ0GJWdesSW?=
 =?us-ascii?Q?OqR3i/iFMiwupduy5ShrUFx4QH7+6ZKGQ893NRbONBzLYnM/JAB3KS7YySuq?=
 =?us-ascii?Q?uywklzD1ibTWugePuvfwtNG2UOYqwyFIsgeZefsf7eYCbIxMPsL22XKNPxnk?=
 =?us-ascii?Q?AUBsRhUx1+sJLpwpeC3dil3tfSiW5LOr+24uIArUmddVWZFYvg9obOvlhe3a?=
 =?us-ascii?Q?SV+Aj+wkMgyJEZDduc3pbrNokfU3b2IWl/EtmHyJCveiXXcyXS6dkstYCepl?=
 =?us-ascii?Q?lRsiGM704IVQ0SgB5S8v+uQfaRq/UxPk81XNt1nC6D8RNduVLV5C3FhJ33Z3?=
 =?us-ascii?Q?F6Y7oxSiBwOleP7IHrnN0f/HzZUz+ankO2Pu8EnpPU9YfhHc0AttAa1FV0rd?=
 =?us-ascii?Q?SFlCj2Gl2qBTpxqvP0iPzyrX6h1ayfiLbjt0Y8+RAqtieqKO57JGeKl6EW6/?=
 =?us-ascii?Q?ma6h+KfS2BxlEamK/w+oNnAdTqLb3ZR1cV8VaubQ+x+dAQpfx/f6cBtOw3yI?=
 =?us-ascii?Q?BYmChkUJpDnV9U/uU2pcMzMrvBCtLsPZHp66bf7I1xSCVxXqzQMSw4cHv5H0?=
 =?us-ascii?Q?3bfjCJhsO8ZNjJo+rWIYkRgD61hQNHLqipEqKGPhSPrVKsfo/MuEUatNpeY0?=
 =?us-ascii?Q?cc71RP7PH1RFqwWhWvB3G5TfR6x/RTzqhY5hJLA5TIn2PUJDDMp9NwgaAOH6?=
 =?us-ascii?Q?TUrjrIxdwNQYOyRTuEFSOJ3tT/sZp3x5ZRrwWm5CuO9ypNiEftYGE0P7IACM?=
 =?us-ascii?Q?Rgq3l1HoglWCknpoeHz5nQooVaHj+dcpeaa0Z5BWK71H+XvxMNK/tb5LP0mm?=
 =?us-ascii?Q?YZ5P+Y2DP+GkT6gU4oIm+dZHJmSHB8ChtJ8WoZX1E/ZIuCP7tEdN7enAYaML?=
 =?us-ascii?Q?RpFd8RYnkrh2cCQswC/tbO+aa8PEZ9utW/yz5/Kbi7nULi9T9fsdEUpYPQ83?=
 =?us-ascii?Q?dfat2rgVFZVxafSSgj+U0B2jijQsAkzPlriQdaF7gyeY+v1YZMXne2UPh+76?=
 =?us-ascii?Q?57zwKBjFhHtpyg8voeQwX3x4Fq2wiB3RqP2eashyM0JRmzos8YML92oze6LT?=
 =?us-ascii?Q?l2eZQnQzPDrrE4EDDEr7TJUcsDOzCBVBmmUDhlHMbDSMSeGDPbJ3sUeprYE7?=
 =?us-ascii?Q?JVAdVWYZeoYG9TsYm6UDBVZVwoL6Qe5nhBvBvW2au8ms/o2L+df3QmwS8Vy+?=
 =?us-ascii?Q?WsU/i+E2RS7VW8NgDM2U9qAsARspmwhq8NJdUY3v7x85VW2XATottkAj9z6K?=
 =?us-ascii?Q?XNayvuYuAwHII1JrKC2BMqMnynBEmVyhJZbIU+qfURKBX9cB84zFjILyiQic?=
 =?us-ascii?Q?5lWCQXKq5mFP0U+dwg76H0KHNpdFe3tn4dE68xHALh5Xz62smoE4RcO+gDr2?=
 =?us-ascii?Q?H8buvZd5cCXFhRmrfpja0q4moCPVJM8c8J9nH/O3VcprC9sUDrcm4/sgWcyq?=
 =?us-ascii?Q?73rYESTIGmeczX3PrS8ZBS4jWSnYgBaWjQOkz+D8eE0BZuyvK6G1F8kGUJNY?=
 =?us-ascii?Q?6zNXgZpz95Awa2Vs7KOVxz2YBL2xnp1T8g7LSDxz2FocrNZqxuIOvCectB+A?=
 =?us-ascii?Q?QHsrpC++9DuIPaB4JMZ2Gre+qG3nSF+4AHsf4QnW8yJlwZH9tsoHHy74nx29?=
 =?us-ascii?Q?+cnx3vLpqNhHFiob6Cz1zakOqzRxnuQmTTneTBIPS09+A59IvR/zH/W/+2hu?=
 =?us-ascii?Q?CFOVTAIO6QZ0qroxi9FBwSHupoKI2Xc=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecf46f83-b4e4-4d7c-6f67-08da49b33346
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2663.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2022 00:58:43.5667
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JbPhiEqyQnVmI+eCEuwlTjZtQpRe2rp1ezhhToipkCg2LIAnizsl7/YPuKNfQXMLxyuF5+GehHtTpKxnEUC5LQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5126
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517,18.0.874
 definitions=2022-06-08_04:2022-06-07,2022-06-08 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206090001
X-Proofpoint-GUID: 3b6ywZH7eCaeEphEqt9imafHd3QE9lGi
X-Proofpoint-ORIG-GUID: 3b6ywZH7eCaeEphEqt9imafHd3QE9lGi
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

While for most of times the swiotlb-xen relies on the generic swiotlb api
to initialize and use swiotlb, this patch is to support highmem swiotlb
for swiotlb-xen specific code.

E.g., the xen_swiotlb_fixup() may request the hypervisor to provide
64-bit memory pages as swiotlb buffer.

Cc: Konrad Wilk <konrad.wilk@oracle.com>
Cc: Joe Jin <joe.jin@oracle.com>
Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
---
 drivers/xen/swiotlb-xen.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index 339f46e21053..d15321e9f9db 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -38,7 +38,8 @@
 #include <asm/dma-mapping.h>
 
 #include <trace/events/swiotlb.h>
-#define MAX_DMA_BITS 32
+#define MAX_DMA32_BITS 32
+#define MAX_DMA64_BITS 64
 
 /*
  * Quick lookup value of the bus address of the IOTLB.
@@ -109,19 +110,25 @@ int xen_swiotlb_fixup(void *buf, unsigned long nslabs, bool high)
 	int rc;
 	unsigned int order = get_order(IO_TLB_SEGSIZE << IO_TLB_SHIFT);
 	unsigned int i, dma_bits = order + PAGE_SHIFT;
+	unsigned int max_dma_bits = MAX_DMA32_BITS;
 	dma_addr_t dma_handle;
 	phys_addr_t p = virt_to_phys(buf);
 
 	BUILD_BUG_ON(IO_TLB_SEGSIZE & (IO_TLB_SEGSIZE - 1));
 	BUG_ON(nslabs % IO_TLB_SEGSIZE);
 
+	if (high) {
+		dma_bits = MAX_DMA64_BITS;
+		max_dma_bits = MAX_DMA64_BITS;
+	}
+
 	i = 0;
 	do {
 		do {
 			rc = xen_create_contiguous_region(
 				p + (i << IO_TLB_SHIFT), order,
 				dma_bits, &dma_handle);
-		} while (rc && dma_bits++ < MAX_DMA_BITS);
+		} while (rc && dma_bits++ < max_dma_bits);
 		if (rc)
 			return rc;
 
@@ -381,7 +388,8 @@ xen_swiotlb_sync_sg_for_device(struct device *dev, struct scatterlist *sgl,
 static int
 xen_swiotlb_dma_supported(struct device *hwdev, u64 mask)
 {
-	return xen_phys_to_dma(hwdev, io_tlb_default_mem.end - 1) <= mask;
+	return xen_phys_to_dma(hwdev, io_tlb_default_mem.end - 1) <= mask ||
+	       xen_phys_to_dma(hwdev, io_tlb_high_mem.end - 1) <= mask;
 }
 
 const struct dma_map_ops xen_swiotlb_dma_ops = {
-- 
2.17.1

