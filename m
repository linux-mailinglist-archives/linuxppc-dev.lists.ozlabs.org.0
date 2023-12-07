Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D358087C2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Dec 2023 13:32:33 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=Qa9AtKo3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SmDDv2N9tz3dHK
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Dec 2023 23:32:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=Qa9AtKo3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::62a; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on2062a.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::62a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SmDD3078rz3cW2
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Dec 2023 23:31:46 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J8ByL7494R3wpeN8f1Uq0feSaOVP6dMGNv+30bu6lacv17Y1w6C9GvxaBi4EKLi01RBK8B+ObKqvZrDbbTXYNz83HZPO8Ed4phviscdwlwKsQz6N2Xe99oQ99L+v5WxaG09kssfZta7NjAd/E6bVjdk4gs1MVNOjkb5IGy5KITcuHG4x2ERxaNlggaJQA3HvGu4zV622UR2t8jeAjAkoM1+W8rCPttx8Ux52nM0pBvoATODVSCfGNSW/tk38fDbd0NZXooR9Ar40Z0g5GwZmRiHLA6yL6XcBGRl3t+X/ZE7dA2maCMD0jmKRrgAIZ8d3jVVhtcWTwgWbQnGOuLxK8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zIZeQq542gkjWFufxs/ppZhsY12SCnhs1NQ9cf43Lfw=;
 b=BmgOq/ruWB9fmukrjpqC8C+XFRDAONrrgNR4f/SL084JDCAqpkLBq01uFFBggp1sypxbWvWGzQV/Ria+rTq2Xn1EvlQUc6itfcEvJqRVBJTKg7r5WWGVCaEAPInoeaZjDP9B1hCLU7jwxm/vdRoaEJGSxN44LkcBZ7YnutoRtKDWG5E2PxmzZlSzyI8kx526/ZOji/bPDBi99/fTT7ghqMVXkGLPovZB5B/IxkJlFkef3LXqhUr69TOSjo6HGWvCwmwdJT1UwoshHMvNcy8NxapwIc3c0CtRZu9w+ljG/eI4/qZvgmOfRE14P/0HdugrNzKJACDU71c8QmqPM81lZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zIZeQq542gkjWFufxs/ppZhsY12SCnhs1NQ9cf43Lfw=;
 b=Qa9AtKo3fdbo00pvlRHkbAILmu8fwLu7otMZKiri97+YOe7oG0T1Vt4/nf+lcaxzm9WhsNLG2UJzudQkG1TtyylM9kiY2Owjr97s+p6efW8E6XnV32RfpzXC8dKmfecKXhl52nq6HXVCP0IWYNHtUC5WeI8Fia4au/nKDuwWLRcxZsfiZmFiIVHGF3IcV7G+BEgkb1AQxm75X1E1jPvezAuzFSPqK7ifrh7twqKDwys2zzzFX1cLE99uvPmTTOQy303ShZAVWsTtJLCy/+M4D4D5mtZy+PU+L9K3n5vPQUExvHsqh85hsiQpXoLiGZVVC/zs6XqpsAsRxMmwxemA1g==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2148.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:4::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.27; Thu, 7 Dec 2023 12:31:27 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5bfe:e2f2:6d89:8d97]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5bfe:e2f2:6d89:8d97%3]) with mapi id 15.20.7068.027; Thu, 7 Dec 2023
 12:31:27 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Andy Shevchenko <andy.shevchenko@gmail.com>, George Stark
	<gnstark@salutedevices.com>
Subject: Re: [PATCH v2 01/10] devm-helpers: introduce devm_mutex_init
Thread-Topic: [PATCH v2 01/10] devm-helpers: introduce devm_mutex_init
Thread-Index:  AQHaJty3lcbSNrP0Vk6nW4+1IjDYxbCcXFOAgABCTACAADawAIAABniAgAANGICAANMeAIAACOAA
Date: Thu, 7 Dec 2023 12:31:27 +0000
Message-ID: <3275dec3-fd19-4aa1-8eba-441fd64cc185@csgroup.eu>
References: <20231204180603.470421-1-gnstark@salutedevices.com>
 <20231204180603.470421-2-gnstark@salutedevices.com>
 <81798fe5-f89e-482f-b0d0-674ccbfc3666@redhat.com>
 <29584eb6-fa10-4ce0-9fa3-0c409a582445@salutedevices.com>
 <17a9fede-30e8-4cd5-ae02-fe34e11f5c20@csgroup.eu>
 <be693688-2e82-4e1a-9ead-cf1513ee637b@csgroup.eu>
 <2a68534b-9e64-4d6e-8a49-eeab0889841b@salutedevices.com>
 <CAHp75VdMzZZg3w_jr-SF2APeyq1wVNHK=r=Amf0+JUOq1hy0Fw@mail.gmail.com>
