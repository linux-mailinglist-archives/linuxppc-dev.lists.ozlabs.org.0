Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C3F5A9111
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 09:48:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJCp52zkNz2xfm
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 17:48:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=h46fIuNO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.45; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=h46fIuNO;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90045.outbound.protection.outlook.com [40.107.9.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJCnH3Cz0z2xHb
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Sep 2022 17:47:30 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IFs7KC7s+VVNiT3gNipZwD21jn3o1S97xmmJaD+EwmvzipKcKQETS3UXWs39KdxOrhRMfPFpMEWzJrz70qwWR+aW78DYh9bS5/QdLL73/n+G56j9otnX37z9QHfzV0p6NEkeQU8WOJJ4U7sKvGacyYJuFVuXJWPNrgk2lrb3YSKpZ6NHmIMI91Ini1M28lpCz2Yc+Rjv+0ss2mujBt2BoNfnC/VHu749g0b5tjmpz2eQoy2e6TI+EuWkRUFTUSSHgovSsuk+vQ/muWMBklMAWF9CS084CnJF3hEesPE96r8MWluvLJqoN5BdTcJve5yWkoC4zU9TSll8Veu1ramFrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UAAN/vBfZV/10BH7fOeCdfmJ6od5oQpJLA1573nu7jU=;
 b=durPaHejU4oxOxEz4Y9f2znLRxVlIyUjHByd0N0CL4P6SG8CYA0lIE2SjbADDAjcg3xmFqJmRT3r97ayZek5NV3BdlnaIC0KUHVRd1wilMjHJ3UP/1qh2gbGSSvI0LmFtnvzACSunhNDyNHCo9oDDkAlis4xGnzjb7ElQ39p5Jpro+x/SvUzkBRM5hbbu3/0ZDMVktETItJKDJHxVl0e+kiIlDWYnqv/0OsVMk6R0SH9qUOxZAgvPmBJiDr8lrp4ZK3D1578mauyMh+AZZiQUVk8LQoZkofRLbaZApunphsoIBu8AXUwgGoU/W1oQdF2S/KPbXBy2x3//JKTp4K0kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UAAN/vBfZV/10BH7fOeCdfmJ6od5oQpJLA1573nu7jU=;
 b=h46fIuNOibxZC1minv/8YYbQcX5x21ek7fnQ52DUIpsz+oSBI/KT9zQDFdBIFdjNOla0PDg46TS4hyBGDA8/ljeb2sz/PBhqyhTq5OPs5ZL2y7iDJdi5bVqVSCUiAEf9Eri+z736JkTd/s0YGSUgDIIdM8X3rioXXwaP2hMcLdKF1xWxn5316tST1FeXWJmhwof/Bg76zzvRAw3adRgIci5sGEDdU4zDX+4ZSBiM2LAvbDUToIo4/EKFDApICVyths7pKn//p4MdIA8LwF3pX6vLh89h13NtxW+71pSkO9XRQ2tCrkC6dQEvO0fiHmJ1fPb8c+UCZZgEzn9RXGwF3w==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB3324.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:144::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Thu, 1 Sep
 2022 07:47:10 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8%4]) with mapi id 15.20.5588.010; Thu, 1 Sep 2022
 07:47:10 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Gabriel Paubert <paubert@iram.es>
Subject: Re: [PATCH v2] powerpc: Fix irq_soft_mask_set() and
 irq_soft_mask_return() with sanitizer
Thread-Topic: [PATCH v2] powerpc: Fix irq_soft_mask_set() and
 irq_soft_mask_return() with sanitizer
Thread-Index:  AQHYtw7tEe9N/+CAqU6ZnvEJZB4bTq3G8M2AgAACxICAADyMgIAAAlUAgAJ2JACAAG71AIAAJccAgAACogA=
Date: Thu, 1 Sep 2022 07:47:10 +0000
Message-ID: <24253442-9878-c5ed-cbaa-05a5c4851a6e@csgroup.eu>
References:  <c0b486e782b6695092dcdb2cd340a3d44c8c266d.1661272738.git.christophe.leroy@csgroup.eu>
 <CMJ3VICKD1CI.SVFJOKYJPKZQ@bobo>
 <e022754d-b4d3-bc9f-cc79-2cf556180459@csgroup.eu>
 <CMJ8P06JA9OY.1S8VDV2XRU3W5@bobo>
 <7c11b659-5b8e-256c-508e-39395041fccb@csgroup.eu>
 <20220831224522.GX25951@gate.crashing.org>
 <ad5ebb37-6b6f-372c-dd07-fc4cfc5f5fe5@csgroup.eu>
 <YxBhRtTuJ4Ut7wUt@lt-gp.iram.es>
