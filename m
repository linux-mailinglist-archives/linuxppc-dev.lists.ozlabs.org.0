Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD5273AFBF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jun 2023 07:17:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=avYKyxEP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QnQTW1MxLz3c2r
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jun 2023 15:17:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=avYKyxEP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::62e; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on2062e.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::62e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QnQS82SFgz3bvJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jun 2023 15:15:51 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iCtgKEXbhVlsnEAZFKeKfsE3y2ojt9+TePpdY0G1vUhinanlqCuufIDE8HPAd/osdnN/b+ZVLL2Ys2FJSa87D/M7ozyZUCMUtgpfZnjkwOmw1XmqrosDN2u0pqva7Bb4pXWtduECs7Od9Wp0FEBV5ieirz6ZvUYJlp4rwMnefx/NmeeijKLn7BqzarZFM+mGyIUnvcveRMMEi1VM0ONRkhSfqKuJQ38Aan84NCbTZJuvOa2a7r/cic3fNSVBaat7n1Pb+YvvqRSX2ebYuFkRtmzUP5TgTl813nf3PL7iAcJsJLi7EXOPsTAU+Ep1Tg241zWU+2fvncJJafF2M4nSDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EeabBttjGOOf0cbUSSC62dmw30mVGUaZds6jgglnjFs=;
 b=n/AwjjkM8XV1EK/CK5MZJzETe12xZf+esoR+zIVtUTBaNArm2LXsvrPG7/jVGN5o+s/gP5RZWpB82mA/XqUtseYz8022PVY6JFVNryvPlMfy3TPHL+Psx/pqlBMkuBH9MveTcRTIjkyMpEMtKJl777e/jwusg1cAx+KH89WuLvYev0Pq4hErcnUyqkyi2qrooa48IMMkLsiA2ZxM9uN8FPacD/eB91iheohmffewdV4iWHH0+m+1bcu1vGuvYUb3s0VlVGuzMrYXzuX4vBvCbwHA1+2JONLvm2AARZX/tYtDW0QRA6rRyE2fc8zPfdw3gTX8mFRtvUdwFpgOkCcByg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EeabBttjGOOf0cbUSSC62dmw30mVGUaZds6jgglnjFs=;
 b=avYKyxEPFDiQL9FI0GyvpdcrDqo5wbSaZd9L8/a40LlTp7uvIwXH8pVcdHww5fmKetaxIUTJvP4fCa0pvzP3yF0ZWYBAEdC+MFJKz0GVA8VR/neEDonXmxNDMZ1MTbspbL/+R3dcyM9xn+fvcC/dzkD8DKOWNAdj0P5Gk0J8mxCwjaplakf7adw0Jp0jG63sTvKF9jlnlvZR9FhfvJqnXCMHA86z+DtgMFjFeNaUqq5VtOj+QOL0QyDTweRotEEfjNRErYC1RV4Hcprzk/XRfK3uysipJCKGECffnShWAq8ehwW2/asyBxAKUVLGjzK093AO4XpiLkCN065gtEKwbQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB1809.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:10::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Fri, 23 Jun
 2023 05:15:34 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::802b:33:561c:4217]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::802b:33:561c:4217%4]) with mapi id 15.20.6521.026; Fri, 23 Jun 2023
 05:15:34 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Naveen N Rao <naveen@kernel.org>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 05/17] powerpc/ftrace: Use FTRACE_REGS_ADDR to identify
 the correct ftrace trampoline
Thread-Topic: [PATCH 05/17] powerpc/ftrace: Use FTRACE_REGS_ADDR to identify
 the correct ftrace trampoline
Thread-Index: AQHZopTGB2t08WL03EWKHYiq5zurIq+X3k6A
Date: Fri, 23 Jun 2023 05:15:34 +0000
Message-ID: <53a961ac-1a3c-74bb-6210-77e42b470a1b@csgroup.eu>
References: <cover.1687166935.git.naveen@kernel.org>
 <6045a280a57a7ea937a5bb13ccac747026dbfb07.1687166935.git.naveen@kernel.org>
