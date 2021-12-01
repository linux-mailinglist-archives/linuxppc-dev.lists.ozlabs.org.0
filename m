Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BE758464F81
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Dec 2021 15:20:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J41TC4hK5z3bfv
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Dec 2021 01:20:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=infinera.com header.i=@infinera.com header.a=rsa-sha256 header.s=selector2 header.b=CKKzIYEn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=infinera.com (client-ip=40.107.237.51;
 helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=joakim.tjernlund@infinera.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=infinera.com header.i=@infinera.com header.a=rsa-sha256
 header.s=selector2 header.b=CKKzIYEn; 
 dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2051.outbound.protection.outlook.com [40.107.237.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J41SQ6wnFz2yZv
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Dec 2021 01:19:48 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b4dQ61/6UVMhpsdD+kLhN1XFxgyg6Mkty/y7qmKVWHQR476oNeQngngL8IeeEnsvX5E/2p2cztp72q9qHIBAfDORh4IzFXX7qydbRKoEJezeQPIP1Wmiptmojshhdm40lJ5SkorfvMqZqvQMQpdMWdGrJRBGYApYSclAnyZD3+i9Vr7tuymBuK240I546s6LOa4pYGvarUdrdNsE2ErHfsJ1J9uaBKvGSTyREJBVwrldKXCrGpylMkunKsPBVE56kxxlyAQ6ftIkUdfCh9nPdhtlqYV1NGmV4AkQiq6lZ4Zq6LjBn0My/yl5EDoK+FFaGluNz+j9GWmVG5MkPYVZRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eeRzaE2irnuV9zmeoh7q2Nqr8Vrz5pjFBzLxGmEuA8U=;
 b=fDksnHlHQ0VeSJtUnfi2QVYVhKCYh8pMuYqjCSwxXNHWKDaGSsOS/c0Bq8viOPish42rHW5uj8tz1UgO3iiaIJ24iIFYNKpwvSzcnBt8eUSKtfO8AfeHVoeKg9PugE1OFhiqYSBK6JaFDwQnRSRT+te8Bc1tgQ7Wq6rGrbb8Ad+87ktYF311GxlXhOTRl/9Xb7o/1bsE/FsGQPBbhvyc1mMv+jlL/EvSTz3+2ek4236e0ay/7s1yyJ+QX5NDUgwF+fWxakw13RoZYlhoczZp5w8ZFQfRnwiPeAWqTTGrrswhzDQn5zUXjSoRKKKXsUcH8m9f2j6y7N2I6U+NawtaVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eeRzaE2irnuV9zmeoh7q2Nqr8Vrz5pjFBzLxGmEuA8U=;
 b=CKKzIYEnp+P9m3/VhuSg/CRdEoVq+2IJdbwh9DsDXnkYQDwwZLpUVvID8EeaGtB0K7D2FyuG9oQ1cOD2hE7LoDG4uCq2CrOThE3kXm+noALUcvehRxGwzuVGGQhZyf8MtZse2SXxKT3u1Px8XKmXBcbdqO9coPGkaAR/3+ZjMHo=
Received: from PH0PR10MB4615.namprd10.prod.outlook.com (2603:10b6:510:36::24)
 by PH0PR10MB5731.namprd10.prod.outlook.com (2603:10b6:510:149::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.15; Wed, 1 Dec
 2021 14:19:29 +0000
Received: from PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::112e:1c94:4171:1db7]) by PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::112e:1c94:4171:1db7%6]) with mapi id 15.20.4734.024; Wed, 1 Dec 2021
 14:19:29 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "regressions@leemhuis.info" <regressions@leemhuis.info>,
 "leoyang.li@nxp.com" <leoyang.li@nxp.com>, "Eugene_Bordenkircher@selinc.com"
 <Eugene_Bordenkircher@selinc.com>, "linux-usb@vger.kernel.org"
 <linux-usb@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>
Subject: Re: bug: usb: gadget: FSL_UDC_CORE Corrupted request list leads to
 unrecoverable loop.
Thread-Topic: bug: usb: gadget: FSL_UDC_CORE Corrupted request list leads to
 unrecoverable loop.
