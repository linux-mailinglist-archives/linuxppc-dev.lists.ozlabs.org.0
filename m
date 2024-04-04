Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F2A898E7B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Apr 2024 21:02:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=SzJ4uk/H;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V9WFY24f3z3vXp
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 06:02:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=SzJ4uk/H;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:c207::1; helo=mrzp264cu002.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from MRZP264CU002.outbound.protection.outlook.com (mail-francesouthazlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c207::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V9WDk5KQGz3cP7
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Apr 2024 06:01:24 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uxif+BZsvYBms/4SWHZZjCiz3Mtecv3yeFVLKDDfXwrPWTDeWw4pdVVctJjhtVR5UwJk3whGbbC87nbY9QPbmNGTwAsUB5P7uHdpyGai4nDsb+zQ2PdKx7pj4tTSpaoaXBMpWr1zJ0r495V6gintMk7VPtiiRqLn9eBhh+5vdV64DYxxiqBcLk4GBI+xPt3Ugnix8tsyCV9eeJEYGIVvdsGTlvPJpkUBGmtRotvw/aYhgFz9tH9riLWQ1DfjvsDPlt+8sh7GIfrUxSA0fKOrFgmXzstcxSpKK31J0jNKUDy2SB+DPtsiyC8TlNKjHyOJZbMduUyzWckvKi1QNEY8Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c2GBi01aYk8pc0w+yp1hfZBEFaXIzQM87oqEV5ysOU8=;
 b=OwB54Uvfks39UjncA1r2qDANF0OlUqp34PgrB09CduiSDOn6uQaFz4oKe81FbyZz2cLu5m0t8CXYoJVDTU3MFEeD+B3mzLxr61No8Xo70S+Sa/avv2oiZ05GfsnbG4F6Fltkh8pEribuk0w+8azN86MErCjSrrG/zdKJ2xyho25ri5hVyFWXuosOf2rFfeoRp736L5p8qOQvSpzfn+HNPpQfIotyYyiVgzsW77bWNOH0Tb14KVk/hAnU5KXMwfqIpNculuGKYRTCh+DchP4t18X0nTMRd6KywN/7lAMG2p5ooznB4N3+8ICv0ZGq6YU8f7IbBuJ+/XxPWIoi/xVw/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c2GBi01aYk8pc0w+yp1hfZBEFaXIzQM87oqEV5ysOU8=;
 b=SzJ4uk/H9ixJIKjwVgY4Rrs831bmZzcaVqdE4tfVQd8esxdm1UQlf6rbrygVh+up9DgdVdEe98HXkl/8QbWvLagoEdISGYGs0QMgakoLsd5iNbkGpiIusUvCJ3QJP0AhBkWd1csw7s3YA4yQky6RHyQIFzU6d/j3TQKqI5bHPIFEbO4UlKRG/frOYR1+im+GOwAfpxnBl0AaotnK280gx2DH8P4tP2fD33DKu6BxpcnQiJzME/XMs1GdcnuLRYYgMoJLKhpnrDVI0SGnOctpGUCnURfijDOlay2So8d0kV1Cma5D68DRkGxzLaUUo8ALZsgRA0jabXZwNGk+pja6kA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR0P264MB4719.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:65::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Thu, 4 Apr
 2024 19:00:59 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::1f75:cb9f:416:4dbb]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::1f75:cb9f:416:4dbb%7]) with mapi id 15.20.7409.042; Thu, 4 Apr 2024
 19:00:59 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Christian Zigotzky <chzigotzky@xenosoft.de>, "hbathini@linux.ibm.com"
	<hbathini@linux.ibm.com>
Subject: Re: [FSL P50x0] Kernel 6.9-rc1 compiling issue
Thread-Topic: [FSL P50x0] Kernel 6.9-rc1 compiling issue
Thread-Index:  AQHafm/HBa6Zup3O6kOZVcW6XoFyVrFH6uWAgAAXxYCAAAjrAIAAITyAgBBFqoCAABWAAA==
Date: Thu, 4 Apr 2024 19:00:59 +0000
Message-ID: <41ff5851-6ff4-4c45-8f47-6336fd6c11ac@csgroup.eu>
References: <a4320985-f585-4033-8229-63937a49aa84@xenosoft.de>
 <3FDFD539-844A-44B7-BEA7-BE4F3BE4EAEE@xenosoft.de>
