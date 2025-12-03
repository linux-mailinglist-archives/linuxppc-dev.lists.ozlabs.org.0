Return-Path: <linuxppc-dev+bounces-14577-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8EEC9E2E1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 03 Dec 2025 09:21:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dLrFv5MRwz30HQ;
	Wed, 03 Dec 2025 19:21:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764750099;
	cv=none; b=W3mozXc3G0GNI9MfnEy89QOfmdzfcJAK2zQsgJaz44LT3hSmWDpZZdnyWSAEkcbbVteFtJBr09UTv0RmLbg5SJUX/2ery1L9zu1gq1h1vvrU9xWbLVdA9bVMG8KpvIIhI0l1GQ/LS88nQ448SpBj9rIaBcS5ViBieMAqm8CNQ1284aUg4+zRAYBSqW4Q/zIXVKS4tlDcx+9q4qtkerWirGhkJnTPt/yYBLSEvmYU94ZvJK72a71PELyQ7VyASPqjCIFBc3jLsBIWVzIyEXqkzIQ7JdLeVIeDMrTa4MROp1OBcFmdsFHcW6NeT/RxnaPbH0UAe0gUxllL3VnRul2g7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764750099; c=relaxed/relaxed;
	bh=e8MuL9dN4W4aZAtBVVyLVjE13/XsnSiE2gy07VCOnSE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hadPjByQWO4Dr+evNbIXgbYNgY+ykzcTSGL1SrjOCe0AORaQ4cEg2wCt0phi45i6rvxwa696QmScuQTDhIij3jSD4+fx2BD+STU2hLldZZDJvPH2L4ZLvT0OCGqOsZ5Zt0SNdkP/DBdj7Kfn6/zOpVbOpUsDWldSQdLWekx7Vq+z5gYM++DxEE6RlstMyj4ywMe5lpY8iRxK5nCnwoeCkV1VBkcadpZ3pHftm4GQfjSE8WjMmAjLvUia6yUH4vuvriTSyyIXGzA4I1y8z21FwkEK20F8aCt2rhu+kFN9T8eZVkltfnavzQmsQHtKn7TIMbzj5AJNoHOui0sluvsraA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dLrFv1FkBz2yvb
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Dec 2025 19:21:39 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CDA3E1477;
	Wed,  3 Dec 2025 00:21:00 -0800 (PST)
Received: from [10.57.45.92] (unknown [10.57.45.92])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 23FCA3F73B;
	Wed,  3 Dec 2025 00:20:59 -0800 (PST)
Message-ID: <703cbee6-a813-4970-9232-34ee91ed8961@arm.com>
Date: Wed, 3 Dec 2025 09:20:57 +0100
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
Subject: Re: [PATCH v5 08/12] mm: enable lazy_mmu sections to nest
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
 <20251124132228.622678-9-kevin.brodsky@arm.com>
 <23dcf752-0b75-45a7-84f8-25bddf97af08-agordeev@linux.ibm.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <23dcf752-0b75-45a7-84f8-25bddf97af08-agordeev@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 28/11/2025 14:55, Alexander Gordeev wrote:
>> + * in_lazy_mmu_mode() can be used to check whether the lazy MMU mode is
>> + * currently enabled.
> The in_lazy_mmu_mode() name looks ambiguous to me. When the lazy MMU mode
> is paused are we still in lazy MMU mode? The __task_lazy_mmu_mode_active()
> implementation suggests we are not, while one could still assume we are,
> just paused.
>
> Should in_lazy_mmu_mode() be named e.g. as in_active_lazy_mmu_mode() such
> a confusion would not occur in the first place.

I see your point, how about is_lazy_mmu_mode_active()?

- Kevin

