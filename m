Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F376EF157
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Apr 2023 11:43:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q5v7p1FJ2z3f57
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Apr 2023 19:43:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IPuYdij6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.100; helo=mga07.intel.com; envelope-from=kevin.tian@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IPuYdij6;
	dkim-atps=neutral
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q5v5y1Stmz3bdm
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Apr 2023 19:41:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682502118; x=1714038118;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=mDnjvYgsbKVEKL9IZcrC+zoSEIHKGJshL06Ebty+MIQ=;
  b=IPuYdij6fOcDAAHG8W8nZKSIFTCot2QAcVPo1UUx2dHYHG5LbGB8hwsC
   XTlrhMCaQuraYQaxIHgfOIonfgbh3nk0HAt7xKUaSXtsqjOOp7mer9jVc
   7XznzQ0I1mGeO6f47Pjt11UJ7MoKK2K7aZKf/PKdNfwuiEqbjtMhJkXUS
   IGlFRnSa8nejGDJuFSfuGIh1q+ZpmOm41/GvVuyXvk8HDXzB63GxGDzGF
   DInNtwlWZVVEfpSxrFmYZTNLP4bUX4SGfczYR8lZatSum7q8afLa45JoT
   KxEfMLaNTmFfmWWqt4euew8ZDEU9dmo7hzHLLL1VCLVGIu9I0X62eVNie
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="412367849"
X-IronPort-AV: E=Sophos;i="5.99,227,1677571200"; 
   d="scan'208";a="412367849"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2023 02:41:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="805429598"
X-IronPort-AV: E=Sophos;i="5.99,227,1677571200"; 
   d="scan'208";a="805429598"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmsmga002.fm.intel.com with ESMTP; 26 Apr 2023 02:41:57 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 26 Apr 2023 02:41:56 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 26 Apr 2023 02:41:56 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 26 Apr 2023 02:41:56 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.106)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 26 Apr 2023 02:41:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NBBzYVwIXO7MnCsNAhyGSN3k2JssrF3T6t5OxrFtUfvPy+E/oNjibAeS6mnAct+Bgg9EKCflhsviFBxQ7R8i//Up612bUxU65Gr4bw5i1vf/Lx5AP7nKwQd1kKNa5ggLMUxNYPLSgiL54ENFQAng+NV3d7YhdFk83itQONzYdzZq1blBgxDMegSS7DRCMYA3wW5n9MzN679OeGQVJ8D2clhIHGjExuoKZP0pgLy1HgB/kEi76rg0xnfyFxrdXZn4BaoSJbqwCP9MAeL7Lph61sJMmeSl4oxyU+FCH+fepWWeor25pGpVnCdJK+WehH+uCbukmWI1mdakXr5GZo0ABQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mDnjvYgsbKVEKL9IZcrC+zoSEIHKGJshL06Ebty+MIQ=;
 b=jWL0Og7SHLt53ETEo+n0EJFxtI5egtKzkEz08sJfoYPFjpqst347iX7RQ7aUWXn5o/oIPwVWhomw6sWnGlyVVjJvryDJnVFHzzc1wjV/L4pdluR20y26k3RvTZWKQm4OtaRjMPCl5hCyN+j82J63WZkhF0Qvj+RjkBTyCR5gTsCoA+0cijDftu+XyhBQN6WFY64ZuIL4r75sxo6Oxwelc4OoEGXt51yaykta4acqqX90MuBuRAKHTqxdeWnVlLLZSYnIM+JduGHPLR3HG9hiMlaLhvtIZ8THywQb0n6aqZ5BSoLESalCX8g/Uf/zp71KY9ChQrZ+uSvcLHhxdaXkhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by MN6PR11MB8217.namprd11.prod.outlook.com (2603:10b6:208:47d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Wed, 26 Apr
 2023 09:41:53 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::73e9:b405:2cae:9174]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::73e9:b405:2cae:9174%6]) with mapi id 15.20.6340.020; Wed, 26 Apr 2023
 09:41:53 +0000
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
Subject: RE: [PATCH 06/11] iommu: Move the iommu driver sysfs setup into
 iommu_init/deinit_driver()
