Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4CB45E98B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Nov 2021 09:44:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J0pFV6B9sz3bP7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Nov 2021 19:44:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::625;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0625.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::625])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J0pF1388gz2xD4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Nov 2021 19:43:47 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oBHcbcRdeTg3OZ4pDc6F4QxpbTD9A7CFm2gneTNyxrhXLUqCdyhWl3nQOn27o3IVR/t/S2U/tH28ctVlvoqn6f6oKVHd2vctsksWg2mnjo8/iiwX6k48u0Vnff5pMxTWgPl18OhiA/LFvmx55OAEHWXVfPCKVXVQVCjCnzFn2eGKHQV4FpZ1tnNK74V9Vk3SqscFaq4GZty+TTJwrRNHg/UYqZxQRmvRe1iIzrmUQ7txH2ZFPHhkfMijQf8ZqWnWyiL03YJ3CO9gRsVjr2K6SzsfI3/rAKCadwg7+m0PN0If+5UsWyJZ1YGgABnqUEHs0TfIOqzrnyhP0+eCSou8qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KdFP+Cw9UvOtKJ7ctPBGky9Tv3zksh+GhWSnRBubOrI=;
 b=DyZLg/MvEjlgECbyeIMxMuEiYXnxpu9s0eeo7QcvWY/JN9vVUc5gm3ulMlHM+X3tfWiG16Hm+om3dPvkLaNeYjhz+dceokor/N5dUtiFAdf0+s+8gQ4OxUF4f89G7gVWQ1XKzOX1covfG6K12XTpD4qqtnYRVhZXdCX27XvffFlhZxSF1xNaijcgJd8EzRdob0YGEKvaxrYO0HhecOcdOwDPCWhTtpCVyZ7VC7Mc8ZJmyCEsoJqXMcrGbs6AbZdpFolXPEzQkzkZP3JudUfRCKCIvpTzaCXpa933Aaq85oxS/VG79aZC4DLIIB+jJJgY5ltm0N9uOERHW2NAnoHqdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR2P264MB0196.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.20; Fri, 26 Nov
 2021 08:43:23 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f%2]) with mapi id 15.20.4734.022; Fri, 26 Nov 2021
 08:43:23 +0000
