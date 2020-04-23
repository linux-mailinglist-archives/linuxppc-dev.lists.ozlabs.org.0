Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5561B5FD0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Apr 2020 17:46:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 497M9G5HdTzDqLB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Apr 2020 01:46:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=jonathan.derrick@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 497LNm2SyLzDqd0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Apr 2020 01:11:19 +1000 (AEST)
IronPort-SDR: gTe3ggC8hEGKh/RKOGot+/UmrUA0sdZ7XwBkW/HEapRna3ZXgXZAFqoEp1EsHOB/73SORyxT0G
 fkH8myy6GyPw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2020 08:11:16 -0700
IronPort-SDR: 1jhfBXFrFWuz6CBqLI/R4z6G6fO9VBVZHvtWFo2hWncqCnf2JYI2aDRZyC1trtpfT6bqz1QlZc
 M3Yvq3BWxaww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,307,1583222400"; d="scan'208";a="244894681"
Received: from orsmsx106.amr.corp.intel.com ([10.22.225.133])
 by orsmga007.jf.intel.com with ESMTP; 23 Apr 2020 08:11:16 -0700
Received: from orsmsx101.amr.corp.intel.com ([169.254.8.204]) by
 ORSMSX106.amr.corp.intel.com ([169.254.1.150]) with mapi id 14.03.0439.000;
 Thu, 23 Apr 2020 08:11:15 -0700
From: "Derrick, Jonathan" <jonathan.derrick@intel.com>
To: "sathyanarayanan.kuppuswamy@linux.intel.com"
 <sathyanarayanan.kuppuswamy@linux.intel.com>, "helgaas@kernel.org"
 <helgaas@kernel.org>
Subject: Re: [PATCH v2 2/2] PCI/DPC: Allow Native DPC Host Bridges to use DPC
Thread-Topic: [PATCH v2 2/2] PCI/DPC: Allow Native DPC Host Bridges to use DPC
Thread-Index: AQHWF186KnXLsMWtVkCGO69asmmcQaiGN2OAgAESEwA=
Date: Thu, 23 Apr 2020 15:11:14 +0000
Message-ID: <ea21d9475b0af277c7288504ff2cd32b3f91e4ba.camel@intel.com>
References: <1587418630-13562-1-git-send-email-jonathan.derrick@intel.com>
 <1587418630-13562-3-git-send-email-jonathan.derrick@intel.com>
 <0058b993-0663-7fed-ed31-cb0adf845a39@linux.intel.com>
In-Reply-To: <0058b993-0663-7fed-ed31-cb0adf845a39@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.255.1.180]
Content-Type: text/plain; charset="utf-8"
Content-ID: <7AE62BCA59372E4DBE12A4448988D76D@intel.com>
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

