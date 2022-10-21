Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 303EF606EFC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Oct 2022 06:42:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MtsJN3LtPz3dsg
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Oct 2022 15:42:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MvgbhOaK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.20; helo=mga02.intel.com; envelope-from=tony.luck@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MvgbhOaK;
	dkim-atps=neutral
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MtsHM1b3rz3bY8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Oct 2022 15:41:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666327279; x=1697863279;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=MkBbV87obAUzyWpZIX1BlPeIRDpGDNcQUEZT/UAtvxM=;
  b=MvgbhOaKIaL+Gv3wkOTOAPy4OxKNo3B6PwdaVAnqIeZPyUtkJWdxEwuz
   p0oYib3SwBpePAFL31wK/G5JbZVxpAfzfzaLT08I8hBWOO/OvkWEEZkA6
   XlfPrP8aHJPZ/CjzirZrZ6zfsw1FFOjVwrGIIUTtou93SfP1pPPLuED+9
   Yel2o8YsPJfRWimNpNubZvxPEuK/uJTz+wZUkRE3ockUQtrsVdOQnUXyL
   ZiyiE5nk29q9ITeUuwSyozivmcGHRfZJgdPmOhsoXMGBTtE6k6W61+60J
   4mSZ+yNe3Qb9AdoixaLW/5C/hYgRHlj1VUseaS3wjmY4bS/OjF6izraSD
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="294306452"
X-IronPort-AV: E=Sophos;i="5.95,200,1661842800"; 
   d="scan'208";a="294306452"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2022 21:41:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="755584274"
X-IronPort-AV: E=Sophos;i="5.95,200,1661842800"; 
   d="scan'208";a="755584274"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga004.jf.intel.com with ESMTP; 20 Oct 2022 21:41:10 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 20 Oct 2022 21:41:09 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 20 Oct 2022 21:41:09 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 20 Oct 2022 21:41:09 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 20 Oct 2022 21:41:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cgmuJ1nZU62/fikZPmvRG7NNO+1qtNV8w570PdypvBs5j4atDoqg/eamWSwK8Yq3JcCo+KXROK427K56va8/S9xMoYKtepmzaCopITtwxPM3iuksDIY2Trt/H7Y0q8Z8ikXE0xD181lLfGd2L5Z+JhxJoSTJRbX4tadRX1ruZUWN0GRyEGqNqoEeDWm8Xfk08g7nMqrnzXsUnyoWxoFICKsrJynsao1EPo0ZuFB5ydQ2OGizvfukKDMigbCxkomzICiH8Is0SSKoCtAaYer1pLw+b52UpYzN0IdvxNc5ivVCndgnzi9viRWwQgN1ytRHI3w9hEioyd8UjrXgpJ2TTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MkBbV87obAUzyWpZIX1BlPeIRDpGDNcQUEZT/UAtvxM=;
 b=K52LvfnLgFT8wQaab9sinUTTNLl6YCS3/12dz5Ql60YAihgTTSc4Cbfm1BiFNIDMgKTw36gUrg6WPdT0MM1MG489MBcW/yUT5C09kpS9m9d1MTUb8D6WkDyQaJin/eq6mAYi8IhF0wuyOqe6KBuQI1HlkP4xu5wWSYb3Zl+kYTr8B5Z1UimWiL1V0LqX0+0KXcAwB+8pmPLR1E9/bcziUko+N7zjjJODblrrmyM1XhaVPpJ6KvN2YGfkBCnX58qJ0rRd9suzdRug7o5FMrZZVZp+wl/ALviFWZVH/kSsqLgGOe+wHuwL/w+4kAfXGvgwr6An1uwcspQt6PwLa6+FiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by CY8PR11MB7290.namprd11.prod.outlook.com (2603:10b6:930:9a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.35; Fri, 21 Oct
 2022 04:41:04 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::10a6:b76c:4fb1:2d60]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::10a6:b76c:4fb1:2d60%6]) with mapi id 15.20.5723.033; Fri, 21 Oct 2022
 04:41:04 +0000
From: "Luck, Tony" <tony.luck@intel.com>
To: David Laight <David.Laight@ACULAB.COM>, Shuai Xue
	<xueshuai@linux.alibaba.com>
Subject: RE: [PATCH v2] mm, hwpoison: Try to recover from copy-on write faults
Thread-Topic: [PATCH v2] mm, hwpoison: Try to recover from copy-on write
 faults
