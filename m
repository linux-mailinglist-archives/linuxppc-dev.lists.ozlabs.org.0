Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F265341F9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 May 2022 19:05:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L7crr6Chfz3c9L
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 May 2022 03:05:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::61b;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on061b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::61b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L7cqJ6ltfz3bm8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 May 2022 03:04:10 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZcDICjPdY8f/hbH58dfNOWNRVPzD7vcTTR82msy3oE+kd4+ODYwsWSMt5riaBq4RACSpLxQJnRDlOtz5cx9uHMpKex4F7I8kmcBLJU87AVGLVLou4ur6oUwXGdutfuCPXr8OY8YMIL8MX/6tDl0Y72TaloxbUCWz1eEmbsjXcJ1428XoVdPVktelcdHvJaqqpai9ATxuzJebySWyEMfa43zB8iZqz5Fucpw3UmSQZgAGBzIqEE55cUygS9tqfrzyboppsHwVa4y+4Jfufn9ZFKNEAvFzBTJZdllZ9faetee09cFi3GJuavjopPpn3dovp9ZdYBNgtKHMJpYNSFahJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dZ2XBvaQtYkURNl50DzM+4/oeYZd2RZSeRo8aUSVVP4=;
 b=nsYStdmbf+ioAVYRVaTqL+bNp9MtgE1HFdpwgCwDbwuvvSuAIT6a6n4uIJZGBACZD85rDueepLDRdfcCOLx+VuHacdoNkdVQrY0BHy4RvCMqEKgcway6wZHdE36BUdWp1Ow3JefXJytqWDmG41yiu4sO5qRqCZCnUlN34MOz/lYnE/GsaWNtS2gvTa4pGHYBf9ChE/I+INYGip81C+7uBHQyHH8wYDcAojNoCbgHIfQdFzVjM8PVj77lV5Gcqvuwn6jThLGv7xhmXSPJ+3vbv1A96HsAQkYoJAS7pjBSUHUq7bYPF1OOt9aHz167HzVriitJFEVDZ87r2rTI9A8VUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB3075.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Wed, 25 May
 2022 17:03:47 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356%5]) with mapi id 15.20.5273.023; Wed, 25 May 2022
 17:03:47 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [RFC PATCH v1 1/4] Revert "objtool: Enable objtool to run only on
 files with ftrace enabled"
Thread-Topic: [RFC PATCH v1 1/4] Revert "objtool: Enable objtool to run only
 on files with ftrace enabled"
Thread-Index: AQHYcFBQRHI4HK2VAEy/EbAcP9FWz60vygSAgAAIJQA=
Date: Wed, 25 May 2022 17:03:47 +0000
Message-ID: <d8e5878f-113e-dc81-2326-472cd9122088@csgroup.eu>
References: <cover.1653494186.git.christophe.leroy@csgroup.eu>
 <262b4209a4a8fe99a97d23b89776380cbdad8b38.1653494186.git.christophe.leroy@csgroup.eu>
 <20220525163437.GH2578@worktop.programming.kicks-ass.net>
