Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1BC7BF915
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Oct 2023 12:57:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=TGBlO+X9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S4XsY1cbsz3cdV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Oct 2023 21:57:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=TGBlO+X9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::608; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20608.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::608])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S4XrZ5x34z30fm
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Oct 2023 21:56:13 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AR53DUZfershDfOYp7+bx5DEf1q41N1vFejxIutxGYLqGRi5aInW1Y6htWEUM2bSrecIdwADMRJswRN4SbrnCgBXsqxE5vuDeXLmDs3glokhHRWp2zEawt+Sm/zL9JhaENuGtbOj0BlODxPnoVYX7LMLJx4AynrKwAXyMpJBgOCL282bls+bOEybHi/dOuErhlbtGCrwRHhEaC1YxFbYj2x0zEcct3bJPwPN5MtLD6hKcwZMLnbe03zS7QC4E6AwoWJSIewglVFydWkQ0lM6Pp/cVZotB4kxaVbaCBjwqyGUZxm8ebhv9/H/o54BXszOwi/dbARnBC8L0CYpZbpZeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BV2mnXBsXp58R0U4pUThZzg+uvnc/fL32IaKwUjSHuY=;
 b=OfpGXc2K09r64pCTpNGmLIV+4aOCw0G5eug+oY7CRkVuwBtX4yS2uGab8yQccdntXH6Tg0gS4SbFwVKKZl2VnOoTGVyNFaWHzvOfIcGWzty3grY4zCH03h0fwcaPvh8xStYcak80rxGz/XsjifJmLu4iNq4DRbwyDRsoD+XSU7gPAV4IXpmBl9HNhU1eaKvUZ/a0FsbPVANFQ0wss05adndL1islWnZE/FAkx3ari4XU2EEQHkGuStaLarSQ/kqbHhKAmNeO/DWL0YUfVbvL0oo+JAdAxeu9p7Ot+yrOvTihnqZlRglOmXwuYRtfSRAO2aL+6L+zrqS33RTDc0KshQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BV2mnXBsXp58R0U4pUThZzg+uvnc/fL32IaKwUjSHuY=;
 b=TGBlO+X9Dm4a9aF+BTVjxrdHL2+8uB3QZA2Be5TlnkNHDw9OgyN8yD2Mf6Mo42HNPEzZkf+jQTX6s8ELIzOQ1hrf5MzitdkNcpS1u4uwEck33AXMgURidXf7H+3vCjeygPCut8WRWGpwzGHz1CP71xgAW0tp9OldL1iQ0qGAEm23+MLh7mWVEKsOh0qfcYXG+f+mvo/2Ky4CKFxw9tHheF/zJQNQp02x4IQ+Ap8zlyHZsqsp2dYNsM5EL9u/OeLTPvkhgN1stAKA+0Xk+kuXfl5KLTv/tVLzrKG7W768iCyNWlFrOwFOGuQjxWkHCnbi4mX8y+U8dljAVbtpsDcehQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB2048.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1b3::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Tue, 10 Oct
 2023 10:55:55 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::165b:8c64:6165:9049]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::165b:8c64:6165:9049%3]) with mapi id 15.20.6863.032; Tue, 10 Oct 2023
 10:55:54 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/85xx: Fix math emulation exception
Thread-Topic: [PATCH] powerpc/85xx: Fix math emulation exception
Thread-Index: AQHZ78jGAEnWSJCRYU+WSrVFxcpiLbBC7hwAgAADAAA=
Date: Tue, 10 Oct 2023 10:55:54 +0000
Message-ID: <c259a5a2-8ef5-42eb-0b1f-0f0e1ff70c26@csgroup.eu>
References:  <066caa6d9480365da9b8ed83692d7101e10ac5f8.1695657339.git.christophe.leroy@csgroup.eu>
 <8734yisqmh.fsf@mail.lhotse>
