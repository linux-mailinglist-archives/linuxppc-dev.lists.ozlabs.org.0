Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5822752CBEA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 May 2022 08:28:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L3g0b1xRtz3bc3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 May 2022 16:28:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::626;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0626.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::626])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L3g052Nylz3036
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 May 2022 16:28:03 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LjjClBHSshh0fEVNhD4DQ4bq+VMmCR+eWpi4o1QMzQpeUaIsts2BzVXXaDVLsrx6Oqy0ZRTVjSfROANDry17zK2dgj/6oK0ItooMZHKEpI7jU5ykuvaz1Kv8Chof/kBLfCIKtzAG8IE+u/IIVjeW34QWLOw3B3U05s81OThlgU/sqhWGSzOfKtKVLOBszrXLpbJkUGLHHATdr4rnixo/+GNhgNeJSdk1nFk0xgwGfdnSFbsFftbNr4X4JFO8su+KuUYDcxFg2A+ksYe/9rGmjm4eiwYfaUlt0WS77Wu1Nv0TQ+iYWvgmUpxmPGh3Akk0Uhv5EM3ZbNxxgNGp0wO7ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V11mrIqErcxe7VNmavv7PkDYTkaOsfPODxH4P8fXIfo=;
 b=XNMAizL4cGigp+KmerkvnM5CwvgOzSLM/rvdeH4O4kHKBoe39odDDXYjGkLDKkHSEjDJZy82WM3dt0AtBgk6tx7kUr+jOoSsdQLQLumObaaEU2p+AiSScPT5GZOJCvWQXl2K+2AqNVvtzwO8PC+c+QpgVoxLC8ey34d0nKnbt/3uSkcAZx+ISc560EG/aIiucUw6T4p0/f0hwZke3+N80GR2OoXHIeVnbu3spwfD5ScA5TE3poTimdFQdOCFyKDPfTyO0fu5DzIBUPEqHNwZr2PQ1qYStf48oISfmpfBaveb3IHkXUZxu/P8kkcp5EJZaU7y2b3qPPvzR7/De5qfNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2066.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:14::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.16; Thu, 19 May
 2022 06:27:40 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::ad4e:c157:e9ac:385d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::ad4e:c157:e9ac:385d%8]) with mapi id 15.20.5273.016; Thu, 19 May 2022
 06:27:40 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v1 3/4] powerpc/code-patching: Use jump_label for testing
 freed initmem
Thread-Topic: [PATCH v1 3/4] powerpc/code-patching: Use jump_label for testing
 freed initmem
Thread-Index: AQHYPgMwHgTsUX6bOEK/qxeqwB6tM60l0QsAgABGAgA=
Date: Thu, 19 May 2022 06:27:40 +0000
Message-ID: <ab09a24a-acca-a5a8-2e3f-cfa3c704cb65@csgroup.eu>
References: <cover.1647962456.git.christophe.leroy@csgroup.eu>
 <0aee964721cab7316cffde21a2ca223cee14d373.1647962456.git.christophe.leroy@csgroup.eu>
 <20220519021706.GA3526833@roeck-us.net>
