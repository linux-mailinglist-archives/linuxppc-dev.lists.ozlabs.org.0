Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC0B6238AC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 02:10:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N73fS6nvYz3cMc
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 12:10:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QQGP1sTQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.65; helo=mga03.intel.com; envelope-from=kai.huang@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QQGP1sTQ;
	dkim-atps=neutral
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N73dS19s9z3cCn
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Nov 2022 12:09:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668042556; x=1699578556;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=jcgLPKFY894y3Vfw1oCpIEzLG3GySTKymBaGb2vkDjs=;
  b=QQGP1sTQ4mNofWmrnaFvkp5L6KDAFDaM2t6eoREyhyyiLNvMvIzuPURZ
   DvksUbTRu9FV/0YQPRz2Yhh/ocuFSnMRBDJm37RtutpiigxfPWyZoqan4
   fNPgOmTVvo6zCqlkCzswliXgTNgN5jkAZ/ZkIMLe3F6y26dI5bBVCvKcF
   mAtSuQyvu31/y9VWt5YZ2NHlwDchOHFzAbJa9EgeVAtCsuFeU6QhvuOCR
   mf598kRiMHUZZoh3QwL/umMQ/4khTN9jNEvXXIej6KKq8aSypAmDtrexi
   rkNBxUYuNU3GiuDJ9VL1JAM69aoZO/kBYnML6lmVK8jOYe/dClBPISIOB
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="312939291"
X-IronPort-AV: E=Sophos;i="5.96,152,1665471600"; 
   d="scan'208";a="312939291"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2022 17:09:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="700590622"
X-IronPort-AV: E=Sophos;i="5.96,152,1665471600"; 
   d="scan'208";a="700590622"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga008.fm.intel.com with ESMTP; 09 Nov 2022 17:09:04 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 9 Nov 2022 17:09:04 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 9 Nov 2022 17:09:04 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 9 Nov 2022 17:09:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YchRpHkeAcZTP4nJqFgjJhay6lz3OOF1iNbcehfYU6Cw0/rayw30601mfJS6xm9AQVUQC+Nq5Q+mua2d1m+JsEj2H6ASYCpwDg29cDBJ2fcmO3xFGlKv7bHst7g8plw5OZ0IgVWOtY3F4jvDtPStiYkSbm/VU5Pxg51bq9VqIAuWcbM7NfNGSHTZI3IKAv9NCF47PPqc2FEJ/VkWjmlr0T9xakVFYP2wwa/cyA9iCouBVmEWG0SJ9ju9Cq0mIFNalnS6VHL/6odMYjsLZwS+IltM0ihLbwqxnAc2NWP24bacMj5pelWRRHfZ2yDw5MOjOwfJjuMVC+VtfDIbKBRlEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jcgLPKFY894y3Vfw1oCpIEzLG3GySTKymBaGb2vkDjs=;
 b=EK6f3gSFb9yQPa5UpGyXZEBl6FiEZbgmVPRIG6YolKxO9cSNs1Tz+9CEQrweEVUuuH/bMNo5wYzm+xglaheol79sLCELQtbHA2dZ4oYt3BUOSmuILjWJmXHtOz9BR/klElcieN5j2LRpjlhlJFpUCGPPaLek2dDVBwftCQFLvlG9vyxDt0U0duszIFUZrDlWAxXl7+5e7dpw/e9vEhCMcwBepJ+95IQ23h6rOTweezGvon99LmiUSeot5udsAhf3g2NkWXb67CWmQ1uRyHsIBpHCKTlL/QrSQr5dOVBbFbPvAeG8y3bxrL637lm8dhVRPBmcclp01mqwRTcnlKdS5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5978.namprd11.prod.outlook.com (2603:10b6:208:385::18)
 by PH7PR11MB7004.namprd11.prod.outlook.com (2603:10b6:510:20b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.24; Thu, 10 Nov
 2022 01:08:56 +0000
Received: from BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::6eb:99bf:5c45:a94b]) by BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::6eb:99bf:5c45:a94b%3]) with mapi id 15.20.5791.026; Thu, 10 Nov 2022
 01:08:56 +0000
