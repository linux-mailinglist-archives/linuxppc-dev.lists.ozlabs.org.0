Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C5358E8DD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Aug 2022 10:35:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M2jvC1MD1z2xtw
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Aug 2022 18:35:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=FupZ3UCi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.45; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=FupZ3UCi;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120045.outbound.protection.outlook.com [40.107.12.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M2jtQ3GXDz2xJL
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Aug 2022 18:35:09 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nr6+4C910l3xaFHV9Mp1zTd19jVTHXDu8E6E05jT0KSvkbdqC+xWR22qaO+KUacl1tWg5gnJjV9XCQsBW/YXInhq7yaVU3PGtrQGCTt3FgOWcZBKufbkx2aIyRR/z1yjGH/4GXYcvP/zr3C/h+n0RNbOglFFpTOehrZ6VHnkFa344JpIc/0g+f0qpiDyQ1miWn31JcmrLNAZZGuf7vRZT9VJoOqyHEXLB0P5IpJgOTlpbmxXZNUP+c6wxMS3tOoFtSCW0cevonDFUzfYE5feKskJYIliU2/VylPDyqvFousr8WXQWyk1ApknEE/ViL0zFjjPiWsVm9VNk8t1WdSfUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XCm7wAJNCr++soKlk4gATBRC05QURAHWxoY7v7nVJns=;
 b=j+dFoudVwsXjrNmFQh129BOh5SuSgbxe8OpbjcgzIJcCH6Cj/HdFzFXpznCaXLWITduDfoU/cgNS9ldW5oXTRoY+ILj0QOlNUFFeq4DuS0kR0/vq5rWUBVz3xNWmrsSTTfuTkyxQeSj61mT+VcxoC0TaaIJFPBZ2aM5CsH0+gU/Aauviifhl6O0VIPskBZx0ZTlMnrjkIlxOh2Q8Bw2fxHH60nKmHTh+t9bFs/Cpg8jeSFq4ByNcL+DoEAN5Nm3Po8QKDYj1GlcQJKcFhmWk7cjKoMZFWOuNul7Kv3P/0A8Yop5HAy6awf1UhczsqDJWWKjdEnqERQGitwBn6tC/FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XCm7wAJNCr++soKlk4gATBRC05QURAHWxoY7v7nVJns=;
 b=FupZ3UCicsJ4BkRjMggJVQ0IMK6fKRJLrZ+UqWa3Iih4oIJWhvsX2OEw2g/G6eU3szw3NxwjPpVfs2nHYPLBfpG5VpH/U+BcrdyIFLq4NCk+OachRqocgbnGqtdaE8OlLl0hEmtMO6tCaA34lA8ZsgQFoA15PgzIMdVz8TbvQbpD/Kp2sxxrG/SGdlvClxVpKUfz0AZiJVLKjyKGG2clMom3YBcmJCfNGtZCr5Vi2sFzjtOGwYyT57xu4JVsrpELSfDm6XUP7wmmnTWYBuOjEfx3SFeQEdGSz1CWcvLo3R3EdcQioweKnAGXmrWS+7kas9dc8KY+U/MQVYrbSOqgBQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2874.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:1f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Wed, 10 Aug
 2022 08:34:50 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624%6]) with mapi id 15.20.5504.021; Wed, 10 Aug 2022
 08:34:50 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Sathvika Vasireddy <sv@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 05/16] powerpc: Skip objtool from running on
 drivers/crypto/vmx/aesp8-ppc.o
Thread-Topic: [PATCH 05/16] powerpc: Skip objtool from running on
 drivers/crypto/vmx/aesp8-ppc.o
Thread-Index: AQHYqxz41qJ4JNOe9Eipr0KU/2wH/q2n0eGA
Date: Wed, 10 Aug 2022 08:34:50 +0000
Message-ID: <fad7cc16-7dfb-de90-50e7-f2524525e1c3@csgroup.eu>
References: <20220808114908.240813-1-sv@linux.ibm.com>
 <20220808114908.240813-6-sv@linux.ibm.com>
