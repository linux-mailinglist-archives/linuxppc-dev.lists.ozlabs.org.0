Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1EF5F0265
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Sep 2022 03:50:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MdtTk2ZPzz3cGd
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Sep 2022 11:50:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Dsui5Tkl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mga17.intel.com; envelope-from=dan.j.williams@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Dsui5Tkl;
	dkim-atps=neutral
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MdtSx2F0gz2xyB
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Sep 2022 11:49:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664502577; x=1696038577;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=D0z8hsS40PlLHZh0wFjL38mUyX7aB8MdWDY1E/dj1v0=;
  b=Dsui5TklhfR6akNgPJrt+RNybGmoMnGJl8wH75E/so5bywSodrWLgijU
   Zf5h9e/YBSgRsyHUrTxGcNEcrxmemTJmq1eaqfxhsIWZaMKYBA0I/ssWA
   tmMaa20LiKagMckRDQaNVUXTHNkQgSpXJDKeV4fDgzu3avPKKD5qWjabL
   QDb/toW8anQLN/OESdxZu1KGq2YjWrKb7vridxb/MJBFeFmii6wreF1n0
   MBPXzHFpNmqkDHcuzVfkWi4myzOJrEqg4CMBCgUGVEH3dnJAd97yMLMVb
   BjbaynmQjBySRJgUwsCWvgqwSXUpfo5aFRo/Pt384FpBwRg1rqNMC0LM1
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10485"; a="282440315"
X-IronPort-AV: E=Sophos;i="5.93,357,1654585200"; 
   d="scan'208";a="282440315"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2022 18:49:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10485"; a="600236764"
