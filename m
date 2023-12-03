Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8700180243C
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Dec 2023 14:34:44 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=O6Uv7ayQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SjnpV0H2Bz3dJD
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Dec 2023 00:34:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=O6Uv7ayQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::615; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20615.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::615])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SjnnY2Zn6z3bTt
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Dec 2023 00:33:51 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZdEkLcU3sFkJuTHNVlmFLXujMawpUJpGSxSXCI7SZfrkKq+/HlmiLFyFnWpkBE+DL82qfv6rjDAu8z8suvn23HTS5mW3dv7WdUt183wNuiSIYr/JiG1I+w4LcQB11QMZ9431STkldFbHdMmyLhS2kdTD+cmfMePTckMvYDxXJCml217XefeyaVbkcwv8Vm0WS3/kOBXvPM8W0irJn/rbL7lEtNgKsTYrW9s3MPU5eQH9y1ozlFzZuGIpehR1gbGSLsX4ms6XB4yMfwfScHW3+h+x/Ri6mbC5B65a6Y6yHyb0xdGi80j4nsTh488Md+rFxO9U5Gn8rv4VsriEWXV77g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KvU+5TO4kt+bXBtN5OElsCV1H6CKZzh7l+ov1pDyLBE=;
 b=JipQzq5zO0YAID4YX1KlO4ql+DoU38RwhEmAA6nSoH66XEO/LudeZJhAiElfDBIAaTFfeYyJKxUGdwtdHuAbEckusUoQfh4uUUYEtmhW3bAujgM9pMOm68p8iYD7l3Rp9WNv9wYFMbV9SmnCtNzZQuiwCGtOT2B+5m2IFwWnQWsIzGRVV00JZYQ01pKRX9kWtVuBdyOVuyTE+BbzAkoCMXQSMrIlmt8l61PKe6XB3x9BMTlPHhKzCniMMp+jflF0dbPa1yGZPhDMLrQ8CNH5ffl+OQJrf2avvjhFCkDoYiKKxCcfH6N/yNrT9WRxP//UCwYvm0tweqH2q5pJd5KNtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KvU+5TO4kt+bXBtN5OElsCV1H6CKZzh7l+ov1pDyLBE=;
 b=O6Uv7ayQGAyfgRda5obnzrDXRm2LspOAFFe1jJdEHqfA3tMdjCCOjNFiXz9ctQZJTBgKG0mbzehGQrzjCpu8FIuejz4iTNMdtBfqYZT5RdPCl4qFA0r6GHLw+Y1sxuKlh3a/Ryqgie+hSzqqLliPJ5ebGToZlncKR8ib6/cbYqyI1EQeT1FMQasLZ/LNiVSb3Y6SVsKcn3omsM0VcdFRjV7sEh2jWrWz5LNdgQTc+jYdbn3oCQtKDjnMOSiobrof0YHw/q2eg7lbFAc30jnX2PbdigTQ81Rtr3VpMb29b7hZNJKZpVSIsDRNKGZWerY+0xz/jwzaHwyn/itBA7ItKw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB3435.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:14a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.21; Sun, 3 Dec
 2023 13:33:25 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5bfe:e2f2:6d89:8d97]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5bfe:e2f2:6d89:8d97%3]) with mapi id 15.20.7068.022; Sun, 3 Dec 2023
 13:33:25 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Peter Xu <peterx@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>
Subject: Re: [PATCH RFC 06/12] mm/gup: Drop folio_fast_pin_allowed() in hugepd
 processing
Thread-Topic: [PATCH RFC 06/12] mm/gup: Drop folio_fast_pin_allowed() in
 hugepd processing
Thread-Index:  AQHaGCxakejDChMrKU+uwfinjAsKCLCC5iYAgAIQ84CAAQxzAIACFO2AgAAaXYCAAB5+gIAACegAgADfT4CAAHXcgIAJyEQAgAQxj4A=
Date: Sun, 3 Dec 2023 13:33:25 +0000
Message-ID: <283da12c-14f1-4255-b3c4-ab933f3373c4@csgroup.eu>
References: <20231116012908.392077-7-peterx@redhat.com>
 <ZVsYMMJpmFV2T/Zc@infradead.org> <ZVzT5_3Zn-Y-6xth@x1n>
 <ZV21GCbG48nTLDzn@infradead.org> <ZV90JcnQ1RGud/0R@casper.infradead.org>
 <ZV-KQ0e0y9BTsHGv@x1n> <d2313c1d-1e50-49b7-bed7-840431af799a@arm.com>
 <ZV-sJsdFfXiCkylv@x1n> <510adc26-9aed-4745-8807-dba071fadbbe@arm.com>
 <ZWDKV0XNjplc_vUP@x1n> <ZWj_EgljG3NwS5r1@x1n>
