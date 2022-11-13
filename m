Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BBC626F9D
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Nov 2022 14:06:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N9CPk1q5bz3cfF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Nov 2022 00:06:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=wQ4XFkaf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.49; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=wQ4XFkaf;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120049.outbound.protection.outlook.com [40.107.12.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N9CNm38d9z2xZp
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Nov 2022 00:05:41 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=du2DzHonopyBfL+IhrokckDpRrX/XLq4vwcjeVT80y9CM6ZFUmIREx6y5UkUwiEG9j+ajO8oClU/AcjCrfAv1BWaCQXiqEL0yLSvbniBDOUzKkzkAJoa25uyA5XqHKvxTW9B7rygHaf8lnwLTqbPbWA7XAhC+csuMW1MHRWbvUDYXjty+9YsmMKIqr1VHsNJyxnQYpFei6Qd4BM+aPXgGF3GaeKZiYCRxzdWBtBs6o+f6lhYXURcXWH4YYa5RZDWWmbMG2PvnplzpfMGWNbgpQsUw7OpDJEXZZZIO/zYIkmcbJus+2OVmCDJcB5974aH7X6xSLjYvKurrI6DjiegrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D4w5XZbH0L095SE9a7V/b9p7dbFE5xhk6+6IlP3LmcE=;
 b=L/hj+YlGDBnhSNojPYQiFy72xdsmA+vN81Dv/MqwL+F9VaIW37RLjNQ19B0/WgigXw8oyoIl0ctbCjE0y+5zK2fYRMCzbtbh2mob8xc4GW018zxN7S4ZzHOiLhbcHGL+SnnErwWGOvNRU5ySfvaFJrj8daG2Q3erw4F/XxRaYRRN2wZHwawYdqxmTwXxGGU19Ys67A0ucQICJCCEs/6FoO7f6tuTMeawbdb5kQ1mxLWF7Jj3bv7QlD38DynBz14CuEFZGXEAxluXpPIV7Ul3OLbkcAeBb42LaDD8KNLeWMqNpKi6w8z7nIHUgMR+sQFH6FesDrVQi5um17GeQ0KNng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D4w5XZbH0L095SE9a7V/b9p7dbFE5xhk6+6IlP3LmcE=;
 b=wQ4XFkafgV4wtVHyXMxbVuHHLuF2Hy0/LgTYn2M52JKxwj+UrwGv2NXwEMJpiElZ1hEk7THllC2xu9whtGoCohE2oVIRgjjGtsyHlbto+QSghlQ6S23AGN8FpYQNOo1FtcCVNCYNYGaRLv6bCFBgdAA/aIhca2NPPOisVBM8sNvVW7wcqDpVOPjNH61sM5DBHLr0pBKT3XeEIRKlSB40ZH6fN8bWI73NzVsfvUi6S18UxMGvoeScAOyZz0nSuUAIZg2/nlGu7mbofjqDRR9dhQ23dwgLx5jLoCyuNp6mpr1B26TUtlXwB708zvjFn1nIvWrDKVj314siENB4Lf0FJA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB3415.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:121::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Sun, 13 Nov
 2022 13:05:20 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6%9]) with mapi id 15.20.5813.016; Sun, 13 Nov 2022
 13:05:20 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "Steven J. Hill" <sjhill@realitydiluted.com>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: Writing not working to CPLD/FPGA.
Thread-Topic: Writing not working to CPLD/FPGA.
Thread-Index: AQHY9YLpkJXc6LB3EEecZVBlBVZV8a45azCAgABdTYCAAw2nAA==
Date: Sun, 13 Nov 2022 13:05:20 +0000
Message-ID: <f319e328-d78e-f4bb-56a0-1c8d5be6e1a1@csgroup.eu>
References: <8893e416-007c-f7b8-3b67-2ceec7db2e01@realitydiluted.com>
 <4521e89b-a05b-a7b5-4fe0-35f7c898eb8f@csgroup.eu>
 <f7bf5383-eebd-8ab9-59b0-4fc159d61926@realitydiluted.com>
