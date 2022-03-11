Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E99F44D6261
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Mar 2022 14:28:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KFRbT5ZJ0z30Dy
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Mar 2022 00:28:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::630;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0630.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::630])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KFRZz1GJtz2yWH
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Mar 2022 00:28:25 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZoVu3b0yl56TrI0k5zT5mR6G+WvnqbYRHEd+WJS8XR6ERO/LrZxuyvU6uKH4uO7aE7/UmQb0Ciry2zGpgMq+8ahINoAv8u8H2LT6QH17Y3/mXhmLok9d6RL8jEVlKYC08Tgf81nPjtvX2/EabdeK8FFTawB/cSB8XI77h4U0ss913vCGfNpC1XJXU3yDMPSt5e/+ffJ8ZNOdm5AhBC/BDWeWwdmfjPNlV0F8KQ2Kd+XzGDEFZp5nlZb8n18O4bfAOJDgkm8LvIWGUT5nBPC0lfb/ubJbagdJWvyA6dH7AJksh26PYd/N3ru+1mjNqkhkQbYyDU9isAemfcId6UTZxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lw4lTfa5958HNMVR9HM5SpLcgE8P7wfCjBGTD7jfc+w=;
 b=a99gJdGuB0aAj1fdlyne+Rqar6E72bFrrPRHkgJJQAEj0AzHqP+Uqgs7JcmzGvJlE80j7WxV0d5sIipdn0ra/nCQSAYX+h+Sj/7/cINGGf+N8nfjZrwvvnWhxXuWgLO/Q4kdHWV9Lw3Us4BVmAQ0CmWPYJCUXHp63znLF0J9WyHk8AEtOzFNNUaI/2GkxQ2A4KoFru1Sy4TnVmkz2QQEgxthFCd6ZkCJeIc6t5cGhXNa8TGwcgVDIOCzq0kuIGUbFDiqA9fLFNcfxoSlvyCY4uYfe3jBoIsJkkCAKFtZCCHSn02TKsCF7YzJri/76wnzYd9dKV1aVIxSljhk0FzIOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB4314.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:25d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Fri, 11 Mar
 2022 13:28:01 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::cd2f:d05d:9aa3:400d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::cd2f:d05d:9aa3:400d%5]) with mapi id 15.20.5061.024; Fri, 11 Mar 2022
 13:28:01 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: YueHaibing <yuehaibing@huawei.com>, "mpe@ellerman.id.au"
 <mpe@ellerman.id.au>, "benh@kernel.crashing.org" <benh@kernel.crashing.org>,
 "paulus@samba.org" <paulus@samba.org>
Subject: Re: [PATCH -next] powerpc/kuap: Remove unused inline function
 __kuap_assert_locked()
Thread-Topic: [PATCH -next] powerpc/kuap: Remove unused inline function
 __kuap_assert_locked()
