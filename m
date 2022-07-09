Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A0F56C82E
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Jul 2022 10:52:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lg3nJ3kSJz3cDT
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Jul 2022 18:52:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=T8nlf2qo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.44; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=T8nlf2qo;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120044.outbound.protection.outlook.com [40.107.12.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lg3mR5lwJz3bd5
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Jul 2022 18:51:49 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ImZ+KpbmVF5wOXGhv5pZV13REmmldrGMkOej6OKpSh3pKvFZEHZO920824hUssiA3CNJiRx0SUuCC89RQZgTh7ZeJbtHj//Wk4ApEtT2X9VmHcFxYoM54lzLThG0O2inic+JK5QuBDn8dFwwMUb/kfN1RaUFlAcPRT1nz4iAE4K4rnztgPZAwxX9hlvOCSMSabbCAL2wVhw6Tzf9mrvbi2K022358wDVvAvcFBBLgvI9oSFI+A/xG5ZHgBZBln8iKxweDI/tm1PHmtBbYYlC9ZrR06D01xerfwboFtQsU+He4K7mvsikliB0pqnNyIcGLSi79EO4eBELUpl3yJHkig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yf7n20u48XQsCdmWwNihwlZhJZuD5VcPibZQ6rstxUI=;
 b=AgJoND5WxJODckcw6WY26Y9zfzi98QhMDzZ4hbbrbk956SeHt5x2Ej3YQ58p0Vzg6MWuCwI2tckASfJHw7rWAg/iN5J9p3Vvzk2ZRcDzyFcOcdJ+UY+mXpVzZaLgOd+vzN2xyNa/EE9w+rncrt7C3nVYtQ/QgqFpKsOoKvxl+6JzwMQUNfL0orgpUEcpqXEY1Fsft+FHikusXc0kyp1e0+fJtUWqKSELMP1WBcBuyB7gZrjg8cQNP8lh6rrlRwoIoM1VDOlnYJT7hKPwiSoeru3VPdYkE42Kk00NrrfuZ+JpYZaE6QXHqqQT1cq9C593SYWJJQ7jmaV9pSrx8+po+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yf7n20u48XQsCdmWwNihwlZhJZuD5VcPibZQ6rstxUI=;
 b=T8nlf2qoSxJVIOPhXYqJfLN7v3gs1Pxx5qmgiAawGF01Q39+18K/gtLfaq4Ctz+qx78DpEmujONqUOwPviQ2Nh6S+XHxTSPkEB5B0d/x4Fty51HQDCogVFxPNy+Oyia631XJlP5OtFv+YnPr9Q1Og+bvMHdPpmIdNybIkk94htmgqo128aVOvqpr33wGdfLAlu6YCf5TBPTMxFDz6M9QRM3sxAxseO0yoWvRnVUN1mNvWUKNq/9MsqNQkWbXHP6mQWRXyCzB1sJXcS4VdEIRuvrf0O4a2HRvNb77g9YdhzmEGGJJUG9PhCH2M7IAcwytyMft5jIvJmTzvg+IgU1A6Q==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB1831.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.21; Sat, 9 Jul
 2022 08:51:30 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624%6]) with mapi id 15.20.5417.023; Sat, 9 Jul 2022
 08:51:30 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Arnd Bergmann <arnd@arndb.de>, =?utf-8?B?UGFsaSBSb2jDoXI=?=
	<pali@kernel.org>
Subject: Re: [PATCH] powerpc: e500: Fix compilation with gcc e500 compiler
Thread-Topic: [PATCH] powerpc: e500: Fix compilation with gcc e500 compiler
Thread-Index:  AQHYb1JWsYyBCWIvdkmnZDAus5gR661rEeSAgAMvrICAAASSgIAAGGYAgAaen4CAAC/3AIAA1mQA
Date: Sat, 9 Jul 2022 08:51:30 +0000
Message-ID: <42088d9c-7246-3432-4aff-6cfda88e66ab@csgroup.eu>
References: <20220524093939.30927-1-pali@kernel.org>
 <20220702094405.tp7eo4df7fjvn2ng@pali>
 <8D562851-304F-4153-9194-426CC22B7FF2@ellerman.id.au>
 <20220704103951.nm4m4kpgnus3ucqo@pali>
 <CAK8P3a2tdny8SA7jcqhUZT13iq1mYqjFueC-gnTUZA1JKCtfgg@mail.gmail.com>
 <20220708171227.74nbcgsk63y4bdna@pali>
 <CAK8P3a3YMqGEjRr+ZD4Enm4pnuNNZOaeXqpY=PDXAP7w3P7y4A@mail.gmail.com>
