Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B655440C4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jun 2022 03:00:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LJQjt6nn3z3cBK
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jun 2022 11:00:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=gDOfPRTV;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=VO1LAZBo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=dongli.zhang@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=gDOfPRTV;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=VO1LAZBo;
	dkim-atps=neutral
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LJQj85cyPz2xX6
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jun 2022 10:59:21 +1000 (AEST)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 258LTarE020255;
	Thu, 9 Jun 2022 00:58:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=AFRDbEqu5zmJCte4xJD2iO6rtVuuAhsG60fCY4JHBq8=;
 b=gDOfPRTVfJBGUiamq1Dx5kN8F1arWpKRQawNtWH7QiCaNf0KcaDUL73cvaLCdPXaVOrC
 iKJFVcq1uaX7otlciAJJDx7/5tPjA3KWbDevRLiJA1k2GR3gO3yb6oYMoelkfPlGzJ/z
 V+o8o+836hNBncDu3DVkBKcFsFAT+R5VtHhT6bu20CY2M2lKNL61t0DkXfCLrHsIGCAK
 N8lYol9wo0ZhAkTN4RVjQap4UV4GvP0m+hTwHi9pw6YEXglojgPswWUBhzI7ED7hJ2yk
 9Q4+3lgSeCHSGYFl4D6PIoTsn6v3BD4+SABJ4910DTJjRIZcdMGNneFxjJP9ifpafSK9 +Q== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gfydqss4h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 09 Jun 2022 00:58:49 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 2590ub32032517;
	Thu, 9 Jun 2022 00:58:48 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id 3gfwu433k8-6
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 09 Jun 2022 00:58:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EdTiufipmwD2ag4/7wOWhJZgzqIvnb3SE7aQpB1SIL3+cWicA1lGG7q8r6gxOYiSyt+UddfWr+oUGJ+T4CwC4Ks7B1QAWxgBi2AyL6z4UdsSLFsUFIUAPS/KzG9wzeHIXCpz9gWBPmV2MdiojsXllCYwLbFsousUQL408eFihTZuRIzoiXb4nuxM50b51G4yVGtdPDcdyGDhlDMKSss9jshZPI/TapEsX3WZaxWVa4mS6LIaQVPEIBt5isfguL86vhlk3r0mDJ8a/mN89ik38Uyj4ZzBFpWC/5sRQd3FnD2FiXr0jLhYHE0nBTyKXcoNzedNMSmfEg0MEfOF+xQGZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AFRDbEqu5zmJCte4xJD2iO6rtVuuAhsG60fCY4JHBq8=;
 b=gPH/IRag3x0LijN2SrdYttT7/FAlhx7HzhJIdJEngCDUrj6tKM+h8C3hOF8fNzF6tobvxDyehI+sfrrZ9SHWXzpGbCDmYx6KVp9AS5/5CJ+c3IirsrqUspeC5CJ7NH8glgqR1gtz3/6P9kxZGv/+Dr6TFscfjXU8VJVeoBcUOvW1P9eCkFUTDJJ5D7sQrQbTHY5tSUmjiZF2HregBZKYPq1/TfDsZY5UE1LgcwFG634I5g+HjDfimognLFCXUamicsSKm3ERkwHEjI+MokQ8/1DKf17VGBing/6ipLahuKfsN2Qa3TYTZwdb+7fIBIcoJnNEMVTb88m41e0P7H6WqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AFRDbEqu5zmJCte4xJD2iO6rtVuuAhsG60fCY4JHBq8=;
 b=VO1LAZBovLMvGkMmlUIi8iVMK9Vcpb8f+1Z5ml3xKOTlcO646GV7KwlyaP7PzCbqb04xA3HYcj26g4vQhGZUnneaLWjQCmQrBeEzsQzqLYjZubgxJXqmdvsEgcmEMDVQcJkc6tFuAffKWwa8uck+uyQZBv+eETRB/bmpx3GXxZo=
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
Subject: [PATCH RFC v1 5/7] swiotlb: add interface to set dev->dma_io_tlb_mem
Date: Wed,  8 Jun 2022 17:55:51 -0700
Message-Id: <20220609005553.30954-6-dongli.zhang@oracle.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220609005553.30954-1-dongli.zhang@oracle.com>
References: <20220609005553.30954-1-dongli.zhang@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0075.namprd05.prod.outlook.com
 (2603:10b6:a03:332::20) To BYAPR10MB2663.namprd10.prod.outlook.com
 (2603:10b6:a02:a9::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 98e30956-dd49-46d7-b758-08da49b333b1
X-MS-TrafficTypeDiagnostic: BN0PR10MB5126:EE_
X-Microsoft-Antispam-PRVS: 	<BN0PR10MB512694566F1AE8AC5204E513F0A79@BN0PR10MB5126.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	eo6mTZhpT+LeYbsiAQpywSST18f0/OTlhdpZbh14ogf/ywMB62Jpkafs9VIOTG/Vm959hqLo4VYWLNyZZGO/XXkn3BXIHu18LAQL7gaK1TZ/RoWSK7xgELYIvlmlyEDQyHEz0EJJoEtTiQ7oVaxGfdM75TQ97fpiianExRIYoJRvvHoDiApm4xB6sbr8uO9RJsL4D8lC8DWRGk3IuJUGX+PFeEtIIkzhOcxpO0/3+mBP51dCqLmri4XbdgZ1Ch2d4wVQsOUCOYfcZp7yXAYi1kZrCC+lFpWhWaQ5uKi/bnvZCfAJkJTHk3DG9PdZGpjhyJbtv8QsZMlHtL8jr0LrBiDtrDGSMygdeMRQYB7SBbkJFpOjZt5aXk+QWuXer6ILhh8g8uEWvHucQxBw5j+6+DQIrpIAz6eZiL6+re8y8ERAW0X+wllc0ei5vIHcUzHYNWpGqpfT+shCJqIlmJQx3F1cZaGKVV6KdLtWJ0zSAObXK/gRVqkqeadPkGbPpDGvj9H5ZbFgNmPEwd9OhQEVXi1xMGgXznIEhsd4hHF0e69O7xTyGQASoW8FO1n7fZqReBPAvLAfH2JE98yDMaZssY1gGG/LtgfoVrjwk1PbfXaN3rwghmOWTB8I5D1DAMwTHuaRiSW/PhvIPelSSIwWZ/3ARDSmSQpBgRrbOOjPkUlERvB6pRndyCEGYbLq402lqghoiYxNJnid3AJ8B23nhQ==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB2663.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8936002)(6486002)(5660300002)(186003)(66556008)(508600001)(4326008)(66946007)(7416002)(66476007)(2616005)(8676002)(107886003)(1076003)(2906002)(38100700002)(38350700002)(26005)(6666004)(316002)(6512007)(36756003)(83380400001)(86362001)(44832011)(6506007)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?7Ctv44MLU4FssVzQB8FUAgT+Zf8xZTolAx2orqFrRI8ZbFIRuDKfB70HRZAq?=
 =?us-ascii?Q?NDOP9RhC3XpPmW6UMojspkCFoetrkpMhNvXJOBASxW+jAQ4QTV7i7IfjlCyc?=
 =?us-ascii?Q?KQ7y1aGNQvlZDCDW44RKGEZTQaCFziHIZtQsMgshf92AKEHiSdmnrh7FklXu?=
 =?us-ascii?Q?hTQg4jxpQLVjXwb8PPwZIEbF5bYPQ+eq7yWXi8OsOGy3UhSFNOzoe+yC0U6X?=
 =?us-ascii?Q?y7iFzrRagrOBOgOb5XNYSMmYoQjCejzEatpld4EOGxSJlc1WBNvY0CpK1dXy?=
 =?us-ascii?Q?9W9wSQ8rramx3o8gzw8kGhdWSo8t381JuEJqT/0qMnkXRXuwnvnGCgEMErjP?=
 =?us-ascii?Q?Csw+os1+k51h9wiptcJ5QNIZXlKiHyq58vzE99rEYWFcaBkSs8ZpkTwv4zm0?=
 =?us-ascii?Q?ll/tC7VmijboQljTywQaztfenlz7gW+wnRGdAE80nE8MrFdpoT0vCyJCxT8B?=
 =?us-ascii?Q?rLlSsC+o5jWeNDdX5HMpGSbSzCAKpsrqkpde7Jsmbj4b+oBGWqzl/7PBWVzo?=
 =?us-ascii?Q?zb3WHsTXMNZc7DZg28uTMsGUTkU4yp6HmiBEJReWbuqlPpO7Ix5DEpVotutT?=
 =?us-ascii?Q?vJfRU50RGXhiBff7qcWXlIJCDiQqlu/vG476NAbbJQkpuo5+gSIctgFAmplf?=
 =?us-ascii?Q?MSUj79NHCCtw85NRnVqHyBa0l9dO2ODFNO2or8tfQZbOXJtFMwaXRl88/msl?=
 =?us-ascii?Q?dKuFmEvxgTUIzWExF0W0G8ublCq4IjkFFy+2jye+gVzdrIk9xP+yHv9ACcY8?=
 =?us-ascii?Q?XRfRHKUJqLp5UzIFNGkuKb+WczAFciHGxIvEjjYmnFyRxgwnfS6ItQUpvz4k?=
 =?us-ascii?Q?IipOhkCw1cRl6yWPAjuG9xKRWeQA+ngz6nBytcAvpMKbs5xb87dSD5poB6FH?=
 =?us-ascii?Q?M0WJ3tkpxVmfDWf/U8SG4XRJAEqsDnDR0iV3KITGWrJiIs4h3h45LsrikgQE?=
 =?us-ascii?Q?cn+QnykfDHe2wPYDawFf1godlJ2PqiGzt+LQ2qDBrYKjnqkTpyqOsMYwFHfz?=
 =?us-ascii?Q?SIGCRiPnVn6gFIfugOQGP79ofkBq2zjY7kwTk8gN1xcdAwEcXMiflm8HW+k3?=
 =?us-ascii?Q?QwTdTCQp5Os00W6wTuPjV80QDEmKXp7bnZtW2u6+iQIK3aDrEaM2dkloOvoX?=
 =?us-ascii?Q?mCfJvozG+dbxMaReRHqV5xItsICAkNfdsT5PsOzVnqEnTB35zjerWIod0HSb?=
 =?us-ascii?Q?N7UnVlkatFUTcR7P/GNwxzivqGh7XNlGpxMRNU8BEm/QxhqTc+XLWjmB7V8j?=
 =?us-ascii?Q?eWIB4C/X9O0wiAu9nnIMyhHESNOgmaL2vfNN6dLfl63GeKG4hTPU3aKjKhNv?=
 =?us-ascii?Q?UU8Ip5Fv+UyxvERii5E9ZMs3aemTg/Ii0a9UT04XIbdsxLFDzUeYchiIhilp?=
 =?us-ascii?Q?zEp4QLdT0XLmy+gdRCHiH7Dl4TOQHbFSWRdERXGE7Gkaq++Fr/qmwbT17dTD?=
 =?us-ascii?Q?vjoGpDXIJYjy26F+VNeEdu7J+UCvHSsOsQOnOBUN2qOdkzmI5O1p+OLPNA+2?=
 =?us-ascii?Q?4vSEnTpwVwGW9MztojYay4gzzjYSp5GBcBC9fs95DItYu2JH70ywPp3+PHqO?=
 =?us-ascii?Q?ja49oWJhkzQrPDilOCPcu363AufRgIaGZcGxmvcSb9aVHZSmgSSPU8sZH10I?=
 =?us-ascii?Q?pJ1Rrh4uO5s7ID+Iva2k2WPlFhNhsidsLBEESot6UUqeNAtthaEHb8VlJ9At?=
 =?us-ascii?Q?FCZqfVCpzitWErJbl2dNqMoF5Sb4uCfVailwB/h7Avg6EYMXcGN9q1Hx7+mM?=
 =?us-ascii?Q?y9eMpGLBRtWJy2amksb+NZhljTlsM5w=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98e30956-dd49-46d7-b758-08da49b333b1
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2663.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2022 00:58:44.2854
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n3lY1NrAlt7noMAHkn6b+9NJkykI9dZEIaSm/1GB1FA6f9mkLXclXdYbdT3y9VoDyShIOhPy7+9U2OLeJeIJBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5126
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517,18.0.874
 definitions=2022-06-08_04:2022-06-07,2022-06-08 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206090001
