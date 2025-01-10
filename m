Return-Path: <linuxppc-dev+bounces-4930-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BAA8A085EA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jan 2025 04:26:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YTnB42llmz3023;
	Fri, 10 Jan 2025 14:26:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.137.202.136
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736479580;
	cv=none; b=CIs9oU7E+IPHffoQm6UK4TzO7jnx3F2j7G05r0WtHR4QWFqKu3f7FzLNzxxs4yMpJg7UvYJ6WvU1cEsh72n5BIo/XyAlXFRn5sZ/VOx60zSSiOlVnibby5u8DXX2Tmp2N/ifv8QGZfnqhmEOO5plhsHpjKxvQ+//bnfTDNe9f+TgxA1wCYErqExNMqCE2Z/sDLSoV+LBlPZ+P+H5SpneT/o2QWCo+fj8XgDLo3BiKI/hPkjo2u0O86X3Uh8bDESyH72AuDJZWcGApZwjzoJgsnO+NOmVE9GdO3XotGtxPc2xGsyY1oV7MWNmEW4BB3hzD42zGIfDSjG9x7CQPh8ruQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736479580; c=relaxed/relaxed;
	bh=2Gsk7+JP3PoZg8VhoEWFUmet8fDEOviqEDX2siCLmXA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TfNqtDT5G4ZD+NxrcHrjCqJvDR8thhwkvBtBe812LakXZMXqs2cvTUFHp4XCUZHRE2W6xGtReuJ/MmD8cpAchZXZK0Sn1JV9onaIhX3Hin+e2dT1WX4QcRs8rclHc85flHtUoWsMoQG4Y4tJnOoqt8DCp4GAUrJK39rUH5JtK2aa4yKv5ajGKC+quoVLnd5VKt+LYGiUhu2AzjbBj8SYIiPAo4bM3PzX8I3LAbC9ZtSToioCI5YI8tu0PLo/Lasrzs5WXPng/Cs+9PCKstdmpN0yjv1z/kGLHRIDd/VtZG8j7J/lx4572bPIZ2+SbVIlM/cUvWhhDXONPGG2YQETVQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zytor.com; dkim=pass (2048-bit key; unprotected) header.d=zytor.com header.i=@zytor.com header.a=rsa-sha256 header.s=2024121701 header.b=UI2PWbpd; dkim-atps=neutral; spf=pass (client-ip=198.137.202.136; helo=terminus.zytor.com; envelope-from=hpa@zytor.com; receiver=lists.ozlabs.org) smtp.mailfrom=zytor.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=zytor.com header.i=@zytor.com header.a=rsa-sha256 header.s=2024121701 header.b=UI2PWbpd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=zytor.com (client-ip=198.137.202.136; helo=terminus.zytor.com; envelope-from=hpa@zytor.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 300 seconds by postgrey-1.37 at boromir; Fri, 10 Jan 2025 14:26:17 AEDT
Received: from terminus.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YTnB151Cdz2ynR
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2025 14:26:17 +1100 (AEDT)
Received: from [IPV6:2601:646:8080:c1f1:e386:c572:17d3:6ddc] ([IPv6:2601:646:8080:c1f1:e386:c572:17d3:6ddc])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 50A3FGON981507
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Thu, 9 Jan 2025 19:15:22 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 50A3FGON981507
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2024121701; t=1736478939;
	bh=2Gsk7+JP3PoZg8VhoEWFUmet8fDEOviqEDX2siCLmXA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UI2PWbpd/173uf8ET7OhKCSxHMq3wIV9uPwlDabKLopTn4XQlVOW2UhdDhLNKQ2ou
	 8eY5IkJPjKd/ufxYXpC3T7ngILIHHww7s3f/TxHKadq33uowsRPtdqvlulWYDcl4s8
	 98gF9cD/iHRBhl+LkNR2Vz4dcuRwuyCMkzCPxTONo9GrePkGJYLa5vUD7mYV9L5Uos
	 ee2fTgpV4TmVkm3/EnjzCs2Wh3is/8drjYQa4kdxx6i4NZ58BWsIW3fEOCUEzu/US4
	 z0xQ+UHFUiZOJoDRJIqr/23SWWVPTNXl6Nb/6Jv9OAyLaNK9jKDb4DWbnzq60xty/Q
	 X0SCgYzOXKJQw==
Message-ID: <4536aca6-c430-4cf9-a98f-8282c7378955@zytor.com>
Date: Thu, 9 Jan 2025 19:15:09 -0800
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] ptrace: introduce PTRACE_SET_SYSCALL_INFO API
To: "Dmitry V. Levin" <ldv@strace.io>, Oleg Nesterov <oleg@redhat.com>
Cc: Eugene Syromyatnikov <evgsyr@gmail.com>,
        Mike Frysinger <vapier@gentoo.org>, Renzo Davoli <renzo@cs.unibo.it>,
        Davide Berardi <berardi.dav@gmail.com>, strace-devel@lists.strace.io,
        Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
        Brian Cain <bcain@quicinc.com>, Huacai Chen <chenhuacai@kernel.org>,
        WANG Xuerui <kernel@xen0n.name>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michal Simek <monstr@monstr.eu>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>,
        Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
        Stafford Horne <shorne@gmail.com>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt
 <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Yoshinori Sato <ysato@users.osdn.me>, Rich Felker <dalias@libc.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        "David S. Miller" <davem@davemloft.net>,
        Andreas Larsson <andreas@gaisler.com>,
        Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>, Shuah Khan <shuah@kernel.org>,
        linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
        linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
        linux-m68k@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
        linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20250107230153.GA30560@strace.io>
