Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EEEC7538B65
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 May 2022 08:27:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LC2Q36YWXz3bsy
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 May 2022 16:27:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::612; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on0612.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::612])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LC2PZ6rq8z30QW
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 May 2022 16:27:14 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hPkOkWJJfUGBnsOrdaCo/o6N9H43UJhCRTcu2VRRkxEdDOei5ot5MxIGv36rJ+dJJBOtLjin/y+shXGytipo5Tk8njBzL6wiR2JTB6p17CFY82hmlN82nlFDZpqzZgkA5NXOD1vuqW3MbW/yZpHLXNhTHxoJiGuhnYzDvsKdhsnGdFSWo5hCMdyefwAjQ8VPgSdjXg27cNj1RdWKEa+uYdKGTBx2CrAZl72DFAUPIczCnDGxIN0rP5IIh7eWMLQWpTwa+WVQ5UxFPXWD9ReYFcZV3Af/IjilfZjsSNgMmKgr69b1PsNNF71C7qatF55QM3c3r1IzoC7an1tR+4k7dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fqDmpYe5m2IQNWrWevfL6uH9kIyHY4b74Mi9Hliwuxw=;
 b=VfURTigIGPOwUVeI8OJM+KzVRsGvIXIn2CW5D7DZK0hTsP1Rz4sCwqJPIjJb0sTZGrrq2qx7aZpBLwWOoRFUDSnqZBM8fglG68ebJjdUbqO51c4nwlDTJAG/zElPwkfEpmsX/lg4U9vrlHTAEauv1IM3esaMmAfT/OHaZQZ2mVc4kR1HW8v+aZjHyqjj6kcEWqnybjCx12NGwJveXJmu9Xn8ihbH1K6ExO+HOqCach3cBn4NJSsLIxRmhcg1vkMVK0HerxLZaKSpbzgNd/aL00CNtJ58Dn8uRXNuWerFB+ZA6Y/mhEc/kbcbhP2Dp6NPHhYTQvrO5mkBI73f8FCh6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB4131.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:25::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Tue, 31 May
 2022 06:26:57 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356%5]) with mapi id 15.20.5293.019; Tue, 31 May 2022
 06:26:56 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt
	<benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH] powerpc/Kconfig: Force THREAD_SHIFT to at least 14 with
 KASAN
Thread-Topic: [PATCH] powerpc/Kconfig: Force THREAD_SHIFT to at least 14 with
 KASAN
Thread-Index: AQHYdD6k3X7WzR6IMEigNl/a6UYJ6K04g2SAgAAC94A=
Date: Tue, 31 May 2022 06:26:56 +0000
Message-ID: <2413ae59-b98f-75c3-639c-0e6119ff6fda@csgroup.eu>
References:  <cc1190008368a3305d424a98be756fedec6348c1.1653926503.git.christophe.leroy@csgroup.eu>
 <87h756kz0s.fsf@mpe.ellerman.id.au>
