Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B1BD64732F3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Dec 2021 18:31:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JCT8L4fd1z3cY5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Dec 2021 04:31:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::613;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0613.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::613])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JCT7c5jvHz3bhd
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Dec 2021 04:31:07 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U+a3zDZ2l25aVD+dkGvRtMzgRzakOQdVkV3IuwYOgUi8BIgAAzmkaA3RZa3LDfE00HFcQ9cT7+WXeC/R/3YDm9zfbbV3DZZhIT0WGGa3BPBtfRz0iq17xBtJQMWukVhxDdk1exGtJ5p6A11sBTxcbLULGsx383Iyk05hiXgIXZ/wQCDQIcKcpgbW/Xx0ETZgCYGdBH7zmruKvJTNLectla4V1pV1my5YLelbCJY/Fa/JJLvJPVgXyzzE/tkB+t8WjOvRI0ZKoGk0ZT51uWa8CbOPB+L8LTI1Ooy7BbJW5A+L7oGdd0fS14wvixzO5rGVqdXdSQWvXOzOEDlKlOGR2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+shDhfzF2QWntHO/dNFBcQHGxBxnfSk7hhAuKCBYKkU=;
 b=I/M3FJwue1ViQttOA5Urb3fmvjvWMf/BlF7RnT2X0tRJmNFl3SJcsXsGBzGTZLEbSfM+69tuoa2g7SBSfSJ6vIE7LN3FB4mzG9MzFjDJdnPn6CA+woOL9XMLvqDkU/N2d7ri9euKXbEuQLex+lzsplr7qxEeti7LilEIpxsEzGE2LlpTjpE4EVXR3e+zaDa5bz6e16Ubh1BkzPkuMUljn/LPS8b0szQrwXFPShG+sSCoVZhOc3VSA3K/t3xuS6wkdgyzjHmxzzQFYdKFmnNJPxYNC4xaIJ7ltkKq1/AS//9VdTEDSCVtq8Qh03RURdK+tZwPXbWKrD/28v4oVeJ14A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB1650.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12; Mon, 13 Dec
 2021 17:30:48 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f%2]) with mapi id 15.20.4778.017; Mon, 13 Dec 2021
 17:30:48 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v1 0/5] Implement livepatch on PPC32
Thread-Topic: [PATCH v1 0/5] Implement livepatch on PPC32
Thread-Index: AQHXy/a61L5ufkyTwk+E9T1IN+85JqvoaYCAgEhc+YCAACuvAIAABD6A
Date: Mon, 13 Dec 2021 17:30:48 +0000
Message-ID: <5511f43c-192a-622b-7c72-52e07f0032c2@csgroup.eu>
References: <cover.1635423081.git.christophe.leroy@csgroup.eu>
 <20211028093547.48c69dfe@gandalf.local.home>
 <6209682d-0caa-b779-8763-376a984d8ed8@csgroup.eu>
 <20211213121536.25e5488d@gandalf.local.home>
