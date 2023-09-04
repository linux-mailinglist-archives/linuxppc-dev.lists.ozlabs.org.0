Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A15791BDE
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Sep 2023 19:05:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=WnpCqQMo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RfZlm2l87z3cGv
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Sep 2023 03:05:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=WnpCqQMo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::62d; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on2062d.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::62d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RfZkq71bgz2yq0
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Sep 2023 03:05:07 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Meix9BgHiB7iaj02aytm+soiYIl0dFWuXDz8vC9rsqn1UEBjNqxT4V0u5+DOUIzeybbkE3YblfT6Sj/5rF4egif/IX1ghLfMaVfEnPMQJEAm5y5zEVG6mVE/zy0CXwR8PsoPh9VwD39CJ2BsT0+tCeT/NujvilrCSdyvm4B2WoDRQYFY0CnboHSnqazg0TuxQfLw6sSp3hFC+TxMLarT7KQxnCsURBl+v4cTWVW5uD7c/kuzEZw/kkGuI1zye6MP7wNcKKoQeoVBT3dTeXXFkiuGO3LAr6c8Q5O3E+MeetRtUnTneWPDw9n03p9/kDcFWe24HetST993M0YfM0PPjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kva6QY6ub6mMyTxVZNxCAy2jzw0dHBLLMk42z1Q14Pc=;
 b=jFiqQxZl7Q9BoJI0qBdNrZH6M5eD2wuJcCQo88ZBm4fcLlyVvrctFzFQIs9LLIhyyC29vAqCZYKKAjfHEnyNwOfiNqQEVBaVHQosNce64EcUQH4ngHZsdAmnLWXdowI210nGcXgdsa1WRkHeuXWyp0h/9OFnBtGboreaRBlY3LEfTdDSBhH1173L6f+jj7y0CBVTGwl9vtDZ6553jp8tonkAsyC9WgucgBSIiKJftcUkji29hzJruCbzEDwo24ih4vDL7wbMd6KWPUtLJIGO3JkVxDaDg/xrvFjINlZjvKK0+YCipk0nXv2mQSk5RSCwyue8pMAyijyWizpXTCxpXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kva6QY6ub6mMyTxVZNxCAy2jzw0dHBLLMk42z1Q14Pc=;
 b=WnpCqQMoIm8xwQ+kjWcaBmUQuVpiDwBKF0vfO7QI/fXgMsIawg5DkUwJpUh5yEQY3yR5zhfsi2yiq+4G5gaMljJTEySe8t0ccg9bxOfR/jitm1M6PryOXZd+N7DBXaIlGq7R8mvUC4Q0/7jAg+9N01Ge6GxcCiyNta/ZP6733wrcXbOlNrEthelKtQEa0bAXFJRH2lTR0K+RkyOk03AusvpT5zk15ewl0qZYYw8VBxbyb2bbAYdbeT5jkhS7WWtVOAdZ31noU7A6MIeIuClS4u8KrYM8GchsLgMJasZf+3kdKf94gZPUnKFkIa2xNK6kezmqN27SJR9CFNH+0P3itQ==
Received: from MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3d::7) by
 PR1P264MB1853.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1b3::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6745.32; Mon, 4 Sep 2023 17:04:49 +0000
Received: from MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9b89:47b8:ed16:5962]) by MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9b89:47b8:ed16:5962%2]) with mapi id 15.20.6745.030; Mon, 4 Sep 2023
 17:04:49 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Alexandra Diupina <adiupina@astralinux.ru>, Zhao Qiang
	<qiang.zhao@nxp.com>
Subject: Re: [PATCH v4] drivers/net: process the result of hdlc_open() and add
 call of hdlc_close() in uhdlc_close()
Thread-Topic: [PATCH v4] drivers/net: process the result of hdlc_open() and
 add call of hdlc_close() in uhdlc_close()
Thread-Index: AQHZ3yvYAaNB4gr4F0i/7Owg8NCYGrAK5RgAgAAAYgA=
Date: Mon, 4 Sep 2023 17:04:49 +0000
Message-ID: <83bc012b-4514-fac0-3b72-651c76ed2165@csgroup.eu>
References: <20230904123130.14099-1-adiupina@astralinux.ru>
 <1005f190-8c03-bb5d-214c-c7fca9dd876b@csgroup.eu>
