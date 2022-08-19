Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7DC59954D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Aug 2022 08:30:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M8Bhp36n0z3dsl
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Aug 2022 16:30:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=u5PBWTG+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.80; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=u5PBWTG+;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120080.outbound.protection.outlook.com [40.107.12.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M8Bh32n4kz3cBL
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Aug 2022 16:30:10 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GW4PBoR2ZexC9LBTMCPn6yVTs58qMYJIx1Gza27FU0XdMWLxWIoS3qZS+wSRm3JZMANuQRjArdVWb80bV9C5ba+/j3ZGjluIhB+4aTlgflWiT5y+7xTD/zdH/hjbSWqMaLo4OyvIUaAErudSxyyLgAJH5+l9KJ9BR3Ul9AU11xrcCmFwfYaAUOPp+tme2SZWjefciO04h7Nmaf3dVlMqWRwY8NqsuSb0eomEy4V+hPebzotxBBti8fcBCzd6AXceJQJuLoqQskCUnv88M+00wHEIeQ+shNT9cR3a/KjDdLa71BhIAjbmIc49TIU7md1wx2iM8bN8ZXaWn6VniSBidA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HuRaQwnS79umNlYdwCFSy64tUSX/iv2zYTFBo61r5X4=;
 b=Oqp6exayuFNBqeQO4A9iDpBLNmq5PkWZ081GPQtRMTgwlvWpi9Jh6H3ZmVbnaGceqDMcJtE7HRY21pfn5aNzDpLwpQodTWfMA5NxdanzZ+nIhOubpCC69Ryjhnz2hkyuJr58VwqQNT1mmDeWqDYS42S2T4emx7igLxDZ27XfZs+0YA6rGlX8xKQAs04w7oRc7eABF6xWwBWlU5AVY+W5twjSMP7l2LqdgRPuuh0vr5SH11mfRLl19Ti7aBSElx4T1D/7Qfy/Zt4UBE6WF0WgFaPUoBLszQp5PU7uDSJdFBD03j8jhAmj8JIj6Jw6FlbAgizWrtIaQEv9ldFxUcAr1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HuRaQwnS79umNlYdwCFSy64tUSX/iv2zYTFBo61r5X4=;
 b=u5PBWTG+FxMf3I3ehX9WqWcTkjK8RVhw8z53RV/kfjlcbE/RQrt79pLMUvzbYddEf0HN/fHKCEyq+SGl0ISBccFJMzhaGoIgeZBJTspleprjWudta37HaUTzKEOmswP62/9+ZJXoS6CtkiV29tQkAmbXdDg9Hr5g0Prly9f7Os+lH3FbDSLzb9oM8LaXh7iog6qbwFkzS5qhY8pIhMgRfljzPBsUG5LO4i7kvN/tHcvKiq61Jqxp1WTYGpM0WrYAuVtFsMftfE8ogkQPfhYzGK9HPYCPcCs+tbv2fwPP5RBn0ndbUgP7qcuoAr7EcsvkvXbcOPnddcxwoHzlhEQv8w==
Received: from MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3d::7) by
 PR0P264MB4027.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:25b::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5546.16; Fri, 19 Aug 2022 06:29:50 +0000
Received: from MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fdc6:a1de:d9e8:cb45]) by MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fdc6:a1de:d9e8:cb45%3]) with mapi id 15.20.5546.016; Fri, 19 Aug 2022
 06:29:50 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Rohan McLure <rmclure@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v3 16/18] powerpc/32: Clarify interrupt restores with
 REST_GPR macro in entry_32.S
Thread-Topic: [PATCH v3 16/18] powerpc/32: Clarify interrupt restores with
 REST_GPR macro in entry_32.S
Thread-Index: AQHYs31SqH1oWuikPUWo42EqrEcOua21wzAA
Date: Fri, 19 Aug 2022 06:29:50 +0000
Message-ID: <7a39ffe4-f8ef-7e39-76b9-26e330b25c39@csgroup.eu>
References: <20220819033806.162054-1-rmclure@linux.ibm.com>
 <20220819033806.162054-17-rmclure@linux.ibm.com>
