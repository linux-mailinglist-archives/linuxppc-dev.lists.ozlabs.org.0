Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C96D6EF103
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Apr 2023 11:23:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q5thZ2XG1z3f9s
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Apr 2023 19:23:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PZu4Am5K;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.115; helo=mga14.intel.com; envelope-from=kevin.tian@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PZu4Am5K;
	dkim-atps=neutral
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q5tfv51Gvz3cd5
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Apr 2023 19:21:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682500919; x=1714036919;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=UDRkmwHXJT2XNHcpzpvsE2bNH47bV+7+nfKX0up+KQM=;
  b=PZu4Am5K9D9X6ibPjOj2NppXPl7Iulrb8Fbwlp0gztBtW4n21l+I/PWb
   2aM5oMtSFfM2HGCkR8We9W6g+UctHVUgKASB9L3c94ibleJRXHfX2/Lnk
   NFRmiSgtx2klB6DGUuW+/tG9TwK51CCI22R+jwqx8hF/bTgio+olsmRQl
   g25kVvgx67m45E+BecmJ+NX/a+NgURtT4o9FTIvxohxdXwT1LJYalVKIp
   VGlRwnFEAFZQOvcBVOsZy/RvwPoJTLfbQJ9vaWpuTU1Kd69krQXU/LylP
   byoYRZ3pSMi3pIPoAT3DPHqA4PFbQiQ5lLPoybR0ifOpZ4cWkLzIWypu0
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="347075510"
X-IronPort-AV: E=Sophos;i="5.99,227,1677571200"; 
   d="scan'208";a="347075510"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2023 02:21:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="724365806"
X-IronPort-AV: E=Sophos;i="5.99,227,1677571200"; 
   d="scan'208";a="724365806"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga008.jf.intel.com with ESMTP; 26 Apr 2023 02:21:57 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 26 Apr 2023 02:21:57 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 26 Apr 2023 02:21:56 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 26 Apr 2023 02:21:56 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.109)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 26 Apr 2023 02:21:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d+Xhpk6DWoEuAW3SHJAbxQ+63Kne/LZyoRfXAixUj6Q+hg0fHCmH9fuUKSNu+oPyB/voRIF00Y7bSneXbnVEyaHMIPwb+i4lyd2x/mdQmZQloWQG5S2+nz018Y0KvccbPSIZH4xXFqTr9UzG9UikzC41YF5QyFRtd6DUtCCsRh70BjLLEkz5xwq1pmgJ5nFDtp9nXR6NasUSyLxK52BRMBOP/aoSnDzxeapRUmzKqgluK+Q1dXHcwA5tcU4VY9wwhQmnpLNBrpor2JOK/XgnAFQBDWGXi/DcVrGy39sxPGSv2vh1e8nPVruuWczQznNhHkX19MtDpmLh994nOjjM6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UDRkmwHXJT2XNHcpzpvsE2bNH47bV+7+nfKX0up+KQM=;
 b=muAWyewN1ubVDM0gjmQ3FiXGfGcmVJzxDLd4z8zt5xdpYjVZcA1M49e4mLR6ah4AN43n7Z0SS1AESK4ZdraEgSIK11PY9yhOFbxDVFSswywZJNGHYd81hfs3t0ZSdo5d7WJ+j6+bbV97wE6k0Bn2iSMLtY1jQdOZuYFFi8hiE6mMbWC7K/1kKrDiZYYjB0COCG0oy5bw5IWrFHbSHbe3p9eqlmjOzw7omgAc3c+JQIhvmYyoQ3/McX/PY+g68XDPjekyLYDtQsap1eHSgmjDZHiJcN9f42lIZKPVBAa01nmqh1LRj43LEkWBL4fxaH1rTT46LeIoUcwD/eGZSW1GGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by CH3PR11MB7345.namprd11.prod.outlook.com (2603:10b6:610:14a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21; Wed, 26 Apr
 2023 09:21:50 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::73e9:b405:2cae:9174]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::73e9:b405:2cae:9174%6]) with mapi id 15.20.6340.020; Wed, 26 Apr 2023
 09:21:50 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>, Lu Baolu <baolu.lu@linux.intel.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>, David Woodhouse
	<dwmw2@infradead.org>, "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	"Joerg Roedel" <joro@8bytes.org>, Len Brown <lenb@kernel.org>,
	"linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "Michael
 Ellerman" <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, "Rafael
 J. Wysocki" <rafael@kernel.org>, Robin Murphy <robin.murphy@arm.com>, "Will
 Deacon" <will@kernel.org>
