Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 353D066792
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2019 09:17:04 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45lPPT4GTyzDqtN
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2019 17:17:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45lPBt3CR3zDqs2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jul 2019 17:07:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45lPBs30dBz9s00;
 Fri, 12 Jul 2019 17:07:49 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH V2] mm/ioremap: Probe platform for p4d huge map support
In-Reply-To: <fbc147c7-bec2-daed-b828-c4ae170010a9@arm.com>
References: <1561699231-20991-1-git-send-email-anshuman.khandual@arm.com>
 <20190702160630.25de5558e9fe2d7d845f3472@linux-foundation.org>
 <fbc147c7-bec2-daed-b828-c4ae170010a9@arm.com>
Date: Fri, 12 Jul 2019 17:07:48 +1000
Message-ID: <87tvbrennf.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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

Anshuman Khandual <anshuman.khandual@arm.com> writes:
> On 07/03/2019 04:36 AM, Andrew Morton wrote:
>> On Fri, 28 Jun 2019 10:50:31 +0530 Anshuman Khandual <anshuman.khandual@arm.com> wrote:
>> 
>>> Finishing up what the commit c2febafc67734a ("mm: convert generic code to
>>> 5-level paging") started out while levelling up P4D huge mapping support
>>> at par with PUD and PMD. A new arch call back arch_ioremap_p4d_supported()
>>> is being added which just maintains status quo (P4D huge map not supported)
>>> on x86, arm64 and powerpc.
>> 
>> Does this have any runtime effects?  If so, what are they and why?  If
>> not, what's the actual point?
>
> It just finishes up what the previous commit c2febafc67734a ("mm: convert
> generic code to 5-level paging") left off with respect p4d based huge page
> enablement for ioremap. When HAVE_ARCH_HUGE_VMAP is enabled its just a simple
> check from the arch about the support, hence runtime effects are minimal.

The return value of arch_ioremap_p4d_supported() is stored in the
variable ioremap_p4d_capable which is then returned by
ioremap_p4d_enabled().

That is used by ioremap_try_huge_p4d() called from ioremap_p4d_range()
from ioremap_page_range().

The runtime effect is that it prevents ioremap_page_range() from trying
to create huge mappings at the p4d level on arches that don't support
it.

cheers
