Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 407C2553F4B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jun 2022 01:57:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LSNk21Yynz3bt4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jun 2022 09:57:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=UgUqMr6y;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=qa7c+sMl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=mike.kravetz@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=UgUqMr6y;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=qa7c+sMl;
	dkim-atps=neutral
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LSNjC17pvz3blq
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jun 2022 09:57:02 +1000 (AEST)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25LJHFt2012606;
	Tue, 21 Jun 2022 23:56:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=I9VUsXTeCErywBNKneFYp5mpvZSZCqFWtRZtD7nEsHo=;
 b=UgUqMr6yBExSvhRm5IWJFlwgnYompsYX+wxLJ7qimAs+Q7Vk0xZaRQODUQYiFarqU6+N
 ZTarSr2bvWej74X5pe6Mht6YXlQgP3b7lz80/XtGiHvNRew57/kjQs56l60wToAIvwrQ
 FbEo9e7CrnXpBUQDIVKPNySDx/2TCf3otGrJ4VLu+3cWPwroXQeYx3HUN5ChwCdXtMQO
 ZDQlVzB1ZVuxv60clqi7d3OrGLQei8CZ6fq8e4RBI536afRI7YhWUUCT7E2WFFO3pFp+
 OjvKpVb+rS8g1JzDtm4Ae7Z1hXUsgzIFGVNkVBLxw8vHYgv5r37n0ujIgfywZARK4PrG Pg== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gs6kf6vnb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 21 Jun 2022 23:56:35 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 25LNok7c039924;
	Tue, 21 Jun 2022 23:56:34 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id 3gtf5cysds-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 21 Jun 2022 23:56:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oXRxeAxcKG5xZ5wuSJtvW88NPu69qSjuurV/FW0XF2z4jvOyE45Z2U18SzHTb9h9cqnb/knSHhOzQRXIS4v1jzEdvKDQW9ZwaHfTdSFbqpiIhpnuHq7ka/CWjViMMObCvbXJy47xgqveLFC4srXgG6aZkFzSfs5jLGebNzloUTV8GGQH00lq7WmtWMFx6gbOU0fBU4T7rR0AafZGMmWGzzKoWOR6n03N5LgMiSg6w+fobnHCJnSNAcnqNpq9C6/IBUO4MS2EhZ4UqE0mHpXos0bU/IU3JLvWdb7eQJQ9i7czTE/WndUAvhyFbHnwG5lLp7TOZ5vEyDBtIK+norUipw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I9VUsXTeCErywBNKneFYp5mpvZSZCqFWtRZtD7nEsHo=;
 b=dfvRA3Rd+PPIcMLdq6s4t8z9QcZNo96rAQ+9SLwCKqEmgLNerHWVoqboNqNF/93cBXExbh5vBbkbK99SX84sjxuQ53SPnwHjNwkNXY/f/3JIFAwUlaphP0Y3vYdMZyFOs/dq31J7bxGTPsg3foTK2bCC+TkREO5QNkDLK/a9XrCayPHfmZ92z5D4gvsRiWKtf5oRw6g9fQqd+n9B9OARAcQN9G1cxHd7lyXjX8QBmVLRgOyHhDyfbiSPTfQNhhgHxR8egcGYD8VMwCg0KqtcH8GO/jp1gPD5ziLWBkpdhL/Wd4Sj6/MrJn+UDlYThSVA96u1Khd6hd0nb+MXOCpthg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I9VUsXTeCErywBNKneFYp5mpvZSZCqFWtRZtD7nEsHo=;
 b=qa7c+sMlHj+C/E80zr++3XHS4l/O9sAs0Yt349zvO3FtLL2dVBRpaUzhryiQgJjgrylrMpn2GpZHuiOtFcODdVXv8F33j/jhebxeclfhOAv2Hh2firUgyR7M+mGtixnhXFrsPUE2RT87IL+0qumtrPpNz0znNwnl36QmkmZbyZ8=
