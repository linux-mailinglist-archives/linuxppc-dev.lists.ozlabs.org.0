Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBC76223E8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Nov 2022 07:20:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N6Zb30Dd4z3f3h
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Nov 2022 17:20:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=avcrQ/mw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.74; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=avcrQ/mw;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120074.outbound.protection.outlook.com [40.107.12.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N6ZXD34LQz3cMb
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Nov 2022 17:18:04 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f94Q5HN9l2XsqkI6f3szxWa5WNG80Vm0qhmX+Dkb78vh3O6z1QYrow2echQOQsVYZcRtnK6RCHI4bxWKK/34YGTsHkGJi5OMdSf8DoIM172A8DzAM+OPWZHMN3wN8nccH0qfl1QKGwTwJywx9qjjhbVFBY1TuQSfnjSfhnjOXZrpKG2fc6pPNcRT227/YZ946X/ImtsKPQuq97jynf/bd6YqLE7I5CLfSqCV00U4+LlziIqTr1RHAHmx6wgRj5Yfemb/zmHJs6QRCPwor/nO0A0hTaNXVf+IDj5oHjJUG3vG+tY6WVu/Y8ngC4aF+JPJd5xVF/LOeG2gN5pNjA2kig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fNBBKaA927ejQu05pG7NRnsH9oN4vbElWzKjII7QO/Q=;
 b=R6HF3V6J92NlrscOib2ADLtgQQ9lMeOQ5SKN8/+Eu/ioCJ6+h9xPSHtmqqlpNIZpzBN5OrySYGC2Ou3WU7LPQ3DiHHgRG+rJW3dsapBoQCUQpprujgKv7GTp4rdvitCJHE0FY7i/OMGYwOIsqPKy/DjQMwYgjl3vbxZCMetMQ29V3TvgH+2UoBkq60PND4gNx/GgbUYhTQ0C1uuH1An1n1TTXdUvZpzvV+3M7rxTQtOZUpiSXxP7TkR/T7ktHDzwhIaBnOX76EK2dGUefGqT8vDHK0yRK/D0I8BYye4ivl6Y1CtLg+SyJVtFWtfcDnfv8Ytzxjik25iT9Zqhj4CQsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fNBBKaA927ejQu05pG7NRnsH9oN4vbElWzKjII7QO/Q=;
 b=avcrQ/mwpQ0utSw0Saei/WNUt8BkyEna/8HtfvcjBK/BTddBmSg0JnYtzc8Uqq+WwsL9HSoSdG21xOPPDXmDyblVo8iMKHI6AGXRbqWnPMYN0m15a/QGc7mewRdJ4Ys812QL5L2F5jtpwCplu9vaSStMRfBDs5mXFTUsI6m7T9kxbm0AWS2eFc0B6ZG8bvj6SiNM0VYsXi8qq7LCOA+o2iZ8riWLk3Nm+nxk9/dUPy8h7GAW5GiLyY8uui7ZLQmgOKqesSB6EdBjX9wIeGN4qVFL7RxkHAFg32mq36UpXsSvjpunuI/exgXUPIPPlo5bBcCcgF+4ij99RQrlA+Duqw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB1865.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:16e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Wed, 9 Nov
 2022 06:17:45 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6%9]) with mapi id 15.20.5791.027; Wed, 9 Nov 2022
 06:17:45 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Gray <bgray@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v10 6/9] powerpc/mm: Remove flush_all_mm,
 local_flush_all_mm
Thread-Topic: [PATCH v10 6/9] powerpc/mm: Remove flush_all_mm,
 local_flush_all_mm
Thread-Index: AQHY8/b4YbcxYfOKr0Sq18BJe+uKlq42HgcA
Date: Wed, 9 Nov 2022 06:17:45 +0000
Message-ID: <99b1bab2-5bf4-a1ff-25fa-24db1d1a15ff@csgroup.eu>
References: <20221109045112.187069-1-bgray@linux.ibm.com>
 <20221109045112.187069-7-bgray@linux.ibm.com>
