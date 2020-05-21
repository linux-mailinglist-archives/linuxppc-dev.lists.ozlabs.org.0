Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2B81DDA55
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 May 2020 00:39:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Sl0S5vZPzDqdw
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 May 2020 08:39:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=ira.weiny@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49SkyF5W7YzDqZk
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 May 2020 08:37:03 +1000 (AEST)
IronPort-SDR: e8Jhl1gxVOVBgyH0S3m5KCHmf3/IZ/DHxT5wATtJTZLCcQjMa9JQIoZ9yPwQoAzdQ/4W01gN6X
 2L75ebez5E0w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2020 15:36:55 -0700
IronPort-SDR: SD2zrPDsiP4yIVfkeXJ+qcnvjtyfpBVJ1g3a/mt25nkXtDCoblBTFFnQl+uttuxYUHZVfhzNjN
 id7ElKvB3GEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,419,1583222400"; d="scan'208";a="309196005"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by FMSMGA003.fm.intel.com with ESMTP; 21 May 2020 15:36:54 -0700
Received: from fmsmsx120.amr.corp.intel.com (10.18.124.208) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 21 May 2020 15:36:54 -0700
Received: from crsmsx152.amr.corp.intel.com (172.18.7.35) by
 fmsmsx120.amr.corp.intel.com (10.18.124.208) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 21 May 2020 15:36:54 -0700
Received: from crsmsx101.amr.corp.intel.com ([169.254.1.89]) by
 CRSMSX152.amr.corp.intel.com ([169.254.5.205]) with mapi id 14.03.0439.000;
 Thu, 21 May 2020 16:36:51 -0600
From: "Weiny, Ira" <ira.weiny@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Subject: RE: [PATCH] arch/{mips,sparc,microblaze,powerpc}: Don't enable
 pagefault/preempt twice
Thread-Topic: [PATCH] arch/{mips,sparc,microblaze,powerpc}: Don't enable
 pagefault/preempt twice
Thread-Index: AQHWLUT3NMm1eeF/6kS/+5dTGHml8KiwBlUA//+oUICAAIaYgIAAKjCAgAK994D//6XMAIAAxM8A//+duMA=
Date: Thu, 21 May 2020 22:36:51 +0000
Message-ID: <2807E5FD2F6FDA4886F6618EAC48510E92EAB1DE@CRSMSX101.amr.corp.intel.com>
References: <20200507150004.1423069-8-ira.weiny@intel.com>
 <20200518184843.3029640-1-ira.weiny@intel.com>
 <20200519165422.GA5838@roeck-us.net>
 <20200519184031.GB3356843@iweiny-DESK2.sc.intel.com>
 <20200519194215.GA71941@roeck-us.net>
 <20200520051315.GA3660833@iweiny-DESK2.sc.intel.com>
 <d86dba19-4f4b-061e-a2c7-4f037e9e2de2@roeck-us.net>
 <20200521174250.GB176262@iweiny-DESK2.sc.intel.com>
 <9088585b-b52f-39ad-1651-53cfc0abd714@roeck-us.net>
In-Reply-To: <9088585b-b52f-39ad-1651-53cfc0abd714@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [172.18.205.10]
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, "Williams,
 Dan J" <dan.j.williams@intel.com>, Helge Deller <deller@gmx.de>,
 "x86@kernel.org" <x86@kernel.org>,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, Christoph
 Hellwig <hch@lst.de>, Ingo Molnar <mingo@redhat.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>,
 Borislav Petkov <bp@alien8.de>, Al Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Christian Koenig <christian.koenig@amd.com>, Andrew
 Morton <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PiBPbiA1LzIxLzIwIDEwOjQyIEFNLCBJcmEgV2Vpbnkgd3JvdGU6DQo+ID4gT24gVGh1LCBNYXkg
