Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C6D569DFB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Jul 2022 10:51:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ldqs72Wfjz3c70
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Jul 2022 18:51:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=xKDLtiQ9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.59; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=xKDLtiQ9;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120059.outbound.protection.outlook.com [40.107.12.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LdqrP0j22z30Hf
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Jul 2022 18:51:00 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lw6PuhRYO4Ayf/vH5a9MTPu8g7+M7ZopjK4Hc757MKbNwaqv/xMtGYZG5BVHkwe7pmalGANBPZAvKRCLYdUhZNSe2ja7GwBDtWk9T4yzAK46GEcQ51b8NLJ/tJTeBbrOVoPUgZ50bAGhF8aza38iNgiOxu1z5xvFcQ26tu4ky4UgGo4oIyNav4zxiZ1cNT/DlraRhPEJ/BSJwL6s8OaKS8GicEbIZG69zHG9fLK12xbtvwCCgEiDlR1k2GPSdzOOMe1VXCU7vam/trnNOjDe4gVYYKcrefp04nk6Lm6mp0fafsUNK965OeICIRIuVJyxAsXpPOVVDJwRxIVZjhtlzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zwyANCOOBpur240MXGOB4l0BNr67sQ8lKCIVdSnxZa8=;
 b=eAB3L3Yv/v9RyZmwvz3uPnryRz++71yMa1SoYNM3J+aHekBBZJUUvddOgs4IDclk0TIuTzTOsTUYQ51szNJPpesrzNxPKACG/vKZXw0YLFyy8th5aYB6RKRo9PJDXbLR+5o9h4PuWOloLp4xdLOxOInCJZV7p63LQDZG/l8e5gAOMlEy4Hx3EPcAo6IP3rGdS44jbuHV4G4AvWt8ystH9cuEET/uBhJBZ+xM8A927C8maTr82cMckZ33BsKgfiXutBeetUVNysDTTilqg+xR8PHNjxJLiSVe+GYyZUAlXKLoMsclJoD1us5Bq/xcL8VyX0iIXayou3jlkNcVyEQe2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zwyANCOOBpur240MXGOB4l0BNr67sQ8lKCIVdSnxZa8=;
 b=xKDLtiQ9LQQ5czMh9Ttp24t3v20vA2gusN/68vm48pAhxNnim7kRgyNqBskctpmBlx9qjpX/4KMuhlywLEx1qQms0nYh8Vcg3uvqTQft5zPWB0wV4EGtDSMyeYGoYANxxXCvUzSlC4aD1qn/CIDkWlCDur3rfBzeQCaS8j0ZrXaTDGbpIVWaOlO901d6OrN8jbsWVoZHKGwJDKSR6hvVcH9pySmyHb8Qxaf6g7Uraejr+qNDy5coaiIKu1UMdQSus0jP2p2ROpyTJkK7EsKwgeNmssczefTBTTdjl0ygQL0mXmoJA8xV1ucogQeWXb38LunQ8j8VztOp2DrWQ3lA6Q==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB3531.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Thu, 7 Jul
 2022 08:50:42 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624%6]) with mapi id 15.20.5417.016; Thu, 7 Jul 2022
 08:50:42 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= <u.kleine-koenig@pengutronix.de>,
	Anatolij Gustschin <agust@denx.de>, Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/52xx: Mark gpt driver as not removable
