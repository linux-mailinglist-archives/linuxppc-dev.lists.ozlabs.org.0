Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D446EF0D7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Apr 2023 11:14:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q5tTg5JNBz3cdt
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Apr 2023 19:13:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BE9CT25z;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.115; helo=mga14.intel.com; envelope-from=kevin.tian@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BE9CT25z;
	dkim-atps=neutral
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q5tSl1PqMz3cBK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Apr 2023 19:13:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682500391; x=1714036391;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=dGvb8sDaNHDAPR+6xUtcbDlZo3sVfyijy1U6fwslFLA=;
  b=BE9CT25zDo8eRZ3cjbwBTBh1w39yKEHFHB8tSz8TQczPcX/7fch/PPCU
   oCN+Db2z9uez7Nvpj3qK+DSvEOxd00jBXc7Hib99NSGINY8mq2+6rzLp6
   1jNfMQE/aR7qJRLe+Ms1ZNHk0hwuC13jAC8//f0UrSiVXrZMEFwx5i4n4
   U6OkxF3S7lqK/1fgb2GvOKkikX47qqhcpGD6SdZjN1f5WxIoVl+94eOHG
   MDsD/i0WgfubEU37bq44PQnPSOeD1xFWRV2pil6fLWExWL2kSrlrQbaTZ
   GlxL0YSpGKkoD7c9lOKCVICKGAE/HE3tY5Xd/paiJka9xBrQRM1KMHsEq
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="347073335"
X-IronPort-AV: E=Sophos;i="5.99,227,1677571200"; 
   d="scan'208";a="347073335"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2023 02:12:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="726457497"
X-IronPort-AV: E=Sophos;i="5.99,227,1677571200"; 
   d="scan'208";a="726457497"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga001.jf.intel.com with ESMTP; 26 Apr 2023 02:12:39 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 26 Apr 2023 02:12:39 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 26 Apr 2023 02:12:39 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 26 Apr 2023 02:12:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Grfg3uY+ZHgwN9+PEA46FGuwYKnO6Whri3k+uqljeiA6TsR5rnTDPJj3tnbZNvfQUkhwCnvnwjFwxDarctQfcBd1nJJf0ZvgE1IJ/1i9ML1WEARrSA22hjKNyuTjcM/1obGrFLALWaGpUh1/FxHh0JRd5OhhOeOhqkwAqQImgXCWRWl0Y0+4C/Ihbz/Fyc4645VPV6uaXAeFcvecx9nRv+m6Jt7CaLg/9ilXo0EHcqiFaxbG0l4iBUm2b3iqLdOs35pvueJfYu1kGBBrPBy+BNRh/nJ94t8K2ctJYuLMeMwbXrPPi7/lwhiPzXP6/lEqlQ/JU24g8DlV10Je2GXX1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dGvb8sDaNHDAPR+6xUtcbDlZo3sVfyijy1U6fwslFLA=;
 b=cq4sJtvVbpjFRdO/Fhr0FoVisKRSMTmUwuOIO+9rm9yHwPI0MGmFPH5zCOu6x2n01yeC4YCgulwQRqJXe2C6lsHSJTQyarlsRO4veUER01UGfQ/FbfZIeu5mX6ZDZjwGw5vmbHI1oYwcA/pYUSEUhPVsHctqKXX11IBBN7igjlF8BXcUpRbiygyCxH5XAUX3VFPVMwaxdx213scm2FVgsP8BCM2Sj5yrGN+vuvspBs0r7YpWU6piloKvnrC722j58xpodzi+5Q94u+ts/8GDIbNO1SHIcOVby5bEcO0JcgNyBG5nHRPhzlMuQLAwvhDsorxl3K1cw2Q6nqf19v+QNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by SN7PR11MB6775.namprd11.prod.outlook.com (2603:10b6:806:264::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.34; Wed, 26 Apr
 2023 09:12:32 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::73e9:b405:2cae:9174]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::73e9:b405:2cae:9174%6]) with mapi id 15.20.6340.020; Wed, 26 Apr 2023
 09:12:32 +0000
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
Subject: RE: [PATCH 01/11] iommu: Have __iommu_probe_device() check for
 already probed devices
Thread-Topic: [PATCH 01/11] iommu: Have __iommu_probe_device() check for
 already probed devices