In-Reply-To: <ZWj_EgljG3NwS5r1@x1n>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB3435:EE_
x-ms-office365-filtering-correlation-id: f8b67f10-de61-4196-5f65-08dbf4046d45
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  Q21IKGUDh0LLEz2ilp+P3wQVRRH3QADmM1LG8KdFFTs07dzo2weZalH+f8unmq+XedNc+h7rltNA7ShQY6eIlRxDg5FGonc+SxotM444jjqETumfwR+gkyhCh5ZDBJI1N2oLR8w8mN8/xe/w46SeCCnEzfJ2vP0TDkjgftS6W758QcxY7LZKX/OzNKbzoOT1KjvVUInQ3ECqdY91xhXImWEB7l/QglB/Wd3LLZodcNpECfz07LlWcW9vIorZ/a/7o1JNFohQHZLKKfUyNEhyrYEbFX/peHH33R29Ct/M2QQkDsomqteCn9J8bSIwjEfgSVQ0OzFxxI0PCxJ1pZLTwFj3DEgWOhEXuZ4fS4df49/JYAlgiT/b75BCc0GJnMVxoqq65iquXj1v9msXK5uSrrKumbvQ254DA1LrLjvhyetT+RgIr9Pzi1n8SVoUEjYu3be33X6XvQ/AlxREwr1ooEp/A/zN7IQntSpGh+WtKW8VR+/N21R6FpR41aVhWfRZ1jew4aC9V1+RVkLy/TeozlCDfhjlqG1fzyr+a6iwb5HkPCgxRy0VCWbL+2iTL/1HuMOE2pi0MRwiLOwnd1Swrs0eFIcbZtV0enw/vbA7V5z1f6vLrBP20dlWdStXTQZ9YlGTZsj8K6o+sawho+WrD0kFt5XhUGT4wX2e0wtZV2CJup5CicWF6v4Vq52t/7oR
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(396003)(346002)(376002)(39840400004)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(31696002)(5660300002)(44832011)(7416002)(86362001)(4326008)(8676002)(8936002)(2906002)(38070700009)(41300700001)(36756003)(2616005)(6512007)(6506007)(66574015)(83380400001)(6486002)(478600001)(26005)(71200400001)(38100700002)(31686004)(122000001)(110136005)(316002)(91956017)(54906003)(64756008)(66446008)(66476007)(66556008)(76116006)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?aDlDYlErc1YyaUVsQ1hZMjRnM3d2M1FqUG8yaGhwQllBMis3TW5yOXJCR3Vm?=
 =?utf-8?B?bXpPQVpxdGhBdlNzV0FFdlU1RnRFbjk5SWxFZVRnTW1iNnhtMWU4Y2pwaHpp?=
 =?utf-8?B?ZGJ3aGpHTXc4RVFWbTd1eGJHNS9oYU02KzRxMUJ6OEcrbDFWRHNXb0JKckNZ?=
 =?utf-8?B?eHdaMnIwMkdKek5JUy9pNUhVRGl2QTVmRnE0ekRUZmc2Mkp6TG15UHRJL01o?=
 =?utf-8?B?N2hMS1JRTDMwa3Z3YVY2dXJsVnBMSFVWRFhMRkIzZzJPQVpSS3VKZnIzbGJl?=
 =?utf-8?B?K1h0WjNScFlQOUNlRUpJZkpWallQVVhRKzhHVFYxZ0ZrR3Z1OXN2Z2tNQU4w?=
 =?utf-8?B?YmFyMGZPUytTUkpPd3l2TTdIZExjTCtGcXJVZllJR0YwTzE3YStFR2pCZTMv?=
 =?utf-8?B?WnIvOXhweDlVaTFqY01hejZOUTB3L0FvOHhqc1JlUW03NWt6OGtIL0dxRmFT?=
 =?utf-8?B?dE16Wkx4a1JCMENXbU42Rm1VY2JjNUt3ZXRRNnE1QUtKYnBhNVBRTFVmbFBX?=
 =?utf-8?B?Ty9lNy9Sc2xmQTlHdVJrbk83RzFzbVpkMTdCZE5RVUQ2UDFUd2I5ckFqNU9l?=
 =?utf-8?B?dm04TmVFNThaWm5HUE1vL09Kdk1RZzdDQUZnb3VtaGZEZGRGRi8vdFE1ZGh3?=
 =?utf-8?B?RlN6Y1Jrb0E1MnBoRzBaZmhNT2JaVE1ab3BsRG5LSTRDSGpKenpqYkozU1Qv?=
 =?utf-8?B?Qk0zbnR4cEd2eitqelNkODZkY0ZBV05QSVNycWhJTUtId0tlRmRueTFUNlgy?=
 =?utf-8?B?WTRadzJ3WjM0RHNrRDc5WWUrTExNRzROcENIWEFxYk9OOUNDdEVRY3R2WVJj?=
 =?utf-8?B?a045bXNLcTJoL2crNHFCbVc4czlTRmNLdWhUSnJTNXJhMElHU09qRXdwYTZL?=
 =?utf-8?B?OWhlbm1nWmZadndLQ1R5Sjd0WGpyZzlieUxQUUZYa2k1QTFjeU9mSDZJNDVz?=
 =?utf-8?B?ZHZhK1ZxM24xR2E5cHhyOEtOT21PbWFiWm41VUxSYjlhREpjRVFWMWhYYjV2?=
 =?utf-8?B?TlFQWXErYi9paTNKRWU0SUhkUVdiK1hUTEN0UFlOaWRHcWo4OTE5cy9SV3Zv?=
 =?utf-8?B?bUU5K05SelloTUVETFhQc3FrMll1Z0pFOWtWakFmV1lvbkZNRFBHN05lZUJP?=
 =?utf-8?B?OWpIVjFhU0xQa0pBQ1pnb3JPTWw3TlVHejRRQXhxbWE2cjBBWlZLMTg4WEkr?=
 =?utf-8?B?bDRwdStqSkMvNnNxRkxicGpWa3VTTzZJRDZTT08zVmZ0dE5kMXAwdWNMcjBR?=
 =?utf-8?B?Uk1BdGNlajVheDBiajJuMjgxTTQ5WmYvdUVpVm1YMUZ5S3IyMHVwVEpLZVM5?=
 =?utf-8?B?UGlaNkdLT3ZBTHBYK2VLSElTU3FJWmFNTUgwUjNBelVEbVRnVmFjMHJOek9L?=
 =?utf-8?B?RzV5UHI0ZTF6UFdLMGpiWUQ1ajlHa3ZPY1BrR0M0VEQ3T1VPZUx3M21MYVRt?=
 =?utf-8?B?bDV4ei84ZHJJcFB5M0pNQnYyM2orRC9TWEpXZzhXUDdkOGNhYTYzMFlBSm9E?=
 =?utf-8?B?WnJoMU1iSTFSRU1sSFFvWERqOTZ4Y1pBQTd5RXhRUmM2dGUrTGpabmtWNVV4?=
 =?utf-8?B?K1VvOTlCVVNMZmpkL05Cb3R0WWgwb3RKSHdnei9iTkl4K3lyYUt2MVN2dENJ?=
 =?utf-8?B?aEovNXNuYU1VUExGNjk4ZCtKdXFOZUZVWlZja0dscGcrV2tPS00vNkVhc2NG?=
 =?utf-8?B?MU9ncWcvU3IrTERmUTZSMkc5ckVlR2x1Z3ZLYjFESUpDU2hJK054L1h2ZS8w?=
 =?utf-8?B?UVVObmk0K1hoSDlXNm10VjVkbGVzeFlBV3JXTkJhamJJSGZldXNxQXk5eE53?=
 =?utf-8?B?UUdDUlhIVmVhcHNOSmYyOEpWY3NIMmx2WGJVU01YN3NRVGtJUHNaSVZNcmxK?=
 =?utf-8?B?TXBnUFdvV0x2M2xRUXI3eEtDczFGVGtSRmFXcFlSZkY1L3ZadkJtSlBNUEFw?=
 =?utf-8?B?N3ZKVHNmYjZEdUVxWVA3YVZyNE9nNUFzOWcySzM1S2wzdHB1MWw5Q1NWcXBS?=
 =?utf-8?B?d2pVYTd4YUFuNzBlOUUyMWlMRVI2dnVNRXF4Z0NLa0hndExJbmE1YUFkWGRl?=
 =?utf-8?B?TjVnMWtWd0ZLRlBaMUtZbTFPWktick82dTNLTXNUREdJZm1kZzAxNXp5V2Nn?=
 =?utf-8?Q?ow8oGIJdET1r54FSQU3HpTo9e?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <84871B4A2571B8439BB1D28BAF3A8F50@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f8b67f10-de61-4196-5f65-08dbf4046d45
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2023 13:33:25.3050
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r9kzlwcwU0exiuSViyFheSQdGFfSinaPsqAOJmD4FtPs0i+eiiMMRT5eDgndQP2yxP6VAeV7UxiksjeqGSD6PLUd+9UXSKGzo0Zr3HKOVnA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB3435
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, James Houghton <jthoughton@google.com>, Lorenzo Stoakes <lstoakes@gmail.com>, David Hildenbrand <david@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Yang Shi <shy828301@gmail.com>, Rik van Riel <riel@surriel.com>, Hugh Dickins <hughd@google.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, Mike Rapoport <rppt@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, "Kirill A .
 Shutemov" <kirill@shutemov.name>, Axel Rasmussen <axelrasmussen@google.com>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Vlastimil Babka <vbabka@suse.cz>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDMwLzExLzIwMjMgw6AgMjI6MzAsIFBldGVyIFh1IGEgw6ljcml0wqA6DQo+IE9uIEZy
