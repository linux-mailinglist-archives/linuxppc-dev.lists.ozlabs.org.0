Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 291AC52EB8E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 14:07:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L4QTF06D9z3bvd
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 22:07:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Trhn3fWF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029;
 helo=mail-pj1-x1029.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Trhn3fWF; dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L4QSW5YRQz3bkj
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 May 2022 22:06:49 +1000 (AEST)
Received: by mail-pj1-x1029.google.com with SMTP id f10so7879543pjs.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 May 2022 05:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=dqMmPFteZaeOQeYQcnB3PrzZcWDnMDYIRxa9YGVMvDc=;
 b=Trhn3fWF0MDb8XD8b25nwS8eU/NC1Adgy5IDvEkSayGW3ERlbDaGABEOktc7pjYPlt
 dV0HT9gXeL1mBldpPx9S7XRSe8kaFMwFMTjRNwsNUU+f0VW9RP4+XjGYEk0RGh3SHTNb
 io5iVB/B6pmV+PIwYI4zCDUq2qDRwaSyiFh9BoDrZEMivzgRYyICmuHoSzt0srwOzNC5
 S909nH0CuBZWouaOu0hEG87g3J4On75Kxsmf98A0aBY0CbK8jPL/MNAyfugYlMtlH5rL
 1gzTA+Cf1cx4bCbKMDXc/fJPW+sh3ky8VcTSJ+M5IHdzdplLk8SPKm5ntxJOsC3qFWo4
 K5HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=dqMmPFteZaeOQeYQcnB3PrzZcWDnMDYIRxa9YGVMvDc=;
 b=fMq+a+AjwPm17v12nPcm7Nh1WbQGDLikabqO+hdY8lvu7XVQrE73CdYPLs3ByxZQzt
 yuAgc5Pp40DMXLPsawUhig8ueeLn2OsGT5bxiZDfFaeh8+yYjIQtAvncszQzpHVZKQca
 0SDhJEEyy/wFgU+SjqMFcTI098+XnIr5D0A/hffkH8RDA42yHxh4Ce9KG5AFcX4wlV3O
 IfwQRk36Ysc4OUlWPywdq/oZu76EV965olQd+6xvgI9mj/pAch+ByN16KOoYT7rEX5sh
 Jwe2xbp5OPInbb8YzLLbc04lRn9ai1CwpHoyStuTmV64IUqHiJWTIvzlSOv4wsaH9FvR
 mw5Q==
X-Gm-Message-State: AOAM530Gwy6g2I4BQl7LROkfd8UMTgKPOAtFx5TfETFk0t73+4n5WAjo
 v7tvZTnTMr9IRVJ3FLEpK5yaiJIAf6o=
X-Google-Smtp-Source: ABdhPJymI0Jnb99qUQCb7uLoBuwytpeuIJOl7CQrsQq52EvRqJvpiXzTIvealRKXHHCa8QfscJ/Ibg==
X-Received: by 2002:a17:902:8605:b0:15d:10dc:1c6f with SMTP id
 f5-20020a170902860500b0015d10dc1c6fmr9565876plo.4.1653048404875; 
 Fri, 20 May 2022 05:06:44 -0700 (PDT)
Received: from localhost (124-171-74-249.tpgi.com.au. [124.171.74.249])
 by smtp.gmail.com with ESMTPSA id
 v62-20020a622f41000000b0051835ccc008sm1594344pfv.115.2022.05.20.05.06.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 05:06:44 -0700 (PDT)
Date: Fri, 20 May 2022 22:06:38 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC Linux patch] powerpc: add documentation for HWCAPs
To: Nicholas Piggin via Libc-alpha <libc-alpha@sourceware.org>,
 linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
References: <20220520051528.98097-1-npiggin@gmail.com>
 <87wnegmuey.fsf@mpe.ellerman.id.au>
In-Reply-To: <87wnegmuey.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Message-Id: <1653047023.1xccudmwfb.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: gcc@gcc.gnu.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Michael Ellerman's message of May 20, 2022 7:21 pm:
> Nicholas Piggin via Libc-alpha <libc-alpha@sourceware.org> writes:
>> This takes the arm64 file and adjusts it for powerpc. Feature
>> descriptions are vaguely handwaved by me.
>> ---
>=20
> Thanks for attempting to document this.

It was mainly copy and paste from two existing files :)

