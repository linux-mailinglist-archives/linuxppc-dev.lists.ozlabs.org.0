Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 983DA6EF15B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Apr 2023 11:44:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q5v8t3lmKz3fS9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Apr 2023 19:44:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WJXK2xJA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.100; helo=mga07.intel.com; envelope-from=kevin.tian@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WJXK2xJA;
	dkim-atps=neutral
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q5v6B41gJz3cdb
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Apr 2023 19:42:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682502130; x=1714038130;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=QownQQZbML461lWFiyMBgkz2/4s06mv4cQUBMKAMqVA=;
  b=WJXK2xJAa8c8lBIptQIgMMd6aETfbIhlRo+RFQUesL5qeu7ukEZdjba4
   78wDqtoLx5zI0tmIcxdic+Z7W7qzpINIokfVYI4a4AFvZRzWuCByGoUTX
   AZzd2jjbBIvxqawh4roLWm6go+wACo0y4Sc3J3Nc7iRf5v2U9vPxYf296
   sbD29nWESWTOqkOMflUsE3VM38Ul/rbJXe3ssbsr1WkspCqdcrGzvAK5w
   ITqM3AGvrt4p2FCFwgEF/nqJYT+G3/B5RwhNOrgnBf8qZxl8SJecYPVx8
   RVqyUpORkraKdPp3JvdC/hviykMIcmMv+kFeYsg5IaphM0j4dWHOjA3KX
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="412367891"
X-IronPort-AV: E=Sophos;i="5.99,227,1677571200"; 
   d="scan'208";a="412367891"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2023 02:42:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="805429617"
X-IronPort-AV: E=Sophos;i="5.99,227,1677571200"; 
   d="scan'208";a="805429617"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmsmga002.fm.intel.com with ESMTP; 26 Apr 2023 02:42:07 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 26 Apr 2023 02:42:07 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 26 Apr 2023 02:42:07 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 26 Apr 2023 02:42:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aul8V5A6wv7Jhleme9UoBEYQJbLSM+UZUXR7vaKs6PUco4EMTfmEa0+mVo1aFqglr5TDWAi+qh1Y+cHHIo9hS3DnslKGOOrNu5IYA7O9gqodxRVWMFqOGssqXj1IBpkGnztidFgus/NTG0KWSxlDlB5B3jdB9YJ3XINdsOpMkua8a7HgnGfbCo8T5PtVEt0DwaUheuQjS4oNwlHlg/AeDwDTrUl11lkaHH6x4Fd8YafJXZmyzw3ITUDThTzeXzKzRS4gUenO5TEucGe0qJYwMOA3lfmZveS03hTOEFz1URm5MmYhnBY0zabCuvIfS4qfrBw5It4U20DJg4Wp+JX51w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QownQQZbML461lWFiyMBgkz2/4s06mv4cQUBMKAMqVA=;
 b=bUF/2SHQjYqtrVnYj67dMdc+ZteN3fAVunTga0dcTkrW3phyRJ6d6xXoXv1ceyP6u7EoShL0kcEFaRkyYD0GyKyxB1Y20GyQN1r35gKMLY6CVnjS+OweTdc4xM1FcM08JpzSqA6dYjvBHKjwPLZGJ6q2ZMae5MMV7Cx21ucE56Kv8MJAwafemDyhX54DTbo2w9o9iXZ8ALmucBPhfZrC6eNOnsD4yVFnFlKpH3GyjmD/DrgZfDaYE5A0icu4uiMybOLMfFPlLII9hy38So5DgqLvAnTnh6FecJd4Tg/JQrlTueLHZG73BgYoiL8QquBd3DJFWXBTbxkbBhXC0qgEVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by MN6PR11MB8217.namprd11.prod.outlook.com (2603:10b6:208:47d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Wed, 26 Apr
 2023 09:42:05 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::73e9:b405:2cae:9174]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::73e9:b405:2cae:9174%6]) with mapi id 15.20.6340.020; Wed, 26 Apr 2023
 09:42:05 +0000
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
Subject: RE: [PATCH 07/11] iommu: Do not export iommu_device_link/unlink()
Thread-Topic: [PATCH 07/11] iommu: Do not export iommu_device_link/unlink()
Thread-Index: AQHZctnA/dyaxruGYU6A3VJ4esrJDq89YPlQ
Date: Wed, 26 Apr 2023 09:42:05 +0000
Message-ID: <BN9PR11MB52760F10DEEC349B30259DEE8C659@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <0-v1-8aecc628b904+2f42-iommu_probe_jgg@nvidia.com>
 <7-v1-8aecc628b904+2f42-iommu_probe_jgg@nvidia.com>