Thread-Index: AQHY4918CFTupvxOP023uLR6ydGaFK4YPAZAgAAI4DA=
Date: Fri, 21 Oct 2022 04:41:04 +0000
Message-ID: <SJ1PR11MB6083624E288992BFA902CC8CFC2D9@SJ1PR11MB6083.namprd11.prod.outlook.com>
References: <SJ1PR11MB60838C1F65CA293188BB442DFC289@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <20221019170835.155381-1-tony.luck@intel.com>
 <893b681b-726e-94e3-441e-4d68c767778a@linux.alibaba.com>
 <Y1GqGbBNk6fX/OnD@agluck-desk3.sc.intel.com>
 <359bae4e-6ce3-cc7e-33d0-252064157bc6@linux.alibaba.com>
 <Y1IbOAvpGzA8bst1@agluck-desk3.sc.intel.com>
 <1643d19d795b4a8084228eab66a7db9f@AcuMS.aculab.com>
In-Reply-To: <1643d19d795b4a8084228eab66a7db9f@AcuMS.aculab.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.500.17
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6083:EE_|CY8PR11MB7290:EE_
x-ms-office365-filtering-correlation-id: 1375ed7f-b780-42f2-06d3-08dab31e7683
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: W7IJnZ845+MP2Tx2KAHaILSCnxJAAe/899xvrf/PwsGF7MU9qlaqrBpZA8/VbgdXAKP4QI61N2z/DRwjhmaH2Ngm2OgO+kPOQxklTkW9Ml2h+RcJ+3Lw2GWZtLBZBLrmuODrGUFzdsZWCa8Ua73xRIZ19l2fTPeK5BAi+EITHh0mKfCffMC2NsHawAn8nLCgDyiVlX0XHfoTARpFE6HOuHjgAjPeXnIu7BxRhLXksYBQsyYzXcRqBzky5cypDk9mVrOOC4AYBtwsAxOXZ4Cv4b4uEOz00TeDIoLo8T8i46cBiI6ff5t/VVnb2fB0wwT7x18jq0f9L/6uKaa9SocGYrYj8uOOVG/DFjJt7l95Y6MglgkGwIo8O+CplZBrDvMD8niWtBGt9/Vm2LThCIwZheTdSGW4Pe2XFGiCu1gSGwHtJfRqgt9nwnV/tO6hohqZf558wdr0W7wDwhIn5p2FCKWJscq1S0faznBzmBYjUadJQ7sys3T7D8Ojdx5rCj93ZnU9xaA7P9LM0wUnbI+nW7ylVDljkp+qDmmmIx1jfYG5CSjFK3PSV8jyJoEJKvvFcNntoAbNyFyLL0DmUB6/yZUQRNkL82NSN4NDBW+yP6m+s0SuUZsEz0LPUN8lR2DZt3wrHWIixjpYIWYOX0nRf8Odj8Gcy62Do+f+UAX4Nt78TGuAG1G7OIdfH/2Jcb1c+dScKPOcxrURKm49ShVWqQdDI9IH1gFt3aewRNF3B9q/A1uo1qr25D3rMNed592VKbhb3c3df20LHmVkjYHdBA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(346002)(376002)(396003)(136003)(39860400002)(451199015)(71200400001)(33656002)(82960400001)(38100700002)(478600001)(2906002)(122000001)(38070700005)(186003)(66476007)(66446008)(54906003)(66946007)(4326008)(8676002)(110136005)(7696005)(6506007)(76116006)(64756008)(66556008)(8936002)(52536014)(316002)(55016003)(26005)(9686003)(83380400001)(41300700001)(86362001)(7416002)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?REVzR0duT2NVZVRwbFU0aURoYzlOMFByZUw3ZXJsZW01U1pBTUc1NUxUZXhP?=
 =?utf-8?B?RXk4UXV2cTRhQXJsKzgvbGxDRmg2NndzdkNQeTBpY2xBRHRPVjBZbzFhbEZr?=
 =?utf-8?B?elRLbUVhM2F4QTFtTzRhdmx5NnZ2cGNzUVRSUlUyS1hRdFJVRW1wUkpyZExo?=
 =?utf-8?B?blVuZEpacW1tUkhzS3JNeW9oSmkvcm1aaDloYklrY0Z5dTNsU3hQRkx4UzVW?=
 =?utf-8?B?dnZreEVTK1dmQXlQdDlpZ1djcEJJSXk0REhJeDFERmVQemYyeFFzUk9KRllY?=
 =?utf-8?B?OUNBRjBNaXc0aW5qZkVLNUlIT2dlSW9iNzllZVdVMkNXYzVWUWQrWkRBVC9o?=
 =?utf-8?B?VEdQcHMwcE16ZStNSFZ1L09lbVB6NlBnNk9XMS9MRjRuaFdaZWY3YUxZZC9y?=
 =?utf-8?B?Z0c5UDcvSVVHODdqSFhJL3VRTXdoNmJYM1J3NXFPRnhIVEptSnZVQ0xNaHNZ?=
 =?utf-8?B?WjJJeFdLcHN6a3NxT21FblNtVlBGeFE2cmhNTmlLa2dTbTdRelJCam9SaXdY?=
 =?utf-8?B?VTRZUThLaithbTgvNEJYTVNVcStsa1h5VFk4YVVHUmd5YW5GNDBiVG9rQzBH?=
 =?utf-8?B?ZDNDa3RzQ2w5OGRjWW5CazQxcWVOcVhmaXo2Zm8vY0pUaTZWK3FvU1BSOVZk?=
 =?utf-8?B?TkRTbmJKalZ5VTNxY2NvTm9vMnh3ZURMbG8yZFN1cUtxbjg3eVNrRmNVb25K?=
 =?utf-8?B?NW9EN1RONktyMUsvUjYvcGpHeHpqaityTUJRMHJsSHJsR1ZYMWNKZ3dmRjNs?=
 =?utf-8?B?RkllcllSS2VObmlrMzhIdmJ0SXZJOTRLaGVyZWdzYjV2dld5RTFDNHA1S3Ay?=
 =?utf-8?B?eGo4SVJPdjFsZ0VMVVBpTThhM2VHSDF4K1RKbGFmK2NWZFYxUXhONkpoVzVI?=
 =?utf-8?B?U2ZPTG56OEh6a1BnSVMySzBueUhYQ25vZmtGbkNoaVl4SWZqTmhTME9pRVVI?=
 =?utf-8?B?NFErYjJBb3E0YzJQV1BmeVI1L21yQlpGT3d1azFLNWIvaTdNYkF3SGpEMElh?=
 =?utf-8?B?L0tuNHRkL0dVQTVPaTVPdldRTUZxUWZHUGlOVVNqSHV6MU83cVB0Y1VVOGZM?=
 =?utf-8?B?YThSTDVqdGt3bG9keVlWVjFEc0ZMa0l5dlBvYlBDM2ozNXFHRkY4MmJtalZj?=
 =?utf-8?B?ZC93VW44OFpjbVNKUDRmeDgxeWFHUTlHaGMrazhwdUdSb2FxM1pBb1Y4WVJk?=
 =?utf-8?B?U3FNNTIvZlludXUzYVNQbWJaYmhsUjZwY0ZKWllYUzIxbWdwMTd1cW5TdHpC?=
 =?utf-8?B?VTRNV0NoMi9xTHB1TjRzSU5razgxRVlnb2VDVXFidTlBaUFNYmFCSVo5d09P?=
 =?utf-8?B?cTNKK3VJT2lGU2pzQ2xwa0RpZnVYNGRnd21vT056RkxiT21QNFN6Mjh5ZEZz?=
 =?utf-8?B?ejIwQ0hzR0RoU0JVN2dhaTN2b25icXM4b0RGNE1sZkJNNGgvT2JWTE5KdFU1?=
 =?utf-8?B?ZnZVVlBwTVpnSVNHdXNaUnViOFdoTUxDTWxhUUdmZFZTS2JveXpCVmF4bk1Y?=
 =?utf-8?B?TEJxRWdMZGh3WG04UlNHL2hhQ3VlVmtPWGdla0ViZFBmM3RHdzh0RGVpNTl3?=
 =?utf-8?B?Y1VEblB5VWMzZmJGaEpFM2tzbWJFUGNIZG9mT1BNcGNNMkwyUFg1U1dGS0ZI?=
 =?utf-8?B?QktSSGhIbnMxSmlhSU5iTFZNWFZoTVVzMTd2VkcyRTdldDZwck15cDZGZVdt?=
 =?utf-8?B?NHZoOWhxdWFQck4zSVBNVHFPcUszbERvNitZRS9BMG1jdXdpYXRWUWtuL2lL?=
 =?utf-8?B?WWRhdGN5T1g0cGNCZDd2WW4rQ3NuTldYM0RKM1lhdGQyOUM1NGpJL0lrOGVP?=
 =?utf-8?B?S0JWSFJQMkxSV3ZzVzNCWjNQMlVmZFN0NFZIUHFLdWJSazdRZ3VTN0ozalda?=
 =?utf-8?B?em1hdTNBNWl1ZFlFOElWejNsUytZS0VtL3JSS2VCVnhoeUp0M1RMZ2prQmRI?=
 =?utf-8?B?bFh3dDMxN1JiY05aSVNPMkRpK2djOVA2YWxuK3hHdWY2aE9FZnhJaFNvTlhR?=
 =?utf-8?B?alIzNGxJeXltNC9YQXdKeTh2VzFWVjdDb2h3Rm1VWXRoVS9hcmNZamx2S1lT?=
 =?utf-8?B?MUJmTzVMTFpUaVJpbEpwTHNuR1lNSTd5V0pMR2VDLzU1T01zQlBYL2dlcWNG?=
 =?utf-8?Q?WLEv3sO65EQw5xs8zQHY01f1b?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6083.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1375ed7f-b780-42f2-06d3-08dab31e7683
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2022 04:41:04.4410
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CAa7djSgkLrpyC28xNZAD0JfP0E7z9eh7BVN1LdfOuN2jYQkd+hQ3T1v9el88niEl/D4QzU5SiEbOxnmmisGng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7290
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, Naoya Horiguchi <naoya.horiguchi@nec.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Matthew
 Wilcox <willy@infradead.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, Nicholas Piggin <npiggin@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "Williams, Dan J" <dan.j.williams@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Pj4gV2hlbiB3ZSBkbyByZXR1cm4gdG8gdXNlciBtb2RlIHRoZSB0YXNrIGlzIGdvaW5nIHRvIGJl
