Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4A481CE6A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Dec 2023 19:24:33 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=lOge1ZLf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SxbL66qwlz3cYL
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Dec 2023 05:24:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=lOge1ZLf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:261c::600; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:261c::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SxbKD5zp6z3cNY
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Dec 2023 05:23:41 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HROPwIniOdrXoIldrKwAWeemH+63ROwXmS8GIDg+DUQo78sRMqvc3WGof5SpUpqXxHx8FP8tMyr/MtardcP7ib+sIT0L9cujX9KM9fNjFAMSuM8tQ7uS9214XLKOVjCrtdqFpbp6HRHyx0BW/w6vnH6Z2RtEDg8zo3hIvZIzdPXgpZfAZm+9BE8XSyEn74LG6m72XuSuJqBcPuks8O4C4ihrmLWADhy2AyYSa160/m7kHmPyWvOXoVje+K5RdEIT0gOXaQs3DugI9f9JISI7kHvZzx0hBMRpogUqFTOYZckeuk+UmAOO2DnFnjxtJY6V+cSK7rD2DESmSgqgnJTDjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YnxHEarcBW9bLUQn4n3lwrBE6L0mxNoPktb4umvW7nY=;
 b=b+DPZh5YfEYA5PqbbgNt1Bogoy3sGIrMK2ZAWmq1+Ru9vuls1TRaihfc9PK9jB7sztDRcR3Bhnf3SP4x5x66jGgL7aOqZDOs4tr2chSraY97DkOdrkCIKd8C+4zZL0Q7dlM6DEnFJoI3E0ORgFqtfiPxb9U8Jf28FzU9ruH0W/wzGqERqr4Jpb2MjLvn5Jo19+E2MgHy59X+Q8SrBWe204YkT8QWpTvkACOz479npzBK6W+R4oLDgqZK+2QdbRMVw3FgyhUzR2Llj0tcgcz3rU29WAMB1dlB/iFi/jdeaHGMQiksUVvvfoRS2H8F4NJuB5aDXqQYA6SqwpRmAW4SiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YnxHEarcBW9bLUQn4n3lwrBE6L0mxNoPktb4umvW7nY=;
 b=lOge1ZLfR2KmPzquNdpBswh6QM3C2vIm5ALJ19Wme/TiWcseNK+nFiJljQUcwjZMFPuJHxjHVehFIJ58dNkRS/qmqR9ovkeA+9qrlqUCuu1Wef55AGp8zxdpnJFsmFTr4t7fVxXUPzBWliN9kGbMNN9PpymChlOiO7jOtccMYy8VpPBC2ylQCL88UnsZ/O77RhKj1yiaZc1H82W+cTNrjeCnOg/H8t3jAcmNW4fI44wUbFCFeuN9k8KOX1qsPsGq/LMnr3rerdddC0mMvYC9GeuD/8YRGiGta2z1LXzibb3HyeozfxD9JYLk+FyAFU86Wa9TFsTztClfmriH88VLWw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB3435.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:14a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.22; Fri, 22 Dec
 2023 18:23:17 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f788:32b4:1c5e:f264]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f788:32b4:1c5e:f264%7]) with mapi id 15.20.7113.019; Fri, 22 Dec 2023
 18:23:16 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Kees Cook <kees@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Luis
 Chamberlain <mcgrof@kernel.org>
Subject: Re: [PATCH 1/3] init: Declare rodata_enabled and mark_rodata_ro() at
 all time
Thread-Topic: [PATCH 1/3] init: Declare rodata_enabled and mark_rodata_ro() at
 all time
Thread-Index: AQHaM+yXNPEoBBWgvUqc5dink/c7D7Czp1QAgAEiJwCAANaHgA==
Date: Fri, 22 Dec 2023 18:23:16 +0000
Message-ID: <15e7109f-8362-4216-a56c-f6591a3ebaf9@csgroup.eu>
References:  <7b5df1782e94a755b4a18733af44d17d8dd8b37b.1703149011.git.christophe.leroy@csgroup.eu>
 <87bkajlphj.fsf@mail.lhotse>
 <D5F308F6-C394-4CC3-9C0C-923EDB055D0D@kernel.org>
