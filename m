Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FEA6665D35
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Jan 2023 14:59:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NsTnJ09KGz3cGH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jan 2023 00:59:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=Pbyez93F;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.80; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=Pbyez93F;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on2080.outbound.protection.outlook.com [40.107.12.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NsTmJ3Q99z2yg5
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Jan 2023 00:58:22 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P986PpkUB9zTgRgF+xMODyRrSSuziod3gfZpL+yo3GDKj25IknZ18bulStwGtggXEr4v8YBBI4dP1ouJgoNiK9zajiWXLNtF8dPigZTi9r/4hO7AqrElFrhtMKG3lQy0BJZtYfgTndhjGVtPr0lc06q+lZN/pXiy166ntF6WB/BgMpz4zvCBReDZy/rTKeSyr5YYTuWc9n91CQ68OVODGU3ldxacHjfqVsSwG/7AdnYrFrx7/XVydcHXbRjFxszHOJejxcsk2DTpx/bG8urXsku0+E7PYi1zNPlYCPQ987Cvr7gliCISVeR8aQjMZSmfz4QLUDILhG4Rnqmoqo7qEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aFoQZ7QqGItdUliW2f3ZDdeglQUUPVNkWIszkqqZoWw=;
 b=bZC9eXnBVYhEyaDRD6/erp+SKJ/qnZ/kWZNO/nM8veygAwfPX01krE8Hk3pJoreCud1ZK0Pd5S2ixjk2KMQjVEKxxNMlp/xk5wGW64obqTXE4EEc/GP9NulJnxKyUPB27XwzxbBok5FotEYecx00tNTrjxM70Bl9azVaCexXXCnIib8qnBgX7PQfN7tT7GI3azUK4QBmsZkW6gWJAIlnajvI/B0fy7lFJtS1e/O4FB7TC3ThIk8jF1DVcYkZPKA/bPRVJegAKH283NqrRArMOVKbIxCpOfkjPe+bm6q9koQ8Z+jDqVl+E+6Dd6aQdbLc18XCAt5+vkpvZcvdIDQ07A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aFoQZ7QqGItdUliW2f3ZDdeglQUUPVNkWIszkqqZoWw=;
 b=Pbyez93FHNm1CqIpVU+VMU7hi7UtOEaVgZnLJ0P4OoGnVcbWkoZ1oRXLLl4dd6gL9a1JPbrJrhJAE8//HNzBNjdpCb4ruYlC0GZzWB3drSrzodwCMCS+L4S1RrZE753jrb3zkYZZr7v92R3AiISKIGGYZnrIlkkssk0GDFVdX+QZWqJLO8wNFylwTUgAayqKIWBqpyPQaPFXBUE2JDDkNFwVCWz79ph4XbTWcQze0VfLaeXC5kElqjskFZaTCpeXFo7XJug2Ibuf8KrC3bOPabl4NrHOnbmDuyKsUdcdHfA3q3qS2PvWdJx9/leEFgA4JyQhV8T8+l8ScL3YS10XUw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2188.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:167::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Wed, 11 Jan
 2023 13:58:03 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097%7]) with mapi id 15.20.5986.018; Wed, 11 Jan 2023
 13:58:03 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Herve Codina <herve.codina@bootlin.com>, Li Yang <leoyang.li@nxp.com>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>, Qiang Zhao <qiang.zhao@nxp.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Shengjiu
 Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam
	<festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>
Subject: Re: [PATCH v2 06/10] soc: fsl: qe: Add support for QMC
Thread-Topic: [PATCH v2 06/10] soc: fsl: qe: Add support for QMC
Thread-Index: AQHZIe1KiCJWjZ4L0UmZQZF6SLJUjK6ZRZeA
Date: Wed, 11 Jan 2023 13:58:03 +0000
Message-ID: <f46eb64d-ad4c-7531-60b0-68961f171ed8@csgroup.eu>
References: <20230106163746.439717-1-herve.codina@bootlin.com>
 <20230106163746.439717-7-herve.codina@bootlin.com>
