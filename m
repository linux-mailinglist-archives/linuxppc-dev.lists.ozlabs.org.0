Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1A75BAE35
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 15:33:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MTZlS4gLsz3c7C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 23:33:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=Qksp1DiT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.47; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=Qksp1DiT;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120047.outbound.protection.outlook.com [40.107.12.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MTZkd4BL2z30M8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Sep 2022 23:32:38 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ah2mYEEho1rQ7rJ88v97ASHNvnw2GXTlw799mvK7v5dlqrfBKL4BvSDfLv2zCTJwyq6UHPQ/hd6ttL6P0PpRP3KWNcLJR9lg7MWMiXvVetxQ241WdknOAJljsPPCsebo7tnvfZPY8/RcyG/ghEEnKIut9zgPvKQ8TzMvgbC24K4TTLq9jU2mz06Enw778w9HVaY3s8CVL4UBiJ9kSxy3hShvZTOJpkalQya8bsavdqY1RtFLe9I7ps7nTKBEqYp55mXfA93Fe3S4PJeCVuVx7QpEFvox7tP4gKP//HRqEXByYrlXrsOG4ELCf/LaWjFOyu6xnUlxNmZOVOjTew5B4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/qzIyR+JciP8R0ujtpnTJCgk3WbxMBJ6IFKjkIXmjlQ=;
 b=EQhMYEguhtnSWJBsLIU4HaU7fkYJlFKufcJD9Q4bGyB+ezcmsCBYUDfYXuSZBwj7ibzRfJPI0Pi7Nr2nIO46PMsSoZlr/UfXhFGPxAg4jA/jTKAoSR6IQKi2zxOrjKiZVfJLWoOtIbNpoL1K8kz6dXlN6anhKP7dPqgf22CCfzz4N8owCNrAbU5JKlms7w2C7470CWdlgTFsWp3jF8P4zygiTYuJvcTu2H0ip0leBewAdfFMj+pI0oxeASIefnLOS7UnH7zni9RwfcaAESMxRsrWH6XUbsxI4YEB5r8l1RrtYUL/I9T2OCinwwvotr6bIvRk+rpBuzrIwVzeLq21SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/qzIyR+JciP8R0ujtpnTJCgk3WbxMBJ6IFKjkIXmjlQ=;
 b=Qksp1DiTXlRBfMnts5Sx7a4PyGc0geC2enli0Qjl0C2bslnwC6gVhAubnS/HGo5Zno6tZbGtY9AXAo56ApYHpmfQE3OVU0sL6DYiopEMUuBHglbJ0VzUhPQfVH/t6Wmf7mcsKdar7U+8rm0MF9Cr6leESJ9Vefevx224Ud12NjmYPIHS5KqXf8XHUFY88AWAQLF66KFc2mUVql4qbLuz6HEAqVlPbpUa744Yb1+sYEewe4kPwpvHWRdLnWF6T19IKLhsj5NWxHoezuLt5uQTQF/ZorSpogBFfXo/w/bJiA+xS74nEHpK4vwQ2sgeNYKegOChwazQ/iQa8XfKyhAyQw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB2926.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.16; Fri, 16 Sep
 2022 13:32:18 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8%5]) with mapi id 15.20.5612.023; Fri, 16 Sep 2022
 13:32:18 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 1/2] powerpc/vmlinux.lds: Ensure STRICT_ALIGN_SIZE is at
 least page aligned
Thread-Topic: [PATCH 1/2] powerpc/vmlinux.lds: Ensure STRICT_ALIGN_SIZE is at
 least page aligned