In-Reply-To:  <6045a280a57a7ea937a5bb13ccac747026dbfb07.1687166935.git.naveen@kernel.org>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB1809:EE_
x-ms-office365-filtering-correlation-id: b0da0bbe-0227-4350-7b6e-08db73a8df4f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  dWmwLai1RgJaJ97dQQI+b84LQOLcbpClrqYUzsjuRI0nZV7NvotLoRbkddL8iCs8yTic7Z/BuEo8i/9U5iRxe/VotCfcr+TzKqHyo8siA3PDR3UxHhySPCLBitLr96wdLN+U6E7LRl1dNDsvLETi0JtlhllhmRNNDcd6ql7ctylAPhqAGcgB/kOkLULcDl86lTCZbK4GUXHMYageNZdMrSAR7vQxeHxEvRg7yUfs2eEjEmNY3POy9TDFtXtlxYYYgv9MsuBk1uyG0jIKHvCz7205N7Z1Jfhvfshl+saadBtr9SmnJXpsgpoDI1pcVrzVlHPUXjjEVAM38QAo0bSJgbNc9KIro6c+kBTXErtgTQVJLeQT9dvGJOsOrTOD19Iz02S5cJURbj/fxIAeWnY8oLdf/ZkIbemRUBuqHknjDut3nEueB5B9XlYYte5i+iPJe0uI9BF3KSk5O+KI+Hl40w4Ym2ksfriZb7SqCzKmssRoxsH7mBaydYd7dhRPxPmjF8MdJbFKTM2dKpvNOYdLbeHtV/2UXzTKjuINUAqEBn86AoKdLWnd0R16wtRkdlnp7gHrohodQJ0pLxEfTgZPe4PhjCaK2lc6J4rtKIg4fO4MoKOT1hTsnJ7ubpvEfQom3V15vrEnuaV6rMODne990Xv6/ECTgr61hCsBtGBsBrH3xRlsjbc16TeJem0wSumq
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39850400004)(346002)(396003)(376002)(136003)(366004)(451199021)(122000001)(38100700002)(38070700005)(86362001)(31696002)(76116006)(91956017)(4326008)(66556008)(316002)(64756008)(66446008)(66946007)(66476007)(2616005)(110136005)(5660300002)(8936002)(83380400001)(8676002)(41300700001)(6486002)(31686004)(6512007)(26005)(478600001)(186003)(71200400001)(6506007)(2906002)(36756003)(44832011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?NCtaakY0SXNoZXRIdWxCYTJzZmpYcmNWdVdaTTZjbk1RbzM1MGF5MVF1QllZ?=
 =?utf-8?B?eHVnZ2Vaa3NMcklYYytoQ01mc1QrRHJaS0htdjFaZ05xU3ExQ3habm91azl5?=
 =?utf-8?B?ajhDNFBMbUZTQVo3cmQ2Nmxpa1lWSEN5NnRodWI1c0NPU0FCSkF2dk1zOEdM?=
 =?utf-8?B?Ty8xZ1lOUy80VGpxS2Y5N3ZORUZPSkFsRjVpK3pvUlIySHNzSnFqNWs2b21P?=
 =?utf-8?B?VWwwSHR3ZEZORlh4TFRKOUx2MDdlWlZ2TEJEeXJLdm9jWWxpbjgzUzN5amVr?=
 =?utf-8?B?Ti9uNjhyQUdqT08xakU5cmdvZTN5eTMvZjdyZE9EcVdBUVB3dVcySDFzRkpF?=
 =?utf-8?B?aCtmMzRvTnlxU01JZmdkSU8zOXcrRmhGbnpVYmNPNFhUL3M2RVNwZlFiTU9h?=
 =?utf-8?B?Tnl1VkVCUTZTM2E3Wk1EckFvczVPOE43ejZwMmpIblNFcXF3aFFFWnk3Sy9Z?=
 =?utf-8?B?WVFIY0ovdWFEeWs5cnQxa0U2Umt4d2lnV0ZFUjVmN2JtTWdwRlpHMU1jVzdC?=
 =?utf-8?B?M2xOTytJc3p6YjlOazlFdGVtc0wvelRubVl3L1pRRlhSMHdiMjc3WHlhMHVh?=
 =?utf-8?B?WW5HQWFtRCtNZnhCc0RjTzdDYkxTWGhDMmVBZzIvVDZvczlGOUQ4c3A1NEc3?=
 =?utf-8?B?bVRQZzV5NWVBYXZXWFZnbTN0YXN0Vm5sREEyWHE4TmZBV2ZsNy9CYVN3a0Zv?=
 =?utf-8?B?ZGhSNFo4UytPOEZZNVcxVUdKL1ZjR1NtVFFKWGw1REdzTVNKT200bWNUc1ZR?=
 =?utf-8?B?eHBlVWJ5UkV2R1A5bTlTN21HMHJ1U2dSSkhmakJpSHR6MU1Id2ZBdXAvY2cx?=
 =?utf-8?B?bEhZUkFhOHNiMHdSc3lSaFhIN1czTCtzTzZMZmk4ekQvM0J6cTRhWG05SDFT?=
 =?utf-8?B?WjVjL0Z0YTYxYjR5cE45SjlRUFptdzZDdGdFWCswTzRsRUdLZUVaWldjK3JW?=
 =?utf-8?B?UnF4NytwMG9CODBzZUVrSUFPVnIzWTZxamdOYkxvM3AxQmo2M25GSC9jeC9S?=
 =?utf-8?B?UVNMMUFQNUhjeCtwOVdCbVBINnRjTk1OYWhTZUs0VktZS2lFSmNoMS8rMW1R?=
 =?utf-8?B?YTRQZUdaSis2cG1seVg1YWpjTG5WQ1k4RUk3Nk5RS1ZWMmNFZzBlMUQxa3dF?=
 =?utf-8?B?dTA5UldkTTdGN293K0NWdHpJZjRHSkxHdDBCZWxxU0F2dmlRT2NBeXBSL0p0?=
 =?utf-8?B?S1NScVRpL1k2dUFTZnBDSjRTSzEwaXNiY3RFMENoTXZ4S3pENWUyMzVBaTJj?=
 =?utf-8?B?aUE3Y0lYZGhHSXdCcEh5aXJZVDlQblR3YWh3ejR2blk4VnE4K0w4UG90Nzhz?=
 =?utf-8?B?bEkrUTRZaUFBNCs2dTJTZW82TWs3ODBQbHVkeXo4OGFocGQrbE1OL1ZGczAx?=
 =?utf-8?B?Z0N3QTB2VHhYbHg5T0pBaEE2Sk55TWpvcHVUaDFhdTFWU1RrbW9kQndSajZK?=
 =?utf-8?B?VytZSU1SWndQQkRnbXh1NTV1Z25UL3RLZ3BHUGViNVF1R1pLaGNLa2Nsdnla?=
 =?utf-8?B?c3l1U0xOckVoMW9wUjRia2F1MElPcnpzSGRza0wyUGJzcWpZOVU5NzZtaEw1?=
 =?utf-8?B?ZEhsa3BTbnNkcjdjSmVxS3ExRERjR1QyaHpPc1JBT280bXloRU1tT0pHNGdm?=
 =?utf-8?B?QjNvaFZGZVp2M2xLSWVzc3J4NStmVm9wMThnQ01LZG42eEVOSDRDR29sSW9L?=
 =?utf-8?B?V1BaWnFrdmFOKzdxbmh0M20zMCtHZERzaVVyQnhkY0Rla1lLUVZmbWVYL0dh?=
 =?utf-8?B?VHdrckFZNG5ISU9uQSsrNW1aWWNmN20yODVMZFNBUDJxOWRvZ2RNaEFBMHhP?=
 =?utf-8?B?SnFobkV0ajY2Um9KWFVnRjV6SFM5OHBnR3hlMVltR2daUnVKd2FIVTVsbHpw?=
 =?utf-8?B?TVFqSEVwdXp6MlFhOHIrQ0VIdTRnT2xubnRLNmhCRG1kbVRhdDZ1emFYcVo5?=
 =?utf-8?B?WmhUOHB4R0xhWWducGkwd2dreDh6V1pGOWN0bTR0Yk9Gb2lud3JUUTNqU1Fz?=
 =?utf-8?B?Y05mTHZXVUZMU2JtOGh1d0hGbjN1b1hWUGplUW5qVVNPMEdyZkkzTHVaaHFH?=
 =?utf-8?B?N0Nqa1VOKzY3WDExN01WMlZ2eXVTcXdjZ2lvZFh4ZG9wR0NWUjJVU3B6bHcw?=
 =?utf-8?B?anFhTDVUSTY5VG51aDlXb01wK3N0MmxPQjhDZ1d6ZG03VXFpNllxY0NtcCta?=
 =?utf-8?B?eWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3D260701C4AA7E4CA7F7F6CEBE5D66CD@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b0da0bbe-0227-4350-7b6e-08db73a8df4f
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2023 05:15:34.0969
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5gflTNOz7qhJe/MbnoM2NRT9XpyTHj2OieO6otpRRQnNLBpO4Owav6TRtqJcA70KotsYP50A1cGcqsHB0aNHRCjsUxEDc/p6JbaawcnQ5I8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1809
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
Cc: Steven Rostedt <rostedt@goodmis.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE5LzA2LzIwMjMgw6AgMTE6NDcsIE5hdmVlbiBOIFJhbyBhIMOpY3JpdMKgOg0KPiBJ
bnN0ZWFkIG9mIGtleWluZyBvZmYgRFlOQU1JQ19GVFJBQ0VfV0lUSF9SRUdTLCB1c2UgRlRSQUNF
X1JFR1NfQUREUiB0bw0KPiBpZGVudGlmeSB0aGUgcHJvcGVyIGZ0cmFjZSB0cmFtcG9saW5lIGFk
ZHJlc3MgdG8gdXNlLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTmF2ZWVuIE4gUmFvIDxuYXZlZW5A
a2VybmVsLm9yZz4NCg0KUmV2aWV3ZWQtYnk6IENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUu
bGVyb3lAY3Nncm91cC5ldT4NCg0KPiAtLS0NCj4gICBhcmNoL3Bvd2VycGMva2VybmVsL3RyYWNl
L2Z0cmFjZS5jIHwgNyArLS0tLS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCA2IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9rZXJuZWwv
dHJhY2UvZnRyYWNlLmMgYi9hcmNoL3Bvd2VycGMva2VybmVsL3RyYWNlL2Z0cmFjZS5jDQo+IGlu
ZGV4IGYxMTcxMjRjMzAzMjVmLi41YWEzNjI3MjYxN2EwMyAxMDA2NDQNCj4gLS0tIGEvYXJjaC9w
b3dlcnBjL2tlcm5lbC90cmFjZS9mdHJhY2UuYw0KPiArKysgYi9hcmNoL3Bvd2VycGMva2VybmVs
L3RyYWNlL2Z0cmFjZS5jDQo+IEBAIC03NDUsMTQgKzc0NSw5IEBAIGludCBfX2luaXQgZnRyYWNl
X2R5bl9hcmNoX2luaXQodm9pZCkNCj4gICAJfTsNCj4gICAjZW5kaWYNCj4gICANCj4gLQl1bnNp
Z25lZCBsb25nIGFkZHI7DQo+ICsJdW5zaWduZWQgbG9uZyBhZGRyID0gRlRSQUNFX1JFR1NfQURE
UjsNCj4gICAJbG9uZyByZWxhZGRyOw0KPiAgIA0KPiAtCWlmIChJU19FTkFCTEVEKENPTkZJR19E
WU5BTUlDX0ZUUkFDRV9XSVRIX1JFR1MpKQ0KPiAtCQlhZGRyID0gcHBjX2dsb2JhbF9mdW5jdGlv
bl9lbnRyeSgodm9pZCAqKWZ0cmFjZV9yZWdzX2NhbGxlcik7DQo+IC0JZWxzZQ0KPiAtCQlhZGRy
ID0gcHBjX2dsb2JhbF9mdW5jdGlvbl9lbnRyeSgodm9pZCAqKWZ0cmFjZV9jYWxsZXIpOw0KPiAt
DQo+ICAgCWlmIChJU19FTkFCTEVEKENPTkZJR19QUENfS0VSTkVMX1BDUkVMKSkgew0KPiAgIAkJ
Zm9yIChpID0gMDsgaSA8IDI7IGkrKykgew0KPiAgIAkJCXJlbGFkZHIgPSBhZGRyIC0gKHVuc2ln
bmVkIGxvbmcpdHJhbXBbaV07DQo=
