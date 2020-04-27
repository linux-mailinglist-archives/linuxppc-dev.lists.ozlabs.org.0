Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F551BA7CD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Apr 2020 17:21:05 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 499pQ50tXKzDqQk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 01:21:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=jonathan.derrick@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 499pJP5hXWzDqZL
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Apr 2020 01:15:56 +1000 (AEST)
IronPort-SDR: BytYhvopUEQNCbCGMcwaw7XDkpjwXhAv+xgoyDx2uH0K+z+OhI2HQj5cGwTIaRbYhULABnNPOe
 Uj4SP0tjgWKA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2020 08:15:38 -0700
IronPort-SDR: zZYgPQLIGuqPb367g+MrrtH/5nJbhuWhverW/aZT9RKMh+fo+qH3LEggYNetESR/4lSyRJM4+H
 6nV0jI1S2CDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,324,1583222400"; d="scan'208";a="431810513"
Received: from orsmsx105.amr.corp.intel.com ([10.22.225.132])
 by orsmga005.jf.intel.com with ESMTP; 27 Apr 2020 08:15:37 -0700
Received: from orsmsx115.amr.corp.intel.com (10.22.240.11) by
 ORSMSX105.amr.corp.intel.com (10.22.225.132) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 27 Apr 2020 08:15:37 -0700
Received: from orsmsx101.amr.corp.intel.com ([169.254.8.204]) by
 ORSMSX115.amr.corp.intel.com ([169.254.4.83]) with mapi id 14.03.0439.000;
 Mon, 27 Apr 2020 08:15:37 -0700
From: "Derrick, Jonathan" <jonathan.derrick@intel.com>
To: "sathyanarayanan.kuppuswamy@linux.intel.com"
 <sathyanarayanan.kuppuswamy@linux.intel.com>, "helgaas@kernel.org"
 <helgaas@kernel.org>
Subject: Re: [PATCH v2 2/2] PCI/DPC: Allow Native DPC Host Bridges to use DPC
Thread-Topic: [PATCH v2 2/2] PCI/DPC: Allow Native DPC Host Bridges to use DPC
Thread-Index: AQHWF186KnXLsMWtVkCGO69asmmcQaiGN2OAgAESEwCAA4JngIACyCOA
Date: Mon, 27 Apr 2020 15:15:36 +0000
Message-ID: <6344a9afcc585504c5dfbc00174280613683064d.camel@intel.com>
References: <1587418630-13562-1-git-send-email-jonathan.derrick@intel.com>
 <1587418630-13562-3-git-send-email-jonathan.derrick@intel.com>
 <0058b993-0663-7fed-ed31-cb0adf845a39@linux.intel.com>
 <ea21d9475b0af277c7288504ff2cd32b3f91e4ba.camel@intel.com>
 <7e574cc1-a24b-5c4b-7d4f-3fda3f395390@linux.intel.com>
In-Reply-To: <7e574cc1-a24b-5c4b-7d4f-3fda3f395390@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.255.3.119]
Content-Type: text/plain; charset="utf-8"
Content-ID: <DA95B75948026E40ACB35C2843122F18@intel.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
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
Cc: "bhelgaas@google.com" <bhelgaas@google.com>, "Patel,
 Mayurkumar" <mayurkumar.patel@intel.com>,
 "fred@fredlawl.com" <fred@fredlawl.com>,
 "sbobroff@linux.ibm.com" <sbobroff@linux.ibm.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "Wysocki, 
 Rafael J" <rafael.j.wysocki@intel.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "olof@lixom.net" <olof@lixom.net>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "oohall@gmail.com" <oohall@gmail.com>, "kbusch@kernel.org" <kbusch@kernel.org>,
 "rajatja@google.com" <rajatja@google.com>,
 "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SGkgU2F0aHlhbmFyYXlhbmFuLA0KDQpPbiBTYXQsIDIwMjAtMDQtMjUgYXQgMTM6NDYgLTA3MDAs
