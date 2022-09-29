Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F355EFE8B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Sep 2022 22:19:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mdl7k6PpHz3cB3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Sep 2022 06:19:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TypjSF1k;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.115; helo=mga14.intel.com; envelope-from=dan.j.williams@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TypjSF1k;
	dkim-atps=neutral
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mdl6x6VN6z3029
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Sep 2022 06:18:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664482714; x=1696018714;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=aXTKP2hA4TTd5GOUtOlRrbGUNV3lymOTyksjJcpW+rc=;
  b=TypjSF1k2tzUQSLitPfVo3uqdaigNTnQ88ABRJ46ThVb6NlVuP+GDVga
   ltv8Bwc1wSmksYhFbe/fYAf3A1yFBkmJL4m+dqvpnXhUn5lU+fp3IKIsg
   WFFMLIFh/DB+LnFU07nCJNGyvepy/bfFnjTlzjT29LvIKjDWvLrO8N8qX
   ms1pFQNSpNK+a1rEx5C+eW8Fw4CqYpO10gFaUvK/rxu0v2d0bSbibUey1
   nIYWmT+8NN38caWm3O6dbmaVlQAqX/Z5LgN2EPAZRMApnbc5dPnWOb5O9
   wrPdhw0y21E5eh3XX6aiXeW7x0TmMwvB2S6pGhPKFyuqutuUoavf4od9/
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10485"; a="301988625"
X-IronPort-AV: E=Sophos;i="5.93,356,1654585200"; 
   d="scan'208";a="301988625"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2022 13:18:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10485"; a="622511041"
X-IronPort-AV: E=Sophos;i="5.93,356,1654585200"; 
   d="scan'208";a="622511041"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orsmga002.jf.intel.com with ESMTP; 29 Sep 2022 13:18:23 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 29 Sep 2022 13:18:23 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 29 Sep 2022 13:18:22 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 29 Sep 2022 13:18:22 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.48) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 29 Sep 2022 13:18:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JxKg7JV5TbKxebG8X5nOT5H3+5v3aRhIYedr6eKWDAJYq4DCbnYCJk0inQjnrQd+KN74ke93Jf79Hl47G8W3i9nRUiVwuwBix+5qRnZ8cEQDMMPCIDTLk4Rx3/bPrE8ztrbEivJbUo6O/nfnokmqR/jBL59Rco2PmWAlosH6F9cMO2ppaH+ohOQVMNdHWfPOr+wvNFTa1qfg43tesSXNeyHkxP/Sdc/jcXoP/C2BjeL+2xoWJQIGO3t/86d9zAIeT5qn7kLV7UHukl8eUk2q/6vjBu6o/vlvYIwllW8d5riS9OrHQZrLX9khl5k2VQpWTp/n7gyX1GEmwOFbQc+xMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KNKrqr1uzlYR5GE864X3DtFeAzdFM7zR0O2O0WKvmMY=;
 b=Ww5+vvu/8wvz1Iu7LO2o1xeTOMJJfFupmgYgNDMTpr2FaLiS7sN7PbAEfMhYF6qfsVxE5triWJhDMMxTy3WkW/PyklXE/3r0x+No6vypUQkoAGoun0xOuxj/i5tzkB7LWx2lsPAUmjHniTxK3NWZ8Scr2mhzf1DgBxPgRndfztCACHjGH4aarvKlTaEyNmFcih5kttEf31SVKM2vtwvZMKUBgJnxwhRyyqWvHbCVshNlSComeX/EQuDIkUCy4PcM2l0w8RwCaucskgiLDG/AAO3TefXHG6P7VjI7Fbkj+SL0C4apSnmcqozvKqdPOoQx7OHkakDnyNzvq0EnM+Ju4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2126.namprd11.prod.outlook.com
 (2603:10b6:301:50::20) by BL1PR11MB6028.namprd11.prod.outlook.com
 (2603:10b6:208:393::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Thu, 29 Sep
 2022 20:18:19 +0000
Received: from MWHPR1101MB2126.namprd11.prod.outlook.com
 ([fe80::7d5a:684d:99f7:4e83]) by MWHPR1101MB2126.namprd11.prod.outlook.com
 ([fe80::7d5a:684d:99f7:4e83%12]) with mapi id 15.20.5676.017; Thu, 29 Sep
 2022 20:18:19 +0000
Date: Thu, 29 Sep 2022 13:18:15 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: Alistair Popple <apopple@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH 2/7] mm: Free device private pages have zero refcount
Message-ID: <6335fd87adc7f_f6c9d29474@dwillia2-xfh.jf.intel.com.notmuch>
References: <cover.f15b25597fc3afd45b144df863eeca3b2c13f9f4.1664171943.git-series.apopple@nvidia.com>
 <3d74bb439723c7e46cbe47d1711795308aee4ae3.1664171943.git-series.apopple@nvidia.com>
 <YzG42766BJSxro0R@nvidia.com>
 <877d1plfrm.fsf@nvdebian.thelocal>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <877d1plfrm.fsf@nvdebian.thelocal>
