Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 649405FAD7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2019 17:28:27 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45fhh83DdZzDqby
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jul 2019 01:28:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 45fhdp2xBLzDqZC
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Jul 2019 01:26:19 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8316F2B;
 Thu,  4 Jul 2019 08:26:17 -0700 (PDT)
Received: from [10.162.40.119] (p8cg001049571a15.blr.arm.com [10.162.40.119])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id
 3B3A43F703; Thu,  4 Jul 2019 08:26:13 -0700 (PDT)
Subject: Re: [PATCH V2] mm/ioremap: Probe platform for p4d huge map support
To: Andrew Morton <akpm@linux-foundation.org>
References: <1561699231-20991-1-git-send-email-anshuman.khandual@arm.com>
 <20190702160630.25de5558e9fe2d7d845f3472@linux-foundation.org>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <fbc147c7-bec2-daed-b828-c4ae170010a9@arm.com>
Date: Thu, 4 Jul 2019 20:56:40 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190702160630.25de5558e9fe2d7d845f3472@linux-foundation.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, x86@kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Will Deacon <will.deacon@arm.com>,
 Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org,
 Ingo Molnar <mingo@redhat.com>, linux-arm-kernel@lists.infradead.org,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev@lists.ozlabs.org,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 07/03/2019 04:36 AM, Andrew Morton wrote:
> On Fri, 28 Jun 2019 10:50:31 +0530 Anshuman Khandual <anshuman.khandual@arm.com> wrote:
> 
>> Finishing up what the commit c2febafc67734a ("mm: convert generic code to
>> 5-level paging") started out while levelling up P4D huge mapping support
>> at par with PUD and PMD. A new arch call back arch_ioremap_p4d_supported()
>> is being added which just maintains status quo (P4D huge map not supported)
>> on x86, arm64 and powerpc.
> 
> Does this have any runtime effects?  If so, what are they and why?  If
> not, what's the actual point?

It just finishes up what the previous commit c2febafc67734a ("mm: convert
generic code to 5-level paging") left off with respect p4d based huge page
enablement for ioremap. When HAVE_ARCH_HUGE_VMAP is enabled its just a simple
check from the arch about the support, hence runtime effects are minimal.