In-Reply-To: <20221109045112.187069-7-bgray@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB1865:EE_
x-ms-office365-filtering-correlation-id: 4c6d8716-afde-46c6-6647-08dac21a1e09
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  SQQHn8CxeKFcPPGWur2zu9+02C9+5I4HpHKXBX3KO8QEocFzR+wmNHhG5h305P9/2hyzmq4Qhb+rO7PeXtWa2sUVhyJW0Q7ilMHP3+21jh8SaJ4dsFsCwfGndyZBS70fyUjxEHBZiYpGYpjeIHeuCV8KLOgFenn+LZjRVTi8iiGCvkrnLZhUhVFLHp2P4pE1+gOxB9IR/X/n6l6uVjrTsYIAAkgViKrK1+FISEats4f5fgBc4kb4dLNyH7+lHLv0WevkzF/eEAdhasEXWo5v9hET9+tdxkuZ8OfH/W8XdgD0VC600bUkrTBo69eD0CGTDUd3zouN123pnUAXZhZfyBa0qiqdNhzshWigPUFyZyDlTdbYxq6X2nR48QK1T5x0oVMlK/vMgT+xD9sUhewJPYzkDQIdNC1LUx6rvN7TwUWOsD1Uhom4+i7EdpHVfmDvadJoRrYOvfed1sfOP3mHe9zBQUUcoyQD7Ldj33SA/yb/4JUev+30sQFBVpJ57ohJ2jy2ZVgpP68nV2jN5vQViBfzoDOelrFD+R/c/EWTvtv8nfcA6aYKtcAdAe97WRXId7TPSxextsmImWmR7N6jkAguOmm4or8tLfEART0WBHxYBeF7tosGdW63Ix/R4y4l+rKa3TfrlAJg/4RPnWKxok0/GPRuVFM1+jS0BFSQhOZST2CUys0pEwrVDQaukk9NRZ2amWUV2jXY2/zYAYIsd4deK4rPIjzPyDrkgsY5bGffXbfiUvMEJoXKxYpUC+7quWNff/l3vvbN7nn7LtmmTX+1pPvZJQ20DTBOIS4qpRmH977WH5KFj9VJ/jBnwUyh8UUnsIHz4E1lbVUQfeEJdrc++wBCL1iGfCkPt737geY=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(366004)(396003)(39860400002)(136003)(451199015)(91956017)(8676002)(86362001)(66946007)(4326008)(66446008)(64756008)(66476007)(76116006)(31696002)(316002)(966005)(66556008)(6506007)(6486002)(478600001)(2616005)(66574015)(186003)(26005)(36756003)(54906003)(110136005)(38100700002)(6512007)(38070700005)(83380400001)(122000001)(8936002)(71200400001)(5660300002)(44832011)(31686004)(2906002)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?QTNqZUZmY1ZVTFp4UTRhY2o0SXQ2cW4rVW5EU2I5NnhncEdmcE4vY1F0cHRK?=
 =?utf-8?B?cTMyQ1hxU2FCUU9PY3V2ZXN6cjR0dVpSQlA2b2crdmQrRWdOSWpwMDFnMnR5?=
 =?utf-8?B?NE5YTzlLdE1hVm1JblFQYXhqVGFtRG9nQzBaREdyVVN0U0dSL0RiTThUS3lG?=
 =?utf-8?B?NDhsZ1JpYm9IMnR5SGY1cCtmVEE2SFRUenhGWDh0cEVKc1Vwb1htSG5MWkRk?=
 =?utf-8?B?cWtmMW9oaGlGQy9HZ1BhdXIwK1U5K0RLNU9hdnp6S2VKZUZEVUhxTDFCcG13?=
 =?utf-8?B?R2tQVlVUd0cxdVRtTklncVYxelRpeTFDaTZVeTd5RzZIU29XdmUzc2UvQkx3?=
 =?utf-8?B?MHhObnBNQmtaZnU2MmRyNjIxL0xWdldCWXFBeUhhdnJlZ2JPNE9OWGM1ck5U?=
 =?utf-8?B?Yy9MV2s2amVvZGpwbHJwb3hQZ2EzQWQvb00weWhIQmFoWDV6ek40NmpKenZN?=
 =?utf-8?B?UTdLSzJwTWlpeEhqVEFEaHhQZ1pPbnZRRDZrVVVxN2tKMTZXaWw5MEpqUnpo?=
 =?utf-8?B?UzRHUVByN1RtVFNvQXFGOXgzNmNsTGZxY0lvY3pjMDVvVm5UTnVFaW96cjk1?=
 =?utf-8?B?QWowUHAyY0M4NWZsUUVUZWlTZEpWL2wxdS9aeUhjRVAzRFpDRGdwYmlJVUtl?=
 =?utf-8?B?aE8ySTY4QitKRHVCeGx1Nk1pVkFvNDdnY0VIM1hMaUJwYVZaRU1lNkxJNDZV?=
 =?utf-8?B?YXMwS1pTc0R3cHJOMWVHTUx6Q1lqVzArRE1wM1NWYVhQcDlCOWpMdFJ6Zmxi?=
 =?utf-8?B?OUk3YnNPUW5RdnVhTkZhcU9PSkExV1NkdzVFZEVUR0tmUnA4aEI3TkVzckNv?=
 =?utf-8?B?di9CRGdqYjhFZVZhWHhmYWYwY1hWRThWZHRnSmZBUStrQm80QzQ5R1B2NkVZ?=
 =?utf-8?B?TVNBUWg3aHJPR0dONFNnUlcvN0ZjOWZlVkcvSFFwQ0l1VjM2WGdFanNxTXFi?=
 =?utf-8?B?QnBSa3JUK2NTWWxId2taYnQzcU8rTFZNT1VhVStTRnpyb1krZE9yK2Y1aUtI?=
 =?utf-8?B?T0Fob3h6Yk1NckE4MDZEcC9Ka3NjYVJWRFJhSmdhb01reE5yNmFPLzBwcS8r?=
 =?utf-8?B?cHJLU0ZKMHFxRnNRZzZ5UGQwQU5GdXdSbDhBcHlRL2tvMXcwSUtEc0RtSjBJ?=
 =?utf-8?B?OTJ6U21IRHhtMTlWS2NuMFp2K3lHUkROdkFTdEx1QkRDK0h1MFZrOE1GYWxU?=
 =?utf-8?B?bHBXc3VzUlpRdjRxSEdoZ28zOVN0Y094SG9MUG9ObWFTVnJkTDArbVlmWStW?=
 =?utf-8?B?eEVkTEU5diswWkVSQVl3K3J2WWVoWi9xSzh0ZmlFSWVmTmdhbXJNeVhmQmNt?=
 =?utf-8?B?eFlveFRYNkJmZzZJelg4cHdoWGJwNGJlbU5EdlVCbjNYTG82OXBmM0FnZ2Yx?=
 =?utf-8?B?bHQvSlNYR0d1bGxKNW5PbVUyNXkxdHA3YnpRRHM1cE1YYlpyRHN2UzZIN2NQ?=
 =?utf-8?B?STJlb24xWEdmY3l5c0FjSHFoNERKUkVCd0JJVmNpNS9USCsvVGwwQjdxQVRj?=
 =?utf-8?B?bHNkYUJBamluUXY5VTdES3EzeXRuYWlvQ2pQaml0ejJGWmdSUHY5TGxaYzJE?=
 =?utf-8?B?bm5yQnIwblZXRUxFVVYrUUhyaE8xMVZZUWcwblJYMm1Ra3ZCakhYS0Y5cUhK?=
 =?utf-8?B?S0lpaXVpNS9QdnEzM2VXOEYxQlRhakoxOUpXdVpBKythMU1RUFRzRW1wV2J0?=
 =?utf-8?B?WGlVK3A2dmpkY2NnVzNMWUtWWXVYcnNPQ0ROZFNobHdwaldLRjlkcElEYW8r?=
 =?utf-8?B?NnBZdGFoVEk0Rk1nR3NCN0JraUdDL0krajR2b1RYaXNseGFyRmwvUTJBUWhx?=
 =?utf-8?B?NFZRdE15cFYzMTFvVURiNXhsaC83bFJyQ1hRWDJrSkR3d214a25aMWVXaVc1?=
 =?utf-8?B?dWI2WmNzSWNZNTl4L0hiTDNGdkFtNGFyUGZ1NVh6aStTWTZ4OGpiOGt3L3Az?=
 =?utf-8?B?SGE4d201QzUyT21rT2FQVWgxK0JUZVZUZC9uTHAvS25ERkFzL01ienpLb2xz?=
 =?utf-8?B?U2JKU3hndjdHL015aEZhcmhIN3hFR21SWkw4TWwydHVEeWZlSDZhVmdQWTZt?=
 =?utf-8?B?My9PU3p3cSs5ZnRBazFaREJJSStHZ2ZrMlpYZE16bVhJYWhRNHpLZ3J5VDl0?=
 =?utf-8?B?NFZQMEZLYlZUR3JSYS94NXQxQlVtRWpDK000Y21CRWVCN09jWHFFVVVKVHhU?=
 =?utf-8?Q?Pog/jZPazak2pvYAJL2lT6U=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <245742A5F7F0104988244A3F5CA4255D@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c6d8716-afde-46c6-6647-08dac21a1e09
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2022 06:17:45.4593
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EW8fznD2Fk1UxBRmmaVrEpn0M33Cpw88Gbb/nZEqrTkwM1qMEQZ1FdN54+QpiEwNDU7On6zz8frgF9v97cPlWG0hqsMAoWvzuDFzwf6bsgY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB1865
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
Cc: "jniethe5@gmail.com" <jniethe5@gmail.com>, "cmr@bluescreens.de" <cmr@bluescreens.de>, "ajd@linux.ibm.com" <ajd@linux.ibm.com>, "npiggin@gmail.com" <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA5LzExLzIwMjIgw6AgMDU6NTEsIEJlbmphbWluIEdyYXkgYSDDqWNyaXTCoDoNCj4g
VGhlc2UgZnVuY3Rpb25zIHdlcmUgaW50cm9kdWNlZCBmb3IgImN4bDogRW5hYmxlIGdsb2JhbCBU
TEJJcyBmb3IgY3hsDQo+IGNvbnRleHRzIiBbMV0sIHdoaWNoIGVuZGVkIHVwIHVzaW5nIHRoZW0g
Zm9yIFJhZGl4IG9ubHkuIFRoZXkgd2VyZSBuZXZlcg0KPiBpbXBsZW1lbnRlZCBvbiBIYXNoIChh
bmQgY3JlYXRpbmcgYW4gaW1wbGVtZW50YXRpb24gYXBwZWFycyB0byBiZQ0KPiBkaWZmaWN1bHQp
LCBzbyBub3RoaW5nIGNhbiBhY3R1YWxseSByZWx5IG9uIHRoZW0uDQo+IA0KPiBUaGV5IGJlaGF2
ZSBkaWZmZXJlbnRseSB0byB0aGUgZXhpc3Rpbmcgc3Vycm91bmRpbmcgZnVuY3Rpb25zIHRvbywg
aW4NCj4gdGhhdCB0aGV5IGFjdHVhbGx5IG5lZWQgdG8gZG8gc29tZXRoaW5nIG9uIEhhc2guIFRo
ZSBvdGhlciBmdW5jdGlvbnMNCj4gYXJlIHByaW1hcmlseSBmb3IgdXNlIGluIGdlbmVyaWMgY29k
ZSB0aGF0IGV4cGVjdHMgdGhlaXIgZGVmaW5pdGlvbnMsDQo+IGJ1dCBIYXNoIHVwZGF0ZXMgdGhl
IFRMQiBkdXJpbmcgUFRFIHVwZGF0ZXMuDQo+IA0KPiBBZnRlciByZXBsYWNpbmcgdGhlIG9ubHkg
dXNhZ2Ugd2l0aCB0aGUgUmFkaXggc3BlY2lmaWMgdmVyc2lvbiwgdGhlcmUNCj4gYXJlIG5vIG1v
cmUgdXNlcnMgb2YgdGhlc2UgZnVuY3Rpb25zLCBhbmQgZ2l2ZW4gdGhleSBhcmUgbm90IGltcGxl
bWVudGVkDQo+IGFueXdheSBpdCBpcyBzYWZlIHRvIGRlbGV0ZSB0aGVtLg0KPiANCj4gWzFdOiBo
dHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvbGludXhwcGMtZGV2L3BhdGNoLzIw
MTcwOTAzMTgxNTEzLjI5NjM1LTEtZmJhcnJhdEBsaW51eC52bmV0LmlibS5jb20vDQo+IA0KPiBT
aWduZWQtb2ZmLWJ5OiBCZW5qYW1pbiBHcmF5IDxiZ3JheUBsaW51eC5pYm0uY29tPg0KDQpHb29k
IGNsZWFudXANCg0KDQpSZXZpZXdlZC1ieTogQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5s
ZXJveUBjc2dyb3VwLmV1Pg0KDQoNCg0KPiAtLS0NCj4gdjEwOgkqIE5ldyBpbiB2MTAgdG8gcmVt
b3ZlIHRoZSBoYXNoX18gc2V0IG9mIGZ1bmN0aW9ucw0KPiAtLS0NCj4gICAuLi4vaW5jbHVkZS9h
c20vYm9vazNzLzY0L3RsYmZsdXNoLWhhc2guaCAgICAgfCAyMiAtLS0tLS0tLS0tLS0tLS0tLS0t
DQo+ICAgYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Jvb2szcy82NC90bGJmbHVzaC5oIHwgMTUg
LS0tLS0tLS0tLS0tLQ0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgMzcgZGVsZXRpb25zKC0pDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Jvb2szcy82NC90bGJmbHVz
aC1oYXNoLmggYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYm9vazNzLzY0L3RsYmZsdXNoLWhh
c2guaA0KPiBpbmRleCAzOGQzMWMyNDg5ZDMuLmNkYmIxYTA0YmI1MiAxMDA2NDQNCj4gLS0tIGEv
YXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Jvb2szcy82NC90bGJmbHVzaC1oYXNoLmgNCj4gKysr
IGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Jvb2szcy82NC90bGJmbHVzaC1oYXNoLmgNCj4g
QEAgLTU5LDI4ICs1OSw2IEBAIHZvaWQgZmx1c2hfaGFzaF9yYW5nZSh1bnNpZ25lZCBsb25nIG51
bWJlciwgaW50IGxvY2FsKTsNCj4gICB2b2lkIGZsdXNoX2hhc2hfaHVnZXBhZ2UodW5zaWduZWQg
bG9uZyB2c2lkLCB1bnNpZ25lZCBsb25nIGFkZHIsIHBtZF90ICpwbWRwLA0KPiAgIAkJCSB1bnNp
Z25lZCBpbnQgcHNpemUsIGludCBzc2l6ZSwgdW5zaWduZWQgbG9uZyBmbGFncyk7DQo+ICAgDQo+
IC1zdGF0aWMgaW5saW5lIHZvaWQgaGFzaF9fbG9jYWxfZmx1c2hfYWxsX21tKHN0cnVjdCBtbV9z
dHJ1Y3QgKm1tKQ0KPiAtew0KPiAtCS8qDQo+IC0JICogVGhlcmUncyBubyBQYWdlIFdhbGsgQ2Fj
aGUgZm9yIGhhc2gsIHNvIHdoYXQgaXMgbmVlZGVkIGlzDQo+IC0JICogdGhlIHNhbWUgYXMgZmx1
c2hfdGxiX21tKCksIHdoaWNoIGRvZXNuJ3QgcmVhbGx5IG1ha2Ugc2Vuc2UNCj4gLQkgKiB3aXRo
IGhhc2guIFNvIHRoZSBvbmx5IHRoaW5nIHdlIGNvdWxkIGRvIGlzIGZsdXNoIHRoZQ0KPiAtCSAq
IGVudGlyZSBMUElEISBQdW50IGZvciBub3csIGFzIGl0J3Mgbm90IGJlaW5nIHVzZWQuDQo+IC0J
ICovDQo+IC0JV0FSTl9PTl9PTkNFKDEpOw0KPiAtfQ0KPiAtDQo+IC1zdGF0aWMgaW5saW5lIHZv
aWQgaGFzaF9fZmx1c2hfYWxsX21tKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tKQ0KPiAtew0KPiAtCS8q
DQo+IC0JICogVGhlcmUncyBubyBQYWdlIFdhbGsgQ2FjaGUgZm9yIGhhc2gsIHNvIHdoYXQgaXMg
bmVlZGVkIGlzDQo+IC0JICogdGhlIHNhbWUgYXMgZmx1c2hfdGxiX21tKCksIHdoaWNoIGRvZXNu
J3QgcmVhbGx5IG1ha2Ugc2Vuc2UNCj4gLQkgKiB3aXRoIGhhc2guIFNvIHRoZSBvbmx5IHRoaW5n
IHdlIGNvdWxkIGRvIGlzIGZsdXNoIHRoZQ0KPiAtCSAqIGVudGlyZSBMUElEISBQdW50IGZvciBu
b3csIGFzIGl0J3Mgbm90IGJlaW5nIHVzZWQuDQo+IC0JICovDQo+IC0JV0FSTl9PTl9PTkNFKDEp
Ow0KPiAtfQ0KPiAtDQo+ICAgc3RydWN0IG1tdV9nYXRoZXI7DQo+ICAgdm9pZCBoYXNoX190bGJf
Zmx1c2goc3RydWN0IG1tdV9nYXRoZXIgKnRsYik7DQo+ICAgDQo+IGRpZmYgLS1naXQgYS9hcmNo
L3Bvd2VycGMvaW5jbHVkZS9hc20vYm9vazNzLzY0L3RsYmZsdXNoLmggYi9hcmNoL3Bvd2VycGMv
aW5jbHVkZS9hc20vYm9vazNzLzY0L3RsYmZsdXNoLmgNCj4gaW5kZXggMjI1NGE0MGYwNTY0Li5j
NTZhMGFlZTgxMjQgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ib29r
M3MvNjQvdGxiZmx1c2guaA0KPiArKysgYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYm9vazNz
LzY0L3RsYmZsdXNoLmgNCj4gQEAgLTg2LDEzICs4Niw2IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBs
b2NhbF9mbHVzaF90bGJfcGFnZShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwNCj4gICAJCXJh
ZGl4X19sb2NhbF9mbHVzaF90bGJfcGFnZSh2bWEsIHZtYWRkcik7DQo+ICAgfQ0KPiAgIA0KPiAt
c3RhdGljIGlubGluZSB2b2lkIGxvY2FsX2ZsdXNoX2FsbF9tbShzdHJ1Y3QgbW1fc3RydWN0ICpt
bSkNCj4gLXsNCj4gLQlpZiAocmFkaXhfZW5hYmxlZCgpKQ0KPiAtCQlyZXR1cm4gcmFkaXhfX2xv
Y2FsX2ZsdXNoX2FsbF9tbShtbSk7DQo+IC0JcmV0dXJuIGhhc2hfX2xvY2FsX2ZsdXNoX2FsbF9t
bShtbSk7DQo+IC19DQo+IC0NCj4gICBzdGF0aWMgaW5saW5lIHZvaWQgdGxiX2ZsdXNoKHN0cnVj
dCBtbXVfZ2F0aGVyICp0bGIpDQo+ICAgew0KPiAgIAlpZiAocmFkaXhfZW5hYmxlZCgpKQ0KPiBA
QCAtMTEyLDE3ICsxMDUsOSBAQCBzdGF0aWMgaW5saW5lIHZvaWQgZmx1c2hfdGxiX3BhZ2Uoc3Ry
dWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsDQo+ICAgCWlmIChyYWRpeF9lbmFibGVkKCkpDQo+ICAg
CQlyYWRpeF9fZmx1c2hfdGxiX3BhZ2Uodm1hLCB2bWFkZHIpOw0KPiAgIH0NCj4gLQ0KPiAtc3Rh
dGljIGlubGluZSB2b2lkIGZsdXNoX2FsbF9tbShzdHJ1Y3QgbW1fc3RydWN0ICptbSkNCj4gLXsN
Cj4gLQlpZiAocmFkaXhfZW5hYmxlZCgpKQ0KPiAtCQlyZXR1cm4gcmFkaXhfX2ZsdXNoX2FsbF9t
bShtbSk7DQo+IC0JcmV0dXJuIGhhc2hfX2ZsdXNoX2FsbF9tbShtbSk7DQo+IC19DQo+ICAgI2Vs
c2UNCj4gICAjZGVmaW5lIGZsdXNoX3RsYl9tbShtbSkJCWxvY2FsX2ZsdXNoX3RsYl9tbShtbSkN
Cj4gICAjZGVmaW5lIGZsdXNoX3RsYl9wYWdlKHZtYSwgYWRkcikJbG9jYWxfZmx1c2hfdGxiX3Bh
Z2Uodm1hLCBhZGRyKQ0KPiAtI2RlZmluZSBmbHVzaF9hbGxfbW0obW0pCQlsb2NhbF9mbHVzaF9h
bGxfbW0obW0pDQo+ICAgI2VuZGlmIC8qIENPTkZJR19TTVAgKi8NCj4gICANCj4gICAjZGVmaW5l
IGZsdXNoX3RsYl9maXhfc3B1cmlvdXNfZmF1bHQgZmx1c2hfdGxiX2ZpeF9zcHVyaW91c19mYXVs
dA==
