Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2017F852A83
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Feb 2024 09:06:13 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=P9YGBBLm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TYv6C0WKQz3dVd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Feb 2024 19:06:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=P9YGBBLm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:261d::701; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20701.outbound.protection.outlook.com [IPv6:2a01:111:f403:261d::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TYv5Q4WDGz3bcJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Feb 2024 19:05:29 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qo/WL2r22Dxm7+ddKbqigLyBsPdZverYYVUzDh0qItzsD1Oi/wtGz2JB/KAiXWoZWbhLqHDurBLfMA7gbIHzhnmY6NIuopqZTgZX0AL76qi0FFWKJ2rN403aBVzCyaS7svMuYKItlrAeSaH8WnXgEAhPHi8JZPaCSVH+3IyG5txRAeERBCu0uYKD/avZogZapdaSBC07F7sowP0UkvKhDI+7SGcjiXiJuaiFqRHC9bQj6ihsYx/vEiptWLcm0c4z58Tlp4KTaJcYLpA9jN4TK0faFz4hd8Pb4PVyviVd+blG7Yyaf8UsJjOxktP1qKoWJQG/JSCemUmugwODjyMRYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DJL5oZXN8qA/KmKcSwLKlTiVDjv+roHps6EDhcBLAm0=;
 b=OFXE7GbUGowpE9MCMTenqGvWIJQ4v11tVabrCmOebXpGzgv2y26ZoP33Pbvt/BprG2bu0jJqsncf7zksn4pRKiK3XCY/k0c4smwC+QMvUeFR2kvig7mpamFaS9SM+esdB6Je1nUCBkaQEv+LU229eoFiab3Y3NPLwcau9UZNT/h7y7yCzc0P7gEYp+pQBHNbwGLJAN6ic0ClwGhVDAsZP1NzPSeHJuJ0LqFL+sJtM98hvq+EKni46Hues7us8NCWokzLpL+X6214EzvsC5ZdoX57c0sAL+Ymtcy9txPpSRIrAqE2SXjxZuIVmi2nO+5ZoG6h8enhWWPyDolY2CGxJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DJL5oZXN8qA/KmKcSwLKlTiVDjv+roHps6EDhcBLAm0=;
 b=P9YGBBLmbUk0gnWME4rwddP+lDAYW8plL6M/o/4mQ+poa1sBdx8qJ63bCsJ10nCif3iUIobRiHg6oczxB+FDk9WyzhfcgHtBQdPpfskoL3NXFfqYyTdkBzhhhB01MxkERoWqMsQxLbLQHcT5XUnygFRypP29wjBRD8gfjBVSB/axZqiOxU35X61oGeGpkOomfVsITxJ/JW6yALG3m9wQDzA2GMir5Kjk+VCK1Vl64KbHv+ZMA+oHnxEZpt6fs6GObS2lBmTmWqnaqhHRSPIh6nBzCT+kF3RJieJbC7oZ4oSXXgfsu7Iasx2iqMAlZwASUHSufjlupfWMoQ+ij92bsg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB3100.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.38; Tue, 13 Feb
 2024 08:05:09 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::64a9:9a73:652c:1589]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::64a9:9a73:652c:1589%6]) with mapi id 15.20.7270.036; Tue, 13 Feb 2024
 08:05:09 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "Ricardo B. Marliere" <ricardo@marliere.net>, Michael Ellerman
	<mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Aneesh Kumar K.V
	<aneesh.kumar@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Subject: Re: [PATCH v2 0/5] powerpc: struct bus_type cleanup
