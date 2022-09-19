Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C5E5BC14B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Sep 2022 04:15:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MW7Yc4gZ7z3blf
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Sep 2022 12:15:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=ZeGdgGZh;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=wPssv+xr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=mike.kravetz@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=ZeGdgGZh;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=wPssv+xr;
	dkim-atps=neutral
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MW7Xm5R9cz2xJN
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Sep 2022 12:14:29 +1000 (AEST)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28J0xSPj017415;
	Mon, 19 Sep 2022 02:13:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=corp-2022-7-12;
 bh=+n+/uWnjuyeXFq1S9aw5kcdCKfUB29VeInWt9twX/YI=;
 b=ZeGdgGZh5ym3tXYQuotze5NjF1r+PZ353US2jxoI10rwXUURgtfFSO6NM0UmZB38ASDk
 3vRUrm0MQp9SyNaRaLEWCML9k9Y+Xh4NqP2LU7KpbVw9PBhyEglhayMv83ECJwGs8nHe
 28+01N9Qalm6b+Gm2oRwomjdvazf46gD1p2Uksu/xu6JrTwf1LCEuFU2HTNwcQDPXW5L
 C5eJg9FGATcdw0TZSPFdhXPVTd5FcC8rOwL5LOXh8owfkijcLzxOzXZAeWTK9zFI1T+X
 o4SdS4bRsaZnpRqBbMutzgt7aG013eSMr/U52egOheGj6BpW5ELiksKmNpyS1tSJlA5e MQ== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3jn6f0ae6f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Sep 2022 02:13:59 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 28IKP3sw016823;
	Mon, 19 Sep 2022 02:13:57 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2171.outbound.protection.outlook.com [104.47.57.171])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3jp3cka3q1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Sep 2022 02:13:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GzW1ASYvVaKBDZ0OvHHQnWAiRtvW7zgH/zvJEdQl1TY32drx6Iguv0EUXFwt41wZ+TKZ7Jv0HL91U2bCkeRXcWVp3BON7EabwEpRXQIu6vKNZtN177BssWLKZaoyYIyZUTHlJRlIEVMDnMb2TYvIHk+jM660mVh5FxTYb1kPpmTs1DydOPsnDirIJJFBjUmywNiemuwKqv/w4H4FfZJAGltt4S1/x5pNEjMuDHti+meiTB+5MIj9D3B0WneqfVz69YoakpAm6XrlZoVGqsJaCmnzffJ1U2t2yFadwEfdGV6lfhq3VL2KuagqSuaOfKXqdykZQk7wpiu9R+s176YgjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+n+/uWnjuyeXFq1S9aw5kcdCKfUB29VeInWt9twX/YI=;
 b=kawj5f8fOw0HH3M3fcmw5BJSy5nhFOvn1K0Wl+st/lt4oT2CcnjJEqJcyWg+eCKeczPQfTwls41go5oSW9QLxGVsVlPjFdYTAYqFxDw6poJYZhpmKGmLCL63Y7aZ2ub9Mm4/6mirwZzDHRw267caz8jOoPZYh8uB+Hfik24lSbAJuwNs+G68w7n4Gtln5lRDusOnxFQzpO9z3QR1wp2GdigqC2rZIsUvuEixNOr8tNS24P47iCRYgziralKV6LEwbRuVMBTnHPt/LT2nXDJrdXnbgLDlpLxLFKU7EGcPox14JgrkpTsXRB0Kw7zy6NHzs5OnS3L0/zBcCLdMX3xJ7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+n+/uWnjuyeXFq1S9aw5kcdCKfUB29VeInWt9twX/YI=;
 b=wPssv+xry9SsTeOniEa5cc+gAAkpXotlPOjFO4LxyxSangFwe95krYQHida1AN/9W2Cw5q2KF0rzA3KuPPLwlDLkaN/N8kA1pdh6FK2d14TYsg07sHL6YG2iDzGV494A3m6KhAL1yr1BCyzKb8HlJ9N8Nnw8MkiITNffHOWAOEE=
