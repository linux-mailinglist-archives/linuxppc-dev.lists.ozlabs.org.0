Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F32812A94
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Dec 2023 09:43:11 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=XXmxVduq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SrQq06rr8z3vdq
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Dec 2023 19:43:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=XXmxVduq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::62c; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on2062c.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::62c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SrQpC2kD2z3dWD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Dec 2023 19:42:26 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VY6pXp+aeWgWZcwlr3YqGidrjA4WPdg9hOMf/gqBIJkjEUMUS/joOPEqo7Smk8j0i6RdDZlOifUP1lBb4QDrRrVIBJq8yZnh6yAMoA692K8dqj2frx5ZfaBovNOabJDnVlZerSGcIKu4eXvXCm1t5CBOwGkVhhY7IC9PjpQbvcNDwKLUEb5GBP20FYItvRj0dL1EHOxDWkLRnuJBudPT1gBiTlIKj59wfHFSRCHVlfTi+de9r8OXaDlD/GRFpft+wjOlvvkaBMUaiU5RBEmGs5fjqL8iJi64LaFZuFvqyz51hbi/rqiqPkBTda7HjOa0A6tVjKPV7K4t9UdxeDwxBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bOBftX54unTZAXgBMVOuXlqf2REtbmWB6W31i13K4dw=;
 b=CsFvUu+uv2ANJnOirAt5UMbuJOkeJO151iwS42erqSfZD2YM7H/Tp8xSFNGdX6ESDbGtp1E0zFtaUqziUt1Y+qSbosmNEh8+unKnNVDusK4z8VZk9bG2M2vGbNMpah0PQLuzg9N5/e71zDuoT5UXlelIYvO7Ht/DSkSvzBUxczTHqvga+mS+oHGMVxxLdOyGE4b430MLr984HUXdTCArnrR7TlsZjYVokTBVdX+XINQqaEvy5RPrxlz9dz5wpfR6mtqFw9X2nvbDCtvfLaGlBg1oJz20xpl2UIpgDy1+oUogExVMIqXLGle02QNUERrEcem7gJ4n6aWpEtVUKIvEXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bOBftX54unTZAXgBMVOuXlqf2REtbmWB6W31i13K4dw=;
 b=XXmxVduq3GyHdj+qPgKCmu+fmF2eWEOo/0AzIfJ8y5xd9XvSTu1F805eTaUUd5DneDopzee/pnR/C0x1CQD+7pRYuKWp1tspfcWORUYZDZtLL9hOaimcZh7hMI2XTtWlMPrgCyVvc6oYKYfv2mJ5ByaiicMIHKGpvVRRz4BMoAJVueFdyGyg1RIcANJChaF8gk5w+hpLpDQnXB7TsWiTEawZn8TsCqLtBFnfu2puuX/wy1ANUlXTojvWTvieNSjozmq6TzjRNzvhN+4wAfvJk0CmOycE4fF9dj+d9oocyY5rA+ehxeL9d+H3oxX2vUhq5x/XJBN0Cnmy9lqCa3Cp5w==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB3353.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:110::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Thu, 14 Dec
 2023 08:42:07 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f788:32b4:1c5e:f264]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f788:32b4:1c5e:f264%7]) with mapi id 15.20.7091.028; Thu, 14 Dec 2023
 08:42:06 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Nicholas Miehlbradt <nicholas@linux.ibm.com>, "glider@google.com"
	<glider@google.com>, "elver@google.com" <elver@google.com>,
	"dvyukov@google.com" <dvyukov@google.com>, "akpm@linux-foundation.org"
	<akpm@linux-foundation.org>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
	"npiggin@gmail.com" <npiggin@gmail.com>
Subject: Re: [PATCH 04/13] powerpc: Disable CONFIG_DCACHE_WORD_ACCESS when
 KMSAN is enabled
Thread-Topic: [PATCH 04/13] powerpc: Disable CONFIG_DCACHE_WORD_ACCESS when
 KMSAN is enabled
Thread-Index: AQHaLlJI6LSmE5V5qk+oa6hKFZGaxrCodi+A
Date: Thu, 14 Dec 2023 08:42:06 +0000
Message-ID: <1f3b22d4-00b3-4ff9-b29b-a901c03988e3@csgroup.eu>
References: <20231214055539.9420-1-nicholas@linux.ibm.com>
 <20231214055539.9420-5-nicholas@linux.ibm.com>
