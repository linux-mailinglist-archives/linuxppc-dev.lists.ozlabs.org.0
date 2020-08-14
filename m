Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 12889245000
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Aug 2020 00:58:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BSzPH5ZY9zDqnW
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Aug 2020 08:58:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=vishal.l.verma@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com
 header.b=mBAIbl53; dkim-atps=neutral
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BSzMF4ZqGzDqll
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Aug 2020 08:56:17 +1000 (AEST)
IronPort-SDR: 1G7qkk7+ViN2y8hs13xBuhd/+kDfyTRRQzJY+wqI+6zaxoTnaP9ELX25W+NxQ4ev2XrZ1SVhjf
 lpOzhiouv25w==
X-IronPort-AV: E=McAfee;i="6000,8403,9713"; a="153744244"
X-IronPort-AV: E=Sophos;i="5.76,313,1592895600"; d="scan'208";a="153744244"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2020 15:56:14 -0700
IronPort-SDR: jGxjcOjVPF1nD0sfIwbBtkkq7alEJpkURYLR81SmBfa5skL0MhhytA/vn6ferncs4ZBTFRH5XP
 OeLdqQKeCCpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,313,1592895600"; d="scan'208";a="291865190"
Received: from fmsmsx601-2.cps.intel.com (HELO fmsmsx601.amr.corp.intel.com)
 ([10.18.84.211])
 by orsmga003.jf.intel.com with ESMTP; 14 Aug 2020 15:56:13 -0700
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 14 Aug 2020 15:56:13 -0700
Received: from FMSEDG002.ED.cps.intel.com (10.1.192.134) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Fri, 14 Aug 2020 15:56:13 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (192.55.55.69) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Fri, 14 Aug 2020 15:55:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JkBoi6G4TJjUFL7NR5KGoS5f3LW6qLoR1n3A+7jiVsksZw1mFEHUIHnwdwP4XqJGarIS6VhuDLG4ghI4IMr4AJHKxAk1jyHMBzNWmdYSuaRgBXOheK5NSZFP+Goi2kwe6R1iUKwhq14aDEmWUMVuokoEpv+tCK9RMuXNtEj3gOk47c2oqHW4wVNob/zTTXshbiemrhasYNI4tf/6+/Ue5pNO2PLQr18CkGOiJaorMKLoHp/yM/v+1Eft3UN+5YDBaSjppEAmeKyJRkaQM3WfE7Tt0ZLUfenQ0A3ZhutWI+pVrkrdjs0ZsDkt2oyatbD2pMvewsx1Lxi/yJFPLsfmkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HSBTxjlCc1k/auq6OVPW2S1EvmNXDCwEPhXFj5G/jDk=;
 b=JGXrftxFrdepfXDDhrJCbWm5+lhBwlmiTCQgit3jPiAGijzBbwnFG7cR+ehYlvINjSQcBt7vPvhR+8I60KqfqblUL617/tl0CNdWxErm0umvEY1GRKhFIdtHddUqqqXl2PWEKwAHQ6fhKOG+jOgb5+5hv1mWpFftxLetJhZ+YcRML2q/5BP3jiOhaASUJEo9l3dqTMmvhFaLHCEmrOhcSwc/rIdqHwkq4nUp010O9nJ9UxraVFo6KHid28fWiwNwN0ZqTOxEItrmAJm93WICDZXcGqUjnhUu931mwEQk9d/Zc8I7dZ3Nia8G9rqcDQVXaWHYjFZ1C41YWjK2KhJhDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HSBTxjlCc1k/auq6OVPW2S1EvmNXDCwEPhXFj5G/jDk=;
 b=mBAIbl5395IDubiF7KVhXnLURcqVvrvj9Yd6FDZxvREmZSavOmyr8WtuNDamiBw44vAJQivIaqbXx0Hqk2VPhvVvY1l8u++55lS4t13qXQ22EnI3df8Z7fTzkyeIGzPEo36qHYM2z4IXw9IPnbikdRqaIokvHSTM1t+6pXWGGLg=
