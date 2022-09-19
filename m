Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D685BC2F0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Sep 2022 08:39:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWFPz4qWVz30F7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Sep 2022 16:39:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=AhYBWSLI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.74; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=AhYBWSLI;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90074.outbound.protection.outlook.com [40.107.9.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MWFPD283Pz2ywN
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Sep 2022 16:38:22 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J9TFT+rvmoeJWiMjHh+9Gd6lzRxyxyA1FOP/FBBS2kVrC25CytLNjnzWMYZxICCWz+tl4cKx+YhRXgGyvGIdDkg7fIoaoIlGe4M0BQnhS250s0OPS1RJ4SOc0/HakYRvbNAXUm2NddO//+RWqnFC3h63osVIqito6+dlAe3tIr8Pw6IgzW5TdVOOVQ3OMsc5KO7wMNnKjDEH6FLdrppYiKMBk1kRN2WBan8PXEgDNTtwAvOjw2fmhQjBpgjC03BaSeDg6aIzZHeOnEM5IMsYn8kNx2+7IgdUB4OBYoih1mqkgP57JQotLOINILJq0DNQfI1+mEEvrm0INf0zr3waKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ha7BhycIcoKmYHWvLISLcMUhkqPnAbNNNVMq+/b4ZzY=;
 b=k99MsvhAUJfvtedT70Biu951r+4GsJD608ovf6mo81N08ToapbMYiJUpf0iG3it4R7gtPT85wjwxjmc5IufjfbtTUGcWfdJLiIWYzurAAOG2/waZ74WC9j0vAYUsZAHY1GdOqjlGfOX5tdyUqDWmaoqBcYY6JzQ50n6RTMwylzf4N5l9v4ddUI07NJr4QoH286nslZHp3yCoNgE/1dVXT3aJGnHttgzqs9F9B81Mr04ly7yPs7Y62CEHghHK5J8fiF78agdViNsUkI6qIZDNfUeokMwZpDHS6ReYKj9yEdIWkFBmyr/Rxemhihjz0rPnhPrKRutiJSdhKbt9ZTHzQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ha7BhycIcoKmYHWvLISLcMUhkqPnAbNNNVMq+/b4ZzY=;
 b=AhYBWSLIlyqq9ePE/7EIP/8VZp5YGaxycxzJ/XI/WCMkcoItgfeQkGb2LH3bhRRznr2aKkP8nR2y9yki/+i0becYl097kWLQirmI/6JkQiT6wHP3012va80huFaplhw2gqVnZBpijyI8DYsV5OY4IRzkjtCyaL/kl9/WZtzWiSy0HDpmiUjjjfVf/1XW1IrhPVoC8ZrexJyc6E/nPcP0RZ9TN2k++1yTshJ/IO4/OQ2PaRbKxfBkORwxWrsai8b8UgFHFkOC8mxp4HLIycf0W5eEyXGI1h8CrkjXf44lATu6fmkhIPHC2tfbHjxrEmZhR48NS9zUErqkGBCXHPsExw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2121.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:168::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.15; Mon, 19 Sep
 2022 06:38:05 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f4ad:3944:a7f4:fcf3]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f4ad:3944:a7f4:fcf3%4]) with mapi id 15.20.5632.021; Mon, 19 Sep 2022
 06:38:05 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Gray <bgray@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 1/6] powerpc/code-patching: Implement generic text
 patching function
Thread-Topic: [PATCH 1/6] powerpc/code-patching: Implement generic text
 patching function
Thread-Index: AQHYyZT3TDSTBbnSJ0CIZQGPG79aSK3mUZSA
Date: Mon, 19 Sep 2022 06:38:05 +0000
Message-ID: <05f79cf0-bdb3-6c17-ed32-4b4b381226ef@csgroup.eu>
References: <20220916062330.430468-1-bgray@linux.ibm.com>
 <20220916062330.430468-2-bgray@linux.ibm.com>
