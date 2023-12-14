Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0377812AED
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Dec 2023 10:01:49 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=RTNUIvLX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SrRDW4XpZz3vly
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Dec 2023 20:01:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=RTNUIvLX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::601; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20601.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SrRCf1YbMz3vX2
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Dec 2023 20:01:01 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=etKgXqIrs828EemeJ7MKDpHZa2tXtBfwC4C6/Z44PFT5vcIS5g91oggrOhgQEWo7e9VSg36XpUMWNgnqOfRTtL9pqnjAkboLDdfoBDAhBJSo/zB59h0120RFL2T/9ikDyXCZ1jyYD340kfQpxWLcAVrbQfW18Ku1DvfGcsSk5H9I7VEaSk2/3VusLUIPZyIOtyJJeELCIc4sAd78azRRuiWkCTl0L/t5udfIHGF+9hdnLrszdb0kLC2+3xnZIme6a3stljD+3cH7PbeNtPo4Z4pjtsDANIhfasI2DTOUMAnv47YqU9OrA9wwCqCpMdyOozVTvbVtkStE/4C3DfocVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bvwfZpKPULduv5ChTs6A0rFOcJeHTuqax18gvWYt014=;
 b=iyh4t1JaNZ2QR18o/bgORlbuZQPgZLc5SlHh1TkuU8JkiD/x/QPbk0zpL23SlsD6rda94G5MTdoMu0AZAAu9iH0YKAldPEYwtkyggdX60yHnpFZ59d+BeRu/u+xEb5srSLQKFoAdcVEG/IsDAuxY0ZM1HmvhUGWaSQ9dL50obFDao1oQBiMnDWGvOuMeeDMdRatkq4EKxWz+aC0ogt5I+lXdr4BjgM8588MdzXtuFFkEgkA8XfjC8A0bMApCKvRvp/aLWaK7Xbaa3uPUEo3+8QGKQCunG7Katdl8fptqKDiOFWMJU+qmIvYpK/f13uw+SAMSCjALEz7dh2hA/piQ6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bvwfZpKPULduv5ChTs6A0rFOcJeHTuqax18gvWYt014=;
 b=RTNUIvLXxr9Tr7pHkl3e9IbZ9y5VvgcLjy0WwRDtOKfW66tVWgENWWIMTGMnoSVy129tuuSibyp3izfEjMCn3E5CmI+Ca8am7YnDY0By+Hvy+T9aPAUei4iN474huKI5MHl9SRFKY555GFX4hrY3L+ilAAldTgS9df1Ul/QHX4yawHbEjhSO8wtl01s8gOHj+xYmSQgCEVkJ9jC7q1cgNGA+a0u4EBkOs0pzsSUcuLvn9alKw3LppS3c2xY4bYgXM3vvDY9OVN+gOMP6fxJfJ1YoxsIvG0GTt4MYRfy7l+ZBEkZZNiqQrTWuxwks3b3NzIMeKmcZUAmw7CS9h5CdQw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2040.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Thu, 14 Dec
 2023 09:00:41 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f788:32b4:1c5e:f264]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f788:32b4:1c5e:f264%7]) with mapi id 15.20.7091.028; Thu, 14 Dec 2023
 09:00:41 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Nicholas Miehlbradt <nicholas@linux.ibm.com>, "glider@google.com"
	<glider@google.com>, "elver@google.com" <elver@google.com>,
	"dvyukov@google.com" <dvyukov@google.com>, "akpm@linux-foundation.org"
	<akpm@linux-foundation.org>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
	"npiggin@gmail.com" <npiggin@gmail.com>
Subject: Re: [PATCH 09/13] powerpc: Disable KMSAN checks on functions which
 walk the stack
Thread-Topic: [PATCH 09/13] powerpc: Disable KMSAN checks on functions which
 walk the stack
