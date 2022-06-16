Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C400A54EC01
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jun 2022 23:06:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LPF8s4qPFz3bt8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jun 2022 07:06:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=B2p8Jqd/;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=C9p5tBpb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=mike.kravetz@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=B2p8Jqd/;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=C9p5tBpb;
	dkim-atps=neutral
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LPF843zbCz3bWD
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jun 2022 07:05:50 +1000 (AEST)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25GIjgZg005235;
	Thu, 16 Jun 2022 21:05:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=corp-2021-07-09;
 bh=QpZCpUTTzEh4ele31B2viMEnUBgQKg4lMJANWXODm2w=;
 b=B2p8Jqd/iGgzsqQ6GhW3RYT6Nqz2Cp5kwshsnQKxG59Kpqm5TlCiX5D+KHvLN1awAL80
 4ei/v5JtOxV7Fngq84/A+sDvfiTwhuKSjS4qwuN/RddKSsTFxU54//nFhJpgzYQI2Cse
 lxPOlSPPrGwtwpgzb+hwnf42Qu+QNbvgzUn2UpIZ7V5zfcsQImjCpBK7o7ri5v9rrsWh
 BGG1l1PNgKF3JG1LBrOzxrtoqwx4hG+tY0bgimvvmkU/ibgSPyqBpI2isxQuq/67qEd+
 dA8uwZ1Sh81KiEOmSOjeMCil8bTPIGruBn2xSAQyeNdyjs2uMKA4CvInELoT+AZsJ/n4 pQ== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gmjnscbnx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 Jun 2022 21:05:26 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 25GL0HAK031901;
	Thu, 16 Jun 2022 21:05:26 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2045.outbound.protection.outlook.com [104.47.56.45])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id 3gpr2bpsb0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 Jun 2022 21:05:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OaFM771tbFoW5zUWIwRoiqvx56dyK7RmiM+y90HAVmqyNY4aySliEyyTg8U1bn0D5UTuVkbOz65QVl4g8LoSzdwH82caamj5lGbhbzcFCI9JMSOOm+6cmD97GKPAi5+TgMTTZhXxDWMMfhIh/qrTz8vnWDCGzFEo/xP+C/lOa+zxGqfhDbyvIojIWSl1PEgVKO3wXpS1ANp2CtVvq+9xQ7O0fWaWv8kfhwqq4E9WhxUUzyzeuELvvL0a+CbmFAh/7Q3PE9Dbl26liPoG0I3bD8W7vLLrS4P4TcVTSssckFTzYRT6h/vf3LL8aS6vyrDBkc/wlyQxCICxdkVbaqBOYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QpZCpUTTzEh4ele31B2viMEnUBgQKg4lMJANWXODm2w=;
 b=ceQWXG4fFJqj3XNvPwVVjVTWRBOnmywJ52ls7oANpYSRN3Q0kZRzc4zi8axuAbQcGeMgaTU58JdIuoqniJdpKr37E+9dgia4CR//dRbGUDzZyJ1OpmQTSj5peMPoJuCoy9yKb4qyRJnl0KfPfD37wP4is0BQWLGWyzM2ldOxjSDyzVpfkFDBYEwRgZJuMo/w+XQxi4UYGCQQSr623/Lm0POigrzkRZsxh77l+4QA3hJ8UMCRCGvlZQ/eg/+kplrHeUvP79WaxYndIMm6rKv23sbvWTc1uwLYXcnaaa9cRH7Umo97rTnNG3P/IrdL3rMbJ7eXXX/WhIXgH2585GfOOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QpZCpUTTzEh4ele31B2viMEnUBgQKg4lMJANWXODm2w=;
 b=C9p5tBpbvd5wgqZ7mQvPoLK5nG1P+NAQ58tT84prgUQh8zUDOppBZn+YUI95BrKE2hvSmja1XQ/pjyevqrsCSmGTIIf0RKlzses7oOWbc/SDOiEweMNgwq0HHwxl4gyskiAFKAaaeB0AiRsgVgE1PU8PDRCIRIsRm7BSevAZoUM=
