Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E9546989D
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Dec 2021 15:22:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J75Hh2pFZz3bmr
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Dec 2021 01:22:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::61f;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on061f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::61f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J75H96Vzbz2xsh
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Dec 2021 01:22:28 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MYsEq2dzVCCTrUojQefLfvfPVhSeLizumS3uU3FaErOWS+RbVJ7Gh5JlMBAxWKkD/2P0tpsk3rM7eXtZVFJBF0RPDCApQiLZZEqLAKkKgdhxPCFayx7bklR9tS89e3mLykbwAQdderEx6dXuuSZE2H1BNvzC3AtTo2d/AkaPaEc1y0+WfghB9BdLvITd4Qrh0lhZRYkRDNSKjTJp1W7aypuPcZjVDJeUl8G9IxmUoJ3UjmU3YhREgc0yH6L2y4N2mKauiX6/KM7X5pWPmcb8igOXD1o7A6WX0f8poI5RoQBVaUC8PgPNFAX0sUB31evKqyISP81G1VgQOf7C3WgcaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2zsDpic/dzQRUHgZDYoenZu8kU5TH6w+eTUhcEErYHk=;
 b=DLeHTJNSQWq4PWSqFpNffiItmFOURW2YAwXLvZ+aMFY/gJofuIM2qRUjQbnoIWNR/7JYoJZuweEcOCsxT94SbJhi07+4dxA6p/VEG8nArdeuHMMV/wLhbOFx/F2Q2YpWlh0r+NpMA8M9vVB9+p5XRn7uajqMzg63fyR57/J91ZOL31sWnBx6smbjqVgs3vNgZPleOvpqMA3yybgDedPA4rxKKyfWg90NBDhu/38bN9gw8HSfl7vF2Wrp6L8UqhrP7Ed/S4tmsyZ5MUjXglqeIzSSLboG/aN95Y9viFbuKIcgEsvx1n2hEsV+qGBRlxoyWOwLkpi/DYCTKntfSZP29g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRXP264MB0181.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:1d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.20; Mon, 6 Dec
 2021 14:22:08 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f%2]) with mapi id 15.20.4755.022; Mon, 6 Dec 2021
 14:22:08 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "mbizon@freebox.fr" <mbizon@freebox.fr>
Subject: Re: Fail to boot 5.15 on mpc8347 with either debug_pagealloc or nobats
Thread-Topic: Fail to boot 5.15 on mpc8347 with either debug_pagealloc or
 nobats
Thread-Index: AQHX597pFZD8fwjYfUOPVLOQ2QefI6wguJIAgABjAYCAAQBigIAARbGAgAA7TICAAYFwgIAAGRKAgAA7RACAAJxUgIAAHSSAgAAFZ4CAABeyAIAAQEYA
Date: Mon, 6 Dec 2021 14:22:08 +0000
Message-ID: <06827bee-8f58-daae-3098-64cb08e090de@csgroup.eu>
References: <f23763d551e65d4a225ba13c7898f83853c2aeaf.camel@freebox.fr>
 <68bf4c39-53ce-f88f-383f-5defb1a36b1c@csgroup.eu>
 <913068d2c368c80f89d6f9575d6b41e6fab48ae2.camel@freebox.fr>
 <c7b4ef55-1deb-41f6-58cc-f8dc4477e90c@csgroup.eu>
 <20211204141031.GA23757@sakura>
 <5f4d36a1-695d-38a7-9ff9-d5af97f1a7e0@csgroup.eu>
 <20211205164217.GA29658@sakura>
 <d39825e0-6b48-5ac1-662e-26186e730eaa@csgroup.eu>
 <20211205214408.GC29658@sakura>
 <cea77e1e-9972-33cf-3ef8-e0be5ff26b63@csgroup.eu>
 <b39cea045b4317a83b4605f2aeb8a88bcc44b1d7.camel@freebox.fr>
 <854e7a5f-2b1b-47de-51fb-6cd0f3c6ccd3@csgroup.eu>
 <b9a4afdc13d29100d562232b6376834782c02e92.camel@freebox.fr>
