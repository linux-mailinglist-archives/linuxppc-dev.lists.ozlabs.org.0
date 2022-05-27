Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B31536230
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 May 2022 14:17:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L8kM35hzSz3brJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 May 2022 22:17:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::61f; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on061f.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::61f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4L8kLX6PLMz2yxS
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 May 2022 22:16:35 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SCLYtZas1J+OK8bdj0A6qvOBQBeXCt43IVIJMLxizu/q/DA8ZXzVebVCTMfTiGWS/3BbbciepO75U2QTIQ+rf15ShXp+SQR3uNahClgMdhLHnMnIaqbvNGEEM00m+o7tFzip29X9WGl1O6gjZ0mb26lkS98JhtJ9CTbRrqM4TZs6aBvCDpASgghBDLuTl/BlUADv7KeqrMz27dtKf3XpVR1Kx4+ftd505utWVcbw/PANaukl7k7Km4z6x+1hkToyrtCUH5csT4+kyVqMRwLdwx8bAT1lUxPR1EvEkXUiC/7XiyC6OnKPQrpFRUMYsmy9u9LF9tWQhfLurBJ5RffO8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YOH6x3pFPBzJP9WIip/gOQKq0zOjwLR9aciuIb0BcJY=;
 b=ZKUC5haLYBT4k4JtBYT2H2Mw68FfQ861qh336nIAqA8jD4Ufg9v+rxJuNzK+IYPHMr6KFmhy+25hURfaTmzEz0XsID7Jnd665obEgtSLM3NNSRGGnFBkf2izoQQYeb6pWQTtQ/974At1rxWoLfHNpLjKGLD+0Y/p9IFt6AROKbNJhlU7YTxlM4kTiWVV4hbov79S6/lImQdv+Sh04szNwcNG6wG7sCjCdzREcYcqXMV3/L7z6pDsuG9Gfo5faViySZNZxP3RSESQUC6MBcXh+yCBN61YHWN4NhnmJg8z6Expx4zhGwHq9BvtUbcfGa5/+bnXzTiJYbmwGgMJDUzSAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2682.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:1f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Fri, 27 May
 2022 12:16:14 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356%5]) with mapi id 15.20.5293.015; Fri, 27 May 2022
 12:16:14 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH] powerpc/64: Include cache.h directly in paca.h
