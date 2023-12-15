Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC098147AD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Dec 2023 13:08:27 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=XkpuXcRT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ss7KP3p5sz3dSd
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Dec 2023 23:08:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=XkpuXcRT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:261c::600; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:261c::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ss7JY4rxqz3cV1
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Dec 2023 23:07:37 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KzxoICiFG99XQMBtOFAbuWd9JZjlx7ATJ5opshmT6huKnplKZirRF2HLG6Xl9THiw8PdoUPUQm3kqBhiV25sIm7qxQmbdIbz8ds6NO+9nOTaebdBRLEHLjmxS3F+1pA2bDkuagohYeSaXWxgpz0g/vwwwO9TVefzZaQL2uymaeQr3hgp7voIP/vkV/JcEyVgsrlMb8bgFSClvPmF+wzNUMFk9YxOYMjWHilkoYDKZ5Agcmf1XpPBd8JgB6sAlxxiGvqxIAOpzg3LLs4ON9YkzHYO4i0IZtjWM3YxZqKWAMJHswbcvzmiB084aJyrKcFPx/otNi1VgbMQ/L9e6/GiQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hIX4cvoa5VE43nUgCVeGaiTPJwdLti4UvogSiBUkBMA=;
 b=lj6Iya/4/H9pWQCfikplRlsutEh7yPIdzNsrQy92Q7ISOl6B+nUCisu3UyNLWaOZKY5ZtCF+WUzKISjgi6+uVFY72Yc9VISCQcCnGGYIN9UwJNMFV4LHkqAAn+pOV5YS4XUYZRAr3gGtgsBATyqczczu0aSp8shWH9lB6t6fQ/DVFVxxvMyZkQW6wTdSjGlLk3TMmO1JsrCjXB4CdbXKo7D4pco55TIEEgNBiOE9bnd/Ih92R13nJB9Spf0rFZLxRub6ITQyHAS5gK+G13F01Oo7jJfRE5bvQwkqEavQtbfL1FN4J7qtAAVeo5iNPyfwGOE0qfn73u/oZ5L3/kzXUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hIX4cvoa5VE43nUgCVeGaiTPJwdLti4UvogSiBUkBMA=;
 b=XkpuXcRThuIQzMTK2MyIYEe11gzQ5d1TCkehc1V15qS/0A7O3EP77AWCS5qYAOkNAwfQdZJ3lPVV0biFc7QIjyL6PD2yRYXddHyekuAO2KYiF4wXCgg7pJy71YBDIlbm4FnNYtfNqzUcbxgX7GwcgE1kNLm0OLXOt1aEO+FEfJ/zhINMUIBzF+EIAx57E6Ud57akduWQFrbyXTN9Em5gTjLG8uFVXPkYP6A4UUy8O4rJU0h6QHjj/XsliDe6HHY5Hi4hroc5ymOh5JPx0rp7oYl26oIAmiUsWRvfEezMxmTeKPPWzFBBROsv2PIcQVZF0FD2u3A6Y5t6z3HwcQHxCQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB3194.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:1b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.31; Fri, 15 Dec
 2023 12:07:12 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f788:32b4:1c5e:f264]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f788:32b4:1c5e:f264%7]) with mapi id 15.20.7091.030; Fri, 15 Dec 2023
 12:07:09 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Ghanshyam Agrawal <ghanshyam1898@gmail.com>, "mahesh@linux.ibm.com"
	<mahesh@linux.ibm.com>, "oohall@gmail.com" <oohall@gmail.com>,
	"mpe@ellerman.id.au" <mpe@ellerman.id.au>, "npiggin@gmail.com"
	<npiggin@gmail.com>
