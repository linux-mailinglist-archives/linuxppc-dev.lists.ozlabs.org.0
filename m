Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C58A62C625
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 18:18:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NC8rR1m4dz3cLX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Nov 2022 04:17:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=wCUyW9wn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::613; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=wCUyW9wn;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on0613.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::613])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NC8qR3xClz2xBV
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Nov 2022 04:17:05 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mrf11XFaXOILqjXog3Yj66LL29YGnpxBVFRcUUghiOe/CbsW+ugwVhAjqiNzPauX0TWJysTJ6DRfxrnuXS/MjNwC58LxjbosSJc0O3SFC5iLe5sC22o/1lAKkEdRz+YHjJ+tUkxNtJU6IrBX1B6zvYKTcvDvreYjCxakE/GMjT+TrM//sGPtjX1CN1asu41UQG+DAbwwlRc5+3DlAX7qFotVSNDVPVpX+f+HIYAhZuhe9RCbCx8zRAyJauRuhy0XfCnvwODVXRUlVRwJt/MogX4F7poF0zoVAeqk0MeqmRrrR8kNtMtsBwva9zvc1N8Nw4PgiS6ToyDhCuIVatFRqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AyzilU0fLU/MN586RBp8YE5IlR+HeS/nspY6HvaAcq4=;
 b=DtOVTl3ruQs3fscWiv8eOvDXgtCDHACx0pz7l7WCe9EwHMMa3oOZDSbFIZYQh9vAVJ5AC8jKJ/++LNVQoflgPwtcsEBlNvTXFhccCcOMFw6DJRpPqYJUBiODtuqLMQSBXHq46k5WJ/Gr52QYGvGWiYB6niGNv94vjeEljDFCNl/cc7dProu33p5M1dpHyjD5VXPmBXcA1mA6Rb6VHlAgqNthcOA5OnJmURs0mMMMUf2pfDTnW2M6a20gUUmNsfqo2euRlqfcbi8r03IVO9yt/6n6rhUk8BwDLt4AC+WzdnKZMTy1nENqjdGu/sV8aLEOCV95cqAeMRebTrmIKlvWfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AyzilU0fLU/MN586RBp8YE5IlR+HeS/nspY6HvaAcq4=;
 b=wCUyW9wnWS3nrBUcfwFpb78lHKQKpXbNpK1kyiG/dl1dPpSoRLHx57rYf8uGYW65krAJIHQQ5V2fCd63AHD40y+QdJyyT5koqwDVZ5bxgk2EgNH60cFr4vrAJ8JEixfJl9z35mSW9jEDoWexxz3aeROr/OFsWD/JA4xoKqrC6XHUiZyLnNypsknC3Ig9idB1zmxd7SOYKOLlPmEPh/NyKbeZYdzazDaH/v/jHrkoCn3IVCz2Jnb1H3AT2rMxSMcxQ76Ife54q1b8QWrkEn0Gwa0ynaKCOvOkDpD5rRxrgyQENq50e+KPqCylRmhLTseyRAJiNGiYJdgvk6+8MN0/nQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2422.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1e1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.18; Wed, 16 Nov
 2022 17:16:42 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6%9]) with mapi id 15.20.5813.018; Wed, 16 Nov 2022
 17:16:42 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Hari Bathini <hbathini@linux.ibm.com>, linuxppc-dev
	<linuxppc-dev@lists.ozlabs.org>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>
Subject: Re: [RFC PATCH 0/3] enable bpf_prog_pack allocator for powerpc
Thread-Topic: [RFC PATCH 0/3] enable bpf_prog_pack allocator for powerpc
Thread-Index:  AQHY9TR92HLsIR9PiEOmF5X/4UnXLK45ljcAgATvboCAACzCgIABp7yAgAF1qQCAAAQvAA==
Date: Wed, 16 Nov 2022 17:16:42 +0000
Message-ID: <d6df3876-0f32-0758-6d9c-c5069222bbc3@csgroup.eu>
References: <20221110184303.393179-1-hbathini@linux.ibm.com>
 <00efe9b1-d9fd-441c-9eb4-cbf25d82baf2@csgroup.eu>
 <5b59b7df-d2ec-1664-f0fb-764c9b93417c@linux.ibm.com>
 <bf0af91e-861c-1608-7150-d31578be9b02@csgroup.eu>
 <e0266414-843f-db48-a56d-1d8a8944726a@csgroup.eu>
 <6151f5c6-2e64-5f2d-01b1-6f517f4301c0@linux.ibm.com>