From: LEROY Christophe <christophe.leroy@csgroup.eu>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH] recordmcount: Support empty section from recent binutils
Thread-Topic: [PATCH] recordmcount: Support empty section from recent binutils
Thread-Index: AQHX4UGxSaNKZM4HWEO/NeipaXxcJ6wVgNIA
Date: Fri, 26 Nov 2021 08:43:23 +0000
Message-ID: <efc0e15e-fc93-fb59-068d-602f96ec7431@csgroup.eu>
References: <cd0f6bdfdf1ee096fb2c07e7b38940921b8e9118.1637764848.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cd0f6bdfdf1ee096fb2c07e7b38940921b8e9118.1637764848.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c78fbfd6-45ea-4e4c-c6cf-08d9b0b8cea8
x-ms-traffictypediagnostic: MR2P264MB0196:
x-microsoft-antispam-prvs: <MR2P264MB019687280124E2B0907D27ABED639@MR2P264MB0196.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wMZB1ys5W3HZoEpYxgmyBj3DonI6p9yxmIlFCWjOiorygx6Nuq0zYAYB16QwRhLQwVKGpK0Hh0munx/JJtS/9AUj3x2k9p/uZ4JSGIZgjj/4DRz2vhVXLu+KWnUPjIDZK2KewqP4RirEmxKrZtQkpzmR/XZHc+4rWYJrq8Tvbgr77/Cp8nRneB5XIMOIC2CVMlHwFjkm1685GLxQOanFN6OBm9KrZAkloi2h559jDjfn7vP8n+zfCfdDHuDTv7AGn4fJct7p0kN6zxjk1Y+Ohekg5BQGqiAkv79E/Oi3K02SKZOGM7HWBoNqZOzpS0SOAEYXt8VAw9qe4T+Its94Rwulam0yiZ6+xG5U816k+bKeNecSOkjNsJFql7Yh+/EHqEUCNGKXlYAYuyGVZ5GMq5mjMOad7w2HGIyLWQS3q4BdpzhCdvgz0izB3VqYN1aPsigGy3Sy79/Io8i7d8eUDF10QiRUEW/M7Ak46rf2fzljzW+a2xc+Nkj2htxyftt5vjsVjeDYoIin6afM+WBd0ZZ4IVypNJO3MKukyEeuOwA6z5vRLLGPe35Lh+Nv8J895BctDO51x+ydGsNX5RrTWy5uLULhyq7UKyq07dQH831YcGnxZeIkNztxKt9rhe7WktTilKqn2TYgNjNWYjeA1+nF1za40mqx+0ImdbxuopiYvFtBGfdZF1xYoJxro2GBRclweIkcEbc+UuqGx6TJroHMFY45r8aN2YgsnLusSqPkOgsMjtFIRfov18y3ragZxVIto1ppA/lIrY1A66cJo0y9oZHpkjrTiDGFQiJULK1/YYJhaUR0tUZxat3A5lkq2unquHxnFncKdJ2gN6LKuO+cqBebxTS8FkdBdxqUBe4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(31696002)(66476007)(64756008)(38100700002)(66946007)(66446008)(966005)(66556008)(122000001)(38070700005)(66574015)(4326008)(2616005)(508600001)(2906002)(86362001)(36756003)(83380400001)(31686004)(6512007)(8936002)(5660300002)(6486002)(186003)(8676002)(6506007)(54906003)(26005)(316002)(71200400001)(76116006)(91956017)(6916009)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YmVRUVQ5OC9aamhURTQxZzlUTWxSVzM0MTMzZWs3V1c2Y0FXcHA1TGZ6dnVV?=
 =?utf-8?B?aWF0SnRmeGdYbk1EbmUza2RyaDNCM2tCenhQWS9VOG9kcDlmNE1icFZNVWw0?=
 =?utf-8?B?R3d0Rk9KZW1oM2xsS2NaVE9zNml0eHIzMVBhWWRMMXZjMkJwVzN5STJqR1gz?=
 =?utf-8?B?T2ZpQnhhajJlL29Oc1ppOVhyUENvOXUwNDRSb3hmOXRZc0xrakEvTWk1WDJv?=
 =?utf-8?B?R3dKN1VRUWVNOUJmY3VOQlZoazRSdlBOYnBmc3NJdjNBN2JxSi96MFZ4V210?=
 =?utf-8?B?amNDVjUzTjZ4SkJGOGJKMUpISWNRUHdxOU02Skl5aXhjMzhlcHVReloxd1gx?=
 =?utf-8?B?c0FGc05CeVk0eDR6VTZqcnUwVGNFUk1ONnVvbmNCQit0U1R4MUw5WThxTDRD?=
 =?utf-8?B?cWRXVm9FZHNrNDZtN0dKRnlpQUVxMG1BK3VjT1dnUEI2RmFWVGFFQUFLcjd3?=
 =?utf-8?B?Y25wV1ZVZ2gyVW5TckZLSlBWQUNUZXhBS0kwOE43N2NRY2VXM0VLSVNhL1hl?=
 =?utf-8?B?R2NiZ1BtblczT212cC9vWTNMZDh6T3Z5K1QwZU9ibk9GQ21yWlZESlh6NkQ2?=
 =?utf-8?B?WDE4aGZ1NHpkY0xiOHlTM1lIZjNwUGFHdTFjRHZKYUN6MTdnY0NzeTBFS0tJ?=
 =?utf-8?B?OTlaMFA3cGVrS01lT2djQXRMU0FMdVNROGZYRTRwK1dCYlZBOXBSVkJzUFVD?=
 =?utf-8?B?cUF4S2VEcGZnKytXSVB3bkM5UE1kSGU2WGdWVWFtTXljZWJUV2NzSDJWRkNx?=
 =?utf-8?B?aWFIaTR0elRMaHprdWJmU3RjQk1pYkxkaWZHdnNieWp3Qzl5OVNWVEk1ak8w?=
 =?utf-8?B?a1Y2K2lZdWNEdzk5bWYrd08zdmdzWE9VVmJIYnFiei9oOWF0clpDcGZqL0th?=
 =?utf-8?B?WlNCQVJEVDBPYkdadTZmNTZpNHZScUVzSU5wc0M3MFlHU1JrTTliYXFTM1Ry?=
 =?utf-8?B?L3pZd28xUjFYNmFyeW9XY0gyQVMxd0FkdUxJeFBqQ3NiWjRwNVdxZ1RTbnc5?=
 =?utf-8?B?TWhUUzNhd01yRjlRM25EZ1IrcXl1QldneEZITWN0WXVqRmtrWTRjOWxVN1dw?=
 =?utf-8?B?WjgzaFdva0Nqa0ZScUF4Ny9CdWZYUWlMZ0RoSUZPdG9nTzZEOWlvZ3JVUmZw?=
 =?utf-8?B?bEZkdk5uN0dmbTJPQ2tmaGlNeDVuRGdMZUFNRkFnZUhGVFJXc3YxZlZJWFEz?=
 =?utf-8?B?SlVLZzN0bzNlK0hUOC8vOUtYdVh6VUxBdThyQzV2ZnNhR0JhSGkrTjVmZUc1?=
 =?utf-8?B?Zk4xb1A2VlhSQzV2SVA0aTFPMFlnRTZqaDJoTkFYWm03cDl2cjlyeCtMdTkw?=
 =?utf-8?B?ajZxYmFRdUJqWGpFTnBUdmZDNjFnZ0hhQk04dHc3bVBLVkJsZGptSnpmUS9y?=
 =?utf-8?B?ZE83NkYrZ0FyeFJEeldhQVloU2hYVkt2aVoyeW5Cam9wVGNjTlZlVFZiV1g2?=
 =?utf-8?B?US9Xa0xwUXd1eEJ6MTIyaWVqRzE2UFhXSkJpNEtqbHVyMlRaYVRSWXA0Zld4?=
 =?utf-8?B?eXF2VVN6b3FGVzdScUNYd3VkU1FCL0tnM1lFeFowVXM5TnhvTVIvN1NDRi93?=
 =?utf-8?B?NXNIcjcxVC9pMFRrWk9FditRRWVrMjVMVjg4NEF2b0ZuM2Z4NTIzbStqckdv?=
 =?utf-8?B?dkRKVkx2ZWxQTFlvQUg5Skp5bEFPU2RqNXU3VFlUMzJQSDBBWkVoSjJRbktu?=
 =?utf-8?B?RG9oNzEvL2l0akthb0pMQURkb1dQZjE4YnVpV2dXRWVTZTdRV3FyK28vdzJh?=
 =?utf-8?B?ZEZHT1lnVEQ1MStiQktjU0ROS0s5ZFhKeU1DanZWSGlYYmhBYy9PVlk5eUM0?=
 =?utf-8?B?R05XWVpJd0ljY1IvSEFhR1pDcm9uQUxJL2dFNkhaSnJ5NXJYY054eVZMKzVv?=
 =?utf-8?B?a3d3M2c3MGdrdm8wV3F6Q1FnSkd5bmdvcTJDSTV0K2RIRUhmc0lVdHBlWmlI?=
 =?utf-8?B?anlMbXRiS3d2cTZoZnFKdGJxdlRacTJHc3RoQmh2bVFKbnlBcXF0MGxlakRs?=
 =?utf-8?B?SDg5dUkwZTNielZyQ2xHV1U1NnluUytmeWFJMlhjVEZwTHVnYW1jSmQrVkRq?=
 =?utf-8?B?d2VVM2d4dm9TeUdKbklmM2RPRlhFSXA4Q0h6Q3RFRXNYU252UFdaM0d4eENE?=
 =?utf-8?B?dk1hTDFUbC9wYVcvTFpKdFljYkRvTEJlOUx6RGJVMGVDS1ZEWkNzZ00yTUxS?=
 =?utf-8?B?QzhoSkpQMFZ0L092R0piVXZoTnNPbmRHdzhEMUs1SWJoRDJDYnlabUdEZGtN?=
 =?utf-8?Q?Tgqk65NYSHkNvbh0TH7dwsAMR45MxFEWM0dvuPS7w8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E87456B7BC43A6498F04220FB3463FC3@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c78fbfd6-45ea-4e4c-c6cf-08d9b0b8cea8
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2021 08:43:23.6298 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GZS3cQ3BHsbyTazjYM4++0iNqmvuGfqcJNAPZ/sDBeY8fIScSLrmbGrIslK75b6g2QgvWR0I1xRRj9nd1O/27q5HtoW107GsiaOZNtgJZxA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR2P264MB0196
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
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI0LzExLzIwMjEgw6AgMTU6NDMsIENocmlzdG9waGUgTGVyb3kgYSDDqWNyaXTCoDoN
Cj4gTG9va3MgbGlrZSByZWNlbnQgYmludXRpbHMgKDIuMzYgYW5kIG92ZXIgPykgbWF5IGVtcHR5
IHNvbWUgc2VjdGlvbiwNCj4gbGVhZGluZyB0byBmYWlsdXJlIGxpa2U6DQo+IA0KPiAJQ2Fubm90
IGZpbmQgc3ltYm9sIGZvciBzZWN0aW9uIDExOiAudGV4dC51bmxpa2VseS4NCj4gCWtlcm5lbC9r
ZXhlY19maWxlLm86IGZhaWxlZA0KPiAJbWFrZVsxXTogKioqIFtzY3JpcHRzL01ha2VmaWxlLmJ1
aWxkOjI4Nzoga2VybmVsL2tleGVjX2ZpbGUub10gRXJyb3IgMQ0KPiANCj4gSW4gb3JkZXIgdG8g
YXZvaWQgdGhhdCwgZW5zdXJlIHRoYXQgdGhlIHNlY3Rpb24gaGFzIGEgY29udGVudCBiZWZvcmUN
Cj4gcmV0dXJuaW5nIGl0J3MgbmFtZSBpbiBoYXNfcmVsX21jb3VudCgpLg0KDQpUaGlzIHBhdGNo
IGRvZXNuJ3Qgd29yaywgb24gUFBDMzIgSSBnZXQgdGhlIGZvbGxvd2luZyBtZXNzYWdlIHdpdGgg
dGhpcyANCnBhdGNoIGFwcGxpZWQ6DQoNClsgICAgMC4wMDAwMDBdIGZ0cmFjZTogTm8gZnVuY3Rp
b25zIHRvIGJlIHRyYWNlZD8NCg0KV2l0aG91dCB0aGUgcGF0Y2ggSSBnZXQ6DQoNClsgICAgMC4w
MDAwMDBdIGZ0cmFjZTogYWxsb2NhdGluZyAyMjM4MSBlbnRyaWVzIGluIDY2IHBhZ2VzDQpbICAg
IDAuMDAwMDAwXSBmdHJhY2U6IGFsbG9jYXRlZCA2NiBwYWdlcyB3aXRoIDIgZ3JvdXBzDQoNCkNo
cmlzdG9waGUNCg0KPiANCj4gU3VnZ2VzdGVkLWJ5OiBTdGV2ZW4gUm9zdGVkdCA8cm9zdGVkdEBn
b29kbWlzLm9yZz4NCj4gTGluazogaHR0cHM6Ly9naXRodWIuY29tL2xpbnV4cHBjL2lzc3Vlcy9p
c3N1ZXMvMzg4DQo+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIxMDIxNTE2
MjIwOS41ZTJhNDc1YkBnYW5kYWxmLmxvY2FsLmhvbWUvDQo+IFNpZ25lZC1vZmYtYnk6IENocmlz
dG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4NCj4gLS0tDQo+ICAgc2Ny
aXB0cy9yZWNvcmRtY291bnQuaCB8IDIgKysNCj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvc2NyaXB0cy9yZWNvcmRtY291bnQuaCBiL3Njcmlw
dHMvcmVjb3JkbWNvdW50LmgNCj4gaW5kZXggMWU5YmFhNWM0ZmM2Li5jYzY2MDBiNzI5YWUgMTAw
NjQ0DQo+IC0tLSBhL3NjcmlwdHMvcmVjb3JkbWNvdW50LmgNCj4gKysrIGIvc2NyaXB0cy9yZWNv
cmRtY291bnQuaA0KPiBAQCAtNTc1LDYgKzU3NSw4IEBAIHN0YXRpYyBjaGFyIGNvbnN0ICpoYXNf
cmVsX21jb3VudChFbGZfU2hkciBjb25zdCAqY29uc3QgcmVsaGRyLA0KPiAgIAkJCQkgIGNoYXIg
Y29uc3QgKmNvbnN0IHNoc3RydGFiLA0KPiAgIAkJCQkgIGNoYXIgY29uc3QgKmNvbnN0IGZuYW1l
KQ0KPiAgIHsNCj4gKwlpZiAoIXNoZHIwLT5zaF9zaXplKQ0KPiArCQlyZXR1cm4gTlVMTDsNCj4g
ICAJaWYgKHcocmVsaGRyLT5zaF90eXBlKSAhPSBTSFRfUkVMICYmIHcocmVsaGRyLT5zaF90eXBl
KSAhPSBTSFRfUkVMQSkNCj4gICAJCXJldHVybiBOVUxMOw0KPiAgIAlyZXR1cm4gX19oYXNfcmVs
X21jb3VudChyZWxoZHIsIHNoZHIwLCBzaHN0cnRhYiwgZm5hbWUpOw0KPiA=
