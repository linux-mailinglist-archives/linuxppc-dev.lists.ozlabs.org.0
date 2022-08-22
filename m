Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 231E659C16F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Aug 2022 16:14:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MBDrM2tbwz3c8d
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Aug 2022 00:14:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=TBMtjwBu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.73; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=TBMtjwBu;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90073.outbound.protection.outlook.com [40.107.9.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MBDqd29sLz2xjw
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Aug 2022 00:13:48 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mMsi9yZD0nO4RYWldJMJx1MilyeBEQ3+wkHH9fxk+P1WBL6J5g2CGRKe4WfzERxQvQolKcBJ9JGHfufqGuOgunJOd4UVqdAPmRPDK7E+w+xyG1ylfPxM1f/IKD9mLH6fb25EndIa76++tAEaSzYQUbjIEyB95sHCUcuJZyNZONeu088gx7LVIobxhj4jgW6YEAUTjmfmn1BZYLxAoK910CxkFLV7B77YaFPiMSOwuqdtMe0VIiuTABPaFleJGw35FVwDqhsYL4yfrRni7+QA1hLuCztAg0YKzkKdC/BQS0hUI2jWatj/CQz7zru9muSXP+mkbImca7Olp1oBR/P8tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GZAnN3aou7SXs8gAChZYd5wnGki6/mDaz5AaUL9ZfsQ=;
 b=Wb30JiCmXT1JSBICUNpLmd5k6BNl8S0stSiJ/3bzqQ5v7RRmEFKI12focBtabWFRHZZZ2wsWOp9cxU1GzekIcdRyOk5jNPDPr/ijSH9L94OLF+BN+aN3gcUh+pmBOTXTWtYfWevCpqbjcLkRU3xcSRPhX5/Bs/EpetTVtYcBR6E0ixoGS2Y49Bdo2vRQHt0E7qrvGqcKZ+rL7enNtH3wgRrO8Haj7U0ok/jh1Jh4TEk61WKtYyY7HrKtwriCkAZSmpvd5Ao6fPWodtwnRVJiy5OGwDgS1MEp2x7AbbS9v+NAGmLxdZqah16KsqfWNfkWls40+atWZfLmsTDB9sQv2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GZAnN3aou7SXs8gAChZYd5wnGki6/mDaz5AaUL9ZfsQ=;
 b=TBMtjwBuqhZaJCErm8HmtQCDV0U6EntRZipfceDY3rL04+GfKGQbCxzuSYqKMq8o8Hhusw7c55lQAZ4TdxOBjDm/VAbKxzv+eMUYjms52VApCmNkUgXsXOqWkmO3gX34XX9wvZ7UU8jwRMcmTpbRlOcY3BGaMTkawBrhPcC5gZSZ+zQQCnOrs+N4ZxxbiGcrWUQUo3Pbe0bdCW11NWWwNSokjlSGl4yW/LAWisT66W3u8J3QV9tF0uKb83npuoDYT+7pVRQGhVtGZNMQw5J52QMGfCbE1JhBO4VU0JPLk7c4uKOsRtAKP2X+7h54uFLTgNxT2hdw8kEK0Apu7psVSQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB1651.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Mon, 22 Aug
 2022 14:13:30 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::888e:a92e:a4ee:ce9e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::888e:a92e:a4ee:ce9e%5]) with mapi id 15.20.5546.022; Mon, 22 Aug 2022
 14:13:30 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: =?utf-8?B?UGFsaSBSb2jDoXI=?= <pali@kernel.org>, Randy Dunlap
	<rdunlap@infradead.org>
Subject: Re: [PATCH] powerpc: Add support for early debugging via Serial 16550
 console
Thread-Topic: [PATCH] powerpc: Add support for early debugging via Serial
 16550 console