In-Reply-To: <f7bf5383-eebd-8ab9-59b0-4fc159d61926@realitydiluted.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PAZP264MB3415:EE_
x-ms-office365-filtering-correlation-id: 02a2a629-ce6d-4c87-673f-08dac577b7eb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  6P7KX3HGNLSxng8hKKGrZNPUAQ2hBUWFPutrxyiZJjcWpQsWFXTypkIS8mgkalmtaBXySDeDMY/9PgLhudQbjlDwRkTJJe60Pe8XUWYKj07P0qOBhHZ51JsO1ZqF/rBOIcEsHyNJwL2xGhv2d3uJc8WYl739+qMrgmcCxA+sSMaxuFVhi4BXvmC6eFvZL3EdtD0xWisrW0M4w8OP/QvbEykBVkU6m9ovksndEzCRkRu2g8diB5OmVfmzk2QqJvr5/LOXfbIGfnsCX+wSq5O7ikskuSyePx1gal9oQ701P+ju5+cJD4z8nqN/gn23+3jhyFBK7mM6tewRgVKKLVx+IfA1mGVsE9mezZBb91Hyn7/qiLdOKo/nVIOmbNyS5ckLQIYviPizEBLnL16YL1MnQf9nEpjVg3ccpD8oMom8yrE5R+DOl8zPaTBrd/u66RMkL9c9p1mM6E3h/4YGv2Y3q4PwGEqh8MxkO3epYX/+riKCYOxDuihSz2rEtl8pB/GBeLBQoIje6Qz4HnGzRR2ZndASxfM8GGgt9bjZoH0oIrELvvL2uh64EeuGolT68Xb1t5bUaKMbBDD2Qt1oLZ4YcVEKhAEMrza8Mt2EnEedVWlu2XeMxap7WJprCrlOrwTiSj/dZXlr+IXxgVl2qDU0vvqcuJxQY9EjbTtFmEXGgESJ3J276wimVNMyG77nwUCVJ2e9MeoDIojI8FtExWMSCcqm9W9/rZ+k340ayznF33ytKq4sOI96rzrRJkGpGkY2A7fwlqDZcrqc2eWE5wIaAKCd/569+CqmUF1BSAqWr7WD/99ub2YoFZgsRCPC4xdSwfFZ+xoOtyzYTV6GcrRzX9C5aQTjfO3Bps7ItPW0GB8=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(366004)(376002)(39840400004)(396003)(136003)(451199015)(6486002)(41300700001)(5660300002)(966005)(8936002)(36756003)(2906002)(4744005)(44832011)(71200400001)(478600001)(38100700002)(83380400001)(122000001)(6512007)(26005)(31696002)(86362001)(6506007)(53546011)(66574015)(38070700005)(2616005)(186003)(31686004)(316002)(110136005)(66946007)(76116006)(91956017)(8676002)(66446008)(66556008)(66476007)(64756008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?ZGVLc1JhbmU5S3lYcWt6eHNsWTVqVmloQlR4M1UyNTd2ME1mOVhXWGxXTXRG?=
 =?utf-8?B?bkY2OHpsVU5aRjNMK3ZMYjVDMjJYMjZteVpSYUN6MWNVR0ZjTUlxRjFscVky?=
 =?utf-8?B?aTZTNlJEU201MXlST2FxTEg5bW9KWnRHUEdmVTd2TzFOSlJQQWcvOEhsMDU2?=
 =?utf-8?B?L2JOUVFFSkl6UW4waUpNc0RrMXQyaHIvOTZpMXNQeTAvSjg1ZzZQOWlJQzJK?=
 =?utf-8?B?VFpIZ0FOV0VnbnBmRk1Pa2xRY0FONVlGS2RzalRSelkxWGJ5dy9zL1cvaVdI?=
 =?utf-8?B?TjJmSUtoa083ZkYvay9nRnNMcjJFNUhjbUJFYjdVb0UxTHpjNEw3NVA5d2VM?=
 =?utf-8?B?NU1BN2REbGhwVjQ2ZWJrbnNaRDJ2WUo2Mlc2QnBseU5BWGRhZ3hYNU9VaFlX?=
 =?utf-8?B?ZHdpeWN2QUZFdytuc3NnUEJ4UTNiOGRjQS9GSWRraWZoemdxYmFQSlloUERC?=
 =?utf-8?B?WWtacFVGRUNWNUcwdHc5Nlg4OGg3VE01UDNWUEZXejI4TThuYjMzUHQ5L3NS?=
 =?utf-8?B?cVBWUlNHS09QMUZvajFoZW10ZThIZ0k4K3dIWjJrd0w2aGZOdEtyb0xjREox?=
 =?utf-8?B?ZU9hczZBM2lVL1QzZEVoVEpLZFR1ZU9CRkFOeDVCQWN1bUhpR3Ntb2tFMVJR?=
 =?utf-8?B?RmwvZHRVN21xY294OFVtZ0gzTW5HNVZCZWZFL1hZZ1orNkZsTXBDUURGc0NY?=
 =?utf-8?B?TXBkRjNhQU91Mm5zNFRUekx4YVVtRzZ4QVY3TWpIWi9zK3RzNEZOODFJQVRz?=
 =?utf-8?B?ZGxzSG1iNUV2OEdnUUJlQlVXMFpWM0JOdVFKRU1JTHk0TG96aVJYbnBmUU81?=
 =?utf-8?B?bFVjSm1BZlo1UWhDRzhaSVE0NUovRWUxK0MvRERJKzJRek5LRTNJekRmazlC?=
 =?utf-8?B?ZkFqQ2xyUHI5SmE3ejdBUWdpSmRNQW1EMmlHZkVocUFhUTZ4Mk0wbFpWN0Ex?=
 =?utf-8?B?bVVvbXNqWWwzQnJyUEdOSVNoOWMzOEpKaGoxN094MFFYNjA0bTRwajN0cVgv?=
 =?utf-8?B?NXc1RmVzL2ZoZW0wM1V5ZEo4NDlYNm5icmdRQS8vUm0wditsTm9UR3A0QllP?=
 =?utf-8?B?V1BjaklDcklRYSt2MUQ1a3BCSjV3STFxWkdyUUF5T1JIbVBwQUtmWlI5c3cz?=
 =?utf-8?B?OGRXVnA1THpMYUhadTRWazlvYk9rdEpmNGJOSDBWMnVJOTE0ZWVlOGRvQVpl?=
 =?utf-8?B?eWRRS3lYMnozVFhCU2FZS0IyZXJYSUJrSS9UZytQQk45L3Z1eGpvMjdkOHg4?=
 =?utf-8?B?bDVlUGJtT0VlMHdLUjZPQ2pUVmsvMWtpZjBqdGErT0lNQ01DODJwaVh1dTFl?=
 =?utf-8?B?MzRPNlVLNjBKT3R2QndubWdGbXNkUEgvb04veDVQQm5YS0hQdmMvbHBxL3hW?=
 =?utf-8?B?RG8rK1dscmdiUmo5d1ZJbFBiZzB6Nm1TRjNMbllZVnB0dHpGZTUrdXJRak1y?=
 =?utf-8?B?UTJxYnVFN21OMFlXUW53YkJIZ2J1dFVQZVJaa01PMnFOekwzMFZyRmtUV3Nt?=
 =?utf-8?B?ZGNLUndUZW9XYVRrNllvRitON1puSTlwTGZUa2x2b0lkRmdxUCtnYmNJKzRn?=
 =?utf-8?B?cmZHUHZPM2dtckdKYnJMTmQzKzN3YWJ1U25nQStYbzhVQ1NkWm9LY3lDRlhG?=
 =?utf-8?B?MG5WbC9QekYwalFRY0k4Yk9TaW10RzNCWDBwTmNPN1ZSNUErY3lNVC9pR0tG?=
 =?utf-8?B?a0NYSXByMEdoalJJcmpTOFVOenp6Qmd5alNxOXJHSFFkSzJ3Ynd5bEx3WVNV?=
 =?utf-8?B?c2x1WlcrekNoTWlwNTdkc3VONk4yU3dsUUxzWkg3R3ZnMEg3RTFEZ1g3d0sv?=
 =?utf-8?B?TVpyZUJLdVV3RFh4V240bHVTa1hVOWhqYzBWcHlWcnhwZStJSjF6STBGazNs?=
 =?utf-8?B?QTMzODVobUhhUUxETzFBU2dCcXJnT1BGbXVhTzVQajZ1eE1NYVlwdTZjMlFK?=
 =?utf-8?B?T29ocVdWVDR0ZlBWNDdsMm1ROEtOK01CaXpZeS9XYitlRkxEVkQrOHkybFdD?=
 =?utf-8?B?Z3QrME5MSjN1a25mWU5hSGlDU1NNUTBLbVd5ZFZtSE5sS3RMWGg5Sk5pdEFH?=
 =?utf-8?B?V3NMN1FRZS8vQVpQcXptcUdxczhmUFFTSnQ5V1hFM0lmUnZtSVpCTnZoRWgr?=
 =?utf-8?B?clhZT2V2M2lRR3hra2c1ZUdLYmQ1ZlM1VzhNdEVMY0xYc2dNT01YV1hHUTAw?=
 =?utf-8?B?aGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <14F51B2ECE85264D95EB55EE6DBEB231@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 02a2a629-ce6d-4c87-673f-08dac577b7eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2022 13:05:20.3472
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 42XSRFTAIl81kdwg4XXUkEOyoa5sZ2zpODozfScC1NYYZh3AuYNhgTbINpUVldgj1moyP2tUSVa/9qwET6XCL01kDXZdL9gTM3Nqbrve3iQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB3415
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

TGUgMTEvMTEvMjAyMiDDoCAxNToyNywgU3RldmVuIEouIEhpbGwgYSDDqWNyaXTCoDoNCj4gT24g
MTEvMTEvMjIgMDI6NTMsIENocmlzdG9waGUgTGVyb3kgd3JvdGU6DQo+Pg0KPj4gRmlyc3Qgb2Yg
YWxsLCBrZXJuZWwgMy4xMiBpcyBwcmVoaXN0b3JpYy4gSGF2ZSB5b3UgdHJpZWQgd2l0aCBsYXRl
c3QNCj4+IGtlcm5lbCwgb3IgYXQgbGVhc3Qgd2l0aCBvbmUgb2YgdGhlIGxvbmcgdGVybSBzdXBw
b3J0IHJlbGVhc2VzIChzZWUNCj4+IGh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvY2F0ZWdvcnkvcmVs
ZWFzZXMuaHRtbCkgPw0KPj4NCj4gSXQgaXMgd2hhdCBteSBjdXN0b21lciB3YW50cy4gRm9yIHRo
aXMgcHJvamVjdCwgdXBncmFkaW5nIHRoZSBrZXJuZWwgaXMgDQo+IG5vdCBhbiBvcHRpb24uIEkg
YW0gdXNpbmcgdGhlIElPIGFjY2Vzc29yIG91dF9iZTMyKCkgYWxvbmcgd2l0aCBhIEJBVDoNCg0K
VGhhdCdzIG1heWJlIG5vdCBhbiBvcHRpb24gZm9yIHlvdXIgY3VzdG9tZXIsIGJ1dCBpdCBpcyBh
IGdvb2Qgb3B0aW9uIA0KZm9yIHlvdXJzZWxmIHRvIGZpbmQgb3V0IHdoYXQgdGhlIHByb2JsZW0g
aXMuIElmIHJlY2VudCBrZXJuZWwgZG9uJ3QgDQpoYXZlIHRoZSBwcm9ibGVtLCB5b3UgY2FuIHRo
ZW4gcGVyZm9ybSBhICdnaXQgYmlzZWN0JyBpbiBvcmRlciB0byBmaW5kIA0Kb3V0IHdoaWNoIGNv
bW1pdCBmaXhlZCB0aGUgcHJvYmxlbS4gT25jZSB0aGF0IGlzIGRvbmUsIHlvdSBtYXkgYmFja3Bv
cnQgDQp0aGUgZml4aW5nIGNvbW1pdCB0byAzLjEyIGZvciB5b3VyIGN1c3RvbWVyLg0KDQo+IA0K
PiAgwqDCoCBzZXRiYXQoNiwgMHhlNTAwMDAwMDAsIDB4ZTUwMDAwMDAsIDQwOTYqMTAyNCwgUEFH
RV9LRVJORUxfTkNHKTsNCg0KSGF2ZSB5b3UgdHJpZWQgd2l0aCBpb3JlbWFwKCkgaW5zdGVhZCBv
ZiBzZXRiYXQoKSA/DQoNCkFsc28sIHdoYXQgb3RoZXIgQkFUcyBkbyB5b3UgaGF2ZSBpbiB5b3Vy
IHNldHVwID8gTWF5YmUgeW91IGhhdmUgc29tZSANCm92ZXJsYXBwaW5nIEJBVHMuDQoNCkNocmlz
dG9waGUNCg0K
