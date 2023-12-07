Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7D78087B5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Dec 2023 13:29:26 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=Pddbeulb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SmD9H6wKwz3cbX
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Dec 2023 23:29:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=Pddbeulb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::615; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20615.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::615])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SmD8M4GVXz30MQ
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Dec 2023 23:28:33 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VvoaJZnsGJ9fQY3AoOuoSolscvbdpWHLevZxw+eIkZTgGjZ3ewm3mVfZk8CJdGqs6eRMhvw2Xrca1+ofE0BIaLti8w3vXt83hadU4v7T7u9ypFmUjGD8L5TyeAPDjlxrkYl7kh2W59z+eSwXNiiWJXaH/dJE9DcdusQpsxeITgsQWMwqda2sUYbKdgRZ0hXho8+dYvVK53refzbhPdc4GDe+c/bfIwbMNKX/fDTNxOiOo/Cw1TMN5i/uyAhTXhtLZwKbgniDRhCJ9zL+8EuSWwLIy1T90TbbWTSRCo3Uvt55UBXn1C6HGcAQ3FGleNqeR89mUjkj7X1IW06xVR+rLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=reDXQkEPynptNb+MuT2F2EhnDk2CwWtm0eeU6j35IdQ=;
 b=TiKFBgLp+ofq2nDZfI8Q3hc30N9u3ouQqTxJ/asU18slK4NpTf833zSvFsdsv8YpI2iEHBUF5xD1Yk5sf4b6/ClDR4FkvHkn2pgXAU2YIxbiXvi5v82/nqQl6yBCMygPZ2CKzXnKsadNwDlzkTqWbTHz8I7/vWIf6l9FCQ6rJD7P7wi8O1hLtRhwt5cLX5X6srFoZIMp06NmvgXuOJ6RtlsjYllIhi+Va6JFGtniFFV+uWSK0iYN5dQtOD9cdCpN35GvKoakRgqCgvqdFQe5IXhYM3k29V1T3nGe85CSq0LZa1gm92YjoOOnPx/q9DlTZBxb8/IFlD0+phux6gRmLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=reDXQkEPynptNb+MuT2F2EhnDk2CwWtm0eeU6j35IdQ=;
 b=PddbeulbJF8uSbAnEG77hf/VU2Cbgx68gfltM01TDG+GT4K9gaxNL2e+CTXjxUBRfP27cQIyxyvNcqtp5Ue/XBvmj6Bc4vvcRJCAKEQ0BjDQ4EnAPRj9dDnE5k02HNrBF6Y6NDSSKxcJjf5T13FSxuIf3ptH6v+btzKnmpc6Ss9grzSV9GxVlFngLPmCopPWDZWvAs06Y+tXgzBz2vPA+prypAYpXXF3xM8kzcdsGBVGYxZ1KeB2es7ZdFfUcOQ0wRgkebhPGhFtb2s7YyamVVw0JqrX0RLCVF06KdsIuM5jUqdESmG7ZVadZlD/RZfdNWKd9m1Rf7xESKx9tf+7dg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB3377.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:29::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.27; Thu, 7 Dec
 2023 12:28:08 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5bfe:e2f2:6d89:8d97]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5bfe:e2f2:6d89:8d97%3]) with mapi id 15.20.7068.027; Thu, 7 Dec 2023
 12:28:08 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Andy Shevchenko <andy.shevchenko@gmail.com>, George Stark
	<gnstark@salutedevices.com>
Subject: Re: [PATCH v2 01/10] devm-helpers: introduce devm_mutex_init
Thread-Topic: [PATCH v2 01/10] devm-helpers: introduce devm_mutex_init
Thread-Index:  AQHaJty3lcbSNrP0Vk6nW4+1IjDYxbCcXFOAgABCTACAADawAIAABniAgAANGICAANPogIAABymA
Date: Thu, 7 Dec 2023 12:28:08 +0000
Message-ID: <34060476-86e5-42fb-a139-6790487c1568@csgroup.eu>
References: <20231204180603.470421-1-gnstark@salutedevices.com>
 <20231204180603.470421-2-gnstark@salutedevices.com>
 <81798fe5-f89e-482f-b0d0-674ccbfc3666@redhat.com>
 <29584eb6-fa10-4ce0-9fa3-0c409a582445@salutedevices.com>
 <17a9fede-30e8-4cd5-ae02-fe34e11f5c20@csgroup.eu>
 <be693688-2e82-4e1a-9ead-cf1513ee637b@csgroup.eu>
 <2a68534b-9e64-4d6e-8a49-eeab0889841b@salutedevices.com>
 <CAHp75Veyz-hMYPDEiCC1WJASGZ8N9pVef0foYJ0vBcW2VpfR+w@mail.gmail.com>
