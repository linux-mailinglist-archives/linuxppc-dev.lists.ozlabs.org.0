Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1066F4F569E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Apr 2022 08:53:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KYFZf75ZTz3bdZ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Apr 2022 16:52:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::631;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0631.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::631])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KYFZB6LVSz2xVY
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Apr 2022 16:52:33 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QIDeudoKKk4cSH1Fz/KvCOtOqik9ibOjLORblXW31ra0qmNalVKRl6yigOuLE3ylTlgOw69UM8QExaV1/HT86Icg3HrjG+Rvb8e4ccrK8LQO9jsqVpJjsygKeNSds9zW1ldIBzc2nvo+IDn4+U0W4AoMTpVHX2/hi+JkhDbH+KMMxYO0OmSbK/uUc7+xemcz3CeagNLWIEm70J+/gdeV+UpvYj2l6WXAFrScENWN5beQwGNCc1hf4VFecSCpw5zLBjmsTg8zWdblrUuoTYk5UE2A1CKET4jkq0bEMnNW1htAIPg7wVD8li8CEPzQWyBUoLlKSHsaUnpDzeemmariSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s+Sx8qMZ2Xey/Koguy0eiSy0Fr2+G467DgaOcb8fMRM=;
 b=kj0dKeTDIC+wzaOzaJtN0FfLobAFP2gwKTGSk0Vh8KALXhtSMOlHyxPNDMDv/ORBo1w53GvBMCKSsZ3gZjkp6mh+DAYTOtCOX0ltMDaH8znLM1DOdq0PkkZX+mudIFj9ygY66wEYY4SJco1cmXMSXLVx2RsAUG9XURZ2lRIfuXLsL/cGKaQFIv85azKnmQZbMHyJpYn5ob5sGVZT5uBz5wplLMACod68UYZwAa8R0NPnebtGHcSQbCKQRhqHdNkcWlIL0CtGVQiKdJ6eLL1JHMntlZnN6qWRVTqh5X2qBcBsCyxHU7etfCA6u/gg7X6/gYPVnD+x3Sd1vDe2XIvh7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB3065.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:1a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.19; Wed, 6 Apr
 2022 06:52:10 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::59c:ae33:63c1:cb1c]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::59c:ae33:63c1:cb1c%7]) with mapi id 15.20.5123.031; Wed, 6 Apr 2022
 06:52:10 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Andrew Donnellan <ajd@linux.ibm.com>, Frederic Barrat
 <fbarrat@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] cxl/ocxl: Prepare cleanup of powerpc's asm/prom.h
Thread-Topic: [PATCH] cxl/ocxl: Prepare cleanup of powerpc's asm/prom.h
Thread-Index: AQHYRndqcBWSpozbLUWMUKe4L7pHjqzidlIAgAACaoA=
Date: Wed, 6 Apr 2022 06:52:10 +0000
Message-ID: <2147ad9f-2844-cef9-e804-e44cb619103e@csgroup.eu>
References: <a2bae89b280e7a7cb87889635d9911d6a245e780.1648833388.git.christophe.leroy@csgroup.eu>
 <d6cb3408-49a4-3c35-6ce0-3b35fd88bb9e@linux.ibm.com>