In-Reply-To: <8734yisqmh.fsf@mail.lhotse>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR1P264MB2048:EE_
x-ms-office365-filtering-correlation-id: 76049d3b-3512-42a8-3c9a-08dbc97f79e7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  7nLfp1OuPqt9sMR1XicdZXUacVjP31sIbgaQimhyurE/bXfUw7iGIoBwRE8te8PnWjjISNhS9AhWUIf8v9N0H4GM2lVFZUn8fOGoi4Hl1PJjVNAV6GUoZJYq6TlvXlAZzzaHJ97FvKu1wUtGPmK/Hdw6GdgvoxHNvmUZaHd3C+wi31gMHypYgQ9yTwLyCmiIqw95M0BI1FF99YVhRt4K54kLJZuNwwUnkGTnu+mYCDcPNR+r9Vs2Ul11n1/+RvuH9L1iwH19rpDn1s6b4JZz89u5GzlLN2a8OVS2X/LB/NpMmxeB4ca64Ntkix0NMhhz9p1Za6LkaCVEe0y+31phcQfWs/HfRTdy5y+V722NnD1NbBJZzJ/L47/mUEtt3k4h/dVeAbVnQSK07VA4WSRvPMykK+0gQGVcPER7fwu5lWmwzSSkLSz4P054I01hbzp/SxyGcjJaDWKWT34f22HHI6x4Sg69IPX9ZBoRWdl+NGdyxHpZhSdXJfYp6h5G8otRAEXhVa2o3PGPWQ8Co+AFWDg9TlzNxcp+Phqpu4kC+Xyf9+tmKhYo1WzqCLobtWZnQZrviqEnU7ryaSQT8UCWsrwGIMba6QGbXyUClotcQ+HrWIjcQ/Bp7LhmDCGvXDeO4vG2ANXzBqWyLh0T7Mi3cYRprmBEGV5ipsZTju7+LmMzNIaLEYVIG+ubcAfkzhhp
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(39860400002)(366004)(396003)(346002)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(31686004)(83380400001)(2616005)(26005)(91956017)(110136005)(66946007)(66556008)(38070700005)(54906003)(64756008)(66446008)(66476007)(316002)(76116006)(41300700001)(38100700002)(2906002)(4326008)(8936002)(8676002)(122000001)(44832011)(5660300002)(66574015)(36756003)(71200400001)(6512007)(86362001)(31696002)(6506007)(478600001)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?bkhXR1orNFpSdFdzbUFKOGE0Q1A2ZUx0REFiaEh0bWZiL1krOEp6NGdyc1lv?=
 =?utf-8?B?WVV3dU0zUmJhOFFoalNMK1k3UE9pdWU3Q0NYZW11MlVrdDJ3bTNxaC82c0dY?=
 =?utf-8?B?b2k1RHhDOTlOd0k0ZUh4SFhoV09MRnE1eUZTdHgzR01vQzJWd0lZQmxkTjRy?=
 =?utf-8?B?S0FDV2tTRTFETk9uVXhQMlo0UW1OWWQ2am03L2t6MTkvWE5WNnZVdXVWOHBF?=
 =?utf-8?B?SlV2c1RJNFVIeWxEYkpCcXM3ajVHcEVlUWhSYUV3bXZyZTVaUkJkU2NDMmZw?=
 =?utf-8?B?K0EvVldzR1phcVQwUjZRem9VNDluNHRaYXRiUUVRSUhsVXVXcWlJTFUxMGxX?=
 =?utf-8?B?U3cva0wxS0JpZXNrelZrd1VzdXg4ZVNUdlpaOU9qSnhUVE5GRzh3dTNLeXFp?=
 =?utf-8?B?WE80YjBMS1J4cU56L2I5SGtWa3IwTm9sNUV1b3Q1MTZPVTFkYVRlZk9BYlYz?=
 =?utf-8?B?SHBvQ0FuKzRGKzAzT0Z4cXJwRVlTam5aNEdpdjNJbHlDYWgzYm5Sc0d4SXox?=
 =?utf-8?B?MU9ZSnJnY2hTREcvK1BxOEtKdDdmdmlZVmpSQ0g5WGxUeFhJS3cyQWRqdlZN?=
 =?utf-8?B?bDVlbWRDUWZYSGF3Vm5jaGtXbzdDN0d0TjVDOE5CcXYzaldTZHc4UW84dW5F?=
 =?utf-8?B?MFVHMG9rdDNZalVLUm1pdld5Y1ZSMGZFVnpMU1h3cnFWKzhDVUNhZ1A5Tk9X?=
 =?utf-8?B?UjBabEU5RVdoRm1WajlJakMyTmlHaU8wZWxueDdYTzhBSHFORk5PejFlZVVi?=
 =?utf-8?B?cWNBYmllbnBTVjBISjFvNzUxSmxIYXQ4c1hMQnJkUGVpV0hidTdBTEdoOUJi?=
 =?utf-8?B?dzBxTG9ieEtTS2NiRi9IZEhvQUE4cWR1MmZLUWpSaUtMVFJaRk5xVk54TXV4?=
 =?utf-8?B?RWozWmYyWElGdGdLWE9vRlQrdFBGcm9QNWM1aHBTNFZ0dG1UTDcwdlIzL1lt?=
 =?utf-8?B?MHd2dURDV1F6dkxYSmJNOHUvNWp4ZmRxMVRHKzBvOS95b01mT0NlS0tuTmhr?=
 =?utf-8?B?Q2FrM0tWVG9VOThYSENQS0RLRWFGVTE3YzNhbllIUUNleVRGb0tMcGFFZzRH?=
 =?utf-8?B?SXBpc0pNZkVnN0hDOFpPblliRE13S0xPTVJjcXBESTN1M0lMNHVtZlpJczZx?=
 =?utf-8?B?d1pwNFJ5c1Jyd1BLSVNsbmljNlp6VzVCUFpBbWprSXYwV1o5SGRnZzRCYlM1?=
 =?utf-8?B?UDd6M3NOZGtReThYTTF4K1llZUFoU3llRTd1N3NGZFZLcDBvR3Zta3FydUV1?=
 =?utf-8?B?Y0NoUWxXdXNjTUJEMFo5R2xxOWwxS1cyRE5KTUZtQWxpNVAyRjEvQ2srV1Nm?=
 =?utf-8?B?YWVJZnVydm8zaGhxNWJRbmhLRGs3OFNweTg3T25IRnQrRExiZkhUZVMrZWFU?=
 =?utf-8?B?OHFRZnMvak0wdkF5eXZpYk1mczRUbzFUUUcwd2NnbGpKRkZHUm8zNUVDSmV4?=
 =?utf-8?B?TlNFT1p0Mm5EWkNBTm1XZGxHQmIzZTVxSkRjMENIY1hYV3A5S01HQ2w2V1Mw?=
 =?utf-8?B?b1ZGdmY0a1hPeUFkYlFBa3NZazRBZDRlMVpMVFZNNlgwc3VSN09LeHZGYU1r?=
 =?utf-8?B?dmtDaVhab0QydVIrcnhKeXkrUXJ2NFVObXdDRU5uUEw2dGNZdHNpZzBPVTI3?=
 =?utf-8?B?VndpdzZ2OHNSQzRmWUVleTlkNzVvOHBMSTlBc1RCeituTFZaVnFia0JDdEw2?=
 =?utf-8?B?OEMrOUgyUi9GTXJxT25VWUkvZGl1YkVTWmMrek9zYWsydFMrblJUY2luSytE?=
 =?utf-8?B?THdaTWxrQXZab3IzQnRsb1J4UG1CRi8rRW5ZK3hHc0J6UFBzbGg1WHB4a0lo?=
 =?utf-8?B?RXFFWCtQZU9uWFo4NzVKNFBDT3BLbE90RUpIaldXcy9FdjRVckJZcDJEd2pl?=
 =?utf-8?B?NHNraHpNajhlZW5DTDY1U2ZIa29PZFRmOFZGcDlVbUhQTXU2d1d3MGt6RC9H?=
 =?utf-8?B?SDJSMnN5WHRzSDMrUjN5d2JDQUlQUENvVTQzT1JlZldwZGxrajhZTTNOYjV2?=
 =?utf-8?B?TWE2a0Q5Rlg3S2NtOGliNHFMOFgzY2ZZVzFuT2V1UUExYUV6STl3TGhySkk2?=
 =?utf-8?B?dWkwSU91NmY5Z0xlUk1FdlJ1ZUcva05nNDVQaDIvN3dIdFdITWRFVi9WYytx?=
 =?utf-8?B?K1VtbnlJME03Sko0V2tVOVRuVm8vbkZ6Z0hUTm4rTjlFYUhmZlZobkZ5L1Mv?=
 =?utf-8?B?L1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4E2A93F76D8CDC4A8E0A204902ACE986@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 76049d3b-3512-42a8-3c9a-08dbc97f79e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2023 10:55:54.6018
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cO3x4gmaFz9LdvBCZBXiZvskLrKH0+Q0A7vywjwIe/P97P3uAYRCoRbqjHI0UE6JVI2nOuoN2cr/H/KHyosaRbTbSB/6lG8Zt6OXr2lHhYI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB2048
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDEwLzEwLzIwMjMgw6AgMTI6NDUsIE1pY2hhZWwgRWxsZXJtYW4gYSDDqWNyaXTCoDoN
Cj4gQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1PiB3cml0ZXM6
DQo+PiBCb290aW5nIG1wYzg1eHhfZGVmY29uZmlnIGtlcm5lbCBvbiBRRU1VIGxlYWRzIHRvOg0K
PiANCj4gV2hhdCBtYWNoaW5lL0NQVSBtb2RlbCBhcmUgeW91IHVzaW5nIGZvciB0aGF0Pw0KDQpJ
ZiBJIHJlbWVtYmVyIGNvcnJlY3RseSwgaXQgd2FzIG1hY2hpbmUgbXBjODU0NGRzLg0KDQpDaHJp
c3RvcGhlDQoNCj4gDQo+IEkgdHJpZWQgcHBjZTUwMC9lNTAwIGFuZCB0aGF0IGlzIHdvcmtpbmcg
T0sgZm9yIG1lLCBpZS4gYm9vdHMgdG8NCj4gdXNlcnNwYWNlIGFuZCBJIHNlZSBtYXRoIGluc3Ry
dWN0aW9ucyBiZWluZyBlbXVsYXRlZCB2aWEgdGhlIGVtdWxhdGVkDQo+IHN0YXRzLg0KPiANCj4g
Y2hlZXJzDQo+IA0KPj4gQmFkIHRyYXAgYXQgUEM6IGZlOWJhYjAsIFNSOiAyZDAwMCwgdmVjdG9y
PTgwMA0KPj4gYXdrWzgyXTogdW5oYW5kbGVkIHRyYXAgKDUpIGF0IDAgbmlwIGZlOWJhYjAgbHIg
ZmU5ZTAxYyBjb2RlIDUgaW4gbGliYy0yLjI3LnNvW2ZlNWEwMDArMTdhMDAwXQ0KPj4gYXdrWzgy
XTogY29kZTogM2FhMDAwMDAgM2E4MDAwMTAgNGJmZmUwM2MgOTQyMWZmZjAgN2NhNjJiNzggMzhh
MDAwMDAgOTNjMTAwMDggODNjMTAwMDgNCj4+IGF3a1s4Ml06IGNvZGU6IDM4MjEwMDEwIDRiZmZk
ZWM4IDk0MjFmZmMwIDdjMDgwMmE2IDxmYzAwMDQ4ZT4gZDgwMTAwMDggNDgxNTE5MGQgOTM4MTAw
MzANCj4+IFRyYWNlL2JyZWFrcG9pbnQgdHJhcA0KPj4gV0FSTklORzogbm8gdXNlZnVsIGNvbnNv
bGUNCj4+DQo+PiBUaGlzIGlzIGJlY2F1c2UgYWxsdGhvdWdoIENPTkZJR19NQVRIX0VNVUxBVElP
TiBpcyBzZWxlY3RlZCwNCj4+IEV4Y2VwdGlvbiA4MDAgY2FsbHMgdW5rbm93bl9leGNlcHRpb24o
KS4NCj4+DQo+PiBDYWxsIGVtdWxhdGlvbl9hc3Npc3RfaW50ZXJydXB0KCkgaW5zdGVhZC4NCj4+
DQo+PiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGhlIExlcm95IDxjaHJpc3RvcGhlLmxlcm95QGNz
Z3JvdXAuZXU+DQo+PiAtLS0NCj4+ICAgYXJjaC9wb3dlcnBjL2tlcm5lbC9oZWFkXzg1eHguUyB8
IDIgKy0NCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
DQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9rZXJuZWwvaGVhZF84NXh4LlMgYi9h
cmNoL3Bvd2VycGMva2VybmVsL2hlYWRfODV4eC5TDQo+PiBpbmRleCA5N2U5ZWEwYzcyOTcuLjBm
MTY0MWEzMTI1MCAxMDA2NDQNCj4+IC0tLSBhL2FyY2gvcG93ZXJwYy9rZXJuZWwvaGVhZF84NXh4
LlMNCj4+ICsrKyBiL2FyY2gvcG93ZXJwYy9rZXJuZWwvaGVhZF84NXh4LlMNCj4+IEBAIC0zOTUs
NyArMzk1LDcgQEAgaW50ZXJydXB0X2Jhc2U6DQo+PiAgICNpZmRlZiBDT05GSUdfUFBDX0ZQVQ0K
Pj4gICAJRlBfVU5BVkFJTEFCTEVfRVhDRVBUSU9ODQo+PiAgICNlbHNlDQo+PiAtCUVYQ0VQVElP
TigweDA4MDAsIEZQX1VOQVZBSUwsIEZsb2F0aW5nUG9pbnRVbmF2YWlsYWJsZSwgdW5rbm93bl9l
eGNlcHRpb24pDQo+PiArCUVYQ0VQVElPTigweDA4MDAsIEZQX1VOQVZBSUwsIEZsb2F0aW5nUG9p
bnRVbmF2YWlsYWJsZSwgZW11bGF0aW9uX2Fzc2lzdF9pbnRlcnJ1cHQpDQo+PiAgICNlbmRpZg0K
Pj4gICANCj4+ICAgCS8qIFN5c3RlbSBDYWxsIEludGVycnVwdCAqLw0KPj4gLS0gDQo+PiAyLjQx
LjANCg==
