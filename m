Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B5C5B58EF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Sep 2022 13:01:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MR3ZV4qDVz3cDb
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Sep 2022 21:01:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=eE2S19pi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=104.47.25.102; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=eE2S19pi;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01lp0102.outbound.protection.outlook.com [104.47.25.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MR3Y91bd0z2xmm
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Sep 2022 21:00:44 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aw4PLP2NvFvHw2QBtQioKLg1sT4qSFzNd/5kDQ28UFOgfeC2Jp73JkhczlYClHoecWxoWuGHqjwkiqMhTIJytaGzVuH/SlpWm3oCGBNvJKvQ2dYSDs2NiFfKhgQdZEH8XVdNcsAYGT6IdYzYlf6QvYD7Vi2GbfBwBzWQ780tExBmGM17v6nKLkNQBWV1QPTtf7vc1WvaK9P94xZrb5D8kCOSnotIr5llj83atHank0WvPAA2JSGtO0TCwJLSDDTthY8Oufq0CJb42lIHdzWMCtBbBdNQ7mFGZgePNp3xrz2YoYY4A+tTKZWEMu1/0rU/VDNAg3/Z2uLloDhqsR9hJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8AM9VuWdTljhnW+86F9jPCUVwBrJSyNTvx7SBT9QUlY=;
 b=MGuDtLkfL0T4PJCACFyDanzq8LGXh4mIhWv+/1VdXg2RQ1jpRDGzKFrxg9onU3zkSsY4nUWKQ2HySg94pZc/cOBcmN/nj+wr2D4yB/MXQfvAj3cvyo6+3unIhomzowjz1Pqq6MuDJJZdzrX4DNdnI3lapKFSz5UUPPNj5obI8GNZ+pwiuae/f/vYtUmi3sGoD+2dP5aSBL0UVtgQv/RUO5SMBt9S3pKsg36W2MZHb8qI32YHefXMqu8sHxgd+FCjlqrSbID34z3Fy90WBzCyiEYYf1TMFEg13a7fz+ljlqVOzfcL9DQQZF/9hK1TMnxSy25kttyXvTMMotaY1WEhFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8AM9VuWdTljhnW+86F9jPCUVwBrJSyNTvx7SBT9QUlY=;
 b=eE2S19piLiX2cO+aeRPZTtUxOniBGWJKMY4hnzNA/MaQCnrSZUmDAUjvmxukGYWfwiY1F6EKzQR8gfP09fNCO0NtXE5r0dZMJ+odxRglIATb7zQCFJZTeckTsXvdt9VBa30qBmeYsNtmZnsntVsfQVRlJ+8yA98vBhdEjUaLiU2pnIHOt9xo1gP8yWUrX5Vb25zb/vb7UASvaL9z512A7faHHS+8X2Hb+KtY2ZU9c5a5NgZ48HvqpVEqjoEIWTORCJmB0upRzNf15fu8UEuNT0rs2JXmN6ihwTtly75K6jFLxBhlwOiO8vQ6kvMbsOdMjlWNfizHWTeRiYANpmQPZQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2354.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:33::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Mon, 12 Sep
 2022 11:00:24 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8%5]) with mapi id 15.20.5612.022; Mon, 12 Sep 2022
 11:00:24 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Arnd Bergmann <arnd@arndb.de>, Nicholas Piggin <npiggin@gmail.com>, Rohan
 McLure <rmclure@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v4 02/20] powerpc: Use generic fallocate compatibility
 syscall
Thread-Topic: [PATCH v4 02/20] powerpc: Use generic fallocate compatibility
 syscall
Thread-Index: AQHYt147TTVVNasKGkW4exNfQwOK2a3bl2SAgAAV44CAABGzAA==
Date: Mon, 12 Sep 2022 11:00:24 +0000
Message-ID: <77355969-0ffd-cd1f-5f0d-3cc7059fade6@csgroup.eu>
References: <20220824020548.62625-1-rmclure@linux.ibm.com>
 <20220824020548.62625-3-rmclure@linux.ibm.com>
 <CMUACJ7N6P9U.2UABBGZM71SQ6@bobo>
 <e14f1d52-e37d-4a00-a879-d755a5095d48@www.fastmail.com>
