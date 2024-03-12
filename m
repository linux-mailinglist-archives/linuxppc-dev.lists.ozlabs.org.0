Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BD820878F8E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Mar 2024 09:18:47 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=EG74MFje;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tv63n3xxcz3d3W
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Mar 2024 19:18:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=EG74MFje;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:c20a::3; helo=paup264cu001.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from PAUP264CU001.outbound.protection.outlook.com (mail-francecentralazlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20a::3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tv6334fPqz2ysD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Mar 2024 19:18:06 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eTRpuhLn8gYBks127DA7QWfjw6qfAKTa9uiSfskiKmje2JH51hDFqglWBEhfe5sEIb0S48hma2wcxjrlGyiLIp9rhsMxbEiz3ifwTtR8cY7wzt6tSs2e+NIPJ9FxHKwQ+LhzJ660h6ZM52P5/uBvp++JUB1OuLrOHLdE8gbdYSuCmQH2/3n7VQ3j9YKv90ZdGj2regHmXTwBU37Fr/qi5ecPiVeYPVbFiqVU8/G1m5lUXoQ6gO72m1Aapu3LAprR8OZ5/D5rVpvtUWl36tKSuk7fLdhERYPP1ULuyB9Db0CcRv69KvpWBfj17KpP9AOthOx3oJKit2txqN9TNsWVWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3HPrunsQCQX5QR8UiZZXVWFaD2LT7yPELcZ5KaPVan0=;
 b=ezs0kEGwoyjhCORjZK75bl/V0uoHTkv6/+mGwSSPwoZ46KfzXSQA2EyOQrqcDEnuO7STQca96ON+lpiVei+BwF2cRQynUkQoQq8HUbWSFI7FHZF0njISkXIg3KUxYR/C2XjEL3uhJotJ4BRaEOgcB6hjqfCXQHLUtnhndSDkfUNjVBZFeaLUuBTWU3UojV/blhIFLilx5Dmmc7A4ctE3bd+kh6tvvWcWSTbcliQOPvZLLUCqpTnD75Gicn0G72hTQzUjS0AKHNkLPxlrHFnU+sWFa+YYbPNsdhFoZaMky676cfnd3w9PpSmXh+ov1VwNSRonY3GMzCdpEbajqSxfxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3HPrunsQCQX5QR8UiZZXVWFaD2LT7yPELcZ5KaPVan0=;
 b=EG74MFjeRGj7N5ZJ753sSrEkZJsrILxCnfRm5Ema919XiboWTjXKqZQdI2bxj21xZhRkx7X8CoP2ZA5RgWLezBlrnbvnDhH0uI4YYrbXP5CngxeQtlQvfWtgdjcq3XMhfOHU4CsLUAu9tJp9jOCQtnIGkye0cB9TIbVXC0BVXlXC9YT3db/Ip9pMJwBHgivd0Lp0Zh0J6jc0LtzMr9mBdt0PLjCvwiYFL3O6JU/g0cTJZHAAL0/ODNC78xSHYzopH0gYkT+3oo5059B3ugbEyejUFxSvtPHq7X2Onl4/e9wtTZSXpLdT0rW7qPESY70GvOPrj7Y3yYARh4bt14pGhw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB3559.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:113::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.36; Tue, 12 Mar
 2024 08:17:42 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e%6]) with mapi id 15.20.7362.035; Tue, 12 Mar 2024
 08:17:42 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Breno Leitao <leitao@debian.org>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, Nathan Lynch <nathanl@linux.ibm.com>
