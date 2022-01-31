Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3EF4A3ECB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Jan 2022 09:44:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JnM6v0jsqz3cBW
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Jan 2022 19:44:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazon201209 header.b=FligwSrc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=amazon.com (client-ip=207.171.190.10;
 helo=smtp-fw-33001.amazon.com; envelope-from=prvs=023802125=benh@amazon.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256
 header.s=amazon201209 header.b=FligwSrc; 
 dkim-atps=neutral
Received: from smtp-fw-33001.amazon.com (smtp-fw-33001.amazon.com
 [207.171.190.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JnGSl0hP4z2xt0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Jan 2022 16:14:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1643606055; x=1675142055;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=sYezgLX++Ilm0+TT6roWXiPSazQDCgKINxx+amJpcWE=;
 b=FligwSrc92cRqAteRwforkKdUquo+kGY59bj8iFJCQBDDNK971Hfmh6U
 YbS531YzCv6jscxqqllq9ToHotGlhDQ+xeSm4R4s6I5TrJcsiv8045faI
 0xzdferTdGU+kGMiG5gfYFmYKKAnycbDatvx3fELjYJ5I0y7HT4KgmdlC c=;
X-IronPort-AV: E=Sophos;i="5.88,330,1635206400"; d="scan'208";a="172974595"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-iad-1d-8ac79c09.us-east-1.amazon.com) ([10.43.8.2])
 by smtp-border-fw-33001.sea14.amazon.com with ESMTP; 31 Jan 2022 05:12:57 +0000
Received: from EX13MTAUWB001.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
 by email-inbound-relay-iad-1d-8ac79c09.us-east-1.amazon.com (Postfix) with
 ESMTPS id 6D24480B3C; Mon, 31 Jan 2022 05:12:55 +0000 (UTC)
Received: from EX13D21UWB002.ant.amazon.com (10.43.161.177) by
 EX13MTAUWB001.ant.amazon.com (10.43.161.249) with Microsoft SMTP Server (TLS)
 id 15.0.1497.28; Mon, 31 Jan 2022 05:12:54 +0000
Received: from EX13D21UWB003.ant.amazon.com (10.43.161.212) by
 EX13D21UWB002.ant.amazon.com (10.43.161.177) with Microsoft SMTP Server (TLS)
 id 15.0.1497.28; Mon, 31 Jan 2022 05:12:54 +0000
Received: from EX13D21UWB003.ant.amazon.com ([10.43.161.212]) by
 EX13D21UWB003.ant.amazon.com ([10.43.161.212]) with mapi id 15.00.1497.028;
 Mon, 31 Jan 2022 05:12:54 +0000
From: "Herrenschmidt, Benjamin" <benh@amazon.com>
To: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "luke.leighton@gmail.com" <luke.leighton@gmail.com>, "lkcl@lkcl.net"
 <lkcl@lkcl.net>, "npiggin@gmail.com" <npiggin@gmail.com>,
 "libre-soc-dev@lists.libre-soc.org" <libre-soc-dev@lists.libre-soc.org>,
 "openpower-hdl-cores@mailinglist.openpowerfoundation.org"
 <openpower-hdl-cores@mailinglist.openpowerfoundation.org>
Subject: Re: [OpenPOWER-HDL-Cores] microwatt booting linux-5.7 under verilator
Thread-Topic: [OpenPOWER-HDL-Cores] microwatt booting linux-5.7 under verilator
Thread-Index: AQHYFmEzi+xyDaan+UC2lQvsqU8GqQ==
Date: Mon, 31 Jan 2022 05:12:54 +0000
Message-ID: <926247767e2ac3b59ad918508ba78bf14569fde1.camel@amazon.com>
References: <CAPweEDw710zFK8KLZY5gsQxEkQKrDiFkNRgABY9HJZ1rxpeVCg@mail.gmail.com>
 <1643598916.2hjoqtw60c.astroid@bobo.none>
 <994E627C-0194-4634-8DBC-0845493E6744@gmail.com>
In-Reply-To: <994E627C-0194-4634-8DBC-0845493E6744@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.162.55]
Content-Type: text/plain; charset="utf-8"
Content-ID: <73F08B28B723854F98483B65843D3C24@amazon.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 31 Jan 2022 19:43:31 +1100
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gTW9uLCAyMDIyLTAxLTMxIGF0IDA0OjE5ICswMDAwLCBsa2NsIHdyb3RlOg0KPiA+IEhvdyBk
byB5b3UgZXZlbiByZWFkIHRoZSBTWVNDT04gcGFyYW1ldGVyIGZvciBmcmVxdWVuY3k/DQo+IA0K
PiANCj4gU1lTQ09OIGlzIGp1c3QgYSB0ZXJtIGZvciBhIG1lbW9yeS1tYXBwZWQgd2lzaGJvbmUg
Uk9NIHdoaWNoIGNvbnRhaW5zDQo+IGEgY3J1ZGUgZWFzaWx5LWRlY29kZWQgYmluYXJ5IGZvcm0g
b2YgZGV2aWNldHJlZS4NCg0KVGFsa2luZyBvZiB3aGljaCwgaWYgd2UncmUgZ29pbmcgdG8gbWFr
ZSB1c2UgaWYgaXQgKHdlIHNob3VsZCksIHdlDQpwcm9iYWJseSBuZWVkIHRvIGVuc3VyZSBpdCdz
IGFsc28gcG9ydGVkIHRvIG1pY3Jvd2F0dCBvbiBMaXRlWC4gVGhvdWdoDQpMaXRlWCBoYXMgYW5v
dGhlciBpc3N1ZSBpbiB0aGF0IGl0IHB1dHMgTU1JTyBlbHNld2hlcmUgaWlyYy4NCg0KVGhhdCBv
ciB3ZSByZWx5IDEwMCUgb24gTGl0ZVggaGF2aW5nIGEgZ29vZCBEVCAoYW5kIHRodXMgdXNlIGEN
CmRpZmZlcmVudCBwbGF0Zm9ybSBmb3IgaXQpLg0KPiANCj4gd2hlbiB5b3UgcmVhZCAweGMwMDAx
MDAwIChzYXkpIGl0cyBjb250ZW50cyB0ZWxsIHlvdSB0aGUgY2xvY2sgc3BlZWQuDQo+IA0KPiAN
Cj4gDQo+IGF0IDB4YzAwMDEwMDggaXMgdGhlIG51bWJlciBvZiBVQVJUcy4NCj4gDQo+IDB4YzAw
MDEwMTAgY29udGFpbnMgdGhlIFVBUlQwIHNwZWVkIG9yIHdlbGwgeW91IGNhbiBzZWUgdGhlIHJl
YWwNCj4gY29udGVudHMgc3lzY29uLnZoZGwNCj4gDQo+IA0KPiANCj4gaXQgaXMgX3JlYWxfIGJh
c2ljIGJ1dCBjb250YWlucyBldmVyeXRoaW5nIHRoYXQNCj4gDQo+IGEgY29sZC1zdGFydCBCSU9T
IG5lZWRzIHRvIGtub3csIHN1Y2ggYXMgImRvIGkgZXZlbiBoYXZlIERSQU0sIGRvIGkNCj4gaGF2
ZSBhbiBTUEkgRmxhc2ggaSBjYW4gcmVhZCBhIHNlY29uZA0KPiANCj4gc3RhZ2UgYm9vdGxvYWRl
ciBmcm9tIiBldGMgZXRjDQo+IA0KPiANCj4gDQo+IGh0dHBzOi8vZ2l0aHViLmNvbS9hbnRvbmJs
YW5jaGFyZC9taWNyb3dhdHQvYmxvYi9tYXN0ZXIvc3lzY29uLnZoZGwNCj4gDQo+IA0KPiANCj4g
UGF1bCBzYWlkIGl0IHdhcyBhbHdheXMgcGxhbm5lZCB0byBkbyByZWFkaW5nIG9mIHRoZXNlIHBh
cmFtcywgdGhlDQo+IGVudHJpZXMgaW4gZGV2aWNldHJlZSBhcmUgYSB0ZW1wb3JhcnkgaGFjay4N
Cj4gDQo+IA0KPiANCj4gbC4NCj4gDQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fDQo+IA0KPiBPcGVuUE9XRVItSERMLUNvcmVzIG1haWxpbmcgbGlzdA0K
PiANCj4gT3BlblBPV0VSLUhETC1Db3Jlc0BtYWlsaW5nbGlzdC5vcGVucG93ZXJmb3VuZGF0aW9u
Lm9yZw0KPiANCj4gaHR0cDovL2xpc3RzLm1haWxpbmdsaXN0Lm9wZW5wb3dlcmZvdW5kYXRpb24u
b3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnBvd2VyLWhkbC1jb3Jlcw0K
