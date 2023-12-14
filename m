Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5196F812C7D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Dec 2023 11:07:28 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=BLqrxx+t;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SrShF6cWdz3w8N
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Dec 2023 21:07:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=BLqrxx+t;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::622; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20622.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::622])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SrSgN2pv2z2yVG
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Dec 2023 21:06:38 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j3SSVJo191XyERLgZc6FIDGs+O2U0zyqP1MoKTKlbpsfPQdg1cwQ1NNjd2uv2p8J9C5l9f2zqmBA1vElDR3bCau1GlQOcy9/kCdILWqzaUHD7AY/mCEwSCnXKsS12BKGN3R8Mqi3DGWtOcMEko3vbnDQoeXy15jmxfXs+t6Qs2k1wPtIHgzm6reSGdnElfTYGJ8so93nX+Avgh6XkT/IPSuwkDqAeh6HKnuk/yNcZv5vzmCc00U6ng8+107Bn+Sov3HOjOlk+bTHyJ6usSkH2DILzyQeWAXP/u0mICcLuDh0jVgwuZ+7i/7U0lLdNHXaYBJUN6KT6CzAFbQ/dYTIHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X0geG+idqdCbIRUqjpU/QuH6oRdBjNpbzz13EXG/z2s=;
 b=hPSW940VsSYcJ4RI8o6FXacF+EvV2I5Huhv7hK0Zxs9LhllfO96kbeJhFjr1Ns046nJWlKwb8pbpwclN98LeX3F/GJZWnpapwuYo+VhYGBVpkoLZIjYg/qNNeL7v6udq1o7w6MyQRyiU1lIyVDqCUGgpkKTYaVVvCeasOOMNLtWz+ij9p9LB2K9ej4r50vtznQfzb7uQ7e02aJjAM9ZsHTkTZ06DBZ9zClgQjg7dA4cdPRGJ0FaIF+d7dtgp3uUO7gSDwZvBCK5ybG16pwqHJwV4znbV3GrZPZKFtySF9z0UEXsMmF8BpTF42HeczdKw1XMFpRdBXEdGe0LfLapgJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X0geG+idqdCbIRUqjpU/QuH6oRdBjNpbzz13EXG/z2s=;
 b=BLqrxx+tnGbUIlczUeQ/exqv8yv3ksAPJ9JU2ig+pUm2psmnpOeK0fMBNjmn1vw/Dp3fbb5TNK2kkt0Wx4vfFySRCfvsvgi439EYLUhzMk5kB3cgA5woFtQBG0Y40rAaV2Z7hXmBl4LGr+FuQ/XdKjjbpUetUOcOOgDVf66md1Hz7dUAo599ZIQOjistABCRAPIH9iFgvIcidYh9tWgB1FLt7Y45LW3VW2BqldT0Q9i5/diVzrhJJpLUBT9SUxbi7vrzNpgPsdsfOVzO/8GWmWb7GcNqW2aHLsO6zoxJvH6RKBKWcRb7Zkly0RM9wW4XNDjnB57eL5NOVNsyuJobUQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB2048.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1b3::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Thu, 14 Dec
 2023 10:06:15 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f788:32b4:1c5e:f264]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f788:32b4:1c5e:f264%7]) with mapi id 15.20.7091.028; Thu, 14 Dec 2023
 10:06:15 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: George Stark <gnstark@salutedevices.com>, "andy.shevchenko@gmail.com"
	<andy.shevchenko@gmail.com>, "pavel@ucw.cz" <pavel@ucw.cz>, "lee@kernel.org"
	<lee@kernel.org>, "vadimp@nvidia.com" <vadimp@nvidia.com>,
	"mpe@ellerman.id.au" <mpe@ellerman.id.au>, "npiggin@gmail.com"
	<npiggin@gmail.com>, "hdegoede@redhat.com" <hdegoede@redhat.com>,
	"mazziesaccount@gmail.com" <mazziesaccount@gmail.com>, "peterz@infradead.org"
	<peterz@infradead.org>, "mingo@redhat.com" <mingo@redhat.com>,
	"will@kernel.org" <will@kernel.org>, "longman@redhat.com"
	<longman@redhat.com>, "boqun.feng@gmail.com" <boqun.feng@gmail.com>,
	"nikitos.tr@gmail.com" <nikitos.tr@gmail.com>
