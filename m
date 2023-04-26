Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D896EF153
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Apr 2023 11:42:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q5v6r6DDPz3cjW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Apr 2023 19:42:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nzh3xtA1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.100; helo=mga07.intel.com; envelope-from=kevin.tian@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nzh3xtA1;
	dkim-atps=neutral
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q5v5v30PDz3bdm
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Apr 2023 19:41:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682502115; x=1714038115;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=naLLhTeNxmglcg6PPgZZELjA88GLWQMEFo6zBu/jU4o=;
  b=nzh3xtA17B6btMTGcyjNMHQkf2LjkIE3HVe4f62ATxicqeQ/Gx/YqQf6
   vfxg0ic9rRpgBvg7XW10of/s0VGyuMqzpCQAdarM78QLbIVRRMO4Wiodk
   Gg1OX1dNR0efeA6WrkYQmIGbRN0FeIvzac0w9mLh1w8vuBM77clHIAmVt
   ol5j7b2TWURRaBP/n9y6dYDYhsx5Rl7xHVz3szY9Sq4g3PhkZqKRLFNI8
   AToqmxTZYqWkXLUsUAyu+TXeyLNnrNOmaRK+C6mHpLXRAiHCwbPRpckbv
   ENJJy9v1n0khZ8fdSMoguRPAtKyCWf72/VvM/3+pG4dyNMD1RUukum/iW
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="412367795"
X-IronPort-AV: E=Sophos;i="5.99,227,1677571200"; 
   d="scan'208";a="412367795"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2023 02:41:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="805429584"
X-IronPort-AV: E=Sophos;i="5.99,227,1677571200"; 
   d="scan'208";a="805429584"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmsmga002.fm.intel.com with ESMTP; 26 Apr 2023 02:41:43 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 26 Apr 2023 02:41:43 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 26 Apr 2023 02:41:43 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 26 Apr 2023 02:41:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l593E51gsoJaqwVZXoZjRMZ8sJmF24/WlF947HkB1xJTxY7MbUn9fWOZJQPEMB7kckIv4nHcwbLk1XzViZB8OMcFtyWk5JDgpBThFq1siRhrp47X32YYw72b/nOaSMoT3vgqHEO/n2s/09NVB6/5KJB7+jVllLt4iKU07QwYeTXeShTUlqbj4z/bKdsPNlItD3DCRicu0OS53TaIMuJjMN1R9zdhUqEz0beYduz9eQ1ZQL8uRFeAcUe08L6PKv6R7wgZzO/LPjV0mP8uH9GeK+NfpcibmO79xdVe0z/Y2IZDljOJbpdVjHDBRSM3u2hoOOobp3fy6HGtegv45cPj3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=naLLhTeNxmglcg6PPgZZELjA88GLWQMEFo6zBu/jU4o=;
 b=bkfxvfp1bxPDBNIFzGxsy4tznAMqvn6/qGjO6Ab1D5xlRnGbm/ZKWcPP8Rrq/hRryiU4MHBJ250e1JG5NsyKQLAsKD7LWmOPhK/hwnnIanmtXO28SzMkc6EFS0PU/MAAjD9fLESt4oLdKK8OdLVKzvjXnApSAsQJu2ekfMrvu2BMUytmwRJbWk00B2epqPt12Wg0QKg+mlV0WZ2YlPt3qczEOGcIrmLVWRedqJsr+32UinvoEKvFdU7x38hvuj1ntlH8OoFogFb3GQcLRIX5jXfHOFNkR3qJdXv9jXt1j3Sc9iDWcotzMGlxja/v5IWZpie9/wKY4BVGehhFfTHo6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by MN6PR11MB8217.namprd11.prod.outlook.com (2603:10b6:208:47d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Wed, 26 Apr
 2023 09:41:41 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::73e9:b405:2cae:9174]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::73e9:b405:2cae:9174%6]) with mapi id 15.20.6340.020; Wed, 26 Apr 2023
 09:41:39 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>, Lu Baolu <baolu.lu@linux.intel.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>, David Woodhouse
	<dwmw2@infradead.org>, "iommu@lists.linux.dev" <iommu@lists.linux.dev>, Joerg
 Roedel <joro@8bytes.org>, Len Brown <lenb@kernel.org>,
	"linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "Michael
 Ellerman" <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, "Rafael
 J. Wysocki" <rafael@kernel.org>, Robin Murphy <robin.murphy@arm.com>, "Will
 Deacon" <will@kernel.org>
