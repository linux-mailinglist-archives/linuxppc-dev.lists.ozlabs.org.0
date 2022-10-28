Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C4A6115D5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Oct 2022 17:29:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MzRKx1cbdz3cLC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Oct 2022 02:29:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=0Oc5Bbxt;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=cVfwdDy9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=mike.kravetz@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=0Oc5Bbxt;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=cVfwdDy9;
	dkim-atps=neutral
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MzRJv5Llvz3bqn
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Oct 2022 02:28:27 +1100 (AEDT)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29SEhbdF031749;
	Fri, 28 Oct 2022 15:28:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2022-7-12;
 bh=MSXlpp0bOMo/Dc/jUAMCmxUl0mcuplH6CrDrHtW6u5c=;
 b=0Oc5BbxtPn2sB7qrv96roab5RL6RuPON+3Lg2Ln45KhhJM/x1u7SgrfyexDLlDVHUY+k
 XfdjkXrVfWNu+3Wi89LqqhTIiT0u0JMTkRmBpwP/ep7DU0g3dYJn3Y/dudxbKe+GFLuy
 KO7QoPUoM9RI7otCqWRw6ZbRbVSKs6g+TXAJ32QwWL4jKq+KQIXgur78zZWJOHk40JF7
 SCXGCKFR6octKAiOL8QlWJrJI3xu7GOkkwUc5vk3W5Frnex03fcavUdhWcA/5i/evPGu
 aXgZgLrR1MxyrWNBYgcsTlQLH0X4HtKlkyFhMwaAvtZudzsiegS5/nFJdNehniyBreo6 Tg== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3kfagv5fjv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 28 Oct 2022 15:28:08 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 29SECVL4011509;
	Fri, 28 Oct 2022 15:28:06 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3kfags6mfn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 28 Oct 2022 15:28:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jaSAtYfh0FqKlSV8lYsKtTfemCqgtflUQIMFhUAXQtuh7LNuuzjH2RTVPLj7Mzj+EnV3KKabWKxD/y6YZZQ4CxH+1uv2u1ySUzzR/LzKx2Lmqtz896qIed3tc9851asNyYdFaeb/ZjSBqI+n/S/hifysIx6354vMTBruw0Ws9/NjuMFtKzKwEJwOstilrBL4G3uwraU9hhhxIvdz62M1G4LJgQE+PF9RgS8wkJxPGD49QUKcJ3g64EluWRa8XP55jzpBagX0lrIOkmFjxOPUJ0hwJb/Zg5+a4lRMse6O82Nd1ahlkfldcTfa6sauyHvrTXmpuwwnv/2ESQDaAxE0uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MSXlpp0bOMo/Dc/jUAMCmxUl0mcuplH6CrDrHtW6u5c=;
 b=DicP9PVB+jwV8FdA9IU5z8lvb/vnqHQf/6NUaWgzxkOSpZ110EdSENEbwJUnKZuWOyeHaiD5Ay61zqlyYbDpC2ijlq8ZeR07fOGnIwwX306UHwkR9Qh++raui/3yMmsKHjCP/HTNEEWjiSNepV5qYXrdnFDDJ9a8uO6z5rzzbYMtf0C+5I9fDiiw1F/XTLINcIiQ/MzkcNaL+FuuygTSEiizDWcGEwvAkSVR7I/1U9aHwh1B7a/9z36tCdpD0uh2WmyGTWAskSgsADPzv1pxQB5iyXt7j8FOpstoEw9rRKMKEnaBsmrH9boSxK6B7ZpLOISq36360sylfOClePX9TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MSXlpp0bOMo/Dc/jUAMCmxUl0mcuplH6CrDrHtW6u5c=;
 b=cVfwdDy9zktf/77vWiKrduGitPR1UQVsTkzeFURMG4eaQYEIZXJ+xSJJvl00qnprWlN2RCWFdbOEa/WsLDfQcmBYCFDCVQ3ET6X96T4E5dynSa5ZBs4GoJdQhR2Nxe0A82h9ohuYFiKiwJRcXPcvMRaOHHg1dqIMPAbXYE2ZpTA=