Received: from BYAPR11MB3448.namprd11.prod.outlook.com (2603:10b6:a03:76::21)
 by BYAPR11MB3671.namprd11.prod.outlook.com (2603:10b6:a03:b3::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.20; Fri, 14 Aug
 2020 22:55:29 +0000
Received: from BYAPR11MB3448.namprd11.prod.outlook.com
 ([fe80::1084:a79c:5a4f:f115]) by BYAPR11MB3448.namprd11.prod.outlook.com
 ([fe80::1084:a79c:5a4f:f115%5]) with mapi id 15.20.3283.016; Fri, 14 Aug 2020
 22:55:29 +0000
From: "Verma, Vishal L" <vishal.l.verma@intel.com>
To: "Weiny, Ira" <ira.weiny@intel.com>, "vaibhav@linux.ibm.com"
 <vaibhav@linux.ibm.com>
Subject: Re: [PATCH] libnvdimm: Add a NULL entry to
 'nvdimm_firmware_attributes'
Thread-Topic: [PATCH] libnvdimm: Add a NULL entry to
 'nvdimm_firmware_attributes'
Thread-Index: AQHWckx4y0fiAEVmJkid5IaXXixqHqk31uoAgABgfgA=
Date: Fri, 14 Aug 2020 22:55:29 +0000
Message-ID: <e8ab54c4e147cbfe037a6aa5926d0cd74346a684.camel@intel.com>
References: <20200814150509.225615-1-vaibhav@linux.ibm.com>
 <20200814171005.GB3142014@iweiny-DESK2.sc.intel.com>
In-Reply-To: <20200814171005.GB3142014@iweiny-DESK2.sc.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5 (3.36.5-1.fc32) 
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.55.55.39]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8be6eaba-c7ce-4aad-19c6-08d840a52461
x-ms-traffictypediagnostic: BYAPR11MB3671:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR11MB36711D0BB3CB0140D3F00DB7C7400@BYAPR11MB3671.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:201;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fyZHsV4fjtfGvzMNElJ+M/9p0EKxG4LFr2WUVn5Jg+V5QP9QJTlBGq5wSZ885CoIXEkzPSHA6qdNTA4r9cHLBmTEZSOxO1wBr9TjhfCqx4urfx/efUxD+btLn+J4hLsOop15h1YUpUO+8Mc0tA9Wh0ZmfOuEqdftYEEIzPIPKPQwWohtwh6auKYZTfup9ZWyyW3Z4DzuMHFfb9G8JYUh6Ipbk6vZmETs+rNWLx0gXQVHJkRachkw843P1eBx63O27t4O4Hh1tlBJiQmBoOVX6A6iLyT7uWP6jXowmh55hkC9+AfEwwmx3PfX22X05D2OyVK/tIsrZBOmUFoYfouTNw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3448.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(366004)(346002)(396003)(39860400002)(54906003)(26005)(4326008)(66446008)(66556008)(66476007)(64756008)(66946007)(110136005)(83380400001)(478600001)(6506007)(316002)(8936002)(6512007)(2616005)(2906002)(71200400001)(6486002)(86362001)(5660300002)(186003)(8676002)(36756003)(76116006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: +b8Ur00uUaKJGUcFTKBf0zywk42EsHZfMt8tAoevw48A5etbS0pgapyDS/0hZotc/K1sOh8AmwOf9d9IAdrPidqDdNnkLondxN1Apg0YsyE4TaUsq3p2SgptHFFIpwfIQipjxZEdoA/DKQ400d1sNJ6TdNl1XTcWt/oxMt+icWtUqq3gzj9Q2btdqqOLt6ogrRsL+z2hrRkDUfQ2wL1zV5q7CkGmJtHwIIC9hWgee1wrm4/m8af9qMBWi3tqya42MI8MaoQXGqDkDPsY2nr4JjiSCaovW5lA+9jz9dWaxw7CvJ43KFILi7T1GaUjihz4tpdLyJz7pyEwK+fIaJuqW7BhA6tvZ3FUUMStjBK+p2AjECya4MyKLQSVYV3a0UvLtDQ/HCMJiqDsm+KDgBmugy73KZP/qKLOHwHLMX49/If0aGmTLOW66/ju5Vv6WXneKp9x3/EfZOY6FpIHi2wMb03iVldSu/9ShIIZHBgzFQe0sJsMVC2BuxoYlzbzAWZzgd7ixx0ZOgiTAla5OPKUmOPuEz9sNkmW1aQbVZ6F1vx0gs7B4X+JRBQ7tIRWHWmu9UytrtcnyqMrnlYbrJc0jdzpNq8W9TgQlv4ZlWNPwyIrf7HaR879YmyBfTILZsGB/w2kf3YHGQaUtQdpscYVdQ==
Content-Type: text/plain; charset="utf-8"
Content-ID: <7034EB549DB1854E96890AFE09C6BDC9@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3448.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8be6eaba-c7ce-4aad-19c6-08d840a52461
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2020 22:55:29.5271 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B0GWQaKlpvqEWs9xmOPy2uijLTSnikxJBe4ggHU7pudZcfOZT3jg3KDFeWO5+D8lFsOx2H8ZbuAKrUtBpYoolZmmMAgbX8clwXJMxF2k0Tw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3671
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
Cc: "sandipan@linux.ibm.com" <sandipan@linux.ibm.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "aneesh.kumar@linux.ibm.com" <aneesh.kumar@linux.ibm.com>,
 "linux-nvdimm@lists.01.org" <linux-nvdimm@lists.01.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gRnJpLCAyMDIwLTA4LTE0IGF0IDEwOjEwIC0wNzAwLCBJcmEgV2Vpbnkgd3JvdGU6DQo+IE9u
IEZyaSwgQXVnIDE0LCAyMDIwIGF0IDA4OjM1OjA5UE0gKzA1MzAsIFZhaWJoYXYgSmFpbiB3cm90
ZToNCj4gPiBXZSByZWNlbnRseSBkaXNjb3ZlcmVkIGEga2VybmVsIG9vcHMgd2l0aCAncGFwcl9z
Y20nIG1vZHVsZSB3aGlsZQ0KPiA+IGJvb3RpbmcgcHBjNjQgcGh5cCBndWVzdCB3aXRoIGZvbGxv
d2luZyBiYWNrLXRyYWNlOg0KPiA+IA0KPiA+IEJVRzogS2VybmVsIE5VTEwgcG9pbnRlciBkZXJl
ZmVyZW5jZSBvbiB3cml0ZSBhdCAweDAwMDAwMTg4DQo+ID4gRmF1bHRpbmcgaW5zdHJ1Y3Rpb24g
YWRkcmVzczogMHhjMDAwMDAwMDAwNWQ3MDg0DQo+ID4gT29wczogS2VybmVsIGFjY2VzcyBvZiBi
YWQgYXJlYSwgc2lnOiAxMSBbIzFdDQo+ID4gPHNuaXA+DQo+ID4gQ2FsbCBUcmFjZToNCj4gPiAg
aW50ZXJuYWxfY3JlYXRlX2dyb3VwKzB4MTI4LzB4NGMwICh1bnJlbGlhYmxlKQ0KPiA+ICBpbnRl
cm5hbF9jcmVhdGVfZ3JvdXBzLnBhcnQuNCsweDcwLzB4MTMwDQo+ID4gIGRldmljZV9hZGQrMHg0
NTgvMHg5YzANCj4gPiAgbmRfYXN5bmNfZGV2aWNlX3JlZ2lzdGVyKzB4MjgvMHhhMCBbbGlibnZk
aW1tXQ0KPiA+ICBhc3luY19ydW5fZW50cnlfZm4rMHg3OC8weDFmMA0KPiA+ICBwcm9jZXNzX29u
ZV93b3JrKzB4MmMwLzB4NWIwDQo+ID4gIHdvcmtlcl90aHJlYWQrMHg4OC8weDY1MA0KPiA+ICBr
dGhyZWFkKzB4MWE4LzB4MWIwDQo+ID4gIHJldF9mcm9tX2tlcm5lbF90aHJlYWQrMHg1Yy8weDZj
DQo+ID4gDQo+ID4gQSBiaXNlY3QgbGVhZCB0byB0aGUgJ2NvbW1pdCA0ODAwMWVhNTBkMTdmICgi
UE0sIGxpYm52ZGltbTogQWRkIHJ1bnRpbWUNCj4gPiBmaXJtd2FyZSBhY3RpdmF0aW9uIHN1cHBv
cnQiKScgYW5kIG9uIGludmVzdGlnYXRpb24gZGlzY292ZXJlZCB0aGF0DQo+ID4gdGhlIG5ld2x5
IGludHJvZHVjZWQgJ3N0cnVjdCBhdHRyaWJ1dGUgKm52ZGltbV9maXJtd2FyZV9hdHRyaWJ1dGVz
W10nDQo+ID4gaXMgbWlzc2luZyBhIHRlcm1pbmF0aW5nIE5VTEwgZW50cnkgaW4gdGhlIGFycmF5
LiBUaGlzIGNhdXNlcyBhIGxvb3ANCj4gPiBpbiBzeXNmcydzICdjcmVhdGVfZmlsZXMoKScgdG8g
cmVhZCBnYXJiYWdlIGJleW9uZCBib3VuZHMgb2YNCj4gPiAnbnZkaW1tX2Zpcm13YXJlX2F0dHJp
YnV0ZXMnIGFuZCB0cmlnZ2VyIHRoZSBvb3BzLg0KPiA+IA0KPiA+IEZpeGVzOiA0ODAwMWVhNTBk
MTdmICgiUE0sIGxpYm52ZGltbTogQWRkIHJ1bnRpbWUgZmlybXdhcmUgYWN0aXZhdGlvbiBzdXBw
b3J0IikNCj4gPiBSZXBvcnRlZC1ieTogU2FuZGlwYW4gRGFzIDxzYW5kaXBhbkBsaW51eC5pYm0u
Y29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFZhaWJoYXYgSmFpbiA8dmFpYmhhdkBsaW51eC5pYm0u
Y29tPg0KPiANCj4gUmV2aWV3ZWQtYnk6IElyYSBXZWlueSA8aXJhLndlaW55QGludGVsLmNvbT4N
Cg0KVGhhbmtzIFZhaWJoYXYgYW5kIElyYS4gSSBzZWUgdGhpcyB3YXMgYWxzbyByZXBvcnRlZCBh
bmQgZml4ZWQgYnkgWnFpYW5nDQphIGNvdXBsZSBkYXlzIGFnby4gSSdsbCBwaWNrIHRoYXQsIG1l
cmdlIHRoZXNlIHRyYWlsZXJzIGFuZCBhZGQgaXQgdG8NCnRoZSBmaXhlcyBxdWV1ZS4NCg0KPiAN
Cj4gPiAtLS0NCj4gPiAgZHJpdmVycy9udmRpbW0vZGltbV9kZXZzLmMgfCAxICsNCj4gPiAgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvbnZkaW1tL2RpbW1fZGV2cy5jIGIvZHJpdmVycy9udmRpbW0vZGltbV9kZXZzLmMNCj4gPiBp
bmRleCA2MTM3NGRlZjUxNTU1Li5iNTkwMzJlMDg1OWI3IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZl
cnMvbnZkaW1tL2RpbW1fZGV2cy5jDQo+ID4gKysrIGIvZHJpdmVycy9udmRpbW0vZGltbV9kZXZz
LmMNCj4gPiBAQCAtNTI5LDYgKzUyOSw3IEBAIHN0YXRpYyBERVZJQ0VfQVRUUl9BRE1JTl9SVyhh
Y3RpdmF0ZSk7DQo+ID4gIHN0YXRpYyBzdHJ1Y3QgYXR0cmlidXRlICpudmRpbW1fZmlybXdhcmVf
YXR0cmlidXRlc1tdID0gew0KPiA+ICAJJmRldl9hdHRyX2FjdGl2YXRlLmF0dHIsDQo+ID4gIAkm
ZGV2X2F0dHJfcmVzdWx0LmF0dHIsDQo+ID4gKwlOVUxMLA0KPiA+ICB9Ow0KPiA+ICANCj4gPiAg
c3RhdGljIHVtb2RlX3QgbnZkaW1tX2Zpcm13YXJlX3Zpc2libGUoc3RydWN0IGtvYmplY3QgKmtv
YmosIHN0cnVjdCBhdHRyaWJ1dGUgKmEsIGludCBuKQ0KPiA+IC0tIA0KPiA+IDIuMjYuMg0KPiA+
IA0KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiBM
aW51eC1udmRpbW0gbWFpbGluZyBsaXN0IC0tIGxpbnV4LW52ZGltbUBsaXN0cy4wMS5vcmcNCj4g
VG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byBsaW51eC1udmRpbW0tbGVhdmVAbGlzdHMu
MDEub3JnDQo=
