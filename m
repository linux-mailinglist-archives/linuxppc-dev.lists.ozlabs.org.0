Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A479373C9A8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Jun 2023 10:33:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=g/eQam41;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qp6pC3zGwz3bYV
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Jun 2023 18:33:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=g/eQam41;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::628; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20628.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::628])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qp6nJ16clz2xHb
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Jun 2023 18:33:07 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SifRQRnO7mbudodYayYzTX/aloYrdHxduBCIa7o2uehLXdA/K68qewtrk3+RzOyj17Wy5Xhvh9tG3cu4J1OFzEy9l69+IfQwclWjmevxIDws65Bw0u0EXAhTjzikQoelUAcvq7q23R0vFvIvdHo3LIjf3X5USBvOfe9uGNCXID/NY8rJFdfsxWmJxAglxpNVRmK3R9PU7jdT6pupCqtPaeRoi4Y4eQEpf9ZaZN5zI/TEmVvt6pZn9vsUCANICTF/2zNg5/ayL8Vssv0GcHxcjwwWNyoo4qr8lNuk38YpHEYk9tG2nypYxENHNrszGGsQ52KaDU4Zl0V3J/CGeUh2WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HeyM3ayvJfd7xjtVQLwq5crSPWlx/2sIflC8Xg28K+I=;
 b=gIl2S/sJbBSoRk+9XOVp7BXvS48olnCVWGIorIT33FCPfUuBQGnmQk9++yQe3lbugiDIw5X6FN9OGDGVaNdmlNEE+egsTZ/kh8evOYc5UCMtVGma9k8cTYsnQ9J022fmVbV6EJuOLYWGgDoASlXckAYdBthhCGwECy2HQEdw04PF0f0xci8CQI1+JhlbEfcYBTi4LAiiW/Uex2ZagEVoiitnBUsFgSuj5vzj5xj9CB9EVqVS2ZbC7a88cgJlURhxTvRS5GNG9WoLM/i11l8y2HmZjGM4nK/QZCn4/w162zyl+ag7yY/W646IEJzuz7wpB/60+kiA3FGauFjTTHMcDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HeyM3ayvJfd7xjtVQLwq5crSPWlx/2sIflC8Xg28K+I=;
 b=g/eQam415gToKmQjio84p0kqIG4rvYWeLuUdCNH6bTAmbH/dxQK2uKrCCbs9g5Xzhe3+eAPP77Pq3KlHohbeMehCTiMN4ljzvBztAZ0KSW9J+VIkIZCko8tQMA9/BY6Shpdx59bRaiGhjnd3ftAQQVAvSyhhoeEfTGOI7A6jAhegSWTTRfD4uPvtmqTfJEsC0apiBwZbJCFk6UC+7xl8fOUq09wSWJ7k5RSvDp6CJZQp7STjrPq7pKhOEkfJ2J+RGd1/UoLRhmE+K9b8ngzoITpJZKXPWXetiEG2JDueShj8GArPA8Qh1lunbYGKF3wlhDTDs2JeO3BOKsJeE+lVtA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB1983.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1b7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Sat, 24 Jun
 2023 08:32:50 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::802b:33:561c:4217]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::802b:33:561c:4217%4]) with mapi id 15.20.6521.026; Sat, 24 Jun 2023
 08:32:50 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Subject: Re: [PATCH] objtool: Make 'sec-address' always on
Thread-Topic: [PATCH] objtool: Make 'sec-address' always on
Thread-Index: AQHZpFPzGL/C1oJ21UmOsq1ptiKwsq+WXciAgANGeQA=
Date: Sat, 24 Jun 2023 08:32:50 +0000
Message-ID: <f643cc54-e7c6-bff5-1a54-b84024235f84@csgroup.eu>
References:  <e7e1de1d01194df3ff4053cb0815fc2ddba33213.1687360711.git.christophe.leroy@csgroup.eu>
 <20230622063147.wpd4nxvludjjk2qa@treble>
