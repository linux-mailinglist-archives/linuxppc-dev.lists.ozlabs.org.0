Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D37F96178FC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 09:44:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N2y3h5Ckwz3cKk
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 19:44:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=a5ZQmdud;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.54; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=a5ZQmdud;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90054.outbound.protection.outlook.com [40.107.9.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N2y2k5QhQz2xFx
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Nov 2022 19:43:26 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cri57kirqn/394LSkbxd4zNq0LGTlDB1ByLyActSNy8cnFEqNOO+7jfZ0kmxRrdJo+E6F0P3mbHwIU/bFd0R3HTDhlrBAIdPRw7g2P1SZUj5WftYmr9tu8pi4/OE5U9rvSMihhxjI7p7OWCCf7cV4pLLm+kl6YTnrH5Uc9tp79aYRRMIUpc3DDcmXsutaFxNwlLFWJDU9wJVfzbsH38vv8qzmskOaN+uptJK+nkhX03Z/yGyyDTmqw7VF6lO4FpTi/QhLQaHAQi2ovpu2FhYdWt2tUgVxBRouRtjteminVrn1Ndk5GL/jhIM8RmQRZDONPI2xa6c8DqM4zFbSl2iVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WOAl5xrERod03QlOGNq0/1Sm6lIPyDm4Yl7sYEJoppw=;
 b=L3NnxMIgd6xRfbzsGaqsp/S7DaKGDnqhXZ0GWSGyK2UvCv0z12k+PvIdkiGDXyjSQfJmV6xYhcThnEZakpSIRNM6qgaFkzpD78myQqeXQN7/2OMf6w8sz6jp5hbkow3bY5UZ1NdeRC7I6r0zmEOZ0ToD/vz0qhOQtkOTpdlU0Cw6EfyHrU7CcEIyGpIw9ZL1XXKArQVjkTpT+Bov+0Vp6FLJBqIqnF42n9M6T5B2k+mC4rDN9EjChUu9egP+DoEDCZKsoekNMu8bp4EBQQ96bsgY4R59ELfPO7YAHa+phUzk08DSS7rHAODP9uPrb6TelCulRCQ0mBArTeiqDS3NZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WOAl5xrERod03QlOGNq0/1Sm6lIPyDm4Yl7sYEJoppw=;
 b=a5ZQmdudHh1UGNSAxYdCYN/KaFeQXV28RHwHUPf2FA7wy1SEwGBp9FAoIttlwXCXB2Pnb2h9RlyD9iiA3WJHgxOTYJ5D1gFGFS6uXU6Q/jwyHTvh5niilMGZa1gCnIX4HYLsvCtt6elYq0LyEr0s0tcngEnwAkGTd4ZrqfZhVjQY6tVEc6tBnrtXCYxkYd4nc/u6Ncs6M06Vs+qv0G6Xv5tkYR6l+NBtmnTeD56FoS8UeklaJJwzIxX3js1TYYeQogAD8z1+/v50MQi2Ct88b2h73toYUoQjd9zUNKKYgo/N+STbi20iLOul/f8WJgQS+8MShcSXIDmWasFQ5dF0bg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB3285.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:141::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Thu, 3 Nov
 2022 08:43:07 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8bbc:32cb:956d:88e8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8bbc:32cb:956d:88e8%2]) with mapi id 15.20.5769.021; Thu, 3 Nov 2022
 08:43:07 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Rohan McLure <rmclure@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v3 3/3] powerpc: mm: support page table check
Thread-Topic: [PATCH v3 3/3] powerpc: mm: support page table check
Thread-Index: AQHY50C53NaQN4lWLkC6n32Yfxwdd64s8hEA
Date: Thu, 3 Nov 2022 08:43:07 +0000
Message-ID: <cec0c5b6-8940-baec-4d2a-752939f1ea2e@csgroup.eu>
References: <20221024003541.1347364-1-rmclure@linux.ibm.com>
 <20221024003541.1347364-3-rmclure@linux.ibm.com>
