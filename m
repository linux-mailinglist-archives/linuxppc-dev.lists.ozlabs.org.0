Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC5325F092
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Sep 2020 23:05:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bl3pc5NxqzDqMG
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Sep 2020 07:05:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=alliedtelesis.co.nz (client-ip=2001:df5:b000:5::4;
 helo=gate2.alliedtelesis.co.nz;
 envelope-from=chris.packham@alliedtelesis.co.nz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=alliedtelesis.co.nz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz
 header.a=rsa-sha256 header.s=mail181024 header.b=KOcbkH/V; 
 dkim-atps=neutral
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz
 [IPv6:2001:df5:b000:5::4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bl3mj1pD4zDqJV
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Sep 2020 07:03:49 +1000 (AEST)
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 2485180719;
 Mon,  7 Sep 2020 09:03:48 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
 s=mail181024; t=1599426228;
 bh=QBa830jtUXjIph86rIi5lGJG6AjNPZpvt0RMV5ZNHUI=;
 h=From:To:CC:Subject:Date:References:In-Reply-To;
 b=KOcbkH/VF11n/LNlhYdI1bd/9iQl4QZUwXikYs60mtNHm08d0ZgH+2vYKkT9WYwPn
 Ju43MqLLMtoDzR5YWbwRI9/HG3Uv+pnK53RByWg7tetCDRtffr97Dxi5WtixfFBveV
 RdLhF2Txrk24xbZRap73agjzCffTWxMy1R+73Xp3/Gdu0QiRMBQtfI8zJGWP0qj7Oj
 qN/FQDoY5wc2pIx5o2CNAJbOMV4INjLcm839T8+Rc6XV9WC5+Rb31WsQvX30ij24Uv
 DV6p/5h9HcALRdSixsOOWQR1HmgyaTTjKycPJS7Itm5tdgRxIXn+UUAHRF7waHNzpW
 YcsH+TD7daW1w==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[10.32.16.77]) by
 mmarshal3.atlnz.lc with Trustwave SEG (v7, 5, 8, 10121)
 id <B5f554eb40000>; Mon, 07 Sep 2020 09:03:48 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8)
 by svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with
 Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 7 Sep 2020 09:03:47 +1200
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.006; Mon, 7 Sep 2020 09:03:47 +1200
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: fsl_espi errors on v5.7.15
Thread-Topic: fsl_espi errors on v5.7.15
Thread-Index: AQHWceVnik7XsBYbp0S+yHVGh1hdQak2WMaAgAQdSwCAAz9MAIAAfdcAgAD5u4CAB+sMAIAAYfwAgAA6JQCAAPtUgIAAOXyAgABIbACAAAjRgIABm7wAgAD5+gCABBXPAIAAjqOAgAALRACAAAUXgIAA9CsAgADXoQCAAFDQAIAETfoAgAEj4oCAA2JSAA==
Date: Sun, 6 Sep 2020 21:03:46 +0000
Message-ID: <ee6a85fd-35d3-2adf-02ea-35009749194b@alliedtelesis.co.nz>
References: <1598940515.6e06nwgi0c.astroid@bobo.none>
 <6054f0ec-d994-105b-6399-6cdb65ddd1b6@alliedtelesis.co.nz>
 <CAFSsGVvRMQoEoBN1hpao_4uM1yF2wwuKPbMkAcwFWyE1X8HDbQ@mail.gmail.com>
In-Reply-To: <CAFSsGVvRMQoEoBN1hpao_4uM1yF2wwuKPbMkAcwFWyE1X8HDbQ@mail.gmail.com>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.1.11]
Content-Type: text/plain; charset="utf-8"
Content-ID: <6306C5D7E58A894E995FCB72D9029269@atlnz.lc>
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "paulus@samba.org" <paulus@samba.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