From: "Huang, Kai" <kai.huang@intel.com>
To: "imbrenda@linux.ibm.com" <imbrenda@linux.ibm.com>, "aou@eecs.berkeley.edu"
	<aou@eecs.berkeley.edu>, "Christopherson,, Sean" <seanjc@google.com>,
	"mjrosato@linux.ibm.com" <mjrosato@linux.ibm.com>, "vkuznets@redhat.com"
	<vkuznets@redhat.com>, "farman@linux.ibm.com" <farman@linux.ibm.com>,
	"chenhuacai@kernel.org" <chenhuacai@kernel.org>, "paul.walmsley@sifive.com"
	<paul.walmsley@sifive.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
	"maz@kernel.org" <maz@kernel.org>, "anup@brainfault.org"
	<anup@brainfault.org>, "pbonzini@redhat.com" <pbonzini@redhat.com>,
	"borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>,
	"aleksandar.qemu.devel@gmail.com" <aleksandar.qemu.devel@gmail.com>,
	"frankja@linux.ibm.com" <frankja@linux.ibm.com>
Subject: Re: [PATCH 38/44] KVM: Disable CPU hotplug during hardware enabling
Thread-Topic: [PATCH 38/44] KVM: Disable CPU hotplug during hardware enabling
Thread-Index: AQHY7xJy2pUg1L4bCkib6AOkbzD9bK43Y9yA
Date: Thu, 10 Nov 2022 01:08:56 +0000
Message-ID: <4f523a166badbd61a1cfb6269334e9c9354ade64.camel@intel.com>
References: <20221102231911.3107438-1-seanjc@google.com>
	 <20221102231911.3107438-39-seanjc@google.com>
