Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF1F83C758
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jan 2024 16:56:18 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=e2QdpFWm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TLQRN4gzDz3cVd
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jan 2024 02:56:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=e2QdpFWm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:261d::600; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:261d::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TLQQZ0W2pz3bWQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jan 2024 02:55:33 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lt+fCyS0mC8ItPS0pd81DqpHwUUtx8uo9v5tGQvqzbIqpjp/VPQF5/gvPmJai3iTUCfI72VL3QZBUSgmQggaQw4HnQZFjWP3DQ/OlOHLmpzZXRPhDQRZWp+WkgZgxOEvd3nbL6a53UGZxeQtqT19jZrzD3rZNsPTlOcBazSFwj0BL/bGzCWBH7x8fJPhMqE5SI2bMoMmw/yrBLffkifW7D/dWBI4zBlp9wGqvcuMJ0kG0gqW5SzEO2EHIM/TZRc+jW+P8jO+7bSwU9XgmP71yhknFxD5QLbyZ0C0AZnvwdlpSVlmlfGhUvaT9ayIIBXPXn8TxWDEiJrjFArShs4jJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zPd4hvR5iiv0e5ffzF1YMKa1LtHUkg5lH5/Pi39uRgQ=;
 b=etJp+bZT0NcsKV0lI4vvdzX9G/c6O5OrkPQKhamM5B/c2uWgMfygQaz3ysKwhKRF8VS6d4xEnRSHY4lUJjxt7jFmMDo/hDN7KI/Wl5pJ2A9NqHEcSIkEKPhMTb8Wb0LNkV3jd5cwXOqYwOYMrnrJww+lyw7Chn70wZQ0Z1qeXuVRxODN2tIfCBogTPuhhi4icH8TPgIARNkHjXXDHtUlB9hhD6ppDQKFUEL1w5BT59w5hjTxM5ANFOEMRoFCqtxFkBbQo4tYfiL5YJB9S6yDTx9lnEbFUx1/sHG6UOVDpLhFNgwce9s3U1oJFZ1FgToE7ldevIZKOFIYB17cvt9cSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zPd4hvR5iiv0e5ffzF1YMKa1LtHUkg5lH5/Pi39uRgQ=;
 b=e2QdpFWmnJTj+TZD4o08SZRrnQjuovOn6HJHwPwSZSwJm097rUkJ9+HT8bh2MFR/sUUiN9XyVNdNqta9yDTUFPnkrxEqbEYArYMTryANvlf/SgnVzGxyOEFehAPaV2JPu986uNyW890cwVGnpjIXDmKmyaqlIzQk+y1EBKzLZPis0W6Do5RYHM6N+n0w/nHkhyMSokTqE2q1SQppYpKoORYrAOrlcm24GQQhzU3DtuJlTRByEBV5mDDLmhthwX/tOg0saYY105T8mdaKK33EfIVgkysGvicdwmDW9E3IhFVu2OKmXq2tbBHgqxHHfTaonMLWY5EPh5TAkmmq+q4Ifg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB2191.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1b2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.26; Thu, 25 Jan
 2024 15:55:10 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9f77:c0ff:cd22:ae96]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9f77:c0ff:cd22:ae96%4]) with mapi id 15.20.7228.026; Thu, 25 Jan 2024
 15:55:10 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "nathanl@linux.ibm.com" <nathanl@linux.ibm.com>
Subject: Re: [PATCH 8/8] powerpc/rtas: consume retry statuses in sys_rtas()
Thread-Topic: [PATCH 8/8] powerpc/rtas: consume retry statuses in sys_rtas()
Thread-Index: AQHZUHNzvgETCt3DKkWwO9y8qB7dhbDsrNYA
Date: Thu, 25 Jan 2024 15:55:09 +0000
Message-ID: <33ca48b8-f847-4d2b-b95f-741f0e082d2d@csgroup.eu>
References: <20230220-rtas-queue-for-6-4-v1-0-010e4416f13f@linux.ibm.com>
 <20230220-rtas-queue-for-6-4-v1-8-010e4416f13f@linux.ibm.com>
