Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6518E2413FC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Aug 2020 01:59:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BQXxf1qPjzDqSZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Aug 2020 09:59:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rambus.com (client-ip=216.205.24.148;
 helo=us-smtp-delivery-148.mimecast.com; envelope-from=pvanleeuwen@rambus.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=rambus.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rambus.com header.i=@rambus.com header.a=rsa-sha256
 header.s=mimecast20161209 header.b=N6eKpLdY; 
 dkim=pass (1024-bit key) header.d=rambus.com header.i=@rambus.com
 header.a=rsa-sha256 header.s=mimecast20161209 header.b=Gh9mpMZG; 
 dkim-atps=neutral
X-Greylist: delayed 67 seconds by postgrey-1.36 at bilbo;
 Tue, 11 Aug 2020 07:39:14 AEST
Received: from us-smtp-delivery-148.mimecast.com
 (us-smtp-delivery-148.mimecast.com [216.205.24.148])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BQTr20tVczDqGF
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Aug 2020 07:39:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rambus.com;
 s=mimecast20161209; t=1597095550;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gVHUBHeCKkJaUDRIPfd4sS6m//pNDe/Jm9pq2CRDcd8=;
 b=N6eKpLdYjY80PjMA/3E6uncb3QALBdXrY7Zu/ijR3w5rKRHRvvms6+A2dxtfrd6gGp1NB4
 LOc6zQ4C8zPwg9lMwc72DscMgZee+WBLMYapreMhVespk8Rh6IHwHFPwQC0RcE+GNrvAD+
 jNrR5Hf6kvYo4b8EppYwk0mMR/s6T0E=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rambus.com;
 s=mimecast20161209; t=1597095551;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gVHUBHeCKkJaUDRIPfd4sS6m//pNDe/Jm9pq2CRDcd8=;
 b=Gh9mpMZG6KHw+l/hWaXECfxFrciEYTnqNPkBauadZLH9UP94VIEzhfEg4+I0TekGnT8CQp
 XUV/C7mqS0JuP6uc0okpWbHiGR5gmxjL4zIaE+lV683bYOFM+u1u3/wgqbecOoBJo6Jkrm
 gLsrOApO9DY89n5z5kFNysyQmxRXTlA=
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2044.outbound.protection.outlook.com [104.47.51.44]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 us-mta-215-qxPfULz_NWySIIJJWanSQQ-1; Mon, 10 Aug 2020 17:37:56 -0400
X-MC-Unique: qxPfULz_NWySIIJJWanSQQ-1
Received: from CY4PR0401MB3652.namprd04.prod.outlook.com
 (2603:10b6:910:8a::27) by CY4PR04MB3720.namprd04.prod.outlook.com
 (2603:10b6:903:e5::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.20; Mon, 10 Aug
 2020 21:37:50 +0000
Received: from CY4PR0401MB3652.namprd04.prod.outlook.com
 ([fe80::a0ee:e26e:64fc:61b2]) by CY4PR0401MB3652.namprd04.prod.outlook.com
 ([fe80::a0ee:e26e:64fc:61b2%3]) with mapi id 15.20.3261.023; Mon, 10 Aug 2020
 21:37:50 +0000
From: "Van Leeuwen, Pascal" <pvanleeuwen@rambus.com>
To: =?utf-8?B?SG9yaWEgR2VhbnTEgw==?= <horia.geanta@nxp.com>, Herbert Xu
 <herbert@gondor.apana.org.au>
Subject: RE: [PATCH 19/22] crypto: inside-secure - add check for xts input
 length equal to zero
Thread-Topic: [PATCH 19/22] crypto: inside-secure - add check for xts input
 length equal to zero
Thread-Index: AQHWbNc/iDlrjFSjSECEGLk+jBQoDKkxJAfggAA7LACAAA2YgIAAcKtA
Date: Mon, 10 Aug 2020 21:37:50 +0000
Message-ID: <CY4PR0401MB36527830624AD214E801BE53C3440@CY4PR0401MB3652.namprd04.prod.outlook.com>
References: <20200807162010.18979-1-andrei.botila@oss.nxp.com>
 <20200807162010.18979-20-andrei.botila@oss.nxp.com>
 <CY4PR0401MB36528610C3ABF802F8CBF35FC3440@CY4PR0401MB3652.namprd04.prod.outlook.com>
 <20200810134500.GA22914@gondor.apana.org.au>
 <fd3e5862-3357-7dfc-6c75-30086ab19f82@nxp.com>
In-Reply-To: <fd3e5862-3357-7dfc-6c75-30086ab19f82@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [89.220.222.106]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 67080066-10ee-45b2-29e6-08d83d75a184
x-ms-traffictypediagnostic: CY4PR04MB3720:
x-microsoft-antispam-prvs: <CY4PR04MB3720DD2069116A5AD4932C39C3440@CY4PR04MB3720.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AyCKpE7ZRcxayWpI3m6U0tGaZFY8jZad36j2/9C7cwTQZxi7hUVUdcbVxQaOMrBHnonEywCqJf6U83Nf37fvadDnU2A7jLfeKZhPJ2YGcuR8BmaP8Ui7I5klUxoFOvVRT5OYXC1KoNSE6AotRbtD5OrGb9eaR7Qf9GM3k9ExuaFXJjxKdslmrGh1jkTbYqJvXQOd2kLJDxLyLlZpjIlOxLjQRcU2+YPfDz5kANq3yyZNxfHn2hnXvcP9bH39n0j4eZNqGrmy2kpIQc51MpCllBWm2dYzMcZtQf0nLvH2J6Fg2VJE1CtwteQf44bV9OBFchZHuiDcpeNUVg/lpzP9ZA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR0401MB3652.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(396003)(39840400004)(136003)(376002)(346002)(366004)(186003)(2906002)(71200400001)(53546011)(6506007)(33656002)(7416002)(26005)(316002)(4326008)(7696005)(83380400001)(8936002)(86362001)(64756008)(66556008)(66476007)(52536014)(8676002)(66446008)(66946007)(76116006)(55016002)(110136005)(54906003)(9686003)(5660300002)(478600001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: R4O0anq/O7I+BfEbT8iz5IIfTyLON0AKQZ2EBDpYIIJ4ye56MPEapQcPfRoFJ1YMB17XuCVwsGXKmjP5WSudCEa2etCR9oxc2BwvnIpUBkqoeomo6L6mDr5uwxKT3bSBYDn9z46QgWEMFMlOnt6EiF6ZaF0p66Np9bsAr4rSowV5Clnec/LHmA3DNIeaZFzyiUW/rP7REGzumCZs34c52fHfsGp5iy5B3yLTufTAd7n7ff64lkA82GamBKyUq+BmovFzpX094bJwt/jVnP/Vu3mtvhUtvPILQ46mgammvOZZhuCS58ct1Yzkm7nnD8POanLfnq4or07b/Mffe420/fl5cX9mDSoPXPCasTfU6NMcss/GYT5fv2QKi84MGBPVCOV/lZeiegYof8HY5AIQ03uwUrTJ7TdLiV/8S/JzhZia98B/LQFEprmfFbaZQBowj6zrCcWvAoOdIktO5DlRH63T3+TzyqBZOVW5NVdfDHTFZieVfOpz4OuAnebd6UZoV+DDxOGhLMxo02p8c2EkYA6lv8DyvdYqKEVu8ETYmiSbt/lehByzlfzS9py0ICeZuy5mSDQwAtnuaPWLL+gsf/b5vBt7vvXQ3Xev7Sc2YQmsZatvbWlYXDly156TXuSQhBT3JZTO1HLaq9lqLT1byQ==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: rambus.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR0401MB3652.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67080066-10ee-45b2-29e6-08d83d75a184
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2020 21:37:50.1987 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bd0ba799-c2b9-413c-9c56-5d1731c4827c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HIIjV8lsOpVf79jH31+x4RrCvKAk5xZX4QyAASDzzEo59zMAZBd3NGlIg9/3fmNzMtev5jTlF9Ljd0PlzEu6Cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB3720
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA48A24 smtp.mailfrom=pvanleeuwen@rambus.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: rambus.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
X-Mailman-Approved-At: Tue, 11 Aug 2020 09:50:46 +1000
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
Cc: "Andrei Botila \(OSS\)" <andrei.botila@oss.nxp.com>,
 Andrei Botila <andrei.botila@nxp.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 Antoine Tenart <antoine.tenart@bootlin.com>, "x86@kernel.org" <x86@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@axis.com" <linux-arm-kernel@axis.com>,
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBIb3JpYSBHZWFudMSDIDxob3Jp
YS5nZWFudGFAbnhwLmNvbT4NCj4gU2VudDogTW9uZGF5LCBBdWd1c3QgMTAsIDIwMjAgNDozNCBQ
TQ0KPiBUbzogSGVyYmVydCBYdSA8aGVyYmVydEBnb25kb3IuYXBhbmEub3JnLmF1PjsgVmFuIExl
ZXV3ZW4sIFBhc2NhbCA8cHZhbmxlZXV3ZW5AcmFtYnVzLmNvbT4NCj4gQ2M6IEFuZHJlaSBCb3Rp
bGEgKE9TUykgPGFuZHJlaS5ib3RpbGFAb3NzLm54cC5jb20+OyBEYXZpZCBTLiBNaWxsZXIgPGRh
dmVtQGRhdmVtbG9mdC5uZXQ+OyBsaW51eC1jcnlwdG9Admdlci5rZXJuZWwub3JnOyBsaW51eC0N
Cj4gYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJu
ZWwub3JnOyBsaW51eHBwYy1kZXZAbGlzdHMub3psYWJzLm9yZzsgbGludXgtczM5MEB2Z2VyLmtl
cm5lbC5vcmc7DQo+IHg4NkBrZXJuZWwub3JnOyBsaW51eC1hcm0ta2VybmVsQGF4aXMuY29tOyBB
bmRyZWkgQm90aWxhIDxhbmRyZWkuYm90aWxhQG54cC5jb20+OyBBbnRvaW5lIFRlbmFydCA8YW50
b2luZS50ZW5hcnRAYm9vdGxpbi5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMTkvMjJdIGNy
eXB0bzogaW5zaWRlLXNlY3VyZSAtIGFkZCBjaGVjayBmb3IgeHRzIGlucHV0IGxlbmd0aCBlcXVh
bCB0byB6ZXJvDQo+DQo+IDw8PCBFeHRlcm5hbCBFbWFpbCA+Pj4NCj4gT24gOC8xMC8yMDIwIDQ6
NDUgUE0sIEhlcmJlcnQgWHUgd3JvdGU6DQo+ID4gT24gTW9uLCBBdWcgMTAsIDIwMjAgYXQgMTA6
MjA6MjBBTSArMDAwMCwgVmFuIExlZXV3ZW4sIFBhc2NhbCB3cm90ZToNCj4gPj4NCj4gPj4gV2l0
aCBhbGwgZHVlIHJlc3BlY3QsIGJ1dCB0aGlzIG1ha2VzIG5vIHNlbnNlLg0KPiA+DQo+ID4gSSBh
Z3JlZS4gIFRoaXMgaXMgYSBsb3Qgb2YgY2h1cm4gZm9yIG5vIGdhaW4uDQo+ID4NCj4gSSB3b3Vs
ZCBzYXkgdGhlIGdhaW4gaXMgdGhhdCBhbGwgc2tjaXBoZXIgYWxnb3JpdGhtcyB3b3VsZCBiZWhh
dmUgdGhlIHNhbWUNCj4gd2hlbiBpbnB1dCBsZW5ndGggZXF1YWxzIHplcm8gLSBpLmUuIHRyZWF0
IHRoZSByZXF1ZXN0IGFzIGEgbm8tb3AuDQo+DQpYVFMgYWxyZWFkeSBiZWhhdmVzIGRpZmZlcmVu
dGx5IGJlY2F1c2UgaXQgY2FuIGFjY2VwdCBhbnkgYnl0ZSBhbW91bnQgYXMgbG9uZw0KYXMgaXQg
aXMgbm90IGluIHRoZSByYW5nZSAwIC0xNi4gU28gZmFyLCB5b3UgZ290IGFuIEVJTlZBTCBlcnJv
ciBmb3IgbGVuZ3RocyA8IDE2Lg0KVGhlIHNwZWNpYWwgZXhjZXB0aW9uIG9uIHRvcCBvZiB0aGF0
IGZvciBsZW5ndGggMCBkb2VzIG5vdCBpbXByb3ZlIGFueXRoaW5nLg0KDQpUcmVhdGluZyBhIHJl
cXVlc3Qgb2YgbGVuZ3RoIDAgYXMgYSBuby1vcCBpcyBub3QgYSB1c2VmdWwgZmVhdHVyZSBoZXJl
LCBhcyB0aGVyZQ0KaXMgbm8gdXNlIGNhc2Ugd2hlcmUgdGhhdCB3b3VsZCBtYWtlIHNlbnNlLiBY
VFMgZW5jcnlwdHMgYmxvY2tzICh1c3VhbGx5IGRpc2sNCnNlY3RvcnMpLCBhbmQgY2Fubm90IGJl
IGNoYWluZWQuIFNvIGFuIGF0dGVtcHQgdG8gZW5jcnlwdCBhIHplcm8gbGVuZ3RoIGJsb2NrDQpp
cyBtb3N0IGNlcnRhaW5seSBzb21lIGtpbmQgb2YgZXJyb3IgKGUuZy4gdHJ5aW5nIHRvIHVzZSBY
VFMgZm9yIHNvbWV0aGluZyBpdA0Kd2FzIG5vdCBkZXNpZ25lZCB0byBkbyAtIGJpZyBzZWN1cml0
eSBtaXN0YWtlISkuDQoNCj4gV2UgY2FuJ3Qgc2F5ICJubyBpbnB1dCIgaGFzIGFueSBtZWFuaW5n
IHRvIHRoZSBvdGhlciBza2NpcGhlciBhbGdvcml0aG1zLA0KPiBidXQgdGhlIGNvbnZlbnRpb24g
aXMgdG8gYWNjZXB0IHRoaXMgY2FzZSBhbmQganVzdCByZXR1cm4gMC4NCj4gSSBkb24ndCBzZWUg
d2h5IFhUUyBoYXMgdG8gYmUgaGFuZGxlZCBkaWZmZXJlbnRseS4NCj4NCkkgZG9uJ3Qgc2VlIHdo
eSB5b3Ugd291bGQgYmxpbmRseSBmb2xsb3cgc29tZSBoaXN0b3JpY2FsIGNvbnZlbnRpb24gLi4u
DQp1bmxlc3MgbWF5YmUgdGhlcmUgd2FzIHNvbWUgZXhpc3RpbmcgcmVhbCB1c2UgY2FzZSB0aGF0
IHdvdWxkIGJlbmVmaXQ/DQoNCkJUVzogZm9yIGdlbmVyaWMgY2lwaGVycyBJIGNvdWxkIHRoaW5r
IG9mIHNvbWUgdXNlIGNhc2VzIHdoZXJlIHRoZSB6ZXJvDQpsZW5ndGggcmVxdWVzdCBiZWluZyBh
IG5vLW9wIG1ha2VzIHNlbnNlIGlmIHRoZSBhcHBsaWNhdGlvbiBkb2VzIG5vdA0KYm90aGVyIHRv
IGNoZWNrIGhvdyBtdWNoIGRhdGEgaXQgaGFzIGdhdGhlcmVkIHRvIHByb2Nlc3MgKHdoaWNoIG1h
eSBiZQ0Kbm90aGluZyksIGJ1dCBJIGNhbid0IHNlZSBob3cgdGhpcyBjb3VsZCBhcHBseSB0byBY
VFMsIGJlaW5nIGJsb2NrLWJhc2VkLg0KDQo+IFRoYW5rcywNCj4gSG9yaWENCg0KUmVnYXJkcywN
ClBhc2NhbCB2YW4gTGVldXdlbg0KU2lsaWNvbiBJUCBBcmNoaXRlY3QgTXVsdGktUHJvdG9jb2wg
RW5naW5lcywgUmFtYnVzIFNlY3VyaXR5DQpSYW1idXMgUk9UVyBIb2xkaW5nIEJWDQorMzEtNzMg
NjU4MTk1Mw0KDQpOb3RlOiBUaGUgSW5zaWRlIFNlY3VyZS9WZXJpbWF0cml4IFNpbGljb24gSVAg
dGVhbSB3YXMgcmVjZW50bHkgYWNxdWlyZWQgYnkgUmFtYnVzLg0KUGxlYXNlIGJlIHNvIGtpbmQg
dG8gdXBkYXRlIHlvdXIgZS1tYWlsIGFkZHJlc3MgYm9vayB3aXRoIG15IG5ldyBlLW1haWwgYWRk
cmVzcy4NCg0KDQoqKiBUaGlzIG1lc3NhZ2UgYW5kIGFueSBhdHRhY2htZW50cyBhcmUgZm9yIHRo
ZSBzb2xlIHVzZSBvZiB0aGUgaW50ZW5kZWQgcmVjaXBpZW50KHMpLiBJdCBtYXkgY29udGFpbiBp
bmZvcm1hdGlvbiB0aGF0IGlzIGNvbmZpZGVudGlhbCBhbmQgcHJpdmlsZWdlZC4gSWYgeW91IGFy
ZSBub3QgdGhlIGludGVuZGVkIHJlY2lwaWVudCBvZiB0aGlzIG1lc3NhZ2UsIHlvdSBhcmUgcHJv
aGliaXRlZCBmcm9tIHByaW50aW5nLCBjb3B5aW5nLCBmb3J3YXJkaW5nIG9yIHNhdmluZyBpdC4g
UGxlYXNlIGRlbGV0ZSB0aGUgbWVzc2FnZSBhbmQgYXR0YWNobWVudHMgYW5kIG5vdGlmeSB0aGUg
c2VuZGVyIGltbWVkaWF0ZWx5LiAqKg0KDQpSYW1idXMgSW5jLjxodHRwOi8vd3d3LnJhbWJ1cy5j
b20+DQo=

