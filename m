Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F289599AD2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Aug 2022 13:23:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M8KB12whSz3dwN
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Aug 2022 21:23:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Dj5/0PZN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M8K9S1HV0z3cBB
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Aug 2022 21:22:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Dj5/0PZN;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4M8K9P1v8Qz4x1G;
	Fri, 19 Aug 2022 21:22:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1660908155;
	bh=SXvhcATHeAzGrsMP2ajJM02RREFpXI38PV8xlqpBvfk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Dj5/0PZNbcvmmBLC1vxc+g8hIrgyxyVrvDiueNMAUKwl+xNjN80XyTFh6mcL3oo88
	 JhI4NCwCYx4vx1guEND4xEfN602aY988zTA9BEVr/wBtSUBng7mjVYFRd54CfaNV7L
	 AzlxqMoecTz26IeIoVfSYwYkbqdW/dWTJBpg7v+Df9GFmEHhjHTzfNo5Cc+h8jBBGN
	 /wTMmny+SRgk1jqhkGFt+qR/9XwyQ8/ZL3licVyZcBan4ftPMvNnrJY4G8bpPi6g62
	 boV22S7BcUl47iUzKvn+Zwpcp+K42mIHbBDhssIFl1XIJKxDOfb8hanzYqJ34Hy+qF
	 49CXJER8bAuPg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Mike Kravetz <mike.kravetz@oracle.com>, Andrew Morton
 <akpm@linux-foundation.org>
Subject: Re: [PATCH v6 1/2] mm: migration: fix the FOLL_GET failure on
 following huge page
In-Reply-To: <Yv0ku1mn4LBzg/zG@monkey>
References: <20220812084921.409142-1-haiyue.wang@intel.com>
 <20220816022102.582865-1-haiyue.wang@intel.com>
 <20220816022102.582865-2-haiyue.wang@intel.com>
 <20220816175838.211a1b1e85bc68c439101995@linux-foundation.org>
 <BYAPR11MB3495F747CBF95E079E8FC8A5F76A9@BYAPR11MB3495.namprd11.prod.outlook.com>
 <20220816224322.33e0dfbcbf522fcdc2026f0e@linux-foundation.org>
 <Yv0ku1mn4LBzg/zG@monkey>
Date: Fri, 19 Aug 2022 21:22:32 +1000
Message-ID: <875yiomq9z.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: "linmiaohe@huawei.com" <linmiaohe@huawei.com>, "alex.sierra@amd.com" <alex.sierra@amd.com>, Vasily Gorbik <gor@linux.ibm.com>, "david@redhat.com" <david@redhat.com>, linuxppc-dev@lists.ozlabs.org, Heiko Carstens <hca@linux.ibm.com>, "apopple@nvidia.com" <apopple@nvidia.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, Sven Schnelle <svens@linux.ibm.com>, "Huang, Ying" <ying.huang@intel.com>, "Wang, Haiyue" <haiyue.wang@intel.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, "naoya.horiguchi@linux.dev" <naoya.horiguchi@linux.dev>, "songmuchun@bytedance.com" <songmuchun@bytedance.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Mike Kravetz <mike.kravetz@oracle.com> writes:
> On 08/16/22 22:43, Andrew Morton wrote:
>> On Wed, 17 Aug 2022 03:31:37 +0000 "Wang, Haiyue" <haiyue.wang@intel.com> wrote:
>>
>> > > >  		}
>> > >
>> > > I would be better to fix this for real at those three client code sites?
>> >
>> > Then 5.19 will break for a while to wait for the final BIG patch ?
>>
>> If that's the proposal then your [1/2] should have had a cc:stable and
>> changelog words describing the plan for 6.0.
>>
>> But before we do that I'd like to see at least a prototype of the final
>> fixes to s390 and hugetlb, so we can assess those as preferable for
>> backporting.  I don't think they'll be terribly intrusive or risky?
>
> I will start on adding follow_huge_pgd() support.  Although, I may need
> some help with verification from the powerpc folks, as that is the only
> architecture which supports hugetlb pages at that level.
>
> mpe any suggestions?

I'm happy to test.

I have a system where I can allocate 1GB huge pages.

I'm not sure how to actually test this path though. I hacked up the
vm/migration.c test to allocate 1GB hugepages, but I can't see it going
through follow_huge_pgd() (using ftrace).

Maybe I hacked it up badly, I'll have a closer look on Monday. But if
you have any tips on how to trigger that path let me know :)

cheers
