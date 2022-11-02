Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE13616419
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Nov 2022 14:54:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N2T0537F4z3cMt
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 00:54:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=LtcHRLvE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.84; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=LtcHRLvE;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120084.outbound.protection.outlook.com [40.107.12.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N2Sz64G52z2xG6
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Nov 2022 00:53:37 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ScpNRPQ4J/jbX3LbZaYvrkS8BvtbHo6IN8kexpWP/XkWe0dxZUltyNVFBt7q+5uzCk12ofMvgE2hwXZMdDiB3OURxgZVY1HwC9+VI0vHGEcE9asw/yXkfnz487sMCUhYFRyRnUXM3dsYpszTpxnYmFiYi7E0CUmIDLc2IkjzQRqLQWD7D1yiEzPZjsF00M3hEeHf02qQcioork4QTOXismBZEVZEI8YPEtZOsf4BAy8I/DNo0BZZxbEXqpSMC1k0+RmLvtS3p60M2mlSHrSdU+yBBAnbzu2vXuaLPWbVv7rwAYZvOWR2Vk2RJ88IMhJApmYhLFaJuarFbjURK1rbgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m7aY24W/erk4nvbZNNMnm/yWYUKjXiFACD40QGVj9hA=;
 b=mxML0lJCO5AkEtkX2LTNHpDJbqc1x4+zdF5fPuDX7ETFu006eT3XAo9EY7rkL2DS6EYmOAbnxVUFUKwDiRbpuUT1B54wQ4oTd1qhrH8rK6j/9VQUjU+SVD5iD9w44aspptpbtz0mg7LLc8LagmIeTQt2AeSYWZszvby3F8KNhjom70Sxu4nFHilzDFg7C8i1SLXnLdc8XejX41pVqR2I1t3DAhK3XopyayAGpsceeNsFblkM9a6eoS9nOnf1mKSU5Xr0xk+Hzjl1jm6mVoXxbPuqrcH3oj7hQpTEp1DdWB7TT6BxH1t2ymXzDDPXViAQznRR/H4E+NhS76KeNM/RfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m7aY24W/erk4nvbZNNMnm/yWYUKjXiFACD40QGVj9hA=;
 b=LtcHRLvEsm2wJHdChsknGCNfcy/Vk0lDtMIob4GAIMeIZ6FuYCPDMeiVDNBs1GAnsjx4IEPi4/2W1XxgG4As5f+9wigOSJsuQi1oiLzA+SAM3TNdlFn0BYpfXP+Kqw+GQmM4dpn5PSU0bnc9HLPmxlKVGw7NunLTVofZ4br5TWllOmANGrsYdn95my7T9Nkvk8tOkW9cxkH4PnZrv6IJd2ku6m7UDrxq7NfRcFbh39Y3YxmR2WDNoX9zx1IlGYelJetk0aR+Ej9Jq0eG8bINdiE1fl2x/ZBJXoRiCIqMzeH6FLD1iwP3MPz7xKnDEZbQwypcgNOpw3lCu6e5YkYCMQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2998.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1d5::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.19; Wed, 2 Nov
 2022 13:53:18 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8bbc:32cb:956d:88e8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8bbc:32cb:956d:88e8%2]) with mapi id 15.20.5769.021; Wed, 2 Nov 2022
 13:53:18 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: chenlifu <chenlifu@huawei.com>, "benh@kernel.crashing.org"
	<benh@kernel.crashing.org>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
	"npiggin@gmail.com" <npiggin@gmail.com>, "nick.child@ibm.com"
	<nick.child@ibm.com>, "zhengzucheng@huawei.com" <zhengzucheng@huawei.com>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"paulus@samba.org" <paulus@samba.org>, "rppt@kernel.org" <rppt@kernel.org>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>, "oohall@gmail.com"
	<oohall@gmail.com>
Subject: Re: [PATCH v2 -next] powerpc/powermac: Fix symbol not declared
 warnings
Thread-Topic: [PATCH v2 -next] powerpc/powermac: Fix symbol not declared
 warnings
Thread-Index: AQHYs8zqWvlqsidXqE6zmHJxD98Laa4oHHwAgAQA1AA=
Date: Wed, 2 Nov 2022 13:53:18 +0000
Message-ID: <40a62a53-e971-ab26-6ec6-7727eb1d6a7e@csgroup.eu>
References: <20220819130616.2030769-1-chenlifu@huawei.com>
 <8478195c-6d6e-d5ac-40f8-ab764419881e@huawei.com>
