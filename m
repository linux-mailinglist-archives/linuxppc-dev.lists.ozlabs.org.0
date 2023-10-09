Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 791247BE5D0
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Oct 2023 18:03:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=WXEv/OAW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S43jy25FHz3cPC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Oct 2023 03:03:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=WXEv/OAW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::62a; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on2062a.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::62a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S43j04WyFz3c9G
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Oct 2023 03:02:58 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DOukyr50VCA9AwYYaTPkQfz7r17DTMRNFG4awzZy9AITZGwxpSvy1hw/dxeC0YanW8T+qexQ0/6Yu1+tSfl4UhZ+yIMSGHs55h/V+TOdaUUETeTEK2NZroyQQo9Vkmsn7irMKSqdyf5eL5Jcfq7FTIgH9PP4SkzKGsLiTXs4mc+31TMKG8WicVvu+f9SEx50bmyO40Yow9FSE8FsyEUq1pT83m9yEdbOuQ/nSqcTLQ3MEPWla0ZX2s7ZJDrRSbxdkd6BY+ByrkBspzqdw/PhpbM5Mq/+3yZ8KwIxIlaGejm6bvZAaHxcSLU5XcoDwzxw9apwAQjYdE+7BaoxaMDTfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MSw+5++vg7DOmIpm/TXyab/gU+iBC5/I+C+qFT3tdPk=;
 b=BmU54eWzOUJwhhflfL94y2du7SMxBQCVwaoDLfhd7F7J0Ce/LAjfssgZ62UoQKC+GQHJA/KPMp37uq07QfAMOwyxlwX8xUbrbk/i5guV5qu2HItRG+VT9lCfPCIpu/GCiGjo4PeIqCb6u49PBMLYQbPfa7RcnaOkoSw4LE3FlBB5dbPZmex4MRudyJHDKjANTNuyOBT2G5dHTKyiGnKnDWKIg8EGN/sTfbskf9WTXQkQ3ydGXpfXb9kKjA1/uABXqEi4U4tECIj2cawAJuYRh0/969KRPIMw93O7Ldz3rBDUGyWLB6oa33VTnyeWM9wvlefuA3TdT5ZTxwZJ2QZ6Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MSw+5++vg7DOmIpm/TXyab/gU+iBC5/I+C+qFT3tdPk=;
 b=WXEv/OAW823ITVbIgbouIC9zwlpdjkx5BAzPs4UaAtImQMGArHnPykjJHhsPVGSD7PZMPnVv4BPqGzmjxt8hI7NsuwtnwkoqOPgSsLdcu1VIGiNATEVYAMHLSrcJjsnQ8Z2w0r9deeTBIazJjMqFbmqqEgFWrWkho8Pq2LDKEVecHMS6OxlVGFG9Ml7pGb6KhJ7YhXfxdRCuFtqRjdY73ZSiGxbUedNuQAjmR2hSeHMqBL/X01GVCSHSRhJTXQqovsPlsQjx972AeitW9AF0NMc/vD8xqyJ50E41/QdyCdHK5RUIzEdTSMaqb1NCTS8ObfBDJ++irRHxBd6qKikpVw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB1787.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:16f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.36; Mon, 9 Oct
 2023 16:02:39 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::165b:8c64:6165:9049]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::165b:8c64:6165:9049%3]) with mapi id 15.20.6863.032; Mon, 9 Oct 2023
 16:02:38 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Eddie James <eajames@linux.ibm.com>, Michael Ellerman
	<mpe@ellerman.id.au>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: KUEP broken on FSP2?
Thread-Topic: KUEP broken on FSP2?
Thread-Index: AQHZ978R6EU4rs4G8UK8Ora/CnKi+7BBdXmAgAAg/4CAAA4VgA==
Date: Mon, 9 Oct 2023 16:02:38 +0000
Message-ID: <75905aa0-5c25-bff0-8ef9-4792b57f5f1a@csgroup.eu>
References: <fdaadc46-7476-9237-e104-1d2168526e72@linux.ibm.com>
 <87a5ssrl9c.fsf@mail.lhotse>
 <4fd21fd5-6da9-271f-4827-c6ce48af16e1@linux.ibm.com>
