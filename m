Return-Path: <linuxppc-dev+bounces-13056-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1BABF0945
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Oct 2025 12:38:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cqsMy0Wcfz3020;
	Mon, 20 Oct 2025 21:38:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760956701;
	cv=none; b=RlS0K8tMM6moFcs8EGZPCAMwQxUipJwFT1MGEeCRIxo5fn+AMEF4edQV368r1ZkFO3BYp7nDM1NHtZcDa8Me9qFG9FJK8DakV2uQ88AEMIGHqLbpVFfQDFhc/hretvgPRdw7ZrC26hrGIAU9iFNTOrBhPY7GAKAHVpPIk8LjILXmbB1Ona6JMUd8kywH3nYvOOje89mGbdhz5a4Yqi3RMDJT/Wv6Oe8bD1n+lY2SkcVRMZSczCwpYf+1CRCDhtX0syEOPRC4hHgeCi8zBdFMcEJTnAngwdasYNirv43Xk6r8Cnm9orswZl2CMbHavXaTnyhksVStjH07hR1h1PHpBw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760956701; c=relaxed/relaxed;
	bh=pyqZHguj4pWVxVzjCwOW7QzekGnxMtJdbRxBmWKZji0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M1NUUbVYVJtfDYvglhoEf+6mV1H9B6BzxTg7rtfuSGm46gwm/NaCMbjWhXIH44Bwf43i6qwK7SOm/6smnYjasBO0s8sE7hgxCtGMe0Tyl6dkF//vFBgVVeibtaattiBF5ixh04vj6Q4cx5EMKKoVaO5nq00fDkbJjqnnDB928x4vrn/CTAGhPJPZj6v8sOp5Io2PeM0SCIuAq2vedUpIbZWGiChbg7ziUxDTcyrXqC2llpUONdby+gVgSIe4MQrJS2+uehcE55xyO2OmK1wUEBEsQ7CxMf0ccxQ1LHwjFSQdMZyGUz1ghaf9SstB2RQTpBfS1jp78whUD6AyT2hKvw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cqsMx2tWMz2ygH
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Oct 2025 21:38:21 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6116D1063;
	Mon, 20 Oct 2025 03:37:42 -0700 (PDT)
Received: from [10.57.65.147] (unknown [10.57.65.147])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DB2C53F63F;
	Mon, 20 Oct 2025 03:37:41 -0700 (PDT)
Message-ID: <3836a43f-809e-419d-a85d-74606d9daa0f@arm.com>
Date: Mon, 20 Oct 2025 12:37:38 +0200
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
Subject: Re: [PATCH v3 05/13] mm: introduce CONFIG_ARCH_LAZY_MMU
To: Mike Rapoport <rppt@kernel.org>
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
 <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Nicholas Piggin <npiggin@gmail.com>, Peter Zijlstra <peterz@infradead.org>,
 Ryan Roberts <ryan.roberts@arm.com>, Suren Baghdasaryan <surenb@google.com>,
 Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251015082727.2395128-1-kevin.brodsky@arm.com>
 <20251015082727.2395128-6-kevin.brodsky@arm.com>
 <aPNjd2dg3YN-TZKH@kernel.org>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <aPNjd2dg3YN-TZKH@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 18/10/2025 11:52, Mike Rapoport wrote:
>> @@ -231,7 +231,7 @@ static inline int pmd_dirty(pmd_t pmd)
>>   * held, but for kernel PTE updates, no lock is held). Nesting is not permitted
>>   * and the mode cannot be used in interrupt context.
>>   */
>> -#ifndef __HAVE_ARCH_ENTER_LAZY_MMU_MODE
>> +#ifndef CONFIG_ARCH_LAZY_MMU
>>  static inline void arch_enter_lazy_mmu_mode(void) {}
>>  static inline void arch_leave_lazy_mmu_mode(void) {}
>>  static inline void arch_flush_lazy_mmu_mode(void) {}
>> diff --git a/mm/Kconfig b/mm/Kconfig
>> index 0e26f4fc8717..2fdcb42ca1a1 100644
>> --- a/mm/Kconfig
>> +++ b/mm/Kconfig
>> @@ -1372,6 +1372,9 @@ config PT_RECLAIM
>>  config FIND_NORMAL_PAGE
>>  	def_bool n
>>  
>> +config ARCH_LAZY_MMU
>> +	bool
>> +
> I think a better name would be ARCH_HAS_LAZY_MMU and the config option fits
> better to arch/Kconfig.

Sounds fine by me - I'm inclined to make it slightly longer still,
ARCH_HAS_LAZY_MMU_MODE, to avoid making "LAZY_MMU" sound like some HW
feature.

- Kevin

