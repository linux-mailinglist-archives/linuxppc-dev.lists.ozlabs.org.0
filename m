Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D29E8088BA
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Dec 2023 14:03:10 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=M2M1MFfV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SmDwC6y9wz3vdC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Dec 2023 00:03:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=M2M1MFfV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::60d; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on2060d.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::60d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SmDvL5BWrz30MQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Dec 2023 00:02:21 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ae+r/0A0/JMwC4EtKw1rTEPSKO52uRbw0u9qYvYpRs2Ka4juUfC+CZNMWcv3FRjjJITe+BZEXIFQhL1nRJ/dNgUPeVtCzbHXK8lAR2XTj5WPkz0gVQhiReurZAcJO1RYSVHtNUKnqBu5c2ZU9nY3iDIA3En3LrMA7pQpKVzsyeZAmSTYG7kNz6NiuhBF/R2vodfWGWL8TY7KOhRFu9qrHwj7whw3iIanaGEzZZpe5qV/PsME5VzUteNmuofgt1M3/pgTDGqaT8HNU08nU88c9Xbu/aEtaxpUz3bEc+lwaks9B/YPSNYWVO+OH3BjZNQm9r3gLZGKVbqwp0/ui6nH3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jEotr1zB3jGT2pTPHEZqn6a7uHo0OP5OPvaItZq8pB8=;
 b=gxIeVr1NfcXFW8ZzNGbO9krXLuVtESP1lXl6b4QZqEvOX1f1NODuz3XVNGYNi9hf3TGteGndqvq14nucMgu6ZggAfsUO48zbD12Es9y1XhLEWxfrS4JSwRWVgzmF756XH6/7J7IWja8ScsqM+S0pZLCcmq/kC/zFviqi71hHF/YXHtauFo5ajh2JP/pVYmRgqwbMfldZQWl2ti7bNvpnX4tfl83pmB0zX54RAjSfqVChvlZz0Jt0Vbai4qq5SEf/pCAQqr+FhRbGwiMxmpPzG75mnxGjNbsk56a4Bv4X98SuALNOM39uuJ39Mn8/dYxxH44ROgc9iEv28+aLJBenSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jEotr1zB3jGT2pTPHEZqn6a7uHo0OP5OPvaItZq8pB8=;
 b=M2M1MFfVI8zuAavqGcilreSSJSTaPPbdGPlvygeqveCdBagbdj3yceFndXyG5x7ERFI1CEB3J1nyoX3nwdM/kCemcRZoOLQcA0DoF9pT31W5Ol3kBQmezB1CBXIhgiUiBNNTB9oV2ni9aE/gdlgXXFVcUntpWgjyEneLz+XYTK+ZWF2krVhRehHSgSL4Msp8ZzMg8E6wr/FV7MkCkwroR/06+SsHEgOfEEG0XBGU54tBklkOCr9g5xD7y4Qx/+704Dvl6DSDNOkPpqH7ZxMJbSAUPJpaoW03qETh0yaDyeIlMp6GVeSPvsBkd1J25/xYhC2iqGUG2lMByGA5OH5x9w==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB1553.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:13::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.27; Thu, 7 Dec
 2023 13:01:59 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5bfe:e2f2:6d89:8d97]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5bfe:e2f2:6d89:8d97%3]) with mapi id 15.20.7068.027; Thu, 7 Dec 2023
 13:01:59 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: George Stark <gnstark@salutedevices.com>, Andy Shevchenko
	<andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2 01/10] devm-helpers: introduce devm_mutex_init
