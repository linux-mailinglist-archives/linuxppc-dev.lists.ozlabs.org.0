Return-Path: <linuxppc-dev+bounces-15990-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA12D3A9C5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jan 2026 14:02:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dvrFp5PJtz3bfV;
	Tue, 20 Jan 2026 00:02:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768827726;
	cv=none; b=aUPavEZ07Ri4Edqam64CSI0mmH3+4ow2EQ+7xNlqm+KI83q0PUfOV4Qu32/KFX27auNDCj88785h+/qKQtZk6BePSIeFAJnDCYVD6jKYS1lwioBc9DEznv9Iz+eb1+Gg/pKEzkAvFSSWvMNNVE2ueixJai4ZzNlAcj6HQIzp01auYXFfcMNi3RhBtK6x9rTYeWaPRDS97D0kID78dDqDUK3862Oit0aQ/Si31fmPbA7Keq3JcP+gbqVbgBbLcF23yv6mtPm8ZU1DKGxWgtMXItCXRU1RMlads9kFJfQE2P+/IizzNqmmEGMjaswf3V0FQLcpyaCm3Xpb0UKByh/98g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768827726; c=relaxed/relaxed;
	bh=SRiqYM3jk38SNVDdGTWvhOoxAdz87tQ9o5v3/qDk3+A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XEDOUQvyzToSzWpe2oxfKxDX2G6Jwp9mu1RofW5ghtY1QGh1Q31gbU+PBZx8IX8kxk/Ydr/NpCBi+NQm5tc6DelkdhoSDDt4sQFKP+vRMDhGaCJDJ3mPlAZ+MMtVpllBsaKh2FCoQrbTyCkyZwX5XJx3zxVkeHX+az6OixfGJ7DEkj2eAE+q641A6F3ownaWkCwJuaup1TYqyES/DnJWqLThdTeUUw5IUAsnxYp5eplKU/hvOgWc6sL+2lK5o8Vidz3CiWPKa3FJ+wMol6UXsIEaHhhFy/1hsVrW841ikBGIU0l+9F49J05zakyH6n7WmXjGCbwQrBGkrdvcoRRjXA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dvrFn5LwTz3bf4
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jan 2026 00:02:05 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BA896497;
	Mon, 19 Jan 2026 05:01:27 -0800 (PST)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ECD0C3F740;
	Mon, 19 Jan 2026 05:01:30 -0800 (PST)
From: Ryan Roberts <ryan.roberts@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Mark Rutland <mark.rutland@arm.com>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	David Laight <david.laight.linux@gmail.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH v4 0/3] Fix bugs and performance of kstack offset randomisation
Date: Mon, 19 Jan 2026 13:01:07 +0000
Message-ID: <20260119130122.1283821-1-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
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
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

[Kees; I'm hoping this is now good-to-go via your hardening tree? Please shout
if you think there is more work to be done here!]

Hi All,

As I reported at [1], kstack offset randomisation suffers from a couple of bugs
and, on arm64 at least, the performance is poor. This series attempts to fix
both; patch 1 provides back-portable fixes for the functional bugs. Patches 2-3
propose a performance improvement approach.

I've looked at a few different options but ultimately decided that Jeremy's
original prng approach is the fastest. I made the argument that this approach is
secure "enough" in the RFC [2] and the responses indicated agreement.

More details in the commit logs.


Performance
===========

Mean and tail performance of 3 "small" syscalls was measured. syscall was made
10 million times and each individually measured and binned. These results have
low noise so I'm confident that they are trustworthy.

The baseline is v6.18-rc5 with stack randomization turned *off*. So I'm showing
performance cost of turning it on without any changes to the implementation,
then the reduced performance cost of turning it on with my changes applied.

**NOTE**: The below results were generated using the RFC patches but there is no
meaningful change, so the numbers are still valid.

