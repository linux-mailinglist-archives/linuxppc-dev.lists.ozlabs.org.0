Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BB629D269
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Oct 2020 22:22:47 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CM1kX2CH4zDqwj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Oct 2020 08:22:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=rick.p.edgecombe@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com
 header.b=wqW1ZG0A; dkim-atps=neutral
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CM1Jc1nkqzDqWG
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Oct 2020 08:03:42 +1100 (AEDT)
IronPort-SDR: s4K5ocUU4uPvjrdIn2YN60H792M3QhE1enq7CkLxmBbiHEzxU62Sb8oOWllVYagypJbmydZ1P4
 GrbX23GObehA==
X-IronPort-AV: E=McAfee;i="6000,8403,9788"; a="148192689"
X-IronPort-AV: E=Sophos;i="5.77,428,1596524400"; d="scan'208";a="148192689"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2020 14:03:36 -0700
IronPort-SDR: 8Fnp/m19OoQ0PF94x+pIsBXqe80yUPmUNRJphy71q+x/GktXHCxJ5kepMftnOVAi6MUaTHu2qi
 WcfBF5VSowNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,428,1596524400"; d="scan'208";a="351158856"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by fmsmga004.fm.intel.com with ESMTP; 28 Oct 2020 14:03:35 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 28 Oct 2020 14:03:35 -0700
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 28 Oct 2020 14:03:34 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 28 Oct 2020 14:03:34 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Wed, 28 Oct 2020 14:03:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U/3Mpb+SGN4+cSQ0FYq9/PJlC/wYmKNvukJkKSBmxUS7YkhdZcUs4C2/xbgA4l14f/okwUYcghZZ4/lL1N6L5k0uV/h82A17JS08yrUklD58lxmYSGKkyHsa+JiOfq2cz5+fv0XPVwhrpzeswj1F9t9OJIxJkcD78WbaP+a1GmQ/7JTdZM5KpMA+fyfqjFdh1fDBlpPe2cpxXW1v9Bv1hovTC/+hjWkN9BjuUQ48eoDFPsgZWx2Q3FSkSJl21JkcfrATJZALOfw6rBULRk2HfGbQ0Ubgq3/9QXwixkzCh1XkgPoWxfOgi58V/4Pbdeqb26JVvw7K/vV6lhj7W+TMIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zAZhJfD6OsQo5ORolnzWi25k4gfuBM7Onv0jt2kzKUg=;
 b=iJ8hwZc9zd5TCwo+ZDyxZczaMNmILA2IaI7W3Ac2Aoehq6zLmBdTMS86yrXmWq6mRkkG6difG38+d1ZRFvLh54wYL9uM36kmuT1oY/wi0ncRdW7GqdyptJ5ZPaHUUkLY3GOfTZpwUzg1D3rMuEicCilppAY+1JEwTmz9Af/tr4wQqLNpjo+0gWDVHfidLHXkjigSMgVo+OChRacczHGVlc9lybir+Dcqu88N5jJn/NYBUvmpoFB5ivmcZX10uL/EXb/RWG2Qtw4LFSOQ+KrMerC2CuvY/Jv6MkFv7RZIMoZtfR9s8O+509gAIS8yEPn2fA/0/eqP+641H7G1unuXhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zAZhJfD6OsQo5ORolnzWi25k4gfuBM7Onv0jt2kzKUg=;
 b=wqW1ZG0AtZzRHmDuhHgb+8Ww4Jfeep1mPb5qcFiXapOydJD0B27pnbNGUWzfF5AHpgyWtkhO03Mx96gMHkjsqe5bVFepeONx8Zr6ykBdGdGLwuIg8aHsklOBlD3yf2v9TIgj3//BPuY3C72bNvz1oYpdXZmLK7jyVjn9k/Ytqc8=
