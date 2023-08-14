Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B3277B5AD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Aug 2023 11:41:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=O/fFGPc7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RPTv633q9z3cHr
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Aug 2023 19:41:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=O/fFGPc7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::60c; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on2060c.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::60c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RPTtB5FSFz300q
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Aug 2023 19:41:05 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GqGZAdwgWKOCLxvy1wSO5vauyEu7Y1oNj/014DybDqHgMyoQFrhvgxSD6K1R4ZD7WXUHIvIJtKJuYbU0MsKGIvTQYHYxwdGMAwgs54k1ANmXwaJ/oqkWN7qjlIaORW4i2tMPF7CQYfMI7rpY8rk37wAJl0gWT22DOElQC84dubtJihzZfx9dKBD1lhE1DrtIvGaRayA6RZV/3csn0Caf+UCNX3OksoMRqSai2R/SfY9fVA/jBHdJw8M2HSE1yJyyGK0WSQezZGIND8U0VEjH/T6xAPuT0XqilOAadwXJILhQxXkpwR4fJrG0uehqdAss5OmNGexr4vZfvFD9vl8/JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5280Le3psC9TIhVpDwfLvo/4pmGjFa29M0D4GygVGI0=;
 b=IETM8iLwWQ0HwCOwAh9bEyrjXDLnLHIHF94QcV+yWHj2QS0E2MnDvLojTvK0mxuM7sDm0KnIipUVfoC6mHeBuBixhA2ZKE5u8Rg+4s1LtPZwjihWjqHTz8IDwhR/UkJGKTZ+K9gMyq/l08x9Zgrn+5BCuu+LavUodEWmEHi2SiOR3KRMH+90AGrGxC3IHCf7ke5N67+r7gI9Ik0Gvj4J0wVSqoT0TH/jdhsu/UVS2hMZmZi799UnYlVZeRbmvLH+zYlKluz4z/poMQxm22g+KA/3vvJXe+Zy9aD///KSryC7IEj5iq/KTFkuoWX+ddml3jckox62/2+0hDOq9/T0Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5280Le3psC9TIhVpDwfLvo/4pmGjFa29M0D4GygVGI0=;
 b=O/fFGPc7aoguom5eqC9qAgqFLC530W1brNj1vMFO5TFW8SJvopGf6BYWGfzYZ3Xxh2tg+fVzQfeu01g463Pb9ltzVxFeNJtc9Dc1Jh0NiL8gK8nY6tHAMT/1Fbv8yLUZJkbeiCKb44f/7OKf8Ac3rkX5/thtCRs7WXcvmx4baqtVUWU552jPbXfxgIqlLrmgWpbFKs+JAY6LaTR9G6+Wc+x8ARP8ZeDD5rfOqLVzE2GGKNxMvI4bEnWdgJRnvjpJ1quxrAsAjtZyflo4uFMHnkUtz6qGW5zpIUdOTpEMtrl6U9GjOqdJzmIX3Et+cxT49pxip9zOI2rQs3a6q6KPHg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB3178.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:1a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Mon, 14 Aug
 2023 09:40:44 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e%7]) with mapi id 15.20.6678.022; Mon, 14 Aug 2023
 09:40:44 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Erhard Furtner <erhard_f@mailbox.org>
Subject: Re: KASAN debug kernel fails to boot at early stage when CONFIG_SMP=y
 is set (kernel 6.5-rc5, PowerMac G4 3,6)
Thread-Topic: KASAN debug kernel fails to boot at early stage when
 CONFIG_SMP=y is set (kernel 6.5-rc5, PowerMac G4 3,6)
Thread-Index: AQHZy+ViBGkHrlry0EW7JbY0oo0AC6/kpveAgAP81YCAAOsxAA==
Date: Mon, 14 Aug 2023 09:40:44 +0000
Message-ID: <57bdfad9-cbec-1a9f-aca7-5956d22a8ada@csgroup.eu>
References: <20230811014845.1bf6771d@yea>
 <f8f09049-3568-621d-88ce-1b61fe8b63fe@csgroup.eu>
 <20230813213855.794b3c8f@yea>