Thread-Topic: [PATCH 06/11] iommu: Move the iommu driver sysfs setup into
 iommu_init/deinit_driver()
Thread-Index: AQHZctm2GO0ss6g2Y0anofRhYMwVGa89YOiQ
Date: Wed, 26 Apr 2023 09:41:53 +0000
Message-ID: <BN9PR11MB5276FB57E949688FC977FC3F8C659@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <0-v1-8aecc628b904+2f42-iommu_probe_jgg@nvidia.com>
 <6-v1-8aecc628b904+2f42-iommu_probe_jgg@nvidia.com>
In-Reply-To: <6-v1-8aecc628b904+2f42-iommu_probe_jgg@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|MN6PR11MB8217:EE_
x-ms-office365-filtering-correlation-id: ac380bb6-27e7-4a91-c88c-08db463a77f6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TivphxMEjxvwTGLie/olgwrUxiEpfV5IRBS0ouRT/fsWrnuOCA3PS4ISB+2scip2mJ2ci/U95iJZEjPsFD+BynGut5KQD+D3SFGZrh9siMYP3rKr5FModqnPCVrVyOfGqqruc9ZdGYoDTmNxYzn2b0S/4VE7XoCwYoJirpMTqxUjQRPeOuLFjvoXuzMX+NXQ2GQ55zFka0/FbxDSKpflrhHDrpOkQeJ2K/ZnB7eRyBPpFiVDHS2f8HkEfsMbT4O7LpjQwDKDfOipo4rLgg5K4OOilAjc0S1MyXCUWjBWyJLux7LG8X/m2oM75J9AkUF0ueHUJFK9wdMJDaiYyEqZk+RZATLYOPH+q6rnC/SrPwo0o5QUeD24GgrngTZItO4uuDFBGwU14kHK6TWZFhaLwAC8NESJUoliGpdW/5P7mwQpke+hpg1TQqsOHJfZQs2J3DqXgTrn4z0FtoiXPlssfB/m2Kor5TjWcje5Nuta0kkBHtm46nPJFZrHNqfNxlQn//R4FU1bcBjjwFF8COz8LvwxBmaP1DjLqsqPXdxdvkBtk957FjIPaF3mw1wlorN+YiubpEjhOQW+6SwAGGALCqomWszLrYk0L1rW7bwf54TeVtCUr2LqY3SeKvbWNs4JAv/ryOBc6sPyQiSt1i61BQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(136003)(346002)(39860400002)(396003)(451199021)(6506007)(26005)(33656002)(9686003)(52536014)(86362001)(186003)(5660300002)(7696005)(71200400001)(38070700005)(8936002)(8676002)(110136005)(41300700001)(316002)(82960400001)(4744005)(38100700002)(921005)(2906002)(66446008)(66476007)(76116006)(55016003)(66946007)(4326008)(478600001)(122000001)(64756008)(66556008)(7416002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?dDgIwb5+KjvMJcKvPjQE/DmW/9Xbm4AKWQcWb/YXEQ7g/dAClYIDJyi5L57n?=
 =?us-ascii?Q?jXgnXVycmt/TPUJotDOeLOSh0SRTKe2g8LbRXV4Yvaqh+afjXr9uhDySo8BP?=
 =?us-ascii?Q?GZpMCoMZlYAgKlMN/vs4rGf2VIxwjc1c7I6NSyTSesV+pmIhVuA92gMnHGCW?=
 =?us-ascii?Q?+TtgEMCQEa93utBuqD8epil/u+uWt6pSx0qYKaqQ+VRNKyJwcqXlUzvmjje2?=
 =?us-ascii?Q?ADd6xKYPngiYdFFIugRQMwFn3fYyFIlpFOVqhh1JX/nSh02Hx1dr8oDMEXcu?=
 =?us-ascii?Q?lcj/d7bQhNuKKqjbLMinSgE39ejIgqvEVdMUunmc146+Px4cwrByy2yerOAU?=
 =?us-ascii?Q?V52t4D4kI5Y7vAUCCuWM3/PT22rVehQJRZUOMXl1LbtTxpTOrj4ng171H1MN?=
 =?us-ascii?Q?QPAs2SOIaEZ0WRYNfx+XTJGfEuslOaKkCfF8+75h+JWlRqzOFE8DOyxU87a8?=
 =?us-ascii?Q?+pFPBgch4BnQb36Dozv0JUaiEUL0/+HRyu6kida+wCnmaZ8Ac5gmswGaJx2K?=
 =?us-ascii?Q?zf/q7K7VZYxvv3vpz+L2hDk0Kso6GwjGLL4cnf5nLSLOYBs7oMXcKJtL6t0/?=
 =?us-ascii?Q?M0BYjUfunam0Mi1kNxy8qOK8cKzBz6BjJfjajOlD+N8/S3FNfa3xt+NWzEd7?=
 =?us-ascii?Q?b3eWO6hu4QGI2Cdjg6ZSd4/VYHMEptKAM65RBga5HDMtC2zsEC3sOeJ4ihYQ?=
 =?us-ascii?Q?N0agt1+NAd5YAopstb/4aeffaNHEkc3eV+ryRGUbrnT3hQGHHO+K+OIGmX3I?=
 =?us-ascii?Q?8J7BuGHa/lVIXU/9qFv/CgI4M73iF9kJ9aMsjDX6tvyzEeWLl77UduxJqTFi?=
 =?us-ascii?Q?Qwk7yyM/b/JQMaKFLBkJTa8Yz+0EvQvRs0336b1m6itfhOfEpSJGvBKbGhol?=
 =?us-ascii?Q?kpHf015+VktF1AB/M3RjY/IWkwyXp+XGRMrHM8tRVPk1XpXcgyTJ6vvODshp?=
 =?us-ascii?Q?LTB9N9LORw31qZcXC/ut689Dh9Rwl5l3UhD1L3+Bwd05shGLI86NBVfyLXHE?=
 =?us-ascii?Q?5w1wDKHwusOw6w5ACCQCN1tGXjd7KFB79OYaRDwlFBFKh3cdNb+QX+ZVK48I?=
 =?us-ascii?Q?cX5NmjfyoECSZwguU/PZyUgqkJhy/c6eEhNEMweJlHIVG7fkGOB1Qtp/a5Cl?=
 =?us-ascii?Q?lUoh6wjtMJ4wfs9FeHwC+BZ0aU18BFbLqFnXemmDwXLPbhJXKHcZIGcZBKru?=
 =?us-ascii?Q?NHBum7NIyscZnPIqg9nBojJ1f4EXCMRirWYK0tNOLO9V8sETvClj1XOY49ZW?=
 =?us-ascii?Q?B89RWKrgPAV77tUcrb1nytjHWokJiUgJvXrVbL+KlgNzJ78bb/JPIlunO2Wx?=
 =?us-ascii?Q?ULifdLiGSvR5ySFLdnbx+r22Kwz2cVTFpxVoWcH1zUk1BJvtywXuv9hFZ9lQ?=
 =?us-ascii?Q?QJ0c3O9vAbSRMASQ+dT6KBfacKEQqS/U2K/nuUY1RCASiNXPNWO01Hf3WC9K?=
 =?us-ascii?Q?lGlqfQnS11lAr0xdMDNcUs4w0U7FtS+0ihidt0tYcRfKbIOh/5gtELmLRBIA?=
 =?us-ascii?Q?6zm2jE7I2QamAA9qWhPVar9IyTogN78apIAG49xOTvZl+N4tcsgnJlx5NXIa?=
 =?us-ascii?Q?+BAs8lsOTwqFPKsnAVWCK+YpMfPBEH+WGeemD6/P?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac380bb6-27e7-4a91-c88c-08db463a77f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Apr 2023 09:41:53.7542
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vtvXKFBBUCPW6U1LlX7ssJrnS+sNkrWEV7jL9JU+BRWcV+IR1FtaYMUEICSWWWE1uQvQ7MIkNOeq5sGhZgg7Qw==
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
> It makes logical sense that once the driver is attached to the device the
> sysfs links appear, even if we haven't fully created the group_device or
> attached the device to a domain.
>=20
> Fix the missing error handling on sysfs creation since
> iommu_init_driver() can trivially handle this.
>=20
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