In-Reply-To: <4fd21fd5-6da9-271f-4827-c6ce48af16e1@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB1787:EE_
x-ms-office365-filtering-correlation-id: 4a7d5b16-b1ff-4a4c-8be5-08dbc8e1294b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  +/UbcDYq8ToLMfVb8iwweoIrgGoSbGfgJydL/oauXJRfXbojRbjWK5v5rL8bbcodayGT0UXkyiLWtFWsmmgEiEaw/PX5TFoWtikfrvXu0Illt9+kpXCo16SP8+fJNvyRr9CXy/xNp+EblGfkX+NJ4Z5DBGSxR1rDEJSfDkB9pn/Q4m6YJfZmkaaw3dvc65RSDbDQS2qp0JjQ63yXBqvoF5flnJVMpzHXjaMpSrxtQav85pU6dsGn4VzIv4mF+iwZxzGVLvyAl+uhWeXhSvO6O666Kz9Zsn27MKthhu3oNBLRqrdvni90NBLxes0SG5ksDhdr5UvAwDSwzncKt6RexyD0DZaDFb39Zc8KISmfklROyrgFYp/XijG5cbQiU2xVVMAe9OTDOJP05HkQf8S3Itpeag28RFc5V8lD7jJup9dnuwCPcmdzSpvZ+xxoe52UomukGUq6768T77Sjd6wwSVewlZ1gzAsQpMhV3RDIoWsm46Dx9E8YMcaCW456FuqxO716zXY3QrDpmpWeLBlA34dmMNOHVpOgpMzdjNU55L1RsLjOG06STMb+kbJF7gapV8i0gEkFDvAgrxd6DEDGeKLinCzUsClSTI/bURVKgQAMPv+wyN3reIGzbXZatOWDFaD6stUrb7qlleN6W5QdWXEVkIb5RKxcK2383ItYY3NEWFKouTIVs0UUHFxA3X2s
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(396003)(39860400002)(376002)(136003)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(71200400001)(53546011)(26005)(2616005)(478600001)(6512007)(8676002)(44832011)(83380400001)(4326008)(2906002)(6506007)(54906003)(66556008)(66446008)(91956017)(66476007)(110136005)(64756008)(66946007)(6486002)(41300700001)(76116006)(5660300002)(316002)(8936002)(38100700002)(122000001)(36756003)(86362001)(31696002)(38070700005)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?WlhuVTBzSXVTZTdCdFdtM3J1enNTNUJaRTc4UWpMRDFobXRDakxVMThsRDBG?=
 =?utf-8?B?cGtTVFN3UXJWRkZiV1JjbjE2bTNQQXNWdG1QdGtsQnlCenErT0xTWU8wbnJz?=
 =?utf-8?B?dXdTb21Ld3dIYVROOEw5a3BSRlIzT1o4bWk5R2VyOElnVHZZbXlTY29TRU9x?=
 =?utf-8?B?bTJpaHJtNWJ3L1A5YnFPL21KcUdMZDh0SkZsZEVqSmQyUEQxbmFzaXJ0bFg5?=
 =?utf-8?B?UzEvQjgwaThJODZqWS9jY2xFZEJXV3pCUzhteDVuUlpNdm5ydjh1QkhpKytY?=
 =?utf-8?B?RVVPVDVpN2NxeHpBVGE2Uno5MWN3bjVuM1ZVaEk5NVZJMVdSWHZyNHNmbElO?=
 =?utf-8?B?Z012aVZwSDBnWTdsYktXN2c5SlU5VDQrN0NNQUdhU1BwWklHYzlYRXR4Z3ov?=
 =?utf-8?B?T1Q1YWNwV2RpalRXM1pLdkxhejc1aFhzdnF4S2xUV0F5Y09qY0hZQndSb0d6?=
 =?utf-8?B?WTJESlROVGc4QkczMEI4cWNVdXpWckUySjI0NHF4V28zaXhQTUFOd2E2NW1D?=
 =?utf-8?B?ZFlrc05Ucktnak1SU0E1Tk42SWNlcm5mY3Z2K25EekliZHdSSDdNaTlDRFg4?=
 =?utf-8?B?Mk80SHlUOUozRFJMZ0RTSFlOQ3hIbW81dXNnbnBNZEw3Wkk2WmhtSlVkUXpa?=
 =?utf-8?B?bWtYM1JIazdEUVl4WCt5bk9KRFNJWUR1eGE0Q09wZnh1by8yc0VMVVF4TzJS?=
 =?utf-8?B?MGxBZ3BrQXp4VTB0cUN6bi82UG0xYk0wbEY2eXltNkR1ZHlUbFd6RkV2STZT?=
 =?utf-8?B?QnlXNUlqNm0rRUJIT2FlWmFxT2JPNFlidmFyWSt0ek1TZ0NuK3JudSt3bzN0?=
 =?utf-8?B?V2RBQ2lna093bHJNY1A3eWk3ZnRCU3lLQWlNUDA1dmw4Qmh6Rk9vT204dXNS?=
 =?utf-8?B?SlBRaEZVK0E2SHp6RDVjVmJLeXhBMXowa3Axb0w1NnZkNHJoTzU3ZGFBMUc2?=
 =?utf-8?B?bGxpN3pKSnNhMjdlQTRSV0tQclNyaDVjcytkRHpMaEQ0MXI1VFZOWnVnWlVE?=
 =?utf-8?B?Tm4ydHdlSFdFNkFXZmhlOFIyKys0VzMyeklqZWtLdkREcTFnb2RMSHpWeW53?=
 =?utf-8?B?WEFvRXRDYThlZ01aenQ3T09oamw4N3Y4NDY0bCtESFFWdTN4REJjL2ZRYzFi?=
 =?utf-8?B?RFI0cDFZaWRoMzhrZzJ3SFYrNTJzWVN2OEg2eFl4cEFJeFpHT2M4YnBRQkw3?=
 =?utf-8?B?QjE2MUdpS2J3dENhSElLMWVQSTI4ZmpYTVJrS2ljMFlnTkVSUk1vZnNmOTIx?=
 =?utf-8?B?bTR2eTNBTG1jRlErcjJJeUFMb0ViVWw0S05lTGFuRHNQTkpkWmJMYXErc25C?=
 =?utf-8?B?VFdIbk8rRk5Dc2J3TDZzNEd6bU5ucXcxZkk0ZENxYzZ3TWl2ZC8rRlZwTjJ1?=
 =?utf-8?B?dGI1NWFDVFZ3dE1CeDNzTjFuVXN2Wll4UkZGelZmdDRiVFlGakNwa0RGWXI2?=
 =?utf-8?B?QUd2RTNZa3IvVFFsRSs0MUw4eDZuazdmSG9aa053VlM1NEhsQUJ5MW9URmxR?=
 =?utf-8?B?OXR5S1N0ci9TUjI4cWwwMWNkcDd3aUo3VTlKNTRYYkFuanNmMlhVWnpsNmN5?=
 =?utf-8?B?d3FqSHo4ZCtZMlZ3TTZWVFFTUmJESllldXV1WWZ1NXhoYktNVzh2K2RUYXpQ?=
 =?utf-8?B?TGlZSGNhL3R5UldQWUViV0luakYxTnFlZDM0RkhFYzFMRGpocmZKM2IvVDQw?=
 =?utf-8?B?OCt4ekg1VFFnaS9iNFZFOUdqcmZ0eGJwTnJkQ0t4OGY4dnNBOEZWL25FL2lh?=
 =?utf-8?B?emJMS3dDSnhSKzBQK3NJVHlabXZhcEhod25xMUdJWmYvRXU3QmNya3hORFpv?=
 =?utf-8?B?NW9lQW1vUUNIazNGRGNZU2dMcWdUbmVRUE5MTEk5QVJiYVFCZmJrWHNJZ095?=
 =?utf-8?B?d1p0MG9DOHNXYisrSlJ3RjJPZXRHQXFlY2gyOVNCcFJRL2VPdEl5aXFPcU1r?=
 =?utf-8?B?OEF6cmJtRTk3blR0Y3piNVlmWlhOakRqdDVLTkhlbGI2NEwwYm92ekFNdkQv?=
 =?utf-8?B?UFhCY1VtV1M0VDc2QkoxZDQwRkpIYXQ1YjJOVkVnUk05Q05oYXRZOVl3Uko5?=
 =?utf-8?B?UEZ4bTdHUnl4ZElwaG5jWmwwU1hJVzhSYUdvQ0ROVnRuTlVnZVlWSGdrOXE4?=
 =?utf-8?B?aGJYdnIzZDA2Ky9IVjJpL1d5bmtIa0dKTHQ1SUFrdlVodDB4OGNvTCtYckJv?=
 =?utf-8?B?N3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B9DAB14EF3E1D047A0A334F722F5592F@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a7d5b16-b1ff-4a4c-8be5-08dbc8e1294b
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2023 16:02:38.8799
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AVxCvhLjInS9IKuEfeoDoYF2IxwNrg/7R3koH8TBKJO8VvrsGnBGhTIH5l9M/3z67utT/ZomNYCCylRB0ytiqOCMJ0X1JWeUNB17sDBB8dE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB1787
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
Cc: "paulus@samba.org" <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA5LzEwLzIwMjMgw6AgMTc6MTIsIEVkZGllIEphbWVzIGEgw6ljcml0wqA6DQo+IA0K
PiBPbiAxMC85LzIzIDA4OjE0LCBNaWNoYWVsIEVsbGVybWFuIHdyb3RlOg0KPj4gRWRkaWUgSmFt
ZXMgPGVhamFtZXNAbGludXguaWJtLmNvbT4gd3JpdGVzOg0KPj4+IEhpLA0KPj4+DQo+Pj4gSSdt
IGF0dGVtcHRpbmcgdG8gcnVuIGxpbnV4IDYuMSBvbiBteSBGU1AyLCBidXQgbXkga2VybmVsIGNy
YXNoZXMNCj4+PiBhdHRlbXB0aW5nIHRvIGdldCBpbnRvIHVzZXJzcGFjZS4gVGhlIGluaXQgc2Ny
aXB0IHdvcmtzLCBidXQgdGhlIGZpcnN0DQo+Pj4gYmluYXJ5IChtb3VudCkgSSBydW4gcmVzdWx0
cyBpbiBvb3BzLiBDYW4gYW55b25lIGhlbHAgbWUgdG8gZGVidWcgdGhpcw0KPj4+IGZ1cnRoZXIg
b3Igc3VnZ2VzdCBhbnl0aGluZz8NCj4+IEhpIEVkZGllLA0KPj4NCj4+IEl0IGxvb2tzIGxpa2Ug
YnJlYWthZ2UgaW4gc3lzY2FsbF9leGl0X2ZpbmlzaC4NCj4+IENhbiB5b3UgdGVzdCB0aGlzPyBQ
YXRjaCBpcyBhZ2FpbnN0IHY2LjEuDQo+IA0KPiANCj4gVGhhdCB3b3JrZWQhIFBlcmZlY3QuIFRo
YW5rIHlvdSB2ZXJ5IG11Y2ghIFdpbGwgeW91IHNlbmQgaXQgdXBzdHJlYW0/DQoNCldlbGwgc3Bv
dHRlZCBNaWNoYWVsLiBMb29rcyBsaWtlIEkgbWVzc2VkIGl0IHVwIHdpdGggY29tbWl0IDZmNzZh
MDExNzNjYyANCigicG93ZXJwYy9zeXNjYWxsOiBpbXBsZW1lbnQgc3lzdGVtIGNhbGwgZW50cnkv
ZXhpdCBsb2dpYyBpbiBDIGZvciBQUEMzMiIpDQoNClRoYW5rcyBmb3IgZml4aW5nLg0KDQpDaHJp
c3RvcGhlDQoNCj4gDQo+IA0KPiBUaGFua3MsDQo+IA0KPiBFZGRpZQ0KPiANCj4gDQo+Pg0KPj4g
Y2hlZXJzDQo+Pg0KPj4NCj4+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMva2VybmVsL2VudHJ5
XzMyLlMgDQo+PiBiL2FyY2gvcG93ZXJwYy9rZXJuZWwvZW50cnlfMzIuUw0KPj4gaW5kZXggM2Zj
N2M5ODg2YmI3Li5kZWNkMjU5NGZiOWMgMTAwNjQ0DQo+PiAtLS0gYS9hcmNoL3Bvd2VycGMva2Vy
bmVsL2VudHJ5XzMyLlMNCj4+ICsrKyBiL2FyY2gvcG93ZXJwYy9rZXJuZWwvZW50cnlfMzIuUw0K
Pj4gQEAgLTEzNSw3ICsxMzUsOCBAQCByZXRfZnJvbV9zeXNjYWxsOg0KPj4gwqDCoMKgwqDCoCBs
aXPCoMKgwqAgcjQsaWNhY2hlXzQ0eF9uZWVkX2ZsdXNoQGhhDQo+PiDCoMKgwqDCoMKgIGx3esKg
wqDCoCByNSxpY2FjaGVfNDR4X25lZWRfZmx1c2hAbChyNCkNCj4+IMKgwqDCoMKgwqAgY21wbHdp
wqDCoMKgIGNyMCxyNSwwDQo+PiAtwqDCoMKgIGJuZS3CoMKgwqAgMmYNCj4+ICvCoMKgwqAgYm5l
LcKgwqDCoCAuTDQ0eF9pY2FjaGVfZmx1c2gNCj4+ICsuTDQ0eF9pY2FjaGVfZmx1c2hfcmV0dXJu
Og0KPj4gwqAgI2VuZGlmIC8qIENPTkZJR19QUENfNDd4ICovDQo+PiDCoMKgwqDCoMKgIGt1ZXBf
dW5sb2NrDQo+PiDCoMKgwqDCoMKgIGx3esKgwqDCoCByNCxfTElOSyhyMSkNCj4+IEBAIC0xNzAs
MTAgKzE3MSwxMSBAQCBzeXNjYWxsX2V4aXRfZmluaXNoOg0KPj4gwqDCoMKgwqDCoCBiwqDCoMKg
IDFiDQo+PiDCoCAjaWZkZWYgQ09ORklHXzQ0eA0KPj4gLTI6wqDCoMKgIGxpwqDCoMKgIHI3LDAN
Cj4+ICsuTDQ0eF9pY2FjaGVfZmx1c2g6DQo+PiArwqDCoMKgIGxpwqDCoMKgIHI3LDANCj4+IMKg
wqDCoMKgwqAgaWNjY2nCoMKgwqAgcjAscjANCj4+IMKgwqDCoMKgwqAgc3R3wqDCoMKgIHI3LGlj
YWNoZV80NHhfbmVlZF9mbHVzaEBsKHI0KQ0KPj4gLcKgwqDCoCBiwqDCoMKgIDFiDQo+PiArwqDC
oMKgIGLCoMKgwqAgLkw0NHhfaWNhY2hlX2ZsdXNoX3JldHVybg0KPj4gwqAgI2VuZGlmwqAgLyog
Q09ORklHXzQ0eCAqLw0KPj4gwqDCoMKgwqDCoCAuZ2xvYmzCoMKgwqAgcmV0X2Zyb21fZm9yaw0K