Subject: Re: [PATCH v3 03/11] devm-helpers: introduce devm_mutex_init
Thread-Topic: [PATCH v3 03/11] devm-helpers: introduce devm_mutex_init
Thread-Index: AQHaLhP7EUtTiJmPIEy5WnZk/rrl9LCoji8A
Date: Thu, 14 Dec 2023 10:06:15 +0000
Message-ID: <80881d5d-3ae9-4580-84c1-f25b421cc518@csgroup.eu>
References: <20231213223020.2713164-1-gnstark@salutedevices.com>
 <20231213223020.2713164-4-gnstark@salutedevices.com>
In-Reply-To: <20231213223020.2713164-4-gnstark@salutedevices.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR1P264MB2048:EE_
x-ms-office365-filtering-correlation-id: a6d39062-d614-49c0-cda2-08dbfc8c4f22
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  +kYouZM2YZwI1T5iUR2cdBOBdnOKzLJphIQxNcR30qmeOU3Y1O68qlUu2z9TMuV2yXakUPVONaJa6zHqbzhweJiLVqJuMO+zMvruGCWQtSJYR+hjOLV4Uys0olINgI/AAYVCHBQa4FU9qbGI29ofcnLmmQpy+ecY1zghk3hOXmgaT3YCLOO/Oc9oa0lQHkkwSf6KUpP4jMTEU7ZCweYj+yJBZoQDZwyBhOrKvnZqrScxS6grCYmiR86SEag3l+KxkDJ/ujOKi3gu1KecxtDh21t8DRn+askJlhwtasVOHqXgnK21zUkt92Be7egpY65xkXuw3rWysG4kElrpQnzJJxnStKgwFg36O3tiAtsC8N/Vs7//aeOlAd7cCzaAFz9XyQerT813NyTHWNlBc+79/j7WgnUkOzojkVfChlZrVdiWOZHRbVN8qNSBdiahZ9tfnvsgNHT7IqVgv9YS84lJVNkVmfR5VlyjObxNkBmghFZHhByie1WOGQR9cU5LmplzvgOczd+1Ns+FuRGXJXFXf3IaKlK5YXOOIMs6Ytp1D8bhjTpGyyiq2IAVhnt5b4Ah8TUrB784zpEuBzo2lES22+j6STo36fsk/GFfzMsTuae8OL0sTUPE5daDStJjW6/ZWA7iUi/KMOQO8IQGHFG7dYDsDWy21JL3RKXDA5m2yMSiVdsQlkbiiToSit8h1P1xhzZ2cNGrwyTZMHowB7RJqA==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(136003)(346002)(396003)(366004)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(31696002)(86362001)(36756003)(31686004)(91956017)(41300700001)(66556008)(478600001)(6506007)(76116006)(66946007)(66476007)(66446008)(64756008)(54906003)(71200400001)(38070700009)(921008)(26005)(6512007)(38100700002)(122000001)(83380400001)(2616005)(66574015)(7416002)(2906002)(5660300002)(316002)(110136005)(6486002)(966005)(44832011)(4326008)(8936002)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?YXhnWjZ3NlpVRTRCWmE4VjlXaXBoQnlHWS8za3hNQm0vdWVReSsycklKU09z?=
 =?utf-8?B?UHVmYUNhM0orVE50K0swSW43SjRxYWRPWk9QcTE5V0Ftb2RBS2FjMFlwYTQ3?=
 =?utf-8?B?d0gwcGo2UHdodmVqdWlZek1oOG4zaWh6bTF2aEsvQW90TElaczBkTFFNYm1B?=
 =?utf-8?B?NTd1MFRmOU80ZGtjdWsyY3lGN0N0djBKdDRmZ0RyTUNNQmJ5bW1PdkdrOXk3?=
 =?utf-8?B?RnlNdmkzZ1haOXdoTloxZVVuVTBDeklwYWFZSTVNeDRRS0phTGttRWlYU0hM?=
 =?utf-8?B?dlM1ZFNFMjV4TUZwZ3FzOEZMWmdacjJyQWNGYjc5UzlQT1Y0QmVWaldyUUJD?=
 =?utf-8?B?MW1kWS8yUFVrZzBHNllnd0pPQ1VsbmN0ODcvMWdPczZIMytCbWtTazR0SGt0?=
 =?utf-8?B?RXd2R3VGYTVSODNNTHpWUngrZEcvczdKUmQwRFBWQ0VWQjRiRlpmaHd5Titr?=
 =?utf-8?B?MURKdXNYc3Q0c1JOYzNIYWJtYXMyVS9RQkNhNTFEZm9BaEpjQmxzSW14V25G?=
 =?utf-8?B?ck53dm8xaXp5RWllMU83SkladFZ6L3JYUFV5UW0xUi9sZGtSckRIc0JRV1Nl?=
 =?utf-8?B?ZlozcDJsZi9Na0Nua2UzbkhVUm1ERFdJVi9yRDJ6SXMzK1RUUlRUWU44Y05a?=
 =?utf-8?B?S3RtY05CYzlkMTBNN0tSTFYxdCtDMDNmT3pGZFgwd1J0RDBPUStBT21vWE5B?=
 =?utf-8?B?OGNzRzFVQkdVN0J4VThCZUs0RGxoRWFiUklTWDhwMUVoWmRkek4zeDY1Y2t5?=
 =?utf-8?B?VjBCcWIwQ3VhUk1DckRYcHVMbWNkaFYxSG1tL05tL3J0YnRTNDRFK011YmhC?=
 =?utf-8?B?dm0vRFJmdFc5dkxTQW9nKy9VQm51Uy9vVldCQlJOS2pDWU1mM0Jab3NQbGxv?=
 =?utf-8?B?UGttcmVydVhjZ0dTNnBkdXlKL3RyY3ZoWWpXcHZlYXl3Ny9iYmdORFZrNFY2?=
 =?utf-8?B?NWJtSTRpcEZ3a3RjUStXTDB3b29IOGIyZ3lGS3JzNjkzMEYyeDBabHE1U3hI?=
 =?utf-8?B?Snk0a0c3U2Q0MkM2cG1OZkNsWjhPaXhTWHhVRDRvblUxMEY1QVZGRzUxUXEz?=
 =?utf-8?B?Uy9SQy9FZzRZUXkwdlZ5aUc1d1JmblIwUEVsbDFzMDVUSVQ3eEtYd0tlRFBr?=
 =?utf-8?B?ckUwblN2K0MxTmRBMEdRQWkvWUlqOWVHZEFPZ3owcWxYS1NSZWxqa2VkckJs?=
 =?utf-8?B?SGxMd3kvOExlbDY2ZFp5N05uL2lIa1Job1V2V3dkTGtBcjF1aUtaRjJtTWk3?=
 =?utf-8?B?K2pVSTdvZ2xwWFF2cFY3c2ZyMlVnWlZBNGZFUVRhUXNTTEdpY2ZESVQyaUVL?=
 =?utf-8?B?Q3BsVURjbHhUSDJiM1BPVDBoWk15dVdWRjAwMVdJZmpIb0dKU2RrbFpwNEx3?=
 =?utf-8?B?NlJ5ZnNXZjJNWXFyU0o3Ykl2RmpxdFRZTmxXTlc1T1UzYmsvNHFBT3diZEVD?=
 =?utf-8?B?T2pnSWJMM3htZ1lnQ0JwMWxpanpBTjhMaFIxZlFGNU1WaTBTZUd1T09YRUdJ?=
 =?utf-8?B?aEJLenhVZTd5eXBKU1FoKzU1emhZeHI3d1V2ZGdLVkJEbzFYMjFtS3RRdjQv?=
 =?utf-8?B?VTdNcG5LZy85OUhVSVRSdXJwajV0OVhkcWhZNHc3Lzh1ZlFzNWJmelNyWUds?=
 =?utf-8?B?ckZGVFJBN2NhdWpQL2RweXBPb0o0NXdoNmFHNmVsQ3NmQWxsYVNxS0tyODNu?=
 =?utf-8?B?TTVtZWRtUi9FbU8wdXp3QzJCN0JiUG8yV3k3Ty9ZY3A4VFpqOVkzbFhMdUJE?=
 =?utf-8?B?U29kbnBieWRHbHR2bC9EWTRZZjNRZS90OG50SkRZU25hNHFTSjhvOWNLQmZ2?=
 =?utf-8?B?YVJCUzNsSURxVTJpOWtaRTZnUXhhRVVPbFkxYlF1dUZLSXQvU3NnZEEyQ2tE?=
 =?utf-8?B?OGFNZzR4WjNrVjN6RHBkODJ1R3Q3WENsa3JXcUh0NGh0ZGp1NkFsMlRuOHNY?=
 =?utf-8?B?MkZpME1JSVlxWjVRYmY1UlNTeER3a2JUZFg0SGV5VkFuVldBTThSeDEwRjZu?=
 =?utf-8?B?VWlNWkNYSW8yckFXTHVLV3RBMkhaR3hRbVVSUWxPVlZWUi9pYVhYazZzZ294?=
 =?utf-8?B?M1FJbGFCVFZOcGR3WGRxcHU1MjlBZzVBVWFnT0w4a2VHS0k5RVlzWDR2b2xL?=
 =?utf-8?B?d3MyakUwbmJQUUlSVGgxV0dtd3FKd2o4WXhWUzVzT1hLT25nYS81dUFXaVhq?=
 =?utf-8?B?NUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3FDC7E099C05AC4FBB5FCB90D554C5EB@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a6d39062-d614-49c0-cda2-08dbfc8c4f22
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2023 10:06:15.6054
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dg7zzZRC3P0Odd9zjsYTclh0eE276QhUt0JXZTPSgGR11/XB8YnxCyiGpBacDrdJ2tSPzVeJFQpemfLJ+delkxBxjS85Ga/T8sbbu1hIwxg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB2048
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
Cc: "kernel@salutedevices.com" <kernel@salutedevices.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDEzLzEyLzIwMjMgw6AgMjM6MzAsIEdlb3JnZSBTdGFyayBhIMOpY3JpdMKgOg0KPiBb
Vm91cyBuZSByZWNldmV6IHBhcyBzb3V2ZW50IGRlIGNvdXJyaWVycyBkZSBnbnN0YXJrQHNhbHV0
ZWRldmljZXMuY29tLiBEw6ljb3V2cmV6IHBvdXJxdW9pIGNlY2kgZXN0IGltcG9ydGFudCDDoCBo
dHRwczovL2FrYS5tcy9MZWFybkFib3V0U2VuZGVySWRlbnRpZmljYXRpb24gXQ0KPiANCj4gVXNp
bmcgb2YgZGV2bSBBUEkgbGVhZHMgdG8gYSBjZXJ0YWluIG9yZGVyIG9mIHJlbGVhc2luZyByZXNv
dXJjZXMuDQo+IFNvIGFsbCBkZXBlbmRlbnQgcmVzb3VyY2VzIHdoaWNoIGFyZSBub3QgZGV2bS13
cmFwcGVkIHNob3VsZCBiZSBkZWxldGVkDQo+IHdpdGggcmVzcGVjdCB0byBkZXZtLXJlbGVhc2Ug
b3JkZXIuIE11dGV4IGlzIG9uZSBvZiBzdWNoIG9iamVjdHMgdGhhdA0KPiBvZnRlbiBpcyBib3Vu
ZCB0byBvdGhlciByZXNvdXJjZXMgYW5kIGhhcyBubyBvd24gZGV2bSB3cmFwcGVyLg0KPiBTaW5j
ZSBtdXRleF9kZXN0cm95KCkgYWN0dWFsbHkgZG9lcyBub3RoaW5nIGluIG5vbi1kZWJ1ZyBidWls
ZHMNCj4gZnJlcXVlbnRseSBjYWxsaW5nIG11dGV4X2Rlc3Ryb3koKSBpcyBqdXN0IGlnbm9yZWQg
d2hpY2ggaXMgc2FmZSBmb3Igbm93DQo+IGJ1dCB3cm9uZyBmb3JtYWxseSBhbmQgY2FuIGxlYWQg
dG8gYSBwcm9ibGVtIGlmIG11dGV4X2Rlc3Ryb3koKSBpcw0KPiBleHRlbmRlZCBzbyBpbnRyb2R1
Y2UgZGV2bV9tdXRleF9pbml0KCkuDQoNClNvIHlvdSBhYmFuZG9ubmVkIHRoZSBpZGVhIG9mIHVz
aW5nIG11dGV4LmggPw0KDQpJIGNhbid0IHNlZSB0aGUgcG9pbnQgdG8gc3ByZWFkIG11dGV4IGZ1
bmN0aW9ucyBpbnRvIGRldm0taGVscGVycy5oDQoNCkFkZGluZyBhIG11dGV4X2Rlc3Ryb3kgbWFj
cm8gZm9yIHRoaXMgcHVycG9zZSBsb29rcyBvZGQuIEFuZCBpZiBzb21lb25lIA0KZGVmaW5lcyBh
IG5ldyB2ZXJzaW9uIG9mIG11dGV4X2Rlc3Ryb3koKSBhbmQgZm9yZ2V0IHRoZSBtYWNybywgaXQg
d2lsbCANCmdvIHVuZGV0ZWN0ZWQuDQoNClVzdWFsbHkgbWFjcm9zIG9mIHRoYXQgdHlwZSBzZXJ2
ZSB0aGUgcHVycG9zZSBvZiBkZWZpbmluZyBhIGZhbGxiYWNrIA0Kd2hlbiB0aGUgbWFjcm8gaXMg
bm90IGRlZmluZWQuIEluIHRoYXQgY2FzZSwgd2hlbiBzb21lb25lIGFkZHMgYSBuZXcgDQp2ZXJz
aW9uIHdpdGhvdXQgZGVmaW5pbmcgdGhlIG1hY3JvLCBpdCBnZXRzIGRldGVjdGVkIGJlY2F1c2Ug
aWYgDQpjb25mbGljdHMgd2l0aCB0aGUgZmFsbGJhY2suDQpCdXQgaW4geW91ciBjYXNlIGl0IHdv
cmtzIHRoZSBvdGhlciB3YXkgcm91bmQsIHNvIEkgd2lsbCBqdXN0IGdvIHVuZGV0ZWN0ZWQuDQoN
CkZvciBtZSB0aGUgYmVzdCBzb2x1dGlvbiByZW1haW5zIHRvIHVzZSBtdXRleC5oIGFuZCBoYXZl
IA0KZGV2bV9tdXRleF9pbml0KCkgZGVmaW5lZCBvciBkZWNsYXJlZCBhdCB0aGUgc2FtZSBwbGFj
ZSBhcyBtdXRleF9kZXN0cm95KCkuDQoNCg0KPiANCj4gU2lnbmVkLW9mZi1ieTogR2VvcmdlIFN0
YXJrIDxnbnN0YXJrQHNhbHV0ZWRldmljZXMuY29tPg0KPiAtLS0NCj4gICBpbmNsdWRlL2xpbnV4
L2Rldm0taGVscGVycy5oIHwgMjcgKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ICAgMSBm
aWxlIGNoYW5nZWQsIDI3IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9pbmNsdWRl
L2xpbnV4L2Rldm0taGVscGVycy5oIGIvaW5jbHVkZS9saW51eC9kZXZtLWhlbHBlcnMuaA0KPiBp
bmRleCA3NDg5MTgwMjIwMGQuLjQwNDNjMzQ4MWQyZSAxMDA2NDQNCj4gLS0tIGEvaW5jbHVkZS9s
aW51eC9kZXZtLWhlbHBlcnMuaA0KPiArKysgYi9pbmNsdWRlL2xpbnV4L2Rldm0taGVscGVycy5o
DQo+IEBAIC0yNCw2ICsyNCw3IEBADQo+ICAgICovDQo+IA0KPiAgICNpbmNsdWRlIDxsaW51eC9k
ZXZpY2UuaD4NCj4gKyNpbmNsdWRlIDxsaW51eC9tdXRleC5oPg0KPiAgICNpbmNsdWRlIDxsaW51
eC93b3JrcXVldWUuaD4NCj4gDQo+ICAgc3RhdGljIGlubGluZSB2b2lkIGRldm1fZGVsYXllZF93
b3JrX2Ryb3Aodm9pZCAqcmVzKQ0KPiBAQCAtNzYsNCArNzcsMzAgQEAgc3RhdGljIGlubGluZSBp
bnQgZGV2bV93b3JrX2F1dG9jYW5jZWwoc3RydWN0IGRldmljZSAqZGV2LA0KPiAgICAgICAgICBy
ZXR1cm4gZGV2bV9hZGRfYWN0aW9uKGRldiwgZGV2bV93b3JrX2Ryb3AsIHcpOw0KPiAgIH0NCj4g
DQo+ICsjaWZkZWYgbXV0ZXhfZGVzdHJveQ0KPiArc3RhdGljIGlubGluZSB2b2lkIGRldm1fbXV0
ZXhfcmVsZWFzZSh2b2lkICpyZXMpDQo+ICt7DQo+ICsgICAgICAgbXV0ZXhfZGVzdHJveShyZXMp
Ow0KPiArfQ0KPiArI2VuZGlmDQo+ICsNCj4gKy8qKg0KPiArICogZGV2bV9tdXRleF9pbml0IC0g
UmVzb3VyY2UtbWFuYWdlZCBtdXRleCBpbml0aWFsaXphdGlvbg0KPiArICogQGRldjogICAgICAg
RGV2aWNlIHdoaWNoIGxpZmV0aW1lIG11dGV4IGlzIGJvdW5kIHRvDQo+ICsgKiBAbG9jazogICAg
ICBQb2ludGVyIHRvIGEgbXV0ZXgNCj4gKyAqDQo+ICsgKiBJbml0aWFsaXplIG11dGV4IHdoaWNo
IGlzIGF1dG9tYXRpY2FsbHkgZGVzdHJveWVkIHdoZW4gdGhlIGRyaXZlciBpcyBkZXRhY2hlZC4N
Cj4gKyAqDQo+ICsgKiBSZXR1cm5zOiAwIG9uIHN1Y2Nlc3Mgb3IgYSBuZWdhdGl2ZSBlcnJvciBj
b2RlIG9uIGZhaWx1cmUuDQo+ICsgKi8NCj4gK3N0YXRpYyBpbmxpbmUgaW50IGRldm1fbXV0ZXhf
aW5pdChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBtdXRleCAqbG9jaykNCj4gK3sNCj4gKyAg
ICAgICBtdXRleF9pbml0KGxvY2spOw0KPiArI2lmZGVmIG11dGV4X2Rlc3Ryb3kNCj4gKyAgICAg
ICByZXR1cm4gZGV2bV9hZGRfYWN0aW9uX29yX3Jlc2V0KGRldiwgZGV2bV9tdXRleF9yZWxlYXNl
LCBsb2NrKTsNCj4gKyNlbHNlDQo+ICsgICAgICAgcmV0dXJuIDA7DQo+ICsjZW5kaWYNCj4gK30N
Cj4gKw0KPiAgICNlbmRpZg0KPiAtLQ0KPiAyLjI1LjENCj4gDQo=