In-Reply-To: <6151f5c6-2e64-5f2d-01b1-6f517f4301c0@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB2422:EE_
x-ms-office365-filtering-correlation-id: 5ffec52e-3f18-4b27-7ef4-08dac7f654ad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  om9OU4BgtZnUzyGYq92Bokaq0lZxJOx1PhG5fmZHNzfdf/0gIoRB3P0ZuHxeZYiYYvGIsR5915qxN6Lzwk99MzMCua7NSlpqFWPSjY5BYv+okPddAaBj97ropIS9SCJ20eyrioV9CmryzvsuYnkDJ30mQ4KgvzFOujDFdGZLE68Nmu3Hl9qfMxUANIlm2s0cCo8BykE04CzTSoQenxkeoGu4tAEAONogJemVWzxg0YAr91DSPkjpd89u3gxjUwAYQK/Kubsj1ig/Ly9gnr1wDUQjNj79OGvjXinQjiUlmZCI4DZrJ4BFkiOq54aaC5HNfpTCqHFruskC794dPHLOtzqKE11ucbi0PldpIL0Ey3G6Zr9oTOYwOgvKW4l69vBOZbLz2aC/wuYgHIyATm0VI4rBIMCrt5dGEub+mRNbx96KgR5JwpLFOawZJeDoY1+lOlUnBA+KiKP7iZQ5Itq3iHwyd+EE5VQU18HpwGOQK155knK8b7lP3ENA2KRB2toYabjwmu11w+hcvolui5BGIV7QTU8fTVKOvyw1G/7aZD/YXuBBjU2Wqo8NQ6w97CeuIesxCxnDu+dCosk+qg4+iiDsL2FBgs8krIUoxpnIzYI7hJkNsyWcJNjAt0r0eiRCSPcm2u7Hm22LbAsjKk6LLUwfELjRRsny/ehS2WhoW3OOWgr91qDJHb4n17t0RPsGHKMFCRoBKnY0HcfwEpAWHEzPLbrBWcLn9gx+TwV3bUT0w+4VgdGJDvAkKVX97O2RtvUphvuo6gMbhF+QwmQRvXz9JTZQMvOc5f/N4ZeOZVL6R6yLtxGyumPGhL0D16MoFcosyr+qpaVqcUtdKbO/IQ==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(366004)(376002)(396003)(136003)(451199015)(36756003)(26005)(31686004)(86362001)(31696002)(38070700005)(38100700002)(122000001)(2616005)(83380400001)(2906002)(44832011)(6512007)(110136005)(6506007)(66574015)(8936002)(5660300002)(186003)(478600001)(6486002)(76116006)(71200400001)(316002)(41300700001)(66446008)(66946007)(66476007)(54906003)(4744005)(66556008)(64756008)(4326008)(91956017)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?eHhLNzh6cXJrZGh3VmIwOGZPRU5QK2Y3R0haeGpVcFcweFFIZVU1aFVCTlI5?=
 =?utf-8?B?UFJ1aXZTeGJZekpyRHRyRkNZL0JhVzk5UjUvc0hYaW8rV05MaWhIdXhlM3VY?=
 =?utf-8?B?eThSS1ZIeUl3QWZTU2UyZ1J4eFhlRW16Vkx6SFMxSkh5a05BZXBiR2VPVDJZ?=
 =?utf-8?B?aFVrT0t0RHR1bURDalpnd0R5bzlKeERMQzAwUlQ0cHh4SlQxdWtHUjNxdnJ5?=
 =?utf-8?B?Tk5OTnIyaWZjK0VNV1FxSDc2eEhyMS91bGF1MVg0TitMUmlxWVhycHlLc3Mr?=
 =?utf-8?B?K2xpd3Fza05GSGdEbzA4b0k0b0I3NTlVNUR3QzJmNVcvZnQwUEM5dUlzR3JE?=
 =?utf-8?B?b2FLRERZMkdDL1Bja1diaWxLR0RMQ3k2QTQxY29LQUVEaGZZRHBiYjJvMjdl?=
 =?utf-8?B?L3RDZlhtWE1pQ3gyWnYzS3hKcGhyelEyNTkwOVoxcHlGNXIwOXJucVZTaUdL?=
 =?utf-8?B?Q0N3cDlycWxEK0pPTFZiTWxYWFRqOXdmWlNYdWlNUVN0b2lJMURoL1NrY01i?=
 =?utf-8?B?SFJwL1ZTRGxkSGprWUx4UGFsVnpGK2I5MXlzblByWW5lcWlPbTJhZFBJSUhn?=
 =?utf-8?B?SS9pWUVqL3VIaDQvVjF6SUlPYitOUzVFTThBUGVNb094TUJnTnhKRlZCdElq?=
 =?utf-8?B?QTNQRFFFNDNoQ3hoK3EwbVFSMGtyMFpmT0d1RnlJdVNxbUtJZUVzRGREYUl2?=
 =?utf-8?B?RUhxQ2w0WGRHUityWjVwS0VLKzBzekxQMTN1REhRR3hsWU02am1OUVNFY2dJ?=
 =?utf-8?B?UFo2b3p4M2pjbnBQOFlUSHM5ZDdsRlJvY0JHVkdQOFR6Z1lhRW9WS0lBc3Fi?=
 =?utf-8?B?TTY1WlZYZ0hhNVJyM2c0YWxaUktXM0gwand4N1NMNGdZc1h5ekd3MlZkcXF2?=
 =?utf-8?B?dFNGc0taZW84TDFsTGJXVDdsVVRGaXB4aWhlNjhCSlNTNzJMQm5EdUhBNTNF?=
 =?utf-8?B?eFF4akdFYWtSVS9sR05OQXNCRmJqbStEN2oyNjArSDFzZEZ2d05zZnNqTnlG?=
 =?utf-8?B?NFVodkNXdFVmTldvQ1FTa0ZTQ3RNRzZoR1hKRkpmMGlkWkd0RG1PdnJSUGND?=
 =?utf-8?B?K1Z1a3lISG1Ba2ZjRXFjYUcrUnA1S3B2VHpkckpMZ0dyVC8wRGtBdStKS21B?=
 =?utf-8?B?aVNHSHBiUEZJTURrQzhuUUl2RS91U3ZqdnN3VWhFcHVLaUZvb2Z1WGVvcGcz?=
 =?utf-8?B?Wnp1NFlBam5US3pvWGwyZGc4RzVFYUZCVzRtQmNpVHJmM2xUMVYxUHdLc0di?=
 =?utf-8?B?cXJrVzZsbVp6Y3lUb1NQdXZRcWNwREtDSkpQcW5HbUY5T1cyTGlUMXBUTjEw?=
 =?utf-8?B?SFVjSnYwTnhDaDZuQUltNnJkc0JyOGYxVnZlTWdXR3J4Mnc0MVNMUStTa2E0?=
 =?utf-8?B?RFlxb2RiNCs1eTRWcC9pZ1RsRzNOaTBocmZuV2h5QTlnMXVlTVVaeGphN0pH?=
 =?utf-8?B?UTlFa0JRaFBTN21oc1d3d3NLMFBFNkUvZzV3WDA0elpMbGtDN0ZhSTdTVG8v?=
 =?utf-8?B?WitrK0ZIeFdhNVArbmFhR2U1blhEUTB3d2JYaWlJSXhlQ3VjdGVaS1lMenA4?=
 =?utf-8?B?VDk4bXByMklVRmt5bWJGclJ4T0tzWTJSZjNQc2ZrdHlUd2YxYW94Ty84RGJr?=
 =?utf-8?B?SGZ1VXdxV3NseEZPeVk2NXppa0NtM0pYRFlvaENCempNWWRWc2M4NzVCOURX?=
 =?utf-8?B?NTJITFlHM3AxVVp2VWFNYTFIS3J3SURhb3JWNEFGdXhKMHhQZXAvTkxWUHNF?=
 =?utf-8?B?blVmTUx5K0tRZkRKa2g0a3IzMW0wSUtSQ0IwSE5NQ0g1MDBIRi9MbDNpYmto?=
 =?utf-8?B?SkR2QTdaRGFndjRBSnZSbzg3di8rUHYyTElQMGhJTnAyUytkS29laVlIQ0cw?=
 =?utf-8?B?Y3JwbXkxalpJc2swL3pLby9Dc1ZtMkJhVGdLdUJRcEY5RDgwT2pjWmNGd2NU?=
 =?utf-8?B?NmZjdlNVOTNTUzNsbXQxMGp0MGhXeTJNaHNQRnhQRlpnQmJReTgyaGM2Y3R0?=
 =?utf-8?B?ODVyd3ArcUxJck9xTWxFWW5lQXBVUkhjSGtJVFNrRmJ4cEc0YXZxYjV3TlR2?=
 =?utf-8?B?YXR2S050ZGJ6UWVobjZQcDhFdTNlaFlSZEtRdk9Bekp3WDdybVlEdlFqMUky?=
 =?utf-8?B?OUVaVDNlR0Q5QVRyVWdDK1NkVlFnSjk3S2R4U3l1ZlJVNE9rVzJRZGExbHFJ?=
 =?utf-8?B?S3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4264C8A330360741B9F8CBA817F5C702@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ffec52e-3f18-4b27-7ef4-08dac7f654ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2022 17:16:42.2572
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sMPf3CxgEkEUPPdGohYyKkzBXCA7yYP6lrj0QjRCrvv3fUFn6oGZk+LtO+wKJSsYAOsLM25qAphmet8u0F/0K+/RlTMHktdTtDbvpOyX4vg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2422
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
Cc: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Song Liu <songliubraving@fb.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE2LzExLzIwMjIgw6AgMTg6MDEsIEhhcmkgQmF0aGluaSBhIMOpY3JpdMKgOg0KPj4N
Cj4+IEkgYWxzbyBtYW5hZ2VkIHRvIHRlc3QgaXQgb24gUUVNVS4gVGhlIGNvbmZpZyBpcyBiYXNl
ZCBvbiANCj4+IHBtYWMzMl9kZWZjb25maWcuDQo+IA0KPiBJIGhhZCB0aGUgc2FtZSBjb25maWcg
YnV0IGhpdCB0aGlzIHByb2JsZW06DQo+IA0KPiAgwqDCoMKgwqAjIGVjaG8gMSA+IC9wcm9jL3N5
cy9uZXQvY29yZS9icGZfaml0X2VuYWJsZTsgbW9kcHJvYmUgdGVzdF9icGYNCj4gIMKgwqDCoMKg
dGVzdF9icGY6ICMwIFRBWA0KPiAgwqDCoMKgwqAtLS0tLS0tLS0tLS1bIGN1dCBoZXJlIF0tLS0t
LS0tLS0tLS0NCj4gIMKgwqDCoMKgV0FSTklORzogQ1BVOiAwIFBJRDogOTYgYXQgYXJjaC9wb3dl
cnBjL25ldC9icGZfaml0X2NvbXAuYzozNjcgDQo+IGJwZl9pbnRfaml0X2NvbXBpbGUrMHg4YTAv
MHg5ZjgNCg0KT2ssIEknbGwgZ2l2ZSBpdCBhIHRyeSB3aXRoIHRlc3RfYnBmIG1vZHVsZS4NCg0K
Q2hyaXN0b3BoZQ0KDQo=