In-Reply-To: <20221024003541.1347364-3-rmclure@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PAZP264MB3285:EE_
x-ms-office365-filtering-correlation-id: 1c5d45ec-0561-4ce1-9c35-08dabd776e36
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  bsaal50DyoArnpU14SZdSqjz7i+X84y8j3ud64n4+lkJh3PHOkC5HT9KLO3Iz+lmV4ewGvgJwmE8JPYnMLxZ7Uf0+lI4VzjhIwlg+77TNo6jvfadvIlgC9DneXoyOsac88oFW84JY1oThwNEILPE9lHUhT9xvEwRp5En9LgzP3ky7rfRNc5MGktln6Et7So18BBZ1Lv4Mdjp9+iUC+4gCraAJg2xFyEgkVQOiUURSbBLOjbz69SI+wwcr+VaZHk1z/5bv72oVvJoP0317IEx/7XTHTYhWZ1+A0QXidatYDyTH+i9uwBYCSih2TYrzqeB7GaCvZUPas7TqgbQ+hiF6rFsCfaGGIKVSXLmmVYrV2M8BYUvmqIUKbs0aVqXVJ2D/lZrWV26sS/ppxGO7AOnCBX1cKdbCDDHAulkDflLQ82MFblo1m/NU/ceyHPhOsE9GedBDC7UvDDSJOXoTyUvOBa5Ww7iYShXy7ma9AgpkVQOMvTzkUdkNwpFaQxGbd7g9f9qNkdLPI7la33T07M7OIm+ROxwIs+OGHH47HKmt0uJIFLCXDhK2IqI3dorPdSxSJ1bpa4S/5ZmuwYwv1mtMea5Zxttr0LHrB1aI4ZsEvijdm3YKgMzZq35o6q/EeyhjkxVv239f1bQACp66uiTrH5jfnGHZMQA5uP7U0aIrn4z0o63RyfyQiB0B+iz61iaOKgm7QLowxaSKSwm/NETGGxCqB27Rdc6D3/V8/p0YIBuaOuIyOHXSktytEwKlL0qMuoJ4zrGCjuQdM/PNE3EUJQxoURDrxWAfdhHVFUbXJCm9N6Q9drsbaoZfrU1ZWFZWibWY4r5TFnnEmeAdxk5+Q==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(376002)(346002)(39850400004)(366004)(451199015)(8676002)(110136005)(316002)(186003)(64756008)(71200400001)(44832011)(66946007)(66476007)(66556008)(76116006)(66446008)(38070700005)(41300700001)(8936002)(5660300002)(478600001)(6486002)(36756003)(31686004)(66574015)(83380400001)(2906002)(6506007)(2616005)(86362001)(38100700002)(91956017)(26005)(6512007)(122000001)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?dHR4dUZiNHVHc1pSQTlrTDYrc2w1VmJnT2d6UzE5Rkw1RDZ2TFk1YVhFUzI4?=
 =?utf-8?B?TUwwa29FamEyckpxSlBvZTBlb3JueFJwZWQ1NnZuQWl0cktrTWdTMG9CaXlt?=
 =?utf-8?B?SzVNc2pOcWxaNm9GTXQ2K1NrTklkMW84YzNHSlRJY0ZEUzRiMjZWbXRVMEVq?=
 =?utf-8?B?eGtrUkwzc1hzZVZEQ0ROSmt6dkJlcWRJZVcxNGRUQlcwaFJTRENTYng1Y3Fu?=
 =?utf-8?B?bDQ0MUhUc1hKZFhQbVFrS0pkUnIvUlRydElMdTJsMVU4bDczSTdrdE5VK3hU?=
 =?utf-8?B?ZjJocUI1dVNORTZMTDg2VlZxQ2NCaDllY253SXNCSzkydGJod2NweVRTQ1RY?=
 =?utf-8?B?T2FKZkhOdHRjV21PTUdmc0RmZWlrcGRMeTJ6akxlR3F0OTVVdXBiM0pCL0p5?=
 =?utf-8?B?Ky9uWG9Ta3ozdnhLYllQNjQrLzhac2FNWFcyWDVIbzZBRkkvRmxUV1Jydm8v?=
 =?utf-8?B?Y09BR3RBRVRKQ3hFRWw3bGg3RkpTbU5xVTlpS29DcWNxL2hoWFBwc1pSdWta?=
 =?utf-8?B?T3RKNjVKZlhYMzQ5dEw3WlBGVTJnY0Y3dEtLOGU3bzFYM1pZZEsrSk50KzE3?=
 =?utf-8?B?dExyWStRbko4eVhQRlcrOEF6ZGJ1ZUJBZDVjSDBqRERZU2U2Qk03QTV0d2s4?=
 =?utf-8?B?VlY3c0xMd3ZzSGZxdEhNejVMTnk0QVFMdk1HcFBUTmhzRG56UVg0Q0Fuakkz?=
 =?utf-8?B?Qnk0YUN2MnJEYkZCOGhBU2tyd0tOanQzVlR4SGpDUUJ0VE5Kbm44Wm0rV1BU?=
 =?utf-8?B?RnRJU05tQ0NWMVVNMWpadEVMYmVHMVlzeUJnTmNrNWhQMEROK1pvcWhSTzVy?=
 =?utf-8?B?NTdzV0RvRk02M1lGcW9RRHNCM3JWVHdnMGtzS1FUd3R1ZDRtMktwUStoU09M?=
 =?utf-8?B?WGdYclk3dEluN2FZQWdycis5Q25HMm50Ti9keTdoMnIyU2pOY3JhUXYyY0Nr?=
 =?utf-8?B?Tm9uRUsyTDN5akpKdWd2cGtRRVU1bHhFRmNKa0lSZTM4dXlWd3FuWnVoTzFX?=
 =?utf-8?B?NXJGbElpaEV6QTNOKzIrTFRPVjJlU1grYnd0RmMreVpsOU11Nm40NmpFNWk5?=
 =?utf-8?B?bkhYTzRUNEhnakxuS0xkMHRRcmhjcFdGb3JLNUhGZmx3bElsTnM5MTIyS1hR?=
 =?utf-8?B?eVF1NldCWUYzNTFETzI4ZG1oVEl0ZnA3V3d3Vm1RMStFSEY3MUVlL093K1Zx?=
 =?utf-8?B?SXJQVCt4QThXTHF5UjRFRHpKMG5IVFFVMHFTdDNNWFFaQkNmbVpBK1lxamxO?=
 =?utf-8?B?cERvNkJMa1IrTllnOGx6bnhtUC9oU3Jhb2sxZmpUY05zVjF4TldtZ1E3Vmsy?=
 =?utf-8?B?RGM0a2hBcXE2YkVxaHJhVmRzMGhaWkRQcm92RkdCNUwrbTMvRnl5eXE2L3No?=
 =?utf-8?B?endNa2t5NDRITCtsY256ZGZIZWRsUDhQM1VCZ2FGeTVxbFRvdWxNMEI3eTZ2?=
 =?utf-8?B?MnZLQTJDTkNaTklvS3kyMTV0UXhULzU5Z3RZNjFDcCtxMDlCVXJtTER5ajM5?=
 =?utf-8?B?NmprWnUzQnhsQXJPdU10TVdta3VrRGZtUFNTRk5RTzBUWjZEem5KRC94VkxJ?=
 =?utf-8?B?S0hUcE00OU5pbVVoQTZmSXVGcHNnWWN6MGFCczNFVTRyNTlOTzZ4K2t5Z1V6?=
 =?utf-8?B?SldFV0wxL2tETWVpZWE3ZVRvc3FqQ0w4dnNnRkdsMlc5UGNCMFRkNXVNZHJi?=
 =?utf-8?B?Tzl4YkxKTVdsQTVmamNaU3BmaTVlZDY2d3JPb0FUWFRxRXo0VW51elZTVzYy?=
 =?utf-8?B?aXRYUVl2QmRBMlNCbW51aFZDQThuY3loNEh5amZ0d01ETWRHV2J1RmNIT2ti?=
 =?utf-8?B?ZitGQ0Rad2VuS0hmV21KOGJGZWRQV3VLTjVLQVBNeEh6enVEWkpwdlRFL1Vz?=
 =?utf-8?B?cGJCL2JPeGNiNUJnOStjbkNza1ptWnk4ZDVuRk1CbnVkSXRNMDR6dFkwK1lj?=
 =?utf-8?B?KytydW9ESWVIaG5kQzNDVS9YSSt2VTZYWXJORDV1cFAzcTc5ZVpLOTJEbzV6?=
 =?utf-8?B?ZlEzRnhKK1p4Z05rQ2ZaRkJKSXh5dVFiUUdMSkdHUDlxMEpzbEZSTjhUUUJC?=
 =?utf-8?B?UnU4L1FCQ2o0Ui9IZHZGdUNYUFI5Yy8yR015TGJKd1dVVVR2N2doSytXV0Jx?=
 =?utf-8?B?Z1Y2bXlMOFJBSTFVNS9vc1FtMUp5RFB3ckZqZ0FXYnBWT1VGTkYvU29Ub2s5?=
 =?utf-8?Q?QSrnrtaJYIOeBGJnA4Rr1hc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <569403D9923F6D4DBE40805A6732DD85@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c5d45ec-0561-4ce1-9c35-08dabd776e36
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2022 08:43:07.4020
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B+ufaESgsS7K603hgLo0Up40mw6BlHkUJaBDeX/K84ydfVXGoDwDfrUUeFp5jEyhiR8rKo/vuJDrLaKnZnEqptucwKgJOqSNks5vEYKXuDA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB3285
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