In-Reply-To: <1005f190-8c03-bb5d-214c-c7fca9dd876b@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MR1P264MB2980:EE_|PR1P264MB1853:EE_
x-ms-office365-filtering-correlation-id: 352713ea-8892-4080-7144-08dbad690c30
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  GS91enceH7oYPF3Rdn0iOvz6Z9Fk6OR6N+GS77y/2KRf1QXez3R6G1SMhNjRX589SbkcZ93VvBP4tgEjQyK7eeUm32LYbAK+8HIZkQrXqZvAsmbkQ0nLsW7tupftbWNyIMki4mmaeK3C6JDL6cfBJqXd6tA5nwpBqIXnZIKMnFv6/cE5WivGa7n/bs9d67WXNhL+i/4de3db8LbRftF7DB0qn1ZGZkyJQE0xd6xdrVB7cRRgoV9vU6hyssGO9xvdL60l6AH7jdjOVq4VvnXte+9pxFUuLKOtLceGTZFvlLzQTkiQK7gE3OH0VcD8kOfeDN7XgCIaQIPkG/lxbEbTfljRIkOjnL6gYRquzPSkkPUmgvPtuik/C01gRWxe5Uo+ZmKMl4qUQuU+xRaqnSChqdWNWzBkis6RgI+NJxoTmBvAB2ivtRkFUR/iIG4erUmGayaqz2hzFNWHuVBrT0UoVYTdwwK1AVEZ4brxfbSlKHu9x4dDMLngy3enSeEDbvWHC+3N/Z4szXu5zLiRrC7tS1/9JWFkZKiy2oveVzAC2HnkWM8d1CO8PKGlkxN2mA5qqnLg8PtMvO6IUjkmCob1pumgm8m8v9rkmN6i78jMBtRDFD/0OuQga9D32awPD3hbpZS/6EyWg6wDlhThEhtfAU9bTwnTz44i86hAOreBZhJL3kJxyrSTDkfBdx2+JOck
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(366004)(136003)(376002)(396003)(346002)(186009)(1800799009)(451199024)(6486002)(6506007)(41300700001)(7416002)(122000001)(2906002)(36756003)(91956017)(38100700002)(6512007)(316002)(38070700005)(31696002)(110136005)(66446008)(66476007)(64756008)(478600001)(54906003)(76116006)(66946007)(66556008)(86362001)(71200400001)(4326008)(8936002)(66574015)(8676002)(44832011)(26005)(31686004)(2616005)(83380400001)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?SmNGd2J6UkRMNUpYUi8rckc0MkkwalNIaXp1MmRadnNtb2lFR1ZTNkpmcUdO?=
 =?utf-8?B?aEcveWtZVzFKRFR1aXVQMkpjbjVrbjgvS1I4Y25aaXZ5OWU2MndKMnpoZ2xO?=
 =?utf-8?B?ak1OMld6aW1GWmZlcUNZQTNUdGVLdFpncUpmVk9BNzVuSGpHd0xLSmpqZ0ZI?=
 =?utf-8?B?eklHdmNxbVRTOXJsbldyNnVKNkNLcVBVQ1JZdk5oZ0RvUWMzSm1mRGR4MDhY?=
 =?utf-8?B?Q0NnZTJuYmFwM2JCK2cvdEd1TW05c2J2SE44NHFNR1NZSFBFNndJUEZadGxx?=
 =?utf-8?B?OEs3MytzTzd0WjlBT0g4NnFCYlg3M3pZWlFDUlhmZnB0aUo5S20xY0s5Ly9X?=
 =?utf-8?B?dG12OTVFQ3RtRkttdzN3eUZwRDJhMnBYRWhNcDdQQTcvQkh1ZG5zZXpKMGFi?=
 =?utf-8?B?WTVqY1dxazJESDA0dnphT2V0KzFQZS9DODA5V0V3aldMdkl2SWdNRExKMVJL?=
 =?utf-8?B?OUp1ckpKOWdKeUl1bDNKSVhyYm13Q2tBK3RGb3lNdk44Z1JoMGYwUzh4VFFQ?=
 =?utf-8?B?MG5PODlCVWl5Szc0ZjU2aEJ2WTJVVXROZjAvZmMzRERwM1dMT0VuaTRBbEky?=
 =?utf-8?B?LzJmTGQzWFFjbTFDQnZUeGVnWXQ4WTgwZ0VpV1dUaXUxa0FlRjFDNytHdWFo?=
 =?utf-8?B?YytabWowajYvSjJiRitRbEdoYVpxUkpSYzNNTG1hQTRuVUcrRXFRZFp3N2Yz?=
 =?utf-8?B?YU00ZU1NcDl2dVhIWUZiNk5mWUhERkplVCtoL3ZNdmFocnFhQWc4cEkrWVpy?=
 =?utf-8?B?b2R2MnpHMTIvcFVjRmV1eWZXVERaRDBYYTFYME9CaTUxT0Y4Z3FJcWplM2s3?=
 =?utf-8?B?NCtFZjdtS1JiRHdBY2wzWDBCdEtYVktUUERtR20zTDlOL2phbDJaamVuUko2?=
 =?utf-8?B?VFBUMUdWbjNDQjRUTndTd21SZlNQemk1d1lvZGRwc2MrUURnUVZKTjJxUlpH?=
 =?utf-8?B?VUN3cnBOZXJWd0dvMTFvL1FuRkMxb01ObjJSZWxQQy8rTWhOVE1xd0I2TXpB?=
 =?utf-8?B?c2JqUEU1U01BZTAwTGVsV1hZcllWTVNYd2tTcnA1Q0ZmTzFQQi9QQkZvWE0w?=
 =?utf-8?B?Y1AzQWlIS3dZNXN6bE1KZFNtaFRQdmVTaE1JVWVGNVdKaU5vZFJLdXFreEdG?=
 =?utf-8?B?Zm5nTnRnU3ExWlJqamQrSllqblBpY1U1M2U5ZGNNV3hZU2FmQTEyTEY4WmVt?=
 =?utf-8?B?VFZVNlpZK0pHeGtmdHQ4T25sOWZhQ0FBNVkySFlIR0ovMThlRFJvRVpIa0ZX?=
 =?utf-8?B?bEpSQmM5S2JVbEJ1TlZNV0YyMkdJOERwait1TnQySjZEZVk4RGdFc3l0dWJr?=
 =?utf-8?B?bmgxUFMveUt1NkRJcFAzcW9EZWRQbnBqRWZFek5OMjhDRThFVEIrNTNHbFJK?=
 =?utf-8?B?SmdhazcwOXhxb0wxUHVPUXZTUGxYbnRGUWFaWC96anhXV0dFNWh1MkR1a3J1?=
 =?utf-8?B?bGZTVHdEaTFibmFWWXBKUmhLYm5UMy9kMkJaWERVdU1vV3NQQkxjSEU3ek52?=
 =?utf-8?B?TzdlL3JrZ2cxRzVVQ01YSG1jWW5ZZ2R4ODg0ZXFWWTBaOWM2V0JvZi9EUnlW?=
 =?utf-8?B?OG5KQWx3cEZzdVkxUEJmQktEVXh4bjBrMVA4QTNhNFdWUFBTdFJ1MkpVZ3F4?=
 =?utf-8?B?ZEY2TXNHNVAwYVdvVnVCWUZzeUgrdExPK0VPdWpFVGt2bGxSUERtVEwvcVBM?=
 =?utf-8?B?MHZZbFcvTDN4bkxTa2ZwRlYyd3YrVlRtbWdNMk5XWU1qcDVOdXU4RktDMSsr?=
 =?utf-8?B?cGtoRWJYZFdQc3hMVjVYRU8yYlhPVUVMM3NKeG5XR0tYK1NQT28zRmRwVTNq?=
 =?utf-8?B?MnVDMHhqWW45cGdZOXJIVHl4ckRqK3o2OFpmaTk4NzNyL2pNTk54S1FJbW1D?=
 =?utf-8?B?cU1ldmdvZ2tQTDNEYU4yTUhuWHRMVzNzNTZKOWhpQU5PRjFnUFljWnpqcUxa?=
 =?utf-8?B?Zm82TTNBWCtEaVhVeDgxalFlaWQ4QUs5d1RjbUhUODlKbFFEN0JFUE5DNFRu?=
 =?utf-8?B?VnI5YXpadVZWSGhJdlV3cHpjODk3cXRXdnFjWTFhRzFwRERWSS91U2hEVkxR?=
 =?utf-8?B?RG5FZkpoNEdMcjdwYnAwVEhaRVI1TFNMS1lsbHJQeStRUk85NFlZeGZIU0ZC?=
 =?utf-8?Q?jjXPJ/pTCTmrV3NhGfr2rRaIj?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4450B997B8D9944AB7DB37D3B03EE7AC@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 352713ea-8892-4080-7144-08dbad690c30
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2023 17:04:49.0374
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CpN30xGniaV2dEvxAWw8MWCZcRd/HvWGSYqTDacy4Jt6oMaQ8/ldz5+sDkXkvNrLDSFpMETS8oW82TrJgxIq/a/CHHxB3VaaUzmPhyNX/v8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB1853
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