In-Reply-To: <8478195c-6d6e-d5ac-40f8-ab764419881e@huawei.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB2998:EE_
x-ms-office365-filtering-correlation-id: 983c9805-5c5c-404c-a813-08dabcd998a3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  UnJNy3S5YO8mfZ1alkLFMzGzOCaN75BAyipUTQM8FR6s19lGJ3p25odzJPspGT1MxWPjspyYBa0W4/YvrdyP6FKUlyR/i2R511qg75rgORiRJo8pfUwRD/6Mu13kgTpvnnmoC8WZB04CubY/15TaYS3eMHRyNTkcj4UFS3xWLEPUfYo5PdU9ONrZw4VdGS2TmQTKWb1j2MyyfskBJhh05LrNCuLSgrbgYv9UbGBbfFkp1Uh/FrFRt43N2jipJiiG/kHNv06Mc1QuzNqzrUZ1hw+fOtNc505Mv62vzJkOiDLqDSODeIAtRc0qYBCeliepfNZShZhE0KDFKZr3SZQJ3fVn8onroI/8bvhTZoq3sn7QOA0cvlF/Of6ZtGBts23csZA0CRvUOi/ENszj0JdffNnM6350PY+N9ob5/k+vJFOKjgVDmXQ9VdfT013LU93amq+3jfPGLpJCASGxsjZpyHcQ9sUB8tqS4CrBgLVkCXR58nAFzt+C/xKWDDKFBLcVCZsCc9KMp/AnW+9pNSD3c0O6mkxlT5seQBs45ma9LRAKJl3KrEpQuLjs/88JJhCRgaMSaOLDmzZstwADBPALzjRhxywF3vnJNQvSTcNulQXcSr/g7TPQ/xbKdBmFbJz0KBvnUD7MkzgTJxuqhhni7AcDbljrXDu3GRr2i8wIxH430a9Kp6pkAkGvOEPE3GGOF7yLgYWmn8wQuXCrQt2g2V7h3e+64oGjdj8E1GkZyjqd+TSMA7ZKOQtiLP/8GnQRqrQhBTKzH95ziKylT1MsSutaLnJaMAwSNPEvIWZe4Rp1gBFNN0UbdkbDN1/pMm2x9P+emhto5EVfVdZJ5mXmfw==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(366004)(396003)(376002)(39850400004)(136003)(451199015)(66574015)(31686004)(83380400001)(110136005)(36756003)(2906002)(44832011)(71200400001)(966005)(6486002)(122000001)(86362001)(921005)(31696002)(38070700005)(38100700002)(26005)(2616005)(6512007)(8676002)(186003)(478600001)(5660300002)(64756008)(66556008)(66446008)(91956017)(76116006)(7416002)(66476007)(6506007)(316002)(41300700001)(66946007)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?VVNCMWZCYUttSU14RU5HUDdPUU1WVnBWdllKTk9iT3F3aFZFU2xNa2IvSGY3?=
 =?utf-8?B?TVBIMU0vMWtnellONUlCbmx1TEd3Zkd3YjhkK3VMWTVzRkRCbWcxQ3JaQW12?=
 =?utf-8?B?aUVOczhaVUJaWVpzZEovMStKMWJ5NndERkRDNzVxQUJFZFdDOU1La1NOYi9v?=
 =?utf-8?B?U3NEMzdmQ3cxZEtGajJtRG9xNUJsSkc4b1dsZmtET1JsMGVEZkRtQytDWFpM?=
 =?utf-8?B?MmJxTHBiRWhLcmlVcUJQR0F0bkliajlWdWJsMng0RUFwWjBSUTlueXU3b25r?=
 =?utf-8?B?V2dyVlplT1JueUhjRHlha0hrTDFmK25Zem56dkNQVnAxWGJiQ1lnWUVMSVhl?=
 =?utf-8?B?azFUcDdVcU5EbUk3OHhpTjNmWkRZNUUzV0EyRW9nOEl4eHVWWDg1YUlibmlt?=
 =?utf-8?B?RHVsRFJVTjFJV21WMGd6ZXh2a3BiZmtKd3Jzcm5LcWYwSHJtckpPRyszSjYr?=
 =?utf-8?B?VFJ1YkRERWdkWjRJVWNtUitqMklPK0pZYnRleUdMMjFRSUpLUGJxSzEva3cw?=
 =?utf-8?B?VE5OZkF6bFBra0prU05HNVhRNHRoaVp1Q0tjSXBrd0pzRGRCTEEzKzBiL2Mw?=
 =?utf-8?B?TWJRbWg4c3Vkb1RvUjViRjZCZk5QckJNRUNBVzJOSDhUVlZRdUkxaWNnSDNQ?=
 =?utf-8?B?Z1k3RjZxK1pyeHkrb2FCNmZpejhWM0Q0YTUxYlh0b0lmbGIxaEZ4dnRUTUZL?=
 =?utf-8?B?OFpJMUdNdExLbG9STk1DVlQ4WkpVU3czOGFyNlNITnVKWFpTWWVrN1RGM20w?=
 =?utf-8?B?VmJyZ2VMMjVnTUdMS0RJbHVHSmVDeXRobVBzNlRUcHlnUHgvUkVka1pBQjQ3?=
 =?utf-8?B?bFp3UHhpZWhtNG9oaHJacEUxcGpUN0hCV0lDUFZwcjZVNkdRWGFVRi92L0NV?=
 =?utf-8?B?aFZQaEZDL3ZrN1FxNzRDTWJsZGt4YlE0TzhveDRVUVp4eExGOUVIeUVTSmpw?=
 =?utf-8?B?M0VKbnowa2hDZkV2M3A1c2U3aU8zdGRzUDJyYkUvZ0R5MFBrT2VzaERiSFFG?=
 =?utf-8?B?bTRVbHNJMXpGMW45QUhscDZyWUNGdExLdUllNmdTNnZmZUgyUUk2VWVYMk4y?=
 =?utf-8?B?MkhZYVVlVUVjRnVvLzZud05Ed29uRTJVQjhEaDZFcm9KbHhsV24wUUhsYVli?=
 =?utf-8?B?Q3ZSSUJEZEk5Z2tFY2VEdGZhelRPQTY3cmtqSHhkZHJTNkg0YXI2RDZYb1Rh?=
 =?utf-8?B?VGpuSUthWHM4WVJVRHhaN2syZ0NSdkJMK21hSHVRRFp2Rm9YQTZIU3FkZUl0?=
 =?utf-8?B?bnd4dmJNV0VqWC82Q3g3K3JRQXFmbzFJbkloQ1RQVStpMUVqaklENXhZZHlo?=
 =?utf-8?B?QTQrZ2FmaXFSU1FzUG9pc09FL1VPdUpWMjZyZmJCRzJKVHgrVU5Ta0M1Qk5Z?=
 =?utf-8?B?Q1AvemVmY1pFVVd4NHFnRUtxdUJjbVNsZUF3SjNMQlRJdDJwNUNiUHJmRkc0?=
 =?utf-8?B?K09SMlhtSDEwQzVEVUdnb0MyQ1VwcTdMUnF5SlVrejl0Yld4WE0rQ0NYT0RC?=
 =?utf-8?B?VnNBYklCK0RPVDBYQ3U0ZnEraFkvU2tiVk9IR1NkRy9Zekc1eXkyYkdyOFpl?=
 =?utf-8?B?djcyL1lDOGs5OWdQTkdmRW8zNVpKVGRzOWhuaklTWURiNnB4cFBJZnJQY3h6?=
 =?utf-8?B?anFJeHo1S3VmaHVuU2phRVJUcDMyaVFybHZZeTY5U2RlT3YwUmJKZ1p4a2do?=
 =?utf-8?B?VHluZEVYWEM0SDZVNVNGNW5ZdjBkaG16cXlXYVIweE5pZnR3VjM4NnNQVXBP?=
 =?utf-8?B?RTRsMVUwMjRiRW9KWXd3WEZ4UktpWW56NjVUazFxNCtsdzhNVlJNbkhXMEZk?=
 =?utf-8?B?MS9Fa1RNMXVsc1dQMXdJMjFlcEpyMGxORitiai96NUZ6YU56TUtoaUpQV1d1?=
 =?utf-8?B?YTdLQjhLNmh6N1MwWGpWN0F5V01DSnZMWVkyYkpUejBnS256NSt2eFNuY1JN?=
 =?utf-8?B?dFJ5ajVSbGpNTGJZYS96RVdZY2tLSGZ0dE1lb1B0VmkzTE8rT2VXejlFR1ds?=
 =?utf-8?B?Y3JReXRGV3RaVTdGdVpkcEpyRVdXTFJHdm11Uy9ra1c0MThRTjIybHdNUldi?=
 =?utf-8?B?RlFzSUFwMEV4TUtLbzhlbTlqREsxSFBNdTRLR1M3NlU5TTJaZ2k2NkJ6Z3BX?=
 =?utf-8?B?MGZ1RDVVWTJVay90VXN4NDZBUVUwMTJCNmU2WW1tNG40Qkp3OGs1YTBpbXlS?=
 =?utf-8?Q?ZuyGVW92plX9H1IwjzewdiE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <75030AF654D6AD4F9146E5834C2D2B2D@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 983c9805-5c5c-404c-a813-08dabcd998a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2022 13:53:18.0821
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7ON1GI7Inbm1S6Px1XhBakcT3rEiW2EwaHzs7Z1eg4pKEiq9ipNo8bjov3Ks84iOtNcM9O7idbUA4TCMbpLs9MT/L2ZbQ9I/Fz+KLRTX2tk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2998
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

