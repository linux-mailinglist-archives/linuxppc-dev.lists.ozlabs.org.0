Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DA532021D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Feb 2021 01:09:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dj82D2sWyz3cKx
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Feb 2021 11:09:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2020-01-29 header.b=OUnX7abV;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=F+sfZVS3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=156.151.31.86; helo=userp2130.oracle.com;
 envelope-from=konrad.wilk@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2020-01-29 header.b=OUnX7abV; 
 dkim=pass (1024-bit key;
 unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com
 header.b=F+sfZVS3; dkim-atps=neutral
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dj81d4y9yz30RM
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Feb 2021 11:08:53 +1100 (AEDT)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11JKT68O184358;
 Fri, 19 Feb 2021 20:32:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2020-01-29;
 bh=Q+tlPGJKqF6UYVHJtf4RiU4j3D0HGkZd1GdqLyhGl5k=;
 b=OUnX7abV7Zl+u6KIti9+pbFfcT8EvxiyocwczAX0CXSRN86hcLIM6VwLU3654x/i28Z+
 3pSPYNElBGBgxhm1F+DZ2L2IZNG/+wtb6C89OpKs1ZpYVrw29cpL8uUfqbPfGIAkPMGe
 ahyW6qfPTtx6uDTss0Dc0nPtD8x40Ro+xSRxK1BE2z+fsl6D3kdHk6aX4I8zg+BBEFkl
 pbM0GElbZhULPCH8rNgBnFdzffC4q4B9F84TxSvJG/1eLxDmm/oiulbvjcce/he7qvTM
 CyAem6teIK5wc2P1vvIz9Jl0RRnmO16Wz+E+rPPghfZABFAxtq9xQVs7KsFK148ojUf1 DQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 36p66rarke-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Feb 2021 20:32:26 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11JKUHor088829;
 Fri, 19 Feb 2021 20:32:26 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam08lp2173.outbound.protection.outlook.com [104.47.73.173])
 by userp3030.oracle.com with ESMTP id 36prq2bevu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Feb 2021 20:32:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cilLbaU5P1EZKHhQFZ/tXoZgv5UWAMFelQ7A/weacmzr72UFTnUSEeSa9kbGIBPRfw+6dJkNoCJu/MPdyLRkSaeodwlghJ3gpIx2a5Q6Yps8t9IsmyODpIogyhDzB2KcPigx1t/PLQjQ0aY9BV2YOwMmp9HQ6YsPHvYjtLbQFQ3feLnZ8Oq18m9XCdU7miOfErH1S1+Jiupd7/6I3LF/Tx21dshT7ObtSCxkmD0/yYxFZyIp1NJMRAOd6BN9oqOUdO0mN+Lf41BrXyMtnu4Z4QuZg7LYxa9iIoc+Ik+Te2TTm46doh2faynP3k5BQa8PFLS3OG4xcS3kzxunHTzp5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q+tlPGJKqF6UYVHJtf4RiU4j3D0HGkZd1GdqLyhGl5k=;
 b=Ld4ESsnTlUH2IkkNza53+IbGAgGHaPJeYH9fktWs41vjynoJKfwrL6UESpbkf32rqtcpn2ZLZgTE1Af7r5IglEeGhNRYYhj+VtX7jZ6PJSJ+lACZVLEP6W0LpvNQV6UOa7W12GukpzMz7BYCboUt91Mf6IH25VTO5W1bRfMgPbAAnq0urCVvyYOflMsJ2eeiFpcSRVqzoUW9HtR7q90JyioiJiXgZ+KaeRf44blAJAaWy3Qgplp2I/z7msFr/Ofgri3wWlCOFIydrFoNl8pAhTvCCkFrLRLOmI7FVQAMSzAFbg++ouoLQMvdZGofr5TVDmhRCPi94+/Udr7rf/s4hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q+tlPGJKqF6UYVHJtf4RiU4j3D0HGkZd1GdqLyhGl5k=;
 b=F+sfZVS3Rip00Puw598dxvLwI0SZH9jdU6wPTnP4wU6cp305cuTuHpI9o/LXTC/M9CZjn8s/xz/OpZheMhlUPtP4H0Fji8o+DsqZtfMW5l3bnrdlJo5BHx4TYawG8khET8l1kZ1xquvYuXEYmes0eLUgl8wWIcDLt2iR8Rsjews=