Thread-Topic: [PATCH v2 01/10] devm-helpers: introduce devm_mutex_init
Thread-Index:  AQHaJty3lcbSNrP0Vk6nW4+1IjDYxbCcXFOAgABCTACAADawAIAABniAgAANGICAANPogIAABymAgAAGmQCAAALdgA==
Date: Thu, 7 Dec 2023 13:01:59 +0000
Message-ID: <08cf2729-78c4-44a3-ac3f-78c652a527ff@csgroup.eu>
References: <20231204180603.470421-1-gnstark@salutedevices.com>
 <20231204180603.470421-2-gnstark@salutedevices.com>
 <81798fe5-f89e-482f-b0d0-674ccbfc3666@redhat.com>
 <29584eb6-fa10-4ce0-9fa3-0c409a582445@salutedevices.com>
 <17a9fede-30e8-4cd5-ae02-fe34e11f5c20@csgroup.eu>
 <be693688-2e82-4e1a-9ead-cf1513ee637b@csgroup.eu>
 <2a68534b-9e64-4d6e-8a49-eeab0889841b@salutedevices.com>
 <CAHp75Veyz-hMYPDEiCC1WJASGZ8N9pVef0foYJ0vBcW2VpfR+w@mail.gmail.com>
 <34060476-86e5-42fb-a139-6790487c1568@csgroup.eu>
 <57ea099a-8b88-4b16-9b54-b81e5b28bcb6@salutedevices.com>
