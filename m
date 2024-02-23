Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FAF3860DB9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Feb 2024 10:14:54 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=H9tviWW+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Th48q5sBkz3vXD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Feb 2024 20:14:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=H9tviWW+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:261d::701; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20701.outbound.protection.outlook.com [IPv6:2a01:111:f403:261d::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Th4853Mzwz3cFf
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Feb 2024 20:14:12 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h3B6+WOCG93CuxXB84nBR/MljNIwN2L279u/xwIPftYzmJPvNoLr5jQuFDTMjmVyU5q91feB+gKpGWuPMt3nOG9/S7p2payTUzpBZTp4fIF/983RRwG0ENTmimpI8JxtcOGxwQ41O9QNQeJ5t93D4UcBQF7ZhfaZnrqCH8zAQfY4jwhDYhHjFP3wfwUqHvGLhZUENhQlN/Wc2biZv5S0HYj0063LMbmTcG2wYqTekPg4Cu4S2A3+5BDqfBg5wgH/Oay8mqxWsyHFEegnyvIAa0/qYs63HedwHCzXAtR6ZrT5XUDR0CuByPBQ74M+BkrGmcAS4/FwQ40hmD9nWiL1Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lcmr0Dz0jxYtJE1r+fc7IFZZK+eosowwli0Vkf5JYPA=;
 b=Nu68MTRiDeiPdeWAF++4i0Nul59B2mdmHXlTq4Kl0lEDFip3Ne0gV6DwRhy5KJMcHt7dVmq9KyhP8PiRXOYMwxNTV+O4OxOaEGwGLIb07nDw/2nxkYW7Q7/t/iC1kK4TE3X79k5MLFDSSzd1D7idx2T4OhjMjtKsQDJKn4z4V2dN83ToMsnFXdw+E/URt+0+W1JtHK6niv230ozoXZthLY9GgyyrncVY3SywCnI0AFokQ5ib7gntldpmJXfW3/2+FCrda0kmU0vU1eVEu0meJoK53Dy5QWVmESuMiamyviWRweY0nRjxbdSSOz/sYmPV0V91ktjlaL7q3bDnbQE2Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lcmr0Dz0jxYtJE1r+fc7IFZZK+eosowwli0Vkf5JYPA=;
 b=H9tviWW+vNeW/CSS+NpmoHQodFg0X8lY+UTonyn/96shFCpT9aTcYo585FK6raHnmjIon0Xhjs+2IvkxmspRv3DgQrGIEAmQoL7/5T3NwggBS2VanpBlHCMu/rz1bZfKOG2pd84OIIOSZVkEKndf8jqs3ZJvrCs36My/KIXLCMWc0qAoFEAfSREiMaDwqvwJ69ZO9d6kqHXPJKvVUSHFIbgpX5hk8wzePtt4SyjaDTtiS+GTVEyb3FXEW0XsrpMHBl58l77ELEv+7nd4E2aoxlHkyOh1PlxWmPdyZ5NgyCRXS5CnQ/2yOB76PLmrss4EwqK9BNKk6wuJ/p/vkPCMiQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2196.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.24; Fri, 23 Feb
 2024 09:13:53 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::46af:917d:3bb2:167e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::46af:917d:3bb2:167e%6]) with mapi id 15.20.7316.023; Fri, 23 Feb 2024
 09:13:53 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Charlie Jenkins <charlie@rivosinc.com>, Guenter Roeck
	<linux@roeck-us.net>, David Laight <David.Laight@aculab.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>, Helge Deller
	<deller@gmx.de>, "James E.J. Bottomley"
	<James.Bottomley@hansenpartnership.com>, Parisc List
	<linux-parisc@vger.kernel.org>, Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH v9 1/2] lib: checksum: Fix type casting in checksum kunits
Thread-Topic: [PATCH v9 1/2] lib: checksum: Fix type casting in checksum
 kunits