Authentication-Results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2999.namprd10.prod.outlook.com (2603:10b6:a03:85::27)
 by SJ0PR10MB4509.namprd10.prod.outlook.com (2603:10b6:a03:2d9::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.41; Fri, 19 Feb
 2021 20:32:23 +0000
Received: from BYAPR10MB2999.namprd10.prod.outlook.com
 ([fe80::e180:1ba2:d87:456]) by BYAPR10MB2999.namprd10.prod.outlook.com
 ([fe80::e180:1ba2:d87:456%4]) with mapi id 15.20.3846.039; Fri, 19 Feb 2021
 20:32:23 +0000
Date: Fri, 19 Feb 2021 15:32:15 -0500
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
To: Christoph Hellwig <hch@lst.de>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, jgross@suse.com
Subject: Re: [PATCH RFC v1 5/6] xen-swiotlb: convert variables to arrays
Message-ID: <YDAgT2ZIdncNwNlf@Konrads-MacBook-Pro.local>
References: <20210203233709.19819-1-dongli.zhang@oracle.com>
 <20210203233709.19819-6-dongli.zhang@oracle.com>
 <20210204084023.GA32328@lst.de> <20210207155601.GA25111@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210207155601.GA25111@lst.de>
X-Originating-IP: [209.6.208.110]
X-ClientProxiedBy: BY3PR05CA0044.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::19) To BYAPR10MB2999.namprd10.prod.outlook.com
 (2603:10b6:a03:85::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Konrads-MacBook-Pro.local (209.6.208.110) by
 BY3PR05CA0044.namprd05.prod.outlook.com (2603:10b6:a03:39b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.11 via Frontend
 Transport; Fri, 19 Feb 2021 20:32:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 02501154-d7eb-497a-1b24-08d8d5157639
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4509:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB45090C51834820E7AEC49FF889849@SJ0PR10MB4509.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q3AKZuSZrPy0l4j4hWsGLN91LmBcmN6L9XURIPwwIX8OLjOW8X9ie9CdRLsIHYJ5S6uVl+O5krhJr4Ar14pPq0XLUXmnKkh/l23ObS2ne6YtXZP5gqz28uvkQBwX5Zsu8irHIUN8Y0shwtWJwdxIck0IxATrWeTvTMLpmNK3zp0wCJQQrlzTVBblVvH/s80GXOqbqqHAeQ5LMgWUJJt2shu6IF17ZowjSiv/yIEhl8ZYRsl0QyRaecku/1me5R6pV5iBb8vtvhglxjEeK9/huSAOTuNNo0Jg66noqDxWOWSl9eKKbIVvqaQlcOKDjTo5IDw0U73GgVT6PE//t34detm1NixfMcgu4+mLfUlwTy/IVfr80V/rFdnsNbiJc872pu9T9e68wX6aO3WaX64AuXjDfkQR/dBhQFnNv2yqam314cWubFUl3Z5jFyzsox8mv6mMyMiFm8mk5DZNdtuwCOjglNRN2aWGVYiAtLu2sPfiihTzfjT+zBK/H4JAq0nADkKVcU4422BUXu6BmTZZ2A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2999.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(396003)(376002)(366004)(136003)(39860400002)(7416002)(7406005)(4326008)(6666004)(9686003)(186003)(478600001)(2906002)(6506007)(66556008)(8936002)(66946007)(66476007)(55016002)(52116002)(86362001)(26005)(5660300002)(110136005)(7696005)(956004)(16526019)(8676002)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?GVVmae2fpuGK2oJ5KRrSOfjoBXyS2Pg6fOS1yhTmwR5t21OZNx0gNSxNnwKz?=
 =?us-ascii?Q?xCZljSlABLs9fpLftdNzoQBBKHLxdGxuEqJURx3md2LOtjv8DvcpOEwS7Q/U?=
 =?us-ascii?Q?8tNziK8wPFcFNYllZ5wYBi5Tne09kfBsc/Qy6PJ4kTG70juZ77SCL9eRg6q0?=
 =?us-ascii?Q?hbwlFxCdnfJVsSYzFar/IaHe0nPmcL/UtUMo0ZxfsID9Sm0pfo1GrB0KUtM5?=
 =?us-ascii?Q?5Iu4vSFMArDie4dIURUlmsm472x2phgzCgacrW1Rd6EpII9py2v1wI8ws1dp?=
 =?us-ascii?Q?3ba6tem8ZSHhemhUOCqTT0M0NEacqGBSiYkuaD9M0stR4FooFNNN/WyaIbtr?=
 =?us-ascii?Q?RFcI8MRHtwAzAPDdYYBW4B8DSy6FJdsJQ0wfNnZXsAmVj+Zx7JdA8So3zMib?=
 =?us-ascii?Q?UtOERUWChlHlXkBq/N89p2QxI0G6ndF94I7oVRxP5OG3Jbw90SC1ZEDMwbEd?=
 =?us-ascii?Q?yTyNyjMgIy+Jy4E4WrohdQka34alXB3bH8VBYPOk7P4tKVCE8IPSYrted8u5?=
 =?us-ascii?Q?0/+gQsoQI4lwU8NRhaxqf/rQsfxuD+qaBkLeZngBAyP9+KAvwloFwo7+JzBM?=
 =?us-ascii?Q?DgYRycv5ljXceUTn9N9xoVaJlEBvAd/GrDrTCG9QNB6xMbuj2fy+MmXwihjB?=
 =?us-ascii?Q?RVGL+zIxlahMqr8Z2XtrRzl7GQpb96dEXZ7TCEs7T6Vme/l/10JdQYrTdeXy?=
 =?us-ascii?Q?VaAsOVS2CByBrRKHTt1OnvBJQhE5cyZtLKb7Vj/Sij7WmI24f7etqZ4YgfAV?=
 =?us-ascii?Q?Wr6QBu0lJYKikAYevHB8+M/1uRpqCgVh29xywXbN92Aq417HHsByqyVvGNJG?=
 =?us-ascii?Q?qHrY5UtscdVwfe6fncSsNVDqQ60o5Wr3PGIoCsniWYd6D1S/mUb5qdd4R/r4?=
 =?us-ascii?Q?sgT/6px9QpnG5eP9oWkDBrAvKO0hLG1XCajoe/C5EG7r/y0uPZazA/Uyd0Lk?=
 =?us-ascii?Q?KwRc+iSav/ptjm/cghiR+oeiEwTGZJFXEKUbkuRDprEYLJyJCEWgKvBUpBJ3?=
 =?us-ascii?Q?/NXgvB/mC1eufG7Ai7wm0w6BdW4uhqp9+qqXfzFv949sEqQSwhcGf1kaeFey?=
 =?us-ascii?Q?66b9XwnvB8+DmmIDIIPuXCHdn82G/nHoPSHOGrIjiso8Q1THv5yWuiKrcuWu?=
 =?us-ascii?Q?yB1EpvfnFmlQVs+ERIOHkrS8P8I6NSVSE5ys7G2Achogq6KDl/VB9qA6vvct?=
 =?us-ascii?Q?fgV5PzU2YGckjxjud0bZ9FsU5uzM9eJ2wz8Nnne8eM3Cuam4HmU0LwYf5Ssq?=
 =?us-ascii?Q?9ky1JFpa55/sKnGKlAcLx+88xBVHdaj5R22181NygkreA0I/8KjiFwBDRfKC?=
 =?us-ascii?Q?0ppzetP+TZkgHVuGsp0JnRaX?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02501154-d7eb-497a-1b24-08d8d5157639
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2999.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2021 20:32:23.1896 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oVdORDfZ29f7RAUpUN8XHDQ0O+4tk/o7h5eZ4IZtxStx6v91wvjKmdTWWJmN34CKJjicL60LgzclWhVJE0D7zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4509
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9900
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=938
 phishscore=0 adultscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102190164
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9900
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 spamscore=0 mlxscore=0
 phishscore=0 malwarescore=0 bulkscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102190164
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
Cc: ulf.hansson@linaro.org, airlied@linux.ie, joonas.lahtinen@linux.intel.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 paulus@samba.org, hpa@zytor.com, mingo@kernel.org, m.szyprowski@samsung.com,
 sstabellini@kernel.org, adrian.hunter@intel.com,
 Dongli Zhang <dongli.zhang@oracle.com>, x86@kernel.org, joe.jin@oracle.com,
 peterz@infradead.org, mingo@redhat.com, bskeggs@redhat.com,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 matthew.auld@intel.com, thomas.lendacky@amd.com,
 intel-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com, bp@alien8.de,
 rodrigo.vivi@intel.com, bhelgaas@google.com, boris.ostrovsky@oracle.com,
 chris@chris-wilson.co.uk, jgross@suse.com, tsbogend@alpha.franken.de,
 nouveau@lists.freedesktop.org, robin.murphy@arm.com, linux-mmc@vger.kernel.org,
 linux-mips@vger.kernel.org, iommu@lists.linux-foundation.org,
 tglx@linutronix.de, bauerman@linux.ibm.com, daniel@ffwll.ch,
 akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Feb 07, 2021 at 04:56:01PM +0100, Christoph Hellwig wrote:
> On Thu, Feb 04, 2021 at 09:40:23AM +0100, Christoph Hellwig wrote:
> > So one thing that has been on my mind for a while:  I'd really like
> > to kill the separate dma ops in Xen swiotlb.  If we compare xen-swiotlb
> > to swiotlb the main difference seems to be:
> > 
> >  - additional reasons to bounce I/O vs the plain DMA capable
> >  - the possibility to do a hypercall on arm/arm64
> >  - an extra translation layer before doing the phys_to_dma and vice
> >    versa
> >  - an special memory allocator
> > 
> > I wonder if inbetween a few jump labels or other no overhead enablement
> > options and possibly better use of the dma_range_map we could kill
> > off most of swiotlb-xen instead of maintaining all this code duplication?
> 
> So I looked at this a bit more.
> 
> For x86 with XENFEAT_auto_translated_physmap (how common is that?)

Juergen, Boris please correct me if I am wrong, but that XENFEAT_auto_translated_physmap
only works for PVH guests?

> pfn_to_gfn is a nop, so plain phys_to_dma/dma_to_phys do work as-is.
> 
> xen_arch_need_swiotlb always returns true for x86, and
> range_straddles_page_boundary should never be true for the
> XENFEAT_auto_translated_physmap case.

Correct. The kernel should have no clue of what the real MFNs are
for PFNs.
> 
> So as far as I can tell the mapping fast path for the
> XENFEAT_auto_translated_physmap can be trivially reused from swiotlb.
> 
> That leaves us with the next more complicated case, x86 or fully cache
> coherent arm{,64} without XENFEAT_auto_translated_physmap.  In that case
> we need to patch in a phys_to_dma/dma_to_phys that performs the MFN
> lookup, which could be done using alternatives or jump labels.
> I think if that is done right we should also be able to let that cover
> the foreign pages in is_xen_swiotlb_buffer/is_swiotlb_buffer, but
> in that worst case that would need another alternative / jump label.
> 
> For non-coherent arm{,64} we'd also need to use alternatives or jump
> labels to for the cache maintainance ops, but that isn't a hard problem
> either.
> 
> 
