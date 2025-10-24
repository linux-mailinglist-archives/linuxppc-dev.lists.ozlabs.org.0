Return-Path: <linuxppc-dev+bounces-13268-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 614A0C0633D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Oct 2025 14:17:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ctMNZ25l7z3cZf;
	Fri, 24 Oct 2025 23:17:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761308254;
	cv=none; b=nZwlJ/nNbX8b6bBvJ438AleR/EERAKf8y6NSuxyEDRwwO4GXQ//knCoBngZx6m/C+kY6dSU1dOSqVUqA8GboDfYMAV6ybSszbpw9IqCDm6DHm35gaN7U65YSLgEGQqKKCstu54crO/vz9yX3x42XqtcY9eZXbsageH8OIl5PZe6AWhaG9MYLh1KKIZIMkTe9Gxw1nwmN9eCXuvsltmGVc5DJYCnt96wyhYfenb1qZ3EnR5mRnQEgapnlb7IEZeVaOLZ9gGWbrFqwJtMJXcLImMv0Wm2t1QyAE/7Q3tdR96Lsq3Wx5jwB+inXsoCaDvJ4UOZ3zN7KYchQkjCRn48Wcw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761308254; c=relaxed/relaxed;
	bh=cvFdvuPr794gDedSFsrccdsdKFYkvyjvhZA7QrQhBgQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gvebD2BpslwHMYUVGojNiVE+pCBQzsF2FG5cAbqzJounhjdKUF8fXSs/jKRhMke96xKkKl9TReJN5uKpdtV4rUm2nVTMhYGLlkL9kKC934JFGkr4AxSOUXoNVnVObvUSwK5NmN1sysSOmeh0yzNmJF2JMSRVxhoGaP/k49E5SibTDtBOU4G/U1VOuwBkoqmCT+CwKENUvjBKx40cRKIT2esbYHmDkJdw7CdaO1vDCLMO05J8kBIZGzpbb/Mg2ea2Z2FtOSevceUlEZnRN8WTASWyRhjit/2B2XzB7ggG9czMyPhJ/d0RcBIvIg9vaMuEKQma5ZnOA/JqwW9pcd31dQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ctMNY5BTbz3cZY
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Oct 2025 23:17:33 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 03DAB1D34;
	Fri, 24 Oct 2025 05:16:55 -0700 (PDT)
Received: from [10.44.160.74] (e126510-lin.lund.arm.com [10.44.160.74])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 44C443F66E;
	Fri, 24 Oct 2025 05:16:55 -0700 (PDT)
Message-ID: <451403ce-f250-44ac-8e2f-b7b27ee9f588@arm.com>
Date: Fri, 24 Oct 2025 14:16:52 +0200
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
Subject: Re: [PATCH v3 09/13] powerpc/mm: replace batch->active with
 in_lazy_mmu_mode()
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
 <20251015082727.2395128-10-kevin.brodsky@arm.com>
 <8d5243ec-3edd-49a6-ab51-16643a709d84@redhat.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <8d5243ec-3edd-49a6-ab51-16643a709d84@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 23/10/2025 22:02, David Hildenbrand wrote:
> On 15.10.25 10:27, Kevin Brodsky wrote:
>> The generic lazy_mmu layer now tracks whether a task is in lazy MMU
>> mode. As a result we no longer need to track whether the per-CPU TLB
>> batch struct is active - we know it is if in_lazy_mmu_mode() returns
>> true.
>
> It's worth adding that disabling preemption while enabled makes sure
> that we cannot reschedule while in lazy MMU mode, so when the per-CPU
> TLB batch structure is active.

Yes good point, otherwise this change doesn't make sense. I'll add that.

- Kevin