X-Proofpoint-GUID: Qnr6QbV_IucdMdA0svBJTgRweeORWUAO
X-Proofpoint-ORIG-GUID: Qnr6QbV_IucdMdA0svBJTgRweeORWUAO
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

The interface re-configures dev->dma_io_tlb_mem conditionally, if the
'io_tlb_high_mem' is active.

Cc: Konrad Wilk <konrad.wilk@oracle.com>
Cc: Joe Jin <joe.jin@oracle.com>
Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
---
 include/linux/swiotlb.h |  6 ++++++
 kernel/dma/swiotlb.c    | 10 ++++++++++
 2 files changed, 16 insertions(+)

diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index 8196bf961aab..78217d8bbee2 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -131,6 +131,7 @@ unsigned int swiotlb_max_segment(void);
 size_t swiotlb_max_mapping_size(struct device *dev);
 bool is_swiotlb_active(struct device *dev);
 void __init swiotlb_adjust_size(unsigned long size);
+bool swiotlb_use_high(struct device *dev);
 #else
 static inline void swiotlb_init(bool addressing_limited, unsigned int flags)
 {
@@ -163,6 +164,11 @@ static inline bool is_swiotlb_active(struct device *dev)
 static inline void swiotlb_adjust_size(unsigned long size)
 {
 }
+
+static bool swiotlb_use_high(struct device *dev);
+{
+	return false;
+}
 #endif /* CONFIG_SWIOTLB */
 
 extern bool swiotlb_high_active(void);
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index ff82b281ce01..0dcdd25ea95d 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -121,6 +121,16 @@ bool swiotlb_high_active(void)
 	return high_nslabs && io_tlb_high_mem.nslabs;
 }
 
+bool swiotlb_use_high(struct device *dev)
+{
+	if (!swiotlb_high_active())
+		return false;
+
+	dev->dma_io_tlb_mem = &io_tlb_high_mem;
+	return true;
+}
+EXPORT_SYMBOL_GPL(swiotlb_use_high);
+
 unsigned int swiotlb_max_segment(void)
 {
 	if (!io_tlb_default_mem.nslabs)
-- 
2.17.1

