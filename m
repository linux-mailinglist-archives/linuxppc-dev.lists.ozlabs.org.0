Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1F474E603
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 06:42:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=IS8RnXKs;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R0Ss91RxTz3cHc
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 14:42:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=IS8RnXKs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::631; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20631.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::631])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R0Sr070cmz3c53
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 14:41:20 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dkg+dhiC9eOuEe1PiFLfbNfSFd/Nk78dajFb8TD+beNjNnMhUhbsx4Q6Hgrz9CGw7Jaxf0g1VPZkazEH0Y4UAd//MqxAE4PcP6M/HmYs9XQrxBu9qTYET2C0wwI2jR+56yaanY1nTXqubCFHctRep6BR+F4MSjldJwEVK9hxQrD4xogdi32oI51tafZPOv4jM4x1kr0nvc/Cm8XyjBCRMYRz9mmb3KZxq+k20eU4q3hYSQJE0b/6UxWi716ncTK5wYifSWg/0UxEH/ImAV2/+txGzG9jTDMP/u4LjF9m5YnXmYEyDEEOVhAmSnXzWh99H7MuRzI6A7MrkAg3Pd+nJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yCwPcaO0byWVa1nZNh00YNkncAGfeLEGNhK44vctNLw=;
 b=M3NhcM/F7SYQ6ogdySAcZQcB2EQ9eLEtw3Wtin09A/sULVTXQ9NGsORhYNz2pVSf/V5nysMDghCTivOEO2REPf/gDsLU6VL0e6UQ/oUeZcoLoI1Dd1QLvhCFrSp9Y+YvmidKZJJxOoMm7u8Jm2MI8arIyD4qxen4HDiQP2Qzq7BqoqjGlFFV8UoePR7rZnkcquYWkHv+8o5+desUURSceEIt3DCNaGWQn2rWJVrvLYJ1E6+IwpAaicfo2cgNkYeLM2Js9hwC0jCEE6gVb1zd4fHXfjVTxN3uJL/y7RwmNr0oLKJTYU4Y7E8+TnU+Vpq5Gsu7ajPT/3VBtu1BLtJJsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yCwPcaO0byWVa1nZNh00YNkncAGfeLEGNhK44vctNLw=;
 b=IS8RnXKs5DnpwvaO/AuHp9xVhUbgRTyobhZVvw/qPJpzEoHzpSQCc7zKCx1YZrLtln4dttyyECw78vp9TRoWwQbLQNY4VeAcFxnDOz3KBDDj9k9cj+iZ73EMISbjBNyX3rH87Ffi+QWXoGDc/o0pVHPsHccaO3IkNlpVcb7+M/0f0y1d6dSFJqqLIy8MPUBjKRw8WslknZuivY+AXduIh+e6rYaQpfvJ6frweo3oVd79JlH/puuDLbXVFe2NIb18cnB+EKMcqBL7508F1bytqUjikTY0vXAOpCnnRJMhIg0VeXhdeARgohqenaH0sEIzGckiA3V8HJO3btFucYSWKA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB1818.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:16d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.31; Tue, 11 Jul
 2023 04:41:02 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::802b:33:561c:4217]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::802b:33:561c:4217%4]) with mapi id 15.20.6565.028; Tue, 11 Jul 2023
 04:41:02 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>, Andrew Morton
	<akpm@linux-foundation.org>
Subject: Re: [PATCH v5 21/38] powerpc: Implement the new page table range API
Thread-Topic: [PATCH v5 21/38] powerpc: Implement the new page table range API
Thread-Index: AQHZs29FHuHrvHpmS0ydqfgGHaks3a+z/OsA
Date: Tue, 11 Jul 2023 04:41:02 +0000
Message-ID: <52ef5803-85df-ad29-9ca4-0aa9498dcb59@csgroup.eu>
References: <20230710204339.3554919-1-willy@infradead.org>
 <20230710204339.3554919-22-willy@infradead.org>
