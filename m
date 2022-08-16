Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 350905952CD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Aug 2022 08:43:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M6M763qQhz3bd4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Aug 2022 16:43:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=yZtMhPgR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.40; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=yZtMhPgR;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120040.outbound.protection.outlook.com [40.107.12.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M6M6M186bz2xX6
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Aug 2022 16:43:04 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n/Dqkow/VayB7Jr/nl0nXjexe+SmZMucOQIIZxo/E3hqPqFTLsS66xIF9ZnYVKU82wKe43u8Qlh4PrRmRGRGUx9kjMC7MNrXlwjhXGRONUuF19qXqG+kbINfZrxAEN98qW89k0E7VfvAXQbUHT9MEnyrNyKaMF3cu33ycgATnBrE1w4gqkiekLn6wI28SLTh3V4zqHcqBjhmNbpYfiwrQjOdXfA4txwsp1UF/JGdZgFk4fT0a+8utpP49T4kAleSVi/erEGn5tEeuG0TJyV6dbbLtdveCzeNrVUJocUgxgdwnS1XaJDc/CDiRpLBf2B+4EEQmdJKAfaWT7kiluE5iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W0bPEXBT/HTrxNeNALzRuvWAwofy5j/gnvP/mPY0Pr8=;
 b=kwHBhijGNd0tBJtDQ4yj4JfTjpa6DC7XfjXuLYhEFAJ0tpcmTA/+QcpaAgB9H/5hFXzqAdEIEswtBDBYMueLV/QgH+wjMOuXp0quajlbhGTr3f3I0rF6r+7+ri3z8NS+oJpLRdJui6GMa9+0vaS2WYxvV5/X5vw1ZKFr8qM5NeDBZkHr1D+E/54hIHOfN/ADyKn9gsmjE5YLxJW7ewSok44cAu2LPrBCAmaBLoX7aZjLZ9GRbTbOATN8dfusU4kZJRVciY7V7xQGmUWMbBd0ktihSyDOEPEzc7HnKOllROl/H6aGfYToqCyENh6TscCSY+oo0ay2J0TNKjX6VCXufA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W0bPEXBT/HTrxNeNALzRuvWAwofy5j/gnvP/mPY0Pr8=;
 b=yZtMhPgRKJACwxF/IfaroeUab7FJwR6i8TOD+UPCATnmVltYv2aa1g9sNAu1roFYdLjX7m5NhrbJMHCaoPua8/6jN03FguI020TitdBhNxOyp5RifWF5us5/ZemBpfNkwpHkV7QGi59qUwRFswh/MTewM1+KzjgBBKX3QXeJB5mH7spZCcdqU6d2yyV3/GPAZD8ALPEchNEh/rnbI6o5331wB5zshGxihZZZvlWb97ma41ldJYCYKvSc55wv2ErBtidOlAuBpBXO8AOBDIOrxbWugYAhrTVbWrBbtymYXUe6Rpe9hnoloRFP01/e9R88eYrStmWb0p25NUrnTk54+w==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2237.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Tue, 16 Aug
 2022 06:42:44 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::888e:a92e:a4ee:ce9e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::888e:a92e:a4ee:ce9e%5]) with mapi id 15.20.5504.028; Tue, 16 Aug 2022
 06:42:44 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Xin Gao <gaoxin@cdjrlc.com>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>
