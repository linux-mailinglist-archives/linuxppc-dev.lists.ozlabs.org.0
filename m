Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5257E2487
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Nov 2023 14:22:47 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=itOZUvm9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SPBq967D6z3c5P
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Nov 2023 00:22:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=itOZUvm9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::62c; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on2062c.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::62c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SPBpG2Y3gz2xdg
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Nov 2023 00:21:56 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L7a4zc2qJFIJ/xPHlrOckFXnlCQRQ+lgtPuTuPhaUZPMAhpt6pNdKtiqMQE5Mrix04nIXJlF40PGYtbE5zZClfBiup7x9OlqFduY40zVcv1DPAjPELVlF5chp++L0vQBX7ZPdexIZx0CjYC//y9n6op/sAeKTiDXmNdxjZvNUAB/lqhmzpBxLce0sJOCDYc2hn+DyA30GtyBzPB9HrCPUeZSWX2Iy5yUB/QetSVy/Rv07Aomr5Yuqvf/9NULlkSTOYU6EK91grGrEcESELVKYm3g1au25PQBRCNUpTisOHQv5DdS9WkdGN+NqNlcmtwowPvWVAx8Z8L//iOlV513tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cB92qcxQKlSPez39+BGk5Lu5c1Q+k6KOHIoeyZBJVFc=;
 b=ZWlOxSTLQxWU1/X/Se/Pa99R5gg2m6Y5PGgZko9cQYheT352b8Ee+PNEUC4lzJKaaheGAZRGYmWFt8wNImScoZx9BZoO+njDmBmfatVfauGtX4UQVJnfi+tRYr2QGoi3umyrjQWe3vyYooOEANlnrek8G+q1znTlS3RMhG9TzGOLdL5++qseLgNUrFFoGQn4CYJi+Tb5/G7f69bHRKk+pQLWJpPSLr34LNBxjleEjJVbjIB3E/qbh+4X6jtF+jYT/eqLajnY6FF3PraUCjU8+ZcVb6OXrlBSQDW3uXHNRZrTJYKF4RacTWKT8fj7NjXNdFRb4tT0hAS+eeZY46AZjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cB92qcxQKlSPez39+BGk5Lu5c1Q+k6KOHIoeyZBJVFc=;
 b=itOZUvm9ywP+/iQlX0Y4GMNYf9bSHgCtdgdeqWVmyMEhhOp54dbgoltfDmQIwZckx0JhnonlvO0YBsgyKDGekS6NAwsW1Gvbhpc02c8DEWQufoiUS7MCNu4QYqRWlrbN8OnrjjVHzSLBkCk81M3OJiR2h+Gu50f9O2acBvwZwi7oyhGcLc4k3p5JQYY/vu4edrp8ICNu0J3kgPwbSIQKy1PfDf9qYgR+4Uo5TT8LHp0jl1wZrm7IhQeorN9x2FUFP7xpCw1qZY5tmxVzfvt1wm2bw0igqdYbfd/Np2REhtZ7qwMuwWMSJBG/3VV1OJyXMKxhNcV0oigyb6MqsT362A==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB1536.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1b6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.16; Mon, 6 Nov
 2023 13:21:32 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5bfe:e2f2:6d89:8d97]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5bfe:e2f2:6d89:8d97%3]) with mapi id 15.20.6977.016; Mon, 6 Nov 2023
 13:21:32 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>, Michael Ellerman
	<mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 29/37] powerpc/nohash: Replace pte_user() by pte_read()
Thread-Topic: [PATCH v2 29/37] powerpc/nohash: Replace pte_user() by
 pte_read()
Thread-Index: AQHZ796VGrFRjZzNY0e1MZG5pRhZKrBj5oQAgAmiDwA=
Date: Mon, 6 Nov 2023 13:21:32 +0000
Message-ID: <02c4b724-f503-31ea-eb77-4b3cd6776fd8@csgroup.eu>
References: <cover.1695659959.git.christophe.leroy@csgroup.eu>
 <72cbb5be595e9ef884140def73815ed0b0b37010.1695659959.git.christophe.leroy@csgroup.eu>
 <877cn39jyp.fsf@linux.ibm.com>