Subject: RE: [PATCH 04/11] iommu: Simplify the __iommu_group_remove_device()
 flow
Thread-Topic: [PATCH 04/11] iommu: Simplify the __iommu_group_remove_device()
 flow
Thread-Index: AQHZctm5E/IWVSsxRkG2ZMdgqan7aa89W0+A
Date: Wed, 26 Apr 2023 09:21:50 +0000
Message-ID: <BN9PR11MB5276C93255EE24B3741D446B8C659@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <0-v1-8aecc628b904+2f42-iommu_probe_jgg@nvidia.com>
 <4-v1-8aecc628b904+2f42-iommu_probe_jgg@nvidia.com>
In-Reply-To: <4-v1-8aecc628b904+2f42-iommu_probe_jgg@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|CH3PR11MB7345:EE_
x-ms-office365-filtering-correlation-id: d5f9989f-1e1d-4d51-f583-08db4637aa87
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tT7tnu2PYAbWLS7ybOsCx5ZmrZHWqZpB3ZUCWRN76y9wruZ0xNxNHvXfUr3VQZr4rK8JZmRwE+TBcctlJ6U5Rbbg7qiWbId0Nw3JcFpIQLMsJnhq85AHJoU6uZhlCzdB3dHDxDFfyns+FtG5Gixsml23Vy2XM4b7QDU1pGvYVxlkhe3Z0jwuYfcLdRIwJ7ug5Xh2UmPZX4V7YnrTQ8A3yjGqxRJ6DgQ1FD09VyVdXaN5Zt3iv/sEyVDbT8WmymtUY+yOppE8xMzzrIdMUemm7uSgdocdgBoRk/Z+QkS/Sw+PZxziFgqjtnEQz2FdUavWeG1qAqwV89yw0W0oCUExjupBKS98aCfZL+3ZHW2y8ymoPqjR2E+/UKTLzEuhWSvQb9x+mZQOnbUV5aCXEwWGKo1RSEG9eW9HCA2dwe5HZrpGXWNfBg64eVchy9DZ/jGr3o0wcBFihDoofpqDaaXU18x5ublZh/GtmU+MfsnLGbjmDWV6/5SfNF0n9zWBodPbrbSn1Nv5A8XYwnNxab7gARYdbTLjLjRVHACi+EVQCoPsfmu2atY5PV0qGWW62QTRHRUrqq57ifG6f6fb5e5HF8ElhOA0sL5h5hY+OHKlLm5lqAOi2kvQi1OUmHZGtFSlPwPSHu5WnqhLF47WrAYaJg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(376002)(346002)(136003)(39860400002)(366004)(451199021)(86362001)(33656002)(4744005)(2906002)(38070700005)(55016003)(7696005)(71200400001)(186003)(83380400001)(9686003)(6506007)(26005)(4326008)(66446008)(76116006)(66946007)(66556008)(66476007)(64756008)(478600001)(41300700001)(122000001)(316002)(82960400001)(5660300002)(52536014)(921005)(38100700002)(110136005)(7416002)(8676002)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0tvH1ygSxDGx0gTm/28nKIDo5eFdsGrN1TLwqUV0EFwhRy5oSecwwe3UWmrg?=
 =?us-ascii?Q?ZzaK7VurDCNfk2g8qY8z51vQQtntjNofFaUyq7rMQYpi1bxlRtFannB3YSGx?=
 =?us-ascii?Q?aCNus21ax8yQeZZJaIi5633TtjhLhndy2w3rMBEkpaVgt5kV7HSY25UKEExO?=
 =?us-ascii?Q?NYbJQ5bJ6RL32xp2Ylso5EW6ZA613zlpYJ7BEZV1lYIbUjHFYGGpwS3BTK2L?=
 =?us-ascii?Q?oD+eJblkIvmkFEjUOjd4Nvx1R7VveofNTg3AoGs4jc692D22rgWAFGQ+pgMM?=
 =?us-ascii?Q?vNOIXJte8hMDSn0HRzAQGOWjNlz+0NifB8NPQBocJMLh6q5aSiaf8rg9GrtF?=
 =?us-ascii?Q?jwnnfPHojH+6Tss8mifCr0WRseMxDHzhNqh1PpNqfn48usrvTFQePhIReYAz?=
 =?us-ascii?Q?oIvmublrhMB6uKSdpsUQ/8sBrG7FfRCiU5STaC/iIMOEfD7g36auRB69q+Iq?=
 =?us-ascii?Q?cm0Pl7UpQ8M4iTkqzRnkISZXqqWO+j7C6h4sWopaiEOaY7NV4PsyeEJLHZyU?=
 =?us-ascii?Q?uZW4Zq5tTaQiTjz8OEdOLfwjSxdoqRkQ+axFD80yhOizKVCZczZTk0OuoO4a?=
 =?us-ascii?Q?vDKkVRSvsdRF+IrAsAmHadiQyzjTjeju+imgUS7zKy85+QSj3tW1qjWVw8CA?=
 =?us-ascii?Q?g2cL95xIo4iH/Mh4tXFSNbM9yekVQN2GeM2PufUPuNP4D/i/uqtQ1bQpVFf9?=
 =?us-ascii?Q?B9w2URcy7BStPcAfQGTdrKi1soQW6wv+iyUQB+x//4TvxedI6Sot87g+Gxcv?=
 =?us-ascii?Q?3FTZkKcXHClPBUA08CgfKCfchy+jNWjTbHdqsWPgA7Wf/IOW64a1eHWZHG6C?=
 =?us-ascii?Q?U31TqL3iYVt+DeI8MWV2YITCP+XzkJ98emfh1eC5sZEvuwaKMeK6x0v0QOBo?=
 =?us-ascii?Q?V+/7FKeUbxh2yWenRqP3I2lTKdNU6TEkU2UXlLhtbFu2jAv1qsUdr0WIs9JF?=
 =?us-ascii?Q?lx4D259CQd30WhU3FETigbZ18cpVAnLQwoNy4hUJ0t6IG0o3pgBiZIRzEOnP?=
 =?us-ascii?Q?w/ymrX0fvWEM6RXRjazlM+42ETilonmbXFbNaF9FCTfHcpCc8SQPB5EK2FdI?=
 =?us-ascii?Q?6IxuW+TBKAVrNYpSL09siOxmQW7h7ju7KB/SDEXav7H6gTOiwJXRU5byQcoF?=
 =?us-ascii?Q?h4CjZ0J59TohvN1FVheaxLj/mu8FtMmiqamL67kKGs8Jf5C8SXL/nCU8/8ar?=
 =?us-ascii?Q?dM6WTcya9QWAs/3ObXvc9FGBqrw2l0NuVtNNgJbqHGh7DHoanWPj5MsW/w/+?=
 =?us-ascii?Q?AZHjt90J5xtQZVZYyj3A7p5alslkD0WRxfrA6LMNjUjJ1llpb0GKOkR2v0AE?=
 =?us-ascii?Q?B+lXahNxwD9HYuWatR7dfR7zgJu1pCCSKaBYxdclmsfVLPDQLkoo6FS5OmW/?=
 =?us-ascii?Q?6VXM1FFEY7ggHk0pUeEkFYyUMZfpZNpMVVWpQ/+pN82up98C0PNCIfVIvgRE?=
 =?us-ascii?Q?mTB5jYZ8go09X6Zh9hCuW7lYFGn8zvqHOsJMz1bZGLM+gFAXFPEvZqYhTL6O?=
 =?us-ascii?Q?4tbGavtuU8dhqhePvmWKpCOYqvO76cktUWyCdPDH/yY7Z5uIUMGVqvRTYFPq?=
 =?us-ascii?Q?h9uwtEYY+166iwnUtnXN2J8Qbz9gVGhSmUhW8i7M?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5f9989f-1e1d-4d51-f583-08db4637aa87
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Apr 2023 09:21:50.0640
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PtGRKDlWcqE8OQCE1jJXd82XMslpfn1vp18nKCqJVw/RA6nonaGcobLuE/rVwqemUePiKbNvqPjm1PQ3yTTyVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7345
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
Cc: Nicolin Chen <nicolinc@nvidia.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> From: Jason Gunthorpe <jgg@nvidia.com>
> Sent: Thursday, April 20, 2023 12:12 AM
>=20
> Instead of returning the struct group_device and then later freeing it, d=
o
> the entire free under the group->mutex and defer only putting the
> iommu_group.
>=20
> It is safe to remove the sysfs_links and free memory while holding that
> mutex.
>=20
> Move the sanity assert of the group status into
> __iommu_group_free_device().
>=20
> The next patch will improve upon this and consolidate the group put and
> the mutex into __iommu_group_remove_device().
>=20
> __iommu_group_free_device() is close to being the paired undo of
> iommu_group_add_device(), following patches will improve on that.
>=20
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
