Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F7F58C702
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Aug 2022 12:56:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M1Y6W0NSHz3bkk
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Aug 2022 20:56:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=1WrhY3o7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.55; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=1WrhY3o7;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120055.outbound.protection.outlook.com [40.107.12.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M1Y5h1VQFz2y28
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Aug 2022 20:55:50 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DRVnkK6E0GNZwmzNVhX7zpgG1Ot3NHVLqdor/QKtSH8lr90ezzetpDZPvYrv8XF+Z+BLaUxkLVFda28NCrZ5O/YvdfykvkHCBEkg8L3InYMJk0snZyKiPkxghs8BpU09Svpg7teDw/B91hr5iHQxGDI3BDh6MnrGpyOO9EFJ/pqyxHQscI8DD62lLPPWJsIWfAz+oX31ia0Af+h4Axd0Xi26byGzUMFWtE3BIAJ7K2GBfOmHoNfC/HsvhJ3+lxsZMt2E0kr9Sq0+vjMe7Q/5nWgmX1wBtnpb5hIKXpvtKkV138oPMXagX78G9mxr6B8I22QYs0GFRg/tFQYNbPNQhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XUiDZCjnZfBYSApcmhgWi/OKnkzS8bGnRsTbxahw48k=;
 b=hqhygesxN1rfWYTSTeqWJRf9lN7uo3gBjnbHWA4ZCQa3qPOE+i4T7jRgsuoufUxGdCSLoIn7tZfPxfyzMSDOlpRjdMfZOUE8u+Hy+ZoK/wysYZ7WAw7DAoE44VCyrjBrj89Wac0TzMso+BHL3NPZJtHJKLrkAPHily1IR6bEL6iq9JWVVlzranrpRxkz89hg3mYPikFn5EKEGqM5xp/HwfDYETeDvpJj++YkKAQGMNkIcao5DHa3zla+JbjYQPwPYv+3gaqTrUKDcFxOJ7AytTXlLlCn2O+45WPKYU6cTpoXeR0G69UUvLyoBec0HeNw5fMcZoIYf17HH9UuUmUqbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XUiDZCjnZfBYSApcmhgWi/OKnkzS8bGnRsTbxahw48k=;
 b=1WrhY3o7rojeCxVXqSe0dNzgwSriGtu+1dVll/WGCv6p5eT8T1971+aKLD5wQ4A5iquW8L73dE68Q5Jj+DgnVstMMdjDnzoxNv5j7xYq8QlbaVz3rrABI/EP5JLl3XWcFsIB2sxyxp7FI4rJny/3prreNoOL7QRCUm741n4SEdReMYQ87ceBONNOgHIbRQgsoU9V6AgdtzOs8MrpwAAbES+P4UtcAqaU/bYcBOB6Cad67Q9AWthWevcR6USCYzxYAN89eA8s4ojPHqwZUe5kPP7KFT5WYb5H7uzZ++iTuCfEBru5NRnLCXjLTqiJLJhhR3ta0Oo5wKD2oGfXVdw4Bw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB1940.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:12::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Mon, 8 Aug
 2022 10:55:31 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624%6]) with mapi id 15.20.5504.020; Mon, 8 Aug 2022
 10:55:31 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Andrew Donnellan <ajd@linux.ibm.com>, Rohan McLure
	<rmclure@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v2 09/14] powerpc: Add NULLIFY_GPRS macros for register
 clears
Thread-Topic: [PATCH v2 09/14] powerpc: Add NULLIFY_GPRS macros for register
 clears
Thread-Index: AQHYn/AQ4KJu/vfYoUy2FjR/UCEIma2ktQCAgAA13wA=
Date: Mon, 8 Aug 2022 10:55:31 +0000
Message-ID: <75cad678-6891-c5f7-6993-b6777bf0cc24@csgroup.eu>
References: <20220725062906.120088-1-rmclure@linux.ibm.com>
 <7b6439f8288d71306e63d89f145597d1327afc35.camel@linux.ibm.com>
