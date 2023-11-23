Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E1F7F6621
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Nov 2023 19:23:51 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=WdM1U2nQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sbmhj3V5lz3vcy
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Nov 2023 05:23:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=WdM1U2nQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::60d; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on2060d.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::60d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sbmgm3RFBz3dDx
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Nov 2023 05:22:58 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LF6LNNCv81abGDn6Wd+pB1gVSL+F2f3emNfDe6GOjzjDzMSNSd2F1kXkpaKocYHkybnLc7x1HtEAGs5rqEufhAG30j7h5YN9Up7mYfVbtqM+oLOmx8bmz3lXE/EWLNKwk5QNDfX6+2IDsXZImDdQnLYSrz8lJdvHfjVkvyVmwW5idw8EFwukhMovCoywgHiIZnekLUkGx7hdoPqA9xuRvfGHuszbe/zCK9il2NQEpHW8yJ2Op9vSgUEw0S5YM4uUDRh366S/qws1FjhTUjcGz/QvpsHvulfont+kfcmrswjNW2Ib8xG5bCKTzbOWuqfYcqi0p4+Z2pZ8hKdnQK1szQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nhsDcEHNp5JO/S7l29qCQNJ+pARtzKs29q2SaZQKKgY=;
 b=Wro+nfxLilInOf2FnYR819MJLHyqswJMvFM3UzvDV657sdwqW8b6wnMKz3hsOT0Rvd82Ll+PCWCd94IV+B6l9lhIVvdW1G1mqIFvgu8DbUECqv6CyN7tGYasGMD56upzDFW/LJ61VKUFoXiBL65A/++aBDmrbP7mGaDHeiXyEJseDNjvBUCtZ2/tCR7Uf5qkO3YaMjiTSRABVsp7PmyxQVh97Iwp9V1KvEQj1QmrL5eZjHg4LPdPpG/RgbjjDaPXdSlG6gLz/zS9yfY2YY2Ume6rdXt1lLzXcBoqFnnzyC00wBcg89jciSCYdNgv01rub8sq2z8Bai+q0JO2LkYYaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nhsDcEHNp5JO/S7l29qCQNJ+pARtzKs29q2SaZQKKgY=;
 b=WdM1U2nQ5Ksk2SxqFoBsvbkSGGoxKCYdJHf2MwfGQANizyxdbCiEDT2DkrHylUFottOVN6LYEdt631htHlTUyindIGZMTyfS7iSm3CKen8vzZ8UEJLPvwlqjRUB5Z+tWEBv6jMrWaaJMWFknAc35ykIRMvbqN2xd7ip8R2h/SHL9n0240fOYfFATaciMX6iKpwQ+2x7SaPfLPmV+MlRYTLopvvwKrVOAmA/iq8Xongsb9sNi4QMETAzaXI4/auukscqnL5+FzaV97Nd6DMXSQzx27aBMAFP5nu/QXDBSCahrZaW31xYcILVwMuTM23z7Izb4I1Pvd/FJmxucJ8mr3A==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB2192.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:193::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.13; Thu, 23 Nov
 2023 18:22:33 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5bfe:e2f2:6d89:8d97]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5bfe:e2f2:6d89:8d97%3]) with mapi id 15.20.7046.012; Thu, 23 Nov 2023
 18:22:33 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Peter Xu <peterx@redhat.com>, Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH RFC 06/12] mm/gup: Drop folio_fast_pin_allowed() in hugepd
 processing
Thread-Topic: [PATCH RFC 06/12] mm/gup: Drop folio_fast_pin_allowed() in
 hugepd processing
Thread-Index: AQHaGCxakejDChMrKU+uwfinjAsKCLCC5iYAgAIQ84CAAQxzAIAAe2+AgAHEuYA=
Date: Thu, 23 Nov 2023 18:22:33 +0000
Message-ID: <57be0ed0-f1d7-4583-9a5f-3ed7deb0ea97@csgroup.eu>
References: <20231116012908.392077-1-peterx@redhat.com>
 <20231116012908.392077-7-peterx@redhat.com> <ZVsYMMJpmFV2T/Zc@infradead.org>
 <ZVzT5_3Zn-Y-6xth@x1n> <ZV21GCbG48nTLDzn@infradead.org>
 <ZV4co7wcI-_wK91F@x1n>