In-Reply-To: <20220808114908.240813-6-sv@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7363cc98-1e5a-42d9-e218-08da7aab30e1
x-ms-traffictypediagnostic: MRZP264MB2874:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  qdPOzpxz8T3QHsWW3zxi6JUSpnzjHmBSzqIwdo47zNfmzWuUu3kDEF8raZselYUQvCmIaxl8LU7oSG5jiX0wmDDihUqwr21mPZg0pS62FPwCnFnoHkK7ylnNXcnR6NXB5HjUAVhPFOu39pmhVse6/lyKZM2jnFtBne+/zCUGQ9kN5o7Pu/jfulxnRf6akv4XIIpSkuDDR87bPSU89S8uN6QkDAIl60wL2AzWjyA5xzYHK+nMqArJJ8+tFBgePYiYoVFI/OrDJ2IZmExqDjBhqmwJf8X24dG80xLh+8Qt15K58to+h7Wo7Cd1zcMY0jsUOhkezz3uO6CDH4ciwFwwTTcq2Rot0/JDo1rluKjMB7K6H/f1ns0LMNdIx4EJds/7k4JPTtOZ4XjZPghRGq9BQp1QWdz0u8IGeIA/lcDOLXLTi8WjXCWuL+qHJTtAaRp69pVGOYTMuoC6Pnne8x8One+OJURtCIw8iC5dKZi4U3X7h+opD1fqs29y3Q4yfCn1WfXTtIenYlBROkEIw7a4F7kPgM/5wh+mYOigZcvla1buUMSwh6qmIcgXHo1pUF4Q8jtyvJTazT9UrdZ5YLy06zaEY4904sV9uOx3k8RVuSlt7NBwW46u7QfewawCA1ieQdjy2eI5YqnNEVlTsvG6/FjDrAegE3hDsU9yoePZ4rQ4I0e/Q/l9Aexs05vpTCPQJO7+wmKqGkjaYjV7nBabUeROzOhzKrufvnlVGQnEFCFTj+VHDD2bjRdzvYIQZpOaaj8a9ZysZQhsuabrToHZicbPbSCOQlHePhDW2T3ucyfu+5OyclORw03KZfteee+j7IQfTeFnko5LOi113swW89cVBAZYz1oMIVuj+1XA9r0=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(346002)(39850400004)(136003)(366004)(376002)(396003)(478600001)(41300700001)(6486002)(26005)(2906002)(71200400001)(38070700005)(36756003)(31686004)(6512007)(66574015)(186003)(83380400001)(31696002)(2616005)(54906003)(6506007)(110136005)(7416002)(91956017)(66446008)(66476007)(66556008)(66946007)(8676002)(76116006)(64756008)(4326008)(316002)(5660300002)(122000001)(38100700002)(86362001)(8936002)(44832011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?UmNhanE1UDlIL1NPcEtLUkFOWkxTeWt3Uk5GcE1YZDdrdEZHbzNoNDFhNnJ5?=
 =?utf-8?B?SnJtdUQ0aWt3WnhlS2gxS0xnUm1hbXUvWVhXZHl0TGtYWUFET2IxV2pJcEx4?=
 =?utf-8?B?aitYVFY2Z1haVlZobkorQzRqRnpxbit6dFVSV0IyVkdRZDRPODNNSVZGMHNG?=
 =?utf-8?B?UjJEZnRvc0FtdjFoSHB0VSswTFBvOFJybldNTnFCcHo0ZU0rQjI0STBQT2dG?=
 =?utf-8?B?di9qK3htdlFRUmFQK0hKajAvOVF4RnJkSVc1WVc1djJtNHNrNE9XdFFnWVZD?=
 =?utf-8?B?dEF0Nk1tL0h2Qzd5NUhpeFVWN2JwaWlYcVMyYzVYWGJOUGdRaXI0c1VUVU1P?=
 =?utf-8?B?TWh3NGtna3dNQmpOcUpIaEI5Tmh5ZFpnby9sZ2xLVk5TS3Z1Wk5CMDJiQWxy?=
 =?utf-8?B?SVFHZC93WUNOOWpjcEE0cnNuMXVPakEyelg3NzNqM1ZpWmJtckRmUjR2UFZZ?=
 =?utf-8?B?NVcrbFBZdTM1K1BvVGxxWEZUL1hUSzRRclNvTS9wZHAzMGtSOFZ3Zkk5WWx1?=
 =?utf-8?B?bWhBQ1puS0Mya0pwMVV3SVNDMlVVbzdLbWdBWjBCMUlGTTJCaHVMQ3diVCt1?=
 =?utf-8?B?d2xaMUpjTndicVAyeFVpWFVSZ3J2aDZsb1NIYTNMemZ1N1d6VmxiT1djYnFi?=
 =?utf-8?B?Rk5IVks1dXdnS0RyNDJoTjlkbXBWQXJDMmhMYVdQNzRGNTNTMlNwNnV0VDRw?=
 =?utf-8?B?OXNFQTZGV1FZUDBCL3hxeld6OStTaS9SUGpIM3I1LzZJdm5neGxsU2ErenM4?=
 =?utf-8?B?aG5nWXNhVC9QbkoxMXYvK0ljYjYzNGFKQkJQWGJya2toWGJ5Q2hlZTlMZUtt?=
 =?utf-8?B?RlN4b3I3M2t1aVRsWEhLYm5WMlNvRENFdEVqREsyL211cStBbUMrUEtpYXVy?=
 =?utf-8?B?cXdlaHg0TnR0YWw0Y1BMaVVBU3dBWmMxTzU3bUljLzc2RUJUR2pwYXV1dEdw?=
 =?utf-8?B?ckt4dE8yQmRIclFxWGtXZk1SOU5RN1BNdGdsVStVbWRhUHVXRzU1ZWNHOFpp?=
 =?utf-8?B?NE5zTXRkWXZKSldRWVlEVy9kZUIrWjAvdmg4OThnd0RicjkxSDlkUGN5ZHJt?=
 =?utf-8?B?Q3pSL2ZnWm10dXNpY0k2ZVFXVGx2NzZlU3ZBQWxzMHN3RnFodWFDR1FQQkFm?=
 =?utf-8?B?ZVliZWp0R3dob3Y1NTMrZ0ZMS2RwVy9yaDNBdzJGcTQ2elVGei91dml4eWtN?=
 =?utf-8?B?WU9YUjVHekRxRFhVbm5sSFA4Sm4wMTgwK2IvSENkeVg3SkZqRnI2eUdnc0tS?=
 =?utf-8?B?aGo2WHVkdmFBODVXVEtkVkhlYU9QNEVoVUhOT2s5S21lcTNMWHFNQzZTYVNh?=
 =?utf-8?B?ZWJXNlMxZHJJYStmZ1hUQWd1WHkzQUk2RXkzTHhIcUpvRzRnK1FFbnJIMG4z?=
 =?utf-8?B?Y1pZS1BITUhPMnJTNlRMWDZmekxyUHEyeTZjN1BqZlRSMVM2VkhGUGh3L1JN?=
 =?utf-8?B?YkhWZzJQWWtCV2hiR1FXeTdTWFYxS0FBWU1NZ1lXeVl3Zkd1dU1LZnlCeHJk?=
 =?utf-8?B?RUN4WC9RM2t1SENLSmYrVzFKUHBrR3VlOGxwc1NaNUdiczBLcmZRYXVYbTQ0?=
 =?utf-8?B?QzJHYjRlNVFoWEUvR3FPdXJGM2ErQXBYejY0aGdiMDhoMWVNQ3NFWUtKcUla?=
 =?utf-8?B?cnlkdDVzTEZJZmZwOEhVL1dRbWkwd3dsR3NmZXpqcHp0TFR4bTNZY2VpVlJ1?=
 =?utf-8?B?ZFlrTndWNzV0WXRkZXpVejVEUlNLZ3JDT1NRRnlVOFJ3WEpQM0lOTDlaRzNv?=
 =?utf-8?B?SE0yYlhkMW5JNmsweFE5Rk85S2tLdHcvcGNvM1hPZW5ETUJLeUFTemUrcUNY?=
 =?utf-8?B?cWFxeXBIeXovclV1ZVloZlhXcnowbXJkZTFmeWlhZ0lFL0NweFlYQ3VTYU9x?=
 =?utf-8?B?SVZaWDdSZEp0NVJCMjZDMmJ0dmNGNXFaTU1Ib2dxSDFSRFQ5aXRia005emlk?=
 =?utf-8?B?YWtESkozWXlHd0VHTGdmS3ovZFA2dmg2TEU5YTk2OXU3alBWVTdXZjRUdlIz?=
 =?utf-8?B?anVKcmloR0FHZDVTTCt0RzFFKzJrNUpTaHJTT0FGdUM4bFBObWs1bGhHNktH?=
 =?utf-8?B?U1V1bkhKaFdvcWlYZVJiSXZzc2U1UTlTL1ZZS2t6VWZUd0Q5NVpYQnRsVEhk?=
 =?utf-8?B?T2txMDVOczRIWGloWnZFSjYxaUlvN2tQaW9Va0pLODBDYWZGU3pLYWNZVVM1?=
 =?utf-8?B?ZUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D71523A54F1A53419AE42C5F60ACB39C@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7363cc98-1e5a-42d9-e218-08da7aab30e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2022 08:34:50.3827
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wgdJI0ZLcZwu8HRUqgx70daOuI8thea4Mn/hphDAzyGXy9bmD5blns5h5gLU2wZuP4zqzcO5A/NFuK51q+l33pDz2p3kcIuc0zTQQDS3niA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2874
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
Cc: "peterz@infradead.org" <peterz@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "rostedt@goodmis.org" <rostedt@goodmis.org>, "aik@ozlabs.ru" <aik@ozlabs.ru>, "mingo@redhat.com" <mingo@redhat.com>, "npiggin@gmail.com" <npiggin@gmail.com>, "jpoimboe@redhat.com" <jpoimboe@redhat.com>, "naveen.n.rao@linux.vnet.ibm.com" <naveen.n.rao@linux.vnet.ibm.com>, "mbenes@suse.cz" <mbenes@suse.cz>, "chenzhongjin@huawei.com" <chenzhongjin@huawei.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA4LzA4LzIwMjIgw6AgMTM6NDgsIFNhdGh2aWthIFZhc2lyZWRkeSBhIMOpY3JpdMKg
Og0KPiBXaXRoIG9ianRvb2wgZW5hYmxlZCwgYmVsb3cgd2FybmluZ3MgYXJlIHNlZW4gd2hlbiB0
cnlpbmcgdG8gYnVpbGQ6DQo+IA0KPiBkcml2ZXJzL2NyeXB0by92bXgvYWVzcDgtcHBjLm86IHdh
cm5pbmc6IG9ianRvb2w6IGFlc19wOF9zZXRfZW5jcnlwdF9rZXkrMHg0NDogdW5hbm5vdGF0ZWQg
aW50cmEtZnVuY3Rpb24gY2FsbA0KPiANCj4gZHJpdmVycy9jcnlwdG8vdm14L2Flc3A4LXBwYy5v
OiB3YXJuaW5nOiBvYmp0b29sOiAudGV4dCsweDI0NDg6IHVuYW5ub3RhdGVkIGludHJhLWZ1bmN0
aW9uIGNhbGwNCj4gDQo+IGRyaXZlcnMvY3J5cHRvL3ZteC9hZXNwOC1wcGMubzogd2FybmluZzog
b2JqdG9vbDogLnRleHQrMHgyZDY4OiB1bmFubm90YXRlZCBpbnRyYS1mdW5jdGlvbiBjYWxsDQo+
IA0KPiBTa2lwIG9ianRvb2wgZnJvbSBydW5uaW5nIG9uIHRoaXMgZmlsZSwgYXMNCj4gdGhlcmUg
YXJlIG5vIGNhbGxzIHRvIF9tY291bnQuDQoNCldoeSBub3QgZml4IGl0IHRoZSBzYW1lIHdheSBh
cyBmb3Igb3RoZXIgZmlsZXMgPyBQbGVhc2UgZXhwbGFpbi4NCg0KPiANCj4gU2lnbmVkLW9mZi1i
eTogU2F0aHZpa2EgVmFzaXJlZGR5IDxzdkBsaW51eC5pYm0uY29tPg0KPiAtLS0NCj4gICBkcml2
ZXJzL2NyeXB0by92bXgvTWFrZWZpbGUgfCAyICsrDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY3J5cHRvL3ZteC9NYWtlZmls
ZSBiL2RyaXZlcnMvY3J5cHRvL3ZteC9NYWtlZmlsZQ0KPiBpbmRleCAyNTYwY2ZlYTFkZWMuLjdi
NDFmMGRhNjgwNyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9jcnlwdG8vdm14L01ha2VmaWxlDQo+
ICsrKyBiL2RyaXZlcnMvY3J5cHRvL3ZteC9NYWtlZmlsZQ0KPiBAQCAtOSwzICs5LDUgQEAgdGFy
Z2V0cyArPSBhZXNwOC1wcGMuUyBnaGFzaHA4LXBwYy5TDQo+ICAgDQo+ICAgJChvYmopL2Flc3A4
LXBwYy5TICQob2JqKS9naGFzaHA4LXBwYy5TOiAkKG9iaikvJS5TOiAkKHNyYykvJS5wbCBGT1JD
RQ0KPiAgIAkkKGNhbGwgaWZfY2hhbmdlZCxwZXJsKQ0KPiArDQo+ICtPQkpFQ1RfRklMRVNfTk9O
X1NUQU5EQVJEX2Flc3A4LXBwYy5vIDo9IHk=