DQoNCkxlIDMxLzEwLzIwMjIgw6AgMDE6NDUsIGNoZW5saWZ1IGEgw6ljcml0wqA6DQo+IFtWb3Vz
IG5lIHJlY2V2ZXogcGFzIHNvdXZlbnQgZGUgY291cnJpZXJzIGRlIGNoZW5saWZ1QGh1YXdlaS5j
b20uIA0KPiBEw6ljb3V2cmV6IHBvdXJxdW9pIGNlY2kgZXN0IGltcG9ydGFudCDDoCANCj4gaHR0
cHM6Ly9ha2EubXMvTGVhcm5BYm91dFNlbmRlcklkZW50aWZpY2F0aW9uIF0NCj4gDQo+IOWcqCAy
MDIyLzgvMTkgMjE6MDYsIENoZW4gTGlmdSDlhpnpgZM6DQo+PiAxLiBwcGNfb3ZlcnJpZGVfbDJj
ciBhbmQgcHBjX292ZXJyaWRlX2wyY3JfdmFsdWUgYXJlIG9ubHkgdXNlZCBpbg0KPj4gwqDCoMKg
IGwyY3JfaW5pdCgpIGZ1bmN0aW9uLCByZW1vdmUgdGhlbSBhbmQgdXNlZCAqbDJjciBkaXJlY3Rs
eS4NCj4+IDIuIGhhc19sMmNhY2hlIGlzIG5vdCB1c2VkIG91dHNpZGUgb2YgdGhlIGZpbGUsIHNv
IG1hcmsgaXQgc3RhdGljIGFuZA0KPj4gwqDCoMKgIGRvIG5vdCBpbml0aWFsaXNlIHN0YXRpY3Mg
dG8gMC4NCj4+DQo+PiBGaXhlcyB0aGUgZm9sbG93aW5nIHdhcm5pbmc6DQo+Pg0KPj4gYXJjaC9w
b3dlcnBjL3BsYXRmb3Jtcy9wb3dlcm1hYy9zZXR1cC5jOjc0OjU6IHdhcm5pbmc6IHN5bWJvbCAN
Cj4+ICdwcGNfb3ZlcnJpZGVfbDJjcicgd2FzIG5vdCBkZWNsYXJlZC4gU2hvdWxkIGl0IGJlIHN0
YXRpYz8NCj4+IGFyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvcG93ZXJtYWMvc2V0dXAuYzo3NTo1OiB3
YXJuaW5nOiBzeW1ib2wgDQo+PiAncHBjX292ZXJyaWRlX2wyY3JfdmFsdWUnIHdhcyBub3QgZGVj
bGFyZWQuIFNob3VsZCBpdCBiZSBzdGF0aWM/DQo+PiBhcmNoL3Bvd2VycGMvcGxhdGZvcm1zL3Bv
d2VybWFjL3NldHVwLmM6NzY6NTogd2FybmluZzogc3ltYm9sIA0KPj4gJ2hhc19sMmNhY2hlJyB3
YXMgbm90IGRlY2xhcmVkLiBTaG91bGQgaXQgYmUgc3RhdGljPw0KPj4NCj4+IFNpZ25lZC1vZmYt
Ynk6IENoZW4gTGlmdSA8Y2hlbmxpZnVAaHVhd2VpLmNvbT4NCg0KWW91IGNvdWxkIGhhdmUgcmVw
bGFjZWQgcHJpbnRrKEtFUk5fSU5GTyBieSBwcl9pbmZvKA0KDQpPdGhlcndpc2UNCg0KUmV2aWV3
ZWQtYnk6IENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4NCg0K
Pj4gLS0tDQo+PiDCoCBhcmNoL3Bvd2VycGMvcGxhdGZvcm1zL3Bvd2VybWFjL3NldHVwLmMgfCAx
OSArKysrKystLS0tLS0tLS0tLS0tDQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25z
KCspLCAxMyBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL3Bs
YXRmb3Jtcy9wb3dlcm1hYy9zZXR1cC5jIA0KPj4gYi9hcmNoL3Bvd2VycGMvcGxhdGZvcm1zL3Bv
d2VybWFjL3NldHVwLmMNCj4+IGluZGV4IDA0ZGFhN2YwYTAzYy4uNDlmYWEwNjZiMzcyIDEwMDY0
NA0KPj4gLS0tIGEvYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy9wb3dlcm1hYy9zZXR1cC5jDQo+PiAr
KysgYi9hcmNoL3Bvd2VycGMvcGxhdGZvcm1zL3Bvd2VybWFjL3NldHVwLmMNCj4+IEBAIC02OCwx
MyArNjgsMTEgQEANCj4+DQo+PiDCoCAjaW5jbHVkZSAicG1hYy5oIg0KPj4NCj4+IMKgICN1bmRl
ZiBTSE9XX0dBVFdJQ0tfSVJRUw0KPj4NCj4+IC1pbnQgcHBjX292ZXJyaWRlX2wyY3IgPSAwOw0K
Pj4gLWludCBwcGNfb3ZlcnJpZGVfbDJjcl92YWx1ZTsNCj4+IC1pbnQgaGFzX2wyY2FjaGUgPSAw
Ow0KPj4gK3N0YXRpYyBpbnQgaGFzX2wyY2FjaGU7DQo+Pg0KPj4gwqAgaW50IHBtYWNfbmV3d29y
bGQ7DQo+Pg0KPj4gwqAgc3RhdGljIGludCBjdXJyZW50X3Jvb3RfZ29vZG5lc3MgPSAtMTsNCj4+
DQo+PiBAQCAtMjM0LDI2ICsyMzIsMjEgQEAgc3RhdGljIHZvaWQgX19pbml0IGwyY3JfaW5pdCh2
b2lkKQ0KPj4NCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZvcl9lYWNoX29mX2NwdV9u
b2RlKG5wKSB7DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
Y29uc3QgdW5zaWduZWQgaW50ICpsMmNyID0NCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgb2ZfZ2V0X3Byb3BlcnR5KG5wLCAibDJj
ci12YWx1ZSIsIE5VTEwpOw0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGlmIChsMmNyKSB7DQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcHBjX292ZXJyaWRlX2wyY3IgPSAxOw0KPj4gLcKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBwY19v
dmVycmlkZV9sMmNyX3ZhbHVlID0gKmwyY3I7DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIF9zZXRfTDJDUigwKTsNCj4+IC3CoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBfc2V0
X0wyQ1IocHBjX292ZXJyaWRlX2wyY3JfdmFsdWUpOw0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIF9zZXRfTDJDUigqbDJjcik7DQo+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgcHJpbnRrKEtFUk5fSU5GTyAiTDJDUiBvdmVycmlkZGVuICgweCV4KSwgIg0KPj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgImJhY2tzaWRlIGNhY2hlIGlzICVzXG4iLA0KPj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKmwy
Y3IsICgoKmwyY3IpICYgMHg4MDAwMDAwMCkgPw0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgImVuYWJsZWQi
IDogImRpc2FibGVkIik7DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgfQ0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG9m
X25vZGVfcHV0KG5wKTsNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBicmVhazsNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0NCj4+IMKgwqDCoMKg
wqAgfQ0KPj4gLQ0KPj4gLcKgwqDCoMKgIGlmIChwcGNfb3ZlcnJpZGVfbDJjcikNCj4+IC3CoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgcHJpbnRrKEtFUk5fSU5GTyAiTDJDUiBvdmVycmlkZGVuICgw
eCV4KSwgIg0KPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJiYWNr
c2lkZSBjYWNoZSBpcyAlc1xuIiwNCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBwcGNfb3ZlcnJpZGVfbDJjcl92YWx1ZSwNCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCAocHBjX292ZXJyaWRlX2wyY3JfdmFsdWUgJiAweDgwMDAwMDAw
KQ0KPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgID8gImVuYWJsZWQiIDogImRpc2FibGVkIik7DQo+PiDCoCB9DQo+PiDCoCAjZW5kaWYN
Cj4+DQo+PiDCoCBzdGF0aWMgdm9pZCBfX2luaXQgcG1hY19zZXR1cF9hcmNoKHZvaWQpDQo+PiDC
oCB7DQo+IA0KPiBGcmllbmRseSBwaW5nIC4uLg0KPiA=
