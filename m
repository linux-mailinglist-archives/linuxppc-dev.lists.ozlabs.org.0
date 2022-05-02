Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 96348517172
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 May 2022 16:25:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KsQNf3LQ9z3brK
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 May 2022 00:25:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::614;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0614.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::614])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KsQN74rkgz30Dp
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 May 2022 00:24:53 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WgCRh/mR9fGNsYKf3PfA41rG7/L/QOCvGudFtgfMgioLssP8V1A/O3zUL8XK1IYrY3DZALCdwFPyg5wrIwUfuZZn1iU3mAnx1p/NQT1eSMOjUgeeylF+rxUOEdbbH8EHhi2ttoGMIHjxz5ju7is6k438reU9DZl8mL4juEw9tuaCV2hFdcCVsaLoixCiiaxJAtjqzIFrdKHmT7/7wAvW5TP5IaMOQHsQS9aJ0Dd6bZh7VtPFCdVXCHYatWPXvx3XP798wxKo+N1Pu31Nn+Rlo6synxKguHlgtm9tQvm6V0tKl5jKoG6dbeo8ndVBur/cU8iF/wE7r+Qs7x8p68ePVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MfXzPNStVeWe9XZ1fq1X2MGJdrLVseJhRg1dZ21R5IE=;
 b=V/ZC4A8O8a1M3UpLExtp+/hyvpGMVECf9k3PaZ8BlFhe2HpJ5pzsb14oJ/GBz8PtPrX5ZFu/8m/fe5wSrGdyaVT8pHD9SMRLvyw8sxMGJ7392yPBWEhWi4x+pDjTvcmfBXYpDoJLQy/tC3iAWoTcas1cUdUkzESblhDBpD/dZzmWEHIWe105haqTIaQXdiCItvbCQK+GP5lczioVFHJT3wIXX9ylzAaSo3wUvGa4obg9Xi2BQtzjGXXHnShMCpudAyNxVPS/lF0bycV0wcB18azMNwsyCg86ZFVphON8AZH7jEeIxNPZRWn7fS1+wvZcAQ5n0I6iHhfdeOQgpe5UEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB3247.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1e7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Mon, 2 May
 2022 14:24:32 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::d572:ae3f:9e0c:3c6]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::d572:ae3f:9e0c:3c6%7]) with mapi id 15.20.5206.014; Mon, 2 May 2022
 14:24:32 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Tong Tiangen <tongtiangen@huawei.com>, Mark Rutland
 <mark.rutland@arm.com>, James Morse <james.morse@arm.com>, Andrew Morton
 <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo
 Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Robin Murphy
 <robin.murphy@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Alexander
 Viro <viro@zeniv.linux.org.uk>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, "x86@kernel.org" <x86@kernel.org>, "H . Peter Anvin"
 <hpa@zytor.com>
Subject: Re: [PATCH -next v4 1/7] x86, powerpc: fix function define in
 copy_mc_to_user
Thread-Topic: [PATCH -next v4 1/7] x86, powerpc: fix function define in
 copy_mc_to_user
Thread-Index: AQHYVHAV90o5CxiLPEaGieK3fNI0WK0Lt8yA
Date: Mon, 2 May 2022 14:24:32 +0000
Message-ID: <91011a66-b125-b445-1486-bada8e06b994@csgroup.eu>
References: <20220420030418.3189040-1-tongtiangen@huawei.com>
 <20220420030418.3189040-2-tongtiangen@huawei.com>
