Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20BB5807B31
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Dec 2023 23:15:19 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=b33t2gwM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SlsCm49Jvz3dGt
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Dec 2023 09:15:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=b33t2gwM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::617; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20617.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::617])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SlsBr06dCz2xQ8
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Dec 2023 09:14:26 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QzmMBcRUTzOY3aLX9ekUMpbSpRmWga58XkYUuCvwwk4VXx29gW4ZTyCO1h8UfMl1rvMCrThDbsey9KBnAQlr2zPXPLgILrIK87GmZmvP+ZAblT5a6IP8QxgaBT43ejMfYtLZSVK/UAUWAq53ALWysiBEJm7cZ6/2o0ppfMU3YzT5OyOCWgSsx+b/Uc5x4+0tl/oLIVXH6X5FOsUcyXAVuC7AGvoN81TkqUCR/uGhiIrK5fYyZJVht+XTvx8SIltQDZUFZrIGZt/87tC9m8BLbhr6TVpVbFTysHFC6+zg8mvOUzpqDyTKMdrb6wt7MVpVk/dSUh/gYc7jReahY1I2CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nr4fV9Eni3HJmuSX9INL5n+blqubk2BJlZZGjqXOjf0=;
 b=mzon001jz1KQ4Te/wooK/HFhJR2mx9MfPylyuyQ0orIM1pWOy7Qx1w9lTaE9MNyvTUuXbhsGbT9fAezVDHRnt4DSU5I53kHnrHPFvMty7POIOSCYtJM7A4kYJxA3qzocfJ5GU0fjINOY7hwmXBX9lcFk8YJu4jGRN5bNo41CCgTcH67WkcvP+5yIt07qbByMASovmADP8FBz3eYOgl+3b+Wc0DYSjUz2e/qcEWa8C4LLuZfSVhbTHA3LQryo/cNRL1j6s7vDOui/7m2OWI7ftOnPRA7q1S1VY2OhDLbXgvRwi0i4rZng9CQN+3lc28sKYc8nTVn/zzfs4KFiHw5mZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nr4fV9Eni3HJmuSX9INL5n+blqubk2BJlZZGjqXOjf0=;
 b=b33t2gwMhdN7GfJ1ztH+z2+yrkxKb73WSOwIllacVFpGauefvrL6MgInPHklQKeze/qEJXZwOVaDhIT/YIlFR8IVNZ/ifn7kuDjdkLjNkMxWu+fkFjZJhc3daqta9wfalVwMfDFLVXR/Nn9Mf/Idz4NG2NjnEF5csb1Mb8PFESI1eb3afv6PPoswYZ++EJj9RwdzamfSSXZv/cBD+nWI+MHRHK7h6OlN8/dwWZfhDS4hpOHVApUdbwGjkeCQ9kl8sWjVU6zKxdx7ygA9FSsESlj6Uleup7miCldRO+czHcoTDOh80YYh3fHLUcL/GaLqXKFH1PEBIZj1JZRFXRwFQQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB2191.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1b2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.26; Wed, 6 Dec
 2023 22:14:04 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5bfe:e2f2:6d89:8d97]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5bfe:e2f2:6d89:8d97%3]) with mapi id 15.20.7068.026; Wed, 6 Dec 2023
 22:14:04 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: George Stark <gnstark@salutedevices.com>, Hans de Goede
	<hdegoede@redhat.com>, "pavel@ucw.cz" <pavel@ucw.cz>, "lee@kernel.org"
	<lee@kernel.org>, "vadimp@nvidia.com" <vadimp@nvidia.com>,
	"mpe@ellerman.id.au" <mpe@ellerman.id.au>, "npiggin@gmail.com"
	<npiggin@gmail.com>, "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
	"andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>, "jic23@kernel.org"
	<jic23@kernel.org>, "peterz@infradead.org" <peterz@infradead.org>, Waiman
 Long <longman@redhat.com>
Subject: Re: [PATCH v2 01/10] devm-helpers: introduce devm_mutex_init
Thread-Topic: [PATCH v2 01/10] devm-helpers: introduce devm_mutex_init
Thread-Index: AQHaJty3lcbSNrP0Vk6nW4+1IjDYxbCcXFOAgABCTACAADawAA==
Date: Wed, 6 Dec 2023 22:14:04 +0000
Message-ID: <17a9fede-30e8-4cd5-ae02-fe34e11f5c20@csgroup.eu>
References: <20231204180603.470421-1-gnstark@salutedevices.com>
 <20231204180603.470421-2-gnstark@salutedevices.com>
 <81798fe5-f89e-482f-b0d0-674ccbfc3666@redhat.com>
 <29584eb6-fa10-4ce0-9fa3-0c409a582445@salutedevices.com>