KHJlc2VuZCBhcyBzb21ldGhpbmcgZGVjaWRlZCB0byBpbnNlcnQgaHRtbCwgc29tZSBjb250ZXh0
IHN0cmlwcGVkKQ0KDQpPbiA1LzA5LzIwIDU6MjMgYW0sIEhlaW5lciBLYWxsd2VpdCB3cm90ZToN
Cj4gT24gRnJpIDQuIFNlcCAyMDIwIGF0IDAxOjU4LCBDaHJpcyBQYWNraGFtIA0KPiA8Q2hyaXMu
UGFja2hhbUBhbGxpZWR0ZWxlc2lzLmNvLm56IA0KPiA8bWFpbHRvOkNocmlzLlBhY2toYW1AYWxs
aWVkdGVsZXNpcy5jby5uej4+IHdyb3RlOg0KPg0KPg0KPHNuaXA+DQo+DQo+DQo+ICAgICBJIHRy
aWVkIGZ0cmFjZSBidXQgSSByZWFsbHkgd2Fzbid0IHN1cmUgd2hhdCBJIHdhcyBsb29raW5nIGZv
ci4NCj4NCj4gICAgIENhcHR1cmluZyBhICJiYWQiIGNhc2Ugd2FzIHByZXR0eSB0cmlja3kuIEJ1
dCBJIHRoaW5rIEkndmUNCj4gICAgIGlkZW50aWZpZWQgYQ0KPg0KPiAgICAgZml4IChJJ2xsIHNl
bmQgaXQgYXMgYSBwcm9wZXIgcGF0Y2ggc2hvcnRseSkuIFRoZSBnaXN0IGlzDQo+DQo+DQo+DQo+
ICAgICBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zcGkvc3BpLWZzbC1lc3BpLmMgYi9kcml2ZXJzL3Nw
aS9zcGktZnNsLWVzcGkuYw0KPg0KPiAgICAgaW5kZXggN2U3YzkyY2FmZGJiLi5jYjEyMGI2OGMw
ZTIgMTAwNjQ0DQo+DQo+ICAgICAtLS0gYS9kcml2ZXJzL3NwaS9zcGktZnNsLWVzcGkuYw0KPg0K
PiAgICAgKysrIGIvZHJpdmVycy9zcGkvc3BpLWZzbC1lc3BpLmMNCj4NCj4gICAgIEBAIC01NzQs
MTMgKzU3NCwxNCBAQCBzdGF0aWMgdm9pZCBmc2xfZXNwaV9jcHVfaXJxKHN0cnVjdCBmc2xfZXNw
aQ0KPg0KPiAgICAgKmVzcGksIHUzMiBldmVudHMpDQo+DQo+ICAgICDCoMKgc3RhdGljIGlycXJl
dHVybl90IGZzbF9lc3BpX2lycShzMzIgaXJxLCB2b2lkICpjb250ZXh0X2RhdGEpDQo+DQo+ICAg
ICDCoMKgew0KPg0KPiAgICAgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgZnNsX2VzcGkgKmVzcGkg
PSBjb250ZXh0X2RhdGE7DQo+DQo+ICAgICAtwqDCoMKgwqDCoMKgIHUzMiBldmVudHM7DQo+DQo+
ICAgICArwqDCoMKgwqDCoMKgIHUzMiBldmVudHMsIG1hc2s7DQo+DQo+DQo+DQo+ICAgICDCoMKg
wqDCoMKgwqDCoMKgIHNwaW5fbG9jaygmZXNwaS0+bG9jayk7DQo+DQo+DQo+DQo+ICAgICDCoMKg
wqDCoMKgwqDCoMKgIC8qIEdldCBpbnRlcnJ1cHQgZXZlbnRzKHR4L3J4KSAqLw0KPg0KPiAgICAg
wqDCoMKgwqDCoMKgwqDCoCBldmVudHMgPSBmc2xfZXNwaV9yZWFkX3JlZyhlc3BpLCBFU1BJX1NQ
SUUpOw0KPg0KPiAgICAgLcKgwqDCoMKgwqDCoCBpZiAoIWV2ZW50cykgew0KPg0KPiAgICAgK8Kg
wqDCoMKgwqDCoCBtYXNrID0gZnNsX2VzcGlfcmVhZF9yZWcoZXNwaSwgRVNQSV9TUElNKTsNCj4N
Cj4gICAgICvCoMKgwqDCoMKgwqAgaWYgKCEoZXZlbnRzICYgbWFzaykpIHsNCj4NCj4gICAgIMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNwaW5fdW5sb2NrKCZlc3BpLT5sb2NrKTsN
Cj4NCj4gICAgIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBJUlFfTk9O
RTsNCj4NCj4gICAgIMKgwqDCoMKgwqDCoMKgwqAgfQ0KPg0KPg0KPg0KPiAgICAgVGhlIFNQSUUg
cmVnaXN0ZXIgY29udGFpbnMgdGhlIFRYQ05UIHNvIGV2ZW50cyBpcyBwcmV0dHkgbXVjaCBhbHdh
eXMNCj4NCj4gICAgIGdvaW5nIHRvIGhhdmUgc29tZXRoaW5nIHNldC4gQnkgY2hlY2tpbmcgZXZl
bnRzIGFnYWluc3Qgd2hhdCB3ZSd2ZQ0KPg0KPiAgICAgYWN0dWFsbHkgcmVxdWVzdGVkIGludGVy
cnVwdHMgZm9yIHdlIGRvbid0IHNlZSBhbnkgc3B1cmlvdXMgZXZlbnRzLg0KPg0KPg0KPiBVc3Vh
bGx5IHdlIHNob3VsZG7igJl0IHJlY2VpdmUgaW50ZXJydXB0cyB3ZeKAmXJlIG5vdCBpbnRlcmVz
dGVkIGluLCANCj4gZXhjZXB0IHRoZSBpbnRlcnJ1cHQgaXMgc2hhcmVkLg0KTXkgdGhlb3J5IGlz
IHRoYXQgd2UgZ2V0IGFuIGludGVycnVwdCB0byB0aGUgY29yZSBmb3IgUlhUIGFuZCBhbm90aGVy
IA0KZm9yIERPTi4gV2l0aCB0aGUgY2hhbmdlcyB0byB0aGUgcG93ZXJwYyBpbnRlcnJ1cHQgaGFu
ZGxpbmcgYW5kIHRoZSBmYWN0IA0KdGhhdCBmc2xfZXNwaV9jcHVfaXJxKCkgZG9lc24ndCBhY3R1
YWxseSBsb29rIGF0IHRoZSBzcGVjaWZpYyBldmVudCBiaXRzIA0KbWVhbnMgdGhhdCBzb21ldGlt
ZXMgYm90aCBldmVudHMgYXJlIGhhbmRsZWQgaW4gdGhlIHByb2Nlc3Npbmcgb2YgdGhlIA0KZmly
c3QgaW50ZXJydXB0IGFuZCB0aGUgc2Vjb25kIG9uZSB0cmlwcyB0aGUgU1BJX0RPTiBub3Qgc2V0
IGVycm9yLg0KDQpUaGVyZSdzIGFuIG9sZCBjb21tZW50ICJTUEkgYnVzIHNvbWV0aW1lcyBnb3Qg
bG9zdCBpbnRlcnJ1cHRzLi4uIiB3aGljaCANCm1ha2VzIG1lIHdvbmRlciBpZiB0aGUgaW50ZXJy
dXB0IGhhbmRsaW5nIGNoYW5nZSBoYXMgZml4ZWQgdGhpcyBvcmlnaW5hbCANCnByb2JsZW0uDQoN
Ckkgc3RpbGwgdGhpbmsgdGhlIGNoYW5nZSBtYWtlcyBzZW5zZSByZWdhcmRsZXNzIGJlY2F1c2Ug
dGhlIFNQSUUgDQpyZWdpc3RlciBoYXMgc29tZSBjb3VudGVyIGZpZWxkcyBpbiBpdC4NCg0KPiBU
aGlzIGxlYWRzIHRvIHRoZSBxdWVzdGlvbjogaXMgdGhlIFNQSSBpbnRlcnJ1cHQgc2hhcmVkIHdp
dGggYW5vdGhlciANCj4gZGV2aWNlIG9uIHlvdXIgc3lzdGVtPw0KSXQncyBub3Qgc2hhcmVkIG9u
IGVpdGhlciB0aGUgY3VzdG9tIGJvYXJkIG9yIHRoZSBUMjA4MFJEQi4NCj4gRG8geW91IHNlZSBz
cHVyaW91cyBpbnRlcnJ1cHRzIHdpdGggdGhlIHBhdGNoIHVuZGVyIA0KPiAvcHJvYy9pcnEvKGly
cSkvc3B1cmlvdXM/DQoNClllcyBpdCBsb29rcyBsaWtlIGl0DQoNCltyb290QGxpbnV4Ym94IH5d
IyBjYXQgL3Byb2MvaXJxLzUzL3NwdXJpb3VzDQpjb3VudCAzMTI2DQp1bmhhbmRsZWQgMA0KbGFz
dF91bmhhbmRsZWQgMCBtcw0KDQpbcm9vdEBsaW51eGJveCB+XSMgL2ZsYXNoL2RkX3Rlc3Quc2gN
Cg0KW3Jvb3RAbGludXhib3ggfl0jIGNhdCAvcHJvYy9pcnEvNTMvc3B1cmlvdXMNCmNvdW50IDEw
MTYNCnVuaGFuZGxlZCAwDQpsYXN0X3VuaGFuZGxlZCA0Mjk0NzQ2MTAwIG1zDQoNCltyb290QGxp
bnV4Ym94IH5dIyAvZmxhc2gvZGRfdGVzdC5zaA0KDQpbcm9vdEBsaW51eGJveCB+XSMgY2F0IC9w
cm9jL2lycS81My9zcHVyaW91cw0KY291bnQgODgzOTENCnVuaGFuZGxlZCAwDQpsYXN0X3VuaGFu
ZGxlZCA0Mjk0NzQ2MTAwIG1zDQoNCltyb290QGxpbnV4Ym94IH5dIyAvZmxhc2gvZGRfdGVzdC5z
aA0KDQpbcm9vdEBsaW51eGJveCB+XSMgY2F0IC9wcm9jL2lycS81My9zcHVyaW91cw0KY291bnQg
NzI0NTkNCnVuaGFuZGxlZCAyDQpsYXN0X3VuaGFuZGxlZCA0Mjk0NzU4NjMyIG1zDQo+DQo+DQo+
DQo+ICAgICBJJ3ZlIHRlc3RlZCB0aGlzIG9uIHRoZSBUMjA4MFJEQiBhbmQgb24gb3VyIGN1c3Rv
bSBoYXJkd2FyZSBhbmQgaXQNCj4gICAgIHNlZW1zDQo+DQo+ICAgICB0byByZXNvbHZlIHRoZSBw
cm9ibGVtLg0KPg0KPg0KPg==