X-IronPort-AV: E=Sophos;i="5.93,357,1654585200"; 
   d="scan'208";a="600236764"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga006.jf.intel.com with ESMTP; 29 Sep 2022 18:49:32 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 29 Sep 2022 18:49:32 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 29 Sep 2022 18:49:31 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 29 Sep 2022 18:49:31 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 29 Sep 2022 18:49:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KGqp6RZWjxnbVv0QgIaF0id+OPy02XH3+7NSI4rbaA+XpRTRBBpYBHS+K5pQE4Xcq/QwSl4SCvp/RqjlmwZha4qx6QopC0hxNEttMqzDmHevhVTw4Aues8CdUUaiaHBUO1YP/unK9/i8Cr/iVxstJf/wD7e+9ojQ2BBLqg7K0Do9bA4ae0LfXng4CPcYH6A1T1Z1ZTFaSBDDsc+343JvVWrfekVdfpMhWHDXfMEQZkj6N4ZVz8BAIGtaplKUU9hiph+ZFP6g2lGN2lM4h0qXA/nsp8PlaWVlTEC0rKheWZJnoRx0pcjnyot3x4PLr8wrfq56txcUbDw/iIx6EVSMww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=45y12BK85FuuqjolWf81debnE7b6tfOr2CSN3criTEQ=;
 b=T0dhoYhqdeW5VC3lyau3IVfPGK0zio6xokT2bs3IeOV7415JbS/IXoMazXQyxK/rAv2W+zQu4sGiewNpFcCjgAPqNdLPebF/cerGPg08uoJ38WfSsqIdaSSA+Tj4gFDerK8ehyfwi9/CxPgPy6uJYXS22exVwtWPnzDzoJot54B4Msa6mXCuDacNio38GQdnt0AphWCw72jyvDlTciMupKmPloLyTdl1o0VmQCAVjcPyI8NKN6EOkXmuMTJ/Lo0SrKvT1XC1XZtdX6vWEDQ6QpsuqwQZ0j7PXWnzLsGGwT9550bmNcyPEWQx+0bqUehEl3GADoZrBeNTrpE0gbYz/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2126.namprd11.prod.outlook.com
 (2603:10b6:301:50::20) by PH0PR11MB5877.namprd11.prod.outlook.com
 (2603:10b6:510:141::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Fri, 30 Sep
 2022 01:49:24 +0000
Received: from MWHPR1101MB2126.namprd11.prod.outlook.com
 ([fe80::7d5a:684d:99f7:4e83]) by MWHPR1101MB2126.namprd11.prod.outlook.com
 ([fe80::7d5a:684d:99f7:4e83%12]) with mapi id 15.20.5676.017; Fri, 30 Sep
 2022 01:49:24 +0000
Date: Thu, 29 Sep 2022 18:49:20 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: Alistair Popple <apopple@nvidia.com>, Dan Williams
	<dan.j.williams@intel.com>
Subject: Re: [PATCH 2/7] mm: Free device private pages have zero refcount
Message-ID: <63364b20ee66d_7390294a1@dwillia2-mobl3.amr.corp.intel.com.notmuch>
References: <cover.f15b25597fc3afd45b144df863eeca3b2c13f9f4.1664171943.git-series.apopple@nvidia.com>
 <3d74bb439723c7e46cbe47d1711795308aee4ae3.1664171943.git-series.apopple@nvidia.com>
 <YzG42766BJSxro0R@nvidia.com>
 <877d1plfrm.fsf@nvdebian.thelocal>
 <6335fd87adc7f_f6c9d29474@dwillia2-xfh.jf.intel.com.notmuch>
 <87k05llly0.fsf@nvdebian.thelocal>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87k05llly0.fsf@nvdebian.thelocal>
X-ClientProxiedBy: SJ0P220CA0006.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::29) To MWHPR1101MB2126.namprd11.prod.outlook.com
 (2603:10b6:301:50::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR1101MB2126:EE_|PH0PR11MB5877:EE_
X-MS-Office365-Filtering-Correlation-Id: 200e443b-4afa-4160-d52f-08daa2860071
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zfOezU+l/ZfaFYLKZXeHJQ3UB4mTnLwQhncz9vFvqcG5jYvl6BtOaqyMqYOB0tHGadjPgS3mVaYxzak676CMkDJwJwyJdTws1Ue+IqPulz9mrAbyqZoRTqxsRYF//URFaOTpvNN5m8aT/uJAA+t8UijqRO5icmF9wsfXiZwP9uMy9HZempzQ+OosPfUqHRrHtg4SNUJ3p9UkniqQ6rhP1U7nKE1fEKE2ZKyxkl1qERmE+h3nC6empLUYjSD/H+1XmGVSaJcwJkXTjvOVzJkEBkglu5tYWNuueOSsR5Mi4BrqUiEQfWOn3wTpt7j8auaxPDQ9HwXJ9I1vxrHrdcGaHKWlqM+WuqmPfVFJX+X+PB5QbjYNy+BE0eSxE8/VfZG5Hb2WVwoYP2/P7veQLn73PtnURVqC9ZYFsXXsqgoX1yqbLC9xm4v5ZjgOvQD512udwf50slhmPZY7JzUcUtL+DJ9ecINB+/ivD9pf3Z3i2PPpKuRLDs1sHKGtS5kkRLANfSJyttP5yfv7cgeCiEoR3XOIGSw4JfQckeVcb91xednme6NpyfKxKM7lMTLuDFJKAQv7mMgoNsqrDIiezPZuLnvbIZDxGfzATSubiJmOcWvcvDVoaRtVrQkuEV9ApWj2iwtCPBy9mkYCKm56sm4oIogkdL8P4VEhpBBPdPsU8eJbYZuF42qyth/0mhRB7E5sfrzv3xhD+PqaOg38OGpBU3zbQYWcQoF9QUkvcROLtCF/J17AaaT+aUUo+Mjf2klB
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1101MB2126.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(376002)(346002)(39860400002)(396003)(366004)(451199015)(2906002)(478600001)(66946007)(41300700001)(4326008)(66556008)(8676002)(66476007)(316002)(6666004)(86362001)(186003)(5660300002)(83380400001)(7416002)(9686003)(6512007)(6506007)(26005)(8936002)(38100700002)(82960400001)(110136005)(54906003)(6486002)(966005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0M0H5Ibl78YFwgxHjkTJVmCguTih14uLQrWTIWhrT+iGddLvNYacOj2JkTWI?=
 =?us-ascii?Q?XQ//g2fx+sqA5vG7kESi54ep66pTkSkiL5yX2lqME1x8UxbARTm4h3g8Ml/z?=
 =?us-ascii?Q?m9xjRsuZtGMaQ12A9mjG6l3oeMSQi54hzyMYfj+Isno8Wce0aM93crgbBoN6?=
 =?us-ascii?Q?Ct7YAjM79YE+E9yzxW3C+XRj2wPGxIaOCXXsbBjCcrUNurb3A65VpKfUZl/V?=
 =?us-ascii?Q?Vex4PmlCo41oG+oiza48m78Ut7jJaK2QUabFFSKw77qOgznq9Fs3a6pKoIIh?=
 =?us-ascii?Q?apvx7LZDIp3PPDzXacG+/XTd3/iU5WqnsPl0duHkE+JgeR69bk2cC5IpgG98?=
 =?us-ascii?Q?rS2BkDEhlKPOer6zO6ULUCBTDSrsySxGp7j/ITFnH+nUhWIJ6fuW45lgO/O/?=
 =?us-ascii?Q?bxYYNnAV9bLi2dKVueMOBsit+DJ3eeKsZcceMkQt/JKW/vLUNc4JprlQQs5B?=
 =?us-ascii?Q?PyTpbP38MsEA5s7+EBxExRpq45ZoX4AgXDU7ORgpYj25Vd2e4lGcDnYVWtPZ?=
 =?us-ascii?Q?G/aWCqspsOs7Di79c0zB5BR47rqLQ6vFr0Wryk3AIgk/aFhnv4bDU3KdvGDZ?=
 =?us-ascii?Q?ZMHknHJ0wRPlTIzaj05QNyrF5xlu/1768EbS4bUOAiJtcOcCO99ba40NjOTo?=
 =?us-ascii?Q?/HwVTNgSuzvVBl0Au3v65CuhTGZFU47rQePtIJt/STUxgsiyS843hft0IS3P?=
 =?us-ascii?Q?nRupraFXMMwr/zlEoYJYE6IjG9M+tC2SRqoJ9tq3luic/MMtSncDvrbwrx5H?=
 =?us-ascii?Q?b8Z8oL5FyGcQP+zdqAMJnf3Wbd71zZdiIBOaJP5Y3zXEtnwnzSZHqJCijePU?=
 =?us-ascii?Q?/K1DdFkEbD43zAzs+Evw6oPosmLFG/CQJ6nGNg6ppRpA3uglbo6+uUy61e9e?=
 =?us-ascii?Q?bhqIVL8/0L6pwIwBHSDtqzEuvHWAofgZdKgFYmBSOOjepH/spS1eoo1vFOqf?=
 =?us-ascii?Q?6EZhziPRDpTDTOmTUJH0K339qksyxsui/I8kp2EKLqVmhB+VYOocWHfJjYoT?=
 =?us-ascii?Q?PbDWVrpKYUQs6eYTRgHSw9W/7zyVT2Xfr1TKutt4B8PKd43Z0wS5jUHA/oHi?=
 =?us-ascii?Q?CykzPRauGiS5Z7T6K1969dKMGJmTl2BjoVGH60Z+LymrnQDTQdEQbc/9mzu/?=
 =?us-ascii?Q?O6MV3Q0KtTpJrt+FUmpuuGOyIpiL8KEHAiZpIsu0w8szCXEPdKS93CRaAQzF?=
 =?us-ascii?Q?S2L2w4+OYf4Isx8YGN/tXfeKO2l8PcCodAcUmo0SQodnWtR4BfuXXkcGSr5m?=
 =?us-ascii?Q?mjjdGfoHb9Pcsaki85xJCV9d+Oh4jHONC/WUv5gsIFnT1fkH6+cZaEal7/QC?=
 =?us-ascii?Q?Pbauxky39BxPsNIex8he8wVLxxABTdpYGd6nRmV6ouqBV8OyQmAGc2TUTKeO?=
 =?us-ascii?Q?EL5daB9PGXd8IwCJ6qGDOPbSkndTiBkhmg4uoFPMrJNrTrP8FlnVxubo18//?=
 =?us-ascii?Q?sm1Ayh5XRcRjaeGbQKAh3JMz1qL168WvDDHqg889eZYBwAV43nM/6tNzx6Do?=
 =?us-ascii?Q?DwhAgcVgCAVK7TrJqciEwLTtL+M0+PyubzCdJrUbB4xNGSKLg7/qhv6rQdHY?=
 =?us-ascii?Q?mZ8J/aEu09t53Eutuig9uaz/gkaqTI9yz4sTTzExE61exHPzEaA5R5RzvEVU?=
 =?us-ascii?Q?2g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 200e443b-4afa-4160-d52f-08daa2860071
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2126.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 01:49:24.5155
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Il8CfWe8Zs6X5xU0+zppk5yiuvhekafKsJzcDqSiC6QKpf3+uZGSygvAdf59wkFE28rVRzycSfIL473+ul+XPXz7RNcaVaTfCA904MPEUjc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5877
X-OriginatorOrg: intel.com
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
Cc: Alex Sierra <alex.sierra@amd.com>, Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-mm@kvack.org, amd-gfx@lists.freedesktop.org, "Matthew Wilcox
 \(Oracle\)" <willy@infradead.org>, Ben Skeggs <bskeggs@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>, Ralph Campbell <rcampbell@nvidia.com>, Lyude Paul <lyude@redhat.com>, John
 Hubbard <jhubbard@nvidia.com>, Nicholas
 Piggin <npiggin@gmail.com>, Felix Kuehling <Felix.Kuehling@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>, Alex
 Deucher <alexander.deucher@amd.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Alistair Popple wrote:
> 
> Dan Williams <dan.j.williams@intel.com> writes:
> 
> > Alistair Popple wrote:
> >>
> >> Jason Gunthorpe <jgg@nvidia.com> writes:
> >>
> >> > On Mon, Sep 26, 2022 at 04:03:06PM +1000, Alistair Popple wrote:
> >> >> Since 27674ef6c73f ("mm: remove the extra ZONE_DEVICE struct page
> >> >> refcount") device private pages have no longer had an extra reference
> >> >> count when the page is in use. However before handing them back to the
> >> >> owning device driver we add an extra reference count such that free
> >> >> pages have a reference count of one.
> >> >>
> >> >> This makes it difficult to tell if a page is free or not because both
> >> >> free and in use pages will have a non-zero refcount. Instead we should
> >> >> return pages to the drivers page allocator with a zero reference count.
> >> >> Kernel code can then safely use kernel functions such as
> >> >> get_page_unless_zero().
> >> >>
> >> >> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> >> >> ---
> >> >>  arch/powerpc/kvm/book3s_hv_uvmem.c       | 1 +
> >> >>  drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 1 +
> >> >>  drivers/gpu/drm/nouveau/nouveau_dmem.c   | 1 +
> >> >>  lib/test_hmm.c                           | 1 +
> >> >>  mm/memremap.c                            | 5 -----
> >> >>  mm/page_alloc.c                          | 6 ++++++
> >> >>  6 files changed, 10 insertions(+), 5 deletions(-)
> >> >
> >> > I think this is a great idea, but I'm surprised no dax stuff is
> >> > touched here?
> >>
> >> free_zone_device_page() shouldn't be called for pgmap->type ==
> >> MEMORY_DEVICE_FS_DAX so I don't think we should have to worry about DAX
> >> there. Except that the folio code looks like it might have introduced a
> >> bug. AFAICT put_page() always calls
> >> put_devmap_managed_page(&folio->page) but folio_put() does not (although
> >> folios_put() does!). So it seems folio_put() won't end up calling
> >> __put_devmap_managed_page_refs() as I think it should.
> >>
> >> I think you're right about the change to __init_zone_device_page() - I
> >> should limit it to DEVICE_PRIVATE/COHERENT pages only. But I need to
> >> look at Dan's patch series more closely as I suspect it might be better
> >> to rebase this patch on top of that.
> >
> > Apologies for the delay I was travelling the past few days. Yes, I think
> > this patch slots in nicely to avoid the introduction of an init_mode
> > [1]:
> >
> > https://lore.kernel.org/nvdimm/166329940343.2786261.6047770378829215962.stgit@dwillia2-xfh.jf.intel.com/
> >
> > Mind if I steal it into my series?
> 
> No problem, although I notice Andrew has already merged it into
> mm-unstable. If you end up rebasing your series on top of mine I think
> all that's needed is a patch somewhere in your series to drop the
> various `if (pgmap->type == MEMORY_DEVICE_*)` I added to (hopefully)
> avoid breaking DAX. Assuming DAX takes a pagemap reference on struct
> page allocation something like below.

Yeah, I'll go that route and rebase on top of -mm.

Thanks again.
