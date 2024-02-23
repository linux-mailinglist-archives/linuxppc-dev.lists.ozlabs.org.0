Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8F5860B0F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Feb 2024 07:59:24 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=X8FIKr7M;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Th18V58lPz3vYd
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Feb 2024 17:59:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=X8FIKr7M;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:261d::701; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20701.outbound.protection.outlook.com [IPv6:2a01:111:f403:261d::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Th17j0NCZz3d2d
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Feb 2024 17:58:38 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TYnjGH9Pm9IEP17uOMJVXsEbuH0LuRXoWI/RFuURLGmEim+D9tgnAhUilY51MkdVAwec9DQv20rlo9mNDwVepCdx9FAVJRJ8/3MIYiA4u5n5c1msHyxgNveAE9muhPDVGpDzWBiSsOuipooLp3GFbCZcGCuoUbCZJO8UaSBEJNSaJlCuKwiRKS8GrwAWHDmv6lqREO2tV651XhKVToLZf//kw915ai24kLFhgbXG0d0diCB/nIXLz0egvOW/vO5EsJpmcN8OUwHeIa0rye8+IHGjK+ZPgU66ykSkrMFZJAeYhD26pbQrMTWpTX3uWKHg43iUOPbnrlU+L/44+GwKYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Q9nIAle0kfK62dgiW93fUoLh/hX5LGfJ4K3plEU8Bk=;
 b=fZgtNUfS9593yh7vrVutRdDhynb9oqef3fb58PleQqRU9gbqA3AlQD20PDzs3nRy362FTcugjK/hJdQL+FlTmxmXUNnmfYufUAGkwt4vqm7it4AMjapqeKgI582gFVr0Hnkt40IUyjzrVNrpUO37FEHyCvFmLB+mqsFhc1EktzokI+wE21ZFxM4yeKJtkvvXlUfZCnDmhCZ/Bdy70UNOH6TU4il4lb8QtLd9zRZmpq0+BoTsAZJEK6sFzbQ5V0Udv2K26UzdSmKoLzKZV8qtyeoBz/OOZps09cu18QLejRq2IDgIcVTvsU+kJYrU9KR29PXljPsKVtsZYchg9TS1Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Q9nIAle0kfK62dgiW93fUoLh/hX5LGfJ4K3plEU8Bk=;
 b=X8FIKr7MCW6/47wze/SZ/g69jMEYb0jMm2d8ewTCKAMQk7rhSMxUv1Y1SuAlDmedkvJIDj+ogSvSJIwPDo4N0tEMRfv0CyzpIy2DEtOSlY/ob0KK/nG7D/RRPcBRRlbRs5OBsg9mZ/gY1drJfSOFdLZyeHksjFikqC5q41vqG/d2/NEsEKLJW22h7kvXyEzPBn7BRtg1HSOtcTAox+zJB9v7dUSJHVu2+AVOvEZn80SFDPKgtTKKzN7VWa1HFunxxgzK3n4K7XKbJGXmbxJea0OPArt3EPpD/X6ydbS2ZzwIIkCpdvoCyqVZu9Onmzc0+whzUFwgK15KEb8BtQaU7w==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB3495.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:187::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.24; Fri, 23 Feb
 2024 06:58:14 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::46af:917d:3bb2:167e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::46af:917d:3bb2:167e%6]) with mapi id 15.20.7316.023; Fri, 23 Feb 2024
 06:58:14 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Charlie Jenkins <charlie@rivosinc.com>
Subject: Re: "test_ip_fast_csum: ASSERTION FAILED at lib/checksum_kunit.c:589"
 at boot with CONFIG_CHECKSUM_KUNIT=y enabled on a Talos II, kernel 6.8-rc5
Thread-Topic: "test_ip_fast_csum: ASSERTION FAILED at
 lib/checksum_kunit.c:589" at boot with CONFIG_CHECKSUM_KUNIT=y enabled on a
 Talos II, kernel 6.8-rc5
Thread-Index: AQHaZfhWXT9lyHlHz0yak8SbuUgrx7EXbt+AgAAD1ICAAAyygA==
Date: Fri, 23 Feb 2024 06:58:14 +0000
Message-ID: <6c37ffa2-8642-46c0-89ba-1f1e29b094d9@csgroup.eu>
References: <20240223022654.625bef62@yea>
 <528c6abf-e5ef-42cd-a5d7-6ede3254523d@csgroup.eu> <Zdg3X4A1eJsJ+ACh@ghost>
