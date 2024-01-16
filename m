Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC34782E995
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jan 2024 07:31:53 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=Z1bauFs2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TDfLH6YJWz3cSX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jan 2024 17:31:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=Z1bauFs2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:261d::600; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:261d::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TDfKR1jVVz2yst
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jan 2024 17:31:04 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nSdHikWVpbO2DaDWGQASLCci9sjzaDMW+MC/d490RWF1nWgbMLMtcHoK9v0nqyHfuZBM3QAnbzZKFpYp8SrEWQrkV1lKONtjXCDowetZ9YFE3G1EsTuAcI/cdVVm9lzzO9/0X8TOqoR0ECDDRd1yeqszaZkRaoXGbsfYiBpN/vfZ08P4ME3LgVzzlYGABEu9TiExWfDAY7rurlRI0PkBZlh5b7kNzAUGlHCZcNfg8k8Odcb5o8jcU/OfytOdm0vd69sH/+wDJEWMvqL8m/3HPCEDHOOBOOpaJw3Ryv2M88bmn8Ur6EcxQ7eythC2zGnZlvZt2yFi0HvDM/9DvZAVWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TUUiAyGn8DJnmZO0KeW4561P39TGLp9XvLZeNsBKWh4=;
 b=ew6/9bAecg0eVlx7GbK1/W7UWiXGrhO9pIySRx9De4i1qW4RH6APZHEhEWmvDEryuTiI+yZ+q8A5ucczE73Id+JqphzXDRNFMkTAnoBFadLJTj/uQ7RTm/MyzURLiAWSTXXfWP7ERai3foHazwDJf+72/8XnKuMkRLk9eV6iW2whXTKGvkJw8zZ7qgFYt3Q9x76eeMK5KFxCb9JaNTmqpdft+AxzgZvBUSfDk+KggxmCk9ldoVLy054ZuJXtHApT68nkhQF1W1Gq1ABW8v23b3+FqDxoE9lNNKi9RfiIp9fxC4yrL2PjD0buRjeP/2twn3RxgORD481GBlvEmZax0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TUUiAyGn8DJnmZO0KeW4561P39TGLp9XvLZeNsBKWh4=;
 b=Z1bauFs2JCBtmQQxXAZBvY6KDckRXM8tMX4qX2RkR7JBN2xu3Bz+nWkITWE8KB3a42Ju2D0uLdicMSUuEUg8Zk02bkrJXLuCCUGETvJKJ1H3pC/r7cOuKAiDza5F7JDdT4zLbuMqw9RNzPHcjFN1Ayd1y4TrdaPZsA193IJiC74d0/IhgmhLZQQX27ITeW4J8DlCK5TEA8CtFIl8Ox7C2pQh8yqJGjf7XomNgcNJO1ABNgYJi49bc6ivzcG3Uur2Pc9M6ai5/u6sX0FIGtQVi/FylqlzRv/fSKcusotpiAknxyzxFY7xYa2pM7BlgSs329qQWS7Aysrt0/lnLEvKKw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB3152.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1e7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.26; Tue, 16 Jan
 2024 06:30:39 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9f77:c0ff:cd22:ae96]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9f77:c0ff:cd22:ae96%4]) with mapi id 15.20.7181.027; Tue, 16 Jan 2024
 06:30:39 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Jason Gunthorpe <jgg@nvidia.com>, "peterx@redhat.com" <peterx@redhat.com>
Subject: Re: [PATCH v2 06/13] mm/gup: Drop folio_fast_pin_allowed() in hugepd
 processing
Thread-Topic: [PATCH v2 06/13] mm/gup: Drop folio_fast_pin_allowed() in hugepd
 processing
Thread-Index: AQHaPiV3tMHobVJx102EjxnPjrned7DbR5QAgADHKYA=
Date: Tue, 16 Jan 2024 06:30:39 +0000
Message-ID: <c60c9d88-33aa-4312-a23c-20206e503b6e@csgroup.eu>
References: <20240103091423.400294-1-peterx@redhat.com>
 <20240103091423.400294-7-peterx@redhat.com>
 <20240115183748.GR734935@nvidia.com>
