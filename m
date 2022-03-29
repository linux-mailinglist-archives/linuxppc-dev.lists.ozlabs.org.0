Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1C54EB2B6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Mar 2022 19:33:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KSc9760Qxz3c1L
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Mar 2022 04:33:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::62d;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on062d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::62d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KSc8d4hnVz2xYB
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Mar 2022 04:32:48 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V/JwN8p85r5Xv5LlCT21dUu49gyE48a8lPioy02m1d+OELUirFFpQ4bQPVBBxqa8Q1GS1WVMztnJPc9yC1IYzj3g9W2vSNRbYPGIA9/xJ6HHw9xH63zeJRr7wjzjg1IOnIjWflKhhCUjuDdEJSPFduEVr33qsTM4I0KEUufyuu1eImZV585R50C5cy9o5ddGo4f+KqMDQ/0TG0xjGC6h5WbuX5vq+wazAY6s5iKoKD2zT7jK4sIwIeE15Kvi/WZOSaJdgQG7c6lPbzMqGxUXXtTgOawYaaLyNshmk74E61y6aj3MCMcs/CHrnBTT4WZNBJlH/fz1vJRsbF/xmRJNtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yOWsq64ViyDVLmJkeQcxMFmXYeO3HiiZXE/ueFYkzU8=;
 b=MYE9rhw6TkqpBT63FUJE6iWi7T2uiNyifCKw3EXWwm7ZBtsYYiSmU+oG3EcFyPb109fmASi4aQMFdPYOzpFU1jtQRTI+22pgZh+fT5cyAH1E+xJS2O2wZkT6S969sjHBvTw3yX8HlFrSN5neqkrPDSbhdQRflRjlT3dBpfPp9IwdlXjXiLvTOCmVIS+VpQ/UlI6osDcOz+GnPNGA6eKnI+kOodbdDLVmft85JNmlnw3rAiSiumJKaGZFUKkG2WPLLbhxJwyp9//hSpAI8iarxZfHVEEHduXTmtFH/veff67XNcLSaYYkzYpGBEjfhux0G+q6c3nJvu45z5FImIvLIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB3015.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1d6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17; Tue, 29 Mar
 2022 17:32:18 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::cd2f:d05d:9aa3:400d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::cd2f:d05d:9aa3:400d%6]) with mapi id 15.20.5102.023; Tue, 29 Mar 2022
 17:32:18 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Josh Poimboeuf <jpoimboe@redhat.com>
Subject: Re: [RFC PATCH 3/3] objtool/mcount: Add powerpc specific functions
Thread-Topic: [RFC PATCH 3/3] objtool/mcount: Add powerpc specific functions
Thread-Index: AQHYOsOkMhd+XrYXYE6fzWpV8XELvKzS/yUAgAJH8wCAAQzdAIAAXGKA
Date: Tue, 29 Mar 2022 17:32:18 +0000
Message-ID: <af262c28-0d73-7ae6-3dd5-2977c9a41f7d@csgroup.eu>
References: <20220318105140.43914-1-sv@linux.ibm.com>
 <20220318105140.43914-4-sv@linux.ibm.com>
 <YjR6kHq4c/rjCTpr@hirez.programming.kicks-ass.net>
 <0b55f122-4760-c1ba-840a-0911cefec2ad@csgroup.eu>
 <20220328195920.dqlfra3lcardko6r@treble> <87mth9ezml.fsf@mpe.ellerman.id.au>
