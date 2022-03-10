Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A849C4D5136
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Mar 2022 19:10:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KDxvB4Q6bz3bX0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Mar 2022 05:10:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::62e;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on062e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::62e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KDxtf1b4gz2yLX
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Mar 2022 05:10:16 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U5ubAhjlpKa8Xw9ndQGe7I8ubQGvDZGVL9QYibxbDE9mA7H05YWXxFa5B14qmGvVNZsfteRCL1ZtvweCW+zlut+OTpBMqW9RpjPFuE314p3pe5hmTG0rktEil12nQBmB3PkQ+NR1UKLoOwbUjfj3uw4QuJcgSu5AO4OLKuuvY/LLExRwb/hNRRlepSTi2exlJR8tDR0opfH3S2u2NWrsyqJWFjYeSmDTlLUqHPKv+I4u1Krz+HiS/gDH7BEl1i7t4AsId8i7M5tmHy1x9WWSnNx/wENwAmkiHAb7hSbrkFMx8jbMoGTSOdeJgOECWyU6eKOy6RIPY5czg5TT6QEXZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TxqPLDUOG11lNxQExfzvQhdoLSt92iXqPie0jZU7fWY=;
 b=lsRoc0QbsnCLEHacg/1+9A3jpSo6cvtuUeqgQJgBXe/fSMyEj8ArO+OEslgT4diXH0vAqSWE4NSYRgXPqKVUNO3LVFuV6ZcU9b6Qe1WnoVGUAgqiq3rXHFcJEhsxuCc2sYVsH748BYzz/v2dMemmhNrQcLcvJV2Z5MnBveaMuCPaLMgyz2a16qy8XiHddQ60Pn4B0jrJ1ke7ZKt4/C0q+7Ib5xDe+3F9KYJUJ/suNUnC5Ns6jcfdX319WGXAbjCyfUUoHz4H/uQwwCBm/8M/ONklUAtCeayow5K3y0+jSUdHNuh44Gf00gIAorTJjbyCDi0BmIlF+pmHvUhBUH4XVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB3715.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:2a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.21; Thu, 10 Mar
 2022 18:09:51 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::cd2f:d05d:9aa3:400d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::cd2f:d05d:9aa3:400d%4]) with mapi id 15.20.5038.029; Thu, 10 Mar 2022
 18:09:51 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH v8 01/14] sizes.h: Add SZ_1T macro
