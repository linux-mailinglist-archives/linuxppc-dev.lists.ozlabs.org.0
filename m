Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 591F446B294
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Dec 2021 06:46:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J7Tmq29cmz3c5B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Dec 2021 16:46:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::609;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0609.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::609])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J7TmG3TvMz2xtQ
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Dec 2021 16:45:32 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SfqPk97IxMaEYFZQyfSx/RZ3knRQgU6jgY9ATWrBGsev6h/MfZjuOPBYr7hVjp4MHFmBK84Wsnj9Trw/dpObqEPNCvg248K4Gv5PMK4LyzVNSy4dqc8ZXO8IxtYkx6pxye+cBJcxwMGq7UK+IzxxGQWZnGsKX39S5gMBJ17AIyK7+RwSNCWHk93S+thxzVAM8POW9DTCtXj433YWdX3bG8SjZgm8MVUoh/8zWEsh846fNKAO1S0PcxyVk6eeu7HghDk2N8qurbhKAqBvAqdzY2gctqkOYLzjQlU5KScaVQpUioLGobM6S/zlEsDQ8qX0Sn403MYBGcaL//jY4pVm3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AsstRunA7hCHyfgV3twHRiCIJU1bc94Q2JVqWWcoyBI=;
 b=Ftq2UgJQmm+oB7cnElvG3WNCDXWb+rmV8RHW9mix47TusXiImk21CMHyleV1gRl1y4j/Hlj8L+g50H0Nkswb3zkeUcGZORCueqwUtFsuhJ0svT+Sh/YRzTgXsh1Dr6dQ62lEytZ7RN7JrQ7y6eQ21wRc+3pThAp+8SUSTze+iOwSaevy4T2JRMEQMPPl4gFfeXRdqGfoDZ4amlHalgGX2ZLgt+P51OXZsxfFnuwx7p6Qg/IlNyYYCWRR+tnXTJTpXTuQlZqOsq7Oo4786vMlhc9yPjdhHUv+o6afIKaPSi1u8FUrTmCKtSyEMrJzlyivu9bUc+xTsCQ9Xqtdgrcxlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR2P264MB0195.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.20; Tue, 7 Dec
 2021 05:45:08 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f%2]) with mapi id 15.20.4755.022; Tue, 7 Dec 2021
 05:45:08 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Nathan Chancellor <nathan@kernel.org>, Michael Ellerman
 <mpe@ellerman.id.au>
Subject: Re: [PATCH v5 5/5] powerpc/inst: Optimise
 copy_inst_from_kernel_nofault()
Thread-Topic: [PATCH v5 5/5] powerpc/inst: Optimise
 copy_inst_from_kernel_nofault()
Thread-Index: AQHX5UmHUA77MTrQ8kK7ek+verEqa6wbHeAAgAB2IQCAAFtxgIAAcwWAgAAGBICAAAGbAIAKAtgAgAAT9QCAAA+3gA==
Date: Tue, 7 Dec 2021 05:45:08 +0000
Message-ID: <861ec7f6-ba1f-2c7d-7e20-cad6e6bc1d1a@csgroup.eu>
References: <0d5b12183d5176dd702d29ad94c39c384e51c78f.1638208156.git.christophe.leroy@csgroup.eu>
 <202111300652.0yDBNvyJ-lkp@intel.com>
 <e7b67ca6-8cd1-da3c-c0f3-e05f7e592828@csgroup.eu>
 <87a6hlq408.fsf@mpe.ellerman.id.au> <YaZqs2tPxMzhgkAW@archlinux-ax161>
 <CAGG=3QX4k6MZ1qkT+sVAroJeBpbZBnOJauM_uJsu2uV1vnVObQ@mail.gmail.com>
 <CAGG=3QVQ9bwWWyKDN3_C2B0v7H6iZ4ZpNybXGCqbzwWrPjuPrg@mail.gmail.com>
 <87o85tnkzt.fsf@mpe.ellerman.id.au> <Ya7ntJ0ehZPy6HKA@archlinux-ax161>
