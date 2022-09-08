Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E085B1494
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Sep 2022 08:22:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MNTYR49Y0z3bkx
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Sep 2022 16:22:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=DNiICywq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.55; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=DNiICywq;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90055.outbound.protection.outlook.com [40.107.9.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MNTXj5dBBz2xJS
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Sep 2022 16:21:24 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b0AHeFLCrIAnuWt/Av0LSb0BYIsWabrOJclpyDVV7PGEI41BK8YFiGCLdUc2663KQzaPk/rxry35k4+5y0RYGjicdhtbQ4M9LpeJGyNuYLpMJXuAFwhLh7UGRnFfYyuNz7/bfeFkeUeSreLv5WkEyfYKo0ipJru6hR0aeinOHxDLtdIo+Fl/w3/2WUed9q7wWJMD4Vr1sJpJ1IDeDala4qzLjVcf89sSn9JYm3U4EazIdw6ErjW0WtWcld1qmCeOeaH8u4UkJb1BtZqWKk2P4//scMO3s8cUAH+43vvZaI3CwDv3bkLwn5ulNh/Y3CgB1Tov0t8f8cmKGhRiqeMQAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HWwRNOm+X1caotJs5Yi5xEzKH1bXbrkOzk3lVfOHluA=;
 b=PN7bdV1KF/0H+4MlEi/fulXmf6QEciWEiW8xH6lHJMXaCnW1+qIh2RfLBm/s5slDrR0y8J/7LwazxfkmVSWR8rUC34NoI0zcsPBnjVqr408RGZc6pZ4WN0oY8OTXIlAGqXdwumuZvsHpydluwFj/VJ64O6h2o6C10HeT9GL7+AzPE6NgA55XLdW+iMDt3vYt/XwX5XQr4WkKd4jKEAx6R3eM1CayD/xxnIJapb37ZGbjus8lUSUn0Nevgn4HBKuYYvDeCWDL0aNxBwcq1W1ks966P7a9ThRFuhI6bCnbtTP2xogXNz13gWAv39ydHKQzQwIOQHDkkrmCLeVHAtubcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HWwRNOm+X1caotJs5Yi5xEzKH1bXbrkOzk3lVfOHluA=;
 b=DNiICywq8n6Eo8YbMuodxabBwWEAmlya+9dYYfOtmuCZDZNPzwHbZmunBVAdjZEQpFls7yzy9Wb3J+NK3zMFssXVdQGZHVY27EBCWy3CYF18bL3WFjfrYT3Yj7Tm+YwF186E0hAHlnvK3DHo28L/GyFj3pf9ZxSIcFoKvgfuyJhSh2YkHt74/R5lJUND+ReRsswJQl9cSNd3OHSWMbzUz07ltf474LaJfUEt6NUU+RfIz5X7qs63y8/zhOQiAXOpZl/nLkeE9YMO7TrqGgjD6BMMokJJjL423Xum+4yMeV0cVyoE9bBqCmE12j1o7K5UdrwRBHhV0l0bClWBY1TyMw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2171.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:166::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Thu, 8 Sep
 2022 06:21:04 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8%4]) with mapi id 15.20.5588.018; Thu, 8 Sep 2022
 06:21:03 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Defang Bo <bodefang@126.com>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
	"benh@kernel.crashing.org" <benh@kernel.crashing.org>, "paulus@samba.org"
	<paulus@samba.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"geert@linux-m68k.org" <geert@linux-m68k.org>, "rppt@kernel.org"
	<rppt@kernel.org>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] powerpc/mm: add sanity check to avoid null pointer
 dereference
Thread-Topic: [PATCH] powerpc/mm: add sanity check to avoid null pointer
 dereference
