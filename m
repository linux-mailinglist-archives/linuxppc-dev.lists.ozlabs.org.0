Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C264DC1A8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Mar 2022 09:45:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KK11Y70nvz30K0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Mar 2022 19:45:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::619;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0619.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::619])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KK1145ldTz2xTq
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Mar 2022 19:44:55 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZMqyzN23mXefcz/jWV3toJXHgJ/prCu/MDcMDUpgROwz/jmt6D9RJZXYN/AUIqUBd1V3MhDL2Fo4Zc8hbcgjQuNkt8+ZlP7J7cME1/9F+YfelRW6lzj+zwSIE0AYtJ+X49n1xvokqrK0QJWSYUQfUPitfma4Sy/bsYvpzfWwXj6eRzjeoGSw5IDsSe1n3Iwe/ors2r/xEAcLPQLCksFg3Xmc1oFuZ3kbi1U4Vs9CG1Wm6/UbZUvRhqtXLU/93uvLY8fVAJIDwO9IeLPDLv1Meb6T95SA3oyHUG8wgdnKl35iYCeG+IZoxlMEFIPK0CgH7XTc0qmE53jRaLHsfTwvRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=00MoNrRCPLZJKGw86ANVTCZg1RGgi/7fCXHIhCl+pD0=;
 b=g8Ydv3v8Dr6qdMS68ycTGJ6D9cJaxA7olsPny2aW9Tm5FUfYAvOlx7ZQCjDzl+qKB7EThx3OimdZdZVQvdWHqxfTmMZ1bHmvbhU835z99Xo2Aj5Up4UqMjTpSPW2gFDjUeiIQZ3H4AB2iskW1rpZCJquo14Lueg3u3dBM/DMtd1a5j1j1bIEBqOb6Nq2xHaHjbz+czK+1L3s2xjYHAAy1SMTj9wOWPjetbV+PO+9tRG050F05HrWJSQQsJWMijLydHTnbwmqPmfltA480ckzC8w/V319npz95xBFRv1iKMjyMYCXkcQNItRX+Ji2QTkvXC2DLCzWPTw4zVhfyn06fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB1898.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:16f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17; Thu, 17 Mar
 2022 08:44:34 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::cd2f:d05d:9aa3:400d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::cd2f:d05d:9aa3:400d%6]) with mapi id 15.20.5081.017; Thu, 17 Mar 2022
 08:44:34 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Haowen Bai <baihaowen@meizu.com>, "benh@kernel.crashing.org"
 <benh@kernel.crashing.org>, "masahiroy@kernel.org" <masahiroy@kernel.org>,
 "adobriyan@gmail.com" <adobriyan@gmail.com>
