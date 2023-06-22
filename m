Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B5F73974F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 08:22:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=nRMpZTVb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qmqz332HRz302P
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 16:22:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=nRMpZTVb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::603; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20603.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::603])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qmqy84G4Vz300q
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jun 2023 16:21:19 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TPsOlnjGd1yeyGJ9P7gyQQXO1SafPCt118/9C6wxdpfV4WepPPgb+FLjJhPH615NmA2x27oO94nDE5oPUzlq1+T1ewk3OdqvGUNiRq0wQ81dnKoytXDZBa9dieTcwQ1hPR2d7G1v366PKmNiraQmudW73WMnJqZWbnM6nbyfKqiqWAJ2uQQIuuFurBRImw1rg12anwIpWfG2KG/Sx12XQiyyGg5uHoQt9bYS1Be5Vv3Lyfgb4iGfYlYa6ucaeP7mMmUj++d50vMT3Ta4KptbSgCFvCJENWjMdga/5v5nwhhFQeK0mnJyf5rY/3N+GoUGDNPWzFJEvAl80N6B2FVGuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J9UrCOdvhFBfh5mdFP05LZ2nBaBCMzDoyRbWnkRuCc4=;
 b=m1DUDe/GpugL6Eul3AoRyG3BLstf9CFJoVDhUzPNRopebvt8azZ1tZtIdCLaMdwuSVS9XVvpJC+ZH5YcaEkiQ18VKKkbOzKVGL/EwPDtr8cig1CdgPksEERUVg1HY8CWEk3cg4PiwXEQ4jvieK6S3Uslp4FMmxBqy5vI8M3ppan7IG5tZNLYUhsJcmCuiXfU2jEfIrciVsB2dpZK8tV3AsEHRbohruKTJ1xFVwlx0VmqSWP2CPYmWJ0KwhrLiLtOsqAhSSAemqiy2ECO5H/U6lWuoTO8+2ZNtmxZUKsE33K/z1OGyoO+JGpl2SwqC4kMcVc0g/MatTPr0AO8sP7zPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J9UrCOdvhFBfh5mdFP05LZ2nBaBCMzDoyRbWnkRuCc4=;
 b=nRMpZTVbsGQo87teP79DkVBZNkE2yY/dxDSmtoqhbzEbfsnqD2fYPxLjuKl+hgzwGyi00zJu8Q3kC+43c0uediYR9QUe5t007H0akCIhUV4cJTyoxnD/elRd4LC29YUkuN6R8FMKlUlcPN0I5MjFuaWhIcgEHIvolrRIzwafb0+sCxguWcB59s2n/RvmZFtricY8/AKmD8LtglLnlN8za9NPktOZGghMNnwKP/fWBFZF5e2v5AmfB90cfZ06SdmGo+ZyzhyRKWgq6RMbp9wL+Tf6tF/3C/rawT6DLfHlJLWXceLxLneK6QQEmh3ZtS9wC4kYmxqHjCdt6321sLYxYg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAYP264MB3320.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:11c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Thu, 22 Jun
 2023 06:20:59 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::802b:33:561c:4217]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::802b:33:561c:4217%4]) with mapi id 15.20.6521.024; Thu, 22 Jun 2023
 06:20:59 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 4/4] powerpc/kuap: Make disabling KUAP at boottime
 optional
Thread-Topic: [PATCH 4/4] powerpc/kuap: Make disabling KUAP at boottime
 optional
Thread-Index: AQHZl52bswqZtCr7L0OPVxFz0qdXlq99gt+AgBjxUAA=
Date: Thu, 22 Jun 2023 06:20:59 +0000
Message-ID: <299b3054-30d0-afa1-3503-2998b9742a28@csgroup.eu>
References:  <1a3c69e38349b687c6c65240d7c09a7817a797d8.1685963081.git.christophe.leroy@csgroup.eu>
 <8d5438da7174ecb32e1c28cdb49987648df6ef15.1685963081.git.christophe.leroy@csgroup.eu>
 <CT5GKZN6D21R.3US3D2GZWGLS2@wheely>
