Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF204A5C65
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Feb 2022 13:37:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jp4G61Z3jz3cRJ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Feb 2022 23:37:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::608;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0608.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::608])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jp4FY07Vyz30Nd
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Feb 2022 23:37:19 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JNpfdW6Sivk0MNngKJ3WtSy81fHtBso7fpKCnyPCCRb8yOGwDBV9jx9aRjhrp3BoNtCMmsHFqrqXELvIpd4W6mKinORaheD4NDtDO3M6+DKDjM0QUESYeP13TxCZae1CU58TuFXs2ysm5C5G3uJaDuvt3h56Ago/yf2vEOWT+TzXpokdxr1ntpxOhd+737gcV36Czmv83rclifbJrfwPZLv2JfYLGkKAohqQZ6t21NMeop9UgUCBm3l4uOIWj14IF9IX2O/6ZBJgyRu54jr3Wl5CFSYHt6/cn1saMrJQ+eJ0EDPUoW2T7zBmDuzgmwDRF0VDibiNnhRcPBKkQsqYgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6x/jsBViquIsP1CNHwap3oz/JpLSM+hnzA+o/6OXfpo=;
 b=MggcQtAlEECZr5FlhZ9G0jK/yByRZ/68ZyGbJxWcLx0gEZ1DOqmKi1ZIwWKkVk9NSz52g1CKBQmZYSfTaJ3qIGe8Sm887wPJGN3zZaQQlTRjwimgH53OuSVEoeTXScmoJ9x2y9VzYlYiWpC8mQ9P1MmfCJ8hHQJj3NK5qgXY4GbJfSkT5ROavw9wjK1XxwGjV4gPaxYLIQWYeZ76RFuDatwlTZzCT7FpCW99vK93REEmo8ze9+Wo/jcHKv4X9Roh254zfM8RWiNFjlE53YBjEUl2F5123dHfNmcstrpzVx2JE0LP+kW+7v5Xt5YxdH6ahRxGas72XOCxL4HZ4VT6eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB3515.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:165::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Tue, 1 Feb
 2022 12:36:57 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c9a2:1db0:5469:54e1]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c9a2:1db0:5469:54e1%6]) with mapi id 15.20.4930.022; Tue, 1 Feb 2022
 12:36:56 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Chen Jingwen <chenjingwen6@huawei.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul
 Mackerras <paulus@samba.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kasan-dev
 <kasan-dev@googlegroups.com>
