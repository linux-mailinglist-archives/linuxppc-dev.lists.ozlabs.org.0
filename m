Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FE047F860
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Dec 2021 18:21:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JMSHv2WQkz3062
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Dec 2021 04:20:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::617;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0617.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::617])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JMSHN0wvLz2xBv
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Dec 2021 04:20:29 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K67MaPDVg2UIGDNvFMP4PoCKx365lH2eViDOzGTrgZz/COm6egLyvT8wXQOzmKMPSMhEFS2jKWq1FsvrQWwwyIAEMAa2RD3P9awDwX5RLYJUlOqSSsf81mlzcYyDIymNIYss7mgXpUU1UsiY9iD2haRM/tibgb/kJdIrKs3M1IGE0GLBkiKH01rNivZZ/RBLeDFS+aat3Wg8QSZSErWd8VDfnKrt7lb/VrCXjp8jivYs/1h9iQhLZa7JT2/w8IgVdH+73krRhubIO9bcAHvfm9rzAS9xcPXQX9Ba3PLGYJUA7d+k1yZCINjqY/svFCGsK9RRxdAgXOBd1UtExE+W3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XXa6F5U8ObRWRd2eYSRe31et3sR2bvq4waqSJlv9TLY=;
 b=IBvspS4BZ39m5ukMnupFLkrxCtFBWgChhYzL+3deEG61ICsi65aRdL2UTfq7OW8SKP1GTh0uVymPGmFNSPLmxxE/Py/d8bPacuD9Ib16B+trHkgn18nO2Y7qrNzzuH5K7I1HMSlUDMvyt4fu7iyGAjeC2Gt0eE5mzXJ71znm/aCxJIEwxmEAnU6P0eAYnew2tUXdZlgUAFoHzYCbtKYmW2JlIEa4KpKMQINz72wMqhayr9xQMuaFeZZ5dNEXlnUpL42sakhwmLMBkgXcM1oiIg0igNozS9Kum/nx/RHN7xzaKQTrAB4ZL+6zhmojQSjg8oB+f6NONs+qMvpHx+4fSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (10.141.82.111) by
 MRXP264MB0726.FRAP264.PROD.OUTLOOK.COM (52.134.43.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4823.18; Sun, 26 Dec 2021 17:20:06 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d%7]) with mapi id 15.20.4823.022; Sun, 26 Dec 2021
 17:20:05 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Nicholas Piggin <npiggin@gmail.com>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 4/5] powerpc/64: Add VIRTUAL_BUG_ON checks for __va and
 __pa addresses
Thread-Topic: [PATCH 4/5] powerpc/64: Add VIRTUAL_BUG_ON checks for __va and
 __pa addresses
Thread-Index: AQHX+MmljHEVU4CPzEum9QQdwJMCE6xC/bGAgAIKYgA=
Date: Sun, 26 Dec 2021 17:20:05 +0000
Message-ID: <2797b924-25d5-eb9d-3be7-bc0f99601d8f@csgroup.eu>
References: <20190724084638.24982-1-npiggin@gmail.com>
 <20190724084638.24982-4-npiggin@gmail.com>
 <8926c850-a28b-0600-9116-1c794f80b532@csgroup.eu>
 <1640426616.sx4j7ru11d.astroid@bobo.none>
