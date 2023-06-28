Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 787147409C8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jun 2023 09:42:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lCKzfOOv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QrYSz2zKzz30PZ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jun 2023 17:42:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lCKzfOOv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QrYRG4lZqz30Q2
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Jun 2023 17:40:58 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B42C76132D;
	Wed, 28 Jun 2023 07:40:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9434DC433C8;
	Wed, 28 Jun 2023 07:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687938056;
	bh=H2/HWpdwsdl/CPBtqWcdKIybCHkpylzK31C2Y5ABtUk=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=lCKzfOOvMoPDgmTDTIpZ8rHoHJ7cp4ArpYj9SAKsi4OZtS9jno69KmyOQn9LxiIEk
	 Wahmjf+y1lyNFEoNnxNhY1YsJa6fK3iPVB1gagyLQBeSmLqL4DvUZqrcnY3c4s5Nfb
	 6rkvdtypXE6QZ5ISdOjoZLBQkQ/POZysDq0C/qhrEhbLgSW8gTyMf2NgzO6pRbjXyS
	 YLeyzRkfhof6h9VpvagCjdKnX7uX9NHM2Q4E5Uhpb6uP1ZIZhhQ9wlXTTeWY3G0KlO
	 Q8eO0vc6Dht5OXr2d4BLXzNCOeAJ6hxEs5eKUvB8ZXc+ttHc0skkYzOgXevY3Cfj2F
	 U/xhkhldjB9hg==
Date: Wed, 28 Jun 2023 13:10:44 +0530
From: Naveen N Rao <naveen@kernel.org>
Subject: Re: [PATCH 16/17] powerpc/ftrace: Add support for
 -fpatchable-function-entry
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <cover.1687166935.git.naveen@kernel.org>
	<68586d22981a2c3bb45f27a2b621173d10a7d092.1687166935.git.naveen@kernel.org>
	<66372e0f-a5e0-d883-e9b3-a837a17cd593@csgroup.eu>