In-Reply-To: <20240115183748.GR734935@nvidia.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PAZP264MB3152:EE_
x-ms-office365-filtering-correlation-id: 046cb5dd-eb2d-43f6-a42a-08dc165ca84c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  j3bl9c7VBMK2rnAyBOCt7BMnw+VuFGBCcABBuYXsZGzHJBpbNRY8NSSpRzXoYsRiUdk3epWMJAwgyxYXXuAH3REg3SK2zBG2wzSGyyU7vunaggxjZnEUPsK9UjgdIsgTORyUv7ivc03pHc5sJoSMiOQ7neb47a2z7eBYSBkZQc8zGLJ/Jq6svvrL14kF7XgpbjHMNf2H6wjBCWPOKepu3BX17iF4gdd8BnK+UIxKPp+IDPCKHoDNURCihz6dR3kgAEHdguqe6P6j4/bQtaQldgSoAyyjHZ1QgFSO4/B/pnWH0sWuCgMVf28Ae912f8adgP6hvf+L1Ni1VC7nogwzIScAAN7S/X68CU5o36UXbOMLF7x5MAdEJwMVUXfYk1ORCrrtl4Mno6VRf/sCVyUqvgLbC+bEQxvo2KKIH0yVSUY9YBaGItIj6ayR7qPA3HFDqHVZwyvObZ7UG8J5kanEOpffdGRaZ5p1W/OcNZt8pRGs8MeiKGJmFQyTtRsw7TjVHjHKMfpHfRQVEc93WiHSjwDGOpj2nSgVARsGablJtG8MjaxNRL+7gdqsByVDpW3sixKHn5eheD5t9cmqIyMBB9RFGjPCrD9tfoCG8tYid49CtUUpu5Bt/px9IktozstCuj188yGcit7Sinszxx1qIW6T1FxSoMLWHvPo7f+XEJk5zf5WlPkfr96aswaR3YyA
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(39860400002)(366004)(136003)(376002)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(31686004)(2616005)(66574015)(71200400001)(26005)(6512007)(478600001)(38100700002)(122000001)(38070700009)(86362001)(31696002)(36756003)(4326008)(2906002)(5660300002)(7416002)(41300700001)(6506007)(83380400001)(64756008)(66946007)(316002)(66556008)(66446008)(66476007)(91956017)(54906003)(76116006)(110136005)(44832011)(6486002)(8936002)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?WmJIMS9JYXQydGphNktBTEluOVZEVG8vYXdTUWM4bWZCb08waytjalM4T0d6?=
 =?utf-8?B?byt0Wi9MTExLTHdjT1kxeFE5UytwamFxQThZVUFLL24zTGxLUFNVTTMvMDZm?=
 =?utf-8?B?eGZLYlFZUmFVM21STFk1TXg4R29tZVllTGdCWGl0NytZcjFGbXZQYStRenRS?=
 =?utf-8?B?NlB5SnpNbzVBM1dMUzMwT1Z5akVFQzlWYkN1bmJtU1Z0UTh3TDBxSVprZkNE?=
 =?utf-8?B?TGo0dzZPbE0zL3I2Q0hCTEsrU0hyOW5lQ3duU3VoM0NvWVh3bHlFbzZiZTh0?=
 =?utf-8?B?eDNiWjFjQUVGVzAyN0doUkNtcnZqaWEzZkhxSXFGZjV6ZWhEOXNTc1VyZ0ZM?=
 =?utf-8?B?YWtvK1FpRDRKMVVBWUlMc2dVVEpwV0pPZUdBZXNTai9DeWErMlc3bXdPWTdH?=
 =?utf-8?B?TTlrL0UyZkNGMGc1S3hycjRVR0dTR0JPNTVIOUI5OXd4aklhRkpicCtEK0kv?=
 =?utf-8?B?TllFWnlId09zcmdNamdGcTU3bk9mMGR2Y1gyRnp0U3MvT2JXekhlaVdmTVp3?=
 =?utf-8?B?ODkyNjZPeWR0RjZZaXBKRXpyZzh2WWdyR3lmaHdyMWxoNjdrMWlOL0hIdHpm?=
 =?utf-8?B?RDg0UnE3V2ZiTmtYdjRMdWcxNXNkUXMwdUx3cGtPY1k3MkZEdWJXUE5nM2Z2?=
 =?utf-8?B?S3JYUEt3UWJTRURCTjRYejBhZDdSeUNQRDMvUG0xaVBodFZnUHdtZHZ0d1pT?=
 =?utf-8?B?aWt6VmxyQjZUamcyMG83NnpTbGFOTFQ5Vzk0cXVBbnJqNlJpVStlekd2YzRW?=
 =?utf-8?B?ekxLaW9HaW03eGNOMzhmTFV2aW9hdDVuT2pvVkRNczNpcXJwaFVZcjBsK1J0?=
 =?utf-8?B?NGxNWnptcnppZlh5aUlEWkdIRTNPTVRnNS9Ra2dkdDBzREthTk5VRDl4Ry9z?=
 =?utf-8?B?QzAwbEV6eXVsQ2E3a3ZrWXVmN3ZVWUhZVXB4MXJjMW5WZ2M0Vkx5UVpMK3Y2?=
 =?utf-8?B?N2RIZjdZSWl4aDg2QnBBTHMwOHQ1OEVtWm1kMnVWdHZGVzRhd0RIaVF0ZjNi?=
 =?utf-8?B?bm85WTkzVDJhcFRrSEJFcnROc2J5OUsySC9lQUtlRkQwck14azV2NUMyUXps?=
 =?utf-8?B?WEZDSkluMjRUMEtORHAwU3R4aEMrclVEM0c0V1BiRThJQ2RRSUZaT3NCNUNm?=
 =?utf-8?B?WDd4cWhTZmcyWGFXZTBxcUpoT055Z1ZyT2VjM3liMjZNdTQ4b3hrT3R1Z2Fx?=
 =?utf-8?B?dnhyMDcvMGl2Sm9XbTVNYlFQR20xa2xLWFJGV0VsKy85SWdHbnkyNDNjV1ZY?=
 =?utf-8?B?QmxFWjJNT0gzb1R1ZVg2OWR2L2o2bGI3ZWFSbkRXVy9hdWpOWExZdTQ3dFNB?=
 =?utf-8?B?S3NqZXdBSEdCUGUvUnNPTXFnRmwzdU9oRjdGMDJRMS8rWFNlaHdLSmlzVllV?=
 =?utf-8?B?eDlkeW1Ga3R5MEJkeGI2VkoydXk0aS9lSnFzZmJNMGhteU14NjFubmtKNHFx?=
 =?utf-8?B?ZUl0VmFxbndSdUVuREkrWm4xNHduN1lvL0VWUTNXTUpsbTV4MVByNFVnVi80?=
 =?utf-8?B?bjlkNGZhNzVuREQ5SVJvaHRBMndDanZ5V1ZnTGtKaXlKWkdBZEt2cXBERWNS?=
 =?utf-8?B?cWxUKzlwTk9sb0FYOVpXN3NJcXJDZkhmZlBFZzlSbmhWU2FOSXZNTDlnSUVa?=
 =?utf-8?B?Szc4alp2cDd0aXFhZ1N3cXZWRVhSZm9PSkFWRS9zcmR5TFVrTlZPN1hMc09s?=
 =?utf-8?B?WHFWS05RRXVmT1hocDRvSzkxdTRLSmNvbXh3eXptVXdFVEVmTlltWVIzb0FR?=
 =?utf-8?B?V3h0cEM1dnVZZXNzMkF4YzBXRGZJdHRUYm44TWFxbWlqaW5XSVI2MndKN2FO?=
 =?utf-8?B?aUVQeVBXZWg0Z0Y5UzJXMmFmQTJkRGlBVmdBN3lDdFVmejJDWmNBRGV1VVVu?=
 =?utf-8?B?T1NrZFVhL09IWGNSYkR0VWVSRlk3ZXRSdTdqejNxQXJRTTF6WlVBeUdvUzl1?=
 =?utf-8?B?MlBJZDhvczFjaDJPY0M1eWswSDlOSkJCbTVIelpKWFdYVkFlbCsxT2RNRXN0?=
 =?utf-8?B?V3BOWVBFeHppSmRCTDh4OFFNNWFaMkRvdlhLZHNWamNyWHNKTGRKMGlDM2ta?=
 =?utf-8?B?WW1GQTM3Y1FQSVNEbVVLQmxYTXVEbENiRXJJc1FLekYveXhEdFBGTnFOQmVt?=
 =?utf-8?B?WEI4YVlabEJlWi9WNTNpQ3lEMDlNRkxWMVhpK0lYaWU5TUVtT01XTTBoWFNF?=
 =?utf-8?B?clE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <50FA782F16EBD644B9759860BAD112BE@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 046cb5dd-eb2d-43f6-a42a-08dc165ca84c
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2024 06:30:39.5597
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: odKvOquEkQFBZztaDsk1lJdCa/WmXGbsokGKPXB+Ko9QbzGML8yxdld19oFPzzS+dd7WoMEJiy95VGNjnnP4yTT+/70PhpXUCBnv7SizNP8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB3152
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
Cc: James Houghton <jthoughton@google.com>, David Hildenbrand <david@redhat.com>, Yang Shi <shy828301@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Andrea Arcangeli <aarcange@redhat.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>, Vlastimil Babka <vbabka@suse.cz>, Axel Rasmussen <axelrasmussen@google.com>, Rik van Riel <riel@surriel.com>, John Hubbard <jhubbard@nvidia.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Lorenzo Stoakes <lstoakes@gmail.com>, Muchun Song <muchun.song@linux.dev>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike
 .kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE1LzAxLzIwMjQgw6AgMTk6MzcsIEphc29uIEd1bnRob3JwZSBhIMOpY3JpdMKgOg0K
