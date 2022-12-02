Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D864640764
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Dec 2022 14:02:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NNtQJ74lQz3bgP
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Dec 2022 00:02:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hgsub3Od;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.31; helo=mga06.intel.com; envelope-from=kai.huang@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hgsub3Od;
	dkim-atps=neutral
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NNtPJ5ptKz2xHb
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Dec 2022 00:01:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669986101; x=1701522101;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=aqZXLt1WlRpGTjHIKSC9AII12PephzHwg6VCmqrUgT4=;
  b=hgsub3OdBfL3BqezatjaXa/iLb1X/KLpqTtPj3AquGdgKX6vKscg+mNJ
   VbS/PNrR0aQsrxhSr1eJnKiV0RD3vZJroBnAvDU4+Ix2SXxjGacKMwQmU
   rKHuTGSJkMPzBy5NWXPYSLlpQxitPrTz5RvAZ0qmYL28Piwcdx0szbsOB
   3okoTDmBz6OY5CSZq1J9r3Tg7SnbYHsJNmLXmde7FG8lVhKDfdb1vSmvj
   EpsK4KarrjKgD/0OvQKhOxhnrdznoPGfExrp6+DblyhSUNnK7ACvvsu7p
   VUI4Z5POHXMKLj+4F8j+hy1nAVetJt7rLnfao1ewPANQCFikEkyeOMpS1
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="378100820"
X-IronPort-AV: E=Sophos;i="5.96,212,1665471600"; 
   d="scan'208";a="378100820"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2022 05:01:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="751255002"
X-IronPort-AV: E=Sophos;i="5.96,212,1665471600"; 
   d="scan'208";a="751255002"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmsmga002.fm.intel.com with ESMTP; 02 Dec 2022 05:01:35 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 2 Dec 2022 05:01:29 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 2 Dec 2022 05:01:29 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 2 Dec 2022 05:01:29 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.46) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 2 Dec 2022 05:01:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JBKtPLDeRyGdVGzzti82ibIGZJ/v3J5KlcehfYjKtwsRV6Ayd4NghnN8+7FqqENJ0BPb8oXvmZzdx0MeB4eVJIDatOhv4wR0ae38A5FEnAZeqUTK7CnpBUAv8ABRIKzVe0dTtVqAiZZLPVDtm7aLJ2SysOcuu5CM/nGPJ91s98K7l0WZEoxrn0q1HrorFkK/eQpdMJ42X8pAmpVu7sG2N3imiBKN1tK/I7C+z/dBAxaWAK+2NwElVHslyKY8DQRyDmEYzLnCn4UsoW32fXhfb4vqa4fd5y5pw0vIrJBGbk9Rb258Fi5Kne5pWkkBloKqElidBbWqfTMCd2QyyXPMOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aqZXLt1WlRpGTjHIKSC9AII12PephzHwg6VCmqrUgT4=;
 b=V94vjaZPYNnMySpbycpa5cusrAyrsRZ/u2eWXvbIg9WLuW1qa33iAKSa0GQg8xxfrGi9mYOX2/W71OSrv4TRdZUlTRT5YjNSvuWofnIFnQFyT4ecxz1+aE/CnOdjgr3V4yRMW3uCcorKw0vMh/5ftGA8I8GJf/M4GCiYmbAcjFtqS3/T52lNnAm/K6ZaDmkz1SM1+HDEi8yO66k6ydB9MYJT9PbppPJpRVBAyy0SrmL79/YszmopjwswlqVV6cFRUqZbgWgkIVNXV61kyXpz3dI0HPTMDPPatMXPncSkzh19D2km+3ye0tQRk+EHSqP4KTG6pBRbTFe1TgsjJ6LaVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5978.namprd11.prod.outlook.com (2603:10b6:208:385::18)
 by CH3PR11MB7818.namprd11.prod.outlook.com (2603:10b6:610:129::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Fri, 2 Dec
 2022 13:01:24 +0000
Received: from BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::2fb7:be18:a20d:9b6e]) by BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::2fb7:be18:a20d:9b6e%9]) with mapi id 15.20.5857.023; Fri, 2 Dec 2022
 13:01:24 +0000
From: "Huang, Kai" <kai.huang@intel.com>
To: "chenhuacai@kernel.org" <chenhuacai@kernel.org>, "maz@kernel.org"
	<maz@kernel.org>, "frankja@linux.ibm.com" <frankja@linux.ibm.com>,
	"borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>,
	"farman@linux.ibm.com" <farman@linux.ibm.com>, "aou@eecs.berkeley.edu"
	<aou@eecs.berkeley.edu>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
	"Christopherson,, Sean" <seanjc@google.com>, "paul.walmsley@sifive.com"
	<paul.walmsley@sifive.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>,
	"dwmw2@infradead.org" <dwmw2@infradead.org>,
	"aleksandar.qemu.devel@gmail.com" <aleksandar.qemu.devel@gmail.com>,
	"imbrenda@linux.ibm.com" <imbrenda@linux.ibm.com>, "paul@xen.org"
	<paul@xen.org>, "mjrosato@linux.ibm.com" <mjrosato@linux.ibm.com>,
	"vkuznets@redhat.com" <vkuznets@redhat.com>, "anup@brainfault.org"
	<anup@brainfault.org>
