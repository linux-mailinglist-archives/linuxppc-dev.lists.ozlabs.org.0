Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C17129854F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Oct 2020 02:28:39 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CKHKb5lLlzDqNJ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Oct 2020 12:28:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=rick.p.edgecombe@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com
 header.b=gospHVgX; dkim-atps=neutral
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CKGDB6dLvzDq8M
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Oct 2020 11:38:40 +1100 (AEDT)
IronPort-SDR: k8UQRhlhbnz0DPG92sIe59U4lF/jwpH572yybheA4Z0J0oivoxcu00frwgrq/szdYRN6XmvGz6
 pq+szE7Ki9Bg==
X-IronPort-AV: E=McAfee;i="6000,8403,9785"; a="229497770"
X-IronPort-AV: E=Sophos;i="5.77,417,1596524400"; d="scan'208";a="229497770"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2020 17:38:36 -0700
IronPort-SDR: NWnfmoweVKhceYnJFLmUykx2hcUpt8jp2DbEv0eIW9LVg/qjt+3EeNBwUDR27kN1v6J2l7J1Kq
 mWtdmKVb8Kug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,417,1596524400"; d="scan'208";a="467730532"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga004.jf.intel.com with ESMTP; 25 Oct 2020 17:38:35 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 25 Oct 2020 17:38:35 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 25 Oct 2020 17:38:34 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Sun, 25 Oct 2020 17:38:34 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Sun, 25 Oct 2020 17:38:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ec+qzFkPOjHk/MJQ1bDtHBfoQ2TolaeShfPqSxzuCzNhVk4LaiV72VxGC3I4OEzHwx0CUWmnVL5gipsf6eYgwmRpnCjtvEgntxD70tPdliRAgnVABqregaXtHhdxyS0KobKjyIux25njdrh69Qrw6MvhkoebYwmKBvhhF02PYAUvzAOzKVm+0NNlvUNXENGSPyVklMiVvKwfG1OGSfYX6drl+vPg+2bP6RLkA2cy8s5O286SSQGgLwJwcfwWW4huGBv3nVwCqlLqoZ+09xLSsGx3zLhQLhJw8Ijx14j1mvotyrwqpk4CLYGEDqO0Rvji65LohR+ImQP9kL4quHIQag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=POHANa+eDkgXYJDNU3Y0iPAgKW1aGHYmuM+lFsPa7vs=;
 b=b/W7tbQ9DshCRAV5JowNuPRHBJq4VshbGdnOKlkrtCTF25wpWXUkASzEvv7e9nCtY6/+VphCN3fAxgiQaicGLNRi+REs1nRuWvYez6fGuNcMxSlFNTgjIRGYM8ot4W9fwcByrxHoRFUVQdoplJzCZYkl0v682YcADNstfusumkmBi3FHBfh1ZR+3L31W3wru2OexCpNyZ1p8AS+z7jKn5i1foVs7lyzhYlMqnV4OkqOImcp36VRH8fEPDwIx2MsoQoGe3Nl7NmQsioK1dng41Y1H0mHFoIdRYTGSK/YzwCfBWfS3z/iVRxnpkRbolA9Y41fq1zzNp6dmNadApaePOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=POHANa+eDkgXYJDNU3Y0iPAgKW1aGHYmuM+lFsPa7vs=;
 b=gospHVgXqRS7jku2UwYT8z+JZjzp1XGy7Qu41uyGtgo/EYsZkaxJeHNueKmIka9FfzpUDaIqmWAijsiimEKwGbbN3ZuHUStfUduNan4SK5cR2KkjY9TIYFbX7RWxwS19KeVKv0Atyr1v9NxkN2mxbNZQr3DUPmPAgL60XY5vJGM=
