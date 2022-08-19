Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B080D5996BB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Aug 2022 10:14:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M8Dyx6Pcmz3cdm
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Aug 2022 18:13:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=yrlL1sKm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.59; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=yrlL1sKm;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120059.outbound.protection.outlook.com [40.107.12.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M8DyD37CCz3bPP
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Aug 2022 18:12:34 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A9ssPbpaSm39VclX0EelMs4OAQuAgyfLrMjSq6pmigCLBCnxNnreOUVxvjTXT/q2rrKyANuc7UmwsJIue/ujrDdTvvHxwm+vPFMGzdG8dpoJT1z17LWp5wmk8DZDLkvdX/q7xubRCMSHcDR4137MyPzez1ql698VX41llFZxG3BcUNV0rOt0+UPD+hf/Gkvai54f6MVx93/XApACZzS268X+CadfugyZbwWV3YByyAci+4+gq/Se4vHqd8v40CkWQb+SJ+64Luc7SRl9Cxc6y/SMJg3cf+/R4Il61kj1nZ6nISgHpp1DrdF5wuQhEKD+y9kINCD7Gp/r/fx/KdBKFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3+Qn8tJCfi2a/grRuneds9XnG85BdILl5KZG38cZrzg=;
 b=OZ6cxQu/p0KuqhESt5Bgah9Sw4b8VciiFMGyqBKr18NyCma9igMnKxvAlX5iq4Dxfk+VnU3UzzMFq0+tqiKebnCIIMZxxZOnJBEuJN/l8SC8NpHCDeYTbPeyqWoottaBlNsKMkvfNBB8B6go9JFB4kEmPYBVhvsQk1KY8/Ar8Fo9xoRK5Xka0RVdvMOjPdmPsu1kSfUOAJtp3cM+jqnfRfacrXtRU5xTyan/UH3685xVhUPFhARTB/7OESUmdUUopSUVwVaWvCsNcqo9239vpWkURQh+bN1y304aCta1EAuATfIaUt27X1+bYnG/yqxZ1M6CTqBIb1kqsECEofpISg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3+Qn8tJCfi2a/grRuneds9XnG85BdILl5KZG38cZrzg=;
 b=yrlL1sKmYXA8D13fq5wOdW/jYNy9TdUv6iuwaOPA1LuL9O8Jm7GK80GURbNPbT6h6FMUEBVOamOPM7uFhqDOa7Ixby19CfgDUPpgJUISLFDgMZr2caURpaxWUfIzLYKLcQMbJCBG8ZJSn52Xb+fLZImmANQ7eonYSOOF/bt/3B1Fmh0uVOxgOKcftHbZq19SxVRAoZ5xwJC91Ml9GA8FObKpRdXxHIVBkTRgZHK/PuFb0wYYX4GQKCVxzD8uPwkT/4O2UMe5cKRDM/cD8MbR+cAg7RX5mUHGrwjmBjL3AIM8qpdTMrHZBgbnsTeM+MJsjS1QXhwbvNWKFdIRR649zA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB3761.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:28::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Fri, 19 Aug
 2022 08:12:14 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::888e:a92e:a4ee:ce9e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::888e:a92e:a4ee:ce9e%5]) with mapi id 15.20.5546.018; Fri, 19 Aug 2022
 08:12:14 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Chen Lifu <chenlifu@huawei.com>, "benh@kernel.crashing.org"
	<benh@kernel.crashing.org>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
	"npiggin@gmail.com" <npiggin@gmail.com>, "nick.child@ibm.com"
	<nick.child@ibm.com>, "zhengzucheng@huawei.com" <zhengzucheng@huawei.com>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"paulus@samba.org" <paulus@samba.org>, "rppt@kernel.org" <rppt@kernel.org>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>, "oohall@gmail.com"
	<oohall@gmail.com>