In-Reply-To: <e14f1d52-e37d-4a00-a879-d755a5095d48@www.fastmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB2354:EE_
x-ms-office365-filtering-correlation-id: ce77f75e-c29c-45e3-cf06-08da94adfe92
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  SFg8xHTTT2oOXG2ubpS2c/8AzSMuHUs9KtjKZShnnLATA4CuR9xqoGb/IwrbEJM9rgjmrds71BtvMNqyw5/5DsECoTvj4XgW24E7/RWp8Nnw9nfFV6dfjJEjDkS655f2oi4MxOqN5X449Ci0COZICMO+jglbDd5z9/sr4+vSKOI7s9/F5SP/XC6lgv6bNnO1Al0iDY0lpmbEhVJZOpWF00dk2HFvDxGoMFTOYYb94+awAKcK92VHDSM2OEi1OGr8o5fcUM5HApfAifVlRJhNF4MndUQkDZyRu1DTiNXWDjj1UdIxF4QojVjMJRkTV2oREFivvGIhza1oMe0ny3G7dNWhYv9F/R9WlGAt/go/H/LuOEyJ9GeNYw5HQNTGdo/ElC6yA11irYlWfO2KHSNiKOc8xbGgB+DwNm8hWsb+fyz4YyfcmlGjbLZ+/ziWqWuDAfIq++eNmzYC1qnAal/n/Wrav+naxtGfPYxhL3MkjAd4P4vP4NaEQv6K7hyTex08Px3zRT9JNhCbXJBKF7ucdbaPNZTfZTPhbaumf+LezzrQ4zKSGfjkX1X/EtluN8s/FszYeI4RpPdrY0oYsa0Lk3GMqzdRLg0rz6jeF1XlOpYtg/Pl1X0FrkWKVxl501yaR5AA2MWmtova6I+7qQakSKsexac/jPOGNAK8YgE85UJgrBIXdcfsUgcgGsztBsq/eqtux6rxq9bDe5iHjXWYtTnY6JgL8KlBdW38a698PBolvTuAlwInI18W51tfUIX6tA+ZUEyIQ6IL4paItoQ+FSbvcMTFsn57Hcyw2Ysg6X6C8/tt/NEL9fD0uIvcxpIyyNnAv2daAx9I/V1ChODu36q2d6Fs3LjjzD26teoGB0U=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(366004)(39850400004)(136003)(346002)(31696002)(86362001)(66446008)(64756008)(76116006)(66946007)(8676002)(122000001)(38100700002)(66556008)(91956017)(66476007)(31686004)(38070700005)(36756003)(186003)(83380400001)(66574015)(2616005)(6512007)(26005)(71200400001)(478600001)(41300700001)(6506007)(6486002)(2906002)(316002)(110136005)(5660300002)(8936002)(44832011)(41533002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?Z01HSUpYY0dRNFM1Z2cwK1Zqc0g4WVdjSmpJLzFYbUQ1aGw1RTlMVjVpdDdL?=
 =?utf-8?B?RHUxTXUwdGd0cXlXZU4rQlJIaWRWWjNPamJJYWFSaXhPcTVNcXlNMHFzeU16?=
 =?utf-8?B?b1JwdVBBd0lvaE4xMXFaRFRKaXAzemFRU2V3OVBSUzVxOGtoQzRPYTY2b2VC?=
 =?utf-8?B?aXlUTkFhOGYzWmtadlZsQnNrQmsycnIramY0WG9qNEhhMGE4UlZmbSt4VS9q?=
 =?utf-8?B?L1VnQWdjbFpxUGJ5TUgwSnVNZzVCNk1VeDlUMDZVVEUyZ04wWWNmazlDQTUx?=
 =?utf-8?B?Y016Wjdna1pUblZCSE1EQlBuWDViVHRCc0JxK1k3Z3pydjNkOFJ0UkVYckxp?=
 =?utf-8?B?RGlxUXhxWlpJUlVBV3RjOWRKWHhmTStxWGdHNnlKYy9RcDZvYkIrckVxSUlp?=
 =?utf-8?B?dXhtd2JzZW9Gc3FDb00xUkNyT2RWUXVXNytvazg1ZnY3SEttL0QzNmZBaTdG?=
 =?utf-8?B?Q1d5Ry9sMkFvQzd5SEJFUS9iWUp3STZ3MFZ0YzUzeVdPSHpOb1JMQ3FBekto?=
 =?utf-8?B?ZVhZb2dWbmxLMVlWVklEQno0Z2ZYRlFRTUVQZ1dhVnA0YmYzRmJzaFgxUXJU?=
 =?utf-8?B?YTRvejFxU2c5bktydE4yWjFIY01RdlZzWEVJQkhCM1ExQTF6WEtZUExrNmRR?=
 =?utf-8?B?UzhUNWF3L1ZzN1B5RWxiTDJ5TWN3QjdTL1k2U09zU1RQZk15K3l2aXYwREZv?=
 =?utf-8?B?OGZaWGRqeTdJOWNYNGpYSjhKdndTbXBJWGJ2ejFxQ3Y5YjM1Y2Zkb3crQ2Fy?=
 =?utf-8?B?STVUSG90MndpeHVCQUZ0SmpmRFNPQmJHK2tJYTRiSTVyalh6RFY3NUNhZ1E4?=
 =?utf-8?B?SlN3dXJFRUZTQ3BGRU5PNEh2cWd1dGdtcVJSeDI5TW1xSGV4UnFSRUNVZFFz?=
 =?utf-8?B?VnB1WkVuWDBqMU56NDBnVmliNUZDcHplWXhKYVVTNFc5eHhacjBXSmUzMFln?=
 =?utf-8?B?TmVFUzJUQVFDdjlkRWViKzd1TEdVOWFWaTMrSHZSUWRaS1FFOVgvSkpyR3Fl?=
 =?utf-8?B?ZjdIM2xFSFl4UEFRWTNyUURFVFAxWDl1dStCdDNIRlN4MkUzTExReWxiMFB6?=
 =?utf-8?B?aDllcTZYd0dxRU1nVEMvMm1Ea1pmNzRseStmSTFmMm9MZU0yWmRSMXFyWHY3?=
 =?utf-8?B?RmczYXJOMTdhaDFjRC85UThnNlBsbjZSWXpkcllOT3kwYzdyV1o0VnEwKzJY?=
 =?utf-8?B?QXVBZk5PYmMwMUtuRkQrM0RtUXVkV0FZUHdnZzh2aGFUMHNDNEppQ3NQM2Fw?=
 =?utf-8?B?K0hDZE0zbXF1SFRwZVMvNFRyWVg1eGFsdW1FQnVaWTNsY21vSzZjTVdqNnNV?=
 =?utf-8?B?aGtjN0hyM212c2p4L3pJTXhUeGI3Y0hJaGlVTGxVTDhBMS9uQUVOMFRqYXFM?=
 =?utf-8?B?VUl4clRjdHBTSXNkWXNRU0h3ZmZ0Umk4ZHF4Y0ZsUks2ZFZEK2NlV1NvaEh4?=
 =?utf-8?B?NlV4ZXgwWnlGeGhtcjRiNDNVM2drMHJDY1JFTjBPYkloWnlxbTIxM0k0bkxG?=
 =?utf-8?B?OUdxOEpXN3VZUStNYVpueWY2T3ZBaHR5b3dIRlN5UmFaYTMvb1pyTGZ4MFM1?=
 =?utf-8?B?NS8rUHNnY0lKNUtvbzZ1UlBlSkdJU09pUkRzY0NjMU93K2VsMkJDZUFNM3Fa?=
 =?utf-8?B?Zk5HNkJCSVhzQktsakZtaHR3OXZ0OEtQS01teGdtZ2Jmc0lnRTRoaXJ4U0tk?=
 =?utf-8?B?K1lEejF4L0pIb2dzUG0zZHFZMmV1V3BMeFRTOWpXMXN1QWlPVEVHMUJocDBm?=
 =?utf-8?B?dDYvM2tlR0N0bHNKNmZocWx4THRSKytUM296TlNPeVp1S2NxVlFYMHMrdC9u?=
 =?utf-8?B?dHhpZ3VsRXdWdjg5eFJ6bGU3TkoyNWRYRzErTjBFOU8ycVVFR2s4Um9aTjYy?=
 =?utf-8?B?YWpuSnFyL3g0bXN1dWhzVGpXMG1BTnhDazZtc3pGZzdXYmdtL1lwRDUrcms1?=
 =?utf-8?B?TnZYTFdrSDZLVjNaSjJFTnpMYkVVcGVvN0FkQWZjTzIrUVhNaVhOOG91eGMy?=
 =?utf-8?B?VWxaS3ZmaXkvUjdsS3VXcytDUzlRZlEwVU40VmVnK1pEZU16Sm4rNHVrTUcv?=
 =?utf-8?B?Kzl5dTMxUHJnMSsyMmhFRnBubUk2ZU00VmIwMDVYRmZ4S2ZHbUorSEFKM1hz?=
 =?utf-8?B?ckt0OE9WL1RPczVmZmc3M1hyWTgvdUNNWnpoMktrdzJqSmVHYW1PRzlUem5G?=
 =?utf-8?Q?8FqwXL47luGeOe4NGrN5K/o=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2F57A45AA9E6004BA11F4777C319D810@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ce77f75e-c29c-45e3-cf06-08da94adfe92
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2022 11:00:24.7164
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FJlah4KwLqqemaciOJcpldDMAzp1/9/1o7PHB7PLOr6HCr8kj8gQrFDP91DXKj7pYnsbge1Nwl18+RPXJU+V8dAq6ERkv18qXRrStcllE5E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2354
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

DQoNCkxlIDEyLzA5LzIwMjIgw6AgMTE6NTcsIEFybmQgQmVyZ21hbm4gYSDDqWNyaXTCoDoNCj4g
T24gTW9uLCBTZXAgMTIsIDIwMjIsIGF0IDEwOjM4IEFNLCBOaWNob2xhcyBQaWdnaW4gd3JvdGU6
DQo+PiBPbiBXZWQgQXVnIDI0LCAyMDIyIGF0IDEyOjA1IFBNIEFFU1QsIFJvaGFuIE1jTHVyZSB3
cm90ZToNCj4+PiBUaGUgcG93ZXJwYyBmYWxsb2NhdGUgY29tcGF0IHN5c2NhbGwgaGFuZGxlciBp
cyBpZGVudGljYWwgdG8gdGhlDQo+Pj4gZ2VuZXJpYyBpbXBsZW1lbnRhdGlvbiBwcm92aWRlZCBi
eSBjb21taXQgNTljMTBjNTJmNTczZiAoInJpc2N2Og0KPj4+IGNvbXBhdDogc3lzY2FsbDogQWRk
IGNvbXBhdF9zeXNfY2FsbF90YWJsZSBpbXBsZW1lbnRhdGlvbiIpLCBhbmQgYXMNCj4+PiBzdWNo
IGNhbiBiZSByZW1vdmVkIGluIGZhdm91ciBvZiB0aGUgZ2VuZXJpYyBpbXBsZW1lbnRhdGlvbi4N
Cj4+Pg0KPj4+IEEgZnV0dXJlIHBhdGNoIHNlcmllcyB3aWxsIHJlcGxhY2UgbW9yZSBhcmNoaXRl
Y3R1cmUtZGVmaW5lZCBzeXNjYWxsDQo+Pj4gaGFuZGxlcnMgd2l0aCBnZW5lcmljIGltcGxlbWVu
dGF0aW9ucywgZGVwZW5kZW50IG9uIGludHJvZHVjaW5nIGdlbmVyaWMNCj4+PiBpbXBsZW1lbnRh
dGlvbnMgdGhhdCBhcmUgY29tcGF0aWJsZSB3aXRoIHBvd2VycGMgYW5kIGFybSdzIHBhcmFtZXRl
cg0KPj4+IHJlb3JkZXJpbmdzLg0KPj4+DQo+Pj4gUmVwb3J0ZWQtYnk6IEFybmQgQmVyZ21hbm4g
PGFybmRAYXJuZGIuZGU+DQo+Pj4gU2lnbmVkLW9mZi1ieTogUm9oYW4gTWNMdXJlIDxybWNsdXJl
QGxpbnV4LmlibS5jb20+DQo+Pj4gLS0tDQo+Pj4gVjEgLT4gVjI6IFJlbW92ZSBhcmNoLXNwZWNp
ZmljIGZhbGxvY2F0ZSBoYW5kbGVyLg0KPj4+IFYyIC0+IFYzOiBSZW1vdmUgZ2VuZXJpYyBmYWxs
b2NhdGUgcHJvdG90eXBlLiBNb3ZlIHRvIGJlZ2lubmluZyBvZg0KPj4+IHNlcmllcy4NCj4+PiAt
LS0NCj4gDQo+Pj4gQEAgLTE2LDYgKzE2LDExIEBAIHR5cGVkZWYgdTE2CQljb21wYXRfaXBjX3Bp
ZF90Ow0KPj4+ICAgI2luY2x1ZGUgPGFzbS1nZW5lcmljL2NvbXBhdC5oPg0KPj4+ICAgDQo+Pj4g
ICAjaWZkZWYgX19CSUdfRU5ESUFOX18NCj4+PiArI2RlZmluZSBjb21wYXRfYXJnX3U2NChuYW1l
KQkJdTMyICBuYW1lIyNfaGksIHUzMiAgbmFtZSMjX2xvDQo+Pj4gKyNkZWZpbmUgY29tcGF0X2Fy
Z191NjRfZHVhbChuYW1lKQl1MzIsIG5hbWUjI19oaSwgdTMyLCBuYW1lIyNfbG8NCj4+PiArI2Rl
ZmluZSBjb21wYXRfYXJnX3U2NF9nbHVlKG5hbWUpCSgoKHU2NCluYW1lIyNfbG8gJiAweGZmZmZm
ZmZmVUwpIHwgXA0KPj4+ICsJCQkJCSAoKHU2NCluYW1lIyNfaGkgPDwgMzIpKQ0KPj4NCj4+IElz
IHRoZXJlIGEgcmVhc29uIG5vdCB0byBwdXQgdGhpcyBpbiBhc20tZ2VuZXJpYy9jb21wYXQuaD8N
Cj4+DQo+PiBQb3NzaWJseSB5b3Ugd2FudCB0byBwdXQgdGhpcyB3aXRoIHRoZSBvdGhlciBjb21w
YXQgZGVmaW5pdGlvbnMgYW5kDQo+PiBhYm92ZSB0aGUgYXNtLWdlbmVyaWMgaW5jbHVkZS4gVGhl
IGdlbmVyaWMgaGVhZGVyIGV4cGVjdHMgdGhlIGFyY2ggdG8NCj4+IGluY2x1ZGUgaXQgYWZ0ZXIg
ZGVmaW5pbmcgd2hhdCBpdCB3YW50cyB0byBvdmVycmlkZS4NCj4gDQo+IFllcywgbWFrZXMgc2Vu
c2UuIEkgdGhpbmsgdGhlIHJpc2N2IHBlb3BsZSBhZGRlZCB0aGlzIHRvIGFzbS1nZW5lcmljLA0K
PiB0aGV5IHRyaWVkIHRvIGRvIG9ubHkgdGhlIG1pbmltYWwgcGFydHMuDQo+IA0KPiBJbiB0aGVv
cnksIGFueSBhcmNoaXRlY3R1cmUgY291bGQgaGF2ZSBpdHMgb3duIGNhbGxpbmcgY29udmVudGlv
bnMNCj4gZm9yIGVhY2ggc3lzY2FsbCBhbmQgaGF2ZSB0aGVtIGluIHRoZSBvcHBvc2l0ZSBvcmRl
ciBmb3Igb25lDQo+IGVuZGlhbmVzcy4gSSBjaGVja2VkIHRoZSBzZXZlbiBub24tZ2VuZXJpYyBp
bXBsZW1lbnRhdGlvbnMgb2YgdGhlDQo+IHN5c19mYWxsb2NhdGUoKSBzeXNjYWxsIGFuZCBhbGwg
ZXhjZXB0IHBvd2VycGMgaGF2ZSB0aGUgc2FtZQ0KPiBBQkkgYXMgdGhlIGdlbmVyaWMgb25lLg0K
PiANCj4gVGhlIHBvd2VycGMgZGlmZmVyZW5jZSBpcyB0aGF0IGluIGxpdHRsZS1lbmRpYW4gbW9k
ZSwgb25seQ0KPiB0aGUgJ2xlbicgYXJndW1lbnQgaXMgc3dhcHBlZCBidXQgdGhlICdvZmZzZXQn
IGFyZ3VtZW50IGlzDQo+IHN0aWxsIGhpZ2gvbG93Og0KPiANCj4gbG9uZyBjb21wYXRfc3lzX2Zh
bGxvY2F0ZShpbnQgZmQsIGludCBtb2RlLCB1MzIgb2Zmc2V0MSwgdTMyIG9mZnNldDIsDQo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1MzIgbGVuMSwgdTMyIGxlbjIpDQo+
IHsNCj4gICAgICAgICByZXR1cm4ga3N5c19mYWxsb2NhdGUoZmQsIG1vZGUsICgobG9mZl90KW9m
ZnNldDEgPDwgMzIpIHwgb2Zmc2V0MiwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICBt
ZXJnZV82NChsZW4xLCBsZW4yKSk7DQo+IH0NCj4gDQo+IEl0J3MgcHJvYmFibHkgYmVzdCB0byBm
aXJzdCBmaXggdGhpcyBieSB1c2luZyBtZXJnZV82NChvZmZzZXQxLA0KPiBvZmZzZXQyKSBhbmQg
YWxsb3cgdGhhdCBwYXRjaCB0byBiZSBiYWNrcG9ydGVkIHRvIHN0YWJsZSBrZXJuZWxzLA0KPiBi
ZWZvcmUgY2hhbmdpbmcgaXQgb3ZlciB0byB0aGUgZ2VuZXJpYyBjb2RlIGluIGEgc2VwYXJhdGUg
cGF0Y2gNCj4gd2l0aGluIHRoYXQgc2VyaWVzLg0KPiANCj4gQSByZWxhdGVkIGlzc3VlIHNlZW1z
IHRvIGV4aXN0IGluIHBwY19mYWR2aXNlNjRfNjQoKSwgd2hpY2gNCj4gdXNlcyB0aGUgd3Jvbmcg
YXJndW1lbnQgb3JkZXIgb24gcHBjMzJsZSBjb21wYXQgdGFza3MsIGluIGFkZGl0aW9uDQo+IHRv
IGhhdmluZyBhdCBsZWFzdCB0aHJlZSBkaWZmZXJlbnQgY2FsbGluZyBjb252ZW50aW9ucyBhY3Jv
c3MNCj4gYXJjaGl0ZWN0dXJlcy4NCg0KRG8gcHBjMzJsZSBleGlzdCBhdCBhbGwgPw0KDQpOYXRp
dmUgcHBjMzIgaXMgYmUgb25seSwgYW5kIEknbSBub3QgYXdhcmUgdGhhdCBwcGM2NCBpcyBhYmxl
IHRvIHJ1biANCnBwYzMybGUgY29tcGF0IHRhc2tzLg0KDQpDaHJpc3RvcGhl
