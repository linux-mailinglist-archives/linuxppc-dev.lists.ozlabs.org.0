Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 65676814F3F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Dec 2023 18:52:55 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=m1E0egqs;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SsGys10bMz3cPK
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Dec 2023 04:52:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=m1E0egqs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:261d::601; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:261d::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SsGxy544hz30Kd
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Dec 2023 04:52:05 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g5Uonn8BfPtbKjlAvaYnGfAS04brLgSAik93o5oLXj8QvXYqoQxJjKzVaKr76/Dti9d2FEiFg8Nu5Qgv3P9RpFIpMHUN1ZVltmVAIxrMw5c7bWR3khAyVVqGirgTR8DbjdDg363geqV9wWqSEyjfUNEicyMb6MkaZ2FBzN/YL/4bceW5FGFoIyMcqhWzBAvLktIm4a47NJkoYVPR1rAXB61tuC0qXXrCP1iCviKlXfRpfhyzo3nws9eQ0XOACEgmSIdZhzjmMHuWkQPzHuA9PbRO8E9ryQk7kOjYmZHPejxfc0B9kIDPnY+vvMfpkZwxOpKOoAfpkS3qE4y7NQLzVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B7HnYqlqBM5uS6G1ramljgyvy1jk3fAVTyYKQcLoM1U=;
 b=oFTKSSReWez2TxUDN9nX7tkTZqRodWRbWTAQ9S4r2JVXxnqZ/q98SawODi/rOARUXkuhlSxaZw46PJYascaXJyaWaT2usy2MmE1OCrnMITGpMv/mDfnFGN1V/Sgg3O0Jsxgu8BaM+clBYttTjgel01E8wgswm/wYV7WK6ZCKegoEe3mBWBQIsn5Epkea2jNJOXeD0Q0aFhg2CI7qXp+6z6XoTD25RbxkawMjysm7uLZRC1w9F1qZqBB4q4ajFqsLoP1CwWMmVYsRnsZmYenyjEcMEAET8CaaZxrJ50iLzKXTwz+tONr0tqJ9JcshZGOvajUotH2riup9ruEJ7LJU7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B7HnYqlqBM5uS6G1ramljgyvy1jk3fAVTyYKQcLoM1U=;
 b=m1E0egqs58eHUlbNz36NAlmKa72kpvzhDCkljTQRsM4KWmBWejVEkIMQeU+MzkevRYuUSIgsYN9Tn310mco800fHTUZtW/BNfeICCmqJ5lkzabusqvVQK0qJAz7Cm1c7Tbki06MrPNrFszDperQMiXV3uu0U430YcZCo6AXK97YjEOYk+PViv5tepmDSfUl7Z6UiAday+e58E/y9bEF1zTkUc6KNq+cNIL3ZBvoDFWsOg54vH4O+pxmtGurBoz4gSeT4azDTiiZaqjjHUgm74632h9Ov5pk1nry5zbW2GGPpoMPaDMGkMCD25odfwy6jAs3SLyBSJ2ZnPzhQHPXJVg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2129.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:13::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.33; Fri, 15 Dec
 2023 17:51:37 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f788:32b4:1c5e:f264]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f788:32b4:1c5e:f264%7]) with mapi id 15.20.7091.030; Fri, 15 Dec 2023
 17:51:37 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH RFC v4-bis] locking: introduce devm_mutex_init
Thread-Topic: [PATCH RFC v4-bis] locking: introduce devm_mutex_init
Thread-Index: AQHaLx8s4cwMtB3wcEeA+EuFucN39rCqgOoAgAAfioA=
Date: Fri, 15 Dec 2023 17:51:37 +0000
Message-ID: <8688dfe9-4a94-44af-a12c-7c238ab9dcad@csgroup.eu>
References: <20231214173614.2820929-3-gnstark@salutedevices.com>
 <c16599b23afa853a44d13b906af5683027959a26.1702621174.git.christophe.leroy@csgroup.eu>
 <CAHp75VfBcmTBXXtU6o1x0Ea24wG-_Qb46opkS0EXKQ1Ynh0Mcw@mail.gmail.com>