Thread-Topic: [PATCH] powerpc/64: Include cache.h directly in paca.h
Thread-Index: AQHYcbvfUEtvXgn5jk+V6I1Idg7ELK0yo6MA
Date: Fri, 27 May 2022 12:16:14 +0000
Message-ID: <dbb8260a-ee02-9fd8-707a-92166ba217be@csgroup.eu>
References: <20220527112035.2842155-1-mpe@ellerman.id.au>
In-Reply-To: <20220527112035.2842155-1-mpe@ellerman.id.au>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0aa2cfae-c40d-4a07-78b2-08da3fdab1d0
x-ms-traffictypediagnostic: MRZP264MB2682:EE_
x-microsoft-antispam-prvs:  <MRZP264MB26824CA65DDE7A5B5ED97444EDD89@MRZP264MB2682.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  LYH+LY7ViIclzbtieFPThOlSIVpr47TucyCbv3Y8YviX+UgFDIlQd2dhR39itLKfq8ywUuB6p/ZPAsI9JHNJyDYDKTvjXAqnLgfFnEPJGJL5Q8JMWbdjQdlUyc0RAHdTI56yF1+ZHk2xmYa3E5M8W1FRe7/Njv2WAAE0Svguro8bpQ8Izjz0vZX4WKC1sfa5Aj/2Q9Kj/uXvxxokEpqlTAcULVv7W1Nffv8Oa/PO0A7Ox0nsMEQ1Gq/CP7YKc27FD4uTIOdZhdh5lgAQGxb+sCvt4liBScz5KTuLrj3XmVR2Gv5oWnL714WRUTBppUYA6U2lFw5jfyEaJXqxqSeHL4hiAX//Ug0J0iVWfMIbXWgnpy/yRTskw5nXUzl/KRk3ZpPTi6bWEeXy17EfldrnwRZtuy+tvTjJ1ciS0Cno6YPFJMP46DbKs0VXAIsPHhJG9ZK+jbXen3WzoOa4/ZF6EtM7tEMLIyEaCXtB3S0drkUwOYuFp5yXzOEa9zQWxU9frWaCj2Cy+rfZ1sEhz6ZCzutAXnu/S59EQcePOZC++/Uy2nMjeom9LRvinYdGOetjZOqZ5bK7FkL0oBjnLUK3QmKE4ZzBK40/oGbN7JBvLDQujeRS/KeKbo/p0WSOpFl8LkhYJXHUEuj/gC/BhVB7/fd5loxbjg6MvdlfBcWrPepa/X1NF3obaqlSUd+pDWHDeZWoZqt4rvx30nRmZCITbIAVYdZl9ipUxdO0BU756QtvQz5TkAJBkUqKX9CYD6tXkdALuq72YnUvCp+3d4OuqNQM2dEIOOdiXHI3J3/C2DSD7xqC9Kv7VQY87nrTmaxnRInPU8I83gT6HgfDMuNsptZghe5Q+E4vK+OWCdQnEM8=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(316002)(2616005)(122000001)(110136005)(6506007)(6512007)(966005)(2906002)(5660300002)(26005)(6486002)(8936002)(71200400001)(44832011)(86362001)(31696002)(508600001)(76116006)(8676002)(91956017)(38100700002)(64756008)(83380400001)(66556008)(66476007)(66446008)(66946007)(31686004)(36756003)(186003)(38070700005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?SDl4N1YwMThKbG9DSGkwR29FTnRINkd5SHlieFRYTzdSdlAyRUEydk9IUmNV?=
 =?utf-8?B?M1kwemtaVFNYQmxNcmpuNnZ6ejlGVm5HODF1KzZjVDNIelQvVERnOVY2ZGxi?=
 =?utf-8?B?cVlZbWkzaDZLcE5zMWtiUjErc0Y1R1M2SXV2dVFzVmtyWUxCRU5vSk1VVCsv?=
 =?utf-8?B?c1l5QmxZaTFJZ0g3ZWZ4a3BXbFI4MWpRVFJlM1FXVVRqa3pNeDU2bEt4ZTZD?=
 =?utf-8?B?UUZzUExlZVJuNnFFVG5MUFIvdEllbzQweFBYYnRkc00zUzV6MkpMcFByajNW?=
 =?utf-8?B?K2tZcGRZa0lvSit5NUxMNm1ZeCs0N3JseGlyQXlSQXozQW9yMjV2c0FSM1Fh?=
 =?utf-8?B?dEhRS1o3bVMxWFlQdmRZTzY5RVplY1Ntd0d4cCtjU1VJTU1NS3BPd0tkUEhq?=
 =?utf-8?B?TGwwVnQ2MEtKRE0xSUtENUdhMlVQU0FHNzVjb0g3amdzZkl0Y2czcVUyRVpS?=
 =?utf-8?B?OXd2V0V0NTJUdTloSW8rcExlb08wT1JDWjZUNE9ESERJcTZrSlIwelZMY1BS?=
 =?utf-8?B?MzA0RE43V1NzajRFaFZzaytHNlVUOVAxd0FoemxUa0NyT1Z1QTRhYmNsN08w?=
 =?utf-8?B?TmZDY1hBamJ5dlM2VGpUQTNiaHlMTkk2SHpETFRvMzdic0k3WFFlMTZkOWJu?=
 =?utf-8?B?RWJtS0F6ZURRd3p6LytKejRlaEo1SmlPQ051WXBsU2tQUnlFanRBTnZyUkxN?=
 =?utf-8?B?SmpYblhTemIxcXl6WExxdGxzYUhRR0RCM0pmbzRSMGJwY09JaEZsUmhmVXdW?=
 =?utf-8?B?ODZwVDFpOG93V3VKcjhPUE12Q3o2bWxSa3pLUzBzc3hFV1laU0pRQzE3TXBv?=
 =?utf-8?B?NGk0OWpHYWRtM2dQNlJiVXkyWU14QVpJK1BrRkIvN01PbnpaOVhMUWEyM04y?=
 =?utf-8?B?TTRzdjZnUVZjbSs3dHJOcGNHZUpHdmxmd0p1UUlwSzBMdStCb2xYbzRTa1oz?=
 =?utf-8?B?cFNOTXZMSFk1UzJhQ1laRzd4RTlYMFMyWW5ZeElXNHE0NENxSU16b2lPL0Y5?=
 =?utf-8?B?NUN4Y1pWKzUxR210a0hPZjFkRUQ1cXdYcER1Q3JQdVQzbjZwNTZQRjZmWndI?=
 =?utf-8?B?VTRFaFhBbHNFQ21OZGZPVGN6WlJHdnlKcTdwa3JoZlNZUGJjNHhUaUZQeU5T?=
 =?utf-8?B?YkIwZG9rblh2bzNiMnY5VCtNU1IvWFNJRWJSMWEza3h5cDhxalBYYXJKcW81?=
 =?utf-8?B?akk2ZkR1a2tLekFRbkJEeW1NRnowR0VESnBybDJhRFhvSGowNG85emdhUFZU?=
 =?utf-8?B?TFY5T3lxZlFJdEpLSEZxaHRDUnlyR0lRckFmNzB4dXNkZWROT3dBaUF5M3ZY?=
 =?utf-8?B?NHFzMGo3Rlgxdm56bVFxSjVEYXFaVFF5Y1Z1eFdYaHAxYisraEM5QmhWY0N0?=
 =?utf-8?B?VWo3UEpRYUVSNGwvV0dQZDFKREl3N0t1czRzd29jcWFLMnl0c1pkVUp6Nm4x?=
 =?utf-8?B?VWVnOE8xL2NIaG1ZQmpFWlhTSzA3MlAyMnNDUXI2UFN2Z0tORzJxVzgxMXAw?=
 =?utf-8?B?dy9iN20zVGJjYm5HRHI2V1hDSGJjdUlJdUs3QlcxNjJyVTFjRkFnRmpVcVFI?=
 =?utf-8?B?L29yU2tzNjhaTXBuRkQzV1d4WE9iZkNDcnNPZjU2aXMySEJ3QVZJV3duSUt6?=
 =?utf-8?B?YWx6a013cC85bFNOUW1Say9ic3hka2ltZERNWW5oYUw1OFJaYU96dkpSQklM?=
 =?utf-8?B?a2dYd3lhWWhqK0VxdnF2U3hPNDltM0EyLzcra2QzSFBXM21wOWNrbnp2M1p4?=
 =?utf-8?B?eHJOTU1XQkV1cjAvWmtKbzRLWmo4THZobmFMbnRyMXIySmlNQ0dnclVsUWFQ?=
 =?utf-8?B?VUozWGpPU3cwRFk3TDVoUk41TEt6YnVXL2lha0EwVXM2bFc3cFBDd01WM0h0?=
 =?utf-8?B?LytveFRTemhTNXhYcGQ4R3VqRFkydmU5NjQ5dk9sV092cEl0MkV4bFJyWitC?=
 =?utf-8?B?bmlUN1ZGd1hWekFSL3dyUzhHZ0pRb1FFQnNmQVdkREdlTEtNTlVZTnJBY0lB?=
 =?utf-8?B?Q2FldUt4NW4zSE51UGhHd2xEZkhJSG9tN2tXUVFsZnY1a0RkREtMNlZVcXk3?=
 =?utf-8?B?NHAwSnQ4eGg5YWJUOGtDTmdTeUYycGdLa0RwRXZINzR1S2JCanA3OFlpMFlo?=
 =?utf-8?B?NUk2Z3Rlc01CdFRCaC9MRGlBYnZMbWxLeXcvcVlSalJoWHNpWE9aYXl3M3R6?=
 =?utf-8?B?cmQwWU1Nak1xSUlUY2NPVm1IYWtGOWdXQ242SXlLbE8vYS9CWStjQ2xpaHF6?=
 =?utf-8?B?b1dudENEckVjUmFrNGROaTBOSkltbllMMFFuNzZ4NTFFYnJUNDlyRE5jaGRz?=
 =?utf-8?B?NzN1K21XcXFQcysvejh2YkpXNDZBRUdLZENPbER4bS9LSW1WdGZZdllzVEE1?=
 =?utf-8?Q?6S4VBXICOTvxryfBxSbclVSmHAZ8Xe8eTnOtl?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3D0BAD3E2E15B4459899023295BE20CA@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0aa2cfae-c40d-4a07-78b2-08da3fdab1d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2022 12:16:14.4839
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8t+hOcXL8nX94FvEL0b02AYv5Z7i9WduVp6YGsNErKzXUz/YOAhvadPHQdpTcmF3olCTUNLztgVnUUYRCaR2ioSY+JRMdMgxyPlyEZuVCUU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2682
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

