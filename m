Return-Path: <linuxppc-dev+bounces-12692-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 425D5BC1C31
	for <lists+linuxppc-dev@lfdr.de>; Tue, 07 Oct 2025 16:34:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cgzDG6fPnz3bjb;
	Wed,  8 Oct 2025 01:34:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759847662;
	cv=none; b=ga5pd9gEFO8u+Fo+ganG/0Wqp8azYXGtd3Kw/rhgwdI1PMYDM6AESlNiLoV0i1iXjG0ghJ8z6WgxWM+NhH5RRXl/DXk7RY8WB85l7V4+KapuMtJdgLg7b85+PpDm345WEtMeoytZEH5CDF3dOv8lUyfsGKCt48OGcQJlZDLcmLZAbEtBuQ/TlHl8BWcJFXWWLbVwYlSkpLnTautxA2Oil9eJ7C3+sOJRzzPTCDy0TZnGpVg2dpjIVRBRd/jU5WuntqrpvlOZaaYd25vl0054FOEJdZCI/hWgu6YzH0P8mBt/164QkZiNW/b0TPKWwe5Df12OitaMn2H1Chs3vGxo+g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759847662; c=relaxed/relaxed;
	bh=7QVDxlM7xcGgyRT1tAPb+CADHAg0LKL8k/+gTuQhwwY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SfDxJuTAZMiXKNc+CTiR/1Ep+hT1DfPACV1xMLOVYtr3Oy19G4bdyrlnQV7WBGqd7xMh2vM6h3KH9kONbhN5BD/MD1D20uHccosScXNzx40Lgw867Db8fQJ+/PssLhm+u/G41t5Pn87gHiWP96afbAB2t/lfqg1i5ou8gQKs48TQNBUymiW+ECMSzwIb1vG8KXjECm2txIzcjvgQVknLGaS3C710Ny7VlblbxOyng8gfFlUZl3v9CwwKiwyHl+KRAhTOxlfQW88Vu6IBY1g6IcTVWBFlEJNqB2VGDX3p+mU4HOmiO7Q2gUUDD5c0sNQ0Od2q/aEPlnCGYJcRCtm0Gw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cgzDF6cDLz2yZ6
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Oct 2025 01:34:20 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3E0591424;
	Tue,  7 Oct 2025 07:33:39 -0700 (PDT)
Received: from [10.44.160.66] (e126510-lin.lund.arm.com [10.44.160.66])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 804133F738;
	Tue,  7 Oct 2025 07:33:45 -0700 (PDT)
Message-ID: <4001ebcc-7516-4bea-a920-8750f029b442@arm.com>
Date: Tue, 7 Oct 2025 16:33:42 +0200
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
Subject: Re: [PATCH 6/6] powerpc/64s: Do not re-activate batched TLB flush
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
References: <cover.1749747752.git.agordeev@linux.ibm.com>
 <8625a1d97dcf4ae499b4bb341e27346f768a7248.1749747752.git.agordeev@linux.ibm.com>
 <aFGFl9Dvb9zdC3JS@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
 <ef5d851b-0f67-410e-9479-0f6d344fa17b@arm.com>
 <68e4e0f8.050a0220.1e89ea.1c6f@mx.google.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <68e4e0f8.050a0220.1e89ea.1c6f@mx.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 07/10/2025 11:40, Ritesh Harjani (IBM) wrote:
> Kevin Brodsky <kevin.brodsky@arm.com> writes:
>
>> On 17/06/2025 17:11, Alexander Gordeev wrote:
>>> On Thu, Jun 12, 2025 at 07:36:13PM +0200, Alexander Gordeev wrote:
>>>> Since commit b9ef323ea168 ("powerpc/64s: Disable preemption in hash
>>>> lazy mmu mode") a task can not be preempted while in lazy MMU mode.
>>>> Therefore, the batch re-activation code is never called, so remove it.
>>>>
>>>> Signed-off-by: Alexander Gordeev <agordeev@linux.ibm.com>
>>>> ---
>>>>  arch/powerpc/include/asm/thread_info.h |  2 --
>>>>  arch/powerpc/kernel/process.c          | 25 -------------------------
>>>>  2 files changed, 27 deletions(-)
>>> Hi All,
>>>
>>> (I trimmed non-ppc mailing lists/people).
>>>
>>> The whole series does not seem to make it, but this patch alone is still
>>> applicable and makes sence, if I am not mistaken.
>> Yes, I agree. I arrived at the same conclusion working on the next
>> version of the nested lazy_mmu series [1].
>> [1]
>> https://lore.kernel.org/all/20250908073931.4159362-1-kevin.brodsky@arm.com/
> Yes, we disable preemption while in lazy mmu mode for Hash, so I agree that
> we won't call into __switch_to() in between preempt_disable()/_enable().
> So it does look like that we don't need that code.

Thanks for confirming.

>> May I include this patch in v3?
>>
> That should be ok.

Thanks!

- Kevin

