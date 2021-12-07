Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 793B746B4E3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Dec 2021 08:56:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J7XgT2my7z3c98
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Dec 2021 18:56:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::631;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0631.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::631])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J7Xfw5WdQz2xBq
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Dec 2021 18:56:06 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I4bE8Xsgxg1t1R3heN7U58zb5Hw7TIa+zjPjSzLNfDHCP8koCJt3V1T1NTTNbUh6fCSFjTzQlpLXQ+kZJ4KAtJhYKU04FiYHmjpGtgObGhlJXhmOINtmHxeDLgb7OYEVGZY2NhnYFBEfvqqShPevxOZpZojwin7zye+4I139vuAZWcFHPAAWCcJXGm+JAOZttb+U3lY0fEetQEsMx/MgC4e7M8YcwTTjDEzuseUeLzd7/oquA8eYTFKQIwrRS5EufukcLlG1YkXqGA1lz5hch8e04u3rZjBk5zR7mH2aczrcVVHogLpeAiLpnFzJPOCUYx1Y5EK5E9htuKDxtkQWHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MkYb8Fj+D1sr9JE4YFJWsIy8LlkbeqYbYKlOcSTR5t8=;
 b=A3v6U4pjqL1s30WbggRpc36jQfl/yhAGQAnBSEVYzUMS2juX0NwIvmDfTsTNdsRK5iiFLXJZq1u2FTpfAaDflAMMw5spR6EeTMvOeBCKkcGyUn9kMObt6MfBtdrrLwXduRI9qrkokQqh9LWs/JbrheZlhi3usNrEK8DSjwd/uv3AX2/lMppMANiM1xjbJk/zdkS8p0LgJx3XDF/yzMD7nGa7Qkk1N86gaGSimbqlO7V8XZSHkOfKEB6gEIXW3U3xTxf5cygvC5KDm4t+Az9VKY/uIkcyn2hdwawpRsV2Pn8bF5zo2s66teOlXfpFF8nw3JUWbHWr+6E3BwZDRM9xtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRXP264MB0903.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:1c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Tue, 7 Dec
 2021 07:55:43 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f%2]) with mapi id 15.20.4755.022; Tue, 7 Dec 2021
 07:55:43 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH v5 5/5] powerpc/inst: Optimise
 copy_inst_from_kernel_nofault()
Thread-Topic: [PATCH v5 5/5] powerpc/inst: Optimise
 copy_inst_from_kernel_nofault()
Thread-Index: AQHX5UmHUA77MTrQ8kK7ek+verEqa6wbHeAAgAB2IQCAAFtxgIAAcwWAgAAGBICAAAGbAIAKAtgAgAAT9QCAAA+3gIAAD86AgAAUrgA=
Date: Tue, 7 Dec 2021 07:55:43 +0000
Message-ID: <497d1646-3fd6-8acc-16f3-7abce672c97a@csgroup.eu>
References: <0d5b12183d5176dd702d29ad94c39c384e51c78f.1638208156.git.christophe.leroy@csgroup.eu>
 <202111300652.0yDBNvyJ-lkp@intel.com>
 <e7b67ca6-8cd1-da3c-c0f3-e05f7e592828@csgroup.eu>
 <87a6hlq408.fsf@mpe.ellerman.id.au> <YaZqs2tPxMzhgkAW@archlinux-ax161>
 <CAGG=3QX4k6MZ1qkT+sVAroJeBpbZBnOJauM_uJsu2uV1vnVObQ@mail.gmail.com>
 <CAGG=3QVQ9bwWWyKDN3_C2B0v7H6iZ4ZpNybXGCqbzwWrPjuPrg@mail.gmail.com>
 <87o85tnkzt.fsf@mpe.ellerman.id.au> <Ya7ntJ0ehZPy6HKA@archlinux-ax161>
 <861ec7f6-ba1f-2c7d-7e20-cad6e6bc1d1a@csgroup.eu>
 <Ya8CJacaIHLyIAuG@archlinux-ax161>
