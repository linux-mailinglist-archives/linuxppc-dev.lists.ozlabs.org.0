Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9845AB8AE
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 21:05:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MK6n52t5Dz3bkZ
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Sep 2022 05:05:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=YcWhMOca;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=MsOyjgGN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=mike.kravetz@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=YcWhMOca;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=MsOyjgGN;
	dkim-atps=neutral
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MK6mH3qLNz2yJQ
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Sep 2022 05:04:38 +1000 (AEST)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 282GAvrv001629;
	Fri, 2 Sep 2022 19:04:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=corp-2022-7-12;
 bh=FlfkTBRs/oWB4Utmrpe1o+i8Qaggh4G3ptodBfEJiG0=;
 b=YcWhMOcaed4+qvQF9XbXev4+UHYjqKRYrjKJEwmDk4Arz0JPMF8BZDwi8J62kDYoGnFf
 ZgoQ+z+dmYJPyzNKRasA3qL/RBaH5ORwdx+uS/1t32mDVgUzDEzO9RMYHQsG2CYgTHTu
 2yBtJOEBoJPUWskkt2SYUckZzbJX5NBlkHuGe/ERCmDJN+FkX3VJfjzEOKnH0BfSzMI8
 K3QtZCQ7r+RVEORTYDOjXGX+DfirAZ9PPPVjFQ/BzFDzPSHJytuYrBFYrkXTwzRaEfra
 bEtUfXCQDJQCiN4jK5I7GzVANK+dB7Q0BUwl5i6xKkBoiYWpPtG1e+wFgvTyhi5Wk7gR 8g== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3j7bttg0hv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 02 Sep 2022 19:04:16 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 282HOifb036665;
	Fri, 2 Sep 2022 19:04:15 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3jarpce87m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 02 Sep 2022 19:04:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KPBnodJ1YnX9YyG8VqLRXkE2veAh0QtPMTp/AhDEzQZYEPrCo4kbX8ZWNZ1Xl5TZmxR6YDlNWB7aqi30kgC3RkZG1mpdwOW+EnXMxQRdXYLOLVKrI4J+GvfogyLLi1KdUpNnoD+zpozJItToXb3fsodF9Y112BA2ImxgNRZ7H21aWTaoPiUPMSljoVNye4bV22dmL3nZSrVqqlT1LvixBt9/Omj/XCNYU7/dlmLjfE+aTQ6M/nLp4bKfCeCO3NbJ61sQ+D4avIsf7S4m9WUKdeDkcj8k2FV5kGScb7x+iDTIY4cuiTXL12e96Xmi6qv2JDfyIe6ijKCrXgBODiqTbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FlfkTBRs/oWB4Utmrpe1o+i8Qaggh4G3ptodBfEJiG0=;
 b=bynCGQ5CjbyeqBr/Ca7bBsNyXZHFiruP5eWCmJY6AbteVKFPsnTFdDgVNudKgtPuNbuLvMz5HKFf99e8wg8qXhjJloaCgTvne9oeCNZV1QgYOeOhWa2LgMiXL3dGxxZq3vOe4S1DnHa6EYY+IX4Pbgn+LonPYxtok0oZlA+gWzyMqWGLCE9TQxUcn5CVdB3+b5R8sRIJpao5EQuo+nFwrDG1J+qbuI4ULq+473hDOLEEbfxEboxDXfGT2ZVkjaYT05yr1tgxiEiis3I9WObqK6xNd0MqmPIYGkVQhPJOLNNRKQ/XmMGEoIMuG99HrkV0XUQbKXuY0J5vYqf+GCzVeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FlfkTBRs/oWB4Utmrpe1o+i8Qaggh4G3ptodBfEJiG0=;
 b=MsOyjgGN8fKnaR1r1VuxSw73AHsM385wr24Tw3nPCiVi4LZQNgJ/eoKAmx9Gsw0LmJzg3WxoumO2EoSi8kfB7ewEmIiliImTeypXSBiFsYPV/ZYQQTX3lqFgveM3IZcMGeJq88YTrATiVlG60Xqqw+5SXxVH3C53aDqRT96az5Y=
