Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7AC985B680
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Feb 2024 10:03:04 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=jwvlKsNs;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TfD2Z60bTz3dTt
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Feb 2024 20:03:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=jwvlKsNs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:261c::700; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20700.outbound.protection.outlook.com [IPv6:2a01:111:f403:261c::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TfD1s1lM8z3cB0
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Feb 2024 20:02:24 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A5fayIoMEgL1Z9iimcpZ4qdGZcvRBdFDwsVLcu67CDRkB5Qxt7pMe3aHlsjnwv6Sw03I5KN6Q398zZ3MIRlYN24nTcL2jPh56QXkKD4iTIIXnWFKy7ipK+b+TKkXEus6bZCsjN4zs6QUcy6cbnc9qqp4nvucAW0TZDU3pCoh3VCmahg/sjfoQzgmrGrlCUoucreTz+TNiMuU6Jc/puoowjgoLVHbb2rbU/TCXr4EXpxeor3LpHDCUoVmoBtwSOpfVVy5XkGRI/hUmsstL/gFPaLEnS2OJgNw6JS9+E3NhfFlaf73P4qshk0W8rlugE8HatuMda8vYG8LjIybcvczFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uu++52cts8NMNgUucE0wPJ4q6rv4jYjqnsRV/rrvm0M=;
 b=jxH2Jwx+sKOMgF5qA8KNNZTNDfSwXOPTQHzvZpu7LpTko2jwvmtE88QpFcw/tDdziPxCTAQkTm+1QrtNFQhpfE1BLA3hVQeoM57GOW3e0bJljBvMYALA36ZIyzppFNcz601jooXy4T5Vw7CJrUzFwye00rPEal3mkNMC50BX3a5ViJG6CO23tPJ1g9JiX7zTlXmhcplslTuRFFD5efjP6CIQq9YTp7Uwwr0ueQtlpPr/N2TRsg+9OqVSiuiyTTQlFhSr/EdQKCNkxNhOy757gxrKs4p1R6EWrfUoq/pTLsF8+iwL37dT8btQ3H54n6L1bU+7S0BsjF6ehUx/AcxAjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uu++52cts8NMNgUucE0wPJ4q6rv4jYjqnsRV/rrvm0M=;
 b=jwvlKsNsKK+OkCey9OQn8qiQbEOnayoFFdlcoZFZ13uEw+Cdf+qlbRHnz7Dy0ibOvrdp6tucfIDyqUzwAo1BgDKlFv1M6oNungxD6DTuPobC4ehLWAe2NbscvcqLx0Le7xs39p2a2mNPIVFSmtChrgGLB1fMzP6xh+LkgWGif9KK02saHVqtFh+oJhH5FS47U13BV2mz+o5SzTwSyK+FofkovUIe6aSkwKRMaMrDkrWFVBCttZLgG/jEhhHXOID9LIIomK3TDH3gblBodXif10dai2UtmSn7Vk+AoIUjsJCX7NlkeTDVhCKykhVwSWok1NH8tmtw5GRd6BXQrSfy7Q==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2519.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1e2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Tue, 20 Feb
 2024 09:02:02 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::64a9:9a73:652c:1589]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::64a9:9a73:652c:1589%7]) with mapi id 15.20.7292.036; Tue, 20 Feb 2024
 09:02:02 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Aneesh Kumar K.V
	<aneesh.kumar@kernel.org>, Luming Yu <luming.yu@shingroup.cn>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"npiggin@gmail.com" <npiggin@gmail.com>
Subject: Re: [PATCH v1 2/2] powerpc/debug: hook to user return notifier
 infrastructure
Thread-Topic: [PATCH v1 2/2] powerpc/debug: hook to user return notifier
 infrastructure
Thread-Index: AQHaMWA8BiP7gdISFEqfwH/9reLJhrCuxVyAgAFidoCAYylJgIAAAxKA
Date: Tue, 20 Feb 2024 09:02:02 +0000
Message-ID: <0638f0a2-782b-411f-9937-c62d99e9562b@csgroup.eu>
References: <B375A36C9C4D73FF+20231218031338.2084-1-luming.yu@shingroup.cn>
 <8734vzsw0q.fsf@kernel.org> <8734vyn1ky.fsf@mail.lhotse>
 <2acd6623-952b-4659-bc26-c632e94560a8@csgroup.eu>
