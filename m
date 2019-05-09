Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D85F318CA9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2019 17:05:13 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 450GqC23FkzDqQD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 May 2019 01:05:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=arm.com
 (client-ip=217.140.101.70; helo=foss.arm.com;
 envelope-from=steven.price@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.101.70])
 by lists.ozlabs.org (Postfix) with ESMTP id 450Gnp4NwKzDqLS
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 May 2019 01:03:51 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2EEA7374;
 Thu,  9 May 2019 08:03:49 -0700 (PDT)
Received: from [10.1.196.69] (e112269-lin.cambridge.arm.com [10.1.196.69])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 52BDD3F6C4;
 Thu,  9 May 2019 08:03:45 -0700 (PDT)
Subject: Re: [PATCH v8 05/20] KVM: PPC: Book3S HV: Remove pmd_is_leaf()
To: Paul Mackerras <paulus@ozlabs.org>
References: <20190403141627.11664-1-steven.price@arm.com>
 <20190403141627.11664-6-steven.price@arm.com>
 <20190429020555.GB11154@blackberry>
From: Steven Price <steven.price@arm.com>
Message-ID: <bf689c22-92ab-e0bf-65d8-9cd495d9e6e1@arm.com>
Date: Thu, 9 May 2019 16:03:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190429020555.GB11154@blackberry>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
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
Cc: Mark Rutland <Mark.Rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Will Deacon <will.deacon@arm.com>,
 linux-mm@kvack.org, "H. Peter Anvin" <hpa@zytor.com>, "Liang,
 Kan" <kan.liang@linux.intel.com>, x86@kernel.org,
 Ingo Molnar <mingo@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
 kvm-ppc@vger.kernel.org, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>, linux-kernel@vger.kernel.org,
 James Morse <james.morse@arm.com>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 29/04/2019 03:05, Paul Mackerras wrote:
> On Wed, Apr 03, 2019 at 03:16:12PM +0100, Steven Price wrote:
>> Since pmd_large() is now always available, pmd_is_leaf() is redundant.
>> Replace all uses with calls to pmd_large().
> 
> NAK.  I don't want to do this, because pmd_is_leaf() is purely about
> the guest page tables (the "partition-scoped" radix tree which
> specifies the guest physical to host physical translation), not about
> anything to do with the Linux process page tables.  The guest page
> tables have the same format as the Linux process page tables, but they
> are managed separately.

Fair enough, I'll drop this patch in the next posting.

> If it makes things clearer, I could rename it to "guest_pmd_is_leaf()"
> or something similar.

I'll leave that decision up to you - it might prevent similar confusion
in the future.

Steve