Received: from BY5PR10MB4196.namprd10.prod.outlook.com (2603:10b6:a03:20d::23)
 by CH0PR10MB5324.namprd10.prod.outlook.com (2603:10b6:610:c3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Fri, 28 Oct
 2022 15:28:05 +0000
Received: from BY5PR10MB4196.namprd10.prod.outlook.com
 ([fe80::58e9:95ba:d31e:ddd3]) by BY5PR10MB4196.namprd10.prod.outlook.com
 ([fe80::58e9:95ba:d31e:ddd3%6]) with mapi id 15.20.5769.015; Fri, 28 Oct 2022
 15:28:04 +0000
Date: Fri, 28 Oct 2022 08:27:57 -0700
From: Mike Kravetz <mike.kravetz@oracle.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v3] hugetlb: simplify hugetlb handling in follow_page_mask
Message-ID: <Y1v0/Y4Xiut2FWx4@monkey>
References: <20220919021348.22151-1-mike.kravetz@oracle.com>
 <Y1mtz7dFAlhGRsAd@x1n>
 <Y1nR/KToV44GKZ5G@monkey>
 <Y1rdVLMDD4PMt3s3@x1n>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y1rdVLMDD4PMt3s3@x1n>
X-ClientProxiedBy: MW4PR03CA0054.namprd03.prod.outlook.com
 (2603:10b6:303:8e::29) To BY5PR10MB4196.namprd10.prod.outlook.com
 (2603:10b6:a03:20d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR10MB4196:EE_|CH0PR10MB5324:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bfdf8f7-6509-492b-af26-08dab8f901cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	Gerd/KVecxZHYhn/1tjrb1urASN7K1MYHO5LCnXHO9XsJzWKNROO4l9s3ns8sA5DjEac/Hd9tCoW4U5PNWckd/wyh4lMGWpttRa59qRuD/K9aO4EqCO1xxP7SIIBylLArORL5P2bINwHrWQOUIWlSwYEw0Bv4h4UZO2yjQSpMgv36nCv5eZVVgXxVOxG8NzZP2tpfoptF8Tzbff7lFJ0ZDPHvdZmh836F5VbM0RSZ4kTFEVxHvVxyY+JgnlaFgkPwSzrG11Z59w5Y5YLMMVEKNd0h5cpeBvQklZju5A+ApCHqe/puvZ7cvkJS4eIaAlhPjybV55N5nd8eKkcPzW6Jti0ysB7WuHfwFt4ue9q7VxtKDtL0y2rc2QJb8LkoODpu34LZUGZ7WgZgF5IxTlAZ+LlZSQr2H7eJrDNDxwaEmzNGjTqyj0q8uUCDNiNdb0CIaxYzPRSvndzTjbZ1yfeFeYiILWZqUSYBySwwvCT943ROg7RclFSrpxFqHQrjYwcqYDRW6esrhch9aHLAVoRK83OpvZxou2D7OvmQ9hBKATUSiAQirIEA1UxSz2bQz/qkJv4X9jxABU7/ePJhYw5M78pDxQcCgfKSZiO76NsD+lscbtnzpLMZ39nr+BeG0y1A6i+jWXgAP7aKfSxoJCclpUoceZt/IQZA8NJXmkDyn/ijnhESuMQPFC5TZmZqevKC+sJFQyLBS/l5SHQ5oicLQ==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB4196.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(396003)(376002)(346002)(136003)(366004)(39860400002)(451199015)(6666004)(7416002)(2906002)(6486002)(5660300002)(44832011)(86362001)(54906003)(6916009)(316002)(83380400001)(8936002)(478600001)(41300700001)(6512007)(6506007)(8676002)(66476007)(33716001)(9686003)(66556008)(4326008)(186003)(66946007)(53546011)(26005)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?RPmxQ/usTKyuBlhmH73ByZJVaBujiH/6LyVtDPUSZrgvwcZVTWQYLxOcsRfW?=
 =?us-ascii?Q?+6z3Lyt0vAfaVQUw6R34X1ImcDonz6dj65XYAceinOYFsmiHNGMiNAMTBw0g?=
 =?us-ascii?Q?O3jYg77g6qACz444voHU0qf6DCbgmm1DfU7OfdEtvTfhvUbhHIYNN+VFuoa6?=
 =?us-ascii?Q?soQVToYqllfqRiQCcOTB51fxqdRKPshBDbtII3TfePXHz4LVRyIoOP8XxKgN?=
 =?us-ascii?Q?igs9vW9FWeVVUh4U8b9wyGANdvfp+xfVgm6W0Z8/TiqiWMpzLuhbG8KzRKuj?=
 =?us-ascii?Q?JWkSXDjLgTBwgTWH9SkocNwKmYQkVgqP/s4g7urBQhD7UX5HnJKLIK+IuSKn?=
 =?us-ascii?Q?rE8ibwHe8kEu16BYMZhMqSq9m9RQbakUcs0ZWRGXQQE1Jo5nCr3Y3ylrxQQ6?=
 =?us-ascii?Q?tfH/o0YjSFzOPYsddcxp5iIxvaud6gfEYeid4+fy4jdySsU5CsK8fFiNpwFR?=
 =?us-ascii?Q?tvVgJNISkmkq9SCYNs/yxzNkeYxTqD1ja9rugX9Y9K0UlGvPAy4TPc30w5S/?=
 =?us-ascii?Q?xscesXGFDCjH98ubj73K8iYvbYKASttv6DaxhStHLKW8h2SvlrezcJ+rSYZM?=
 =?us-ascii?Q?tCQUSFD2np4ozYa3iWSpmWfQpTzfPmjnAHCA5pAGatDpEhVXGfzIhhMzxrd4?=
 =?us-ascii?Q?2LgGkd72Epox4WDUSSK18RFx49bfIRjkafGiiztVsTE1i+OgjRqpLFw91G0H?=
 =?us-ascii?Q?1F/ILI0dFTzGxm9cMsk78IArOnYfBY8T5r3kg5GqbHtnslnI3VE+uV5q2LpR?=
 =?us-ascii?Q?zCYAOrx5tWU+ZhdFnPiKIGtfhisxCtkyxRaenwgxazosZW2wMxXCgfWkF9mZ?=
 =?us-ascii?Q?iZpK/vzoTBwfg9LSgu6yBEY//LMxJt/7JUCoNLaYmvmla8pmFs8TcD4VPu/E?=
 =?us-ascii?Q?aw4+KwWO/kyG8uzt/3zFcf2MLDo4w6ENXXdxJ7c+PMKPM4bT4xYHJuR5c5kC?=
 =?us-ascii?Q?nnS2kGxdiD5IF94Lw7JGphzxtZlSccq5uA1HZrPsu7Igj5e9g3hcU472Pulw?=
 =?us-ascii?Q?Kg2QfkVsBAhrJyeSFNzvHDEHv4f02vkTRKOHdXyc/A5tYo6YsjWZmsNvR2Io?=
 =?us-ascii?Q?4zNh8Sedv8/lh39KAlNL7lgE572aSAzEIIgT6wkXziHVPe5LNH4AQdCIDTbW?=
 =?us-ascii?Q?p9+ehbSbs8JJStIndPdaImAEUBc7mPLJxMMVctzCayvf4kmuCNSY3mJmSNzW?=
 =?us-ascii?Q?zCeGluJRItjgXdg7IHak9RM24ai04AYhB5zT5m7WBhokGCT+R+uiG7/5GdNr?=
 =?us-ascii?Q?oAekhN3EuqcKqzEReTgizZitbq+sXF8sWawdxIrpH3oXjhmV2hBhWHDqvtRB?=
 =?us-ascii?Q?bGz+I28+ohGFg3ncwgP5+qB1NAhwhhSxmz1L73rsHxQXO+iE1EM5fgp5ziW4?=
 =?us-ascii?Q?+hsfBaTmqgkGY3n/t5P63p3HlXrBIaBEyG6uvumxU3Wn0Da2ZVQTjvLol3gZ?=
 =?us-ascii?Q?+GPxj3UBdOBNJkUAlIl25OtzNbgRLSOx4oK01PTf4GMjmUD/7YwfNHgrBMh6?=
 =?us-ascii?Q?Qp4DW1TVhf0NwvXJ1Hu9BPTGJM3gbU+sYeRxKjkWFeYNsjzo5Vx7wC+fcz6q?=
 =?us-ascii?Q?0TYuAVINzu6PaCp5+ds5jHDNQaQQuph2v/4Uo9ehmIhpZOGLCwkPgP4wEz5C?=
 =?us-ascii?Q?vQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bfdf8f7-6509-492b-af26-08dab8f901cb
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB4196.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2022 15:28:04.6276
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DA2mRVd2AQYNKJNtNtw3GTMc5LQjHQl4lT5b5mxW49k0Gpr5TXcDhS2bfiH9kYVNw5/H38Z1CEov97go09wEpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5324
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-28_07,2022-10-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0
 adultscore=0 malwarescore=0 mlxscore=0 suspectscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2210280096
X-Proofpoint-ORIG-GUID: lz7Fk0T9kZnKH7Maqfriu0XZzmUTaI9T
X-Proofpoint-GUID: lz7Fk0T9kZnKH7Maqfriu0XZzmUTaI9T
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
Cc: Naoya Horiguchi <naoya.horiguchi@linux.dev>, linux-ia64@vger.kernel.org, David Hildenbrand <david@redhat.com>, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, Muchun Song <songmuchun@bytedance.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Baolin Wang <baolin.wang@linux.alibaba.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10/27/22 15:34, Peter Xu wrote:
> On Wed, Oct 26, 2022 at 05:34:04PM -0700, Mike Kravetz wrote:
> > On 10/26/22 17:59, Peter Xu wrote:
> 
> If we want to use the vma read lock to protect here as the slow gup path,
> then please check again with below [1] - I think we'll also need to protect
> it with fast-gup (probably with trylock only, because fast-gup cannot
> sleep) or it'll encounter the same race, iiuc.
> 
> Actually, instead of using vma lock, I really think this is another problem
> and needs standalone fixing.  The problem is we allows huge_pte_offset() to
> walk the process pgtable without any protection, while pmd unsharing can
> drop a page anytime.  huge_pte_offset() is always facing use-after-free
> when walking the PUD page.
> 
> We may want RCU lock to protect the pgtable pages from getting away when
> huge_pte_offset() is walking it, it'll be safe then because pgtable pages
> are released in RCU fashion only (e.g. in above example, process [2] will
> munmap() and release the last ref to the "used to be shared" pmd and the
> PUD that maps the shared pmds will be released only after a RCU grace
> period), and afaict that's also what's protecting fast-gup from accessing
> freed pgtable pages.
> 
> If with all huge_pte_offset() callers becoming RCU-safe, then IIUC we can
> drop the vma lock in all GUP code, aka, in hugetlb_follow_page_mask() here,
> because both slow and fast gup should be safe too in the same manner.
> 
> Thanks,
> 
> > > IIUC it's also the same as fast-gup - afaiu we don't take the read vma lock
> > > in fast-gup too but I also think it's safe.  But I hope I didn't miss
> > > something.
> 
> [1]

Thanks Peter!  I think the best thing would be to eliminate the vma_lock
calls in this patch.  The code it is replacing/simplifying does not do any
locking, so no real regression.

I think a scheme like you describe above is going to require some more
thought/work.  It might be better as a follow on patch.
-- 
Mike Kravetz