DQoNCkxlIDI3LzA1LzIwMjIgw6AgMTM6MjAsIE1pY2hhZWwgRWxsZXJtYW4gYSDDqWNyaXTCoDoN
Cj4gcGFjYS5oIHVzZXMgX19fX2NhY2hlbGluZV9hbGlnbmVkIHdpdGhvdXQgZGlyZWN0bHkgaW5j
bHVkaW5nIGNhY2hlLmgsDQo+IHdoZXJlIGl0J3MgZGVmaW5lZC4NCj4gDQo+IEZvciBCb29rM1Mg
YnVpbGRzIHRoYXQncyBPSyBiZWNhdXNlIHBhY2EuaCBpbmNsdWRlcyBscHBhY2EuaCwgYW5kIGl0
DQo+IGRvZXMgaW5jbHVkZSBjYWNoZS5oLg0KPiANCj4gQnV0IEJvb2szRSBidWlsZHMgaGF2ZSBi
ZWVuIGdldHRpbmcgY2FjaGUuaCBpbmRpcmVjdGx5IHZpYSBwcmludGsuaCwNCj4gd2hpY2ggaXMg
ZGljZXksIGFuZCBpbiBmYWN0IHRoYXQgaW5jbHVkZSB3YXMgcmVjZW50bHkgcmVtb3ZlZCwgbGVh
ZGluZw0KPiB0byBidWlsZCBlcnJvcnMgc3VjaCBhczoNCj4gDQo+ICAgIGxkOiBmcy9pc29mcy9k
aXIubzooLmJzcysweDApOiBtdWx0aXBsZSBkZWZpbml0aW9uIG9mIGBfX19fY2FjaGVsaW5lX2Fs
aWduZWQnOyBmcy9pc29mcy9uYW1laS5vOiguYnNzKzB4MCk6IGZpcnN0IGRlZmluZWQgaGVyZQ0K
PiANCj4gU28gaW5jbHVkZSBjYWNoZS5oIGRpcmVjdGx5IHRvIGZpeCB0aGUgYnVpbGQgZXJyb3Iu
DQo+IA0KPiBGaXhlczogNTM0YWExZGM5NzVhICgicHJpbnRrOiBzdG9wIGluY2x1ZGluZyBjYWNo
ZS5oIGZyb20gcHJpbnRrLmgiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWVsIEVsbGVybWFuIDxt
cGVAZWxsZXJtYW4uaWQuYXU+DQoNCllvdSd2ZSBnb3Qgb3RoZXIgY2FuZGlkYXRlcyBmb3IgdGhl
IGZpeDoNCg0KJCBnaXQgZ3JlcCAtTCBsaW51eC9jYWNoZS5oIGBnaXQgZ3JlcCAtbCBfX19fY2Fj
aGVsaW5lX2FsaWduZWQgDQphcmNoL3Bvd2VycGNgDQphcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20v
aGFyZGlycS5oDQphcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vaW9tbXUuaA0KYXJjaC9wb3dlcnBj
L2luY2x1ZGUvYXNtL3BhY2EuaA0KYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3Byb2Nlc3Nvci5o
DQphcmNoL3Bvd2VycGMva2VybmVsL3Byb21faW5pdC5jDQoNCkRpc2N1c3Npb24gYXQgDQpodHRw
czovL2xvcmUua2VybmVsLm9yZy9sa21sL2UzYzhiMmJmLWI1NWQtNGMyYy1hMWNmLWQ1ZTk5NDFl
MjZiMEBjc2dyb3VwLmV1L3QvDQoNCkNocmlzdG9waGUNCg0KDQo+IC0tLQ0KPiAgIGFyY2gvcG93
ZXJwYy9pbmNsdWRlL2FzbS9wYWNhLmggfCAxICsNCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKykNCj4gDQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vcGFj
YS5oIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3BhY2EuaA0KPiBpbmRleCAwMzMzMGI3ZDgz
NWYuLjRkN2FhYWI4MjcwMiAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNt
L3BhY2EuaA0KPiArKysgYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vcGFjYS5oDQo+IEBAIC0x
Miw2ICsxMiw3IEBADQo+ICAgDQo+ICAgI2lmZGVmIENPTkZJR19QUEM2NA0KPiAgIA0KPiArI2lu
Y2x1ZGUgPGxpbnV4L2NhY2hlLmg+DQo+ICAgI2luY2x1ZGUgPGxpbnV4L3N0cmluZy5oPg0KPiAg
ICNpbmNsdWRlIDxhc20vdHlwZXMuaD4NCj4gICAjaW5jbHVkZSA8YXNtL2xwcGFjYS5oPg==
