Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52FDB804271
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Dec 2023 00:15:39 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=g61Lyn2D;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SkffJ5qGdz3d9H
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Dec 2023 10:15:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=g61Lyn2D;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::61f; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on2061f.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::61f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SkfdS2MCtz303d
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Dec 2023 10:14:51 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oJ/0pCnYXJFbZj3ZQ1izvG5wlXmhSk8D84XpZENEgLYefcrT7sIC6L1bHQgL+3UrKIfJCXwKXae6u4HJjf/vgOp4QkVcUimGaAryi3heU3l+HhHZbs1TlEOKov1UBlJIIyugOqeaYvn74q173fLQYOC1U5Wdf/vwZQAKN0cqGOdvqHzOl4CoQMPLzeIAi8TtHvzTMhQl0tAHA71rHu3vsyOrCzL+yX0+2/nnWCIszU+OVeB/qofysKKAsErbymlgxYKxdQLueB+qKY4TqoYLFbjs8eprX1/zGptF0Bu19zJ9PxdzbvvTgczFrpt2GOAcjmhnhoEJAUtdMIMesv9clA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V53ZhTLKUJ23xPrys1R1xt8xfYQ1aEAmMDv89Nm43Lw=;
 b=OFOCyxYP2SJMX0hGdEfk3gQGGjIeeeTL4RwR/sXcuG298zdDw3x9z8mXluN5g2FU3Sy6FA2+UxbFNGjUcEgGSWb7ca2RD8b82OtJed5vzR6O1jzbFCqW6jrtgNuDIUQuLIVcR2JrJ9sBi6b96vI4oBEWRJ27eRKVJg6tgEaRWiBAzuXhT3kB2gIBCPSClnQhkixyFVK04lndHEPh0M8iHIJV4fhkmsXIYp8lFig6ZXtmijv3EeI/SwxOmsDBNpCPfJEcmpzJOe7y3UNVmekXhHaMF6CL2gsWHzhOI7mZU3B7nFeVwgGel/1zFYLVTynqypz4+s1WlIzzs+WXgbI4VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V53ZhTLKUJ23xPrys1R1xt8xfYQ1aEAmMDv89Nm43Lw=;
 b=g61Lyn2DBAjARJH1fuK2gsKlqv2vPtWy5dFoLATfB91KkB0Vlrkow4k/m9ZeDo1J9pIRSNmj9hHx3by3HJlFSWTBmAvXQRrw3+HNjby+QOsGAui0DC+EgGpznsfghTatDdvQ1UtissW0ZI7YBq89PD851sGI43qknBE5JWDbPmyDMLqV/uv+H8kDDbLPqPxPIsCz0gpx3i0PTWCfb6Wj/KqoHruZcd5oP/WZLyyE/JL9LQYRNHlvnKUetZJb8ts4giMhRpLCVmvgq8tymM0jSzXi+LjlGD98OQOXdlg9y6VOZFc862sgTDKQiP0XIca/lQBgnG34NhGSh4jFCV93Og==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB1853.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1b3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.24; Mon, 4 Dec
 2023 23:14:31 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5bfe:e2f2:6d89:8d97]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5bfe:e2f2:6d89:8d97%3]) with mapi id 15.20.7068.022; Mon, 4 Dec 2023
 23:14:31 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: George Stark <gnstark@salutedevices.com>, "pavel@ucw.cz" <pavel@ucw.cz>,
	"lee@kernel.org" <lee@kernel.org>, "vadimp@nvidia.com" <vadimp@nvidia.com>,
	"mpe@ellerman.id.au" <mpe@ellerman.id.au>, "npiggin@gmail.com"
	<npiggin@gmail.com>, "hdegoede@redhat.com" <hdegoede@redhat.com>,
	"mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
	"andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>, "jic23@kernel.org"
	<jic23@kernel.org>
Subject: Re: [PATCH v2 03/10] leds: aw2013: use devm API to cleanup module's
 resources
Thread-Topic: [PATCH v2 03/10] leds: aw2013: use devm API to cleanup module's
 resources
Thread-Index: AQHaJty4M77gdVcqG0eKNQXPR9dINLCZwYmA
Date: Mon, 4 Dec 2023 23:14:31 +0000
Message-ID: <9851ccdf-7105-4531-80d4-199ef3496af5@csgroup.eu>
References: <20231204180603.470421-1-gnstark@salutedevices.com>
 <20231204180603.470421-4-gnstark@salutedevices.com>