X-ClientProxiedBy: BY5PR16CA0014.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::27) To MWHPR1101MB2126.namprd11.prod.outlook.com
 (2603:10b6:301:50::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR1101MB2126:EE_|BL1PR11MB6028:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a3252f0-b0bf-4553-5aa5-08daa257c00a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jC3+dv6LeCP5V2fTY5TzsjeA9p+CpffiUwi+iLVJM8i+9FhXlrNWUEBprETz6AqMiSb5nnm5/WvVEFygTa4IdSgu+DMvxXhMKoVnZl2mxN3Odl5Kse9rykaYI921NvBVsu/MZcVTUrShKaO/e//a0iA3BSrTJUWxRrScVRq15vq6G9iOCQ1X81+X9GOzgq9W5i1BcllEKrwR+mChvJRPa2bzpXJD+zplDtbKdW8hJoiVN1IE8CZFx6xcB+2w7Q8SXcKnjVGrdbFzfKgp4n6YP3I0MNbevZtJ2yk7vY86FB4gW92uS2qmaDmq8EtlrpV2ft/XdAr2VdzUObpO5xXsIH3VvKHPqIGhxRYnHatcSfZTTdXg0aoWgNfgyKkVeYVfThrooV99RhzEIn4MfzPmuqvJenaT9OwjBA6ZkXWCw99LACVNVnmH5tqrGKp3bA6awYT2ruCgKpumjYOF/zgFmUD+HEGFTeSrWXsa0gMxMR6E9fGtZm2hSmJM3R+fRSHqh6GwcRgSBcNNpGgIG5Ch/oB2TY7lgpWWVYt4Apxc6aBvbiuoRBvycnlxiCrjB5mPVu9u8bikBLui1RgYMjJ7rH5vGKe52ApnP2f0chjtV+E7pIwmnl25Y0oprWHmOR5Vr8bKDzLhHlIMTMqMw0cnJ3bfSYNC6w8+eDdD7J3/kc7PvFgQ+VP1Uu8vU1zxThPPUyRl8/8OYR5Yly1AN7oTLgAuHLwmXy9B91sCiG4VKaty+3E77MSTjy/X4F5lC/Pl
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1101MB2126.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(39860400002)(136003)(366004)(376002)(396003)(451199015)(107886003)(6512007)(6506007)(6486002)(5660300002)(966005)(83380400001)(2906002)(186003)(6666004)(9686003)(41300700001)(54906003)(66946007)(26005)(478600001)(110136005)(8936002)(66556008)(4326008)(8676002)(7416002)(66476007)(316002)(86362001)(38100700002)(82960400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LiGQsplyDfZYEOhPFYCXv0SFaBOZ+4ygYv+dTXjYKjh3cU6N9ulQdbsX+bCw?=
 =?us-ascii?Q?9RJ+gUD13bLzipJz6UcS3N7Xpd0UOfTjL3fFfpUHaZelqy5faMuBl9PDwXPU?=
 =?us-ascii?Q?MkrtVjMH2xZSxGDK+MldgFy/Y/rrS/3xF5NvjS2suilpvVDaWiwem8/m1DIp?=
 =?us-ascii?Q?Z6yOwx0pa/6DnkVXFXx+cpmYl0Dut6NusEbhYBuhL1oQQr6nDbImOJ1BIW7U?=
 =?us-ascii?Q?xHIXTtEnoHtG+lpyRo9IV2p9z9ot6pcCa0aDXXwfZuYq2LKkDa9bt4O4BWPh?=
 =?us-ascii?Q?SMDFMnDQ8BGyC8cv5R2iI7J0A784OWQV40XC3Jxrrwmk7Gim35GNbmondCQx?=
 =?us-ascii?Q?TrxzJYkfc7I86jtsPY0GpWHZgIvz7uxKfcu802X6TKAh9rM/FFKtW0S1ZRLB?=
 =?us-ascii?Q?Ly/BbHMA3+KZujYN0PAq9grjzcaHR7Hs8T/GnLOIjGj0EzamuCvjxVY1FxXW?=
 =?us-ascii?Q?o4xswtxNS+6q2+IOs9949kTk3VssH/vl777PBBtEEBnE1ZUpHpYo6Qw5Sm8m?=
 =?us-ascii?Q?2EYsXYZ5gJafOUUuPluOHzorAATFqrmygJOJpXEYAkRaujrHTMvhWDUGGb4C?=
 =?us-ascii?Q?jM9PcJbpBQKsrkoFG8czaTngMzNc1vkPLQdlMeCCLs6f1UzbUM00zKFGx5Xk?=
 =?us-ascii?Q?wvfBJOh37bYJmU9cdLj6pUgBQ4SgX5qodalDp0f6SFbcHh/g5twSnygxTssR?=
 =?us-ascii?Q?qTFK20iB2L5I1LcpSrEp170HxQ0wjWmC814IlpMQBbUb4X0LLsixZgzfI5bO?=
 =?us-ascii?Q?1CRoUgWqh5eW2Q2yA4QlHYKD0c9UZm98vvgiz5Bn3paKLui1F/aTzK/RKrey?=
 =?us-ascii?Q?+c/vi7g+DyCUv5lLUYAPw5YnTFDv/jej46mJzIx6VrYX/hXyjGkLKAP4bV2S?=
 =?us-ascii?Q?FZ4GXgDzkKcdEb7jvl1nilfgEC9Am1gfJ87GDjylwRecUShSJxYRzKVoOGya?=
 =?us-ascii?Q?3im6umudUq1Ix8De76jCmVi96HtwWdZfjMsJA3cWcSm2sIsBC9KBx3aeirhn?=
 =?us-ascii?Q?P19xc3n+n0IH9JKsCjfJrSYjmeAA2j+L77jf4HJv10Xs5t64OEo/Me6NvOft?=
 =?us-ascii?Q?VKEm0ML+FrPbUzl6s0KwP3lF37EnqjuRDIWFcYh4qmOmbwCX0Ej8S81t96yb?=
 =?us-ascii?Q?dAJk7vx5ZmD3YfucDQlbJTm1X9rP/QAzVqAGUv5htTKYUxM9DzJr75YjV1mc?=
 =?us-ascii?Q?1exwB13Fs6SOd26iuoDBC9HhNpfFSHcUnuonQTVhTjTFl7clrW5GFu3/i7FY?=
 =?us-ascii?Q?s/6oAIfItSH122Lu/5ftfktFBPbRhnjVwKZlIcvE1x7yPb15Z+SJLK3Z3qph?=
 =?us-ascii?Q?EYzgE4Yl4raQN0gw8YADX1xU7Y6IMSBRLofZBH49NY58nZBPuh3Bs7EyPCol?=
 =?us-ascii?Q?+hHl0OFHxn25/sTW9txcpgSUJBj5GlD2vz/jANMWakUCGOqMr0r/9l6L70CK?=
 =?us-ascii?Q?h0jfnpDfDXIxiBfX+tDNHnuOrBN7QPaaH1MIQ1jW1KJfBbfksIuyLZ5jrdje?=
 =?us-ascii?Q?/8mbctXH+IwYzSIwrTWQr26yhCfQJMXq68t/VNQdQve3siILAihwQYCPpyt+?=
 =?us-ascii?Q?gq6g71oR4qqTvfHARlmZETnHLUGWP81FYc2yCPK6LiuRaEtbLQlbYt9neXiK?=
 =?us-ascii?Q?bA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a3252f0-b0bf-4553-5aa5-08daa257c00a
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2126.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 20:18:19.6448
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RiqkXc8QDcfZweMsAuSV4Gj4przsyQTSaeziC1ABb1F0h3yzF9X/d5tB5QicY4aPgIFb/p1P4nMrgYLb5SfFAxA/R8jf+xMnjxbQJdo0aL8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6028
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
Cc: Alex Sierra <alex.sierra@amd.com>, Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-mm@kvack.org, amd-gfx@lists.freedesktop.org, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Ben Skeggs <bskeggs@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>, Lyude Paul <lyude@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Nicholas Piggin <npiggin@gmail.com>, Dan Williams <dan.j.williams@intel.com>, Felix
 Kuehling <Felix.Kuehling@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Alistair Popple wrote:
> 
> Jason Gunthorpe <jgg@nvidia.com> writes:
> 
> > On Mon, Sep 26, 2022 at 04:03:06PM +1000, Alistair Popple wrote:
> >> Since 27674ef6c73f ("mm: remove the extra ZONE_DEVICE struct page
> >> refcount") device private pages have no longer had an extra reference
> >> count when the page is in use. However before handing them back to the
> >> owning device driver we add an extra reference count such that free
> >> pages have a reference count of one.
> >>
> >> This makes it difficult to tell if a page is free or not because both
> >> free and in use pages will have a non-zero refcount. Instead we should
> >> return pages to the drivers page allocator with a zero reference count.
> >> Kernel code can then safely use kernel functions such as
> >> get_page_unless_zero().
> >>
> >> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> >> ---
> >>  arch/powerpc/kvm/book3s_hv_uvmem.c       | 1 +
> >>  drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 1 +
> >>  drivers/gpu/drm/nouveau/nouveau_dmem.c   | 1 +
> >>  lib/test_hmm.c                           | 1 +
> >>  mm/memremap.c                            | 5 -----
> >>  mm/page_alloc.c                          | 6 ++++++
> >>  6 files changed, 10 insertions(+), 5 deletions(-)
> >
> > I think this is a great idea, but I'm surprised no dax stuff is
> > touched here?
> 
> free_zone_device_page() shouldn't be called for pgmap->type ==
> MEMORY_DEVICE_FS_DAX so I don't think we should have to worry about DAX
> there. Except that the folio code looks like it might have introduced a
> bug. AFAICT put_page() always calls
> put_devmap_managed_page(&folio->page) but folio_put() does not (although
> folios_put() does!). So it seems folio_put() won't end up calling
> __put_devmap_managed_page_refs() as I think it should.
> 
> I think you're right about the change to __init_zone_device_page() - I
> should limit it to DEVICE_PRIVATE/COHERENT pages only. But I need to
> look at Dan's patch series more closely as I suspect it might be better
> to rebase this patch on top of that.

Apologies for the delay I was travelling the past few days. Yes, I think
this patch slots in nicely to avoid the introduction of an init_mode
[1]:

https://lore.kernel.org/nvdimm/166329940343.2786261.6047770378829215962.stgit@dwillia2-xfh.jf.intel.com/

Mind if I steal it into my series?
