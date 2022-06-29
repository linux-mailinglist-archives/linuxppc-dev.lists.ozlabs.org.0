Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3E455F597
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 07:11:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXqMG1Jl8z3dt8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 15:11:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=NA786uCw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.57; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=NA786uCw;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90057.outbound.protection.outlook.com [40.107.9.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LXqLD6jKlz3dQs
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jun 2022 15:10:59 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FucgXlGXUA1TcnPdKUkcewZgGavHMPNtx4F9OGHeHQVaCLLbArf8aokVlWH0wFfLglfgtZlIAceU7k5+B/vFNbLYhY2MjTTlylKa2AIjCL8ewG+HuVmSRmHRt7G3P+6j8qNjZ0oAtx6iUpXZ/27JXFAcHGSW84RXReXhD/VpzVh7ejmOEFxHev8JdyCW6l2w/jqQXVEGq9sApLLhsiyg1zYM5MzxWvFlxLW0nH3sjiMYBAVZaun5rJ+HcvcnV2/aMk7a629s3ayngyVREd1wyWxJzdoav+MeeDE7lnUsLhGWKZe4cT6Bw02p20NVAj+SjF1XI6cAoosp04NaBWRcCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nk7iIOOPMQjKMn4Nf6cQOMGI17SxXJzhDkRkgqLE/yA=;
 b=DXO+8nXK+N7FFd9r42MOj3qeXEGxKVVMgC4g5RlfKYJBNGQMfokY5EbQf1GyJX7DxFg4K9efD9oTSDudouNEt5P5EX5E6zCm+ywXkqFm8E/muCw49gTtxZ2InLrXHCu8fmL3RK50WE9k4ImDxYNFLWoEuDZKlop/vy0SDPhhPgG5IA1So0tshvO6d/OZ3l2n9oMa+QHSTsKYv8ClBfUBSaYfYgpCcSGKgaCk6POkLsh8zFdTpakpSIR4b8nGvxbSp8e0MmpEizP7OtkuWSJUSiCfNiS2Eac8wokUtvmvv/YlElLDmKh4aFM2WrD0qS1OnIamZx0cQzXBRDvbjXkbBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nk7iIOOPMQjKMn4Nf6cQOMGI17SxXJzhDkRkgqLE/yA=;
 b=NA786uCwdkmCjgOQ78skrFGOKeykfV2OWT9NAW0uTlVoDqRsuRjIHHsnKBUv1wXUVfGdmjKxesrn8jZLGb35fn/5X6BP6FjTBBMm0w4jDGo6AceyvLl0Y0AosYOcCO0LnY0oTaoNKrZMgJ7SdDLjehxaXrHTLGADH7I/nTrkspoLab8HcH22eeNWPq6qDw8MNLF5hHTSzzaJehETkhmwwUEToFxI5FEoeKFg5JDsiocaTz9m6TMFA7Q8252qfjDVp6EYVrFAe9mRhtSOFhg/ZlB0WVG7HghSkn20v8VfsxfVVgOOlhYonmCzbGo03grcHwhgA6A5Hmw+HVSeDe9G7w==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2517.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1e0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16; Wed, 29 Jun
 2022 05:10:39 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e10e:bd98:2143:4d44]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e10e:bd98:2143:4d44%3]) with mapi id 15.20.5373.022; Wed, 29 Jun 2022
 05:10:39 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "GONG, Ruiqi" <gongruiqi1@huawei.com>, Kees Cook <keescook@chromium.org>,
	Marco Elver <elver@google.com>
Subject: Re: [PATCH] stack: Declare {randomize_,}kstack_offset to fix Sparse
 warnings
Thread-Topic: [PATCH] stack: Declare {randomize_,}kstack_offset to fix Sparse
 warnings