DQoNCkxlIDI0LzEwLzIwMjIgw6AgMDI6MzUsIFJvaGFuIE1jTHVyZSBhIMOpY3JpdMKgOg0KPiBP
biBjcmVhdGlvbiBhbmQgY2xlYXJpbmcgb2YgYSBwYWdlIHRhYmxlIG1hcHBpbmcsIGluc3RydW1l
bnQgc3VjaCBjYWxscw0KPiBieSBpbnZva2luZyBwYWdlX3RhYmxlX2NoZWNrX3B0ZV9zZXQgYW5k
IHBhZ2VfdGFibGVfY2hlY2tfcHRlX2NsZWFyDQo+IHJlc3BlY3RpdmVseS4gVGhlc2UgY2FsbHMg
c2VydmUgYXMgYSBzYW5pdHkgY2hlY2sgYWdhaW5zdCBpbGxlZ2FsDQo+IG1hcHBpbmdzLg0KPiAN
Cj4gRW5hYmxlIEFSQ0hfU1VQUE9SVFNfUEFHRV9UQUJMRV9DSEVDSyBmb3IgYWxsIHBwYzY0LCBh
bmQgMzItYml0DQo+IHBsYXRmb3JtcyBpbXBsZW1lbnRpbmcgQm9vazNTLg0KPiANCj4gQ2hhbmdl
IHB1ZF9wZm4gdG8gYmUgYSBydW50aW1lIGJ1ZyByYXRoZXIgdGhhbiBhIGJ1aWxkIGJ1ZyBhcyBp
dCBpcw0KPiBjb25zdW1lZCBieSBwYWdlX3RhYmxlX2NoZWNrX3B1ZF97Y2xlYXIsc2V0fSB3aGlj
aCBhcmUgbm90IGNhbGxlZC4NCj4gDQo+IFNlZSBhbHNvOg0KPiANCj4gcmlzY3Ygc3VwcG9ydCBp
biBjb21taXQgM2ZlZTIyOWE4ZWI5ICgicmlzY3YvbW06IGVuYWJsZQ0KPiBBUkNIX1NVUFBPUlRT
X1BBR0VfVEFCTEVfQ0hFQ0siKQ0KPiBhcm02NCBpbiBjb21taXQgNDJiMjU0NzEzN2Y1ICgiYXJt
NjQvbW06IGVuYWJsZQ0KPiBBUkNIX1NVUFBPUlRTX1BBR0VfVEFCTEVfQ0hFQ0siKQ0KPiB4ODZf
NjQgaW4gY29tbWl0IGQyODNkNDIyYzZjNCAoIng4NjogbW06IGFkZCB4ODZfNjQgc3VwcG9ydCBm
b3IgcGFnZSB0YWJsZQ0KPiBjaGVjayIpDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBSb2hhbiBNY0x1
cmUgPHJtY2x1cmVAbGludXguaWJtLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IENocmlzdG9waGUgTGVy
b3kgPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4NCg0KPiAtLS0NCj4gVjI6IFVwZGF0ZSBz
cGFjaW5nIGFuZCB0eXBlcyBhc3NpZ25lZCB0byBwdGVfdXBkYXRlIGNhbGxzLg0KPiBWMzogVXBk
YXRlIG9uZSBsYXN0IHB0ZV91cGRhdGUgY2FsbCB0byByZW1vdmUgX19wdGUgaW52b2NhdGlvbi4N
Cj4gLS0tDQo+ICAgYXJjaC9wb3dlcnBjL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgICAg
fCAgMSArDQo+ICAgYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Jvb2szcy8zMi9wZ3RhYmxlLmgg
fCAgOSArKysrKysrKy0NCj4gICBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYm9vazNzLzY0L3Bn
dGFibGUuaCB8IDE4ICsrKysrKysrKysrKysrKy0tLQ0KPiAgIGFyY2gvcG93ZXJwYy9pbmNsdWRl
L2FzbS9ub2hhc2gvMzIvcGd0YWJsZS5oIHwgIDcgKysrKysrLQ0KPiAgIGFyY2gvcG93ZXJwYy9p
bmNsdWRlL2FzbS9ub2hhc2gvNjQvcGd0YWJsZS5oIHwgIDggKysrKysrLS0NCj4gICBhcmNoL3Bv
d2VycGMvaW5jbHVkZS9hc20vbm9oYXNoL3BndGFibGUuaCAgICB8ICAxICsNCj4gICA2IGZpbGVz
IGNoYW5nZWQsIDM3IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0t
Z2l0IGEvYXJjaC9wb3dlcnBjL0tjb25maWcgYi9hcmNoL3Bvd2VycGMvS2NvbmZpZw0KPiBpbmRl
eCA0YzQ2NmFjZGM3MGQuLjZjMjEzYWM0NmE5MiAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBj
L0tjb25maWcNCj4gKysrIGIvYXJjaC9wb3dlcnBjL0tjb25maWcNCj4gQEAgLTE0OSw2ICsxNDks
NyBAQCBjb25maWcgUFBDDQo+ICAgCXNlbGVjdCBBUkNIX1NUQUNLV0FMSw0KPiAgIAlzZWxlY3Qg
QVJDSF9TVVBQT1JUU19BVE9NSUNfUk1XDQo+ICAgCXNlbGVjdCBBUkNIX1NVUFBPUlRTX0RFQlVH
X1BBR0VBTExPQwlpZiBQUENfQk9PSzNTIHx8IFBQQ184eHggfHwgNDB4DQo+ICsJc2VsZWN0IEFS
Q0hfU1VQUE9SVFNfUEFHRV9UQUJMRV9DSEVDSw0KPiAgIAlzZWxlY3QgQVJDSF9VU0VfQlVJTFRJ
Tl9CU1dBUA0KPiAgIAlzZWxlY3QgQVJDSF9VU0VfQ01QWENIR19MT0NLUkVGCQlpZiBQUEM2NA0K
PiAgIAlzZWxlY3QgQVJDSF9VU0VfTUVNVEVTVA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBj
L2luY2x1ZGUvYXNtL2Jvb2szcy8zMi9wZ3RhYmxlLmggYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9h
c20vYm9vazNzLzMyL3BndGFibGUuaA0KPiBpbmRleCA4YmYxYzUzODgzOWEuLjZhNTkyNDI2Yjkz
NSAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Jvb2szcy8zMi9wZ3Rh
YmxlLmgNCj4gKysrIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Jvb2szcy8zMi9wZ3RhYmxl
LmgNCj4gQEAgLTUzLDYgKzUzLDggQEANCj4gICANCj4gICAjaWZuZGVmIF9fQVNTRU1CTFlfXw0K
PiAgIA0KPiArI2luY2x1ZGUgPGxpbnV4L3BhZ2VfdGFibGVfY2hlY2suaD4NCj4gKw0KPiAgIHN0
YXRpYyBpbmxpbmUgYm9vbCBwdGVfdXNlcihwdGVfdCBwdGUpDQo+ICAgew0KPiAgIAlyZXR1cm4g
cHRlX3ZhbChwdGUpICYgX1BBR0VfVVNFUjsNCj4gQEAgLTM1Myw3ICszNTUsMTEgQEAgc3RhdGlj
IGlubGluZSBpbnQgX19wdGVwX3Rlc3RfYW5kX2NsZWFyX3lvdW5nKHN0cnVjdCBtbV9zdHJ1Y3Qg
Km1tLA0KPiAgIHN0YXRpYyBpbmxpbmUgcHRlX3QgcHRlcF9nZXRfYW5kX2NsZWFyKHN0cnVjdCBt
bV9zdHJ1Y3QgKm1tLCB1bnNpZ25lZCBsb25nIGFkZHIsDQo+ICAgCQkJCSAgICAgICBwdGVfdCAq
cHRlcCkNCj4gICB7DQo+IC0JcmV0dXJuIF9fcHRlKHB0ZV91cGRhdGUobW0sIGFkZHIsIHB0ZXAs
IH5fUEFHRV9IQVNIUFRFLCAwLCAwKSk7DQo+ICsJcHRlX3Qgb2xkX3B0ZSA9IF9fcHRlKHB0ZV91
cGRhdGUobW0sIGFkZHIsIHB0ZXAsIH5fUEFHRV9IQVNIUFRFLCAwLCAwKSk7DQo+ICsNCj4gKwlw
YWdlX3RhYmxlX2NoZWNrX3B0ZV9jbGVhcihtbSwgYWRkciwgb2xkX3B0ZSk7DQo+ICsNCj4gKwly
ZXR1cm4gb2xkX3B0ZTsNCj4gICB9DQo+ICAgDQo+ICAgI2RlZmluZSBfX0hBVkVfQVJDSF9QVEVQ
X1NFVF9XUlBST1RFQ1QNCj4gQEAgLTU0NSw2ICs1NTEsNyBAQCBzdGF0aWMgaW5saW5lIGJvb2wg
cG1kX3VzZXIocG1kX3QgcG1kKQ0KPiAgIHN0YXRpYyBpbmxpbmUgdm9pZCBfX3NldF9wdGVfYXQo
c3RydWN0IG1tX3N0cnVjdCAqbW0sIHVuc2lnbmVkIGxvbmcgYWRkciwNCj4gICAJCQkJcHRlX3Qg
KnB0ZXAsIHB0ZV90IHB0ZSwgaW50IHBlcmNwdSkNCj4gICB7DQo+ICsJcGFnZV90YWJsZV9jaGVj
a19wdGVfc2V0KG1tLCBhZGRyLCBwdGVwLCBwdGUpOw0KPiAgICNpZiBkZWZpbmVkKENPTkZJR19T
TVApICYmICFkZWZpbmVkKENPTkZJR19QVEVfNjRCSVQpDQo+ICAgCS8qIEZpcnN0IGNhc2UgaXMg
MzItYml0IEhhc2ggTU1VIGluIFNNUCBtb2RlIHdpdGggMzItYml0IFBURXMuIFdlIHVzZSB0aGUN
Cj4gICAJICogaGVscGVyIHB0ZV91cGRhdGUoKSB3aGljaCBkb2VzIGFuIGF0b21pYyB1cGRhdGUu
IFdlIG5lZWQgdG8gZG8gdGhhdA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUv
YXNtL2Jvb2szcy82NC9wZ3RhYmxlLmggYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYm9vazNz
LzY0L3BndGFibGUuaA0KPiBpbmRleCAzMDgzMTExZjlkMGEuLmI1YzU3MThkOWI5MCAxMDA2NDQN
Cj4gLS0tIGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Jvb2szcy82NC9wZ3RhYmxlLmgNCj4g
KysrIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Jvb2szcy82NC9wZ3RhYmxlLmgNCj4gQEAg
LTE4MSw2ICsxODEsOCBAQA0KPiAgICNkZWZpbmUgUEFHRV9BR1AJCShQQUdFX0tFUk5FTF9OQykN
Cj4gICANCj4gICAjaWZuZGVmIF9fQVNTRU1CTFlfXw0KPiArI2luY2x1ZGUgPGxpbnV4L3BhZ2Vf
dGFibGVfY2hlY2suaD4NCj4gKw0KPiAgIC8qDQo+ICAgICogcGFnZSB0YWJsZSBkZWZpbmVzDQo+
ICAgICovDQo+IEBAIC00ODQsOCArNDg2LDExIEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBodWdlX3B0
ZXBfc2V0X3dycHJvdGVjdChzdHJ1Y3QgbW1fc3RydWN0ICptbSwNCj4gICBzdGF0aWMgaW5saW5l
IHB0ZV90IHB0ZXBfZ2V0X2FuZF9jbGVhcihzdHJ1Y3QgbW1fc3RydWN0ICptbSwNCj4gICAJCQkJ
ICAgICAgIHVuc2lnbmVkIGxvbmcgYWRkciwgcHRlX3QgKnB0ZXApDQo+ICAgew0KPiAtCXVuc2ln
bmVkIGxvbmcgb2xkID0gcHRlX3VwZGF0ZShtbSwgYWRkciwgcHRlcCwgfjBVTCwgMCwgMCk7DQo+
IC0JcmV0dXJuIF9fcHRlKG9sZCk7DQo+ICsJcHRlX3Qgb2xkX3B0ZSA9IF9fcHRlKHB0ZV91cGRh
dGUobW0sIGFkZHIsIHB0ZXAsIH4wVUwsIDAsIDApKTsNCj4gKw0KPiArCXBhZ2VfdGFibGVfY2hl
Y2tfcHRlX2NsZWFyKG1tLCBhZGRyLCBvbGRfcHRlKTsNCj4gKw0KPiArCXJldHVybiBvbGRfcHRl
Ow0KPiAgIH0NCj4gICANCj4gICAjZGVmaW5lIF9fSEFWRV9BUkNIX1BURVBfR0VUX0FORF9DTEVB
Ul9GVUxMDQo+IEBAIC00OTQsMTEgKzQ5OSwxNiBAQCBzdGF0aWMgaW5saW5lIHB0ZV90IHB0ZXBf
Z2V0X2FuZF9jbGVhcl9mdWxsKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLA0KPiAgIAkJCQkJICAgIHB0
ZV90ICpwdGVwLCBpbnQgZnVsbCkNCj4gICB7DQo+ICAgCWlmIChmdWxsICYmIHJhZGl4X2VuYWJs
ZWQoKSkgew0KPiArCQlwdGVfdCBvbGRfcHRlOw0KPiArDQo+ICAgCQkvKg0KPiAgIAkJICogV2Ug
a25vdyB0aGF0IHRoaXMgaXMgYSBmdWxsIG1tIHB0ZSBjbGVhciBhbmQNCj4gICAJCSAqIGhlbmNl
IGNhbiBiZSBzdXJlIHRoZXJlIGlzIG5vIHBhcmFsbGVsIHNldF9wdGUuDQo+ICAgCQkgKi8NCj4g
LQkJcmV0dXJuIHJhZGl4X19wdGVwX2dldF9hbmRfY2xlYXJfZnVsbChtbSwgYWRkciwgcHRlcCwg
ZnVsbCk7DQo+ICsJCW9sZF9wdGUgPSByYWRpeF9fcHRlcF9nZXRfYW5kX2NsZWFyX2Z1bGwobW0s
IGFkZHIsIHB0ZXAsIGZ1bGwpOw0KPiArCQlwYWdlX3RhYmxlX2NoZWNrX3B0ZV9jbGVhcihtbSwg
YWRkciwgb2xkX3B0ZSk7DQo+ICsNCj4gKwkJcmV0dXJuIG9sZF9wdGU7DQo+ICAgCX0NCj4gICAJ
cmV0dXJuIHB0ZXBfZ2V0X2FuZF9jbGVhcihtbSwgYWRkciwgcHRlcCk7DQo+ICAgfQ0KPiBAQCAt
ODg0LDYgKzg5NCw4IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBfX3NldF9wdGVfYXQoc3RydWN0IG1t
X3N0cnVjdCAqbW0sIHVuc2lnbmVkIGxvbmcgYWRkciwNCj4gICAJICovDQo+ICAgCXB0ZSA9IF9f
cHRlX3JhdyhwdGVfcmF3KHB0ZSkgfCBjcHVfdG9fYmU2NChfUEFHRV9QVEUpKTsNCj4gICANCj4g
KwlwYWdlX3RhYmxlX2NoZWNrX3B0ZV9zZXQobW0sIGFkZHIsIHB0ZXAsIHB0ZSk7DQo+ICsNCj4g
ICAJaWYgKHJhZGl4X2VuYWJsZWQoKSkNCj4gICAJCXJldHVybiByYWRpeF9fc2V0X3B0ZV9hdCht
bSwgYWRkciwgcHRlcCwgcHRlLCBwZXJjcHUpOw0KPiAgIAlyZXR1cm4gaGFzaF9fc2V0X3B0ZV9h
dChtbSwgYWRkciwgcHRlcCwgcHRlLCBwZXJjcHUpOw0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dl
cnBjL2luY2x1ZGUvYXNtL25vaGFzaC8zMi9wZ3RhYmxlLmggYi9hcmNoL3Bvd2VycGMvaW5jbHVk
ZS9hc20vbm9oYXNoLzMyL3BndGFibGUuaA0KPiBpbmRleCBiOTIwNDRkOWQ3NzguLjYxZTk2Zjgy
MDQ0YSAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL25vaGFzaC8zMi9w
Z3RhYmxlLmgNCj4gKysrIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL25vaGFzaC8zMi9wZ3Rh
YmxlLmgNCj4gQEAgLTE2Niw2ICsxNjYsNyBAQCB2b2lkIHVubWFwX2tlcm5lbF9wYWdlKHVuc2ln
bmVkIGxvbmcgdmEpOw0KPiAgICNkZWZpbmUgX1BBR0VfQ0hHX01BU0sJKFBURV9SUE5fTUFTSyB8
IF9QQUdFX0RJUlRZIHwgX1BBR0VfQUNDRVNTRUQgfCBfUEFHRV9TUEVDSUFMKQ0KPiAgIA0KPiAg
ICNpZm5kZWYgX19BU1NFTUJMWV9fDQo+ICsjaW5jbHVkZSA8bGludXgvcGFnZV90YWJsZV9jaGVj
ay5oPg0KPiAgIA0KPiAgICNkZWZpbmUgcHRlX2NsZWFyKG1tLCBhZGRyLCBwdGVwKSBcDQo+ICAg
CWRvIHsgcHRlX3VwZGF0ZShtbSwgYWRkciwgcHRlcCwgfjAsIDAsIDApOyB9IHdoaWxlICgwKQ0K
PiBAQCAtMzA1LDcgKzMwNiwxMSBAQCBzdGF0aWMgaW5saW5lIGludCBfX3B0ZXBfdGVzdF9hbmRf
Y2xlYXJfeW91bmcoc3RydWN0IG1tX3N0cnVjdCAqbW0sDQo+ICAgc3RhdGljIGlubGluZSBwdGVf
dCBwdGVwX2dldF9hbmRfY2xlYXIoc3RydWN0IG1tX3N0cnVjdCAqbW0sIHVuc2lnbmVkIGxvbmcg
YWRkciwNCj4gICAJCQkJICAgICAgIHB0ZV90ICpwdGVwKQ0KPiAgIHsNCj4gLQlyZXR1cm4gX19w
dGUocHRlX3VwZGF0ZShtbSwgYWRkciwgcHRlcCwgfjAsIDAsIDApKTsNCj4gKwlwdGVfdCBvbGRf
cHRlID0gX19wdGUocHRlX3VwZGF0ZShtbSwgYWRkciwgcHRlcCwgfjAsIDAsIDApKTsNCj4gKw0K
PiArCXBhZ2VfdGFibGVfY2hlY2tfcHRlX2NsZWFyKG1tLCBhZGRyLCBvbGRfcHRlKTsNCj4gKw0K
PiArCXJldHVybiBvbGRfcHRlOw0KPiAgIH0NCj4gICANCj4gICAjZGVmaW5lIF9fSEFWRV9BUkNI
X1BURVBfU0VUX1dSUFJPVEVDVA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUv
YXNtL25vaGFzaC82NC9wZ3RhYmxlLmggYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vbm9oYXNo
LzY0L3BndGFibGUuaA0KPiBpbmRleCAyM2M1MTM1MTc4ZDEuLmZlZGNkZjJhOTU5ZCAxMDA2NDQN
Cj4gLS0tIGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL25vaGFzaC82NC9wZ3RhYmxlLmgNCj4g
KysrIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL25vaGFzaC82NC9wZ3RhYmxlLmgNCj4gQEAg
LTgzLDYgKzgzLDcgQEANCj4gICAjZGVmaW5lIEhfUEFHRV80S19QRk4gMA0KPiAgIA0KPiAgICNp
Zm5kZWYgX19BU1NFTUJMWV9fDQo+ICsjaW5jbHVkZSA8bGludXgvcGFnZV90YWJsZV9jaGVjay5o
Pg0KPiAgIC8qIHB0ZV9jbGVhciBtb3ZlZCB0byBsYXRlciBpbiB0aGlzIGZpbGUgKi8NCj4gICAN
Cj4gICBzdGF0aWMgaW5saW5lIHB0ZV90IHB0ZV9ta3dyaXRlKHB0ZV90IHB0ZSkNCj4gQEAgLTI1
Myw4ICsyNTQsMTEgQEAgc3RhdGljIGlubGluZSB2b2lkIGh1Z2VfcHRlcF9zZXRfd3Jwcm90ZWN0
KHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLA0KPiAgIHN0YXRpYyBpbmxpbmUgcHRlX3QgcHRlcF9nZXRf
YW5kX2NsZWFyKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLA0KPiAgIAkJCQkgICAgICAgdW5zaWduZWQg
bG9uZyBhZGRyLCBwdGVfdCAqcHRlcCkNCj4gICB7DQo+IC0JdW5zaWduZWQgbG9uZyBvbGQgPSBw
dGVfdXBkYXRlKG1tLCBhZGRyLCBwdGVwLCB+MFVMLCAwLCAwKTsNCj4gLQlyZXR1cm4gX19wdGUo
b2xkKTsNCj4gKwlwdGVfdCBvbGRfcHRlID0gX19wdGUocHRlX3VwZGF0ZShtbSwgYWRkciwgcHRl
cCwgfjBVTCwgMCwgMCkpOw0KPiArDQo+ICsJcGFnZV90YWJsZV9jaGVja19wdGVfY2xlYXIobW0s
IGFkZHIsIG9sZF9wdGUpOw0KPiArDQo+ICsJcmV0dXJuIG9sZF9wdGU7DQo+ICAgfQ0KPiAgIA0K
PiAgIHN0YXRpYyBpbmxpbmUgdm9pZCBwdGVfY2xlYXIoc3RydWN0IG1tX3N0cnVjdCAqbW0sIHVu
c2lnbmVkIGxvbmcgYWRkciwNCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2Fz
bS9ub2hhc2gvcGd0YWJsZS5oIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL25vaGFzaC9wZ3Rh
YmxlLmgNCj4gaW5kZXggYjQ5OWRhNmMxYTk5Li42MmIyMjFiN2NjY2YgMTAwNjQ0DQo+IC0tLSBh
L2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ub2hhc2gvcGd0YWJsZS5oDQo+ICsrKyBiL2FyY2gv
cG93ZXJwYy9pbmNsdWRlL2FzbS9ub2hhc2gvcGd0YWJsZS5oDQo+IEBAIC0xODUsNiArMTg1LDcg
QEAgZXh0ZXJuIHZvaWQgc2V0X3B0ZV9hdChzdHJ1Y3QgbW1fc3RydWN0ICptbSwgdW5zaWduZWQg
bG9uZyBhZGRyLCBwdGVfdCAqcHRlcCwNCj4gICBzdGF0aWMgaW5saW5lIHZvaWQgX19zZXRfcHRl
X2F0KHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLCB1bnNpZ25lZCBsb25nIGFkZHIsDQo+ICAgCQkJCXB0
ZV90ICpwdGVwLCBwdGVfdCBwdGUsIGludCBwZXJjcHUpDQo+ICAgew0KPiArCXBhZ2VfdGFibGVf
Y2hlY2tfcHRlX3NldChtbSwgYWRkciwgcHRlcCwgcHRlKTsNCj4gICAJLyogU2Vjb25kIGNhc2Ug
aXMgMzItYml0IHdpdGggNjQtYml0IFBURS4gIEluIHRoaXMgY2FzZSwgd2UNCj4gICAJICogY2Fu
IGp1c3Qgc3RvcmUgYXMgbG9uZyBhcyB3ZSBkbyB0aGUgdHdvIGhhbHZlcyBpbiB0aGUgcmlnaHQg
b3JkZXINCj4gICAJICogd2l0aCBhIGJhcnJpZXIgaW4gYmV0d2Vlbi4=