Thread-Index: AQHZctm2lGJYAA+sKkmH3Xl20KTLya89WJGA
Date: Wed, 26 Apr 2023 09:12:31 +0000
Message-ID: <BN9PR11MB52769F167922BEB2305521018C659@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <0-v1-8aecc628b904+2f42-iommu_probe_jgg@nvidia.com>
 <1-v1-8aecc628b904+2f42-iommu_probe_jgg@nvidia.com>
In-Reply-To: <1-v1-8aecc628b904+2f42-iommu_probe_jgg@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|SN7PR11MB6775:EE_
x-ms-office365-filtering-correlation-id: 3a7632b7-72cf-459a-3da2-08db46365d8b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BizMZoG5vX84dA8ifU2472YyKgxs1T29QSgTquklCezDObqtCF/XstATyfVgFmEbEfuA0dE8qk79A9QtxHUoPL/Z4X5UawQPSHkPKruZjCvHhDjEU3nDpPA0NvQ3lLW0X+MmU7bPyOkdZleBHp9IN/Nq80O5pi8bR54zut7kSSns6gutG0XzR8RV84OnsVVVgNqP8H6arikfZu9mHUh4O5ujxX3BDhyOtGM0typlEjQUfmwZiXX9ccRdJo0RX0vQGgiI55acpHdLnlcTkoTZnCTA9QglD+zcHQ+395Ub8HI7E5owqo8wUN42zDcJwtoC4D8+llRLZaNa6KxLcmqOHH1XPqkNhhSA6W2zmHLyKwK2WLA6k7vta19qBc/QKLXoSUv6SsBuqLG0C0Sl7L+ouDjPJCQ3G5T+3BBR5FOc0ikpn/422E35JdLCan2qPVaJPbHxzmZZc5Es4doweNdHRbtHwJF1LaIJ4XIeElDbYqJxnf+R71llJn1Qd1D1okmo0o4usfZUhTDns+nECchquMnTdAJh2vL7VRHTuebnySCR4OLJlMXSwY/QSTjA21nmZ8Ia9q+aTtbuLvtzGAoUijmWIdhUCJTGveHkQqDRJ01QJ4561npsby2vcX9mLjuAaFdJwBXOswiIUBaOqdxtdg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(396003)(366004)(39860400002)(136003)(451199021)(83380400001)(76116006)(478600001)(71200400001)(7696005)(110136005)(6506007)(9686003)(26005)(186003)(5660300002)(7416002)(52536014)(33656002)(122000001)(82960400001)(921005)(38100700002)(66556008)(66946007)(86362001)(64756008)(66446008)(66476007)(2906002)(4326008)(41300700001)(55016003)(8676002)(38070700005)(316002)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xeBWUCVyKYK+XsNg6gUYku8BygoKLhXGOlwwbiSr7WBUr9rWBjvhq/o4SXLn?=
 =?us-ascii?Q?CPJ3lj/ZUoIPihvMoF8x59n2qtYTZJKt2dAwyuFWy0zWpvNXROw5w3GyAeiy?=
 =?us-ascii?Q?rsXN0f8DK4GkA4Sjy5XgvCOsSa4DE0BiTs4juWkYumtxAQMV4Cv5zjPWZwro?=
 =?us-ascii?Q?9ohhdYt9hqzyWy+Xe5LKG52Nt7HXAP2NDPw1APtQcxrnRgGH/6GjaeH/dO3n?=
 =?us-ascii?Q?gPEUZgpjm7SqWti58RzWUMl4oAdUxS/2IaIBqiaFNqF+TyHlHg0xjenxPPD3?=
 =?us-ascii?Q?2/AkK8QKmG9ulE9u6PtT8GQbO6jGwBt7OUuf7U3lLNVNdB44Q57RsgpxLsid?=
 =?us-ascii?Q?eXIo8pE/dmQqOsHGFVtSn6gXbvpmYjR1Nz7VmzAtCbsT/Mw7EnHrnpcvFCsZ?=
 =?us-ascii?Q?iPvcAiE8ASJG7r5KngaUqwCD65wL0RANt0PwSh/d9J514XgR+nceW0w+z/HF?=
 =?us-ascii?Q?8HWhMYhW6SNOJq5kYr00HKRcPHiUC8O89zIiPPS8EvvvzTySaDiGNCzX5WCu?=
 =?us-ascii?Q?Z8YkLU74j3kY/C+LqQbU81Oq3ty06S+8t7m3kWGq6ddFCFJaTjudhfLePDe0?=
 =?us-ascii?Q?BrY9RlwcfYwhvVhVzSCJfumt6lYbFZfPSRLHUEUJD4RcQEL+Z2wgq5ddQOgp?=
 =?us-ascii?Q?W3FEXSV3n3cCaIzEbESsMjK/AtHYhTBm1aALMscrkUtfAGpnjKWYV/Fcd758?=
 =?us-ascii?Q?OVjsZfGKEGEV3oNcUyWU/qLp8RMoUh4NukYjWQL3CMPM1w9skkFNHglo2yei?=
 =?us-ascii?Q?Uent0gy8SJywg3ij+FFWQ6MnsULSGuHSswOghv5are7hMPaw7fhMKjyqWMK8?=
 =?us-ascii?Q?c1Yy3yVHFmTSt86Y6HnSVUo31alIcnYRBdDXi6rfoLS4nJtn1/lJP8Bcis9h?=
 =?us-ascii?Q?mAWe3dsWD+7pxA7259J7fIIQqKMtn6Y0PPXPmp2AxwvDgDTAht9yIkgwlGy3?=
 =?us-ascii?Q?qKFzTvUt20AlYVmosV9+8ZdIcd+a/f3UOe38tnJPVKBEK+weBgYF0I5Yo9ar?=
 =?us-ascii?Q?VWRekqE7bejKOHJ5DkcMG4TYZW6dosR3akPgQrGdsayPAP2FrufHFC8y7K1A?=
 =?us-ascii?Q?3mF0CLxEsQgx1bST+Ba6MNhpuw7EoMUosB6yh2CEe1EFKgM3WD9eTsdydL76?=
 =?us-ascii?Q?+iZ2I/cUIou5+6ThyFoauJub+eKv68gLfavXqnarDVwNL4uAtlP0raw3pxZ9?=
 =?us-ascii?Q?/VcmzBH90wbWkDRXKdc3MCH5JxJIHSAHnjkKZibVZrKE3Tdwk41w5+RZ9Q6E?=
 =?us-ascii?Q?M7MhU2tIIN3UYTNAAWhw63ZPxNpBHUlhRVsS8UWX3HAlyElKpt/x4+DHR0zG?=
 =?us-ascii?Q?aPVBMaKwluPUEZ5zrP3xeYgb23mSV4Y4HRwMi8QCdu2o+lrXuTwqGgvhVjyF?=
 =?us-ascii?Q?TZNTNV+jNRmzFAaUL3nkLwJ7ThA7oZUaISnIL/AUzFnJDbgsyyxJU3BKYVzd?=
 =?us-ascii?Q?rNMP7GI9dHCmBWlPijVnSRS9JnCh/bXR3GvNpI9OSIJYmv2AC8Xhc8dmpODH?=
 =?us-ascii?Q?G2jccIIIzMcm1cvwuIvN6nphsbNTBcziFU+aFMYlSCeiDtYcPmBAxGqQXK8r?=
 =?us-ascii?Q?oPgdloopTu/hqH3QfWe/golBHOAHCKiBCEwwCDOB?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a7632b7-72cf-459a-3da2-08db46365d8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Apr 2023 09:12:31.4318
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BPbWcSWWqtiyPyCk1KxkA6T4ACgfqeAbFFiDUiCsT3iAqWNTl9kUF4/pT2I+f7woLUu34rm2aelOaT/vgfzc4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6775
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
> This is a step toward making __iommu_probe_device() self contained.
>=20
> It should, under proper locking, check if the device is already associate=
d
> with an iommu driver and resolve parallel probes. All but one of the
> callers open code this test using two different means, but they all
> rely on dev->iommu_group.
>=20
> Currently the bus_iommu_probe()/probe_iommu_group() and
> probe_acpi_namespace_devices() rejects already probed devices with an
> unlocked read of dev->iommu_group. The OF and ACPI "replay" functions
> use
> device_iommu_mapped() which is the same read without the pointless
> refcount.
>=20
> Move this test into __iommu_probe_device() and put it under the
> iommu_probe_device_lock. The store to dev->iommu_group is in
> iommu_group_add_device() which is also called under this lock for iommu
> driver devices, making it properly locked.
>=20
> The only path that didn't have this check is the hotplug path triggered b=
y
> BUS_NOTIFY_ADD_DEVICE. The only way to get dev->iommu_group assigned
> outside the probe path is via iommu_group_add_device(). Today there are
> only three callers, VFIO no-iommu, powernv and power pseries - none of
> these cases probe iommu drivers. Thus adding this additional check is
> safe.
>=20
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