DQoNCkxlIDA0LzA5LzIwMjMgw6AgMTk6MDMsIENocmlzdG9waGUgTGVyb3kgYSDDqWNyaXTCoDoN
Cj4gDQo+IA0KPiBMZSAwNC8wOS8yMDIzIMOgIDE0OjMxLCBBbGV4YW5kcmEgRGl1cGluYSBhIMOp
Y3JpdMKgOg0KPj4gUHJvY2VzcyB0aGUgcmVzdWx0IG9mIGhkbGNfb3BlbigpIGFuZCBjYWxsIHVo
ZGxjX2Nsb3NlKCkNCj4+IGluIGNhc2Ugb2YgYW4gZXJyb3IuIEl0IGlzIG5lY2Vzc2FyeSB0byBw
YXNzIHRoZSBlcnJvcg0KPj4gY29kZSB1cCB0aGUgY29udHJvbCBmbG93LCBzaW1pbGFyIHRvIGEg
cG9zc2libGUNCj4+IGVycm9yIGluIHJlcXVlc3RfaXJxKCkuDQo+PiBBbHNvIGFkZCBhIGhkbGNf
Y2xvc2UoKSBjYWxsIHRvIHRoZSB1aGRsY19jbG9zZSgpDQo+PiBiZWNhdXNlIHRoZSBjb21tZW50
IHRvIGhkbGNfY2xvc2UoKSBzYXlzIGl0IG11c3QgYmUgY2FsbGVkDQo+PiBieSB0aGUgaGFyZHdh
cmUgZHJpdmVyIHdoZW4gdGhlIEhETEMgZGV2aWNlIGlzIGJlaW5nIGNsb3NlZA0KPj4NCj4+IEZv
dW5kIGJ5IExpbnV4IFZlcmlmaWNhdGlvbiBDZW50ZXIgKGxpbnV4dGVzdGluZy5vcmcpIHdpdGgg
U1ZBQ0UuDQo+Pg0KPj4gRml4ZXM6IGMxOWI2ZDI0NmEzNSAoImRyaXZlcnMvbmV0OiBzdXBwb3J0
IGhkbGMgZnVuY3Rpb24gZm9yIFFFLVVDQyIpDQo+PiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kcmEg
RGl1cGluYSA8YWRpdXBpbmFAYXN0cmFsaW51eC5ydT4NCj4+IC0tLQ0KPj4gdjQ6IHVuZG8gYWxs
IHRoZSB0aGluZ3MgZG9uZSBwcmlvciB0byBoZGxjX29wZW4oKSBhcw0KPj4gSmFrdWIgS2ljaW5z
a2kgPGt1YmFAa2VybmVsLm9yZz4gc3VnZ2VzdGVkLA0KPj4gYWRkIGhkbGNfY2xvc2UoKSBjYWxs
IHRvIHRoZSB1aGRsY19jbG9zZSgpIHRvIG1hdGNoIHRoZSBmdW5jdGlvbiBjb21tZW50LA0KPj4g
YWRkIHVoZGxjX2Nsb3NlKCkgZGVjbGFyYXRpb24gdG8gdGhlIHRvcCBvZiB0aGUgZmlsZSBub3Qg
dG8gcHV0IHRoZQ0KPj4gdWhkbGNfY2xvc2UoKSBmdW5jdGlvbiBkZWZpbml0aW9uIGJlZm9yZSB1
aGRsY19vcGVuKCkNCj4+IHYzOiBGaXggdGhlIGNvbW1pdHMgdHJlZQ0KPj4gdjI6IFJlbW92ZSB0
aGUgJ3JjJyB2YXJpYWJsZSAoc3RvcmVzIHRoZSByZXR1cm4gdmFsdWUgb2YgdGhlDQo+PiBoZGxj
X29wZW4oKSkgYXMgQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1
PiBzdWdnZXN0ZWQNCj4+IMKgIGRyaXZlcnMvbmV0L3dhbi9mc2xfdWNjX2hkbGMuYyB8IDggKysr
KysrKy0NCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvd2FuL2ZzbF91Y2NfaGRsYy5jIA0K
Pj4gYi9kcml2ZXJzL25ldC93YW4vZnNsX3VjY19oZGxjLmMNCj4+IGluZGV4IDQ3YzJhZDdhM2U0
Mi4uZmQ5OTlkYWJkZDM5IDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9uZXQvd2FuL2ZzbF91Y2Nf
aGRsYy5jDQo+PiArKysgYi9kcml2ZXJzL25ldC93YW4vZnNsX3VjY19oZGxjLmMNCj4+IEBAIC0z
NCw2ICszNCw4IEBADQo+PiDCoCAjZGVmaW5lIFRETV9QUFBPSFRfU0xJQ19NQVhJTg0KPj4gwqAg
I2RlZmluZSBSWF9CRF9FUlJPUlMgKFJfQ0RfUyB8IFJfT1ZfUyB8IFJfQ1JfUyB8IFJfQUJfUyB8
IFJfTk9fUyB8IA0KPj4gUl9MR19TKQ0KPj4gK3N0YXRpYyBpbnQgdWhkbGNfY2xvc2Uoc3RydWN0
IG5ldF9kZXZpY2UgKmRldik7DQo+PiArDQo+PiDCoCBzdGF0aWMgc3RydWN0IHVjY190ZG1faW5m
byB1dGRtX3ByaW1hcnlfaW5mbyA9IHsNCj4+IMKgwqDCoMKgwqAgLnVmX2luZm8gPSB7DQo+PiDC
oMKgwqDCoMKgwqDCoMKgwqAgLnRzYSA9IDAsDQo+PiBAQCAtNzMxLDcgKzczMyw5IEBAIHN0YXRp
YyBpbnQgdWhkbGNfb3BlbihzdHJ1Y3QgbmV0X2RldmljZSAqZGV2KQ0KPj4gwqDCoMKgwqDCoMKg
wqDCoMKgIG5hcGlfZW5hYmxlKCZwcml2LT5uYXBpKTsNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBu
ZXRkZXZfcmVzZXRfcXVldWUoZGV2KTsNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBuZXRpZl9zdGFy
dF9xdWV1ZShkZXYpOw0KPj4gLcKgwqDCoMKgwqDCoMKgIGhkbGNfb3BlbihkZXYpOw0KPj4gKw0K
Pj4gK8KgwqDCoMKgwqDCoMKgIGludCByYyA9IGhkbGNfb3BlbihkZXYpOw0KPiANCj4gRG8gbm90
IG1peCBkZWNsYXJhdGlvbnMgYW5kIGNvZGUuIFBsZWFzZSBwdXQgYWxsIGRlY2xhcmF0aW9uIGF0
IHRoZSB0b3AgDQo+IG9mIHRoZSBibG9jay4NCj4gDQo+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJu
IHJjID09IDAgPyAwIDogKHVoZGxjX2Nsb3NlKGRldiksIHJjKTsNCj4+IMKgwqDCoMKgwqAgfQ0K
PiANCj4gVGhhdCdzIG5vdCBlYXN5IHRvIHJlYWQuDQo+IA0KPiBJIGtub3cgdGhhdCdzIG1vcmUg
Y2hhbmdlcywgYnV0IEknZCBwcmVmZXIgc29tZXRoaW5nIGxpa2U6DQo+IA0KPiBzdGF0aWMgaW50
IHVoZGxjX29wZW4oc3RydWN0IG5ldF9kZXZpY2UgKmRldikNCj4gew0KPiAgwqDCoMKgwqB1MzIg
Y2Vjcl9zdWJibG9jazsNCj4gIMKgwqDCoMKgaGRsY19kZXZpY2UgKmhkbGMgPSBkZXZfdG9faGRs
YyhkZXYpOw0KPiAgwqDCoMKgwqBzdHJ1Y3QgdWNjX2hkbGNfcHJpdmF0ZSAqcHJpdiA9IGhkbGMt
PnByaXY7DQo+ICDCoMKgwqDCoHN0cnVjdCB1Y2NfdGRtICp1dGRtID0gcHJpdi0+dXRkbTsNCj4g
IMKgwqDCoMKgaW50IHJjOw0KPiANCj4gIMKgwqDCoMKgaWYgKHByaXYtPmhkbGNfYnVzeSAhPSAx
KQ0KDQpPZiBjb3Vyc2Ugc2hvdWxkIGJlOg0KDQoJaWYgKHByaXYtPmhkbGNfYnVzeSA9PSAxKQ0K
DQo+ICDCoMKgwqDCoMKgwqDCoCByZXR1cm4gMDsNCj4gDQo+ICDCoMKgwqDCoGlmIChyZXF1ZXN0
X2lycShwcml2LT51dF9pbmZvLT51Zl9pbmZvLmlycSwNCj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgdWNjX2hkbGNfaXJxX2hhbmRsZXIsIDAsICJoZGxjIiwgcHJpdikpDQo+ICDCoMKgwqDCoMKg
wqDCoCByZXR1cm4gLUVOT0RFVjsNCj4gDQo+ICDCoMKgwqDCoGNlY3Jfc3ViYmxvY2sgPSB1Y2Nf
ZmFzdF9nZXRfcWVfY3Jfc3ViYmxvY2soDQo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgcHJpdi0+dXRfaW5mby0+dWZfaW5mby51Y2NfbnVtKTsNCj4gDQo+ICDCoMKgwqDCoHFlX2lz
c3VlX2NtZChRRV9JTklUX1RYX1JYLCBjZWNyX3N1YmJsb2NrLA0KPiAgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIFFFX0NSX1BST1RPQ09MX1VOU1BFQ0lGSUVELCAwKTsNCj4gDQo+ICDCoMKgwqDC
oHVjY19mYXN0X2VuYWJsZShwcml2LT51Y2NmLCBDT01NX0RJUl9SWCB8IENPTU1fRElSX1RYKTsN
Cj4gDQo+ICDCoMKgwqDCoC8qIEVuYWJsZSB0aGUgVERNIHBvcnQgKi8NCj4gIMKgwqDCoMKgaWYg
KHByaXYtPnRzYSkNCj4gIMKgwqDCoMKgwqDCoMKgIHFlX3NldGJpdHNfOCgmdXRkbS0+c2lfcmVn
cy0+c2lnbG1yMV9oLCAweDEgPDwgdXRkbS0+dGRtX3BvcnQpOw0KPiANCj4gIMKgwqDCoMKgcHJp
di0+aGRsY19idXN5ID0gMTsNCj4gIMKgwqDCoMKgbmV0aWZfZGV2aWNlX2F0dGFjaChwcml2LT5u
ZGV2KTsNCj4gIMKgwqDCoMKgbmFwaV9lbmFibGUoJnByaXYtPm5hcGkpOw0KPiAgwqDCoMKgwqBu
ZXRkZXZfcmVzZXRfcXVldWUoZGV2KTsNCj4gIMKgwqDCoMKgbmV0aWZfc3RhcnRfcXVldWUoZGV2
KTsNCj4gDQo+ICDCoMKgwqDCoHJjID0gaGRsY19vcGVuKGRldik7DQo+ICDCoMKgwqDCoGlmIChy
YykNCj4gIMKgwqDCoMKgwqDCoMKgIHVoZGxjX2Nsb3NlKGRldik7DQo+IA0KPiAgwqDCoMKgwqBy
ZXR1cm4gcmM7DQo+IH0NCj4gDQo+IA0KPiANCj4+IMKgwqDCoMKgwqAgcmV0dXJuIDA7DQo+PiBA
QCAtODI0LDYgKzgyOCw4IEBAIHN0YXRpYyBpbnQgdWhkbGNfY2xvc2Uoc3RydWN0IG5ldF9kZXZp
Y2UgKmRldikNCj4+IMKgwqDCoMKgwqAgbmV0ZGV2X3Jlc2V0X3F1ZXVlKGRldik7DQo+PiDCoMKg
wqDCoMKgIHByaXYtPmhkbGNfYnVzeSA9IDA7DQo+PiArwqDCoMKgIGhkbGNfY2xvc2UoZGV2KTsN
Cj4+ICsNCj4+IMKgwqDCoMKgwqAgcmV0dXJuIDA7DQo+PiDCoCB9DQo+IA0KPiANCj4gQW5kIHdo
aWxlIHlvdSBhcmUgbG9va2luZyBhdCB0aGUgY29ycmVjdG5lc3Mgb2YgdGhpcyBjb2RlLCBpcyBp
dCBzdXJlIA0KPiB0aGF0IHVoZGxjX29wZW4oKSBjYW5ub3QgYmUgY2FsbGVkIHR3aWNlIGluIHBh
cmFsbGVsZSA/DQo+IElmIGl0IGNhbiBiZSBjYWxsZWQgaW4gcGFyYWxsw6hsZSBJIHRoaW5rIHRo
ZSAiaWYgKHByaXYtPmhkbGNfYnVzeSAhPSAxKSIgDQo+IHNob3VsZCBiZSByZXBsYWNlZCBieSBz
b21ldGhpbmcgdXNpbmcgY21weGNoZygpDQo=
