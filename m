Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D217954EC17
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jun 2022 23:07:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LPF9j2n4Bz3cf5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jun 2022 07:07:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=ubnNNyVj;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=hvq4QmRy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=mike.kravetz@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=ubnNNyVj;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=hvq4QmRy;
	dkim-atps=neutral
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LPF8441njz3bYk
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jun 2022 07:05:52 +1000 (AEST)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25GIhs7r032716;
	Thu, 16 Jun 2022 21:05:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=w5cTVYOn/v+TXONP93tevxMeXQlxzwNQUwB1Q4Yx+As=;
 b=ubnNNyVj/FmQScLBo3gzCrM7s+5z4GQCUgF0hZ9DsxY7t1Bh4xdb+kaUXux+RAYiyvI7
 PMyBg97abNugmZVgs0sFuKtoSW/H3EDj6P+7m9oJWKtFlXlVLDcF5ufSCGbDjeT26Nfr
 rzImrm6QCTRz2UBOtOTTIE8DYMAhNnW6bGAvgrHd789IKh7rfIbchQsOxe/tBzniGF8P
 zbIDtHFaDFJ7/MMKwAXakuAU8tQtH3opn/DIWj4rXCGrto9+eay28/hVi5xGJseOzepy
 FZwj825lXq2tQh8kGgTCkb1HCPP7LKGkaRoXr9o19UFSgVkWo67Oq1vBsocadopO6RAE xA== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gmhu2vg2j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 Jun 2022 21:05:30 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 25GL0Go1015726;
	Thu, 16 Jun 2022 21:05:29 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2044.outbound.protection.outlook.com [104.47.56.44])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id 3gpqq2tugm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 Jun 2022 21:05:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Izv8Ugm0+KThLmkna22uVj2SRLVVkjCT+k6sS+AraddbIQ5WDjpR3fwD9rmbUvRpPQNNJiclWkFU+2NEVf1997cJLUaS6QTH1iul9AZBrWI7pqfEHY8aoHv2Mjwh5yjHDZAr92TgphbVUKjU+wnHSNqiFUmpFD9Ql8vfYTMtnbFgnaeGOIa0Pseh2Tt1XxDwkYN+eTrNZPEgHbZx4jwn+AZnRWLA1qUwD/sXsy4TX4zOETP9KIITgxRqpMKAdhXR9T42PUfzKiMiuk/kz5FPS9krHP2Vhb+mNwhtFBfn3HXjiU5m5oyuWjlXilGuIiiOn/qnPI0nJKUXn2dKiX4DyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w5cTVYOn/v+TXONP93tevxMeXQlxzwNQUwB1Q4Yx+As=;
 b=cH5yA8qK6S2DDlk+MLicffDcud0SmpNwYwl6ytGrpTLQuecfjcMQcY4lAghdCgwHr4fZGmqozJ3RWqo9aWC8mC4zQW1QTnxhJ7Ev3zVciphcEUNCQ9icNTp1ChsTGa1klYYVNXdcuoTBIFUtJuhUXJ+wN82Pg7128uGeAD90cYawk0WOj1NsikM6QmeEdFN+Fn+QjNrvNcrVmIDBMlMBNb2Dwp4/Bjzq2Di/TBr8a/ndx7rxaM1oBkSjGFI/Ue14bpa/yG4MRKDhMW6ldrE1APFswGhhvVIHshoU5mXyky0QwU+F9VfbPvmhAwS069pN8WvJhqp7DxOQ0PD9H5tk6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w5cTVYOn/v+TXONP93tevxMeXQlxzwNQUwB1Q4Yx+As=;
 b=hvq4QmRycb+cUCmEev+An/mAQ8/skeUlCmwupqk0hbCnkqQVg6/RwUHfyqOIBnv8IZ1NwAG6CkLtJe3eSbcsIdyoPIRuIdEhb/RhQ1/BWVweojWlK1/wWeJM6LHiCEGUtceeUB30UrBQ7UUAa7Z1NKsJh4EW0bEALv8stcfK2Ag=
