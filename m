Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E8355F64C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 08:14:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXrlS2PbBz3ccy
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 16:14:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=0f4UsVmK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.43; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=0f4UsVmK;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120043.outbound.protection.outlook.com [40.107.12.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LXrkj20fZz3bm0
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jun 2022 16:13:46 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i+CFFqnUfxfpCYxmMkOyz60gM+qPI6DXNU5MN99QD3xzFtQ3d1ypHM9cR+fkOiN3rz3Bh4clEKqL2S9+jIt82PiKS1jDKDjb4a2cHFQ8XrKuNqRaGRtjDGbo3/eyRmQDKhG7s5XyKIqFrcAqZKM26VOz56V3RJsfop80dlH2e0gm+mcnaZkMhFlsQ4eiHDpykDCAg2C+W2ZVegwM8kv0zhCMJ2uhIsaYcBywC40PL/Oxg1cNmv5J7DQkIEK/zuG3xziUIsc78sZ7LgVPuZKEgvI0ykmfTHHPlx6ZObGrNg+OzB3NkvZ6oGIDJtEqkU4qFPs8IglgWFqg4V/eAgbltw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hEXPqY+mx3qvNvIsuiA+f7TBHYQc4678K80leub1Otg=;
 b=Rp/x9LI6LkB5PIWbxnRF1uNlGd8UNPhlLrfxBMXIMEAAPUQMe/kL5XUowdSlfA7iIthyGiejcnddbDYOuxsaa3AN9gKcB1K5o6uyv5+OO/PXEY34bBJ1VK4+5UJdRmCtoVuzFASF/k9gn21eIaocNBzcHEUEnoulxX1QIfshHS+zs4NkZ0CvzDjwWWur0LrLsS0WV3cMj1lAO/01L3sBDjq9yDOY9VFlQvHvcbNx5Ajrgp1CMuxlOoDWesXkOd5Tpq6hHeD0iCWQ96haaLEyvA6qHgbpk2qEkPXcTxC0T304+JZtOAaMrZSQ/Xw4q/23tw0+2aMCej5qrHm8VM6oCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hEXPqY+mx3qvNvIsuiA+f7TBHYQc4678K80leub1Otg=;
 b=0f4UsVmK3/rxeBScJocq6YGvJ+LHEjdIM3iF8HqDHGws0QOzDtNaN6jHn6m1AeEiLFwrfN/JSti/up3aINGJUY86TNLhR8ecJnsuFg60B1G/cp+LWhTvXC6cgidRu6mqKx7bvn5yOyhrXMnaoxk5KoIfFQyr08zQTTtPxj8ydCy965B2hvDPQPc4K7/Ucn7A0l5ndyNbQbLJ59op6dwKN9tp0nLet8p8IWXjAz4BzUlI2VT2s/UDZ7w5Dt0bgIYS8F2z7rneyvCw886nzKxnRYGDy45kMm49GEIkkhK1U117rUzzGX1paooMyby/CxqZahZsXGFOTYSMYLT1nz0UzQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB1710.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1b6::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Wed, 29 Jun
 2022 06:13:27 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e10e:bd98:2143:4d44]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e10e:bd98:2143:4d44%3]) with mapi id 15.20.5373.022; Wed, 29 Jun 2022
 06:13:27 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH] powerpc: Update reviewers
