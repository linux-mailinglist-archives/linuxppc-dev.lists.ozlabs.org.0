Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F305969F237
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Feb 2023 10:52:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PMBKF5XZMz3bT5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Feb 2023 20:52:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=cZqyfKVa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::60a; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=cZqyfKVa;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on2060a.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::60a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PMBJH60jFz2xb4
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Feb 2023 20:51:43 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P6s/nmFA4mK0gxKhYTxVBVc33BdbYYxBYz6u3PJ3b8m4ldlGBnWP+iZ2aKenl7RaHjo9Jky+vwzcw6KH70rFzaRfG7eAADBCtrqi2VUA/Ys1nY6zHN9Om1FZ+AHJil2u2GN6W0dHo0mbWpYrf+8udomtnEY3g/0dzLdNfKz6ef+aUbGAZ/WJuiSpNJ3OBeqy/mZBZV007tivQSwsdemKWjetttjTWf+s+xgVDh3auN9iNFgN1vUfXINUuldlPmxYRhCYDFGNuujybcuh0hUl86oL7w39PyqTcH1u9UBqkTZNdsguBPHxtLAyFW0PBkVW5C84hsX/EwpJ/7cHeZt09g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k5gXkFOoCLVFdAb07ItHu7avaGHZCMDmy8hUptW6UTE=;
 b=NitZOB6CiUqI7RoFl3BMe1vv3pn+5XHSpNkLGSruQ/f4ksgywfInGncNvH85gmkDkws7E15qNjYiYocnfjQ2cp/C8dqcwWxelK9TEjO70NwUKpynwQfKtlKWkfpBLV9UptNsw8mFFysB+2uqmxCOPhksekKnXeQm2AdPlOVQPt/VeC/3l4HOmr9HaKkXCPePAF9nNqGt4o9HLuxZWD+YkC1Weq7hU9LhNFmuemGunKoPOR/qbAsXrpSEY87U7J13bstBmCkHhUoSmog80CJ4yNO5nF3hpgoYKYahkKokoHG6I9ZeHJu8uU1c7zbcST9qk5+B6RIwpR/hF6VWpV5ReQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k5gXkFOoCLVFdAb07ItHu7avaGHZCMDmy8hUptW6UTE=;
 b=cZqyfKVa3qv4TLNugvFzaQPekuVWJQMgheILfOapRtg80pEtRkp45tEfQ04I3gvYAvdr6hVdO7GHb+imFficSh/YPFT4wNXOh7Tal+3P2ZZZYbw0obEn1TgSHw3RfqcRREbVq0VRc4XHAq/h4wdxT2AHw5kQDwFsi3DQcxVV4i9Dpdsqk3i0hPnlAJ7rJ6UFMaxgtqEUXUAM7YvTtTOPWofWr2jD36Z17D/4HJZ4OloQbfJz7NqnPEXC1uKWsFx8YwHEvzBl/dP63JgKA+X4mwb86s+spihOHCfnd53bFzfBmMUtnNAyi6dqdyKj3BqsOvXQqUfXMDpx6b2Tv6WnlQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2884.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:39::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.18; Wed, 22 Feb
 2023 09:51:22 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097%6]) with mapi id 15.20.6134.019; Wed, 22 Feb 2023
 09:51:22 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Kautuk Consul <kconsul@linux.vnet.ibm.com>
Subject: Re: [PATCH v2] arch/powerpc/include/asm/barrier.h: redefine rmb and
 wmb to lwsync
Thread-Topic: [PATCH v2] arch/powerpc/include/asm/barrier.h: redefine rmb and
 wmb to lwsync
Thread-Index: AQHZRqIYYMZstWBlpEuSmpM9LQicEq7at+wAgAABQAA=
Date: Wed, 22 Feb 2023 09:51:22 +0000
Message-ID: <2cf06ae7-b3cb-8d17-afef-df1834a84dce@csgroup.eu>
References: <20230222090344.189270-1-kconsul@linux.vnet.ibm.com>
 <c4dcf969-0836-cc78-63d9-db83b9ebfa1d@csgroup.eu>
 <Y/XkjobvDPFErM7J@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
