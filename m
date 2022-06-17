Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A8A54FC12
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jun 2022 19:18:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LPm3f2PLhz3cdg
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Jun 2022 03:18:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=erbMHGgM;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=xaL693lu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=mike.kravetz@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=erbMHGgM;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=xaL693lu;
	dkim-atps=neutral
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LPm2s1HGwz2ywc
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Jun 2022 03:18:09 +1000 (AEST)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25HGWinn029748;
	Fri, 17 Jun 2022 17:17:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=XVxRJ82XOdiVvEZ5MmBaX15OTgwoVpsK4b43iaGl2iU=;
 b=erbMHGgMHu4MLzSrHIr5eS3s2PY6lYtzK/U2bv0hdfvhpjg3iM8kQlcDzUO85QQBeIwX
 /uhYeG03/pEvIVX0aQGWBXpJJJI5XLruCK/XbCv+WJelVnsQVmO4c4l1Pf5SweuPxgRI
 0mSr297fIS9kKQtf9TYLOsNO8RzJmQiW2sL0uSgXennu1KLIfzkNY/sc+E7pCJJFFDat
 edoWjnNnPidPAfXwcCy2jtFhLoxKPWMVIy4z5RYWka7tjkl7kv/8WICl/b445LPtOgab
 SP7p5TQVb3eSFO5OL9VcvWKRqQ9zGtYKyDrz+YrBwUwKu2fb39a6zUWodnVOMo/H7TEv Jg== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gmjx9p2ub-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 Jun 2022 17:17:40 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 25HHGKKT032158;
	Fri, 17 Jun 2022 17:17:38 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2043.outbound.protection.outlook.com [104.47.74.43])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id 3gpr2cpteg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 Jun 2022 17:17:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OpR2/gB1Mh6VN7vRuTyiYSWFgEfl4rkpmULEkaZh0HG6oY1qqAP6f5Z5q2GZwiyfRiVN2sUmNpTvJdv3ETIC8WpRJSJWQv30ic+eVvQCRxXEdoa7zZ21y1w5QBX5VimiVxPzu+3/11erB4Krbd/+axXUH7SU9KMe24lpIhosRM87ZRIBxWC8uDVKBbayi8fWYMnKAXiOm5RqEPEMXqCZEYgrkD3YoM/4i+5fWrh/TSJoFdR6TSLumdBpi6233Pn9sJt6pxSv6VhDLIW9R2c3abi7OoVaMc5bwVX3kZ0LHAl8MXmN6WYBzx+ZnLzmMNBEyy4B52ffGgFZ0yUeJqsdBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XVxRJ82XOdiVvEZ5MmBaX15OTgwoVpsK4b43iaGl2iU=;
 b=J8TKODixMEyA833zryP+b1SnEmAF9N33Jpc2eCwsFa48RAs5/QLIeTymedcNRLNx4R4ZBex40A4z5+KJO0CO6oCy5I/RTyQ342g1jDeCkPeSlpRKXBzuvow7KzcggLjkPJNPf6E19MtJ5KuHT1aSdulqhyib3lZJjimFEc3YmbawYk2Pb1vWCP0I1joyqPrHjLc5N+PoHe9xVgermW1fhOz+qsf39He60O7O+Y6CXOztbyPKCre9qqgyrjOPW35bvILEaCGNztpjwtjai93OaEoHGe4IyonNPztVWRX6WOa4jWHVu4qTx89SvaN8+yKnh8ebDxvX9PhIebcN1GUrpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XVxRJ82XOdiVvEZ5MmBaX15OTgwoVpsK4b43iaGl2iU=;
 b=xaL693luW/GvPsWyHdWSSXohBxpL3/iI7jzjp36JKtA2bOmI3jFmtoO9KgPl54l5dUL1S2EMroJ9LA6BpkbYKAgGD5Fir3+PWA9WkpJZEdCR5QE/rRXutjjjjEcC1ZQC5VQIxtuA/t93fvZ0go0KTvUjmigt5h53DDeIRGb11VU=