>> +1. Introduction
>> +---------------
>> +
>> +Some hardware or software features are only available on some CPU
>> +implementations, and/or with certain kernel configurations, but have no
>> +architected discovery mechanism available to userspace code. The kernel
>=20
> By "no architected discovery mechanism" you mean nothing in the ISA, but
> I think a reader might not understand that. After all HWCAP is an
> "architected discovery mechanism", architected by the kernel and libc.
>=20
> Maybe just say "no other discovery mechanism".

Good point I reworded that.

>> +Features cannot be probed reliably through other means. When a feature
>> +is not available, attempting to use it may result in unpredictable
>> +behaviour, and is not guaranteed to result in any reliable indication
>> +that the feature is unavailable, such as a SIGILL.
>=20
> I'd just drop the "such as a SIGILL", don't give people ideas :)

Yep.

>> +2. hwcap allocation
>> +-------------------
>> +
>> +HWCAPs are allocated as described in Power Architecture 64-Bit ELF V2 A=
BI
>=20
> Are we calling them hwcaps or HWCAPs?

arm64 was mixed. We'll go with HWCAP.

>> +Specification (which will be reflected in the kernel's uapi headers).
>> +
>> +3. The hwcaps exposed in AT_HWCAP
>> +---------------------------------
>> +
>> +PPC_FEATURE_32
>> +    32-bit CPU
>> +
>> +PPC_FEATURE_64
>> +    64-bit CPU (userspace may be running in 32-bit mode).
>> +
>> +PPC_FEATURE_601_INSTR
>> +    The processor is PowerPC 601
>=20
> Unused in the kernel since:
>   f0ed73f3fa2c ("powerpc: Remove PowerPC 601")
>=20
>> +PPC_FEATURE_HAS_ALTIVEC
>> +    Vector (aka Altivec, VSX) facility is available.
>> +
>> +PPC_FEATURE_HAS_FPU
>> +    Floating point facility is available.
>> +
>> +PPC_FEATURE_HAS_MMU
>> +    Memory management unit is present.
>> +
>> +PPC_FEATURE_HAS_4xxMAC
>> +    ?
>=20
> First appeared in v2.4.9.2, as part of "Paul Mackerras: PPC update (big r=
e-org)":
>=20
>   https://github.com/mpe/linux-fullhistory/commit/dccd38599dad0588f4fb254=
c0a188b7c70af02e1
>=20
> No extra context I can see.
>=20
> I think all our 4xx (40x or 44x) CPUs have that set, so seems like it
> just means "is a 40x or 44x".
>=20
>> +PPC_FEATURE_UNIFIED_CACHE
>> +    ?
>=20
> Unused in the kernel since:
>   39c8bf2b3cc1 ("powerpc: Retire e200 core (mpc555x processor)")
>=20
>> +PPC_FEATURE_HAS_SPE
>> +    ?
>=20
> AFAIK means the CPU supports SPE (Signal Processing Engine) instructions.
>=20
> They were documented in ISA v2.07 Book I chapter 8.
>=20
> Not to be confused with the Cell SPEs.

Okay.

>=20
> I think GCC has dropped support for SPE, so at some point we may want to
> drop the kernel support also, as it will be increasingly untested.
>=20
>> +PPC_FEATURE_HAS_EFP_SINGLE
>> +    ?
>=20
> Seems to be SPE related, only set on CPUs that also have SPE.

Maybe found some docs on it. It was some ops additional to the SPE
facility by the looks.

>=20
>> +PPC_FEATURE_HAS_EFP_DOUBLE
>> +    ?
>=20
> As above.
>=20
>> +PPC_FEATURE_NO_TB
>> +    The timebase facility (mftb instruction) is not available.
>> +
>=20
> Unused in the kernel since:
>   f0ed73f3fa2c ("powerpc: Remove PowerPC 601")
>=20
>> +PPC_FEATURE_POWER4
>> +    The processor is POWER4.
>=20
> We dropped Power4 support in:
>=20
>   471d7ff8b51b ("powerpc/64s: Remove POWER4 support")
>=20
> But that bit is still set for PPC970/FX/MP.

Ah good catch.