In-Reply-To: <b9a4afdc13d29100d562232b6376834782c02e92.camel@freebox.fr>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7510229b-06a4-4abb-2e6b-08d9b8c3c96b
x-ms-traffictypediagnostic: MRXP264MB0181:EE_
x-microsoft-antispam-prvs: <MRXP264MB0181EE788593ACC9EDB29027ED6D9@MRXP264MB0181.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +Fnog6euTfzb/gBrHixMtEAXpmWLAMKezDrPlCz5VuJXJwOAciO09yXRcPYda4sdaZoJ+08b0QJw9zm2a/bFlM3xupyNOvaa+C3cj1Ssk1T3MOcFTTQi3gEOaM9kZvcbu/xWXHXNUJRMkmdk+JzeiyamYZpM0dBqJNlQXOUBQqILaqajNYUhENCXXS3DxFvimchPG4NC8B4J5fcaEtubiYlq+uOcsrzR5490c/gXDAsHwIiwJprC5PDsBX7g67Kyar1wVPjdVV0k6KQsSsAa1gUI2L0L1FPAN8YFTSALR8gs/pTEt+y4Au4TsgZryg3qMfBevtsaaG3UwqeSVt9cL95rfgwTT+kXfaU4sfvzKMikSaqEDupPW0XIqVXEjpj9KAYmPaTnq/MKRgFRUythNyQpkxpuEwwuWlNA3GK167APYpeQm9cI2LwwOPPiMfBUbNzloJbVUF9xqWm49/l0kE0sFZcFmDD4WAFyGiLZWRzcRS6LV2g12sJRAVJljzudP25VYdao4OpNOV95Qw2EvJ3GUDh/G/ioaYmLLe17ag4pXxG5xtFirQ314Y292c9W+3AB55tA6Ue/o0fNNA7yGod86vgVY0ZCe6RwtPANWKV3s0ypXexxk7TOtPiJCaPfmVhzp/eIefauC9pA3lb3OuOEFjIOM26iR2Y6j2e4dpR/zV2Ywxw+HGSAYHL958KWXN3/z2i1Z16aWyXwlG5W92u30DMNRozIr2YI2s/LczlamLShmjUFnvTg1eKnE80nI4Fa4gqtMRGOhKVQrjk4SQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38070700005)(31686004)(66946007)(4326008)(26005)(316002)(91956017)(31696002)(6506007)(2906002)(66574015)(71200400001)(44832011)(8676002)(76116006)(508600001)(6486002)(2616005)(186003)(8936002)(66556008)(38100700002)(86362001)(6512007)(5660300002)(66476007)(64756008)(66446008)(83380400001)(6916009)(36756003)(122000001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T0lHUXFIWUh5a2ExWDRqYmprc1lQemhva0lIdzVxbmc2N2dvcGdlWEYwb3hT?=
 =?utf-8?B?Y1g2RlNJZ3A4cFJsUU8rNTBJOSt0dGptUVNkMkw4dUt0RDFkcEtGV0xWTEdx?=
 =?utf-8?B?VERkNjVMS0I0dmx4dEdWTG1DUWducTV5T3NXWkV2eG5OOVlIZWJJVUk0a3hT?=
 =?utf-8?B?bm0xRndqait6U25uSnlSU2w5K25nQTgwaXRoSEZPaWpYNUFSdHpmV3JhQWZI?=
 =?utf-8?B?T0Y5YzFTQ2IxckEySWQ2Rno5Zks3L3paZmsrMnVJeGZucGFqcnlBRUJJYjRr?=
 =?utf-8?B?cllxcXo5UjVNbUxqY1RyQTgzZTEzRVpUQmgwNjU1UTIwc01uWE5UbTNiUFpG?=
 =?utf-8?B?Sk5XRGtieDBhNXJlWFFwU2ZENVNkZlJLeTZyZzFDSWFiYTUrYjg4bWVBR0wz?=
 =?utf-8?B?aThvay9LQUhnV3lEditFYWhJdjluYStNVmp3NXg0RG90NjBXbzN1VUVtb0xj?=
 =?utf-8?B?aFIyS1BTQWd6a1puZ1RmdDZuc3V5UUVLcTQ1cFZkQVR1WEhGbHJxTzJlK0RE?=
 =?utf-8?B?czVOYkRVRG5TSnJ3NFFNbXZ0dlVNVXlDQVBpeFlTS0lCTFJYNFIwRlU4VTVX?=
 =?utf-8?B?UVdHUnBnYlZ1ZW5pNmcvekhqYzhSWjNNeEZOdzdMQnF4S2I2SkQ5OFBnRGx0?=
 =?utf-8?B?M2dXdFl5RlN0dzhzemRLeU93QitpYWVmVk9LSWJ0bFZ1TVlSTXhPV2YyZTJ3?=
 =?utf-8?B?Y3N6VUNpNnU5bWFLeWRFczcwNzdPdmpsVkxZNkJEVy9PMHR1cmlhbDh6OTds?=
 =?utf-8?B?NmxraDhDK3BCOW52SDc3QytKbDl4UDdyMFpBbnlXSFBoTzRJWE1NWHRGVDhD?=
 =?utf-8?B?Njhhd0dESkJINDVpNXdPK1VYSWwzL0RxekM1ZlY4NHNkZDJmcHJCbHZsdkpI?=
 =?utf-8?B?QkZlckxhK0hCTHZ4dzlQUEtsT3ZZcm9YcmV2c3ErTjdqOUdSMDJ2cG1xQmda?=
 =?utf-8?B?T3Azd29pYkEzVm82TzYwTWNydFFHVGZvRnVDbnpiaHhPOHdtamV5ZWYxa3J0?=
 =?utf-8?B?V0JjM3YrazQrSUdzbG1UaUs1THA5dVRoUUV1aFovM0drdGg1YmNwbFJpcVFK?=
 =?utf-8?B?SEhkRSt0eU9HV203SkcybDBsWEJMbTEvTG1BRzFRWDhwK0NFOEV6aVJ1cTJM?=
 =?utf-8?B?dW9KUGFjYlF3S01wVlUvZ3JERUhvWXNrQmZIandOTDAvZWhGeGtDYTd6Q0ZS?=
 =?utf-8?B?WGk1cVpXUVZUbkY3UTRLTFBzL1hRTEZnRWNWTlVUN3Q2bHlscmc3NzcxbTRn?=
 =?utf-8?B?L3ZOMUpZTVJXcmhIVERGQWJycjBXRWJ1VHVPeUpkMTlyaDNnaUFTWTVWeWtY?=
 =?utf-8?B?VlNkZTFhR2VMR1lyNEYwaDJ4dEVucXpFZm5XZDdDME92VWZMYmYrcHZUTkVs?=
 =?utf-8?B?Qk9MYTdTRzdzR3hoZlhKekZPV1VGOU9RbjM5b1ErWVNwUThBT3d1aGx2NVVk?=
 =?utf-8?B?UHVwRnN1ZTRRZCs0dGRsQ0RrRU96MGNGL1h1TDNVc1NIWkR1Mk1UNHJyTlJH?=
 =?utf-8?B?QzViaWFhWEZxYnJBbTIycDdUaGdZRG93Y0VnU3JUZlJEamFGWU9tRDVaOTli?=
 =?utf-8?B?N29Tc0FoY0lqTFhYNFBPK1JJQ05uOTBtU1BMSVRWRi8vS2t4ay9OaXBTUmVi?=
 =?utf-8?B?ZDlEMk1HZ3FZdHpqc3VDY0NBUDZ6SW5BRmdQWERZUzZpK0xpaUdYekNnd1hj?=
 =?utf-8?B?OUhBM2M5QkoyT2h6bVhrQVdadWMzOUtZWWFMcC9rOTRMa3BLa1NXM0V3MGJU?=
 =?utf-8?B?VkhDcTFiS2hIbEJxVjFJaDRYTzYzVHVEQnEyc3NlelZwaGNmQUJIOU9OY0Y4?=
 =?utf-8?B?aUQyemlEMU4rUmoySk1WcUF0YzcxNnE4c3pyeHNQVzIxTlpIbWQ0QnZ1RVdW?=
 =?utf-8?B?QmU2WVZaTGFJbWRYdzZFUkw5cmc5cEtXS25FOGZESnozdUJ3bFYvb3hMVGlu?=
 =?utf-8?B?MmIxQnR1eG13WFlrVlk5QXkxU3prRGptWTAvelpoRC9OdW9tbjlOYVJoL1k0?=
 =?utf-8?B?WjlTL25lWGk2OXE4eVdySlVKMUFrSUpBMWdtRFV0Q1FCd3AwVXBCNXU4R2Jw?=
 =?utf-8?B?Rk5DdHhFZWdBQXcxaG1NQ3ZTaTVQUGVxN3NSNUFIL1JFRFExZlhzZFNHVk5W?=
 =?utf-8?B?K2Ruc3Q4b3FyWCtxbGtwMnEwVGRuWmcySkpjZlpIT0wzczRmMDlwcDlROS92?=
 =?utf-8?B?UW9UVUFsdFpwTGM3MzVGSS9Mbkx6KzN5OElTZThnRW10Q2dMS2VEWm94NVpM?=
 =?utf-8?Q?me8BtXcDdYY41nsaG6U9JrcIbF0Zdkr94h1/NVAeRg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <542C98CF0770694B9010A92079C9018B@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7510229b-06a4-4abb-2e6b-08d9b8c3c96b
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2021 14:22:08.5958 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z5nQbDswf7479U0hfMl0Zj60FNz6ETQNb9wRtLV2fzm8Ir3lRHylsB2pmG/ynrtbw7pj9eGreAPJNPc+2SAIo6UuatVxhKf9RwiuLraUJ5M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRXP264MB0181
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA2LzEyLzIwMjEgw6AgMTE6MzIsIE1heGltZSBCaXpvbiBhIMOpY3JpdMKgOg0KPiAN
Cj4gDQo+IE9uIE1vbiwgMjAyMS0xMi0wNiBhdCAwOTowNyArMDAwMCwgQ2hyaXN0b3BoZSBMZXJv
eSB3cm90ZToNCj4gDQo+IEhlbGxvLA0KPiANCj4+IExvb2tzIGxpa2UgeW91IGNhbiB3aW4gc29t
ZXRoaW5nIGlmIHlvdSB0YWtlIHRoZSBwYXRjaCBJIGp1c3Qgc2VudA0KPj4gYW5kIHJlcGxhY2Ug
dGhlIG1lbWJsb2NrX3BoeXNfYWxsb2Moa19zaXplLCBrX3NpemUpIGJ5DQo+PiBtZW1ibG9ja19w
aHlzX2FsbG9jX3JhbmdlKGtfc2l6ZSwga19zaXplLCAwLCBNRU1CTE9DS19BTExPQ19BTllXSEVS
RSkNCj4gDQo+IEkgdHJpZWQgeW91ciBwYXRjaCB3aXRob3V0IHlvdXIgcHJvcG9zZWQgbW9kaWZp
Y2F0aW9uIGFuZCBnb3Qgc29tZXRoaW5nIG5ldzoNCj4gDQo+IFsgICAgMC4wMDAwMDBdID09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PQ0KPiBbICAgIDAuMDAwMDAwXSBCVUc6IEtBU0FOOiB1bmtub3duLWNyYXNoIGluIHZwcmlu
dGsrMHgzMC8weGU4DQo+IFsgICAgMC4wMDAwMDBdIFJlYWQgb2Ygc2l6ZSA0IGF0IGFkZHIgODBh
ZDA3NDAgYnkgdGFzayBzd2FwcGVyLzANCj4gWyAgICAwLjAwMDAwMF0NCj4gWyAgICAwLjAwMDAw
MF0gQ1BVOiAwIFBJRDogMCBDb21tOiBzd2FwcGVyIE5vdCB0YWludGVkIDUuMTUuMCsgIzQxNQ0K
PiBbICAgIDAuMDAwMDAwXSBDYWxsIFRyYWNlOg0KPiBbICAgIDAuMDAwMDAwXSBbODBjZGZlNTBd
IFs4MDE3NzExY10gcHJpbnRfYWRkcmVzc19kZXNjcmlwdGlvbi5jb25zdHByb3AuMCsweDc4LzB4
MzM4ICh1bnJlbGlhYmxlKQ0KPiBbICAgIDAuMDAwMDAwXSBbODBjZGZlODBdIFs4MDE3NmU0OF0g
a2FzYW5fcmVwb3J0KzB4MWMwLzB4MWQ0DQo+IFsgICAgMC4wMDAwMDBdIFs4MGNkZmVjMF0gWzgw
MDk5YTM0XSB2cHJpbnRrKzB4MzAvMHhlOA0KPiBbICAgIDAuMDAwMDAwXSBbODBjZGZlZTBdIFs4
MDA5OTYwMF0gX3ByaW50aysweDljLzB4YmMNCj4gWyAgICAwLjAwMDAwMF0gWzgwY2RmZjYwXSBb
ODA5OTk2MjhdIGthc2FuX2luaXQrMHgxNGMvMHgxNjQNCj4gWyAgICAwLjAwMDAwMF0gWzgwY2Rm
ZjkwXSBbODA5OTU0NDBdIHNldHVwX2FyY2grMHgxOC8weDFjNA0KPiBbICAgIDAuMDAwMDAwXSBb
ODBjZGZmYzBdIFs4MDk5MTBjOF0gc3RhcnRfa2VybmVsKzB4NjAvMHgyZmMNCj4gWyAgICAwLjAw
MDAwMF0gWzgwY2RmZmYwXSBbMDAwMDMzYzBdIDB4MzNjMA0KPiBbICAgIDAuMDAwMDAwXQ0KPiBb
ICAgIDAuMDAwMDAwXSBUaGUgYnVnZ3kgYWRkcmVzcyBiZWxvbmdzIHRvIHRoZSB2YXJpYWJsZToN
Cj4gWyAgICAwLjAwMDAwMF0gIGluaXRfdGFzaysweDAvMHhjZTANCj4gWyAgICAwLjAwMDAwMF0N
Cj4gWyAgICAwLjAwMDAwMF0gTWVtb3J5IHN0YXRlIGFyb3VuZCB0aGUgYnVnZ3kgYWRkcmVzczoN
Cj4gWyAgICAwLjAwMDAwMF0gIDgwYWQwNjAwOiBkZSBhZCBiZSBlZiBkZSBhZCBiZSBlZiBkZSBh
ZCBiZSBlZiBkZSBhZCBiZSBlZg0KPiBbICAgIDAuMDAwMDAwXSAgODBhZDA2ODA6IGRlIGFkIGJl
IGVmIGRlIGFkIGJlIGVmIGRlIGFkIGJlIGVmIGRlIGFkIGJlIGVmDQo+IFsgICAgMC4wMDAwMDBd
ID44MGFkMDcwMDogZGUgYWQgYmUgZWYgZGUgYWQgYmUgZWYgZGUgYWQgYmUgZWYgZGUgYWQgYmUg
ZWYNCj4gWyAgICAwLjAwMDAwMF0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBe
DQo+IFsgICAgMC4wMDAwMDBdICA4MGFkMDc4MDogZGUgYWQgYmUgZWYgZGUgYWQgYmUgZWYgZGUg
YWQgYmUgZWYgZGUgYWQgYmUgZWYNCj4gWyAgICAwLjAwMDAwMF0gIDgwYWQwODAwOiBkZSBhZCBi
ZSBlZiBkZSBhZCBiZSBlZiBkZSBhZCBiZSBlZiBkZSBhZCBiZSBlZg0KPiBbICAgIDAuMDAwMDAw
XSA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT0NCj4gWyAgICAwLjAwMDAwMF0gRGlzYWJsaW5nIGxvY2sgZGVidWdnaW5nIGR1
ZSB0byBrZXJuZWwgdGFpbnQNCj4gWyAgICAwLjAwMDAwMF0gS0FTQU4gaW5pdCBkb25lDQo+IA0K
PiANCj4gTG9va2luZyBhdCB0aGUgYXJjaGl2ZSB3aGVuIHlvdSBpbnRyb2R1Y2VkIEtBU0FOLCB5
b3UgaGFkIHRoaXMga2luZCBvZg0KPiBidWcsIGFuZCB0aGUgY29uY2x1c2lvbiBvZiB0aGUgdGhy
ZWFkIHdhczoNCj4gDQo+PiBJbmRlZWQgdGhlIHByb2JsZW0gaXMgaW4ga2FzYW5faW5pdCgpIDog
bWVtYmxvY2tfcGh5c19hbGxvYygpDQo+PiBkb2Vzbid0IHplcm9pemUgdGhlIGFsbG9jYXRlZCBt
ZW1vcnkuIEkgY2hhbmdlZCBpdCB0bw0KPj4gbWVtYmxvY2tfYWxsb2MoKSBhbmQgbm93IGl0IHdv
cmtzLgkNCj4gDQo+IHNpbmNlIHlvdXIgcGF0Y2ggdXNlcyBtZW1ibG9ja19waHlzX2FsbG9jKCkg
YWdhaW4sIG1heWJlIHRoYXQncyB0aGUNCj4gc2FtZSBpc3N1ZQ0KPiANCg0KVGhlcmUgd2FzIHR3
byBpc3N1ZXM6DQotIFRoZSBvbmUgeW91IGRlc2NyaWJlDQotIFRoZSBmYWxsYmFjayBwYXJ0IHdh
cyBhbGxvY2F0aW5nIG9ubHkgdGhlIHJlbWFpbmluZyBtZW1vcnkgcmVxdWlyZWQgDQpidXQgd2Fz
IHN0aWxsIHVzaW5nIHRoZSB0b3RhbCBzaXplIGZvciBvZmZzZXQgY2FsY3VsYXRpb24gc28gd2Ug
d2VyZSANCm1hcHBpbmcgbWVtb3J5IG91dHNpZGUgb2YgdGhlIGFsbG9jYXRlZCBibG9jay4NCg0K
Rml4ZWQgYm90aCBpbiB2Mi4NCg0KQ2hyaXN0b3BoZQ==
