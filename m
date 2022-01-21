Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C7149622C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 16:35:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JgNjp66Yfz30hR
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jan 2022 02:35:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::631;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0631.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::631])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JgNjK4XyWz2xWc
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jan 2022 02:34:44 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OjmQA2j+o8z9g1aRRwZopSFYseWdPnGVllMz0AaPTWvRlZoK0arxDnUitX2LyTszG1ds90wmqZgb+YUXyQesMmfiU2nwmYKxnSkIy/xECELZFAUw6EV1qdxbMXFByLk4ZGDTOKq7LesK0xEjMMfNzaM293+w1M7pagcMxnE7sdTzRosLtk8NnpVIi4JKo3rYTvZ5vMNQ3zV10mjMxNRzAIakh/R8qAx7HN/ehi8LmuPcNvbahpcKkJM5StEYU6bM/CGra1vJR8w2lY0ppI037C2MFNkcKg+uTI9npvCB/K5rnC4dVC8aUNrW5SJWBGI5rRWevFYd/kRdCffxzKxcqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5VqWpl4XZdVEpFqOUc+3FRghcFHjzSdZ73Vz/iAQ9/w=;
 b=ZQ7uCE+uUuyNly7ClqbtXuBAbtmuzD5tF25BuvdE0kAl5N/H4bHbwlveftjqWxGu2MwCglUpAVg11pESoiypVfDp05WOnofGD4itYfi8PmV3gJHlxor1pwlL5d60T2ptJPY6r772jdEMKOhy2DBxd2gBexqsqkD352gBotFqAYNO0YWBO0O46l8hMQZTJU06xvnbSkSgLkDkuhNY1Sp0FSHk5W7NcqzxJntshbPPPQYAO+MwZyGyuL3Ay9Z2gWYrMcOqCj7APYFT4kGKdXmDre1Q6Nd8QCVSH4U4ZzJ2Yu0DWczIDMke5+f0kktZU+TWF+aIZp8IHXUTBcbRSERkSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB3244.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:30::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Fri, 21 Jan
 2022 15:34:24 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5%5]) with mapi id 15.20.4909.008; Fri, 21 Jan 2022
 15:34:24 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v3] powerpc: Add missing SPDX license identifiers
Thread-Topic: [PATCH v3] powerpc: Add missing SPDX license identifiers
Thread-Index: AQHYDraAMVY9CjZ7JE+Gvd6Tqz9gGqxtiuEAgAAKrYCAAAGBAIAABD8A
Date: Fri, 21 Jan 2022 15:34:24 +0000
Message-ID: <7d551fc7-0b71-dd34-c489-43bf9e337efb@csgroup.eu>
References: <d2c52284244d6dcb3472d2041abe43b456d116df.1642762977.git.christophe.leroy@csgroup.eu>
 <YerEuE6XlslE3Goo@kroah.com>
 <24829c2f-6855-c8d6-7ae4-17c5517f890d@csgroup.eu>
 <YerO8MjbXlvbMEsZ@kroah.com>
