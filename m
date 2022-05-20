Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DECF52E918
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 11:43:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L4MGX1Zybz3gTd
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 19:43:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=hN05wL0P;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L4LnT0TKZz3dwQ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 May 2022 19:21:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=hN05wL0P; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4L4LnQ3rFKz4xD1;
 Fri, 20 May 2022 19:21:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1653038475;
 bh=MxobZIVex1WYxvwLCRoknMYiYengi9AOSU9k2JGBEwk=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=hN05wL0PzkdKWI6Hu+3AM6aEPJ1dRut2HbyQcgOjbPRvGBWl6CvMnbzalp7Wy7D49
 Gl4GGIsWy85FaHMOadUyKYUQCOu/C7y9ewQOUsVJOQ/hI6rDGoa5nOTtXkE0Ab/iYN
 l+Nn0m8NTRMVoxa6aphAiki3d0dQX6ZNMujhb0uVc+b/jqS9VlmONzKIJdKRhHzJGu
 pF6Vf8DEA005VWl8F4f9038eXsvhDCh7nl5Xgxpbc3+SXwYPdxv0QgjpfN8RH+x6nI
 1Is8jZkHXVsHQxsI8jNJjdRtnJqxHQjljR2EVqXmhUSp3y1s6xZtXCASlO0TQUypaC
 h+bwbK3CETOCQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin via Libc-alpha <libc-alpha@sourceware.org>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [RFC Linux patch] powerpc: add documentation for HWCAPs
In-Reply-To: <20220520051528.98097-1-npiggin@gmail.com>
References: <20220520051528.98097-1-npiggin@gmail.com>
Date: Fri, 20 May 2022 19:21:09 +1000
Message-ID: <87wnegmuey.fsf@mpe.ellerman.id.au>
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
Cc: gcc@gcc.gnu.org, libc-alpha@sourceware.org,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin via Libc-alpha <libc-alpha@sourceware.org> writes:
> This takes the arm64 file and adjusts it for powerpc. Feature
> descriptions are vaguely handwaved by me.
> ---

Thanks for attempting to document this.

> Anybody care to expand on or correct the meaning of these entries or
> bikeshed the wording of the intro? Many of them are no longer used
> anywhere by upstream kernels and even where they are it's not always
> quite clear what the exact intent was, a lot of them are old history
> and I don't know what or where they are used.
>
> I may try to get these descriptions pushed into the ABI doc after a
> time, but for now they can live in the kernel tree.
>
> Thanks,
> Nick
>
>  Documentation/powerpc/elf_hwcaps.rst | 192 +++++++++++++++++++++++++++
>  1 file changed, 192 insertions(+)
>  create mode 100644 Documentation/powerpc/elf_hwcaps.rst
>
> diff --git a/Documentation/powerpc/elf_hwcaps.rst b/Documentation/powerpc/elf_hwcaps.rst
> new file mode 100644
> index 000000000000..d712aae8b867
> --- /dev/null
> +++ b/Documentation/powerpc/elf_hwcaps.rst
> @@ -0,0 +1,192 @@
> +.. _elf_hwcaps_index:
> +
> +==================
> +POWERPC ELF hwcaps
> +==================
> +
> +This document describes the usage and semantics of the powerpc ELF hwcaps.
> +
> +
> +1. Introduction
> +---------------
> +
> +Some hardware or software features are only available on some CPU
> +implementations, and/or with certain kernel configurations, but have no
> +architected discovery mechanism available to userspace code. The kernel

By "no architected discovery mechanism" you mean nothing in the ISA, but
I think a reader might not understand that. After all HWCAP is an
"architected discovery mechanism", architected by the kernel and libc.

Maybe just say "no other discovery mechanism".

