Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6AC76F2F6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 20:48:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=FUqu/PWK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RGyXv3X5jz3c60
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Aug 2023 04:48:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=FUqu/PWK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::62a; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on2062a.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::62a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RGyWg2X5cz3bX2
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Aug 2023 04:47:26 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SkBshpRoVyBi+vNO3jQhsBV8p5YFFFPDu8/Zf9ps8krCx3uKlDlZqpLzi4pt0dkdeFldi6b/DFJ/gn32MKG0PIpyFGGtI8AfJH//Mm+y02pKMv6eTfeHa4t5wWn650Ls6piAtkLi+bKLYM9dCXkXjZqcm5ZvIYLUguozPoFDJvrswylao+aw0w0fJMDhSb6iW5/OYDFfqDC+yuT9befljY4nQdfnOL4S/rFRNSzqKUydLZWImfNM0aB6LkUXUuIArn+xeMkJX4OMDS2kijSQAZahk0mzR4OKMPebABfWJlbYGhLe0bNjWLD/7sN1E9/II6lIr/zD5LOEPlxFBA4jmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9PLIbe6yGvlWPJKvys0R4LgNf7LxioWWdsKLMMoXogE=;
 b=dXF7RR/fgPt0r7HrmBqogr/opnWCJRqFHezyOXkUw/uGyABWyoyOuA7A/QJj/p8tJY68X6KwoHOSjtZ4/QgNwL/EiD3pzSJYbKLpblNrRLpHSX9bIh4VpK1F7KICmQh8B4JLW5aAhd7yi65IBMkJUlYq+fMbOsRvph92FgCTdE3lMurUHJqWY4gDjsKMwpdqIz25/KwSrDCQ/TmHUUY496D/dXS/6Pyp3Zpd33hXYLUmTWzKarBcn2mBOg4kQhp7No9MGNQmt2WdX89gLb68+eXktOA/tYlQBOZdBkVzoxD7y5l8JA3J4t4ufZopSeQJXIyq9oLpCTLwD90KAMoTFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9PLIbe6yGvlWPJKvys0R4LgNf7LxioWWdsKLMMoXogE=;
 b=FUqu/PWKU+7Mw+sVodMZ5/fmPd4sxQ4tp85bdYg2BGi6flKXfoxdceqnPS4MmR+W5d1zaOwtxGbckkhqJseyJ3ZCJPeLiTEoIJYzF1DlFotWDJGYxgSUZO6lp+57/kw3OqtnwtdoRqnB0JfpRj/sbUzcWa5h0dNv1PuD9rHTNR3h6wAi2ipBXffjx4IhnNKd7DbIP3oOYzKKXhMChuMk7TLDRKFpvKrA/sh9OIquEZtS4G9uHCMNE0xPCXK1CLKoy6Sw2WV7l0OxsOQ11wEHvQQvMuE0V7FyTqTGvYGD+VMT2cTQUCBNhoJ6uFmBOG6zgbrM7yQs9cep6Zp8ygOPfg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB1986.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:12::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.20; Thu, 3 Aug
 2023 18:47:04 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::27ce:b19:7bdb:aab3]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::27ce:b19:7bdb:aab3%7]) with mapi id 15.20.6631.046; Thu, 3 Aug 2023
 18:47:04 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Nick Desaulniers <ndesaulniers@google.com>, Michael Ellerman
	<mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Nathan Chancellor
	<nathan@kernel.org>, Tom Rix <trix@redhat.com>
