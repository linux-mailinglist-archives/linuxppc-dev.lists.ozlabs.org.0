Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2594962D0BC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Nov 2022 02:40:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NCN0G0SlZz3dts
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Nov 2022 12:40:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ka9WCqm7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.120; helo=mga04.intel.com; envelope-from=kai.huang@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ka9WCqm7;
	dkim-atps=neutral
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NCMzJ5ckdz3bjy
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Nov 2022 12:39:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668649180; x=1700185180;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=iBQpeqrtaHGlrge5TfNnTDad4mJORWaXlqenRg3OArc=;
  b=Ka9WCqm7MJJsbEyESj9xDIRDQSuRzT8YplwRokBTdtwysAy30ZYD9pqy
   bf45H/hXLrhWMVWcjDhg7hsFMOXcjo/qF/+m6LSVr6VItBMcSvEyQBP2P
   uH6BrAMuj+9JQHtkXsTfJqus5UHQP+ucadb+OTS/slALbbv9Ms0EPy5BY
   DIczXWQWQd93fLt2GkvayHIA/oYjcUB3gBoEJCsnzYLNyU+9Hit897yLN
   4B2HFdDXBTcEZQQXBYvYQ4PFA2+2gnr3WDOCZGngns+O9mFcMXx4HIQvZ
   9en4usv10KhQXPikD68xFgSIzob1hRbaxAepNmJUJ8SGTtqCKiaTFNBvy
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="311427522"
X-IronPort-AV: E=Sophos;i="5.96,169,1665471600"; 
   d="scan'208";a="311427522"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2022 17:39:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="670723222"
X-IronPort-AV: E=Sophos;i="5.96,169,1665471600"; 
   d="scan'208";a="670723222"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orsmga008.jf.intel.com with ESMTP; 16 Nov 2022 17:39:29 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 16 Nov 2022 17:39:29 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 16 Nov 2022 17:39:28 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 16 Nov 2022 17:39:28 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 16 Nov 2022 17:39:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cUJJAM0OnPzMzwrUiuKyjQBi/h6/n1jmeEfJadXhe4wk0tKN8g1AHExRtK+nd1iuqEcaZe23D/pRVPb4Yb/YPjjjzk4nMnFOItAgFCsbyInk4zPETqCAyuv5bQ08lqL+LXvpXu4DN9htR+0DnbRxOm6W4gxVkRiKKKti1AejBrRCBqHTCjWmfoHYDVVhK/xCEflH9hOqC5AFZUJ6LX9bjQfEuBfGEN3qHuVlJhJBFwFKxbCSI1wPX9Zy23gE5l10Yz2iurTtWJocQSMXKKQH0P+7S2ID4t5PXSHxYxu1I6pK5ojxqkrrJE0KG8jTwDPS53HvE1LqjPc87YIMb7SL6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iBQpeqrtaHGlrge5TfNnTDad4mJORWaXlqenRg3OArc=;
 b=YCuFPumyD+VHGSr49gei7XRDynCw7FNloKxZCLc3lrkjSALWJTBMBdVl4A9TROZPmRGc2PINbB5o0us9v9EoM2zo3UAR8rSOTr5F7SthxCwh0Ax2OAqVU5GmAhl1PHGfmhPG0g0wuyJL/MSx/gKGvSGqQHTYG+9z/O+kfnvz6RfgwUBsaN1Mw+RLgYClfiJlDrPZP4rdB+qhkC96rNH8uJhd4yc23KHDMnQQMFflESr4tIDQcOA1pKYCU9CI4W5y79CU7GF44qHJnVEsb6tcsDnKK8FrCUhJPpWcLqZl5i2Bpjdm8zmM/+FYhh3qFYo1kyLTcjeRfnj9B6QUK5ymqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5978.namprd11.prod.outlook.com (2603:10b6:208:385::18)
 by PH0PR11MB5879.namprd11.prod.outlook.com (2603:10b6:510:142::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Thu, 17 Nov
 2022 01:39:23 +0000
Received: from BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::2fb7:be18:a20d:9b6e]) by BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::2fb7:be18:a20d:9b6e%9]) with mapi id 15.20.5813.017; Thu, 17 Nov 2022
 01:39:23 +0000
