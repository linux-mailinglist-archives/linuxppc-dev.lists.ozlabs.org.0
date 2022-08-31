Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4875A7E76
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Aug 2022 15:16:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MHl6s3S78z3cjH
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Aug 2022 23:16:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=tKvYTtC7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.43; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=tKvYTtC7;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120043.outbound.protection.outlook.com [40.107.12.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MHl683kZ4z2xJ5
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Aug 2022 23:15:27 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H09lkjPIQYjs4f5NEhJKw2Wz1M2Esdbl9SKw14hR6+MbkT0s9JTVAzNH1UBzYJm/F5kclC379pM3v28sYzWsCLSyz1G1akts1ip/08WxTDgI5ROoNhu5g9l7RkXFfn3+sTrZ5XInoOduc5l3j2rc6fzRR7G5Y4pQzOLooZBX6x3KH3Bq+DLTw322zmsXso824Gzg79TOPGlR8J5Z8gVahQO33oK922jD0XnzJjrlO7sbjTxwrHRVAhgtJMreqCM+Rm86k7D/fMok9TAjwwL4iEThcFNeEJ0kgRY0YIRzeemLHiG4m4aqF9r0RJgCgb0Bz7/9yYvCxnMcscf5Z4UN+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rrFlpMnbxsbskB3b5j9B/tEOX1fB3uLEXV+0z2ofw9c=;
 b=njn7SeVpdqAn/erZgOSJu95/xo52fb6OCKfxru67P5md9/Isu9WmeA3Ham2vMwyq0kd+Hu5HvZbggyRAPan30AwS9jNFvtEjrfUrX3Y90keh6Gwq/hDrdlSrDOt/AOlQJuJRriUB0p7BDvca76xA5xZGE10ENTkcu2Ibl+UYhyJ80bHpsMm3a33EchgfMwq/M8fPcJ5s6ZXt/om+IRMF5wlM3mLVwKQFDerkPnkKBr5Ce4hUQet0p4Vn/3CAIAP9rwfpA/pYPcK+Mq8wEj8LSwdhqoeJi/FuQOyAicEi2ZY++6s2JQ/ZFo3bQS31mFi8lPJ1PnMSI+C8uFmTS0QlZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rrFlpMnbxsbskB3b5j9B/tEOX1fB3uLEXV+0z2ofw9c=;
 b=tKvYTtC7F6h6AQjp+q5CD+OaiUktM+oErrFaT4JuDvExWlG5ujsY1ZX/54S0zPJ1xp5J044jUfFZIHD2N5J+dI76zCIlvbATtnh39aeZ2nUbcTe9Uu0jPyV+roihmdSPHnSPWca/i5jz65PrFXO0sYuPLi2ExilooOPHNWBDiUoxMQPRc4EbF4Md61zZQ1ii/eWNdtOBB88JFQEDOIbmmZWBqv/Yo3gZZhmUlSbGnypRky7PdoEtyu4bPlrR1yaVO8L0lKX4T+mgXjBrbqkgqHN7Lscwynv1R8bUlxcR4piiBkwXEmIVn2owaSnlUdyw8SqdoE7x3/JkZe1eTYEofQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB1911.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:16::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Wed, 31 Aug
 2022 13:15:08 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8%4]) with mapi id 15.20.5588.010; Wed, 31 Aug 2022
 13:15:08 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH] Revert "powerpc/irq: Don't open code irq_soft_mask
 helpers"
Thread-Topic: [PATCH] Revert "powerpc/irq: Don't open code irq_soft_mask
 helpers"