Thread-Index: AQHYi2q3CbbWycVsL0+lxSnFp6ngM61l1k4A
Date: Wed, 29 Jun 2022 05:10:39 +0000
Message-ID: <ca0fa9d2-64dd-0e77-71b6-3673e353c316@csgroup.eu>
References: <20220629032939.2506773-1-gongruiqi1@huawei.com>
In-Reply-To: <20220629032939.2506773-1-gongruiqi1@huawei.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2582af73-5f84-4bb2-f2ef-08da598db589
x-ms-traffictypediagnostic: PR0P264MB2517:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  z+sO00V+WrLiFVTxQCZSbBdpTQdAKnCKS/gFLKYLuEga1yknXL9i4j4HhSfUCMwzRN1fUkZNPexM38VtEG9VQfqyGum6wR4ANc4cMP99AwAK/rymJ953WapMihICRC5WogfmyEl+KEWMv4oAhbRt1lWEn4Akc9Ks5i0z9g5Rhv7Nxc8HacB11RbABYuZeof9yCpw360p4+XNLdzomA1oRDtUz8Y8Tprg+w/qRX/1e6x5xgseUsKqzZMnVqoF+RxUBpeNkHGH+iHHYRjw7LBiIEkRiijy5vAoNAYro1wl49P5BIkRDsw8oVheQRvpSKAPBPHZQ8TAugAimJI/EHxu8eqVl4T2n7iDEE1zg6j4yhq+c129VixXlm6FFFW4OX/OaeARR2C9xQ2caodY9fmZ0tQCVsOsM8IgXuiw1xFFBO+udUiupy+meMiOy+Ow+/fU4mBFFjsRtEKkZLi50PnHRoLUrXeYM8G/6KDvEMTXJ6sbAEnQwsgWoUecOKBmoHU/F7YIoDhCpdKKi5OMmH4eDWD6dXU864jfW62XonK+pNozVzIKMm/KjpiFvK+mlokx3j3ctr4ZJiVW3Nr2ixmlPwPQVtR57L6RnWmEh8X7IcajHDgPFaHxYH2ph0TNwuNA9AXEslfcttvq1ogyaiYaH9sWXpJ3R6i3eNAo285XzMdnSIPawEi/CgP0+KvExIoifVCxRD8ZKJD3vPI6f+64PHqTwQHnd7q6Ysot9+xaNo1Mrqzg9HgEql+vWQ+AiuXxFxN/iE+EX1z26FjJTy00U/fJo1K67VBteAEHT2oyxLa7/JWeBbaxvMIajHUkzM9ilTo9oEgH0IphlcRoihGj+FeMm2+nb5j7tbpCdlobNstz6kL7wEeUuUH4cNcx5kSwrUwjJVocyXKSpQmJQYbWIg==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(346002)(396003)(366004)(39860400002)(66446008)(5660300002)(66476007)(66556008)(83380400001)(66946007)(4326008)(6486002)(110136005)(71200400001)(38070700005)(41300700001)(2616005)(966005)(8936002)(64756008)(44832011)(8676002)(76116006)(38100700002)(186003)(66574015)(478600001)(91956017)(36756003)(122000001)(86362001)(31696002)(2906002)(316002)(6506007)(26005)(6512007)(54906003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?M3JrY005UmJ4TnBzcjJjbFdsZzBFYUxob3NMcFFJZ3JmKzZyYnBjSnhoRXo4?=
 =?utf-8?B?ZUIwMGxpWUN2TFg2VWxYN3RPN2tFT3RNUWFHb0JYdHlzMHNrNGZZa050RGdt?=
 =?utf-8?B?M1ZBanRWeGVPYWhtSGNkckMxK2ppcUcwZWxMd2hKeVB2ak9BdFg1MUVXOVQv?=
 =?utf-8?B?N2hIMDRyLzdoYTI5UFd0QmkvNkpQenpQU0FKREFCNldodEd2TjRJb1gvWGJs?=
 =?utf-8?B?RklRYWs0VG1VWllxamFpa2R1dXZSa3VJZkdaQ1VqWURJSFhqYnpkYTJLT1dE?=
 =?utf-8?B?am8rOEVELzdDY1k3OE41VHNRcDNBS3ZFRldDYys5Z0ZCeGNvWVpGMEFyR1VD?=
 =?utf-8?B?d0Fjb0V4cHpoU1A5Q3MzdXJTbjRIQzg5K3YrWlFsSkd2c2FhdXdEWEVqL1JZ?=
 =?utf-8?B?bWV1WnNVL1FaRDZUNnB3RURpUldDOWJnK1c4QzlaUENjcElhRWFHV3Q0dE9w?=
 =?utf-8?B?eWsxdmlveDIxY0N1ZzdxejMzSGNjZDJhTzFVRktQaTkyellWRFZQL0F4NkQw?=
 =?utf-8?B?VTV3ZEJ2SkZyTmRnNmhaUm1rSkpKdWdXOFYySmRkb0tWWEFBb1VYc1ZXV2xF?=
 =?utf-8?B?dUJPaDdXcm4rN1QrOWEzSWNVMlFRaCtJTGdOMmxCWmZqMldKYXkzbVcvNk5m?=
 =?utf-8?B?SjE1UFFWblhzbXV0aG1jWllPdklVbHJHdjJWRXZxR0JNTGJyRDMwcWppMCtR?=
 =?utf-8?B?Yll0VVIyWXJreG1SSFk4amxZcFJ2UjBzWmp3cTk5U0ZPL3BWNHRpc0ZlODVz?=
 =?utf-8?B?ZjVuVS8yK1JrYkpSSkJJNHU0NjJaVTBZck9RcDNQdjlQdGNSYXVJMWFKMzR5?=
 =?utf-8?B?NGlpdWhHR1NPUFJhNHhidTB1NE1vMnV1b3VjQVFkOGtXaUc1NFU3NW51M1pr?=
 =?utf-8?B?SEFOckNKeFhlMzF3S1drazVudlJ6eUlBOVN2cWo5T05WRWNiNmJ0M2o5dzNm?=
 =?utf-8?B?M0lMUjc4MEY1R0RHUzlCcXFjalZhUUdITDV0cE9TTEE5WW1pRlJxWmwvMkt1?=
 =?utf-8?B?QzBOWlR3SHY5bVRpT1Y2NXBoUmUrWUVFQi9jR1p6V2xJQzFUK1pqSVdZUTM2?=
 =?utf-8?B?VWVGc0dJSGV1bFFXa3hrRDJHZDdmTzNSaERwRVZlZ2JydFhQcnVxMWlRQ1No?=
 =?utf-8?B?TDM0VVZUU1pSZ2xELzBnYVVLRHZ4R2V0WDRMdlFzem9Mcjd5bFZKYk5yVk1F?=
 =?utf-8?B?bHI0NzlHUnNqYTIra3o1MDhVdythakZZOGw4VkQrV3YxRFVqTXRobW1GYmVD?=
 =?utf-8?B?WUJ2bjI5ZGRUMG1nM21OYXMyYm5qVnpOVm9lOG53d0lRL1Q2S0tJRXhrNkY2?=
 =?utf-8?B?SGp5VU1Rem5IMFJ3bHF5TVJxazk1NWpqMTBkcnhHTXVxVU5kNzkxVDFKOXJ0?=
 =?utf-8?B?dWJ2Y1NMQmxTY28yU1VWSHpMSnExNGUrbFM5TFIyYXZOYTN4MmZlLy9Ld0NB?=
 =?utf-8?B?MFpxSWJuaTVJSklKdktNTThacVVIYURTMkptY1FESWVNMkUwY3BKbnhuZ1d2?=
 =?utf-8?B?ZS9qTVh2T2xySkc0cTN3di94Q3kvRWptdy81OEdqKy91UnJQK1hLc1BLVnFk?=
 =?utf-8?B?RnMySmZ3WEwweDFYbWM1R1dsazVWWW9CU1FjU29ORXZock91eVpPc0ROYkNi?=
 =?utf-8?B?Z3FHeGtvNDhFbUU3L1VCNDFVc0pOWGhodTl4SUdkUjd4Vm1xaFEzTE1uOG5T?=
 =?utf-8?B?c3psQWo4UkdicUczbzBwYU9qdU1qV1BqOHo1Ry9jREZta2pDcUFVaW5PTHdZ?=
 =?utf-8?B?VXU4bFBLeUdkWVc4eWlGM0h2ZlVUblIyVm5MVkVxdnV0R1FvQUVrRWNFUFVS?=
 =?utf-8?B?YVJSc0tJVjFiTm1xTFZOMUZTK2dOWUt0TDRpcDJhK05qZXY2RnBPbkFYT1Nq?=
 =?utf-8?B?b3pSd05mZGpETklVc3o0Yk9KWm5iY09IS1RDTEFzN1lsSitlY1pNVmtjRTJU?=
 =?utf-8?B?T1M2SG5oZGxGaDlrYWtSMzV3VENkQnBpN3hYM0hkNjZMTC9rUG15cnV1OGVJ?=
 =?utf-8?B?ajFGb3N6UmpUM1dhZzJtMzIvSmlKdnBOT0dGTGRpMmk5VW9wSmx5SXVLRGU2?=
 =?utf-8?B?YUZMMU40c3NVRFFqZW9HQzVjYjQwVjdFQ3BtcHNkeStmcHR0Qzh0YnVZNStz?=
 =?utf-8?B?WWdMNTBCWXBpWVVXa3VIa0VreDhKcEk0djRtMHVIOW01WkNuQmxJM0ExaGFL?=
 =?utf-8?Q?UuJBgXlU11skj8wPB0OzSPs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3D61586474E5E24B9F1B126CFE6F71C2@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2582af73-5f84-4bb2-f2ef-08da598db589
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2022 05:10:39.7011
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RE7WAvqtsG//J8aMl+/9WLNPkdJHuJ+nApl+vT3M5w7VOID8WEgyGe1128XJOtGwJVnZn3+J8qjevUj7KImgvOX9N0x76u2G07FadaObIf4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2517
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Xiu Jianfeng <xiujianfeng@huawei.com>, "kernel-hardening@lists.openwall.com" <kernel-hardening@lists.openwall.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI5LzA2LzIwMjIgw6AgMDU6MjksIEdPTkcsIFJ1aXFpIGEgw6ljcml0wqA6DQo+IEZp
eCB0aGUgZm9sbG93aW5nIFNwYXJzZSB3YXJuaW5ncyB0aGF0IGdvdCBub3RpY2VkIHdoZW4gdGhl
IFBQQy1kZXYNCj4gcGF0Y2h3b3JrIHdhcyBjaGVja2luZyBhbm90aGVyIHBhdGNoIChzZWUgdGhl
IGxpbmsgYmVsb3cpOg0KPiANCj4gaW5pdC9tYWluLmM6ODYyOjE6IHdhcm5pbmc6IHN5bWJvbCAn
cmFuZG9taXplX2tzdGFja19vZmZzZXQnIHdhcyBub3QgZGVjbGFyZWQuIFNob3VsZCBpdCBiZSBz
dGF0aWM/DQo+IGluaXQvbWFpbi5jOjg2NDoxOiB3YXJuaW5nOiBzeW1ib2wgJ2tzdGFja19vZmZz
ZXQnIHdhcyBub3QgZGVjbGFyZWQuIFNob3VsZCBpdCBiZSBzdGF0aWM/DQo+IA0KPiBXaGljaCBp
biBmYWN0IGFyZSB0cmlnZ2VyZWQgb24gYWxsIGFyY2hpdGVjdHVyZXMgdGhhdCBoYXZlDQo+IEhB
VkVfQVJDSF9SQU5ET01JWkVfS1NUQUNLX09GRlNFVCBzdXBwb3J0IChmb3IgaW5zdGFuY2VzIHg4
NiwgYXJtNjQNCj4gZXRjKS4NCj4gDQo+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xr
bWwvZTdiMGQ2OGItOTE0ZC03MjgzLTgyN2MtMTAxOTg4OTIzOTI5QGh1YXdlaS5jb20vVC8jbTQ5
YjJkNDQ5MDEyMTQ0NWNlNGJmNzY1MzUwMGFiYTU5ZWVmY2I2N2YNCj4gQ2M6IENocmlzdG9waGUg
TGVyb3kgPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4NCj4gQ2M6IFhpdSBKaWFuZmVuZyA8
eGl1amlhbmZlbmdAaHVhd2VpLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogR09ORywgUnVpcWkgPGdv
bmdydWlxaTFAaHVhd2VpLmNvbT4NCj4gLS0tDQo+ICAgaW5pdC9tYWluLmMgfCA0ICsrKysNCj4g
ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvaW5p
dC9tYWluLmMgYi9pbml0L21haW4uYw0KPiBpbmRleCBlMjQ5MDM4N2RiMmIuLjZhYTBmYjIzNDBj
YyAxMDA2NDQNCj4gLS0tIGEvaW5pdC9tYWluLmMNCj4gKysrIGIvaW5pdC9tYWluLmMNCj4gQEAg
LTEwMSw2ICsxMDEsMTAgQEANCj4gICAjaW5jbHVkZSA8bGludXgvc3RhY2tkZXBvdC5oPg0KPiAg
ICNpbmNsdWRlIDxuZXQvbmV0X25hbWVzcGFjZS5oPg0KPiANCj4gKyNpZmRlZiBDT05GSUdfUkFO
RE9NSVpFX0tTVEFDS19PRkZTRVQNCg0KWW91IGRvbid0IG5lZWQgdGhpcyAjaWZkZWYsIHRoZXJl
IGlzIGFscmVhZHkgb25lIGluc2lkZSANCmxpbnV4L3JhbmRvbWl6ZV9rc3RhY2suaA0KDQo+ICsj
aW5jbHVkZSA8bGludXgvcmFuZG9taXplX2tzdGFjay5oPg0KPiArI2VuZGlmDQo+ICsNCj4gICAj
aW5jbHVkZSA8YXNtL2lvLmg+DQo+ICAgI2luY2x1ZGUgPGFzbS9idWdzLmg+DQo+ICAgI2luY2x1
ZGUgPGFzbS9zZXR1cC5oPg0KPiAtLQ0KPiAyLjI1LjENCj4g
