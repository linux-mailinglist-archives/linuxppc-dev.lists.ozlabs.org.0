Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFDE54EC32
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jun 2022 23:09:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LPFDW2944z3bs0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jun 2022 07:09:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=vI+LJORB;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=ShR35TXu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=mike.kravetz@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=vI+LJORB;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=ShR35TXu;
	dkim-atps=neutral
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LPF8D6NZLz3bpY
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jun 2022 07:06:04 +1000 (AEST)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25GJUUCl022342;
	Thu, 16 Jun 2022 21:05:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=u8MqV7+YTOCa3XoVx1aCQg2YiiCNVTZOThdez4VjBHU=;
 b=vI+LJORBdDRUTcuygK9W7t+1O16FIqGo1fg8oP4O0HFbk/83kOkIO5uvo08eNklQz+Xw
 MWy9tH/ceXd6Qj4EnTqbOWWLrNo/TR1NbOa28ki7zbO+qfCa0xDAK6D6HamOquTnSc5z
 /b0FSjDtAlGa3ZeLes7boRTxEJHo6gIInDMostIW/AXLWxiGc+il7gxv8k6vM026nbD0
 CFyd5+f/8tuKll0CzYcZHAfygbjAujc/fdqfOuCqzS7mf1hbBm2StlSBCJePBInZ5XC4
 IF1Hs9AVXq5VJI9Wbs0lN7FUxLGk2Fpl4uPMYiBEsGfnEsmsckgxn55jZgZ9yiIvWUVV Eg== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gmhfcv83v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 Jun 2022 21:05:40 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 25GL0GHu015694;
	Thu, 16 Jun 2022 21:05:39 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2045.outbound.protection.outlook.com [104.47.56.45])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id 3gpqq2tujq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 Jun 2022 21:05:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k0Wh3H2IUeXHq0fMu7k8931N0tRsCbETNiYKR2wHd0GkOg/PN7jQeQo5hA0G8mux6b9XBtRChkXkpLCozIkqQCQ/uIamW5z8g5a+ZemIgCCh44Pq2uZnxr2w3UZ/nfnmG/asrtlpoadzfmsYPcjdBZb/EGK1weH9sZENKe4eDpz5/LvOb8NGyR7SSJEs8dfM6WxXsFngdEaOw3JXfKJBgBbtY5rMTtOSKqv8kO0+YI72fMLuzhE+9gnF1OULAlJ3TIAyQBvORLvt3NiNqGqb9hjWocZEBoW0WQ0QKHZvpblp3ibV1x7ywDjZSLi6mEuAGwQ2bzykps5zqvpfZHdR7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u8MqV7+YTOCa3XoVx1aCQg2YiiCNVTZOThdez4VjBHU=;
 b=NzdHcjadTSV2P5xaOWj9Kkgvv0tfPPVCZkimwGYVpq1lmec43kZr8ssPO/myo/w8xVt4aIPTqZLi9L7jsXl8TxToZCHZZEqqZqvYiy/WsIFuvJZKD+D1ipWUKQS6HbGxet9vwOsrbxrzZv2bM0/rMQUuWKailut86UYBAAiH43P8Kssrl/z6spJeyjPwlCgcCZ/ZyILwt8uVrvvbbv5MLccDnkZ683dnVToi0hGsAS+lZl3mozadg/Yvvz9ROK7kShgpJQZ9PwzWyhBkYqooPnZq+4RgrrVO+MKvT711ESc4fwOmyaBpxPRviCgPOmX/0W1e78KCIYNZKpEd4lRyew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u8MqV7+YTOCa3XoVx1aCQg2YiiCNVTZOThdez4VjBHU=;
 b=ShR35TXuO2VeHrr/p6KARqrrYYLUEGi8N5A6Ol853jjtBk9BBFZEUha0rYd2izqnvngyiiVlqRSdv2qoAAfwkVifNtZDxHQE46a3YAJG5vWCvaDeqVNI80czWX9rplAIzP9fhw66MOszkoLcfNys5pb3oO0n1iqY6q4TGjWkRZ4=