In-Reply-To: <20230813213855.794b3c8f@yea>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB3178:EE_
x-ms-office365-filtering-correlation-id: 574c0dad-026a-42b7-2ca2-08db9caa8842
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  KtVssykqpQRHK0GDvBX6hbJVxO8GsaKykAByysypj4m3MQ9wVrm8WRkBMcuC1oQxt0rvkhjNLX7U8b4Pcbnv2Mkq8Z/4BzVV4oy73SQKtrpxLquO2DHii6klFJCxjekmN8gtmbU7UdXxSHJpZswuRTxOgj87Mek5zdzKdCybDmaIeRxXGXDSm9bxXJtKua7B5l9CvBP3FePuqitGMXnK7aNnPCT6LQFWTnrZWVAEZvRv/6xguewPdAo1H/KIlt8uveYK+OyiEbtSTRm1PniUXYiqxNJXKfDsCU1hW8hF3EgnLprZO2lB5Vt/pvghEWyIpz3YawyJ//TdNd1gh1TF+m/rjSM/D9OmqWOAp8vvU99E7QznsLcKO0G//ibHC27e/NfYewXldzfGLlhQC1uGFLt6KBhYBij6Ig5ya4C0Mu4Fqb0I+cIm8XN4Ah7Hh9IFlEx4blvmO7Qx776FMGDtqhN0fe0XSJbRHkXdZ+wkD0B0oD6BqGdE+zPJpD9/0g12+5huY4PvBKp2csNy4uK8BJgegp0fjAKSzF0tHFw2MragBOV1RjrnkvjenXUU1gd/ybRJ5X+AtI8JUnjsTAeZal5jQ8BOeaAN+NXwp8+TwuD/BOa/iGbrzL9DukFdRL2baHjWwc0WR/oOvtOIuorICeJzOH/cYeWBABwkIUs/qrJvRIsdPKoLHv5TxFIvaMSN
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(136003)(366004)(346002)(376002)(39850400004)(396003)(1800799006)(186006)(451199021)(83380400001)(36756003)(26005)(6506007)(71200400001)(478600001)(38070700005)(6486002)(6512007)(2616005)(66574015)(31696002)(38100700002)(122000001)(31686004)(86362001)(91956017)(5660300002)(66476007)(66556008)(66446008)(64756008)(316002)(6916009)(41300700001)(76116006)(66946007)(4326008)(2906002)(8936002)(44832011)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?K3V0aXlRRzExUzNkUGkvOGE5QmJCSzN4WXNCbzVwbTY2Z0hncmpwUWQ0SG9T?=
 =?utf-8?B?cEVFeEZuUTBCS1Y0MmhzTVdLOUFaWGVpZGoxZEpPK3U2enNhQkVIeFRKbFZr?=
 =?utf-8?B?UW90OTBlRHpvQkkwa2FDT1VTTGQwaSs4UlNYeFdSQTZpcXpMWEJMOTlXU3ZX?=
 =?utf-8?B?MmJndUk0ZGw5MXE5RnM4a1ozRlRSRWdOSkZ5NjF4Rk1EZFRjRFJtaVRuWDEr?=
 =?utf-8?B?RDZlOUw3R0k3bjlaMjE1M2xXbFgzYm5LeEFJc25ZNjBXTDhZazVPakJjSzl0?=
 =?utf-8?B?emJVK0ZKekZ5YWVDd1p1YTl5dUV1cTNETTJXd0xISWFSVEI1Yitxc1Nobm5N?=
 =?utf-8?B?Sk91OTJwRFJyR3BGZWVVQy93SHFYOEdqSi9PdUJQMkt3UFhxRkhWZWlRUndR?=
 =?utf-8?B?WGZSbDhnOFZ0TldBc0U0QS9aREhzUEVuTHhFSFZVWVg2YUN4YnlzTXdWSUlC?=
 =?utf-8?B?Q0IrWDdiV25rYWxJNUNsWWxiRzg4bitqZkxTMDNzOUQ2WXlTN1ByMXI5NVVa?=
 =?utf-8?B?RjV6b2dvU0dkUW0wNlZPdWpSQjQ0Rzc2aEFkNVE1bklXQllWc0dyOHNhZUpO?=
 =?utf-8?B?SkNMUEx2aWZVeUg1czMwb2JLN3FnTmwwYkFNRy9ob3B0cjJnQThDQ3g3MnNZ?=
 =?utf-8?B?NGlubXR2cVFQWnkzYXAxKzVYcTN3OTFLQmdtcWErZWo0MTd5Z1M3YndzTzRP?=
 =?utf-8?B?UFFuWTExV0JZVER1a0NrTzB0Z25USjFDR2RKK2RvbXg0alI1MEUwV3dBbHF0?=
 =?utf-8?B?b0tNREtKUUFXQ2huSFN4bXF2K3dFbWs5SjFtZ040YWFla2lva0hLYmNRekVI?=
 =?utf-8?B?US9EbjdUUktyVVEwY0k0bExZWThrOHVzM0JwK1NyTmVRZCtoeUh5b05jVTlk?=
 =?utf-8?B?dllVNG55UTJsdGMxcjY3N2NKMWRtaGpHZzg4RzhhenlZUWxXVGpXSE1qS1RC?=
 =?utf-8?B?VklyRWhkczN2WmJQdDBPUkd3Tm9QbTlTWXBINng3cThXbS9qK2JMMlg0TXpw?=
 =?utf-8?B?WGt6d3hLalRIaHRUb0w2NDZiRzg5a2FRZUxUWC96U0Y4NHRpd2dWY0tHdlFt?=
 =?utf-8?B?Y2JaQ2NySGU4cHJ4eFJ0ckZXL1d3bDErc0pIT24xS3dWRDk2STQzWG9kaXIx?=
 =?utf-8?B?enkzOEdpM0RmQ0w0dmVlbzA0dFU0VW0xckRvY0owNkE1UTRCTkNreGNvQXZi?=
 =?utf-8?B?bm9DeTdtMThuK2lOb25FT2ErTlh1TlZPSU51STI1UGdzbXY0QlM5UGZJMjhv?=
 =?utf-8?B?UHAzRW8yZVRNREFJTndENkxPRkRTWFVVMWtOMzBoMW05VlFOc0dFN0lkSWt0?=
 =?utf-8?B?NjFjZC8xNmNBZGhRdDZDZUlQdXowWXoydUk1RGxLd3ZEbXM3dDBGVGFtMFlI?=
 =?utf-8?B?S1lRc1QweHk3TGY4TWJDaWtGcHhMZkxJVTd4L3UwZHRQRmJtQVFCWXVhdlZ2?=
 =?utf-8?B?dk9mWjN1aVh0ekgzemtPWURHMEJFak1YTVRWQmM4NTR1RkF6TkRsSStrcXRZ?=
 =?utf-8?B?dk9sL3BuNEhOZ21KTUZ3MlhPMUhOZWtXSlRWMWdudEkzc1g1cUI0UU1mQXc0?=
 =?utf-8?B?UDJCUmZHUGNydTZvTEVVcmlMZGdjQ2p5UTZXT1RVZFIyemFVZGRjdU0xdVg3?=
 =?utf-8?B?MjZPMG1BaHdaVmMyeFN4NytzU0YwMk9EUkZjT1Bhdy9wMEY5RUNHd3pGR3VD?=
 =?utf-8?B?WVg5TUxiNlhYZXhscnFoUHBkZzh4UmJsNTRuVG83Nm1DSmlUa28zai9paTZX?=
 =?utf-8?B?OHo1ZjFOTXhCbWNia1JodnkvNVdZbTVjSC9IUVpTWjUvZTZTMWdNOGtHcGk4?=
 =?utf-8?B?bThBc2orZSt6K2JQVktVdlRlby9rbTZPbkdmTk1sS2VVSTRCM0kwNUNRSFRu?=
 =?utf-8?B?bnVDVDNmWFZHZnhSRFc0a2hYTGRTMTFZdzdnRFMxRWRXcjRZSUFLUlpKVGtp?=
 =?utf-8?B?MnFFc0hKQzJqRTdLMUNNeDBqMktVRjNQYkdQa1hrdFkzcFFpbkI2LzhZRGxU?=
 =?utf-8?B?eE9hUWlpRGExSXoxN2dBb1VHU0ErakNKTkZDNTU5NmhwdlV0WFB1VUdUTHA5?=
 =?utf-8?B?UnFKNkV6RHFJbEdOM0U1SlQveW9Hc2trZ3RZMnZWSkpSU0ZYa0RYejYyQVdm?=
 =?utf-8?Q?ep7Jpuc7ESwx33K1zNb2OpFvq?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0D0018A040CBD147AC1D96CDA679A0DC@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 574c0dad-026a-42b7-2ca2-08db9caa8842
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2023 09:40:44.7446
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g1McU/vDxvqk+tvfDmAVe6vtzTR3Gbl/WIZHWBOmfzd3y0tfcYVQv6uuOma1HhflowqBhrUanMAoo59ahcLKO3VU3K++rVWr8f9VHFG0cA0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB3178
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDEzLzA4LzIwMjMgw6AgMjE6MzgsIEVyaGFyZCBGdXJ0bmVyIGEgw6ljcml0wqA6DQo+
IE9uIEZyaSwgMTEgQXVnIDIwMjMgMDY6NDU6MTQgKzAwMDANCj4gQ2hyaXN0b3BoZSBMZXJveSA8
Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1PiB3cm90ZToNCj4gDQo+PiBMZSAxMS8wOC8yMDIz
IMOgIDAxOjQ4LCBFcmhhcmQgRnVydG5lciBhIMOpY3JpdMKgOg0KPj4+IEkgd2FudGVkIHRvIGZp
cmUgdXAgbXkgUG93ZXJNYWMgRzQgTUREIChEdWFsIENQVSkgd2l0aCBhIEtBU0FOIGRlYnVnIGJ1
aWxkIG9mIGtlcm5lbCA2LjUtcmM1IGZvciB0ZXN0aW5nIHB1cnBvc2VzLiBCdXQgdGhlIGtlcm5l
bCBmYWlscyB0byBib290IGF0IGEgdmVyeSBlYXJseSBzdGFnZS4gSSBvbmx5IGdldCBhIHdoaXRl
IHNjcmVlbiByZWFkaW5nDQo+Pj4gImRvbmUNCj4+PiBmb3VuZCBkaXNwbGF5OiAvcGNpQGYwMDAw
MDAwL0FUWSxBbHRlcmFjUGFyZW50QDEwL0FUWSxBbHRlcmFjX0JAMSwgb3BlbmluZy4uLiINCj4+
DQo+PiBDYW4geW91IHRyeSB3aXRoIENPTkZJR19QUENfRUFSTFlfREVCVUcgYW5kIHNlZSBpZiB5
b3UgZ2V0IG1vcmUNCj4+IGluZm9ybWF0aW9uIG9uIHRoZSBzY3JlZW4gPw0KPiANCj4gV2l0aCBD
T05GSUdfUFBDX0VBUkxZX0RFQlVHIHNldCBib290aW5nIGNvbnRpbnVlcyBhbmQgSSBnZXQgdHdv
IG1vcmUgbGluZXMgb24gYSB3aGl0ZSBzY3JlZW46DQo+IA0KPiBbICAgIDAuMDAwMDAwXSBwcmlu
dGs6IGJvb3Rjb25zb2xlIFt1ZGJnMF0gZW5hYmxlZA0KPiBbICAgIDAuMDAwMDAwXSBUb3RhbCBt
ZW1vcnkgPSAyMDQ4TUI7IHVzaW5nIDQwOTZrQiBmb3IgaGFzaCB0YWJsZQ0KPiANCj4gQWZ0ZXJ3
YXJkcyB0aGUgRzQgZnJlZXplcy4NCg0KSW50ZXJlc3RpbmcuIFRoYXQgbWVhbnMgd2UgZ2V0IHN0
dWNrIHNvbWV3aGVyZSBhcm91bmQgIE1NVV9pbml0KCkNCg0KV2Uga25vdyB0aGF0IE1NVV9pbml0
X2h3KCkgaXMgY2FsbGVkIGFuZCBydW5zIGF0IGxlYXN0IHVudGlsOg0KDQoJcHJfaW5mbygiVG90
YWwgbWVtb3J5ID0gJWxsZE1COyB1c2luZyAlbGRrQiBmb3IgaGFzaCB0YWJsZVxuIiwNCgkJKHVu
c2lnbmVkIGxvbmcgbG9uZykodG90YWxfbWVtb3J5ID4+IDIwKSwgSGFzaF9zaXplID4+IDEwKTsN
Cg0KQnV0IHdlIG5ldmVyIHJlYWNoIHRoZSBwcmludCBpbiBzZXR1cF9rdWFwKCkgd2hpY2ggaXMg
aXRzZWxmIGNhbGxlZCBieSANCnNldF9rdXAoKToNCglwcl9pbmZvKCJBY3RpdmF0aW5nIEtlcm5l
bCBVc2Vyc3BhY2UgQWNjZXNzIFByb3RlY3Rpb25cbiIpOw0KDQoNCkNvdWxkIHlvdSB0cnkgdG8g
bmFycm93IG1vcmUgdGhlIGlzc3VlIGJ5IHNwcmVhZGluZyBwcl9pbmZvKCkgYXQgcGxhY2VzIA0K
aW4gdGhlIGNvZGUgYmVsb3cgYW5kL29yIHRoZSBjYWxsZWQgZnVuY3Rpb25zID8gRWl0aGVyIHdl
IG5ldmVyIGNvbWUgDQpiYWNrIGZyb20gTU1VX2luaXRfaHcoKSwgb3Igb25lIG9mIG1hcGluX3Jh
bSgpIGJ0ZXh0X3VubWFwKCkgDQprYXNhbl9tbXVfaW5pdCgpIGZhaWxzLg0KDQpTbyB0aGUgcGll
Y2Ugb2YgY29kZSB3ZSBhcmUgaW50ZXJlc3RlZCBpbiBpcyBsb2NhdGVkIGluIA0KYXJjaC9wb3dl
cnBjL21tL2luaXRfMzIuYyBhbmQgaXM6DQoNCgkvKiBJbml0aWFsaXplIHRoZSBNTVUgaGFyZHdh
cmUgKi8NCglpZiAocHBjX21kLnByb2dyZXNzKQ0KCQlwcGNfbWQucHJvZ3Jlc3MoIk1NVTpodyBp
bml0IiwgMHgzMDApOw0KPT0+CU1NVV9pbml0X2h3KCk7DQoNCgkvKiBNYXAgaW4gYWxsIG9mIFJB
TSBzdGFydGluZyBhdCBLRVJORUxCQVNFICovDQoJaWYgKHBwY19tZC5wcm9ncmVzcykNCgkJcHBj
X21kLnByb2dyZXNzKCJNTVU6bWFwaW4iLCAweDMwMSk7DQoJbWFwaW5fcmFtKCk7DQoNCgkvKiBJ
bml0aWFsaXplIGVhcmx5IHRvcC1kb3duIGlvcmVtYXAgYWxsb2NhdG9yICovDQoJaW9yZW1hcF9i
b3QgPSBJT1JFTUFQX1RPUDsNCg0KCWlmIChwcGNfbWQucHJvZ3Jlc3MpDQoJCXBwY19tZC5wcm9n
cmVzcygiTU1VOmV4aXQiLCAweDIxMSk7DQoNCgkvKiBGcm9tIG5vdyBvbiwgYnRleHQgaXMgbm8g
bG9uZ2VyIEJBVCBtYXBwZWQgaWYgaXQgd2FzIGF0IGFsbCAqLw0KI2lmZGVmIENPTkZJR19CT09U
WF9URVhUDQoJYnRleHRfdW5tYXAoKTsNCiNlbmRpZg0KDQoJa2FzYW5fbW11X2luaXQoKTsNCg0K
PT0+CXNldHVwX2t1cCgpOw0KDQoNCkNocmlzdG9waGUNCg0KDQo+IA0KPiBCeSBjaGFuZSBJIGZv
dW5kIG91dCBhbm90aGVyIGludGVyZXN0aW5nIHRoaW5nOiBUaGlzIG9ubHkgaGFwcGVucyBvbiBj
b2xkIGJvb3RzLg0KPiANCj4gSWYgSSBib290IHRoZSBHNCB1cCB3aXRoIGFub3RoZXIga2VybmVs
IGZpcnN0IGFuZCBib290IHRoZSBTTVAgS0FTQU4ga2VybmVsIGFmdGVyd2FyZHMgaXQganVzdCBi
b290cyB1cCBmaW5lIHRvbyEgT24gZnVydGhlciByZWJvb3RzIHRoZSBTTVAgS0FTQU4ga2VybmVs
IGtlZXBzIGJvb3RpbmcgdXAgbm9ybWFsbHkuIFVudGlsIEkgdHVybiB0aGUgbWFjaGluZSBvZmYg
LSBhbmQgbmV4dCB0aW1lIEkgdHVybiBpdCBvbiB0aGUgc2FtZSBTTVAgS0FTQU4ga2VybmVsIGZh
aWxzIGJvb3RpbmcgYWdhaW4gYXMgZGVzY3JpYmVkLiBTdHJhbmdlLi4uDQo+IA0KPiBUaGlzIGJl
aGF2aW91ciBob3dldmVyIGlzIHJlcHJvZHVjaWJsZS4gVHJpZWQgdGhhdCBwcm9jZWR1cmUgMTUt
MjAgdGltZXMganVzdCB0byBiZSBzdXJlLiBIb3BlIHlvdSBjYW4gbWFrZSBzb21ldGhpbmcgb3V0
IG9mIGl0Lg0KPiANCj4gQXR0YWNoZWQgaXMgYSBkbWVzZyBvZiBhIHN1Y2Nlc3NmdWwgU01QIEtB
U0FNIGtlcm5lbCBib290IGF0dGVtcHQgd2hlbiBhIHdvcmtpbmcga2VybmVsIHdhcyBib290ZWQg
Zmlyc3QuDQo+IA0KPiBSZWdhcmRzLA0KPiBFcmhhcmQgRi4NCg==