Subject: Re: [PATCH] powerpc/kernel: Fix potential spectre v1 in syscall
Thread-Topic: [PATCH] powerpc/kernel: Fix potential spectre v1 in syscall
Thread-Index: AQHadFXBLk7O+66TVUyJLvB3f6Bo3g==
Date: Tue, 12 Mar 2024 08:17:42 +0000
Message-ID: <baf6af2b-d6e1-4df8-9466-98d19f8c765f@csgroup.eu>
References: <1534876926-21849-1-git-send-email-leitao@debian.org>
In-Reply-To: <1534876926-21849-1-git-send-email-leitao@debian.org>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PAZP264MB3559:EE_
x-ms-office365-filtering-correlation-id: 7ca0c269-19a2-4a96-c0f5-08dc426ce3b0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  ykp4gVhysC7RvfLMZrxsbARhBf0k3BZ7fQemsEY6+oLFNk+lC8llDvYfevEr7ivQsjIqn6/4DPopf1DGc8xY9cK21jPwnauqYkwsvAm9fsa6hcpXZszc5g0hZRa/A6I5PDej0Qa13hU+SoI0AmpIDcZoqJj93JzH2XYdTxgaeDEyCSx+xbkGunoq/kiR2RppEmbPPkp8trQsXhwS8b6FKa81kRUftCP+uNkdYvx820e12DNC3jlXusj8tUsi3kzFd1FVrtZbDPQdLib0ld6XNjZXVq91Ku4qbwnANyDikVOl9HZHzUhezlGsLhqPG+JmBiYUQgbyOEmJPQx+MiU6Z1JdyvNI5V3IBgIR9uP4uKbhsz/Ns0fcMPY6ewa610TWqSaPXfjJnbsXTJgRTLHGXa22HT/5cfxiAOVQd+zFWUh/d8I5dmh8MGwPNXI/a2acFyOYJ3Nfr/KmPGbTb7Slnj4SGlKEF/YJ1R8XXryBD9QMtnVpEZPmy5mMHSmRiTDVTRW8kHqEJ9jJq8O81X++aJBUzsIOEH3rwrKm4iPURfuqKbwAUT0onYPDDk9CerljZ++StldTfZGYzmteQyQF1MAJ71aYe4c0AV1PG/jvefmqu3eFXeQEmtUVWBpIZDqwjPOQAu2U05o3jWaEA4MlXD7t3ZT0MpK7sPIBdvpKazUAylQutCUU9wrvo39yBXsLT60evf194sEf2LwP7TMdjNnV3B6xTk910W3H60d78jo=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?UTJtV0ZueEpKYnpUeWJPNThOSzErSHF2ZEFmRk55bU1tNXVibkZXOXdLTjNk?=
 =?utf-8?B?dkh6azZoNFNjakRZeW9nRzhyTGdna09uaUZWTjA3TS9KWjNaSVZKY2tHeU5P?=
 =?utf-8?B?bGtiMUsxSktuUk5XMDdEZG9jQ3gwalVaRWRIR3VScHpVb25CN1NBaVhvWndQ?=
 =?utf-8?B?NHBOTnRZVlhhbC8yNW5TWkNxR3REczJrU3VRdEY3R3lBNlZuaS93Mk90ZGZQ?=
 =?utf-8?B?YzZSRXk0aVk2NlQ5WDhJSWoxTTVHTDlTck1OU2lqNkZhS0c0K3daRWVFeXJk?=
 =?utf-8?B?NkFTdHpJaklKQzNEKzB1Y0JsUlVDTzdSMXdTU2hkSTg3QzZuczJoODBML05T?=
 =?utf-8?B?Y1FRTDRKMUZuQ0VQVEZPN3QzRE9kRDRMcWpHNGhkS3REbEZGS2dsS25HUDVH?=
 =?utf-8?B?aXlUVWVCWmN4RHpsdVZpN2FWWi8xWFltRWp3QTcxbkVaNDRTUzl3YUozZTJn?=
 =?utf-8?B?V3hWejl3TEF0SFJQZXlLbVR6MG9BM3Y0VmRmUzZkN0VSdVFOa0pMaklDWnpP?=
 =?utf-8?B?Y0dRTEU2U3FUQ2U2dXh4SjRTOFZFRSt6S3U3Qi83bHpXa1lTc1orVUhOUHh3?=
 =?utf-8?B?aHVSa0ZNTW9tZks5VXFaQk95NmozWkcvcFhRclZuWDEvTzEvV3JQU2FhYVBa?=
 =?utf-8?B?cEIvTHEwS1NIMXVkb1o0aktRSG9BV2ZlR0pHM2xuSkcrbnZuMUh5WjdlZk50?=
 =?utf-8?B?K3ZYSVZWcS9uWnV1ZURld3NzZjdvNFQ3QTRIZmU3NHFwSmpKd21wRmRjV2RU?=
 =?utf-8?B?YVZHMEZRV0NWZlRjeEtMajJDTTJ5RnUvVG5YRGJ0dzhBSnh5MlduRjRsMDJW?=
 =?utf-8?B?K00yVHFqaWw3UlM2TUhwWERxUExOSndWSFN5OXM1dEQzbkRxUVVOSWY2L3hD?=
 =?utf-8?B?bGJuREo1aHZkQU9lRGlaTDMrUEYvVTFpRmwzcFl1Nkk5WEJodFJFeTJhQjR6?=
 =?utf-8?B?dUxyeG9TWk40RUJMNDloM0dyRklvb3JUUFZuM2hMTVJQaWVDQnd6Ym9NYlVV?=
 =?utf-8?B?SDFRb0pBZGFVTmZ3M0lJWXMxL3JqR3E0emtFZWhDNWpxZWxsaGE1Y0dvMGh1?=
 =?utf-8?B?OU1pYTJZRDVXcmJjbFZ2YkVPUjgya2l3dEJkMWEwQ0dzaktzNWtLZ3E2b3pB?=
 =?utf-8?B?K0RGUHB3VnBoY09YcGw0UVJTeTUrQUdZUkoyQlcwZ2V1VGxBT3liY2haVUJI?=
 =?utf-8?B?bHpYUUZ6RXFWWmhMUFNucXNILzRMVXhvN0xNaDh1dE5jWTlRRXFZN1pabk1n?=
 =?utf-8?B?U3ZiRmtoZlZSTzVHbGV2aVptUlVKODhucXo0Y2FNTnVIUDVBVGtEaFpkbW9w?=
 =?utf-8?B?WTVkTlFTRnRUVGgyNlU1d01LK3p5ZmZMOElNR05YMU5rU0xrNWd1dGpEOFcy?=
 =?utf-8?B?Y0dZWGo4ODc3TUNLY3lrN0UyZ1RpTVRCQmpDTDJnMnMyNGo5Q1haK080cXlH?=
 =?utf-8?B?NlkvMEN5SjMyR3BFMGNiWVFnN0xoUE94QWQ1Y2FLN3BMWWhzYkJPUkZSeTJZ?=
 =?utf-8?B?RnVTVjlxVE1YMCt0aVpZRmRJK1U5NCs4eG5PUlAwZVVTQzVwQ09OdlBZOGFC?=
 =?utf-8?B?a2pOZzBLTWdFN3BFMTVPaE5rNGgwNWNpNXdpT2NpQnZxaldpTzBYRXBudGhS?=
 =?utf-8?B?eEpxVVdwZ1l3ekZkN1hyOWp4bjlnOFhYby9iTHRoZUlWakpjV0g0V3MxcUw5?=
 =?utf-8?B?ekV2QThFOVRQUVFVL0k1cTRrdEdTancyS295ejFrcVVpSzBkaTNJYytEMGNt?=
 =?utf-8?B?bitRRTFEbEtWMzMzZ2NsL0l0RnM5OUhtT2F4cFFHRjQ5ak43dmJzN0lsYk84?=
 =?utf-8?B?Z2szZkplaXdnbHNTWlEvYUxTMk16S1hVM1NiUjlzekZNVGFPRThBb2M2MjZC?=
 =?utf-8?B?NUtValhhdG8rbWJCNnFERjdMbG82VTFFVS9Ra1IxbFZzaWFqcnRrZW5YZnho?=
 =?utf-8?B?bzlEUzVjS0k2Y0haV1d5bzlkMFJtTjI4aDJVaThhKzBJWTRZRnloS3cyajhF?=
 =?utf-8?B?bWxmRHo3UnBiZzVBVThCRFJOWkRjbGt2RlZ3MmNGcEpTQnptY0VhVE1JVTJ5?=
 =?utf-8?B?QXFzV3lKVE56QmVZS1lSRThTdEpsWGdUMGhyYzFLeGZaRHZIZG9GVkY4RFdo?=
 =?utf-8?B?M1N0cWFodFhGa2VudGhtVURDNStDazRGWHlVOC85YVp4OVdaTHhGRkIzMjNt?=
 =?utf-8?B?NXBicGJUNXl5VE5KSm44NHpUVGV6Y1NDV29qdnVTcmlYdVY5ZzNIUHE2WjRr?=
 =?utf-8?B?cHRWQ3JxMGZwT0hEZHpvTVliVHFnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <981CD9E27E492E43BE133CD6D21AFA11@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ca0c269-19a2-4a96-c0f5-08dc426ce3b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2024 08:17:42.3409
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 18njBYCtOB8eMLZ1aK/wjH5+ubZ+5Xo3CgO+AXTGEYw6fkW/rxAawgv2I/dqvVkEHsCJYlKKQtWEc3mPzp4uUhZHnUAO7ihTSJ9s98S8pZg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB3559
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