Thread-Index: AQHYtBCQTPmF1chLTkiejFUksD5Awq22z30AgAABRgCABCnQgA==
Date: Mon, 22 Aug 2022 14:13:30 +0000
Message-ID: <d12435b4-0caa-ba06-f0a5-8c9268bb8dfd@csgroup.eu>
References: <20220819211254.22192-1-pali@kernel.org>
 <35c0ff6a-387d-3c01-66b3-f659cfe67c2a@infradead.org>
 <20220819223848.lvxakjjzfdjvyqgu@pali>
In-Reply-To: <20220819223848.lvxakjjzfdjvyqgu@pali>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 66975458-30de-4a79-7e91-08da84487d5f
x-ms-traffictypediagnostic: MR1P264MB1651:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  qAPg0Xz1C974OW+lxBojadHDUSPKWxjpD3/yyP5pMzOfsWj0E5ADcRo5JcQ71TgXjagU8//jaxrYZn6gRawK4AFGodxpmd3W4TIBFv3n+9fWhEViC9kthqPuDIRo9/3KGA29Fy0u8OBCkkrIj6m4E/wZ03VGRgs5/61pxfZ4XLcV+LfJlSYT7Mve47XfqFi414irMV2CdsYPx1FimhAF2TvM3W8CdNP1R5ScKIM+9keJMDnpyypScRMfOw0Jj8Z6KcfimwpOSROooYMLC21fUt8A3U/2bpKcSFzcSQULVPtjf6Lji0RifKaOS4OrklzB4spKVhhSbs1WNInPgyhpM+pn+mE5Uc+IvKjJ0I4sQi8EEmaDdQB1bfKgjgBZ4jk8SSTIHB7evHrdO11OeInx+q13sZOkKt8az5JsC+deHnW8x+/CC76L0y48oexhtaAlZBypEbcTcSeQ+UhD1EUtq/IqVhKmROYWDMnGGeG1GbCyOWWByZWqwPWAPhSYblK0vG0L3h9f+n9ZnZoarP8jnOaz3f2vm5QzIL2OSj6AEgY0uXjkYC4tc5vzgr5wah/qocOpr4LfuJb1ErMWarnD27FDbvSy5Qv1v0ay6y+Z64clwByP0jViHtx7Tkp3An36Kv8R/qcdrDz/W8upk2YftTBOzZ+26Z+LF47CtBqzxBL6UmE5jrVA5V4JCubWISP3Qbw20HFsEyETEJkYleXEmjT0WG8YKbVxH73eRYbiLopHeyz1m7zglsJTqFvv7uDDuuJ2lgtmUk8PCTAZGTtx/mOoREI3dL75sGY+pZfGzIVH8F8UZyQ/7Q25np2FHNc2DFaH0RROpL7fFvpEx+aK2jlOze0OgWffuPMbpZ0BwIs=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39850400004)(376002)(396003)(346002)(366004)(136003)(66946007)(8676002)(4326008)(66556008)(66476007)(66446008)(64756008)(38070700005)(86362001)(122000001)(31696002)(38100700002)(110136005)(54906003)(91956017)(36756003)(76116006)(31686004)(2616005)(6512007)(26005)(53546011)(66574015)(6506007)(6486002)(478600001)(966005)(71200400001)(186003)(316002)(8936002)(2906002)(41300700001)(83380400001)(44832011)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?MHRwSWd6STlaSm9RUDR2ay9yUjZCS1BReTk1NVdDU09pcG9VWVBmUk1GaTcv?=
 =?utf-8?B?Sm0yYVFXOVZhbk5qa2hDNEg2RFlMdVR4OElobmV1TDFlT3BvcjRwR3RxaHIz?=
 =?utf-8?B?TFVFMHoycmh1eXBEa0pnNWtnL3hqWDZaaUlrZGV2YkYrSFNHTHB3Q0F4SDhR?=
 =?utf-8?B?WDFiSW85V0Z4Tk1oSmlKM2Z2bkFQTXlpMEpWY0dKWDA0Q2VYZm1JMlFCWDBu?=
 =?utf-8?B?OFYrQ0VLMnVJTEUxRm1Ga1REN3h1NHZuWU9rYkx3RkJmSHNRR0llV1hwQVhX?=
 =?utf-8?B?VStvQm8ranVGaHNPb2N5WGlNTXZmWTMzY2d5dlRtSzBNazhNbkR1R1lGbXdo?=
 =?utf-8?B?YnlaZFV4L0VzeldOcmptdVJZd3pENE5NSDVIdVVkMlpSbVlBTVJBM0ZGUjhh?=
 =?utf-8?B?TXZBNS9DalZJSGVxY3EyKzBObkNRcGQ1blVPblFOZ2RKNlJ6Nzlab1k2dXN5?=
 =?utf-8?B?dWM1ZnNDcndsWGlaaEErQkZtOGtoWFY1cU9MV0ljVU1CaGxEc1daOGRpUTNt?=
 =?utf-8?B?L0F5aWVJWXFCeWV0SVdJeHV3ZFA4bW8vR0c5OUIzbWJyZ1JqUWEva2oyUnB6?=
 =?utf-8?B?cE9PSkRyejJiR3dmMzFvVWxrSVFpL0hNaFdWakxuYm9SUWJ2VFltRFc0ekh0?=
 =?utf-8?B?dlhwbkNlZWdFZHZQQm41djdOSWhweVJzZC9QazFUZnhCWjFuVHlRK3d4U2Mx?=
 =?utf-8?B?eGExRlBCdVNHZ3VqVC9MaTZyM3VIVGJuMkpDekFiV3VuSEwyV0FFVDcveFRn?=
 =?utf-8?B?aU5Vb3hscEFUNVltdGc1aHZCaEJWM3N1a1dFVlgzL0pZN1NhcUJtSE05WUNO?=
 =?utf-8?B?bGhMV1FZVmJKYTVVQ2QvVzRXanhmNlU3c29wMUR0RjhURFovVHE2Sm9RQ3Rv?=
 =?utf-8?B?Y2JITEI5SEVkUDc3QzhPU1hvZnlkTUJMZVRYa09GeE5YbjNuWlpZajJvOE5L?=
 =?utf-8?B?dmk4VE8xRnlOeXBWY1VhY0FFVENsZkN1Qm8xT25DUVhJZS9YVzNNK1ZiUEVR?=
 =?utf-8?B?Zk81bi9sbks2VWdLSUVPUDNJNlpWYnpJbVgvOENFNWxyY2J3cDFOTE0zVk1V?=
 =?utf-8?B?bG0zSG43YzRsQ2J6NUpVVjVMdFVRdUlYSEVjQVgvNzY5N1ZKbldibVc5U2Z6?=
 =?utf-8?B?SGZuVnRqRHNoSWdwbXpuK3JUMEUvNkZZSTJGejlRL09BRVM1NEVKSys3RTBx?=
 =?utf-8?B?NHUxaExJNncyQ2JObGVyTVg2b1dTS0d2YVlUdHcvSjNZeHBoekVNVXFBV3JU?=
 =?utf-8?B?ZjJjM2FFQ0dBeFZKc29TaHlKb2U2eHovYVJBZ1lZa0J3YnRQbFp6ZDEybFMw?=
 =?utf-8?B?YTRRNDRTRzZnOTJSWUx5K1dlQ2Vmbm1tMXlQVE4vQjY3TzU0NWhDZXpUVG5S?=
 =?utf-8?B?ZzV4NTAyZWNSV2ZRazZqS0RmMDZGeVJhbS9GNmI3ZDJvaEFzejBkYnZSazJR?=
 =?utf-8?B?eXd2MmRaN2ZtTlhlQ0xMN0wwbGhVOEVoUDRYNjR5TEUzQW1VWEtnSDJtM3U1?=
 =?utf-8?B?RWh0Ris3NEZ1K1duLzJMYitrMlJId3VUcllCYStyQVhyS3dYbC8zQWxIL0kz?=
 =?utf-8?B?UTYrSzIrN2F6TTUvK3kxL2ZiNGdrQlp4MHE0WktSM0xzOWFwMlovTS8xbVdm?=
 =?utf-8?B?NjBwV09qYlZrbk95VGZMWS9TMXdJZmxXdEhOZExVZ0tSWnRIT1U0Rnh6MVFl?=
 =?utf-8?B?NnhhVitkRGpMVitSTmdCSFF1bmt2QXBnQmlCbzJNeVlPb0thcTlJWUE3cVd3?=
 =?utf-8?B?a0JhTTREWEdRV3cvT01PUFJndWdTYkFRcjVXMStFRHpKL1VyRjdVdHhLcDFN?=
 =?utf-8?B?eXlxZTlyZzQxU205NlhQc1ppUE5TQk1UbzFKQUN1RlY3WGhXNzVpUktzQ2Jw?=
 =?utf-8?B?QlVQSnVteDRualJIU055NjZQUW5yR3RWMHFzczFxUFBKN1FHKzFzd2pCVWg0?=
 =?utf-8?B?UFlOSXJDT2djY2ZoaTR6R2p3Q01NU1V0L2ZxalBWSm5PTE1XcTFteTczT3hx?=
 =?utf-8?B?eGp2Y0tHTmtvNGw5UFNNTEl6WU5tYVpzN0c0MmJmeEJoTWRNN05qWEViU0ZE?=
 =?utf-8?B?dklqWFJiZnJUcGFFUzAzb2FPdDkvWE1TSGozaE9zSHNpNmRGVnJyZU5iNkJh?=
 =?utf-8?B?bnRNQWY3Wm5WVGZvNWxLWTZDTUNDenp6ekI4UDBqMWIrZTdEQXh4Vm5MbEx4?=
 =?utf-8?Q?/JZ5NBHxzUUoRFwEXnNigF0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C7694D459D8E4041A5F93812DB1C0C5C@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 66975458-30de-4a79-7e91-08da84487d5f
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2022 14:13:30.1799
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4NFtHt8+BvHVColj6dchyAyJDm24KmHACPsSPegaACV/Is8obN9tEIAsQ599gb2petqsXKkO1aLFt5E2OxruxGWwahrRTimx0RKRHFQaA0g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1651
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
Cc: Nick Child <nick.child@ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Paul Mackerras <paulus@samba.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDIwLzA4LzIwMjIgw6AgMDA6MzgsIFBhbGkgUm9ow6FyIGEgw6ljcml0wqA6DQo+IE9u
IEZyaWRheSAxOSBBdWd1c3QgMjAyMiAxNTozNDoxNCBSYW5keSBEdW5sYXAgd3JvdGU6DQo+PiBI
aS0tDQo+Pg0KPj4gT24gOC8xOS8yMiAxNDoxMiwgUGFsaSBSb2jDoXIgd3JvdGU6DQo+Pj4gQ3Vy
cmVudGx5IHBvd2VycGMgZWFybHkgZGVidWdnaW5nIGNvbnRhaW5zIGxvdCBvZiBwbGF0Zm9ybSBz
cGVjaWZpYw0KPj4+IG9wdGlvbnMsIGJ1dCBkb2VzIG5vdCBzdXBwb3J0IHN0YW5kYXJkIFVBUlQg
LyBzZXJpYWwgMTY1NTAgY29uc29sZS4NCj4+Pg0KPj4+IExhdGVyIGxlZ2FjeV9zZXJpYWwuYyBj
b2RlIHN1cHBvcnRzIHJlZ2lzdGVyaW5nIFVBUlQgYXMgZWFybHkgZGVidWcgY29uc29sZQ0KPj4+
IGZyb20gZGV2aWNlIHRyZWUgYnV0IGl0IGlzIG5vdCBlYXJseSBkdXJpbmcgYm9vdGluZywgYnV0
IHJhdGhlciBsYXRlciBhZnRlcg0KPj4+IG1hY2hpbmUgZGVzY3JpcHRpb24gY29kZSBmaW5pc2hl
cy4NCj4+Pg0KPj4+IFNvIGZvciByZWFsIGVhcmx5IGRlYnVnZ2luZyB2aWEgVUFSVCBpcyBjdXJy
ZW50IGNvZGUgdW5zdWl0YWJsZS4NCj4+Pg0KPj4+IEFkZCBzdXBwb3J0IGZvciBuZXcgZWFybHkg
ZGVidWdnaW5nIG9wdGlvbiBDT05GSUdfUFBDX0VBUkxZX0RFQlVHXzE2NTUwDQo+Pj4gd2hpY2gg
ZW5hYmxlIFNlcmlhbCAxNjU1MCBjb25zb2xlIG9uIGFkZHJlc3MgZGVmaW5lZCBieSBuZXcgb3B0
aW9uDQo+Pj4gQ09ORklHX1BQQ19FQVJMWV9ERUJVR18xNjU1MF9QSFlTQUREUiBhbmQgYnkgc3Ry
aWRlIGJ5IG9wdGlvbg0KPj4+IENPTkZJR19QUENfRUFSTFlfREVCVUdfMTY1NTBfU1RSSURFLg0K
Pj4+DQo+Pj4gV2l0aCB0aGlzIGNoYW5nZSBpdCBpcyBwb3NzaWJsZSB0byBkZWJ1ZyBwb3dlcnBj
IG1hY2hpbmUgZGVzY3JpcHRvciBjb2RlLg0KPj4+IEZvciBleGFtcGxlIHRoaXMgZWFybHkgZGVi
dWdnaW5nIGNvZGUgY2FuIHByaW50IG9uIHNlcmlhbCBjb25zb2xlIGFsc28NCj4+PiAiTm8gc3Vp
dGFibGUgbWFjaGluZSBkZXNjcmlwdGlvbiBmb3VuZCIgZXJyb3Igd2hpY2ggaXMgZG9uZSBiZWZv
cmUNCj4+PiBsZWdhY3lfc2VyaWFsLmMgY29kZS4NCj4+Pg0KPj4+IFNpZ25lZC1vZmYtYnk6IFBh
bGkgUm9ow6FyIDxwYWxpQGtlcm5lbC5vcmc+DQo+Pj4gLS0tDQo+Pj4gVGVzdGVkIG9uIFAyMDIw
IGJvYXJkLiBJdCBhbGxvd2VkIG1lIGRvIGRlYnVnIGFuZCBpbXBsZW1lbnQgdGhpcyBwYXRjaCBz
ZXJpZXM6DQo+Pj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXhwcGMtZGV2LzIwMjIwODE5
MTkxNTU3LjI4MTE2LTEtcGFsaUBrZXJuZWwub3JnLw0KPj4+IC0tLQ0KPj4+ICAgYXJjaC9wb3dl
cnBjL0tjb25maWcuZGVidWcgICAgICAgfCAxNCArKysrKysrKysrKysrKw0KPj4+ICAgYXJjaC9w
b3dlcnBjL2luY2x1ZGUvYXNtL3VkYmcuaCAgfCAgMSArDQo+Pj4gICBhcmNoL3Bvd2VycGMva2Vy
bmVsL3VkYmcuYyAgICAgICB8ICAyICsrDQo+Pj4gICBhcmNoL3Bvd2VycGMva2VybmVsL3VkYmdf
MTY1NTAuYyB8IDMzICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+Pj4gICA0IGZp
bGVzIGNoYW5nZWQsIDUwIGluc2VydGlvbnMoKykNCj4+Pg0KPj4+IGRpZmYgLS1naXQgYS9hcmNo
L3Bvd2VycGMvS2NvbmZpZy5kZWJ1ZyBiL2FyY2gvcG93ZXJwYy9LY29uZmlnLmRlYnVnDQo+Pj4g
aW5kZXggOWYzNjNjMTQzZDg2Li5hNGU3ZDkwYTQ1ZDIgMTAwNjQ0DQo+Pj4gLS0tIGEvYXJjaC9w
b3dlcnBjL0tjb25maWcuZGVidWcNCj4+PiArKysgYi9hcmNoL3Bvd2VycGMvS2NvbmZpZy5kZWJ1
Zw0KPj4+IEBAIC0yNzYsNiArMjc2LDExIEBAIGNvbmZpZyBQUENfRUFSTFlfREVCVUdfT1BBTF9I
VlNJDQo+Pj4gICAJICBTZWxlY3QgdGhpcyB0byBlbmFibGUgZWFybHkgZGVidWdnaW5nIGZvciB0
aGUgUG93ZXJOViBwbGF0Zm9ybQ0KPj4+ICAgCSAgdXNpbmcgYW4gImh2c2kiIGNvbnNvbGUNCj4+
PiAgIA0KPj4+ICtjb25maWcgUFBDX0VBUkxZX0RFQlVHXzE2NTUwDQo+Pj4gKwlib29sICJTZXJp
YWwgMTY1NTAiDQo+Pj4gKwloZWxwDQo+Pj4gKwkgIFNlbGVjdCB0aGlzIHRvIGVuYWJsZSBlYXJs
eSBkZWJ1Z2dpbmcgdmlhIFNlcmlhbCAxNjU1MCBjb25zb2xlDQo+Pj4gKw0KPj4+ICAgY29uZmln
IFBQQ19FQVJMWV9ERUJVR19NRU1DT05TDQo+Pj4gICAJYm9vbCAiSW4gbWVtb3J5IGNvbnNvbGUi
DQo+Pj4gICAJaGVscA0KPj4+IEBAIC0zNTUsNiArMzYwLDE1IEBAIGNvbmZpZyBQUENfRUFSTFlf
REVCVUdfQ1BNX0FERFINCj4+PiAgIAkgIHBsYXRmb3JtIHByb2JpbmcgaXMgZG9uZSwgYWxsIHBs
YXRmb3JtcyBzZWxlY3RlZCBtdXN0DQo+Pj4gICAJICBzaGFyZSB0aGUgc2FtZSBhZGRyZXNzLg0K
Pj4+ICAgDQo+Pj4gK2NvbmZpZyBQUENfRUFSTFlfREVCVUdfMTY1NTBfUEhZU0FERFINCj4+PiAr
CWhleCAiRWFybHkgZGVidWcgU2VyaWFsIDE2NTUwIHBoeXNpY2FsIGFkZHJlc3MiDQo+Pj4gKwlk
ZXBlbmRzIG9uIFBQQ19FQVJMWV9ERUJVR18xNjU1MA0KPj4NCj4+IElzIHRoZXJlIGFueSBjaGFu
Y2UgdGhhdCB5b3UgY291bGQgcHJvdmlkZSBhIGRlZmF1bHQgdmFsdWUgaGVyZQ0KPj4gc28gdGhh
dCAnbWFrZSBvbGRkZWZjb25maWcnIGRvZXMgbm90IGVuZCB1cCBsaWtlIGl0IGRvZXMNCj4+IHdp
dGhvdXQgaGF2aW5nIGEgZGVmYXVsdCB2YWx1ZT8NCj4gDQo+IE5vLiBCZWNhdXNlIHRoZXJlIGlz
IG5vdCBhbnkgZGVmYXVsdCB2YWx1ZS4gUGh5c2ljYWwgYWRkcmVzcyBvZiAxNjU1MCBpcw0KPiBo
YXJkbHkgSFcgZGVwZW5kZW50LiBQb3NzaWJseSBhbHNvIGJvb3Rsb2FkZXIgZGVwZW5kZW50IChp
ZiBpdCBjYW4gcmVtYXANCj4gcGVyaXBoZXJhbHMgdG8gZGlmZmVyZW50IHBoeXNpY2FsIGFkZHJl
c3NlcykuDQoNClRoZSBleGFjdCBzYW1lIHByb2JsZW0gZXhpc3RzIHdpdGggRUFSTFlfREVCVUdf
Q1BNLiBOZXZlcnRoZWxlc3MgdGhlcmUgDQppcyBhIGRlZmF1bHQgQ09ORklHX1BQQ19FQVJMWV9E
RUJVR19DUE1fQUREUi4gVGhpcyB2YWx1ZSBpcyB3cm9uZyBmb3IgDQpzb21lIHBlb3BsZSwgYnV0
IGF0IGxlYXN0IGl0IGF2b2lkcyBwcm9tcHQgZHVyaW5nIHRoZSBidWlsZCBvZiBleGlzdGluZyAN
CmRlZmNvbmZpZy4NCg0KT3RoZXIgc29sdXRpb24gaXMgdG8gdXBkYXRlIHRoZSBkZWZjb25maWdz
IHdpdGggdGhlIGdvb2QgdmFsdWUgdG8gYXZvaWQgDQpnZXR0aW5nIGFuIGVtcHR5IHZhbHVlLg0K
DQo+IA0KPiBVc2VyIF9oYXMgdG9fIHNwZWNpZnkgY29ycmVjdCBwaHlzaWNhbCBhZGRyZXNzIGlm
IHdhbnQgdG8gdXNlIGVhcmx5DQo+IGRlYnVnIDE2NTUwIGNvbnNvbGUuDQoNCkJ5IHRoZSB3YWl0
IHRoZSBidWlsZCByb2JvdCBkb2Vzbid0IG1pbmQuDQoNCj4gDQo+PiBDT05GSUdfUFBDX0VBUkxZ
X0RFQlVHXzE2NTUwPXkNCj4+ICMgQ09ORklHX1BQQ19FQVJMWV9ERUJVR19NRU1DT05TIGlzIG5v
dCBzZXQNCj4+IENPTkZJR19QUENfRUFSTFlfREVCVUdfMTY1NTBfUEhZU0FERFI9DQo+PiBDT05G
SUdfUFBDX0VBUkxZX0RFQlVHXzE2NTUwX1NUUklERT0xDQo+Pg0KPj4gd2hpY2ggdGhlbiBjYXVz
ZXMgYSBrY29uZmlnIHByb21wdCB3aGVuIHN0YXJ0aW5nDQo+PiB0aGUgYnVpbGQuLi4NCj4gDQo+
IENhbm5vdCB3ZSBzZXQgc29tZWhvdyB0aGF0IFBQQ19FQVJMWV9ERUJVR18xNjU1MCB3b3VsZCBi
ZSBkaXNhYmxlZCBieQ0KPiBkZWZhdWx0IHdoZW4gdXBncmFkaW5nIGRlZmNvbmZpZz8NCg0KVGhl
IG9ubHkgc29sdXRpb24gSSBzZWUgaXMgdG8gcHV0IGl0IGF0IHRoZSBlbmQgb2YgdGhlIGxpc3Qs
IHNvIHRoYXQgdGhlIA0KcHJldmlvdXMgZGVmYXVsdCB2YWx1ZSB3aGljaCBpcyBQUENfRUFSTFlf
REVCVUdfTUVNQ09OUyBnZXRzIHNlbGVjdGVkLg0KDQoNCj4gDQo+Pj4gKw0KPj4+ICtjb25maWcg
UFBDX0VBUkxZX0RFQlVHXzE2NTUwX1NUUklERQ0KPj4+ICsJaW50ICJFYXJseSBkZWJ1ZyBTZXJp
YWwgMTY1NTAgc3RyaWRlIg0KPj4+ICsJZGVwZW5kcyBvbiBQUENfRUFSTFlfREVCVUdfMTY1NTAN
Cj4+PiArCWRlZmF1bHQgMQ0KPj4+ICsNCj4+PiAgIGNvbmZpZyBGQUlMX0lPTU1VDQo+Pj4gICAJ
Ym9vbCAiRmF1bHQtaW5qZWN0aW9uIGNhcGFiaWxpdHkgZm9yIElPTU1VIg0KPj4+ICAgCWRlcGVu
ZHMgb24gRkFVTFRfSU5KRUNUSU9ODQo+Pg0KPj4gVGhhbmtzLg0KPj4gLS0gDQo+PiB+UmFuZHk=