Thread-Index: AQHYyc5q9/7t+dzFhkmxmZagGS9EN63iDd4A
Date: Fri, 16 Sep 2022 13:32:18 +0000
Message-ID: <5d88f02c-1d3e-4a5b-9aaf-87eb420df6e2@csgroup.eu>
References: <20220916131422.318752-1-mpe@ellerman.id.au>
In-Reply-To: <20220916131422.318752-1-mpe@ellerman.id.au>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PAZP264MB2926:EE_
x-ms-office365-filtering-correlation-id: c96aeeba-983e-43e4-b8e6-08da97e7e06d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  th/5j4pVnVibwOvmFbFGY8jjw5yzz9hby0m7AzyexNzmPED8lWv4CVJlgpYXaZpipyVKAjJBkW3FHGGUz1TY1oveUUfEP2KFYfrFsjrkdWNBiCqWx8pxS/vM+qCmDBn6FBqS+N87TKauhML9VTDAhHd9pm9MMDKlS7nsOBqTfoULzQ5o5y/c3wNgKcD9DtOdQxaz3XE7ZIdbVKJSkrXos/f9BcRrlbnvZfLO1+M6eL7jZ1OVDr8MifAF5jBsq0YbdjGRmhanBD4Eq6rbOutONYMXXwkZS/4Ac0ZbO2X3OpDkFusIbWAiios+WMeQLB9t6o/Darj73x/NkUey4CalZtYkcAcke1bfaMqIx4PpojnqwZexuWjzRTtl3lo17UB5/AC7BAf7Ix96pJskAovoWlR9qpkaqugUefaoAXExScLeYaKUNwBO9W7PHDYdAnmbL7rBat3HfMzKZiu2tLNyiF0Wlq4ZL3fPm5kl0bmxEFsrzRaoLvTxLKxa6nOUKeNpUD6tVYbe79T2t77XU3gkDz35cAjvYU6Fgb1oaG+ZKy9HbDxAvZapUzTKdXzRynFsjUzY4nPj2mF8hhKUJeGc2XZkhqW07UGNHnJCFeBggpK3uDWTyvwuPTNMAMkdPaxhWo/DJraaibWl35wOwFRIMVvdU7j4fw6gzvqIC3kYtYT/lxCOeG6XgX381WhLfbUjShTEquT3XKqdBl7u8dKHIhfSdKfY3gW7gNEZii0yI19xML1N0x3Rc+MKI8uAyyU3A4faVc2st0DG+kjJbbboDFNyRGiG3fYFsYfl2VJO6hNkXA14TzZDYVVVFjHCWZnNaPLGktknvNKNIbw+fLAq3w==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(376002)(366004)(346002)(396003)(136003)(451199015)(36756003)(66574015)(316002)(31686004)(31696002)(38070700005)(2906002)(44832011)(5660300002)(66946007)(122000001)(38100700002)(8936002)(66446008)(64756008)(66556008)(66476007)(41300700001)(478600001)(86362001)(8676002)(26005)(110136005)(91956017)(4326008)(186003)(76116006)(6512007)(6506007)(6486002)(71200400001)(2616005)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?cC8xY29haXllYkw2VnFha2NYVkx3YzlCbW5xSlNzSlFrVUQ2bkVlK1VrNEM2?=
 =?utf-8?B?VUdQOFhjSG55MnQxbzJmeWYxTk9sc1M1NVNBL3lJNDROV1hSbU5aNHJEV1Fi?=
 =?utf-8?B?RmNIVHh3ekJ2MERYVnZVV0tjM0tDSUJzQnVLNVpVV2s5clNHV2J1akFYSDZi?=
 =?utf-8?B?eFNGY0duK1U1b0pNSWtJcXRJa1hHaERyWjA0MVYwZUFSOE1nV294Y3pPQjlK?=
 =?utf-8?B?K3MwVkdDS0E4bEdHWmt5eURPUU9CZmVIOHRCV1haZjM2RWMvTFRraThxc1Iw?=
 =?utf-8?B?Z3dwd1hldWpjM2tIWFZWeUtwaFg1aDVIc2swS0RFOWVFS2ZHckxEQ0ozZ09x?=
 =?utf-8?B?L1NOMVZVZmFob0gzdERrd2hzdVpCQnFEbGxLSHM1WCtaYjRTS0lPUWlZU2ln?=
 =?utf-8?B?UENCS3pxdTBHZTR3OHgrc1FQcnl2RjluRjkrL0RxenEveEpkYUk4dzEyM0hX?=
 =?utf-8?B?K0IwU3RBcUZJcGEwUzltTU96UVZGNVBGUGttQ2FPc0hDOXdVSjRNZ2g4Z002?=
 =?utf-8?B?MERPM2gyRzNkd1A5WGRvR0lFTHVHbWR2bGdiYURyNVZtTHVjeCtUNExFemcz?=
 =?utf-8?B?SkVFSENTUEcrZmxTTFRCVXRGbjV4UjZ2ODhYMGlhR2FLR3ptR0tQT1JwUU9K?=
 =?utf-8?B?YWEvcmNJdUdQR05zMzJ3cFVVc0QxRDk3RVJuWTl3RWY3S3paSEE2SHpLY2tS?=
 =?utf-8?B?Tk1TMUpGMWNPWkRNL0JCQTZvcmpidTZ6R2J1Y1A4ZUhyMnpJRXZOWjRQV2Jo?=
 =?utf-8?B?THlVenJKbW5KS25PaUpzVEtNRmo1ZEI2NkdadktwQzNUbkZ6RHhNWThlQjhZ?=
 =?utf-8?B?c3pudXJGWVd1cjl2WWlXcFk5YzU0MnNRVWpoZjBHRURodVhjdktSOC9oT1BL?=
 =?utf-8?B?Z3ZyNGRnS254L0VXekdTcGhmVmZxb290Y0lXdUdzZlJ6T0hOT1FEQWhIck1o?=
 =?utf-8?B?aE5ZSHYwWGV1WUs4NHpseUpORTl1Ymx4bVR6SXhjdWFQdkZaWHhYUlRMUUtv?=
 =?utf-8?B?UXRuMExrZ1AyemJSOC9UNGdDNHFaVExUbDVoZEM0bzUyRXZPUVk4TzNYeEdm?=
 =?utf-8?B?WDB3MTRydnhtTERyMU5vVXdDTVVXT2xTNmxKaVUzT3J6NHFBZnpZZUxiek5x?=
 =?utf-8?B?YkZGUmxPRXIzU3lCckNpekpJOW1LUjVWanRoWGpDRURXQmRxVENjWGg5MVBT?=
 =?utf-8?B?aHRITm9HY2JkZjRFVXIrS2QrL0FheGJraTd0Vlljcm5xbVpEOVN5MFNxU0p2?=
 =?utf-8?B?Nm1kd0VQNkVXMm5qU2NzWEkwdkxNUEh6eEpIblJFL04xVHpsckJWMXk3ZWlk?=
 =?utf-8?B?NG43RlFydWpuUlpSVE1lSnhtdEU5NjlQbGhaaVh3YUJjdVg0Z1l1YW1uN2ta?=
 =?utf-8?B?MkNsWTIzaUZjSGxjc3JrT3hQY04ydkFZdXBWSUkvSU9wQnpSdzlCRXEvM200?=
 =?utf-8?B?NVZMVGRPYjF2STEvNURRKzFEUzd1ODJCZUlaTThYeTEzdzFpaUlXV2o0V1Bn?=
 =?utf-8?B?emVwU2hvK2lYTFpGb1l6T1NTSnRIMlVZaExteHhPcVNNQ2xZYWZISy8vYW9J?=
 =?utf-8?B?eHFIVjVxbEd1bnNzYmpvb3ZQd0tTd2RrK2NncDE5clc0TXpFZlkzUnN1Ymhh?=
 =?utf-8?B?cVFPRUtMMmE1RFZXWXk4cGJoeG9PeXhkdWtPR1huY0tRbHdWUE5wNCtvTmVs?=
 =?utf-8?B?U1oremRMMzZUSEFKYXZ0TCtBMEtFY01BMStieWRIOFhvYXpDWm9nRXBrS0Nl?=
 =?utf-8?B?c0tncytNM1FOZ2RTWFdFcm84N1oxb2hnL0p3RkVzdkZ5Z2hPU0M5UU9UYjlH?=
 =?utf-8?B?NVV5WFBZckxNb3ByTjJuZ3BzWDNUMlgzdWhGN1lSeXZaN0RtU1lnalJ5endF?=
 =?utf-8?B?aitHNTdHVFgzRkxMRWx4QU9IZVFSbWJHdlQ0czRtZjFwbmh3R1ZTbmlTYk1s?=
 =?utf-8?B?b2Q3Z0FkK2Q1T1c1d3Irc1Q0ZGI4N0Z2TnVwTm9rZnVKQlljNWRIcUZOWmta?=
 =?utf-8?B?Rlk0RzFNSG1wemMxY0tpWUtSNC9JYmxkMUdsU0xOeXphajNjOHZUTTg0N010?=
 =?utf-8?B?YjNUS2dhODY1ZnUzQU1WQWdGVzZmd3FUMFFmSjkrT1VQQUl6dDdQeFVLQXAz?=
 =?utf-8?B?RllXc2RVdDNUNUpDTUpJUDcvRm1VSXBBbVdzU2pkZURvZEROd1ZubVBQU25v?=
 =?utf-8?Q?QJPS+ZUBAQhdEaW+yu45jDI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8CF0DC9866B8B043A985D6A3899E3E85@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c96aeeba-983e-43e4-b8e6-08da97e7e06d
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2022 13:32:18.4248
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IGPO/Dvtr+9z1McCcr3ClzZ+HCm+ZUfzlQ1AHaKH6BjNspYHMZI/wrIPROg1p6oKIyE4Gg9oiE+zHO6Ypw3UP3mQqohMn/f1zQBtanlhP4I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB2926
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
Cc: "npiggin@gmail.com" <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE2LzA5LzIwMjIgw6AgMTU6MTQsIE1pY2hhZWwgRWxsZXJtYW4gYSDDqWNyaXTCoDoN
Cj4gQWRkIGEgY2hlY2sgdGhhdCBTVFJJQ1RfQUxJR05fU0laRSBpcyBhbGlnbmVkIHRvIGF0IGxl
YXN0IFBBR0VfU0laRS4NCg0KVGhpcyBjYW5ub3QgaGFwcGVuLCB0aGUgZGVmaW5pdGlvbnMgaW4g
YXJjaC9wb3dlcnBjL0tjb25maWcgZG9uJ3QgYWxsb3cgDQp0aGF0Lg0KDQo+IA0KPiBUaGF0IHRo
ZW4gbWFrZXMgdGhlIGFsaWdubWVudCB0byBQQUdFX1NJWkUgaW1tZWRpYXRlbHkgYWZ0ZXIgdGhl
DQo+IGFsaWdubWVudCB0byBTVFJJQ1RfQUxJR05fU0laRSByZWR1bmRhbnQsIHNvIHJlbW92ZSBp
dC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1pY2hhZWwgRWxsZXJtYW4gPG1wZUBlbGxlcm1hbi5p
ZC5hdT4NCj4gLS0tDQo+ICAgYXJjaC9wb3dlcnBjL2tlcm5lbC92bWxpbnV4Lmxkcy5TIHwgNSAr
KysrLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkN
Cj4gDQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMva2VybmVsL3ZtbGludXgubGRzLlMgYi9h
cmNoL3Bvd2VycGMva2VybmVsL3ZtbGludXgubGRzLlMNCj4gaW5kZXggZmUyMmQ5NDA0MTJmLi40
ZTU2ZmMwZWU0MmEgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9rZXJuZWwvdm1saW51eC5s
ZHMuUw0KPiArKysgYi9hcmNoL3Bvd2VycGMva2VybmVsL3ZtbGludXgubGRzLlMNCj4gQEAgLTMy
LDYgKzMyLDEwIEBADQo+ICAgDQo+ICAgI2RlZmluZSBTVFJJQ1RfQUxJR05fU0laRQkoMSA8PCBD
T05GSUdfREFUQV9TSElGVCkNCj4gICANCj4gKyNpZiBTVFJJQ1RfQUxJR05fU0laRSA8IFBBR0Vf
U0laRQ0KPiArI2Vycm9yICJDT05GSUdfREFUQV9TSElGVCBtdXN0IGJlID49IFBBR0VfU0laRSIN
Cg0Kcy9QQUdFX1NJWkUvUEFHRV9TSElGVA0KDQo+ICsjZW5kaWYNCj4gKw0KPiAgIEVOVFJZKF9z
dGV4dCkNCj4gICANCj4gICBQSERSUyB7DQo+IEBAIC0yMTUsNyArMjE5LDYgQEAgU0VDVElPTlMN
Cj4gICAgKi8NCj4gICAJLiA9IEFMSUdOKFNUUklDVF9BTElHTl9TSVpFKTsNCj4gICAJX19pbml0
X2JlZ2luID0gLjsNCj4gLQkuID0gQUxJR04oUEFHRV9TSVpFKTsNCj4gICAJLmluaXQudGV4dCA6
IEFUKEFERFIoLmluaXQudGV4dCkgLSBMT0FEX09GRlNFVCkgew0KPiAgIAkJX3Npbml0dGV4dCA9
IC47DQo+ICAgCQlJTklUX1RFWFQ=
