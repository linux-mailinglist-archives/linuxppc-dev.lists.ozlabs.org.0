Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 838847446F1
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Jul 2023 08:31:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=CTkC8P97;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QtMlr3Y3Xz3c2m
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Jul 2023 16:31:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=CTkC8P97;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::623; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20623.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::623])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QtMkv4LC0z3bNn
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Jul 2023 16:30:45 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YoSeqxW7o70Ai/AjnRFFwjf9oJI+DjW8RoOnyZQ83oJle/kDZyM3muWf2t8SNwCPS21zMXRIHQOeHoKz0kPXZdlPE8tu8pq35LSIyhVKRZe2alwX4eVEmoeFETz8otC+Amdo6qJcIkUqEoK6jC5oUFTwXUKiGMMz9/nqfg2JUppBYBlWg3eF0FkDi7ID8MQ51dZzYXPbbWohQXXVvH+yujOB7aVp+kWvcWVu8JXxzDbJaLm3/ZsS7yO5pe31sAGGurF2x0sceqKxDgXf9hQXauOu/V0WCkDHkH09Nfm1K85K5RfPEEFTj/eboY6OUOAW3X9daXl55O0yiIbesRvDKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KCb9KVmKYipRBndglFDPfZncDHxbJSTrD5vmD1+C5qk=;
 b=ZglN888TCUKTztASmdcHUuUW0aMSD1XJHvVWPOqcH+c6sadiz9jAZEaV/DvZ1TvwkOE6b+yw1/EPo0aSuDNmgrbTCEPM5wWdSGXPOVi+a2ns5zdY+rkGm1JKM+4scordC4cg5qouBCMR8v68INdjvU/vAetnXAW/fyZVK6dqPCAF0FE4HkjX8nQRR/afEEAPyS3QMG/EpNZPe1ZtgFjEqKUpFp0dBCoDggP0q5IOvHKzCkiOdrsOnVY097lGIRZsxGuZ4ipqhlG7AH5SaX3e4sVj24/S5ahvl7eMlQ1VLLkEW4JGbNbmrCPSUcWKeDNKVZ4D9E6o2CJdUZXVeiNfyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KCb9KVmKYipRBndglFDPfZncDHxbJSTrD5vmD1+C5qk=;
 b=CTkC8P97t2LhZdn+/FrAMPqfgVE9rwQQHvnlGrBgH0hNSEavyFIytipXR7UyEa3UhVAYHrU3W5+1enIdb+03uCPcmpOKtfdl22Yatg1yHNrm2LWPlTdJcZRifn2vfe6wb6IhIWLaiaWn9t9xJFzCqOiKiXnYm+agGKMWW6aA6yW27WJtieFTqDpzEUABZnLm+/fUa2i/v0givB0svJjzL4AtRhlQnsK1GybYD5op4C2wrRHTMtD3Dtqii3fsTgOfAfbm8vMocHWdct/rhDfjMa5Iz8yqxU5NJ58EOpq94J6moNahEcDSK0NPy3x7gpSWH0xFtWSGtGGwI56YaBMrqw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB3339.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:145::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Sat, 1 Jul
 2023 06:30:22 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::802b:33:561c:4217]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::802b:33:561c:4217%4]) with mapi id 15.20.6544.024; Sat, 1 Jul 2023
 06:30:22 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Randy Dunlap <rdunlap@infradead.org>, =?utf-8?B?UGFsaSBSb2jDoXI=?=
	<pali@kernel.org>
Subject: Re: [PATCH] powerpc: allow PPC_EARLY_DEBUG_CPM only when SERIAL_CPM=y
Thread-Topic: [PATCH] powerpc: allow PPC_EARLY_DEBUG_CPM only when
 SERIAL_CPM=y
Thread-Index: AQHZiAsoxHGU6NRhHU6mglnf0l2nCK9dP3YAgCZC4wCAISw/AIAADFaA
Date: Sat, 1 Jul 2023 06:30:22 +0000
Message-ID: <a432cfe8-cfe6-6139-4487-37c08b6842b5@csgroup.eu>
References: <20230516152854.22465-1-rdunlap@infradead.org>
 <20230516185400.urjy6y3kh4grbagt@pali>
 <a259b113-6547-4323-c69d-5d04d7cf3a75@infradead.org>
 <a80acd62-69d2-f3dc-410f-8d9722980e74@infradead.org>