SGkgU2F0aHlhbmFyYXlhbmFuLA0KDQpPbiBXZWQsIDIwMjAtMDQtMjIgYXQgMTU6NTAgLTA3MDAs
IEt1cHB1c3dhbXksIFNhdGh5YW5hcmF5YW5hbiB3cm90ZToNCj4gDQo+IE9uIDQvMjAvMjAgMjoz
NyBQTSwgSm9uIERlcnJpY2sgd3JvdGU6DQo+ID4gVGhlIGV4aXN0aW5nIHBvcnRkcnYgbW9kZWwg
cHJldmVudHMgRFBDIHNlcnZpY2VzIHdpdGhvdXQgZWl0aGVyIE9TDQo+ID4gY29udHJvbCAoX09T
QykgZ3JhbnRlZCB0byBBRVIgc2VydmljZXMsIGEgSG9zdCBCcmlkZ2UgcmVxdWVzdGluZyBOYXRp
dmUNCj4gPiBBRVIsIG9yIHVzaW5nIG9uZSBvZiB0aGUgJ3BjaWVfcG9ydHM9JyBwYXJhbWV0ZXJz
IG9mICduYXRpdmUnIG9yDQo+ID4gJ2RwYy1uYXRpdmUnLg0KPiA+IA0KPiA+IFRoZSBEUEMgcG9y
dCBzZXJ2aWNlIGRyaXZlciBpdHNlbGYgd2lsbCBhbHNvIGZhaWwgdG8gcHJvYmUgaWYgdGhlIGtl
cm5lbA0KPiA+IGFzc3VtZXMgdGhlIHBvcnQgaXMgdXNpbmcgRmlybXdhcmUtRmlyc3QgQUVSLiBJ
dCdzIGEgcmVhc29uYWJsZQ0KPiA+IGV4cGVjdGF0aW9uIHRoYXQgYSBwb3J0IHVzaW5nIEZpcm13
YXJlLUZpcnN0IEFFUiB3aWxsIGFsc28gYmUgdXNpbmcNCj4gPiBGaXJtd2FyZS1GaXJzdCBEUEMs
IGhvd2V2ZXIgaWYgYSBIb3N0IEJyaWRnZSByZXF1ZXN0cyBOYXRpdmUgRFBDLCB0aGUNCj4gPiBE
UEMgZHJpdmVyIHNob3VsZCBhbGxvdyBpdCBhbmQgbm90IGZhaWwgdG8gYmluZCBkdWUgdG8gQUVS
IGNhcGFiaWxpdHkNCj4gPiBzZXR0aW5ncy4NCj4gPiANCj4gPiBIb3N0IEJyaWRnZXMgd2hpY2gg
cmVxdWVzdCBOYXRpdmUgRFBDIHBvcnQgc2VydmljZXMgd2lsbCBhbHNvIGxpa2VseQ0KPiA+IHJl
cXVlc3QgTmF0aXZlIEFFUiwgaG93ZXZlciBpdCBzaG91bGRuJ3QgYmUgYSByZXF1aXJlbWVudC4g
VGhpcyBwYXRjaA0KPiA+IGFsbG93cyBwb3J0cyBvbiB0aG9zZSBIb3N0IEJyaWRnZXMgdG8gaGF2
ZSBEUEMgcG9ydCBzZXJ2aWNlcy4NCj4gPiANCj4gPiBUaGlzIHdpbGwgYXZvaWQgdGhlIHVubGlr
ZWx5IHNpdHVhdGlvbiB3aGVyZSB0aGUgcG9ydCBpcyBGaXJtd2FyZS1GaXJzdA0KPiA+IEFFUiBh
bmQgTmF0aXZlIERQQywgYW5kIGEgQklPUyBvciBzd2l0Y2ggZmlybXdhcmUgcHJlY29uZmlndXJh
dGlvbiBvZg0KPiA+IHRoZSBEUEMgdHJpZ2dlciBjb3VsZCByZXN1bHQgaW4gdW5oYW5kbGVkIERQ
QyBldmVudHMuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogSm9uIERlcnJpY2sgPGpvbmF0aGFu
LmRlcnJpY2tAaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+ICAgZHJpdmVycy9wY2kvcGNpZS9kcGMu
YyAgICAgICAgICB8IDMgKystDQo+ID4gICBkcml2ZXJzL3BjaS9wY2llL3BvcnRkcnZfY29yZS5j
IHwgMyArKy0NCj4gPiAgIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BjaS9wY2llL2RwYy5jIGIv
ZHJpdmVycy9wY2kvcGNpZS9kcGMuYw0KPiA+IGluZGV4IDc2MjE3MDQuLjNmMzEwNmYgMTAwNjQ0
DQo+ID4gLS0tIGEvZHJpdmVycy9wY2kvcGNpZS9kcGMuYw0KPiA+ICsrKyBiL2RyaXZlcnMvcGNp
L3BjaWUvZHBjLmMNCj4gPiBAQCAtMjg0LDcgKzI4NCw4IEBAIHN0YXRpYyBpbnQgZHBjX3Byb2Jl
KHN0cnVjdCBwY2llX2RldmljZSAqZGV2KQ0KPiA+ICAgCWludCBzdGF0dXM7DQo+ID4gICAJdTE2
IGN0bCwgY2FwOw0KPiA+ICAgDQo+ID4gLQlpZiAocGNpZV9hZXJfZ2V0X2Zpcm13YXJlX2ZpcnN0
KHBkZXYpICYmICFwY2llX3BvcnRzX2RwY19uYXRpdmUpDQo+ID4gKwlpZiAocGNpZV9hZXJfZ2V0
X2Zpcm13YXJlX2ZpcnN0KHBkZXYpICYmICFwY2llX3BvcnRzX2RwY19uYXRpdmUgJiYNCj4gPiAr
CSAgICAhcGNpX2ZpbmRfaG9zdF9icmlkZ2UocGRldi0+YnVzKS0+bmF0aXZlX2RwYykNCj4gV2h5
IGRvIGl0IGluIHByb2JlIGFzIHdlbGwgPyBpZiBob3N0LT5uYXRpdmVfZHBjIGlzIG5vdCBzZXQg
dGhlbiB0aGUNCj4gZGV2aWNlIERQQyBwcm9iZSBpdCBzZWxmIHdvbid0IGhhcHBlbiByaWdodCA/
DQoNClBvcnRkcnYgb25seSBlbmFibGVzIHRoZSBpbnRlcnJ1cHQgYW5kIGFsbG93cyB0aGUgcHJv
YmUgdG8gb2NjdXIuDQoNClRoZSBwcm9iZSBpdHNlbGYgd2lsbCBzdGlsbCBmYWlsIGlmIHRoZXJl
J3MgYSBtaXhlZC1tb2RlIF9PU0MNCm5lZ290aWF0ZWQgQUVSICYgRFBDLCBkdWUgdG8gcGNpZV9h
ZXJfZ2V0X2Zpcm13YXJlX2ZpcnN0IHJldHVybmluZyAxDQpmb3IgQUVSIGFuZCBubyBjaGVjayBm
b3IgRFBDLg0KDQpJIGRvbid0IGtub3cgaWYgc3VjaCBhIHBsYXRmb3JtIHdpbGwgZXhpc3QsIGJ1
dCB0aGUga2VybmVsIGlzIGFscmVhZHkNCndpcmVkIGZvciAnZHBjLW5hdGl2ZScgc28gaXQgbWFr
ZXMgc2Vuc2UgdG8gZXh0ZW5kIGl0IGZvciB0aGlzLi4NCg0KVGhpcyB0cmFuc2Zvcm0gbWlnaHQg
YmUgbW9yZSByZWFkYWJsZToNCglpZiAocGNpZV9hZXJfZ2V0X2Zpcm13YXJlX2ZpcnN0KHBkZXYp
ICYmDQoJICAgICEocGNpZV9wb3J0c19kcGNfbmF0aXZlIHx8IGhiLT5uYXRpdmVfZHBjKSkNCg0K
DQoNCj4gPiAgIAkJcmV0dXJuIC1FTk9UU1VQUDsNCj4gPiAgIA0KPiA+ICAgCXN0YXR1cyA9IGRl
dm1fcmVxdWVzdF90aHJlYWRlZF9pcnEoZGV2aWNlLCBkZXYtPmlycSwgZHBjX2lycSwNCj4gPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9wY2kvcGNpZS9wb3J0ZHJ2X2NvcmUuYyBiL2RyaXZlcnMvcGNp
L3BjaWUvcG9ydGRydl9jb3JlLmMNCj4gPiBpbmRleCA1MGE5NTIyLi5mMjEzOWExIDEwMDY0NA0K
PiA+IC0tLSBhL2RyaXZlcnMvcGNpL3BjaWUvcG9ydGRydl9jb3JlLmMNCj4gPiArKysgYi9kcml2
ZXJzL3BjaS9wY2llL3BvcnRkcnZfY29yZS5jDQo+ID4gQEAgLTI1Niw3ICsyNTYsOCBAQCBzdGF0
aWMgaW50IGdldF9wb3J0X2RldmljZV9jYXBhYmlsaXR5KHN0cnVjdCBwY2lfZGV2ICpkZXYpDQo+
ID4gICAJICovDQo+ID4gICAJaWYgKHBjaV9maW5kX2V4dF9jYXBhYmlsaXR5KGRldiwgUENJX0VY
VF9DQVBfSURfRFBDKSAmJg0KPiA+ICAgCSAgICBwY2lfYWVyX2F2YWlsYWJsZSgpICYmDQo+ID4g
LQkgICAgKHBjaWVfcG9ydHNfZHBjX25hdGl2ZSB8fCAoc2VydmljZXMgJiBQQ0lFX1BPUlRfU0VS
VklDRV9BRVIpKSkNCj4gPiArCSAgICAocGNpZV9wb3J0c19kcGNfbmF0aXZlIHx8IGhvc3QtPm5h
dGl2ZV9kcGMgfHwNCj4gPiArCSAgICAgKHNlcnZpY2VzICYgUENJRV9QT1JUX1NFUlZJQ0VfQUVS
KSkpDQo+ID4gICAJCXNlcnZpY2VzIHw9IFBDSUVfUE9SVF9TRVJWSUNFX0RQQzsNCj4gPiAgIA0K
PiA+ICAgCWlmIChwY2lfcGNpZV90eXBlKGRldikgPT0gUENJX0VYUF9UWVBFX0RPV05TVFJFQU0g
fHwNCj4gPiANCg==
