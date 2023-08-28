Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B032578B164
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Aug 2023 15:12:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=bB3dW8cf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RZ9vR4bhxz3c1Y
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Aug 2023 23:12:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=bB3dW8cf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::611; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20611.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::611])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RZ9tZ5gvfz2yDM
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Aug 2023 23:11:33 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FT4sZzjRBvKGFXQA4kgyjAm+sJFkRMZDMK55Q2WubNandgsf+gx9gsfy1Sj2MLQpT6V2R2mUTVM0agOYZjox1hR2/c0wMc2vGgDZXWLT/SK3LPlJ6NHlsq14JRhtLkSBCZLc07Zj1+cFy/Rse9IYPHCaSGeVIKDFF88qbzj1kHUhicCtgIZBclxd+3AjsKwtMtLF6+R9bzmQTZvPNx0lDUS0/z7XdNhMgN99+HZ/Ruhmotnpngtgv4Hjr7ruGAWh6oM/85qm85EkTyfkxyEOA10Zhxtrr644lwE9/wCtqMWQckYx2X8P5dq15frpdVsnGaEcaNiEPiUwKln/ZLCg0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2VGxcsPpia5NjVBwPr+CCpayVMaOyie4qd0elD3Sl+M=;
 b=K8Xug6YUNcVmNao+9I0r2hzWkicDDRsTGe4ZukuU/pKet6/Efm9F1fg6Z6T4Kmf1RYEHQyFwIgXKF8iV12scRKJGjVjzlVZ403/dh0S4x8P4SfZMEiw77k9tsK+MzJRX2KS+TNLpboaXfdF1YajFZfvciR6ORXsY7HGTrX/aRN0EXElDAkKTDsMNw92dGyJFdWDKAN5ybkHpyVkGMRXyOOFtbs+5tghIgcHwWxXSo5+vOnI1mAT6NDj50uuCx1QzS8dzLU8uHmfHulYHgBeGsHxb4kwjLN+sSSe8HfeudOLVPMu20h6ZOHxoJS2q7v2OTAgl+C0UyGn/P6JOXjPcww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2VGxcsPpia5NjVBwPr+CCpayVMaOyie4qd0elD3Sl+M=;
 b=bB3dW8cfuOpnvL6b1ttIBOT9/zwyqryN7vUsiGtDFZVMJC3RUpk+golWRLQgF4nLdxGdopeWWRJKi8NW/BaQsC9xwYTq4V4dIXYHj2SUpJ5dbvPVtiRzGI4h5KmijKnQw64iDsTewGcIgZoli3PnBMnYH/tMgC15YFyzBl8lkwGwgD5msrakzfP8Px1l/D99vaeNNCPTF5xImMV3ZFu5+6g4LMIK+b6BwayCeDUT0ADdjqaxb8C8QNH5xj8G1uvD3TQqO92atryn4J9FXG46E+84GTn6u6zRBZoCPluzPzowwAPPKsXrbD7upiBD3KU+p6PKUKcJSbXmfVXVakQJrw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2285.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:15::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Mon, 28 Aug
 2023 13:11:09 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e%7]) with mapi id 15.20.6699.034; Mon, 28 Aug 2023
 13:11:09 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Alexandra Diupina <adiupina@astralinux.ru>, Zhao Qiang
	<qiang.zhao@nxp.com>