Thread-Index: AQHaZjiesic2zyGAl0+U9oCZDv/tcA==
Date: Fri, 23 Feb 2024 09:13:53 +0000
Message-ID: <cd631754-86fc-4f82-a9f3-560a60515302@csgroup.eu>
References:  <20240221-fix_sparse_errors_checksum_tests-v9-0-bff4d73ab9d1@rivosinc.com>
 <20240221-fix_sparse_errors_checksum_tests-v9-1-bff4d73ab9d1@rivosinc.com>
In-Reply-To:  <20240221-fix_sparse_errors_checksum_tests-v9-1-bff4d73ab9d1@rivosinc.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB2196:EE_
x-ms-office365-filtering-correlation-id: 834ec6a4-28ea-46eb-c4f4-08dc344fc1c0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  hNEB76QgBsdXKPtgsZF5Gh/ntISgjCmMX4icVthWiwfsbiEymfHSUNMC4AIlf46ljKVzxNC7WCervJtI5WpG1Z9r6Fwhqs4nvoiUjYaj1oNP/tLnCmQK0iE6xui81FRp1WBq7vKefaf5Fb7PBVTv/9Av8xxxMM2TzMFeShZ6bVq9IUnACdcHxFIAMrlR6qS+vzxBumFGq+hLIzpVL4Q+jtW9zPGJ8vrBi8KfcWg4lgAWnlna1Ex9u6m94l6DuWdTgNHnbwQtavaDMfglTD9z36V9Fg0+vUNQgLL6OnXFdmr/8nrI+DV/XRYly57If4f4mtlI29hVwENlNHa0kY5aeCEp59dIsz3Ll3StmJMZPERU96i125F9Sh7NzklETjsnx/a/VlTO1frgs0F01QYjQ/65fngU3sEhD85JnKKvkb+wMbPjCZAxSnErciChGO3Ct9JcMIJLhNj8hfY5ass9/KeJv3otgNNLnesaEzW//6Auejh3gFKQuyGeBP8XOsqpSPpQ/c6XUAepFbFBx9UdW7mt32Vas6WfzDZl7oWeElPpjkEkDN9Rswhn48Hi+z7368hO3j20BcLjC2C78o+ma45SlwdF85H6dYsZ4q6vM/akg2m7f+UGGMqOMcwj2fgR
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(230273577357003)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?Nml2VUhjVmlkeDNieTBuZUxjeVdjT3k2RUxoOTl1dWlnUUlrVi9td2ZyUXpS?=
 =?utf-8?B?N09sRTF2TzFzQTZMRUM2TnI2YXBpNlBlMnlKN1pLQXMrZExRMFVJYWNzUEQz?=
 =?utf-8?B?MTNxRmxVYktiVk9sTm02bHRRTWdVZjN0SzNtTTZCcWpuSEp2SExIUTFnKzRr?=
 =?utf-8?B?V2FrZnJvSW14QitiYXhLNFlhRzB2c1VNV3MzaTF2TFpkTlpxMnY4U2gzL29i?=
 =?utf-8?B?ZExFUDNqYW5LZDF2aGNhYnRQdDRuZnB1M1NzamV0RTMycW9LQno4ZWxibklR?=
 =?utf-8?B?M1llbUR5REI0NjZpM0RUZ0RpVG5xdVVZUGF4WEtWTlZzSk1jMWZyNjVaUFNt?=
 =?utf-8?B?SFMvNXZ2MmwralIyQlZBYlVIQ3FFWWd3aytpRlk0UkMyL1JuUGFXcTZhV1RW?=
 =?utf-8?B?a3c1bllKSnJ5MWxOcEhVWlZRb3JCdGpEekZNdS9kYzBCN3o1MVVZTHlDVzFB?=
 =?utf-8?B?RGRqcWgxQUNyajdTMzdvRzFQMjZTKzdyVWNyTmcrNnMzTzBNanhTNzg3Z1p5?=
 =?utf-8?B?MlNHN0xxMFVjZWFHZktwY1l6NElIL0s2eWt4UmYzdHpMeUFUZDFTeCtGYmRp?=
 =?utf-8?B?RkpSNURQRTJNS0w2cnRsdkdHM3FzOTBKYUFNTkVucFV5NWVkdTNYRHQzWjAx?=
 =?utf-8?B?TkhDaWY2UEF6WElJQUV4SE5HZTlJM1JDRlNSa0FYMnRJdjVtVDhCNkxpeDdU?=
 =?utf-8?B?QmNXNVBqbzYzMTlqSUZQdExTNmFDeFJ1ME9abWFnNXR3MTR1cUlidDJ6RHFM?=
 =?utf-8?B?dURCcjRraFRXVExsY2JUd2tmYlQrcnlnTmY4MnVRRWJVbUFtZzk1NTNpU0Ju?=
 =?utf-8?B?ZXlIMjAyZEJId3RRZEtSUjdaWUxTUHVMNmtrcnVjalN3QkpSRUpuOUIrQXBz?=
 =?utf-8?B?aFpnN1N6ZUFyWllHcjZBc1U5L1JUMDZneUJOdGdzZ3pIZ0Fud2lESVNIK3BL?=
 =?utf-8?B?dGg3SGZENnRPK0RpTmRWUWpLOHBmWWs4azR6TkM3R0dRQ2srNnhoMkxoWEt0?=
 =?utf-8?B?M0I4MlBweFJFNWFaRzBqanhud2FHdS9TQ3JweDF5TENmM1Iways0TFFJWEIw?=
 =?utf-8?B?M2pGSlFpOHR6ZW5aaTlQeHdtbmlrK29tQkwwemNoZitoa0VIWE5QVDFXV1dw?=
 =?utf-8?B?YzNTN1ZKSEZBeFoyd2kvR0FsMTAyNVVQbzRtdjBaalBPKzdKS3V6bVNwZzZq?=
 =?utf-8?B?NlR3dk1ZWkMrWXRPYzJnRzAvYkI1NnlqWlZlUlJIZEhIS0hYeGxmT1ZwVkYx?=
 =?utf-8?B?S0Y1UHc0RmxLNE9NZS9EUkVjbFByUS9YYUxMK0N0VURPc3FtMVMxRTI2cjJV?=
 =?utf-8?B?OG10ZG9qc2hodm9XV0svZklnZEhiL3llOTZMZndvMlVOSFBZZHBYYjg0M3Zw?=
 =?utf-8?B?YlJOdFM1enhnM1FWSmg3dmZFUEpSaDFBVFFZWjJERElYemxxaGRsOGp0QzYv?=
 =?utf-8?B?a2lMRTRnNjh0V1BpSUVpc0dtVkUrNmZtVnlVZ2JhaFFzMTVpUG9tWmJ0Vkhj?=
 =?utf-8?B?QkZUclVzaG1CTVVGa2xOdUtDMWFFRnZGZlMyem1JYzN0OGtsNDFNWGxJdTdT?=
 =?utf-8?B?c3NnRjdqOEdYV0s2RWtFN0xLYWd0QnlySHpCMGYydGwwbFV1c0NoUVFzVXMz?=
 =?utf-8?B?R2lSc25wMkZuU1V6bFQvQXNLUHJDZTRqeEN4dThsZ3kwRFB2MERtcGRNMFU1?=
 =?utf-8?B?dHFIeE5ybDVHQ0d0SVk0N0JaTlZOZDhLY1lzc0gvVUJwRmwyMXlYZlo1N0hC?=
 =?utf-8?B?VzdxUG5GTDNpeUdoSy9pSkUxY0ZvaWRJZnJ2QzdlZlZ3RGVyUVZuZDlWeVdx?=
 =?utf-8?B?cEVOUStacUE4VFdvNDB2S05uc2ZoaFZnNzRQMHNQRE9oL28valorb05PNE1P?=
 =?utf-8?B?K09Lb0hPUldoUGhrcVpGMUdJZjZXeXh6ai9oNm9VejIycnI0L00wZ2NyY2tq?=
 =?utf-8?B?eEdIVHdqVzhJanI2Zk1nRGxRUEdxZFZLUmlFUy9td1V0czUyWDIyOTZSSEY4?=
 =?utf-8?B?UEVzb0Vjb3FUVUpmRW93NjN1bEtCRGdDbm4xdnorRUkrR1BEYXNvUEMrRWRF?=
 =?utf-8?B?dGR0UVRMSjU5WnlxVERTK2E5RlR0T3dGSnBpa1FhYU1ucVZoSndVTjRySUlL?=
 =?utf-8?B?Q0QzWmkyUTZVb2EzT0NGckcwRkRZQk45VDN6dFJuVk5BSGYxSFNHaWNiQUJz?=
 =?utf-8?B?d1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CA2468BE52BAB043AF2A99A255ECB095@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 834ec6a4-28ea-46eb-c4f4-08dc344fc1c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2024 09:13:53.7327
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L2X+J2nu5ahgAuxaL/p1KJKZ5UDIVFzSDcQ6jhikznuMuhqPSjMmRQAYGufhBt38nxF2/TW/22wm3gdMLlvjkI/Vcdj2gTSR78gU/3WHmsY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2196
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
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kernel test robot <lkp@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDIyLzAyLzIwMjQgw6AgMDM6NTUsIENoYXJsaWUgSmVua2lucyBhIMOpY3JpdMKgOg0K
PiBUaGUgY2hlY2tzdW0gZnVuY3Rpb25zIHVzZSB0aGUgdHlwZXMgX193c3VtIGFuZCBfX3N1bTE2
LiBUaGVzZSBuZWVkIHRvDQo+IGJlIGV4cGxpY2l0bHkgY2FzdGVkIHRvLCBiZWNhdXNlIHdpbGwg
Y2F1c2Ugc3BhcnNlIGVycm9ycyBvdGhlcndpc2UuDQoNClRoaXMgaXMgbm90IHRoZSBjb3JyZWN0
IGZpeC4gV2hlbiB5b3UgZm9yY2libHkgY2FzdCwgeW91IHNodXQgdXAgc3BhcnNlIA0KYW5kIGhp
ZGUgd2FybmluZ3MgYnV0IHlvdSBkb24ndCBmaXggdGhlIHByb2JsZW0gb24gYmlnIGVuZGlhbiAN
CmFyY2hpdGVjdHVyZXMgd2hpY2ggaXMgd2hhdCBzcGFyc2UgcmVwb3J0cyB0byB5b3UuDQoNCklu
IG9yZGVyIHRvIGZpeCBib3RoIHRoZSBzcGFyc2Ugd2FybmluZ3MgYW5kIHRoZSByZWxhdGVkIGlz
c3VlcywgeW91IA0KaGF2ZSB0byBwZXJmb3JtIHByb3BlciBlbmRpYW4gY29udmVyc2lvbiwgc2lt
aWxhciB0byB3aGF0IHdhcyBkb25lIHdpdGggDQpjb21taXQgYjM4NDYwYmM0NjNjICgia3VuaXQ6
IEZpeCBjaGVja3N1bSB0ZXN0cyBvbiBiaWcgZW5kaWFuIENQVXMiKQ0KDQpUaGUgZm9sbG93aW5n
IGNoYW5nZSBpcyB3aGF0IHlvdXIgcGF0Y2ggc2hvdWxkIGRvOg0KDQpkaWZmIC0tZ2l0IGEvbGli
L2NoZWNrc3VtX2t1bml0LmMgYi9saWIvY2hlY2tzdW1fa3VuaXQuYw0KaW5kZXggMjI1YmI3NzAx
NDYwLi5iZjcwODUwMDM1YzcgMTAwNjQ0DQotLS0gYS9saWIvY2hlY2tzdW1fa3VuaXQuYw0KKysr
IGIvbGliL2NoZWNrc3VtX2t1bml0LmMNCkBAIC0yMTUsNyArMjE1LDcgQEAgc3RhdGljIGNvbnN0
IHUzMiBpbml0X3N1bXNfbm9fb3ZlcmZsb3dbXSA9IHsNCiAgCTB4ZmZmZjAwMDAsIDB4ZmZmZmZm
ZmIsDQogIH07DQoNCi1zdGF0aWMgY29uc3QgX19zdW0xNiBleHBlY3RlZF9jc3VtX2lwdjZfbWFn
aWNbXSA9IHsNCitzdGF0aWMgY29uc3QgdTE2IGV4cGVjdGVkX2NzdW1faXB2Nl9tYWdpY1tdID0g
ew0KICAJMHgxOGQ0LCAweDMwODUsIDB4MmU0YiwgMHhkOWY0LCAweGJkYzgsIDB4NzhmLAkweDEw
MzQsIDB4ODQyMiwgMHg2ZmMwLA0KICAJMHhkMmY2LCAweGJlYjUsIDB4OWQzLAkweDdlMmEsIDB4
MzEyZSwgMHg3NzhlLCAweGMxYmIsIDB4N2NmMiwgMHg5ZDFlLA0KICAJMHhjYTIxLCAweGYzZmYs
IDB4NzU2OSwgMHhiMDJlLCAweGNhODYsIDB4N2U3NiwgMHg0NTM5LCAweDQ1ZTMsIDB4ZjI4ZCwN
CkBAIC0yNDEsNyArMjQxLDcgQEAgc3RhdGljIGNvbnN0IF9fc3VtMTYgZXhwZWN0ZWRfY3N1bV9p
cHY2X21hZ2ljW10gPSB7DQogIAkweDM4NDUsIDB4MTAxNA0KICB9Ow0KDQotc3RhdGljIGNvbnN0
IF9fc3VtMTYgZXhwZWN0ZWRfZmFzdF9jc3VtW10gPSB7DQorc3RhdGljIGNvbnN0IHUxNiBleHBl
Y3RlZF9mYXN0X2NzdW1bXSA9IHsNCiAgCTB4ZGE4MywgMHg0NWRhLCAweDRmNDYsIDB4NGU0Ziwg
MHgzNGUsCTB4ZTkwMiwgMHhhNWU5LCAweDg3YTUsIDB4NzE4NywNCiAgCTB4NTY3MSwgMHhmNTU2
LCAweDZkZjUsIDB4ODE2ZCwgMHg4ZjgxLCAweGJiOGYsIDB4ZmJiYSwgMHg1YWZiLCAweGJlNWEs
DQogIAkweGVkYmUsIDB4YWJlZSwgMHg2YWFjLCAweGU2YiwJMHhlYTBkLCAweDY3ZWEsIDB4N2U2
OCwgMHg4YTdlLCAweDZmOGEsDQpAQCAtNTc3LDcgKzU3Nyw4IEBAIHN0YXRpYyB2b2lkIHRlc3Rf
Y3N1bV9ub19jYXJyeV9pbnB1dHMoc3RydWN0IGt1bml0IA0KKnRlc3QpDQoNCiAgc3RhdGljIHZv
aWQgdGVzdF9pcF9mYXN0X2NzdW0oc3RydWN0IGt1bml0ICp0ZXN0KQ0KICB7DQotCV9fc3VtMTYg
Y3N1bV9yZXN1bHQsIGV4cGVjdGVkOw0KKwlfX3N1bTE2IGNzdW1fcmVzdWx0Ow0KKwl1MTYgZXhw
ZWN0ZWQ7DQoNCiAgCWZvciAoaW50IGxlbiA9IElQdjRfTUlOX1dPUkRTOyBsZW4gPCBJUHY0X01B
WF9XT1JEUzsgbGVuKyspIHsNCiAgCQlmb3IgKGludCBpbmRleCA9IDA7IGluZGV4IDwgTlVNX0lQ
X0ZBU1RfQ1NVTV9URVNUUzsgaW5kZXgrKykgew0KQEAgLTU4Niw3ICs1ODcsNyBAQCBzdGF0aWMg
dm9pZCB0ZXN0X2lwX2Zhc3RfY3N1bShzdHJ1Y3Qga3VuaXQgKnRlc3QpDQogIAkJCQlleHBlY3Rl
ZF9mYXN0X2NzdW1bKGxlbiAtIElQdjRfTUlOX1dPUkRTKSAqDQogIAkJCQkJCSAgIE5VTV9JUF9G
QVNUX0NTVU1fVEVTVFMgKw0KICAJCQkJCQkgICBpbmRleF07DQotCQkJQ0hFQ0tfRVEoZXhwZWN0
ZWQsIGNzdW1fcmVzdWx0KTsNCisJCQlDSEVDS19FUSh0b19zdW0xNihleHBlY3RlZCksIGNzdW1f
cmVzdWx0KTsNCiAgCQl9DQogIAl9DQogIH0NCkBAIC01OTgsNyArNTk5LDcgQEAgc3RhdGljIHZv
aWQgdGVzdF9jc3VtX2lwdjZfbWFnaWMoc3RydWN0IGt1bml0ICp0ZXN0KQ0KICAJY29uc3Qgc3Ry
dWN0IGluNl9hZGRyICpkYWRkcjsNCiAgCXVuc2lnbmVkIGludCBsZW47DQogIAl1bnNpZ25lZCBj
aGFyIHByb3RvOw0KLQl1bnNpZ25lZCBpbnQgY3N1bTsNCisJX193c3VtIGNzdW07DQoNCiAgCWNv
bnN0IGludCBkYWRkcl9vZmZzZXQgPSBzaXplb2Yoc3RydWN0IGluNl9hZGRyKTsNCiAgCWNvbnN0
IGludCBsZW5fb2Zmc2V0ID0gc2l6ZW9mKHN0cnVjdCBpbjZfYWRkcikgKyBzaXplb2Yoc3RydWN0
IGluNl9hZGRyKTsNCkBAIC02MTEsMTAgKzYxMiwxMCBAQCBzdGF0aWMgdm9pZCB0ZXN0X2NzdW1f
aXB2Nl9tYWdpYyhzdHJ1Y3Qga3VuaXQgKnRlc3QpDQogIAkJc2FkZHIgPSAoY29uc3Qgc3RydWN0
IGluNl9hZGRyICopKHJhbmRvbV9idWYgKyBpKTsNCiAgCQlkYWRkciA9IChjb25zdCBzdHJ1Y3Qg
aW42X2FkZHIgKikocmFuZG9tX2J1ZiArIGkgKw0KICAJCQkJCQkgIGRhZGRyX29mZnNldCk7DQot
CQlsZW4gPSAqKHVuc2lnbmVkIGludCAqKShyYW5kb21fYnVmICsgaSArIGxlbl9vZmZzZXQpOw0K
KwkJbGVuID0gbGUzMl90b19jcHUoKihfX2xlMzIgKikocmFuZG9tX2J1ZiArIGkgKyBsZW5fb2Zm
c2V0KSk7DQogIAkJcHJvdG8gPSAqKHJhbmRvbV9idWYgKyBpICsgcHJvdG9fb2Zmc2V0KTsNCi0J
CWNzdW0gPSAqKHVuc2lnbmVkIGludCAqKShyYW5kb21fYnVmICsgaSArIGNzdW1fb2Zmc2V0KTsN
Ci0JCUNIRUNLX0VRKGV4cGVjdGVkX2NzdW1faXB2Nl9tYWdpY1tpXSwNCisJCWNzdW0gPSAqKF9f
d3N1bSAqKShyYW5kb21fYnVmICsgaSArIGNzdW1fb2Zmc2V0KTsNCisJCUNIRUNLX0VRKHRvX3N1
bTE2KGV4cGVjdGVkX2NzdW1faXB2Nl9tYWdpY1tpXSksDQogIAkJCSBjc3VtX2lwdjZfbWFnaWMo
c2FkZHIsIGRhZGRyLCBsZW4sIHByb3RvLCBjc3VtKSk7DQogIAl9DQogICNlbmRpZiAvKiAhQ09O
RklHX05FVCAqLw0KLS0tDQoNCkNocmlzdG9waGUNCg==
