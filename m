Return-Path: <linuxppc-dev+bounces-17580-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EKUAO6z5pmk7bgAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17580-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 16:09:32 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC7B1F214B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 16:09:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fQK2w23C3z3bt7;
	Wed, 04 Mar 2026 02:09:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772550568;
	cv=none; b=LflnxgCjcWPYE4RKbl568InbUg5VSXRF0YK2xdkaN6B+mvNsBj5HzGo/AhBR94QXKyjSSVKjeL8QttFeleVKv91wNr9MbZsiErXVpKSnvaEnHuf5wXHzh/Y0q+av9ustsEapgnZNTOpe+dF5hgLIDxlcYElSaJeqOIMMT8nvmNPGA+cGOIeSUgXAhfcLHxqhH8wU/B6odoJcfmaj22S0Nqz4dDkN1s1ZtbK3bY90bFG8LJuyoZ6xOGj7ooOGw5+UKWz38w9fqN64TZls4RJ27JGTr6H5e4Y5ai1a/xqgUSbqX99whdzSATczwMdAvK5V3L8SlEnQY2kQ7V4ma1ijZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772550568; c=relaxed/relaxed;
	bh=u1irBI3Qg9XV0N5BV64pChl7BI8sZcObWb8NEpaom+g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Sj2OKRbBF+x6omI08Y6gi/BuwIbspYyEhJzA4H39V+CQ76ngHxhI6HlyGT/a7n0Vs03MunxynD2p/5PGu1RiGFkrzrcAVyWUM5lrK3+8a4/jIPGZQ24QytKlijHQg9a4UlP1MuUwk8rnVRBN3SCUtKTiu4+j6GVV+/Edo7HX2EEDhWSPu7WdSYlJF1zNB3GsQwQtX725mYJiKt/fax3TVk02tSwLw8BY7wUEvRnUesNTWeFYBFPt37OaHmpALWBukIVDu7RJW06YhHpCLBu011S/2urEAhscwOEd5LoJmFIbXvhhEJ55OfZzSAln86prwa+MSyFq+eedwQ53qE+dLQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fQK2v1CkQz3bsC
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2026 02:09:26 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 36D46339;
	Tue,  3 Mar 2026 07:08:49 -0800 (PST)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5C1D23F73B;
	Tue,  3 Mar 2026 07:08:51 -0800 (PST)
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
Subject: [PATCH v5 0/2] Fix bugs and performance of kstack offset randomisation
Date: Tue,  3 Mar 2026 15:08:37 +0000
Message-ID: <20260303150840.3789438-1-ryan.roberts@arm.com>
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
X-Rspamd-Queue-Id: DDC7B1F214B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.59 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	TAGGED_FROM(0.00)[bounces-17580-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:catalin.marinas@arm.com,m:will@kernel.org,m:chenhuacai@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:tglx@linutronix.de,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:kees@kernel.org,m:gustavoars@kernel.org,m:arnd@arndb.de,m:mark.rutland@arm.com,m:Jason@zx2c4.com,m:ardb@kernel.org,m:jeremy.linton@arm.com,m:david.laight.linux@gmail.com,m:ryan.roberts@arm.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:loongarch@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:linux-riscv@lists.infradead.org,m:linux-s390@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:davidlaightlinux@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[ryan.roberts@arm.com,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[arm.com,kernel.org,linux.ibm.com,ellerman.id.au,dabbelt.com,eecs.berkeley.edu,linutronix.de,redhat.com,alien8.de,linux.intel.com,arndb.de,zx2c4.com,gmail.com];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[ryan.roberts@arm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.956];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo,arm.com:mid]
X-Rspamd-Action: no action

[Kees; I'm hoping this is now good-to-go via your hardening tree? It would be
good to get some linux-next testing.]

Hi All,

As I reported at [1], kstack offset randomisation suffers from a couple of bugs
and, on arm64 at least, the performance is poor. This series attempts to fix
both; patch 1 provides back-portable fixes for the functional bugs. Patch 2
proposes a performance improvement approach.

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
meaningful change, so the numbers are still valid. I've also rerun the tests
with this version on top of v7.0-rc2 on arm64 and confirmed simialr results.

arm64 (AWS Graviton3):
+-----------------+--------------+-------------+---------------+
| Benchmark       | Result Class |   v6.18-rc5 |  per-cpu-prng |
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
| Benchmark       | Result Class |   v6.18-rc5 |  per-cpu-prng |
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


Changes since v4 [5]
====================

- Moved add_random_kstack_offset() later in syscall entry code for powerpc, s390
  and x86. On these platforms it was previously within noinstr sections but for
  some exotic Kconfigs, [get|put]_cpu_var() was calling out to instrumentable
  code. (reported by kernel test robot)
- Removed what was previously patch 2 (inline version of prandom_u32_state()).
  With the above change, there is no longer an issue with calling the
  out-of-line version.

Changes since v3 [4]
====================

- Patch 1: Fixed typo in commit log (per David L)
- Patch 2: Reinstated prandom_u32_state() as out-of-line function, which
  forwards to inline version (per David L)
- Patch 3: Added supplementary info about benefits of removing
  choose_random_kstack_offset() (per Mark R)

Changes since v2 [3]
====================

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
[5] https://lore.kernel.org/all/20260119130122.1283821-1-ryan.roberts@arm.com

Thanks,
Ryan


Ryan Roberts (2):
  randomize_kstack: Maintain kstack_offset per task
  randomize_kstack: Unify random source across arches

 arch/Kconfig                         |  5 ++-
 arch/arm64/kernel/syscall.c          | 11 ------
 arch/loongarch/kernel/syscall.c      | 11 ------
 arch/powerpc/kernel/syscall.c        | 16 ++-------
 arch/riscv/kernel/traps.c            | 12 -------
 arch/s390/include/asm/entry-common.h |  8 -----
 arch/s390/kernel/syscall.c           |  2 +-
 arch/x86/entry/syscall_32.c          |  4 +--
 arch/x86/entry/syscall_64.c          |  2 +-
 arch/x86/include/asm/entry-common.h  | 12 -------
 include/linux/randomize_kstack.h     | 54 +++++++++++-----------------
 init/main.c                          |  9 ++++-
 kernel/fork.c                        |  1 +
 13 files changed, 37 insertions(+), 110 deletions(-)

--
2.43.0


