Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD271C1BDC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 May 2020 19:37:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49DKFH1Q2BzDrNt
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 May 2020 03:37:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=jonathan.derrick@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49DKCP5tYRzDrBp
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 May 2020 03:35:22 +1000 (AEST)
IronPort-SDR: rvcPrjg8IaJjZLLiY8pD8Pgvyg0y7kNEujCFMPPV9a4cZobNAKLYtTY28CsAGrbSNS0evJ8QN2
 FKWBViy1xtZA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2020 10:35:18 -0700
IronPort-SDR: AIo90WlFzgatGYhRQjugzGu1JYYFSXF3xirZSA3pjejZkeFouqM6dL/ljOCuUplGpy7q2E7SWY
 F555HQp1C06A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,340,1583222400"; d="scan'208";a="258670568"
Received: from orsmsx106.amr.corp.intel.com ([10.22.225.133])
 by orsmga003.jf.intel.com with ESMTP; 01 May 2020 10:35:17 -0700
Received: from orsmsx158.amr.corp.intel.com (10.22.240.20) by
 ORSMSX106.amr.corp.intel.com (10.22.225.133) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Fri, 1 May 2020 10:35:17 -0700
Received: from orsmsx101.amr.corp.intel.com ([169.254.8.204]) by
 ORSMSX158.amr.corp.intel.com ([169.254.10.56]) with mapi id 14.03.0439.000;
 Fri, 1 May 2020 10:35:17 -0700
From: "Derrick, Jonathan" <jonathan.derrick@intel.com>
To: "helgaas@kernel.org" <helgaas@kernel.org>
Subject: Re: [PATCH v3 0/2] PCI/ERR: Allow Native AER/DPC using _OSC
Thread-Topic: [PATCH v3 0/2] PCI/ERR: Allow Native AER/DPC using _OSC
Thread-Index: AQHWHyGBlj2gvaBx5UuW2XC3HoapYaiT766AgAAFJ4A=
Date: Fri, 1 May 2020 17:35:16 +0000
Message-ID: <518c3348c4b4a8b5fed6a42ad190771f7f9645f3.camel@intel.com>
References: <20200501171649.GA116404@bjorn-Precision-5520>
In-Reply-To: <20200501171649.GA116404@bjorn-Precision-5520>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.255.3.184]
Content-Type: text/plain; charset="utf-8"
Content-ID: <7FDE8DA749E49548A442399530838EF6@intel.com>
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