In-Reply-To:  <CAK8P3a3YMqGEjRr+ZD4Enm4pnuNNZOaeXqpY=PDXAP7w3P7y4A@mail.gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0de91c69-efdf-447e-946a-08da618837a8
x-ms-traffictypediagnostic: MRZP264MB1831:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  iDbolypFmm42nxiJvQRKTNFX6cUiu/BeVBAl9Gxbgbcd4/ioQOhhw4y7aI8dY019qmMynrCwWQxlcSOYuGqYRjmOIALdLa6HJU+BoUCmdaQ1A6/LthnAJb9DrrtASRgOr3QY6tFO0IBMzTx97io/Kfp0kz/CuMHIuLnS+XjckiTFAMVOtNtNiDBzVdr0ajccP/8TbQWT1xCBZZuygMCtuKjdo5SWjshx1bNmTonNP/Oh7klEABgH9oN5HHSrWaSQfhJgafXHwHCR90G4wdlCBvhZZLCXXyBRuJql1F+LDMczh3QsVtCjOpoG/NhGKSH3Bgb4VokgxO5atCsH0RR3BGYEpkpHZ5e90BfTCytr8MkEXBF3UmUjl5JzTyiWK3vkkOKisjomSig2k73rTcqtxHJFvKSiTVBZDDz4gh8J4ALHwq6RxvvaawuaGyp7jvDJGO4T/UhKscz7XWGFOWtvQ4RtA6JrT6LwVB61rctzo0KalVKMSBYxl+gXbtzajaJteVaPlWfWJpMBoBGutc90/pHXdhz1Zzpz5UsMnK598npuL92Rnh0ExwRAz81bx+PxcAyr0jQsxxHjdVWbn6YBMYtcx+IGux3Rzbrl79bMkNXoZurzUI2kv5BVPzkZXTq+zuj8ibG6tsyMDVTSA/ab/vmZBGP9sXqBEiEu5RNZP5lta5dkVoA4/QMLlRoN3FQdHPZDC8UdI+iRA+GfB63Ff7OzoWFcULLLZKRzpzyFAtvfJvX2sW4myuivi6oPd3o6aEuicSAW+/WixIecqti0Ls/G0SQA8vDxop5qV2csa0sk2kk5MyjghWkV22CkftX2BkTcEQG5kwUrVlQi55EX7mYvL/OJGWJBpMUjcysOrEQ1ZNThGuwaucXQ+P4USbd0
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(396003)(39850400004)(136003)(376002)(366004)(38070700005)(2616005)(31696002)(8936002)(6486002)(38100700002)(478600001)(122000001)(71200400001)(86362001)(186003)(91956017)(6506007)(53546011)(66946007)(76116006)(64756008)(66446008)(66476007)(66556008)(8676002)(44832011)(54906003)(31686004)(6512007)(26005)(83380400001)(316002)(110136005)(4326008)(2906002)(5660300002)(36756003)(66574015)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?Y242NnJNUTdkSkNVK0xydStodmgzNVBHYi9vSnVqU0RjMlRwVzZROGVWdkJZ?=
 =?utf-8?B?dk5zWVZrR0xGNktHRjdwSmlvdy91Z0s1ZEg3UGVHOUxENWhtUUZZS2wxRmZj?=
 =?utf-8?B?a3RVVm1WR09OQWUyUEhDaEU2YnQwMFRMditIOForUWNnT0RKSXIvWFR4TWhj?=
 =?utf-8?B?bUFUUCtQd1VRUWQ2ZTJ2SDlPM2JSZ3JET3VRUWxWTVZRL1M5eGRPa0orbmxF?=
 =?utf-8?B?RVdnRkZDR1FrYnhsL1cra3NZZ2ZWWHpZNUtPV2RYUFBpN3RaMUlmVmlOdG82?=
 =?utf-8?B?aHNBRVVoRk90R0FKTG1tTVRuS2cwTjR2MnRwRWdhMlZMdUh0VTVodXNIdDZj?=
 =?utf-8?B?aURDQ2NaeFRuRzZoL0hKd1E0bmpldmJzTVpkQlIwL240VDdpZS9GeTFNa0Yw?=
 =?utf-8?B?WUJMSmpqclhKZVdFRTNodE1rUWsrVzhXM0Z0TE1jNGM4SkZoVUg5MEd0OUtV?=
 =?utf-8?B?bEo0YXBjRmgvUWE2VldtYUVBaEJMQkx4YkV2VWFtNVhWa2pBRWJpaXVoU0I3?=
 =?utf-8?B?T2dUUjNvVWRaMkNpVCt4UUpOUGtnWHBuRlJkMm1uUDUvbW5pM2RUU1ltcUh1?=
 =?utf-8?B?ZENKejhOa1BCaEpXK1hrc3ZmbXpTYzY5cVVtaDl5RmRlekNna0poZ2EzZnNN?=
 =?utf-8?B?V2hFcUEwNTVrR2txWUc0d0NVK1BycnhxMk9oc3BHQTR1R1RMRWNBQit3aVZ1?=
 =?utf-8?B?YitrbGpWVmZyODd5MWVJU2lRMko1QVFiOXY4ZVMvYjJUcE9pY2xwM2FIWlY4?=
 =?utf-8?B?cTIrT3pLYmVTaHFqZHJ4Mi9iMHN0c0ZFOHdZZ0JSbXdQc000dkE2VlRHVGZ6?=
 =?utf-8?B?RzBJdHoyNndMT2c5Z2VNSG9MN2JPYUh3ODdmNHFJODRYcm44SDFTaHdsUStn?=
 =?utf-8?B?RXh1bUd1ZkJ4NDYxNElQYmxZTG9JY1N6VUNSTUZUR1RNamtVRDJuN3hMYk1B?=
 =?utf-8?B?MkVlVktSRUlycjhaU1k1TnRwRG5BK2k5VFRmbnd4bGxhY09rM3pxc1JxS0tt?=
 =?utf-8?B?VHprcERWdi9vUGRUMGxXWjBGQUFvQUdOWDA5NVAzWXZYcUVjWXJRNkdmdWZ0?=
 =?utf-8?B?NndxTFQreGswYjJqaVJuYmUyT1MvQk8wVWVKZHhsQktVK1RGT2xidTlhN0dy?=
 =?utf-8?B?dVRzcXo5WjhPWEV3TGtCM1lvUW9ONjRPdklVVG5xNGI3Ry9xSzgrM2oxRDJB?=
 =?utf-8?B?US9rZGF3aUNhWUE4eS90Umt6ZWFseTYvY3FGdmZkUHo4T1p5aDc1bnJ6azEv?=
 =?utf-8?B?TldzdlhVL0tCM3ZBTktQZitqWHh1WmJrT1dzdEZnVnJmQlVhcCsveEVPNEZL?=
 =?utf-8?B?aWlvOFNHbU1oei9JaEVVTXppV1FTRFlqOVZ5dnhKWHBnNDRINEJxbHhScitw?=
 =?utf-8?B?NTZXQjk4Q1lNMGx1QnFtdzZra3NUaE9OcHZLeUVPTmM5RmZxcFNMU1ZMdlVv?=
 =?utf-8?B?MFVQSlJqQ05vdkQ2N25HZ2hFeWFWMHkwQWRxZFZVTkVYb1lPYmdSc3VCTWpU?=
 =?utf-8?B?ZUpDZ0RBUTI2QWtkM08rUUFKendtOXpsMGxoMW0vRE9zRm04clRPamJDRmtG?=
 =?utf-8?B?Z1hGQzJFbDkzcGZlZVZ3Q1pWVExtenlPUWlUMUlUcTNKaENRQjQvYVEycllT?=
 =?utf-8?B?bm15RS9raVR3Y0Yrak9GcFVVM3pPSnp6cmM4TDJXRloyTnZHblBvY2xHbkVF?=
 =?utf-8?B?YWtHa0Viay85b01WOW1rcEZ1SjZzSTcyMHBVdnlLUTZkSmFLbktzcVVBNklv?=
 =?utf-8?B?OWFGVzMvYWpad1J6eiswcm5MNkEwRnkxTkQ2NDJDMzg3S2xhYXM1aFFkMUc4?=
 =?utf-8?B?M1E0Wi9UZldKOUh6b2g3TG9kSjByS29zbEFmZGxRN1ByZ3BRV1d1WGpQQ3NF?=
 =?utf-8?B?ck9BdVZvZEFtdWh1K200blhhelBRK1RKNnBOTkZndU01QVR2VWF4YkgzaEsr?=
 =?utf-8?B?V2RvNWhndVp2bCtlaDhTY3lCV1RvYmJrZk0xQWE1aEs4dnFadm5oWnl4QWU2?=
 =?utf-8?B?dWdjcFFEY3VvTU1iUEx3dk5mN0xHMXJ3UXhKaC9TdXQ5Tk5TVHd0c05ic2cz?=
 =?utf-8?B?bStib1Z3a3piSW1pVWZiclpzOFpNVmt5SDdoNG9RSWpHeFRDZjgzYnlnbitD?=
 =?utf-8?B?NllMcjNNU0c5N0RFTS9OcFRKZXpuMG1mZUZOKzAvcWQzdG9PQmk1YmFYTjdj?=
 =?utf-8?Q?nzSM84ZBcxpK6+nVDaPGzE0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B21DB36F27C4DA4EB824B4AB55C36D9B@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0de91c69-efdf-447e-946a-08da618837a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2022 08:51:30.3276
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UZiUFf6IlnE3yMgnr9PutQfeAt3yY/4CXvZe1mE3IbWyuStoZWqURyenzM8BAi1AAMN0J2AOQdcIJGL/eWfOFL7Pbe+mjJDF01CDFTOE4+U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB1831
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
Cc: Michael Ellerman <michael@ellerman.id.au>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA4LzA3LzIwMjIgw6AgMjI6MDQsIEFybmQgQmVyZ21hbm4gYSDDqWNyaXTCoDoNCj4g
T24gRnJpLCBKdWwgOCwgMjAyMiBhdCA3OjEyIFBNIFBhbGkgUm9ow6FyIDxwYWxpQGtlcm5lbC5v
cmc+IHdyb3RlOg0KPj4NCj4+IE9uIE1vbmRheSAwNCBKdWx5IDIwMjIgMTQ6MDc6MTAgQXJuZCBC
ZXJnbWFubiB3cm90ZToNCj4+PiBBbm90aGVyIHByb2JsZW0gSSBzZWUgaXMgdGhhdCBhIGtlcm5l
bCB0aGF0IGlzIGJ1aWx0IGZvciBib3RoIEU1MDAgYW5kIEU1MDBNQw0KPj4+IHVzZXMgLW1jcHU9
ZTUwMG1jIGFuZCBtYXkgbm90IGFjdHVhbGx5IHdvcmsgb24gdGhlIG9sZGVyIG9uZXMgZWl0aGVy
DQo+Pj4gKGV2ZW4gd2l0aCB5b3VyIHBhdGNoKS4NCj4+DQo+PiBTdWNoIGNvbmZpZ3VyYXRpb24g
aXMgbm90IHN1cHBvcnRlZCwgc2VlIGFyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvS2NvbmZpZy5jcHV0
eXBlOg0KPj4NCj4+IGNvbmZpZyBQUENfRTUwME1DDQo+PiAgICAgICAgICBib29sICJlNTAwbWMg
U3VwcG9ydCINCj4+ICAgICAgICAgIHNlbGVjdCBQUENfRlBVDQo+PiAgICAgICAgICBzZWxlY3Qg
Q09NTU9OX0NMSw0KPj4gICAgICAgICAgZGVwZW5kcyBvbiBFNTAwDQo+PiAgICAgICAgICBoZWxw
DQo+PiAgICAgICAgICAgIFRoaXMgbXVzdCBiZSBlbmFibGVkIGZvciBydW5uaW5nIG9uIGU1MDBt
YyAoYW5kIGRlcml2YXRpdmVzDQo+PiAgICAgICAgICAgIHN1Y2ggYXMgZTU1MDAvZTY1MDApLCBh
bmQgbXVzdCBiZSBkaXNhYmxlZCBmb3IgcnVubmluZyBvbg0KPj4gICAgICAgICAgICBlNTAwdjEg
b3IgZTUwMHYyLg0KPj4NCj4+IEJhc2VkIG9uIHRoaXMgb3B0aW9uIHlvdSBjYW4gZW5hYmxlIGVp
dGhlciBzdXBwb3J0IGZvciBlNTAwdjEvZTUwMHYyIG9yDQo+PiBmb3IgZTUwMG1jLiBCdXQgbm90
IGJvdGguDQo+IA0KPiBUaGlzIGxvb2tzIGxpa2UgYSBiYWQgZGVjaXNpb24gaW4gS2NvbmZpZyB0
aG91Z2gsIGFzIHRoZXJlIGlzIG5vdGhpbmcNCj4gZW5mb3JjaW5nIHRoZSBydWxlOiBJZiB5b3Ug
d2FudCBzdXBwb3J0IGZvciBFNTAwTUMsIHlvdSBoYXZlIHRvIHNlbGVjdA0KPiBQUENfODV4eCwg
d2hpY2ggaW1wbGllcyBFNTAwIGFuZCBhbGxvd3Mgc2VsZWN0aW5nIGFueSBjb21iaW5hdGlvbg0K
PiBvZiBFNTAwdjEsIEU1MDB2MiBhbmQgRTUwME1DIGJhc2VkIG1hY2hpbmVzLCBidXQgZW5hYmxp
bmcNCj4gYW55IEU1MDBNQyBiYXNlZCBvbmUgYnJlYWtzIGFsbCB0aGUgb3RoZXJzLg0KPiANCj4g
SWYgdGhpcyBpcyBhIGhhcmQgZGVwZW5kZW5jeSwgSSB0aGluayBpdCBzaG91bGQgYmUgZW5mb3Jj
ZWQgYnkgbWFraW5nDQo+IEU1MDBNQyBhIHNlcGFyYXRlIHRvcC1sZXZlbCBvcHRpb24gaW4gdGhl
ICJQcm9jZXNzb3IgVHlwZSIgY2hvaWNlDQo+IHN0YXRlbWVudC4gSG93ZXZlciwgaWYgdGhleSBj
YW4gYWN0dWFsbHkgY29leGlzdCwgdGhlIGhlbHAgdGV4dCBhbmQNCj4gdGhlIE1ha2VmaWxlIG5l
ZWQgdG8gYmUgZml4ZWQuDQo+IA0KDQpJbiBjcHV0YWJsZS5jIHlvdSBoYXZlIGVudHJpZXMgaW4g
dGhlIGNwdV9zcGVjcyB0YWJsZS4gSXQgc2hvdyB0aGF0IHdoZW4gDQpzZWxlY3RpbmcgUFBDMzIg
YW5kIEU1MDBNQywgeW91IGV4Y2x1ZGUgZTUwMCBhbmQgZTUwMHYyLCBhbGx0aG91Z2ggeW91IA0K
dGhlbiBmYWxsYmFjayBvbiB0aGUgZ2VuZXJpYyBlNTAwIHByb2JhYmx5IGJ5IG1pc3Rha2UuDQoN
ClNlZW1zIHRvIGNvbWUgZnJvbSBjb21taXQgMzQ3N2U3MWQ1MzE5ICgicG93ZXJwYy9ib29rZTog
UmVzdHJpY3QgU1BFIA0KZXhjZXB0aW9uIGhhbmRsZXJzIHRvIGUyMDAvZTUwMCBjb3JlcyIpLCBi
ZWZvcmUgdGhhdCB3ZSBoYWQgYm90aCBlNTAwIA0KYW5kIGU1MDBtYyBpbiB0aGUgdGFibGUgYXQg
dGhlIHNhbWUgdGltZS4NCg0KQnV0IHdoZW4gZTUwMG1jIHdhcyBpbnRyb2R1Y2VkIGJ5IGNvbW1p
dCAzZGZhODc3MzY3NGUgKCJwb3dlcnBjL2Jvb2tlOiANCkFkZCBzdXBwb3J0IGZvciBuZXcgZTUw
MG1jIGNvcmUiKSwgaXQgd2FzIGFscmVhZHkgY2xlYXIgdGhhdCBpdCB3YXMgbm90IA0KY29tcGF0
aWJsZSB3aXRoIG90aGVyIGU1MDAsIGVzcGVjaWFsbHkgZHVlIHRvIHRoZSBzaXplIG9mIHRoZSBj
YWNoZWxpbmUsIA0Kd2hpY2ggaXMgaGFyZGNvZGVkIGF0IGJ1aWxkdGltZSBvbiBQUEMzMi4NCg0K
VGhlIGNvbW1lbnQgaW4gS2NvbmZpZy5jcHV0eXBlIHdhcyBhZGRlZCBteSBjb21taXQgOTY1MzAx
OGI2MTViIA0KKCJwb3dlcnBjL2U1MDA6IGFkZCBwYXJhdmlydCBRRU1VIHBsYXRmb3JtIikNCg0K
QW5kIGJ5IHRoZSB3YXksIHRvZGF5IHlvdSBhcmUgYWJsZSB0byBidWlsZCBhIGtlcm5lbCB3aXRo
IGFuIGVtcHR5IA0KY3B1X3NwZWNzW10gdGFibGUgaWYgeW91IHNlbGVjdCBDT05GSUdfUFBDX0JP
T0szRV82NCBhbmQgc2VsZWN0IG5laXRoZXIgDQpDT05GSUdfQ09SRU5FVF9HRU5FUklDIG5vciBD
T05GSUdfUFBDX1FFTVVfRTUwMA0KDQpzdGF0aWMgc3RydWN0IGNwdV9zcGVjIF9faW5pdGRhdGEg
Y3B1X3NwZWNzW10gPSB7DQojaWZkZWYgQ09ORklHX0U1MDANCiNpZmRlZiBDT05GSUdfUFBDMzIN
CiNpZm5kZWYgQ09ORklHX1BQQ19FNTAwTUMNCgl7CS8qIGU1MDAgKi8NCgkJLnB2cl9tYXNrCQk9
IDB4ZmZmZjAwMDAsDQoJCS5wdnJfdmFsdWUJCT0gMHg4MDIwMDAwMCwNCgkJLmNwdV9uYW1lCQk9
ICJlNTAwIiwNCgkJLmNwdV9mZWF0dXJlcwkJPSBDUFVfRlRSU19FNTAwLA0KCX0sDQoJewkvKiBl
NTAwdjIgKi8NCgkJLnB2cl9tYXNrCQk9IDB4ZmZmZjAwMDAsDQoJCS5wdnJfdmFsdWUJCT0gMHg4
MDIxMDAwMCwNCgkJLmNwdV9uYW1lCQk9ICJlNTAwdjIiLA0KCQkuY3B1X2ZlYXR1cmVzCQk9IENQ
VV9GVFJTX0U1MDBfMiwNCgl9LA0KI2Vsc2UNCgl7CS8qIGU1MDBtYyAqLw0KCQkucHZyX21hc2sJ
CT0gMHhmZmZmMDAwMCwNCgkJLnB2cl92YWx1ZQkJPSAweDgwMjMwMDAwLA0KCQkuY3B1X25hbWUJ
CT0gImU1MDBtYyIsDQoJCS5jcHVfZmVhdHVyZXMJCT0gQ1BVX0ZUUlNfRTUwME1DLA0KCX0sDQoj
ZW5kaWYgLyogQ09ORklHX1BQQ19FNTAwTUMgKi8NCiNlbmRpZiAvKiBDT05GSUdfUFBDMzIgKi8N
CiNpZmRlZiBDT05GSUdfUFBDX0U1MDBNQw0KCXsJLyogZTU1MDAgKi8NCgkJLnB2cl9tYXNrCQk9
IDB4ZmZmZjAwMDAsDQoJCS5wdnJfdmFsdWUJCT0gMHg4MDI0MDAwMCwNCgkJLmNwdV9uYW1lCQk9
ICJlNTUwMCIsDQoJCS5jcHVfZmVhdHVyZXMJCT0gQ1BVX0ZUUlNfRTU1MDAsDQoJfSwNCgl7CS8q
IGU2NTAwICovDQoJCS5wdnJfbWFzawkJPSAweGZmZmYwMDAwLA0KCQkucHZyX3ZhbHVlCQk9IDB4
ODA0MDAwMDAsDQoJCS5jcHVfbmFtZQkJPSAiZTY1MDAiLA0KCQkuY3B1X2ZlYXR1cmVzCQk9IENQ
VV9GVFJTX0U2NTAwLA0KCX0sDQojZW5kaWYgLyogQ09ORklHX1BQQ19FNTAwTUMgKi8NCiNpZmRl
ZiBDT05GSUdfUFBDMzINCgl7CS8qIGRlZmF1bHQgbWF0Y2ggKi8NCgkJLnB2cl9tYXNrCQk9IDB4
MDAwMDAwMDAsDQoJCS5wdnJfdmFsdWUJCT0gMHgwMDAwMDAwMCwNCgkJLmNwdV9uYW1lCQk9ICIo
Z2VuZXJpYyBFNTAwIFBQQykiLA0KCQkuY3B1X2ZlYXR1cmVzCQk9IENQVV9GVFJTX0U1MDAsDQoJ
fQ0KI2VuZGlmIC8qIENPTkZJR19QUEMzMiAqLw0K
