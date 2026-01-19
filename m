Return-Path: <linuxppc-dev+bounces-15988-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 35255D3A9B3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jan 2026 14:00:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dvrD34FwHz3bfY;
	Tue, 20 Jan 2026 00:00:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768827635;
	cv=none; b=UY2NJcVCs4JEywqx8mR5MvffXDq/HcWSotUFMmMBkvWVi/q8fkMPDTJDCIduNNCYiaoaE02PaD1JNsyofSVV0+GD0qGahe2wjJaMqTwKo1AMFCDsXft5BtEBAAGzy+oosbs329HLauH3dZn/dXOHumg8KMJlrf/to/f5EkzDLsVVIicgSEakDj6dLTvWJogtABa1RISoOLrwZRJTdhpMlkc6p2aUcj4iWvizxz9sX2KbiuYI5aVAdVKEaeuiyLAkFA2bdk3guchRFBUdQnUb/Cneb6IDapDVQZEb1SvujhZI+bLa7HrknDA66SH0IgkbGhYR8FYF4HVmRPqdNRrPlA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768827635; c=relaxed/relaxed;
	bh=ugitXFfgFRjcDISf/XysOLFTpscvIjDGW97qu/hUWFI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d2CfTD4s76CkbsGMwelEV2IMicgwdcFC7lzUkwN7w+0xAGg7B5gy8mS5uEZnKROhD3CrERsPg1RsZLcLJYmxiwzSoogPbez3/9bgoTqHGW9Re90hRryA2pqZx51o+tWuIuziT/XyO6zhi3mVUUev0pt90S416NvtsFdAirXWd+Xh4tzqHeU/Tb/Sh5J+/TVVC+ZNvrA5AJeq8lgFeGfsdjJ+DjCqMKl1bTy992x5enydoH2LQ9HlAKN3XQ35RfnnUzrQN547lrd5Dgo1/56j4G0jjentY1S0YyHci8K2HHSH74U182ilhB77+yBPuN65e3wd4mCrEyM8gcqrTmhftQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dvrD25DV9z3bf3
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jan 2026 00:00:34 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AE1A4497;
	Mon, 19 Jan 2026 04:59:56 -0800 (PST)
Received: from [10.57.93.204] (unknown [10.57.93.204])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F3DC63F740;
	Mon, 19 Jan 2026 04:59:58 -0800 (PST)
Message-ID: <d3573f72-e476-43ba-8929-c3b6931d06f2@arm.com>
Date: Mon, 19 Jan 2026 12:59:57 +0000
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
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] Fix bugs and performance of kstack offset
 randomisation
Content-Language: en-GB
To: Mark Rutland <mark.rutland@arm.com>, Kees Cook <kees@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, Arnd Bergmann
 <arnd@arndb.de>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Ard Biesheuvel <ardb@kernel.org>, Jeremy Linton <jeremy.linton@arm.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20260102131156.3265118-1-ryan.roberts@arm.com>
 <aW4NC9P3K7Ab_e8j@J2N7QTR9R3>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <aW4NC9P3K7Ab_e8j@J2N7QTR9R3>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 19/01/2026 10:52, Mark Rutland wrote:
> On Fri, Jan 02, 2026 at 01:11:51PM +0000, Ryan Roberts wrote:
>> Hi All,
> 
> Hi Ryan,
> 
>> As I reported at [1], kstack offset randomisation suffers from a couple of bugs
>> and, on arm64 at least, the performance is poor. This series attempts to fix
>> both; patch 1 provides back-portable fixes for the functional bugs. Patches 2-3
>> propose a performance improvement approach.
>>
>> I've looked at a few different options but ultimately decided that Jeremy's
>> original prng approach is the fastest. I made the argument that this approach is
>> secure "enough" in the RFC [2] and the responses indicated agreement.
> 
> FWIW, the series all looks good to me. I understand you're likely to
> spin a v4 with a couple of minor tweaks (fixing typos and adding an
> out-of-line wrapper for a prandom function), but I don't think there's
> anything material that needs to change.

Thanks for the review, Mark! v4 incomming...