arm64 (AWS Graviton3):
+-----------------+--------------+-------------+---------------+
| Benchmark       | Result Class |   v6.18-rc5 | per-task-prng |
|                 |              | rndstack-on |               |
|                 |              |             |               |
+=================+==============+=============+===============+
| syscall/getpid  | mean (ns)    |  (R) 15.62% |     (R) 3.43% |
|                 | p99 (ns)     | (R) 155.01% |     (R) 3.20% |
|                 | p99.9 (ns)   | (R) 156.71% |     (R) 2.93% |
+-----------------+--------------+-------------+---------------+
| syscall/getppid | mean (ns)    |  (R) 14.09% |     (R) 2.12% |
|                 | p99 (ns)     | (R) 152.81% |         1.55% |
|                 | p99.9 (ns)   | (R) 153.67% |         1.77% |
+-----------------+--------------+-------------+---------------+
| syscall/invalid | mean (ns)    |  (R) 13.89% |     (R) 3.32% |
|                 | p99 (ns)     | (R) 165.82% |     (R) 3.51% |
|                 | p99.9 (ns)   | (R) 168.83% |     (R) 3.77% |
+-----------------+--------------+-------------+---------------+

Because arm64 was previously using get_random_u16(), it was expensive when it
didn't have any buffered bits and had to call into the crng. That's what caused
the enormous tail latency.


x86 (AWS Sapphire Rapids):
+-----------------+--------------+-------------+---------------+
| Benchmark       | Result Class |   v6.18-rc5 | per-task-prng |
|                 |              | rndstack-on |               |
|                 |              |             |               |
+=================+==============+=============+===============+
| syscall/getpid  | mean (ns)    |  (R) 13.32% |     (R) 4.60% |
|                 | p99 (ns)     |  (R) 13.38% |    (R) 18.08% |
|                 | p99.9 (ns)   |      16.26% |    (R) 19.38% |
+-----------------+--------------+-------------+---------------+
| syscall/getppid | mean (ns)    |  (R) 11.96% |     (R) 5.26% |
|                 | p99 (ns)     |  (R) 11.83% |     (R) 8.35% |
|                 | p99.9 (ns)   |  (R) 11.42% |    (R) 22.37% |
+-----------------+--------------+-------------+---------------+
| syscall/invalid | mean (ns)    |  (R) 10.58% |     (R) 2.91% |
|                 | p99 (ns)     |  (R) 10.51% |     (R) 4.36% |
|                 | p99.9 (ns)   |  (R) 10.35% |    (R) 21.97% |
+-----------------+--------------+-------------+---------------+

I was surprised to see that the baseline cost on x86 is 10-12% since it is just
using rdtsc. But as I say, I believe the results are accurate.


Changes since v3 (RFC) [4]
==========================

- Patch 1: Fixed typo in commit log (per David L)
- Patch 2: Reinstated prandom_u32_state() as out-of-line function, which
  forwards to inline version (per David L)
- Patch 3: Added supplementary info about benefits of removing
  choose_random_kstack_offset() (per Mark R)

Changes since v2 (RFC) [3]
==========================

- Moved late_initcall() to initialize kstack_rnd_state out of
  randomize_kstack.h and into main.c. (issue noticed by kernel test robot)

Changes since v1 (RFC) [2]
==========================

- Introduced patch 2 to make prandom_u32_state() __always_inline (needed since
  its called from noinstr code)
- In patch 3, prng is now per-cpu instead of per-task (per Ard)


[1] https://lore.kernel.org/all/dd8c37bc-795f-4c7a-9086-69e584d8ab24@arm.com/
[2] https://lore.kernel.org/all/20251127105958.2427758-1-ryan.roberts@arm.com/
[3] https://lore.kernel.org/all/20251215163520.1144179-1-ryan.roberts@arm.com/
[4] https://lore.kernel.org/all/20260102131156.3265118-1-ryan.roberts@arm.com/

Thanks,
Ryan

Ryan Roberts (3):
  randomize_kstack: Maintain kstack_offset per task
  prandom: Add __always_inline version of prandom_u32_state()
  randomize_kstack: Unify random source across arches

 arch/Kconfig                         |  5 ++-
 arch/arm64/kernel/syscall.c          | 11 ------
 arch/loongarch/kernel/syscall.c      | 11 ------
 arch/powerpc/kernel/syscall.c        | 12 -------
 arch/riscv/kernel/traps.c            | 12 -------
 arch/s390/include/asm/entry-common.h |  8 -----
 arch/x86/include/asm/entry-common.h  | 12 -------
 include/linux/prandom.h              | 20 +++++++++++
 include/linux/randomize_kstack.h     | 54 +++++++++++-----------------
 init/main.c                          |  9 ++++-
 kernel/fork.c                        |  1 +
 lib/random32.c                       |  8 +----
 12 files changed, 52 insertions(+), 111 deletions(-)

--
2.43.0