PiBPbiBXZWQsIEphbiAwMywgMjAyNCBhdCAwNToxNDoxNlBNICswODAwLCBwZXRlcnhAcmVkaGF0
LmNvbSB3cm90ZToNCj4+IEZyb206IFBldGVyIFh1IDxwZXRlcnhAcmVkaGF0LmNvbT4NCj4+DQo+
PiBIdWdlcGQgZm9ybWF0IGZvciBHVVAgaXMgb25seSB1c2VkIGluIFBvd2VyUEMgd2l0aCBodWdl
dGxiZnMuICBUaGVyZSBhcmUNCj4+IHNvbWUga2VybmVsIHVzYWdlIG9mIGh1Z2VwZCAoY2FuIHJl
ZmVyIHRvIGh1Z2VwZF9wb3B1bGF0ZV9rZXJuZWwoKSBmb3INCj4+IFBQQ184WFgpLCBob3dldmVy
IHRob3NlIHBhZ2VzIGFyZSBub3QgY2FuZGlkYXRlcyBmb3IgR1VQLg0KPj4NCj4+IENvbW1pdCBh
NmU3OWRmOTJlNGEgKCJtbS9ndXA6IGRpc2FsbG93IEZPTExfTE9OR1RFUk0gR1VQLWZhc3Qgd3Jp
dGluZyB0bw0KPj4gZmlsZS1iYWNrZWQgbWFwcGluZ3MiKSBhZGRlZCBhIGNoZWNrIHRvIGZhaWwg
Z3VwLWZhc3QgaWYgdGhlcmUncyBwb3RlbnRpYWwNCj4+IHJpc2sgb2YgdmlvbGF0aW5nIEdVUCBv
dmVyIHdyaXRlYmFjayBmaWxlIHN5c3RlbXMuICBUaGF0IHNob3VsZCBuZXZlciBhcHBseQ0KPj4g
dG8gaHVnZXBkLiAgQ29uc2lkZXJpbmcgdGhhdCBodWdlcGQgaXMgYW4gb2xkIGZvcm1hdCAoYW5k
IGV2ZW4NCj4+IHNvZnR3YXJlLW9ubHkpLCB0aGVyZSdzIG5vIHBsYW4gdG8gZXh0ZW5kIGh1Z2Vw
ZCBpbnRvIG90aGVyIGZpbGUgdHlwZWQNCj4+IG1lbW9yaWVzIHRoYXQgaXMgcHJvbmUgdG8gdGhl
IHNhbWUgaXNzdWUuDQo+IA0KPiBJIGRpZG4ndCBkaWcgaW50byB0aGUgcHBjIHN0dWZmIHRvbyBk
ZWVwbHksIGJ1dCB0aGlzIGxvb2tzIHRvIG1lIGxpa2UNCj4gaXQgaXMgdGhlIHNhbWUgdGhpbmcg
YXMgQVJNJ3MgY29udGlnIGJpdHM/DQo+IA0KPiBpZSBhIGNodW5rIG9mIFBNRC9ldGMgZW50cmll
cyBhcmUgYWxsIG1hbmFnZWQgdG9nZXRoZXIgYXMgdGhvdWdoIHRoZXkNCj4gYXJlIGEgdmlydHVh
bCBsYXJnZXIgZW50cnkgYW5kIHdlIHVzZSB0aGUgaHVnZXB0ZV9hZGRyX2VuZCgpIHN0dWZmIHRv
DQo+IGl0ZXJhdGUgb3ZlciBlYWNoIHN1YiBlbnRyeS4NCg0KQXMgZmFyIGFzIEkgdW5kZXJzdGFu
ZCBBUk0ncyBjb250aWcgc3R1ZmYsIGh1Z2VwZCBvbiBwb3dlcnBjIGlzIA0Kc29tZXRoaW5nIGRp
ZmZlcmVudC4NCg0KaHVnZXBkIGlzIGEgcGFnZSBkaXJlY3RvcnkgZGVkaWNhdGVkIHRvIGh1Z2Ug
cGFnZXMsIHdoZXJlIHlvdSBoYXZlIGh1Z2UgDQpwYWdlcyBsaXN0ZWQgaW5zdGVhZCBvZiByZWd1
bGFyIHBhZ2VzLiBGb3IgaW5zdGFuY2UsIG9uIHBvd2VycGMgMzIgd2l0aCANCmVhY2ggUEdEIGVu
dHJpZXMgY292ZXJpbmcgNE1ieXRlcywgYSByZWd1bGFyIHBhZ2UgdGFibGUgaGFzIDEwMjQgUFRF
cy4gQSANCmh1Z2VwZCBmb3IgNTEyayBpcyBhIHBhZ2UgdGFibGUgd2l0aCA4IGVudHJpZXMuDQoN
CkFuZCBmb3IgOE1ieXRlcyBlbnRyaWVzLCB0aGUgaHVnZXBkIGlzIGEgcGFnZSB0YWJsZSB3aXRo
IG9ubHkgb25lIGVudHJ5LiANCkFuZCAyIGNvbnNlY3V0aXZlIFBHUyBlbnRyaWVzIHdpbGwgcG9p
bnQgdG8gdGhlIHNhbWUgaHVnZXBkIHRvIGNvdmVyIHRoZSANCmVudGlyZSA4TWJ5dGVzLg0KDQo+
IA0KPiBCdXQgV0hZIGlzIEdVUCBkb2luZyB0aGlzIG9yIGNhcmluZyBhYm91dCB0aGlzPyBHVVAg
c2hvdWxkIGhhdmUgbm8NCj4gcHJvYmxlbSBoYW5kbGluZyB0aGUgc3VwZXItc2l6ZSBlbnRyeSAo
ZWcgOE0gb24gbm9oYXNoKSBhcyBhIHNpbmdsZQ0KPiB0aGluZy4gSXQgc2VlbXMgd2Ugb25seSBs
YWNrIGFuIEFQSSB0byBnZXQgdGhpcyBvdXQgb2YgdGhlIGFyY2ggY29kZT8NCj4gDQo+IEl0IHNl
ZW1zIHRvIG1lIHdlIHNob3VsZCBzZWUgQVJNIGFuZCBQUEMgYWdyZWUgb24gd2hhdCB0aGUgQVBJ
IGlzIGZvcg0KPiB0aGlzIGFuZCB0aGVuIGdldCByaWQgb2YgaHVnZXBkIGJ5IG1ha2luZyBib3Ro
IHVzZSB0aGUgc2FtZSBwYWdlIHRhYmxlDQo+IHdhbGtlciBBUEkuIElzIHRoYXQgdG9vIGhvcGVm
dWw/DQoNCkNhbid0IHNlZSB0aGUgc2ltaWxhcml0eSBiZXR3ZWVuIEFSTSBjb250aWcgUFRFIGFu
ZCBQUEMgaHVnZSBwYWdlIA0KZGlyZWN0b3JpZXMuDQoNCj4gDQo+PiBEcm9wIHRoYXQgY2hlY2ss
IG5vdCBvbmx5IGJlY2F1c2UgaXQnbGwgbmV2ZXIgYmUgdHJ1ZSBmb3IgaHVnZXBkIHBlciBhbnkN
Cj4+IGtub3duIHBsYW4sIGJ1dCBhbHNvIGl0IHBhdmVzIHdheSBmb3IgcmV1c2luZyB0aGUgZnVu
Y3Rpb24gb3V0c2lkZQ0KPj4gZmFzdC1ndXAuDQo+IA0KPiBJIGRpZG4ndCBzZWUgYW55IG90aGVy
IGNhbGxlciBvZiB0aGlzIGZ1bmN0aW9uIGluIHRoaXMgc2VyaWVzPyBXaGVuDQo+IGRvZXMgdGhp
cyByZS11c2UgaGFwcGVuPz8NCj4gDQo+IEphc29uDQoNCg0KQ2hyaXN0b3BoZQ0K