> 
> I've given my Ack on all three patches. I've given the series a quick
> boot test (atop v6.19-rc4) with a bunch of debug options enabled, and
> all looks well.
> 
> Kees, do you have any comments? It would be nice if we could queue this
> up soon.
> 
> Mark.
> 
>> More details in the commit logs.
>>
>>
>> Performance
>> ===========
>>
>> Mean and tail performance of 3 "small" syscalls was measured. syscall was made
>> 10 million times and each individually measured and binned. These results have
>> low noise so I'm confident that they are trustworthy.
>>
>> The baseline is v6.18-rc5 with stack randomization turned *off*. So I'm showing
>> performance cost of turning it on without any changes to the implementation,
>> then the reduced performance cost of turning it on with my changes applied.
>>
>> **NOTE**: The below results were generated using the RFC patches but there is no
>> meaningful change, so the numbers are still valid.
>>
>> arm64 (AWS Graviton3):
>> +-----------------+--------------+-------------+---------------+
>> | Benchmark       | Result Class |   v6.18-rc5 | per-task-prng |
>> |                 |              | rndstack-on |               |
>> |                 |              |             |               |
>> +=================+==============+=============+===============+
>> | syscall/getpid  | mean (ns)    |  (R) 15.62% |     (R) 3.43% |
>> |                 | p99 (ns)     | (R) 155.01% |     (R) 3.20% |
>> |                 | p99.9 (ns)   | (R) 156.71% |     (R) 2.93% |
>> +-----------------+--------------+-------------+---------------+
>> | syscall/getppid | mean (ns)    |  (R) 14.09% |     (R) 2.12% |
>> |                 | p99 (ns)     | (R) 152.81% |         1.55% |
>> |                 | p99.9 (ns)   | (R) 153.67% |         1.77% |
>> +-----------------+--------------+-------------+---------------+
>> | syscall/invalid | mean (ns)    |  (R) 13.89% |     (R) 3.32% |
>> |                 | p99 (ns)     | (R) 165.82% |     (R) 3.51% |
>> |                 | p99.9 (ns)   | (R) 168.83% |     (R) 3.77% |
>> +-----------------+--------------+-------------+---------------+
>>
>> Because arm64 was previously using get_random_u16(), it was expensive when it
>> didn't have any buffered bits and had to call into the crng. That's what caused
>> the enormous tail latency.
>>
>>
>> x86 (AWS Sapphire Rapids):
>> +-----------------+--------------+-------------+---------------+
>> | Benchmark       | Result Class |   v6.18-rc5 | per-task-prng |
>> |                 |              | rndstack-on |               |
>> |                 |              |             |               |
>> +=================+==============+=============+===============+
>> | syscall/getpid  | mean (ns)    |  (R) 13.32% |     (R) 4.60% |
>> |                 | p99 (ns)     |  (R) 13.38% |    (R) 18.08% |
>> |                 | p99.9 (ns)   |      16.26% |    (R) 19.38% |
>> +-----------------+--------------+-------------+---------------+
>> | syscall/getppid | mean (ns)    |  (R) 11.96% |     (R) 5.26% |
>> |                 | p99 (ns)     |  (R) 11.83% |     (R) 8.35% |
>> |                 | p99.9 (ns)   |  (R) 11.42% |    (R) 22.37% |
>> +-----------------+--------------+-------------+---------------+
>> | syscall/invalid | mean (ns)    |  (R) 10.58% |     (R) 2.91% |
>> |                 | p99 (ns)     |  (R) 10.51% |     (R) 4.36% |
>> |                 | p99.9 (ns)   |  (R) 10.35% |    (R) 21.97% |
>> +-----------------+--------------+-------------+---------------+
>>
>> I was surprised to see that the baseline cost on x86 is 10-12% since it is just
>> using rdtsc. But as I say, I believe the results are accurate.
>>
>>
>> Changes since v2 (RFC) [3]
>> ==========================
>>
>> - Moved late_initcall() to initialize kstack_rnd_state out of
>>   randomize_kstack.h and into main.c. (issue noticed by kernel test robot)
>>
>> Changes since v1 (RFC) [2]
>> ==========================
>>
>> - Introduced patch 2 to make prandom_u32_state() __always_inline (needed since
>>   its called from noinstr code)
>> - In patch 3, prng is now per-cpu instead of per-task (per Ard)
>>
>>
>> [1] https://lore.kernel.org/all/dd8c37bc-795f-4c7a-9086-69e584d8ab24@arm.com/
>> [2] https://lore.kernel.org/all/20251127105958.2427758-1-ryan.roberts@arm.com/
>> [3] https://lore.kernel.org/all/20251215163520.1144179-1-ryan.roberts@arm.com/
>>
>> Thanks,
>> Ryan
>>
>>
>> Ryan Roberts (3):
>>   randomize_kstack: Maintain kstack_offset per task
>>   prandom: Convert prandom_u32_state() to __always_inline
>>   randomize_kstack: Unify random source across arches
>>
>>  arch/Kconfig                         |  5 ++-
>>  arch/arm64/kernel/syscall.c          | 11 ------
>>  arch/loongarch/kernel/syscall.c      | 11 ------
>>  arch/powerpc/kernel/syscall.c        | 12 -------
>>  arch/riscv/kernel/traps.c            | 12 -------
>>  arch/s390/include/asm/entry-common.h |  8 -----
>>  arch/x86/include/asm/entry-common.h  | 12 -------
>>  include/linux/prandom.h              | 19 +++++++++-
>>  include/linux/randomize_kstack.h     | 54 +++++++++++-----------------
>>  init/main.c                          |  9 ++++-
>>  kernel/fork.c                        |  1 +
>>  lib/random32.c                       | 19 ----------
>>  12 files changed, 49 insertions(+), 124 deletions(-)
>>
>> --
>> 2.43.0
>>


