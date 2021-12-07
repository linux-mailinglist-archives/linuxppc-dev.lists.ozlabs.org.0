Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB2B46C21D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Dec 2021 18:50:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J7nrn4nVgz3bhl
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Dec 2021 04:50:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::629;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (unknown
 [IPv6:2a01:111:f400:7e18::629])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J7nrG3Zhxz2xRp
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Dec 2021 04:50:02 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ANPj1v6OYMd/BwuvRPyJYH8jQpcVSVeJNwXv8oXz7iGShRCUj+G9h1eINcf1gOGoIX//67t3Dscdmueb43Eg/gSQ5KPj2LP9ekpKWRAyYCnqx1fva6XWJoRDAkZ7JfRLZy2mL19EI8TxOPzFei9K5nlOug8Y+mgpWth45vQOWz7OJ2O9mo5Dc6/IsT0wuUgdKbMOeaGCUZlqGcXv584RMIFsQh9/qZ32VqEF5GM2DPW8lH6FGuGtiWGi4ByMASvANGGBr//koYZnosbFNKr411BrEuDBKao/+eJe8oEPcP573vp6wuCU+cXFIV9EYSKwNHe3y0ib30ashMDb/8pxBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6qVPjiJNofwabWpc2dgtWS19ueNu9RfhBxtABp3I6Zs=;
 b=OxG6I2LpLW/vKp/WPltXEit2WBrT8uNVUHlBZ+AmoVT1FEW/XOxxddOLypVhVceHQNrtUy0kDZ7m51DkqBmwI/Z78s+qGdL4484sCpeTV1wKCBy733y7nAfN0cC4hLte5NH7tdbMVJuoW4UNvh0lRKz3m3YzWcUO6VwKJXL+75Stg9EPwHlQVZdUzgNsBvqkFvBi25ginsRx2OhGVDoAs2oV2+2LzAwhAP1k1HK1lQowZ/0MMlCJY8nISEC+BOHD6UIewhkChiAqVjxd28yZVl+bBIjjEt15953g7S2Z8PlTcCo9fCIqUshowKQ8NReoXNKuCGROR1zR5qVORnvK1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB1732.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:13::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Tue, 7 Dec
 2021 17:49:37 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f%2]) with mapi id 15.20.4755.022; Tue, 7 Dec 2021
 17:49:37 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "mbizon@freebox.fr" <mbizon@freebox.fr>, Michael Ellerman
 <mpe@ellerman.id.au>, Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH] powerpc/603: Fix boot failure with DEBUG_PAGEALLOC and
 KFENCE
Thread-Topic: [PATCH] powerpc/603: Fix boot failure with DEBUG_PAGEALLOC and
 KFENCE
Thread-Index: AQHX6zEUm45+sm7WYEq1/qYEgOJsjKwm1aoAgAB5jAA=
Date: Tue, 7 Dec 2021 17:49:37 +0000
Message-ID: <191754d3-e13d-6fe2-db4b-99d78cbf2a2e@csgroup.eu>
References: <aea33b4813a26bdb9378b5f273f00bd5d4abe240.1638857364.git.christophe.leroy@csgroup.eu>
 <12988dafdf7e14ba6db69ab483a2eb53e411fc0d.camel@freebox.fr>
