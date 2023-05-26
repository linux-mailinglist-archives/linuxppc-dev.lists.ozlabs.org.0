Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BE6711F3F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 May 2023 07:36:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QSDFP4KYRz3fBh
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 May 2023 15:36:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=fJRquqgM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::630; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=fJRquqgM;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20630.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::630])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QSDDV3ZxGz3c1K
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 May 2023 15:36:09 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U/xEhl71A0iXFqlRvL3R4YCzxPuwXcYNPziCTclNzf5CJ6vHRoQhLIOgv+WbRx/5uwvkEKLqwrSOzcUG49FuVlG6KADIi/8b/T0/C0Ju9K6IO0ihnMp/yh52Nw5IIqwQxZr9f1E7dP9ZskUagVVoLqSmAW8Qudq185tBilUz1OAlmjAhVKnmwq7HxKOBDwC7K/TPpH8Bc6lfqtnbcolEetG/Ppcjsrn+TRDuG2AO+/y74lM+uzuTyAXcUhNuQJNpUSxQzvLE52rAvVsMPBhBK+HMxuwQNKtt8RPnKZahD858qWSQeDTV7H51S0/7MORbOrApPwvSLu3Jz93thTTUiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vMJFzFJgzVeFzzzfoiFJ/Gvlqul1bssKlUo2XwjGhxs=;
 b=ZJ++GCNGnTgCKuWWxQEiCtvxtkdVtcrgS6SofHp5/Fuu9SfUVSwRPFphjL8Akywwn1nOmhZKUPBMq0ng7XLvtKUTRLRmL1XbDTcLXWU1FjrXCZW+ogJfipmp/TTAXJMw/lPJ3nMCM3mV943QPiVIjF6FC+gBMUN9bdCYNZjz2Z6CC/3GtC7ynK8YK/zbe8IhTbywacFww8jH/ZfTs1vskamOdPec9lMLBAaDCZljvbij3OnQ4WcaJTdbQrOqgEuwWj/C72LH4FA2+yOTmv11EHqUm2G3jfgMwjkey7q29FLXy5ULq6lSsyS3zyKBwa3l8TZaeJwJgspyZ9TXISpgOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vMJFzFJgzVeFzzzfoiFJ/Gvlqul1bssKlUo2XwjGhxs=;
 b=fJRquqgMPUzc059RiBj/AzMvWdj3LT/N6vXRxSrWL2kD7eHbbuHgn/y0Y2VmavAnsZTtP5VGnlx/qmLcvcG4uspMqVjfq9ehms9IohinvfXtMt0fHxoBKQMw6rlUviRsQ3MRZHFEWj3Ls/eH5ZqUMZAu9IdTDwXBfR8KkqpD8jMMtKRewtEyNzNtL3YXg60LgS5l87Ru4+7y5vzcIc+AfoyKU8c2DvOU+ZZU7B2CCq5zOTZRYpbTPN5X6a8Hng02sRvl48SoQJD8EIB7Zv5/PdoR3Vb3L9KIxM32bzn97oHpVcNFlqi3sVJuhQ/C20GvxxqX6NjonKd3niDhBFiNfg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB1525.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.18; Fri, 26 May
 2023 05:35:47 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::447b:6135:3337:d243]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::447b:6135:3337:d243%3]) with mapi id 15.20.6433.018; Fri, 26 May 2023
 05:35:47 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Naveen N Rao <naveen@kernel.org>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [RFC PATCH] powerpc/ftrace: Refactoring and support for
 -fpatchable-function-entry
Thread-Topic: [RFC PATCH] powerpc/ftrace: Refactoring and support for
 -fpatchable-function-entry
Thread-Index:  AQHZiojBbqr4duIEo0Gy73hFswcDS69i+CKAgABjJwCAAB5JAIAA+q6AgAMpboCABHUXAA==
Date: Fri, 26 May 2023 05:35:46 +0000
Message-ID: <11217d67-a9bc-10a9-161c-c73666af0c9b@csgroup.eu>
References: <20230519192600.2593506-1-naveen@kernel.org>
 <3527b8d2-275e-29d8-fd3b-4002a4a901fd@csgroup.eu>
 <85460820-e5e0-57e3-68a7-dd7a562c9eb0@csgroup.eu>
 <1684605928.yl2udzpst9.naveen@kernel.org>
 <5463949f-289b-1eae-17c7-f77f63389f98@csgroup.eu>
 <1684833778.7ege0impv3.naveen@kernel.org>
