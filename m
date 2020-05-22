Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1341DEE2A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 May 2020 19:25:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49TD003wx0zDqcJ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 May 2020 03:25:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=jonathan.derrick@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49TCy948VnzDqT4
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 May 2020 03:23:36 +1000 (AEST)
IronPort-SDR: j4Lwg2CqdRQTRjl5YLf5yV9hfR8txvLQ01GzF1t03Dlzaal1/dTL+G03Swk4c961ni/vIUUQva
 VQXpwr5r6lJA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2020 10:23:32 -0700
IronPort-SDR: j3v/pPAQWI6QU1Gah9EyGZ4ZxdEKBHyLmGDbojUsJmTtt6tHZofevOFQPCrruAbhpGXKl/YAnb
 o3dLOcqwJnlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,422,1583222400"; d="scan'208";a="269064813"
Received: from orsmsx110.amr.corp.intel.com ([10.22.240.8])
 by orsmga006.jf.intel.com with ESMTP; 22 May 2020 10:23:32 -0700
Received: from orsmsx111.amr.corp.intel.com (10.22.240.12) by
 ORSMSX110.amr.corp.intel.com (10.22.240.8) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Fri, 22 May 2020 10:23:32 -0700
Received: from orsmsx101.amr.corp.intel.com ([169.254.8.250]) by
 ORSMSX111.amr.corp.intel.com ([169.254.12.250]) with mapi id 14.03.0439.000;
 Fri, 22 May 2020 10:23:32 -0700
From: "Derrick, Jonathan" <jonathan.derrick@intel.com>
To: "helgaas@kernel.org" <helgaas@kernel.org>
Subject: Re: [PATCH v3 0/2] PCI/ERR: Allow Native AER/DPC using _OSC
Thread-Topic: [PATCH v3 0/2] PCI/ERR: Allow Native AER/DPC using _OSC
Thread-Index: AQHWHyGBlj2gvaBx5UuW2XC3HoapYaiT766AgAAFJ4CAIP2pgA==
Date: Fri, 22 May 2020 17:23:31 +0000
Message-ID: <bbd1e71fc069389b96351490881fe43c4a5cb25f.camel@intel.com>
References: <20200501171649.GA116404@bjorn-Precision-5520>
 <518c3348c4b4a8b5fed6a42ad190771f7f9645f3.camel@intel.com>
In-Reply-To: <518c3348c4b4a8b5fed6a42ad190771f7f9645f3.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.209.144.243]
Content-Type: text/plain; charset="utf-8"
Content-ID: <783570428C2DC34EBB4A5C88FEDCF6E1@intel.com>
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
Cc: "sathyanarayanan.kuppuswamy@linux.intel.com"
 <sathyanarayanan.kuppuswamy@linux.intel.com>, "Patel,
 Mayurkumar" <mayurkumar.patel@intel.com>,
 "fred@fredlawl.com" <fred@fredlawl.com>,
 "sbobroff@linux.ibm.com" <sbobroff@linux.ibm.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "Wysocki, 
 Rafael J" <rafael.j.wysocki@intel.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "oohall@gmail.com" <oohall@gmail.com>, "olof@lixom.net" <olof@lixom.net>,
 "rajatja@google.com" <rajatja@google.com>,
 "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gRnJpLCAyMDIwLTA1LTAxIGF0IDExOjM1IC0wNjAwLCBKb25hdGhhbiBEZXJyaWNrIHdyb3Rl