>=20
>> +PPC_FEATURE_POWER5
>> +    The processor is POWER5.
>> +
>> +PPC_FEATURE_POWER5_PLUS
>> +    The processor is POWER5+.
>> +
>> +PPC_FEATURE_CELL
>> +    The processor is Cell.
>> +
>> +PPC_FEATURE_BOOKE
>> +    The processor implements the BookE architecture.
>> +
>> +PPC_FEATURE_SMT
>> +    The processor implements SMT.
>> +
>> +PPC_FEATURE_ICACHE_SNOOP
>> +    The processor icache is coherent with the dcache, and instruction s=
torage
>> +    can be made consistent with data storage for the purpose of executi=
ng
>> +    instructions with the instruction sequence:
>> +        sync
>> +        icbi (to any address)
>> +        isync
>=20
> Where did you get that from, the ISA?

User manuals. I can't find it in the ISA but arguably I'd say it should
have some note or reference to coherent implementation seeing as all=20
POWER CPUs for years have had it.

>> +PPC_FEATURE_ARCH_2_05
>> +    The processor supports the v2.05 userlevel architecture. Processors
>> +    supporting later architectures also set this feature.
>> +
>> +PPC_FEATURE_PA6T
>> +    The processor is PA6T.
>> +
>> +PPC_FEATURE_HAS_DFP
>> +    DFP facility is available.
>> +
>> +PPC_FEATURE_POWER6_EXT
>> +    The processor is POWER6.
>> +
>> +PPC_FEATURE_ARCH_2_06
>> +    The processor supports the v2.06 userlevel architecture. Processors
>> +    supporting later architectures also set this feature.
>> +
>> +PPC_FEATURE_HAS_VSX
>> +    VSX facility is available.
>> +
>> +PPC_FEATURE_PSERIES_PERFMON_COMPAT
>=20
> Explanation in:
>   0f4733147520 ("powerpc: Add PPC_FEATURE_PSERIES_PERFMON_COMPAT")
>=20
> But AFAIK only oprofile ever used that, not perf, or maybe perfmon2 uses =
it?

Seems to be the architected PMU events?

>=20
>> +PPC_FEATURE_TRUE_LE
>> +    Reserved, do not use
>=20
> No it's not reserved, you read the comment wrong :)
>=20
> /* Reserved - do not use		0x00000004 */
> #define PPC_FEATURE_TRUE_LE		0x00000002
> #define PPC_FEATURE_PPC_LE		0x00000001
>=20
> It's 4 that's reserved.

Ah yep.

