Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC85F616F9C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Nov 2022 22:23:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N2fyf4lkMz3cd4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 08:23:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=vmware.com header.i=@vmware.com header.a=rsa-sha256 header.s=selector2 header.b=QuxoyN7s;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=vmware.com (client-ip=2a01:111:f403:c100::1; helo=na01-obe.outbound.protection.outlook.com; envelope-from=namit@vmware.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=vmware.com header.i=@vmware.com header.a=rsa-sha256 header.s=selector2 header.b=QuxoyN7s;
	dkim-atps=neutral
Received: from na01-obe.outbound.protection.outlook.com (mail-eastusazlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c100::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N2fxj0XHZz2xJ7
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Nov 2022 08:23:03 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JuSB97l3qtNg5gakte4QRlIFZj8sDMy7NesP4xq0n/Q5Op9+l+ymjTCigNLX4WUc0LYnZ7aFyhTgNQBDR7TaAT7V4vd/4tNPHsMPFNJhmIROIbeW4ezPlt+uaskizvQb01IzvkhobVbYtI3ZWmucThU5d4GazPNnSO7Ft0jCHN9nqGT3KbbQCnKcwfoOcFVLxhhHcKvUA4U81wWnQegx7FNZOV3dFVsREbvFE1O8IjUw7LwqBuOz7zD9MqpjC4bsXfDcDEEnEFbIiSX7w19mmu1bKihpkOZ1PYm1D+VdHdadC57bqHfHJ/8N9D4pKVtlotFnYZUGQcvGeC+OqPU79w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rvqR+V15Er3m6xZDzLTsnxpmEpNRnDfpiEkCgVlzfS8=;
 b=bPlozud9ZRuKNynlZJ4m9cz/4CXmhpccEWeuOomJ8X0uQNnhGmJQtm1F1ZtkUqz47fyz6hkW5JDI5cGhSveK3Oz1+w/aK5HY5O+2JQdVrRxsZs8OYia8DpCuOI1UD1GUx+mCyqr+mf3knusXcXQB/Wxc9l5pp225pTM8tShd8EGHaVPoMQJSiJ/EXTCx60Rn5eHe1THIH7yq4JN9QEJcFzFgznZzYMBsmY1341Z0N/nz/ry9q70ljwAveUdX9fHetuxnnzSVXos9kJboaIYGM8kzeZcZRyONS7Q+b/1pQyc8ofEYBvyTSBRCXAewdhE5+JWlb0fPFsrfzjdl32eiVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rvqR+V15Er3m6xZDzLTsnxpmEpNRnDfpiEkCgVlzfS8=;
 b=QuxoyN7sJj0vaJrFUPnJoxaB0igybg9tOl6wLU6y91rgrDIW0a/u+qdV1U2V0VW/Czv4E1qD/0ahYOuq4v3P9i7aHQTVaUL5/eOABy/x+UFDOqXOMnDWEs+TOjWxBcAw2EQpvr82HNdp9nYIvmg8FW3ggdJAnd3kRhLmX77VyYI=
Received: from BY3PR05MB8531.namprd05.prod.outlook.com (2603:10b6:a03:3ce::6)
 by BYAPR05MB4136.namprd05.prod.outlook.com (2603:10b6:a02:85::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.9; Wed, 2 Nov
 2022 21:22:39 +0000
Received: from BY3PR05MB8531.namprd05.prod.outlook.com
 ([fe80::c63c:ae6e:bea3:a6a]) by BY3PR05MB8531.namprd05.prod.outlook.com
 ([fe80::c63c:ae6e:bea3:a6a%9]) with mapi id 15.20.5791.022; Wed, 2 Nov 2022
 21:22:39 +0000
From: Nadav Amit <namit@vmware.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 4/6] mm/autonuma: use can_change_(pte|pmd)_writable()
 to replace savedwrite
Thread-Topic: [PATCH v1 4/6] mm/autonuma: use can_change_(pte|pmd)_writable()
 to replace savedwrite
Thread-Index: AQHY7u8Sv+gogUcM20q85NwsuXdT7a4sJJqA
Date: Wed, 2 Nov 2022 21:22:39 +0000
Message-ID: <F3022E28-3BB5-40F5-B33A-9BDBD69ACC78@vmware.com>
References: <20221102191209.289237-1-david@redhat.com>
 <20221102191209.289237-5-david@redhat.com>
In-Reply-To: <20221102191209.289237-5-david@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY3PR05MB8531:EE_|BYAPR05MB4136:EE_
x-ms-office365-filtering-correlation-id: c6e8c6ba-747c-42b3-5fb3-08dabd185f06
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  PciBXGqcN0uakuLNhiM2NjI+llXoAnzBa6Z6FkApg1kS/1mxNBlnJ6HwNE8fsr6Q7jpokv6PeqgBbflLb+ZxH+ef6dih+449ofh8gkwOEyoWYv+LjLKsioOZMuMnwMHN+GcIm5e4HI8xZdMW9s3HPTdSERHnZhYZIq0S0QLJM0Aafl6BS9fkksmjwZoEovW/7+TEzzDzFC9KdL5CZVfUbfRiez0AbsPWibuxTQBnGK+1UVLUYWc9of45A+P/GyI+buCdtDt6HLxmDsvFzn70zWw+X79MA4Lz6JIFaVVDs0bZktCzAZ4rkQyLNT8kOZKQn1huRmatAXhFkD1JMGDhY68WpGM6eCxbqfEzkdLRFZDFqtUWsPyzaqNu+y45etSEY3M6iFLQytkdSLLDaBzEV0knKaP/lehbx0qocwNOZeE1y9C0epjxgXoDQnC+uKtL+F9ETnyUZvDTJNAvW3/LX8ssQDyCfLvCi7TWgR+E7vHgEOzAhPbddnm86NxTzuU2iihmaF06pedrr+fKQiV8aiPfQNuuRg8EapCpVf2wwXC7q7yI9NwHGOL6iQsM288akZ0nkUlt91JCrGYGVJr/djJNRQNh3Mz7lDDUqsGoRwQnp9T0pUfQS0tlnBL9VDEphmdWa5WMcO/aesJOdzXamTVvFzCaWlVZH9WRLGYouQMXzYwppk/Rn0+y2GN09wPV4Nd7iGmPfKWQ5NisByjBclnfS8jYWOm9ClsrsOmG5nKJ/bz2ViP5WkgHomIqKseKwr2o48QXTDuQ/KZs3YTxFg1IhFLH3YSQwuJtwUqt9wI=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY3PR05MB8531.namprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(346002)(39860400002)(366004)(136003)(451199015)(122000001)(33656002)(66946007)(38070700005)(478600001)(7416002)(38100700002)(86362001)(2906002)(5660300002)(186003)(6512007)(8676002)(316002)(66446008)(6506007)(64756008)(2616005)(66476007)(66556008)(41300700001)(54906003)(6486002)(71200400001)(53546011)(6916009)(76116006)(83380400001)(4326008)(8936002)(26005)(36756003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?TzhQNTZXT240cVBtYTBpS1lxQkVPQnJLckZ6a0tjeDJ1SVhrM0J6L1h2eE82?=
 =?utf-8?B?YWJHeVJZckVCZkdvNzN1UGtxQ01na093OUxESEhKaWdidnBBZ1RkZ3hlRHVy?=
 =?utf-8?B?U0ZKSG1nWTA1aEdOK2lXWlljSnpDQW1GS1hpOE9LRy9TblptMmlWdDNmbEJn?=
 =?utf-8?B?YzdBeVhzTWY2d2REczl0OWoxM3UwUG5ScTkzaWhzNXMzbUl2YTFBM1ByL2ND?=
 =?utf-8?B?OHNLMlRjUnZaZTZHaVhrYUR4MFRQQ1hzNXRYQ1ljS2cvNTBTNWE5TUorUTEv?=
 =?utf-8?B?TWNBbVFGWkpDQXNFanhLZ0tHYXJqRlVBSzBVODEwbVVGU25PeHNtaWFReGVD?=
 =?utf-8?B?OGJTblJtVTJic3RqMzE2OGpOM1JjUmREMzJ2NG9uRHJ5RXpYb3FWcEhyQWtF?=
 =?utf-8?B?N2tPTXJIQVBUTzBKR1hDZm1VVWpRc2F0SlVkUkhRL0pRd21HcHd1UTJmRVNo?=
 =?utf-8?B?cC9WUnBaekh3QUFmblpid1hvR1VvWU92cEFzZU9ubDd1RFJONU9mN0FLWVdM?=
 =?utf-8?B?QXpiZVlLazRJWVU5dVYxSHZFaWF0YTY4cEh5ek5PeU1aSlI1RFRSN2ZnTEl0?=
 =?utf-8?B?TUs4Y0ZMa05hUzY4T2xSVFBzWkd5ZUw2TGJ4OWQ0ZC8rMXNmNm5Jbnc4ZFZK?=
 =?utf-8?B?T2NSSCtJaEdFOUlLc1dWSEp3ME1DRVN0QzRPZkVDL2x4blNyS1M1Ujl6UzVH?=
 =?utf-8?B?MTR2M3IzNHFpL3hvUDFuL3MwS05lNFhYNFE3OEp5MUIzd20xS1VjL1V0YmxJ?=
 =?utf-8?B?MHR3SENQRnk5Y1NDWFQzMXZjWGhuSDFSaDBmdENSSTEzTDRobWFZOFZoUERX?=
 =?utf-8?B?V3pySW5QeDc5K1cxZHNqckRndmp2UWx6SkdpNzgrT1hMTUZvNHpEd0oyTEp2?=
 =?utf-8?B?c3EyaEliWWs4aWJpU3BwQXhjcHFwYTh5b1hrWjNlRmNIUUFwZXVVNDNmS3Y0?=
 =?utf-8?B?S0g4TFpHVFBmMHpHckJkYTlhZzJvL1l1N0pNV1lyemFaenVOa21OdkxnYXdn?=
 =?utf-8?B?NWpzenZWdFZGZHh3b25TMFNtV2ErVHErbzVzckxOUTlIeEVQZWFPb0lhLzJQ?=
 =?utf-8?B?UDZ4QjFhc0hCMVBXWFo3QXhpTkU4Um9GREs1ZlZmZDgzRzhTeEM2TnBHbFhZ?=
 =?utf-8?B?ZnBnem96L0RWRUFOZFlQUG1wblhpZXVkRjJ1MG1uQ1BGdXhHNnFHdm8zc3JN?=
 =?utf-8?B?c2VqeFVUaGYza1hsV1ltbWk5aHR2b3p4ZVJoTHNoV3U0TFhPdHM0NERMZDhR?=
 =?utf-8?B?SnI0bS9kMVlDNG5LblBkakh3YWNRbXU4RlRwb2Z2amtwWjA1ZXJxZEtndk1h?=
 =?utf-8?B?YWMzU1d5RnZ5Q1Z1ald2dkVjRmhoNmxpNGdMS0hFcUFjTW5VaG84R01WS2pM?=
 =?utf-8?B?dXQrbkVqcktwdWdnbHBhUnVOeHoya3RObG41TlJjZjlEZ0N1aUpWL3orbHZI?=
 =?utf-8?B?dFZXWUpVeE96RjFwNThCYUtVakNjeW5Rd2tsYnBHUFBOTmF3TG9rT2cxWUxl?=
 =?utf-8?B?TVU5dFViYzNpRU5xVm4yOHljeVdnS0JaanN1TkFQZ3F0TFJwQmQvbHplVFVk?=
 =?utf-8?B?ak1qWXQ3S1c0cTAvODJqc1dLTms3MDJLWldTN1RUaWRqT0kxK0tmTytJOUtX?=
 =?utf-8?B?UVN1UUNtVXQvNVZYbW5KUHdUMFM0eVRQWnpxUGlPbUVkNHpOYkF5WDF6TzEz?=
 =?utf-8?B?TFJzcEduM3VnaGRMM1ZxNm5NL0dPayszR3VxRlVHNU9yTjZFM0lWQVZlRFlH?=
 =?utf-8?B?Y2Fnajh1Z2JmWWFrV1prbVI3azR5aWtTTEhpUVQvbWJZYTEyV1huU0lUVEdy?=
 =?utf-8?B?ZUlFV0dIdXBGQnlKZjNmMHp0UDB1dW9jcXk2YVdjZXJhOTBFR3JuUHhaWXlY?=
 =?utf-8?B?TG1tdDNOOHVnR2UvNkhLcGEwNi9oN01WOTlLb3I3QmJBVkVxWC9WcVI3ZHFI?=
 =?utf-8?B?MUtaNUttWkVlcFFLMnJEN05tenB4ZnlvZnVrbk5pemJWNHF1bFNQWE13K2tz?=
 =?utf-8?B?NlQ4S2k0U2tXYXhiNGlGVVhrak1YbHd2Y2k3aXMyVWVWekVJTnZWUW1MTnJz?=
 =?utf-8?B?c21ndm0vM1JBTjcrTUlpK2JMMjdXNEZ0V0dMNVJYNGQ2ZGlrdVpWT045a2tN?=
 =?utf-8?Q?dazQU/mF3R8a1jP5AGpEVt+qe?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4C96AB2CF24B0C44A4CF3CAE794D2215@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY3PR05MB8531.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6e8c6ba-747c-42b3-5fb3-08dabd185f06
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2022 21:22:39.7308
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pHnC4ZdCjarJdQUhS/nohzXV4vpnXbPzbakNH2/cSHtw/N/T+crAd62G/Pwk2segEjJrbL5Crpj64pXx1drq7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR05MB4136
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, Mel Gorman <mgorman@techsingularity.net>, Anshuman Khandual <anshuman.khandual@arm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Dave Chinner <david@fromorbit.com>, kernel list <linux-kernel@vger.kernel.org>, Peter Xu <peterx@redhat.com>, Linux-MM <linux-mm@kvack.org>, Hugh Dickins <hughd@google.com>, Nicholas Piggin <npiggin@gmail.com>, Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gTm92IDIsIDIwMjIsIGF0IDEyOjEyIFBNLCBEYXZpZCBIaWxkZW5icmFuZCA8ZGF2aWRAcmVk
aGF0LmNvbT4gd3JvdGU6DQoNCj4gISEgRXh0ZXJuYWwgRW1haWwNCj4gDQo+IGNvbW1pdCBiMTkx
ZjliMTA2ZWEgKCJtbTogbnVtYTogcHJlc2VydmUgUFRFIHdyaXRlIHBlcm1pc3Npb25zIGFjcm9z
cyBhDQo+IE5VTUEgaGludGluZyBmYXVsdCIpIGFkZGVkIHJlbWVtYmVyaW5nIHdyaXRlIHBlcm1p
c3Npb25zIHVzaW5nIG9yZGluYXJ5DQo+IHB0ZV93cml0ZSgpIGZvciBQUk9UX05PTkUgbWFwcGVk
IHBhZ2VzIHRvIGF2b2lkIHdyaXRlIGZhdWx0cyB3aGVuDQo+IHJlbWFwcGluZyB0aGUgcGFnZSAh
UFJPVF9OT05FIG9uIE5VTUEgaGludGluZyBmYXVsdHMuDQo+IA0KDQpbIHNuaXAgXQ0KDQpIZXJl
4oCZcyBhIHZlcnkgc2hhbGxvdyByZXZpZXdlZCB3aXRoIHNvbWUgbWlub3IgcG9pbnRzLi4uDQoN
Cj4gLS0tDQo+IGluY2x1ZGUvbGludXgvbW0uaCB8ICAyICsrDQo+IG1tL2h1Z2VfbWVtb3J5LmMg
ICB8IDI4ICsrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0NCj4gbW0va3NtLmMgICAgICAgICAg
IHwgIDkgKysrKy0tLS0tDQo+IG1tL21lbW9yeS5jICAgICAgICB8IDE5ICsrKysrKysrKysrKysr
KystLS0NCj4gbW0vbXByb3RlY3QuYyAgICAgIHwgIDcgKystLS0tLQ0KPiA1IGZpbGVzIGNoYW5n
ZWQsIDQxIGluc2VydGlvbnMoKyksIDI0IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBh
L2luY2x1ZGUvbGludXgvbW0uaCBiL2luY2x1ZGUvbGludXgvbW0uaA0KPiBpbmRleCAyNWZmOWEx
NGE3NzcuLmEwZGVlZWNlNWU4NyAxMDA2NDQNCj4gLS0tIGEvaW5jbHVkZS9saW51eC9tbS5oDQo+
ICsrKyBiL2luY2x1ZGUvbGludXgvbW0uaA0KPiBAQCAtMTk3NSw2ICsxOTc1LDggQEAgZXh0ZXJu
IHVuc2lnbmVkIGxvbmcgbW92ZV9wYWdlX3RhYmxlcyhzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZt
YSwNCj4gI2RlZmluZSAgTU1fQ1BfVUZGRF9XUF9BTEwgICAgICAgICAgICAgICAgIChNTV9DUF9V
RkZEX1dQIHwgXA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
TU1fQ1BfVUZGRF9XUF9SRVNPTFZFKQ0KPiANCj4gK2Jvb2wgY2FuX2NoYW5nZV9wdGVfd3JpdGFi
bGUoc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsIHVuc2lnbmVkIGxvbmcgYWRkciwNCj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBwdGVfdCBwdGUpOw0KDQpJdCBtaWdodCBub3QgYmUg
Y3VzdG9tYXJ5LCBidXQgaG93IGFib3V0IG1hcmtpbmcgaXQgYXMgX19wdXJlPw0KDQo+IGV4dGVy
biB1bnNpZ25lZCBsb25nIGNoYW5nZV9wcm90ZWN0aW9uKHN0cnVjdCBtbXVfZ2F0aGVyICp0bGIs
DQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2
bWEsIHVuc2lnbmVkIGxvbmcgc3RhcnQsDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
dW5zaWduZWQgbG9uZyBlbmQsIHBncHJvdF90IG5ld3Byb3QsDQo+IGRpZmYgLS1naXQgYS9tbS9o
dWdlX21lbW9yeS5jIGIvbW0vaHVnZV9tZW1vcnkuYw0KPiBpbmRleCAyYWQ2OGU5MTg5NmEuLjQ1
YWJkMjdkNzVhMCAxMDA2NDQNCj4gLS0tIGEvbW0vaHVnZV9tZW1vcnkuYw0KPiArKysgYi9tbS9o
dWdlX21lbW9yeS5jDQo+IEBAIC0xNDYyLDggKzE0NjIsNyBAQCB2bV9mYXVsdF90IGRvX2h1Z2Vf
cG1kX251bWFfcGFnZShzdHJ1Y3Qgdm1fZmF1bHQgKnZtZikNCj4gICAgICAgIHVuc2lnbmVkIGxv
bmcgaGFkZHIgPSB2bWYtPmFkZHJlc3MgJiBIUEFHRV9QTURfTUFTSzsNCj4gICAgICAgIGludCBw
YWdlX25pZCA9IE5VTUFfTk9fTk9ERTsNCj4gICAgICAgIGludCB0YXJnZXRfbmlkLCBsYXN0X2Nw
dXBpZCA9ICgtMSAmIExBU1RfQ1BVUElEX01BU0spOw0KPiAtICAgICAgIGJvb2wgbWlncmF0ZWQg
PSBmYWxzZTsNCj4gLSAgICAgICBib29sIHdhc193cml0YWJsZSA9IHBtZF9zYXZlZHdyaXRlKG9s
ZHBtZCk7DQo+ICsgICAgICAgYm9vbCB0cnlfY2hhbmdlX3dyaXRhYmxlLCBtaWdyYXRlZCA9IGZh
bHNlOw0KPiAgICAgICAgaW50IGZsYWdzID0gMDsNCj4gDQo+ICAgICAgICB2bWYtPnB0bCA9IHBt
ZF9sb2NrKHZtYS0+dm1fbW0sIHZtZi0+cG1kKTsNCj4gQEAgLTE0NzIsMTMgKzE0NzEsMjIgQEAg
dm1fZmF1bHRfdCBkb19odWdlX3BtZF9udW1hX3BhZ2Uoc3RydWN0IHZtX2ZhdWx0ICp2bWYpDQo+
ICAgICAgICAgICAgICAgIGdvdG8gb3V0Ow0KPiAgICAgICAgfQ0KPiANCj4gKyAgICAgICAvKiBT
ZWUgbXByb3RlY3RfZml4dXAoKS4gKi8NCj4gKyAgICAgICBpZiAodm1hLT52bV9mbGFncyAmIFZN
X1NIQVJFRCkNCj4gKyAgICAgICAgICAgICAgIHRyeV9jaGFuZ2Vfd3JpdGFibGUgPSB2bWFfd2Fu
dHNfd3JpdGVub3RpZnkodm1hLCB2bWEtPnZtX3BhZ2VfcHJvdCk7DQo+ICsgICAgICAgZWxzZQ0K
PiArICAgICAgICAgICAgICAgdHJ5X2NoYW5nZV93cml0YWJsZSA9ICEhKHZtYS0+dm1fZmxhZ3Mg
JiBWTV9XUklURSk7DQoNCkRvIHlvdSBmaW5kIGl0IGJldHRlciB0byBjb3B5IHRoZSBjb2RlIGlu
c3RlYWQgb2YgZXh0cmFjdGluZyBpdCB0byBhDQpzZXBhcmF0ZSBmdW5jdGlvbj8NCg0KPiArDQo+
ICAgICAgICBwbWQgPSBwbWRfbW9kaWZ5KG9sZHBtZCwgdm1hLT52bV9wYWdlX3Byb3QpOw0KPiAg
ICAgICAgcGFnZSA9IHZtX25vcm1hbF9wYWdlX3BtZCh2bWEsIGhhZGRyLCBwbWQpOw0KPiAgICAg
ICAgaWYgKCFwYWdlKQ0KPiAgICAgICAgICAgICAgICBnb3RvIG91dF9tYXA7DQo+IA0KPiAgICAg
ICAgLyogU2VlIHNpbWlsYXIgY29tbWVudCBpbiBkb19udW1hX3BhZ2UgZm9yIGV4cGxhbmF0aW9u
ICovDQo+IC0gICAgICAgaWYgKCF3YXNfd3JpdGFibGUpDQo+ICsgICAgICAgaWYgKHRyeV9jaGFu
Z2Vfd3JpdGFibGUgJiYgIXBtZF93cml0ZShwbWQpICYmDQo+ICsgICAgICAgICAgICBjYW5fY2hh
bmdlX3BtZF93cml0YWJsZSh2bWEsIHZtZi0+YWRkcmVzcywgcG1kKSkNCj4gKyAgICAgICAgICAg
ICAgIHBtZCA9IHBtZF9ta3dyaXRlKHBtZCk7DQo+ICsgICAgICAgaWYgKCFwbWRfd3JpdGUocG1k
KSkNCj4gICAgICAgICAgICAgICAgZmxhZ3MgfD0gVE5GX05PX0dST1VQOw0KPiANCj4gICAgICAg
IHBhZ2VfbmlkID0gcGFnZV90b19uaWQocGFnZSk7DQo+IEBAIC0xNTIzLDggKzE1MzEsMTIgQEAg
dm1fZmF1bHRfdCBkb19odWdlX3BtZF9udW1hX3BhZ2Uoc3RydWN0IHZtX2ZhdWx0ICp2bWYpDQo+
ICAgICAgICAvKiBSZXN0b3JlIHRoZSBQTUQgKi8NCj4gICAgICAgIHBtZCA9IHBtZF9tb2RpZnko
b2xkcG1kLCB2bWEtPnZtX3BhZ2VfcHJvdCk7DQo+ICAgICAgICBwbWQgPSBwbWRfbWt5b3VuZyhw
bWQpOw0KPiAtICAgICAgIGlmICh3YXNfd3JpdGFibGUpDQo+ICsNCj4gKyAgICAgICAvKiBTaW1p
bGFyIHRvIG1wcm90ZWN0KCkgcHJvdGVjdGlvbiB1cGRhdGVzLCBhdm9pZCB3cml0ZSBmYXVsdHMu
ICovDQo+ICsgICAgICAgaWYgKHRyeV9jaGFuZ2Vfd3JpdGFibGUgJiYgIXBtZF93cml0ZShwbWQp
ICYmDQo+ICsgICAgICAgICAgICBjYW5fY2hhbmdlX3BtZF93cml0YWJsZSh2bWEsIHZtZi0+YWRk
cmVzcywgcG1kKSkNCg0KV2h5IGRvIEkgaGF2ZSBhIGRlamEtdnU/IDopDQoNClRoZXJlIG11c3Qg
YmUgYSB3YXkgdG8gYXZvaWQgdGhlIHJlZHVuZGFudCBjb2RlIGFuZCBzcGVjaWZpY2FsbHkgdGhl
IGNhbGwgdG8NCmNhbl9jaGFuZ2VfcG1kX3dyaXRhYmxlKCksIG5vPw0KDQo+ICAgICAgICAgICAg
ICAgIHBtZCA9IHBtZF9ta3dyaXRlKHBtZCk7DQo+ICsNCj4gICAgICAgIHNldF9wbWRfYXQodm1h
LT52bV9tbSwgaGFkZHIsIHZtZi0+cG1kLCBwbWQpOw0KPiAgICAgICAgdXBkYXRlX21tdV9jYWNo
ZV9wbWQodm1hLCB2bWYtPmFkZHJlc3MsIHZtZi0+cG1kKTsNCj4gICAgICAgIHNwaW5fdW5sb2Nr
KHZtZi0+cHRsKTsNCj4gQEAgLTE3NjQsMTEgKzE3NzYsMTAgQEAgaW50IGNoYW5nZV9odWdlX3Bt
ZChzdHJ1Y3QgbW11X2dhdGhlciAqdGxiLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwNCj4g
ICAgICAgIHN0cnVjdCBtbV9zdHJ1Y3QgKm1tID0gdm1hLT52bV9tbTsNCj4gICAgICAgIHNwaW5s
b2NrX3QgKnB0bDsNCj4gICAgICAgIHBtZF90IG9sZHBtZCwgZW50cnk7DQo+IC0gICAgICAgYm9v
bCBwcmVzZXJ2ZV93cml0ZTsNCj4gLSAgICAgICBpbnQgcmV0Ow0KPiAgICAgICAgYm9vbCBwcm90
X251bWEgPSBjcF9mbGFncyAmIE1NX0NQX1BST1RfTlVNQTsNCj4gICAgICAgIGJvb2wgdWZmZF93
cCA9IGNwX2ZsYWdzICYgTU1fQ1BfVUZGRF9XUDsNCj4gICAgICAgIGJvb2wgdWZmZF93cF9yZXNv
bHZlID0gY3BfZmxhZ3MgJiBNTV9DUF9VRkZEX1dQX1JFU09MVkU7DQo+ICsgICAgICAgaW50IHJl
dCA9IDE7DQo+IA0KPiAgICAgICAgdGxiX2NoYW5nZV9wYWdlX3NpemUodGxiLCBIUEFHRV9QTURf
U0laRSk7DQo+IA0KPiBAQCAtMTc3OSw5ICsxNzkwLDYgQEAgaW50IGNoYW5nZV9odWdlX3BtZChz
dHJ1Y3QgbW11X2dhdGhlciAqdGxiLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwNCj4gICAg
ICAgIGlmICghcHRsKQ0KPiAgICAgICAgICAgICAgICByZXR1cm4gMDsNCj4gDQo+IC0gICAgICAg
cHJlc2VydmVfd3JpdGUgPSBwcm90X251bWEgJiYgcG1kX3dyaXRlKCpwbWQpOw0KPiAtICAgICAg
IHJldCA9IDE7DQo+IC0NCj4gI2lmZGVmIENPTkZJR19BUkNIX0VOQUJMRV9USFBfTUlHUkFUSU9O
DQo+ICAgICAgICBpZiAoaXNfc3dhcF9wbWQoKnBtZCkpIHsNCj4gICAgICAgICAgICAgICAgc3dw
X2VudHJ5X3QgZW50cnkgPSBwbWRfdG9fc3dwX2VudHJ5KCpwbWQpOw0KPiBAQCAtMTg2MSw4ICsx
ODY5LDYgQEAgaW50IGNoYW5nZV9odWdlX3BtZChzdHJ1Y3QgbW11X2dhdGhlciAqdGxiLCBzdHJ1
Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwNCj4gICAgICAgIG9sZHBtZCA9IHBtZHBfaW52YWxpZGF0
ZV9hZCh2bWEsIGFkZHIsIHBtZCk7DQo+IA0KPiAgICAgICAgZW50cnkgPSBwbWRfbW9kaWZ5KG9s
ZHBtZCwgbmV3cHJvdCk7DQo+IC0gICAgICAgaWYgKHByZXNlcnZlX3dyaXRlKQ0KPiAtICAgICAg
ICAgICAgICAgZW50cnkgPSBwbWRfbWtfc2F2ZWR3cml0ZShlbnRyeSk7DQo+ICAgICAgICBpZiAo
dWZmZF93cCkgew0KPiAgICAgICAgICAgICAgICBlbnRyeSA9IHBtZF93cnByb3RlY3QoZW50cnkp
Ow0KPiAgICAgICAgICAgICAgICBlbnRyeSA9IHBtZF9ta3VmZmRfd3AoZW50cnkpOw0KPiBkaWZm
IC0tZ2l0IGEvbW0va3NtLmMgYi9tbS9rc20uYw0KPiBpbmRleCBkYzE1YzRhMmE2ZmYuLmRkMDI3
ODBjMzg3ZiAxMDA2NDQNCj4gLS0tIGEvbW0va3NtLmMNCj4gKysrIGIvbW0va3NtLmMNCj4gQEAg
LTEwNjksNyArMTA2OSw2IEBAIHN0YXRpYyBpbnQgd3JpdGVfcHJvdGVjdF9wYWdlKHN0cnVjdCB2
bV9hcmVhX3N0cnVjdCAqdm1hLCBzdHJ1Y3QgcGFnZSAqcGFnZSwNCj4gDQo+ICAgICAgICBhbm9u
X2V4Y2x1c2l2ZSA9IFBhZ2VBbm9uRXhjbHVzaXZlKHBhZ2UpOw0KPiAgICAgICAgaWYgKHB0ZV93
cml0ZSgqcHZtdy5wdGUpIHx8IHB0ZV9kaXJ0eSgqcHZtdy5wdGUpIHx8DQo+IC0gICAgICAgICAg
IChwdGVfcHJvdG5vbmUoKnB2bXcucHRlKSAmJiBwdGVfc2F2ZWR3cml0ZSgqcHZtdy5wdGUpKSB8
fA0KDQpOb3QgcmVsYXRlZCB0byB5b3VyIGNvZGUsIGJ1dCBpdCBkb2VzIG5vdCBtYWtlIG1lIGNv
bWZvcnRhYmxlIHRoYXQgUFRF4oCZcw0Kc3RhdHVzIGJpdHMgKHdoaWNoIGFyZSB2b2xhdGlsZSkg
YXJlIG5vdCBhY2Nlc3NlZCBpbiB0aGlzIG1hbm5lci4NCg0KRXNwZWNpYWxseSBzaW5jZSB0aGUg
UFRFIGlzIGxhdGVyIHNhdmVkIGludG8gb3JpZ19wdGUuIEl0IHdvdWxkIGZlZWwgc2FmZXINCnRv
IGRvIFJFQURfT05DRSgqcHZtdy5wdGUpIGFuZCB3b3JrIG9uIGl0IChwcm9iYWJseSBpbiBhIHNl
cGFyYXRlIHBhdGNoKS4NCg0KPiAgICAgICAgICAgIGFub25fZXhjbHVzaXZlIHx8IG1tX3RsYl9m
bHVzaF9wZW5kaW5nKG1tKSkgew0KPiAgICAgICAgICAgICAgICBwdGVfdCBlbnRyeTsNCj4gDQo+
IEBAIC0xMTA3LDExICsxMTA2LDExIEBAIHN0YXRpYyBpbnQgd3JpdGVfcHJvdGVjdF9wYWdlKHN0
cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLCBzdHJ1Y3QgcGFnZSAqcGFnZSwNCj4gDQo+ICAgICAg
ICAgICAgICAgIGlmIChwdGVfZGlydHkoZW50cnkpKQ0KPiAgICAgICAgICAgICAgICAgICAgICAg
IHNldF9wYWdlX2RpcnR5KHBhZ2UpOw0KPiArICAgICAgICAgICAgICAgZW50cnkgPSBwdGVfbWtj
bGVhbihlbnRyeSk7DQo+ICsNCj4gKyAgICAgICAgICAgICAgIGlmIChwdGVfd3JpdGUoZW50cnkp
KQ0KPiArICAgICAgICAgICAgICAgICAgICAgICBlbnRyeSA9IHB0ZV93cnByb3RlY3QoZW50cnkp
Ow0KPiANCj4gLSAgICAgICAgICAgICAgIGlmIChwdGVfcHJvdG5vbmUoZW50cnkpKQ0KPiAtICAg
ICAgICAgICAgICAgICAgICAgICBlbnRyeSA9IHB0ZV9ta2NsZWFuKHB0ZV9jbGVhcl9zYXZlZHdy
aXRlKGVudHJ5KSk7DQo+IC0gICAgICAgICAgICAgICBlbHNlDQo+IC0gICAgICAgICAgICAgICAg
ICAgICAgIGVudHJ5ID0gcHRlX21rY2xlYW4ocHRlX3dycHJvdGVjdChlbnRyeSkpOw0KPiAgICAg
ICAgICAgICAgICBzZXRfcHRlX2F0X25vdGlmeShtbSwgcHZtdy5hZGRyZXNzLCBwdm13LnB0ZSwg
ZW50cnkpOw0KPiAgICAgICAgfQ0KPiAgICAgICAgKm9yaWdfcHRlID0gKnB2bXcucHRlOw0KPiBk
aWZmIC0tZ2l0IGEvbW0vbWVtb3J5LmMgYi9tbS9tZW1vcnkuYw0KPiBpbmRleCBjNTU5OWE5Mjc5
YjEuLjI4NmMyOWVlM2FiYSAxMDA2NDQNCj4gLS0tIGEvbW0vbWVtb3J5LmMNCj4gKysrIGIvbW0v
bWVtb3J5LmMNCj4gQEAgLTQ2NzIsMTIgKzQ2NzIsMTIgQEAgaW50IG51bWFfbWlncmF0ZV9wcmVw
KHN0cnVjdCBwYWdlICpwYWdlLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwNCj4gc3RhdGlj
IHZtX2ZhdWx0X3QgZG9fbnVtYV9wYWdlKHN0cnVjdCB2bV9mYXVsdCAqdm1mKQ0KPiB7DQo+ICAg
ICAgICBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSA9IHZtZi0+dm1hOw0KPiArICAgICAgIGJv
b2wgdHJ5X2NoYW5nZV93cml0YWJsZTsNCj4gICAgICAgIHN0cnVjdCBwYWdlICpwYWdlID0gTlVM
TDsNCj4gICAgICAgIGludCBwYWdlX25pZCA9IE5VTUFfTk9fTk9ERTsNCj4gICAgICAgIGludCBs
YXN0X2NwdXBpZDsNCj4gICAgICAgIGludCB0YXJnZXRfbmlkOw0KPiAgICAgICAgcHRlX3QgcHRl
LCBvbGRfcHRlOw0KPiAtICAgICAgIGJvb2wgd2FzX3dyaXRhYmxlID0gcHRlX3NhdmVkd3JpdGUo
dm1mLT5vcmlnX3B0ZSk7DQo+ICAgICAgICBpbnQgZmxhZ3MgPSAwOw0KPiANCj4gICAgICAgIC8q
DQo+IEBAIC00NjkyLDYgKzQ2OTIsMTIgQEAgc3RhdGljIHZtX2ZhdWx0X3QgZG9fbnVtYV9wYWdl
KHN0cnVjdCB2bV9mYXVsdCAqdm1mKQ0KPiAgICAgICAgICAgICAgICBnb3RvIG91dDsNCj4gICAg
ICAgIH0NCj4gDQo+ICsgICAgICAgLyogU2VlIG1wcm90ZWN0X2ZpeHVwKCkuICovDQo+ICsgICAg
ICAgaWYgKHZtYS0+dm1fZmxhZ3MgJiBWTV9TSEFSRUQpDQo+ICsgICAgICAgICAgICAgICB0cnlf
Y2hhbmdlX3dyaXRhYmxlID0gdm1hX3dhbnRzX3dyaXRlbm90aWZ5KHZtYSwgdm1hLT52bV9wYWdl
X3Byb3QpOw0KPiArICAgICAgIGVsc2UNCj4gKyAgICAgICAgICAgICAgIHRyeV9jaGFuZ2Vfd3Jp
dGFibGUgPSAhISh2bWEtPnZtX2ZsYWdzICYgVk1fV1JJVEUpOw0KDQpJdCByZWFsbHkgY2Fubm90
IGJlIGV4dHJhY3RlZCBpbnRvIGEgc2VwYXJhdGUgZnVuY3Rpb24/DQoNCg0K