In-Reply-To: <87h756kz0s.fsf@mpe.ellerman.id.au>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e8048fa7-e4ad-4096-9d5c-08da42ce8fcc
x-ms-traffictypediagnostic: MR1P264MB4131:EE_
x-microsoft-antispam-prvs:  <MR1P264MB41319DF732B26452EC29C7D9EDDC9@MR1P264MB4131.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  tTIQEdZGnO91QEa5UWKhuYFPaXU3CkFdLD0Pcmi360jag1pl2czjiIXBh0UCZ4qmq/0iGALWhERn9QpFPWP5awu9cvyujV9I8pwgPOo+vxRDUFBxiA7ogOOscJGfg24H8UxnRT9LzNcaU8BHlwEH2EmrrPBL8Ufa8pXO1UlJqsg5JXv0BlhfEyFPtYDn7SaeeElBnp8kWKfcfzFf6wTpNCd/auGd+A+/izkn9F10lCgQWKtbBroqT8UNxQfSqhGIFYKSeRgkHDP7dr6iR1J0dHjs8+1ZLaAixfNSvvH16y5cxeMJins+CQJ6NsryuH2dN94muilPzrhGKuKL3Ur9XOkq1qvheFRz8DW/Wx/njfZbPuz45i7ezrt5QkhKPSVlm2LTfeU51a+Q+H3vmgARd0gIRBkjdGKsAGFAx6qSxkEufPOdOwOKNB+kr1fjEs2tQEypxhfuom7r7wYOzczsXtpz3uiUdEYmBC6NyRvQK4PvSjmZHRpc+b2VTSrO4tiHzZ0P/4b3Wp4z5My2umbYkjO+dCInZSLn/j8FTl/PKo03mkpY24XiAG/v3AbLnfYEEobX9dWOU8IffgNuWq0id9Zk/265qQokbB/47DbeUWJa8NJ5eEEnKNj1HKzcL1yXXQBMi7HE+UM5DDxP+p+8TB6eF6uVa0D9N8V/5D2G6nrqxeM53ymI9wRqdRe8Fbx2WVjSScP7h6Tw7MEc7nXNpdnj2EIdYe09KQ4F0IjhgQe2IDkV7irc2+3rKxrk0Cqp+w3Jy+Hpw9lrBMfMbqbbBA==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(91956017)(316002)(36756003)(54906003)(4326008)(66946007)(76116006)(66556008)(64756008)(66476007)(8676002)(66446008)(110136005)(44832011)(122000001)(38070700005)(8936002)(86362001)(31696002)(5660300002)(508600001)(66574015)(38100700002)(2906002)(6486002)(2616005)(26005)(31686004)(186003)(6512007)(71200400001)(6506007)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?eGVRUTM3ejRaRXJ4enRWUG0vdW5ieUQwZng0ZUZxTU5zVEhxdGFPZDdMSThO?=
 =?utf-8?B?Y0ZpZW0yNS9UcHRnQWZJc2NEdi8xUlJrYkZjSmdtbzMxS3U5U2xVMmM3ckFP?=
 =?utf-8?B?VlNnUk1DU0FzL1U2UjlJVVFUVDBpWDNXQTlGOEVHV0pteDdqZ3hLdWtNWUh3?=
 =?utf-8?B?ZWVsdmhHbUg5bGRIOHU4SEFZR2FlS1JBdTNYRWVQcEZNbEs3YUV4Nm5ESkc5?=
 =?utf-8?B?dGhMZExscEhDUFJDQ1BiOWZSa05zVVpNYVlnZmtqVGJZQlVPaklna0VaZ0FR?=
 =?utf-8?B?ckdHL2RxWGhwaytWUDZUVFE5cTNRZTR1YkdxbisyTFd0dnRzeTNPOE1GU29I?=
 =?utf-8?B?WmhZcWxEY0o5OVprSktuaHNnbWozT1d4MWYvSGNTZzk0bmN1RU1YanMwbGZW?=
 =?utf-8?B?TXQ5MjNXc2dRZnlpbzVaTXZ2b0FjNk1nS1hySUtkM2hDOTRWdGpDRmNYbmRD?=
 =?utf-8?B?Vy96aDU0NGlKdXlHak1jVUhMQjh6cGdTR1owZExMV0FPZ1RrNEpXdW1hcDR5?=
 =?utf-8?B?N1BXaGZRQWR1eGFTTHo0amR2aGt2VkZVWXIrTEExMHpGWnowdER0OXFSV1dx?=
 =?utf-8?B?a0Z1Mk1hdWRKd2dWWk9JK3Bab3hPSmxWdDFpVFA2dU5TZ20rMG0ray9kWDhy?=
 =?utf-8?B?WTc2UVFlVnhKVG9OUEt5eStVYmg4b2RYOG9tQjV1RGNMcGZPYkQ3Kys1QTFC?=
 =?utf-8?B?M2pXR2J2TmVsNmtQbTFBK0huUTZEVHp2WWdKYkVqM2NPd0dyaGVDUDRZbFJm?=
 =?utf-8?B?TW1RR25nVStqbDVkNk1PNGFyQmh2TzNSdVdOTFVXMWN4RTVteDM5Q3ZzYVll?=
 =?utf-8?B?VTBXNC93SGw4YitIRGZDVEJpdG5QWG1YMGxuZFV2TkwzRW5BeHJCRFBOQzIv?=
 =?utf-8?B?YjJyQnBTYWRpOW5ORVovMVcwOWl2NEh3S1pUd1ZNNmxmdlBSeXdFS2E3eUYz?=
 =?utf-8?B?QVJnVGc1RUE2czR1RlYzL2dNVnM4S0g4N3Y2SExramM2dUVtNnhra3pCK09C?=
 =?utf-8?B?ajYzNUdFMHozKzB6a01XU2MwWWRmOEpVYmZ6dWgvNlpNYjVDVklIVWpKSm52?=
 =?utf-8?B?RmJRbUdaMWtTSkx2WllTSVluVHRiRzFzL3Ziak5ldFZVM0RDQmx5ZW9LeTZx?=
 =?utf-8?B?SW0vMGF3SVNOUWVHN05DWFp5dDdCMVcxejFXVjNxbTF3d0E5YUR4dzBQNnpm?=
 =?utf-8?B?SVNjZVZkT00rdWxIMDBVd0dWdlpRaUs4a2Z1SzhWUTRVN05JZmFoM2g5R01B?=
 =?utf-8?B?dW1UV1RvaDZPdmtrd3lmTEZqUEg3bHk3RTVyVGYyUWVwaHdsMEVZSnd4ZDN1?=
 =?utf-8?B?czJaaXg2NkRISE9ObFBuczBDY2lJdVhVNitVUXlaNWlxaFJNdkR4TkFBWGd4?=
 =?utf-8?B?VUdWV3ZPcFFueXpUbXJ4a3JzV1B0RUdPbklqVHQxeFk1YUR2WnVIMzlZU0Ix?=
 =?utf-8?B?MG9qbktJTmRvcGZkUTMyZEhPWm1ZNCtsZHcvRzRhSng1U1FIQmlWbWgxOUM2?=
 =?utf-8?B?OFhBM2lBckdGY2NNZkZubFE3b3l6MmorTXc3WFQxenFDbnAycEQ3SWROZWs1?=
 =?utf-8?B?MDN0NUhEMGNIL0FrZFhCTFZJc29JcjhRQm5vTVhZbStuRlZuK1hFSnJtM1hG?=
 =?utf-8?B?Kzk0OXY2di9TU0czeU5WY1VLVXhkK0U4NGNyUmlNaUEvSGNHMmZpNW1rV3Rl?=
 =?utf-8?B?UUJvRTJUdUNuRitXQ2o3djFkdUllMWR6dzJjSEV5Q2xkeHloSXpuUUFLWWFD?=
 =?utf-8?B?RkM2dU1xNm5KRU15M0pxL0ZrUVJSVHcxeFRVK2NHS2p2TWZYNlFBSnpia2Nv?=
 =?utf-8?B?NWtvMERKbUhZZFQwTXcraFp0SHRBTjh0dWl4aWhPVjY4eUNVaE84QUZDRm04?=
 =?utf-8?B?ajBKK2VpMFRBVHFRNUEzZXUzYTh1Y3htdzRPSzlMS1hVR3ZxUHRkU0p1bkkv?=
 =?utf-8?B?ZnFpUUFoMXBpQ1lyN2tkSkRQQk92eEw2SlVvbk4yOGxuZ3J3d0FiZG91eUcy?=
 =?utf-8?B?QnM2WXVxK3EwdHhpU3dhWUxUYlJwb1FXODdRbG5sQStXUEt0dUxXa09JV1cw?=
 =?utf-8?B?WDV6RXZMaDBET3lHSEdqQkRvYTEzaDJMZTVpVFVndi85YUxncW8wcjk3UEkx?=
 =?utf-8?B?TktqY0NyaUg5eDFNWThodk9GOVpJc3RPYjFnVGNuMkgvMnhRVmhLWVVuZVlJ?=
 =?utf-8?B?aU9DQXRpTFNPV1JLMTVwOFhaOCs5MFR0NXZPbTkwWDVZR3dVYWhEMWQrY0JV?=
 =?utf-8?B?S3BQMkVBYVNNL3I1eTlHa21SZENsdXlndGVQU29jaTZHSzV4K0l3N0FBSzY2?=
 =?utf-8?B?cnFROVg5MUpHME5lbWMrcWd4YUluVUlrMHpuTVFON2M3K3hQQWljS1RTdG1U?=
 =?utf-8?Q?7LlwqcA59c+MeDq1tBCWrZ8uei7PjeMDeW5Ih?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1958D5ABE80CB246AC53209ECB845100@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e8048fa7-e4ad-4096-9d5c-08da42ce8fcc
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2022 06:26:56.9438
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KnVaRN558hUJUCt/aIb+V5BKQGNbYdG8rrGHD13Bu5hYsptST71+EFJhxRX1/oD5jg205n+qINHcXCcygTxTlC4rqY5TqJ1KHhR0Yg1o1pc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB4131
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
Cc: Erhard Furtner <erhard_f@mailbox.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDMxLzA1LzIwMjIgw6AgMDg6MTYsIE1pY2hhZWwgRWxsZXJtYW4gYSDDqWNyaXTCoDoN
Cj4gQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1PiB3cml0ZXM6
DQo+PiBBbGx0aG91Z2ggMTQgaXMgdGhlIGRlZmF1bHQgVEhSRUFEX1NISUZUIHdoZW4gS0FTQU4g
aXMgc2VsZWN0ZWQsDQo+PiB0YWtpbmcgYW4gb2xkIGNvbmZpZyBtYXkga2VlcCAxMyB3aGVuIENP
TkZJR19FWFBFUlQgaXMgc2VsZWN0ZWQuDQo+Pg0KPj4gRm9yY2UgaXQgdG8gMTQgYXMgYSBtaW5p
bXVtIHdoZW4gS0FTQU4gaXMgc2VsZWN0ZWQuDQo+Pg0KPj4gQWxzbyBkZWZhdWx0IHRvIDE1IHdo
ZW4gS0FTQU4gb24gUFBDNjQuDQo+Pg0KPj4gUmVwb3J0ZWQtYnk6IEVyaGFyZCBGdXJ0bmVyIDxl
cmhhcmRfZkBtYWlsYm94Lm9yZz4NCj4+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waGUgTGVyb3kg
PGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4NCj4+IC0tLQ0KPj4gICBhcmNoL3Bvd2VycGMv
S2NvbmZpZyB8IDQgKysrLQ0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pDQo+IA0KPiBJIHdhcyB0aGlua2luZyBvZiBkb2luZyBpdCBpbiBDLCBzaW1p
bGFyIHRvIHRoZSB3YXkgYXJtNjQgaGFuZGxlcyBpdC4NCj4gDQo+IFNvbWV0aGluZyBsaWtlIGJl
bG93LiBJdCBtZWFucyB3ZSBhbHdheXMgZG91YmxlIHRoZSBzdGFjayBzaXplIHdoZW4NCj4gS0FT
QU4gaXMgZW5hYmxlZC4gSSB0aGluayBpdCdzIHByZWZlcmFibGUsIGFzIGl0IHdpbGwgYWx3YXlz
IHdvcmsNCj4gcmVnYXJkbGVzcyBvZiB3aGV0aGVyIHRoZSB1c2VyIGhhcyBhbiBvbGQgLmNvbmZp
ZyAob3IgaXMgYmlzZWN0dGluZyk/DQoNClllcyBnb29kIGlkZWEuDQoNCkkgbGVhdmUgaXQgdG8g
eW91IHRoZW4uDQoNCllvdSBjYW4gdGhlcmVmb3JlIGFsc28gcmVtb3ZlIHRoZSBkZWZhdWx0IHZh
bHVlIGZvciBLQVNBTiBpbiBLY29uZmlnLg0KDQpDaHJpc3RvcGhlDQoNCj4gDQo+IGNoZWVycw0K
PiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS90aHJlYWRfaW5mby5o
IGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3RocmVhZF9pbmZvLmgNCj4gaW5kZXggMTI1MzI4
ZDFiOTgwLi5jOTczNWY5M2Y4ZTYgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9pbmNsdWRl
L2FzbS90aHJlYWRfaW5mby5oDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS90aHJl
YWRfaW5mby5oDQo+IEBAIC0xNCwxMiArMTQsMTcgQEANCj4gICANCj4gICAjaWZkZWYgX19LRVJO
RUxfXw0KPiAgIA0KPiAtI2lmIGRlZmluZWQoQ09ORklHX1ZNQVBfU1RBQ0spICYmIENPTkZJR19U
SFJFQURfU0hJRlQgPCBQQUdFX1NISUZUDQo+IC0jZGVmaW5lIFRIUkVBRF9TSElGVAkJUEFHRV9T
SElGVA0KPiArI2lmZGVmIENPTkZJR19LQVNBTg0KPiArI2RlZmluZSBUSFJFQURfU0hJRlQJCShD
T05GSUdfVEhSRUFEX1NISUZUICsgMSkNCj4gICAjZWxzZQ0KPiAgICNkZWZpbmUgVEhSRUFEX1NI
SUZUCQlDT05GSUdfVEhSRUFEX1NISUZUDQo+ICAgI2VuZGlmDQo+ICAgDQo+ICsjaWYgZGVmaW5l
ZChDT05GSUdfVk1BUF9TVEFDSykgJiYgVEhSRUFEX1NISUZUIDwgUEFHRV9TSElGVA0KPiArI3Vu
ZGVmIFRIUkVBRF9TSElGVA0KPiArI2RlZmluZSBUSFJFQURfU0hJRlQJCVBBR0VfU0hJRlQNCj4g
KyNlbmRpZg0KPiArDQo+ICAgI2RlZmluZSBUSFJFQURfU0laRQkJKDEgPDwgVEhSRUFEX1NISUZU
KQ0KPiAgIA0KPiAgIC8qDQo+IA0KPiA=
