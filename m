Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CDE8915712
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jun 2024 21:22:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W7Hs81WBRz3dDt
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2024 05:22:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=shameerali.kolothum.thodi@huawei.com; receiver=lists.ozlabs.org)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W7Hrk0kcyz3cXw
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jun 2024 05:21:39 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4W7Hpd4xrHz6K9g7;
	Tue, 25 Jun 2024 03:19:53 +0800 (CST)
Received: from lhrpeml100004.china.huawei.com (unknown [7.191.162.219])
	by mail.maildlp.com (Postfix) with ESMTPS id 1AD10140A70;
	Tue, 25 Jun 2024 03:21:33 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (7.191.163.240) by
 lhrpeml100004.china.huawei.com (7.191.162.219) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 24 Jun 2024 20:21:32 +0100
Received: from lhrpeml500005.china.huawei.com ([7.191.163.240]) by
 lhrpeml500005.china.huawei.com ([7.191.163.240]) with mapi id 15.01.2507.039;
 Mon, 24 Jun 2024 20:21:32 +0100
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Sean Christopherson <seanjc@google.com>
Subject: RE: [PATCH 00/26] KVM: vfio: Hide KVM internals from others
Thread-Topic: [PATCH 00/26] KVM: vfio: Hide KVM internals from others
Thread-Index: AQHZ6DUkZqOCX4TQLUabDzpapjtX9LHSHHZQgAaZwQCAAFBCQA==
Date: Mon, 24 Jun 2024 19:21:32 +0000
Message-ID: <ec1e168193ed45dea22117606cabacc5@huawei.com>
References: <20230916003118.2540661-1-seanjc@google.com>
 <504fa0a7264d4762afda2f13c3525ce5@huawei.com> <ZnmRgqD6FmXNNzzI@google.com>
In-Reply-To: <ZnmRgqD6FmXNNzzI@google.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.195.246.162]
Content-Type: text/plain; charset="utf-8"
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
Cc: "x86@kernel.org" <x86@kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio
 Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, Janosch Frank <frankja@linux.ibm.com>, Harald Freudenberger <freude@linux.ibm.com>, Marc Zyngier <maz@kernel.org>, Huacai
 Chen <chenhuacai@kernel.org>, Halil Pasic <pasic@linux.ibm.com>, Andrew Thornton <andrewth@google.com>, Ingo Molnar <mingo@redhat.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Jason Herne <jjherne@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>, Venkatesh Srinivas <venkateshs@chromium.org>, Heiko Carstens <hca@linux.ibm.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Alex Williamson <alex.williamson@redhat.com>, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, Thomas Gleixner <tglx@linutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Tony Krowiak <akrowiak@linux.ibm.com>, Anish
 Ghulati <aghulati@google.com>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, Oliver Upton <oliver.upton@linux.dev>, "linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>, Anup
 Patel <anup@brainfault.org>, Paolo Bonzini <pbonzini@redhat.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogU2VhbiBDaHJpc3RvcGhl
