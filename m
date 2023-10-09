Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ADE97BD4A3
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Oct 2023 09:50:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mWfUBp99;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S3rmN3kDkz3vYg
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Oct 2023 18:50:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mWfUBp99;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.7; helo=mgamail.intel.com; envelope-from=kevin.tian@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 65 seconds by postgrey-1.37 at boromir; Mon, 09 Oct 2023 18:48:36 AEDT
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S3rkX3Cggz3c4R
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Oct 2023 18:48:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696837717; x=1728373717;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=D0quBJLR5UnhCAorRyYxQdnd1R9G716c2yJ8kLAtiI4=;
  b=mWfUBp99kkCYhui+DHrkoDiT0kxgyXS3GCphht4VeCEOzBx5hBC7iJb7
   Js8CEhCIoXAEiphTwm/7Ds28OBJnhSTaOIPL1QCwGM2i0+ypLkIRTE1BV
   h5CVxGgRUHBGCk6/JYVlS3mdtMURHca3NFAyjVteXHijcqLeYEtBlORly
   3htiTSoNmEdwJJbxVHmAQ5dWKVuYK9XziBQSn+5ZdXLC7WA8QkFGqS2GN
   lQMOHIn+xlUGwvWWhCUNc6Vra7XmM5nLz2V80Sj0KSCyGmQJm40lmwuOs
   NoQ1jt2YrhpyxRD8N/NL6t3oyJf+4lUt/kB91/GNoBHa92El5oV/8sLAj
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="5636535"
X-IronPort-AV: E=Sophos;i="6.03,209,1694761200"; 
   d="scan'208";a="5636535"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 00:47:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="746578581"
X-IronPort-AV: E=Sophos;i="6.03,209,1694761200"; 
   d="scan'208";a="746578581"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 09 Oct 2023 00:47:23 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 9 Oct 2023 00:47:23 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 9 Oct 2023 00:47:23 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 9 Oct 2023 00:47:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XulPgBqWKUd+ItzszAymYEPfpLsVRJEL3U6LHS8tNtfY47byJwbXppS188xSESQFYFYF8osG0ivfK75u2Sfo18VJPbWqVySKIGfj8taSgobpvbpilFfD9yW/B42V6RUXgmAYQgY+/lJgs1GvcnUbY129oDoH65Fc9AOm7BIOWfkoKuoJlcv4J0UaHn4A5yNWmZDogwSxoCVVx6qs31+usPlky/mtQSIkqiBLiJihFFdPgnBJMcTz1xNFxOiE0EazJs2Sdq79gvZIIrb7kLTceWgJoqamO2eqEiF+/wQ1TcTKaqOPTbnK7RZquZK2u7tnhM4ZwxHtbQMc03b/fces2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D0quBJLR5UnhCAorRyYxQdnd1R9G716c2yJ8kLAtiI4=;
 b=gLuAJKBhIWfFdalhA0CSTyv7MGsXjapusBBzyM3hcgXu1m9ELa+oDYqTJlEZIvvx9Gp6sCIUadp6jkUcJ4F4S7EutDKY68l9Fg4PBY/CCOkzcBg+oLF3ln6tnoQ6mLlKTk1QA1jKHnw60Uf7c6htpHoawwzseGwGqDDS01ZcTAiAZ2VghqZG+KJwmVaZw291knUJOvzRB3KxI3UMaHgCU0RbrBSQ2b8BZW251/XiUtkh4kWk7DXDDvKpcG2VvZ1NdsJYOSUgUYYzxlJyAtxswRGgCazJknnIC05UcL5kijm9jVPapfEi9CNYgmPClKI+PEM4VkSQbFwpvr5/6BkxlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by PH8PR11MB7045.namprd11.prod.outlook.com (2603:10b6:510:217::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.43; Mon, 9 Oct
 2023 07:47:20 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::7116:9866:8367:95b4]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::7116:9866:8367:95b4%3]) with mapi id 15.20.6863.032; Mon, 9 Oct 2023
 07:47:20 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>, Alyssa Rosenzweig
	<alyssa@rosenzweig.io>, "asahi@lists.linux.dev" <asahi@lists.linux.dev>,
	Christophe Leroy <christophe.leroy@csgroup.eu>, David Woodhouse
	<dwmw2@infradead.org>, "iommu@lists.linux.dev" <iommu@lists.linux.dev>, Joerg
 Roedel <joro@8bytes.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, Hector Martin <marcan@marcan.st>, "Michael
 Ellerman" <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, "Robin
 Murphy" <robin.murphy@arm.com>, Sven Peter <sven@svenpeter.dev>, Will Deacon
	<will@kernel.org>