Received: from SN6PR11MB3184.namprd11.prod.outlook.com (2603:10b6:805:bd::17)
 by SN6PR11MB3230.namprd11.prod.outlook.com (2603:10b6:805:b8::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Mon, 26 Oct
 2020 00:38:32 +0000
Received: from SN6PR11MB3184.namprd11.prod.outlook.com
 ([fe80::b901:8e07:4340:6704]) by SN6PR11MB3184.namprd11.prod.outlook.com
 ([fe80::b901:8e07:4340:6704%7]) with mapi id 15.20.3477.028; Mon, 26 Oct 2020
 00:38:32 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "rppt@kernel.org" <rppt@kernel.org>, "akpm@linux-foundation.org"
 <akpm@linux-foundation.org>
Subject: Re: [PATCH 2/4] PM: hibernate: improve robustness of mapping pages in
 the direct map
Thread-Topic: [PATCH 2/4] PM: hibernate: improve robustness of mapping pages
 in the direct map
Thread-Index: AQHWqrf6LRJhAvsqzE2DP+hB1ynbOKmpCzYA
Date: Mon, 26 Oct 2020 00:38:32 +0000
Message-ID: <f20900a403bea9eb3f0814128e5ea46f6580f5a5.camel@intel.com>
References: <20201025101555.3057-1-rppt@kernel.org>
 <20201025101555.3057-3-rppt@kernel.org>
In-Reply-To: <20201025101555.3057-3-rppt@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.30.1 (3.30.1-1.fc29) 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.55.55.43]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5ad491d3-357f-4953-91f1-08d879477746
x-ms-traffictypediagnostic: SN6PR11MB3230:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR11MB323086788B7DC160D562C876C9190@SN6PR11MB3230.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cb1AbnusLUbxe3Z2OFEwyuQmnllpwLPiW2RpHypzcRYXBmx3CeRUtPwEmrbYX4Do0WwJpUx8dI4/FTEmGH1fynKKw2XbPVRSOaXqEhegw8TOUHreZ/XiAduKTnj44K0OxxirL9ypiZkuTz3k7BsJOBJ1l6/mr8V+PwOJ8twMRnuxeC9yKwWf027hLwdRWn2AScZRwmbmX0xNO0/QpBRUj4PE6WffuoSohBNqYGbqZxIDyY74lpJ3YugJ8u3rylLXai2JHfP0FvTWo5re8gq/96+kBmPJc02PDk8AMa545uL/sHxV5j+O9XiLw9+vxY1T5+Wejo2JDiKr3QhEErD3Vg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB3184.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(396003)(39860400002)(136003)(376002)(91956017)(4326008)(478600001)(66446008)(7406005)(66946007)(66556008)(36756003)(86362001)(66476007)(6506007)(76116006)(7416002)(110136005)(5660300002)(64756008)(186003)(2906002)(8936002)(54906003)(316002)(83380400001)(26005)(2616005)(6512007)(6486002)(8676002)(4001150100001)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: glmLmLB12U0y5RY0L+ZT1Mi/9/Lz/KB/6WAVVycPk1YVeMOwoGyGUWU4Fq1MVzaBaZukNjhLe5PIBbbdY3d+VVjt9Fl6xRXYUGpfjJmWIWZun4seSr0uF+OSZyJo8Z91mRWPTmCFJXeFJbXdgyTNr1d8zGfztjMC3TKVel+Vpcbv54fKsjYIPOfWIP4XgjdG//4b5fNq6tKs/LR0iALRreua4medRAoUnZodcCHhxttXr+vOg85DRBUCF2uj7DJZSNfk8bu23YNOYfNwkNG4nc7E61V9uIErZ3kUL7xtLNAhbfjxRTDx1bu5MKEbQ2tkaRQq5TRtMoNxSHae3wqOFEW6LsIScfQypJUmfFhOxe0NK+qJs4e5ZBTbE9bH8OuJkMKxmpJqxMs6exVbM5lx8SvPvDm5OhEAV1zcZOmvjdP5TGEwtmPNtotm5fo/pQFfaJtSaazRa50xGa6WNz6IKHxVYbxneMyg8iPwwfBUv0Siqv2vv/L68HBwEi+xK1NW+KJ/rOLgMtYzy8fjEq9kcLNDy1una7Xc2p/gb5eiBRJDTyYQ+0sH9DHRydMNU73L7I1Hm6RYifUr7bRVb5shA0iEUX10uRGV6sIZfwp+wg3no4kbrvxjQNpJkaCbOXu+gute91p7zWzUiPuNP/m7tw==
Content-Type: text/plain; charset="utf-8"
Content-ID: <1A64047B5DCE1A409D92B085E6D25DC1@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3184.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ad491d3-357f-4953-91f1-08d879477746
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2020 00:38:32.2198 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EOqvkWZ3MNaT13nksG4s0qRyOCAw2mCf4k3JN5qlMHbWP/+ykROXQciwCEC8QPjPYsTstcrDbcEkIe/faBMY7w6mZB6T8UpndsedXRzgLyM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3230
X-OriginatorOrg: intel.com
X-Mailman-Approved-At: Mon, 26 Oct 2020 12:26:40 +1100
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
Cc: "david@redhat.com" <david@redhat.com>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "paulus@samba.org" <paulus@samba.org>, "pavel@ucw.cz" <pavel@ucw.cz>,
 "hpa@zytor.com" <hpa@zytor.com>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 "cl@linux.com" <cl@linux.com>, "will@kernel.org" <will@kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "x86@kernel.org" <x86@kernel.org>, "rppt@linux.ibm.com" <rppt@linux.ibm.com>,
 "borntraeger@de.ibm.com" <borntraeger@de.ibm.com>,
 "mingo@redhat.com" <mingo@redhat.com>,
 "rientjes@google.com" <rientjes@google.com>, "Brown,
 Len" <len.brown@intel.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "gor@linux.ibm.com" <gor@linux.ibm.com>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "hca@linux.ibm.com" <hca@linux.ibm.com>, "bp@alien8.de" <bp@alien8.de>,
 "luto@kernel.org" <luto@kernel.org>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "kirill@shutemov.name" <kirill@shutemov.name>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "rjw@rjwysocki.net" <rjw@rjwysocki.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "penberg@kernel.org" <penberg@kernel.org>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "iamjoonsoo.kim@lge.com" <iamjoonsoo.kim@lge.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "davem@davemloft.net" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gU3VuLCAyMDIwLTEwLTI1IGF0IDEyOjE1ICswMjAwLCBNaWtlIFJhcG9wb3J0IHdyb3RlOg0K
