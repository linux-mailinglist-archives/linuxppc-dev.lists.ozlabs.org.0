Return-Path: <linuxppc-dev+bounces-11752-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 57EDFB44954
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Sep 2025 00:15:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cHv1W0kySz2xcC;
	Fri,  5 Sep 2025 08:15:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757024126;
	cv=none; b=cCF1os+V6rvT0akrjibxmDeJ6sawTLqEn2MD0oLBI3YEQpY9GHPmWraKCwoxCCrDVz7Eyh2LR1Lmj00CBIHZKQJ0swi7kq4wCVSVLbXWSitBcMDezqQrMm2tSzROf7juClOu4pgu22WWXPn8Wt/KK/dtrWbLg+ZVovuU1vDqADLdCJJ/nNt+A5xr2a6mHnKCf8gt+xaP6I5LqOV0Tk1LMUZaaDUD4/CinoqLv9dRNiTcB8l2RbpdPu98OZpmM631gAY8rBCJ54qU2nVCXqwQyRldJc/SB0xLwumVNWfwoyRnYXXk9pb+ldxiU1/i4ZBzmOKlkpY1jqocetSjH7+6MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757024126; c=relaxed/relaxed;
	bh=O1s9lw6tbe2htYbahVRtjD5lIa+YY9RGI9knjEL6DjU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=brhb20rDxFcVd6m9oCYoiiQW3iDuX2hvvBQZ1ae2Mf+50s3nvrwrJ0hTpZsQWyzAiYIVrFnxdllFd9kHPbhNaxQ3uXX7cWbEElzeSYPlP/dHBfbr4bbaBJNe4LUKjIsZxhKLHIHXc3qaNJTkVMDEKMMzg5pu9P7YQQ6bRqIBf9aPvdzBWbj5VRlDXjmJgFxs2lf3d8J1xMSNGm8YBuBQB+0OEZscXoidmAlYRr/vePjb56D504EGdCMkedy/+Oaw6iCHjK6CuOMWzybXgshatzse/Spo5A+GN3f7IJ206FNWND4FT0UdWDQPRDhnG1N61FVysZSmT4HrsdCefY/O6A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cHv1V10SNz2xQ2
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Sep 2025 08:15:24 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2977D1596;
	Thu,  4 Sep 2025 15:14:43 -0700 (PDT)
Received: from [10.57.58.14] (unknown [10.57.58.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 46B793F63F;
	Thu,  4 Sep 2025 15:14:44 -0700 (PDT)
Message-ID: <75db1f58-98b3-463c-af4f-2ce9878cba9f@arm.com>
Date: Fri, 5 Sep 2025 00:14:39 +0200
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
Subject: Re: [PATCH 2/7] mm: introduce local state for lazy_mmu sections
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, "David S. Miller"
 <davem@davemloft.net>, "H. Peter Anvin" <hpa@zytor.com>,
 Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>,
 Juergen Gross <jgross@suse.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner
 <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org
References: <20250904125736.3918646-1-kevin.brodsky@arm.com>
 <20250904125736.3918646-3-kevin.brodsky@arm.com>
 <22131943-3f92-4f5a-be28-7b668c07a25c@lucifer.local>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <22131943-3f92-4f5a-be28-7b668c07a25c@lucifer.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 04/09/2025 19:28, Lorenzo Stoakes wrote:
> Hi Kevin,
>
> This is causing a build failure:
>
> In file included from ./include/linux/mm.h:31,
>                  from mm/userfaultfd.c:8:
> mm/userfaultfd.c: In function ‘move_present_ptes’:
> ./include/linux/pgtable.h:247:41: error: statement with no effect [-Werror=unused-value]
>   247 | #define arch_enter_lazy_mmu_mode()      (LAZY_MMU_DEFAULT)
>       |                                         ^
> mm/userfaultfd.c:1103:9: note: in expansion of macro ‘arch_enter_lazy_mmu_mode’
>  1103 |         arch_enter_lazy_mmu_mode();
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~
> ./include/linux/pgtable.h:248:54: error: expected expression before ‘)’ token
>   248 | #define arch_leave_lazy_mmu_mode(state) ((void)(state))
>       |                                                      ^
> mm/userfaultfd.c:1141:9: note: in expansion of macro ‘arch_leave_lazy_mmu_mode’
>  1141 |         arch_leave_lazy_mmu_mode();
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~
>
> It seems you haven't carefully checked call sites here, please do very
> carefully recheck these - I see Yeoreum reported a mising kasan case, so I
> suggest you just aggressively grep this + make sure you've covered all
> bases :)

I did check all call sites pretty carefully and of course build-tested,
but my series is based on v6.17-rc4 - just like the calls Yeoreum
mentioned, the issue is that those calls are in mm-stable but not in
mainline :/ I suppose I should post a v2 rebased on mm-stable ASAP then?

- Kevin