In-Reply-To:  <CAHp75VfBcmTBXXtU6o1x0Ea24wG-_Qb46opkS0EXKQ1Ynh0Mcw@mail.gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB2129:EE_
x-ms-office365-filtering-correlation-id: 2a2a010a-603e-4646-e6ef-08dbfd967c4d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  tDqy1hxXAnQlyEQUrBTf6c7kCpJwr6igRXoTJ9WZCUmir/IZ39hHFZNlOb2xuiX0TFIZLpS9adbqsGKETJ5lHBUVp7mdtLA5AREUazho+C/cE19E+3JpUz3vIsRamE/+0RJ76k6K1qnlKjIjfRN2ZQswwerR5lCjyLdtA6dPjwkUBUeTRM9Urhiu8L+H0KNMjjI4xT3OuHMIq63zmEaB0SyllHH+Ezhob6t3f+7KxxGymPG8fhng/EHNeVeysofR0LBDaA42T6wL4JvrLwUevB41dkb/oUMBIojA1yCL9cKQ2GEhwN6rBrV6K6VkAZkLEybNGOSYZ7Tg5HVoNG4I493vR8jIOgvzv4R6n9/hIsz9UxLdtRsp8kk+rjAhQGSmFTS8cFkN0Du6vbN1FxLHI/M5U5PsNPbxF92xPZB6+QbqM9igwC4q56h+oTdmewKqO7mEvYyoI0xaTiRLZ/GgcEFwbdgpCJ9mTPdQ80aLVlRuvhG+qu+q5mV2/XLkdJEe5y+yMD7oSgoct/k+1kHRjVBRF/bnG0gjfrvdrF5gH70ZVxelmGYMAmzNspaKqIHbR/OUw3OgswshZcCoLbneNd05HY7QZtxxdFm0x3PWEcVBhBr6R6ppMpep1mkQx4W6IeMbQnGBBlfbaDxMUiwYkbyP61vv3FIUPXTHiUj5yzi4M7gl3OtCld5plFJ1Maf7
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(366004)(376002)(136003)(346002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(83380400001)(53546011)(71200400001)(2616005)(66574015)(26005)(122000001)(38100700002)(4326008)(8676002)(8936002)(5660300002)(44832011)(41300700001)(7416002)(2906002)(478600001)(6486002)(6506007)(6512007)(54906003)(64756008)(66446008)(66476007)(66556008)(66946007)(6916009)(316002)(76116006)(91956017)(36756003)(31696002)(86362001)(38070700009)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?OFFSSzhwNm1CT085RHVLR0srNXgzdGZiaFpUUW02N1JHSXBXTFp1TUlmT1VC?=
 =?utf-8?B?NTB6b2ZuVDc1L3BGdnp2Nkg3MDVnNzFPM1dVcnJmd1ZNNHo4Wm9KT1loZFRE?=
 =?utf-8?B?ZVFhSU4wRjZ1Y1lKSUpzQjl0QXQwN0Vpdk5jMmtrNitQQWMwMldyMU5oT2k3?=
 =?utf-8?B?aEd1RlJiY3puRllsVlBHbDUyVkxNZFpMU2lxWm1CRlE2V0dZMmRqdnZvb1RH?=
 =?utf-8?B?amllZ0NkNHBENDIrQnZsZXNxWGpSdWJNRU0xNWZhRk1ieDNJTHdwNVc4WnQ4?=
 =?utf-8?B?bllyc3R5ZGpQQk92MWJlSTJCS1pnbGVqMm1oNUh4NFpDY2hMN1J1VWlwa0dI?=
 =?utf-8?B?dzN6Ukl0Y0syVGNwMll4eDRwQ0h1SFBYN0ROVzdCcGE5ZDdNdWJkVS9CUnd4?=
 =?utf-8?B?MkVxR1J0UzhaUUp2d2JieGhkK0lKNGM4VXZqTkxVVEdxUjd1cDcwNHlEZzB1?=
 =?utf-8?B?bGdYaDRDbVBFMHdxMzBQbzMyakZpaEE3TEpYNnlmNFFTTmIrMVVnbWJxVm1B?=
 =?utf-8?B?Ymc1Q0tzQU0za0o2VE43RnNzNVFwRERmbUFZZkdmMS8wbVEwVlpWU3UraE16?=
 =?utf-8?B?Rlo1Vm1yS0lPZXdUTUdmaHphSjJWR1dnSzNIVU85QVpIOFhmYnBFTzJtTXVC?=
 =?utf-8?B?cGhuVmdLK0FVeS9QN3JkZ1gxb2w1Nm9Ob2pWTHpBQmhsNjJuc3Z6N3VYR3h0?=
 =?utf-8?B?d2E1V1o1N3lxeGJ0c2hyRnkzZ2I1RmtHcmlFNHlXQVhuUEEwTXZpWTVZWndu?=
 =?utf-8?B?U1JaZWFEbzRGdm9kSmRXZG9IZTdoRGtaQ0tqeTMxMzQrQmpraDFkVUU5bmx3?=
 =?utf-8?B?azBETHZXcnN1VStVcytMNDYyRzlqZFF4V3BFYmo0WVVNOVcwYkVub2pTT1Fz?=
 =?utf-8?B?Lzd6Ri82SmRITmRIejBOYVhocnFpR0QyamNJK0ZmS2twTFoybzdYczFQT3lP?=
 =?utf-8?B?bGxwT2hIaThvTXZyTU51UlFpcGZsSzc3UkVhNnBvelZQZGd0MjFCOXBLQUxS?=
 =?utf-8?B?YVpLTThEVFRNVi9LZUR4N2thZ3JxejVNaVRZYzJBRlNvUmVwOUxyNkthNDdi?=
 =?utf-8?B?Yk5HakFZYzdPRzE2d1JFQVhMY1RIcGdDYU40U1Y4RHJPdU5XQjZsak1yNVNz?=
 =?utf-8?B?Qjc2Unh6eUQ0MDlIdzFoNVFLMzdkMEczVHRnRTFXd1RJYUNnTVRKUGJIdWR0?=
 =?utf-8?B?OWVrM3dORis4L2xwV0lUQTZENTljU1hoVGcvRzMwb0diZWhwaU1KM0IrSUE1?=
 =?utf-8?B?YTY5TW40R1RIZmx1SHNGOWJVbWhKMmdIRkpIMTFhdUZUcXdIbjdpQU43YUpn?=
 =?utf-8?B?ckc3MXovTnRLVmd3Rk9RSGJ5Vi9PUzRYNFBOZmU2emhCVy85TmNXZXkyRHNY?=
 =?utf-8?B?MFZQQlB2NGt0d25PbkFDZXUwelIrUnN4S05UUG1FeWFGZVBDYXYzTnZHeDdu?=
 =?utf-8?B?ZnV3Mm51N3Q4bGlUdlZhQ2pBUVBTYWtqSFR2eXppL0doK1hsZmhFbFJSQkl3?=
 =?utf-8?B?bzZJK0lJN1E2YkhyRWQ0QnpTV3JJbVI1STFOWlRrd3NLRlBSVy9vMDVOTEdo?=
 =?utf-8?B?TGNCSmtZdDh3NHUwRGdLS2pXSlZtSkVrVlZSa3NjWlN2aFlCM2JWeU53djZY?=
 =?utf-8?B?SENrV2lwR1NtT2Nxa05seXRhZFBWeU9lc0M1UXhOOWlGczJXOHJCL0pCUkY0?=
 =?utf-8?B?cWJPcXN2QXdJZ3hSYXZzTVhyaE0vVDJlY2l2ZzZQUk4zZ2d3K1VVdE15SDlj?=
 =?utf-8?B?SFlzaGxrSHJBbGdKWFIwM0poN05lb0g1ZWZwOGkvb1psTnc4Z1V6QVhFNHQ0?=
 =?utf-8?B?dWo2bjJvRzg4WDExZWxqalFmU0lQNjhyVFV3b2s2TmhrMEhxWXpnc2x6NHF6?=
 =?utf-8?B?YjNhYmNML1hLTkxYYUt4dFJxZXNZWFc4ZmllekRWMEUvcEZMM1JFUW9DOXB0?=
 =?utf-8?B?QTdDNTFyNjFaRGhBUnJYa3YyeDNjdmc0cWpFRVpsQ1ZFNDRubm81TU9DRXFH?=
 =?utf-8?B?NDBRSC9CVDZpRG9IU2tKdWVoYUlZM1ZlRlVVMDVoSDRMVGFBVVlxQ052QTVS?=
 =?utf-8?B?Zms1T1lWTWxzT0VvdXJzV3pUcmtYZm5jQzdtTWk4YTRzR1o1NzNTSXlJdS94?=
 =?utf-8?Q?+xg45P8UV/OjzTQvTqa96TP1r?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FC013346196BE44EA095AC0C459063BF@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a2a010a-603e-4646-e6ef-08dbfd967c4d
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2023 17:51:37.4985
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dykI6+EKPgWkmPWyKbyrL5MvBMMJUnVdYhNGkRkf6DVA+zcNi13qNUw5gP93Lae2W2t/dfQ3XXoFN73k+A+F2QXojZZcImmwHB2ug6ZApbE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2129
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
Cc: "kernel@salutedevices.com" <kernel@salutedevices.com>, "vadimp@nvidia.com" <vadimp@nvidia.com>, "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>, "peterz@infradead.org" <peterz@infradead.org>, "boqun.feng@gmail.com" <boqun.feng@gmail.com>, "lee@kernel.org" <lee@kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "npiggin@gmail.com" <npiggin@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "hdegoede@redhat.com" <hdegoede@redhat.com>, "mingo@redhat.com" <mingo@redhat.com>, "pavel@ucw.cz" <pavel@ucw.cz>, George Stark <gnstark@salutedevices.com>, "longman@redhat.com" <longman@redhat.com>, "nikitos.tr@gmail.com" <nikitos.tr@gmail.com>, "will@kernel.org" <will@kernel.org>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE1LzEyLzIwMjMgw6AgMTY6NTgsIEFuZHkgU2hldmNoZW5rbyBhIMOpY3JpdMKgOg0K
PiBPbiBGcmksIERlYyAxNSwgMjAyMyBhdCA4OjIz4oCvQU0gQ2hyaXN0b3BoZSBMZXJveQ0KPiA8
Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1PiB3cm90ZToNCj4+DQo+PiBGcm9tOiBHZW9yZ2Ug
U3RhcmsgPGduc3RhcmtAc2FsdXRlZGV2aWNlcy5jb20+DQo+Pg0KPj4gVXNpbmcgb2YgZGV2bSBB
UEkgbGVhZHMgdG8gYSBjZXJ0YWluIG9yZGVyIG9mIHJlbGVhc2luZyByZXNvdXJjZXMuDQo+PiBT
byBhbGwgZGVwZW5kZW50IHJlc291cmNlcyB3aGljaCBhcmUgbm90IGRldm0td3JhcHBlZCBzaG91
bGQgYmUgZGVsZXRlZA0KPj4gd2l0aCByZXNwZWN0IHRvIGRldm0tcmVsZWFzZSBvcmRlci4gTXV0
ZXggaXMgb25lIG9mIHN1Y2ggb2JqZWN0cyB0aGF0DQo+PiBvZnRlbiBpcyBib3VuZCB0byBvdGhl
ciByZXNvdXJjZXMgYW5kIGhhcyBubyBvd24gZGV2bSB3cmFwcGluZy4NCj4+IFNpbmNlIG11dGV4
X2Rlc3Ryb3koKSBhY3R1YWxseSBkb2VzIG5vdGhpbmcgaW4gbm9uLWRlYnVnIGJ1aWxkcw0KPj4g
ZnJlcXVlbnRseSBjYWxsaW5nIG11dGV4X2Rlc3Ryb3koKSBpcyBqdXN0IGlnbm9yZWQgd2hpY2gg
aXMgc2FmZSBmb3Igbm93DQo+PiBidXQgd3JvbmcgZm9ybWFsbHkgYW5kIGNhbiBsZWFkIHRvIGEg
cHJvYmxlbSBpZiBtdXRleF9kZXN0cm95KCkgd2lsbCBiZQ0KPj4gZXh0ZW5kZWQgc28gaW50cm9k
dWNlIGRldm1fbXV0ZXhfaW5pdCgpDQo+IA0KPiBNaXNzaW5nIHBlcmlvZC4NCj4gDQo+IC4uLg0K
PiANCj4+ICAgfSB3aGlsZSAoMCkNCj4+ICAgI2VuZGlmIC8qIENPTkZJR19QUkVFTVBUX1JUICov
DQo+IA0KPiBeXl4gKDEpDQo+IA0KPj4gK3N0cnVjdCBkZXZpY2U7DQo+PiArDQo+PiArLyoNCj4+
ICsgKiBkZXZtX211dGV4X2luaXQoKSByZWdpc3RlcnMgYSBmdW5jdGlvbiB0aGF0IGNhbGxzIG11
dGV4X2Rlc3Ryb3koKQ0KPj4gKyAqIHdoZW4gdGhlIHJlc3NvdXJjZSBpcyByZWxlYXNlZC4NCj4+
ICsgKg0KPj4gKyAqIFdoZW4gbXV0ZXhfZGVzdHJveSgpIGlzIGEgbm90LCB0aGVyZSBpcyBubyBu
ZWVkIHRvIHJlZ2lzdGVyIHRoYXQNCj4+ICsgKiBmdW5jdGlvbi4NCj4+ICsgKi8NCj4+ICsjaWZk
ZWYgQ09ORklHX0RFQlVHX01VVEVYRVMNCj4gDQo+IFNob3VsZG4ndCB0aGlzIGJlDQo+IA0KPiAj
aWYgZGVmaW5lZChDT05GSUdfREVCVUdfTVVURVhFUykgJiYgIWRlZmluZWQoQ09ORklHX1BSRUVN
UFRfUlQpDQo+IA0KPiAoc2VlICgxKSBhcyB3ZWxsKT8NCg0KSXNuJ3QgbmVlZGVkLCBoYW5kbGVk
IGJ5IEtjb25maWc6DQoNCmNvbmZpZyBERUJVR19NVVRFWEVTDQoJYm9vbCAiTXV0ZXggZGVidWdn
aW5nOiBiYXNpYyBjaGVja3MiDQoJZGVwZW5kcyBvbiBERUJVR19LRVJORUwgJiYgIVBSRUVNUFRf
UlQNCg0KPiANCj4+ICt2b2lkIG11dGV4X2Rlc3Ryb3koc3RydWN0IG11dGV4ICpsb2NrKTsNCj4+
ICtpbnQgZGV2bV9tdXRleF9pbml0KHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IG11dGV4ICps
b2NrKTsNCj4+ICsjZWxzZQ0KPj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBtdXRleF9kZXN0cm95KHN0
cnVjdCBtdXRleCAqbG9jaykge30NCj4+ICsNCj4+ICtzdGF0aWMgaW5saW5lIGludCBkZXZtX211
dGV4X2luaXQoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgbXV0ZXggKmxvY2spDQo+PiArew0K
Pj4gKyAgICAgICBtdXRleF9pbml0KGxvY2spOw0KPj4gKyAgICAgICByZXR1cm4gMDsNCj4+ICt9
DQo+PiArI2VuZGlmDQo+IA0K