In-Reply-To:  <Y/XkjobvDPFErM7J@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB2884:EE_
x-ms-office365-filtering-correlation-id: f9233b98-0885-4fdc-7239-08db14ba5b0a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  E42Efa1zEv7bFEYVsYAsdigrgaU982F6+3wWZv8Q/WsY2js22tpnHUH0lHrXdXbF/n3NENfn5CjHzzc48hhE5pTMg/SNPVtYSHGCtEIMsEgsRtm5tBNEG434nHBtQNXt1mQ088rQx7Asm1wgXR4Kj9xsprhHg5OTm9VNS0rkE0E++v3DGLDjspRYAsWV/33Hq1C4XHjN8ICr8Z6X2H2f+u2lIG1tl4AOSezGblbGIthKskQiISadvud57i1QcbPUNmFyLzpDjG0Zqc7mLiX+GNTmdCwXuY6DDnKDJaTNRaBE7wcHd9smzdBviKylwAwxky1aonpjGGe5JVPNN4yK5uERh0i//6AH9obIuu7yyCEPIcv40FwSdiFiHxGAem0IuNVFLjvpTB9CRnTPH0ze4gRP7tg5BYfKjVtgdfpocZo0KVTK3I6Ib47m7g56h9M+rM7sP1rG8iGTNOC+qIuvozOq+4tx0Sem80cGHOMwbfG7EWW3k01XJLu7s2xrLWmxaYiG62vkc0QQnBn9V0nK/I3ALXI23K2Mlb2WNueDcfc5z/MldCn/hIQFf8phAu8lTyUSsxWDT1bknetVNC0j6sQZ2EDCTaE9l00+8T65DKCfRI4fUaJg163tyI1eNoe7OD5lUDIwZzprM31OXLHy4IykgovhAQvZ/PZVrhMQRKAO8dZaFFuANv1fSlSn31vGVyNYWn930EUNYqDb7z72FQ4602Rf2dUp7XFTyAOJeKIuBbTus1HDtPEzSBVeoBp5aYHttYA1MSxijLR8GfPOSQ==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39850400004)(346002)(376002)(136003)(396003)(366004)(451199018)(478600001)(71200400001)(31696002)(38100700002)(86362001)(122000001)(2906002)(38070700005)(44832011)(316002)(41300700001)(54906003)(36756003)(5660300002)(8936002)(64756008)(66476007)(66446008)(8676002)(76116006)(66946007)(6916009)(66556008)(4326008)(91956017)(31686004)(26005)(6486002)(186003)(6512007)(6506007)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?WkY5SVZUcjV3WmFLMzF3dmhlME1vdmYwWHVCeTI2ajBtSlRqUHR6L3pKVHFI?=
 =?utf-8?B?K3U3TUQvV3I2ZXN2TkNhYlVNeGd6cGQ2U1J3M3l3Vzh3YUdnaXFXYjYyTmp1?=
 =?utf-8?B?SUdidngycHI2UHZRZ1RMVldia0hoc1VTRVE2NnRaZkZVR2FJQzdxMmVWVUhy?=
 =?utf-8?B?a1JINTF2Z0RpNzZGMU5pU0pYQ2Vib2pvdkhKTHdWR0x1Z045ejExRUlXeE1E?=
 =?utf-8?B?b3lHYWRuU1Fmb1c4NDFLV1hHY3lSZlVsbjN2cHVWbDY2WVZaT1NZNTJoTzZS?=
 =?utf-8?B?OEtqUjJhazJES3BQWjcwWjBhZHdVUi90TG5pQU5icDRtVFpyRWd4VUQxNEtT?=
 =?utf-8?B?bENCN09ZU3N0Vloxb1RsZUdKTS8xUHJkUi9tQ3llVmtibmpFNHlTRkk3K2di?=
 =?utf-8?B?eHIveUx5MjB6bktjejBWMFBNNEJNak43N3JuNWwvNE9RVUhNZ3I0blJPQ0NS?=
 =?utf-8?B?ZWFLU0VQTVBXUWpOUE9BTXl6LzZSWlZBSE9iNS9rZlliQzgwVEd4N3JWYlBi?=
 =?utf-8?B?T1JPQ3JkaEdFTzlCMEljYlhkY09xanhodGpnRCtzclF0Mm8wd3B5bzVYUWw4?=
 =?utf-8?B?ZDFNcEN2U1l0Z1lrZHk4akFNSVYxdXJhalkwcmJua04xYkFpOWIzSUUwN3ly?=
 =?utf-8?B?ME10bnd5UzVmb0RONFFDbGw3OFJaUHBkSDVNNU9Pa3ZlVVRHRngrOTNYZVY4?=
 =?utf-8?B?QU5oekJuaEU2aVN1SkRTTnluRW55Z25HWitQanNlRFhYYmJaRGRLMnlXUGMw?=
 =?utf-8?B?UjhIZGJiT3NiU1UzTWNtaHNOaFlqT1h3VjNZTkpFWXptdG9jUTBzVWx5THlN?=
 =?utf-8?B?QWhvVjUzdjA0MGNEOVJwaHZrcTFBRGJHZVArMVFva01UbDhvK2drb1ZrbWxY?=
 =?utf-8?B?WUlZd0xEYnlpclpGNjluNDJ1QldsNEFhUE11RmNKRjJUVTAvWEpzbTdXbEJ2?=
 =?utf-8?B?ejNQQlFtQmRmUGZWTFFOQkQ5RGdHSGlyajAvdS9XcFV5NW9SZy94bmYwOTZ3?=
 =?utf-8?B?QS9aNFA0ZXdVZlV6ZUdhRjVTMVdHbVNXOVZQWERTdzAxZDNyMUlMMmxKckVD?=
 =?utf-8?B?ckdWaFRPTnZWK3lQa3RGNUY3c1NzS1E0bU5oWnQ1T1d4N0dscUlML0l5c1Fh?=
 =?utf-8?B?LzhxMDB6R0xGeEpMS1JERmYvRXFFUndUUUFNWkgxZnZ4alJKeGFiQkJQQVJI?=
 =?utf-8?B?M28ySmY4dk5UY2M1ZjkxUWRPekk3bE81NWRtSFIwYkk3KzhhQmpPSlM1ZDJO?=
 =?utf-8?B?WHdOMTZKV1I5VTl2SGFQQWhDK28xSDRTaG9zOHp5Q0JOa0ZuSy9ueGdYanQx?=
 =?utf-8?B?WThuVVBMd3NvdzE5cDJVZHYrS2RlSHlDZVZQTVNzbUwzN1dNU0kySFh3TFRa?=
 =?utf-8?B?dWZWTFFYMVhmaEFuOUlaQ3I2b2lEOS9WM1hKVjlWS1A0ZVRYMHg5UE5wYk1z?=
 =?utf-8?B?TzIva2luUllieFI2a2JoWDFjRnROWVRqZW4zQiswd3laZ3ZsSmQ5ekx2clpW?=
 =?utf-8?B?VHUwMHZ2QWRKcldLOHVJNFdVbDkrMG5DalBGL1RGcTkrb3FuZDdJU3lXRzY3?=
 =?utf-8?B?UTNFWjY4RkVQeGROakFjSm1NTmFaNUc1RHJ6dzU0a0QvRi8yVTVwY1UvYSty?=
 =?utf-8?B?ZXZ5SEV0cERrd2cxbHFhd2NWZ3VENmhTUWVQQS9GbUtzRC96V1ArYmVUMHdR?=
 =?utf-8?B?ZWhBZ2VCUnZpWk4ySGwwTWJXRThiUnU3NURXSU13OERRbmR1SlJyMUkyYzZt?=
 =?utf-8?B?TnBBWHdjNmFUbi8vSTZ4TzZYNFBIdE9kUVM1WW94UDhHUFMwc3VhNnY5NDNr?=
 =?utf-8?B?czdhRDhlZWRIVWdaT1psUXYyQ0k2T0dxUnZMU1g5VjU0RGJFcU91THgzV1Jk?=
 =?utf-8?B?S0dJeWlmVG5SSWJVdVQ2bDdqazRUSTJkRnN1d3NHMFZLSml5ZGEvVkU5T3dJ?=
 =?utf-8?B?cG5ncW5SYURFWkJSc21zaVRSN3hZQ3NBK3hyb3RDdjJrWHdyQksxODFDdGE3?=
 =?utf-8?B?VXpTUHFIYjhSRUdjK0ZSQ21haVFKNjJFZmZKM2VZL2NLR21GQjY2d2ZkZXdq?=
 =?utf-8?B?QXEzK1RyYTVmbjcxZzdGcHRRSGRGTU9KYUpiM2xRRnkzQ2hqQnl6dFBFWHlP?=
 =?utf-8?B?WUpGcENkcGdMSDVEYnBQKzE3Kzl4REFQeEtqZ1F4ZllTb0Jwa0tFSFMvTU9V?=
 =?utf-8?B?eUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <58D145C625D2F84891EE748AB19DD052@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f9233b98-0885-4fdc-7239-08db14ba5b0a
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Feb 2023 09:51:22.6316
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NMdYnHzAPMx2xGfwNV9KJY0YnPxwrb711aTGiEKNI5FYTip2NUazdtygL3BZwU/zCYK2oQT/n/HUvfXZlY0WgVZWP6LJ2f+I/MTcnXYMAdI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2884
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
Cc: Rohan McLure <rmclure@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDIyLzAyLzIwMjMgw6AgMTA6NDYsIEthdXR1ayBDb25zdWwgYSDDqWNyaXTCoDoNCj4+
DQo+PiBSZXZpZXdlZC1ieTogQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dy
b3VwLmV1Pg0KPiBUaGFua3MhDQo+Pg0KPj4+IC0tLQ0KPj4+ICAgIGFyY2gvcG93ZXJwYy9pbmNs
dWRlL2FzbS9iYXJyaWVyLmggfCA3ICsrKysrKysNCj4+PiAgICAxIGZpbGUgY2hhbmdlZCwgNyBp
bnNlcnRpb25zKCspDQo+Pj4NCj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUv
YXNtL2JhcnJpZXIuaCBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9iYXJyaWVyLmgNCj4+PiBp
bmRleCBiOTViNjY2ZjAzNzQuLmUwODhkYWNjMGVlOCAxMDA2NDQNCj4+PiAtLS0gYS9hcmNoL3Bv
d2VycGMvaW5jbHVkZS9hc20vYmFycmllci5oDQo+Pj4gKysrIGIvYXJjaC9wb3dlcnBjL2luY2x1
ZGUvYXNtL2JhcnJpZXIuaA0KPj4+IEBAIC0zNiw4ICszNiwxNSBAQA0KPj4+ICAgICAqIGhlYXZ5
LXdlaWdodCBzeW5jLCBzbyBzbXBfd21iKCkgY2FuIGJlIGEgbGlnaHRlci13ZWlnaHQgZWllaW8u
DQo+Pj4gICAgICovDQo+Pj4gICAgI2RlZmluZSBfX21iKCkgICBfX2FzbV9fIF9fdm9sYXRpbGVf
XyAoInN5bmMiIDogOiA6ICJtZW1vcnkiKQ0KPj4+ICsNCj4+PiArLyogVGhlIHN1Yi1hcmNoIGhh
cyBsd3N5bmMuICovDQo+Pj4gKyNpZiBkZWZpbmVkKENPTkZJR19QUEM2NCkgfHwgZGVmaW5lZChD
T05GSUdfUFBDX0U1MDBNQykNCj4+PiArI2RlZmluZSBfX3JtYigpIF9fYXNtX18gX192b2xhdGls
ZV9fICgibHdzeW5jIiA6IDogOiAibWVtb3J5IikNCj4+PiArI2RlZmluZSBfX3dtYigpIF9fYXNt
X18gX192b2xhdGlsZV9fICgibHdzeW5jIiA6IDogOiAibWVtb3J5IikNCj4+DQo+PiBJJ2QgaGF2
ZSBwcmVmZXJyZWQgd2l0aCAnYXNtIHZvbGF0aWxlJyB0aG91Z2guDQo+IFNvcnJ5IGFib3V0IHRo
YXQhIFRoYXQgd2Fzbid0IHRoZSBpbnRlbnQgb2YgdGhpcyBwYXRjaC4NCj4gUHJvYmFibHkgYW5v
dGhlciBwYXRjaCBzZXJpZXMgc2hvdWxkIGNoYW5nZSB0aGlzIG1hbm5lciBvZiAjZGVmaW5pbmcN
Cj4gYXNzZW1ibHkuDQoNCldoeSBhZGRpbmcgbmV3IGxpbmUgd3JvbmcgdGhlbiBoYXZlIHRvIGhh
dmUgYW5vdGhlciBwYXRjaCB0byBtYWtlIHRoZW0gDQpyaWdodCA/DQoNCldoZW4geW91IGJ1aWxk
IGEgbmV3IGhvdXNlIGluIGFuIG9sZCB2aWxsYWdlLCB5b3UgZmlyc3QgYnVpbGQgeW91ciBob3Vz
ZSANCndpdGggb2xkIG1hdGVyaWFscyBhbmQgdGhlbiB5b3UgcmVwbGFjZSBldmVyeXRoaW5nIHdp
dGggbmV3IG1hdGVyaWFsID8NCg==