Thread-Topic: [PATCH v8 01/14] sizes.h: Add SZ_1T macro
Thread-Index: AQHYM91q2kzKqx0bcESvd6W1Xh/k36y41p4AgAAVugA=
Date: Thu, 10 Mar 2022 18:09:51 +0000
Message-ID: <969d885d-dcff-61b9-50cd-cdaf511505ab@csgroup.eu>
References: <20220310165206.GA163581@bhelgaas>
In-Reply-To: <20220310165206.GA163581@bhelgaas>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 89d26dba-74de-405b-ddc2-08da02c12bfb
x-ms-traffictypediagnostic: MR1P264MB3715:EE_
x-microsoft-antispam-prvs: <MR1P264MB3715673BA831DB6B4F0A791EED0B9@MR1P264MB3715.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0KLZJQRCYEY1LlqLvHTZsv6vKQKXI51m7oNIZdnKauQn9boYawCQn/8M0HAuRgNDtfhAlVeCUzaRd6aYK4jB28+iT59hD9hTAuRQmNmsydh+PsaHre9mjErdAjX1vPuvNUIuKrwIhVWxSLPp9tp/kjXOkNw1wN2NMK3Qo7KzsbtytFMVlgWVOfTt4U28BnaDUULPcT9wnG60N+9LYvDQClkQW8z5l/YvJJI5LJkM+k2qsRIJAUrq2Drpy7DOHnmgVHqR7THljNZv7iiyGuvT/nUpIm/Czig+iZi4SktzP2hmgH5b0li/IC2tWyz9XRTjMxE92XHd16rVsZD1/T3sYxPsbqohCekTRasgjEvP8y/3uBvpgLxNIpySwmT81O+cPhSJTthpPzNdBWQc4nMuaIRBp4u8D831bdVdS6/G1GLXQQxCbFEBXfHaCtZ5iOO6zUncFM1vuRDzWg2kyiVVkYhPt6imnSH/9ipusq90WN6LLit3wDsRX1zDupaIueg4v1njO3qqzntN452qIPdOopnTPZ6/R1HW9PrScwRClXZsqpGfmatugsoJXZfpVpWBFe0ssxYQfy492Md5DXo6mo1BBt3lbdDR2XZi+9t3aR1NzRngRbFljDKwURV+9HXVaQdSu7t+kAuGNSw2EyDjGlMbhVjYN6VKzJz0a9y1ts5ih7GsXUX4vewYUephJIDA25dg4zjHB3EOFGwGy798yuE0Nb4KK/lMWGNA4Wn9aRrQBAiSZfUpq42XGh/7xMpAOY6SeQQyyr04kn38dmbB9fXcZq4lEKDfcZHPJPzZkQfva0VjO8rfn8N/IndGgC5joxcso7IMhoWmrtfOdnjQlDvfVNEk4GnWo1Gtq/esTVI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(54906003)(64756008)(71200400001)(5660300002)(38070700005)(44832011)(2616005)(76116006)(36756003)(66574015)(38100700002)(6486002)(6916009)(7416002)(66946007)(26005)(31696002)(316002)(8936002)(31686004)(8676002)(66446008)(86362001)(508600001)(6506007)(91956017)(66476007)(122000001)(66556008)(4326008)(186003)(2906002)(6512007)(966005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aXpNYkt6WnhxTmdHVjl0MjhZQjJRVTFaZlZRNStrZ0huYmM4T0tzSW1KYmNT?=
 =?utf-8?B?N3JhSjM2QXdGdkszbUtISFlzc1VIRFJXUVdKTHZTNVJCMWFDNExOK0NLOXdv?=
 =?utf-8?B?R2FjZ05YSlkyL0hLcVlHcTVHMzZiL0RCR3dxYUY4TjUzRklncno4MlluOGFP?=
 =?utf-8?B?UVl1U01Ya2xEcWE4a1ZoeVpoeCtUYnh2bm1JR0o3MTRiOEJGbWZKSVhzMnZ3?=
 =?utf-8?B?VmlLT3lLdkVEWndPT2RxcldNS3RBbmkxMGlndHVISE91UmJPaUhtZTRjd1pm?=
 =?utf-8?B?RDFUQWtuMnpuYmZxQTFKeHgxSWtjUUlvZXIycWJGeldjQ2d0VU5YUXpuTklN?=
 =?utf-8?B?WHpoTDVRT1JrS25EQVJickJxMzUvRjd0ZEp5N0xPR2wzaFk1QTY3UkJCdzQx?=
 =?utf-8?B?bG52MXJtYXZNWUwyRmszbmxoUU81Vm42TnRrQ20wTkdBTG5qVkVJS3VzYmsz?=
 =?utf-8?B?SVJzRFNEMWhINEpxbHFwMEZzL1RkZEIzUHdKRzFXdkRsRDgyU1JCVUl5NktS?=
 =?utf-8?B?N0s4L0NVS0g1OUZadlBsT1FBMGNIY0lKamZYVVlmd0c5YmRMWGtwZVNocEhP?=
 =?utf-8?B?TDVGWFM0Q2Nab3NjbmFkQ291cTAwSVNWemkrQzcrYlZseWcrTG5jVzdqcUNP?=
 =?utf-8?B?TEJGdWt3d2pWTjhpZE5WMGJWdHROa0NqMk5sTEFhT0RpMjZVQ2tqRDhhNGQ3?=
 =?utf-8?B?dkRVSFhQbEhvb0NWNjJVeUZYa01qcHRQeHRheUVsclg0dGRpUVFUc29tU3B2?=
 =?utf-8?B?eS82a1lESHV4N21KMXRyYVYrK3VxYmU3cldobHZTUlhJZ2RydXhLUUozUTJy?=
 =?utf-8?B?OU0yWDBmSGxEamNwbGw0OXNSVEZ6NTR1TTd3RjQvT1lwUFMzbExnWC8wUFU4?=
 =?utf-8?B?Nm41WmZuYm0wZ3VTcDBzeXBSSkFmMG5leW94TDNUUE9FczVJLytIanpwVlBP?=
 =?utf-8?B?N0hGU0lsejREcWNxTmVPVWxBcGdVU2dDU2J2bnIrSUtNS1haZEJHMVB6NXpt?=
 =?utf-8?B?cklOY0pXR2c1cTJMQ0tRN2hKZmtSUDdZbUM5S1hkMnB0WklXam56c08yQXA0?=
 =?utf-8?B?VXFlditRZ25sQnRGV3R2WXhPU3JhMlZ2VEFKeDNVTm40TjJqS05HeVdtSm11?=
 =?utf-8?B?Mk5idC9neXcvbEdlaStFL2tMKzRYdUJhUU5hL2FhZm13S2F1ckNRN2N5Wk5n?=
 =?utf-8?B?WDIvSGkyU2txV2ZBQUZnV1hYS0V2SkkwSlRwSXRtQ2VLazRWbDRSbUN0RTA2?=
 =?utf-8?B?OVRIdmJVWFBaa3hSUml2OTRRbVRYOW4ydlNpQmE4TEZmSFVhZGg2TTlPc1Zo?=
 =?utf-8?B?MGxqa3JnVHhHQkhnR0JWUi9pK0NWdkdKWG9XdFg2YkEvWUtpV1RFOGpNSEhV?=
 =?utf-8?B?UDB3WWcwLzRrOXVGUk9Xc3dtSFMrWk12SEtocEhwTzRYSTdES09OUUNvRUF2?=
 =?utf-8?B?OXA5ejBUeGFUZEtXZThCRTY0b2ltaGtZUklFZFR0Wk5YclVHTFJWWklaZXB1?=
 =?utf-8?B?UVlXb0xoNXFnVXZoRDc4RDczbUlPWjNCc0h1UkdZSXNGR2pWUldaQ3pGUm9D?=
 =?utf-8?B?T0QxNlluWnF5YXRlcmxpTDEwcG9JKy9rdm9pZ0RJQTlubFpaTVZTSHd3S29w?=
 =?utf-8?B?eFFlK2I1VE92VDRVRkM0eUIrT0lJQVFlMHJlL3g0dWMxRlNrYzJPbHVkM2JJ?=
 =?utf-8?B?cUs0VnVldXNIRG1vYVRJYmZrYS9qeGh6MzJBdmoxY2c3ZkVQWEhaMlMyTkw3?=
 =?utf-8?B?SGl4NG1acjlEeVo4d0ZOUmZyTmpzT0x5UTdsQW5SVTlsRUJPK0kwUWRKQjVC?=
 =?utf-8?B?L2ZiS3RjK0Y5clIyWFp2a3czZVhGVzEwOHRnRC9YUmgyaUVJR2NRc0ZXQmFM?=
 =?utf-8?B?T0l2d09HWUZVc0Z3QVJBSm5LeDR1WFg3M29mVk1sUDhuM2RtUVBBcUs0YWRm?=
 =?utf-8?B?Mk1WT3BKQVZjUUdXWE9McUwrbk5RZUVSbSsxMmJjbmh6cjdGNjNlUlNhUWhV?=
 =?utf-8?Q?QPYiIl9Lgg0H/bS87piAwbiulMol3s=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <74DE096ED4FFE0469A8AD4D48BF5E6FC@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 89d26dba-74de-405b-ddc2-08da02c12bfb
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2022 18:09:51.5279 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DXtXgAq9+KYMNtlfUGx+Le+BH4FIvgXt6xe7yGuVQLAD7Aljf/HKUwyC/d7Nv3Ffe1GIG4UXqduKZcqr+iZHwDscPDiSFjMDQBH6wFRAY+E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB3715
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
Cc: =?utf-8?B?S3J6eXN6dG9mIFdpbGN6ecWEc2tp?= <kw@linux.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "alex@ghiti.fr" <alex@ghiti.fr>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, "will@kernel.org" <will@kernel.org>,
 Paul Mackerras <paulus@samba.org>, Bjorn Helgaas <bhelgaas@google.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Toan Le <toan@os.amperecomputing.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDEwLzAzLzIwMjIgw6AgMTc6NTIsIEJqb3JuIEhlbGdhYXMgYSDDqWNyaXTCoDoNCj4g
T24gV2VkLCBNYXIgMDksIDIwMjIgYXQgMDY6NDQ6MzVQTSArMDEwMCwgQ2hyaXN0b3BoZSBMZXJv
eSB3cm90ZToNCj4+IFRvZGF5IGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGNpLXhnZW5lLmMgZGVm
aW5lcyBTWl8xVA0KPj4NCj4+IE1vdmUgaXQgaW50byBsaW51eC9zaXplcy5oIHNvIHRoYXQgaXQg
Y2FuIGJlIHJlLXVzZWQgZWxzZXdoZXJlLg0KPj4NCj4+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL3IvNTc1Y2I3MTY0Y2YxMjRjNzVkZjdjYjkyNDJlYTczNzQ3MzM5NDJiZi4xNjQyNzUy
OTQ2LmdpdC5jaHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXUNCj4+IFNpZ25lZC1vZmYtYnk6IENo
cmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4NCj4+IFNpZ25lZC1v
ZmYtYnk6IExvcmVuem8gUGllcmFsaXNpIDxsb3JlbnpvLnBpZXJhbGlzaUBhcm0uY29tPg0KPj4g
UmV2aWV3ZWQtYnk6IEtyenlzenRvZiBXaWxjennFhHNraSA8a3dAbGludXguY29tPg0KPj4gQWNr
ZWQtYnk6IEJqb3JuIEhlbGdhYXMgPGJoZWxnYWFzQGdvb2dsZS5jb20+DQo+PiBDYzogVG9hbiBM
ZSA8dG9hbkBvcy5hbXBlcmVjb21wdXRpbmcuY29tPg0KPj4gQ2M6IGxpbnV4LXBjaUB2Z2VyLmtl
cm5lbC5vcmcNCj4+IC0tLQ0KPj4gICBUaGlzIHBhdGNoIGlzIGFscmVhZHkgaW4gbGludXgtbmV4
dCBidXQgbm90IGluIExpbnVzJyB0cmVlIHlldA0KPiANCj4gV2hhdCB3b3VsZCB5b3UgbGlrZSBt
ZSB0byBkbyBhYm91dCB0aGlzPyAgSXQncyBpbiBsaW51eC1uZXh0LCB3aGljaA0KPiBtZWFucyBp
dCB3aWxsIGdvIHRvIExpbnVzJyB0cmVlIGR1cmluZyB0aGUgbmV4dCBtZXJnZSB3aW5kb3cuDQo+
IA0KPiBCdXQgdGhpcyBpcyAwMS8xNDsgYXJlIHRoZXJlIG90aGVyIHBhdGNoZXMgdGhhdCBJIHNo
b3VsZCBiZSBsb29raW5nDQo+IGF0PyAgRG8gSSBuZWVkIHRvIGNvb3JkaW5hdGUgdGhpcyB3aXRo
IG90aGVyIHBhdGNoZXMgdGhhdCBkZXBlbmQgb24NCj4gaXQ/DQoNClllcyBzb3JyeSBJIHNob3Vs
ZCBoYXZlIHNhaWQgaXQuIFBhdGNoIDE0LzE0IGRlcGVuZHMgb24gaXQuDQoNCkRvbid0IGtub3cg
eWV0IHdoYXQncyB0aGUgbWVyZ2Ugc3RyYXRlZ3kgZm9yIHRoaXMgc2VyaWVzLCB0aGVyZSBhcyBu
b3QgDQpiZWVuIGFueSBjaGFuZ2VzIHNpbmNlIHY2IG1pZCBEZWNlbWJlciBhbmQgY29yZSBwYXJ0
cyBhcmUgYWNrZWQvcmV2aWV3ZWQgDQpzbyBJIHdvdWxkIGJlIGhhcHB5IGlmIGF0IGxlYXN0IGNv
cmUgbW0gcGFydHMgY291bGQgZ28gdGhpcyBjeWNsZS4gSSANCnNlbnQgYSBxdWVzdGlvbiB0byBN
aWNoYWVsIGFuZCBBbmRyZXcgYWJvdXQgaXQuDQoNCkNocmlzdG9waGU=
