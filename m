Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 21CC162B40E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 08:37:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NBvyC6rl4z3cJX
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 18:37:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=p0ysCO1i;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::613; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=p0ysCO1i;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on0613.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::613])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NBvx771gDz2xjw
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Nov 2022 18:36:09 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JwXoHtwC2DBiN05+iNviykin8KDGTqJzd+DVRz23dfE/m9SfQxQ6jbbhCLNjp2AoBSj2Nnp5g8anmrEQuuA8aYk+OfNkrqe0TDYJKhJNhzovMa834G5ZyYkgn6vdH1iYCzcXQ4NE+WSMURm8Ycp3KpCEtdgsb5Dssxi0VgIaPaFDlbC1iPwUlb9+P0F+DZr8sqaU48LJulR5S+SRigV+4P0vKQq573UqZqg2eOYJ9lsZnnyvPxqaVxJhEtyBR90v2JRio3N8rmrPXfUnOVXtRGJaJvyl0GEn43ZTYNYSyaP5+7dV5+p03MG3r9SBVCAL+wxMjUq3MhrUgHs6W5oaCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5xg8ybkKXCNU+lKbyKu5tsk17rIhRLzKaVnNg7M2ljE=;
 b=lFEO3ggZTpObFB1giD8GsKERyoIBlBd6Vqb3xyNKuAm1mnFFzJJOrOmfqndhFj7vQ5dGWe8p2+Nlmo6jJ5UytRagpGmCXYWXJJKIBsBqmgvjGCYZiYdR2wmFgz8CtKEGU2V1LVqncjNFC2BpX3Q+xTJqzxsgSRuL4jKL0I2eKJJ9RO3PaIPZ71olR4ciE5NnI/nYmYB1etHbVrd1aYW/qTbjg80+4fwc01jI2KOx2jqwwR9hmmGga7Wsy8bg1CU5Zf8YY1Fj1GG60t1u4JXjEmxwGuWs+95HLUemiGRf/h+Vc5HxgvLVt1F9ZKrVT4ZNxCrmCQ6R/RkomoUjNjfkKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5xg8ybkKXCNU+lKbyKu5tsk17rIhRLzKaVnNg7M2ljE=;
 b=p0ysCO1i1KLtgXZNhoPDzxB6Gg+UZ4xAED0tJ41OgfbxKQfmNaDRRHJTl1FELOFkYtetJiqCSEkuIHfd713kE8PpA/1ArdP2EMlFqBcSv+S9VvCuUwqA92HNmFL+p3s1Q4IUDD1RIz4v5ifZfUnaYk/RRXdV3qer99PhMgwBnu/YEr7ZpZQlg37yWyJcw4K33LcmrvW9MOnUPWbjlr1H48kx9ifo81NKyn6b+lq0jE9v06+PwHP9VxoZhhJ0f1zTZRIwl2zYYBTIgTKojBxpIGpXUs3Hp6fAVr29BiwWdJ0hgCXSQdOyghgWSLcUjzpXDOaaEog5wOKoBAXYVhXfzA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB1635.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.18; Wed, 16 Nov
 2022 07:35:49 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6%9]) with mapi id 15.20.5813.018; Wed, 16 Nov 2022
 07:35:49 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Nicholas Piggin <npiggin@gmail.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH] powerpc: Fix writable sections being moved into the
 rodata region
Thread-Topic: [PATCH] powerpc: Fix writable sections being moved into the
 rodata region