Received: from BY5PR10MB4196.namprd10.prod.outlook.com (2603:10b6:a03:20d::23)
 by DS0PR10MB6197.namprd10.prod.outlook.com (2603:10b6:8:c3::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5332.22; Thu, 16 Jun 2022 21:05:27 +0000
Received: from BY5PR10MB4196.namprd10.prod.outlook.com
 ([fe80::2125:9bb7:bfeb:81f9]) by BY5PR10MB4196.namprd10.prod.outlook.com
 ([fe80::2125:9bb7:bfeb:81f9%8]) with mapi id 15.20.5353.015; Thu, 16 Jun 2022
 21:05:27 +0000
From: Mike Kravetz <mike.kravetz@oracle.com>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/4] hugetlb: skip to end of PT page mapping when pte not present
Date: Thu, 16 Jun 2022 14:05:15 -0700
Message-Id: <20220616210518.125287-2-mike.kravetz@oracle.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220616210518.125287-1-mike.kravetz@oracle.com>
References: <20220616210518.125287-1-mike.kravetz@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR04CA0091.namprd04.prod.outlook.com
 (2603:10b6:303:83::6) To BY5PR10MB4196.namprd10.prod.outlook.com
 (2603:10b6:a03:20d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 11115864-9766-4f53-e5c7-08da4fdbeffe
X-MS-TrafficTypeDiagnostic: DS0PR10MB6197:EE_
X-Microsoft-Antispam-PRVS: 	<DS0PR10MB61975C7F919A75CA02A9B702E2AC9@DS0PR10MB6197.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	T0P0TduMZQce0mjwG/oSmKHWjE56l/J20JaJOVo/TJZDS9C4rqrxDh62ljtIlHc+Kj9phMJsigO9C/qoAn4B0QXp2S/WDMvvC59NkZnYq0ai6AKKFfyrMW4qIAidLkQB93f82YkUWF3BjuTis6+0bnzOO/RK5FTvewpiupAIvFxVCNPkzmP9IcTtwamR1tNB5ozs6YAErZTaqJJVHYOclPssZp8pWiB2XmKb9ne2NODCUR4rFbMC/6eBvGCe7IvhMp84eY9gJhjmABDwCNyU3ylPYLpFU/r062FUvNwHcN67RWU9EPVUKJfkZM3JEj/8Xzds5CYe5zMyc9qiuUJ1AO+u3hVGQZjgZJpnGkcHAr1FsZRN/Hy0s/OTivYn/dhUwKZFGOegvWXvUk+Yh02w+PBrjDuZ8tVzyhTzLZi/wzoqYaZLMvGrAcdB0ciOLdQJD6QHkPnx6VIcqyxhvBU2HSqwYobaOY7C2Vy8N1rD+TF5CzbQwpgzzD647sdO1uKSUchcJA1uUTGzxB6KXq4qiFg32865RjB+Xb1w6gJqMEj/9Y0S9dTriF5aAnBVKmWu6eEJjFUIgO8710hRfPTDBSiHs+CrkUYlffAkT3wsDeLFO9b7Z4/IqgsHmEEZ/fAGBl9Rn40OIQ+Z3nBaAFuU2e7+o9LfmMeWFB15K42NIipY6dpHzPLOOBkwPD+Cq3LOab18Pk9KKGxPQfocCX0OcQ==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB4196.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(6486002)(38100700002)(6666004)(66946007)(7416002)(83380400001)(316002)(2906002)(66476007)(6506007)(4326008)(8676002)(54906003)(1076003)(498600001)(5660300002)(66556008)(86362001)(26005)(44832011)(36756003)(6512007)(2616005)(186003)(921005)(8936002)(107886003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?CSyJXNi5AP/1OLed91zMPmjo+mwlO3lTKcBO9WanfxCUtW9xnTn0j/Fs9GFo?=
 =?us-ascii?Q?H7CXF/1h7cpr4xlU7n7XPIT45xAaKUNI14AtyxNnQJJBJ7EFwtZxmtna8at4?=
 =?us-ascii?Q?1DFXesNGVRDfxkRv8hkyONup8iGjCYgi3anBseU0BifuALXM1cUoNYX+xpHV?=
 =?us-ascii?Q?xk91L8hvH3YujjU8PTKgRiYMtGIqo5em7/0iw0VBx96FCi5xdfedYPzA7Y4q?=
 =?us-ascii?Q?OFzerp1Vb+VpZQ4xZpNXQ9Ei4nNGcZ3MhpN9vHlILaxt7gpgdhzNyjgPcw91?=
 =?us-ascii?Q?QBWF5nQ0DxxYgvRpeCehzupUZ5eGnUxeorW3fyQCDRxZSyOwqt1MriuYJf8l?=
 =?us-ascii?Q?IOxjay3WLSgN5Of6rGEkpcU3BVmyFmY2QLUXkQO1Uc3yBOOeLB4mHq2vxjN1?=
 =?us-ascii?Q?IBYjja8Rb8t3jvw3E3cUDmRamDV600IUBikFRrLRCJRpDfRRLsanQ3Xhj5x/?=
 =?us-ascii?Q?DMk2eKO1mE314AbWyJAOx5Xy9SaDhR7oASwjTI4UOyjHm1FMitHy61P3f64M?=
 =?us-ascii?Q?llFgM4BvG4Ixxk25NDNyLMoTWPuHdHEr6tbeQETzFBPqPJFL3nZkr9DlOrcR?=
 =?us-ascii?Q?kzAwbJ3oG4DVUyINj45StKdnUWJa8G50XER5umk6GFHJ5Ytt4l1z86qS3AGR?=
 =?us-ascii?Q?LWT6jCCQ+Pgd9/M1qM2mVwdewfv9yokIHne/V1GImiueyKw1Sjsqu/chEo+v?=
 =?us-ascii?Q?/+XPs7dulqoAZNxSIbbVgWfdTjNgpX+3jqh0PLdQamPiuSabMIAg6PA45/Jm?=
 =?us-ascii?Q?o3r1dsORsROCS700tMm7fbjxzSq45cQiSbC9efdpj4Tn9qqkZ9jHgvu9uC4O?=
 =?us-ascii?Q?qKUyuRffoTr9pTBXlDo4Xqaw/VIKQph3rLFyc7itCkPZXdY6ck9Lqo7uadJp?=
 =?us-ascii?Q?CzO9EODESmxMhqmLbJ9tyk0/TlbBexhwTMO/OH3a9Y9tLnVD76xT6KQgKPR1?=
 =?us-ascii?Q?sYXM/VKg2ofErcz1tfw63RnwNpefuHs9Gh4pDZcU0su8kvGsNqTIVgA/gJgw?=
 =?us-ascii?Q?7bkSA8IvGeeiE1ggzVN6iJ6E0RM0gs1KbZ+nUANtvTfE9XT2e6g9/3ZaY9Lm?=
 =?us-ascii?Q?i4HJ1i7xgp0Q851j+H0cwSuyfudfPQrhEQvFWQzASBPjwouXwqxRivGTtlUI?=
 =?us-ascii?Q?0fqxRKAY9CPMc6MsLeQqT46S/405yfpB4AHHzFjhl+6zP3bH41J2123muw27?=
 =?us-ascii?Q?i4m8lUXaZs5tyrODowXbeKoEsNaq91Z+joSblehDydvj7fFBOjVdSdxUGM1f?=
 =?us-ascii?Q?21Yfy/O2uqUGg4IXuCuUpfzvEmKI2XXbsSLE8LbvRstA1c99uepdlOfBaRN4?=
 =?us-ascii?Q?vh6mK+Ya4DN+h1Dpo+OdtvYQDSKK37VEKLs3IMtiTvVjZZQ6jFRv6hSoxpSZ?=
 =?us-ascii?Q?EmJM9w1mBZIJrSPYpa/WzW3BbQm88ii+GN/pU8EXqMW70XvYpVsLjLG1y80F?=
 =?us-ascii?Q?pokFbRriqsAyOq7Bw6rHOwby2GS9ziC/L8VIdHiA1FJxRuLEQhQ8lnpG8luV?=
 =?us-ascii?Q?6avFhBYWxzMBm9K/Xr7ed7alefEa6b9mdHCsqnq5i7zIabievmqMpNwnKpki?=
 =?us-ascii?Q?BpyLqqKvZQ7wm9ffJ73MAvP0UCmckzfP+qoHUHqdyLmbOhO0M/Vhk46vJX1U?=
 =?us-ascii?Q?RumKnIN7mufnE+qGxRuziMjsx9K/4m9lrXsoY9dVDrpoRFDWD8iBBPEw6fxl?=
 =?us-ascii?Q?OYUD5uyuOqmYeAAVYoEjpBRV/ow2pWj3H+o3+X1YLtzTM/URswvFag0JPpht?=
 =?us-ascii?Q?ynbIcc4GNpN+aA4wSUa6sGl0E7zI+a8=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11115864-9766-4f53-e5c7-08da4fdbeffe
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB4196.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2022 21:05:27.1269
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i8twpWPpnkkw8vEE1iSX3yw69oNM8xvvtQ/NhxxnuYiEhCIurFYFtSmlmvwGvh0nkOm8ksTainB0rKXTZE6mLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6197
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517,18.0.883
 definitions=2022-06-16_16:2022-06-16,2022-06-16 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=999
 bulkscore=0 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206160084
X-Proofpoint-GUID: sxMWOdiHSyPh95NX-KsyJz11lNRhFtWb
X-Proofpoint-ORIG-GUID: sxMWOdiHSyPh95NX-KsyJz11lNRhFtWb
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

HugeTLB address ranges are linearly scanned during fork, unmap and
remap operations.  If a non-present entry is encountered, the code
currently continues to the next huge page aligned address.  However,
a non-present entry implies that the page table page for that entry
is not present.  Therefore, the linear scan can skip to the end of
range mapped by the page table page.  This can speed operations on
large sparsely populated hugetlb mappings.

Create a new routine hugetlb_mask_last_page() that will return an
address mask.  When the mask is ORed with an address, the result
will be the address of the last huge page mapped by the associated
page table page.  Use this mask to update addresses in routines which
linearly scan hugetlb address ranges when a non-present pte is
encountered.

hugetlb_mask_last_page is related to the implementation of
huge_pte_offset as hugetlb_mask_last_page is called when huge_pte_offset
returns NULL.  This patch only provides a complete hugetlb_mask_last_page
implementation when CONFIG_ARCH_WANT_GENERAL_HUGETLB is defined.
Architectures which provide their own versions of huge_pte_offset can also
provide their own version of hugetlb_mask_last_page.

Signed-off-by: Mike Kravetz <mike.kravetz@oracle.com>
Tested-by: Baolin Wang <baolin.wang@linux.alibaba.com>
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
---
 include/linux/hugetlb.h |  1 +
 mm/hugetlb.c            | 62 +++++++++++++++++++++++++++++++++++++----
 2 files changed, 58 insertions(+), 5 deletions(-)

diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index 642a39016f9a..e37465e830fe 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -197,6 +197,7 @@ pte_t *huge_pte_alloc(struct mm_struct *mm, struct vm_area_struct *vma,
 			unsigned long addr, unsigned long sz);
 pte_t *huge_pte_offset(struct mm_struct *mm,
 		       unsigned long addr, unsigned long sz);
+unsigned long hugetlb_mask_last_page(struct hstate *h);
 int huge_pmd_unshare(struct mm_struct *mm, struct vm_area_struct *vma,
 				unsigned long *addr, pte_t *ptep);
 void adjust_range_if_pmd_sharing_possible(struct vm_area_struct *vma,
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 259b9c41892f..7c4a82848603 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -4740,6 +4740,7 @@ int copy_hugetlb_page_range(struct mm_struct *dst, struct mm_struct *src,
 	unsigned long npages = pages_per_huge_page(h);
 	struct address_space *mapping = src_vma->vm_file->f_mapping;
 	struct mmu_notifier_range range;
+	unsigned long last_addr_mask;
 	int ret = 0;
 
 	if (cow) {
@@ -4759,11 +4760,14 @@ int copy_hugetlb_page_range(struct mm_struct *dst, struct mm_struct *src,
 		i_mmap_lock_read(mapping);
 	}
 
+	last_addr_mask = hugetlb_mask_last_page(h);
 	for (addr = src_vma->vm_start; addr < src_vma->vm_end; addr += sz) {
 		spinlock_t *src_ptl, *dst_ptl;
 		src_pte = huge_pte_offset(src, addr, sz);
-		if (!src_pte)
+		if (!src_pte) {
+			addr |= last_addr_mask;
 			continue;
+		}
 		dst_pte = huge_pte_alloc(dst, dst_vma, addr, sz);
 		if (!dst_pte) {
 			ret = -ENOMEM;
@@ -4780,8 +4784,10 @@ int copy_hugetlb_page_range(struct mm_struct *dst, struct mm_struct *src,
 		 * after taking the lock below.
 		 */
 		dst_entry = huge_ptep_get(dst_pte);
-		if ((dst_pte == src_pte) || !huge_pte_none(dst_entry))
+		if ((dst_pte == src_pte) || !huge_pte_none(dst_entry)) {
+			addr |= last_addr_mask;
 			continue;
+		}
 
 		dst_ptl = huge_pte_lock(h, dst, dst_pte);
 		src_ptl = huge_pte_lockptr(h, src, src_pte);
@@ -4942,6 +4948,7 @@ int move_hugetlb_page_tables(struct vm_area_struct *vma,
 	unsigned long sz = huge_page_size(h);
 	struct mm_struct *mm = vma->vm_mm;
 	unsigned long old_end = old_addr + len;
+	unsigned long last_addr_mask;
 	unsigned long old_addr_copy;
 	pte_t *src_pte, *dst_pte;
 	struct mmu_notifier_range range;
@@ -4957,12 +4964,16 @@ int move_hugetlb_page_tables(struct vm_area_struct *vma,
 	flush_cache_range(vma, range.start, range.end);
 
 	mmu_notifier_invalidate_range_start(&range);
+	last_addr_mask = hugetlb_mask_last_page(h);
 	/* Prevent race with file truncation */
 	i_mmap_lock_write(mapping);
 	for (; old_addr < old_end; old_addr += sz, new_addr += sz) {
 		src_pte = huge_pte_offset(mm, old_addr, sz);
-		if (!src_pte)
+		if (!src_pte) {
+			old_addr |= last_addr_mask;
+			new_addr |= last_addr_mask;
 			continue;
+		}
 		if (huge_pte_none(huge_ptep_get(src_pte)))
 			continue;
 
@@ -5007,6 +5018,7 @@ static void __unmap_hugepage_range(struct mmu_gather *tlb, struct vm_area_struct
 	struct hstate *h = hstate_vma(vma);
 	unsigned long sz = huge_page_size(h);
 	struct mmu_notifier_range range;
+	unsigned long last_addr_mask;
 	bool force_flush = false;
 
 	WARN_ON(!is_vm_hugetlb_page(vma));
@@ -5027,11 +5039,14 @@ static void __unmap_hugepage_range(struct mmu_gather *tlb, struct vm_area_struct
 				end);
 	adjust_range_if_pmd_sharing_possible(vma, &range.start, &range.end);
 	mmu_notifier_invalidate_range_start(&range);
+	last_addr_mask = hugetlb_mask_last_page(h);
 	address = start;
 	for (; address < end; address += sz) {
 		ptep = huge_pte_offset(mm, address, sz);
-		if (!ptep)
+		if (!ptep) {
+			address |= last_addr_mask;
 			continue;
+		}
 
 		ptl = huge_pte_lock(h, mm, ptep);
 		if (huge_pmd_unshare(mm, vma, &address, ptep)) {
@@ -6305,6 +6320,7 @@ unsigned long hugetlb_change_protection(struct vm_area_struct *vma,
 	unsigned long pages = 0, psize = huge_page_size(h);
 	bool shared_pmd = false;
 	struct mmu_notifier_range range;
+	unsigned long last_addr_mask;
 	bool uffd_wp = cp_flags & MM_CP_UFFD_WP;
 	bool uffd_wp_resolve = cp_flags & MM_CP_UFFD_WP_RESOLVE;
 
@@ -6321,12 +6337,15 @@ unsigned long hugetlb_change_protection(struct vm_area_struct *vma,
 	flush_cache_range(vma, range.start, range.end);
 
 	mmu_notifier_invalidate_range_start(&range);
+	last_addr_mask = hugetlb_mask_last_page(h);
 	i_mmap_lock_write(vma->vm_file->f_mapping);
 	for (; address < end; address += psize) {
 		spinlock_t *ptl;
 		ptep = huge_pte_offset(mm, address, psize);
-		if (!ptep)
+		if (!ptep) {
+			address |= last_addr_mask;
 			continue;
+		}
 		ptl = huge_pte_lock(h, mm, ptep);
 		if (huge_pmd_unshare(mm, vma, &address, ptep)) {
 			/*
@@ -6877,6 +6896,39 @@ pte_t *huge_pte_offset(struct mm_struct *mm,
 	return (pte_t *)pmd;
 }
 
+/*
+ * Return a mask that can be used to update an address to the last huge
+ * page in a page table page mapping size.  Used to skip non-present
+ * page table entries when linearly scanning address ranges.  Architectures
+ * with unique huge page to page table relationships can define their own
+ * version of this routine.
+ */
+unsigned long hugetlb_mask_last_page(struct hstate *h)
+{
+	unsigned long hp_size = huge_page_size(h);
+
+	switch (hp_size) {
+	case P4D_SIZE:
+		return PGDIR_SIZE - P4D_SIZE;
+	case PUD_SIZE:
+		return P4D_SIZE - PUD_SIZE;
+	case PMD_SIZE:
+		return PUD_SIZE - PMD_SIZE;
+	default:
+		break; /* Should never happen */
+	}
+
+	return ~(0UL);
+}
+
+#else
+
+/* See description above.  Architectures can provide their own version. */
+__weak unsigned long hugetlb_mask_last_page(struct hstate *h)
+{
+	return ~(0UL);
+}
+
 #endif /* CONFIG_ARCH_WANT_GENERAL_HUGETLB */
 
 /*
-- 
2.35.3

