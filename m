Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 372924C2F27
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 16:14:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K4Gdj356Yz3bbm
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Feb 2022 02:14:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::614;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0614.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::614])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K4GdC0vB9z2yLM
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Feb 2022 02:13:33 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gGZtJ3KQ9eZCL/DO48anVBWGV6A19UsSD0OoQoLT7k3/Eu0rpyp0zlTO0KWBp/uBeNKyugLPChCOEqgZsjMxlBFIHIj9q08v76tIozskapmaS7tHYPgjJwVo77kTR22EcfyxeBfS3u4lks3vlHHyrllEbp1K60kUWGSWyQDYbNGPxeXk/blvQckDt1Xz8f5PG8IubW0MbVsQnQ5kxKcQRioCwhcFAZM2ywUqsbr9Zv5qGfBVyFLeqO8O4z5jDUa0YBklUsBeOKO2sbS1Mf/UC+vAWkkMNJ462Ta/CZuakQ5WjW16MhCeI5mejqsl/UsIQ3piyvI21gg9bVJ4FEZCHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=02FgkqMscac5LZXr4aNduqfNRKC5gbh3cGRwtG1Z+UI=;
 b=CjZjKlgJyNGwF6+HpQfoXr/HAxG+yWcAb4VWNh+l8GDMMVIoqXVll2liO29u2II9cNeuKSXbwZS0ieytAT1KPkXiDiK7fmaklrvHQ/38avoIbgeJiqYkNcAp4392rag5xuhbHQ7JqdbKzjVICl9PHLBpsGivCRwcnB0bvDZ/DuajXXKJ2HS1z697qS9vE2I4e7GMgkLC0WN2OhSldwu/8tdnLaauy9lBOjEMAukUaXqEIVFOKeuckIJFEExSz6YpYL4iGCuQEKbxsxdw+mzyvbKodtNUt6Z1j+qxMRVnZP4FxyYYizv+a6Jlk/d7frlAsiNo8ZEQUX/O+1xqM/bVxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB3006.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Thu, 24 Feb
 2022 15:13:12 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8142:2e6f:219b:646d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8142:2e6f:219b:646d%5]) with mapi id 15.20.5017.021; Thu, 24 Feb 2022
 15:13:12 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v2 02/13] tracing: Fix selftest config check for function
 graph start up test
Thread-Topic: [PATCH v2 02/13] tracing: Fix selftest config check for function
 graph start up test
Thread-Index: AQHX9b/2q2Ez9U+DWUatpfXKha82oqyjHWIAgAAToACAAAWQgA==
Date: Thu, 24 Feb 2022 15:13:12 +0000
Message-ID: <9e62f80a-86b1-05d7-d5b7-a209b2c4f106@csgroup.eu>
References: <cover.1640017960.git.christophe.leroy@csgroup.eu>
 <bdc7e594e13b0891c1d61bc8d56c94b1890eaed7.1640017960.git.christophe.leroy@csgroup.eu>
 <74775d33-2e54-96ab-4546-57eb2c9e50e0@csgroup.eu>
 <20220224095316.67729e2b@gandalf.local.home>