Thread-Index: AQHY+XXJq2LiIDwIyEa+rGEOGtXPnq5BKS0A
Date: Wed, 16 Nov 2022 07:35:49 +0000
Message-ID: <01f24da3-afac-1c7b-6ff3-f7d0852be94d@csgroup.eu>
References: <20221116043954.3307852-1-npiggin@gmail.com>
In-Reply-To: <20221116043954.3307852-1-npiggin@gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB1635:EE_
x-ms-office365-filtering-correlation-id: 388cb8aa-674d-4280-9e4a-08dac7a52ebb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  pzTXsvcS0dHq/uv1kLfDSg0aM4GZJ1C4dtS56KFDWtw8czmaRL0fjccxx0EIyUB/GWiD5iYyjS6CTMIenUwrWVfAN4fCRUJjGZwhHDGEOFMu3RXeMCHtygOhYuLC6TCwuNFNRGhr9JrnbEO/VGXT1AvvSs7J9SKdMnU+O5uR44usCvsDmDbIpPEVCikqentM1YySBO66agQhCFvGmt0rJ7GUuhJ47METdpwQAGSijegUZEOyNjulWLYedlUH8uvz7DPPB2eaGwmvHaY/m30x4pYKkLXtPmsbqgMHUvN3QvFwjQ89kPAtUSa9hXgTRtrwd6fpHBY9U2IwJ86ySGIOmP6nCsWJy5iFkd2JNRJtfNUJUw5S+eAUrNlHhWdbHNqH3V/+ASYlpS381gEZgMTTJZHkAQ8DchFBxgPuda9NDvIs2Mr2o5exZVUqWp3bEXQUBhbTn0d3fZJ5cPOS2pR+TQxgCK1xr+0phpJ+4aXDfRBptYW+SNuNeas+qp3p1RQNNK5WIyGRsfYx1SLmc84V/bEtwk0Ihb8J5SPFOm2cFnDmcZ62fcLdDL8MMHtt8ENrwMKHjHX0HrDbxF6nM0OpEj7FVKMUJVoDdBagU2Nla+qyPIX1R9Yh1jXisjYGF0LUjtqIi0S+VK9t8LABjEtb1O2qO+NQvqDw9FiNqgtwp2UGWCkOrf363GlXyjK/Z3gln9/FxVh8AXfajWDAZUz23o9gnS557nyaRIzZdd2cEIF0goOjW8RIqsOHMQx1CKG6TMWkuIOzdrmRp2hO5kKMfvVB/5OTarcBbFDr3rBQPMC/lLBFcyTRI1R5GSHtT3IJaoE6WMBf3D/Rd7gmqJ6plg==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(366004)(136003)(39850400004)(376002)(451199015)(26005)(66446008)(316002)(186003)(5660300002)(36756003)(76116006)(41300700001)(8936002)(8676002)(2906002)(91956017)(6512007)(44832011)(66556008)(66946007)(2616005)(4744005)(64756008)(66574015)(66476007)(31696002)(38100700002)(86362001)(38070700005)(122000001)(83380400001)(478600001)(71200400001)(31686004)(110136005)(6506007)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?a0hmcmlrNUVxdnpRVkNFM1BSdkd5aDdoMFB2azMxK2ZHaDJtNHFRQ2ZPaXMr?=
 =?utf-8?B?TWIwNUgvSG11K1UrcDRJUy9nNWFMK080MThJbGhTaHp5ZjFmSnRYZEg1YVg3?=
 =?utf-8?B?dmtCdW82N2JQOHpWWEYwdHoxb1UwNFc2aFZwRHJFWmpqbHkxTStvRWNLT2FS?=
 =?utf-8?B?VitXbXZkUUU3bmNveXNYYkF3azNlbzBFZ0V3amQyTVlneHgzWWNXNGVCYWtt?=
 =?utf-8?B?QytlOVRnS0pzUTVzbTRRbjYxZ1liM0Z0Z2tDQ3o1aURKZ3pld1FHRktOek02?=
 =?utf-8?B?bWNuTmozNDRQK2VJSmVJcklMYVlEcFRUeFdkb0pmT3FnOVJPanB3eWVHcm5p?=
 =?utf-8?B?UzVVRDZMZzRTU3hSUkNjU3FvQzRweUszaUtXWkUvdUJ1WS82ZmZjbGZ0OE15?=
 =?utf-8?B?aVB5RmFtVjhudFFOWW8ySlNrZGI1UUR1TXpIdmVxU1VSeHJPK1JrNS9RS2Fz?=
 =?utf-8?B?d2paSTI4L0Y3L0dJdUtRQndwS0V0M1BUcm8vcmdkSGRVbVlJSmJBelZYUC9u?=
 =?utf-8?B?TUZSTGVDWGd0U2pkWnlObXFQeUV2eFJWejB4Z2F6cVZKQlpKalBwcnExZnFY?=
 =?utf-8?B?L3Q3eFgvMTltN2ViQ1R1b1VpelRrVXJpUGpIUG5vNy9UUkFzNzZZSFNWdkdk?=
 =?utf-8?B?d1gwa1BpTTB1QmU3dk44OXYrU3h3ajlSbFJIZHBNR292WjB5V1FtbUFQV1JE?=
 =?utf-8?B?a2xyUUpHUFFNcWJQV0ZVb2J4cTFFNVBvaUdESzBqR3NTSmtUdk9VM1U3SmRC?=
 =?utf-8?B?SFNhWXhGYlZFMDFDR29xREFyWEVyOGMrSGtkWjBzMUlURHpXcVFPd3IwN3ZW?=
 =?utf-8?B?aTM0NUdCZWxRcU9uS2trcUVROXU2MWtsU3FWR3VNLzRMalZub1VGS0F0emVm?=
 =?utf-8?B?Q0tKVmpwYXJ0QmtiaHVFSUJ1ZG84a2gvVzIveDhpVFpYRExpZmQyZEJrNE5m?=
 =?utf-8?B?MXdiamNQYW01MnFpMFc3UHc0aEhuUXhqWU1zeHd2eTdWWDNvQlFzTmdzTjVo?=
 =?utf-8?B?WWxETFlKenRhR1hHeFFDbGpVTGJIMGZlRWZvSllIMkIvOVo1RTIzSTBJaWh4?=
 =?utf-8?B?Sm9LMUNmTy85NmFqQnFkb3NFbk5FcFFUSWREY01VRVJRQlplaUNyWkh3bHgr?=
 =?utf-8?B?UlErNms4cmZ2dEFVVEpYT3p5bE9kNFRTLyt6akNZOU1yVkdWd3piUnkyTHJB?=
 =?utf-8?B?UW5Cd1ZHWmJKanhYMzNucjhobU9rRVA3NGwvV1d3bmtyWXpuMFp4Z0tHR2Zn?=
 =?utf-8?B?SUFsN3NxcENsUVhBVXpsZURnMktJb1cvYmEyQjZrTFpERkVoeUZpWk81WExt?=
 =?utf-8?B?RVcyZVV3Rm82aHBGYTNWR3phQTZhVkUrRjJTYWNOSTI5cWYwTUxsKzRkQkls?=
 =?utf-8?B?azRpaFl6ek9VK3JKZHYybXF6QVJJSE9vTzM2eHh4T0l0TzhFcUtUejYrSkZW?=
 =?utf-8?B?Y3QwbnVYenhRN0Q2Q09LMDZkZ0lYMHY1K2N5WlMzUGtkQ0Q1cHdzYlprZVZh?=
 =?utf-8?B?MERzQXR5VE5oV0dlNTY3UWxMa0FZNzBNa2FEOWNrTkVYN0JzcDlLR0JUdGtR?=
 =?utf-8?B?bjdUK01pak14MFhUUGVjMU1HcjZHVFdSN2J2THBGSUxsOEpKTkVwQTlDOVlP?=
 =?utf-8?B?cU1Ccnl0MHJKczRWbWcyVHZ1ekJ1SUNMWHZCVk50TXgybC93SXpXaTJMMWMw?=
 =?utf-8?B?YnNwOHFIM2pObFg0QXJJc2lUcDlQQWVYbVJHaDJEV3ZsZTNSWXpWTnRxc3Fr?=
 =?utf-8?B?TzE5cjEzblA4ZTlCVTJIL3ZNT3Y5OS94WXF0MmpBN1N5RitKQVdBU3g0WC82?=
 =?utf-8?B?N3IzYlE0Vm1vOUFnSTlGd1VaRlFGUmpmcDZLbkYrNmE2eklpdS91OVExaXIy?=
 =?utf-8?B?bzZ3dUVaSnY3MUM3SGJpakRLTlVvblMxM2htdE1ScWFGODczUldaYjFUMlJP?=
 =?utf-8?B?cXBINGJERnBuMFNTajB2V0Z6a1lxdFhITGpCZkV3RnQyS3h3V0d2ZDVzejYr?=
 =?utf-8?B?SGg5OGYwZ0svWnVSQ1ZPaTc5c1B2eXdmdUpEU1h1RmhycHl1dlRTWCtXZkli?=
 =?utf-8?B?VjV3R3VIOThnSE5ZdklpZnNEcXc0RlhLTGxESGd5djhEV04wTTRTQjZ4ejBo?=
 =?utf-8?B?czZDYzFGQmY4eGpuVC82WjRJZzhXT2Q0RE02dWZiNjRxcERSZCtnWGJva1Nh?=
 =?utf-8?B?VFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <74AB55BEBF1EC245BC94E6D0A9546289@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 388cb8aa-674d-4280-9e4a-08dac7a52ebb
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2022 07:35:49.3456
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zVTuK0xvk3BiUPgo0by++GYNy8BnhVSubDQBmAMn1wHDVcAxQ1C2Qk489HJ5ZbXO+KJlUr7NoL8YUfN2n1GwmCiLzTdYpnTBUM5IY2nBcs8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1635
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

