Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB9B6119F1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Oct 2022 20:12:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MzVyB4qQ1z3cKv
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Oct 2022 05:12:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=y+inw0ny;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=YuzOhce5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=mike.kravetz@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=y+inw0ny;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=YuzOhce5;
	dkim-atps=neutral
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MzVx964kpz3bqt
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Oct 2022 05:11:40 +1100 (AEDT)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29SHPPI5030166;
	Fri, 28 Oct 2022 18:11:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=corp-2022-7-12;
 bh=kQS8t06mTQjCWcPvQC0O08A5iAdBqTsrwKuIvjWN/Tg=;
 b=y+inw0nyI5O/dd28W1orS1ZGt9J5T0pwN5i6CDijABgF5uqrN6dBuFaPnVa277UO77j+
 /BksbLAQqt8yi+xcLwcyUFc3LzVi+lgTQ1yjIPHUESGpb77+jXpYg5Tyh7WrnMgdyzlP
 hHvQpao2f3E3Qegr6i9kLYOZjlfysGrdidmPIrDizuGDa8fLkHyMNleGxm9a2E50RE9M
 k67vlY39L2A9e9SAIj7CPeLMasrt6h4xJYg9qNMzWl4KdpwkSFoBM0Hku2KKe8OCZQjy
 oWxi/jYBc2gy7Omy2dPU7f+HtCToqahKxkZz44fhiEzOElnqFU9S4U6huyrKwvawiB/a uA== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3kfagv5wq7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 28 Oct 2022 18:11:18 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 29SHiYMk006671;
	Fri, 28 Oct 2022 18:11:16 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1anam02lp2040.outbound.protection.outlook.com [104.47.57.40])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3kfagja01g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 28 Oct 2022 18:11:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tbve9UBwCUqrU5t9O9nTiqmaMsqzaGxerbfV0fhDCBVE+4y8cWhNtW7xg11Ai0xjG01v64t5OHrMil8PVD5WoU92d71swmF8/WHAXk8hXCxJ2t8iz12QrriYs3hxfsDzNn3iYdezGdCtC88skjJBqI4r8559JRH/s9VwE+1Bm+jEBD60/7X65GPIiWCmM7Ywe0p9byKQ1u3KuwgmtBrAymNVfWvKIWG/MhpYhKS6JoGuARAmJoDhfMavAiExs7rOogSXgwLzIZMVHAXFjTUe6o0tVkSHYioMMoN95rhJTFfZ0fmDQ9WN8GYQbETpYXz0BFfdFnDG8bEn+eKYXdVtvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kQS8t06mTQjCWcPvQC0O08A5iAdBqTsrwKuIvjWN/Tg=;
 b=kaN++vLoCy2oOK+NT67FA4ApTq8VuwvBIZicG4agBdUtzoWXFeGMeCKxirVikj/stCKL1A9HSoWR3Ao0oTq6bLNnV114Ux/F1SPHQICXBOa+a/sp7DuvqN9jLu7Q+Mb+X47WUexW9x6nFrS0gARr9eoNyh1ZVPSup0vMgX5a+0Fa+dDi+SEuo+lypwhY/r7YYBAmoP7HkaHpff9YRSXECID/WsUFDLmsvONL7fAF877/Ro8i0di3fozY0FAgSILoqrglmVSbNS9CWpKteOcCcWdaEf3XbRkVEFq9BSldvV7BlOb8Xj+rgWUbHWrAy8PkxgkVNk5VRL5NSYYUN9guIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kQS8t06mTQjCWcPvQC0O08A5iAdBqTsrwKuIvjWN/Tg=;
 b=YuzOhce5FoIAgsxEiadzqzm95rrVnn4W70J0lPJMlBYLIr3vhpJV8pelfWJX9rjcnxR1AO0NLIv6m6wboBWtrXKKm1SKvIUKYYTAzcWzUquXUEbdBwDZD2zB3T+PdRzdgKWtL6NWQbM5CsK5V3I6XF9wg3wIOFGDqJiyZlce+Qs=