In-Reply-To: <20220519021706.GA3526833@roeck-us.net>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 54fdff4d-e81d-499b-e1f7-08da3960acf3
x-ms-traffictypediagnostic: MR1P264MB2066:EE_
x-microsoft-antispam-prvs: <MR1P264MB206681AEC12ABDFD4E405081EDD09@MR1P264MB2066.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XHoOK6rfHBP+2iER+BpjmK4WKSEICImpbCK30ba8C7CFAx32i3l55T052Km293OE8UceO48M9dwjLDRyZVUEiGpkxsIl0U9prnL2Juw7WiZZLlI23wA9X+Rj8H3+sP31B6IteWEuL6WGWbG4Jp8EuaelzB59JkZoFEImkIPIkUEdpLaITzM7QfRUUauDS8o2UKTrwCQgbdOXaafAhQreVFFl7i58/EyvpVj3AVXhwLZId4i1OM4Ib98rWYzNFBjk0ECdQwX30KcgBMcmYtxudRTf7Xkw7OSvc76bgnC8Z4a/aGxqtfuFaluE48Y5K4mifwZ/6GqoiNu0xz4P0+y/HGP8lJ//sjBAZdQDygShZz5FOKMTddR5JKo/5qD8vNMA3DZD5sUQO3gmKK9xrEzaE7KaclmWh7VLrODqkxQGZmOg0YYNU4vL+QVvobd4lR5KTJEXAKkLWI6msAlVVJjYlqs2LYkEMsLrq9ty1ufdFjnZuyQoAFrejiukE3HgzaJ5PpgUyPBl8CI3VsZMY6GfyduM3iMpEgyALEKKAafoVOSCx1hkkpwx9dw/S5CtpE6XiZcoZZTeBMpXBzpHrUSCwEVQp2/kk7Gx4vkAu7JR++E3MDbTOqV8QvxWP8YkBIuc3xdeWsBBy2b2raxg5Zh5V3enGImd7iksYqVbZSpjwenEy0jtp4mxfR+/lHazzuNC4evy2vhxNGhCRf478xW/aveLtXU6OGyDdkfAPzepiBxoahQ547yU5OJuQgbaAXMlXKqevT0CRGBvI6FZD3u5cg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6916009)(66556008)(66476007)(66446008)(64756008)(76116006)(66946007)(316002)(8676002)(91956017)(38070700005)(44832011)(122000001)(2906002)(86362001)(38100700002)(4326008)(5660300002)(31696002)(8936002)(54906003)(186003)(45080400002)(31686004)(2616005)(508600001)(66574015)(6512007)(6506007)(26005)(6486002)(83380400001)(71200400001)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YytQRkQ4Yy9SOTRCcU4yMkc0bW5DdnR1a0JpbTlnNGVMV3UxMjdhZ1Y4K3pu?=
 =?utf-8?B?K2JEK0svMFExOFk4ek1nL2N5eUd1Rkk0cC9vZGZhNVd5Sks3NDQ0MUhaL3Nt?=
 =?utf-8?B?TFBsMkUrWkx6OHYrbFVOUlluR1QxalNRTDVYZ2k4VXZkeVRsZDVxenk5TWU0?=
 =?utf-8?B?UlNSKzJDVDdaVldZd2tMV0dFVWhrMVF3OTNrMU9UYjFvV2Y3aGtGZXlsbUZs?=
 =?utf-8?B?QU0ya0FOMDlZOTMzdXcvNGlEK1RZb01tOWpKRDg5K09GYmZ4dGcwZjBUaGdK?=
 =?utf-8?B?TlUzbUtGVFJWd2NuaVlLamY3YnBuOG9weXpNeElocWd0WktJS0JnWjdTUlVp?=
 =?utf-8?B?TjM5VEZKRlJvRFhnMGJsK3ZvRzVhVW93UEoyTk9GWE9wTVBKVEZCOUZ1RHhv?=
 =?utf-8?B?ZW5aZFloZW5Td2hlWVRPVlB6dUtYc1Q3eHUzK0tobGM4TTNnc0ZXZEc0bG5a?=
 =?utf-8?B?MjdocVVjM1ZUZlN0VkVBb1RwWmxKM0ZLZUJUd0pOcktsYitnS2lOSkxnSWRB?=
 =?utf-8?B?Y1FBMVBFVzhqcWJHMllHbnZ6YzRSeWFBL3huUGRrY3A0bkFoQ0tzRk5lQW1D?=
 =?utf-8?B?d3I0NzM0MU1hY1lLc1NuN3BRMzcwdTMzWHFEeEpDL0JHV3k3K1B1S0NIUnF0?=
 =?utf-8?B?cTV5ZVpoeGNMM2lQUG55WkhlU3Y1NzRrU3ZJakkzUlZrRkdjNjV5YkQ4cWl4?=
 =?utf-8?B?Q3dwV2lsU3NLNzhxOEdEZWx0eXBPalM3OUhsSG1nVXNUVW9UODBxNE8zNCts?=
 =?utf-8?B?ejFwRWk4b3N6cVlEL1Z3N3hDTHBiMFIrM2VJakNpVlZ1UUxFYzByRjhKRmpr?=
 =?utf-8?B?bXFzOEJEdnBhYUZ0dFREMVBxV3N6MkN2d2daUjFkZ3FIbHVTSlVaUHU3NTdE?=
 =?utf-8?B?NkxOTjRqcm1wUGdaRkZiMlpGc3lwazRQdnBpNjZPcFF3OGpQVGFRL1Y2eisy?=
 =?utf-8?B?Y3kzRFowVUlzU1Z1M3RZYlE1c0t4QStvNGRvUDlBYXJCd0ZVQmVLRjZUTnVp?=
 =?utf-8?B?MTJxRHRXcEFoa0VhRVplL2hvam9MZnhCa1RCOS8ycTF5MjJRNW9hWTNEUkdT?=
 =?utf-8?B?b0owdkRoMThaKzlueFpkUkV6L2dmenZMb2xRSmZqUzREZXo0azdZSVV4NVJm?=
 =?utf-8?B?UGlyVEEyNG8rWVd2MjF6UnBVaytxL3lzRWRSdkQrV0h1dWU3ZmgveDFvcWVJ?=
 =?utf-8?B?cGFBT1c5QkR6R1BjRWd1NUNRTklvSEN3Mkx5MnI2UVpVRkxPL001OEMyR0xo?=
 =?utf-8?B?WVV2dTI2RjVTNm55aUlZT29RYU5RMXRCQmFyWVBQZHlhYzN1UW9kZGd5UUpM?=
 =?utf-8?B?U2pBWS81S05ycnRGd2JqaXdSZXgwVFdZMnZkRlM0RnpuaHhVcFBaTUthWS8z?=
 =?utf-8?B?R0xodGtwUnd2NHNDZkFTajhVRGtlWkhJSVQ3b040TzlpNFpwOS9EeUttaUJy?=
 =?utf-8?B?dHlaNmlEUEhRaDNhTEs0UTRpaWhKWjNNdHFqZGtmVVRoZElDaExkTVE5MEJ0?=
 =?utf-8?B?SGN6QklyMHE2dkt5KytCZUFGTDBIUWUvMXdvckJycDEwYnBxUVUyT2VvNk9I?=
 =?utf-8?B?ZGluYlArSGY5Z0U5dUg1ZWlROVIyVFFMYmlhdHUvN2REdFBhV2VRNnk5ZlFD?=
 =?utf-8?B?MFVwRWVkSmdSQm5SK3NPQVhleDNYckhHUHZJZGFvaFBTSSt4aGk4dUlCbzhD?=
 =?utf-8?B?dTBXSXJSNVlIODdtVjVQQ1kvT293T1BPeUtoYjRvS2NsbnE1YW5LSkhIOXI0?=
 =?utf-8?B?VXFlMGJFWHJ2NXkzcDRGb2ppMzBKeFkvK0xGYTdHUDlPUzJrUFFzaTRaNXUw?=
 =?utf-8?B?VDh4Y0xPUFdSc2s1dko2K20zZjNQQ3J3aUdZVURrQUdlYjBWMy8xVTh1WFVH?=
 =?utf-8?B?cnJUZWdBT1NxYTRsRG5zc0V1M0VTa2dEcVgyT1M3aVg4eFdRSUZYUEVURWo3?=
 =?utf-8?B?MjVDcUsrZ1ZSUDJESVBoZHlSRitTVkRESnRKMnRzeVpISUhKWjVZd2ZvWHJ5?=
 =?utf-8?B?R2pGTmpFVGdzUlAwRWRQbE5HYXV3N0V6bXhneGltVXRpYjdhcDVQcUZrT1Qz?=
 =?utf-8?B?aFB6aHlId0hUZFZGMnI2dDhhT21Ed3pXK0NmcExzQ0hKUEo4TFZRK2VmZ0Jy?=
 =?utf-8?B?eFEwaUhmZ1ZOdUQwU0s2UW41U1lleHZZVk5tWFZNNmR4QXIrS3prK1NKejYx?=
 =?utf-8?B?dGRCNFZWZXUraTh5ZTZHcVhxTzkwN2ZLM09PMTk1NTh1Z3VLNXRSNWt5Y2lC?=
 =?utf-8?B?d2RWdllQQUdkdEYvZDJqTXdNQmZSbzFacUlvS01MOWUrN3RUQTJJWCt3NjFO?=
 =?utf-8?B?MUJzdmJwYzR6dC9iaVlGcmVpSVNaYllTNTRqcDRmVkF6RldYd0xSR0dIWVRk?=
 =?utf-8?Q?660dMas6R4N6d23tamjYfvEjlqFbXIl8KQxBR?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <260FB6812993804CA0603FEEF669191C@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 54fdff4d-e81d-499b-e1f7-08da3960acf3
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2022 06:27:40.7029 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RIUIySpr6Lq51a9LTWJZW5TfCStCQ0vmR52JxyO1V1yLlQmf4ESvEXnaIX0+kZfHMm0zaojKIccXTt8yJuSYrirJne3g0CtvL/i/WQ44FHU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2066
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
 Paul Mackerras <paulus@samba.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE5LzA1LzIwMjIgw6AgMDQ6MTcsIEd1ZW50ZXIgUm9lY2sgYSDDqWNyaXTCoDoNCj4g
