Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C1262565A70
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jul 2022 17:54:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lc9Nt4tYQz3btB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Jul 2022 01:54:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=5NDGscFH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.44; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=5NDGscFH;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90044.outbound.protection.outlook.com [40.107.9.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lc9N44xygz308w
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Jul 2022 01:54:10 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AQrGYe6rDpvDxBWnM68s3jK3AWJZUxAc4EkEySCX56RELR8fqQwwtFT0chPM6rq4IA2HERUvQeHhynIAqIJTzEcIOHz1uX4go/KVf6He32paHLi+7oQ6vi/2BK/X+i9MhgEN4RWkBXTdGI7fBuc/NgOnCmDRfCFyNKnxezODcFAtOAACQn7WMm28z8rt1fliTqFSU8HQLCnEL9GfvKe5liabZQ/ylOPONoJJ6oklqnKW3yLwn+/cnTEovh5jJM8KzIsYMM1JOGCUSN/OMov6Zmi8Gwm8gJ0OTCeqgyW9vjCQcntWqVHRy9NIsNeSXUdd0l4u7J6mI9yMP42BsFAWEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B6gE6WnccrNLri8ADzT2UuI3nsJ5+2A34Orwv6fdmqA=;
 b=a9dTW91oA3DpWGbYAbiuhWriHq+Xe2kDgP8DUxvRA5jJt0LGZsw2SzfpyQyaKzcrRLNkBb8evdM2fsRynm93zItnD3kkm7Phu4FlYUx9E7lnFZ5u/PRgKvWbV64wENdbRYZlxp6njTqwSRK8ANN7GzBLSjl220d5B1CJEYoNuAQY5Y5YboeDFw9b9RXlwaBY0GQGOqWCA5FFRSwVF7tadmJvWL4bT/lkNhYYxqLnmJNIJZCfuwiGJpRo4EqY1g3VVRedwH7FL2D55971dSx+SDgPpfwYuwQ/UFRgNk9nN/w0acmB4GnGeIc0muYylTOfXV3lL53YhC8HfdxaxQbd5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B6gE6WnccrNLri8ADzT2UuI3nsJ5+2A34Orwv6fdmqA=;
 b=5NDGscFHy8paEEpYl8APpy5l4g0zqcG0bxFwDePX5ag7B3TZANSYfNAPgB9tNpAyxA4QXIxt0+L11HlfwxpFQ3nBZBHShfi0ZsZhDnjde33yBWdB7Fho2s/RPTiPAlvS7i1LjtXxPXXxrU4ZYKW+vinB0b1l3YYIDq8l80PvSygp4oj7O8HGCRGBY4zxyN9S3J9+hjT6HrXFMrT3OaWZBHd1Czu2PYAQrMJ/eGs1jxGbySdWdPniZOjNVlqjjUR5veU2x/+FwcymwESdsByzTsWhDdJK0R3rnPjOSZeb/hMKLOlGGneMVyW+UpZ1bE4ptpIN2u0rSo5QEzheJq8bmQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2533.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1e0::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Mon, 4 Jul
 2022 15:53:50 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624%5]) with mapi id 15.20.5395.020; Mon, 4 Jul 2022
 15:53:50 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Peter Zijlstra <peterz@infradead.org>, Sathvika Vasireddy
	<sv@linux.ibm.com>, "g@hirez.programming.kicks-ass.net"
	<g@hirez.programming.kicks-ass.net>
Subject: Re: [RFC PATCH v3 07/12] objtool: Use macros to define arch specific
 reloc types
Thread-Topic: [RFC PATCH v3 07/12] objtool: Use macros to define arch specific
 reloc types
Thread-Index: AQHYh/j0DIzngoRu1UmoV6wDuUvhyK1uHqMAgABN7AA=
Date: Mon, 4 Jul 2022 15:53:50 +0000
Message-ID: <47f7a3db-7b34-1991-11df-f0f7e1317614@csgroup.eu>
References: <20220624183238.388144-1-sv@linux.ibm.com>
 <20220624183238.388144-8-sv@linux.ibm.com>
 <YsLLsE2oajICIYmq@hirez.programming.kicks-ass.net>
