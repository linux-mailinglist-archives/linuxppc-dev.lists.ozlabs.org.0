Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A413BC8D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jun 2019 21:14:46 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45N2rM623HzDqBV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 05:14:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=vishal.l.verma@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45N1DX5y45zDqPQ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2019 04:02:04 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Jun 2019 11:00:43 -0700
X-ExtLoop1: 1
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by FMSMGA003.fm.intel.com with ESMTP; 10 Jun 2019 11:00:43 -0700
Received: from fmsmsx153.amr.corp.intel.com (10.18.125.6) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Mon, 10 Jun 2019 11:00:43 -0700
Received: from fmsmsx113.amr.corp.intel.com ([169.254.13.221]) by
 FMSMSX153.amr.corp.intel.com ([169.254.9.44]) with mapi id 14.03.0415.000;
 Mon, 10 Jun 2019 11:00:42 -0700
From: "Verma, Vishal L" <vishal.l.verma@intel.com>
To: "aneesh.kumar@linux.ibm.com" <aneesh.kumar@linux.ibm.com>, "Williams, Dan
 J" <dan.j.williams@intel.com>
Subject: =?utf-8?B?UmU6IFtQQVRDSF0gbW0vbnZkaW1tOiBGaXggZW5kaWFuIGNvbnZlcnNpb24g?=
 =?utf-8?B?aXNzdWVzwqA=?=
Thread-Topic: =?utf-8?B?W1BBVENIXSBtbS9udmRpbW06IEZpeCBlbmRpYW4gY29udmVyc2lvbiBpc3N1?=
 =?utf-8?B?ZXPCoA==?=