In-Reply-To: <Ya7ntJ0ehZPy6HKA@archlinux-ax161>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cf174b1c-00cf-4307-801f-08d9b944ba51
x-ms-traffictypediagnostic: MR2P264MB0195:EE_
x-microsoft-antispam-prvs: <MR2P264MB01950E3D1179E212B633607CED6E9@MR2P264MB0195.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:660;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2fInA7/MErWNLnoDrkNta3UL7RO8vXN0cs6EeSGV/CF2E4uzBQreBDLe51T2FQi9z9omJJK+XwanIUoWik67Mwpf2wZE5e6nbi//C66LmIJ1J+ZIv4NqIUYuhT+ODmh/FAa1BuwiRvJ4h0vCRx3Y2iX7MfgWUfvHNAYx+ECBoY7sCv4Xp3TB4rAHMA7AIwqwY1AJq3YHPDqtifZ9I7Ahw1QG0UiNNHl8FBzhr0ydwGdZu18lMua746VRXW8jInbhlv5K6JAR/ZMcvSZZOCMMUNI63mgkeiEKtOK3T4siHXSNUnU9OV5DIT4ae2hvjJmwAKq0CHdZFOlA7v6MIezYSdTG4/CKuaVXek0xKw57s7v5K2JwGRActt1bKW15aCBgeI0soEMEr4dLBZ6P8lquMPEU+lKNm8ZMqilmjuxs3eg7I7Uhnv7/9IYir1EnoHIVDeDKc03ZnsCJjZbbHy/StuSms6D1kJMoyvSBdcKlj+/dooFzH8mzGkaieF0J7FvTw1n8WOa9Bh40JysrjmO6/bJmFQpAFBFLlAs4yn84ovRn54TOZ95krxaVSrDhfCV7zz56U0oGsz3R2mQEvDRvi/afyCSBIPR7NV8nTScgX45QTUz5Wu6RWwCpeTutYAq/NAZl7Hm4QGj7TM9/4BnlNt0lblJ04kW3h7Vj/ve2Qh4K1MR3fVPpia/Eo803NDjqOCIwRFb8BHeZiy0BohcaWEXyR/OE+Vn3kAXeXfE1UqWiDhYVrS1ju1jbkvPSnUUBBR2En4ovhDaKJ6Y5gA+RbTbO3iJ+XuwGSxQM1iKT3YFYzVIOWS9JMXMjJsf1kAw6XS9q7XPJ8UbVji5XLaM3IpDHa+OvDDgzcDqikIjZzoiGTfH9KL43tapQcIrOPVz4OHrfVeJJcvAUTluRUQnFXQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(31696002)(4326008)(2616005)(26005)(5660300002)(54906003)(110136005)(38070700005)(8936002)(38100700002)(316002)(86362001)(122000001)(2906002)(966005)(66446008)(64756008)(66556008)(66476007)(186003)(91956017)(7416002)(6486002)(76116006)(44832011)(53546011)(66946007)(83380400001)(508600001)(71200400001)(66574015)(36756003)(6506007)(6512007)(8676002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Slo1NjFBK0dXQnRRMHpxSzFiSkNDUkFUNVBmZzFmYW1SL2lIVXZ0YXZEeTFG?=
 =?utf-8?B?eHpZUHJ0MXVrUXZMZ1JXMFRSYlVvMXFpRXhMRmxleURzRXJtaDVjMlVUcDFW?=
 =?utf-8?B?WE1VRFdNaEJ0ZXAzTEE1eEYxWkxIbXZOOEQxdngySWVGR2Z1Z0h3V0JzNXZa?=
 =?utf-8?B?dmY2ZmMwMXBBczJwTmNQU2ZtL0JaL0dsRlhZUXlnR3pFRVVKQ3hJY3JDZ3E5?=
 =?utf-8?B?dHY5N1BTRWJ2cFFYaGNuYk1SVTdScGh4Vm1QL3lxMHcxWGZka05RWmFJYW1v?=
 =?utf-8?B?aGhycDRpbjByZUlReTNXUWQ2OVRwZS84WnBNQW42TEhOdjdiTlVIYXhNYVFr?=
 =?utf-8?B?enM0YkVucVQzMzM4ZFNHNEJMNVpIajRkL0oxOHVtMGNjZ1lkTDl0dW1pYWNx?=
 =?utf-8?B?L2hlejZESS9nWUdzV3BXaDRxeW5pSllDdXBadlM4WUR5cE1wbHp1YVJXQUtj?=
 =?utf-8?B?T21tVjJyODJ6L1FrWUlTaWJGQ0F3T25YK0dMUUwzbUJDSEVWOFZFdlQyb2Rs?=
 =?utf-8?B?UjZkWGVSak9nbjk3NU9wcUQ3MG93MWE5em5xSjYyeWJVMkYzMVdyS3M5VSt3?=
 =?utf-8?B?bHF6OUF2dUkxOTk4ZXpYM3RmcGdhSjZRVXJUdHI5bCszQUhoOWY2ZHJnQXNj?=
 =?utf-8?B?OEpYQ3NIZzlpMGdVSjJzOTZUL2J1VUZPeHFvaWNlYVNydWN5a3krb0ZHdmtV?=
 =?utf-8?B?WlBMZ1NyTTFlLy9BME1IYnNCNHZIQ3hYUkRKbzRRN0RmcU1rcEttRDJnM1Ur?=
 =?utf-8?B?ZFpDRzRObFdIZ2lSUG9mUEJ4ODVoYkxoNmRZdEQvTUhwMXhHZUhoWUZ3WGZy?=
 =?utf-8?B?WWoyV1dXV2w0Mm5FVzdkSDlKa2F5NGFNRzlhSzJCUE4yL1VxMWpRQ3VtK2l1?=
 =?utf-8?B?STViL0JjaUpnOWNINkQ3MmlDZlNsN1RhQXVYVnlMa1Q5QUpiZm1KcUp5WEVD?=
 =?utf-8?B?TXNwblBOdGFlcTZiVC9lVmdYeHJncmt4WTBpWFV6eUU5RGhkZWlzdnVIdjlC?=
 =?utf-8?B?NUd1dVpFbkdEcFVTaDZkWFRGb3lBeDRSVldGWk5SbHlIM0tvQTBGb3pqKzdz?=
 =?utf-8?B?TDhGRTlGWmVnZWJSeGhqOU9VNzQxZW1SMGFOaDUzQVF0cWhacUJCaTlnQk9u?=
 =?utf-8?B?Z0k1bVVOenhzclNCcmxkVXNFd2ZRUnY0TjNmOUdadzZGZHgwSHdFeFB2TitF?=
 =?utf-8?B?VElENXp0ZlpVYmk5MGUrR1B3Q0pjQ0YybnJoRVdvOEtaWE1IYkcydDBxMytw?=
 =?utf-8?B?cHZtN1hjSVFGNlBHVGRSRXZNTDhNRGpOVnpSNVE2SEdjNWJJMTVXRmRwYlAx?=
 =?utf-8?B?SW5tU0JlM1NCSWp3a2pHbTVXUDJrY1NMWitaSithRDMyRWFXa0duNnBGN0x5?=
 =?utf-8?B?S2R0YjRYUk5EdUhDazlQN2tLOU02M0JnclVCQ0NkdEdaMnZNNFhGbGJISU5k?=
 =?utf-8?B?YXV2VU1tRXdtR2JCblROcWoyYlAwS2tZY0VYV0Z5R0o4RFJnZ0Eva01HSUVz?=
 =?utf-8?B?VTk3bXVaaHQ2dnc1bHp0dUxyNHVxdmxwRVhFTHhzUEhVVUsyUE9nQm4zRVpD?=
 =?utf-8?B?V0wvOTljc1R6YzQ5VmUrL2ZHNmJaVm1sdFNpNllGS3R5TVlkMU1OZjV3cDc1?=
 =?utf-8?B?U1hIZ0VqM256TTBKNEVnQUQrejhsTXFiZXE1RklWeWdJbzBtcldxYWYrRk1z?=
 =?utf-8?B?WmZqbktYbzZNZGM3Rno4eXpFK0tTTzVtNks5NkNVcFUvb3JZMGlQWXpLQVc0?=
 =?utf-8?B?YldVaUpORDY3YnpqalhaMXNOZ3U5WlRiYjVEWEJGQm42QWQxR0h6emxzVTN0?=
 =?utf-8?B?dVJhZGY0UmFDallvY1ZQc3hBN2NkYkRMaDJTZlR4TmNoWUg0cHhHNExpYlQx?=
 =?utf-8?B?QXE2RFhDZzBJV2IzUXJuN1ZDL01zMnh2YzJxNDMxQzVJaEJsREFudkE3R3Jq?=
 =?utf-8?B?THV0Q0ZXakxETkRNbEhWMlRKeUJWandpTVVkSEgxbENObEtYZUJ6Y3VpYWNP?=
 =?utf-8?B?M2V1YlRidEVsWStVK2VRZVhmNFJkUmU2MWhYSTNnbTVVUEVPNmF3ek04NWpL?=
 =?utf-8?B?SHErQlBGaVRycnh5RzJWa241Nm1jSlZCWjRVUi9VNmpmL3JUK1Vld1ZtOG9N?=
 =?utf-8?B?Uk81ZVkwZ3Q5b1RFM3AwVVRXQzhkSUVCWm9aNEloOXp5ZENEdE1YMVdQbkJp?=
 =?utf-8?B?V1BiczFmeHAxVnB3YUdmU09iVkNsdlU5VUZWam1TTnFVWHRGTHlTVE4xcjQv?=
 =?utf-8?Q?r6tdtmN7pObqTcgSaFBkKWyoj8ogryrW9CZhrkawSc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <65FCEDD33A9D87499AA22910E2E38E87@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: cf174b1c-00cf-4307-801f-08d9b944ba51
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2021 05:45:08.3836 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Qy1a53a6bsCs3MXh7VpI96XuElBMpntd3QzToBQp5GJAl2B6UbZH3fd9Bs34qx0a3vDVT1+AUU8CUsa7jWK8F6JSdHweHyo26U8QxwVp0Ho=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR2P264MB0195
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