In-Reply-To: <20220525163437.GH2578@worktop.programming.kicks-ass.net>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 353f5140-695a-487e-443c-08da3e708883
x-ms-traffictypediagnostic: MR1P264MB3075:EE_
x-microsoft-antispam-prvs: <MR1P264MB3075692C15CC0245A06E4419EDD69@MR1P264MB3075.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: O10uthKvKqXofbtHmSIC+AyticUx/mroIzhEtQpuFv03GehjGqjyIwjyq9vQhRn5hCJUNZuWGs+WSE1V3ncHYR2j7Jf1ELNeeMArxnUi1jxOsgnxodubXhiUiCyx56Frc8Pq9uCHX/RbmnPbDnQ+SUl6NDTC+Cqj63iR/y7GvuGMnfMGKNaHyJuNK+ykBTBT9iMUigMtiSPZvnmHXA75BsbmkA8PZvUL5LOBf773M0RKlqWTHSJd0HeH0e60L3h+rhlHhMyORoXiuf67WEoNSJ6Kaxc/1Vv0kBwM1FihMXQKdGqUcAN7ozGlNc8NRY7eYFeAEkBfSc7fD0ZLpBPu50ShFNEqlzGE9sgrL9xNBCPl45gv6fGj4L0Xlnl/87LntyeTiJ1L2L4AIcrRsuVkygz3zmG383WEw8SKl5GvfoM03dU+s2fRs6ejM2a6jlbJ9Z5Uc+8eX5XmgtGBpINtjQY3qmIS4Z0hSuMlQWn6JX6xqcZyl8Vqb/vEHjbRv4H2RiXh7J3ZdTj8KhGom6RZkVnx+s1zSujk20oidCy/Giao1oQ2qRfEVzyelA1hWf5hrcynMq6EJmiSWs/ljklHHBMYxNrlopSRUryhV7JwO/mt8yYQcyc6OiKBhhfb7WgUKjgGwZZnPl7GYwUNXU1YjFpt8DFL4W4BrIjzx0SAmiFoFCePhAuYqe+PJfcLaz3mIOqucbpK67Zu+LCbY4Dw7v2SuQrZCirVJk58vtsyxELHCZcxWwDIwDyRIxkb3JHLE3osEbsrekOhD4/E3x092A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(186003)(64756008)(66446008)(91956017)(54906003)(66476007)(66946007)(66556008)(4326008)(316002)(6916009)(76116006)(86362001)(31696002)(71200400001)(8676002)(6486002)(38070700005)(36756003)(122000001)(38100700002)(508600001)(7416002)(2616005)(5660300002)(8936002)(6512007)(26005)(6506007)(2906002)(31686004)(44832011)(4744005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?anpCT1hIbWt2SFhSaFFVMHFwSlZOZFVCUVYxanZpejhLcm5naFQ5Y1pXeVMy?=
 =?utf-8?B?cTdVbEpVTVhwcC95dWprSFZUaEZUZjY4clFlMlBocGJna1lkWExVV1hzeU9Y?=
 =?utf-8?B?YlZGb1ZLN3JBelhaRTdrTGpyQ2xiNTBBQ2RySUtZM0JGNXJld1QvYk1SRkwz?=
 =?utf-8?B?SUx1WnhHVkV2ejZOMkMxZUo0dDFGeVNIckhzRWJzT25NVVJMQ3o5YWMwSFdE?=
 =?utf-8?B?dVZwT1ZZVWV4WjhkN1ZZdWkydHZSZDBNS05Tald1MzBNUFNjY2VYcTRtUmFZ?=
 =?utf-8?B?YUFWR1JYOUNZN2pKemtLbXpKMnovcld5emhoN0VSaEdLaXBKNjZua0c0UDV4?=
 =?utf-8?B?VGtlMVlHbkxqQjl2S0lJaEZPWmNDcVFFc2R2WVExQXFGbm5rRDV3L09RdTlo?=
 =?utf-8?B?bjVLM2thYjVOSFpPTHhNaE5RUVNORVVkWHlLZlQ5Y3RxcXJSSVZGTjhwR1pP?=
 =?utf-8?B?dG9peS9SU2o1Ry9mcUVlNTJmZkFnRVhGWmpHdks1aEFjUUhiRXB4ZXBQV2Za?=
 =?utf-8?B?TDMwdkp5WUx1TjFhWDgzelBlNzlRQk12V29BS29LaG12SzcyeUJtc2pldFcr?=
 =?utf-8?B?N1BvZEVxaG82N1U1TndYV0hLSTMwamJrWFdJTzZudzN2MExqb2ltZUxGelBv?=
 =?utf-8?B?YkhxRnhPTWsyQWhFdURObk9FNW9VUDFLYUVkRmNEc0ZFSmdacEUvMjAxcDhP?=
 =?utf-8?B?YnlEQXA5MEJxNHZRZ0lJNDBoTGpFQ3ZYckpqeXNPWXdFQTdFTitEQ2xxbE1Z?=
 =?utf-8?B?a1pCREJjSGs0NFE5T3l5bmdMTDBpZEJtekF3TlVOa0ViNVVtSHhmUkRCQUxL?=
 =?utf-8?B?Ry9vcXZRaDZPTXlEenZacExOWWxncWVkNmo0YWg0elF0aTFMVjl1akNSSUhz?=
 =?utf-8?B?dzcwd2FHTnZNc25MYm5qR2cveWNXOFVBdXp3VkdEcUNSa0pKc2FUZVZWMUJP?=
 =?utf-8?B?a3dDZE8wZWluSng5SXc5UU5oMlJQSmJ2dHVtdGU5bkhYaUN3RGFjVldEMEFz?=
 =?utf-8?B?cXZxb2tzTVV3RWJKRkZRRWEyRVFSOE9IdVlINGFPSkdaNGdkM0hNdng3NTQy?=
 =?utf-8?B?dDJFOEtMaHhVTFZCQTdMRUorYml4NG5EbHFNMEdJZ2dPTEJBa0p1ZlBGNXdu?=
 =?utf-8?B?UGdaNkwwSGVsenNzVEVqTkNWL01taGZ6RTgvaUIvekRFVDRSenVuMGZPT0Jv?=
 =?utf-8?B?akw5a01sUjA5azhXdzFoVTVyOGtSWG12N2pQY210VW9ubnIyRmlSWnFqWFRj?=
 =?utf-8?B?ME83azlMUlJTZ0JUNWtwOHRlZWtrZ2FlVHVVTUFmS1Q2UllKN0Q0K0grOFhi?=
 =?utf-8?B?cTk5eGdlREppR2xKUzVMbENzbXBSMEVNSmJ4NUhZY21BRVNYc0QxWFhkZnIr?=
 =?utf-8?B?WUhabGJMaFM0ZWhUd3VGSkNwV296ZVJtZHFzUU1seGRMUGFBZGtFWXAvWkxO?=
 =?utf-8?B?WHozTys1dU9TdXg0bXdvcFRFY01vUzVkQ3NsaDVIZXhQWWd3NFVsL2U0YWZi?=
 =?utf-8?B?ejhsTzJlNG5LZG94ckh6cnEwYWJFeHA5SkY1bWlwM3pnNkdHQnpkbEJjWHVl?=
 =?utf-8?B?S0g4cC82ZlRCVU5TbEtpVGNLZmI4QklpUnRDbmVJeUhHZkoyV3RId3F5czdj?=
 =?utf-8?B?dkZISlVVVW5WZ0lTYXpRSjBKSWljSDFiMEdpNlBhUjEySUdBYU9NVGRwckZV?=
 =?utf-8?B?eGV1RFdkTFQ0WkJZODVUcDFIMG9KKytpdFVFQ2g0SGtjRyszdW1yd3BxR1VX?=
 =?utf-8?B?REJRUWZ5RkhBeVg3MTFzMkUyMHV5ek1hYkpYandITFo0MDhPQnJXdjdTakhx?=
 =?utf-8?B?S2xZU3ltVFlsZkhIQUdZRXg1WWFzR1ZLMFJCVTYvRzZxbGRnajArL09CQ3dp?=
 =?utf-8?B?b1FLZGgzMVlVN09hOWFaU3JicXhaeWd4MStQQzIwNStZbDVSenZuVUNlclF3?=
 =?utf-8?B?bSswSlR6d3krRWdSTXFQYjBrYWgvd1JaZmtDWndCSnIxMU5DUGE3ZEh5djNk?=
 =?utf-8?B?WlVVa3B4N2pBT0ZQdnZzRTVhT1AzdENrZStBUUlreDZyL2k1RVV3VUM3SzhW?=
 =?utf-8?B?QytiSDZYbC91TFVXb3RLUVdrOHBkY0JxTDUzSHhhK1NCY3hRcWtVZHhycTVP?=
 =?utf-8?B?aEppWXpwWnRyb21JN2htNGRQd1hRVkJmSWc1UFdJQUdjZ1VPWWRYVVZNNWFm?=
 =?utf-8?B?bFE4TDN6bDh1czZzdm9rQ3kyUWlkRDNSYzFubmF2TzBJZmZTek93anAraHN1?=
 =?utf-8?B?ellBWWlsUmZOVXBJMkF5bERTZzh4d1BPc01oTTM0M1dkeThQa2oxZ2k1bCtG?=
 =?utf-8?B?YTBGRElnYU9GRmRleUErSEtxTHBXamtrVEErdURQaVhwZ1lvWkVtbWJqYWJy?=
 =?utf-8?Q?KHpYlpBfGiXLfDkUhQWAtHOT+jP6C7TqI3oLi?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B3CE2BB9F24467429A19E9C4CA488272@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 353f5140-695a-487e-443c-08da3e708883
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2022 17:03:47.3753 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VMpchRSXxZlhhz1QjlOxKCidMrMVeuYs1uOYT9ynST7PANKUYh5uASMuRv4f+lCSy6vchRA3AA7OQwYeQQvrw8R99m8Dsf7WRKTSVHbodx0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB3075
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
Cc: "aik@ozlabs.ru" <aik@ozlabs.ru>,
 "jpoimboe@redhat.com" <jpoimboe@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>,
 "sv@linux.ibm.com" <sv@linux.ibm.com>, Paul Mackerras <paulus@samba.org>,
 "naveen.n.rao@linux.vnet.ibm.com" <naveen.n.rao@linux.vnet.ibm.com>,
 "mbenes@suse.cz" <mbenes@suse.cz>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI1LzA1LzIwMjIgw6AgMTg6MzQsIFBldGVyIFppamxzdHJhIGEgw6ljcml0wqA6DQo+
IE9uIFdlZCwgTWF5IDI1LCAyMDIyIGF0IDA1OjU4OjE0UE0gKzAyMDAsIENocmlzdG9waGUgTGVy
b3kgd3JvdGU6DQo+PiBUaGlzIHJldmVydHMgY29tbWl0IGNmMzAxM2RmYWQ4OWFkNWFjN2QxNmQ1
NmRjZWQ3MmQ3YzEzOGEyMGUuDQo+Pg0KPj4gVGhhdCBjb21taXQgaXMgcHJvYmxlbWF0aWMgYXMg
d2UgbWlzcyBzb21lIHN0YXRpYyBjYWxscy4NCj4gDQo+IFJldmVydCA/IT8hIHdobyBjb21pdHRl
ZCB0aGlzLiBBbmQgdGhlcmUncyBhIHRvbiBtb3JlIGJyb2tlbiB0aGFuIGp1c3QNCj4gc3RhdGlj
IGNhbGxzLiBUaGlzIG11c3QgYWJzb2x1dGVseSBub3QgYmUuDQoNCk5vIHdvcnJ5LCBpdCBpcyBq
dXN0IGEgZm9sbG93LXVwIG9mIG15IHByZXZpb3VzIHNlcmllcyB3aGljaCBpbmNsdWRlcyBpdC4=