Subject: Re: [PATCH] treewide: Complete variable type
Thread-Topic: [PATCH] treewide: Complete variable type
Thread-Index: AQHYsOGR7o3mPt9VXE6dHvKcDU6KgK2xFQQA
Date: Tue, 16 Aug 2022 06:42:44 +0000
Message-ID: <03487390-1dc4-9e44-1ebf-f6f9446afb96@csgroup.eu>
References: <20220815195322.3683-1-gaoxin@cdjrlc.com>
In-Reply-To: <20220815195322.3683-1-gaoxin@cdjrlc.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6bfd464a-5506-415f-1136-08da7f52862e
x-ms-traffictypediagnostic: MRZP264MB2237:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  6GrBCJy90WC9jtpxJiecs5ajgUOT2MF+WuE+mTyA3Sg1W361+IExOnO0Bp2vUzbOWqM5U8A63S2TqlZ2n0XC/nJZLTbE/+hxnN4CD8jP7GM1dm3KR6T7EkFG1VHBg7TXzTIgOrja3l8RBcwfav8LU3vkRCxATYeGIP8zgdf+C7FEL0DZ++k6TdB8QDHm/6L9pcLZ7sNXhOvEy2T/UcHAcgDpQ+akQQ07va3MEGk8PHxwGkQx7W2RhfUfJs5oS42/QsM2c8Jm0QYqB64PVFDIJmE+ppJ/GKyLZ9XB/uSfXJXz5Hn1Ln+fVOVqnA8aGL0ejkDfle9zkWCagfBVFhApZ3kGZsjtW75wsm9oXZcjE+A3bNPNBr9/LoaPoPkNBTUYUsbRBdy8X4PVNMzJgXfENN+cy6exJNBnQ3b+mH0Pc5r+LSaBMwJLEzflydirbVzJpJWestkXf5oSwynb1tDe6VcSWWU01FJ4irDls14GO+OjjbeodZRT4GNfIoXr3Zqj9LcAf9zxAnGrKSFXVapbz7t0+Qqv5OqupQB9r6jNQvrMfZAunE6HMfK+9pbUvDUidKBi8twEB5B6YedNEsNkRHMAaIciHcy5n28vVIfCWisb16PFQbO1rjiQqF2YvlosCAXW0IlztjQizfcyWaq4T84d2vMh5UmQiEz96X726rgTyhGh6f4lKPhHtBxbx04CRhyhNb0wpFOX1lO487B3rv7NB3860ni8HBS8clzKZZLPNBnrtNmyOSZKTtvZ+mLdwoeP78cwYaZHHCfSWD1hugR+DDebcnUvrpuce56DK1SLNeWfaMztvyDWiP2XWqj2V8v7wW4L5otOh4F9KHgmD/FbP9p4+zmskkyaBf1Zp4nf4AfU1uTzJeFcfWa+MuJg
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39850400004)(396003)(136003)(346002)(366004)(376002)(2906002)(4326008)(66556008)(5660300002)(76116006)(66446008)(66476007)(54906003)(316002)(64756008)(110136005)(44832011)(8936002)(66946007)(38100700002)(4744005)(122000001)(8676002)(38070700005)(31696002)(86362001)(478600001)(6506007)(36756003)(41300700001)(6486002)(71200400001)(83380400001)(26005)(6512007)(2616005)(66574015)(186003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?QWp5MC9QOEJ0TkZyV0kzQ3RSdWxDYllLVlRydnByc1drZEZwbXBBRVc2SDRi?=
 =?utf-8?B?QnBTQnBrTXlkbWNHb0syKzN3V0FIYzQvcHVjQzBZblJZVmg1OTlPRnk5V3lw?=
 =?utf-8?B?aXFOcWpGdld2R1Q2L3Z3bjNHOFZCS2V0ai83YVZTUWJnc0w4SmJNOVlpeGg4?=
 =?utf-8?B?VENoN2V0YWNDa28yUmZJY0hqUlhDbVczOHVKS1B5ZXlsUVU4YUJKblBlL21h?=
 =?utf-8?B?aXpZeGF2dEowNEM5b21wL3dabTlYUVdIYVdpMHR3WE91V28xdElWVndWQnpP?=
 =?utf-8?B?c0JXUjIyN09IZGlhOWlINCtlM213T2Z3YTQvRjdyVXR1aEEwSlRzOTV5Zmpk?=
 =?utf-8?B?TTlUcFhxTVJwZFNRRk5kL1p6RWNBdVAvVkZOa0ZHWmRxeXZIWUZKT3o2U1BC?=
 =?utf-8?B?Y1RKUUpUUUt5Z0lKeTI2Rm9mZ0JSeTZkaEU5Y2E5UjIzcGVlSGp4cUdCUnVH?=
 =?utf-8?B?WmFTY0pxamJJU2pFZDgxN0hCbklObEh1RTB5Z1JmQmoyMkZ0UTdyQmJLNzU5?=
 =?utf-8?B?MmE1UmNoNC9NeUJLK3N2TmxFN3I1UkUybFZBWUhZNjFPV25PcXVQL3UyTWhR?=
 =?utf-8?B?K0hWYTVlUXk4MXA2KzY3ZS9GejZ6S3ZCOXRhNFZ3UlJUNmoxaDB2clZyM1JD?=
 =?utf-8?B?TXBaMEEzeFQ5SXVIOXVNSEt6c3MvOFN6YUU0NTZCMmtmY3NCdkR1VmV0OXUr?=
 =?utf-8?B?QUpDWGFud0lkREJhQUhyY1ZCZEFPYVFJWmliT3pacDVVUUU3UWVQaVY5cHhP?=
 =?utf-8?B?RVJ1QmZRZ2hVcGVycWE4VUtIK2pjbXUrbHhEcU5NOWhOdUdhMGRGUTBaV01s?=
 =?utf-8?B?RnIxZTUwVUd0WEhPU0ZyZ1I2WmZMNUZiN2VTWWpTOHhVRHRFb2tvQlY4Tjg5?=
 =?utf-8?B?MVJwMnB6Qk9hYVd0UkNNcWRodHg2aHY2T2owMVdHalNLeHlHZ2xOSDdqVk1t?=
 =?utf-8?B?THFtaUY5UDNCb1d5UC9SQ0xFT1M5bUlocnhUTWpqWGJpaU0wM3E1NUZxUkV3?=
 =?utf-8?B?byt5SVdpRmgzL2JFYmFxcDZYb0hLRTZMWm5YaW1BU3lVT2JWMUEzZW9mM0Fn?=
 =?utf-8?B?UWVqV2VnNTBLbFduRFNZNDg1bi9DV1FudmhPVEd0ZDJjU25OOXAwemdhWXJz?=
 =?utf-8?B?aGxnZ1dIMmxRWVYwTnIvTy9uaG8zQ3NpcDFudkMxKzhpQ1pLMExLNUR6Ny95?=
 =?utf-8?B?bWFucFhiYUNhTzA3RWRaTG8yeHlqY2c2SjBXWWhsWGtNcGZpL3FvVFJicFVE?=
 =?utf-8?B?aHpoblNGVXRTeXJkMzgxT1czY2xML3pxd2l5MEVNdVhUWk56eVVCZndweENR?=
 =?utf-8?B?ek1rY0c3UTl3L2JEa3ozTGErOCsxaUNEQkgxSDRoMnk3RTJjUGdFNXJZWHVa?=
 =?utf-8?B?SVkxL3hLaXJFcThhUSt2NXFMaVNxa0hqVy9FR0xaNWJmZWx2RStFVUVUd1FR?=
 =?utf-8?B?Q2hzRFN5cnpidjZaSFBBc1ZiU1FSS3FpaEM2UzVxQUdMdmlaMnhDL3JuanBn?=
 =?utf-8?B?NmUwZVM2WUYrMFFpajdzaGJPOURjVzdtSFppbDI5ZjJya1hESzM5N0FRbyta?=
 =?utf-8?B?VmhPU2IzWDhBOFRoRXBQbEFXQlY1bUNiaC95NnVzOGhNSENqZlAraFVYRGZr?=
 =?utf-8?B?UWYrUWF1VHhGVVN6N2ZJQmxud1I2bGdUZ0VFUWhkN2hudUw3NGZMS2F1dTlQ?=
 =?utf-8?B?VkZZdEZieVFJY3o1VlRiQ0kvdWpSbVV6a2Z0UWJsSmdxTStDRDdHRm5EUlBv?=
 =?utf-8?B?NFJveVp5N25RVGRkcGwvUkJPajVwbytVcUhLWjIxSHVQY3hJRlViTnhWZjlN?=
 =?utf-8?B?elVhM3RoM1h2WTkzdkV0aGJ4ckVHZTFPMUU5dGdOdUVTdm5oYVdPN1FlS1Fi?=
 =?utf-8?B?QmNveHM5eW5MM2czSFJFMWVOVlY2ZUJMeUlBMlE5NUZua29KSEVtWEJ1TmdS?=
 =?utf-8?B?dVJpSk55VUpSQmJib25vZWpISHU1OTkzTnIrbERMdTJvaVhCVC9ZODk1MVZ2?=
 =?utf-8?B?S0hkSEl0TjFybFh5TFhidFFNSnpJMFAvMEplcjBrYkhzVnVuaERiVXFoRkxY?=
 =?utf-8?B?a2tlNys1VDFJRERRSlpnZllmaCttQlJqVFd1ZmVZNjdNWlk0UjBKOEhHTFlH?=
 =?utf-8?B?dXdpOWFSMnUwU1BEbkUvV3BNMThjQ2g4aENsVEY0R3JnZlpCc0wzZlZIMnlI?=
 =?utf-8?Q?Kmzll4cMpgDbth+z6TI3EBQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2089C92DA18B3541AF299C6958B9B8BE@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bfd464a-5506-415f-1136-08da7f52862e
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2022 06:42:44.1090
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3l+wRCGDUnwWM2O5gopxz+d5PaU7Wg485OTf2dvEcopik9Ia3L0Uk5hxv1L1EH2NQ11Bbk6Pa15L1HLrNAvs6XqIn6XCTmxHSh4AbCnXEA8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2237
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE1LzA4LzIwMjIgw6AgMjE6NTMsIFhpbiBHYW8gYSDDqWNyaXTCoDoNCj4gSXQgaXMg
YmV0dGVyIHRvIHVzZSAidW5zaWduZWQgaW50IiBpbnN0ZWFkIG9mICJ1bnNpZ25lZCIsIGxpbmUg
MjQuDQoNClRoZSBTdWJqZWN0IGluIHdyb25nOiBJdCBpcyBub3QgYSB0cmVld2lkZSBwYXRjaCBi
dXQgb25seSBhIHBvd2VycGMgDQpwYXRjaCBhcyBmYXIgYXMgSSB1bmRlcnN0YW5kLg0KDQpDaHJp
c3RvcGhlDQoNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFhpbiBHYW8gPGdhb3hpbkBjZGpybGMuY29t
Pg0KPiAtLS0NCj4gICBhcmNoL3Bvd2VycGMvYm9vdC9lcGFwci5jIHwgMiArLQ0KPiAgIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdp
dCBhL2FyY2gvcG93ZXJwYy9ib290L2VwYXByLmMgYi9hcmNoL3Bvd2VycGMvYm9vdC9lcGFwci5j
DQo+IGluZGV4IDdjNWIyNmFkZTZjNC4uNDEzM2JlZTI4NjczIDEwMDY0NA0KPiAtLS0gYS9hcmNo
L3Bvd2VycGMvYm9vdC9lcGFwci5jDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9ib290L2VwYXByLmMN
Cj4gQEAgLTIxLDcgKzIxLDcgQEAgQlNTX1NUQUNLKDQwOTYpOw0KPiAgICNkZWZpbmUgRVBBUFJf
U01BR0lDICAgMHg2NTUwNDE1MA0KPiAgICNkZWZpbmUgRVBBUFJfRU1BR0lDICAgMHg0NTUwNDE1
MA0KPiANCj4gLXN0YXRpYyB1bnNpZ25lZCBlcGFwcl9tYWdpYzsNCj4gK3N0YXRpYyB1bnNpZ25l
ZCBpbnQgZXBhcHJfbWFnaWM7DQo+ICAgc3RhdGljIHVuc2lnbmVkIGxvbmcgaW1hX3NpemU7DQo+
ICAgc3RhdGljIHVuc2lnbmVkIGxvbmcgZmR0X2FkZHI7DQo+IA0KPiAtLQ0KPiAyLjMwLjINCj4g
