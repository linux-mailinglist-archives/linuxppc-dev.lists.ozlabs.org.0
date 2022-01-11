Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99CD848A7A8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jan 2022 07:20:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JY0ts36TRz3bbM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jan 2022 17:20:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::61f;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on061f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::61f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JY0tN23ZJz2xMw
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jan 2022 17:20:24 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HFcFrW67ls3QVLw7asBoxhEu5jr1LQeuLlFkUhe9OuFr236n1yRTCPxQDet19zJ/9mbHBMSVbkoudxCXloNvw7hyHn4RluXt0qdv7JJL9o207waFFnwGiohjFiVZe3GpjYWjBrjbdrQ6paVHu4UU7wshWqVyMABw8tq+tC4VVIycqUg9wvGb04gQYz6+Di9AKnVv9M4bqphYqzeX01r7cgqG+Kbmwrun9wbJGuT+fu0yrguTjZDDKPmJiKHFtPObvtt9fdmnyYXohvs1Ir+/o1i6AAxXNsWLVUx5MiaEniRHXTmvVflahT4r3g+ot6osk89vgJGWxHJUQ1ljf7GhNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1yMDHT37nx2KSlby9KR/bIDu7hGmz514JiAIj2X0+yU=;
 b=IedWr0kklfSFy+udMKcTOi5VPXq7hqrEM9LHyQlKyk7zMxjaSVDaeFjMw1XdM2mGiiSrqrJEm2bHS+e22TPDQgsimAkrhERlJgdhWzceamNJYc83yP2ohRtIYcFA+1u4F2sGew2Jgh1Hgikej3e/UAK0u7zlhnN4J6bxPnf6XjA+YvwCz/4qpgityyOsLRcOjHz4NVS54jf+RlroxM01EZI68kbH7xR0jQ/sYQ7IJYC5focvmpoX1mpzNtOhvlap6N4pBn4SXpIyhdNkww/g78NiDBu3ojiWloxkRKZuJH5wcAr5gwi+18YvUYM9GbpOB9R2gMGkmj7m9nNNgDESIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR2P264MB0724.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:12::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Tue, 11 Jan
 2022 06:20:03 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5%5]) with mapi id 15.20.4888.009; Tue, 11 Jan 2022
 06:20:03 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Mike <michael.heltne@gmail.com>