Subject: Re: [PATCH v2 39/50] KVM: x86: Move CPU compat checks hook to
 kvm_x86_ops (from kvm_x86_init_ops)
Thread-Topic: [PATCH v2 39/50] KVM: x86: Move CPU compat checks hook to
 kvm_x86_ops (from kvm_x86_init_ops)
Thread-Index: AQHZBREEXtDOKnrjT0enXrS6tk8i165akjeA
Date: Fri, 2 Dec 2022 13:01:24 +0000
Message-ID: <1b0ece3937436f59f466c352b84cb35f84347399.camel@intel.com>
References: <20221130230934.1014142-1-seanjc@google.com>
	 <20221130230934.1014142-40-seanjc@google.com>
In-Reply-To: <20221130230934.1014142-40-seanjc@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4 (3.44.4-2.fc36) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5978:EE_|CH3PR11MB7818:EE_
x-ms-office365-filtering-correlation-id: cd298c8c-69e5-495b-a330-08dad4655129
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: i73RYT/8IkegGzI3F6yi9S+VQDoThyiF27KPwrNSIJ+NhKikyrLoHADeK5u3zb81RNsQFglyRDKn6Ul7bl7a0AHhVjaX0BaLcxKe/7aWLafYvI4/aGzNikDKKmIqR3Rxyqwq2h1ypVjNjruxFam+9GCiuL1Nb2KfhOkb9Nra7FMZyvsYHx44yZ01VWfLqpCjLsQLuajxqjlEVLHUsIMM6mp3L5lzjiHnkq66RpP3uugvaYZtF2aJFJKs95f8d7vTKSzrLP5DunLmLxYi0pdTiY22AAe0bQntPMikuEeCTzTsshpqWOaBJ3p6LtwpwAWrN0ylXkLOC/IFzgEPlKodcNZFGSs3LCNCjyJzpNDNG53L542GqQO+rp1Mc/8vMPsypthd9kxBZV3CzmKnznCYHz6/FskbXHb+Pg6eVhfyFbBPGC1mkcuBaU3nqU/r77yohLdrj0tML1VU5XFxL+X/bqSTcGGdZV/4toFCKXlyHj7Mnx16nFoCBLcecYY5SDgRY8A52OvK4E9596i6Z636ELzckTSgDCzVvy+S44URhuX8n6npspLApwBRvKvBHsBhWbH5HVrtLIIBOxH2KuLkzivofLjJ9uUJUoXX9Ti+5K0Xhi7JoTsFMeZj74wdEZbUDsWLkCP+PZa85I/+bnAVyrJBt2cBX1xZT5cX0wspYk9hOfP0g3X2NxoQ92aBkGVfJkSb/WUZfslBAbnTWZgjIEWUGNWAwQsABPQiOJp/t3A=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5978.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(136003)(396003)(346002)(366004)(39860400002)(451199015)(36756003)(316002)(921005)(86362001)(54906003)(71200400001)(110136005)(38070700005)(6486002)(82960400001)(478600001)(64756008)(4001150100001)(7406005)(91956017)(4326008)(76116006)(8676002)(7416002)(66946007)(41300700001)(66476007)(66556008)(66446008)(8936002)(107886003)(83380400001)(26005)(38100700002)(6512007)(2906002)(5660300002)(6506007)(122000001)(186003)(2616005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a1FSYUxPbGswYXJDUnNGV0ZLUkhTYUlYVU5maTQ3empwbElKRk1WMno0R0du?=
 =?utf-8?B?VEJkakN0MkZiUThVYlpOSEdNbXBqeEZqaGp3SE5rRVhPVitjdHJyQ1YzOG9a?=
 =?utf-8?B?OG9QczF5YnpvR09UYld2R0M5clRvbkJneThLQ3RqblMxNVVUNzNuUGQxWkkv?=
 =?utf-8?B?eHBDdERrS2dNMU4ySW9zbFNuRVZlQjIrSnlQcjJWOXlLak1BVXc4TldNTTdu?=
 =?utf-8?B?KzNrK1l3ZjFTRlJ4Z0E1bjgxcnBWL1dkc050Q016cklWdjdhNm5UcDFrR2VC?=
 =?utf-8?B?aFY3ZDJKT1k1SGFaaGl5UUlRVmJhYXhWWVkxTVJmRkliT0x5SkpISEVndEdv?=
 =?utf-8?B?a1I1aDRRbHRrZkkwTngrbit0N3lhNzJqb2dSbVFLVTJnK090VzBrNFhLQ0xI?=
 =?utf-8?B?THAvWGlFUkRJLzBGV0tpNXV0Vk1WNzU2aGVGdG1rekFKTzFCa0tPVTlRbmZk?=
 =?utf-8?B?ZExreVYvOWVYTTBYLzQxOW5QZUVEaHNBMW5ZSUhHcUFWRUppQVpleHBhRnRh?=
 =?utf-8?B?YVpGQzRDRlJ3dzVCY0hkbElUcVJnRVFCaHRsbHJLRjY4K2d1ZmlBd3UvUVla?=
 =?utf-8?B?bi9RanRCTDc0UTljUU5TVDNWeGQvcFdOMDkydU9mVm1ZL0pqZCtCS1hSd05P?=
 =?utf-8?B?VTQ2S2tiYnJNUEFDVjhhUkNaaVBuUVhGb1JnaDV4MlYzN25iVmNzZmxUNE9Y?=
 =?utf-8?B?Mk9rWlpkOWJaVDBFYldQQnZhZmJXZ3BzekdqYnVLL0tPaXczWFlHaEVYV1c3?=
 =?utf-8?B?b0g5cjJMdU1WaFpKZzg0bW1UUGNGaU9iOCtYQ3RxU01CZGtUSWxhQlhGYzg3?=
 =?utf-8?B?bW5KMHZOTHlORHJWcFJwMzcvdFQ4QzczRlhtSzRzQlByMDJuTkNWMDRQcFhZ?=
 =?utf-8?B?aE1XZGhwZnQvQ0R6bkxBeVhXRG1uanZDbmRXZW1RVTdPVlJaOXBiQ2FJYm1Q?=
 =?utf-8?B?MGJ5R3ZBdTNUS1MyNEpHT3VhTFpOYWhkaU95SFNrVXBXOUZ4NDg5SjlDOTZq?=
 =?utf-8?B?c2tyazZxSlBkNXpzMXpaUEMvdzF0OTE5NUw3NEU4WCs4anRobVkzeFE2Q0pt?=
 =?utf-8?B?RERlZDFzSGhFSlNWR0NaaHBvN25pNVRpcDg2TUZMdThhbjJ5L291eGZVRGhM?=
 =?utf-8?B?NUw0ekxHbFcwZEprbHB1MnZhUURHL2hRVVZMWEtsT2UyQ0cvbzJRR2dScHJl?=
 =?utf-8?B?VXhGTTVJL1hrV3h4Ymh5WmJMMFB4a3d1dmdZU2dobW9sb1d6Y2lvUyt6QUY5?=
 =?utf-8?B?a045VU5FL2hEWEt6OG9ZejFGeWxISWlpcUFoYkk2eTUydzc5TmJraFpVekd4?=
 =?utf-8?B?TE1WWHQ2U1R2Y2ltdVE4YlAxNDFsem1MbUFKR3h6MDZwVU1acURScnFBMEsy?=
 =?utf-8?B?YzJsc21NaHo3bFJhWmJoWEhnd05CR2pJTjhqTkRVL3dOZU50NnhOMG5iUHlw?=
 =?utf-8?B?Y0dxOEZjTk91THFvTmlxNzJkcVIrUHFzS2dscGRwTmZBRXVmb3d0K2haSEtN?=
 =?utf-8?B?SjlZdXFiL1Rhb2swMUFvMG1yQm1QOXp6VmF6Z2doSGRyTXpmYitHQk1RbkZk?=
 =?utf-8?B?VFFrYklSWlFGZlNka1BrU3JoMGNTYmRtcnRQY1FSVXBjMkZUMThYYWFLbTk5?=
 =?utf-8?B?SWRWcnErOGIxYkFuN0JsWXdTdU9qNjBQSnB2YUlDK2gxTWgwRml6R3BVWHlX?=
 =?utf-8?B?VVFWTWYxK0tUVWh4WjJ1VnVTZnZKS1diQnltL0cvWjllUW81a2MyeitPdVFn?=
 =?utf-8?B?TXZ3OUJDN0JId0taV0RCd0xsMlJvdFlWZ0JpdWVjaGJIcVQwTEpub3pvYTBQ?=
 =?utf-8?B?WHJVNXdMZE4zK2ZRRFA1RG4rQktEeFdPaHhzc2pJZmI2dWQ3OCtidzJrQUQ4?=
 =?utf-8?B?UWFpc3M5YjZtc29lL09PbGJNem1XdjV1RDJKenRnRVhqc0U2bWRXV0gvMnBX?=
 =?utf-8?B?MXZRNzN0Z25DZngxU3hjazFXek1QMU9NN3B0TFZVNGNJejRkL3V3eGU2Qkdm?=
 =?utf-8?B?ZDNoRytTSjdkQUwxVzIzUnlmTllSY1k3ZHFJa3Q0RXBjcDZnaG9ZY2VJbS9S?=
 =?utf-8?B?T0ZvMm5jNFlGS21YZXE3c0NIN2h4Tm9Pcm1UcTBtOTRDQWdhQWVETmIxdmNo?=
 =?utf-8?B?Y3pjenhkdndpWWg3MkNVZzFBbXV6VFU4djhVNTRKYmxMUFRmbzZmcGREZ0pC?=
 =?utf-8?B?ZlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AAA12427268DEE47A4504740CB297790@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5978.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd298c8c-69e5-495b-a330-08dad4655129
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2022 13:01:24.4658
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mtNGYq+uOMk6mAsbqmZMiACho43xu6iVNAtXSD75aFVMaQFueHVp9Rc8/Dqg6lZ0JQ0F+5aOoNI1ltcQYKMARw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7818
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
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "david@redhat.com" <david@redhat.com>, "Yao, Yuan" <yuan.yao@intel.com>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "kvmarm@lists.cs.columbia.edu" <kvmarm@lists.cs.columbia.edu>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "Gao,
 Chao" <chao.gao@intel.com>, "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, "atishp@atishpatra.org" <atishp@atishpatra.org>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, "tglx@linutronix.de" <tglx@linutronix.de>, "alexandru.elisei@arm.com" <alexandru.elisei@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "Yamahata, Isaku" <isaku.yamahata@intel.com>, "philmd@linaro.org" <philmd@linaro.org>, "farosas@linux.ibm.com" <farosas@linux.ibm.com>, "cohuck@redhat.com" <cohuck@redhat.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "oliver.upton@linux.dev" <oliver.upton@linux.dev>, "james.morse@arm.com" <james.morse@arm.com>, "kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gV2VkLCAyMDIyLTExLTMwIGF0IDIzOjA5ICswMDAwLCBTZWFuIENocmlzdG9waGVyc29uIHdy
b3RlOg0KPiBNb3ZlIHRoZSAuY2hlY2tfcHJvY2Vzc29yX2NvbXBhdGliaWxpdHkoKSBjYWxsYmFj
ayBmcm9tIGt2bV94ODZfaW5pdF9vcHMNCj4gdG8ga3ZtX3g4Nl9vcHMgdG8gYWxsb3cgYSBmdXR1
cmUgcGF0Y2ggdG8gZG8gY29tcGF0aWJpbGl0eSBjaGVja3MgZHVyaW5nDQo+IENQVSBob3RwbHVn
Lg0KPiANCj4gRG8ga3ZtX29wc191cGRhdGUoKSBiZWZvcmUgY29tcGF0IGNoZWNrcyBzbyB0aGF0
IHN0YXRpY19jYWxsKCkgY2FuIGJlDQo+IHVzZWQgZHVyaW5nIGNvbXBhdCBjaGVja3MuDQo+IA0K
PiBTaWduZWQtb2ZmLWJ5OiBTZWFuIENocmlzdG9waGVyc29uIDxzZWFuamNAZ29vZ2xlLmNvbT4N
Cg0KUmV2aWV3ZWQtYnk6IEthaSBIdWFuZyA8a2FpLmh1YW5nQGludGVsLmNvbT4NCg0KPiAtLS0N
Cj4gIGFyY2gveDg2L2luY2x1ZGUvYXNtL2t2bS14ODYtb3BzLmggfCAgMSArDQo+ICBhcmNoL3g4
Ni9pbmNsdWRlL2FzbS9rdm1faG9zdC5oICAgIHwgIDMgKystDQo+ICBhcmNoL3g4Ni9rdm0vc3Zt
L3N2bS5jICAgICAgICAgICAgIHwgIDUgKysrLS0NCj4gIGFyY2gveDg2L2t2bS92bXgvdm14LmMg
ICAgICAgICAgICAgfCAxNiArKysrKysrLS0tLS0tLS0NCj4gIGFyY2gveDg2L2t2bS94ODYuYyAg
ICAgICAgICAgICAgICAgfCAzMSArKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gIDUg
ZmlsZXMgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKSwgMzEgZGVsZXRpb25zKC0pDQo+IA0KPiBk
aWZmIC0tZ2l0IGEvYXJjaC94ODYvaW5jbHVkZS9hc20va3ZtLXg4Ni1vcHMuaCBiL2FyY2gveDg2
L2luY2x1ZGUvYXNtL2t2bS14ODYtb3BzLmgNCj4gaW5kZXggYWJjY2Q1MWRjZmNhLi5kYmEyOTA5
ZTVhZTIgMTAwNjQ0DQo+IC0tLSBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL2t2bS14ODYtb3BzLmgN
Cj4gKysrIGIvYXJjaC94ODYvaW5jbHVkZS9hc20va3ZtLXg4Ni1vcHMuaA0KPiBAQCAtMTQsNiAr
MTQsNyBAQCBCVUlMRF9CVUdfT04oMSkNCj4gICAqIHRvIG1ha2UgYSBkZWZpbml0aW9uIG9wdGlv
bmFsLCBidXQgaW4gdGhpcyBjYXNlIHRoZSBkZWZhdWx0IHdpbGwNCj4gICAqIGJlIF9fc3RhdGlj
X2NhbGxfcmV0dXJuMC4NCj4gICAqLw0KPiArS1ZNX1g4Nl9PUChjaGVja19wcm9jZXNzb3JfY29t
cGF0aWJpbGl0eSkNCj4gIEtWTV9YODZfT1AoaGFyZHdhcmVfZW5hYmxlKQ0KPiAgS1ZNX1g4Nl9P
UChoYXJkd2FyZV9kaXNhYmxlKQ0KPiAgS1ZNX1g4Nl9PUChoYXJkd2FyZV91bnNldHVwKQ0KPiBk
aWZmIC0tZ2l0IGEvYXJjaC94ODYvaW5jbHVkZS9hc20va3ZtX2hvc3QuaCBiL2FyY2gveDg2L2lu
Y2x1ZGUvYXNtL2t2bV9ob3N0LmgNCj4gaW5kZXggZDc5YWVkZjcwOTA4Li5iYTc0ZmVhNjg1MGIg
MTAwNjQ0DQo+IC0tLSBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmgNCj4gKysrIGIv
YXJjaC94ODYvaW5jbHVkZS9hc20va3ZtX2hvc3QuaA0KPiBAQCAtMTUxOCw2ICsxNTE4LDggQEAg
c3RhdGljIGlubGluZSB1MTYga3ZtX2xhcGljX2lycV9kZXN0X21vZGUoYm9vbCBkZXN0X21vZGVf
bG9naWNhbCkNCj4gIHN0cnVjdCBrdm1feDg2X29wcyB7DQo+ICAJY29uc3QgY2hhciAqbmFtZTsN
Cj4gIA0KPiArCWludCAoKmNoZWNrX3Byb2Nlc3Nvcl9jb21wYXRpYmlsaXR5KSh2b2lkKTsNCj4g
Kw0KPiAgCWludCAoKmhhcmR3YXJlX2VuYWJsZSkodm9pZCk7DQo+ICAJdm9pZCAoKmhhcmR3YXJl
X2Rpc2FibGUpKHZvaWQpOw0KPiAgCXZvaWQgKCpoYXJkd2FyZV91bnNldHVwKSh2b2lkKTsNCj4g
QEAgLTE3MjksNyArMTczMSw2IEBAIHN0cnVjdCBrdm1feDg2X25lc3RlZF9vcHMgew0KPiAgfTsN
Cj4gIA0KPiAgc3RydWN0IGt2bV94ODZfaW5pdF9vcHMgew0KPiAtCWludCAoKmNoZWNrX3Byb2Nl
c3Nvcl9jb21wYXRpYmlsaXR5KSh2b2lkKTsNCj4gIAlpbnQgKCpoYXJkd2FyZV9zZXR1cCkodm9p
ZCk7DQo+ICAJdW5zaWduZWQgaW50ICgqaGFuZGxlX2ludGVsX3B0X2ludHIpKHZvaWQpOw0KPiAg
DQo+IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rdm0vc3ZtL3N2bS5jIGIvYXJjaC94ODYva3ZtL3N2
bS9zdm0uYw0KPiBpbmRleCA5Zjk0ZWZjYjlhYTYuLmMyZTk1YzBkOWZkOCAxMDA2NDQNCj4gLS0t
IGEvYXJjaC94ODYva3ZtL3N2bS9zdm0uYw0KPiArKysgYi9hcmNoL3g4Ni9rdm0vc3ZtL3N2bS5j
DQo+IEBAIC01NDMsNyArNTQzLDcgQEAgc3RhdGljIGJvb2wga3ZtX2lzX3N2bV9zdXBwb3J0ZWQo
dm9pZCkNCj4gIAlyZXR1cm4gdHJ1ZTsNCj4gIH0NCj4gIA0KPiAtc3RhdGljIGludCBfX2luaXQg
c3ZtX2NoZWNrX3Byb2Nlc3Nvcl9jb21wYXQodm9pZCkNCj4gK3N0YXRpYyBpbnQgc3ZtX2NoZWNr
X3Byb2Nlc3Nvcl9jb21wYXQodm9pZCkNCj4gIHsNCj4gIAlpZiAoIWt2bV9pc19zdm1fc3VwcG9y
dGVkKCkpDQo+ICAJCXJldHVybiAtRUlPOw0KPiBAQCAtNDY5NSw2ICs0Njk1LDggQEAgc3RhdGlj
IGludCBzdm1fdm1faW5pdChzdHJ1Y3Qga3ZtICprdm0pDQo+ICBzdGF0aWMgc3RydWN0IGt2bV94
ODZfb3BzIHN2bV94ODZfb3BzIF9faW5pdGRhdGEgPSB7DQo+ICAJLm5hbWUgPSBLQlVJTERfTU9E
TkFNRSwNCj4gIA0KPiArCS5jaGVja19wcm9jZXNzb3JfY29tcGF0aWJpbGl0eSA9IHN2bV9jaGVj
a19wcm9jZXNzb3JfY29tcGF0LA0KPiArDQo+ICAJLmhhcmR3YXJlX3Vuc2V0dXAgPSBzdm1faGFy
ZHdhcmVfdW5zZXR1cCwNCj4gIAkuaGFyZHdhcmVfZW5hYmxlID0gc3ZtX2hhcmR3YXJlX2VuYWJs
ZSwNCj4gIAkuaGFyZHdhcmVfZGlzYWJsZSA9IHN2bV9oYXJkd2FyZV9kaXNhYmxlLA0KPiBAQCAt
NTA3OSw3ICs1MDgxLDYgQEAgc3RhdGljIF9faW5pdCBpbnQgc3ZtX2hhcmR3YXJlX3NldHVwKHZv
aWQpDQo+ICANCj4gIHN0YXRpYyBzdHJ1Y3Qga3ZtX3g4Nl9pbml0X29wcyBzdm1faW5pdF9vcHMg
X19pbml0ZGF0YSA9IHsNCj4gIAkuaGFyZHdhcmVfc2V0dXAgPSBzdm1faGFyZHdhcmVfc2V0dXAs
DQo+IC0JLmNoZWNrX3Byb2Nlc3Nvcl9jb21wYXRpYmlsaXR5ID0gc3ZtX2NoZWNrX3Byb2Nlc3Nv
cl9jb21wYXQsDQo+ICANCj4gIAkucnVudGltZV9vcHMgPSAmc3ZtX3g4Nl9vcHMsDQo+ICAJLnBt
dV9vcHMgPSAmYW1kX3BtdV9vcHMsDQo+IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rdm0vdm14L3Zt
eC5jIGIvYXJjaC94ODYva3ZtL3ZteC92bXguYw0KPiBpbmRleCAyYThhNmU0ODFjNzYuLjY0MTZl
ZDViN2Y4OSAxMDA2NDQNCj4gLS0tIGEvYXJjaC94ODYva3ZtL3ZteC92bXguYw0KPiArKysgYi9h
cmNoL3g4Ni9rdm0vdm14L3ZteC5jDQo+IEBAIC0yNTIwLDggKzI1MjAsNyBAQCBzdGF0aWMgYm9v
bCBjcHVfaGFzX3BlcmZfZ2xvYmFsX2N0cmxfYnVnKHZvaWQpDQo+ICAJcmV0dXJuIGZhbHNlOw0K
PiAgfQ0KPiAgDQo+IC1zdGF0aWMgX19pbml0IGludCBhZGp1c3Rfdm14X2NvbnRyb2xzKHUzMiBj
dGxfbWluLCB1MzIgY3RsX29wdCwNCj4gLQkJCQkgICAgICB1MzIgbXNyLCB1MzIgKnJlc3VsdCkN
Cj4gK3N0YXRpYyBpbnQgYWRqdXN0X3ZteF9jb250cm9scyh1MzIgY3RsX21pbiwgdTMyIGN0bF9v
cHQsIHUzMiBtc3IsIHUzMiAqcmVzdWx0KQ0KPiAgew0KPiAgCXUzMiB2bXhfbXNyX2xvdywgdm14
X21zcl9oaWdoOw0KPiAgCXUzMiBjdGwgPSBjdGxfbWluIHwgY3RsX29wdDsNCj4gQEAgLTI1Mzks
NyArMjUzOCw3IEBAIHN0YXRpYyBfX2luaXQgaW50IGFkanVzdF92bXhfY29udHJvbHModTMyIGN0
bF9taW4sIHUzMiBjdGxfb3B0LA0KPiAgCXJldHVybiAwOw0KPiAgfQ0KPiAgDQo+IC1zdGF0aWMg
X19pbml0IHU2NCBhZGp1c3Rfdm14X2NvbnRyb2xzNjQodTY0IGN0bF9vcHQsIHUzMiBtc3IpDQo+
ICtzdGF0aWMgdTY0IGFkanVzdF92bXhfY29udHJvbHM2NCh1NjQgY3RsX29wdCwgdTMyIG1zcikN
Cj4gIHsNCj4gIAl1NjQgYWxsb3dlZDsNCj4gIA0KPiBAQCAtMjU0OCw4ICsyNTQ3LDggQEAgc3Rh
dGljIF9faW5pdCB1NjQgYWRqdXN0X3ZteF9jb250cm9sczY0KHU2NCBjdGxfb3B0LCB1MzIgbXNy
KQ0KPiAgCXJldHVybiAgY3RsX29wdCAmIGFsbG93ZWQ7DQo+ICB9DQo+ICANCj4gLXN0YXRpYyBf
X2luaXQgaW50IHNldHVwX3ZtY3NfY29uZmlnKHN0cnVjdCB2bWNzX2NvbmZpZyAqdm1jc19jb25m
LA0KPiAtCQkJCSAgICBzdHJ1Y3Qgdm14X2NhcGFiaWxpdHkgKnZteF9jYXApDQo+ICtzdGF0aWMg
aW50IHNldHVwX3ZtY3NfY29uZmlnKHN0cnVjdCB2bWNzX2NvbmZpZyAqdm1jc19jb25mLA0KPiAr
CQkJICAgICBzdHJ1Y3Qgdm14X2NhcGFiaWxpdHkgKnZteF9jYXApDQo+ICB7DQo+ICAJdTMyIHZt
eF9tc3JfbG93LCB2bXhfbXNyX2hpZ2g7DQo+ICAJdTMyIF9waW5fYmFzZWRfZXhlY19jb250cm9s
ID0gMDsNCj4gQEAgLTI3MTAsNyArMjcwOSw3IEBAIHN0YXRpYyBfX2luaXQgaW50IHNldHVwX3Zt
Y3NfY29uZmlnKHN0cnVjdCB2bWNzX2NvbmZpZyAqdm1jc19jb25mLA0KPiAgCXJldHVybiAwOw0K
PiAgfQ0KPiAgDQo+IC1zdGF0aWMgYm9vbCBfX2luaXQga3ZtX2lzX3ZteF9zdXBwb3J0ZWQodm9p
ZCkNCj4gK3N0YXRpYyBib29sIGt2bV9pc192bXhfc3VwcG9ydGVkKHZvaWQpDQo+ICB7DQo+ICAJ
aWYgKCFjcHVfaGFzX3ZteCgpKSB7DQo+ICAJCXByX2VycigiQ1BVIGRvZXNuJ3Qgc3VwcG9ydCBW
TVhcbiIpOw0KPiBAQCAtMjcyNiw3ICsyNzI1LDcgQEAgc3RhdGljIGJvb2wgX19pbml0IGt2bV9p
c192bXhfc3VwcG9ydGVkKHZvaWQpDQo+ICAJcmV0dXJuIHRydWU7DQo+ICB9DQo+ICANCj4gLXN0
YXRpYyBpbnQgX19pbml0IHZteF9jaGVja19wcm9jZXNzb3JfY29tcGF0KHZvaWQpDQo+ICtzdGF0
aWMgaW50IHZteF9jaGVja19wcm9jZXNzb3JfY29tcGF0KHZvaWQpDQo+ICB7DQo+ICAJc3RydWN0
IHZtY3NfY29uZmlnIHZtY3NfY29uZjsNCj4gIAlzdHJ1Y3Qgdm14X2NhcGFiaWxpdHkgdm14X2Nh
cDsNCj4gQEAgLTgxMDQsNiArODEwMyw4IEBAIHN0YXRpYyB2b2lkIHZteF92bV9kZXN0cm95KHN0
cnVjdCBrdm0gKmt2bSkNCj4gIHN0YXRpYyBzdHJ1Y3Qga3ZtX3g4Nl9vcHMgdm14X3g4Nl9vcHMg
X19pbml0ZGF0YSA9IHsNCj4gIAkubmFtZSA9IEtCVUlMRF9NT0ROQU1FLA0KPiAgDQo+ICsJLmNo
ZWNrX3Byb2Nlc3Nvcl9jb21wYXRpYmlsaXR5ID0gdm14X2NoZWNrX3Byb2Nlc3Nvcl9jb21wYXQs
DQo+ICsNCj4gIAkuaGFyZHdhcmVfdW5zZXR1cCA9IHZteF9oYXJkd2FyZV91bnNldHVwLA0KPiAg
DQo+ICAJLmhhcmR3YXJlX2VuYWJsZSA9IHZteF9oYXJkd2FyZV9lbmFibGUsDQo+IEBAIC04NTAx
LDcgKzg1MDIsNiBAQCBzdGF0aWMgX19pbml0IGludCBoYXJkd2FyZV9zZXR1cCh2b2lkKQ0KPiAg
fQ0KPiAgDQo+ICBzdGF0aWMgc3RydWN0IGt2bV94ODZfaW5pdF9vcHMgdm14X2luaXRfb3BzIF9f
aW5pdGRhdGEgPSB7DQo+IC0JLmNoZWNrX3Byb2Nlc3Nvcl9jb21wYXRpYmlsaXR5ID0gdm14X2No
ZWNrX3Byb2Nlc3Nvcl9jb21wYXQsDQo+ICAJLmhhcmR3YXJlX3NldHVwID0gaGFyZHdhcmVfc2V0
dXAsDQo+ICAJLmhhbmRsZV9pbnRlbF9wdF9pbnRyID0gTlVMTCwNCj4gIA0KPiBkaWZmIC0tZ2l0
IGEvYXJjaC94ODYva3ZtL3g4Ni5jIGIvYXJjaC94ODYva3ZtL3g4Ni5jDQo+IGluZGV4IDU1NTFm
MzU1MmYwOC4uZWU5YWY0MTJmZmQ0IDEwMDY0NA0KPiAtLS0gYS9hcmNoL3g4Ni9rdm0veDg2LmMN
Cj4gKysrIGIvYXJjaC94ODYva3ZtL3g4Ni5jDQo+IEBAIC05Mjc5LDEyICs5Mjc5LDcgQEAgc3Rh
dGljIGlubGluZSB2b2lkIGt2bV9vcHNfdXBkYXRlKHN0cnVjdCBrdm1feDg2X2luaXRfb3BzICpv
cHMpDQo+ICAJa3ZtX3BtdV9vcHNfdXBkYXRlKG9wcy0+cG11X29wcyk7DQo+ICB9DQo+ICANCj4g
LXN0cnVjdCBrdm1fY3B1X2NvbXBhdF9jaGVjayB7DQo+IC0Jc3RydWN0IGt2bV94ODZfaW5pdF9v
cHMgKm9wczsNCj4gLQlpbnQgKnJldDsNCj4gLX07DQo+IC0NCj4gLXN0YXRpYyBpbnQga3ZtX3g4
Nl9jaGVja19wcm9jZXNzb3JfY29tcGF0aWJpbGl0eShzdHJ1Y3Qga3ZtX3g4Nl9pbml0X29wcyAq
b3BzKQ0KPiArc3RhdGljIGludCBrdm1feDg2X2NoZWNrX3Byb2Nlc3Nvcl9jb21wYXRpYmlsaXR5
KHZvaWQpDQo+ICB7DQo+ICAJc3RydWN0IGNwdWluZm9feDg2ICpjID0gJmNwdV9kYXRhKHNtcF9w
cm9jZXNzb3JfaWQoKSk7DQo+ICANCj4gQEAgLTkyOTQsMTkgKzkyODksMTYgQEAgc3RhdGljIGlu
dCBrdm1feDg2X2NoZWNrX3Byb2Nlc3Nvcl9jb21wYXRpYmlsaXR5KHN0cnVjdCBrdm1feDg2X2lu
aXRfb3BzICpvcHMpDQo+ICAJICAgIF9fY3I0X3Jlc2VydmVkX2JpdHMoY3B1X2hhcywgJmJvb3Rf
Y3B1X2RhdGEpKQ0KPiAgCQlyZXR1cm4gLUVJTzsNCj4gIA0KPiAtCXJldHVybiBvcHMtPmNoZWNr
X3Byb2Nlc3Nvcl9jb21wYXRpYmlsaXR5KCk7DQo+ICsJcmV0dXJuIHN0YXRpY19jYWxsKGt2bV94
ODZfY2hlY2tfcHJvY2Vzc29yX2NvbXBhdGliaWxpdHkpKCk7DQo+ICB9DQo+ICANCj4gLXN0YXRp
YyB2b2lkIGt2bV94ODZfY2hlY2tfY3B1X2NvbXBhdCh2b2lkICpkYXRhKQ0KPiArc3RhdGljIHZv
aWQga3ZtX3g4Nl9jaGVja19jcHVfY29tcGF0KHZvaWQgKnJldCkNCj4gIHsNCj4gLQlzdHJ1Y3Qg
a3ZtX2NwdV9jb21wYXRfY2hlY2sgKmMgPSBkYXRhOw0KPiAtDQo+IC0JKmMtPnJldCA9IGt2bV94
ODZfY2hlY2tfcHJvY2Vzc29yX2NvbXBhdGliaWxpdHkoYy0+b3BzKTsNCj4gKwkqKGludCAqKXJl
dCA9IGt2bV94ODZfY2hlY2tfcHJvY2Vzc29yX2NvbXBhdGliaWxpdHkoKTsNCj4gIH0NCj4gIA0K
PiAgc3RhdGljIGludCBfX2t2bV94ODZfdmVuZG9yX2luaXQoc3RydWN0IGt2bV94ODZfaW5pdF9v
cHMgKm9wcykNCj4gIHsNCj4gLQlzdHJ1Y3Qga3ZtX2NwdV9jb21wYXRfY2hlY2sgYzsNCj4gIAl1
NjQgaG9zdF9wYXQ7DQo+ICAJaW50IHIsIGNwdTsNCj4gIA0KPiBAQCAtOTM3NywxMiArOTM2OSwx
MiBAQCBzdGF0aWMgaW50IF9fa3ZtX3g4Nl92ZW5kb3JfaW5pdChzdHJ1Y3Qga3ZtX3g4Nl9pbml0
X29wcyAqb3BzKQ0KPiAgCWlmIChyICE9IDApDQo+ICAJCWdvdG8gb3V0X21tdV9leGl0Ow0KPiAg
DQo+IC0JYy5yZXQgPSAmcjsNCj4gLQljLm9wcyA9IG9wczsNCj4gKwlrdm1fb3BzX3VwZGF0ZShv
cHMpOw0KPiArDQo+ICAJZm9yX2VhY2hfb25saW5lX2NwdShjcHUpIHsNCj4gLQkJc21wX2NhbGxf
ZnVuY3Rpb25fc2luZ2xlKGNwdSwga3ZtX3g4Nl9jaGVja19jcHVfY29tcGF0LCAmYywgMSk7DQo+
ICsJCXNtcF9jYWxsX2Z1bmN0aW9uX3NpbmdsZShjcHUsIGt2bV94ODZfY2hlY2tfY3B1X2NvbXBh
dCwgJnIsIDEpOw0KPiAgCQlpZiAociA8IDApDQo+IC0JCQlnb3RvIG91dF9oYXJkd2FyZV91bnNl
dHVwOw0KPiArCQkJZ290byBvdXRfdW53aW5kX29wczsNCj4gIAl9DQo+ICANCj4gIAkvKg0KPiBA
QCAtOTM5MCw4ICs5MzgyLDYgQEAgc3RhdGljIGludCBfX2t2bV94ODZfdmVuZG9yX2luaXQoc3Ry
dWN0IGt2bV94ODZfaW5pdF9vcHMgKm9wcykNCj4gIAkgKiBhYnNvbHV0ZWx5IG5lY2Vzc2FyeSwg
YXMgbW9zdCBvcGVyYXRpb25zIGZyb20gdGhpcyBwb2ludCBmb3J3YXJkDQo+ICAJICogcmVxdWly
ZSB1bndpbmRpbmcuDQo+ICAJICovDQo+IC0Ja3ZtX29wc191cGRhdGUob3BzKTsNCj4gLQ0KPiAg
CWt2bV90aW1lcl9pbml0KCk7DQo+ICANCj4gIAlpZiAocGlfaW5qZWN0X3RpbWVyID09IC0xKQ0K
PiBAQCAtOTQyNyw4ICs5NDE3LDkgQEAgc3RhdGljIGludCBfX2t2bV94ODZfdmVuZG9yX2luaXQo
c3RydWN0IGt2bV94ODZfaW5pdF9vcHMgKm9wcykNCj4gIAlrdm1faW5pdF9tc3JfbGlzdCgpOw0K
PiAgCXJldHVybiAwOw0KPiAgDQo+IC1vdXRfaGFyZHdhcmVfdW5zZXR1cDoNCj4gLQlvcHMtPnJ1
bnRpbWVfb3BzLT5oYXJkd2FyZV91bnNldHVwKCk7DQo+ICtvdXRfdW53aW5kX29wczoNCj4gKwlr
dm1feDg2X29wcy5oYXJkd2FyZV9lbmFibGUgPSBOVUxMOw0KPiArCXN0YXRpY19jYWxsKGt2bV94
ODZfaGFyZHdhcmVfdW5zZXR1cCkoKTsNCj4gIG91dF9tbXVfZXhpdDoNCj4gIAlrdm1fbW11X3Zl
bmRvcl9tb2R1bGVfZXhpdCgpOw0KPiAgb3V0X2ZyZWVfcGVyY3B1Og0KDQo=