In-Reply-To: <66372e0f-a5e0-d883-e9b3-a837a17cd593@csgroup.eu>
MIME-Version: 1.0
User-Agent: astroid/0.16.0 (https://github.com/astroidmail/astroid)
Message-Id: <1687937905.1es5lckagj.naveen@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: Steven Rostedt <rostedt@goodmis.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy wrote:
>=20
>=20
> Le 19/06/2023 =C3=A0 11:47, Naveen N Rao a =C3=A9crit=C2=A0:
>> GCC v13.1 updated support for -fpatchable-function-entry on ppc64le to
>> emit nops after the local entry point, rather than before it. This
>> allows us to use this in the kernel for ftrace purposes. A new script is
>> added under arch/powerpc/tools/ to help detect if nops are emitted after
>> the function local entry point, or before the global entry point.
>>=20
>> With -fpatchable-function-entry, we no longer have the profiling
>> instructions generated at function entry, so we only need to validate
>> the presence of two nops at the ftrace location in ftrace_init_nop(). We
>> patch the preceding instruction with 'mflr r0' to match the
>> -mprofile-kernel ABI for subsequent ftrace use.
>>=20
>> This changes the profiling instructions used on ppc32. The default -pg
>> option emits an additional 'stw' instruction after 'mflr r0' and before
>> the branch to _mcount 'bl _mcount'. This is very similar to the original
>> -mprofile-kernel implementation on ppc64le, where an additional 'std'
>> instruction was used to save LR to its save location in the caller's
>> stackframe. Subsequently, this additional store was removed in later
>> compiler versions for performance reasons. The same reasons apply for
>> ppc32 so we only patch in a 'mflr r0'.
>>=20
>> Signed-off-by: Naveen N Rao <naveen@kernel.org>
>=20
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>=20
> Nit below
>=20
>> ---
>>   arch/powerpc/Kconfig                          | 14 +++++++---
>>   arch/powerpc/Makefile                         |  5 ++++
>>   arch/powerpc/include/asm/ftrace.h             |  6 +++--
>>   arch/powerpc/include/asm/vermagic.h           |  4 ++-
>>   arch/powerpc/kernel/module_64.c               |  2 +-
>>   arch/powerpc/kernel/trace/ftrace.c            | 14 ++++++++--
>>   arch/powerpc/kernel/trace/ftrace_entry.S      |  2 ++
>>   .../gcc-check-fpatchable-function-entry.sh    | 26 +++++++++++++++++++
>>   8 files changed, 64 insertions(+), 9 deletions(-)
>>   create mode 100755 arch/powerpc/tools/gcc-check-fpatchable-function-en=
try.sh
>>=20
>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>> index bff5820b7cda14..9352d8e68152e1 100644
>> --- a/arch/powerpc/Kconfig
>> +++ b/arch/powerpc/Kconfig
>> @@ -187,6 +187,7 @@ config PPC
>>   	select DYNAMIC_FTRACE			if FUNCTION_TRACER
>>   	select EDAC_ATOMIC_SCRUB
>>   	select EDAC_SUPPORT
>> +	select FTRACE_MCOUNT_USE_PATCHABLE_FUNCTION_ENTRY if ARCH_USING_PATCHA=
BLE_FUNCTION_ENTRY
>>   	select GENERIC_ATOMIC64			if PPC32
>>   	select GENERIC_CLOCKEVENTS_BROADCAST	if SMP
>>   	select GENERIC_CMOS_UPDATE
>> @@ -227,8 +228,8 @@ config PPC
>>   	select HAVE_DEBUG_KMEMLEAK
>>   	select HAVE_DEBUG_STACKOVERFLOW
>>   	select HAVE_DYNAMIC_FTRACE
>> -	select HAVE_DYNAMIC_FTRACE_WITH_ARGS	if MPROFILE_KERNEL || PPC32
>> -	select HAVE_DYNAMIC_FTRACE_WITH_REGS	if MPROFILE_KERNEL || PPC32
>> +	select HAVE_DYNAMIC_FTRACE_WITH_ARGS	if ARCH_USING_PATCHABLE_FUNCTION_=
ENTRY || MPROFILE_KERNEL || PPC32
>> +	select HAVE_DYNAMIC_FTRACE_WITH_REGS	if ARCH_USING_PATCHABLE_FUNCTION_=
ENTRY || MPROFILE_KERNEL || PPC32
>=20
> ARCH_USING_PATCHABLE_FUNCTION_ENTRY defaults to y if PPC32, so you can=20
> remove PPC32 from the condition here.

ARCH_USING_PATCHABLE_FUNCTION_ENTRY also depends on compiler support for=20
-fpatchable-function-entry, and gcc v5.x doesn't support that. So, we=20
need to retain PPC32 here.

- Naveen

>=20
>>   	select HAVE_EBPF_JIT
>>   	select HAVE_EFFICIENT_UNALIGNED_ACCESS
>>   	select HAVE_FAST_GUP
>> @@ -256,7 +257,7 @@ config PPC
>>   	select HAVE_MOD_ARCH_SPECIFIC
>>   	select HAVE_NMI				if PERF_EVENTS || (PPC64 && PPC_BOOK3S)
>>   	select HAVE_OPTPROBES
>> -	select HAVE_OBJTOOL			if PPC32 || MPROFILE_KERNEL
>> +	select HAVE_OBJTOOL			if ARCH_USING_PATCHABLE_FUNCTION_ENTRY || MPROFI=
LE_KERNEL || PPC32
>=20
> Same
>=20
>>   	select HAVE_OBJTOOL_MCOUNT		if HAVE_OBJTOOL
>>   	select HAVE_PERF_EVENTS
>>   	select HAVE_PERF_EVENTS_NMI		if PPC64
>> @@ -550,6 +551,13 @@ config MPROFILE_KERNEL
>>   	depends on PPC64 && CPU_LITTLE_ENDIAN && FUNCTION_TRACER
>>   	def_bool $(success,$(srctree)/arch/powerpc/tools/gcc-check-mprofile-k=
ernel.sh $(CC) -I$(srctree)/include -D__KERNEL__)
>>  =20
>> +config ARCH_USING_PATCHABLE_FUNCTION_ENTRY
>> +	depends on FUNCTION_TRACER && (PPC32 || PPC64_ELF_ABI_V2)
>> +	depends on $(cc-option,-fpatchable-function-entry=3D2)
>> +	def_bool y if PPC32
>> +	def_bool $(success,$(srctree)/arch/powerpc/tools/gcc-check-fpatchable-=
function-entry.sh $(CC) -mlittle-endian) if PPC64 && CPU_LITTLE_ENDIAN
>> +	def_bool $(success,$(srctree)/arch/powerpc/tools/gcc-check-fpatchable-=
function-entry.sh $(CC) -mbig-endian) if PPC64 && CPU_BIG_ENDIAN
>> +
...
