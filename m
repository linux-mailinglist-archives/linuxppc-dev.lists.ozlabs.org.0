Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0402C807B72
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Dec 2023 23:38:21 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=m+tJO8R8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SlskL3R3qz3cTt
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Dec 2023 09:38:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=m+tJO8R8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::617; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20617.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::617])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SlsjV1bdHz30fm
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Dec 2023 09:37:32 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LIogG91daGdOLCK1KJswdQCSfBgCyyCijQ0O1heej+wCI1WwGA7Ccj5oH1uHgjGB8Ko5O4IJw5DhSwEWKc28+VrPGdFDrnffG4a2LaGUVtKycpZm8QoizTNzNNcuKA0/ZZjNOiK8WLcFwViDvZD9PT2nhfOhtfSep1Tn+/0zWtWLenzuf5jY1QZNxyJ8NSx6CcQwE0Ru0ijBMPq+HDw6ck6/3WywcgU94/dbqjy7vaqB8GsaKBlC0lUJt6fJpD4O1WZrDX4ouOVVw8a+ItONPx0kGiNzuubTMqAjGKJWdvMgd9fqOlBKgwr2+zC833ipePrHhLTzfvKPAQ/7zkuTpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DEWXgPpd6uTN6DbRVMhsRVToCMM/WmoLaliNeI9OGBQ=;
 b=I+/G0dPc33yJKOfhAfU5WzXLJSn8sBZ11jj5tsdgEYzegM09R8lNf6YPWtWY/MY6aGZb71Nhd4qlTDSGi9eZtWP22T38zmywzsoe4JEo06VBQfbd0dTwRw7C7itslSAClqbSAyn9bf09noxXbpmvGdk9xYk16gqO2IRYNCFzabmidL/AwWqc1XDh1iFTIcj87bE0r39tWPfsNv6rBag01CUMNtMhqfRFNptSkFRokfe/qVcmpKsBDvoAD8jhFl2JfN6U3j9bAw38jnyinVa6Zp/kqUh6Cftn20rTpoawMw/gB8jgR7WS0uR4sNbQZfmbcrmqi1xpkf60w6+LaYXlqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DEWXgPpd6uTN6DbRVMhsRVToCMM/WmoLaliNeI9OGBQ=;
 b=m+tJO8R8tvGXKoyi3y4lg6chWTIZ2/FKCKW3GEaYwtGDrvr3otLjGt6X5hkKIz9TuqKs64AAOGLur413bbGykBQMDU1v30ufWNidV8DOB19+u8JXLq+kpjbrXAJiHbSPp0eivCzG+YzIpMrUneyZ8JKlaKXnlC4nAYk5TSZrHn7iBxt4s45dND+Zsutzqkbdi6/Fgz/IrA3AhDOx7YRTPnfuyPenh9SL4+HHTQaygeP/GrZDdNA06wUS/9ZUMPkK26CZ23fu/8RBN/uTJWJVKDo44AVYNaNWXyIljdeDixiuW+Pe0XRPSrAMDqzofQh2KGmkx2jKcTHqyowEfvr4Iw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2186.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:16f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.27; Wed, 6 Dec
 2023 22:37:12 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5bfe:e2f2:6d89:8d97]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5bfe:e2f2:6d89:8d97%3]) with mapi id 15.20.7068.026; Wed, 6 Dec 2023
 22:37:12 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: George Stark <gnstark@salutedevices.com>, Hans de Goede
	<hdegoede@redhat.com>, "pavel@ucw.cz" <pavel@ucw.cz>, "lee@kernel.org"
	<lee@kernel.org>, "vadimp@nvidia.com" <vadimp@nvidia.com>,
	"mpe@ellerman.id.au" <mpe@ellerman.id.au>, "npiggin@gmail.com"
	<npiggin@gmail.com>, "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
	"andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>, "jic23@kernel.org"
	<jic23@kernel.org>, "peterz@infradead.org" <peterz@infradead.org>, Waiman
 Long <longman@redhat.com>
