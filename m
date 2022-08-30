Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ACAC25A5BCA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 08:27:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MGy6H3sFBz3cCy
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 16:27:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=u5tY1UJp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.40; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=u5tY1UJp;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90040.outbound.protection.outlook.com [40.107.9.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MGy5J1qbmz3c5w
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Aug 2022 16:27:00 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a+4RcCm2qNCEmom6N8ufsoY8D8BSbyV/h/QJsECXU2BCDKKaQIKNEs1DT9qXN0oEdZBnGNBzh89kQvLQmsE4lx5DQGwk0cbi9gYQAFjxmgF+4Rawj/PF6UdPHLvmwJeI8i1DjLK8R7eGJ0d7BXv+dgvCvVgnxlDPacNZ6S8bA3hqPTzfKtITlMKfiIdF98RLU8vxXgQiFMtbNwOhJ6KScWRllc3povx7GyE5YvpCOq6E125re2B/3rj9WQ8NS+CBlnbD1dCsF30KHXTOqe6tT1f8Lr43VyhXrbUhJUc5vgEpJ9+kCpTECToNRSV08QKbB9XWu+iphl6+VunFFWNgLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sO53/oOQndHYj0jfrhGrpHBoNgSTTVadwiaURBnYa/k=;
 b=OwZAwAh2Ego30lN1G6Q3C4l8wOBApig8dO1YqfDrZwdpTZ48XVm5efHo8QxisV3mv2/MrgcL+eB13XTsdmJhI8dmpQqbXoxXEpWgKeqBWYrkPqbSHoNdav0oMUo/jiqGrqwihjag7PIe+rnqLVtjgnUzRJCDaNW8JJOo2Ri619yyPlaD2Q0jBMc/GyA98Es1oAgZj7DjphS4Q4QTu90YKtyuB+jtMHnl8RZvzr9K52PYRQMeRR9d74uwpYV4LG9xswRTsnZG4oI94wG4Tl8DL59uRKO/7Nel7/blWSxRJ5NTAX4oaIbJxVRsg91ZU7ElmlragR+pxbTStI6NAgsuQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sO53/oOQndHYj0jfrhGrpHBoNgSTTVadwiaURBnYa/k=;
 b=u5tY1UJpKUOiP/7YhGifIqk8/P/UApAjOOa5ggEnqxQ9QoE4c1jwv9pnIH+lL0nZx8I/BBZySf6ycHK8BuNxU0PzXHOx18RDl65ndVyBEVy5AP/vckTk6NSro8Xp3LKtFdZCf9qLgnUvVuUBQOXatvxEoPGgTza2BwtwTErv5YFjn8lMZvggvZck4O6rLj9BE6w6LroJqQrLBQq5b5uR0NKJILXS6YRBhdP6ihYSeEISPojSQmf69qrGn+/R3zJBS2eEZrlhpkn7l1C8mdfXSyPwxqNomAiqT9VG8aeXqadfxNp7asbLAvZLWBuxLwIXC+LZJHLRQho5sB8BtcajNg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB1695.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1b4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Tue, 30 Aug
 2022 06:26:42 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8%4]) with mapi id 15.20.5566.021; Tue, 30 Aug 2022
 06:26:42 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Sathvika Vasireddy <sv@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v2 05/16] powerpc: Skip objtool from running on
 drivers/crypto/vmx/aesp8-ppc.o
Thread-Topic: [PATCH v2 05/16] powerpc: Skip objtool from running on
 drivers/crypto/vmx/aesp8-ppc.o
Thread-Index: AQHYu2ud2SA5fCr0+EyRwZDSKcWn6a3G/BeA
Date: Tue, 30 Aug 2022 06:26:42 +0000
Message-ID: <0ff8e573-fc14-a388-d057-d7ba54ba9de6@csgroup.eu>
References: <20220829055223.24767-1-sv@linux.ibm.com>
 <20220829055223.24767-6-sv@linux.ibm.com>
