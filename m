Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 239AF68EEEE
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Feb 2023 13:25:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PBfMq6cfdz3cgy
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Feb 2023 23:25:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=nozx7lKW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:fe0c::61c; helo=eur04-db3-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=nozx7lKW;
	dkim-atps=neutral
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on061c.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0c::61c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PBfLr0ZWXz3cd8
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Feb 2023 23:24:18 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O6uWikwRibTElTPmOKvm49s1z5wXNcitdtI0EbDIPPNL296xNEcv/f4Td657RrnGAPDlNiw4juPMBowM004dgPCY62/Jkt3GByGUI9eBiqIO5QN4BAp9bBtk48Oor13sdtf2ucHBPuIgvI0/SExdkO5FqaNGYnCGbo+USRfApDh0xfYSTo3wiDliq+ab+vKbu7mHUJ4rCt2RBHWLTzrWvGqBPseG2PZQSYsJLfCSBrKg1Z6tGLqGPox/6oAPTQ773Znwq4fwQq7qf1v48Go2oBSNGn97PWRU4lb0EYaNO10TImkr5Npjd488IhK8eJG7YIM4fpmgCus1ZyW9nqAybg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=76OOWkeubUx6Wwq+FokfNgoPKodb0wyCm5wtvOgI29w=;
 b=CWskoqOqdZX5kordphVAKaUYXJj2NgKgpMDVmjThVIzN+/cMW9yeQaPSl8Bv4YbJwKgsFQwyhlBm+3/v3k5kT35Ez+wKNihqDN9vzqVm0VnkdqubpjbcQVZzCgg72w0ZkM12Ar8Gg5hrXPZfRzOHigF6cUW0YyQSZ+uEAn/D5qgwu25lbjfSYM6xrqiqZtjrpDc0DA8rBud37KHUmOHJCQETSHH6jVRpYGKqZbgOZFJqzLSXSHfQcTGdrHuFHXeM2YYqKyTt7+6njbWDYpxrlNGkpdiB7w4FAFBsflMoMTzT2hiMD7PQATov2ogeGCaBiT5DIa7Tiwyyr/GNm3sefA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=76OOWkeubUx6Wwq+FokfNgoPKodb0wyCm5wtvOgI29w=;
 b=nozx7lKWtIvOPm2yagOn0D8wF2j9hHXYN7N5To07eUXl7gRO4YRvn9ceLFW2KgmZuOeTmx8Fy4N6RNTO08K+p+W5QFevQHtT0Qs8/frGvyVzFxctytPeuiYIUR1EGO2IadSroRH/I0FOSI1tFpfpGyLHWlryuta+WRafXMNmGODF/1KMS1RmHE2Y8KwEkEy7j2NoX5r6A1G7GR703ftxMRq7UHmqp41AqxeZrLiZyDFn6hfHmG3ckUbZxB2WsyCLsSzpICC3M9fyDfP+GtFgQNzwbqPBtmM9gazwpvaZ36AekdgHz2RmmJdUmBB3qw8Mmu4VSyV9MdSEXapcCuhwnw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2968.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1d7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17; Wed, 8 Feb
 2023 12:23:57 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097%6]) with mapi id 15.20.6086.017; Wed, 8 Feb 2023
 12:23:57 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Rohan McLure <rmclure@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, "linux-xtensa@linux.xtensa.org"
	<linux-xtensa@linux.xtensa.org>
Subject: Re: [PATCH v4 1/7] kcsan: Add atomic builtin stubs for 32-bit systems
Thread-Topic: [PATCH v4 1/7] kcsan: Add atomic builtin stubs for 32-bit
 systems
Thread-Index: AQHZO2zaljeNbslhQEmPfCmPMy0ctK7E+ZSA
Date: Wed, 8 Feb 2023 12:23:57 +0000
Message-ID: <fab33693-3a11-2649-0556-e4501faec418@csgroup.eu>
References: <20230208032202.1357949-1-rmclure@linux.ibm.com>
 <20230208032202.1357949-2-rmclure@linux.ibm.com>
