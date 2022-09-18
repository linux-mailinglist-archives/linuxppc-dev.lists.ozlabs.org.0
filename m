Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0134E5BBC83
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 Sep 2022 10:22:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MVgm34r5hz3btV
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 Sep 2022 18:22:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=0xamJMjB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.78; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=0xamJMjB;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120078.outbound.protection.outlook.com [40.107.12.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MVglC6R19z2xGD
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 Sep 2022 18:21:58 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IAfr4SL8lAooKm3ZLYaIL+fGQtBNPjfq9coL5NkZdi21NAPthaBsvQVlfKAI7CeKYhq3hTd6Wl8KcIEiMFZR5C7UfyRb6EYN8zn+92PQrR7Ugq/ilXD9Z912zVmqhcYw119pB6jprf8K/JdEaVZud/g3a0nSvWYq6CXUBpt8QNDA4S96fUc4usGQmw/cDgf2gSVGHgYkKy4GOtKqc5ewHr+Kq+OKCqP9eU1Ds3Uqx4uxvveEybhvEC5vPeecfm2Xs3VhBlXUuBVxOqkTZvSkCLN4jh8gpDBJD3+ZFNgmhwYabWspeIrcWXYKOnKd5eDeg3ffjUyhg3qtTCW3bPkw+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JqLLgti0o5JedN/bQiOL/X3TzpTF5vDO2vOQhON2kFs=;
 b=BvtfSLKDDXLtyfre4OP5CVNdQAtRTu/jstfQtJtbIEUSET4g6PFoymXRPwnL/t6n5DxwMFs+KYhh90+FOn0ltY+QCN7fWL9c/34C0HBqcWJBeF4Np+5SULSD/+1BnNt8IlHKwDYllO7SVmSZM/9bk0gNpX0Ee4kEebknFkRpbBXHbUK+wr/SKymbTOv/jxI6CAGpRgIoDomBXGEBCqr9Dq31eheIyvtj2Z91lpfHu2h2jxfWnRJC4tZQGp6SRf0z1JK5a6cwOBH4GfAfUbKm6rgbY9RYeBc5uNhkFapoyip96z1GEE2zYP9UmsCNvNdUCf7JQlKR+fFS/UHpbHNT3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JqLLgti0o5JedN/bQiOL/X3TzpTF5vDO2vOQhON2kFs=;
 b=0xamJMjByos/R45OKv4Cm2BTJ8Fr6kdV6hKqvA/PFpD76AzwEBr+IX6/Dbt4m+iqB2MpVtzJPdmdtlx/A6N5rA1nOWla/qu0hh/dQjKCnrOZgUUueeHdxzGNaf9ek5NKLRA7uze7BF0rXHkkSwQGgVZzxFSiCMlQMtuk27Kmcf0NQUzo0z/CpTBR47NGR0XGa9rsNshqTxFd9+i5ZxjvVTFbpY7I/HKSZrESf12pn7NVA8fw8VIJpacM1/nTqBXdFMk5v/OTso5tpJr0wM7Zjdc0PyeKXUUu1xzoCiYAI/xAZFRQSZFVyCQuOPMCubJGl4p/b06c95EF+n+aOsBqtA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2921.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:1e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.16; Sun, 18 Sep
 2022 08:21:38 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f4ad:3944:a7f4:fcf3]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f4ad:3944:a7f4:fcf3%4]) with mapi id 15.20.5632.019; Sun, 18 Sep 2022
 08:21:38 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Samuel Holland <samuel@sholland.org>, Michael Ellerman
	<mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc: Save AMR/IAMR when switching tasks
Thread-Topic: [PATCH] powerpc: Save AMR/IAMR when switching tasks
Thread-Index: AQHYyYnrawisyGt7e0mr4Du3kDJFGq3jSIUAgACtpICAAOYbAA==
Date: Sun, 18 Sep 2022 08:21:38 +0000
Message-ID: <10a0377b-7fd0-39b3-705f-9e2cf2515381@csgroup.eu>
References: <20220916050515.48842-1-samuel@sholland.org>
 <89049105-64fc-8d5b-d090-2841064786d1@csgroup.eu>
 <aebab2f0-a962-68ed-b655-84a3e87f2c7d@sholland.org>