Subject: Re: [PATCH] macintosh: via-cuda: Fix warning comparing pointer to 0
Thread-Topic: [PATCH] macintosh: via-cuda: Fix warning comparing pointer to 0
Thread-Index: AQHYOantEDPE51ge90O2ls+FnF/Gx6zDQx0A
Date: Thu, 17 Mar 2022 08:44:34 +0000
Message-ID: <e2cec39d-fce4-9181-63fb-fde90f1f9a86@csgroup.eu>
References: <1647484837-14352-1-git-send-email-baihaowen@meizu.com>
In-Reply-To: <1647484837-14352-1-git-send-email-baihaowen@meizu.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 22032bd9-512f-4aca-a795-08da07f25cb1
x-ms-traffictypediagnostic: PR0P264MB1898:EE_
x-microsoft-antispam-prvs: <PR0P264MB18987414E38965FC69687C81ED129@PR0P264MB1898.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NLgwE9rWVhdg0D4/Li9BOTpN2ArZWnCe9Jb46E9USkGtAZ6RKIlkVIUnkgIpn2Cz+aStdvwjNqr7rDPc1bxqBu8GdeD7SBUTHst66hm2K1goRq5stKqYee3ltehYxoyl68LZmwKoEBsir8opIElBXMDCbciUOJYyuOY689H1QGdNE19AGYwKxuaD/k/e5MZhRgu2d/TjYV8BcAXEsriPVpBvZv22vJOSsVzNYubTH1sF03vfuDEUdohf2N/UADS/te7ZBiNJ2xoMmomCHkPUXsXRDh8TL8/tVvUzfSDNziqlNsDYfT67ONqkvgdaH3EfCpTRztFBNLZ7n8ZMeOkdplQVlAXnQe5Me7zVnLyD/cqVd+EJazoTT85vstYfXlwWzI987BTwR9jwlX6SpeNkgrgik0eNqGi2SZuTxBajepqsYlsGZHTHgcolgDZNmbVaFS0ynSxKnEpM+PV/V1LzQ8Dph7R1foSo+KjJAHaFxWH9r4Fw+xVEb09lpbwwKmkMT05Puin5O9MCjfcDjzwllqSGHQklcsIWz0rv0eFiYQLYgtOZyMzmKHenvlpbS7KQeW6HhyOhtLvcwbik05vzPVQ++MOYVU3j8WA01mrW3gJuPK2pgR9JRf92+4dvLPK/I9C+fLv8/Pb9X1OBtUaW93dfbfeC8fhJCkmDDdpYvgnc4oECM8udSisM2JU8D2qo0FCmJ+5BPYf/JbqBKawWihS02GFIqn1v8G1YUT6QkbXzFBuD1+rh8xE2J1NKit4Z8vQ7yYdHR+J5mZf0fKNo8J4abnCOyQh0fPCMLxW4tVrC5j5zYAJbArBWLtA2obkfB7cbtfDy6mPH/zCDVDce+xFMrR6BQ2HmpZH6OQANw0k=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(122000001)(8676002)(64756008)(4326008)(38100700002)(6512007)(2616005)(6506007)(76116006)(66446008)(66476007)(66946007)(2906002)(71200400001)(66556008)(38070700005)(8936002)(508600001)(66574015)(44832011)(6486002)(966005)(31696002)(86362001)(5660300002)(316002)(186003)(83380400001)(26005)(110136005)(36756003)(54906003)(31686004)(91956017)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bDVKSjAyQVVlYkd2empIb2doNVBSamxPOUIzRWhFUldNYTI1ckwvOE92RWRM?=
 =?utf-8?B?RmV5eVBsMjZQRHBIcnpKVWplSmF2TU5GbDZJSmtMSEcyODlCL1ZXZ0ZFeW5u?=
 =?utf-8?B?aDh1cXhxUytua1FNdy9FOXF3K1FmSFAxWmxxZXo3U1VEQXA5V3RYZS9MQnk1?=
 =?utf-8?B?UFNhcHo0alZyVHVNZnVaQ0g4cnhaYnFjOGRZUTJLNFhIeUZtNlNpOWhxUWZr?=
 =?utf-8?B?NENvZjA1ZFhFSDZDUzVZVUNzSlp3MnVTTXVhcnhMbTRnVkcyV3dCcWpCV2NZ?=
 =?utf-8?B?SjhtbGtWbFFlUElCT2tydk1JaUsrN01SOEo1Mm9xcHZVcEF2WWpTUjIrN3o5?=
 =?utf-8?B?ZENHNmRxSElPbSt1eGh3em1GL1pFdVNlVGFzUytjWnMwSnY1VjZVRTUvQ2l5?=
 =?utf-8?B?Qmd1WDNwVVY0ZHNUbDBQaEFFNDZXakUxczFXMWwzUmtDa28zUXBZeStEaUZQ?=
 =?utf-8?B?cHNFQW96K1ZYRk1wYWRZL1YrWUF5RmpxQXlTM3A4N3dOdWdKRGJwQXV6Qklt?=
 =?utf-8?B?cmdWQVZqdllZQ1A2d01BMDk4VVppK0E3bjN5VGt6bTVVcVFOMXkxUXU4TjJh?=
 =?utf-8?B?dTRma04vS0dvYnJZQ0xQaW84dkhnZjE1czE1eGxuaDZlTG54VzcrQy85U1JD?=
 =?utf-8?B?V3NCKzEva1NleFdLU3BrTVp2SmlMMko1SlJ5aUhESU9PUWxMeXpSYks4ellP?=
 =?utf-8?B?dGhubHZCZC9hL1o0c1JqK2gvM0xFakpPSFVLMlprUWFpYklaVnl1ZHZzUFQ1?=
 =?utf-8?B?U2o0bnIvTkdnUmNPTWF2YkJJUlU0dzBLRWs1NG0xT3YrYlVnaHZSRFI5QU16?=
 =?utf-8?B?WWxxT0drNGNmODY0dW9NYkg2Q0dUN0gyNjlnUzdyNEdLLzFaSXlqMGIwZGhk?=
 =?utf-8?B?MUQzb0g3ZHFBOWUzVFZUVjRsd216Q3BuOUxDMlJFNjRveVpqMFdBZ1lOR3Fq?=
 =?utf-8?B?enYrTkE1N0d3dEpaV2xjOVFnWWFjREtVUVpibVU4N1R2bThiSkR6aytnT2VS?=
 =?utf-8?B?WUNqOHZhcWxUa3MwY0dYOHEySnRPQnQ1VUN3RXNxOXczUUZsakxibGhtYWth?=
 =?utf-8?B?RnpIZmJhWi83bjVTM3VwdzlGRlFBdnE4Z3pJSDJlQ2FkQW9FNFFnMmR6NU9L?=
 =?utf-8?B?VnpiOUxKMjlheldvMmJzMUF5dVpSZzluUFhzVGF2OWJ3K29RK1hBbHhxSUc3?=
 =?utf-8?B?NmVkOFlGZUNJRWowOFUrYTMxMjV6Tlo2ZWJ5RHE5NWpTYjFhSWYycm9qZ1J4?=
 =?utf-8?B?WmZ3QTlIcWdCMjgxZXpKc0J1dVJEYlp4Zy9LUENkWEk5dG9IeUZWUGt3U005?=
 =?utf-8?B?YU9uNVBGZjdQdk5qUFBiS1ZLYXEwUzNsV0dUK3d2NUFFZlRlV3BHeVdERDcr?=
 =?utf-8?B?Z3JnK2dOMUN3NkpnWGdVdzF2NE4ybUlYbFVPTU1RTE92RHdQTzd3NnJIVnNl?=
 =?utf-8?B?eEV1ZW5sYlprb0xORUR3R3JWMDVYNFU3WjFpWHB1bGFrUXYreE96WGpuTUlY?=
 =?utf-8?B?VjRKV3JWNVJqd2ltbVpRb0ZwcXZRUnRFcys0TFVYeVJra1Q3VS9yM3hOWmxK?=
 =?utf-8?B?Vjl2MXl4RzJnZGY3TTE5RlE5aGFKNkoxM3ptOG9KTnFSSVB5UzkzSW5uSUZC?=
 =?utf-8?B?b200L2RNeUkvYWdJaExTZGptYWoyNWNhQy9aY0dIQ3FtWXdySjhQSGZNVXcy?=
 =?utf-8?B?ZmNjTDVuemV4UU8xS2hzS1RHek5Da1NyZ0tJQkd5QzhYZUt6Q1Y2UmZwUUNp?=
 =?utf-8?B?Sm90NFFsalA1c1dGZ2MzMGZseGw2aXp6bzBGRnl5Nmt2VlJua0t4RGs0dHJJ?=
 =?utf-8?B?bUJOZENKTVlvckJNUmxBQnZ4dFBSdEsrSEZjemFVTGhNZlNZaURiZlZIT2Ux?=
 =?utf-8?B?WmRNQktLdnFHdVRaRnJWVTgvRW5XcEV0RWx4V1phQnJkVFVybjdtUDN2alhE?=
 =?utf-8?B?NUQwbi9Bem5LTjNmczlMR1NPcWlzNDU5dU03NTc4OXJxZnRhRzZzTVVrT2Fz?=
 =?utf-8?Q?lPwQY0zUkD3rT0VWQ4xcESqWjW9lH0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <31C6EE7F3C766740BFC81D5F50CC8D2F@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 22032bd9-512f-4aca-a795-08da07f25cb1
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2022 08:44:34.4192 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MPyLClmn9MewGXeBUZxvJTo13k9EkvUuqXAFPnHTzRj5Yojp892Nj4ypz6YbaEDDVR1ZRGf80Nwx1Be/Lrtos6yZaztfS6qnLKyNyMh7HKI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB1898
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SGksDQoNCkxlIDE3LzAzLzIwMjIgw6AgMDM6NDAsIEhhb3dlbiBCYWkgYSDDqWNyaXTCoDoNCj4g
QXZvaWQgcG9pbnRlciB0eXBlIHZhbHVlIGNvbXBhcmVkIHdpdGggMCB0byBtYWtlIGNvZGUgY2xl
YXIuDQoNCldlIGFscmVhZHkgaGF2ZSB0aGlzIGNoYW5nZSB3YWl0aW5nIGluIHRoZSBxdWV1ZSwg
c2VlIA0KaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2xpbnV4cHBjLWRldi9w
YXRjaC8yMDIyMDIxNDAxMDU1OC4xMzAyMDEtMS15YW5nLmxlZUBsaW51eC5hbGliYWJhLmNvbS8N
Cg0KVGhhbmtzDQpDaHJpc3RvcGhlDQoNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEhhb3dlbiBCYWkg
PGJhaWhhb3dlbkBtZWl6dS5jb20+DQo+IC0tLQ0KPiAgIGRyaXZlcnMvbWFjaW50b3NoL3ZpYS1j
dWRhLmMgfCA2ICsrKy0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMg
ZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tYWNpbnRvc2gvdmlhLWN1
ZGEuYyBiL2RyaXZlcnMvbWFjaW50b3NoL3ZpYS1jdWRhLmMNCj4gaW5kZXggY2QyNjczOTIuLjA1
YTNjZDkgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvbWFjaW50b3NoL3ZpYS1jdWRhLmMNCj4gKysr
IGIvZHJpdmVycy9tYWNpbnRvc2gvdmlhLWN1ZGEuYw0KPiBAQCAtMjM2LDEwICsyMzYsMTAgQEAg
aW50IF9faW5pdCBmaW5kX3ZpYV9jdWRhKHZvaWQpDQo+ICAgICAgIGNvbnN0IHUzMiAqcmVnOw0K
PiAgICAgICBpbnQgZXJyOw0KPiAgIA0KPiAtICAgIGlmICh2aWFzICE9IDApDQo+ICsgICAgaWYg
KHZpYXMpDQo+ICAgCXJldHVybiAxOw0KPiAgICAgICB2aWFzID0gb2ZfZmluZF9ub2RlX2J5X25h
bWUoTlVMTCwgInZpYS1jdWRhIik7DQo+IC0gICAgaWYgKHZpYXMgPT0gMCkNCj4gKyAgICBpZiAo
IXZpYXMpDQo+ICAgCXJldHVybiAwOw0KPiAgIA0KPiAgICAgICByZWcgPSBvZl9nZXRfcHJvcGVy
dHkodmlhcywgInJlZyIsIE5VTEwpOw0KPiBAQCAtNTE3LDcgKzUxNyw3IEBAIGN1ZGFfd3JpdGUo
c3RydWN0IGFkYl9yZXF1ZXN0ICpyZXEpDQo+ICAgICAgIHJlcS0+cmVwbHlfbGVuID0gMDsNCj4g
ICANCj4gICAgICAgc3Bpbl9sb2NrX2lycXNhdmUoJmN1ZGFfbG9jaywgZmxhZ3MpOw0KPiAtICAg
IGlmIChjdXJyZW50X3JlcSAhPSAwKSB7DQo+ICsgICAgaWYgKGN1cnJlbnRfcmVxKSB7DQo+ICAg
CWxhc3RfcmVxLT5uZXh0ID0gcmVxOw0KPiAgIAlsYXN0X3JlcSA9IHJlcTsNCj4gICAgICAgfSBl
bHNlIHs=
