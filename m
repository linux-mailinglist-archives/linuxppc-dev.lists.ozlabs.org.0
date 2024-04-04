Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 20026898147
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Apr 2024 08:15:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=L7plnaXP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V9BFP6Lhzz3vZy
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Apr 2024 17:15:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=L7plnaXP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:c207::1; helo=mrzp264cu002.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from MRZP264CU002.outbound.protection.outlook.com (mail-francesouthazlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c207::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V9BDN452wz3vYT
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Apr 2024 17:15:00 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EQ7//xz4FZT1MBGTcywgGix5y4dXgL0ehdAxIesxq4oX8NffP7CSbknKC9oOzppLbpt3laWbVx/wZoSDlYQHbv9lbaMXhnIxjyjbQCQleynTUpWT2RLpg+2FbtanSuCSt8LVVAnOHwwSwgKyxZ7MEG5N0i2JxCQ4d5U4k0j/0fWDKvNPXV4qqqHGJ25ofF5Vqhi0hru2kgFzoAw+1YYpzRCwltCJCCSJL3VyvhkZqzilRrWLIxDKbR8C1Pkq7QL4MGUE3znnWvWsd35xBIt+ECAfb66d9XsSQwyk6U/DS6RPiVjMXAeq4NV4U2ZcldbEnne/XKhLXHiAddOX0NMb0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W/Dp43bjuP/u4mHX3lRrwp1hEHrI5IxKixN816KARSU=;
 b=ZsINZXyT0yqnS4ayTmVYUuzdZ33l4QhY7v4/qhXU4IOzKoYkCeLprbb07Oa/XWCr3P2q5rr+qre4wst8WJLu8YP3hWi2iG/IzAV7CmQfwFz8IHMOHga9QhMc8Jlqo1Ju0x3SB0p+gL0cWPXLCUYxbpZ+S0IZK/JpuydCXGFG4LzO0tJ5L35kyTeyex5Us8sLkkdeqWqTJB6WOVq3m8jepE4momGWNijY9l/sFJ/d6DLrUWqmP7zxPMOEq06j7Fuf85KzC1R0jCKKbk2HRwvaYFmvWOesu9a3jMcAJUlEk5TTiNZlwEjIeEQ3XLFxB10LWHrsJyvGcRyjHog8Du8tdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W/Dp43bjuP/u4mHX3lRrwp1hEHrI5IxKixN816KARSU=;
 b=L7plnaXPJhsbNN1HGXX55X5puI1cxxHurnOCKd1q0wufinxIwd1W2cbjX9/BFcVpgAi7CyM2PZiPwnpu5ploeMK+ERIynfbW4NOvof+5oT9XXkPdi9WonpN3RlrqW8MAcYewmcaurH3NDC4ySDWoMzufOAA7A5IDdgPQDIY21iPJ+VROGjUECJT2HXUTTjh45jGUaP3XWzlBFbtLcF0N8dExs0fLKOqudyYCUrGXcOMk8iuN70occtxBujT+TLP+v4JCYTbh+Zc7iivYhvS5UtxDxjNkh+FM3Dm+thWYj0hPa+wbyd7Yr5GxI9eKRcTi5TOOdoMKs5X8kvnVUaCKlw==
Received: from MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3d::7) by
 PAZP264MB2575.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f1::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.46; Thu, 4 Apr 2024 06:14:38 +0000
Received: from MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2e47:cba6:3e12:e310]) by MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2e47:cba6:3e12:e310%4]) with mapi id 15.20.7409.042; Thu, 4 Apr 2024
 06:14:38 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Rohan McLure <rmclure@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 1/2] powerpc: Apply __always_inline to
 interrupt_{enter,exit}_prepare()
Thread-Topic: [PATCH 1/2] powerpc: Apply __always_inline to
 interrupt_{enter,exit}_prepare()
