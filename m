Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2030159E7CB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Aug 2022 18:48:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MBwD86VW2z3c45
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Aug 2022 02:48:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=k/L2Yq/R;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.80; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=k/L2Yq/R;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90080.outbound.protection.outlook.com [40.107.9.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MBwCM00sLz2xGF
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Aug 2022 02:48:13 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L/rsztYQMtQya2L/zhyA6xWxXAmAaJxUZw1eP+nEggR0tMtBckA1HUH4kpUcbys/l68uI2krgtV+s39tv3G8GHS2iwoGQgVio9qDtPs0baCwKmAQycB7ZVQOb4Kqlnmthf7FJMPcvpES6YQ7oinEEqkOpG2K3tdwqXowjLG2vLM1JN0MLDTy6nbvTWRC1+Vr7NbKnjir3o8CQAp68KtPbzhh4vh9puqZF6sh47lzqCB6tuTp/L1c9h+2JVgp+W27wCQfHOzx8CwxcVCcgjR1oxmiiOvnkSw9ev7w2kptGkfz2k4mdVuwNpVjm4qiPr6+UUKjNVZIM2l4SO9+0PaaxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QkLE7hQTzDORMRS/Q6FBjHSL91/+NxCXA5zbb0zp4pI=;
 b=Z89lPAUWnNrcx2M96iNQNm04tP8i2bOGtOr0UvQUp4XvTCyuPCr2rKSdHB7WCiFYGMonpuQtd3No86yDGnzHs286Rr8NDs7W50Y4W36c+/4UmQIbniOCKmmGPONX622ZO51WLxv2vHhR+Bzi7kOUhYoqpQRnckogWQuEopH8+hDgWzKaldTwE3YTMPJp6l91hHdsMZ6EopRCIFI6eMvPebmzJI205Q9Zb8JoTynYTno7icYC0xEYyVE5PF6RxltOB69MjQ1s4+T0Vy4AuAh65JNzYPkIo5mFAfr1ewtHUxTJdBQFZmAPZNzPK+szAiGGRxYr7NE1+kP9wytMUPf3uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QkLE7hQTzDORMRS/Q6FBjHSL91/+NxCXA5zbb0zp4pI=;
 b=k/L2Yq/RyZ/D9GllP1tJZFh68iGKnW3+VkTTgvar45FM6KUBo7uU8LB4bN14Cj3RWacMND2xdSYnzO93xJWkiiJNEv4UTcW9DYkjXGKV11QeykhEIkZH+RN0OYEZO+o7/v9MRjdxBCrCruDdlVlhDCvmV2ULV0g7PS6AGUcsb+m0xjrj2Zgz4ikmeiiZroAN2hZB/yUMngLJLiC1F9ppGmkUTIL+KXw4jwEOsf2sTua2lLY/OAdF/cZdC8uszuehYvzzLw1yu13jwfFKjmQL0mo+fjBcHgaiEiD7nrxTVLPhbnAeWqZ6ECWM0PR+JrSDAaUVmTeBkkixx0am9LmC0A==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB3886.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:d8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.19; Tue, 23 Aug
 2022 16:47:53 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::888e:a92e:a4ee:ce9e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::888e:a92e:a4ee:ce9e%5]) with mapi id 15.20.5546.024; Tue, 23 Aug 2022
 16:47:53 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Chen Zhongjin <chenzhongjin@huawei.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH] objtool: replace _ASM_PTR with quad in macros
