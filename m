Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ABA973B010
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jun 2023 07:30:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=MZckpbZ0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QnQn66c7Tz3bT2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jun 2023 15:30:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=MZckpbZ0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::62d; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on2062d.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::62d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QnQm81mrzz30BM
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jun 2023 15:29:43 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jITTnHEglfjrxWgUPQ2nJ0M2xDUMZe4eZyXZScd0ZzEJ/T3uloKoMNR/Cj55oJ7snIW2OQkAuxpj1YR5sSyQj6yRtGGIAbrrdYUpdgZXlVZN9AqpX//Z32bYYrA3W/FZMxLgec8RJFjulGpSY3kjn9zybMG6L9+Ue6X0/R8u4rj70Or4selX3igRrr+IS+RL5Dlw3zOEoQCx4kgWC43FxSMAft34oBJWYmgKvgSdbuHvCg9jlBrhSXzzuryqfUlEEdoOCTZ5SDe9Wz6UxmZHmAZycvmj1Xlp3DCd5GY98j2WS2kmhlDOVc+IlVe83C7BFlMVTzL8zL2vFrDZBQ1x9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ERXdpVwrDraj+RLwWIpwnnLyADpmnMpM5/j4vDLl5ME=;
 b=mRO75NJWdEQsHXeULqbgI2Cz7sAjDG0akAMH4uvDrlU4H54T0bA5jb42Q5FxuFmkfl2i0+8GbQHbpSORQj8RkeSKGNKTwAA0yZ/crxmSGjjKMVck+KXER4CQTQCEKHUfxzVluferC4RRMAAbYOJ/CeKuJvd2s8cK4ZLpc76PF8+erJZ46B4GsJrBa4sax/7ZKyrAibtTUC7CcTQW6iuPlp97Z9RxsdlOwzzKWQ+FOk4Wp2veo0Qb9IYV8VvDsFDAyef8U5VehpY4vrWdoQISzwaA7iRgrzduqU2EHU0lzFNf7aYcdnd4qbqi3eYrXm1jU2xXJGNJhyDSheImK42zmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ERXdpVwrDraj+RLwWIpwnnLyADpmnMpM5/j4vDLl5ME=;
 b=MZckpbZ0XTKrxeNCbgilV+jaDRQiy3V9Q2VoOj+Oq7e2Db8YmSKnXKNhK4kWxiOLZOZvla83v036rti1axQDvXJlNzoaQst32DWe+Cq/Hh7Gs3Fo8KMCW/kgx/rJTool1S16hL4KLPr+U2VY+e5qe7Oy7kSTKq9xfMpagDuTxEGSAixt6tTtkcRyLIW/Uby7xc/hZSc0Mk/UtyX3A8xKTxYntFdIy229S7f+ShM2MgvT41ElO9YJ4mILvxejybT9ZYx3QjHDWvq8R9lTFRT8oHQAzTKsQwANWjCccZUmiYoDyaljpomc4C+5ISSebZ8ViewxOPg2nqeg2T3fzR9+FA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB2317.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Fri, 23 Jun
 2023 05:29:27 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::802b:33:561c:4217]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::802b:33:561c:4217%4]) with mapi id 15.20.6521.026; Fri, 23 Jun 2023
 05:29:27 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Naveen N Rao <naveen@kernel.org>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 10/17] powerpc/ftrace: Add separate ftrace_init_nop() with
 additional validation
Thread-Topic: [PATCH 10/17] powerpc/ftrace: Add separate ftrace_init_nop()
 with additional validation
Thread-Index: AQHZopVlFAsVCfuTu0atpFXfEgEBFq+X4i4A
Date: Fri, 23 Jun 2023 05:29:27 +0000
Message-ID: <327c6d9d-8de4-080d-9996-f573d531b308@csgroup.eu>
References: <cover.1687166935.git.naveen@kernel.org>
 <f373684081e8e98be09b7f44d2d93069768324dc.1687166935.git.naveen@kernel.org>