In-Reply-To: <a80acd62-69d2-f3dc-410f-8d9722980e74@infradead.org>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB3339:EE_
x-ms-office365-filtering-correlation-id: 2870cf30-6f80-4b57-c603-08db79fca5e2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  /NjIhlaKYsTymjwlMe1twZHO5JpMZnvbO+yQGSFt5AfASz9xArPlRG4n9yWb8/+FanKCBAoxAkgsU7S1dfRYLSvTMmmUlptmRgrj1mZSn1DEDwu0pmgGbpugqNSB5jwota+Si7bbQYRGEZCC5yFyjorNYk9tY+oFNWBKUHlaiWl51x7fwLk15ME58T79KRnyoNOAbF+YVZg+H1dAD5xpxB1JRgZCOKUDFTyQy9dg0d6Fp3Hk2P4CuoI+hs7sFLdyMKudUm45ohtIWtLngwP4hcEwWWeu4xfuq145JES8rlApxmagUTMU1cogqv/XZhVa+JaNKh4fgiy9k33vrX21z+Bqm8hwGp9KEd/o67HdjLBFu0itJC/rvVDihTlnJ5PqhUmSdavwYcW3kdoIlvF1IItZTRRwnBIu75DBarVYTsTsq2pxhvfHYsSr2oT3lmeEqysOl4i02w4KY1fNVJ2yUb+nGEM4XoRH677SXUNFeUzKs+bUF8R3qwrlRx59AvcgCOtM/+ikyCluEFyOs7JZZvEn8dHee5pRHvtixh7iJ8xPgV/jtCWdAgqCrYxcbuQllzXi61rj6TTKCv7zvmccnwUuc5hDqzUQX65+aV8iTrOylhtgqSZfiyPP3GtQyWVSOx/eOaQB55e96rsClwSnHCJ2S07yKlQa+Fpv0ySyOug=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(366004)(136003)(39850400004)(346002)(451199021)(110136005)(54906003)(2906002)(478600001)(26005)(41300700001)(6486002)(86362001)(966005)(8676002)(8936002)(31686004)(31696002)(5660300002)(71200400001)(36756003)(44832011)(316002)(66556008)(66476007)(66446008)(64756008)(66946007)(122000001)(38100700002)(4326008)(38070700005)(53546011)(6506007)(91956017)(76116006)(2616005)(6512007)(186003)(66574015)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?Q0czZUFXN21ITHYzME1FT2M3b00yKzJEenFUSCtZVHJOR05FOWtFSUNneEQ2?=
 =?utf-8?B?enVFWlpRbjh5UW9vUUZObFlVaGlqN1BvcC9uQnYwMUJOd1pVWDhSSlhrRGxU?=
 =?utf-8?B?TnpTbHY1dGdxZDIvZ1Vnd05oWGU4b1QvMVBuRVNTbTZ0cldJQ1Y3V1lTS24w?=
 =?utf-8?B?MWZZOTNVMjcyd0g4cUNad00zSEZISitKSnFDSnVteCtnVDBoWDZGWkdFTzJh?=
 =?utf-8?B?cndzeTZ6WlloNUdQUzZKUlJiWHh5MkdsRHMzbVRrN01MNnNwZVJnNW94MzdM?=
 =?utf-8?B?T2ord2srME5zKy9wclArWFpuV3haQ2xHOUFYVElxRjE5Yjd4Q1gwUEZZbkt4?=
 =?utf-8?B?UkcwMVIvWGpBNlVqbFg2azRaNEFxbGptZkdqRGhzV0JtTDFxczMrYzloSWsx?=
 =?utf-8?B?dDUzbjNkMXd4WTdZZUxwbWRtMUpMT3I5Umx2V01PR3FLUWNYVFNwMWRNOHdX?=
 =?utf-8?B?eXJpUGlZc0Y2SHJRRmo5YWswelkrMlRJSkMwMnExaVpjSDJsVEtyWFdiUUJE?=
 =?utf-8?B?YTltS3RFL2JEOHpKb3hFdVZ2dTVmaVlEd21sYjNpbndRWFBqeW1xb0pHZVNh?=
 =?utf-8?B?bENSQjZpMDZtRXZLRHc3RnloU2M2alNGeGVPWlplNUJzT0lSQ1ZIdlFBdmVh?=
 =?utf-8?B?dXo0ZkFYL1dRWTZvYk92aFhpcmRwbTAzTVUrVmJwTzNCZWdOOXJjVFcwRkFk?=
 =?utf-8?B?bHkrekZKSGt0RzZ4V3BURHRGL1NkaEVpMzExUnJDaE8vUnZxb0laaVlodytr?=
 =?utf-8?B?emFEVllIZGpTU3hwWFl6Nmc4NFJaWDNpc21Vd1B2RHRyVGpHcjU4R0poREU4?=
 =?utf-8?B?SkdDSUVSWStmS2lxMVo0T2dBMW1hL2drckZWMFFFcTBuSDdHNUY4WlBoWUx1?=
 =?utf-8?B?WTkyTm9CQ3BUY0ZqQzdwNWZmbVVERDVndzd2UTlMMlFJNVdXOCtxdk41cm9x?=
 =?utf-8?B?dktuNW9pOGpBV1dKQjAvMGRjakhNa3ZSVExVb2xJQnBMeEYwVFUva203NjQ4?=
 =?utf-8?B?cVBKeUpjNGhVWjZ6TFpkY0c2am9Kbll4dmJnTEp1M3hMcldsUlFCeVpkaThy?=
 =?utf-8?B?a1FzblJrSjUvRk55QVY5ODMzaU1EeElCN3ZvM005eDNpQ1ZwdjNWeFBQckV4?=
 =?utf-8?B?bXdqdGdaT0x5Q3lVM0tYUEVDS1J6TVBWNUJGaGRNQWVCUnBQRDREc3VtWEJI?=
 =?utf-8?B?L09tTjRLL3FoNU1PTkNXQlZhOW81S1pMeXA4UlVyTFVpREE5QUZCby92YWp5?=
 =?utf-8?B?eHEvU2VHUWpZTDlYaXRUZTV4aTVVM0owVXFUd2k0ZkFGUnBPUFdQKzBMMytU?=
 =?utf-8?B?c1BJV1FvcWFJbkJjVzJORGtjVHEzWW04R0tYWk5qMVRIV3EvejEvSlIwMmxY?=
 =?utf-8?B?V3U4YWVzSm1rS1lQYklKbnkwVFArdFFEeG5UUlViVFkvMnVFcStjQmpyeGUy?=
 =?utf-8?B?OFIxMXNINjgxeXY0elJqWUlrRndqUGMzbURHNDBsdERFejhwclhOR3pGSmFN?=
 =?utf-8?B?UjJhYzJMY2RFQ29KNnVNajRGMWx1bVNCc1dBdk0vOExpY3ROVjFUamdUc0hI?=
 =?utf-8?B?dkp5bk5uN2V6V3F4K2VVdTR3YmJzTC84R1RkQkdxZWJMTkdSL1V2SE0zVkVX?=
 =?utf-8?B?TGtrVFI1aWNvb2x5VVd0N1VSNTZ4ZWhiRS91ekZQNFErTHJUYWlkQ2VEcUZl?=
 =?utf-8?B?T0hVZ3htdVRlZlRSMGN3TkljbDFVS3IwS0syb3M5Z2JvMnlYbE1OWmdZek5G?=
 =?utf-8?B?emdsQWJQUnFkQy84L1hhYVhCdi91dnNpT256QmhkREJDazNrL2VaejBWMEda?=
 =?utf-8?B?aFFWZThYK0s4Y2wvdEZPdEJOQU1GVE9td1VkWUYzS2JmMDIzTDZNRy8vNnJN?=
 =?utf-8?B?aStFMVFROHdHOXFFbVhCbTR6cWxManFkOS9xczVqZ3JxVWhWdW4rZWg2ekpu?=
 =?utf-8?B?Ylp2S3owNm5VWWdnNzZsdmYzMGxpazQ1aVpzdUlVMzdvMXFOYUI1blk4Ymk5?=
 =?utf-8?B?SzRPNmVLajh4YzZHcnZZNnF0VW9nY1NMdTM1aHhuZ2E0SkhyU0VJcCtXQlpj?=
 =?utf-8?B?OGxIWHJYR2ZlSGRCaXFVWHBrclZaSVNTd2htSXp0WnpmcXV6bUlBQmxPODJZ?=
 =?utf-8?Q?LUNNhu63IcRj7k7xZVZdQX+cP?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <71B1209EACDA184DB23B538193C9965D@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2870cf30-6f80-4b57-c603-08db79fca5e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2023 06:30:22.4293
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ARLAVLRieeBBEWjTUdgasd3Kw0XkomrP//LFyg5GcTyXMg+xulYI9H+BeMIyvSqmTHjCnb99qepj29YLDMdlO7WXVUh4in0i/ifMH9bKWJk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB3339
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Kumar Gala <galak@kernel.crashing.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDAxLzA3LzIwMjMgw6AgMDc6NDYsIFJhbmR5IER1bmxhcCBhIMOpY3JpdMKgOg0KPiAN
Cj4gDQo+IE9uIDYvOS8yMyAyMDoxMSwgUmFuZHkgRHVubGFwIHdyb3RlOg0KPj4gSGktLQ0KPj4N
Cj4+IE9uIDUvMTYvMjMgMTE6NTQsIFBhbGkgUm9ow6FyIHdyb3RlOg0KPj4+IE9uIFR1ZXNkYXkg
MTYgTWF5IDIwMjMgMDg6Mjg6NTQgUmFuZHkgRHVubGFwIHdyb3RlOg0KPj4+PiBJbiBhIHJhbmRj
b25maWcgd2l0aCBDT05GSUdfU0VSSUFMX0NQTT1tIGFuZA0KPj4+PiBDT05GSUdfUFBDX0VBUkxZ
X0RFQlVHX0NQTT15LCB0aGVyZSBpcyBhIGJ1aWxkIGVycm9yOg0KPj4+PiBFUlJPUjogbW9kcG9z
dDogInVkYmdfcHV0YyIgW2RyaXZlcnMvdHR5L3NlcmlhbC9jcG1fdWFydC9jcG1fdWFydC5rb10g
dW5kZWZpbmVkIQ0KPj4+Pg0KPj4+PiBQcmV2ZW50IHRoZSBidWlsZCBlcnJvciBieSBhbGxvd2lu
ZyBQUENfRUFSTFlfREVCVUdfQ1BNIG9ubHkgd2hlbg0KPj4+PiBTRVJJQUxfQ1BNPXkuDQo+Pj4+
DQo+Pj4+IEZpeGVzOiBjMzc0ZTAwZTE3ZjEgKCJbUE9XRVJQQ10gQWRkIGVhcmx5IGRlYnVnIGNv
bnNvbGUgZm9yIENQTSBzZXJpYWwgcG9ydHMuIikNCj4+Pj4gU2lnbmVkLW9mZi1ieTogUmFuZHkg
RHVubGFwIDxyZHVubGFwQGluZnJhZGVhZC5vcmc+DQo+Pj4+IENjOiBTY290dCBXb29kIDxzY290
dHdvb2RAZnJlZXNjYWxlLmNvbT4NCj4+Pj4gQ2M6IEt1bWFyIEdhbGEgPGdhbGFrQGtlcm5lbC5j
cmFzaGluZy5vcmc+DQo+Pj4+IENjOiAiUGFsaSBSb2jDoXIiIDxwYWxpQGtlcm5lbC5vcmc+DQo+
Pj4+IENjOiBNaWNoYWVsIEVsbGVybWFuIDxtcGVAZWxsZXJtYW4uaWQuYXU+DQo+Pj4+IENjOiBO
aWNob2xhcyBQaWdnaW4gPG5waWdnaW5AZ21haWwuY29tPg0KPj4+PiBDYzogQ2hyaXN0b3BoZSBM
ZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1Pg0KPj4+PiBDYzogbGludXhwcGMtZGV2
QGxpc3RzLm96bGFicy5vcmcNCj4+Pg0KPj4+IExvb2tzIGdvb2QsDQo+Pj4NCj4+PiBSZXZpZXdl
ZC1ieTogUGFsaSBSb2jDoXIgPHBhbGlAa2VybmVsLm9yZz4NCj4+DQo+PiBJJ20gc3RpbGwgc2Vl
aW5nIHRoaXMgYnVpbGQgZXJyb3IgaW4gbGludXgtbmV4dCBldmVuIHdpdGggb3RoZXIgKFBQQykg
Q1BNDQo+PiBwYXRjaGVzIGFwcGxpZWQuDQo+Pg0KPiANCj4gUGF0Y2h3b3JrIHNob3dzIHN0YXR1
cyBhcyBTdXBlcnNlZGVkOg0KPiANCj4gaHR0cDovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2pl
Y3QvbGludXhwcGMtZGV2L3BhdGNoLzIwMjMwNTE2MTUyODU0LjIyNDY1LTEtcmR1bmxhcEBpbmZy
YWRlYWQub3JnLw0KPiANCj4gYnV0IEkgZG9uJ3QgdW5kZXJzdGFuZCB3aHkgb3IgYnkgd2hhdC4N
Cg0KTmVpdGhlciBkbyBJLiBJIG11c3QgaGF2ZSBtYWRlIGEgbWlzdGFrZSBidXQgSSBjYW4ndCBy
ZW1lbWJlci4NCg0KPiANCj4gSSdtIGdvaW5nIHRvIHJlc3VibWl0IHRoZSBwYXRjaCBub3cuDQoN
CkZpbmUsIHRoZW4gdGhlIHByZXZpb3VzIGlzIHJlYWxseSBzdXBlcnNlZWRlZCBub3cuDQoNCkNo
cmlzdG9waGUNCg0KPiANCj4gDQo+Pj4NCj4+Pj4gLS0tDQo+Pj4+ICAgYXJjaC9wb3dlcnBjL0tj
b25maWcuZGVidWcgfCAgICAyICstDQo+Pj4+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pDQo+Pj4+DQo+Pj4+IGRpZmYgLS0gYS9hcmNoL3Bvd2VycGMvS2Nv
bmZpZy5kZWJ1ZyBiL2FyY2gvcG93ZXJwYy9LY29uZmlnLmRlYnVnDQo+Pj4+IC0tLSBhL2FyY2gv
cG93ZXJwYy9LY29uZmlnLmRlYnVnDQo+Pj4+ICsrKyBiL2FyY2gvcG93ZXJwYy9LY29uZmlnLmRl
YnVnDQo+Pj4+IEBAIC0yNDAsNyArMjQwLDcgQEAgY29uZmlnIFBQQ19FQVJMWV9ERUJVR180MHgN
Cj4+Pj4gICANCj4+Pj4gICBjb25maWcgUFBDX0VBUkxZX0RFQlVHX0NQTQ0KPj4+PiAgIAlib29s
ICJFYXJseSBzZXJpYWwgZGVidWdnaW5nIGZvciBGcmVlc2NhbGUgQ1BNLWJhc2VkIHNlcmlhbCBw
b3J0cyINCj4+Pj4gLQlkZXBlbmRzIG9uIFNFUklBTF9DUE0NCj4+Pj4gKwlkZXBlbmRzIG9uIFNF
UklBTF9DUE09eQ0KPj4+PiAgIAloZWxwDQo+Pj4+ICAgCSAgU2VsZWN0IHRoaXMgdG8gZW5hYmxl
IGVhcmx5IGRlYnVnZ2luZyBmb3IgRnJlZXNjYWxlIGNoaXBzDQo+Pj4+ICAgCSAgdXNpbmcgYSBD
UE0tYmFzZWQgc2VyaWFsIHBvcnQuICBUaGlzIGFzc3VtZXMgdGhhdCB0aGUgYm9vdHdyYXBwZXIN
Cj4+DQo+IA0K