Thread-Topic: [PATCH] powerpc: Update reviewers
Thread-Index: AQHYi36m2XfG/AUDhESVJtpsiBuVxK1l57IA
Date: Wed, 29 Jun 2022 06:13:27 +0000
Message-ID: <0be5115a-b795-3e09-7b34-b6413ee04f6f@csgroup.eu>
References: <20220629060817.2943966-1-mpe@ellerman.id.au>
In-Reply-To: <20220629060817.2943966-1-mpe@ellerman.id.au>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 78b351c2-b79e-4da9-d267-08da59967b21
x-ms-traffictypediagnostic: PR1P264MB1710:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  Gtk9S03WvV/wvi790N2RarV0Ue/8jcI37Iy+8Rymqtk4q3gjWImzvrGCKNuao6B03zqpYY32+DxzrklY2gx1U1hPh1+RZkBdbqBoZy/Bl+aMb9t3iZy+SqmYXUhou650D2X3Nt9ZgcklOuj1D/mcX3T3skXqW6Rh0DKzWqTcm9fN+WUnao52YOfhhwnqUE3uiuu51yldwcrejC12CVG8VWnBKeFGyNu7iBZKAfX0LvLByTUUUs/ngAMgihXYyqaPk3OD3YPG5mZudGrI/2uGQHKiTd5xMNHqdXK3IwWaqO8YUtSBZ9UI+tUrLMUonMAkTss5omu+nx05y/l4FkLLmK8A+JUokDQK5XgdDSdMuFOk05iiIqheUTHBl6AdHxTRsAtCQtDYLZGN7hjHKqIUrh8Ji0G5+lbkkLQpWY2dyNo6qN9RfW8fUWW7rZEaA2TjfbpQ/iCByUZgVCMhBde53QBRadBnLpuzM+ifXiwaTN24LhaiQwap+TdOvp8kT8+m3I313luc82cNBl13AVBRnax1SOHQYdmhKuRvF3CwQphduUfc5ph/U9GSdEvpYAjl/WH+mPAhfMGTR3dHv6ThC4C2TRm5G5J6VF5o2ptsUSS5E8evK5ofB0EN8E3xS/wKTfXAab9/YKvN/NrdtqDBj18sVldGyZOFxgYWAqOhtjLBKdVhVVicIApZr5/coGy5aOy7fAB7ibIDuSRC7Ik5n8JQ2tcJLrYKwERyOePeNfWQfnTG0o5QDTWXTE0I4jYtagYwyAiI9PZwp1aFjfdNTc7L6he7z9Ewdmju/C3ZjsAcgSFrHoQNL8Z+hbyDjEVdcatWGzMqap9gpC5kQbk5Uv9WYRcFOI6uaFcKM6RzNEygSbY2m047RWrs6dmtLnMGOucrimBo1HHtQfk5PWzoow==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(136003)(366004)(396003)(39860400002)(41300700001)(6486002)(966005)(8676002)(64756008)(71200400001)(66556008)(66476007)(76116006)(6512007)(186003)(6506007)(2906002)(83380400001)(54906003)(26005)(66446008)(8936002)(2616005)(66946007)(86362001)(31686004)(91956017)(4326008)(5660300002)(478600001)(4744005)(316002)(44832011)(110136005)(36756003)(38100700002)(38070700005)(31696002)(122000001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?aFFUaWRiTmJnUk5mMlZjbFIzby9hN0ErcHZ6SzU2NXYyOUoxQmpPSEN0Y2RO?=
 =?utf-8?B?blBoNzl5QzdDdmF0TjdJN3NueWZNaFU2MDBtNEUrRE8rUGMyOEZUZzdpQXIw?=
 =?utf-8?B?aE1lbTFiM1dqMHNsZnJmWjcvUE5mVDhrRzJNZC9LRG1kbzg0RmEvZFlrSnF2?=
 =?utf-8?B?aFFzNlR2aWFNVUY1YVFGK0R2VEdLalAreXM4eDdpMG8yUGJxR2kyVnM3RVFC?=
 =?utf-8?B?c0JreHpia2tyT2c3MnFIWnFCUzlGdnVGdGFYTmtCUkg1dzM0UU1TSHhEZmds?=
 =?utf-8?B?YTBFY09hZSt3ZFRQbTVFTGNiejRrbTl2SG8vQ0JWZHdyM0ZhR3I2d2NGa0tN?=
 =?utf-8?B?UFBBTlQvYi9pNnVldUM5dFF3YUQ4eW5NVSs2bUdwS3JLUEgxRDEwQTBScFFv?=
 =?utf-8?B?V2swN1lKTS94YkphV2Era1p0MklNeUJHU1NYZzdSbFNFeXN6WDFZRlJnMkJo?=
 =?utf-8?B?aFpiMWVlV0svK0liNDh4clVnY3RpT2E1enpUdGxPVDRkMXdFRnlDODgxRGF6?=
 =?utf-8?B?cHpneDFJeGJKQTV0cUNDN29pZzB6S3hHd2pKSVAxbEQvWG1vc0dPSk1CYk5m?=
 =?utf-8?B?YllQc1daN3d2RFMzWit0T2ZBZ2pVMGxoZG9qYjhndk5NWi9ubER1cW1jOFlz?=
 =?utf-8?B?eHU3aUVtVjAwOW9zOXRFS25XcFFrR3dVTi9pbVhRWlNZYWpEaUEybHpSa1Uy?=
 =?utf-8?B?ZWpHU1E1cDFYaUMzb3M3Q0hHZEw4R2pkYkpyOU90cldtYWU4eDFyUll0YTY5?=
 =?utf-8?B?Z21jSVU3NHlVSUxmaCt2bERpRjI1cWxSWVFzL1Zsd1JWYWR4K2grZHFTb0VR?=
 =?utf-8?B?MnhvbTNGY1A2TXF2SGpzaUd0emgxZGllYk1IVUMrRjhQVGNxV29Gald4b3I0?=
 =?utf-8?B?Q3E0Nk8rNmprRVhPT29LUVZGUGFQRnQ2d2lFQTRuSFc3M0dpY0crTlBucGNY?=
 =?utf-8?B?ZFlYSDlOQXZiRmpiMU80YkVPdm1WN0hsQ0puaTIva21wVWpVTHNuWWoyeTlz?=
 =?utf-8?B?eXIxbHE0TmxCSkdQbFdDRjU0SHVFdWhpTm5xWjhWa3ZKbmwyZXBFZmh2NXNn?=
 =?utf-8?B?Q3BOMkJiMDRIaU0wYXdHd2lENVpvOVVyOWNRMzJnb2Rja1owQWdtMkRsU09I?=
 =?utf-8?B?TzJxendZOGxLQWl1emlCTWJUMmJrZ3FaemFwVHVWTG1Kd21nMzhZYVpvRFNZ?=
 =?utf-8?B?SkxPUU5yZ0NPMlE1cHliZTE2RnpGR0Q2WTR1QjA3WTJkQzhDYWlaaG5zb0VV?=
 =?utf-8?B?aU1lT25BUXVrd3NMSG1oRlp1QmdrejNWVVJncHVqSGRGWDdvbDFNVFBoaTBY?=
 =?utf-8?B?aFM5WlROSS9BNG01WXRWOEpJeGhNdWFQM1VqVWpCMkFjZHJzc1FqOXBqVTdn?=
 =?utf-8?B?REZGWlFYQjkxckxTdGdBSmowKzdJNTkrd3NEWk1CMXFIRnJUai84Nzd5d3RW?=
 =?utf-8?B?OWpKQ0Iyb1Z3bVBEVzI4cWwya0pDalF2aU90bXY5czdRcUtmMjU1RzdBNytJ?=
 =?utf-8?B?NGltR1QxL2UxL1locUZmMmViYVdnZWo5aVJ4bjVsMUpoVUY1VnJqQjFaTitw?=
 =?utf-8?B?NGJ6eGlzdU42R1Z5bWpaRVRpV0NtTy83KzlNZTM4MTN5aEJsVnpvU0JHR1VT?=
 =?utf-8?B?OVZvcEt3ZEg3Y1hXWGlJaEtjWWlXK3BlVzFrVnNJRUQ5TjFtSUsxY2YrNUp4?=
 =?utf-8?B?aFl6dWMrL3hpcHdJNnNmWlRaWTNFQWE4TnVTOWtwSUIrVzVaZWUzM0FnUDg5?=
 =?utf-8?B?cGNrdkRoQnFaL0piT1NRRk9heitDN29wbGo5azJTd0U0aUVZZCtTYVg5MTBt?=
 =?utf-8?B?SkVJMmxxVkJrZ3VkVlIrVTUzeXdLdkFtK2FXNDdMeldzcFNzalhiajZjK2sr?=
 =?utf-8?B?ZXhSTzNUWjNRVzE1bHpQUEJZZkJsRTVRNTI1bTVUdmswTFR2dW1NUzAzZUND?=
 =?utf-8?B?RmJ1bDV2a3hPWXlaOEdSVm5idEg5RWQ2MkdvaE1XaUlieGh6ampRV1hMOEI0?=
 =?utf-8?B?dzZ4NWlZRHQ2MEZ2TXdBWVhRZDNsRXF4aW1Fb3ZwcEdZVmJiWWtHcjMzTWZy?=
 =?utf-8?B?ZlJjTnBOdis2a1hZS1Z3SWpEV0EwekVSWHRVVzRVTjkyZkV0ZU83RE1NWWZj?=
 =?utf-8?B?dlQ2YVQybkE3RERjdUNJQ2lUc2VSWk5Mck9kVSs1TFVmekZjQS85MzBIZVBK?=
 =?utf-8?Q?CWrIQGwzioA12mKKvT8EFk0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D0C3446EE9C7B24D8184F024D1688CC8@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 78b351c2-b79e-4da9-d267-08da59967b21
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2022 06:13:27.1813
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Yiv5fcuwF6NC+SywfFaRZM36BagZ2YaQTTUj/awbdmaCuC/OcU3uy2FFdn3aZijYLqQOdhkLZZSyhSVkKyf+VY1yOEeLw6DCr5TGErqHp/c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB1710
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
Cc: "paulus@samba.org" <paulus@samba.org>, "npiggin@gmail.com" <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI5LzA2LzIwMjIgw6AgMDg6MDgsIE1pY2hhZWwgRWxsZXJtYW4gYSDDqWNyaXTCoDoN
Cj4gQ2hyaXN0b3BoZSBhbmQgTmljayBoYXZlIGJlZW4gYWN0aXZlIGluIHJlY2VudCB5ZWFycyBv
biB0aGUgbWFpbGluZyBsaXN0DQo+IGFuZCBtYWtpbmcgY29udHJpYnV0aW9ucywgYWRkIHRoZW0g
YXMgcmV2aWV3ZXJzLg0KPiANCj4gUGF1bCBhbmQgQmVuIGFyZSBubyBsb25nZXIgYWN0aXZlbHkg
cmV2aWV3aW5nIHBvd2VycGMgcGF0Y2hlcywgcmVtb3ZlDQo+IHRoZW0gZnJvbSB0aGUgcmV2aWV3
ZXJzLCB0aGV5J3JlIHN0aWxsIG9uIGxpbnV4cHBjLWRldiBpZiBuZWVkZWQuDQo+IA0KPiBTaWdu
ZWQtb2ZmLWJ5OiBNaWNoYWVsIEVsbGVybWFuIDxtcGVAZWxsZXJtYW4uaWQuYXU+DQoNCkFja2Vk
LWJ5OiBDaHJpc3RvcGhlIExlcm95IDxjaHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+DQoNCj4g
LS0tDQo+ICAgTUFJTlRBSU5FUlMgfCA0ICsrLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL01BSU5UQUlORVJT
IGIvTUFJTlRBSU5FUlMNCj4gaW5kZXggMWZjOWVhZDgzZDJhLi5hZjRjZmVlYzlkMGYgMTAwNjQ0
DQo+IC0tLSBhL01BSU5UQUlORVJTDQo+ICsrKyBiL01BSU5UQUlORVJTDQo+IEBAIC0xMTM0NSw4
ICsxMTM0NSw4IEBAIEY6CWRyaXZlcnMvbWFjaW50b3NoLw0KPiAgIA0KPiAgIExJTlVYIEZPUiBQ
T1dFUlBDICgzMi1CSVQgQU5EIDY0LUJJVCkNCj4gICBNOglNaWNoYWVsIEVsbGVybWFuIDxtcGVA
ZWxsZXJtYW4uaWQuYXU+DQo+IC1SOglCZW5qYW1pbiBIZXJyZW5zY2htaWR0IDxiZW5oQGtlcm5l
bC5jcmFzaGluZy5vcmc+DQo+IC1SOglQYXVsIE1hY2tlcnJhcyA8cGF1bHVzQHNhbWJhLm9yZz4N
Cj4gK1I6CU5pY2hvbGFzIFBpZ2dpbiA8bnBpZ2dpbkBnbWFpbC5jb20+DQo+ICtSOglDaHJpc3Rv
cGhlIExlcm95IDxjaHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+DQo+ICAgTDoJbGludXhwcGMt
ZGV2QGxpc3RzLm96bGFicy5vcmcNCj4gICBTOglTdXBwb3J0ZWQNCj4gICBXOglodHRwczovL2dp
dGh1Yi5jb20vbGludXhwcGMvd2lraS93aWtp