In-Reply-To: <877cn39jyp.fsf@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR1P264MB1536:EE_
x-ms-office365-filtering-correlation-id: 3b375f9d-03e1-47ae-4463-08dbdecb4b40
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  ebloSH0Nfr8qlL4RSvCcEVdAkOcxKme6/XHhjGCckQ+8eUJBAaAYPNVFeNnYTFnpoBZW1wWOKDSJ9jLYflYFSz4O+YaKkMmKIca1t/fkfd1ZAAjFc07zY5kWw4RTfP+P2T0dKpl9K3ariwq1YT2HEn00qMC+TPjirCHyqcCfuZyMvHZL5kiGhfiUMb0ojSz5OO58S9LezDoS0xiG0oCVKkIYM3ZS41Rq0r6bSYnd7ny4LGjpSr9+13sNPzllCC5hAwdH/QUqmmnXvO+AwDC7/PfahC6g6sNxQEiEt+tmeS7a7igOBExK3xz9q6qkur3uc1oQzPYq1eFLin0gBqSyQYa8qd8LSONSxFMp+l6nMKnDEUNxVlkMS3yzJqHbTp8prLvUvFNSJdz+eJk2JzzDukEzgiPt57OifTAlM78BHkNj4gDJWh3GWTM1DiErlebeBDL378tulhh+qOuACup9tYqFxCSXsXdeuVpfk9N6OAI7NDvTNpgloGNLj4FxWUlrFzRhRnPIQ/kauy5xvq50jj/ZMvicOYNBC+544LHEojJhT7Q2yh2xGUid39h6KZ+oOBwmNti2is4DbmUQ6dzLcYj1Qpbku10TGoA9rYcwD7ZFWkliMECUxF63XHEAqg02JJ9Zuho5FlJWJLPIfTXM3fAx6HP03T3RrMr0ViVENgDeMQ1VcVeQCHRWAKncE7QC
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(136003)(39850400004)(396003)(366004)(230922051799003)(451199024)(1800799009)(64100799003)(186009)(31686004)(83380400001)(6512007)(91956017)(110136005)(66946007)(76116006)(26005)(2616005)(478600001)(66574015)(6506007)(71200400001)(8936002)(8676002)(4326008)(66556008)(66446008)(64756008)(54906003)(66476007)(316002)(44832011)(6486002)(5660300002)(41300700001)(38100700002)(122000001)(31696002)(86362001)(2906002)(38070700009)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?dW1FNm02RFhyZ2hFODE3YWJrK1orKzVjc1p6bFErUjVHUG1DWEdLeTkxdDh4?=
 =?utf-8?B?Q2VjL1BLYVJ0czBmcTF1R2RMcHc1Yzc2aENaRWpsQWhvQ1UyeTQweDNYWlNw?=
 =?utf-8?B?QlV0dlhKemVHdVUwa3RyMmxTVzg0ektib3F6QURjbzhWbEhTdytSZ2d2N3Ns?=
 =?utf-8?B?ZHBqUmJXVG5tYUQ2eklvOUZzUWNiOS9RK3dLSlljd3Bra0RlTCtId01CR2hS?=
 =?utf-8?B?cWI0N244c1FoTytGa0pGNHUzYjJoNlM0cFYrdGw5MWRzOE5Genh2cDV6RjZ4?=
 =?utf-8?B?ZFFtRzFjRk85QUxVMnA4WG40WHBhdEtua2tpMG01dFA5TEMwaWt1STdkcDc4?=
 =?utf-8?B?SFBWSTdDU2Q2cVV4T09BNDNqQjcrai81ZXBic3h1YkpjK3cxY043ZS9YOW04?=
 =?utf-8?B?eitFdzIzcUJTZnNlaURQVW0zeHhXa0RaVkZxWW51Q3kyQmwzaEZNMzJ6Ukx2?=
 =?utf-8?B?d0NtbXVkQlRZVTA3MlZCbU51cnBUUFZRZk9PZWJiKzJ4RWVWa0t1clI5Wjhr?=
 =?utf-8?B?RmdxTm9zS3BCSjNZanFibTJCeTNCOE5xS3N5NW82S1RMRzdTdVlRR1JWa1ln?=
 =?utf-8?B?cHBjZ2lycW5WTU9ub0x1c1orclhZYVZYS1lSU2RwWnpIZ3JZSzBpV3lqbHdu?=
 =?utf-8?B?ZzZpSVNYd0FrNFh5K0dtSGFkSlBWMlRBOFZncld6aW9ZMkF6WHhsZERwakpE?=
 =?utf-8?B?VlVhcFFJczNpV0NWYVQzNDYrVjByeDRnUWZQOHAxUi9kZjlldHAzZ1hFWEh6?=
 =?utf-8?B?eW1ZcCtlKzNiV3ROanJkeWFDQ1NtVFBuSjgrODE0SFJqOFA1d1ZFcCtLcVVs?=
 =?utf-8?B?UzJSYUNUQW5WSzliejd3c0E3OTBUdDYxV0tFUERmYmhPekEybmhvWDdHbWFV?=
 =?utf-8?B?K1QvUUxLalcvNjZBYzFCNjV2RHhWTEhBV3NzMGdKRXB4ZzJOaExqeldIRFcy?=
 =?utf-8?B?VWxzaFJOV0pkYldDRzE0VWJIbWFHZERxYnVtbFU1MXBybmtUSS9Ld2VHZ0tt?=
 =?utf-8?B?K3I5Smh4WVVXTUhHeDR6Wm9sMU1BelVnV0l3eXU4bmlxcmRKVTVjdmhydTlB?=
 =?utf-8?B?SkgrNDdFWHZxa1RIS21qOEt0VGVWMjRaVzdnNUNka2RTZzA0dUtPRWdPMHlz?=
 =?utf-8?B?akEyenhqMGJmM3pUYmhka0xQMUY3ZDdJMkhSSjRDUUE3NzRzdEFsMUorWDZi?=
 =?utf-8?B?WU5tZEVabHRUbXNnalpCUkk4UDZvMUlsNTlJNVcySkZ2THdMT2t3Y1lPNTcv?=
 =?utf-8?B?NmJ5UzFuSm50WHV1Q1d5TkF2dG5sRkhUNjhaWU1nUUoyMHBCTXE2NGtRNjYy?=
 =?utf-8?B?a0l3cnhOeUsyeDJsN3ZzT2tHZ1RsaE12Q2ZFeXZ3TC9GU2l4V291ZHZDSUJU?=
 =?utf-8?B?YkFzakNnT0VVbVNHK3VzSmFtVkRjNFdsaWZNTkFkdHcyYkM1Y2t6UHRFRUtl?=
 =?utf-8?B?ajRUNmRpN1U2ejRGaE92MXpjKytLZVVuQ3Y5aVl4aDl6cTJPam1qd1V5bkh2?=
 =?utf-8?B?SXRLMlNYM25qTTBEcFhtckttbGZ4NG9YUGxnRmJMSnhOSnlqdUoxR1lLeU1O?=
 =?utf-8?B?RVJXUVVIejVqNUV4aTZIUVhnalAwK2d6dG9HelArNDlnUy9idEZCQWw1VDV0?=
 =?utf-8?B?VmlEa21NeUFaZll0SnVmTTdzTGpsK3dZYTU2eGlZcnI5SndNMDMzYnl4YklW?=
 =?utf-8?B?WVZ0cHRyZ3VXWXVTeHNxM1lPSElRR1B2cGJFY2RrLy9zcFZoc1dsdmpldDQ4?=
 =?utf-8?B?SHJVWEtXenZFeG5sRG1FbjZQZFc2QTNuYTVSVGtxN0hCRjdmOENNaHdVNWpC?=
 =?utf-8?B?R0NmN1Q5djJWbC9BMWpoY1pNVTVqWFpvQ056c3hGaXZYMnVpQmx4SUJjeWhW?=
 =?utf-8?B?Tmd5YzY0QnlmNE1jT2FwS29RUVBiVHYvczNZc2dDQWs2elpTNGdaQ214aEdP?=
 =?utf-8?B?bFZ0WExVV21mOU00Snh6VXdNaVI1RUlPbDNoS0NJOGx3WDdZZXNGcVZBTHQz?=
 =?utf-8?B?OXJmVHpQS1dmdGpxNFN1dzNkcVVqK0hDRXFwa1h4Q1pjYzZvR1NIbVM1QVY1?=
 =?utf-8?B?RUk1TGxDKy9PeE9wM0FQNXF4NUE0eTYvcTRkcWpEMmJpTGxQR3h3NXpnaW5R?=
 =?utf-8?B?QVc0VDJjYnlGeEFma3p6Z2NrWHo5OFdFOTVXZXNQam91TUJrbDRDS1lIcVZn?=
 =?utf-8?B?dUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A7EEA109CF0068458BD9123CCD10D5BA@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b375f9d-03e1-47ae-4463-08dbdecb4b40
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2023 13:21:32.5238
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZCTJ0719I4llRJBOnUONRvHn8l36Y0Bj/ko5XV8cemGfQ5OIT8U61pAQJyd0vpLCQn4XbTZ32sHFWvgN6DeA5Lwa63GDD23tgVsAzRkuQ3Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB1536
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