In-Reply-To: <aebab2f0-a962-68ed-b655-84a3e87f2c7d@sholland.org>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB2921:EE_
x-ms-office365-filtering-correlation-id: e80e48ff-0aea-45d4-d702-08da994ecee6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  jhV3UEjS+NF1JZ4WExbpg1Ljy5SwCxXXzWcRJvrPUgUovVEKrRyJiYqTYdX6lL3rVnHUfULj19a8MKOcVrypxZYG53Y4r6AyTnJvFsB5ManPXEJrEzSUGAROF2IZENBBymZsEUHA7hj2bEdbnnavJiF+jEB9559nTSYZ0xNHM2fO4jR/T9TOxC1x+JeWNGUDwQ6+rA1cG6bUW3gqTB9TD/87sM3DEt8xaOqunLM5Sl+VMKUknsqVUBvVZuDH/H9g46+CukmKsb9GtnXLS2j2JfiskyzLgDy5GehWXvEwdrZxRM4k9yEEnIxhJfmImj5zeRaIeCKqPFrJ7P1cedWYxhvhqGE8VzoMJAb//nCPqbhrvTx6mZLzuP5VgjFwTOOXRGUsJWqGII7ieWZ9lqgykTxwanr5NldW/nmwKtR2OpF60nrCho9fXN3gpwxNONiIGzqGEuHP8IRZ+4ON6AGgI0HxXlbAkjjnlNVTVU8e7HUHUdDd3cmdgaReonO9iMRSe9NSnjmJZVHaPadv5/gCEqmceGNQS/x822DixonhPqjuSy93cbQNsdDflkvnwvprdrIBcU6vjK8RGaK29Nf2+N7gbcrh5/VTaKkqehjM3DBTTVYFuSv7nMf/5SypXYY9re6R6BRnyOJVXyUskk0GlsWjHGlHDI9ZHXhSl86Pi/H3AJtXG28jha3GSOPywgQ7e0nLbP1otF6avJ5NxydlzMDSdDDo3cCiE2mRk9vY5b7ktL6Bd6fJmLp8Pxuirj8XzPkwzhB8LPho+/F7kPrySwjWuZdLBXhiB0WolUHoQWs79ybWR/DXlb6o9rMdvTMXyueWhFwN9vHaDUcgrltvlA==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(346002)(396003)(366004)(39840400004)(451199015)(31686004)(38100700002)(6512007)(26005)(122000001)(6506007)(8676002)(76116006)(91956017)(4326008)(2906002)(2616005)(44832011)(41300700001)(38070700005)(53546011)(86362001)(31696002)(186003)(71200400001)(36756003)(5660300002)(8936002)(478600001)(110136005)(316002)(54906003)(66556008)(66476007)(66946007)(64756008)(66446008)(83380400001)(66574015)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?Q1RGM0lnNmxTRDdUN09ZTjJCS01pYmJhME1LRlBRZWY5bWhqeW5JZlJwdnd3?=
 =?utf-8?B?dkVFb3d3bzBTNS9ldzNod0JnNGdoQXhTM1FGT2dPeTRibXpjN1ZCZDNQMlI5?=
 =?utf-8?B?d0I5MFJhak1LWGNXOWl2S3VrT29ZYndHQ2ZSWitWeitPN2RCVjBzVUg5TXpP?=
 =?utf-8?B?M3FpK1VUZmNqaUdMeEZ6cCs0RmVvTk5TN2s1MkZOeXpjRXg4OXB1UFdreXlr?=
 =?utf-8?B?Y2Fod0NaOW1aaHRSblNtNnlURk0vMXAwd04xcXpXMy8rUkRaeXBMQ2Nra1Z2?=
 =?utf-8?B?V25FV2tyRTE3N2ljWVRDYmxkVllPajV5TGNIOWJqUkxoUXdYSHhMS3RRSmVS?=
 =?utf-8?B?UDltT213KzI2QXJEVFJna3o2VHltdkJ0aHp1TEhkd1JxZ0lhcnpoZGUvQWZH?=
 =?utf-8?B?SUgrVW5CUnhhWENjMFYyazh1UlRWdVowNmdibnhkdEs0aTdWdmRPVU5hb215?=
 =?utf-8?B?OGlyVUJabEhlSzlJVkQ4SEw4Z3BvcmFXQVlSR0tqSDlJdFYrRmpCamNrY0dG?=
 =?utf-8?B?NS9vWW54Rmsra3h2NFlPSVlVRXkzT3luazlQL1B0alNCdzdkcFM3cEVRTzF6?=
 =?utf-8?B?bGNQOXdKdDA5L3NtTGZVTFNXQmlueFp4aWpHNVF2dG85VGl3ZkRwMWNid1Ix?=
 =?utf-8?B?VjFIMTV3L1F4Rjg2UWw3dUdDdVVSZWNadWFuOVN0OFVQaWpYclo1UVVBZXln?=
 =?utf-8?B?WEdXbzFCYXVNU21WcklNUjRrMG9Zdkc1eDVrN0pWM3lHSDhHa2kxVjNCRWpi?=
 =?utf-8?B?a1lnZ0lpeGlTK2dXNjRaNE8veE5iVG1ZQkNQV0xuOTZuOTVBNVFWZHVtbWVX?=
 =?utf-8?B?L2pqVm1qRTk5VWgwb3RTMzdoNWRDaU83NjExVkxTQ09haXFFU2xrSnVSekwx?=
 =?utf-8?B?U0JqUjFWRHFINjNpS0hZclo2ZkR5bitYVEIzUk1XeWRrdHova3VVa2wvZVZV?=
 =?utf-8?B?TUdtZ1I5MGxpZHIvRVB6U2J2RnpyVFVReWsvd3R4MGVyenBHSkhYR3cvQ3R2?=
 =?utf-8?B?cHNEckJLNld3OVJleWUyZ1dZdW03YUx0Y2RpOHRmcThVMW43eEpmVHJMTUhC?=
 =?utf-8?B?THN2cWR1ZmNtNjd6bU1USlpCZjFWVFJnMitKU3pYa2tGaUtXSlBnQzJOdWJC?=
 =?utf-8?B?emQzN2ZhQUlQRHNSWUtHbUNRSThnejZ0Ni83dXE1REZjWkRDNkZ0MnZOMkIr?=
 =?utf-8?B?c1RsUGRZVW1lakc4KzV5RHc0YjY2UGJwWXdrOVRNWm5CcGpiY1lmL2E2NGFD?=
 =?utf-8?B?MEE1Tm1xaFNlaTcyV1lQZmtvY2NHMXAxQ3ZIWERFYzVzMzlKSG5qdzhtaFBF?=
 =?utf-8?B?eW5QWUpWd1MyQk9zelVOam9MS1VhSHBQUzBlVXZ5SzBQQXBXckxodW1pZGls?=
 =?utf-8?B?eDllRFlqMFRYTHNZUEM5U3kzMkg5Mzh4SFJrWU54ZGNHRlZvUFNJMk5Id0gv?=
 =?utf-8?B?UTgzd1MrSzlGQXlmWXpmOE12eFhwejRUTGE4S09yVnBialBQUWYyMjVHNGRU?=
 =?utf-8?B?VXZoL1dnMU9HMHdaTENvT2V3bkkya2U1ZGlnOHlxVTFaZVZFWGpsZjRqYlJp?=
 =?utf-8?B?ZWlVSVMxS0hONUFjVGF4M05DOVJaNHg4QXhZUEZQRFBLUWtQQzV0OFpLTDVT?=
 =?utf-8?B?MUhxQ0pYZ0RlSFFRcTRiWml1RzRlQldZMFFwTFRSNkFyYkxuTW9SaTVSci9z?=
 =?utf-8?B?OWdPVkxYSGpWVEkxeGJoUkpVRGQvWUVkSElxVmNGQ01uTmNpOFAwU0p3VHpr?=
 =?utf-8?B?M1drWmFicFN6amdldEpYR1RDdVdYZTZNNy9WWGQ0K0w0cExQdTBZc0Fib04y?=
 =?utf-8?B?M0JjOVhzVnZQTkRoVThOVFhEaWJwL000V0NTWWhJNlpIdmEwUVorUWRnME1m?=
 =?utf-8?B?WkxjY0ZyT0FFb2QrZ2pkMlBxdDRoRUNhTzJFUGJ6V1orV3RUYUh3NFo4Tkpt?=
 =?utf-8?B?SmZXSWVKREFNU0lYNE4ra0Z2NnVDbWpWdkhUcm0zNURtS25FTFEwWE1RY0VQ?=
 =?utf-8?B?Yis1SlJMdlNxelhUZTVxZ01yMGJvcGV0Q3FLL3VzUWYwa3BMQ0l6OUlwQjJC?=
 =?utf-8?B?OE5qTjAzMW15UjZteEJFTnVKd25rWERENEVhOUlUQW5WTUxWRk1GdWVmN3dG?=
 =?utf-8?B?WkpIWkptcDlDRXpYd3NEeHB5RW1mNmk2YmhpOEtBVDhXeCtLSjY0ZzJZeGtW?=
 =?utf-8?B?UGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C7785446F886EE489888CC00B6A5D866@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e80e48ff-0aea-45d4-d702-08da994ecee6
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2022 08:21:38.3455
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bRLuJ3NuZj//QNeGbx3q7yt8y2ylpB79h0c43AhhOj25DMRJf+U0/t/3Ll2dDN45TObb0rX6h/jLM0IOEwZFflta75txXKdhGvc8+8DzSZ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2921
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "Eric W. Biederman" <ebiederm@xmission.com>, Kees Cook <keescook@chromium.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE3LzA5LzIwMjIgw6AgMjA6MzgsIFNhbXVlbCBIb2xsYW5kIGEgw6ljcml0wqA6DQo+
IE9uIDkvMTcvMjIgMDM6MTYsIENocmlzdG9waGUgTGVyb3kgd3JvdGU6DQo+PiBMZSAxNi8wOS8y
MDIyIMOgIDA3OjA1LCBTYW11ZWwgSG9sbGFuZCBhIMOpY3JpdMKgOg0KPj4+IFdpdGggQ09ORklH
X1BSRUVNUFQ9eSAoaW52b2x1bnRhcnkgcHJlZW1wdGlvbiBlbmFibGVkKSwgaXQgaXMgcG9zc2li
bGUNCj4+PiB0byBzd2l0Y2ggYXdheSBmcm9tIGEgdGFzayBpbnNpZGUgY29weV97ZnJvbSx0b31f
dXNlci4gVGhpcyBsZWZ0IHRoZSBDUFUNCj4+PiB3aXRoIHVzZXJzcGFjZSBhY2Nlc3MgZW5hYmxl
ZCB1bnRpbCBhZnRlciB0aGUgbmV4dCBJUlEgb3IgcHJpdmlsZWdlDQo+Pj4gbGV2ZWwgc3dpdGNo
LCB3aGVuIEFNUi9JQU1SIGdvdCByZXNldCB0byBBTVJfS1VbQUVdUF9CTE9DS0VELiBUaGVuLCB3
aGVuDQo+Pj4gc3dpdGNoaW5nIGJhY2sgdG8gdGhlIG9yaWdpbmFsIHRhc2ssIHRoZSB1c2Vyc3Bh
Y2UgYWNjZXNzIHdvdWxkIGZhdWx0Og0KPj4NCj4+IFRoaXMgaXMgbm90IHN1cHBvc2VkIHRvIGhh
cHBlbi4gWW91IG5ldmVyIHN3aXRjaCBhd2F5IGZyb20gYSB0YXNrDQo+PiBtYWdpY2FsbHkuIFRh
c2sgc3dpdGNoIHdpbGwgYWx3YXlzIGhhcHBlbiBpbiBhbiBpbnRlcnJ1cHQsIHRoYXQgbWVhbnMN
Cj4+IGNvcHlfe2Zyb20sdG99X3VzZXIoKSBnZXQgaW50ZXJydXB0ZWQuDQo+IA0KPiBUaGF0IG1h
a2VzIHNlbnNlLCB0aGUgaW50ZXJydXB0IGhhbmRsZXIgaXMgcmVzcG9uc2libGUgZm9yIHNhdmlu
ZyB0aGUNCj4gS1VBUCBzdGF0dXMuIEl0IGxvb2tzIGxpa2UgbmVpdGhlciBERUZJTkVfSU5URVJS
VVBUX0hBTkRMRVJfUkFXIG5vciBhbnkNCj4gb2YgaXRzIHVzZXJzIChwZXJmb3JtYW5jZV9tb25p
dG9yX2V4Y2VwdGlvbigpLCBkb19zbGJfZmF1bHQoKSkgZG8gdGhhdC4NCg0KQXMgZmFyIGFzIEkg
Y2FuIHNlZSwgdGhhdCdzIGRvbmUgZWFybGllciwgaW4gZXhjZXB0aW9ucy02NHMuUy4NCkxvb2sg
Zm9yIGt1YXBfc2F2ZV9hbXJfYW5kX2xvY2suDQoNCk5vdywgaXQgbWF5IGJlIHBvc3NpYmxlIHRo
YXQgb25lIG9mIHRoZSBleGNlcHRpb25zIHBhdGhlcyBtaXNzZXMgaXQuDQoNCj4gWWV0IHRoZXkg
c3RpbGwgY2FsbCBvbmUgb2YgdGhlIGludGVycnVwdF9yZXR1cm4gdmFyaWFudHMsIHdoaWNoIHJl
c3RvcmVzDQo+IHRoZSBzdGF0dXMgZnJvbSB0aGUgc3RhY2suDQo+IA0KPj4gV2hlbmV2ZXIgYW4g
aW50ZXJydXB0IGlzIHRha2VuLCBrdWFwX3NhdmVfYW1yX2FuZF9sb2NrKCkgbWFjcm8gaXMgdXNl
ZA0KPj4gdG8gc2F2ZSBLVUFQIHN0YXR1cyBpbnRvIHRoZSBzdGFjayB0aGVuIGxvY2sgS1VBUCBh
Y2Nlc3MuIEF0IGludGVycnVwdA0KPj4gZXhpdCwga3VhcF9rZXJuZWxfcmVzdG9yZSgpIG1hY3Jv
IG9yIGZ1bmN0aW9uIGlzIHVzZWQgdG8gcmVzdG9yZSBLVUFQDQo+PiBhY2Nlc3MgZnJvbSB0aGUg
c3RhY2suIEF0IHRoZSB0aW1lIHRoZSB0YXNrIHN3aXRjaCBoYXBwZW5zLCBLVUFQIGFjY2Vzcw0K
Pj4gaXMgZXhwZWN0ZWQgdG8gYmUgbG9ja2VkLiBEdXJpbmcgdGFzayBzd2l0Y2gsIHRoZSBzdGFj
ayBpcyBzd2l0Y2hlZCBzbw0KPj4gdGhlIEtVQVAgc3RhdHVzIGlzIHRha2VuIGJhY2sgZnJvbSB0
aGUgbmV3IHRhc2sncyBzdGFjay4NCj4gDQo+IFdoYXQgaWYgYW5vdGhlciB0YXNrIGNhbGxzIHNj
aGVkdWxlKCkgZnJvbSBrZXJuZWwgcHJvY2VzcyBjb250ZXh0LCBhbmQNCj4gdGhlIHNjaGVkdWxl
ciBzd2l0Y2hlcyB0byBhIHRhc2sgdGhhdCBoYWQgYmVlbiBwcmVlbXB0ZWQgaW5zaWRlDQo+IGNv
cHlfe2Zyb20sdG99X3VzZXIoKT8gVGhlbiB0aGVyZSBpcyBubyBpbnRlcnJ1cHQgaW52b2x2ZWQs
IGFuZCBJIGRvbid0DQo+IHNlZSB3aGVyZSBrdWFwX2tlcm5lbF9yZXN0b3JlKCkgd291bGQgZ2V0
IGNhbGxlZC4NCg0KWWVzIHRoZXJlIGlzIGludGVycnVwdCBpbnZvbHZlZC4gVGhhdCB0YXNrLCBp
ZiBpdCBoYXMgYmVlbiBwcmVlbXB0ZWQgDQppbnNpZGUgY29weV9mcm9tX3VzZXIoKSwgaXQgbXVz
dCBoYXZlIGJlZW4gdGhyb3VnaCBhbiBpbnRlcnJ1cHQsIGxpa2VseSANCmEgdGltZXIgaW50ZXJy
dXB0LiBTbyBzd2l0Y2hpbmcgYmFjayB0byB0aGF0IHRhc2sgbWVhbnMgZG9pbmcgYW4gDQppbnRl
cnJ1cHQgcmV0dXJuIGluIHRoZSBjb250ZXh0IG9mIHRoYXQgdGFzay4gVGhhdCdzIHdoZW4gS1VB
UCBzdGF0dXMgDQpzaG91bGQgYmUgcmVzdG9yZWQuDQoNCj4gDQo+PiBZb3VyIGZpeCBzdWdnZXN0
cyB0aGF0IHRoZXJlIGlzIHNvbWUgcGF0aCB3aGVyZSB0aGUgS1VBUCBzdGF0dXMgaXMgbm90DQo+
PiBwcm9wZXJseSBzYXZlZCBhbmQvb3IgcmVzdG9yZWQuIERpZCB5b3UgdHJ5IHJ1bm5pbmcgd2l0
aA0KPj4gQ09ORklHX1BQQ19LVUFQX0RFQlVHID8gSXQgc2hvdWxkIHdhcm4gd2hlbmV2ZXIgYSBL
VUFQIGFjY2VzcyBpcyBsZWZ0DQo+PiB1bmxvY2tlZC4NCj4+DQo+Pj4NCj4+PiAgICAgS2VybmVs
IGF0dGVtcHRlZCB0byB3cml0ZSB1c2VyIHBhZ2UgKDNmZmY3YWI2ODE5MCkgLSBleHBsb2l0IGF0
dGVtcHQ/ICh1aWQ6IDY1NTM2KQ0KPj4+ICAgICAtLS0tLS0tLS0tLS1bIGN1dCBoZXJlIF0tLS0t
LS0tLS0tLS0NCj4+PiAgICAgQnVnOiBXcml0ZSBmYXVsdCBibG9ja2VkIGJ5IEtVQVAhDQo+Pj4g
ICAgIFdBUk5JTkc6IENQVTogNTYgUElEOiA0OTM5IGF0IGFyY2gvcG93ZXJwYy9tbS9mYXVsdC5j
OjIyOCBfX19kb19wYWdlX2ZhdWx0KzB4N2I0LzB4YWEwDQo+Pj4gICAgIENQVTogNTYgUElEOiA0
OTM5IENvbW06IGdpdCBUYWludGVkOiBHICAgICAgICBXICAgICAgICAgNS4xOS44LTAwMDA1LWdi
YTQyNDc0NzI2MGQgIzENCj4+PiAgICAgTklQOiAgYzAwMDAwMDAwMDA1NTVlNCBMUjogYzAwMDAw
MDAwMDA1NTVlMCBDVFI6IGMwMDAwMDAwMDA3OWQ5ZDANCj4+PiAgICAgUkVHUzogYzAwMDAwMDA4
ZjUwNzM3MCBUUkFQOiAwNzAwICAgVGFpbnRlZDogRyAgICAgICAgVyAgICAgICAgICAoNS4xOS44
LTAwMDA1LWdiYTQyNDc0NzI2MGQpDQo+Pj4gICAgIE1TUjogIDkwMDAwMDAwMDAwMjEwMzMgPFNG
LEhWLE1FLElSLERSLFJJLExFPiAgQ1I6IDI4MDQyMjIyICBYRVI6IDIwMDQwMDAwDQo+Pj4gICAg
IENGQVI6IGMwMDAwMDAwMDAxMjM3ODAgSVJRTUFTSzogMw0KPj4+ICAgICBOSVAgW2MwMDAwMDAw
MDAwNTU1ZTRdIF9fX2RvX3BhZ2VfZmF1bHQrMHg3YjQvMHhhYTANCj4+PiAgICAgTFIgW2MwMDAw
MDAwMDAwNTU1ZTBdIF9fX2RvX3BhZ2VfZmF1bHQrMHg3YjAvMHhhYTANCj4+PiAgICAgQ2FsbCBU
cmFjZToNCj4+PiAgICAgW2MwMDAwMDAwOGY1MDc2MTBdIFtjMDAwMDAwMDAwMDU1NWUwXSBfX19k
b19wYWdlX2ZhdWx0KzB4N2IwLzB4YWEwICh1bnJlbGlhYmxlKQ0KPj4+ICAgICBbYzAwMDAwMDA4
ZjUwNzZjMF0gW2MwMDAwMDAwMDAwNTU5MzhdIGRvX3BhZ2VfZmF1bHQrMHg2OC8weDEzMA0KPj4+
ICAgICBbYzAwMDAwMDA4ZjUwNzZmMF0gW2MwMDAwMDAwMDAwMDg5MTRdIGRhdGFfYWNjZXNzX2Nv
bW1vbl92aXJ0KzB4MTk0LzB4MWYwDQo+Pj4gICAgIC0tLSBpbnRlcnJ1cHQ6IDMwMCBhdCBfX2Nv
cHlfdG9mcm9tX3VzZXJfYmFzZSsweDljLzB4NWE0DQo+Pg0KPj4gLi4uDQo+Pg0KPj4+DQo+Pj4g
Rml4IHRoaXMgYnkgc2F2aW5nIGFuZCByZXN0b3JpbmcgdGhlIGtlcm5lbC1zaWRlIEFNUi9JQU1S
IHZhbHVlcyB3aGVuDQo+Pj4gc3dpdGNoaW5nIHRhc2tzLg0KPj4NCj4+IEFzIGV4cGxhaW5lZCBh
Ym92ZSwgS1VBUCBhY2Nlc3Mgc2hvdWxkIGJlIGxvY2tlZCBhdCB0aGF0IHRpbWUsIHNvIHNhdmlu
Zw0KPj4gYW5kIHJlc3RvcmluZyBpdCBzaG91bGQgbm90IGhhdmUgYW55IGVmZmVjdC4gSWYgaXQg
ZG9lcywgaXQgbWVhbnMNCj4+IHNvbWV0aGluZyBnb2VzIHdyb25nIHNvbWV3aGVyZSBlbHNlLg0K
Pj4NCj4+Pg0KPj4+IEZpeGVzOiA4OTAyNzRjMmRjNGMgKCJwb3dlcnBjLzY0czogSW1wbGVtZW50
IEtVQVAgZm9yIFJhZGl4IE1NVSIpDQo+Pj4gU2lnbmVkLW9mZi1ieTogU2FtdWVsIEhvbGxhbmQg
PHNhbXVlbEBzaG9sbGFuZC5vcmc+DQo+Pj4gLS0tDQo+Pj4gSSBoYXZlIG5vIGlkZWEgaWYgdGhp
cyBpcyB0aGUgcmlnaHQgY2hhbmdlIHRvIG1ha2UsIGFuZCBpdCBjb3VsZCBiZQ0KPj4+IG9wdGlt
aXplZCwgYnV0IG15IHN5c3RlbSBoYXMgYmVlbiBzdGFibGUgd2l0aCB0aGlzIHBhdGNoIGZvciA1
IGRheXMgbm93Lg0KPj4+DQo+Pj4gV2l0aG91dCB0aGUgcGF0Y2gsIEkgaGl0IHRoZSBidWcgZXZl
cnkgZmV3IG1pbnV0ZXMgd2hlbiBteSBsb2FkIGF2ZXJhZ2UNCj4+PiBpcyA8MSwgYW5kIEkgaGl0
IGl0IGltbWVkaWF0ZWx5IGlmIEkgdHJ5IHRvIGRvIGEgcGFyYWxsZWwga2VybmVsIGJ1aWxkLg0K
Pj4NCj4+IEdyZWF0LCB0aGVuIGNhbiB5b3UgbWFrZSBhIHRyeSB3aXRoIENPTkZJR19QUENfS1VB
UF9ERUJVRyA/DQo+IA0KPiBZZXMsIEkgd2lsbCB0cnkgdGhpcyBvdXQgaW4gdGhlIG5leHQgZmV3
IGRheXMuDQo+IA0KDQpUaGFua3MNCkNocmlzdG9waGU=