In-Reply-To: <ZV4co7wcI-_wK91F@x1n>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR1P264MB2192:EE_
x-ms-office365-filtering-correlation-id: a8fcf598-f333-445a-1b09-08dbec5129ab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  gZyes1l3hi2GNJJnOdtD588lF6F4sCX+VuSLgtgqtC8Q5MNhbRNqQbbBAaK/ztUDBjI+u4zNAV60sdYqENUZk3ItfIYCzQyjb6DKSYmnhTsUqAfu78P6hpHwspsXWga9zUEXoB3vAjM3m1zO5wzAy9fAj5m9F4aV8sWtTt2v6GwIeLqpjrxQh1Ec1tnvrNNzNnEytw03huXrm5OYqV72ibAG9eug8+7eZjupEiRZ1bTm9dWKZnuz4/JS+Db+RaibxMtuucA/bZEidNZTlzwybbcpSeHH9um2h2W/+hpVYJ6bRoYJJA2ewwltga17289XnG/54S2dZR7oPHCkJlqAo4Bg4P30gUQvnQBvBflMVCszIAKe5wC+CTlhqQC81YqUv44fox99esKBMOrempwRmqL3f19U1WgoFll77wfFauqihQVAs6Pua3xoNSl1f4Nqt2lbOQwncUw4bhjlgUgVgI01hlI3HStiqp8aFjWvwjeRmC4D1eIbz5ZW8e0WUnhagGOXBYf4hP20WaVEOhhG5U479/FWRVMaMXlkdd7gfxI/uTbapRrZ9u7qB+SgMJOM4PShOLv9kVfd/h4O2eALNk4eYJNwSxSs4RiedgNE/vTv2osOq7QuFPPhcOQyd1LAqDESPlwxtqEqNmPiZgURQBgorL78xURI/7LGBnhLrSkOSZDuSw0k3ImD7OdJODbK
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(39860400002)(346002)(366004)(136003)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(6512007)(2616005)(71200400001)(66574015)(6506007)(83380400001)(478600001)(7416002)(5660300002)(2906002)(44832011)(110136005)(41300700001)(76116006)(91956017)(6486002)(8936002)(8676002)(64756008)(54906003)(66946007)(4326008)(66446008)(66476007)(66556008)(316002)(31696002)(122000001)(38100700002)(38070700009)(36756003)(86362001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?L3VDRFhjamRHRXpmN3VnZFlGYmZSdGxrMWZvWjJXZi9mSUE5RkxFZ1pUY3lX?=
 =?utf-8?B?NnFwNDErTnVVWUxoU0VjNEFlbnp5VER3ejF0NUJTVTlvTlQreTEwU3loUmNo?=
 =?utf-8?B?MG14SHJqZ3BlVHlKR0hpK0RNTGRCbUJuMWg1alo0Q2trMmZSbUZwNzhjRURv?=
 =?utf-8?B?WEIxL2VvM1kzMVZ5bjBneGdOd0haaHc3UlJRcFg2S3V2S29nVExJZHB3SXBK?=
 =?utf-8?B?NlhSY3pjOUdkVEZXcnZWajgvandRTkZ6VldMbHVqY01NVUttVkUvQ1lYZjln?=
 =?utf-8?B?TmZOY1I4Y0tSalJDUTVVOCtaZnNxc1IvdjkrRmd4TjczaTlQTkExUzVQRW5s?=
 =?utf-8?B?WkhGZGUwUVBwbWJUdTNjUG9MZGh6SDVkZzZvS0ltQUJzMlQvU2c0Wi93UUwx?=
 =?utf-8?B?YlYxMHI0UUlSVXpPeVFBeG9mcnp2NUpyalF1ei9ZL1BLMlpCcVU3NUhueTFi?=
 =?utf-8?B?TEpMR1drM3Z5aWQ4eWk3NWJNQzMza0lZUk5EOE5tWnBqRWZ2RUJ1cnBPTHZN?=
 =?utf-8?B?OHVJeUFHU0czdUJ2ZzMvUVVuMW8rd2VVa1FuOUtlS1p3Q2k5WmgrWnZqN2Y1?=
 =?utf-8?B?b3ZmcnhwSWdsQVJSZGljdjNORndKdnFaYXphaU9Gb1VJSlVoK0RsOGZrcVk4?=
 =?utf-8?B?MGI1ZytQWHp3TzdTU2JmdCtsQ3pzZlRNQXhzTkhJOEhtL0ZIUkI4bHNqODMz?=
 =?utf-8?B?dlN1NE9jVGFiSUUyNkoybGJWTUlWcUg5S1lJdnRlUXFPQ3BmZ0pxekhBV2gx?=
 =?utf-8?B?Qnp0dldWeFBORVpnVGltTnltMEU5WFpHZFVlK3RLV1JHM0tFcjRDRkRERXE2?=
 =?utf-8?B?WVJSbGtMaCs3OGtUenR6MC9aZmd5Q2t2RTh2bndTSlZsNEFNMVpmSDFkQVVR?=
 =?utf-8?B?Um5ZZnlNYW94dXRQcktzb1dnNzdtS2V6a3N1T0ZCaUxER09UckdIZk5EL3ZU?=
 =?utf-8?B?MnA2VmJOUFJoUkhxSm9pVG50Qll2NTc3a3VJWExSaERhWmc4U1FTMFdTUHA0?=
 =?utf-8?B?YTdzZ041RGRpRm1kRTdRWWN1SkNVMGRvbVk3dGxrWjZoekxyblZRbG1WSjhB?=
 =?utf-8?B?SzA4ZzZBNUN3Ui9CZThubXZId3RFUW9pVTJBRS9LQ2l1MXNsc3ZSb1hPZTlG?=
 =?utf-8?B?TTZmYnc1ZGVTaEFoMllrNU1JbWRXYzgvRkJqaGZuZlFoWWRmYWkrOU4yYUdh?=
 =?utf-8?B?VHlHa2NhSGxtYXp0cEZ2RTdFWGxGbHZSRk5uUjRJemY5WlpvZDNHTVhpWncw?=
 =?utf-8?B?cWVRdktuQmNtcUk2bStUNnVnWnA2Ni84WkNnWERkaVJmN0xkSUFzU3VPUUx5?=
 =?utf-8?B?UTY4cjY0MWx1YjFZdm5BM2tsQlBzTGs5dkhDTnY2TXpiRElrWmtWUU54Vm5D?=
 =?utf-8?B?bSthYVVyQW5jSjkydDBHTytKT2Q0T29OemF1eEJoVVoySTZPWTRuclpOSCsr?=
 =?utf-8?B?K0pMZkhJVjRyd0RpZVZ2MXJmeGF6eVFadERZV3Z3ckI4NWY2WUVaQ3V4cU5N?=
 =?utf-8?B?UTFOUHBpc0wxMXVFWG03bjRkdnRKOWpBcVA5MWtEZWpSSHRCZGJVL2JKYWVv?=
 =?utf-8?B?N0laTlczSUV2akZ5d1ZoV2RRMVZTdGRoSUNCaGdLamlTVm8vZEpoSTdsYjZJ?=
 =?utf-8?B?Ui9FSm0yRU9ybnNFZENadmFXc2xjRUFEN3prRlNacStuZnBRTUR2V0JEZ1FB?=
 =?utf-8?B?UTk4Z0t3dUNZMklYWVo4YnhDRnJFVHVqdndsZjl6Yzd4ekJQK1hIV1IwZ2Ny?=
 =?utf-8?B?WGNDRFRTR2p3bXVGNDJ0RkFKVjFhdWMrNWxSSzVQbXNUODlPMHBOYngwZWt5?=
 =?utf-8?B?YnBOOU0xNVRDdWd4RzYraUZVb2cycUxOZHZJdFpYTjFIUWUvZGo5NXUxQmtT?=
 =?utf-8?B?dWhzNnYyVXAxNDJqTkVrc0hMV0FBTUtIQy9OTEFpSHI5TnlUU0hzMXA1VjNX?=
 =?utf-8?B?U1UrNW5mZnIxQnJudUVuU3pUNXJpazdTQXVRbFJaSm0wMitIUk05SWIySDJS?=
 =?utf-8?B?RGJtTW1ibjVmQjBaNlltdGdrRGZMVy9qOEpEYWNBS0JRS2RHMENBVnBPVFR4?=
 =?utf-8?B?eHhDaUU5TGZUc0paRUhPbkdjUDB6RU5FNXlzMTF4WlBCUU5WUit3R2hxRUdI?=
 =?utf-8?B?a1NHU1BYS0QwcGpNZWIwMDZVRnlmMTc5c2JMV0RDYWFncFVLYlljbUszeStM?=
 =?utf-8?B?am9ETlRqV2R5azdUdENlL0ozSzR6SGFoSm9FWU54eXhiMTZJdjdCRzhxUEo1?=
 =?utf-8?B?ZVdxRGI3VFNuelQyUFRNTWVBUE5nPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1FB45C6A7D146242955841A8E73218D8@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a8fcf598-f333-445a-1b09-08dbec5129ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2023 18:22:33.8619
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7BnEB2XfPLWQRj0B8/7MmDe4aEeLyXXgWcn38gn94frp8TmC0pStd0MDdfqIkvN2ZbW2lkt4hEKlOM+YtRtnJFhccuNRwcJJ09Zo7ig94wI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB2192
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, James Houghton <jthoughton@google.com>, Lorenzo Stoakes <lstoakes@gmail.com>, David Hildenbrand <david@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Yang Shi <shy828301@gmail.com>, Rik van Riel <riel@surriel.com>, Hugh Dickins <hughd@google.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Matthew Wilcox <willy@infradead.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, Mike Rapoport <rppt@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, "Kirill A .
 Shutemov" <kirill@shutemov.name>, Axel Rasmussen <axelrasmussen@google.com>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Vlastimil Babka <vbabka@suse.cz>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDIyLzExLzIwMjMgw6AgMTY6MjIsIFBldGVyIFh1IGEgw6ljcml0wqA6DQo+IE9uIFdl
ZCwgTm92IDIyLCAyMDIzIGF0IDEyOjAwOjI0QU0gLTA4MDAsIENocmlzdG9waCBIZWxsd2lnIHdy
b3RlOg0KPj4gT24gVHVlLCBOb3YgMjEsIDIwMjMgYXQgMTA6NTk6MzVBTSAtMDUwMCwgUGV0ZXIg
WHUgd3JvdGU6DQo+Pj4+IFdoYXQgcHJldmVudHMgdXMgZnJvbSBldmVyIHVzaW5nIGh1Z2VwZCB3
aXRoIGZpbGUgbWFwcGluZ3M/ICBJIHRoaW5rDQo+Pj4+IGl0IHdvdWxkIG5hdHVyYWxseSBmaXQg
aW4gd2l0aCBob3cgbGFyZ2UgZm9saW9zIGZvciB0aGUgcGFnZWNhY2hlIHdvcmsuDQo+Pj4+DQo+
Pj4+IFNvIGtlZXBpbmcgdGhpcyBjaGVjayBhbmQgZ2VuZXJhbGl6aW5nIGl0IHNlZW1zIGxpa2Ug
dGhlIGJldHRlciBpZGVhIHRvDQo+Pj4+IG1lLg0KPj4+DQo+Pj4gQnV0IHRoZW4gaXQgbWVhbnMg
d2UncmUgc3RpbGwga2VlcGluZyB0aGF0IGRlYWQgY29kZSBmb3IgZmFzdC1ndXAgZXZlbiBpZg0K
Pj4+IHdlIGtub3cgdGhhdCBmYWN0Li4gIE9yIGRvIHdlIGhhdmUgYSBwbGFuIHRvIGFkZCB0aGF0
IHN1cHBvcnQgdmVyeSBzb29uLCBzbw0KPj4+IHRoaXMgY29kZSB3aWxsIGJlIGRlc3RpbmVkIHRv
IGFkZCBiYWNrPw0KPj4NCj4+IFRoZSBxdWVzdGlvbiB3YXNuJ3QgbWVhbiByZXRvcmljYWwgLSB3
ZSBzdXBwb3J0IGFyYml0cmFyeSBwb3dlciBvZiB0d28NCj4+IHNpemVkIGZvbGlvcyBmb3IgdGhl
IHBhZ2VwYWdlLCB3aGF0IHByZXZlbnRzIHVzIGZyb20gdXNpbmcgaHVnZXBkIHdpdGgNCj4+IHRo
ZW0gcmlnaHQgbm93Pw0KPiANCj4gQWgsIGRpZG4ndCBjYXRjaCB0aGF0IHBvaW50IHByZXZpb3Vz
bHkuICBIdWdlcGQgaXMganVzdCBub3QgdXNlZCBvdXRzaWRlDQo+IGh1Z2V0bGIgcmlnaHQgbm93
LCBhZmFpdS4NCj4gDQo+IEZvciBleGFtcGxlLCBfX2h1Z2VwdGVfYWxsb2MoKSAoYW5kIHRoYXQn
cyB0aGUgb25seSBvbmUgY2FsbHMNCj4gaHVnZXBkX3BvcHVsYXRlKCkpIHNob3VsZCBiZSB0aGUg
ZnVuY3Rpb24gdG8gYWxsb2NhdGUgYSBodWdlcGQgKHBwYyBvbmx5KSwNCj4gYW5kIGl0J3Mgb25s
eSBjYWxsZWQgaW4gaHVnZV9wdGVfYWxsb2MoKSwgd2hpY2ggaXMgcGFydCBvZiB0aGUgY3VycmVu
dA0KPiBhcmNoLXNwZWNpZmljIGh1Z2V0bGIgYXBpLg0KPiANCj4gQW5kIGdlbmVyaWMgbW0gcGF0
aHMgZG9uJ3Qgbm9ybWFsbHkgaGF2ZSBodWdlcGQgaGFuZGxpbmcsIGFmYWljcy4gIEZvcg0KPiBl
eGFtcGxlLCBwYWdlX3ZtYV9tYXBwZWRfd2FsaygpIGRvZXNuJ3QgaGFuZGxlIGh1Z2VwZCBhdCBh
bGwgdW5sZXNzIGluDQo+IGh1Z2V0bGIgc3BlY2lmaWMgcGF0aC4NCj4gDQo+IFRoZXJlJ3JlIGFj
dHVhbGx5IChvbmx5KSB0d28gZ2VuZXJpYyBtbSBwYXRocyB0aGF0IGNhbiBoYW5kbGUgaHVnZXBk
LA0KPiBuYW1lbHk6DQo+IA0KPiAgICAtIGZhc3QtZ3VwDQo+ICAgIC0gd2Fsa19wYWdlXyooKSBh
cGlzIChha2EsIF9fd2Fsa19wYWdlX3JhbmdlKCkpDQo+IA0KPiBGb3IgZmFzdC1ndXAgSSB0aGlu
ayB0aGUgaHVnZXBkIGNvZGUgaXMgaW4gdXNlLCBob3dldmVyIGZvciB3YWxrX3BhZ2VfKg0KPiBh
cGlzIGh1Z2VwZCBjb2RlIHNob3VsZG4ndCBiZSByZWFjaGVkIGlpdWMgYXMgd2UgaGF2ZSB0aGUg
aHVnZXRsYiBzcGVjaWZpYw0KPiBoYW5kbGluZyAod2Fsa19odWdldGxiX3JhbmdlKCkpLCBzbyBh
bnl0aGluZyB3aXRoaW4gd2Fsa19wZ2RfcmFuZ2UoKSB0byBoaXQNCj4gYSBodWdlcGQgY2FuIGJl
IGRlYWQgY29kZSB0byBtZSAoYnV0IG5vdGUgdGhhdCB0aGlzICJkZWFkIGNvZGUiIGlzIGdvb2QN
Cj4gc3R1ZmYgdG8gbWUsIGlmIG9uZSB3b3VsZCBsaWtlIHRvIG1lcmdlIGh1Z2V0bGIgaW5zdGVh
ZCBpbnRvIGdlbmVyaWMgbW0pLg0KDQpOb3Qgc3VyZSB3aGF0IHlvdSBtZWFuIGhlcmUuIFdoYXQg
ZG8geW91IG1lYW4gYnkgImRlYWQgY29kZSIgPw0KQSBodWdlcGFnZSBkaXJlY3RvcnkgY2FuIGJl
IHBsdWdnZWQgYXQgYW55IHBhZ2UgbGV2ZWwsIGZyb20gUEdEIHRvIFBNRC4NClNvIHRoZSBmb2xs
b3dpbmcgYml0IGluIHdhbGtfcGdkX3JhbmdlKCkgaXMgdmFsaWQgYW5kIG5vdCBkZWFkOg0KDQoJ
CWlmIChpc19odWdlcGQoX19odWdlcGQocGdkX3ZhbCgqcGdkKSkpKQ0KCQkJZXJyID0gd2Fsa19o
dWdlcGRfcmFuZ2UoKGh1Z2VwZF90ICopcGdkLCBhZGRyLCBuZXh0LCB3YWxrLCBQR0RJUl9TSElG
VCk7DQoNCg0KPiANCj4gVGhpcyBzZXJpZXMgdHJpZXMgdG8gYWRkIHNsb3cgZ3VwIGludG8gdGhh
dCBsaXN0IHRvbywgc28gdGhlIDNyZCBvbmUgdG8NCj4gc3VwcG9ydCBpdC4gIEkgcGxhbiB0byBs
b29rIG1vcmUgaW50byB0aGlzIGFyZWEgKGUuZy4sIF9fd2Fsa19wYWdlX3JhbmdlKCkNCj4gY2Fu
IGJlIGFub3RoZXIgZ29vZCBjYW5kaWRhdGUgc29vbikuICBJJ20gbm90IHN1cmUgd2hldGhlciB3
ZSBzaG91bGQgdGVhY2gNCj4gdGhlIHdob2xlIG1tIHRvIHVuZGVyc3RhbmQgaHVnZXBkIHlldCwg
YnV0IHNsb3cgZ3VwIGFuZCBfX3dhbGtfcGFnZV9yYW5nZSgpDQo+IGRvZXMgbG9vayBsaWtlIGdv
b2QgY2FuZGlkYXRlcyB0byBhbHJlYWR5IHJlbW92ZSB0aGUgaHVnZXRsYiBzcGVjaWZpYyBjb2Rl
DQo+IHBhdGhzIC0gc2xvdy1ndXAgaGFzIGF2ZXJhZ2UgfmFkZC9+ZGVsIExPQ3MgKHdoaWNoIHRo
aXMgc2VyaWVzIGRvZXMpLCBhbmQNCj4gX193YWxrX3BhZ2VfcmFuZ2UoKSBjYW4gcmVtb3ZlIHNv
bWUgY29kZSBsb2dpY2FsbHksIG5vIGhhcm0gSSB5ZXQgc2VlLg0KPiANCj4gSW5kZWVkIGFib3Zl
IGFyZSBiYXNlZCBvbiBvbmx5IG15IGNvZGUgb2JzZXJ2YXRpb25zLCBzbyBJJ2xsIGJlIG1vcmUg
dGhhbg0KPiBoYXBweSB0byBiZSBjb3JyZWN0ZWQgb3RoZXJ3aXNlLCBhcyBlYXJseSBhcyBwb3Nz
aWJsZS4NCj4gDQo+Pg0KPj4+IFRoZSBvdGhlciBvcHRpb24gaXMgSSBjYW4gYWx3YXlzIGFkZCBh
IGNvbW1lbnQgYWJvdmUgZ3VwX2h1Z2VfcGQoKQ0KPj4+IGV4cGxhaW5pbmcgdGhpcyBzcGVjaWFs
IGJpdCwgc28gdGhhdCB3aGVuIHNvbWVvbmUgaXMgYWRkaW5nIGh1Z2VwZCBzdXBwb3J0DQo+Pj4g
dG8gZmlsZSBsYXJnZSBmb2xpb3Mgd2UnbGwgaG9wZWZ1bGx5IG5vdCBmb3JnZXQgaXQ/ICBCdXQg
dGhlbiB0aGF0DQo+Pj4gZ2VuZXJhbGl6YXRpb24gd29yayB3aWxsIG9ubHkgaGFwcGVuIHdoZW4g
dGhlIGNvZGUgd2lsbCBiZSBuZWVkZWQuDQo+Pg0KPj4gSWYgZHJvcHBpbmcgdGhlIGNoZWNrIGlz
IHRoZSByaWdodCB0aGluZyBmb3Igbm93IChhbmQgSSB0aGluayB0aGUgcHBjDQo+PiBtYWludGFp
bmVycyBhbmQgd2lsbHkgYXMgdGhlIGxhcmdlIGZvbGlvIGd1eSBtaWdodCBoYXZlIGEgbW9yZSB1
c2VmdWwNCj4+IG9waW5pb25zIHRoYW4gSSBkbyksIGxlYXZpbmcgYSBjb21tZW50IGluIHdvdWxk
IGJlIHZlcnkgdXNlZnVsLg0KPiANCj4gV2lsbHkgaXMgaW4gdGhlIGxvb3AsIGFuZCBJIGp1c3Qg
bm90aWNlIEkgZGlkbid0IHJlYWxseSBjb3B5IHBwYyBsaXN0LCBldmVuDQo+IEkgcGxhbm5lZCB0
by4uICBJIGFtIGFkZGluZyB0aGUgbGlzdCAobGludXhwcGMtZGV2QGxpc3RzLm96bGFicy5vcmcp
IGludG8NCj4gdGhpcyByZXBseS4gIEknbGwgcmVtZW1iZXIgdG8gZG8gc28gYXMgbG9uZyBhcyB0
aGVyZSdzIGEgbmV3IHZlcnNpb24uDQo+IA0KPiBUaGUgb3RoZXIgcmVhc29uIEkgZmVlbCBsaWtl
IGh1Z2VwZCBtYXkgb3IgbWF5IG5vdCBiZSBmdXJ0aGVyIGRldmVsb3BlZCBmb3INCj4gbmV3IGZl
YXR1cmVzIGxpa2UgbGFyZ2UgZm9saW8gaXMgdGhhdCBJIHNhdyBQb3dlcjkgc3RhcnRlZCB0byBz
aGlmdCB0bw0KPiByYWRpeCBwZ3RhYmxlcywgYW5kIGFmYWljcyBodWdlcGQgaXMgb25seSBzdXBw
b3J0ZWQgaW4gaGFzaCB0YWJsZXMNCj4gKGh1Z2VwZF9vaygpKS4gIEJ1dCBhZ2FpbiwgSSBjb25m
ZXNzIEkga25vdyBub3RoaW5nIGFib3V0IFBvd2VyIGF0IGFsbC4NCj4gDQo+IFRoYW5rcywNCj4g
DQo=