DQoNCkxlIDMxLzEwLzIwMjMgw6AgMTE6MTUsIEFuZWVzaCBLdW1hciBLLlYgYSDDqWNyaXTCoDoN
Cj4gQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1PiB3cml0ZXM6
DQo+IA0KPj4gcHRlX3VzZXIoKSBpcyBub3cgb25seSB1c2VkIGluIHB0ZV9hY2Nlc3NfcGVybWl0
dGVkKCkgdG8gY2hlY2sNCj4+IGFjY2VzcyBvbiB2bWFzLiBVc2VyIGZsYWcgaXMgY2xlYXJlZCB0
byBtYWtlIGEgcGFnZSB1bnJlYWRhYmxlLg0KPj4NCj4+IFNvIHJlbmFtZSBpdCBwdGVfcmVhZCgp
IGFuZCByZW1vdmUgcHRlX3VzZXIoKSB3aGljaCBpc24ndCB1c2VkDQo+PiBhbnltb3JlLg0KPj4N
Cj4+IEZvciB0aGUgdGltZSBiZWluZyBpdCBjaGVja3MgX1BBR0VfVVNFUiBidXQgaW4gdGhlIG5l
YXIgZnV0dXINCj4+IGFsbCBwbGF0ZWZvcm1zIHdpbGwgYmUgY29udmVydGVkIHRvIF9QQUdFX1JF
QUQgc28gbGV0cyBzdXBwb3J0DQo+PiBib3RoIGZvciBub3cuDQo+Pg0KPj4gU2lnbmVkLW9mZi1i
eTogQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1Pg0KPj4gLS0t
DQo+PiAgIGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ub2hhc2gvMzIvcHRlLTh4eC5oIHwgIDcg
LS0tLS0tLQ0KPj4gICBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vbm9oYXNoL3BndGFibGUuaCAg
ICB8IDEzICsrKysrKystLS0tLS0NCj4+ICAgYXJjaC9wb3dlcnBjL21tL2lvcmVtYXAuYyAgICAg
ICAgICAgICAgICAgICAgfCAgNCAtLS0tDQo+PiAgIDMgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRp
b25zKCspLCAxNyBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBj
L2luY2x1ZGUvYXNtL25vaGFzaC8zMi9wdGUtOHh4LmggYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9h
c20vbm9oYXNoLzMyL3B0ZS04eHguaA0KPj4gaW5kZXggNjJjOTY1YTQ1MTFhLi4xZWUzOGJlZmQy
OWEgMTAwNjQ0DQo+PiAtLS0gYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vbm9oYXNoLzMyL3B0
ZS04eHguaA0KPj4gKysrIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL25vaGFzaC8zMi9wdGUt
OHh4LmgNCj4+IEBAIC0xMTIsMTMgKzExMiw2IEBAIHN0YXRpYyBpbmxpbmUgcHRlX3QgcHRlX21r
d3JpdGVfbm92bWEocHRlX3QgcHRlKQ0KPj4gICANCj4+ICAgI2RlZmluZSBwdGVfbWt3cml0ZV9u
b3ZtYSBwdGVfbWt3cml0ZV9ub3ZtYQ0KPj4gICANCj4+IC1zdGF0aWMgaW5saW5lIGJvb2wgcHRl
X3VzZXIocHRlX3QgcHRlKQ0KPj4gLXsNCj4+IC0JcmV0dXJuICEocHRlX3ZhbChwdGUpICYgX1BB
R0VfU0gpOw0KPj4gLX0NCj4+IC0NCj4+IC0jZGVmaW5lIHB0ZV91c2VyIHB0ZV91c2VyDQo+PiAt
DQo+PiAgIHN0YXRpYyBpbmxpbmUgcHRlX3QgcHRlX21raHVnZShwdGVfdCBwdGUpDQo+PiAgIHsN
Cj4+ICAgCXJldHVybiBfX3B0ZShwdGVfdmFsKHB0ZSkgfCBfUEFHRV9TUFMgfCBfUEFHRV9IVUdF
KTsNCj4+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vbm9oYXNoL3BndGFi
bGUuaCBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ub2hhc2gvcGd0YWJsZS5oDQo+PiBpbmRl
eCBlZTY3NzE2MmY5ZTYuLmFiYTU2ZmUzYjFjNiAxMDA2NDQNCj4+IC0tLSBhL2FyY2gvcG93ZXJw
Yy9pbmNsdWRlL2FzbS9ub2hhc2gvcGd0YWJsZS5oDQo+PiArKysgYi9hcmNoL3Bvd2VycGMvaW5j
bHVkZS9hc20vbm9oYXNoL3BndGFibGUuaA0KPj4gQEAgLTE2MCw5ICsxNjAsNiBAQCBzdGF0aWMg
aW5saW5lIGludCBwdGVfd3JpdGUocHRlX3QgcHRlKQ0KPj4gICAJcmV0dXJuIHB0ZV92YWwocHRl
KSAmIF9QQUdFX1dSSVRFOw0KPj4gICB9DQo+PiAgICNlbmRpZg0KPj4gLSNpZm5kZWYgcHRlX3Jl
YWQNCj4+IC1zdGF0aWMgaW5saW5lIGludCBwdGVfcmVhZChwdGVfdCBwdGUpCQl7IHJldHVybiAx
OyB9DQo+PiAtI2VuZGlmDQo+PiAgIHN0YXRpYyBpbmxpbmUgaW50IHB0ZV9kaXJ0eShwdGVfdCBw
dGUpCQl7IHJldHVybiBwdGVfdmFsKHB0ZSkgJiBfUEFHRV9ESVJUWTsgfQ0KPj4gICBzdGF0aWMg
aW5saW5lIGludCBwdGVfc3BlY2lhbChwdGVfdCBwdGUpCXsgcmV0dXJuIHB0ZV92YWwocHRlKSAm
IF9QQUdFX1NQRUNJQUw7IH0NCj4+ICAgc3RhdGljIGlubGluZSBpbnQgcHRlX25vbmUocHRlX3Qg
cHRlKQkJeyByZXR1cm4gKHB0ZV92YWwocHRlKSAmIH5fUFRFX05PTkVfTUFTSykgPT0gMDsgfQ0K
Pj4gQEAgLTE5MCwxMCArMTg3LDE0IEBAIHN0YXRpYyBpbmxpbmUgaW50IHB0ZV95b3VuZyhwdGVf
dCBwdGUpDQo+PiAgICAqIGFuZCBQVEVfNjRCSVQsIFBBR0VfS0VSTkVMX1ggY29udGFpbnMgX1BB
R0VfQkFQX1NSIHdoaWNoIGlzIGFsc28gaW4NCj4+ICAgICogX1BBR0VfVVNFUi4gIE5lZWQgdG8g
ZXhwbGljaXRseSBtYXRjaCBfUEFHRV9CQVBfVVIgYml0IGluIHRoYXQgY2FzZSB0b28uDQo+PiAg
ICAqLw0KPj4gLSNpZm5kZWYgcHRlX3VzZXINCj4+IC1zdGF0aWMgaW5saW5lIGJvb2wgcHRlX3Vz
ZXIocHRlX3QgcHRlKQ0KPj4gKyNpZm5kZWYgcHRlX3JlYWQNCj4+ICtzdGF0aWMgaW5saW5lIGJv
b2wgcHRlX3JlYWQocHRlX3QgcHRlKQ0KPj4gICB7DQo+PiArI2lmZGVmIF9QQUdFX1JFQUQNCj4+
ICsJcmV0dXJuIChwdGVfdmFsKHB0ZSkgJiBfUEFHRV9SRUFEKSA9PSBfUEFHRV9SRUFEOw0KPj4g
KyNlbHNlDQo+PiAgIAlyZXR1cm4gKHB0ZV92YWwocHRlKSAmIF9QQUdFX1VTRVIpID09IF9QQUdF
X1VTRVI7DQo+PiArI2VuZGlmDQo+PiAgIH0NCj4+ICAgI2VuZGlmDQo+PiAgIA0KPj4gQEAgLTIw
OCw3ICsyMDksNyBAQCBzdGF0aWMgaW5saW5lIGJvb2wgcHRlX2FjY2Vzc19wZXJtaXR0ZWQocHRl
X3QgcHRlLCBib29sIHdyaXRlKQ0KPj4gICAJICogQSByZWFkLW9ubHkgYWNjZXNzIGlzIGNvbnRy
b2xsZWQgYnkgX1BBR0VfVVNFUiBiaXQuDQo+PiAgIAkgKiBXZSBoYXZlIF9QQUdFX1JFQUQgc2V0
IGZvciBXUklURSBhbmQgRVhFQ1VURQ0KPj4gICAJICovDQo+PiAtCWlmICghcHRlX3ByZXNlbnQo
cHRlKSB8fCAhcHRlX3VzZXIocHRlKSB8fCAhcHRlX3JlYWQocHRlKSkNCj4+ICsJaWYgKCFwdGVf
cHJlc2VudChwdGUpIHx8ICFwdGVfcmVhZChwdGUpKQ0KPj4gICAJCXJldHVybiBmYWxzZTsNCj4+
ICAgDQo+PiAgIAlpZiAod3JpdGUgJiYgIXB0ZV93cml0ZShwdGUpKQ0KPj4gZGlmZiAtLWdpdCBh
L2FyY2gvcG93ZXJwYy9tbS9pb3JlbWFwLmMgYi9hcmNoL3Bvd2VycGMvbW0vaW9yZW1hcC5jDQo+
PiBpbmRleCA3ODIzYzM4ZjA5ZGUuLjdiMGFmY2FiZDg5ZiAxMDA2NDQNCj4+IC0tLSBhL2FyY2gv
cG93ZXJwYy9tbS9pb3JlbWFwLmMNCj4+ICsrKyBiL2FyY2gvcG93ZXJwYy9tbS9pb3JlbWFwLmMN
Cj4+IEBAIC01MCwxMCArNTAsNiBAQCB2b2lkIF9faW9tZW0gKmlvcmVtYXBfcHJvdChwaHlzX2Fk
ZHJfdCBhZGRyLCBzaXplX3Qgc2l6ZSwgdW5zaWduZWQgbG9uZyBmbGFncykNCj4+ICAgCWlmIChw
dGVfd3JpdGUocHRlKSkNCj4+ICAgCQlwdGUgPSBwdGVfbWtkaXJ0eShwdGUpOw0KPj4gICANCj4+
IC0JLyogd2UgZG9uJ3Qgd2FudCB0byBsZXQgX1BBR0VfVVNFUiBsZWFrIG91dCAqLw0KPj4gLQlp
ZiAoV0FSTl9PTihwdGVfdXNlcihwdGUpKSkNCj4+IC0JCXJldHVybiBOVUxMOw0KPj4NCj4gDQo+
IFRoaXMgY2hlY2sgaXMgc3RpbGwgdmFsaWQgcmlnaHQ/IEkgdW5kZXJzdGFuZCB0aGF0IHdlIHdh
bnQgdG8gcmVtb3ZlDQo+IF9QQUdFX1VTRVIuIEJ1dCB0aGVuIGxvb3NpbmcgdGhpcyBjaGVjayBp
cyBvaz8NCg0KV2VsbCwgd2UgbWF5IGhhdmUgdG8gdGhpbmsgYWJvdXQgaXQgZm9yIGJvb2szcy82
NC4gRm9yIGFsbCBvdGhlcnMgDQpfUEFHRV9VU0VSIGlzIGdvbmUgYW5kIHJlcGxhY2VkIGJ5IGEg
Y2hlY2sgb2YgYWRkcmVzc2VzIHZlcnN1cyBUQVNLX1NJWkUuDQoNCkFzIGlvcmVtYXAoKSB3aWxs
IG1hcCBpbnRvIHZtYWxsb2Mgc3BhY2UgdGhhdCBhZGRyZXNzIGlzIG5lY2Vzc2VyYWxseSANCmNv
cnJlY3QuDQoNCj4gDQo+PiAtDQo+PiAgIAlpZiAoaW93YV9pc19hY3RpdmUoKSkNCj4+ICAgCQly
ZXR1cm4gaW93YV9pb3JlbWFwKGFkZHIsIHNpemUsIHB0ZV9wZ3Byb3QocHRlKSwgY2FsbGVyKTsN
Cj4+ICAgCXJldHVybiBfX2lvcmVtYXBfY2FsbGVyKGFkZHIsIHNpemUsIHB0ZV9wZ3Byb3QocHRl
KSwgY2FsbGVyKTsNCj4+IC0tIA0KPj4gMi40MS4wDQo=