In-Reply-To: <7b6439f8288d71306e63d89f145597d1327afc35.camel@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bedabd5d-8aec-45b0-5a41-08da792c830e
x-ms-traffictypediagnostic: MR1P264MB1940:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  r6DkCVZTA34l8+JpGnuUQTcVIAGLtKr9ow5/8d6MozVd5DuI2AVarBDt1+/fWBBsmwp/oshBHxy2NteqRUuS1yg6SYtdLU9wqTiEm/EM0DFyQrfUKVDqo6X71JBMXRmSowWnCGvNbqEZzmngieisSDGPyKGacp13mjDywrLfup9GnXYHOi49e8DiTj8MVfPAYIPNO3zCZ+sp9amPCxTt5zG9jW8QrXxROIckgkQS25X3tyTjFeZx2RarlfwEGsBJeFW1a5E8CYb42D0ApUhTfSa0rBULl2MIuwFRJu3Ejfu8SR+/UCDqpHy9gA6NwEivhtIs8PqUNahN8yhUgpaJ9Cg+T7n4YUxI3qTaxoWNos/rUV0UKcC3m8rkyDEFEKN2qDeQSloO67UzG58rEKl7j7u4Wxf7X9hT0VNwT0qX9STEgbqQIfryHqjjOsNbmUhceci+uWyx8D20GfKC9zf1RPp+GnlCzq7Hn8e9STkvv7PNXTw0s+yyrjYdhlTkR0wSU6x17TMj6q0r0G8DpUpL6SyKxYiCuAHlXiOXBE8UqgLkHZw6+TNj5j8EXRMTznHrTgYTElf+Yj6iYDlub2kZgHNvZLZode6jBNa+1xMbGmrQwgHDdDhidk9/rUsAgvVgVP2nFuR6oT5l3FjWNgVbtxMNNz0cCr4a4OgUy8DugjuFaKaeQtLBt0Shf9WjiiC66kNzxltpX8oL6P9rtt/h5I9BAtx8yPW2eqf4s8szPUTqrdW5FoCR4Zs67YyUGahqRh/AJZxZ74pv5HVayw2xC1eGz1pjeS9N7QNFqUtIQkqdHBGrDX0/OChAS5sp7+CM7q2Zf9zWhyBTEFQqUyeZGtew8StyzakczET21/bvySi2TF7iUpZx2BJMfqrkin3j
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(396003)(376002)(346002)(366004)(136003)(39850400004)(38100700002)(86362001)(36756003)(2906002)(44832011)(31686004)(6486002)(5660300002)(8936002)(31696002)(71200400001)(38070700005)(478600001)(8676002)(64756008)(4326008)(66946007)(66476007)(76116006)(66446008)(66574015)(66556008)(83380400001)(6506007)(91956017)(41300700001)(110136005)(122000001)(6512007)(26005)(316002)(2616005)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?SE9lak5ianBzTnhtZEEwelI4S1pFQ1Z6S3pjbEJFU1lOUHVPTlJzekdqVFNy?=
 =?utf-8?B?dTV4a1R6TmRGYVVHTUZtZ2QzWlVLOXlLWkp0Z0NCa09OYzJMUm1oM1FFUjRk?=
 =?utf-8?B?K3U2bEk1d0NsSFZFQ1ZLTUdqdzl4a3BCRFZvUjhHWi92OU5mdi9Va3FzbkEv?=
 =?utf-8?B?Skp1ZjhvOGlocUo0WnFoc3U3a2k3aVYyM1VSUHFjOXZUWU1EK29mN0kwbjMw?=
 =?utf-8?B?OHd0bzBUTy9mSk45bUVDU2pIQ3RqWW1tWS9PUlo2ME9DNGVNRzVZbUpmRVU1?=
 =?utf-8?B?TVRVZlIvL2FlUWd5ZzlySitXREdLNUJXN0FoWlJWditPaFR5UGQxQ0J1eU0y?=
 =?utf-8?B?YUttdVN4a3VuV3hkSko5bzlHK3JLV3ZhVU5ld3JpV050VE5CNlF0Nmc1L3Ew?=
 =?utf-8?B?NEF2TzE0VHZpblhqd2JUdnJSZVZwam4zTno5QWVqeWZqaUF3TkhLSnBCWUow?=
 =?utf-8?B?bTJGTmUycThhWUg2bk1iN05UdXNEWCswVXR5bjRaRWhsY2JFcUxYK3VxNWY1?=
 =?utf-8?B?MXFiU2FuRmU0K3RveXE2N2lTMU9sb2ovR0F3WnZpSlQ0Wk80Qm9CRmhsSjFD?=
 =?utf-8?B?RmJhZk4wbGZpOEFnOVFTeHlXTk56ZzZscjNjQzY5OFJRSWMxZS9LS2VBUFVZ?=
 =?utf-8?B?S1gzNGNLNTVkTE5ObEdObUQzUW5JeE9tVTVkQ2VnS1YyM00vaWJ2cXduVEFz?=
 =?utf-8?B?MjkrWlhZdFZXZ1VwN3h2Vk5OcFlsckVtODNiTzNIQnNlTm90eGV2MGk5dlQr?=
 =?utf-8?B?eTVHMksycFhSYzV5SndLMnQzaTVLbzFrSy9sTk9YSG51a2w3bTZrbThtcDZY?=
 =?utf-8?B?UHRLT0RVMTdNWXkxUnR6VjRRTVRVaEVaMmtSY0dvV0RZeTdyWGJNeUdlZXlt?=
 =?utf-8?B?dVBKNjZxV3pZMHl5YnlHdFFmWXlBSGpFTXFQZkFSZnZqVTA3dmU5U05QVHNE?=
 =?utf-8?B?WHcxeW95YWF1RC9wODR3NStpb0ZmbEE2OW9TdXhmb1BKK1pHNmFWOTQ3RzVv?=
 =?utf-8?B?SUZPSHNqcWx5dERaK2JSM1lkeWZ0RVliQnRQY3dLcWY1QldIVVlBTTVJL0lw?=
 =?utf-8?B?REJUNzI3RnhQM0REYmNXUXlwVU4xOEF5NFFIWGdxd0lWajFFdFpxdFE1S3g3?=
 =?utf-8?B?bFJWUFFVdzI1cWEwUCtRc2JvWTFqSytuYUJVTEYydDljRlZBTjg5R1YwellN?=
 =?utf-8?B?cUtQaUUzckZuQmYwU1A3MnRhMDdDRHE0cXZ1ZnlQcmdQWk1IOXFzQlRzSmRk?=
 =?utf-8?B?YXIrY3p4bjZ1N3p0cVpOdlBzeGZhTjNpRTQ2ZElrcTNOTFA2UitjcWVsc2Yw?=
 =?utf-8?B?d3ZvandvWm1vVDV4dFpud05jeUltRW1TSDE3LzhxdXlHeDVwajZmNTd0S2tG?=
 =?utf-8?B?UEhZNjZ2dStYVFlXcmwxSWhMQVJ4cnFranM5S1Q4Zzd4NVp1eHFWQTk3WGRP?=
 =?utf-8?B?Z2I5MWlGRzZFYTRjZkRqUkZpUm11MEZXaHJQengrdjZaMU5ZN0dobTBkZXpT?=
 =?utf-8?B?cXBYTzJLT0NxQlhjNm1hbWRHMGpsTWxTRXdvNDZhMzgwekNxS1lqUnUya2kv?=
 =?utf-8?B?OWlaYWpablh1MXdxdTF0VzdqQ082TmJGQ1F0NnIrU2ZUTmd0dlhsWEdrdm42?=
 =?utf-8?B?YlROTjBlQWE5Sk5IbG1kc1BRK21VdkxKYlNFRy9YR2lhcUJRWEp1M3E3Ujha?=
 =?utf-8?B?MWhLWDI3a3hlakpraXpZRXJVOTBsRUgyZTZteE10c21vWU81VDcveDNraW44?=
 =?utf-8?B?MUk5UCt3QkIweWtPR3VUNUlzL1BBNXhFMG9la2pTMTFCRTR4WWJ1WFhBMVJy?=
 =?utf-8?B?UWV0L254WjFyMmRBcFBONDlTb3pTQmNFdlZVYWhjTU5kcXJMM3hTa00xS0lF?=
 =?utf-8?B?b3lnYmNyQU5oSDF1T3FQNjg5SmtndmZHYzRsTnUwL3EzVm9XQi8vQnphdlE0?=
 =?utf-8?B?TVRFZ0RzTTgwUXh0REZqVGQrTHZkTWtOTE9SWTJIL1dxTHpTZ3BkSUlxeWcz?=
 =?utf-8?B?NGNyb1cyRkJ1WGdPak5DUmdpVHFQbzl6a044RXpoSUNYaG8zTkJOTFhqWWpI?=
 =?utf-8?B?WFJUVDZwRmhPRCswY29MblVIejAzeUF5bjFPV0tLc3RKUDF0Y3pKRENDdVln?=
 =?utf-8?B?QXI2TmpxRm04dVZ1YXF4OCtPNXRjOHF1bUZXczZPRFdPc1VDRDdhYytvWXRT?=
 =?utf-8?Q?ronQUcW3q2xVDr/W6j7Ihcs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <17CD58D9D0090C4A9C5B044B280C6915@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: bedabd5d-8aec-45b0-5a41-08da792c830e
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2022 10:55:31.0155
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 62fY5SM/UadVnSWxeD8doC0JXCl0uFzBGRrUsdBcU9NUS/4uZPEHfSEhAKyUv2mESgqnIgGzQTwvxZnByR0Sar/NyTu3SX3v2u2B1p/FQtg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1940
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
Cc: "npiggin@gmail.com" <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA4LzA4LzIwMjIgw6AgMDk6NDIsIEFuZHJldyBEb25uZWxsYW4gYSDDqWNyaXTCoDoN
Cj4gT24gTW9uLCAyMDIyLTA3LTI1IGF0IDE2OjI5ICsxMDAwLCBSb2hhbiBNY0x1cmUgd3JvdGU6
DQo+PiBNYWNyb3MgZm9yIHJlc3RvcmluZyBhbmQgc2F2aW5nIHJlZ2lzdGVycyB0byBhbmQgZnJv
bSB0aGUgc3RhY2sNCj4+IGV4aXN0Lg0KPj4gUHJvdmlkZSBtYWNyb3Mgd2l0aCB0aGUgc2FtZSBp
bnRlcmZhY2UgZm9yIGNsZWFyaW5nIGEgcmFuZ2Ugb2YgZ3Bycw0KPj4gYnkNCj4+IHNldHRpbmcg
ZWFjaCByZWdpc3RlcidzIHZhbHVlIGluIHRoYXQgcmFuZ2UgdG8gemVyby4NCj4+DQo+PiBUaGUg
cmVzdWx0aW5nIG1hY3JvcyBhcmUgY2FsbGVkIE5VTExJRllfR1BSUyBhbmQgTlVMTElGWV9OVkdQ
UlMsDQo+PiBrZWVwaW5nDQo+PiB3aXRoIHRoZSBuYW1pbmcgb2YgdGhlIGFjY29tcGFueWluZyBy
ZXN0b3JlIGFuZCBzYXZlIG1hY3JvcywgYW5kDQo+PiB1c2FnZQ0KPj4gb2YgbnVsbGlmeSB0byBk
ZXNjcmliZSB0aGlzIG9wZXJhdGlvbiBlbHNld2hlcmUgaW4gdGhlIGtlcm5lbC4NCj4+DQo+PiBT
aWduZWQtb2ZmLWJ5OiBSb2hhbiBNY0x1cmUgPHJtY2x1cmVAbGludXguaWJtLmNvbT4NCj4+IC0t
LQ0KPj4gVjEgLT4gVjI6IENoYW5nZSAnWkVSTycgdXNhZ2UgaW4gbmFtaW5nIHRvICdOVUxMSUZZ
JywgYSBtb3JlIG9idmlvdXMNCj4+IHZlcmINCj4gDQo+IEFuZCBJIHNlZSB5b3UndmUgYWRkcmVz
c2VkIG15IGNvbW1lbnQgcmUgMzIgdiA2NCBiaXQgZnJvbSBWMSBhcyB3ZWxsLg0KPiANCj4gUmV2
aWV3ZWQtYnk6IEFuZHJldyBEb25uZWxsYW4gPGFqZEBsaW51eC5pYm0uY29tPg0KPiANCj4+IC0t
LQ0KPj4gIMKgYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3BwY19hc20uaCB8IDIyICsrKysrKysr
KysrKysrKysrKysrKysNCj4+ICDCoDEgZmlsZSBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspDQo+
Pg0KPj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9wcGNfYXNtLmgNCj4+
IGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3BwY19hc20uaA0KPj4gaW5kZXggODNjMDJmNWE3
ZjJhLi5kNmM0NjA4MmJmN2YgMTAwNjQ0DQo+PiAtLS0gYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9h
c20vcHBjX2FzbS5oDQo+PiArKysgYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vcHBjX2FzbS5o
DQo+PiBAQCAtMzMsNiArMzMsMjAgQEANCj4+ICDCoMKgwqDCoMKgwqDCoMKgLmVuZHINCj4+ICDC
oC5lbmRtDQo+PiAgIA0KPj4gKy8qDQo+PiArICogVGhpcyBleHBhbmRzIHRvIGEgc2VxdWVuY2Ug
b2YgcmVnaXN0ZXIgY2xlYXJzIGZvciByZWdzIHN0YXJ0IHRvDQo+PiBlbmQNCj4+ICsgKiBpbmNs
dXNpdmUsIG9mIHRoZSBmb3JtOg0KPj4gKyAqDQo+PiArICrCoMKgIGxpIHJOLCAwDQo+PiArICov
DQo+PiArLm1hY3JvIE5VTExJRllfUkVHUyBzdGFydCwgZW5kDQo+PiArwqDCoMKgwqDCoMKgwqAu
THJlZz1cc3RhcnQNCj4+ICvCoMKgwqDCoMKgwqDCoC5yZXB0IChcZW5kIC0gXHN0YXJ0ICsgMSkN
Cj4+ICvCoMKgwqDCoMKgwqDCoGxpwqDCoMKgwqDCoMKgLkxyZWcsIDANCj4+ICvCoMKgwqDCoMKg
wqDCoC5McmVnPS5McmVnKzENCj4+ICvCoMKgwqDCoMKgwqDCoC5lbmRyDQo+PiArLmVuZG0NCj4+
ICsNCj4gDQo+IEkgc3VwcG9zZSB0aGlzIGNvdWxkIGJlIGRvbmUgdXNpbmcgdGhlIGV4aXN0aW5n
IE9QX1JFR1MgbWFjcm8sDQo+IHNvbWV0aGluZyBsaWtlIE9QX1JFR1MgbGksIDAsIHN0YXJ0LCBl
bmQsIDAsIDAgLSBidXQgYSBsb2FkIGltbWVkaWF0ZQ0KPiBpcyBzZW1hbnRpY2FsbHkgYSBiaXQg
ZGlmZmVyZW50IGZyb20gdGhlIGV4aXN0aW5nIHVzZXMgb2YgT1BfUkVHUyBzbyBJDQo+IGRvbid0
IG1pbmQgZWl0aGVyIHdheQ0KDQpOb3Qgc3VyZSBpdCB3b3VsZCB3b3JrLiBZb3UnZCBnZXQ6DQoN
CglsaQkuTHJlZywgMCArIDAgKiAuTHJlZygwKQ0KDQoNCkV2ZW4gaWYgaXQgd29ya3MgdGhhdCB3
b3VsZCBiZSBvZGQuDQoNCj4gDQo+PiAgwqAvKg0KPj4gIMKgICogTWFjcm9zIGZvciBzdG9yaW5n
IHJlZ2lzdGVycyBpbnRvIGFuZCBsb2FkaW5nIHJlZ2lzdGVycyBmcm9tDQo+PiAgwqAgKiBleGNl
cHRpb24gZnJhbWVzLg0KPj4gQEAgLTQ5LDYgKzYzLDE0IEBADQo+PiAgwqAjZGVmaW5lIFJFU1Rf
TlZHUFJTKGJhc2UpwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoFJFU1RfR1BSUygxMywgMzEs
IGJhc2UpDQo+PiAgwqAjZW5kaWYNCj4+ICAgDQo+PiArI2RlZmluZcKgwqDCoMKgwqDCoMKgwqBO
VUxMSUZZX0dQUlMoc3RhcnQsIGVuZCnCoMKgwqDCoMKgwqDCoMKgTlVMTElGWV9SRUdTIHN0YXJ0
LA0KPj4gZW5kDQo+PiArI2lmZGVmIF9fcG93ZXJwYzY0X18NCj4+ICsjZGVmaW5lwqDCoMKgwqDC
oMKgwqDCoE5VTExJRllfTlZHUFJTKCnCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoE5V
TExJRllfR1BSUygxNCwgMzEpDQo+PiArI2Vsc2UNCj4+ICsjZGVmaW5lwqDCoMKgwqDCoMKgwqDC
oE5VTExJRllfTlZHUFJTKCnCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoE5VTExJRllf
R1BSUygxMywgMzEpDQo+PiArI2VuZGlmDQo+PiArI2RlZmluZcKgwqDCoMKgwqDCoMKgwqBOVUxM
SUZZX0dQUihuKcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoE5VTExJRllfR1BS
UyhuLCBuKQ0KPj4gKw0KPj4gIMKgI2RlZmluZSBTQVZFX0dQUihuLCBiYXNlKcKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqBTQVZFX0dQUlMobiwgbiwgYmFzZSkNCj4+ICDCoCNkZWZpbmUgUkVT
VF9HUFIobiwgYmFzZSnCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgUkVTVF9HUFJTKG4sIG4s
IGJhc2UpDQo+PiAgIA0KPiA=