DQoNCkxlIDE2LzExLzIwMjIgw6AgMDU6MzksIE5pY2hvbGFzIFBpZ2dpbiBhIMOpY3JpdMKgOg0K
PiAuZGF0YS5yZWwucm8qICBjYXRjaGVzIC5kYXRhLnJlbC5yb290X2NwdWFjY3QsIGFuZCB0aGUg
a2VybmVsIGNyYXNoZXMgb24NCj4gYSBzdG9yZSBpbiBjc3NfY2xlYXJfZGlyLiBBdCBsZWFzdCB3
ZSBrbm93IHJlYWQtb25seSBkYXRhIHByb3RlY3Rpb24gaXMNCj4gd29ya2luZy4uLg0KPiANCj4g
Rml4ZXM6IGI2YWRjNmQ2ZDMyNzIgKCJwb3dlcnBjL2J1aWxkOiBtb3ZlIC5kYXRhLnJlbC5ybywg
LnNkYXRhMiB0byByZWFkLW9ubHkiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBOaWNob2xhcyBQaWdnaW4g
PG5waWdnaW5AZ21haWwuY29tPg0KDQpSZXZpZXdlZC1ieTogQ2hyaXN0b3BoZSBMZXJveSA8Y2hy
aXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1Pg0KDQo+IC0tLQ0KPiAgIGFyY2gvcG93ZXJwYy9rZXJu
ZWwvdm1saW51eC5sZHMuUyB8IDIgKy0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMva2VybmVs
L3ZtbGludXgubGRzLlMgYi9hcmNoL3Bvd2VycGMva2VybmVsL3ZtbGludXgubGRzLlMNCj4gaW5k
ZXggNzc4NmUzYWM3NjExLi44YzM4NjJiNGMyNTkgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJw
Yy9rZXJuZWwvdm1saW51eC5sZHMuUw0KPiArKysgYi9hcmNoL3Bvd2VycGMva2VybmVsL3ZtbGlu
dXgubGRzLlMNCj4gQEAgLTE0Miw3ICsxNDIsNyBAQCBTRUNUSU9OUw0KPiAgICNlbmRpZg0KPiAg
IA0KPiAgIAkuZGF0YS5yZWwucm8gOiBBVChBRERSKC5kYXRhLnJlbC5ybykgLSBMT0FEX09GRlNF
VCkgew0KPiAtCQkqKC5kYXRhLnJlbC5ybyopDQo+ICsJCSooLmRhdGEucmVsLnJvIC5kYXRhLnJl
bC5yby4qKQ0KPiAgIAl9DQo+ICAgDQo+ICAgCS5icmFuY2hfbHQgOiBBVChBRERSKC5icmFuY2hf
bHQpIC0gTE9BRF9PRkZTRVQpIHsNCg==
