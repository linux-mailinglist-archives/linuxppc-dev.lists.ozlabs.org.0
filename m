Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3770860ED0B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Oct 2022 02:35:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MyRY311KJz3cFC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Oct 2022 11:35:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=LRx8825p;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=HJNcM3Vj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=mike.kravetz@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=LRx8825p;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=HJNcM3Vj;
	dkim-atps=neutral
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MyRX20dZBz2ywV
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Oct 2022 11:34:38 +1100 (AEDT)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29QMW9sn000954;
	Thu, 27 Oct 2022 00:34:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2022-7-12;
 bh=7CqWoGNPislws48PL2HBt8w5ENHgGzFukTXAc3siTu0=;
 b=LRx8825pLglYM6HOUsvmuQ20uJR6KadGUQ/zZSJ1NVt5rOTvIDHBemysYKFOC41ky4wM
 MW+b35b0VLxOQVXW1Nd8nENJ+N8coLx+LUK2nzibEWHe9QaxPpt2Bx/o+3dU4SQiNc2h
 mQObF9PjAtB9+qm7LdKDpJbJR2tf5gE3vrt03dRhpWn33/lDzjlxGWIiUm4dVzmaqode
 ta+4hFhY+P7d8D9ibU60Yr/CNQo2vnI6snRCxy+Q4tcvPwCeaByyk4qSUoT/63jvhj00
 PvdbGdiqJh7Wu6MsUdT4ZNm53k2puDdQz8QFmPC31RqykwVRRFKsCB1oz87sj3EXUNjN 4w== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3kfax7rk20-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 27 Oct 2022 00:34:15 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 29QMBECB006561;
	Thu, 27 Oct 2022 00:34:14 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2108.outbound.protection.outlook.com [104.47.70.108])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3kfaggex0v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 27 Oct 2022 00:34:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k12z/nWn846KEe98FUo0UZwRm5TJlPgbG38qkCVswVY33SGO+uHN5zeA0cucrFlcXjYgLn5ToUPJK7/wzuIbW/4q1pPIJcvEalZYKQIyV1w/qOw/JltxgaN7xsH0aMPv1oNwef+fA7BhP9fC8Mj+m3eI+TXEWnhsQGtMeBJ1EBYa6y5v1/m1FMPdFf7xXBY8nehkzTGsKl7ccAoSqlW2GbA5R/9Iq2xvLCoO2sJLhmyrRT6T66hZb86z9xG35WPDLR6WyRuabiAwPAwPrLE51rLP8a52ADI4FIMXfbFq7IWixfqw6MnujEp7I0YwZE0qt8hJ5wo+gxyKba3K6qvKkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7CqWoGNPislws48PL2HBt8w5ENHgGzFukTXAc3siTu0=;
 b=aoLf12g4Bm07zMjZkIRbZx4+GGeVHJi1iTAn02jkaY6bgIOS5/TvPu4gg/FWKnwGIGJLmuanB+/j/jKNuW1/zPRKcfetoSDAZAJH/3lY0a0kHBNo2bTwBK1thIbyK4bB3FTBQOBW4EfdNaWAoZtNaqdTXrTrtg3pDcABX3cciRLY2bxKrYqi2RUTP2r3jBlXgMVQBMRw+LhVSJGA4GLhO7YIGqbhD7m/aYnyV2CYYU1wVz3Tr+b2LxZ8IvzaZn5kEHkbUPJfog+aKLosVB/Y8JF6HbqMPoY6CLWoF1fSZtH5fNjUIbivj6Kczx4QeY4hKZB2aLLQUm+BVVxkldXybg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7CqWoGNPislws48PL2HBt8w5ENHgGzFukTXAc3siTu0=;
 b=HJNcM3VjGGKqa1Y/CsJyytxfOVEei4yG2CUAxvE3x1urBhY+xVdLThYWDxQsIN9p9UXzNfx7S/IMeduxpBGI6TLoDdwbXpfuTsFp2bkXJjsygTpd3YUPLEUo+n9l3f+oSIeGxIj3rPu1HVx5XAERMYz8z6hNGUlZkzT3x13gzvc=