In-Reply-To: <29584eb6-fa10-4ce0-9fa3-0c409a582445@salutedevices.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR1P264MB2191:EE_
x-ms-office365-filtering-correlation-id: e7dc0ab3-49a4-4459-5809-08dbf6a8a842
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  B56c9jmMdgUgiHtj/Uc1K7fCnoekZ1180IZwqZ6Qs3gegVoHaCY66Vxr7e8Fv4SfVL9aUikgaa5udSwrFtc0cjroB9t4DI3nBDhaVvGy2IVqAcsg+4EfM0zvuzFXDDCeBS2a9Hj87yP7gW7aagu6QMf64dLtrb0XuAiFvHmC7sBFwAirrdtSMcNlhGAIq7dQUKkWjSZub+w60rB41qkMXqW8orou9naF3Qb8aBuuIushgBZWQ9Yv7v6HtI6j/Ul8no9yffEIbsYOV7ayncSvVkWt0ED/jpjjVFbQNCdVylajOm1QdZKmNcqcjultBEvrJqvdxwRfjQF7lDrbddGC6oYnDJnz4h9FEIi4ef7j2X1XdfSgvH/snkgWTi1jnAKlJceva0ZD8CzLoRDtIKRsi7MmqKRykHHxA6SRBE4q5gEQMNET6SGdprnLeUcG/VoXL95cLZG5xNnGX6iDJf9TyR6V8Zae/WY9v9LolealyphQ41WKg7d0U5jMj8/YR+RPV8s2p3aSYsTcSvdpXntMerpoYMK3YdRjs6CYHZ54TiopG/Bs2uQlln43+42nKF+tPV4h5xXreiq0WLnoCNfpkRNaHzjgUZdPzusuE8Z5+hZDS8kpdjL8oqYWhWReGYkLru4xb/NDfR7bJ1ZsVM+EgSHx4LzS2XI0S+4HlgNlLuz6vIzkFQlnx072mZ+WK1bSp/qYUWUTDKdUJGOib3dlfA==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(136003)(376002)(366004)(39860400002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(2906002)(5660300002)(44832011)(7416002)(41300700001)(38070700009)(36756003)(921008)(86362001)(31696002)(38100700002)(122000001)(966005)(83380400001)(8676002)(66574015)(71200400001)(316002)(6512007)(6486002)(2616005)(64756008)(66556008)(66476007)(66446008)(91956017)(76116006)(66946007)(54906003)(110136005)(478600001)(26005)(31686004)(53546011)(6506007)(8936002)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?MENQNmJhbWtlemNGSFNOQkhVSDZWakgvMU40bWl1V3FzR2k5cTVCeUUweFZO?=
 =?utf-8?B?R1BkUWppVkt4U1VtaXNtZEZtSUdvaHptblRBTUdCMVJjZkZrVEhXa0xJTmZw?=
 =?utf-8?B?NlhVOUV4cG51OWh0REhEWUZKcHlyV0FlOHRjUFhSaGs2bHVsK0huVUdkRjFk?=
 =?utf-8?B?ZEdSQ2puc0taMlhLeVd4aGNHWUVqTDNMWUY4c1NNQXBZTjhnQ3ZSeGhtbUJR?=
 =?utf-8?B?WUJFL1I0eWRIRTJWQmFjQ3l5cHNzYnhNbnJmMk9lajhsNWxnTGl1ZzQ4YndY?=
 =?utf-8?B?K0lsdE5oUDFURWptakRGMlRPUlJPRFpGTHpVWDFMN0E5V0lvNEE5V3A3Wk9K?=
 =?utf-8?B?b0ZCVFczVEF1dFl4TzRnbkd0M3dXZUtMZ1lRdzA0NGNvTWVDVlZlRHdjY1lo?=
 =?utf-8?B?QTZqd1diVW40ekR1WENodnVQd3RrbEYxc0FBVE9aZFR3OGZnY0RSaUgzY25p?=
 =?utf-8?B?V05mS1dYWDd0K1h2YUk4VGdXbWdhcTBJT0JsTGZyU3pRQmMvcjJMU2w2WC9U?=
 =?utf-8?B?SmxzTXZLQi9pNjM5NlZ1QnNLTG9MejhXdWFvVlhvYmpLZEdSd1BBaG5Ed2Fi?=
 =?utf-8?B?WE5XMzZsVkxnUUpjRUlsUFV5Tk1qOHNhU0pGa0hHRnFXckNPRXVGTENxV01B?=
 =?utf-8?B?N2RkYkUwU2o3dUF6dThIVTZGQmZkdGp2OTdkSnd1V3BnUmJQVC94dVpNNEdQ?=
 =?utf-8?B?WjFsZjdKUmN2T293TytmT2UyeGp4UTl5czVyZytHampzV09DdmNWa0FxazNr?=
 =?utf-8?B?WlF5L2w4N0UwZmhCUkRUK3lqSEorbnRmOWZROE1jeGVmcXZ5OXpKcUtNNmpk?=
 =?utf-8?B?N0tmSFdYaGhIUnB0dkNGZ0hxUzhicnBLaE9wVHAzK2NzRHZLQ3JtVyt5MEZR?=
 =?utf-8?B?aWtadjU3ZUozdHJlNFQ4TGdkSStxMlA5NVVZYTVWcEVldGJqdU5DbjJPQzZj?=
 =?utf-8?B?NVBndE1IRFdqemJoZmROUW1JQ1BNdDVDN1NVcXJxY3B0UlNEYllpNElBZ1BP?=
 =?utf-8?B?WDVPeTRwK2NYd1dOZVBPSTJRNmNyV1hmT2srYmIzdGNzNjdCRlh6ZXIrK2g3?=
 =?utf-8?B?ajBGMkkyMVJWNDZKVUJOQ3FIRXNKZldYY2pQWmM4UG9GdVgrS2lKeUFwcFJQ?=
 =?utf-8?B?RGhiTkRGOUpOUnlTRGFCUk5GWjRiWGVoMG1YVXZEN295RGhqM1JhVXJSci9V?=
 =?utf-8?B?Vk5peC9NaC9vaE13TnNQQmVUMi9BMXIrMFNMcUFqTHZRd1ZJZzRuVkhyUDRr?=
 =?utf-8?B?a0NtQytxeEdnOU5iRWF3dlhKR3dNcWNJY1NTNTF5enN0SEEyTE83S21jdkZB?=
 =?utf-8?B?U3ZMUlYxYWp3NEp2T1VZNnoyMDlOZExrZzJPaG9FSjJlMmh0UWVkLzZCeCtB?=
 =?utf-8?B?VE82YzIrdmtUOFFKc2JVWGZOd3c3TlhJVFJkUmZzTUtBTzZQb0pLUTVCYkFK?=
 =?utf-8?B?TjVIdVErdEtGekkrNHJrRW1aQ0c1dTBrMzliK1ZQL1pzYWQvcXYwMTMwZFVn?=
 =?utf-8?B?dFAxdkEwU0U0eVRJRUdRMmF1K3BxREhKZ1VBKzVGU2dwMTVmdVJXKzVnbjhR?=
 =?utf-8?B?V2l3cmFNZGNsbEI4RWN5NHBJbEdXb0xZMVhFMFBlK2VRUElVTWRXeHVuNnlR?=
 =?utf-8?B?bDFZbis4dVlBTVBIdEZDMlJJRzlwUHd2aW1MUFpSZ1BvWVEva1YxMEE0R0J1?=
 =?utf-8?B?TGpSYnZGSkJlem1mdVJuVGlzY091SGFSZFdERWlnb09ka2hrcHhkTi85RTEr?=
 =?utf-8?B?N0xsSjA2V1lYYW4rbnlyT1BzSm44T21QcldZS0Iva2ZVOXByUktxdlVJZk1Z?=
 =?utf-8?B?T0huN0g3bWs5M2d4WnkyU1psRU9wVitHZy9tMU4rd2NOQXdFb202QmJXZldX?=
 =?utf-8?B?WkZ3OHBnaG1KMUcyaENObkJ6T2VOcUlDR215UDR5ZEpnY2ttR2FTWUJtL0w2?=
 =?utf-8?B?ZGs5WnBpMnRaWWFSVmJjMnkwb3RGV0Z4d0xXdWlpbnFnc1dtVStjelRvQ0ZB?=
 =?utf-8?B?NEg4S1FZMlJnbEhIZDJBLzNob3lTOW9tckV1cFRUR3BMZURncGl3SkhVa3Ex?=
 =?utf-8?B?NzhJUkVZMDFkYmQ3RXk0LzMvRFZBRzZMYWhkYnVtS09Yb3o1UVh3NHJKb2hj?=
 =?utf-8?Q?+X3lMBHVV0cv41f6erqOyduPe?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <41573102C6D6E946A6AFFF5AE8BE1576@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e7dc0ab3-49a4-4459-5809-08dbf6a8a842
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2023 22:14:04.0536
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uDr1Z84CqHarADpPqhV5rB/WawolfGpBiy61s8I9sDI0w1G7i5aOEYOEYtEyl2M7w7/l7rK3J+Bcqn9pfhqp316zBvUSUlBNR+LAcGZwQVY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB2191
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
Cc: "kernel@salutedevices.com" <kernel@salutedevices.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA2LzEyLzIwMjMgw6AgMTk6NTgsIEdlb3JnZSBTdGFyayBhIMOpY3JpdMKgOg0KPiBb
Vm91cyBuZSByZWNldmV6IHBhcyBzb3V2ZW50IGRlIGNvdXJyaWVycyBkZSBnbnN0YXJrQHNhbHV0
ZWRldmljZXMuY29tLiANCj4gRMOpY291dnJleiBwb3VycXVvaSBjZWNpIGVzdCBpbXBvcnRhbnQg
w6AgDQo+IGh0dHBzOi8vYWthLm1zL0xlYXJuQWJvdXRTZW5kZXJJZGVudGlmaWNhdGlvbiBdDQo+
IA0KPiBIZWxsbyBIYW5zDQo+IA0KPiBUaGFua3MgZm9yIHRoZSByZXZpZXcuDQo+IA0KPiBPbiAx
Mi82LzIzIDE4OjAxLCBIYW5zIGRlIEdvZWRlIHdyb3RlOg0KPj4gSGkgR2VvcmdlLA0KPj4NCj4+
IE9uIDEyLzQvMjMgMTk6MDUsIEdlb3JnZSBTdGFyayB3cm90ZToNCj4+PiBVc2luZyBvZiBkZXZt
IEFQSSBsZWFkcyB0byBjZXJ0YWluIG9yZGVyIG9mIHJlbGVhc2luZyByZXNvdXJjZXMuDQo+Pj4g
U28gYWxsIGRlcGVuZGVudCByZXNvdXJjZXMgd2hpY2ggYXJlIG5vdCBkZXZtLXdyYXBwZWQgc2hv
dWxkIGJlIGRlbGV0ZWQNCj4+PiB3aXRoIHJlc3BlY3QgdG8gZGV2bS1yZWxlYXNlIG9yZGVyLiBN
dXRleCBpcyBvbmUgb2Ygc3VjaCBvYmplY3RzIHRoYXQNCj4+PiBvZnRlbiBpcyBib3VuZCB0byBv
dGhlciByZXNvdXJjZXMgYW5kIGhhcyBubyBvd24gZGV2bSB3cmFwcGluZy4NCj4+PiBTaW5jZSBt
dXRleF9kZXN0cm95KCkgYWN0dWFsbHkgZG9lcyBub3RoaW5nIGluIG5vbi1kZWJ1ZyBidWlsZHMN
Cj4+PiBmcmVxdWVudGx5IGNhbGxpbmcgbXV0ZXhfZGVzdHJveSgpIGlzIGp1c3QgaWdub3JlZCB3
aGljaCBpcyBzYWZlIGZvciBub3cNCj4+PiBidXQgd3JvbmcgZm9ybWFsbHkgYW5kIGNhbiBsZWFk
IHRvIGEgcHJvYmxlbSBpZiBtdXRleF9kZXN0cm95KCkgaXMNCj4+PiBleHRlbmRlZCBzbyBpbnRy
b2R1Y2UgZGV2bV9tdXRleF9pbml0KCkuDQo+Pj4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBHZW9yZ2Ug
U3RhcmsgPGduc3RhcmtAc2FsdXRlZGV2aWNlcy5jb20+DQo+Pj4gLS0tDQo+Pj4gwqAgaW5jbHVk
ZS9saW51eC9kZXZtLWhlbHBlcnMuaCB8IDE4ICsrKysrKysrKysrKysrKysrKw0KPj4+IMKgIDEg
ZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspDQo+Pj4NCj4+PiBkaWZmIC0tZ2l0IGEvaW5j
bHVkZS9saW51eC9kZXZtLWhlbHBlcnMuaCBiL2luY2x1ZGUvbGludXgvZGV2bS1oZWxwZXJzLmgN
Cj4+PiBpbmRleCA3NDg5MTgwMjIwMGQuLjJmNTZlNDc2Nzc2ZiAxMDA2NDQNCj4+PiAtLS0gYS9p
bmNsdWRlL2xpbnV4L2Rldm0taGVscGVycy5oDQo+Pj4gKysrIGIvaW5jbHVkZS9saW51eC9kZXZt
LWhlbHBlcnMuaA0KPj4+IEBAIC03Niw0ICs3NiwyMiBAQCBzdGF0aWMgaW5saW5lIGludCBkZXZt
X3dvcmtfYXV0b2NhbmNlbChzdHJ1Y3QgDQo+Pj4gZGV2aWNlICpkZXYsDQo+Pj4gwqDCoMKgwqAg
cmV0dXJuIGRldm1fYWRkX2FjdGlvbihkZXYsIGRldm1fd29ya19kcm9wLCB3KTsNCj4+PiDCoCB9
DQo+Pj4NCj4+PiArc3RhdGljIGlubGluZSB2b2lkIGRldm1fbXV0ZXhfcmVsZWFzZSh2b2lkICpy
ZXMpDQo+Pj4gK3sNCj4+PiArwqDCoMKgIG11dGV4X2Rlc3Ryb3kocmVzKTsNCj4+PiArfQ0KPj4+
ICsNCj4+PiArLyoqDQo+Pj4gKyAqIGRldm1fbXV0ZXhfaW5pdCAtIFJlc291cmNlLW1hbmFnZWQg
bXV0ZXggaW5pdGlhbGl6YXRpb24NCj4+PiArICogQGRldjrCoMKgwqAgRGV2aWNlIHdoaWNoIGxp
ZmV0aW1lIHdvcmsgaXMgYm91bmQgdG8NCj4+PiArICogQGxvY2s6wqDCoCBQb2ludGVyIHRvIGEg
bXV0ZXgNCj4+PiArICoNCj4+PiArICogSW5pdGlhbGl6ZSBtdXRleCB3aGljaCBpcyBhdXRvbWF0
aWNhbGx5IGRlc3Ryb3llZCB3aGVuIGRyaXZlciBpcyANCj4+PiBkZXRhY2hlZC4NCj4+PiArICov
DQo+Pj4gK3N0YXRpYyBpbmxpbmUgaW50IGRldm1fbXV0ZXhfaW5pdChzdHJ1Y3QgZGV2aWNlICpk
ZXYsIHN0cnVjdCBtdXRleCANCj4+PiAqbG9jaykNCj4+PiArew0KPj4+ICvCoMKgwqAgbXV0ZXhf
aW5pdChsb2NrKTsNCj4+PiArwqDCoMKgIHJldHVybiBkZXZtX2FkZF9hY3Rpb25fb3JfcmVzZXQo
ZGV2LCBkZXZtX211dGV4X3JlbGVhc2UsIGxvY2spOw0KPj4+ICt9DQo+Pj4gKw0KPj4+IMKgICNl
bmRpZg0KPj4NCj4+IG11dGV4X2Rlc3Ryb3koKSBvbmx5IGFjdHVhbGx5IGRvZXMgYW55dGhpbmcg
aWYgQ09ORklHX0RFQlVHX01VVEVYRVMNCj4+IGlzIHNldCwgb3RoZXJ3aXNlIGl0IGlzIGFuIGVt
cHR5IGlubGluZS1zdHViLg0KPj4NCj4+IEFkZGluZyBhIGRldnJlcyByZXNvdXJjZSB0byB0aGUg
ZGV2aWNlIGp1c3QgdG8gY2FsbCBhbiBlbXB0eSBpbmxpbmUNCj4+IHN0dWIgd2hpY2ggaXMgYSBu
by1vcCBzZWVtcyBsaWtlIGEgd2FzdGUgb2YgcmVzb3VyY2VzLiBJTUhPIGl0DQo+PiB3b3VsZCBi
ZSBiZXR0ZXIgdG8gY2hhbmdlIHRoaXMgdG86DQo+Pg0KPj4gc3RhdGljIGlubGluZSBpbnQgZGV2
bV9tdXRleF9pbml0KHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IG11dGV4ICpsb2NrKQ0KPj4g
ew0KPj4gwqDCoMKgwqDCoCBtdXRleF9pbml0KGxvY2spOw0KPj4gI2lmZGVmIENPTkZJR19ERUJV
R19NVVRFWEVTDQo+PiDCoMKgwqDCoMKgIHJldHVybiBkZXZtX2FkZF9hY3Rpb25fb3JfcmVzZXQo
ZGV2LCBkZXZtX211dGV4X3JlbGVhc2UsIGxvY2spOw0KPj4gI2Vsc2UNCj4+IMKgwqDCoMKgwqAg
cmV0dXJuIDA7DQo+PiAjZW5kaWYNCj4+IH0NCj4+DQo+PiBUbyBhdm9pZCB0aGUgdW5uZWNlc3Nh
cnkgZGV2cmVzIGFsbG9jYXRpb24gd2hlbg0KPj4gQ09ORklHX0RFQlVHX01VVEVYRVMgaXMgbm90
IHNldC4NCj4gDQo+IEhvbmVzdGx5IHNheWluZyBJIGRvbid0IGxpa2UgdW5uZWNlc3NhcnkgZGV2
cmVzIGFsbG9jYXRpb24gZWl0aGVyIGJ1dA0KPiB0aGUgcHJvcG9zZWQgYXBwcm9hY2ggaGFzIGl0
cyBvd24gcHJpY2U6DQo+IA0KPiAxKSB3ZSdsbCBoYXZlIG1vcmUgdGhhbiBvbmUgcGxhY2Ugd2l0
aCBicmFuY2hpbmcgaWYgbXV0ZXhfZGVzdHJveSBpcw0KPiBlbXB0eSBvciBub3QgdXNpbmfCoCBp
bmRpcmVjdCBjb25kaXRpb24uIElmIHN1ZGRlbmx5IG11dGV4X2Rlc3Ryb3kgaXMNCj4gZXh0ZW5k
ZWQgZm9yIG5vbi1kZWJ1ZyBjb2RlIChpbiB1cHN0cmVhbSBicmFuY2ggb3IgZS5nLiBieSBzb21l
b25lIGZvcg0KPiBsb2NhbCBkZWJ1ZykgdGhhbiB0aGVyZSdsbCBiZSBhIHByb2JsZW0uDQo+IA0K
PiAyKSBJZiBtdXRleF9kZXN0cm95IGlzIGVtcHR5IG9yIG5vdCBkZXBlbmRzIG9uIENPTkZJR19Q
UkVFTVBUX1JUIG9wdGlvbg0KPiB0b28uIFdoZW4gQ09ORklHX1BSRUVNUFRfUlQgaXMgb24gbXV0
ZXhfZGVzdHJveSBpcyBhbHdheXMgZW1wdHkuDQo+IA0KPiBBcyBJIHNlZSBpdCBvbmx5IHRoZSBt
dXRleCBpbnRlcmZhY2UgKG11dGV4LmgpIGhhcyB0byBzYXkgZGVmaW5pdGVseSBpZg0KPiBtdXRl
eF9kZXN0cm95IG11c3QgYmUgY2FsbGVkLiBQcm9iYWJseSB3ZSBjb3VsZCBhZGQgc29tZSBkZWZp
bmUgdG8NCj4gaW5jbHVkZS9saW51eC9tdXRleC5oLGxpa2UgSVNfTVVURVhfREVTVFJPWV9SRVFV
SVJFRCBhbmQgZGVjbGFyZSBpdCBuZWFyDQo+IG11dGV4X2Rlc3Ryb3kgZGVmaW5pdGlvbiBpdHNl
bGYuDQo+IA0KPiBJIHRyaWVkIHRvIHB1dCBkZXZtX211dGV4X2luaXQgaXRzZWxmIGluIG11dGV4
LmggYW5kIGl0IGNvdWxkJ3ZlIGhlbHBlZA0KPiB0b28gYnV0IGl0J3Mgbm90IHRoZSBwbGFjZSBm
b3IgZGV2bSBBUEkuDQo+IA0KDQpXaGF0IGRvIHlvdSBtZWFuIGJ5ICJpdCdzIG5vdCB0aGUgcGxh
Y2UgZm9yIGRldm0gQVBJIiA/DQoNCklmIHlvdSBkbyBhICdncmVwIGRldm1fIGluY2x1ZGUvbGlu
dXgvJyB5b3UnbGwgZmluZCBkZXZtXyBmdW5jdGlvbnMgaW4gDQphbG1vc3QgMTAwIC5oIGZpbGVz
LiBXaHkgd291bGRuJ3QgbXV0ZXguaCBiZSB0aGUgcGxhY2UgZm9yIA0KZGV2bV9tdXRleF9pbml0
KCkgPw0KDQpDaHJpc3RvcGhlDQo=