>=20
>> +PPC_FEATURE_PPC_LE
>> +    Reserved, do not use
>=20
> There's some discussion of the two LE properties here:
>=20
>   fab5db97e44f ("[PATCH] powerpc: Implement support for setting little-en=
dian mode via prctl")
>=20
> But it doesn't really explain the difference.
>=20
> And this commit:
>=20
>   651d765d0b2c ("[PATCH] Add a prctl to change the endianness of a proces=
s.")
>=20
> Added the prctl flags:
>=20
> # define PR_ENDIAN_LITTLE	1	/* True little endian mode */
> # define PR_ENDIAN_PPC_LITTLE	2	/* "PowerPC" pseudo little endian */
>=20
> Which matches my recollection that PPC_LE is somehow not proper little
> endian, but I've forgotten why. Someone older than me will remember :)

Looked it up and found it's "address munging" some strane mode that looks
like little endian to one's own loads and stores, but stores to memory
in some entirely different format that doesn't even match the address!

>=20
>> +3. The hwcaps exposed in AT_HWCAP2
>> +----------------------------------
>> +
>> +PPC_FEATURE2_ARCH_2_07
>> +    The processor supports the v2.07 userlevel architecture. Processors
>> +    supporting later architectures also set this feature.
>> +
>> +PPC_FEATURE2_HTM
>> +    Transactional Memory feature is available.
>> +
>> +PPC_FEATURE2_DSCR
>> +    DSCR facility is available.
>> +
>> +PPC_FEATURE2_EBB
>> +    EBB facility is available.
>> +
>> +PPC_FEATURE2_ISEL
>> +    isel instruction is available. This is superseded by ARCH_2_07 and
>> +    later.
>> +
>> +PPC_FEATURE2_TAR
>> +    VSX facility is available.
>=20
> Typo?
>=20
> It means the CPU has the "tar" register. I suspect it's never used.

Yeah typo.

>> +PPC_FEATURE2_VEC_CRYPTO
>> +    v2.07 crypto instructions are available.
>> +
>> +PPC_FEATURE2_HTM_NOSC
>> +    System calls fail if called in a transactional state, see
>> +    Documentation/powerpc/syscall64-abi.rst
>> +
>> +PPC_FEATURE2_ARCH_3_00
>> +    The processor supports the v3.0B / v3.0C userlevel architecture. Pr=
ocessors
>> +    supporting later architectures also set this feature.
>> +
>> +PPC_FEATURE2_HAS_IEEE128
>> +    IEEE 128 is available? What instructions/data?
>> +
>> +PPC_FEATURE2_DARN
>> +    darn instruction is available.
>> +
>> +PPC_FEATURE2_SCV
>> +    scv instruction is available.
>> +
>> +PPC_FEATURE2_HTM_NO_SUSPEND
>> +    A limited Transactional Memory facility that does not support suspe=
nd is
>> +    available, see Documentation/powerpc/transactional_memory.rst.
>> +
>> +PPC_FEATURE2_ARCH_3_1
>> +    The processor supports the v3.1 userlevel architecture. Processors
>> +    supporting later architectures also set this feature.
>> +
>> +PPC_FEATURE2_MMA
>> +    MMA facility is available.

How's this?

---
 Documentation/powerpc/elf_hwcaps.rst | 209 +++++++++++++++++++++++++++
 1 file changed, 209 insertions(+)
 create mode 100644 Documentation/powerpc/elf_hwcaps.rst

diff --git a/Documentation/powerpc/elf_hwcaps.rst b/Documentation/powerpc/e=
lf_hwcaps.rst
new file mode 100644
index 000000000000..ac0d8983717b
--- /dev/null
+++ b/Documentation/powerpc/elf_hwcaps.rst
@@ -0,0 +1,209 @@
+.. _elf_hwcaps_index:
+
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+POWERPC ELF HWCAPs
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+This document describes the usage and semantics of the powerpc ELF HWCAPs.
+
+
+1. Introduction
+---------------
+
+Some hardware or software features are only available on some CPU
+implementations, and/or with certain kernel configurations, but have no ot=
her
+discovery mechanism available to userspace code. The kernel exposes the
+presence of these features to userspace through a set of flags called HWCA=
Ps,
+exposed in the auxiliary vector.
+
+Userspace software can test for features by acquiring the AT_HWCAP or
+AT_HWCAP2 entry of the auxiliary vector, and testing whether the relevant
+flags are set, e.g.::
+
+	bool floating_point_is_present(void)
+	{
+		unsigned long HWCAPs =3D getauxval(AT_HWCAP);
+		if (HWCAPs & PPC_FEATURE_HAS_FPU)
+			return true;
+
+		return false;
+	}
+
+Where software relies on a feature described by a HWCAP, it should check t=
he
+relevant HWCAP flag to verify that the feature is present before attemptin=
g to
+make use of the feature.
+
+Features should not be probed through other means. When a feature is not
+available, attempting to use it may result in unpredictable behaviour, and
+may not be guaranteed to result in any reliable indication that the featur=
e
+is unavailable.
+
+2. HWCAP allocation
+-------------------
+
+HWCAPs are allocated as described in Power Architecture 64-Bit ELF V2 ABI
+Specification (which will be reflected in the kernel's uapi headers).
+
+3. The HWCAPs exposed in AT_HWCAP
+---------------------------------
+
+PPC_FEATURE_32
+    32-bit CPU
+
+PPC_FEATURE_64
+    64-bit CPU (userspace may be running in 32-bit mode).
+
+PPC_FEATURE_601_INSTR
+    The processor is PowerPC 601.
+    Unused in the kernel since:
+      f0ed73f3fa2c ("powerpc: Remove PowerPC 601")
+
+PPC_FEATURE_HAS_ALTIVEC
+    Vector (aka Altivec, VSX) facility is available.
+
+PPC_FEATURE_HAS_FPU
+    Floating point facility is available.
+
+PPC_FEATURE_HAS_MMU
+    Memory management unit is present.
+
+PPC_FEATURE_HAS_4xxMAC
+    The processor is 40x or 44x family.
+
+PPC_FEATURE_UNIFIED_CACHE
+    The processor has a unified L1 cache for instructions and data, as
+    found in the NXP e200.
+    Unused in the kernel since:
+      39c8bf2b3cc1 ("powerpc: Retire e200 core (mpc555x processor)")
+
+PPC_FEATURE_HAS_SPE
+    Signal Processing Engine facility is available.
+
+PPC_FEATURE_HAS_EFP_SINGLE
+    Embedded Floating Point single precision operations are available.
+
+PPC_FEATURE_HAS_EFP_DOUBLE
+    Embedded Floating Point double precision operations are available.
+
+PPC_FEATURE_NO_TB
+    The timebase facility (mftb instruction) is not available.
+    This is a 601 specific HWCAP, so if it is known that the processor
+    running is not a 601, via other HWCAPs or other means, it is not
+    required to test this bit before using the timebase.
+    Unused in the kernel since:
+      f0ed73f3fa2c ("powerpc: Remove PowerPC 601")
+
+PPC_FEATURE_POWER4
+    The processor is POWER4 or PPC970/FX/MP.
+    POWER4 support dropped from the kernel since:
+      471d7ff8b51b ("powerpc/64s: Remove POWER4 support")
+
+PPC_FEATURE_POWER5
+    The processor is POWER5.
+
+PPC_FEATURE_POWER5_PLUS
+    The processor is POWER5+.
+
+PPC_FEATURE_CELL
+    The processor is Cell.
+
+PPC_FEATURE_BOOKE
+    The processor implements the BookE architecture.
+
+PPC_FEATURE_SMT
+    The processor implements SMT.
+
+PPC_FEATURE_ICACHE_SNOOP
+    The processor icache is coherent with the dcache, and instruction stor=
age
+    can be made consistent with data storage for the purpose of executing
+    instructions with the sequence (as described in, e.g., POWER9 Processo=
r
+    User's Manual, 4.6.2.2 Instruction Cache Block Invalidate (icbi)):
+        sync
+        icbi (to any address)
+        isync
+
+PPC_FEATURE_ARCH_2_05
+    The processor supports the v2.05 userlevel architecture. Processors
+    supporting later architectures also set this feature.
+
+PPC_FEATURE_PA6T
+    The processor is PA6T.
+
+PPC_FEATURE_HAS_DFP
+    DFP facility is available.
+
+PPC_FEATURE_POWER6_EXT
+    The processor is POWER6.
+
+PPC_FEATURE_ARCH_2_06
+    The processor supports the v2.06 userlevel architecture. Processors
+    supporting later architectures also set this feature.
+
+PPC_FEATURE_HAS_VSX
+    VSX facility is available.
+
+PPC_FEATURE_PSERIES_PERFMON_COMPAT
+    The processor supports architected PMU events in the range 0xE0-0xFF.
+
+PPC_FEATURE_TRUE_LE
+    The processor supports true little-endian mode.
+
+PPC_FEATURE_PPC_LE
+    The processor supports "PowerPC Little-Endian", that uses address
+    munging to make storage access appear to be little-endian, but the
+    data is stored in a different format that is unsuitable to be
+    accessed by other agents not running in this mode.
+
+3. The HWCAPs exposed in AT_HWCAP2
+----------------------------------
+
+PPC_FEATURE2_ARCH_2_07
+    The processor supports the v2.07 userlevel architecture. Processors
+    supporting later architectures also set this feature.
+
+PPC_FEATURE2_HTM
+    Transactional Memory feature is available.
+
+PPC_FEATURE2_DSCR
+    DSCR facility is available.
+
+PPC_FEATURE2_EBB
+    EBB facility is available.
+
+PPC_FEATURE2_ISEL
+    isel instruction is available. This is superseded by ARCH_2_07 and
+    later.
+
+PPC_FEATURE2_TAR
+    TAR facility is available.
+
+PPC_FEATURE2_VEC_CRYPTO
+    v2.07 crypto instructions are available.
+
+PPC_FEATURE2_HTM_NOSC
+    System calls fail if called in a transactional state, see
+    Documentation/powerpc/syscall64-abi.rst
+
+PPC_FEATURE2_ARCH_3_00
+    The processor supports the v3.0B / v3.0C userlevel architecture. Proce=
ssors
+    supporting later architectures also set this feature.
+
+PPC_FEATURE2_HAS_IEEE128
+    IEEE 128 is available? What instructions/data?
+
+PPC_FEATURE2_DARN
+    darn instruction is available.
+
+PPC_FEATURE2_SCV
+    scv instruction is available.
+
+PPC_FEATURE2_HTM_NO_SUSPEND
+    A limited Transactional Memory facility that does not support suspend =
is
+    available, see Documentation/powerpc/transactional_memory.rst.
+
+PPC_FEATURE2_ARCH_3_1
+    The processor supports the v3.1 userlevel architecture. Processors
+    supporting later architectures also set this feature.
+
+PPC_FEATURE2_MMA
+    MMA facility is available.
--=20
2.35.1