In-Reply-To: <d6cb3408-49a4-3c35-6ce0-3b35fd88bb9e@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 95b5b462-7a5b-4e0f-4b2b-08da1799f96d
x-ms-traffictypediagnostic: MRZP264MB3065:EE_
x-microsoft-antispam-prvs: <MRZP264MB3065618CF1385EFA4F71473AEDE79@MRZP264MB3065.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gqVzsPcdaC3TzTComKBpch4n7Mz+K5UiaHmpQFfTVmWCY67WCrFDjenp5nNsfhTed2/1EC3rLvf47k06d5bP9mPvameyDj0ZoRK8+l0WLdRB4A5H6IYRRmbDcdEmFksynNfsPBJKXLl5FZK7Q04MD2gjQrLx00NfaeN15gmKANnQBOG6c+AaxgaXNlQCU/wickUDeDmaqNsUdB/gZqTuiPkn1104McGyXsHMb169xcioh1YUlm0+Lb0k61ZHI3wyP4OUq/nY3pBCAb8PE++yBLIPrT3xwheuKlbPvo0CeJa9FThgaA4hMPhvR6StEefde6gqHlB1KL2OawmJ6b19yHq64E7Z6q8wugLAh0fUx122sU7YMDy0dwBj29V+pDTlS1jcoRpCGrVI44sMp0EFBh4e30GJCPA2pdDbPWnE5RQUG7+0Q68ydRsANdYg4SaD3ZTx2EtIOrjuo2MWlrGfWYrFMvwFp69knRLh74nvDGX9ZR8sa8+ow18kZr+y07ZXPUH5HWH97LDeAtoGQyla4EkaiTHRW9gnfUjL+qZAOy1QJm8UU/pQBwgcnYYJ28f6EEfBHC8PWP7NtWFLxryEkoCae8K+EIobuF9j7uDlSq4A4LNDV2DWdNn1+1z1z7ap6iBJvRGsmE82h8FwHVGVQDrrBzKKT2bwdJKJ0lGcLscCNtoxzaPwTIz4z42XZlwvu1cIPjqNkD5Uh0S90AYXmDvWEq4Q0bHj8XzYz3eDXysPQddsjnU05J2Usi57IqZQg8IAVUB3WREro2AJw0Riww==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(26005)(186003)(71200400001)(83380400001)(66574015)(64756008)(66446008)(91956017)(2616005)(4326008)(66476007)(31686004)(508600001)(66946007)(8676002)(66556008)(76116006)(122000001)(2906002)(8936002)(53546011)(6506007)(38100700002)(54906003)(6486002)(6512007)(86362001)(110136005)(31696002)(44832011)(316002)(5660300002)(4744005)(38070700005)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NVB4Q2U4QXh1RVZWb1V1L2VjOHF3QXhWWWhtM2dxM1FrMEJrVk5aL0FhUitn?=
 =?utf-8?B?ZFFMR3djc3RRZitWNTNQc0FaQ3VzV3VrQitMU1JvNm50bGpUZGVwM2EyZ245?=
 =?utf-8?B?VXRVUUpZMjVBczRxMGQxTzZSdHZ2NWZ3Sld6cGEyOGd5dkxuaDhDcFQ0SnhG?=
 =?utf-8?B?VDJQTVJFYzdqYmdxaXFlUFQ0S0M2bWJ3dUlVWjRlaThBZjJrQi82RFV5aUV1?=
 =?utf-8?B?WkRuc3BZMjZOYzVrWDdnajd4NEdRRVRaODVXWlZacEk0dE9hbXFJSEJMRGN6?=
 =?utf-8?B?bnRIVGVpOHo4ck0ybkQ4N01LYktSRFNIeFFhdjJ3TUphTXpORThSZjd2YnRj?=
 =?utf-8?B?NE1mVll3YnB4V0tqblVQeUtZS0FUZTdwT3Y3QVoycnpIRnpNTG1EaDRtblNs?=
 =?utf-8?B?TGdiamJXQXlHaVkwNDJRdlZpWVRTSTVwenZqTW83THFuRWRKYzc5WVlLS3VT?=
 =?utf-8?B?SDFZQ3JMYWhlVXNseFpOZ05CeisyVEsxMThJZnE5blhoUVlzcHR2ZkFCb09B?=
 =?utf-8?B?VDhkZ21NNHpUYmF4NnYwNGhNZ0YxSWlsbGMwOTgxZkc2SjgrdmFyT25vOHVH?=
 =?utf-8?B?bWJjSUN2YjdXMHBadHdGZEpQUUZTaTVVUlBrU3BBM0s4SDRxK2RjNnBYells?=
 =?utf-8?B?ZlBIMDhiQlp5TlhUZ2Q3K2FSUitkbVhjVU5LOVRyZEtTdUxaRkJxdEN1RmNN?=
 =?utf-8?B?MW5qY01PVzEzaUtraUZ2dE1hU3NTSGRmNzQ3TVlpNkNUK2pEV25SUnVVYytm?=
 =?utf-8?B?YkJPODJ1bFlrNTdLMTJuUTE2VWF6dEl1bUFUNmdaUzc1WW9aN2VyUnoxVFFX?=
 =?utf-8?B?cWpzWjZ1d0JkdkNwc01TOFlSbTFBQW5yRktYbjJaZXZ5RnhLSlVyQzV2Skp3?=
 =?utf-8?B?eXBmYTZZWEtSUUpVbm1Hc0s3d0ZvejBicHV6Y0xtQjVRb0tjUE5DTUNYVHpN?=
 =?utf-8?B?ampWTzM5bGpSYTJCblN3bUxKbEtZOGVlZk5XMFdZRWFBRWRJRCtwVnl4Tmlv?=
 =?utf-8?B?bmFNTnlPTDhHd0VNNlR2dVJpQ1lFM1NtcS9oUW9WWnlRNkp5dFlTNVFLbDZ6?=
 =?utf-8?B?Rk5wMGNOc0VzYndlY21RMzFxeHVuYjZzaHhPenFsUmdjM1BHMlJteFp2S2xq?=
 =?utf-8?B?aGc4QkpuMkdnTkhJd3FQbkUyNHdZQWFVMGRMbldGVGs2Vk5lWlVPeFNlcE1v?=
 =?utf-8?B?VmFyUEFkTEd3UGNtN2lhUnZwbzBwL0ExM0hXdGFlUWlvdnR3bjBOaGxLUkZT?=
 =?utf-8?B?ZFh3OWp5eTlwK3NsSElDa0hTMWdRMjJqOXpCdkdVdml6bXA5d21TSjZRMW1J?=
 =?utf-8?B?d3RGRmtmbUdPVE43WjE5MHJ1NUpOS2p6YmgvcFZ2L09oVEpTLzNjMEEreVB0?=
 =?utf-8?B?VUI0N0h3aEJwZU4waWNuU3hWdElWOWNXT1hoeHdNQlhUZEJ0MEw0alkzZ2V0?=
 =?utf-8?B?U1dlMGo2aGdqcVNNOVB0R0EzRVZOWWJ6c0paTmUxbDdVVlMxQkd6WDdIV2x6?=
 =?utf-8?B?aTFMOEdyMTErTDJWSldRekFqQkFNbSt6V1gwS2NtU1d6QUhaNXpGR1Yrbm40?=
 =?utf-8?B?S1pDZTVUR2RLT3VkajlGUmZPRW9jcGppY1RvMWMrUTVTbVJzelFsd0VPdzBR?=
 =?utf-8?B?NWc5V0JSbTYwN2djeHBIbFZPZGp2NTByd2FIb1dacmQ4aEhYRnRRV1VFV3lB?=
 =?utf-8?B?a2JhOElmZFg1eHdFUHU0WUQ1bk9lR1kwd1poZ0xHblMwdHV1VzUzeHMybnVr?=
 =?utf-8?B?aEpORFVnblRwdTI0YThFdjlzdGZpdm00TlNuY092YWF6L2ZkVFM0a0IwRVEr?=
 =?utf-8?B?QkJibi9ONzZ5WmJGMlFvYmNuSUNjNjRzc042SVpHNjhRRjVJRGJBeVVtQkVx?=
 =?utf-8?B?U1VaRklZZGJRaCtialZ4ZUY2ZkUrZjkvRjJEWFRaQ1hhL2NlaXZET2dKM2k0?=
 =?utf-8?B?MXVCbFo4Qi9ZMkR5cHFmeDgvQWFBQmJvN2VKeUF3eUZuelg1cjJjeXRGV3Zj?=
 =?utf-8?B?bU5wL1dBTjRtWC9jWWtZckNUWlMyWTU0U2RXSVhZRnF6c2E0WDJkYkJyVVdl?=
 =?utf-8?B?Q3BEUmFPV0NzSzlzV1lnTGdJUERXZHh6dWNtS0IyaUJIL0tnUnVOTTBqR0p6?=
 =?utf-8?B?ejJYaHAzZWU3dllpNVZwU0NmbGtwRXF5UTVwRTBSMk5RM0Q1VDAwZlpYN2N3?=
 =?utf-8?B?ZXAvenJzQ3FLVVJDM0g2Q0tQaG1TZ2hDdlRTcE9CYVhxMCtoUjZiZTZsNlIw?=
 =?utf-8?B?dW54SFB4ZW92V1pZcmVjQ0lTN2I3c3VBYldrUUVSUXRVMFNtSEN6cUNMeFho?=
 =?utf-8?B?K1VzWVpOZUZORFl1aDJOS2pZa2ppa3ltNEJGWDloaWpxM04rb21LT3ZtOEZV?=
 =?utf-8?Q?S8JdcB+Yee7gX5HpvQqByHxcXnRQwXM6KIoe0?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5F1CF9EE8B6B6A498A2CBD1E0A4EF1DB@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 95b5b462-7a5b-4e0f-4b2b-08da1799f96d
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Apr 2022 06:52:10.8158 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Vl8VzMdRQ/q/G53DmcBWP/NiJulY4veL35clTEeTOpesCw+YVUpplDLyADCNJZq13KgTqUJhtS7v9HuOWFLKbimLycRYUQWcC2fXlGVoGi4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB3065
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA2LzA0LzIwMjIgw6AgMDg6NDMsIEFuZHJldyBEb25uZWxsYW4gYSDDqWNyaXTCoDoN
Cj4gT24gMi80LzIyIDIwOjUyLCBDaHJpc3RvcGhlIExlcm95IHdyb3RlOg0KPj4gcG93ZXJwYydz
IGFzbS9wcm9tLmggYnJpbmdzIHNvbWUgaGVhZGVycyB0aGF0IGl0IGRvZXNuJ3QNCj4+IG5lZWQg
aXRzZWxmLg0KPj4NCj4+IEluIG9yZGVyIHRvIGNsZWFuIGl0IHVwLCBmaXJzdCBhZGQgbWlzc2lu
ZyBoZWFkZXJzIGluDQo+PiB1c2VycyBvZiBhc20vcHJvbS5oDQo+Pg0KPj4gU2lnbmVkLW9mZi1i
eTogQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1Pg0KPiANCj4g
VW50ZXN0ZWQgYmVjYXVzZSBJIGRvbid0IGhhdmUgeW91ciBhY3R1YWwgcGF0Y2ggdG8gY2hhbmdl
IHByb20uaCwgYnV0IA0KPiBub3RoaW5nIGhlcmUgbG9va3MgY29uY2VybmluZy4NCg0KWWVzIEkn
bGwgc2VuZCB0aGUgcGF0Y2ggdG8gY2xlYW51cCBwcm9tLmggaW4gYSBmdXR1cmUgY3ljbGUsIG9u
Y2UgYWxsIA0KcHJlcGFyYXRpb24gcGF0Y2hlcyBhcmUgbWVyZ2VkIGJ5IGFsbCBzdWJzeXN0ZW1z
IG1haW50YWluZXJzLg0KDQo+IA0KPiBBY2tlZC1ieTogQW5kcmV3IERvbm5lbGxhbiA8YWpkQGxp
bnV4LmlibS5jb20+DQoNClRoYW5rcy4gQ2FuIHlvdSB0YWtlIHRoZSBwYXRjaCB0aHJvdWdoIHlv
dXIgdHJlZSA/DQoNCkNocmlzdG9waGU=