In-Reply-To: <20231204180603.470421-4-gnstark@salutedevices.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR1P264MB1853:EE_
x-ms-office365-filtering-correlation-id: 529fe90c-796b-4b07-a0db-08dbf51ec593
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  ee3lfz9pM/EToG5fNmFvC3wADJdOVKbzpG2R2qyjUxFsIkdylPxpWf//bJQTRgKPwhJ2hNNGtLkdW963A8Ki/mUlL8gcCp+IeI9BKDcGYvS3PfHU3MKFwf/7WerLKgcOIuhWpqMta4b/jGlK+PDq0sghh4T6/0yt45WNAX89Whl1C0ltMr9AhBZGnrfmR2mT/3at9wppN8xwOtYaajHH4/6g/bqg0iqD+1aJ6YGa5wRDBkn9TIwYG1gML4aj/z1I5HngIZLuihiam2aqXoFGD257J3cnqYkeeoxcRaSYyRav1G/CGNkwtkzCSQRfvMK9yf/6WZBlsmLp4k3z/5tFS2E3BKEfBqJnAhfyaD7sulp0xSzpRCJ54Kq96T35w2Vv4CIAS7iKM/jwBsPRwaqFMI9rEiGG5/rSksOYZpc1gmjnzNWlaWfnulFUbmITCfB8gExqyA+DVHJRHERUeTjM3vYqzhOVsl5lJA8HRt1Sig/IrHuOa51sXs8RCzg7x/M0yPslLxZkK7hBUWdAJkSHCz1R8fz3PoFVZ1pUmip1OolyF+lbG8jMd9NAjaML88HmbVXHY5aiIqpfCtGPRFbxb7tzZDWiB31BJmA1/iZgkYvFkDWaWiNqe2fTqT11erDt9SDxBhlfd3q3+NABSznW8R32zrHCvVcmEVABzWSA1nOxmC/PZcvLJTxdnP/ttGfd2rTsIAs7+9dQfBBDOpVjMA==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(396003)(346002)(376002)(39860400002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(66574015)(6486002)(83380400001)(478600001)(6512007)(2616005)(6506007)(26005)(71200400001)(316002)(110136005)(91956017)(66476007)(66446008)(64756008)(54906003)(66556008)(76116006)(66946007)(86362001)(41300700001)(36756003)(8676002)(4326008)(8936002)(38070700009)(921008)(7416002)(2906002)(44832011)(31696002)(5660300002)(122000001)(38100700002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?NEdpRGhBWHZhZkxLejBOc3NNU1dvTzJ6eDRvdnFDODVqTE5hNnhZRzZHVGxL?=
 =?utf-8?B?TFZGdi9pUitjL0ZiclRGK2JMWHBMV3ZKUnIxcjh0TktGMFVsK2hqUW1YRHQv?=
 =?utf-8?B?YWdNZ1NOaGc4ZkphNHVqd1BYMkdOZlR1M3pQVldYbGFaeExLN09ha0JmQnlJ?=
 =?utf-8?B?c3dSUTFQeHVaM251MzA1bU1pVTZ1dW80UnNsNzNwWWJMWEZwVFBQSU1MMU9s?=
 =?utf-8?B?VUVISTB2MVRTWTFHWGtwVVRaM2xqd3l4bFdIS05tUTVGV0syUmRZUmpCOVhL?=
 =?utf-8?B?UmRabHNYU3V5c08vaktnK05kWkp4MkFWRFVQYmMzQ3RxdjJjellqZGswcmNC?=
 =?utf-8?B?TXh0RkxQNTFuV0huWXFpdlNQWjdad3ppZDBtVEpaZkc2REl0KzJ5RlIveGVN?=
 =?utf-8?B?dlZZWFBPMWFsUEFZUE4waWRscTVURS93MTJ2Z0ZpVDh5K0IyWDMyRnVidW9o?=
 =?utf-8?B?RmZLdytKSGN5RDBSNXo0ZE5KRnppVTNrd3NHeTJGTGRDaStVSmkxTGlZUVFH?=
 =?utf-8?B?emJwMFVwRjBadHZLVzY3RXVMZDhONUlaQVJoSkFiVFoxZWtmM0d6eUp4L0Zz?=
 =?utf-8?B?Y0RPODRvTTZDVEROQ21LejNpeVRJcEw3MmNob3ZsSCtQbVMwd1lFRHI4cnZD?=
 =?utf-8?B?cVFGQVpuZFZadktUenVUckh0MFRycjgrVXhnM29iNitlbXZVOFh2b1VNdk01?=
 =?utf-8?B?aDZVWEl6S1lvbGUxbHFTcEpPK3ZMVGFiNm0zMkdhdGJ4cm1mWFlETlp2eWpr?=
 =?utf-8?B?YUpQZ2x0djA0THl5bjgzQlY2K0RKL2E5aSt3RHBzUVlxa1dnL1FVNjFjTnl0?=
 =?utf-8?B?dGFKRGt2VG9RUTFmZUx4ai9tbnF4cXRlbjhqblBtQmZUL0x5M3JYU2xKRU9l?=
 =?utf-8?B?WEJZaHpvWFNZOHJWMXI2czR5NzcwbnlsdlNlblQ3emJFcXVHekZzd2tMWVNu?=
 =?utf-8?B?SnJaUFpJOWVFa1pLRkl2Q09NK3M5dnFhaks2ZlF3QTQ4RkViMVJ3a090bTFl?=
 =?utf-8?B?bEtqQUxORHBNb2JpcXhNRDRlNE9YSWFjRXNMamFLR0FQaTdkeWRveWhtN0Nu?=
 =?utf-8?B?SXViUGlJdlZ5cGJ4TlUzaEpCZzVpVEw0TjBsNTgydTBwV01tNmc0YUxPbWo2?=
 =?utf-8?B?eWZRNEVqYUFGa2NlNmVvNDIyZ2RSdVFwVmIyMnE0K1dlZ1lQdjFoT2owL2Np?=
 =?utf-8?B?VSsrV21tSkFsVHNXUElucGdIN1dJRGRwY21lY0h2VHdHb3phWVMzMUV5ckhs?=
 =?utf-8?B?bk5LUWFFNUljUzVDZnBkbDVMc1o2NE1PdldSN2E3NXJUcUl1VzN0MXI2d0VX?=
 =?utf-8?B?Nk1aV2Y2K1dBTk92c0x2em13d2NpL0lNanpIa3Bka0dVbDFUeEphYzY2Y3NL?=
 =?utf-8?B?L3ZUejZPRjJlRlVlOURFcmlQS2dYS1NaSkhjUStxTHZIVXZjR3lmK1RLU2FQ?=
 =?utf-8?B?YTdxeFllVG5admdOZGZkTWpIVllWbFcybERwZFh5Y2UreUNXbW42N0FHMGN6?=
 =?utf-8?B?WUhYK1V3enJaM0prYndETkFuVWlIRm82RGFBa3pjSFlmZFpGaHhYNnNtNDFz?=
 =?utf-8?B?SUdCUElJcFlQSDZRWU9VSC9STXZTZGJsNWFnc0Qwa1ZxNTVBK1lXK2NKRlBL?=
 =?utf-8?B?cSt3MFZ3cFdmeUNick1YVEZaYkkwdDRJbm03MEJLWkhYYkJnL1NxRHRWc3c2?=
 =?utf-8?B?UGNqaDFTOE0vVzBqRWNvaXI0Z0hudUFsZWVZekFuTlpQR1I2TUJEVC9xWWsw?=
 =?utf-8?B?TGpMaU50L3ljZStrek00amwyckYwZ2loOU0ySTR2RTRoV0ZoSEJRWVdpbnhQ?=
 =?utf-8?B?RTkzd1hWT0dTVHlFK2NLT0FwMGdGQmJPTS8rQVdTblY1MXNvNFRYOTBUWGF5?=
 =?utf-8?B?UDNsM3ZRcnFDejJqb1ppMDRhZ2FsTUZpUWpuK1M5Q1ZMSkZwRGdOT0NOUTZT?=
 =?utf-8?B?ekt0T0dncFZrSGFmbDR2WVRjdEtjbkRObzhOSDZtdWF4dlBMcWZiWEFISkI1?=
 =?utf-8?B?OHRBM09mdllsVGpOUHJNaURHNGVxMWdiNVlKNDdKZDFxYVpvRmFDcnBWQnR4?=
 =?utf-8?B?QU5OQTR4cE53eUt2UXNDS0xxNGV6eWtjb2tyNU1JS0FwUnl4MkZPT0lOOXZv?=
 =?utf-8?B?RGpsQUwwa3NleGdIVnBCcGNnZ2w4ZWJzWC8vSEc0Z1ZyNmdyVTJ2SThja21t?=
 =?utf-8?B?b1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <38BC99756F9CD34DB27EB20D58EEB343@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 529fe90c-796b-4b07-a0db-08dbf51ec593
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2023 23:14:31.5133
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GLPmGU83MZx1kF5tnzv1pqPhn7M3gcy2POy43fO9j5TtK1HvPovTIrpErTG1ebV2RIhvi+6obyI1l0xYiFgam5NWj0XtM6BsQfSA1QiHGe8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB1853
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
Cc: "kernel@salutedevices.com" <kernel@salutedevices.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA0LzEyLzIwMjMgw6AgMTk6MDUsIEdlb3JnZSBTdGFyayBhIMOpY3JpdMKgOg0KPiBJ
biB0aGlzIGRyaXZlciBMRURzIGFyZSByZWdpc3RlcmVkIHVzaW5nIGRldm1fbGVkX2NsYXNzZGV2
X3JlZ2lzdGVyKCkNCj4gc28gdGhleSBhcmUgYXV0b21hdGljYWxseSB1bnJlZ2lzdGVyZWQgYWZ0
ZXIgbW9kdWxlJ3MgcmVtb3ZlKCkgaXMgZG9uZS4NCj4gbGVkX2NsYXNzZGV2X3VucmVnaXN0ZXIo
KSBjYWxscyBtb2R1bGUncyBsZWRfc2V0X2JyaWdodG5lc3MoKSB0byB0dXJuIG9mZg0KPiB0aGUg
TEVEcyBhbmQgdGhhdCBjYWxsYmFjayB1c2VzIHJlc291cmNlcyB3aGljaCB3ZXJlIGRlc3Ryb3ll
ZCBhbHJlYWR5DQo+IGluIG1vZHVsZSdzIHJlbW92ZSgpIHNvIHVzZSBkZXZtIEFQSSBpbnN0ZWFk
IG9mIHJlbW92ZSgpLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogR2VvcmdlIFN0YXJrIDxnbnN0YXJr
QHNhbHV0ZWRldmljZXMuY29tPg0KPiAtLS0NCj4gICBkcml2ZXJzL2xlZHMvbGVkcy1hdzIwMTMu
YyB8IDI3ICsrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAx
NSBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2xlZHMvbGVkcy1hdzIwMTMuYyBiL2RyaXZlcnMvbGVkcy9sZWRzLWF3MjAxMy5jDQo+IGlu
ZGV4IGMyYmMwNzgyYzBjZC4uMWE4YWNmMzAzNTQ4IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2xl
ZHMvbGVkcy1hdzIwMTMuYw0KPiArKysgYi9kcml2ZXJzL2xlZHMvbGVkcy1hdzIwMTMuYw0KPiBA
QCAtMSw2ICsxLDcgQEANCj4gICAvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMCsN
Cj4gICAvLyBEcml2ZXIgZm9yIEF3aW5pYyBBVzIwMTMgMy1jaGFubmVsIExFRCBkcml2ZXINCj4g
ICANCj4gKyNpbmNsdWRlIDxsaW51eC9kZXZtLWhlbHBlcnMuaD4NCj4gICAjaW5jbHVkZSA8bGlu
dXgvaTJjLmg+DQo+ICAgI2luY2x1ZGUgPGxpbnV4L2xlZHMuaD4NCj4gICAjaW5jbHVkZSA8bGlu
dXgvbW9kdWxlLmg+DQo+IEBAIC0zMTgsNiArMzE5LDEzIEBAIHN0YXRpYyBpbnQgYXcyMDEzX3By
b2JlX2R0KHN0cnVjdCBhdzIwMTMgKmNoaXApDQo+ICAgCXJldHVybiAwOw0KPiAgIH0NCj4gICAN
Cj4gK3N0YXRpYyB2b2lkIGF3MjAxM19jaGlwX2Rpc2FibGVfYWN0aW9uKHZvaWQgKmRhdGEpDQo+
ICt7DQo+ICsJc3RydWN0IGF3MjAxMyAqY2hpcCA9IChzdHJ1Y3QgYXcyMDEzICopZGF0YTsNCg0K
VGhlIGNhc3QgaXMgbm90IG5lZWRlZCBiZWNhdXNlIGRhdGEgaXMgdm9pZCoNCg0KQW5kIGNoaXAg
aXMgbm90IG5lZWRlZCBhdCBhbGwsIHlvdSBjYW4gcGFzcyBkYXRhIHRvIA0KYXcyMDEzX2NoaXBf
ZGlzYWJsZSgpIGRpcmVjdGx5LCB3aXRob3V0IGEgY2FzdCBlaXRoZXIuDQoNCj4gKw0KPiArCWF3
MjAxM19jaGlwX2Rpc2FibGUoY2hpcCk7DQo+ICt9DQo+ICsNCj4gICBzdGF0aWMgY29uc3Qgc3Ry
dWN0IHJlZ21hcF9jb25maWcgYXcyMDEzX3JlZ21hcF9jb25maWcgPSB7DQo+ICAgCS5yZWdfYml0
cyA9IDgsDQo+ICAgCS52YWxfYml0cyA9IDgsDQo+IEBAIC0zMzQsNyArMzQyLDkgQEAgc3RhdGlj
IGludCBhdzIwMTNfcHJvYmUoc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCkNCj4gICAJaWYgKCFj
aGlwKQ0KPiAgIAkJcmV0dXJuIC1FTk9NRU07DQo+ICAgDQo+IC0JbXV0ZXhfaW5pdCgmY2hpcC0+
bXV0ZXgpOw0KPiArCWlmIChkZXZtX211dGV4X2luaXQoJmNsaWVudC0+ZGV2LCAmY2hpcC0+bXV0
ZXgpKQ0KPiArCQlyZXR1cm4gLUVOT01FTTsNCg0KV2h5IG5vdCByZXR1cm4gdGhlIHZhbHVlIHJl
dHVybmVkIGJ5IGRldm1fbXV0ZXhfaW5pdCgpID8NCg0KPiArDQo+ICAgCW11dGV4X2xvY2soJmNo
aXAtPm11dGV4KTsNCj4gICANCj4gICAJY2hpcC0+Y2xpZW50ID0gY2xpZW50Ow0KPiBAQCAtMzc4
LDYgKzM4OCwxMCBAQCBzdGF0aWMgaW50IGF3MjAxM19wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAq
Y2xpZW50KQ0KPiAgIAkJZ290byBlcnJvcl9yZWc7DQo+ICAgCX0NCj4gICANCj4gKwlyZXQgPSBk
ZXZtX2FkZF9hY3Rpb24oJmNsaWVudC0+ZGV2LCBhdzIwMTNfY2hpcF9kaXNhYmxlX2FjdGlvbiwg
Y2hpcCk7DQo+ICsJaWYgKHJldCkNCj4gKwkJZ290byBlcnJvcl9yZWc7DQo+ICsNCj4gICAJcmV0
ID0gYXcyMDEzX3Byb2JlX2R0KGNoaXApOw0KPiAgIAlpZiAocmV0IDwgMCkNCj4gICAJCWdvdG8g
ZXJyb3JfcmVnOw0KPiBAQCAtMzk4LDE5ICs0MTIsOSBAQCBzdGF0aWMgaW50IGF3MjAxM19wcm9i
ZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50KQ0KPiAgIA0KPiAgIGVycm9yOg0KPiAgIAltdXRl
eF91bmxvY2soJmNoaXAtPm11dGV4KTsNCj4gLQltdXRleF9kZXN0cm95KCZjaGlwLT5tdXRleCk7
DQo+ICAgCXJldHVybiByZXQ7DQo+ICAgfQ0KPiAgIA0KPiAtc3RhdGljIHZvaWQgYXcyMDEzX3Jl
bW92ZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50KQ0KPiAtew0KPiAtCXN0cnVjdCBhdzIwMTMg
KmNoaXAgPSBpMmNfZ2V0X2NsaWVudGRhdGEoY2xpZW50KTsNCj4gLQ0KPiAtCWF3MjAxM19jaGlw
X2Rpc2FibGUoY2hpcCk7DQo+IC0NCj4gLQltdXRleF9kZXN0cm95KCZjaGlwLT5tdXRleCk7DQo+
IC19DQo+IC0NCj4gICBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBhdzIwMTNfbWF0
Y2hfdGFibGVbXSA9IHsNCj4gICAJeyAuY29tcGF0aWJsZSA9ICJhd2luaWMsYXcyMDEzIiwgfSwN
Cj4gICAJeyAvKiBzZW50aW5lbCAqLyB9LA0KPiBAQCAtNDI0LDcgKzQyOCw2IEBAIHN0YXRpYyBz
dHJ1Y3QgaTJjX2RyaXZlciBhdzIwMTNfZHJpdmVyID0gew0KPiAgIAkJLm9mX21hdGNoX3RhYmxl
ID0gb2ZfbWF0Y2hfcHRyKGF3MjAxM19tYXRjaF90YWJsZSksDQo+ICAgCX0sDQo+ICAgCS5wcm9i
ZSA9IGF3MjAxM19wcm9iZSwNCj4gLQkucmVtb3ZlID0gYXcyMDEzX3JlbW92ZSwNCj4gICB9Ow0K
PiAgIA0KPiAgIG1vZHVsZV9pMmNfZHJpdmVyKGF3MjAxM19kcml2ZXIpOw0K
