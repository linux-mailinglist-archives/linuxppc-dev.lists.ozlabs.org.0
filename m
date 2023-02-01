Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F77686450
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Feb 2023 11:33:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P6JD042sHz3f4n
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Feb 2023 21:33:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=OfVvZ4oy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.13.45; helo=eur01-he1-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=OfVvZ4oy;
	dkim-atps=neutral
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-he1eur01on2045.outbound.protection.outlook.com [40.107.13.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P6JC16pBsz3cFd
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Feb 2023 21:32:28 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BeXYb/Szj50c8F/Alzhjq+cMrqzrS6/q2oTUf8Yw84XO4P3ANqCYjSNrWa7gwXY7PXp+0NQl0OiGXoeTEIUUCohQiBPKTlFYILUuMpAJg9Gqz+2FmWP6DHEr0q8YWO5i/pzGU124ZzCDYLnjvZjOM/1IwN5xEPmCq1KcoKoJHxOqcHlhu67IXdrQHtxQw5Qjs2lf/zoFgt4LvPurv6240qObkv3p1gL0iBPnOeRf50DEYzNKrQ8EWD8ypYUzfWHWPxgIr9+Tn35o84r+bVkc+Dw1jhi1wlrgvVRisl7bYgQFEDeQS//ivDIfdZwpz+hzDUJ4jnOI6GPcklPCTgqTAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=85K57NbyRHDLtgSE/cHhvg/JX5WIdnt+Cn1n5RNrPo8=;
 b=kDYExCkecM1pRa2m9gwcjK925IIDCJvHxs7q8YNimnKwUMj06wKxf4axcTDi+eSUncp5DPHWWB+mPdzhFjlsqfS6oUUiQxGJeaLdWdb69PgY+d2zjo3Q0+sniSfnzsU98/vSnJgkUjkJsMnBhrD5svfy0X4c7EIjaXEvNW+y8vIJ/f+FCOJtML957Z78sUvqG+ryViuFpcO7+1Bog/Df28bN//l0TzHLz+nywrzEPH6FKpe5L7XoSZ8nzTkpchds5gRHYJBpWXI+/LpNZVyOe+dbtiirj2kh0fRXitUO502a2ee9k/xAkSh/tHjqmSED5Wu+rZgDVocHsU5gdiUvbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=85K57NbyRHDLtgSE/cHhvg/JX5WIdnt+Cn1n5RNrPo8=;
 b=OfVvZ4oyhIhAwYMgl1v7jwj5D+vjKB7LnKQjuvwIY3LWiaJ5ck+CE8Tu4HqUEGhg14wDzMvbdlXALKCimZP0YWaOfSyGeq5clVfxYyzPw8XTxyGUle/7lmDwd/ObPZqhS9iZ22Ba3J2ls2n4RzNYvzmwTNWCcPJR3Q5B3H1agzmwVnB02/9YZKaIU5gJGNgYzNdhyqeAmY1knlEKnVGJfdpnsno3oAtBliGh6DjtOwSc1E29QmCTKsIC/XXkhyoPd0LEsIG17MspUkwNsjPs1ia4DJv9eBOmrUnk76fKp8t9isPrUJvavfnGOp78vw7daCwx+MDDYNtdGl5L9cbS3A==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB1844.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Wed, 1 Feb
 2023 10:32:08 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097%5]) with mapi id 15.20.6064.024; Wed, 1 Feb 2023
 10:32:08 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Brian King <brking@linux.vnet.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 0/7] hvcs: Various hvcs device hotplug fixes
