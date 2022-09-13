Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E62CE5B6F5A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Sep 2022 16:13:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MRlnW4J2nz3c3T
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Sep 2022 00:13:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=VVyTLC6X;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.73; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=VVyTLC6X;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90073.outbound.protection.outlook.com [40.107.9.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MRlmj6qMTz2xjt
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Sep 2022 00:13:07 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AA+pZ+FX+6dkpqUewlPWfKbt96w1cvc3Ft+xsrlQln5LN/L8xkPx+YNe1pka4lv//1pVLi0WrNrskZl6gllTMe/15NLXm9NW7tReAWL6U328PGtu0v7yX1NF80ITpg/okhEQ2GLJMgvqTL5Mf13qwhVAsuE9pIqr5CCFCfd9QW9oBDMoZdQPOz1PHTv2hKqTeFwb0vczL6PKIHnU4KIXHYQLPkawwB3cHpkhkHW7Dnc0rIPqEp3vyMaXU6elyTyAaPe9XlSGjbPPfVqnrThT8yqxPkzHHN5Q/ZYYJKi/EQKiwXgfbf+Q5EvNnJrMJ3VCSYYGTJGpKt+DB+Lkpv1zeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TQzS2SCb4P3dMdaSU78lH1b4WEWlCVCUjF0EQeCE/bA=;
 b=bvF5AiUl7Oz7rUp7+fbiAkoIeEkdIXK9IeBpx7h2y7UFH7Gs6lti6R1ZWuij+F8B3ME5FdVZo/aYuq57FQTcVkWJ33y7YdJlHt/NEdtHXxkX9FvFUM/xt7RVsbsa3gov4TSxYBEa9gD1VlBr+BHDWz/ssOSQxMYk1d95zTVJ4nPjCP/eKHCteox65voCtjflWpIcWV8VzYusioPyiuuHbD1DiJFjhWza7nAqKY5AXhA3qQEcfZuudixx0JiTRdyLiuhZrQZBpne/dszZpACSRNHzNBxjygpgFJbKfi7Y6UQ8OtFXVmDNBz/7xT4AqRJIXoOeo3vx3UTUdRt7ESQmSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TQzS2SCb4P3dMdaSU78lH1b4WEWlCVCUjF0EQeCE/bA=;
 b=VVyTLC6XSTHkNo0lvSsiqpxjZTKgYogQ/0x2zPom8Cfws1VJUsTLv1QoXoznnutz36nPfgakN96KUDMX4j6dy1Bn6S/RK9OqybBMhT9tuGmg577xEuLos/Am6a5lYAZCeXeXT5PkRhCBjPKE0/gW2Q3p52S03b+n28domVX4B2Pjhlt2LQj9IlO7sUSeRRs4bDTaqcoUjykrpYb75psNAForVIQpNO0N8uztst9J161MEGpWvBt/Y//qRTNuttiH8+s0zrQI7zQx0QRQqWK1vqSbiHkY1snENCKKmp4LIGdZm03tQJch5IA3e8BrlYJRMdFgUja8REOfuPX2RLOL6A==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB1525.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Tue, 13 Sep
 2022 14:12:46 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8%5]) with mapi id 15.20.5612.022; Tue, 13 Sep 2022
 14:12:46 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Rohan McLure <rmclure@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 2/3] powerpc: mm: add p{te,md,ud}_user_accessible_page
 helpers
Thread-Topic: [PATCH 2/3] powerpc: mm: add p{te,md,ud}_user_accessible_page
 helpers
Thread-Index: AQHYxknSyZE2k04Z8EWLaX7wGvxwMK3daTaA
Date: Tue, 13 Sep 2022 14:12:46 +0000
Message-ID: <dfff3b59-ae0d-4017-69ae-4132936c540b@csgroup.eu>
References: <20220912014703.185471-1-rmclure@linux.ibm.com>
 <20220912014703.185471-2-rmclure@linux.ibm.com>