Thread-Index: AQHVHPzvNVRBYBN6b0uXWFFw88SJnqaVqDUA
Date: Mon, 10 Jun 2019 18:00:42 +0000
Message-ID: <1ec64d511af872df7b0597895622eb196ac4dbc9.camel@intel.com>
References: <20190607064732.30384-1-aneesh.kumar@linux.ibm.com>
In-Reply-To: <20190607064732.30384-1-aneesh.kumar@linux.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.30.5 (3.30.5-1.fc29) 
x-originating-ip: [10.232.112.185]
Content-Type: text/plain; charset="utf-8"
Content-ID: <41D4EB0C81964E4BB929D8F7CE095E4A@intel.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 11 Jun 2019 05:02:30 +1000
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
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-nvdimm@lists.01.org" <linux-nvdimm@lists.01.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gRnJpLCAyMDE5LTA2LTA3IGF0IDEyOjE3ICswNTMwLCBBbmVlc2ggS3VtYXIgSy5WIHdyb3Rl
Og0KPiBuZF9sYWJlbC0+ZHBhIGlzc3VlIHdhcyBvYnNlcnZlZCB3aGVuIHRyeWluZyB0byBlbmFi
bGUgdGhlIG5hbWVzcGFjZSBjcmVhdGVkDQo+IHdpdGggbGl0dGxlLWVuZGlhbiBrZXJuZWwgb24g
YSBiaWctZW5kaWFuIGtlcm5lbC4gVGhhdCBtYWRlIG1lIHJ1bg0KPiBgc3BhcnNlYCBvbiB0aGUg
cmVzdCBvZiB0aGUgY29kZSBhbmQgb3RoZXIgY2hhbmdlcyBhcmUgdGhlIHJlc3VsdCBvZiB0aGF0
Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQW5lZXNoIEt1bWFyIEsuViA8YW5lZXNoLmt1bWFyQGxp
bnV4LmlibS5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9udmRpbW0vYnR0LmMgICAgICAgICAgICB8
IDggKysrKy0tLS0NCj4gIGRyaXZlcnMvbnZkaW1tL25hbWVzcGFjZV9kZXZzLmMgfCA3ICsrKyst
LS0NCj4gIDIgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQ0K
DQpUaGUgdHdvIEJUVCBmaXhlcyBzZWVtIGxpa2UgdGhleSBtYXkgYXBwbHkgdG8gc3RhYmxlIGFz
IHdlbGwsIHRoZQ0KcHJvYmxlbWF0aWMgY29kZSB3YXMgaW50cm9kdWNlZCBpbiByZWxhdGl2ZWx5
IHJlY2VudCByZXdvcmtzL2ZpeGVzLg0KUGVyaGFwcyAtDQoNCkZpeGVzOiBkOWI4M2M3NTY5NTMg
KCJsaWJudmRpbW0sIGJ0dDogcmV3b3JrIGVycm9yIGNsZWFyaW5nIikNCkZpeGVzOiA5ZGVkYzcz
YTQ2NTggKCJsaWJudmRpbW0vYnR0OiBGaXggTEJBIG1hc2tpbmcgZHVyaW5nICdmcmVlIGxpc3Qn
IHBvcHVsYXRpb24iKQ0KDQpPdGhlciB0aGFuIHRoYXQsIHRoZXNlIGxvb2sgZ29vZCB0byBtZS4N
ClJldmlld2VkLWJ5OiBWaXNoYWwgVmVybWEgPHZpc2hhbC5sLnZlcm1hQGludGVsLmNvbT4NCg0K
PiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbnZkaW1tL2J0dC5jIGIvZHJpdmVycy9udmRpbW0v
YnR0LmMNCj4gaW5kZXggNDY3MTc3NmY1NjIzLi40YWMwZjVkZGU0NjcgMTAwNjQ0DQo+IC0tLSBh
L2RyaXZlcnMvbnZkaW1tL2J0dC5jDQo+ICsrKyBiL2RyaXZlcnMvbnZkaW1tL2J0dC5jDQo+IEBA
IC00MDAsOSArNDAwLDkgQEAgc3RhdGljIGludCBidHRfZmxvZ193cml0ZShzdHJ1Y3QgYXJlbmFf
aW5mbyAqYXJlbmEsIHUzMiBsYW5lLCB1MzIgc3ViLA0KPiAgCWFyZW5hLT5mcmVlbGlzdFtsYW5l
XS5zdWIgPSAxIC0gYXJlbmEtPmZyZWVsaXN0W2xhbmVdLnN1YjsNCj4gIAlpZiAoKysoYXJlbmEt
PmZyZWVsaXN0W2xhbmVdLnNlcSkgPT0gNCkNCj4gIAkJYXJlbmEtPmZyZWVsaXN0W2xhbmVdLnNl
cSA9IDE7DQo+IC0JaWYgKGVudF9lX2ZsYWcoZW50LT5vbGRfbWFwKSkNCj4gKwlpZiAoZW50X2Vf
ZmxhZyhsZTMyX3RvX2NwdShlbnQtPm9sZF9tYXApKSkNCj4gIAkJYXJlbmEtPmZyZWVsaXN0W2xh
bmVdLmhhc19lcnIgPSAxOw0KPiAtCWFyZW5hLT5mcmVlbGlzdFtsYW5lXS5ibG9jayA9IGxlMzJf
dG9fY3B1KGVudF9sYmEoZW50LT5vbGRfbWFwKSk7DQo+ICsJYXJlbmEtPmZyZWVsaXN0W2xhbmVd
LmJsb2NrID0gZW50X2xiYShsZTMyX3RvX2NwdShlbnQtPm9sZF9tYXApKTsNCj4gIA0KPiAgCXJl
dHVybiByZXQ7DQo+ICB9DQo+IEBAIC01NjgsOCArNTY4LDggQEAgc3RhdGljIGludCBidHRfZnJl
ZWxpc3RfaW5pdChzdHJ1Y3QgYXJlbmFfaW5mbyAqYXJlbmEpDQo+ICAJCSAqIEZJWE1FOiBpZiBl
cnJvciBjbGVhcmluZyBmYWlscyBkdXJpbmcgaW5pdCwgd2Ugd2FudCB0byBtYWtlDQo+ICAJCSAq
IHRoZSBCVFQgcmVhZC1vbmx5DQo+ICAJCSAqLw0KPiAtCQlpZiAoZW50X2VfZmxhZyhsb2dfbmV3
Lm9sZF9tYXApICYmDQo+IC0JCQkJIWVudF9ub3JtYWwobG9nX25ldy5vbGRfbWFwKSkgew0KPiAr
CQlpZiAoZW50X2VfZmxhZyhsZTMyX3RvX2NwdShsb2dfbmV3Lm9sZF9tYXApKSAmJg0KPiArCQkg
ICAgIWVudF9ub3JtYWwobGUzMl90b19jcHUobG9nX25ldy5vbGRfbWFwKSkpIHsNCj4gIAkJCWFy
ZW5hLT5mcmVlbGlzdFtpXS5oYXNfZXJyID0gMTsNCj4gIAkJCXJldCA9IGFyZW5hX2NsZWFyX2Zy
ZWVsaXN0X2Vycm9yKGFyZW5hLCBpKTsNCj4gIAkJCWlmIChyZXQpDQo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL252ZGltbS9uYW1lc3BhY2VfZGV2cy5jIGIvZHJpdmVycy9udmRpbW0vbmFtZXNwYWNl
X2RldnMuYw0KPiBpbmRleCBjNGM1YTE5MWIxZDYuLjUwMGMzN2RiNDk2YSAxMDA2NDQNCj4gLS0t
IGEvZHJpdmVycy9udmRpbW0vbmFtZXNwYWNlX2RldnMuYw0KPiArKysgYi9kcml2ZXJzL252ZGlt
bS9uYW1lc3BhY2VfZGV2cy5jDQo+IEBAIC0xOTk1LDcgKzE5OTUsNyBAQCBzdGF0aWMgc3RydWN0
IGRldmljZSAqY3JlYXRlX25hbWVzcGFjZV9wbWVtKHN0cnVjdCBuZF9yZWdpb24gKm5kX3JlZ2lv
biwNCj4gIAkJbmRfbWFwcGluZyA9ICZuZF9yZWdpb24tPm1hcHBpbmdbaV07DQo+ICAJCWxhYmVs
X2VudCA9IGxpc3RfZmlyc3RfZW50cnlfb3JfbnVsbCgmbmRfbWFwcGluZy0+bGFiZWxzLA0KPiAg
CQkJCXR5cGVvZigqbGFiZWxfZW50KSwgbGlzdCk7DQo+IC0JCWxhYmVsMCA9IGxhYmVsX2VudCA/
IGxhYmVsX2VudC0+bGFiZWwgOiAwOw0KPiArCQlsYWJlbDAgPSBsYWJlbF9lbnQgPyBsYWJlbF9l
bnQtPmxhYmVsIDogTlVMTDsNCj4gIA0KPiAgCQlpZiAoIWxhYmVsMCkgew0KPiAgCQkJV0FSTl9P
TigxKTsNCj4gQEAgLTIzMzAsOCArMjMzMCw5IEBAIHN0YXRpYyBzdHJ1Y3QgZGV2aWNlICoqc2Nh
bl9sYWJlbHMoc3RydWN0IG5kX3JlZ2lvbiAqbmRfcmVnaW9uKQ0KPiAgCQkJY29udGludWU7DQo+
ICANCj4gIAkJLyogc2tpcCBsYWJlbHMgdGhhdCBkZXNjcmliZSBleHRlbnRzIG91dHNpZGUgb2Yg
dGhlIHJlZ2lvbiAqLw0KPiAtCQlpZiAobmRfbGFiZWwtPmRwYSA8IG5kX21hcHBpbmctPnN0YXJ0
IHx8IG5kX2xhYmVsLT5kcGEgPiBtYXBfZW5kKQ0KPiAtCQkJY29udGludWU7DQo+ICsJCWlmIChf
X2xlNjRfdG9fY3B1KG5kX2xhYmVsLT5kcGEpIDwgbmRfbWFwcGluZy0+c3RhcnQgfHwNCj4gKwkJ
ICAgIF9fbGU2NF90b19jcHUobmRfbGFiZWwtPmRwYSkgPiBtYXBfZW5kKQ0KPiArCQkJCWNvbnRp
bnVlOw0KPiAgDQo+ICAJCWkgPSBhZGRfbmFtZXNwYWNlX3Jlc291cmNlKG5kX3JlZ2lvbiwgbmRf
bGFiZWwsIGRldnMsIGNvdW50KTsNCj4gIAkJaWYgKGkgPCAwKQ0KDQo=