Content-Language: en-US
From: "H. Peter Anvin" <hpa@zytor.com>
In-Reply-To: <20250107230153.GA30560@strace.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

This would seem like a very good idea. However, it is perhaps important 
to realize that it doesn't fully eliminate the problems with 64-bit 
arguments on 32-bit ABIs being handled differently (never mind 
inconsistencies in system call ABIs etc.) There isn't all that much that 
can be done about that directly, though.

	-hpa


On 1/7/25 15:01, Dmitry V. Levin wrote:
> PTRACE_SET_SYSCALL_INFO is a generic ptrace API that complements
> PTRACE_GET_SYSCALL_INFO by letting the ptracer modify details of
> system calls the tracee is blocked in.
> 
> This API allows ptracers to obtain and modify system call details
> in a straightforward and architecture-agnostic way.
> 
> Current implementation supports changing only those bits of system call
> information that are used by strace, namely, syscall number, syscall
> arguments, and syscall return value.
> 
> Support of changing additional details returned by PTRACE_GET_SYSCALL_INFO,
> such as instruction pointer and stack pointer, could be added later
> if needed, by re-using struct ptrace_syscall_info.reserved to specify
> the additional details that should be set.  Currently, the reserved
> field of struct ptrace_syscall_info must be initialized with zeroes;
> arch, instruction_pointer, and stack_pointer fields are ignored.
> 
> PTRACE_SET_SYSCALL_INFO currently supports only PTRACE_SYSCALL_INFO_ENTRY,
> PTRACE_SYSCALL_INFO_EXIT, and PTRACE_SYSCALL_INFO_SECCOMP operations.
> Other operations could be added later if needed.
> 
> Ideally, PTRACE_SET_SYSCALL_INFO should have been introduced along with
> PTRACE_GET_SYSCALL_INFO, but it didn't happen.  The last straw that
> convinced me to implement PTRACE_SET_SYSCALL_INFO was apparent failure
> to provide an API of changing the first system call argument on riscv
> architecture [1].
> 
> ptrace(2) man page:
> 
> long ptrace(enum __ptrace_request request, pid_t pid, void *addr, void *data);
> ...
> PTRACE_SET_SYSCALL_INFO
>         Modify information about the system call that caused the stop.
>         The "data" argument is a pointer to struct ptrace_syscall_info
>         that specifies the system call information to be set.
>         The "addr" argument should be set to sizeof(struct ptrace_syscall_info)).
> 
> [1] https://lore.kernel.org/all/59505464-c84a-403d-972f-d4b2055eeaac@gmail.com/
> 
> Dmitry V. Levin (6):
>    Revert "arch: remove unused function syscall_set_arguments()"
>    syscall.h: add syscall_set_arguments() on remaining
>      HAVE_ARCH_TRACEHOOK arches
>    syscall.h: introduce syscall_set_nr()
>    ptrace_get_syscall_info: factor out ptrace_get_syscall_info_op
>    ptrace: introduce PTRACE_SET_SYSCALL_INFO request
>    selftests/ptrace: add a test case for PTRACE_SET_SYSCALL_INFO
> 
>   arch/arc/include/asm/syscall.h                |  20 +
>   arch/arm/include/asm/syscall.h                |  25 +
>   arch/arm64/include/asm/syscall.h              |  20 +
>   arch/csky/include/asm/syscall.h               |  13 +
>   arch/hexagon/include/asm/syscall.h            |  14 +
>   arch/loongarch/include/asm/syscall.h          |  15 +
>   arch/m68k/include/asm/syscall.h               |   7 +
>   arch/microblaze/include/asm/syscall.h         |   7 +
>   arch/mips/include/asm/syscall.h               |  53 +++
>   arch/nios2/include/asm/syscall.h              |  16 +
>   arch/openrisc/include/asm/syscall.h           |  13 +
>   arch/parisc/include/asm/syscall.h             |  19 +
>   arch/powerpc/include/asm/syscall.h            |  15 +
>   arch/riscv/include/asm/syscall.h              |  16 +
>   arch/s390/include/asm/syscall.h               |  19 +
>   arch/sh/include/asm/syscall_32.h              |  19 +
>   arch/sparc/include/asm/syscall.h              |  17 +
>   arch/um/include/asm/syscall-generic.h         |  19 +
>   arch/x86/include/asm/syscall.h                |  43 ++
>   arch/xtensa/include/asm/syscall.h             |  18 +
>   include/asm-generic/syscall.h                 |  30 ++
>   include/linux/ptrace.h                        |   3 +
>   include/uapi/linux/ptrace.h                   |   3 +-
>   kernel/ptrace.c                               | 154 ++++++-
>   tools/testing/selftests/ptrace/Makefile       |   2 +-
>   .../selftests/ptrace/set_syscall_info.c       | 436 ++++++++++++++++++
>   26 files changed, 994 insertions(+), 22 deletions(-)
>   create mode 100644 tools/testing/selftests/ptrace/set_syscall_info.c
> 