Subject: RE: [PATCH v2 1/9] iommu: Move IOMMU_DOMAIN_BLOCKED global statics to
 ops->blocked_domain
Thread-Topic: [PATCH v2 1/9] iommu: Move IOMMU_DOMAIN_BLOCKED global statics
 to ops->blocked_domain
Thread-Index: AQHZ8Z0NP7zmL+2Ulkm3bE2RQvI9d7BBJilQ
Date: Mon, 9 Oct 2023 07:47:18 +0000
Message-ID: <BN9PR11MB5276F468177C01050CD200978CCEA@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <0-v2-bff223cf6409+282-dart_paging_jgg@nvidia.com>
 <1-v2-bff223cf6409+282-dart_paging_jgg@nvidia.com>
In-Reply-To: <1-v2-bff223cf6409+282-dart_paging_jgg@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|PH8PR11MB7045:EE_
x-ms-office365-filtering-correlation-id: 46e11cb9-0a5e-48ae-f9ab-08dbc89bf6ce
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5qZn+YsEX/iCTOvAdE3/X0wFXVGX4/P0+nh/xBmd8xoGzmThr5u+lB18W0ligmNfjFo3/PNefh0OBSqtnhfqc38uOtW0PiUUvF6Xn+TCtk78awYuB077oDYH7yokTl9v4WVGZqFtpM/TWzlhL2nKr2m31qZM3UMfFcUPz9w6FnqR49CQwqLNbIVsZ0Uq5REhkNNJzCLiqOjs7bZyEVRj6kdwsFxagKtW9fT1VmmAWJ3EqdWPKsiF5QobMekZn646BgE3dDQ+gLuHd6m9pU6Gdh6SVD0H5NJQJwEoRg/G67jLj79dZw8lcVB8ZUdZ9BhuDwxS5zhE3AkpNs1dS7C1mqCr2zvjX8wZLWLBzsgtb2YgupqXJnDpKpbyZoRQldS589eq1kY0nZUwFqsJ8J2BanS9dd2EZseQwI7ch725CXbsOdqHUWsxylp/ZNp5vo3zGwXjJmzU+EWhqg8z9GT+EYsW3yCLfvPSLvyBQtFoVzIDlaNxocqmIjH0MHARgnR/K765UHfM/EcoT4aUyACHJdiTwkW1OqQWAtYzOlQraH49cepxlTxokcN+QrP5wYKKdtTVFhTT4hRrdTDx5rYZacD26U6wgkENdQBdVCLVun7sAyytAW2NOUuh0i1i8WI6W+VsV+tzA2hxM8jxufPbjg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(346002)(396003)(39860400002)(366004)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(55016003)(83380400001)(26005)(66476007)(66556008)(316002)(76116006)(110136005)(66446008)(54906003)(64756008)(7416002)(66946007)(8936002)(4326008)(5660300002)(8676002)(41300700001)(7696005)(52536014)(6506007)(15650500001)(9686003)(2906002)(4744005)(478600001)(71200400001)(33656002)(38070700005)(38100700002)(82960400001)(921005)(122000001)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?kN7/dPJOc5xyzlpCVCy2g3hPV6QJGr/wU2xQzjfdkaksa+bEHFAsRoJa9QE7?=
 =?us-ascii?Q?CtCapsJFFLEnvg3t3B7iG/1SRdvNaA4pLso7IBveXhzNO0/pUAAyJcASSchU?=
 =?us-ascii?Q?5pIl7bqpHVycq9ZGR/ZNK7uwe2IILGlawuvarYPXY716xtiepxEqd/eNm5Gi?=
 =?us-ascii?Q?oQBRND0zcKx8JjratOnrUzLa6TbzC6PF2HfZlajNzJNLNlCwm2Of58ndoGL3?=
 =?us-ascii?Q?pXby1tQ4NirfZ/MZ90Ms/1V61ljPVm2oKPen91F5sHsl+kK6uLTGOCi4Gxid?=
 =?us-ascii?Q?KbqYqFJXe+MJ2DfXEohD6KOpxGbgtmH6Vc5X+oWrjy14aaYa7S7C1NL4sWvG?=
 =?us-ascii?Q?BUBEdhrnrH1v6ai2sxIuAQVjPJ0Wyj2UJkiaijLnDAWOrQItKqVBLnbD20KF?=
 =?us-ascii?Q?zHCcqqOnwmFgUO/bW9A6AiZ1oiE0vjVMDTgdyl4PIaDUS0Mlbta7va41/RRs?=
 =?us-ascii?Q?TQqY0LHMH9Z/pjdxvL0WSO0IVhwgz3CVb1iDLjRv/zh2kOFfHvbx7GarTvgp?=
 =?us-ascii?Q?aNoJ9Ff+FHnVQsr/ABUS+NEl0c4wvkhzRmOxV2gFy/u539LiSa5HlsMcGZrg?=
 =?us-ascii?Q?zBFvnx53JzBK1pNa8GLu36qssw2oe6szx1EIhYQxpixPMacDHlqckCNDH941?=
 =?us-ascii?Q?KdlSegoudG541xIyGoaEcMKckAnylILnnHLzN/d5IpIm+1osY3pxClVxLws/?=
 =?us-ascii?Q?VlF16vxcqRAguht2nOxHV02oq8Q22QX3vcVyy8uaRJcNlryPcQqGFeZcu9Jv?=
 =?us-ascii?Q?CH19nroUAQ89dQhFO4HP8pt1NKoLfPMoxqv8g0XBQuu3QGP3G/CCzOaw+sY7?=
 =?us-ascii?Q?uQd1ojBwMGQZzrjjWIgaFe8oZEQp0a8nGwpXC43AkMb+aNAKuyhFPMHUFTwW?=
 =?us-ascii?Q?M3HzKh6uLGpdUh6XlAOrIqQ/S9CFBQoulGPzG6YFcdcAgzR3jZ7k30t7E2ru?=
 =?us-ascii?Q?ze23lXFZbB/1UWAdQw7Dc4W9nXobaL8matX1r+KHzuhe8QirCf6+T2yKQmbP?=
 =?us-ascii?Q?PmYVm5rbyu/mLglu6Jp6Ssau1uu6kscY1cgYyQoL84XVm+0ryXyQnQSxe2uh?=
 =?us-ascii?Q?NEFEuHYMIr5ERf3my59cxZtfY6ovoQRv/nlb0YH394yfMykQrMiQu3USbHug?=
 =?us-ascii?Q?OKrLMda5+4KqHwob8l1+2cv3pQPTtZ4IInVm1lBXhDX26eA2i//qNRLGfdBb?=
 =?us-ascii?Q?sNjyMM0rGR3/mJHX4fsceFtB7UPrnBfRXiDsywDSFbUcXgu9wLKGLyO1B1GX?=
 =?us-ascii?Q?ew+Wz/tF5waTobT9IIgtQGPQdY59aw9islMVO/5icvEEfJ2c/p8xF79onXnB?=
 =?us-ascii?Q?qKmfLae/8BuS/oyNvUrpfWycjvkNOHqPXzy6KCNkMuLFoz/NG21Ahn0ZRQSW?=
 =?us-ascii?Q?AY/8S5K9RyMnpJNVNLFPHXIygBlZ3FAE0cqHzCyow7kfr12nW7GT0lto0gYW?=
 =?us-ascii?Q?nypobcvejVg7PP6HWyDmBHEGKiUqeZVBNmaCO5XWct7Tn7/nKJAAiwMDF2LV?=
 =?us-ascii?Q?rBDiQ+o4envOeIn2lsYkRSxPP0XuMV9jVZ+1AOVvyQ1roZEgmIuzDiPKr2mn?=
 =?us-ascii?Q?O4HZDFxJi7RVIXq4GW30jxIvXTQ0zu+yJBmskguu?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46e11cb9-0a5e-48ae-f9ab-08dbc89bf6ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2023 07:47:18.8844
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SfLfKXAfi0O+oaJWXpRX1B2Y+NO8aEl2jjGQS6egow5V/UI1a37W7RV1gSemoNks1OuU5AXsquFWpHrdAYF0gA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7045
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
Cc: Janne Grunau <j@jannau.net>, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> From: Jason Gunthorpe <jgg@nvidia.com>
> Sent: Thursday, September 28, 2023 7:48 AM
>=20
> Following the pattern of identity domains, just assign the BLOCKED domain
> global statics to a value in ops. Update the core code to use the global
> static directly.
>=20
> Update powerpc to use the new scheme and remove its empty domain_alloc
> callback.
>=20
> Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