cnNvbiA8c2VhbmpjQGdvb2dsZS5jb20+DQo+IFNlbnQ6IE1vbmRheSwgSnVuZSAyNCwgMjAyNCA0
OjMyIFBNDQo+IFRvOiBTaGFtZWVyYWxpIEtvbG90aHVtIFRob2RpIDxzaGFtZWVyYWxpLmtvbG90
aHVtLnRob2RpQGh1YXdlaS5jb20+DQo+IENjOiBDYXRhbGluIE1hcmluYXMgPGNhdGFsaW4ubWFy
aW5hc0Bhcm0uY29tPjsgV2lsbCBEZWFjb24NCj4gPHdpbGxAa2VybmVsLm9yZz47IE1hcmMgWnlu
Z2llciA8bWF6QGtlcm5lbC5vcmc+OyBPbGl2ZXIgVXB0b24NCj4gPG9saXZlci51cHRvbkBsaW51
eC5kZXY+OyBIdWFjYWkgQ2hlbiA8Y2hlbmh1YWNhaUBrZXJuZWwub3JnPjsgTWljaGFlbA0KPiBF
bGxlcm1hbiA8bXBlQGVsbGVybWFuLmlkLmF1PjsgQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0
Lm9yZz47IFBhdWwNCj4gV2FsbXNsZXkgPHBhdWwud2FsbXNsZXlAc2lmaXZlLmNvbT47IFBhbG1l
ciBEYWJiZWx0DQo+IDxwYWxtZXJAZGFiYmVsdC5jb20+OyBBbGJlcnQgT3UgPGFvdUBlZWNzLmJl
cmtlbGV5LmVkdT47IEhlaWtvDQo+IENhcnN0ZW5zIDxoY2FAbGludXguaWJtLmNvbT47IFZhc2ls
eSBHb3JiaWsgPGdvckBsaW51eC5pYm0uY29tPjsNCj4gQWxleGFuZGVyIEdvcmRlZXYgPGFnb3Jk
ZWV2QGxpbnV4LmlibS5jb20+OyBDaHJpc3RpYW4gQm9ybnRyYWVnZXINCj4gPGJvcm50cmFlZ2Vy
QGxpbnV4LmlibS5jb20+OyBKYW5vc2NoIEZyYW5rIDxmcmFua2phQGxpbnV4LmlibS5jb20+Ow0K
PiBDbGF1ZGlvIEltYnJlbmRhIDxpbWJyZW5kYUBsaW51eC5pYm0uY29tPjsgVGhvbWFzIEdsZWl4
bmVyDQo+IDx0Z2x4QGxpbnV0cm9uaXguZGU+OyBJbmdvIE1vbG5hciA8bWluZ29AcmVkaGF0LmNv
bT47IEJvcmlzbGF2IFBldGtvdg0KPiA8YnBAYWxpZW44LmRlPjsgRGF2ZSBIYW5zZW4gPGRhdmUu
aGFuc2VuQGxpbnV4LmludGVsLmNvbT47DQo+IHg4NkBrZXJuZWwub3JnOyBQZXRlciBaaWpsc3Ry
YSA8cGV0ZXJ6QGluZnJhZGVhZC5vcmc+OyBBcm5hbGRvIENhcnZhbGhvIGRlDQo+IE1lbG8gPGFj
bWVAa2VybmVsLm9yZz47IFBhb2xvIEJvbnppbmkgPHBib256aW5pQHJlZGhhdC5jb20+OyBUb255
DQo+IEtyb3dpYWsgPGFrcm93aWFrQGxpbnV4LmlibS5jb20+OyBIYWxpbCBQYXNpYyA8cGFzaWNA
bGludXguaWJtLmNvbT47DQo+IEphc29uIEhlcm5lIDxqamhlcm5lQGxpbnV4LmlibS5jb20+OyBI
YXJhbGQgRnJldWRlbmJlcmdlcg0KPiA8ZnJldWRlQGxpbnV4LmlibS5jb20+OyBBbGV4IFdpbGxp
YW1zb24gPGFsZXgud2lsbGlhbXNvbkByZWRoYXQuY29tPjsNCj4gQW5keSBMdXRvbWlyc2tpIDxs
dXRvQGtlcm5lbC5vcmc+OyBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7DQo+
IGt2bWFybUBsaXN0cy5saW51eC5kZXY7IGxpbnV4LW1pcHNAdmdlci5rZXJuZWwub3JnOyBrdm1A
dmdlci5rZXJuZWwub3JnOw0KPiBsaW51eHBwYy1kZXZAbGlzdHMub3psYWJzLm9yZzsga3ZtLXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmc7IGxpbnV4LQ0KPiByaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnOyBsaW51eC1zMzkwQHZnZXIua2VybmVsLm9yZzsgbGludXgtDQo+IGtlcm5lbEB2Z2VyLmtl
cm5lbC5vcmc7IGxpbnV4LXBlcmYtdXNlcnNAdmdlci5rZXJuZWwub3JnOyBBbmlzaCBHaHVsYXRp
DQo+IDxhZ2h1bGF0aUBnb29nbGUuY29tPjsgVmVua2F0ZXNoIFNyaW5pdmFzIDx2ZW5rYXRlc2hz
QGNocm9taXVtLm9yZz47DQo+IEFuZHJldyBUaG9ybnRvbiA8YW5kcmV3dGhAZ29vZ2xlLmNvbT4N
Cj4gU3ViamVjdDogUmU6IFtQQVRDSCAwMC8yNl0gS1ZNOiB2ZmlvOiBIaWRlIEtWTSBpbnRlcm5h
bHMgZnJvbSBvdGhlcnMNCj4gDQo+IE9uIFRodSwgSnVuIDIwLCAyMDI0LCBTaGFtZWVyYWxpIEtv
bG90aHVtIFRob2RpIHdyb3RlOg0KPiA+ID4gVGhpcyBpcyBhIGJvcmRlcmxpbmUgUkZDIHNlcmll
cyB0byBoaWRlIEtWTSdzIGludGVybmFscyBmcm9tIHRoZSByZXN0IG9mDQo+ID4gPiB0aGUga2Vy
bmVsLCB3aGVyZSAiaW50ZXJuYWxzIiBtZWFucyBkYXRhIHN0cnVjdHVyZXMsIGVudW1zLCAjZGVm
aW5lcywNCj4gPiA+IEFQSXMsIGV0Yy4gdGhhdCBhcmUgaW50ZW5kZWQgdG8gYmUgS1ZNLW9ubHks
IGJ1dCBhcmUgZXhwb3NlZA0KPiBldmVyeXdoZXJlDQo+ID4gPiBkdWUgdG8ga3ZtX2hvc3QuaCAo
YW5kIG90aGVyIGhlYWRlcnMpIGxpdmluZyBpbiB0aGUgZ2xvYmFsIGluY2x1ZGUgcGF0aHMuDQo+
ID4NCj4gPiBIaSBTZWFuLA0KPiA+DQo+ID4gSnVzdCB0aG91Z2h0IG9mIGNoZWNraW5nIHdpdGgg
eW91IG9uIHRoaXMgc2VyaWVzLiBEbyB5b3UgaGF2ZSBwbGFucyB0bw0KPiByZXZpdmUgdGhpcw0K
PiA+IHNlcmllcz8NCj4gDQo+IFllcCENCj4gDQo+ID4gVGhlIHJlYXNvbiBJIGFtIGFza2luZyBp
cywgb24gQVJNNjQvS1ZNIHNpZGUgd2UgZG8gaGF2ZSBhIHJlcXVpcmVtZW50DQo+ID4gdG8gc2hh
cmUgdGhlIEtWTSBWTUlEIHdpdGggU01NVVYzLiBQbGVhc2Ugc2VlIHRoZSBSRkMgSSBzZW50IG91
dA0KPiBlYXJsaWVyIHRoaXMNCj4gPiB5ZWFyWzFdLiBUaGUgc2VyaWVzIGJhc2ljYWxseSBwcm92
aWRlcyBhIHdheSBmb3IgS1ZNIHRvIHBpbiBhIFZNSUQgYW5kIGFsc28NCj4gPiBhc3NvY2lhdGVz
IGFuIGlvbW11ZmQgY3R4IHdpdGggYSBzdHJ1Y3Qga3ZtICogdG8gcmV0cmlldmUgdGhhdCBWTUlE
Lg0KPiA+DQo+ID4gQXMgbWVudGlvbmVkIGFib3ZlLCBzb21lIG9mIHRoZSBwYXRjaGVzIGluIHRo
aXMgc2VyaWVzKGVzcGVjaWFsbHkgMS00ICYgNikNCj4gdGhhdA0KPiA+IGRvZXMgdGhlIFZGSU8g
Y2xlYW51cHMgYW5kIGRyb3BwaW5nIENPTkZJR19LVk1fVkZJTyBsb29rcyB2ZXJ5DQo+IHN0cmFp
Z2h0Zm9yd2FyZA0KPiA+IGFuZCB1c2VmdWwuIEkgYW0gdGhpbmtpbmcgb2YgaW5jbHVkaW5nIHRo
b3NlIHdoZW4gSSByZS1zcGluIG15IFJGQyBzZXJpZXMsIGlmDQo+ID4gdGhhdOKAmXMgb2suDQo+
IA0KPiBQbGVhc2UgZG9uJ3QgaW5jbHVkZSB0aGVtLCBhcyB0aGUgcGF0Y2ggdGhleSBidWlsZCB0
b3dhcmRzIChwYXRjaCA1KSBpcw0KPiBidWdneVsqXSwNCj4gYW5kIEkgYW0gZmFpcmx5IGNlcnRh
aW4gdGhhdCBhdCBsZWFzdCBzb21lIG9mIHRoZSBwYXRjaGVzIHdpbGwgY2hhbmdlDQo+IHNpZ25p
ZmljYW50bHkuDQoNCk9rLiBHb3QgaXQuIFRoYW5rcyBmb3IgdGFraW5nIGEgbG9vayBhdCB0aGUg
S1ZNIHBpbm5lZCBWTUlEIHNlcmllcyBhbmQgY29tbWVudHMNCnRoZXJlLg0KDQpTaGFtZWVyDQo=