Thread-Topic: [PATCH 0/7] hvcs: Various hvcs device hotplug fixes
Thread-Index: AQHZNPyST1BfZs1xoUqyIrXMdOcz86655uUA
Date: Wed, 1 Feb 2023 10:32:08 +0000
Message-ID: <e705381b-392c-5429-96fa-2543b6f341a1@csgroup.eu>
References: <20230130224321.164843-1-brking@linux.vnet.ibm.com>
In-Reply-To: <20230130224321.164843-1-brking@linux.vnet.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB1844:EE_
x-ms-office365-filtering-correlation-id: abfddf58-e3a1-4d76-f61c-08db043f922b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  mbTRCWpf3OSCpXqICg6cJx/sEFTZrISBZrj2eRwuccIpyVpkd9FqU7XGj8MVqEpuURCEvMLJrmwyc7bOJEnc5AUuv2jhnYvcAgIksWj9SVrhRwe7yDc+Viv+oE9xjzGjNhr3Rdai/9qDYrlg42jGJ0wDpfGb46i4mUXpPJ1TF7+6eR0VaYMIcBVz9gX62iXwyQVQ+EBngxDysCjOWU+o0E/SPfvzQGL9dwPrVwwkbdDKakncIc8XNCd95g+8hCWLIKtzKhyoBq7VaE2MBCnpu0Au+Gwqk75S59wwT7K3IYVFmBQLyd6XYpTy3q0IGOg6jhplPM198ectxtW6+LQMLiI+u3rWYR+EkaUUOW/T57tTf90BZVFqrO439qXe9UvZ16sHxJDbQrP3yhaDz1csdNbzRzhSLzQoQxHwhx6oK3wefe5iLOT9pvRT43JbVwWz7c2MjZ6jM2lUqFfRe1QQHplD1ddHUMXUOqAuEislmqi/EpMxI2PMGrD8lLcEP/v31m8/1Vg+dDOENk7AswfxAmsYaL9T8gBNUG+DuewuBnVZHU7ZgZzMwA57FwK+E4Y97eEh89zhlypYhSDt2qh4hFGUOHNtpW6ZXh3VoUIemdgBaPw7fEEjUFfwg+tGqCMUOmH5fAMNJIbz8O1thCzBChxkE3AnPSisV5+BHxP6of5QudcK6yG6jg0MNeRir4HogeZe5IsITYMjwyDGX7uJTpBqKA2DCpjpiSJnYW56zbPR/otALx9XH+hKpoOWoVVKoRRqZtfwt09KNNrIrJTbPA==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(136003)(396003)(376002)(39860400002)(346002)(451199018)(31686004)(2906002)(86362001)(44832011)(38070700005)(83380400001)(8936002)(41300700001)(31696002)(6512007)(54906003)(36756003)(71200400001)(478600001)(26005)(186003)(5660300002)(6506007)(110136005)(66476007)(6486002)(2616005)(4326008)(66446008)(66946007)(64756008)(76116006)(91956017)(66556008)(122000001)(8676002)(38100700002)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?bmhPcmxoajlieTFRMlhONlpKNVRJcUhlUGNFcWRNTjRuRW5qeThHVEJHU0RL?=
 =?utf-8?B?WGluQVVqQjFrdVJwMEpqTjZrU2hWNGxNZHRTajNtOUIrKzBTZW1pKzByZExU?=
 =?utf-8?B?Mk01bW9zWWYwcWIrTXFxTmpyR1NXQlFsdmxDa3dOdVczeW5Lb1FoaUg2UXhO?=
 =?utf-8?B?MUl5cWgycWtCNGhtcDcwZFQ5a2FOWFFBTExuNURHbXBmajJWMkJVaUlHcHp6?=
 =?utf-8?B?WHR5V1U4Qi9FUkh2cFZWWWZwVUh4RkdYNVJiRzR4M1FsTVhhYkIvcHlYak5n?=
 =?utf-8?B?c1FMRzltei9zT3dkYVV0UGthRG83d2dQQTc1UnNOVTJhODd1L1pCek9YMHNj?=
 =?utf-8?B?Yk8zdXFCK2FOZkxmSVFibkNJbXZkZTlWVEF6RUdFeXVCbWZ2dXIrV2dIYnlw?=
 =?utf-8?B?MW5mWDN6YUV4YVlqNTBVcFVKdE4vTFpwcDV1d1VDbUdKbnlZMW4yZzJWSjd4?=
 =?utf-8?B?bGVvaUUrdzgzSkZGWm91Z0ZKMExUOWwzeGlHK2xOWTB0YUJyN3JoVVNSTTRq?=
 =?utf-8?B?ZmJyME93Z3h3WTluNnNHZlpsblFlcFBpMWRZK3hCdTJxb05uWElkdFVIMWJ4?=
 =?utf-8?B?R1laS0hvbjU5am11STRNSDFvc1QvSk9hbWV5QmtYTDNUV2g4TGlpdStvYnJu?=
 =?utf-8?B?MzZiTkJUY1orNjJlOXNoeGRGR0o3UEpvV0M5UEFRZHltZ3VXUTZVay9DK0JS?=
 =?utf-8?B?WUFpaHhjSWdyM1Y2TlFXcmRNUHJHcFNiWXppMEtjNm5LQm9CTTRpY1RxYjdB?=
 =?utf-8?B?Y090K3hYNXBzR1VZaFY3RUlWU0lTMDRNemhOOUZOQ1R2VDlrS1pjYzduVlgr?=
 =?utf-8?B?WXU0WDBNc2o4alphN1BYZXlqaC9IWkxwdlBtYnFXTTFhRTBLbXlmYkJiTWRs?=
 =?utf-8?B?VlNaOWNJQWFXbmdEbXhtTUFtRUdOL2g5aGMxbFF0cU5NakhCS1NtUXRSMURO?=
 =?utf-8?B?aUF3OXUxQ1gybXdJd3RYZ2QzbDFKVlBoRWJvVE5DVjlNUnVSZEY2SGJFeUNW?=
 =?utf-8?B?WURaNmc0L1MrOTBzVUdDTnJNN0swTEdZZGxrYzQ3ZytpWGR4RFlERWxLNnNR?=
 =?utf-8?B?RzZVYTNqZlF1UDNKOTdSZElXV3FKN1NnR29sY3k1aGRDUm0rUjdNSGtNVTVI?=
 =?utf-8?B?R3U1Zyt0M3VKOXN3dUt1VjQzTXNucUxpWnFKVFdFTkg2TkZ3RDdZaVpqNEEv?=
 =?utf-8?B?Ry8rdUdkT2Qwb2xCdzNta1dyNUJYbU5LMHJ1U29IZlFRcVJtUnp4a204TEcy?=
 =?utf-8?B?Qm81VGh0OVg1TWtZN05yNWJDTXBlOW50eXkyTytMTElFTjNseDRMeDFzQVJ6?=
 =?utf-8?B?aVFYLzFYOVBlMDBoMkdGVlppU1g2TEJBRTZPcWVsU1BiN0lnZzUxQ04rTEU5?=
 =?utf-8?B?VmJyQko2WWRBRUZuK2tWSCtTeDNqeDI0MVo1WkxscWk0RWZrTFB1Wll6Tko2?=
 =?utf-8?B?ZzNkWEJ2ek9Ka1BZdGZEbnc3YVprbE0zbnE5SWlWV0tYSHlNL1dzbWNvd2RF?=
 =?utf-8?B?ZnIwRVIyNXlmaThDbFlVdnhFbUI4cGZDY25rRVN3Ui9oaUZKN3g0SXNGajFY?=
 =?utf-8?B?R1hnNE5vSjh4RVNxUG0vY1Raai8zS3dkM1FZcHA1R2d4QjhyaHlhd05xU0lh?=
 =?utf-8?B?dUhMaTN0SEZiWEV2VlBCSHk0VTFqR2RzWTZuNUVHMXllRkxhR21lV2h4b1hx?=
 =?utf-8?B?SlJwaWJDeVFOUk1hbTRwNFptb1V2bjM0VzQxcFA3VFkwSGtzekhQejJQN3hs?=
 =?utf-8?B?bWh1Ky9MSVFoNDlXSmhLTEo2TlNwSGE4M1BKRGlwRlg3TUp1dE9WWGRENkI4?=
 =?utf-8?B?S2ZEVG80MkNHTFp5WHc4YUs0MjlrN1pvWXNmcE0wYVdrTXRZZURYaXZZeGtQ?=
 =?utf-8?B?Q1I2eGg5TkNSV0R2Q1hYVXlQUW05SjhYK3BXVGJEcjBwbmZua0sxN2FUalJJ?=
 =?utf-8?B?cWVGZmIvS2ljTUdDYWEwTHZMWDBwNmZaZVZXMjZGMmRwS3RPV1IvTnRaL0NL?=
 =?utf-8?B?L2dQQ0JCbUVEUXpBV0lEaFB2WlV4VnQxbU9KcUxPcEVMR2JWdkY4Z2w2dExs?=
 =?utf-8?B?Z2NUMmJQbHB0NmhON0d0T3NiSjJJSFMyMy8wZ0tQeWN5d1F6VzJma3poM0Rn?=
 =?utf-8?B?ZitMVUgyR2tvMkRCZDBVK1EvbVA3emRpTGtxeGhiNFBrVW5pNFlYMDE4WURF?=
 =?utf-8?B?aUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <44A21D8AF91A274BA70393EF613C874C@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: abfddf58-e3a1-4d76-f61c-08db043f922b
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Feb 2023 10:32:08.4393
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jJtArHYVqYx8drJTlspN9dK8yxBc/LqgBs/xc0qyHuTmYbegJ+p/6pEH3bIxn4mX8jdhWVFgrp2EMbRH86BTtx/MkVUUkuMkTGcfnUtMR5Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1844
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "mmc@linux.vnet.ibm.com" <mmc@linux.vnet.ibm.com>, "brking@pobox.com" <brking@pobox.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDMwLzAxLzIwMjMgw6AgMjM6NDMsIEJyaWFuIEtpbmcgYSDDqWNyaXTCoDoNCj4gVGhp
cyBwYXRjaCBzZXJpZXMgZml4ZXMgYSBudW1iZXIgb2YgaXNzdWVzIHdpdGggaG90cGx1Z2dpbmcN
Cj4gaHZjcyBkZXZpY2VzIGluY2x1ZGluZyBtZW1vcnkgbGVha3MgYXMgd2VsbCBhcywgdGhlIGlu
YWJpbGl0eQ0KPiB0byByZWNvbm5lY3QgdG8gYSBjb25zb2xlIGRldmljZSBhZnRlciBpdCBoYXMg
YmVlbiBob3QgYWRkZWQNCj4gYmFjaywgc2luY2UgaXQgd2FzIG5vdCBnZXR0aW5nIGNsZWFuZWQg
dXAgcHJvcGVybHkgb24gdGhlDQo+IGhvdHBsdWcgcmVtb3ZlIHBhdGguDQo+IA0KPiBCcmlhbiBL
aW5nICg3KToNCj4gICAgaHZjczogRml4IGh2Y3MgcG9ydCByZWZlcmVuY2UgY291bnRpbmcNCj4g
ICAgaHZjczogUmVtb3ZlIHN5c2ZzIGZpbGUgcHJpb3IgdG8gdmlvIHVucmVnaXN0ZXINCj4gICAg
aHZjczogUmVtb3ZlIHN5c2ZzIGdyb3VwIGVhcmxpZXINCj4gICAgaHZjczogR2V0IHJlZmVyZW5j
ZSB0byB0dHkgaW4gcmVtb3ZlDQo+ICAgIGh2Y3M6IFVzZSB2aGFuZ3VwIGluIGhvdHBsdWcgcmVt
b3ZlDQo+ICAgIGh2Y3M6IFN5bmNocm9uaXplIGhvdHBsdWcgcmVtb3ZlIHdpdGggcG9ydCBmcmVl
DQo+ICAgIHBvd2VycGM6IEZpeCBkZXZpY2Ugbm9kZSByZWZjb3VudGluZw0KPiANCj4gICBhcmNo
L3Bvd2VycGMvcGxhdGZvcm1zL3BzZXJpZXMvcmVjb25maWcuYyB8ICAxICsNCj4gICBkcml2ZXJz
L3R0eS9odmMvaHZjcy5jICAgICAgICAgICAgICAgICAgICB8IDYxICsrKysrKysrKy0tLS0tLS0t
LS0tLS0tDQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspLCAzNyBkZWxldGlv
bnMoLSkNCj4gDQoNCkFzIGZhciBhcyBJIGNhbiBzZWUsIG1vc3QgcmVjZW50IHBhdGNoZXMgaW4g
ZHJpdmVycy90dHkvaHZjLyBhcmUgdGFrZW4gDQpieSBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdr
aEBsaW51eGZvdW5kYXRpb24ub3JnPiBzbyBJJ2Qgc3VnZ2VzdCB5b3UgDQpzZW5kIHlvdSBzZXJp
ZXMgdG8gR3JlZyBhcyBoZSBtYWludGFpbnMgdGhlIHR0eSB0cmVlLg0KDQpCeSB0aGUgd2F5LCBk
b2VzIGxhc3QgcGF0Y2ggcmVxdWlyZSB0aGUgNiBwcmV2aW91cyBvbmVzIG9yIGNhbiBpdCBiZSAN
CmFwcGxpZWQgaW5kZXBlbmRlbnRseSA/DQoNCkNocmlzdG9waGUNCg==
