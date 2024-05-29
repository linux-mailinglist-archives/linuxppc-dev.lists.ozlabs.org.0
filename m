Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id 3DE788D2CA6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 May 2024 07:41:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=meRAdbFq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VpyjM06Kbz79nf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 May 2024 15:33:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=meRAdbFq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.14; helo=mgamail.intel.com; envelope-from=zhenzhong.duan@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VpyhX4LxNz79FM
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 May 2024 15:32:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716960781; x=1748496781;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Squ1HrT4tteCSlz8ZqK9cqltzxzi4y69907LxSIdEFk=;
  b=meRAdbFqPdx0ys8pCdY4soAIspSZHi63VIeXFcKtjOtar1eG3TpqcTd/
   +2MZ1lO5GGwqk3b6J10FFWMpLnpdwikpvULTb7ed1IG6gZpOLV63YhV0w
   cHDg9WFismulDQFjJmlshghDayLXwnbzhUu8TuWyxxa5A3Yuc0RE4sNvy
   8u8HSwVaGQUsEZGFSxvgBy+cNR6eEXoBsh2DighCI1HOkAzZzxb6VNwod
   nla3VihfWA9YHaODHNIoF25LTuEj+P1/7N3kKVWmlxTE1v1kUZxtXQ49/
   Z9no1VHfxrzJJJapXincdAtVKS9EHvkiaUIL2QiqRNFrNlXEYy70PNaGz
   g==;
X-CSE-ConnectionGUID: dIy1n7KeQOyIwZffz+sPoQ==
X-CSE-MsgGUID: cp2Dc7sQRau8CXNHmWmDYA==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="17174706"
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; 
   d="scan'208";a="17174706"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 22:32:56 -0700