In-Reply-To: <20221102231911.3107438-39-seanjc@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4 (3.44.4-2.fc36) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5978:EE_|PH7PR11MB7004:EE_
x-ms-office365-filtering-correlation-id: b2141e33-2e02-4dd8-d3cb-08dac2b82439
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /qFPy9VWXMeGK+hFes/uZZGdeh97H2PElqBbxH2mCgwT+IQRlo8kIMnZApNHmVFhyC/2Oy6kyYaggTOX/gDoEdJI6W+uiC+6F8RYHx0lthgKVf/ufC9zAb/KyLHqwcxaE7sNrWVBsBOV6/p2qq9ZosF3VkJiaLLq02KBCm4F/2UcMyezzjqGrgtbROxoe0+u5xcMJcgfSQvREoWHVkVbx3d4lS4+EKb471S5nqQKpsczHxdVKdqIcRRfeGeW/OEXvK+NPdjo2mdLtwI6CoyrxyHDrOG16liRbMmuyLCoFWwjcyUDDWU58KOf3k7L+u0EZqnqJdh1nqAJ5fEmDR+caMIVMheTNlCksNvzQXP+aokNLzXwNPnESzqoBR1RJ/ojB2KgSCYf0zm3oYSGqQAUTOEXDpUxnz45FVsljRdk0IYdg3Ti+/hXGgKHmIeyTeGONs7XH/9sBAEONmANUBhkX5q5t7TwHm22HUPdU28EcXfcTgnxJo5TFY851GQTugLO8uQFWNka2ZQF0vYzCApzqIEUZjVbdXzbpLONXp3Kc+v8h8fHUA91rRk3A04NQsuEaSOTrnU3DTTTKQZTyqpq6owbr2ce/NCLmKm9TVddy/YrZ7G7ifAKD9zp47DOk06JeYMkTyjXw3J+h+H1QmEkwOICyAWTmk3W1Kgqgx7vHDfsquk9cP9t8wwtjUYHbaR26/d9m9Yh6VJBzA9DRNrOGmE8xd44rVoulv/uUMJskcwKygPL3QM8EyvnpvWxLvMYE1BaBpKxkI17qfnJtPx93OOn43hHAyHVDKTyVE/bC0s=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5978.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(346002)(136003)(396003)(366004)(376002)(451199015)(91956017)(86362001)(38100700002)(38070700005)(82960400001)(316002)(921005)(122000001)(54906003)(6486002)(2616005)(110136005)(2906002)(66556008)(83380400001)(66946007)(64756008)(8936002)(41300700001)(7406005)(8676002)(186003)(7416002)(66476007)(66446008)(6512007)(478600001)(26005)(4326008)(6506007)(76116006)(5660300002)(71200400001)(36756003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SDNpcHo0eVhKU1BPbzMwLzNxM1BEYW9UR2gxL0QxMy9lUTh4R2NOMFFsM2hE?=
 =?utf-8?B?bFBYL1BJaGs5UVhMenF0WUFJTjdOdGVTMGRCbGcxRkpKTHhldmhhZWlTV21m?=
 =?utf-8?B?WTNJRUV3UUhScXU3dXZkWE5lL1RmM2pFWVFwa29yUWlTVy9vcm5ZZyszL2ta?=
 =?utf-8?B?cDF3RUtUUjkyM003TnYrS1hXV2RsRmlZWjhLazIra2E1Mm4rN3BYNWJhUWdy?=
 =?utf-8?B?UTlQZG9GcklhdkFmRFJTTGt4ZmkzSVdack0yVGZtalQreWU3YWtZTXpnNXND?=
 =?utf-8?B?UGdXUUNRNGh0TldoVC8rVlFvakY5Q0JNMENWanZoSDRaOXlQdmhITlVBMFBB?=
 =?utf-8?B?UElDUVVyUmpNUkl0aWw1WDRyMmpXSTdlRE5ScHB5SlM4RGU3c2JGWHlMOGRN?=
 =?utf-8?B?YThzUnlTMEU3RCtXSEZQbjdNeHBJRWNZbUY3bVZ1RTJMOVFuY2M2c0xnQ1Bi?=
 =?utf-8?B?Z04vQ0Q1OG9tOFFOWVNFMDl2ZVNYckRiYTdFdjZVOHVjWm16dk9lVWllb0pN?=
 =?utf-8?B?VnM1d2dwMUxnSVV0WFZyT0hWNjNhb05kZGlyRmpmQ0lvUW5UMXdHWUxENm9I?=
 =?utf-8?B?NElVTVdXR3h6Vnk3cFhRanBXVHpQRmMzL1hBMWZ2Q0xzdG9rdyt6bWo4YTJJ?=
 =?utf-8?B?dDBUc1BoaFBJV3Q2VCtDUEt6bWNqME9pVy9NM0NsSEVGUUpoOUZ3S2xOWC9z?=
 =?utf-8?B?OHhhRDI3TjNzTjJvMkJvdE03VmZPS0FGSjNwTWtHVTE2cW85M3c5Ky9EcVhF?=
 =?utf-8?B?anNJVzJpQmJxZWtsYkpvSU5oUWlBYXh0OGJ6MzZ4R3JHMWx4aTNNVHFacVN5?=
 =?utf-8?B?R0gwY3pHeWhJSHRzSmJHSnVtTEtaK0JHdHVqYXpXd1A0VTN5OVN1SElTNGRl?=
 =?utf-8?B?WDJRVHo4bGtQbVZ3MFc2VTMvb2lqVmVuTmp1TzIreDlDMVFaWTlvZERUNmF0?=
 =?utf-8?B?RGlhRXNMaEpCejVDWnErQVBwMGw1UUxUVVUrQU9mZUkxam8wckcxa0Ywc1VU?=
 =?utf-8?B?NU5Jb2hwYmNKQXpwbXNKeTdXTjU5M0VTQWNpWGFKa0NaUFFpWEVBcC9OVFZv?=
 =?utf-8?B?L09XZGhYV00raGs2V2ZTUG9vdlVsNVFSUVN1K1RlZWh1UmhmakV4N1Q2OVp2?=
 =?utf-8?B?TXVCT1dQTTNxS00ycnEzcG1xK1c1NWV5dWZjb2xRVTBDeUwxL3l3VG4ybWZZ?=
 =?utf-8?B?MFBVSGF3azV1V2s0VUFGcjV4cmV3Y1ZUa3o3OENvWEFBMkF5UlJJT0syQk9G?=
 =?utf-8?B?bEFoMW1tamhaSUhTdXRJZXB2bktyU0xrckw2Qnl1V0xWdlpGaCtHcFNPNVVH?=
 =?utf-8?B?Mlo4WGJrWkNHcUwwaS9Ec0FzQiswUmNnN1dFZ1JKNVhYdUtWMGgxdzIxOXlm?=
 =?utf-8?B?ek9MM3FPKzJsU0pzbGRONS8zeXpaUlJDcWNyQVdBZGdBR1hYSm4zc29uZmhr?=
 =?utf-8?B?dTJObEdOYS8xa0RLeVZTdW8wam04SXFrcWttRVVrRHVDNk5TeEN4QzM0ZXFt?=
 =?utf-8?B?b1hpTDdyS1ZCUzJLamluS0NsbUNvVEtBYVdSazZQZ0xtU091bnZXRXFiTSsy?=
 =?utf-8?B?bzl5cXJoNzdFMnM0eHZYRFk4RmZBdkZ5STRSUmsxMHYwUVR3d3Z1RzlQajBE?=
 =?utf-8?B?OWlKb0lxV0N1Y3JoaTdPeUVpbEo4VlQ0M0hqKzMvVkdIK0gxV1haMndhMk1x?=
 =?utf-8?B?bzExMHBQZUExOTJiSEhySlNxcjdJNmNuU1FtaXF5OXkxNEtXRGZKZzNmRDhz?=
 =?utf-8?B?YzE0c2U0S3FjVXJieVVtMHpUNTdiRCs4eStUUWdwVENabVBWeUt3M1g2U1RC?=
 =?utf-8?B?a1NtL0huWXJ5N1R6WCt1a0QranV3YVJhQndnaE9Ob3dzemVWUWxJNDlWalNW?=
 =?utf-8?B?Uyt2QjN6Q01QNFdLZ3ZsQnUrcTlPYUVYWUZ3UmhTSitsQ0R4L3ptUmhNSFds?=
 =?utf-8?B?NksyZ0lzL1pjU0RtY05wRGZvNzAyMUdjVm5TdCtuckdRRjhNTStFUjZZOWZm?=
 =?utf-8?B?Z1ZOdmpiRWVxbmttOGphaFUyRVpyaTArNUFsOURlaTJXTUMydkNhWUhEYTZm?=
 =?utf-8?B?d2pIcGUwMzE5UlBENEpsVHozUDlIek1MZi9ENW9SdlN5YjluVHlvenVuNGpF?=
 =?utf-8?B?RzYza1VKcCtpelVMTDJFeGlTZUo0N1I5b0xZc3NJWWNCVW1JeThvakQ1YnNq?=
 =?utf-8?B?alE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F531378AAD316149A0F3DB4A2C117806@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5978.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2141e33-2e02-4dd8-d3cb-08dac2b82439
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2022 01:08:56.3730
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iLzH8w0zrhEm2Mhp+8JuyKIh98ykBKshLGZajwGrh1Mhe3OXS6o+w515gGEVOTZlfw9qY+mS+Q5sbchaDBvmng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7004
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
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "david@redhat.com" <david@redhat.com>, "Yao, Yuan" <yuan.yao@intel.com>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "kvmarm@lists.cs.columbia.edu" <kvmarm@lists.cs.columbia.edu>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "Gao, Chao" <chao.gao@intel.com>, "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, "atishp@atishpatra.org" <atishp@atishpatra.org>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, "tglx@linutronix.de" <tglx@linutronix.de>, "alexandru.elisei@arm.com" <alexandru.elisei@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "Yamahata, Isaku" <isaku.yamahata@intel.com>, "farosas@linux.ibm.com" <farosas@linux.ibm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "oliver.upton@linux.dev" <oliver.upton@linux.dev>, "james.morse@arm.com" <james.morse@arm.com>, "kvm-riscv
 @lists.infradead.org" <kvm-riscv@lists.infradead.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gV2VkLCAyMDIyLTExLTAyIGF0IDIzOjE5ICswMDAwLCBTZWFuIENocmlzdG9waGVyc29uIHdy
b3RlOg0KPiBGcm9tOiBDaGFvIEdhbyA8Y2hhby5nYW9AaW50ZWwuY29tPg0KPiANCj4gRGlzYWJs
ZSBDUFUgaG90cGx1ZyBkdXJpbmcgaGFyZHdhcmVfZW5hYmxlX2FsbCgpIHRvIHByZXZlbnQgdGhl
IGNvcm5lcg0KPiBjYXNlIHdoZXJlIGlmIHRoZSBmb2xsb3dpbmcgc2VxdWVuY2Ugb2NjdXJzOg0K
PiANCj4gICAxLiBBIGhvdHBsdWdnZWQgQ1BVIG1hcmtzIGl0c2VsZiBvbmxpbmUgaW4gY3B1X29u
bGluZV9tYXNrDQo+ICAgMi4gVGhlIGhvdHBsdWdnZWQgQ1BVIGVuYWJsZXMgaW50ZXJydXB0IGJl
Zm9yZSBpbnZva2luZyBLVk0ncyBPTkxJTkUNCj4gICAgICBjYWxsYmFjaw0KPiAgIDMgIGhhcmR3
YXJlX2VuYWJsZV9hbGwoKSBpcyBpbnZva2VkIG9uIGFub3RoZXIgQ1BVIHJpZ2h0DQo+IA0KPiB0
aGUgaG90cGx1Z2dlZCBDUFUgd2lsbCBiZSBpbmNsdWRlZCBpbiBvbl9lYWNoX2NwdSgpIGFuZCB0
aHVzIGdldCBzZW50DQo+IHRocm91Z2ggaGFyZHdhcmVfZW5hYmxlX25vbG9jaygpIGJlZm9yZSBr
dm1fb25saW5lX2NwdSgpIGlzIGNhbGxlZC4NCj4gDQo+ICAgICAgICAgc3RhcnRfc2Vjb25kYXJ5
IHsgLi4uDQo+ICAgICAgICAgICAgICAgICBzZXRfY3B1X29ubGluZShzbXBfcHJvY2Vzc29yX2lk
KCksIHRydWUpOyA8LSAxDQo+ICAgICAgICAgICAgICAgICAuLi4NCj4gICAgICAgICAgICAgICAg
IGxvY2FsX2lycV9lbmFibGUoKTsgIDwtIDINCj4gICAgICAgICAgICAgICAgIC4uLg0KPiAgICAg
ICAgICAgICAgICAgY3B1X3N0YXJ0dXBfZW50cnkoQ1BVSFBfQVBfT05MSU5FX0lETEUpOyA8LSAz
DQo+ICAgICAgICAgfQ0KPiANCj4gS1ZNIGN1cnJlbnRseSBmdWRnZXMgYXJvdW5kIHRoaXMgcmFj
ZSBieSBrZWVwaW5nIHRyYWNrIG9mIHdoaWNoIENQVXMgaGF2ZQ0KPiBkb25lIGhhcmR3YXJlIGVu
YWJsaW5nIChzZWUgY29tbWl0IDFiNmMwMTY4MThhNSAiS1ZNOiBLZWVwIHRyYWNrIG9mIHdoaWNo
DQo+IGNwdXMgaGF2ZSB2aXJ0dWFsaXphdGlvbiBlbmFibGVkIiksIGJ1dCB0aGF0J3MgYW4gaW5l
ZmZpY2llbnQsIGNvbnZvbHV0ZWQsDQo+IGFuZCBoYWNreSBzb2x1dGlvbi4NCj4gDQo+IFNpZ25l
ZC1vZmYtYnk6IENoYW8gR2FvIDxjaGFvLmdhb0BpbnRlbC5jb20+DQo+IFtzZWFuOiBzcGxpdCB0
byBzZXBhcmF0ZSBwYXRjaCwgd3JpdGUgY2hhbmdlbG9nXQ0KPiBTaWduZWQtb2ZmLWJ5OiBTZWFu
IENocmlzdG9waGVyc29uIDxzZWFuamNAZ29vZ2xlLmNvbT4NCj4gLS0tDQo+ICBhcmNoL3g4Ni9r
dm0veDg2LmMgIHwgIDggKysrKysrKy0NCj4gIHZpcnQva3ZtL2t2bV9tYWluLmMgfCAxMCArKysr
KysrKysrDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkNCj4gDQo+IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rdm0veDg2LmMgYi9hcmNoL3g4Ni9rdm0v
eDg2LmMNCj4gaW5kZXggYTdiMWQ5MTZlY2IyLi5hMTVlNTRiYTA0NzEgMTAwNjQ0DQo+IC0tLSBh
L2FyY2gveDg2L2t2bS94ODYuYw0KPiArKysgYi9hcmNoL3g4Ni9rdm0veDg2LmMNCj4gQEAgLTky
ODMsNyArOTI4MywxMyBAQCBzdGF0aWMgaW50IGt2bV94ODZfY2hlY2tfcHJvY2Vzc29yX2NvbXBh
dGliaWxpdHkoc3RydWN0IGt2bV94ODZfaW5pdF9vcHMgKm9wcykNCj4gIAlpbnQgY3B1ID0gc21w
X3Byb2Nlc3Nvcl9pZCgpOw0KPiAgCXN0cnVjdCBjcHVpbmZvX3g4NiAqYyA9ICZjcHVfZGF0YShj
cHUpOw0KPiAgDQo+IC0JV0FSTl9PTighaXJxc19kaXNhYmxlZCgpKTsNCj4gKwkvKg0KPiArCSAq
IENvbXBhdGliaWxpdHkgY2hlY2tzIGFyZSBkb25lIHdoZW4gbG9hZGluZyBLVk0gYW5kIHdoZW4g
ZW5hYmxpbmcNCj4gKwkgKiBoYXJkd2FyZSwgZS5nLiBkdXJpbmcgQ1BVIGhvdHBsdWcsIHRvIGVu
c3VyZSBhbGwgb25saW5lIENQVXMgYXJlDQo+ICsJICogY29tcGF0aWJsZSwgaS5lLiBLVk0gc2hv
dWxkIG5ldmVyIHBlcmZvcm0gYSBjb21wYXRpYmlsaXR5IGNoZWNrIG9uDQo+ICsJICogYW4gb2Zm
bGluZSBDUFUuDQo+ICsJICovDQo+ICsJV0FSTl9PTighaXJxc19kaXNhYmxlZCgpICYmIGNwdV9h
Y3RpdmUoY3B1KSk7DQoNCkNvbW1lbnQgZG9lc24ndCBtYXRjaCB3aXRoIHRoZSBjb2RlPw0KDQoi
S1ZNIHNob3VsZCBuZXZlciBwZXJmb3JtIGEgY29tcGF0aWJpbGl0eSBjaGVjayBvbiBvbiBvZmZs
aW5lIENQVSIgc2hvdWxkIGJlDQpzb21ldGhpbmcgbGlrZToNCg0KCVdBUk5fT04oIWNwdV9vbmxp
bmUoY3B1KSk7DQoNClNvLCBzaG91bGQgdGhlIGNvbW1lbnQgYmUgc29tZXRoaW5nIGxpa2UgYmVs
b3c/DQoNCiJLVk0gY29tcGF0aWJpbGl0eSBjaGVjayBoYXBwZW5zIGJlZm9yZSBDUFUgaXMgbWFy
a2VkIGFzIGFjdGl2ZSIuDQoNCj4gIA0KPiAgCWlmIChfX2NyNF9yZXNlcnZlZF9iaXRzKGNwdV9o
YXMsIGMpICE9DQo+ICAJICAgIF9fY3I0X3Jlc2VydmVkX2JpdHMoY3B1X2hhcywgJmJvb3RfY3B1
X2RhdGEpKQ0KPiBkaWZmIC0tZ2l0IGEvdmlydC9rdm0va3ZtX21haW4uYyBiL3ZpcnQva3ZtL2t2
bV9tYWluLmMNCj4gaW5kZXggZmQ5ZTM5Yzg1NTQ5Li40ZTc2NWVmOWY0YmQgMTAwNjQ0DQo+IC0t
LSBhL3ZpcnQva3ZtL2t2bV9tYWluLmMNCj4gKysrIGIvdmlydC9rdm0va3ZtX21haW4uYw0KPiBA
QCAtNTA4OCw2ICs1MDg4LDE1IEBAIHN0YXRpYyBpbnQgaGFyZHdhcmVfZW5hYmxlX2FsbCh2b2lk
KQ0KPiAgew0KPiAgCWludCByID0gMDsNCj4gIA0KPiArCS8qDQo+ICsJICogV2hlbiBvbmxpbmlu
ZyBhIENQVSwgY3B1X29ubGluZV9tYXNrIGlzIHNldCBiZWZvcmUga3ZtX29ubGluZV9jcHUoKQ0K
PiArCSAqIGlzIGNhbGxlZCwgYW5kIHNvIG9uX2VhY2hfY3B1KCkgYmV0d2VlbiB0aGVtIGluY2x1
ZGVzIHRoZSBDUFUgdGhhdA0KPiArCSAqIGlzIGJlaW5nIG9ubGluZWQuICBBcyBhIHJlc3VsdCwg
aGFyZHdhcmVfZW5hYmxlX25vbG9jaygpIG1heSBnZXQNCj4gKwkgKiBpbnZva2VkIGJlZm9yZSBr
dm1fb25saW5lX2NwdSgpLg0KPiArCSAqDQo+ICsJICogRGlzYWJsZSBDUFUgaG90cGx1ZyB0byBw
cmV2ZW50IHNjZW5hcmlvcyB3aGVyZSBLVk0gc2Vlcw0KPiArCSAqLw0KDQpUaGUgYWJvdmUgc2Vu
dGVuY2UgaXMgYnJva2VuLg0KDQpJIHRoaW5rIGJlbG93IGNvbW1lbnQgUXVvdGVkIGZyb20gSXNh
a3UncyBzZXJpZXMgc2hvdWxkIGJlIE9LPw0KDQoJLyoNCgkgKiBEdXJpbmcgb25saW5pbmcgYSBD
UFUsIGNwdV9vbmxpbmVfbWFzayBpcyBzZXQgYmVmb3JlDQprdm1fb25saW5lX2NwdSgpDQoJICog
aXMgY2FsbGVkLiBvbl9lYWNoX2NwdSgpIGJldHdlZW4gdGhlbSBpbmNsdWRlcyB0aGUgQ1BVLiBB
cyBhIHJlc3VsdCwNCgkgKiBoYXJkd2FyZV9lbmFibGVfbm9sb2NrKCkgbWF5IGdldCBpbnZva2Vk
IGJlZm9yZSBrdm1fb25saW5lX2NwdSgpLg0KCSAqIFRoaXMgd291bGQgZW5hYmxlIGhhcmR3YXJl
IHZpcnR1YWxpemF0aW9uIG9uIHRoYXQgY3B1IHdpdGhvdXQNCgkgKiBjb21wYXRpYmlsaXR5IGNo
ZWNrcywgd2hpY2ggY2FuIHBvdGVudGlhbGx5IGNyYXNoIHN5c3RlbSBvciBicmVhaw0KCSAqIHJ1
bm5pbmcgVk1zLg0KCSAqDQoJICogRGlzYWJsZSBDUFUgaG90cGx1ZyB0byBwcmV2ZW50IHRoaXMg
Y2FzZSBmcm9tIGhhcHBlbmluZy4NCgkgKi8NCg0KPiArCWNwdXNfcmVhZF9sb2NrKCk7DQo+ICAJ
cmF3X3NwaW5fbG9jaygma3ZtX2NvdW50X2xvY2spOw0KPiAgDQo+ICAJa3ZtX3VzYWdlX2NvdW50
Kys7DQo+IEBAIC01MTAyLDYgKzUxMTEsNyBAQCBzdGF0aWMgaW50IGhhcmR3YXJlX2VuYWJsZV9h
bGwodm9pZCkNCj4gIAl9DQo+ICANCj4gIAlyYXdfc3Bpbl91bmxvY2soJmt2bV9jb3VudF9sb2Nr
KTsNCj4gKwljcHVzX3JlYWRfdW5sb2NrKCk7DQo+ICANCj4gIAlyZXR1cm4gcjsNCj4gIH0NCg0K
