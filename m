Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB527F5848
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Nov 2023 07:34:51 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=Ti0Ln6Id;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SbSyd3cT6z3dDx
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Nov 2023 17:34:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=Ti0Ln6Id;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::60b; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on2060b.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::60b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SbSxn4QRtz2xrD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Nov 2023 17:34:05 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R/+x998fU16VUCAyXXr2UMFEOsOaG3qwCWANpmLYkTtgW8jhaBYL9u7rXuaFRuqd4sbOd9roGntnaBOx9XVzAVn6YCqk5L+O/h8lG5lfjElcBG96VBDT6PRDM8yAA+RBTmL2LPoKFCGP788CVNY3wN79ZjU3TBiB/udnRrSbQYGiEjuB27f9shmrHM7X4HJOPdiaYkQ7DU7ESdZP1PtGip5oRWs0c3rXA0g9XxvmyIB2tXYWgc31FZspBZZXuuGoqhlq42VdC+UxDZHCwEMsZOM5NhP+5QQdW5oO6sIiI6asIAOEIfkClTLQ+idz7bIK8FoLUdRXdVoFl5WUuL+uVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tM1RW7EYJE5wR25uwtq6mldzaTdU9MVaU4gI/A/kwTk=;
 b=S++nyd/OQWIR0Wv8Rqo6JG64Z94WVaEiARD9AA47QDLsphCJvy705w5ZWMGnqleIbwDuP+fcRxinqFN4BB1XXqSVhhEQUT8a2GQ/1WfGDooEnyP8AzMhGITBHDUEnMeY0oZocUWn/kuYj5yTZNXofmEXVAZ//7qmxiO/Q/oHcqLCiGLERPw3/xAn031QqtsEX3f7/yjwA2NkVFNEDiqXCAR3Ie5VnaaYss6A/qRo+wID+9nwTqd9lhKtrl0rOIqaiwbGMSXZFsCL+KDdQaZ3yug/1HvHXBKJCE5pkMQjyQvpfIaTeNAeGNBFlH/lyyGWKji2XrflMGeMioQZM/vS7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tM1RW7EYJE5wR25uwtq6mldzaTdU9MVaU4gI/A/kwTk=;
 b=Ti0Ln6IdB0L8DdEbb8GKXJpUgGAuLJgbYB75Rkr5bbHI48rNB7gpcDb0LRctCZRajSBCD+NgtLT+5yQ5i9xqJNlpSDgYQbgrPAqvYC2plJyhUF3hQPz1iHBFSLdenoWTOsLRd082/zD19iN3GNK/dokK+7ABDtakpD1HrcIbrhWeEjOGOSLklFIFtFhWJGqEva31Kp52WH3LtnHTu1uPr19peL0NSEj9UDw2pqvtXehGOlBEg+7QYk7HUWnCkHVCavfGA6y1y8gbKiQoQbe53a9fTQMgGJ9vVw8nzbhAPtlanHciiCQPqPORMhyszysZY9CJ1INh0JAxqTrKeieYVA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB3413.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:120::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.13; Thu, 23 Nov
 2023 06:33:45 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5bfe:e2f2:6d89:8d97]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5bfe:e2f2:6d89:8d97%3]) with mapi id 15.20.7046.012; Thu, 23 Nov 2023
 06:33:45 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Daniel Walker <danielwa@cisco.com>, Will Deacon <will@kernel.org>, Rob
 Herring <robh@kernel.org>, Daniel Gimpelevich
	<daniel@gimpelevich.san-francisco.ca.us>, Andrew Morton
	<akpm@linux-foundation.org>, Pratyush Brahma <quic_pbrahma@quicinc.com>,
	Tomas Mudrunka <tomas.mudrunka@gmail.com>, Sean Anderson
	<sean.anderson@seco.com>, "x86@kernel.org" <x86@kernel.org>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 2/8] scripts: insert-sys-cert: add command line insert
 capability
Thread-Topic: [PATCH 2/8] scripts: insert-sys-cert: add command line insert
 capability
Thread-Index: AQHaE3aZ3yXEt1+//kW4nGjQhoPFwbCHhxaA
Date: Thu, 23 Nov 2023 06:33:45 +0000
Message-ID: <c0b173d2-a7b8-41e3-ae5a-deafba2ba598@csgroup.eu>
References: <20231110013817.2378507-1-danielwa@cisco.com>
 <20231110013817.2378507-3-danielwa@cisco.com>