Received: from BY5PR10MB4196.namprd10.prod.outlook.com (2603:10b6:a03:20d::23)
 by CH0PR10MB4844.namprd10.prod.outlook.com (2603:10b6:610:c0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Fri, 28 Oct
 2022 18:11:14 +0000
Received: from BY5PR10MB4196.namprd10.prod.outlook.com
 ([fe80::58e9:95ba:d31e:ddd3]) by BY5PR10MB4196.namprd10.prod.outlook.com
 ([fe80::58e9:95ba:d31e:ddd3%6]) with mapi id 15.20.5769.015; Fri, 28 Oct 2022
 18:11:14 +0000
From: Mike Kravetz <mike.kravetz@oracle.com>
To: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-ia64@vger.kernel.org
Subject: [PATCH v4] hugetlb: simplify hugetlb handling in follow_page_mask
Date: Fri, 28 Oct 2022 11:11:08 -0700
Message-Id: <20221028181108.119432-1-mike.kravetz@oracle.com>
X-Mailer: git-send-email 2.37.3
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR04CA0277.namprd04.prod.outlook.com
 (2603:10b6:303:89::12) To BY5PR10MB4196.namprd10.prod.outlook.com
 (2603:10b6:a03:20d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR10MB4196:EE_|CH0PR10MB4844:EE_
X-MS-Office365-Filtering-Correlation-Id: 35d3a349-a2e4-43d2-e8d7-08dab90fccea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	eceKe9b4FiSTrTqMbwRGhyitq9UT1iZopaYEyR7P7CkhfZWiNgmTGx18VKCqJwQVlChHZ6o/VWe0dif7yIdRZvLzS6bxY3EZDqIRVAdtY0rfPGm0t7anoZivsnz9ZVNAiPZd575GSi2IULIADghJIGpoc+UYJJqpQrejKCVa/vXtDXfUeBIFv+eXK4Ja9f37zOQCBSDu7h8cQ79vXC0qkuQGna4xal9M3SE7+gXK3u8eosUWz9l4d8CKTFSJtpUZrX6HWLR5yVnVkQFoU0sBOBOHJLvPSnEkH3xGPeKweL7Vru/wCJIY67OtitwetcF7wsgoeWSitgyPJ+iHOOaiQ9Nt0jcokfHqthqc0komyvnArqn2mCFCvNn07D634SNIiL8QN+OG6aU3ajmA/EevxhvCuMO2qp+azEmqTnIFeHr8wiad68ZFlD/y1+QeXodIus9Z7E5523x3MIRtpSp0UIQumrjaU0ygXTBMhQuLrTIFioTSW1tZ50R3dMaGBoYgQ4kATQiXafuAHuardyetonAH73jHGeZiE+FgSBR7IdICrOpue6CkAu2M3n9QVWr2TN1F1cBGWnLdE4eAg7g8PbGxvT9xBzj+HchGAgv+qUrIM6xyebVPOeJIQtO63UBNHHgxUL4BLnrTtd8R5sl7xh5KM6JneKhAIr1VgeSfOYQ6Ch8bDDTHbJWygudUuOOrgHbz0U8BumGIr6onW/wvm7P+v52erkEDHJmIIrxiTrU=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB4196.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(39860400002)(396003)(366004)(346002)(136003)(451199015)(86362001)(38100700002)(7416002)(30864003)(44832011)(5660300002)(2906002)(8936002)(66556008)(66476007)(8676002)(4326008)(1076003)(41300700001)(66946007)(6506007)(107886003)(26005)(6666004)(2616005)(186003)(6512007)(316002)(54906003)(6486002)(966005)(478600001)(83380400001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?Oppzp5Gxeoy8I1T5CTUSjnQKhCfhoJveGU2SNGhheo6n5ACNQR62cVytzgiF?=
 =?us-ascii?Q?Po29zxlxAb97o23VWyn0UHufVr5CIqrX7GcWp3128QPDLRtsRu2NokPNYbvr?=
 =?us-ascii?Q?2dqWFl0WS3dFxHyuFkj+7n4qB6hKlX1Fo3lkbdnR9iHgEdzMjTWQFQ+COekC?=
 =?us-ascii?Q?MN9oBQoZQcQMOSUBE4JoLVnhI2rZhDdQmoAhI/j+XAZSXxmtISmmUXys0+0+?=
 =?us-ascii?Q?oFADlqgOIM6wG96eDIA9t5vJ0LEYoJQjayQt0SjRpqJHZaJm1XEB39BlQegW?=
 =?us-ascii?Q?F2LqOsbu5iPZt2TObXIcBHtG7kgE869dnHhCgwBNPHyNm1mBmU9Z4yGjequM?=
 =?us-ascii?Q?K/MohbapMsyubjswXllcwt0moOc3ejKIvC++3vQD0hOST3f+v9EkqKsn+Ahx?=
 =?us-ascii?Q?IXNJZP+jzvQLm+sn5Lvq0n2AINJrbam5lxLFStYg5ayoflCXp6Yz/KZpXK7x?=
 =?us-ascii?Q?ukOck8BTYghAx41LvXFqt2NDNEkzJXwPXiBjbDcbhWz8DYCnLNiroer2N+9F?=
 =?us-ascii?Q?qogU5WIUVMaz0583Odkm2O++0t84J7MzkIvLX0788pu1HBNKFnloDNjc4b1R?=
 =?us-ascii?Q?Zoh/IiZO4fetoHqiAhA/NoCJmHno5Ekhsc04K1NqBOhaV+2XeLVeT4t0LKWx?=
 =?us-ascii?Q?1lujmW1U8ou4fAWJsqiysL1bt3YtvnqdoX1O0bn7xHssaF5p8A42uUUreKeQ?=
 =?us-ascii?Q?+YMeyYVq0ItO4s9y+E0LMLsV98gEbOGu/kfTRvN4pM11izHzZ27Rv5S9kti9?=
 =?us-ascii?Q?/ww880lgy4LSwjMXqLn2O4piyG7c8TZ927DRAwwfVyI1I2qzzn/VqW/dKsD0?=
 =?us-ascii?Q?qXnf5dnfthOwjCbxGFT3beeTwGItk3fdDTx0D9mlWHaR8IBmsbgLxvYHiscX?=
 =?us-ascii?Q?5I+dxVQy21P2erERZreEWFMLdIliBe7GG0ybQHE+4ZLnu2x0Z8zVyqSjl3E5?=
 =?us-ascii?Q?Xn6sJmwbbUGRdJFhGB4EXYIOuw1u4WJK9r/Pr2JL0aBtBES3UB74YWn63MTI?=
 =?us-ascii?Q?6uV0+aFOzcughEolmGcs1Lc3mCpNJtIifuFWerU4/t+7Z2FwR6Gvtwqup8fl?=
 =?us-ascii?Q?KBdVIcxVsPSx+LDVePnY38BKkuy7QUbPbPsKzaNX13952aynX9HuLHgKWP12?=
 =?us-ascii?Q?uW6flbNgUHlyHiYaeJI5lNPyn8zImPQdP70DL4CpWDkah5ZuoEFzeqjo/PoT?=
 =?us-ascii?Q?DbOHfnkcsre1GAsJM8Hruqh7V0ydubwFz3IMPWJz4gx8a7Z5IFULuJUmFYii?=
 =?us-ascii?Q?UND70zpo5Ioere3yXq4BdZwH5vy0Y6xBhwra5ca+2JGZpQmdRW/+XOnQfkL3?=
 =?us-ascii?Q?djrNvZ3T+MqAL8QdXWV4xoBbFvyZQWRVD/VFm8dQjAvKlLG1imNWx0DFgRI5?=
 =?us-ascii?Q?VnfsSuLWTAEYzoGnkq7rYb8FLqZ3UQtKRd6l3dgj17hnW/ctRAIG8zfOCDRb?=
 =?us-ascii?Q?AfR7R9NPviVIMzWWySpiJhoowRDEMVl5kNTWsTFIVN0C95IZo94bGHdJxfOf?=
 =?us-ascii?Q?ulJVK469UpLVoNj5w1wdqhiaO6M3+225GpLbwH4l4WZ0PMIWQFAb7VlD7Pos?=
 =?us-ascii?Q?e+gq8GEFUxcOtHexm+9CY3IjWAPlsxb0xtwqHrrN9+i5dmdG6cNsKdrr8YQn?=
 =?us-ascii?Q?gQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35d3a349-a2e4-43d2-e8d7-08dab90fccea
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB4196.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2022 18:11:14.4160
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xcL9ZnicTGDJW3NjmDptEQeQble8qoTvubwHw9+/u9N67TjPNE0/2QUdhvgcuN/6N4ZLIzoyajcV7fMZzJo22g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4844
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-28_09,2022-10-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0
 suspectscore=0 phishscore=0 adultscore=0 mlxscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2210280114
X-Proofpoint-ORIG-GUID: r4bTPmxVVfihHYREzWcY5rhFGacjUo_h
X-Proofpoint-GUID: r4bTPmxVVfihHYREzWcY5rhFGacjUo_h
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
Cc: David Hildenbrand <david@redhat.com>, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, Muchun Song <songmuchun@bytedance.com>, Peter Xu <peterx@redhat.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Andrew Morton <akpm@linux-foundation.org>, Naoya Horiguchi <naoya.horiguchi@linux.dev>, Mike Kravetz <mike.kravetz@oracle.com>
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
v4 -    Remove vma (pmd sharing) locking as this can be called with
	FOLL_NOWAIT. Peter
v3 -    Change WARN_ON_ONCE() to BUILD_BUG() as reminded by Christophe Leroy
v2 -    Added WARN_ON_ONCE() and updated comment as suggested by David
        Fixed build issue found by kernel test robot
        Added vma (pmd sharing) locking to hugetlb_follow_page_mask
        ReBased on Baolin's patch to fix issues with CONT_* entries

 arch/ia64/mm/hugetlbpage.c    |  15 ---
 arch/powerpc/mm/hugetlbpage.c |  37 --------
 include/linux/hugetlb.h       |  50 ++--------
 mm/gup.c                      |  80 +++-------------
 mm/hugetlb.c                  | 173 +++++++++++-----------------------
 5 files changed, 77 insertions(+), 278 deletions(-)

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
index 5852a86d990d..f1ba8d1e8c1a 100644
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
index 8b4f93e84868..4a76c0fc6bbf 100644
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
index fe195d47de74..6b16aecf5d2c 100644
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
index 546df97c31e4..3cd4691a4ce6 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -6209,6 +6209,63 @@ static inline bool __follow_hugetlb_must_fault(unsigned int flags, pte_t *pte,
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
+	pte = huge_pte_offset(mm, haddr, huge_page_size(h));
+	if (!pte)
+		return NULL;
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
+	return page;
+}
+
 long follow_hugetlb_page(struct mm_struct *mm, struct vm_area_struct *vma,
 			 struct page **pages, struct vm_area_struct **vmas,
 			 unsigned long *position, unsigned long *nr_pages,
@@ -7201,122 +7258,6 @@ __weak unsigned long hugetlb_mask_last_page(struct hstate *h)
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
2.37.3

