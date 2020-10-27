Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 65AA129CC2A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Oct 2020 23:46:27 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CLRdY09QpzDqN7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Oct 2020 09:46:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=rick.p.edgecombe@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com
 header.b=jEXzbr3m; dkim-atps=neutral
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CLRbQ0gkwzDqM1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Oct 2020 09:44:29 +1100 (AEDT)
IronPort-SDR: TIuP4UBR2s+sRTy1aOvA1xtRU3xjt27SseXD/xUEQHhz1htiFqhFIr/RcDprw1PL0yHNohmgCK
 7sGU5iYobnLQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9787"; a="232357571"
X-IronPort-AV: E=Sophos;i="5.77,424,1596524400"; d="scan'208";a="232357571"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2020 15:44:25 -0700
IronPort-SDR: ySPehf4FATLtXOEqimT6jXUaDZbddMSxJE1mCAMblSriFSbiqo6ezD0NBH6gBYL2yqXUoCIV18
 LoNCIfTuMVsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,424,1596524400"; d="scan'208";a="350772630"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga004.fm.intel.com with ESMTP; 27 Oct 2020 15:44:25 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 27 Oct 2020 15:44:25 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 27 Oct 2020 15:44:24 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 27 Oct 2020 15:44:24 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.36.50) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Tue, 27 Oct 2020 15:44:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O7lMv8jwDsNjysUK1JFMZOQrFboqPJD39bDrjIzOaduynaeXVePXTTtSHtY7RdLYctubMWcbB42/ZLzdCbzIrYYk/FwR2zCNvViYmUPI/XVNkdvRP/NhpJvooyq5Ju1hzlXXSxwNiCusfGyCTGNFBYhAoidrCdmMspcaixxjP9LTh8gwjc5QK0DX5rFR7+Ol2CW4d7uNjNRshvroirYFcLGelsEqwYEVt7l8tm/lum4iK2ksBpzQ8OOCYQQDqpWZVVxAalxv8tTdSNxqJHUYtOQI4XCkOpMZjZF49PFuL5jQbUO3XlzfU+vYFWubZSf59VdZJl2YJlLzb70swlsgjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9P1dwNVhyQjynAm9m4NDZBlkeuJK+JrO/RmcZcC9MDQ=;
 b=jdJuZCJ4rF90R2MmIFhHzB6lkYyxJN3LgwlKe/LrnOxrwjfJ+DskQ1YJW9+QqDEX2e99iOnFpC2CzD/7X8IVSC/5HtCi14LbiZwaCz5D0No3ajU7+et4WkDGoUQRczJ/2RDWQw7yUjqwpZKgixUWEeH0/wQ89Uv35iMncfhy6dM5kke7h4eLs7GepMO71su405lITMeBDfG9bdHqyHPaHFiFfjumfzhjjcZ26VTEP1bHqnLeFLQpevIp97BTM97+KK1O2KrXezwsQdU457znsfdXCE0+ggTwxv1+MODe636Zj3EfOSjkZvdRrDA91odZ6kXEm5Hqix2oTYSvgjMy+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9P1dwNVhyQjynAm9m4NDZBlkeuJK+JrO/RmcZcC9MDQ=;
 b=jEXzbr3mloyPftEYl9xf0v78ztI5VT4Jr3jH8ZrAuUBC0bvx7qlJkiZZ7B8DHAIXJMyFpsVI5p/HrsLZl89Q9jSr9AlpYqmFyez75IjN8FCpU8ApKjkYNJqts4hJJ1wRtASf+o0Dz6P+2+5s13Smk0T3SbG3v3t/FnddnflKJ14=