In-Reply-To: <12988dafdf7e14ba6db69ab483a2eb53e411fc0d.camel@freebox.fr>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8d2c195c-f3d5-426c-336e-08d9b9a9eff6
x-ms-traffictypediagnostic: MR1P264MB1732:EE_
x-microsoft-antispam-prvs: <MR1P264MB1732D66966EF69E6E2BB3DD4ED6E9@MR1P264MB1732.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:1247;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yeZqh+gxogvlJVKT2KePnxORRkJuM6Pug2pLllfAEzBj0hZENq1WpOP9cC6ZnShN5u5aTiViXA6/CuazqdXGcbRrZVBb/F5KU8vIv+ft12kPv6h6wP4zELbcoo9LBkjsypDzajfzo244G1SDfnYZ7rAhr6JRYgDiQqImpLSKVpdsih9kREpdFc5vEmRvaK3qRzOdLPJQ+Ia6Z6YcHHLH0z/RmSjzit/x5pxLTPvkQFHznUW+qODef/1s5rF8ywQTr0aZKwwBgGWvWzuHqFZMy+HH0HNr3xHMhNgDN+ieHt0z+JSC6i1UmvtEBdw8WyNg1pQHe+PQ1HXwtenY1tyfNPF2A/AO/8JOxJehlkdEGESev+Wb8o8YKfu/KoSHPRBtedYCiKhn8YaUAebxbgiqu090kuW1Dtgo2Gu970F+eIENObptcjLIqW71jG3zf/WbY/NaEMnGF8KjM+js3SpwrTYXwRGlguH3/5P/GIowc2IJEYlzJnwGeye+C3ee+K6mxx/sO6bSoofCZWA5IBiw+1SsJ3dHi1wtuk+U6oVqZCZyzTZr2Izjpny22dWFITYp/nltXOvl/iOE00kEcFzq3dqRiSRYKrBvp6mk5dg6Bkm92c0ny/9DrxOBvT9ZHZgkNoOqn7FIxeYsSJiWuzReGA5meAhwNLm4iSl6UIyfgJFfDF9jD6cJPBMwZDfnqaEIFNpCGggqJHDIc4dQK/fYSmmw5eOuwkE+fxDt5QEpMvPoBmIIhEN7NR2tTYHMaehGBPIPZYMA9q0VJRpwfGvsQA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6512007)(186003)(38100700002)(2616005)(508600001)(316002)(71200400001)(83380400001)(86362001)(110136005)(54906003)(66574015)(38070700005)(6506007)(122000001)(6486002)(31696002)(66446008)(26005)(91956017)(76116006)(8936002)(31686004)(2906002)(36756003)(66556008)(64756008)(4326008)(5660300002)(44832011)(66946007)(8676002)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RGdBQ3BlL2Qxdk5XbUxuS25XQTI1cHVJNHdTMGNDV094UVoxWkh3anI0VlhL?=
 =?utf-8?B?ZUZ5bHZJMFpnL083U2NSb2NuSzJCQ243a1lsQ09laVA4aDB3VzgrazNOVXVV?=
 =?utf-8?B?M2JiUTQwczZoVEMrdnE2dkFxellWMHljMG90UWJSTytkOHpCNkhNL1ZDMkhT?=
 =?utf-8?B?dDZ5ZmFBV0l3U1NIMTZEVC9NYmNlOXBpRVg0SDR0WE9OK3F1VTkydU1EK2ZT?=
 =?utf-8?B?M0dreVZoNDlPMjdodENnbXFSd3IrdTFpTGZTZHA1NFRnWU5sV3lqakdyZ1pm?=
 =?utf-8?B?YW5oNWtTRGZLWitkb3NCc3FWeG12dytZaFVjcHNmWVh3clRMZkFESXEwUUhO?=
 =?utf-8?B?c051cEgvVXdyU0lIdFZCZDg2U21EYmovek91VHBENmRYb2poRE1wZGJQaGkw?=
 =?utf-8?B?dmJwSGZ5c0g1RUdXSU0zN2sxa0VUc1VXckRveUdyQ2QzZWY4RVFuQnpqZ0ZS?=
 =?utf-8?B?NnFERC9rSmRVUzJTY21MTTBKMU5aWDFnbENTMDBaZ2lsbklBNjlLM0x5QXFB?=
 =?utf-8?B?NUlMdzJ1MzR6RENKbmFkTTRPUW5nTm1wVlV0bHFXWEpSaW5adWZXVDNvZ21C?=
 =?utf-8?B?MmpSNVlsK3FFcGhzZUF3NTlvS25lbVJPUDlFckZkSU9BeDFYbk9XUDRHMjhN?=
 =?utf-8?B?UU1FOFArMDRLdXN4RlNua2o4TDZEYkJTdmNWQ3ZTVEI1U0lyUjV0b1dweStK?=
 =?utf-8?B?Tis1ODZGc2NScHVuN2R5SWcxZ2VaTHZQblZpZXZ3MGRFK0J3R2tGQnBnc1FY?=
 =?utf-8?B?Y0FGT013eU1JK2cyTTMvZGRLTnliMlhKZ29ONTFKblZNK1pITWM0M3VoS1Jx?=
 =?utf-8?B?dHdXbjdqNndqQ2s3QUpMdkFDMUI2akxpa1pSUy9XWnNidm5LMUNBYjk0clJC?=
 =?utf-8?B?aXhXZHptWFo4aVZ6MEd5ZURSR281cUh2WWRTRWZ0OU1pNktzVnk2MmtWc1R2?=
 =?utf-8?B?MFRLL0JsRG1vUi92MVA2Z0pwa2tJekczWnpzVllaV0VFVXdibE5hRVJnVWVo?=
 =?utf-8?B?dlB6QkxYcXV1YWovQlZtVUQwQ1MrTndkdkgxNXJneWRkQ2kxSDNKbUpQTkYz?=
 =?utf-8?B?TU12WW8xSTVWT052NVBheUtiR1k2SWRuQ3NOOEFFT0xoU0s2S2hHcW5zTzFw?=
 =?utf-8?B?M3JzdVJOazdESTNScXNuVmdqakZYR3Aza3pUT0pDYTY4NENGNHFEREx6NmFs?=
 =?utf-8?B?RlRWTTFrVjFmaEgzVzZCbzk4M0tzaENiUHplMkIwczArNXJsSkVJRzBYK09I?=
 =?utf-8?B?bWVnUGViL0J1UkUxdU54L25pYXVIUjRsTHcvYVpmeS9DMmdLTTdHZ0RIUUQv?=
 =?utf-8?B?MFpoV0liYU1wTGEwcWdsemZ0MWl4NTRONE40MFg2bkl2M0htMkJyRHNMVGp2?=
 =?utf-8?B?eHp1UlNvdlJyQUlyUTNTdGdFM1YzU0hVcVZDTjVzNVNPcFRWbDMrTHl6L3dV?=
 =?utf-8?B?UUdDdHYzcWJ6ZWZ4cElsV29uMFRZZVRFUHZ5YmlPV0FPZ3ZtTEJvbkN1WDR0?=
 =?utf-8?B?SFEyaGNUU3gvU0JMTmxWY3Z0Zi9zUElWa2VXTWxJYWRQOGJiVlZaNlhHQ2Mx?=
 =?utf-8?B?STRhbW9BOVN1MTBtRjhPQUtlS3B4WEFTMEcraDJqdE9Oci9vOEFJNThBd1Zq?=
 =?utf-8?B?aFFodDlyemhjTDFadVhFd3JGaXpNV0pzenpNQ1RWRkVlWHJQR3p2MjdCTXBU?=
 =?utf-8?B?cmdwRktCWU1JZENnZnNJYW40TWJQMFk1REtDekh2Mi9adUhzc1hrZmFITGNv?=
 =?utf-8?B?eW9aMnprVHV1Z3g3QithTm53UW9qTnJYYUZSWUphVGY3Qnd6Sk9jUGJoZUpu?=
 =?utf-8?B?cnBLOVZoa3d0RGY3ZnM4Y3BvR0EzVFlKSmd5UnBZVGZhSzQveWJOb2RhR3Mr?=
 =?utf-8?B?YTNEMU1nemxnM0lZbGhVZnJKMncwZWRsdW8yRTBkMGNoVW9zU0tTZkU2eFR3?=
 =?utf-8?B?eEU0YURobTRsK1BnOUNwMDRYZ0ZHYm5WcTJtbGNCQlNNWXp0MW9SNUxwYWxl?=
 =?utf-8?B?M2YzQjdZVmlJbzRtbmc3cThka292c2JaZUpHWWVpYStkc3I4RFBoS3lSTU9p?=
 =?utf-8?B?cHdlTzF5VUNJYjREZndBQ3BwTzBpOFlQOUJaaVVNdFhYZGhiNXZLdS9HakRw?=
 =?utf-8?B?ck9Pd2FYSzJPb3lkSlhldUpqQ0NWa3FVNGorK1dlcmRoeGpkQVo4Z053VFo3?=
 =?utf-8?B?Y0hJSTVtcS9Ca3E4bStaSHduZStlY2FFaGxNVVdUZ2Rjdm5uT3BGS0FoTkJw?=
 =?utf-8?Q?vFL3idC2ju2VEqYCdukmC0EcMxUYqWLpn/NeofKBbE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AC1637F88B191E47AE40947220400111@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d2c195c-f3d5-426c-336e-08d9b9a9eff6
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2021 17:49:37.5012 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CdNIewhK41Vu8vSdD6Vh7HO/EmZwpxzLgs8IVKXVfuXnw9ec3pI61D1Tf300i0GEX2s7t+uIHd69UfRh5ApdsDOTSEjsbqGrlghk/UhJG9U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1732
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
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA3LzEyLzIwMjEgw6AgMTE6MzQsIE1heGltZSBCaXpvbiBhIMOpY3JpdMKgOg0KPiAN
Cj4gT24gVHVlLCAyMDIxLTEyLTA3IGF0IDA2OjEwICswMDAwLCBDaHJpc3RvcGhlIExlcm95IHdy
b3RlOg0KPiANCj4gSGVsbG8sDQo+IA0KPiBXaXRoIHRoZSBwYXRjaCBhcHBsaWVkIGFuZA0KPiAN
Cj4gQ09ORklHX0RFQlVHX1BBR0VBTExPQz15DQo+IENPTkZJR19ERUJVR19QQUdFQUxMT0NfRU5B
QkxFX0RFRkFVTFQ9eQ0KPiBDT05GSUdfREVCVUdfVk09eQ0KPiANCj4gSSBnZXQgdG9ucyBvZiB0
aGlzIGR1cmluZyBib290Og0KPiANCj4gWyAgICAwLjAwMDAwMF0gRGVudHJ5IGNhY2hlIGhhc2gg
dGFibGUgZW50cmllczogMjYyMTQ0IChvcmRlcjogOCwgMTA0ODU3NiBieXRlcywgbGluZWFyKQ0K
PiBbICAgIDAuMDAwMDAwXSBJbm9kZS1jYWNoZSBoYXNoIHRhYmxlIGVudHJpZXM6IDEzMTA3MiAo
b3JkZXI6IDcsIDUyNDI4OCBieXRlcywgbGluZWFyKQ0KPiBbICAgIDAuMDAwMDAwXSBtZW0gYXV0
by1pbml0OiBzdGFjazpvZmYsIGhlYXAgYWxsb2M6b2ZmLCBoZWFwIGZyZWU6b2ZmDQo+IFsgICAg
MC4wMDAwMDBdIC0tLS0tLS0tLS0tLVsgY3V0IGhlcmUgXS0tLS0tLS0tLS0tLQ0KPiBbICAgIDAu
MDAwMDAwXSBXQVJOSU5HOiBDUFU6IDAgUElEOiAwIGF0IGFyY2gvcG93ZXJwYy9tbS9wZ3RhYmxl
LmM6MTk0IHNldF9wdGVfYXQrMHgxOC8weDE2MA0KPiBbICAgIDAuMDAwMDAwXSBDUFU6IDAgUElE
OiAwIENvbW06IHN3YXBwZXIgTm90IHRhaW50ZWQgNS4xNS4wKyAjNDQyDQo+IFsgICAgMC4wMDAw
MDBdIE5JUDogIDgwMDE1ZWJjIExSOiA4MDAxNjcyOCBDVFI6IDgwMDE2NmU0DQo+IFsgICAgMC4w
MDAwMDBdIFJFR1M6IDgwNzUxZGQwIFRSQVA6IDA3MDAgICBOb3QgdGFpbnRlZCAgKDUuMTUuMCsp
DQo+IFsgICAgMC4wMDAwMDBdIE1TUjogIDAwMDIxMDMyIDxNRSxJUixEUixSST4gIENSOiA0MjIy
ODg4MiAgWEVSOiAyMDAwMDAwMA0KPiBbICAgIDAuMDAwMDAwXQ0KPiBbICAgIDAuMDAwMDAwXSBH
UFIwMDogODAwYjhkYzggODA3NTFlODAgODA2YzYzMDAgODA3MzExZDggODA3YTEwMDAgOGZmZmZl
ODQgODA3NTFlYTggMDAwMDAwMDANCj4gWyAgICAwLjAwMDAwMF0gR1BSMDg6IDAwN2ExNTkxIDAw
MDAwMDAxIDAwN2ExMTgwIDAwMDAwMDAwIDQyMjI0ODgyIDAwMDAwMDAwIDNmZjljNjA4IDNmZmZk
NzljDQo+IFsgICAgMC4wMDAwMDBdIEdQUjE2OiAwMDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAwMCAw
MDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAwMCA4MDAxNjZlNCA4MDdhMjAwMA0KPiBbICAgIDAuMDAw
MDAwXSBHUFIyNDogODA3YTFmZmYgODA3MzExZDggODA3MzExZDggODA3YTIwMDAgODA3Njg4MDQg
MDAwMDAwMDAgODA3YTEwMDAgMDA3YTExODANCj4gWyAgICAwLjAwMDAwMF0gTklQIFs4MDAxNWVi
Y10gc2V0X3B0ZV9hdCsweDE4LzB4MTYwDQo+IFsgICAgMC4wMDAwMDBdIExSIFs4MDAxNjcyOF0g
c2V0X3BhZ2VfYXR0cisweDQ0LzB4YzANCj4gWyAgICAwLjAwMDAwMF0gQ2FsbCBUcmFjZToNCj4g
WyAgICAwLjAwMDAwMF0gWzgwNzUxZTgwXSBbODAwNTg1NzBdIGNvbnNvbGVfdW5sb2NrKzB4MzQw
LzB4NDI4ICh1bnJlbGlhYmxlKQ0KPiBbICAgIDAuMDAwMDAwXSBbODA3NTFlYTBdIFswMDAwMDAw
MF0gMHgwDQo+IFsgICAgMC4wMDAwMDBdIFs4MDc1MWVjMF0gWzgwMGI4ZGM4XSBfX2FwcGx5X3Rv
X3BhZ2VfcmFuZ2UrMHgxNDQvMHgyYTgNCj4gWyAgICAwLjAwMDAwMF0gWzgwNzUxZjAwXSBbODAw
MTY5MThdIF9fa2VybmVsX21hcF9wYWdlcysweDU0LzB4NjQNCj4gWyAgICAwLjAwMDAwMF0gWzgw
NzUxZjEwXSBbODAwY2ZlYjBdIF9fZnJlZV9wYWdlc19vaysweDFiMC8weDQ0MA0KPiBbICAgIDAu
MDAwMDAwXSBbODA3NTFmNTBdIFs4MDVjZmM4Y10gbWVtYmxvY2tfZnJlZV9hbGwrMHgxZDgvMHgy
NzQNCj4gWyAgICAwLjAwMDAwMF0gWzgwNzUxZjkwXSBbODA1YzVlMGNdIG1lbV9pbml0KzB4M2Mv
MHhkMA0KPiBbICAgIDAuMDAwMDAwXSBbODA3NTFmYjBdIFs4MDVjMGJkY10gc3RhcnRfa2VybmVs
KzB4NDA0LzB4NWM0DQo+IFsgICAgMC4wMDAwMDBdIFs4MDc1MWZmMF0gWzAwMDAzM2YwXSAweDMz
ZjANCj4gWyAgICAwLjAwMDAwMF0gSW5zdHJ1Y3Rpb24gZHVtcDoNCj4gWyAgICAwLjAwMDAwMF0g
N2M2MzAwMzQgODNlMTAwMGMgNTQ2M2Q5N2UgN2MwODAzYTYgMzgyMTAwMTAgNGU4MDAwMjAgOTQy
MWZmZTAgOTNlMTAwMWMNCj4gWyAgICAwLjAwMDAwMF0gODNlNjAwMDAgODEyNTAwMDAgNzEyOTAw
MDEgNDE4MjAwMTQgPDBmZTAwMDAwPiA3YzA4MDJhNiA5M2MxMDAxOCA5MDAxMDAyNA0KPiANCj4g
DQoNClRoYXQncyB1bnJlbGF0ZWQgdG8gdGhpcyBwYXRjaC4NCg0KVGhlIHByb2JsZW0gaXMgbGlu
a2VkIHRvIHBhdGNoIGM5ODhjZmQzOGU0OCAoInBvd2VycGMvMzI6IHVzZSANCnNldF9tZW1vcnlf
YXR0cigpIiksIHdoaWNoIGNoYW5nZWQgZnJvbSB1c2luZyBfX3NldF9wdGVfYXQoKSB0byB1c2lu
ZyANCnNldF9tZW1vcnlfYXR0cigpIHdoaWNoIHVzZXMgc2V0X3B0ZV9hdCgpLg0KDQpzZXRfcHRl
X2F0KCkgaGFzIGFkZGl0aW9uYWwgY2hlY2tzIGFuZCBzaGFsbCBub3QgYmUgdXNlZCB0byB1cGRh
dGluZyBhbiANCmV4aXN0aW5nIFBURS4NCg0KV29uZGVyaW5nIGlmIEkgc2hvdWxkIGp1c3QgdXNl
IF9fc2V0X3B0ZV9hdCgpIGluc3RlYWQgbGlrZSBpbiB0aGUgcGFzdCwgDQpvciBkbyBsaWtlIGNv
bW1pdCA5Zjc4NTNkNzYwOWQgKCJwb3dlcnBjL21tOiBGaXggc2V0X21lbW9yeV8qKCkgYWdhaW5z
dCANCmNvbmN1cnJlbnQgYWNjZXNzZXMiKSBhbmQgdXNlIHB0ZV91cGRhdGUoKQ0KDQpNaWNoYWVs
LCBBbmVlc2gsIGFueSBzdWdnZXN0aW9uID8NCg0KVGhhbmtzDQpDaHJpc3RvcGhl