In-Reply-To: <20230220-rtas-queue-for-6-4-v1-8-010e4416f13f@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR1P264MB2191:EE_
x-ms-office365-filtering-correlation-id: e716919a-eff6-4bfe-63e5-08dc1dbe026c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  XnOE1J7Trl/YwzPEpicx1wUuYOgmldt6vdGLqCs0txPNclafcMd9toR1gNxXrrPAGF0HMhHx5NdmBT0gZS0zxx/D4wj9DE5Xuoo+C7mbz0IDPJgeNyBzRrOqqt7EHnaskSAf1Oj7Oxr6us3h5K0Nx2iC6upxBgNrMUxuoz8S/htzfJXj1QLpkpSPfbY3dPPlS28xruN4WXw/IB/LHvFOPwsAlZh7Iufc1dvSkE0NleTJ334Xms2axlf0Bg1is2it7Be5N9O6IVxkRJvaJ9ym+jHHcNlPO9fMuQhmzT/toMgewaMCf32Ab5SY+q9HTR8DLJ5Kvz6BjvtPvqsUoGjSDxccoyWHBEXgyrLBcMVgtVn55pO9HBnlvNGdoOMyuiM2zd21GIWxhwGSzUZ/34wUSBEKI41FA2hw6FmVpR6I0ToDO6jHRPQHNQee+O6H8lZcbXnQJ411wSusH3wEcuUKK8fj59zVclbErIEeaTi1vrjBpZwf5V686bGPE56bYypUN9lazCjGzCDfIno17rH02hwbniV12iD+8Qg9sXiEOPga3JnsXoxxXG8tq/OocH8fHvvEzSSCzHHXscrRXVdCvW/km6zXwghdHD6NAhLq54DnM5zhYBftk88WoWHGcZdi7+aM2IDL95gogP5+4jJe1ohF3dnYBbATozs5g9+8i/I=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(39850400004)(366004)(346002)(396003)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(31686004)(83380400001)(36756003)(86362001)(38070700009)(31696002)(91956017)(8676002)(8936002)(44832011)(5660300002)(4326008)(66574015)(26005)(2616005)(38100700002)(71200400001)(122000001)(316002)(76116006)(66556008)(6916009)(66476007)(66946007)(64756008)(54906003)(66446008)(41300700001)(2906002)(6486002)(6512007)(6506007)(966005)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?OStibnRQYkpzdW8ycVhDU0RkTEZNMnMxYkpHd0FYSmNmL3NoeDJlNERvY25r?=
 =?utf-8?B?aTRuWG9PUzlLU3lUN2NjWUpDVFpFaVU2cTE0M0RPN2p2a0pnTzlsalR5Mmhs?=
 =?utf-8?B?Z2JoMC8yTEVEMXdqZms1MzA4UlZOWW8rU0p3amdMWFhTOFVpRjBxSDBlQy8r?=
 =?utf-8?B?cGM1YllwWEdZbE1zMjhacUxiUzY1MUcvK3dmTUU4T3hPb0JrUFcxQXFOZVcr?=
 =?utf-8?B?NG40U1RGNUI4WTZsc1p5Nit3K1FlMFJBYUhSSkFSYTVwYW9pKzBUNEhHWWxR?=
 =?utf-8?B?VmVRWmxtRE5qOHV2Vy9WKzAvR0p5OTJHemxndzJDZHRxdTdWenFDMm9iVm1S?=
 =?utf-8?B?SXhrTUhadnY1ekVNUjBCRWViL1A4a0p2NkJ0VDZKT1pHOXpFUUdVQW9aMC94?=
 =?utf-8?B?TStudzVudlZjbjlaTDY1WWFhc0FxT1ZYVVNmdVZqV09iZDJCL0JncjhSUzhu?=
 =?utf-8?B?NElCaGtpNUdaMlNPd0NXOEYvaHlBVDZRSWU1UHV3Rkx6VzF0NDhuS3k1VDc3?=
 =?utf-8?B?QmRQVjhNblNZeCtBek5aUTdMZ0I0ME1leFM2OVZsZXdXZDR3T2NiNU5SdjZk?=
 =?utf-8?B?U01zWVIrM2dGQVB4a2pJZGdYamlUenR1NHk5WHdNem1IOGV3RkdHeDRtUXN6?=
 =?utf-8?B?OHZFd0ZXZGNWN2JGendTTXlncjRrVkpnQTdZY2pBaWxhUEVFRnk2YWZySUNi?=
 =?utf-8?B?ZjJhVHlEY1kvR0tLTE5DQktuK1Fxa211T3Vsa0pwZms2bGVOdm1DVktzWStz?=
 =?utf-8?B?TFY3V1hFbUFWZEdqM2M4ZU42QnUrNVdPTXRySkxNeWVkd0srbGN3Z0drUkhC?=
 =?utf-8?B?SUNYK0h1OVEwWG5WWTVtbUhTN3I0V0xnMit6K01oZFc4VUJYY0o3aWF4TTJw?=
 =?utf-8?B?TjBjUjh1V1NuVEd2UGRjcE1nVHN0cDJFY2RjOW0yZDgvYnppeXA5TkU3azVy?=
 =?utf-8?B?V2E4R1JEWEh6cktNUEo0UEt6VVlZTmw3NHk1TXpUYnlZUkFHZ1ZpTTI3UVdV?=
 =?utf-8?B?UlhjakJhUzcydXA5aDM4Q0oxcmdvRFYrRDhLZVFWaURPN2RSQ3BsTW1HWUhh?=
 =?utf-8?B?UTdDL2N6aTJoaGp2UHkrbVFldzJFRnh6RGhJakxFQUs1cCtYUkxDZjZPVmNl?=
 =?utf-8?B?QkxOODVYK3J1TzRPSnJOR294a3pYalhoY1A5R1plMkU0dUUzZUc1L0UzbmhD?=
 =?utf-8?B?alFCR2tqdHdOYzB0b2xaZERYY1RvenJhOUdjSWdDTHlVYlp5N293WXh3TVZj?=
 =?utf-8?B?bXJQOWYweFFzY0NodUhzM3B3Zjl2TXEwU1psMTdDMW4wblZLa0ZVcHJoNkgy?=
 =?utf-8?B?bzA1RVdVSWk5b0pOV2JtQ1V5WExhUE5TdXAzYXNqaTByNjhzREVKRitQc0Qy?=
 =?utf-8?B?ZFRxTk9ZWTlHK0ZKWWdUdmhHZExCQ2xzT1F6QkVzazBxTnU1WHB6c2FnTVJM?=
 =?utf-8?B?NXpadUFkMjBNUEo1YjFBTGM2NFdoMmhmdDhFWVQ1Zy9NSDFobmF5NmhJam9P?=
 =?utf-8?B?Z3ppY1czZG1YNmd3OFQ3R3VTb2hJN0ZJWVdLSnFISEdwMWZ6SENlVlVhVGpZ?=
 =?utf-8?B?K3FxekhFNXpDM3NrNUtsMjdacVdxVkJiTnZqdy93NXRxRHJhM25VcENzS0NZ?=
 =?utf-8?B?SDU5U2sxNnNGeWFPYmF3czZpUzd2YkRTVVBvZE4wTzhLVCtVZWx1RmN4U0Zn?=
 =?utf-8?B?ZGhESU91elhDeEJSTGRSdlRoTlhGNFVmcEFXc3FsV09ES05xUDRTRVlaY3pB?=
 =?utf-8?B?MEc1d3dEN3pqZnNzU2l3dHpGTGxOSWI1ZGp1cjNvNWlLNDNtODhRUHBaMW81?=
 =?utf-8?B?dS9FajRDRWdVWHRTbDdLYXE3c0FnYkJaOUJoNStHMU9WTVp0TnJCZGJQbkZU?=
 =?utf-8?B?WDFqY2JHalR1V0JPdjF4U1VKTGFmQVFBaStOL001a21qdHhqQWliays3N0lX?=
 =?utf-8?B?UmpySkhyd3gvYUkzVE80SmQ4OGRGUnZzTUxjKzU5RTZXbERvMXJsUFJYUlBB?=
 =?utf-8?B?QWJPamEyMUpROUg4WU9iK2VhL0tOb3ZwN0VOWkFEcUYxSjRaeTBVYUtEdXpV?=
 =?utf-8?B?NHVnSmRKNFhVN2NGZk9HdURWeG4vY3ZQWUsxWlJEZ1BVaklnYUp5dEJ0WTVU?=
 =?utf-8?Q?XiYcZ65rEveKeNAr7Im9UvhEm?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D0F94DBC759C664CA1937E8DCC17A5AA@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e716919a-eff6-4bfe-63e5-08dc1dbe026c
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2024 15:55:10.0899
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1HY+sxYFgEqJvVO+0aeXnU3Ut480EwG9pIbRr6zG9BrUkMkY97z+ZKY+P7LN1r4hpnJOQAyFsDHNco+aSK3LmbumZwN/2hkhox8Yn3L0hgs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB2191
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, Nick Child <nnac123@linux.ibm.com>, Andrew Donnellan <ajd@linux.ibm.com>, Scott Cheloha <cheloha@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Laurent Dufour <ldufour@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SGkgTmF0aGFuLA0KDQpMZSAwNi8wMy8yMDIzIMOgIDIyOjMzLCBOYXRoYW4gTHluY2ggdmlhIEI0
IFJlbGF5IGEgw6ljcml0wqA6DQo+IEZyb206IE5hdGhhbiBMeW5jaCA8bmF0aGFubEBsaW51eC5p
Ym0uY29tPg0KPiANCj4gVGhlIGtlcm5lbCBjYW4gaGFuZGxlIHJldHJ5aW5nIFJUQVMgZnVuY3Rp
b24gY2FsbHMgaW4gcmVzcG9uc2UgdG8NCj4gLTIvOTkweCBpbiB0aGUgc3lzX3J0YXMoKSBoYW5k
bGVyIGluc3RlYWQgb2YgcmVsYXlpbmcgdGhlIGludGVybWVkaWF0ZQ0KPiBzdGF0dXMgdG8gdXNl
ciBzcGFjZS4NCg0KIEZyb20gdGhpcyBzZXJpZXMgd2l0aCBzdGlsbCBoYXZlIHBhdGNoZXMgNSwg
NyBhbmQgOCBhd2FpdGluZyBpbiANCnBhdGNod29yaywgc2VlIA0KaHR0cHM6Ly9wYXRjaHdvcmsu
b3psYWJzLm9yZy9wcm9qZWN0L2xpbnV4cHBjLWRldi9saXN0Lz9zdWJtaXR0ZXI9ODU3NDcgDQph
bmQgcGF0Y2ggOCBkb2Vzbid0IGFwcGx5IGFueW1vcmUuDQoNCkFyZSB0aG9zZSAzIHBhdGNoZXMg
c3RpbGwgcmVsZXZhbnQgb3Igc2hvdWxkIHRoZXkgYmUgZGlzY2FyZGVkID8NCg0KVGhhbmtzDQpD
aHJpc3RvcGhlDQoNCg0KPiANCj4gSnVzdGlmaWNhdGlvbnM6DQo+IA0KPiAqIEN1cnJlbnRseSBp
dCdzIG5vbmRldGVybWluaXN0aWMgYW5kIHF1aXRlIHZhcmlhYmxlIGluIHByYWN0aWNlDQo+ICAg
IHdoZXRoZXIgYSByZXRyeSBzdGF0dXMgaXMgcmV0dXJuZWQgZm9yIGFueSBnaXZlbiBpbnZvY2F0
aW9uIG9mDQo+ICAgIHN5c19ydGFzKCkuIFRoZXJlZm9yZSB1c2VyIHNwYWNlIGNvZGUgY2Fubm90
IGJlIGV4cGVjdGluZyBhIHJldHJ5DQo+ICAgIHJlc3VsdCB3aXRob3V0IGFscmVhZHkgYmVpbmcg
YnJva2VuLg0KPiANCj4gKiBUaGlzIHRlbmRzIHRvIHNpZ25pZmljYW50bHkgcmVkdWNlIHRoZSB0
b3RhbCBudW1iZXIgb2Ygc3lzdGVtIGNhbGxzDQo+ICAgIGlzc3VlZCBieSBwcm9ncmFtcyBzdWNo
IGFzIGRybWdyIHdoaWNoIG1ha2UgdXNlIG9mIHN5c19ydGFzKCksDQo+ICAgIGltcHJvdmluZyB0
aGUgZXhwZXJpZW5jZSBvZiB0cmFjaW5nIGFuZCBkZWJ1Z2dpbmcgc3VjaA0KPiAgICBwcm9ncmFt
cy4gVGhpcyBpcyB0aGUgbWFpbiBtb3RpdmF0aW9uIGZvciBtZTogSSB0aGluayB0aGlzIGNoYW5n
ZQ0KPiAgICB3aWxsIG1ha2UgaXQgZWFzaWVyIGZvciB1cyB0byBjaGFyYWN0ZXJpemUgY3VycmVu
dCBzeXNfcnRhcygpIHVzZQ0KPiAgICBjYXNlcyBhcyB3ZSBtb3ZlIHRoZW0gdG8gb3RoZXIgaW50
ZXJmYWNlcyBvdmVyIHRpbWUuDQo+IA0KPiAqIEl0IHJlZHVjZXMgdGhlIG51bWJlciBvZiBvcHBv
cnR1bml0aWVzIGZvciB1c2VyIHNwYWNlIHRvIGxlYXZlDQo+ICAgIGNvbXBsZXggb3BlcmF0aW9u
cywgc3VjaCBhcyB0aG9zZSBhc3NvY2lhdGVkIHdpdGggRExQQVIsIGluY29tcGxldGUNCj4gICAg
YW5kIGRpZmZjdWx0IHRvIHJlY292ZXIuDQo+IA0KPiAqIFdlIGNhbiBleHBlY3QgcGVyZm9ybWFu
Y2UgaW1wcm92ZW1lbnRzIGZvciBleGlzdGluZyBzeXNfcnRhcygpDQo+ICAgIHVzZXJzLCBub3Qg
b25seSBiZWNhdXNlIG9mIG92ZXJhbGwgcmVkdWN0aW9uIGluIHRoZSBudW1iZXIgb2Ygc3lzdGVt
DQo+ICAgIGNhbGxzIGlzc3VlZCwgYnV0IGFsc28gZHVlIHRvIHRoZSBiZXR0ZXIgaGFuZGxpbmcg
b2YgLTIvOTkweCBpbiB0aGUNCj4gICAga2VybmVsLiBGb3IgZXhhbXBsZSwgbGlicnRhcyBzdGls
bCBzbGVlcHMgZm9yIDFtcyBvbiAtMiwgd2hpY2ggaXMNCj4gICAgY29tcGxldGVseSB1bm5lY2Vz
c2FyeS4NCj4gDQo+IFBlcmZvcm1hbmNlIGRpZmZlcmVuY2VzIGZvciBQSEIgYWRkIGFuZCByZW1v
dmUgb24gYSBzbWFsbCBQMTAgUG93ZXJWTQ0KPiBwYXJ0aXRpb24gYXJlIGluY2x1ZGVkIGJlbG93
LiBGb3IgYWRkLCBlbGFwc2VkIHRpbWUgaXMgc2xpZ2h0bHkNCj4gcmVkdWNlZC4gRm9yIHJlbW92
ZSwgdGhlcmUgYXJlIG1vcmUgc2lnbmlmaWNhbnQgaW1wcm92ZW1lbnRzOiB0aGUNCj4gbnVtYmVy
IG9mIGNvbnRleHQgc3dpdGNoZXMgaXMgcmVkdWNlZCBieSBhbiBvcmRlciBvZiBtYWduaXR1ZGUs
IGFuZA0KPiBlbGFwc2VkIHRpbWUgaXMgcmVkdWNlZCBieSBvdmVyIGhhbGYuDQo+IA0KPiAoLSBi
ZWZvcmUsICsgYWZ0ZXIpOg0KPiANCj4gICAgUGVyZm9ybWFuY2UgY291bnRlciBzdGF0cyBmb3Ig
J2RybWdyIC1jIHBoYiAtYSAtcyBQSEIgMjMnICg1IHJ1bnMpOg0KPiANCj4gLSAgICAgICAgICAx
LDg0Ny41OCBtc2VjIHRhc2stY2xvY2sgICAgICAgICAgICAgICAgICAgICAgICMgICAgMC4xMzUg
Q1BVcyB1dGlsaXplZCAgICAgICAgICAgICAgICggKy0gMTQuMTUlICkNCj4gLSAgICAgICAgICAg
IDEwLDg2NyAgICAgIGNzICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICMgICAgOS44MDAg
Sy9zZWMgICAgICAgICAgICAgICAgICAgICAgICggKy0gMTQuMTQlICkNCj4gKyAgICAgICAgICAx
LDkwMS4xNSBtc2VjIHRhc2stY2xvY2sgICAgICAgICAgICAgICAgICAgICAgICMgICAgMC4xNDgg
Q1BVcyB1dGlsaXplZCAgICAgICAgICAgICAgICggKy0gMTQuMTMlICkNCj4gKyAgICAgICAgICAg
IDEwLDQ1MSAgICAgIGNzICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICMgICAgOS4xNTgg
Sy9zZWMgICAgICAgICAgICAgICAgICAgICAgICggKy0gMTQuMTQlICkNCj4gDQo+IC0gICAgICAg
ICAxMy42NTY1NTcgKy0gMC4wMDAxMjQgc2Vjb25kcyB0aW1lIGVsYXBzZWQgICggKy0gIDAuMDAl
ICkNCj4gKyAgICAgICAgICAxMi44ODA4MCArLSAwLjAwNDA0IHNlY29uZHMgdGltZSBlbGFwc2Vk
ICAoICstICAwLjAzJSApDQo+IA0KPiAgICBQZXJmb3JtYW5jZSBjb3VudGVyIHN0YXRzIGZvciAn
ZHJtZ3IgLWMgcGhiIC1yIC1zIFBIQiAyMycgKDUgcnVucyk6DQo+IA0KPiAtICAgICAgICAgIDEs
NDczLjc1IG1zZWMgdGFzay1jbG9jayAgICAgICAgICAgICAgICAgICAgICAgIyAgICAwLjA5MiBD
UFVzIHV0aWxpemVkICAgICAgICAgICAgICAgKCArLSAxNC4xNSUgKQ0KPiAtICAgICAgICAgICAg
IDIsNjUyICAgICAgY3MgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIyAgICAzLjAwMCBL
L3NlYyAgICAgICAgICAgICAgICAgICAgICAgKCArLSAxNC4xNiUgKQ0KPiArICAgICAgICAgIDEs
NDQ0LjU1IG1zZWMgdGFzay1jbG9jayAgICAgICAgICAgICAgICAgICAgICAgIyAgICAwLjIyMSBD
UFVzIHV0aWxpemVkICAgICAgICAgICAgICAgKCArLSAxNC4xNCUgKQ0KPiArICAgICAgICAgICAg
ICAgMTA0ICAgICAgY3MgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIyAgMTE5Ljk1NyAv
c2VjICAgICAgICAgICAgICAgICAgICAgICAgKCArLSAxNC42MyUgKQ0KPiANCj4gLSAgICAgICAg
ICAxNS45OTcxOCArLSAwLjAwODAxIHNlY29uZHMgdGltZSBlbGFwc2VkICAoICstICAwLjA1JSAp
DQo+ICsgICAgICAgICAgIDYuNTQyNTYgKy0gMC4wMDgzMCBzZWNvbmRzIHRpbWUgZWxhcHNlZCAg
KCArLSAgMC4xMyUgKQ0KPiANCj4gTW92ZSB0aGUgZXhpc3RpbmcgcnRhc19sb2NrLWd1YXJkZWQg
Y3JpdGljYWwgc2VjdGlvbiBpbiBzeXNfcnRhcygpDQo+IGludG8gYSBjb252ZW50aW9uYWwgcnRh
c19idXN5X2RlbGF5KCktYmFzZWQgbG9vcCwgcmV0dXJuaW5nIHRvIHVzZXINCj4gc3BhY2Ugb25s
eSB3aGVuIGEgZmluYWwgc3VjY2VzcyBvciBmYWlsdXJlIHJlc3VsdCBpcyBhdmFpbGFibGUuDQo+
IA0KPiBTaWduZWQtb2ZmLWJ5OiBOYXRoYW4gTHluY2ggPG5hdGhhbmxAbGludXguaWJtLmNvbT4N
Cj4gLS0tDQo+ICAgYXJjaC9wb3dlcnBjL2tlcm5lbC9ydGFzLmMgfCAyOCArKysrKysrKysrKysr
KysrLS0tLS0tLS0tLS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDEy
IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9rZXJuZWwvcnRh
cy5jIGIvYXJjaC9wb3dlcnBjL2tlcm5lbC9ydGFzLmMNCj4gaW5kZXggNDdhMmFhNDNkN2Q0Li5j
MzMwYTIyY2NjNzAgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9rZXJuZWwvcnRhcy5jDQo+
ICsrKyBiL2FyY2gvcG93ZXJwYy9rZXJuZWwvcnRhcy5jDQo+IEBAIC0xNzk4LDcgKzE3OTgsNiBA
QCBzdGF0aWMgYm9vbCBibG9ja19ydGFzX2NhbGwoaW50IHRva2VuLCBpbnQgbmFyZ3MsDQo+ICAg
LyogV2UgYXNzdW1lIHRvIGJlIHBhc3NlZCBiaWcgZW5kaWFuIGFyZ3VtZW50cyAqLw0KPiAgIFNZ
U0NBTExfREVGSU5FMShydGFzLCBzdHJ1Y3QgcnRhc19hcmdzIF9fdXNlciAqLCB1YXJncykNCj4g
ICB7DQo+IC0Jc3RydWN0IHBpbl9jb29raWUgY29va2llOw0KPiAgIAlzdHJ1Y3QgcnRhc19hcmdz
IGFyZ3M7DQo+ICAgCXVuc2lnbmVkIGxvbmcgZmxhZ3M7DQo+ICAgCWNoYXIgKmJ1ZmZfY29weSwg
KmVycmJ1ZiA9IE5VTEw7DQo+IEBAIC0xODY2LDIwICsxODY1LDI1IEBAIFNZU0NBTExfREVGSU5F
MShydGFzLCBzdHJ1Y3QgcnRhc19hcmdzIF9fdXNlciAqLCB1YXJncykNCj4gICANCj4gICAJYnVm
Zl9jb3B5ID0gZ2V0X2Vycm9ybG9nX2J1ZmZlcigpOw0KPiAgIA0KPiAtCXJhd19zcGluX2xvY2tf
aXJxc2F2ZSgmcnRhc19sb2NrLCBmbGFncyk7DQo+IC0JY29va2llID0gbG9ja2RlcF9waW5fbG9j
aygmcnRhc19sb2NrKTsNCj4gKwlkbyB7DQo+ICsJCXN0cnVjdCBwaW5fY29va2llIGNvb2tpZTsN
Cj4gICANCj4gLQlydGFzX2FyZ3MgPSBhcmdzOw0KPiAtCWRvX2VudGVyX3J0YXMoJnJ0YXNfYXJn
cyk7DQo+IC0JYXJncyA9IHJ0YXNfYXJnczsNCj4gKwkJcmF3X3NwaW5fbG9ja19pcnFzYXZlKCZy
dGFzX2xvY2ssIGZsYWdzKTsNCj4gKwkJY29va2llID0gbG9ja2RlcF9waW5fbG9jaygmcnRhc19s
b2NrKTsNCj4gICANCj4gLQkvKiBBIC0xIHJldHVybiBjb2RlIGluZGljYXRlcyB0aGF0IHRoZSBs
YXN0IGNvbW1hbmQgY291bGRuJ3QNCj4gLQkgICBiZSBjb21wbGV0ZWQgZHVlIHRvIGEgaGFyZHdh
cmUgZXJyb3IuICovDQo+IC0JaWYgKGJlMzJfdG9fY3B1KGFyZ3MucmV0c1swXSkgPT0gLTEpDQo+
IC0JCWVycmJ1ZiA9IF9fZmV0Y2hfcnRhc19sYXN0X2Vycm9yKGJ1ZmZfY29weSk7DQo+ICsJCXJ0
YXNfYXJncyA9IGFyZ3M7DQo+ICsJCWRvX2VudGVyX3J0YXMoJnJ0YXNfYXJncyk7DQo+ICsJCWFy
Z3MgPSBydGFzX2FyZ3M7DQo+ICAgDQo+IC0JbG9ja2RlcF91bnBpbl9sb2NrKCZydGFzX2xvY2ss
IGNvb2tpZSk7DQo+IC0JcmF3X3NwaW5fdW5sb2NrX2lycXJlc3RvcmUoJnJ0YXNfbG9jaywgZmxh
Z3MpOw0KPiArCQkvKg0KPiArCQkgKiBIYW5kbGUgZXJyb3IgcmVjb3JkIHJldHJpZXZhbCBiZWZv
cmUgcmVsZWFzaW5nIHRoZSBsb2NrLg0KPiArCQkgKi8NCj4gKwkJaWYgKGJlMzJfdG9fY3B1KGFy
Z3MucmV0c1swXSkgPT0gLTEpDQo+ICsJCQllcnJidWYgPSBfX2ZldGNoX3J0YXNfbGFzdF9lcnJv
cihidWZmX2NvcHkpOw0KPiArDQo+ICsJCWxvY2tkZXBfdW5waW5fbG9jaygmcnRhc19sb2NrLCBj
b29raWUpOw0KPiArCQlyYXdfc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmcnRhc19sb2NrLCBmbGFn
cyk7DQo+ICsJfSB3aGlsZSAocnRhc19idXN5X2RlbGF5KGJlMzJfdG9fY3B1KGFyZ3MucmV0c1sw
XSkpKTsNCj4gICANCj4gICAJaWYgKGJ1ZmZfY29weSkgew0KPiAgIAkJaWYgKGVycmJ1ZikNCj4g
DQo=