Received: from BY5PR10MB4196.namprd10.prod.outlook.com (2603:10b6:a03:20d::23)
 by DS0PR10MB6197.namprd10.prod.outlook.com (2603:10b6:8:c3::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5332.22; Thu, 16 Jun 2022 21:05:32 +0000
Received: from BY5PR10MB4196.namprd10.prod.outlook.com
 ([fe80::2125:9bb7:bfeb:81f9]) by BY5PR10MB4196.namprd10.prod.outlook.com
 ([fe80::2125:9bb7:bfeb:81f9%8]) with mapi id 15.20.5353.015; Thu, 16 Jun 2022
 21:05:32 +0000
From: Mike Kravetz <mike.kravetz@oracle.com>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/4] hugetlb: do not update address in huge_pmd_unshare
Date: Thu, 16 Jun 2022 14:05:17 -0700
Message-Id: <20220616210518.125287-4-mike.kravetz@oracle.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220616210518.125287-1-mike.kravetz@oracle.com>
References: <20220616210518.125287-1-mike.kravetz@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4P222CA0020.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::25) To BY5PR10MB4196.namprd10.prod.outlook.com
 (2603:10b6:a03:20d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 30d5d0e4-8fc1-4044-8a9f-08da4fdbf2f7
X-MS-TrafficTypeDiagnostic: DS0PR10MB6197:EE_
X-Microsoft-Antispam-PRVS: 	<DS0PR10MB6197194E7FE20F00CF9880AFE2AC9@DS0PR10MB6197.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	+670796Ud2uwDglHFfmynye2SLPsLm3W6pb/6SS13+zVi+1whFADCzBGpRu4cI0yH78SzzD4eikl0ETozLTGzzx40/KCMv6f4Ycmuw90NGuEPJEA/TfPtDNnQ30PMmq2dhYO7zBCvsd/RaL05PlnEiAfI7wvKzPOKAzzzZozQthpqO75KsCpI3QWD5E2cHOcuyURcYY4cyeiOlFVNcyMHYhxuBOGyDsk77TDYvIt1uOv2lOoIu6CyYvCXBbJnB8PnomrXp8KutO5+GfER2gqm+qZ35lkzq5AdiDNRCLXcwndYKp65nNJkjs+uy5X6whvohLuSkK97jGdIoFGSjS3Z3Yzxax/4vqklOy3bl5dHvs2npiSfZqj4NpmqXmusBpWobJaztmE2FtKIeeU3UhSXgGN8+vPfhZrVk0U1uQnmDKMThFdbJOKnweMVAUDO5JcF2NDLQBvfCwrgIBj/5QraiSGRoA7p+DRgtpk2lDn6nvOXOei/AYHI1SsNfCT7N1rKeUR1KWLuvBIpLULHeGIzHIlYfqhWtT7UGeX1YYX7HDSOJ5YPRO2LgiXQl8CZ2Dxrv4WbCisMcU1z2vkOLFAyGdUMzCvAzaC2fZHIiqcwmhMjLDiyAP1L+31sB04qt+KmSnmGbA2wKsb8agGnUL6QxLtGZJiMTzTeiE2fWXwuTCcULRzX1oTSld2/gxgivU46z5V9VLTD1g7kTkuIdctbw==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB4196.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(6486002)(38100700002)(6666004)(66946007)(7416002)(83380400001)(316002)(2906002)(66476007)(6506007)(4326008)(8676002)(54906003)(1076003)(498600001)(5660300002)(15650500001)(66556008)(86362001)(26005)(44832011)(36756003)(6512007)(2616005)(186003)(921005)(8936002)(107886003)(14583001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?Ws714Hu6Rl9RQFWNWfI7HKXPqH7Y+MEiYmFw651CD1Oxe0VaOL/DvhLNEnom?=
 =?us-ascii?Q?BWCXi2wrduyDad95Cn8hpxRT9B06FxlTb1IgbUEnPCaFuYl34MQuQrHVvjwe?=
 =?us-ascii?Q?sppvB5+vnhT1gZEJEEUHdP12X0KUBiuR05KKtVksubu6wSUQrQfJJ8Sr4Lw1?=
 =?us-ascii?Q?XgTOBcaDOIIXG68Co5PyuAm7BaU+6ILNptGNCz7J8QsBq84hr9wPs4qjIEjE?=
 =?us-ascii?Q?/jE6leklScG/FtH5el1+4PHAqvtQcxhUbYr6cc+xLpIVqohUlZz7529D0Ce8?=
 =?us-ascii?Q?LVRHJcPxEXDg/sSukEQ4WhZy2cBSNMZFlh0n+SI25+P5gaFG/rT33DJOG30Z?=
 =?us-ascii?Q?F7O3tv0uOIdG198x6qA3Z6zJT+twrK4n/TBuLe7mom1LnmIJXr/XRCi/C0jK?=
 =?us-ascii?Q?BgEDFhLYmFdyokcQ4k0xiDFmFNTIjAE2e1gAzWu9cwP7iDPshNIRkzD77uki?=
 =?us-ascii?Q?+z+TaMnBqCadCE7zgZbhhPhrz9TjtJDyx+gVCHLHoOh1IHV3tCb5Mz+ZzhSM?=
 =?us-ascii?Q?3vYkERqPU8EhlQ+L+XKQ3S4di3Xe0Aj8k5zX/D31Nt9zQ76EBgbntcUfNwgO?=
 =?us-ascii?Q?Q8gPdPw4VtPZf/slzp7KWJeZpbsRyxxIHY4sWUENCBk4ZBmREbiMriuF+XQn?=
 =?us-ascii?Q?poJVmuFfDxhNRY+GSg4UgUNQpsaqGmeuwZd1L56W85Atxjw/SXkFhUihWvVR?=
 =?us-ascii?Q?aemh28WBaTUb1YakOE1lL0PUHRJKCjtBnTAHZzeuvNbmuovvAsKLzlhumASN?=
 =?us-ascii?Q?98xl4XPPHbJT75ZyTh2+ww1LNip8esUGG9iBmnyiIJ/YrkQZmvn2BPBeSOkY?=
 =?us-ascii?Q?TfN6VHs0AETfR2EkBBCNUt1+IxNeIRsWlln8G471/gU/13oBQilimECs7P5r?=
 =?us-ascii?Q?I4ZTEOo8PAYNC9UFCk1WlclhkXJVbvGFbuaTB//JdLN85Qb7ydyS8eQfDAF5?=
 =?us-ascii?Q?70tUslwULI54/UQWsP7Z9JczSmWlTfd0ugR0Twaea8hKvqc6OdaicpDjME+2?=
 =?us-ascii?Q?YfYfL16NvAm0H4FYCC8x3fYI77ZmzkHco06eQN0zvRcEfD2ClaljK50+p+yy?=
 =?us-ascii?Q?y6XXWG33c5rnmAX8o+XdlLKUC5qlthgK+ymtXEju3P84YIfsn0xc/IfgYh26?=
 =?us-ascii?Q?AvxmJM51U9uPh/bdSJhOhJkXZu91qcRd4i3Mil808qmFGAKIhvNL2AuwWiMQ?=
 =?us-ascii?Q?S2S4yNzvkP3R19HxDs4PEoQ5FKytn7EGin06ONjBmCtL9jQKSZ/mONOlvSCR?=
 =?us-ascii?Q?geh4UKfXyjNDoSx3pNUqZfVmwDjllhysvD3RBq/YYuRlZFlzeG1mtIzNT1cX?=
 =?us-ascii?Q?4S2YbC/bdnTrYCSK2VD1KlBvOSsfCGb5L7QjRjjJayhF4QQQcZitMuB55eBQ?=
 =?us-ascii?Q?UR5Kcn9JENoJmJLyT0f+ejv9tJBxdixwZj2pDzR97MLAcUvooO2aWQGgFS+O?=
 =?us-ascii?Q?lGlRhUfciSPG3Px5u3g2hKK/CIrc0eCt1+d5KjzuQ/SZEPOqStL2RTQG8p1B?=
 =?us-ascii?Q?xPOFrv2VBe/sw48G6q5y7s7kocUGmpN+Yl24g9jt1XimocHLkgEFizQyWkmF?=
 =?us-ascii?Q?o38O1BcG0M3sdG9Wl8NpcnlYp6SHm7W7UpIkVEa1JwCDzGPpz/WO0NC3v6PW?=
 =?us-ascii?Q?pJ0cVlhJEJ71pImAihZOqB8+O0WaUSTfGVwF7YAXk661SjMOhSLBWIlBo/vo?=
 =?us-ascii?Q?JZjYfv/pJIqwOKnISanF5Dq5q7d8XFCBvAwpsBT85n06YBNIW5g3QdqZqu1t?=
 =?us-ascii?Q?DLdStGYZPgU4BAwDr9gEbqB/Ns/jOdc=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30d5d0e4-8fc1-4044-8a9f-08da4fdbf2f7
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB4196.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2022 21:05:32.1431
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8pYTf0QuDt9Lb0AGPq6ZtzSVmNpIrfC/LTQHiPAFaX0wV7GpRMvrtxrSvnUFtOL9dwThyY0CgLuOCnIXIVFmAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6197
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517,18.0.883
 definitions=2022-06-16_16:2022-06-16,2022-06-16 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=999
 bulkscore=0 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206160084
X-Proofpoint-ORIG-GUID: 2VPGOjUixEPzgRp5YosTaMF77GoSxn7w
X-Proofpoint-GUID: 2VPGOjUixEPzgRp5YosTaMF77GoSxn7w
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

As an optimization for loops sequentially processing hugetlb address
ranges, huge_pmd_unshare would update a passed address if it unshared a
pmd.  Updating a loop control variable outside the loop like this is
generally a bad idea.  These loops are now using hugetlb_mask_last_page
to optimize scanning when non-present ptes are discovered.  The same
can be done when huge_pmd_unshare returns 1 indicating a pmd was
unshared.

Remove address update from huge_pmd_unshare.  Change the passed argument
type and update all callers.  In loops sequentially processing addresses
use hugetlb_mask_last_page to update address if pmd is unshared.

Signed-off-by: Mike Kravetz <mike.kravetz@oracle.com>
Acked-by: Muchun Song <songmuchun@bytedance.com>
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
---
 include/linux/hugetlb.h |  4 ++--
 mm/hugetlb.c            | 47 ++++++++++++++++++-----------------------
 mm/rmap.c               |  4 ++--
 3 files changed, 24 insertions(+), 31 deletions(-)

diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index e37465e830fe..ee9a28ef26ee 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -199,7 +199,7 @@ pte_t *huge_pte_offset(struct mm_struct *mm,
 		       unsigned long addr, unsigned long sz);
 unsigned long hugetlb_mask_last_page(struct hstate *h);
 int huge_pmd_unshare(struct mm_struct *mm, struct vm_area_struct *vma,
-				unsigned long *addr, pte_t *ptep);
+				unsigned long addr, pte_t *ptep);
 void adjust_range_if_pmd_sharing_possible(struct vm_area_struct *vma,
 				unsigned long *start, unsigned long *end);
 struct page *follow_huge_addr(struct mm_struct *mm, unsigned long address,
@@ -246,7 +246,7 @@ static inline struct address_space *hugetlb_page_mapping_lock_write(
 
 static inline int huge_pmd_unshare(struct mm_struct *mm,
 					struct vm_area_struct *vma,
-					unsigned long *addr, pte_t *ptep)
+					unsigned long addr, pte_t *ptep)
 {
 	return 0;
 }
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 7c4a82848603..f7da2d54ef39 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -4949,7 +4949,6 @@ int move_hugetlb_page_tables(struct vm_area_struct *vma,
 	struct mm_struct *mm = vma->vm_mm;
 	unsigned long old_end = old_addr + len;
 	unsigned long last_addr_mask;
-	unsigned long old_addr_copy;
 	pte_t *src_pte, *dst_pte;
 	struct mmu_notifier_range range;
 	bool shared_pmd = false;
@@ -4977,14 +4976,10 @@ int move_hugetlb_page_tables(struct vm_area_struct *vma,
 		if (huge_pte_none(huge_ptep_get(src_pte)))
 			continue;
 
-		/* old_addr arg to huge_pmd_unshare() is a pointer and so the
-		 * arg may be modified. Pass a copy instead to preserve the
-		 * value in old_addr.
-		 */
-		old_addr_copy = old_addr;
-
-		if (huge_pmd_unshare(mm, vma, &old_addr_copy, src_pte)) {
+		if (huge_pmd_unshare(mm, vma, old_addr, src_pte)) {
 			shared_pmd = true;
+			old_addr |= last_addr_mask;
+			new_addr |= last_addr_mask;
 			continue;
 		}
 
@@ -5049,10 +5044,11 @@ static void __unmap_hugepage_range(struct mmu_gather *tlb, struct vm_area_struct
 		}
 
 		ptl = huge_pte_lock(h, mm, ptep);
-		if (huge_pmd_unshare(mm, vma, &address, ptep)) {
+		if (huge_pmd_unshare(mm, vma, address, ptep)) {
 			spin_unlock(ptl);
 			tlb_flush_pmd_range(tlb, address & PUD_MASK, PUD_SIZE);
 			force_flush = true;
+			address |= last_addr_mask;
 			continue;
 		}
 
@@ -6347,7 +6343,7 @@ unsigned long hugetlb_change_protection(struct vm_area_struct *vma,
 			continue;
 		}
 		ptl = huge_pte_lock(h, mm, ptep);
-		if (huge_pmd_unshare(mm, vma, &address, ptep)) {
+		if (huge_pmd_unshare(mm, vma, address, ptep)) {
 			/*
 			 * When uffd-wp is enabled on the vma, unshare
 			 * shouldn't happen at all.  Warn about it if it
@@ -6357,6 +6353,7 @@ unsigned long hugetlb_change_protection(struct vm_area_struct *vma,
 			pages++;
 			spin_unlock(ptl);
 			shared_pmd = true;
+			address |= last_addr_mask;
 			continue;
 		}
 		pte = huge_ptep_get(ptep);
@@ -6780,11 +6777,11 @@ pte_t *huge_pmd_share(struct mm_struct *mm, struct vm_area_struct *vma,
  *	    0 the underlying pte page is not shared, or it is the last user
  */
 int huge_pmd_unshare(struct mm_struct *mm, struct vm_area_struct *vma,
-					unsigned long *addr, pte_t *ptep)
+					unsigned long addr, pte_t *ptep)
 {
-	pgd_t *pgd = pgd_offset(mm, *addr);
-	p4d_t *p4d = p4d_offset(pgd, *addr);
-	pud_t *pud = pud_offset(p4d, *addr);
+	pgd_t *pgd = pgd_offset(mm, addr);
+	p4d_t *p4d = p4d_offset(pgd, addr);
+	pud_t *pud = pud_offset(p4d, addr);
 
 	i_mmap_assert_write_locked(vma->vm_file->f_mapping);
 	BUG_ON(page_count(virt_to_page(ptep)) == 0);
@@ -6794,14 +6791,6 @@ int huge_pmd_unshare(struct mm_struct *mm, struct vm_area_struct *vma,
 	pud_clear(pud);
 	put_page(virt_to_page(ptep));
 	mm_dec_nr_pmds(mm);
-	/*
-	 * This update of passed address optimizes loops sequentially
-	 * processing addresses in increments of huge page size (PMD_SIZE
-	 * in this case).  By clearing the pud, a PUD_SIZE area is unmapped.
-	 * Update address to the 'last page' in the cleared area so that
-	 * calling loop can move to first page past this area.
-	 */
-	*addr |= PUD_SIZE - PMD_SIZE;
 	return 1;
 }
 
@@ -6813,7 +6802,7 @@ pte_t *huge_pmd_share(struct mm_struct *mm, struct vm_area_struct *vma,
 }
 
 int huge_pmd_unshare(struct mm_struct *mm, struct vm_area_struct *vma,
-				unsigned long *addr, pte_t *ptep)
+				unsigned long addr, pte_t *ptep)
 {
 	return 0;
 }
@@ -6926,6 +6915,13 @@ unsigned long hugetlb_mask_last_page(struct hstate *h)
 /* See description above.  Architectures can provide their own version. */
 __weak unsigned long hugetlb_mask_last_page(struct hstate *h)
 {
+	unsigned long hp_size = huge_page_size(h);
+
+#ifdef CONFIG_ARCH_WANT_HUGE_PMD_SHARE
+	/* Required if arch does pmd sharing */
+	if (hp_size == PMD_SIZE)
+		return PUD_SIZE - PMD_SIZE;
+#endif
 	return ~(0UL);
 }
 
@@ -7152,14 +7148,11 @@ void hugetlb_unshare_all_pmds(struct vm_area_struct *vma)
 	mmu_notifier_invalidate_range_start(&range);
 	i_mmap_lock_write(vma->vm_file->f_mapping);
 	for (address = start; address < end; address += PUD_SIZE) {
-		unsigned long tmp = address;
-
 		ptep = huge_pte_offset(mm, address, sz);
 		if (!ptep)
 			continue;
 		ptl = huge_pte_lock(h, mm, ptep);
-		/* We don't want 'address' to be changed */
-		huge_pmd_unshare(mm, vma, &tmp, ptep);
+		huge_pmd_unshare(mm, vma, address, ptep);
 		spin_unlock(ptl);
 	}
 	flush_hugetlb_tlb_range(vma, start, end);
diff --git a/mm/rmap.c b/mm/rmap.c
index 04fac1af870b..1c22e5e1219a 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1559,7 +1559,7 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 				 */
 				VM_BUG_ON(!(flags & TTU_RMAP_LOCKED));
 
-				if (huge_pmd_unshare(mm, vma, &address, pvmw.pte)) {
+				if (huge_pmd_unshare(mm, vma, address, pvmw.pte)) {
 					flush_tlb_range(vma, range.start, range.end);
 					mmu_notifier_invalidate_range(mm, range.start,
 								      range.end);
@@ -1923,7 +1923,7 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 				 */
 				VM_BUG_ON(!(flags & TTU_RMAP_LOCKED));
 
-				if (huge_pmd_unshare(mm, vma, &address, pvmw.pte)) {
+				if (huge_pmd_unshare(mm, vma, address, pvmw.pte)) {
 					flush_tlb_range(vma, range.start, range.end);
 					mmu_notifier_invalidate_range(mm, range.start,
 								      range.end);
-- 
2.35.3