In-Reply-To: <1640426616.sx4j7ru11d.astroid@bobo.none>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 91f85abf-7f9a-4cb1-18fe-08d9c893f5c4
x-ms-traffictypediagnostic: MRXP264MB0726:EE_
x-microsoft-antispam-prvs: <MRXP264MB0726AFE436B28FBE19E70087ED419@MRXP264MB0726.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JFUdtuZXAZupRixr97EVUPHyYdnCBKzOeJNmiE3x57yQhiP9ip42Hmgw7iNQLyIrqj177ga33s1HebIM/gqwtGg+LL2g/5UhTDn415dwfjQOvwxcoX8zBzQWKjp1fBdaiWiev/TrgOv6Jb0Thq/X8n02xGTdhyswQUvLzYvuhhTa9SR4K0dEhYrVJFfa3dF6sPPj0bCHeun13OM/fXA53aFCIi5xYea8ndMMlbGor6kfRXDd4GMlJlZK0m1kDJawd1jrFLH66p7hyMr3q51zaNXc6vJOk1Kg+iiN0GBqNfjkDjlTIHZXzUTuvEe+pzoGsHrNV0lr5ya2B9S8g06HO8MZvCTup4V/0vKQisgx2HaouXXoPy+noZw+5L+MuM3AnpoQti9KUFN35qA4g5sxUR0nOQP+DxgaaN4drHKKrqajAkS3rn1eaTimByyp6tTradNprfJzjgiF2FEpMjS8vg/rcXXbjkrTcb22E7CNMxIA42J6DM60LA3CfxPgcO3YqOVg4FXEakcQVoFrVJdHUJIj6oL+eQ/IT9FTjGXmAY90ladzG4ebRAKqg1dKMsePXmuWlKOc4xtXDxCA7t+gKfnmlASxs6cgyJYcczNvGmRWFayRKvOyubE+Lh7HzPBd+PND6xAX4KnVf7AUOBeEiunteLxKaldFU2fXHF0G4mcR6y5PZey54So2jXSPZ9jQ2lbc5U2cLXnzRKrLfahZyOL99rHdrleUyrB+qQeiSo79tUSgXq+KMf9WnQ4j2JfRDfPTARUG4ABdbPxRlJgCHQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66476007)(64756008)(38100700002)(122000001)(316002)(71200400001)(66556008)(86362001)(2616005)(26005)(6512007)(5660300002)(6506007)(2906002)(508600001)(54906003)(76116006)(36756003)(38070700005)(66946007)(4326008)(66446008)(8676002)(186003)(91956017)(8936002)(31686004)(110136005)(6486002)(44832011)(83380400001)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QnBZdjdGWmZnbUR2VklYMnlMRDFPWTI3Q0tQaGVBNVdPbjNaazg0RmZzL2ZU?=
 =?utf-8?B?QkZOQWhKSGhJR0tjZ3d4ZUdXOHlRSzZ3YlZYV2ZldWJ3Z3BURTJ2T1B5VHRN?=
 =?utf-8?B?NmJndTZFV2ltTTNNcFJsVFk4Ny9RMnJtNlRXd3RqRGJDbk1LRnpPR1p5WCs3?=
 =?utf-8?B?RFYrU0pISVIzd2FqYzl2T3RJSXdvMzlHRVFiSDdQdXZUWWQ3QXhVdDU3bklv?=
 =?utf-8?B?L1hUaDBBa2k4SFlDbVZObWpWTUxjTWVWRmpEcE5WbFVEa0k2am5iMHgxakdO?=
 =?utf-8?B?UXc3YVJVWklnS2VxSEtLbVE5allhYUY5RFUyQzhTNVoxQnY3VU9ENm8zenY3?=
 =?utf-8?B?TWhzU21uemFjdzlFb2U5MWxYbjM0NE02ODJwZjZaVGplSVEzK1Q3Mmt4NWZh?=
 =?utf-8?B?cC9nMys3WkJ5NEJnNWNrL2E5RmlDN2hVNzBrR1Y5MDd1NGhoMmwwSTlyWFdO?=
 =?utf-8?B?MU9GMGJxSWhkSkFLUmxmdW9GTUFldks2SkFqZVBrd1VtMjdUcUwvNm1xYjJL?=
 =?utf-8?B?VWtNM0dFZTlGeERKTmtKM1lrS2RUMWluS2dzbkFRd1NCYmkza3VKSysvTGdo?=
 =?utf-8?B?cWdZWHNYQlFCbWF6c0lLQ3JaQ2VSaEZFTXBvZWI0cUhsRm9vWHpVRnBiWUc0?=
 =?utf-8?B?RmlxMnBvWUoyZWtJUTVqS0JFRXRJck5Cck5QZWY3a2I3TTc0SGNtdTBvRDF1?=
 =?utf-8?B?aVdmcFludGtoVjU1b09ISzhpNnlWLzVvVU14L2hzd3BrK3NrRjFCK0tqdnBS?=
 =?utf-8?B?S3VyMGs0cE5wdTlqUVN2dlVwc0pFcGJXMzRjZlh3Z2g3RndTVmtoTEpTRDVV?=
 =?utf-8?B?dlR0N2FnRjhCa1ZjTzN5bW1UZjlTUmdUVEhxa3FIT1FQNVV1NnBxK2lxM3Rp?=
 =?utf-8?B?b1pTb2JtMTk2RmcwM2FkMU9KUkkyWXlMaEkzaFBLWXBaQ3dsUEFwT2NFQVFm?=
 =?utf-8?B?ek9jOFNQcGNSQTlCcEFkREFzSzBzaE12WjBrU3MyK05oMnB6czIzeXNkYVRV?=
 =?utf-8?B?UE45aWpoSUJOV1dTdGR4c2JtM3VzbFJrWXlEOE40enE0R1kycCswM25aZE9H?=
 =?utf-8?B?ZGQ0b0c4blgyeHNCVlFja0MxTi91Z2lOa3NwS3JqRkRnWW5md1BMSG9QL0cy?=
 =?utf-8?B?QUVudTVoaEhTMVZqNUE5NWFPQytqOCtWeHNPUnpoQ0lsaDlzQjhTcGF5ZVd2?=
 =?utf-8?B?dWltS1JpSmpvRjhBWTNMUXRyWlZvUFhkUnhIVndPenBCa0FJaE1CVTR1N0tO?=
 =?utf-8?B?YzU0T3NlbGJNQVd5S1d4OGkzcWw1azNnOG55SkJlMEdHUXR1TWpFeDlsY0NH?=
 =?utf-8?B?SUpYMlU2Q0sydWI3VVNabTNZRlFqc0ZqZ0xnV0xmVlFYd3dqSVhpZ1dsMENj?=
 =?utf-8?B?VGdES3RodjZlb0toRjVzQ2xkaUtrTFNpaUdoYjBnVURqU2xqakdtS3VtYTFN?=
 =?utf-8?B?cDlnT2VOWXF2UnJJbklBZVkvY09Cb0VLMlIxQWc0eFNYRzZYYXBYam5MSlhr?=
 =?utf-8?B?NGNyeFVIQTNTSmRnM0ErZXdiR3psTjZjd21ld2ZvWDVTSTNGQzVqR1d0Wk4w?=
 =?utf-8?B?dmorRmNMaHBqd3Z4b2RsYytMZ1hmdlhvSFp0QS8rdDhhMUc2RFJFWUJkL09I?=
 =?utf-8?B?Sy9SVVFwbGhTT3M2a0N0SldreUxBeUo4Wk1CaHR1eUMyaEZlZzVFSVRlQ1h3?=
 =?utf-8?B?U1BaL3J2Z2ErQ2kwK1RmZnQ2T3ZML003N1k4OUZQcjhKaHhOSWszNzRiQjZs?=
 =?utf-8?B?Ujk2ZGlzVUZ5VnFFdzFydkloelhTUkFzUkNNRGd5Y25hQ1QrQTMrcWFIVnZZ?=
 =?utf-8?B?MEFzNXd3WUVVcjZNNFc5c0YzdThBbThYYVkrTWVvTzhuaEhSK2dzUFJGL0xC?=
 =?utf-8?B?VnRNakNpL3VvdkpOUzQxVEhYQnd4ZVhKRUxUd09qLzZvbEVIVWJlMFBMQkZD?=
 =?utf-8?B?WVA3WGhxZzRNNUdJVXcyeXB6VzZ6YXJoRy9zbDNONnNLQTFYenVsYlZ5Y0dL?=
 =?utf-8?B?bDZORGJ0QzdPMzJ1dHV4R3d0d2NFM1kzK3NqSm5KTVlhVUhFUmRZd0pPS0xs?=
 =?utf-8?B?blI3a1FsN0JrbHhsenVoMXNremcwdS95aFRnbmVCcUxxYnNOOFBXcjlybm8v?=
 =?utf-8?B?djZGVjRENEFXRFR4OWVQU2ZIMTFPSW40b1ZPNUxDc2pzMDJTL2Z5ZjViT1M0?=
 =?utf-8?B?UzVFVk9lUklxUDBiUE9OZVFQeitIdVd0SzB5UWhTS2VISEF2N1VkSUhIMm1k?=
 =?utf-8?Q?YpB+NYQeePvP8LkOUkfp7+HXWK/yWoiUF7sZKwZXT0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AC4C7BE04614E749A172B730D39A748E@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 91f85abf-7f9a-4cb1-18fe-08d9c893f5c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Dec 2021 17:20:05.7858 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r+FiAfripwsATYHBoDLo1DcV17Q1g6HMdc/Yq9lghV7RQzwkGUXd0riiY67gILoyAv/ojJ7mFJA3Z6ndQDlbGeSXWkCoC4hE1+f3PnnjChE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRXP264MB0726
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
Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Anju T Sudhakar <anju@linux.vnet.ibm.com>,
 Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Reza Arbab <arbab@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI1LzEyLzIwMjEgw6AgMTE6MTAsIE5pY2hvbGFzIFBpZ2dpbiBhIMOpY3JpdMKgOg0K