Thread-Index: AQHYw0sr23Haiy42wUqaWSB8f5qA2g==
Date: Thu, 8 Sep 2022 06:21:03 +0000
Message-ID: <48e444b9-ccdd-2aac-4cc6-3d9b75e90005@csgroup.eu>
References: <1609125050-240351-1-git-send-email-bodefang@126.com>
In-Reply-To: <1609125050-240351-1-git-send-email-bodefang@126.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 47925356-b2d2-4422-de7d-08da91624e63
x-ms-traffictypediagnostic: PR0P264MB2171:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  AxXyYuCVtdIvbuv5ttYIV8Df2V+2wxTH0UHRndW2H8oCK0SyVlq9/QGIgaRcZliVAcl5sBCx0DkEJbUHEgh73sZD+t8LRYDsE9Hl9WrtWz8D5+J8nCY9Rp9KEckXg7x91yYtgfWucRXMHmL/tQst91FFiA6YMhpbOFXA6MQO6v4MgXcATM1Dv3lZ3vbLMbV4M2q9SxLZQAPt69pUPlqsWn1Op5Xf7zFwB2F0PrdW+wFscR+9+y1dUeuI9ZUgE2a+JJew4OSx9PpfvC89WCD2pAE+NT4l7jXON1LLfftBYxOOUJOfGI7a0QdcaJMKYTjpmiY1rfSAIud/SRW8d1n/tc2hw8JTBLxhO9rzyLen7N7GbvZ6cogT3B8kJFtDfLL8HCmxxYK6qjuDd1loUiYzlhmDXOy15DFOeNkopPv84oxBgccxAZYvm4txwslwdezALfH9MlwSA0VLzCNEE2y8uTRAjWRbEKD7kwNU7+hFZtmSplCLxVBx5JyMC4YYUDLD7rx7sOorDPqTE8EtY8g8eNHNXz1k1Y4rGiFumGMjvPItO+Wq1RAFkOIZ85toZsLltCCCommhSX6g7pO4F6A3O/YBeSc0gQSEqb1vbr6rEqAemlon+ihEcVNwwcAd5dfscsBYPS8eicPxQ4V9LbOz919Q3LKWq4DjFO8Qg4+6XZg2HSTt4Vxuv/kdQ/0cdjvkrsZZ77c19j+Y59t6IaN4m10yu0XkRijPKTlLVR+ZDHStIypVsLDabIZobaJG60IA63kun8en750s2eXBVgzXi5q0CeksO44JVYL388ge1gOvwf/FyjZJqb9PGtenHzI3O6Pdwxw5hJmw/+13y+j0HA==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(39860400002)(396003)(366004)(136003)(8936002)(41300700001)(2616005)(5660300002)(26005)(6512007)(2906002)(86362001)(6506007)(31696002)(38100700002)(44832011)(122000001)(38070700005)(66574015)(186003)(83380400001)(8676002)(36756003)(6486002)(66556008)(66446008)(64756008)(66946007)(110136005)(316002)(31686004)(91956017)(66476007)(76116006)(478600001)(71200400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?Z2pvdGVpTjZWT0JxQ2MyRDlzQ0tBc3RGV3FHV21tUWM4bHcra1RHZ3lra3lm?=
 =?utf-8?B?S0hQeHBnQTZiVmYzOVlzTE14ZTVqT2ZhaVVYYmlLK3RhY1E3TGtKZTl2QzNh?=
 =?utf-8?B?OWdFc3FRc3MraXgvTFNPZkN6ZklyRGVxWU9oZUhIeTJPRmI2Z0k4V1Y2c2NZ?=
 =?utf-8?B?SXBMRy90cnBuU3Fkc1FVekx4QkZuNEFHT3lWYVE0K2Q4Y2wyUUY4aEZYS0xI?=
 =?utf-8?B?dGp1RDZZV1NTcEpCdGw2ZzYwOFN3RzF5eW9Rb1pmemJGRi9jQnp0Q2hsaEJG?=
 =?utf-8?B?V200MmhabnhYeExUNkU5dE1XN1dwYjdNUloxcE9uSVNTR0tTdmNxR3E3aE9Z?=
 =?utf-8?B?Ly96a2d5dFJpZVFCR3NuUnBoRGFCU1RlRVE5bDczOUM2SGgzQ2ZRWGYzb2Yv?=
 =?utf-8?B?eStmRXdlMVVydkNDSEs2WEltVW1GVHFkMnJUMWR5MTA3Qm14dkpiNXpnR1VO?=
 =?utf-8?B?REFzdHJKR2FSWUZBU210dSszT1hpL21HUzhHaFJtTjUvdytKN3pQRGtqa2x2?=
 =?utf-8?B?UUJ1b243VW52YXUyWnZYWlFFQVM4OHdwUnJLVlphWFJha3FYa1hSQmxIV1FZ?=
 =?utf-8?B?RmR5SFdaWEw4WFI4d1pFL3Ywano1Njlab0tnbGpFU0RzamM1WXlCekpoOVkr?=
 =?utf-8?B?ZEdDN01SYllnSzZwc21iZEE2T3FrWTB2UXl2WXpxektVVjFOYWhtR1h1ME4x?=
 =?utf-8?B?SG9LZituZnBOQTZ4eVg0YWs2b1E4djlUaU9xYnNqcVZ4dWdiaTE4anpyQ2t6?=
 =?utf-8?B?ZWxwM1JFcW8yeUtOeEMwN1BnTTZqNTJ1ajhLWXF4d0xrbDhQMGhDU0t1eE5r?=
 =?utf-8?B?TW5EcFB4STluMFdaaXJxd050aGpuMDgvTk1URjRyajNmZUFWRnRza1FLcm54?=
 =?utf-8?B?bXFQVXlVdmFWTkpjcXN5WmlaVUxvanhTK3JDN0FvQ3o2S3lxcnZ1NVJSNnJK?=
 =?utf-8?B?Ym9MeGNueEdlNGtMSk5XUnRvUEhKRHl5T2JGMTQ4dmFxNGJ4cE5DMm5zTTJz?=
 =?utf-8?B?SzVYQlNxbG81NjhGVStYWTQ3NlloQ1hZMjBnenVkdE1nbVhRWVBEUnd5SmxQ?=
 =?utf-8?B?UDd3bW9pak9mSmoxemMvVFY2aGJUKzdQb3BZcHNPaG92Y3dNdmZEL2tRUVUw?=
 =?utf-8?B?RDhyb0h3NmpzOWVFZDBKNytjZ1N4bzJEQWZPdFVrQm9OVWZwSmFKN0xIbklV?=
 =?utf-8?B?eWt5RS9NMklpcytPR1E4L3hCMFBmSzJxNFZkYXJyVFRwcTZ4akdLWGRiZlJK?=
 =?utf-8?B?b1J5eE9HVUVVSWVUbVNod3IwcWFYWGxndmxlOXR2eEFpcmFCVW94MEpiN2RX?=
 =?utf-8?B?M0tIdVRGTHFwVWNBaXhSSlFubjNsYnQvdFp5QWxnNjZTdThlZmh2RzQrdDJ6?=
 =?utf-8?B?c2k2Mk9ZbTdTQzRzWE9NMFREWjVvd2pBbUZMeldiQWpEUXBLNXBXU3lwM09i?=
 =?utf-8?B?bTdINnZJVHQ0S2lnVlJ2UitoVjJnZFFZdTFXY1J5cU9IZ3ZyZnc2V25QYnZC?=
 =?utf-8?B?V09uTjVHVjJmWWh5N3BoWmpNOE1XQ0lBdm1mSFBOcWNVNGJ6RFhma2RBOHVh?=
 =?utf-8?B?ODdOMGF1UG9rdHl6UEVTSGZUK0tuMFg5Y2RReHV2M3hVNUkzdFRCcURMYlRx?=
 =?utf-8?B?ZHplRDRYeWczR01TU2s1ZnZmd3BaR0tmUFFBY2xpSEhReTc4UnNUcGxKazJ5?=
 =?utf-8?B?a3ZDbE1oWWtMNnVxM1BpdmNPWWk4MEo3NXlSdUY1S3ZqWjIrUFp6eGlncndR?=
 =?utf-8?B?RUt5U3dNTVRlQXpYSG4wOHorUisxd2dLamVlMndrZG5tNmxsZUpNazlvdWJQ?=
 =?utf-8?B?UWxsN2hFSXdJekQrQU9RZTFvYWxyYjdrdFBnTHZXMncwcS9WT3ArN2o4VDV0?=
 =?utf-8?B?anBZdEp5MUw0Unc1aXdRMHhUUzFkejNLVnYrWHRqOVA1ZTd3Sm10TUVSYVVY?=
 =?utf-8?B?TVVEQjJFVW9qMUtUa1NOQkZxYktidEEzcVlDc29WZmdCSVU0ZzhQckFyWHc1?=
 =?utf-8?B?TUN2V3o0bFZDZk9ZVTZyV0hjNlNFVFJCbmoyc2dZVFF5MVg2TSszUUlXTExQ?=
 =?utf-8?B?ZmhlQmFiUGxra1VlS1FENm9kNUsySGgzWHppdXVqZ2NVYU5qaDhtbXlZSUg3?=
 =?utf-8?B?Y2hzNHE5enhqTmppRTE2R1lyZ3dQU3dFQ2NPUW5sZ3dHRnlBOWN4N0tCKzZn?=
 =?utf-8?Q?IlLtnhjGlp/0fXY+anrjpXs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D10C2156A9A6F742B8FD5E21F4D37B3D@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 47925356-b2d2-4422-de7d-08da91624e63
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2022 06:21:03.4024
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sJ5VTK8Tg5VsUrGLWR9KX549VuxsSMWFPgNl6ewkKDYVROB4bGm/+O0q2h91n2AYh5JFBKoWKNb0LljL7SnNDkDjLhFziy8H63ZndsRnSZA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2171
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

DQoNCkxlIDI4LzEyLzIwMjAgw6AgMDQ6MTAsIERlZmFuZyBCbyBhIMOpY3JpdMKgOg0KPiBTaW1p
bGFyIHRvIGNvbW1pdDwwZGMyOTRmNzE3ZDQ+KCJwb3dlcnBjL21tOiBiYWlsIG91dCBlYXJseSB3
aGVuIGZsdXNoaW5nIFRMQiBwYWdlIiksDQo+IHRoZXJlIHNob3VsZCBiZSBhIGNoZWNrIGZvciAn
bW0nIHRvIHByZXZlbnQgTnVsbCBwb2ludGVyIGRlcmVmZXJlbmNlDQo+IGluIGNhc2Ugb2YgJ21t
JyBhcmd1bWVudCB3YXMgbGVnaXRpbWF0ZWx5IHBhc3NlZC4NCg0KSSBkb24ndCB1bmRlcnN0YW5k
IHdoYXQgeW91IGFyZSB0cnlpbmcgdG8gZG8gaGVyZS4NCg0KSW4gY29tbWl0IDBkYzI5NGY3MTdk
NCwgYSBjYWxsIHdpdGggYSBOVUxMIG1tIGlzIGV4cGVjdGVkLiBUaGUgY29tbWl0IA0KanVzdCBy
ZW9yZ2FuaXNlcyB0aGUgY29kZSBpbiBvcmRlciB0byBiYWlsIG91dCBlYXJsaWVyIGFuZCBtb3Jl
IGV4cGxpY2l0ZWx5Lg0KDQpJbiB5b3VyIHBhdGNoLCB5b3UgYXJlIGFkZGluZyBXQVJOX09OLCB3
aGljaCBtZWFucyB0aGF0IGJlaW5nIGNhbGxlZCANCndpdGggYSBOVUxMIG1tIGlzIHVuZXhwZWN0
ZWQuIFdoeSBkbyB5b3UgdGhpbmsgaXQgaXMgbmVjZXNzYXJ5IHRvIGRvIGl0IA0KPyBIYXZlIHlv
dSBlbmNvdW50ZXJlZCBhbnkgcHJvYmxlbSA/DQoNClRoYW5rcw0KQ2hyaXN0b3BoZQ0KDQo+IA0K
PiBTaWduZWQtb2ZmLWJ5OiBEZWZhbmcgQm8gPGJvZGVmYW5nQDEyNi5jb20+DQo+IC0tLQ0KPiAg
IGFyY2gvcG93ZXJwYy9tbS9ub2hhc2gvdGxiLmMgfCAxMSArKysrKysrKysrLQ0KPiAgIDEgZmls
ZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0t
Z2l0IGEvYXJjaC9wb3dlcnBjL21tL25vaGFzaC90bGIuYyBiL2FyY2gvcG93ZXJwYy9tbS9ub2hh
c2gvdGxiLmMNCj4gaW5kZXggNTg3MmY2OS4uMWQ4OTMzNSAxMDA2NDQNCj4gLS0tIGEvYXJjaC9w
b3dlcnBjL21tL25vaGFzaC90bGIuYw0KPiArKysgYi9hcmNoL3Bvd2VycGMvbW0vbm9oYXNoL3Rs
Yi5jDQo+IEBAIC0xOTIsNiArMTkyLDkgQEAgdm9pZCBsb2NhbF9mbHVzaF90bGJfbW0oc3RydWN0
IG1tX3N0cnVjdCAqbW0pDQo+ICAgew0KPiAgIAl1bnNpZ25lZCBpbnQgcGlkOw0KPiAgIA0KPiAr
CWlmIChXQVJOX09OKCFtbSkpDQo+ICsJCXJldHVybjsNCj4gKw0KPiAgIAlwcmVlbXB0X2Rpc2Fi
bGUoKTsNCj4gICAJcGlkID0gbW0tPmNvbnRleHQuaWQ7DQo+ICAgCWlmIChwaWQgIT0gTU1VX05P
X0NPTlRFWFQpDQo+IEBAIC0yMDUsOCArMjA4LDExIEBAIHZvaWQgX19sb2NhbF9mbHVzaF90bGJf
cGFnZShzdHJ1Y3QgbW1fc3RydWN0ICptbSwgdW5zaWduZWQgbG9uZyB2bWFkZHIsDQo+ICAgew0K
PiAgIAl1bnNpZ25lZCBpbnQgcGlkOw0KPiAgIA0KPiArCWlmIChXQVJOX09OKCFtbSkpDQo+ICsJ
CXJldHVybjsNCj4gKw0KPiAgIAlwcmVlbXB0X2Rpc2FibGUoKTsNCj4gLQlwaWQgPSBtbSA/IG1t
LT5jb250ZXh0LmlkIDogMDsNCj4gKwlwaWQgPSBtbS0+Y29udGV4dC5pZDsNCj4gICAJaWYgKHBp
ZCAhPSBNTVVfTk9fQ09OVEVYVCkNCj4gICAJCV90bGJpbF92YSh2bWFkZHIsIHBpZCwgdHNpemUs
IGluZCk7DQo+ICAgCXByZWVtcHRfZW5hYmxlKCk7DQo+IEBAIC0yNjgsNiArMjc0LDkgQEAgdm9p
ZCBmbHVzaF90bGJfbW0oc3RydWN0IG1tX3N0cnVjdCAqbW0pDQo+ICAgew0KPiAgIAl1bnNpZ25l
ZCBpbnQgcGlkOw0KPiAgIA0KPiArCWlmIChXQVJOX09OKCFtbSkpDQo+ICsJCXJldHVybjsNCj4g
Kw0KPiAgIAlwcmVlbXB0X2Rpc2FibGUoKTsNCj4gICAJcGlkID0gbW0tPmNvbnRleHQuaWQ7DQo+
ICAgCWlmICh1bmxpa2VseShwaWQgPT0gTU1VX05PX0NPTlRFWFQpKQ==