Thread-Index: AQHahksFKk6zJQcTSEeZgfMXxWjrArFXoigA
Date: Thu, 4 Apr 2024 06:14:38 +0000
Message-ID: <546bcb92-91c7-4017-a125-9e100967ff4d@csgroup.eu>
References: <20240404044535.642122-2-rmclure@linux.ibm.com>
In-Reply-To: <20240404044535.642122-2-rmclure@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MR1P264MB2980:EE_|PAZP264MB2575:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  IWGpWlrQ4U3CVih3hGNX4L9JG9H5YLpkunAf2q73j+HD0eThgdElsRFDLAClNEEodeOLMKPbQou4lqEDphWkLdN607S9pkvyza4xbWQAxAC8nnqd4SkomBEeljoKJKbBlbsjPlTwqC0xKRWdoQ5+z0qATHVMMGtU3flRR1jDtn6VgYNBKQ8XQLPHBDK3CeEa+iO0WHj2Y3V84jCTGz7at2b8wHFjlIwpzfg1naJUV1OWdvf1Y4ZxfwHEWlD1ijKJDuQD8v/sH3ln5CCYv3ExQ6/ujA00sem4zxM749pwn/AjTu1+QPRwTKzc2KOqUPvzE/53M+u6GQaQpcCoDHmhR5PKq/1FNUVaIgnUdEyZfYKT6/6wgesCLiKGMPR4abvp06ob8gBJR37DdYJFfpO0Qe/XsErIZoIEw5y8BYh9rfBHF8bibXjVFPyfW2DOGtnsk6Eg0WoXazxCm5wWn4t/K61FOwiITJWX6T5hPrVFVBmAj98Mi4T917L26xULbQfRh7tJKaomRqptvr8XHIzevrH1nK0IZ2qiX9gGf2cKff+aHWJaqtUXS9ACi2iKdPtyqM/1NKJ9BMT/XXX6n6j9Wlgvqh4MJFuzOdXC6YY754IkVMj6XpN3u+hoA9IzcDzowhDb93gIp/Kdz8zR83Go90wYa5MLVcVozIPeIBBhL/I=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?VVBZY2kramN6WkNpNmllTDZHOWU1RWkrckdDaWlvU1Rad1FoSTc1SnJFRFR6?=
 =?utf-8?B?SWIyVlhBMVNNY0pCWHU0NWt0dlRuQ3FBL3lVSFFvQ016OFNFaWNoSFlEaXBV?=
 =?utf-8?B?RS9WOEZIY09GeWttQVpsOEZLRzJ1cHl2OFVXbkl2T25IYi9GSERKM3EvSURy?=
 =?utf-8?B?QVRVTlgyTC84Y3FtL05vN29IUmxXZ2JYSjFaSk1adHhUejllQzh5ZWtHUmFp?=
 =?utf-8?B?cU9TYVNXakIwZkp2QVJheGQvTHZtYUl0Zkc5cFlHdEhicjdSUmJORHBPaCtG?=
 =?utf-8?B?MzJTUm5FZHNTQWFBcjI3cjRBNFNiaGVSeDZQYldHSCswWmVXRmFIR0tBcUdH?=
 =?utf-8?B?UXdpeWUwZk41aTQ5M3ZIMzNvcW9yb2ZIVGs2WnlLV1pESXcxblZ2Sy9OOVlk?=
 =?utf-8?B?ZytFQ2RIWmswSlY0dFNucWRCWnVUeDZiMUtrUG04Y2NtSHBHcGZKQzlwSkpN?=
 =?utf-8?B?dnlUV3FYdis4RXJRL1hjVi9MQWxkVnh2T1A3VkNPZktxOU5QRUpSOXd2YUNx?=
 =?utf-8?B?M3FEQXNtN1JtcGpiTlJOYUd1d3l2cWdNNElLam1qNXlhM2EwM0hHR3d2aDZr?=
 =?utf-8?B?ZUNwdExpQ3pDZGJQTXdQQmMxZ21maVN2STlNNUNpQlZiT1NVVjgzTVk3a1Ru?=
 =?utf-8?B?ejFaaFJKNWYwbVQ4YzhhblpmRDNEYUdWMEVCMmRiVmV1aE8wRUJ3eEVyZDNE?=
 =?utf-8?B?UlRZOEV3L3QvMnBLejc4Nk5MRVNLMGN6aFZobXdiN1hUbGcwQml2YW9ZZ2xm?=
 =?utf-8?B?S0dTOXBSM3JGNXVxajdpUy9vL3FNWU9rcEhGaFJVZVpIVjAwY1VITml2UC80?=
 =?utf-8?B?SUlaNkVwRnY5VUNweENWUk5JZEsyRzB6cnBTN3JHazA3NjJNNEdyOENyUEtQ?=
 =?utf-8?B?dE9HQjMvbDd4L3B6L1JtSTY2MU5XQmtjTk1QRWE0Y3NsRmE2SkhVN05sc2hQ?=
 =?utf-8?B?SU9QYUlGNVdXUTBFTTNuaDNUZnQ4MTVFZDF5ZXJibjJHbWNSZkM4ajk3YUxs?=
 =?utf-8?B?WFE1bElrZDlzRlROUFZxSVNJa2luRDdrbFJWQkNacjdCek4xYVh4QWNPcTdY?=
 =?utf-8?B?Mld0YzZONzBkbFIrbytEclNhbTBmc0J4YjNkS0MweXdZcElreVpROTdvcmda?=
 =?utf-8?B?ZUQxUkpFTGdUcWFHbTViSmYvV1R0R3ZCckc3UHB0UExJRzEvOWlPTmFydmxp?=
 =?utf-8?B?RGs2d0FzbzljT2VyMk5WZnd6VGJvQVJMS3g4cnVnQzlhNGJJYkM4VEtrR2l4?=
 =?utf-8?B?V21BZ1F3MndHZGN2UTFFZGdUQ2p4Tm0valE4M0FCaUJBaUM5UDFSb0o0K0hm?=
 =?utf-8?B?TmRjaVplSENTODJHZmJmbGpnQzJaUXk0cDRjUnBnNkdoZ0JIZnA0ZmZSU3p0?=
 =?utf-8?B?V3c3ZFhhaEQ5eFF0NHJBaWU3Q085bW44SUo0dXkvNGdGak5qWFRQdk9iWmNL?=
 =?utf-8?B?czF4RDZadHluWldVWFQ0dGgzZmk1Rng4dDNaOWhoTjlpaWVnYkoxVWZhcTRP?=
 =?utf-8?B?aXhrS1RFT1VEaGlFOTZLL2lIN1EwTnNkLzhBRkNLTEVLbS9HVTRlamY3Wm9L?=
 =?utf-8?B?dUZxSWtDTWJ1MFd6S25FK1FwVjB5dXlIbEtxeCs5Y3NybzlqcEVBQlZWR081?=
 =?utf-8?B?Qmduc0FzZkhOZ3BXSVlsWTN0WHNHRXdrOU0wdVBPTWxvQVNaWEgzajBQL3dS?=
 =?utf-8?B?UmVMT1pINmZNUkY0SmgwUEJMSkJWZ1FCYS95UGJpTkJpSXh2QmlDNlVQdUE4?=
 =?utf-8?B?eHduR2Qzb1I4WFlrZ0Q4bTkvRzNGSzlnWmZlKzVHRmpHRHprTTVMSDVONGhO?=
 =?utf-8?B?TGlLNkE0MzRLZnQ2NkR0TUJ2ajdMaUxSV0tUQUdJZUFRbzVGZWQ4Zk9VV091?=
 =?utf-8?B?SW9uUkJLYzRzSUtickFoa3RSMXVqTUlTeTlDN1RtVzBRSno2U2V3UFc2N0xn?=
 =?utf-8?B?TnBzS3UrWGMvaWt2MFdvb1duMVh5YllnSXI0M0FvNytyUWpPa0ZraThGb1JM?=
 =?utf-8?B?VXFnYThKVG1haGJoMUlXQitZRk1JVE5Na3o5cE9yZmFIQVZtWUR1TVczdW1V?=
 =?utf-8?B?ZWdEbCtScUthVVhGdE4ycmRZTHIycnR5cDFHMUZ2dEp0VGFTNFpiK1EyZDVV?=
 =?utf-8?Q?1pHWY+K0nVgRs1jv0WxiiXWdZ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <350D9FED111FD54E8EB56E21EEE0A7AE@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: aed4f605-2e7a-4afc-cc17-08dc546e81ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Apr 2024 06:14:38.2383
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /HJwqEY4DiZY1jcgMy1QLbs/tYRBRyKhONxLIgVXMoveuL8mJPeXnSGGnTxt3185UkfO1QMsd12d2xSZM18MfxGq7Pev8nwK8R9NBDz+WHQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB2575
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA0LzA0LzIwMjQgw6AgMDY6NDUsIFJvaGFuIE1jTHVyZSBhIMOpY3JpdMKgOg0KPiBJ
biBrZWVwaW5nIHdpdGggdGhlIGFkdmljZSBnaXZlbiBieSBEb2N1bWVudGF0aW9uL2NvcmUtYXBp
L2VudHJ5LnJzdCwNCj4gZW50cnkgYW5kIGV4aXQgaGFuZGxlcnMgZm9yIGludGVycnVwdHMgc2hv
dWxkIG5vdCBiZSBpbnN0cnVtZW50ZWQuDQo+IEd1YXJhbnRlZSB0aGF0IHRoZSBpbnRlcnJ1cHRf
e2VudGVyLGV4aXR9X3ByZXBhcmUoKSByb3V0aW5lcyBhcmUgaW5saW5lZA0KPiBzbyB0aGF0IHRo
ZXkgd2lsbCBpbmhlcmV0IGluc3RydW1lbnRhdGlvbiBmcm9tIHRoZWlyIGNhbGxlci4NCj4gDQo+
IEtDU0FOIGtlcm5lbHMgd2VyZSBvYnNlcnZlZCB0byBjb21waWxlIHdpdGhvdXQgaW5saW5pbmcg
dGhlc2Ugcm91dGluZXMsDQo+IHdoaWNoIHdvdWxkIGxlYWQgdG8gZ3JpZWYgb24gTk1JIGhhbmRs
ZXJzLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogUm9oYW4gTWNMdXJlIDxybWNsdXJlQGxpbnV4Lmli
bS5jb20+DQoNClJldmlld2VkLWJ5OiBDaHJpc3RvcGhlIExlcm95IDxjaHJpc3RvcGhlLmxlcm95
QGNzZ3JvdXAuZXU+DQoNCj4gLS0tDQo+ICAgYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2ludGVy
cnVwdC5oIHwgMTIgKysrKysrLS0tLS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9u
cygrKSwgNiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvaW5j
bHVkZS9hc20vaW50ZXJydXB0LmggYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vaW50ZXJydXB0
LmgNCj4gaW5kZXggN2I2MTA4NjRiMzY0Li5mNDM0M2UwYmZiMTMgMTAwNjQ0DQo+IC0tLSBhL2Fy
Y2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9pbnRlcnJ1cHQuaA0KPiArKysgYi9hcmNoL3Bvd2VycGMv
aW5jbHVkZS9hc20vaW50ZXJydXB0LmgNCj4gQEAgLTE1MCw3ICsxNTAsNyBAQCBzdGF0aWMgaW5s
aW5lIHZvaWQgYm9va2VfcmVzdG9yZV9kYmNyMCh2b2lkKQ0KPiAgICNlbmRpZg0KPiAgIH0NCj4g
ICANCj4gLXN0YXRpYyBpbmxpbmUgdm9pZCBpbnRlcnJ1cHRfZW50ZXJfcHJlcGFyZShzdHJ1Y3Qg
cHRfcmVncyAqcmVncykNCj4gK3N0YXRpYyBfX2Fsd2F5c19pbmxpbmUgdm9pZCBpbnRlcnJ1cHRf
ZW50ZXJfcHJlcGFyZShzdHJ1Y3QgcHRfcmVncyAqcmVncykNCj4gICB7DQo+ICAgI2lmZGVmIENP
TkZJR19QUEM2NA0KPiAgIAlpcnFfc29mdF9tYXNrX3NldChJUlFTX0FMTF9ESVNBQkxFRCk7DQo+
IEBAIC0yMTUsMTEgKzIxNSwxMSBAQCBzdGF0aWMgaW5saW5lIHZvaWQgaW50ZXJydXB0X2VudGVy
X3ByZXBhcmUoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpDQo+ICAgICogSG93ZXZlciBpbnRlcnJ1cHRf
bm1pX2V4aXRfcHJlcGFyZSBkb2VzIHJldHVybiBkaXJlY3RseSB0byByZWdzLCBiZWNhdXNlDQo+
ICAgICogTk1JcyBkbyBub3QgZG8gImV4aXQgd29yayIgb3IgcmVwbGF5IHNvZnQtbWFza2VkIGlu
dGVycnVwdHMuDQo+ICAgICovDQo+IC1zdGF0aWMgaW5saW5lIHZvaWQgaW50ZXJydXB0X2V4aXRf
cHJlcGFyZShzdHJ1Y3QgcHRfcmVncyAqcmVncykNCj4gK3N0YXRpYyBfX2Fsd2F5c19pbmxpbmUg
dm9pZCBpbnRlcnJ1cHRfZXhpdF9wcmVwYXJlKHN0cnVjdCBwdF9yZWdzICpyZWdzKQ0KPiAgIHsN
Cj4gICB9DQo+ICAgDQo+IC1zdGF0aWMgaW5saW5lIHZvaWQgaW50ZXJydXB0X2FzeW5jX2VudGVy
X3ByZXBhcmUoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpDQo+ICtzdGF0aWMgX19hbHdheXNfaW5saW5l
IHZvaWQgaW50ZXJydXB0X2FzeW5jX2VudGVyX3ByZXBhcmUoc3RydWN0IHB0X3JlZ3MgKnJlZ3Mp
DQo+ICAgew0KPiAgICNpZmRlZiBDT05GSUdfUFBDNjQNCj4gICAJLyogRW5zdXJlIGludGVycnVw
dF9lbnRlcl9wcmVwYXJlIGRvZXMgbm90IGVuYWJsZSBNU1JbRUVdICovDQo+IEBAIC0yMzgsNyAr
MjM4LDcgQEAgc3RhdGljIGlubGluZSB2b2lkIGludGVycnVwdF9hc3luY19lbnRlcl9wcmVwYXJl
KHN0cnVjdCBwdF9yZWdzICpyZWdzKQ0KPiAgIAlpcnFfZW50ZXIoKTsNCj4gICB9DQo+ICAgDQo+
IC1zdGF0aWMgaW5saW5lIHZvaWQgaW50ZXJydXB0X2FzeW5jX2V4aXRfcHJlcGFyZShzdHJ1Y3Qg
cHRfcmVncyAqcmVncykNCj4gK3N0YXRpYyBfX2Fsd2F5c19pbmxpbmUgdm9pZCBpbnRlcnJ1cHRf
YXN5bmNfZXhpdF9wcmVwYXJlKHN0cnVjdCBwdF9yZWdzICpyZWdzKQ0KPiAgIHsNCj4gICAJLyoN
Cj4gICAJICogQWRqdXN0IGF0IGV4aXQgc28gdGhlIG1haW4gaGFuZGxlciBzZWVzIHRoZSB0cnVl
IE5JQS4gVGhpcyBtdXN0DQo+IEBAIC0yNzgsNyArMjc4LDcgQEAgc3RhdGljIGlubGluZSBib29s
IG5taV9kaXNhYmxlc19mdHJhY2Uoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpDQo+ICAgCXJldHVybiB0
cnVlOw0KPiAgIH0NCj4gICANCj4gLXN0YXRpYyBpbmxpbmUgdm9pZCBpbnRlcnJ1cHRfbm1pX2Vu
dGVyX3ByZXBhcmUoc3RydWN0IHB0X3JlZ3MgKnJlZ3MsIHN0cnVjdCBpbnRlcnJ1cHRfbm1pX3N0
YXRlICpzdGF0ZSkNCj4gK3N0YXRpYyBfX2Fsd2F5c19pbmxpbmUgdm9pZCBpbnRlcnJ1cHRfbm1p
X2VudGVyX3ByZXBhcmUoc3RydWN0IHB0X3JlZ3MgKnJlZ3MsIHN0cnVjdCBpbnRlcnJ1cHRfbm1p
X3N0YXRlICpzdGF0ZSkNCj4gICB7DQo+ICAgI2lmZGVmIENPTkZJR19QUEM2NA0KPiAgIAlzdGF0
ZS0+aXJxX3NvZnRfbWFzayA9IGxvY2FsX3BhY2EtPmlycV9zb2Z0X21hc2s7DQo+IEBAIC0zNDAs
NyArMzQwLDcgQEAgc3RhdGljIGlubGluZSB2b2lkIGludGVycnVwdF9ubWlfZW50ZXJfcHJlcGFy
ZShzdHJ1Y3QgcHRfcmVncyAqcmVncywgc3RydWN0IGludGUNCj4gICAJbm1pX2VudGVyKCk7DQo+
ICAgfQ0KPiAgIA0KPiAtc3RhdGljIGlubGluZSB2b2lkIGludGVycnVwdF9ubWlfZXhpdF9wcmVw
YXJlKHN0cnVjdCBwdF9yZWdzICpyZWdzLCBzdHJ1Y3QgaW50ZXJydXB0X25taV9zdGF0ZSAqc3Rh
dGUpDQo+ICtzdGF0aWMgX19hbHdheXNfaW5saW5lIHZvaWQgaW50ZXJydXB0X25taV9leGl0X3By
ZXBhcmUoc3RydWN0IHB0X3JlZ3MgKnJlZ3MsIHN0cnVjdCBpbnRlcnJ1cHRfbm1pX3N0YXRlICpz
dGF0ZSkNCj4gICB7DQo+ICAgCWlmIChtZm1zcigpICYgTVNSX0RSKSB7DQo+ICAgCQkvLyBubWlf
ZXhpdCBpZiByZWxvY2F0aW9ucyBhcmUgb24NCg==