PiBFeGNlcnB0cyBmcm9tIENocmlzdG9waGUgTGVyb3kncyBtZXNzYWdlIG9mIERlY2VtYmVyIDI0
LCAyMDIxIDExOjI0IHBtOg0KPj4gSGkgTmljLA0KPj4NCj4+IExlIDI0LzA3LzIwMTkgw6AgMTA6
NDYsIE5pY2hvbGFzIFBpZ2dpbiBhIMOpY3JpdMKgOg0KPj4+IEVuc3VyZSBfX3ZhIGlzIGdpdmVu
IGEgcGh5c2ljYWwgYWRkcmVzcyBiZWxvdyBQQUdFX09GRlNFVCwgYW5kIF9fcGEgaXMNCj4+PiBn
aXZlbiBhIHZpcnR1YWwgYWRkcmVzcyBhYm92ZSBQQUdFX09GRlNFVC4NCj4+Pg0KPj4+IFNpZ25l
ZC1vZmYtYnk6IE5pY2hvbGFzIFBpZ2dpbiA8bnBpZ2dpbkBnbWFpbC5jb20+DQo+Pj4gLS0tDQo+
Pj4gICAgYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3BhZ2UuaCB8IDE0ICsrKysrKysrKysrKy0t
DQo+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
DQo+Pj4NCj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3BhZ2UuaCBi
L2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9wYWdlLmgNCj4+PiBpbmRleCAwZDUyZjU3ZmNhMDQu
LmM4YmIxNGZmNDcxMyAxMDA2NDQNCj4+PiAtLS0gYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20v
cGFnZS5oDQo+Pj4gKysrIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3BhZ2UuaA0KPj4+IEBA
IC0yMTUsOSArMjE1LDE5IEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBwZm5fdmFsaWQodW5zaWduZWQg
bG9uZyBwZm4pDQo+Pj4gICAgLyoNCj4+PiAgICAgKiBnY2MgbWlzY29tcGlsZXMgKHVuc2lnbmVk
IGxvbmcpKCZzdGF0aWNfdmFyKSAtIFBBR0VfT0ZGU0VUDQo+Pj4gICAgICogd2l0aCAtbWNtb2Rl
bD1tZWRpdW0sIHNvIHdlIHVzZSAmIGFuZCB8IGluc3RlYWQgb2YgLSBhbmQgKyBvbiA2NC1iaXQu
DQo+Pj4gKyAqIFRoaXMgYWxzbyByZXN1bHRzIGluIGJldHRlciBjb2RlIGdlbmVyYXRpb24uDQo+
Pj4gICAgICovDQo+Pj4gLSNkZWZpbmUgX192YSh4KSAoKHZvaWQgKikodW5zaWduZWQgbG9uZyko
KHBoeXNfYWRkcl90KSh4KSB8IFBBR0VfT0ZGU0VUKSkNCj4+PiAtI2RlZmluZSBfX3BhKHgpICgo
dW5zaWduZWQgbG9uZykoeCkgJiAweDBmZmZmZmZmZmZmZmZmZmZVTCkNCj4+PiArI2RlZmluZSBf
X3ZhKHgpCQkJCQkJCQlcDQo+Pj4gKyh7CQkJCQkJCQkJXA0KPj4+ICsJVklSVFVBTF9CVUdfT04o
KHVuc2lnbmVkIGxvbmcpKHgpID49IFBBR0VfT0ZGU0VUKTsJCVwNCj4+PiArCSh2b2lkICopKHVu
c2lnbmVkIGxvbmcpKChwaHlzX2FkZHJfdCkoeCkgfCBQQUdFX09GRlNFVCk7CVwNCj4+PiArfSkN
Cj4+PiArDQo+Pj4gKyNkZWZpbmUgX19wYSh4KQkJCQkJCQkJXA0KPj4+ICsoewkJCQkJCQkJCVwN
Cj4+PiArCVZJUlRVQUxfQlVHX09OKCh1bnNpZ25lZCBsb25nKSh4KSA8IFBBR0VfT0ZGU0VUKTsJ
CVwNCj4+DQo+PiBXaXRoIHRoaXMsIGl0IGlzIGxpa2VseSB0aGF0IHZpcnRfYWRkcl92YWxpZCgp
IEJVR3Mgb24gYSBub24gdmFsaWQgYWRkcmVzcy4NCj4+DQo+PiBJIHRoaW5rIHRoZSBwdXJwb3Nl
IG9mIHZpcnRfYWRkcl92YWxpZCgpIGlzIHRvIGNoZWNrIGFkZHJlc3Nlcw0KPj4gc2VhbWxlc3Ns
eSwgc2VlIGNoZWNrX2hlYXBfb2JqZWN0KCkNCj4gDQo+IExvb2tzIGxpa2UgeW91J3JlIHJpZ2h0
LiBIb3cgZGlkIHlvdSBjYXRjaCB0aGF0Pw0KDQpJIGNhdWdodCB0aGF0IHdoaWxlIGxvb2tpbmcg
YXQgdGhlIHByb2JsZW0gcmVwb3J0ZWQgYnkgS2VmZW5nIHdoZXJlIGhlIA0Kc2F5cyB0aGF0IHZp
cnRfYWRkcl92YWxpZCgpIHJlcG9ydHMgdHJ1ZSBvbiB2bWFsbG9jZWQgbWVtb3J5IG9uIGJvb2sz
ZS82NA0KDQoNCj4gDQo+IFdlIGNvdWxkIGNoYW5nZSB2aXJ0X2FkZHJfdmFsaWQoKSB0byBtYWtl
IHRoYXQgdGVzdCBmaXJzdC4geDg2IGFuZCBhcm02NA0KPiBib3RoIGRvIGNoZWNraW5nIHJhdGhl
ciB0aGFuIHJlbHlpbmcgb24gIXBmbl92YWxpZCBmb3IgPCBQQUdFX09GRlNFVA0KPiBhZGRyZXNz
ZXMuDQoNClRoYXQgc2hvdWxkIHdvcmsuDQoNCk1heWJlIGFsc28gd2Ugc2hvdWxkIGltcGxlbWVu
dCBhIF9fcGFfbm9kZWJ1ZygpIGxpa2UgeDg2IGFuZCBhcm02NCA/DQoNCkNocmlzdG9waGU=