In-Reply-To: <CT5GKZN6D21R.3US3D2GZWGLS2@wheely>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PAYP264MB3320:EE_
x-ms-office365-filtering-correlation-id: 099ec323-f78d-4c87-f6a9-08db72e8d85b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  Ri0DndCSGFj9GovC++Tz2SvDdh90efueMHPVQLQOrSAfuzk+q/YrhbjT8Cu8DMKL+GhxqgVyihQKW3SdN/7akhVf/eMiDXmqWxjNmG2c1WkDPTWDhvPwuJ7EmqEBERWk75RU74RWqoVWgCvwBQ4nP1pFsWQm8rOdNbXP660gkSFeRxA2q63CDLZgR1R9e35hl8HsH6w5AfkKUuVPTnHtvCl9pbzDyoQ4H7cILlnqYB2wsM5zzaWlIZePoW7BBZtLGE0AOXrX4poY32dNCcTduqOCE619C+TiZX7A7NZOVwUILDnJU93r5xliJ6Lt3dn9htLGBZrexwsKi4gCXqexxslicAvJU3glAGrRDXxRbGTo/geqoDBWXHBGJhimYXF61uPDBKgHNa3T9cH+onu0Df6QHmkXNecTknnZeEiwnQHbjdm7rh1PRuvQyKuXzCruoEex9E09uBtw8tJlJ4DH9dXCmGqCzWrf8hYxSj9bB1NOVC5ORmYs0peW6Q0EMhzbPMH9g3l9K/BmpD3b8XzAChcm9G+h3fRLyTwCTF86kwggvPZtbRU62PayV40j8rhpwatPpQDlPACA//VIzIzBzoHxceUqXWE3niUpetTTqPONkQ8/IV/qWxZUKf5UZESkTz1qD3WNGv1ef8TVphkzvJX9OIJwZRh8ynjtN/ierC+k58gxemiFO+9H0m5yyC41
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(346002)(136003)(39850400004)(366004)(451199021)(66446008)(6506007)(66946007)(110136005)(36756003)(66476007)(478600001)(71200400001)(76116006)(54906003)(66556008)(91956017)(26005)(6512007)(186003)(64756008)(8676002)(41300700001)(2906002)(8936002)(316002)(5660300002)(44832011)(4326008)(38070700005)(6486002)(38100700002)(83380400001)(122000001)(31696002)(66574015)(2616005)(86362001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?OU1tR245TzhQZHBXbnlrS05jSnhJLzI2Rm90aU9uRjNLMmsyTHZrOElNSlQv?=
 =?utf-8?B?NWFOa0V0Z2RrdmFCelVOYzUxcXZyOG44YU5QanN3ZWxqTzFMQ2xjYlpCTkpm?=
 =?utf-8?B?T0puUkpVdzhEQ2c2R0lvTUhjOVRmd3Ewa0c0QTRkMklhSTZ4WXRDelNXeUdM?=
 =?utf-8?B?eVBzSjlobTRCcFI3MHlpQjdXWjVIek9DcGVUSjhxWllrWWl1RnNQV2MxQXVj?=
 =?utf-8?B?a2dNbUFIUVpLMWVWa0d5T1JuK05yNGhRSFNDU0JuVklNdFdENEpGZ25hcC8y?=
 =?utf-8?B?S1orZTgrNHpDNUdpb2cxYytzelFLUkY1bkd6TmpBcWd6K210TE9teGZYcWE5?=
 =?utf-8?B?emtjSjFOZ1BhY3VIRzJuSlpwNFdzaS9HYzlmMllYVGNMWE50MFN5TlBOeG5y?=
 =?utf-8?B?SDdvZ2dQUFM0Z0pKY2U3NlYvTFFCN2x0VTJPeDNpbWV1WXF0aDNhY094R0U0?=
 =?utf-8?B?K2NqZC83UUlUOExDTWtTUVZLNldYQzlTS2JndHlOcVo2M0dybURNT1QxbmVO?=
 =?utf-8?B?NzA4RGJGaHp6SnBERnlHU3B0TWljWFN1Z1pRL3NtYmpEbEUyK3RuenBUSEZT?=
 =?utf-8?B?RmRHVEVXSHdZOVhtQm9WZEdKeHNrYzdEK0l5MEl0VGVkaEZ6YXI5VndhbFhF?=
 =?utf-8?B?eTJ6R1pMWFN2MGc0dXNDd1g4Y2NuMmNlOXJRbXgvMmsxc05ZckJhWWFoU1F4?=
 =?utf-8?B?NGhoK214M3BkbCtQVE0xZHF2UVZUUVFHNWV6dkNCZnZGZEs5aUcrTzhBV3h4?=
 =?utf-8?B?MnhOdE9KeklBbjNFM0lhOTZWc2ozNTdNVFZiNTcyVHBRVXhrU3ZLMEl6Rzlr?=
 =?utf-8?B?NXplUXU4dDg1bnBnNyszR2dhWkhiQjFySlUvZlVKQ1B5NnRzcFV1Q2RQWjFo?=
 =?utf-8?B?RUdGVWxtOHh6QmtYR0FHVFpDY2NIazVmTms3U0hrd2xtSFJOM2I4R0NxNGVN?=
 =?utf-8?B?ZVhsbmdyLzJHSXJDVnNZeExLMnZrZ1BzaHRoMEZ2aVhXZVFzVkdQaTdTWDZC?=
 =?utf-8?B?MzNRdkNRL2ZZVG94T0x4aFltSGQ1eFEwTzFzT1p3V2hJSzBmejJFV0FqUkNF?=
 =?utf-8?B?aFhuVmUzRGNBY3g3eTNTRUxuRStVV1FDbUFJQVVDSkl1QUYzOXl2QmRCaXh5?=
 =?utf-8?B?NGh3c3R1NEUzeWloSndEVURSU0F4WmNUdWdYa05MNEtsT2FWVUh1SXRqZnpG?=
 =?utf-8?B?UzlRTGgzazUwRVpvN3BIMHJQa3pMdGt0MS9SMFgrcUZ4M2QxUlJKK3NFWVoz?=
 =?utf-8?B?Ny9UeGxLU001aURqSHdIU3FYU2hTeDVUdWlueXVOVXllMnNhTW9lRnB0dnZn?=
 =?utf-8?B?RVhCbkcxWERsTjM0dFZJdHFBeHVtZWJDa0RwcTRidTJHWHZ0MGNLQW5lL09G?=
 =?utf-8?B?V1lqOHF5WkZsN0pVZ3poOXlYOW1oWW1qOW1zQXhUY1NtTm1TWXdNYnF3b3hB?=
 =?utf-8?B?c0V5aXdXeG83LzBLUU1WajB0RHVkcno2Vks5TTNTV1JaQXJ6QlZSbWVRV3FL?=
 =?utf-8?B?UVFGQi9ETFAxc2E1WXBaTEl4N25mOHdxQ0pKaGJjeEZ6MkJ2dGlxR01rQ25l?=
 =?utf-8?B?aTRGaWlzV2VzVm1iTVF1MkhXSnp6UFZKQkVBMFlKekUwUEI4TGpPaGhUK24r?=
 =?utf-8?B?VnpYeWFBa1BTdFpkRFY0eDFTVVFCVTRLOFdrcmo0aUdWRC9SU2k3cDdtdkg0?=
 =?utf-8?B?RTdmc0Q2L0ZhdGxucHZqemNjaWNwU2YzUDBpenk5MXZqc2psTnVEeXFnbDNQ?=
 =?utf-8?B?a0htMFBFQ1ZIakxlZHhtWkVPRVJMVUZHS0YvWktIVEFGSVc4bnVOdVFvazdN?=
 =?utf-8?B?WTlQK3lpUFZVQndJUDFsQXJtajlYUGZ2ekxQTUI2NG9tOUw4YSthMXJ5Yms1?=
 =?utf-8?B?RWRGVFNWdEZ4VU1PSEZjSXlaL2NlSEpZV25IRUpXaUpnWEI4MUxhRUZoYThh?=
 =?utf-8?B?ZXM2aGFrSmVsL1ZvZWJmSWxTSlhkdUk1QkZvTTdqRlIzeldtRzFZMlhFVDZy?=
 =?utf-8?B?MUVCMU8xSGF0R3BUYWNUSHdjTEFab2dMMXNkMjlpMHJJRHljN0hHcDFnUnRa?=
 =?utf-8?B?Zm1YN0RyYVFrQzZUM3hXbW1rSHgvR21qaE9yN09kRUxvZ3k5TnRudzdZdGpu?=
 =?utf-8?Q?bnl662hZStyrxjxcW0BtADNse?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BA72EE65860F6149A5ECF05A9CF7EAB3@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 099ec323-f78d-4c87-f6a9-08db72e8d85b
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2023 06:20:59.0477
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Wb0u1OCEzgh322AFoPYhxKD1sfuy9Mzekpk1HZd4OYCDRWeKvmtaRlKaXf7Hp50I+MVkLaAKR8tLAzum71R9oeZgt63mIEbSF5b61u8wBaU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAYP264MB3320
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

DQoNCkxlIDA2LzA2LzIwMjMgw6AgMTE6MjcsIE5pY2hvbGFzIFBpZ2dpbiBhIMOpY3JpdMKgOg0K
PiBPbiBNb24gSnVuIDUsIDIwMjMgYXQgOTowNCBQTSBBRVNULCBDaHJpc3RvcGhlIExlcm95IHdy
b3RlOg0KPj4gSXQgaXMgcG9zc2libGUgdG8gZGlzYWJsZSBLVUFQIGF0IGJvb3R0aW1lIHdpdGgg
J25vc21hcCcgcGFyYW1ldGVyLg0KPj4NCj4+IFRoYXQgaXMgaW1wbGVtZW50ZWQgd2l0aCBqdW1w
X2xhYmVsIGhlbmNlIGFkZHMgYSAnbm9wJyBpbiBmcm9udA0KPj4gb2YgZWFjaCBvcGVuL2Nsb3Nl
IG9mIHVzZXJzcGFjZSBhY2Nlc3MuDQo+Pg0KPj4gIEZyb20gYSBzZWN1cml0eSBwb2ludCBvZiB2
aWV3IGl0IG1ha2VzIHNlbmNlIHRvIGRpc2FsbG93IGRpc2FibGluZw0KPj4gS1VBUC4gQW5kIG9u
IHByb2Nlc3NvcnMgbGlrZSB0aGUgOHh4IHdoZXJlICdub3AnIGlzIG5vdCBzZWFtbGVzcywNCj4+
IGl0IHNhdmVzIGEgZmV3IGN5Y2xlcy4NCj4+DQo+PiBTbyBhZGQgYSBDT05GSUcgaXRlbSB0byBt
YWtlIGl0IG9wdGlvbm5hbC4NCj4gDQo+IEkgbG92ZSBjb3VudGluZyBjeWNsZXMsIGJ1dCBhIENP
TkZJRyBvcHRpb24gZm9yIG9uZSBub3AuLi4gSSB0aGluaw0KPiB5b3UgaGF2ZSBtZSBiZWF0Lg0K
DQpVbmxpa2UgbW9zdCBvdGhlciBwb3dlcnBjLCBhIG5vcCBvbiA4eHggaXMgb25lIGN5Y2xlLiBT
byBpZiB3ZSBjYW4gYXZvaWQgDQppdCBvbiBob3QgcGF0aGVzIC4uLi4NCg0KPiANCj4gSXMgdGhh
dCBzdXN0YWluYWJsZT8gV2hhdCBpZiBpbnN0ZWFkIG9mIHRoZSBzdGF0aWMgYnJhbmNoIHlvdSBw
YXRjaGVkIGluDQo+IG5vcHMgdG8gdGhlIGxvY2svdW5sb2NrIGFzbT8gQUZBSUtTIHRoZXJlIGRv
ZXMgbm90IGxvb2sgbGlrZSBtdWNoIChhbnk/KQ0KPiBDIGNvZGUgaW4gdGhlIGt1YXAgZW5hYmxl
ZCBicmFuY2hlcy4NCg0KWWVzIHRoYXQncyBwcm9iYWJseSB0aGUgc29sdXRpb24gYXQgdGhlIGVu
ZC4NCg0KQXQgdGhlIG1vbWVudCBJJ20gc3RydWdnbGluZyB3aXRoIFVBQ0NFU1Mgb2JqdG9vbCB2
YWxpZGF0aW9uIGFuZCBJIHRoaW5rIA0KSSB3aWxsIHRlbXBvcmFyaWx5IGRpc2FibGUgYm9vdHRp
bWUgJ25vc21hcCcgcGFyYW1ldGVyIGZvciBQUEMzMi4NCg0KVGhlIHByb2JsZW0gaXMgdGhhdCB3
aXRoIHRoZSBzdGF0aWMgYnJhbmNoLCBvYmp0b29sIHZpc2l0cyBib3RoIGJyYW5jaGVzIA0KYnV0
IGl0IGRvZXMgaXQgaW5kZXBlbmRlbnRseSBmb3IgZWFjaCBicmFuY2gsIGl0IGlzIG5vdCBhYmxl
IHRvIG1hdGNoIA0KdHdvIHN0YXRpYyBicmFuY2hlcyB1c2luZyB0aGUgc2FtZSBrZXkuIFNvIHRo
ZSByZXN1bHQgaXMgdGhhdCBpdCBkZXRlY3RzIA0KVUFDQ0VTUyBlbmFibGUgd2l0aG91dCBVQUND
RVNTIGRpc2FibGUgYW5kIHZpY2UtdmVyc2EuDQoNClNvIHRoZSBzb2x1dGlvbiBhdCB0aGUgZW5k
IHdpbGwgYmUgdG8gcGF0Y2gtb3V0IHRoZSBtdHNwciwgZm9yIHRoZSB0aW1lIA0KYmVpbmcgSSdt
IGp1c3QgZ29pbmcgdG8gZGlzYWJsZSBpdCBjb21wbGV0ZWx5IGZvciBQUEMzMi4NCg0KQ2hyaXN0
b3BoZQ0K