In-Reply-To: <3FDFD539-844A-44B7-BEA7-BE4F3BE4EAEE@xenosoft.de>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR0P264MB4719:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  PqcVr/7iw5r03//M7KHd+sIYoAgrZzGo98/1NgYC0JTITPNdFgrdraogVIAMkWRJWBiyxiZBAwnvYq5UyODIHNktWlXRVJDREghOwqQ7mOaxCtIinL7JeE4dl3AyEV1PwoHycXDqFMauO4mMNGYW8cW2zt8buaIr1Ixvmzymrs9AUBBDHSrPZeFbUPtQvmRMP+loDpz1s90iKHTOUjRD7G9wdHooqbcRSET46/Q4i7eD9WFVD+3DshQS4qBQWAF3H/3hzzL7wnvk2S2aXvafU8jqmA1o8zWZe+YOvrTFL/ziHThJ2VaqiHZBDWk9Ub7llleV3U2j4A97qIo6XEgXkXm5hveeqhHx22yttp46XKmjB9a5xnyVbKY1Tlc4x3sUMmXkMadoCOIBLkd8r9h+3llCjDyWePyINVW+Py5M7VdiY1hUnbMWVCn4KXkEOSviITWQxErEHLRM2KPrLyTPC4xf5cgT8JMCmcvPuLGdAI77pjmcyK+WK+d5LSmSMWYzbFxhaCr+sHrhDaNYr/uq+yQRHY3996u9VHdVpCmcdpMFr5xpHH4Px9uo2qB7a8xvJK8q0q6gSIQiDjj2Yh3CnTmgNXuMAwPwM+GznTRw+88=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(7416005)(366007)(1800799015)(376005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?Nk5qUXpFTjhUMUFjRytqbzNWdHh2aVB3NnRSWmRHZmNQbnZ1YTFBTnRhUXBR?=
 =?utf-8?B?OS81VnJUUDE2YnpwTzNicWR4QlVKV2VtRzcrREtWYXBCMmpWU2hKSzRDUndN?=
 =?utf-8?B?SitsNEp0eDV2Wk1UZVNtM1JRVlhKL3ZoMko5VmgzeFh0VHlwSUJHM1lUeXMz?=
 =?utf-8?B?OWRVMW91UlVHcy85UXlBZU9tTFd2YUJjWE8rWGpDZkZSaUJJSWxPNk02RjVp?=
 =?utf-8?B?ZkszMi9ScldINWZ4WEFrSGZFWEhwQ1NIU1JXT3VId0JyOUYranNmb2NwanVn?=
 =?utf-8?B?WS9mRjlHbDZLTXNwSWUyS1Z6VkNoMnBrNFM4M3UzRm1QczdNVVBETFZMeHcz?=
 =?utf-8?B?SzNoTVVZOGJPRFBmMEQ4aDZEa0svODV0bVZ0M2R6Z0J0YkwxUHR4bXdDVlMw?=
 =?utf-8?B?M25NbHJ2YXlpZW9tVjFkU1RDenBRcEJtM2FqNWcwazRORUg0UmFkTkI1bDhw?=
 =?utf-8?B?WW5xZEEvTDc2Zmx4c1ZaeXExcXF1L2QzUis2OTBac2pQdXdwVzdPUlVYdlJh?=
 =?utf-8?B?VmFhL1RqdlNjMGJENzFtSlQzaCtCY0xZZHVGZHZ0c0t3S2ZpSWJLUlBVcDBX?=
 =?utf-8?B?eUlGK0UrdDV4dmVDNWMzMGs0SmZVYjJpZVhXelRZZlJ3MWROdWd5d0JKSSsv?=
 =?utf-8?B?UTFKT3hFT1gxelJSOEtwYVR3VFN3ZmFBS212Y1VHSmlTaVlaeWJzLzZPSzVr?=
 =?utf-8?B?S0NOaDdyK3dRc0p5TG5JTzBrdmJCbEh2eFBHcE1vQ0YrNjEzY3J5b253ZU00?=
 =?utf-8?B?bkhOUmQ2YnhrbkprN29XbkNvVlJEN3grV1BKOThIVmhQUWIzOUtOZm04Qm5D?=
 =?utf-8?B?OFdQd2tTaTJPSDkyNEViV1l1VXpDTVR2RmtqNFl0aytUNDFOTG9QdkRlUVYw?=
 =?utf-8?B?RDRsbkpvclRUSnhTeHhQb2JaZjE4d0RnWG51MjA1MGJhaFloOTBLbExBWXBN?=
 =?utf-8?B?S2VzRUlPcW93WmVxeVdXQUdFejlSbkw5cnRHMk1YUytuZjFQaTVhSVBWZll5?=
 =?utf-8?B?WFVXa1Y4bWw3UmR0OGhqNThhRWZHT0VWSG9zNXhodWZqK3d0OTdvc3dXd0xF?=
 =?utf-8?B?V0FYaDZrb0lxdnIyeWpWU0FZUmNYWUNxUjQ3dmRyZkRsakJaK0tFdXRuMUw1?=
 =?utf-8?B?ZE1lVURBcDlYUkJjMVlFUlpUYi9YRm1IQ25vL0dkcitibjhiVVF0Ujh0dndP?=
 =?utf-8?B?RmdBWGlmVUdLU3lXMk93Sm5NZWJKOXlvZndEL0R6aVlVdXZMenZVREpwZzRT?=
 =?utf-8?B?T1BBK25KRnVwdWxsS3k4bytWQlVPTDMwVjF0WnVVOXFEZXRlZTEva2h1cS9O?=
 =?utf-8?B?MUl0aEkvOGJISEJic2xraUxlRXNoa0FvVkNkUTg2SFZWU0JoZWlHSW5WdUV5?=
 =?utf-8?B?RHZZQngwSTV4dXdHMVJxZ29nTjVnOTRBMUZCNjA3MU9LOUFXdy80eWRzbExX?=
 =?utf-8?B?VXVmODZqVjQvbTBKRXo4VzJhR2FMQ0g2QXpZUDNwRFpiK0dYOTJjZU5hbVUy?=
 =?utf-8?B?alczdmdhREpMbUYzcDI4TjU5MlJQZVd0SEhOOVRRMFlNOHBxNC9kT2d4NmhF?=
 =?utf-8?B?aGIzTHNCOC9EZzREVEhTWE1OZUhWb2h2bUxXaEhlMC9vbzhlc3hYUFZ0YllG?=
 =?utf-8?B?MXRLMUdkSTZ6cE5jZUdPa2tqSW9JaktaY3hBK1dMbDU2RTlCTDJ0VTZzMHc4?=
 =?utf-8?B?bzlhQ1ljZ0ZhajNFYXg5WEs1cWpOelZBMTkwNEpWU3FkNVp1NXlEWkZtK0F4?=
 =?utf-8?B?cTdDc0FuYXZTeVVCcG1iNEJrd1VlbSt6QjJZeHU1QTJ3QmZxUGI1bDJmWWF6?=
 =?utf-8?B?OWNKTkR2Wjg3azYydjdOb2k2aUxMOTFjSW9vOW5nRlJybFIyMEhVNXBKZGdG?=
 =?utf-8?B?WXY4djJ5WnllaWkxdzV3bDNWTi9kTzVVUWl2cmZ2Q3VzRWJ5MDg2UDdwWUkr?=
 =?utf-8?B?QkxVODY3NTMyc1FoVnB6Vi9FT3Q2Mmx0RE5LM21ZZENndmVkUUoxWEJmOGF5?=
 =?utf-8?B?LzhpZXV1SkRlSHBJRURQcGwzN2hUNGVsNXg3Mm1leHplcHRWdjRaKzF0bUlZ?=
 =?utf-8?B?S29ON3VJbHhhdFl6d0J4RG9kVDlPNmsvZ3UrODgxbzBRNVpmV0NNcURDdDVj?=
 =?utf-8?Q?sByP4iXOfc3xhbj4H9LHdS+8p?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <607090F5CEF3DF4FA19F6E6D4120F4C2@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d176d14-31a5-40bd-d0ce-08dc54d990bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Apr 2024 19:00:59.2162
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 26l5LHY8nCjbO/FtofPAovy4xFOdypGo6fD1CeHn6lHTC6b0JP0CSbJAzqPsTjVoPxlg30UN36pF/6iESf9fb8cA38NN6q+3CanIdPbyxIE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR0P264MB4719
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
Cc: Darren Stevens <darren@stevens-zone.net>, "R.T.Dickinson" <rtd2@xtra.co.nz>, mad skateman <madskateman@gmail.com>, "R.T.Dickinson" <rtd@a-eon.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Matthew Leaman <matthew@a-eon.biz>, Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SGkgQ2hyaXN0aWFuLCBoaSBIYXJpLA0KDQpMZSAwNC8wNC8yMDI0IMOgIDE5OjQ0LCBDaHJpc3Rp
YW4gWmlnb3R6a3kgYSDDqWNyaXTCoDoNCj4gU2hhbGwgd2UgdXNlIENPTkZJR19DUkFTSF9EVU1Q
IHRvIGdldCBpbnQgY3Jhc2hpbmdfY3B1ID0gLTE7Pw0KPiANCj4gRnVydGhlciBpbmZvcm1hdGlv
bjogDQo+IGh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9waXBlcm1haWwvbGludXhwcGMtZGV2LzIw
MjQtTWFyY2gvMjY5OTg1Lmh0bWwgDQo+IDxodHRwczovL2xpc3RzLm96bGFicy5vcmcvcGlwZXJt
YWlsL2xpbnV4cHBjLWRldi8yMDI0LU1hcmNoLzI2OTk4NS5odG1sPg0KDQpMb29raW5nIGF0IHBy
b2JsZW1hdGljIGNvbW1pdCA1YzQyMzNjYzA5MjAgKCJwb3dlcnBjL2tkdW1wOiBTcGxpdCANCktF
WEVDX0NPUkUgYW5kIENSQVNIX0RVTVAgZGVwZW5kZW5jeSIpLCBteSBmZWVsaW5nIGlzIHRoYXQg
dGhlIGNoYW5nZSANCnNob3VsZCBiZSBhcyBmb2xsb3dzLg0KDQpIYXJpLCBjYW4geW91IGNvbmZp
cm0gPw0KDQpkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy84NXh4L3NtcC5jIA0K
Yi9hcmNoL3Bvd2VycGMvcGxhdGZvcm1zLzg1eHgvc21wLmMNCmluZGV4IDQwYWE1ODIwNjg4OC4u
MzIwOWZjOTJhYzE5IDEwMDY0NA0KLS0tIGEvYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy84NXh4L3Nt
cC5jDQorKysgYi9hcmNoL3Bvd2VycGMvcGxhdGZvcm1zLzg1eHgvc21wLmMNCkBAIC0zNjIsNyAr
MzYyLDcgQEAgc3RydWN0IHNtcF9vcHNfdCBzbXBfODV4eF9vcHMgPSB7DQogICNlbmRpZg0KICB9
Ow0KDQotI2lmZGVmIENPTkZJR19LRVhFQ19DT1JFDQorI2lmZGVmIENPTkZJR19DUkFTSF9EVU1Q
DQogICNpZmRlZiBDT05GSUdfUFBDMzINCiAgYXRvbWljX3Qga2V4ZWNfZG93bl9jcHVzID0gQVRP
TUlDX0lOSVQoMCk7DQoNCkBAIC00NjUsNyArNDY1LDcgQEAgc3RhdGljIHZvaWQgbXBjODV4eF9z
bXBfbWFjaGluZV9rZXhlYyhzdHJ1Y3Qga2ltYWdlIA0KKmltYWdlKQ0KDQogIAlkZWZhdWx0X21h
Y2hpbmVfa2V4ZWMoaW1hZ2UpOw0KICB9DQotI2VuZGlmIC8qIENPTkZJR19LRVhFQ19DT1JFICov
DQorI2VuZGlmIC8qIENPTkZJR19DUkFTSF9EVU1QICovDQoNCiAgc3RhdGljIHZvaWQgc21wXzg1
eHhfc2V0dXBfY3B1KGludCBjcHVfbnIpDQogIHsNCg==