In-Reply-To: <57ea099a-8b88-4b16-9b54-b81e5b28bcb6@salutedevices.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB1553:EE_
x-ms-office365-filtering-correlation-id: e4a43b4f-c2bd-418d-ada4-08dbf724b2e9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  O3l8ZQ6a+O2giq/g/O33+yofSX3P7prHje9611LWQP8Fe7P21FAv9Z7GopnUOsguJHTTyfNpKbPfwW3PKldyH/Ukqeu787QQj564on+kPkn6bIjsOcsvSOTV1fyTz0YRgYsF5zopU1PvaUVSNSJAUseJ02u7ScsL1I8OYUbFoNvyT2Aao+qheRp2vwW/mmSjlPhoEheLfwh8nj17i99BlD04yA1cNCOBxrgJuLEgMRRawDzcvoXWZBc/MUq+uVDl/dXTS04cS5sN5+g3cC8R0U8mZCjKp7+S107pVI2OTXHm9Z/MiMUhVf/jB54eCDwJrCJz1NFlYtueja21Eb8mhzGHlCh0oJ/CSqR8e2EeceU4aNPTp8lOWbo8uW5+xRaMezbt9ekE2/t54Rs+D9HCmh8T9ccLxBOSDvlLEA9AP7VWzQHUUz9pd2ddDv4dKXe6Oc/yx9bw3iazLZT3Oc2FwkLQZbk0vYAPYbQundDTHrpAkfclyIc38DNZ/8IXWsPdd+vFy7yhgpfgWtimlI60Y3uJj2Rcc27qeWrpsoxqEFN9nhr6IZ2iUOXi9pWUSh7BwD58Cbv/9CfUHZbsscXY+GlGekbsp0nSMOkReGQ6/CdXe8lM6HrgPbok2tDhZ5R7eSgkc4xwNLWDwwE921ADQrckV0tl+TS2tgjULNFrH07gaRyHoeWyuhH5ZdvhlL3i
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376002)(39850400004)(136003)(346002)(366004)(396003)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(316002)(110136005)(66556008)(64756008)(66446008)(66946007)(91956017)(66476007)(76116006)(54906003)(36756003)(53546011)(6506007)(41300700001)(26005)(2616005)(71200400001)(6486002)(38070700009)(83380400001)(478600001)(31696002)(122000001)(38100700002)(86362001)(66574015)(6512007)(44832011)(5660300002)(7416002)(2906002)(31686004)(8936002)(8676002)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?eTdZSVBRQ08vRWx0QmRQMUx0MlpRWE5CMFBHK0hXZ1pzVDh6bFRBTjIxblph?=
 =?utf-8?B?cnlnNE5SYWtVUnQ2TFdoYWlXSTMybmdnOERFYVpWSkxHcy8vZHh5OXljeWVK?=
 =?utf-8?B?c00rdkF5V0dQTCtUa2tnOHJhd2JpaEF6S2c2M3NTOTJhcm9iYmhwWWpMVjQ2?=
 =?utf-8?B?ZmhsTHdRbmdqOXpaWmVxakxuR0V1Nko2Um8xME9scUNkaEJXKzlVcjNlV1NY?=
 =?utf-8?B?UWRJcnFKcGg5dXprL2M3SWtWdFljZDNqa3FueUZ1QVpTNyt1dmkwelhZYmtp?=
 =?utf-8?B?RzZmNEZjV2pMTVIvSmNmN2dVNSs3dzUyTHZwam5GaWo5bHhsZDBJbUcvRzAw?=
 =?utf-8?B?OHhNalNndmFSSG9VeXZncFRZVWFJVE1KMWRlRXhkWVh4RWRrN3VxaTVEdHdC?=
 =?utf-8?B?ODhDdWU3T1FieUJ6a2s4T3RqYnc2Uzltazd4YmJFS3JlUEUxalIwZ1lCOVF4?=
 =?utf-8?B?RllZZExUNTFHcjdQOWkrdGRWY0ZhU2s3RkNHT3R5REJ1R0pVdk5sc3N2QTdD?=
 =?utf-8?B?ZXBmbTlTeGovWUJYNkNiaXVxS2Vub0dQblRxZlMxT0YzVjlUd1I5ZTF0UWFo?=
 =?utf-8?B?Mk56M0VGSFpYbS9zamxoTmxHMU4wVzNjeWRjZFZmeDFhODVMbHhFZjFWamNV?=
 =?utf-8?B?UHFiSkNZb3FGbC9ZUFh3RDNjMDVXTW8wL1cxZ1BNOFFHVG5FWWpBMXhZRVVD?=
 =?utf-8?B?ZmFMWnZqTHFuQTB6RjhJS0lzTTFROG1xK1E3TlFIQWxxRVV4WEsvUGZXbXBz?=
 =?utf-8?B?emxnV20xeFEzc1d3T3E5MTFuNEhZRUQ0R1pUY0NwVUpJVnJYTktYaCtBd1hN?=
 =?utf-8?B?U1NKZ1I4aTZqU1hVWHcvMm9HUnhneGhlRWlFbkFqNzI5Q2VVZGZrNG8zM2VL?=
 =?utf-8?B?TjAxc1E5TnFqWXpwUlJEQ1FoWVpiZCtpTUtIVzJneWZnUnpEVGc3VGRvUUxs?=
 =?utf-8?B?Zmdya280ZG0yczFGTmNDeXJJVlliMXNKcjVTSkxPcFVoWEdKaHlyWi9HdzFY?=
 =?utf-8?B?VHhxRXRkSnloajZTbG82QXJCaVpTWjZMeWFXU092VDZUUVhxZktrMWEvcStB?=
 =?utf-8?B?MzBYSWRDK3pUNTVDMDYxNi9ZM3VKZTBDcmh4ekgzenEzL1RtVUZmVGhSdFVa?=
 =?utf-8?B?Tjh5RS9CYlNzMmNaejUxN3lwRURRck4wWFNjclk0cjhBWk9rVlFyZE5GTnVk?=
 =?utf-8?B?SFd2SDJtcFlibFBRSkN4WmIrYkp5b3hkMFZYMGVrbDdDancvSDdJWVJkbVUv?=
 =?utf-8?B?UlgxOGpnTmpuelZJcWtxQXcxRkpuWnUvUG5VcGo2c09kaGFhRlFQWmY3RlFQ?=
 =?utf-8?B?RkRTU3BycmxpOERFc1RhclBnOEI3bHVtZUpaWElueFlyd3BHVHJ0L3JWYThW?=
 =?utf-8?B?dHMzSkxvT3kzSWV1aE9DbmV1dmIrVmZyd0xjZGVPVE1kNm1KS29tc2R6SDFL?=
 =?utf-8?B?L0xoRzMyUFp2NHMwRVl6eU92Q2FOZUNwVERuYjhuam5MK0x1eHRIRDFQOUkr?=
 =?utf-8?B?TTBkeUw5Q1l4RVpUVHo3eDJacWEyQ3BtMlQ3NzEyMUpFK2I5TktxOHhvN3dJ?=
 =?utf-8?B?OUZrNXBWTUpnb0l2WlRBTmd3QVBVaWlWSWY3M2RpZUJPZjV2ZXA1UFV6ZFo1?=
 =?utf-8?B?WUQ0SVIvUTR1ZUFpQXNEYzJlSGlIVWtRQ1pJVXY5YjFyWnNnblYyL1M2QVZN?=
 =?utf-8?B?WS82bU9PZGJPekR3UkZNVVZHNkJwWkt4S3pBZ0s2bGc3V2lGQ25PQ01GVjVj?=
 =?utf-8?B?QmhmQmxuSm9IcTV3dnNMVmxqZThGRHJVRlBNaGpPZnRIQ0plZFJTNngveGFV?=
 =?utf-8?B?KzZ2VXlkMndsZXpjNDJsbjdrTVhRRDl0UCs1SVFRQ3FaaExXZElZUEZqUU1n?=
 =?utf-8?B?WHBjNGVhd2U2MXdOVG85VmVLTCt1dVRSZDByR20zVHJIam9FbU9kckhyNmQ3?=
 =?utf-8?B?STdpMEhvZVlqRXVRbS9HQnk5SVZKcHFYVmJrKzJJU3RhaUNhdUhOdEdNYjVx?=
 =?utf-8?B?T3Y2bkVrOEpqbkRaeXFOc1Y0eFNBblVEMS9CUFI4STA2WmVWSWhPalhKa0t0?=
 =?utf-8?B?b0xsQkN5eGZ4MGpjQVJ0UVoxYzBjbFZKenRyVGxHQXhXc0JVWE1DL3JHRWVo?=
 =?utf-8?Q?vTqWk2Nbc7k7h4EA+zwk7hE3E?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DA23485E7D9F2D4FAC24E0652362FA9B@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e4a43b4f-c2bd-418d-ada4-08dbf724b2e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2023 13:01:59.5076
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lUazAFfbMxJR4Ra4IzTvX4JPba23PO8358zzPK2NVNM8+u6oTZ1se8AonKMhPPnvr3ImFmj7Rdj/yf0HyREzBD/8yB41ZhZ03isVb5a6t4U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1553
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