Thread-Topic: [PATCH v2 0/5] powerpc: struct bus_type cleanup
Thread-Index: AQHaXe6we02zXLjMSkCnOQDqmU40+rEH6toA
Date: Tue, 13 Feb 2024 08:05:09 +0000
Message-ID: <417a6531-b298-4d5c-aa4d-755bcef2f414@csgroup.eu>
References: <20240212-bus_cleanup-powerpc2-v2-0-8441b3f77827@marliere.net>
In-Reply-To: <20240212-bus_cleanup-powerpc2-v2-0-8441b3f77827@marliere.net>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB3100:EE_
x-ms-office365-filtering-correlation-id: c097e738-e101-4fc2-4bed-08dc2c6a7f95
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  KouynjK15o+Yi39NqFq8RHfVzqWH2nQXdNcAZFEtiNCxdpAL1jnWZi4s1UYKWTfPguF8aV8gsHFjtgFvJWMVod2FsWcjxUZdw2wQTPiOwI73oKkr5S5YzNp39d4l72Z9bjmAzUyPKaQsBgILPYG7lMF/L/7HcPxIz2fNzGRL3ACWqvozn+PAsc07SbHm3HuOMo/pth0D9CngqGccylI8vqfHctIPAvJchX83wnsj4Qicg78YWlU9jf9waEC4VIxV24gncEpaNZAFgCxRzAN7h4qkPmnUAzftOGe5WKzKsMMBHU09gWFECbhstBJZ+kRf10Ui8/VDWZ80iP1D0jubn1LldlO7BG6dsC3KtCY3La5MJseITf+EBbv6hqc7r6uCU/ROATYyszSAd8DbRaB4Ut5fTjstUuVsO3QbyAeFlnbffWTfJjFOU7Z10qqkZmDnPsbhWxFhBLeiH9L5+fGjKisnSdnkW5apA0jjRI0GVn0HhHB2S+8wq3RoXnYRYWTHib0k1iox9jFIIYuwgQiy7gqW7eu4jzX4ec2lyft30T2L+WxgBxTUtZ19k8yYEMpNuNfYwGyX1ThUViKYVmWAjZ/xlo6fIiqTGkfnYfEQ8yc=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(366004)(376002)(396003)(136003)(346002)(230922051799003)(230273577357003)(1800799012)(186009)(64100799003)(451199024)(36756003)(4326008)(478600001)(2616005)(64756008)(26005)(41300700001)(8676002)(66946007)(66446008)(76116006)(83380400001)(66556008)(66476007)(8936002)(71200400001)(5660300002)(91956017)(38070700009)(110136005)(54906003)(6506007)(6486002)(31696002)(316002)(86362001)(966005)(38100700002)(122000001)(6512007)(2906002)(44832011)(31686004);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?UXB0YWFPdFBiM0pScEtvbXBwS0IxQ0R4cHliY2p0OWcvN3JIbjI4czVBanRR?=
 =?utf-8?B?bjNTVitBQVJadCtuZlV1RUlpR1pBYWxKYk5ORXpCVWZsNGE0cngrRytEK2tq?=
 =?utf-8?B?QnhXL2dvUXZqdU15VHlKZGIzdklYZWNUU1ErOWNHNGpnN2NlQTFKR0wzR1FR?=
 =?utf-8?B?VWtaL0hRbHBNNHhHZm9YNDVCclZKTGZkeDVqUzM2RmVVeXR2N1ZGZW5jN2Fh?=
 =?utf-8?B?SFpxK08xOUpwOWIzSVN4U2RPRS84eG1oc3BRcVNTL1k1RDdMZW44S3kyaU83?=
 =?utf-8?B?ZTFCSlFEaE1lTENtNmNsbkltcEcvZWY1QTVzRlE2bkk3eDVjS0NnK1ZjQ0JP?=
 =?utf-8?B?U0Vsb0l0ai9zTUxMOWsyR2lFQVJSQVI5TVlPZUF6M2dXdVhpelVGNTJIV1Vz?=
 =?utf-8?B?ZUYrcXNyajBYSE1zSzAwMXlybE5sbHdsc0VIdmE1Z3NLL0E4NzBraitxcWdl?=
 =?utf-8?B?MkdMWTJGWWFXV0ROVmh2UDltNktsdllFdmJlbXB6WTZPRnRSVS9sQkt5S1ht?=
 =?utf-8?B?Qm42SlEwUVV2SXY2YWNuSmhzY3FjS1k2S2VBS3VxMi9HLytFSkVQeVpPL2Za?=
 =?utf-8?B?aGNYT2EzSEFROVEvTUlRUlN1cVVaeGloL1NHTFBha3Zkay9hTmU1Wm52Nk9i?=
 =?utf-8?B?SXBOTWVydGM5RmxSTU1Vd0g3VUx3eHE4cXZ3WlQvUHBrUnErbklNSW1sRXVq?=
 =?utf-8?B?blhhMFc1RURUc1hWUWJ2N2txck51cGtvUGUzMFVibkJVd0RaVExSS2xIRlQ4?=
 =?utf-8?B?SUl0bVBvMzhuSnduYjZ5emlTVEhnN1Q5YzFtS0JqanhJajNJMHVjNnZsNHYw?=
 =?utf-8?B?Y296WE1GMXpxS05rNTBKMHE4QUpZMVdOSUNzOERVMy9Ic1UvSyt3NEJkVmdM?=
 =?utf-8?B?b0g3cUtwYkVnSTFhMDdWVmVvUXBzWUlUb0F6RGFKV1FJcW5RNENJRHNWb0Fp?=
 =?utf-8?B?MVdJM2lyQjFCT0JEM0VRa3BNdDRCM3Y1V2N1dml5Vjl2MVRjUTVHODBUT2xK?=
 =?utf-8?B?UjJ0SEI5aUV0V3k3OXA1dnBvdW9vei8rb1NWZGhPSjUyTGYzNVRQV2RmZ0c4?=
 =?utf-8?B?SEV3ZitiamxFNmczUWVhVDlEQ2VxMGtWaVJDU1VlRUlTZWl2bFM5RFlHb2sw?=
 =?utf-8?B?MndnRzI4VFZKUVY1bjhmd1BjR2lYNlNCTURrYVA4LzBQVjczR0pyNVduRlhu?=
 =?utf-8?B?VkVpUDJXZUFSdzBMTkFGM3dOY0V5aXRQSW03QURYb3luNFFUT1p1VzNoNHl4?=
 =?utf-8?B?VjNHTTRQampSbXZpWnZHeXhmaFowQmdJTlpORzYyWndKaVJvUitRVVdkcDJK?=
 =?utf-8?B?MmQrcXMrQkRZQTEwemlmY1JJQzV4QnZtKytjWmltTFFKemdtZUFlNFZKSEt5?=
 =?utf-8?B?WldoMmZzOU9FOHRBMkVsbnhmRE9OLzJUSUFBWlNjUmgzQVh0SjhJOFN0Tldv?=
 =?utf-8?B?N2RRMXlNUkhoMk5UWi9zalpROUYwd2JJU2F4WTdrdzZlOTFJWG9OR1dJOGlC?=
 =?utf-8?B?UTNYMkFBdzVjemVBNWMxM3JrclQxZ2wwQndrRDNBTmNXQklsaEhDc2NJOWFy?=
 =?utf-8?B?SXcwNlR5cm9ITUxrbUY4ajM0SFVGSlJPeEJhSnVwMmZvbEgva0M4ZDAzMDRH?=
 =?utf-8?B?Y2tVckZCeDkwd1J3WFNwQVdtSWRmelRiQ2gwMlByWXhBbUlKaGpkUkw0S3B3?=
 =?utf-8?B?MHdiWWpGalFRSWoybmZySUF2VEZUVUFVbzJ1K0xQbWpxMUwvV1pmUlhuR01K?=
 =?utf-8?B?SXhUdVNXRDUzcHgyajU0ZWVuaFlkdjNPbXFPVDBIaXgvelJJVzRoUFNYY2Rt?=
 =?utf-8?B?UlpTdVVzbGs0b2ZGNGVjempzY2pkYk5oWlFlZlRWbk5Ia0VEdGNsZXEvdGVT?=
 =?utf-8?B?aTBXTkJjUGdLV0dVZXpaZU83dVBRWEFKclVOLzA5anNJcGpQVUMyT2hTNXF4?=
 =?utf-8?B?OXFZOFhqNkU2d2p0c1lPdmZSQnpzR0tHeEpBYVJiNG5sc215ZUFRc3kzeXZn?=
 =?utf-8?B?UTJMNnFQWTNnRnZYdThvTVRycXUvTVpqTGJka3I4emJhVDlBOXduM2cwTE5k?=
 =?utf-8?B?OWNYeXVWWXRvV1AxcVRTVkdJWEVpcWR6NFJ4RVRjWEltOGNISW5RdVdBajhS?=
 =?utf-8?B?YnVPbjZIRDhTdVgrQmN4Y3JxditIeFJCSE9hYTdzVHJDMERKdzJHNWdhQlI0?=
 =?utf-8?B?a3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <76EBDD58272F224495C4807328A9372D@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c097e738-e101-4fc2-4bed-08dc2c6a7f95
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2024 08:05:09.7993
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SGyawk3X2iSG+g0PyoEQJsxEOttCZ8CxGEL7Y/TrO8aIlLpoFltEJ2Wv9cgXA0Y2KOXFZQ3f1myQt7cQ71A9Yml5QrZ5YVqEOuNcMl1vf1Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB3100
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SGkNCg0KTGUgMTIvMDIvMjAyNCDDoCAyMTowNCwgUmljYXJkbyBCLiBNYXJsaWVyZSBhIMOpY3Jp
dMKgOg0KPiBUaGlzIHNlcmllcyBpcyBwYXJ0IG9mIGFuIGVmZm9ydCB0byBjbGVhbnVwIHRoZSB1
c2VycyBvZiB0aGUgZHJpdmVyDQo+IGNvcmUsIGFzIGNhbiBiZSBzZWVuIGluIG1hbnkgcmVjZW50
IHBhdGNoZXMgYXV0aG9yZWQgYnkgR3JlZyBhY3Jvc3MgdGhlDQo+IHRyZWUgKGUuZy4gWzFdKS4g
UGF0Y2ggMS81IGlzIGEgcHJlcmVxdWlzaXRlIHRvIDIvNSwgYnV0IHRoZSBvdGhlcnMgaGF2ZQ0K
PiBubyBkZXBlbmRlbmN5LiBUaGV5IHdlcmUgYnVpbHQgdXNpbmcgYm9vdGxpbidzIHdpdGhvdXQg
d2FybmluZ3MgdXNpbmcNCj4gcG93ZXJwYzY0bGUtcG93ZXI4LS1nbGliYy0tc3RhYmxlLTIwMjMu
MTEtMSB0b29sY2hhaW4uDQo+IA0KPiAtLS0NCj4gWzFdOiBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9sa21sLz9xPWYlM0FncmVna2glNDBsaW51eGZvdW5kYXRpb24ub3JnK3MlM0ElMjJtYWtlJTIy
K2FuZCtzJTNBJTIyY29uc3QlMjINCj4gDQo+IENjOiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdr
aEBsaW51eGZvdW5kYXRpb24ub3JnPg0KPiBTaWduZWQtb2ZmLWJ5OiBSaWNhcmRvIEIuIE1hcmxp
ZXJlIDxyaWNhcmRvQG1hcmxpZXJlLm5ldD4NCj4gDQo+IC0tLQ0KPiBDaGFuZ2VzIGluIHYyOg0K
PiAtIEFkZGVkIGEgbmV3IHBhdGNoIHRvIG1ha2UgbWFjaW9fYnVzX3R5cGUgY29uc3QuDQo+IC0g
SW1wcm92ZWQgY2hhbmdlbG9ncyB0byByZW1vdmUgdGhlIHdvcmQgIk5vdyIuDQo+IC0gRml4ZWQg
YSBidWlsZCBlcnJvcjogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvb2Uta2J1aWxkLWFsbC8yMDI0
MDIxMDIxNDIudXBoaUtlcXctbGtwQGludGVsLmNvbS8NCj4gLSBMaW5rIHRvIHYxOiBodHRwczov
L2xvcmUua2VybmVsLm9yZy9yLzIwMjQwMjA5LWJ1c19jbGVhbnVwLXBvd2VycGMyLXYxLTAtNzlh
NTZkY2FlYmIxQG1hcmxpZXJlLm5ldA0KDQpJIHNlZSBhbm90aGVyIHNlcmllcyB3aXRoIHRoZSBz
YW1lIG5hbWUsIGRvZXMgdGhpcyB2MiBhbHNvIHN1cGVyc2VlZHMgaXQgDQo/IGh0dHBzOi8vcGF0
Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9saW51eHBwYy1kZXYvbGlzdC8/c2VyaWVzPTM5MzU3
MA0KDQpDaHJpc3RvcGhlDQoNCj4gDQo+IC0tLQ0KPiBSaWNhcmRvIEIuIE1hcmxpZXJlICg1KToN
Cj4gICAgICAgIHBvd2VycGM6IHZpbzogbW92ZSBkZXZpY2UgYXR0cmlidXRlcyBpbnRvIGEgbmV3
IGlmZGVmDQo+ICAgICAgICBwb3dlcnBjOiB2aW86IG1ha2UgdmlvX2J1c190eXBlIGNvbnN0DQo+
ICAgICAgICBwb3dlcnBjOiBtcGljOiBtYWtlIG1waWNfc3Vic3lzIGNvbnN0DQo+ICAgICAgICBw
b3dlcnBjOiBwbWFjOiBtYWtlIG1hY2lvX2J1c190eXBlIGNvbnN0DQo+ICAgICAgICBwb3dlcnBj
OiBpYm1lYnVzOiBtYWtlIGlibWVidXNfYnVzX3R5cGUgY29uc3QNCj4gDQo+ICAgYXJjaC9wb3dl
cnBjL2luY2x1ZGUvYXNtL2libWVidXMuaCAgICAgICB8ICAyICstDQo+ICAgYXJjaC9wb3dlcnBj
L2luY2x1ZGUvYXNtL21hY2lvLmggICAgICAgICB8ICAyICstDQo+ICAgYXJjaC9wb3dlcnBjL2lu
Y2x1ZGUvYXNtL21waWMuaCAgICAgICAgICB8ICAyICstDQo+ICAgYXJjaC9wb3dlcnBjL2luY2x1
ZGUvYXNtL3Zpby5oICAgICAgICAgICB8ICAyICstDQo+ICAgYXJjaC9wb3dlcnBjL3BsYXRmb3Jt
cy9wc2VyaWVzL2libWVidXMuYyB8ICA0ICstLQ0KPiAgIGFyY2gvcG93ZXJwYy9wbGF0Zm9ybXMv
cHNlcmllcy92aW8uYyAgICAgfCA2MSArKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLQ0K
PiAgIGFyY2gvcG93ZXJwYy9zeXNkZXYvbXBpYy5jICAgICAgICAgICAgICAgfCAgMiArLQ0KPiAg
IGRyaXZlcnMvbWFjaW50b3NoL21hY2lvX2FzaWMuYyAgICAgICAgICAgfCAgMiArLQ0KPiAgIDgg
ZmlsZXMgY2hhbmdlZCwgNDMgaW5zZXJ0aW9ucygrKSwgMzQgZGVsZXRpb25zKC0pDQo+IC0tLQ0K
PiBiYXNlLWNvbW1pdDogNDFiY2NjOThmYjc5MzFkNjNkMDNmMzI2YTc0NmFjNGQ0MjljMWRkMw0K
PiBjaGFuZ2UtaWQ6IDIwMjQwMjA5LWJ1c19jbGVhbnVwLXBvd2VycGMyLTQ5ODQyNmZjY2I5OA0K
PiANCj4gQmVzdCByZWdhcmRzLA0K