In-Reply-To: <YxBhRtTuJ4Ut7wUt@lt-gp.iram.es>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 850f4ecc-c4c9-4d42-5ed4-08da8bee2d70
x-ms-traffictypediagnostic: PR0P264MB3324:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  LvG044hBEwmHVJwg35+fsvcmZbf+hQY7W6ZM2USFheoiqSgBPSHc6wQAC2lmTzz30E1wqx4MjshoaCiQL0S1aAKSScH/DycLzBaLk67iG/WxLzMrMrx05m9bOa2URD+kVVgQBjMyVfCU1LzrINRBeVH4NpnxMG9zUZzHY5mg8pp4ZJDs99wzW8xJQ1ulKLU57V/g92AjnDYG79h3RSM/bDwd3262vi4YkTucqWOPrzsRmHEvFAmVN1zkzwz/bPCg1qz8/EW6mUoQ+Q9TSySWIeEUnvpEizmP2J4y7b6d8BcdpJt6X5+wcrJViisPJbcbSYuf0QBZA1j4YfddmrDCYSjkZ8413Vrtz0G6jwQz0hazjdvogcnvplp1s+r3JYfAP0ld1aqCW+EsqSeTg8bY4yd9KwLtk+fET1dM4CZbnZerZkMFzRqsDe+u4RMEystP0FqbbdUb0iW5gwaTVLg2+20vJCijbL67lUHBQI1+rVYseTP84mJZEIRnLBxaphw1qzhMa/HlaXlXq20oQv7BlS5oO/01BCypDqGjWNZLldVUmVVTz6Cx49cfnimfeOflM89udBQ8AJhMtEOwenAiPA+ZKyjesuuMOlY343p3BHsqDVv3+fEPzUuoLGADO8Nl2LaPNRYYVL7VujSwtDa3Y8egIzW6dAMzBm6ESyHfHclLNVqiFC4rvPpD7CxQJnrkDmUAfapqm5yQ5ynWrWuxXwJhfezi2CqAnflcdypw2eSvOa0q8z5IVwZenGwFqgol7XtLoupwogRNEm0M6bhNzklzdHpqJa2IT4eqSDtMtxsRjYcrhb83JL784ENGgRj/rW2lnPIV0qAC74yY0bnXnA==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(396003)(39850400004)(366004)(346002)(44832011)(316002)(36756003)(2906002)(91956017)(8676002)(4326008)(66446008)(64756008)(76116006)(66476007)(66556008)(66946007)(6916009)(54906003)(31686004)(6506007)(71200400001)(41300700001)(478600001)(5660300002)(8936002)(6486002)(38070700005)(186003)(66574015)(122000001)(83380400001)(6512007)(2616005)(26005)(86362001)(38100700002)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?SU5DVWsrZDc4a0tiWnBtaUo1SE1EZFI3ejd4MmM0N2JseFhhTDRVNDJlNHhY?=
 =?utf-8?B?cC9ZazgwYWN6SlQ5VWRob2dPdnBrd1VvRjRFanBneUlSa292eU1QRVRJQnJZ?=
 =?utf-8?B?Tyt4MnBWSFhpZWROYU9NZlplR0M2Z2hkYjF5dHNpTDJlS09ydmVnSEVCSGQ1?=
 =?utf-8?B?V292ejNDQm1VN1VsTCsxVEpQalhtOUNHTFVpTTJzUmlNaEtQenFRVWJ6Y1hP?=
 =?utf-8?B?T1FNUWlxdnJUZkFWd1k5Y29SejZXUC9FekRDTC9TN0dBL0hvdUp3TS9HLzY5?=
 =?utf-8?B?YnhlNjZ6aE1Ed0N5S0VxbDJ1TW5XV1V4SkhGbDl3SHJ6Si8zalNPdkNaYVdL?=
 =?utf-8?B?TEI4Kys4M29ZNE9UUllkSTd2OU91MlVBWldNWEdmM1RPWVk4bG1CNGZoQlRG?=
 =?utf-8?B?aTA5dllmVEoxbjEvclliYldUVFJXcmY5RDhBcjRSck1LdnE5TGN2aDBYNDZX?=
 =?utf-8?B?ckNqTFZUK0g5bXVOdkdYMW9icjBtSGIrT0lPVGxlbU1NOWdlekRNV1gzWW5y?=
 =?utf-8?B?RUJzREtDU3dPSGw0L2puUkhwai96UTNxYkUxeEFZaERkNVVTUHdUOW8raEwy?=
 =?utf-8?B?S3pxaWFFS0hFVFhKN2tySzE5ZnlFWnJVeW81cTV0ZTZkckxIR2VIZkpFTWp6?=
 =?utf-8?B?OW1tem5ZNWxQNHh3T1hzUjRPWTdRMlAzdmpKd0pBZTlDTDZWb1dzTWxxUW0r?=
 =?utf-8?B?T0xLTEk1MUJJcFFlSXNMaVlQczN6R01DME8rcFIzdmxncXhDdkZSNXNkNkFa?=
 =?utf-8?B?a2dQV2wwY2dKUTh4c1FUK0Nsdi9hSUZzY0ZOK2FIcDNCYys2WDZTWEo0MUpx?=
 =?utf-8?B?OHVJcWNpYzhSSTNsRWt0eCt6SDNMSElQZkQyWGJGYklSVlpwVm5lekptc3RQ?=
 =?utf-8?B?WUFESEJXYTFtb3VnbnVNbTBuUkZYTHNSK0I1LzNBN2R3N3RPZDlIQTV6RjdH?=
 =?utf-8?B?MlRndXpCc1BqMi9GVTBmNkJJVVZoTEdycVk0RFc1TTNOQnI1ak1FQWRPR2dR?=
 =?utf-8?B?S3ZsRnJCTmRPUGxockRaSHBjdUNoY1N4RUFBV2RoQnFjdlRrdW1wR2hKN2Ft?=
 =?utf-8?B?UTA4ZzVCK01USWQ4YVVQeHVOUmpBcXI2dTBtVDRDKzVNMUMxazdwMUUvUHlI?=
 =?utf-8?B?Mk1abVRJQk5HTVFWZkZLSDRMZkJhWnZ1WDVybnVEdkIrNHJ6Z1dVbmI3MHh5?=
 =?utf-8?B?T09McS9rL1ZYc1FnUk9HMGN0ZEQ4T08wbWN6aUNSM3NFVERGdGpxdWFGZ0Er?=
 =?utf-8?B?OHpUcWxCdXkvZ3VGT3hWalhYeFI5U2xNTHh1djVzNCtRUWJvOUw1dmFMRUdp?=
 =?utf-8?B?amRJcUlBczFRRTBsTlNZblN2S0F2M1ZoKzJ1RXNEMTRNZzIxVnJmOGd3b3lK?=
 =?utf-8?B?R3ArZFpGYWljaGRpbVkzSERIZE5kYnBzTlNOL2g3N0RQYno5MmZrclAxSzhJ?=
 =?utf-8?B?YzlrVE4yUXNHQ0JBWWhSbjFLNXBiTkpkVUgxUjVTc2ZZTFpWaXV1OTlCcmJS?=
 =?utf-8?B?YUpnR2hhRFlrcHJ3c01reEZHU0xlcGlidTZvcHpmV2dkRXB3Z2tXSmFkSnhB?=
 =?utf-8?B?SEpJdXJvWEREK1QxNlE1eVRQeFYyM2tUV1lrQU9OeXpOZVVQZlpRY3Q4aW5I?=
 =?utf-8?B?VFMwZEhvWWFlNW5IN25ERkU4ZjZNK1FmazJnTHoyVEtIeFpWeVFoNUhlTkZD?=
 =?utf-8?B?c1NTZTQxUG5JYTJrTkplRWs4Wnh6WXlQM0xqdU9sNlEvUzBOM1F1L01ENUd6?=
 =?utf-8?B?NEVzRXF6LzlyazhHVGxNQzU0Tk1kcXh5OHAvczhoQkU1TFdPLy90TUFlb0Q0?=
 =?utf-8?B?VWJCMHVVSnhIOXhrWkROZGdTdWpXVTc3NGZWMFM4ZTRMS2UrSmdFdmNrZ0F6?=
 =?utf-8?B?S0RPRjF4QUxvS0k0L2F2akVsbnVSYmtQVldFVFZoWVRMWlc1c05KYXRKQTJu?=
 =?utf-8?B?bkNnWVNGNlhrQmZicDFyeGI5Mlk3aVhpS0sxWHRQNU01SE9rVnVoSXhLdjNu?=
 =?utf-8?B?V3RZdXFJY0g5SGJISzdRaGpvdlFMa3FzdUlCRW9hdnM5V0o0aXRJVnpMbUJa?=
 =?utf-8?B?eHIvemR0MU9MR1QzZ1EvbWQrMTNkQVhaY2NvL3dkVHU5NlVWbzA1czFIWVVr?=
 =?utf-8?B?MXpFdEEyK09KNmxaUHZiQWJkdk1uRGxLcWpNZjBWUEZGQUV3SFlUM0lnSmMy?=
 =?utf-8?Q?atnshamT7Og7CycpjYReNg0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <126F1C614211E44A975BFF02DC77F3F4@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 850f4ecc-c4c9-4d42-5ed4-08da8bee2d70
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2022 07:47:10.6694
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DBavPO/1UcXPVHP6y6pWIo2bJWr6qAbmfD7F4OuAr99r79ngjYKLbw/x4Z7xEALFDjYBBQFPnjxBAR1XoGaB+5klk27cIiHwbPMiNhiBWbc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB3324
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Zhouyi Zhou <zhouzhouyi@gmail.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDAxLzA5LzIwMjIgw6AgMDk6MzcsIEdhYnJpZWwgUGF1YmVydCBhIMOpY3JpdMKgOg0K
PiBPbiBUaHUsIFNlcCAwMSwgMjAyMiBhdCAwNToyMjozMkFNICswMDAwLCBDaHJpc3RvcGhlIExl
cm95IHdyb3RlOg0KPj4NCj4+DQo+PiBMZSAwMS8wOS8yMDIyIMOgIDAwOjQ1LCBTZWdoZXIgQm9l
c3Nlbmtvb2wgYSDDqWNyaXTCoDoNCj4+PiBIaSENCj4+Pg0KPj4+IE9uIFR1ZSwgQXVnIDMwLCAy
MDIyIGF0IDA5OjEwOjAyQU0gKzAwMDAsIENocmlzdG9waGUgTGVyb3kgd3JvdGU6DQo+Pj4+IExl
IDMwLzA4LzIwMjIgw6AgMTE6MDEsIE5pY2hvbGFzIFBpZ2dpbiBhIMOpY3JpdMKgOg0KPj4+Pj4g
T24gVHVlIEF1ZyAzMCwgMjAyMiBhdCAzOjI0IFBNIEFFU1QsIENocmlzdG9waGUgTGVyb3kgd3Jv
dGU6DQo+Pj4+Pj4+IFRoaXMgaXMgc3RpbGwgc2xpZ2h0bHkgY29uY2VybmluZyB0byBtZS4gSXMg
dGhlcmUgYW55IGd1YXJhbnRlZSB0aGF0IHRoZQ0KPj4+Pj4+PiBjb21waWxlciB3b3VsZCBub3Qg
dXNlIGEgZGlmZmVyZW50IHNlcXVlbmNlIGZvciB0aGUgYWRkcmVzcyBoZXJlPw0KPj4+Pj4+Pg0K
Pj4+Pj4+PiBNYXliZSBleHBsaWNpdCByMTMgaXMgcmVxdWlyZWQuDQo+Pj4+Pj4+DQo+Pj4+Pj4N
Cj4+Pj4+PiBsb2NhbF9wYWNhIGlzIGRlZmluZWQgYXM6DQo+Pj4+Pj4NCj4+Pj4+PiAJcmVnaXN0
ZXIgc3RydWN0IHBhY2Ffc3RydWN0ICpsb2NhbF9wYWNhIGFzbSgicjEzIik7DQo+Pj4NCj4+PiBB
bmQgdGhpcyBpcyBpbiBnbG9iYWwgc2NvcGUsIG1ha2luZyBpdCBhIGdsb2JhbCByZWdpc3RlciB2
YXJpYWJsZS4NCj4+Pg0KPj4+Pj4+IFdoeSB3b3VsZCB0aGUgY29tcGlsZXIgdXNlIGFub3RoZXIg
cmVnaXN0ZXIgPw0KPj4+Pj4NCj4+Pj4+IEhvcGVmdWxseSBpdCBkb2Vzbid0LiBJcyBpdCBndWFy
YW50ZWVkIHRoYXQgaXQgd29uJ3Q/DQo+Pj4NCj4+PiBZZXMsIHRoaXMgaXMgZ3VhcmFudGVlZC4N
Cj4+Pg0KPj4+IEZvciBhIGxvY2FsIHJlZ2lzdGVyIHZhcmlhYmxlIHRoaXMgaXMgZ3VhcmFudGVl
ZCBvbmx5IGZvciBvcGVyYW5kcyB0byBhbg0KPj4+IGV4dGVuZGVkIGlubGluZSBhc207IGFueSBv
dGhlciBhY2Nlc3MgdG8gdGhlIHZhcmlhYmxlIGRvZXMgbm90IGhhdmUgdG8NCj4+PiBwdXQgaXQg
aW4gdGhlIHNwZWNpZmllZCByZWdpc3Rlci4NCj4+Pg0KPj4+IEJ1dCB0aGlzIGlzIGEgZ2xvYmFs
IHJlZ2lzdGVyIHZhcmlhYmxlLiAgVGhlIG9ubHkgdGhpbmcgdGhhdCB3b3VsZCBtYWtlDQo+Pj4g
dGhpcyBjcmFzaCBhbmQgYnVybiBpcyBpZiAqYW55KiB0cmFuc2xhdGlvbiB1bml0IGRpZCBub3Qg
c2VlIHRoaXMNCj4+PiBkZWNsYXJhdGlvbjogaXQgY291bGQgdGhlbiB1c2UgcjEzIChpZiB0aGF0
IHdhcyBhbGxvd2VkIGJ5IHRoZSBBQkkgaW4NCj4+PiBlZmZlY3QsIGhlaCkuDQo+Pj4NCj4+Pj4+
IEknbSBzdXJlIFNlZ2hlciB3aWxsIGJlIGRlbGlnaHRlZCB3aXRoIHRoZSBjcmVhdGl2ZSBhc20g
aW4gX19kb19JUlENCj4+Pj4+IGFuZCBjYWxsX2RvX2lycSA6KSAqR3JhYnMgcG9wY29ybioNCj4+
Pg0KPj4+IEFsbCB0aGF0ICUlIGlzIGJsaW5kaW5nLCB5ZXMuDQo+Pj4NCj4+PiBJbmxpbmUgdGFi
cyBhcmUgYmFkIHRhc3RlLg0KPj4+DQo+Pj4gT3BlcmFuZCBuYW1lcyBpbnN0ZWFkIG9mIG51bWJl
cnMgYXJlIGdyZWF0IGZvciBvYmZ1c2NhdGlvbiwgYW5kIG5vdGhpbmcNCj4+PiBlbHNlIC0tIHVu
bGVzcyB5b3UgaGF2ZSBtb3JlIHRoYW4gZm91ciBvciBmaXZlIG9wZXJhbmRzLCBpbiB3aGljaCBj
YXNlDQo+Pj4geW91IGhhdmUgYmlnZ2VyIHByb2JsZW1zIGFscmVhZHkuDQo+Pj4NCj4+PiBPaCwg
dGhpcyBmdW5jdGlvbiBpcyBhIGdvb2QgZXhhbXBsZSBvZiBwcm9wZXIgdXNlIG9mIGxvY2FsIHJl
Z2lzdGVyIGFzbSwNCj4+PiBidHcuDQo+Pj4NCj4+PiBDb21tZW50cyBsaWtlICIvLyBJbnB1dHMi
IGFyZSBqdXN0IGhhcm1mdWwuICBBcyBpcyB0aGUgImNyZWF0aXZlIg0KPj4+IGluZGVudGF0aW9u
IGhlcmUuICBCb3RoIGhhcm0gcmVhZGFiaWxpdHkgYW5kIGRvIG5vdCBoZWxwIHVuZGVyc3RhbmRp
bmcNCj4+PiBpbiBhbnkgb3RoZXIgd2F5IGVpdGhlci4NCj4+Pg0KPj4+IFRoZSB0aGluZyBhYm91
dCBpbmxpbmUgYXNtIGlzIHRoZSBzbWFsbGVzdCBkZXRhaWxzIGNoYW5nZSBtZWFuaW5nIG9mIHRo
ZQ0KPj4+IHdob2xlLCBpdCBpcyBhIHZlcnkgaGFyc2ggZW52aXJvbm1lbnQsIHlvdSBhcmUgcHJv
Z3JhbW1pbmcgYm90aCBpbiBDIGFuZA0KPj4+IGRpcmVjdGx5IGFzc2VtYmxlciBjb2RlIGFzIHdl
bGwsIGFuZCB0aGluZ3MgaGF2ZSB0byBiZSB2YWxpZCBmb3IgYm90aCwNCj4+PiBhbHRob3VnaCBv
biB0aGUgb3RoZXIgaGFuZCB0aGVyZSBpcyBhbG1vc3Qgbm8gZXJyb3IgY2hlY2tpbmcuICBLZWVw
aW5nDQo+Pj4gaXQgc21hbGwsIHNpbXBsZSwgcmVhZGFibGUgaXMgcGFyYW1vdW50Lg0KPj4+DQo+
Pj4gVGhlIHJ1bGVzIGZvciB1c2luZyBpbmxpbmUgYXNtOg0KPj4+DQo+Pj4gMCkgRG8gbm8gdXNl
IGlubGluZSBhc20uDQo+Pj4gMSkgVXNlIGV4dGVuZGVkIGFzbSwgdW5sZXNzIHlvdSBrbm93IGFs
bCBkaWZmZXJlbmNlcyB3aXRoIGJhc2ljIGFzbSwgYW5kDQo+Pj4gICAgICB5b3Uga25vdyB5b3Ug
d2FudCB0aGF0LiAgQW5kIGlmIHlvdSBhbnN3ZXIgInllcyBJIGRvIiB0byB0aGUgbGF0dGVyLA0K
Pj4+ICAgICAgeW91IGFuc3dlcmVkIHdyb25nIHRvIHRoZSBmb3JtZXIuDQo+Pj4gMikgRG8gbm90
IHVzZSB0b3BsZXZlbCBhc20uDQo+Pj4gMykgRG8gbm8gdXNlIGlubGluZSBhc20uDQo+Pj4gNCkg
RG8gbm8gdXNlIGlubGluZSBhc20uDQo+Pj4gNSkgRG8gbm8gdXNlIGlubGluZSBhc20uDQo+Pj4N
Cj4+PiBJbmxpbmUgYXNtIGlzIGEgdmVyeSBwb3dlcmZ1bCBlc2NhcGUgaGF0Y2guICBMaWtlIGFs
bCBlbWVyZ2VuY3kgZXhpdHMsDQo+Pj4geW91IHNob3VsZCBub3QgdXNlIHRoZW0gaWYgeW91IGRv
IG5vdCBuZWVkIHRoZW0hICA6LSkNCj4+Pg0KPj4+IEJ1dCwgeW91IGFyZSB0YWxraW5nIGFib3V0
IHRoZSBmdW5jdGlvbiBjYWxsaW5nIGFuZCB0aGUgZnJhbWUgY2hhbmdlIEkNCj4+PiBiZXQgOi0p
ICBCb3RoIG9mIHRoZXNlIGFyZSBvbmx5IG9rYXkgYmVjYXVzZSBldmVyeXRoaW5nIGlzIGJhY2sg
YXMgaXQNCj4+PiB3YXMgd2hlbiB0aGlzIChzaW5nbGUhKSBhc20gaXMgZG9uZSwgYW5kIHRoZSBz
dGF0ZSBjcmVhdGVkIGlzIHBlcmZlY3RseQ0KPj4+IGZpbmUgKHRoaXMgaXMgdmVyeSBkZXBlbmRl
bnQgb24gZXhhY3QgQUJJIHVzZWQsIGV0Yy4pDQo+Pj4NCj4+PiBJIHdvdWxkIGhhdmUgdXNlZCBy
ZWFsIGFzc2VtYmxlciBjb2RlIGhlcmUgKGluIGEgLnMgZmlsZSkuICBCdXQgdGhlcmUNCj4+PiBw
cm9iYWJseSBhcmUgcmVhc29ucyB0byBkbyB0aGluZ3MgdGhpcyB3YXksIHBlcmZvcm1hbmNlIHBy
b2JhYmx5Pw0KPj4NCj4+IFdlIGNoYW5nZWQgaXQgdG8gaW5saW5lIGFzbSBpbiBvcmRlciB0byAu
Li4gaW5saW5lIGl0IGluIHRoZSBjYWxsZXIuDQo+IA0KPiBBbmQgdGhlcmUgaXMgYSBzaW5nbGUg
Y2FsbGVyIGl0IHNlZW1zLiBUeXBpY2FsbHkgR0NDIGlubGluZXMgZnVuY3Rpb24NCj4gd2l0aCBh
IHNpbmdsZSBjYWxsIHNpdGUsIGJ1dCBpdCBtYXkgYmUgY29uZnVzZWQgYnkgYXNtIHN0YXRlbWVu
dHMuDQoNClJlZ2FyZGxlc3MsIGl0IGlzIHRhZ2dlZCBfX2Fsd2F5c19pbmxpbmUuDQoNCj4gDQo+
Pg0KPj4gSSBhbHNvIGZpbmQgdGhhdCB0aG9zZSBvcGVyYW5kIG5hbWVzIG1ha2UgaXQgYXd1bGwg
bW9yZSBkaWZmaWN1bHQgdG8NCj4+IHJlYWQgdGhhdCB0cmFkaXRpb25hbCBudW1iZXJpbmcuIEkg
cmVhbGx5IGRpc2xpa2UgdGhhdCBuZXcgdHJlbmQuDQo+PiBBbmQgc2FtZSB3aXRoIHRob3NlIC8v
IGNvbW1lbnRzLCBiZXR0ZXIgdXNlIG1lYW5pbmdmdWxsIEMgdmFyaWFibGUgbmFtZXMuDQo+IA0K
PiBBZ3JlZSwgYnV0IHRoZXJlIGlzIG9uZSB0aGluZyB3aGljaCBlc2NhcGVzIG1lOiB3aHkgaXMg
cjMgbGlzdGVkIGluIHRoZQ0KPiBvdXRwdXRzIHNlY3Rpb24gKGFjdHVhbGx5IGFzIGEgcmVhZCB3
cml0ZSBvcGVyYW5kIHdpdGggdGhlICIrIg0KPiBjb25zdHJhaW50IG1vZGlmaWVyKSBidXQgaXMg
bm90IHVzZWQgYWZ0ZXIgdGhlIGFzbSB3aGljaCBpcyB0aGUgbGFzdA0KPiBzdGF0ZW1lbnQgb2Yg
ZnVuY3Rpb24gcmV0dXJuaW5nIHZvaWQ/DQo+IA0KPiBEbyBJIG1pc3Mgc29tZXRoaW5nPw0KDQpB
cyBmYXIgYXMgSSByZW1lbWJlciwgdGhhdCdzIHRvIHRlbGwgR0NDIHRoYXQgcjMgcmVnaXN0ZXIg
aXMgbW9kaWZpZWQgYnkgDQp0aGUgY2FsbGVlLiBBcyBpdCBpcyBhbiBpbnB1dCwgaXQgY291bGRu
J3QgYmUgbGlzdGVkIGluIHRoZSBjbG9iYmVyIGxpc3QuDQoNCkNocmlzdG9waGU=