Subject: Re: [PATCH -next] powerpc/powermac: Fix symbol not declared warnings
Thread-Topic: [PATCH -next] powerpc/powermac: Fix symbol not declared warnings
Thread-Index: AQHYs5/JwJOFUmOumkmcrYRiJaB+F62134aA
Date: Fri, 19 Aug 2022 08:12:14 +0000
Message-ID: <5ab1673c-8ade-545c-fcc1-af7104853b04@csgroup.eu>
References: <20220819074311.862263-1-chenlifu@huawei.com>
In-Reply-To: <20220819074311.862263-1-chenlifu@huawei.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 53bc3eaf-ede9-41a7-e77f-08da81ba8666
x-ms-traffictypediagnostic: MR1P264MB3761:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  2pyR42wLyRUY7rw38EmaUZqzlFQ2DPMCeqUsFWiNIhWx05TJ7lZA2pMIwEsqYhbNnptvJGiRIRB3gwlE/z0Op5ER/tD+l8bBmTpQ7JmVTZlLafmiH7wnNmlbpXJgmkmorWr9jsmIAiBBVSFevvziuNhwT9Snzs3dCQdlorvB29XpRHR/Xn+GVtkbnig1/CBy+ogXhw7karOS8LyioGmlKOcrut2BkX9AOx8cdtfITIb8WDOeAAmmV5MrhhFAomeJgqB+nkB1RiWgUKg22VPu08iuZmTx8gf+xZhvs/rU4q9vRzTalRiuJm3Rjftg07Zib+M7LfiaxoO66Ev1FcCoL1z6rZRBfMeB6TPOW9EB/5ZFyrusfe5wyQsgvVVmzF3eJbjonoPftrAMRzK/MAPqSkdcA5MVZ92bCxVj26aAA4zSBdJtT6lQsR9BlE7TfQmn3Zgv45gBHgzTECpslWUlBl7WRY9SCJaonT30bZdqRTkaZ2AmXbHcaDQGSIXJHChyppRzM4wuCUpU6/VBm10mo+hs6vTG7rxE4TgNpWpiyqeCosuXTS5JdjXH3pBAY8mPpNEcTX+zfSUzmdA5WK68WYO3x4Tsgpc8E2jR2JFLuIz8JOzuJuMXxbbvLcKVEZfREb10kcoI9sgskk6PjTFqfsnvwQltZpqwRmo5jePjqaCQqnv42Skllkggxn6UPx/mD/wwKbtSoDWF90EiL2gyi14brnUVkCs1APjkLAxwor+F1XGnC3WdhNAVFRKBj9fGtBCjo38AMxROtTGVJ9BY/AhW4r4ZUF/xutPBy0kLfqj8vrpcyBYalizAAIKL1WlPYpgihjWC1efltA3qS4wu8td+l1wSH2ImdOO8jovibwE=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(366004)(346002)(136003)(39850400004)(2616005)(2906002)(86362001)(26005)(6512007)(8936002)(186003)(478600001)(66574015)(71200400001)(41300700001)(6506007)(91956017)(5660300002)(66556008)(64756008)(66446008)(8676002)(31686004)(44832011)(83380400001)(76116006)(66946007)(31696002)(7416002)(66476007)(38070700005)(36756003)(921005)(316002)(38100700002)(110136005)(122000001)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?Z2ZkcXdOU2FLZmpySVRYV1N4QS9BalE4SGhyYmEzUTZnT2VMc0kxdHdlRmNL?=
 =?utf-8?B?dEpnM0QveG4xS0JjV093MXJaYTFTMFUvVXJDOGVmNmhJdEVlTWJ5b3A0eWFX?=
 =?utf-8?B?OUU3aEkrREVpdHRKalRVTVZ4UGs1ZDdabzVkT2dIR0ZIcGFoYit4M2pycG03?=
 =?utf-8?B?QzJ1bVMwdUl6TSszN3U1NW5xVmFXTVMyekovNnd0a0pIdkwwT0tQOG53VTVN?=
 =?utf-8?B?Qmp1b3ZaTmZ3bllKQ0htQTVNMEx0STM2ZnlTN1dmNHl3U3JnR2t2TnFTRWx4?=
 =?utf-8?B?VHlYVFRWMXVpVzZFemhUbXVZaHZiYXViWnhvQy8zUklQYTZzZ2VBUGlENSs3?=
 =?utf-8?B?OGdZMnBXTzZzQzJuNGJtaW1zRnNueURDOWhZNHQzMStsWllCNzJ4V2dYZUZU?=
 =?utf-8?B?cEFRTTI1UjQ3NFlKS1ZIYTNkbXFxQzFMd0h0RVg2eWtCdGhwYzZJeFl3NFFS?=
 =?utf-8?B?V2FEdENHMTRxV1FnaFYvOTQya3JGY3A3eDNDT1BBb1p6clRaN1prN1pEc3dw?=
 =?utf-8?B?L2NkRzZNRmRCQjJ5Vnp4bWJvWmpPc2ZQcjJoRlhLT1ZWeHA3ODY2TkVBak9K?=
 =?utf-8?B?RExkTituUEI1RUphZHB2TFpZTGorMUNzaFAvOXVZV2NrMnNzMHhybktxZUpx?=
 =?utf-8?B?eHlSSy9RZG05K05CWVlJdmlqcWdnUXR5dlpkdXNwdTNYcFZPUGZ5K1B6eWxn?=
 =?utf-8?B?MXY2Vkdra28wYTNJUFIvaWkzQmNjTjhIMFhOWlJHdXhTeXpZK2wxQVJ2MmQz?=
 =?utf-8?B?UHowU0VadTdMTmFWQy8vOFJCNWpSVGtnb1NaWVNZRmtvb1daclJ2RndlR0RO?=
 =?utf-8?B?MWYvamdoeXdUU2dhWnBHVFp4WjZSYUFieXZlL1lkRzFINGlWRTVvWlVlZzIv?=
 =?utf-8?B?QUN4eVBTcG1wOUZtcDlDakRVcGVFdHdNY1JGNGowODBkSmthbWsraG1BU04w?=
 =?utf-8?B?Y01uMkcwZXNYUEYzWWJZZEZiNHg0Vzc2aTVUWTM5dGpGZGdsSHFtSDlHVnNX?=
 =?utf-8?B?dkJXb0RlbWJjV1c2UE8xcEtTVHBsbFBiY2ZRanV2MTBEYkk4M0cxbVl5YVJy?=
 =?utf-8?B?Mi9HTlYyMXEyclBBcEhENmJpUVc3Q09vMHhlQlhlRVcwcEEralF3OWlOY00x?=
 =?utf-8?B?dlFlS283MmhCWXB5NFRGdkRUb3NVM3JqeDJuK21KWVgzMURKZ1dlWmNPd2J2?=
 =?utf-8?B?c2NDczhDeEw1NDN0aHZKblBTb29mOW5RRE1WQ3ZhT2xWQk14ZDYxY1kwblRh?=
 =?utf-8?B?Y3lnUHNIaGlqYURpRnorRTNlNEVSc09PSVlkOFdneEFyOEZXdGFYYStTYlE5?=
 =?utf-8?B?TUd6cWVwYnl6Nm1RNlUzczYvcXE2N01HS1E1bk9haW5CYm91b1FTWVZRVjdZ?=
 =?utf-8?B?dll3NHY1c1ZZaFZZZVZTWEkra3lkakNNeG9OSEkvQmY5NFg5bi8yUEtOb0FH?=
 =?utf-8?B?MlZFelBXS0x2Ryt6MFJBRE81RXI0UlFXV0hDNWg1V3JpSkVaQnpBODdEM2hV?=
 =?utf-8?B?cHB1bERDQW1obW41K2gzWTVLcGJJamNrYkYvSVUwQ2tLVmZTTFNySUNqaTBR?=
 =?utf-8?B?S0ZaYjZRc3FjSmVQY2xqV1A4Q1VTZTNGbjZsc2pNUGJFYVIvK0QzOWIrZW5Z?=
 =?utf-8?B?a3V6L0VyaFpiQVA1WW5XMFl1cnNEeURoeEM5UzhHT1VhMkdjbmsrdXQxTWx1?=
 =?utf-8?B?WkdnMURHcmFqSUN4VjdUdnFvQ0l6VEJ5dDF5cndaYjlQUnMvNDNQU3M5dGJ2?=
 =?utf-8?B?QzMrZEcrOVZHK2lwTVcwZTlCL1l4bHA2ZHBSWnk3MjNXSlppY1prOXNVQVhD?=
 =?utf-8?B?NGxIcHBkMCtNS2V4ajdxbUsydkJSNFloa2FGQ1dyRDd0REFIR3Zub3dTN1E0?=
 =?utf-8?B?MkZuSTFvY1NCU0JrZVR5UGJ5Y1d2cy9XcnRXcXp4RHdGQ1pBT1JDVzlDL1p1?=
 =?utf-8?B?ZlZVZy9GbkNoTG1kVUFiUVFqNnorRUR0TktKSUtwdDI2MERzTytHZkNLeGxk?=
 =?utf-8?B?S0hTYmpSaFIvWmNyWlVZTGpRclZTYXZySkFqQnhYMU5aODBzKzZGOHhaUWlM?=
 =?utf-8?B?L0VjSVAyK3p4b0dkell3ek5ibmIxYkhNTjZqQmVjZmZCM1JqMzBCVEg4ZVRj?=
 =?utf-8?B?TjYyZE1EKzhNR0Jmb3N2WkkyVFhrVk8vVUxxRjFwSHl3c2ZvN3RhSk0xWnpT?=
 =?utf-8?Q?mVM78J6SYGctfJAWkUmxGHk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <68B72B5FC856EF48A08D31EBCF92AB44@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 53bc3eaf-ede9-41a7-e77f-08da81ba8666
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2022 08:12:14.4668
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oyFOkNWXdGdr98HrXd+KN5pLhI0dxAtdBXkcY2Ib43uUL99NOQLe/bNvCaUvfn76DDlzD0Dj7xbUNWjEo8o5wG2/sZjG1f9RweYneRdtu8U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB3761
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