In-Reply-To: <20220819033806.162054-17-rmclure@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c245f587-4311-4b93-b26f-08da81ac3856
x-ms-traffictypediagnostic: PR0P264MB4027:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  nNJTxL3NJHFEu6iMOoD1Q7mFcvtgfCWJd7pSyaDo4iVzg9n4mbaIgCCtPvSTeUvKprCqXt24GvugORL/RgihVwe9mIfF03cEzeKDtJzYD5PtJtF7XkcyZzeojtCyDHIlMFYCP2LyXoa9A0JuBPT4NTyhlNggJYkYRS2mdMa53nx21bOZiGxWPFTtgn9LqB+aWCnBPJQTJDQrvGSzULCP0X43dNjuNmBHkaK+bPaZKV9b9+TIU5EGCj43fSR7LR3/GEWrgR7fub1pGJZz8wkVEhxeMasTuNz6IePDiJ4e+ul+OQTv4DEccBAXvdsctFtutioqt1UeV4MtYcvHFO2u/ymHIxg2mQOXOUcpN5eBsfc5qfzQn5vgGBAE4xg98+kImFIRl+/4rhhdZ6K0crhRCDcLO1YCS5cfLLDoNikMXEUTJq3ZJ1Lx2uh8Gp3urfpgewEiBRo5SjXGzwFbp1NFPc7PLoY4do+obQC8SEtfJdg+WEkeVua8z/9cUMmU/dFkmYKwY1IGmfc3QU1ZV7k+jh59Iqw5gYJxa0kIKrfPJN2NtA0d4BDVdGKIGWaUVljrYPef/eYkHBbRIdF0DxTjOqToinNZ3f3z0Aa+zvU/ICX5IbiSTbH3fy22QQidqgcOJ4oxgnw0EJux1sqKnCJCyl2yZM4mXbMMnKBMxdvc1PUd43tRXBh1xvSOoEcJ03B2z/hFXAQjLz57Gidosh160fgmTe1cp5DSuey2mCp6Xx51UV8+YeowhDVqHxpPx4lwtCqPosAkEdFcnQ/1aFO0uADhcdcBxz+q96UNxU8hahEpsdC1ZqlIcNKfEAK32tezTCVbKXF42Z81eU/H9piF6A==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(396003)(39850400004)(346002)(366004)(71200400001)(122000001)(110136005)(6506007)(64756008)(66574015)(41300700001)(38100700002)(5660300002)(36756003)(31686004)(186003)(91956017)(31696002)(66946007)(4326008)(76116006)(66446008)(316002)(66476007)(8676002)(66556008)(86362001)(6486002)(26005)(478600001)(83380400001)(2906002)(38070700005)(8936002)(44832011)(6512007)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?RXdzOHJ2aTFZUU1mZXp4dWY2SGhERXlyc0dIN3U3a0JPc2Y4dnY3NXFDSHBU?=
 =?utf-8?B?ak1CMjREb1hNbkhoSktIV0Vxei8raTEyT09LNVNTbzk1V3JkWUlNOHJnVzJB?=
 =?utf-8?B?cnJOcHdvclFQQ1Q0NDBtaEhXVWF2YVZwYVp3U2NvM29NU2J6WVJ6YUhySUlp?=
 =?utf-8?B?bis4N2Izbk9tNlpwOW5OVUhxTXkrUGVudG9rK2JOSTNOeGhHUEMyalpta3d1?=
 =?utf-8?B?dWVrNldxazRtdWhLR2drKzhwVVJFbm9TbE1iektNU2t5Y1p4NzJmLzRndHlo?=
 =?utf-8?B?SXVqekE4S2RiS3FIbmwyTFV5T1pOeG5DZU8vM2VrOVNMb3cvbEhWOUtDTkVT?=
 =?utf-8?B?VHFWTVBpUnBDV01rbkFnY2duL0xMelNEQmthT1VuQWY1KzFDWHJFYmtRNkU1?=
 =?utf-8?B?SmhscStjWFNRbkYraE1LM0g1MUtXdlVCQk96dmNINGFwMFpKRXlPTS9yYXJn?=
 =?utf-8?B?aTVEYmQrT3pYaTRaSW5WMGZ4c2xSNHpDS0ZtSDBORVNkeTd4RGJWMXo1RXBF?=
 =?utf-8?B?ZmZiRTVlT1hCRkE1bmxkMk1hZUhaS2VuNkQvV2lQWTdPaHM2QWdidjhFSXZt?=
 =?utf-8?B?Vk9VRWlmM1hOYXEvSjFxbkZpd0VLRHBOQWpnTHFUTDBzeXZDQzRWK0FTMWQ2?=
 =?utf-8?B?WmVxaTA5UVhzRUhHczl2UUkvbjE4c0NiY0NWUnMyVXQ5M3Y2U053NnFONjFq?=
 =?utf-8?B?N1Y0UDVzZks0UmpWTnkyaU1BK0s0cTdjVmMwV2lGQWEweUh4ejJEbHF4bG9a?=
 =?utf-8?B?WWxGblNET2Z5enp4a3czTGg2cW5Fc2d5SHduemFsY1Y5UWEyWjhJV2lUUEo2?=
 =?utf-8?B?cG1DTkJjNC92dmRncnJPeitHdjQvdjdmbXRUa29KUFg5eFhEVDdwTG55dzF5?=
 =?utf-8?B?NDBwWnZ3M2lWcW5YQzNjNGZuK0tYcEp3NWdpWHBsR0h6OWhXV0E3aTlYazdj?=
 =?utf-8?B?UFJpNXhTYmpmWHArdUpISFdIUXgycWNtUU5PMlFtR1dCRDV2VjNPbHpyZUE0?=
 =?utf-8?B?UnRnY1EzQjZnMEd5SDlET000OEgySUZoekNLaWVDbHZxakV0bXM4amtQME5E?=
 =?utf-8?B?MVBFcFJSRVJibnBZUUp3VEhod3k0OXhYSnRiQUxHQzU4a3l3c3dXYUFxMHBQ?=
 =?utf-8?B?ZE1tSkNMUTRSdTJzQ0ZnZlZXZ01Fa3RUYVdLQys1NlJra3hVa1JvdHNweUpa?=
 =?utf-8?B?eWVmR29WaXJ5c1FRNzA1dWFBaDZESCtObkRDQTlGN1NKRDk4V0lXN3d0VXFU?=
 =?utf-8?B?ZlVPRDdrd09JMjdud1dmMDJleGJWQjltWVNqTXVQTW5YKzNWeWlHWXNjQnl0?=
 =?utf-8?B?b2h5RnJsM1JBTm8rRW5RdE1EdUhpclIrclhab0RnSUNzL0lnQkZZOCswNDNG?=
 =?utf-8?B?RnFvMng4TVJDamRRbkZCYWJGQm02Z1dnd0s0KzBDTU1lSjBqdFlpaThpWUpU?=
 =?utf-8?B?Y05rTkVWQXkza2tmWGN1NmROdXcvekhvNFdrZXlKWE9iNURORXFVMjBJYWQr?=
 =?utf-8?B?ZlpHSEUzaTk1KzIyZnA5US9BRWx0K2FERk56YmpUUWw1cE42NTYwNW9pZlJP?=
 =?utf-8?B?WktJdE8zVmVtU3VQeU5ZaUJ1LzJVVmMrWEhUTXhjbUJSR1ZLQWVnRGRaMWFK?=
 =?utf-8?B?NVZueWhjcmptVUtTZFdKTEdNR0dReFZkczB4d1BpSXR5UmppaXY2eEtZZWxS?=
 =?utf-8?B?Q0lMNUpDMU03eHJ4R0tLRjlKZ3F6alRzVzBKb2JRcmJmQm9DYUlnM3BYSFkr?=
 =?utf-8?B?SzczSktPUVVoZzB2Tlg1OWxDWndwbkl5R1IzdEcwZU9LZC9pMlNEbW9SL2xS?=
 =?utf-8?B?M3VlS1V2RTI3OW1XWU9neVRwTWg4OGVnWG9xTkZDNXdrdkVTaFQzeTNiZXlD?=
 =?utf-8?B?akc5cGFBY20vbDJNVVhwSXlHZHFjSEtnYUpPZDBOSTVKbStOQkRmM3BINGZk?=
 =?utf-8?B?VHZJblpXbTRwQ2QrRTlvbnlDT3ZsamFtajNRcE4yQ05KdDVjeWd0RUNHOWZy?=
 =?utf-8?B?NU5xN0xGZDU5d3liYTlFMkpHa2FIeCtqQ3ZvbXdaT3F6cUZpUVFHbnBDYy9V?=
 =?utf-8?B?K0pad2dMc1NSTHY2K2ROS2hHL21WbDI4S3l6OUFiZGVkeHNmKzMwRmxTWUFP?=
 =?utf-8?B?eC8rV0VwcGhpTjRNdkxTQmFrZVFqY0haSURrSHlXcHgzTUxLREtCNStwaUFI?=
 =?utf-8?Q?U9OZA77qq4Lyk6XSyX6kAhk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <91BD3C15AC4B994FB5D0FE521DA5EA9A@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c245f587-4311-4b93-b26f-08da81ac3856
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2022 06:29:50.5442
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ktP4N4xxGglWs/Bb6Ug6dZco5dqnbfP7Zm6jkJ+ShikKztR0hhIpqz81CF5dLp5Fz0QAyMWnEPepjRt2p+ZDHI0vjtcUCobkAqYKRtE23cA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB4027
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE5LzA4LzIwMjIgw6AgMDU6MzgsIFJvaGFuIE1jTHVyZSBhIMOpY3JpdMKgOg0KPiBS
ZXN0b3JpbmcgdGhlIHJlZ2lzdGVyIHN0YXRlIG9mIHRoZSBpbnRlcnJ1cHRlZCB0aHJlYWQgaW52
b2x2ZXMgaXNzdWluZw0KPiBhIGxhcmdlIG51bWJlciBvZiBwcmVkaWN0YWJsZSBsb2FkcyB0byB0
aGUga2VybmVsIHN0YWNrIGZyYW1lLiBJc3N1ZSB0aGUNCj4gUkVTVF9HUFJ7LFN9IG1hY3JvcyB0
byBjbGVhcmx5IHNpZ25hbCB3aGVuIHRoaXMgaXMgaGFwcGVuaW5nLCBhbmQgYnVuY2gNCj4gdG9n
ZXRoZXIgcmVzdG9yZXMgYXQgdGhlIGVuZCBvZiB0aGUgaW50ZXJydXB0IGhhbmRsZXIgd2hlcmUg
dGhlIHNhdmVkDQo+IHZhbHVlIGlzIG5vdCBjb25zdW1lZCBlYXJsaWVyIGluIHRoZSBoYW5kbGVy
IGNvZGUuDQoNCktlZXAgYWxsIHBvc3NpYmxlIHJlc3RvcmVzIGJlZm9yZSByZXN0b3JpbmcgU1JS
MC9TUlIxLCBzZWUgZGV0YWlscyBiZWxvdy4NCg0KPiANCj4gU2lnbmVkLW9mZi1ieTogUm9oYW4g
TWNMdXJlIDxybWNsdXJlQGxpbnV4LmlibS5jb20+DQo+IFJlcG9ydGVkLWJ5OiBDaHJpc3RvcGhl
IExlcm95IDxjaHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+DQo+IC0tLQ0KPiBWMiAtPiBWMzog
TmV3IHBhdGNoLg0KPiAtLS0NCj4gICBhcmNoL3Bvd2VycGMva2VybmVsL2VudHJ5XzMyLlMgfCAz
NSArKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAx
MyBpbnNlcnRpb25zKCspLCAyMiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9hcmNo
L3Bvd2VycGMva2VybmVsL2VudHJ5XzMyLlMgYi9hcmNoL3Bvd2VycGMva2VybmVsL2VudHJ5XzMy
LlMNCj4gaW5kZXggOGQ2ZTAyZWY1ZGMwLi4wM2ExMDVhNTgwNmEgMTAwNjQ0DQo+IC0tLSBhL2Fy
Y2gvcG93ZXJwYy9rZXJuZWwvZW50cnlfMzIuUw0KPiArKysgYi9hcmNoL3Bvd2VycGMva2VybmVs
L2VudHJ5XzMyLlMNCj4gQEAgLTY4LDcgKzY4LDcgQEAgcHJlcGFyZV90cmFuc2Zlcl90b19oYW5k
bGVyOg0KPiAgIAlsd3oJcjksX01TUihyMTEpCQkvKiBpZiBzbGVlcGluZywgY2xlYXIgTVNSLkVF
ICovDQo+ICAgCXJsd2lubQlyOSxyOSwwLH5NU1JfRUUNCj4gICAJbHd6CXIxMixfTElOSyhyMTEp
CQkvKiBhbmQgcmV0dXJuIHRvIGFkZHJlc3MgaW4gTFIgKi8NCj4gLQlsd3oJcjIsIEdQUjIocjEx
KQ0KPiArCVJFU1RfR1BSKDIsIHIxMSkNCj4gICAJYglmYXN0X2V4Y2VwdGlvbl9yZXR1cm4NCj4g
ICBfQVNNX05PS1BST0JFX1NZTUJPTChwcmVwYXJlX3RyYW5zZmVyX3RvX2hhbmRsZXIpDQo+ICAg
I2VuZGlmIC8qIENPTkZJR19QUENfQk9PSzNTXzMyIHx8IENPTkZJR19FNTAwICovDQo+IEBAIC0x
NDQsNyArMTQ0LDcgQEAgcmV0X2Zyb21fc3lzY2FsbDoNCj4gICAJbHd6CXI3LF9OSVAocjEpDQo+
ICAgCWx3eglyOCxfTVNSKHIxKQ0KPiAgIAljbXB3aQlyMywwDQo+IC0JbHd6CXIzLEdQUjMocjEp
DQo+ICsJUkVTVF9HUFIoMywgcjEpDQo+ICAgc3lzY2FsbF9leGl0X2ZpbmlzaDoNCj4gICAJbXRz
cHIJU1BSTl9TUlIwLHI3DQo+ICAgCW10c3ByCVNQUk5fU1JSMSxyOA0KPiBAQCAtMTUyLDggKzE1
Miw4IEBAIHN5c2NhbGxfZXhpdF9maW5pc2g6DQo+ICAgCWJuZQkzZg0KPiAgIAltdGNyCXI1DQo+
ICAgDQo+IC0xOglsd3oJcjIsR1BSMihyMSkNCj4gLQlsd3oJcjEsR1BSMShyMSkNCj4gKzE6CVJF
U1RfR1BSKDIsIHIxKQ0KPiArCVJFU1RfR1BSKDEsIHIxKQ0KPiAgIAlyZmkNCj4gICAjaWZkZWYg
Q09ORklHXzQweA0KPiAgIAliIC4JLyogUHJldmVudCBwcmVmZXRjaCBwYXN0IHJmaSAqLw0KPiBA
QCAtMTY1LDEwICsxNjUsOCBAQCBzeXNjYWxsX2V4aXRfZmluaXNoOg0KPiAgIAlSRVNUX05WR1BS
UyhyMSkNCj4gICAJbXRjdHIJcjQNCj4gICAJbXR4ZXIJcjUNCj4gLQlsd3oJcjAsR1BSMChyMSkN
Cj4gLQlsd3oJcjMsR1BSMyhyMSkNCj4gLQlSRVNUX0dQUlMoNCwgMTEsIHIxKQ0KPiAtCWx3egly
MTIsR1BSMTIocjEpDQo+ICsJUkVTVF9HUFIoMCwgcjEpDQo+ICsJUkVTVF9HUFJTKDMsIDEyLCBy
MSkNCj4gICAJYgkxYg0KPiAgIA0KPiAgICNpZmRlZiBDT05GSUdfNDR4DQo+IEBAIC0yNjAsMjQg
KzI1OCwyMiBAQCBmYXN0X2V4Y2VwdGlvbl9yZXR1cm46DQo+ICAgCWJlcQkzZgkJCS8qIGlmIG5v
dCwgd2UndmUgZ290IHByb2JsZW1zICovDQo+ICAgI2VuZGlmDQo+ICAgDQo+IC0yOglSRVNUX0dQ
UlMoMywgNiwgcjExKQ0KPiAtCWx3eglyMTAsX0NDUihyMTEpDQo+IC0JUkVTVF9HUFJTKDEsIDIs
IHIxMSkNCj4gKzI6CWx3eglyMTAsX0NDUihyMTEpDQo+ICAgCW10Y3IJcjEwDQo+ICAgCWx3egly
MTAsX0xJTksocjExKQ0KPiAgIAltdGxyCXIxMA0KPiAgIAkvKiBDbGVhciB0aGUgZXhjZXB0aW9u
X21hcmtlciBvbiB0aGUgc3RhY2sgdG8gYXZvaWQgY29uZnVzaW5nIHN0YWNrdHJhY2UgKi8NCj4g
ICAJbGkJcjEwLCAwDQo+ICAgCXN0dwlyMTAsIDgocjExKQ0KPiAtCVJFU1RfR1BSKDEwLCByMTEp
DQo+ICAgI2lmIGRlZmluZWQoQ09ORklHX1BQQ184eHgpICYmIGRlZmluZWQoQ09ORklHX1BFUkZf
RVZFTlRTKQ0KPiAgIAltdHNwcglTUFJOX05SSSwgcjANCj4gICAjZW5kaWYNCj4gICAJbXRzcHIJ
U1BSTl9TUlIxLHI5DQo+ICAgCW10c3ByCVNQUk5fU1JSMCxyMTINCj4gLQlSRVNUX0dQUig5LCBy
MTEpDQo+ICsJUkVTVF9HUFJTKDEsIDYsIHIxMSkNCj4gKwlSRVNUX0dQUlMoOSwgMTAsIHIxMSkN
Cg0KUGxlYXNlIGtlZXAgdGhpcyBiZWZvcmUgbW9kaWZpY2F0aW9uIG9mIFNSUjAvU1JSMS4gT25j
ZSBTUlIwL1NSUjEgYXJlIA0KbW9kaWZpZWQsIGludGVycnVwdHMgYmVjb21lIHVucmVjb3ZlcmFi
bGUuIFdlIHdhbnQgdG8ga2VlcCB0aGF0IHdpbmRvdyANCmFzIHNtYWxsIGFzIHBvc3NpYmxlLg0K
DQo+ICAgCVJFU1RfR1BSKDEyLCByMTEpDQo+IC0JbHd6CXIxMSxHUFIxMShyMTEpDQo+ICsJUkVT
VF9HUFIoMTEsIHIxMSkNCj4gICAJcmZpDQo+ICAgI2lmZGVmIENPTkZJR180MHgNCj4gICAJYiAu
CS8qIFByZXZlbnQgcHJlZmV0Y2ggcGFzdCByZmkgKi8NCj4gQEAgLTQ1NCw5ICs0NTAsNyBAQCBf
QVNNX05PS1BST0JFX1NZTUJPTChpbnRlcnJ1cHRfcmV0dXJuKQ0KPiAgIAlsd3oJcjMsX01TUihy
MSk7CQkJCQkJXA0KPiAgIAlhbmRpLglyMyxyMyxNU1JfUFI7CQkJCQkJXA0KPiAgIAlibmUJaW50
ZXJydXB0X3JldHVybjsJCQkJCVwNCj4gLQlsd3oJcjAsR1BSMChyMSk7CQkJCQkJXA0KPiAtCWx3
eglyMixHUFIyKHIxKTsJCQkJCQlcDQo+IC0JUkVTVF9HUFJTKDMsIDgsIHIxKTsJCQkJCQlcDQo+
ICsJUkVTVF9HUFIoMCwgcjEpOwkJCQkJCVwNCj4gICAJbHd6CXIxMCxfWEVSKHIxKTsJCQkJCQlc
DQo+ICAgCWx3eglyMTEsX0NUUihyMSk7CQkJCQkJXA0KPiAgIAltdHNwcglTUFJOX1hFUixyMTA7
CQkJCQkJXA0KPiBAQCAtNDc1LDExICs0NjksOCBAQCBfQVNNX05PS1BST0JFX1NZTUJPTChpbnRl
cnJ1cHRfcmV0dXJuKQ0KPiAgIAlsd3oJcjEyLF9NU1IocjEpOwkJCQkJCVwNCj4gICAJbXRzcHIJ
ZXhjX2x2bF9zcnIwLHIxMTsJCQkJCVwNCj4gICAJbXRzcHIJZXhjX2x2bF9zcnIxLHIxMjsJCQkJ
CVwNCj4gLQlsd3oJcjksR1BSOShyMSk7CQkJCQkJXA0KPiAtCWx3eglyMTIsR1BSMTIocjEpOwkJ
CQkJCVwNCj4gLQlsd3oJcjEwLEdQUjEwKHIxKTsJCQkJCQlcDQo+IC0JbHd6CXIxMSxHUFIxMShy
MSk7CQkJCQkJXA0KPiAtCWx3eglyMSxHUFIxKHIxKTsJCQkJCQlcDQo+ICsJUkVTVF9HUFJTKDIs
IDEyLCByMSk7CQkJCQkJXA0KDQpTYW1lLCBwbGVhc2Uga2VlcCB0aGluZ3MgbWluaW1hbCBiZXR3
ZWVuIHJlc3RvcmUgb2YgU1JSMC9TUlIxIGFuZCBSRkkgdG8gDQptaW5pbWlzZSB0aGUgdW5yZWNv
dmVyYWJsZSB3aW5kb3cuDQoNCj4gKwlSRVNUX0dQUigxLCByMSk7CQkJCQkJXA0KPiAgIAlleGNf
bHZsX3JmaTsJCQkJCQkJXA0KPiAgIAliCS47CQkvKiBwcmV2ZW50IHByZWZldGNoIHBhc3QgZXhj
X2x2bF9yZmkgKi8NCj4gICA=
