Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A20FD69B104
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Feb 2023 17:34:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PJHSt3wm0z3fZq
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Feb 2023 03:34:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=X4v8QMDR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::625; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=X4v8QMDR;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20625.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::625])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PJHLm1hCvz3fRH
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Feb 2023 03:28:47 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hcLioOrgOahcAakkqdrZHUUTJS78G263eeP6B6tBdsbVrbR8RF+PS6ZjUkhGvH6cAnlSLUG21hTxnpxtdE+598tMowGpIiaH3BHHz34iN83hJRbuaZuM/wda49QrLFpqLA3mbf7iXnD0yMpohMErU4TC2kr+NhNQWwrBMiB2hqKW+CNuLrF3hpYgam+4CL++OHXRsvF+F/MYHZsSo+gaxF/OYLo16ahJO8k7QI4bliw/qqEEZhSFdt7usKrOQKv8E2eW/T0GXNQXK27hXYbNtPspvadLt/DG5kQ7ApZJ6tGG+DCdOD1pDA9kbei9iKRWGNSWxpGEVJu/DeK+tlFLzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WKieBRSBJrjk5FSiZ47q4SAGQZNjv472aqoX8tqKfoA=;
 b=BXFrke5D4pIMoaqerzSimU/cjowPhme3OqgjSJJdYM04lcjFvZ2843LWBtnTGL+iHWLG0HS25iFzYvLT/pHLkCu6gZDDrRSd4rNqRtupBC5uEX1fhaQr0umMRvQoTQESNkBCyV6h4+KRryLZlv2sZ7mg+u+dqbjbeUkuGrGfcm3U4JgQZXKNykzXUToP5MJXMgA2eQe48tx0DNIp0lhYRWyAQKuyVWfgbnJYh35s4xWSU19YmrXOO35+s9nhkH7TuJ3mYzXliMQgOaLA4VNcqPfp1sNlPfLzyHrfzJnFZctQzTVE6XHcY75i2mj92nwSP2+o4DeTY7vRT0oc72zFpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WKieBRSBJrjk5FSiZ47q4SAGQZNjv472aqoX8tqKfoA=;
 b=X4v8QMDRkcsuzKbHY2D634IZOzRIHmrNjDmJhhbgdA3pNhcWmzMEYza0xyiFGHSwOO/bUZ8OstHWVWcjKFvN+uTaDXEKS6yloqpAAfwUo5+wbJ0D/QTnqcEuTqBlRcrjsXFynCDS3PRhpdVR/AIELbcYGsPL7QMn6urPU+eM26a2+NzbSlq/UUuF79gIHYtiZEZ1nZ6wd50QfjXfcLd+PgvuZAkeM0k2oFuUrY5T0G7/J2qSGWWaHAYHsVyWtFVZBJ1FAvEZijDY65Y/AkqaKIWw/3BfQyMHZm6YJgypW/lejjMCN5Yi+HkpnA6fJZFIcADiooKGgWETz4NNBoblgA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB3137.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.13; Fri, 17 Feb
 2023 16:28:29 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097%4]) with mapi id 15.20.6111.013; Fri, 17 Feb 2023
 16:28:29 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Herve Codina <herve.codina@bootlin.com>, Li Yang <leoyang.li@nxp.com>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>, Qiang Zhao <qiang.zhao@nxp.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Shengjiu
 Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam
	<festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>
Subject: Re: [PATCH v6 07/10] MAINTAINERS: add the Freescale QMC controller
 entry
Thread-Topic: [PATCH v6 07/10] MAINTAINERS: add the Freescale QMC controller
 entry
Thread-Index: AQHZQuAffK6t6holaEyMZEs+dn4s1a7TU/gA
Date: Fri, 17 Feb 2023 16:28:29 +0000
Message-ID: <f32e4d60-8220-3bcc-d0a4-c7c1090493c7@csgroup.eu>
References: <20230217145645.1768659-1-herve.codina@bootlin.com>
 <20230217145645.1768659-8-herve.codina@bootlin.com>