Thread-Index: AdfM5PT/NvfAW0+iTcC+AdIF01azggAtEqGAAKVd5oACc0lYgABIbVXQAbnCUAAA0DL90AAM8XwQAABPhqAAGbtsgAA3RpcA
Date: Wed, 1 Dec 2021 14:19:29 +0000
Message-ID: <527ebc333daa2a1d513ea217e5beb61a5acea3fb.camel@infinera.com>
References: <MWHPR2201MB152074F47BF142189365627B91879@MWHPR2201MB1520.namprd22.prod.outlook.com>
 <2c275adc278477e1e512ea6ecc0c1f4dcc46969d.camel@infinera.com>
 <6659a2c7fd9fffac766b8389244e5885ccbd38bd.camel@infinera.com>
 <bb5c5d0f-2ae7-8426-0021-baeca8f7dd11@leemhuis.info>
 <MWHPR2201MB15209AA4F2457934BDD3293B91999@MWHPR2201MB1520.namprd22.prod.outlook.com>
 <726d3561-1842-72c7-d4cb-9a99211bb05c@leemhuis.info>
 <MWHPR2201MB1520A85FE05B281DAA30F44A91669@MWHPR2201MB1520.namprd22.prod.outlook.com>
 <AS8PR04MB89461BF7A3272E5A18ECD0948F669@AS8PR04MB8946.eurprd04.prod.outlook.com>
 <MWHPR2201MB15205A333F1F610D332038AC91669@MWHPR2201MB1520.namprd22.prod.outlook.com>
 <d0c52d26742b082f5a953a05630a9d70e0eb1356.camel@infinera.com>
In-Reply-To: <d0c52d26742b082f5a953a05630a9d70e0eb1356.camel@infinera.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.42.1 
authentication-results: leemhuis.info; dkim=none (message not signed)
 header.d=none; leemhuis.info; dmarc=none action=none header.from=infinera.com; 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9a032758-4540-4910-18dd-08d9b4d5965d