X-CSE-ConnectionGUID: jEmPkolKSRSt2KttTTNoGg==
X-CSE-MsgGUID: jNx9bIIoRqeFvn1g2w7o/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; 
   d="scan'208";a="58488595"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 28 May 2024 22:32:55 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 28 May 2024 22:32:54 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 28 May 2024 22:32:54 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 28 May 2024 22:32:54 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 28 May 2024 22:32:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A/fyz55hQ4q7DDfJ3KkhblWvgnhMC1kKRhgB+PvWrTDuHQQP36NsLq+J6FT4bfw6SlS3zXofdLW2MtcsQmE8Mz1QNu0lvBR+3ErY8SlEl6TpiCTkW48iaBD1En68I+jsjd26WOYAOm5AQi2UDzJ3UOT1zcl2YNqWAJ3zzyTPENaiGSVuGjYAx70Hoy5hVh3Kikg4lKBl8ouEDGzSP9Wvzwx6C9M3AGnLNICu2dgVnzXWIYNNBfrrkHKDRjc0Owlcih9qveaIUknbEOCxtow9IDykP651ehrAXIuQEy9/NAHojaPf/dqbgk5coLWYzPGOBpfskri4i5LJU5FKHEubig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q7JY5gVeu+W8cSUaOfirR9bgsOHBXpWfO5lYsXMVzkE=;
 b=fmXFJker4xew3mO6fyFhX8z6EDtYo+0f+lXt5XUZ9kbNddEnveXdO7Uc8uN14GLbnY9yokf59sZg5Xp2/lPeyPmbtbmM6xJEn+MR9QuA2XzKZIQVSOJ+fJMan3gMPG2HRvZcAf1uX3ppyMkOA1wDx0MblqcuSXyCepgmxPX5fVVzeYSNeld1ZHvCyoEa2O1R5g1pjkCTqliOzGKcvqUl2pZP7yrMyVAQ3NKTyQcsNK3guZ96RziL712hqwY0dllvks+tqesyG5tp0o+94uVYFnRsYfAtmnEGZRhrLg2K1rD5e90K6iZP6ScOLiXxQuESp+nD59tAtGyvHuAzEH0a4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB6744.namprd11.prod.outlook.com (2603:10b6:a03:47d::10)
 by SA1PR11MB5827.namprd11.prod.outlook.com (2603:10b6:806:236::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.29; Wed, 29 May
 2024 05:32:51 +0000
Received: from SJ0PR11MB6744.namprd11.prod.outlook.com
 ([fe80::fe49:d628:48b1:6091]) by SJ0PR11MB6744.namprd11.prod.outlook.com
 ([fe80::fe49:d628:48b1:6091%7]) with mapi id 15.20.7633.018; Wed, 29 May 2024
 05:32:51 +0000
From: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>
To: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
Subject: RE: [PATCH v4 0/3] PCI/AER: Handle Advisory Non-Fatal error
Thread-Topic: [PATCH v4 0/3] PCI/AER: Handle Advisory Non-Fatal error
Thread-Index: AQHaoe4Ux4R4hNcGZE+MxU37vUhLVrGtzddw
Date: Wed, 29 May 2024 05:32:50 +0000
Message-ID: <SJ0PR11MB6744795B3426AA104D504B9992F22@SJ0PR11MB6744.namprd11.prod.outlook.com>
References: <20240509084833.2147767-1-zhenzhong.duan@intel.com>
In-Reply-To: <20240509084833.2147767-1-zhenzhong.duan@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB6744:EE_|SA1PR11MB5827:EE_
x-ms-office365-filtering-correlation-id: d2d8943d-31c2-4f5d-82d9-08dc7fa0c83a
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|376005|1800799015|366007|7416005|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?eaaRHpW2A2RJR1UzXOT/dzQl/dpWmolzzvWMaBSlRPX0im/jSJhoy2EuSvg1?=
 =?us-ascii?Q?pg4YX4gRzxh7B9sfk7sT9xOQbw6e1ZdAAzpJI9jCkPvmwGisVgaGym9IqpMj?=
 =?us-ascii?Q?2y+0JS4R8F8z7kYfQdOGtMmtfc0CrBuzEwDHY1oAvPwNbWdFqzoaMt3cgj1b?=
 =?us-ascii?Q?TC1FF9Qe9EKJ/A3cToAU/5tlhABuYaUl+pw/aLPr9GDZrXP9DHp+Rc9yw+3n?=
 =?us-ascii?Q?DM0sytKxwrZ2/YkKGDR15AY4+Ipxu/MGSG/uqO4AvmVDpLCVA46xvT6aZtF8?=
 =?us-ascii?Q?9a7f+zns5/eDBAhVYIBtEHKxi4pmE+aNkXRO0tjaWMyG8JeltDsAdVOlnQ5r?=
 =?us-ascii?Q?o+xVhrUrGhr2YCKczGbuzkbOdWqurocdtZw1Cc77n21Tz7IM+sF9hbEcZ7T8?=
 =?us-ascii?Q?5Nn4xosfDtg9/2cVGDl9MYCCgZPtTsp8ZN2QXeLkALLnyLSMpmhirapZwJHS?=
 =?us-ascii?Q?PtDfLAxn0SkGQzBH1edtr5WWd323XP9XW2Jly3EYiqEj8allozognwI+XlgM?=
 =?us-ascii?Q?fFL+AwH6HahGlsMSOLlVQqMzGzWAEvA+UnAJdJLDbspKP7/Ki7j+hRS3Kba2?=
 =?us-ascii?Q?eNDvbpk3AZFTYXz54Har7yVFMKmusXn059X3hvMeATWFXSzAWyhbhRoKZY4w?=
 =?us-ascii?Q?f7Jg9w7+biwjruNTtBZWDMwdr+FXo95ofPwyrdBbkiY2dA6PRFD9GlKr5Pbc?=
 =?us-ascii?Q?Sw9/J3NVfG5/Eo9DI2D6ov4wFl92DJL/XCgDCvGEaGmrr/ka2YuAzNEqhTjb?=
 =?us-ascii?Q?7LbzskhPAKWtysf9Wm0ZY9TkWrX3qPdopqcUUJvEKveY76rVs07TRqg1+6R3?=
 =?us-ascii?Q?yJrsojqatxOXsoq0Jpea1H9+Ql1t3BEgoYgcqago6gnIYIXs9Rpes9dVL2jk?=
 =?us-ascii?Q?YWfge5zZPCkL+OKCp92LrXTdoSuAvNtjigl+BeGSoutOt0nFTEts/zm6OsTa?=
 =?us-ascii?Q?yBunAJlzCAvt1QeBN1OfcBemML3fdijjIoDiu1Txv9ltjBi+0+LTJdj0XzgX?=
 =?us-ascii?Q?Y9ff3nPvm8gpeoiCihin5wjZwBmqp7nkaLZs7svY+PX59l9x+FhKGpOIan3C?=
 =?us-ascii?Q?hhoOCQ07SxmAcSdJ6LPrgfbXqfl8QmS6w6WBI/EMuziYQyPKR2SfxdR/aMmF?=
 =?us-ascii?Q?jXNrluxgjPkrlXgzkKov3UvRQwBRUbNEFi0sId8L48WqGWphFiqGyO3ry0TU?=
 =?us-ascii?Q?nf63rf9mDf5N/wrG+uN3mTnEKteeOq0gmEq5o6Ublmtna/Lh5rnKX5UvYbwV?=
 =?us-ascii?Q?5fITS8pQrl9rnjTV7OuL5zuflr/XT0WhXK9UjOJ1acdVWdemmlKddlLSqjdG?=
 =?us-ascii?Q?U+k=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB6744.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(7416005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Yn/RHgP1EZnIwtCFaCkW6xI+OUbh0GYK6z5EuOTAcFJhf/PFKWdM+w6i//Gw?=
 =?us-ascii?Q?NMpl4xp8iPN5r9PnO1Ai0S7YpFOAlBEi2hrtbUCivlDWRgCopvbbGjtMvws9?=
 =?us-ascii?Q?rQ4GGq9Mj8Lrh0KJ7fLVA6tSV5TPqnOaBdSUJbwUGwBr/4t3jgqHGUEchrkW?=
 =?us-ascii?Q?cTYuUgowVd4piBaQp+Q17BgssASIySFL+G05CAdjm3w1aiZy7rs3kur8/VxA?=
 =?us-ascii?Q?gdGPnAErb0PNP8Po7utSQ3DwBBm5K7jtTiOMSkymbmhMnFVkN5kegUFxV/eh?=
 =?us-ascii?Q?6RL8x7DO66eBIJVmw/YckNpN9hiwfDqveO9hXdBEpync85wWCncjZpyKsHHB?=
 =?us-ascii?Q?2q906ehhfSpJ6mm1nn90KBVTZ5vOLb0Tl85IvNGoVwXCtPyzz8+4FGkzIbta?=
 =?us-ascii?Q?DkODJ1woQAsFCikcIHK0I/tOU65aCh2rIfzaZNW36uhkkOu5ORJmSzvw4LEs?=
 =?us-ascii?Q?YcDath5o31D0bhu3VbRg5mUGrQOV8f9218bzIuf94CmkpaAC8GtVaP/GPwsX?=
 =?us-ascii?Q?Bz/+hM3UeHdU24QfYu+4FKtIK5EVEcGIfwldKq2mdK7rDqCk06sjZVjNtxEx?=
 =?us-ascii?Q?z5VOmmsTYLwQ36nkCIwTGVaRzInJHVjo4D//e8zG0M2vObpANodDCVFDBhUX?=
 =?us-ascii?Q?F6FRmrpCWa+Jag5VIVkSVMcnSszIg3haz8AOwxUaI+kcNGgQSN94tqMUMOEJ?=
 =?us-ascii?Q?f0+RQ9yYD8z4JHRnitTaS8wCGVhnNO4IszBPP9e5xtmT8xtWhKH32JPpWoyT?=
 =?us-ascii?Q?wrCfODI6XiTFETn6AXEZw0OoOxTy2uXIb7PiXKTpqsjwQS7Suf7dQtXAU4l7?=
 =?us-ascii?Q?51ABGEpOrcUUBKzRcMZ39b1RotuUO6QdkEdetwC/f6bHiXLTEM006bU8y2XF?=
 =?us-ascii?Q?Val8AAnYf3YxeAiXMAqQwpRgsKjlFdmrS3FJSwG1B1XqRA8kPSdK8VwWCD9a?=
 =?us-ascii?Q?ZM3OhIWHrmpcCgsPSpbjcdOkvnn4p+bAsm7hMKrs3Dd7GSxOD5OPe3KXPlbQ?=
 =?us-ascii?Q?bpLrNc28HMhW78oELI1BVR5f2cHL5jfP6FDFvDWPGxLBdpmc/HsYqr1KpKpP?=
 =?us-ascii?Q?uwVP6XTGSIX/SDmBITr7R1D8kXBl0MEX41kDtcpWXxAOK10LJkXJ4eRKjL/z?=
 =?us-ascii?Q?9aDhoYyrJHnALfU42aXrwuX/ROG3c9klPESAMEb5Mf4lFOos0T5k6TrJmTfD?=
 =?us-ascii?Q?YBMHNtKXXYqlFRmK7F5DfoG7JAidoareuvpCDcokLI2y3BQ2kPPRtXT62KU4?=
 =?us-ascii?Q?Z4JyUgOTNu273nOhKj5SSabpAPmy8bVbb4CQdUg8YQvLwZX8hy+llRAx8REt?=
 =?us-ascii?Q?UgEV6E0uOUEY6yE6vRr+siQA9MuOeSKC/vmzCgJBIZLk7j5cvLNzB+eerEyl?=
 =?us-ascii?Q?Gg+YaNuPWzLTntT4ve04rlUJhIdJMdEtS/z1qN9x3TepolUwreqQpHPG4pSd?=
 =?us-ascii?Q?wB0yOU+wFe5faVynHvAWiMIHiN/DUKBNvIp49DMneBt0tjoVaoExZC7sIDyR?=
 =?us-ascii?Q?JALBexp924HxFaSpICgxtn2aTvNjes3JXCWHjYJiRfWCKF4TGnPQ4Mtwmau3?=
 =?us-ascii?Q?7BDMZ2OxYr26y9qXCo2DSfu2uHSuvw5JWkjwKqyQ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB6744.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2d8943d-31c2-4f5d-82d9-08dc7fa0c83a
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2024 05:32:51.0080
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HHYGRMbUCwnMB1lPUEZ27HX9JeV3k4o7xzXIgoBz/icAG23RPgUBtWcI1hLrEWpfpRcjCH219xJwwzVskrlcOgoRFokYFKI8E37v/XX1b9Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5827
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
Cc: "linmiaohe@huawei.com" <linmiaohe@huawei.com>, "Schofield, Alison" <alison.schofield@intel.com>, "rafael@kernel.org" <rafael@kernel.org>, "Kuppuswamy, Sathyanarayanan" <sathyanarayanan.kuppuswamy@intel.com>, "Tsaur, Erwin" <erwin.tsaur@intel.com>, "linux-cxl@vger.kernel.org" <linux-cxl@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "oohall@gmail.com" <oohall@gmail.com>, "Weiny, Ira" <ira.weiny@intel.com>, "dave@stgolabs.net" <dave@stgolabs.net>, "Jiang, Dave" <dave.jiang@intel.com>, "Verma, Vishal L" <vishal.l.verma@intel.com>, "Smita.KoralahalliChannabasappa@amd.com" <Smita.KoralahalliChannabasappa@amd.com>, "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, "helgaas@kernel.org" <helgaas@kernel.org>, "lenb@kernel.org" <lenb@kernel.org>, "Peng, Chao P" <chao.p.peng@intel.com>, "rrichter@amd.com" <rrichter@amd.com>, "Wang, Yudong" <yudong.wang@intel.com>, "bp@alien8.de" <bp@alien8.de>, "qingshun.wang@linux.intel.com" <qingshun.wang@linux.i
 ntel.com>, "jonathan.cameron@huawei.com" <jonathan.cameron@huawei.com>, "bhelgaas@google.com" <bhelgaas@google.com>, "Williams, Dan J" <dan.j.williams@intel.com>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "Luck, Tony" <tony.luck@intel.com>, "Wanyan, Feiting" <feiting.wanyan@intel.com>, "Preble, Adam C" <adam.c.preble@intel.com>, "mahesh@linux.ibm.com" <mahesh@linux.ibm.com>, "lukas@wunner.de" <lukas@wunner.de>, "james.morse@arm.com" <james.morse@arm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "shiju.jose@huawei.com" <shiju.jose@huawei.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

Kindly ping.
Appreciate comments and suggestions so I could go ahead.

Thanks
Zhenzhong

>-----Original Message-----
>From: Duan, Zhenzhong <zhenzhong.duan@intel.com>
>Subject: [PATCH v4 0/3] PCI/AER: Handle Advisory Non-Fatal error
>
>Hi,
>
>This is a relay work of Qingshun's v2 [1], but changed to focus on ANFE
>processing as subject suggests and drops trace-event for now. I think it's
>a bit heavy to do extra IOes to get PCIe registers only for trace purpose
>and not see it a community request for now.
>
>According to PCIe Base Specification Revision 6.1, Sections 6.2.3.2.4 and
>6.2.4.3, certain uncorrectable errors will signal ERR_COR instead of
>ERR_NONFATAL, logged as Advisory Non-Fatal Error(ANFE), and set bits in
>both Correctable Error(CE) Status register and Uncorrectable Error(UE)
>Status register. Currently, when handling AER events the kernel will only
>look at CE status or UE status, but never both. In the ANFE case, bits set
>in the UE status register will not be reported and cleared until the next
>FE/NFE arrives.
>
>For instance, previously, when the kernel receives an ANFE with Poisoned
>TLP in OS native AER mode, only the status of CE will be reported and
>cleared:
>
>  AER: Correctable error message received from 0000:b7:02.0
>  PCIe Bus Error: severity=3DCorrectable, type=3DTransaction Layer, (Recei=
ver ID)
>    device [8086:0db0] error status/mask=3D00002000/00000000
>     [13] NonFatalErr
>
>If the kernel receives a Malformed TLP after that, two UEs will be
>reported, which is unexpected. The Malformed TLP Header is lost since
>the previous ANFE gated the TLP header logs:
>
>  PCIe Bus Error: severity=3D"Uncorrectable (Fatal), type=3DTransaction La=
yer,
>(Receiver ID)
>    device [8086:0db0] error status/mask=3D00041000/00180020
>     [12] TLP                    (First)
>     [18] MalfTLP
>
>To handle this case properly, calculate potential ANFE related status bits
>and save in aer_err_info. Use this information to determine the status bit=
s
>that need to be cleared.
>
>Now, for the previous scenario, both CE status and related UE status will
>be reported and cleared after ANFE:
>
>  AER: Correctable error message received from 0000:b7:02.0
>  PCIe Bus Error: severity=3DCorrectable, type=3DTransaction Layer, (Recei=
ver ID)
>    device [8086:0db0] error status/mask=3D00002000/00000000
>     [13] NonFatalErr
>    Uncorrectable errors that may cause Advisory Non-Fatal:
>     [18] TLP
>
>Note:
>checkpatch.pl will produce following warnings on PATCH2/3:
>
>WARNING: 'UE' may be misspelled - perhaps 'USE'?
>#22:
>uncorrectable error(UE) status should be cleared. However, there is no
>
>...similar warnings omitted...
>
>This is a false-positive, so not fixed.
>
>WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit
>description?)
>#10:
>  PCIe Bus Error: severity=3DCorrectable, type=3DTransaction Layer, (Recei=
ver ID)
>
>...similar warnings omitted...
>
>For readability reasons, these warnings are not fixed.
>
>
>
>[1] https://lore.kernel.org/linux-pci/20240125062802.50819-1-
>qingshun.wang@linux.intel.com
>
>Thanks
>Qingshun, Zhenzhong
>
>Changelog:
>v4:
>  - Fix a race in anfe_get_uc_status() (Jonathan)
>  - Add a comment to explain side effect of processing ANFE as NFE (Jonath=
an)
>  - Drop the check for PCI_EXP_DEVSTA_NFED
>
>v3:
>  - Split ANFE print and processing to two patches (Bjorn)
>  - Simplify ANFE handling, drop trace event
>  - Polish comments and patch description
>  - Add Tested-by
>
>v2:
>  - Reference to the latest PCIe Specification in both commit messages
>    and comments, as suggested by Bjorn Helgaas.
>  - Describe the reason for storing additional information in
>    aer_err_info in the commit message of PATCH 1, as suggested by Bjorn
>    Helgaas.
>  - Add more details of behavior changes in the commit message of PATCH
>    2, as suggested by Bjorn Helgaas.
>
>v3: https://lore.kernel.org/lkml/20240417061407.1491361-1-
>zhenzhong.duan@intel.com
>v2: https://lore.kernel.org/linux-pci/20240125062802.50819-1-
>qingshun.wang@linux.intel.com
>v1: https://lore.kernel.org/linux-pci/20240111073227.31488-1-
>qingshun.wang@linux.intel.com
>
>Zhenzhong Duan (3):
>  PCI/AER: Store UNCOR_STATUS bits that might be ANFE in aer_err_info
>  PCI/AER: Print UNCOR_STATUS bits that might be ANFE
>  PCI/AER: Clear UNCOR_STATUS bits that might be ANFE
>
> drivers/pci/pci.h      |  1 +
> drivers/pci/pcie/aer.c | 75
>+++++++++++++++++++++++++++++++++++++++++-
> 2 files changed, 75 insertions(+), 1 deletion(-)
>
>--
>2.34.1

