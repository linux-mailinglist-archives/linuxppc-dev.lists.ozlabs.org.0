Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D237553F50
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jun 2022 01:59:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LSNmW73PLz3ds1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jun 2022 09:59:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=OGgFKvfq;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=XgtIMwFy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=mike.kravetz@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=OGgFKvfq;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=XgtIMwFy;
	dkim-atps=neutral
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LSNjD0G5Qz3blq
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jun 2022 09:57:00 +1000 (AEST)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25LIvLGb007514;
	Tue, 21 Jun 2022 23:56:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=corp-2021-07-09;
 bh=JCAUTkU7DIVAPFGJ68CqLPcMG2CgrmMo+eXKPgxjQds=;
 b=OGgFKvfqewyRdxGbMvTFmN7R46E9M2zor+dSO06ICHUdVrQY8TdERVBHci3Zo/7MrZO2
 ZBli2H1+Er9jyhExT8EJWofxMz1vU74uAmZhmrgJ1B/oMWIxkyPIDCZ+ITX3O4ZqP43u
 qJ92gy8zMw00Ej4CTEMP5S06xCZmOSfvAi3w0zgvU0/jAtruAMrDcwYoRnME5ehLEaI0
 AE7WN+ADDbGkoJxC4M+JgSNOrJB6qgP8737ARCNuiVkEqAF3ThNWltdnVjR115NA8HcB
 iVKZ51bfGKfhb83JSLTdzlGZBMRuMPAucAMn1yYt+rrgdOMGsY3DanuHsEh6CgUQs0M9 rw== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gs5g1y162-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 21 Jun 2022 23:56:32 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 25LNoVC4013270;
	Tue, 21 Jun 2022 23:56:31 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2171.outbound.protection.outlook.com [104.47.59.171])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id 3gth8wwugy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 21 Jun 2022 23:56:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FQWUjIb25+67jIRslMcUSLGrSr3IuOeenxWmhYrP+9wuEUEYyZEKrbaD+5ZWhwfGdI76PhaPRboYJzAD20nOqHLFPgypWNIBHyT4ho2WEXaXpbnGVhhq2VF4KPMyjbt5tKXoI8Lj8QQXSORe7ykjQZJGxM1sohMOwRqIGNJqpQlwzpdCGr7zc/J0BNhSlr2jeRbm7ql/uBQ1PTeFzdLuVSoj0F+SMhxtivyuCYeUQ2l+BuN2ZvTuzp1MNw/JqniE2SeQcPJpqBEn9V1IQjA/VJg07mLOO6VZ2yvvcvB5XZcDCseAkhhCJhBQewOJ0zPVYhGM6sC9dXnaavZmf1oAhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JCAUTkU7DIVAPFGJ68CqLPcMG2CgrmMo+eXKPgxjQds=;
 b=iIuP3tV/cGyDKvumoM0lWPkb4X6SCrmUUi6F7DsjEztxh7q89PbN5k8sJoUoCKcIjGUjN5hx22q1D3E9vkJjyLPYC15U7/+S9AezplTs0pSUDYqtkQ5OFXanJHLnxw/a0WgQL748Gij7/e6HixQ/BRZGROulozHDOS4Xw+sE2PnmTicHU1ohMo8lt344LzbOXtb7LDbH9Xy/KBk0338B7IM/wkJSi+tRBudDuvG90RQ1UwltNfwvSLvCH+t0Nr3a5aA0Wn0adUhy857A+9P2w0qevltt0Ai4WuDifSTfiIVa4Ib1lka9dWAJpmG5jm9kIjjbyNTm25wONxqDFFFQFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JCAUTkU7DIVAPFGJ68CqLPcMG2CgrmMo+eXKPgxjQds=;
 b=XgtIMwFyBpHQZTTw3xvmpwUBATumvgDBpkA8nTYk6uLYBbJoHjuEAmlvn62JUiTWyqkJwF8HbLsuzU9kTsQBBumiRtVpQSH9ikLy2grnlpPuhUyKM6WcyG9H5p4ZzoGPqY9bqQa9Gm8As/r98db8nKd008ePu0Vo8Huxops2S0w=