Received: from BY5PR10MB4196.namprd10.prod.outlook.com (2603:10b6:a03:20d::23)
 by DS0PR10MB6197.namprd10.prod.outlook.com (2603:10b6:8:c3::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5332.22; Thu, 16 Jun 2022 21:05:24 +0000
Received: from BY5PR10MB4196.namprd10.prod.outlook.com
 ([fe80::2125:9bb7:bfeb:81f9]) by BY5PR10MB4196.namprd10.prod.outlook.com
 ([fe80::2125:9bb7:bfeb:81f9%8]) with mapi id 15.20.5353.015; Thu, 16 Jun 2022
 21:05:24 +0000
From: Mike Kravetz <mike.kravetz@oracle.com>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 0/4] hugetlb: speed up linear address scanning
Date: Thu, 16 Jun 2022 14:05:14 -0700
Message-Id: <20220616210518.125287-1-mike.kravetz@oracle.com>
X-Mailer: git-send-email 2.35.3
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR03CA0220.namprd03.prod.outlook.com
 (2603:10b6:303:b9::15) To BY5PR10MB4196.namprd10.prod.outlook.com
 (2603:10b6:a03:20d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 833a5b65-45e3-47eb-093d-08da4fdbee49
X-MS-TrafficTypeDiagnostic: DS0PR10MB6197:EE_
X-Microsoft-Antispam-PRVS: 	<DS0PR10MB619707D3D5995D8CBE7EDF3AE2AC9@DS0PR10MB6197.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	pp6fbO9DmIiOaCIHj9DTM+XKqClbmCIxuGflJTguiJjBYtyoHhvylOTqaC7dKAYIq8P0HCLC70baSs0SHvkF6MLoobBSKQmvT3u8YnrYuDi6D//ROJ1f1JTs9tiJtlDZn7rW30ZlEuG7FwUwXX2PbQCkRFE0rtNJMuU1GuFC2Kt1J+foJnt+X5natad9878I/4ZR7EBR5tvfiUnqj3/Y5MR32RSZa6itfDLUESNdIOJiaBYWdtyaRrW05K+wa/xGA3gtRtik7JmE8/LbMvGTojGLwZZ/nRYdu1bq0Zo1bKByYNBg/iIrAsagHHAFlAk2n/l82ATlFmJoNFZRmqQnSBvK6E13x0qLxOVTsALmAMYKDsHutBkurk/qcHw0kNzvDQ/oAzlMC4WXch1KUcSvfvqcsRpVvzj388uu7uqya7ZYACYLXbxCq4yBlfaJJiwImAGS+ewOF4GCjsRRSQJZ/wFeYbQkfHKpzrGqPdHh1YnFdW2SW4m6pywukC/jLYixyPnzDIajPwelRM6vSc3RjILT+bb/xEi/0RnYnFpIXwWQdCTH81ENPdLpolJeC4frqzzV0s9QT89aGbIQCBy/aMpYEXYzgZkALwGklzJobC+A2gurjd9hu9iH3ERan55/z/t5947D2wp++LMthxp3P27bbQdxgEkQ98uraTchxw/VXWknpte81ZQY8K/kXtVK
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB4196.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(6486002)(38100700002)(6666004)(66946007)(7416002)(83380400001)(316002)(2906002)(66476007)(6506007)(4326008)(8676002)(54906003)(1076003)(498600001)(5660300002)(66556008)(86362001)(26005)(44832011)(36756003)(6512007)(2616005)(186003)(921005)(8936002)(107886003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?HT1vbJNma+8ymAOMuQXIIs8WNu462ADHxqVAsCecpD5RnCNYHu+n0XDWwm3B?=
 =?us-ascii?Q?ZecwIl1IL4l01rUxpkNsdoGCvrvEB7CMEZBCDk0puhmQBOlwoEDSaWKnZyMm?=
 =?us-ascii?Q?Wb0DaVkLXSXbsDHp9Z/NhpRgYfmB6qG3n3eGhwIi5HKAzU6AavvkwabMzrvz?=
 =?us-ascii?Q?pDKen/8LzrB1ckHhy9R7JxDdzAx5iSd4TzMlgOfXd75zYPOKtl8cuhk1UjWX?=
 =?us-ascii?Q?ISOQSsjLSDZfxJNXOdPhfw25iIcq5Vsjo77If/s2mDU2+YIVhoGgajy+zeCz?=
 =?us-ascii?Q?cYMFDgP/U0/6GINBlB7jc1y+baKFFX06tyM0tN0q6v6XpZbfn/sSJ9m27a8M?=
 =?us-ascii?Q?aHlsS0OA/LK12T3rZRoCEVA6f56FYjoESaanNehSLx5v27M60HsbZrTyJbzc?=
 =?us-ascii?Q?/Iq9JuOiHYko0ZeTMxweeGt6xGQexFSaLe7IpXbuLRQw5BrBq74vbEqHA7M8?=
 =?us-ascii?Q?3ZhYsqpODGzNjuVsb6PuI7x+2qeUkxcYHASp+zqooTs3ZTKb3CehZo3NJzr5?=
 =?us-ascii?Q?hLNRWHBDLgj9W/yPiQkYhXrmHhlA8jXuka8flZi9Cq+sr1e7tSb8/j6rtUD5?=
 =?us-ascii?Q?RHSH7YGw+OwlSTbzvBU2LNjpJyLidFsqQg+m0Nc6jfpSajw7MOI6fUOjWPYx?=
 =?us-ascii?Q?GvBzBaFjhuqE/juBJ+lEmL3YIIqV/isMARXudQTxb/vV4syPC8jttn2jd6tX?=
 =?us-ascii?Q?VzGDegbM/Z10L6Sts/PA/F499fXhtFapxVO1SHZ2FDtB07AL6NwYTDF7Uykx?=
 =?us-ascii?Q?s6P3gn6lUVj14ByJBwfCeuqxY4hDLnTHNGE7FGL+9HqDvb/hM5lowEVkLkNz?=
 =?us-ascii?Q?G69gKs2matClOJR3KkbrgKT+DLbeqw4OJWMSQJKoOXxkSvyXQRQeaAt3aHQW?=
 =?us-ascii?Q?hCf0KI8eccTsQj/fAlaHe5Spt1zSZ0SGeu4zvvTeC777L8VCu2ypVVMao4aG?=
 =?us-ascii?Q?SdlOMAlJDs3dnvJP6YxvZYLNa2XLqeb8BxvuGy9QlU9VV3fUHal5Uyj/jTtJ?=
 =?us-ascii?Q?yCo+T3/6er+sJdMW085S7EmTq1tqOMFgHVsLtePOZpKDzDB5h3soVafNmsut?=
 =?us-ascii?Q?8GpLBm/hM/bkd5g+4lJqlPX+9/QsaYmWMoJC6gWgiIriRtLxhclZEdgqyzLG?=
 =?us-ascii?Q?YxakgHO8Id2UCwSzjy1Kx1QqnXXqWgpqmfx/tlDLkHafJ7Y1lb9hdu/RZGSE?=
 =?us-ascii?Q?9y2gIZ+IpUp2oqdEkr6yqAFZus0wc1P4Cmr/IWq6bHaJ2nsesyvd9ebbCFDz?=
 =?us-ascii?Q?MRC2a23Ikpe0gplFgNkwV5z7JEWygnZB5yOY5nbvEhooQmQQ9AUF6HK9TLvj?=
 =?us-ascii?Q?4ZsZrjZ7eB5vYh7i8G1ymdy9BrNrPxLNapcYO4O9rBOIxLY9chGzuN76rbFO?=
 =?us-ascii?Q?Nk/dqIGTXUS+6M91thDONNipsSrlNDMrl5LRdQJ8tBoZATJcK5ClAuQifRHp?=
 =?us-ascii?Q?0WTz/BMV8mwLK+lxJ2i5ERZkjonr7GCWRLhVwH75G/hkikTepeIIq/eXdOV8?=
 =?us-ascii?Q?lXJfhgZOHkWzIES6KmJ/hXzmRhGFyOq4iofDV4/X7NQloBr8fJg0bJB4b8oJ?=
 =?us-ascii?Q?ag/1CqsrRvFiNsVBObA+TtyJphHIGwPjGVMpl95/Kjc1nU2XSnBKobS/1NfQ?=
 =?us-ascii?Q?vxiskBlIn84Ib0T4GR9NOfxd480tgmXyxuuBsLWhZAr9w/idcTXnX+a4DTeO?=
 =?us-ascii?Q?kFBFnWSJ7EujF4Qc2ybiGYWflpLsq+irPzlFhc5MML8+NCfzdGpPuW51zEFd?=
 =?us-ascii?Q?dKX1JiSyqCP1C9TQOQW3QSAisxxg5vg=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 833a5b65-45e3-47eb-093d-08da4fdbee49
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB4196.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2022 21:05:24.3354
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +WqW0pIQjQEyrChZbuDw3j2/Hgdh539HtpsK3lWHv5Sh8J1BPWRdq+2Tbj3bGVTbFtOTt0fEirL8WXeP5eANAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6197
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517,18.0.883
 definitions=2022-06-16_16:2022-06-16,2022-06-16 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 adultscore=0
 mlxlogscore=632 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206160084
X-Proofpoint-GUID: oUKA8D6jfRc-KarU3RJEtIBUHTQe9aX9
X-Proofpoint-ORIG-GUID: oUKA8D6jfRc-KarU3RJEtIBUHTQe9aX9
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
Cc: Mina Almasry <almasrymina@google.com>, James Houghton <jthoughton@google.com>, will@kernel.org, Anshuman Khandual <anshuman.khandual@arm.com>, catalin.marinas@arm.com, Paul Walmsley <paul.walmsley@sifive.com>, Peter Xu <peterx@redhat.com>, Michal Hocko <mhocko@suse.com>, "Aneesh Kumar K . V" <aneesh.kumar@linux.vnet.ibm.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Muchun Song <songmuchun@bytedance.com>, Andrew Morton <akpm@linux-foundation.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, Naoya Horiguchi <naoya.horiguchi@linux.dev>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

At unmap, fork and remap time hugetlb address ranges are linearly
scanned.  We can optimize these scans if the ranges are sparsely
populated.

Also, enable page table "Lazy copy" for hugetlb at fork.

NOTE: Architectures not defining CONFIG_ARCH_WANT_GENERAL_HUGETLB
need to add an arch specific version hugetlb_mask_last_page() to
take advantage of sparse address scanning improvements.  Baolin Wang
added the routine for arm64.  Other architectures which could be
optimized are: ia64, mips, parisc, powerpc, s390, sh and sparc.

Baolin Wang (1):
  arm64/hugetlb: Implement arm64 specific hugetlb_mask_last_page

Mike Kravetz (3):
  hugetlb: skip to end of PT page mapping when pte not present
  hugetlb: do not update address in huge_pmd_unshare
  hugetlb: Lazy page table copies in fork()

 arch/arm64/mm/hugetlbpage.c |  20 +++++++
 include/linux/hugetlb.h     |   5 +-
 mm/hugetlb.c                | 109 +++++++++++++++++++++++++-----------
 mm/memory.c                 |   2 +-
 mm/rmap.c                   |   4 +-
 5 files changed, 103 insertions(+), 37 deletions(-)

-- 
2.35.3

