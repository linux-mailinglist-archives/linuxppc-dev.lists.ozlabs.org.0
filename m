Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7214E3E10C0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Aug 2021 11:03:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GgN2B38VJz3d8J
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Aug 2021 19:03:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GgN1p3PpGz304T
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Aug 2021 19:03:22 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4GgN1g2Hqlz9sWG;
 Thu,  5 Aug 2021 11:03:19 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sdqix22qHvS0; Thu,  5 Aug 2021 11:03:19 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4GgN1g13l5z9sWF;
 Thu,  5 Aug 2021 11:03:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id ED34F8B7BE;
 Thu,  5 Aug 2021 11:03:18 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id RauWxehkW-8Y; Thu,  5 Aug 2021 11:03:18 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3E2618B7BD;
 Thu,  5 Aug 2021 11:03:18 +0200 (CEST)
Subject: Re: [PATCH v5 0/8] Use per-CPU temporary mappings for patching on
 Radix MMU
To: "Christopher M. Riedl" <cmr@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20210713053113.4632-1-cmr@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <0c3cb140-23ad-0eb6-7df9-633aa51a097c@csgroup.eu>
Date: Thu, 5 Aug 2021 11:03:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210713053113.4632-1-cmr@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
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
Cc: keescook@chromium.org, peterz@infradead.org, x86@kernel.org,
 npiggin@gmail.com, linux-hardening@vger.kernel.org, tglx@linutronix.de,
 dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 13/07/2021 à 07:31, Christopher M. Riedl a écrit :
> When compiled with CONFIG_STRICT_KERNEL_RWX, the kernel must create
> temporary mappings when patching itself. These mappings temporarily
> override the strict RWX text protections to permit a write. Currently,
> powerpc allocates a per-CPU VM area for patching. Patching occurs as
> follows:
> 
> 	1. Map page in per-CPU VM area w/ PAGE_KERNEL protection
> 	2. Patch text
> 	3. Remove the temporary mapping
> 
> While the VM area is per-CPU, the mapping is actually inserted into the
> kernel page tables. Presumably, this could allow another CPU to access
> the normally write-protected text - either malicously or accidentally -
> via this same mapping if the address of the VM area is known. Ideally,
> the mapping should be kept local to the CPU doing the patching [0].
> 
> x86 introduced "temporary mm" structs which allow the creation of mappings
> local to a particular CPU [1]. This series intends to bring the notion of a
> temporary mm to powerpc's Book3s64 Radix MMU and harden it by using such a
> mapping for patching a kernel with strict RWX permissions.
> 
> The first four patches implement an LKDTM test "proof-of-concept" which
> exploits the potential vulnerability (ie. the temporary mapping during patching
> is exposed in the kernel page tables and accessible by other CPUs) using a
> simple brute-force approach. This test is implemented for both powerpc and
> x86_64. The test passes on powerpc Radix with this new series, fails on
> upstream powerpc, passes on upstream x86_64, and fails on an older (ancient)
> x86_64 tree without the x86_64 temporary mm patches. The remaining patches add
> support for and use a temporary mm for code patching on powerpc with the Radix
> MMU.

I think four first patches (together with last one) are quite independent from the heart of the 
series itself which is patches 5, 6, 7. Maybe you should split that series it two series ? After all 
those selftests are nice to have but are not absolutely necessary, that would help getting forward I 
think.

> 
> Tested boot, ftrace, and repeated LKDTM "hijack":
> 	- QEMU+KVM (host: POWER9 Blackbird): Radix MMU w/ KUAP
> 	- QEMU+KVM (host: POWER9 Blackbird): Hash MMU
> 
> Tested repeated LKDTM "hijack":
> 	- QEMU+KVM (host: AMD desktop): x86_64 upstream
> 	- QEMU+KVM (host: AMD desktop): x86_64 w/o percpu temp mm to
> 	  verify the LKDTM "hijack" test fails
> 
> Tested boot and ftrace:
> 	- QEMU+TCG: ppc44x (bamboo)
> 	- QEMU+TCG: g5 (mac99)
> 
> I also tested with various extra config options enabled as suggested in
> section 12) in Documentation/process/submit-checklist.rst.
> 
> v5:	* Only support Book3s64 Radix MMU for now. There are some issues with
> 	  the previous implementation on the Hash MMU as pointed out by Nick
> 	  Piggin. Fixing these is not trivial so we only support the Radix MMU
> 	  for now. I tried using realmode (no data translation) to patch with
> 	  Hash to at least avoid exposing the patch mapping to other CPUs but
> 	  this doesn't reliably work either since we cannot access vmalloc'd
> 	  space in realmode.