Og0KPiBPbiBGcmksIDIwMjAtMDUtMDEgYXQgMTI6MTYgLTA1MDAsIEJqb3JuIEhlbGdhYXMgd3Jv
dGU6DQo+ID4gT24gVGh1LCBBcHIgMzAsIDIwMjAgYXQgMTI6NDY6MDdQTSAtMDYwMCwgSm9uIERl
cnJpY2sgd3JvdGU6DQo+ID4gPiBIaSBCam9ybiAmIEt1cHB1c3dhbXksDQo+ID4gPiANCj4gPiA+
IEkgc2VlIGEgcHJvYmxlbSBpbiB0aGUgRFBDIEVDTiBbMV0gdG8gX09TQyBpbiB0aGF0IGl0IGRv
ZXNuJ3QgZ2l2ZSB1cyBhIHdheSB0bw0KPiA+ID4gZGV0ZXJtaW5lIGlmIGZpcm13YXJlIHN1cHBv
cnRzIF9PU0MgRFBDIG5lZ290YXRpb24sIGFuZCB0aGVyZWZvcmUgaG93IHRvIGhhbmRsZQ0KPiA+
ID4gRFBDLg0KPiA+ID4gDQo+ID4gPiBIZXJlIGlzIHRoZSB3b3JkaW5nIG9mIHRoZSBFQ04gdGhh
dCBpbXBsaWVzIHRoYXQgRmlybXdhcmUgd2l0aG91dCBfT1NDIERQQw0KPiA+ID4gbmVnb3RpYXRp
b24gc3VwcG9ydCBzaG91bGQgaGF2ZSB0aGUgT1NQTSByZWx5IG9uIF9PU0MgQUVSIG5lZ290aWF0
aW9uIHdoZW4NCj4gPiA+IGRldGVybWluaW5nIERQQyBjb250cm9sOg0KPiA+ID4gDQo+ID4gPiAg
IFBDSWUgQmFzZSBTcGVjaWZpY2F0aW9uIHN1Z2dlc3RzIHRoYXQgRG93bnN0cmVhbSBQb3J0IENv
bnRhaW5tZW50IG1heSBiZQ0KPiA+ID4gICBjb250cm9sbGVkIGVpdGhlciBieSB0aGUgRmlybXdh
cmUgb3IgdGhlIE9wZXJhdGluZyBTeXN0ZW0uIEl0IGFsc28gc3VnZ2VzdHMNCj4gPiA+ICAgdGhh
dCB0aGUgRmlybXdhcmUgcmV0YWluIG93bmVyc2hpcCBvZiBEb3duc3RyZWFtIFBvcnQgQ29udGFp
bm1lbnQgaWYgaXQgYWxzbw0KPiA+ID4gICBvd25zIEFFUi4gV2hlbiB0aGUgRmlybXdhcmUgb3du
cyBEb3duc3RyZWFtIFBvcnQgQ29udGFpbm1lbnQsIGl0IGlzIGV4cGVjdGVkDQo+ID4gPiAgIHRv
IHVzZSB0aGUgbmV3ICJFcnJvciBEaXNjb25uZWN0IFJlY292ZXIiIG5vdGlmaWNhdGlvbiB0byBh
bGVydCBPU1BNIG9mIGENCj4gPiA+ICAgRG93bnN0cmVhbSBQb3J0IENvbnRhaW5tZW50IGV2ZW50
Lg0KPiA+ID4gDQo+ID4gPiBJbiBsZWdhY3kgcGxhdGZvcm1zLCBhcyBiaXRzIGluIF9PU0MgYXJl
IHJlc2VydmVkIHByaW9yIHRvIGltcGxlbWVudGF0aW9uLCBBQ1BJDQo+ID4gPiBSb290IEJ1cyBl
bnVtZXJhdGlvbiB3aWxsIG1hcmsgdGhlc2UgSG9zdCBCcmlkZ2VzIGFzIHdpdGhvdXQgTmF0aXZl
IERQQw0KPiA+ID4gc3VwcG9ydCwgZXZlbiB0aG91Z2ggdGhlIHNwZWNpZmljYXRpb24gaW1wbGll
cyBpdCdzIGV4cGVjdGVkIHRoYXQgQUVSIF9PU0MNCj4gPiA+IG5lZ290aWF0aW9uIGRldGVybWlu
ZXMgRFBDIGNvbnRyb2wgZm9yIHRoZXNlIHBsYXRmb3Jtcy4gVGhlcmUgc2VlbXMgdG8gYmUgYQ0K
PiA+ID4gbmVlZCBmb3IgYSB3YXkgdG8gZGV0ZXJtaW5lIGlmIHRoZSBEUEMgY29udHJvbCBiaXQg
aW4gX09TQyBpcyBzdXBwb3J0ZWQgYW5kDQo+ID4gPiBmYWxsYmFjayBvbiBBRVIgb3RoZXJ3aXNl
Lg0KPiA+ID4gDQo+ID4gPiANCj4gPiA+IEN1cnJlbnRseSBwb3J0ZHJ2IGFzc3VtZXMgRFBDIGNv
bnRyb2wgaWYgdGhlIHBvcnQgaGFzIE5hdGl2ZSBBRVIgc2VydmljZXM6DQo+ID4gPiANCj4gPiA+
IHN0YXRpYyBpbnQgZ2V0X3BvcnRfZGV2aWNlX2NhcGFiaWxpdHkoc3RydWN0IHBjaV9kZXYgKmRl
dikNCj4gPiA+IC4uLg0KPiA+ID4gCWlmIChwY2lfZmluZF9leHRfY2FwYWJpbGl0eShkZXYsIFBD
SV9FWFRfQ0FQX0lEX0RQQykgJiYNCj4gPiA+IAkgICAgcGNpX2Flcl9hdmFpbGFibGUoKSAmJg0K
PiA+ID4gCSAgICAocGNpZV9wb3J0c19kcGNfbmF0aXZlIHx8IChzZXJ2aWNlcyAmIFBDSUVfUE9S
VF9TRVJWSUNFX0FFUikpKQ0KPiA+ID4gCQlzZXJ2aWNlcyB8PSBQQ0lFX1BPUlRfU0VSVklDRV9E
UEM7DQo+ID4gPiANCj4gPiA+IE5ld2VyIGZpcm13YXJlIG1heSBub3QgZ3JhbnQgT1NQTSBEUEMg
Y29udHJvbCwgaWYgZm9yIGluc3RhbmNlLCBpdCBleHBlY3RzIHRvDQo+ID4gPiB1c2UgRXJyb3Ig
RGlzY29ubmVjdCBSZWNvdmVyeS4gSG93ZXZlciBpdCBsb29rcyBsaWtlIEFDUEkgd2lsbCB1c2Ug
RFBDIHNlcnZpY2VzDQo+ID4gPiB2aWEgdGhlIEVEUiBkcml2ZXIsIHdpdGhvdXQgYmluZGluZyB0
aGUgZnVsbCBEUEMgcG9ydCBzZXJ2aWNlIGRyaXZlci4NCj4gPiA+IA0KPiA+ID4gDQo+ID4gPiBJ
ZiB3ZSBjaGFuZ2UgcG9ydGRydiB0byBwcm9iZSBiYXNlZCBvbiBob3N0LT5uYXRpdmVfZHBjIGFu
ZCBub3QgQUVSLCB0aGVuIHdlDQo+ID4gPiBicmVhayBpbnN0YW5jZXMgd2l0aCBsZWdhY3kgZmly
bXdhcmUgd2hlcmUgT1NQTSB3aWxsIGNsZWFyIGhvc3QtPm5hdGl2ZV9kcGMNCj4gPiA+IHNvbGVs
eSBkdWUgdG8gX09TQyBiaXRzIGJlaW5nIHJlc2VydmVkOg0KPiA+ID4gDQo+ID4gPiBzdHJ1Y3Qg
cGNpX2J1cyAqYWNwaV9wY2lfcm9vdF9jcmVhdGUoc3RydWN0IGFjcGlfcGNpX3Jvb3QgKnJvb3Qs
DQo+ID4gPiAuLi4NCj4gPiA+IAlpZiAoIShyb290LT5vc2NfY29udHJvbF9zZXQgJiBPU0NfUENJ
X0VYUFJFU1NfRFBDX0NPTlRST0wpKQ0KPiA+ID4gCQlob3N0X2JyaWRnZS0+bmF0aXZlX2RwYyA9
IDA7DQo+ID4gPiANCj4gPiA+IA0KPiA+ID4gDQo+ID4gPiBTbyBteSBhc3N1bXB0aW9uIGluc3Rl
YWQgaXMgdGhhdCBob3N0LT5uYXRpdmVfZHBjIGNhbiBiZSAwIGFuZCBleHBlY3QgTmF0aXZlDQo+
ID4gPiBEUEMgc2VydmljZXMgaWYgQUVSIGlzIHVzZWQuIEluIG90aGVyIHdvcmRzLCBpZiBhbmQg
b25seSBpZiBEUEMgcHJvYmUgaXMNCj4gPiA+IGludm9rZWQgZnJvbSBwb3J0ZHJ2LCB0aGVuIGl0
IG5lZWRzIHRvIHJlbHkgb24gdGhlIEFFUiBkZXBlbmRlbmN5LiBPdGhlcndpc2UgaXQNCj4gPiA+
IHNob3VsZCBiZSBhc3N1bWVkIHRoYXQgQUNQSSBzZXQgdXAgRFBDIHZpYSBFRFIuIFRoaXMgY292
ZXJzIGxlZ2FjeSBmaXJtd2FyZS4NCj4gPiA+IA0KPiA+ID4gSG93ZXZlciBpdCBzZWVtcyBsaWtl
IHRoYXQgY291bGQgYmUgdHJvdWJsZSB3aXRoIG5ld2VyIGZpcm13YXJlIHRoYXQgbWlnaHQgZ2l2
ZQ0KPiA+ID4gT1NQTSBjb250cm9sIG9mIEFFUiBidXQgbm90IERQQywgYW5kIHdvdWxkIHJlc3Vs
dCBpbiBib3RoIE5hdGl2ZSBEUEMgYW5kIEVEUg0KPiA+ID4gYmVpbmcgaW4gZWZmZWN0Lg0KPiA+
ID4gDQo+ID4gPiANCj4gPiA+IEFueXdheXMgaGVyZSBhcmUgdHdvIHBhdGNoZXMgdGhhdCBnaXZl
IGNvbnRyb2wgb2YgQUVSIGFuZCBEUEMgb24gdGhlIHJlc3VsdHMgb2YNCj4gPiA+IF9PU0MuIFRo
ZXkgZG9uJ3QgbWVzcyB3aXRoIHRoZSBIRVNUIHBhcnNlciBhcyBJIGV4cGVjdCB0aG9zZSB0byBi
ZSByZW1vdmVkIGF0DQo+ID4gPiBzb21lIHBvaW50LiBJIG5lZWQgdGhlc2UgZm9yIFZNRCBzdXBw
b3J0IHdoaWNoIGRvZXNuJ3QgZXZlbiByZWx5IG9uIF9PU0MsIGJ1dCBJDQo+ID4gPiBzdXNwZWN0
IHRoaXMgd29uJ3QgYmUgdGhlIGxhc3QgZWZmb3J0IGFzIHdlIGRldGFuZ2xlIEZpcm13YXJlIEZp
cnN0Lg0KPiA+ID4gDQo+ID4gPiBbMV0gaHR0cHM6Ly9tZW1iZXJzLnBjaXNpZy5jb20vd2cvUENJ
LVNJRy9kb2N1bWVudC8xMjg4OA0KPiA+IA0KPiA+IEhpIEpvbiwgSSB0aGluayB3ZSBuZWVkIHRv
IHNvcnQgb3V0IHRoZSBfT1NDL0ZJUk1XQVJFX0ZJUlNUIHBhdGNoZXMNCj4gPiBmcm9tIEFsZXgg
YW5kIFNhdGh5IGZpcnN0LCB0aGVuIHNlZSB3aGF0IG5lZWRzIHRvIGJlIGRvbmUgb24gdG9wIG9m
DQo+ID4gdGhvc2UsIHNvIEknbSBnb2luZyB0byBwdXNoIHRoZXNlIG9mZiBmb3IgYSBmZXcgZGF5
cyBhbmQgdGhleSdsbA0KPiA+IHByb2JhYmx5IG5lZWQgYSByZWZyZXNoLg0KPiA+IA0KPiA+IEJq
b3JuDQo+IA0KPiBBZ3JlZWQsIG5vIG5lZWQgdG8gbWVyZ2Ugbm93LiBKdXN0IHdhbnRlZCB0byBi
cmluZyB1cCB0aGUgRFBDDQo+IGFtYmlndWl0eSwgd2hpY2ggSSB0aGluayB3YXMgZmlyc3QgYWRk
cmVzc2VkIGJ5IGRwYy1uYXRpdmU6DQo+IA0KPiBjb21taXQgMzVhMGIyMzc4YzE5OWQ0ZjI2ZTQ1
OGIyY2EzOGVhNTZhYWYyZDliOA0KPiBBdXRob3I6IE9sb2YgSm9oYW5zc29uIDxvbG9mQGxpeG9t
Lm5ldD4NCj4gRGF0ZTogICBXZWQgT2N0IDIzIDEyOjIyOjA1IDIwMTkgLTA3MDANCj4gDQo+ICAg
ICBQQ0kvRFBDOiBBZGQgInBjaWVfcG9ydHM9ZHBjLW5hdGl2ZSIgdG8gYWxsb3cgRFBDIHdpdGhv
dXQgQUVSIGNvbnRyb2wNCj4gICAgIA0KPiAgICAgUHJpb3IgdG8gZWVkODVmZjRjMGRhNyAoIlBD
SS9EUEM6IEVuYWJsZSBEUEMgb25seSBpZiBBRVIgaXMgYXZhaWxhYmxlIiksDQo+ICAgICBMaW51
eCBoYW5kbGVkIERQQyBldmVudHMgcmVnYXJkbGVzcyBvZiB3aGV0aGVyIGZpcm13YXJlIGhhZCBn
cmFudGVkIGl0DQo+ICAgICBvd25lcnNoaXAgb2YgQUVSIG9yIERQQywgZS5nLiwgdmlhIF9PU0Mu
DQo+ICAgICANCj4gICAgIFBDSWUgcjUuMCwgc2VjIDYuMi4xMCwgcmVjb21tZW5kcyB0aGF0IHRo
ZSBPUyBsaW5rIGNvbnRyb2wgb2YgRFBDIHRvDQo+ICAgICBjb250cm9sIG9mIEFFUiwgc28gYWZ0
ZXIgZWVkODVmZjRjMGRhNywgTGludXggaGFuZGxlcyBEUEMgZXZlbnRzIG9ubHkgaWYgaXQNCj4g
ICAgIGhhcyBjb250cm9sIG9mIEFFUi4NCj4gICAgIA0KPiAgICAgT24gcGxhdGZvcm1zIHRoYXQg
ZG8gbm90IGdyYW50IE9TIGNvbnRyb2wgb2YgQUVSIHZpYSBfT1NDLCBMaW51eCBEUEMNCj4gICAg
IGhhbmRsaW5nIHdvcmtlZCBiZWZvcmUgZWVkODVmZjRjMGRhNyBidXQgbm90IGFmdGVyLg0KPiAg
ICAgDQo+ICAgICBUbyBtYWtlIExpbnV4IERQQyBoYW5kbGluZyB3b3JrIG9uIHRob3NlIHBsYXRm
b3JtcyB0aGUgc2FtZSB3YXkgdGhleSBkaWQNCj4gICAgIGJlZm9yZSwgYWRkIGEgInBjaWVfcG9y
dHM9ZHBjLW5hdGl2ZSIga2VybmVsIHBhcmFtZXRlciB0aGF0IG1ha2VzIExpbnV4DQo+ICAgICBo
YW5kbGUgRFBDIGV2ZW50cyByZWdhcmRsZXNzIG9mIHdoZXRoZXIgaXQgaGFzIGNvbnRyb2wgb2Yg
QUVSLg0KPiAgICAgDQo+ICAgICBbYmhlbGdhYXM6IGNvbW1pdCBsb2csIG1vdmUgcGNpZV9wb3J0
c19kcGNfbmF0aXZlIHRvIGRyaXZlcnMvcGNpL10NCj4gICAgIExpbms6IGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL3IvMjAxOTEwMjMxOTIyMDUuOTcwMjQtMS1vbG9mQGxpeG9tLm5ldA0KPiAgICAg
U2lnbmVkLW9mZi1ieTogT2xvZiBKb2hhbnNzb24gPG9sb2ZAbGl4b20ubmV0Pg0KPiAgICAgU2ln
bmVkLW9mZi1ieTogQmpvcm4gSGVsZ2FhcyA8YmhlbGdhYXNAZ29vZ2xlLmNvbT4NCj4gDQo+IA0K
PiBUaGFua3MsDQo+IEpvbg0KDQoNCg0KSGkgQmpvcm4sDQoNCkFyZSB5b3Ugc3RpbGwgdGhpbmtp
bmcgYWJvdXQgcmVtb3ZpbmcgdGhlIEhFU1QgcGFyc2VyPw0KDQpGb3IgVk1EIHdlIHN0aWxsIG5l
ZWQgdGhlIGFiaWxpdHkgdG8gYmluZCBEUEMgaWYgbmF0aXZlX2RwYz09MS4NCkkgdGhpbmsgaWYg
d2UgY2FuIGRvIHRoYXQsIHRoaXMgc2V0IHNob3VsZCBzdGlsbCBwcmV0dHkgbXVjaCBzdGlsbA0K
YXBwbHkgd2l0aCBhIG1vZGlmaWNhdGlvbiB0byBwYXRjaCAyIHRvIGFsbG93IG1hdGNoaW5nDQpw
Y2llX3BvcnRzX2RwY19uYXRpdmUgaW4gZHBjX3Byb2JlLg0KDQpKb24NCg==
