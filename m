Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C79948AAD7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jan 2022 10:52:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JY5Zv6fyhz301v
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jan 2022 20:52:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::616;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0616.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::616])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JY5ZQ2VlKz2ymt
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jan 2022 20:51:53 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dsM0IFwNf+DzBrka0rh+GVLwjHKYxuEEJrxtKr0Nv+n9hEU6/6raWJkKM5Qmr1HkXd4YwffqYzXL1tCmCD/KGz3OlHEkb7uPVQsJiFfDzhFoU7NosW1aSs66OXGeCdt/Sg4LOQkOrIvBIoAX0BHi8vB9sRGYJhvuM4YGiLv6YGoBvAMO4JG8Fi6hVxGIq5tMP6PU+K2UAVIhJR7CyQlV/J6zfQ4Uhg1SJRAgdBhkSZx1wr4VT4yURRMcy0b6hzp93VtIaBeQRvMvweVrSfdB861Gcx4+sDS86ctNtLv/eyY7X5FEDjpdtN4dAATH2IPYTqZVbjtE2xyPjKaZpACjOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R0fZwLzC4ANM0TkmJI7fe3RKLMGcEfBWtqNYdL1KTIA=;
 b=EJLlXFW9MhbCKEuA8S/tgAEal57RuXZqCv88N7YZIPCKHM0RmPgyHs31KW3HjDIIwCTak31ZpJzHzhz+cOiuzet7led9DfbxOkvp0gqFsL4oM46IZYtRFAppVNiQA01UHYclQG7uHMvptvP64xJFTno9wNslSJakyVJtWpVtFLswSR/FkCd+OLBXwEB6wkeK7zogE/jT8XbPoYMtbLJrNyce6ayM2mxR3X4YqlLrUmFBtwG/3bClHzzkN2MWWBxzov6kVwP+HfUMVRnhyAM8WINYAED765VEa8xTAvc3FON0+YjmsUxBbFIbLvvOH8vMjoga7LFSeUFDkI13fGF/fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR2P264MB0145.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Tue, 11 Jan
 2022 09:51:29 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5%5]) with mapi id 15.20.4888.009; Tue, 11 Jan 2022
 09:51:29 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Mike <michael.heltne@gmail.com>
Subject: Re: [5.16.0] build error on unrecognized opcode: ptesync
Thread-Topic: [5.16.0] build error on unrecognized opcode: ptesync
Thread-Index: AQHYBnGmeXPLkMwKP0WsDZHojSQnxaxdWaaAgAA1v4CAAAVUgA==
Date: Tue, 11 Jan 2022 09:51:29 +0000
Message-ID: <3b039cad-be82-3376-144c-bdee09c7adbf@csgroup.eu>
References: <CANtoAtPcRGHafb7LddtrY5g43m82txS_mY3WO_ZtJ+pfuLvKaw@mail.gmail.com>
 <b14be6fa-f3c1-4a40-6714-378c9ad45fcd@csgroup.eu>
 <CANtoAtOVjnvvti1rnrwpR9ybvpQJzjq48tdQbhsqJWncgoTmbw@mail.gmail.com>