Received: from BY5PR10MB4196.namprd10.prod.outlook.com (2603:10b6:a03:20d::23)
 by BY5PR10MB4116.namprd10.prod.outlook.com (2603:10b6:a03:203::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.26; Thu, 27 Oct
 2022 00:34:09 +0000
Received: from BY5PR10MB4196.namprd10.prod.outlook.com
 ([fe80::58e9:95ba:d31e:ddd3]) by BY5PR10MB4196.namprd10.prod.outlook.com
 ([fe80::58e9:95ba:d31e:ddd3%5]) with mapi id 15.20.5746.028; Thu, 27 Oct 2022
 00:34:09 +0000
Date: Wed, 26 Oct 2022 17:34:04 -0700
From: Mike Kravetz <mike.kravetz@oracle.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v3] hugetlb: simplify hugetlb handling in follow_page_mask
Message-ID: <Y1nR/KToV44GKZ5G@monkey>
References: <20220919021348.22151-1-mike.kravetz@oracle.com>
 <Y1mtz7dFAlhGRsAd@x1n>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y1mtz7dFAlhGRsAd@x1n>
X-ClientProxiedBy: MW4PR04CA0357.namprd04.prod.outlook.com
 (2603:10b6:303:8a::32) To BY5PR10MB4196.namprd10.prod.outlook.com
 (2603:10b6:a03:20d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR10MB4196:EE_|BY5PR10MB4116:EE_
X-MS-Office365-Filtering-Correlation-Id: 832c52ac-7592-4121-1cbd-08dab7b2f670
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	+5lukjWAtfwuR8CW5OK6RhGzouwswCtewlDDpOcEvgs4qVIUS0cSfxWHuzhOX00DRtdqei+5PFotrYNzRHXYrNBXXhcGDxXi2oJwpi4o4bCFXxSycSmph9upG12NITRaLWe2NLe2oaSU4HUzFxBXsNDYn9ubOtoxM4AQwcGLI67E02VkMLKgck6SZswykizUvOGwO1PYBdOuAsmddzqGUXkz7gPJzjISQTtIsFcAaztKoRemTnIyjYwgu/EFI94tzsbRyWpZz4IinGSwH6FZC/HVmcIu7BZX8jiw2QX3buvw7aJ9fbpl6wo9IUW5jJ1EG0f/GBZY1stKTkbQhJKWoCgXGcigaLudflj/kPg7D/qWDJ5fgvIa21GERPRCoN3I3FWgasZ3vOG6WwzQYSZw2hGJVq650IBPS3rQJHoLBk1W4X9PCSZ5SpvMw0NqF5qAqmAZSLBPwLKxVxOb8KFQ9VT2Vjj3TpClPyHeLIz+gyQki6APA7jAKZOC5kBUynTJe61QuxJj9m/TQD3c6WB6RUlfolFBC+oesS/MB9pw24RJGPVdMSk4y5kM9POvy1M0Q/C+s1z9EZdGPYN7g87/mIVTZ8GeuVol7vv4KkKTdX9N5zomkDJIXwtAWo9x6oKgjwn5zKleWZyTL2k6gcibXHqEMUGpqpT0xBP/4AuGJEFuLm3Ego50r7KnKZgC4tQIFF3fLbepbOgq7LkxXVqjOw==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB4196.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(366004)(346002)(136003)(396003)(376002)(39860400002)(451199015)(186003)(66476007)(5660300002)(44832011)(66946007)(7416002)(8936002)(66556008)(83380400001)(38100700002)(86362001)(6916009)(54906003)(6486002)(26005)(6512007)(9686003)(478600001)(316002)(8676002)(4326008)(6506007)(33716001)(6666004)(53546011)(41300700001)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?p8xszGyeESy7Ky18c5HASNoJiVm0Pb0REteQ51wudBZb+FRAf7T0bbBRcjAu?=
 =?us-ascii?Q?7G5PouugtGjfs82GdFEhsY3B6Ot642AwCO6wLiE6m6YvxZS/3g4ng398xczf?=
 =?us-ascii?Q?AV/HA4gstBuVwzUK1RwoxrXw6fhi4LV0Deu0NDT08xoyhT8uMyfH7zZe2Kmf?=
 =?us-ascii?Q?TWwlataIg+Bxu0gToNv801wd2C7TcXCpYIEi6XS6navAkR1nhk20yY7wPRQ8?=
 =?us-ascii?Q?zjVOO34vBIEuoGJwDs/qEO8NSJi74isIQjh7XqQFx9XMisiyPZ9n9vPLpSs4?=
 =?us-ascii?Q?C0+SASXLV+i1857X7kPjf0NiW6mUMmHC1yy3heEX4SaGaQZ4u1TLzPkSdxoD?=
 =?us-ascii?Q?EPGJv0v2kIaG8yeR1gHRsqa8uieNUy0GtOV/yuq6w9KALbDREbjpzx6vWYC5?=
 =?us-ascii?Q?HDu/VhhmxoJldHKPYaRstFUE7/t/2ipyQNrJqzmmXFfa6FC65PfGjl+00qVT?=
 =?us-ascii?Q?pWCJxfs01FYx05cViJIA6xfnUYmULIqMMF6yZgEh4G8XfOeQU/GnULDaa+Z+?=
 =?us-ascii?Q?/0iPG/cyMuHoRwHIi9UAdMVqH3mQHH4/cZ2Re2XvVSn/w8tdQjGyP5FpGkXG?=
 =?us-ascii?Q?4jqkzi3SEeKFJLDsQ5ZORxypR6Lah5nqLBHe+qJNEBOGfbfVW3ERrjFsVuN1?=
 =?us-ascii?Q?qWQYLHUs57u2qEuQ5LVGdD97vgcwed5asFw2NnolCibs9JMt81gq4MxyjofF?=
 =?us-ascii?Q?F12aZTP//CmjPt4XVo0+hlVUa1simY41lAPKAnPg5vsW9sfTYfZDVm4GsGca?=
 =?us-ascii?Q?nopkE7VrDwzdkNPac7yGLpJ/LaSEFhszHcCvIP+mg6kkt/50bKdJnbOJmLVf?=
 =?us-ascii?Q?SDtt66aFSIB1nBpjGmrmIc2as0CDzRTxmlQPQGqmJGmpT7mldvAtrCLywz5W?=
 =?us-ascii?Q?VS7sbBvULgATCZajvPoa9+CdRmpMI7HVq64FuovG1BFoUJOkZa0R0hjR7O0I?=
 =?us-ascii?Q?jqdVNIpHI6XdhTsyQ52aMwMoHWJ9GeUAsm1HDuuTwjO0J+yn2gKVbBS4U0sS?=
 =?us-ascii?Q?/vY3xzpyrlfE3KtjALXSezEsIy8BkCVXG6wyyk9Gw64zv8c6z5v+hRLjkSGQ?=
 =?us-ascii?Q?gysIMEHjKPOkZpk3pIF7GtXfZ4dbdgBerGa7jFW7pavhpnkrD18L8YkOFwfa?=
 =?us-ascii?Q?E8biWsulbkk+oy7xijHmjXKd1XcpYr/4hNRhX3oaOvFf3cmxL2kWxc/z7vGm?=
 =?us-ascii?Q?q/3ArvxUI459X23Cx/1xbS7oSJm8dkU9UsHHYMe4YiTNHLDa4EenXVkoCuVP?=
 =?us-ascii?Q?9dDwfkCdNyMecUJPaMAoIYRHcYVUdLATazYgYoFrI5Rxibd3fxtxLAChhEKU?=
 =?us-ascii?Q?Lht9uf0A8o1qEzx6zYENftSDhldndWu26N5VOIOANJy3+uRl9EYkVNcqC0kL?=
 =?us-ascii?Q?ge983kjF7DgSbwVtjZBHInSYB6Ja657svC0Mmql16mWg/JZvoMSu+phkT23u?=
 =?us-ascii?Q?VURDf7uBLVVNQhIUxmkfAEMItRwbF7Jj+/W1XRRLHGhE4bB0jnnyPHCG2cAx?=
 =?us-ascii?Q?MNqUMhVgQy4oKxIEbMisOgL3mU7jekPVyyK8SyeI/5hPvb0T6t0sd23DRP0/?=
 =?us-ascii?Q?RL0EsM13SouC4vnZeRd73oDa7lgzssTt9QvgSDuG0o+4A8zfULluQExEFvdS?=
 =?us-ascii?Q?Kw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 832c52ac-7592-4121-1cbd-08dab7b2f670
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB4196.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2022 00:34:09.5450
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YmXoyEbRhaGCFAZOfMbYRA3lfGrdOGfnn75xL367JNk0w8HdqCA3Ls46TLxD2nm4axIEe/+6ac73ICm4XKq7lA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4116
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-26_10,2022-10-26_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0
 suspectscore=0 phishscore=0 adultscore=0 mlxscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2210270001
X-Proofpoint-GUID: fw9fhbyyge4U_DqnXSqatBFQLaU4LiTn
X-Proofpoint-ORIG-GUID: fw9fhbyyge4U_DqnXSqatBFQLaU4LiTn
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

On 10/26/22 17:59, Peter Xu wrote:
> Hi, Mike,
> 
> On Sun, Sep 18, 2022 at 07:13:48PM -0700, Mike Kravetz wrote:
> > +struct page *hugetlb_follow_page_mask(struct vm_area_struct *vma,
> > +				unsigned long address, unsigned int flags)
> > +{
> > +	struct hstate *h = hstate_vma(vma);
> > +	struct mm_struct *mm = vma->vm_mm;
> > +	unsigned long haddr = address & huge_page_mask(h);
> > +	struct page *page = NULL;
> > +	spinlock_t *ptl;
> > +	pte_t *pte, entry;
> > +
> > +	/*
> > +	 * FOLL_PIN is not supported for follow_page(). Ordinary GUP goes via
> > +	 * follow_hugetlb_page().
> > +	 */
> > +	if (WARN_ON_ONCE(flags & FOLL_PIN))
> > +		return NULL;
> > +
> > +retry:
> > +	/*
> > +	 * vma lock prevents racing with another thread doing a pmd unshare.
> > +	 * This keeps pte as returned by huge_pte_offset valid.
> > +	 */
> > +	hugetlb_vma_lock_read(vma);
> 
> I'm not sure whether it's okay to take a rwsem here, as the code can be
> called by e.g. FOLL_NOWAIT?

I think you are right.  This is possible even thought not called this
way today,

> I'm wondering whether it's fine to just drop this anyway, just always walk
> it lockless.  IIUC gup callers should be safe here because the worst case
> is the caller will fetch a wrong page, but then it should be invalidated
> very soon with mmu notifiers.  One thing worth mention is that pmd unshare
> should never free a pgtable page.

You are correct in that pmd unshare will not directly free a pgtable page.
However, I think a 'very worst case' race could be caused by two threads(1,2)
in the same process A, and another process B.  Processes A and B share a PMD.
- Process A thread 1 gets a *ptep via huge_pte_offset and gets scheduled out.
- Process A thread 2 calls mprotect to change protection and unshares
  the PMD shared with process B.
- Process B then unmaps the PMD shared with process A and the PMD page
  gets deleted.
- The *ptep in Process A thread 1 then points into a freed page.
This is VERY unlikely, but I do think it is possible and is the reason I
may be overcautious about protecting against races with pmd unshare.

-- 
Mike Kravetz

> 
> IIUC it's also the same as fast-gup - afaiu we don't take the read vma lock
> in fast-gup too but I also think it's safe.  But I hope I didn't miss
> something.
> 
> -- 
> Peter Xu
> 
