Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A61A695C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 15:08:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46N6gx3DnWzDqS6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 23:07:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=permerror (mailfrom)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46N6cT3YqSzDqGk
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Sep 2019 23:04:55 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x83D4XqU001876;
 Tue, 3 Sep 2019 08:04:33 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id x83D4VSl001875;
 Tue, 3 Sep 2019 08:04:31 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Tue, 3 Sep 2019 08:04:31 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: "Alastair D'Silva" <alastair@au1.ibm.com>
Subject: Re: [PATCH v2 3/6] powerpc: Convert flush_icache_range & friends to C
Message-ID: <20190903130430.GC31406@gate.crashing.org>
References: <20190903052407.16638-1-alastair@au1.ibm.com>
 <20190903052407.16638-4-alastair@au1.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190903052407.16638-4-alastair@au1.ibm.com>
User-Agent: Mutt/1.4.2.3i
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
Cc: David Hildenbrand <david@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, Mike Rapoport <rppt@linux.vnet.ibm.com>,
 Paul Mackerras <paulus@samba.org>, alastair@d-silva.org, Qian Cai <cai@lca.pw>,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Allison Randal <allison@lohutok.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi!

On Tue, Sep 03, 2019 at 03:23:57PM +1000, Alastair D'Silva wrote:
> diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c

> +#if !defined(CONFIG_PPC_8xx) & !defined(CONFIG_PPC64)

Please write that as &&?  That is more usual, and thus, easier to read.

> +static void flush_dcache_icache_phys(unsigned long physaddr)

> +	asm volatile(
> +		"   mtctr %2;"
> +		"   mtmsr %3;"
> +		"   isync;"
> +		"0: dcbst   0, %0;"
> +		"   addi    %0, %0, %4;"
> +		"   bdnz    0b;"
> +		"   sync;"
> +		"   mtctr %2;"
> +		"1: icbi    0, %1;"
> +		"   addi    %1, %1, %4;"
> +		"   bdnz    1b;"
> +		"   sync;"
> +		"   mtmsr %5;"
> +		"   isync;"
> +		: "+r" (loop1), "+r" (loop2)
> +		: "r" (nb), "r" (msr), "i" (bytes), "r" (msr0)
> +		: "ctr", "memory");

This outputs as one huge assembler statement, all on one line.  That's
going to be fun to read or debug.

loop1 and/or loop2 can be assigned the same register as msr0 or nb.  They
need to be made earlyclobbers.  (msr is fine, all of its reads are before
any writes to loop1 or loop2; and bytes is fine, it's not a register).


Segher