Thread-Topic: [PATCH] powerpc/52xx: Mark gpt driver as not removable
Thread-Index: AQHYfqRI3PocWFyCBEqgLsp2SNr2eq1yv/2A
Date: Thu, 7 Jul 2022 08:50:42 +0000
Message-ID: <a6adb8c2-baaa-f7c6-f572-28cd542f06f8@csgroup.eu>
References: <20220612213400.159257-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20220612213400.159257-1-u.kleine-koenig@pengutronix.de>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4914ecb0-c609-4926-d238-08da5ff5c66f
x-ms-traffictypediagnostic: PR1P264MB3531:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  gRpEJj2aSPMelDgbAZk47276TMTRLOnIietN1rklady0By+S9eAw52YEEhdgI4dM/hJEKX+vXDWGR6NlOMhmaKicC9FQiuvI6BOFlfdWCg723NV9u1VVUnqJ4mCViENKhkLjDbW1QmhOLGfv2PxPiPdKReLdEDpkaiMV09/fblBgWgdfUY2E4JviEnaJN5mwm9HX1m94QietDiP1xoms3ouUaTB9jtAt7iexkAEVsa5FzLrOkZB39kpXisEqe8Sg/VB/0mQ8VJZSiHugrejCQSJMRcHig3kk+Xv72AcCk4WxAsLN2pioognNm1UTLJRtcavtDSFEq5hIXF0CIZW0fXwz9xHaTprHB71X4QWXijLmD4kciWprpvhI0e8XQaE/Dq6hFH5mR/WDXCa9hln8RP6e2r4a+jcDfesRQ2ktyXdiZAEQl9nVtJlW5mPEd3ZF5U8AWHd7Y0RrYoS10K6qqrEDVVi897TfKd3pTULz1+t9sMkLsVy6X60DVE2kQqoEiXLAhchk/t3HAKHt+bk4YOgO2Hl+mY0X7jr5X8aqku3k87AwKTfF1lGebDiCx95cVvgF+RtMVmUkxZx9a4DVrzUV/salDUG5WamRRoTEnXoJtuHun58hmK/NKl7+1v7UUPwmWqC/DiJlcTEhjz8mmlJLJe/A6UpkJbdL6vaH2PYsi5IQRlHd4g1pDZLOL6gdy8L1PwgfibPWiXcyYrdMnx7/cV0bTUFytlmNUbwGwAmdhFk6/NZzxmbmcpvtPxSFLIPqx4ywuSHO57T1Gf0ENztqovbpTLpCthcAVMUCbvbQZFg0bZjB984Czz6iev85N/Zp3kQBhnHMlyp+xL5sDcidqGsJ9IHnegR6XqdkHgaFKbLRnNyK+HVSnZiJ41me
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(396003)(366004)(39850400004)(376002)(346002)(76116006)(66946007)(316002)(64756008)(66476007)(66556008)(66446008)(26005)(91956017)(8676002)(4326008)(5660300002)(8936002)(6512007)(31696002)(2616005)(86362001)(38070700005)(71200400001)(6486002)(122000001)(478600001)(6506007)(38100700002)(110136005)(54906003)(41300700001)(2906002)(66574015)(36756003)(83380400001)(31686004)(44832011)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?S2VzT0cySEJvL1l3OGcwY085bVNBNDg3LzFDcXBNTWxUaFdrNVprakVTSGg2?=
 =?utf-8?B?YWJBYlZpTUlueGt5YTVuYWY5am1lL0g3TXNSZm9qY3VKNGM0TkZhSk5HSEZ1?=
 =?utf-8?B?TUhodTlvSnBtdEkyS0hHUExQc0ZSKzdwY1J3S3ZWdmszNGhGSlJzNFhCY2FN?=
 =?utf-8?B?TkdFMHAzMEROSlhBNU5SOVMzU1NpeFdhRFhrbVJnMUR1V3pPbEkwazJzeC9y?=
 =?utf-8?B?NzdZSDZ6SExlckZHcVlXaGdMVnFYUzl4YnBmMHEvaXZtU3ZrVEJDR2syNVBF?=
 =?utf-8?B?b2FTYjdSajg0NTQyRWJ2RE9JUmJrUFB4OG41V1dMU09ZeDIxaHNrRE1ENW1N?=
 =?utf-8?B?MEF3ZXV5cUNRVi9hdllGNGxJZWFDZCtqckZydVFUNllaNkpuNHVZRWVRSUor?=
 =?utf-8?B?ZWh2QmJMWmRkNlJEUkVDNUk1U0ZHR3BVOFpMdWdmSWRZSVludWxTeDdBSElt?=
 =?utf-8?B?N1JuUUtnQUFGRmd1ZnEyOFNUYTVmR2NuUFV6R0gyL240TTJrMm5ZbmgxZ1Zs?=
 =?utf-8?B?aGZjTFhJaCtOSHlPK2hXdDlKRUQ3dFU0OEtnazR3WE1wWHRFSHBkMHNKN2g2?=
 =?utf-8?B?dWg3NU92ZVlCc0JjRWg1cmdDUE9raldVMmVPZlVIU1djOUhpbldHdmFkZWFS?=
 =?utf-8?B?VCswQVkzYVk3aGR0dEE3MVRxT2dVeHpIYmxyci8yRVZFS0hvb1Z6SFk3TVll?=
 =?utf-8?B?cng5aDUydTJ3WlZuOGNzUG5iZ3huSCs3aVAwRERvU2piN2xqb2xXZXlzWEE3?=
 =?utf-8?B?aUJhb01kZ1ViajYwcGR3TU5QaXJvdm5LcFNYSWRXZ1I3blUrenFtVWVIazFI?=
 =?utf-8?B?TzM0V3hsdXRVY1lWWjRUKzJ4cEZmRWp1ODVaVVpJTGtYQUdKZlB6eUxRbGhn?=
 =?utf-8?B?bVQzOXNrUTVDVUphTG1hSjk2V1NmdUoydkxzVHk0N0FHUEZzV3BTblVUWXFF?=
 =?utf-8?B?Vk82WlVyVTEyTUJkMWdMemFaa1dyenpFMG1EMzJVbi9IQU02WUJjeWRQRS9O?=
 =?utf-8?B?aENGTVQ1NGJDSGFxUExHZ3pZbDJOaVBVdXRlUDJ3ZzNBeGdza2NBZmp3Snk5?=
 =?utf-8?B?NXd2RW1YYWxDSDdPajBmTXlSSGRZOXZKbWVQVDJHa0FUb2VvYWJBWkw5akc2?=
 =?utf-8?B?S3VidDV6YmRCZDF0eGh2U1RHampta05rSmkzQWFzaTAvRjdUNXJtSU1vVVh5?=
 =?utf-8?B?NkdHR1pwdjQ0eEpGcVVwdHVHNzljbHZ3NTUyeStpSTE3VjdCZTBZa05rZkd1?=
 =?utf-8?B?OFZoRjFyUjRRUFFmN3c4ai9STjdXQ0cySUZyazRoZHBWOFFEM1h5UU45MmFQ?=
 =?utf-8?B?d3hOTythdlp4M3VyeG55MVRWK1d2cElxRi9BYzkrRTAwb0hBM3pXZGJkeWxY?=
 =?utf-8?B?Nm54cFZ3cURGNitBSGRkc3c4aGlMalQ2WGxOc3o1YTBUdENmcEVLYlJveDl5?=
 =?utf-8?B?MTRWc1B4R2JvbnZoNWhhR0RiWWd1NitzellSRVBGT0hvaVVGZ0JmdkMzRGw2?=
 =?utf-8?B?eHBMeTcvd3JCZXNtU0RVUncvU0h4S3R3NWdyYUxKM05rdVYvcDczWGZQdzl1?=
 =?utf-8?B?MDk3QkZLL21TZ3FLVitQZU54UDU2V3dzOXZhMzdCV2hkRXVjN1UwRWRVMzdr?=
 =?utf-8?B?MUZuNkRxdmcwd2xUcG1MNnZkK0swaFFvSEdrbDRFOGtGNXFVemQ4T29kTVI5?=
 =?utf-8?B?Z213bTMyaGlDN3NRM1BiNWNzY3JUUWdPckNNRVdUT2dGWVh6dmdXQytkMlZR?=
 =?utf-8?B?b2J1dHdLZzdmMnZhZ0VjMkkvdGhhMHJiVEMwQ2xEWkw2RUI3Vkg3aTdrWU5o?=
 =?utf-8?B?dEJYQ29ZQ3dFR08waXB6ZjU4UVBHTGRlUHNwVmFTbXRjQWdQK1FBMW01UThE?=
 =?utf-8?B?NkMwNW0zL00wdXhwaGl0TXZZZnpwbThrb2NDbW9MU3orRGhRVnhFdmtobTNK?=
 =?utf-8?B?dGFyQ08zM2RWVE1Rd2VtbDBmbjl2WjRaMkNvKzh4V0I0bjZ0blA1SGR3TXVO?=
 =?utf-8?B?bFFRNkQrZHlMTU9wMHFPRVlaRGhaTndiTjhDbkZ2MUtHRzFKaTFpcW1waXJK?=
 =?utf-8?B?ZmJqTTd3ck5sNXUxUiszcjkvMG1nSkdadzVSU2VKK0dzcElibytTZW55eFFr?=
 =?utf-8?B?b1o3ZWJkUTlES281MmpzUnlqQ1BFa2xMaHVDbTJIVmppV21BVkRNaEx0bkNW?=
 =?utf-8?Q?1OGT18qel/XFBhHbPnkCX/c=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EF43E5B3C931FF4584BA6CB125493BF8@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4914ecb0-c609-4926-d238-08da5ff5c66f
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2022 08:50:42.6877
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DF+RRIvXx/Is6NdxOnqRHeaSfpXKvXVXUB+yMbnAEpsex2IuekHysqmJdsz/+mxL8UfJef2E22P0jr89F9B737aR3rlusKMg+faLesl9gBM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB3531
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Paul Mackerras <paulus@samba.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDEyLzA2LzIwMjIgw6AgMjM6MzQsIFV3ZSBLbGVpbmUtS8O2bmlnIGEgw6ljcml0wqA6
DQo+IFJldHVybmluZyBhbiBlcnJvciBjb2RlIChoZXJlIC1FQlVTWSkgZnJvbSBhIHJlbW92ZSBj
YWxsYmFjayBkb2Vzbid0DQo+IHByZXZlbnQgdGhlIGRyaXZlciBmcm9tIGJlaW5nIHVubG9hZGVk
LiBUaGUgb25seSBlZmZlY3QgaXMgdGhhdCBhbiBlcnJvcg0KPiBtZXNzYWdlIGlzIGVtaXR0ZWQg
YW5kIHRoZSBkcml2ZXIgaXMgcmVtb3ZlZCBhbnlob3cuDQo+IA0KPiBTbyBpbnN0ZWFkIGRyb3Ag
dGhlIHJlbW92ZSBmdW5jdGlvbiAod2hpY2ggaXMgZXF1aXZhbGVudCB0byByZXR1cm5pbmcgemVy
bykNCj4gYW5kIHNldCB0aGUgc3VwcHJlc3NfYmluZF9hdHRycyBwcm9wZXJ0eSB0byBtYWtlIGl0
IGltcG9zc2libGUgdG8gdW5sb2FkDQo+IHRoZSBkcml2ZXIgdmlhIHN5c2ZzLg0KPiANCj4gVGhp
cyBpcyBhIHByZXBhcmF0aW9uIGZvciBtYWtpbmcgcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrcyBy
ZXR1cm4gdm9pZC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1Lmts
ZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+DQoNClJldmlld2VkLWJ5OiBDaHJpc3RvcGhlIExl
cm95IDxjaHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+DQoNCj4gLS0tDQo+ICAgYXJjaC9wb3dl
cnBjL3BsYXRmb3Jtcy81Mnh4L21wYzUyeHhfZ3B0LmMgfCA3ICstLS0tLS0NCj4gICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDYgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0
IGEvYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy81Mnh4L21wYzUyeHhfZ3B0LmMgYi9hcmNoL3Bvd2Vy
cGMvcGxhdGZvcm1zLzUyeHgvbXBjNTJ4eF9ncHQuYw0KPiBpbmRleCA5NjhmNWI3MjcyNzMuLmIy
YzI0Y2FiNGIxZSAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy81Mnh4L21w
YzUyeHhfZ3B0LmMNCj4gKysrIGIvYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy81Mnh4L21wYzUyeHhf
Z3B0LmMNCj4gQEAgLTc1NSwxMSArNzU1LDYgQEAgc3RhdGljIGludCBtcGM1Mnh4X2dwdF9wcm9i
ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpvZmRldikNCj4gICAJcmV0dXJuIDA7DQo+ICAgfQ0K
PiAgIA0KPiAtc3RhdGljIGludCBtcGM1Mnh4X2dwdF9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2Rl
dmljZSAqb2ZkZXYpDQo+IC17DQo+IC0JcmV0dXJuIC1FQlVTWTsNCj4gLX0NCj4gLQ0KPiAgIHN0
YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIG1wYzUyeHhfZ3B0X21hdGNoW10gPSB7DQo+
ICAgCXsgLmNvbXBhdGlibGUgPSAiZnNsLG1wYzUyMDAtZ3B0IiwgfSwNCj4gICANCj4gQEAgLTc3
MiwxMCArNzY3LDEwIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIG1wYzUyeHhf
Z3B0X21hdGNoW10gPSB7DQo+ICAgc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgbXBjNTJ4
eF9ncHRfZHJpdmVyID0gew0KPiAgIAkuZHJpdmVyID0gew0KPiAgIAkJLm5hbWUgPSAibXBjNTJ4
eC1ncHQiLA0KPiArCQkuc3VwcHJlc3NfYmluZF9hdHRycyA9IHRydWUsDQo+ICAgCQkub2ZfbWF0
Y2hfdGFibGUgPSBtcGM1Mnh4X2dwdF9tYXRjaCwNCj4gICAJfSwNCj4gICAJLnByb2JlID0gbXBj
NTJ4eF9ncHRfcHJvYmUsDQo+IC0JLnJlbW92ZSA9IG1wYzUyeHhfZ3B0X3JlbW92ZSwNCj4gICB9
Ow0KPiAgIA0KPiAgIHN0YXRpYyBpbnQgX19pbml0IG1wYzUyeHhfZ3B0X2luaXQodm9pZCkNCj4g
DQo+IGJhc2UtY29tbWl0OiBmMjkwNmFhODYzMzgxYWZiMDAxNWE5ZWI3ZmVmYWQ4ODVkNGU1YTU2