Subject: Re: [PATCH] powerpc/kasan: Fix early region not updated correctly
Thread-Topic: [PATCH] powerpc/kasan: Fix early region not updated correctly
Thread-Index: AQHX/VN2itFQfqRijkarhHKQTpqeC6x+1iOA
Date: Tue, 1 Feb 2022 12:36:56 +0000
Message-ID: <f8d60f39-b78b-798d-f91f-53e0c6bf30a7@csgroup.eu>
References: <20211229035226.59159-1-chenjingwen6@huawei.com>
In-Reply-To: <20211229035226.59159-1-chenjingwen6@huawei.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8af5dfa6-aeb5-4fd0-0f53-08d9e57f88d6
x-ms-traffictypediagnostic: PR0P264MB3515:EE_
x-microsoft-antispam-prvs: <PR0P264MB3515B0AB178253B188902B6AED269@PR0P264MB3515.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pgw/NjKjOdzm9aBeoRqVeiD696RRWpgslJAaPaEYLuO5KbcVvIKWVDIbrugrMbeyda2dcWGgf7ObMgF87B+nuvORFpGarszDBQW73wu6sUpfqMq6RuxmCFmugTFXtkWjcV8CBM+bnQDN8WwXTlqujsrxu20dOsZd/UhQvPF/Txqf9RncT5Og78DfM/U8wY4AFKdAM1i3oT2AW+xmwSKa3s0Ncs3IR97KXZ5XhaSx3tRFIcsO6wFXGYhRTL0qkDjRGsK2CenB90vIr5nAYcL8IK9J96wrs5khCDWxgw0vUb8NhVSspeG+QnnheUS9iC/2QOieFrJqivu02tsjai2cHma3hhu+84uC/hoUabmx0Ynx1ILCUakehXFWCWULgF/OhP6yaP0C9Xh6/pyblNjfC84vo3hoHjE10/LMPIx4CVSMKK9BHWHLt3no0qCW1AZ4Y2/BqkXM+i4CahNuKrXkIGFAXWcQLeNzkpgHnw1QwWvZetpOPycl2VCTNRDcpMYdb6YFJmHQm2QrNcPhO7/w5mNLgFUmZV9z1bqaFNg7J5PtaToGAQnADnoDgWA+eprRzzZ9hYxKB958snlgWO4LoCfnGYikf0LNtHuC54YL/RGm530CtUWv2kvVvbvlw9gVXZhI5Ug4zkpvQVu/yf7AlOJG97pJ9jxjnrtQc6tDusQyInrwqSJX6RrIZiBDAAgaHR60mPBLiOpqtiuttwlcahHcCvWm42Ayh7K/yHKvu+zSTHBu/B+OdJpG8DNnNehjDSKy5Lx6TS7FL26xV3WYYw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(31686004)(91956017)(66574015)(83380400001)(15650500001)(36756003)(44832011)(5660300002)(66446008)(66476007)(64756008)(66946007)(316002)(66556008)(76116006)(8676002)(86362001)(8936002)(110136005)(6486002)(26005)(186003)(2616005)(71200400001)(6506007)(508600001)(122000001)(31696002)(38100700002)(38070700005)(2906002)(6512007)(45980500001)(43740500002)(20210929001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T1g1K0J2Y1RiYnNlWGdsc00yTitzTkdoN2FXUDRwbVhweEkzZGJzZXhrWnY0?=
 =?utf-8?B?bG9vSVZVK09ha250VlJ1b2pWN2lDR2o2VWxncGJ0eTBWa3YyYWhveHc5aTBI?=
 =?utf-8?B?U2NNL1FYcEphcTVLL3hPNVRwQkFIQXloUEowUFZobnZpMXdFYXhQaG1IQlJW?=
 =?utf-8?B?NEF0dnRsOXdQeGhweG1Qb0VLRkpHWDVJUGlnTUYybkV2b1Bta3FzRHlJTkdH?=
 =?utf-8?B?T0JXaTZWTUhkSlZFWmJ6SlRhY1JiWXNlU2ZjKzFBc1JkQ1Q4ZmY1Sno1Ykxs?=
 =?utf-8?B?L21rbVFNTHBHbzh1M29SY2pSWkhIeWI2Y2dmNS9JYjY3d3pPRnVnT08vTnpH?=
 =?utf-8?B?K3dId041bWo5QTB0b3RCMGJMemtzQWFTVFJ1M3ZseFRvaDU0VkhDWktLbmw5?=
 =?utf-8?B?TklhWkhhR1AwaU95aWtHZ1M1NldTTk1vOEMzUWRDdXBBdVpIUzlPc1VCSFMy?=
 =?utf-8?B?NENDNzFsOThUQnJMM1RnNURHcS9naEhtYWJZZXlBeXZxK1EyNWRkNEQzakVO?=
 =?utf-8?B?SGNKOXBpUDUyUzRKNFh3bmg0N0xNTkpGbUs0WERieU9TaUY5RFphekpoM2lx?=
 =?utf-8?B?U09hcXhzSU55Nm9iTDFmWkxUSHRqRERrdDhEOFRPUVVkSWFmRHEwM2pCaWt4?=
 =?utf-8?B?WDRoeGxTUWJDbXhTelRRZjlmeFc4aCtTZXcvNlVmMkkvQnk2U1htb08zalpL?=
 =?utf-8?B?STRUS2FnckFUWUVZNUJiNzN6SzRQRmY5d3lzdG54V2VPa1g2RERUeG5ZT1lY?=
 =?utf-8?B?RGlXZXgwK2dKNGhHZHBlcHd5dHQrZ3BiZ1c1R1dDQ21oK1NqOW9JVXRacGJa?=
 =?utf-8?B?WUgvNlN4aERObHp5bTRmRmVCcThGV3lmRHVqZ0tSb2s4UUV1ZklHYkpkN2d6?=
 =?utf-8?B?cjE0SlZBUE1WMWJxeEhYQVl1MnV4RjlVUWlob3NPaTU0UXl6VjFjT3Q0K2hD?=
 =?utf-8?B?a3NEektjZ2ZGcEFFRDJjZENkWVprVjdadExIUCtQc0lSQ2JJaUlUUzRsV1Y4?=
 =?utf-8?B?aGVJcGVIUkxLMk5JT3JxdjBXVUl5M0dSYjBOUE9tcHZPbktZVmNGbkw0ckg0?=
 =?utf-8?B?WHBuQ3NXZzgvNytHZlBST2FXcUFMa1VCakRGa21uVC9zSDdBcDFNa3BPeU42?=
 =?utf-8?B?YW5LbFRLK3JORTIwczEwVlN5anBjMjZwa3ZVendXTHl2SEdSaTA4T25WUUMy?=
 =?utf-8?B?SCtXcm1OazhNRE1EZEVLOXc5OExwR2JHd1Jrb2ozVU1qK0NIbmcxUmoyUUhw?=
 =?utf-8?B?QTBTS0VuVE45eEhORGJwZzBLek5nbDU0RFEySVVHellTSmRjT2JKaHJlOUZ2?=
 =?utf-8?B?TEpNN3BIaHk4TUVWTWw0VysxVE5vVXp6WlM5bTdQTUFTSkJ0ajZFTVFzMkk1?=
 =?utf-8?B?eEZ3cGN2RWgzUURFbXNqMTQxbGk5Wm9rTFZHNm90WVNucDFCbHZJMGw4QlNM?=
 =?utf-8?B?bnNYejBtODJxYUxtaVlBNTlnaS8zTCtpNzlabnBNOHM5THVnM25XN2lVQTJI?=
 =?utf-8?B?bFZSays5OVBJdXAzQVhVUmxNOS9NVGJMblBDUEozZ1Y3V1ZXaDgrdExQVWF4?=
 =?utf-8?B?Tnk5ZE1QLy9URjU2SDBsV0FLUGdGZEM3M2ZJcmlFdTZnYk1QQnJaeXg4NXhY?=
 =?utf-8?B?SlFZL0I5ODRUQ1RxQlFFV0FIais3ZDN6Q1dkSFdwM3QzNTBPWXMvWTJpNG9x?=
 =?utf-8?B?aGM5MUlVZ0ZoQk84cGxhNXBVcHBnZVBGcnVCdkJZUDBmT3NIOGtQcDA0YWg2?=
 =?utf-8?B?U0g5czRQcVFwbDZ2ZlIvY3cwcHM2S0kvOFBVeGx0N1BWK1RWc1kvYWVoK29R?=
 =?utf-8?B?eWtIVFhPRVdCdUx0SGRDYnJKZkxrbWhVN3A0MVd4Njc0RDV0RjNXRXJ5ZDVE?=
 =?utf-8?B?SmRRTFNmZGQ1dW54YWFJQTg2b1h4dlc2QlVCMis5bzZYK1V2NzNhSUh6cmFT?=
 =?utf-8?B?UmF1U2J3eFhSdW5Yc3Z2clBVQkxNQXBBbmF6bm1Ua3I2MFBidFVpSzJYUUlD?=
 =?utf-8?B?M05qZDdvNUxKOVprNkEzS1JjYzFMUXFlWTlEdEtlVmtlbzMweCtTcXlabDFR?=
 =?utf-8?B?Y3gvMG5qbmllU0JhTE5VMkRQaUNEaldHTWczWnd5YnpWaFhOK2FGcVFSZ0tU?=
 =?utf-8?B?MkttVDdFZjdLaUswSEd1SGt0QnI4QjlFRnpvSVEzR0J4bE0vVG1ERkRTWmRx?=
 =?utf-8?B?aFlnVzFNYzdSK0JqbVB6OEhIY215ZmhnV05pUjBuUVNPQVlpNTdVRUJXSnZn?=
 =?utf-8?Q?PnI5cd+S+owTRFhxMPUCDa8gW93e2zbiPnPJurK1Tc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5B164636F661E44EBBA66BEA065FED64@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8af5dfa6-aeb5-4fd0-0f53-08d9e57f88d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Feb 2022 12:36:56.8354 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /2FA5AID+ZtD7zfDNioltfyyHWw02zH0lIdUMxKbeO2R5cy7MabCJCjFwcfz38aOAAle/fbkwK31zAqiiWX0Yi1EPuJouYRv1vpwFOC8kgI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB3515
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI5LzEyLzIwMjEgw6AgMDQ6NTIsIENoZW4gSmluZ3dlbiBhIMOpY3JpdMKgOg0KPiBU
aGUgc2hhZG93J3MgcGFnZSB0YWJsZSBpcyBub3QgdXBkYXRlZCB3aGVuIFBURV9SUE5fU0hJRlQg
aXMgMjQNCj4gYW5kIFBBR0VfU0hJRlQgaXMgMTIuIEl0IG5vdCBvbmx5IGNhdXNlcyBmYWxzZSBw
b3NpdGl2ZXMgYnV0DQo+IGFsc28gZmFsc2UgbmVnYXRpdmUgYXMgc2hvd24gdGhlIGZvbGxvd2lu
ZyB0ZXh0Lg0KPiANCj4gRml4IGl0IGJ5IGJyaW5naW5nIHRoZSBsb2dpYyBvZiBrYXNhbl9lYXJs
eV9zaGFkb3dfcGFnZV9lbnRyeSBoZXJlLg0KPiANCj4gMS4gRmFsc2UgUG9zaXRpdmU6DQo+ID09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PQ0KPiBCVUc6IEtBU0FOOiB2bWFsbG9jLW91dC1vZi1ib3VuZHMgaW4gcGNwdV9hbGxv
YysweDUwOC8weGE1MA0KPiBXcml0ZSBvZiBzaXplIDE2IGF0IGFkZHIgZjU3ZjNiZTAgYnkgdGFz
ayBzd2FwcGVyLzAvMQ0KPiANCj4gQ1BVOiAwIFBJRDogMSBDb21tOiBzd2FwcGVyLzAgTm90IHRh
aW50ZWQgNS4xNS4wLTEyMjY3LWdkZWJlNDM2ZTc3YzcgIzENCj4gQ2FsbCBUcmFjZToNCj4gW2M4
MGQxYzIwXSBbYzA3ZmU3YjhdIGR1bXBfc3RhY2tfbHZsKzB4NGMvMHg2YyAodW5yZWxpYWJsZSkN
Cj4gW2M4MGQxYzQwXSBbYzAyZmY2NjhdIHByaW50X2FkZHJlc3NfZGVzY3JpcHRpb24uY29uc3Rw
cm9wLjArMHg4OC8weDMwMA0KPiBbYzgwZDFjNzBdIFtjMDJmZjQ1Y10ga2FzYW5fcmVwb3J0KzB4
MWVjLzB4MjAwDQo+IFtjODBkMWNiMF0gW2MwMzAwYjIwXSBrYXNhbl9jaGVja19yYW5nZSsweDE2
MC8weDJmMA0KPiBbYzgwZDFjYzBdIFtjMDMwMThhNF0gbWVtc2V0KzB4MzQvMHg5MA0KPiBbYzgw
ZDFjZTBdIFtjMDI4MDEwOF0gcGNwdV9hbGxvYysweDUwOC8weGE1MA0KPiBbYzgwZDFkNDBdIFtj
MDJmZDdiY10gX19rbWVtX2NhY2hlX2NyZWF0ZSsweGZjLzB4NTcwDQo+IFtjODBkMWQ3MF0gW2Mw
MjgzZDY0XSBrbWVtX2NhY2hlX2NyZWF0ZV91c2VyY29weSsweDI3NC8weDNlMA0KPiBbYzgwZDFk
YjBdIFtjMjAzNjU4MF0gaW5pdF9zZCsweGM0LzB4MWQwDQo+IFtjODBkMWRlMF0gW2MwMDA0NGEw
XSBkb19vbmVfaW5pdGNhbGwrMHhjMC8weDMzYw0KPiBbYzgwZDFlYjBdIFtjMjAwMTYyNF0ga2Vy
bmVsX2luaXRfZnJlZWFibGUrMHgyYzgvMHgzODQNCj4gW2M4MGQxZWYwXSBbYzAwMDRiMTRdIGtl
cm5lbF9pbml0KzB4MjQvMHgxNzANCj4gW2M4MGQxZjEwXSBbYzAwMWIyNmNdIHJldF9mcm9tX2tl
cm5lbF90aHJlYWQrMHg1Yy8weDY0DQo+IA0KPiBNZW1vcnkgc3RhdGUgYXJvdW5kIHRoZSBidWdn
eSBhZGRyZXNzOg0KPiAgIGY1N2YzYTgwOiBmOCBmOCBmOCBmOCBmOCBmOCBmOCBmOCBmOCBmOCBm
OCBmOCBmOCBmOCBmOCBmOA0KPiAgIGY1N2YzYjAwOiBmOCBmOCBmOCBmOCBmOCBmOCBmOCBmOCBm
OCBmOCBmOCBmOCBmOCBmOCBmOCBmOA0KPj4gZjU3ZjNiODA6IGY4IGY4IGY4IGY4IGY4IGY4IGY4
IGY4IGY4IGY4IGY4IGY4IGY4IGY4IGY4IGY4DQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIF4NCj4gICBmNTdmM2MwMDogZjggZjggZjggZjggZjggZjgg
ZjggZjggZjggZjggZjggZjggZjggZjggZjggZjgNCj4gICBmNTdmM2M4MDogZjggZjggZjggZjgg
ZjggZjggZjggZjggZjggZjggZjggZjggZjggZjggZjggZjgNCj4gPT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09DQo+IA0KPiAy
LiBGYWxzZSBOZWdhdGl2ZSAod2l0aCBLQVNBTiB0ZXN0cyk6DQo+ID09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KPiBCZWZv
cmUgZml4Og0KPiAgICAgIG9rIDQ1IC0ga21hbGxvY19kb3VibGVfa3pmcmVlDQo+ICAgICAgIyB2
bWFsbG9jX29vYjogRVhQRUNUQVRJT04gRkFJTEVEIGF0IGxpYi90ZXN0X2thc2FuLmM6MTAzOQ0K
PiAgICAgIEtBU0FOIGZhaWx1cmUgZXhwZWN0ZWQgaW4gIigodm9sYXRpbGUgY2hhciAqKWFyZWEp
WzMxMDBdIiwgYnV0IG5vbmUgb2NjdXJyZWQNCj4gICAgICBub3Qgb2sgNDYgLSB2bWFsbG9jX29v
Yg0KPiAgICAgIG5vdCBvayAxIC0ga2FzYW4NCj4gDQo+ID09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KPiBBZnRlciBmaXg6
DQo+ICAgICAgb2sgMSAtIGthc2FuDQo+IA0KPiBGaXhlczogY2JkMTg5OTFlMjRmZSAoInBvd2Vy
cGMvbW06IEZpeCBhbiBPb3BzIGluIGthc2FuX21tdV9pbml0KCkiKQ0KPiBDYzogc3RhYmxlQHZn
ZXIua2VybmVsLm9yZyAjIDUuNC54DQo+IFNpZ25lZC1vZmYtYnk6IENoZW4gSmluZ3dlbiA8Y2hl
bmppbmd3ZW42QGh1YXdlaS5jb20+DQoNClJldmlld2VkLWJ5OiBDaHJpc3RvcGhlIExlcm95IDxj
aHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+DQoNCj4gLS0tDQo+ICAgYXJjaC9wb3dlcnBjL21t
L2thc2FuL2thc2FuX2luaXRfMzIuYyB8IDMgKy0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJw
Yy9tbS9rYXNhbi9rYXNhbl9pbml0XzMyLmMgYi9hcmNoL3Bvd2VycGMvbW0va2FzYW4va2FzYW5f
aW5pdF8zMi5jDQo+IGluZGV4IGNmODc3MGIxYTY5MmUuLmYzZTRkMDY5ZTBiYTcgMTAwNjQ0DQo+
IC0tLSBhL2FyY2gvcG93ZXJwYy9tbS9rYXNhbi9rYXNhbl9pbml0XzMyLmMNCj4gKysrIGIvYXJj
aC9wb3dlcnBjL21tL2thc2FuL2thc2FuX2luaXRfMzIuYw0KPiBAQCAtODMsMTMgKzgzLDEyIEBA
IHZvaWQgX19pbml0DQo+ICAga2FzYW5fdXBkYXRlX2Vhcmx5X3JlZ2lvbih1bnNpZ25lZCBsb25n
IGtfc3RhcnQsIHVuc2lnbmVkIGxvbmcga19lbmQsIHB0ZV90IHB0ZSkNCj4gICB7DQo+ICAgCXVu
c2lnbmVkIGxvbmcga19jdXI7DQo+IC0JcGh5c19hZGRyX3QgcGEgPSBfX3BhKGthc2FuX2Vhcmx5
X3NoYWRvd19wYWdlKTsNCj4gICANCj4gICAJZm9yIChrX2N1ciA9IGtfc3RhcnQ7IGtfY3VyICE9
IGtfZW5kOyBrX2N1ciArPSBQQUdFX1NJWkUpIHsNCj4gICAJCXBtZF90ICpwbWQgPSBwbWRfb2Zm
X2soa19jdXIpOw0KPiAgIAkJcHRlX3QgKnB0ZXAgPSBwdGVfb2Zmc2V0X2tlcm5lbChwbWQsIGtf
Y3VyKTsNCj4gICANCj4gLQkJaWYgKChwdGVfdmFsKCpwdGVwKSAmIFBURV9SUE5fTUFTSykgIT0g
cGEpDQo+ICsJCWlmIChwdGVfcGFnZSgqcHRlcCkgIT0gdmlydF90b19wYWdlKGxtX2FsaWFzKGth
c2FuX2Vhcmx5X3NoYWRvd19wYWdlKSkpDQo+ICAgCQkJY29udGludWU7DQo+ICAgDQo+ICAgCQlf
X3NldF9wdGVfYXQoJmluaXRfbW0sIGtfY3VyLCBwdGVwLCBwdGUsIDApOw==