Received: from BY5PR10MB4196.namprd10.prod.outlook.com (2603:10b6:a03:20d::23)
 by DM4PR10MB6695.namprd10.prod.outlook.com (2603:10b6:8:111::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.19; Mon, 19 Sep
 2022 02:13:54 +0000
Received: from BY5PR10MB4196.namprd10.prod.outlook.com
 ([fe80::e9d2:a804:e53a:779a]) by BY5PR10MB4196.namprd10.prod.outlook.com
 ([fe80::e9d2:a804:e53a:779a%7]) with mapi id 15.20.5632.021; Mon, 19 Sep 2022
 02:13:54 +0000
From: Mike Kravetz <mike.kravetz@oracle.com>
To: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-ia64@vger.kernel.org
Subject: [PATCH v3] hugetlb: simplify hugetlb handling in follow_page_mask
Date: Sun, 18 Sep 2022 19:13:48 -0700
Message-Id: <20220919021348.22151-1-mike.kravetz@oracle.com>
X-Mailer: git-send-email 2.37.3
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR02CA0024.namprd02.prod.outlook.com
 (2603:10b6:303:16d::9) To BY5PR10MB4196.namprd10.prod.outlook.com
 (2603:10b6:a03:20d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR10MB4196:EE_|DM4PR10MB6695:EE_
X-MS-Office365-Filtering-Correlation-Id: c8c0b56c-0401-447a-00c9-08da99e49a15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	PB+Qb4Vi4Nu5C8loD+cNzu8smdf3vL3m4cJmkg/9xQsMNP5bWl05eD8N2VRdfZFCmZEvaGTTr8WLgpIxBR7kD0/N42VXmJVg4qRVsZNpvxxsgsDqlavj4j/AJOxPM0UXP+qVj+xyLKgznauVaDkSLfFPbQBRNRaaDknLDwn+gsuxDpWDS51G7AzhoFMINnmpti7z1l7B/HcLANEfp6cmMeHcce07uH+29EJsJXkgyr0gTBkqWY6giXh8D5Vf9XoWudCJMu5cKl6t8dYL2iyv2mNooeopHY8pGAE8gxfnFPz1LHb6mLHbxQM7iucReDU63PNl4nqcD/2i9S7uisJtrM5mpQQqCGc0QlBGYi6yGclHYjj0i9ak5ZoiDH5QVpJbWXbtJTdgVwP7iguwNL+26mSlP6fJSDcN5xxVhSktSpb6An5rmV7Cp0rJq1iQnCodho53lccvTa6Pnekbe+JC4tsb09HYSwPeNxNG7ffbew1KJxX0RvwFdAuPsWpNXmxSLJn4Vze6fxXfquRmL5BOfdNnQIgN3rwoaPa8WeAyAVQN2Ac/4B6v20ZVcKdIZ7n+GmsPxrNwZ3pLJTgx4AP6PM/MD0wUigUMqZA9hAtbEuXVuOvysr8vjVhGwyleD9FCvPMcsvuwpY1L3C4MdjPDINVkzZ++5sA5d+88q/zW+Zm3TOinPcEGDrSTdAlegGiSNWVFZ9ueeDV5q6gY/UGYovX2TP6KvZKU2zUzw7caj2g=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB4196.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(396003)(136003)(346002)(366004)(376002)(451199015)(36756003)(5660300002)(7416002)(54906003)(107886003)(6666004)(86362001)(316002)(38100700002)(2906002)(83380400001)(30864003)(6486002)(966005)(8936002)(186003)(1076003)(44832011)(2616005)(6506007)(4326008)(6512007)(26005)(41300700001)(478600001)(8676002)(66556008)(66476007)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?LD7Q6cFRAdHFtEaFDxBRo7LVWPBSrz3lhU9zWTs8FQSKbDs8lVZFZicIT3Rf?=
 =?us-ascii?Q?SliUK/bHYnU7S+u4XDTIPaJZtz0mzrJ8s88X693S9g7X0B9MGozQ8AA6nzYf?=
 =?us-ascii?Q?ehN5a6v1+LikEYJUazxOQjOCtJ9rcG2v4BeNYF4hHqH+N+IZgn+qOYh8UiiI?=
 =?us-ascii?Q?Ev0+4rf1knlJmfytOVIYu//mURJK6si2iPbMgTlBpV2JaQzX3SPLITACMU/Z?=
 =?us-ascii?Q?ogLjOmZBi84rjlW8F6ytVHlxhk6Baqq5X8bE/dzmVOo0FTqcRCqR53C2xq8u?=
 =?us-ascii?Q?xO5G0wVdbImxSCkM1yA9e8EkX4c6d0TdAUfGpUm+ayDFAvc/0Retsyos1IG3?=
 =?us-ascii?Q?zzLlu692HV6RnvTqtup+RjOyXyPlwF+0KK/F6xobPF+EnYyO5UTC4gYe9Q3M?=
 =?us-ascii?Q?dR7DZHdvM+1z69ojbsKVUbx2+DjJIvnp/NLh6q0DHofurACWtfysl9iJG/cY?=
 =?us-ascii?Q?DHIqqWiGinSjjA6SgsVEuuj85axsPtGMgK+78IwoO0pXCz06poNHe9klZyFK?=
 =?us-ascii?Q?EpLJSB7JLVOLNMtPaJJnCRsrCcpI9ZHyd0KOfvFYd9iPoBSCOpj5Rrbimuj4?=
 =?us-ascii?Q?koXyVKXJOOSTCox4vLfLyN889gykoDGpDDf584+HSEGJ8nRd6kxRGTQ+uRZr?=
 =?us-ascii?Q?eUtcqygpB4/S0125e5RN3rG9InNXayuoHDg+Q5iT+juWzLZfICutKfx8b7Y3?=
 =?us-ascii?Q?UUS61QEU0Ujg9KB5moM8sIhJDANNQYEOGF+bix2H+1Hqv5iRMorCTCRcy/g3?=
 =?us-ascii?Q?/tfQ1MyJlH/Y7f04lzhTQTc/Eq6Tnfc4HRv9E6KNbCMzxUMFReKfuQ2Xc+d3?=
 =?us-ascii?Q?TH7eQjyavjLZXFSMH/ic1zebfuE++Ji8eTJDd1cBpb5lN06cbjtk/412QknM?=
 =?us-ascii?Q?Ja1Q+BcjRMKmkiLOi35ofBPSsmMHWkL3dOLKp9hTQW+JmAM0f37e9ksMc5pP?=
 =?us-ascii?Q?oOBGRnyHlC4Hu+8cNbDiyWHIfQD1P2ybDDR8VDXspo9/Esh6pQ9ACobyKNrh?=
 =?us-ascii?Q?u0fPybN2FuZARK+iD+I3N0AYa1vC5mXacC3qpgo5eIKRGo5TZyz+sKu48Uqm?=
 =?us-ascii?Q?UsqTZNNm/45eaZq3UgikHRfYvS4eFAXvJAcjRbXGu2eLdNVLfS7CKXNpIRZf?=
 =?us-ascii?Q?6RAlzr98B18xVlp5QjotZPoVf5p1XaO22JKqhfGwIQnMJUADXSayXLlPLC6/?=
 =?us-ascii?Q?ijZ3aqCw9fi4yIaGJ9ZKlvvRxB2A9KnRTkxQiBUOO61fZSSCCH4GvQGPTN/v?=
 =?us-ascii?Q?FT3gibA3MhJc29CNuuctfhdiHxOR2ZpkXn78OVD5QOw3yyH40OyBZL3JtbO2?=
 =?us-ascii?Q?fJ1rdnFhK2iGluLmTcC01t9J9n4TKg/4O1rBflkrwWrxLodYQFUYj48gmCA7?=
 =?us-ascii?Q?QVkMrktK996Jg5mgMKhJWvpISac4m0uyefQEZN1vmF0onPCyW12YqDyI0PZM?=
 =?us-ascii?Q?ALaSkRPo4dJ5ehsSe/NNXBlBia1z91KG8FP4IFR46WW3nW/fnVGZrEEgTluQ?=
 =?us-ascii?Q?QuIPNQ/0wGiiJajGGhoPct1qErhlTVWOB+XtuUkEikzCfDLckjHJQwoGISt/?=
 =?us-ascii?Q?VK/Xsxsnp/NgbGlQAsJU/A/2YDFnSX0gUgrWz4Y6Aej+D9IxPB8bVMtqkL90?=
 =?us-ascii?Q?ow=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8c0b56c-0401-447a-00c9-08da99e49a15
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB4196.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2022 02:13:54.6627
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ynqcBUjz6nGB7Vf0uW19aQ2axI3qODI5dio/E9zJiUFQpZkLPiFYzF6PA0d/EUaL1huPAW5ArWBMu1HCSj0QtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6695
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-19_01,2022-09-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxlogscore=999
 spamscore=0 adultscore=0 mlxscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209190014
X-Proofpoint-GUID: 261M04K4m6PIQhIx26I4MvueCZS8DL-o
X-Proofpoint-ORIG-GUID: 261M04K4m6PIQhIx26I4MvueCZS8DL-o
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
Cc: David Hildenbrand <david@redhat.com>, Muchun Song <songmuchun@bytedance.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, Naoya Horiguchi <naoya.horiguchi@linux.dev>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

During discussions of this series [1], it was suggested that hugetlb
handling code in follow_page_mask could be simplified.  At the beginning
of follow_page_mask, there currently is a call to follow_huge_addr which
'may' handle hugetlb pages.  ia64 is the only architecture which provides
a follow_huge_addr routine that does not return error.  Instead, at each
level of the page table a check is made for a hugetlb entry.  If a hugetlb
entry is found, a call to a routine associated with that entry is made.

Currently, there are two checks for hugetlb entries at each page table
level.  The first check is of the form:
        if (p?d_huge())
                page = follow_huge_p?d();
the second check is of the form:
        if (is_hugepd())
                page = follow_huge_pd().

We can replace these checks, as well as the special handling routines
such as follow_huge_p?d() and follow_huge_pd() with a single routine to
handle hugetlb vmas.

A new routine hugetlb_follow_page_mask is called for hugetlb vmas at the
beginning of follow_page_mask.  hugetlb_follow_page_mask will use the
existing routine huge_pte_offset to walk page tables looking for hugetlb
entries.  huge_pte_offset can be overwritten by architectures, and already
handles special cases such as hugepd entries.

[1] https://lore.kernel.org/linux-mm/cover.1661240170.git.baolin.wang@linux.alibaba.com/

Suggested-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Mike Kravetz <mike.kravetz@oracle.com>
---
v3 -	Change WARN_ON_ONCE() to BUILD_BUG() as reminded by Christophe Leroy
v2 -    Added WARN_ON_ONCE() and updated comment as suggested by David
        Fixed build issue found by kernel test robot
        Added vma (pmd sharing) locking to hugetlb_follow_page_mask
        ReBased on Baolin's patch to fix issues with CONT_* entries

 arch/ia64/mm/hugetlbpage.c    |  15 ---
 arch/powerpc/mm/hugetlbpage.c |  37 -------
 include/linux/hugetlb.h       |  50 ++--------
 mm/gup.c                      |  80 +++------------
 mm/hugetlb.c                  | 182 ++++++++++++----------------------
 5 files changed, 86 insertions(+), 278 deletions(-)

diff --git a/arch/ia64/mm/hugetlbpage.c b/arch/ia64/mm/hugetlbpage.c
index f993cb36c062..380d2f3966c9 100644
--- a/arch/ia64/mm/hugetlbpage.c
+++ b/arch/ia64/mm/hugetlbpage.c
@@ -91,21 +91,6 @@ int prepare_hugepage_range(struct file *file,
 	return 0;
 }
 
-struct page *follow_huge_addr(struct mm_struct *mm, unsigned long addr, int write)
-{
-	struct page *page;
-	pte_t *ptep;
-
-	if (REGION_NUMBER(addr) != RGN_HPAGE)
-		return ERR_PTR(-EINVAL);
-
-	ptep = huge_pte_offset(mm, addr, HPAGE_SIZE);
-	if (!ptep || pte_none(*ptep))
-		return NULL;
-	page = pte_page(*ptep);
-	page += ((addr & ~HPAGE_MASK) >> PAGE_SHIFT);
-	return page;
-}
 int pmd_huge(pmd_t pmd)
 {
 	return 0;
diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbpage.c
index bc84a594ca62..b0e037c75c12 100644
--- a/arch/powerpc/mm/hugetlbpage.c
+++ b/arch/powerpc/mm/hugetlbpage.c
@@ -506,43 +506,6 @@ void hugetlb_free_pgd_range(struct mmu_gather *tlb,
 	} while (addr = next, addr != end);
 }
 
-struct page *follow_huge_pd(struct vm_area_struct *vma,
-			    unsigned long address, hugepd_t hpd,
-			    int flags, int pdshift)
-{
-	pte_t *ptep;
-	spinlock_t *ptl;
-	struct page *page = NULL;
-	unsigned long mask;
-	int shift = hugepd_shift(hpd);
-	struct mm_struct *mm = vma->vm_mm;
-
-retry:
-	/*
-	 * hugepage directory entries are protected by mm->page_table_lock
-	 * Use this instead of huge_pte_lockptr
-	 */
-	ptl = &mm->page_table_lock;
-	spin_lock(ptl);
-
-	ptep = hugepte_offset(hpd, address, pdshift);
-	if (pte_present(*ptep)) {
-		mask = (1UL << shift) - 1;
-		page = pte_page(*ptep);
-		page += ((address & mask) >> PAGE_SHIFT);
-		if (flags & FOLL_GET)
-			get_page(page);
-	} else {
-		if (is_hugetlb_entry_migration(*ptep)) {
-			spin_unlock(ptl);
-			__migration_entry_wait(mm, ptep, ptl);
-			goto retry;
-		}
-	}
-	spin_unlock(ptl);
-	return page;
-}
-
 bool __init arch_hugetlb_valid_size(unsigned long size)
 {
 	int shift = __ffs(size);
diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index cfe15b32e2d4..32d45e96a894 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -149,6 +149,8 @@ int move_hugetlb_page_tables(struct vm_area_struct *vma,
 			     unsigned long len);
 int copy_hugetlb_page_range(struct mm_struct *, struct mm_struct *,
 			    struct vm_area_struct *, struct vm_area_struct *);
+struct page *hugetlb_follow_page_mask(struct vm_area_struct *vma,
+				unsigned long address, unsigned int flags);
 long follow_hugetlb_page(struct mm_struct *, struct vm_area_struct *,
 			 struct page **, struct vm_area_struct **,
 			 unsigned long *, unsigned long *, long, unsigned int,
@@ -209,17 +211,6 @@ int huge_pmd_unshare(struct mm_struct *mm, struct vm_area_struct *vma,
 				unsigned long addr, pte_t *ptep);
 void adjust_range_if_pmd_sharing_possible(struct vm_area_struct *vma,
 				unsigned long *start, unsigned long *end);
-struct page *follow_huge_addr(struct mm_struct *mm, unsigned long address,
-			      int write);
-struct page *follow_huge_pd(struct vm_area_struct *vma,
-			    unsigned long address, hugepd_t hpd,
-			    int flags, int pdshift);
-struct page *follow_huge_pmd_pte(struct vm_area_struct *vma, unsigned long address,
-				 int flags);
-struct page *follow_huge_pud(struct mm_struct *mm, unsigned long address,
-				pud_t *pud, int flags);
-struct page *follow_huge_pgd(struct mm_struct *mm, unsigned long address,
-			     pgd_t *pgd, int flags);
 
 void hugetlb_vma_lock_read(struct vm_area_struct *vma);
 void hugetlb_vma_unlock_read(struct vm_area_struct *vma);
@@ -272,6 +263,12 @@ static inline void adjust_range_if_pmd_sharing_possible(
 {
 }
 
+static inline struct page *hugetlb_follow_page_mask(struct vm_area_struct *vma,
+				unsigned long address, unsigned int flags)
+{
+	BUILD_BUG(); /* should never be compiled in if !CONFIG_HUGETLB_PAGE*/
+}
+
 static inline long follow_hugetlb_page(struct mm_struct *mm,
 			struct vm_area_struct *vma, struct page **pages,
 			struct vm_area_struct **vmas, unsigned long *position,
@@ -282,12 +279,6 @@ static inline long follow_hugetlb_page(struct mm_struct *mm,
 	return 0;
 }
 
-static inline struct page *follow_huge_addr(struct mm_struct *mm,
-					unsigned long address, int write)
-{
-	return ERR_PTR(-EINVAL);
-}
-
 static inline int copy_hugetlb_page_range(struct mm_struct *dst,
 					  struct mm_struct *src,
 					  struct vm_area_struct *dst_vma,
@@ -320,31 +311,6 @@ static inline void hugetlb_show_meminfo_node(int nid)
 {
 }
 
-static inline struct page *follow_huge_pd(struct vm_area_struct *vma,
-				unsigned long address, hugepd_t hpd, int flags,
-				int pdshift)
-{
-	return NULL;
-}
-
-static inline struct page *follow_huge_pmd_pte(struct vm_area_struct *vma,
-				unsigned long address, int flags)
-{
-	return NULL;
-}
-
-static inline struct page *follow_huge_pud(struct mm_struct *mm,
-				unsigned long address, pud_t *pud, int flags)
-{
-	return NULL;
-}
-
-static inline struct page *follow_huge_pgd(struct mm_struct *mm,
-				unsigned long address, pgd_t *pgd, int flags)
-{
-	return NULL;
-}
-
 static inline int prepare_hugepage_range(struct file *file,
 				unsigned long addr, unsigned long len)
 {
diff --git a/mm/gup.c b/mm/gup.c
index bfded683e64e..b580b5510a60 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -537,18 +537,6 @@ static struct page *follow_page_pte(struct vm_area_struct *vma,
 	if (WARN_ON_ONCE((flags & (FOLL_PIN | FOLL_GET)) ==
 			 (FOLL_PIN | FOLL_GET)))
 		return ERR_PTR(-EINVAL);
-
-	/*
-	 * Considering PTE level hugetlb, like continuous-PTE hugetlb on
-	 * ARM64 architecture.
-	 */
-	if (is_vm_hugetlb_page(vma)) {
-		page = follow_huge_pmd_pte(vma, address, flags);
-		if (page)
-			return page;
-		return no_page_table(vma, flags);
-	}
-
 retry:
 	if (unlikely(pmd_bad(*pmd)))
 		return no_page_table(vma, flags);
@@ -680,20 +668,6 @@ static struct page *follow_pmd_mask(struct vm_area_struct *vma,
 	pmdval = READ_ONCE(*pmd);
 	if (pmd_none(pmdval))
 		return no_page_table(vma, flags);
-	if (pmd_huge(pmdval) && is_vm_hugetlb_page(vma)) {
-		page = follow_huge_pmd_pte(vma, address, flags);
-		if (page)
-			return page;
-		return no_page_table(vma, flags);
-	}
-	if (is_hugepd(__hugepd(pmd_val(pmdval)))) {
-		page = follow_huge_pd(vma, address,
-				      __hugepd(pmd_val(pmdval)), flags,
-				      PMD_SHIFT);
-		if (page)
-			return page;
-		return no_page_table(vma, flags);
-	}
 retry:
 	if (!pmd_present(pmdval)) {
 		/*
@@ -783,20 +757,6 @@ static struct page *follow_pud_mask(struct vm_area_struct *vma,
 	pud = pud_offset(p4dp, address);
 	if (pud_none(*pud))
 		return no_page_table(vma, flags);
-	if (pud_huge(*pud) && is_vm_hugetlb_page(vma)) {
-		page = follow_huge_pud(mm, address, pud, flags);
-		if (page)
-			return page;
-		return no_page_table(vma, flags);
-	}
-	if (is_hugepd(__hugepd(pud_val(*pud)))) {
-		page = follow_huge_pd(vma, address,
-				      __hugepd(pud_val(*pud)), flags,
-				      PUD_SHIFT);
-		if (page)
-			return page;
-		return no_page_table(vma, flags);
-	}
 	if (pud_devmap(*pud)) {
 		ptl = pud_lock(mm, pud);
 		page = follow_devmap_pud(vma, address, pud, flags, &ctx->pgmap);
@@ -816,7 +776,6 @@ static struct page *follow_p4d_mask(struct vm_area_struct *vma,
 				    struct follow_page_context *ctx)
 {
 	p4d_t *p4d;
-	struct page *page;
 
 	p4d = p4d_offset(pgdp, address);
 	if (p4d_none(*p4d))
@@ -825,14 +784,6 @@ static struct page *follow_p4d_mask(struct vm_area_struct *vma,
 	if (unlikely(p4d_bad(*p4d)))
 		return no_page_table(vma, flags);
 
-	if (is_hugepd(__hugepd(p4d_val(*p4d)))) {
-		page = follow_huge_pd(vma, address,
-				      __hugepd(p4d_val(*p4d)), flags,
-				      P4D_SHIFT);
-		if (page)
-			return page;
-		return no_page_table(vma, flags);
-	}
 	return follow_pud_mask(vma, address, p4d, flags, ctx);
 }
 
@@ -870,10 +821,18 @@ static struct page *follow_page_mask(struct vm_area_struct *vma,
 
 	ctx->page_mask = 0;
 
-	/* make this handle hugepd */
-	page = follow_huge_addr(mm, address, flags & FOLL_WRITE);
-	if (!IS_ERR(page)) {
-		WARN_ON_ONCE(flags & (FOLL_GET | FOLL_PIN));
+	/*
+	 * Call hugetlb_follow_page_mask for hugetlb vmas as it will use
+	 * special hugetlb page table walking code.  This eliminates the
+	 * need to check for hugetlb entries in the general walking code.
+	 *
+	 * hugetlb_follow_page_mask is only for follow_page() handling here.
+	 * Ordinary GUP uses follow_hugetlb_page for hugetlb processing.
+	 */
+	if (is_vm_hugetlb_page(vma)) {
+		page = hugetlb_follow_page_mask(vma, address, flags);
+		if (!page)
+			page = no_page_table(vma, flags);
 		return page;
 	}
 
@@ -882,21 +841,6 @@ static struct page *follow_page_mask(struct vm_area_struct *vma,
 	if (pgd_none(*pgd) || unlikely(pgd_bad(*pgd)))
 		return no_page_table(vma, flags);
 
-	if (pgd_huge(*pgd)) {
-		page = follow_huge_pgd(mm, address, pgd, flags);
-		if (page)
-			return page;
-		return no_page_table(vma, flags);
-	}
-	if (is_hugepd(__hugepd(pgd_val(*pgd)))) {
-		page = follow_huge_pd(vma, address,
-				      __hugepd(pgd_val(*pgd)), flags,
-				      PGDIR_SHIFT);
-		if (page)
-			return page;
-		return no_page_table(vma, flags);
-	}
-
 	return follow_p4d_mask(vma, address, pgd, flags, ctx);
 }
 
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 9b8526d27c29..1e5ab2d8356f 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -6133,6 +6133,72 @@ static inline bool __follow_hugetlb_must_fault(unsigned int flags, pte_t *pte,
 	return false;
 }
 
+struct page *hugetlb_follow_page_mask(struct vm_area_struct *vma,
+				unsigned long address, unsigned int flags)
+{
+	struct hstate *h = hstate_vma(vma);
+	struct mm_struct *mm = vma->vm_mm;
+	unsigned long haddr = address & huge_page_mask(h);
+	struct page *page = NULL;
+	spinlock_t *ptl;
+	pte_t *pte, entry;
+
+	/*
+	 * FOLL_PIN is not supported for follow_page(). Ordinary GUP goes via
+	 * follow_hugetlb_page().
+	 */
+	if (WARN_ON_ONCE(flags & FOLL_PIN))
+		return NULL;
+
+retry:
+	/*
+	 * vma lock prevents racing with another thread doing a pmd unshare.
+	 * This keeps pte as returned by huge_pte_offset valid.
+	 */
+	hugetlb_vma_lock_read(vma);
+
+	pte = huge_pte_offset(mm, haddr, huge_page_size(h));
+	if (!pte) {
+		hugetlb_vma_unlock_read(vma);
+		return NULL;
+	}
+
+	ptl = huge_pte_lock(h, mm, pte);
+	entry = huge_ptep_get(pte);
+	if (pte_present(entry)) {
+		page = pte_page(entry) +
+				((address & ~huge_page_mask(h)) >> PAGE_SHIFT);
+		/*
+		 * Note that page may be a sub-page, and with vmemmap
+		 * optimizations the page struct may be read only.
+		 * try_grab_page() will increase the ref count on the
+		 * head page, so this will be OK.
+		 *
+		 * try_grab_page() should always succeed here, because we hold
+		 * the ptl lock and have verified pte_present().
+		 */
+		if (WARN_ON_ONCE(!try_grab_page(page, flags))) {
+			page = NULL;
+			goto out;
+		}
+	} else {
+		if (is_hugetlb_entry_migration(entry)) {
+			spin_unlock(ptl);
+			hugetlb_vma_unlock_read(vma);
+			__migration_entry_wait_huge(pte, ptl);
+			goto retry;
+		}
+		/*
+		 * hwpoisoned entry is treated as no_page_table in
+		 * follow_page_mask().
+		 */
+	}
+out:
+	spin_unlock(ptl);
+	hugetlb_vma_unlock_read(vma);
+	return page;
+}
+
 long follow_hugetlb_page(struct mm_struct *mm, struct vm_area_struct *vma,
 			 struct page **pages, struct vm_area_struct **vmas,
 			 unsigned long *position, unsigned long *nr_pages,
@@ -7123,122 +7189,6 @@ __weak unsigned long hugetlb_mask_last_page(struct hstate *h)
  * These functions are overwritable if your architecture needs its own
  * behavior.
  */
-struct page * __weak
-follow_huge_addr(struct mm_struct *mm, unsigned long address,
-			      int write)
-{
-	return ERR_PTR(-EINVAL);
-}
-
-struct page * __weak
-follow_huge_pd(struct vm_area_struct *vma,
-	       unsigned long address, hugepd_t hpd, int flags, int pdshift)
-{
-	WARN(1, "hugepd follow called with no support for hugepage directory format\n");
-	return NULL;
-}
-
-struct page * __weak
-follow_huge_pmd_pte(struct vm_area_struct *vma, unsigned long address, int flags)
-{
-	struct hstate *h = hstate_vma(vma);
-	struct mm_struct *mm = vma->vm_mm;
-	struct page *page = NULL;
-	spinlock_t *ptl;
-	pte_t *ptep, pte;
-
-	/*
-	 * FOLL_PIN is not supported for follow_page(). Ordinary GUP goes via
-	 * follow_hugetlb_page().
-	 */
-	if (WARN_ON_ONCE(flags & FOLL_PIN))
-		return NULL;
-
-retry:
-	ptep = huge_pte_offset(mm, address, huge_page_size(h));
-	if (!ptep)
-		return NULL;
-
-	ptl = huge_pte_lock(h, mm, ptep);
-	pte = huge_ptep_get(ptep);
-	if (pte_present(pte)) {
-		page = pte_page(pte) +
-			((address & ~huge_page_mask(h)) >> PAGE_SHIFT);
-		/*
-		 * try_grab_page() should always succeed here, because: a) we
-		 * hold the pmd (ptl) lock, and b) we've just checked that the
-		 * huge pmd (head) page is present in the page tables. The ptl
-		 * prevents the head page and tail pages from being rearranged
-		 * in any way. So this page must be available at this point,
-		 * unless the page refcount overflowed:
-		 */
-		if (WARN_ON_ONCE(!try_grab_page(page, flags))) {
-			page = NULL;
-			goto out;
-		}
-	} else {
-		if (is_hugetlb_entry_migration(pte)) {
-			spin_unlock(ptl);
-			__migration_entry_wait_huge(ptep, ptl);
-			goto retry;
-		}
-		/*
-		 * hwpoisoned entry is treated as no_page_table in
-		 * follow_page_mask().
-		 */
-	}
-out:
-	spin_unlock(ptl);
-	return page;
-}
-
-struct page * __weak
-follow_huge_pud(struct mm_struct *mm, unsigned long address,
-		pud_t *pud, int flags)
-{
-	struct page *page = NULL;
-	spinlock_t *ptl;
-	pte_t pte;
-
-	if (WARN_ON_ONCE(flags & FOLL_PIN))
-		return NULL;
-
-retry:
-	ptl = huge_pte_lock(hstate_sizelog(PUD_SHIFT), mm, (pte_t *)pud);
-	if (!pud_huge(*pud))
-		goto out;
-	pte = huge_ptep_get((pte_t *)pud);
-	if (pte_present(pte)) {
-		page = pud_page(*pud) + ((address & ~PUD_MASK) >> PAGE_SHIFT);
-		if (WARN_ON_ONCE(!try_grab_page(page, flags))) {
-			page = NULL;
-			goto out;
-		}
-	} else {
-		if (is_hugetlb_entry_migration(pte)) {
-			spin_unlock(ptl);
-			__migration_entry_wait(mm, (pte_t *)pud, ptl);
-			goto retry;
-		}
-		/*
-		 * hwpoisoned entry is treated as no_page_table in
-		 * follow_page_mask().
-		 */
-	}
-out:
-	spin_unlock(ptl);
-	return page;
-}
-
-struct page * __weak
-follow_huge_pgd(struct mm_struct *mm, unsigned long address, pgd_t *pgd, int flags)
-{
-	if (flags & (FOLL_GET | FOLL_PIN))
-		return NULL;
-
-	return pte_page(*(pte_t *)pgd) + ((address & ~PGDIR_MASK) >> PAGE_SHIFT);
-}
-
 int isolate_hugetlb(struct page *page, struct list_head *list)
 {
 	int ret = 0;
-- 
2.37.2

