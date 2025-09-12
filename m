Return-Path: <linuxppc-dev+bounces-12094-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E5DDAB55298
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Sep 2025 17:03:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cNd3C4dnhz3dK8;
	Sat, 13 Sep 2025 01:03:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757689399;
	cv=none; b=idg3m3YAymGAuhx43FXhkzZ3rC7Y+K68xo8GYVamfzhXP3fbO1SZjuFcEP88QQRFfPGyw7GOV6tMsOvnzRLU7u79LTacOk3a2yuNeafFozqrXYl3Drl/2ThpmT+rEkkNpRJiHUbx6JKcRPdida0VXuCKqh8qx0A1nryhjLhR3/1Dz2JUY7L8fkw+Z9xNQ2tfeeyEx+0/ElApkzHEIssLENjWBTrEwIx/8SdZP110uijZNmpAZW7FNzg7Ym3avHOEkMLmjSj6adUns/t+x97uJMOWJzoVnzFJQhAali9ClPnginnXujCEDN1ZRH4lkgdot3wNTH55zf/o1RTcmqynZA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757689399; c=relaxed/relaxed;
	bh=pjxju66cdgbuLH84lLr1f0aB2LRRyXTtvk+w4J2qi2Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IDfTxiu+U+V6BpIVDRR6QFCCacAFsdX1wrmLTuzFWuxgU22+jZM2uc68+jY6P87SFHdFe2p2wbqdyaEu2RyjhNlMg3td8sCbjzvNsgxji9MwNBoZp9jT2HRxiK3TpQ3qLCAKE6I2RUBvfu9WigurQr7ZYKM3jXgYxoOsAY4GE7KEPl2VRmPVtZsn5c5s0sT/A3AwjFOM3aeqVYr6F49UIK2Q8ife1aqXFgcHRE5aehoVVkb1T54fq9kSkrnJ8cg0P/ZZ7Hwif7KEW+HZhSfskq5ph0mlETq4rPsaV9wfGyhhgUA6y37tOFTKFGjHdwX5H6+hDFdAJGec1xNUOuHMIw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cNd392rYdz3dDJ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Sep 2025 01:03:15 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DCD5812FC;
	Fri, 12 Sep 2025 08:02:34 -0700 (PDT)
Received: from [10.57.66.147] (unknown [10.57.66.147])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 558333F694;
	Fri, 12 Sep 2025 08:02:36 -0700 (PDT)
Message-ID: <f9b0bf10-a531-484e-9679-08ec25ceb444@arm.com>
Date: Fri, 12 Sep 2025 17:02:34 +0200
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
Subject: Re: [PATCH v2 2/7] mm: introduce local state for lazy_mmu sections
To: David Hildenbrand <david@redhat.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
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
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org,
 Mark Rutland <Mark.Rutland@arm.com>
References: <4b4971fd-0445-4d86-8f3a-6ba3d68d15b7@arm.com>
 <4aa28016-5678-4c66-8104-8dcc3fa2f5ce@redhat.com>
 <15d01c8b-5475-442e-9df5-ca37b0d5dc04@arm.com>
 <7953a735-6129-4d22-be65-ce736630d539@redhat.com>
 <781a6450-1c0b-4603-91cf-49f16cd78c28@arm.com>
 <a17ab4e3-627a-4989-a5a5-d430eadabb86@redhat.com>
 <9ed5441f-cc03-472a-adc6-b9d3ad525664-agordeev@linux.ibm.com>
 <74d1f275-23c3-4fd8-b665-503c7fc87df0@redhat.com>
 <248b4623-8755-4323-8a44-be4af30e4856-agordeev@linux.ibm.com>
 <b46d3430-fb84-464b-b053-490c6ea083da@redhat.com>
 <cdd9bc60-96d4-4f19-86c3-dcf598ccbd92-agordeev@linux.ibm.com>
 <852d6f8c-e167-4527-9dc9-98549124f6b1@redhat.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <852d6f8c-e167-4527-9dc9-98549124f6b1@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 12/09/2025 16:25, David Hildenbrand wrote:
>
>>
>> But I do not really expect it ever, since arch_enter_lazy_mmu_mode_pte()
>> is only to be called in PTE walkers that never span more than one page
>> table and follow the pattern:
>
> Well, the cover letter here states:
>
> "Unfortunately, a corner case (DEBUG_PAGEALLOC) may still cause
> nesting to occur on arm64. Ryan proposed [2] to address that corner
> case at the generic level but this approach received pushback; [3]
> then attempted to solve the issue on arm64 only, but it was deemed too
> fragile."
>
> So I guess we should support nesting cleanly, at least on the core-mm
> side.

Nesting remains a rare occurrence though. I think it would be plausible
to require this new interface to be used in a region where no nesting
can occur, just like pause()/resume().

In fact, I think this is a requirement if we go for the approach we have
been discussing, because nested enter()/leave() calls are not meant to
call arch_enter()/arch_leave(), and I really wouldn't want to use a
different logic for this variant.

>
> I guess we could start with saying "well, s390x doesn't fully support
> nesting yet but doing so just requires changing the way we manage this
> per-nesting-level state internally".
>
> s390 is trying to do something different than the other archs here, so
> that naturally concerns me :)
>
> But if it's really just about forwarding that data and having s390
> store it somewhere (task_struct, percpu variable, etc), fine with me. 

Yes I think this is fine, with the restriction above. The extra
arguments are directly forwarded to arch code and otherwise ignored by
core code, and unless the arch defines some __HAVE_ARCH... or CONFIG,
the extended interface falls back to regular enter()/leave().

- Kevin