T24gVHVlLCBNYXIgMjIsIDIwMjIgYXQgMDQ6NDA6MjBQTSArMDEwMCwgQ2hyaXN0b3BoZSBMZXJv
eSB3cm90ZToNCj4+IE9uY2UgaW5pdCBpcyBkb25lLCBpbml0bWVtIGlzIGZyZWVkIGZvcmV2ZXIg
c28gbm8gbmVlZCB0bw0KPj4gdGVzdCBzeXN0ZW1fc3RhdGUgYXQgZXZlcnkgY2FsbCB0byBwYXRj
aF9pbnN0cnVjdGlvbigpLg0KPj4NCj4+IFVzZSBqdW1wX2xhYmVsLg0KPj4NCj4+IFRoaXMgcmVk
dWNlcyBieSAyJSB0aGUgdGltZSBuZWVkZWQgdG8gYWN0aXZhdGUgZnRyYWNlIG9uIGFuIDh4eC4N
Cj4+DQo+IA0KPiBJdCBhbHNvIGNhdXNlcyB0aGUgcWVtdSBtcGM4NTQ0ZHMgZW11bGF0aW9uIHRv
IGNyYXNoLg0KPiANCj4gQlVHOiBVbmFibGUgdG8gaGFuZGxlIGtlcm5lbCBkYXRhIGFjY2VzcyBv
biB3cml0ZSBhdCAweGMxMjJlYjM0DQo+IEZhdWx0aW5nIGluc3RydWN0aW9uIGFkZHJlc3M6IDB4
YzAwMWI1ODANCj4gT29wczogS2VybmVsIGFjY2VzcyBvZiBiYWQgYXJlYSwgc2lnOiAxMSBbIzFd
DQo+IEJFIFBBR0VfU0laRT00SyBNUEM4NTQ0IERTDQo+IE1vZHVsZXMgbGlua2VkIGluOg0KPiBD
UFU6IDAgUElEOiAxIENvbW06IHN3YXBwZXIgTm90IHRhaW50ZWQgNS4xOC4wLXJjNy1uZXh0LTIw
MjIwNTE4ICMxDQo+IE5JUDogIGMwMDFiNTgwIExSOiBjMDAxYjU2MCBDVFI6IDAwMDAwMDAzDQo+
IFJFR1M6IGM1MTA3ZGQwIFRSQVA6IDAzMDAgICBOb3QgdGFpbnRlZCAgKDUuMTguMC1yYzctbmV4
dC0yMDIyMDUxOCkNCj4gTVNSOiAgMDAwMDkwMDAgPEVFLE1FPiAgQ1I6IDI0MDAwODgyICBYRVI6
IDAwMDAwMDAwDQo+IERFQVI6IGMxMjJlYjM0IEVTUjogMDA4MDAwMDANCj4gR1BSMDA6IGMwMDFi
NTYwIGM1MTA3ZWMwIGM1MTIwMDIwIDEwMDAwMDAwIDAwMDAwMDAwIDAwMDAwMDc4IDBjMDAwMDAw
IGNmZmZmZmZmDQo+IEdQUjA4OiBjMDAxZTllYyAwMDAwMDAwMSAwMDAwMDAwNyAwMDAwMDAwMCA0
NDAwMDg4MiAwMDAwMDAwMCBjMDAwNTE3OCAwMDAwMDAwMA0KPiBHUFIxNjogMDAwMDAwMDAgMDAw
MDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAw
MDANCj4gR1BSMjQ6IDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAwMDAw
IDAwMDAwMDAwIDAwMDAwMDAwIGMxMjMwMDAwDQo+IE5JUCBbYzAwMWI1ODBdIGZyZWVfaW5pdG1l
bSsweDQ4LzB4YTgNCj4gTFIgW2MwMDFiNTYwXSBmcmVlX2luaXRtZW0rMHgyOC8weGE4DQo+IENh
bGwgVHJhY2U6DQo+IFtjNTEwN2VjMF0gW2MwMDFiNTYwXSBmcmVlX2luaXRtZW0rMHgyOC8weGE4
ICh1bnJlbGlhYmxlKQ0KPiBbYzUxMDdlZTBdIFtjMDAwNTFiMF0ga2VybmVsX2luaXQrMHgzOC8w
eDE1MA0KPiBbYzUxMDdmMDBdIFtjMDAxNjI2Y10gcmV0X2Zyb21fa2VybmVsX3RocmVhZCsweDVj
LzB4NjQNCj4gSW5zdHJ1Y3Rpb24gZHVtcDoNCj4gM2ZlMGMxMjMgOTEyYTAwZGMgOTAwMTAwMjQg
NDgwMDA2NjUgM2QyMGMyMTggODkyOWZhNjUgMmMwOTAwMDAgNDE4MjAwNTgNCj4gODEzZmViMzQg
MmMwOTAwMDAgNDA4MjAwM2MgMzkyMDAwMDEgPDkxM2ZlYjM0PiA4MDAxMDAyNCAzY2MwYzExNCA4
M2UxMDAxYw0KPiANCj4gUmV2ZXJ0aW5nIHRoaXMgcGF0Y2ggZml4ZXMgdGhlIHByb2JsZW0uDQo+
IA0KDQpUaGF0J3Mgc3RyYW5nZS4NCg0KSSB3YXMgYWJsZSB0byByZXByb2R1Y2UgdGhlIHByb2Js
ZW0uDQoNClJlbW92aW5nIHRoZSBfX3JvX2FmdGVyX2luaXQgaW4gZnJvbnQgb2YgDQpERUZJTkVf
U1RBVElDX0tFWV9GQUxTRShpbml0X21lbV9pc19mcmVlKSBmaXhlcyB0aGUgcHJvYmxlbS4NCg0K
SSBjYW4ndCB1bmRlcnN0YW5kIHdoeSwgbWFya19yZWFkb25seSgpIGlzIGNhbGxlZCBhZnRlciBm
cmVlX2luaXRtZW0oKS4NCg0KQ2hyaXN0b3BoZQ==