In-Reply-To: <20231110013817.2378507-3-danielwa@cisco.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PAZP264MB3413:EE_
x-ms-office365-filtering-correlation-id: 25df53cf-1b76-4dd4-5826-08dbebee250f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  pNDQmx1GRFiCrgpj5VsX2JejOG/iLRWXbZHUj3HgmK40kwl58uW4lO5LyrEzBRRTHsW8fmEVR2mUW2nO/wRbWS3ldUywBK/KbbyMIHVD9LZSsU8jsSHctrXm1PmAFOKU04EZ+4TyF0gN3I289ShBhVYFuoUpM+ILh6iwpv0i1tRBaRN01Xug5xrBFWE5NHnsCromTYAQLZuSClWCQo1cyyO/ZsIFg0adZBAv0HmAG0wXQdtdc+nIOtYth3jCq5PndL4B1Ji2utpxEjpcp0yJrAWovDCIMMctaG9yvFylDx5eW7WhbeFQClC5Ionz0OFxnXGGxuS2mZ0cCMgI7zF554qML7dTvLezyaAhjIP0TH1GrK/r7Eo0x9vIqxDs05dmKnH4ASP0WBpkKbs1CFwncdqPhfWUH9iIweB2UZ0dHiFZW3OFD8kbBmgnh6WNbdKtIfcsniVLsTIf4HBjm5bKLZEzRPRAQhIOqoCCR4ubslMu2fdtZySQPXvThkwX+uqq+MsKvXetAhL4BKxgEYYPs3l2yuzj9o4bfS6r4P1bV43OkfpQVaM2GWS2NFLODEtkKXKsq01LZCMwDgBk6aSwg38Ox6LEezRr1Gg+lthaz5MkngNGtKGoOPIW9v1ipt5uZEANB4gC5C/5f/UqKDjBoi2oCv//POcANr9vFykkXxwlqSm23KnGrQNxlS0IbtOBz12HFZvUkPOCwL8bVyTIEtcADFMs6DhchuVNOyC28mgYgVBPm8dDfl9bd0rXBeh8
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(346002)(366004)(396003)(39860400002)(230273577357003)(230173577357003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(2616005)(26005)(66574015)(6512007)(71200400001)(6506007)(83380400001)(7416002)(5660300002)(2906002)(44832011)(41300700001)(76116006)(91956017)(110136005)(6486002)(478600001)(66946007)(4326008)(64756008)(8676002)(8936002)(54906003)(66446008)(66476007)(66556008)(316002)(122000001)(38100700002)(921008)(38070700009)(36756003)(31696002)(86362001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?Rk9KV1l3RnAvY0dvYmlEU29GOFkvWHEwa3ZLL1RZZjFkai9pUmJpRXpwTDl3?=
 =?utf-8?B?MGNNWjBkT0dwdnpMQWlUbVIxZWNJV2Y2SFBpblAwSUNGR3YvVG1yV1FLMEpr?=
 =?utf-8?B?S0s4OUdJUTdZamVTb3FDMEIvc0QrM2tNZWJJbEl1S0ZJMTVlRGNVRlBVakJE?=
 =?utf-8?B?TUdSR1ZzRHF0eHpNU1lXZlBka2VZcVkrWGZobjF0S01mRllzd3FrZmsxa3VX?=
 =?utf-8?B?TTRKcmthK0xwM3l4Ny9FT3ZEdE1MWDJWQ0VqSDR5MnFmSlNpRWVlWGt4OFR6?=
 =?utf-8?B?LzBvbE15ZzFUOHlwS25TTkE0M0I4amFrZ3pLK0sxamNqRjhQaHVQei9WSWgy?=
 =?utf-8?B?em1xOWJCK1kwYm5DNzFzbDZOckFFUXE1cFJGcVlkVFNTclkwbVFLVytTeTcy?=
 =?utf-8?B?ZHQ4eVNURUlaSjUxYktJeGt6VDhoVGwrbTVtK0hHREJTd1pLdXZHMkE4U3Vy?=
 =?utf-8?B?K1pudnduYnByZVhOMkcrL0w2emxzbXlFYlZwWS9IYUtucGJWaUQvbmxuWlN0?=
 =?utf-8?B?SkEwWmwxcG02YWR2bEFOQzdSVUhFaTU4aEdNODUzUEtVakdaa1VyeHE5M05O?=
 =?utf-8?B?V1V3Y1M4b3JUWm9aTzYvWnVVOVZObXhjY1FrTWJXRHNNeVdTNjNCWTdrOGlN?=
 =?utf-8?B?QWttOTdyT0xkUlUxSVpBa08xeEIyN0RibGdSemVIdWVVcmltMWJXZU5HS0dx?=
 =?utf-8?B?RTlsVXhWb0htZXJkdm9UbnNnZUcrOXpMdDQ2YnpnR1pVOGU2UTFPNmt5TWU3?=
 =?utf-8?B?dDVhU09ZeTlsaFVjeE05c1FBV0JCRnd6T2NDbWhGWVJpdTBsaFoxcU5qSzhG?=
 =?utf-8?B?Y3BXTGdENkQ2T0xBeGNHcWx3dk5aeXJTY1RBYzVRQkNTeFh3VFJwNTZZT0wr?=
 =?utf-8?B?TGZCV0pBb1A3d2o1c0M0eXdNYnAvUlhoTWtPRS96ZVNHYnVjQlVPMlhobEpN?=
 =?utf-8?B?ZExaTzlhWDhDajhWWU9mYWFFclAvVkowK2F6OWRxOHQyejNBMVZGZzJNdWxY?=
 =?utf-8?B?OWNiOFpTL2RTd0Frb3FzcEg0bGh4RmVXbFdnUnA1Zmw3K2p4aDJFS0MvQ2pN?=
 =?utf-8?B?Sk53aHZpaWdQQm9lQ2JPa0hjbnBTSTE0RG51VUZYNUNad090WlpqcTJWMzM5?=
 =?utf-8?B?QnFiQTVYdVVBTmlqRWhud1VqRTZjZXViMFQ4RVBQUk82dmJKM3FkZGNVUEw2?=
 =?utf-8?B?SXA4d0p3Skl5WnlvUWo5cTFtU1pvR29pdUlkUUEzZmpHOW1OaXovOWZrWDNQ?=
 =?utf-8?B?S3NITzBZdWxyVWw5bGJXdjFxcFhWU1Nhcm1kZDgxQithSzB2L05Yd2tlVzZR?=
 =?utf-8?B?bXdhVk5MMGJ5NGZ4TzR6ZG9EekhvaStOOVNvZmRvMmtWdnRMd0FIeEZ5WW8x?=
 =?utf-8?B?d0VLbWZFMXdLUjBVSzhibGZuMVBZa1FreldaaFhWUkVZQTRzbnZ3V0c0Sjlv?=
 =?utf-8?B?K0RZZjZ5eUd4VXA1Qis5SmxDY2ZURGtTTGtSZnpBNmNsUnZWNG1xTHhUVjgz?=
 =?utf-8?B?K245WmY3eXNOY1dCeVA0eWhqMDBZUmhWeWZVb3ZydzBwOWQzcTIvTCtYZy9n?=
 =?utf-8?B?RDNwUjRQanUvNklneEJPVFBoNUNPTXd6eEU1WHAwS05vZk1JVlpJeXRrOTRY?=
 =?utf-8?B?YU9NanZoc0FQSzgwN09mbE1MVkxDalZxNFIvQUFyVjZKVXcwV0xKbUgzbmpQ?=
 =?utf-8?B?OWZGbVg5WkVWc21JbzEwRzA2Tk9xTGNXVy9XeXhTc2RxYnd6M01vQzRaaEdD?=
 =?utf-8?B?bEdmZXhCREIzT0QxNEhKVzlrS3dzc0JTSFlUMHdwdVY2d0VmNi9sWlR0RnF3?=
 =?utf-8?B?aDI3VXJXYU1JTVZvQm5ia3pHNyttWDFMYkVHejBiTDdzOTZHNUQzYWFaM1pN?=
 =?utf-8?B?QnRjaE1tTXJWeGc1dGl0RG15NG95bFlzMVFrNUJoQXoweC9peExjYnp0TDkx?=
 =?utf-8?B?Ym5FT3c1TVk0ZHNFdEYrYkxsSDVEN0gwVmJVRTFCM3FDbkowZWJPODAwYVdn?=
 =?utf-8?B?MjZncHBXWUtkZ2M0ZnZhVUVFblJtclhteUJpaTBIT3VpbkQzYkFTSWZBd0Iy?=
 =?utf-8?B?eUs5WW5YWnE4UkRONWJCa0FZSG9tRWt5SHZEeHZ5alFtWEx3YXZIUFU2dXJs?=
 =?utf-8?B?ZVUrNjBld0RlUnVROEhwL3JxS2k4NUdHaElyUXpJOVFsNzlnMXZBMlM4SUpv?=
 =?utf-8?B?OGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B7FCDE9D0E55C34F906C3419175BD912@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 25df53cf-1b76-4dd4-5826-08dbebee250f
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2023 06:33:45.9273
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9ZOJsEMIz21iUOFC1J8z+EEflflI9XMjhBYgKhsahnuufoEW2oAClfj4h3y1Z3WkGG7WxOvfu4XC/e/br+/cOGHSS5GP+NeBxxIV9isIiIU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB3413
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "xe-linux-external@cisco.com" <xe-linux-external@cisco.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDEwLzExLzIwMjMgw6AgMDI6MzgsIERhbmllbCBXYWxrZXIgYSDDqWNyaXTCoDoNCj4g
VGhpcyBhZGRzIGNoYW5nZXMgdG8gdGhlIGluc2VydC1zeXMtY2VydCB0b29sIHRvIGFsbG93IHVw
ZGF0aW5nDQo+IHRoZSBjbWRsaW5lX3ByZXBlbmQgYW5kIGNtZGxpbmVfYXBwZW5kIHN5bWJvbHMg
aW4gYWRkaXRpb24gdG8NCj4gYWRkaW5nIGNlcnRpZmljYXRlcy4NCg0KTmljZSBmZWF0dXJlLg0K
DQo+IA0KPiBVcGRhdGluZyB0aGUgY21kbGluZSBzeW1ib2xzIHdhcyB0ZXN0ZWQgb24gYSBQVkgg
dmlydHVhbCBtYWNoaW5lDQo+IHdpdGggYSB2bWxpbnV4LCBhbmQgd2l0aCBhIGJ6SW1hZ2Ugd2hp
Y2ggd2FzIHJlcGFja2FnZWQgb24geDg2Lg0KDQpDYW4gaXQgYWxzbyB3b3JrIHdpdGggVWltYWdl
cyBmcm9tIHVib290L3BwYyA/DQoNCj4gDQo+IFRoaXMgY29tbWl0IGludGVudGlvbmFsbHkga2Vl
cHMgdGhlIHRvb2wgZmlsZW5hbWUgdGhlIHNhbWUgdG8gYWxsb3cNCj4gdGhlIGNoYW5nZXMgdG8g
YmUgc2VlbiBtb3JlIGVhc2lseS4gVGhlIG5leHQgY29tbWl0IHdpbGwgY2hhbmdlDQo+IHRoZSBu
YW1lIG9mIHRoZSB0b29sLg0KDQpOb3Qgc3VyZSB3aGF0IHlvdSBtZWFuLg0KSWYgSSB1bmRlcnN0
YW5kIGNvcnJlY3RseSwgZ2l0IGZvcm1hdC1wYXRjaCAtTSBzaG91bGQgZG8gd2hhdCB5b3Ugd2Fu
dC4NCg0KPiANCj4gQ2M6IHhlLWxpbnV4LWV4dGVybmFsQGNpc2NvLmNvbQ0KPiBTaWduZWQtb2Zm
LWJ5OiBEYW5pZWwgV2Fsa2VyIDxkYW5pZWx3YUBjaXNjby5jb20+DQo+IC0tLQ0KPiAgIHNjcmlw
dHMvaW5zZXJ0LXN5cy1jZXJ0LmMgfCAyNDEgKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0t
LS0tLS0tLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMTcwIGluc2VydGlvbnMoKyksIDcxIGRlbGV0
aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3NjcmlwdHMvaW5zZXJ0LXN5cy1jZXJ0LmMgYi9z
Y3JpcHRzL2luc2VydC1zeXMtY2VydC5jDQo+IGluZGV4IDg5MDI4MzZjMjM0Mi4uNzdkMzMwNmNm
YmZiIDEwMDY0NA0KPiAtLS0gYS9zY3JpcHRzL2luc2VydC1zeXMtY2VydC5jDQo+ICsrKyBiL3Nj
cmlwdHMvaW5zZXJ0LXN5cy1jZXJ0LmMNCj4gQEAgLTMwLDYgKzMwLDkgQEANCj4gICAjZGVmaW5l
IFVTRURfU1lNICAic3lzdGVtX2V4dHJhX2NlcnRfdXNlZCINCj4gICAjZGVmaW5lIExTSVpFX1NZ
TSAic3lzdGVtX2NlcnRpZmljYXRlX2xpc3Rfc2l6ZSINCj4gICANCj4gKyNkZWZpbmUgQ01ETElO
RV9BUFBFTkQgImNtZGxpbmVfYXBwZW5kIg0KPiArI2RlZmluZSBDTURMSU5FX1BSRVBFTkQgImNt
ZGxpbmVfcHJlcGVuZCINCj4gKw0KPiAgICNkZWZpbmUgaW5mbyhmb3JtYXQsIGFyZ3MuLi4pIGZw
cmludGYoc3RkZXJyLCAiSU5GTzogICAgIiBmb3JtYXQsICMjIGFyZ3MpDQo+ICAgI2RlZmluZSB3
YXJuKGZvcm1hdCwgYXJncy4uLikgZnByaW50ZihzdGRvdXQsICJXQVJOSU5HOiAiIGZvcm1hdCwg
IyMgYXJncykNCj4gICAjZGVmaW5lICBlcnIoZm9ybWF0LCBhcmdzLi4uKSBmcHJpbnRmKHN0ZGVy
ciwgIkVSUk9SOiAgICIgZm9ybWF0LCAjIyBhcmdzKQ0KPiBAQCAtMjY3LDk1ICsyNzAsNDYgQEAg
c3RhdGljIHZvaWQgcHJpbnRfc3ltKEVsZl9FaGRyICpoZHIsIHN0cnVjdCBzeW0gKnMpDQo+ICAg
DQo+ICAgc3RhdGljIHZvaWQgcHJpbnRfdXNhZ2UoY2hhciAqZSkNCj4gICB7DQo+IC0JcHJpbnRm
KCJVc2FnZSAlcyBbLXMgPFN5c3RlbS5tYXA+XSAtYiA8dm1saW51eD4gLWMgPGNlcnRmaWxlPlxu
IiwgZSk7DQo+ICsJcHJpbnRmKCJVc2FnZSAlcyBbLXMgPFN5c3RlbS5tYXA+XSAtYiA8dm1saW51
eD4gWyAtYyA8Y2VydGZpbGU+IHwgLXAgPGNvbW1hbmQgbGluZSBwcmVwZW5kPiB8IC1hIDxjb21t
YW5kIGxpbmUgYXBwZW5kPiBdLVxuIiwgZSk7DQo+ICAgfQ0KPiAgIA0KPiAtaW50IG1haW4oaW50
IGFyZ2MsIGNoYXIgKiphcmd2KQ0KPiArc3RhdGljIGNoYXIgKmNtZGxpbmVfcHJlcGVuZCwgKmNt
ZGxpbmVfYXBwZW5kOw0KPiArc3RhdGljIGNoYXIgKnN5c3RlbV9tYXBfZmlsZTsNCj4gK3N0YXRp
YyBjaGFyICpjZXJ0X2ZpbGU7DQo+ICtzdGF0aWMgY2hhciAqY2xpX25hbWU7DQo+ICsNCj4gK3N0
YXRpYyBpbnQgaW5zZXJ0X2NlcnRpZmljYXRlKEVsZl9FaGRyICpoZHIpDQo+ICAgew0KPiAtCWNo
YXIgKnN5c3RlbV9tYXBfZmlsZSA9IE5VTEw7DQo+IC0JY2hhciAqdm1saW51eF9maWxlID0gTlVM
TDsNCj4gLQljaGFyICpjZXJ0X2ZpbGUgPSBOVUxMOw0KPiAtCWludCB2bWxpbnV4X3NpemU7DQo+
ICsJc3RydWN0IHN5bSBjZXJ0X3N5bSwgbHNpemVfc3ltLCB1c2VkX3N5bTsNCj4gKwlFbGZfU2hk
ciAqc3ltdGFiID0gTlVMTDsNCj4gKwl1bnNpZ25lZCBsb25nICpsc2l6ZTsNCj4gKwlGSUxFICpz
eXN0ZW1fbWFwOw0KPiAgIAlpbnQgY2VydF9zaXplOw0KPiAtCUVsZl9FaGRyICpoZHI7DQo+ICAg
CWNoYXIgKmNlcnQ7DQo+IC0JRklMRSAqc3lzdGVtX21hcDsNCj4gLQl1bnNpZ25lZCBsb25nICps
c2l6ZTsNCj4gICAJaW50ICp1c2VkOw0KPiAtCWludCBvcHQ7DQo+IC0JRWxmX1NoZHIgKnN5bXRh
YiA9IE5VTEw7DQo+IC0Jc3RydWN0IHN5bSBjZXJ0X3N5bSwgbHNpemVfc3ltLCB1c2VkX3N5bTsN
Cj4gLQ0KPiAtCXdoaWxlICgob3B0ID0gZ2V0b3B0KGFyZ2MsIGFyZ3YsICJiOmM6czoiKSkgIT0g
LTEpIHsNCj4gLQkJc3dpdGNoIChvcHQpIHsNCj4gLQkJY2FzZSAncyc6DQo+IC0JCQlzeXN0ZW1f
bWFwX2ZpbGUgPSBvcHRhcmc7DQo+IC0JCQlicmVhazsNCj4gLQkJY2FzZSAnYic6DQo+IC0JCQl2
bWxpbnV4X2ZpbGUgPSBvcHRhcmc7DQo+IC0JCQlicmVhazsNCj4gLQkJY2FzZSAnYyc6DQo+IC0J
CQljZXJ0X2ZpbGUgPSBvcHRhcmc7DQo+IC0JCQlicmVhazsNCj4gLQkJZGVmYXVsdDoNCj4gLQkJ
CWJyZWFrOw0KPiAtCQl9DQo+IC0JfQ0KPiAgIA0KPiAtCWlmICghdm1saW51eF9maWxlIHx8ICFj
ZXJ0X2ZpbGUpIHsNCj4gLQkJcHJpbnRfdXNhZ2UoYXJndlswXSk7DQo+IC0JCWV4aXQoRVhJVF9G
QUlMVVJFKTsNCj4gKwlpZiAoIWNlcnRfZmlsZSkgew0KPiArCQlwcmludF91c2FnZShjbGlfbmFt
ZSk7DQo+ICsJCXJldHVybiBFWElUX0ZBSUxVUkU7DQo+ICAgCX0NCj4gICANCj4gICAJY2VydCA9
IHJlYWRfZmlsZShjZXJ0X2ZpbGUsICZjZXJ0X3NpemUpOw0KPiAgIAlpZiAoIWNlcnQpDQo+IC0J
CWV4aXQoRVhJVF9GQUlMVVJFKTsNCj4gLQ0KPiAtCWhkciA9IG1hcF9maWxlKHZtbGludXhfZmls
ZSwgJnZtbGludXhfc2l6ZSk7DQo+IC0JaWYgKCFoZHIpDQo+IC0JCWV4aXQoRVhJVF9GQUlMVVJF
KTsNCj4gLQ0KPiAtCWlmICh2bWxpbnV4X3NpemUgPCBzaXplb2YoKmhkcikpIHsNCj4gLQkJZXJy
KCJJbnZhbGlkIEVMRiBmaWxlLlxuIik7DQo+IC0JCWV4aXQoRVhJVF9GQUlMVVJFKTsNCj4gLQl9
DQo+IC0NCj4gLQlpZiAoKGhkci0+ZV9pZGVudFtFSV9NQUcwXSAhPSBFTEZNQUcwKSB8fA0KPiAt
CSAgICAoaGRyLT5lX2lkZW50W0VJX01BRzFdICE9IEVMRk1BRzEpIHx8DQo+IC0JICAgIChoZHIt
PmVfaWRlbnRbRUlfTUFHMl0gIT0gRUxGTUFHMikgfHwNCj4gLQkgICAgKGhkci0+ZV9pZGVudFtF
SV9NQUczXSAhPSBFTEZNQUczKSkgew0KPiAtCQllcnIoIkludmFsaWQgRUxGIG1hZ2ljLlxuIik7
DQo+IC0JCWV4aXQoRVhJVF9GQUlMVVJFKTsNCj4gLQl9DQo+IC0NCj4gLQlpZiAoaGRyLT5lX2lk
ZW50W0VJX0NMQVNTXSAhPSBDVVJSRU5UX0VMRkNMQVNTKSB7DQo+IC0JCWVycigiRUxGIGNsYXNz
IG1pc21hdGNoLlxuIik7DQo+IC0JCWV4aXQoRVhJVF9GQUlMVVJFKTsNCj4gLQl9DQo+IC0NCj4g
LQlpZiAoaGRyLT5lX2lkZW50W0VJX0RBVEFdICE9IGVuZGlhbm5lc3MoKSkgew0KPiAtCQllcnIo
IkVMRiBlbmRpYW4gbWlzbWF0Y2guXG4iKTsNCj4gLQkJZXhpdChFWElUX0ZBSUxVUkUpOw0KPiAt
CX0NCj4gLQ0KPiAtCWlmIChoZHItPmVfc2hvZmYgPiB2bWxpbnV4X3NpemUpIHsNCj4gLQkJZXJy
KCJDb3VsZCBub3QgZmluZCBzZWN0aW9uIGhlYWRlci5cbiIpOw0KPiAtCQlleGl0KEVYSVRfRkFJ
TFVSRSk7DQo+IC0JfQ0KPiArCQlyZXR1cm4gRVhJVF9GQUlMVVJFOw0KPiAgIA0KPiAgIAlzeW10
YWIgPSBnZXRfc3ltYm9sX3RhYmxlKGhkcik7DQo+ICAgCWlmICghc3ltdGFiKSB7DQo+ICAgCQl3
YXJuKCJDb3VsZCBub3QgZmluZCB0aGUgc3ltYm9sIHRhYmxlLlxuIik7DQo+ICAgCQlpZiAoIXN5
c3RlbV9tYXBfZmlsZSkgew0KPiAgIAkJCWVycigiUGxlYXNlIHByb3ZpZGUgYSBTeXN0ZW0ubWFw
IGZpbGUuXG4iKTsNCj4gLQkJCXByaW50X3VzYWdlKGFyZ3ZbMF0pOw0KPiAtCQkJZXhpdChFWElU
X0ZBSUxVUkUpOw0KPiArCQkJcHJpbnRfdXNhZ2UoY2xpX25hbWUpOw0KPiArCQkJcmV0dXJuIEVY
SVRfRkFJTFVSRTsNCj4gICAJCX0NCj4gICANCj4gICAJCXN5c3RlbV9tYXAgPSBmb3BlbihzeXN0
ZW1fbWFwX2ZpbGUsICJyIik7DQo+ICAgCQlpZiAoIXN5c3RlbV9tYXApIHsNCj4gICAJCQlwZXJy
b3Ioc3lzdGVtX21hcF9maWxlKTsNCj4gLQkJCWV4aXQoRVhJVF9GQUlMVVJFKTsNCj4gKwkJCXJl
dHVybiBFWElUX0ZBSUxVUkU7DQo+ICAgCQl9DQo+ICAgCQlnZXRfc3ltYm9sX2Zyb21fbWFwKGhk
ciwgc3lzdGVtX21hcCwgQ0VSVF9TWU0sICZjZXJ0X3N5bSk7DQo+ICAgCQlnZXRfc3ltYm9sX2Zy
b21fbWFwKGhkciwgc3lzdGVtX21hcCwgVVNFRF9TWU0sICZ1c2VkX3N5bSk7DQo+IEBAIC0zNzEs
NyArMzI1LDcgQEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKiphcmd2KQ0KPiAgIAl9DQo+ICAg
DQo+ICAgCWlmICghY2VydF9zeW0ub2Zmc2V0IHx8ICFsc2l6ZV9zeW0ub2Zmc2V0IHx8ICF1c2Vk
X3N5bS5vZmZzZXQpDQo+IC0JCWV4aXQoRVhJVF9GQUlMVVJFKTsNCj4gKwkJcmV0dXJuIEVYSVRf
RkFJTFVSRTsNCj4gICANCj4gICAJcHJpbnRfc3ltKGhkciwgJmNlcnRfc3ltKTsNCj4gICAJcHJp
bnRfc3ltKGhkciwgJnVzZWRfc3ltKTsNCj4gQEAgLTM4MiwxNCArMzM2LDE0IEBAIGludCBtYWlu
KGludCBhcmdjLCBjaGFyICoqYXJndikNCj4gICANCj4gICAJaWYgKGNlcnRfc3ltLnNpemUgPCBj
ZXJ0X3NpemUpIHsNCj4gICAJCWVycigiQ2VydGlmaWNhdGUgaXMgbGFyZ2VyIHRoYW4gdGhlIHJl
c2VydmVkIGFyZWEhXG4iKTsNCj4gLQkJZXhpdChFWElUX0ZBSUxVUkUpOw0KPiArCQlyZXR1cm4g
RVhJVF9GQUlMVVJFOw0KPiAgIAl9DQo+ICAgDQo+ICAgCS8qIElmIHRoZSBleGlzdGluZyBjZXJ0
IGlzIHRoZSBzYW1lLCBkb24ndCBvdmVyd3JpdGUgKi8NCj4gICAJaWYgKGNlcnRfc2l6ZSA9PSAq
dXNlZCAmJg0KPiAgIAkgICAgc3RybmNtcChjZXJ0X3N5bS5jb250ZW50LCBjZXJ0LCBjZXJ0X3Np
emUpID09IDApIHsNCj4gICAJCXdhcm4oIkNlcnRpZmljYXRlIHdhcyBhbHJlYWR5IGluc2VydGVk
LlxuIik7DQo+IC0JCWV4aXQoRVhJVF9TVUNDRVNTKTsNCj4gKwkJcmV0dXJuIEVYSVRfU1VDQ0VT
UzsNCj4gICAJfQ0KPiAgIA0KPiAgIAlpZiAoKnVzZWQgPiAwKQ0KPiBAQCAtNDA2LDUgKzM2MCwx
NTAgQEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKiphcmd2KQ0KPiAgIAkJCQkJCWNlcnRfc3lt
LmFkZHJlc3MpOw0KPiAgIAlpbmZvKCJVc2VkICVkIGJ5dGVzIG91dCBvZiAlZCBieXRlcyByZXNl
cnZlZC5cbiIsICp1c2VkLA0KPiAgIAkJCQkJCSBjZXJ0X3N5bS5zaXplKTsNCj4gLQlleGl0KEVY
SVRfU1VDQ0VTUyk7DQo+ICsJcmV0dXJuIEVYSVRfU1VDQ0VTUzsNCj4gK30NCj4gKw0KPiArc3Rh
dGljIGludCBpbnNlcnRfY21kbGluZShFbGZfRWhkciAqaGRyKQ0KPiArew0KPiArCXN0cnVjdCBz
eW0gY21kbGluZV9wcmVwZW5kX3N5bSwgY21kbGluZV9hcHBlbmRfc3ltOw0KPiArCUVsZl9TaGRy
ICpzeW10YWIgPSBOVUxMOw0KPiArCUZJTEUgKnN5c3RlbV9tYXA7DQo+ICsNCj4gKwlzeW10YWIg
PSBnZXRfc3ltYm9sX3RhYmxlKGhkcik7DQo+ICsJaWYgKCFzeW10YWIpIHsNCj4gKwkJd2Fybigi
Q291bGQgbm90IGZpbmQgdGhlIHN5bWJvbCB0YWJsZS5cbiIpOw0KPiArCQlpZiAoIXN5c3RlbV9t
YXBfZmlsZSkgew0KPiArCQkJZXJyKCJQbGVhc2UgcHJvdmlkZSBhIFN5c3RlbS5tYXAgZmlsZS5c
biIpOw0KPiArCQkJcHJpbnRfdXNhZ2UoY2xpX25hbWUpOw0KPiArCQkJcmV0dXJuIEVYSVRfRkFJ
TFVSRTsNCj4gKwkJfQ0KPiArDQo+ICsJCXN5c3RlbV9tYXAgPSBmb3BlbihzeXN0ZW1fbWFwX2Zp
bGUsICJyIik7DQo+ICsJCWlmICghc3lzdGVtX21hcCkgew0KPiArCQkJcGVycm9yKHN5c3RlbV9t
YXBfZmlsZSk7DQo+ICsJCQlyZXR1cm4gRVhJVF9GQUlMVVJFOw0KPiArCQl9DQo+ICsJCWdldF9z
eW1ib2xfZnJvbV9tYXAoaGRyLCBzeXN0ZW1fbWFwLCBDTURMSU5FX1BSRVBFTkQsICZjbWRsaW5l
X3ByZXBlbmRfc3ltKTsNCj4gKwkJZ2V0X3N5bWJvbF9mcm9tX21hcChoZHIsIHN5c3RlbV9tYXAs
IENNRExJTkVfQVBQRU5ELCAmY21kbGluZV9hcHBlbmRfc3ltKTsNCj4gKwl9IGVsc2Ugew0KPiAr
CQlpbmZvKCJTeW1ib2wgdGFibGUgZm91bmQuXG4iKTsNCj4gKwkJaWYgKHN5c3RlbV9tYXBfZmls
ZSkNCj4gKwkJCXdhcm4oIlN5c3RlbS5tYXAgaXMgaWdub3JlZC5cbiIpOw0KPiArCQlnZXRfc3lt
Ym9sX2Zyb21fdGFibGUoaGRyLCBzeW10YWIsIENNRExJTkVfUFJFUEVORCwgJmNtZGxpbmVfcHJl
cGVuZF9zeW0pOw0KPiArCQlnZXRfc3ltYm9sX2Zyb21fdGFibGUoaGRyLCBzeW10YWIsIENNRExJ
TkVfQVBQRU5ELCAmY21kbGluZV9hcHBlbmRfc3ltKTsNCj4gKwl9DQo+ICsNCj4gKwlwcmludF9z
eW0oaGRyLCAmY21kbGluZV9wcmVwZW5kX3N5bSk7DQo+ICsJcHJpbnRfc3ltKGhkciwgJmNtZGxp
bmVfYXBwZW5kX3N5bSk7DQo+ICsNCj4gKw0KPiArCWlmIChjbWRsaW5lX3ByZXBlbmQpIHsNCj4g
KwkJaWYgKChzdHJsZW4oY21kbGluZV9wcmVwZW5kKSArIDEpID4gY21kbGluZV9wcmVwZW5kX3N5
bS5zaXplKSB7DQo+ICsJCQllcnIoImNtZGxpbmUgcHJlcGVuZCBpcyBsYXJnZXIgdGhhbiB0aGUg
cmVzZXJ2ZWQgYXJlYSFcbiIpOw0KPiArCQkJcmV0dXJuIEVYSVRfRkFJTFVSRTsNCj4gKwkJfQ0K
PiArDQo+ICsJCW1lbWNweShjbWRsaW5lX3ByZXBlbmRfc3ltLmNvbnRlbnQsIGNtZGxpbmVfcHJl
cGVuZCwgc3RybGVuKGNtZGxpbmVfcHJlcGVuZCkgKyAxKTsNCj4gKwkJaWYgKChzdHJsZW4oY21k
bGluZV9wcmVwZW5kKSArIDEpIDwgY21kbGluZV9wcmVwZW5kX3N5bS5zaXplKQ0KPiArCQkJbWVt
c2V0KGNtZGxpbmVfcHJlcGVuZF9zeW0uY29udGVudCArIHN0cmxlbihjbWRsaW5lX3ByZXBlbmQp
ICsgMSwNCj4gKwkJCQkwLCBjbWRsaW5lX3ByZXBlbmRfc3ltLnNpemUgLSAoc3RybGVuKGNtZGxp
bmVfcHJlcGVuZCkgKyAxKSk7DQo+ICsNCj4gKwkJaW5mbygiSW5zZXJ0ZWQgY21kbGluZSBwcmVw
ZW5kIG9mIFwiJXNcIiBpbnRvIHZtbGludXguXG4iLCBjbWRsaW5lX3ByZXBlbmQpOw0KPiArDQo+
ICsJfQ0KPiArCWlmIChjbWRsaW5lX2FwcGVuZCkgew0KPiArCQlpZiAoKHN0cmxlbihjbWRsaW5l
X2FwcGVuZCkgKyAxKSA+IGNtZGxpbmVfYXBwZW5kX3N5bS5zaXplKSB7DQo+ICsJCQllcnIoImNt
ZGxpbmUgYXBwZW5kIGlzIGxhcmdlciB0aGFuIHRoZSByZXNlcnZlZCBhcmVhIVxuIik7DQo+ICsJ
CQlyZXR1cm4gRVhJVF9GQUlMVVJFOw0KPiArCQl9DQo+ICsNCj4gKwkJbWVtY3B5KGNtZGxpbmVf
YXBwZW5kX3N5bS5jb250ZW50LCBjbWRsaW5lX2FwcGVuZCwgc3RybGVuKGNtZGxpbmVfYXBwZW5k
KSArIDEpOw0KPiArCQlpZiAoKHN0cmxlbihjbWRsaW5lX2FwcGVuZCkgKyAxKSA8IGNtZGxpbmVf
YXBwZW5kX3N5bS5zaXplKQ0KPiArCQkJbWVtc2V0KGNtZGxpbmVfYXBwZW5kX3N5bS5jb250ZW50
ICsgc3RybGVuKGNtZGxpbmVfYXBwZW5kKSArIDEsDQo+ICsJCQkJMCwgY21kbGluZV9hcHBlbmRf
c3ltLnNpemUgLSAoc3RybGVuKGNtZGxpbmVfYXBwZW5kKSArIDEpKTsNCj4gKw0KPiArCQlpbmZv
KCJJbnNlcnRlZCBjbWRsaW5lIGFwcGVuZCBvZiBcIiVzXCIgaW50byB2bWxpbnV4LlxuIiwgY21k
bGluZV9hcHBlbmQpOw0KPiArDQo+ICsJfQ0KPiArCXJldHVybiBFWElUX1NVQ0NFU1M7DQo+ICt9
DQo+ICsNCj4gK2ludCBtYWluKGludCBhcmdjLCBjaGFyICoqYXJndikNCj4gK3sNCj4gKwljaGFy
ICp2bWxpbnV4X2ZpbGUgPSBOVUxMOw0KPiArCWludCB2bWxpbnV4X3NpemU7DQo+ICsJRWxmX0Vo
ZHIgKmhkcjsNCj4gKwlpbnQgb3B0Ow0KPiArCWludCByZXQgPSBFWElUX1NVQ0NFU1M7DQo+ICsN
Cj4gKwl3aGlsZSAoKG9wdCA9IGdldG9wdChhcmdjLCBhcmd2LCAiYjpjOnM6cDphOiIpKSAhPSAt
MSkgew0KPiArCQlzd2l0Y2ggKG9wdCkgew0KPiArCQljYXNlICdzJzoNCj4gKwkJCXN5c3RlbV9t
YXBfZmlsZSA9IG9wdGFyZzsNCj4gKwkJCWJyZWFrOw0KPiArCQljYXNlICdiJzoNCj4gKwkJCXZt
bGludXhfZmlsZSA9IG9wdGFyZzsNCj4gKwkJCWJyZWFrOw0KPiArCQljYXNlICdjJzoNCj4gKwkJ
CWNlcnRfZmlsZSA9IG9wdGFyZzsNCj4gKwkJCWJyZWFrOw0KPiArCQljYXNlICdwJzoNCj4gKwkJ
CWNtZGxpbmVfcHJlcGVuZCA9IG9wdGFyZzsNCj4gKwkJCWJyZWFrOw0KPiArCQljYXNlICdhJzoN
Cj4gKwkJCWNtZGxpbmVfYXBwZW5kID0gb3B0YXJnOw0KPiArCQkJYnJlYWs7DQo+ICsJCWRlZmF1
bHQ6DQo+ICsJCQlicmVhazsNCj4gKwkJfQ0KPiArCX0NCj4gKw0KPiArCWNsaV9uYW1lID0gYXJn
dlswXTsNCj4gKw0KPiArCWlmICghdm1saW51eF9maWxlKSB7DQo+ICsJCXByaW50X3VzYWdlKGNs
aV9uYW1lKTsNCj4gKwkJZXhpdChFWElUX0ZBSUxVUkUpOw0KPiArCX0NCj4gKw0KPiArCWhkciA9
IG1hcF9maWxlKHZtbGludXhfZmlsZSwgJnZtbGludXhfc2l6ZSk7DQo+ICsJaWYgKCFoZHIpDQo+
ICsJCWV4aXQoRVhJVF9GQUlMVVJFKTsNCj4gKw0KPiArCWlmICh2bWxpbnV4X3NpemUgPCBzaXpl
b2YoKmhkcikpIHsNCj4gKwkJZXJyKCJJbnZhbGlkIEVMRiBmaWxlLlxuIik7DQo+ICsJCWV4aXQo
RVhJVF9GQUlMVVJFKTsNCj4gKwl9DQo+ICsNCj4gKwlpZiAoKGhkci0+ZV9pZGVudFtFSV9NQUcw
XSAhPSBFTEZNQUcwKSB8fA0KPiArCSAgICAoaGRyLT5lX2lkZW50W0VJX01BRzFdICE9IEVMRk1B
RzEpIHx8DQo+ICsJICAgIChoZHItPmVfaWRlbnRbRUlfTUFHMl0gIT0gRUxGTUFHMikgfHwNCj4g
KwkgICAgKGhkci0+ZV9pZGVudFtFSV9NQUczXSAhPSBFTEZNQUczKSkgew0KPiArCQllcnIoIklu
dmFsaWQgRUxGIG1hZ2ljLlxuIik7DQo+ICsJCWV4aXQoRVhJVF9GQUlMVVJFKTsNCj4gKwl9DQo+
ICsNCj4gKwlpZiAoaGRyLT5lX2lkZW50W0VJX0NMQVNTXSAhPSBDVVJSRU5UX0VMRkNMQVNTKSB7
DQo+ICsJCWVycigiRUxGIGNsYXNzIG1pc21hdGNoLlxuIik7DQo+ICsJCWV4aXQoRVhJVF9GQUlM
VVJFKTsNCj4gKwl9DQo+ICsNCj4gKwlpZiAoaGRyLT5lX2lkZW50W0VJX0RBVEFdICE9IGVuZGlh
bm5lc3MoKSkgew0KPiArCQllcnIoIkVMRiBlbmRpYW4gbWlzbWF0Y2guXG4iKTsNCj4gKwkJZXhp
dChFWElUX0ZBSUxVUkUpOw0KPiArCX0NCj4gKw0KPiArCWlmIChoZHItPmVfc2hvZmYgPiB2bWxp
bnV4X3NpemUpIHsNCj4gKwkJZXJyKCJDb3VsZCBub3QgZmluZCBzZWN0aW9uIGhlYWRlci5cbiIp
Ow0KPiArCQlleGl0KEVYSVRfRkFJTFVSRSk7DQo+ICsJfQ0KPiArDQo+ICsJaWYgKGNlcnRfZmls
ZSkgew0KPiArCQlyZXQgPSBpbnNlcnRfY2VydGlmaWNhdGUoaGRyKTsNCj4gKwkJcHJpbnRmKCIl
c1xuIiwgY2VydF9maWxlKTsNCj4gKwl9DQo+ICsNCj4gKwlpZiAoY21kbGluZV9hcHBlbmQgfHwg
Y21kbGluZV9wcmVwZW5kKQ0KPiArCQlyZXQgPSBpbnNlcnRfY21kbGluZShoZHIpOw0KPiArDQo+
ICsJZXhpdChyZXQpOw0KPiAgIH0NCg==