Subject: RE: [PATCH 05/11] iommu: Add iommu_init/deinit_driver() paired
 functions
Thread-Topic: [PATCH 05/11] iommu: Add iommu_init/deinit_driver() paired
 functions
Thread-Index: AQHZctm2XiKCtCIF/EGYKHWLqHkLTK89YJdQ
Date: Wed, 26 Apr 2023 09:41:38 +0000
Message-ID: <BN9PR11MB52766930EE86D8D629258CA08C659@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <0-v1-8aecc628b904+2f42-iommu_probe_jgg@nvidia.com>
 <5-v1-8aecc628b904+2f42-iommu_probe_jgg@nvidia.com>
In-Reply-To: <5-v1-8aecc628b904+2f42-iommu_probe_jgg@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|MN6PR11MB8217:EE_
x-ms-office365-filtering-correlation-id: 22d80dc8-e5f4-4c04-ba64-08db463a6ebb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: N4/MAvswUw1QS5/l5ESCB5MyJ4bkYtQInR9sJkDOWRcBZLp2xu5chu0uB2lNQ21tJbe9WGSIqt8YryC1j/5Ik4muhNfw330amp68oOXaBJLX7psHTK2iEBOt2upwmQq2oBRoUHOssJNlEbRlH1B8L9Pu2MAc+JfD+3ZBuV/kVQgR+IV6Me4XFFM1LRwG/yvzi5ncItdKSajOuga1OUh4MaDHd2J5edC7mcDcqlZM69ZDJvRo3nZdyobGQZ5XCLA3sTKVGoX/Jp/wHf/+9U3+s2wX2wfCG4/+1kI7TYw5Zt4w3CPfNAeGBBIzNhmf4k0Li/rX1CQzavao/NO5Y+K9m8pUrQXkIye7rlNm+XPPy4OW2DY4k8IW8maleEWxMmPpS0E+xxW0+BV3dYhUvTkLZG3F7900MSCjvdg9BMpb1OeKVR7B0kBuySp6Q8urur5jrBiFh4WWpIrQ0Ad5F/SWCh/Oef5KeHhGlCEo9b1yCye5RtMVxjtEAX0V4Chv99jwQ9d73YojSBFI4vp2+NE7buSD3fr0xR3Q6zSM7Pf+v3pcrBwxgnBLn65366nKrZqycBO5lMDQbCo30iHBxWHIpQZFOHOUD+4VscN020S/irfbIHHHNKEn+JqRily0HhkybDmPFEvC++5HHBQsR8on2g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(136003)(346002)(39860400002)(396003)(451199021)(6506007)(558084003)(26005)(33656002)(9686003)(52536014)(86362001)(186003)(5660300002)(7696005)(71200400001)(38070700005)(8936002)(8676002)(110136005)(41300700001)(316002)(82960400001)(38100700002)(921005)(2906002)(66446008)(66476007)(76116006)(55016003)(66946007)(4326008)(478600001)(122000001)(64756008)(66556008)(7416002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?qdfsqBNjbNnCQ3ex99ER5q+crmlEayzjRq5ZZcK2tSuJ+gxG7Qbkf0xQo9Cm?=
 =?us-ascii?Q?DA/2xqqBKoCD9twKFoXM9fSBS/dum/8HUaDIjeKpD4ohpo+tgKSlSRi/N39T?=
 =?us-ascii?Q?/gHHheIAcSF48M+SzAop7Q99LrlWKPSfbbKbxIATrtWu7esl9O+7XvSGrX2I?=
 =?us-ascii?Q?ggvM0762FVcqIzKlvsYGA1j0crmx/7N9gO8TlP4lQ6DxegdpGvjlQNxP0HWb?=
 =?us-ascii?Q?7RjJZcEWzoRUUwW01r+GA+SqEVCahquwlEyElBBssKkt7d2fbZ3csCTvdqCG?=
 =?us-ascii?Q?Dv8iVPDFq3PNLf6Xz0hK2fshPuakYoTFSV+hNdu5GL23KykMIii55FF1Gw/u?=
 =?us-ascii?Q?9wOtShwO7pRPP+Dafcu7C9FzZvYLl8pPXC1jIz/HosjLfK5ijzTpseoccQQl?=
 =?us-ascii?Q?WxddosebkxjZPUU+i7G01kn5iY/mzVfwOEMBpj/qsdOcF5Eq2w/NWk/0LgTJ?=
 =?us-ascii?Q?KI+NZJ3ZPLfTMs/KuAwqzxohHEaspfeIydaesAjxssbeoqIyJzEAz/37j2Xu?=
 =?us-ascii?Q?mwBjuAGvFmtu92iK30aJxLdzvXsVvrjEaE0fK/VqNAAxviSEanRvqXVynBji?=
 =?us-ascii?Q?83HTw+QFX4CF1JB80cqnUAslqHyrF8TrcuZqj5nrQufaT/ulfwhOj6griyzF?=
 =?us-ascii?Q?O/RO3hgvWqAqTneHGpCBX9jXP4UJaZtpGHO3dZXgH4Sth/GG3wi+fbWLx5YH?=
 =?us-ascii?Q?dxDL8gu1ArheZb6YRx2wqTojn58rXi0wd+IgtIH/2Srojh1HNgRnp+wCK1Ck?=
 =?us-ascii?Q?8zvJPITM1mvqHtOD33nLm1CJy0wjuGJnJi7SLGJTUnTibtosF5dZKvoyPMa+?=
 =?us-ascii?Q?U0rX02E9aHkA/VMjh364HnawSXzyuz8pjCnCRNw0Z0mIajrzSE+CDj/Tin0K?=
 =?us-ascii?Q?cyIfR46FXuCcUw2ZsZPxDAUC1AmI7bx4HSetHqvUu3CsSMaEquX/IdV7lFsv?=
 =?us-ascii?Q?OjJSlsr4qOdYG/8MTViqUXCLixBWasT7OlIFudiocmEqmayvDOPW+wxIa07S?=
 =?us-ascii?Q?nwS7o4+Xdb4QjreOiY1c2+/CEZDz8z0WTu5yJNRjJ6Y8akoHRkoIiZqmvCvd?=
 =?us-ascii?Q?UA75MNgO5KchmOLe8kXPIifORXe6g0eKKyXbvKAcsZzi4xkpHKNdFYdmB1Zt?=
 =?us-ascii?Q?XO0F2RIcEKnDzh/ipKlT6Vn1tPwPUgj4vIY1+wjjU8wrX9ZxhYNAzTG4bV7N?=
 =?us-ascii?Q?BPMFLPBjpV4unVrOJO0G7BcdgF0kLWjdsEU4wDPO5hAmlzaSshwD7BcxJj9c?=
 =?us-ascii?Q?F3x/BmwcLbKz8ffxrK/gQG9n+NHoP0puWsBhCGJBQMCorHga5mFV6Xq0bw4K?=
 =?us-ascii?Q?J5WsZHNczV+K9a+QViFuYrxEYMgHLcAUaSgYCQOKdLNfUxEammDYC6R6Kox3?=
 =?us-ascii?Q?DBNCiWA+PQ5Cn0wn426xXuYLk0E80sFzP+A73XM2hZhqrYSn1vmb/01g/wCj?=
 =?us-ascii?Q?Zy7gnYC4oi2Bx5B+L8Fjem2eZHQGHP0WM3ToMbqnH7touWS8+6Zv0xzRdyeV?=
 =?us-ascii?Q?FUajkPYLXaz6bcdqvm3eFpbtdVFu2QiL2zGq7AOQ5fzbVVzTLNhVnUFerJS4?=
 =?us-ascii?Q?dbUAEQh1EuHiBR6NjOk5qmcjKIkvDot4IPE9aZn+?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22d80dc8-e5f4-4c04-ba64-08db463a6ebb
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Apr 2023 09:41:38.2836
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XNZ9qSTXxwFixI4K3WXQHWX25PHW6B0KD532a1e1TMurp1mR+XlQ2RQzY1XQ27JG5wbJXXidAh3nSui1CUp3/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8217
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
> +static int iommu_init_driver(struct device *dev, const struct iommu_ops
> *ops)

would iommu_init_device() better fit the purpose?

otherwise,

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