x-ms-traffictypediagnostic: PH0PR10MB5731:
x-microsoft-antispam-prvs: <PH0PR10MB57318DD87F93B232411532FCF4689@PH0PR10MB5731.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GthacPXiA1k71sZs5K+ifjp03hwe+rKkfeOrJEI2WpUr4HHgrk73kmGSb0iKdq5mV2x+AT+ZmXYm4AItzSswnfNxfPRXPeI6m3nkI4RL5SNYioFvM+6wgMl9yvvr4S60RyWObO5X+UPBNNyhHT2Pj9f9yYV4TUcPg4TkrG9mUz+qxarUUiZ3bn8QtnvXrKxCV1ud6WxmAWj19ZjM2FPiir9wJvVzmzSbSHLWjpNh+hNZT+ZLTFlsrIlRf+/ape8DhDZwT9cR7iyx+abT/Rtc6MmDi1KlvOFL7XewWtx3vBuQSHjwmrk6T2ImvYIFrf1jucfIutzO4KsOq1fTgDAudhVReIsBBALydd4SmEyat3obsuSzNxiZdI6sMlY/c6exE/xoU2TQ1FEycd9/fgNjr4XjQ1UmF+atae7b/TjddxAzcD5FGQdQTZ3xoWQItyL+3KGUR/SL6VmjCPw0U+hrk+7nXICeZK4vMM5cJfwlaR32jYa6ic8vWSuVSVsD9XTQGx9Oe8c6PYCT9l42mqzQ8GVYv0WtxJK1H952tJd4EVBOZLP8UHTZV/qsHfPAr69NgML+JePV6CxqNx6eigVYAskRKJPpC3riPkS6ZRPeJxDnxdej4P7v6rfHB6AqxJEwOzxYxRXKXZ1H2S1Zebg6Vv/N6vfBDlIh/QjrEZt/HrhXs8CCrD8MrrMfCdoIr94XBHQE1AJNLQFn+p+K/SKTpg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4615.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(122000001)(2616005)(6506007)(71200400001)(38070700005)(91956017)(86362001)(83380400001)(5660300002)(508600001)(66946007)(8936002)(38100700002)(6512007)(8676002)(66476007)(4001150100001)(66556008)(76116006)(110136005)(54906003)(6486002)(66446008)(36756003)(4326008)(316002)(26005)(64756008)(2906002)(186003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cUtQdUIyWVRMcGdEWmJ2SnQ2ZHp4RmluNkZyaXdUa2ZaOUdNUnpNQW80bko0?=
 =?utf-8?B?eVRRYitmcCtrc21OZVFVUXlpdU9pckxFVDJqQzBQUzJGYXN3UVFHUy94WVU5?=
 =?utf-8?B?eC9iamNIWkdmKzcvSUExazdnN3l5dWlIVzRCU1Zsb1p6cm5BMTJ5ci91MzdR?=
 =?utf-8?B?aVBxZkJBQnJER2Y5aExFU0ZvUkk3QzhLcis2b216UTZWNHE5dzNrSW1uZDIx?=
 =?utf-8?B?OU5qb3ZaL2NVUHNzQUhyeUp1dzBRTzhLL0M4cTlTeGVYMTF0SEZTQWZWU2lk?=
 =?utf-8?B?bElBYklTR2dZSjNWVk1sV0FaeVNiRFFvTXEzNVd5S0NyKzNzNHJyQmg5WnVk?=
 =?utf-8?B?dEZCVGt6Rm9qZzdIcUIzcElNWU9BSWlPRkU1RmhsbDZ2R0JlNzdaTldxUGpj?=
 =?utf-8?B?UVh6T2ppOS9NYnFRNmF5d1I4dWRZa2U4aGZoUm1tQ2tVcm5GREN6STFjWEd4?=
 =?utf-8?B?NG9iN3g1NW12TkxGelQyTmwyNHBqSmlCUFhmWFR3U0F2cjhsRUNGT3VPKzZx?=
 =?utf-8?B?TUJNSUxTTldKR21TbVJ2TGNDd0xVTE9oR0NndXByNXN0eGVoYi9tenFRKzh5?=
 =?utf-8?B?TWk4Ly9HUDh1QU9RK1F4T0FYSW9EcTNWT0xpV1o2QVdFcERva1VvZWNma0dr?=
 =?utf-8?B?ejhubGtrQXVEK0EvSitmUWJIdVA3bHFYOWh5U0JKU00rWmhZVm94WktJYUZm?=
 =?utf-8?B?eERLNEVGMUl1ZWpDL0lyYk9hWnc3UmtzZGNNZ1NLTmtHbUxKRE10NFl2Ulp0?=
 =?utf-8?B?U1BFYkJWUE5BbzlkU0NGS2N1QTFBNDlnZXVRK2g4S2VZY0ZMbGVMNk9Pejdy?=
 =?utf-8?B?S1IzWFpFR3RjT2s3eXVzWDZXOXVKczVJTHNXOHFlSExPQmxtM0V6TTB0U0lH?=
 =?utf-8?B?Q3d3djRmSmJ6RE1BMDFRNjhmSEkzOFpSWWpuTFhiSmJQYy9CaTNHSU1PSjFR?=
 =?utf-8?B?SGt4a1BXN3krcExOT3JXOExSWnluenNoS05MTWVkdGF5UE5JVEFjOFVZZWFD?=
 =?utf-8?B?eWdqbERaWjZPZ2d1S0RvWWZ1TE1adU1YOVpXTUxHenpJOW4yZGNjalBIZVdG?=
 =?utf-8?B?RHlpYnBiNDk2ZVVQSTM3VVJhdWtibDhickJzQkNKMWFLdm9BMmcyNDRYaWZs?=
 =?utf-8?B?S3FvSDdMWG95WDdieG0ydUhJdUlZVWliN0RuMDh5SWRZNDUvWUMxYmZIWVoy?=
 =?utf-8?B?aFE1Tkh5QkdLS01aejNzK1ZScEE1T0R6WWdLNWFmakZ1MGxkY2dQeDlaS3R2?=
 =?utf-8?B?aGNRcU40Smh3WGplK1FmN2kreCtpcHdMd3VGZG1wc3dMU1FCVEdIVWxOSkI5?=
 =?utf-8?B?U3lkS2NGMFZsUWk1blh3b1FmMmJFUUhwUkRHK3ZKQUw5SVFlQ01zbVFDUTR6?=
 =?utf-8?B?ZnVzc01nNjc2NTJaS0RCRkVMY0lPWjBUT05vMC8xN3ZLRGcxNmRZMGQwd25o?=
 =?utf-8?B?aURWeC9UbVQvM05HNkUvRmJmY3VsU3JHbkhUdUM5bVdRYjVhU1VucUZzMFJi?=
 =?utf-8?B?WXlhTFBFa0Z3YXc2eUk2WDVuOUszV1g3Wm5IOFBoeTNWbzlxVXh2Y3pkR1lQ?=
 =?utf-8?B?di8yZFF0S0lsQWNIelBUR0p2RUZWczl4YjlLS0R6U2YwR1BEQUFuWDZzWVY4?=
 =?utf-8?B?QWtERDlCVnV2UkEwYWVFSHE0SmV6OGJKMlpkSHc2dWRtRXpTRTdPZm5kRkEy?=
 =?utf-8?B?aTk4Z3VidzQwc3lVeXpXTlV5aU5raFpjUFNFQVBGdjY1K28rNUpTYkdVWURk?=
 =?utf-8?B?UlVQQk1wUDFSSExrMnRySzErQXV3NGdJWGdLZFp0dzZLeTFTbWpxR0NEdlFV?=
 =?utf-8?B?dzlSSzloaGxUYnFKa3Zjdz09?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <9562F9C8032C3842A632306346B58684@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4615.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a032758-4540-4910-18dd-08d9b4d5965d
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2021 14:19:29.1809 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KQi4F5bzrh1pKXGEdp0P2CKbkbIko0bp3Q2neDmfkhibE/+4CPkJ4adzW+f1nTk+5S7rMUbQeJJg+ZnKL/sfmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5731
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
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "balbi@kernel.org" <balbi@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gVHVlLCAyMDIxLTExLTMwIGF0IDEyOjU2ICswMTAwLCBKb2FraW0gVGplcm5sdW5kIHdyb3Rl
Og0KPiBPbiBNb24sIDIwMjEtMTEtMjkgYXQgMjM6NDggKzAwMDAsIEV1Z2VuZSBCb3JkZW5raXJj
aGVyIHdyb3RlOg0KPiA+IEFncmVlZCwNCj4gPiANCj4gPiBXZSBhcmUgaGFwcHkgcGljayB1cCB0
aGUgdG9yY2ggb24gdGhpcywgYnV0IEknZCBsaWtlIHRvIHRyeSBhbmQgaGVhciBmcm9tIEpvYWtp
bSBmaXJzdCBiZWZvcmUgd2UgZG8uICBUaGUgcGF0Y2ggc2V0IGlzIGhpcywgc28gSSdkIGxpa2Ug
dG8gZ2l2ZSBoaW0gdGhlIG9wcG9ydHVuaXR5LiAgSSB0aGluayBoZSdzIHRoZSBvbmx5IG9uZSB0
aGF0IGNhbiBhZGQgYSB0cnVseSBwcm9wZXIgZGVzY3JpcHRpb24gYXMgd2VsbCBiZWNhdXNlIGhl
IG1lbnRpb25lZCB0aGF0IHRoaXMgaW5jbHVkZXMgYSAiZmV3IG1vcmUgZml4ZXMiIHRoYW4ganVz
dCB0aGUgb25lIHdlIHJhbiBpbnRvLiAgSSdkIHJhdGhlciBoZWFyIGZyb20gaGltIHRoYW4gdHJ5
IHRvIHJldmVyc2UgZW5naW5lZXIgd2hhdCB3YXMgYmVpbmcgYWRkcmVzc2VkLiAgDQo+ID4gDQo+
ID4gSm9ha2ltLCBpZiB5b3UgYXJlIHN0aWxsIHdhdGNoaW5nIHRoZSB0aHJlYWQsIHdvdWxkIHlv
dSBsaWtlIHRvIHRha2UgYSBzdGFiIGF0IGl0PyAgSWYgSSBkb24ndCBoZWFyIGZyb20geW91IGlu
IGEgY291cGxlIGRheXMsIHdlJ2xsIHBpY2sgdXAgdGhlIHRvcmNoIGFuZCBkbyB3aGF0IHdlIGNh
bi4NCj4gPiANCj4gDQo+IEkgYW0gZmFyIGF3YXkgZnJvbSB0aGlzIG5vdyBhbmQgc3RpbGwgb24g
NC4xOS4gSSBkb24ndCBtaW5kIGlmIHlvdSB0d2VhayB0d2VhayB0aGUgcGF0Y2hlcyBmb3IgYmV0
dGVyICJ1cHN0cmVhbWFiaWxpdHkiIA0KDQpFdmVuIGJldHRlciB3b3VsZCBiZSB0byBtaWdyYXRl
IHRvIHRoZSBjaGlwaWRlYSBkcml2ZXIsIEkgYW0gdG9sZCBqdXN0IGEgZmV3IHR3ZWFrcyBhcmUg
bmVlZGVkIGJ1dCB0aGlzIGlzIHByb2JhYmx5DQpzb21ldGhpbmcgTlhQIHNob3VsZCBkbyBhcyB0
aGV5IGhhdmUgYWNjZXNzIHRvIG90aGVyIFNPQydzIHVzaW5nIGNoaXBpZGVhLg0KDQpMZW8gPw0K
DQogSm9ha2ltDQoNCg0KPiANCj4gICBSZWdhcmRzDQo+ICAgICAgICAgICAgSm9ha2ltDQo+IA0K
PiA+IEV1Z2VuZSBULiBCb3JkZW5raXJjaGVyDQoNCg==
