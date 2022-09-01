Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 53DFD5A8F12
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 09:02:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJBn61pTbz3c4B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 17:02:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=JPolhGUT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.48; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=JPolhGUT;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120048.outbound.protection.outlook.com [40.107.12.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJBmN0q68z2xJ7
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Sep 2022 17:01:38 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S7FxDvM8Pf9tNc15zZkBthv/oQo9SquRhyY1/XEJYlp4vg8KGZiD1JmRdKeGFmboeQGvCNOVk8IS/2Lf7LmzwhyC2wlEbTTftPaV2VN6xmq67VdkjGQMJM4pOAdDlcjz/Vy6a0VCWOt1UeZF3w723atIdYhuZKuA37KWqECvqbEUdte/Oh61WZdqyUlzGvaSMTTTKNiAPILSsw+8XyJ0h+B0QPj14Sunqstm/PGS2TZxojyV7HZRKmw6OFR/er3qma2HUDHJG/DfLycBGZuZVmrn5oFZHuQXOG/+tBQOiFh71Sfgkj2kIx0PQLxEs7kh/tiM7eW+sIPMePyh26l17A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pxEchpY4AsvLsS22Rh3+EIJ+NcwIcmWGLZ8BhCLZMBI=;
 b=IKHQt8/PZTPU24ZkdRM7hhzaoFy7OfHDaJCuG3/iEllin8vFNBXe6K8iBR92gYq42bfG8sMuC9ltLlPMxuwMfeeZXmIva64vvzNTUm2Mkwn/28zZoahHoMa/PGG7/KksCUvOusePFsmdPnFkLWlDXDvV+RRkFZhAcV2gqiGYT3R45PAI0bCs5Iq7ba6Nc8HQTDgveLzQYrq2Irkane86ciOIZqSOs9QEZWVP24L2KBIe+y+Er8He/LKRmbBFTKHDeJMHrR0EBhgfE1CEod9Pt6K5MrZvv5ExAhC4iXOaBHA1u2U6R8zWSjwWUK2d9GVAt0C3OtoOqsCMwJTutWxljQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pxEchpY4AsvLsS22Rh3+EIJ+NcwIcmWGLZ8BhCLZMBI=;
 b=JPolhGUTyXSpAF7+4wt2uqVjZQpj/GK8aVVSj7FMjRC/MeCr+5eUH3eNA/QFxMdO5ziaetFno+2F0ejzGAQb/esViNTjvu+GlOadupB1CjLD2kPcfKf/NYgTQXZwzTGil2lEnaJV4fH0jqkuEMWOjRGm2s2b18BYQ9oMT6PeKlviNDsTeXJlB8/B8totYpTtWa4TIdFGB8qsa4SnYAUbD0uyglDHvRgDWxE3Q6MOcH524RQIXCWPJq48qDh0HGLHXfIY1IHln0Oq7jEd3uWLl4lMR/QQMtFyC7ao42cAMl8Otl+njeViznYSJCCaRryEdmxzr6WNRprZoDhuLNhymA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB1888.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1b5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Thu, 1 Sep
 2022 07:01:17 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8%4]) with mapi id 15.20.5588.010; Thu, 1 Sep 2022
 07:01:17 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Gray <bgray@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [RFC PATCH 1/4] powerpc/code-patching: add patch_memory() for
 writing RO text
Thread-Topic: [RFC PATCH 1/4] powerpc/code-patching: add patch_memory() for
 writing RO text
Thread-Index: AQHYvcfj3HWaf+q1+0K8uQ2apXgRXK3KJbGA
Date: Thu, 1 Sep 2022 07:01:17 +0000
Message-ID: <d0ac912f-e665-42a1-c7bf-e62294e17b66@csgroup.eu>
References: <20220901055823.152983-1-bgray@linux.ibm.com>
 <20220901055823.152983-2-bgray@linux.ibm.com>