Thread-Topic: [PATCH] objtool: replace _ASM_PTR with quad in macros
Thread-Index: AQHYtvUie9Tb4ifm4U+obaGmnHiQz628skEA
Date: Tue, 23 Aug 2022 16:47:53 +0000
Message-ID: <27c6906c-baf3-6802-9843-50b27df74a71@csgroup.eu>
References: <20220823133124.55914-1-chenzhongjin@huawei.com>
In-Reply-To: <20220823133124.55914-1-chenzhongjin@huawei.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4a898d4c-8aeb-4e6d-b085-08da8527395a
x-ms-traffictypediagnostic: PAZP264MB3886:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  xcDklRb3plQnqFjk1sWjDtfw7KAwNOXlUJ5vNhTfeVlzWJ1G9TRo3nEL9EQ/CK7qeBlsmKqv1rE4r2O+F48hhSP24l4IFcBZaCG8kHtcqhr571mifPagDLxsZzyIcq73g4ZLLXTyIYo0MKzoNGptpMK2naUx6+dG8CDtmW0xx9csBetYAmr4NeR1+ZAgvRowbl19ajmP/XaHtJfW5k5vpY7dggOUn1ZzU7zHpxcfL0e4asupYggy87cJip34Hsqa9ifIt8RWA+m8xRRtSwnJ7NSLZoqXjg+RqpzaMp4uyy0NdXsrl2H+kFW+EQm+7E2JcdMyaIyyYMgnQKotltXaR3uO8l9YFlxLjAjbueT/YrGfxPNQutLDmpIqURaDI2jSBE5+jJsTqdeLo/mY5KDsxlnaj/u4yTgHiEa6p7tGJcqg2Dh5FfEeS1UT0luM75+A5bpKwng65PB7q+9+GI4sjbmtzo6MFzwe/0wI+/ZIhTOkJt+6eeASqEYIE6iJq/pnD090l8I/ayc4ar5TdMJwPA1KoI7AS1/BeSV8GYVCPyW25w2A3rZwoS+IPYIcpgxqZC7F7rUQHILliskcnwG9FYYyNPQigvWwjW5SF+VPrmYAvw+A76xgN1L+oOTEdAAJJ4FuXj6UIao4R29h0X5fYd8ByAITE7EuufSlrc2lyL9vmhV5zfb0wFgc8MkJrVedUrhn5p91C+GFglgUtkiDlKH8qUN0gOLXE3s57z5T48WfjTAryFtymia3Klo0sztyG0BLavUhVhLj+NQPJ65KQ/nwPy/78BbhNFlpw4cmjoUOAR5H0Z4mDR0F8bwzeYMF149BPtdtkxOqvelDX21IOFC1/oo459TmM9KJZj5IJmM=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(396003)(366004)(346002)(39850400004)(71200400001)(966005)(6506007)(6486002)(2616005)(41300700001)(478600001)(83380400001)(186003)(6512007)(26005)(2906002)(8936002)(44832011)(316002)(5660300002)(110136005)(54906003)(66556008)(64756008)(4326008)(8676002)(66446008)(91956017)(66946007)(86362001)(76116006)(38100700002)(31686004)(38070700005)(31696002)(122000001)(36756003)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?QTVOZVBHQnprMkNHMDZlbkFlcW94TTgxaXNmREh0dXdzOGlROEFtZmNZU0p0?=
 =?utf-8?B?b0xVYk4rRi83dEFqb3pqRkZpcGE3ZDNMRjJLQnZEL01FUXNNSUx2QlFIcDhI?=
 =?utf-8?B?YnZucG5OQUNDVHFJOHM4bXpOU25wWmRWcFpIbVR6ekd1ZVZveTM5USttNFZC?=
 =?utf-8?B?QjU1VTFkMXJxcldtREhIbHQxbFFQc0VHaWE5dW4za1NpY0tUOVA3Rm12R3Zk?=
 =?utf-8?B?bzJJZGxIMWZqckRMREpGOFRiV0hZVXZHV3Nkckt1WWk1YzBRRzlHR3k3RW96?=
 =?utf-8?B?YlpyekxjWHk4UjdFWEtwakRJc0xrZVAra00zUDVmSmNaeW5pN3lpMGdmWUhC?=
 =?utf-8?B?bDZpL2lwZ1hyait5MStudlBPMFpvKzNzSnd4N0JHb3lhTHlGR0NvQVUrZUdJ?=
 =?utf-8?B?Y2lOS0lrL1U3VDBpRllyQmZNWkF3TzFZcjRjN205QjEwRVh5T1FMY3cwdXFG?=
 =?utf-8?B?aFo0V09icElqMFNtQXBnRXQxNEhNdnpScEVHY2NFR2VnRi9vOXFiQmxYNGp4?=
 =?utf-8?B?aUdkWElnM1VTVllUZlp2U0hka3o4N2Z0bUFFcWlFRXZmbmZSYTRuY3ZmNEF1?=
 =?utf-8?B?QnBUME04SDFMbVBNMFJrK1VkZ253OU9FTm5VQW1TdTNiZWIxOVJXV0FzaVNB?=
 =?utf-8?B?ajZMYXJhVDY3USs5YkpGRVYvK2dDbVdoeHUrWW96UjE1ckNyTFl5SDJJWnp6?=
 =?utf-8?B?ZmFiRkQwOFQ0MTFBWmJJMnA0QU9HazEwTThub1FzMWpqSzdOcGQwMXljMlRH?=
 =?utf-8?B?ZDhkckVRM0N2NmlhKzZ2aDQ3amljTjZ3K2RabGduVHpwNDRlOFloM0dlQmhs?=
 =?utf-8?B?NjFzcWVZS0c0NU9zOFhXOERmaVVtQ1lDVUlHL3dObTVlOWRwNTRWbzl3UndF?=
 =?utf-8?B?R250bm5ISGFCcEVzTUZ1QWhrRm5wZ1BSTjd1WEh3bHFGd2F0Q0dmWTBIZ2RZ?=
 =?utf-8?B?YUpnV0xHMEsyY2pTRURKQk1PU1ZMYnZhWjlpeUhVeTV2Sm02a0NWQU41WWtM?=
 =?utf-8?B?LytMdGkwVkhGL0NvL2UzR0UzanBYdk8wREZJK2N0UlZwYitpb2FSRTN5bVE0?=
 =?utf-8?B?YVIxNHptTWJKdnlBZUJ1S1VoakNwTWhHdTMrM1dTVDNQYzhUQzhEU2NPYVhw?=
 =?utf-8?B?U21ZZjRUQTdVQm12b1paU01vdENYV29IOGVhQW9YaHdPQjNtUVcyM2twSnB0?=
 =?utf-8?B?VGpOSk1DdG1MMWV6MkVuckloOUc4c3lvaHBON3hlaHNFSXRhd0NnbG1kYWFn?=
 =?utf-8?B?ODNIem9BempYRHdBSVZuaVViU251Njh2VlUrbmY4L2RUQ2FmVmVQR3NMdzFs?=
 =?utf-8?B?cVc1RVdTdnh3WkxEODNibHp0ek5Nc1AvenYzcUx0bldYOE45cHhJMGE5V3BU?=
 =?utf-8?B?UCtuSGJVbXZIWmJrdXd6WTIrc1p3emppTUVyU01VYW9maTdzeFBZU2dlamkw?=
 =?utf-8?B?RmFMYzZ3OFFtay84U084N3VoQjBMaDdNUUt3RWRJajRYOFAyVTRBcEt3ckFs?=
 =?utf-8?B?c3VFY0JlQ3kvSVdiVXJIcHdJWjNIL2NrS21Zck92eTFXbUMyblBqYnFpME1H?=
 =?utf-8?B?RUFoM004Q25XRENTOVBha2VKL3YvZlgwWVAxRU95VFhZcGZMYXBsWVg5SUJk?=
 =?utf-8?B?SUNNY2ZrTzk3Y3lHczZ0VER1YnZ4aEV1Tm9GMmtZU0JPYmR1bTdkbEJ4NlAz?=
 =?utf-8?B?TVFHdmF4VEN3WG9tNmZLMFVuT2lmcEh5VkpTWmUxMkxZWlQ2L0NubEhyaU1l?=
 =?utf-8?B?QktIZndua0JtVVVKbDJSWkJCc1gzeVdNSlcxS3ZZd3hpUWMyY21XbVVMUGhK?=
 =?utf-8?B?aHJFUXRTWkhEdERuekQ4MFdKQU41b2FmOFdEeDlKTmR1RVFZOGQzR0NHYmxN?=
 =?utf-8?B?a2h2b1lIYWZjWkpzRGE4VERLVE5nZlorcjBHZ0psNms4MWFXT1VYbDV4ZGIw?=
 =?utf-8?B?QkpPUTRCVEJGMmdncmRsa2ZFTGtHMHVVMWdLZjlFZ3lVd3o0dnlHc3drVGc5?=
 =?utf-8?B?MGN2UDJyNUNLc2RGaXVGTFVRWm9TNzZza2ZjMWt6cmNVTWhtTnBNSmF1VG1M?=
 =?utf-8?B?VUpYMDAzNFBLWlNSS0M2ZUllaW54ZEkrSkVKdlBCdmhPeWVyZkZrbmppc0U4?=
 =?utf-8?B?WXBwS21KRWVzSEhKMnQ3dXNUanVWcm1WSnpYZGlsZmdoaEsvTkhUenNPbU1L?=
 =?utf-8?Q?OlR7ZFxOkRqLpeMewWhtbr4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <81EF413FA9C1E04CBBBA76AFE137F590@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a898d4c-8aeb-4e6d-b085-08da8527395a
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2022 16:47:53.8341
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hxQ2VsOciYK/GA+JNMA2YFbp5rzLGNf+nl/lU2OtlZQsB3ksUZcTlgjjr/wMO4khLZSyydVB5zYigHzViL/tkp4/rjw8tRDO3Nlak1XL3p0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB3886
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
Cc: "peterz@infradead.org" <peterz@infradead.org>, "sv@linux.ibm.com" <sv@linux.ibm.com>, "mhiramat@kernel.org" <mhiramat@kernel.org>, "naveen.n.rao@linux.vnet.ibm.com" <naveen.n.rao@linux.vnet.ibm.com>, "bp@suse.de" <bp@suse.de>, "jpoimboe@kernel.org" <jpoimboe@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDIzLzA4LzIwMjIgw6AgMTU6MzEsIENoZW4gWmhvbmdqaW4gYSDDqWNyaXTCoDoNCj4g
TWFjcm9zIFNUQUNLX0ZSQU1FX05PTl9TVEFOREFSRCBhbmQgQU5OT1RBVEVfTk9FTkRCUiB1c2Vz
DQo+IF9BU01fUFRSLiBJdCBzd2l0Y2ggYmV0d2VlbiAubG9uZyBhbmQgLnF1YWQgYmFzZWQgb24g
MzJiaXQNCj4gb3IgNjRiaXQuIEhvd2V2ZXIgb2JqdG9vbCBkb2Vzbid0IHdvcmsgZm9yIDMyYml0
LCBzbyBfQVNNX1BUUg0KPiBtYWtlcyBubyBzZW5zZS4NCj4gDQo+IENvbnNpZGVyaW5nIHRoYXQg
X0FTTV9QVFIgY29tZXMgZnJvbSBhc20uaCwgd2hpY2ggaXMgeDg2DQo+IHNwZWNpZmljIGhlYWQg
ZmlsZSwgd2hpbGUgb2JqdG9vbC5oIGlzIGdlbmVyaWMuIFJlcGxhY2UNCj4gX0FTTV9QVFIgd2l0
aCBxdWFkIGFuZCByZW1vdmUgYXNtLmggcmVmZXJlbmNlLg0KDQpvYmp0b29sIGlzIGFib3V0IHRv
IGJlIHVzZWQgb24gcG93ZXJwYyBvbiBib3RoIFBQQzMyIGFuZCBQUEM2NCwgc2VlIA0KaHR0cHM6
Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2xpbnV4cHBjLWRldi9saXN0Lz9zZXJpZXM9
MzEyOTU1JnN0YXRlPSoNCg0KU28gaWYgdGhpcyBwYXJ0IGlzIG1lYW50IHRvIGJlIHVzZWQgYnkg
YWxsIGFyY2hpdGVjdHVyZXMsIHdlIG5lZWQgDQpub3RoaW5nIHRoYXQgYWxzbyB3b3JrcyBvbiAz
MiBiaXRzLCBkb24ndCB3ZSA/DQoNCkNocmlzdG9waGUNCg0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5
OiBDaGVuIFpob25namluIDxjaGVuemhvbmdqaW5AaHVhd2VpLmNvbT4NCj4gLS0tDQo+ICAgaW5j
bHVkZS9saW51eC9vYmp0b29sLmggICAgICAgfCA2ICsrLS0tLQ0KPiAgIHRvb2xzL2luY2x1ZGUv
bGludXgvb2JqdG9vbC5oIHwgNiArKy0tLS0NCj4gICAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0
aW9ucygrKSwgOCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4
L29ianRvb2wuaCBiL2luY2x1ZGUvbGludXgvb2JqdG9vbC5oDQo+IGluZGV4IDYyYzU0ZmZiZWVh
YS4uZDI0MTNjYjc4MDM3IDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL2xpbnV4L29ianRvb2wuaA0K
PiArKysgYi9pbmNsdWRlL2xpbnV4L29ianRvb2wuaA0KPiBAQCAtNDUsOCArNDUsNiBAQCBzdHJ1
Y3QgdW53aW5kX2hpbnQgew0KPiAgIA0KPiAgICNpZmRlZiBDT05GSUdfT0JKVE9PTA0KPiAgIA0K
PiAtI2luY2x1ZGUgPGFzbS9hc20uaD4NCj4gLQ0KPiAgICNpZm5kZWYgX19BU1NFTUJMWV9fDQo+
ICAgDQo+ICAgI2RlZmluZSBVTldJTkRfSElOVChzcF9yZWcsIHNwX29mZnNldCwgdHlwZSwgZW5k
KQkJXA0KPiBAQCAtODcsNyArODUsNyBAQCBzdHJ1Y3QgdW53aW5kX2hpbnQgew0KPiAgICNkZWZp
bmUgQU5OT1RBVEVfTk9FTkRCUgkJCQkJXA0KPiAgIAkiOTg2OiBcblx0IgkJCQkJCVwNCj4gICAJ
Ii5wdXNoc2VjdGlvbiAuZGlzY2FyZC5ub2VuZGJyXG5cdCIJCQlcDQo+IC0JX0FTTV9QVFIgIiA5
ODZiXG5cdCIJCQkJCVwNCj4gKwkiLnF1YWQgOTg2YlxuXHQiCQkJCQlcDQo+ICAgCSIucG9wc2Vj
dGlvblxuXHQiDQo+ICAgDQo+ICAgI2RlZmluZSBBU01fUkVBQ0hBQkxFCQkJCQkJCVwNCj4gQEAg
LTE0NCw3ICsxNDIsNyBAQCBzdHJ1Y3QgdW53aW5kX2hpbnQgew0KPiAgIA0KPiAgIC5tYWNybyBT
VEFDS19GUkFNRV9OT05fU1RBTkRBUkQgZnVuYzpyZXENCj4gICAJLnB1c2hzZWN0aW9uIC5kaXNj
YXJkLmZ1bmNfc3RhY2tfZnJhbWVfbm9uX3N0YW5kYXJkLCAiYXciDQo+IC0JX0FTTV9QVFIgXGZ1
bmMNCj4gKwkucXVhZCBcZnVuYw0KPiAgIAkucG9wc2VjdGlvbg0KPiAgIC5lbmRtDQo+ICAgDQo+
IGRpZmYgLS1naXQgYS90b29scy9pbmNsdWRlL2xpbnV4L29ianRvb2wuaCBiL3Rvb2xzL2luY2x1
ZGUvbGludXgvb2JqdG9vbC5oDQo+IGluZGV4IDYyYzU0ZmZiZWVhYS4uZDI0MTNjYjc4MDM3IDEw
MDY0NA0KPiAtLS0gYS90b29scy9pbmNsdWRlL2xpbnV4L29ianRvb2wuaA0KPiArKysgYi90b29s
cy9pbmNsdWRlL2xpbnV4L29ianRvb2wuaA0KPiBAQCAtNDUsOCArNDUsNiBAQCBzdHJ1Y3QgdW53
aW5kX2hpbnQgew0KPiAgIA0KPiAgICNpZmRlZiBDT05GSUdfT0JKVE9PTA0KPiAgIA0KPiAtI2lu
Y2x1ZGUgPGFzbS9hc20uaD4NCj4gLQ0KPiAgICNpZm5kZWYgX19BU1NFTUJMWV9fDQo+ICAgDQo+
ICAgI2RlZmluZSBVTldJTkRfSElOVChzcF9yZWcsIHNwX29mZnNldCwgdHlwZSwgZW5kKQkJXA0K
PiBAQCAtODcsNyArODUsNyBAQCBzdHJ1Y3QgdW53aW5kX2hpbnQgew0KPiAgICNkZWZpbmUgQU5O
T1RBVEVfTk9FTkRCUgkJCQkJXA0KPiAgIAkiOTg2OiBcblx0IgkJCQkJCVwNCj4gICAJIi5wdXNo
c2VjdGlvbiAuZGlzY2FyZC5ub2VuZGJyXG5cdCIJCQlcDQo+IC0JX0FTTV9QVFIgIiA5ODZiXG5c
dCIJCQkJCVwNCj4gKwkiLnF1YWQgOTg2YlxuXHQiCQkJCQlcDQo+ICAgCSIucG9wc2VjdGlvblxu
XHQiDQo+ICAgDQo+ICAgI2RlZmluZSBBU01fUkVBQ0hBQkxFCQkJCQkJCVwNCj4gQEAgLTE0NCw3
ICsxNDIsNyBAQCBzdHJ1Y3QgdW53aW5kX2hpbnQgew0KPiAgIA0KPiAgIC5tYWNybyBTVEFDS19G
UkFNRV9OT05fU1RBTkRBUkQgZnVuYzpyZXENCj4gICAJLnB1c2hzZWN0aW9uIC5kaXNjYXJkLmZ1
bmNfc3RhY2tfZnJhbWVfbm9uX3N0YW5kYXJkLCAiYXciDQo+IC0JX0FTTV9QVFIgXGZ1bmMNCj4g
KwkucXVhZCBcZnVuYw0KPiAgIAkucG9wc2VjdGlvbg0KPiAgIC5lbmRtDQo+ICAg