In-Reply-To: <20220916062330.430468-2-bgray@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB2121:EE_
x-ms-office365-filtering-correlation-id: 4beed7b2-ee2e-4498-d7d0-08da9a0981e6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  F7eSOB4Hszben8ZIbg4/c3lvtFe7D+qrLVAre5yU8SIStFWqdGldyGJLmO8alOc2fGd6GneW9SkUDvOIuxbAvbGTx4HTrxA7zkqCE2rbO6pRr9kbXvlVk8g1Qgk662mSWV2P7FXWFG859B9MdX7ZwwBlY0VpTYRx5p7XsKbjgty76aHEUOWDmMRyzWgdra+JQbehq0487dxYUaESbwC7XxRQSJmfIx/LEMC+1PbOXywcZdXYIgbtdynKN4NoQ6Uem1sx99fOYA+IQyzTlkOL16xIijPDw+cn/8FKyHsiE8ezHwW8xx0Bux40fc+NihU4I2iGEp1/Oy/DgiC8IO1ZaTETxDSJKFuryKIDR65FbhlgBgw1muTvrQvj2Vc+L+SKY0iN4iUKpf4EcmNpeDaM5lDimvAd3B9oEjt7YhYS5t47nxM5ie6eFJc83CCiuN3zgdrh5MiXJ4mQOCGX5OgXshqL/Sak59TJwBBUoOPp+1W6x/8fLrtU3Yk1CxvMKgua0fW3AkIMaRcqBbI2nkKPE5IMSj2eo0PquSV6vqVYnP5bBsUehFhiWq7EhbA1oReIZFZelu+reeKCpvUcr9Sai/AUGy3Kc4xY1u/b8hSf5epXI12VV91WSXwzUOXeOUQ9jv7A/Y8dgTw/qcAAQCmGABbXLUdFP4Z1rzwXsC/epCjOMgaHCLk4wAyFUaS1OUVKcl7RLfYDpMKKWeDia6O1NMd6Oy+RHuVroXaI1aI2ym06DJggIT+hBhpLsk8auxA+IAG2uVAYGmPijLgkVgwZtIN/m1ManADMtfSApzWwLsnZ8tWMkTZVWWFUx/ic42qDYgeFSgQqivXZ/kmk4u67lEI9Hf59MrXWokJf9H0l8fM=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(376002)(366004)(39850400004)(136003)(451199015)(44832011)(31686004)(2906002)(36756003)(4744005)(122000001)(316002)(66574015)(38100700002)(4326008)(8676002)(66556008)(7416002)(76116006)(66446008)(5660300002)(66476007)(64756008)(66946007)(91956017)(31696002)(8936002)(110136005)(86362001)(54906003)(186003)(478600001)(2616005)(38070700005)(6512007)(26005)(83380400001)(6486002)(6506007)(71200400001)(41300700001)(41533002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?UHFoUzNlOVo5alpQd1hoN25VT0FIOG1hL3IzWmRmMkwweWpwZkRydTBLdVI0?=
 =?utf-8?B?T21kajB3L3NBcHhyRnZrV3B4L05LUk03RDV6TS9HSFRtSzhoc1c5UFExNUlq?=
 =?utf-8?B?TnlucUtlQXNGc3hlR0lycUp3T2JxakZOQ0paeXYySUN4U01yc0JYQmZVaERG?=
 =?utf-8?B?Q1hVdkVXUHFOM3BZaE5ZU1dEOVlDQWpoV1BKSnBqVUJmMFk5SGJmUEd5emJV?=
 =?utf-8?B?RnFuMGNMdDd6dlFEUUlFVGhSSXd1WDZndFVIYXN4dW82M2JvSHRIaU1pNXdH?=
 =?utf-8?B?UmtNcFB2UWc3aTMvSFQ1d0srUU1VNm1XVzR0SlhEV3lEM0Z1bmk5STkwZ3M4?=
 =?utf-8?B?ejYzWkRseU9MVUUva2ljT0U3MHp6cC81UWdxY1oxL2k3c2dYVWd1T0QwK2I2?=
 =?utf-8?B?V0hHaUNFTko0Vm9tZk0wN2tiUWtNSm1hcGltZFlaWjJTVTcyTklMWXpFRFhV?=
 =?utf-8?B?RmVoblFTejhTWTh4WTY1TWQ2U0JCcm55Ylh5NjE1ZG1UWkhTa1JLeDZySTNk?=
 =?utf-8?B?YVY4aGVNbUNZYlZtR2FmOHErbVBHRWVkRkN1K1FscjN4NlFvSGpZcnU1QkNm?=
 =?utf-8?B?V29GMEFXQjMyOUphYTRrNHIvZkxmK0tRVVA3aVZHTTVEbUVFTThkZjZCNFp0?=
 =?utf-8?B?QVBqZkhsQnd6bHEzLzJMTkNxRk42ckhuSDl2d2J0U3l3UUw5U1kvL1pOZkx4?=
 =?utf-8?B?MHp1TlM3YU56aVpCQ1U5bEJYM1FUUG5Bb0k5bmkvOVkvR2hzaGN5b1d3SzI5?=
 =?utf-8?B?VTcrd1NNOXBFRHVMZkt5L2cwbFFDd1BWWkdXcEVDT0k4QVZqbitydHZBWS96?=
 =?utf-8?B?ejg3SU4yUVlORkxIRTBmdGxLQ3ExVHpXUzNWY0tBSDk2N293ZURWVElVTEJP?=
 =?utf-8?B?VkVyR1Z3ekNnWDNJSEM2Nm1mVWdlMHkveVNNdzNKWEtCT2pYUm5UbDI1Mllz?=
 =?utf-8?B?RXRxQ1RDODVsR1lCS1g0QnVqSGp1ZnRtL0plekVqWGhJdHN4bnpJTUN0WnR5?=
 =?utf-8?B?Mk1LZnUrWXVsWGNnNWdEdzlIbDh3WFBadFdGQTVkTDVnYjZwdkVESStIcC9o?=
 =?utf-8?B?K09ZWFVXSlF4VXdadDZMQjZMVW12S2dyc3ROV0JVSW9VZy9CYUhlOEJwdlhs?=
 =?utf-8?B?Ri9FTkM4TklYZlFSZjhGUlB5dVhxbDRPZ3FBc1VJMVcyelZ1bUwvRTRJc3Nv?=
 =?utf-8?B?NUJiZnRidzdJTEFmSW9aOXBwd0Z1RHVSYzVLc3o2QzdTKys3Qkk4Y0RyaGhL?=
 =?utf-8?B?aHRmdXZUS0dsa0owdi83Y2dxYmNUN3QxSThYQmJlNWtLOEZmY29DQjZROXgz?=
 =?utf-8?B?K0krOEFWL3N3QkU1NmV1S0J6Q1FDY2thajFrM013RFBUWXhYOGgrY1NwU01D?=
 =?utf-8?B?a2ZuVk9aVzlLQW9ldXpkZWhqbUZiVlozSUhzZ2ltVUZ1dGhLazJIREMrVWRh?=
 =?utf-8?B?YitLOVNmc2hHd0IvTkswVDhuTVpkV0dCdHpuWEp5aWV0bGVrWC8yanA0dWlS?=
 =?utf-8?B?K2tnSFZNV3RuN2JGancxQzdOWjIvZGgxeVR4dCtkYWxJYUR1cmltZXFiZzFy?=
 =?utf-8?B?dm1EbWh5MW9MNE10YllrQkJpTmpLV1RVSDFXVlBzNVQ1YmwrVW9IUWlKbEYx?=
 =?utf-8?B?VEZaekJyYzlka1BpbWFEakk0bG05VUIzalJBTlFKV1NNMXNDbmthVkN6QlVB?=
 =?utf-8?B?d3NFblNOZmducU1tTmRkVDQvYzNGR0tEazFmK1p4VkRNTE9IckRXTkNLSytM?=
 =?utf-8?B?cDh1RXFQTEt6anNVNC9uQlRjcllGV1E3ZTVGdE5iL0RZZmZlay9lR1hHYUNh?=
 =?utf-8?B?bXZBRkdFaXRlaVREUHB3V2cvdXExSXNOYVRlRmdXMTRZZ2tOeTh3NG9XMTlQ?=
 =?utf-8?B?Zkd3a2dmY1VPMlpUTjgzZmk1TE9BRUJ1Y2Y1YjlVTjBQT1U3YUxHUkdHSTll?=
 =?utf-8?B?OVhTMmJjNXhJK04zOVZxWm5pWlJ1OC9UODJINnU4U2hlN3VMMGEvNjg1L0Qx?=
 =?utf-8?B?K3dyd3dGY1FUTVEvWFFYYVFwMVAzd3Rid1lZdG82TzUwaVhRVG1mQWVkL05C?=
 =?utf-8?B?UGErT3hNVVBCbWJJdzBSNC80MkRTOEJjbzJmV2FDMDg5b2dHOStWV3dwWHZv?=
 =?utf-8?B?RklFSGFSMTR6MTRsQ0wyNXQxbTc1N0x2cm9MQWdKMDFDaEM0THplbldDdTVP?=
 =?utf-8?Q?ym7/GINlqB1GJVABV+EWmwM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <49861F5A4AC21A4E9F90820536F00F58@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4beed7b2-ee2e-4498-d7d0-08da9a0981e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2022 06:38:05.0494
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NzFOYAjoG5dIxQkBnHBxht1kSl/uUgZJzmybB6heeesOk+p3eYQpmPVNS+EKEa1UXas1bkXpkuev3DbomolEnhjdhm2VESA7gZXs75xZeQA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2121
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
Cc: "ajd@linux.ibm.com" <ajd@linux.ibm.com>, "peterz@infradead.org" <peterz@infradead.org>, "ardb@kernel.org" <ardb@kernel.org>, "jbaron@akamai.com" <jbaron@akamai.com>, "rostedt@goodmis.org" <rostedt@goodmis.org>, "npiggin@gmail.com" <npiggin@gmail.com>, "jpoimboe@kernel.org" <jpoimboe@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE2LzA5LzIwMjIgw6AgMDg6MjMsIEJlbmphbWluIEdyYXkgYSDDqWNyaXTCoDoNCj4g
ICANCj4gLXN0YXRpYyBpbnQgZG9fcGF0Y2hfaW5zdHJ1Y3Rpb24odTMyICphZGRyLCBwcGNfaW5z
dF90IGluc3RyKQ0KPiArc3RhdGljIGludCBwYXRjaF90ZXh0KHZvaWQgKmRlc3QsIGNvbnN0IHZv
aWQgKnNyYywgc2l6ZV90IHNpemUsIGJvb2wgaXNfZXhlYykNCj4gICB7DQo+ICAgCWludCBlcnI7
DQo+ICAgCXVuc2lnbmVkIGxvbmcgZmxhZ3M7DQo+ICAgDQo+IC0JLyoNCj4gLQkgKiBEdXJpbmcg
ZWFybHkgZWFybHkgYm9vdCBwYXRjaF9pbnN0cnVjdGlvbiBpcyBjYWxsZWQNCj4gLQkgKiB3aGVu
IHRleHRfcG9rZV9hcmVhIGlzIG5vdCByZWFkeSwgYnV0IHdlIHN0aWxsIG5lZWQNCj4gLQkgKiB0
byBhbGxvdyBwYXRjaGluZy4gV2UganVzdCBkbyB0aGUgcGxhaW4gb2xkIHBhdGNoaW5nDQo+IC0J
ICovDQo+ICsJLyogTWFrZSBzdXJlIHdlIGFyZW4ndCBwYXRjaGluZyBhIGZyZWVkIGluaXQgc2Vj
dGlvbiAqLw0KPiArCWlmIChzdGF0aWNfYnJhbmNoX2xpa2VseSgmaW5pdF9tZW1faXNfZnJlZSkg
JiYgaW5pdF9zZWN0aW9uX2NvbnRhaW5zKGRlc3QsIDQpKQ0KPiArCQlyZXR1cm4gMDsNCj4gKw0K
PiAgIAlpZiAoIXN0YXRpY19icmFuY2hfbGlrZWx5KCZwb2tpbmdfaW5pdF9kb25lKSkNCj4gLQkJ
cmV0dXJuIHJhd19wYXRjaF9pbnN0cnVjdGlvbihhZGRyLCBpbnN0cik7DQo+ICsJCXJldHVybiBf
X3BhdGNoX3RleHQoZGVzdCwgc3JjLCBzaXplLCBpc19leGVjLCBkZXN0KTsNCj4gICANCg0KVGVz
dCBvcmRlcmluZyBsb29rcyBvZGQuIEhvdyBjYW4gaW5pdF9tZW1faXNfZnJlZSBiZSB0cnVlIGFu
ZCANCnBva2luZ19pbml0X2RvbmUgYmUgZmFsc2UgPw0KDQo+ICAgCWxvY2FsX2lycV9zYXZlKGZs
YWdzKTsNCj4gLQllcnIgPSBfX2RvX3BhdGNoX2luc3RydWN0aW9uKGFkZHIsIGluc3RyKTsNCj4g
KwllcnIgPSBkb19wYXRjaF90ZXh0KGRlc3QsIHNyYywgc2l6ZSwgaXNfZXhlYyk7DQo+ICAgCWxv
Y2FsX2lycV9yZXN0b3JlKGZsYWdzKTsNCj4gICANCj4gICAJcmV0dXJuIGVycjsNCj4gICB9