In-Reply-To: <7-v1-8aecc628b904+2f42-iommu_probe_jgg@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|MN6PR11MB8217:EE_
x-ms-office365-filtering-correlation-id: 1e37e909-43b1-4807-a4db-08db463a7f01
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: G+qhBz2p2Q5NJQ/KtQI6l9w+08TNiDo5baLn4yVXdXtz/E8uFvHBtAXy9+slnQSIGEFn/8qfm+co39zuE01PL/CdCB2k/FhdfVpE3cfKn2v804WhZLvT5bFO2u5AM81aWzr+ivKNny5vDOn2I0d8V4YBEgjVEqkne+aTU0v1ilTqb03lBQm2ZUzL8m5XM4lpniiN5vC13J2SqP7YJuut6J1jeuP8AqhqlKrUJdUB40h/bCJdt4MnYZvPAk9LGToHBz/l2yHtUBdG8Z9YfdpD8yV3JOK4Q3U5O8aUjLCqqed75iGu2Gm6E3AuI5gdf9xiCLuF3JRyvPIT6NHmah6OMqoRvMI1EbkiuYUvCmL1+u2VXzmECWF9I91EqgjC2pNSBA6R1g4BudMhcf07o1j5WSd56ojLQMC8WQFxEN9Rxjra5DOunw/+D4Fmd1Os0KrQhavOZ3e4iUWmj3VclK8ENZeGG6XgphW0fsQtSjkqM1yoSEBrqLXMalDA1l1rOLiKg2yxZ+UYfzsUtjMdDYPJnTcWrD8WJOvMFwJuZoCDActk/NColRE/2QrA2FtYg6FT/DoCbsSY7IUiUB1LeHAZxVJz09j+wjMsKQKo4qTJeoBijGGhVUNQP8YpXB4l8i9lS+R67eKz7MTF3EF+yG/x3A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(136003)(346002)(39860400002)(396003)(451199021)(6506007)(558084003)(26005)(33656002)(9686003)(52536014)(86362001)(186003)(5660300002)(7696005)(71200400001)(38070700005)(8936002)(8676002)(110136005)(41300700001)(316002)(82960400001)(38100700002)(921005)(2906002)(66446008)(66476007)(76116006)(55016003)(66946007)(4326008)(478600001)(122000001)(64756008)(66556008)(7416002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?5u1Qi6oFgkLCA9K26IDzhhI4dTdHjJ8C+lt4/WyNx9iSMwiKvz+4J98Wcggb?=
 =?us-ascii?Q?tg8cX5DIOcZT7Vr1db5nAgF8GfQyeCWoy5gSwxPVAEaCIDNsZJ8ImavkiJ5H?=
 =?us-ascii?Q?Y9OBAfediW085RxqxwGocBgqqV61OP5AgSSuGDfBOUC3dpkNOwD/0bj3bLiE?=
 =?us-ascii?Q?F534abhfjxCEDrR24FlzCXLuY/iCh+ldKBMZULP/QiIcpLvovU/rexN0VfUD?=
 =?us-ascii?Q?XhjBXl9zxCPacQxttCHOfzDnBRu5Uh+dbFx6mN1SeQxt3RdyTk5FAXFoYpER?=
 =?us-ascii?Q?ghPgLPC1eDHME4GABu3ZVrJ8ci+fCUDCMrsquqTBCkxECsfnN6QDVWo1cxTC?=
 =?us-ascii?Q?WkU+uE2ji5/0kbjiU3zRXbfhWmoCgjs2a3Jow195j8A7hGpWWsn3ewZHzDKc?=
 =?us-ascii?Q?7qc/RYdR/yrzjR4I/5DVw/MW2gRptKRKz+QVQ2ZhqjF5RAIZrs3CUSSmFwXa?=
 =?us-ascii?Q?QaQPouqU64shWhygxGYj6lzYyw/fUK46a8Z/6wdVuVb5PSQRLu0vDUoJWsa6?=
 =?us-ascii?Q?/UvGbqqY/e8O4p2oeUUMTfz6iHFncGn7mD7/88Mci0cz91I1xXkJa9iSN+T5?=
 =?us-ascii?Q?7yrXCMWZEWColtLZwI1KVq7X1ZeqBNBgZSv8qZbTujVN061gNhN1rvlZXZaO?=
 =?us-ascii?Q?OqVwu4lC0krqy6TBSfpBLlMvwfZF8h9gWFlkU6L2vXkPF9V+wxDy/hh50Q7E?=
 =?us-ascii?Q?lPtmArk4hMMhxkWTlSKFwaF13RKzsOnFfRg9gErCp942BvyDIybRw9J722uc?=
 =?us-ascii?Q?dsyYVNrSOWJmXmQf1iEyoIX4oxbMewKAwUSTbYDZuDAuOK2RLhnoTQwotj0S?=
 =?us-ascii?Q?eMZm+wPlU1GFoxxQsx0T9JM7q6MmtaZeE+67SS737RKYZMmUdoUZpK8PnHDO?=
 =?us-ascii?Q?/yc08Wfi3ypQ1pkwTw8K5aJ2YoAbJyohr8zHm+3v8apjPbmZL1snBZQux+W+?=
 =?us-ascii?Q?BgNxxv/zr49+h2vOxM4/Hco966xxNDFIOB9ZZpBZy+rzPmdRCStvnVowObrq?=
 =?us-ascii?Q?Z//X9QnMEvz3Bn2WECtVCj05URP69coDHTvGksC7LWUOi1StsJEVnE3Uav+P?=
 =?us-ascii?Q?vAnp0GryrYOT3Z0I5uyy8QTnZqIf5oCrCCLam16T0u44wEDcIrsRBFcNSVSp?=
 =?us-ascii?Q?Qw0OlIQVpuRbKXOpFJXB2/fVgEQ2ipBXZ3/EfgTcktBHDGzgpvrqGXDVAGSP?=
 =?us-ascii?Q?DpAdwarqHSxXVoQOhyscwPZL5dJ7LfkY2xnqPfeuJSQdkKyMf9Q/jrcIt3eF?=
 =?us-ascii?Q?Kq6pMTAod/L/UB5Gsmc8fBbLOXPTWoytoNqxipU+/vBpkp8R6bwwPXb9bYgs?=
 =?us-ascii?Q?tZozc6ud53AKzu2dhfBdGMwxqY702pxu5Ad4+6w3/mw9e7NHJWEIis3VX//j?=
 =?us-ascii?Q?Am6zJGluYmp8YSk1MsMHwZR643IA17wgDn6Joacu8/hq5M6kE+82FC9dmnLD?=
 =?us-ascii?Q?lTq7IbtTuVnOqPoP3jRahBMlmzWJTEIKPKa9lAX5zgyQrRfh72o1LhFibWw+?=
 =?us-ascii?Q?WnDNdjixuVP6mbL1qAeq9gh/AFDP6n3VDcFoQDIV+BtA3PGBI/a8VoxUrenU?=
 =?us-ascii?Q?rCgpcxqKi4aufEjyITsUorffEbP4Iz35wKrsypUp?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e37e909-43b1-4807-a4db-08db463a7f01
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Apr 2023 09:42:05.5726
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZWW031/ftQmpTCLzmadvE/jI4RDNJ4YATji3xJDi6jrihVRKZZxUC0B7MM6PM/NYpIQS1mpqfkNYrjmplJdeXQ==
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
> These are not used outside iommu.c, they should not be available to
> modular code.
>=20
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