In-Reply-To: <20230710204339.3554919-22-willy@infradead.org>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB1818:EE_
x-ms-office365-filtering-correlation-id: 82338169-5ec6-4805-11b6-08db81c907ae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  dUPRUXHK0kMPYq0tS8vUm5e68HApLbryaq2HNde/8nizLTmyuxhvlQ7mTsR3K/ByX22W5KEU/D0MABJxQ4n/KHCgqJGh9yWjfXsjzKIUWJNw4iYz6BPFg4QW65dPkYVFOOgfH9PGhc7j4XBpyJgqBfU0+++j1hmwQ6l6we6yA6QNviVxg3/fZXtjwYqcaAy6InTj+WqlFCY+yU7bmVuB/RF/lCtQAWO1866gYx/kRgYR/vtFqozTgvP5XcMYQWtY6rS+5I/6BF1Pd0HkOBZMpHqajEc4DPFk2Dh/yJ/e8XCBoz6ErKMONbgOxedMM571xTr6A6zOsKBRmxtxwKWSqEdm+MUJDWbyQvSRMp8xDctD87g7RAnjR1AfxvgyArnryzFnxnYiCJTVytwTL+Hp+XLiVPr2R1Vty2Bojp6o6vG7169+6mcLpDGxarAp9FVlMeKfnwKsd+/upAbmpLkAERSktF27bss4vdwLAySV+ZXRuN+SJfd9KFgJWXna6w4+/UhU60bbs0uFd4H/iB0wg6Gt+1ammOiqIQV9lpq9ah2l+GzyeQSdlcyBrKxPI6SPCgn54J3fyFhaDkRdz0cbF3Fi6aU9PH1egRrVU91lr6bhWF0zDzVND1vsindy6aJ2GgDIXx9vhRLP4RkmZU+gYISqhzDgDc3WL3eHaKHM5bxda4dQjDl4BrezzZgug1ld
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39850400004)(136003)(396003)(366004)(376002)(346002)(451199021)(31686004)(76116006)(6486002)(478600001)(110136005)(71200400001)(91956017)(54906003)(66574015)(83380400001)(36756003)(86362001)(31696002)(38070700005)(2616005)(2906002)(30864003)(66946007)(186003)(6506007)(26005)(6512007)(64756008)(122000001)(38100700002)(8676002)(5660300002)(4326008)(316002)(66476007)(41300700001)(8936002)(66556008)(44832011)(66446008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?MnJUem9mRWliT3hRSm9KTkNmM2I3QnJXODkrSXBoeVlWVHB0MGQ2cFZHY3hQ?=
 =?utf-8?B?RllHSXgvRGgzRk4wQUY3RWpKS25DdmpHZjlBWk50Yzd4MmFXSEdhQkpkTGlp?=
 =?utf-8?B?VG5TajFDRzdZU2xrYnFSVlNFa2xnanJTNyt5TE5hMGdyMGllN3VWZit2Q2hX?=
 =?utf-8?B?b2hCTFJDRHp3Z09HYW50OGw1TThGemFpUzh5enN1N0tVL3kwbFdkNVA3Si9y?=
 =?utf-8?B?bnprYUhqekdLMDlMSXNhdmhKRzJyVzdudzZlV0FpTkR1b1dESXBHRCtvZ2Nl?=
 =?utf-8?B?cTRjemErM0hRUGdUYmd4SU1CN1JBVDNYYjRQbnVkL1YzM0FydWdKTTJsdStX?=
 =?utf-8?B?VWVvbEhEODZHTFpwRHc1ODBLMCsyL3E1NmszMEQzS3hFU1QrZlRUQ2k5YVlC?=
 =?utf-8?B?Qng4eVk5RkhuL3ZDS0w4YWp4VkNnb1JxRFZtTGcyNEp1aW0wOFdmZ1ZYcHYw?=
 =?utf-8?B?RnlnWEEwcDd5ejM4S2Y1U0VzdzJrTHVDaEx6RTdKV2t2d0pRUXQwYzdMYXJJ?=
 =?utf-8?B?eHRKTWhIUmkyWEpMWHlkNnhHMjRobDBHQ1JRL25Sb0dHbHhWTXk4VHNkOHZH?=
 =?utf-8?B?WW1YdTVUOEx5cGdXV0M4YjFqSmUxeE1RY3gralI0TDZRbTVRV0lPb3VaM1g1?=
 =?utf-8?B?TW0zaEhoOVpEeHljU2J3YnNJWkxaYVJvTHJUVHlBNzlQR3NsZnZtWDNRT1hq?=
 =?utf-8?B?N3pzaWJ0T1ZMRTNvN0VaYXM2dFFody9VSmVaR2crUGRGdEM0Zkw0VzdRN2gx?=
 =?utf-8?B?NVEwR2xTd0c1YUtVaWNiL3d6UUs1L1V1dzVSNFlEU0tJSnVhNlQyRTJNOFhE?=
 =?utf-8?B?ZndySUJRVHh5emtZbnExeFJBNjYwMDJRN2ZxWFNrcTdBUnNXVGxwN2NRaTgr?=
 =?utf-8?B?VkF0ZWJrbXNJNVVVWHlEbkV5YXlQaDBHVlVRUFJUM0JTWFpBT3VNV1FmTUVp?=
 =?utf-8?B?enBYK1U0VGtqKytTeFFTcENXSGh0VkZybHFCMmh5V01wQkxaYmNlNzJVQTBt?=
 =?utf-8?B?bTkvRFBoRXlXYVFkdS96UHdBdm54Wk51MFVkRjFlRjFTb21FTERQUXRTaGtJ?=
 =?utf-8?B?MS92YUtQaktCd2p2eUdhcXR1YTVPZ1RMaThuYVVRY1V6Y25GTXdLY2VET1l0?=
 =?utf-8?B?OGpWK1ZZd2Z3d1ZiZ2hkSjBnVDdNWTQ5WnRMWE9RZG1oODJLVXNvWklkSEpX?=
 =?utf-8?B?NUJlTHREdmt2OTNYWjZKYXRpOG9pUlZPRVJlL3lTaWpQakdYRVpnMlRKcG5C?=
 =?utf-8?B?SHlJWENTbFZOMWhyc05Kb3lUcGg4VkMwYTlZcTYwc09jdXhzcVZMVU5SK2dZ?=
 =?utf-8?B?V29OT0N5VWszdWRPYWNWWUNtZkl5REg4RVZhZDVjNVRGVUp5YWZmVDVMaHEx?=
 =?utf-8?B?NW1NZzBzQlNFVXVvTDhnNnJndWZNTFRXdnBKejc1VlJTWUlNSWxrTU1oTDA5?=
 =?utf-8?B?dEZ5QUFJa0dNeElFendXam54Uy9RdDFJTVUyVnhaNnlRUkpnVW1Uem5aT0sy?=
 =?utf-8?B?UTRLaVliNFIwL2RwSDNMZ2NIbE1ZeHUvOHRnQlR1TmRxYTVFRFYrVmpuNytM?=
 =?utf-8?B?UExJQit4ajVUWU01Wjd2T1dCSzM3dEV2UmZpRVpGT29nZ0ZyU3BSNy9pZU5I?=
 =?utf-8?B?aWdkditOOXQ2VlNRMjZ4a1lmbFFMYldGeXBVek4xdklTVEkwTktQak8rb2VB?=
 =?utf-8?B?ZWM3SnFOdXlIWWxIVyswUjBJcmQybjdaeGh4MnF5a0JrazVXR2tsZCt0OWxJ?=
 =?utf-8?B?bGpGajNaSGVhdmxwWFdWYlZlMG45WFc1QjF3OUVCSGxVNUVlc0V4OW1MRDRO?=
 =?utf-8?B?UGFyMW5FWXFKMU5MaDJLbUVuUVl6SXpHUzlDRTJXSElpMzhLVWxzUi9yVnha?=
 =?utf-8?B?YUJHeWNYanltNDVGWTY5VDRteCt6VWlCT1kzam41QkFUSmd1ZThKZWtISExS?=
 =?utf-8?B?bFRGRjJURjhieWNmR05jazJUdWNtSWhDWkJ6OWpiZ3h5Sm42OG1rOWUwcSs1?=
 =?utf-8?B?M1QyS3B1czVrZy9CSFJZUjdBNGU2emtNUXRJWUU2dURXZC9lT0RYNWxGMCtU?=
 =?utf-8?B?eDFsUFRVMmxUK1FmcGs4blJXYUNVY1hMTDgybFRaM250VGMvNk9nU3UxRnJv?=
 =?utf-8?B?MHZqcEV2VFFVem9mWHlkZmgyRVR1R2FDZldEczRmUTlzOVZOeEZsVERPYnBI?=
 =?utf-8?B?U3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <711950B02A85A44383764A696148956C@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 82338169-5ec6-4805-11b6-08db81c907ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2023 04:41:02.0256
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tOUJvISK5DLNBC1BCzpO5ZhWnJWzlLx10My1+n47GV995KheD0xdIzMonV4QrDHl8IEdM4lnvgVfpAMZKf31p61vE4Dv0mL5by0JhvvsIDA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB1818
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
Cc: "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDEwLzA3LzIwMjMgw6AgMjI6NDMsIE1hdHRoZXcgV2lsY294IChPcmFjbGUpIGEgw6lj
cml0wqA6DQo+IEFkZCBzZXRfcHRlcygpLCB1cGRhdGVfbW11X2NhY2hlX3JhbmdlKCkgYW5kIGZs
dXNoX2RjYWNoZV9mb2xpbygpLg0KPiBDaGFuZ2UgdGhlIFBHX2FyY2hfMSAoYWthIFBHX2RjYWNo
ZV9kaXJ0eSkgZmxhZyBmcm9tIGJlaW5nIHBlci1wYWdlIHRvDQo+IHBlci1mb2xpby4NCj4gDQo+
IFNpZ25lZC1vZmYtYnk6IE1hdHRoZXcgV2lsY294IChPcmFjbGUpIDx3aWxseUBpbmZyYWRlYWQu
b3JnPg0KPiBBY2tlZC1ieTogTWlrZSBSYXBvcG9ydCAoSUJNKSA8cnBwdEBrZXJuZWwub3JnPg0K
PiBDYzogTWljaGFlbCBFbGxlcm1hbiA8bXBlQGVsbGVybWFuLmlkLmF1Pg0KPiBDYzogTmljaG9s
YXMgUGlnZ2luIDxucGlnZ2luQGdtYWlsLmNvbT4NCj4gQ2M6IENocmlzdG9waGUgTGVyb3kgPGNo
cmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4NCj4gQ2M6IGxpbnV4cHBjLWRldkBsaXN0cy5vemxh
YnMub3JnDQoNClJldmlld2VkLWJ5OiBDaHJpc3RvcGhlIExlcm95IDxjaHJpc3RvcGhlLmxlcm95
QGNzZ3JvdXAuZXU+DQoNCj4gLS0tDQo+ICAgYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Jvb2sz
cy8zMi9wZ3RhYmxlLmggfCAgNSAtLQ0KPiAgIGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ib29r
M3MvNjQvcGd0YWJsZS5oIHwgIDYgKy0tDQo+ICAgYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Jv
b2szcy9wZ3RhYmxlLmggICAgfCAxMSArKy0tLQ0KPiAgIGFyY2gvcG93ZXJwYy9pbmNsdWRlL2Fz
bS9jYWNoZWZsdXNoLmggICAgICAgIHwgMTQgKysrKy0tDQo+ICAgYXJjaC9wb3dlcnBjL2luY2x1
ZGUvYXNtL2t2bV9wcGMuaCAgICAgICAgICAgfCAxMCArKy0tDQo+ICAgYXJjaC9wb3dlcnBjL2lu
Y2x1ZGUvYXNtL25vaGFzaC9wZ3RhYmxlLmggICAgfCAxNiArKy0tLS0NCj4gICBhcmNoL3Bvd2Vy
cGMvaW5jbHVkZS9hc20vcGd0YWJsZS5oICAgICAgICAgICB8IDEyICsrKysrDQo+ICAgYXJjaC9w
b3dlcnBjL21tL2Jvb2szczY0L2hhc2hfdXRpbHMuYyAgICAgICAgfCAxMSArKystLQ0KPiAgIGFy
Y2gvcG93ZXJwYy9tbS9jYWNoZWZsdXNoLmMgICAgICAgICAgICAgICAgIHwgNDAgKysrKystLS0t
LS0tLS0tDQo+ICAgYXJjaC9wb3dlcnBjL21tL25vaGFzaC9lNTAwX2h1Z2V0bGJwYWdlLmMgICAg
fCAgMyArLQ0KPiAgIGFyY2gvcG93ZXJwYy9tbS9wZ3RhYmxlLmMgICAgICAgICAgICAgICAgICAg
IHwgNTEgKysrKysrKysrKystLS0tLS0tLS0NCj4gICAxMSBmaWxlcyBjaGFuZ2VkLCA4NiBpbnNl
cnRpb25zKCspLCA5MyBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2Vy
cGMvaW5jbHVkZS9hc20vYm9vazNzLzMyL3BndGFibGUuaCBiL2FyY2gvcG93ZXJwYy9pbmNsdWRl
L2FzbS9ib29rM3MvMzIvcGd0YWJsZS5oDQo+IGluZGV4IDdiZjFmZTcyOTdjNi4uNWYxMmI5Mzgy
OTA5IDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYm9vazNzLzMyL3Bn
dGFibGUuaA0KPiArKysgYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYm9vazNzLzMyL3BndGFi
bGUuaA0KPiBAQCAtNDYyLDExICs0NjIsNiBAQCBzdGF0aWMgaW5saW5lIHB0ZV90IHBmbl9wdGUo
dW5zaWduZWQgbG9uZyBwZm4sIHBncHJvdF90IHBncHJvdCkNCj4gICAJCSAgICAgcGdwcm90X3Zh
bChwZ3Byb3QpKTsNCj4gICB9DQo+ICAgDQo+IC1zdGF0aWMgaW5saW5lIHVuc2lnbmVkIGxvbmcg
cHRlX3BmbihwdGVfdCBwdGUpDQo+IC17DQo+IC0JcmV0dXJuIHB0ZV92YWwocHRlKSA+PiBQVEVf
UlBOX1NISUZUOw0KPiAtfQ0KPiAtDQo+ICAgLyogR2VuZXJpYyBtb2RpZmllcnMgZm9yIFBURSBi
aXRzICovDQo+ICAgc3RhdGljIGlubGluZSBwdGVfdCBwdGVfd3Jwcm90ZWN0KHB0ZV90IHB0ZSkN
Cj4gICB7DQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYm9vazNzLzY0
L3BndGFibGUuaCBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ib29rM3MvNjQvcGd0YWJsZS5o
DQo+IGluZGV4IDRhY2M5NjkwZjU5OS4uYzViYWEzMDgyYTVhIDEwMDY0NA0KPiAtLS0gYS9hcmNo
L3Bvd2VycGMvaW5jbHVkZS9hc20vYm9vazNzLzY0L3BndGFibGUuaA0KPiArKysgYi9hcmNoL3Bv
d2VycGMvaW5jbHVkZS9hc20vYm9vazNzLzY0L3BndGFibGUuaA0KPiBAQCAtMTA0LDYgKzEwNCw3
IEBADQo+ICAgICogYW5kIGV2ZXJ5IHRoaW5nIGJlbG93IFBBR0VfU0hJRlQ7DQo+ICAgICovDQo+
ICAgI2RlZmluZSBQVEVfUlBOX01BU0sJKCgoMVVMIDw8IF9QQUdFX1BBX01BWCkgLSAxKSAmIChQ
QUdFX01BU0spKQ0KPiArI2RlZmluZSBQVEVfUlBOX1NISUZUCVBBR0VfU0hJRlQNCj4gICAvKg0K
PiAgICAqIHNldCBvZiBiaXRzIG5vdCBjaGFuZ2VkIGluIHBtZF9tb2RpZnkuIEV2ZW4gdGhvdWdo
IHdlIGhhdmUgaGFzaCBzcGVjaWZpYyBiaXRzDQo+ICAgICogaW4gaGVyZSwgb24gcmFkaXggd2Ug
ZXhwZWN0IHRoZW0gdG8gYmUgemVyby4NCj4gQEAgLTU2OSwxMSArNTcwLDYgQEAgc3RhdGljIGlu
bGluZSBwdGVfdCBwZm5fcHRlKHVuc2lnbmVkIGxvbmcgcGZuLCBwZ3Byb3RfdCBwZ3Byb3QpDQo+
ICAgCXJldHVybiBfX3B0ZSgoKHB0ZV9iYXNpY190KXBmbiA8PCBQQUdFX1NISUZUKSB8IHBncHJv
dF92YWwocGdwcm90KSB8IF9QQUdFX1BURSk7DQo+ICAgfQ0KPiAgIA0KPiAtc3RhdGljIGlubGlu
ZSB1bnNpZ25lZCBsb25nIHB0ZV9wZm4ocHRlX3QgcHRlKQ0KPiAtew0KPiAtCXJldHVybiAocHRl
X3ZhbChwdGUpICYgUFRFX1JQTl9NQVNLKSA+PiBQQUdFX1NISUZUOw0KPiAtfQ0KPiAtDQo+ICAg
LyogR2VuZXJpYyBtb2RpZmllcnMgZm9yIFBURSBiaXRzICovDQo+ICAgc3RhdGljIGlubGluZSBw
dGVfdCBwdGVfd3Jwcm90ZWN0KHB0ZV90IHB0ZSkNCj4gICB7DQo+IGRpZmYgLS1naXQgYS9hcmNo
L3Bvd2VycGMvaW5jbHVkZS9hc20vYm9vazNzL3BndGFibGUuaCBiL2FyY2gvcG93ZXJwYy9pbmNs
dWRlL2FzbS9ib29rM3MvcGd0YWJsZS5oDQo+IGluZGV4IGQxOGI3NDhlYTNhZS4uM2I3YmQzNmEy
MzIxIDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYm9vazNzL3BndGFi
bGUuaA0KPiArKysgYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYm9vazNzL3BndGFibGUuaA0K
PiBAQCAtOSwxMyArOSw2IEBADQo+ICAgI2VuZGlmDQo+ICAgDQo+ICAgI2lmbmRlZiBfX0FTU0VN
QkxZX18NCj4gLS8qIEluc2VydCBhIFBURSwgdG9wLWxldmVsIGZ1bmN0aW9uIGlzIG91dCBvZiBs
aW5lLiBJdCB1c2VzIGFuIGlubGluZQ0KPiAtICogbG93IGxldmVsIGZ1bmN0aW9uIGluIHRoZSBy
ZXNwZWN0aXZlIHBndGFibGUtKiBmaWxlcw0KPiAtICovDQo+IC1leHRlcm4gdm9pZCBzZXRfcHRl
X2F0KHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLCB1bnNpZ25lZCBsb25nIGFkZHIsIHB0ZV90ICpwdGVw
LA0KPiAtCQkgICAgICAgcHRlX3QgcHRlKTsNCj4gLQ0KPiAtDQo+ICAgI2RlZmluZSBfX0hBVkVf
QVJDSF9QVEVQX1NFVF9BQ0NFU1NfRkxBR1MNCj4gICBleHRlcm4gaW50IHB0ZXBfc2V0X2FjY2Vz
c19mbGFncyhzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwgdW5zaWduZWQgbG9uZyBhZGRyZXNz
LA0KPiAgIAkJCQkgcHRlX3QgKnB0ZXAsIHB0ZV90IGVudHJ5LCBpbnQgZGlydHkpOw0KPiBAQCAt
MzYsNyArMjksOSBAQCB2b2lkIF9fdXBkYXRlX21tdV9jYWNoZShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1
Y3QgKnZtYSwgdW5zaWduZWQgbG9uZyBhZGRyZXNzLCBwdGVfdA0KPiAgICAqIGNvcnJlc3BvbmRp
bmcgSFBURSBpbnRvIHRoZSBoYXNoIHRhYmxlIGFoZWFkIG9mIHRpbWUsIGluc3RlYWQgb2YNCj4g
ICAgKiB3YWl0aW5nIGZvciB0aGUgaW5ldml0YWJsZSBleHRyYSBoYXNoLXRhYmxlIG1pc3MgZXhj
ZXB0aW9uLg0KPiAgICAqLw0KPiAtc3RhdGljIGlubGluZSB2b2lkIHVwZGF0ZV9tbXVfY2FjaGUo
c3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsIHVuc2lnbmVkIGxvbmcgYWRkcmVzcywgcHRlX3Qg
KnB0ZXApDQo+ICtzdGF0aWMgaW5saW5lIHZvaWQgdXBkYXRlX21tdV9jYWNoZV9yYW5nZShzdHJ1
Y3Qgdm1fZmF1bHQgKnZtZiwNCj4gKwkJc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsIHVuc2ln
bmVkIGxvbmcgYWRkcmVzcywNCj4gKwkJcHRlX3QgKnB0ZXAsIHVuc2lnbmVkIGludCBucikNCj4g
ICB7DQo+ICAgCWlmIChJU19FTkFCTEVEKENPTkZJR19QUEMzMikgJiYgIW1tdV9oYXNfZmVhdHVy
ZShNTVVfRlRSX0hQVEVfVEFCTEUpKQ0KPiAgIAkJcmV0dXJuOw0KPiBkaWZmIC0tZ2l0IGEvYXJj
aC9wb3dlcnBjL2luY2x1ZGUvYXNtL2NhY2hlZmx1c2guaCBiL2FyY2gvcG93ZXJwYy9pbmNsdWRl
L2FzbS9jYWNoZWZsdXNoLmgNCj4gaW5kZXggNzU2NGRkNGZkMTJiLi5lZjdkMmRlMzNiODkgMTAw
NjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9jYWNoZWZsdXNoLmgNCj4gKysr
IGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2NhY2hlZmx1c2guaA0KPiBAQCAtMzUsMTMgKzM1
LDE5IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBmbHVzaF9jYWNoZV92bWFwKHVuc2lnbmVkIGxvbmcg
c3RhcnQsIHVuc2lnbmVkIGxvbmcgZW5kKQ0KPiAgICAqIEl0IGp1c3QgbWFya3MgdGhlIHBhZ2Ug
YXMgbm90IGktY2FjaGUgY2xlYW4uICBXZSBkbyB0aGUgaS1jYWNoZQ0KPiAgICAqIGZsdXNoIGxh
dGVyIHdoZW4gdGhlIHBhZ2UgaXMgZ2l2ZW4gdG8gYSB1c2VyIHByb2Nlc3MsIGlmIG5lY2Vzc2Fy
eS4NCj4gICAgKi8NCj4gLXN0YXRpYyBpbmxpbmUgdm9pZCBmbHVzaF9kY2FjaGVfcGFnZShzdHJ1
Y3QgcGFnZSAqcGFnZSkNCj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBmbHVzaF9kY2FjaGVfZm9saW8o
c3RydWN0IGZvbGlvICpmb2xpbykNCj4gICB7DQo+ICAgCWlmIChjcHVfaGFzX2ZlYXR1cmUoQ1BV
X0ZUUl9DT0hFUkVOVF9JQ0FDSEUpKQ0KPiAgIAkJcmV0dXJuOw0KPiAgIAkvKiBhdm9pZCBhbiBh
dG9taWMgb3AgaWYgcG9zc2libGUgKi8NCj4gLQlpZiAodGVzdF9iaXQoUEdfZGNhY2hlX2NsZWFu
LCAmcGFnZS0+ZmxhZ3MpKQ0KPiAtCQljbGVhcl9iaXQoUEdfZGNhY2hlX2NsZWFuLCAmcGFnZS0+
ZmxhZ3MpOw0KPiArCWlmICh0ZXN0X2JpdChQR19kY2FjaGVfY2xlYW4sICZmb2xpby0+ZmxhZ3Mp
KQ0KPiArCQljbGVhcl9iaXQoUEdfZGNhY2hlX2NsZWFuLCAmZm9saW8tPmZsYWdzKTsNCj4gK30N
Cj4gKyNkZWZpbmUgZmx1c2hfZGNhY2hlX2ZvbGlvIGZsdXNoX2RjYWNoZV9mb2xpbw0KPiArDQo+
ICtzdGF0aWMgaW5saW5lIHZvaWQgZmx1c2hfZGNhY2hlX3BhZ2Uoc3RydWN0IHBhZ2UgKnBhZ2Up
DQo+ICt7DQo+ICsJZmx1c2hfZGNhY2hlX2ZvbGlvKHBhZ2VfZm9saW8ocGFnZSkpOw0KPiAgIH0N
Cj4gICANCj4gICB2b2lkIGZsdXNoX2ljYWNoZV9yYW5nZSh1bnNpZ25lZCBsb25nIHN0YXJ0LCB1
bnNpZ25lZCBsb25nIHN0b3ApOw0KPiBAQCAtNTEsNyArNTcsNyBAQCB2b2lkIGZsdXNoX2ljYWNo
ZV91c2VyX3BhZ2Uoc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsIHN0cnVjdCBwYWdlICpwYWdl
LA0KPiAgIAkJdW5zaWduZWQgbG9uZyBhZGRyLCBpbnQgbGVuKTsNCj4gICAjZGVmaW5lIGZsdXNo
X2ljYWNoZV91c2VyX3BhZ2UgZmx1c2hfaWNhY2hlX3VzZXJfcGFnZQ0KPiAgIA0KPiAtdm9pZCBm
bHVzaF9kY2FjaGVfaWNhY2hlX3BhZ2Uoc3RydWN0IHBhZ2UgKnBhZ2UpOw0KPiArdm9pZCBmbHVz
aF9kY2FjaGVfaWNhY2hlX2ZvbGlvKHN0cnVjdCBmb2xpbyAqZm9saW8pOw0KPiAgIA0KPiAgIC8q
Kg0KPiAgICAqIGZsdXNoX2RjYWNoZV9yYW5nZSgpOiBXcml0ZSBhbnkgbW9kaWZpZWQgZGF0YSBj
YWNoZSBibG9ja3Mgb3V0IHRvIG1lbW9yeSBhbmQNCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJw
Yy9pbmNsdWRlL2FzbS9rdm1fcHBjLmggYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20va3ZtX3Bw
Yy5oDQo+IGluZGV4IGQxNmQ4MGFkMmFlNC4uYjRkYTg1MTRhZjQzIDEwMDY0NA0KPiAtLS0gYS9h
cmNoL3Bvd2VycGMvaW5jbHVkZS9hc20va3ZtX3BwYy5oDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9p
bmNsdWRlL2FzbS9rdm1fcHBjLmgNCj4gQEAgLTg5NCw3ICs4OTQsNyBAQCB2b2lkIGt2bXBwY19p
bml0X2xwaWQodW5zaWduZWQgbG9uZyBucl9scGlkcyk7DQo+ICAgDQo+ICAgc3RhdGljIGlubGlu
ZSB2b2lkIGt2bXBwY19tbXVfZmx1c2hfaWNhY2hlKGt2bV9wZm5fdCBwZm4pDQo+ICAgew0KPiAt
CXN0cnVjdCBwYWdlICpwYWdlOw0KPiArCXN0cnVjdCBmb2xpbyAqZm9saW87DQo+ICAgCS8qDQo+
ICAgCSAqIFdlIGNhbiBvbmx5IGFjY2VzcyBwYWdlcyB0aGF0IHRoZSBrZXJuZWwgbWFwcw0KPiAg
IAkgKiBhcyBtZW1vcnkuIEJhaWwgb3V0IGZvciB1bm1hcHBlZCBvbmVzLg0KPiBAQCAtOTAzLDEw
ICs5MDMsMTAgQEAgc3RhdGljIGlubGluZSB2b2lkIGt2bXBwY19tbXVfZmx1c2hfaWNhY2hlKGt2
bV9wZm5fdCBwZm4pDQo+ICAgCQlyZXR1cm47DQo+ICAgDQo+ICAgCS8qIENsZWFyIGktY2FjaGUg
Zm9yIG5ldyBwYWdlcyAqLw0KPiAtCXBhZ2UgPSBwZm5fdG9fcGFnZShwZm4pOw0KPiAtCWlmICgh
dGVzdF9iaXQoUEdfZGNhY2hlX2NsZWFuLCAmcGFnZS0+ZmxhZ3MpKSB7DQo+IC0JCWZsdXNoX2Rj
YWNoZV9pY2FjaGVfcGFnZShwYWdlKTsNCj4gLQkJc2V0X2JpdChQR19kY2FjaGVfY2xlYW4sICZw
YWdlLT5mbGFncyk7DQo+ICsJZm9saW8gPSBwYWdlX2ZvbGlvKHBmbl90b19wYWdlKHBmbikpOw0K
PiArCWlmICghdGVzdF9iaXQoUEdfZGNhY2hlX2NsZWFuLCAmZm9saW8tPmZsYWdzKSkgew0KPiAr
CQlmbHVzaF9kY2FjaGVfaWNhY2hlX2ZvbGlvKGZvbGlvKTsNCj4gKwkJc2V0X2JpdChQR19kY2Fj
aGVfY2xlYW4sICZmb2xpby0+ZmxhZ3MpOw0KPiAgIAl9DQo+ICAgfQ0KPiAgIA0KPiBkaWZmIC0t
Z2l0IGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL25vaGFzaC9wZ3RhYmxlLmggYi9hcmNoL3Bv
d2VycGMvaW5jbHVkZS9hc20vbm9oYXNoL3BndGFibGUuaA0KPiBpbmRleCBhNmNhYWFhYjZmOTIu
LjU2ZWE0ODI3NjM1NiAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL25v
aGFzaC9wZ3RhYmxlLmgNCj4gKysrIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL25vaGFzaC9w
Z3RhYmxlLmgNCj4gQEAgLTEwMSw4ICsxMDEsNiBAQCBzdGF0aWMgaW5saW5lIGJvb2wgcHRlX2Fj
Y2Vzc19wZXJtaXR0ZWQocHRlX3QgcHRlLCBib29sIHdyaXRlKQ0KPiAgIHN0YXRpYyBpbmxpbmUg
cHRlX3QgcGZuX3B0ZSh1bnNpZ25lZCBsb25nIHBmbiwgcGdwcm90X3QgcGdwcm90KSB7DQo+ICAg
CXJldHVybiBfX3B0ZSgoKHB0ZV9iYXNpY190KShwZm4pIDw8IFBURV9SUE5fU0hJRlQpIHwNCj4g
ICAJCSAgICAgcGdwcm90X3ZhbChwZ3Byb3QpKTsgfQ0KPiAtc3RhdGljIGlubGluZSB1bnNpZ25l
ZCBsb25nIHB0ZV9wZm4ocHRlX3QgcHRlKQl7DQo+IC0JcmV0dXJuIHB0ZV92YWwocHRlKSA+PiBQ
VEVfUlBOX1NISUZUOyB9DQo+ICAgDQo+ICAgLyogR2VuZXJpYyBtb2RpZmllcnMgZm9yIFBURSBi
aXRzICovDQo+ICAgc3RhdGljIGlubGluZSBwdGVfdCBwdGVfZXhwcm90ZWN0KHB0ZV90IHB0ZSkN
Cj4gQEAgLTE2NiwxMiArMTY0LDYgQEAgc3RhdGljIGlubGluZSBwdGVfdCBwdGVfc3dwX2NsZWFy
X2V4Y2x1c2l2ZShwdGVfdCBwdGUpDQo+ICAgCXJldHVybiBfX3B0ZShwdGVfdmFsKHB0ZSkgJiB+
X1BBR0VfU1dQX0VYQ0xVU0lWRSk7DQo+ICAgfQ0KPiAgIA0KPiAtLyogSW5zZXJ0IGEgUFRFLCB0
b3AtbGV2ZWwgZnVuY3Rpb24gaXMgb3V0IG9mIGxpbmUuIEl0IHVzZXMgYW4gaW5saW5lDQo+IC0g
KiBsb3cgbGV2ZWwgZnVuY3Rpb24gaW4gdGhlIHJlc3BlY3RpdmUgcGd0YWJsZS0qIGZpbGVzDQo+
IC0gKi8NCj4gLWV4dGVybiB2b2lkIHNldF9wdGVfYXQoc3RydWN0IG1tX3N0cnVjdCAqbW0sIHVu
c2lnbmVkIGxvbmcgYWRkciwgcHRlX3QgKnB0ZXAsDQo+IC0JCSAgICAgICBwdGVfdCBwdGUpOw0K
PiAtDQo+ICAgLyogVGhpcyBsb3cgbGV2ZWwgZnVuY3Rpb24gcGVyZm9ybXMgdGhlIGFjdHVhbCBQ
VEUgaW5zZXJ0aW9uDQo+ICAgICogU2V0dGluZyB0aGUgUFRFIGRlcGVuZHMgb24gdGhlIE1NVSB0
eXBlIGFuZCBvdGhlciBmYWN0b3JzLiBJdCdzDQo+ICAgICogYW4gaG9ycmlibGUgbWVzcyB0aGF0
IEknbSBub3QgZ29pbmcgdG8gdHJ5IHRvIGNsZWFuIHVwIG5vdyBidXQNCj4gQEAgLTI4MiwxMCAr
Mjc0LDEyIEBAIHN0YXRpYyBpbmxpbmUgaW50IHB1ZF9odWdlKHB1ZF90IHB1ZCkNCj4gICAgKiBm
b3IgdGhlIHBhZ2Ugd2hpY2ggaGFzIGp1c3QgYmVlbiBtYXBwZWQgaW4uDQo+ICAgICovDQo+ICAg
I2lmIGRlZmluZWQoQ09ORklHX1BQQ19FNTAwKSAmJiBkZWZpbmVkKENPTkZJR19IVUdFVExCX1BB
R0UpDQo+IC12b2lkIHVwZGF0ZV9tbXVfY2FjaGUoc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEs
IHVuc2lnbmVkIGxvbmcgYWRkcmVzcywgcHRlX3QgKnB0ZXApOw0KPiArdm9pZCB1cGRhdGVfbW11
X2NhY2hlX3JhbmdlKHN0cnVjdCB2bV9mYXVsdCAqdm1mLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3Qg
KnZtYSwNCj4gKwkJdW5zaWduZWQgbG9uZyBhZGRyZXNzLCBwdGVfdCAqcHRlcCwgdW5zaWduZWQg
aW50IG5yKTsNCj4gICAjZWxzZQ0KPiAtc3RhdGljIGlubGluZQ0KPiAtdm9pZCB1cGRhdGVfbW11
X2NhY2hlKHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLCB1bnNpZ25lZCBsb25nIGFkZHJlc3Ms
IHB0ZV90ICpwdGVwKSB7fQ0KPiArc3RhdGljIGlubGluZSB2b2lkIHVwZGF0ZV9tbXVfY2FjaGVf
cmFuZ2Uoc3RydWN0IHZtX2ZhdWx0ICp2bWYsDQo+ICsJCXN0cnVjdCB2bV9hcmVhX3N0cnVjdCAq
dm1hLCB1bnNpZ25lZCBsb25nIGFkZHJlc3MsDQo+ICsJCXB0ZV90ICpwdGVwLCB1bnNpZ25lZCBp
bnQgbnIpIHt9DQo+ICAgI2VuZGlmDQo+ICAgDQo+ICAgI2VuZGlmIC8qIF9fQVNTRU1CTFlfXyAq
Lw0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3BndGFibGUuaCBiL2Fy
Y2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgNCj4gaW5kZXggNDQ1YTIyOTg3YWEzLi5k
YTUxMTlkYmE4YTQgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9wZ3Rh
YmxlLmgNCj4gKysrIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3BndGFibGUuaA0KPiBAQCAt
NDEsNiArNDEsMTIgQEAgc3RydWN0IG1tX3N0cnVjdDsNCj4gICANCj4gICAjaWZuZGVmIF9fQVNT
RU1CTFlfXw0KPiAgIA0KPiArdm9pZCBzZXRfcHRlcyhzdHJ1Y3QgbW1fc3RydWN0ICptbSwgdW5z
aWduZWQgbG9uZyBhZGRyLCBwdGVfdCAqcHRlcCwNCj4gKwkJcHRlX3QgcHRlLCB1bnNpZ25lZCBp
bnQgbnIpOw0KPiArI2RlZmluZSBzZXRfcHRlcyBzZXRfcHRlcw0KPiArI2RlZmluZSB1cGRhdGVf
bW11X2NhY2hlKHZtYSwgYWRkciwgcHRlcCkgXA0KPiArCXVwZGF0ZV9tbXVfY2FjaGVfcmFuZ2Uo
TlVMTCwgdm1hLCBhZGRyLCBwdGVwLCAxKQ0KPiArDQo+ICAgI2lmbmRlZiBNQVhfUFRSU19QRVJf
UEdEDQo+ICAgI2RlZmluZSBNQVhfUFRSU19QRVJfUEdEIFBUUlNfUEVSX1BHRA0KPiAgICNlbmRp
Zg0KPiBAQCAtNDgsNiArNTQsMTIgQEAgc3RydWN0IG1tX3N0cnVjdDsNCj4gICAvKiBLZWVwIHRo
ZXNlIGFzIGEgbWFjcm9zIHRvIGF2b2lkIGluY2x1ZGUgZGVwZW5kZW5jeSBtZXNzICovDQo+ICAg
I2RlZmluZSBwdGVfcGFnZSh4KQkJcGZuX3RvX3BhZ2UocHRlX3Bmbih4KSkNCj4gICAjZGVmaW5l
IG1rX3B0ZShwYWdlLCBwZ3Byb3QpCXBmbl9wdGUocGFnZV90b19wZm4ocGFnZSksIChwZ3Byb3Qp
KQ0KPiArDQo+ICtzdGF0aWMgaW5saW5lIHVuc2lnbmVkIGxvbmcgcHRlX3BmbihwdGVfdCBwdGUp
DQo+ICt7DQo+ICsJcmV0dXJuIChwdGVfdmFsKHB0ZSkgJiBQVEVfUlBOX01BU0spID4+IFBURV9S
UE5fU0hJRlQ7DQo+ICt9DQo+ICsNCj4gICAvKg0KPiAgICAqIFNlbGVjdCBhbGwgYml0cyBleGNl
cHQgdGhlIHBmbg0KPiAgICAqLw0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL21tL2Jvb2sz
czY0L2hhc2hfdXRpbHMuYyBiL2FyY2gvcG93ZXJwYy9tbS9ib29rM3M2NC9oYXNoX3V0aWxzLmMN
Cj4gaW5kZXggZmVkZmZlM2FlMTM2Li5hZDJhZmEwOGU2MmUgMTAwNjQ0DQo+IC0tLSBhL2FyY2gv
cG93ZXJwYy9tbS9ib29rM3M2NC9oYXNoX3V0aWxzLmMNCj4gKysrIGIvYXJjaC9wb3dlcnBjL21t
L2Jvb2szczY0L2hhc2hfdXRpbHMuYw0KPiBAQCAtMTMwNywxOCArMTMwNywxOSBAQCB2b2lkIGhh
c2hfX2Vhcmx5X2luaXRfbW11X3NlY29uZGFyeSh2b2lkKQ0KPiAgICAqLw0KPiAgIHVuc2lnbmVk
IGludCBoYXNoX3BhZ2VfZG9fbGF6eV9pY2FjaGUodW5zaWduZWQgaW50IHBwLCBwdGVfdCBwdGUs
IGludCB0cmFwKQ0KPiAgIHsNCj4gLQlzdHJ1Y3QgcGFnZSAqcGFnZTsNCj4gKwlzdHJ1Y3QgZm9s
aW8gKmZvbGlvOw0KPiAgIA0KPiAgIAlpZiAoIXBmbl92YWxpZChwdGVfcGZuKHB0ZSkpKQ0KPiAg
IAkJcmV0dXJuIHBwOw0KPiAgIA0KPiAtCXBhZ2UgPSBwdGVfcGFnZShwdGUpOw0KPiArCWZvbGlv
ID0gcGFnZV9mb2xpbyhwdGVfcGFnZShwdGUpKTsNCj4gICANCj4gICAJLyogcGFnZSBpcyBkaXJ0
eSAqLw0KPiAtCWlmICghdGVzdF9iaXQoUEdfZGNhY2hlX2NsZWFuLCAmcGFnZS0+ZmxhZ3MpICYm
ICFQYWdlUmVzZXJ2ZWQocGFnZSkpIHsNCj4gKwlpZiAoIXRlc3RfYml0KFBHX2RjYWNoZV9jbGVh
biwgJmZvbGlvLT5mbGFncykgJiYNCj4gKwkgICAgIWZvbGlvX3Rlc3RfcmVzZXJ2ZWQoZm9saW8p
KSB7DQo+ICAgCQlpZiAodHJhcCA9PSBJTlRFUlJVUFRfSU5TVF9TVE9SQUdFKSB7DQo+IC0JCQlm
bHVzaF9kY2FjaGVfaWNhY2hlX3BhZ2UocGFnZSk7DQo+IC0JCQlzZXRfYml0KFBHX2RjYWNoZV9j
bGVhbiwgJnBhZ2UtPmZsYWdzKTsNCj4gKwkJCWZsdXNoX2RjYWNoZV9pY2FjaGVfZm9saW8oZm9s
aW8pOw0KPiArCQkJc2V0X2JpdChQR19kY2FjaGVfY2xlYW4sICZmb2xpby0+ZmxhZ3MpOw0KPiAg
IAkJfSBlbHNlDQo+ICAgCQkJcHAgfD0gSFBURV9SX047DQo+ICAgCX0NCj4gZGlmZiAtLWdpdCBh
L2FyY2gvcG93ZXJwYy9tbS9jYWNoZWZsdXNoLmMgYi9hcmNoL3Bvd2VycGMvbW0vY2FjaGVmbHVz
aC5jDQo+IGluZGV4IDBlOWI0ODc5YzBmOS4uODc2MGQyMjIzYWJlIDEwMDY0NA0KPiAtLS0gYS9h
cmNoL3Bvd2VycGMvbW0vY2FjaGVmbHVzaC5jDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9tbS9jYWNo
ZWZsdXNoLmMNCj4gQEAgLTE0OCw0NCArMTQ4LDMwIEBAIHN0YXRpYyB2b2lkIF9fZmx1c2hfZGNh
Y2hlX2ljYWNoZSh2b2lkICpwKQ0KPiAgIAlpbnZhbGlkYXRlX2ljYWNoZV9yYW5nZShhZGRyLCBh
ZGRyICsgUEFHRV9TSVpFKTsNCj4gICB9DQo+ICAgDQo+IC1zdGF0aWMgdm9pZCBmbHVzaF9kY2Fj
aGVfaWNhY2hlX2h1Z2VwYWdlKHN0cnVjdCBwYWdlICpwYWdlKQ0KPiArdm9pZCBmbHVzaF9kY2Fj
aGVfaWNhY2hlX2ZvbGlvKHN0cnVjdCBmb2xpbyAqZm9saW8pDQo+ICAgew0KPiAtCWludCBpOw0K
PiAtCWludCBuciA9IGNvbXBvdW5kX25yKHBhZ2UpOw0KPiArCXVuc2lnbmVkIGludCBpLCBuciA9
IGZvbGlvX25yX3BhZ2VzKGZvbGlvKTsNCj4gICANCj4gLQlpZiAoIVBhZ2VIaWdoTWVtKHBhZ2Up
KSB7DQo+ICsJaWYgKGZsdXNoX2NvaGVyZW50X2ljYWNoZSgpKQ0KPiArCQlyZXR1cm47DQo+ICsN
Cj4gKwlpZiAoIWZvbGlvX3Rlc3RfaGlnaG1lbShmb2xpbykpIHsNCj4gKwkJdm9pZCAqYWRkciA9
IGZvbGlvX2FkZHJlc3MoZm9saW8pOw0KPiAgIAkJZm9yIChpID0gMDsgaSA8IG5yOyBpKyspDQo+
IC0JCQlfX2ZsdXNoX2RjYWNoZV9pY2FjaGUobG93bWVtX3BhZ2VfYWRkcmVzcyhwYWdlICsgaSkp
Ow0KPiAtCX0gZWxzZSB7DQo+ICsJCQlfX2ZsdXNoX2RjYWNoZV9pY2FjaGUoYWRkciArIGkgKiBQ
QUdFX1NJWkUpOw0KPiArCX0gZWxzZSBpZiAoSVNfRU5BQkxFRChDT05GSUdfQk9PS0UpIHx8IHNp
emVvZihwaHlzX2FkZHJfdCkgPiBzaXplb2Yodm9pZCAqKSkgew0KPiAgIAkJZm9yIChpID0gMDsg
aSA8IG5yOyBpKyspIHsNCj4gLQkJCXZvaWQgKnN0YXJ0ID0ga21hcF9sb2NhbF9wYWdlKHBhZ2Ug
KyBpKTsNCj4gKwkJCXZvaWQgKnN0YXJ0ID0ga21hcF9sb2NhbF9mb2xpbyhmb2xpbywgaSAqIFBB
R0VfU0laRSk7DQo+ICAgDQo+ICAgCQkJX19mbHVzaF9kY2FjaGVfaWNhY2hlKHN0YXJ0KTsNCj4g
ICAJCQlrdW5tYXBfbG9jYWwoc3RhcnQpOw0KPiAgIAkJfQ0KPiAtCX0NCj4gLX0NCj4gLQ0KPiAt
dm9pZCBmbHVzaF9kY2FjaGVfaWNhY2hlX3BhZ2Uoc3RydWN0IHBhZ2UgKnBhZ2UpDQo+IC17DQo+
IC0JaWYgKGZsdXNoX2NvaGVyZW50X2ljYWNoZSgpKQ0KPiAtCQlyZXR1cm47DQo+IC0NCj4gLQlp
ZiAoUGFnZUNvbXBvdW5kKHBhZ2UpKQ0KPiAtCQlyZXR1cm4gZmx1c2hfZGNhY2hlX2ljYWNoZV9o
dWdlcGFnZShwYWdlKTsNCj4gLQ0KPiAtCWlmICghUGFnZUhpZ2hNZW0ocGFnZSkpIHsNCj4gLQkJ
X19mbHVzaF9kY2FjaGVfaWNhY2hlKGxvd21lbV9wYWdlX2FkZHJlc3MocGFnZSkpOw0KPiAtCX0g
ZWxzZSBpZiAoSVNfRU5BQkxFRChDT05GSUdfQk9PS0UpIHx8IHNpemVvZihwaHlzX2FkZHJfdCkg
PiBzaXplb2Yodm9pZCAqKSkgew0KPiAtCQl2b2lkICpzdGFydCA9IGttYXBfbG9jYWxfcGFnZShw
YWdlKTsNCj4gLQ0KPiAtCQlfX2ZsdXNoX2RjYWNoZV9pY2FjaGUoc3RhcnQpOw0KPiAtCQlrdW5t
YXBfbG9jYWwoc3RhcnQpOw0KPiAgIAl9IGVsc2Ugew0KPiAtCQlmbHVzaF9kY2FjaGVfaWNhY2hl
X3BoeXMocGFnZV90b19waHlzKHBhZ2UpKTsNCj4gKwkJdW5zaWduZWQgbG9uZyBwZm4gPSBmb2xp
b19wZm4oZm9saW8pOw0KPiArCQlmb3IgKGkgPSAwOyBpIDwgbnI7IGkrKykNCj4gKwkJCWZsdXNo
X2RjYWNoZV9pY2FjaGVfcGh5cygocGZuICsgaSkgKiBQQUdFX1NJWkUpOw0KPiAgIAl9DQo+ICAg
fQ0KPiAtRVhQT1JUX1NZTUJPTChmbHVzaF9kY2FjaGVfaWNhY2hlX3BhZ2UpOw0KPiAgIA0KPiAg
IHZvaWQgY2xlYXJfdXNlcl9wYWdlKHZvaWQgKnBhZ2UsIHVuc2lnbmVkIGxvbmcgdmFkZHIsIHN0
cnVjdCBwYWdlICpwZykNCj4gICB7DQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvbW0vbm9o
YXNoL2U1MDBfaHVnZXRsYnBhZ2UuYyBiL2FyY2gvcG93ZXJwYy9tbS9ub2hhc2gvZTUwMF9odWdl
dGxicGFnZS5jDQo+IGluZGV4IDU4YzhkOTg0OWNiMS4uNmIzMGU0MGQ0NTkwIDEwMDY0NA0KPiAt
LS0gYS9hcmNoL3Bvd2VycGMvbW0vbm9oYXNoL2U1MDBfaHVnZXRsYnBhZ2UuYw0KPiArKysgYi9h
cmNoL3Bvd2VycGMvbW0vbm9oYXNoL2U1MDBfaHVnZXRsYnBhZ2UuYw0KPiBAQCAtMTc4LDcgKzE3
OCw4IEBAIGJvb2szZV9odWdldGxiX3ByZWxvYWQoc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEs
IHVuc2lnbmVkIGxvbmcgZWEsIHB0ZV90IHB0ZSkNCj4gICAgKg0KPiAgICAqIFRoaXMgbXVzdCBh
bHdheXMgYmUgY2FsbGVkIHdpdGggdGhlIHB0ZSBsb2NrIGhlbGQuDQo+ICAgICovDQo+IC12b2lk
IHVwZGF0ZV9tbXVfY2FjaGUoc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsIHVuc2lnbmVkIGxv
bmcgYWRkcmVzcywgcHRlX3QgKnB0ZXApDQo+ICt2b2lkIHVwZGF0ZV9tbXVfY2FjaGVfcmFuZ2Uo
c3RydWN0IHZtX2ZhdWx0ICp2bWYsIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLA0KPiArCQl1
bnNpZ25lZCBsb25nIGFkZHJlc3MsIHB0ZV90ICpwdGVwLCB1bnNpZ25lZCBpbnQgbnIpDQo+ICAg
ew0KPiAgIAlpZiAoaXNfdm1faHVnZXRsYl9wYWdlKHZtYSkpDQo+ICAgCQlib29rM2VfaHVnZXRs
Yl9wcmVsb2FkKHZtYSwgYWRkcmVzcywgKnB0ZXApOw0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dl
cnBjL21tL3BndGFibGUuYyBiL2FyY2gvcG93ZXJwYy9tbS9wZ3RhYmxlLmMNCj4gaW5kZXggY2Iy
ZGNkYjE4ZjhlLi5kYjIzNmI0OTQ4NDUgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9tbS9w
Z3RhYmxlLmMNCj4gKysrIGIvYXJjaC9wb3dlcnBjL21tL3BndGFibGUuYw0KPiBAQCAtNTgsNyAr
NTgsNyBAQCBzdGF0aWMgaW5saW5lIGludCBwdGVfbG9va3Nfbm9ybWFsKHB0ZV90IHB0ZSkNCj4g
ICAJcmV0dXJuIDA7DQo+ICAgfQ0KPiAgIA0KPiAtc3RhdGljIHN0cnVjdCBwYWdlICptYXliZV9w
dGVfdG9fcGFnZShwdGVfdCBwdGUpDQo+ICtzdGF0aWMgc3RydWN0IGZvbGlvICptYXliZV9wdGVf
dG9fZm9saW8ocHRlX3QgcHRlKQ0KPiAgIHsNCj4gICAJdW5zaWduZWQgbG9uZyBwZm4gPSBwdGVf
cGZuKHB0ZSk7DQo+ICAgCXN0cnVjdCBwYWdlICpwYWdlOw0KPiBAQCAtNjgsNyArNjgsNyBAQCBz
dGF0aWMgc3RydWN0IHBhZ2UgKm1heWJlX3B0ZV90b19wYWdlKHB0ZV90IHB0ZSkNCj4gICAJcGFn
ZSA9IHBmbl90b19wYWdlKHBmbik7DQo+ICAgCWlmIChQYWdlUmVzZXJ2ZWQocGFnZSkpDQo+ICAg
CQlyZXR1cm4gTlVMTDsNCj4gLQlyZXR1cm4gcGFnZTsNCj4gKwlyZXR1cm4gcGFnZV9mb2xpbyhw
YWdlKTsNCj4gICB9DQo+ICAgDQo+ICAgI2lmZGVmIENPTkZJR19QUENfQk9PSzNTDQo+IEBAIC04
NCwxMiArODQsMTIgQEAgc3RhdGljIHB0ZV90IHNldF9wdGVfZmlsdGVyX2hhc2gocHRlX3QgcHRl
KQ0KPiAgIAlwdGUgPSBfX3B0ZShwdGVfdmFsKHB0ZSkgJiB+X1BBR0VfSFBURUZMQUdTKTsNCj4g
ICAJaWYgKHB0ZV9sb29rc19ub3JtYWwocHRlKSAmJiAhKGNwdV9oYXNfZmVhdHVyZShDUFVfRlRS
X0NPSEVSRU5UX0lDQUNIRSkgfHwNCj4gICAJCQkJICAgICAgIGNwdV9oYXNfZmVhdHVyZShDUFVf
RlRSX05PRVhFQ1VURSkpKSB7DQo+IC0JCXN0cnVjdCBwYWdlICpwZyA9IG1heWJlX3B0ZV90b19w
YWdlKHB0ZSk7DQo+IC0JCWlmICghcGcpDQo+ICsJCXN0cnVjdCBmb2xpbyAqZm9saW8gPSBtYXli
ZV9wdGVfdG9fZm9saW8ocHRlKTsNCj4gKwkJaWYgKCFmb2xpbykNCj4gICAJCQlyZXR1cm4gcHRl
Ow0KPiAtCQlpZiAoIXRlc3RfYml0KFBHX2RjYWNoZV9jbGVhbiwgJnBnLT5mbGFncykpIHsNCj4g
LQkJCWZsdXNoX2RjYWNoZV9pY2FjaGVfcGFnZShwZyk7DQo+IC0JCQlzZXRfYml0KFBHX2RjYWNo
ZV9jbGVhbiwgJnBnLT5mbGFncyk7DQo+ICsJCWlmICghdGVzdF9iaXQoUEdfZGNhY2hlX2NsZWFu
LCAmZm9saW8tPmZsYWdzKSkgew0KPiArCQkJZmx1c2hfZGNhY2hlX2ljYWNoZV9mb2xpbyhmb2xp
byk7DQo+ICsJCQlzZXRfYml0KFBHX2RjYWNoZV9jbGVhbiwgJmZvbGlvLT5mbGFncyk7DQo+ICAg
CQl9DQo+ICAgCX0NCj4gICAJcmV0dXJuIHB0ZTsNCj4gQEAgLTEwNyw3ICsxMDcsNyBAQCBzdGF0
aWMgcHRlX3Qgc2V0X3B0ZV9maWx0ZXJfaGFzaChwdGVfdCBwdGUpIHsgcmV0dXJuIHB0ZTsgfQ0K
PiAgICAqLw0KPiAgIHN0YXRpYyBpbmxpbmUgcHRlX3Qgc2V0X3B0ZV9maWx0ZXIocHRlX3QgcHRl
KQ0KPiAgIHsNCj4gLQlzdHJ1Y3QgcGFnZSAqcGc7DQo+ICsJc3RydWN0IGZvbGlvICpmb2xpbzsN
Cj4gICANCj4gICAJaWYgKHJhZGl4X2VuYWJsZWQoKSkNCj4gICAJCXJldHVybiBwdGU7DQo+IEBA
IC0xMjAsMTggKzEyMCwxOCBAQCBzdGF0aWMgaW5saW5lIHB0ZV90IHNldF9wdGVfZmlsdGVyKHB0
ZV90IHB0ZSkNCj4gICAJCXJldHVybiBwdGU7DQo+ICAgDQo+ICAgCS8qIElmIHlvdSBzZXQgX1BB
R0VfRVhFQyBvbiB3ZWlyZCBwYWdlcyB5b3UncmUgb24geW91ciBvd24gKi8NCj4gLQlwZyA9IG1h
eWJlX3B0ZV90b19wYWdlKHB0ZSk7DQo+IC0JaWYgKHVubGlrZWx5KCFwZykpDQo+ICsJZm9saW8g
PSBtYXliZV9wdGVfdG9fZm9saW8ocHRlKTsNCj4gKwlpZiAodW5saWtlbHkoIWZvbGlvKSkNCj4g
ICAJCXJldHVybiBwdGU7DQo+ICAgDQo+ICAgCS8qIElmIHRoZSBwYWdlIGNsZWFuLCB3ZSBtb3Zl
IG9uICovDQo+IC0JaWYgKHRlc3RfYml0KFBHX2RjYWNoZV9jbGVhbiwgJnBnLT5mbGFncykpDQo+
ICsJaWYgKHRlc3RfYml0KFBHX2RjYWNoZV9jbGVhbiwgJmZvbGlvLT5mbGFncykpDQo+ICAgCQly
ZXR1cm4gcHRlOw0KPiAgIA0KPiAgIAkvKiBJZiBpdCdzIGFuIGV4ZWMgZmF1bHQsIHdlIGZsdXNo
IHRoZSBjYWNoZSBhbmQgbWFrZSBpdCBjbGVhbiAqLw0KPiAgIAlpZiAoaXNfZXhlY19mYXVsdCgp
KSB7DQo+IC0JCWZsdXNoX2RjYWNoZV9pY2FjaGVfcGFnZShwZyk7DQo+IC0JCXNldF9iaXQoUEdf
ZGNhY2hlX2NsZWFuLCAmcGctPmZsYWdzKTsNCj4gKwkJZmx1c2hfZGNhY2hlX2ljYWNoZV9mb2xp
byhmb2xpbyk7DQo+ICsJCXNldF9iaXQoUEdfZGNhY2hlX2NsZWFuLCAmZm9saW8tPmZsYWdzKTsN
Cj4gICAJCXJldHVybiBwdGU7DQo+ICAgCX0NCj4gICANCj4gQEAgLTE0Miw3ICsxNDIsNyBAQCBz
dGF0aWMgaW5saW5lIHB0ZV90IHNldF9wdGVfZmlsdGVyKHB0ZV90IHB0ZSkNCj4gICBzdGF0aWMg
cHRlX3Qgc2V0X2FjY2Vzc19mbGFnc19maWx0ZXIocHRlX3QgcHRlLCBzdHJ1Y3Qgdm1fYXJlYV9z
dHJ1Y3QgKnZtYSwNCj4gICAJCQkJICAgICBpbnQgZGlydHkpDQo+ICAgew0KPiAtCXN0cnVjdCBw
YWdlICpwZzsNCj4gKwlzdHJ1Y3QgZm9saW8gKmZvbGlvOw0KPiAgIA0KPiAgIAlpZiAoSVNfRU5B
QkxFRChDT05GSUdfUFBDX0JPT0szU182NCkpDQo+ICAgCQlyZXR1cm4gcHRlOw0KPiBAQCAtMTY4
LDE3ICsxNjgsMTcgQEAgc3RhdGljIHB0ZV90IHNldF9hY2Nlc3NfZmxhZ3NfZmlsdGVyKHB0ZV90
IHB0ZSwgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsDQo+ICAgI2VuZGlmIC8qIENPTkZJR19E
RUJVR19WTSAqLw0KPiAgIA0KPiAgIAkvKiBJZiB5b3Ugc2V0IF9QQUdFX0VYRUMgb24gd2VpcmQg
cGFnZXMgeW91J3JlIG9uIHlvdXIgb3duICovDQo+IC0JcGcgPSBtYXliZV9wdGVfdG9fcGFnZShw
dGUpOw0KPiAtCWlmICh1bmxpa2VseSghcGcpKQ0KPiArCWZvbGlvID0gbWF5YmVfcHRlX3RvX2Zv
bGlvKHB0ZSk7DQo+ICsJaWYgKHVubGlrZWx5KCFmb2xpbykpDQo+ICAgCQlnb3RvIGJhaWw7DQo+
ICAgDQo+ICAgCS8qIElmIHRoZSBwYWdlIGlzIGFscmVhZHkgY2xlYW4sIHdlIG1vdmUgb24gKi8N
Cj4gLQlpZiAodGVzdF9iaXQoUEdfZGNhY2hlX2NsZWFuLCAmcGctPmZsYWdzKSkNCj4gKwlpZiAo
dGVzdF9iaXQoUEdfZGNhY2hlX2NsZWFuLCAmZm9saW8tPmZsYWdzKSkNCj4gICAJCWdvdG8gYmFp
bDsNCj4gICANCj4gICAJLyogQ2xlYW4gdGhlIHBhZ2UgYW5kIHNldCBQR19kY2FjaGVfY2xlYW4g
Ki8NCj4gLQlmbHVzaF9kY2FjaGVfaWNhY2hlX3BhZ2UocGcpOw0KPiAtCXNldF9iaXQoUEdfZGNh
Y2hlX2NsZWFuLCAmcGctPmZsYWdzKTsNCj4gKwlmbHVzaF9kY2FjaGVfaWNhY2hlX2ZvbGlvKGZv
bGlvKTsNCj4gKwlzZXRfYml0KFBHX2RjYWNoZV9jbGVhbiwgJmZvbGlvLT5mbGFncyk7DQo+ICAg
DQo+ICAgIGJhaWw6DQo+ICAgCXJldHVybiBwdGVfbWtleGVjKHB0ZSk7DQo+IEBAIC0xODcsOCAr
MTg3LDggQEAgc3RhdGljIHB0ZV90IHNldF9hY2Nlc3NfZmxhZ3NfZmlsdGVyKHB0ZV90IHB0ZSwg
c3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsDQo+ICAgLyoNCj4gICAgKiBzZXRfcHRlIHN0b3Jl
cyBhIGxpbnV4IFBURSBpbnRvIHRoZSBsaW51eCBwYWdlIHRhYmxlLg0KPiAgICAqLw0KPiAtdm9p
ZCBzZXRfcHRlX2F0KHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLCB1bnNpZ25lZCBsb25nIGFkZHIsIHB0
ZV90ICpwdGVwLA0KPiAtCQlwdGVfdCBwdGUpDQo+ICt2b2lkIHNldF9wdGVzKHN0cnVjdCBtbV9z
dHJ1Y3QgKm1tLCB1bnNpZ25lZCBsb25nIGFkZHIsIHB0ZV90ICpwdGVwLA0KPiArCQlwdGVfdCBw
dGUsIHVuc2lnbmVkIGludCBucikNCj4gICB7DQo+ICAgCS8qDQo+ICAgCSAqIE1ha2Ugc3VyZSBo
YXJkd2FyZSB2YWxpZCBiaXQgaXMgbm90IHNldC4gV2UgZG9uJ3QgZG8NCj4gQEAgLTIwMyw3ICsy
MDMsMTQgQEAgdm9pZCBzZXRfcHRlX2F0KHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLCB1bnNpZ25lZCBs
b25nIGFkZHIsIHB0ZV90ICpwdGVwLA0KPiAgIAlwdGUgPSBzZXRfcHRlX2ZpbHRlcihwdGUpOw0K
PiAgIA0KPiAgIAkvKiBQZXJmb3JtIHRoZSBzZXR0aW5nIG9mIHRoZSBQVEUgKi8NCj4gLQlfX3Nl
dF9wdGVfYXQobW0sIGFkZHIsIHB0ZXAsIHB0ZSwgMCk7DQo+ICsJZm9yICg7Oykgew0KPiArCQlf
X3NldF9wdGVfYXQobW0sIGFkZHIsIHB0ZXAsIHB0ZSwgMCk7DQo+ICsJCWlmICgtLW5yID09IDAp
DQo+ICsJCQlicmVhazsNCj4gKwkJcHRlcCsrOw0KPiArCQlwdGUgPSBfX3B0ZShwdGVfdmFsKHB0
ZSkgKyAoMVVMIDw8IFBURV9SUE5fU0hJRlQpKTsNCj4gKwkJYWRkciArPSBQQUdFX1NJWkU7DQo+
ICsJfQ0KPiAgIH0NCj4gICANCj4gICB2b2lkIHVubWFwX2tlcm5lbF9wYWdlKHVuc2lnbmVkIGxv
bmcgdmEpDQo=