In-Reply-To: <2acd6623-952b-4659-bc26-c632e94560a8@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB2519:EE_
x-ms-office365-filtering-correlation-id: 2c091d81-e98e-4b7a-4951-08dc31f29a74
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  RCNs87YRuZ95ixvflTqScytJiIaHjLACVraVeGuUvQ+7jgmEM+QXe59nQ+pXD8Gvo1SRcu61fJjLE2DBRQmS7csbuUcG405L1kGVBNCgCMdd11u49Gk5bOsp8qeZzqYkHAKHHn1HDQE5Gs61HBFu3A5R/u7b0w2U1fBstRTs7bvLK2e5prOK/tpMotL+8x5moOYqht6oIGgY/ZE3m4D26JXjVsaZt2C5MG2b2R47c+X5ggut9xGCsvbeP+Q9cMg23oABcDdYt58GErLGSXh6zCOYnTxm2SDrNH8JfDXf7932z9nTT3u8b9wAJv49LNdQi2nU6U3Axps9wv0NFBnTeKy8YCE+/jaIrJY6kkuyVFOVTGPr5wEXMca9RnE7dFcx0cxrg5nWDD3E8OrxU/Us9qc6f/0gYlghWZgKROdrfx7Cv+QmzglZokY/faqktjEi2oJDJ26/EXHmAXZMaHEx5T1ydIr15fJgXtFtFG2iCmRpBuHQYyUOqtrZmaeM2KxpAoOY+U/2bUFwxxD273Gh95WCX6XsRwP7cUFBcuvBMZuUfqy81LE1fDI9tGG2a0yJEe/2dLYdah3fj7rnJd5ZeUfBAVwS9viWKLoQnHwVdX0=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?aDJkaXB4MWtZZnI0T2JNWDZIRnEwcHR0MDRkdExua2tEQndWOUdac1RXTE9F?=
 =?utf-8?B?a0xHT1k1OFYzV3hJMG43YWxpamtEMWJTSU9XamdUWE51VWp3ajZESlZ5Y0ZC?=
 =?utf-8?B?NC9lb1RrVjUvZFFTcm9BM3JtbDVHWWdDOXdsakxPZGlvWFlxVE5SVEMxQ1Nn?=
 =?utf-8?B?OWhSeFhxS2dodlZXZkFQMk1yMU1pQXVDZThSNThodVJhRXp6ZURFM0ovdHNP?=
 =?utf-8?B?STh6TmV3cGFOVFh6bUd1ZndNeDB5U09BejJPdyt1VXpjWE9aUkwrRmNmMGYz?=
 =?utf-8?B?TW5hcDJRa3lZZ3FZQkt6ZFFWNUVqYjc3SkxkTmNmcm92WGE3M3ZGOXluQmp0?=
 =?utf-8?B?ZThIeU90RXYzNUttZ3dPb2l3REhTWU03czM5TTk4bEFtamRIWitpYjEzYVNH?=
 =?utf-8?B?Z0Q0N3NJVGVaZ3N4cTZSR3ErcFJXK08yejQrOUxFZEFJd285NzRHaDkvQjV2?=
 =?utf-8?B?cVJYRkt6VlpGTlBZdDNSTVpkRERkRGJ6NHpyRnY1QkU2cFAzTVh2VmdGMDhC?=
 =?utf-8?B?SnJKUFZFdUVWcGVzbUtZYkhKNHRnaFM0Ky9GUlpUZGtPZXlKRlJNOHo1TnJj?=
 =?utf-8?B?Q3UrOW1QeGlwaXEwMDIzNUlqbjBqS2RGN2NnS3kxRm40Q0VYM2dZdjhPN0FJ?=
 =?utf-8?B?L1c4eDFDTXhCc1hISFhaMjJIR3RFYWZGdDlyVDdFRmNMbHh2bWw5SkFiMXM1?=
 =?utf-8?B?YjFTbFNwUFg1d2xrTEoyUU1sMFJHdGxMck5DUUFwVWRWRkRLNllzbGNINlhS?=
 =?utf-8?B?d1YvR3ExcWpYMStZNjhUQUFVWnFwNDZoQ09BL1VPSG9tUnlFTk5FZ3ArRm5l?=
 =?utf-8?B?cG1nWUQ2MWNzSWxHR3NMck1vL1p5ZFdWVFhvQmtIQWlUaUs4WU0yczZYSW9N?=
 =?utf-8?B?QkZtVmZuSjNMK2tVWDRpL1UzdWp2MzhnNXNHcmV5OWpTamtYTEttZTMxNTZ6?=
 =?utf-8?B?NThsdzNWSUhPeHVKSDZocWQ3RWpxbGZoQ3QwNjE4SFpHR0dXYWo5dDFmLzhU?=
 =?utf-8?B?M2U0TTF5ak1YY1d0cUxxRFJ3M3FVYUhmWGdtc0hWKytNYnhFajd5ekNveE9Q?=
 =?utf-8?B?SHdWWjdnaFBscmtJcmt3TkFTUGJwVTJIOFozTGV2c0VNV21mcGhpUGVCR1Nv?=
 =?utf-8?B?YldBRWZXbXJqK1IzSU5VVnNIWDVjYldTUVZDRzNva1NuZW5zRTBER1J4bTRz?=
 =?utf-8?B?Tm4vbllqZmU1azlKK3I2NDljODU0Znk0bXd5M2tSR0VSQloyamNWVGhLWStZ?=
 =?utf-8?B?dnBPSi9ZTEM2RVQyblpnaG5oaG84bVpLdDZORWJ5d2JTclQrWkYwcjFTbDJa?=
 =?utf-8?B?ZG5FNkJxRDZweXVvWEEvSG5sUU5RS0VLQ1hWN1RjbzY2THVyV0s3MmZCTE00?=
 =?utf-8?B?Sk95QkhzK0l0SFpuZkhZc3h1OGdYYUlUU0Y5NnFOQkJqSWhGT0l5WWpRTzZH?=
 =?utf-8?B?OXJRMlB2WnJNczhHOWZDdUFoekZyUk1zUnY5WjdKZmNoSmtkVm5hUG1FWXRJ?=
 =?utf-8?B?VkNJNHJTN3VXaDk3NjZDNXEvQUIvWEhxK3VxWjYrby9KdldOMmFJdWdkR2hy?=
 =?utf-8?B?ZDlWRDZBamF6eW1vbTJCMjhFNkJBMzltYUVJVDd3ZGlKTVRJdWdhMmxydThD?=
 =?utf-8?B?K3l1QU5IZ0sxOXI5YmpoeWNxaWxvbGxHY1hBSWhrQnBwWVFnRDVkcy9Ibjd0?=
 =?utf-8?B?dzlkRGNaeVlHUFcvQWlhaVhGL2lVbjZ2d09OYWY1YzNhNTZSR0drVnRoUHNK?=
 =?utf-8?B?VzFBcDFzcGxEbHdlZkdSR3RVQ3E5aXphYk1QSkQ4Y0NMZHVIMndoQk1tNWVl?=
 =?utf-8?B?UkFlRUV5eGhHV1g4T2I2bUY5MGFrRWNvTng1cEp4M0xNWndaTmhzTW9aWDNN?=
 =?utf-8?B?MzVKcS8yaDU0bzJuQSswSGtaZWVoUGJkRG9KWERYdzJ4WVNkWW9uajNoZTB4?=
 =?utf-8?B?SXJEWE83QTI0NXA1L1BOdUdxOVU3YTlLaGtGTW5tMDcyVXRMdWh6dTArYkdN?=
 =?utf-8?B?MjZ4YjBndFNnYTliSElyWGM4M1VFREFqR2J1QTZiRXQvL2lqQUMrZkZmcHFw?=
 =?utf-8?B?bzFrWmJQa3BYSVUxNlg2b25uUlJLQ3RBcHBXR1RUZm5LRkR6cjlOY2FYMzVh?=
 =?utf-8?Q?TM4H10TfM0fyNpWAUD5qYKxL/?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8EFDC99635108449BE63643802B20C28@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c091d81-e98e-4b7a-4951-08dc31f29a74
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2024 09:02:02.2889
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MgPuC99U8M6p1Jc9A6pSCMXzjouEzHXb+yC0YlVAAEDj5onqwib8jCW6f//1ymWlUDtksvfczV2jDYOfGuAhP1OFWvtwJMTHqS8ZqSKcVM4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2519
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
Cc: "shenghui.qu@shingroup.cn" <shenghui.qu@shingroup.cn>, "dawei.li@shingroup.cn" <dawei.li@shingroup.cn>, "luming.yu@gmail.com" <luming.yu@gmail.com>, "ke.zhao@shingroup.cn" <ke.zhao@shingroup.cn>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDIwLzAyLzIwMjQgw6AgMDk6NTEsIENocmlzdG9waGUgTGVyb3kgYSDDqWNyaXTCoDoN
Cj4gDQo+IA0KPiBMZSAxOS8xMi8yMDIzIMOgIDA3OjMzLCBNaWNoYWVsIEVsbGVybWFuIGEgw6lj
cml0wqA6DQo+PiBBbmVlc2ggS3VtYXIgSy5WIDxhbmVlc2gua3VtYXJAa2VybmVsLm9yZz4gd3Jp
dGVzOg0KPj4+IEx1bWluZyBZdSA8bHVtaW5nLnl1QHNoaW5ncm91cC5jbj4gd3JpdGVzOg0KPj4+
DQo+Pj4+IEJlZm9yZSB3ZSBoYXZlIHBvd2VycGMgdG8gdXNlIHRoZSBnZW5lcmljIGVudHJ5IGlu
ZnJhc3RydWN0dXJlLA0KPj4+PiB0aGUgY2FsbCB0byBmaXJlIHVzZXIgcmV0dXJuIG5vdGlmaWVy
IGlzIG1hZGUgdGVtcG9yYXJpbHkgaW4gcG93ZXJwYw0KPj4+PiBlbnRyeSBjb2RlLg0KPj4+Pg0K
Pj4+DQo+Pj4gSXQgaXMgc3RpbGwgbm90IGNsZWFyIHdoYXQgd2lsbCBiZSByZWdpc3RlcmVkIGFz
IHVzZXIgcmV0dXJuIG5vdGlmaWVyLg0KPj4+IENhbiB5b3Ugc3VtbWFyaXplIHRoYXQgaGVyZT8N
Cj4+DQo+PiBmaXJlX3VzZXJfcmV0dXJuX25vdGlmaWVycygpIGlzIGRlZmluZWQgaW4ga2VybmVs
L3VzZXItcmV0dXJuLW5vdGlmaWVyLmMNCj4+DQo+PiBUaGF0J3MgYnVpbHQgd2hlbiBDT05GSUdf
VVNFUl9SRVRVUk5fTk9USUZJRVI9eS4NCj4+DQo+PiBUaGF0IGlzIG5vdCB1c2VyIHNlbGVjdGFi
bGUsIGl0J3Mgb25seSBlbmFibGVkIGJ5Og0KPj4NCj4+IGFyY2gveDg2L2t2bS9LY29uZmlnOiAg
ICAgICAgc2VsZWN0IFVTRVJfUkVUVVJOX05PVElGSUVSDQo+Pg0KPj4gU28gaXQgbG9va3MgdG8g
bWUgbGlrZSAoY3VycmVudGx5KSBpdCdzIGFsd2F5cyBhIG5vcCBhbmQgZG9lcyBub3RoaW5nLg0K
Pj4NCj4+IFdoaWNoIG1ha2VzIG1lIHdvbmRlciB3aGF0IHRoZSBwb2ludCBvZiB3aXJpbmcgdGhp
cyBmZWF0dXJlIHVwIGlzIDopDQo+PiBNYXliZSBpdCdzIG5lZWRlZCBmb3Igc29tZSBvdGhlciBm
ZWF0dXJlIEkgZG9uJ3Qga25vdyBhYm91dD8NCj4+DQo+PiBBcmd1YWJseSB3ZSBjb3VsZCBqdXN0
IGVuYWJsZSBpdCBiZWNhdXNlIHdlIGNhbiwgYW5kIGl0IGN1cnJlbnRseSBkb2VzDQo+PiBub3Ro
aW5nIHNvIGl0J3MgdW5saWtlbHkgdG8gYnJlYWsgYW55dGhpbmcuIEJ1dCB0aGF0IGFsc28gbWFr
ZXMgaXQNCj4+IGltcG9zc2libGUgdG8gdGVzdCB0aGUgaW1wbGVtZW50YXRpb24gaXMgY29ycmVj
dCwgYW5kIHJ1bnMgdGhlIHJpc2sgdGhhdA0KPj4gb25lIGRheSBpbiB0aGUgZnV0dXJlIHdoZW4g
aXQgZG9lcyBnZXQgZW5hYmxlZCBvbmx5IHRoZW4gZG8gd2UgZGlzY292ZXINCj4+IGl0IGRvZXNu
J3Qgd29yay4NCj4gDQo+IE9wZW5lZCBhbiAiaXNzdWUiIGZvciB0aGUgZGF5IHdlIG5lZWQgaXQ6
DQo+IGh0dHBzOi8vZ2l0aHViLmNvbS9LU1BQL2xpbnV4L2lzc3Vlcy8zNDgNCg0KQ29ycmVjdCBv
bmUgaXMgaHR0cHM6Ly9naXRodWIuY29tL2xpbnV4cHBjL2lzc3Vlcy9pc3N1ZXMvNDc3DQo=