In-Reply-To: <20230208032202.1357949-2-rmclure@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB2968:EE_
x-ms-office365-filtering-correlation-id: b05d4348-ac2b-43e1-3473-08db09cf59d0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  UvLziTN8+Js1TlwQ99/vZN/Hp+VL8VR4GU/s8rKKCUUxDBY1t7L73vN2ZnfOquvuFQUYvzz6tcm+sgtgDO1bzX6Z+l9JFIcoWMfsNCDJP4I3OZZcmB3ifUinVQv2iD4KWCbmGz0fnhyNN8g/PtlLw7uCJKqFKjA/zb3jble6PxcDdY2Js+n+3HE7Xrb6iFE1aD/XiXwzqdFpyTtD1MhQgHc4+tWV7seFzZe3gyMEWiObyC+edPKxRUDtFpf8I7OlAdOSpvnf5Hv8qqFIkzVtm1PX6gDUKd/M7Y81eEWo38jldRh+VHm8c1FPwQlszcNObsoPEEavTTazqLBGAYazAgrRi6q3/RCQ4RtLRGaD4mSil4sU1yjcKzctjGe70dOfA5H3zkqfH3kwdcUWgVMKpMi2ONSeYLC4/GoEDf7qmUmx24cq2hFYZusV8JgWCskkzY8YAetMoW1litdVDt6PmIIU3z1UaV/nzkBKyaYt7bYY90AX0c+yZLwDlkHOWign4h0UYp9427nOdNDXLt0QsVj2Ba0w3i8Azez5bf7RHmd2QOKKtUYX2qulBpezTmVUUrGw+cd0q5ApHekh3nU1+deZeMtNZBUzxUQIX98VGX91alUX2HoMkza9M6++zR1C7Cl0j7+OoSUp6L5f5pqM9mZXL0Zsl61ujGYsjQN4Qk1LJpq2WxFz8JMPSL9K8PB9Gvs07QM9ofaySNrPU13Qyu+QEQihRDzkE8auk+XQBn4awA0Ro/TXUPqjGbPeA5IUhl8xTXu40+TB5mVoKxfi7w==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(136003)(366004)(346002)(39850400004)(376002)(451199018)(31686004)(38100700002)(36756003)(38070700005)(31696002)(122000001)(26005)(83380400001)(2616005)(6512007)(186003)(6506007)(71200400001)(2906002)(91956017)(4326008)(66946007)(66476007)(66446008)(64756008)(66556008)(8676002)(478600001)(6486002)(110136005)(76116006)(5660300002)(8936002)(44832011)(41300700001)(86362001)(316002)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?SkpLQUh6ZFF2dGN6Yjllckp6SVBTdVRrZ091ZS91LzdSZjgvTDFFRGZNZG9s?=
 =?utf-8?B?bDZWOGlFeEF5UVdrdWVSRVpUL0w4VzY1eXpSbVRDeGJjQ2dPQVVsaEJjdGJo?=
 =?utf-8?B?UUk2VHRCVFgzbkRvbmZ1QW9pVS8wVkxCelliYUlvaW16MkFqekVUNU5vYnJR?=
 =?utf-8?B?K1RKU0FXOG8zd093R1dHd3UzbVRzM1RvL243T3k0UGhPdE5SVmF1ZnRTUVBP?=
 =?utf-8?B?UXpJL0lFbTBLbTNNS3lyVit6MzFpcEdyM29YU1cvYW9jcEYwam11cktaZU5R?=
 =?utf-8?B?VEpMMlBpSXFTWGJueENVc3VjUU1zWHRUaWxaMVpQcEhadEZpblVwUFh2bVdp?=
 =?utf-8?B?MTEwZGZHWmkrVGxBRGxOenpOemR3VlhCQVJoV3l1U2dMU2w4cDZkWTEydVhK?=
 =?utf-8?B?RGZ5cmVZWGQ2WUZON21mMlViOWoraDFwVy9nT0dNUHI0N2tVVzlKVTMrYUtB?=
 =?utf-8?B?am1Gc2VPc3ZNU0xuVTVIMmZneEpzRmNTSWh2SE1Mc0JnMXdzRXcvNDkvZXVU?=
 =?utf-8?B?MVBwZW9qS3JzK3ZGV1ZOTDNFRDdFTGZySXVGbHg5a1B3cVNaZkJtRFZRWlhy?=
 =?utf-8?B?LzVscEt5bDM4U0ovZktCSC9hSWdIdVdNV2Fkb0xiOE8zcHFlVXJkQ1VocFJ0?=
 =?utf-8?B?WFNSSUdUSjlwb3laUDFqNzFMeDRBZ21tR3dYamxFV25YYXlaUkFaODVCbVNS?=
 =?utf-8?B?TDFvZmh3RmlERm90cGM3MWpFU09YUnEvdytuQWowWGlsL040YW81blRxWXk0?=
 =?utf-8?B?OFB6WVhTY2JTWnRFbm0zd09UTDBwMSttQU5SelY2L0RPZWQzREk0QWp6UFlh?=
 =?utf-8?B?Q3dxY2t2VllQaGIzMWNMSUEybVlRNmUzazlxK2ZyU0gvWG1UOXdIMzg3VCsv?=
 =?utf-8?B?TGJReXlDVWRLVUxsdWM1UUxEdVBUUWc5ZkxobklEejR2dEdVNXkwVGxLbGc4?=
 =?utf-8?B?c0RvaVhKQzNDaEFnbTl5cTM2SkNkaW5LdGx1cFVxbGRyYmNQQWwwSytmaExR?=
 =?utf-8?B?dXFGaTJnRlZpNWlnYnBoaFVOSTlObmZGRjQ2WFBsV0U4b1BmM0J3TERKV2xT?=
 =?utf-8?B?T1R1ZUlUYWdVRVIrRUJza1dPbjNMNjRLUG5Bc2UrTno0c28zM1U3OXRyVTQx?=
 =?utf-8?B?T1AyVC85blI1UnFCb09tL0JpbWZxOVVNbG9QREpKcGQva1lwUW5IUFpMZUZi?=
 =?utf-8?B?U2NTRFlDRVpUVmVQVnZWUmYvVm03RkdRbm9NUEs0VEo5UDI3cGIzcENhUE9l?=
 =?utf-8?B?Nk1td24vbHhDNm1kOUNPMmpLMm1zRG1nenhVODdjeml3WGQ4empzK2tEQlhy?=
 =?utf-8?B?MUdQMGpSQkc5eWZxaGdQeGZFWE9NSm5qSE1CRkY5MWdNL0VwTktmamZ1Ulgw?=
 =?utf-8?B?bFdhMCt2RUNMWEZFSFBFUXA0YlRiNmd4M3VOeUNiYjlpMHpDTDBnZStUZkk0?=
 =?utf-8?B?SDFpWVd4emtzSXh0T2FBWmVtMjVNM3J2OC8xRUZmbVdBTkppbjNJOHRMdktl?=
 =?utf-8?B?OVIvUWNjUlR6QUxPNk9NamlINkNnNzhqR240M0F5ZHZ6TkM3TUxXYXk0RFNt?=
 =?utf-8?B?OVhOYngvNXdYSnRlVnM5N0pPQTRKL0tBOUQzTWw0dTdIT09iS1REVnRWb1hR?=
 =?utf-8?B?MUhxZXJ6QlhEejZ3dVZQZmNDVFlMdVczZXo5ZWpKYTNEUy9yZkVHSU0rdHZk?=
 =?utf-8?B?ZitWZVF5cEhyTGN1ZjE1ekNZeE9May9EblplZjBFeXBiaEZVbFVOSzlJc1Np?=
 =?utf-8?B?MSsxY3pBV1FETlI4SG9ndkhFWEdiQ05uYnhkbE5kNHQ4eXJrV3pPSWNQeDQ0?=
 =?utf-8?B?eEk1dzd2LzNGMHVVanphTmRhWXVnN01pUzIyUTd5ZmIvU3M4aEhKWTFpZWE3?=
 =?utf-8?B?YXlIY1dXQVczTGVtRGVLQVo1NmkyUlFQUlJkY09MT3NJc0k0dDIyck9UQlM5?=
 =?utf-8?B?WHIzNk1TTjEwL3NMZ2hIckw5QVRuN0FWS3Z5c0lha3FQdFBXL093QW9jZXFu?=
 =?utf-8?B?NXN4enlZdjM4a0NrWmFZRENHZFVzdGNqU1dLaXZZdDBHb25ITjE5T2k4MUpJ?=
 =?utf-8?B?WnlPb2JJUXVZUkpDcmZoV210Szg3QkZhditYSDdpMWpZL3dZR3BKUEo3dWk0?=
 =?utf-8?B?bGNwVkhXNHFGMDgxb0Q5RG55cjVjMTQ5THRBbTcxV1lCblFrbzFPUnByUGpK?=
 =?utf-8?B?Mmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E4F712FF880E5E4E967535041F293490@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b05d4348-ac2b-43e1-3473-08db09cf59d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2023 12:23:57.2285
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qPM6G019cOfZHgjpOU759pEADsskVWKab/8el8MNsj03L35HvqvYGNTT1ry/2btzA6Hg2FsemcUcaf/Ulob3XKICp26cVWOPbih8RwsXMg0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2968
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
Cc: "chris@zankel.net" <chris@zankel.net>, "elver@google.com" <elver@google.com>, "npiggin@gmail.com" <npiggin@gmail.com>, "jcmvbkbc@gmail.com" <jcmvbkbc@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA4LzAyLzIwMjMgw6AgMDQ6MjEsIFJvaGFuIE1jTHVyZSBhIMOpY3JpdMKgOg0KPiBL
Q1NBTiBpbnN0cnVtZW50cyBjYWxscyB0byBhdG9taWMgYnVpbHRpbnMsIGFuZCB3aWxsIGluIHR1
cm4gY2FsbCB0aGVzZQ0KPiBidWlsdGlucyBpdHNlbGYuIEFzIHN1Y2gsIGFyY2hpdGVjdHVyZXMg
c3VwcG9ydGluZyBLQ1NBTiBtdXN0IGhhdmUNCj4gY29tcGlsZXIgc3VwcG9ydCBmb3IgdGhlc2Ug
YXRvbWljIHByaW1pdGl2ZXMuDQo+IA0KPiBTaW5jZSAzMi1iaXQgc3lzdGVtcyBhcmUgdW5saWtl
bHkgdG8gaGF2ZSA2NC1iaXQgY29tcGlsZXIgYnVpbHRpbnMsDQo+IHByb3ZpZGUgYSBzdHViIGZv
ciBlYWNoIG1pc3NpbmcgYnVpbHRpbiwgYW5kIHVzZSBCVUcoKSB0byBhc3NlcnQNCj4gdW5yZWFj
aGFiaWxpdHkuDQo+IA0KPiBJbiBjb21taXQgNzI1YWVhODczMjYxICgieHRlbnNhOiBlbmFibGUg
S0NTQU4iKSwgeHRlbnNhIGltcGxlbWVudHMgdGhlc2UNCj4gbG9jYWxseSwgYnV0IGRvZXMgbm90
IGFkdmVydGlzZSB0aGUgZmFjdCB3aXRoIHByZXByb2Nlc3NvciBtYWNyb3MuIFRvDQo+IGF2b2lk
IHByb2R1Y3Rpb24gb2YgZHVwbGljYXRlIHN5bWJvbHMsIGRvIG5vdCBidWlsZCB0aGUgc3R1YnMg
b24geHRlbnNhLg0KPiBBIGZ1dHVyZSBwYXRjaCB3aWxsIHJlbW92ZSB0aGUgeHRlbnNhIGltcGxl
bWVudGF0aW9uIG9mIHRoZXNlIHN0dWJzLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogUm9oYW4gTWNM
dXJlIDxybWNsdXJlQGxpbnV4LmlibS5jb20+DQo+IC0tLQ0KPiB2NDogTmV3IHBhdGNoDQo+IC0t
LQ0KPiAgIGtlcm5lbC9rY3Nhbi9NYWtlZmlsZSB8ICAzICsrDQo+ICAga2VybmVsL2tjc2FuL3N0
dWJzLmMgIHwgNzggKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0K
PiAgIDIgZmlsZXMgY2hhbmdlZCwgODEgaW5zZXJ0aW9ucygrKQ0KPiAgIGNyZWF0ZSBtb2RlIDEw
MDY0NCBrZXJuZWwva2NzYW4vc3R1YnMuYw0KDQpJIHRoaW5rIGl0IHdvdWxkIGJlIGJldHRlciB0
byBtZXJnZSBwYXRjaCAxIGFuZCBwYXRjaCAyLCB0aGF0IHdheSB3ZSANCndvdWxkIGtlZXAgdGhl
IGhpc3RvcnkgYW5kIHNlZSB0aGF0IHN0dWJzLmMgYWxtb3N0IGNvbWVzIGZyb20geHRlbnNhLg0K
DQpUaGUgc3VtbWFyeSB3b3VsZCB0aGVuIGJlOg0KDQogIGFyY2gveHRlbnNhL2xpYi9NYWtlZmls
ZSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEgLQ0KICBrZXJuZWwva2NzYW4vTWFr
ZWZpbGUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAyICstDQogIGFyY2gveHRl
bnNhL2xpYi9rY3Nhbi1zdHVicy5jID0+IGtlcm5lbC9rY3Nhbi9zdHVicy5jIHwgMjYgDQorKysr
KysrKysrKysrKysrKysrKysrKysrLQ0KICAzIGZpbGVzIGNoYW5nZWQsIDI2IGluc2VydGlvbnMo
KyksIDMgZGVsZXRpb25zKC0pDQoNCg0KPiANCj4gZGlmZiAtLWdpdCBhL2tlcm5lbC9rY3Nhbi9N
YWtlZmlsZSBiL2tlcm5lbC9rY3Nhbi9NYWtlZmlsZQ0KPiBpbmRleCA4Y2Y3MGYwNjhkOTIuLjVk
ZmM1ODI1YWFlOSAxMDA2NDQNCj4gLS0tIGEva2VybmVsL2tjc2FuL01ha2VmaWxlDQo+ICsrKyBi
L2tlcm5lbC9rY3Nhbi9NYWtlZmlsZQ0KPiBAQCAtMTIsNiArMTIsOSBAQCBDRkxBR1NfY29yZS5v
IDo9ICQoY2FsbCBjYy1vcHRpb24sLWZuby1jb25zZXJ2ZS1zdGFjaykgXA0KPiAgIAktZm5vLXN0
YWNrLXByb3RlY3RvciAtRERJU0FCTEVfQlJBTkNIX1BST0ZJTElORw0KPiAgIA0KPiAgIG9iai15
IDo9IGNvcmUubyBkZWJ1Z2ZzLm8gcmVwb3J0Lm8NCj4gK2lmbmRlZiBYVEVOU0ENCj4gKwlvYmot
eSArPSBzdHVicy5vDQoNCm9iai0kKENPTkZJR18zMkJJVCkgKz0gc3R1YnMubw0KDQpUaGF0IHdv
dWxkIGF2b2lkIHRoZSAjaWYgQ09ORklHXzMyQklUIGluIHN0dWJzLmMNCg0KPiArZW5kaWYNCj4g
ICANCj4gICBLQ1NBTl9JTlNUUlVNRU5UX0JBUlJJRVJTX3NlbGZ0ZXN0Lm8gOj0geQ0KPiAgIG9i
ai0kKENPTkZJR19LQ1NBTl9TRUxGVEVTVCkgKz0gc2VsZnRlc3Qubw0KPiBkaWZmIC0tZ2l0IGEv
a2VybmVsL2tjc2FuL3N0dWJzLmMgYi9rZXJuZWwva2NzYW4vc3R1YnMuYw0KPiBuZXcgZmlsZSBt
b2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwMDAwMDAuLmVjNWNkOTliZTQyMg0KPiAtLS0gL2Rl
di9udWxsDQo+ICsrKyBiL2tlcm5lbC9rY3Nhbi9zdHVicy5jDQo+IEBAIC0wLDAgKzEsNzggQEAN
Cj4gKy8vIFNQRFgtTGljZW5zZSBJZGVudGlmaWVyOiBHUEwtMi4wDQoNCk1pc3NpbmcgLSBiZXR3
ZWVuIExpY2Vuc2UgYW5kIElkZW50aWZpZXIgPw0KDQo+ICsNCj4gKyNpbmNsdWRlIDxsaW51eC9i
dWcuaD4NCj4gKyNpbmNsdWRlIDxsaW51eC90eXBlcy5oPg0KPiArDQo+ICsjaWZkZWYgQ09ORklH
XzMyQklUDQoNClNob3VsZCBiZSBoYW5kbGVkIGluIE1ha2VmaWxlDQoNCj4gKw0KPiArI2lmICFf
X2hhc19idWlsdGluKF9fYXRvbWljX3N0b3JlXzgpDQoNCkRvZXMgYW55IDMyIGJpdCBBUkNIIHN1
cHBvcnQgdGhhdCA/IElzIHRoYXQgI2lmIHJlcXVpcmVkID8NCg0KSWYgeWVzLCBkbyB3ZSByZWFs
bHkgbmVlZCB0aGUgI2lmIGZvciBlYWNoIGFuZCBldmVyeSBmdW5jdGlvbiwgY2FuJ3Qgd2UgDQpq
dXN0IGNoZWNrIGZvciBvbmUgYW5kIGFzc3VtZSB0aGF0IGlmIHdlIGRvbid0IGhhdmUgX19hdG9t
aWNfc3RvcmVfOCB3ZSANCmRvbid0IGhhdmUgYW55IG9mIHRoZSBmdW5jdGlvbnMgPw0KDQoNCj4g
K3ZvaWQgX19hdG9taWNfc3RvcmVfOCh2b2xhdGlsZSB2b2lkICpwLCB1NjQgdiwgaW50IGkpDQo+
ICt7DQo+ICsJQlVHKCk7DQo+ICt9DQo+ICsjZW5kaWYNCj4gKw0KPiArI2lmICFfX2hhc19idWls
dGluKF9fYXRvbWljX2xvYWRfOCkNCj4gK3U2NCBfX2F0b21pY19sb2FkXzgoY29uc3Qgdm9sYXRp
bGUgdm9pZCAqcCwgaW50IGkpDQo+ICt7DQo+ICsJQlVHKCk7DQo+ICt9DQo+ICsjZW5kaWYNCj4g
Kw0KPiArI2lmICFfX2hhc19idWlsdGluKF9fYXRvbWljX2V4Y2hhbmdlXzgpDQo+ICt1NjQgX19h
dG9taWNfZXhjaGFuZ2VfOCh2b2xhdGlsZSB2b2lkICpwLCB1NjQgdiwgaW50IGkpDQo+ICt7DQo+
ICsJQlVHKCk7DQo+ICt9DQo+ICsjZW5kaWYNCj4gKw0KPiArI2lmICFfX2hhc19idWlsdGluKF9f
YXRvbWljX2NvbXBhcmVfZXhjaGFuZ2VfOCkNCj4gK2Jvb2wgX19hdG9taWNfY29tcGFyZV9leGNo
YW5nZV84KHZvbGF0aWxlIHZvaWQgKnAxLCB2b2lkICpwMiwgdTY0IHYsIGJvb2wgYiwgaW50IGkx
LCBpbnQgaTIpDQo+ICt7DQo+ICsJQlVHKCk7DQo+ICt9DQo+ICsjZW5kaWYNCj4gKw0KPiArI2lm
ICFfX2hhc19idWlsdGluKF9fYXRvbWljX2ZldGNoX2FkZF84KQ0KPiArdTY0IF9fYXRvbWljX2Zl
dGNoX2FkZF84KHZvbGF0aWxlIHZvaWQgKnAsIHU2NCB2LCBpbnQgaSkNCj4gK3sNCj4gKwlCVUco
KTsNCj4gK30NCj4gKyNlbmRpZg0KPiArDQo+ICsjaWYgIV9faGFzX2J1aWx0aW4oX19hdG9taWNf
ZmV0Y2hfc3ViXzgpDQo+ICt1NjQgX19hdG9taWNfZmV0Y2hfc3ViXzgodm9sYXRpbGUgdm9pZCAq
cCwgdTY0IHYsIGludCBpKQ0KPiArew0KPiArCUJVRygpOw0KPiArfQ0KPiArI2VuZGlmDQo+ICsN
Cj4gKyNpZiAhX19oYXNfYnVpbHRpbihfX2F0b21pY19mZXRjaF9hbmRfOCkNCj4gK3U2NCBfX2F0
b21pY19mZXRjaF9hbmRfOCh2b2xhdGlsZSB2b2lkICpwLCB1NjQgdiwgaW50IGkpDQo+ICt7DQo+
ICsJQlVHKCk7DQo+ICt9DQo+ICsjZW5kaWYNCj4gKw0KPiArI2lmICFfX2hhc19idWlsdGluKF9f
YXRvbWljX2ZldGNoX29yXzgpDQo+ICt1NjQgX19hdG9taWNfZmV0Y2hfb3JfOCh2b2xhdGlsZSB2
b2lkICpwLCB1NjQgdiwgaW50IGkpDQo+ICt7DQo+ICsJQlVHKCk7DQo+ICt9DQo+ICsjZW5kaWYN
Cj4gKw0KPiArI2lmICFfX2hhc19idWlsdGluKF9fYXRvbWljX2ZldGNoX3hvcl84KQ0KPiArdTY0
IF9fYXRvbWljX2ZldGNoX3hvcl84KHZvbGF0aWxlIHZvaWQgKnAsIHU2NCB2LCBpbnQgaSkNCj4g
K3sNCj4gKwlCVUcoKTsNCj4gK30NCj4gKyNlbmRpZg0KPiArDQo+ICsjaWYgIV9faGFzX2J1aWx0
aW4oX19hdG9taWNfZmV0Y2hfbmFuZF84KQ0KPiArdTY0IF9fYXRvbWljX2ZldGNoX25hbmRfOCh2
b2xhdGlsZSB2b2lkICpwLCB1NjQgdiwgaW50IGkpDQo+ICt7DQo+ICsJQlVHKCk7DQo+ICt9DQo+
ICsjZW5kaWYNCj4gKw0KPiArI2VuZGlmIC8qIENPTkZJR18zMkJJVCAqLw0K