In-Reply-To: <20220420030418.3189040-2-tongtiangen@huawei.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 572a8208-496b-49de-e85e-08da2c4779a2
x-ms-traffictypediagnostic: PAZP264MB3247:EE_
x-microsoft-antispam-prvs: <PAZP264MB32471B148FADD5E89898976AEDC19@PAZP264MB3247.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: drDcCOdx8r1PTeQLCie+2/rkbq0a5W8CBOm/xYkMKqDrhfbJwm03BaNHHlnFR2lmrKw4Vgczv2oAT3f3vq+IoSsk+RMdiFzXxwwbHRasOrDTjldp180Uru8M6VST44v4ml6/shMuPWkxmePIlSxcABUAplQSUCGZBAJoLNxEKZloghgSMe2eNkvcJFHsd8+Uhb9A8KXE3VPqHclFsYrDJS/6CPml4X7QjjmLAHFzZWdFilFtJ9q5sYirTx7H+Ov8SQMG/3wHRB3LZ/SYUOG1jzVMVk6wwwrW/pnWypKgVrK5NC6eEJ2dH8cI1hAYZNaTEk6AoYjwk/2HnUJ+Tqu42wxdqQCYCfdQTfOCTH9hgiyf+ZLF3o9SA1aysQrdnsL1FgaBwcrRAQ3FYkGlBcVPHF3NRzp95r6OhrwmGW6cHTLFn6ECbqcIQqAAreCKAlMVaYYYvKecQQw0fuF2DW4NGpw+Z2Y0m7VMZ4p0y9R5S77u+fuPL8CGYCjB6MZ2Fm4z3zi5nK7szhvfeJCB4rDmXLED5M02NyDzQRMTRmrw8tueBpZsGZBEvocCU66bag9u4bxitf7EuSjx2UUa0sA2Fi0Q7DMAJNLmbCr+mu3nh7n2nAXXgZ9ZXrIJAE9+af+GEmkPjcoh1MK6QOGf8CN1hdBz4J/NpbPON18uY48/h9pINxnvSbkNQgrdqo5DLPeV0lBMLHPiaFx5r/GePicx2+j0ikoRCFge5ZhLjiZOPio7M3zNMDLJQCdfglFOFhRNYDIFLV5jSJf/1pkqeQHuxtINyCtPH28XGmk4ZCO5fck=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(7416002)(2906002)(316002)(36756003)(5660300002)(76116006)(44832011)(66476007)(91956017)(186003)(66946007)(66556008)(8676002)(66446008)(64756008)(83380400001)(4326008)(8936002)(54906003)(31686004)(110136005)(86362001)(71200400001)(31696002)(2616005)(6486002)(66574015)(508600001)(6506007)(38070700005)(38100700002)(6512007)(26005)(122000001)(921005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TWFxd0Foc0ZqakV6VkQycExCcXBQWnIvWVh0REl0U3p1eGt6d1YzcHdTcmY0?=
 =?utf-8?B?MFF4dVJvNCtQUjRkc3k2UXNlNEtlSEJ3MEpnbUZhazg4aGw1NWxtNDdqK0VD?=
 =?utf-8?B?Qnd6M1h2K1NGeFRMNXVJdVZ3a3BGWXorZU11MitNVEFrVXArTUNkNEovbjRm?=
 =?utf-8?B?TUZ0Ty9yejk2RjdaYUFYYlhiNVdwczk0K1dnODJ5TTJnTDdjaDB0NVZzVWV5?=
 =?utf-8?B?VFhpZ2N6VTNFNUtoYzlNUERBK3BPekJoMTRsMmFmYTJBcERQNnpldmZyTkIy?=
 =?utf-8?B?bTJIK2NOYlZQejZwRytQdVdkdFJ2eThYOTlSeld6Tmh4bis2U1NvRG1qdTFr?=
 =?utf-8?B?Z2hkSFdleFUvK0tDVmxFdWZick4wOTkzVWxIM3VLUnlxZ2MwQVNLSVRoblJk?=
 =?utf-8?B?bXVhenVjb01YdGNlMWVKcVRtdncwVG5HV3lpZ2pKV2ozcVJvOXYycERHNUVD?=
 =?utf-8?B?QjJoT2hwWGhsSlZOSlMwTTQyOXRuWE85RXdzK2lvaGZkNElIZ0xtVXZEVXpa?=
 =?utf-8?B?d3R5TUtHWkpBR2h4RHdhUXI2a1pxeXBseTFCblkrZG5Cdi9nQTdXbmVZam55?=
 =?utf-8?B?WUhUbVVLY2xqazVkMk5LTGVzU1RrMFRERVZ4TzZ2emV1cVpjaFVpR0Uzb3dJ?=
 =?utf-8?B?NHZWQUNNRUpUbndTZHV0bVQ3Z1E2Q2JKSzc5YW1KQ0pLUDJmZExlMzVCS1I4?=
 =?utf-8?B?RS94L050RFZtVmR0OExlcEdTUGZ5WGY1Q0xEL2lJeDluNVFPSkpKNWRiVEdz?=
 =?utf-8?B?ejA2bStSZ2lxb2I2emM0NlI0NmxXQWJIdlRCS1V6dHF6c2pJNGFXcUtVbkcr?=
 =?utf-8?B?ekJucW44d1Z4N08ySm1mUmhuMVEyRXBxTmRXQ0V3QS9xQnBKOGV4V1RGbmp1?=
 =?utf-8?B?d0pzaHdYVlNRNE5kVW1Keit2MlFqVGlRM2Q0Vi8ydE9VQXVpSE1rWXBRaXhV?=
 =?utf-8?B?WmQ1YmN3SW1GMEp5YzJrSURaZ0VoY3dSVkRLZzlzckpWRWxDYWlDNmQ2a2Nr?=
 =?utf-8?B?MGJiSXVpbG9sTjJqaGhId24xT1dla3RrT25Pc3FGTEcrN2Z5ckh6ZjBRMldM?=
 =?utf-8?B?VVRKOExpRkExaXdhUXNQYXRWSVpiNEQ4YlF2MlBpR0dDWE9FeTJGMWxHdGdy?=
 =?utf-8?B?QkF4a1JtY1NLd0xsaG5ta2ozQVc1SFZ4c3hEMUJMREg1MTV4ZDU2MXN0U3Mv?=
 =?utf-8?B?dXV4aGxuTU1qK3p5MjlFQjNmOCtuT09YL044d05aRTEzWHlEaHhvNjFkZWtR?=
 =?utf-8?B?NWp2L0lUNkQ3RmtzOVZaU2tvWERSazNpUksyb2ZLczU3Rk0xWmFROVk2aVF0?=
 =?utf-8?B?SnBuTmQrdGhHVzNZNGN1eEd2bFAwVnRIcjNOQ0psZmc3UGlBdDhiMmNHNmdi?=
 =?utf-8?B?Z1E4NXhYYytMZEFYQWJnVzJZbUpWZmNPb3NVOTN5NXB1Y1dnN282VXhvaVd6?=
 =?utf-8?B?TzlYY0ZKSUdiSm53OG55bTFUaXhJU2VreGhOZzdvbStlS1ovWTV5MmpESEV4?=
 =?utf-8?B?VmR4MkhOejRuWGF6dWdSUmdWdGJwY1pQcDFKSFN5STRBUkpMbGVrVGszSXNN?=
 =?utf-8?B?KzNSSExodjBQTXlnWkVJRXZQTlhORjY3eHQzZ1NBcFRzeTlsdjZRUDFSZzhE?=
 =?utf-8?B?N1k5UFVRZzh0dlBHNit3L3lGUjVzRU1kalpYSzNvSjhjNFpWN2V0YnNkRnBB?=
 =?utf-8?B?YVZpUXhVc3lwUEVzeHB6OTI0QjM1WWtBWUhjVDNwYWlBNlBrakJGNDJvcFNY?=
 =?utf-8?B?N2hqaXVmY1crVWZUQjhwK3UrS3hjK25QY2I3cy9qMVNlZWc0ZThoWk5vdHBh?=
 =?utf-8?B?cWpack14anFDY042TWREb1ROZDdaT1hMVG1mbFN5SkhNd045UXJYd2ZENmdl?=
 =?utf-8?B?eCswSHhTK21YSHc3K2FaNEgzRDFjbjh6cWhNNSs0ajJ5OFo1UUlSUDBDeFN1?=
 =?utf-8?B?ais2SGhiWWpERnVHSGRmcjl5RmZOYTJSNEpMREJiWGhtVFdWeGZCeFFvelNt?=
 =?utf-8?B?YXQ3ekFsSTNhVjdXaFRPNTlVNWQ5SklUVHFhbWFzVE1FSVgwVjd3NkN6a2d5?=
 =?utf-8?B?SDZoWGpNUjFXemhmUG5nWVJDL01sWlowY25hVHpMK2lpUVJGRmtKM0ttc2w5?=
 =?utf-8?B?L3FwTGhTRVRIQmw4SERhK1FueXJDL0VscUhLNWNNd2VrUi9ET2RXaDlqVFdt?=
 =?utf-8?B?YTdweld5WjdnQkNDc0FEdWxNQmhnSkRDRkNaNE52T2lSb3BHb1EyS1l5aHRl?=
 =?utf-8?B?K1c3bjFZTnZOWTFxbUxNTysyL1pISzc3bEhXNDVkTlhoQi9ZT1B6ZkxpVVh0?=
 =?utf-8?B?Z3hiejhPdFI0ZG5GVXZ3d2hldVh5Z1MvZmlzWXBqcVMrUkt1MnJrQmpVVEpn?=
 =?utf-8?Q?MnS/HFko6v8loZEbqTPXamxX5SmayWtDkbMJt?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7C690BFB261E7640A41BF7F5649CE390@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 572a8208-496b-49de-e85e-08da2c4779a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 May 2022 14:24:32.1053 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zWx+mGRmBBCuS2hpl+CM1VxHBJQ6HN91H/cjVBxnSwHFxkJYZKAGWfg29SqUT+T50Eah9vAAQrh8pPMR3mBGeKHmnrBws+gWephCuvFyFQ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB3247
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, Xie XiuQi <xiexiuqi@huawei.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Guohanjun <guohanjun@huawei.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDIwLzA0LzIwMjIgw6AgMDU6MDQsIFRvbmcgVGlhbmdlbiBhIMOpY3JpdMKgOg0KPiB4
ODYvcG93ZXJwYyBoYXMgaXQncyBpbXBsZW1lbnRhdGlvbiBvZiBjb3B5X21jX3RvX3VzZXIgYnV0
IG5vdCB1c2UgI2RlZmluZQ0KPiB0byBkZWNsYXJlLg0KPiANCj4gVGhpcyBtYXkgY2F1c2UgcHJv
YmxlbXMsIGZvciBleGFtcGxlLCBpZiBvdGhlciBhcmNoaXRlY3R1cmVzIG9wZW4NCj4gQ09ORklH
X0FSQ0hfSEFTX0NPUFlfTUMsIGJ1dCB3YW50IHRvIHVzZSBjb3B5X21jX3RvX3VzZXIoKSBvdXRz
aWRlIHRoZQ0KPiBhcmNoaXRlY3R1cmUsIHRoZSBjb2RlIGFkZCB0byBpbmNsdWRlL2xpbnV4L3Vh
ZGRlc3MuaCBpcyBhcyBmb2xsb3dzOg0KPiANCj4gICAgICAjaWZuZGVmIGNvcHlfbWNfdG9fdXNl
cg0KPiAgICAgIHN0YXRpYyBpbmxpbmUgdW5zaWduZWQgbG9uZyBfX211c3RfY2hlY2sNCj4gICAg
ICBjb3B5X21jX3RvX3VzZXIodm9pZCAqZHN0LCBjb25zdCB2b2lkICpzcmMsIHNpemVfdCBjbnQp
DQo+ICAgICAgew0KPiAJICAgIC4uLg0KPiAgICAgIH0NCj4gICAgICAjZW5kaWYNCj4gDQo+IFRo
ZW4gdGhpcyBkZWZpbml0aW9uIHdpbGwgY29uZmxpY3Qgd2l0aCB0aGUgaW1wbGVtZW50YXRpb24g
b2YgeDg2L3Bvd2VycGMNCj4gYW5kIGNhdXNlIGNvbXBpbGF0aW9uIGVycm9ycyBhcyBmb2xsb3c6
DQo+IA0KPiBGaXhlczogZWM2MzQ3YmI0MzM5ICgieDg2LCBwb3dlcnBjOiBSZW5hbWUgbWVtY3B5
X21jc2FmZSgpIHRvIGNvcHlfbWNfdG9fe3VzZXIsIGtlcm5lbH0oKSIpDQoNCkkgZG9uJ3QgdW5k
ZXJzdGFuZCwgd2hhdCBkb2VzIGl0IGZpeCByZWFsbHkgPyBXaGF0IHdhcyB0aGUgDQooZXhpc3Rp
bmcvcmVhbCkgYnVnIGludHJvZHVjZWQgYnkgdGhhdCBwYXRjaCBhbmQgdGhhdCB5b3VyIGFyZSBm
aXhpbmcgPw0KDQpJZiB0aG9zZSBkZWZpbmVkIGhhZCBiZWVuIGV4cGVjdGVkIGFuZCBtaXNzaW5n
LCB3ZSB3b3VsZCBoYXZlIGhhZCBhIA0KYnVpbGQgZmFpbHVyZS4gSWYgeW91IGhhdmUgb25lLCBj
YW4geW91IGRlc2NyaWJlIGl0ID8NCg0KPiBTaWduZWQtb2ZmLWJ5OiBUb25nIFRpYW5nZW4gPHRv
bmd0aWFuZ2VuQGh1YXdlaS5jb20+DQo+IC0tLQ0KPiAgIGFyY2gvcG93ZXJwYy9pbmNsdWRlL2Fz
bS91YWNjZXNzLmggfCAxICsNCj4gICBhcmNoL3g4Ni9pbmNsdWRlL2FzbS91YWNjZXNzLmggICAg
IHwgMSArDQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYg
LS1naXQgYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vdWFjY2Vzcy5oIGIvYXJjaC9wb3dlcnBj
L2luY2x1ZGUvYXNtL3VhY2Nlc3MuaA0KPiBpbmRleCA5YjgyYjM4ZmY4NjcuLjU4ZGJlOGUyZTMx
OCAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3VhY2Nlc3MuaA0KPiAr
KysgYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vdWFjY2Vzcy5oDQo+IEBAIC0zNTgsNiArMzU4
LDcgQEAgY29weV9tY190b191c2VyKHZvaWQgX191c2VyICp0bywgY29uc3Qgdm9pZCAqZnJvbSwg
dW5zaWduZWQgbG9uZyBuKQ0KPiAgIA0KPiAgIAlyZXR1cm4gbjsNCj4gICB9DQo+ICsjZGVmaW5l
IGNvcHlfbWNfdG9fdXNlciBjb3B5X21jX3RvX3VzZXINCj4gICAjZW5kaWYNCj4gICANCj4gICBl
eHRlcm4gbG9uZyBfX2NvcHlfZnJvbV91c2VyX2ZsdXNoY2FjaGUodm9pZCAqZHN0LCBjb25zdCB2
b2lkIF9fdXNlciAqc3JjLA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC94ODYvaW5jbHVkZS9hc20vdWFj
Y2Vzcy5oIGIvYXJjaC94ODYvaW5jbHVkZS9hc20vdWFjY2Vzcy5oDQo+IGluZGV4IGY3OGUyYjM1
MDFhMS4uZTE4YzVmMDk4MDI1IDEwMDY0NA0KPiAtLS0gYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS91
YWNjZXNzLmgNCj4gKysrIGIvYXJjaC94ODYvaW5jbHVkZS9hc20vdWFjY2Vzcy5oDQo+IEBAIC00
MTUsNiArNDE1LDcgQEAgY29weV9tY190b19rZXJuZWwodm9pZCAqdG8sIGNvbnN0IHZvaWQgKmZy
b20sIHVuc2lnbmVkIGxlbik7DQo+ICAgDQo+ICAgdW5zaWduZWQgbG9uZyBfX211c3RfY2hlY2sN
Cj4gICBjb3B5X21jX3RvX3VzZXIodm9pZCAqdG8sIGNvbnN0IHZvaWQgKmZyb20sIHVuc2lnbmVk
IGxlbik7DQo+ICsjZGVmaW5lIGNvcHlfbWNfdG9fdXNlciBjb3B5X21jX3RvX3VzZXINCj4gICAj
ZW5kaWYNCj4gICANCj4gICAvKg==