Subject: Re: [PATCH v3] powerpc/inst: add PPC_TLBILX_LPID
Thread-Topic: [PATCH v3] powerpc/inst: add PPC_TLBILX_LPID
Thread-Index: AQHZxjkQdXxgB30ZPEm0RVYcyVZAVK/Y6VgA
Date: Thu, 3 Aug 2023 18:47:04 +0000
Message-ID: <31b387c5-c6a4-2911-b337-b7af6a15c29e@csgroup.eu>
References: <20230803-ppc_tlbilxlpid-v3-1-ca84739bfd73@google.com>
In-Reply-To: <20230803-ppc_tlbilxlpid-v3-1-ca84739bfd73@google.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB1986:EE_
x-ms-office365-filtering-correlation-id: b6fcb0b8-5297-45bf-ccdc-08db9452081d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  ipW3UP+DGRbCDsKbyLFvV7NPf/fA5Ve1+8CiD5tOfBuCTHnxEiHW3HaYxibZy7J1NyXTc/LE7EL0wunuH71UHWAKUHotd4q6kzLTYRUdx5g52RSIZ9b9pxGxtLGj9d0u4KQfBF1gBULGtrnw1rryhezPL0xkym1snqpNU48QqoX/eJ8RAatPz0PnRriUc9H4JY+OYF6bkmv/QcvVOd3i5d4p/9SEd5sdiDrw6YEEdDiGCubzMQUe0JX6/Q7N20s/bUeA4gvbrHGEYyS580CPmdMmWd/VjR6L42K/txvVPjWK1QvfgvVX8N0VsgNVy0OT1hg1TttH20KW/hCp+DEvFIXie6dtfcmnwyJZMe1SSUvWHondayfQRu1ZsSREWKwLAo7RaQ6o1ywKsEKpAKTsSPle3VfSHLitaRohLCYZH1q91v05LHhMtz3HShCPSCdBHlpWCyUXhfOmbEGo/zQFaegXSFouHseH1tZL40z8AyoEnKRlW3+Q53RWgVzePXXGB1nyVFU6YAbVBZMssKtuI4+3efuqOOsNYM8BBKBkSI/h8gHw19+4UZoHIcgvHbwDV6Cf8NcaqPGKZsiktybl9ZNVr0k+K2jR/mdOW35wi5r090MuX/y4Ji8eCkv0flR7uEd8x5E82pEl8FgRqJK3PkATb/3kPGe4Yarg0lCJvckqS5Df1eO3/RWbT77ScpGRywXvLtkVewDufA66CaOx2A==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(136003)(39850400004)(396003)(346002)(451199021)(2616005)(66574015)(6506007)(186003)(83380400001)(26005)(8676002)(66476007)(316002)(66556008)(2906002)(91956017)(4326008)(66946007)(5660300002)(64756008)(76116006)(66446008)(7416002)(44832011)(8936002)(41300700001)(6486002)(71200400001)(966005)(6512007)(54906003)(110136005)(478600001)(38100700002)(122000001)(31696002)(36756003)(86362001)(38070700005)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?WnVXV0IvM1hmR2lTdVY0UVpUZTZKSi9vWWg4UWEzWFRVMVpOUnJhWFBhdFlU?=
 =?utf-8?B?cnBvRCtxbEk3TDFPZzBFN0NUNUVUaHZtV3lTL29sd2dreUl5Y0RGdG9HdjQv?=
 =?utf-8?B?TE12dmpZQkE4RjFsL1U5RDNaZFdTZFNYbm9vUGM4cWErb0Qwa2VBOEIvbmk4?=
 =?utf-8?B?OVNraENJaklrdVlQckdqNXZReDQza1NvbG1kZE9LQ21WeWZBNndCY2hyMGxU?=
 =?utf-8?B?ZDFTTTNPVWo4RjNFUVVtSjd0VHp2ZzFZZzhLaVJGdGdWc2RzS0tqSXdJUFZi?=
 =?utf-8?B?MkV4aHFUZnZ2TDlIUE4rOFR1Rmg2KzFvSWFZaEZmVnRjOG85c0dNVFpJZjZH?=
 =?utf-8?B?SUgwVkVCOWNZSk92MFpGRHNaT3FQWE9YaUpWUThmeFdCWHBUQ1VzRlp3S25W?=
 =?utf-8?B?S0pWUmg2aUhGenVQOUF4NTdnakhDczlwZUZmVTcwVDU3M3FTOU1JclZPelZL?=
 =?utf-8?B?OU9BV1ZlMTlGSkl2ZTREa0FyTDZ3aTR1U25sYVpPN21Bczh6Zmh6eElyeVdw?=
 =?utf-8?B?UzZJblhBelFhZVQ1TStwYW52eUpJLytPazRrTUdaTGpoYnNtSlZ6YjM0ZWMz?=
 =?utf-8?B?b1hSamNKU2xaOGZsNDhBUGtQVmszb0FYbEVobiszelI5ZXhQOHFERGpmdWZU?=
 =?utf-8?B?a3MyZmh0QXhDR1lLbXh6WWZmNWgwWkpaVGR5Um5MZHRlUTZ6V05lZmVTckxB?=
 =?utf-8?B?M3A2MTArSXZZNWttb011V2p1NmZQY29ac3NONnpNVTlQNlF2b0ZCQ3Y3Rm0v?=
 =?utf-8?B?Q2xZaXQ5NDBIU2IvdW1CZ0FLMzlTTUlyeEpuM0tKZkxYVHRzWEJlcXJ2T2ZO?=
 =?utf-8?B?cFFaOGNmU011UTVNa0ovbjMrWkgyWkM5YVU1cC9OU0ZlblVvV2djdVVLWkFW?=
 =?utf-8?B?bFpJQkhndE1waERHNS9FZUJVSm5VSTBDOUZnZzZkSEtHalhyT01POUptVkNs?=
 =?utf-8?B?NmtFUDBTS2NNU1VJZkV4Mzd5M0FlcjJFSERSK3ZZSFBVNGV1dlV2ZEtEUE1C?=
 =?utf-8?B?M0hrOXJTZ1IwU2xvaFJVWGhsMTZLdVM3ODBOUTVWaEY5bUVzZmozdUZmVDdK?=
 =?utf-8?B?NHhpSHVFZXN6UjZpOHZPSkZ5TU1xZ2RDYlFaMFluVlA3OUpDWW1HN1ZGZUZP?=
 =?utf-8?B?bUhHRWFSYXRwZnNHWHo1dmRSM3lCcllYWkhHSTVzKzdnT0hUMDRLTUZ3UFF6?=
 =?utf-8?B?NVJXbTl0UTc2V2pyRExGN2NncnhTSDAwUmJTWHRYWCtBaThCSzFjS3ZNNVNW?=
 =?utf-8?B?M2lkV2NneFhCNXJqTEwyZGVhZ25SSEdvdlZacEwyN0o0eU5qNmlCcTA1SWJW?=
 =?utf-8?B?Wkh6dkFvNEJuWDZ5UEFxZUw1cFJOa3dCL25zTGIydDhoamJJWExveGlRLzVV?=
 =?utf-8?B?Q0RNSDliVzBheFRIUWkvekRVemZUWWJ1TDQ1eWJucmZBOVU4b0ZOZ1IrS3kx?=
 =?utf-8?B?WEV5ZUJsMENhM1g5U2JFVnlkenhkdVpHMGRpOEhwMGdXbmRiZFhjMUNzcFZJ?=
 =?utf-8?B?eXZaZ01vNTNlQUV6Y3ptUXBIUjFDZ0dFRFAra0g4eldKcC9pakZFTDI0b1py?=
 =?utf-8?B?bVdNemN0TDY5Z25JdmhyUXJiNEFtUU1PTU9xV3Z0TVQrZTFDRm1oMTFvb1JV?=
 =?utf-8?B?SFRaSDd5OVMxSGg0ZGc0WWluczFsRWtaMXJxK0NtWGpFYmZ4Unk0Nlc0TTdw?=
 =?utf-8?B?czhlOXU1TVpXWk5nZjkzcVFiQTY1QlhoUEVqZ0NaNk1vUjY3VVJHNFc2VTRP?=
 =?utf-8?B?TnRGWjVYTFZlRUQ5T0FlVUVXRG9TOU03ODNtYWpQaXMwY3g4N3R6dWpuMlVU?=
 =?utf-8?B?SXZaTTdVY3JtWVh3M09rTUVsM3dsM3J5ekRaMndYVUlKeWFrWHd0eHhIQzJz?=
 =?utf-8?B?QWNUZGFYcllSbXRBZ3p1cXJjTUFDWkN6SzArRWNqbW5jSk1zdlRnQlIyeXZ0?=
 =?utf-8?B?TC90bU42eFpNZXp2RzFDazNEYWw5MW5NaFBRZzNOUFA4OHZQajJuTGFMTnRm?=
 =?utf-8?B?UGpUNEJNYUVzSzk1K2JucFc4ckw2Z2cwR1hKeGpxay83R0VjM1pPbUpETFVq?=
 =?utf-8?B?WVVFeXFyQzBzVXdNOXk4cUVFMU16dTVwV1NzK3JVSmFjM0JKNkVFSU52WElh?=
 =?utf-8?Q?i3m5lDyT1hdReVj56ZmeNJxEl?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C845873CE08D394ABEC335EE96643AFE@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b6fcb0b8-5297-45bf-ccdc-08db9452081d
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2023 18:47:04.7080
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zsLXzFMJU9Dah0DRacnS0AeC0nChFPQk+J3Loa8XWsOXW+Qib1cqk/2B1WaukpJTbrXzU9fBWx7Hv3iFzhx88a7sX8i2PyDyc1xY7nek+Eg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1986
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
Cc: "llvm@lists.linux.dev" <llvm@lists.linux.dev>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, kernel test robot <lkp@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDAzLzA4LzIwMjMgw6AgMjA6MzMsIE5pY2sgRGVzYXVsbmllcnMgYSDDqWNyaXTCoDoN
Cj4gQ2xhbmcgZGlkbid0IHJlY29nbml6ZSB0aGUgaW5zdHJ1Y3Rpb24gdGxiaWx4bHBpZC4gVGhp
cyB3YXMgZml4ZWQgaW4NCj4gY2xhbmctMTggWzBdIHRoZW4gYmFja3BvcnRlZCB0byBjbGFuZy0x
NyBbMV0uICBUbyBzdXBwb3J0IGNsYW5nLTE2IGFuZA0KPiBvbGRlciwgcmF0aGVyIHRoYW4gdXNp
bmcgdGhhdCBpbnN0cnVjdGlvbiBiYXJlIGluIGlubGluZSBhc20sIGFkZCBpdCB0bw0KPiBwcGMt
b3Bjb2RlLmggYW5kIHVzZSB0aGF0IG1hY3JvIGFzIGlzIGRvbmUgZWxzZXdoZXJlIGZvciBvdGhl
cg0KPiBpbnN0cnVjdGlvbnMuDQo+IA0KPiBMaW5rOiBodHRwczovL2dpdGh1Yi5jb20vQ2xhbmdC
dWlsdExpbnV4L2xpbnV4L2lzc3Vlcy8xODkxDQo+IExpbms6IGh0dHBzOi8vZ2l0aHViLmNvbS9s
bHZtL2xsdm0tcHJvamVjdC9pc3N1ZXMvNjQwODANCj4gTGluazogaHR0cHM6Ly9naXRodWIuY29t
L2xsdm0vbGx2bS1wcm9qZWN0L2NvbW1pdC81MzY0OGFjMWQwYzk1M2FlNmQwMDg4NjRkZDJlZGRi
NDM3YTkyNDY4IFswXQ0KPiBMaW5rOiBodHRwczovL2dpdGh1Yi5jb20vbGx2bS9sbHZtLXByb2pl
Y3QtcmVsZWFzZS1wcnMvY29tbWl0LzBhZjdlNWU1NGE4YzdhYzY2NTc3M2FjMWFkYTMyODcxM2U4
MzM4ZjUgWzFdDQo+IFJlcG9ydGVkLWJ5OiBrZXJuZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNv
bT4NCj4gQ2xvc2VzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sbHZtLzIwMjMwNzIxMTk0NS5U
U1BjeU9oaC1sa3BAaW50ZWwuY29tLw0KPiBTdWdnZXN0ZWQtYnk6IE1pY2hhZWwgRWxsZXJtYW4g
PG1wZUBlbGxlcm1hbi5pZC5hdT4NCj4gU2lnbmVkLW9mZi1ieTogTmljayBEZXNhdWxuaWVycyA8
bmRlc2F1bG5pZXJzQGdvb2dsZS5jb20+DQoNCk5vdCBzdXJlIHdoeSB5b3UgY2hhbmdlZCB0aGUg
b3JkZXIgb2YgI2luY2x1ZGVzICwgbmV2ZXJ0aGVsZXNzDQoNClJldmlld2VkLWJ5OiBDaHJpc3Rv
cGhlIExlcm95IDxjaHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+DQoNCj4gLS0tDQo+IENoYW5n
ZXMgaW4gdjM6DQo+IC0gbGVmdCBjb21tZW50IEAgaHR0cHM6Ly9naXRodWIuY29tL2xpbnV4cHBj
L2lzc3Vlcy9pc3N1ZXMvMzUwI2lzc3VlY29tbWVudC0xNjY0NDE3MjEyDQo+IC0gcmVzdG9yZSBQ
UENfUkFXX1RMQklMWCBwcmV2aW91cyBkZWZpbml0aW9uDQo+IC0gZml4IGNvbW1lbnQgc3R5bGUN
Cj4gLSBMaW5rIHRvIHYyOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjMwODAzLXBwY190
bGJpbHhscGlkLXYyLTEtMjExZmZhMWRmMTk0QGdvb2dsZS5jb20NCj4gDQo+IENoYW5nZXMgaW4g
djI6DQo+IC0gYWRkIDIgbWlzc2luZyB0YWJzIHRvIFBQQ19SQVdfVExCSUxYX0xQSUQNCj4gLSBM
aW5rIHRvIHYxOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjMwODAzLXBwY190bGJpbHhs
cGlkLXYxLTEtODRhMWJjNWNmOTYzQGdvb2dsZS5jb20NCj4gLS0tDQo+ICAgYXJjaC9wb3dlcnBj
L2luY2x1ZGUvYXNtL3BwYy1vcGNvZGUuaCB8ICAyICsrDQo+ICAgYXJjaC9wb3dlcnBjL2t2bS9l
NTAwbWMuYyAgICAgICAgICAgICB8IDExICsrKysrKysrLS0tDQo+ICAgMiBmaWxlcyBjaGFuZ2Vk
LCAxMCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2Fy
Y2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9wcGMtb3Bjb2RlLmggYi9hcmNoL3Bvd2VycGMvaW5jbHVk
ZS9hc20vcHBjLW9wY29kZS5oDQo+IGluZGV4IGVmNjk3MmFhMzNiOS4uMDA1NjAxMjQzZGRhIDEw
MDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vcHBjLW9wY29kZS5oDQo+ICsr
KyBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9wcGMtb3Bjb2RlLmgNCj4gQEAgLTM5Nyw2ICsz
OTcsNyBAQA0KPiAgICNkZWZpbmUgUFBDX1JBV19SRkNJCQkJKDB4NGMwMDAwNjYpDQo+ICAgI2Rl
ZmluZSBQUENfUkFXX1JGREkJCQkoMHg0YzAwMDA0ZSkNCj4gICAjZGVmaW5lIFBQQ19SQVdfUkZN
Q0kJCQkoMHg0YzAwMDA0YykNCj4gKyNkZWZpbmUgUFBDX1JBV19UTEJJTFhfTFBJRAkJKDB4N2Mw
MDAwMjQpDQo+ICAgI2RlZmluZSBQUENfUkFXX1RMQklMWCh0LCBhLCBiKQkJKDB4N2MwMDAwMjQg
fCBfX1BQQ19UX1RMQih0KSB8IAlfX1BQQ19SQTAoYSkgfCBfX1BQQ19SQihiKSkNCj4gICAjZGVm
aW5lIFBQQ19SQVdfV0FJVF92MjAzCQkoMHg3YzAwMDA3YykNCj4gICAjZGVmaW5lIFBQQ19SQVdf
V0FJVCh3LCBwKQkJKDB4N2MwMDAwM2MgfCBfX1BQQ19XQyh3KSB8IF9fUFBDX1BMKHApKQ0KPiBA
QCAtNjE2LDYgKzYxNyw3IEBADQo+ICAgI2RlZmluZSBQUENfVExCSUxYKHQsIGEsIGIpCXN0cmlu
Z2lmeV9pbl9jKC5sb25nIFBQQ19SQVdfVExCSUxYKHQsIGEsIGIpKQ0KPiAgICNkZWZpbmUgUFBD
X1RMQklMWF9BTEwoYSwgYikJUFBDX1RMQklMWCgwLCBhLCBiKQ0KPiAgICNkZWZpbmUgUFBDX1RM
QklMWF9QSUQoYSwgYikJUFBDX1RMQklMWCgxLCBhLCBiKQ0KPiArI2RlZmluZSBQUENfVExCSUxY
X0xQSUQJCXN0cmluZ2lmeV9pbl9jKC5sb25nIFBQQ19SQVdfVExCSUxYX0xQSUQpDQo+ICAgI2Rl
ZmluZSBQUENfVExCSUxYX1ZBKGEsIGIpCVBQQ19UTEJJTFgoMywgYSwgYikNCj4gICAjZGVmaW5l
IFBQQ19XQUlUX3YyMDMJCXN0cmluZ2lmeV9pbl9jKC5sb25nIFBQQ19SQVdfV0FJVF92MjAzKQ0K
PiAgICNkZWZpbmUgUFBDX1dBSVQodywgcCkJCXN0cmluZ2lmeV9pbl9jKC5sb25nIFBQQ19SQVdf
V0FJVCh3LCBwKSkNCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9rdm0vZTUwMG1jLmMgYi9h
cmNoL3Bvd2VycGMva3ZtL2U1MDBtYy5jDQo+IGluZGV4IGQ1OGRmNzFhY2U1OC4uN2MwOWMwMDBj
MzMwIDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMva3ZtL2U1MDBtYy5jDQo+ICsrKyBiL2Fy
Y2gvcG93ZXJwYy9rdm0vZTUwMG1jLmMNCj4gQEAgLTE2LDEwICsxNiwxMSBAQA0KPiAgICNpbmNs
dWRlIDxsaW51eC9taXNjZGV2aWNlLmg+DQo+ICAgI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPg0K
PiAgIA0KPiAtI2luY2x1ZGUgPGFzbS9yZWcuaD4NCj4gICAjaW5jbHVkZSA8YXNtL2NwdXRhYmxl
Lmg+DQo+IC0jaW5jbHVkZSA8YXNtL2t2bV9wcGMuaD4NCj4gICAjaW5jbHVkZSA8YXNtL2RiZWxs
Lmg+DQo+ICsjaW5jbHVkZSA8YXNtL2t2bV9wcGMuaD4NCj4gKyNpbmNsdWRlIDxhc20vcHBjLW9w
Y29kZS5oPg0KPiArI2luY2x1ZGUgPGFzbS9yZWcuaD4NCj4gICANCj4gICAjaW5jbHVkZSAiYm9v
a2UuaCINCj4gICAjaW5jbHVkZSAiZTUwMC5oIg0KPiBAQCAtOTIsNyArOTMsMTEgQEAgdm9pZCBr
dm1wcGNfZTUwMF90bGJpbF9hbGwoc3RydWN0IGt2bXBwY192Y3B1X2U1MDAgKnZjcHVfZTUwMCkN
Cj4gICANCj4gICAJbG9jYWxfaXJxX3NhdmUoZmxhZ3MpOw0KPiAgIAltdHNwcihTUFJOX01BUzUs
IE1BUzVfU0dTIHwgZ2V0X2xwaWQoJnZjcHVfZTUwMC0+dmNwdSkpOw0KPiAtCWFzbSB2b2xhdGls
ZSgidGxiaWx4bHBpZCIpOw0KPiArCS8qDQo+ICsJICogY2xhbmctMTcgYW5kIG9sZGVyIGNvdWxk
IG5vdCBhc3NlbWJsZSB0bGJpbHhscGlkLg0KPiArCSAqIGh0dHBzOi8vZ2l0aHViLmNvbS9DbGFu
Z0J1aWx0TGludXgvbGludXgvaXNzdWVzLzE4OTENCj4gKwkgKi8NCj4gKwlhc20gdm9sYXRpbGUg
KFBQQ19UTEJJTFhfTFBJRCk7DQo+ICAgCW10c3ByKFNQUk5fTUFTNSwgMCk7DQo+ICAgCWxvY2Fs
X2lycV9yZXN0b3JlKGZsYWdzKTsNCj4gICB9DQo+IA0KPiAtLS0NCj4gYmFzZS1jb21taXQ6IDdi
YWZiZDQwMjdhZTg2NTcyZjMwOGM0ZGRmOTMxMjBjOTAxMjYzMzINCj4gY2hhbmdlLWlkOiAyMDIz
MDgwMy1wcGNfdGxiaWx4bHBpZC1jZmRiZjRmZDRmN2YNCj4gDQo+IEJlc3QgcmVnYXJkcywNCg==