DQoNCkxlIDA3LzEyLzIwMjMgw6AgMTM6NTEsIEdlb3JnZSBTdGFyayBhIMOpY3JpdMKgOg0KPiAN
Cj4gDQo+IE9uIDEyLzcvMjMgMTU6MjgsIENocmlzdG9waGUgTGVyb3kgd3JvdGU6DQo+Pg0KPj4N
Cj4+IExlIDA3LzEyLzIwMjMgw6AgMTM6MDIsIEFuZHkgU2hldmNoZW5rbyBhIMOpY3JpdMKgOg0K
Pj4+IE9uIFRodSwgRGVjIDcsIDIwMjMgYXQgMToyM+KAr0FNIEdlb3JnZSBTdGFyayANCj4+PiA8
Z25zdGFya0BzYWx1dGVkZXZpY2VzLmNvbT4gd3JvdGU6DQo+Pj4+IE9uIDEyLzcvMjMgMDE6Mzcs
IENocmlzdG9waGUgTGVyb3kgd3JvdGU6DQo+Pj4+PiBMZSAwNi8xMi8yMDIzIMOgIDIzOjE0LCBD
aHJpc3RvcGhlIExlcm95IGEgw6ljcml0IDoNCj4+Pg0KPj4+IC4uLg0KPj4+DQo+Pj4+PiBMb29r
aW5nIGF0IGl0IGNsb3NlciwgSSBoYXZlIHRoZSBmZWVsaW5nIHRoYXQgeW91IHdhbnQgdG8gZG8g
DQo+Pj4+PiBzaW1pbGFyIHRvDQo+Pj4+PiBkZXZtX2dwaW9fcmVxdWVzdCgpIGluIGxpbnV4L2dw
aW8uaCA6DQo+Pj4+Pg0KPj4+Pj4gSW4gbGludXgvbXV0ZXguaCwgYWRkIGEgcHJvdG90eXBlIGZv
ciBkZXZtX211dGV4X2luaXQoKSB3aGVuDQo+Pj4+PiBDT05GSUdfREVCVUdfTVVURVhFUyBpcyBk
ZWZpbmVkIGFuZCBhbiBlbXB0eSBzdGF0aWMgaW5saW5lIG90aGVyd2lzZS4NCj4+Pj4+IFRoZW4g
ZGVmaW5lIGRldm1fbXV0ZXhfaW5pdCgpIGluIGtlcm5lbC9sb2NraW5nL211dGV4LWRlYnVnLmMN
Cj4+Pj4NCj4+Pj4gWWVzLCB0aGlzIHdvdWxkIGJlIGFsbW9zdCBwZXJmZWN0IGRlY2lzaW9uLiBC
VFcganVzdCBhcyBpbiBsaW51eC9ncGlvLmgNCj4+Pj4gd2Ugd291bGRuJ3QgaGF2ZSB0byBpbmNs
dWRlIHdob2xlICJsaW51eC9kZXZpY2UuaCIgaW50byBtdXRleC5oLCBvbmx5DQo+Pj4+IGFkZCBm
b3J3YXJkIGRlY2xhcmF0aW9uIG9mIHN0cnVjdCBkZXZpY2U7DQo+Pj4NCj4+PiBJbiBjYXNlIHlv
dSBwbGFjZSBpdCBpbnRvIGEgQy1maWxlLiBPdGhlcndpc2UgeW91IG5lZWQgYSBoZWFkZXIgZm9y
DQo+Pj4gdGhlIEFQSSBhbmQgdGhhdCBpcyBub3QgYWNjZXB0YWJsZSBmb3IgbXV0ZXguaC4NCj4+
Pg0KPj4NCj4+IFJpZ2h0LCB0aGF0J3MgdGhlIHJlYXNvbiB3aHkgSSdtIHN1Z2dlc3RpbmcgdG8g
ZGVmaW5lIGRldm1fbXV0ZXhfaW5pdCgpDQo+PiBpbiBrZXJuZWwvbG9ja2luZy9tdXRleC1kZWJ1
Zy5jLg0KPj4NCj4+IEluIGxpbnV4L211dGV4LmgsIHlvdSBkZWZpbmUgYSBzdHViIGZvciB3aGVu
IENPTkZJR19ERUJVR19NVVRFWEVTIGlzIG5vdA0KPj4gc2V0LCBhbmQgdGhlIHByb3RvdHlwZSBv
ZiBkZXZtX211dGV4X2luaXQoKSB3aGVuIENPTkZJR19ERUJVR19NVVRFWEVTIGlzDQo+PiBzZXQu
DQo+IA0KPiBTb21ldGhpbmcgbGlrZSB0aGlzOg0KPiANCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUv
bGludXgvbXV0ZXguaCBiL2luY2x1ZGUvbGludXgvbXV0ZXguaA0KPiBpbmRleCBhMzNhYTllYjlm
YzMuLjRhNjA0MWE3ZmQ0NCAxMDA2NDQNCj4gLS0tIGEvaW5jbHVkZS9saW51eC9tdXRleC5oDQo+
ICsrKyBiL2luY2x1ZGUvbGludXgvbXV0ZXguaA0KPiBAQCAtMjEsNiArMjEsOCBAQA0KPiAgwqAj
aW5jbHVkZSA8bGludXgvZGVidWdfbG9ja3MuaD4NCj4gIMKgI2luY2x1ZGUgPGxpbnV4L2NsZWFu
dXAuaD4NCj4gDQo+ICtzdHJ1Y3QgZGV2aWNlOw0KPiArDQo+ICDCoCNpZmRlZiBDT05GSUdfREVC
VUdfTE9DS19BTExPQw0KPiAgwqAjIGRlZmluZSBfX0RFUF9NQVBfTVVURVhfSU5JVElBTElaRVIo
bG9ja25hbWUpwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcDQo+ICDCoMKgwqDCoMKgwqDCoMKgICwg
LmRlcF9tYXAgPSB7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXA0KPiBA
QCAtMTI3LDYgKzEyOSwyMCBAQCBleHRlcm4gdm9pZCBfX211dGV4X2luaXQoc3RydWN0IG11dGV4
ICpsb2NrLCBjb25zdCANCj4gY2hhciAqbmFtZSwNCj4gIMKgICovDQo+ICDCoGV4dGVybiBib29s
IG11dGV4X2lzX2xvY2tlZChzdHJ1Y3QgbXV0ZXggKmxvY2spOw0KPiANCj4gKyNpZmRlZiBDT05G
SUdfREVCVUdfTVVURVhFUw0KDQpUaGVyZSBpcyBhbHJlYWR5IGEgQ09ORklHX0RFQlVHX01VVEVY
RVMgYmxvY2ssIGNhbiB5b3UgcmUtdXNlIGl0ID8NCg0KPiArDQo+ICtleHRlcm4gaW50IGRldm1f
bXV0ZXhfaW5pdChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBtdXRleCAqbG9jayk7DQoNCidl
eHRlcm4nIGlzIHBvaW50bGVzcyBhbmQgZGVwcmVjYXRlZCBmb3IgZnVuY3Rpb24gcHJvdG90eXBl
cy4NCkkga25vdyB0aGUga2VybmVsIGlzIGZ1bGwgb2YgdGhlbSwgYnV0IGl0IGlzIG5vdCBhIGdv
b2QgcmVhc29uIHRvIGFkZCANCm5ldyBvbmVzLg0KDQo+ICsNCj4gKyNlbHNlDQo+ICsNCj4gK3N0
YXRpYyBpbmxpbmUgaW50IGRldm1fbXV0ZXhfaW5pdChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVj
dCBtdXRleCAqbG9jaykNCj4gK3sNCj4gK8KgwqDCoCBtdXRleF9pbml0KGxvY2spOw0KPiArwqDC
oMKgIHJldHVybiAwOw0KPiArfQ0KPiArDQo+ICsjZW5kaWYNCj4gKw0KPiAgwqAjZWxzZSAvKiAh
Q09ORklHX1BSRUVNUFRfUlQgKi8NCj4gIMKgLyoNCj4gIMKgICogUHJlZW1wdC1SVCB2YXJpYW50
IGJhc2VkIG9uIHJ0bXV0ZXhlcy4NCj4gQEAgLTE2OSw2ICsxODUsMTMgQEAgZG8ge8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcDQo+ICDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcDQo+
ICDCoMKgwqDCoCBfX211dGV4X2luaXQoKG11dGV4KSwgI211dGV4LCAmX19rZXkpO8KgwqDCoMKg
wqDCoMKgIFwNCj4gIMKgfSB3aGlsZSAoMCkNCj4gKw0KPiArc3RhdGljIGlubGluZSBpbnQgZGV2
bV9tdXRleF9pbml0KHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IG11dGV4ICpsb2NrKQ0KPiAr
ew0KPiArwqDCoMKgIG11dGV4X2luaXQobG9jayk7DQo+ICvCoMKgwqAgcmV0dXJuIDA7DQo+ICt9
DQo+ICsNCj4gIMKgI2VuZGlmIC8qIENPTkZJR19QUkVFTVBUX1JUICovDQo+IA0KPiAgwqAvKg0K
PiBkaWZmIC0tZ2l0IGEva2VybmVsL2xvY2tpbmcvbXV0ZXgtZGVidWcuYyBiL2tlcm5lbC9sb2Nr
aW5nL211dGV4LWRlYnVnLmMNCj4gaW5kZXggYmM4YWJiODU0OWQyLi5kNTBkZmEwNmU4MmMgMTAw
NjQ0DQo+IC0tLSBhL2tlcm5lbC9sb2NraW5nL211dGV4LWRlYnVnLmMNCj4gKysrIGIva2VybmVs
L2xvY2tpbmcvbXV0ZXgtZGVidWcuYw0KPiBAQCAtMTksNiArMTksNyBAQA0KPiAgwqAjaW5jbHVk
ZSA8bGludXgva2FsbHN5bXMuaD4NCj4gIMKgI2luY2x1ZGUgPGxpbnV4L2ludGVycnVwdC5oPg0K
PiAgwqAjaW5jbHVkZSA8bGludXgvZGVidWdfbG9ja3MuaD4NCj4gKyNpbmNsdWRlIDxsaW51eC9k
ZXZpY2UuaD4NCj4gDQo+ICDCoCNpbmNsdWRlICJtdXRleC5oIg0KPiANCj4gQEAgLTEwNCwzICsx
MDUsMjUgQEAgdm9pZCBtdXRleF9kZXN0cm95KHN0cnVjdCBtdXRleCAqbG9jaykNCj4gIMKgfQ0K
PiANCj4gIMKgRVhQT1JUX1NZTUJPTF9HUEwobXV0ZXhfZGVzdHJveSk7DQo+ICsNCj4gK3N0YXRp
YyB2b2lkIGRldm1fbXV0ZXhfcmVsZWFzZSh2b2lkICpyZXMpDQo+ICt7DQo+ICvCoMKgwqAgbXV0
ZXhfZGVzdHJveShyZXMpOw0KPiArfQ0KPiArDQo+ICsvKioNCj4gKyAqIGRldm1fbXV0ZXhfaW5p
dCAtIFJlc291cmNlLW1hbmFnZWQgbXV0ZXggaW5pdGlhbGl6YXRpb24NCj4gKyAqIEBkZXY6wqDC
oMKgIERldmljZSB3aGljaCBsaWZldGltZSBtdXRleCBpcyBib3VuZCB0bw0KPiArICogQGxvY2s6
wqDCoMKgIFBvaW50ZXIgdG8gYSBtdXRleA0KPiArICoNCj4gKyAqIEluaXRpYWxpemUgbXV0ZXgg
d2hpY2ggaXMgYXV0b21hdGljYWxseSBkZXN0cm95ZWQgd2hlbiB0aGUgZHJpdmVyIGlzIA0KPiBk
ZXRhY2hlZC4NCj4gKyAqDQo+ICsgKiBSZXR1cm5zOiAwIG9uIHN1Y2Nlc3Mgb3IgYSBuZWdhdGl2
ZSBlcnJvciBjb2RlIG9uIGZhaWx1cmUuDQo+ICsgKi8NCj4gK2ludCBkZXZtX211dGV4X2luaXQo
c3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgbXV0ZXggKmxvY2spDQo+ICt7DQo+ICvCoMKgwqAg
bXV0ZXhfaW5pdChsb2NrKTsNCj4gK8KgwqDCoCByZXR1cm4gZGV2bV9hZGRfYWN0aW9uX29yX3Jl
c2V0KGRldiwgZGV2bV9tdXRleF9yZWxlYXNlLCBsb2NrKTsNCj4gK30NCj4gKw0KPiArRVhQT1JU
X1NZTUJPTF9HUEwoZGV2bV9tdXRleF9pbml0KTsNCj4gXCBObyBuZXdsaW5lIGF0IGVuZCBvZiBm
aWxlDQo+IA0KPiANCg==