Received: from SN6PR11MB3184.namprd11.prod.outlook.com (2603:10b6:805:bd::17)
 by SN6PR11MB3437.namprd11.prod.outlook.com (2603:10b6:805:db::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20; Wed, 28 Oct
 2020 21:03:33 +0000
Received: from SN6PR11MB3184.namprd11.prod.outlook.com
 ([fe80::b901:8e07:4340:6704]) by SN6PR11MB3184.namprd11.prod.outlook.com
 ([fe80::b901:8e07:4340:6704%7]) with mapi id 15.20.3477.028; Wed, 28 Oct 2020
 21:03:31 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "will@kernel.org" <will@kernel.org>, "rppt@kernel.org" <rppt@kernel.org>
Subject: Re: [PATCH 0/4] arch, mm: improve robustness of direct map
 manipulation
Thread-Topic: [PATCH 0/4] arch, mm: improve robustness of direct map
 manipulation
Thread-Index: AQHWqrf3SYgZeORHqEa1kMKSitw9UKmpFReAgACDwgCAAJbiAIAA89wAgAG/kwCAAAMDgIAAn/WA
Date: Wed, 28 Oct 2020 21:03:31 +0000
Message-ID: <9e77d0a939eda3029d6ae89bd14d7f1465b0559d.camel@intel.com>
References: <20201025101555.3057-1-rppt@kernel.org>
 <ae82f905a0092adb7e0f0ac206335c1883b3170f.camel@intel.com>
 <20201026090526.GA1154158@kernel.org>
 <a0212b073b3b2f62c3dbf1bf398f03fa402997be.camel@intel.com>
 <20201027083816.GG1154158@kernel.org>
 <20201028112011.GB27927@willie-the-truck>
 <20201028113059.GG1428094@kernel.org>
In-Reply-To: <20201028113059.GG1428094@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.30.1 (3.30.1-1.fc29) 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=intel.com;
x-originating-ip: [134.134.137.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1172831f-adbc-41cc-b38e-08d87b84ed44
x-ms-traffictypediagnostic: SN6PR11MB3437:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR11MB34375DA7570B1F899B151780C9170@SN6PR11MB3437.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tJfm5p48V+DiodzMvNLUYiWMC39XjyMOSoDghzvvfmUr32QKdjniwAu8ktLu0jy9EFu5i8OZ4jEe7Uu6pd8BzRRZbt1HH+F3c9a2b1e5Q3cittABLg5E5GbOtu3nkaDtRrORnPHrIFaguRroyR0G9qeUEnCElcy0rU1XyNMshMZiE+88imLbGHRLJcgm3qnjtSF13srsSoy/12iL1gD4bSOy5EAxSTSAHzMrW0uzYfxoVx6eWZ8+bCRCuxE/0OT97Id5O5OHjaGsUh/TcgWtPPCf5q/ABGi2Nc9XxFsVg3YDhoNlBnborB2ehaH9R4fmxiudVBZiaISyVu94q9wc3w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB3184.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(366004)(396003)(136003)(346002)(7406005)(91956017)(66476007)(64756008)(4001150100001)(186003)(2616005)(8936002)(26005)(76116006)(36756003)(66946007)(478600001)(66446008)(66556008)(6486002)(86362001)(4326008)(110136005)(8676002)(6506007)(71200400001)(83380400001)(54906003)(7416002)(5660300002)(316002)(6512007)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: fBWAiccndId9oskYRy9/C10+ebq6uEZ7vhv224LX0XWtxIHvu+YCYAudwl7ybJg5CfRMRqcfhMFtQOU2RQJWBfUWYqFM4Zf/AYfmIIH0RDQNeCiFiPsZFpmRZ/m8ZQ7WSX1nZQbxUdSqVGPkd3AKh1mPQfdB1BWeAeX7Bjap+yxJQVenZ0pBKAmlQgL8qTSz/9xXcD+TXTrmMBBwvJgSyvEzzNEBDT+2bsw/7RrLJG11eB4MM7GiwCsIWszHKQBKugWPM7Dbd7Xi/tsx/MjRNc/QfQjldVmHao01ZZueJ2+XFxUeEY7sO7DHkg51x8FPpR6oW+Yxb7LHCj41XjuTY43vG0w5FBFu6zzTbFwoFUXszrqSUdVt7BozJkPurleB8vUU9Zf1vH8uHMP9XqgPmUF+SaMFQ7USlW01GfGYHmFsuE9Jt0+54Zzq4j69N5MjDfTn8roqze0nm4i+XS7rdv/MCs4X4Pn3C/ku3EGkFGiGp0Bq71T71rWfxHlFA8RfI7ciqYXC7bUaX5R+hKRDxj0eFr9rgbD3n7izcIsdBMHYZgXmcYEDvzwTPN+LEaAsNngtFOEsgOf6adtLiOM6wHQMEu49iPyqt4j3JzkoGTWvrXI/0XoDLZfuNJ5Oe6kx9nj3y64izN7VpdSufyM9sg==
Content-Type: text/plain; charset="utf-8"
Content-ID: <6A57DF794371B74D8EDF50341EA0B257@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3184.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1172831f-adbc-41cc-b38e-08d87b84ed44
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2020 21:03:31.7828 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /v7YTfuF7d6l8QAVjaRFt8aGtaUV+331a/dKdsPQ5YuwSDYBuLMmOUdoDn6N6zBfw2g0WOPCtth+2tso3T3TfDQTIOdkHoTlltxTNbIlz44=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3437
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
 "cl@linux.com" <cl@linux.com>,
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

T24gV2VkLCAyMDIwLTEwLTI4IGF0IDEzOjMwICswMjAwLCBNaWtlIFJhcG9wb3J0IHdyb3RlOg0K
PiBPbiBXZWQsIE9jdCAyOCwgMjAyMCBhdCAxMToyMDoxMkFNICswMDAwLCBXaWxsIERlYWNvbiB3
cm90ZToNCj4gPiBPbiBUdWUsIE9jdCAyNywgMjAyMCBhdCAxMDozODoxNkFNICswMjAwLCBNaWtl
IFJhcG9wb3J0IHdyb3RlOg0KPiA+ID4gT24gTW9uLCBPY3QgMjYsIDIwMjAgYXQgMDY6MDU6MzBQ
TSArMDAwMCwgRWRnZWNvbWJlLCBSaWNrIFANCj4gPiA+IHdyb3RlOg0KPiA+ID4gPiBPbiBNb24s
IDIwMjAtMTAtMjYgYXQgMTE6MDUgKzAyMDAsIE1pa2UgUmFwb3BvcnQgd3JvdGU6DQo+ID4gPiA+
ID4gT24gTW9uLCBPY3QgMjYsIDIwMjAgYXQgMDE6MTM6NTJBTSArMDAwMCwgRWRnZWNvbWJlLCBS
aWNrIFANCj4gPiA+ID4gPiB3cm90ZToNCj4gPiA+ID4gPiA+IE9uIFN1biwgMjAyMC0xMC0yNSBh
dCAxMjoxNSArMDIwMCwgTWlrZSBSYXBvcG9ydCB3cm90ZToNCj4gPiA+ID4gPiA+ID4gSW5kZWVk
LCBmb3IgYXJjaGl0ZWN0dXJlcyB0aGF0IGRlZmluZQ0KPiA+ID4gPiA+ID4gPiBDT05GSUdfQVJD
SF9IQVNfU0VUX0RJUkVDVF9NQVANCj4gPiA+ID4gPiA+ID4gaXQgaXMNCj4gPiA+ID4gPiA+ID4g
cG9zc2libGUgdGhhdCBfX2tlcm5lbF9tYXBfcGFnZXMoKSB3b3VsZCBmYWlsLCBidXQgc2luY2UN
Cj4gPiA+ID4gPiA+ID4gdGhpcw0KPiA+ID4gPiA+ID4gPiBmdW5jdGlvbiBpcw0KPiA+ID4gPiA+
ID4gPiB2b2lkLCB0aGUgZmFpbHVyZSB3aWxsIGdvIHVubm90aWNlZC4NCj4gPiA+ID4gPiA+IA0K
PiA+ID4gPiA+ID4gQ291bGQgeW91IGVsYWJvcmF0ZSBvbiBob3cgdGhpcyBjb3VsZCBoYXBwZW4/
IERvIHlvdSBtZWFuDQo+ID4gPiA+ID4gPiBkdXJpbmcNCj4gPiA+ID4gPiA+IHJ1bnRpbWUgdG9k
YXkgb3IgaWYgc29tZXRoaW5nIG5ldyB3YXMgaW50cm9kdWNlZD8NCj4gPiA+ID4gPiANCj4gPiA+
ID4gPiBBIGZhaWx1cmUgaW5fX2tlcm5lbF9tYXBfcGFnZXMoKSBtYXkgaGFwcGVuIHRvZGF5LiBG
b3INCj4gPiA+ID4gPiBpbnN0YW5jZSwgb24NCj4gPiA+ID4gPiB4ODYNCj4gPiA+ID4gPiBpZiB0
aGUga2VybmVsIGlzIGJ1aWx0IHdpdGggREVCVUdfUEFHRUFMTE9DLg0KPiA+ID4gPiA+IA0KPiA+
ID4gPiA+ICAgICAgICAgX19rZXJuZWxfbWFwX3BhZ2VzKHBhZ2UsIDEsIDApOw0KPiA+ID4gPiA+
IA0KPiA+ID4gPiA+IHdpbGwgbmVlZCB0byBzcGxpdCwgc2F5LCAyTSBwYWdlIGFuZCBkdXJpbmcg
dGhlIHNwbGl0IGFuDQo+ID4gPiA+ID4gYWxsb2NhdGlvbg0KPiA+ID4gPiA+IG9mDQo+ID4gPiA+
ID4gcGFnZSB0YWJsZSBjb3VsZCBmYWlsLg0KPiA+ID4gPiANCj4gPiA+ID4gT24geDg2IGF0IGxl
YXN0LCBERUJVR19QQUdFQUxMT0MgZXhwZWN0cyB0byBuZXZlciBoYXZlIHRvIGJyZWFrDQo+ID4g
PiA+IGEgcGFnZQ0KPiA+ID4gPiBvbiB0aGUgZGlyZWN0IG1hcCBhbmQgZXZlbiBkaXNhYmxlcyBs
b2NraW5nIGluIGNwYSBiZWNhdXNlIGl0DQo+ID4gPiA+IGFzc3VtZXMNCj4gPiA+ID4gdGhpcy4g
SWYgdGhpcyBpcyBoYXBwZW5pbmcgc29tZWhvdyBhbnl3YXkgdGhlbiB3ZSBzaG91bGQNCj4gPiA+
ID4gcHJvYmFibHkgZml4DQo+ID4gPiA+IHRoYXQuIEV2ZW4gaWYgaXQncyBhIGRlYnVnIGZlYXR1
cmUsIGl0IHdpbGwgbm90IGJlIGFzIHVzZWZ1bCBpZg0KPiA+ID4gPiBpdCBpcw0KPiA+ID4gPiBj
YXVzaW5nIGl0cyBvd24gY3Jhc2hlcy4NCj4gPiA+ID4gDQo+ID4gPiA+IEknbSBzdGlsbCB3b25k
ZXJpbmcgaWYgdGhlcmUgaXMgc29tZXRoaW5nIEknbSBtaXNzaW5nIGhlcmUuIEl0DQo+ID4gPiA+
IHNlZW1zDQo+ID4gPiA+IGxpa2UgeW91IGFyZSBzYXlpbmcgdGhlcmUgaXMgYSBidWcgaW4gc29t
ZSBhcmNoJ3MsIHNvIGxldCdzIGFkZA0KPiA+ID4gPiBhIFdBUk4NCj4gPiA+ID4gaW4gY3Jvc3Mt
YXJjaCBjb2RlIHRvIGxvZyBpdCBhcyBpdCBjcmFzaGVzLiBBIHdhcm4gYW5kIG1ha2luZw0KPiA+
ID4gPiB0aGluZ3MNCj4gPiA+ID4gY2xlYXJlciBzZWVtIGxpa2UgZ29vZCBpZGVhcywgYnV0IGlm
IHRoZXJlIGlzIGEgYnVnIHdlIHNob3VsZA0KPiA+ID4gPiBmaXggaXQuDQo+ID4gPiA+IFRoZSBj
b2RlIGFyb3VuZCB0aGUgY2FsbGVycyBzdGlsbCBmdW5jdGlvbmFsbHkgYXNzdW1lIHJlLQ0KPiA+
ID4gPiBtYXBwaW5nIGNhbid0DQo+ID4gPiA+IGZhaWwuDQo+ID4gPiANCj4gPiA+IE9oLCBJJ3Zl
IG1lYW50IHg4NiBrZXJuZWwgKndpdGhvdXQqIERFQlVHX1BBR0VBTExPQywgYW5kIGluZGVlZA0K
PiA+ID4gdGhlIGNhbGwNCj4gPiA+IHRoYXQgdW5tYXBzIHBhZ2VzIGJhY2sgaW4gc2FmZV9jb3B5
X3BhZ2Ugd2lsbCBqdXN0IHJlc2V0IGEgNEsNCj4gPiA+IHBhZ2UgdG8NCj4gPiA+IE5QIGJlY2F1
c2Ugd2hhdGV2ZXIgbWFkZSBpdCBOUCBhdCB0aGUgZmlyc3QgcGxhY2UgYWxyZWFkeSBkaWQgdGhl
DQo+ID4gPiBzcGxpdC4NCj4gPiA+IA0KPiA+ID4gU3RpbGwsIG9uIGFybTY0IHdpdGggREVCVUdf
UEFHRUFMTE9DPW4gdGhlcmUgaXMgYSBwb3NzaWJpbGl0eSBvZg0KPiA+ID4gYSByYWNlDQo+ID4g
PiBiZXR3ZWVuIG1hcC91bm1hcCBkYW5jZSBpbiBfX3Z1bm1hcCgpIGFuZCBzYWZlX2NvcHlfcGFn
ZSgpIHRoYXQNCj4gPiA+IG1heQ0KPiA+ID4gY2F1c2UgYWNjZXNzIHRvIHVubWFwcGVkIG1lbW9y
eToNCj4gPiA+IA0KPiA+ID4gX192dW5tYXAoKQ0KPiA+ID4gICAgIHZtX3JlbW92ZV9tYXBwaW5n
cygpDQo+ID4gPiAgICAgICAgIHNldF9kaXJlY3RfbWFwX2ludmFsaWQoKQ0KPiA+ID4gCQkJCQlz
YWZlX2NvcHlfcGFnZSgpCQ0KPiA+ID4gCQkJCQkgICAgX19rZXJuZWxfbWFwX3BhZ2VzKCkNCj4g
PiA+IAkJCQkJICAgIAlyZXR1cm4NCj4gPiA+IAkJCQkJICAgIGRvX2NvcHlfcGFnZSgpIC0+IGZh
dWx0DQo+ID4gPiAJCQkJCSAgIAkNCj4gPiA+IFRoaXMgaXMgYSB0aGVvcmV0aWNhbCBidWcsIGJ1
dCBpdCBpcyBzdGlsbCBub3QgbmljZSA6KSAJCQ0KPiA+ID4gCQkJCQkNCj4gPiANCj4gPiBKdXN0
IHRvIGNsYXJpZnk6IHRoaXMgcGF0Y2ggc2VyaWVzIGZpeGVzIHRoaXMgcHJvYmxlbSwgcmlnaHQ/
DQo+IA0KPiBZZXMuDQo+IA0KDQpXZWxsLCBub3cgSSdtIGNvbmZ1c2VkIGFnYWluLg0KDQpBcyBE
YXZpZCBwb2ludGVkLCBfX3Z1bm1hcCgpIHNob3VsZCBub3QgYmUgZXhlY3V0aW5nIHNpbXVsdGFu
ZW91c2x5DQp3aXRoIHRoZSBoaWJlcm5hdGUgb3BlcmF0aW9uIGJlY2F1c2UgaGliZXJuYXRlIGNh
bid0IHNuYXBzaG90IHdoaWxlDQpkYXRhIGl0IG5lZWRzIHRvIHNhdmUgaXMgc3RpbGwgdXBkYXRp
bmcuIElmIGEgdGhyZWFkIHdhcyBwYXVzZWQgd2hlbiBhDQpwYWdlIHdhcyBpbiBhbiAiaW52YWxp
ZCIgc3RhdGUsIGl0IHNob3VsZCBiZSByZW1hcHBlZCBieSBoaWJlcm5hdGUNCmJlZm9yZSB0aGUg
Y29weS4NCg0KVG8gbGV2ZWwgc2V0LCBiZWZvcmUgcmVhZGluZyB0aGlzIG1haWwsIG15IHRha2Vh
d2F5cyBmcm9tIHRoZQ0KZGlzY3Vzc2lvbnMgb24gcG90ZW50aWFsIGhpYmVybmF0ZS9kZWJ1ZyBw
YWdlIGFsbG9jIHByb2JsZW1zIHdlcmU6DQoNClBvdGVudGlhbCBSSVNDLVYgaXNzdWU6DQpEb2Vz
bid0IGhhdmUgaGliZXJuYXRlIHN1cHBvcnQNCg0KUG90ZW50aWFsIEFSTSBpc3N1ZToNClRoZSBs
b2dpYyBhcm91bmQgd2hlbiBpdCdzIGNwYSBkZXRlcm1pbmVzIHBhZ2VzIG1pZ2h0IGJlIHVubWFw
cGVkIGxvb2tzDQpjb3JyZWN0IGZvciBjdXJyZW50IGNhbGxlcnMuDQoNClBvdGVudGlhbCB4ODYg
cGFnZSBicmVhayBpc3N1ZToNClNlZW1zIHRvIGJlIG9rIGZvciBub3csIGJ1dCBhIG5ldyBzZXRf
bWVtb3J5X25wKCkgY2FsbGVyIGNvdWxkIHZpb2xhdGUNCmFzc3VtcHRpb25zIGluIGhpYmVybmF0
ZS4NCg0KTm9uLW9idmlvdXMgdGhvcm55IGxvZ2ljOiANCkdlbmVyYWwgYWdyZWVtZW50IGl0IHdv
dWxkIGJlIGdvb2QgdG8gc2VwYXJhdGUgZGVwZW5kZW5jaWVzLg0KDQpCZWhhdmlvciBvZiBWMSBv
ZiB0aGlzIHBhdGNoc2V0Og0KTm8gZnVuY3Rpb25hbCBjaGFuZ2Ugb3RoZXIgdGhhbiBhZGRpdGlv
biBvZiBhIHdhcm4gaW4gaGliZXJuYXRlLg0KDQoNClNvICJkb2VzIHRoaXMgZml4IHRoZSBwcm9i
bGVtIiwgInllcyIgbGVhdmVzIG1lIGEgYml0IGNvbmZ1c2VkLi4uIE5vdA0Kc2F5aW5nIHRoZXJl
IGNvdWxkbid0IGJlIGFueSBwcm9ibGVtcywgZXNwZWNpYWxseSBkdWUgdG8gdGhlIHRob3JuaW5l
c3MNCmFuZCBjcm9zcyBhcmNoIHN0cmlkZSwgYnV0IHdoYXQgaXMgaXQgZXhhY3RseSBhbmQgaG93
IGRvZXMgdGhpcyBzZXJpZXMNCmZpeCBpdD8NCg0K