In-Reply-To: <20231214055539.9420-5-nicholas@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB3353:EE_
x-ms-office365-filtering-correlation-id: a0787351-02a9-4ed7-fcde-08dbfc808de3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  x0Bc7+krDRkjLqVAe63sv0nmryxan3HPJ7h5tjy0pCIL3fm76ZJ0MD7LWzzvDLY8oe+L5Hz+gzRt+JbtUOeQYEuo/e8BdqYCHACA67U46xHvfPOgesBuW9Cxm/r8kVVH9V6XwPr8sH2JWZ9D6P55mNZUbBLOXBDV3RCWZU6kF6lmQzd+SXPnroXHkv7MqPM4uayOQNelHKe3Dl4qQv+FS0MmCemOy4NHEI6rXs8qKQugRRIibng/jJ7oaIBtFMF5sHZnEuBVHqyrouEKddBHqIvSg7titK6doOxm1t74FS5B8W3u4uJv1vy0Qzjhorh3YfyGU9dJJ5z4mCRnTA5m68hOPTQ6CAvJZrxpdDLEu9WxINWLnQm0ivCYemn8iOv3s13UczPbDrM91wy3JvyNzkdHfejwPD0KrmqTWQ/tLrA8mohF96WpBPucpiOxZshFzSzZkBcnO65ie3Hux42f/bfEVM7nDbQibkzPTB8V13lzDDpf4FX9xdK6UGEoqWAildtve/jX0nDKkUA63kbaZTojyl02SCVX56S1Nch4LPV774OnMp842NIZt63ahG7jwkbw49Y2u/+xc4+kRs5Ngrr4bXOr9o+MWPl+uVgdKP0cTcn7y1TlwjKwN5paIIkuLk5ZoXszWlMuTNFgKXgMBRY62w9iu1DcDkMg5Q6Fz3Srd6LZFE9rAxnoGRGJWcGd
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(366004)(376002)(39850400004)(346002)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(31686004)(26005)(66574015)(6506007)(2616005)(36756003)(38070700009)(31696002)(86362001)(38100700002)(122000001)(6512007)(4326008)(83380400001)(5660300002)(44832011)(7416002)(71200400001)(76116006)(91956017)(2906002)(66946007)(110136005)(8936002)(64756008)(54906003)(66556008)(66476007)(66446008)(316002)(41300700001)(8676002)(478600001)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?d1c2N0tWSW1CME53TFRKQVB1bXk5YXpiYmZEbzg4SGYzZTR4TTJtU3N3TXpT?=
 =?utf-8?B?SmkrdXZza2VFU0JzclJRUHU2cTlYNWZpVmFYNlN4bWtaZGF6MEtaQnlDSS9k?=
 =?utf-8?B?MHo3d1V0SGJ0c3RLNUtYdFpvaU45dmd2UUNzVW1MSjRMMGtFcFAybythQWxa?=
 =?utf-8?B?RHUwckdQZ1k3NC9VaGhSeEhCZzNKZTNJZTZTYlJseFM1MFJLL2RhblJ3VG1h?=
 =?utf-8?B?dkI1WXprb08zN3NBMU1NV2ZLbjE3b0ZIZGRxaGpkNU8zNnVvaU5CVUUrRlZG?=
 =?utf-8?B?QURQUkI1UU9xaVJ0NmdmaWFFb1FwRVFaSUZrZEttbnFTQTZzRFJ1WFVwZEZX?=
 =?utf-8?B?L0V2KzM3QTIxNWUyK1pZb3RPK3BFYjFSdTcwMStkVnVyTjgwRVNZMXdhV2ho?=
 =?utf-8?B?MDJPWkk4Vm5FOEpOT1kvQnZQT3ZSRE9Ca0pYSFFGa0c4M1l0SkVFL0hPMTN3?=
 =?utf-8?B?WUJYbmgzdGFWMnljUXJtTThTSDIrZ2h3RWY2aDFmZ011RkFRTEh2dndkaUc3?=
 =?utf-8?B?eUZqMHR5N0FHem12RUZ5a2VzM2FpOEVkcnVwcEVyUG5jTDRJSm1TOU84L0xG?=
 =?utf-8?B?YlpsT2RWUndkNERFNXM0STdEY0xoTkswaTVUUTZOcWVrMGMyM2N4bTA2NmRa?=
 =?utf-8?B?MENnZEl5Nk9TODFwVVdacEJDWHdBOUJrYlJoZm04OTI5K01GekVVNGxiYTF5?=
 =?utf-8?B?RG9iR0tzaFZCelAyTjc5WlNuYlVaa2o2Zncxenk4SzRJRGUvZDFMSGZFSTQ5?=
 =?utf-8?B?OEpIZ0tXNS9LcnRWTitBaXZtUExLRm9wdkltU0J4QW5CcGxLZ3psc1V5SVRl?=
 =?utf-8?B?MEJLVHhhUUE5cm5FSXVFb2FicXlrVlRNODJLM0FERU9JRDM2cis5dXNQOHRX?=
 =?utf-8?B?WVdMa2lnbTZBR0VKU25CUG5XN0grUFk3V1pwNVFrOWNaY2oyUDlLeDI5dmJY?=
 =?utf-8?B?OUFJWW53QVN3Z2NnOTFvQnVkNnNEMU1kZmpvNXdJR3Bwais2ZWdrMkFmMVVi?=
 =?utf-8?B?L1lBNFhDSTR6T1EramNBS3puMk1qZWNsQlBmYklzZHdhck5UYWVrS2Y0UHcz?=
 =?utf-8?B?dDB2Uk9PZ3l2WnprZlFJcm9jd2FpSmRWV3ZDSmZaQTA5aThpYlEyOE80Q0VS?=
 =?utf-8?B?dnFhdVdBQjVpTjV3bDZ0d2tJUi91aktYQm5CK3F2bDRVVmQ0V3VLcWRjWmQx?=
 =?utf-8?B?bDlNazNVYzByTVlKbXRXcExaMDRjc1dMTE1STmh3cktVL0tyMlYzSE95RHVk?=
 =?utf-8?B?cFA4VFNjL2lQaUwxeFdPYzhsN1kwNHFWUkQyU3RnMGFJM3VGbWZGR2h2RmVa?=
 =?utf-8?B?amZLbGJyWjNQS3l1OEZWK0tMRVpPaDBUOHpPL0l2QUpDOVJjOFc1QW5VOW84?=
 =?utf-8?B?SU9UREtXM05CeWV3ZWt0R0hEYUJobTBZVXllK25UYXZVb0lzeGVtZVg3a3hS?=
 =?utf-8?B?Z0syb1hiY05LdU5Oa2ZvKzBuTE9yRnNTV3JpLyt3T3U4Q0ZqNnNPUHhldWxI?=
 =?utf-8?B?TmREVWV6aWxUV3d5RzNEaG1wZzcyZmlkVU5FaE0zNUNhMFBsdmtBU2UrbTQ3?=
 =?utf-8?B?VklUaGVrRGxFbFErMzdsUlpSUW1pWnhYWkdWSThJNDZtd1JpY0doU1pmSEpF?=
 =?utf-8?B?R29yNm1RbWRyYS9jK2diVS9LeFZyMGY0OHlHUTFra2FLY2dIRXBJd0w1SVg3?=
 =?utf-8?B?U01pSjdkQUtOeTYyVkM2NlVaWWR6L09GZGZOWlF4WlRLL0tiZGo1WlVrQ05R?=
 =?utf-8?B?RUwyS0hORmo4OTc5UGFvUlFkNFpsbkFCRGhqVjZSSjVKSXpOUEt4UW45TUxh?=
 =?utf-8?B?UEorY2k3eHZkSzk4RDJxVEkrZUhSczk5S3dqakpHdTh3Mmt2UVlxaU82T291?=
 =?utf-8?B?d1p4REp3VTdtUUQ1ZlRXQ1A5T3d2RGp2dW1lTHE0UFhFUVo2czU3K0NYd1N0?=
 =?utf-8?B?cDlpbUFsOHp4STlYYjYyVkdNM1ZjMU01RDkxQ0F6TDMyUTNMc21DdGNQcVBt?=
 =?utf-8?B?YWpmTmNvQy9oN28rb2FFTDFSK203RjBDNDZoNU1rZDc2L3VRbys5ZkRIVU9t?=
 =?utf-8?B?cnRDenR2bTkrejB1MEJ6OWUyL2tNa3NNNmFFR1lyWWppL29xRTV4bDB5Z0p6?=
 =?utf-8?B?bElQNW82eWVXck5yKzgvZlJMOFpaSS84R2NzVU5qdWxqMEI5ZnF4ZVpCdHl1?=
 =?utf-8?B?RGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A7DE56272EF88841A21E4624DEEC8060@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a0787351-02a9-4ed7-fcde-08dbfc808de3
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2023 08:42:06.8995
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LqglYRFHhNzM5li4Bb6jl8ocPxE4K4R/Zmqolu4NZi5FfObH/QgjVGfeqvTifWDbRoSrVGxqCNsILT7LwPPc8po47O65WWdcmnNQVFhixqw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB3353
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
oDoNCj4gV29yZCBzaXplZCBhY2Nlc3NlcyBtYXkgcmVhZCB1bmluaXRpYWxpemVkIGRhdGEgd2hl
biBvcHRpbWl6aW5nIGxvYWRzLg0KPiBEaXNhYmxlIHRoaXMgb3B0aW1pemF0aW9uIHdoZW4gS01T
QU4gaXMgZW5hYmxlZCB0byBwcmV2ZW50IGZhbHNlDQo+IHBvc2l0aXZlcy4NCj4gDQo+IFNpZ25l
ZC1vZmYtYnk6IE5pY2hvbGFzIE1pZWhsYnJhZHQgPG5pY2hvbGFzQGxpbnV4LmlibS5jb20+DQo+
IC0tLQ0KPiAgIGFyY2gvcG93ZXJwYy9LY29uZmlnIHwgMiArLQ0KPiAgIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gv
cG93ZXJwYy9LY29uZmlnIGIvYXJjaC9wb3dlcnBjL0tjb25maWcNCj4gaW5kZXggNmYxMDVlZTRm
M2NmLi5lMzNlMzI1MGM0NzggMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9LY29uZmlnDQo+
ICsrKyBiL2FyY2gvcG93ZXJwYy9LY29uZmlnDQo+IEBAIC0xODIsNyArMTgyLDcgQEAgY29uZmln
IFBQQw0KPiAgIAlzZWxlY3QgQlVJTERUSU1FX1RBQkxFX1NPUlQNCj4gICAJc2VsZWN0IENMT05F
X0JBQ0tXQVJEUw0KPiAgIAlzZWxlY3QgQ1BVTUFTS19PRkZTVEFDSwkJCWlmIE5SX0NQVVMgPj0g
ODE5Mg0KPiAtCXNlbGVjdCBEQ0FDSEVfV09SRF9BQ0NFU1MJCWlmIFBQQzY0ICYmIENQVV9MSVRU
TEVfRU5ESUFODQo+ICsJc2VsZWN0IERDQUNIRV9XT1JEX0FDQ0VTUwkJaWYgUFBDNjQgJiYgQ1BV
X0xJVFRMRV9FTkRJQU4gJiYgIUtNU0FODQo+ICAgCXNlbGVjdCBETUFfT1BTX0JZUEFTUwkJCWlm
IFBQQzY0DQo+ICAgCXNlbGVjdCBETUFfT1BTCQkJCWlmIFBQQzY0DQo+ICAgCXNlbGVjdCBEWU5B
TUlDX0ZUUkFDRQkJCWlmIEZVTkNUSU9OX1RSQUNFUg0KDQoNClNlZW1zIGxpa2UgYWxsIGFyY2hz
IGRvIHRoaXMuIE1heWJlIGEgYmV0dGVyIGFwcHJvYWNoIHdvdWxkIGJlIHRvIGRlZmluZSANCmEg
SEFWRV9EQ0FDSEVfV09SRF9BQ0NFU1MgdGhhdCBpcyBzZWxlY3RlZCBieSBhcmNoZXMsIGFuZCB0
aGVuIHRoZSBjb3JlIA0KcGFydCBzZWxlY3QgRENBQ0hFX1dPUkRfQUNDRVNTIHdoZW4gSEFWRV9E
Q0FDSEVfV09SRF9BQ0NFU1MgJiYgIUtNU0FODQoNCkNocmlzdG9waGUNCg==
