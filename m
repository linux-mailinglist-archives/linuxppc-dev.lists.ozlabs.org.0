Return-Path: <linuxppc-dev+bounces-7407-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D9740A772DB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Apr 2025 04:52:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZRXbT6W6wz2ySV;
	Tue,  1 Apr 2025 13:52:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743475941;
	cv=none; b=FztUmA/++aKAZCz4w/hj4HyAazRX2HQC9fVv0KUz6a6gpE2FGmuntNOo9Q2TWE5ITt2ODTLO5Qby9e8uxa+fpv4VIdRcHMilcqO24a/8uB/c162T5hVCmfjj1EqRW8g5YIsRqH8KCt79GytcIeR8R47PYTTWWz/rI8K/TEJlZDMLTk3j+FzF15HeYFVGUyEAbou4xQO8W/ImhFhe+1Xb35m18qHDiUUm66vGYkyQ77Tpar0I4ol7uAJOX1O++2bDUtZGm5mZz2c5fd0hT3HPOMsZSHBTyxmxq9RTxBlgTDy1oYfTeVyqBRztYmFzGvl3DXfvaLVANtfDYuXJURuUmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743475941; c=relaxed/relaxed;
	bh=GqouJgKo210/9lrjN1oAiWU6v4/ZZ2aGyt53puDEx8s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BhNAASSEI58H37XyEBl3gP+PP62hYzabh0CbGmpVFnHqUq+q36WbnpwHlrXwZ7EIVo7mQtADvnI4nx42WUzeGtWIq5P3fVW9+Zs8gHA+X7FX4kBHMmzjzDXMgp/cxU5HcakPHeYYJYhAM7W7fbcXo7b3Q+b3EAdSDqjbwK10JgQeSSnxAu/OQaIg8kkw5Rsb7Qf5Lj9ra28Vuw+egkJNcsXLJyzf5j+B84kNafButvt0jLuSMkWeUw9fsAKqgpaiUtvEuNDHrSX2yKKHFt+J1zawhG7EEF3bZYtfFAwTihlcq6FAj8JAynx+f59J7UMlxu5qIqK4tFt1+8JkL772+w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=anshuman.khandual@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=anshuman.khandual@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZRXbS67Zlz2yLB
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Apr 2025 13:52:19 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9F36714BF;
	Mon, 31 Mar 2025 19:51:49 -0700 (PDT)
Received: from [10.162.16.153] (unknown [10.162.16.153])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 018F23F59E;
	Mon, 31 Mar 2025 19:51:39 -0700 (PDT)
Message-ID: <86a276d6-afe3-4c70-aa85-7cafe33b8e5c@arm.com>
Date: Tue, 1 Apr 2025 08:21:36 +0530
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] mm/ptdump: Split note_page() into level specific
 callbacks
To: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: linux-mm@kvack.org, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Steven Price <steven.price@arm.com>,
 Ryan Roberts <ryan.roberts@arm.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org
References: <20250317061818.16244-1-anshuman.khandual@arm.com>
 <20250317061818.16244-2-anshuman.khandual@arm.com>
 <Z+pZX2QmFnNnnjZ5@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <Z+pZX2QmFnNnnjZ5@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 3/31/25 14:29, Alexander Gordeev wrote:
> On Mon, Mar 17, 2025 at 11:48:17AM +0530, Anshuman Khandual wrote:
> 
> Hi Anshuman,
> 
> ...
>> --- a/include/linux/ptdump.h
>> +++ b/include/linux/ptdump.h
>> @@ -11,9 +11,12 @@ struct ptdump_range {
>>  };
>>  
>>  struct ptdump_state {
>> -	/* level is 0:PGD to 4:PTE, or -1 if unknown */
>> -	void (*note_page)(struct ptdump_state *st, unsigned long addr,
>> -			  int level, u64 val);
>> +	void (*note_page_pte)(struct ptdump_state *st, unsigned long addr, pte_t pte);
>> +	void (*note_page_pmd)(struct ptdump_state *st, unsigned long addr, pmd_t pmd);
>> +	void (*note_page_pud)(struct ptdump_state *st, unsigned long addr, pud_t pud);
>> +	void (*note_page_p4d)(struct ptdump_state *st, unsigned long addr, p4d_t p4d);
>> +	void (*note_page_pgd)(struct ptdump_state *st, unsigned long addr, pgd_t pgd);
>> +	void (*note_page_flush)(struct ptdump_state *st);
>>  	void (*effective_prot)(struct ptdump_state *st, int level, u64 val);
> 
> Should you treat effective_prot() similarly?

Agreed. effective_prot() also uses pxd_val() derived data type in generic MM and
might cause the same problem later going ahead. Will split the helper into level
specific callbacks as well.

> 
>>  	const struct ptdump_range *range;
>>  };