In-Reply-To: <87mth9ezml.fsf@mpe.ellerman.id.au>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: be66235b-c72c-4073-bbc2-08da11aa1316
x-ms-traffictypediagnostic: PR0P264MB3015:EE_
x-microsoft-antispam-prvs: <PR0P264MB301576EA9A984441188718CFED1E9@PR0P264MB3015.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AdlrteMKunkt1t3jEuzZayS5fO5xtQFtrXO95cwQNS2eUPf4KZV/n9MgRRnVa1JCkPvKQI/Gjm4uYk8arcQf/jBNPmnsXRFHJeWAqhz0LjPyLGSUwo9hEF8JVjIhddyfOz7ioDGsq1AZs7I7rXsQDpCc4CfOj0o6/kBOd9UbfNQ7pL8pcOwKT+I9KJjklG9gNVrEzg4IuDD89P4BGrNfMAolLsBZ9Mt0x0/fYu27zJdiKz15rMyuQM1NOtUfY6jVaY2cz30Ym/VRCbjjhvhrXMPnU8l12WlVwpDaHXsjh803J1eucmHXc7kvVdkV/0OoV4HdbetM6Efp9+Mg+h156M6bejNeWrDFyAi9xTjNt5sYlgA/2hTMVuP+qQ0v/8TDbS1xmUzY33qEXUkkXAj5echkV/whO6jTkkct4KZTYzDEbUoCUG2j3nbEnyUKRE50b7TLEjXMV9m4sFus+XXld8d97750C4ys8KruG7K/QpxCfPxCnTFeJnDeiEDZxVOK8R4AWOkhUQoa7WN1VyORriGS3myh1PsA10wfw183AP/S+K7rhyL4f3byZGM+8oXaSPnh4sE9vOvcmj/Ks6OcC9PFxOwom1FyBAUjevh84fHjxKheb1kLald7YLWdDtbqBE2A3sNhWTnrfs8VAVFj/69EwtXW2xabgd9gzUYG355cH0iZ22UpYsgAVRZVN5Kv8fc543mJ/Y8FQUG+tAD+0MkTwfDwGpu9N1XBahypImx5EzWhc7UYnfaMDvbqfTq9f7Gsaa3d7LqLtPwNd0/PXdMcjylELGpe2d6B3m7rU6qFfSGvNOfdznFju5CxuzINs9Jh0BZ+HmXGbTVjhTaU7F0n7A+uGSjbUrYUTncYGlQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(110136005)(54906003)(76116006)(6512007)(44832011)(66946007)(66476007)(66556008)(2616005)(64756008)(2906002)(6486002)(4326008)(91956017)(8676002)(38070700005)(66446008)(316002)(36756003)(38100700002)(31696002)(83380400001)(5660300002)(122000001)(26005)(966005)(186003)(86362001)(31686004)(508600001)(8936002)(6506007)(66574015)(71200400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?REVTSlpZU3VtaXA5Sjg2SDV2cGo5VEh1MGZ2VGRkKzVYb2U0Mnk3YjR2UUlL?=
 =?utf-8?B?a3hKeDE3bUUwWEY5VVpVeWRuS0pYZGhCaUVhMWVjTkRtWmFOalc1bTI0L0Nv?=
 =?utf-8?B?OEtFb3lLTExSeFUyWHJ2bnd1SlRaZXk1MEdxdHROTW5SZyt4TTJ2dXRXVHpt?=
 =?utf-8?B?QUg5bCtSSXRHN3h2K014bU9JWWh6RzF3aTM3b0tjWXdISk1ZT0pncnBHTTZI?=
 =?utf-8?B?S0ZGbGtYOTB0NHYyMjYwVm9wR1plN2RhM3ozK2xIK2JmU28wWlJ3S1Q1M0NF?=
 =?utf-8?B?cWk0Ylk2dEtUUlVWTndHVDNVRk5JdEJ2bVZGYzdXQTA1VlNFQTBrZjNiY0RS?=
 =?utf-8?B?L1o1TWVPWlIySjlhbUY4clFFUmtvMmdnSHFFVGtMMnQvYTZ3SjlNSndKYWJU?=
 =?utf-8?B?eFdoRFFmRnRoa1NySHl2czczM0szbzdha3BDYVF4QXVQcEVGTStRNFYrQXY5?=
 =?utf-8?B?SGVSRTJaMlJsMEVYTVAvYmpOdHlTdDJzZXhrUDc1c1kwTXhTZlA2RG02R05I?=
 =?utf-8?B?dHNsQnNwYTVCUUxMVVA3VFI5ZlRCQnRIbTlIL1EwVWYwbERoTTY2ZDhYdUE1?=
 =?utf-8?B?aHVRQkMvY2xYK21XN3VDaWVKUXlkV2VhUnhsTGFNOXA5dGd2eDVmMHprSGZm?=
 =?utf-8?B?QUg0cTVHYXlUdnFUNDVkT3NXYTVDYjBvMndWZ3dwWEYxUDVrTEF4OU9MSkIx?=
 =?utf-8?B?Q1dpVytCTDdGT1psRjhVbEZTSlpib3pCbnRnWDJLQnMxTVpzOVU5dGxubXNp?=
 =?utf-8?B?Tk9NZEpqeGhqcXZjS0t1eVdWMmk3bnRVMmI3QTJaSDhNc3dkODhYaUkwMyth?=
 =?utf-8?B?M0NuTnlmZ3crdnVjMDV3OTNXVkdvZlJ2UXFRZUZuTDIrK3R3Qk9WQkZWdjZY?=
 =?utf-8?B?T3drYWVlNC9McjNSZDJyejBiWUs4YXp0dzd0Qis5OXY1YzBnWFZmOTd6Y2sv?=
 =?utf-8?B?WGdxanB0YnZMeTNIbEZHNHd3dkUxeldDNDk3VTNCVkVvRUNqNFhOZGF5VDVy?=
 =?utf-8?B?cVRDY2RhWlNaMUgrN0w5STJxVWwyRUd2UndQVTFWc1JrSG1kbkhmNEFhODRM?=
 =?utf-8?B?VGIxcDQ4V0N2Rzg1eU1hVnpkRmowNFNDUW12V1BaTUJwN2FMS2lqR3lmMW1i?=
 =?utf-8?B?Wkp1MXhRNTFFV0szc29rMHA0ZjVYbFNFZm9LVTkwbjdsMm9iZlNNQWtWRnN0?=
 =?utf-8?B?M3ZmSG9ZT3Fpek1kdkRsK2xhS1AzcHNWOTIwZXV5OE9INDJOV0dJTnJiN0J1?=
 =?utf-8?B?NzlLT1FVVGNsWDJoR3E0eXhGWHdzZ3NHZ0xRd1o5Q1VVZDRJcUsvMVdPczlx?=
 =?utf-8?B?ZE9jN09RTW5FTWgyRHlkMXpqTTRjMndHZ2orOHB4YVJZRUtqWTYwWGc0STUz?=
 =?utf-8?B?dWdFOVFGVHB6S2pUeitHVjM3SWs4a2dOUk4yaHBWd1FIUk5nUWlidU5wSjky?=
 =?utf-8?B?bURqQXFQS2ZNSjBiZmdveUoyVGhKV2NHeG9xcFJqNHpKQmxqY1lqcUJRMXdo?=
 =?utf-8?B?TzAreFkzc1BQUmZ5Y1hhZFNLRjB3MkczclpKUG1jc3pEVnZ4VjhoUXpmZjRn?=
 =?utf-8?B?ZTIvWWFiM0Q4OStwSFpVVHl3U0MzK3lCcWpKKzlkMkRybnNnS1dUUFJSUGdm?=
 =?utf-8?B?dnNVVXRVQUxtQXhhK1JRaHN3dVRNZjhpM3dBbXBJbXpJV2RlNWxnV2hOL1lt?=
 =?utf-8?B?NnkxZy8vdGpKYkNWazFjSGVCL21Xc1JBS1JTRy9qZFd1QURpUUEyS1JUUXNq?=
 =?utf-8?B?eWNTWnZqMUtxYVFXNVl1VXB0TTZQVVlTelBiN2t2SW5wMFhSYkxzU2RiWkVh?=
 =?utf-8?B?bDdMVTVaY2RxS2ZGT2xaSjR2UDdtenFGVHFlcnQ5TCsrd0dOamFsZVhwdlVq?=
 =?utf-8?B?Ui9ManRnV2NxdlVpdGJ0NVVOOVB0OGZrS2JuazhnQ0ZWdU5EZ3J6MWNmWGg3?=
 =?utf-8?B?VDNzN1B1MHdlNlhTMlhJVUJlcUlBcEhpVmtkQ0hjV3RhbUdmUXJSakNUd1Fn?=
 =?utf-8?B?MWJEWU9VYmxJWVV1cjhVR0FDdGN0SzhHcmhwd2RLVGtTUVFBUHVrQ3RIaldY?=
 =?utf-8?B?MG54RHUxaU8zd0xtbGVEYnNwMlhBVXY0WFFCc1hCMk5xbWZndHBEbmwxQkxZ?=
 =?utf-8?B?WEFjaG5yN2hVUlFqVlBlZnJjbHNiTUN0UWx0M0JpYUJNSDlsQjg5TjNqMStT?=
 =?utf-8?B?ZFJ4OWQ0QnF1b0c4ajY5Z2ZmRGJ2OXR4Wi9ZKzEwbDUwR2pQenQ4N2hiQjUy?=
 =?utf-8?B?NHJuNDVtTXA3Ujc0RmhiTEVtZ1ZFaW1oUlVYNXlTUXMrUDBRVTVNMnBuSGJl?=
 =?utf-8?B?MjRGT0t3Zm5vbXhKQk93QjhKQVIvV2lCY3dySlpmWGZMNkpUdHJ0ZE1ZY2hi?=
 =?utf-8?Q?98DdkbUWfSqvrsNS9zuyc1R6N8abP4wt2HoEo?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <350788549A8C34488E4A3C70049C8133@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: be66235b-c72c-4073-bbc2-08da11aa1316
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Mar 2022 17:32:18.7934 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RKMkn3okPyY+cmL8yKFygEg3U8geKkjx/YpW2ZEpXbp7p+Nl0NXwf/KB1n4u0+hTaodSdArho/QGcB0n5qLaYi3bbX8LFr44MMCBtNUbOXI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB3015
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>, "aik@ozlabs.ru" <aik@ozlabs.ru>,
 Sathvika Vasireddy <sv@linux.ibm.com>,
 "naveen.n.rao@linux.vnet.ibm.com" <naveen.n.rao@linux.vnet.ibm.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI5LzAzLzIwMjIgw6AgMTQ6MDEsIE1pY2hhZWwgRWxsZXJtYW4gYSDDqWNyaXTCoDoN
Cj4gSm9zaCBQb2ltYm9ldWYgPGpwb2ltYm9lQHJlZGhhdC5jb20+IHdyaXRlczoNCj4+IE9uIFN1
biwgTWFyIDI3LCAyMDIyIGF0IDA5OjA5OjIwQU0gKzAwMDAsIENocmlzdG9waGUgTGVyb3kgd3Jv
dGU6DQo+Pj4gU2Vjb25kIHBvaW50IGlzIHRoZSBlbmRpYW5lc3MgYW5kIDMyLzY0IHNlbGVjdGlv
biwgZXNwZWNpYWxseSB3aGVuDQo+Pj4gY3Jvc3NidWlsZGluZy4gVGhlcmUgaXMgYWxyZWFkeSBz
b21lIHN0dWZmIHJlZ2FyZGluZyBlbmRpYW5lc3MgYmFzZWQgb24NCj4+PiBic3dhcF9pZl9uZWVk
ZWQoKSBidXQgdGhhdCdzIGJhc2VkIG9uIGNvbnN0YW50IHNlbGVjdGlvbiBhdCBidWlsZCB0aW1l
DQo+Pj4gYW5kIEkgY291bGRuJ3QgZmluZCBhbiBlYXN5IHdheSB0byBzZXQgaXQgY29uZGl0aW9u
YWx5IGJhc2VkIG9uIHRoZQ0KPj4+IHRhcmdldCBiZWluZyBidWlsdC4NCj4+Pg0KPj4+IFJlZ2Fy
ZGluZyAzMi82NCBzZWxlY3Rpb24sIHRoZXJlIGlzIGFsbW9zdCBub3RoaW5nLCBpdCdzIGJhc2Vk
IG9uIHVzaW5nDQo+Pj4gdHlwZSAnbG9uZycgd2hpY2ggbWVhbnMgdGhhdCBhdCB0aGUgdGltZSBi
ZWluZyB0aGUgdGFyZ2V0IGFuZCB0aGUgYnVpbGQNCj4+PiBwbGF0Zm9ybSBtdXN0IGJvdGggYmUg
MzIgYml0cyBvciA2NCBiaXRzLg0KPj4+DQo+Pj4gRm9yIGJvdGggY2FzZXMgKGVuZGlhbmVzcyBh
bmQgMzIvNjQpIEkgdGhpbmsgdGhlIHNvbHV0aW9uIHNob3VsZA0KPj4+IHByb2JhYmx5IGJlIHRv
IHN0YXJ0IHdpdGggdGhlIGZpbGVmb3JtYXQgb2YgdGhlIG9iamVjdCBmaWxlIGJlaW5nDQo+Pj4g
cmV3b3JrZWQgYnkgb2JqdG9vbC4NCj4+DQo+PiBEbyB3ZSByZWFsbHkgbmVlZCB0byBkZXRlY3Qg
dGhlIGVuZGlhbm5lc3MvYml0bmVzcyBhdCBydW50aW1lPyAgT2JqdG9vbA0KPj4gaXMgYnVpbHQg
d2l0aCB0aGUga2VybmVsLCB3aHkgbm90IGp1c3QgYnVpbGQtaW4gdGhlIHNhbWUgdGFyZ2V0DQo+
PiBhc3N1bXB0aW9ucyBhcyB0aGUga2VybmVsIGl0c2VsZj8NCj4gDQo+IEkgZG9uJ3QgdGhpbmsg
d2UgbmVlZCBydW50aW1lIGRldGVjdGlvbi4gQnV0IGl0IHdpbGwgbmVlZCB0byBzdXBwb3J0DQo+
IGJhc2ljYWxseSBtb3N0IGNvbWJpbmF0aW9ucyBvZiBvYmp0b29sIHJ1bm5pbmcgYXMgMzItYml0
LzY0LWJpdCBMRS9CRQ0KPiB3aGlsZSB0aGUga2VybmVsIGl0J3MgYW5hbHlzaW5nIGlzIDMyLWJp
dC82NC1iaXQgTEUvQkUuDQoNCkV4YWN0bHksIHRoZSB3YXkgaXQgaXMgZG9uZSB0b2RheSB3aXRo
IGEgY29uc3RhbnQgaW4gDQpvYmp0b29sL2VuZGlhbm5lc3MuaCBpcyB0b28gc2ltcGxlLCB3ZSBu
ZWVkIHRvIGJlIGFibGUgdG8gc2VsZWN0IGl0IA0KYmFzZWQgb24ga2VybmVsJ3MgY29uZmlnLiBJ
cyB0aGVyZSBhIHdheSB0byBnZXQgdGhlIENPTkZJR18gbWFjcm9zIGZyb20gDQp0aGUga2VybmVs
ID8gSWYgeWVzIHRoZW4gd2UgY291bGQgdXNlIENPTkZJR182NEJJVCBhbmQgDQpDT05GSUdfQ1BV
X0xJVFRMRV9FTkRJQU4gdG8gc2VsZWN0IHRoZSBjb3JyZWN0IG9wdGlvbnMgaW4gb2JqdG9vbC4N
Cg0KDQo+IA0KPj4+IFdoYXQgYXJlIGN1cnJlbnQgd29ya3MgaW4gcHJvZ3Jlc3Mgb24gb2JqdG9v
bCA/IFNob3VsZCBJIHdhaXQgSm9zaCdzDQo+Pj4gY2hhbmdlcyBiZWZvcmUgc3RhcnRpbmcgbG9v
a2luZyBhdCBhbGwgdGhpcyA/IFNob3VsZCBJIHdhaXQgZm9yIGFueXRoaW5nDQo+Pj4gZWxzZSA/
DQo+Pg0KPj4gSSdtIG5vdCBtYWtpbmcgYW55IG1ham9yIGNoYW5nZXMgdG8gdGhlIGNvZGUsIGp1
c3Qgc2h1ZmZsaW5nIHRoaW5ncw0KPj4gYXJvdW5kIHRvIG1ha2UgdGhlIGludGVyZmFjZSBtb3Jl
IG1vZHVsYXIuICBJIGhvcGUgdG8gaGF2ZSBzb21ldGhpbmcNCj4+IHNvb24gKHRoaXMgd2Vlayku
ICBQZXRlciByZWNlbnRseSBhZGRlZCBhIGJpZyBmZWF0dXJlIChJbnRlbCBJQlQpIHdoaWNoDQo+
PiBpcyBhbHJlYWR5IGluIC1uZXh0Lg0KPj4NCj4+IENvbnRyaWJ1dGlvbnMgYXJlIHdlbGNvbWUs
IHdpdGggdGhlIHVuZGVyc3RhbmRpbmcgdGhhdCB5b3UnbGwgaGVscA0KPj4gbWFpbnRhaW4gaXQg
Oy0pDQo+Pg0KPj4gU29tZSB5ZWFycyBhZ28gS2FtYWxlc2ggQmFidWxhbCBoYWQgYSBwcm90b3R5
cGUgb2Ygb2JqdG9vbCBmb3IgcHBjNjRsZQ0KPj4gd2hpY2ggZGlkIHRoZSBmdWxsIHN0YWNrIHZh
bGlkYXRpb24uICBJJ20gbm90IHN1cmUgd2hhdCBldmVyIGJlY2FtZSBvZg0KPj4gdGhhdC4NCj4g
DQo+ICBGcm9tIG1lbW9yeSBoZSB3YXMgc3RhcnRpbmcgdG8gY2xlYW4gdGhlIHBhdGNoZXMgdXAg
aW4gbGF0ZSAyMDE5LCBidXQgSQ0KPiBndWVzcyB0aGF0IHByb2JhYmx5IGdvdCBkZXJhaWxlZCBi
eSBDT1ZJRC4gQUZBSUsgaGUgbmV2ZXIgcG9zdGVkDQo+IGFueXRoaW5nLiBNYXliZSBzb21lb25l
IGF0IElCTSBoYXMgYSBjb3B5IGludGVybmFsbHkgKE5hdmVlbj8pLg0KPiANCj4+IEZXSVcsIHRo
ZXJlIGhhdmUgYmVlbiBzb21lIG9ianRvb2wgcGF0Y2hlcyBmb3IgYXJtNjQgc3RhY2sgdmFsaWRh
dGlvbiwNCj4+IGJ1dCB0aGUgYXJtNjQgbWFpbnRhaW5lcnMgaGF2ZSBiZWVuIGhlc2l0YW50IHRv
IGdldCBvbiBib2FyZCB3aXRoDQo+PiBvYmp0b29sLCBhcyBpdCBicmluZ3MgYSBjZXJ0YWluIG1h
aW50ZW5hbmNlIGJ1cmRlbi4gIEVzcGVjaWFsbHkgZm9yIHRoZQ0KPj4gZnVsbCBzdGFjayB2YWxp
ZGF0aW9uIGFuZCBPUkMgdW53aW5kZXIuICBCdXQgaWYgeW91IG9ubHkgd2FudCBpbmxpbmUNCj4+
IHN0YXRpYyBjYWxscyBhbmQvb3IgbWNvdW50IHRoZW4gaXQnZCBwcm9iYWJseSBiZSBtdWNoIGVh
c2llciB0bw0KPj4gbWFpbnRhaW4uDQo+IA0KPiBJIHdvdWxkIGxpa2UgdG8gaGF2ZSB0aGUgc3Rh
Y2sgdmFsaWRhdGlvbiwgYnV0IEkgYW0gYWxzbyB3b3JyaWVkIGFib3V0DQo+IHRoZSBtYWludGVu
YW5jZSBidXJkZW4uDQo+IA0KPiBJIGd1ZXNzIHdlIHN0YXJ0IHdpdGggbWNvdW50LCB3aGljaCBs
b29rcyBwcmV0dHkgbWluaW1hbCBqdWRnaW5nIGJ5IHRoaXMNCj4gc2VyaWVzLCBhbmQgc2VlIGhv
dyB3ZSBnbyBmcm9tIHRoZXJlLg0KPiANCg0KSSdtIG5vdCBzdXJlIG1jb3VudCBpcyByZWFsbHkg
bmVlZGVkIGFzIHdlIGhhdmUgcmVjb3JkbWNvdW50LCBidXQgYXQgDQpsZWFzdCBpdCBpcyBhbiBl
YXN5IG9uZSB0byBzdGFydCB3aXRoIGFuZCBhcyB3ZSBoYXZlIHJlY29yZG1vdW50IHdlIGNhbiAN
CmVhc2lseSBjb21wYXJlIHRoZSByZXN1bHRzIGFuZCBjaGVjayBpdCB3b3JrcyBhcyBleHBlY3Rl
ZC4NCg0KVGhlbiBpdCBzaG91bGQgYmUgc3RyYWlnaHQgZm9yd2FyZCB0byBwcm92aWRlIHN0YXRp
YyBjYWxscy4NCg0KVGhlbiBJJ2QgbGlrZSB0byBnbyB3aXRoIHVhY2Nlc3MgYmxvY2tzIGNoZWNr
cyBhcyBzdWdnZXN0ZWQgYnkgQ2hyaXN0b3BoIA0KYXQgDQpodHRwczovL3BhdGNod29yay5vemxh
YnMub3JnL3Byb2plY3QvbGludXhwcGMtZGV2L3BhdGNoL2E5NGJlNjFmMDA4YWIyOWMyMzFiODA1
ZTFhOTdlOWRhYjM1Y2IwY2MuMTYyOTczMjk0MC5naXQuY2hyaXN0b3BoZS5sZXJveUBjc2dyb3Vw
LmV1LywgDQp0aG91Z2h0IGl0IG1pZ2h0IGJlIGxlc3MgZWFzeS4NCg0KDQpDaHJpc3RvcGhl