Received: from BY5PR10MB4196.namprd10.prod.outlook.com (2603:10b6:a03:20d::23)
 by BLAPR10MB5012.namprd10.prod.outlook.com (2603:10b6:208:334::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14; Fri, 17 Jun
 2022 17:17:37 +0000
Received: from BY5PR10MB4196.namprd10.prod.outlook.com
 ([fe80::2125:9bb7:bfeb:81f9]) by BY5PR10MB4196.namprd10.prod.outlook.com
 ([fe80::2125:9bb7:bfeb:81f9%8]) with mapi id 15.20.5353.018; Fri, 17 Jun 2022
 17:17:37 +0000
Date: Fri, 17 Jun 2022 10:17:33 -0700
From: Mike Kravetz <mike.kravetz@oracle.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 1/4] hugetlb: skip to end of PT page mapping when pte not
 present
Message-ID: <Yqy3LZUOdH5GsZ9j@monkey>
References: <20220616210518.125287-1-mike.kravetz@oracle.com>
 <20220616210518.125287-2-mike.kravetz@oracle.com>
 <YqyMhmAjrQ4C+EyA@xz-m1.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YqyMhmAjrQ4C+EyA@xz-m1.local>
X-ClientProxiedBy: MW4PR04CA0082.namprd04.prod.outlook.com
 (2603:10b6:303:6b::27) To BY5PR10MB4196.namprd10.prod.outlook.com
 (2603:10b6:a03:20d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3dacc1e4-0ed1-4ca2-02f3-08da50854606
X-MS-TrafficTypeDiagnostic: BLAPR10MB5012:EE_
X-Microsoft-Antispam-PRVS: 	<BLAPR10MB5012A11E34A9157ECF90ADCFE2AF9@BLAPR10MB5012.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	jcLPFV1FtNB23jOGZ0740jO+7EFR50PVZC27yaSXTR4bxE363gZOnwuusMxGwQJ8zFeoURAJhWSKTSEqEKQ7tonQFKUi8qPW+JvBfvOthcVFGHX5EyVPZGzW+oah92S4fEzDIwt7NS0gQ6Ix+suYwHRoBqYRaSJXTkH0z+kzphvnNM/8B6tNAJ04sxYJ1r/ZdXgyxr/3u9lZm/knAI8FvWFwJqydfB+fpKGY+o9wA1Ilgbx985Ajq++lAsXUXrtO5+WatdctJ3d+MatsWEy2mucfmG3FKFRCycllw648CpBvGimibkV2XnKc/fKxCpgc16kE23Xs4Ga5yXoD8DqiOoc8KPK6u84NE3u4ihLn/CgrAjrQxuBAgLFvaRw6Xv+eLeqOKlR3/vRPROAeI1anoZz1Ha+WUqIM01brCx/6Y7NC7QR1AhSlkMZ9bNn0+zfT3AC96sh0wpa8IiCvJ5mOT40R+qxjCqCpODGjMYRALx05UI04Rj8mqDQgHO5EN5OythCr6cKmvXKJHzPSNikkwpI8Ch2URZ3mP/5sOId3B9BKXC/QBb6ffwb0KkodkEMGh/9Kpargw5mTbqpr80j66kTgExYuXiXSLDjzjaxI0gDXMHtCG48S7V6bP343F442OoV/0G8bIKIyjZdYbOTgRw==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB4196.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(366004)(26005)(86362001)(186003)(66476007)(53546011)(9686003)(6512007)(6666004)(6506007)(83380400001)(8936002)(4326008)(5660300002)(7416002)(8676002)(44832011)(6916009)(33716001)(2906002)(316002)(6486002)(54906003)(66556008)(498600001)(38100700002)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?+tvRui2vNiOMtw+P00Edn4f+yIuGOMup7XN4vAVmNRKf4MM22b8vXphCyC+Q?=
 =?us-ascii?Q?sW3ih+vb8hxZn5+RNXKGXtYyTjaMHbii1TVGrfT8Z6w2mr4QMIBoLjkWRy4p?=
 =?us-ascii?Q?Iil3licJOr2VSwXUJ8ZGtv3edHcb9uY1OR5vSIWR6NBixzckozqbiPdFVZbX?=
 =?us-ascii?Q?uzsSBSWsgghDaO8J8C6BhOzneyZZCd0n2kDyVw9cdabT9GVAmrTxMbjy1f+h?=
 =?us-ascii?Q?g9+Ct9oxo8i7oGtS7A7GG5VxJxQBi+JF5hTLKiHEh43apv+NnVVDbQ17Btoj?=
 =?us-ascii?Q?+wjVROi0f01oxxYxlDQN9Yqs7Sw2zCb6zgMMTzlIKyuOh2knDop9Gyns8wgw?=
 =?us-ascii?Q?8Z/xBGk13GEJiaIdytoxSnaFQlIG1wPCpp5NN6AnQ6P5bJV5iE9H44jY+4jL?=
 =?us-ascii?Q?Jl7yV9GkVdZBvgpx4Oud7yJZrttgN5uBZmA1Zd6S5mfx0bZLzEPkxn4BvOCx?=
 =?us-ascii?Q?VFwb/Mp2gzO1T2ZqOGXqo0r8I+3Dtd4OlhMu1BVf49C2ff8WlG2/MFOpKsWo?=
 =?us-ascii?Q?3awwdS3OffAY1JPpeg+pa7aqQViu0eEIAw6Zyngr8bJIIF7Eybo2nkP2IENo?=
 =?us-ascii?Q?fkQinOs5Ciqolxjb+tJaTc3bWLwu0PXJjf3YKInNONciUCNpI8r2XwT2DIkS?=
 =?us-ascii?Q?3WvyZbyI2SQhB+rLpWD8F0UfGmp72wapyBj0LUWkEqfnAVr/PstQe/uO9Lp4?=
 =?us-ascii?Q?jsxO6r3aieJx9+z2QLeBkCJ99HyaDukybPxjgNHAfgm81mcC/2XEWXHD+wHi?=
 =?us-ascii?Q?Wvp7X5CyCJEa0tEJgtdMjJ0LIkLZ0GAy5lnA4rIjHNg/f/HsCwuzz7PkE3xy?=
 =?us-ascii?Q?NjLsAPcJEXYlJnsO3W3jqyIaP9KkniOQkY/7VtWGZCynvBtBTHsQM3Syx91f?=
 =?us-ascii?Q?EDPGAsQL7a5AoymC1ji8884vBL44xK3vqcTleeCdNiskMn/v1KFqtUIva+Fs?=
 =?us-ascii?Q?RyS582p2Jlrgg/PLXeFIcBzVZM400TyJpPvmnyEMNvnkMVc8gPWB1trLAgqu?=
 =?us-ascii?Q?fOZhJXPhq1A1rdTtsH3u88ldc1OvXQH5/EP3NS/A52eElxcbzXDdeGshdG4l?=
 =?us-ascii?Q?zGTPcUsObtqEphN6EvUVcXEyZo1jrpNW2B60piG+TlKYNDzXeRKLACCvVZ0g?=
 =?us-ascii?Q?5gs7Ng7FLX2J2ltHDsYkuRaxXxP3UfxGSv/WWdOJcvxQKfN6tHMfOJa71b54?=
 =?us-ascii?Q?KcduWWwBfzBnmTDxUaXr6c/E4CAUEYffNpyxLbojeYEd9YtpFVUKx9zSqV79?=
 =?us-ascii?Q?227AopB2zSOoRNdx2O9oF6nMZsZOw24bPKc/H9YvGqba6pCgugVu8abSmW7E?=
 =?us-ascii?Q?oiKNPDfOolmBw9LF1pWL7XSAXL9inbnc4sva6+QOz7xohsOqpeGpf7uMA7T9?=
 =?us-ascii?Q?jbY5SvA/TxMQExxYQjFfPK8LLLfTOSOFnPffb0rCTNIARfPzvJHhJFLYwd8K?=
 =?us-ascii?Q?fCJsv1gqkAB2ij62f43bMKo7yW0SUKNSH/3a4lOfHPVpRkTEUJKf/2LhZNF5?=
 =?us-ascii?Q?PwF/VQZTjgTf98a73/PcRXNuDCXVw9FnaJzvhzuoNH8aA+nQ120ACKitZaO8?=
 =?us-ascii?Q?QwD8kAr4jLfFMIGsQ5yQnzhcYObeOvMvIw5xg7qDtDv3OkxifQzrD5xAKVRG?=
 =?us-ascii?Q?PgcOLBmFBHXtDE/zNw10rJwDDByC8QSVSXHINsjqF9MYMJWE9hyIF9Y5csNv?=
 =?us-ascii?Q?CJnvJBo1dm5k/CWo8fgrBD4B4KOmf7qlJc9WZc9gU8c2iHeZaOhWrGJiqI2e?=
 =?us-ascii?Q?z26suodgD1K26aBOkCWIeaZkrRNc5wg=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dacc1e4-0ed1-4ca2-02f3-08da50854606
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB4196.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2022 17:17:37.0442
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X285A3sLaVaQNxmu35wmdKJE6RBz0Px8kdetktLLkTHYR3sT78wE5yum6nfkaVLyfT5OOxCRlReN74j1jxs48A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5012
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517,18.0.883
 definitions=2022-06-17_10:2022-06-17,2022-06-17 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 adultscore=0
 mlxlogscore=930 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206170076
X-Proofpoint-ORIG-GUID: uFxYy3K3aj7qt2ddKTp7DefyBONlS15e
X-Proofpoint-GUID: uFxYy3K3aj7qt2ddKTp7DefyBONlS15e
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
Cc: Michal Hocko <mhocko@suse.com>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, catalin.marinas@arm.com, Muchun Song <songmuchun@bytedance.com>, linux-mips@vger.kernel.org, linux-mm@kvack.org, James Houghton <jthoughton@google.com>, sparclinux@vger.kernel.org, will@kernel.org, Mina Almasry <almasrymina@google.com>, linux-s390@vger.kernel.org, Christian Borntraeger <borntraeger@linux.ibm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Paul Walmsley <paul.walmsley@sifive.com>, Naoya Horiguchi <naoya.horiguchi@linux.dev>, linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, "Aneesh Kumar K . V" <aneesh.kumar@linux.vnet.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 06/17/22 10:15, Peter Xu wrote:
> Hi, Mike,
> 
> On Thu, Jun 16, 2022 at 02:05:15PM -0700, Mike Kravetz wrote:
> > @@ -6877,6 +6896,39 @@ pte_t *huge_pte_offset(struct mm_struct *mm,
> >  	return (pte_t *)pmd;
> >  }
> >  
> > +/*
> > + * Return a mask that can be used to update an address to the last huge
> > + * page in a page table page mapping size.  Used to skip non-present
> > + * page table entries when linearly scanning address ranges.  Architectures
> > + * with unique huge page to page table relationships can define their own
> > + * version of this routine.
> > + */
> > +unsigned long hugetlb_mask_last_page(struct hstate *h)
> > +{
> > +	unsigned long hp_size = huge_page_size(h);
> > +
> > +	switch (hp_size) {
> > +	case P4D_SIZE:
> > +		return PGDIR_SIZE - P4D_SIZE;
> > +	case PUD_SIZE:
> > +		return P4D_SIZE - PUD_SIZE;
> > +	case PMD_SIZE:
> > +		return PUD_SIZE - PMD_SIZE;
> > +	default:
> 
> Should we add a WARN_ON_ONCE() if it should never trigger?
> 

Sure.  I will add this.

> > +		break; /* Should never happen */
> > +	}
> > +
> > +	return ~(0UL);
> > +}
> > +
> > +#else
> > +
> > +/* See description above.  Architectures can provide their own version. */
> > +__weak unsigned long hugetlb_mask_last_page(struct hstate *h)
> > +{
> > +	return ~(0UL);
> 
> I'm wondering whether it's better to return 0 rather than ~0 by default.
> Could an arch with !CONFIG_ARCH_WANT_GENERAL_HUGETLB wrongly skip some
> valid address ranges with ~0, or perhaps I misread?

Thank you, thank you, thank you Peter!

Yes, the 'default' return for hugetlb_mask_last_page() should be 0.  If
there is no 'optimization', we do not want to modify the address so we
want to OR with 0 not ~0.  My bad, I must have been thinking AND instead
of OR.

I will change here as well as in Baolin's patch.
-- 
Mike Kravetz