In-Reply-To: <Ya8CJacaIHLyIAuG@archlinux-ax161>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: eb785259-b6d3-466f-1263-08d9b956f886
x-ms-traffictypediagnostic: MRXP264MB0903:EE_
x-microsoft-antispam-prvs: <MRXP264MB09030DCBDC407CED7D1D352AED6E9@MRXP264MB0903.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qxLbqjP9N4pISivjhcdj6oDc5zAb4KH4o6smtrfjKTmtEyrbOBUkJRxmFXslj7YS86HO+5Iov9gB6jnpnTRcJWo5Ouyu2fLuVjuKud5bW2d9ERYVSU9PjtE8hWTjiUnxIfagnT8Ed3qqhEo9qd7oy9fe7lAZDCsJcTOBTeSt5EGuWbuxv0vcka2BJujheZIoJWPzWfidMFgvADoIFMJnxBmgcI7nD07C66tKEbrsFVYqrI25I1ICpbzxA8K+MYGDtfhyPxM3KIzGQ0Oh4ZbhZ7MMqBRWA/t3+ITa1jvKUIanulHrJsW1eV49LCRpx2b2oJMbmZ5s6x2at4cH6koPxwYjy1eIPgssWP9Zs/GIL18ur3Ygfw881G/VTIj/CIlqQqgSoWUoAv2OxSibBDXxiopTicgx3Tl7wcdB7slXAUurdiwQXdPn17l3kBbR7L/cCNEF0EmQ+FdrQzqDX54ydF9KOP9R8/mfOU3aHHINsvW88vH018N6BCaxHGAMWlKkold4QkID3YM0qLtYLpqdHwHg9eZwgXohceBlz0jTq8TULFEvcZJES4/kJNk0BEMt7e/ki3tcbDdxlQmpzBMlfqMy1lsOsHAvnJBs0mk6isknx3jn83NmbASNz+zF+KnEbXl1YPwmU4nVjcn2+0WdPveaBNY5qgDTX2+/I3bxk5tKPgiX+TAOFB2D1DueuOBdzU9KySkvtD6rg0r9kfIMyCcHVP3yD9Rhm+yhjTVK2VHgvlY5GhmCXWtV+P3H753G3as1Bc4YFY9rrxdHfPLf5MVVGLYXJCaPWVuwCTN4Lake67wrKVDsePh3DDRvYoqz0ruiigXvbLAx5Y2iNTtxi3UykLiFkAmkwQywd7ybDBog66FdwJkCPCYjXcEmGKCN0UltQWiWYjgS1KjutFKAeg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(5660300002)(6486002)(6506007)(53546011)(31686004)(83380400001)(76116006)(186003)(8936002)(508600001)(71200400001)(26005)(122000001)(91956017)(6916009)(36756003)(7416002)(966005)(31696002)(6512007)(86362001)(38070700005)(66446008)(316002)(64756008)(66946007)(54906003)(66556008)(2906002)(44832011)(66476007)(66574015)(2616005)(4326008)(38100700002)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?azdrNHBYN3NncWZNd0EzMk1oUldWSUNCSjl3M2c5amp3amV0anNBRHI5WkEv?=
 =?utf-8?B?S3pIcHJhRVEvZlZ1a0NRWEV2Y0Z3ektzNnJmc0JzOGZxaFAvUEhGOGNSQjhW?=
 =?utf-8?B?ZjNBcjRkbWU1T1kvdjkrRWc1VEJOWFJuWklDdGF0NjRDREE1L3B4MG9zR1E3?=
 =?utf-8?B?Y2RpMUJ0MHYxWmE2RHdsRnJRZjZlV1JndXBiS0RWN2ttZ1RVRzJJUGFpWk4z?=
 =?utf-8?B?STdDd2N5MWRwc2pac3UwajBhV3AwcTdiMXlLdHN3K3RiS3BmemJxU3NScWlE?=
 =?utf-8?B?ZDJicUxSQ1ZSQnhiOGVQRm9oS1gyWXcrY3prWXNRWTJSQWpFOWxKbW9FS0Rk?=
 =?utf-8?B?RnJpUkZDMi9OM2hKai9XVGk3azd6Sm5LamFRd3VUWUtGZXp5SnRrT1h0djBm?=
 =?utf-8?B?NEdXMThWZmRXSDFxSDlxa1VvbjZqa2VKMzQ5YVZNYnd5bUZuWjlzSGlKbTZ6?=
 =?utf-8?B?VjNWZmxUdERpcmxsbHlMemdEeWVjVkxoeThRc0I0K0JHV2JNSlhqUlFyWVo1?=
 =?utf-8?B?MVNCbHEvMmRnOVBLSEpOMlJxL0QrNXhYWmx1UjMwbWg2N1NrWHM2b3NLOUlF?=
 =?utf-8?B?ZlRuUGxHM29YQWF5QS82d2hPc0tib2xxSmRzWEF1TFlPQm5EcngzVkhvNUdJ?=
 =?utf-8?B?dU82T3dPb1IycFF2S1kzREQ2NEhEZlg1WDFGaEh5enUyU3dkTlJmbHVEUHZQ?=
 =?utf-8?B?U3RnalR5U01sTkJIOTk5TGRFMENzR0ZoMXo3TlVjNW9aTlhFYXVrQTl1TnR2?=
 =?utf-8?B?SHlJMzBFQjNFeWgzTmlmQUdMZ0xoM0xNOCsvNUFXcUJ1bHFlSXY2RXpqS0FE?=
 =?utf-8?B?Tk1TcW1EUUVzZXRKaWdHUmhabEN0NWhSNHAwTkplMWI4Skl6NDUwSStvbXJ0?=
 =?utf-8?B?Zk0xZlgvMzZ2Q0hpRlN6cDZjMGpqVHBNN1hwWFczUEUyOVpmNUVwQzltVTcw?=
 =?utf-8?B?V1NTNXdUOTQ3YVlVcXFNMTdxZ1V5NlJ2My9WMU5YWHg5bFJBQUl4L3d3UVNH?=
 =?utf-8?B?b25NRnUvSVFOUnMvL0VGM3JYLzE1SG9Od041Wlg1dDVXN3l0NjZPcnJXd0pu?=
 =?utf-8?B?YWRYdWVGeUlKaDF2b25jS0lRZ2htckZZVFArU1JoM28wRmlWZ3M4TGcxd0V5?=
 =?utf-8?B?S2hlMEpNRWxrMDZQWVNwQWhWZStRZmJnSDNQRnQ0S0lYVnR5YXVjNHpOZ3A4?=
 =?utf-8?B?RXlURjNlTUo3TVUxRjhMS0k3cGRvdUtSSGpwTkhzb3N2eldjZURzekx4SG5R?=
 =?utf-8?B?YjFoaWk0dnZnRXk4VitXd2w1bGczTUMrck5YaDBHeEdQTnZVRjdxMWRQWlo5?=
 =?utf-8?B?ZElmQWowYnRFUjlHZHYxWlJ0bVRmdndWSUh5VmF3YVlIanp4bUhHZlNuNE5R?=
 =?utf-8?B?YVZod1FmMTJqN1d0WVRQYTlVaHZ1ZDY3cWxRM1pFRjJ1WmFBVkJrTGRReWt4?=
 =?utf-8?B?OG9SaXFaQUxra1c2c21wYStpZ1lKVnlSaXZtTTFTUDArYkE0c2p4UWg5UXVO?=
 =?utf-8?B?SDdvNGpiZzlFRnlBWENHRkNPbHptdTVSSHJVUm5Uem8yRWk5dnovRDJWZmU2?=
 =?utf-8?B?TXBKVjhpQWMxSjNrTFlEbnQ4NTVYZTRYaVN2MDJNRmJsM2FJQ2svYWphdXBw?=
 =?utf-8?B?Z2puZWdxUXIyN1hHZFpMSGNBWFRJc2VwRXQ1dGFLanNvYlpONUp6UWhtNWpy?=
 =?utf-8?B?OUJkMWU4Rk9GZjRDaTFwRnlZd1Jnd3pudlcyUG55SjhMUkFUdWtCandwZVJB?=
 =?utf-8?B?ZU8vOGttTGpUeVhRanVxVUhqY1plWG5Sa2srNUNIRFFhYVVwbFNqczRBRHRQ?=
 =?utf-8?B?ZnEwNENhc25GOVdWTGFwZSttRUQzVkxuVzllMnNiNHJBa0RJWXNUV1FXdTZh?=
 =?utf-8?B?SWExTnliRFJqc3BNc3dYZGNtMi93SXQrU2cwUHJzV2VJdVMrbEpyMitQNDZI?=
 =?utf-8?B?WFBUaTdWTlk3QlpwdXZSVy9IMmVieDNxVXdhL2FYaGQyVnIweEpjMVFOOUls?=
 =?utf-8?B?eEN3VGNRcDRDb0piYUVkK1lvYmRBQ0NWbW9MckV5RU1VakpMOGtKTGhjRkhZ?=
 =?utf-8?B?Ymd0N2Q0NHpLWW1yWHJoVzNPb080RGhrREF1cjBIZEZyQ0pnVUJ5ZjkzUnkz?=
 =?utf-8?B?MkZ1eU1CMzlrVlhTWjBwNW1JVzMvdVJVVHpmVlFLeUxKVHpFUWNESXBHZFpX?=
 =?utf-8?B?SmR0aUdqY3FZOGVuNVZXR0I4SllNRkQ4ZUJneXN4ampzdDg2YnEyR3d3bzhM?=
 =?utf-8?Q?MU8awN0TCE8r27Wuc6SKM4LdjQXB9LCSCOV3LPMpEM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <080E38FBD2A5E54CBED6F9E1F657FCB0@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: eb785259-b6d3-466f-1263-08d9b956f886
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2021 07:55:43.6970 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KNSoEssYgiabmZwaZVn6YVGO/g+pKjv9pPWCQ8lq+O/9c0GlBhqL2ZwKH7Scf21U6/rNJF+zxbEFRUF+nrjayONKjN5LpojYlXnILeovb9E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRXP264MB0903
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
Cc: "kbuild-all@lists.01.org" <kbuild-all@lists.01.org>,
 kernel test robot <lkp@intel.com>,
 "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
 Nick Desaulniers <ndesaulniers@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>, Bill Wendling <morbo@google.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA3LzEyLzIwMjEgw6AgMDc6NDEsIE5hdGhhbiBDaGFuY2VsbG9yIGEgw6ljcml0wqA6