K05hdGhhbiBhcyB0aGlzIGlzIFJUQVMgcmVsYXRlZC4NCg0KTGUgMjEvMDgvMjAxOCDDoCAyMDo0
MiwgQnJlbm8gTGVpdGFvIGEgw6ljcml0wqA6DQo+IFRoZSBydGFzIHN5c2NhbGwgcmVhZHMgYSB2
YWx1ZSBmcm9tIGEgdXNlci1wcm92aWRlZCBzdHJ1Y3R1cmUgYW5kIHVzZXMgaXQNCj4gdG8gaW5k
ZXggYW4gYXJyYXksIGJlaW5nIGEgcG9zc2libGUgYXJlYSBmb3IgYSBwb3RlbnRpYWwgc3BlY3Ry
ZSB2MSBhdHRhY2suDQo+IFRoaXMgaXMgdGhlIGNvZGUgdGhhdCBleHBvc2VzIHRoaXMgcHJvYmxl
bS4NCj4gDQo+IAlhcmdzLnJldHMgPSAmYXJncy5hcmdzW25hcmdzXTsNCj4gDQo+IFRoZSBuYXJn
cyBpcyBhbiB1c2VyIHByb3ZpZGVkIHZhbHVlLCBhbmQgdGhlIGJlbG93IGNvZGUgaXMgYW4gZXhh
bXBsZSB3aGVyZQ0KPiB0aGUgJ25hcmdzJyB2YWx1ZSB3b3VsZCBiZSBzZXQgdG8gWFguDQo+IA0K
PiAJc3RydWN0IHJ0YXNfYXJncyByYTsNCj4gCXJhLm5hcmdzID0gaHRvYmUzMihYWCk7DQo+IAlz
eXNjYWxsKF9fTlJfcnRhcywgJnJhKTsNCg0KDQpUaGlzIHBhdGNoIGhhcyBiZWVuIGhhbmdpbmcg
YXJvdW5kIGluIHBhdGNod29yayBzaW5jZSAyMDE4IGFuZCBkb2Vzbid0IA0KYXBwbHkgYW55bW9y
ZS4gSXMgaXQgc3RpbGwgcmVsZXZhbnQgPyBJZiBzbywgY2FuIHlvdSByZWJhc2UgZXQgcmVzdWJt
aXQgPw0KDQpUaGFua3MNCkNocmlzdG9waGUNCg0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBCcmVu
byBMZWl0YW8gPGxlaXRhb0BkZWJpYW4ub3JnPg0KPiAtLS0NCj4gICBhcmNoL3Bvd2VycGMva2Vy
bmVsL3J0YXMuYyB8IDYgKysrKy0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMva2VybmVs
L3J0YXMuYyBiL2FyY2gvcG93ZXJwYy9rZXJuZWwvcnRhcy5jDQo+IGluZGV4IDhhZmQxNDZiYzlj
Ny4uNWVmM2M4NjMwMDNkIDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMva2VybmVsL3J0YXMu
Yw0KPiArKysgYi9hcmNoL3Bvd2VycGMva2VybmVsL3J0YXMuYw0KPiBAQCAtMjcsNiArMjcsNyBA
QA0KPiAgICNpbmNsdWRlIDxsaW51eC9zbGFiLmg+DQo+ICAgI2luY2x1ZGUgPGxpbnV4L3JlYm9v
dC5oPg0KPiAgICNpbmNsdWRlIDxsaW51eC9zeXNjYWxscy5oPg0KPiArI2luY2x1ZGUgPGxpbnV4
L25vc3BlYy5oPg0KPiAgIA0KPiAgICNpbmNsdWRlIDxhc20vcHJvbS5oPg0KPiAgICNpbmNsdWRl
IDxhc20vcnRhcy5oPg0KPiBAQCAtMTA1Niw3ICsxMDU3LDcgQEAgU1lTQ0FMTF9ERUZJTkUxKHJ0
YXMsIHN0cnVjdCBydGFzX2FyZ3MgX191c2VyICosIHVhcmdzKQ0KPiAgIAlzdHJ1Y3QgcnRhc19h
cmdzIGFyZ3M7DQo+ICAgCXVuc2lnbmVkIGxvbmcgZmxhZ3M7DQo+ICAgCWNoYXIgKmJ1ZmZfY29w
eSwgKmVycmJ1ZiA9IE5VTEw7DQo+IC0JaW50IG5hcmdzLCBucmV0LCB0b2tlbjsNCj4gKwlpbnQg
aW5kZXgsIG5hcmdzLCBucmV0LCB0b2tlbjsNCj4gICANCj4gICAJaWYgKCFjYXBhYmxlKENBUF9T
WVNfQURNSU4pKQ0KPiAgIAkJcmV0dXJuIC1FUEVSTTsNCj4gQEAgLTEwODQsNyArMTA4NSw4IEBA
IFNZU0NBTExfREVGSU5FMShydGFzLCBzdHJ1Y3QgcnRhc19hcmdzIF9fdXNlciAqLCB1YXJncykN
Cj4gICAJaWYgKHRva2VuID09IFJUQVNfVU5LTk9XTl9TRVJWSUNFKQ0KPiAgIAkJcmV0dXJuIC1F
SU5WQUw7DQo+ICAgDQo+IC0JYXJncy5yZXRzID0gJmFyZ3MuYXJnc1tuYXJnc107DQo+ICsJaW5k
ZXggPSBhcnJheV9pbmRleF9ub3NwZWMobmFyZ3MsIEFSUkFZX1NJWkUoYXJncy5hcmdzKSk7DQo+
ICsJYXJncy5yZXRzID0gJmFyZ3MuYXJnc1tpbmRleF07DQo+ICAgCW1lbXNldChhcmdzLnJldHMs
IDAsIG5yZXQgKiBzaXplb2YocnRhc19hcmdfdCkpOw0KPiAgIA0KPiAgIAkvKiBOZWVkIHRvIGhh
bmRsZSBpYm0sc3VzcGVuZF9tZSBjYWxsIHNwZWNpYWxseSAqLw0K
