Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 590307C6BED
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Oct 2023 13:08:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=VDx3tQ87;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S5n1Y6yVnz3cjt
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Oct 2023 22:08:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=VDx3tQ87;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S5n0h5L66z2yVR
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Oct 2023 22:07:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1697108852;
	bh=6OsxE8kV2xPTFulSGmBi28q09UFtUYgFyf1Emr7m/7A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=VDx3tQ87D/n3Su76DDY5c5gznJtSvPRang3Mx9bCeIPCjwjUPr9G0mCFm0PxhngwL
	 ZCuZ5Od7n3VtI386qVODEFFFPcwMufDJEpQaKTGSouVZhqzc0ZLQRHKkVnfw5ltSqA
	 comqa8d0qr4bMVfi4uo1E42BuYfqs1+wmBJ4XF0NXNiK46ZMmcgO7AFEzh3MWjC+fS
	 W013YuBkEp1d2MuCeoNIdH1GJ+42bNX13Ni/DI1DZinNx0moSCelY02xmTwLTCnh9C
	 rrDEUR/yJEgCktS2SOt3WRXHgxqdqq1fhNOz3UHeeWsETZLNZ3kqOkyGP3wpYr6AcN
	 FXBlsp5E6oekQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4S5n0g1rM6z4xMC;
	Thu, 12 Oct 2023 22:07:31 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v6 4/9] mm: thp: Introduce anon_orders and
 anon_always_mask sysfs files
In-Reply-To: <20231009172029.e558c08dd90d9b94fec3a036@linux-foundation.org>
References: <20230929114421.3761121-1-ryan.roberts@arm.com>
 <20230929114421.3761121-5-ryan.roberts@arm.com>
 <20230929155530.a51e68e03e47a06b6b84c689@linux-foundation.org>
 <87fs2mrqld.fsf@mail.lhotse>
 <20231009172029.e558c08dd90d9b94fec3a036@linux-foundation.org>
Date: Thu, 12 Oct 2023 22:07:26 +1100
Message-ID: <87o7h4qett.fsf@mail.lhotse>
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
Cc: David Hildenbrand <david@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, Yang Shi <shy828301@gmail.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Yu Zhao <yuzhao@google.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, Vlastimil Babka <vbabka@suse.cz>, Zi Yan <ziy@nvidia.com>, "Huang, Ying" <ying.huang@intel.com>, Ryan Roberts <ryan.roberts@arm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, John Hubbard <jhubbard@nvidia.com>, David Rientjes <rientjes@google.com>, Itaru Kitayama <itaru.kitayama@gmail.com>, linux-arm-kernel@lists.infradead.org, Yin Fengwei <fengwei.yin@intel.com>, Luis Chamberlain <mcgrof@kernel.org>, linuxppc-dev@lists.ozlabs.org, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Andrew Morton <akpm@linux-foundation.org> writes:
> On Sun, 08 Oct 2023 09:54:22 +1100 Michael Ellerman <mpe@ellerman.id.au> wrote:
>
>> > I don't know why powerpc's PTE_INDEX_SIZE is variable.
>> 
>> To allow a single vmlinux to boot using either the Hashed Page Table
>> MMU, or Radix Tree MMU, which have different page table geometry.
>> 
>> That's a pretty crucial feature for distros, so that they can build a
>> single kernel to boot on Power8/9/10.
>
> Dumb question: why can't distros ship two kernels and have the boot
> loader (or something else) pick the appropriate one?

I'm not a grub expert, but AFAIK it doesn't support loading a different
kernel based on CPU/firwmare features. I'm quite sure it can't do that
on powerpc at least.

We also have another bootloader (petitboot) that is still supported by
some distros, and can't do that.

The other problem is like David says, distros are generally reluctant to
add new kernel configurations unless they absolutely have to. It adds
more work for them, more things to track, and can confuse users leading
to spurious bug reports.

cheers