In-Reply-To: <20220224095316.67729e2b@gandalf.local.home>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: deb7f9cd-2c00-40ea-5748-08d9f7a82c83
x-ms-traffictypediagnostic: PAZP264MB3006:EE_
x-microsoft-antispam-prvs: <PAZP264MB3006E9905C5730D0E5CA15A0ED3D9@PAZP264MB3006.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1UGKJRK+CnzX+jOey/qUYh4KqaihgMI+wRvYmMoY+UXO3LeUl56Pz5Ix5U5wSfDerHPckha+ozEZOFUA875zKNCPb2VuLj+xmG5LI9fzXRscKWyCV6ILzxd6rJhbTAlechg4hJBgkLK5EFE1Es+mDLl2KE5CLHhGD091sgHPuxaLTjl/90BOiGoOWWsjO18XMRowGNJcX7tZRMzxETKvgFJKLeuhlZcnYjGSzOU8iMBK0ef1Ciku1y2Z2PfppUiRtMwOZ8g6nXP8x7L5NqoRV0THV5iHIdbo9dFRX57wosqmnWj594WXbxcDIZyIytsFTHzNc6HaOtx2EBB8XZhI9J82VCvzEYbTXImUo7+xolBvVxDaDLki7YhBj4vGV6W0GNeXpvRFPtgj0DNkJmVY+GV3Ew0rIYb52raE5zGv2jtXMc+6KsXhgB80XZTEHxvEz1mBpV0P6hL7P5KREjkthe08hTRymTqjHDbEyadqQOyIe04/h9GeejEQQn3aDo0DK0dpSiQM1LGVkGYpsnTrzK3XmtqpsR5zK9R4YCusur4CIkS5kDoqfKm5atcS/eajiHBG6WPDPAfoOKNdYCx5/zgVNmYmWWjOpTdp6gmqiG8aX9KYpov3cAPoniKF45p46eLcfZpEEA3JVb+hfJXvUCx3nJi73Jt+y/LX9cszre7CIoatnZUQv4siisCkHHr5H1dj+wtulyQQKs9hYO2I58WtkH114pcbpuHEFIFnMbqWJasr6AjAOcyzYPjPYHImnR0061NqFQOKKwRziV50zQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(54906003)(316002)(76116006)(31696002)(6506007)(66556008)(66476007)(66446008)(6916009)(91956017)(66946007)(38100700002)(38070700005)(71200400001)(86362001)(4326008)(64756008)(6512007)(8676002)(26005)(2616005)(122000001)(4744005)(508600001)(7416002)(5660300002)(6486002)(36756003)(186003)(31686004)(8936002)(44832011)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OEpGYzY5bUhTclljWngrZ1pNNDROMDNnRUhnSUZnSWJiK3R6R1h3RVREd1JD?=
 =?utf-8?B?TFo1Lzd3K0Zmd2o2eXFWNUZpMFJTd2lEckFYVDVnd0tvSkljUFNqMURiYUxN?=
 =?utf-8?B?SmgwWDVzdDJpWkVxTTlHTUd3alhqNzBORXkwWFdXSkVsaU93TVc2K3BaNkd5?=
 =?utf-8?B?YVIvSjZwVnU1TVNMWCswRkE1bFd5RDE3ZlkzNVl4N0NsRUduSkc2UjFQTm42?=
 =?utf-8?B?OURDcmNhVW12V3U4MWNiWXhIMTAzMFhSQ1pteURGVGVqRjB3RkhKVExSTHBN?=
 =?utf-8?B?b0I1NUNFM1MwbHZCdmFOZlNXcHR3aklXYUJwTitZMG5lOUtYRlZKY05PWDhZ?=
 =?utf-8?B?NHRrajB6Z1ljNTRoaFNiSE84dFNPTVRMK1lQUnJyQ3J1RWE1ajdzM29sWEdp?=
 =?utf-8?B?V0k5OGJON2VQd3o3WXlPeHVNcGZhd3poaHRoYjJxdjhDVmtiZTVFb0ZkMUdh?=
 =?utf-8?B?amdXT1UyYzA2ODAreVhxT0xJQ1d2eHU3MExMZEhCb3NHSjB1dkF0REZtUXI3?=
 =?utf-8?B?cDY5azBPY3RPc0QzWFZzeUMycXpwK2tyaHdyMGNVK05wMm5HZ0xtelIwL0pz?=
 =?utf-8?B?Mm1udSt0K0xESllUY2ZWakJURi9CeGg1V0FtK2tzWlR5WWJUYlZBVFlzSkFo?=
 =?utf-8?B?MWt5cldIT1h5QitzdHMyM2dBdjNLbTViWnVQTTlqdjc4YmM5Zit3NG5ta1Ju?=
 =?utf-8?B?TThQYm1nd2ZBdEJRT1FWVnRjcFRaVm9QcGx0bFZ6QVpLSUdhNkRmc0hrRDc5?=
 =?utf-8?B?dVFHVFBJOE4xM2hHWTFOUEQ0L0p3TUlaWVA2TzFaMGhkbGV2NmNZNWowL2Qz?=
 =?utf-8?B?Z0xWTVNobmJNQlNXTG9mZEszN1p1UVBHSUZjekFROCtpdyszQ0VqcDN0bHlJ?=
 =?utf-8?B?bnY2OXI0U3Z2TVNEWGVLNjVQRmlNQWVtMHVYM0VLMU1wT3kxdTdRWldRT3Rq?=
 =?utf-8?B?Tnc0MitwbmhtUGF5dU1JTGw4Qi9vcTBEOWh4Q1EybGF3SmFJdG96ZHBtQy9U?=
 =?utf-8?B?bDlHNWxVQXVNM1NGYzNFZ3Zpc2pMbE4zR1ZIUW5HYU5oZ3lIQStWYW1qUDha?=
 =?utf-8?B?OFRndHc3ZXZaV3NscG1sSXo0T0o3QlJwQW0wUkdpZnhtRzh4YnRyaHNkTmRG?=
 =?utf-8?B?RXJkaUhnUXFwNy82NFRHeG1Ba2lCWjNHOUxlVEJvaXhvcFJ4T1doV044ejlF?=
 =?utf-8?B?ZytGdlZTN3gvUGJZcENLdFZSZ1NHM2xWbXN3SC9lbFFLd1lCTXBKWmNmZ1Fl?=
 =?utf-8?B?UThRRWZqNVNMTHBjajNHKzNsM0lTT0cvdkwyUnNUdkJpeWVvU0kxS1JEMW01?=
 =?utf-8?B?L3k1TWcwQ1JZUjFpclRYZXYreng1alA5ZEpMUG1FZHcrTDRRQllMbnllbExz?=
 =?utf-8?B?M3kwR2hRZ1h2RlAxbzg0T05WdkIwM21NZlUxZE1Ya1R3WFVpT28rNjVjaHRi?=
 =?utf-8?B?TkR5cnJsYysyWDN2SDRQL0Zrclpnbnk1OWE1eWxoQ005T1RETWppU3ZIREtN?=
 =?utf-8?B?My9VVlovYWYzbHBVbmNQb0cvdVN1c2U4b1VLLzdJRnJDcVVMejVYcHJMb25m?=
 =?utf-8?B?RDVkQTZ5MDVheTJ6Y2hUZ1IvQ3BWeXNsekk2Vjg2MkRmT2hYZFh2d1ZrWUtk?=
 =?utf-8?B?N3JCRkR6RnhsNlhXR0FtcmhBVzh4OUxnZjhqODlZZFdtTnZXNWUrNG5oaXpo?=
 =?utf-8?B?YlJFU1dMMzZYeCt5Lzc0emV6S09NU0d5VEZSK1k0dlV1UlY4Vkh0NzN1eDVr?=
 =?utf-8?B?SUJ4cmxMQ2lDenFCWm5YZWNNWUh3ZGZPWW5xRU1nTTJldkpsQkdJOXMzUmVo?=
 =?utf-8?B?NXlSalpEUlR6TWlSa2pGVWEvc2pWQ2pMTFNGMzVCRlFlQjZWV0k3WCt2Misx?=
 =?utf-8?B?dk1ncC9TdkFVZXdIU1hFTnZUR1JXaUkzSnVVOThZNlVVTC8vSzhBQUU1REE2?=
 =?utf-8?B?aDR5NlVFOTlTdUpQbUhqM2J1VS9GcUl4V2diOXRuR0xpbGNqK3JJZndZQ2R2?=
 =?utf-8?B?a2RSSTRGc2l5OGNPTzNJQWlLS3h2Mm9QamtBcDhpYmZSYVVaT3l6YzRFVXpy?=
 =?utf-8?B?OG12eG9BcVdPOGd5K1hMT2h4eUkyM3BuWER0dUYza09hSkFpRDNhK2FHQlNs?=
 =?utf-8?B?dkZYUXpwTVl6TGxTT2V1WFpTSnhEUnl0c2JkdUVZdE9hc2xBdVpBK0FqakJh?=
 =?utf-8?B?L1lNVmhYeDZyVm5qSWhHMDdROWlIWDVxaE5xQ0xUQlYyaS9lbnFxRkQyYzFs?=
 =?utf-8?Q?wlnexXiWenray5Dy9OqJoHO9DD+e5Ja+riLJDVEY9o=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EA1B909506AD62499F76EFFD81A6FEE5@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: deb7f9cd-2c00-40ea-5748-08d9f7a82c83
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2022 15:13:12.2225 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rZNFnR7xtlwXHqj1D0mqP58opEWglSj2HIZIXoZBfWvjDgMO+lNjZNnhq8upSN7JPDzNTriV3SJK5dusvrNd0JvC5roqbFoljzKyxpRbAY0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB3006
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
Cc: Petr Mladek <pmladek@suse.com>, Joe Lawrence <joe.lawrence@redhat.com>,
 Jiri Kosina <jikos@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Josh Poimboeuf <jpoimboe@redhat.com>,
 "live-patching@vger.kernel.org" <live-patching@vger.kernel.org>,
 "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Miroslav Benes <mbenes@suse.cz>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI0LzAyLzIwMjIgw6AgMTU6NTMsIFN0ZXZlbiBSb3N0ZWR0IGEgw6ljcml0wqA6DQo+
