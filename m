Return-Path: <linuxppc-dev+bounces-12216-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3C0B577F1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Sep 2025 13:20:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cQMyR275zz3dRk;
	Mon, 15 Sep 2025 21:20:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757935215;
	cv=none; b=JO1axfol9q4qdLCmtiGOv9k4z2vmc3oqw7mTqusOxbHthY5YICOjwo9z01SiHjFghefBDdji9nRfXEc7HmgvztEdHB91FV1Ij2XruIwnCpH8MXXRteM3kDgq9lQ4ckz+K9gjpmtnPmWBDWEkFvR51TKh91vhB4RUxnMjd0gs+JP5F7yYdthaHp3eLzF/my2NMGb7ogCSC4lxbmTAwO3eZTNp9h5Qwv8iT83tAtK5U8rYiUp/+Mp4kErCNeJCO/FYLdkuJra6mBYjN0ff9TCOiDmnB6iFDBt2qLCV3S/0IaC8xjoZ5RL/y2pzsiLkFL/hJcEtnc0TQqALf0vZItGa6g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757935215; c=relaxed/relaxed;
	bh=ezmIh4yAIIyC5Ofx9OYfMJK6a3eTs8fzX06OGshPKFg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jn1dIT2CXQKKpaKERY6xMiJBXjVj9QdQ8J2fxR4M/gUQCv0LjrHapM1Nh6xxNLBBya7eyv0QWcEyCx9U0X1Bk+1kO12h3bYO4xGN6XOW+tkb6/0cs1pDrEzN0wg1HwthstPk++aJ+YOaD6ZqT4M0JF5XS2diXzTeozgyGkuhxXbnkDn3z0IdnR/x8PVAdpJAZPsuHKuH1RKZBoJKWaxGRhXmrWdOzitGoYxEcIyNiS98omiKTR1INU9ZsGX3SQM/GPb85fyf4IVfie7mUuA6yaSKVR/IPKpOsLbE4ieJPrltdCu7Ke2tcZsO3ewVC06hrF+fFxjKirfAKU1olNtwoA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cQMyP6cjZz3dL0
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Sep 2025 21:20:12 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4D6971424;
	Mon, 15 Sep 2025 04:19:31 -0700 (PDT)
Received: from [10.57.70.220] (unknown [10.57.70.220])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6C7D73F694;
	Mon, 15 Sep 2025 04:19:34 -0700 (PDT)
Message-ID: <d407a381-099b-4ec6-a20e-aeff4f3d750f@arm.com>
Date: Mon, 15 Sep 2025 13:19:32 +0200
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
Subject: Re: [PATCH v2 0/7] Nesting support for lazy MMU mode
To: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: David Hildenbrand <david@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Andreas Larsson <andreas@gaisler.com>,
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
References: <20250908073931.4159362-1-kevin.brodsky@arm.com>
 <20250908191602.61160a7990b9ea418de758c7@linux-foundation.org>
 <d1b4ff2a-052f-4556-91ae-273962edbed0@redhat.com>
 <338ef811-1dab-4c4e-bc5f-8ebd8cb68435@arm.com>
 <5a0818bb-75d4-47df-925c-0102f7d598f4-agordeev@linux.ibm.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <5a0818bb-75d4-47df-925c-0102f7d598f4-agordeev@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 15/09/2025 08:28, Alexander Gordeev wrote:
> On Fri, Sep 12, 2025 at 05:25:27PM +0200, Kevin Brodsky wrote:
>
> Hi Kevin,
>
>> Based on the outcome of the discussion with David on patch 2 [1p], there
>> is indeed an alternative approach that we should seriously consider. In
>> summary:
>>
>> * Keep the API stateless, handle nesting with a counter in task_struct
>> * Introduce new functions to temporarily disable lazy_mmu without
>> impacting nesting, track that with a bool in task_struct (addresses the
>> situation in mm/kasan/shadow.c and possibly some x86 cases too)
>> * Move as much handling from arch_* to generic functions
>>
>> What the new generic infrastructure would look like:
>>
>> struct task_struct {
>>     ...
>> #ifdef CONFIG_ARCH_LAZY_MMU
>>     struct {
>>         uint8_t count;
>>         bool enabled; /* or paused, see below */
>>     } lazy_mmu_state;
>> #endif
>> }
>>
>> * lazy_mmu_mode_enable():
> This helper is parameter-free, assuming the MMU unit does not need any
> configuration other than turning it on/off. That is currently true, but
> (as I noted in my other mail) I am going to introduce a friend enable
> function that accepts parameters, creates an arch-specific state and
> uses it while the lazy mmu mode is active.

Yes I think that's fine.

> That does not impact your design (AFAICT), except one change below.
>
>>     if (!lazy_mmu_state.count) {
>>         arch_enter_lazy_mmu_mode();
>>         lazy_mmu_state.enabled = true;
>>     }
>>     lazy_mmu_state.count++;
>>
>> * lazy_mmu_mode_disable():
>>     lazy_mmu_count--;
>>     if (!lazy_mmu_state.count) {
>>         lazy_mmu_state.enabled = false;
>>         arch_leave_lazy_mmu_mode();
>>     } else {
>>         arch_flush_lazy_mmu_mode();
>>     }
>>
>> * lazy_mmu_mode_pause():
>>     lazy_mmu_state.enabled = false;
>>     arch_leave_lazy_mmu_mode();
> This needs to be arch_pause_lazy_mmu_mode(), otherwise the arch-specific
> state will be lost.
>
>> * lazy_mmu_mode_resume();
>>     arch_enter_lazy_mmu_mode();
> Conversely, this needs to be arch_resume_lazy_mmu_mode(). And it can not
> be arch_enter_lazy_mmu_mode(), since a lazy_mmu_mode_resume() caller does
> not know the parameters passed to the lazy_mmu_mode_enable(...)-friend.

Got it, that makes sense. Even without your proposal, it is probably a
good idea to allow arch's to behave differently on pause/resume.

I hope we can avoid forcing all arch's to define arch_pause/arch_resume
though, since only s390 will use it for the foreseeable future. Using
optional macros should do the trick.

- Kevin