In-Reply-To:  <CAHp75Veyz-hMYPDEiCC1WJASGZ8N9pVef0foYJ0vBcW2VpfR+w@mail.gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB3377:EE_
x-ms-office365-filtering-correlation-id: 54d67e9b-c049-4fc3-b62a-08dbf71ff83f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  UzrzzEHj1ATd6bwck2cHUlJTq4QQwBBEOHHTb7XAGnX0gUHpOsOIIrGg0vNtJTPllHzyuUUKGQMbnWQhu+CMKCHgadcuvcsuxG1VVE+CRUX+r2u1Q7033HjUJjGAelw3ol8E5XmgDLcx5eQXptT+urzNkohzKdAKf9CztxiqNvu+8Ycv4+rf1KOIjVpM66fbRwtegPSjpmEdgGqFwa6S0gwm/OOfEYnN9AkgHeGx+6q/2h9BexkJIB+LCgfYR3kgSRN10ctEYL5U2ZJ/1+AsV7toj2Y657LkiAbqpe7uSKrnKSTBngSrnk6sIV+HC1EEl0MWnzNg6Mi6G7lmg+RbFno1Zog/61yq68tGdJIYkr3k5mgbZP5lTu21ASQgCwMOPT6G9izHMw12Oai8THQbhOwDzWq00P5Rfx6tX0gNo3vk86Ly7+EflkIlu7E6nkZEAQXlXtigysf8LVLeFms1oiR4RczKBtQ83W87bH8gp33ZjXTeLF09hteFypBDpYyEq3fZtaogzognpGJprN6uTeIAh/Sy7K755fwGrK0fSdD74LNBg2LvO6oeIF5EaDeruYr9nwCzj+gMYh1/JbHCfcQ+/+BuqVUHIzn6LNhQ/VeJr5hljP4tsLmDEInUhytLy1tSG9nrmjWCBqIv6A1Rgg1mqBL4cfoz5syghM0ESadkCsEMY0ZCgoyVz35qaIvA
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(346002)(39850400004)(376002)(396003)(136003)(366004)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(7416002)(44832011)(5660300002)(4326008)(2906002)(31686004)(8676002)(8936002)(66476007)(66556008)(66446008)(64756008)(316002)(110136005)(54906003)(76116006)(66946007)(91956017)(6486002)(478600001)(38070700009)(2616005)(6512007)(6506007)(53546011)(41300700001)(36756003)(83380400001)(71200400001)(26005)(38100700002)(66574015)(122000001)(86362001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?aDNUWW1ZYzNEZlIxWXJrcFBzeG1Ic0s3bXVUQXhKRnV4RFRiV3Y0dExHSjlT?=
 =?utf-8?B?YXMxNVk1bmR0U2ZmREg1bTdCTllsb1V0cmcwTUFYeW9qelRpcDhJcHljZVc3?=
 =?utf-8?B?SE1ic0FZbFlIKzViUzFKamQwVU0wV1o4TXZUSEUwQnBCQ3ZJOGVGRHNwSmJG?=
 =?utf-8?B?R1FxOXZETi94NlBwVW9saVlpcy9XR2F1RGJFTWFVS0hYZ2lMQTlZbDV2SU9Z?=
 =?utf-8?B?SVZIbWdpaktEUkV0YVJHYkFmK0JSRTRTVEYzdnRKcFR1R0xqR3FHZ2lqOTRT?=
 =?utf-8?B?TWV1MllVSFJuV2tQTnNTaWwzSlp2Rzdub2h0S3J6NjA4UGpFcGtnSWE3enFV?=
 =?utf-8?B?MVZuRDVjWlovYXpnOGJRckRnRXVJRll3djllTE55QVpIOXdQQnkvWkJNSEN0?=
 =?utf-8?B?ellKY21rWTBqOW1QUVg5aVdYcXkvTWU0dS9XYlo2aEhvYkd2dVNVenBORGVB?=
 =?utf-8?B?WGczQnhLM1hlcWxYSmlGK0FYUGFkVk1YRTVPd1BRaUNFVzdrbEVSMElqaTBz?=
 =?utf-8?B?d3EyeHQ0bkwwYzFmeEx4eGI1cUtoY3pkd0VZa3AxZmlVaVZHWVEzL1BFRW1s?=
 =?utf-8?B?a0FMOHA4TUY5NGtCczBoa2RQcURCcjllOGdHOWJNTDhrUTZzaXdISnVVV3l2?=
 =?utf-8?B?czNVTE1KWVFmbVc3MjgxUzgycmJtT2o5TnZ4Y1lkWTdIcld6Z1hsZFIyWXhj?=
 =?utf-8?B?R1ZkRkhZWERleGczaUFTNHNQdVlPa2ZIUDVqWmdiNEpVcE9HYkNNRlI5RVEw?=
 =?utf-8?B?cmhSSzdNWk9hemV4RjhMbERTVGpMUkQ3ZlJERUtTbXJKN1ovY24zbFc2ZzZs?=
 =?utf-8?B?T0FVN1hZZndUT1JBZ0pXajB5Y3FLcGN6ZjZPbmJ5RkN4cWg2R3laUXc0dWtk?=
 =?utf-8?B?OWpwV2lONWYrdG9TZHZ5TklyS2lJTEZLaUx4RDRxVHpMRVdYSWJGS28wUnps?=
 =?utf-8?B?OGtqeTJtL1h4dkljdzhEM1dYSEFJTE5VZ200L2hrZlVZbndSbTlDbE5SN05a?=
 =?utf-8?B?dmZGdkRnemMrQUJWcjNFa1IxaDBrOTZCL0NYQjdTSTMzQmEvdWtSa29nUlQ3?=
 =?utf-8?B?NTVKdElQajBNTUdZOC80N1F0Z0lUV0RYN2U3dmFhNlo4ZjAycy9KR1Z1b0xJ?=
 =?utf-8?B?cjlDalgzVmRlK3h6R3I0QXRrYU1lN3pudlJuMnZHSEloOXpjbkpZQm0yMlB3?=
 =?utf-8?B?T3BtUWNtWklCcGZ4Y0JBYU5WWGNUNTk2WGxGYktPVE5hd2RvTklyV2tLVmpC?=
 =?utf-8?B?M2k2cGlHdEJWZmI5SlgrMjBiQXV2a2hxZ1E5d1EvdGpsUEhDWkptNExia1Zl?=
 =?utf-8?B?WHdXVlMxdFdjeUtYQ2lOdG5CekdjSXJ1eTVrbzRQRHgrYk01OUIvcEM4RVNV?=
 =?utf-8?B?ZlhjMEZjMGJEN1lsK0tvai9KazZkYW9ITEV3NVFNTkxHYjdibjRQQXFCSTc1?=
 =?utf-8?B?MGdiR2FUREdxb2JuQVl0cHhVU3NFa3RjZSt5SUg5R2Y0SVM5RC9RMEFjRThs?=
 =?utf-8?B?cFZCZVMvNTdkWGRPdWxsaHQ3VDdnK1VxczFycXR2MkMvMkxITkpnWFNXeEJn?=
 =?utf-8?B?L1lXRU1iUm1jOVV3QmxJSEN4VzNkUXVUYzNnb05Ia1ZFNTdDYjUwNzYvbUdU?=
 =?utf-8?B?bkNWelRuV3U5TzZnN2x1cDUvWit2Zng5WUd0bUtmUjJ6WU5BMmJ0WjVHM29G?=
 =?utf-8?B?enc2Y3JpcVV4bmlMbWZYNFlMZXFLRE1TUUt1c2FIYXNpT1ZyN1JCNEhtMW9y?=
 =?utf-8?B?Mzl1bHVOVWREUjkxUXBOaDdsaVRWK3JGZGx3bHZaWWFlVlFNRDNub2xDRDlT?=
 =?utf-8?B?OUszZ1AwVmJuOHh4RmtPVThVMlJzV0RsWUpxcHR5OUxLZHdEck5WNEdTUDlF?=
 =?utf-8?B?VFkzRlRYQUtaV1lFaFNZU2RFU2hjWmY1M3dadVZrTVNVcC9QOWpMWjNaMHNK?=
 =?utf-8?B?dDgrd0UvWWxtRnJPK0RPZmNjYWsyN0thSHcrNTdJbkdXM0ExcjA4OU5PV3l2?=
 =?utf-8?B?NVdTeU5URHVpdi9TSUpJZ0laSEpRNld5bjk1cUZGaTdjOEhCeXFkamZIMit4?=
 =?utf-8?B?Q3h0dUZ0ZVVKMUhROVNRM2pLamo2aUg2UTB1bDdwS0tSdEpXblVXUU1ZaVJM?=
 =?utf-8?Q?MzHFkF/oHykM/dFydMCLGi/lN?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0D608FBDF4C62D489A6DC0769C425900@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 54d67e9b-c049-4fc3-b62a-08dbf71ff83f
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2023 12:28:08.3558
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SGEVmwjk9d/2coNuX1YXqlZ3fYx+56NZRCkZTVNXnjTu5jxmXUhd1iV1+Euzsk0WD5tKl1F7Zp/G7S55olv2PHTjCgc0amn3/dnm/2od6Oo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB3377
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

DQoNCkxlIDA3LzEyLzIwMjMgw6AgMTM6MDIsIEFuZHkgU2hldmNoZW5rbyBhIMOpY3JpdMKgOg0K
PiBPbiBUaHUsIERlYyA3LCAyMDIzIGF0IDE6MjPigK9BTSBHZW9yZ2UgU3RhcmsgPGduc3RhcmtA
c2FsdXRlZGV2aWNlcy5jb20+IHdyb3RlOg0KPj4gT24gMTIvNy8yMyAwMTozNywgQ2hyaXN0b3Bo
ZSBMZXJveSB3cm90ZToNCj4+PiBMZSAwNi8xMi8yMDIzIMOgIDIzOjE0LCBDaHJpc3RvcGhlIExl
cm95IGEgw6ljcml0IDoNCj4gDQo+IC4uLg0KPiANCj4+PiBMb29raW5nIGF0IGl0IGNsb3Nlciwg
SSBoYXZlIHRoZSBmZWVsaW5nIHRoYXQgeW91IHdhbnQgdG8gZG8gc2ltaWxhciB0bw0KPj4+IGRl
dm1fZ3Bpb19yZXF1ZXN0KCkgaW4gbGludXgvZ3Bpby5oIDoNCj4+Pg0KPj4+IEluIGxpbnV4L211
dGV4LmgsIGFkZCBhIHByb3RvdHlwZSBmb3IgZGV2bV9tdXRleF9pbml0KCkgd2hlbg0KPj4+IENP
TkZJR19ERUJVR19NVVRFWEVTIGlzIGRlZmluZWQgYW5kIGFuIGVtcHR5IHN0YXRpYyBpbmxpbmUg
b3RoZXJ3aXNlLg0KPj4+IFRoZW4gZGVmaW5lIGRldm1fbXV0ZXhfaW5pdCgpIGluIGtlcm5lbC9s
b2NraW5nL211dGV4LWRlYnVnLmMNCj4+DQo+PiBZZXMsIHRoaXMgd291bGQgYmUgYWxtb3N0IHBl
cmZlY3QgZGVjaXNpb24uIEJUVyBqdXN0IGFzIGluIGxpbnV4L2dwaW8uaA0KPj4gd2Ugd291bGRu
J3QgaGF2ZSB0byBpbmNsdWRlIHdob2xlICJsaW51eC9kZXZpY2UuaCIgaW50byBtdXRleC5oLCBv
bmx5DQo+PiBhZGQgZm9yd2FyZCBkZWNsYXJhdGlvbiBvZiBzdHJ1Y3QgZGV2aWNlOw0KPiANCj4g
SW4gY2FzZSB5b3UgcGxhY2UgaXQgaW50byBhIEMtZmlsZS4gT3RoZXJ3aXNlIHlvdSBuZWVkIGEg
aGVhZGVyIGZvcg0KPiB0aGUgQVBJIGFuZCB0aGF0IGlzIG5vdCBhY2NlcHRhYmxlIGZvciBtdXRl
eC5oLg0KPiANCg0KUmlnaHQsIHRoYXQncyB0aGUgcmVhc29uIHdoeSBJJ20gc3VnZ2VzdGluZyB0
byBkZWZpbmUgZGV2bV9tdXRleF9pbml0KCkgDQppbiBrZXJuZWwvbG9ja2luZy9tdXRleC1kZWJ1
Zy5jLg0KDQpJbiBsaW51eC9tdXRleC5oLCB5b3UgZGVmaW5lIGEgc3R1YiBmb3Igd2hlbiBDT05G
SUdfREVCVUdfTVVURVhFUyBpcyBub3QgDQpzZXQsIGFuZCB0aGUgcHJvdG90eXBlIG9mIGRldm1f
bXV0ZXhfaW5pdCgpIHdoZW4gQ09ORklHX0RFQlVHX01VVEVYRVMgaXMgDQpzZXQuDQo=