IGJ1c3kgc2VydmljaW5nDQo+PiBhIFNJR0JVUyAuLi4gc28gc2hvdWxkbid0IHRyeSB0byB0b3Vj
aCB0aGUgcG9pc29uIHBhZ2UgYmVmb3JlIHRoZQ0KPj4gbWVtb3J5X2ZhaWx1cmUoKSBjYWxsZWQg
YnkgdGhlIHdvcmtlciB0aHJlYWQgY2xlYW5zIHRoaW5ncyB1cC4NCj4NCj4gV2hhdCBhYm91dCBh
biBSVCBwcm9jZXNzIG9uIGEgYnVzeSBzeXN0ZW0/DQo+IFRoZSB3b3JrZXIgdGhyZWFkcyBhcmUg
cHJldHR5IGxvdyBwcmlvcml0eS4NCg0KTW9zdCB0YXNrcyBkb24ndCBoYXZlIGEgU0lHQlVTIGhh
bmRsZXIgLi4uIHNvIHRoZXkganVzdCBkaWUgd2l0aG91dCBwb3NzaWJpbGl0eSBvZiBhY2Nlc3Np
bmcgcG9pc29uDQoNCklmIHRoaXMgdGFzayBET0VTIGhhdmUgYSBTSUdCVVMgaGFuZGxlciwgYW5k
IHRoYXQgZm9yIHNvbWUgYml6YXJyZSByZWFzb24ganVzdCBkb2VzIGEgInJldHVybiINCnNvIHRo
ZSB0YXNrIGp1bXBzIGJhY2sgdG8gdGhlIGluc3RydWN0aW9uIHRoYXQgY2F1c2UgdGhlIENPVyB0
aGVuIHRoZXJlIGlzIGEgNjMvNjQNCmxpa2VsaWhvb2QgdGhhdCBpdCBpcyB0b3VjaGluZyBhIGRp
ZmZlcmVudCBjYWNoZSBsaW5lIGZyb20gdGhlIHBvaXNvbmVkIG9uZS4NCg0KSW4gdGhlIDEvNjQg
Y2FzZSAuLi4gaXRzIHByb2JhYmx5IGEgc2ltcGxlIHN0b3JlIChzaW5jZSB0aGVyZSB3YXMgYSBD
T1csIHdlIGtub3cgaXQgd2FzIHRyeWluZyB0bw0KbW9kaWZ5IHRoZSBwYWdlKSAuLi4gc28gd29u
J3QgZ2VuZXJhdGUgYW5vdGhlciBtYWNoaW5lIGNoZWNrICh0aG9zZSBvbmx5IGhhcHBlbiBmb3Ig
cmVhZHMpLg0KDQpCdXQgbWF5YmUgaXQgaXMgc29tZSBSTVcgaW5zdHJ1Y3Rpb24gLi4uIHRoZW4s
IGlmIGFsbCB0aGUgYWJvdmUgb3B0aW9ucyBkaWRuJ3QgaGFwcGVuIC4uLiB3ZQ0KY291bGQgZ2V0
IGFub3RoZXIgbWFjaGluZSBjaGVjayBmcm9tIHRoZSBzYW1lIGFkZHJlc3MuIEJ1dCB0aGVuIHdl
IGp1c3QgZm9sbG93IHRoZSB1c3VhbA0KcmVjb3ZlcnkgcGF0aC4NCg0KLVRvbnkNCg==