In-Reply-To: <20211213121536.25e5488d@gandalf.local.home>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2a826193-96f1-4ee7-f1e7-08d9be5e4d63
x-ms-traffictypediagnostic: MR1P264MB1650:EE_
x-microsoft-antispam-prvs: <MR1P264MB1650F44566B979B721A48A48ED749@MR1P264MB1650.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qZrshcX8pDgaHwKcvrPOsIjQeOjTV/0dn4wSmVoBeneaOWxOFwOjYnk6GZMpWec2+KCjMy/mLY3z4X0813whMRM8Ywta3iP/S38cTruOT6RH94GinvVK6F5X2kUtwpQt72zyMYvP1b941OJHIKWz99GAz02Wjt9j7ohgqKkGOoKJ6KMagQje+5uHvJ/BI8sAc6l/isegmw0qVItpESUqcsmapQLY9fP/V8T/A9v0kb728D3bTabkKFjvYOz/b1xHiZi7GvznlX4fsVPMut62Z420fCuKZtgBzaE8gmBtQ+69ONEZGTiiP43zfNoiJ06AMJUzys9JmsgEyTWuGZjvONmVKAwoiOoWRBd1GKIYn8GGwIo4/EKRgV1NtCONBhLSaXAHM1W/XE46roBCYNhaNeat2wsWZv2o5h6Lztz17X10VtHTwQMSQ3HtM9jKjXBYn8RNPhozsRxuMLOFqY7Q47LeI0VxJ48Pv2p/92B9KHFPPUeq8d9mQv+nuUyt4bvlbaxbgDQ/lNum9bW/5wZ5HffFQp/aLFsCCDJGeY1v+t8Nv4NoOYYKgxdgxd+CVqd0ZKZ+Zz0yZOkVcMEnJx+kyJs2AvlXd6Ijr3uKJj0Y36OKeOAYSW1oUB58jUaDT5l5e0ol6vmp6Ihv+BWitkSYRZKS4s+3WaNGc3iFVTSR27i5qYoYjL/hguA8wgy9OhSrk7r19Zsd9zYc93bslWEkP3D39YOPPgT8V9l/6x8YtOMbdiIgn1kBqGTlPKYaoUmXV3Hwu4Nnaul4T2Y/VeW7nA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(26005)(31696002)(6916009)(83380400001)(66476007)(6506007)(7416002)(86362001)(2906002)(66556008)(31686004)(36756003)(38100700002)(186003)(122000001)(508600001)(6512007)(8676002)(8936002)(316002)(64756008)(54906003)(66446008)(38070700005)(66574015)(6486002)(5660300002)(91956017)(4326008)(76116006)(66946007)(44832011)(71200400001)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TUp0akRsZldXNE1Cb0laYmxTa2J4YTBDT01xRG56empuMWl6anhyTUExaW9J?=
 =?utf-8?B?N3RBUGI2TUZDd05BeVU2M0lzUmtBSGxtYUxkWkpQSzVKMXV5TCtxUHhOcWxx?=
 =?utf-8?B?V29MUEZsc2xDQ3kwUml3WWdDUThWQlNtTVZwZVF0MHFDV3ovTW5tV3F5VFlw?=
 =?utf-8?B?aFE4TjUvNlc3RmhSL08ybFBsVUp1YTNkZjZ4aW1iQmxnRm45SzduUG56aUIw?=
 =?utf-8?B?VDNaU1NZYk4rb1RoMmdqTWtwWDFNaC9Yd0E0WEJDbXBNTVF1NzRnMGZMRUJG?=
 =?utf-8?B?WU84QXZOZkk4bWxjY1VRMFpGblNSVEkxUC9POERTcExGd2E1YzdUR0gxZ0tm?=
 =?utf-8?B?a3NQaWZaRUJqUlFJMG0zVUo4YVpDc3hRMEt6Yi9LNXJFY1YrRGl2VE5CaStF?=
 =?utf-8?B?djFoa1VRL1hEQ1dlWTVWWTFxQmQwN1B5aG4zeTdjRHdnMys5VUt6bWhtaDUy?=
 =?utf-8?B?UVFqK0hVY0dNY1FKWURJN1cwcWdxVEVmbzRjR3BDcGVsOXFBYmd2VFMyT1hB?=
 =?utf-8?B?Szg3TTBPbTZ4aC9uZGVkZUJOUit1dEhwUS9DcFZFbExoWW5wdGhCQWM2ZTkv?=
 =?utf-8?B?RWMxblFjZnUyNkU5ci93TmphNWRkY2tYbGRsK204WVhPYUVna0dSdU11a3F0?=
 =?utf-8?B?MjJ5T3h2MENndkhaNVZaU1c5OWYvNFhhZFhNK3gxRDVmcVZRdjZ6L1F0SC85?=
 =?utf-8?B?OTNZOG13SWZ6UWdOb0tlM0w3b1F0ejE1aThVbnN2RzFMTmJVZmJ5aTJSKzlh?=
 =?utf-8?B?UFpqc1ZZV1dPMzVtUHJmNldIZENmTzg2dndiS21mTUxWYTc4d0FlaFo1aE9X?=
 =?utf-8?B?Q3l4Zm9EL04wNjR2dmdNR2E5SzF1ejEzektZdzJzVmdzUnVCaEVubU1HQWVv?=
 =?utf-8?B?SE5uR1lWWTNiYkN3YVVhWEFLK1dveFFHNCthbk4xMlB3RXNIRGxtM2tmMGll?=
 =?utf-8?B?cFg5L1FVSW1zbTFSMnNZV1VUdmZkemNaT1RBTTE4Q1cxa01VZlF1cy9QRFBz?=
 =?utf-8?B?TEF2TVFMVE9RR09aV0Nzay8yNVRIVDJabE11L1hpZ1YyNHFaT1RiNDJGZThF?=
 =?utf-8?B?L1dZNk9WZTdDbzdscWx0b2ZRcGgxd2JyTkI1Q1NnV2o1ZFZlSnlWajFaVVBn?=
 =?utf-8?B?YXQvenZSdkEyaUhnWWlxc0JZMDVMdndrVzYrZnVYdVYvalR1dHJSalFoQitp?=
 =?utf-8?B?eDc2c2k5aGxPdFJScFVWdWRXZ2lld2UxOWJFNE5XaSsybXVaY0huTVZCWVlu?=
 =?utf-8?B?bkFOV1BLejNHYlBEZkF1Q04vYXpDR2xjK1V4VE01dXNwSHFId0FjWi9pU1k2?=
 =?utf-8?B?TFNMK3JINVM2Mm1OMVlCMmlXZ3VoMWRPcXE4K2NKU21Jc2RKTkdqbEViVFNY?=
 =?utf-8?B?TVJnbDY2alkvQ1ZvZTlHOXVGcUJoRG5uSEhMVVJYUzdZd2E2OUlzOGpGUHY5?=
 =?utf-8?B?eExQVTdqTTQycGdoQnh6ZDlGemxGZ2IxK2NObkkwS1grTGRoTlN5aHNVZmFU?=
 =?utf-8?B?eVRxVlRNK1NYcUEyWDloN1pzMVBoR0hBZ0FOOWNUSFM3bUZ5TWhRUW9TODNG?=
 =?utf-8?B?OGovR2hNQ091SVV5bEY0Y3FPSEFsN0hLd1BPTzZnT3BidHdwWGpVR3k0WU1j?=
 =?utf-8?B?aU1ralUwRXdSVlBLdzY0c2lvN2djZDJvOWNuWTBnVzd2cmlhbHFlQ1ZFd0Mv?=
 =?utf-8?B?TS9ucFJUVkx4dWR3TlNKUTIzRytVejNjV1FlVXJad3BZT09iVU9mYkZVcVgv?=
 =?utf-8?B?TjA1bGhaNGhxTGp3YjJJSUp5R1pUY1JzaUxZZFdXTnNHQitJZFV2cGdmQWV6?=
 =?utf-8?B?NGJ0ZUw1c0JHWXZKTCtQcld4N1gwT1lxcmZoeXFvZjF1QnVNbWFaYlp4eGVj?=
 =?utf-8?B?NUZSZUhsUVNNbU5CYkdoaWE5MjhhWWphekRrQUxRNXRvVk9aVXpXNklDcjlW?=
 =?utf-8?B?QklhWkVYYUIydVFBQ0RaY3QrY05nMzV2cGRsYWNpR1FqNWZnRUhWZVpZMmNZ?=
 =?utf-8?B?bUlXTUpOTG9xUURYQm5FdWtMV3JTYTZad2VDVnJ2Sm05L3h3RnJOS01tWG9Z?=
 =?utf-8?B?RlJPR09WNDBwU2ZVNWVjWlYvOXpWbTNVT0M0eW0zQUo5SDNvSU1qRkMwTXpJ?=
 =?utf-8?B?WmJ5dDI1RCtnWUZ4SEdTZVZwdm1PUWxWY2tiYTA1bmlSTGtJSklobFhIT3RU?=
 =?utf-8?B?QzE4MlY0VElGTUVwZTNYQkYyUXA1WG9lODlJTmMrVXRKZjZ4Z1B0Vml2ODZh?=
 =?utf-8?Q?KRpXoptsqT5vXUNMoRiBWMkql4qR/7L3LzqWKUcKCY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C3EF0FDADCCE6B43B5E2ED2EF30D1272@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a826193-96f1-4ee7-f1e7-08d9be5e4d63
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2021 17:30:48.3049 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /KdMWGkniWG47B7RNmPRkFNNix2zmDMm6xV4m8KCY88Jrjgcny1jh8HyoeHDGK2XSFHiGiy+PVoW5OlaSK9Ox0iFR7XuC2G06U0MDXbS7kg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1650
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
Cc: Petr Mladek <pmladek@suse.com>, Joe Lawrence <joe.lawrence@redhat.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 Jiri Kosina <jikos@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Josh Poimboeuf <jpoimboe@redhat.com>,
 "live-patching@vger.kernel.org" <live-patching@vger.kernel.org>,
 "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Miroslav Benes <mbenes@suse.cz>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDEzLzEyLzIwMjEgw6AgMTg6MTUsIFN0ZXZlbiBSb3N0ZWR0IGEgw6ljcml0wqA6DQo+