DQoNCkxlIDA3LzEyLzIwMjEgw6AgMDU6NDgsIE5hdGhhbiBDaGFuY2VsbG9yIGEgw6ljcml0wqA6
DQo+IE9uIFR1ZSwgRGVjIDA3LCAyMDIxIGF0IDAyOjM3OjI2UE0gKzExMDAsIE1pY2hhZWwgRWxs
ZXJtYW4gd3JvdGU6DQo+PiBCaWxsIFdlbmRsaW5nIDxtb3Jib0Bnb29nbGUuY29tPiB3cml0ZXM6
DQo+Pj4gT24gVHVlLCBOb3YgMzAsIDIwMjEgYXQgMTA6MzggQU0gQmlsbCBXZW5kbGluZyA8bW9y
Ym9AZ29vZ2xlLmNvbT4gd3JvdGU6DQo+Pj4+IE9uIFR1ZSwgTm92IDMwLCAyMDIxIGF0IDEwOjE3
IEFNIE5hdGhhbiBDaGFuY2VsbG9yIDxuYXRoYW5Aa2VybmVsLm9yZz4gd3JvdGU6DQo+Pj4+PiBP
biBUdWUsIE5vdiAzMCwgMjAyMSBhdCAxMDoyNTo0M1BNICsxMTAwLCBNaWNoYWVsIEVsbGVybWFu
IHdyb3RlOg0KPj4+Pj4+IENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lAY3Nncm91
cC5ldT4gd3JpdGVzOg0KPj4+Pj4+PiBMZSAyOS8xMS8yMDIxIMOgIDIzOjU1LCBrZXJuZWwgdGVz
dCByb2JvdCBhIMOpY3JpdCA6DQo+PiAuLi4NCj4+Pj4+Pj4+IEFsbCB3YXJuaW5ncyAobmV3IG9u
ZXMgcHJlZml4ZWQgYnkgPj4pOg0KPj4+Pj4+Pj4NCj4+Pj4+Pj4+ICAgICAgSW4gZmlsZSBpbmNs
dWRlZCBmcm9tIGFyY2gvcG93ZXJwYy9rZXJuZWwvYXNtLW9mZnNldHMuYzo3MToNCj4+Pj4+Pj4+
ICAgICAgSW4gZmlsZSBpbmNsdWRlZCBmcm9tIGFyY2gvcG93ZXJwYy9rZXJuZWwvLi4veG1vbi94
bW9uX2JwdHMuaDo3Og0KPj4+Pj4+Pj4+PiBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vaW5zdC5o
OjE2NToyMDogd2FybmluZzogdmFyaWFibGUgJ3ZhbCcgaXMgdW5pbml0aWFsaXplZCB3aGVuIHVz
ZWQgaGVyZSBbLVd1bmluaXRpYWxpemVkXQ0KPj4+Pj4+Pj4gICAgICAgICAgICAgICAgICAgICAg
Kmluc3QgPSBwcGNfaW5zdCh2YWwpOw0KPj4+Pj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBefn4NCj4+Pj4+Pj4+ICAgICAgYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNt
L2luc3QuaDo1MzoyMjogbm90ZTogZXhwYW5kZWQgZnJvbSBtYWNybyAncHBjX2luc3QnDQo+Pj4+
Pj4+PiAgICAgICNkZWZpbmUgcHBjX2luc3QoeCkgKHgpDQo+Pj4+Pj4+PiAgICAgICAgICAgICAg
ICAgICAgICAgICAgIF4NCj4+Pj4+Pj4+ICAgICAgYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2lu
c3QuaDoxNTU6MTg6IG5vdGU6IGluaXRpYWxpemUgdGhlIHZhcmlhYmxlICd2YWwnIHRvIHNpbGVu
Y2UgdGhpcyB3YXJuaW5nDQo+Pj4+Pj4+PiAgICAgICAgICAgICAgdW5zaWduZWQgaW50IHZhbCwg
c3VmZml4Ow0KPj4+Pj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeDQo+Pj4+Pj4+
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA9IDANCj4+Pj4+Pj4NCj4+Pj4+Pj4gSSBj
YW4ndCB1bmRlcnN0YW5kIHdoYXQncyB3cm9uZyBoZXJlLg0KPj4gLi4uDQo+Pj4+Pj4+DQo+Pj4+
Pj4+IEkgc2VlIG5vIHBvc3NpYmlsaXR5LCBubyBhbHRlcm5hdGl2ZSBwYXRoIHdoZXJlIHZhbCB3
b3VsZG4ndCBiZSBzZXQuIFRoZQ0KPj4+Pj4+PiBhc20gY2xlYXJseSBoYXMgKmFkZHIgYXMgYW4g
b3V0cHV0IHBhcmFtIHNvIGl0IGlzIGFsd2F5cyBzZXQuDQo+Pj4+Pj4NCj4+Pj4+PiBJIGd1ZXNz
IGNsYW5nIGNhbid0IGNvbnZpbmNlIGl0c2VsZiBvZiB0aGF0Pw0KPj4gLi4uDQo+Pj4+Pg0KPj4+
Pj4gSXQgY2VydGFpbmx5IGxvb2tzIGxpa2UgdGhlcmUgaXMgc29tZXRoaW5nIHdyb25nIHdpdGgg
aG93IGNsYW5nIGlzDQo+Pj4+PiB0cmFja2luZyB0aGUgaW5pdGlhbGl6YXRpb24gb2YgdGhlIHZh
cmlhYmxlIGJlY2F1c2UgaXQgbG9va3MgdG8gbWUgbGlrZQ0KPj4+Pj4gdmFsIGlzIG9ubHkgdXNl
ZCBpbiB0aGUgZmFsbHRocm91Z2ggcGF0aCwgd2hpY2ggaGFwcGVucyBhZnRlciBpdCBpcw0KPj4+
Pj4gaW5pdGlhbGl6ZWQgdmlhIGx3ei4gIFBlcmhhcHMgc29tZXRoaW5nIGlzIHdyb25nIHdpdGgg
dGhlIGxvZ2ljIG9mDQo+Pj4+PiBodHRwczovL3Jldmlld3MubGx2bS5vcmcvRDcxMzE0PyAgSSd2
ZSBhZGRlZCBCaWxsIHRvIENDIChMTFZNIGlzc3VlcyBhcmUNCj4+Pj4+IGJlaW5nIG1pZ3JhdGVk
IGZyb20gQnVnemlsbGEgdG8gR2l0SHViIElzc3VlcyByaWdodCBub3cgc28gSSBjYW5ub3QgZmls
ZQ0KPj4+Pj4gdGhpcyB1cHN0cmVhbSBhdCB0aGUgbW9tZW50KS4NCj4+Pj4+DQo+Pj4+IElmIEkg
cmVtb3ZlIHRoZSBjYXN0cyBvZiAidmFsIiB0aGUgd2FybmluZyBkb2Vzbid0IGFwcGVhci4gSSBz
dXNwZWN0DQo+Pj4+IHRoYXQgd2hlbiBJIHdyb3RlIHRoYXQgcGF0Y2ggSSBmb3Jnb3QgdG8gcmVt
b3ZlIHRob3NlIHdoZW4gY2hlY2tpbmcuDQo+Pj4+ICNpbmNsdWRlICJDYXB0YWluX1BpY2FyZF9m
YWNlcGFsbS5oIg0KPj4+Pg0KPj4+PiBJJ2xsIGxvb2sgaW50byBpdC4NCj4+Pj4NCj4+PiBTbWFs
bCByZXRyYWN0aW9uLiBJdCdzIHRoZSAiKig8Y2FzdD4pJnZhbCIgdGhhdCdzIHRoZSBpc3N1ZS4g
KEkuZS4gdGhlICIqJiIpDQo+Pg0KPj4gSSBndWVzcyBmb3Igbm93IEknbGwganVzdCBzcXVhc2gg
dGhpcyBpbiBhcyBhIHdvcmthcm91bmQ/DQo+Pg0KPj4NCj4+IGRpZmYgLS1naXQgYS9hcmNoL3Bv
d2VycGMvaW5jbHVkZS9hc20vaW5zdC5oIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2luc3Qu
aA0KPj4gaW5kZXggNjMxNDM2ZjNmNWMzLi41YjU5MWM1MWZlYzkgMTAwNjQ0DQo+PiAtLS0gYS9h
cmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vaW5zdC5oDQo+PiArKysgYi9hcmNoL3Bvd2VycGMvaW5j
bHVkZS9hc20vaW5zdC5oDQo+PiBAQCAtMTU3LDYgKzE1Nyw5IEBAIHN0YXRpYyBpbmxpbmUgaW50
IGNvcHlfaW5zdF9mcm9tX2tlcm5lbF9ub2ZhdWx0KHBwY19pbnN0X3QgKmluc3QsIHUzMiAqc3Jj
KQ0KPj4gICAJaWYgKHVubGlrZWx5KCFpc19rZXJuZWxfYWRkcigodW5zaWduZWQgbG9uZylzcmMp
KSkNCj4+ICAgCQlyZXR1cm4gLUVSQU5HRTsNCj4gDQo+IENvdWxkIHdlIGFkZCBhIHZlcnNpb24g
Y2hlY2sgdG8gdGhpcyBhbmQgYSBsaW5rIHRvIG91ciBidWcgdHJhY2tlcjoNCj4gDQo+IC8qIGh0
dHBzOi8vZ2l0aHViLmNvbS9DbGFuZ0J1aWx0TGludXgvbGludXgvaXNzdWVzLzE1MjEgKi8NCj4g
I2lmIGRlZmluZWQoQ09ORklHX0NDX0lTX0NMQU5HKSAmJiBDT05GSUdfQ0xBTkdfVkVSU0lPTiA8
IDE0MDAwMA0KDQpUaGUgcm9ib3QgcmVwb3J0ZWQgdGhlIHByb2JsZW0gb246DQoNCmNvbXBpbGVy
OiBjbGFuZyB2ZXJzaW9uIDE0LjAuMCAoaHR0cHM6Ly9naXRodWIuY29tL2xsdm0vbGx2bS1wcm9q
ZWN0IA0KZGYwOGIyZmU4YjM1Y2I2M2RmYjNiNDk3MzhhMzQ5NGI5YjRlNmY4ZSkNCg0KU2hvdWxk
IGl0IGJlIENPTkZJR19DTEFOR19WRVJTSU9OIDw9IDE0MDAwMCA/DQoNCj4gDQo+PiArI2lmZGVm
IENPTkZJR19DQ19JU19DTEFORw0KPj4gKwl2YWwgPSBzdWZmaXggPSAwOw0KPj4gKyNlbmRpZg0K
Pj4gICAJX19nZXRfa2VybmVsX25vZmF1bHQoJnZhbCwgc3JjLCB1MzIsIEVmYXVsdCk7DQo+PiAg
IAlpZiAoSVNfRU5BQkxFRChDT05GSUdfUFBDNjQpICYmIGdldF9vcCh2YWwpID09IE9QX1BSRUZJ
WCkgew0KPj4gICAJCV9fZ2V0X2tlcm5lbF9ub2ZhdWx0KCZzdWZmaXgsIHNyYyArIDEsIHUzMiwg
RWZhdWx0KTsNCj4+DQoNCkNocmlzdG9waGU=
