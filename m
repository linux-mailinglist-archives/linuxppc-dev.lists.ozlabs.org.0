Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B164D4FB34E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Apr 2022 07:45:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KcHrM4PGJz3bq9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Apr 2022 15:45:23 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KcHqv5XMZz2yXf
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Apr 2022 15:44:58 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ACphhQShIB2OfTiCIO6+nx0fdAk/H3BoT0+XazIrVqMBbYd++jQJBpK0FnRBBlpNz0D/ueeT4wrjy9eua3bFWnC+d02BTpUVJdEjINFCE3KP1Z6zDQ8PEQSgOv/g2TSVHoRIuu7KipmatL73SKgyqKDeFPyEVXcB1VEB1NAHZrSdqWcViKSCDAQlTogHiPRErgU06zhnCC3VpEQ07/Stby1DC8GMa3bEuIGmHOh+9aOamTtntw9tkXjDuT453ao43yAkPS0GE3vcsNrLwQUAgE9/xvIb1LSSZjJ6CN47p9xup1OkonfdYgs5+hba4CTc5dz7p3HG5pJPS70ZmN+Ocg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y7FnEmM7RQf6KENMEalK5MEWL0n2EjrfpNTJSoyGQL0=;
 b=e6q8e0KKcapoZRq4zd4jxp9PocjPStNiAHr1ffB3YJzOcPNg1RTD+2vn0c1C3YWY/BB2JlHlmr5c++Ay4DmAFxy0tqfAPtpmf5ABAyAIvsa8dLTxcR9YeGnSyxZMk8F0aRIYVWDpf+/OJUQHoYbSwf/FLUZx9RxRh26hcEjOyOqXy11YD6RT6SHbbaAUiDWK5cvBNJqDW/WCd9udfCfJrWPG46MBwG316CbD+0NffL/imh4lX6mLXg/cdmM9J78/PmgAsqZy33fHEeOX8EgFN3O9A7AJ5/zsU+H+JjRhU5W4ZuHfHby0hq9ysXYLdERh+VSwP7aVE/kRRRnS429YSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB2320.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Mon, 11 Apr
 2022 05:44:36 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::59c:ae33:63c1:cb1c]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::59c:ae33:63c1:cb1c%9]) with mapi id 15.20.5144.029; Mon, 11 Apr 2022
 05:44:36 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Anshuman Khandual <anshuman.khandual@arm.com>, "linux-mm@kvack.org"
 <linux-mm@kvack.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>
Subject: Re: [PATCH V4 2/7] powerpc/mm: Enable ARCH_HAS_VM_GET_PAGE_PROT
Thread-Topic: [PATCH V4 2/7] powerpc/mm: Enable ARCH_HAS_VM_GET_PAGE_PROT
Thread-Index: AQHYSmwkEA9bNmVUZ0G7LAapbHwGSKzl+ogAgAF8rICAAr6iAIAAA8SA
Date: Mon, 11 Apr 2022 05:44:36 +0000
Message-ID: <cb58f465-04e2-8a91-c06a-96c3b6024133@csgroup.eu>
References: <20220407103251.1209606-1-anshuman.khandual@arm.com>
 <20220407103251.1209606-3-anshuman.khandual@arm.com>
 <e860f404-af69-aebc-c5eb-8822a585e653@csgroup.eu>
 <8f1d5ba5-c03e-d222-ffc0-d9a6baea1037@csgroup.eu>
 <90cea600-74b8-6c05-b698-23dba01e4889@arm.com>
