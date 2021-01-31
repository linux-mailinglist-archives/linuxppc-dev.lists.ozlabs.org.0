Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A756309B1C
	for <lists+linuxppc-dev@lfdr.de>; Sun, 31 Jan 2021 09:16:14 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DT3n74SsfzDrSM
	for <lists+linuxppc-dev@lfdr.de>; Sun, 31 Jan 2021 19:16:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=vmware.com (client-ip=40.107.243.76;
 helo=nam12-dm6-obe.outbound.protection.outlook.com;
 envelope-from=namit@vmware.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=vmware.com header.i=@vmware.com header.a=rsa-sha256
 header.s=selector2 header.b=1C2o/xbj; 
 dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2076.outbound.protection.outlook.com [40.107.243.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DT3lC2nmJzDrQH
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 31 Jan 2021 19:14:28 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=etlh6TWO5zqmN3DvkLE1z8uNlbtPwUHoriYgC2DVr5R4HujQwKti5tGYHJUDpbrU2d06JBKhCsWYIkNJPwCl9vQQ2o0odJtbJuBGYrJgS72/g2s34oBEap94pVmwWiALzQzDg3zplPrBuO8E8w3fT7Rwu9Eq1JboU/65BMcC+bZ3FesNj1b6pLb2e5b6VuYSHkLxh4rnxoxg/agqA7xMRVvTAmYGBL1//i93r7oTxM8F92gY4shR1ksezUwMxMD1qho7OrMkQ0S2nQlWy0sP7PzYI3W4P8qFr6OT+Q2b3lBlU/YeAJq0Y93DQBanNEh7RQpzaUR1jjDqLN/JIitFYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JU+cLScSQ9cu3IAs2JPbupcb1ftr2ZTBaZqbKLbTH7g=;
 b=d7BgyQxzM8MjzGhZeJLUHpiMeN3lpCMO3fDo4n+AKVH1Xd/6s+NeBrLXpOgGcKpoLKAmJgMPv4rTj37oxEocD9T4PJEpPa+G/46luUsOTA5dufePEpaJcm3yX9aoIgZ2HlfSiNZFpvUMYMGfycunFvT9219Ua2hpfCoD16o/cLwItlvwBvB5eZgehsC8bynOhiKtDF1yiISRUWQNuPOhu6wm4OtzDZOAyV6fo58d3h2YXRJuMI3sTjV4x3Gu4opRixAcBTtpZN4/J94bKDsGr8NKjljOTnhixul0aRbGp8vMMgy2nw6ZcoOpmx5eDWg6IQ4nlh0WbYFQWdnT4knFfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JU+cLScSQ9cu3IAs2JPbupcb1ftr2ZTBaZqbKLbTH7g=;
 b=1C2o/xbj6jiIlgOW7q3VK+vbAubfIBOdE8JhI5XluDBz6bWJW6zvqrRqJ0YLldbmN4lwMZ416KogsCG1XzpJAKg8LXQJ97H5n6Buf4yww8jIxvWSYowgA7AYLK8XOFsuy27HFnRVcDe0y17u4vIDRxW0pF4X3SVVxaelHP3ERQY=
Received: from (2603:10b6:a03:4a::18) by
 BYAPR05MB5095.namprd05.prod.outlook.com (2603:10b6:a03:97::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.8; Sun, 31 Jan 2021 08:14:17 +0000
Received: from BYAPR05MB4776.namprd05.prod.outlook.com
 ([fe80::ddba:e1e9:fde7:3b31]) by BYAPR05MB4776.namprd05.prod.outlook.com
 ([fe80::ddba:e1e9:fde7:3b31%3]) with mapi id 15.20.3825.013; Sun, 31 Jan 2021
 08:14:16 +0000
From: Nadav Amit <namit@vmware.com>
To: Nadav Amit <namit@vmware.com>
Subject: Re: [RFC 00/20] TLB batching consolidation and enhancements
Thread-Topic: [RFC 00/20] TLB batching consolidation and enhancements
Thread-Index: AQHW94F8jqirOcyt10i89p5eRNXwdKpBXksAgAAE0wA=
Date: Sun, 31 Jan 2021 08:14:16 +0000
Message-ID: <30BE6144-A66B-4FF7-9112-35EDF6EF6304@vmware.com>
References: <20210131001132.3368247-1-namit@vmware.com>
 <1612063149.2awdsvvmhj.astroid@bobo.none>
 <A1589669-34AE-4E15-8358-79BAD7C72520@vmware.com>
In-Reply-To: <A1589669-34AE-4E15-8358-79BAD7C72520@vmware.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: vmware.com; dkim=none (message not signed)
 header.d=none;vmware.com; dmarc=none action=none header.from=vmware.com;
x-originating-ip: [24.6.216.183]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 05d8f887-bfd9-4b9e-a841-08d8c5c033f9
x-ms-traffictypediagnostic: BYAPR05MB5095:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR05MB50955D5AAFE9BDCA16DB20F3D0B79@BYAPR05MB5095.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AZUeBqrOpLRCySrYyiQwt2Vn9M1V2qEY6WhC+Xgi3RtE6Hdw5pr8pEz3mmmv7/22a2VPMNSgKQCh3enlXoA5ECbwnZ/lPGv3jzXa/PlDKlQh0fXBqVyp9dHKcNR5xC3KtfJcn8Yzv+5K4wS9oSb7NJ3F/D+MStM4di7IsLEe7cy/u0FQDTwZeO2KGHVv7giXiLurFu2ekxCplsKclpLVQaTw9zXTP5Pa0oDAo5PU36g6vRPIJwy1rNCEjaOhb43aBfnFlgwGRkLW1FaVN2Pu3ld2gWa2BQiQg3jEoNb3t0YufamcAgARlGVpyreboCnieYvq8WOgCMqa2CFqc1Sz3dGjg8AEYWnNMRqempDWUrio+iX8idOx8Zjipxzhb19LL0xti1JPnsi+R+JHPbP7/Kibfo8NlRj405UgPJlYMqvIHtPLOXc3LovAGx94CYgBYmnZHeVzt/eNjrgCnH6DsYloDIR/B/iUIQxaUiYwA3+bGVs1WTM434Xoah/Zisvo64pABZyd2xprb5r5VO/VsEGu+4gu6W68o3DSt1Dp6dl1GkVxscJF2cKup4K5hL6oOOE7aZ5JYOliAGTEql0HmQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR05MB4776.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(396003)(366004)(346002)(376002)(186003)(2616005)(76116006)(4326008)(86362001)(6862004)(7416002)(8936002)(316002)(66946007)(66446008)(54906003)(6200100001)(37006003)(64756008)(66556008)(66476007)(71200400001)(5660300002)(6506007)(6512007)(53546011)(36756003)(478600001)(26005)(33656002)(83380400001)(8676002)(2906002)(6486002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?WLmeenlHEWTOaG7RVTH802my0+jsm2a0MeD95AqWRO7hWr2oGbf1HKSrbwW1?=
 =?us-ascii?Q?KZgS944MyRA167+XfO6v6hc+41It7lK7lyuPAj2DD3bM84Ld3z99p+x7rySR?=
 =?us-ascii?Q?rKSyNQNhuXmCYrDQLzhP9bHa/+mhClraMSEyFIdWE/sTNTeWq/phYm+PDCQL?=
 =?us-ascii?Q?LF3UkmiYjj9ZheAPYKnQXA+iHud0lJcxqvquJmZf1uj4FvHk0Y9lU536Pkw2?=
 =?us-ascii?Q?Q148j/oF5nyFtCYRkG1l4INvI/w7xvoPSfxch3nPKuRo5BC8by7sZClfhNj/?=
 =?us-ascii?Q?bqDa/1HFfI98ZGUTA8gfXs1l1e40ROAMb+N89OIdDaB/2FLvmXp5++D14Ht5?=
 =?us-ascii?Q?jTfPRNS+vHRsebxJn4xHL5K2ilO415YahPUm4CjibJpSEK1ZqhhuXA2XGPH+?=
 =?us-ascii?Q?qTEud+n2N0caoaH07DSMrPPNpmMo9qvKgmBclAesKJFZySFSukuUn93OUBt4?=
 =?us-ascii?Q?cePSbUyfEja5TDimlZBB+W3+Dc0t2a3o5H17Gp/Vpal47bGzAb7PoeUkn3UA?=
 =?us-ascii?Q?56YfdJzO7Ai08SZVsJwpdBoWQgPU4lYm7BQa3tmJ/kZlBj/rSZDJbXzQk5Ol?=
 =?us-ascii?Q?NMzMVKek3rucmktwUg6Oh800WgAXYyO7nPJEvNOi+33r3LEMaC8OhfmAm5mt?=
 =?us-ascii?Q?YFZ6TpF0zxXVONnAS/XzJ61BJ0QIybfhkfGrNdLnkrxZraGO29tpgpTuELau?=
 =?us-ascii?Q?WLWz6IthVoylVwPQ5IDnekh5WlyHu9m4qxeReXnIvDhcLGisnGdO2svOz2Vz?=
 =?us-ascii?Q?ySe+l3B/MWZ+lU0fN1+0TZN03gRHLt1wCK2E/NNCeXftAahemI7kHlqFD2n3?=
 =?us-ascii?Q?0CQibZyt2twKM6fiHEOmbLR9T+QejZxLHZZSXTHB/W2xKx2Iolr8ZF88sCsA?=
 =?us-ascii?Q?G46hcVKuODPnBYw58OUEALhxdwGejtEdgR8spqGcmeOPWuAVK0NHUvEcM9gt?=
 =?us-ascii?Q?H27ymqpFZdbRHU3cE5vfBFfiIQ++LqpuJbz3fMfYvGM3C+zSsjf1eXj/8gnH?=
 =?us-ascii?Q?igMKoy1/1Bzab+qSuWWfQv/QwKmEqxZauj3+cWbJVm3KUETeE117+WrrFdQu?=
 =?us-ascii?Q?1gbC0ajp?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3581594BDEC2384E80E3AEE6C81F192A@namprd05.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR05MB4776.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05d8f887-bfd9-4b9e-a841-08d8c5c033f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2021 08:14:16.8278 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6Arahg9Ul/mwU+qHzh5WsLZQpTg14w7hjC3ItC+uIBL0APoE2aPnTm9m7SvyxNhkKVPzH86tpyKoD2uNXE8YiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR05MB5095
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
Cc: Andrea Arcangeli <aarcange@redhat.com>,
 linux-s390 <linux-s390@vger.kernel.org>, X86 ML <x86@kernel.org>,
 Yu Zhao <yuzhao@google.com>, Will Deacon <will@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Mel Gorman <mgorman@techsingularity.net>,
 Dave Hansen <dave.hansen@linux.intel.com>, LKML <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>, Linux-MM <linux-mm@kvack.org>,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 Andy Lutomirski <luto@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Thomas Gleixner <tglx@linutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> On Jan 30, 2021, at 11:57 PM, Nadav Amit <namit@vmware.com> wrote:
>=20
>> On Jan 30, 2021, at 7:30 PM, Nicholas Piggin <npiggin@gmail.com> wrote:
>>=20
>> Excerpts from Nadav Amit's message of January 31, 2021 10:11 am:
>>> From: Nadav Amit <namit@vmware.com>
>>>=20
>>> There are currently (at least?) 5 different TLB batching schemes in the
>>> kernel:
>>>=20
>>> 1. Using mmu_gather (e.g., zap_page_range()).
>>>=20
>>> 2. Using {inc|dec}_tlb_flush_pending() to inform other threads on the
>>>  ongoing deferred TLB flush and flushing the entire range eventually
>>>  (e.g., change_protection_range()).
>>>=20
>>> 3. arch_{enter|leave}_lazy_mmu_mode() for sparc and powerpc (and Xen?).
>>>=20
>>> 4. Batching per-table flushes (move_ptes()).
>>>=20
>>> 5. By setting a flag on that a deferred TLB flush operation takes place=
,
>>>  flushing when (try_to_unmap_one() on x86).
>>>=20
>>> It seems that (1)-(4) can be consolidated. In addition, it seems that
>>> (5) is racy. It also seems there can be many redundant TLB flushes, and
>>> potentially TLB-shootdown storms, for instance during batched
>>> reclamation (using try_to_unmap_one()) if at the same time mmu_gather
>>> defers TLB flushes.
>>>=20
>>> More aggressive TLB batching may be possible, but this patch-set does
>>> not add such batching. The proposed changes would enable such batching
>>> in a later time.
>>>=20
>>> Admittedly, I do not understand how things are not broken today, which
>>> frightens me to make further batching before getting things in order.
>>> For instance, why is ok for zap_pte_range() to batch dirty-PTE flushes
>>> for each page-table (but not in greater granularity). Can't
>>> ClearPageDirty() be called before the flush, causing writes after
>>> ClearPageDirty() and before the flush to be lost?
>>=20
>> Because it's holding the page table lock which stops page_mkclean from=20
>> cleaning the page. Or am I misunderstanding the question?
>=20
> Thanks. I understood this part. Looking again at the code, I now understa=
nd
> my confusion: I forgot that the reverse mapping is removed after the PTE =
is
> zapped.
>=20
> Makes me wonder whether it is ok to defer the TLB flush to tlb_finish_mmu=
(),
> by performing set_page_dirty() for the batched pages when needed in
> tlb_finish_mmu() [ i.e., by marking for each batched page whether
> set_page_dirty() should be issued for that page while collecting them ].

Correcting myself (I hope): no we cannot do so, since the buffers might be
remove from the page at that point.