Subject: Re: [5.16.0] build error on unrecognized opcode: ptesync
Thread-Topic: [5.16.0] build error on unrecognized opcode: ptesync
Thread-Index: AQHYBnGmeXPLkMwKP0WsDZHojSQnxaxdWaaA
Date: Tue, 11 Jan 2022 06:20:03 +0000
Message-ID: <b14be6fa-f3c1-4a40-6714-378c9ad45fcd@csgroup.eu>
References: <CANtoAtPcRGHafb7LddtrY5g43m82txS_mY3WO_ZtJ+pfuLvKaw@mail.gmail.com>
In-Reply-To: <CANtoAtPcRGHafb7LddtrY5g43m82txS_mY3WO_ZtJ+pfuLvKaw@mail.gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c1c7a98b-17c9-4895-b5e8-08d9d4ca675c
x-ms-traffictypediagnostic: MR2P264MB0724:EE_
x-microsoft-antispam-prvs: <MR2P264MB0724F716F3F232B84E903C8EED519@MR2P264MB0724.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /uMEPENEbfSvSk9F/DH1oTcao9cuLijzdDcMQcFhrBHz2aHQ3P+QJicimoMshC4OcO4iadODsAoyctukrsL07l2GkPyPh1hdtDZz/fm7mXB95kdp9RP6f5+XkP1+ILJjx/x2Xu6fyU5KUNDN0EaM/6XY4XPi8b9xwCTq0mWXzE49452j3IbUSTl01iIn6FLF9aHl9rmTAuf4aWbIztPgccc2IEAMke07ffYWS/brH/NRwAHD4cmXnfcLyynK96FEDYAtcqnu5xOr8ZnN7x+cdmMHpOpo1FHJHDayaztsnIiNUpxTcjkUD9sjPg2Choo/4in09jcazcVpZzzKmnuF6lT7x4LHrktuP1bzZc9J0IMaJJmQ4F3y98BR4BpXPy5yU0AxTVAwJ7arC1cT4HY7wvHqbfHfs0H0kwTj9ick/ZBXX53q+5qo+i6QibJaiJaeWFLHM5fJST/rs+Xbq+56sqjfyyWem429/POuT2hVRZ0vyXtLYlk45ICjyvpSGqscY4QHrj0Lbr8UWkcGyu9FGXadWlLiq5BLC+ryj1wWTwIVh2xJYkQ9/gCWybaMeuvNp4yr0n7aWCxfZkzeERVaNz6URxX9WtFIeLbxWS4ZfTr7X1Nb1FLdaTtkwIULXPVgxks6/6f6iiFU9xN2pdPgSipETv+Qa1JLknAF0/9GWoDsdPP6NhNo3/EurFAapQoksUPI343ErF6lSldtq/QvoxJkZgFoUclLRR375HTYw/9+D+Fjpt2+Ad9Pn7aOt4lY32mi4lJ+jwWebTqkGWHt6g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6506007)(186003)(86362001)(91956017)(66556008)(38070700005)(316002)(38100700002)(2906002)(2616005)(44832011)(8676002)(6512007)(5660300002)(66574015)(71200400001)(122000001)(64756008)(36756003)(31696002)(31686004)(66476007)(508600001)(6486002)(26005)(4326008)(8936002)(6916009)(66446008)(76116006)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WjgzL0JwbUFjQ1ZQYU1LQ0Z1RUE3M1JzZEtLWkZFZWZVNkFCYzlXV3BFOUs2?=
 =?utf-8?B?QkpjVzdDWllRNmpsQyt6TmFETVlPMytRcHFuVGJtdUhHNnJlVGxMZ2lSajJR?=
 =?utf-8?B?MFRGTURWaWYva0EyNFpXbmdiem1KWjVPaUQ4RFpMS2xnTmVXZUdMdkR6ODIv?=
 =?utf-8?B?UjAxOFA2cHZsSEZNekhMQUhnZ2VBaXA5R2k1VEo5cmdITzB5WkQzV2xhcUZq?=
 =?utf-8?B?bHI1ZklOSnBpekRaUkpEWGZuL3AxRjZGcnNjcXRvVjFsTkd1ZE5CWnpoZks0?=
 =?utf-8?B?QmVPOFU3NWd1elN1M2hVM0I4NWl6WWwxSDVlSlFRVStEdFh0QlJVcWdiMXB3?=
 =?utf-8?B?YjRPbjlSUUtqam1WWFFnU3JObncyRUk2cUZGbGM1VjcxWUdpM2YvaVFGT2NL?=
 =?utf-8?B?WDZwRHRBZkV0Z3I1ZjJXeko5RWhyYjkrZlo3Nmwxb3lXSTY5WmcvejM2Wkdm?=
 =?utf-8?B?M0tYT1pHVURKMFVEYzcySHAzN09hWlR5aGVmSXhOTm96VUQ0blBpZXNaMkVU?=
 =?utf-8?B?N0hjOFQxOHJxQ3IybGh6RVZjWGgrMzk5ZzkvUlYxRDlLUk43MUpybnhxajBC?=
 =?utf-8?B?OUk1dS84TkZhMHd1SkxkRlUxWEFPVXQ3NWRDUEc2d3hMUDR5T3paa041a2I5?=
 =?utf-8?B?MDBWck0xblB0SDREV2QzS1YydHNtU2gzc3BvWTZ4d2VXdTZxM2hYZ0lZeFVS?=
 =?utf-8?B?M2cvNXpNTFJYL3NFemRNUStCU0d0OUEzRHVCcXpzRkNhWGpyaVdnVlFDWUlD?=
 =?utf-8?B?Z1V1QnVZcVBYVHlOdDY4Y0l3VUVLQlZlZ2ZnZ2dJSjVHQ3BLMmJHWGxuTFVF?=
 =?utf-8?B?a1FVY3preUR6VTdNSGQ4dUc5cU9Xd21nS0lCalJ3VXlLWEV2TVZDUWp1MWhl?=
 =?utf-8?B?SitpMGJ3UStjZHErMlVHdDd6d04zRHFCZmhiWEkxbURjQVFlckN0UDFNaHRk?=
 =?utf-8?B?Tmswc0FOWU1Qc2Q5Q0FVRy9CMDdQSFhKQkdTK0Fkd2tmUE1PVVBiTTlNRHBI?=
 =?utf-8?B?eVhJSWxFTzhOQlcxbGhERS9Nbk9tajJ6YU1JNHVNVTRYR2cwak9oY3l5Vkc5?=
 =?utf-8?B?Z2ZkTXhydHlEY0JlYWtOM25ySjRBd0tlNGxHWmduZTBwSFZ3SG9WbzBESXFV?=
 =?utf-8?B?bnJsUFhCVVJNMXRGUDRGNTVhSG9WenNKeVJZeTRKbUtRd1puYWVvVk00Ulpr?=
 =?utf-8?B?YzlCM3VERDRuZmxEQTVsRElDQWFWWU12VjVla1J4bXA3WDAyTHY0VjlZTVE5?=
 =?utf-8?B?SktKQ29yczhrdWlROVRVUUVUT2xLSk0vNnBNb2Vsd1RjYVNWTS9lZjFKaTdN?=
 =?utf-8?B?cDlwOTI4UDFuUDJtWkNNR2xDVitrQzFKbmxra2JYMnlBVkxnbnc4UWxPbm1p?=
 =?utf-8?B?SWo2b01heHNnTVl5VmVrUmt2NFBHQVlNTmVndThtZkllSSs4Yjc5QWNrRGRG?=
 =?utf-8?B?SmhsUDBxQ2NJMW1zL1pDb05ndUdjMHZJMXRZenYyYXFRV25KbytKRmF1cTla?=
 =?utf-8?B?ZUQvMUJiZmdqeS8vam9UOTRRN3RkVHlpdkM1QnozU005RDJkbHNHQUhSdTB6?=
 =?utf-8?B?b1EvQXJZdmtxT0dyYUNta1ZtTldvc3lMRmJ5YUtLOVg0Mmw4ZWJMV0xpNXdB?=
 =?utf-8?B?OHJ5azlTbEJmcm1XT2pIaGtuK3Y2ek9zMWJkdHo0Q1ZDVndvUkIra0lMWUsr?=
 =?utf-8?B?VlI4VktuZ1lVQksxMHBIZ21PSmJuY3gyU1MyMUdZdVFKdnhrQzJTakQzRTJS?=
 =?utf-8?B?QWo4U2NUTlNyajNwdFZiSkpZNnRqRnRsOVNIdE1WUm4rSkRVVmQvVDVsNUpU?=
 =?utf-8?B?czZmRGgzMDNDVWZhVjdlb043bVRhOFpOenBWTTNSOVRFRDh4YjJXQlQ5WXdZ?=
 =?utf-8?B?NW80aWN2T3pBWnBDV2F2dndWVnJlbG81SktMQWVNOVBUQStTNW1CaWNDRk1W?=
 =?utf-8?B?MW93MlJyYllORFRmWGI4THdpd0JzU1U3cFc3L2RaQmJNMWRiNDUvd0RRRi8v?=
 =?utf-8?B?aW1hWmtxM1pIUFJYRkJQM2tmdmJTcFhxczZSeTl2ZDR1bUxpOVBRNURNUXdE?=
 =?utf-8?B?NEpnNzFhc251ZERyUEdZN2F6ei9DYURYT0VoQjZwSjhlNkdJeGRQMUtjQjZB?=
 =?utf-8?B?d3Y5OEdsbnR2aTN5Nk0ySjUrZi82S1Ftem94aHRTWkxXVjZuYkJUTm1vTGd6?=
 =?utf-8?B?LzVUUG1kQkp1NWFqQWlVR202dTRya1ptOGZmczRPdEVacWxrK2poaTRpSjlK?=
 =?utf-8?Q?+xJjynjemeblM94NUJsFdZDA3UlK1e58LZ4g2RKgF4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F72FBB25C87841449899A39CB429A222@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c1c7a98b-17c9-4895-b5e8-08d9d4ca675c
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jan 2022 06:20:03.1779 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P4YnRefLjl3Zgqte/IWGPuncsnvLgcL/Tsg4akF0yKCkt5BOkQiZuqiNaATQaVQd1sIpnXZPxj/OL2K701wjwnthDOw3ZV1nBjqZAhn90kA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR2P264MB0724
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDEwLzAxLzIwMjIgw6AgMTM6MzIsIE1pa2UgYSDDqWNyaXTCoDoNCj4gSGV5LCBzbyBJ
IG9yaWdpbmFsbHkgc2F0IGRvd24gdG8gY29tcGlsZSB0aGUgZmFzdCBoZWFkZXJzIFYyIHBhdGNo
LCBidXQgDQo+IHF1aWNrbHkgZGlzY292ZXJlZCBvdGhlciB0aGluZ3MgYXQgcGxheSwgYW5kIGdy
YWJiZWQgNS4xNi4wIGEgZmV3IGhvdXJzIA0KPiBhZnRlciBpdCBsaWZ0ZWQgb2ZmLMKgIGFyY2gv
cG93ZXJwYy9tbS9tbXVfY29udGV4dC5jIEkgaGFkIHRvIA0KPiBzcGVjaWZpY2FsbHkgc2F5IGhh
ZCB0byBpbmNsdWRlIC1tYWx0aXZlYyBvciBpdCBiYXJmZWQgb24gYSAnZHNzYWxsJywgDQo+IEkn
bSBmaW5lIHdpdGggdGhhdCwgSSd2ZSBzcGVudCB5ZWFycyBpbiBrZXJuZWwgbGFuZCwgSSBjYW4g
ZGVhbCB3aXRoIA0KPiB0aGF0LCB0aGVuIGNhbWUgYXJjaC9wb3dlcnBjL2xpYi9zdGVwLmMgd2l0
aCB0aGUgcHRlc3luYy4gVGhpcyBzZWVtcyANCj4gbGlrZSBhIHRvdGFsbHkgbm9ybWFsIGluc3Ry
dWN0aW9uIHRoYXQgc2hvdWxkbid0IG5lZWQgYW55IGV4dHJhIGZsYWdzIG9yIA0KPiBhbnl0aGlu
ZywgeWV0IHRoZSBhc3NlbWJsZXIgdGhyb3dzIHVwLCBhbmQgbm8gZmxhZyBJIGNhbiB0aGluayBv
ZiBmaXhlcyANCj4gaXQuIFRoaXMgaXMgYSBHNCA3NDQ3LiBJIHJldmVydGVkIGJhY2sgdG8gdGhl
IERlYmlhbiA1LjE1LiBkZWZjb25maWcgDQo+IGJlZm9yZSBkcm9wcGluZyB0aGlzIG1haWwgYXMg
SSBoYWQgdHdlYWtlZCBteSBjb25maWcgdG8gYmUgbW9yZSBHNC4NCj4gDQoNCkhpIE1pa2UsDQoN
CkNhbiB5b3UgcHJvdmlkZSBhIGJpdCBtb3JlIGRldGFpbHMgYWJvdXQgeW91ciBzZXR1cCBhbmQg
Y29uZmlnID8NCg0KQXJlIHlvdSB1c2luZyBHQ0Mgb3IgTExWTSA/DQpXaGF0IHZlcnNpb24gb2Yg
R0NDIGFuZCBCSU5VVElMUyBvciB3aGF0IHZlcnNpb24gb2YgTExWTSA/DQoNCldoYXQgaXMgREVC
SUFOIGRlZmNvbmZpZyA/IERvZXMgaXQgY29ycmVzcG9uZCB0byBvbmUgb2YgdGhlIHN0YW5kYXJk
IA0KbWFpbmxpbmUga2VybmVsIGRlZmNvbmZpZ3MgPyBJZiBub3QgY2FuIHlvdSBwcm92aWRlIGl0
ID8NCg0KVGhhbmtzDQpDaHJpc3RvcGhl