In-Reply-To: <20220912014703.185471-2-rmclure@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB1525:EE_
x-ms-office365-filtering-correlation-id: 2501c47b-69cd-409d-f793-08da95920835
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  ilvJwMDpf4LvSDl6pyoXjlPPioCqad83hDHlccpBDW/TDaS4rG1N7IATdTddB4V+z+Bu3U82w2N3rmh8npn7rEDHeVrLe8kj2XCKHaIEAPU/zSx11l33etbJfEdIo9XaIdp1AHgYtyrkj/ilk1i46ZF5zOdXtw2OOoGnO00wwqjQfPoV1raDdGcNOI1rdYgjIH1Yf0asmPc+HYGchK1Oz+WNKR4sR+xqHIH92S/TmRZk9XH9S6tab5qMEIvnaX5iM238FGzj9eeqZrgBusGY1bCBSM4rmRKiMxVG+iudbN/ie6b//rCxiv0KzGdW7WG6mZzJ/eihv3Nt/8GvAlcE7hWg6zM2UcbrS+D6/yBzPG/U4ZlL5PLLThKjxnyCekAc7HSFoI+tfDTFMtV6r4RW/JgVcBA3XQa898PL0p71Ck84lli2yrXVkuSZYIEoBKJSLR2urnZZSVsZyyyudtzuNjaWGRl52tGhWJe7HUDGFvPsx/tF2p8dtsoYPef1/Zy8HTlztgwbHQ5hn3RiB/ZpBx6wBUNz6CYebEIEvTFTbokDwgyZSbuon7EwCUwd3UVEs7nU25uhhPrl8Ie+IgwyfdSHUzD/pTfa7Oe9rfMFho+GUbOnYv3TGRA8HSx/luC5N4xbPLzJAPJ486iO1fXHXX3cemv+TZczDFE0E9skHwD8vIak8dwdmHfOHzP1pq9vZTvIE9uCBdqQ6VhEgpGHMrfE7akfsFn7d+gtBaZnvsz6J4UHff+oPvTXSfbelGo5zfxHayP5NqpShEVymHpkO1JsYLav49VACOjqUzQYVJK3sBcVY5hJqneYYy6vcdUl8q/LQMongyMzZdtvhTJ8RA==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(366004)(396003)(346002)(39860400002)(451199015)(66476007)(36756003)(66446008)(66556008)(8676002)(38100700002)(478600001)(66946007)(110136005)(316002)(6512007)(122000001)(6506007)(6486002)(41300700001)(8936002)(2616005)(91956017)(186003)(2906002)(5660300002)(71200400001)(38070700005)(26005)(44832011)(31696002)(86362001)(76116006)(83380400001)(64756008)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?cWhCNkFUTDJmb1FqNWZsaHVBK1ZQdGd4U3VEc284THByeFpod0I4cXRjb3Zw?=
 =?utf-8?B?UUVwYXNlUVB6dzJZR2N4U2dQdm9OdUdCNk80alloRzRFNEV6ZDlGOE5ycEl4?=
 =?utf-8?B?MEkxb3U3WndWTmdFMlFuMzlqcTVZcThpMXNvRHV4NFhxYmNUVm44T1YrOGUv?=
 =?utf-8?B?Y0JtY1FPa003ZXlaRTJaa1ljRC9BUi9NLzNGdnNKb3RhelQyUnNrNVFKWTI0?=
 =?utf-8?B?a0xlT0pzTmpnY1VuczZOdlpOVUJzNy9vR0EzZkRKcGRqelp5Z0luL2VDR09Z?=
 =?utf-8?B?amxOZ0gxSUZlQ0pxSTF2NzVFVFY1K1R1OGxEY3pHekpFZ1JmdUlCVGQyS3lo?=
 =?utf-8?B?cXpiMURnUmQ4NE1YMWFrWTlobmlVNTNKakIzS3FOTm9SdE0wdThldlFsMUw3?=
 =?utf-8?B?NVNlbmF3eEZCREV2QnZuQXAwVlU5U3ZWTEkxSDUxMXpYWU54djhHUkpwUFlK?=
 =?utf-8?B?bWkrbklQbHdPNHN2d3NnZm10RVozQXNoS014aFlFWjREUGFjdFVJNTNlRjl5?=
 =?utf-8?B?VXFKSXF0cjNLaWFCMk1xS1RBUnhuWWdkdFRwV3NYdlZMdHFBZFVmQ1Nmajgz?=
 =?utf-8?B?Yk90Q0JDckw4WmZ1YmYvWVZBZzRPTGM3TUw5ZldndDB0VEhnVUZzdHk4WDJa?=
 =?utf-8?B?bll4cjBteHA4cFdZNmMxTE1zOWYydDM4YUJ3NmJTc0ZzTUxVbDEwS2tiWkNE?=
 =?utf-8?B?U1FYbDVqdW1pQUYzMDZ6V2RXT0lTcTF5VjRUbnhFaUt2a3BacEp4UmFsSEVp?=
 =?utf-8?B?SEV2N2lSK0kwcUdvYmxaNkMxQzdXM2txa0Q3K21sL1BGRDRvU0FmTXVPeFpM?=
 =?utf-8?B?K1o5MkhNaXp3akFRc09YYmpxM1grNVNGaW1WR2lTMTg3SFROa2pvWHNFWXJz?=
 =?utf-8?B?VjR5eUJ1UDN3TzN2MkhSVjdzeVZST2hmR2N5WktnTTR3Sm04Y1JJYnVvNnpC?=
 =?utf-8?B?bHpsNkVBUEF5N0Z0aHpzOTU4RmJyN0xXRjVUK2JxUjJ3ZlpTaU54RmtKaThG?=
 =?utf-8?B?WjQwQVM0ZWNhU08vdis4TDJXWlJiUkhGMVZmdlA5ZFBFMWwyZ2daTFJqN0hK?=
 =?utf-8?B?RXFQT0VLV0RucWJyMStlUkNxekRKSU1QbHBGZ3dwd2FZRVJRM1RST01QQk9G?=
 =?utf-8?B?N1NXYmtLZVFYdGVEUFVwenMzZjhYWTl5U2ZHM3haaTNUWkVaTmdRTGtETHBz?=
 =?utf-8?B?Rk9EVFJ1VGFiTXBsVGVESkJLeVd2MjE2NktvRzNEQlAxZ0VvTGp5c2R0enB3?=
 =?utf-8?B?SEZKMnhRbnJ0UzBSMUxOalZpNXJvZ08wbm53NnFEWUloaXM4cytMS2w4MmJI?=
 =?utf-8?B?Z0JIOStXdnN5enZoWENMQ1l4S3lKSTRPWDlzelJkWmRTYWV3N3lJRUF4YUxa?=
 =?utf-8?B?VDQxU3g4VnU4UG96L1RJcUl5UGNvVUxabnBkTVJlbDJkNTVOckc4TUxQWjhX?=
 =?utf-8?B?Q0dQcjhpeW5NMzVua1N5VnF6c0hDRXVBQ250OEltclZjMy9sM2I0MTVtdFB3?=
 =?utf-8?B?ZHBxWjFscDVHUy9nZGxuWm9mR1J3N3hJS1c5ZzVNTDIyUVZYTDNzQ202aFc4?=
 =?utf-8?B?WkRWN0R0MDN5YzZNelJNREJVZm85WEw1bEVPdUZLaHlNekpXcnd3VndPVFRZ?=
 =?utf-8?B?UHY1RlZOV3RNWTQ4dEFwaGJoeUp1QW5oQVo2UUlNZmpUVWdFcE1ZZnc2Vkdz?=
 =?utf-8?B?OUZiUlN6Y3pseElld0loZUx5dGlVOFFVNWYrZmxFOTBUcE1NNVVUQmowUXd3?=
 =?utf-8?B?d3NnQmFCeU1vaUNNRFFHNHNKamRlaDU0aG1rUGdRQnFrWGZvSnIycjNpa3Zz?=
 =?utf-8?B?Unh4K2E5RFZYZHl4Q3dieGZKYnVHWjhsQlRuTnZwdmhIa0VBS0k2MDNjWHQr?=
 =?utf-8?B?emFZVWRIUFM5YUdpdXpXdnJZZkVqeE1xMGxPT25WcGZ6RnpZdjhlUjVOZ3hU?=
 =?utf-8?B?SGluWGkzY29aVytmR2MxbVNJSWNDS2QzOFkxT3BiQTgwaGlGeGVFWnI4TUh2?=
 =?utf-8?B?dkdROE9mNzBnemxzQnZzU0ttSHJ3UnBZTVZTeTJIZjRtOVYrSlRMdmJ4RTFB?=
 =?utf-8?B?UzZ4Z084SHcwRDUzSmhQQmRJSlBsYUY1dm5kOVVsWCtuY1lTaStlVERmbmwz?=
 =?utf-8?B?bmR6RVVrODJuNXdMZ2pwa2pIRStkclU2SXkwUEUwMVVDak5KTTNGNEZhZTVt?=
 =?utf-8?Q?jjXvX3GQlK0SjRbP6CK27IU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <25CE0F9048CF0746B0E9B35CA53A9BA5@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2501c47b-69cd-409d-f793-08da95920835
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2022 14:12:46.1396
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PgxPOrOC7y55SFXHFfl0X4PJ+eTmwf1O5hsC+FlRV3XoXshHUP4HmL2ZBd8clbnqaHlUidW45dsDXwAOIYIOY39lRcx1eUorOej6LOe2PzI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB1525
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDEyLzA5LzIwMjIgw6AgMDM6NDcsIFJvaGFuIE1jTHVyZSBhIMOpY3JpdMKgOg0KPiBB
ZGQgdGhlIGZvbGxvd2luZyBoZWxwZXJzIGZvciBkZXRlY3Rpbmcgd2hldGhlciBhIHBhZ2UgdGFi
bGUgZW50cnkNCj4gaXMgYSBsZWFmIGFuZCBpcyBhY2Nlc3NpYmxlIHRvIHVzZXIgc3BhY2UuDQo+
IA0KPiAgICogcHRlX3VzZXJfYWNjZXNzaWJsZV9wYWdlDQo+ICAgKiBwbWRfdXNlcl9hY2Nlc3Np
YmxlX3BhZ2UNCj4gICAqIHB1ZF91c2VyX2FjY2Vzc2libGVfcGFnZQ0KPiANCj4gVGhlIGhlYXZ5
IGxpZnRpbmcgaXMgZG9uZSBieSBwdGVfdXNlciwgd2hpY2ggY2hlY2tzIHVzZXIgYWNjZXNzaWJp
bGl0eQ0KPiBvbiBhIHBlci1tbXUgbGV2ZWwsIHByb3ZpZGVkIHByaW9yIHRvIHRoaXMgY29tbWl0
Lg0KPiANCj4gT24gMzItYml0IHN5c3RlbXMsIHByb3ZpZGUgc3R1YiBpbXBsZW1lbnRhdGlvbnMg
Zm9yIHRoZXNlIG1ldGhvZHMsIHdpdGgNCj4gQlVHKCksIGFzIGRlYnVnIGZlYXR1cmVzIHN1Y2gg
YXMgcGFnZSB0YWJsZSBjaGVja3Mgd2lsbCBlbWl0IGZ1bmN0aW9ucw0KPiB0aGF0IGNhbGwgcHtt
ZCx1ZH1fdXNlcl9hY2Nlc3NpYmxlX3BhZ2UgYnV0IG11c3Qgbm90IGJlIHVzZWQuDQoNCldoeSAi
bXVzdCBub3QgYmUgdXNlZCIgPw0KDQoNCg0KPiANCj4gU2lnbmVkLW9mZi1ieTogUm9oYW4gTWNM
dXJlIDxybWNsdXJlQGxpbnV4LmlibS5jb20+DQo+IC0tLQ0KPiAgIGFyY2gvcG93ZXJwYy9pbmNs
dWRlL2FzbS9wZ3RhYmxlLmggfCAzNSArKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ICAg
MSBmaWxlIGNoYW5nZWQsIDM1IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9hcmNo
L3Bvd2VycGMvaW5jbHVkZS9hc20vcGd0YWJsZS5oIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNt
L3BndGFibGUuaA0KPiBpbmRleCA1MjIxNDViMTZhMDcuLjhjMWY1ZmViOTM2MCAxMDA2NDQNCj4g
LS0tIGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3BndGFibGUuaA0KPiArKysgYi9hcmNoL3Bv
d2VycGMvaW5jbHVkZS9hc20vcGd0YWJsZS5oDQo+IEBAIC0xNzAsNiArMTcwLDQxIEBAIHN0YXRp
YyBpbmxpbmUgaW50IHB1ZF9wZm4ocHVkX3QgcHVkKQ0KPiAgIAlyZXR1cm4gMDsNCj4gICB9DQo+
ICAgDQo+ICtzdGF0aWMgaW5saW5lIGJvb2wgcHRlX3VzZXJfYWNjZXNzaWJsZV9wYWdlKHB0ZV90
IHB0ZSkNCj4gK3sNCj4gKwlyZXR1cm4gKHB0ZV92YWwocHRlKSAmIF9QQUdFX1BSRVNFTlQpICYm
IHB0ZV91c2VyKHB0ZSk7DQoNClNob3VsZCB1c2UgcHRlX3ByZXNlbnQoKSBpbnN0ZWFkID8NCg0K
PiArfQ0KPiArDQo+ICsjaWZkZWYgQ09ORklHX1BQQzY0DQoNCkkgdGhpbmsgdGhlIGZ1bmN0aW9u
cyBjb3VsZCBiZSB2YWxpZCBmb3IgUFBDMzIgYXMgd2VsbCB3aXRoIGJlbG93IGNoYW5nZXM6DQoN
Cj4gKw0KPiArc3RhdGljIGlubGluZSBib29sIHBtZF91c2VyX2FjY2Vzc2libGVfcGFnZShwbWRf
dCBwbWQpDQo+ICt7DQo+ICsJcmV0dXJuIHBtZF9pc19sZWFmKHBtZCkgJiYgcG1kX3ByZXNlbnQo
cG1kKQ0KPiArCQkJCSYmIHB0ZV91c2VyKHBtZF9wdGUocG1kKSk7DQoNCkRlZmluZSBhbmQgdXNl
IHBtZF91c2VyKCkNCg0KPiArfQ0KPiArDQo+ICtzdGF0aWMgaW5saW5lIGJvb2wgcHVkX3VzZXJf
YWNjZXNzaWJsZV9wYWdlKHB1ZF90IHB1ZCkNCj4gK3sNCj4gKwlyZXR1cm4gcHVkX2lzX2xlYWYo
cHVkKSAmJiBwdWRfcHJlc2VudChwdWQpDQo+ICsJCQkJJiYgcHRlX3VzZXIocHVkX3B0ZShwdWQp
KTsNCg0KVXNlIHB1ZF91c2VyKCkuDQoNCkZvciBwcGM2NCB5b3UgaGF2ZSB0byBkZWZpbmUgaXQg
aW4gDQphcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYm9vazNzLzY0L3BndGFibGUuaCBhbmQgDQph
cmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vbm9oYXNoLzY0L3BndGFibGUuaA0KRm9yIHBwYzMyIGl0
IGlzIGFscmVhZHkgZGVmaW5lZCBpbiBpbmNsdWRlL2FzbS1nZW5lcmljL3BndGFibGUtbm9wbWQu
aA0KDQpBbmQgdXNlIHB1ZF9sZWFmKCkgaW5zdGVhZCBvZiBwdWRfaXNfbGVhZigpLiBGb3IgcHBj
MzIgaXQgaXMgYWxyZWFkeSANCmRlZmluZWQgaW4gaW5jbHVkZS9hc20tZ2VuZXJpYy9wZ3RhYmxl
LW5vcG1kLmgNCg0KPiArfQ0KPiArDQo+ICsjZWxzZQ0KPiArDQo+ICtzdGF0aWMgaW5saW5lIGJv
b2wgcG1kX3VzZXJfYWNjZXNzaWJsZV9wYWdlKHBtZF90IHBtZCkNCj4gK3sNCj4gKwlCVUcoKTsN
Cj4gKwlyZXR1cm4gZmFsc2U7DQo+ICt9DQo+ICsNCj4gK3N0YXRpYyBpbmxpbmUgYm9vbCBwdWRf
dXNlcl9hY2Nlc3NpYmxlX3BhZ2UocHVkX3QgcHVkKQ0KPiArew0KPiArCUJVRygpOw0KPiArCXJl
dHVybiBmYWxzZTsNCj4gK30NCj4gKw0KPiArI2VuZGlmIC8qIENPTkZJR19QUEM2NCAqLw0KPiAr
DQo+ICAgI2VuZGlmIC8qIF9fQVNTRU1CTFlfXyAqLw0KPiAgIA0KPiAgICNlbmRpZiAvKiBfQVNN
X1BPV0VSUENfUEdUQUJMRV9IICov