In-Reply-To: <20230106163746.439717-7-herve.codina@bootlin.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB2188:EE_
x-ms-office365-filtering-correlation-id: 8e284e4b-3966-4040-cd1a-08daf3dbdb99
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  N8BEnPwuwjhczUsY5qDW9JYWxpGJprexh+Amg+CPJWEArsZ8geVbFQAX+5RKEEtI6tO4Zi17W+P3x+Rt7zLMpsBOsfZ92WbrEOKPBPZ7bFPcOdprs5M02sviBUtgTpt6iWweuKa9GLVen8kQ36joNj+1ylfIxBlFvL3XqWsexMENB+xGjO6geBm+izCauPY68k9pj5U43J8LEWJxfZwoHJwM3AxVrkQ7oCOCdo6isGliKqd3lDPe8EaQkIisg96LOFkxGuKSTlAWCO3tYABb/AmBf0C/dnv0DI6n/ssyxNhERqNtj+TPHAu4DMvhlc1GSC1IiN+axByo9bZxpF8mA4WOVW2IXaX5JuRpwG6KF628UTm6KngcbSmY7S4dBMPdlvQ8Wmj2fleVjxYQmBJhwCNnVMkt+23kQS/nFzV52/7m3Stw8rGIxWeQAEeS6QNjIw6zpRxlXMwnVF6c8auqDIfXChuxXuf/+7E7+xaCfWlheU2c/BRZ2niqAjFS5v5oM1I0pgSFd39cxZRM+5LpeNEL5Eg0PWYnaaTVBija4PNHf6E8qfD5ReNrSe3EkqQsRp8oVGFmZq348Ok0rl7XU7Cw7M05/fWLUa1IzvLfk/EGOHDThq3QD6rnkXolwXCQI/NqoedTr3XCLfT2YbF3M/mUWs66KCIvZ9uf195udmXiD3kYyAm1q7GRiorwQznqNwMydOvyjmkkZ6g7QLP59NBaHAZaFRBK9wpL/BN+k4B2EJLNUKDkAGVuZFIUWN/EEa2Zp9D9RyKyl89QPIYuoQ==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(39850400004)(366004)(376002)(396003)(451199015)(8676002)(66946007)(31686004)(7416002)(41300700001)(2906002)(44832011)(8936002)(5660300002)(36756003)(4744005)(91956017)(76116006)(66446008)(66476007)(64756008)(316002)(6512007)(66556008)(71200400001)(110136005)(54906003)(478600001)(6486002)(6506007)(4326008)(26005)(186003)(2616005)(31696002)(86362001)(38070700005)(38100700002)(122000001)(921005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?S1hHSnYzVlhEVUQzQkQzT3NweGdNVUFZUitQb0tOeEQxTnFhYWtIU3QxNVZw?=
 =?utf-8?B?eVRBK0JUNitVcU5nNko3RkJjeU4rUFgxVUc1OWo1MXpsZTVKUGFSY21FQU9Y?=
 =?utf-8?B?M1FQUEVUMi9KZi91YzQ0bloxUUtDUjlmalZqNVVBdUJ0bGxKV0JNazFIY2Z1?=
 =?utf-8?B?NG5qcDh0UmNDQ254clBZakxDd0IrNVVxVFQ2djcyZTZyR1dTTld0Lzh0UW5w?=
 =?utf-8?B?R0o1M1pxdThNQ093TGtyL1UrckVvVldHZ2ZjU0JVSWpWUTkvdWNZS0dYY1BE?=
 =?utf-8?B?REVpd1BnSlY1enFnRGEzWGpmRW9DY0E4Z2NiamMxR1FCa3JQTi9RL2tncVRN?=
 =?utf-8?B?Q1ovUXVPNkRNOHFGTll5d3pzN3g3M2poSDBRam5odGp1Rmx0bjV0T2J0US9H?=
 =?utf-8?B?SkZQM1JOdnZBTGhSODF3VTNlQi8wUHl3dENKV0hCVGF5M0Jzb1RhcmdxYXZu?=
 =?utf-8?B?SnRnUkd6bnZqblRDb3RVTEJXQlRTNmJQanNPZHRXUi9KTmhxaHk3WnFOQkxj?=
 =?utf-8?B?MklSVXhaZ2hRL2E2QWI3dVM3ZHB4VzFGTlVMVGs1SU9VZytrblNNMStub1hC?=
 =?utf-8?B?REZqWnlxL2dVZzBvL1Jld1Q0Ym8xTGtlNkRlUTNidDIzL2tKT3cvUjhFY2R0?=
 =?utf-8?B?dzVwVUFiZzVOck5qeSs0V3RBSGQ1b0pTcU1QcVlFMmZxUkNPSWxEbUJqS1BR?=
 =?utf-8?B?VHBKbE5MTURvY3hWbWxucmlISzRLelJoVkFuL281NXdNcjZBcjh6MGo0S0s3?=
 =?utf-8?B?MFJNRktoVHZHeXdkdTBTdUlZSVF2RnJEaFRseEJGWFVaSHhCcGRnSzFaWkJK?=
 =?utf-8?B?RUdObkw3QXoyUThIZk9NdWppMWRmMm9NU05tQ3ViakFFQlgyZHlMamhqZGZv?=
 =?utf-8?B?cWFDdWwvN3dBTjFtdlJKbnFiTWJvMWR2RUl6ZEY1ejUwbnFKOGQzdHNEd015?=
 =?utf-8?B?RWhMeFZWbENBckJPVVNRcU9lcUwzcGR6UFQ5UFNDK3RRRDV0dTBXYitPRVZn?=
 =?utf-8?B?amUyNzVJdFAxcmV6VFo2QUxjQUJXR3hNbitRU28vaCtvM3hzTzE3VlFqUjRX?=
 =?utf-8?B?YnVmT0VvZ0gwcGhJb1NCWDExbXFxR1hVTXozUlR1SDl5bnJKamJuZjd4M2tj?=
 =?utf-8?B?bWdkQnk1ZkJPK005bjZ5a29iL3pXWFBHK3ZRMFlmdktnVFJlSHBjdi9RNmhh?=
 =?utf-8?B?eUpac0NSSzZLcG9CQVAzZVhWSEdySWxHd0FIUlF0akZtLzZFMVhRN201Z0VB?=
 =?utf-8?B?QmpWbXd6N01uaGp2UU1mbzkzc0huN3Fad0Y5cnQzUHpvS0w2ZCtNS1Y5ZWQx?=
 =?utf-8?B?cGdaVkJqNkx2VFNIaGVFaGZjMWFWK0dISzYweWdjWWV4Rnh4L3dVTTVnL3Fk?=
 =?utf-8?B?QjU0bnZCUkp3bGg1K2l0YWpINzBLTUYyWWFqYjV5QWlWWmgyb1phdURwdXFK?=
 =?utf-8?B?QVdiaHNRRERTRzlyZEUvaEpCbjBoMGZER2JUZXh0WDFLQ3ZBVFFaVWIwZUEz?=
 =?utf-8?B?MjUvTCs3UGZqWVN6R3U0Z21IQUl0K01IRm1SdHZCb3lpVHljeG1QZnRrem43?=
 =?utf-8?B?ajQwK0tGM3BHdUk0bXFCbGFkdHplVHhzRUN1VDF6c01mOVJzNGVKbjdINmx3?=
 =?utf-8?B?K3hmUUJERmlMUi9ZOXI0c2dvVkgxeHFIbXVVdWtxMU4wbmxjY3RnUTQwcmRv?=
 =?utf-8?B?U0I1dEJsUmJna0tRcmM4a2MrLzJOM0lHbE0vZGZzWnFrM0VieFBqZmdoaE9y?=
 =?utf-8?B?Tm5SaUdCVXZPc0NsbUx2SzByY3ovWGZjeGV0TW5WaUJKME1zR2xCZzNSbXpt?=
 =?utf-8?B?QkhFOGtqS3RnRnVsQkU0NERFREprekovS2VTTXQrc0JTT3Q2L0xMUkZQNTZj?=
 =?utf-8?B?bUxjYjdsZmVPZWlPTkIxdEZpT1VJV0wzSndrZlRIdkt1clRtSjhTaDBESFJn?=
 =?utf-8?B?VGI4dkFxZ1I4VEVBOE9wZ3BQKzFxS01EM2dBQ2t1ZUNiMVVERW9XaFg3UnIv?=
 =?utf-8?B?d1VrVUMwYjlwYkxmc3ZrdmJJUEVpNE0wWXdITUVzaU0xMVdaSlBzaDl5Z2hj?=
 =?utf-8?B?S2JXdzZHdENBUXR4Vk5JWlo4aTl4Z3VPOVNNNSs3ZzJwdS9tOEE4K1BFS1ZF?=
 =?utf-8?B?SW8rMys1SlQxSk02RnB5V1owWFh1ZXpaZ2tidkR5R3YrZ2xRdnhaWEtuRGp6?=
 =?utf-8?B?dFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B6CD152417796742A38AE0EE2A39A0B4@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e284e4b-3966-4040-cd1a-08daf3dbdb99
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jan 2023 13:58:03.3554
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VX3cU6WaCZV2p1O/XLEQiYfdi/BXv02IVrXhr2ykB91uncPvj5mInlcfGwpfKpvHXHc7dRftp/lEjuzCOpcM8w9KYQPzA4oTp5mjLpaF5cM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2188
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

DQoNCkxlIDA2LzAxLzIwMjMgw6AgMTc6MzcsIEhlcnZlIENvZGluYSBhIMOpY3JpdMKgOg0KPiBU
aGUgUU1DIChRVUlDQyBNdWx0aWNoYW5uZWwgQ29udHJvbGxlcikgaXMgYXZhaWxhYmxlIG9uIHNv
bWUNCj4gUG93ZXJRVUlDQyBTb0Mgc3VjaCBhcyB0aGUgTVBDODg1IG9yIE1QQzg2Ni4NCg0KU2Ft
ZSwgdGhhdCdzIFFNQyBmb3IgQ1BNIGZvciB0aGUgdGltZSBiZWluZywgc2hvdWxkIHRoYXQgYmUg
bWFkZSBjbGVhciANCmluIHRoZSBzdWJqZWN0ID8NCg0KUUUgYWxzbyBoYXMgUU1DIGFuZCB0aGlz
IGRyaXZlciBtaWdodCBiZSB1c2VkIGZvciBRRSBRTUMgYXMgd2VsbCB3aXRoIA0Kc29tZSBlbmhh
bmNlbWVudCwgbWF5YmUgdGhhdCBjb3VsZCBiZSBleHBsYWluZWQgaGVyZSA/DQoNCkkgc2VlIHlv
dSBhcmUgdXNpbmcgaW5fYmUxNigpLCBvdXRfYmUxNigpIGV0YyAuLi4uDQpUaGF0J3Mgc3BlY2lm
aWMgdG8gcG93ZXJwYyBhcmNoLCBtYXliZSBpdCBpcyBiZXR0ZXIgdG8gdXNlIGlvcmVhZDE2YmUs
IA0KaW93cml0ZTE2YmUoKSBldGMgLi4uLg0KU2VlIGNvbW1pdCAzZjM5ZjM4ZWE5MWQgKCJzb2M6
IGZzbDogcWU6IHJlcGxhY2UgcWVfaW97cmVhZCx3cml0ZX0qIA0Kd3JhcHBlcnMgYnkgZ2VuZXJp
YyBpb3tyZWFkLHdyaXRlfSoiKSBhbmQgY29tbWl0IDZhYzliNjE3ODZjYyAoInNvYzogDQpmc2w6
IHFlOiBpbnRyb2R1Y2UgcWVfaW97cmVhZCx3cml0ZX0qIHdyYXBwZXJzIikgZm9yIGluZm9ybWF0
aW9uLg0KDQo+IA0KPiBJdCBlbXVsYXRlcyB1cCB0byA2NCBjaGFubmVscyB3aXRoaW4gb25lIHNl
cmlhbCBjb250cm9sbGVyDQo+IHVzaW5nIHRoZSBzYW1lIFRETSBwaHlzaWNhbCBpbnRlcmZhY2Ug
cm91dGVkIGZyb20gdGhlIFRTQS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEhlcnZlIENvZGluYSA8
aGVydmUuY29kaW5hQGJvb3RsaW4uY29tPg0KDQpJbiBzb21lIHBsYWNlcywgeW91IGNvbW1lbnRz
IHVzZSB0aGUgbmV0d29yayBzdHlsZSwgbm90IHRoZSBnZW5lcmljIHN0eWxlLg0KDQpDaHJpc3Rv
cGhlDQo=