Received: from BY5PR10MB4196.namprd10.prod.outlook.com (2603:10b6:a03:20d::23)
 by MWHPR10MB1501.namprd10.prod.outlook.com (2603:10b6:300:24::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.15; Tue, 21 Jun
 2022 23:56:32 +0000
Received: from BY5PR10MB4196.namprd10.prod.outlook.com
 ([fe80::2125:9bb7:bfeb:81f9]) by BY5PR10MB4196.namprd10.prod.outlook.com
 ([fe80::2125:9bb7:bfeb:81f9%8]) with mapi id 15.20.5353.022; Tue, 21 Jun 2022
 23:56:31 +0000
From: Mike Kravetz <mike.kravetz@oracle.com>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 1/4] hugetlb: skip to end of PT page mapping when pte not present
Date: Tue, 21 Jun 2022 16:56:17 -0700
Message-Id: <20220621235620.291305-2-mike.kravetz@oracle.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220621235620.291305-1-mike.kravetz@oracle.com>
References: <20220621235620.291305-1-mike.kravetz@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR04CA0283.namprd04.prod.outlook.com
 (2603:10b6:303:89::18) To BY5PR10MB4196.namprd10.prod.outlook.com
 (2603:10b6:a03:20d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 74ce3319-f277-4cbc-519a-08da53e1aa55
X-MS-TrafficTypeDiagnostic: MWHPR10MB1501:EE_
X-Microsoft-Antispam-PRVS: 	<MWHPR10MB1501ED1071778FE857339423E2B39@MWHPR10MB1501.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	5dPWq6OKGgc3xc6Jm8BtQlAAgsjKh4XmdKVRfk6Ni+fak1qympT0LLgQpDSw4/+bAvqEiaPyzVZmYIfnRyUyAcFkQfNKnGQvtpnGFT2uGvVytgheVRzhCgJJnQ6CZTf2quazgmjqgjSuTLxobSmMAiiaArmtsH50gOlXYBBQ7dVzOFiU530HdBwOLwKJTeZz9pOeEEGjIX0jbvcPmoXo0kTeC1ZWzAufQPaNgXSIwbSqDXEBpr1LTvYF6CfaSpCyY46FCh2y7/txFgIx2Vf16/O+OANF03FS4Y/ejl48NVtYKWh8J+GXZJpNitcN7q+fGlUhW2PGry3ofomZM6bdpNNnB+kl3ACrs0k/RnmyS85hCxEom0bK/+ByEj2lGJ6NCBWpJne/QObS5o9OT2wYcojKo+qtRJ6kG6zN9kKR0tVXj9oAnZAReYkjuTN6TgT9pRnmMj3KtlALYNYgTF1o9dCY20qJk/vwvQLznlhaQmlw9GYdvgo3aJ37UbcEAD0bCcaXOGHFZjVN/MEJpew7r0J/T9gvnVuXh47gGW1QiZfha03X9keX1AsLl542KP1OBDdJkafYm5zxAv8O05AXAZE43dBQtRLgKPGCAtjetIaYFiUZu9ny4z6ktrRpSkC/9puf1Il6uY8y9J2V0Wv+MWc0AznoVm1C57y6L81h0L8QCsm0Dtw54aHbBvgEcFZv
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB4196.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(346002)(366004)(136003)(39860400002)(396003)(7416002)(38100700002)(478600001)(316002)(6666004)(186003)(5660300002)(8936002)(2616005)(1076003)(83380400001)(41300700001)(2906002)(86362001)(8676002)(66556008)(26005)(6512007)(66946007)(36756003)(66476007)(44832011)(6486002)(4326008)(54906003)(921005)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?YpRafMEOMx4ox9WScDZH+wEyccEDqDgl8V3Tz3aZKz9utEuTSX2vLJfssXSi?=
 =?us-ascii?Q?1DHj5Khbz6EyV/jP6eljNDBj02eVumibpYL4ltwfoKm6uQgq1Fc6xnprV4Wp?=
 =?us-ascii?Q?X4dO09AKbTt3E2zi/UuSUkYFr+kd8i4sdb0wvlyZvCguj/umB7SffH7lSJFW?=
 =?us-ascii?Q?WqWv/duLE6B247Exiksu5EKL7zYbaGH6myx6iCnjJ7Rpv0jBRQLwP3t2/ogb?=
 =?us-ascii?Q?rUJKfAnwnatuS4BEvpDp2LGKn2UHSFgSUWG8AsYB34pX3ut4V1in3EWHBKH1?=
 =?us-ascii?Q?LTJhSPddDvKGCkWB7C4D75jYznXnMhnlXGkh/p8XlrVJ9ygLsohSOpdNOkT9?=
 =?us-ascii?Q?d5Iy26GCFwMXgn+VN7tK36MNIMUXwn0hYZw0V4E6pcAppFHxwO78IRb+hP0J?=
 =?us-ascii?Q?8BBC24zv869kfO7XrjoLLKN6F+9L1I2QMYKWJN+Z2Uh43crJx8rnKzErr8Ua?=
 =?us-ascii?Q?7RpKmo5sOT6fZKiJpBPg31flX8btRfBPIdjBhmoWZZl9PDqLOJgxu/afwNHr?=
 =?us-ascii?Q?dUNLJGUHpyR3fK2mLotiEl91e/QWZWEpi30YzDqVT5Ye9/w1P4ocU77nLnOx?=
 =?us-ascii?Q?9p7Xb0LkHq+zaxbgvQ7RMOTwsm8pFcV203n3WOJG1nx42wpKd4yUEgajjGrg?=
 =?us-ascii?Q?FXysMCpcNiIr9js9ujstfiliCVg8/GimToczuZXusL5IzMvVwMkCtU9HBMjz?=
 =?us-ascii?Q?TRML2HODWuKrUb3ceoS1M2gmuGEIP653xnpXmtA+eNiW4tWhT81nLfcJvncg?=
 =?us-ascii?Q?7Qe0X5XLb74KBD1qs0C/vkTP0+nIsTbctblo8umJdEeJV7h/M3w3zgD+v2vU?=
 =?us-ascii?Q?GwDoBBO40zfmrwtcQpreDTws1Xg/A3of1Z9GaO7XbSq1rFxAqNLMKteTPn2u?=
 =?us-ascii?Q?oBiBEyyHetmJkepaBwZI5uAwLCfUPSq0kc2YvoXFwYGkovPRCY5Nd7v1jKx+?=
 =?us-ascii?Q?5UwqqKRhWDV/eK2kVv4Zz6kcsWZYqr0UlmjO3N3M1zZdwT2LihPILhf43NIu?=
 =?us-ascii?Q?DAhv3Fno985wHuuqQPhgzDakmvcUhKtgYQ0jl3sNvoLGEzq1H8QtQTn0OiGh?=
 =?us-ascii?Q?dQrWgivFOuO/oNFgD4hsCiNqmfvLI7Dqh57wz12QmtaA+2aCHn/VdBBYzZBt?=
 =?us-ascii?Q?GfI/usWHV6Jt1dmuOT1qgehzE6oKqx98OS/isF09HyHk/lCJdWqVaHGnuN7r?=
 =?us-ascii?Q?X050E7P3HTrzyfX+/b1vAfwBGWpRhsm7lQPKl5KuHfsS0fFvsFtuPu9f9xYb?=
 =?us-ascii?Q?d2kb6Oim7q9UINqWRvQl68Ykab/N2/HJbuDyYs1kIwoOeOt2F4XOm1LpuQTe?=
 =?us-ascii?Q?VjnYW8DBhZcNMS2wvYO9ebTLXAeOA6kF9lctG6NoHDJrnbZ2Wi0MC+AwDAqd?=
 =?us-ascii?Q?x+5VGSoi0CYN9HKSMaVCZ5+irvcBMJOCXIpehpvcytPu78UXWflYv4Y2fKq/?=
 =?us-ascii?Q?u0GAo2fOCvn3UCuBQxtc+pKa+kHyjZ+xAU0cGmpDeGSGDqfkjHJKKt6WhbDO?=
 =?us-ascii?Q?rMUI+snw+4YA8Uta+JEbTOe39Cc+rrvwEnRauXBjcecOJmMqg4qETXpKO7gh?=
 =?us-ascii?Q?riRpriZUVg0YUmSCCLGj0Ulevun04dUodI4UmMRBfvVr5yNI/WBgkF4ijq5D?=
 =?us-ascii?Q?ncUQafahqdH0yxzcMu/1Z+q+pjK9S6w26sN4wnNjGk2YyQ0FsLg96IQ0Tp2z?=
 =?us-ascii?Q?K4T8tFomoe7h5UgbgamELZxTVBQHOc0906hYNwvc+9D+fP2sTaUK3sCKM6wA?=
 =?us-ascii?Q?Z9KpJd9PM73ptIp++7cKoMY7wkCOdWc=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74ce3319-f277-4cbc-519a-08da53e1aa55
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB4196.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2022 23:56:31.8228
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TnenMtLhFQvsRoyj6PsZOaQIIGuSvM2sH/xaUCUggf0nmQqCY9FAwxv5gbk+17LNAtAqWRxWDbkM+dTXUo++7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1501
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517,18.0.883
 definitions=2022-06-21_10:2022-06-21,2022-06-21 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 phishscore=0
 mlxlogscore=999 mlxscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206210105
X-Proofpoint-ORIG-GUID: wYEz4IocbbzavqKo51z_zKs0l33aQYzr
X-Proofpoint-GUID: wYEz4IocbbzavqKo51z_zKs0l33aQYzr
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
Cc: Mina Almasry <almasrymina@google.com>, James Houghton <jthoughton@google.com>, kernel test robot <lkp@intel.com>, will@kernel.org, Anshuman Khandual <anshuman.khandual@arm.com>, catalin.marinas@arm.com, Paul Walmsley <paul.walmsley@sifive.com>, Peter Xu <peterx@redhat.com>, Michal Hocko <mhocko@suse.com>, "Aneesh Kumar K . V" <aneesh.kumar@linux.vnet.ibm.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Muchun Song <songmuchun@bytedance.com>, Rolf Eike Beer <eike-kernel@sf-tec.de>, Christian Borntraeger <borntraeger@linux.ibm.com>, Naoya Horiguchi <naoya.horiguchi@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, Mike Kravetz <mike.kravetz@oracle.com>
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
Acked-by: Muchun Song <songmuchun@bytedance.com>
Reported-by: kernel test robot <lkp@intel.com>
---
 include/linux/hugetlb.h |  1 +
 mm/hugetlb.c            | 56 +++++++++++++++++++++++++++++++++++++----
 2 files changed, 52 insertions(+), 5 deletions(-)

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
index 98492733cc64..0e4877cea62e 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -4736,6 +4736,7 @@ int copy_hugetlb_page_range(struct mm_struct *dst, struct mm_struct *src,
 	unsigned long npages = pages_per_huge_page(h);
 	struct address_space *mapping = src_vma->vm_file->f_mapping;
 	struct mmu_notifier_range range;
+	unsigned long last_addr_mask;
 	int ret = 0;
 
 	if (cow) {
@@ -4755,11 +4756,14 @@ int copy_hugetlb_page_range(struct mm_struct *dst, struct mm_struct *src,
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
@@ -4776,8 +4780,10 @@ int copy_hugetlb_page_range(struct mm_struct *dst, struct mm_struct *src,
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
@@ -4938,6 +4944,7 @@ int move_hugetlb_page_tables(struct vm_area_struct *vma,
 	unsigned long sz = huge_page_size(h);
 	struct mm_struct *mm = vma->vm_mm;
 	unsigned long old_end = old_addr + len;
+	unsigned long last_addr_mask;
 	unsigned long old_addr_copy;
 	pte_t *src_pte, *dst_pte;
 	struct mmu_notifier_range range;
@@ -4953,12 +4960,16 @@ int move_hugetlb_page_tables(struct vm_area_struct *vma,
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
 
@@ -5003,6 +5014,7 @@ static void __unmap_hugepage_range(struct mmu_gather *tlb, struct vm_area_struct
 	struct hstate *h = hstate_vma(vma);
 	unsigned long sz = huge_page_size(h);
 	struct mmu_notifier_range range;
+	unsigned long last_addr_mask;
 	bool force_flush = false;
 
 	WARN_ON(!is_vm_hugetlb_page(vma));
@@ -5023,11 +5035,14 @@ static void __unmap_hugepage_range(struct mmu_gather *tlb, struct vm_area_struct
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
@@ -6301,6 +6316,7 @@ unsigned long hugetlb_change_protection(struct vm_area_struct *vma,
 	unsigned long pages = 0, psize = huge_page_size(h);
 	bool shared_pmd = false;
 	struct mmu_notifier_range range;
+	unsigned long last_addr_mask;
 	bool uffd_wp = cp_flags & MM_CP_UFFD_WP;
 	bool uffd_wp_resolve = cp_flags & MM_CP_UFFD_WP_RESOLVE;
 
@@ -6317,12 +6333,15 @@ unsigned long hugetlb_change_protection(struct vm_area_struct *vma,
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
@@ -6873,6 +6892,33 @@ pte_t *huge_pte_offset(struct mm_struct *mm,
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
+	if (hp_size == PUD_SIZE)
+		return P4D_SIZE - PUD_SIZE;
+	else if (hp_size == PMD_SIZE)
+		return PUD_SIZE - PMD_SIZE;
+	else
+		return 0UL;
+}
+
+#else
+
+/* See description above.  Architectures can provide their own version. */
+__weak unsigned long hugetlb_mask_last_page(struct hstate *h)
+{
+	return 0UL;
+}
+
 #endif /* CONFIG_ARCH_WANT_GENERAL_HUGETLB */
 
 /*
-- 
2.35.3

