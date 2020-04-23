Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CC80F1B5FB0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Apr 2020 17:41:55 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 497M401XzgzDqLW
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Apr 2020 01:41:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=jonathan.derrick@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 497LNh5FrZzDqcl
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Apr 2020 01:11:13 +1000 (AEST)
IronPort-SDR: aHJscTHfSpceSVeT4ano0mkItNwL9ZdgFbibGRHnqsXqSBusqFStxtcr9f04Hy+nJwi8wpmpFk
 wm/oz26evUfQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2020 08:11:09 -0700
IronPort-SDR: QnRayIgAKGfmlnKTyhzY0L+WOqM8WoAEe0d9ufajWMtOqpIEB4qpTwFsjukQ9c+jzp2creFDI1
 y6YovfyU61ZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,307,1583222400"; d="scan'208";a="456942526"
Received: from orsmsx104.amr.corp.intel.com ([10.22.225.131])
 by fmsmga005.fm.intel.com with ESMTP; 23 Apr 2020 08:11:08 -0700
Received: from orsmsx101.amr.corp.intel.com ([169.254.8.204]) by
 ORSMSX104.amr.corp.intel.com ([169.254.4.76]) with mapi id 14.03.0439.000;
 Thu, 23 Apr 2020 08:11:07 -0700
From: "Derrick, Jonathan" <jonathan.derrick@intel.com>
To: "sathyanarayanan.kuppuswamy@linux.intel.com"
 <sathyanarayanan.kuppuswamy@linux.intel.com>, "helgaas@kernel.org"
 <helgaas@kernel.org>
Subject: Re: [PATCH v2 1/2] PCI/AER: Allow Native AER Host Bridges to use AER
Thread-Topic: [PATCH v2 1/2] PCI/AER: Allow Native AER Host Bridges to use AER
Thread-Index: AQHWF186RsEJQYVN9kSvtTlNVZfJFaiGNtcAgAESlIA=
Date: Thu, 23 Apr 2020 15:11:06 +0000
Message-ID: <4f044eca9f9f4cfc413c850046112b870e85e8d7.camel@intel.com>
References: <1587418630-13562-1-git-send-email-jonathan.derrick@intel.com>
 <1587418630-13562-2-git-send-email-jonathan.derrick@intel.com>
 <9f8c2a62-e67d-2869-db11-4644b69815f4@linux.intel.com>
In-Reply-To: <9f8c2a62-e67d-2869-db11-4644b69815f4@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.255.1.180]
Content-Type: text/plain; charset="utf-8"
Content-ID: <58623EF43F5A224F8FEED983CF0887B6@intel.com>
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