IEt1cHB1c3dhbXksIFNhdGh5YW5hcmF5YW5hbiB3cm90ZToNCj4gDQo+IE9uIDQvMjMvMjAgODox
MSBBTSwgRGVycmljaywgSm9uYXRoYW4gd3JvdGU6DQo+ID4gSGkgU2F0aHlhbmFyYXlhbmFuLA0K
PiA+IA0KPiA+IE9uIFdlZCwgMjAyMC0wNC0yMiBhdCAxNTo1MCAtMDcwMCwgS3VwcHVzd2FteSwg
U2F0aHlhbmFyYXlhbmFuIHdyb3RlOg0KPiA+ID4gT24gNC8yMC8yMCAyOjM3IFBNLCBKb24gRGVy
cmljayB3cm90ZToNCj4gPiA+ID4gVGhlIGV4aXN0aW5nIHBvcnRkcnYgbW9kZWwgcHJldmVudHMg
RFBDIHNlcnZpY2VzIHdpdGhvdXQgZWl0aGVyIE9TDQo+ID4gPiA+IGNvbnRyb2wgKF9PU0MpIGdy
YW50ZWQgdG8gQUVSIHNlcnZpY2VzLCBhIEhvc3QgQnJpZGdlIHJlcXVlc3RpbmcgTmF0aXZlDQo+
ID4gPiA+IEFFUiwgb3IgdXNpbmcgb25lIG9mIHRoZSAncGNpZV9wb3J0cz0nIHBhcmFtZXRlcnMg
b2YgJ25hdGl2ZScgb3INCj4gPiA+ID4gJ2RwYy1uYXRpdmUnLg0KPiA+ID4gPiANCj4gPiA+ID4g
VGhlIERQQyBwb3J0IHNlcnZpY2UgZHJpdmVyIGl0c2VsZiB3aWxsIGFsc28gZmFpbCB0byBwcm9i
ZSBpZiB0aGUga2VybmVsDQo+ID4gPiA+IGFzc3VtZXMgdGhlIHBvcnQgaXMgdXNpbmcgRmlybXdh
cmUtRmlyc3QgQUVSLiBJdCdzIGEgcmVhc29uYWJsZQ0KPiA+ID4gPiBleHBlY3RhdGlvbiB0aGF0
IGEgcG9ydCB1c2luZyBGaXJtd2FyZS1GaXJzdCBBRVIgd2lsbCBhbHNvIGJlIHVzaW5nDQo+ID4g
PiA+IEZpcm13YXJlLUZpcnN0IERQQywgaG93ZXZlciBpZiBhIEhvc3QgQnJpZGdlIHJlcXVlc3Rz
IE5hdGl2ZSBEUEMsIHRoZQ0KPiA+ID4gPiBEUEMgZHJpdmVyIHNob3VsZCBhbGxvdyBpdCBhbmQg
bm90IGZhaWwgdG8gYmluZCBkdWUgdG8gQUVSIGNhcGFiaWxpdHkNCj4gPiA+ID4gc2V0dGluZ3Mu
DQo+ID4gPiA+IA0KPiA+ID4gPiBIb3N0IEJyaWRnZXMgd2hpY2ggcmVxdWVzdCBOYXRpdmUgRFBD
IHBvcnQgc2VydmljZXMgd2lsbCBhbHNvIGxpa2VseQ0KPiA+ID4gPiByZXF1ZXN0IE5hdGl2ZSBB
RVIsIGhvd2V2ZXIgaXQgc2hvdWxkbid0IGJlIGEgcmVxdWlyZW1lbnQuIFRoaXMgcGF0Y2gNCj4g
PiA+ID4gYWxsb3dzIHBvcnRzIG9uIHRob3NlIEhvc3QgQnJpZGdlcyB0byBoYXZlIERQQyBwb3J0
IHNlcnZpY2VzLg0KPiA+ID4gPiANCj4gPiA+ID4gVGhpcyB3aWxsIGF2b2lkIHRoZSB1bmxpa2Vs
eSBzaXR1YXRpb24gd2hlcmUgdGhlIHBvcnQgaXMgRmlybXdhcmUtRmlyc3QNCj4gPiA+ID4gQUVS
IGFuZCBOYXRpdmUgRFBDLCBhbmQgYSBCSU9TIG9yIHN3aXRjaCBmaXJtd2FyZSBwcmVjb25maWd1
cmF0aW9uIG9mDQo+ID4gPiA+IHRoZSBEUEMgdHJpZ2dlciBjb3VsZCByZXN1bHQgaW4gdW5oYW5k
bGVkIERQQyBldmVudHMuDQo+ID4gPiA+IA0KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBKb24gRGVy
cmljayA8am9uYXRoYW4uZGVycmlja0BpbnRlbC5jb20+DQo+ID4gPiA+IC0tLQ0KPiA+ID4gPiAg
ICBkcml2ZXJzL3BjaS9wY2llL2RwYy5jICAgICAgICAgIHwgMyArKy0NCj4gPiA+ID4gICAgZHJp
dmVycy9wY2kvcGNpZS9wb3J0ZHJ2X2NvcmUuYyB8IDMgKystDQo+ID4gPiA+ICAgIDIgZmlsZXMg
Y2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiA+ID4gPiANCj4gPiA+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGNpL3BjaWUvZHBjLmMgYi9kcml2ZXJzL3BjaS9wY2ll
L2RwYy5jDQo+ID4gPiA+IGluZGV4IDc2MjE3MDQuLjNmMzEwNmYgMTAwNjQ0DQo+ID4gPiA+IC0t
LSBhL2RyaXZlcnMvcGNpL3BjaWUvZHBjLmMNCj4gPiA+ID4gKysrIGIvZHJpdmVycy9wY2kvcGNp
ZS9kcGMuYw0KPiA+ID4gPiBAQCAtMjg0LDcgKzI4NCw4IEBAIHN0YXRpYyBpbnQgZHBjX3Byb2Jl
KHN0cnVjdCBwY2llX2RldmljZSAqZGV2KQ0KPiA+ID4gPiAgICAJaW50IHN0YXR1czsNCj4gPiA+
ID4gICAgCXUxNiBjdGwsIGNhcDsNCj4gPiA+ID4gICAgDQo+ID4gPiA+IC0JaWYgKHBjaWVfYWVy
X2dldF9maXJtd2FyZV9maXJzdChwZGV2KSAmJiAhcGNpZV9wb3J0c19kcGNfbmF0aXZlKQ0KPiA+
ID4gPiArCWlmIChwY2llX2Flcl9nZXRfZmlybXdhcmVfZmlyc3QocGRldikgJiYgIXBjaWVfcG9y
dHNfZHBjX25hdGl2ZSAmJg0KPiA+ID4gPiArCSAgICAhcGNpX2ZpbmRfaG9zdF9icmlkZ2UocGRl
di0+YnVzKS0+bmF0aXZlX2RwYykNCj4gPiA+IFdoeSBkbyBpdCBpbiBwcm9iZSBhcyB3ZWxsID8g
aWYgaG9zdC0+bmF0aXZlX2RwYyBpcyBub3Qgc2V0IHRoZW4gdGhlDQo+ID4gPiBkZXZpY2UgRFBD
IHByb2JlIGl0IHNlbGYgd29uJ3QgaGFwcGVuIHJpZ2h0ID8NCj4gPiANCj4gPiBQb3J0ZHJ2IG9u
bHkgZW5hYmxlcyB0aGUgaW50ZXJydXB0IGFuZCBhbGxvd3MgdGhlIHByb2JlIHRvIG9jY3VyLg0K
PiANCj4gUGxlYXNlIGNoZWNrIHRoZSBmb2xsb3dpbmcgc25pcHBldCBvZiBjb2RlIChmcm9tIHBv
cnRkcnZfY29yZS5jKS4NCj4gDQo+IElJVUMsIHBjaWVfZGV2aWNlX2luaXQoKSB3aWxsIG5vdCBi
ZSBjYWxsZWQgaWYgUENJRV9QT1JUX1NFUlZJQ0VfRFBDIGlzDQo+IG5vdCBzZXQgaW4gY2FwYWJp
bGl0aWVzLiBZb3VyIGNoYW5nZSBpbiBwb3J0ZHJ2X2NvcmUuYyBhbHJlYWR5DQo+IHNlbGVjdGl2
ZWx5IGVuYWJsZXMgdGhlIFBDSUVfUE9SVF9TRVJWSUNFX0RQQyBzZXJ2aWNlIGJhc2VkIG9uDQo+
IG5hdGl2ZV9kcGMgdmFsdWUuDQo+IA0KVGhhdCdzIHJpZ2h0LiBTbyBwY2llX2RldmljZV9pbml0
IHJlZ2lzdGVycyB0aGUgcG9ydCBzZXJ2aWNlIGRyaXZlcg0KYWxsb3dpbmcgdGhlIHNlcnZpY2Vz
IGVudW1lcmF0aW9uIHRvIG9jY3VyLg0KDQo+IFNvIElNTywgYWRkaW5nIG5hdGl2ZV9kcGMgY2hl
Y2sgaW4gZHBjX3Byb2JlKCkgaXMgcmVkdW5kYW50Lg0KPiANCj4gaW50IHBjaWVfcG9ydF9kZXZp
Y2VfcmVnaXN0ZXIoc3RydWN0IHBjaV9kZXYgKmRldikNCj4gCS8qIEFsbG9jYXRlIGNoaWxkIHNl
cnZpY2VzIGlmIGFueSAqLw0KPiAJc3RhdHVzID0gLUVOT0RFVjsNCj4gCW5yX3NlcnZpY2UgPSAw
Ow0KPiAJZm9yIChpID0gMDsgaSA8IFBDSUVfUE9SVF9ERVZJQ0VfTUFYU0VSVklDRVM7IGkrKykg
ew0KPiAJCWludCBzZXJ2aWNlID0gMSA8PCBpOw0KPiAJCWlmICghKGNhcGFiaWxpdGllcyAmIHNl
cnZpY2UpKQ0KPiAJCQljb250aW51ZTsNCj4gCQlpZiAoIXBjaWVfZGV2aWNlX2luaXQoZGV2LCBz
ZXJ2aWNlLCBpcnFzW2ldKSkNCj4gCQkJbnJfc2VydmljZSsrOw0KPiAJfQ0KPiANClRoaXMgaXMg
dGhlIHRyaWNreSBwYXJ0DQpUaGVyZSdzIHN0aWxsIGEgY2hlY2sgaW4gZHBjX3Byb2JlIGZvciBB
RVIgRkZTIG9yIHBjaWVfcG9ydHM9ZHBjLQ0KbmF0aXZlOg0KDQppZiAocGNpZV9hZXJfZ2V0X2Zp
cm13YXJlX2ZpcnN0KHBkZXYpICYmICFwY2llX3BvcnRzX2RwY19uYXRpdmUpDQoJcmV0dXJuIC1F
Tk9UU1VQUDsNCg0KT25lIG9wdGlvbiBpcyB0byBtb3ZlIHRoYXQgdG8gZ2V0X3BvcnRfZGV2aWNl
X2NhcGFiaWxpdHkgYW5kIHJlbW92ZSB0aGUNCmRwY19wcm9iZSBjaGVjaw0KDQo+ID4gVGhlIHBy
b2JlIGl0c2VsZiB3aWxsIHN0aWxsIGZhaWwgaWYgdGhlcmUncyBhIG1peGVkLW1vZGUgX09TQw0K
PiA+IG5lZ290aWF0ZWQgQUVSICYgRFBDLCBkdWUgdG8gcGNpZV9hZXJfZ2V0X2Zpcm13YXJlX2Zp
cnN0IHJldHVybmluZyAxDQo+ID4gZm9yIEFFUiBhbmQgbm8gY2hlY2sgZm9yIERQQy4NCj4gPiAN
Cj4gPiBJIGRvbid0IGtub3cgaWYgc3VjaCBhIHBsYXRmb3JtIHdpbGwgZXhpc3QsIGJ1dCB0aGUg
a2VybmVsIGlzIGFscmVhZHkNCj4gPiB3aXJlZCBmb3IgJ2RwYy1uYXRpdmUnIHNvIGl0IG1ha2Vz
IHNlbnNlIHRvIGV4dGVuZCBpdCBmb3IgdGhpcy4uDQo+ID4gDQo+ID4gVGhpcyB0cmFuc2Zvcm0g
bWlnaHQgYmUgbW9yZSByZWFkYWJsZToNCj4gPiAJaWYgKHBjaWVfYWVyX2dldF9maXJtd2FyZV9m
aXJzdChwZGV2KSAmJg0KPiA+IAkgICAgIShwY2llX3BvcnRzX2RwY19uYXRpdmUgfHwgaGItPm5h
dGl2ZV9kcGMpKQ0KPiA+IA0KPiA+IA0KPiA+IA0KPiA+ID4gPiAgICAJCXJldHVybiAtRU5PVFNV
UFA7DQo+ID4gPiA+ICAgIA0KPiA+ID4gPiAgICAJc3RhdHVzID0gZGV2bV9yZXF1ZXN0X3RocmVh
ZGVkX2lycShkZXZpY2UsIGRldi0+aXJxLCBkcGNfaXJxLA0KPiA+ID4gPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9wY2kvcGNpZS9wb3J0ZHJ2X2NvcmUuYyBiL2RyaXZlcnMvcGNpL3BjaWUvcG9ydGRy
dl9jb3JlLmMNCj4gPiA+ID4gaW5kZXggNTBhOTUyMi4uZjIxMzlhMSAxMDA2NDQNCj4gPiA+ID4g
LS0tIGEvZHJpdmVycy9wY2kvcGNpZS9wb3J0ZHJ2X2NvcmUuYw0KPiA+ID4gPiArKysgYi9kcml2
ZXJzL3BjaS9wY2llL3BvcnRkcnZfY29yZS5jDQo+ID4gPiA+IEBAIC0yNTYsNyArMjU2LDggQEAg
c3RhdGljIGludCBnZXRfcG9ydF9kZXZpY2VfY2FwYWJpbGl0eShzdHJ1Y3QgcGNpX2RldiAqZGV2
KQ0KPiA+ID4gPiAgICAJICovDQo+ID4gPiA+ICAgIAlpZiAocGNpX2ZpbmRfZXh0X2NhcGFiaWxp
dHkoZGV2LCBQQ0lfRVhUX0NBUF9JRF9EUEMpICYmDQo+ID4gPiA+ICAgIAkgICAgcGNpX2Flcl9h
dmFpbGFibGUoKSAmJg0KPiA+ID4gPiAtCSAgICAocGNpZV9wb3J0c19kcGNfbmF0aXZlIHx8IChz
ZXJ2aWNlcyAmIFBDSUVfUE9SVF9TRVJWSUNFX0FFUikpKQ0KPiA+ID4gPiArCSAgICAocGNpZV9w
b3J0c19kcGNfbmF0aXZlIHx8IGhvc3QtPm5hdGl2ZV9kcGMgfHwNCj4gPiA+ID4gKwkgICAgIChz
ZXJ2aWNlcyAmIFBDSUVfUE9SVF9TRVJWSUNFX0FFUikpKQ0KPiA+ID4gPiAgICAJCXNlcnZpY2Vz
IHw9IFBDSUVfUE9SVF9TRVJWSUNFX0RQQzsNCj4gPiA+ID4gICAgDQo+ID4gPiA+ICAgIAlpZiAo
cGNpX3BjaWVfdHlwZShkZXYpID09IFBDSV9FWFBfVFlQRV9ET1dOU1RSRUFNIHx8DQo+ID4gPiA+
IA0K