Subject: Re: [PATCH v2 01/10] devm-helpers: introduce devm_mutex_init
Thread-Topic: [PATCH v2 01/10] devm-helpers: introduce devm_mutex_init
Thread-Index: AQHaJty3lcbSNrP0Vk6nW4+1IjDYxbCcXFOAgABCTACAADawAIAABniA
Date: Wed, 6 Dec 2023 22:37:11 +0000
Message-ID: <be693688-2e82-4e1a-9ead-cf1513ee637b@csgroup.eu>
References: <20231204180603.470421-1-gnstark@salutedevices.com>
 <20231204180603.470421-2-gnstark@salutedevices.com>
 <81798fe5-f89e-482f-b0d0-674ccbfc3666@redhat.com>
 <29584eb6-fa10-4ce0-9fa3-0c409a582445@salutedevices.com>
 <17a9fede-30e8-4cd5-ae02-fe34e11f5c20@csgroup.eu>
In-Reply-To: <17a9fede-30e8-4cd5-ae02-fe34e11f5c20@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB2186:EE_
x-ms-office365-filtering-correlation-id: 8f19e864-4da7-4d84-92d2-08dbf6abe364
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  LpX5+0YF18xi2EFmPruFUKqBw4fEZ1fqVEo/hZGJuzdS33xHGgYZ4rJKVyjHxZnloTrvZEFUNcB8qKGSMhUS2UUm2l8JalMX8EOGsZKDsbFox8wnNak2TjHekk7S/LbBZQNQ6bn60Lr7D3UKYsy+BF56weagv0ge6FSurbKDEK3l5mawYkcy4RaszECsXUJ8gcU/+nshArnUMXXD4g8sGKBxvxQ7jxMgKS0hWz65E58P/hEpmLrBnDbDOfhMyuEPF/g/VoFF0jNktIHSbg9UWJxev+D9a0Zc9zd1BZZOtKEzJajI0xWovEtrWOFKJFTBjdGwpPirQwyl4/j82VjuwFAmYHdZzVrCPeOubRmJ8BWO2n+5A+ybiIZK773nXgtCbracegJ3F4jPbmHTRaJ6vHBWoEmguACsT9ZUXBDW3YgOI4WNl8XJifNRbw7saM0NWrIH+j4OKNGxAQZGocb9/Y0gKGQyIDZA98WBG6PaEmyAKsIrzdMUeYUJKltYJbdG3rK7KX25SgNAMiPgRQa7LeEwdIrjo/005YqsilkOOCmfiKiJ+kr8mGgRBABAPn4O3JpC+iT1l8aEL3ZdAwVviAN+qzIYE1M34CI/MPO0E0M36waWQ786jVlMN7kClz9vE/prx1oAeboYNhVwnCsd6RG3kUB9TFvncb4Mqu2xbFMigOcmhdqhfyVG1CQGLJpGLUSCy5fGT12g/Hk3jMbVyQ==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(39860400002)(396003)(366004)(136003)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(316002)(66446008)(66556008)(64756008)(91956017)(76116006)(66476007)(66946007)(54906003)(110136005)(6506007)(53546011)(36756003)(6512007)(966005)(71200400001)(41300700001)(26005)(83380400001)(2616005)(6486002)(38070700009)(478600001)(921008)(86362001)(31696002)(122000001)(38100700002)(66574015)(44832011)(5660300002)(7416002)(31686004)(2906002)(8936002)(8676002)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?eW84NkZOckJzREZvRkpLbU1kNlZjYjVBRDFuc1I2eDVTQUlYclZLMWlIRVBm?=
 =?utf-8?B?WlFZVGQza0kvZDRVNW5TVW9GN1ovUWFERTVVeHZpWmE0ZUw5eHgrRUY5Q1cw?=
 =?utf-8?B?dGNSVnFiQ0VoOVZVdmkzZ1YvUnhPZC9jc2FBaWhMMzQrOGcvekdCUHZwbjlC?=
 =?utf-8?B?T1VGYTUxc0RqV0xIN1ZrQkRDbGcxSVNobDMyQi83RkNnYmp4Wnl5cG96djF6?=
 =?utf-8?B?WEpzWmhzUFBsU29zcmdhYk12dURaWlJjN3ZSTVdMdTVVYjU2bDlPa0ZCRkFo?=
 =?utf-8?B?elB0VHIxSGFoMXlOVUxOYzNYWkg3Y0hJcFphR0RaYlJYZDI2akQwVnRUZmtI?=
 =?utf-8?B?SWFPWVFOMzhOajRrM2c5Z1hBbk1CbksvUUI2TW40TjdQT0Q0VGJmdUZBbmQ3?=
 =?utf-8?B?am9NYlk2Z09YbUdQNHFyNnhmMGMyRUtWYWpyVU1CMFd1UG1jQXZRRnRzbXhn?=
 =?utf-8?B?UFFrSjExTVIvYkpGandtNitBTEV5bktmMzYwdzJzQ09zUkNONG5ZcXo3eFBX?=
 =?utf-8?B?UVBBek9RU2RYS3E0NDhib2cvVDNaL3V4QzBBZnJ5N1dKTWVFaEtyLzhuMkdL?=
 =?utf-8?B?RklMVDN3eC9EMm1rdFZENzdBNjljWURhTFBNa0VLMGJKbTd2V0NaaldoWFZX?=
 =?utf-8?B?aFZ2UFJ1ODY0aS9URThPZFpoMUxrYXZ4S0NsWko0b1c0YTdyd2FVaXBlVUFW?=
 =?utf-8?B?NHdPem84blljcStxREtNb1FCa1VNOXZFakczR085ZFNtcUdHci9WNm5ZOUVN?=
 =?utf-8?B?RUZ4b3Zlcnc3NURVU2JGUXd0aHllK2JSTnBWdnp4cld4UTV4NjY2TFRKTEYr?=
 =?utf-8?B?Q1ZWTDY5TklvVmNLV3I1K3NZa0p5Q1hlRkVhd1piZStiR2VRZVhENmJjQ3Bq?=
 =?utf-8?B?SGo4cDYrOFJiSjgzdFdyVm13SXoxUFRvcVJEdlo1V0FPd1VwamRzZnFuaDF3?=
 =?utf-8?B?d3lHbi9jTi9PazZBQjh5TzdsYVJCY1BQOEpRd0o0V0tzemo4aVhML2JRZzhJ?=
 =?utf-8?B?UVZld2NSNFI2SXlDVGJ1UjhzM1A3NC9uRFBLZnhrbksxbkFBVTZlY2RLL29i?=
 =?utf-8?B?RnFSVlBTTHhZOHpIVkt0dnRCVE1RK09SVHhCRHZuNHM0TVJjQUVTTnFxVzVN?=
 =?utf-8?B?UmZYWU5zRFA2U1JSdXAyek1yZFZrUjBzR3ZqakNiRVp0RDhDMVhLV1pMemVN?=
 =?utf-8?B?K3NqbUNaTlNremlDWTRUVGppUmtBZ0dudE9veVhKenV5WDhieFpRa3lUMVRz?=
 =?utf-8?B?WVBUc3JrNm9NUGVISGF2a2ZwbVlnNTVRaUpQOXUrOTQ3eTZpc0ZWZUoyZkN2?=
 =?utf-8?B?NjRBWVVSUWRTVlQ1UUo4dThZLyt5ejBvVmQ0bUd5TnBmaC9wQ1doQ1AzL3ly?=
 =?utf-8?B?Zkc4SmY2S1ZXV3habmJtK3NXSmJTdVora24xZ3pEZzJLMjFLd1R5YWc4M1VO?=
 =?utf-8?B?TERvdGlyMCt3SmVqVDc3R0o4ZVdZcFlWREw4UjN3RFV0N1AzZ21teTljSjls?=
 =?utf-8?B?dnNaakhHdFMxWFMycFVZWHowQjFka3JpOTlFSElLaUF5cm04YnRYSnpISUdM?=
 =?utf-8?B?clllWXVuMXpIUVlzdnEwUHZJRjkxeXZPR0hSRTBYSEY2ZVBHQjFWOUMvaUhG?=
 =?utf-8?B?SjRsaVlldVJPREx3ZFhnTjJrUk1lTnhCNUJXSldJZkRqUENqZ2xabVZVYmMx?=
 =?utf-8?B?bTNPN0NtSVQvSlJjWkZKMFI5L3dwd1dLcU4xazY4RTZnanBzUkdXSE02bWVy?=
 =?utf-8?B?ZmdqUW5QUDc1bXE2Y0ZNUEd6NTBmblI0UkNuYkZha01XeGlxOHhwSDBQYzl2?=
 =?utf-8?B?Z2dvQUFjQnRSNmE5MHFrdGYrSmEvUjZWMTFOakdiem9ZVzB1Q3A2UmFGdmgx?=
 =?utf-8?B?Q2laOUdzcFZXMC9FT0ZkT0ZnUUtHeWcvT1J1b0g4ejZ6WWxRSFVteFVVbWU4?=
 =?utf-8?B?c0haem4wb2dxcmp4VXc5L3ZlaDFsSU1rQVpuZDNscWpTM3RyQXZXclIyeS9k?=
 =?utf-8?B?TUd0b3ppdDNBOE1ZZXRtRzlhcHpPdUpuNm5Lck9TN0l2MTRoaU0wWEdMaGhj?=
 =?utf-8?B?UHRja1JZanpid0x0ZEx6ejRaa2hVKzdTVkU2RkJJVjQxSDYyTmFvQlVxcTNj?=
 =?utf-8?Q?EEcS2d1q0mf1/O2kHojPMDtS9?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <232627A4D1036D48B5FFC21658A93919@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f19e864-4da7-4d84-92d2-08dbf6abe364
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2023 22:37:11.7767
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C4IH5rPX1LSGGY8xF78KsaERCv30gwc8oceAvKhyNDj1ybFRezRs2mE3BdRhkxVVv+c4X9ikCT+hwOO6XIL5mBfGXwI0w86Zuoj/SDiAgS0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2186
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
Cc: "kernel@salutedevices.com" <kernel@salutedevices.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA2LzEyLzIwMjMgw6AgMjM6MTQsIENocmlzdG9waGUgTGVyb3kgYSDDqWNyaXTCoDoN
Cj4gDQo+IA0KPiBMZSAwNi8xMi8yMDIzIMOgIDE5OjU4LCBHZW9yZ2UgU3RhcmsgYSDDqWNyaXTC
oDoNCj4+IFtWb3VzIG5lIHJlY2V2ZXogcGFzIHNvdXZlbnQgZGUgY291cnJpZXJzIGRlIA0KPj4g
Z25zdGFya0BzYWx1dGVkZXZpY2VzLmNvbS4gRMOpY291dnJleiBwb3VycXVvaSBjZWNpIGVzdCBp
bXBvcnRhbnQgw6AgDQo+PiBodHRwczovL2FrYS5tcy9MZWFybkFib3V0U2VuZGVySWRlbnRpZmlj
YXRpb24gXQ0KPj4NCj4+IEhlbGxvIEhhbnMNCj4+DQo+PiBUaGFua3MgZm9yIHRoZSByZXZpZXcu
DQo+Pg0KPj4gT24gMTIvNi8yMyAxODowMSwgSGFucyBkZSBHb2VkZSB3cm90ZToNCj4+PiBIaSBH
ZW9yZ2UsDQo+Pj4NCj4+PiBPbiAxMi80LzIzIDE5OjA1LCBHZW9yZ2UgU3Rhcmsgd3JvdGU6DQo+
Pj4+IFVzaW5nIG9mIGRldm0gQVBJIGxlYWRzIHRvIGNlcnRhaW4gb3JkZXIgb2YgcmVsZWFzaW5n
IHJlc291cmNlcy4NCj4+Pj4gU28gYWxsIGRlcGVuZGVudCByZXNvdXJjZXMgd2hpY2ggYXJlIG5v
dCBkZXZtLXdyYXBwZWQgc2hvdWxkIGJlIGRlbGV0ZWQNCj4+Pj4gd2l0aCByZXNwZWN0IHRvIGRl
dm0tcmVsZWFzZSBvcmRlci4gTXV0ZXggaXMgb25lIG9mIHN1Y2ggb2JqZWN0cyB0aGF0DQo+Pj4+
IG9mdGVuIGlzIGJvdW5kIHRvIG90aGVyIHJlc291cmNlcyBhbmQgaGFzIG5vIG93biBkZXZtIHdy
YXBwaW5nLg0KPj4+PiBTaW5jZSBtdXRleF9kZXN0cm95KCkgYWN0dWFsbHkgZG9lcyBub3RoaW5n
IGluIG5vbi1kZWJ1ZyBidWlsZHMNCj4+Pj4gZnJlcXVlbnRseSBjYWxsaW5nIG11dGV4X2Rlc3Ry
b3koKSBpcyBqdXN0IGlnbm9yZWQgd2hpY2ggaXMgc2FmZSBmb3IgDQo+Pj4+IG5vdw0KPj4+PiBi
dXQgd3JvbmcgZm9ybWFsbHkgYW5kIGNhbiBsZWFkIHRvIGEgcHJvYmxlbSBpZiBtdXRleF9kZXN0
cm95KCkgaXMNCj4+Pj4gZXh0ZW5kZWQgc28gaW50cm9kdWNlIGRldm1fbXV0ZXhfaW5pdCgpLg0K
Pj4+Pg0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBHZW9yZ2UgU3RhcmsgPGduc3RhcmtAc2FsdXRlZGV2
aWNlcy5jb20+DQo+Pj4+IC0tLQ0KPj4+PiDCoCBpbmNsdWRlL2xpbnV4L2Rldm0taGVscGVycy5o
IHwgMTggKysrKysrKysrKysrKysrKysrDQo+Pj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNl
cnRpb25zKCspDQo+Pj4+DQo+Pj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2Rldm0taGVs
cGVycy5oIA0KPj4+PiBiL2luY2x1ZGUvbGludXgvZGV2bS1oZWxwZXJzLmgNCj4+Pj4gaW5kZXgg
NzQ4OTE4MDIyMDBkLi4yZjU2ZTQ3Njc3NmYgMTAwNjQ0DQo+Pj4+IC0tLSBhL2luY2x1ZGUvbGlu
dXgvZGV2bS1oZWxwZXJzLmgNCj4+Pj4gKysrIGIvaW5jbHVkZS9saW51eC9kZXZtLWhlbHBlcnMu
aA0KPj4+PiBAQCAtNzYsNCArNzYsMjIgQEAgc3RhdGljIGlubGluZSBpbnQgZGV2bV93b3JrX2F1
dG9jYW5jZWwoc3RydWN0IA0KPj4+PiBkZXZpY2UgKmRldiwNCj4+Pj4gwqDCoMKgwqAgcmV0dXJu
IGRldm1fYWRkX2FjdGlvbihkZXYsIGRldm1fd29ya19kcm9wLCB3KTsNCj4+Pj4gwqAgfQ0KPj4+
Pg0KPj4+PiArc3RhdGljIGlubGluZSB2b2lkIGRldm1fbXV0ZXhfcmVsZWFzZSh2b2lkICpyZXMp
DQo+Pj4+ICt7DQo+Pj4+ICvCoMKgwqAgbXV0ZXhfZGVzdHJveShyZXMpOw0KPj4+PiArfQ0KPj4+
PiArDQo+Pj4+ICsvKioNCj4+Pj4gKyAqIGRldm1fbXV0ZXhfaW5pdCAtIFJlc291cmNlLW1hbmFn
ZWQgbXV0ZXggaW5pdGlhbGl6YXRpb24NCj4+Pj4gKyAqIEBkZXY6wqDCoMKgIERldmljZSB3aGlj
aCBsaWZldGltZSB3b3JrIGlzIGJvdW5kIHRvDQo+Pj4+ICsgKiBAbG9jazrCoMKgIFBvaW50ZXIg
dG8gYSBtdXRleA0KPj4+PiArICoNCj4+Pj4gKyAqIEluaXRpYWxpemUgbXV0ZXggd2hpY2ggaXMg
YXV0b21hdGljYWxseSBkZXN0cm95ZWQgd2hlbiBkcml2ZXIgaXMgDQo+Pj4+IGRldGFjaGVkLg0K
Pj4+PiArICovDQo+Pj4+ICtzdGF0aWMgaW5saW5lIGludCBkZXZtX211dGV4X2luaXQoc3RydWN0
IGRldmljZSAqZGV2LCBzdHJ1Y3QgbXV0ZXggDQo+Pj4+ICpsb2NrKQ0KPj4+PiArew0KPj4+PiAr
wqDCoMKgIG11dGV4X2luaXQobG9jayk7DQo+Pj4+ICvCoMKgwqAgcmV0dXJuIGRldm1fYWRkX2Fj
dGlvbl9vcl9yZXNldChkZXYsIGRldm1fbXV0ZXhfcmVsZWFzZSwgbG9jayk7DQo+Pj4+ICt9DQo+
Pj4+ICsNCj4+Pj4gwqAgI2VuZGlmDQo+Pj4NCj4+PiBtdXRleF9kZXN0cm95KCkgb25seSBhY3R1
YWxseSBkb2VzIGFueXRoaW5nIGlmIENPTkZJR19ERUJVR19NVVRFWEVTDQo+Pj4gaXMgc2V0LCBv
dGhlcndpc2UgaXQgaXMgYW4gZW1wdHkgaW5saW5lLXN0dWIuDQo+Pj4NCj4+PiBBZGRpbmcgYSBk
ZXZyZXMgcmVzb3VyY2UgdG8gdGhlIGRldmljZSBqdXN0IHRvIGNhbGwgYW4gZW1wdHkgaW5saW5l
DQo+Pj4gc3R1YiB3aGljaCBpcyBhIG5vLW9wIHNlZW1zIGxpa2UgYSB3YXN0ZSBvZiByZXNvdXJj
ZXMuIElNSE8gaXQNCj4+PiB3b3VsZCBiZSBiZXR0ZXIgdG8gY2hhbmdlIHRoaXMgdG86DQo+Pj4N
Cj4+PiBzdGF0aWMgaW5saW5lIGludCBkZXZtX211dGV4X2luaXQoc3RydWN0IGRldmljZSAqZGV2
LCBzdHJ1Y3QgbXV0ZXggDQo+Pj4gKmxvY2spDQo+Pj4gew0KPj4+IMKgwqDCoMKgwqAgbXV0ZXhf
aW5pdChsb2NrKTsNCj4+PiAjaWZkZWYgQ09ORklHX0RFQlVHX01VVEVYRVMNCj4+PiDCoMKgwqDC
oMKgIHJldHVybiBkZXZtX2FkZF9hY3Rpb25fb3JfcmVzZXQoZGV2LCBkZXZtX211dGV4X3JlbGVh
c2UsIGxvY2spOw0KPj4+ICNlbHNlDQo+Pj4gwqDCoMKgwqDCoCByZXR1cm4gMDsNCj4+PiAjZW5k
aWYNCj4+PiB9DQo+Pj4NCj4+PiBUbyBhdm9pZCB0aGUgdW5uZWNlc3NhcnkgZGV2cmVzIGFsbG9j
YXRpb24gd2hlbg0KPj4+IENPTkZJR19ERUJVR19NVVRFWEVTIGlzIG5vdCBzZXQuDQo+Pg0KPj4g
SG9uZXN0bHkgc2F5aW5nIEkgZG9uJ3QgbGlrZSB1bm5lY2Vzc2FyeSBkZXZyZXMgYWxsb2NhdGlv
biBlaXRoZXIgYnV0DQo+PiB0aGUgcHJvcG9zZWQgYXBwcm9hY2ggaGFzIGl0cyBvd24gcHJpY2U6
DQo+Pg0KPj4gMSkgd2UnbGwgaGF2ZSBtb3JlIHRoYW4gb25lIHBsYWNlIHdpdGggYnJhbmNoaW5n
IGlmIG11dGV4X2Rlc3Ryb3kgaXMNCj4+IGVtcHR5IG9yIG5vdCB1c2luZ8KgIGluZGlyZWN0IGNv
bmRpdGlvbi4gSWYgc3VkZGVubHkgbXV0ZXhfZGVzdHJveSBpcw0KPj4gZXh0ZW5kZWQgZm9yIG5v
bi1kZWJ1ZyBjb2RlIChpbiB1cHN0cmVhbSBicmFuY2ggb3IgZS5nLiBieSBzb21lb25lIGZvcg0K
Pj4gbG9jYWwgZGVidWcpIHRoYW4gdGhlcmUnbGwgYmUgYSBwcm9ibGVtLg0KPj4NCj4+IDIpIElm
IG11dGV4X2Rlc3Ryb3kgaXMgZW1wdHkgb3Igbm90IGRlcGVuZHMgb24gQ09ORklHX1BSRUVNUFRf
UlQgb3B0aW9uDQo+PiB0b28uIFdoZW4gQ09ORklHX1BSRUVNUFRfUlQgaXMgb24gbXV0ZXhfZGVz
dHJveSBpcyBhbHdheXMgZW1wdHkuDQo+Pg0KPj4gQXMgSSBzZWUgaXQgb25seSB0aGUgbXV0ZXgg
aW50ZXJmYWNlIChtdXRleC5oKSBoYXMgdG8gc2F5IGRlZmluaXRlbHkgaWYNCj4+IG11dGV4X2Rl
c3Ryb3kgbXVzdCBiZSBjYWxsZWQuIFByb2JhYmx5IHdlIGNvdWxkIGFkZCBzb21lIGRlZmluZSB0
bw0KPj4gaW5jbHVkZS9saW51eC9tdXRleC5oLGxpa2UgSVNfTVVURVhfREVTVFJPWV9SRVFVSVJF
RCBhbmQgZGVjbGFyZSBpdCBuZWFyDQo+PiBtdXRleF9kZXN0cm95IGRlZmluaXRpb24gaXRzZWxm
Lg0KPj4NCj4+IEkgdHJpZWQgdG8gcHV0IGRldm1fbXV0ZXhfaW5pdCBpdHNlbGYgaW4gbXV0ZXgu
aCBhbmQgaXQgY291bGQndmUgaGVscGVkDQo+PiB0b28gYnV0IGl0J3Mgbm90IHRoZSBwbGFjZSBm
b3IgZGV2bSBBUEkuDQo+Pg0KPiANCj4gV2hhdCBkbyB5b3UgbWVhbiBieSAiaXQncyBub3QgdGhl
IHBsYWNlIGZvciBkZXZtIEFQSSIgPw0KPiANCj4gSWYgeW91IGRvIGEgJ2dyZXAgZGV2bV8gaW5j
bHVkZS9saW51eC8nIHlvdSdsbCBmaW5kIGRldm1fIGZ1bmN0aW9ucyBpbiANCj4gYWxtb3N0IDEw
MCAuaCBmaWxlcy4gV2h5IHdvdWxkbid0IG11dGV4LmggYmUgdGhlIHBsYWNlIGZvciANCj4gZGV2
bV9tdXRleF9pbml0KCkgPw0KDQpMb29raW5nIGF0IGl0IGNsb3NlciwgSSBoYXZlIHRoZSBmZWVs
aW5nIHRoYXQgeW91IHdhbnQgdG8gZG8gc2ltaWxhciB0byANCmRldm1fZ3Bpb19yZXF1ZXN0KCkg
aW4gbGludXgvZ3Bpby5oIDoNCg0KSW4gbGludXgvbXV0ZXguaCwgYWRkIGEgcHJvdG90eXBlIGZv
ciBkZXZtX211dGV4X2luaXQoKSB3aGVuIA0KQ09ORklHX0RFQlVHX01VVEVYRVMgaXMgZGVmaW5l
ZCBhbmQgYW4gZW1wdHkgc3RhdGljIGlubGluZSBvdGhlcndpc2UuDQpUaGVuIGRlZmluZSBkZXZt
X211dGV4X2luaXQoKSBpbiBrZXJuZWwvbG9ja2luZy9tdXRleC1kZWJ1Zy5jDQoNCldvdWxkbid0
IHRoYXQgd29yayA/DQoNCkNocmlzdG9waGUNCg==