In-Reply-To: <20230217145645.1768659-8-herve.codina@bootlin.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB3137:EE_
x-ms-office365-filtering-correlation-id: 1354fce0-0353-4962-0e01-08db110400d8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  CgJAQ2C/PfUTHWJiW289STSeSGm5nEIE8/pcthR0X8Laf1cziGRHiCVN0QiarS7O7iJ8WR6xtGJd5yUA4qZzAeMqgpSKPLutlY8FUwOfKJYBpvrh8Ilfpg58C6fg9gAPSuaJuxExC+mFJ/l5+dOQ3EsteFkwMND96ElLXl4IPWaSyyldaeGpMOXIdIh6EwWkzjvADcVJAdZGahSQ2b+3yVa0/hhnO3nyBaKYozyKn2vUwHMXe4vJMCe75ZWGf9TfD9JfaC+ScDZapgIIZAhz1ZKCTSKIwYW9tiXgPbEAPvtxP8TF3vSMe44ILlaDyLB7PtS7XZxNfYEyJRlw3BKqmP8kJh8YBJcPNswL8OiCzJ7H55EGl4W8sY18bYU6PVAm9UGReqy5mPp5rKUt7PYVg8DXRYRS2o0BjAs8DgGtlf4K5jkcxnRTT4hdKMVBgoZ42tJN1sdwREU5u6kfpC3Kn+NjcKTDICnXvRYXwcaPapjW9tj+NGAi6AX3W5kHMcOeX99WZxx4+T4xiktim3DOCa4yQX9PU81EgF/xgsvC/Ec9q6ZaaPOAlmJtIAWjJzPCSm+Zca1vxHAGmZ8BkB/zQ9mYr1NBCHH9xUQG2k5Q+fzkpBPzVKOGOCVnUjmiIGcM4wRKuTlnIXzEYYI8qYl18/BJBoJDlRB4ltAsmLvAtha1BbPGq6i42YAaW4dRemLuAq1217LLFVgUnz/dUyqeIHGGDOrVbVOny9t+a8Vb9Jh/HhjcqdLsYBs2vh6ThCMoQliRcF6furGoZsGbyOsib8KsU2bu8A0ShGhyxsZN4h8=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39850400004)(136003)(346002)(396003)(376002)(366004)(451199018)(2906002)(44832011)(31696002)(86362001)(4744005)(36756003)(2616005)(38070700005)(122000001)(921005)(66556008)(91956017)(76116006)(64756008)(66446008)(8676002)(66476007)(54906003)(316002)(110136005)(7416002)(41300700001)(8936002)(5660300002)(4326008)(66946007)(38100700002)(26005)(6512007)(186003)(71200400001)(478600001)(6506007)(6486002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?bFRjZjZ6NkNWWEVqZFJiMzBsb25mamw2enZ4NTdDcjFDWk5EMjljTXB0NDdR?=
 =?utf-8?B?bXBxVERweW00eGVRRnVBekc1b2hDS1pUOE5FSHNERGRWVVd1SmFwSXgrN2RX?=
 =?utf-8?B?c2hzdFRZamtRR1pIZlc2aERxSXFsa05waGZaeTJzMEQ3NS9aQ0t3dEVvRm9Q?=
 =?utf-8?B?VHNVYzlxbEJrR1hmek8vVjJqSjdVblpJWWs3TE9TK1M2UFd5VVBmeXcxa1B1?=
 =?utf-8?B?a3RlVmVXQTUyT01QZGcrRm5CYXdDa2JHVUlTeXR3ODhqVUJUQldSeDVXR3lr?=
 =?utf-8?B?WGNEeEtOK1pPS2VRRjk1SkU2OXZmcmRBbnJZeVFOS21PdjdPdEd4NUNqUWs4?=
 =?utf-8?B?SFhpVVZwMUJJbTN1LzUxYTdpWEJiTUFTaVViVUlzbWVPU1FyM3l6NU5UbDR2?=
 =?utf-8?B?VXdTcnp5Yld1MnlIc016WkFVdHlOWEliM0RRNWJoZHU5TDhybnp6RlVUL3Qx?=
 =?utf-8?B?RitLM09WQmZ3VHFva0MveWYxZEt2UkMrVkpzODBJSEhYenhGQTBUZHFJb0ox?=
 =?utf-8?B?UzAzVmtlU1FmbWNsQ3VHTlVDanU4UnBNNXBLZWRPOU5sWWVxKy9NeFdrS3JQ?=
 =?utf-8?B?Y0Y2TWI1bWhHaFBrUklSRVFHMDN2Rnd1UHBWMCtQdVc1UW1tSFpnUmtXQW9I?=
 =?utf-8?B?YnNKeWR2SG5VdXUzZWwzcFdoMzJ1OGtod1d0V0RxWnIvTFlIMTJxWmg0N3lE?=
 =?utf-8?B?SmdCQVVhNlNCV04wZDQ5YUlDVE83bzFRQWo1aGdhUkx5akdHdlRaZWVHR2xq?=
 =?utf-8?B?OG10NjdwbG5CR05JUDdSbGtuaXlPRlErdXBKZ0xWMWxTL1pmVk9OZ2M4MStD?=
 =?utf-8?B?QnhKeTg1ZlNXb0grK1pwMDBRcXIzL1FITHl6alBEQzhTckdTQUhUVCtKWHds?=
 =?utf-8?B?RnorcDM5UVRnaHczdFZWZmIzNllhS3RtSXlTN1crV01xWkdvb3l6bVdHQ1J0?=
 =?utf-8?B?SmZzb2NCTjNEdmlRTit1N0NkSHJFK1pReUNTNHpBYzBQRXJlVm11dEw3dHJ3?=
 =?utf-8?B?Z0Y5dUEwZmN4MlpiTXRXWjF2ZFc3SmRHTGJoa0g4UHMvaUhMRlIrOUl4WVZ1?=
 =?utf-8?B?YXNndzBJNjNDQVJMV3RWOE5WWDkrbkhDZ0JHMUZTdWxPWE9iand6cUhEcnBk?=
 =?utf-8?B?M2pUNkE4Yzg0TnBtRnFnekx0clRVdUJKczFEWFVBVDh0dkhjcFlSZmp6U3RJ?=
 =?utf-8?B?UFd6QXc3dzhGamdaOXZTMjY1UEtxZWVQblJpRXljLzRpWENSNFhBZHFaN1ox?=
 =?utf-8?B?cER3VUhNTjhldGhPYUFtcXBoRVlWa1pjYjUvQTRkWlVST0xBTWNuQXg5WjVn?=
 =?utf-8?B?L1JQeHJjd0FLTTcxa2pGbWgxTnVqY2pCTkpZVXdLMHdISVF1bFp4TzBiTFlV?=
 =?utf-8?B?VmhFM0FCaWl5RmFwYmxyMUluUDk3ZEFpNVhjMVJZZTZnMHZBVU1NeGtHNDdy?=
 =?utf-8?B?T3BhRkNRdG45MXVFZGVFZkpnZTJkNTJCN3BFYStJRCt0S2hqY1k5bndPdjBJ?=
 =?utf-8?B?aWdsRUJkY1pBSDJYK2R2ankrOW1wYitvTEJPNXF4TEhKSGlyZHdTa0U3TlZs?=
 =?utf-8?B?TmNjdnZ1UUFQczRyVjkyZ1dWalNRUTh6S0dFRWtoc2RhV1pqNzVRMm1BdXFT?=
 =?utf-8?B?SERVNzc3YTkrMGxGcHIwMlFMd3hpaTB5aUxNNUNWV0VSWStGN3Z0cEN1MWpN?=
 =?utf-8?B?UDZsYUpGVCtoTEFuTGg5VjZ3WHk2ZU9FaFo0SVR6dytqdGFSV1cxUnZKeGtM?=
 =?utf-8?B?UHFsOUljMHYxL3dsemV3a1NyREpOaHZpNjIvSFZ5bzEraUx1TEExeWVsVDl4?=
 =?utf-8?B?a0gvdGtXNDBhNjlUNWZYT1FQNXA2dVJ2WTVqR2liMEMzWDZwK1k5c1R0TVVu?=
 =?utf-8?B?ZUJTTVc4cXBnRjBDZjF1RUNIMzVzdUZhbHQ2UEZnY0xPbWNtdGJkbGVyM00v?=
 =?utf-8?B?ZlBCeWErZjg2SUNDcGhqb1pTYlNyZmlnUGNpekhVZEM5a1BOSktLVXlmdWNJ?=
 =?utf-8?B?U21uTERtNjRBR3drdzVTcm55RWNPVU8rOFg4NkVBQ091cEVlLzF2NUxtUjBi?=
 =?utf-8?B?WUFBNHJVdW9iQXRzWFhpdVBEcVFHNHBneDV0U3lacElONHAzb0M0QTBUNkpZ?=
 =?utf-8?B?M3RFajRDSmJtMHFKY2FJZWdVcDY0YW41QUVDMUlBeEZxdmJnejFnSlliRHJo?=
 =?utf-8?B?Rmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AF0323CF55A35E4D87A7178BCBC71F17@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1354fce0-0353-4962-0e01-08db110400d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2023 16:28:29.4289
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CoXEwm7YSM96Tf39A+OAGj92ul3fDpkhXapafaKqVx3t56f70tC/de2DKZg3e55qtJ6LegcZgTivGmtxPDPyqLhhiMUtZmUqni5IwO2kDvU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB3137
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE3LzAyLzIwMjMgw6AgMTU6NTYsIEhlcnZlIENvZGluYSBhIMOpY3JpdMKgOg0KPiBB
ZnRlciBjb250cmlidXRpbmcgdGhlIGRyaXZlciwgYWRkIG15c2VsZiBhcyB0aGUgbWFpbnRhaW5l
cg0KPiBmb3IgdGhlIEZyZWVzY2FsZSBRTUMgY29udHJvbGxlci4NCj4gDQo+IFNpZ25lZC1vZmYt
Ynk6IEhlcnZlIENvZGluYSA8aGVydmUuY29kaW5hQGJvb3RsaW4uY29tPg0KDQpSZXZpZXdlZC1i
eTogQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1Pg0KDQo+IC0t
LQ0KPiAgIE1BSU5UQUlORVJTIHwgOCArKysrKysrKw0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA4IGlu
c2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJT
DQo+IGluZGV4IDA5N2E4MGQ2NjIzYi4uNDdlY2E1YjA2Y2NlIDEwMDY0NA0KPiAtLS0gYS9NQUlO
VEFJTkVSUw0KPiArKysgYi9NQUlOVEFJTkVSUw0KPiBAQCAtODM3Miw2ICs4MzcyLDE0IEBAIFM6
CU1haW50YWluZWQNCj4gICBGOglkcml2ZXJzL3NvYy9mc2wvcWUvDQo+ICAgRjoJaW5jbHVkZS9z
b2MvZnNsL3FlLw0KPiAgIA0KPiArRlJFRVNDQUxFIFFVSUNDIEVOR0lORSBRTUMgRFJJVkVSDQo+
ICtNOglIZXJ2ZSBDb2RpbmEgPGhlcnZlLmNvZGluYUBib290bGluLmNvbT4NCj4gK0w6CWxpbnV4
cHBjLWRldkBsaXN0cy5vemxhYnMub3JnDQo+ICtTOglNYWludGFpbmVkDQo+ICtGOglEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc29jL2ZzbC9jcG1fcWUvZnNsLGNwbTEtc2NjLXFt
Yy55YW1sDQo+ICtGOglkcml2ZXJzL3NvYy9mc2wvcWUvcW1jLmMNCj4gK0Y6CWluY2x1ZGUvc29j
L2ZzbC9xZS9xbWMuaA0KPiArDQo+ICAgRlJFRVNDQUxFIFFVSUNDIEVOR0lORSBUU0EgRFJJVkVS
DQo+ICAgTToJSGVydmUgQ29kaW5hIDxoZXJ2ZS5jb2RpbmFAYm9vdGxpbi5jb20+DQo+ICAgTDoJ
bGludXhwcGMtZGV2QGxpc3RzLm96bGFicy5vcmcNCg==
