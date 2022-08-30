Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5CC5A5C03
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 08:45:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MGyV22R6Tz3c6P
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 16:44:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=OypXA81V;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.72; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=OypXA81V;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120072.outbound.protection.outlook.com [40.107.12.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MGyTG1jk7z2xBV
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Aug 2022 16:44:17 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gscBFm/i9yC/joUFWVfZxZTGchmWabqHTPmITBQr6VgkgONSZDvO1k/XcqW9vjY6aNub0LAzzwC1qwA124uD8SV9FgRaZjEfExhPBhZiI4jG6yYPAXfONl3/TFyA/rVXFledSRc6ZkeD8yYON0cP+kXAmcBreW3XTn7izad99FzdhLsh7kAi6m8ikM2zmmHwHwoKj8Vi4ga+XjBcItkSAQRPE4/+Qe5y/rTLLePLFwcNZ0Ovc4yuH1TN5v4Bw2zbNhlSv456qGKSEw90l14FHCcv3lp3DJ20A16jqr64ERNarJ4Lm7iKVEVA/wn5BJnuSBrqbO6rF/KEJs4bl5CZWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5IMvvcaydUU4WOrPn/R7IjmxO9d6qqQQBvgYxlJYsr4=;
 b=A5rhviGtrQD/BwtpNc7vg7L9rhmoyjrATnp5l06Chu5zHhVmZO34l2B45+zztxBHOvlZgIya6kJ6KB6Npwbf8aDe3z6bZiYvHMyDseoQccEAM/pMnKyYwh8dmVTotKrrQIAzjT956WR+z7cA1uv+PhUrOw3FIvm3CSQ12XCKpYmTE0gZqkYMPSujVWM7+wlA8mzU81mLixx5rcAq0KNqsPirE9EAGGnpSVf2LOg+sPSIcH3gMFmGN8ZV1myRYjpVdxbyU7VeYkCWTDjsQZUeBoDqXDvfz0ZHgfx4vVnlqGWwHAWR0zn60guQv1cN/fBcd7oEy0X8fCt73ZBS+aWoYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5IMvvcaydUU4WOrPn/R7IjmxO9d6qqQQBvgYxlJYsr4=;
 b=OypXA81V10n7px1FrdIByXgWRjoZcndX1zbm9CU7cxH5kyyODcrhMsVX62y0WBjdH6cIv6H/ceV0M+uJyKInn0aeaqZgWPObl9bzQV+FoCZA+ryc1E8xd8BZ6mMdnRw7A9GuPRxYdFpua4FyKEg9twB67iP2XwDzl/UX1mF1Xliz0BuCdpvz9w8tX2SU5ZIbr6IPO5zLQ4B38T7lPELT+xyvU5jKpEf71pB5xPTgPyQQR7W+ECUXyh5l+9pdSDZtjJ9LAMZEBL93EXlF6V+i1i/AfqjooKUbi3/fvX1PNA00qtyn8ClUKzzGbs5pzchC5YIqnld5S16DkBf9PhsF5Q==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB3010.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Tue, 30 Aug
 2022 06:44:00 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8%4]) with mapi id 15.20.5566.021; Tue, 30 Aug 2022
 06:44:00 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Sathvika Vasireddy <sv@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v2 16/16] objtool/powerpc: Add --mcount specific
 implementation
Thread-Topic: [PATCH v2 16/16] objtool/powerpc: Add --mcount specific
 implementation
Thread-Index: AQHYu2u+4hgBmN2D8EicOSqvXi2Bhq3HAOsA
Date: Tue, 30 Aug 2022 06:44:00 +0000
Message-ID: <edb48da7-e486-074a-6d9b-143b4c2a2e39@csgroup.eu>
References: <20220829055223.24767-1-sv@linux.ibm.com>
 <20220829055223.24767-17-sv@linux.ibm.com>