In-Reply-To:  <CAHp75VdMzZZg3w_jr-SF2APeyq1wVNHK=r=Amf0+JUOq1hy0Fw@mail.gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB2148:EE_
x-ms-office365-filtering-correlation-id: 4b9eba9a-109b-4c0b-d9dd-08dbf7206ebb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  LGbGmbIbvxS3z/FIZcB0v/EPSxRUIoF6DeVyBA+TSGZRDUpkCjP83h4yBdMbTYWOdSrKYIvYKu+iyGENAsxe7RkDsbcIYAVolP3D/LNkfXUVwVIYd37EA+0DXSBf57Jt3OnYEfzkQ+KRub6JuIJ/6pm2y9GJigQvjn+JOm05TIjB/u4T3t8cne+d1bTIvIcoUtYowR/wa1DhK5uXygwDv9j2+aYiAAUbV6W+0ZtkcrGeQadUK1m+WGKMpPuelgHek0fZUKvQEvse1DnhxbNW8zqOnBTXn8Siywx+LJ45QRJwGmePQtVO+EPUrqdpLpvm8HGAML/t4cmjo+TJkuGa6NtMcvhLTc887+bMAhWjzZf9RbvjJbGtVALvINherASq4qbIqdQfSazDeZnw8iXsTk5zxAcFP2eK9aTNb2WA0NAqGQQ3Ej2N2XH8cd9HmTbygymes4nm5Z+DvMtSyHNfVeIHLLdZKJO8MkR3I9uxoZdj0l1fbG/loa1iLidm5ZLFK2yp1Y1xgT1JxjrjAgeDvQV4aSokbmQaSqNTa59Dp0A2lldTsyplQvWQUZejAVbaE+y2ST2a39qBxquLeluPukjjVIWhHc8MLHt4KeMBEMhk+Lb5A7mk2HCxvnnejzf4B2hDMoU5nw9istMU6gdau8nvQWxoHF2TCt/F7AwGpZdHEgGOlgXZhRhuH3Eu2xzo+kjt9lZlKqrjThHYNVNcaA==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(366004)(346002)(39850400004)(396003)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(5660300002)(86362001)(54906003)(38070700009)(26005)(66574015)(83380400001)(2906002)(31696002)(64756008)(44832011)(110136005)(316002)(91956017)(76116006)(66946007)(66476007)(4326008)(8676002)(66556008)(66446008)(8936002)(36756003)(6506007)(6512007)(6486002)(41300700001)(966005)(71200400001)(478600001)(7416002)(53546011)(122000001)(31686004)(38100700002)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?MGRPRHBJMWhpZDJscW9ObVg1QTdvcTZ1WEdEditDcndJdzNOWHpoUzMvRzFV?=
 =?utf-8?B?cVNKdjVZWHVzQ25kblNDSEdVVHFGenhaVnRMc2h5Um85VWgwVnRONEM5QUhJ?=
 =?utf-8?B?VXZoS0RuWCtqb21USy8xVStaQWdIMkRmTGc4QWtQL2xwUlFCZkYzM3BCRHQ1?=
 =?utf-8?B?WXFRZ3dPSVkrYTlOS2NLbEtUd3UwNzNRYndHQ2x1cG1VS0dJaUlDSDloQUY5?=
 =?utf-8?B?Ukh4MmNwR1lvb0tYRFNHNFNiWlFvUi92WmNxWFJWVXZCZ2w3QjZoVzlLUE1U?=
 =?utf-8?B?RkFwdVV0RUxNcDFaSlMzcm1ERHZ2aCs3a2lUVGlXZnhqcFdmQ3c3aTdDOXZU?=
 =?utf-8?B?ZTZPdVFhRFU4aG11VXJzQjQ5OSs2SytHRjdsdURuRXEraThuYXpHMURjc1dk?=
 =?utf-8?B?bVlhVC8zMW1jSnAzeFp0Kzc5YkdUWUNsUjRMRWNyYkJyZDkvWXkwUjllMHFM?=
 =?utf-8?B?SXVCaTZnYTdGdjFZMHZlMkRYUnliVHpTYXNuNjJ1MUtEV2REaTZleEJJTk9j?=
 =?utf-8?B?SlRMWVZVN1o0S3ZQL2JRVzhsendzakdDNGlLUGh4d1IrMGVUNUZ0S1hEeTVl?=
 =?utf-8?B?YmRQL2RpNVc1clhGQXZqSmxIUU9Hd0hTV1NYVi9HQzRtZkd3M1hwZTJPVkdI?=
 =?utf-8?B?a2hPdk1NWi9hTzlpcUtVOGg2Z3BTTk84UUdJZ0xORWFBUS9jMXhoQlJSdEQ3?=
 =?utf-8?B?RnplRjg1R2lmYlZzbkNReHc3WGpKOU04aG5Mdnk0NUIwdFYySmh4TmVFVThT?=
 =?utf-8?B?WUt3T1NOWm8zT1JpSWRRb3ZPVXA1d3JtSy80QXRUTi93RDNrMEpvY254YW42?=
 =?utf-8?B?S0cwdHk5Tko3RW1HUjJTYUduY0daRkZvWWZaamRZNXlZYjlYOG5KS25lZCtp?=
 =?utf-8?B?dW1nVFRXTnc0S2h4ZDdmc1Y0WkVhRGpIcWFLOWVDQ0JUZTVYVHEyR2NCdUtt?=
 =?utf-8?B?UWl2SWVHV01acUF2NWU4U0tQeUR4cUo4UlpIdFh2NktscEZoNzlYNTZDTS9n?=
 =?utf-8?B?cHNpektDM29BRkhIeVFBdkNteHZRMmJJNGdaczZrTkVvaVBIWXpsSjVvQU04?=
 =?utf-8?B?Nis4aWMwYXVYTFRoaCsyR0MrT1pJUFhyVjQ2cWNwWExTQ0JKNU5ORzFKcjRo?=
 =?utf-8?B?bllRTTFRdUY3Nmxsd2ZOYXhCNjNkV3VHYUkza1pLdkNPeklQRDJLcnMzeEZW?=
 =?utf-8?B?VkgrYU5qdU9HeXBITTcvNDh4TWI3MEMwc1VlTGptV2U3K3c2QVR4Q1VVa1Ey?=
 =?utf-8?B?cXdMWThtSHBhL3hPQmZLYS9EY3pWSHdyZ1FCMG90TlcrNFA0Zkszak42UDB2?=
 =?utf-8?B?SXZ6a0JYWGhaN0JWSWhhaitXZjhqY2RyejJsSWx5UEZoWlZWT3FhTitHTGJY?=
 =?utf-8?B?djJtUHFVMXZYTHZzMEt3bmYvbkozUHRkNEt0MXhoUXAwbXlHNWpGV0htdERm?=
 =?utf-8?B?dG1sdTc5V08rRVpUNXFqSkdGTFQ1SmRsTUZ1YnZjcDJHbmRiZVlmdmRwdGJX?=
 =?utf-8?B?aUppVGdXSmMxYm5yZVhqRjhaWWJ5eWl0QlBYQzQxNk11WG44SUNMQUFrT1ZU?=
 =?utf-8?B?cS9aSFJJaW1NNUJMVE8vdmwyZHlCZGE0QlUxVXVxbVZhTTdydVhGUEpIU2hp?=
 =?utf-8?B?cGJ4ZDF4ZWpEYllHNE5xRHcydlppc0FUWnJ4cGlXQVo2NWUxbWNBWWc0Y1k0?=
 =?utf-8?B?ZmlXUENNM3JJL2IrRitKTGEzNWhXbVJrdzBGRHo0TndlTEFLL0QvMThkZEpG?=
 =?utf-8?B?dGF6eklkQUljaXdoU2l1dTUvaWlIWUxLMXBIaVNGZFlmdTNsb3NzM2s1aWxx?=
 =?utf-8?B?K3FWYWxwZlFvbEJTRm41QTRqYU5rRFdXUUlKcmZ3VUpiU0hsOTFIbzdTdmd3?=
 =?utf-8?B?YmlYakZzYnVLTUpWYTVmOEpDNE1PNVp5WVRldjRYMVRxY2hJb3hOdC8zaTdo?=
 =?utf-8?B?R3pXdWhwaHNNR0VTMVRqVThjRHUrK0pOeGZpamtXRDEwV2x1eC9Fd0pWUHpj?=
 =?utf-8?B?bWNZbWFKcVhPL0ZKWnB3ZzB0TFNHUDVwZ0dWQy8yRVprWHZSSjZsb2FMdmxu?=
 =?utf-8?B?S3FwVnBuSkhRM3o2bm8zOUh2UkR3N0xUK1NSSnNQQ0YvZEVGVlZ0OUZzVThl?=
 =?utf-8?Q?YKvZx9htcB2+4YF52rZXyKUkU?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9049F5BB9D26124186702FA26BF742DF@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b9eba9a-109b-4c0b-d9dd-08dbf7206ebb
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2023 12:31:27.1377
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q6EimE8MNBqWIh47lGoBnQE+ith83X6gh0u3SCU6KStl7Dc77zvRzoeuNd5zRd8RVf0yIrdsyrvZrwBaH8B5LE3CHuwk4sepT9BEwAA2/mw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2148
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "vadimp@nvidia.com" <vadimp@nvidia.com>, "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>, "peterz@infradead.org" <peterz@infradead.org>, "boqun.feng@gmail.com" <boqun.feng@gmail.com>, "lee@kernel.org" <lee@kernel.org>, "kernel@salutedevices.com" <kernel@salutedevices.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "npiggin@gmail.com" <npiggin@gmail.com>, Hans de Goede <hdegoede@redhat.com>, "mingo@redhat.com" <mingo@redhat.com>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, "pavel@ucw.cz" <pavel@ucw.cz>, Waiman Long <longman@redhat.com>, "will@kernel.org" <will@kernel.org>, "jic23@kernel.org" <jic23@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA3LzEyLzIwMjMgw6AgMTI6NTksIEFuZHkgU2hldmNoZW5rbyBhIMOpY3JpdMKgOg0K
PiBPbiBUaHUsIERlYyA3LCAyMDIzIGF0IDE6MjPigK9BTSBHZW9yZ2UgU3RhcmsgPGduc3RhcmtA
c2FsdXRlZGV2aWNlcy5jb20+IHdyb3RlOg0KPj4gT24gMTIvNy8yMyAwMTozNywgQ2hyaXN0b3Bo
ZSBMZXJveSB3cm90ZToNCj4+PiBMZSAwNi8xMi8yMDIzIMOgIDIzOjE0LCBDaHJpc3RvcGhlIExl
cm95IGEgw6ljcml0IDoNCj4+Pj4gTGUgMDYvMTIvMjAyMyDDoCAxOTo1OCwgR2VvcmdlIFN0YXJr
IGEgw6ljcml0IDoNCj4+Pj4+IE9uIDEyLzYvMjMgMTg6MDEsIEhhbnMgZGUgR29lZGUgd3JvdGU6
DQo+Pj4+Pj4gT24gMTIvNC8yMyAxOTowNSwgR2VvcmdlIFN0YXJrIHdyb3RlOg0KPiANCj4gLi4u
DQo+IA0KPj4+Pj4+IG11dGV4X2Rlc3Ryb3koKSBvbmx5IGFjdHVhbGx5IGRvZXMgYW55dGhpbmcg
aWYgQ09ORklHX0RFQlVHX01VVEVYRVMNCj4+Pj4+PiBpcyBzZXQsIG90aGVyd2lzZSBpdCBpcyBh
biBlbXB0eSBpbmxpbmUtc3R1Yi4NCj4+Pj4+Pg0KPj4+Pj4+IEFkZGluZyBhIGRldnJlcyByZXNv
dXJjZSB0byB0aGUgZGV2aWNlIGp1c3QgdG8gY2FsbCBhbiBlbXB0eSBpbmxpbmUNCj4+Pj4+PiBz
dHViIHdoaWNoIGlzIGEgbm8tb3Agc2VlbXMgbGlrZSBhIHdhc3RlIG9mIHJlc291cmNlcy4gSU1I
TyBpdA0KPj4+Pj4+IHdvdWxkIGJlIGJldHRlciB0byBjaGFuZ2UgdGhpcyB0bzoNCj4+Pj4+Pg0K
Pj4+Pj4+IHN0YXRpYyBpbmxpbmUgaW50IGRldm1fbXV0ZXhfaW5pdChzdHJ1Y3QgZGV2aWNlICpk
ZXYsIHN0cnVjdCBtdXRleA0KPj4+Pj4+ICpsb2NrKQ0KPj4+Pj4+IHsNCj4+Pj4+PiAgICAgICAg
IG11dGV4X2luaXQobG9jayk7DQo+Pj4+Pj4gI2lmZGVmIENPTkZJR19ERUJVR19NVVRFWEVTDQo+
Pj4+Pj4gICAgICAgICByZXR1cm4gZGV2bV9hZGRfYWN0aW9uX29yX3Jlc2V0KGRldiwgZGV2bV9t
dXRleF9yZWxlYXNlLCBsb2NrKTsNCj4+Pj4+PiAjZWxzZQ0KPj4+Pj4+ICAgICAgICAgcmV0dXJu
IDA7DQo+Pj4+Pj4gI2VuZGlmDQo+Pj4+Pj4gfQ0KPj4+Pj4+DQo+Pj4+Pj4gVG8gYXZvaWQgdGhl
IHVubmVjZXNzYXJ5IGRldnJlcyBhbGxvY2F0aW9uIHdoZW4NCj4+Pj4+PiBDT05GSUdfREVCVUdf
TVVURVhFUyBpcyBub3Qgc2V0Lg0KPj4+Pj4NCj4+Pj4+IEhvbmVzdGx5IHNheWluZyBJIGRvbid0
IGxpa2UgdW5uZWNlc3NhcnkgZGV2cmVzIGFsbG9jYXRpb24gZWl0aGVyIGJ1dA0KPj4+Pj4gdGhl
IHByb3Bvc2VkIGFwcHJvYWNoIGhhcyBpdHMgb3duIHByaWNlOg0KPj4+Pj4NCj4+Pj4+IDEpIHdl
J2xsIGhhdmUgbW9yZSB0aGFuIG9uZSBwbGFjZSB3aXRoIGJyYW5jaGluZyBpZiBtdXRleF9kZXN0
cm95IGlzDQo+Pj4+PiBlbXB0eSBvciBub3QgdXNpbmcgIGluZGlyZWN0IGNvbmRpdGlvbi4gSWYg
c3VkZGVubHkgbXV0ZXhfZGVzdHJveSBpcw0KPj4+Pj4gZXh0ZW5kZWQgZm9yIG5vbi1kZWJ1ZyBj
b2RlIChpbiB1cHN0cmVhbSBicmFuY2ggb3IgZS5nLiBieSBzb21lb25lIGZvcg0KPj4+Pj4gbG9j
YWwgZGVidWcpIHRoYW4gdGhlcmUnbGwgYmUgYSBwcm9ibGVtLg0KPj4+Pj4NCj4+Pj4+IDIpIElm
IG11dGV4X2Rlc3Ryb3kgaXMgZW1wdHkgb3Igbm90IGRlcGVuZHMgb24gQ09ORklHX1BSRUVNUFRf
UlQgb3B0aW9uDQo+Pj4+PiB0b28uIFdoZW4gQ09ORklHX1BSRUVNUFRfUlQgaXMgb24gbXV0ZXhf
ZGVzdHJveSBpcyBhbHdheXMgZW1wdHkuDQo+Pj4+Pg0KPj4+Pj4gQXMgSSBzZWUgaXQgb25seSB0
aGUgbXV0ZXggaW50ZXJmYWNlIChtdXRleC5oKSBoYXMgdG8gc2F5IGRlZmluaXRlbHkgaWYNCj4+
Pj4+IG11dGV4X2Rlc3Ryb3kgbXVzdCBiZSBjYWxsZWQuIFByb2JhYmx5IHdlIGNvdWxkIGFkZCBz
b21lIGRlZmluZSB0bw0KPj4+Pj4gaW5jbHVkZS9saW51eC9tdXRleC5oLGxpa2UgSVNfTVVURVhf
REVTVFJPWV9SRVFVSVJFRCBhbmQgZGVjbGFyZSBpdCBuZWFyDQo+Pj4+PiBtdXRleF9kZXN0cm95
IGRlZmluaXRpb24gaXRzZWxmLg0KPj4+Pj4NCj4+Pj4+IEkgdHJpZWQgdG8gcHV0IGRldm1fbXV0
ZXhfaW5pdCBpdHNlbGYgaW4gbXV0ZXguaCBhbmQgaXQgY291bGQndmUgaGVscGVkDQo+Pj4+PiB0
b28gYnV0IGl0J3Mgbm90IHRoZSBwbGFjZSBmb3IgZGV2bSBBUEkuDQo+Pj4+Pg0KPj4+Pg0KPj4+
PiBXaGF0IGRvIHlvdSBtZWFuIGJ5ICJpdCdzIG5vdCB0aGUgcGxhY2UgZm9yIGRldm0gQVBJIiA/
DQo+Pj4+DQo+Pj4+IElmIHlvdSBkbyBhICdncmVwIGRldm1fIGluY2x1ZGUvbGludXgvJyB5b3Un
bGwgZmluZCBkZXZtXyBmdW5jdGlvbnMgaW4NCj4+Pj4gYWxtb3N0IDEwMCAuaCBmaWxlcy4gV2h5
IHdvdWxkbid0IG11dGV4LmggYmUgdGhlIHBsYWNlIGZvcg0KPj4+PiBkZXZtX211dGV4X2luaXQo
KSA/DQo+PiBtdXRleC5oJ3MgbWFpbnRhaW5lcnMgYmVsaWV2ZSBzby4NCj4+DQo+PiBodHRwczov
L2xvcmUua2VybmVsLm9yZy9sa21sLzA3MGMxNzRjLTA1N2EtNDZkZS1hZThlLTgzNmU5ZTIwZWNl
YkBzYWx1dGVkZXZpY2VzLmNvbS9ULyNtYjQyZTFkNzc2MDgxNmIwY2VkZDMxMzBlMDhmMjk2OTA0
OTZiNWFjMg0KPj4+DQo+Pj4gTG9va2luZyBhdCBpdCBjbG9zZXIsIEkgaGF2ZSB0aGUgZmVlbGlu
ZyB0aGF0IHlvdSB3YW50IHRvIGRvIHNpbWlsYXIgdG8NCj4+PiBkZXZtX2dwaW9fcmVxdWVzdCgp
IGluIGxpbnV4L2dwaW8uaCA6DQo+Pj4NCj4+PiBJbiBsaW51eC9tdXRleC5oLCBhZGQgYSBwcm90
b3R5cGUgZm9yIGRldm1fbXV0ZXhfaW5pdCgpIHdoZW4NCj4+PiBDT05GSUdfREVCVUdfTVVURVhF
UyBpcyBkZWZpbmVkIGFuZCBhbiBlbXB0eSBzdGF0aWMgaW5saW5lIG90aGVyd2lzZS4NCj4+PiBU
aGVuIGRlZmluZSBkZXZtX211dGV4X2luaXQoKSBpbiBrZXJuZWwvbG9ja2luZy9tdXRleC1kZWJ1
Zy5jDQo+Pg0KPj4gWWVzLCB0aGlzIHdvdWxkIGJlIGFsbW9zdCBwZXJmZWN0IGRlY2lzaW9uLiBC
VFcganVzdCBhcyBpbiBsaW51eC9ncGlvLmgNCj4+IHdlIHdvdWxkbid0IGhhdmUgdG8gaW5jbHVk
ZSB3aG9sZSAibGludXgvZGV2aWNlLmgiIGludG8gbXV0ZXguaCwgb25seQ0KPj4gYWRkIGZvcndh
cmQgZGVjbGFyYXRpb24gb2Ygc3RydWN0IGRldmljZTsNCj4+DQo+Pj4gV291bGRuJ3QgdGhhdCB3
b3JrID8NCj4gDQo+IE5vLiBJdCB3aWxsIHJlcXVpcmUgaW5jbHVzaW9uIG9mIGRldmljZS5oICh3
aGljaCBpcyBhIHR3aXN0ZWQgaGVsbA0KPiBmcm9tIHRoZSBoZWFkZXIgcGVyc3BlY3RpdmUpIGlu
dG8gbXV0ZXguaC4gQ29tcGxldGVseSB1bmFwcHJlY2lhdGVkDQo+IG1vdmUuDQo+IA0KDQpJIHNl
ZSBubyByZWFzb24gZm9yIGluY2x1ZGluZyBkZXZpY2UuaCwgSSB0aGluayBhIGZvcndhcmQgZGVj
bGFyYXRpb24gb2YgDQpzdHJ1Y3QgZGV2aWNlIHdvdWxkIGJlIGVub3VnaCwgYXMgZG9uZSBpbiBs
aW51eC9ncGlvLmgNCg0KQW0gSSBtaXNzaW5nIHNvbWV0aGluZyA/DQo=