Subject: Re: [PATCH v3] fsl_ucc_hdlc: process the result of hold_open()
Thread-Topic: [PATCH v3] fsl_ucc_hdlc: process the result of hold_open()
Thread-Index: AQHZ2akfvQKTS9zpY02py7itxLD6u6//ruaA
Date: Mon, 28 Aug 2023 13:11:09 +0000
Message-ID: <50a3da63-37d3-1f44-657b-afeaf8c62741@csgroup.eu>
References: <20230828121235.13953-1-adiupina@astralinux.ru>
In-Reply-To: <20230828121235.13953-1-adiupina@astralinux.ru>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB2285:EE_
x-ms-office365-filtering-correlation-id: 3244e0aa-b7d1-4ca0-bb85-08dba7c83f23
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  kdq01H5PcPzIGqt/i7QAACkHFn/Cg1k0kY4b7S2lysVtjnwRLVi5PioEqI+A0FmmsaAI/chiprGJ5Af8WB9iKHsUKCSvepxvfryQdV1tJoV03Ok9mUvx76lLvevI8NXAYYIkyDMD0kyLxBwRSquM+Erqq36Lo+eHSPeBDJ7isTvixSsekVJ5pJ+fyX2U5rDm6SBWHXJ9EASVDd/XiPOoWtPmhy1lARrADdNIposUByOhB/LO2IL3g7/oLUKNd2owcdm0UoZZtWRt9OCGWGBC63QajU3+uC1OWCnNH4w1WfWrrMKxac9b8634IbgT+ikDNadZHv+7ko4EZGp3xlDw2VmKNX70POSKsIrNzO9IwfW9EDmcWmIZl7hsY1jvLP0I1+p9P4Ck9jD+YGOV6AxjkIeeYCFJCSVrjd74LP6E0JA2bvujfM2SBOG7y31ZKn9lJCzljhr/Bm6881ofY0culUWVATCRdsftS5c4y2AAO3qkad4g2RYOHiEAWXwWxVEg5z3Z7mG66h1wiF4Xsj2qrL4fgtAmUb0Jwb++AQH7nFFOsajS6TkRzA+NjZy1q4NWvjqAfzJgsDblQKK/ieUUwumyyCsJkBqABPMjB66yZdYqw2JwEzYWfdvBjbNwZOeDhYD6nfiaHhGO+XqZIfB0MIZOYbfglw6m7AXwv3LHMAcLrHX28ApR6AiklufPCZIk
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(136003)(376002)(39850400004)(396003)(186009)(1800799009)(451199024)(8676002)(5660300002)(71200400001)(6486002)(478600001)(966005)(83380400001)(2616005)(26005)(316002)(6512007)(7416002)(64756008)(66446008)(54906003)(41300700001)(66946007)(44832011)(8936002)(91956017)(76116006)(110136005)(66556008)(2906002)(66476007)(4326008)(6506007)(86362001)(36756003)(31696002)(66574015)(122000001)(38100700002)(38070700005)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?TGwxR1lMSmMvZ1h3ZDU0MUsxbVg3dVpUb085MGZpWEU1TVFsdW5YSDdOZFl5?=
 =?utf-8?B?V2xEeGVNV3A2ZTZtSzNNNDZ6bnRQVTltakpleThDQUE1dnZuQmMybnNKbzhp?=
 =?utf-8?B?MXB5OGQ2U1lqZUUxcXk4V3U1QVA5VnpoNjZVVUxUUXFDR0djbnNjcEhBblhw?=
 =?utf-8?B?TkMwa21kVFZkeDZWZzh3c1RDZmdMOXc5Zk4vbTlwb2JlQnBqaHRQdVdtQzdF?=
 =?utf-8?B?U1BtdDhTMEwxRUtnb1hnZldybTB4ZHZyMkZ6djlNUmpIQXlNdFQxdlN2cHl1?=
 =?utf-8?B?QU9BdFJNRHNoNjZJNDhDQzlqY21kTlExcFg2Y2dVZ2puU0Y2MnUvR2owd2sy?=
 =?utf-8?B?TDMxa3ZYZlV6eUl0WHJWZkVKMzNtZmJDejVsU0FuaGUvZEdwUlpyUXBkOC9x?=
 =?utf-8?B?cmpxWFdqbGNFL0ZJWmVLU2NWeGU4RE83NEI0YXBwU2ZNUkx1RDQxVlRITUh2?=
 =?utf-8?B?bFBtOEVjcFk5dVpRR29TSFNWT2dBQXZ5cDNpd3JGbUJZYUl2L2tQbjlsNnNM?=
 =?utf-8?B?NHc5WUdWUmlNTyt2YXRRWTNaSXk4SGtUOXpiY3ZlSEZhOFZTWjJETVR6bVpv?=
 =?utf-8?B?RHUrYVEzenhVRk5PNlhpRkdUUERyM2NNOEtTL01wS3hQclNBcDNZdXlVZmt3?=
 =?utf-8?B?VXMrUEs3bjU5bE9IU3pTYS9ibG1JRUQrQkhuWnUrZjNIYmhtamdIcDQ5ZHlV?=
 =?utf-8?B?NVhmbkZsSTR2ZW5oTmZqK05abDcyL2JabDk5T1N1YW1KaElIZzhaQm0wUENV?=
 =?utf-8?B?OTJ1czl0Um5LZThaTVltM1Z5ZFZPaUwzSEQ2dW9UOVlTOWV6c0lKRUFIcnpu?=
 =?utf-8?B?Y1RwMERLaG0wTUEyR2J1TWhCWVMraUlzQlRXL3ZyeFIrMFpNL1VEbXNTUDRx?=
 =?utf-8?B?cXl5L2ZtbEtBdHl0QzZzZHhRVktIY0dBZTBMTktBak9DT3ZhYlFKcEFWWHNB?=
 =?utf-8?B?eEN3L0xZbm1pZGZLeThSWFJ5cUR1UStsMG83aHhRMlR4dkdYSUFORnR0Ky80?=
 =?utf-8?B?ZUtJVXhHenJpOFpPbW50YkJOa09hZW5hVWpqTloydmcxU1MzUlFrZjlneVVz?=
 =?utf-8?B?b2Z5NVRFQWxxWXBrU2hTVVppV2dJREY4TUFBMGFaTVlqcjNxVHFQNUFJWXlG?=
 =?utf-8?B?OGhIS1FFK0lUSkUrRXBQaWZhU01mMUVlVEJPM0ZScVFpZmpxeGRuSDJVRmtm?=
 =?utf-8?B?cWg3T0FQUUxXanlYVFRwK1RXM0JJRmt3RWxFUllZaDZidFl5RE4zTFkvNVA0?=
 =?utf-8?B?WVZPNm56QkxweUNJV3lJelpYWVd3NnVjNFFOdUtiRDAxWC9MNjh4eG5KSFRz?=
 =?utf-8?B?UWdTbnJlQlNSQzg5cVNBTTFpRmZwQUVlNVdVUFlJdU5mVUkydklhWlJ6R1Zn?=
 =?utf-8?B?cHRaVGIzSURQVHV2ZjhoNU1NQTl5d012UmNXQWtqVlFrN1BKVmgvYlpiNlhm?=
 =?utf-8?B?cWdacWMxUEJtb2EzNjFXSmhoblpuV3l5MkFHTjRubllYczFjVUdvdURjd013?=
 =?utf-8?B?b1hLanBLRDRtZVVObWFudnE0Tk1PNnBuWkJURlB6Q2g0MEUxZWpTQ2JxMkFz?=
 =?utf-8?B?R2FuMlRHMVhKQzlIV1RXQnd0Z2prNnJSVUxUTStvZnRXTmlYdnZ6MTVhaEti?=
 =?utf-8?B?NnBuMkpYVkowSUs0d3B5dDNvNzY0dnBDUWEwVUgzQm43ZWM0aGN1bGtoZno0?=
 =?utf-8?B?NjVqb3NHcGt1NHpscnVVNGIyTGJRYTY0QU5FYmJ0TENuaCtlY2VKZmFTUFlF?=
 =?utf-8?B?NUZRVHZrMWtkSXErNnNzcXZMaXhlTW1EUW1nUi9xRGpNaVVESDBxMGJRVkFz?=
 =?utf-8?B?TjI1NU1MallSRzMveTFnTExINUVWY1BMVlFWTE8vS1JlRFpmWmVUNXFGQXNU?=
 =?utf-8?B?R0lJdlFUSXYvNlVjenFQUHJjbXdIL2cwK0dqSG5WSFZXVHUwZU5LTndYMk9l?=
 =?utf-8?B?UW1GeE9rSDR3RGZpZHV6bjZjSWVQZk9sZzJZbGpnTSticXh2R2R6ZW5sejlG?=
 =?utf-8?B?L3RRWkErNXdlQVZUSFkrYlRZR3J1ZmQrRVJqcENrOGNGbGQxUStwbVNKRWlP?=
 =?utf-8?B?Nk5Ia2dHSWtqSmN6cXZKRlNpcTVVdmoyZjZlWHphWUNrUVZIeVpsdVZ6QUt4?=
 =?utf-8?B?R2FncGdGR2F3YnVvdGxTMVJDMUJ6ZkNCSWYxQVdxTVFiTkx3ekhjSFVURFpL?=
 =?utf-8?B?aFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <630EBED04E83644EA38F09068F04DE8A@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3244e0aa-b7d1-4ca0-bb85-08dba7c83f23
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2023 13:11:09.7130
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n7qbNLggCDCAT5EbiL2gdBLkOjNteJtPzDAYvQTn0dr7ve769S+oKe63R+Dh/lK+bZNddaTj41jjL8JKlFf5sYzCRPdH6gUIbtU7GbrpzFs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2285
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
Cc: "lvc-project@linuxtesting.org" <lvc-project@linuxtesting.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI4LzA4LzIwMjMgw6AgMTQ6MTIsIEFsZXhhbmRyYSBEaXVwaW5hIGEgw6ljcml0wqA6
DQo+IFtWb3VzIG5lIHJlY2V2ZXogcGFzIHNvdXZlbnQgZGUgY291cnJpZXJzIGRlIGFkaXVwaW5h
QGFzdHJhbGludXgucnUuIETDqWNvdXZyZXogcG91cnF1b2kgY2VjaSBlc3QgaW1wb3J0YW50IMOg
IGh0dHBzOi8vYWthLm1zL0xlYXJuQWJvdXRTZW5kZXJJZGVudGlmaWNhdGlvbiBdDQo+IA0KPiBQ
cm9jZXNzIHRoZSByZXN1bHQgb2YgaG9sZF9vcGVuKCkgYW5kIHJldHVybiBpdCBmcm9tDQo+IHVo
ZGxjX29wZW4oKSBpbiBjYXNlIG9mIGFuIGVycm9yDQo+IEl0IGlzIG5lY2Vzc2FyeSB0byBwYXNz
IHRoZSBlcnJvciBjb2RlIHVwIHRoZSBjb250cm9sIGZsb3csDQo+IHNpbWlsYXIgdG8gYSBwb3Nz
aWJsZSBlcnJvciBpbiByZXF1ZXN0X2lycSgpDQo+IA0KPiBGb3VuZCBieSBMaW51eCBWZXJpZmlj
YXRpb24gQ2VudGVyIChsaW51eHRlc3Rpbmcub3JnKSB3aXRoIFNWQUNFLg0KPiANCj4gRml4ZXM6
IGMxOWI2ZDI0NmEzNSAoImRyaXZlcnMvbmV0OiBzdXBwb3J0IGhkbGMgZnVuY3Rpb24gZm9yIFFF
LVVDQyIpDQo+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRyYSBEaXVwaW5hIDxhZGl1cGluYUBhc3Ry
YWxpbnV4LnJ1Pg0KDQpSZXZpZXdlZC1ieTogQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5s
ZXJveUBjc2dyb3VwLmV1Pg0KDQo+IC0tLQ0KPiB2MzogRml4IHRoZSBjb21taXRzIHRyZWUNCj4g
djI6IFJlbW92ZSB0aGUgJ3JjJyB2YXJpYWJsZSAoc3RvcmVzIHRoZSByZXR1cm4gdmFsdWUgb2Yg
dGhlDQo+IGhkbGNfb3BlbigpKSBhcyBDaHJpc3RvcGhlIExlcm95IDxjaHJpc3RvcGhlLmxlcm95
QGNzZ3JvdXAuZXU+IHN1Z2dlc3RlZA0KPiAgIGRyaXZlcnMvbmV0L3dhbi9mc2xfdWNjX2hkbGMu
YyB8IDIgKy0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC93YW4vZnNsX3VjY19oZGxjLmMgYi9k
cml2ZXJzL25ldC93YW4vZnNsX3VjY19oZGxjLmMNCj4gaW5kZXggNDdjMmFkN2EzZTQyLi40MTY0
YWJlYTc3MjUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvbmV0L3dhbi9mc2xfdWNjX2hkbGMuYw0K
PiArKysgYi9kcml2ZXJzL25ldC93YW4vZnNsX3VjY19oZGxjLmMNCj4gQEAgLTczMSw3ICs3MzEs
NyBAQCBzdGF0aWMgaW50IHVoZGxjX29wZW4oc3RydWN0IG5ldF9kZXZpY2UgKmRldikNCj4gICAg
ICAgICAgICAgICAgICBuYXBpX2VuYWJsZSgmcHJpdi0+bmFwaSk7DQo+ICAgICAgICAgICAgICAg
ICAgbmV0ZGV2X3Jlc2V0X3F1ZXVlKGRldik7DQo+ICAgICAgICAgICAgICAgICAgbmV0aWZfc3Rh
cnRfcXVldWUoZGV2KTsNCj4gLSAgICAgICAgICAgICAgIGhkbGNfb3BlbihkZXYpOw0KPiArICAg
ICAgICAgICAgICAgcmV0dXJuIGhkbGNfb3BlbihkZXYpOw0KPiAgICAgICAgICB9DQo+IA0KPiAg
ICAgICAgICByZXR1cm4gMDsNCj4gLS0NCj4gMi4zMC4yDQo+IA0K