PiBGcm9tOiBNaWtlIFJhcG9wb3J0IDxycHB0QGxpbnV4LmlibS5jb20+DQo+IA0KPiBXaGVuIERF
QlVHX1BBR0VBTExPQyBvciBBUkNIX0hBU19TRVRfRElSRUNUX01BUCBpcyBlbmFibGVkIGEgcGFn
ZSBtYXkNCj4gYmUNCj4gbm90IHByZXNlbnQgaW4gdGhlIGRpcmVjdCBtYXAgYW5kIGhhcyB0byBi
ZSBleHBsaWNpdGx5IG1hcHBlZCBiZWZvcmUNCj4gaXQNCj4gY291bGQgYmUgY29waWVkLg0KPiAN
Cj4gT24gYXJtNjQgaXQgaXMgcG9zc2libGUgdGhhdCBhIHBhZ2Ugd291bGQgYmUgcmVtb3ZlZCBm
cm9tIHRoZSBkaXJlY3QNCj4gbWFwDQo+IHVzaW5nIHNldF9kaXJlY3RfbWFwX2ludmFsaWRfbm9m
bHVzaCgpIGJ1dCBfX2tlcm5lbF9tYXBfcGFnZXMoKSB3aWxsDQo+IHJlZnVzZQ0KPiB0byBtYXAg
dGhpcyBwYWdlIGJhY2sgaWYgREVCVUdfUEFHRUFMTE9DIGlzIGRpc2FibGVkLg0KDQpJdCBsb29r
cyB0byBtZSB0aGF0IGFybTY0IF9fa2VybmVsX21hcF9wYWdlcygpIHdpbGwgc3RpbGwgYXR0ZW1w
dCB0bw0KbWFwIGl0IGlmIHJvZGF0YV9mdWxsIGlzIHRydWUsIGhvdyBkb2VzIHRoaXMgaGFwcGVu
Pw0KDQo+IEV4cGxpY2l0bHkgdXNlIHNldF9kaXJlY3RfbWFwX3tkZWZhdWx0LGludmFsaWR9X25v
Zmx1c2goKSBmb3INCj4gQVJDSF9IQVNfU0VUX0RJUkVDVF9NQVAgY2FzZSBhbmQgZGVidWdfcGFn
ZWFsbG9jX21hcF9wYWdlcygpIGZvcg0KPiBERUJVR19QQUdFQUxMT0MgY2FzZS4NCj4gDQo+IFdo
aWxlIG9uIHRoYXQsIHJlbmFtZSBrZXJuZWxfbWFwX3BhZ2VzKCkgdG8gaGliZXJuYXRlX21hcF9w
YWdlKCkgYW5kDQo+IGRyb3ANCj4gbnVtcGFnZXMgcGFyYW1ldGVyLg0KPiANCj4gU2lnbmVkLW9m
Zi1ieTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPg0KPiAtLS0NCj4gIGtlcm5l
bC9wb3dlci9zbmFwc2hvdC5jIHwgMjkgKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0NCj4g
IDEgZmlsZSBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkNCj4gDQo+
IGRpZmYgLS1naXQgYS9rZXJuZWwvcG93ZXIvc25hcHNob3QuYyBiL2tlcm5lbC9wb3dlci9zbmFw
c2hvdC5jDQo+IGluZGV4IGZhNDk5NDY2ZjY0NS4uZWNiN2IzMmNlNzdjIDEwMDY0NA0KPiAtLS0g
YS9rZXJuZWwvcG93ZXIvc25hcHNob3QuYw0KPiArKysgYi9rZXJuZWwvcG93ZXIvc25hcHNob3Qu
Yw0KPiBAQCAtNzYsMTYgKzc2LDI1IEBAIHN0YXRpYyBpbmxpbmUgdm9pZA0KPiBoaWJlcm5hdGVf
cmVzdG9yZV9wcm90ZWN0X3BhZ2Uodm9pZCAqcGFnZV9hZGRyZXNzKSB7fQ0KPiAgc3RhdGljIGlu
bGluZSB2b2lkIGhpYmVybmF0ZV9yZXN0b3JlX3VucHJvdGVjdF9wYWdlKHZvaWQNCj4gKnBhZ2Vf
YWRkcmVzcykge30NCj4gICNlbmRpZiAvKiBDT05GSUdfU1RSSUNUX0tFUk5FTF9SV1ggICYmIENP
TkZJR19BUkNIX0hBU19TRVRfTUVNT1JZICovDQo+ICANCj4gLSNpZiBkZWZpbmVkKENPTkZJR19E
RUJVR19QQUdFQUxMT0MpIHx8DQo+IGRlZmluZWQoQ09ORklHX0FSQ0hfSEFTX1NFVF9ESVJFQ1Rf
TUFQKQ0KPiAtc3RhdGljIGlubGluZSB2b2lkDQo+IC1rZXJuZWxfbWFwX3BhZ2VzKHN0cnVjdCBw
YWdlICpwYWdlLCBpbnQgbnVtcGFnZXMsIGludCBlbmFibGUpDQo+ICtzdGF0aWMgaW5saW5lIHZv
aWQgaGliZXJuYXRlX21hcF9wYWdlKHN0cnVjdCBwYWdlICpwYWdlLCBpbnQgZW5hYmxlKQ0KPiAg
ew0KPiAtCV9fa2VybmVsX21hcF9wYWdlcyhwYWdlLCBudW1wYWdlcywgZW5hYmxlKTsNCj4gKwlp
ZiAoSVNfRU5BQkxFRChDT05GSUdfQVJDSF9IQVNfU0VUX0RJUkVDVF9NQVApKSB7DQo+ICsJCXVu
c2lnbmVkIGxvbmcgYWRkciA9ICh1bnNpZ25lZCBsb25nKXBhZ2VfYWRkcmVzcyhwYWdlKTsNCj4g
KwkJaW50IHJldDsNCj4gKw0KPiArCQlpZiAoZW5hYmxlKQ0KPiArCQkJcmV0ID0gc2V0X2RpcmVj
dF9tYXBfZGVmYXVsdF9ub2ZsdXNoKHBhZ2UpOw0KPiArCQllbHNlDQo+ICsJCQlyZXQgPSBzZXRf
ZGlyZWN0X21hcF9pbnZhbGlkX25vZmx1c2gocGFnZSk7DQo+ICsNCj4gKwkJaWYgKFdBUk5fT04o
cmV0KSkNCj4gKwkJCXJldHVybjsNCj4gKw0KPiArCQlmbHVzaF90bGJfa2VybmVsX3JhbmdlKGFk
ZHIsIGFkZHIgKyBQQUdFX1NJWkUpOw0KPiArCX0gZWxzZSB7DQo+ICsJCWRlYnVnX3BhZ2VhbGxv
Y19tYXBfcGFnZXMocGFnZSwgMSwgZW5hYmxlKTsNCj4gKwl9DQo+ICB9DQo+IC0jZWxzZQ0KPiAt
c3RhdGljIGlubGluZSB2b2lkDQo+IC1rZXJuZWxfbWFwX3BhZ2VzKHN0cnVjdCBwYWdlICpwYWdl
LCBpbnQgbnVtcGFnZXMsIGludCBlbmFibGUpIHt9DQo+IC0jZW5kaWYNCj4gIA0KPiAgc3RhdGlj
IGludCBzd3N1c3BfcGFnZV9pc19mcmVlKHN0cnVjdCBwYWdlICopOw0KPiAgc3RhdGljIHZvaWQg
c3dzdXNwX3NldF9wYWdlX2ZvcmJpZGRlbihzdHJ1Y3QgcGFnZSAqKTsNCj4gQEAgLTEzNjYsOSAr
MTM3NSw5IEBAIHN0YXRpYyB2b2lkIHNhZmVfY29weV9wYWdlKHZvaWQgKmRzdCwgc3RydWN0DQo+
IHBhZ2UgKnNfcGFnZSkNCj4gIAlpZiAoa2VybmVsX3BhZ2VfcHJlc2VudChzX3BhZ2UpKSB7DQo+
ICAJCWRvX2NvcHlfcGFnZShkc3QsIHBhZ2VfYWRkcmVzcyhzX3BhZ2UpKTsNCj4gIAl9IGVsc2Ug
ew0KPiAtCQlrZXJuZWxfbWFwX3BhZ2VzKHNfcGFnZSwgMSwgMSk7DQo+ICsJCWhpYmVybmF0ZV9t
YXBfcGFnZShzX3BhZ2UsIDEpOw0KPiAgCQlkb19jb3B5X3BhZ2UoZHN0LCBwYWdlX2FkZHJlc3Mo
c19wYWdlKSk7DQo+IC0JCWtlcm5lbF9tYXBfcGFnZXMoc19wYWdlLCAxLCAwKTsNCj4gKwkJaGli
ZXJuYXRlX21hcF9wYWdlKHNfcGFnZSwgMCk7DQo+ICAJfQ0KPiAgfQ0KPiAgDQoNCklmIHNvbWVo
b3cgYSBwYWdlIHdhcyB1bm1hcHBlZCBzdWNoIHRoYXQNCnNldF9kaXJlY3RfbWFwX2RlZmF1bHRf
bm9mbHVzaCgpIHdvdWxkIGZhaWwsIHRoZW4gdGhpcyBjb2RlIGludHJvZHVjZXMNCmEgV0FSTiwg
YnV0IGl0IHdpbGwgc3RpbGwgdHJ5IHRvIHJlYWQgdGhlIHVubWFwcGVkIHBhZ2UuIFdoeSBub3Qg
anVzdA0KaGF2ZSB0aGUgV0FSTidzIGluc2lkZSBvZiBfX2tlcm5lbF9tYXBfcGFnZXMoKSBpZiB0
aGV5IGZhaWwgYW5kIHRoZW4NCmhhdmUgYSB3YXJuaW5nIGZvciB0aGUgZGVidWcgcGFnZSBhbGxv
YyBjYXNlcyBhcyB3ZWxsPyBTaW5jZSBsb2dpYw0KYXJvdW5kIGJvdGggZXhwZWN0cyB0aGVtIG5v
dCB0byBmYWlsLg0KDQoNCg==