In-Reply-To: <CANtoAtOVjnvvti1rnrwpR9ybvpQJzjq48tdQbhsqJWncgoTmbw@mail.gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 644e5cf4-4d67-44ff-3cb8-08d9d4e7f10b
x-ms-traffictypediagnostic: MR2P264MB0145:EE_
x-microsoft-antispam-prvs: <MR2P264MB01455B23C3923A036E29A7DFED519@MR2P264MB0145.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zzfOxN5ktnMYZiAvlBmZLBBFCztPzNvRFEtxVZVdZojFHKZxR68z5WY/dv0JS3Vr0jot7vZzjYr0OibA2wmvmVyGa8o8hP0gnxiwk0aisPncsw6eSnQIvXAx/dLIVSwSloG8CW9xdkGzW1xdu/4HrpXaboDffHy03/t/F0GvWj09CqEgissFijGpDmfv09auqIsZ5PBBAl6HCjfDo8xJXqrJY/9FMzizHZfIwrpbGVhx5sFgVUUmP73GT8y/ijmK3P2k+e8qeACBAAxykq+XcgxiJBXMytsJtIkTNdOgh2xKob0HB/yVT2Fefn33tKJT1WYf2bx53Mr+cEntOrXd6eMhaD55XiMlZ/pxHSCxoQaaRLvJngnlhEGEYEZf1ZNJjvXD+oyhvh6ep7hJ6AGaRCoiQ5oJg+0AXYs4PE1GEBs2jRI3adCzHPTbFL0umocsx5omN4j164wxzHDJ79VbrW9u2PK3TyY2U8Y1xlmpyv3vqHfU7KEPTbF67oXoV7weXj4m/LVO+niV9sQwcwZ2BAXENN4Ziabc0qJWrQ8c4XGvwQLb96IEkkSPfuXMSNsKZIrerBGZAhC3gTkMVKT8vWESHlf1ClKjGk0FB70xdbsZp9S0USOV4j4yVpd/v1dtUOAGMwwK3bi8BnYiI3q3kK0uG47UX0Nrg/x5W6xhvpxmo4E0DhK7lDtKLOjh/QTt1t8iJAN7d7Wt4/nTUG2JsbOiRNmV2kX2jJbMYKunYXvGqgBn3JF72MzV+LW440bn1IXSbJJtUlXwaozrYTHiCGpM8F7GoUjUmQQuAAXmysDXEIXnk+dp+n0wMt3bkjmUBM4yXxJlzm5y3txK1c9afAdmY3jNlciW2M4UemifsMs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6916009)(8676002)(66574015)(8936002)(6512007)(508600001)(186003)(38070700005)(4326008)(44832011)(5660300002)(71200400001)(6486002)(26005)(2616005)(966005)(6506007)(36756003)(316002)(31686004)(66476007)(122000001)(31696002)(86362001)(2906002)(76116006)(38100700002)(66946007)(83380400001)(66556008)(91956017)(64756008)(66446008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eE41ZmYwQ0lITkdOZ1RUcCs3KzV6dncyVVN4WkhrM1IwS1FkNERUS09ESzFq?=
 =?utf-8?B?YXNVQW83aUp1a3BtNEhNcHZ4VWR3RTZJaDRyZit5bHNYRCtaK3prczJBTDQ2?=
 =?utf-8?B?VkFTSzhiT09nbXVTdkpiMXBxd3EreXptR204K2dLQW8weFhQeFVWcGdta1JI?=
 =?utf-8?B?c20vK3hxaUpVaThNdG5wdnYyYVJSRnVtTE1EdTRqNFZxOGJ0b3lZODRiaFBD?=
 =?utf-8?B?dXIwUllPQllMZ0dpYlZocDU5ZU9FWUlrU1dQc1JoMkpsOUFXU2pibXYzTFk3?=
 =?utf-8?B?b1RBaDVnQ0FOVlEvQmVjeTRqMXd0TkZEaG5zZy9COC9qM0l2ZURNcGhlQ2lz?=
 =?utf-8?B?eHluQ3FrSEE4WXlVc3g2UG04blI4Qlp0akhLU2Z3ZHVlYlNhMnF2THpmWHN5?=
 =?utf-8?B?b0ZhZFZoOURFbnhUbEZtNHNXeXMrNU1GeEN5S1RaZFZ1Q3dyUjJaZ2ZzUytL?=
 =?utf-8?B?V01sMGcwUUY2alpiVWUyODhGSHlVNEsyZFBrQlFyd3JsQXV1Qm5NbkdBcWts?=
 =?utf-8?B?cVM2VCtxY2k4Y3VYaXd0VE56UUR0enBBeWtNOE9yVEYvMUVhR255eko5cW50?=
 =?utf-8?B?dWpMRWNTSzRISE5mWGFVK2NHdFJ3V2tXNS9BUUdJTWdjZWE0Zmp1cDRsME1F?=
 =?utf-8?B?cXg1YjRsd3dyMzdnMHQ4YmVteHNPdlJubXFXZ1loV016cGJieXJGeFVVaFNK?=
 =?utf-8?B?N1JnQS9IVk5SNTFiR3NXS0dDc2NjMDNNU1p6ODlEK0pxYy96MVNabW9TZXZ3?=
 =?utf-8?B?QnQrS1M3bkoyVmhXeUhGaW5jeEFucTJKWHJNZnVXZGQwdnpFRW1XNjZ0VFpS?=
 =?utf-8?B?OXFsOEp1UjkzQU9oZlVmVEh4Nkd6MjVNdHJUalpjeWd2Nm51Zks1VzlQVTBI?=
 =?utf-8?B?eVNkMmJvWHhNcU9LdzMxZlVqUEdTbEtPdkVucVF0R3BMWnBJTDk1dEl2WXVu?=
 =?utf-8?B?dVQzYmRyTmZ6SlZDaFpyQTlITmJkTjB0Si9nWTA4cTVPMFVCSmF2ZnhvSEwv?=
 =?utf-8?B?RG9rM1BCamhOamlPTkpVL2pJOXNvUmk2VFpRd3EvZ3I1SU9QRmc5djBXTXRD?=
 =?utf-8?B?Z2NPaFQweW1DZTU4SE9NSnpnRFdKakFIam01NDlxL2NvaXhlcHI1R2JYUlB4?=
 =?utf-8?B?UUVEU1RIK1ZCMDE1eWpKblJiUy9SS2lBMDlWdnhyeGFEaC9jalo3aWtIV0dB?=
 =?utf-8?B?eWxyU2dQTTQrU055V2hxU2N5Qi9uNEJqSjc0QkNCaG5mRm1kUXk1ZTBVQUlx?=
 =?utf-8?B?Mk13bHVvVDNhWXF5RzZ0VzVNS2hEcE9kTkNtSDZFVHdJWVAydjhNaHpYaFBv?=
 =?utf-8?B?cnZDM0l0ZFpsODhiYmttTUxrYkVSU2hCQXkzY1lUWHNVaFJqSUZXcXY2MkM3?=
 =?utf-8?B?YzBjbEsvSFkrQnp1VGd2aXFQZmFTMEsrTEtYdm4wYnFrZ2x3M3A0Skc4QUs5?=
 =?utf-8?B?eWlUSERKZy95OHpyeHg0OGpVaW5lWDdKRk1kK1Vkck5SUG1Wdm9PeFNOckNs?=
 =?utf-8?B?ckErNHRKZ3FQMkdLV1lXdkNHV0htMEphQmNjUjJ0NG5TQ2s2aStxQklob29y?=
 =?utf-8?B?YlV4ZnFBSlltRkxpMVAvQ2taQzg1ZlQrWTVWbk0zMVloN0N3Z2MvMEZkYTA4?=
 =?utf-8?B?NVVjOWZEMVFES2tZaEwyOVErVkNZTGNCekJuaUcyZitEUVduMVBHQjhscUZQ?=
 =?utf-8?B?UEhBQ2o5THVVMDZnN2EzOU14L0lBckd0cXZIa1JRVVlQNUNLZnhTbWllMlY3?=
 =?utf-8?B?Nk5LL1ZYSkNPMkNCTSs0VTR6WEtNeWtkSHZ4VmFtMUc1bFB1MlhZYzM0T0hH?=
 =?utf-8?B?N0VITEdmbW40VVhTTlBhbjNQTEpOS09VWk4vVU1wNmlDSDMrZTh5cU5xR25Q?=
 =?utf-8?B?c2VRWmYraW9MWHprWFBVekNLNjB0cDBER2k0aUxMS0Q3SEFPT2FkV2h4N0dx?=
 =?utf-8?B?K1cycW1RVllqY21tVmtJVG1UQ0tpd2w0Qk9URm80OCtvdzg2cU1wUnNOTmk3?=
 =?utf-8?B?azdIYWJhQkFvQnMyT3p0NGJnSFRVVTRUWXJ3bjZkWEhydXpHd2ZUcWpGbXZP?=
 =?utf-8?B?Rk40RUVnSWtlWXlqOHdEWlEvOXZFbEpYMkd3RytjcmZ6NjBYSWFVNXJtejRz?=
 =?utf-8?B?ZzFLcit2NHRHRGZHdk1vMkxXbk9JZ2QyVnJCY2x5azZRNHFPMGxiR0dXci9v?=
 =?utf-8?B?ZkRadk4vVlpFaDlyZElOVlFLNzdSRnJ1eHFEczM2bjVFd1c0V3d3Qlg1QWtn?=
 =?utf-8?Q?sws30WcYs67HedUl0yCKqwyNBj0o0X1UaOWbhburm8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F74DA316E068CE45A9D3D83D954439B2@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 644e5cf4-4d67-44ff-3cb8-08d9d4e7f10b
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jan 2022 09:51:29.5590 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: is4p0H4CIJFBTDUIPXn5MDdknu/uCbsEWnTyL1MqVcF7kIY3b/fu3U/9i9Psz3ConetKxeQ5+MfeRIYGL4b5MNfM8v8hNZv0ZGv/q8Zmb8Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR2P264MB0145
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

DQoNCkxlIDExLzAxLzIwMjIgw6AgMTA6MzIsIE1pa2UgYSDDqWNyaXTCoDoNCj4gSSBtYW5hZ2Vk
IHRvIGZpeCBpdCBpbiB0aGUgZW5kLCBwYXRjaCBhdHRhY2hlZCwgdGhvdWdoIGkgc2hvdWxkIGhh
dmUNCj4gZG9uZSBhICQoY2FsbCBjYy1vcHRpb24tLCAtbWFsdGl2ZWMsIC1tYWJpPWFsdGl2ZWMp
IGluIHRoZQ0KPiBhcmNoL3Bvd2VycGMvbW0vTWFrZWZpbGUNCj4gICBJIHdyb25nbHkgYXNzdW1l
ZCB0aGF0IHRoZSBtYW51YWwgaSBoYWQgZG93bmxvYWRlZCBhdCA0LjQ0YW0gd2FzIGZvcg0KPiAz
MmJpdCBwcGMgb25seSBhbmQgZm91bmQgcHRlc3luYyB0byBiZSBwcGM2NCBvbmx5Lg0KPiANCj4g
YmludXRpbHMtMi4zNy41MCAtIEdOVSBhc3NlbWJsZXIgdmVyc2lvbiAyLjM3LjUwIChwb3dlcnBj
LWxpbnV4LWdudSkNCj4gdXNpbmcgQkZEIHZlcnNpb24gKEdOVSBCaW51dGlscyBmb3IgRGViaWFu
KSAyLjM3LjUwLjIwMjIwMTA2DQo+IGdjYyB2ZXJzaW9uIDExLjIuMCAoRGViaWFuIDExLjIuMC0x
MykNCj4gbGQubGxkIGlzIG1pc3NpbmcgYnV0IHdpdGggTExWTS9DTEFORyBhbmQgTEQ9bGQuYmZk
DQo+IGFyY2gvcG93ZXJwYy9rZXJuZWwvdmRzbzMyL2dldHRpbWVvZmRheS5TOjcyOjg6DQo+IGVy
cm9yOiB1bnN1cHBvcnRlZCBkaXJlY3RpdmUgJy5zdGFicycgICAgLnN0YWJzDQo+ICJfcmVzdGdw
cl8zMV94OkYtMSIsMzYsMCwwLF9yZXN0Z3ByXzMxX3g7IC5nbG9ibCBfcmVzdGdwcl8zMV94Ow0K
PiBfcmVzdGdwcl8zMV94Og0KPiANCj4gQXR0YWNoZWQgdGhlIGNvbmZpZyBpJ20gdXNpbmcsIGFu
ZCB0aGUgZGViaWFuIGNvbmZpZyA1LjE1LjAtMi4gSXQncw0KPiBzdGlsbCBidWlsZGluZy4NCg0K
T2ssIEkgdHJpZWQgd2l0aCB5b3VyIGNvbmZpZyBvbiBteSBGZWRvcmEgQ29yZSAzNSB3aGVyZSBJ
IGhhdmU6DQoNCnBvd2VycGM2NC1saW51eC1nbnUtZ2NjIChHQ0MpIDExLjIuMSAyMDIxMDcyOCAo
UmVkIEhhdCBDcm9zcyAxMS4yLjEtMSkNCkdOVSBsZCB2ZXJzaW9uIDIuMzctMy5mYzM1DQoNCiBG
cm9tIHBhY2thZ2VzOg0KLSBiaW51dGlscy1wb3dlcnBjNjQtbGludXgtZ251LTIuMzctMy5mYzM1
Lng4Nl82NA0KLSBnY2MtcG93ZXJwYzY0LWxpbnV4LWdudS0xMS4yLjEtMS5mYzM1Lng4Nl82NA0K
DQpBbmQgSSBkb24ndCBoYXZlIHRoZSBwcm9ibGVtcyB5b3UgbWVudGlvbiwgc28gaXQgbXVzdCBi
ZSBzb21ldGhpbmcgDQpzcGVjaWFsIHdpdGggRGViaWFuIEdDQy4NCg0KDQpZb3VyIGNoYW5nZSBy
ZWdhcmRpbmcgcHRlc3luYyBpcyBwcm9iYWJseSBPSyBidXQgaXMgZnJhZ2lsZSBJIHRoaW5rLCAN
CmJlY2F1c2UgZm9yIGluc3RhbmNlIHRoZXJlIGlzIGFsc28gYSAncHRlc3luYycgaW4gDQphcmNo
L3Bvd2VycGMvbW0vcGFnZWF0dHIuYyBhbmQgcHJvYmFibHkgbWFueSBvdGhlciBwbGFjZXMuDQoN
CkFsc28gcGxlYXNlIHByZWZlciBDT05GSUdfUFBDNjQgdG8gX19wb3dlcnBjNjRfXw0KDQpSZWdh
cmRpbmcgdGhlIERTU0FMTCBpc3N1ZSwgdGhlIGZvbGxvd2luZyBjb21taXQgd2lsbCBwcm9iYWJs
eSBoZWxwOg0KDQpkNTFmODZjZmQ4ZTMgKCJwb3dlcnBjL21tOiBTd2l0Y2ggb2Jzb2xldGUgZHNz
YWxsIHRvIC5sb25nIikNCg0KUmVnYXJkaW5nIHRoZSAuc3RhYnMgd2l0aCBMTFZNIHRoZXJlIGlz
IGEgcGF0Y2ggYXQgDQpodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvbGludXhw
cGMtZGV2L3BhdGNoLzY4OTMyZWMyYmE2Yjg2OGQzNTAwNmI5NmU5MGYwODkwZjNkYTNjMDUuMTYz
ODI3Mzg2OC5naXQuY2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1Lw0KDQpUaGFua3MNCkNocmlz
dG9waGUNCg0KDQoNCj4gDQo+IENoZWVycw0KPiBNaWNoYWVsDQo+IA0KPiBPbiBUdWUsIDExIEph
biAyMDIyIGF0IDA3OjIwLCBDaHJpc3RvcGhlIExlcm95DQo+IDxjaHJpc3RvcGhlLmxlcm95QGNz
Z3JvdXAuZXU+IHdyb3RlOg0KPj4NCj4+DQo+Pg0KPj4gTGUgMTAvMDEvMjAyMiDDoCAxMzozMiwg
TWlrZSBhIMOpY3JpdCA6DQo+Pj4gSGV5LCBzbyBJIG9yaWdpbmFsbHkgc2F0IGRvd24gdG8gY29t
cGlsZSB0aGUgZmFzdCBoZWFkZXJzIFYyIHBhdGNoLCBidXQNCj4+PiBxdWlja2x5IGRpc2NvdmVy
ZWQgb3RoZXIgdGhpbmdzIGF0IHBsYXksIGFuZCBncmFiYmVkIDUuMTYuMCBhIGZldyBob3Vycw0K
Pj4+IGFmdGVyIGl0IGxpZnRlZCBvZmYsICBhcmNoL3Bvd2VycGMvbW0vbW11X2NvbnRleHQuYyBJ
IGhhZCB0bw0KPj4+IHNwZWNpZmljYWxseSBzYXkgaGFkIHRvIGluY2x1ZGUgLW1hbHRpdmVjIG9y
IGl0IGJhcmZlZCBvbiBhICdkc3NhbGwnLA0KPj4+IEknbSBmaW5lIHdpdGggdGhhdCwgSSd2ZSBz
cGVudCB5ZWFycyBpbiBrZXJuZWwgbGFuZCwgSSBjYW4gZGVhbCB3aXRoDQo+Pj4gdGhhdCwgdGhl
biBjYW1lIGFyY2gvcG93ZXJwYy9saWIvc3RlcC5jIHdpdGggdGhlIHB0ZXN5bmMuIFRoaXMgc2Vl
bXMNCj4+PiBsaWtlIGEgdG90YWxseSBub3JtYWwgaW5zdHJ1Y3Rpb24gdGhhdCBzaG91bGRuJ3Qg
bmVlZCBhbnkgZXh0cmEgZmxhZ3Mgb3INCj4+PiBhbnl0aGluZywgeWV0IHRoZSBhc3NlbWJsZXIg
dGhyb3dzIHVwLCBhbmQgbm8gZmxhZyBJIGNhbiB0aGluayBvZiBmaXhlcw0KPj4+IGl0LiBUaGlz
IGlzIGEgRzQgNzQ0Ny4gSSByZXZlcnRlZCBiYWNrIHRvIHRoZSBEZWJpYW4gNS4xNS4gZGVmY29u
ZmlnDQo+Pj4gYmVmb3JlIGRyb3BwaW5nIHRoaXMgbWFpbCBhcyBJIGhhZCB0d2Vha2VkIG15IGNv
bmZpZyB0byBiZSBtb3JlIEc0Lg0KPj4+DQo+Pg0KPj4gSGkgTWlrZSwNCj4+DQo+PiBDYW4geW91
IHByb3ZpZGUgYSBiaXQgbW9yZSBkZXRhaWxzIGFib3V0IHlvdXIgc2V0dXAgYW5kIGNvbmZpZyA/
DQo+Pg0KPj4gQXJlIHlvdSB1c2luZyBHQ0Mgb3IgTExWTSA/DQo+PiBXaGF0IHZlcnNpb24gb2Yg
R0NDIGFuZCBCSU5VVElMUyBvciB3aGF0IHZlcnNpb24gb2YgTExWTSA/DQo+Pg0KPj4gV2hhdCBp
cyBERUJJQU4gZGVmY29uZmlnID8gRG9lcyBpdCBjb3JyZXNwb25kIHRvIG9uZSBvZiB0aGUgc3Rh
bmRhcmQNCj4+IG1haW5saW5lIGtlcm5lbCBkZWZjb25maWdzID8gSWYgbm90IGNhbiB5b3UgcHJv
dmlkZSBpdCA/DQo+Pg0KPj4gVGhhbmtzDQo+PiBDaHJpc3RvcGhl