In-Reply-To: <90cea600-74b8-6c05-b698-23dba01e4889@arm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 65f09b00-df43-406b-9fe1-08da1b7e5cb7
x-ms-traffictypediagnostic: PAZP264MB2320:EE_
x-microsoft-antispam-prvs: <PAZP264MB23209D91367C8B11EF4F8C0DEDEA9@PAZP264MB2320.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JilzL20gnMT3590IFYdOG1WkerlCJ7l4xyc8keV3wQgxyYvizdOkCHqVVIgttkE47Z7XfQ4fDPaPmV832pc+AFGse+1LgUPa/qWHYP47HTiPKkTyd2VInNQgrNYp7jLyYo7m1xezYCMXxq9e3XyD+XXOQSgH+P5JSrF6Nd/PsJjWTDb2fpiAz3FlfIPc0DViz1S2Vqpfw0cDCqprFw9h0IFPW2wwO1UucHfW06X0bGKYMUESq0QXZE2isHDu75ZJ6un2RU8HrnY+0z1v0MvCiDq1da1SFuCe3R44M0bpI4BZ7R5bSNzj+VG97KE/qpEp1Ld+NHU/pMJq5thdf1czCSzCZ5Fl0f3i32Npm3YSeQ5wdMSUNFLevgyP+uZqkolltI/5NEow5Ow5KH9DQVyuBDgNlMRX3IN/7NBrowMwDfOB0S0DGIUB3O6tMNX1GzZNCDHDDrieBwbBW9eIVzX78KHnlxbNyr+3QMu7XeFqQxKUx9VXJOZRpxC3zZgxZ0xiCn3jmDhpuHKpVRRQjKo+ykBN8m32Kq42DXIZz/CPWgQ+v7QwZf+eLRQdR3FR3y+BSamobyu9jCHw3IfP+qNCwqQlh0ACLPj8cfSo34AZYIj5lfz7WFSS5Q4aBHM+SZam+wU8rkvZ2FHLVqPARD7wYo/JvZiWtx4m8OgctKJAfpciJP2dZWEq0MdNAua9Ea0zH91ERlKqUO0Ooy1/y1O/H8oBR3LGmFh2BJwfMsbhveGit+lqmb8Vp5tqoLkvoFBo2AFguX1awc2yNNKRI3r7AHqmGvCCQgv3YNN16tb55CMMcuz1V0aStkA7nKXh131eHwCmFeRDQW3cPLYtWvu2lEYBgUIhn5RGkz4q9YoqRhU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66946007)(8676002)(66476007)(66556008)(76116006)(2906002)(7416002)(122000001)(64756008)(4326008)(66446008)(44832011)(8936002)(31696002)(5660300002)(38070700005)(86362001)(316002)(91956017)(6506007)(53546011)(83380400001)(6512007)(2616005)(186003)(66574015)(71200400001)(6486002)(38100700002)(966005)(26005)(54906003)(110136005)(508600001)(31686004)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S0tSNjFWUTdMb3BFaEhPYk00NHVhV2RUaktVaDFpT0J2aFV6cUxQTnhPN2tX?=
 =?utf-8?B?Tk9odU4yb0Vxa1gxZFZmNjZDOXViTjB5bEtsWTgzK2hxUEdIcnhFM0tpS21X?=
 =?utf-8?B?MWVmcGZvT0crVVl1ZnQxdzljK2RQTFNnMnZpQVdNRGdVdzZiaWplOFpyR0ZO?=
 =?utf-8?B?cXpqYUJrdWtrSG05NW5VdVl0VGFsWnhrMnRKTUI2d3ZHME1GVVUwU1Qxb2tZ?=
 =?utf-8?B?SXN6b2pBZGdoNHZqa1d3aW1qWlh0ZE1YUU10R09keEREaFMwVEJPemZqK0oy?=
 =?utf-8?B?Q2dGRlVDclN5STZrT1RiVUVONWxBSUZJcEdLSVdNekc4S3JUYTZlSVU2M1Bx?=
 =?utf-8?B?WTlXVGo5alpaaGV1dmh0R2doTDJocFFMOXdrY0liejdTM0NtN3VTY1U3NjVJ?=
 =?utf-8?B?TkVabFNZZXhDQXVjSzFiQTBXdVNjMGdpUGpoKzFPYlVuV3Qxbk1vdEhUUi9w?=
 =?utf-8?B?MkpmZ1p6L3dJRUFNRXEvcWM4SnUxNXRKT2ZSNWU1STF1SVlTS09zVTlNVGhu?=
 =?utf-8?B?MVVocldSK0ExM2FRRXdjL1YydFJJQXFCd21YWFBJUitkU1hYenpQWVZwMHc5?=
 =?utf-8?B?V2Z4YTcwcW5hWjQrOWpycGJ5K2JVVk0zOSszZDlZbWtqakdUTC9uYXUwWmxK?=
 =?utf-8?B?ZmFGcHRmeEJTUWkxWjlYWHRyeFV4REMySDhuSU9qNVEvL0Ivbk54K0JucFFW?=
 =?utf-8?B?dm9CL1pzZVRJcFlEcTZiTHhsWHYwU2hGU2ZCS0dvRzBodXlqeGdSRWtxcGl5?=
 =?utf-8?B?UVdIQ2d2VUcxSlM4TldKYU5NVEdkK3VuMWd0V1lQTENNMTlNVHBURmozSzF0?=
 =?utf-8?B?SGdjeG5oZEYxRzdrNUwzN2hXSEtBWlZIWGtFZnRwSHlVcWZpWm1JOXh4UW9n?=
 =?utf-8?B?OEZBb2xIQnJSQU1Vc0ZVSUNCUEw4dG9GL2poRXhvSEdFTjQzbXJWRUE2UTlu?=
 =?utf-8?B?K3IwdGZDeXJsbWxSREliNXlmcTA4NDVRQjVUYUlNM0FUZVpMcnhDOWFCWGo3?=
 =?utf-8?B?MEkyMmJONUJYdzFlU3lGd3RpbjNEbnlOL2t6dmJPQk83R3VPRTBTV0FMajZ6?=
 =?utf-8?B?WTZmRkljemdRM0JWb21SSUpQSy9tdjk0Sy8yWFlVeVZBLytLT2tIM3RRQU8z?=
 =?utf-8?B?cURpc1BpUXMxT2VscTdmQnU4cFpacmNxbTIyV3NMYmpNVjArRDZMQXZIbmZw?=
 =?utf-8?B?amx3bnh4MEZwdzhpVExXNXFLWmhrdTZ6blZqV3BRanJZb1NJemhsOGRDdTFL?=
 =?utf-8?B?T2xndWZJa1NNQ25xN3JwWU1WQnA1Qk5kTnlveWw2TFBVNnZXSS82U3lLRWRv?=
 =?utf-8?B?MzJ6c0llUmNON3BsSjBmcWs0OTRqR1p0NWJJc2JsTk52Z0g1RG1aR2IvM3Ur?=
 =?utf-8?B?Y0dBRklpNDFwQzZ5bXN1bDNJa2NHc2Y3eG5Pb3MrVFNpeXVZN3l6Um9pRVVj?=
 =?utf-8?B?V3cxWTd2U3UrTmRKU1VLd20rclJ4OWg0QW1qdTZPN2k3OTFMclFESk56Qkdq?=
 =?utf-8?B?Z3ZmVk9aeXYwOEdsL2tqYStKTjh0c3I2dVYvL2JEdkFNQllMLzJHbUFrbkFP?=
 =?utf-8?B?K1pwaDhONjJpM2ozSTZ6MytkNmJHcUNXa2QySFVnYlI1ZVQxSU85ZEpGRUhO?=
 =?utf-8?B?UzVMaHo0N0ttZ2lxQVg1bENpOFB3VkZZMHk1dkdVSCsxQ0ZqK2Nid2JWdE1U?=
 =?utf-8?B?WmszOG51dXBSaGNiTUdZaWRIeWFVZkxWekJwaVEwMG9CeXlIL0M3ZE84aVB1?=
 =?utf-8?B?SjU3djV2WHZMQ2JEUVhkcWFuQUZMVFliYUVDeVZHbVhmYmszVWIrUXZnQVBR?=
 =?utf-8?B?MnpPV29MS2pacGgzdUF5OVNLdVZZR0xOY2tkSlYzUzhWNWk1SUpLam9Ea3hw?=
 =?utf-8?B?eTEzVEhXYVNZY3hXMXppaW10TS9QbWprT3BrcVByQVZQd3ZUeEczOFhSblUz?=
 =?utf-8?B?TXJGU0l1QktlbjNYVnc3YTc2OFNmK29Oc01aVlFYNzA2Vk45dDRHMnpaUlhG?=
 =?utf-8?B?TjY4WEtST3BNc1ZBSEhWbUYzU3IxM3kvdlZMNjBvT211dWVvcTdDZHppMlpX?=
 =?utf-8?B?c0t3NHhkQldJWXp6aytBdkpDeTZBdkE4bC9YTFMvSVlpL2VlME5ZWUI0eDhX?=
 =?utf-8?B?OHhQcVkvZ0RUOUUzREJmaHhteEVJQUE2VHpCellyVmVSWmJ6SHBibWhBWkV6?=
 =?utf-8?B?K0NlcS9uUXc0N1VPOFMwcDdjWTdvR2RXZ1RveVJQTFhUSmVhSlNiWGZYWERT?=
 =?utf-8?B?K3VTeGQyVXlNUFp0TzN3VHVzdVhRY2MzNGVJMk96NTBvSjhvM24wRTFiSlBj?=
 =?utf-8?B?d2pDa1NIR2xqSUZDcCtTMkxUeGNpdkxVeWtXWkRDdXc2cXp3cnpoS0YxVFN0?=
 =?utf-8?Q?v6Rqr1RREdcn4z68N83X+sPncUWMQ6t0u0+jW?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DAFCD461A43C454C8902244BB7239DBD@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 65f09b00-df43-406b-9fe1-08da1b7e5cb7
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2022 05:44:36.0932 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c25w3ROPbcTqSJO3sqQQwz1FoFlnq7E1rAgiNgw1rJJSJRzdRszhEoiKR8G2/3r52QhrPs1o0b9kVLCTIzHdPJawluhXnP5fcuWy+UtxxuM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB2320
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
Cc: "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Paul Mackerras <paulus@samba.org>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDExLzA0LzIwMjIgw6AgMDc6MzEsIEFuc2h1bWFuIEtoYW5kdWFsIGEgw6ljcml0wqA6
DQo+IA0KPiANCj4gT24gNC85LzIyIDE3OjA2LCBDaHJpc3RvcGhlIExlcm95IHdyb3RlOg0KPj4N
Cj4+DQo+PiBMZSAwOC8wNC8yMDIyIMOgIDE0OjUzLCBDaHJpc3RvcGhlIExlcm95IGEgw6ljcml0
wqA6DQo+Pj4NCj4+Pg0KPj4+IExlIDA3LzA0LzIwMjIgw6AgMTI6MzIsIEFuc2h1bWFuIEtoYW5k
dWFsIGEgw6ljcml0wqA6DQo+Pj4+IFRoaXMgZGVmaW5lcyBhbmQgZXhwb3J0cyBhIHBsYXRmb3Jt
IHNwZWNpZmljIGN1c3RvbSB2bV9nZXRfcGFnZV9wcm90KCkgdmlhDQo+Pj4+IHN1YnNjcmliaW5n
IEFSQ0hfSEFTX1ZNX0dFVF9QQUdFX1BST1QuIFdoaWxlIGhlcmUsIHRoaXMgYWxzbyBsb2NhbGl6
ZXMNCj4+Pj4gYXJjaF92bV9nZXRfcGFnZV9wcm90KCkgYXMgcG93ZXJwY192bV9nZXRfcGFnZV9w
cm90KCkgYW5kIG1vdmVzIGl0IG5lYXINCj4+Pj4gdm1fZ2V0X3BhZ2VfcHJvdCgpLg0KPj4+Pg0K
Pj4+PiBDYzogTWljaGFlbCBFbGxlcm1hbiA8bXBlQGVsbGVybWFuLmlkLmF1Pg0KPj4+PiBDYzog
UGF1bCBNYWNrZXJyYXMgPHBhdWx1c0BzYW1iYS5vcmc+DQo+Pj4+IENjOiBsaW51eHBwYy1kZXZA
bGlzdHMub3psYWJzLm9yZw0KPj4+PiBDYzogbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZw0K
Pj4+PiBTaWduZWQtb2ZmLWJ5OiBBbnNodW1hbiBLaGFuZHVhbCA8YW5zaHVtYW4ua2hhbmR1YWxA
YXJtLmNvbT4NCj4+Pj4gLS0tDQo+Pj4+ICDCoCBhcmNoL3Bvd2VycGMvS2NvbmZpZ8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgfMKgIDEgKw0KPj4+PiAgwqAgYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNt
L21tYW4uaCB8IDEyIC0tLS0tLS0tLS0tLQ0KPj4+PiAgwqAgYXJjaC9wb3dlcnBjL21tL21tYXAu
Y8KgwqDCoMKgwqDCoMKgwqDCoCB8IDI2ICsrKysrKysrKysrKysrKysrKysrKysrKysrDQo+Pj4+
ICDCoCAzIGZpbGVzIGNoYW5nZWQsIDI3IGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQ0K
Pj4+Pg0KPj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL0tjb25maWcgYi9hcmNoL3Bvd2Vy
cGMvS2NvbmZpZw0KPj4+PiBpbmRleCAxNzRlZGFiYjc0ZmEuLmViOWI2ZGRiZjkyZiAxMDA2NDQN
Cj4+Pj4gLS0tIGEvYXJjaC9wb3dlcnBjL0tjb25maWcNCj4+Pj4gKysrIGIvYXJjaC9wb3dlcnBj
L0tjb25maWcNCj4+Pj4gQEAgLTE0MCw2ICsxNDAsNyBAQCBjb25maWcgUFBDDQo+Pj4+ICDCoMKg
wqDCoMKgIHNlbGVjdCBBUkNIX0hBU19USUNLX0JST0FEQ0FTVMKgwqDCoMKgwqDCoMKgIGlmIEdF
TkVSSUNfQ0xPQ0tFVkVOVFNfQlJPQURDQVNUDQo+Pj4+ICDCoMKgwqDCoMKgIHNlbGVjdCBBUkNI
X0hBU19VQUNDRVNTX0ZMVVNIQ0FDSEUNCj4+Pj4gIMKgwqDCoMKgwqAgc2VsZWN0IEFSQ0hfSEFT
X1VCU0FOX1NBTklUSVpFX0FMTA0KPj4+PiArwqDCoMKgIHNlbGVjdCBBUkNIX0hBU19WTV9HRVRf
UEFHRV9QUk9UDQo+Pj4+ICDCoMKgwqDCoMKgIHNlbGVjdCBBUkNIX0hBVkVfTk1JX1NBRkVfQ01Q
WENIRw0KPj4+PiAgwqDCoMKgwqDCoCBzZWxlY3QgQVJDSF9LRUVQX01FTUJMT0NLDQo+Pj4+ICDC
oMKgwqDCoMKgIHNlbGVjdCBBUkNIX01JR0hUX0hBVkVfUENfUEFSUE9SVA0KPj4+PiBkaWZmIC0t
Z2l0IGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL21tYW4uaCBiL2FyY2gvcG93ZXJwYy9pbmNs
dWRlL2FzbS9tbWFuLmgNCj4+Pj4gaW5kZXggN2NiNmQxOGY1Y2Q2Li4xYjAyNGU2NGM4ZWMgMTAw
NjQ0DQo+Pj4+IC0tLSBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9tbWFuLmgNCj4+Pj4gKysr
IGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL21tYW4uaA0KPj4+PiBAQCAtMjQsMTggKzI0LDYg
QEAgc3RhdGljIGlubGluZSB1bnNpZ25lZCBsb25nIGFyY2hfY2FsY192bV9wcm90X2JpdHModW5z
aWduZWQgbG9uZyBwcm90LA0KPj4+PiAgwqAgfQ0KPj4+PiAgwqAgI2RlZmluZSBhcmNoX2NhbGNf
dm1fcHJvdF9iaXRzKHByb3QsIHBrZXkpIGFyY2hfY2FsY192bV9wcm90X2JpdHMocHJvdCwgcGtl
eSkNCj4+Pj4gLXN0YXRpYyBpbmxpbmUgcGdwcm90X3QgYXJjaF92bV9nZXRfcGFnZV9wcm90KHVu
c2lnbmVkIGxvbmcgdm1fZmxhZ3MpDQo+Pj4+IC17DQo+Pj4+IC0jaWZkZWYgQ09ORklHX1BQQ19N
RU1fS0VZUw0KPj4+PiAtwqDCoMKgIHJldHVybiAodm1fZmxhZ3MgJiBWTV9TQU8pID8NCj4+Pj4g
LcKgwqDCoMKgwqDCoMKgIF9fcGdwcm90KF9QQUdFX1NBTyB8IHZtZmxhZ190b19wdGVfcGtleV9i
aXRzKHZtX2ZsYWdzKSkgOg0KPj4+PiAtwqDCoMKgwqDCoMKgwqAgX19wZ3Byb3QoMCB8IHZtZmxh
Z190b19wdGVfcGtleV9iaXRzKHZtX2ZsYWdzKSk7DQo+Pj4+IC0jZWxzZQ0KPj4+PiAtwqDCoMKg
IHJldHVybiAodm1fZmxhZ3MgJiBWTV9TQU8pID8gX19wZ3Byb3QoX1BBR0VfU0FPKSA6IF9fcGdw
cm90KDApOw0KPj4+PiAtI2VuZGlmDQo+Pj4+IC19DQo+Pj4+IC0jZGVmaW5lIGFyY2hfdm1fZ2V0
X3BhZ2VfcHJvdCh2bV9mbGFncykgYXJjaF92bV9nZXRfcGFnZV9wcm90KHZtX2ZsYWdzKQ0KPj4+
PiAtDQo+Pj4+ICDCoCBzdGF0aWMgaW5saW5lIGJvb2wgYXJjaF92YWxpZGF0ZV9wcm90KHVuc2ln
bmVkIGxvbmcgcHJvdCwgdW5zaWduZWQgbG9uZyBhZGRyKQ0KPj4+PiAgwqAgew0KPj4+PiAgwqDC
oMKgwqDCoCBpZiAocHJvdCAmIH4oUFJPVF9SRUFEIHwgUFJPVF9XUklURSB8IFBST1RfRVhFQyB8
IFBST1RfU0VNIHwgUFJPVF9TQU8pKQ0KPj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL21t
L21tYXAuYyBiL2FyY2gvcG93ZXJwYy9tbS9tbWFwLmMNCj4+Pj4gaW5kZXggYzQ3NWNmODEwYWE4
Li5jZDE3YmQ2ZmEzNmIgMTAwNjQ0DQo+Pj4+IC0tLSBhL2FyY2gvcG93ZXJwYy9tbS9tbWFwLmMN
Cj4+Pj4gKysrIGIvYXJjaC9wb3dlcnBjL21tL21tYXAuYw0KPj4+PiBAQCAtMjU0LDMgKzI1NCwy
OSBAQCB2b2lkIGFyY2hfcGlja19tbWFwX2xheW91dChzdHJ1Y3QgbW1fc3RydWN0ICptbSwgc3Ry
dWN0IHJsaW1pdCAqcmxpbV9zdGFjaykNCj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoCBtbS0+Z2V0
X3VubWFwcGVkX2FyZWEgPSBhcmNoX2dldF91bm1hcHBlZF9hcmVhX3RvcGRvd247DQo+Pj4+ICDC
oMKgwqDCoMKgIH0NCj4+Pj4gIMKgIH0NCj4+Pj4gKw0KPj4+PiArI2lmZGVmIENPTkZJR19QUEM2
NA0KPj4+PiArc3RhdGljIHBncHJvdF90IHBvd2VycGNfdm1fZ2V0X3BhZ2VfcHJvdCh1bnNpZ25l
ZCBsb25nIHZtX2ZsYWdzKQ0KPj4+PiArew0KPj4+PiArI2lmZGVmIENPTkZJR19QUENfTUVNX0tF
WVMNCj4+Pj4gK8KgwqDCoCByZXR1cm4gKHZtX2ZsYWdzICYgVk1fU0FPKSA/DQo+Pj4+ICvCoMKg
wqDCoMKgwqDCoCBfX3BncHJvdChfUEFHRV9TQU8gfCB2bWZsYWdfdG9fcHRlX3BrZXlfYml0cyh2
bV9mbGFncykpIDoNCj4+Pj4gK8KgwqDCoMKgwqDCoMKgIF9fcGdwcm90KDAgfCB2bWZsYWdfdG9f
cHRlX3BrZXlfYml0cyh2bV9mbGFncykpOw0KPj4+PiArI2Vsc2UNCj4+Pj4gK8KgwqDCoCByZXR1
cm4gKHZtX2ZsYWdzICYgVk1fU0FPKSA/IF9fcGdwcm90KF9QQUdFX1NBTykgOiBfX3BncHJvdCgw
KTsNCj4+Pj4gKyNlbmRpZg0KPj4+PiArfQ0KPj4+PiArI2Vsc2UNCj4+Pj4gK3N0YXRpYyBwZ3By
b3RfdCBwb3dlcnBjX3ZtX2dldF9wYWdlX3Byb3QodW5zaWduZWQgbG9uZyB2bV9mbGFncykNCj4+
Pj4gK3sNCj4+Pj4gK8KgwqDCoCByZXR1cm4gX19wZ3Byb3QoMCk7DQo+Pj4+ICt9DQo+Pj4+ICsj
ZW5kaWYgLyogQ09ORklHX1BQQzY0ICovDQo+Pj4NCj4+PiBDYW4gd2UgcmVkdWNlIHRoaXMgZm9y
ZXN0IG9mICNpZmRlZnMgYW5kIG1ha2UgaXQgbW9yZSByZWFkYWJsZSA/DQo+Pj4NCj4+PiBtbS9t
bWFwLmMgaXMgZ29pbmcgYXdheSB3aXRoIHBhdGNoIGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5v
cmcvcHJvamVjdC9saW51eHBwYy1kZXYvcGF0Y2gvZDZkODQ5NjIxZjgyMWFmMjUzZTc3N2EyNGVk
YTRjNjQ4ODE0YTc2ZS4xNjQ2ODQ3NTYyLmdpdC5jaHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXUv
DQo+Pj4NCj4+PiBTbyBpdCB3b3VsZCBiZSBiZXR0ZXIgdG8gYWRkIHR3byB2ZXJzaW9ucyBvZiB2
bV9nZXRfcGFnZV9wcm90KCksIGZvciBpbnN0YW5jZSBvbmUgaW4gbW0vcGd0YWJsZV82NC5jIGFu
ZCBvbmUgaW4gbW0vcGd0YWJsZV8zMi5jDQo+Pg0KPj4gSW5kZWVkLCB5b3UgZG9uJ3QgbmVlZCBh
bnl0aGluZyBhdCBhbGwgZm9yIFBQQzMyLiBBbGwgeW91IG5lZWQgdG8gZG8gaXMNCj4+DQo+PiAg
wqDCoMKgwqBzZWxlY3QgQVJDSF9IQVNfVk1fR0VUX1BBR0VfUFJPVCBpZiBQUEM2NA0KPj4NCj4+
IEFuZCBpbiBmYWN0IGl0IGNvdWxkIGV2ZW4gYmUgUFBDX0JPT0szU182NCBpbnN0ZWFkIG9mIFBQ
QzY0IGJlY2F1c2UgQ09ORklHX1BQQ19NRU1fS0VZUyBkZXBlbmRzIG9uIFBQQ19CT09LM1NfNjQg
YW5kIF9QQUdFX1NBTyBpcyAwIG9uIG5vaGFzaC82NC4NCj4+DQo+PiBTbyB5b3UgY2FuIHRoZW4g
cHV0IGl0IGludG8gYXJjaC9wb3dlcnBjL21tL2Jvb2szczY0L3BndGFibGUuYw0KPiANCj4gV291
bGQgc29tZXRoaW5nIGxpa2UgdGhlIGZvbGxvd2luZyBjaGFuZ2Ugd29yayA/DQoNClllcyB0aGF0
IGxvb2tzIGdvb2QgdG8gbWUuDQoNClRoYW5rcw0KQ2hyaXN0b3BoZQ0KDQo+IA0KPiBkaWZmIC0t
Z2l0IGEvYXJjaC9wb3dlcnBjL0tjb25maWcgYi9hcmNoL3Bvd2VycGMvS2NvbmZpZw0KPiBpbmRl
eCBlYjliNmRkYmY5MmYuLjY5ZTQ0MzU4YTIzNSAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBj
L0tjb25maWcNCj4gKysrIGIvYXJjaC9wb3dlcnBjL0tjb25maWcNCj4gQEAgLTE0MCw3ICsxNDAs
NyBAQCBjb25maWcgUFBDDQo+ICAgICAgICAgIHNlbGVjdCBBUkNIX0hBU19USUNLX0JST0FEQ0FT
VCAgICAgICAgICBpZiBHRU5FUklDX0NMT0NLRVZFTlRTX0JST0FEQ0FTVA0KPiAgICAgICAgICBz
ZWxlY3QgQVJDSF9IQVNfVUFDQ0VTU19GTFVTSENBQ0hFDQo+ICAgICAgICAgIHNlbGVjdCBBUkNI
X0hBU19VQlNBTl9TQU5JVElaRV9BTEwNCj4gLSAgICAgICBzZWxlY3QgQVJDSF9IQVNfVk1fR0VU
X1BBR0VfUFJPVA0KPiArICAgICAgIHNlbGVjdCBBUkNIX0hBU19WTV9HRVRfUEFHRV9QUk9UICAg
ICAgICBpZiBQUENfQk9PSzNTXzY0DQo+ICAgICAgICAgIHNlbGVjdCBBUkNIX0hBVkVfTk1JX1NB
RkVfQ01QWENIRw0KPiAgICAgICAgICBzZWxlY3QgQVJDSF9LRUVQX01FTUJMT0NLDQo+ICAgICAg
ICAgIHNlbGVjdCBBUkNIX01JR0hUX0hBVkVfUENfUEFSUE9SVA0KPiBkaWZmIC0tZ2l0IGEvYXJj
aC9wb3dlcnBjL21tL2Jvb2szczY0L3BndGFibGUuYyBiL2FyY2gvcG93ZXJwYy9tbS9ib29rM3M2
NC9wZ3RhYmxlLmMNCj4gaW5kZXggMDUyZTY1OTBmODRmLi41OWQyMzU1MTliNDQgMTAwNjQ0DQo+
IC0tLSBhL2FyY2gvcG93ZXJwYy9tbS9ib29rM3M2NC9wZ3RhYmxlLmMNCj4gKysrIGIvYXJjaC9w
b3dlcnBjL21tL2Jvb2szczY0L3BndGFibGUuYw0KPiBAQCAtNyw2ICs3LDcgQEANCj4gICAjaW5j
bHVkZSA8bGludXgvbW1fdHlwZXMuaD4NCj4gICAjaW5jbHVkZSA8bGludXgvbWVtYmxvY2suaD4N
Cj4gICAjaW5jbHVkZSA8bGludXgvbWVtcmVtYXAuaD4NCj4gKyNpbmNsdWRlIDxsaW51eC9wa2V5
cy5oPg0KPiAgICNpbmNsdWRlIDxsaW51eC9kZWJ1Z2ZzLmg+DQo+ICAgI2luY2x1ZGUgPG1pc2Mv
Y3hsLWJhc2UuaD4NCj4gICANCj4gQEAgLTU0OSwzICs1NTAsMjIgQEAgdW5zaWduZWQgbG9uZyBt
ZW1yZW1hcF9jb21wYXRfYWxpZ24odm9pZCkNCj4gICB9DQo+ICAgRVhQT1JUX1NZTUJPTF9HUEwo
bWVtcmVtYXBfY29tcGF0X2FsaWduKTsNCj4gICAjZW5kaWYNCj4gKw0KPiArc3RhdGljIHBncHJv
dF90IF9fdm1fZ2V0X3BhZ2VfcHJvdCh1bnNpZ25lZCBsb25nIHZtX2ZsYWdzKQ0KPiArew0KPiAr
I2lmZGVmIENPTkZJR19QUENfTUVNX0tFWVMNCj4gKyAgICAgICByZXR1cm4gKHZtX2ZsYWdzICYg
Vk1fU0FPKSA/DQo+ICsgICAgICAgICAgICAgICBfX3BncHJvdChfUEFHRV9TQU8gfCB2bWZsYWdf
dG9fcHRlX3BrZXlfYml0cyh2bV9mbGFncykpIDoNCj4gKyAgICAgICAgICAgICAgIF9fcGdwcm90
KDAgfCB2bWZsYWdfdG9fcHRlX3BrZXlfYml0cyh2bV9mbGFncykpOw0KPiArI2Vsc2UNCj4gKyAg
ICAgICByZXR1cm4gKHZtX2ZsYWdzICYgVk1fU0FPKSA/IF9fcGdwcm90KF9QQUdFX1NBTykgOiBf
X3BncHJvdCgwKTsNCj4gKyNlbmRpZg0KPiArfQ0KPiArDQo+ICtwZ3Byb3RfdCB2bV9nZXRfcGFn
ZV9wcm90KHVuc2lnbmVkIGxvbmcgdm1fZmxhZ3MpDQo+ICt7DQo+ICsgICAgICAgcmV0dXJuIF9f
cGdwcm90KHBncHJvdF92YWwocHJvdGVjdGlvbl9tYXBbdm1fZmxhZ3MgJg0KPiArICAgICAgICAg
ICAgICAgICAgICAgICAoVk1fUkVBRHxWTV9XUklURXxWTV9FWEVDfFZNX1NIQVJFRCldKSB8DQo+
ICsgICAgICAgICAgICAgIHBncHJvdF92YWwoX192bV9nZXRfcGFnZV9wcm90KHZtX2ZsYWdzKSkp
Ow0KPiArfQ0KPiArRVhQT1JUX1NZTUJPTCh2bV9nZXRfcGFnZV9wcm90KTs=