aSwgTm92IDI0LCAyMDIzIGF0IDExOjA3OjUxQU0gLTA1MDAsIFBldGVyIFh1IHdyb3RlOg0KPj4g
T24gRnJpLCBOb3YgMjQsIDIwMjMgYXQgMDk6MDY6MDFBTSArMDAwMCwgUnlhbiBSb2JlcnRzIHdy
b3RlOg0KPj4+IEkgZG9uJ3QgaGF2ZSBhbnkgbWljcm8tYmVuY2htYXJrcyBmb3IgR1VQIHRob3Vn
aCwgaWYgdGhhdCdzIHlvdXIgcXVlc3Rpb24uIElzDQo+Pj4gdGhlcmUgYW4gZWFzeS10by11c2Ug
dGVzdCBJIGNhbiBydW4gdG8gZ2V0IHNvbWUgbnVtYmVycz8gSSdkIGJlIGhhcHB5IHRvIHRyeSBp
dCBvdXQuDQo+Pg0KPj4gVGhhbmtzIFJ5YW4uICBUaGVuIG5vdGhpbmcgaXMgbmVlZGVkIHRvIGJl
IHRlc3RlZCBpZiBndXAgaXMgbm90IHlldCB0b3VjaGVkDQo+PiBmcm9tIHlvdXIgc2lkZSwgYWZh
aWN0LiAgSSdsbCBzZWUgd2hldGhlciBJIGNhbiBwcm92aWRlIHNvbWUgcm91Z2ggbnVtYmVycw0K
Pj4gaW5zdGVhZCBpbiB0aGUgbmV4dCBwb3N0IChJJ2xsIHByb2JhYmx5IG9ubHkgYmUgYWJsZSB0
byB0ZXN0IGl0IGluIGEgVk0sDQo+PiB0aG91Z2gsIGJ1dCBob3BlZnVsbHkgdGhhdCBzaG91bGQg
c3RpbGwgcmVmbGVjdCBtb3N0bHkgdGhlIHRydXRoKS4NCj4gDQo+IEFuIHVwZGF0ZTogSSBmaW5p
c2hlZCBhIHJvdW5kIG9mIDY0SyBjb250X3B0ZSB0ZXN0LCBpbiB0aGUgc2xvdyBndXAgbWljcm8N
Cj4gYmVuY2htYXJrIEkgc2VlIH4xNSUgcGVyZiBkZWdyYWRlIHdpdGggdGhpcyBwYXRjaHNldCBh
cHBsaWVkIG9uIGEgVk0gb24gdG9wDQo+IG9mIEFwcGxlIE0xLg0KPiANCj4gRnJhbmtseSB0aGF0
J3MgZXZlbiBsZXNzIHRoYW4gSSBleHBlY3RlZCwgY29uc2lkZXJpbmcgbm90IG9ubHkgaG93IHNs
b3cgZ3VwDQo+IFRIUCB1c2VkIHRvIGJlLCBidXQgYWxzbyBvbiB0aGUgZmFjdCB0aGF0IHRoYXQn
cyBhIHRpZ2h0IGxvb3Agb3ZlciBzbG93DQo+IGd1cCwgd2hpY2ggaW4gbm9ybWFsIGNhc2VzIHNo
b3VsZG4ndCBoYXBwZW46ICJwcmVzZW50IiBwdGVzIG5vcm1hbGx5IGdvZXMNCj4gdG8gZmFzdC1n
dXAsIHdoaWxlICFwcmVzZW50IGdvZXMgaW50byBhIGZhdWx0IGZvbGxvd2luZyBpdC4gIEkgYXNz
dW1lDQo+IHRoYXQncyB3aHkgbm9ib2R5IGNhcmVkIHNsb3cgZ3VwIGZvciBUSFAgYmVmb3JlLiAg
SSB0aGluayBhZGRpbmcgY29udF9wdGUNCj4gc3VwcG9ydCBzaG91bGRuJ3QgYmUgdmVyeSBoYXJk
LCBidXQgdGhhdCB3aWxsIGluY2x1ZGUgbWFraW5nIGNvbnRfcHRlIGlkZWENCj4gZ2xvYmFsIGp1
c3QgZm9yIGFybTY0IGFuZCByaXNjdiBTdm5hcG90Lg0KDQpJcyB0aGVyZSBhbnkgZG9jdW1lbnRh
dGlvbiBvbiB3aGF0IGNvbnRfcHRlIGlzID8gSSBoYXZlIGFsd2F5cyB3b25kZXJlZCANCmlmIGl0
IGNvdWxkIGFsc28gZml0IHBvd2VycGMgOHh4IG5lZWQgPw0KDQpPbiBwb3dlcnBjLCBmb3IgMTZr
IHBhZ2VzLCB3ZSBoYXZlIHRvIGRlZmluZSA0IGNvbnNlY3V0aXZlIFBURXMuIEFsbCA0IA0KUFRF
IGFyZSBmbGFnZ2VkIHdpdGggdGhlIFNQUyBiaXQgdGVsbGluZyBpdCdzIGEgMTZrIHBhZ2VzLCBi
dXQgZm9yIFRMQiANCm1pc3NlcyB0aGUgSFcgbmVlZHMgb25lIGVudHJpZSBmb3IgZWFjaCA0ayBm
cmFnbWVudC4NCg0KVGhlcmUgaXMgYWxzbyBhIHNpbWlsYXIgYXBwcm9hY2ggZm9yIDUxMmsgcGFn
ZXMsIHdlIGhhdmUgMTI4IGNvbnRpZ3VvdXMgDQppZGVudGljYWwgUFRFcyBmb3IgdGhlbS4NCg0K
QW5kIHdoYXRldmVyIFBBR0VfU0laRSBpcyAoZWl0aGVyIDRrIG9yIDE2ayksIHRoZSBIVyBuZWVk
cyBvbmUgJ3Vuc2lnbmVkIA0KbG9uZycgcHRlIGZvciBlYWNoIDRrIGZyYWdtZW50LiBTbyBhdCB0
aGUgdGltZSBiZWluZyB3aGVuIHdlIGRlZmluZSANClBBR0VfU0laRSBhcyAxNmssIHdlIG5lZWQg
YSBzcGVjaWFsIHB0ZV90IHdoaWNoIGlzIGEgdGFibGUgb2YgNHggDQp1bnNpZ25lZCBsb25nLg0K
DQpXb25kZXJpbmcgaWYgdGhlIGNvbnRfcHRlIGNvbmNlcHQgaXMgc2ltaWxhciBhbmQgd2hldGhl
ciBpdCBjb3VsZCBoZWxwLg0KDQpUaGFua3MNCkNocmlzdG9waGUNCg==