SGkgU2F0aHlhbmFyYXlhbmFuLA0KDQpPbiBXZWQsIDIwMjAtMDQtMjIgYXQgMTU6NDggLTA3MDAs
IEt1cHB1c3dhbXksIFNhdGh5YW5hcmF5YW5hbiB3cm90ZToNCj4gDQo+IE9uIDQvMjAvMjAgMjoz
NyBQTSwgSm9uIERlcnJpY2sgd3JvdGU6DQo+ID4gU29tZSBwbGF0Zm9ybXMgaGF2ZSBhIG1peCBv
ZiBwb3J0cyB3aG9zZSBjYXBhYmlsaXRpZXMgY2FuIGJlIG5lZ290aWF0ZWQNCj4gPiBieSBfT1ND
LCBhbmQgc29tZSBwb3J0cyB3aGljaCBhcmUgbm90IGRlc2NyaWJlZCBieSBBQ1BJIGFuZCBpbnN0
ZWFkDQo+ID4gbWFuYWdlZCBieSBOYXRpdmUgZHJpdmVycy4gVGhlIGV4aXN0aW5nIEZpcm13YXJl
LUZpcnN0IEhFU1QgbW9kZWwgY2FuDQo+ID4gaW5jb3JyZWN0bHkgdGFnIHRoZXNlIE5hdGl2ZSwg
Tm9uLUFDUEkgcG9ydHMgYXMgRmlybXdhcmUtRmlyc3QgbWFuYWdlZA0KPiA+IHBvcnRzIGJ5IGFk
dmVydGlzaW5nIHRoZSBIRVNUIEdsb2JhbCBGbGFnIGFuZCBtYXRjaGluZyB0aGUgdHlwZSBhbmQN
Cj4gPiBjbGFzcyBvZiB0aGUgcG9ydCAoYWVyX2hlc3RfcGFyc2UpLg0KPiBJcyB0aGVyZSBhIHJl
YWwgdXNlIGNhc2UgZm9yIG1peGVkIG1vZGUgKG9uZSBob3N0IGJyaWRnZSBpbiBGRiBtb2RlIGFu
ZA0KPiBhbm90aGVyIGluIG5hdGl2ZSk/DQoNCkludGVsJ3MgVk1EIGV4cG9zZXMgUENJZSBzZWdt
ZW50cyBjb250YWluaW5nIFJvb3QgUG9ydHMgYW5kIEJyaWRnZXMgYW5kDQpvdGhlciBEUEMgY29u
c3VtZXJzLiBUaGVzZSBleHRyYSBQQ0llIGRvbWFpbnMgYXJlbid0IGRlc2NyaWJlZCBieSBBQ1BJ
Lg0KVGhlcmUgaGF2ZSBiZWVuIGEgZmV3IHZlcnNpb25zIHdoZXJlIERQQyB3b24ndCBiaW5kIGR1
ZSB0byBwbGF0Zm9ybSdzDQpIRVNUIGNvbmZpZ3VyYXRpb24uDQoNCj4gPiBJZiB0aGUgcG9ydCBy
ZXF1ZXN0cyBOYXRpdmUgQUVSIHRocm91Z2ggdGhlIEhvc3QgQnJpZGdlJ3MgY2FwYWJpbGl0eQ0K
PiA+IHNldHRpbmdzLCB0aGUgQUVSIGRyaXZlciBzaG91bGQgaG9ub3IgdGhvc2Ugc2V0dGluZ3Mg
YW5kIGFsbG93IHRoZSBwb3J0DQo+ID4gdG8gYmluZC4gVGhpcyBwYXRjaCBjaGFuZ2VzIHRoZSBk
ZWZpbml0aW9uIG9mIEZpcm13YXJlLUZpcnN0IHRvIGV4Y2x1ZGUNCj4gPiBwb3J0cyB3aG9zZSBI
b3N0IEJyaWRnZXMgcmVxdWVzdCBOYXRpdmUgQUVSLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6
IEpvbiBEZXJyaWNrIDxqb25hdGhhbi5kZXJyaWNrQGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiAg
IGRyaXZlcnMvcGNpL3BjaWUvYWVyLmMgfCAzICsrKw0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDMg
aW5zZXJ0aW9ucygrKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BjaS9wY2llL2Fl
ci5jIGIvZHJpdmVycy9wY2kvcGNpZS9hZXIuYw0KPiA+IGluZGV4IGY0Mjc0ZDMuLjMwZmJkMWYg
MTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9wY2kvcGNpZS9hZXIuYw0KPiA+ICsrKyBiL2RyaXZl
cnMvcGNpL3BjaWUvYWVyLmMNCj4gPiBAQCAtMzE0LDYgKzMxNCw5IEBAIGludCBwY2llX2Flcl9n
ZXRfZmlybXdhcmVfZmlyc3Qoc3RydWN0IHBjaV9kZXYgKmRldikNCj4gPiAgIAlpZiAocGNpZV9w
b3J0c19uYXRpdmUpDQo+ID4gICAJCXJldHVybiAwOw0KPiA+ICAgDQo+ID4gKwlpZiAocGNpX2Zp
bmRfaG9zdF9icmlkZ2UoZGV2LT5idXMpLT5uYXRpdmVfYWVyKQ0KPiA+ICsJCXJldHVybiAwOw0K
PiA+ICsNCj4gPiAgIAlpZiAoIWRldi0+X19hZXJfZmlybXdhcmVfZmlyc3RfdmFsaWQpDQo+ID4g
ICAJCWFlcl9zZXRfZmlybXdhcmVfZmlyc3QoZGV2KTsNCj4gPiAgIAlyZXR1cm4gZGV2LT5fX2Fl
cl9maXJtd2FyZV9maXJzdDsNCj4gPiANCg==