In-Reply-To: <20220901055823.152983-2-bgray@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5bc40863-6ca3-471c-d443-08da8be7c49b
x-ms-traffictypediagnostic: PR1P264MB1888:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  5joU5qCvp6+HM1wMu0GIUtu79Vq6F3c2MhH7ZwSr9hCTKUCfX58ZOOxFFEf53ip/3pq8nySJ4kettvjgZN6vFrsX48Vs2imxDC9ZSw8Rhm9tMuJ8Zbj92pCijbvVSfKbZnh57tPxtfD/OJ8NnZZJsYDDQEBgnHhYvd7qC7SELSSZ1nx7L3mP5mo9Zn8AKePfyLJRLSEoGEP0qVEmYQ1Rddeha21lL32jyCqJC4ADIIEqujp1iPp38GVm9Te+OxzI4ZBfeygZL4UWtLqoSiA5Ipwn0OJrdrg/1JVLRNQnDaE30LGLDDrsmw1/9pNXBUwkDT8N3LgbRMRDRyhOR1HkcUifDy5Kr1Y67ZD1VaMCbYTUr1zIpKb2Bx6YQvMe6m415a5ZDPaIK6gA5RFZqBpVBcy6XujxcyNYSbocrAIDyfLri24E9BuwaL4ImgKKCa1QdOQDoFa3s/gJwjvO2Y0RDACuDPSKZSFOvrB8f4c5MNvxxoX+xbth+zJLbxVU9XvbpDvLwRStu6bDEmqK1m7PoodiF9mlt2jyUt/9rwt8LKc3jBt0ezjlpLueZRzCyXPgKZTSm0QGhge4wX1UQPE8KbTQEVDxGVDoS1smrH9Kw82AAx2g6/zZl9qBh9jMyBFt0jU6J9Gm0IvVH44vZUSCpPk4VN9cpuKTUX3NkWh8WVS6sWYOfceNaNlu2fmLKGAq9j3evo/H52CZ4laR5jqZS+yUedQYWm4g0n/VfH96myEilfgB41+OGs3r3xyvTPP3cFajQl+StsEfYWW/azPrD1j26WgjE6J+LUxCUA9z8Fv4CGZu1yA6Yyma35WB1kYnos52v0v8J9i5diJi38o5rmtuzuS2ng8EMFl3eRWyXNc=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(39850400004)(346002)(396003)(136003)(376002)(71200400001)(478600001)(966005)(6486002)(38070700005)(66946007)(41300700001)(4326008)(66556008)(66476007)(66446008)(8676002)(64756008)(91956017)(76116006)(5660300002)(44832011)(7416002)(54906003)(110136005)(8936002)(83380400001)(31696002)(2906002)(26005)(6512007)(316002)(38100700002)(86362001)(6506007)(2616005)(186003)(66574015)(31686004)(122000001)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?V1FpZVhvZjNZV1JaaC9MQUF1SnBpSGppTUJWa2JpT2JNZGVqbUp6NG82azF3?=
 =?utf-8?B?MUFEaTNMZTVkSWF6QUhHQ084WENNc1M3MThwZm5Sc2xwWVhEOWZrSm1lN3Nw?=
 =?utf-8?B?SzlLdHl1M2xycFp3UFM5cXhEak4wb2hPbHpLaU9HbWVaVTB3N09KMDNuN1NV?=
 =?utf-8?B?NHFEU09CMVQ2M1hmQWI5YTk5NEdTS2F6ZTR1bFgyQ2VaTm0xV3RWcTNPcmJz?=
 =?utf-8?B?L2Z1MXVhMXFhWE16OEZoalhLdmxLRE9ZbEJSVFU3TlREbVl0NWxmclk1SjVJ?=
 =?utf-8?B?SEQwdHVHSWRXMFJVN3A3bnNoVEJlMGFqa0s4RlcvQ3FOaWxmZVhPZGYyT2JG?=
 =?utf-8?B?ekQxTmRYbGZvaE9WZlczTnY2ZDg2VS92UVBjWFlLQ1czbkRYNHk0TDBRM0Zz?=
 =?utf-8?B?QkVMZHN4ZG8yWlpkUUlqNGZJU01YVjZ1YUU4Q2R2K3p4Q0NTUWVCSWFkSUpY?=
 =?utf-8?B?MHBMeFFuWktMaEE2U0hOcWRXOTlGMjczakdsc0pDbkg5MjhHSFRJcG9ENXVt?=
 =?utf-8?B?UmlMQm9laldhTFZ6VEdOaXFHUlN2V29kaUgwbGxHWDcrUjNrdWV2eExHdFdu?=
 =?utf-8?B?bFJ2UllvN1ViSzNHUUxCcDI2VVkwbFl3eDVlUkJGUDdKOWJDNGpiWnIzMW5S?=
 =?utf-8?B?S1NnUm03SjljYXUzVEY0QVBkaUdCUUhkU3FrOWxjU0lsd1RqbVRGOGxKcWxF?=
 =?utf-8?B?c1BiTWVjcnZQbU5ZRmpjVVYxMk1MbytHTnIvTUtnZWZabFpVR1ZsV3JLcndz?=
 =?utf-8?B?bmJJTUJwSlhadFJLSDQvcjVnWnRLOUxTdERsNG14SGZaWE8xWEt2b3dtdTI2?=
 =?utf-8?B?bW1BLzN2Vmg3ZllPWjNSd1Z1U2FPN2RBc3BXZ1dFc0hGVTloNWhtK2RzbEhX?=
 =?utf-8?B?dTFWQmM2ekNSc0lSU0xpWVBvaEVjRWxFNDBXa29EaHN0ci80MFRBQnRCV2ZW?=
 =?utf-8?B?T2xob3BjcWRncE4rV3ArT1F4NFRyL1hxKzRxamZSSk5CdlB3QktqTjc0R2dz?=
 =?utf-8?B?c3d6emZqVjlER3pKTUQ2L3lZY0VnODJmLzRkQ0Z3dS82blZMM3dnQXZkcXAr?=
 =?utf-8?B?WjdZWDlKZjU4M2NtOE5aOXhTbW9VS1p2UzVHUFBWaWlzd1ZrSkk5T2FUeDhq?=
 =?utf-8?B?dUVENklpOFR5akZVMDVTdVJQQjZBdDczcGdtMnpTUEJuYmN2YnBYN0RsS0NW?=
 =?utf-8?B?SEdXRER4T2FEYzk5T2hOaHJJdHRjelk5eFVIMTNGOEdydTdtOW56UzIzRjFu?=
 =?utf-8?B?eXJUQTVOMkgyYWUwenBOSVN2aTd0Zis4aDBsVVEyU3pCaGg2eXVhd3pkVmJH?=
 =?utf-8?B?Y256N0JjUTV1YlU0RFdMdmhWR0Q3VkQzaEpKMnB3dWYvRzRFZjlacFFKV2x4?=
 =?utf-8?B?TStVTnlaOGs5UkdEUUM4RE5IRVJMVk9CSjhHdUJnQnpKRkVJRmNFZzlqdWlZ?=
 =?utf-8?B?bTZlc2x1ZVN1QlVPTUhINWJiRjhNOEh3MWg3cVVHRTRkSTU4NmRYamVkRURj?=
 =?utf-8?B?dHFMYUMvODlKV0kycG5JM2VETU4zZmxyRDk4anlSRW5KNmQ1YW1QRzdtSmpn?=
 =?utf-8?B?SHVLZitHVWE2emxFR1ZhcW5pMURLdVBHTTFBNklsSmlMTjRDMnRuZU1pRW5w?=
 =?utf-8?B?Qmw2SEdjM0R4NDlKK2lqeUVRaERNSjQwNzFhYm5UcjMzMm9aeXh4OVQyQnhX?=
 =?utf-8?B?RlE2VU9ic1Ric3hLUmNvOTE5cGwyUkpCUkNKTXFONEx0ZTVlVDB3NFBFNjRo?=
 =?utf-8?B?V25mSFZtZHdnSFZOS3A4K1Y3NnNyTkl6UXdkL0hCZXc0ZUQ5MmNUZW5CSHJk?=
 =?utf-8?B?YmoxbkI3L2E5VzVZakJoZkMzZ0pZOFplMkQ3Y3NTRElsVkRCUGxlVW9lODVx?=
 =?utf-8?B?QWNFMlVQRVR0a3Y2TFM5RGhpY1BQZHRpSjBwcm9tY1FVUHpGNzdiUnIwQkdV?=
 =?utf-8?B?d2tSWHNEQ0g5MnF6QnhvbXpnR2FXeEl1aVNia1VxRUpsbHlUekhCOEJkT2xJ?=
 =?utf-8?B?aUVGaUZ5cDk0bVlGWU9DT09TU1JVQnI4T3l3TVlZRyt4MjlvdDlYTVBYc2gz?=
 =?utf-8?B?SkxZRFpTMzNzZExtenNXOW9ZTFIxSEVUQ2xjQlk4TEJNekxxalZCYnBka0dQ?=
 =?utf-8?B?VmJpL2RUdUZPcjFzV2tTWmFhNEw1YjlmbVYxNmtPam5peVVJSkNVTXFXcmI0?=
 =?utf-8?Q?EnlqVo1T4HzjY9q8jNkahW4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <656FB0043CE18142A7CD7A50F9989CD7@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bc40863-6ca3-471c-d443-08da8be7c49b
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2022 07:01:17.8130
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0P/SBp5o8wzOJLTE/6wr5EcWVjtjSx2qRupbyXtNGU+mlydM55bSXA5ybMPZN2RlLXSqVlWHVPpEVzrTM7hWmxrVP7uPHfgybQriKBB7RbQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB1888
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
Cc: "ajd@linux.ibm.com" <ajd@linux.ibm.com>, Peter Zijlstra <peterz@infradead.org>, "npiggin@gmail.com" <npiggin@gmail.com>, Ard Biesheuvel <ardb@kernel.org>, Jason Baron <jbaron@akamai.com>, Steven Rostedt <rostedt@goodmis.org>, Josh Poimboeuf <jpoimboe@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDAxLzA5LzIwMjIgw6AgMDc6NTgsIEJlbmphbWluIEdyYXkgYSDDqWNyaXTCoDoNCj4g
RnJvbTogUnVzc2VsbCBDdXJyZXkgPHJ1c2N1ckBydXNzZWxsLmNjPg0KPiANCj4gcG93ZXJwYyBh
bGxvY2F0ZXMgYSB0ZXh0IHBva2UgYXJlYSBvZiBvbmUgcGFnZSB0aGF0IGlzIHVzZWQgYnkNCj4g
cGF0Y2hfaW5zdHJ1Y3Rpb24oKSB0byBtb2RpZnkgcmVhZC1vbmx5IHRleHQgd2hlbiBTVFJJQ1Rf
S0VSTkVMX1JXWA0KPiBpcyBlbmFibGVkLg0KPiANCj4gcGF0Y2hfaW5zdHJ1Y3Rpb24oKSBpcyBv
bmx5IGRlc2lnbmVkIGZvciBpbnN0cnVjdGlvbnMsDQo+IHNvIHdyaXRpbmcgZGF0YSB1c2luZyB0
aGUgdGV4dCBwb2tlIGFyZWEgY2FuIG9ubHkgaGFwcGVuIDQgYnl0ZXMNCj4gYXQgYSB0aW1lIC0g
ZWFjaCB3aXRoIGEgcGFnZSBtYXAvdW5tYXAsIHB0ZSBmbHVzaCBhbmQgc3luY3MuDQo+IA0KPiBU
aGlzIHBhdGNoIGludHJvZHVjZXMgcGF0Y2hfbWVtb3J5KCksIGltcGxlbWVudGluZyB0aGUgc2Ft
ZQ0KPiBpbnRlcmZhY2UgYXMgbWVtY3B5KCksIHNpbWlsYXIgdG8geDg2J3MgdGV4dF9wb2tlKCkg
YW5kIHMzOTAncw0KPiBzMzkwX2tlcm5lbF93cml0ZSgpLiAgcGF0Y2hfbWVtb3J5KCkgb25seSBu
ZWVkcyB0byBtYXAgdGhlIHRleHQNCj4gcG9rZSBhcmVhIG9uY2UsIHVubGVzcyB0aGUgd3JpdGUg
d291bGQgY3Jvc3MgYSBwYWdlIGJvdW5kYXJ5Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogUnVzc2Vs
bCBDdXJyZXkgPHJ1c2N1ckBydXNzZWxsLmNjPg0KPiBTaWduZWQtb2ZmLWJ5OiBCZW5qYW1pbiBH
cmF5IDxiZ3JheUBsaW51eC5pYm0uY29tPg0KPiAtLS0NCj4gICBhcmNoL3Bvd2VycGMvaW5jbHVk
ZS9hc20vY29kZS1wYXRjaGluZy5oIHwgIDEgKw0KPiAgIGFyY2gvcG93ZXJwYy9saWIvY29kZS1w
YXRjaGluZy5jICAgICAgICAgfCA2NSArKysrKysrKysrKysrKysrKysrKysrKysNCj4gICAyIGZp
bGVzIGNoYW5nZWQsIDY2IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bv
d2VycGMvaW5jbHVkZS9hc20vY29kZS1wYXRjaGluZy5oIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUv
YXNtL2NvZGUtcGF0Y2hpbmcuaA0KPiBpbmRleCAxYzYzMTZlYzRiNzQuLjNkZTkwNzQ4YmNlNyAx
MDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2NvZGUtcGF0Y2hpbmcuaA0K
PiArKysgYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vY29kZS1wYXRjaGluZy5oDQo+IEBAIC03
Niw2ICs3Niw3IEBAIGludCBjcmVhdGVfY29uZF9icmFuY2gocHBjX2luc3RfdCAqaW5zdHIsIGNv
bnN0IHUzMiAqYWRkciwNCj4gICBpbnQgcGF0Y2hfYnJhbmNoKHUzMiAqYWRkciwgdW5zaWduZWQg
bG9uZyB0YXJnZXQsIGludCBmbGFncyk7DQo+ICAgaW50IHBhdGNoX2luc3RydWN0aW9uKHUzMiAq
YWRkciwgcHBjX2luc3RfdCBpbnN0cik7DQo+ICAgaW50IHJhd19wYXRjaF9pbnN0cnVjdGlvbih1
MzIgKmFkZHIsIHBwY19pbnN0X3QgaW5zdHIpOw0KPiArdm9pZCAqcGF0Y2hfbWVtb3J5KHZvaWQg
KmRlc3QsIGNvbnN0IHZvaWQgKnNyYywgc2l6ZV90IHNpemUpOw0KPiANCj4gICBzdGF0aWMgaW5s
aW5lIHVuc2lnbmVkIGxvbmcgcGF0Y2hfc2l0ZV9hZGRyKHMzMiAqc2l0ZSkNCj4gICB7DQo+IGRp
ZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvbGliL2NvZGUtcGF0Y2hpbmcuYyBiL2FyY2gvcG93ZXJw
Yy9saWIvY29kZS1wYXRjaGluZy5jDQo+IGluZGV4IDZlZGYwNjk3YTUyNi4uMGNjYTM5YWY0NGNi
IDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMvbGliL2NvZGUtcGF0Y2hpbmcuYw0KPiArKysg
Yi9hcmNoL3Bvd2VycGMvbGliL2NvZGUtcGF0Y2hpbmcuYw0KPiBAQCAtMTQsNiArMTQsNyBAQA0K
PiAgICNpbmNsdWRlIDxhc20vcGFnZS5oPg0KPiAgICNpbmNsdWRlIDxhc20vY29kZS1wYXRjaGlu
Zy5oPg0KPiAgICNpbmNsdWRlIDxhc20vaW5zdC5oPg0KPiArI2luY2x1ZGUgPGFzbS9jYWNoZWZs
dXNoLmg+DQo+IA0KPiAgIHN0YXRpYyBpbnQgX19wYXRjaF9pbnN0cnVjdGlvbih1MzIgKmV4ZWNf
YWRkciwgcHBjX2luc3RfdCBpbnN0ciwgdTMyICpwYXRjaF9hZGRyKQ0KPiAgIHsNCj4gQEAgLTE4
Myw2ICsxODQsNjUgQEAgc3RhdGljIGludCBkb19wYXRjaF9pbnN0cnVjdGlvbih1MzIgKmFkZHIs
IHBwY19pbnN0X3QgaW5zdHIpDQo+IA0KPiAgICAgICAgICByZXR1cm4gZXJyOw0KPiAgIH0NCj4g
Kw0KPiArc3RhdGljIGludCBkb19wYXRjaF9tZW1vcnkodm9pZCAqZGVzdCwgY29uc3Qgdm9pZCAq
c3JjLCBzaXplX3Qgc2l6ZSkNCj4gK3sNCj4gKyAgICAgICBpbnQgZXJyOw0KPiArICAgICAgIHVu
c2lnbmVkIGxvbmcgdGV4dF9wb2tlX2FkZHIsIHBhdGNoX2FkZHI7DQo+ICsNCj4gKyAgICAgICB0
ZXh0X3Bva2VfYWRkciA9ICh1bnNpZ25lZCBsb25nKV9fdGhpc19jcHVfcmVhZCh0ZXh0X3Bva2Vf
YXJlYSktPmFkZHI7DQo+ICsNCj4gKyAgICAgICBlcnIgPSBtYXBfcGF0Y2hfYXJlYShkZXN0LCB0
ZXh0X3Bva2VfYWRkcik7DQoNClRoaXMgaXMgbm90IGluIGxpbmUgd2l0aCB0aGUgb3B0aW1pc2F0
aW9uIGRvbmUgYnkgDQpodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvbGludXhw
cGMtZGV2L3BhdGNoLzIwMjIwODE1MTE0ODQwLjE0Njg2NTYtMS1tcGVAZWxsZXJtYW4uaWQuYXUv
DQoNCg0KDQoNCj4gKyAgICAgICBpZiAoZXJyKQ0KPiArICAgICAgICAgICAgICAgcmV0dXJuIGVy
cjsNCj4gKw0KPiArICAgICAgIHBhdGNoX2FkZHIgPSB0ZXh0X3Bva2VfYWRkciArIG9mZnNldF9p
bl9wYWdlKGRlc3QpOw0KPiArICAgICAgIGNvcHlfdG9fa2VybmVsX25vZmF1bHQoKHU4ICopcGF0
Y2hfYWRkciwgc3JjLCBzaXplKTsNCg0KY29weV90b19rZXJuZWxfbm9mYXVsdCgpIGhhcyBhIHBl
cmZvcm1hbmNlIGNvc3QuDQoNCj4gKw0KPiArICAgICAgIGZsdXNoX2ljYWNoZV9yYW5nZShwYXRj
aF9hZGRyLCBzaXplKTsNCg0KSXMgdGhhdCBuZWVkZWQgPyBXZSBhcmUgcGF0Y2hpbmcgZGF0YSwg
bm90IHRleHQuDQoNCj4gKyAgICAgICB1bm1hcF9wYXRjaF9hcmVhKHRleHRfcG9rZV9hZGRyKTsN
Cj4gKw0KPiArICAgICAgIHJldHVybiAwOw0KPiArfQ0KPiArDQo+ICsvKioNCj4gKyAqIHBhdGNo
X21lbW9yeSAtIHdyaXRlIGRhdGEgdXNpbmcgdGhlIHRleHQgcG9rZSBhcmVhDQo+ICsgKg0KPiAr
ICogQGRlc3Q6ICAgICAgZGVzdGluYXRpb24gYWRkcmVzcw0KPiArICogQHNyYzogICAgICAgc291
cmNlIGFkZHJlc3MNCj4gKyAqIEBzaXplOiAgICAgIHNpemUgaW4gYnl0ZXMNCj4gKyAqDQo+ICsg
KiBsaWtlIG1lbWNweSgpLCBidXQgdXNpbmcgdGhlIHRleHQgcG9rZSBhcmVhLiBObyBhdG9taWNp
dHkgZ3VhcmFudGVlcy4NCj4gKyAqIERvIG5vdCB1c2UgZm9yIGluc3RydWN0aW9ucywgdXNlIHBh
dGNoX2luc3RydWN0aW9uKCkgaW5zdGVhZC4NCj4gKyAqIEhhbmRsZXMgY3Jvc3NpbmcgcGFnZSBi
b3VuZGFyaWVzLCB0aG91Z2ggeW91IHNob3VsZG4ndCBuZWVkIHRvLg0KPiArICoNCj4gKyAqIFJl
dHVybiB2YWx1ZToNCj4gKyAqICAgICBAZGVzdA0KPiArICoqLw0KPiArdm9pZCAqcGF0Y2hfbWVt
b3J5KHZvaWQgKmRlc3QsIGNvbnN0IHZvaWQgKnNyYywgc2l6ZV90IHNpemUpDQo+ICt7DQo+ICsg
ICAgICAgaW50IGVycjsNCj4gKyAgICAgICB1bnNpZ25lZCBsb25nIGZsYWdzOw0KPiArICAgICAg
IHNpemVfdCB3cml0dGVuLCB3cml0ZV9zaXplOw0KPiArDQo+ICsgICAgICAgLy8gSWYgdGhlIHBv
a2UgYXJlYSBpc24ndCBzZXQgdXAsIGl0J3MgZWFybHkgYm9vdCBhbmQgd2UgY2FuIGp1c3QgbWVt
Y3B5Lg0KPiArICAgICAgIGlmICghdGhpc19jcHVfcmVhZCh0ZXh0X3Bva2VfYXJlYSkpDQo+ICsg
ICAgICAgICAgICAgICByZXR1cm4gbWVtY3B5KGRlc3QsIHNyYywgc2l6ZSk7DQo+ICsNCj4gKyAg
ICAgICBmb3IgKHdyaXR0ZW4gPSAwOyB3cml0dGVuIDwgc2l6ZTsgd3JpdHRlbiArPSB3cml0ZV9z
aXplKSB7DQo+ICsgICAgICAgICAgICAgICAvLyBXcml0ZSBhcyBtdWNoIGFzIHBvc3NpYmxlIHdp
dGhvdXQgY3Jvc3NpbmcgYSBwYWdlIGJvdW5kYXJ5Lg0KPiArICAgICAgICAgICAgICAgd3JpdGVf
c2l6ZSA9IG1pbl90KHNpemVfdCwgc2l6ZSAtIHdyaXR0ZW4sDQo+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgUEFHRV9TSVpFIC0gb2Zmc2V0X2luX3BhZ2UoZGVzdCArIHdyaXR0
ZW4pKTsNCj4gKw0KPiArICAgICAgICAgICAgICAgbG9jYWxfaXJxX3NhdmUoZmxhZ3MpOw0KPiAr
ICAgICAgICAgICAgICAgZXJyID0gZG9fcGF0Y2hfbWVtb3J5KGRlc3QgKyB3cml0dGVuLCBzcmMg
KyB3cml0dGVuLCB3cml0ZV9zaXplKTsNCj4gKyAgICAgICAgICAgICAgIGxvY2FsX2lycV9yZXN0
b3JlKGZsYWdzKTsNCj4gKyAgICAgICAgICAgICAgIGlmIChlcnIpDQo+ICsgICAgICAgICAgICAg
ICAgICAgICAgIHJldHVybiBFUlJfUFRSKGVycik7DQo+ICsgICAgICAgfQ0KPiArDQo+ICsgICAg
ICAgcmV0dXJuIGRlc3Q7DQo+ICt9DQo+ICAgI2Vsc2UgLyogIUNPTkZJR19TVFJJQ1RfS0VSTkVM
X1JXWCAqLw0KPiANCj4gICBzdGF0aWMgaW50IGRvX3BhdGNoX2luc3RydWN0aW9uKHUzMiAqYWRk
ciwgcHBjX2luc3RfdCBpbnN0cikNCj4gQEAgLTE5MCw2ICsyNTAsMTEgQEAgc3RhdGljIGludCBk
b19wYXRjaF9pbnN0cnVjdGlvbih1MzIgKmFkZHIsIHBwY19pbnN0X3QgaW5zdHIpDQo+ICAgICAg
ICAgIHJldHVybiByYXdfcGF0Y2hfaW5zdHJ1Y3Rpb24oYWRkciwgaW5zdHIpOw0KPiAgIH0NCj4g
DQo+ICt2b2lkICpwYXRjaF9tZW1vcnkodm9pZCAqZGVzdCwgY29uc3Qgdm9pZCAqc3JjLCBzaXpl
X3Qgc2l6ZSkNCj4gK3sNCj4gKyAgICAgICByZXR1cm4gbWVtY3B5KGRlc3QsIHNyYywgc2l6ZSk7
DQoNCkluIGRvX3BhdGNoX21lbW9yeSgpIHlvdSBoYXZlIGZsdXNoX2ljYWNoZV9yYW5nZShwYXRj
aF9hZGRyLCBzaXplKTsNCg0KSWYgdGhhdCdzIHJlYWxseSBuZWVkZWQgdGhlcmUsIHdoeSBkb24n
dCB3ZSBuZWVkIGl0IGhlcmUgYXMgd2VsbCA/DQoNCj4gK30NCj4gKw0KPiAgICNlbmRpZiAvKiBD
T05GSUdfU1RSSUNUX0tFUk5FTF9SV1ggKi8NCj4gDQo+ICAgX19yb19hZnRlcl9pbml0IERFRklO
RV9TVEFUSUNfS0VZX0ZBTFNFKGluaXRfbWVtX2lzX2ZyZWUpOw0KPiAtLQ0KPiAyLjM3LjINCj4g