In-Reply-To:  <f373684081e8e98be09b7f44d2d93069768324dc.1687166935.git.naveen@kernel.org>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PAZP264MB2317:EE_
x-ms-office365-filtering-correlation-id: 7dcec233-f773-404c-f89a-08db73aacfd8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  4DGrfJb3D+UI1n/XfwjNHoV7Ujgx7zBefWMJBtFBzDm0y/TKtP8BSTDK7Kyt99ujZMBoxY9qGb/miP9fY6eM8o6nzYz50m1vQJGI7Hf7kmHXvxXuFujRj1NXbklgvDHFqYPSnO4U8UjUqs9Ut+u5flvtcEMRWP0iuAqXWsEryZs5QJyC3lkoyJzS1X42J4WIctni5uCIB6QhiJVq6WDLcbkThJfYR8uZbiiYMoiryRsRexuwdJsUF9ry2ITFG9LceVJjVDHskHJA39jAV9gbNUHwBK6iT8eGPlbbl4esldViEBFmiWfyuTkymTbi6xaUJSTmZRyur9lWXe62rb74M6F0hhylohdgGCcyoO4HFmilvWefZKqx16QcWICrhpmSOag/aa4gRLwCUfN1MiyM5SkvHbX8u0eZnPIrGzD3juRGAehUrIUPjhx2rPGR1tMgQ33LNkKyCUnWqsXP8hsP10rAPj+/DuEsFAI2Et2Ebk62T5kGNzP5a9r/Nm4csVFTAbOQAbogyQyrYvq7qqiPbjbsBnH/XdbqD7jAXfqGAeAfxBLSKAp8GbxBbtj9zsUOkHtLDSm9EiYRXpRn//ms2Qq589sQgarqFwxC4BinxeY8Bfwzadn8VlAhyveu7WrUClx4MzmD3lcIp+arIZYYGemNuPh0+Pvh+XTtudTQfoKTYYvcy3zNPPobKsJYYRqZ
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(366004)(346002)(376002)(39850400004)(451199021)(31686004)(478600001)(71200400001)(110136005)(4326008)(91956017)(76116006)(2616005)(86362001)(83380400001)(66574015)(38070700005)(31696002)(36756003)(2906002)(66946007)(186003)(26005)(6506007)(6512007)(6486002)(41300700001)(122000001)(38100700002)(66476007)(66556008)(64756008)(8936002)(66446008)(8676002)(5660300002)(44832011)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?dDdQdVpOZ3NHM3hFeU9CYkptMXBYdnRwcXJIeDg1cDZ4UFpGdlUyRStKMzFj?=
 =?utf-8?B?ZC9tLzJqTkZ1aWw2NUtLa3NscXpHMG0rV3NCUDZDa0cvdy81REdmVlkxeUtp?=
 =?utf-8?B?NDVKVDJqb0VKVnE5YVFxa241dkxLZ3NScEFsZVArYkplbjdNRzNzbitwWXp3?=
 =?utf-8?B?V0d5dm9Bb2hLTVFrY2lFeGZwcE52NTlPRndwYVVVUHBlS0wxOHF1S2oweUtu?=
 =?utf-8?B?TytBQm9VOWhIVWlBcUJaU054cS8vVVBlaFl5bm5PbW54ZHZyNlh5M2oyd2ZC?=
 =?utf-8?B?VExJNEhCYTViblFqOGEwZGtmalJuVzBuMEFUcW51MHR5OVQrN3hlTEVrWVdh?=
 =?utf-8?B?RmhvYmZFaCtxMS85SndLOHBPRFE0TWNUYVZSdVFITExKaG9ZdUpDbG5wZ1ky?=
 =?utf-8?B?SHkwRmFoa3ZKRTd4WHJKNlZjM2lpYVZGUWhNK1QrNUUydU5tMDczZERKeUNs?=
 =?utf-8?B?RTF3YzRXeEpyS2wyQVNERkFFSDNaMFhlUC9yeVZWZmhmTHBianpJSStzcUhh?=
 =?utf-8?B?TzVVbDA0VThaSzFqcVhrOXZHRTM1SnlLWHFDWXlnbzdvLzUvR3JXK0VVa0dk?=
 =?utf-8?B?dGpmcGt6NE5iVTdOUTQrQk5ONjI4RCtnR3RpeU1MQzhIcVd5ajB3TTJXZmtw?=
 =?utf-8?B?dzJtNDhWMU03K1NKZmpQNytiTUM0M0szNDlBUTY1RVRLOGJEVW5WUWlUVVdj?=
 =?utf-8?B?dGFPUUJPZGtRSXJidnNFQ3lOdDVtRlNHdTFqTlI4ejVnc1JzYnAwNXZHb3dD?=
 =?utf-8?B?S0Z2TUdEd1BzZVltZ0pzUUNLTS9XTW4yQlQwOGszYjJhcWk2QkpQcm1jNVZK?=
 =?utf-8?B?WkhqdEVjOVFEQmRkSHlxRGVaY1JDcFNyYVd4TjNHWi9uMWFDK2lRM2JWQXdy?=
 =?utf-8?B?QklBWGI4UGMzNFhwM3UzYjNBbVlQU0JpcnVZWlNEeklnUjlvNUxjbWtGdDkz?=
 =?utf-8?B?N2hrWnpUM0hzL0xaY2xJZjNZUUJHRTgzdXRtTTVxQ1k3ZVdVbHNzb2lJeldD?=
 =?utf-8?B?alJNSXlGRkE0RzlReGd5RktKZDNzbUJtUEQ0K0pvUnlPR3R2QUpWRGwwc09W?=
 =?utf-8?B?d0JvQUdkZXRadUZwSXdxZm4yUE96V3RLWlhBZDdhcGRRUXlNYXJmcEJvc3Nw?=
 =?utf-8?B?UmRud2h6MGt4QzRnSmkvV3RpL2VBeU1uSHBETUFXQkVhaUFKNWR0NnlWOVp1?=
 =?utf-8?B?ck5MZ2JyYzJsMTRKWHZGZ2FkS3pUOTE3dzF0UE4rbEtwNWxLcXA1SGp2d2Ev?=
 =?utf-8?B?WHFtb21MOEtINXZkektYcDJDbFNtV2pDcWNBYkdHMU0relZQY3VmK29SMWhH?=
 =?utf-8?B?RXo0eXAwdlBrQXVZd2ltVEZ5VE1lcE1PU2dXN1BmellEMEhON21kMzNsakRB?=
 =?utf-8?B?NEd5SzZDZTVPZHFmZWsvTlptWC9Tdk10N2V6V3QwUzRtVDVGQm81L3dBc1VY?=
 =?utf-8?B?VzY4ZGNVRzhVd3h3RUI4QzhhU29lUDluUkdiZ21vWlhNdnJZQlcvOGlidG9F?=
 =?utf-8?B?Vmp5aVpteUlNWXUydkZUWU1pMXpaZlpYMjhnV2kzTUE1L25XamZNekF5bnJG?=
 =?utf-8?B?UG5FcXZpY2xnRW5SSlJYS3hNRUgxeTRVdVhxVVdwY0l2emVKU0M1VkVldnhz?=
 =?utf-8?B?V24ycWRpc2h6bWg5T3FPRXhTRHgvdUdOMHc5dGZXYzJXbUt5UXpuNUo2d0lG?=
 =?utf-8?B?eUw1d21uT3ptc1VCWWZtOVhFSHpneDg2a1FiQk1XVzRFKy9WdmFYWlJ6TTQy?=
 =?utf-8?B?SXlDaS94Nnh2dG1kd0JpMC9CeFhlcENtOEhSWTFjZC84WmhVdW9zSGV4dkNm?=
 =?utf-8?B?RTVDY1VoOWtRanFsRjRKSFlXU09XcURTcHFzKzEvNlk0Y1JYOE1lc1h5THA3?=
 =?utf-8?B?cUlSY0QwbVlaQ0RScWV2OWN0QWpPMW52cElnc01UZ1F0Vlh5V3dPT2QrWERL?=
 =?utf-8?B?ZjdkdGNlV2tuZkE5Q1pvUHEvVElsSXdESnVVTWJsS1FObmVMMVNRNjZJL1hT?=
 =?utf-8?B?M0xVQ2FPZ0hFamxLSHlOSU1EazhkY3BaOHBzNmFlcDhhZVlBb2d6TU9Fb0RN?=
 =?utf-8?B?YjRQWTc2U2NyRUVKcFdjbXhHZU9BNXB6TktIN1hQOXppT2dxU0k1bHVhZDlv?=
 =?utf-8?B?M244Qzg1VkxBUWZzUWlPUFVuOXZQdXF0QzFLTXRWR2JWS1FOUE1QUC9NSmdU?=
 =?utf-8?B?S1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <25B6124BDF51C046ACD3DA88EC6A1FFA@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dcec233-f773-404c-f89a-08db73aacfd8
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2023 05:29:27.1374
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iXrmcgxVR9jSpc0F6y7az3N6wOTh8GS77amdXcTMvtuNzRN2Ui6Nx5qBVrEMlQS3oE+iOWjVtRvJSIH0LkaytI8KlMTJjmZ6zihtFG+70M8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB2317
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
Cc: Steven Rostedt <rostedt@goodmis.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE5LzA2LzIwMjMgw6AgMTE6NDcsIE5hdmVlbiBOIFJhbyBhIMOpY3JpdMKgOg0KPiBD
dXJyZW50bHksIHdlIHZhbGlkYXRlIGluc3RydWN0aW9ucyBhcm91bmQgdGhlIGZ0cmFjZSBsb2Nh
dGlvbiBldmVyeQ0KPiB0aW1lIHdlIGhhdmUgdG8gZW5hYmxlL2Rpc2FibGUgZnRyYWNlLiBJbnRy
b2R1Y2UgZnRyYWNlX2luaXRfbm9wKCkgdG8NCj4gaW5zdGVhZCBwZXJmb3JtIGFsbCB0aGUgdmFs
aWRhdGlvbiBkdXJpbmcgZnRyYWNlIGluaXRpYWxpemF0aW9uLiBUaGlzDQo+IGFsbG93cyB1cyB0
byBzaW1wbHkgcGF0Y2ggdGhlIG5lY2Vzc2FyeSBpbnN0cnVjdGlvbnMgZHVyaW5nDQo+IGVuYWJs
aW5nL2Rpc2FibGluZyBmdHJhY2UuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBOYXZlZW4gTiBSYW8g
PG5hdmVlbkBrZXJuZWwub3JnPg0KDQpSZXZpZXdlZC1ieTogQ2hyaXN0b3BoZSBMZXJveSA8Y2hy
aXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1Pg0KDQo+IC0tLQ0KPiAgIGFyY2gvcG93ZXJwYy9pbmNs
dWRlL2FzbS9mdHJhY2UuaCAgfCAgNiArKysNCj4gICBhcmNoL3Bvd2VycGMva2VybmVsL3RyYWNl
L2Z0cmFjZS5jIHwgNzEgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ICAgMiBmaWxl
cyBjaGFuZ2VkLCA3NyBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dl
cnBjL2luY2x1ZGUvYXNtL2Z0cmFjZS5oIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Z0cmFj
ZS5oDQo+IGluZGV4IDcwMmFhZjJlZmE5NjZjLi5lZjlmMGI5NzY3MGQxYyAxMDA2NDQNCj4gLS0t
IGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Z0cmFjZS5oDQo+ICsrKyBiL2FyY2gvcG93ZXJw
Yy9pbmNsdWRlL2FzbS9mdHJhY2UuaA0KPiBAQCAtMjksMTEgKzI5LDE3IEBAIHN0YXRpYyBpbmxp
bmUgdW5zaWduZWQgbG9uZyBmdHJhY2VfY2FsbF9hZGp1c3QodW5zaWduZWQgbG9uZyBhZGRyKQ0K
PiAgIHVuc2lnbmVkIGxvbmcgcHJlcGFyZV9mdHJhY2VfcmV0dXJuKHVuc2lnbmVkIGxvbmcgcGFy
ZW50LCB1bnNpZ25lZCBsb25nIGlwLA0KPiAgIAkJCQkgICAgdW5zaWduZWQgbG9uZyBzcCk7DQo+
ICAgDQo+ICtzdHJ1Y3QgbW9kdWxlOw0KPiArc3RydWN0IGR5bl9mdHJhY2U7DQo+ICAgc3RydWN0
IGR5bl9hcmNoX2Z0cmFjZSB7DQo+ICAgCXN0cnVjdCBtb2R1bGUgKm1vZDsNCj4gICB9Ow0KPiAg
IA0KPiAgICNpZmRlZiBDT05GSUdfRFlOQU1JQ19GVFJBQ0VfV0lUSF9BUkdTDQo+ICsjZGVmaW5l
IGZ0cmFjZV9uZWVkX2luaXRfbm9wKCkJKHRydWUpDQo+ICtpbnQgZnRyYWNlX2luaXRfbm9wKHN0
cnVjdCBtb2R1bGUgKm1vZCwgc3RydWN0IGR5bl9mdHJhY2UgKnJlYyk7DQo+ICsjZGVmaW5lIGZ0
cmFjZV9pbml0X25vcCBmdHJhY2VfaW5pdF9ub3ANCj4gKw0KPiAgIHN0cnVjdCBmdHJhY2VfcmVn
cyB7DQo+ICAgCXN0cnVjdCBwdF9yZWdzIHJlZ3M7DQo+ICAgfTsNCj4gZGlmZiAtLWdpdCBhL2Fy
Y2gvcG93ZXJwYy9rZXJuZWwvdHJhY2UvZnRyYWNlLmMgYi9hcmNoL3Bvd2VycGMva2VybmVsL3Ry
YWNlL2Z0cmFjZS5jDQo+IGluZGV4IDI3OGJmOGU1MmI2ZTg5Li45OGJkMDk5YzQyOGVlMCAxMDA2
NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL2tlcm5lbC90cmFjZS9mdHJhY2UuYw0KPiArKysgYi9h
cmNoL3Bvd2VycGMva2VybmVsL3RyYWNlL2Z0cmFjZS5jDQo+IEBAIC0zMSw2ICszMSwxNiBAQA0K
PiAgICNkZWZpbmUJTlVNX0ZUUkFDRV9UUkFNUFMJMg0KPiAgIHN0YXRpYyB1bnNpZ25lZCBsb25n
IGZ0cmFjZV90cmFtcHNbTlVNX0ZUUkFDRV9UUkFNUFNdOw0KPiAgIA0KPiArc3RhdGljIHBwY19p
bnN0X3QgZnRyYWNlX2NyZWF0ZV9icmFuY2hfaW5zdCh1bnNpZ25lZCBsb25nIGlwLCB1bnNpZ25l
ZCBsb25nIGFkZHIsIGludCBsaW5rKQ0KPiArew0KPiArCXBwY19pbnN0X3Qgb3A7DQo+ICsNCj4g
KwlXQVJOX09OKCFpc19vZmZzZXRfaW5fYnJhbmNoX3JhbmdlKGFkZHIgLSBpcCkpOw0KPiArCWNy
ZWF0ZV9icmFuY2goJm9wLCAodTMyICopaXAsIGFkZHIsIGxpbmsgPyBCUkFOQ0hfU0VUX0xJTksg
OiAwKTsNCj4gKw0KPiArCXJldHVybiBvcDsNCj4gK30NCj4gKw0KPiAgIHN0YXRpYyBwcGNfaW5z
dF90DQo+ICAgZnRyYWNlX2NhbGxfcmVwbGFjZSh1bnNpZ25lZCBsb25nIGlwLCB1bnNpZ25lZCBs
b25nIGFkZHIsIGludCBsaW5rKQ0KPiAgIHsNCj4gQEAgLTU5Nyw2ICs2MDcsNjcgQEAgaW50IGZ0
cmFjZV9tb2RpZnlfY2FsbChzdHJ1Y3QgZHluX2Z0cmFjZSAqcmVjLCB1bnNpZ25lZCBsb25nIG9s
ZF9hZGRyLA0KPiAgIH0NCj4gICAjZW5kaWYNCj4gICANCj4gK2ludCBmdHJhY2VfaW5pdF9ub3Ao
c3RydWN0IG1vZHVsZSAqbW9kLCBzdHJ1Y3QgZHluX2Z0cmFjZSAqcmVjKQ0KPiArew0KPiArCXVu
c2lnbmVkIGxvbmcgYWRkciwgaXAgPSByZWMtPmlwOw0KPiArCXBwY19pbnN0X3Qgb2xkLCBuZXc7
DQo+ICsJaW50IHJldCA9IDA7DQo+ICsNCj4gKwkvKiBWZXJpZnkgaW5zdHJ1Y3Rpb25zIHN1cnJv
dW5kaW5nIHRoZSBmdHJhY2UgbG9jYXRpb24gKi8NCj4gKwlpZiAoSVNfRU5BQkxFRChDT05GSUdf
UFBDMzIpKSB7DQo+ICsJCS8qIEV4cGVjdGVkIHNlcXVlbmNlOiAnbWZsciByMCcsICdzdHcgcjAs
NChyMSknLCAnYmwgX21jb3VudCcgKi8NCj4gKwkJcmV0ID0gZnRyYWNlX3ZhbGlkYXRlX2luc3Qo
aXAgLSA4LCBwcGNfaW5zdChQUENfUkFXX01GTFIoX1IwKSkpOw0KPiArCQlpZiAoIXJldCkNCj4g
KwkJCXJldCA9IGZ0cmFjZV92YWxpZGF0ZV9pbnN0KGlwIC0gNCwgcHBjX2luc3QoUFBDX1JBV19T
VFcoX1IwLCBfUjEsIDQpKSk7DQo+ICsJfSBlbHNlIGlmIChJU19FTkFCTEVEKENPTkZJR19NUFJP
RklMRV9LRVJORUwpKSB7DQo+ICsJCS8qIEV4cGVjdGVkIHNlcXVlbmNlOiAnbWZsciByMCcsIFsn
c3RkIHIwLDE2KHIxKSddLCAnYmwgX21jb3VudCcgKi8NCj4gKwkJcmV0ID0gZnRyYWNlX3JlYWRf
aW5zdChpcCAtIDQsICZvbGQpOw0KPiArCQlpZiAoIXJldCAmJiAhcHBjX2luc3RfZXF1YWwob2xk
LCBwcGNfaW5zdChQUENfUkFXX01GTFIoX1IwKSkpKSB7DQo+ICsJCQlyZXQgPSBmdHJhY2VfdmFs
aWRhdGVfaW5zdChpcCAtIDgsIHBwY19pbnN0KFBQQ19SQVdfTUZMUihfUjApKSk7DQo+ICsJCQly
ZXQgfD0gZnRyYWNlX3ZhbGlkYXRlX2luc3QoaXAgLSA0LCBwcGNfaW5zdChQUENfUkFXX1NURChf
UjAsIF9SMSwgMTYpKSk7DQo+ICsJCX0NCj4gKwl9IGVsc2Ugew0KPiArCQlyZXR1cm4gLUVJTlZB
TDsNCj4gKwl9DQo+ICsNCj4gKwlpZiAocmV0KQ0KPiArCQlyZXR1cm4gcmV0Ow0KPiArDQo+ICsJ
aWYgKCFjb3JlX2tlcm5lbF90ZXh0KGlwKSkgew0KPiArCQlpZiAoIW1vZCkgew0KPiArCQkJcHJf
ZXJyKCIweCVseDogTm8gbW9kdWxlIHByb3ZpZGVkIGZvciBub24ta2VybmVsIGFkZHJlc3NcbiIs
IGlwKTsNCj4gKwkJCXJldHVybiAtRUZBVUxUOw0KPiArCQl9DQo+ICsJCXJlYy0+YXJjaC5tb2Qg
PSBtb2Q7DQo+ICsJfQ0KPiArDQo+ICsJLyogTm9wLW91dCB0aGUgZnRyYWNlIGxvY2F0aW9uICov
DQo+ICsJbmV3ID0gcHBjX2luc3QoUFBDX1JBV19OT1AoKSk7DQo+ICsJYWRkciA9IE1DT1VOVF9B
RERSOw0KPiArCWlmIChpc19vZmZzZXRfaW5fYnJhbmNoX3JhbmdlKGFkZHIgLSBpcCkpIHsNCj4g
KwkJLyogV2l0aGluIHJhbmdlICovDQo+ICsJCW9sZCA9IGZ0cmFjZV9jcmVhdGVfYnJhbmNoX2lu
c3QoaXAsIGFkZHIsIDEpOw0KPiArCQlyZXQgPSBmdHJhY2VfbW9kaWZ5X2NvZGUoaXAsIG9sZCwg
bmV3KTsNCj4gKwl9IGVsc2UgaWYgKGNvcmVfa2VybmVsX3RleHQoaXApIHx8IChJU19FTkFCTEVE
KENPTkZJR19NT0RVTEVTKSAmJiBtb2QpKSB7DQo+ICsJCS8qDQo+ICsJCSAqIFdlIHdvdWxkIGJl
IGJyYW5jaGluZyB0byBhIGxpbmtlci1nZW5lcmF0ZWQgc3R1Yiwgb3IgdG8gdGhlIG1vZHVsZSBf
bWNvdW50DQo+ICsJCSAqIHN0dWIuIExldCdzIGp1c3QgY29uZmlybSB3ZSBoYXZlIGEgJ2JsJyBo
ZXJlLg0KPiArCQkgKi8NCj4gKwkJcmV0ID0gZnRyYWNlX3JlYWRfaW5zdChpcCwgJm9sZCk7DQo+
ICsJCWlmIChyZXQpDQo+ICsJCQlyZXR1cm4gcmV0Ow0KPiArCQlpZiAoIWlzX2JsX29wKG9sZCkp
IHsNCj4gKwkJCXByX2VycigiMHglbHg6IGV4cGVjdGVkIChibCkgIT0gZm91bmQgKCUwOGx4KVxu
IiwgaXAsIHBwY19pbnN0X2FzX3Vsb25nKG9sZCkpOw0KPiArCQkJcmV0dXJuIC1FSU5WQUw7DQo+
ICsJCX0NCj4gKwkJcmV0ID0gcGF0Y2hfaW5zdHJ1Y3Rpb24oKHUzMiAqKWlwLCBuZXcpOw0KPiAr
CX0gZWxzZSB7DQo+ICsJCXJldHVybiAtRUlOVkFMOw0KPiArCX0NCj4gKw0KPiArCXJldHVybiBy
ZXQ7DQo+ICt9DQo+ICsNCj4gICBpbnQgZnRyYWNlX3VwZGF0ZV9mdHJhY2VfZnVuYyhmdHJhY2Vf
ZnVuY190IGZ1bmMpDQo+ICAgew0KPiAgIAl1bnNpZ25lZCBsb25nIGlwID0gKHVuc2lnbmVkIGxv
bmcpKCZmdHJhY2VfY2FsbCk7DQo=