In-Reply-To: <Zdg3X4A1eJsJ+ACh@ghost>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR1P264MB3495:EE_
x-ms-office365-filtering-correlation-id: 86f5471f-4684-4fea-3440-08dc343cce97
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  wWwjJ3qjDJj5Inz10lg63MDkoC+Zdq86qI3mFlb8nd69wzPoisaQaZxDvkK6NSjbHJ1Qpfby7YL7EJyfC/Pmcs75w7SCoHOkymnKFoMPwu0UThSNZkQzJvtgg7HhYwv/8q5XPbHj8uIteN6bHVvm9mg1GjrEIs+3g50Bsfw6zeZg67M1TiiY0vp7fKLUMXU1paNTmWz4Dm9Wf6UjVOAkbKmn4QrqE/avx5rfl7Gyp67pr+dCQFbtRUDMxTTwLWdQb8vywC06Xzs/4UgZp5fRAMQzgOq9hfsizcc+dE//ehf0o/zibeICDPS59MIcHHb+qH+2k8q0Du7UC92xU2S5TYAmBGCfppAL5YPDDurl5jM2xJj9Bl+6YaTdtfefhaPPy8hte36wvfE13aUXI52W18AtW1whUdxy+IgczUA1Z4hz/bh5t7r+w41ALXFHCcO4+GoIhIS8mQYH4fK7pTByY8bYfXlr9V9fNeo2s0asjvLoSqh/Wa5OKhAtSr89hxUkBA+UDYpPwlHCmLTJJWHBYF5/prX53IgHaZbs5nwi8MZAlMTvOLpNDazXc1M/LeReE5kgfWWs8zBkUlGmOipR/zhx9jxZIN0vmNURUaSB7cQ=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(230273577357003)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?cGliUU5CS3NldUthVHNoKzhTRWtZeHYrWHFuM3BOWkRNTC9MSTdVaVBiQWdU?=
 =?utf-8?B?Y3hvQ0ZxbEtZekVCZFRwSW4yQ2t2cU1UczQ2MjRmUDk2YUdFNlVOTXR5Q1dD?=
 =?utf-8?B?cmFVS3A4ZGNrWVlmdGZzZ3E3RGJmWDY4VEsvRWVsbHN6VkxnOS9NUVVGRlRi?=
 =?utf-8?B?Y3BMZ0RpOVBsOFhaOWRZSHZ0ckRSeVozYkE3bjhPV0dyZEl3U3pjNDdHdWJz?=
 =?utf-8?B?NGxtY01rRjZPdEtDNEpZYk4rU3h4c0RMeW8veDJuUk1nYXUzUnJ4LzVHdFA3?=
 =?utf-8?B?Skx0aCt0YkhZWXU5YjNvK3ZaYlFPVUlZT3BlbmNLb2twY1M1eWxUNFRTaGRQ?=
 =?utf-8?B?YmFuUjdNQ2dDM01mZ1p3WExqMDdWcUxGdnZEaEhpZGh4aUlpRUc2NTNwdFZr?=
 =?utf-8?B?NTByQzA5aVp6TXZiaWZpb1d5UWlPQXUyQ2dBbTdueDZ3TGJQQlhrM2J0RjJw?=
 =?utf-8?B?UCtSWk14WmhGak13TDlMSWZRUnptb05Pem5zSC9wd3ppeXhzaFk2bnBpamFt?=
 =?utf-8?B?Y3FWOGpCczNkVTVsTXNRcHBCdUJ5L1FSRWs2MHpRZ0RmQ3lQdERDTjJadXJB?=
 =?utf-8?B?OGUwSXF4S01SaUZoSlBRTDFUbHFYVUxHMHcxbnBWc29rV0R4cDRRNFRINUNT?=
 =?utf-8?B?dFozNjZzWDV4Y3pDSDZsRkwvUnZGbkxoZzl4K3c5eWdvVkJ5eTB4QzU1Y2hi?=
 =?utf-8?B?dVVoVTBhTm1mczlkOEEweWVkU0tzcGJCeng4OVpJcGdVRzhmdWQvdHNJQUdX?=
 =?utf-8?B?YWFtcG5FM3NoM1h2bThYU3M3SXlVSU5CLy82TlNQSWtYbmRJdmtOcHdIM1FD?=
 =?utf-8?B?TjJWeGY1ZTF6OHArVFVmK3FLazdFLzlKMmg2VGExY1oxU2EwaGNCSVNZK3Jn?=
 =?utf-8?B?dGljb1g4ajZzaFh5Sm15WE5Ea1RZNjNCN0drMmFpY1hYYzlpaDRpZ0xId2li?=
 =?utf-8?B?L0l2SGo3dlVDRG5nYXVYTXByclJVcW9yN2h5c1hiVXFKejdId2htWEszbXRG?=
 =?utf-8?B?R05OcFRQQmN5L2dZMDdCQ3E3RnFZSUJPYXBJZmtSd3Radi9vU0JFTmcwYVhE?=
 =?utf-8?B?QW54NzlXYXJxZjZabVdVVW5VSXNnRHpWeDA0U0VKVXRNQlg5ZVUrRVlXY0RO?=
 =?utf-8?B?eXpTSjgzVGhtRlVGTGozOHdMdE9td3JEU1ZpOG4vRVJ1N2xDc1RIMCttcHRW?=
 =?utf-8?B?QWlET1dvczVRQjVSQU85UjBRRng2c2xDdnozWHRDc0FNYzdVcHM1ZC9IU2I0?=
 =?utf-8?B?Z3BxcGtkRWpXM3dQRFo3UzRGMGo2ZXlJYzc0RWw2YUdmb0l1ZkcxMWRvQkU2?=
 =?utf-8?B?anczZXRZVW8zdTdPSVpvdnU0eXQ1N1lTRmo2UnVWU0R1dTJPY0NJZ0lQZjJW?=
 =?utf-8?B?K0F0Nkd6STN3TUFYcmRHdEtnSUsrdWlWeHE0bHlOdE90dHk5NDQ2UEFpa0VD?=
 =?utf-8?B?OVllcldIbWhhWnd6U2FSOHZPaFNjZ0NNYy9qUXZBbHFjb2FFNHduclJycE50?=
 =?utf-8?B?UmJZUVg1WiswbG8yOEF2Vy9mL25FbmcvK3lsY1IyRjVlYnBucWNtR0czUU5i?=
 =?utf-8?B?NGlQOEQ4T1BnbUdLaFpIOFR0Y2VNcDdjcWErUGdzU0RQZWgzOHUvc1Z6T1Rs?=
 =?utf-8?B?bHRyUXNnU0x0T1kraWo2ZGdXRkQ1S05FbGZWQ3B6Zk5DbkplMUJaZDFhM2c2?=
 =?utf-8?B?VEtWMWhsbkVhR0tJT2hOelRNbEV6VzRxbkNuR2lmZWZyZ3B0WVQ2NnQxZEY2?=
 =?utf-8?B?eWVPbEJDR2pOL0hWa0JtQ3NBUzd6R0lQZEc4RFk0ZHplRFlTczdMblBRSElV?=
 =?utf-8?B?NmJWRVIxVkJCMDdtMmJVdVVjQVhnS1UvenBNTmh0TVlBQVgwdWliSEUvbFFG?=
 =?utf-8?B?VG8vR051Zm9qM1hUS3FXSklnSlBoeW9yQ0xJV2NiQy82eEVXWnFjNm9IYnJL?=
 =?utf-8?B?b01XLzd4MGZZT0VocUwzQ3ZFOGQwQkZSSUM5djBCbTl1dEZTVWo2cjF3OGxo?=
 =?utf-8?B?VW54anVMYUl1dUFWNFRFTTF2R2NWaGFBKzJPbEREZXNabXRuazcrcHo2eWtu?=
 =?utf-8?B?dU9jUmFBYWZRcHZrUWhLeDlUWVAvYTJXTWpsTXh0UU9UME9jUkk2WXU2dGg3?=
 =?utf-8?B?c2hJL2N5L0dES09remVoY1pSNko5SmtISU4wTjNLbm43VlFENjZYekJRODBm?=
 =?utf-8?B?Wmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <34E02264E7EB2548BE66C6CCCCAF285B@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 86f5471f-4684-4fea-3440-08dc343cce97
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2024 06:58:14.8348
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a7DySCW3uLBI6lWPIBbGuPLDNc6oi2l9S7v4G1MJN1hzHmzMjh63XmIFR+Bigs/VHM50WjgXwVBmdr9iLeMbH7hvdFy8R1K9P/yC+eGKRs4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB3495
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
Cc: Erhard Furtner <erhard_f@mailbox.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Palmer Dabbelt <palmer@rivosinc.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDIzLzAyLzIwMjQgw6AgMDc6MTIsIENoYXJsaWUgSmVua2lucyBhIMOpY3JpdMKgOg0K
PiBPbiBGcmksIEZlYiAyMywgMjAyNCBhdCAwNTo1OTowN0FNICswMDAwLCBDaHJpc3RvcGhlIExl
cm95IHdyb3RlOg0KPj4gSGkgRXJoYXJkLCBoaSBDaGFybGllLA0KPj4NCj4+IExlIDIzLzAyLzIw
MjQgw6AgMDI6MjYsIEVyaGFyZCBGdXJ0bmVyIGEgw6ljcml0wqA6DQo+Pj4gR3JlZXRpbmdzIQ0K
Pj4+DQo+Pj4gTG9va3MgbGlrZSBteSBUYWxvcyBJSSAocnVubmluZyBhIEJFIGtlcm5lbCtzeXN0
ZW0pIGZhaWxzIHNvbWUgb2YgdGhlIGtlcm5lbHMgaW50ZXJuYWwgdW5pdCB0ZXN0cy4gT25lIG9m
IHRoZSBmYWlsaW5nIHRlc3RzIGlzIGNoZWNrc3VtX2t1bml0LCBlbmFibGVkIHZpYSBDT05GSUdf
Q0hFQ0tTVU1fS1VOSVQ9eToNCj4+Pg0KPj4+IFsuLi5dDQo+Pj4gICAgICBLVEFQIHZlcnNpb24g
MQ0KPj4+ICAgICAgICMgU3VidGVzdDogY2hlY2tzdW0NCj4+PiAgICAgICAjIG1vZHVsZTogY2hl
Y2tzdW1fa3VuaXQNCj4+PiAgICAgICAxLi41DQo+Pj4gZW50cnktZmx1c2g6IGRpc2FibGVkIG9u
IGNvbW1hbmQgbGluZS4NCj4+PiAgICAgICBvayAxIHRlc3RfY3N1bV9maXhlZF9yYW5kb21faW5w
dXRzDQo+Pj4gICAgICAgb2sgMiB0ZXN0X2NzdW1fYWxsX2NhcnJ5X2lucHV0cw0KPj4+ICAgICAg
IG9rIDMgdGVzdF9jc3VtX25vX2NhcnJ5X2lucHV0cw0KPj4+ICAgICAgICMgdGVzdF9pcF9mYXN0
X2NzdW06IEFTU0VSVElPTiBGQUlMRUQgYXQgbGliL2NoZWNrc3VtX2t1bml0LmM6NTg5DQo+Pj4g
ICAgICAgRXhwZWN0ZWQgKCB1NjQpZXhwZWN0ZWQgPT0gKCB1NjQpY3N1bV9yZXN1bHQsIGJ1dA0K
Pj4+ICAgICAgICAgICAoIHU2NClleHBlY3RlZCA9PSA1NTkzOSAoMHhkYTgzKQ0KPj4+ICAgICAg
ICAgICAoIHU2NCljc3VtX3Jlc3VsdCA9PSAzMzc1NCAoMHg4M2RhKQ0KPj4+ICAgICAgIG5vdCBv
ayA0IHRlc3RfaXBfZmFzdF9jc3VtDQo+Pj4gICAgICAgIyB0ZXN0X2NzdW1faXB2Nl9tYWdpYzog
QVNTRVJUSU9OIEZBSUxFRCBhdCBsaWIvY2hlY2tzdW1fa3VuaXQuYzo2MTcNCj4+PiAgICAgICBF
eHBlY3RlZCAoIHU2NClleHBlY3RlZF9jc3VtX2lwdjZfbWFnaWNbaV0gPT0gKCB1NjQpY3N1bV9p
cHY2X21hZ2ljKHNhZGRyLCBkYWRkciwgbGVuLCBwcm90bywgY3N1bSksIGJ1dA0KPj4+ICAgICAg
ICAgICAoIHU2NClleHBlY3RlZF9jc3VtX2lwdjZfbWFnaWNbaV0gPT0gNjM1NiAoMHgxOGQ0KQ0K
Pj4+ICAgICAgICAgICAoIHU2NCljc3VtX2lwdjZfbWFnaWMoc2FkZHIsIGRhZGRyLCBsZW4sIHBy
b3RvLCBjc3VtKSA9PSA0MzU4NiAoMHhhYTQyKQ0KPj4+ICAgICAgIG5vdCBvayA1IHRlc3RfY3N1
bV9pcHY2X21hZ2ljDQo+Pj4gIyBjaGVja3N1bTogcGFzczozIGZhaWw6MiBza2lwOjAgdG90YWw6
NQ0KPj4+ICMgVG90YWxzOiBwYXNzOjMgZmFpbDoyIHNraXA6MCB0b3RhbDo1DQo+Pj4gbm90IG9r
IDQgY2hlY2tzdW0NCj4+PiBbLi4uXQ0KPj4+DQo+Pj4gRnVsbCBkbWVzZyArIGtlcm5lbCAuY29u
ZmlnIGF0dGFjaGVkLg0KPj4NCj4+IExvb2tzIGxpa2UgdGhlIHNhbWUgcHJvYmxlbSBhcyB0aGUg
b25lIEkgZml4ZWQgd2l0aCBjb21taXQgYjM4NDYwYmM0NjNjDQo+PiAoImt1bml0OiBGaXggY2hl
Y2tzdW0gdGVzdHMgb24gYmlnIGVuZGlhbiBDUFVzIikNCj4+DQo+PiBUaGUgbmV3IHRlc3RzIGlt
cGxlbWVudGVkIHRocm91Z2ggY29tbWl0IDZmNGM0NWNiY2IwMCAoImt1bml0OiBBZGQgdGVzdHMN
Cj4+IGZvciBjc3VtX2lwdjZfbWFnaWMgYW5kIGlwX2Zhc3RfY3N1bSIpIGNyZWF0ZSBhIGxvdCBv
ZiB0eXBlIGlzc3VlcyBhcw0KPj4gcmVwb3J0ZWQgYnkgc3BhcnNlIHdoZW4gYnVpbHQgd2l0aCBD
PTIgKHNlZSBiZWxvdykuDQo+Pg0KPj4gT25jZSB0aG9zZSBpc3N1ZXMgYXJlIGZpeGVkLCBpdCBz
aG91bGQgd29yay4NCj4+DQo+PiBDaGFybGllLCBjYW4geW91IHByb3ZpZGUgYSBmaXggPw0KPj4N
Cj4+IFRoYW5rcywNCj4+IENocmlzdG9waGUNCj4gDQo+IFRoZSAibGliOiBjaGVja3N1bTogRml4
IGlzc3VlcyB3aXRoIGNoZWNrc3VtIHRlc3RzIiBwYXRjaCBzaG91bGQgZml4IGFsbCBvZiB0aGVz
ZSBpc3N1ZXMgWzFdLg0KPiANCj4gWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI0
MDIyMS1maXhfc3BhcnNlX2Vycm9yc19jaGVja3N1bV90ZXN0cy12OS0xLWJmZjRkNzNhYjlkMUBy
aXZvc2luYy5jb20vVC8jbTE4OTc4M2E5YjJhN2QxMmUzYzM0YzRhNDEyZTY1NDA4NjU4ZGIyYzkN
Cg0KSXQgZG9lc24ndCBmaXggdGhlIGlzc3VlcywgSSBzdGlsbCBnZXQgdGhlIGZvbGxvd2luZyB3
aXRoIHlvdXIgcGF0Y2ggMS8yIA0KYXBwbGllZDoNCg0KWyAgICA2Ljg5MzE0MV0gS1RBUCB2ZXJz
aW9uIDENClsgICAgNi44OTYxMThdIDEuLjENClsgICAgNi44OTc3NjRdICAgICBLVEFQIHZlcnNp
b24gMQ0KWyAgICA2LjkwMDgwMF0gICAgICMgU3VidGVzdDogY2hlY2tzdW0NClsgICAgNi45MDQ1
MThdICAgICAjIG1vZHVsZTogY2hlY2tzdW1fa3VuaXQNClsgICAgNi45MDQ2MDFdICAgICAxLi41
DQpbICAgIDcuMTM5Nzg0XSAgICAgb2sgMSB0ZXN0X2NzdW1fZml4ZWRfcmFuZG9tX2lucHV0cw0K
WyAgICA3LjU5MDA1Nl0gICAgIG9rIDIgdGVzdF9jc3VtX2FsbF9jYXJyeV9pbnB1dHMNClsgICAg
OC4wNjQ0MTVdICAgICBvayAzIHRlc3RfY3N1bV9ub19jYXJyeV9pbnB1dHMNClsgICAgOC4wNzAw
NjVdICAgICAjIHRlc3RfaXBfZmFzdF9jc3VtOiBBU1NFUlRJT04gRkFJTEVEIGF0IA0KbGliL2No
ZWNrc3VtX2t1bml0LmM6NTg5DQpbICAgIDguMDcwMDY1XSAgICAgRXhwZWN0ZWQgKCB1NjQpZXhw
ZWN0ZWQgPT0gKCB1NjQpY3N1bV9yZXN1bHQsIGJ1dA0KWyAgICA4LjA3MDA2NV0gICAgICAgICAo
IHU2NClleHBlY3RlZCA9PSA1NTkzOSAoMHhkYTgzKQ0KWyAgICA4LjA3MDA2NV0gICAgICAgICAo
IHU2NCljc3VtX3Jlc3VsdCA9PSAzMzc1NCAoMHg4M2RhKQ0KWyAgICA4LjA3NTgzNl0gICAgIG5v
dCBvayA0IHRlc3RfaXBfZmFzdF9jc3VtDQpbICAgIDguMTAxMDM5XSAgICAgIyB0ZXN0X2NzdW1f
aXB2Nl9tYWdpYzogQVNTRVJUSU9OIEZBSUxFRCBhdCANCmxpYi9jaGVja3N1bV9rdW5pdC5jOjYx
Nw0KWyAgICA4LjEwMTAzOV0gICAgIEV4cGVjdGVkICggdTY0KSggX19zdW0xNilleHBlY3RlZF9j
c3VtX2lwdjZfbWFnaWNbaV0gDQo9PSAoIHU2NCljc3VtX2lwdjZfbWFnaWMoc2FkZHIsIGRhZGRy
LCBsZW4sIHByb3RvLCAoIF9fd3N1bSljc3VtKSwgYnV0DQpbICAgIDguMTAxMDM5XSAgICAgICAg
ICggdTY0KSggX19zdW0xNilleHBlY3RlZF9jc3VtX2lwdjZfbWFnaWNbaV0gPT0gDQo2MzU2ICgw
eDE4ZDQpDQpbICAgIDguMTAxMDM5XSAgICAgICAgICggdTY0KWNzdW1faXB2Nl9tYWdpYyhzYWRk
ciwgZGFkZHIsIGxlbiwgcHJvdG8sICggDQpfX3dzdW0pY3N1bSkgPT0gNDM1ODYgKDB4YWE0MikN
ClsgICAgOC4xMDY0NDZdICAgICBub3Qgb2sgNSB0ZXN0X2NzdW1faXB2Nl9tYWdpYw0KWyAgICA4
LjE0MzgyOV0gIyBjaGVja3N1bTogcGFzczozIGZhaWw6MiBza2lwOjAgdG90YWw6NQ0KWyAgICA4
LjE0ODMzNF0gIyBUb3RhbHM6IHBhc3M6MyBmYWlsOjIgc2tpcDowIHRvdGFsOjUNClsgICAgOC4x
NTMxNzNdIG5vdCBvayAxIGNoZWNrc3VtDQoNCkFsbCB5b3VyIHBhdGNoIGRvZXMgaXMgdG8gaGlk
ZSB0aGUgc3BhcnNlIHdhcm5pbmdzLiBCdXQgZm9yY2luZyBhIGNhc3QgDQpkb2Vzbid0IGZpeCBi
eXRlIG9yZGVycy4NCg0KUGxlYXNlIGhhdmUgYSBsb29rIGF0IGNvbW1pdCBiMzg0NjBiYzQ2M2Mg
KCJrdW5pdDogRml4IGNoZWNrc3VtIHRlc3RzIG9uIA0KYmlnIGVuZGlhbiBDUFVzIiksIHRoZXJl
IGFyZSBoZWxwZXJzIHRvIHB1dCBjaGVja3N1bXMgaW4gdGhlIGNvcnJlY3QgDQpieXRlIG9yZGVy
Lg0KDQpDaHJpc3RvcGhlDQo=
