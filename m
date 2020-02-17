Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D74E6160E84
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Feb 2020 10:29:39 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Ldwx1GLDzDqrX
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Feb 2020 20:29:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 48LdvF55h5zDqjT
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Feb 2020 20:28:08 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CE993328;
 Mon, 17 Feb 2020 01:28:06 -0800 (PST)
Received: from [10.162.16.95] (p8cg001049571a15.blr.arm.com [10.162.16.95])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 23A033F6CF;
 Mon, 17 Feb 2020 01:28:00 -0800 (PST)
Subject: Re: [PATCH 2/5] mm/vma: Make vma_is_accessible() available for
 general use
To: linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <1581915833-21984-1-git-send-email-anshuman.khandual@arm.com>
 <1581915833-21984-3-git-send-email-anshuman.khandual@arm.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <1d28a706-3232-2660-f2f2-2faca999a3ff@arm.com>
Date: Mon, 17 Feb 2020 14:58:01 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1581915833-21984-3-git-send-email-anshuman.khandual@arm.com>
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
Cc: Rich Felker <dalias@libc.org>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Paul Burton <paulburton@kernel.org>, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mips@vger.kernel.org,
 Guo Ren <guoren@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 linux-m68k@lists.linux-m68k.org, Ingo Molnar <mingo@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Ralf Baechle <ralf@linux-mips.org>,
 Andy Lutomirski <luto@kernel.org>, Paul Mackerras <paulus@samba.org>,
 Thomas Gleixner <tglx@linutronix.de>, Steven Rostedt <rostedt@goodmis.org>,
 Andrew Morton <akpm@linux-foundation.org>, Mel Gorman <mgorman@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 02/17/2020 10:33 AM, Anshuman Khandual wrote:
> Lets move vma_is_accessible() helper to include/linux/mm.h which makes it
> available for general use. While here, this replaces all remaining open
> encodings for VMA access check with vma_is_accessible().
> 
> Cc: Guo Ren <guoren@kernel.org>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: Paul Burton <paulburton@kernel.org>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
> Cc: Rich Felker <dalias@libc.org>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: Andy Lutomirski <luto@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Steven Rostedt <rostedt@goodmis.org>
> Cc: Mel Gorman <mgorman@suse.de>
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-m68k@lists.linux-m68k.org
> Cc: linux-mips@vger.kernel.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-sh@vger.kernel.org
> Cc: linux-mm@kvack.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
>  arch/csky/mm/fault.c    | 2 +-
>  arch/m68k/mm/fault.c    | 2 +-
>  arch/mips/mm/fault.c    | 2 +-
>  arch/powerpc/mm/fault.c | 2 +-
>  arch/sh/mm/fault.c      | 2 +-
>  arch/x86/mm/fault.c     | 2 +-
>  include/linux/mm.h      | 5 +++++
>  kernel/sched/fair.c     | 2 +-
>  mm/gup.c                | 2 +-
>  mm/memory.c             | 5 -----
>  mm/mempolicy.c          | 3 +--
>  11 files changed, 14 insertions(+), 15 deletions(-)

There are couple of places in mm/mmap.c which could use vma_is_accessible()
as well. Probably missed them, as the order of the VMA flags were different.
Will fold the following changes next time around.

diff --git a/mm/mmap.c b/mm/mmap.c
index 6756b8bb0033..9b9bb4031fd4 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -2338,8 +2338,7 @@ int expand_upwards(struct vm_area_struct *vma, unsigned long address)
                gap_addr = TASK_SIZE;
 
        next = vma->vm_next;
-       if (next && next->vm_start < gap_addr &&
-                       (next->vm_flags & (VM_WRITE|VM_READ|VM_EXEC))) {
+       if (next && next->vm_start < gap_addr && vma_is_accessible(next)) {
                if (!(next->vm_flags & VM_GROWSUP))
                        return -ENOMEM;
                /* Check that both stack segments have the same anon_vma? */
@@ -2420,7 +2419,7 @@ int expand_downwards(struct vm_area_struct *vma,
        prev = vma->vm_prev;
        /* Check that both stack segments have the same anon_vma? */
        if (prev && !(prev->vm_flags & VM_GROWSDOWN) &&
-                       (prev->vm_flags & (VM_WRITE|VM_READ|VM_EXEC))) {
+                       vma_is_accessible(prev)) {
                if (address - prev->vm_end < stack_guard_gap)
                        return -ENOMEM;
        }