Received: from BY5PR10MB4196.namprd10.prod.outlook.com (2603:10b6:a03:20d::23)
 by MWHPR10MB1501.namprd10.prod.outlook.com (2603:10b6:300:24::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.15; Tue, 21 Jun
 2022 23:56:29 +0000
Received: from BY5PR10MB4196.namprd10.prod.outlook.com
 ([fe80::2125:9bb7:bfeb:81f9]) by BY5PR10MB4196.namprd10.prod.outlook.com
 ([fe80::2125:9bb7:bfeb:81f9%8]) with mapi id 15.20.5353.022; Tue, 21 Jun 2022
 23:56:28 +0000
From: Mike Kravetz <mike.kravetz@oracle.com>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 0/4] hugetlb: speed up linear address scanning
Date: Tue, 21 Jun 2022 16:56:16 -0700
Message-Id: <20220621235620.291305-1-mike.kravetz@oracle.com>
X-Mailer: git-send-email 2.35.3
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4P221CA0009.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::14) To BY5PR10MB4196.namprd10.prod.outlook.com
 (2603:10b6:a03:20d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9785a83f-1ace-4793-e9ff-08da53e1a894
X-MS-TrafficTypeDiagnostic: MWHPR10MB1501:EE_
X-Microsoft-Antispam-PRVS: 	<MWHPR10MB15016896A29BF1C47EE56D39E2B39@MWHPR10MB1501.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	RiU1UfSSQ04hHu/uKT7++qlyZrE/95sX1vsSC8unUDyhTylc832sHKTaXw2n6QTsD9SwY/61UBOwD7YTu8s2JWOxzc/DxbWg9irzIZEghMHRyYjtozD+q76lniohVTLrD55It84AimUhOPvJSgxGmmpaS65VoguFQe4bjOO7eZCjkdCYfPbImaXeY40K+qMdh+j6BsPmQVBnEAxzZXO64JHvHk6h+5DXZF4f29IUZLxjV5vj3cEPymVTCJEJFcc2fxUsOmMxjSpYEsLGG3XbRd1tq3Dj4WD+XTHNaJDmu6zIClS0PCT/gJfa+aMe7ftpjq3IQOi86DgPwi6eCvqlNP9DSkosK932GRdFBmS31x5EMOgBAcFHDA9wHkPYqlzk45uOBfb3aaIBJITCD872Gxz7sQHk7I8Kb3XClqiN/32g5epLldhFh5wnLEBP5Qp/LeDFnUrZ5tw5U8N1Dq2c8lCC0Yo11Te3fsJzpQ1sHpWFN6JqZGtA5cngnW2yi9RMSIlf+WurDl3nR2CtnMoqNGx4ZbP980ys1EFmV5xb/UgTwoV9xgnTNpgfqhhB1rtqZEuP50IgGOWRfVfvoNXxPD0BLHmqbxYwSrqJRCqwuUVXgMCb3a1pdnm3h3gvRHT6zXwktgLx0uTbSNSRgzNVPAtRP8UYCCgmtUhBXF2rIsYKVemfVoybbWVy9ZgD7AcU
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB4196.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(346002)(366004)(136003)(39860400002)(396003)(7416002)(38100700002)(478600001)(316002)(6666004)(186003)(5660300002)(8936002)(2616005)(1076003)(107886003)(83380400001)(41300700001)(2906002)(86362001)(8676002)(66556008)(26005)(6512007)(66946007)(36756003)(66476007)(44832011)(6486002)(4326008)(54906003)(921005)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?GFwHZ4yRaYMcynGzv/uO+EosR+2JdmrkzPR392ovpEFAJnhMWhDneaRaQphz?=
 =?us-ascii?Q?Hqs99Opf8R1j+GjOHBncr1ub18/BpnqCj0e8zUKqBHxZsxzlrkotTkZmzkC9?=
 =?us-ascii?Q?JX/buitJ4QguopUf3S1NcJ4NYRAU5Buj4UOllt5y+uKTTXou7ZAThI5++n0b?=
 =?us-ascii?Q?iNwYXNaYFYVZydblveWiGzcv+MVQeSLCva3UJiDaIvCbiJJp7IQA34RLSDGp?=
 =?us-ascii?Q?SNadhn86xTleQZdlwLaPPmNbtCNK7rBA0vQr/O2FzD7ouyhaQ21Au9zXFma4?=
 =?us-ascii?Q?d3BX2xHaOd97UOsXOpuugNS/XJkabehwC9aSqjj8Sr4exty8fqs7mz8WzFkV?=
 =?us-ascii?Q?W+/dxrUSdqcEhKZX1/WwdB75bsEEQ5aFH9r3vpsUiF62e56fM6G88vG7fuXC?=
 =?us-ascii?Q?mt6yAd3m4c9hkWabme/6odLRMCK0RCYo05J+spN7hDlU1I4VK7Per9lkdutS?=
 =?us-ascii?Q?+0s0sR7qSpWoKyi0khXXHbEWFSb08ABovSzbtXkWkTRaH9ZsVdZDInaxUFM7?=
 =?us-ascii?Q?iid/JAx849Gg4WGRfJlNFGbZAfesjM2mobl+NEWZdfbWb988TX2dSJV46/y6?=
 =?us-ascii?Q?vU2mMbcyiMLJvbU7Ox9ZpV/D4LmKL7/undllsm3UjnhN5QN0sA68PLFJs0zJ?=
 =?us-ascii?Q?YtZ+zz+ZOOEMb2Sp8yVTTLbJEwrMbwna79M65oLd+nG2ka1XrW8IOdAWuuGl?=
 =?us-ascii?Q?Z0py9z6G3cte14414UJPxEWyRGZEyYGue7mlA1nJ2bNVuyKEp3jMyBjAZicG?=
 =?us-ascii?Q?8sax2WdGT61r7ICKEj3NdhebvVHI4NgMbVJShK3/gwujVNlnAGuWFdvyip4s?=
 =?us-ascii?Q?v7RbPps+qvsWP/qp7GLI9ZcuzyZBBsZrLLRHy10c2UOxk9xX5AEyniqjCrzZ?=
 =?us-ascii?Q?fADEwEDtMT5Yt4XNKrpD80osjzx7Bzp55YoKNNB6NG6p1FkPdtPn9WS/RZMR?=
 =?us-ascii?Q?utBL5Eo83YzWfmivQb4Xe6xMh1XXzgJWnUWEblhP6blc1Jt3uQb+ixr8Yzcb?=
 =?us-ascii?Q?wLUPYzHnASkdU84E4XB5neTuunZxmiQjsje27RfwhS5rF0d5efyAUlkrlAiX?=
 =?us-ascii?Q?3h3whKF6GQTFLAxC8aTSmpG1t6kBy29vtOpq2hGy/YyIgybJcGly1LDmnOyq?=
 =?us-ascii?Q?i3Ckpd2TYT8cSjQRT/baS2po95+LQc+Vtq/qqXiZBlDTQUmG6BtLGuLQpwwB?=
 =?us-ascii?Q?JP1UgxW3Q10tHvYF63WAt5hGKl69EqGPrh7oq4aRZwT/JzO0DzO8nIXa4ciC?=
 =?us-ascii?Q?KuDgrmvfWQ8a6X/Z7rugbTjzap3p1YWaLS9KEeoa21tXTf2mCIgfw8buDi2e?=
 =?us-ascii?Q?28kmSJDmCyth6Ex7TTedTyHZnzqbhzniJ0KcBBpDNEL2k8JqDtr7zsd3GW9G?=
 =?us-ascii?Q?/nK4erSk/Tpshb0kf6TbysQJvGL8+owj+hG+ZATlRS+dUe195QbXSnYO86Ke?=
 =?us-ascii?Q?gluAKCBUPvJ8AFI65RfciKulbyFVKFtyxxhRPrRjg0bKC7z/5zkybkTfy9b2?=
 =?us-ascii?Q?TBmvYcgUUEF9vErzu3VwYWdA+VBLhoOQkprqPayP9gWyFKP0E126VBOsE8ve?=
 =?us-ascii?Q?NQWJmbGorZuwVKlBnzaltqkPhoT29MpQFD2uDZ+A94/ZHfOLsOZrcv/iZwkr?=
 =?us-ascii?Q?ySHV5Ae6QvYeFoJ2g3y+OveoHTldLvZKxfCoNh+UYRdlwXEmREhEPaOrHHX6?=
 =?us-ascii?Q?IyJGRKY0Nm9AmGY4HIZdP6T4RlHtwKCtvEQLIktkMa2sEFpzSoiMI7PbQNIJ?=
 =?us-ascii?Q?oqV+f4HUFxZd92mNQQ7imc+nKY2uiUc=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9785a83f-1ace-4793-e9ff-08da53e1a894
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB4196.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2022 23:56:28.8987
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ETCSvQhVGKOQ7c3CAVVHTS4+Lb7nhqeO0sp1OPUZ8Msu2FDM2fVqlq+IO44j1+W1OxlHcyXQN/MQdYX3PAtOsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1501
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517,18.0.883
 definitions=2022-06-21_10:2022-06-21,2022-06-21 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 mlxscore=0
 phishscore=0 adultscore=0 suspectscore=0 mlxlogscore=738 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206210105
X-Proofpoint-GUID: HbXXjC84H3vS9iRHVh-73hQJ5rzE4_R7
X-Proofpoint-ORIG-GUID: HbXXjC84H3vS9iRHVh-73hQJ5rzE4_R7
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
Cc: Mina Almasry <almasrymina@google.com>, James Houghton <jthoughton@google.com>, will@kernel.org, Anshuman Khandual <anshuman.khandual@arm.com>, catalin.marinas@arm.com, Paul Walmsley <paul.walmsley@sifive.com>, Peter Xu <peterx@redhat.com>, Michal Hocko <mhocko@suse.com>, "Aneesh Kumar K . V" <aneesh.kumar@linux.vnet.ibm.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Muchun Song <songmuchun@bytedance.com>, Rolf Eike Beer <eike-kernel@sf-tec.de>, Christian Borntraeger <borntraeger@linux.ibm.com>, Naoya Horiguchi <naoya.horiguchi@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, Mike Kravetz <mike.kravetz@oracle.com>
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

v1->v2  Change hugetlb_mask_last_page default code to 0 instead of ~0.  Peter
        Fix build issues on i386, including going back to if-else-if
	instead of switch in hugetlb_mask_last_page. kernel test robot
        Update commit message. Rolf Eike Beer
        Changes were relatively minor, so I left the Reviewed-by and
        ACKed-by tags.

Baolin Wang (1):
  arm64/hugetlb: Implement arm64 specific hugetlb_mask_last_page

Mike Kravetz (3):
  hugetlb: skip to end of PT page mapping when pte not present
  hugetlb: do not update address in huge_pmd_unshare
  hugetlb: Lazy page table copies in fork()

 arch/arm64/mm/hugetlbpage.c |  20 +++++++
 include/linux/hugetlb.h     |   5 +-
 mm/hugetlb.c                | 102 +++++++++++++++++++++++++-----------
 mm/memory.c                 |   2 +-
 mm/rmap.c                   |   4 +-
 5 files changed, 96 insertions(+), 37 deletions(-)

-- 
2.35.3

