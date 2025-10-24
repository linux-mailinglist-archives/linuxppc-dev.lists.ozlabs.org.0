Return-Path: <linuxppc-dev+bounces-13270-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 159A6C0634C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Oct 2025 14:18:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ctMP615CFz3c8h;
	Fri, 24 Oct 2025 23:18:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761308282;
	cv=none; b=SSqdzUJoHQ7Xrb/ccJ73H5RlxCG7eA9bZaJvg7iTp4+5RRteTNdrJyD9Q+MMoho/UMXL2mI38lIx8O97JP9NyWxFvd1p7cLk/V64H9jq27PT0NGRFU8kJ+ETUrM+g0zeC8dWg+Y0JAJt/aLSrZYlkE/gv3sNBepF+5+epdtfJGbrG8eUV38AHAqd6do/vt8+WNUCcKlmQdcCZYuPkovkdMpGqqBEyI3qPmCrP4Y4KWBEDINuaEnmuVyk3uX0fQo/MJW9NpqaG/bDAb4o0A/xruVrcAmrdbOzJB0/u6hSSovjenXxWraRCpUZFH1+pGeL2LGdArxKZWygS5IDULg7cA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761308282; c=relaxed/relaxed;
	bh=0pqn941rf59LOhvD/M25wUPoVRtPWVt8BoEPjLcQaZk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ovlFEQDWwLnzcodDIP3zzfrMYTl3P1WKBAngePoWWA20TS4vtUSa/06VKnaR8RJgGFer0e/TPq+XUCMZv4eDly2+I5tRbNRlay4jCnZuskogZi2p3pIcgUWJHEp1rG2tgFsGuwsFSL0GUOjc6JYdzGpuckR5jbuHqAD7AVMHhMp/Di0f/jVmsm5SvYxQ0PuoRFbpopuKO+QlrajAPTS8KyctPIW2bIAjp7F0vgbJXZyg22zWKIfiNcCDoG/QYdG1qz4YSpCIc1wDC9nqcboeJ9MMQhkAEQ+1783jdlNWN+/d9N1ZM3UYqZi6L1SC3dq8ULCyNbeVf8XV1XYTUo0H0w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ctMP544vQz3bv1
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Oct 2025 23:18:01 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BA3FF1515;
	Fri, 24 Oct 2025 05:17:22 -0700 (PDT)
Received: from [10.44.160.74] (e126510-lin.lund.arm.com [10.44.160.74])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 38C343F66E;
	Fri, 24 Oct 2025 05:17:23 -0700 (PDT)
Message-ID: <35df96ba-a004-4eb4-8d26-5935892a852c@arm.com>
Date: Fri, 24 Oct 2025 14:17:20 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/13] mm: introduce arch_wants_lazy_mmu_mode()
To: David Hildenbrand <david@redhat.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>, "H. Peter Anvin" <hpa@zytor.com>,
 Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>,
 Juergen Gross <jgross@suse.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner
 <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251015082727.2395128-1-kevin.brodsky@arm.com>
 <20251015082727.2395128-14-kevin.brodsky@arm.com>
 <3d6bba2d-9739-41d0-8f3a-f8b11620c33f@redhat.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <3d6bba2d-9739-41d0-8f3a-f8b11620c33f@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 23/10/2025 22:10, David Hildenbrand wrote:
> On 15.10.25 10:27, Kevin Brodsky wrote:
>> powerpc decides at runtime whether the lazy MMU mode should be used.
>>
>> To avoid the overhead associated with managing
>> task_struct::lazy_mmu_state if the mode isn't used, introduce
>> arch_wants_lazy_mmu_mode() and bail out of lazy_mmu_mode_* if it
>> returns false. Add a default definition returning true, and an
>> appropriate implementation for powerpc.
>>
>> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
>> ---
>> This patch seemed like a good idea to start with, but now I'm not so
>> sure that the churn added to the generic layer is worth it.
>
> Exactly my thoughts :)
>
> I think we need evidence that this is really worth it for optimizing
> out basically a counter update on powerpc.

Ack, I'll drop that patch in v4 unless someone sees a better
justification for it.

- Kevin