In-Reply-To: <1684833778.7ege0impv3.naveen@kernel.org>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB1525:EE_
x-ms-office365-filtering-correlation-id: 3d768c83-0e77-432d-90c1-08db5dab0eb6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  C4WKklsMhK/2VPpfOPXDHCev+g2SMx0pa/U8+lv4tV6M3Ni1vyA3Ciq9LrM3IxM6zRBkcEEDgkvddGj6lLhIl9TUfN1sgje+t8N2qfQtZa0200wsmfpVgqhgoZiL7o5gxxR/EIJ2dDhH4gQ02ByZ0RV/yQY2ElIUTqZ78h3PRZn8cw7rk03ci2OTJmSFmwiW8/958XhJbBI7uAJJ+o+NTZKdYbYF3dM+TtUZKTilfbb+pvxhNZHhs0Ycup5IvnG+z/a/3MMrPjvJlHB1A3Yjqqznosa1HdO3HGFyBjnlGTzY/n8BbQbv0tunFDnrt72NPzquzzgx//UIY2ZAhIGBqYKNfHD4mvh2wQpZFnDr/WYWttQy/3qA21rMCwuW6aqOmHtu2OhDq0wGMSUDDpSSHDBT7jXftjXd16m9x8TxfDBd93A4HZ01Kee7bFghFYlVOBYt1cpz5xqrGUa1jwtAuw8mBRYidqcTtcOiuHtay640UnzcmMsz5ZvsqpyXyaYDjAZeZgvADC+XvD4xBuDcw4lwJQIJScZMq3uKzSd4kWEqOV6bno4VdE9t4+W0/TWE3mnmImJf957sUXJwReDiSyucdccT8onq+snR9PILh2EresU15JUj6u3+2E9vx/erfSRtCY3ygZxhNpPfJ9cnsfoHtjiTAkwwtiDKoPc2GCyUpbej8OgGs+idS8uSfvIk
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(376002)(396003)(346002)(136003)(451199021)(31686004)(71200400001)(44832011)(478600001)(31696002)(86362001)(2906002)(5660300002)(6486002)(54906003)(110136005)(36756003)(8676002)(66574015)(8936002)(38070700005)(26005)(6512007)(6506007)(83380400001)(41300700001)(38100700002)(91956017)(186003)(2616005)(122000001)(4326008)(66556008)(66446008)(76116006)(66476007)(64756008)(316002)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?ci9YcVJ3Sk8yZTZGNjdtNm9lNEtySHdPNFJzckFBVDI4ZVYzbExOa00xbzdV?=
 =?utf-8?B?QXR4dXNvNkZvOG5HdGRyYnFxNHJSejRab1hpRGVveHlTNUs5eFBqRmVaR0pY?=
 =?utf-8?B?ZlZ3TVVuMFNqRTA0VHVhV2FkQXVHTjlZTlc4dDlWd1VFSVRpNTU1WG9KZEF5?=
 =?utf-8?B?UWxKOG5SWm9HZm9iSCtDZ0VPK21KdFBlL2FOWlErWG9ZeVE4L3hQaC91eld6?=
 =?utf-8?B?bXMxSlhFeHBkT0NiclY4ZWxDZEZrREpIRmtkWEY4dVN3S3NqTlB4dG4zWXpt?=
 =?utf-8?B?Mi9qK091MGtCUkRFandRSG9kajdGbzRmWVFpRUNZaXRlamdTRlVzOGRhZ2ZB?=
 =?utf-8?B?Y2srbmRIQVd1aElNV0djRmZoTjA4cWNpQXBZRHdKK3plYndnektDVllqTEg5?=
 =?utf-8?B?NkpCb212ZW9sU1VKNmluM3hWQ2J3S2hjQmlzRHNuVnM3MlhPZFE2RFNLbU1a?=
 =?utf-8?B?TnlXQXJkZVRQVzM5ZCtUNjdUNlJxL05UdHBxR3lKcERTdmlDMm5LWDdkKzVC?=
 =?utf-8?B?alEyWGt4d01DQ1dyME9oa2UzQmtCMXQ5MlpmNzRBU25WeHdoZG4rNmlwaDk5?=
 =?utf-8?B?T1ljbjJRVXlKSzRSWW9KNXRBK05IVURvSGsyYVNlTkFiaG0yQXFmVjJlZWZh?=
 =?utf-8?B?ZGU3djFub2pVVWx3Z1ZpYjVueEJDRFpab2NvZTZQa1AvMFB3RlNWeUdZZHJJ?=
 =?utf-8?B?UmN3VVE1Nzd2RUF4akU2bGswRStSd3hPUklxK2o4Wnc0MWxUUlZxTGthUXJV?=
 =?utf-8?B?eW1MaERxZ0dFalFTUWVPWDJic3VjRUlUSVJyMHZRU1RVVk5tUzlDK1R0UjR0?=
 =?utf-8?B?TXhtM2xDU0V6ZDZhK3o3R25ZOGNLQmNFUEVpbVNVQTRmOXlQbmhLZFltM0Ra?=
 =?utf-8?B?cWRtdGFJa3JLRGJJeUZZbE1aMWFTUkdZNm9xcHRSVXBmOXRjWXB6RDBVdE5H?=
 =?utf-8?B?cXR0U1ErSTdjTnV4S2VTVk1TbXo4RDIwUTMrWktGUU43eUlYY283b0tkWVU4?=
 =?utf-8?B?c2dRekdIMG1ZYnViRWc4bERpdjIwUmxpLzU2WDh0V21xSkZaSTNPQStjREky?=
 =?utf-8?B?MTdjWXhpUGR6SjQxWGRsTmpGQWNySEdtL2tSK21NVzNwUld1MzBlTjJKQTJu?=
 =?utf-8?B?Ti9BSXgzaGF1RHRoQjYyMWFSVjZCNThzaHBGVndic3dkQ3hMd3R5R29LSTAr?=
 =?utf-8?B?QzdEWlU4VjV4NHRTbXRKUVpTTWNwQk1GYTgyWnhidUF1OVpRblZOWExDVnBu?=
 =?utf-8?B?TktoZXNSa3V5YmhKWWZ6VjVvQVVOL3BCRjNHVGZMS1U2NFFBSDN2bnJ1RGs4?=
 =?utf-8?B?S29XdVphSlRxeTg2THJVdGNnZWJnelRzRTVhUGQ3WmowSG05aC9Ecm5weUxi?=
 =?utf-8?B?OU5LeWhaUXVFQi9mb1lrWVJZb0FTUEkydXYwZTRvS2kzbUUveEpVR1pCbWFo?=
 =?utf-8?B?NG84NFpuRERzT0gyZ2FuM1YvV2dOaE5pMTdMMzZxeFJmeG0rYmZ2RGFZVHMx?=
 =?utf-8?B?dS9wTHM2T3FNK1VHR3Rnd1FpSFpEZFlDaGFjb1oydmE0KzJoY01WbDhMaFJo?=
 =?utf-8?B?K3E5OWVYUFpENkhLUno4TWZpMjhjUzRUSXlDTGZFRm1KWmdURk5PZmk3NUph?=
 =?utf-8?B?L3YwVmRxZUtoMERXQ0pJRnJXUVFYZUF1a1hzcEE1cnBxMUtGYXphNmhyb2Vv?=
 =?utf-8?B?ZnlvSzdMRGxkWWtrS3d5VEt1eFZyRjVubUhOTEk4ZW5QNWxrbm5SUy94bUVD?=
 =?utf-8?B?NzZsaXByejBKUnErYlF4QVZyTUhLSXdad2dtMDRkOGVHRUZNSU5zRE5aVTho?=
 =?utf-8?B?T21UOTFWNkYyVHRyWnBHbGJqRXdocFhyR0JRR2crYXRHWE5wbENLOTZ4Nmxq?=
 =?utf-8?B?Y0FmVHE5eFdXRCtNQ1MyVi85S2lwZEZYSFVCVFJPeEtTOGVvbXpzcXZMa1JQ?=
 =?utf-8?B?aXNTWnowVkxrOHNwNTBwdG9QU0VpS1htYlZ1Y3dxOEJSQXIzT1hWdlRJeXI0?=
 =?utf-8?B?WkIwcGFiUHVKaHl2dmNKYnRGeTNzUG1OSHJIWjlZSTI4dm1vZ0xmbGZraUNk?=
 =?utf-8?B?YzgrOHovM2MrSVVKRXNXdU5yK2I5dkpDMG41QXQ5OEtvNUdxd2E1ZWhUUG56?=
 =?utf-8?Q?xXgohP/oDBskVskn6ntj1PBQU?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2C00D7CB8FAA224C8A454B7D743208B2@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d768c83-0e77-432d-90c1-08db5dab0eb6
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2023 05:35:47.0177
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jTM14J2gl6aZ+J7rLqyZ733ZIird0at/GoEXI9P54i0ALlpck7M/NiV9uILNFZjB47wUADx/w7snrGcr81zKiTXFcP5Fjs7SDlAw7qRJwnM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB1525
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDIzLzA1LzIwMjMgw6AgMTE6MzEsIE5hdmVlbiBOIFJhbyBhIMOpY3JpdMKgOg0KPiBD
aHJpc3RvcGhlIExlcm95IHdyb3RlOg0KPj4NCj4+IFRoYXQncyBiZXR0ZXIsIGJ1dCBzdGlsbCBt
b3JlIHRpbWUgdGhhbiBvcmlnaW5hbCBpbXBsZW1lbnRhdGlvbjoNCj4+DQo+PiArMjAlIHRvIGFj
dGl2YXRlIGZ1bmN0aW9uIHRyYWNlciAod2FzICs0MCUgd2l0aCB5b3VyIFJGQykNCj4+ICsyMSUg
dG8gYWN0aXZhdGUgbm9wIHRyYWNlciAod2FzICsyNCUgd2l0aCB5b3VyIFJGQykNCj4+DQo+PiBw
ZXJmIHJlY29yZCAod2l0aG91dCBzdHJpY3Qga2VybmVsIHJ3eCkgOg0KPj4NCj4+IMKgwqDCoMKg
IDE3Ljc1JcKgIGVjaG/CoMKgwqDCoCBba2VybmVsLmthbGxzeW1zXcKgwqAgW2tdIGZ0cmFjZV9j
aGVja19yZWNvcmQNCj4+IMKgwqDCoMKgwqAgOS43NiXCoCBlY2hvwqDCoMKgwqAgW2tlcm5lbC5r
YWxsc3ltc13CoMKgIFtrXSBmdHJhY2VfcmVwbGFjZV9jb2RlDQo+PiDCoMKgwqDCoMKgIDYuNTMl
wqAgZWNob8KgwqDCoMKgIFtrZXJuZWwua2FsbHN5bXNdwqDCoCBba10gcGF0Y2hfaW5zdHJ1Y3Rp
b24NCj4+IMKgwqDCoMKgwqAgNS4yMSXCoCBlY2hvwqDCoMKgwqAgW2tlcm5lbC5rYWxsc3ltc13C
oMKgIFtrXSBfX2Z0cmFjZV9oYXNoX3JlY191cGRhdGUNCj4+IMKgwqDCoMKgwqAgNC4yNiXCoCBl
Y2hvwqDCoMKgwqAgW2tlcm5lbC5rYWxsc3ltc13CoMKgIFtrXSBmdHJhY2VfZ2V0X2FkZHJfY3Vy
cg0KPj4gwqDCoMKgwqDCoCA0LjE4JcKgIGVjaG/CoMKgwqDCoCBba2VybmVsLmthbGxzeW1zXcKg
wqAgW2tdIGZ0cmFjZV9nZXRfY2FsbF9pbnN0LmlzcmEuMA0KPj4gwqDCoMKgwqDCoCAzLjQ1JcKg
IGVjaG/CoMKgwqDCoCBba2VybmVsLmthbGxzeW1zXcKgwqAgW2tdIGZ0cmFjZV9nZXRfYWRkcl9u
ZXcNCj4+IMKgwqDCoMKgwqAgMy4wOCXCoCBlY2hvwqDCoMKgwqAgW2tlcm5lbC5rYWxsc3ltc13C
oMKgIFtrXSBmdW5jdGlvbl90cmFjZV9jYWxsDQo+PiDCoMKgwqDCoMKgIDIuMjAlwqAgZWNob8Kg
wqDCoMKgIFtrZXJuZWwua2FsbHN5bXNdwqDCoCBba10gDQo+PiBfX3JiX3Jlc2VydmVfbmV4dC5j
b25zdHByb3AuMA0KPj4gwqDCoMKgwqDCoCAyLjA1JcKgIGVjaG/CoMKgwqDCoCBba2VybmVsLmth
bGxzeW1zXcKgwqAgW2tdIGNvcHlfcGFnZQ0KPj4gwqDCoMKgwqDCoCAxLjkxJcKgIGVjaG/CoMKg
wqDCoCBba2VybmVsLmthbGxzeW1zXcKgwqAgW2tdIA0KPj4gZnRyYWNlX2NyZWF0ZV9icmFuY2hf
aW5zdC5jb25zdHByb3AuMA0KPj4gwqDCoMKgwqDCoCAxLjgzJcKgIGVjaG/CoMKgwqDCoCBba2Vy
bmVsLmthbGxzeW1zXcKgwqAgW2tdIGZ0cmFjZV9yZWNfaXRlcl9uZXh0DQo+PiDCoMKgwqDCoMKg
IDEuODMlwqAgZWNob8KgwqDCoMKgIFtrZXJuZWwua2FsbHN5bXNdwqDCoCBba10gcmJfY29tbWl0
DQo+PiDCoMKgwqDCoMKgIDEuNjklwqAgZWNob8KgwqDCoMKgIFtrZXJuZWwua2FsbHN5bXNdwqDC
oCBba10gcmluZ19idWZmZXJfbG9ja19yZXNlcnZlDQo+PiDCoMKgwqDCoMKgIDEuNTQlwqAgZWNo
b8KgwqDCoMKgIFtrZXJuZWwua2FsbHN5bXNdwqDCoCBba10gdHJhY2VfZnVuY3Rpb24NCj4+IMKg
wqDCoMKgwqAgMS4zOSXCoCBlY2hvwqDCoMKgwqAgW2tlcm5lbC5rYWxsc3ltc13CoMKgIFtrXSAN
Cj4+IF9fY2FsbF9yY3VfY29tbW9uLmNvbnN0cHJvcC4wDQo+PiDCoMKgwqDCoMKgIDEuMjUlwqAg
ZWNob8KgwqDCoMKgIGxkLTIuMjMuc2/CoMKgwqDCoMKgwqDCoMKgwqAgWy5dIGRvX2xvb2t1cF94
DQo+PiDCoMKgwqDCoMKgIDEuMTclwqAgZWNob8KgwqDCoMKgIFtrZXJuZWwua2FsbHN5bXNdwqDC
oCBba10gZnRyYWNlX3JlY19pdGVyX3JlY29yZA0KPj4gwqDCoMKgwqDCoCAxLjAzJcKgIGVjaG/C
oMKgwqDCoCBba2VybmVsLmthbGxzeW1zXcKgwqAgW2tdIHVubWFwX3BhZ2VfcmFuZ2UNCj4+IMKg
wqDCoMKgwqAgMC45NSXCoCBlY2hvwqDCoMKgwqAgW2tlcm5lbC5rYWxsc3ltc13CoMKgIFtrXSBm
bHVzaF9kY2FjaGVfaWNhY2hlX3BhZ2UNCj4+IMKgwqDCoMKgwqAgMC45NSXCoCBlY2hvwqDCoMKg
wqAgW2tlcm5lbC5rYWxsc3ltc13CoMKgIFtrXSBmdHJhY2VfbG9va3VwX2lwDQo+IA0KPiBPaywg
SSBzaW1wbGlmaWVkIHRoaXMgZnVydGhlciwgYW5kIHRoaXMgaXMgYXMgY2xvc2UgdG8gdGhlIHBy
ZXZpb3VzIGZhc3QgDQo+IHBhdGggYXMgd2UgY2FuIGdldCAoYXBwbGllcyBhdG9wIHRoZSBvcmln
aW5hbCBSRkMpLiBUaGUgb25seSBkaWZmZXJlbmNlIA0KPiBsZWZ0IGlzIHRoZSBmdHJhY2VfcmVj
IGl0ZXJhdG9yLg0KDQpUaGF0J3Mgbm90IGJldHRlciwgdGhhdCdzIGV2ZW4gc2xpZ2h0bHkgd29y
c2UgKGxlc3MgdGhhbiAxJSkuDQoNCkkgd2lsbCB0cnkgdG8gaW52ZXN0aWdhdGUgd2h5Lg0KDQpD
aHJpc3RvcGhlDQo=