MjEsIDIwMjAgYXQgMDk6MDU6NDFBTSAtMDcwMCwgR3VlbnRlciBSb2VjayB3cm90ZToNCj4gPj4g
T24gNS8xOS8yMCAxMDoxMyBQTSwgSXJhIFdlaW55IHdyb3RlOg0KPiA+Pj4gT24gVHVlLCBNYXkg
MTksIDIwMjAgYXQgMTI6NDI6MTVQTSAtMDcwMCwgR3VlbnRlciBSb2VjayB3cm90ZToNCj4gPj4+
PiBPbiBUdWUsIE1heSAxOSwgMjAyMCBhdCAxMTo0MDozMkFNIC0wNzAwLCBJcmEgV2Vpbnkgd3Jv
dGU6DQo+ID4+Pj4+IE9uIFR1ZSwgTWF5IDE5LCAyMDIwIGF0IDA5OjU0OjIyQU0gLTA3MDAsIEd1
ZW50ZXIgUm9lY2sgd3JvdGU6DQo+ID4+Pj4+PiBPbiBNb24sIE1heSAxOCwgMjAyMCBhdCAxMTo0
ODo0M0FNIC0wNzAwLCBpcmEud2VpbnlAaW50ZWwuY29tDQo+IHdyb3RlOg0KPiA+Pj4+Pj4+IEZy
b206IElyYSBXZWlueSA8aXJhLndlaW55QGludGVsLmNvbT4NCj4gPj4+Pj4+Pg0KPiA+Pj4+Pj4+
IFRoZSBrdW5tYXBfYXRvbWljIGNsZWFuIHVwIGZhaWxlZCB0byByZW1vdmUgb25lIHNldCBvZg0K
PiA+Pj4+Pj4+IHBhZ2VmYXVsdC9wcmVlbXB0IGVuYWJsZXMgd2hlbiB2YWRkciBpcyBub3QgaW4g
dGhlIGZpeG1hcC4NCj4gPj4+Pj4+Pg0KPiA+Pj4+Pj4+IEZpeGVzOiBiZWUyMTI4YTA5ZTYgKCJh
cmNoL2t1bm1hcF9hdG9taWM6IGNvbnNvbGlkYXRlIGR1cGxpY2F0ZQ0KPiA+Pj4+Pj4+IGNvZGUi
KQ0KPiA+Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IElyYSBXZWlueSA8aXJhLndlaW55QGludGVsLmNv
bT4NCj4gPj4+Pj4+DQo+ID4+Pj4+PiBtaWNyb2JsYXplZWwgd29ya3Mgd2l0aCB0aGlzIHBhdGNo
LA0KPiA+Pj4+Pg0KPiA+Pj4+PiBBd2Vzb21lLi4uICBBbmRyZXcgaW4gbXkgcnVzaCB5ZXN0ZXJk
YXkgSSBzaG91bGQgaGF2ZSBwdXQgYQ0KPiA+Pj4+PiByZXBvcnRlZCBieSBvbiB0aGUgcGF0Y2gg
Zm9yIEd1ZW50ZXIgYXMgd2VsbC4NCj4gPj4+Pj4NCj4gPj4+Pj4gU29ycnkgYWJvdXQgdGhhdCBH
dWVudGVyLA0KPiA+Pj4+DQo+ID4+Pj4gTm8gd29ycmllcy4NCj4gPj4+Pg0KPiA+Pj4+PiBJcmEN
Cj4gPj4+Pj4NCj4gPj4+Pj4+IGFzIGRvIHRoZSBub3NtcCBzcGFyYzMyIGJvb3QgdGVzdHMsIGJ1
dCBzcGFyYzMyIGJvb3QgdGVzdHMgd2l0aA0KPiA+Pj4+Pj4gU01QIGVuYWJsZWQgc3RpbGwgZmFp
bCB3aXRoIGxvdHMgb2YgbWVzc2FnZXMgc3VjaCBhczoNCj4gPj4+Pj4+DQo+ID4+Pj4+PiBCVUc6
IEJhZCBwYWdlIHN0YXRlIGluIHByb2Nlc3Mgc3dhcHBlci8wICBwZm46MDA2YTENCj4gPj4+Pj4+
IHBhZ2U6ZjA5MzM0MjAgcmVmY291bnQ6MCBtYXBjb3VudDoxIG1hcHBpbmc6KHB0cnZhbCkgaW5k
ZXg6MHgxDQo+ID4+Pj4+PiBmbGFnczogMHgwKCkNCj4gPj4+Pj4+IHJhdzogMDAwMDAwMDAgMDAw
MDAxMDAgMDAwMDAxMjIgMDAwMDAwMDAgMDAwMDAwMDEgMDAwMDAwMDANCj4gPj4+Pj4+IDAwMDAw
MDAwIDAwMDAwMDAwIHBhZ2UgZHVtcGVkIGJlY2F1c2U6IG5vbnplcm8gbWFwY291bnQNCj4gTW9k
dWxlcw0KPiA+Pj4+Pj4gbGlua2VkIGluOg0KPiA+Pj4+Pj4gQ1BVOiAwIFBJRDogMSBDb21tOiBz
d2FwcGVyLzAgVGFpbnRlZDogRyAgICBCICAgICAgICAgICAgIDUuNy4wLXJjNi1uZXh0LQ0KPiAy
MDIwMDUxOC0wMDAwMi1nYjE3OGQyZDU2ZjI5ICMxDQo+ID4+Pj4+PiBbZjAwZTdhYjggOg0KPiA+
Pj4+Pj4gYmFkX3BhZ2UrMHhhOC8weDEwOCBdDQo+ID4+Pj4+PiBbZjAwZThiNTQgOg0KPiA+Pj4+
Pj4gZnJlZV9wY3BwYWdlc19idWxrKzB4MTU0LzB4NTJjIF0NCj4gPj4+Pj4+IFtmMDBlYTAyNCA6
DQo+ID4+Pj4+PiBmcmVlX3VucmVmX3BhZ2UrMHg1NC8weDZjIF0NCj4gPj4+Pj4+IFtmMDBlZDg2
NCA6DQo+ID4+Pj4+PiBmcmVlX3Jlc2VydmVkX2FyZWErMHg1OC8weGVjIF0NCj4gPj4+Pj4+IFtm
MDUyNzEwNCA6DQo+ID4+Pj4+PiBrZXJuZWxfaW5pdCsweDE0LzB4MTEwIF0NCj4gPj4+Pj4+IFtm
MDAwYjc3YyA6DQo+ID4+Pj4+PiByZXRfZnJvbV9rZXJuZWxfdGhyZWFkKzB4Yy8weDM4IF0NCj4g
Pj4+Pj4+IFswMDAwMDAwMCA6DQo+ID4+Pj4+PiAweDAgXQ0KPiA+Pj4+Pj4NCj4gPj4+Pj4+IENv
ZGUgcGF0aCBsZWFkaW5nIHRvIHRoYXQgbWVzc2FnZSBpcyBkaWZmZXJlbnQgYnV0IGFsd2F5cyB0
aGUNCj4gPj4+Pj4+IHNhbWUgZnJvbSBmcmVlX3VucmVmX3BhZ2UoKS4NCj4gPj4+DQo+ID4+PiBB
Y3R1YWxseSBpdCBvY2N1cnMgdG8gbWUgdGhhdCB0aGUgcGF0Y2ggY29uc29saWRhdGluZyBrbWFw
X3Byb3QgaXMNCj4gPj4+IG9kZCBmb3Igc3BhcmMgMzIgYml0Li4uDQo+ID4+Pg0KPiA+Pj4gSXRz
IGEgbG9uZyBzaG90IGJ1dCBjb3VsZCB5b3UgdHJ5IHJldmVydGluZyB0aGlzIHBhdGNoPw0KPiA+
Pj4NCj4gPj4+IDRlYTdkMjQxOWUzZiBrbWFwOiBjb25zb2xpZGF0ZSBrbWFwX3Byb3QgZGVmaW5p
dGlvbnMNCj4gPj4+DQo+ID4+DQo+ID4+IFRoYXQgaXMgbm90IGVhc3kgdG8gcmV2ZXJ0LCB1bmZv
cnR1bmF0ZWx5LCBkdWUgdG8gc2V2ZXJhbCBmb2xsb3ctdXANCj4gcGF0Y2hlcy4NCj4gPg0KPiA+
IEkgaGF2ZSBnb3R0ZW4geW91ciBzcGFyYyB0ZXN0cyB0byBydW4gYW5kIHRoZXkgYWxsIHBhc3Mu
Li4NCj4gPg0KPiA+IDA4OjEwOjM0ID4gLi4vbGludXgtYnVpbGQtdGVzdC9yb290ZnMvc3BhcmMv
cnVuLXFlbXUtc3BhcmMuc2gNCj4gPiBCdWlsZCByZWZlcmVuY2U6IHY1LjctcmM0LTE3LWc4NTJi
NmYyZWRjMGYNCj4gPg0KPiANCj4gVGhhdCBkb2Vzbid0IGxvb2sgbGlrZSBpdCBpcyBsaW51eC1u
ZXh0LCB3aGljaCBJIGd1ZXNzIG1lYW5zIHRoYXQgc29tZXRoaW5nDQo+IGVsc2UgaW4gbGludXgt
bmV4dCBicmVha3MgaXQuIFdoYXQgaXMgeW91ciBxZW11IHZlcnNpb24gPw0KDQpBaCB5ZWEgdGhh
dCB3YXMganVzdCA1LjctcmM0IHdpdGggbXkgcGF0Y2ggc2V0IGFwcGxpZWQuICBZZXMgbXVzdCBi
ZSBzb21ldGhpbmcgZWxzZSBvciBhbiBpbnRlcmFjdGlvbiB3aXRoIG15IHBhdGNoIHNldC4NCg0K
RGlkIEkgc2VlIGFub3RoZXIgZW1haWwgd2l0aCBNaWtlIHdoaWNoIG1heSBmaXggdGhpcz8NCg0K
SXJhDQoNCj4gDQo+IFRoYW5rcywNCj4gR3VlbnRlcg0KPiANCj4gPiBCdWlsZGluZyBzcGFyYzMy
OlNQQVJDQ2xhc3NpYzpub3NtcDpzY3NpOmhkIC4uLiBydW5uaW5nIC4uLi4uLi4uLiBwYXNzZWQN
Cj4gPiBCdWlsZGluZyBzcGFyYzMyOlNQQVJDYm9vazpub3NtcDpzY3NpOmNkIC4uLiBydW5uaW5n
IC4uLi4uLi4uLiBwYXNzZWQNCj4gPiBCdWlsZGluZyBzcGFyYzMyOkxYOm5vc21wOm5vYXBjOnNj
c2k6aGQgLi4uIHJ1bm5pbmcgLi4uLi4uLi4uIHBhc3NlZA0KPiA+IEJ1aWxkaW5nIHNwYXJjMzI6
U1MtNDpub3NtcDppbml0cmQgLi4uIHJ1bm5pbmcgLi4uLi4uLi4uIHBhc3NlZA0KPiA+IEJ1aWxk
aW5nIHNwYXJjMzI6U1MtNTpub3NtcDpzY3NpOmhkIC4uLiBydW5uaW5nIC4uLi4uLi4uLiBwYXNz
ZWQNCj4gPiBCdWlsZGluZyBzcGFyYzMyOlNTLTEwOm5vc21wOnNjc2k6Y2QgLi4uIHJ1bm5pbmcg
Li4uLi4uLi4uIHBhc3NlZA0KPiA+IEJ1aWxkaW5nIHNwYXJjMzI6U1MtMjA6bm9zbXA6c2NzaTpo
ZCAuLi4gcnVubmluZyAuLi4uLi4uLi4gcGFzc2VkDQo+ID4gQnVpbGRpbmcgc3BhcmMzMjpTUy02
MDBNUDpub3NtcDpzY3NpOmhkIC4uLiBydW5uaW5nIC4uLi4uLi4uLiBwYXNzZWQNCj4gPiBCdWls
ZGluZyBzcGFyYzMyOlZveWFnZXI6bm9zbXA6bm9hcGM6c2NzaTpoZCAuLi4gcnVubmluZyAuLi4u
Li4uLi4gcGFzc2VkDQo+ID4gQnVpbGRpbmcgc3BhcmMzMjpTUy00OnNtcDpzY3NpOmhkIC4uLiBy
dW5uaW5nIC4uLi4uLi4uLiBwYXNzZWQNCj4gPiBCdWlsZGluZyBzcGFyYzMyOlNTLTU6c21wOnNj
c2k6Y2QgLi4uIHJ1bm5pbmcgLi4uLi4uLi4uIHBhc3NlZA0KPiA+IEJ1aWxkaW5nIHNwYXJjMzI6
U1MtMTA6c21wOnNjc2k6aGQgLi4uIHJ1bm5pbmcgLi4uLi4uLi4uIHBhc3NlZA0KPiA+IEJ1aWxk
aW5nIHNwYXJjMzI6U1MtMjA6c21wOnNjc2k6aGQgLi4uIHJ1bm5pbmcgLi4uLi4uLi4uIHBhc3Nl
ZA0KPiA+IEJ1aWxkaW5nIHNwYXJjMzI6U1MtNjAwTVA6c21wOnNjc2k6aGQgLi4uIHJ1bm5pbmcg
Li4uLi4uLi4uIHBhc3NlZA0KPiA+IEJ1aWxkaW5nIHNwYXJjMzI6Vm95YWdlcjpzbXA6bm9hcGM6
c2NzaTpoZCAuLi4gcnVubmluZyAuLi4uLi4uLi4gcGFzc2VkDQo+ID4NCj4gPiBJcyB0aGVyZSBh
bm90aGVyIHRlc3QgSSBuZWVkIHRvIHJ1bj8NCj4gPg0KPiA+IElyYQ0KPiA+DQo+ID4NCj4gPj4N
Cj4gPj4gR3VlbnRlcg0KPiA+Pg0KPiA+Pj4gQWx0ZXJuYXRlbHkgSSB3aWxsIG5lZWQgdG8gZmln
dXJlIG91dCBob3cgdG8gcnVuIHRoZSBzcGFyYyBvbiBxZW11IGhlcmUuLi4NCj4gPj4+DQo+ID4+
PiBUaGFua3MgdmVyeSBtdWNoIGZvciBhbGwgdGhlIHRlc3RpbmcgdGhvdWdoISAgOi1EDQo+ID4+
Pg0KPiA+Pj4gSXJhDQo+ID4+Pg0KPiA+Pj4+Pj4NCj4gPj4+Pj4+IFN0aWxsIHRlc3RpbmcgcHBj
IGltYWdlcy4NCj4gPj4+Pj4+DQo+ID4+Pj4NCj4gPj4+PiBwcGMgaW1hZ2UgdGVzdHMgYXJlIHBh
c3Npbmcgd2l0aCB0aGlzIHBhdGNoLg0KPiA+Pj4+DQo+ID4+Pj4gR3VlbnRlcg0KPiA+Pg0KDQo=