Subject: Re: [PATCH] arch: powerpc: kernel: fixed some typos
Thread-Topic: [PATCH] arch: powerpc: kernel: fixed some typos
Thread-Index: AQHaL04iawrAU6R7KkKQWOo3NM6M97CqP9iA
Date: Fri, 15 Dec 2023 12:07:09 +0000
Message-ID: <b688b690-3500-48a7-a687-e9c6e42a6438@csgroup.eu>
References: <20231215115857.575697-1-ghanshyam1898@gmail.com>
In-Reply-To: <20231215115857.575697-1-ghanshyam1898@gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB3194:EE_
x-ms-office365-filtering-correlation-id: 7a4c12da-035f-4144-05d9-08dbfd665d4e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  DiC87O08W7RXVAOmUD1fDCVLU1U+rS8rynk1gMivhx1wdik8WyUh08MkTm5xjIaGBDmI7Czl7foTrlPEHAfn98cxNVTZLtmAIL8NCkAAtmErUcC9z6uyzhUaW4rgsDDP27jEIK5SrpmrFmkKdQf23nNuQ3uzbn+xQI2yUmwpO7Gx5B4XUP7zDguE4UrCqDS1RbIhI98w+bpSU5pnovqrvXFjXp1upMilsAHEVMtFSjcnuajZlMb8lJZ9OrVcvkz79bPkxlSE8yHKkZ+nUO0LQS0u6KxnSFGEj2IFjpmwv/7WG1aiVQJ3gPunsjVVnxXUQmaUQTnQ1JqsSZqy83knEzrO+v3CSdfM/Vbq9B7EXp6VmwE9zKgXwbG+HDsACGocXtJdGpK5INH9q19nsca2T0pE/ztgHV8HcR8PiTlNyLqpwKvYDcS9d7+2GAolYnvqX56O/JQCKpYjFkBHJZLQqIZL0WePo/bdHOn7zhd8qJK10gJ8fxxhLYEDSATOM2VjxBJ8rjIAA8ITq9ee8Jo53SZPOrWh2C+v21yaIQEZPd+D3YQmVf9S1tve6USQc0MEVKmENxbGXkDDk7VCY9hSdw4pm2SNx/hXCNpp5HXTUfeJ9zE0bgOZ+BQyT/tK5H6c/zE7A/1Fwpnp0UUfYdxw9AAvSXbC8NHI9Kh4W+8Wy3REGJkbWSV7ey28qvkQqJu6
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(376002)(346002)(136003)(39850400004)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(122000001)(38100700002)(2616005)(83380400001)(26005)(71200400001)(66574015)(36756003)(31696002)(86362001)(31686004)(38070700009)(6506007)(6512007)(478600001)(316002)(110136005)(66946007)(66556008)(66476007)(66446008)(64756008)(54906003)(91956017)(76116006)(2906002)(8936002)(4326008)(44832011)(8676002)(5660300002)(41300700001)(966005)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?R3RhalJzRGluNUg5aml5cGd4eDhuYTdITGxXME52SUd3cWt0Q3p4L04weWRq?=
 =?utf-8?B?Q3ZraDdVdllFQ0FETDJXQWpnUENWRklxbVo3bFRVaVVtZVNpY1kwbE9TMnIz?=
 =?utf-8?B?UzBXOG9zMEE3NkdjNmZjdmlJQTlNSHhLeDdueStLaVVaMmZJOWtKZHE1RkUr?=
 =?utf-8?B?cURCQ1dNUGZnaVVtMm5IUTBGRU1vTU0vc1FHUEVOQkZOdENMYlpUdEtkNkhJ?=
 =?utf-8?B?OHdFSHF6SVVxMVFpSUxhZUVTMCs3QjlHZS9zdE9QYVJwekdTa0FKS0tqbzQ0?=
 =?utf-8?B?UklaUGU5VzkxU0o3WG1Hc0FTUUV4WWd2ZGhWaDRlSzNjUDV1bGEzeTFaNVBp?=
 =?utf-8?B?VXNIL3h3VnZPczJaSzUxQmtjd3I5M0Jmenh3MFdLK09ZTDdxcE8xY0FKclY5?=
 =?utf-8?B?czBDWXdJMkxCdndyMmFLa3N0WXFxb1Z0Q0Z2MXlmWWVCOTRjZE1jd2NJTEo4?=
 =?utf-8?B?L2UrK0VkNGZSTEp4K1NVQWRKY1JBR1dJd3RqejVKNUVKR0dXRXllTkVkOXQv?=
 =?utf-8?B?d21oSk0yZ2R6WnJxQW43U3lkOTN0RzY1RVJNaWlub3hqWWkyem5Sa3RKVk9G?=
 =?utf-8?B?dnpyOTg1TTJveVRvNkQ3OXIxM3llYzI3ckZPNm1xYU1zaXlNdFkvNDFjV0Nq?=
 =?utf-8?B?Ly80WHprYU9pSjNOemU5dXIwV1E2cVRybC9pUUc5ZG16ZUU2cFlhbVhXSHdK?=
 =?utf-8?B?UCtBYkIrVGN1WDhoUXp1Zk1oUnl3WmVCR0F2a3lSVnpDbGw4Z2I1MWk3bzVR?=
 =?utf-8?B?TmNubDRxUXhobEdQTXFMbTN4Z1puSGNXK2JnQ3VUZm5tRlNTcUFObXdIekpZ?=
 =?utf-8?B?ZkQwcjNBTHNoSU1xeUM4Q0szd1ZrcGZVT3hoRlA3UXltSmF6WGJDL1B5YmM0?=
 =?utf-8?B?QlZWS1c5REIwOHB6bzgzUmVhTk8rMHVUSHJ0R1A0c09qRkpQTnZDTVhTUUZT?=
 =?utf-8?B?blhGUGR4QVdhRFNhdFpzZnVzbytDV3hqamVEKzQvSURZQVprM3prTURaR2dS?=
 =?utf-8?B?OTdVTGFCZFlFVmQrN05IK1ZITXdaVU1wcG5oZXI5NTRkWXl1WjRVcTNibmht?=
 =?utf-8?B?dGpaOWlFRUM3aGQ4aVNQcFNWVFV0Q0RQMmJjYmtKZlloVnR0SVRlL3BaMGRH?=
 =?utf-8?B?aGlNS3c4T09ySHZmOFpJUHJ3S1FTYVgxaG5rcHoxSkNMdFQxb0NORGdHNldr?=
 =?utf-8?B?Y1F5ai9TKzVjSDFGN2I4RFc3Q3MxR1NqbDg2WTdQNnRRQlkxaCtFL05meEFp?=
 =?utf-8?B?TXRlNEQybHdnRXVTYmRiaUtpTDZOSG5LRXo0NVpNQUFrSUViTEFmclBpVjll?=
 =?utf-8?B?UnBPRnRKcVBpdVpYSWJWR2grK3VJUkJKWDlqUzhEMXUrMWlPekF1YVhwQldt?=
 =?utf-8?B?Skpabi94SWRMNllpWkZSVEZJU3d4OWdTUTg4N1ZzYTFjZG9pNHVrZkNyNHJM?=
 =?utf-8?B?eWN6bTFUZjZsL21FUE1WL2Iwcm5TYkhWYjRvWklMdDN3NkFwTmtrZk9OL1RR?=
 =?utf-8?B?NDNkd0ZMU0dWWkt1Ymt3bVo4UFFhVnhjWWJycmxNZElxeVdDVnp3WWFLSDVK?=
 =?utf-8?B?UGRLMUVIQldCK2dkZTVXV2pXeU51VU1jc1J3NDdoNWMvTXFCV2p0OTQ4N3Yv?=
 =?utf-8?B?Z2tqVG5WWE9TTE5oSDl3Zm9CcXZkVzE0NmpQMWszSFc3M0labmhDd09ieEVx?=
 =?utf-8?B?OWo5RTJLQm00eUcvRFRLaHJ2R2Q2Tk50U0hWb1JDMGhVM0VhWmFPOGEvcHFv?=
 =?utf-8?B?QW9iL1p2V0RLcTVPLy9ZQXFVTFpRbkpQREhHRVZDRkR5TThyYnhvbHE2aG05?=
 =?utf-8?B?RFErUTBab1ZiQm9HVDR1clUweFoyRDVsTnlrajB1NldUS0VsZExCVVJKVTFY?=
 =?utf-8?B?WVRBeng5Z3d3bjdLZklTMDFaai9MbWs4Q2xmQjZ6cE9rNkVJVEowMlI3TCtQ?=
 =?utf-8?B?VWtWb2tJRmNkOUZ2OFd2YWNqUGY3b2gyTEljRzVzY0VNSkpVMGFVenZhYy9r?=
 =?utf-8?B?NlJWclcxTEJCNmlqUzZ0c2syWHIyRmpWeG1Sd3RybjYrazUyS3RCbFFtSVE2?=
 =?utf-8?B?N3RuV0tKZnU3dDlKR3FzeitJVXJibXBWRTRTT09Dc0VlUzJCRC9Xa0ttR29E?=
 =?utf-8?Q?20ln2WwlcvzE3VcvpuA3xlFU1?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <09E2F02193F78642AA1217F4C1C1EF28@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a4c12da-035f-4144-05d9-08dbfd665d4e
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2023 12:07:09.6730
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2BFREY5IgGW1DJUnoSng7nUUj4HvCsaCcG2U7a2AHM5CUXJIsK9Dh6/mq6IklzwJoTTLUfa8lmWtNC9Vrod2FESwGCn3mAPrmgwZ+TfXBy0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB3194
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