Thread-Index: AQHYNUubIFLEd2u0mUS+Ih8fBkCb2ay6LRIA
Date: Fri, 11 Mar 2022 13:28:00 +0000
Message-ID: <3fcb2dcb-fc73-8495-f87e-8445ca2b1254@csgroup.eu>
References: <20220311130017.22936-1-yuehaibing@huawei.com>
In-Reply-To: <20220311130017.22936-1-yuehaibing@huawei.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8cd76375-83b1-4bec-3c73-08da0362f6e8
x-ms-traffictypediagnostic: PR0P264MB4314:EE_
x-microsoft-antispam-prvs: <PR0P264MB43140CDA4E5F84505941F6C3ED0C9@PR0P264MB4314.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7UH9KX7/+8u0cJdxDObz+UnPtlprvPj6Jh+QtMk6f5HgvG43StenEnIrLHcHUnGATmtHGJ9+9j3Wv5Yf/2+MSHMNjpDBbBuwj6P2yVdryaTzg1oTTdhOTSaqzu0QHa+sl9eZ27yl70R0XHRZwD6thlVJPfeMHsHnCKbUHDSmRR9fGOrFpCpb1kZ/3a/szL9RwoUpy0qbdhwgo5s+TweMO3B9iELZMYw0gc/ZjABmGjHaoPAxlCxuV+xzAkwdvRc7GcAwv67MfYDSd51lXTDit/H7/ZIlZ33OSJGWrmkXcpVyLYru30Zggd/EMq2qDhY58zhQnaJR/bcH6hYfzAYVv5QG4kP1wx0ot5gV2pBtOl1ZRgH97A/Wo82EJQTQehJ/eTjVPjcwg031AxDl14Habu2uXBQLOqH1Dzpwon5vMiKll8VqekHMA+GJO6CYaFTIlEeftyXqPNO+M4U+GP6uxCtlsxxI0eR2Rlf/gwDVU/MhkyA6dC80y/6wxoQl+bFhoQ2pUuUDWZqQ8gZeAqPzzJYGNYjItbS9Q2Tdy1iZjYBZU+u8yi4bbLF2gEtLoEr9ubA91b7ck5r/qqqy2jS2HAbiLV1iQISF/xlbkWZvKV/QWus0RT4K/Qg59XfCirle+op2pIpLdPaI1tVVFf8xMX9t8ISd1RGAXWadAwKiFLUztnF3tsOtz70fFs37lpYQMH98uKKt5DqPohsudcKunyELTRO5pUdibOcCi+h0beJif0gIDhS1/d4BmyX50vuwMagdZcbVM5G/QA8FgHAQ+w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(83380400001)(86362001)(31696002)(2616005)(6506007)(6512007)(66574015)(71200400001)(508600001)(186003)(26005)(36756003)(44832011)(6486002)(91956017)(66446008)(122000001)(4744005)(64756008)(316002)(66476007)(8676002)(76116006)(66946007)(66556008)(5660300002)(8936002)(38100700002)(31686004)(110136005)(2906002)(38070700005)(4326008)(54906003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aERmdUJyejRRNCtlcTBCOEtnYWlDdWZ6SURoMDlNWXh1YXl0TUZ2UExJLzNH?=
 =?utf-8?B?Sk5zUkJjLzZSQjkrSzFnMHBhYzVMYjhYY3ZOS1dlNStxWUNqRi9jODFsN2VE?=
 =?utf-8?B?NDFKOTlPRjRVWUtMZ0lISEtCMWlZUllSS1Yyek12WFZ2aDZjMkpBbzhZbHQy?=
 =?utf-8?B?T0FXRHJaY1BoZjFTb1puTEl6dWsrT1lHSHMwREt1UFFIWU1yOW4yU29BTzVs?=
 =?utf-8?B?bElHZElRTXV2RTVLNTlibDNWVmpnS3lCNEtHaFA0VlFaQWNOTllQUExpQ3h0?=
 =?utf-8?B?NVhkaktRa0dwWm1iZTkvcWhXdWkxVUtSM0tlTkdBWkQ1WC9saTlQNkUyOXhi?=
 =?utf-8?B?QURBajJpSkVvQ2FMUEJBaHFJQWNiN2RlYk1SR2ZvRkM0azhxRFdyUGlHdUlD?=
 =?utf-8?B?cTVobWxZUFpSK0RuMlJZemM5OXNrOVVydzdUcEEwTGxpMWN5MEE2S29zMzNj?=
 =?utf-8?B?VlJWaU8rSUVTRTNtU09YR2dicldDdmFDQktVcWd3NjFQTnJPZkN1OHh2Rk95?=
 =?utf-8?B?NGVxV3VXVnJBbXJLd3FJVEJoRVlTRENWQlBhL3FXRmhzcHdlRUZnVE4wcVVG?=
 =?utf-8?B?Q2V5WlUyQmkzZC80dFBBSVRQcDBONm02cGdRR1gwQWlYcjNWYSt0YVZZNVlD?=
 =?utf-8?B?Q25PVDBxOWtFbVNDbkV2Vlo0bDYxSVBMbTh3M05TS2dvQU9xNG1KcjR6bG9C?=
 =?utf-8?B?SkJKZTUzM1lFYlRkc0VFRFJJTit3cVZmZUN6NzRsVVd6b3cxV2tOaXJzZ0h0?=
 =?utf-8?B?ZnlBMnRYY3ovc3pRaVI3M2FMOGdaeDJjdzNwajkrZDZTckIxTVRXbHRZWmRo?=
 =?utf-8?B?TkFNdTJSRWc5RE13dkY4VkY3RXRScXkxejEwdHZCQjVBcFE0YXFQZVBDenBK?=
 =?utf-8?B?b1ppVE9Ka2dQclUxZ1N0VDhCYjQ1VWh5eno0VU5ib1pFV2gzclAzZTM0ZWFK?=
 =?utf-8?B?MndPTHg4RUYxOGU5M0FiNWYrSk1yUXNFTjhGSzVFb0tpU1pkbE5kcE9OYVZh?=
 =?utf-8?B?ZFljY2diMFdSOHA4ZnZoMjE0WVc3eDZlQXhVNjQ0Lyt6SVkrZ0IzVTRiU3gx?=
 =?utf-8?B?bEk1THBaQ1Y1SS91QitJcFhKeDdmaWxVWEc3Z1ZWeXdKajU3d05XOE1VUnBy?=
 =?utf-8?B?MGRucktnczJaYUhUYjlLWjlIaWNsbC9UTzJ1dDFjOW5WVFNIYmszSWN3anI1?=
 =?utf-8?B?TXV2V1kreCtRMEZNTmVQSGVLa1pRL0RuTWFaSFB0Zy8xVUdET0J1T3lDTGM2?=
 =?utf-8?B?ZThMVUNrOGZvZUVVUnYyZmFLbTBtdng2UlptSENkOEpnZTlHNUY1SHJWTGl5?=
 =?utf-8?B?bE1BcElGeUptNVFsQkk5aWxTVkEwd1JyRklKbitTclRNZ0hIZ2kvUzFNMVlp?=
 =?utf-8?B?b1owZy9QNFJ6VDJTaXIyL3hnUCtrVlVWRGFHOThFZW1Ba01hTHBmOGMwZ0Yy?=
 =?utf-8?B?QUFWcFIwMzJGTTVOWkUzY2lpcWpkL0JHS2lRVUMzK3NmOU5BdEN4U2QrTnBr?=
 =?utf-8?B?OGpubTQ0dkdRbkc0TDVsSmFCUUNvRitjWnFEckNwTStTQnRMYVJTUTA0RHdJ?=
 =?utf-8?B?NTJlMlovaWJteHVudXREK2haa0svb1R0QjFKbG9XVWVYTjBzbXN4RW5DUnd1?=
 =?utf-8?B?WFBLdC9YMm9DbGtxY2g2QUJKdTAyWDVoU3gva0lad2oxSm1jTERCREQweC9z?=
 =?utf-8?B?SllLR2w1bXg1cGIzK1NuUno5SmFCNFNYZXFZcldLUW8xT2xtT0lIaG5HaWJi?=
 =?utf-8?B?d3hJd2h3L3ZwbDY5K1Y2SE9VQWNGZHpySHQ0NDhRVVozMFJLWUJhTEQyQ3RS?=
 =?utf-8?B?UEhQVkxNQm9YMnAyVjA1dXRUVTFDWEVrdmx6bE9VeFZQbTNhcnhHRDczbmFF?=
 =?utf-8?B?NE9FYWsxTGY2YkJkd21WMUxXU3QyMG40U0UyRldMRERSOVYzK2NXclpYQkZP?=
 =?utf-8?B?alo1ZS81WFJHWnUxSVBtWmE3QmNrbGtydWFTUHNnNHJsZnNiN2krYVBGOUl6?=
 =?utf-8?B?SytRS2JRMGs0WkxpMU1aeWtQalNseDZtSkFsajZoSTVRdGthcldrQ2MrN3BV?=
 =?utf-8?B?cVZaWWZoUUY3N3VJQXppNDRCaWpkMjlCcndFVDhDRnpZcVFpMS80VTBucnZQ?=
 =?utf-8?B?ekRNcE41bFdyYXVRNTZabTVUbW8xbVI0bktCYXZiSGJ5RXNBTWJaaFpYUlpq?=
 =?utf-8?B?KytlNDl5SllMeGNSallCSDNmdXVZRWczRmtNVVZCS1JabHFjMzhSK2piL25T?=
 =?utf-8?Q?uCU4scv+Warru8Ia0Y/Njx7MxUNszN5IL3gjW717cg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CD1E29DC8DD13C48958413302D395A42@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cd76375-83b1-4bec-3c73-08da0362f6e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2022 13:28:00.9502 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DJGE/mkbH5NjnKm2FY4KJDTY5eGh/DAhJLSejaO7s9WyyLEqxjE0IXN+vkUggV96pcclMJtjeqSKUjCGx4yF+ybtMmUhaWffWLdKYe/9buA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB4314
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDExLzAzLzIwMjIgw6AgMTQ6MDAsIFl1ZUhhaWJpbmcgYSDDqWNyaXTCoDoNCj4gY29t
bWl0IDIzNDE5NjRlMjdiMCAoInBvd2VycGMva3VhcDogUmVtb3ZlIF9fa3VhcF9hc3NlcnRfbG9j
a2VkKCkiKQ0KPiBsZWZ0IGJlaGluZCB0aGlzIG9uZSwgcmVtb3ZlIGl0Lg0KPiANCj4gU2lnbmVk
LW9mZi1ieTogWXVlSGFpYmluZyA8eXVlaGFpYmluZ0BodWF3ZWkuY29tPg0KDQpUaGFua3MgZm9y
IGZpeGluZyB0aGlzDQoNCkFja2VkLWJ5OiBDaHJpc3RvcGhlIExlcm95IDxjaHJpc3RvcGhlLmxl
cm95QGNzZ3JvdXAuZXU+DQoNCj4gLS0tDQo+ICAgYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2t1
cC5oIHwgMSAtDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYg
LS1naXQgYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20va3VwLmggYi9hcmNoL3Bvd2VycGMvaW5j
bHVkZS9hc20va3VwLmgNCj4gaW5kZXggZmIyMjM3ODA5ZDYzLi5kNzUxZGRkMDgxMTAgMTAwNjQ0
DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9rdXAuaA0KPiArKysgYi9hcmNoL3Bv
d2VycGMvaW5jbHVkZS9hc20va3VwLmgNCj4gQEAgLTUyLDcgKzUyLDYgQEAgX19iYWRfa3VhcF9m
YXVsdChzdHJ1Y3QgcHRfcmVncyAqcmVncywgdW5zaWduZWQgbG9uZyBhZGRyZXNzLCBib29sIGlz
X3dyaXRlKQ0KPiAgIAlyZXR1cm4gZmFsc2U7DQo+ICAgfQ0KPiAgIA0KPiAtc3RhdGljIGlubGlu
ZSB2b2lkIF9fa3VhcF9hc3NlcnRfbG9ja2VkKHZvaWQpIHsgfQ0KPiAgIHN0YXRpYyBpbmxpbmUg
dm9pZCBfX2t1YXBfbG9jayh2b2lkKSB7IH0NCj4gICBzdGF0aWMgaW5saW5lIHZvaWQgX19rdWFw
X3NhdmVfYW5kX2xvY2soc3RydWN0IHB0X3JlZ3MgKnJlZ3MpIHsgfQ0KPiAgIHN0YXRpYyBpbmxp
bmUgdm9pZCBrdWFwX3VzZXJfcmVzdG9yZShzdHJ1Y3QgcHRfcmVncyAqcmVncykgeyB9