Thread-Index: AQHaLlJJWEBA6253AEOXkBRrg23pE7Coe1+A
Date: Thu, 14 Dec 2023 09:00:40 +0000
Message-ID: <e70b4365-cb0c-4565-b7b1-ac25be85c5a6@csgroup.eu>
References: <20231214055539.9420-1-nicholas@linux.ibm.com>
 <20231214055539.9420-10-nicholas@linux.ibm.com>
In-Reply-To: <20231214055539.9420-10-nicholas@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB2040:EE_
x-ms-office365-filtering-correlation-id: c1251bf7-fc1c-451e-543f-08dbfc8325ef
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  3f7/Yi7RPHzUMpDtpGdZzX5uoy2pC+xhn3ewHOSSrotK12c9s+piuMH7lrPgkKsyG3z0LAmGzu8kqEayNqTl77flkxbmt92gb7ZTgIhh2W+z2ImgfUfUgI/RCxm0U7E+IjRBp1BcDUP6BHHNPFhdu1Mof3YaEraAGeXet2qfMjBAIdygAMaRC8ld3zL/QKTZbgvcmZJ3YcxKXm4BxN6Z97D14T1jEUc0HeRpN+PBiODbuf+FyRb8vGP11r2xxlVbOMeqnrASejmUfSKJ2wDJLoJhL3RJSQLWdarbQJOxA3m/ppOpZ+PWstS8Y+wtiFMZWRnxgQUSi2ZzrbxoiGQ8n1y84MPtH2YmZjSIy8E5f/I9JJf2jppBxStfI6a4KRICaR+DDkQsZfZr7g5HfAwxGxPOh4oXzEj9QK6XVybSV3i0EEIF6WI6rPyEVJr8glYQx7kzkLURBnNl+SECFFUUIlUHsT0g1q8+0qZ43apEOEdfRevehmGQp8UN/QIH5/d1ym2bXHCLRYG8wnxFmiaCaHdMP3XGeRXsm/HeE0a6akLoSBECwVMvBM9yZTrT1yZD8fj8LF4c8jsu2EkPdffPSFipTKEBBWHwHfVvydgVDXBBz6FUxvAH39E8N+4wfieqK7yVwEl/cA7waD9q1GyWaKHsaIk/BbHN2RmLf3m0Lf4=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(346002)(136003)(376002)(39850400004)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(7416002)(2906002)(31696002)(6486002)(478600001)(41300700001)(38070700009)(31686004)(122000001)(86362001)(5660300002)(44832011)(4326008)(91956017)(110136005)(76116006)(64756008)(66446008)(66476007)(66556008)(66946007)(316002)(54906003)(83380400001)(26005)(2616005)(71200400001)(8936002)(6506007)(6512007)(8676002)(36756003)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?YllFcXUwZ1J6cGU3ZmRFczBTb3p3bzEyNXZuWFNsS2pmU3pQWnhER2piQmtj?=
 =?utf-8?B?aVVBbzFuRmR3T2ZYWmx1NzFRTDgvRjBtMkl5bkkxRFJNQmw4TU9hYVVFN2di?=
 =?utf-8?B?WUlwaDYwcGFLZVB6cit2SjBpOURBNm1Oa3pPSnN3UUtjWCtuUTNCQjR2TkNk?=
 =?utf-8?B?cTBNd3B0aENCRmJBSjN1dHBjNUtuTjlYNUlVR2Q4ckRTS2IrYWZtWm1JcWp4?=
 =?utf-8?B?dm8yMUppWFlJWVNSeUoxeXd1SStiNmlwd0JoNWw1akt2S2IvQjVLNWVONU90?=
 =?utf-8?B?UmdsMStIN2lKTDNPNVljQ3JpTURnWGkxVW44bGFydnQ2UitSbzFWY1Z4Ry9L?=
 =?utf-8?B?OW51Q1N5QVdmNmZhYWZlSkxuSENEYmhaTHVQT0FybVF0SXQyaWhmTGVvQUd1?=
 =?utf-8?B?a3hpT2k5czdHYmY2bDRsOG5tT0M4eHV3Q0ptM0pmZjd4RjY5c1YyM0VTU284?=
 =?utf-8?B?RFZ0SjRZekgxemVFVnZpcVI3K01yQWRaRXFWVWRRZENxK21mUHkrQk5iaGg5?=
 =?utf-8?B?b3lpYzFWV21RblRobzNFRVlvWmlzNUJvb2NjOVdtYlBEL05GYzhodjA0d3Bn?=
 =?utf-8?B?bXZGdW0yMkVsWmxJSWVPZE94Qm5aYS9PbjJHMXlvOG54bjd1R1BuUTVKZGhV?=
 =?utf-8?B?amMwNTFocE4rVWpxREI1dUVMTEFrODhVZ0ZrZ0dyVk9HMjNDaUUwRnFjRlhl?=
 =?utf-8?B?bjdKZ09UN2tON1pFMWltdzRGTTJWRlVCT1VlZUVnY29lREpzQ2dGV0NySUpk?=
 =?utf-8?B?Y2FUenB6NEJYOC8wTDdEWEVJdXR6M0Zxb2dUSnZGMGNsOE81ZHNrNS9wZ3dv?=
 =?utf-8?B?MTF6UnBNQWZEbTNtQjlqUVJYWGcwbk9uckRVaHUxUG84Y3dOZ1QvTXFHb2NJ?=
 =?utf-8?B?RWdvMUFLT21QOVNQTEhEUFZlc0lqSy9TWFNmV3VsM3FTY0h4R3lUSFBoMkpa?=
 =?utf-8?B?SlA5Rjg4cU9tUUptZURzUWRCdEFpOFRyZk80NW80aVFWb2dQT1dybGYvVEdP?=
 =?utf-8?B?by8xN1liMjR3YWJDVkNDbTZuU1BHVFYvQ0o3UmQyRzEvMDZRc1E5aEYzOHBi?=
 =?utf-8?B?ams3bXN2andkckU3Qm1JWU9UMWJ2U0s2RXU1em9ULzYvNEpwbFZXR0JSWmIy?=
 =?utf-8?B?K1dGRHkrVkdsaXY4SUt0dUZLWlFMRjlCaFFuajlhbEozVE9qSnExR00xU01t?=
 =?utf-8?B?SHF1bXZNTjB5TTB4OGZwZXhIOER3QWh1L21XbWNCZjcwK1FrVFNIaEt0L3gr?=
 =?utf-8?B?SGVBd1huOXRKQlMrMmZjNFV3MXQ2Rk5zSEtZNnN5dDVFM1hjUHJpdnJUcWxF?=
 =?utf-8?B?cXhJbG1XOE44RmlkazVaRXJxT0hsdmdHYS9wTUZ5VG9NVGRva3gyU0h3Rjk3?=
 =?utf-8?B?eEZRQ2tkRFdDSHFsK0VtZG9KemFKVFlUWjdhRDh2NGM4TXlQdmkvQmExazdX?=
 =?utf-8?B?aEdoK3lBdkh6Y2VhZGhRNCtadzMzampaNXFRRktzTTBwK1Q0bGVINU56S0Nv?=
 =?utf-8?B?cXgwTXhMc2tJa0JhMEYvVCt1SThnRmx5dXFlelp3Tm91d2FEWTNCNTJ0ODFj?=
 =?utf-8?B?SlhLeHNmNnpvZkMwRHFsU0ZEd3MyZnJwWnhaaXRPUmxLZUVDK1ZFaE03UlFB?=
 =?utf-8?B?MGsyMjN4NjE1eXRrNlhEeUVET0JuSmdCT3RQZzZTN01vYmQyL29Zc1cyODNp?=
 =?utf-8?B?dkZkcmhHblk1QWlBWU1LaDEvTUZzN0VGeGJld0FHdmZHWTdvc3p2SHpNblNN?=
 =?utf-8?B?Vzk5L2FaQVFRRi9ranhKblZmL1NRa3BjK05LWXJpVjNvM3dRRkFCY0czTFcw?=
 =?utf-8?B?cTNSb2NXS05tSXBJa3owN3drbGN0UElqYmJSaCtqMFByaU9uUTFUN3Zqd2NJ?=
 =?utf-8?B?OHNIejNjYzVTNXZ0NUVxQ1NxUmNjZEUwTG9DQjR4TFp4aVBoaER2WXlkODFE?=
 =?utf-8?B?SEJkdXEyY0ZHVWdNZDdkUk9QNzhUSk5RV2JOUzExSE1mc3hOcEV4a1BBN1JP?=
 =?utf-8?B?VGcrQzN4bkpaRWE3YnRobVhmMC8wK2xIanc1c21oVU42VWNtZkJGZkxId01W?=
 =?utf-8?B?cjIrR3k5TFRuZ0dmU3VxWS9sbktwZHp5WXoyV0xsN3BiMVMxRVVWVnFQMXh6?=
 =?utf-8?B?M2dIM0dUUmN5dVNVaUVxQXNJRVAxNGVyM3ZiVUh0OEZFZzAweHN2RnFtSFZo?=
 =?utf-8?B?K0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A61D03C90DADE7469E4CB76013F56659@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c1251bf7-fc1c-451e-543f-08dbfc8325ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2023 09:00:40.9865
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XyMlTIS1uMIGhd9PlKLKgo5/wiwepjfQfa94qryJyap/JfzhCdWGcDJ38noyGT13CkI13bn4fU5p6PohJB1dOLHKqjTkEeNk51R8cQYb8LI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2040
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
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "iii@linux.ibm.com" <iii@linux.ibm.com>, "kasan-dev@googlegroups.com" <kasan-dev@googlegroups.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE0LzEyLzIwMjMgw6AgMDY6NTUsIE5pY2hvbGFzIE1pZWhsYnJhZHQgYSDDqWNyaXTC
oDoNCj4gRnVuY3Rpb25zIHdoaWNoIHdhbGsgdGhlIHN0YWNrIHJlYWQgcGFydHMgb2YgdGhlIHN0
YWNrIHdoaWNoIGNhbm5vdCBiZQ0KPiBpbnN0cnVtZW50ZWQgYnkgS01TQU4gZS5nLiB0aGUgYmFj
a2NoYWluLiBEaXNhYmxlIEtNU0FOIHNhbml0aXphdGlvbiBvZg0KPiB0aGVzZSBmdW5jdGlvbnMg
dG8gcHJldmVudCBmYWxzZSBwb3NpdGl2ZXMuDQoNCkRvIG90aGVyIGFyY2hpdGVjdHVyZXMgaGF2
ZSB0byBkbyBpdCBhcyB3ZWxsID8NCg0KSSBkb24ndCBzZWUgaXQgZm9yIHNob3dfc3RhY2soKSwg
aXMgdGhhdCBhIHNwZWNpZmljIG5lZWQgZm9yIHBvd2VycGMgPw0KDQo+IA0KPiBTaWduZWQtb2Zm
LWJ5OiBOaWNob2xhcyBNaWVobGJyYWR0IDxuaWNob2xhc0BsaW51eC5pYm0uY29tPg0KPiAtLS0N
Cj4gICBhcmNoL3Bvd2VycGMva2VybmVsL3Byb2Nlc3MuYyAgICB8ICA2ICsrKy0tLQ0KPiAgIGFy
Y2gvcG93ZXJwYy9rZXJuZWwvc3RhY2t0cmFjZS5jIHwgMTAgKysrKysrLS0tLQ0KPiAgIGFyY2gv
cG93ZXJwYy9wZXJmL2NhbGxjaGFpbi5jICAgIHwgIDIgKy0NCj4gICAzIGZpbGVzIGNoYW5nZWQs
IDEwIGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvYXJj
aC9wb3dlcnBjL2tlcm5lbC9wcm9jZXNzLmMgYi9hcmNoL3Bvd2VycGMva2VybmVsL3Byb2Nlc3Mu
Yw0KPiBpbmRleCAzOTI0MDQ2ODhjZWMuLjNkYzg4MTQzYzNiMiAxMDA2NDQNCj4gLS0tIGEvYXJj
aC9wb3dlcnBjL2tlcm5lbC9wcm9jZXNzLmMNCj4gKysrIGIvYXJjaC9wb3dlcnBjL2tlcm5lbC9w
cm9jZXNzLmMNCj4gQEAgLTIyNzYsOSArMjI3Niw5IEBAIHN0YXRpYyBib29sIGVtcHR5X3VzZXJf
cmVncyhzdHJ1Y3QgcHRfcmVncyAqcmVncywgc3RydWN0IHRhc2tfc3RydWN0ICp0c2spDQo+ICAg
DQo+ICAgc3RhdGljIGludCBrc3RhY2tfZGVwdGhfdG9fcHJpbnQgPSBDT05GSUdfUFJJTlRfU1RB
Q0tfREVQVEg7DQo+ICAgDQo+IC12b2lkIF9fbm9fc2FuaXRpemVfYWRkcmVzcyBzaG93X3N0YWNr
KHN0cnVjdCB0YXNrX3N0cnVjdCAqdHNrLA0KPiAtCQkJCSAgICAgIHVuc2lnbmVkIGxvbmcgKnN0
YWNrLA0KPiAtCQkJCSAgICAgIGNvbnN0IGNoYXIgKmxvZ2x2bCkNCj4gK3ZvaWQgX19ub19zYW5p
dGl6ZV9hZGRyZXNzIF9fbm9fa21zYW5fY2hlY2tzIHNob3dfc3RhY2soc3RydWN0IHRhc2tfc3Ry
dWN0ICp0c2ssDQo+ICsJCQkJCQkJdW5zaWduZWQgbG9uZyAqc3RhY2ssDQo+ICsJCQkJCQkJY29u
c3QgY2hhciAqbG9nbHZsKQ0KPiAgIHsNCj4gICAJdW5zaWduZWQgbG9uZyBzcCwgaXAsIGxyLCBu
ZXdzcDsNCj4gICAJaW50IGNvdW50ID0gMDsNCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9r
ZXJuZWwvc3RhY2t0cmFjZS5jIGIvYXJjaC9wb3dlcnBjL2tlcm5lbC9zdGFja3RyYWNlLmMNCj4g
aW5kZXggZTZhOTU4YTVkYTI3Li4zNjliOGIyYTFiY2QgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93
ZXJwYy9rZXJuZWwvc3RhY2t0cmFjZS5jDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9rZXJuZWwvc3Rh
Y2t0cmFjZS5jDQo+IEBAIC0yNCw4ICsyNCw5IEBADQo+ICAgDQo+ICAgI2luY2x1ZGUgPGFzbS9w
YWNhLmg+DQo+ICAgDQo+IC12b2lkIF9fbm9fc2FuaXRpemVfYWRkcmVzcyBhcmNoX3N0YWNrX3dh
bGsoc3RhY2tfdHJhY2VfY29uc3VtZV9mbiBjb25zdW1lX2VudHJ5LCB2b2lkICpjb29raWUsDQo+
IC0JCQkJCSAgIHN0cnVjdCB0YXNrX3N0cnVjdCAqdGFzaywgc3RydWN0IHB0X3JlZ3MgKnJlZ3Mp
DQo+ICt2b2lkIF9fbm9fc2FuaXRpemVfYWRkcmVzcyBfX25vX2ttc2FuX2NoZWNrcw0KPiArCWFy
Y2hfc3RhY2tfd2FsayhzdGFja190cmFjZV9jb25zdW1lX2ZuIGNvbnN1bWVfZW50cnksIHZvaWQg
KmNvb2tpZSwNCj4gKwkJCXN0cnVjdCB0YXNrX3N0cnVjdCAqdGFzaywgc3RydWN0IHB0X3JlZ3Mg
KnJlZ3MpDQo+ICAgew0KPiAgIAl1bnNpZ25lZCBsb25nIHNwOw0KPiAgIA0KPiBAQCAtNjIsOCAr
NjMsOSBAQCB2b2lkIF9fbm9fc2FuaXRpemVfYWRkcmVzcyBhcmNoX3N0YWNrX3dhbGsoc3RhY2tf
dHJhY2VfY29uc3VtZV9mbiBjb25zdW1lX2VudHJ5LA0KPiAgICAqDQo+ICAgICogSWYgdGhlIHRh
c2sgaXMgbm90ICdjdXJyZW50JywgdGhlIGNhbGxlciAqbXVzdCogZW5zdXJlIHRoZSB0YXNrIGlz
IGluYWN0aXZlLg0KPiAgICAqLw0KPiAtaW50IF9fbm9fc2FuaXRpemVfYWRkcmVzcyBhcmNoX3N0
YWNrX3dhbGtfcmVsaWFibGUoc3RhY2tfdHJhY2VfY29uc3VtZV9mbiBjb25zdW1lX2VudHJ5LA0K
PiAtCQkJCQkJICAgdm9pZCAqY29va2llLCBzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRhc2spDQo+ICtp
bnQgX19ub19zYW5pdGl6ZV9hZGRyZXNzIF9fbm9fa21zYW5fY2hlY2tzDQo+ICsJYXJjaF9zdGFj
a193YWxrX3JlbGlhYmxlKHN0YWNrX3RyYWNlX2NvbnN1bWVfZm4gY29uc3VtZV9lbnRyeSwgdm9p
ZCAqY29va2llLA0KPiArCQkJCSBzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRhc2spDQo+ICAgew0KPiAg
IAl1bnNpZ25lZCBsb25nIHNwOw0KPiAgIAl1bnNpZ25lZCBsb25nIG5ld3NwOw0KPiBkaWZmIC0t
Z2l0IGEvYXJjaC9wb3dlcnBjL3BlcmYvY2FsbGNoYWluLmMgYi9hcmNoL3Bvd2VycGMvcGVyZi9j
YWxsY2hhaW4uYw0KPiBpbmRleCA2YjQ0MzRkZDBmZjMuLmM3NjEwYjM4ZTliOCAxMDA2NDQNCj4g
LS0tIGEvYXJjaC9wb3dlcnBjL3BlcmYvY2FsbGNoYWluLmMNCj4gKysrIGIvYXJjaC9wb3dlcnBj
L3BlcmYvY2FsbGNoYWluLmMNCj4gQEAgLTQwLDcgKzQwLDcgQEAgc3RhdGljIGludCB2YWxpZF9u
ZXh0X3NwKHVuc2lnbmVkIGxvbmcgc3AsIHVuc2lnbmVkIGxvbmcgcHJldl9zcCkNCj4gICAJcmV0
dXJuIDA7DQo+ICAgfQ0KPiAgIA0KPiAtdm9pZCBfX25vX3Nhbml0aXplX2FkZHJlc3MNCj4gK3Zv
aWQgX19ub19zYW5pdGl6ZV9hZGRyZXNzIF9fbm9fa21zYW5fY2hlY2tzDQo+ICAgcGVyZl9jYWxs
Y2hhaW5fa2VybmVsKHN0cnVjdCBwZXJmX2NhbGxjaGFpbl9lbnRyeV9jdHggKmVudHJ5LCBzdHJ1
Y3QgcHRfcmVncyAqcmVncykNCj4gICB7DQo+ICAgCXVuc2lnbmVkIGxvbmcgc3AsIG5leHRfc3A7
DQo=