DQoNCkxlIDE1LzEyLzIwMjMgw6AgMTI6NTgsIEdoYW5zaHlhbSBBZ3Jhd2FsIGEgw6ljcml0wqA6
DQo+IFtWb3VzIG5lIHJlY2V2ZXogcGFzIHNvdXZlbnQgZGUgY291cnJpZXJzIGRlIGdoYW5zaHlh
bTE4OThAZ21haWwuY29tLiBEw6ljb3V2cmV6IHBvdXJxdW9pIGNlY2kgZXN0IGltcG9ydGFudCDD
oCBodHRwczovL2FrYS5tcy9MZWFybkFib3V0U2VuZGVySWRlbnRpZmljYXRpb24gXQ0KPiANCj4g
Rml4ZWQgc29tZSB0eXBvcw0KDQpUaGlzIGtpbmQgb2YgY2hhbmdlIGlzIGEgd2Fpc3Qgb2YgdGlt
ZSBmb3IgdXMgYW5kIGEgd2Fpc3Qgb2YgdGltZSBmb3IgeW91Lg0KDQpQbGVhc2UgZml4IHRob3Nl
IHR5cGUgd2hlbiB5b3UgZG8gcmVhbCBjaGFuZ2VzIHRvIHRoZSBmaWxlLCBvdGhlcndpc2UgDQp0
aGUgY2hhbmdlcyBhcmUgcG9pbnRsZXNzLCBldmVyeW9uZSBpcyBhYmxlIHRvIHVuZGVyc3RhbmQg
dGhlIGNvbW1lbnRzIA0KZXZlbiB3aXRoIHRoZSB0eXBvLg0KDQpDaHJpc3RvcGhlDQoNCj4gDQo+
IFNpZ25lZC1vZmYtYnk6IEdoYW5zaHlhbSBBZ3Jhd2FsIDxnaGFuc2h5YW0xODk4QGdtYWlsLmNv
bT4NCj4gLS0tDQo+ICAgYXJjaC9wb3dlcnBjL2tlcm5lbC9lZWhfcGUuYyB8IDYgKysrLS0tDQo+
ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4gDQo+
IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMva2VybmVsL2VlaF9wZS5jIGIvYXJjaC9wb3dlcnBj
L2tlcm5lbC9lZWhfcGUuYw0KPiBpbmRleCBlMGNlODEyNzk2MjQuLjhlMGMxYThiODY0MSAxMDA2
NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL2tlcm5lbC9lZWhfcGUuYw0KPiArKysgYi9hcmNoL3Bv
d2VycGMva2VybmVsL2VlaF9wZS5jDQo+IEBAIC0yNCwxMCArMjQsMTAgQEAgc3RhdGljIGludCBl
ZWhfcGVfYXV4X3NpemUgPSAwOw0KPiAgIHN0YXRpYyBMSVNUX0hFQUQoZWVoX3BoYl9wZSk7DQo+
IA0KPiAgIC8qKg0KPiAtICogZWVoX3NldF9wZV9hdXhfc2l6ZSAtIFNldCBQRSBhdXhpbGxhcnkg
ZGF0YSBzaXplDQo+IC0gKiBAc2l6ZTogUEUgYXV4aWxsYXJ5IGRhdGEgc2l6ZQ0KPiArICogZWVo
X3NldF9wZV9hdXhfc2l6ZSAtIFNldCBQRSBhdXhpbGlhcnkgZGF0YSBzaXplDQo+ICsgKiBAc2l6
ZTogUEUgYXV4aWxpYXJ5IGRhdGEgc2l6ZQ0KPiAgICAqDQo+IC0gKiBTZXQgUEUgYXV4aWxsYXJ5
IGRhdGEgc2l6ZQ0KPiArICogU2V0IFBFIGF1eGlsaWFyeSBkYXRhIHNpemUNCj4gICAgKi8NCj4g
ICB2b2lkIGVlaF9zZXRfcGVfYXV4X3NpemUoaW50IHNpemUpDQo+ICAgew0KPiAtLQ0KPiAyLjI1
LjENCj4gDQo=