In-Reply-To: <D5F308F6-C394-4CC3-9C0C-923EDB055D0D@kernel.org>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB3435:EE_
x-ms-office365-filtering-correlation-id: 53ba7f2f-621d-449d-b5ca-08dc031b1135
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  fJxWD9zXesrTox8/nPa2p12teVu+DnouGUYI6Yn22ZeCsepj0UF1T5OEL6PiOmgrwudLdxlJBk7gPP29/jToMsRIWj3uLVOyXaDCyYStO4biYWmRpBAJ1M5O+WKVrVpLmzfl8bxlZ/+TAjr8fC0bZIgroXs9kakXuU5u+J/Knb38gpUnIFRvxr9jenHWZTpbbPWQJMJM8fqmFgHCNGYfGIMNJyBcJOzcPae1eXu9AEVbu8v6vq2HNVYaybvyPAS4IlNIBd0umXsQNiwXkqxZLJv4o9Z+8nKLx2vCdHMg50qyyhuJghrrnC/57tvV/0CcyHqI+dR+LLa0ck++Zp51G28aHCgYVCvF8rWen0JzWNEMOo+NkG2fybSDiwmFmpBzotW3YE6mutwnCcD0yrm5y9AiWTWWis/ZGeYONzG9npNRDNhJCV18gQSRyOuTX1j0KGRTzc2/7jBZyq+onoeMeaTSmzu6vNPj23Ecarb3Xu5VzzbVylBidLtmQ0TkX4Tkc73FuhNSUyPgIL/eErdSypreHGKzOH2u5fB17kKo1ZCBrVLdf5F8zfTMxHMhXLtIGvrSUd1O4xtFr2Y9ZgXsa1dEcPfYi2x+dtNWbnGmDIS2eWs0QB1ljvlbMjA2he5Eneuck/KE7KhQOS3SIcwINOSGG5QFBEVfDBZIz7SnUb8IcFfogtXUNdfJ9Jdl77Gy
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(39860400002)(376002)(136003)(396003)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(38070700009)(2906002)(6506007)(6512007)(8676002)(8936002)(41300700001)(122000001)(5660300002)(38100700002)(86362001)(31696002)(31686004)(36756003)(44832011)(66574015)(83380400001)(4326008)(64756008)(2616005)(66556008)(66946007)(66446008)(66476007)(26005)(71200400001)(6486002)(316002)(110136005)(54906003)(76116006)(91956017)(966005)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?OHlYNkpYVjBUeDRpdFU5cmc5U0VRTXBvbWFXbU1xMHlwTTN4dmVTYU4wRUdu?=
 =?utf-8?B?UlpHOUkrM2dPQm5MOFpMR3FnQkdLOGRCRE95N0ZLK1Y3bHFucXA3dmNQWVZU?=
 =?utf-8?B?MU1ZbzhENUNLOGgybDdlS1R0UkZGL1pMTC84TG9Kc2I4WnJhUGhia2ZYTzNG?=
 =?utf-8?B?S1BCUjlsQWo0NVcyeGVNc1crZmhMWGR3WE50YlJrM0NaeUJhSSs3SHR0LzNF?=
 =?utf-8?B?UHo4UHFWM1lqSFRjUVdHekhBNEw5SXVLOVVFN1VacVE5R3lDNkNGbzI5bkFT?=
 =?utf-8?B?WCtPK2Z6Umc4WUhCY2p5bjRDV3VqSDNMdDNtMDlVYVJqam9TeUtyblB6cEQy?=
 =?utf-8?B?M2NWVXFXZUlXQ0Fxc0Zpd1lhOGVqZ1BiWGVvY2lrUHZYME44WE05MEw2Kzc0?=
 =?utf-8?B?ekNQcFltS1hLenE1ZHUwVnZ0Zko2b3VpRWI0ekV4MUpMeWpQWUxDYU9weldC?=
 =?utf-8?B?WisrMHNzZy8xQ3hER3VmdEpDeWZ6NEpvZG4yL0tpVFIrSmhBVk13OTVMNUQr?=
 =?utf-8?B?WkxBekVGU0x0dEVMK1NUOE14WlpQNm05QlJHSWdtNEFqUDZ2MG5paGNGUXlX?=
 =?utf-8?B?aWxZRmFHOVJBa3ZKR21jYnhEU2VSOWNuM0pmZ0tnUE84N3Q2Z2FaOGV0M2Qx?=
 =?utf-8?B?ZlhTVzZwNFR6RzBFeGJPSHVkUGtERWZZVnNyV3pYWEZoaFdHN1BBa3JtcWxP?=
 =?utf-8?B?eWtBSVV4RUlqUS85OCtHTUJUK241TDV6QnRMOTZQNkpNN1NMdmgyTit4eEt1?=
 =?utf-8?B?YS9pRG16eHUzZHdTcWtNWEtLdXJ5czcvSXVEbnpOS3hPNjVoenQvQTltVHBp?=
 =?utf-8?B?Z3ZmWkl2Z0I5V3JBczl2Y0dHb2N5Wm05Qm9NOFdhUUpGeXVVNUpvOEFxbGpV?=
 =?utf-8?B?NHJZVStHSjRNbUVKbmdtaGwycC92N2NEQnBTZVJxcFQ1Z1ZmWXhVRFJRUzI3?=
 =?utf-8?B?aGhTdi9vOVRSdXlFUXBPbmd4U21sNlFSM2xzcVNvemJTZUFOajcySGhlUE5x?=
 =?utf-8?B?dDNtNFB5UDRLV1ExUlNJUTkrcm5lMEU2YWhqT2lua3BhVk9aYWxudkozS29w?=
 =?utf-8?B?M3hFMUdIK1FJSVdzQ051ZUFEenZhSG9MNDc4dm1KYWRuTG5CT1pJaVBDUlcv?=
 =?utf-8?B?cGZ5SHpYUVZKOGptUEI5TmtzZU9ZZEdaTE4vOGZ2Uys0bUw3alM4U0h3cFZO?=
 =?utf-8?B?THcrRjl4TmtuQUl3bkFDYjRhU0dibVdpS1Y4RGRIVExWTElCZXdCSm9RWlJp?=
 =?utf-8?B?Wm5TUWtyekxxVTdIMWFMOE5QWUR1WDc0ckt0bGVrRmQrNURiMTlvcnFOb21I?=
 =?utf-8?B?YVJ3TXE1anFXUHh1S3ZBVzBoaDZIdm5jZmpRNE52T1FTNHNYcGFyaytUQ0E0?=
 =?utf-8?B?NEZaOUxPdFJDVy9oVkFkdkJPV1Bia2ZYZURVUDVSVEZjQy9uV2RrQ29QbTJk?=
 =?utf-8?B?WnNOTDgwTnAvQ2ZNL0N3QWJSQmczdkJRUFd5VGZpMkFOUUdSZmlubEEzQjBi?=
 =?utf-8?B?TWQzTlBxNityYXluSmtwaXo3V3cvVlBtWnhzdnR2SGpia05EM0N1VVJPa1ZF?=
 =?utf-8?B?bXRaTEFRK2xZODJ4QjF6Z0lOcTVnVHdrTUQ3Z3JLUWtYaEVSUUJOREdqZURq?=
 =?utf-8?B?TXk1UlJWN1UxZzBoMkZjNS8zdjdUNndLR0s0QkhMdW1LUFF0a2lINFh1cmV1?=
 =?utf-8?B?dTM0ZWNZTVJ1OUxBR2dibjUxQjdUYWpDSit1UEg1Y1pSeCtCY1lxNjVTckdF?=
 =?utf-8?B?clc0T2ZVWjdmTnVSTTJ2bmtoempxb3l6ajVWSmFYZHYzVk5zL1ZmdWxtL1Iz?=
 =?utf-8?B?V3R0WmIrVlB3dzBuNTI4RVZRbUhHblFWQWRSWHhSeWV1Nmw3YkJQWDN1U1JV?=
 =?utf-8?B?ekhYNU1YMXFaVUhoYmg5QmxNSmlyd3dheElwMEMxQ3h2UVFxMXp6a0FBZzJU?=
 =?utf-8?B?U2hsUjBEUWxPV0ZxQnpKZllxTXB1QW11Qm44cHgrMTNIRUtNRlY1aW43ajQ3?=
 =?utf-8?B?Zm9LK0pTd0VCNDZxVXMwaTdtR1lXNFdtejdiUlJERmV6QXZXOUNJZ2dmZzFi?=
 =?utf-8?B?RXBCK29PUFpjWUppR1VnNURMWUZoc1ZNWTRRcmJ0RFZRdTBua01kNy9URXQ2?=
 =?utf-8?Q?wWliZxkTM15vvbQO+m419req7?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <04562D8B0199FA43B93DF9F85DE3FF59@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 53ba7f2f-621d-449d-b5ca-08dc031b1135
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Dec 2023 18:23:16.6882
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1KrgHMdjyy8LIEs3VjAaGcfdHOs9/ooIdw0gaSdxsiSkWv//cskGpt9hxMitkh0qPM2vP70ggRYaBCRG0nIAZESWzQo/sHH+JPRX6zdARz0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB3435
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>, Kees Cook <keescook@chromium.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDIyLzEyLzIwMjMgw6AgMDY6MzUsIEtlZXMgQ29vayBhIMOpY3JpdMKgOg0KPiBbVm91
cyBuZSByZWNldmV6IHBhcyBzb3V2ZW50IGRlIGNvdXJyaWVycyBkZSBrZWVzQGtlcm5lbC5vcmcu
IETDqWNvdXZyZXogcG91cnF1b2kgY2VjaSBlc3QgaW1wb3J0YW50IMOgIGh0dHBzOi8vYWthLm1z
L0xlYXJuQWJvdXRTZW5kZXJJZGVudGlmaWNhdGlvbiBdDQo+IA0KPiBPbiBEZWNlbWJlciAyMSwg
MjAyMyA0OjE2OjU2IEFNIFBTVCwgTWljaGFlbCBFbGxlcm1hbiA8bXBlQGVsbGVybWFuLmlkLmF1
PiB3cm90ZToNCj4+IENjICtLZWVzDQo+Pg0KPj4gQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3Bo
ZS5sZXJveUBjc2dyb3VwLmV1PiB3cml0ZXM6DQo+Pj4gRGVjbGFyaW5nIHJvZGF0YV9lbmFibGVk
IGFuZCBtYXJrX3JvZGF0YV9ybygpIGF0IGFsbCB0aW1lDQo+Pj4gaGVscHMgcmVtb3ZpbmcgcmVs
YXRlZCAjaWZkZWZlcnkgaW4gQyBmaWxlcy4NCj4+Pg0KPj4+IFNpZ25lZC1vZmYtYnk6IENocmlz
dG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4NCj4+PiAtLS0NCj4+PiAg
IGluY2x1ZGUvbGludXgvaW5pdC5oIHwgIDQgLS0tLQ0KPj4+ICAgaW5pdC9tYWluLmMgICAgICAg
ICAgfCAyMSArKysrKysrLS0tLS0tLS0tLS0tLS0NCj4+PiAgIDIgZmlsZXMgY2hhbmdlZCwgNyBp
bnNlcnRpb25zKCspLCAxOCBkZWxldGlvbnMoLSkNCj4+Pg0KPj4+IGRpZmYgLS1naXQgYS9pbmNs
dWRlL2xpbnV4L2luaXQuaCBiL2luY2x1ZGUvbGludXgvaW5pdC5oDQo+Pj4gaW5kZXggMDFiNTJj
OWM3NTI2Li5kMmI0N2JlMzhhMDcgMTAwNjQ0DQo+Pj4gLS0tIGEvaW5jbHVkZS9saW51eC9pbml0
LmgNCj4+PiArKysgYi9pbmNsdWRlL2xpbnV4L2luaXQuaA0KPj4+IEBAIC0xNjgsMTIgKzE2OCw4
IEBAIGV4dGVybiBpbml0Y2FsbF9lbnRyeV90IF9faW5pdGNhbGxfZW5kW107DQo+Pj4NCj4+PiAg
IGV4dGVybiBzdHJ1Y3QgZmlsZV9zeXN0ZW1fdHlwZSByb290ZnNfZnNfdHlwZTsNCj4+Pg0KPj4+
IC0jaWYgZGVmaW5lZChDT05GSUdfU1RSSUNUX0tFUk5FTF9SV1gpIHx8IGRlZmluZWQoQ09ORklH
X1NUUklDVF9NT0RVTEVfUldYKQ0KPj4+ICAgZXh0ZXJuIGJvb2wgcm9kYXRhX2VuYWJsZWQ7DQo+
Pj4gLSNlbmRpZg0KPj4+IC0jaWZkZWYgQ09ORklHX1NUUklDVF9LRVJORUxfUldYDQo+Pj4gICB2
b2lkIG1hcmtfcm9kYXRhX3JvKHZvaWQpOw0KPj4+IC0jZW5kaWYNCj4+Pg0KPj4+ICAgZXh0ZXJu
IHZvaWQgKCpsYXRlX3RpbWVfaW5pdCkodm9pZCk7DQo+Pj4NCj4+PiBkaWZmIC0tZ2l0IGEvaW5p
dC9tYWluLmMgYi9pbml0L21haW4uYw0KPj4+IGluZGV4IGUyNGIwNzgwZmRmZi4uODA3ZGYwOGM1
MDFmIDEwMDY0NA0KPj4+IC0tLSBhL2luaXQvbWFpbi5jDQo+Pj4gKysrIGIvaW5pdC9tYWluLmMN
Cj4+PiBAQCAtMTM5NiwxMCArMTM5Niw5IEBAIHN0YXRpYyBpbnQgX19pbml0IHNldF9kZWJ1Z19y
b2RhdGEoY2hhciAqc3RyKQ0KPj4+ICAgZWFybHlfcGFyYW0oInJvZGF0YSIsIHNldF9kZWJ1Z19y
b2RhdGEpOw0KPj4+ICAgI2VuZGlmDQo+Pj4NCj4+PiAtI2lmZGVmIENPTkZJR19TVFJJQ1RfS0VS
TkVMX1JXWA0KPj4+ICAgc3RhdGljIHZvaWQgbWFya19yZWFkb25seSh2b2lkKQ0KPj4+ICAgew0K
Pj4+IC0gICAgaWYgKHJvZGF0YV9lbmFibGVkKSB7DQo+Pj4gKyAgICBpZiAoSVNfRU5BQkxFRChD
T05GSUdfU1RSSUNUX0tFUk5FTF9SV1gpICYmIHJvZGF0YV9lbmFibGVkKSB7DQo+IA0KPiBJIHRo
aW5rIHRoaXMgd2lsbCBicmVhayB3aXRob3V0IHJvZGF0YV9lbmFibGVkIGFjdHVhbCBleGlzdGlu
ZyBvbiBvdGhlciBhcmNoaXRlY3R1cmVzLiAoT25seSBkZWNsYXJhdGlvbiB3YXMgbWFkZSB2aXNp
YmxlLCBub3QgdGhlIGRlZmluaXRpb24sIHdoaWNoIGlzIGFib3ZlIGhlcmUgYW5kIHN0aWxsIGJl
aGluZCBpZmRlZnM/KQ0KDQpUaGUgY29tcGlsZXIgY29uc3RhbnQtZm9sZHMgSVNfRU5BQkxFRChD
T05GSUdfU1RSSUNUX0tFUk5FTF9SV1gpLg0KV2hlbiBpdCBpcyBmYWxzZSwgdGhlIHNlY29uZCBw
YXJ0IGlzIGRyb3BwZWQuDQoNCkV4ZW1wbGU6DQoNCmJvb2wgdGVzdCh2b2lkKQ0Kew0KCWlmIChJ
U19FTkFCTEVEKENPTkZJR19TVFJJQ1RfS0VSTkVMX1JXWCkgJiYgcm9kYXRhX2VuYWJsZWQpDQoJ
CXJldHVybiB0cnVlOw0KCWVsc2UNCgkJcmV0dXJuIGZhbHNlOw0KfQ0KDQpXaXRoIENPTkZJR19T
VFJJQ1RfS0VSTkVMX1JXWCBzZXQsIGl0IGRpcmVjdGx5IHJldHVybnMgdGhlIGNvbnRlbnQgb2Yg
DQpyb2RhdGFfZW5hYmxlZDoNCg0KMDAwMDAxNjAgPHRlc3Q+Og0KICAxNjA6CTNkIDIwIDAwIDAw
IAlsaXMgICAgIHI5LDANCgkJCTE2MjogUl9QUENfQUREUjE2X0hBCXJvZGF0YV9lbmFibGVkDQog
IDE2NDoJODggNjkgMDAgMDAgCWxieiAgICAgcjMsMChyOSkNCgkJCTE2NjogUl9QUENfQUREUjE2
X0xPCXJvZGF0YV9lbmFibGVkDQogIDE2ODoJNGUgODAgMDAgMjAgCWJscg0KDQpXaXRoIENPTkZJ
R19TVFJJQ1RfS0VSTkVMX1JXWCB1bnNldCwgaXQgcmV0dXJucyAwIGFuZCBkb2Vzbid0IHJlZmVy
ZW5jZSANCnJvZGF0YV9lbmFibGVkIGF0IGFsbDoNCg0KMDAwMDAwYmMgPHRlc3Q+Og0KICAgYmM6
CTM4IDYwIDAwIDAwIAlsaSAgICAgIHIzLDANCiAgIGMwOgk0ZSA4MCAwMCAyMCAJYmxyDQoNCk1h
bnkgcGxhY2VzIGluIHRoZSBrZXJuZWwgdXNlIHRoaXMgYXBwcm9hY2ggdG8gbWluaW1pc2UgYW1v
dW50IG9mICNpZmRlZnMuDQoNCkNocmlzdG9waGUNCg==