Thread-Index: AQHYvTstR1XXPJya10adjErZL0NfIa3I/OqA
Date: Wed, 31 Aug 2022 13:15:08 +0000
Message-ID: <6d1fd14f-a957-9fb2-ca12-a233b27f4740@csgroup.eu>
References: <20220831131052.42250-1-mpe@ellerman.id.au>
In-Reply-To: <20220831131052.42250-1-mpe@ellerman.id.au>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ba3f44d9-c801-447b-aa97-08da8b52d403
x-ms-traffictypediagnostic: MRZP264MB1911:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  +Pp3Vfu3w7vZQ4we/RcjoOJ4KBUHpdvUt4zigoOZjqoQWWbARIOBjrsosaayTGZt1H1bGXBbbnjvrdIuJWEMaD3cxREbKmjm3yIsEEIwQj7bm+or5Q5VvMmYxHN8QZ8XIL2zKHs7EAfsT8WpC+WcGiPeHOt1+qkKcyuC8ZW2QdB5kqkdI+5q6FVj/8d181AEzp2nRR9rVcponPp9JTDu51yqj2HsZ1mjIK0dPLWVuiBIMJ6wPXXwZqb654rAaENv31upygHVJk5bMarpYIt66exfp3zbZ0DUTQ4V9/jKLlhp9MEX91SscFC6QboAeINt1ZYD4xAynSF+lAbywB89cyolhjCcVYWvCg2fl90R3r4ILdCsgb7FYeyASDD51uVjbJgwTKPEPuyYNdeMuKL8U4hG2iKxEjPpuT/EgY7UGnooGRt746pzYKOOoTakITDZE/EiEmd5abmEEF1h6obnNVYC0EmYnapUor9pI0g0G20sXcDn3TNsTEED1H8BkoROav2tKgUSPd2FmN9AuajLf+btkVo/hKjlo5ywenHB64SNSrjopDkjFFB1ygcU+6w/zgz3yOAYjN9EaZ6rPIqye3/PFIgy+qBKsrPUF18WV7csvIopQLsToCdPRb7edQP6b18t6Ra48fjKyS4eI9iXRMsy4IeJTnLv8RhPU6HFLQMhWT+foxFfYDl+OHrTO5NhlvONvQl4OLeIN7SE89mv32XivJtqrq2wP/pctoRsHUN8ZPF8XRuCRaDdi+5OK5X6MtjI+ymd4Qf9DX5BWrCOabxfOj8OczgEnFwAaRn5I2VB/BJnepmpGsdMQJsKbtgSQ35e+E1m/w1sC44yTY8qrA==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(346002)(39840400004)(366004)(396003)(26005)(38100700002)(122000001)(316002)(41300700001)(44832011)(5660300002)(6512007)(478600001)(31696002)(8936002)(38070700005)(86362001)(31686004)(8676002)(6486002)(2906002)(66446008)(66946007)(54906003)(4326008)(76116006)(66476007)(6506007)(110136005)(64756008)(66556008)(66574015)(91956017)(2616005)(186003)(83380400001)(36756003)(71200400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?b2Rqand4RjN0aFM0OVhqQ05rOHZvTmRWTzZmeHN4OC9YeC8vT0dyNmNyci9w?=
 =?utf-8?B?TllEK212TUxtUVg2eVJwcFF4VFArY3BZdkRROVloY0xINzMxdml5MG1ZdHhn?=
 =?utf-8?B?Y0dMNGpvN29wVUFlSysyWWZndmhjNUFyejBSejdySEtTbGYwZmRvRG1WdEdG?=
 =?utf-8?B?bVNHWWxyc2J1bExMZCt2ZmRZekE5Z1RPZlJpZFg0QWtGUXBsU2JXdnJaZnNU?=
 =?utf-8?B?a2YyTTNOeE9la3IyWXVKaUU3eVlnQmUwMnpnQ0xvU0JXV0s3dHlMY3hkV2cz?=
 =?utf-8?B?Q283dGFLM1d6alVUR1BLVGVrcXBRRktkeHJHNkZLb0FzQ0VLUWVWZHlXbTQw?=
 =?utf-8?B?S05DYkZKaGZpZUZoQUNiYlJEbWFaM2d6bzRFSzJBQTBuQUlBbDVvZFF5NDZD?=
 =?utf-8?B?dE5HZUdJbGt4TGNrRkgyTEpPMkU5WCtaV2lYOTVzbTN2N3RmSFJ6TE84QjdC?=
 =?utf-8?B?ZTVkS1hnT2pJdzNLRDhJVk1jZHpTRGkyVmE0OEhoN2ZNUmxuRm5raDNYRzVZ?=
 =?utf-8?B?L0ZmVCtWNG5BYm1qN2JGL01GYWRlMy91ZWJlZXRIcXpkRytyNmZ3UndRc0FS?=
 =?utf-8?B?S3hqRnFza2I4TTFiWFhyTnZZSEFBN0lvOFRxSjBZWnVBdHBkaTI1eHZXTVpF?=
 =?utf-8?B?NXZJaDRxZFVwS2RsSnhWbU5lRHh4WXBCUXFMaml5bkJtaUJ2dGxWT0Q3c2hV?=
 =?utf-8?B?L1ZMSjZ0eW9BVzZqUzg5ZGM1eURWRWNSdjd4a1VLckYyd0hJbFV3VzBrc0F3?=
 =?utf-8?B?V3NsT05Vd2lYRHJTTExQWXltU3dtdEhDazduRkZtd1FLTmRSM25NcmZmbmZW?=
 =?utf-8?B?UFZ6WTlSdkxLbDNCNm0veWkvZFNSQmZscEZyZ2pVWGZ3cXBBUGtjbEZPVmJY?=
 =?utf-8?B?RTc1bG1LK1B4ZEdHTTNXUWthRkxDN09kN2lpempZVFVHVU05QlFWWVZpR29J?=
 =?utf-8?B?Ky81OS96STNCeXZFL1NJQ095ck9nLzV2dmFlY1FIcEJJdmxIc0diNG5Cazdl?=
 =?utf-8?B?T1lVN2lXdXdzY0I1RGYzeHU3cEFWOHVwSSttQzJWMXovSGdUdUw0UkZtQ2Zx?=
 =?utf-8?B?a2RDNWJDcVJ3aDF0K1hrNEZSdlJ5WnpibnBMNmhTWitBQTZnVjhlYUxSUklX?=
 =?utf-8?B?VTVudnJhUnlKcTA2Rkc3UzJZV0JWUlFJOGlrM21ZOHd2eFFab1lzRG5JcUVu?=
 =?utf-8?B?K2ZueUd3eGV6K0w3N2xIc1VsZzMvS0VibGlQS0NOcEVBNzFsbTZMMjFnS01G?=
 =?utf-8?B?dGp6ZlBQcUdVci94Z004ZG4xd3RsUzhjeXZQZ0t4NzRJWGVZbUpUNFB0ZGMz?=
 =?utf-8?B?UE03SzdwWDVqcWFEQWQxMTkyZDlXMTI3MktaekRxUUhsSzU1dVNxcy9NQi9Y?=
 =?utf-8?B?ekF4V0dPZWNjVFJQbkJwRGp0dnY0QlpmcXdnaGZTUVUyb2MvNHNlaHJzZ3Ft?=
 =?utf-8?B?ajl5eHRzYm9BbE1NK09URDdDY1lwYnZNa0kzVnJCS0RDR1JsNmFQV3dnd0Fk?=
 =?utf-8?B?cnEzQ3ZYaDRYZ1pTeU9LZ1hhcWw1eTcrMTl5WmRReURuZUJsMUpBa0FLU00v?=
 =?utf-8?B?UlE0WWpSWit3YThvY2M4MXRic3lsODFiVlRwdzBGK0JCUXNpTkNGNkJSUEdR?=
 =?utf-8?B?ZzVJNVppQ3F0Z2lZVTZRZE4weDZPMUpJbTFTYkVFcFY1Y1hOMUF3bGErbTBU?=
 =?utf-8?B?blR6bndlZjZVMUtBKzlycjFzK1RYN0ZYZzM5N3p0enBDTjlHYlN4RTJ3L0Rm?=
 =?utf-8?B?TTJkL1NKeEwxUVV6b21waGxkVmtmVnZqa3NMY2ovNDN1TnNPaldWU3FDNEl5?=
 =?utf-8?B?R1MxSktFaTR4QlowMC9kZ1hXc2lFNG1qY0ZOMVp2YS94T3FJSXFJTmVzOHRI?=
 =?utf-8?B?UUhFZStHeW52V2xSL0lzOCtkb0xMbTBrUDhGM0tGQndwYWlmRTlVNjlZNE5W?=
 =?utf-8?B?bFd3T3FuY2hDMVpzWFFzMEpSOE56eC9aekZ2UTQ2T2ZtVHA0bVU0WDA3aTdU?=
 =?utf-8?B?a09GOEp3NDRQYnI4MFJUd2syNnJCdm1IVzhiVGs1Y004alY3bDNHQlQ5QUdI?=
 =?utf-8?B?Y1hyU3dXcHFzb2Q5QTVnT0ZVdE0xWm5BYk0wSDQ2c3pBQittYjlRV201QUpk?=
 =?utf-8?B?WVdLQ1NvV3dBVldWVlMyNFlKclY3Y1RUdVhSSTRCVkYxbkFjcGtxcXZUNG9T?=
 =?utf-8?Q?j23WAR6W4jEhwOAhLS3H6Uc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <94670FA08D695447AE9C20E6BE90CF59@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ba3f44d9-c801-447b-aa97-08da8b52d403
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2022 13:15:08.6779
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ouG2T5NpB1OwPaqvAqmH84UuYFGTOetBhCF32O6pAL7qgJm0av8jlS3tScoubcnX7/I2aZzkNs1+29ptD9/img0cy1pVJgo5rlavXKrZAX8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB1911
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
Cc: "zhouzhouyi@gmail.com" <zhouzhouyi@gmail.com>, "npiggin@gmail.com" <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDMxLzA4LzIwMjIgw6AgMTU6MTAsIE1pY2hhZWwgRWxsZXJtYW4gYSDDqWNyaXTCoDoN
Cj4gVGhpcyByZXZlcnRzIGNvbW1pdCBlZjViNTcwZDM3MDBmYmI4NjI4YTU4ZGEwNDg3NDg2Y2Vl
YjcxM2NkLg0KPiANCj4gWmhvdXlpIHJlcG9ydGVkIHRoYXQgY29tbWl0IGlzIGNhdXNpbmcgY3Jh
c2hlcyB3aGVuIHJ1bm5pbmcgcmN1dG9ydHVyZQ0KPiB3aXRoIEtBU0FOIGVuYWJsZWQ6DQo+IA0K
PiAgICBCVUc6IHVzaW5nIHNtcF9wcm9jZXNzb3JfaWQoKSBpbiBwcmVlbXB0aWJsZSBbMDAwMDAw
MDBdIGNvZGU6IHJjdV90b3J0dXJlX3JlYS8xMDANCj4gICAgY2FsbGVyIGlzIHJjdV9wcmVlbXB0
X2RlZmVycmVkX3FzX2lycXJlc3RvcmUrMHg3NC8weGVkMA0KPiAgICBDUFU6IDQgUElEOiAxMDAg
Q29tbTogcmN1X3RvcnR1cmVfcmVhIFRhaW50ZWQ6IEcgICAgICAgIFcgICAgICAgICAgNS4xOS4w
LXJjNS1uZXh0LTIwMjIwNzA4LWRpcnR5ICMyNTMNCj4gICAgQ2FsbCBUcmFjZToNCj4gICAgICBk
dW1wX3N0YWNrX2x2bCsweGJjLzB4MTA4ICh1bnJlbGlhYmxlKQ0KPiAgICAgIGNoZWNrX3ByZWVt
cHRpb25fZGlzYWJsZWQrMHgxNTQvMHgxNjANCj4gICAgICByY3VfcHJlZW1wdF9kZWZlcnJlZF9x
c19pcnFyZXN0b3JlKzB4NzQvMHhlZDANCj4gICAgICBfX3JjdV9yZWFkX3VubG9jaysweDI5MC8w
eDNiMA0KPiAgICAgIHJjdV90b3J0dXJlX3JlYWRfdW5sb2NrKzB4MzAvMHhiMA0KPiAgICAgIHJj
dXRvcnR1cmVfb25lX2V4dGVuZCsweDE5OC8weDgxMA0KPiAgICAgIHJjdV90b3J0dXJlX29uZV9y
ZWFkKzB4NThjLzB4YzkwDQo+ICAgICAgcmN1X3RvcnR1cmVfcmVhZGVyKzB4MTJjLzB4MzYwDQo+
ICAgICAga3RocmVhZCsweDFlOC8weDIyMA0KPiAgICAgIHJldF9mcm9tX2tlcm5lbF90aHJlYWQr
MHg1Yy8weDY0DQo+IA0KPiBLQVNBTiB3aWxsIGdlbmVyYXRlIGluc3RydW1lbnRhdGlvbiBpbnN0
cnVjdGlvbnMgYXJvdW5kIHRoZQ0KPiBXUklURV9PTkNFKGxvY2FsX3BhY2EtPmlycV9zb2Z0X21h
c2ssIG1hc2spOg0KPiANCj4gICAgIDB4YzAwMDAwMDAwMDI5NWNiMCA8KzA+OglhZGRpcyAgIHIy
LHIxMiw3NzQNCj4gICAgIDB4YzAwMDAwMDAwMDI5NWNiNCA8KzQ+OglhZGRpICAgIHIyLHIyLDE2
NDY0DQo+ICAgICAweGMwMDAwMDAwMDAyOTVjYjggPCs4PjoJbWZsciAgICByMA0KPiAgICAgMHhj
MDAwMDAwMDAwMjk1Y2JjIDwrMTI+OglibCAgICAgIDB4YzAwMDAwMDAwMDA4YmI0YyA8bWNvdW50
Pg0KPiAgICAgMHhjMDAwMDAwMDAwMjk1Y2MwIDwrMTY+OgltZmxyICAgIHIwDQo+ICAgICAweGMw
MDAwMDAwMDAyOTVjYzQgPCsyMD46CXN0ZCAgICAgcjMxLC04KHIxKQ0KPiAgICAgMHhjMDAwMDAw
MDAwMjk1Y2M4IDwrMjQ+OglhZGRpICAgIHIzLHIxMywyMzU0DQo+ICAgICAweGMwMDAwMDAwMDAy
OTVjY2MgPCsyOD46CW1yICAgICAgcjMxLHIxMw0KPiAgICAgMHhjMDAwMDAwMDAwMjk1Y2QwIDwr
MzI+OglzdGQgICAgIHIwLDE2KHIxKQ0KPiAgICAgMHhjMDAwMDAwMDAwMjk1Y2Q0IDwrMzY+Oglz
dGR1ICAgIHIxLC00OChyMSkNCj4gICAgIDB4YzAwMDAwMDAwMDI5NWNkOCA8KzQwPjoJYmwgICAg
ICAweGMwMDAwMDAwMDA2MDliOTggPF9fYXNhbl9zdG9yZTErOD4NCj4gICAgIDB4YzAwMDAwMDAw
MDI5NWNkYyA8KzQ0PjoJbm9wDQo+ICAgICAweGMwMDAwMDAwMDAyOTVjZTAgPCs0OD46CWxpICAg
ICAgcjksMQ0KPiAgICAgMHhjMDAwMDAwMDAwMjk1Y2U0IDwrNTI+OglzdGIgICAgIHI5LDIzNTQo
cjMxKQ0KPiAgICAgMHhjMDAwMDAwMDAwMjk1Y2U4IDwrNTY+OglhZGRpICAgIHIxLHIxLDQ4DQo+
ICAgICAweGMwMDAwMDAwMDAyOTVjZWMgPCs2MD46CWxkICAgICAgcjAsMTYocjEpDQo+ICAgICAw
eGMwMDAwMDAwMDAyOTVjZjAgPCs2ND46CWxkICAgICAgcjMxLC04KHIxKQ0KPiAgICAgMHhjMDAw
MDAwMDAwMjk1Y2Y0IDwrNjg+OgltdGxyICAgIHIwDQo+IA0KPiBJZiB0aGVyZSBpcyBhIGNvbnRl
eHQgc3dpdGNoIGJlZm9yZSAic3RiICAgICByOSwyMzU0KHIzMSkiLCByMzEgbWF5DQo+IG5vdCBl
cXVhbCB0byByMTMsIGluIHN1Y2ggY2FzZSwgaXJxIHNvZnQgbWFzayB3aWxsIG5vdCB3b3JrLg0K
PiANCj4gVGhlIHVzdWFsIHNvbHV0aW9uIG9mIG1hcmtpbmcgdGhlIGNvZGUgaW5lbGlnaWJsZSBm
b3IgaW5zdHJ1bWVudGF0aW9uDQo+IGZvcmNlcyB0aGUgY29kZSBvdXQtb2YtbGluZSwgd2hpY2gg
d2Ugd291bGQgcHJlZmVyIHRvIGF2b2lkLiBDaHJpc3RvcGhlDQo+IHByb3Bvc2VkIGEgcGFydGlh
bCByZXZlcnQsIGJ1dCBOaWNrIHJhaXNlZCBzb21lIGNvbmNlcm5zIHdpdGggdGhhdC4gU28NCj4g
Zm9yIG5vdyBkbyBhIGZ1bGwgcmV2ZXJ0Lg0KPiANCj4gUmVwb3J0ZWQtYnk6IFpob3V5aSBaaG91
IDx6aG91emhvdXlpQGdtYWlsLmNvbT4NCj4gW21wZTogQ29uc3RydWN0IGNoYW5nZSBsb2cgYmFz
ZWQgb24gWmhvdXlpJ3Mgb3JpZ2luYWwgcmVwb3J0XQ0KPiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWVs
IEVsbGVybWFuIDxtcGVAZWxsZXJtYW4uaWQuYXU+DQo+IC0tLQ0KPiAgIGFyY2gvcG93ZXJwYy9p
bmNsdWRlL2FzbS9od19pcnEuaCB8IDQzICsrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0N
Cj4gICAxIGZpbGUgY2hhbmdlZCwgMzYgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkNCj4g
DQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vaHdfaXJxLmggYi9hcmNo
L3Bvd2VycGMvaW5jbHVkZS9hc20vaHdfaXJxLmgNCj4gaW5kZXggM2M4Y2I0OGY4OGFlLi45ODM1
NTE4NTk4OTEgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9od19pcnEu
aA0KPiArKysgYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vaHdfaXJxLmgNCj4gQEAgLTExMyw3
ICsxMTMsMTQgQEAgc3RhdGljIGlubGluZSB2b2lkIF9faGFyZF9SSV9lbmFibGUodm9pZCkNCj4g
ICANCj4gICBzdGF0aWMgaW5saW5lIG5vdHJhY2UgdW5zaWduZWQgbG9uZyBpcnFfc29mdF9tYXNr
X3JldHVybih2b2lkKQ0KPiAgIHsNCj4gLQlyZXR1cm4gUkVBRF9PTkNFKGxvY2FsX3BhY2EtPmly
cV9zb2Z0X21hc2spOw0KPiArCXVuc2lnbmVkIGxvbmcgZmxhZ3M7DQo+ICsNCj4gKwlhc20gdm9s
YXRpbGUoDQo+ICsJCSJsYnogJTAsJTEoMTMpIg0KPiArCQk6ICI9ciIgKGZsYWdzKQ0KPiArCQk6
ICJpIiAob2Zmc2V0b2Yoc3RydWN0IHBhY2Ffc3RydWN0LCBpcnFfc29mdF9tYXNrKSkpOw0KPiAr
DQo+ICsJcmV0dXJuIGZsYWdzOw0KPiAgIH0NCj4gICANCj4gICAvKg0KPiBAQCAtMTQwLDI0ICsx
NDcsNDYgQEAgc3RhdGljIGlubGluZSBub3RyYWNlIHZvaWQgaXJxX3NvZnRfbWFza19zZXQodW5z
aWduZWQgbG9uZyBtYXNrKQ0KPiAgIAlpZiAoSVNfRU5BQkxFRChDT05GSUdfUFBDX0lSUV9TT0ZU
X01BU0tfREVCVUcpKQ0KPiAgIAkJV0FSTl9PTihtYXNrICYmICEobWFzayAmIElSUVNfRElTQUJM
RUQpKTsNCj4gICANCj4gLQlXUklURV9PTkNFKGxvY2FsX3BhY2EtPmlycV9zb2Z0X21hc2ssIG1h
c2spOw0KPiAtCWJhcnJpZXIoKTsNCj4gKwlhc20gdm9sYXRpbGUoDQo+ICsJCSJzdGIgJTAsJTEo
MTMpIg0KPiArCQk6DQo+ICsJCTogInIiIChtYXNrKSwNCj4gKwkJICAiaSIgKG9mZnNldG9mKHN0
cnVjdCBwYWNhX3N0cnVjdCwgaXJxX3NvZnRfbWFzaykpDQo+ICsJCTogIm1lbW9yeSIpOw0KPiAg
IH0NCg0KT25seSB0aGUgYWJvdmUgY2hhbmdlcyBuZWVkIHRvIGJlIHJldmVydGVkLCBiZWxvdyBv
bmVzIHNob3VsZCByZW1haW4gYXMgDQp0aGV5IGFyZS4NCg0KPiAgIA0KPiAgIHN0YXRpYyBpbmxp
bmUgbm90cmFjZSB1bnNpZ25lZCBsb25nIGlycV9zb2Z0X21hc2tfc2V0X3JldHVybih1bnNpZ25l
ZCBsb25nIG1hc2spDQo+ICAgew0KPiAtCXVuc2lnbmVkIGxvbmcgZmxhZ3MgPSBpcnFfc29mdF9t
YXNrX3JldHVybigpOw0KPiArCXVuc2lnbmVkIGxvbmcgZmxhZ3M7DQo+ICAgDQo+IC0JaXJxX3Nv
ZnRfbWFza19zZXQobWFzayk7DQo+ICsjaWZkZWYgQ09ORklHX1BQQ19JUlFfU09GVF9NQVNLX0RF
QlVHDQo+ICsJV0FSTl9PTihtYXNrICYmICEobWFzayAmIElSUVNfRElTQUJMRUQpKTsNCj4gKyNl
bmRpZg0KPiArDQo+ICsJYXNtIHZvbGF0aWxlKA0KPiArCQkibGJ6ICUwLCUxKDEzKTsgc3RiICUy
LCUxKDEzKSINCj4gKwkJOiAiPSZyIiAoZmxhZ3MpDQo+ICsJCTogImkiIChvZmZzZXRvZihzdHJ1
Y3QgcGFjYV9zdHJ1Y3QsIGlycV9zb2Z0X21hc2spKSwNCj4gKwkJICAiciIgKG1hc2spDQo+ICsJ
CTogIm1lbW9yeSIpOw0KPiAgIA0KPiAgIAlyZXR1cm4gZmxhZ3M7DQo+ICAgfQ0KPiAgIA0KPiAg
IHN0YXRpYyBpbmxpbmUgbm90cmFjZSB1bnNpZ25lZCBsb25nIGlycV9zb2Z0X21hc2tfb3JfcmV0
dXJuKHVuc2lnbmVkIGxvbmcgbWFzaykNCj4gICB7DQo+IC0JdW5zaWduZWQgbG9uZyBmbGFncyA9
IGlycV9zb2Z0X21hc2tfcmV0dXJuKCk7DQo+ICsJdW5zaWduZWQgbG9uZyBmbGFncywgdG1wOw0K
PiArDQo+ICsJYXNtIHZvbGF0aWxlKA0KPiArCQkibGJ6ICUwLCUyKDEzKTsgb3IgJTEsJTAsJTM7
IHN0YiAlMSwlMigxMykiDQo+ICsJCTogIj0mciIgKGZsYWdzKSwgIj1yIiAodG1wKQ0KPiArCQk6
ICJpIiAob2Zmc2V0b2Yoc3RydWN0IHBhY2Ffc3RydWN0LCBpcnFfc29mdF9tYXNrKSksDQo+ICsJ
CSAgInIiIChtYXNrKQ0KPiArCQk6ICJtZW1vcnkiKTsNCj4gICANCj4gLQlpcnFfc29mdF9tYXNr
X3NldChmbGFncyB8IG1hc2spOw0KPiArI2lmZGVmIENPTkZJR19QUENfSVJRX1NPRlRfTUFTS19E
RUJVRw0KPiArCVdBUk5fT04oKG1hc2sgfCBmbGFncykgJiYgISgobWFzayB8IGZsYWdzKSAmIElS
UVNfRElTQUJMRUQpKTsNCj4gKyNlbmRpZg0KPiAgIA0KPiAgIAlyZXR1cm4gZmxhZ3M7DQo+ICAg
fQ==
