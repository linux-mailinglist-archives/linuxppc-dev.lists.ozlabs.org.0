Return-Path: <linuxppc-dev+bounces-14576-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DFB5C9E2D5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 03 Dec 2025 09:21:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dLrFT49P9z2yGx;
	Wed, 03 Dec 2025 19:21:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764750077;
	cv=none; b=GLhL9/kCfCexdav6mHvNCLLOnH/YgvHEAM3JpFS9rEnLn1RO6PqMkfy5AmD44ToF8i6UxH8UvHfPgd28TeTl1go9lLa7axmq50bQIDbX5abI28on7Y87yjiz+RVS/s5V95pHo7ckRxz1mCGF557+AAaSwqspzrw98zMQjrZSfylzmHHUST8gpoVI+3xM/rsFDo2/7o2Pe8NcCKPwyoyXYVKUm4bAN1vCDcSjC1YALwWUnoMfBCklY/7oNowA4hwIm3aUrzduO99LJRI39v3BOxb4CnBFxUlYI4x4UERCJtSGx8yz/5apxy36N/KtGbUGon2NU4w7bNfKwJ9wpzZF7w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764750077; c=relaxed/relaxed;
	bh=sJurdQX8qj6ifDDdWMxroqyLo5BS65+WtQIh7u6Nuto=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=irTWoNlmjR8LGf3Jp4IuQ1IrjE9bUEGJEWo4KgROBoZLuuCUQ+B/ffUhKgMw0OqMZMLsVw0R3I0yNz4dNUPqkHx16BnjFk5CNJ0ocgL6QX5IhmS+T7xScdebgaHMU7ATI09REDSWel/h2hAAbXS3c4Uy/gNyqPi8ML7ZhEMCJCpOPIvNs1IKxHBf3IupeyfruipSKi/Xmd0z0+1PE7T/AaD7Vf2kZZM2jFJR77rNkYyWe7xSqr5F3Y4rm7WQgpKVHzF7r78GmyTg5j/JlCPX2lgbu7C6VW4vGT/hqCGI9Xv+vvswqvXqZ4t5H/KJcCU3gS/fdqPBMW7vvfos8PyPvA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dLrFS4KJqz2y5T
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Dec 2025 19:21:16 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1B547339;
	Wed,  3 Dec 2025 00:20:38 -0800 (PST)
Received: from [10.57.45.92] (unknown [10.57.45.92])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 49CE33F73B;
	Wed,  3 Dec 2025 00:20:37 -0800 (PST)
Message-ID: <51339cdd-3c73-433c-abf7-24553e0fbd6b@arm.com>
Date: Wed, 3 Dec 2025 09:20:34 +0100
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
Subject: Re: [PATCH v5 06/12] mm: introduce generic lazy_mmu helpers
To: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, "David S. Miller"
 <davem@davemloft.net>, David Woodhouse <dwmw2@infradead.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
 Jann Horn <jannh@google.com>, Juergen Gross <jgross@suse.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Suren Baghdasaryan <surenb@google.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
 Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251124132228.622678-1-kevin.brodsky@arm.com>
 <20251124132228.622678-7-kevin.brodsky@arm.com>
 <07ffb66d-1e74-4634-bccb-75575b3862af-agordeev@linux.ibm.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <07ffb66d-1e74-4634-bccb-75575b3862af-agordeev@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 28/11/2025 14:50, Alexander Gordeev wrote:
> Would it make sense to explicitly describe the policy wrt sleeping while
> in lazy MMU mode? If I understand the conclusion of conversation right:
>
> * An arch implementation may disable preemption, but then it is arch
>   responsibility not to call any arch-specific code that might sleep;
> * As result, while in lazy MMU mode the generic code should never
>   call a code that might sleep;

I think that's a good summary, and I agree that the second point is not
obvious from the comment in <linux/pgtable.h>. This series it not making
any change in that respect, but I'll add a clarification in this patch
(or a separate patch).

- Kevin