In-Reply-To: <YerO8MjbXlvbMEsZ@kroah.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9c6e6c71-779a-4f0d-9a48-08d9dcf380dd
x-ms-traffictypediagnostic: MRZP264MB3244:EE_
x-microsoft-antispam-prvs: <MRZP264MB32447936D26635ED7A8799D8ED5B9@MRZP264MB3244.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XEXb4Cp7WvXQPvg7rYqKEGjRx3i6I9wyYc0KUEUJ0qVRz9ZxLVOgaiQj1ZDiaHhWpBtNHc16riuNyIIZz3RUXKPC316CLLH+7L98T23uBBdVZetty4X4U9PPq05U6tXmz0O2sJb/4pJWHTHUV8u5TjhrJhoLv76AFcTX60dsMJe3vJHq7WzRWTlc0MFnj//cZyISZmHbse9PgOcvi7XftrQjAfhVfLXWU8+qHRzg5nvzQtbyOsMxf1uADSLvgEG4xqYV1W4BXardaT4EDnGTBy2peMAN6q6JonB55p8phq/WtjLulIb+1PuYstUE1U/5DJ52ea7RXKWEJCD+YWnrt99dzVkcxyxudUODtKtwc/O1/79nIuBGSZVakvaKlaX4uyoIHp3vsth5q2dUCNxwWnG0c/O9bQ/7XH2kkzlXnZclKJma2sR60oc7GcUSUNgqTq2jk14o+KOwf4L8k4PHpFBO8TX+fgVvgvo4QM9VE1fho8SSC3JA/xgJGo/CfIxX5afP7bD98E3XyUVKBBPChrYD+6FpiJ0u61cHkl4H0B60gzfYCAWLQnX6OYURMK8iHQwOJE40ggjxoRhuisEbW3im+fCzm7kv3ym1vx6nyMzUUCw1tiTF9DZgKltJNgJE/Fq625S46vea896AW+8mQv6QIhFK/tEiFxGqWDUG/sqM7izXLxgyNzUztU1CY1AvYb6UzsgIFgFUq45DYLMbTy7HxG2yyZRjyna9GRk6RxAE64m2NdOzRoO5qJDbs/KTd3VEVXXRsIIE2datpqVqHeLD7swlt7ybF9Cu+/lxfVk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(31686004)(36756003)(2616005)(54906003)(6506007)(316002)(66476007)(64756008)(66556008)(71200400001)(508600001)(4326008)(66446008)(2906002)(5660300002)(6916009)(31696002)(38100700002)(122000001)(76116006)(91956017)(38070700005)(86362001)(8936002)(6486002)(44832011)(8676002)(26005)(66946007)(186003)(6512007)(2004002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c2FVbzJacXlFT21vTU5KaTlMb3BsN3FQenEzdTZ4T3kyWHJKODBHQlQxSXZ2?=
 =?utf-8?B?c0lobzF6eVRDRHhzcGU1YWF0T1d4L0xQcUlkTFV0NVltTE1OYmtVU1VCWHhM?=
 =?utf-8?B?T2ZMOGdHUmNsVFZDWENFdnFJUzNLZXJKOENnTjBhL0tSVk1SRDFPWXR2S2hm?=
 =?utf-8?B?U0pjZkowQkovWTFHMnBpTU13d0Yrb0plMjAyYUU4c0xqcHkrSGh2Rk9yb0R0?=
 =?utf-8?B?alVKZ1FDMUVveThjVXliQWNtSXp3c1VCRlYzVG1LSlZzTjl6VzJkYTd1K284?=
 =?utf-8?B?ZkgzcGk2b0R5RWR1UWRLNkE4dWtWMmVScHZZSEIwdS83RnVxWmNQRzRJY2p0?=
 =?utf-8?B?dmE4RUlzTmsxc0FOeXlDeWozM2tMY0ZCaEZuZktLcFNLN1JHajdoVEtObU94?=
 =?utf-8?B?UTh0MnFrQms5QTduQ0NHZVI3WXREaVpQZ3hkREFmcEdsMDV5R2dZZUN0dGhW?=
 =?utf-8?B?Q2dSY3hmczdCVW51cXVvbVJyYnBDSDZoNVFmOEVuNkFvNWtCSFVYaDdPeEtC?=
 =?utf-8?B?aXZsajd2VHpxZDZoeUdULytRWGJEcnJJKzF1SExFVkdTQUtIZ05NemQ4a3lW?=
 =?utf-8?B?K0taVmRnMmJmNDAxMGpqZElYQWp4NENZMDA0Lzg3bzl1L1d5Ykh2ZHlBQTdj?=
 =?utf-8?B?Q1AwMW5CWXl6MEtxNkFjS1VJOWFycThkek9tWE13bDlKVWVoYkdjblFLbWd6?=
 =?utf-8?B?WWFWek9iNjBhT3dQUUZEZWFGQzlxRzZ5S0E4TzJTaVN4UHhabmZBem1aMllJ?=
 =?utf-8?B?SS9qNkNQb2NEQmRPTm1QR1huNk9jNmM0UTQveFQ4QmFqZGFXRnBubGNYSDJq?=
 =?utf-8?B?eG1wbEpTNFJOZDh3MWdPQW1mRzRkYTNkUmk3TDVEKzIvWG1EQWdiSUppTWhr?=
 =?utf-8?B?QWx6S3U2YTMvZVVYdUFJdjU0UXhBcHE3MHA5dmJodTVHRXZvU3ZwYXEwOEZz?=
 =?utf-8?B?UnJoOWlxTzZwRjJjLzU4djNLOHpzMXFKQ3N3YjN6NGJtS0JHSkVhTWtlQWlk?=
 =?utf-8?B?NmQyR25pZ0FMSzc0TklvN1hTV3p1a1c3QVM0UUhZS2g5eUV5ZGNhN05lNGFQ?=
 =?utf-8?B?cWVvS241VDk0M0orcHZRQW93YnBWQitsSjZvclhLWnlKYlJCcU1meE4vN2k0?=
 =?utf-8?B?aFZuNU1hNjliNVNWR2d5TktTQlJkSXcyN0J0a3FWa2JBN2p0bHM1bmlaMk1x?=
 =?utf-8?B?cjQ5bDMrVC9HYitVOXNuSjh4dWFjYUo5aGtOKzBRTVBYZUpJOGFCaDlrdG9y?=
 =?utf-8?B?eWdZWU5OdjZoZnFKclZRYnZOUmNtNWdFdFg5QWVNU2p2QVkrNi9XNitod2R0?=
 =?utf-8?B?OVRrdHVGQzdhY1hiS045S0ptekFtOTlhbjloQnZOaWZYNzhDem9ocXBKM3Y0?=
 =?utf-8?B?ZERLMEFKanlNTVFTNEVoS2d4Q2d5TFZFU1k0WjdOdXl1aFJzczQrK29KYk1j?=
 =?utf-8?B?QXRwYWd1ZkphQ2kwV2d2aXU1Rk93cGZmSXBCanhXOXROTTc3ZGFKZkpYODIr?=
 =?utf-8?B?QTNIM25ZdFNWczk5Y2FzTEk3akZFNXhaeHNVaDBNMnZrOHRiS09lMEJQTFlu?=
 =?utf-8?B?MC9xaFIxRzVGd3NXZ2ZTVndtQnd4RURFTnp5TEFLb1N1ZFU0UjlBeE5rbGUx?=
 =?utf-8?B?U1JGejFqdzhtdEV4ZzlFMFlHcnovaG5GQzFyVHdCcnR4Q3BTMzZwZnpxeUVa?=
 =?utf-8?B?YjFFN0VLK08yaDhsR2ZhQjVEU25iVFI0UkMzVVJZZmw2bW1IeFpjQ0ZZV3Qr?=
 =?utf-8?B?UTRZKzU4WGNYMEdTUTl6bGVOTEc0SEszYjRYQk84UEtEajlaSG5qMHVabUY3?=
 =?utf-8?B?bXdpOGN2K3l4R2Q2bEZ3NTN5a2gvdU5xa1dNdXB1L0R4eUZxSFNLQ2YvN3Vs?=
 =?utf-8?B?bS9naFlCVmNSaDJ4QzR4eDlia0FNVmJ1WDJ5RmFpSXh1RW03NFJZSjZsVlQx?=
 =?utf-8?B?bFJWZU5sbys0bG9sUjhRZlR6K0hRSU9xcEdhenNac1JLMVNMWXhQZGcrS1NV?=
 =?utf-8?B?SGdBMUxmQ1hJT3pvS3gzb3VkSFRrcm0rOU1OcmN3dXBWV0hONFNKbmNHYzRm?=
 =?utf-8?B?emNuK0djK3pjYlJLb1dqNjBjVWFyenUvRWJNQk05WUprdjdwU2htUHBGTnp3?=
 =?utf-8?B?SitkYUpzdG9qaUpxbkd4Y0NHTUZxUm1nRmhYNTJVRlRNWnIxdGZmaVpYUXBu?=
 =?utf-8?B?eDhkazVIejZGU0MzcnRLeVRBaGdDSURTQjRCZEtIS1FVYm5TcEVidXBpVUNn?=
 =?utf-8?Q?Gmr1r1RomBUzzrp3xHM+ityw5h8VMezI2ZZ6548+n8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D4CCC1D5FE955040A49D5F22282245E5@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c6e6c71-779a-4f0d-9a48-08d9dcf380dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2022 15:34:24.6024 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lsrs9aitOWfGO1P5yVqnoZEhE09939MOTWMpm73i13P/rU9quIaTKyuuQENFjhaPPz7t5YutMCZHRPpjpLn907wfvxdUjJ1DWSJydKV9hc0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB3244
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>,
 "linux-spdx@vger.kernel.org" <linux-spdx@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDIxLzAxLzIwMjIgw6AgMTY6MTksIEdyZWcgS3JvYWgtSGFydG1hbiBhIMOpY3JpdMKg