In-Reply-To: <YsLLsE2oajICIYmq@hirez.programming.kicks-ass.net>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 555a44ff-2dfc-4282-120b-08da5dd56398
x-ms-traffictypediagnostic: PR0P264MB2533:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  6ABL9NCfGh44lcBOaSc3dQCQ1FsEgrExPFjldukUfT4s4YTZzhQ8Gw7hnyPmDq+KQk/7kyJMS5kN2QUZfmnPm5IcWGczgIgxAxMfN0W5eusi+GNZAP/YxfhS/DkbrNc9HC91tihuKrW2a3eCkSS7sIGs+UqEb2ay0IYlXjH/IHXK/rMpkg2Zsg++ukj/m83F7ecPvVNseQro1Z9SXt7KU2iJcuhHWsWn/ksWexNLdb59dBVf9I8qRrOh7+Nk/Ig6BUqj7YhMW6SnwEeYugDq41Thj762lb60o+PQxyks8cN3rsVbTt2uvo41Bk1C1yiXYHQ+/te2+WyOKi6imEsj+Z5xoBlpg8jan/NvvsVREtQTFSIiZbQXADghT0XLEw77zwlo6Fq62nNT00R/QVz8O9FMTKfAtYA68AsO7C35MwlVTkdvk7bTMVlz/UBFR/Lp2XmiOTPy5faGDJ5ju10ta8Tk3GqWes1J9g/uFVptURlKr9hEuCEPjZ2qvA5ptFiA6sWbTUEjQPT8GhvREDebHmZOgUL73bGhHP6gxXa0KTUsjVcxRXJhFK18Nzid5adQKGRccxYiWvYNV0NMNOHN5wJ8BCaI+Outy7Zz6btDbOVViTQAdCe/x2L/I33h+O/OQnSPgKBhLiryDZxwYelXsZD0NdSKn8EOEuD3Jb384YZ7QeejMQeALBI3p7MxM4XqABDX1iGQWrvnBu3d0SdM1QP1p0Bw/7Btw2iIWDK3EU0F8r/6VT7k82SQ+ePaNfSBGNFGlQ1B0TGdhB+c9p6XWf5t+V7MYy25vqcADrFRSHomA6W8FJyBePg4OkyJdXoSOmLCo/YRxVrL5hgAcw9q6KWxG4M56trB4mC0+Um7/kk471BuxQlMeI6wVuQvRMPoGUr7l9xeE7boBM5UIFS0Zw==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(39860400002)(136003)(396003)(346002)(366004)(66574015)(83380400001)(186003)(122000001)(38070700005)(38100700002)(66446008)(8676002)(4326008)(76116006)(66556008)(64756008)(316002)(66476007)(66946007)(110136005)(44832011)(8936002)(5660300002)(2906002)(6506007)(7416002)(41300700001)(26005)(2616005)(6512007)(54906003)(31696002)(71200400001)(478600001)(31686004)(86362001)(6486002)(91956017)(36756003)(781001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?MGltV3gvWDFWQU81TlBLY3VFRDVZUURPaHhSOHdjanJsUmRwUW8zZE45YXcy?=
 =?utf-8?B?RUxsclJLUUdZQ083SkFKNlExVE5GVUYxTHFNaDlzZTVQWXIvYWU5L2ZWbVh2?=
 =?utf-8?B?amE3RENhZ3UwMzBkOHVQR2Y4SkxvZjYvNDd3NzdoQjFPR0wrNG1SQ0VTS2dO?=
 =?utf-8?B?VTIwN2VHVGdseGVvenp3aThPaXk3cUxKbDdEajQrd3FwT1dYSHhlN3EwK3Nl?=
 =?utf-8?B?YlJ5YW5IbTk4SDd6bHJVZzVyN2hUbXlnbmx0eEFVQ1hEZTcvODczM2RyVUFP?=
 =?utf-8?B?MUxGNEJ3K1phN0d2Mi9LZGFqa3U0eGRUUUpTOUx3OE1OZEZkK0N2QlZ3MjQy?=
 =?utf-8?B?bU1Ua3cvTForaTJJczBWRmJRRFNFSUlLbUMyajVnNDBRSlJyVHJ4SXM2VWVG?=
 =?utf-8?B?V3NKUXBrSVR3UnJ0blVWK25VODZhSm5mRU00YzdqdERTL2JoQlE2a3U0cTZv?=
 =?utf-8?B?UXJoMzNMUmZabmF0VlEvUzN1N2JNWW93c1RHeHhqb2F3UytyMlBFWjBhdVVa?=
 =?utf-8?B?R3BnUXE1Q3dHQVRyMU9hOEg3T3Q2VTREREV2dkI0RHFkWDRiRDZVWUJPSDZB?=
 =?utf-8?B?SEpmQjBWcmRETjBwRndwUkdMUjhxWnpBUkdJV0NtSW1qanZTS3lhU0ZucHZs?=
 =?utf-8?B?WkZrNElzVEtjZ0h6aGk5MjhJc1NtNFRTK0wvcVJnS0FURDNYcWQ1SEZRbDI3?=
 =?utf-8?B?L1RQU0ZPcHRJMjhtbEhWdVNLN1k1Tnh4aThQa0ZYeXlPbi9XaG5UZWFBTVVS?=
 =?utf-8?B?NGk0SGFTOVlmSjBIdHpwUG5IWnBnbUt4bEh2VUVRTDdDQ1orSW9OYzh1NXoy?=
 =?utf-8?B?ZmxvTVJEbVQ1elYyVlhabWxGNUpBRWl4K09OS3hJT1BiYTFVdkd5WlJqQUVy?=
 =?utf-8?B?akF6TVVMRVdtZUdGV2kyVUFGckZmZVkzKzdwSkJRVllmd3RMenRjbGZjc1B1?=
 =?utf-8?B?b25vYjFrM3hubWx3T2E1dmVaamRYRzRqMG9ZYnBDMU92RE8vem1KVkJjQ3BW?=
 =?utf-8?B?ZHBBb0Q1RzBuZmtrNmhmQTZENHFZTWl3bHFVTUtEbWpaTEhPQjlEUm9aZ3JG?=
 =?utf-8?B?K2YrN2RVUXYyZno2dVd3YkV3M2t3a3JTQU5zVjRkYTgzQ0x4M1NETUsrUm9W?=
 =?utf-8?B?RHRXajMvQ3V1Nmhxc3dydzhRNXgrYm5OMnIvWlhQOUV1ZDl4OUl6QkkvZkor?=
 =?utf-8?B?VWlhc2xiM1RvYVhCcGZGZXducmRoc21Bd2JyNUo4LytaemdpdjI3c1FBNjVM?=
 =?utf-8?B?S2l4R2ZyeE45aDFUaFZaWkdBSml5UjIrZnhOOVFFTDl2em95bE1FSUN5cC9t?=
 =?utf-8?B?ZWxRMU9PQTg2NWY2T29JQ2pLdHgwVW1WaUZmNjdCUk5IaCsrOFpsUjI2NW9Y?=
 =?utf-8?B?WlQ0SHIySklLUGxHVlRzT25vc0Rhcis2UFNVY1g5bmVydFRub0JnM1hkNWRv?=
 =?utf-8?B?NjFSbDVudHZnb2VYalBwVTdnQWNNeHRBOHU3c2pZZC9raE5ITDVQOURETnR2?=
 =?utf-8?B?SlRlWVlnY1hzU2RHS1Myczh4MDY0bXNGdzdIU0M5OWphajFLS3g0cktXSy9t?=
 =?utf-8?B?MmtZa3Z3dWg5S0JNbUFmK1kzV0R4VFFva0x0SC8rbkF0WUxMTVI0L3BjeVVT?=
 =?utf-8?B?R3dJSkhnRW1jSjFIbUJBeXh6QklBaGYwQTFyUmxGdVJtaUhKc3BCYXFLd2tS?=
 =?utf-8?B?U0t1YWxqdVJqYmNlM2VzQ1dhcENWbDhzREU0ME9vWDJSbEdieWxPMDFJQlFj?=
 =?utf-8?B?cm5hV2t4aGp1c1c1NkxVNnIraTNhQzZUSDB4WlFFcGwzcUl1cncvaWZkSTNJ?=
 =?utf-8?B?MFFaT3BSR09WbUJpZG5ZT0xxVFhhc2V2d2ROdjNyN1o4MW9MYk9XcFpRVkh1?=
 =?utf-8?B?eXJiMzFDNnBXWGVFQ3oxQmpMbkFmeERXdmZRamRzVmZlUzF3ZXJpeXh5bXdh?=
 =?utf-8?B?aStGaFNYVDVHVXJDUHFUV0ZFOTZhNEI3QXc1amNucmgvbUxBRG9WRVh0Y0R2?=
 =?utf-8?B?WE54T0VTT1d6aEYwY3pMZ25UUXdBRjBGYjlkbWtxTXhpbGxXRGpsbExscC9x?=
 =?utf-8?B?aDJuVitDcmkwZS9zOENWcUtKL1NFTEtsK29sZUJoMVRiODc4ZzdsYy9kaFNw?=
 =?utf-8?B?L284MFQvK25BeEFqS0FYNWdSZW85VE93d2ZxWkttYllsUDhLakxLWWFaVnNM?=
 =?utf-8?Q?QFLHK12oVotlvEj7jQqhDKQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <84041149EB8D1548AD402628C2D4D0BB@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 555a44ff-2dfc-4282-120b-08da5dd56398
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2022 15:53:50.6049
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QYRhh2M0eV6+wdGjnraIFHxsNOQ7DSHnwWZY2Dt6QQX1oUi/1vQ3qVugFq16GS280D39xrlj4JBFySxYrMpWqL7sv5cOXMpdodRfTRibPN4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2533
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
Cc: "aik@ozlabs.ru" <aik@ozlabs.ru>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "rostedt@goodmis.org" <rostedt@goodmis.org>, "mingo@redhat.com" <mingo@redhat.com>, "paulus@samba.org" <paulus@samba.org>, "jpoimboe@redhat.com" <jpoimboe@redhat.com>, "naveen.n.rao@linux.vnet.ibm.com" <naveen.n.rao@linux.vnet.ibm.com>, "mbenes@suse.cz" <mbenes@suse.cz>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA0LzA3LzIwMjIgw6AgMTM6MTQsIFBldGVyIFppamxzdHJhIGEgw6ljcml0wqA6DQo+
IE9uIFNhdCwgSnVuIDI1LCAyMDIyIGF0IDEyOjAyOjMzQU0gKzA1MzAsIFNhdGh2aWthIFZhc2ly
ZWRkeSB3cm90ZToNCj4+IE1ha2UgcmVsb2NhdGlvbiB0eXBlcyBhcmNoaXRlY3R1cmUgc3BlY2lm
aWMuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogU2F0aHZpa2EgVmFzaXJlZGR5IDxzdkBsaW51eC5p
Ym0uY29tPg0KPj4gLS0tDQo+PiAgIHRvb2xzL29ianRvb2wvYXJjaC94ODYvaW5jbHVkZS9hcmNo
L2VsZi5oIHwgMiArKw0KPj4gICB0b29scy9vYmp0b29sL2NoZWNrLmMgICAgICAgICAgICAgICAg
ICAgICB8IDIgKy0NCj4+ICAgMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvdG9vbHMvb2JqdG9vbC9hcmNoL3g4Ni9pbmNs
dWRlL2FyY2gvZWxmLmggYi90b29scy9vYmp0b29sL2FyY2gveDg2L2luY2x1ZGUvYXJjaC9lbGYu
aA0KPj4gaW5kZXggNjljYzQyNjRiMjhhLi5hYzE0OTg3Y2Y2ODcgMTAwNjQ0DQo+PiAtLS0gYS90
b29scy9vYmp0b29sL2FyY2gveDg2L2luY2x1ZGUvYXJjaC9lbGYuaA0KPj4gKysrIGIvdG9vbHMv
b2JqdG9vbC9hcmNoL3g4Ni9pbmNsdWRlL2FyY2gvZWxmLmgNCj4+IEBAIC0yLDUgKzIsNyBAQA0K
Pj4gICAjZGVmaW5lIF9PQkpUT09MX0FSQ0hfRUxGDQo+PiAgIA0KPj4gICAjZGVmaW5lIFJfTk9O
RSBSX1g4Nl82NF9OT05FDQo+PiArI2RlZmluZSBSX0FCUzY0IFJfWDg2XzY0XzY0DQo+PiArI2Rl
ZmluZSBSX0FCUzMyIFJfWDg2XzY0XzMyDQo+PiAgIA0KPj4gICAjZW5kaWYgLyogX09CSlRPT0xf
QVJDSF9FTEYgKi8NCj4+IGRpZmYgLS1naXQgYS90b29scy9vYmp0b29sL2NoZWNrLmMgYi90b29s
cy9vYmp0b29sL2NoZWNrLmMNCj4+IGluZGV4IDk4ZTg2OTcyMWJjNC4uODhmNjgyNjk4NjBlIDEw
MDY0NA0KPj4gLS0tIGEvdG9vbHMvb2JqdG9vbC9jaGVjay5jDQo+PiArKysgYi90b29scy9vYmp0
b29sL2NoZWNrLmMNCj4+IEBAIC04MzQsNyArODM0LDcgQEAgc3RhdGljIGludCBjcmVhdGVfbWNv
dW50X2xvY19zZWN0aW9ucyhzdHJ1Y3Qgb2JqdG9vbF9maWxlICpmaWxlKQ0KPj4gICAJCW1lbXNl
dChsb2MsIDAsIHNpemUpOw0KPj4gICANCj4+ICAgCQlpZiAoZWxmX2FkZF9yZWxvY190b19pbnNu
KGZpbGUtPmVsZiwgc2VjLCBpZHgsDQo+PiAtCQkJCQkgIFJfWDg2XzY0XzY0LA0KPj4gKwkJCQkJ
ICBzaXplID09IHNpemVvZih1NjQpID8gUl9BQlM2NCA6IFJfQUJTMzIsDQo+PiAgIAkJCQkJICBp
bnNuLT5zZWMsIGluc24tPm9mZnNldCkpDQo+PiAgIAkJCXJldHVybiAtMTsNCj4+ICAgDQo+IA0K
PiBHaXZlbiBjcm9zcyBjb21waWxlcywgc2hvdWxkIHRoaXMgbm90IGFsc28gYmUgZWxmIGRlcGVu
ZGVudD8NCg0Kc2l6ZSBpcyBlbGYgZGVwZW5kZW50IChGcm9tIHRoZSBzYW1lIHNlcmllcyBbUkZD
IFBBVENIIHYzIDAzLzEyXSANCm9ianRvb2w6IFVzZSB0YXJnZXQgZmlsZSBjbGFzcyBzaXplIGlu
c3RlYWQgb2YgYSBjb21waWxlZCBjb25zdGFudCkNCg0KUl9BQlM2NCBhbmQgUl9BQlMzMiBhcmUg
ZGVmaW5lZCBpbiB0aGUgYXJjaGl0ZWN0dXJlIGVsZi5oLCBhbmQgdGhpcyBpcyANCnRoZSBhcmNo
aXRlY3R1cmUgZm9yIHdoaWNoIHlvdSBhcmUgYnVpbGRpbmcgeW91ciBrZXJuZWwsIG5vdCB0aGUg
DQphcmNoaXRlY3R1cmUgeW91IGNyb3NzIGNvbXBpbGUgb24u