Received: from SN6PR11MB3184.namprd11.prod.outlook.com (2603:10b6:805:bd::17)
 by SN6PR11MB2845.namprd11.prod.outlook.com (2603:10b6:805:5f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Tue, 27 Oct
 2020 22:44:22 +0000
Received: from SN6PR11MB3184.namprd11.prod.outlook.com
 ([fe80::b901:8e07:4340:6704]) by SN6PR11MB3184.namprd11.prod.outlook.com
 ([fe80::b901:8e07:4340:6704%7]) with mapi id 15.20.3477.028; Tue, 27 Oct 2020
 22:44:22 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "rppt@kernel.org" <rppt@kernel.org>
Subject: Re: [PATCH 2/4] PM: hibernate: improve robustness of mapping pages in
 the direct map
Thread-Topic: [PATCH 2/4] PM: hibernate: improve robustness of mapping pages
 in the direct map
Thread-Index: AQHWqrf6LRJhAvsqzE2DP+hB1ynbOKmpCzYAgACQkACAAKKAgIAA6FMAgADpYQA=
Date: Tue, 27 Oct 2020 22:44:21 +0000
Message-ID: <ce66dcf2bbc17d40bcbe752868edb13976b3f1bb.camel@intel.com>
References: <20201025101555.3057-1-rppt@kernel.org>
 <20201025101555.3057-3-rppt@kernel.org>
 <f20900a403bea9eb3f0814128e5ea46f6580f5a5.camel@intel.com>
 <20201026091554.GB1154158@kernel.org>
 <a28d8248057e7dc01716764da9edfd666722ff62.camel@intel.com>
 <20201027084902.GH1154158@kernel.org>
In-Reply-To: <20201027084902.GH1154158@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.30.1 (3.30.1-1.fc29) 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=intel.com;
x-originating-ip: [134.134.137.75]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4c7b28e7-472b-4c30-ca78-08d87ac9d8fa
x-ms-traffictypediagnostic: SN6PR11MB2845:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR11MB2845D35C9A095C02CA884AE2C9160@SN6PR11MB2845.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JOu4gJG5ejdqAOEiO/wg4qgB0WumcfZLfGmWEi5wt9P8k15AcPupu1ucjfc+ol6RrgZIAyV2BBZxvntFsDaAK9GY1Hp6f9B1qtytcA2ypPn+lF2/B53ySyLteO5m5BWI4/tQD9eFkpVwHJnqnFeTkQsUcwrkg8X8HGDciI7wab2EFhbTUgKzHc+S16tHaqqQc9aY2X+7CmbJltrZYR7x1+zPgvfR6MgpjIqeLSsjxxMST7UtsGKwFrL55MiWA0XSRWX2mVarJnZcE4ls4vHAA6rn52kAHXh6F7pBKLMLRXyIF50FlcsaQtDkm8ZJYRamNGkuoVsE/E/gxuvSO/1k1w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB3184.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(366004)(39860400002)(346002)(136003)(8936002)(64756008)(66556008)(36756003)(316002)(4001150100001)(66946007)(6486002)(66446008)(76116006)(66476007)(54906003)(91956017)(6512007)(4326008)(7406005)(478600001)(71200400001)(7416002)(186003)(86362001)(83380400001)(6916009)(2616005)(8676002)(5660300002)(2906002)(6506007)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: Yp6AqedV1028MzqkAjufiAqtIIEkFc2Hhjdq5ec4rP6HIHz9hdyq9OnjrlKCgceG7aeib16bfKCNACxXHT1a/drAM7c1qK0G6VvEb7vfKeJuwBSZFFhvECsFf8rwHuC9WO9aaxz9EirP0VVW0A9kWbhCROy1yJUd1eeK8gntnNi+EbenrEnNaTzTlScsGwIeyCB/DzF4LN1tmdyPoe+/dxgp3astXEPqD7qNwZyH1E2/setjFP7VJ813EcroCmba9wrPruoR4snPML7auTzPTt2RlvAUl5V0i2g6zUMAS0UUf0ycH8ZzDbowF733llmd5tdr3ZWNnmMQHp7DdMy5pd3C2wyh9KXG7ebtpK0yFur8N3r638mX9+tpY1CBJpGCv51HGw/ykZyqTOfDLfWvACj2UqFUpsvT6t8rgULalSJHawhLKjTg/Wxsc5RdVDNCqdFbWXfNI1xd/4uw3gHIYC6HEojL/Sg/kXOWL853fKRh9g9n2jD56a0C3mc+m68HlmdFuYESr+oT5lcgEbCs5/Q0VB6GyH8FHYlh5kIZtDo7/xH83efudtOT90dt3tTTmUB1GixZBCObrHMNcr1i3hqq8r8F8vTaMjMk8OGD5aCdzTE282vAXjK8rkmiRXlHQuxu4BPgnW++6sDzLKCdbg==
Content-Type: text/plain; charset="utf-8"
Content-ID: <B57301ABB1B231459300569F98D25757@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3184.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c7b28e7-472b-4c30-ca78-08d87ac9d8fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2020 22:44:21.8835 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Gkng78fi8mnwQZH9Am1bRhwfPuNsMczfvrLJDpn/EAb711OwlyAwp7bSPSIw4exGtRw/mNxZmn+xp//rIL6bUPo1issaiTG/4+FAXz0YDtA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2845
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
 "iamjoonsoo.kim@lge.com" <iamjoonsoo.kim@lge.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "rjw@rjwysocki.net" <rjw@rjwysocki.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "penberg@kernel.org" <penberg@kernel.org>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "davem@davemloft.net" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gVHVlLCAyMDIwLTEwLTI3IGF0IDEwOjQ5ICswMjAwLCBNaWtlIFJhcG9wb3J0IHdyb3RlOg0K
PiBPbiBNb24sIE9jdCAyNiwgMjAyMCBhdCAwNjo1NzozMlBNICswMDAwLCBFZGdlY29tYmUsIFJp
Y2sgUCB3cm90ZToNCj4gPiBPbiBNb24sIDIwMjAtMTAtMjYgYXQgMTE6MTUgKzAyMDAsIE1pa2Ug
UmFwb3BvcnQgd3JvdGU6DQo+ID4gPiBPbiBNb24sIE9jdCAyNiwgMjAyMCBhdCAxMjozODozMkFN
ICswMDAwLCBFZGdlY29tYmUsIFJpY2sgUA0KPiA+ID4gd3JvdGU6DQo+ID4gPiA+IE9uIFN1biwg
MjAyMC0xMC0yNSBhdCAxMjoxNSArMDIwMCwgTWlrZSBSYXBvcG9ydCB3cm90ZToNCj4gPiA+ID4g
PiBGcm9tOiBNaWtlIFJhcG9wb3J0IDxycHB0QGxpbnV4LmlibS5jb20+DQo+ID4gPiA+ID4gDQo+
ID4gPiA+ID4gV2hlbiBERUJVR19QQUdFQUxMT0Mgb3IgQVJDSF9IQVNfU0VUX0RJUkVDVF9NQVAg
aXMgZW5hYmxlZCBhDQo+ID4gPiA+ID4gcGFnZQ0KPiA+ID4gPiA+IG1heQ0KPiA+ID4gPiA+IGJl
DQo+ID4gPiA+ID4gbm90IHByZXNlbnQgaW4gdGhlIGRpcmVjdCBtYXAgYW5kIGhhcyB0byBiZSBl
eHBsaWNpdGx5IG1hcHBlZA0KPiA+ID4gPiA+IGJlZm9yZQ0KPiA+ID4gPiA+IGl0DQo+ID4gPiA+
ID4gY291bGQgYmUgY29waWVkLg0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IE9uIGFybTY0IGl0IGlz
IHBvc3NpYmxlIHRoYXQgYSBwYWdlIHdvdWxkIGJlIHJlbW92ZWQgZnJvbSB0aGUNCj4gPiA+ID4g
PiBkaXJlY3QNCj4gPiA+ID4gPiBtYXANCj4gPiA+ID4gPiB1c2luZyBzZXRfZGlyZWN0X21hcF9p
bnZhbGlkX25vZmx1c2goKSBidXQNCj4gPiA+ID4gPiBfX2tlcm5lbF9tYXBfcGFnZXMoKQ0KPiA+
ID4gPiA+IHdpbGwNCj4gPiA+ID4gPiByZWZ1c2UNCj4gPiA+ID4gPiB0byBtYXAgdGhpcyBwYWdl
IGJhY2sgaWYgREVCVUdfUEFHRUFMTE9DIGlzIGRpc2FibGVkLg0KPiA+ID4gPiANCj4gPiA+ID4g
SXQgbG9va3MgdG8gbWUgdGhhdCBhcm02NCBfX2tlcm5lbF9tYXBfcGFnZXMoKSB3aWxsIHN0aWxs
DQo+ID4gPiA+IGF0dGVtcHQNCj4gPiA+ID4gdG8NCj4gPiA+ID4gbWFwIGl0IGlmIHJvZGF0YV9m
dWxsIGlzIHRydWUsIGhvdyBkb2VzIHRoaXMgaGFwcGVuPw0KPiA+ID4gDQo+ID4gPiBVbmxlc3Mg
SSBtaXNyZWFkIHRoZSBjb2RlLCBhcm02NCByZXF1aXJlcyBib3RoIHJvZGF0YV9mdWxsIGFuZA0K
PiA+ID4gZGVidWdfcGFnZWFsbG9jX2VuYWJsZWQoKSB0byBiZSB0cnVlIGZvciBfX2tlcm5lbF9t
YXBfcGFnZXMoKSB0bw0KPiA+ID4gZG8NCj4gPiA+IGFueXRoaW5nLg0KPiA+ID4gQnV0IHJvZGF0
YV9mdWxsIGNvbmRpdGlvbiBhcHBsaWVzIHRvIHNldF9kaXJlY3RfbWFwXypfbm9mbHVzaCgpDQo+
ID4gPiBhcw0KPiA+ID4gd2VsbCwNCj4gPiA+IHNvIHdpdGggIXJvZGF0YV9mdWxsIHRoZSBsaW5l
YXIgbWFwIHdvbid0IGJlIGV2ZXIgY2hhbmdlZC4NCj4gPiANCj4gPiBIbW0sIGxvb2tzIHRvIG1l
IHRoYXQgX19rZXJuZWxfbWFwX3BhZ2VzKCkgd2lsbCBvbmx5IHNraXAgaXQgaWYNCj4gPiBib3Ro
DQo+ID4gZGVidWcgcGFnZWFsbG9jIGFuZCByb2RhdGFfZnVsbCBhcmUgZmFsc2UuDQo+ID4gDQo+
ID4gQnV0IG5vdyBJJ20gd29uZGVyaW5nIGlmIG1heWJlIHdlIGNvdWxkIHNpbXBsaWZ5IHRoaW5n
cyBieSBqdXN0DQo+ID4gbW92aW5nDQo+ID4gdGhlIGhpYmVybmF0ZSB1bm1hcHBlZCBwYWdlIGxv
Z2ljIG9mZiBvZiB0aGUgZGlyZWN0IG1hcC4gT24geDg2LA0KPiA+IHRleHRfcG9rZSgpIHVzZWQg
dG8gdXNlIHRoaXMgcmVzZXJ2ZWQgZml4bWFwIHB0ZSB0aGluZyB0aGF0IGl0DQo+ID4gY291bGQN
Cj4gPiByZWx5IG9uIHRvIHJlbWFwIG1lbW9yeSB3aXRoLiBJZiBoaWJlcm5hdGUgaGFkIHNvbWUg
c2VwYXJhdGUgcHRlDQo+ID4gZm9yDQo+ID4gcmVtYXBwaW5nIGxpa2UgdGhhdCwgdGhlbiB3ZSBj
b3VsZCBub3QgaGF2ZSBhbnkgZGlyZWN0IG1hcA0KPiA+IHJlc3RyaWN0aW9ucw0KPiA+IGNhdXNl
ZCBieSBpdC9rZXJuZWxfbWFwX3BhZ2VzKCksIGFuZCBpdCB3b3VsZG4ndCBoYXZlIHRvIHdvcnJ5
DQo+ID4gYWJvdXQNCj4gPiByZWx5aW5nIG9uIGFueXRoaW5nIGVsc2UuDQo+IA0KPiBXZWxsLCB0
aGVyZSBpcyBtYXBfa2VybmVsX3JhbmdlKCkgdGhhdCBjYW4gYmUgdXNlZCBieSBoaWJlcm5hdGlv
biBhcw0KPiB0aGVyZSBpcyBubyByZXF1aXJlbWVudCBmb3IgcGFydGljdWxhciB2aXJ0dWFsIGFk
ZHJlc3MsIGJ1dCB0aGF0DQo+IHdvdWxkDQo+IGJlIHF1aXRlIGNvc3RseSBpZiBkb25lIGZvciBl
dmVyeSBwYWdlLg0KPiANCj4gTWF5YmUgd2UgY2FuIGRvIHNvbXRoaW5nIGxpa2UNCj4gDQo+IAlp
ZiAoa2VybmVsX3BhZ2VfcHJlc2VudChzX3BhZ2UpKSB7DQo+IAkJZG9fY29weV9wYWdlKGRzdCwg
cGFnZV9hZGRyZXNzKHNfcGFnZSkpOw0KPiAJfSBlbHNlIHsNCj4gCQltYXBfa2VybmVsX3Jhbmdl
X25vZmx1c2gocGFnZV9hZGRyZXNzKHBhZ2UpLCBQQUdFX1NJWkUsDQo+IAkJCQkJIFBST1RfUkVB
RCwgJnBhZ2UpOw0KPiAJCWRvX2NvcHlfcGFnZShkc3QsIHBhZ2VfYWRkcmVzcyhzX3BhZ2UpKTsN
Cj4gCQl1bm1hcF9rZXJuZWxfcmFuZ2Vfbm9mbHVzaChwYWdlX2FkZHJlc3MocGFnZSksDQo+IFBB
R0VfU0laRSk7DQo+IAl9DQo+IA0KPiBCdXQgaXQgc2VlbXMgdGhhdCBhIHByZXJlcXVpc2l0ZSBm
b3IgY2hhbmdpbmcgdGhlIHdheSBhIHBhZ2UgaXMNCj4gbWFwcGVkDQo+IGluIHNhZmVfY29weV9w
YWdlKCkgd291bGQgYmUgdG8gdGVhY2ggaGliZXJuYXRpb24gdGhhdCBhIG1hcHBpbmcgaGVyZQ0K
PiBtYXkgZmFpbC4NCj4gDQpZZWEgdGhhdCBpcyB3aGF0IEkgbWVhbnQsIHRoZSBkaXJlY3QgbWFw
IGNvdWxkIHN0aWxsIGJlIHVzZWQgZm9yIG1hcHBlZA0KcGFnZXMuDQoNCkJ1dCBmb3IgdGhlIHVu
bWFwcGVkIGNhc2UgaXQgY291bGQgaGF2ZSBhIHByZS1zZXR1cCA0ayBwdGUgZm9yIHNvbWUgbm9u
DQpkaXJlY3QgbWFwIGFkZHJlc3MuIFRoZW4ganVzdCBjaGFuZ2UgdGhlIHB0ZSB0byBwb2ludCB0
byBhbnkgdW5tYXBwZWQNCmRpcmVjdCBtYXAgcGFnZSB0aGF0IHdhcyBlbmNvdW50ZXJlZC4gVGhl
IHBvaW50IHdvdWxkIGJlIHRvIGdpdmUNCmhpYmVybmF0ZSBzb21lIDRrIHB0ZSBvZiBpdHMgb3du
IHRvIG1hbmlwdWxhdGUgc28gdGhhdCBpdCBjYW4ndCBmYWlsLg0KDQpZZXQgYW5vdGhlciBvcHRp
b24gd291bGQgYmUgaGF2ZSBoaWJlcm5hdGVfbWFwX3BhZ2UoKSBqdXN0IG1hcCBsYXJnZQ0KcGFn
ZXMgaWYgaXQgZmluZHMgdGhlbS4NCg0KU28gd2UgY291bGQgdGVhY2ggaGliZXJuYXRlIHRvIGhh
bmRsZSBtYXBwaW5nIGZhaWx1cmVzLCBPUiB3ZSBjb3VsZA0KY2hhbmdlIGl0IHNvIGl0IGRvZXNu
J3QgcmVseSBvbiBkaXJlY3QgbWFwIHBhZ2Ugc2l6ZXMgaW4gb3JkZXIgdG8NCnN1Y2NlZWQuIFRo
ZSBsYXR0ZXIgc2VlbXMgYmV0dGVyIHRvIG1lIHNpbmNlIHRoZXJlIGlzbid0IGEgcmVhc29uIHdo
eQ0KaXQgc2hvdWxkIGhhdmUgdG8gZmFpbCBhbmQgdGhlIHJlc3VsdGluZyBsb2dpYyBtaWdodCBi
ZSBzaW1wbGVyLiBCb3RoDQpzZWVtIGxpa2UgaW1wcm92ZW1lbnRzIGluIHJvYnVzdG5lc3MgdGhv
dWdoLg0KDQo=