Received: from BY5PR10MB4196.namprd10.prod.outlook.com (2603:10b6:a03:20d::23)
 by MN0PR10MB5958.namprd10.prod.outlook.com (2603:10b6:208:3ce::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12; Fri, 2 Sep
 2022 19:04:12 +0000
Received: from BY5PR10MB4196.namprd10.prod.outlook.com
 ([fe80::e9d2:a804:e53a:779a]) by BY5PR10MB4196.namprd10.prod.outlook.com
 ([fe80::e9d2:a804:e53a:779a%6]) with mapi id 15.20.5588.010; Fri, 2 Sep 2022
 19:04:12 +0000
From: Mike Kravetz <mike.kravetz@oracle.com>
To: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-ia64@vger.kernel.org
Subject: [PATCH v2] hugetlb: simplify hugetlb handling in follow_page_mask
Date: Fri,  2 Sep 2022 12:03:57 -0700
Message-Id: <20220902190357.469512-1-mike.kravetz@oracle.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR03CA0303.namprd03.prod.outlook.com
 (2603:10b6:303:dd::8) To BY5PR10MB4196.namprd10.prod.outlook.com
 (2603:10b6:a03:20d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1abf2663-0cef-4852-d9b4-08da8d15ec0a
X-MS-TrafficTypeDiagnostic: MN0PR10MB5958:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	dgXpQeSNxWRfXbiaY0YYrPEEQsXUqfhFhPzD20/VIb43SR+HmOZ7jWeS1jzEGdi1g7i38zSMpW6IMnzzet6+MWzOC5LG7mDe3F7pKaAYaC710ryy1rjYijDmjXJdWOUftZ/T57NRYIPnWKhZlzdLrGlRJcp/ZHXHDnmD4UxZoG5n2pa6lbmEvpojVwuoZa+yStuW+QpekK53mlhd3WgCKuIFLtTwAB5rlI7vZwkn7B8OKBB1ozxr0VRVIRBlj+k+1l/f0nt0VuJrjqFfMxXL2QI+W2w6deN2qggCw03S4pRGVWTxoGbbiO1eA71xldq7mbuZxmBRc2efGSS7cy+YcfALqsI/GYlAcc6nvlp29DOTr48J3KSfb0flFD8IhEY69YZmVHQIHlRhvQ/hxmr1I9GihjBkD6v+voLkwBrcdA9KJjsZcwB9iAb6C8tYg3DzwQIjiMJTVUW+Zgpf9bh5cO8BP0wQo2cXP3B4r3lhc+3ZElR4hhhQRABybBB0VMHdK0N9hM7ydlPEDke1Z1v+nQ/y9o5dOf7v3DeCZwQRyaOpksHF0Oq2v+iy7Vjp9fIm5hR5PbXbW2SQQENNGxWKrFGi1ByZAhLZ31M11WMOeKPVYxctyf+2oGBCB1iKbR8lv14pNgoLvYNyysUHXF70ZASU/ivSCWkExrsvlY5NMD7mlT2WRE/pbfGAYQQ6xmn1r3tELSbwFZmnTNUmpyLlbfVe/vBGvQ6GAZ6jNqm/HTQ=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB4196.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(39860400002)(346002)(396003)(376002)(136003)(8676002)(36756003)(66556008)(4326008)(86362001)(2906002)(30864003)(7416002)(66476007)(5660300002)(8936002)(44832011)(66946007)(54906003)(316002)(26005)(966005)(478600001)(6486002)(41300700001)(6506007)(6512007)(107886003)(83380400001)(38100700002)(2616005)(1076003)(186003)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?lzh0apuVW+4IqIiV/1gQSoFacBSj2PM7XuR4VDRDmjbpUXAeZ23DIUsnQs2I?=
 =?us-ascii?Q?O9XnyhOiexP/N/Rnar3IgbW+SvLKB9/vBE8+tGQy3Iup0d2kVx6Z5Wh8h7yd?=
 =?us-ascii?Q?zuVCBcEb2CTvCYBEdD+23IoxhuQf0LLn6BAoCpu1W76B8SKh8pJ2fpy6oLQv?=
 =?us-ascii?Q?sq+5tdtaRXkGZFosSZDP5bou/EU6OKkzvwFhvCUTT3p33kHzyZmGY3t8NDhb?=
 =?us-ascii?Q?CePcexXKdcr1YRQPxBbWHRVdYTNBMY42wtvXqNmJP64kG+8dL2NgC+9coI6S?=
 =?us-ascii?Q?1bag5BGkSlvcsOcv8CCrGIITNxf/FKY+Vodqg3RQMro4UGrFPXignZHGlWPK?=
 =?us-ascii?Q?khzM8xdDIUzsLii7zyf+/wlINcpF9Htd1ifgTYPBnSXsiBdUYd6myC+1gFgK?=
 =?us-ascii?Q?tpVaI19SRcnv3Y5+3ZDT+u+9WhSz2ySkSEpg/t/q52PRS77Gg6JCGJGr2i9Q?=
 =?us-ascii?Q?FI361jkC3ZRPCXXIBlKq+2H12SevaMxDYoNwOflvQEFEHucDiyYzyB6g3q/H?=
 =?us-ascii?Q?lsSZ8O7XVUBa41W9tnLTC2ft3czyFMuBtXpZikNaXjxw71MVgRjaNjFNZPve?=
 =?us-ascii?Q?VNFDHR11/DTg2RHR9uNBbTkZEgLl65u+VXsFRNQ3sjFesDxfkXvJKLJ9sW/4?=
 =?us-ascii?Q?4qQUsA5Ql7PEJ+ScnxERzlpTlOLR4Bvc3KA5nrFzUUvxZuAPJXKDly88Qj1G?=
 =?us-ascii?Q?UVacV0+TqT9aRjOSRu3U89wDzHuaVw8LdxY7ncb/nfnnj2iWYdG+3rH1LlzL?=
 =?us-ascii?Q?2p2ro47ntTwk512oSjJV2Wi3mjxacetMx2ntBmHD8miV/89XTA1c5NvfMVVD?=
 =?us-ascii?Q?a7/gpALBfTsu4GZyNx/V1flLtPYHd6Clb5YO0ncfhwP6gpC9uoliJQqbAwG6?=
 =?us-ascii?Q?gqyHfefiH5RI727g5ZfyhVS4plppu+B+n7PYMO8Q105zlXzorU9FP5Nemz4o?=
 =?us-ascii?Q?oxEpu/hFhIZ25YlqoVOoI3CbEvie1KvQVxQ8Ezs4ZAf5s8QcS/DjjD4BEMpC?=
 =?us-ascii?Q?XDbdeLsiqGxB8F8U0+Y9lZUfxam9pHB8Mshl6danRN0fN2C0lFd+tPVMO0Wd?=
 =?us-ascii?Q?k81V75xSTUbJ/wFq5QBi4vR6ZbFQy2Uc+fwghi/n2vNWpFL28spsZIfee7dL?=
 =?us-ascii?Q?9zpfHWY9PpdE1S1l9NJMqzYOOx7CVcz9+g1T5cV2KVb+s84XB/+ICiS8RE8M?=
 =?us-ascii?Q?+nEULixaTKOHdtp2YFOJGOXi5n7OiLkgmy6FCxHcEU5tv+afFvJmnC0Jwi9W?=
 =?us-ascii?Q?W3rd5ScnAy3VzcO0G/7MnuG+dyFkdowFP7XHW9H8vsNEHS7r+/N6l9zP/3g9?=
 =?us-ascii?Q?2fNxAiOUNFe6g6OI1JhRFr6lZydHGa4fsVinUPBTVBWpt3M1F5NunsgLvpL1?=
 =?us-ascii?Q?DnPBiQVnmOzaQ7gaDAJeZWPDsKIEfOSj4XX6vqNGUS5jzkMihT/AXDkun5jc?=
 =?us-ascii?Q?ojIxs9PKkz0r2IQA5JK+HqOrG8oXFbJrwefl44qkRVsorA4XAxwfxod+31w7?=
 =?us-ascii?Q?M04O4j32Hz8V+kfqajqvHIBBNlvVr6kPV5bmvs+CqXUSqHiXLPLYtUZPYvee?=
 =?us-ascii?Q?zysvmVFcU4voPi2LfxGE91yd2d2qfh5QuhHeZkV6e+IW0QXG7f4hxDMuuOas?=
 =?us-ascii?Q?uA=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1abf2663-0cef-4852-d9b4-08da8d15ec0a
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB4196.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2022 19:04:12.2174
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FJUaFwaKUaZq/Qoi1mKGGFJwQlrF6Krma46mKyNyFLEW8JQCEej2jCnEUtyw9N/UhnQjkwuDxdOtix7ab06f9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR10MB5958
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-09-02_04,2022-08-31_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 phishscore=0
 spamscore=0 adultscore=0 suspectscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2209020085
X-Proofpoint-ORIG-GUID: 3qdcri-pUWgd0oXJUF3CAomiduPhfv-j
X-Proofpoint-GUID: 3qdcri-pUWgd0oXJUF3CAomiduPhfv-j
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
Cc: David Hildenbrand <david@redhat.com>, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Muchun Song <songmuchun@bytedance.com>, Andrew Morton <akpm@linux-foundation.org>, Naoya Horiguchi <naoya.horiguchi@linux.dev>, Mike Kravetz <mike.kravetz@oracle.com>
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
v2 -	Added WARN_ON_ONCE() and updated comment as suggested by David
	Fixed build issue found by kernel test robot
	Added vma (pmd sharing) locking to hugetlb_follow_page_mask
	ReBased on Baolin's patch to fix issues with CONT_* entries

 arch/ia64/mm/hugetlbpage.c    |  15 ---
 arch/powerpc/mm/hugetlbpage.c |  37 -------
 include/linux/hugetlb.h       |  51 ++--------
 mm/gup.c                      |  80 +++------------
 mm/hugetlb.c                  | 182 ++++++++++++----------------------
 5 files changed, 87 insertions(+), 278 deletions(-)

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
index fe4944f89d34..275e554dd365 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -142,6 +142,8 @@ int move_hugetlb_page_tables(struct vm_area_struct *vma,
 			     unsigned long len);
 int copy_hugetlb_page_range(struct mm_struct *, struct mm_struct *,
 			    struct vm_area_struct *, struct vm_area_struct *);
+struct page *hugetlb_follow_page_mask(struct vm_area_struct *vma,
+				unsigned long address, unsigned int flags);
 long follow_hugetlb_page(struct mm_struct *, struct vm_area_struct *,
 			 struct page **, struct vm_area_struct **,
 			 unsigned long *, unsigned long *, long, unsigned int,
@@ -202,17 +204,6 @@ int huge_pmd_unshare(struct mm_struct *mm, struct vm_area_struct *vma,
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
@@ -264,6 +255,13 @@ static inline void adjust_range_if_pmd_sharing_possible(
 {
 }
 
+static inline struct page *hugetlb_follow_page_mask(struct vm_area_struct *vma,
+				unsigned long address, unsigned int flags)
+{
+	WARN_ON_ONCE(1); /* should never be called if !CONFIG_HUGETLB_PAGE*/
+	return ERR_PTR(-EINVAL);
+}
+
 static inline long follow_hugetlb_page(struct mm_struct *mm,
 			struct vm_area_struct *vma, struct page **pages,
 			struct vm_area_struct **vmas, unsigned long *position,
@@ -274,12 +272,6 @@ static inline long follow_hugetlb_page(struct mm_struct *mm,
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
@@ -312,31 +304,6 @@ static inline void hugetlb_show_meminfo_node(int nid)
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
index 7691c65233c3..1515892a9d98 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -530,18 +530,6 @@ static struct page *follow_page_pte(struct vm_area_struct *vma,
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
@@ -673,20 +661,6 @@ static struct page *follow_pmd_mask(struct vm_area_struct *vma,
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
@@ -776,20 +750,6 @@ static struct page *follow_pud_mask(struct vm_area_struct *vma,
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
@@ -809,7 +769,6 @@ static struct page *follow_p4d_mask(struct vm_area_struct *vma,
 				    struct follow_page_context *ctx)
 {
 	p4d_t *p4d;
-	struct page *page;
 
 	p4d = p4d_offset(pgdp, address);
 	if (p4d_none(*p4d))
@@ -818,14 +777,6 @@ static struct page *follow_p4d_mask(struct vm_area_struct *vma,
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
 
@@ -863,10 +814,18 @@ static struct page *follow_page_mask(struct vm_area_struct *vma,
 
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
 
@@ -875,21 +834,6 @@ static struct page *follow_page_mask(struct vm_area_struct *vma,
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
index c613d3c0c06a..5b4123b0be83 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -6190,6 +6190,72 @@ static inline bool __follow_hugetlb_must_fault(unsigned int flags, pte_t *pte,
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
@@ -7140,122 +7206,6 @@ __weak unsigned long hugetlb_mask_last_page(struct hstate *h)
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
2.37.1