In-Reply-To: <20220829055223.24767-6-sv@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a7248bc1-7379-4cb6-1890-08da8a509add
x-ms-traffictypediagnostic: PR1P264MB1695:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  10wXS/tjBSpFqqqffzITkuIEs212O6J4EKGrUNYpJgMfXkXSX5LDcIcdukgaLPzraOL9gGo5D9iJwxTR8xGVY3pDm7vxA/jFwwFjoCo9lVlTGpP14fwF7545eBdSopyTP1F0vWpTrSVnFrL78W1yDZesoa2MDl6++kV8+36s0F+X6qA7NSU5nULChdpJkLtzFNxA5k+16S0lK1o55cAdlFXnw9+D3RWSR3y1YAvpKTWSV5gfCqcc3pK0EgbVwvPIWSPW7YiunNyni0qX2l6zWUl/5GjwZHdfEUX8dAILxG9OE+t24A2inlM7H18GkSJ1Xx5H0FK5bMDg7uMH+43nkw+tlFD0eShqE0x0g2vt8qaPpkJnVmTL44rDjqpKPfZxkZ4Do9AxHy9VFPi4C6KYXGDfjTLS8NaOXYNK5RnWPMi0X6sG8hTmTjelzBpCgWbNe0SzSqgM18eKZQuWuT9dGEXcN/4tGAJDOEEjn3na47E1CXiI6nG1jZ85zz8k+UglwNzByzuoaoFEY3Y7HaE59x531wh8X/eX85ZgrZ0Jr+eo7hw7aquu3GlI02pGzPo9m3+u19mZl5lM8iZmecpv5g4XBK22+zfVFljSlEJ1Y37AlqiN/o8PKAFedctPqL44iIZrTyHqFOX/NhHIKweT5jG50uH0vEkPdQlO2ZvUJK83J2ZK1av8K/zQxYM1H/FVRLPzW+nMIt3DWg0GwijGCcIxy+oYFti+WTGmgDvFnby2sVZ7SIuEQz4QDxpV1K4l8QcfJ3bOQAYnDoaVsv8Z++QhLP//QopCdXPpMFlLozypFXrUJT8XzGw0Z6JBKJ3KqaRiNZ2yvGKg/Juw0z0s3w==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(396003)(136003)(366004)(346002)(39850400004)(316002)(54906003)(110136005)(66476007)(86362001)(66556008)(6486002)(8676002)(76116006)(31686004)(4326008)(66946007)(31696002)(66446008)(71200400001)(64756008)(5660300002)(478600001)(36756003)(38070700005)(7416002)(41300700001)(8936002)(44832011)(2616005)(122000001)(26005)(6506007)(2906002)(38100700002)(83380400001)(66574015)(186003)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?Tzk1UHRPQmhuS0owdlcveHdwNU5VS1JZWHBCTEdUSU83aWJlUmF0VndKVE1k?=
 =?utf-8?B?STgxZ2ZKR0prLzhPZFgwZlJXc1U1RUlwV3VMakp1Z0JJRjBVM1FUTUh5S2RQ?=
 =?utf-8?B?NzZkMHRCeUxOaXg4YnRVRHM5MmJEcklNem0ydlJMekFTTEFFSTZwWUduNHNL?=
 =?utf-8?B?MUJob2YyakhVVHowSENPbU9MWmVJQ3FpbmQwSitPVysrd0UzTnFYSnlPRDVU?=
 =?utf-8?B?MkJINCt1YkJhMlh4UTBpaWdMZVhDTW1HZnhoZzVVL3VwVCtORE5WTC9aOWRY?=
 =?utf-8?B?dHFhQk4xMW1BVXlzSzhHRnNYZFNtS3JkajAvZTVFcEduVkIvRjA4WDMwOFQ3?=
 =?utf-8?B?M1pzNm1SMVN4VnRBbCt5SFVpOXl2MXRmWXdzTE9MdmdHMXFteE5EazFqUjRF?=
 =?utf-8?B?cWlja1p3UzFYOGM3V0NQbjVjZDk5em9FVUR5T3dCdUpHaXAwbmFieVJWbDJz?=
 =?utf-8?B?RVpHZ1pveWFtOHNlMUFLWnJHSEx3M0EwV2dXQ3FJM0luNFNZT0ZtZ2s1S2Zu?=
 =?utf-8?B?R05ra0RBbVdkWGhNelFyZGIveVZXZzU0emZZMHp4Qkx6NXZoYWdKZXhUUkdt?=
 =?utf-8?B?VUY2YlpjU3JjS2wyUmh2R2ZRWGlXalBibFNRM2daVTdZQ3c2ZFpHbzRRTVZo?=
 =?utf-8?B?Q2EwbkRHVzc4enI0U1lMTlZ1cWY5VW1zajRCZWNDMGtDZEdxcG9LOENXbWpB?=
 =?utf-8?B?Y3g4QWNDaGtvcUFQbTVGcFlZZ3NXZE9YS0RubWFUdnRTRldxYTlYTlIwTmw0?=
 =?utf-8?B?YTgvQk1CZzRUU2VHWGxDN3ZOdnRHSVpBUFkvNnI4SzRHUlVyVUZxNnZQZVJr?=
 =?utf-8?B?R0x2TGtqcDl6aXBnS2FoWUhsYVprcmRDbVcwOXNBY1dIS1FCcG1meldSazhh?=
 =?utf-8?B?S2RGS2xSR3h6QytFSlpkRE5rQjA4NndEcHorYkY2N2ZqdGpYZW9LeHhCc2gx?=
 =?utf-8?B?d0hhVVFyWEQ4KzZvU2VmUDRQaXhFbVA3SkMyL0JIQ1NqYlpoQ25ndEFNcita?=
 =?utf-8?B?a1FEcHFIL2Znbk9RRy9rZmt1N3BsOVZ2V3BFMW5yRk9BQXFWbVdCSldUY2NX?=
 =?utf-8?B?aHhhTWR0YTc1LytsK0twdk14cTdGWVI1YjBiSEVSL2VwcWtkcUNmVTlVdHEr?=
 =?utf-8?B?YmxDdGExR291cm9hOUpjNCtpK1ZGakswRGd5aDR2d2dsYVZSQld6Y3BnWkdx?=
 =?utf-8?B?RHdKUzdKZ2ViOXRibFN0QVJneVdLT21oMmJmNnhhbmM2bCtRR1JwRjc0dmxD?=
 =?utf-8?B?L1VjY1Z1UVR3SmtnMGtQdlhKZzhOV0sxSE45andUZ2V2d1FuUVFmYzJ3eDBL?=
 =?utf-8?B?WXhaWUFnK3hzVTVwcjMrb2U5UFQ5ZEtTRHFUWFJvbGlrWUVscGFlNjJIdm9z?=
 =?utf-8?B?aUUzM08vYkNWN3FrdVVCY2Y1RGRMZGRTdUVzOUcvZXhjWXVoZU1HSWJZTG42?=
 =?utf-8?B?S3VnZW01SW9jcVNDL2s3L0lYU3lVYmh2MElpdit1VDMyQnhDY3F1MURoM0lN?=
 =?utf-8?B?OUp4Y3JSaFdnOUd5aHR4aS8vbG12Z3VwRU1QK3ZZZUpILzlIeUxUNUNndTI1?=
 =?utf-8?B?VzJIc2ViTEJZM2IzWUhJZklYcW01TS9uV0JIMU1Mc0Y1dmM3UVhja3VZSE43?=
 =?utf-8?B?N3pFVFJ1eUxzRjhVc01vb2RrRUx5ejFnVjgxQ1FDSjlPVmttalcxc29CWTBD?=
 =?utf-8?B?YnNiV2FCZjA1RHFpSmtZQWhvSjg0bGMyZXZITXJiVWN1dHJYM0pvdVhqbUk4?=
 =?utf-8?B?enlWMld2bXJYMFZMZ2dkUERhbTNZNk5OeU1La3FlSzMrVWlaaWpFTHpkRGJr?=
 =?utf-8?B?UkhKVmhSejJ1S1hmTW9pc0ZTMjlQcFBTbURCa3JxUGJSbm4xN2dKT3dpdStU?=
 =?utf-8?B?ZGNXc0xwRTRzMEN2V1plbnNseHZ4dCtBYXdNZFRsQi9ocFp5WENnT0d3R1pS?=
 =?utf-8?B?YStVRVphVTl4enMyQ0NPdW9zaDlSZW15a1dOQTdaMDcwNDZsb1JOSlFvc1ho?=
 =?utf-8?B?Zmw0bGVXeVlQbjBxT1FJMWxZNFFwSk5aZzhYUFY5REZJT3luMmxwZHgyMXB2?=
 =?utf-8?B?OEppMVBwL1lCZlV6VjA5OFJmL08welpHUVpqRFVRRTM1Ny9ST0tEZkU0bXIr?=
 =?utf-8?B?K3h6cFIxSTF0R2RTM1RSTGpRZW1CN2VucktGeFpMazRPMVY2UmVwOXpWbUFX?=
 =?utf-8?B?dUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4CB8DF6174E39344B6AB81A0FEF097DF@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a7248bc1-7379-4cb6-1890-08da8a509add
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2022 06:26:42.5919
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h3rKQUnyyn+5lEZqRPws6LiQbObh4B0FNtNW2z8boHpa19U7oVBGgApk90gVDgXamPLTBT44uOkgRcAE49A7EI4kb3CAvZiibDMNUqUJhrU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB1695
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
Cc: "peterz@infradead.org" <peterz@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "rostedt@goodmis.org" <rostedt@goodmis.org>, "aik@ozlabs.ru" <aik@ozlabs.ru>, "mingo@redhat.com" <mingo@redhat.com>, "npiggin@gmail.com" <npiggin@gmail.com>, "jpoimboe@redhat.com" <jpoimboe@redhat.com>, "naveen.n.rao@linux.vnet.ibm.com" <naveen.n.rao@linux.vnet.ibm.com>, "mbenes@suse.cz" <mbenes@suse.cz>, "chenzhongjin@huawei.com" <chenzhongjin@huawei.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI5LzA4LzIwMjIgw6AgMDc6NTIsIFNhdGh2aWthIFZhc2lyZWRkeSBhIMOpY3JpdMKg
Og0KPiBXaXRoIG9ianRvb2wgZW5hYmxlZCwgYmVsb3cgd2FybmluZ3MgYXJlIHNlZW4gd2hlbiB0
cnlpbmcgdG8gYnVpbGQ6DQo+IA0KPiBkcml2ZXJzL2NyeXB0by92bXgvYWVzcDgtcHBjLm86IHdh
cm5pbmc6IG9ianRvb2w6IGFlc19wOF9zZXRfZW5jcnlwdF9rZXkrMHg0NDogdW5hbm5vdGF0ZWQg
aW50cmEtZnVuY3Rpb24gY2FsbA0KPiANCj4gZHJpdmVycy9jcnlwdG8vdm14L2Flc3A4LXBwYy5v
OiB3YXJuaW5nOiBvYmp0b29sOiAudGV4dCsweDI0NDg6IHVuYW5ub3RhdGVkIGludHJhLWZ1bmN0
aW9uIGNhbGwNCj4gDQo+IGRyaXZlcnMvY3J5cHRvL3ZteC9hZXNwOC1wcGMubzogd2FybmluZzog
b2JqdG9vbDogLnRleHQrMHgyZDY4OiB1bmFubm90YXRlZCBpbnRyYS1mdW5jdGlvbiBjYWxsDQo+
IA0KPiBTa2lwIG9ianRvb2wgZnJvbSBydW5uaW5nIG9uIHRoaXMgZmlsZSwgZm9yIHR3byBtYWlu
IHJlYXNvbnM6DQo+IA0KPiBTaW5jZSB0aGlzIGZpbGUgY29tZXMgZnJvbSBPcGVuU1NMLCBhbmQg
c2luY2UgaXQgaXMgYSBwZXJsIGZpbGUNCj4gd2hpY2ggZ2VuZXJhdGVzIGEgLlMgZmlsZSwgaXQg
bWF5IG5vdCBiZSB0aGUgYmVzdCBjaG9pY2UgdG8NCj4gbWFrZSB0b28gbWFueSBjb2RlIGNoYW5n
ZXMgdG8gc3VjaCBmaWxlcywgdW5sZXNzIGFic29sdXRlbHkNCj4gbmVjZXNzYXJ5Lg0KPiANCj4g
U2Vjb25kIHJlYXNvbiBpcyB0aGF0LCBhdCBsZWFzdCBhcyBmYXIgYXMgdGhlIG9ianRvb2wgLS1t
Y291bnQNCj4gZnVuY3Rpb25hbGl0eSBpcyBjb25jZXJuZWQsIHdlIGRvIG5vdCBoYXZlIHRvIHJ1
biBvYmp0b29sIG9uDQo+IHRoYXQgZmlsZSBiZWNhdXNlIHRoYXQgZmlsZSBkb2VzIG5vdCBoYXZl
IGFueSBjYWxscyB0byBfbWNvdW50Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogU2F0aHZpa2EgVmFz
aXJlZGR5IDxzdkBsaW51eC5pYm0uY29tPg0KDQpSZXZpZXdlZC1ieTogQ2hyaXN0b3BoZSBMZXJv
eSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1Pg0KDQo+IC0tLQ0KPiAgIGRyaXZlcnMvY3J5
cHRvL3ZteC9NYWtlZmlsZSB8IDIgKysNCj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jcnlwdG8vdm14L01ha2VmaWxlIGIvZHJp
dmVycy9jcnlwdG8vdm14L01ha2VmaWxlDQo+IGluZGV4IDI1NjBjZmVhMWRlYy4uN2I0MWYwZGE2
ODA3IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2NyeXB0by92bXgvTWFrZWZpbGUNCj4gKysrIGIv
ZHJpdmVycy9jcnlwdG8vdm14L01ha2VmaWxlDQo+IEBAIC05LDMgKzksNSBAQCB0YXJnZXRzICs9
IGFlc3A4LXBwYy5TIGdoYXNocDgtcHBjLlMNCj4gICANCj4gICAkKG9iaikvYWVzcDgtcHBjLlMg
JChvYmopL2doYXNocDgtcHBjLlM6ICQob2JqKS8lLlM6ICQoc3JjKS8lLnBsIEZPUkNFDQo+ICAg
CSQoY2FsbCBpZl9jaGFuZ2VkLHBlcmwpDQo+ICsNCj4gK09CSkVDVF9GSUxFU19OT05fU1RBTkRB
UkRfYWVzcDgtcHBjLm8gOj0geQ==