In-Reply-To: <20230622063147.wpd4nxvludjjk2qa@treble>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR1P264MB1983:EE_
x-ms-office365-filtering-correlation-id: 869efd40-b6f2-49e0-01c3-08db748d98a3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  nmOu4k0J2FCsIvs8zkVy/jg+hz3eWtIH7QXq0Vkw1GjH90uG/C8bDEIMMrqdlKIwPma8t/tBsLw0uGmKA1ABARqsRxJnBybg/WARHyD3vJIMkiKSjM3axWl8oWD8w7cBJ23KYlEENHoUjUGboNeAT30UtJjexiMq0hX3rfXndYfo5fVGKz20VwEEL5IedGNsJZy/wh2LtL9AOTnrBRduDDI0x1gpGh/QTuPYFIqaVetvZw/VC11Rtmk/aFzMpd5mTI9JJR1YSYTbS7sEeh3pz0odEwsqHbYvcPX9XObaGTT41xUye0ewwrMR4a+ILv4pnoh06nx6fngvtF2I+rsMQloB0NPR3Zdr1HSWfuc1V5GLc7/pxJDuWolD06JoGmBnvVGwpFR5KphlqW+y5lZj6e7MiztycJ/LCMvEF60NGng6s4RxByah9PfEZS2AJm9sWqPhoV/HE4l5n8SKy3Sou0I9SQaLq3R+fyfRsrl4abCB+WN2xF5c+5qgBTXwUqRiVtG7w4fBfISukbCCm4oz+7Bu+HsLzXRcxk507A9rcntJXBHlNduPof7yO56scPO/36xWW/2NU3npzD4QmaHFylHKJXzBsQqRxpAHtFjaJrTI5qI7LzoAWU7MMf9/OItTBz2awuKDTnOBm40toSo7X+/yXbe6WYP4wMO6QpBx6zuVwboKMUPcSG4UluJFJBfo
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(396003)(376002)(366004)(39850400004)(451199021)(66446008)(66574015)(6486002)(478600001)(71200400001)(2616005)(54906003)(83380400001)(6512007)(6506007)(186003)(2906002)(5660300002)(44832011)(36756003)(38100700002)(122000001)(76116006)(91956017)(4326008)(66946007)(316002)(31696002)(86362001)(8936002)(8676002)(41300700001)(6916009)(64756008)(66476007)(38070700005)(66556008)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?TElxZlZJZkRYbXhWQlo2UWJDZDBKZVFCcjBDa3V0dXZPS0VxL0Z0YXMzQXpB?=
 =?utf-8?B?NHhZNGJYZlRTNFF6L1FVb0dpQU1yREs3MGMwSVJIRnpJaXc1MlZieUoxM05t?=
 =?utf-8?B?NVYyNkR2alJ6NjlQWnR0N0lTcUNLZ0VpcFZEZGg3TTRSTkNBSnZjV09xRmdR?=
 =?utf-8?B?TFF3bVlFMzMxaEc1RXpjcXBlQ2ZPazd2MWNxZUQ5R1QwWnZrc3NoejVyY1VL?=
 =?utf-8?B?NXdNb1R2WFovcDVPOU43U3UwaWhHQjAvYk5tV29ka1U1dkZISGE4N3ByZ3hG?=
 =?utf-8?B?UmYzMVRBK0tkcW12VjJuSG1YYm1aQSt0WVZvZFdmaFowQWcxYWlFT1JPL3Z6?=
 =?utf-8?B?Qzdpc1gvTnJUaWhZWlZseWkvN0Z0TjJLYjByTXVkdkNpR01BTDJmMmNrR3Jl?=
 =?utf-8?B?REthSG5DV1lYM25maDRKWmQrcXdZWkVqWkFqRUlvN2xZZTdiRjBGQ3ZHUCsz?=
 =?utf-8?B?T3JXMDZiMVpzQ2EvelFZaTZRdS8wajIxaWY2d1JJT29GTUF2d0QvaVNIbFdT?=
 =?utf-8?B?OHQ5YmFNSWRIMThVMDcyQjlmN0xMVVpqd1B1WnQvTE5URnVwakNObERhaTRy?=
 =?utf-8?B?N05wQ1N3MVZhbUszOW9mdkRaTDZONW9NMjlZY1FjMGtiS0xtTUpWemx6b25n?=
 =?utf-8?B?ak1Oc3daQmhGQTVPYytLVUk2SHV2Zjk5cVpva0g4MHIwd3Z6N2twbkwwR29k?=
 =?utf-8?B?a1QyYVR0dzVuZGo0REQyaU04YXp6QTRRMUU2bTdHdlovN2VNY2dUMlYvdk5X?=
 =?utf-8?B?OGlPRUVicGtuMG42SlBLTzVTb09xSFpIWjluRDEzNjFRNHFWT1ltclJ1UzNX?=
 =?utf-8?B?RzFPL2MxdDhCYWNvYjVlZml4YUdhc05uZTREMXhHZllKdWVicGJFcEJ1TUZi?=
 =?utf-8?B?K0RpWkd2cXF5S2xmQjRROHhmTGVCemcyckhPSVd3MGloUGdUMWtiV0xHay9k?=
 =?utf-8?B?VDlXWlcvdkxjOWRUZE1ickRGcjRkemNDQ0VtOHllMEtON3FrY1Z4bTNKNm1E?=
 =?utf-8?B?OFpEalltb1N5cit3em9CM0pXUzVtQURsT0tCRXdqaHV6VTRkQkljMGZ4blVx?=
 =?utf-8?B?VWIyTk4ycHZzQk9TYUVXaFNla1JFWXM4SDV1OUpZaFoxRm9Nd3JvWWNYTTVN?=
 =?utf-8?B?VEF2WG5LTS9MSEVGU01xV04xVXo3R2RsdDVHM1dZTm5pdjZOUHI2SEp5b29L?=
 =?utf-8?B?NXJpckQzV0wyaVBNZVVMeTBJTVA2c0ZwVFY3clUydkdUR2FFRnhMZEVzTHVZ?=
 =?utf-8?B?cEIvZ2NMOHlOeEd3MVVyb1NQWWtwUjd4Vzc1aUxqYjErdk9nVE8rQjBlK1JM?=
 =?utf-8?B?ME1SZ0FRKzhEZ2U5TUU1dGV2aTdHZUgwTEc3N3pwSXovN0ZrbVI2allqem5n?=
 =?utf-8?B?Y1A3WERKNHZiRWd4QmZNb3ZGcGFYNXJzeHg1K0tkUmdSV1VnUGl6K0pYSlY0?=
 =?utf-8?B?QkxOSDltMjVwNDR4ZjFzRmQ2SFVqQUw5RFc5aHJRWEJHK1BlMmlNZmFFOGZs?=
 =?utf-8?B?VUtFUzNCOWROTUZzbUpGUllPWnhjcnBKTEE2Ym5XWGJ4cVd6S2JucHJLZFBT?=
 =?utf-8?B?dFZmSThkSHZvS2llRjB5cGF5M3oyaE5hL2tyazQ5bDFnV3gxdTJCemUrcU85?=
 =?utf-8?B?dURzdEhkTVFpc2dUWG5vWmlwdEhGb3FSZm4rT2M0ZmZXLzg1b0lISWNGa1lt?=
 =?utf-8?B?L2hMUUQzeW9TeXpOQzErOWZiSXJvVkxlYXR1VTJDSWxhTGZRVjlVd3dxejdJ?=
 =?utf-8?B?WjhHaWhTL1hNUmsxUGprY09ZdmpPb3NiQ1RkeHhnYVEvZGxscEhGdWVvZTUw?=
 =?utf-8?B?YWFXRkVJZUl4R3lXWkE0NWNaK0NiNEp4cDA5UG0wTTh2QkxEWlloVHlWUnRj?=
 =?utf-8?B?ZGxxK1FEM1lXVGpYeEJWK2tsZmc2SUNFeFlkZmMveGVIcXZUNjViaVRwRElp?=
 =?utf-8?B?MjUxY3FQNU9rL0tKVC9JdUJ1RjN0YnlzL2p6M2Y4a2dKa2wzSTFVRFZsWk4v?=
 =?utf-8?B?YXB4amM1REcrVnRtUUhLVE5qRDRKZkw5eUlMV2k2bGlYQjIrUHRPdVpISHZN?=
 =?utf-8?B?Zlc0RnJia0ZUM2IyMElPV0JNNmkxOHJYS0ZveUNvd3NJd3BIV0x1ZFYzelFS?=
 =?utf-8?B?SVJKa1BqZE5hNGQ4aVNJcFpRdGxEc1VpVGRlUmVSd0V4aEliSlZvbnNZVlY0?=
 =?utf-8?Q?j3IeQTtvBEoMfLNZIwgHg8T1qTIG4g8B2vG3phgXwf7e?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F15D039F91A3844C902B07C0553EA985@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 869efd40-b6f2-49e0-01c3-08db748d98a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2023 08:32:50.2676
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UayG9WZKcHQbxdavNGuOHTFnLlM1BrkuoPz+WWrEUaLOPu7hYxZ8JiUIAzLH/GhTek+YmXdmHWmaoiX/XIuprXEQZ1dwuAXa0s9S9c9Yg4k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB1983
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
Cc: Peter Zijlstra <peterz@infradead.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDIyLzA2LzIwMjMgw6AgMDg6MzEsIEpvc2ggUG9pbWJvZXVmIGEgw6ljcml0wqA6DQo+
IE9uIFdlZCwgSnVuIDIxLCAyMDIzIGF0IDA1OjIwOjMxUE0gKzAyMDAsIENocmlzdG9waGUgTGVy
b3kgd3JvdGU6DQo+PiBNb3N0IG9mIHRoZSB0aW1lIG9ianRvb2wgd2FybmluZ3MgYXJlIHVzZWxl
c3Mgd2l0aG91dCB0aGUNCj4+IGFic29sdXRlIGFkZHJlc3Mgd2l0aGluIHRoZSBzZWN0aW9uLg0K
Pj4NCj4+IFRvZGF5IHRoZXJlIGlzIC0tc2VjLWFkZHJlc3Mgb3B0aW9uIHRvIGdldCBpdCBwcmlu
dGVkLCBidXQNCj4+IHRoYXQgb3B0aW9uIGlzIG5vd2hlcmUgdXNlZCBhbmQgcmVxdWlyZXMgYSBj
aGFuZ2UgaW4gTWFrZWZpbGUNCj4+IHRvIHVzZSBpdC4NCj4+DQo+PiBIYXZpbmcgdGhlIGFkZHJl
c3MgaW5zaWRlIHRoZSBzZWN0aW9uIGF0IGFsbCB0aW1lIGluIGFkZGl0aW9uDQo+PiB0byB0aGUg
YWRkcmVzcyB3aXRoaW4gdGhlIG9iamVjdCBkb2Vzbid0IGh1cnQgYW5kIHdpbGwgaGVscC4NCj4+
DQo+PiBSZW1vdmUgdGhlIC0tc2VjLWFkZHJlc3Mgb3B0aW9uIGFuZCBwcmludCBpdCBhdCBhbGwg
dGltZS4NCj4gDQo+IFRoaXMgb3B0aW9uIGFjdHVhbGx5IGZlZWxzIGxpa2UgY2x1dHRlciB0byBt
ZS4gIFRoZSBmdW5jK29mZnNldCBmb3JtYXQNCj4gd29ya3MgZmluZSwgY29tYmluZWQgd2l0aCBz
Y3JpcHRzIGxpa2Ugb2JqZHVtcC1mdW5jIGFuZCBmYWRkcjJsaW5lLiAgQW5kDQo+IHdlIGFsc28g
aGF2ZSBhIG5ldyBPQkpUT09MX1ZFUkJPU0U9MSBvcHRpb24gd2hpY2ggYXV0by1kaXNhc3NlbWJs
ZXMgdGhlDQo+IGFmZmVjdGVkIGZ1bmN0aW9uLg0KPiANCj4gT24geDg2IHdlJ3ZlIGJlZW4gdXNp
bmcgZnVuYytvZmZzZXQgZm9yIGNvbnNvbGUgc3RhY2sgdHJhY2VzIGZvciBtYW55DQo+IHllYXJz
LCBkdWUgdG8gS0FTTFIuICBTbyBtYXliZSB3ZSdyZSBqdXN0IG1vcmUgdXNlZCB0byBpdC4gIEJ1
dCB0aGUNCj4gc2NyaXB0cyBtYWtlIGl0IGZpbmUuDQoNCkFoIHJpZ2h0LCBJIGRpZG4ndCBrbm93
IHRoYXQgc2NyaXB0LCBJIHdhcyBzdHJ1Z2dsaW5nIHdpdGggb2JqdG9vbCAtZHINCg0KVGhlcmVm
b3JlIHRoZSBwYXRjaCBpcyBub3QgbmVlZGVkLCBhbmQgbmVpdGhlciBpcyB0aGUgLS1zZWMtYWRk
cmVzcyANCm9wdGlvbiwgbWF5YmUgd2UgY2FuIHJlbW92ZSBpdCBjb21wbGV0ZWx5Lg0KDQo+IA0K
PiBBbHNvIGl0IGhlbHBzIHdpdGggaWRlbnRpZnlpbmcgdGhlIHNhbWUgd2FybmluZyBhY3Jvc3Mg
ZGlmZmVyZW50DQo+IGNvbmZpZ3MvY29tcGlsZXJzLg0KPiANCg0KR29vZCBwb2ludC4NCg0KQ2hy
aXN0b3BoZQ0K