T24gRnJpLCAyMDIwLTA1LTAxIGF0IDEyOjE2IC0wNTAwLCBCam9ybiBIZWxnYWFzIHdyb3RlOg0K
PiBPbiBUaHUsIEFwciAzMCwgMjAyMCBhdCAxMjo0NjowN1BNIC0wNjAwLCBKb24gRGVycmljayB3
cm90ZToNCj4gPiBIaSBCam9ybiAmIEt1cHB1c3dhbXksDQo+ID4gDQo+ID4gSSBzZWUgYSBwcm9i
bGVtIGluIHRoZSBEUEMgRUNOIFsxXSB0byBfT1NDIGluIHRoYXQgaXQgZG9lc24ndCBnaXZlIHVz
IGEgd2F5IHRvDQo+ID4gZGV0ZXJtaW5lIGlmIGZpcm13YXJlIHN1cHBvcnRzIF9PU0MgRFBDIG5l
Z290YXRpb24sIGFuZCB0aGVyZWZvcmUgaG93IHRvIGhhbmRsZQ0KPiA+IERQQy4NCj4gPiANCj4g
PiBIZXJlIGlzIHRoZSB3b3JkaW5nIG9mIHRoZSBFQ04gdGhhdCBpbXBsaWVzIHRoYXQgRmlybXdh
cmUgd2l0aG91dCBfT1NDIERQQw0KPiA+IG5lZ290aWF0aW9uIHN1cHBvcnQgc2hvdWxkIGhhdmUg
dGhlIE9TUE0gcmVseSBvbiBfT1NDIEFFUiBuZWdvdGlhdGlvbiB3aGVuDQo+ID4gZGV0ZXJtaW5p
bmcgRFBDIGNvbnRyb2w6DQo+ID4gDQo+ID4gICBQQ0llIEJhc2UgU3BlY2lmaWNhdGlvbiBzdWdn
ZXN0cyB0aGF0IERvd25zdHJlYW0gUG9ydCBDb250YWlubWVudCBtYXkgYmUNCj4gPiAgIGNvbnRy
b2xsZWQgZWl0aGVyIGJ5IHRoZSBGaXJtd2FyZSBvciB0aGUgT3BlcmF0aW5nIFN5c3RlbS4gSXQg
YWxzbyBzdWdnZXN0cw0KPiA+ICAgdGhhdCB0aGUgRmlybXdhcmUgcmV0YWluIG93bmVyc2hpcCBv
ZiBEb3duc3RyZWFtIFBvcnQgQ29udGFpbm1lbnQgaWYgaXQgYWxzbw0KPiA+ICAgb3ducyBBRVIu
IFdoZW4gdGhlIEZpcm13YXJlIG93bnMgRG93bnN0cmVhbSBQb3J0IENvbnRhaW5tZW50LCBpdCBp
cyBleHBlY3RlZA0KPiA+ICAgdG8gdXNlIHRoZSBuZXcgIkVycm9yIERpc2Nvbm5lY3QgUmVjb3Zl
ciIgbm90aWZpY2F0aW9uIHRvIGFsZXJ0IE9TUE0gb2YgYQ0KPiA+ICAgRG93bnN0cmVhbSBQb3J0
IENvbnRhaW5tZW50IGV2ZW50Lg0KPiA+IA0KPiA+IEluIGxlZ2FjeSBwbGF0Zm9ybXMsIGFzIGJp
dHMgaW4gX09TQyBhcmUgcmVzZXJ2ZWQgcHJpb3IgdG8gaW1wbGVtZW50YXRpb24sIEFDUEkNCj4g
PiBSb290IEJ1cyBlbnVtZXJhdGlvbiB3aWxsIG1hcmsgdGhlc2UgSG9zdCBCcmlkZ2VzIGFzIHdp
dGhvdXQgTmF0aXZlIERQQw0KPiA+IHN1cHBvcnQsIGV2ZW4gdGhvdWdoIHRoZSBzcGVjaWZpY2F0
aW9uIGltcGxpZXMgaXQncyBleHBlY3RlZCB0aGF0IEFFUiBfT1NDDQo+ID4gbmVnb3RpYXRpb24g
ZGV0ZXJtaW5lcyBEUEMgY29udHJvbCBmb3IgdGhlc2UgcGxhdGZvcm1zLiBUaGVyZSBzZWVtcyB0
byBiZSBhDQo+ID4gbmVlZCBmb3IgYSB3YXkgdG8gZGV0ZXJtaW5lIGlmIHRoZSBEUEMgY29udHJv
bCBiaXQgaW4gX09TQyBpcyBzdXBwb3J0ZWQgYW5kDQo+ID4gZmFsbGJhY2sgb24gQUVSIG90aGVy
d2lzZS4NCj4gPiANCj4gPiANCj4gPiBDdXJyZW50bHkgcG9ydGRydiBhc3N1bWVzIERQQyBjb250
cm9sIGlmIHRoZSBwb3J0IGhhcyBOYXRpdmUgQUVSIHNlcnZpY2VzOg0KPiA+IA0KPiA+IHN0YXRp
YyBpbnQgZ2V0X3BvcnRfZGV2aWNlX2NhcGFiaWxpdHkoc3RydWN0IHBjaV9kZXYgKmRldikNCj4g
PiAuLi4NCj4gPiAJaWYgKHBjaV9maW5kX2V4dF9jYXBhYmlsaXR5KGRldiwgUENJX0VYVF9DQVBf
SURfRFBDKSAmJg0KPiA+IAkgICAgcGNpX2Flcl9hdmFpbGFibGUoKSAmJg0KPiA+IAkgICAgKHBj
aWVfcG9ydHNfZHBjX25hdGl2ZSB8fCAoc2VydmljZXMgJiBQQ0lFX1BPUlRfU0VSVklDRV9BRVIp
KSkNCj4gPiAJCXNlcnZpY2VzIHw9IFBDSUVfUE9SVF9TRVJWSUNFX0RQQzsNCj4gPiANCj4gPiBO
ZXdlciBmaXJtd2FyZSBtYXkgbm90IGdyYW50IE9TUE0gRFBDIGNvbnRyb2wsIGlmIGZvciBpbnN0
YW5jZSwgaXQgZXhwZWN0cyB0bw0KPiA+IHVzZSBFcnJvciBEaXNjb25uZWN0IFJlY292ZXJ5LiBI
b3dldmVyIGl0IGxvb2tzIGxpa2UgQUNQSSB3aWxsIHVzZSBEUEMgc2VydmljZXMNCj4gPiB2aWEg
dGhlIEVEUiBkcml2ZXIsIHdpdGhvdXQgYmluZGluZyB0aGUgZnVsbCBEUEMgcG9ydCBzZXJ2aWNl
IGRyaXZlci4NCj4gPiANCj4gPiANCj4gPiBJZiB3ZSBjaGFuZ2UgcG9ydGRydiB0byBwcm9iZSBi
YXNlZCBvbiBob3N0LT5uYXRpdmVfZHBjIGFuZCBub3QgQUVSLCB0aGVuIHdlDQo+ID4gYnJlYWsg
aW5zdGFuY2VzIHdpdGggbGVnYWN5IGZpcm13YXJlIHdoZXJlIE9TUE0gd2lsbCBjbGVhciBob3N0
LT5uYXRpdmVfZHBjDQo+ID4gc29sZWx5IGR1ZSB0byBfT1NDIGJpdHMgYmVpbmcgcmVzZXJ2ZWQ6
DQo+ID4gDQo+ID4gc3RydWN0IHBjaV9idXMgKmFjcGlfcGNpX3Jvb3RfY3JlYXRlKHN0cnVjdCBh
Y3BpX3BjaV9yb290ICpyb290LA0KPiA+IC4uLg0KPiA+IAlpZiAoIShyb290LT5vc2NfY29udHJv
bF9zZXQgJiBPU0NfUENJX0VYUFJFU1NfRFBDX0NPTlRST0wpKQ0KPiA+IAkJaG9zdF9icmlkZ2Ut
Pm5hdGl2ZV9kcGMgPSAwOw0KPiA+IA0KPiA+IA0KPiA+IA0KPiA+IFNvIG15IGFzc3VtcHRpb24g
aW5zdGVhZCBpcyB0aGF0IGhvc3QtPm5hdGl2ZV9kcGMgY2FuIGJlIDAgYW5kIGV4cGVjdCBOYXRp
dmUNCj4gPiBEUEMgc2VydmljZXMgaWYgQUVSIGlzIHVzZWQuIEluIG90aGVyIHdvcmRzLCBpZiBh
bmQgb25seSBpZiBEUEMgcHJvYmUgaXMNCj4gPiBpbnZva2VkIGZyb20gcG9ydGRydiwgdGhlbiBp
dCBuZWVkcyB0byByZWx5IG9uIHRoZSBBRVIgZGVwZW5kZW5jeS4gT3RoZXJ3aXNlIGl0DQo+ID4g
c2hvdWxkIGJlIGFzc3VtZWQgdGhhdCBBQ1BJIHNldCB1cCBEUEMgdmlhIEVEUi4gVGhpcyBjb3Zl
cnMgbGVnYWN5IGZpcm13YXJlLg0KPiA+IA0KPiA+IEhvd2V2ZXIgaXQgc2VlbXMgbGlrZSB0aGF0
IGNvdWxkIGJlIHRyb3VibGUgd2l0aCBuZXdlciBmaXJtd2FyZSB0aGF0IG1pZ2h0IGdpdmUNCj4g
PiBPU1BNIGNvbnRyb2wgb2YgQUVSIGJ1dCBub3QgRFBDLCBhbmQgd291bGQgcmVzdWx0IGluIGJv
dGggTmF0aXZlIERQQyBhbmQgRURSDQo+ID4gYmVpbmcgaW4gZWZmZWN0Lg0KPiA+IA0KPiA+IA0K
PiA+IEFueXdheXMgaGVyZSBhcmUgdHdvIHBhdGNoZXMgdGhhdCBnaXZlIGNvbnRyb2wgb2YgQUVS
IGFuZCBEUEMgb24gdGhlIHJlc3VsdHMgb2YNCj4gPiBfT1NDLiBUaGV5IGRvbid0IG1lc3Mgd2l0
aCB0aGUgSEVTVCBwYXJzZXIgYXMgSSBleHBlY3QgdGhvc2UgdG8gYmUgcmVtb3ZlZCBhdA0KPiA+
IHNvbWUgcG9pbnQuIEkgbmVlZCB0aGVzZSBmb3IgVk1EIHN1cHBvcnQgd2hpY2ggZG9lc24ndCBl
dmVuIHJlbHkgb24gX09TQywgYnV0IEkNCj4gPiBzdXNwZWN0IHRoaXMgd29uJ3QgYmUgdGhlIGxh
c3QgZWZmb3J0IGFzIHdlIGRldGFuZ2xlIEZpcm13YXJlIEZpcnN0Lg0KPiA+IA0KPiA+IFsxXSBo
dHRwczovL21lbWJlcnMucGNpc2lnLmNvbS93Zy9QQ0ktU0lHL2RvY3VtZW50LzEyODg4DQo+IA0K
PiBIaSBKb24sIEkgdGhpbmsgd2UgbmVlZCB0byBzb3J0IG91dCB0aGUgX09TQy9GSVJNV0FSRV9G
SVJTVCBwYXRjaGVzDQo+IGZyb20gQWxleCBhbmQgU2F0aHkgZmlyc3QsIHRoZW4gc2VlIHdoYXQg
bmVlZHMgdG8gYmUgZG9uZSBvbiB0b3Agb2YNCj4gdGhvc2UsIHNvIEknbSBnb2luZyB0byBwdXNo
IHRoZXNlIG9mZiBmb3IgYSBmZXcgZGF5cyBhbmQgdGhleSdsbA0KPiBwcm9iYWJseSBuZWVkIGEg
cmVmcmVzaC4NCj4gDQo+IEJqb3JuDQoNCg0KQWdyZWVkLCBubyBuZWVkIHRvIG1lcmdlIG5vdy4g
SnVzdCB3YW50ZWQgdG8gYnJpbmcgdXAgdGhlIERQQw0KYW1iaWd1aXR5LCB3aGljaCBJIHRoaW5r
IHdhcyBmaXJzdCBhZGRyZXNzZWQgYnkgZHBjLW5hdGl2ZToNCg0KY29tbWl0IDM1YTBiMjM3OGMx
OTlkNGYyNmU0NThiMmNhMzhlYTU2YWFmMmQ5YjgNCkF1dGhvcjogT2xvZiBKb2hhbnNzb24gPG9s
b2ZAbGl4b20ubmV0Pg0KRGF0ZTogICBXZWQgT2N0IDIzIDEyOjIyOjA1IDIwMTkgLTA3MDANCg0K
ICAgIFBDSS9EUEM6IEFkZCAicGNpZV9wb3J0cz1kcGMtbmF0aXZlIiB0byBhbGxvdyBEUEMgd2l0
aG91dCBBRVIgY29udHJvbA0KICAgIA0KICAgIFByaW9yIHRvIGVlZDg1ZmY0YzBkYTcgKCJQQ0kv
RFBDOiBFbmFibGUgRFBDIG9ubHkgaWYgQUVSIGlzIGF2YWlsYWJsZSIpLA0KICAgIExpbnV4IGhh
bmRsZWQgRFBDIGV2ZW50cyByZWdhcmRsZXNzIG9mIHdoZXRoZXIgZmlybXdhcmUgaGFkIGdyYW50
ZWQgaXQNCiAgICBvd25lcnNoaXAgb2YgQUVSIG9yIERQQywgZS5nLiwgdmlhIF9PU0MuDQogICAg
DQogICAgUENJZSByNS4wLCBzZWMgNi4yLjEwLCByZWNvbW1lbmRzIHRoYXQgdGhlIE9TIGxpbmsg
Y29udHJvbCBvZiBEUEMgdG8NCiAgICBjb250cm9sIG9mIEFFUiwgc28gYWZ0ZXIgZWVkODVmZjRj
MGRhNywgTGludXggaGFuZGxlcyBEUEMgZXZlbnRzIG9ubHkgaWYgaXQNCiAgICBoYXMgY29udHJv
bCBvZiBBRVIuDQogICAgDQogICAgT24gcGxhdGZvcm1zIHRoYXQgZG8gbm90IGdyYW50IE9TIGNv
bnRyb2wgb2YgQUVSIHZpYSBfT1NDLCBMaW51eCBEUEMNCiAgICBoYW5kbGluZyB3b3JrZWQgYmVm
b3JlIGVlZDg1ZmY0YzBkYTcgYnV0IG5vdCBhZnRlci4NCiAgICANCiAgICBUbyBtYWtlIExpbnV4
IERQQyBoYW5kbGluZyB3b3JrIG9uIHRob3NlIHBsYXRmb3JtcyB0aGUgc2FtZSB3YXkgdGhleSBk
aWQNCiAgICBiZWZvcmUsIGFkZCBhICJwY2llX3BvcnRzPWRwYy1uYXRpdmUiIGtlcm5lbCBwYXJh
bWV0ZXIgdGhhdCBtYWtlcyBMaW51eA0KICAgIGhhbmRsZSBEUEMgZXZlbnRzIHJlZ2FyZGxlc3Mg
b2Ygd2hldGhlciBpdCBoYXMgY29udHJvbCBvZiBBRVIuDQogICAgDQogICAgW2JoZWxnYWFzOiBj
b21taXQgbG9nLCBtb3ZlIHBjaWVfcG9ydHNfZHBjX25hdGl2ZSB0byBkcml2ZXJzL3BjaS9dDQog
ICAgTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDE5MTAyMzE5MjIwNS45NzAyNC0x
LW9sb2ZAbGl4b20ubmV0DQogICAgU2lnbmVkLW9mZi1ieTogT2xvZiBKb2hhbnNzb24gPG9sb2ZA
bGl4b20ubmV0Pg0KICAgIFNpZ25lZC1vZmYtYnk6IEJqb3JuIEhlbGdhYXMgPGJoZWxnYWFzQGdv
b2dsZS5jb20+DQoNCg0KVGhhbmtzLA0KSm9uDQo=