IE9uIE1vbiwgMTMgRGVjIDIwMjEgMTQ6Mzk6MTUgKzAwMDANCj4gQ2hyaXN0b3BoZSBMZXJveSA8
Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1PiB3cm90ZToNCj4gDQo+Pj4gTm90ZSwgeW91IGNh
biBpbXBsZW1lbnQgdGhpcyBmaXJzdCwgKEkgbG9va2VkIG92ZXIgdGhlIHBhdGNoZXMgYW5kIHRo
ZXkNCj4+PiBzZWVtIGZpbmUpIGFuZCB0aGVuIHVwZGF0ZSBib3RoIHBwYzY0IGFuZCBwcGMzMiB0
byBpbXBsZW1lbnQNCj4+PiBEWU5BTUlDX0ZUUkFDRV9XSVRIX0FSR1MuDQo+Pj4gICAgDQo+Pg0K
Pj4gSSB0cmllZCB0byBhY3RpdmF0ZSBEWU5BTUlDX0ZUUkFDRV9XSVRIX0FSR1Mgb24gUFBDMzIu
DQo+Pg0KPj4gSSBjb3BpZWQgaW50byBwb3dlcnBjIHRoZSBjaGFuZ2VzIGZyb20gNTc0MGE3Yzcx
YWI2ICgiczM5MC9mdHJhY2U6IGFkZA0KPj4gSEFWRV9EWU5BTUlDX0ZUUkFDRV9XSVRIX0FSR1Mg
c3VwcG9ydCIpDQo+Pg0KPj4gRnRyYWNlIHNlbGZ0ZXN0cyB0ZWxsICJUZXN0aW5nIHRyYWNlciBm
dW5jdGlvbl9ncmFwaDogRkFJTEVEISIuDQo+Pg0KPj4gSXMgdGhlcmUgYW55dGhpbmcgZWxzZSB0
byBkbyA/DQo+IA0KPiBZZXMuIEJlY2F1c2UgQlBGIGlzIG5vdyBob29raW5nIGludG8gdGhlIGZ1
bmN0aW9uIGNhbGxiYWNrcywgaXQgY2F1c2VzDQo+IGlzc3VlcyB3aXRoIGZ1bmN0aW9uIGdyYXBo
IHRyYWNlci4gU28gd2hhdCB3ZSBkaWQgd2FzIHRvIGhhdmUgZnVuY3Rpb24NCj4gZ3JhcGggdHJh
Y2luZyB0byBub3cgdXNlIHRoZSBmdW5jdGlvbiB0cmFjZXIgY2FsbGJhY2sgYXMgd2VsbCAodGhp
cyBhbGxvd3MNCj4gYm90aCB0aGUgQlBGIGRpcmVjdCB0cmFtcG9saW5lcyB0byB3b3JrIHdpdGgg
ZnVuY3Rpb24gZ3JhcGggdHJhY2VyKS4NCj4gDQo+IEFzIGl0IHJlcXVpcmVzIERZTkFNSUNfRlRS
QUNFX1dJVEhfQVJHUywgYW5kIHg4NiB3YXMgdGhlIG9ubHkgb25lIHRvDQo+IHN1cHBvcnQgdGhh
dCBmb3Igbm93LCBJIGRlY2lkZWQgdG8gbWFrZSBhbGwgdGhlIGFyY2hzIGNoYW5nZSBmdW5jdGlv
biBncmFwaA0KPiB0cmFjaW5nIHdoZW4gdGhleSBpbXBsZW1lbnQgRFlOQU1JQ19GVFJBQ0VfV0lU
SF9BUkdTIHRvby4gKEl0IGlzIGJlY29taW5nIGENCj4gcGFpbiB0byBoYXZlIHRvbyBtYW55IHZh
cmlhbnRzIG9mIGZ1bmN0aW9uIHRyYWNpbmcgYmV0d2VlbiB0aGUgYXJjaHMpLg0KPiANCj4gVGhl
IGNoYW5nZSB0aGF0IGRpZCB0aGlzIGZvciB4ODYgd2FzOg0KPiANCj4gMGMwNTkzYjQ1YzliNCAo
Ing4Ni9mdHJhY2U6IE1ha2UgZnVuY3Rpb24gZ3JhcGggdXNlIGZ0cmFjZSBkaXJlY3RseSIpDQo+
IA0KPiBUaGlzIGFjdHVhbGx5IHNpbXBsaWZpZXMgdGhlIGZ1bmN0aW9uIGdyYXBoIHRyYWNlciwg
YXMgeW91IG5vIGxvbmdlciBuZWVkDQo+IGl0J3Mgb3duIGVudHJ5IHRyYW1wb2xpbmUgKHN0aWxs
IG5lZWQgdGhlIHRyYW1wb2xpbmUgZm9yIHRoZSByZXR1cm4gb2YgdGhlDQo+IGZ1bmN0aW9uKS4N
Cj4gDQo+IFdoYXQgeW91IG5lZWQgdG8gZG8gaXM6DQo+IA0KPiBJbiB5b3VyIGFyY2gvKi9pbmNs
dWRlL2FzbS9mdHJhY2UuaCBhZGQ6DQo+IA0KPiBzdHJ1Y3QgZnRyYWNlX29wczsNCj4gDQo+ICNk
ZWZpbmUgZnRyYWNlX2dyYXBoX2Z1bmMgZnRyYWNlX2dyYXBoX2Z1bmMNCj4gdm9pZCBmdHJhY2Vf
Z3JhcGhfZnVuYyh1bnNpZ25lZCBsb25nIGlwLCB1bnNpZ25lZCBsb25nIHBhcmVudF9pcCwNCj4g
ICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZnRyYWNlX29wcyAqb3AsIHN0cnVjdCBmdHJh
Y2VfcmVncyAqZnJlZ3MpOw0KPiANCj4gDQo+IFdoZXJlIGZ0cmFjZV9ncmFwaF9mdW5jKCkgaXMg
bm93IHdoYXQgaXMgY2FsbGVkIGZvciB0aGUgZnVuY3Rpb24gZ3JhcGgNCj4gdHJhY2VyLCBkaXJl
Y3RseSBmcm9tIHRoZSBmdHJhY2UgY2FsbGJhY2tzIChubyBsb25nZXIgYSBzZWNvbmRhcnkNCj4g
dHJhbXBvbGluZSkuDQo+IA0KPiBEZWZpbmUgdGhlIGZ0cmFjZV9ncmFwaF9mdW5jKCkgdG8gYmUg
c29tZXRoaW5nIGxpa2U6DQo+IA0KPiB2b2lkIGZ0cmFjZV9ncmFwaF9mdW5jKHVuc2lnbmVkIGxv
bmcgaXAsIHVuc2lnbmVkIGxvbmcgcGFyZW50X2lwLA0KPiAgICAgICAgICAgICAgICAgICAgICAg
IHN0cnVjdCBmdHJhY2Vfb3BzICpvcCwgc3RydWN0IGZ0cmFjZV9yZWdzICpmcmVncykNCj4gew0K
PiAgICAgICAgIHN0cnVjdCBwdF9yZWdzICpyZWdzID0gJmZyZWdzLT5yZWdzOw0KPiAgICAgICAg
IHVuc2lnbmVkIGxvbmcgKnN0YWNrID0gKHVuc2lnbmVkIGxvbmcgKilrZXJuZWxfc3RhY2tfcG9p
bnRlcihyZWdzKTsNCj4gDQo+ICAgICAgICAgcHJlcGFyZV9mdHJhY2VfcmV0dXJuKGlwLCAodW5z
aWduZWQgbG9uZyAqKXN0YWNrLCAwKTsNCj4gfQ0KPiANCj4gVGhpcyBpcyBjYWxsZWQgYnkgdGhl
IGZ1bmN0aW9uIHRyYWNlciBjb2RlLiBCdXQgYmVjYXVzZSB3aXRoDQo+IERZTkFNSUNfRlRSQUNF
X1dJVEhfQVJHUywgd2UgaGF2ZSBhY2Nlc3MgdG8gdGhlIGFyZ3VtZW50IHJlZ2lzdGVyLCB3ZSBz
aG91bGQNCj4gYWxzbyBoYXZlIGFjY2VzcyB0byB0aGUgbGluayByZWdpc3RlciBhbmQgdGhlIHN0
YWNrLiBUaGVuIHlvdSBjYW4gdXNlIHRoYXQNCj4gdG8gbW9kaWZ5IHRoZSBzdGFjayBhbmQgb3Ig
bGluayByZWdpc3RlciB0byBqdW1wIHRvIHRoZSB0aGUgcmV0dXJuDQo+IHRyYW1wb2xpbmUuDQo+
IA0KPiBUaGlzIHNob3VsZCBhbGwgd29yayB3aXRoIHBvd2VycGMgKGJvdGggNjQgYW5kIDMyKSBi
dXQgaWYgaXQgZG9lcyBub3QsIGxldA0KPiBtZSBrbm93LiBJJ20gaGFwcHkgdG8gaGVscCBvdXQu
DQo+IA0KDQpUaGFua3MsIEkgd2lsbCB0cnkgdGhhdC4NCg0KSSBjYW4ndCBmaW5kIGZ0cmFjZV9n
cmFwaF9mdW5jKCkgaW4gczM5MC4gRG9lcyBpdCBtZWFuIHRoYXQgczM5MCBkb2Vzbid0IA0KaGF2
ZSBhIHdvcmtpbmcgZnVuY3Rpb24gdHJhY2VyIGFueW1vcmUgPw0KDQpJIHNlZSB5b3VyIGNvbW1p
dCAwYzA1OTNiNDVjOWI0ICgieDg2L2Z0cmFjZTogTWFrZSBmdW5jdGlvbiBncmFwaCB1c2UgDQpm
dHJhY2UgZGlyZWN0bHkiKSBpcyBkYXRlZCA4IE9jdCAyMDIxIHdoaWxlIDU3NDBhN2M3MWFiNiAo
InMzOTAvZnRyYWNlOiANCmFkZCBIQVZFX0RZTkFNSUNfRlRSQUNFX1dJVEhfQVJHUyBzdXBwb3J0
IikgaXMgNCBPY3QgMjAyMS4NCg0KQ2hyaXN0b3BoZQ==