IE9uIFRodSwgMjQgRmViIDIwMjIgMTM6NDM6MDIgKzAwMDANCj4gQ2hyaXN0b3BoZSBMZXJveSA8
Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1PiB3cm90ZToNCj4gDQo+PiBIaSBNaWNoYWVsLA0K
Pj4NCj4+IExlIDIwLzEyLzIwMjEgw6AgMTc6MzgsIENocmlzdG9waGUgTGVyb3kgYSDDqWNyaXTC
oDoNCj4+PiBDT05GSUdfRFlOQU1JQ19GVFJBQ0VfV0lUSF9ESVJFQ1RfQ0FMTFMgaXMgcmVxdWly
ZWQgdG8gdGVzdA0KPj4+IGRpcmVjdCB0cmFtcC4NCj4+Pg0KPj4+IFNpZ25lZC1vZmYtYnk6IENo
cmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4NCj4+DQo+PiBZb3Ug
ZGlkbid0IGFwcGx5IHRoaXMgcGF0Y2ggd2hlbiB5b3UgbWVyZ2VkIHRoZSBzZXJpZXMuIFdpdGhv
dXQgaXQgSSBnZXQNCj4+IHRoZSBmb2xsb3dpbmcgOg0KPiANCj4gTWF5YmUgdGhleSB3YW50ZWQg
bXkgYWNrZWQtYnkuDQo+IA0KPiBCdXQgSSdtIHdvcmtpbmcgb24gYSBzZXJpZXMgdG8gc2VuZCB0
byBMaW51cy4gSSBjYW4gcGljayB0aGlzIHBhdGNoIHVwLCBhcw0KPiBpdCB0b3VjaGVzIGp1c3Qg
bXkgY29kZS4NCj4gDQoNClRoYXQgd291bGQgYmUgZ3JlYXQsIHRoYW5rcy4NCg0KQ2hyaXN0b3Bo
ZQ==