DQoNCkxlIDE5LzA4LzIwMjIgw6AgMDk6NDMsIENoZW4gTGlmdSBhIMOpY3JpdMKgOg0KPiAxLiBw
cGNfb3ZlcnJpZGVfbDJjciBhbmQgcHBjX292ZXJyaWRlX2wyY3JfdmFsdWUgYXJlIG9ubHkgdXNl
ZCBpbg0KPiAgICAgbDJjcl9pbml0KCkgZnVuY3Rpb24sIHNvIG1vdmUgdGhlbSBpbnNpZGUgdGhl
IGZ1bmN0aW9uLg0KPiAyLiBoYXNfbDJjYWNoZSBpcyBub3QgdXNlZCBvdXRzaWRlIG9mIHRoZSBm
aWxlLCBzbyBtYXJrIGl0IHN0YXRpYywgYW5kDQo+ICAgICBkbyBub3QgaW5pdGlhbGlzZSBzdGF0
aWNzIHRvIDAuDQoNCllvdSBjYW4gZG8gbXVjaCBtb3JlIHNpbXBsZS4gVXNlICpsMmNyIGRpcmVj
dGx5IGFuZCByZW1vdmUgDQpwcGNfb3ZlcnJpZGVfbDJjciBhbmQgcHBjX292ZXJyaWRlX2wyY3Jf
dmFsdWUgY29tcGxldGVseS4gQW5kIG1vdmUgdGhlIA0KcHJpbnRrIGluc2lkZSB0aGUgJ2lmIChs
MmNyKScuDQoNCg0KPiANCj4gRml4ZXMgdGhlIGZvbGxvd2luZyB3YXJuaW5nOg0KPiANCj4gYXJj
aC9wb3dlcnBjL3BsYXRmb3Jtcy9wb3dlcm1hYy9zZXR1cC5jOjc0OjU6IHdhcm5pbmc6IHN5bWJv
bCAncHBjX292ZXJyaWRlX2wyY3InIHdhcyBub3QgZGVjbGFyZWQuIFNob3VsZCBpdCBiZSBzdGF0
aWM/DQo+IGFyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvcG93ZXJtYWMvc2V0dXAuYzo3NTo1OiB3YXJu
aW5nOiBzeW1ib2wgJ3BwY19vdmVycmlkZV9sMmNyX3ZhbHVlJyB3YXMgbm90IGRlY2xhcmVkLiBT
aG91bGQgaXQgYmUgc3RhdGljPw0KPiBhcmNoL3Bvd2VycGMvcGxhdGZvcm1zL3Bvd2VybWFjL3Nl
dHVwLmM6NzY6NTogd2FybmluZzogc3ltYm9sICdoYXNfbDJjYWNoZScgd2FzIG5vdCBkZWNsYXJl
ZC4gU2hvdWxkIGl0IGJlIHN0YXRpYz8NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IENoZW4gTGlmdSA8
Y2hlbmxpZnVAaHVhd2VpLmNvbT4NCj4gLS0tDQo+ICAgYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy9w
b3dlcm1hYy9zZXR1cC5jIHwgNyArKysrLS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0
aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMv
cGxhdGZvcm1zL3Bvd2VybWFjL3NldHVwLmMgYi9hcmNoL3Bvd2VycGMvcGxhdGZvcm1zL3Bvd2Vy
bWFjL3NldHVwLmMNCj4gaW5kZXggMDRkYWE3ZjBhMDNjLi5mOGI4NDdhMmY1YjUgMTAwNjQ0DQo+
IC0tLSBhL2FyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvcG93ZXJtYWMvc2V0dXAuYw0KPiArKysgYi9h
cmNoL3Bvd2VycGMvcGxhdGZvcm1zL3Bvd2VybWFjL3NldHVwLmMNCj4gQEAgLTY4LDEzICs2OCwx
MSBAQA0KPiANCj4gICAjaW5jbHVkZSAicG1hYy5oIg0KPiANCj4gICAjdW5kZWYgU0hPV19HQVRX
SUNLX0lSUVMNCj4gDQo+IC1pbnQgcHBjX292ZXJyaWRlX2wyY3IgPSAwOw0KPiAtaW50IHBwY19v
dmVycmlkZV9sMmNyX3ZhbHVlOw0KPiAtaW50IGhhc19sMmNhY2hlID0gMDsNCj4gK3N0YXRpYyBp
bnQgaGFzX2wyY2FjaGU7DQo+IA0KPiAgIGludCBwbWFjX25ld3dvcmxkOw0KPiANCj4gICBzdGF0
aWMgaW50IGN1cnJlbnRfcm9vdF9nb29kbmVzcyA9IC0xOw0KPiANCj4gQEAgLTIyNiwxMCArMjI0
LDEzIEBAIHN0YXRpYyB2b2lkIF9faW5pdCBvaGFyZV9pbml0KHZvaWQpDQo+ICAgICAgICAgIH0N
Cj4gICB9DQo+IA0KPiAgIHN0YXRpYyB2b2lkIF9faW5pdCBsMmNyX2luaXQodm9pZCkNCj4gICB7
DQo+ICsgICAgICAgaW50IHBwY19vdmVycmlkZV9sMmNyID0gMDsNCj4gKyAgICAgICBpbnQgcHBj
X292ZXJyaWRlX2wyY3JfdmFsdWU7DQo+ICsNCj4gICAgICAgICAgLyogQ2hlY2tzICJsMmNyLXZh
bHVlIiBwcm9wZXJ0eSBpbiB0aGUgcmVnaXN0cnkgKi8NCj4gICAgICAgICAgaWYgKGNwdV9oYXNf
ZmVhdHVyZShDUFVfRlRSX0wyQ1IpKSB7DQo+ICAgICAgICAgICAgICAgICAgc3RydWN0IGRldmlj
ZV9ub2RlICpucDsNCj4gDQo+ICAgICAgICAgICAgICAgICAgZm9yX2VhY2hfb2ZfY3B1X25vZGUo
bnApIHsNCj4gLS0NCj4gMi4zNy4xDQo+IA==