> +exposes the presence of these features to userspace through a set
> +of flags called hwcaps, exposed in the auxilliary vector.
>
> +
> +Userspace software can test for features by acquiring the AT_HWCAP or
> +AT_HWCAP2 entry of the auxiliary vector, and testing whether the relevant
> +flags are set, e.g.::
> +
> +	bool floating_point_is_present(void)
> +	{
> +		unsigned long hwcaps = getauxval(AT_HWCAP);
> +		if (hwcaps & PPC_FEATURE_HAS_FPU)
> +			return true;
> +
> +		return false;
> +	}
> +
> +Where software relies on a feature described by a hwcap, it should check
> +the relevant hwcap flag to verify that the feature is present before
> +attempting to make use of the feature.
> +
> +Features cannot be probed reliably through other means. When a feature
> +is not available, attempting to use it may result in unpredictable
> +behaviour, and is not guaranteed to result in any reliable indication
> +that the feature is unavailable, such as a SIGILL.

I'd just drop the "such as a SIGILL", don't give people ideas :)

> +2. hwcap allocation
> +-------------------
> +
> +HWCAPs are allocated as described in Power Architecture 64-Bit ELF V2 ABI

Are we calling them hwcaps or HWCAPs?

> +Specification (which will be reflected in the kernel's uapi headers).
> +
> +3. The hwcaps exposed in AT_HWCAP
> +---------------------------------
> +
> +PPC_FEATURE_32
> +    32-bit CPU
> +
> +PPC_FEATURE_64
> +    64-bit CPU (userspace may be running in 32-bit mode).
> +
> +PPC_FEATURE_601_INSTR
> +    The processor is PowerPC 601

Unused in the kernel since:
  f0ed73f3fa2c ("powerpc: Remove PowerPC 601")

> +PPC_FEATURE_HAS_ALTIVEC
> +    Vector (aka Altivec, VSX) facility is available.
> +
> +PPC_FEATURE_HAS_FPU
> +    Floating point facility is available.
> +
> +PPC_FEATURE_HAS_MMU
> +    Memory management unit is present.
> +
> +PPC_FEATURE_HAS_4xxMAC
> +    ?

First appeared in v2.4.9.2, as part of "Paul Mackerras: PPC update (big re-org)":

  https://github.com/mpe/linux-fullhistory/commit/dccd38599dad0588f4fb254c0a188b7c70af02e1

No extra context I can see.

I think all our 4xx (40x or 44x) CPUs have that set, so seems like it
just means "is a 40x or 44x".

> +PPC_FEATURE_UNIFIED_CACHE
> +    ?

Unused in the kernel since:
  39c8bf2b3cc1 ("powerpc: Retire e200 core (mpc555x processor)")

> +PPC_FEATURE_HAS_SPE
> +    ?

AFAIK means the CPU supports SPE (Signal Processing Engine) instructions.

They were documented in ISA v2.07 Book I chapter 8.

Not to be confused with the Cell SPEs.

I think GCC has dropped support for SPE, so at some point we may want to
drop the kernel support also, as it will be increasingly untested.

> +PPC_FEATURE_HAS_EFP_SINGLE
> +    ?

Seems to be SPE related, only set on CPUs that also have SPE.

> +PPC_FEATURE_HAS_EFP_DOUBLE
> +    ?

As above.

> +PPC_FEATURE_NO_TB
> +    The timebase facility (mftb instruction) is not available.
> +

Unused in the kernel since:
  f0ed73f3fa2c ("powerpc: Remove PowerPC 601")

> +PPC_FEATURE_POWER4
> +    The processor is POWER4.

We dropped Power4 support in:

  471d7ff8b51b ("powerpc/64s: Remove POWER4 support")

But that bit is still set for PPC970/FX/MP.

> +PPC_FEATURE_POWER5
> +    The processor is POWER5.
> +
> +PPC_FEATURE_POWER5_PLUS
> +    The processor is POWER5+.
> +
> +PPC_FEATURE_CELL
> +    The processor is Cell.
> +
> +PPC_FEATURE_BOOKE
> +    The processor implements the BookE architecture.
> +
> +PPC_FEATURE_SMT
> +    The processor implements SMT.
> +
> +PPC_FEATURE_ICACHE_SNOOP
> +    The processor icache is coherent with the dcache, and instruction storage
> +    can be made consistent with data storage for the purpose of executing
> +    instructions with the instruction sequence:
> +        sync
> +        icbi (to any address)
> +        isync

Where did you get that from, the ISA?

> +PPC_FEATURE_ARCH_2_05
> +    The processor supports the v2.05 userlevel architecture. Processors
> +    supporting later architectures also set this feature.
> +
> +PPC_FEATURE_PA6T
> +    The processor is PA6T.
> +
> +PPC_FEATURE_HAS_DFP
> +    DFP facility is available.
> +
> +PPC_FEATURE_POWER6_EXT
> +    The processor is POWER6.
> +
> +PPC_FEATURE_ARCH_2_06
> +    The processor supports the v2.06 userlevel architecture. Processors
> +    supporting later architectures also set this feature.
> +
> +PPC_FEATURE_HAS_VSX
> +    VSX facility is available.
> +
> +PPC_FEATURE_PSERIES_PERFMON_COMPAT

Explanation in:
  0f4733147520 ("powerpc: Add PPC_FEATURE_PSERIES_PERFMON_COMPAT")

But AFAIK only oprofile ever used that, not perf, or maybe perfmon2 uses it?

> +PPC_FEATURE_TRUE_LE
> +    Reserved, do not use

No it's not reserved, you read the comment wrong :)

/* Reserved - do not use		0x00000004 */
#define PPC_FEATURE_TRUE_LE		0x00000002
#define PPC_FEATURE_PPC_LE		0x00000001

It's 4 that's reserved.

> +PPC_FEATURE_PPC_LE
> +    Reserved, do not use

There's some discussion of the two LE properties here:

  fab5db97e44f ("[PATCH] powerpc: Implement support for setting little-endian mode via prctl")

But it doesn't really explain the difference.

And this commit:

  651d765d0b2c ("[PATCH] Add a prctl to change the endianness of a process.")

Added the prctl flags:

# define PR_ENDIAN_LITTLE	1	/* True little endian mode */
# define PR_ENDIAN_PPC_LITTLE	2	/* "PowerPC" pseudo little endian */

Which matches my recollection that PPC_LE is somehow not proper little
endian, but I've forgotten why. Someone older than me will remember :)

> +3. The hwcaps exposed in AT_HWCAP2
> +----------------------------------
> +
> +PPC_FEATURE2_ARCH_2_07
> +    The processor supports the v2.07 userlevel architecture. Processors
> +    supporting later architectures also set this feature.
> +
> +PPC_FEATURE2_HTM
> +    Transactional Memory feature is available.
> +
> +PPC_FEATURE2_DSCR
> +    DSCR facility is available.
> +
> +PPC_FEATURE2_EBB
> +    EBB facility is available.
> +
> +PPC_FEATURE2_ISEL
> +    isel instruction is available. This is superseded by ARCH_2_07 and
> +    later.
> +
> +PPC_FEATURE2_TAR
> +    VSX facility is available.

Typo?

It means the CPU has the "tar" register. I suspect it's never used.

> +PPC_FEATURE2_VEC_CRYPTO
> +    v2.07 crypto instructions are available.
> +
> +PPC_FEATURE2_HTM_NOSC
> +    System calls fail if called in a transactional state, see
> +    Documentation/powerpc/syscall64-abi.rst
> +
> +PPC_FEATURE2_ARCH_3_00
> +    The processor supports the v3.0B / v3.0C userlevel architecture. Processors
> +    supporting later architectures also set this feature.
> +
> +PPC_FEATURE2_HAS_IEEE128
> +    IEEE 128 is available? What instructions/data?
> +
> +PPC_FEATURE2_DARN
> +    darn instruction is available.
> +
> +PPC_FEATURE2_SCV
> +    scv instruction is available.
> +
> +PPC_FEATURE2_HTM_NO_SUSPEND
> +    A limited Transactional Memory facility that does not support suspend is
> +    available, see Documentation/powerpc/transactional_memory.rst.
> +
> +PPC_FEATURE2_ARCH_3_1
> +    The processor supports the v3.1 userlevel architecture. Processors
> +    supporting later architectures also set this feature.
> +
> +PPC_FEATURE2_MMA
> +    MMA facility is available.


cheers