Og0KPiBPbiBGcmksIEphbiAyMSwgMjAyMiBhdCAwMzoxMzo1MFBNICswMDAwLCBDaHJpc3RvcGhl
IExlcm95IHdyb3RlOg0KPj4NCj4+DQo+PiBMZSAyMS8wMS8yMDIyIMOgIDE1OjM1LCBHcmVnIEty
b2FoLUhhcnRtYW4gYSDDqWNyaXTCoDoNCg0KLi4uDQoNCj4+Pj4gQEAgLTIwLDE2ICsxNiw2IEBA
DQo+Pj4+ICAgICAqIHJlc3BlY3RzOyBmb3IgZXhhbXBsZSwgdGhleSBjb3ZlciBtb2RpZmljYXRp
b24gb2YgdGhlIGZpbGUsIGFuZA0KPj4+PiAgICAgKiBkaXN0cmlidXRpb24gd2hlbiBub3QgbGlu
a2VkIGludG8gYW5vdGhlciBwcm9ncmFtLikNCj4+Pj4gICAgICoNCj4+Pj4gLSAqIFRoaXMgZmls
ZSBpcyBkaXN0cmlidXRlZCBpbiB0aGUgaG9wZSB0aGF0IGl0IHdpbGwgYmUgdXNlZnVsLCBidXQN
Cj4+Pj4gLSAqIFdJVEhPVVQgQU5ZIFdBUlJBTlRZOyB3aXRob3V0IGV2ZW4gdGhlIGltcGxpZWQg
d2FycmFudHkgb2YNCj4+Pj4gLSAqIE1FUkNIQU5UQUJJTElUWSBvciBGSVRORVNTIEZPUiBBIFBB
UlRJQ1VMQVIgUFVSUE9TRS4gIFNlZSB0aGUgR05VDQo+Pj4+IC0gKiBHZW5lcmFsIFB1YmxpYyBM
aWNlbnNlIGZvciBtb3JlIGRldGFpbHMuDQo+Pj4+IC0gKg0KPj4+PiAtICogWW91IHNob3VsZCBo
YXZlIHJlY2VpdmVkIGEgY29weSBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UNCj4+
Pj4gLSAqIGFsb25nIHdpdGggdGhpcyBwcm9ncmFtOyBzZWUgdGhlIGZpbGUgQ09QWUlORy4gIElm
IG5vdCwgd3JpdGUgdG8NCj4+Pj4gLSAqIHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb24sIDUx
IEZyYW5rbGluIFN0cmVldCwgRmlmdGggRmxvb3IsDQo+Pj4+IC0gKiBCb3N0b24sIE1BIDAyMTEw
LTEzMDEsIFVTQS4NCj4+Pj4gLSAqDQo+Pj4+ICAgICAqICAgIEFzIGEgc3BlY2lhbCBleGNlcHRp
b24sIGlmIHlvdSBsaW5rIHRoaXMgbGlicmFyeSB3aXRoIGZpbGVzDQo+Pj4+ICAgICAqICAgIGNv
bXBpbGVkIHdpdGggR0NDIHRvIHByb2R1Y2UgYW4gZXhlY3V0YWJsZSwgdGhpcyBkb2VzIG5vdCBj
YXVzZQ0KPj4+PiAgICAgKiAgICB0aGUgcmVzdWx0aW5nIGV4ZWN1dGFibGUgdG8gYmUgY292ZXJl
ZCBieSB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UuDQo+Pj4NCj4+PiBMb29rIGF0IHRo
YXQgInNwZWNpYWwgZXhjZXB0aW9uIiwgd2h5IGFyZSB5b3UgaWdub3JpbmcgaXQgaGVyZT8gIFlv
dQ0KPj4+IGNhbid0IGRvIHRoYXQgOigNCj4+DQo+PiBJJ20gbm90IGlnbm9yaW5nIGl0LCB0aGF0
J3MgdGhlIHJlYXNvbiB3aHkgSSBsZWZ0IGl0Lg0KPiANCj4gWW91IGlnbm9yZSB0aGF0IHBhcnQg
b2YgdGhlIGxpY2Vuc2UgaW4gdGhlIFNQRFggbGluZSwgd2h5Pw0KPiANCj4+IElzbid0IGl0IHRo
ZSBjb3JyZWN0IHdheSB0byBkbyA/IEhvdyBzaG91bGQgaXQgYmUgZG9uZSA/DQo+IA0KPiBZb3Ug
bmVlZCB0byBwcm9wZXJseSBkZXNjcmliZSB0aGlzIGluIHRoZSBTUERYIGxpbmUuICBZb3UgZGlk
IG5vdCBkbyBzbw0KPiBoZXJlLCB3aGljaCBtZWFucyB0aGF0IGFueSB0b29sIGp1c3QgbG9va2lu
ZyBhdCB0aGUgU1BEWCBsaW5lIHdvdWxkIGdldA0KPiB0aGlzIGxpY2Vuc2Ugd3JvbmcuDQoNCkhv
dyBkbyB5b3UgZGVzY3JpYmUgc3VjaCBhbiBleGNlcHRpb24gb24gdGhlIFNQRFggbGluZSB0aGVu
ID8NCg0KWW91IGFkZCAiIFdJVEggR0NDLWV4Y2VwdGlvbi0yLjAiIHRvIHRoZSBTUERYIGxpbmUg
PyBBbSBJIHVuZGVyc3RhbmRpbmcgDQpjb3JyZWN0bHkgPw0KDQoNClRoYW5rcw0KQ2hyaXN0b3Bo
ZQ==