In-Reply-To: <20220829055223.24767-17-sv@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d640ae8a-2b0f-47c9-605d-08da8a53056f
x-ms-traffictypediagnostic: MR1P264MB3010:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  IZhHXm5zGvAOLs973aP4zcQc24tn59Y8TrSPMeeuy43DCpape46sfSkLpVNrpB8hs7WyH0j80+imLdxBuBUj5x7pvaGLB/BLcWLa5yLMqT5i6FHgKrzp3ArWr5zlDadBbjXtnbKjMA/8LbCBytUMq1WqCLtndMS6pHZhaYHcdFkf+GqpbL9pILShyTIqXenN8qm2lHf5rr8LX3ZVHl+BBur3WrkCVdgBQqj1dGpY+lFTCp2AbPBJcfuDgIe+ibTd60VdzJEwXLRbgKrVtmQCut+6obNGdaNdBNplXcl0JWxF43R13VS6Is8ZjLbyepQYAe+3vgmWRNBc8EuYzCxtf3EJUhmOaKQ3VyyoCk+f+6oA1QvTr5RCy358uV8TbLXx6zlsgXGezaRQsG7kg7DYZEmPvv/473ewrw+qUHRIr0BLoPmouGFAeQ+LD6+biIX0lmbHNHxHleI2Qs2YPGTgcFac7ZdY3z9UehlK99/GN2ep/2gm1nJd883hAhKzadwED050dmxV3DidkmB1XK4vOdYso0YHsTFOns5dCNVsO+mXtAJe3cNTJ4l90T9ZTDP/kQ2i97SzKWYVMI2/JArHkUVFt0Ge8+H+8R436IjAhFKCiuizZwUIaXnbbIAgbpeoGVo5f3o3s7KNwfMyNuAWtNBy5ZENJOgBYJitzKZcVT2/jY6Pk7U+SJOS95iYUw8m/rrUXep/lRNKPEFRczRDPvxe7ePjU98USg/n3v2bmCOke65aOMGk2Ly8eayDAPgHRi0WbedT7gZ2K9keiEIUdW24E6X5mk6L5iFWYdmgH218shgzg5hcRQuvmuwzhzFsWY/WskjohjqpOC1mIygFtQ==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(366004)(376002)(396003)(39850400004)(91956017)(2616005)(71200400001)(316002)(26005)(36756003)(186003)(6512007)(6506007)(44832011)(2906002)(31686004)(86362001)(31696002)(38070700005)(54906003)(122000001)(478600001)(5660300002)(7416002)(41300700001)(6486002)(38100700002)(8936002)(110136005)(66476007)(66446008)(4326008)(66556008)(76116006)(8676002)(64756008)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?T09lSGg2UGlMb1MxdTE2bnhFK3NLK3R6OFhGcXNqK0xTbmlCYkJBVmN5dTZa?=
 =?utf-8?B?RWMrZEp4SStldW95Qi9tcnBRdlBGWG5UNTliSUFTYjVnQml6VzdVdVVsQU1v?=
 =?utf-8?B?VzRGUGhNUTlJM1VxZ1lnWXprdjlGZ0ltVmo2djd4ZWpOUDRreEl5a0NTeXJQ?=
 =?utf-8?B?dkliNENQNnVIZEo1ZUJnNnBCL2hFWDhWdStMTldGZDhVMFhvMG5wdWlBMXQ3?=
 =?utf-8?B?Y1hnM1NjbGZjUlVuSnpUZU05TmxaYUpxWGU4MUdSdUZrTUFEKzdZRGp6OWZ0?=
 =?utf-8?B?cFVGYkRleDQ0QzhtZmpCcGVWaW9XcnUvangyUlJVa2FybE0wZkIxTGtuYlFL?=
 =?utf-8?B?ejA0OFN3cHM1bWRmYmlhTnJJc094bWU5TENDTDFsS1pIblZjSFBBUEtPeEsr?=
 =?utf-8?B?eVo5OFAwdlpmaXlhSnRzYitxQ2s2ZnY4aDdEWUZQRHNBeHlNR1BsSmRpcnQ0?=
 =?utf-8?B?WUdaSkFkZXh4V24zeW1LQUgvZGtCNm9MTjNxVEhrOVJMdFE2aGsyMU42TTdi?=
 =?utf-8?B?UEY5OFlpUkFZMGVaTnQrOXNmdTJ4THZQd1hDc1ZjeHNGcmVBUndvQ0Y4MW92?=
 =?utf-8?B?djMyZEYyd0FFbW9kZTQ4MXcrWFpMNmlUa3RabCsyTjBoald4SytCQ1NkNXZp?=
 =?utf-8?B?RXMxdzlzOWF1UWw3S1cwR3FCWThTOW5obExFbjlxQS82SFFzc2ljWnVBK2pY?=
 =?utf-8?B?dDMxN3FSa2JPRHhPWGlyNkJoTHRYU2V4eTJVZERmdzlrSCsra2laODBiWkdR?=
 =?utf-8?B?WDdraUw4cFpldUVLRk15dGpqeXgwbnkzZmtiNnJUUVJvclJYc21qck5OdENn?=
 =?utf-8?B?Z2drRDVDLzNiRHBaeE0zeEI5L2piNXAwOEdBbitmMnIzdFZsTnJWekVrSFJt?=
 =?utf-8?B?TmE3WnJtOXhwWEpsRm13WHFUZ1VBRmRhb0VHZnJFcTAxN3dSSWZUbDBJcldO?=
 =?utf-8?B?ZE9UbXFxZ2pnRVN4TFNyRzM0amhzQnR3ZndmYUd1bVNrSFBYUnAvOVVMamlt?=
 =?utf-8?B?YnRidmo1SFdrL0Vyc0FaaVI0Y0RjNElBS3lndXFzMWtFQmF2R3FPQS9jTkV2?=
 =?utf-8?B?dGhiREw1UlpLaVNNMVN1dllURmhxbHZHU1M2WXRRNzJDbHAzSzBaSy93UHFh?=
 =?utf-8?B?ZUd3UFludWxhOEFVYnByVEZ0aG5uUGNDbjZHN2pLdllpSDJyazdKUzZ1WFNG?=
 =?utf-8?B?b0w1a1ppYlo0VkdMUzlzZUtXbHVBVERiSDN2d3prRmVuQVM2c0hSWHNYQmZJ?=
 =?utf-8?B?eFJWZCt3YWx2V0lVWEV2aTRNaDd3V3paTnQ3bU9mNzI3TEtQemhJU3pBY1hM?=
 =?utf-8?B?T2RUZkhTNVpkeG50S1NJc0hBemhib1hqNmFKQUNUNTVQMDdKL3ZRM2RJVTFp?=
 =?utf-8?B?RkNpNkdOclhucGYxamZiQUdFbVBkZW1JTGlJeG01VXg1QXljbzg1Z0Y1NUVD?=
 =?utf-8?B?MGNmdUhTM3R6V2paUlphRDJYcVloeWhuaFloMk1hYzUyZzdiRG1nTXVlWUpv?=
 =?utf-8?B?RFZOOWpUTXprRXBBNWVuSm4yUmx0MmNlakdIN0d3Z2RFM3BjTytzVDQ3cUp6?=
 =?utf-8?B?OUZSK2pFaHNCcHUvVnZaSjVYSm5yd3BpV0d6bzFZNkplakI2eStRS25kVWQr?=
 =?utf-8?B?NjhWWGQwclBFUC9OUkVDVHNWd1ZGQlk4d284dWhneGU3T2VlWTRvNmk3K0ZF?=
 =?utf-8?B?WFNkQXltRlNGajlIZTNBWEdoaHgzMDVpUkxxOEZhMEE1aW9nNU1xMnR6N0ZS?=
 =?utf-8?B?QmJ5UWpFM1ZrcWRuMHFpOGcwaXM1TnVkMWlYQ0creThESmFWS3VMaS9HdHdC?=
 =?utf-8?B?T3NVWnR5Y2VBZFpBWmg5Y3l4TGZlcmliRHdHMVo2S3Q3b1ZNeE0xdW8vTFUv?=
 =?utf-8?B?cnZTazJQeW44VGk5Z21ud0ZNRUwwQlQzcm55Vk0yK2pMMjJYcFdrU1AzWEZM?=
 =?utf-8?B?Mkttdm5aSEdsY25JL0I3ejFsWlpKVHlCUHFxN2hBRG13NlFqUFBhcmtsNUZG?=
 =?utf-8?B?eGtzRytSSUdPTDh0bGVhdFJYTlJncGVxL2gwdGptTnJIZGtURGF0bldLR1Yx?=
 =?utf-8?B?alRQVlpDcGxBL2xIc2c2UWNieENBNXZLTnV3emE1S2MvRDlHakZFNTF3dnpU?=
 =?utf-8?B?VkIvbjBqT1NFc1RFRUN4dE5WWEJBbkp0RnFmdkNLVExJUE8zTDNPc2FCeWtX?=
 =?utf-8?B?alE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AF19F27D81275A4CB2B0F965F413FC82@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d640ae8a-2b0f-47c9-605d-08da8a53056f
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2022 06:44:00.4137
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1mSaZESQUK/LvS8CvaoBcxqW5kdlzhwCRnIBRl489y4yMeQpNlnZb0vIvFVAwWxCzijEbwQSecP5J/Bj5PPVU0b0TqwtflhVcaAoDrlxp24=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB3010
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
Og0KPiBUaGlzIHBhdGNoIGVuYWJsZXMgb2JqdG9vbCAtLW1jb3VudCBvbiBwb3dlcnBjLCBhbmQN
Cj4gYWRkcyBpbXBsZW1lbnRhdGlvbiBzcGVjaWZpYyB0byBwb3dlcnBjLg0KPiANCj4gU2lnbmVk
LW9mZi1ieTogU2F0aHZpa2EgVmFzaXJlZGR5IDxzdkBsaW51eC5pYm0uY29tPg0KPiAtLS0NCj4g
ICBhcmNoL3Bvd2VycGMvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMSArDQo+
ICAgdG9vbHMvb2JqdG9vbC9hcmNoL3Bvd2VycGMvZGVjb2RlLmMgICAgICAgICAgIHwgMjIgKysr
KysrKysrKysrKysrKysrKw0KPiAgIHRvb2xzL29ianRvb2wvYXJjaC9wb3dlcnBjL2luY2x1ZGUv
YXJjaC9lbGYuaCB8ICAyICsrDQo+ICAgMyBmaWxlcyBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCsp
DQo+IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL0tjb25maWcgYi9hcmNoL3Bvd2VycGMv
S2NvbmZpZw0KPiBpbmRleCBkYzA1Y2QyM2MyMzMuLjZiZTJlNjhmYTllYiAxMDA2NDQNCj4gLS0t
IGEvYXJjaC9wb3dlcnBjL0tjb25maWcNCj4gKysrIGIvYXJjaC9wb3dlcnBjL0tjb25maWcNCj4g
QEAgLTIzOCw2ICsyMzgsNyBAQCBjb25maWcgUFBDDQo+ICAgCXNlbGVjdCBIQVZFX05NSQkJCQlp
ZiBQRVJGX0VWRU5UUyB8fCAoUFBDNjQgJiYgUFBDX0JPT0szUykNCj4gICAJc2VsZWN0IEhBVkVf
T1BUUFJPQkVTDQo+ICAgCXNlbGVjdCBIQVZFX09CSlRPT0wJCQlpZiBQUEMzMiB8fCBNUFJPRklM
RV9LRVJORUwNCj4gKwlzZWxlY3QgSEFWRV9PQkpUT09MX01DT1VOVAkJaWYgSEFWRV9PQkpUT09M
DQo+ICAgCXNlbGVjdCBIQVZFX1BFUkZfRVZFTlRTDQo+ICAgCXNlbGVjdCBIQVZFX1BFUkZfRVZF
TlRTX05NSQkJaWYgUFBDNjQNCj4gICAJc2VsZWN0IEhBVkVfUEVSRl9SRUdTDQo+IGRpZmYgLS1n
aXQgYS90b29scy9vYmp0b29sL2FyY2gvcG93ZXJwYy9kZWNvZGUuYyBiL3Rvb2xzL29ianRvb2wv
YXJjaC9wb3dlcnBjL2RlY29kZS5jDQo+IGluZGV4IDhiNmExNDY4MGRhNy4uYjcxYzI2NWVkNTAz
IDEwMDY0NA0KPiAtLS0gYS90b29scy9vYmp0b29sL2FyY2gvcG93ZXJwYy9kZWNvZGUuYw0KPiAr
KysgYi90b29scy9vYmp0b29sL2FyY2gvcG93ZXJwYy9kZWNvZGUuYw0KPiBAQCAtOSw2ICs5LDE0
IEBADQo+ICAgI2luY2x1ZGUgPG9ianRvb2wvYnVpbHRpbi5oPg0KPiAgICNpbmNsdWRlIDxvYmp0
b29sL2VuZGlhbm5lc3MuaD4NCj4gICANCj4gK2Jvb2wgYXJjaF9mdHJhY2VfbWF0Y2goY2hhciAq
bmFtZSkNCj4gK3sNCj4gKwlpZiAoIXN0cmNtcChuYW1lLCAiX21jb3VudCIpKQ0KPiArCQlyZXR1
cm4gdHJ1ZTsNCj4gKw0KPiArCXJldHVybiBmYWxzZTsNCg0KU2FtZSBhcyBmb3IgeDg2LCBjb3Vs
ZCBiZToNCg0KCXJldHVybiAhc3RyY21wKG5hbWUsICJfbWNvdW50Iik7DQoNCg0KDQoNClJldmll
d2VkLWJ5OiBDaHJpc3RvcGhlIExlcm95IDxjaHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+DQoN
Cg0KDQoNCj4gK30NCj4gKw0KPiAgIHVuc2lnbmVkIGxvbmcgYXJjaF9kZXN0X3JlbG9jX29mZnNl
dChpbnQgYWRkZW5kKQ0KPiAgIHsNCj4gICAJcmV0dXJuIGFkZGVuZDsNCj4gQEAgLTQxLDEyICs0
OSwyNiBAQCBpbnQgYXJjaF9kZWNvZGVfaW5zdHJ1Y3Rpb24oc3RydWN0IG9ianRvb2xfZmlsZSAq
ZmlsZSwgY29uc3Qgc3RydWN0IHNlY3Rpb24gKnNlYw0KPiAgIAkJCSAgICBzdHJ1Y3QgbGlzdF9o
ZWFkICpvcHNfbGlzdCkNCj4gICB7DQo+ICAgCXUzMiBpbnNuOw0KPiArCXVuc2lnbmVkIGludCBv
cGNvZGU7DQo+ICAgDQo+ICAgCSppbW1lZGlhdGUgPSAwOw0KPiAgIAlpbnNuID0gYnN3YXBfaWZf
bmVlZGVkKGZpbGUtPmVsZiwgKih1MzIgKikoc2VjLT5kYXRhLT5kX2J1ZiArIG9mZnNldCkpOw0K
PiAgIAkqbGVuID0gNDsNCj4gICAJKnR5cGUgPSBJTlNOX09USEVSOw0KPiAgIA0KPiArCW9wY29k
ZSA9IGluc24gPj4gMjY7DQo+ICsNCj4gKwlzd2l0Y2ggKG9wY29kZSkgew0KPiArCWNhc2UgMTg6
IC8qIGJsICovDQo+ICsJCWlmICgoaW5zbiAmIDMpID09IDEpIHsNCj4gKwkJCSp0eXBlID0gSU5T
Tl9DQUxMOw0KPiArCQkJKmltbWVkaWF0ZSA9IGluc24gJiAweDNmZmZmZmM7DQo+ICsJCQlpZiAo
KmltbWVkaWF0ZSAmIDB4MjAwMDAwMCkNCj4gKwkJCQkqaW1tZWRpYXRlIC09IDB4NDAwMDAwMDsN
Cj4gKwkJfQ0KPiArCQlicmVhazsNCj4gKwl9DQo+ICsNCj4gICAJcmV0dXJuIDA7DQo+ICAgfQ0K
PiAgIA0KPiBkaWZmIC0tZ2l0IGEvdG9vbHMvb2JqdG9vbC9hcmNoL3Bvd2VycGMvaW5jbHVkZS9h
cmNoL2VsZi5oIGIvdG9vbHMvb2JqdG9vbC9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hcmNoL2VsZi5o
DQo+IGluZGV4IDNjOGViYjdkMmE2Yi4uNzNmOWFlMTcyZmU1IDEwMDY0NA0KPiAtLS0gYS90b29s
cy9vYmp0b29sL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FyY2gvZWxmLmgNCj4gKysrIGIvdG9vbHMv
b2JqdG9vbC9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hcmNoL2VsZi5oDQo+IEBAIC00LDUgKzQsNyBA
QA0KPiAgICNkZWZpbmUgX09CSlRPT0xfQVJDSF9FTEYNCj4gICANCj4gICAjZGVmaW5lIFJfTk9O
RSBSX1BQQ19OT05FDQo+ICsjZGVmaW5lIFJfQUJTNjQgUl9QUEM2NF9BRERSNjQNCj4gKyNkZWZp
bmUgUl9BQlMzMiBSX1BQQ19BRERSMzINCj4gICANCj4gICAjZW5kaWYgLyogX09CSlRPT0xfQVJD
SF9FTEYgKi8=