DQo+IE9uIFR1ZSwgRGVjIDA3LCAyMDIxIGF0IDA1OjQ1OjA4QU0gKzAwMDAsIENocmlzdG9waGUg
TGVyb3kgd3JvdGU6DQo+Pg0KPj4NCj4+IExlIDA3LzEyLzIwMjEgw6AgMDU6NDgsIE5hdGhhbiBD
aGFuY2VsbG9yIGEgw6ljcml0wqA6DQo+Pj4gT24gVHVlLCBEZWMgMDcsIDIwMjEgYXQgMDI6Mzc6
MjZQTSArMTEwMCwgTWljaGFlbCBFbGxlcm1hbiB3cm90ZToNCj4+Pj4gQmlsbCBXZW5kbGluZyA8
bW9yYm9AZ29vZ2xlLmNvbT4gd3JpdGVzOg0KPj4+Pj4gT24gVHVlLCBOb3YgMzAsIDIwMjEgYXQg
MTA6MzggQU0gQmlsbCBXZW5kbGluZyA8bW9yYm9AZ29vZ2xlLmNvbT4gd3JvdGU6DQo+Pj4+Pj4g
T24gVHVlLCBOb3YgMzAsIDIwMjEgYXQgMTA6MTcgQU0gTmF0aGFuIENoYW5jZWxsb3IgPG5hdGhh
bkBrZXJuZWwub3JnPiB3cm90ZToNCj4+Pj4+Pj4gT24gVHVlLCBOb3YgMzAsIDIwMjEgYXQgMTA6
MjU6NDNQTSArMTEwMCwgTWljaGFlbCBFbGxlcm1hbiB3cm90ZToNCj4+Pj4+Pj4+IENocmlzdG9w
aGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4gd3JpdGVzOg0KPj4+Pj4+Pj4+
IExlIDI5LzExLzIwMjEgw6AgMjM6NTUsIGtlcm5lbCB0ZXN0IHJvYm90IGEgw6ljcml0IDoNCj4+
Pj4gLi4uDQo+Pj4+Pj4+Pj4+IEFsbCB3YXJuaW5ncyAobmV3IG9uZXMgcHJlZml4ZWQgYnkgPj4p
Og0KPj4+Pj4+Pj4+Pg0KPj4+Pj4+Pj4+PiAgICAgICBJbiBmaWxlIGluY2x1ZGVkIGZyb20gYXJj
aC9wb3dlcnBjL2tlcm5lbC9hc20tb2Zmc2V0cy5jOjcxOg0KPj4+Pj4+Pj4+PiAgICAgICBJbiBm
aWxlIGluY2x1ZGVkIGZyb20gYXJjaC9wb3dlcnBjL2tlcm5lbC8uLi94bW9uL3htb25fYnB0cy5o
Ojc6DQo+Pj4+Pj4+Pj4+Pj4gYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2luc3QuaDoxNjU6MjA6
IHdhcm5pbmc6IHZhcmlhYmxlICd2YWwnIGlzIHVuaW5pdGlhbGl6ZWQgd2hlbiB1c2VkIGhlcmUg
Wy1XdW5pbml0aWFsaXplZF0NCj4+Pj4+Pj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICppbnN0
ID0gcHBjX2luc3QodmFsKTsNCj4+Pj4+Pj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgXn5+DQo+Pj4+Pj4+Pj4+ICAgICAgIGFyY2gvcG93ZXJwYy9pbmNsdWRlL2Fz
bS9pbnN0Lmg6NTM6MjI6IG5vdGU6IGV4cGFuZGVkIGZyb20gbWFjcm8gJ3BwY19pbnN0Jw0KPj4+
Pj4+Pj4+PiAgICAgICAjZGVmaW5lIHBwY19pbnN0KHgpICh4KQ0KPj4+Pj4+Pj4+PiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBeDQo+Pj4+Pj4+Pj4+ICAgICAgIGFyY2gvcG93ZXJwYy9pbmNs
dWRlL2FzbS9pbnN0Lmg6MTU1OjE4OiBub3RlOiBpbml0aWFsaXplIHRoZSB2YXJpYWJsZSAndmFs
JyB0byBzaWxlbmNlIHRoaXMgd2FybmluZw0KPj4+Pj4+Pj4+PiAgICAgICAgICAgICAgIHVuc2ln
bmVkIGludCB2YWwsIHN1ZmZpeDsNCj4+Pj4+Pj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgXg0KPj4+Pj4+Pj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPSAwDQo+
Pj4+Pj4+Pj4NCj4+Pj4+Pj4+PiBJIGNhbid0IHVuZGVyc3RhbmQgd2hhdCdzIHdyb25nIGhlcmUu
DQo+Pj4+IC4uLg0KPj4+Pj4+Pj4+DQo+Pj4+Pj4+Pj4gSSBzZWUgbm8gcG9zc2liaWxpdHksIG5v
IGFsdGVybmF0aXZlIHBhdGggd2hlcmUgdmFsIHdvdWxkbid0IGJlIHNldC4gVGhlDQo+Pj4+Pj4+
Pj4gYXNtIGNsZWFybHkgaGFzICphZGRyIGFzIGFuIG91dHB1dCBwYXJhbSBzbyBpdCBpcyBhbHdh
eXMgc2V0Lg0KPj4+Pj4+Pj4NCj4+Pj4+Pj4+IEkgZ3Vlc3MgY2xhbmcgY2FuJ3QgY29udmluY2Ug
aXRzZWxmIG9mIHRoYXQ/DQo+Pj4+IC4uLg0KPj4+Pj4+Pg0KPj4+Pj4+PiBJdCBjZXJ0YWlubHkg
bG9va3MgbGlrZSB0aGVyZSBpcyBzb21ldGhpbmcgd3Jvbmcgd2l0aCBob3cgY2xhbmcgaXMNCj4+
Pj4+Pj4gdHJhY2tpbmcgdGhlIGluaXRpYWxpemF0aW9uIG9mIHRoZSB2YXJpYWJsZSBiZWNhdXNl
IGl0IGxvb2tzIHRvIG1lIGxpa2UNCj4+Pj4+Pj4gdmFsIGlzIG9ubHkgdXNlZCBpbiB0aGUgZmFs
bHRocm91Z2ggcGF0aCwgd2hpY2ggaGFwcGVucyBhZnRlciBpdCBpcw0KPj4+Pj4+PiBpbml0aWFs
aXplZCB2aWEgbHd6LiAgUGVyaGFwcyBzb21ldGhpbmcgaXMgd3Jvbmcgd2l0aCB0aGUgbG9naWMg
b2YNCj4+Pj4+Pj4gaHR0cHM6Ly9yZXZpZXdzLmxsdm0ub3JnL0Q3MTMxND8gIEkndmUgYWRkZWQg
QmlsbCB0byBDQyAoTExWTSBpc3N1ZXMgYXJlDQo+Pj4+Pj4+IGJlaW5nIG1pZ3JhdGVkIGZyb20g
QnVnemlsbGEgdG8gR2l0SHViIElzc3VlcyByaWdodCBub3cgc28gSSBjYW5ub3QgZmlsZQ0KPj4+
Pj4+PiB0aGlzIHVwc3RyZWFtIGF0IHRoZSBtb21lbnQpLg0KPj4+Pj4+Pg0KPj4+Pj4+IElmIEkg
cmVtb3ZlIHRoZSBjYXN0cyBvZiAidmFsIiB0aGUgd2FybmluZyBkb2Vzbid0IGFwcGVhci4gSSBz
dXNwZWN0DQo+Pj4+Pj4gdGhhdCB3aGVuIEkgd3JvdGUgdGhhdCBwYXRjaCBJIGZvcmdvdCB0byBy
ZW1vdmUgdGhvc2Ugd2hlbiBjaGVja2luZy4NCj4+Pj4+PiAjaW5jbHVkZSAiQ2FwdGFpbl9QaWNh
cmRfZmFjZXBhbG0uaCINCj4+Pj4+Pg0KPj4+Pj4+IEknbGwgbG9vayBpbnRvIGl0Lg0KPj4+Pj4+
DQo+Pj4+PiBTbWFsbCByZXRyYWN0aW9uLiBJdCdzIHRoZSAiKig8Y2FzdD4pJnZhbCIgdGhhdCdz
IHRoZSBpc3N1ZS4gKEkuZS4gdGhlICIqJiIpDQo+Pj4+DQo+Pj4+IEkgZ3Vlc3MgZm9yIG5vdyBJ
J2xsIGp1c3Qgc3F1YXNoIHRoaXMgaW4gYXMgYSB3b3JrYXJvdW5kPw0KPj4+Pg0KPj4+Pg0KPj4+
PiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2luc3QuaCBiL2FyY2gvcG93
ZXJwYy9pbmNsdWRlL2FzbS9pbnN0LmgNCj4+Pj4gaW5kZXggNjMxNDM2ZjNmNWMzLi41YjU5MWM1
MWZlYzkgMTAwNjQ0DQo+Pj4+IC0tLSBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9pbnN0LmgN
Cj4+Pj4gKysrIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2luc3QuaA0KPj4+PiBAQCAtMTU3
LDYgKzE1Nyw5IEBAIHN0YXRpYyBpbmxpbmUgaW50IGNvcHlfaW5zdF9mcm9tX2tlcm5lbF9ub2Zh
dWx0KHBwY19pbnN0X3QgKmluc3QsIHUzMiAqc3JjKQ0KPj4+PiAgICAJaWYgKHVubGlrZWx5KCFp
c19rZXJuZWxfYWRkcigodW5zaWduZWQgbG9uZylzcmMpKSkNCj4+Pj4gICAgCQlyZXR1cm4gLUVS
QU5HRTsNCj4+Pg0KPj4+IENvdWxkIHdlIGFkZCBhIHZlcnNpb24gY2hlY2sgdG8gdGhpcyBhbmQg
YSBsaW5rIHRvIG91ciBidWcgdHJhY2tlcjoNCj4+Pg0KPj4+IC8qIGh0dHBzOi8vZ2l0aHViLmNv
bS9DbGFuZ0J1aWx0TGludXgvbGludXgvaXNzdWVzLzE1MjEgKi8NCj4+PiAjaWYgZGVmaW5lZChD
T05GSUdfQ0NfSVNfQ0xBTkcpICYmIENPTkZJR19DTEFOR19WRVJTSU9OIDwgMTQwMDAwDQo+Pg0K
Pj4gVGhlIHJvYm90IHJlcG9ydGVkIHRoZSBwcm9ibGVtIG9uOg0KPj4NCj4+IGNvbXBpbGVyOiBj
bGFuZyB2ZXJzaW9uIDE0LjAuMCAoaHR0cHM6Ly9naXRodWIuY29tL2xsdm0vbGx2bS1wcm9qZWN0
DQo+PiBkZjA4YjJmZThiMzVjYjYzZGZiM2I0OTczOGEzNDk0YjliNGU2ZjhlKQ0KPj4NCj4+IFNo
b3VsZCBpdCBiZSBDT05GSUdfQ0xBTkdfVkVSU0lPTiA8PSAxNDAwMDAgPw0KPiANCj4gVGhlIHJv
Ym90IHRlc3RzIGNsYW5nIGZyb20gdGlwIG9mIHRyZWUsIHJlYnVpbGRpbmcgZXZlcnkgd2VlayBv
ciBzby4gVGhlDQo+IGZpeCBpcyBnZXR0aW5nIHJlYWR5IHRvIGxhbmQgc28gaXQgd2lsbCBiZSBy
ZWxlYXNlZCBpbiAxNC4wLjAgZmluYWwuIFdlDQo+IGhhdmUgYWx3YXlzIHdyaXR0ZW4gdGlwIG9m
IHRyZWUgdmVyc2lvbiBjaGVja3Mgd2l0aCB0aGUgZXhwZWN0YXRpb24gdGhhdA0KPiBpZiBwZW9w
bGUgYXJlIHRlc3RpbmcgdGlwIG9mIHRyZWUgY2xhbmcsIHRoZXkgYXJlIGZyZXF1ZW50bHkgcmVi
dWlsZGluZy4NCj4gSWYgdGhhdCBpcyBub3QgdHJ1ZSwgdGhleSBuZWVkIHRvIGJlIHVzaW5nIHJl
bGVhc2VkL3N0YWJsZSB2ZXJzaW9ucywNCj4gb3RoZXJ3aXNlIHRoZSBtb2RlbCBpcyBicm9rZW4u
DQo+IA0KPiBJZiB0aGF0IGlzIHRvbyBwcm9ibGVtYXRpYywgd2UgY291bGQgYWRkIGEgdmVyc2lv
biBjaGVjayB0byBLY29uZmlnDQo+IChjYW5ub3QgdGhpbmsgb2YgYSBncmVhdCBuYW1lIGZvciB0
aGUgY29uZmlnIG9mZiB0aGUgdG9wIG9mIG15IGhlYWQpDQo+IHRoYXQgY2hlY2tzIGZvciB0aGlz
IGlzc3VlIGFuZCBpZmRlZiBvbiB0aGF0LiBUaGF0IG1pZ2h0IGJlIG5pY2UgaW4NCj4gY2FzZSBh
bm90aGVyIGluc3RhbmNlIG9mIHRoaXMgY3JvcHMgdXAgaW4gdGhlIGZ1dHVyZS4NCj4gDQoNCkl0
J3MgZmluZSBmb3IgbWUuIEkgZGlkbid0IGtub3cgcm9ib3Qgd2FzIHVzaW5nIHByZXJlbGVhc2Vz
IHdpdGggdGhlIA0Kc2FtZSBuYW1lIGFzIHRoZSBmdXR1cmUgcmVsZWFzZS4NCg0KQ2hyaXN0b3Bo
ZQ==
