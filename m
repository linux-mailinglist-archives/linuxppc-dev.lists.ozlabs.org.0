Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A07E9325DD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2024 13:42:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WNccC1ZmVz3fK8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2024 21:42:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=anshuman.khandual@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WNcbp1kYtz30T1
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2024 21:41:38 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B19091063;
	Tue, 16 Jul 2024 04:41:30 -0700 (PDT)
Received: from [10.163.52.225] (unknown [10.163.52.225])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BB35A3F766;
	Tue, 16 Jul 2024 04:40:54 -0700 (PDT)
Message-ID: <c6812a96-4a29-40de-8ed7-e98b193121a0@arm.com>
Date: Tue, 16 Jul 2024 17:10:50 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 17/29] arm64: implement PKEYS support
To: Kevin Brodsky <kevin.brodsky@arm.com>, Joey Gouly <joey.gouly@arm.com>,
 linux-arm-kernel@lists.infradead.org
References: <20240503130147.1154804-1-joey.gouly@arm.com>
 <20240503130147.1154804-18-joey.gouly@arm.com>
 <18aee949-7e07-45e1-85c8-c990f017f305@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <18aee949-7e07-45e1-85c8-c990f017f305@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: szabolcs.nagy@arm.com, catalin.marinas@arm.com, dave.hansen@linux.intel.com, linux-mm@kvack.org, hpa@zytor.com, shuah@kernel.org, maz@kernel.org, x86@kernel.org, christophe.leroy@csgroup.eu, aneesh.kumar@kernel.org, mingo@redhat.com, naveen.n.rao@linux.ibm.com, will@kernel.org, npiggin@gmail.com, broonie@kernel.org, bp@alien8.de, kvmarm@lists.linux.dev, tglx@linutronix.de, oliver.upton@linux.dev, aneesh.kumar@linux.ibm.com, linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 7/9/24 18:37, Kevin Brodsky wrote:
> On 03/05/2024 15:01, Joey Gouly wrote:
>> @@ -267,6 +294,28 @@ static inline unsigned long mm_untag_mask(struct mm_struct *mm)
>>  	return -1UL >> 8;
>>  }
>>  
>> +/*
>> + * We only want to enforce protection keys on the current process
>> + * because we effectively have no access to POR_EL0 for other
>> + * processes or any way to tell *which * POR_EL0 in a threaded
>> + * process we could use.
> 
> I see that this comment is essentially copied from x86, but to me it
> misses the main point. Even with only one thread in the target process
> and a way to obtain its POR_EL0, it still wouldn't make sense to check
> that value. If we take the case of a debugger accessing an inferior via
> ptrace(), for instance, the kernel is asked to access some memory in
> another mm. However, the debugger's POR_EL0 is tied to its own address
> space, and the target's POR_EL0 is relevant to its own execution flow
> only. In such situations, there is essentially no user context for the
> access, so It fundamentally does not make sense to make checks based on
> pkey/POE or similar restrictions to memory accesses (e.g. MTE).

Indeed this makes more sense. There is no memory context even if there is
access to another POR_EL0. The comment above could be improved describing
this limitation.