So you now accept to have two different mode depending on the platform ?
As far as I remember I commented some time ago that non SMP didn't need that feature and you were 
reluctant to have two different implementations. What made you change your mind ? (just curious).


> 	* Use percpu variables for the patching_mm and patching_addr. This
> 	  avoids the need for synchronization mechanisms entirely. Thanks to
> 	  Peter Zijlstra for pointing out text_mutex which unfortunately didn't
> 	  work out without larger code changes in powerpc. Also thanks to Daniel
> 	  Axtens for comments about using percpu variables for the *percpu* temp
> 	  mm things off list.
> 
> v4:	* It's time to revisit this series again since @jpn and @mpe fixed
> 	  our known STRICT_*_RWX bugs on powerpc/64s.
> 	* Rebase on linuxppc/next:
>            commit ee1bc694fbaec ("powerpc/kvm: Fix build error when PPC_MEM_KEYS/PPC_PSERIES=n")
> 	* Completely rework how map_patch() works on book3s64 Hash MMU
> 	* Split the LKDTM x86_64 and powerpc bits into separate patches
> 	* Annotate commit messages with changes from v3 instead of
> 	  listing them here completely out-of context...
> 
> v3:	* Rebase on linuxppc/next: commit 9123e3a74ec7 ("Linux 5.9-rc1")
> 	* Move temporary mm implementation into code-patching.c where it
> 	  belongs
> 	* Implement LKDTM hijacker test on x86_64 (on IBM time oof) Do
> 	* not use address zero for the patching address in the
> 	  temporary mm (thanks @dja for pointing this out!)
> 	* Wrap the LKDTM test w/ CONFIG_SMP as suggested by Christophe
> 	  Leroy
> 	* Comments to clarify PTE pre-allocation and patching addr
> 	  selection
> 
> v2:	* Rebase on linuxppc/next:
> 	  commit 105fb38124a4 ("powerpc/8xx: Modify ptep_get()")
> 	* Always dirty pte when mapping patch
> 	* Use `ppc_inst_len` instead of `sizeof` on instructions
> 	* Declare LKDTM patching addr accessor in header where it belongs	
> 
> v1:	* Rebase on linuxppc/next (4336b9337824)
> 	* Save and restore second hw watchpoint
> 	* Use new ppc_inst_* functions for patching check and in LKDTM test
> 
> rfc-v2:	* Many fixes and improvements mostly based on extensive feedback
>            and testing by Christophe Leroy (thanks!).
> 	* Make patching_mm and patching_addr static and move
> 	  '__ro_after_init' to after the variable name (more common in
> 	  other parts of the kernel)
> 	* Use 'asm/debug.h' header instead of 'asm/hw_breakpoint.h' to
> 	  fix PPC64e compile
> 	* Add comment explaining why we use BUG_ON() during the init
> 	  call to setup for patching later
> 	* Move ptep into patch_mapping to avoid walking page tables a
> 	  second time when unmapping the temporary mapping
> 	* Use KUAP under non-radix, also manually dirty the PTE for patch
> 	  mapping on non-BOOK3S_64 platforms
> 	* Properly return any error from __patch_instruction
>          * Do not use 'memcmp' where a simple comparison is appropriate
> 	* Simplify expression for patch address by removing pointer maths
> 	* Add LKDTM test
> 
> [0]: https://github.com/linuxppc/issues/issues/224
> [1]: https://lore.kernel.org/kernel-hardening/20190426232303.28381-1-nadav.amit@gmail.com/
> 
> Christopher M. Riedl (8):
>    powerpc: Add LKDTM accessor for patching addr
>    lkdtm/powerpc: Add test to hijack a patch mapping
>    x86_64: Add LKDTM accessor for patching addr
>    lkdtm/x86_64: Add test to hijack a patch mapping
>    powerpc/64s: Introduce temporary mm for Radix MMU
>    powerpc: Rework and improve STRICT_KERNEL_RWX patching
>    powerpc/64s: Initialize and use a temporary mm for patching on Radix
>    lkdtm/powerpc: Fix code patching hijack test
> 
>   arch/powerpc/include/asm/code-patching.h |   4 +
>   arch/powerpc/include/asm/debug.h         |   1 +
>   arch/powerpc/kernel/process.c            |   5 +
>   arch/powerpc/lib/code-patching.c         | 240 ++++++++++++++++++++---
>   arch/x86/include/asm/text-patching.h     |   4 +
>   arch/x86/kernel/alternative.c            |   7 +
>   drivers/misc/lkdtm/core.c                |   1 +
>   drivers/misc/lkdtm/lkdtm.h               |   1 +
>   drivers/misc/lkdtm/perms.c               | 143 ++++++++++++++
>   9 files changed, 378 insertions(+), 28 deletions(-)
> 