From: "Huang, Kai" <kai.huang@intel.com>
To: "Christopherson,, Sean" <seanjc@google.com>
Subject: Re: [PATCH 38/44] KVM: Disable CPU hotplug during hardware enabling
Thread-Topic: [PATCH 38/44] KVM: Disable CPU hotplug during hardware enabling
Thread-Index: AQHY7xJy2pUg1L4bCkib6AOkbzD9bK43arEAgAAKuoCACQqcAIABDjUAgABQgACAAI30AA==
Date: Thu, 17 Nov 2022 01:39:23 +0000
Message-ID: <7fb66c497b6c41049167b05c63267cbc301b1c20.camel@intel.com>
References: <20221102231911.3107438-1-seanjc@google.com>
	 <20221102231911.3107438-39-seanjc@google.com>
	 <88e920944de70e7d69a98f74005b49c59b5aaa3b.camel@intel.com>
	 <b198fe971cecd301f0c7c66028cfd71dd7ba7e62.camel@intel.com>
	 <Y3PzhANShVlTXVg1@google.com>
	 <95ca433349eca601bdd2b16d70f59ba8e56d8e3f.camel@intel.com>
	 <Y3UZtoIidMyE8qVz@google.com>
In-Reply-To: <Y3UZtoIidMyE8qVz@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4 (3.44.4-2.fc36) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5978:EE_|PH0PR11MB5879:EE_
x-ms-office365-filtering-correlation-id: 6ab8cb02-59d6-4afa-68ce-08dac83c8e15
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: f5P0R/Sa6DuiidOTMabBVeIjLdxD66eSqMIXFhlMaPUtNU3o+UHhq1yVIaW2G2O8w0YHsAY4I14z/RxfFI1hjJOYxg+++F9HHUIApk3RxirGTbgDkx2x3Gk44hnaiezXFfHpvLeU0J76+uykkwIBsl9gH6phpn39Fo0Y6MImU2tHQl9selW1zIf+shYEpa5mm4zdCxXeO64E2Ah7+pn39DHwxvs+mhUw8vCQpD/ftVtexOtex+eAl7t2bNejDExX+9bNQEk3DA2vhwP19k3SsVHGUj7Km3stfOT/luH+SuE92H3LmEFrCttoy6k7GAJ/7cTR83wRbmG5K7cjqS875jrtFpFCWzPOVpJ+rVwMSG4aBivKUdq8r+i12nLgzvJicqVE8Xlhem7TNqXs8CKCYqTnrrYVTKdFXt1NdYaddtXNV0MHbnpqw812o+94U+UK0mQ8aEUyDpk/H/4MBH5w44s4lZ/2xWh6yMlQv0qm/RT2sMh/jk/YUyo1qSIppD3xaEr5t+II4HruGDjRaF7EaeeCbE8DMS66L2vWpEcFaqUr0FwwmclQX77arRj/TMEX0gPN59bCdkQVqLxWJZNp5Lkou5KAuWmj0USLmPQ+A3U5UHUAZ1fcX237haOAHgRjrU05zC2EVP4o74OVAddIpUDXI4TQdyAwZlFNe/RDNRUtn59Aw19TF2NufSUNPM66V0XGOrLyhARmWYFfM0Xzd7GCor2UlzoxuWkNZTNNTdlqH8Z44phNNjk/XCT97e8jvCb7FrwuSf5F/vXJc1/4Xg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5978.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(396003)(346002)(366004)(39860400002)(136003)(451199015)(6916009)(54906003)(6506007)(316002)(83380400001)(2906002)(4001150100001)(41300700001)(186003)(8936002)(36756003)(26005)(7416002)(2616005)(64756008)(6512007)(66946007)(66556008)(66446008)(91956017)(76116006)(7406005)(8676002)(5660300002)(4326008)(66476007)(38070700005)(478600001)(6486002)(122000001)(38100700002)(86362001)(107886003)(71200400001)(82960400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NkcyVTBOV0hwSE1Rbi9VVm03VDN1VlZkZXZmUitSZCtRSWdWak5BekFwOVEw?=
 =?utf-8?B?Qjh2Ykk2TjJyWVdOTHN4VE9FYVhMWGx3cy9RMERZQVJqU01xNTk0Mk9Qa0pO?=
 =?utf-8?B?WUZ0R1loOGdRUXhZQzZHcHFEZkRZT2h6UGZ0L2lPbTNwYlN1WHVHbWlmS0pI?=
 =?utf-8?B?Q3lnL0RMeEg3MlZUTXBmYzFOblhYNytnZzFZM2VRUnBqVlNaaU8zSFcrdCtT?=
 =?utf-8?B?L3RYTG81NXlXMXROdjJWbjQ4VTM5ZEpWM1NDekpyZjdHVERFSnM3ZGxwaGxG?=
 =?utf-8?B?WDg0eERYTnl1eUJCWnNIb2Fnc3N3NWRsaE9na2Q2N2ZFb2RWSWJqLy9rUDZM?=
 =?utf-8?B?S1V5YmJORkZaUlJLVVBCTDdjS3ZxSFNlRXJLeGI5Y3RHaWUyZ0QwZ293SEFT?=
 =?utf-8?B?Y0NReUo0NlJ6LzBZU3NUR3hXM2gwSWxaOXZxbm5USXM3ZllRcGt4R2NRUWVD?=
 =?utf-8?B?aG1SNkllOEQrUGJGVU5UNW5XNkw3a3B5enU5WWk0ZjVhajdtdGIxTzl6Vzdy?=
 =?utf-8?B?M0MvZU85OUlsSWQ4VjRob1JPVlNJYVFnZzNiZEgxT0pKTHNBL1RDVEkvQkJU?=
 =?utf-8?B?a3FlYVluQVlHd2k1ZjZJeUlCUEhROC84SEo1Q0ZVZVR0cmdFZm5QSG95Nlcr?=
 =?utf-8?B?NExGdVA0ZjQwejNsR3diVHkrTVNwKysraFA3clZMRGRTdFlaM1lLM0FndUdk?=
 =?utf-8?B?MHVpeTQwZU1aeUNRRmh0VXNlc3NJUThlTUhTNDdBQVB6Z2l3V0YzSkRheVZT?=
 =?utf-8?B?TSs5Q0RYbGVONGJScC9rd3NwblM5ckhKYm9kUGdNZDIwRkZSeEdqdXlPcVpW?=
 =?utf-8?B?TTc2WEkwNjVmeThER0lFTHZ5VzdPWUtyZGhEZVRxTi9HajBNQmJBWm5oTWkv?=
 =?utf-8?B?UGhHNXZ1bHpXR0g5ZDV0dFNmZFRUSXBPdXgyeUllMFhwZzB0R0hETXlFcksy?=
 =?utf-8?B?ai9zRE81MkRIcGpEVEUzS3UzdFM0NytmbHprZTA4R0NsM2ViNFpkRlcwRkg1?=
 =?utf-8?B?YUU5b1NENkVqd2oyVjR3bktERWt6MkNMRDNnaitzRzlzcUJueDlsZnJNbVd0?=
 =?utf-8?B?QlAra1B5dnlETnIrL0RCR2hVZGR2d21ST0NPTlgwZzBGZmxPS01ZNUVQdkJY?=
 =?utf-8?B?YVdJOXY4Vm1HOFl2VjhzdERISnN2RUd0R1FXN1RpZ1dqZGMyZENoUVdLamth?=
 =?utf-8?B?OXhOZ3ZSdXVQTE1MTmNiVlUyTWtzVFh2L24vK0VCRE5paUxQbk82ZmRFeXlm?=
 =?utf-8?B?bEVoYnVOWDRVQzhmTVVYMXZrL25xTExjY01YZzltOVlGS2t0SGozSTAxSW5p?=
 =?utf-8?B?WEhQUU1nMVlYeWZ2eHJiM21xUEVpbTl4azluUWFyTXM4dkJMYWs4R3VEc2pr?=
 =?utf-8?B?QVU1ZE5CUlZuckw3WUpsUHd1YnNoZkx2dWlWcjZmMUdNNE91NHo2Ri96bVNw?=
 =?utf-8?B?UHJDT2FaWWF3Q0JjVVoxM2FrM3NwL2ZwdElUa0V4c3Vac1JOaW94dEFpMWVU?=
 =?utf-8?B?UVpTYTVIK2NLRXplMkVIQjlYOHdVRVVmZVdtdW9ndWEvVmZNc29FbTVCSDJt?=
 =?utf-8?B?YzQzQjVNcS9JMS9obkU1TzU5Nm9JMGUxV2ZITldKRXZyK1Y4SFpCOWZxRm4z?=
 =?utf-8?B?SDdPdk8xZWc1VHJ0OGh3Rkg2ekZ6T3B1Q2NyU2J3MzZnbEtyMWZIOEl6YXBM?=
 =?utf-8?B?bysxNG5XYWxyRkEzMVk1Sk9VWnZyb2xwZ3ZSRDJYV0s0SEQ1QTNCYkI3SVZE?=
 =?utf-8?B?ZU1YRHEvdE9PYXJvOFMzdUlnRGNEZnBucEVaTjU4Y1FJSlNxelN4bTdKYWpa?=
 =?utf-8?B?ZC9LWmU1UHN2QWkrRHozOG5tb0xhbE1ibkY2aHBudS9UdjJHbWlpYVQ0QXhK?=
 =?utf-8?B?Z2MvM3dOMS80NjR0cmRiMWtvcEtUN2lpTTcyNXYrSjM1MHY2TkVYcFZ5R2Vl?=
 =?utf-8?B?b2t2TElMckpqNVRGQ1ZXTE94engyNE5vd3QxUWdSS1FIREJ6cEZZTFhLN2Jp?=
 =?utf-8?B?ajVMS1pLTXJRUkw0cmxud2hPcXZFdkczSmFYZURnQ0pQdUViMFZ3dlBueGRp?=
 =?utf-8?B?aU40ZGdscTJoUHdlOVhpL1Z4Mlc3azI0OWgrL2hwNm1JeDJpd3dSZEhMZm9l?=
 =?utf-8?B?VnprR1M5bWlGZHFwWS8yYUxQdXRYanpENVZrczB6aUpRZGdsVDBRV3cvRmN0?=
 =?utf-8?B?ZEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F54AC5CCCB2F23488B6462F9C09B78E2@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5978.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ab8cb02-59d6-4afa-68ce-08dac83c8e15
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2022 01:39:23.3394
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BQ+AQyt25yfnSs7G/WSbu9oz3roM3teoSn2opyX0oJVGKMwSJlJtNSsPqvPPmXqgn4THPWjDmYbKYURTbBoPoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5879
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
Cc: "mjrosato@linux.ibm.com" <mjrosato@linux.ibm.com>, "david@redhat.com" <david@redhat.com>, "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "imbrenda@linux.ibm.com" <imbrenda@linux.ibm.com>, "kvmarm@lists.cs.columbia.edu" <kvmarm@lists.cs.columbia.edu>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "chenhuacai@kernel.org" <chenhuacai@kernel.org>, "aleksandar.qemu.devel@gmail.com" <aleksandar.qemu.devel@gmail.com>, "james.morse@arm.com" <james.morse@arm.com>, "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, "Gao, Chao" <chao.gao@intel.com>, "farman@linux.ibm.com" <farman@linux.ibm.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, "Yao, Yuan" <yuan.yao@intel.com>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, "tglx@linutro
 nix.de" <tglx@linutronix.de>, "alexandru.elisei@arm.com" <alexandru.elisei@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "frankja@linux.ibm.com" <frankja@linux.ibm.com>, "Yamahata, Isaku" <isaku.yamahata@intel.com>, "atishp@atishpatra.org" <atishp@atishpatra.org>, "farosas@linux.ibm.com" <farosas@linux.ibm.com>, "anup@brainfault.org" <anup@brainfault.org>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "oliver.upton@linux.dev" <oliver.upton@linux.dev>, "palmer@dabbelt.com" <palmer@dabbelt.com>, "kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>, "maz@kernel.org" <maz@kernel.org>, "pbonzini@redhat.com" <pbonzini@redhat.com>, "vkuznets@redhat.com" <vkuznets@redhat.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gV2VkLCAyMDIyLTExLTE2IGF0IDE3OjExICswMDAwLCBTZWFuIENocmlzdG9waGVyc29uIHdy
b3RlOg0KPiBPbiBXZWQsIE5vdiAxNiwgMjAyMiwgSHVhbmcsIEthaSB3cm90ZToNCj4gPiBPbiBU
dWUsIDIwMjItMTEtMTUgYXQgMjA6MTYgKzAwMDAsIFNlYW4gQ2hyaXN0b3BoZXJzb24gd3JvdGU6
DQo+ID4gPiBPbiBUaHUsIE5vdiAxMCwgMjAyMiwgSHVhbmcsIEthaSB3cm90ZToNCj4gPiA+ID4g
T24gVGh1LCAyMDIyLTExLTEwIGF0IDAxOjMzICswMDAwLCBIdWFuZywgS2FpIHdyb3RlOg0KPiA+
ID4gPiBIbW0uLiBJIHdhc24ndCB0aGlua2luZyB0aG9yb3VnaGx5LiAgSSBmb3Jnb3QgQ1BVIGNv
bXBhdGliaWxpdHkgY2hlY2sgYWxzbw0KPiA+ID4gPiBoYXBwZW5zIG9uIGFsbCBvbmxpbmUgY3B1
cyB3aGVuIGxvYWRpbmcgS1ZNLiAgRm9yIHRoaXMgY2FzZSwgSVJRIGlzIGRpc2FibGVkIGFuZA0K
PiA+ID4gPiBjcHVfYWN0aXZlKCkgaXMgdHJ1ZS4gIEZvciB0aGUgaG90cGx1ZyBjYXNlLCBJUlEg
aXMgZW5hYmxlZCBidXQgIGNwdV9hY3RpdmUoKSBpcw0KPiA+ID4gPiBmYWxzZS4NCj4gPiA+IA0K
PiA+ID4gQWN0dWFsbHksIHlvdSdyZSByaWdodCAoYW5kIHdyb25nKS4gIFlvdSdyZSByaWdodCBp
biB0aGF0IHRoZSBXQVJOIGlzIGZsYXdlZC4gIEFuZA0KPiA+ID4gdGhlIHJlYXNvbiBmb3IgdGhh
dCBpcyBiZWNhdXNlIHlvdSdyZSB3cm9uZyBhYm91dCB0aGUgaG90cGx1ZyBjYXNlLiAgSW4gdGhp
cyB2ZXJzaW9uDQo+ID4gPiBvZiB0aGluZ3MsIHRoZSBjb21wYXRpYmlsaXR5IGNoZWNrcyBhcmUg
cm91dGVkIHRocm91Z2ggaGFyZHdhcmUgZW5hYmxpbmcsIGkuZS4gdGhpcw0KPiA+ID4gZmxvdyBp
cyB1c2VkIG9ubHkgd2hlbiBsb2FkaW5nIEtWTS4gIFRoaXMgaGVscGVyIHNob3VsZCBvbmx5IGJl
IGNhbGxlZCB2aWEgU01QIGZ1bmN0aW9uDQo+ID4gPiBjYWxsLCB3aGljaCBtZWFucyB0aGF0IElS
UXMgc2hvdWxkIGFsd2F5cyBiZSBkaXNhYmxlZC4NCj4gPiANCj4gPiBEaWQgeW91IG1lYW4gYmVs
b3cgY29kZSBjaGFuZ2UgaW4gbGF0ZXIgcGF0Y2ggIltQQVRDSCAzOS80NF0gS1ZNOiBEcm9wDQo+
ID4ga3ZtX2NvdW50X2xvY2sgYW5kIGluc3RlYWQgcHJvdGVjdCBrdm1fdXNhZ2VfY291bnQgd2l0
aCBrdm1fbG9jayI/DQo+ID4gDQo+ID4gIAkvKg0KPiA+ICAJICogQWJvcnQgdGhlIENQVSBvbmxp
bmUgcHJvY2VzcyBpZiBoYXJkd2FyZSB2aXJ0dWFsaXphdGlvbiBjYW5ub3QNCj4gPiAgCSAqIGJl
IGVuYWJsZWQuIE90aGVyd2lzZSBydW5uaW5nIFZNcyB3b3VsZCBlbmNvdW50ZXIgdW5yZWNvdmVy
YWJsZQ0KPiA+IEBAIC01MDM5LDEzICs1MDM5LDE2IEBAIHN0YXRpYyBpbnQga3ZtX29ubGluZV9j
cHUodW5zaWduZWQgaW50IGNwdSkNCj4gPiAgCWlmIChrdm1fdXNhZ2VfY291bnQpIHsNCj4gPiAg
CQlXQVJOX09OX09OQ0UoYXRvbWljX3JlYWQoJmhhcmR3YXJlX2VuYWJsZV9mYWlsZWQpKTsNCj4g
PiAgDQo+ID4gKwkJbG9jYWxfaXJxX3NhdmUoZmxhZ3MpOw0KPiA+ICAJCWhhcmR3YXJlX2VuYWJs
ZV9ub2xvY2soTlVMTCk7DQo+ID4gKwkJbG9jYWxfaXJxX3Jlc3RvcmUoZmxhZ3MpOw0KPiANCj4g
U29ydCBvZi4gIFdoYXQgSSB3YXMgc2F5aW5nIGlzIHRoYXQgaW4gdGhpcyB2MSwgdGhlIGNvbXBh
dGliaWxpdHkgY2hlY2tzIHRoYXQgYXJlDQo+IGRvbmUgZHVyaW5nIGhhcndhcmUgZW5hYmxpbmcg
YXJlIGluaXRpYXRlZCBmcm9tIHZlbmRvciBjb2RlLCBpLmUuIFZNWCBhbmQgU1ZNIGNhbGwNCj4g
e3N2bSx2bXh9X2NoZWNrX3Byb2Nlc3Nvcl9jb21wYXQoKSBkaXJlY3RseS4gIEFzIGEgcmVzdWx0
LCB0aGUgY29tcGF0IGNoZWNrcyB0aGF0DQo+IGFyZSBoYW5kbGVkIGluIGNvbW1vbiBjb2RlOg0K
PiANCj4gCWlmIChfX2NyNF9yZXNlcnZlZF9iaXRzKGNwdV9oYXMsIGMpICE9DQo+IAkgICAgX19j
cjRfcmVzZXJ2ZWRfYml0cyhjcHVfaGFzLCAmYm9vdF9jcHVfZGF0YSkpDQo+IAkJcmV0dXJuIC1F
SU87DQo+IA0KPiBhcmUgc2tpcHBlZC4gIEFuZCBpZiB0aGF0J3MgZml4ZWQsIHRoZW4gdGhlIGFi
b3ZlIGhhcmR3YXJlX2VuYWJsZV9ub2xvY2soKSBjYWxsDQo+IHdpbGwgYm91bmNlIHRocm91Z2gg
a3ZtX3g4Nl9jaGVja19wcm9jZXNzb3JfY29tcGF0aWJpbGl0eSgpIHdpdGggSVJRcyBlbmFibGVk
DQo+IG9uY2UgdGhlIEtWTSBob3RwbHVnIGhvb2sgaXMgbW92ZWQgdG8gdGhlIE9OTElORSBzZWN0
aW9uLg0KDQpPaCBJIHNlZS4gIFNvIHlvdSBzdGlsbCB3YW50IHRoZSBrdm1feDg2X29wcy0+Y2hl
Y2tfcHJvY2Vzc29yX2NvbXBhdGliaWxpdHkoKSwNCmluIG9yZGVyIHRvIGF2b2lkIGR1cGxpY2F0
aW5nIHRoZSBhYm92ZSBjb2RlIGluIFNWTSBhbmQgVk1YLg0KDQo+IA0KPiBBcyBhYm92ZSwgdGhl
IHNpbXBsZSAiZml4IiB3b3VsZCBiZSB0byBkaXNhYmxlIElSUXMsIGJ1dCB0aGF0J3Mgbm90IGFj
dHVhbGx5DQo+IG5lY2Vzc2FyeS4gIFRoZSBvbmx5IHJlcXVpcmVtZW50IGlzIHRoYXQgcHJlZW1w
dGlvbiBpcyBkaXNhYmxlZCBzbyB0aGF0IHRoZSBjaGVja3MNCj4gYXJlIGRvbmUgb24gdGhlIGN1
cnJlbnQgQ1BVLiDCoA0KPiANCg0KUHJvYmFibHkgZXZlbiBwcmVlbXB0aW9uIGlzIGFsbG93ZWQs
IGFzIGxvbmcgYXMgdGhlIGNvbXBhdGliaWxpdHkgY2hlY2sgaXMgbm90DQpzY2hlZHVsZWQgdG8g
YW5vdGhlciBjcHUuDQoNCg0KPiBUaGUgIklSUXMgZGlzYWJsZWQiIGNoZWNrIHdhcyBhIGRlbGli
ZXJhdGVseQ0KPiBhZ3Jlc3NpdmUgV0FSTiB0aGF0IHdhcyBhZGRlZCB0byBndWFyZCBhZ2FpbnN0
IGRvaW5nIGNvbXBhdGliaWxpdHkgY2hlY2tzIGZyb20NCj4gdGhlICJ3cm9uZyIgbG9jYXRpb24u
DQo+IA0KPiBFLmcuIHRoaXMgaXMgd2hhdCBJIGVuZGVkIHVwIHdpdGggZm9yIGEgY2hhbmdlbG9n
IHRvIGRyb3AgdGhlIGlycXNfZGlzYWJsZWQoKQ0KPiBjaGVjayBhbmQgZm9yIHRoZSBlbmQgY29k
ZSAodGhvdWdoIGl0J3Mgbm90IHRlc3RlZCB5ZXQuLi4pDQo+IA0KPiAgICAgRHJvcCBrdm1feDg2
X2NoZWNrX3Byb2Nlc3Nvcl9jb21wYXRpYmlsaXR5KCkncyBXQVJOIHRoYXQgSVJRcyBhcmUNCj4g
ICAgIGRpc2FibGVkLCBhcyB0aGUgT05MSU5FIHNlY3Rpb24gcnVucyB3aXRoIElSUXMgZGlzYWJs
ZWQuICBUaGUgV0FSTiB3YXNuJ3QNCgkJCQkJCSAgICAgXg0KCQkJCQkJICAgICBlbmFibGVkLg0K
DQo+ICAgICBpbnRlbmRlZCB0byBiZSBhIHJlcXVpcmVtZW50LCBlLmcuIGRpc2FibGluZyBwcmVl
bXB0aW9uIGlzIHN1ZmZpY2llbnQsDQo+ICAgICB0aGUgSVJRIHRoaW5nIHdhcyBwdXJlbHkgYW4g
YWdncmVzc2l2ZSBzYW5pdHkgY2hlY2sgc2luY2UgdGhlIGhlbHBlciB3YXMNCj4gICAgIG9ubHkg
ZXZlciBpbnZva2VkIHZpYSBTTVAgZnVuY3Rpb24gY2FsbC4NCj4gDQo+IA0KPiBzdGF0aWMgaW50
IGt2bV94ODZfY2hlY2tfcHJvY2Vzc29yX2NvbXBhdGliaWxpdHkodm9pZCkNCj4gew0KPiAgICAg
ICAgIGludCBjcHUgPSBzbXBfcHJvY2Vzc29yX2lkKCk7DQo+ICAgICAgICAgc3RydWN0IGNwdWlu
Zm9feDg2ICpjID0gJmNwdV9kYXRhKGNwdSk7DQo+IA0KPiAgICAgICAgIC8qDQo+ICAgICAgICAg
ICogQ29tcGF0aWJpbGl0eSBjaGVja3MgYXJlIGRvbmUgd2hlbiBsb2FkaW5nIEtWTSBhbmQgd2hl
biBlbmFibGluZw0KPiAgICAgICAgICAqIGhhcmR3YXJlLCBlLmcuIGR1cmluZyBDUFUgaG90cGx1
ZywgdG8gZW5zdXJlIGFsbCBvbmxpbmUgQ1BVcyBhcmUNCj4gICAgICAgICAgKiBjb21wYXRpYmxl
LCBpLmUuIEtWTSBzaG91bGQgbmV2ZXIgcGVyZm9ybSBhIGNvbXBhdGliaWxpdHkgY2hlY2sgb24N
Cj4gICAgICAgICAgKiBhbiBvZmZsaW5lIENQVS4NCj4gICAgICAgICAgKi8NCj4gICAgICAgICBX
QVJOX09OKCFjcHVfb25saW5lKGNwdSkpOw0KDQpMb29rcyBnb29kIHRvIG1lLiAgUGVyaGFwcyB0
aGlzIGFsc28gY2FuIGJlIHJlbW92ZWQsIHRob3VnaC4NCg0KQW5kIElNSE8gdGhlIHJlbW92aW5n
IG9mIFdBUk5fT04oIWlycV9kaXNhYmxlZCgpKSBzaG91bGQgYmUgZm9sZGVkIHRvIHRoZSBwYXRj
aA0KIltQQVRDSCAzNy80NF0gS1ZNOiBSZW5hbWUgYW5kIG1vdmUgQ1BVSFBfQVBfS1ZNX1NUQVJU
SU5HIHRvIE9OTElORSBzZWN0aW9uIi4gDQpCZWNhdXNlIG1vdmluZyBmcm9tIFNUQVJUSU5HIHNl
Y3Rpb24gdG8gT05MSU5FIHNlY3Rpb24gY2hhbmdlcyB0aGUgSVJRIHN0YXR1cw0Kd2hlbiB0aGUg
Y29tcGF0aWJpbGl0eSBjaGVjayBpcyBjYWxsZWQuDQoNCj4gDQo+ICAgICAgICAgaWYgKF9fY3I0
X3Jlc2VydmVkX2JpdHMoY3B1X2hhcywgYykgIT0NCj4gICAgICAgICAgICAgX19jcjRfcmVzZXJ2
ZWRfYml0cyhjcHVfaGFzLCAmYm9vdF9jcHVfZGF0YSkpDQo+ICAgICAgICAgICAgICAgICByZXR1
cm4gLUVJTzsNCj4gDQo+ICAgICAgICAgcmV0dXJuIHN0YXRpY19jYWxsKGt2bV94ODZfY2hlY2tf
cHJvY2Vzc29yX2NvbXBhdGliaWxpdHkpKCk7DQo+IH0NCj4gDQo+IA0KPiBpbnQga3ZtX2FyY2hf
aGFyZHdhcmVfZW5hYmxlKHZvaWQpDQo+IHsNCj4gICAgICAgICBzdHJ1Y3Qga3ZtICprdm07DQo+
ICAgICAgICAgc3RydWN0IGt2bV92Y3B1ICp2Y3B1Ow0KPiAgICAgICAgIHVuc2lnbmVkIGxvbmcg
aTsNCj4gICAgICAgICBpbnQgcmV0Ow0KPiAgICAgICAgIHU2NCBsb2NhbF90c2M7DQo+ICAgICAg
ICAgdTY0IG1heF90c2MgPSAwOw0KPiAgICAgICAgIGJvb2wgc3RhYmxlLCBiYWNrd2FyZHNfdHNj
ID0gZmFsc2U7DQo+IA0KPiAgICAgICAgIGt2bV91c2VyX3JldHVybl9tc3JfY3B1X29ubGluZSgp
Ow0KPiANCj4gICAgICAgICByZXQgPSBrdm1feDg2X2NoZWNrX3Byb2Nlc3Nvcl9jb21wYXRpYmls
aXR5KCk7DQo+ICAgICAgICAgaWYgKHJldCkNCj4gICAgICAgICAgICAgICAgIHJldHVybiByZXQ7
DQo+IA0KPiAgICAgICAgIHJldCA9IHN0YXRpY19jYWxsKGt2bV94ODZfaGFyZHdhcmVfZW5hYmxl
KSgpOw0KPiAgICAgICAgIGlmIChyZXQgIT0gMCkNCj4gICAgICAgICAgICAgICAgIHJldHVybiBy
ZXQ7DQo+IA0KPiANCj4gCS4uLi4NCj4gfQ0KDQo=
