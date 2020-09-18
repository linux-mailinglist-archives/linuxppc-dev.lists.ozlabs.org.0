Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3A926FAFA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Sep 2020 12:52:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bt9f24hmVzDqg8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Sep 2020 20:52:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bt9bw1ksYzDqcG
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Sep 2020 20:50:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=JR39dyMp; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Bt9bt4QB0z9sPB;
 Fri, 18 Sep 2020 20:50:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1600426251;
 bh=mf+a8pf5ZaYuNLYLnxvD6YlcowRXP3LQ0p+3R0GfH0k=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=JR39dyMpiHGnRtE5mG6JzdY/wPUwi3OQ5Tkh/xcNLe3eTO6rshASI9hIDsVicesls
 b42vBWhhzUxMFMUu3rsXE503BUkVmplLZM0q3AnFqX9UFZxMBYdjJguxzLOYmC2L/+
 WE1FsO66HKv18T799dodEIenRXwlmFHqXg3RV+E/rdTbHMrKI7tAyf+G3Wd8OqIMR0
 EyG/sUw4AeK2tuDFjmZEKNqOJMxinu6bKhEwJBapbKPe0E8SU24+98lmhj68+Wp6SQ
 OXto/veJbOsfcyo3r1aobPmmG26KuSyZYBMxKGfrGzKwAF5mltLKa0blIzKZtMWiFy
 Rbu5J/xqJW0Hw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Rogerio Alves <rcardoso@linux.ibm.com>,
 Ravi Bangoria <ravi.bangoria@linux.ibm.com>, christophe.leroy@c-s.fr
Subject: Re: [PATCH v6 0/8] powerpc/watchpoint: Bug fixes plus new feature flag
In-Reply-To: <6927523d-de63-910a-e789-5fab424c7eb9@linux.ibm.com>
References: <20200902042945.129369-1-ravi.bangoria@linux.ibm.com>
 <6927523d-de63-910a-e789-5fab424c7eb9@linux.ibm.com>
Date: Fri, 18 Sep 2020 20:50:49 +1000
Message-ID: <87h7rv73zq.fsf@mpe.ellerman.id.au>
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
Cc: mikey@neuling.org, jniethe5@gmail.com, pedromfc@linux.ibm.com,
 linux-kernel@vger.kernel.org, paulus@samba.org, rogealve@linux.ibm.com,
 naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Rogerio Alves <rcardoso@linux.ibm.com> writes:
> On 9/2/20 1:29 AM, Ravi Bangoria wrote:
>> Patch #1 fixes issue for quardword instruction on p10 predecessors.
>> Patch #2 fixes issue for vector instructions.
>> Patch #3 fixes a bug about watchpoint not firing when created with
>>           ptrace PPC_PTRACE_SETHWDEBUG and CONFIG_HAVE_HW_BREAKPOINT=N.
>>           The fix uses HW_BRK_TYPE_PRIV_ALL for ptrace user which, I
>>           guess, should be fine because we don't leak any kernel
>>           addresses and PRIV_ALL will also help to cover scenarios when
>>           kernel accesses user memory.
>> Patch #4,#5 fixes infinite exception bug, again the bug happens only
>>           with CONFIG_HAVE_HW_BREAKPOINT=N.
>> Patch #6 fixes two places where we are missing to set hw_len.
>> Patch #7 introduce new feature bit PPC_DEBUG_FEATURE_DATA_BP_ARCH_31
>>           which will be set when running on ISA 3.1 compliant machine.
>> Patch #8 finally adds selftest to test scenarios fixed by patch#2,#3
>>           and also moves MODE_EXACT tests outside of BP_RANGE condition.
>> 
>> Christophe, let me know if this series breaks something for 8xx.
>> 
>> v5: https://lore.kernel.org/r/20200825043617.1073634-1-ravi.bangoria@linux.ibm.com
>> 
>> v5->v6:
>>   - Fix build faulure reported by kernel test robot
>>   - patch #5. Use more compact if condition, suggested by Christophe
>> 
>> 
>> Ravi Bangoria (8):
>>    powerpc/watchpoint: Fix quarword instruction handling on p10
>>      predecessors
>>    powerpc/watchpoint: Fix handling of vector instructions
>>    powerpc/watchpoint/ptrace: Fix SETHWDEBUG when
>>      CONFIG_HAVE_HW_BREAKPOINT=N
>>    powerpc/watchpoint: Move DAWR detection logic outside of
>>      hw_breakpoint.c
>>    powerpc/watchpoint: Fix exception handling for
>>      CONFIG_HAVE_HW_BREAKPOINT=N
>>    powerpc/watchpoint: Add hw_len wherever missing
>>    powerpc/watchpoint/ptrace: Introduce PPC_DEBUG_FEATURE_DATA_BP_ARCH_31
>>    powerpc/watchpoint/selftests: Tests for kernel accessing user memory
>> 
>>   Documentation/powerpc/ptrace.rst              |   1 +
>>   arch/powerpc/include/asm/hw_breakpoint.h      |  12 ++
>>   arch/powerpc/include/uapi/asm/ptrace.h        |   1 +
>>   arch/powerpc/kernel/Makefile                  |   3 +-
>>   arch/powerpc/kernel/hw_breakpoint.c           | 149 +---------------
>>   .../kernel/hw_breakpoint_constraints.c        | 162 ++++++++++++++++++
>>   arch/powerpc/kernel/process.c                 |  48 ++++++
>>   arch/powerpc/kernel/ptrace/ptrace-noadv.c     |   9 +-
>>   arch/powerpc/xmon/xmon.c                      |   1 +
>>   .../selftests/powerpc/ptrace/ptrace-hwbreak.c |  48 +++++-
>>   10 files changed, 282 insertions(+), 152 deletions(-)
>>   create mode 100644 arch/powerpc/kernel/hw_breakpoint_constraints.c
>> 
>
> Tested this patch set for:
> - SETHWDEBUG when CONFIG_HAVE_HW_BREAKPOINT=N = OK
> - Fix exception handling for CONFIG_HAVE_HW_BREAKPOINT=N = OK
> - Check for PPC_DEBUG_FEATURE_DATA_BP_ARCH_31 = OK
> - Fix quarword instruction handling on p10 predecessors = OK
> - Fix handling of vector instructions = OK
>
> Also tested for:
> - Set second watchpoint (P10 Mambo) = OK
> - Infinity loop on sc instruction = OK

Thanks.

I wasn't able to pick up your Tested-by tags as I'd already applied the
patches, but thanks for sending them anyway, they will live on in the
mailing list archives for eternity.

cheers
