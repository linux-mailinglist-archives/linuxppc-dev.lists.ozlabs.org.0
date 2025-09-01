Return-Path: <linuxppc-dev+bounces-11583-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFDA5B3E6FE
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Sep 2025 16:25:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cFrkF6fMMz2yyd;
	Tue,  2 Sep 2025 00:25:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756732253;
	cv=none; b=C/9x3MrPFHfOQ0Cgvq3oC+vrV9+09Q84cMmm4TWHlb4i6ysKmK5TS/Ja+WcAUkvsig+rdTH78sixQa7G63yDGVlis4hGkcpCKxtBNMGpzNtGTUutFV/AklR79XOZVAMFfhsIIZrfRv2LM3o9yXyz8aGqQqxyRQreIlxCFRawuWlctgR4O/moNddZhSx7WTuwvaq/hnqD/9FpPH9vJjdsLblWo7wlpQdQess26gsPSBrZPoKvvNDy8PSeM+zAdkrwPMOH7CIP9qBvXDdGOlNNiWsCI8Qw1ZbNldhRsczAX5S1MLdQF1BkwnHVozonYpdzwCmUDKGWCVVdtHrrSJtxrA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756732253; c=relaxed/relaxed;
	bh=qKoMpF8r8MCAPJ3SA7fwplAuNdvaZXenQw4yNq+mkeI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lmBzcVumx+j17VZbthDFFTui1ejQO7iP11ZJRLVV04LzMpBoOavjQ5+3+mJI11EjKPcsEkMMhWiF5UJF/7Icso9stAaghuPOuZp7RLUz0j8N6iaBpHdk6Tg96QNDfsMntjwMyr0hzAaA8KReXUpHTfhxF+Lo7YJzQSfig+XM9G0CiCnBj4BrQMTISylntpLntJzP2FaqlHxdIMAfjIMMyPHm4idbzJGrUorgWFCeaWKJ2Pz3RtXYvLmJyGEs5XOu9frp0cn16vtR12bgH6w//+OvhHx0UxxbG4eNOnSaIl+m7drL7mIRA4MMInNL8jxg17gIHdtfZ5SDG3F7ACVj3Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KQpP1hz3; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=devnull+schuster.simon.siemens-energy.com@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KQpP1hz3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=devnull+schuster.simon.siemens-energy.com@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cFq4Y0TyQz2yqP
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Sep 2025 23:10:52 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 818B6601D9;
	Mon,  1 Sep 2025 13:10:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 29F3DC4CEF4;
	Mon,  1 Sep 2025 13:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756732249;
	bh=l+zEh4GN06CwujvuIj3y3Fd32BGM/P2y+zLD4+u7l7M=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=KQpP1hz3p7pySlQA+S80YSRFmx1/RZzMbVqgwb6DJ7FII9WAZ2aC0Vkb2bY2IPIgo
	 5RCwWfOsqj6oH3/pX4lIDCuOOnNj9pXtQBn1tnrmIQEH+XVh9Y1PJP+hS509fIk0oM
	 7NnEVi31nSQ/8MpxGe34E6NqS5meKjX8tV7J4kEDUQj4qbBrjxI9QxaHniIUyy3yEY
	 gtjmo/KHVVgmCi45l9Q6BNFzV43IAWtjbRH902bx28dItj0RpqcveeXYME8ipfRIBt
	 uCZQnUdWBrjyoriL6ICoig8e7WsKXoloqJHchCd36LnqZQtWt5aeK+UBbdVHOc8NTG
	 YbdnooPnpDcUg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0481CCA1002;
	Mon,  1 Sep 2025 13:10:49 +0000 (UTC)
From: Simon Schuster via B4 Relay <devnull+schuster.simon.siemens-energy.com@kernel.org>
Subject: [PATCH v2 0/4] nios2: Add architecture support for clone3
Date: Mon, 01 Sep 2025 15:09:49 +0200
Message-Id: <20250901-nios2-implement-clone3-v2-0-53fcf5577d57@siemens-energy.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB2btWgC/3WNzQqDMBCEX0Vy7pZkrT/05HsUD5quuqCJZEUq4
 rs3Sq89fsPMN7sSCkyinsmuAq0s7F0EvCXKDo3rCfgdWaHGTJemBMdeEHiaR5rILWBH7yiFosM
 MLeoy162K4zlQx59L/KojDyyLD9v1s5oz/SnR/FOuBjSYtsWHNkVa5E0lfBYEyFHot7v1k6qP4
 /gCMZ8FFcUAAAA=
X-Change-ID: 20250818-nios2-implement-clone3-7f252c20860b
To: Dinh Nguyen <dinguyen@kernel.org>, 
 Christian Brauner <brauner@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@redhat.com>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
 Juri Lelli <juri.lelli@redhat.com>, 
 Vincent Guittot <vincent.guittot@linaro.org>, 
 Dietmar Eggemann <dietmar.eggemann@arm.com>, 
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, 
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, 
 Kees Cook <kees@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Guo Ren <guoren@kernel.org>, 
 Oleg Nesterov <oleg@redhat.com>, Jens Axboe <axboe@kernel.dk>, 
 Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
 Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
 =?utf-8?q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
 Paul Moore <paul@paul-moore.com>, Serge Hallyn <sergeh@kernel.org>, 
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 John Johansen <john.johansen@canonical.com>, 
 Stephen Smalley <stephen.smalley.work@gmail.com>, 
 Ondrej Mosnacek <omosnace@redhat.com>, 
 Kentaro Takeda <takedakn@nttdata.co.jp>, 
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>, 
 Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Brian Cain <bcain@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
 WANG Xuerui <kernel@xen0n.name>, Geert Uytterhoeven <geert@linux-m68k.org>, 
 Michal Simek <monstr@monstr.eu>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Jonas Bonn <jonas@southpole.se>, 
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, 
 Stafford Horne <shorne@gmail.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 Andreas Larsson <andreas@gaisler.com>, Richard Weinberger <richard@nod.at>, 
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
 Johannes Berg <johannes@sipsolutions.net>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>, 
 Max Filippov <jcmvbkbc@gmail.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-csky@vger.kernel.org, 
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 cgroups@vger.kernel.org, linux-security-module@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, apparmor@lists.ubuntu.com, 
 selinux@vger.kernel.org, linux-alpha@vger.kernel.org, 
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev, 
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
 linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-um@lists.infradead.org, 
 Simon Schuster <schuster.simon@siemens-energy.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.3-dev-2ce6c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756732247; l=6552;
 i=schuster.simon@siemens-energy.com; s=20250818;
 h=from:subject:message-id;
 bh=l+zEh4GN06CwujvuIj3y3Fd32BGM/P2y+zLD4+u7l7M=;
 b=GDpCexNrElu2yO/MxuDkpG+xctyQVH7o61ewBoPT3J8lEgMWXNxMsXtjVUaPsmeHSieQm4/hP
 49FpVyBe5rsBihPxAhRaNZH/1KUoHHYEsSlrwUEFI8iutPmfJs+jkNi
X-Developer-Key: i=schuster.simon@siemens-energy.com; a=ed25519;
 pk=PUhOMiSp43aSeRE1H41KApxYOluamBFFiMfKlBjocvo=
X-Endpoint-Received: by B4 Relay for
 schuster.simon@siemens-energy.com/20250818 with auth_id=495
X-Original-From: Simon Schuster <schuster.simon@siemens-energy.com>
Reply-To: schuster.simon@siemens-energy.com
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This series adds support for the clone3 system call to the nios2
architecture. This addresses the build-time warning "warning: clone3()
entry point is missing, please fix" introduced in 505d66d1abfb9
("clone3: drop __ARCH_WANT_SYS_CLONE3 macro"). The implementation passes
the relevant clone3 tests of kselftest when applied on top of
next-20250815:

	./run_kselftest.sh
	TAP version 13
	1..4
	# selftests: clone3: clone3
	ok 1 selftests: clone3: clone3
	# selftests: clone3: clone3_clear_sighand
	ok 2 selftests: clone3: clone3_clear_sighand
	# selftests: clone3: clone3_set_tid
	ok 3 selftests: clone3: clone3_set_tid
	# selftests: clone3: clone3_cap_checkpoint_restore
	ok 4 selftests: clone3: clone3_cap_checkpoint_restore

The series also includes a small patch to kernel/fork.c that ensures
that clone_flags are passed correctly on architectures where unsigned
long is insufficient to store the u64 clone_flags. It is marked as a fix
for stable backporting.

As requested, in v2, this series now further tries to correct this type
error throughout the whole code base. Thus, it now touches a larger
number of subsystems and all architectures.

Therefore, another test was performed for ARCH=x86_64 (as a
representative for 64-bit architectures). Here, the series builds cleanly
without warnings on defconfig with CONFIG_SECURITY_APPARMOR=y and
CONFIG_SECURITY_TOMOYO=y (to compile-check the LSM-related changes).
The build further successfully passes testing/selftests/clone3 (with the
patch from 20241105062948.1037011-1-zhouyuhang1010@163.com to prepare
clone3_cap_checkpoint_restore for compatibility with the newer libcap
version on my system).

Is there any option to further preflight check this patch series via
lkp/KernelCI/etc. for a broader test across architectures, or is this
degree of testing sufficient to eventually get the series merged?

N.B.: The series is not checkpatch clean right now:
 - include/linux/cred.h, include/linux/mnt_namespace.h:
   function definition arguments without identifier name
 - include/trace/events/task.h:
   space prohibited after that open parenthesis

I did not fix these warnings to keep my changes minimal and reviewable,
as the issues persist throughout the files and they were not introduced
by me; I only followed the existing code style and just replaced the
types. If desired, I'd be happy to make the changes in a potential v3,
though.

Signed-off-by: Simon Schuster <schuster.simon@siemens-energy.com>
---
Changes in v2:
- Introduce "Fixes:" and "Cc: stable@vger.kernel.org" where necessary
- Factor out "Fixes:" when adapting the datatype of clone_flags for
  easier backports
- Fix additional instances where `unsigned long` clone_flags is used
- Reword commit message to make it clearer that any 32-bit arch is
  affected by this bug
- Link to v1: https://lore.kernel.org/r/20250821-nios2-implement-clone3-v1-0-1bb24017376a@siemens-energy.com

---
Simon Schuster (4):
      copy_sighand: Handle architectures where sizeof(unsigned long) < sizeof(u64)
      copy_process: pass clone_flags as u64 across calltree
      arch: copy_thread: pass clone_flags as u64
      nios2: implement architecture-specific portion of sys_clone3

 arch/alpha/kernel/process.c       |  2 +-
 arch/arc/kernel/process.c         |  2 +-
 arch/arm/kernel/process.c         |  2 +-
 arch/arm64/kernel/process.c       |  2 +-
 arch/csky/kernel/process.c        |  2 +-
 arch/hexagon/kernel/process.c     |  2 +-
 arch/loongarch/kernel/process.c   |  2 +-
 arch/m68k/kernel/process.c        |  2 +-
 arch/microblaze/kernel/process.c  |  2 +-
 arch/mips/kernel/process.c        |  2 +-
 arch/nios2/include/asm/syscalls.h |  1 +
 arch/nios2/include/asm/unistd.h   |  2 --
 arch/nios2/kernel/entry.S         |  6 ++++++
 arch/nios2/kernel/process.c       |  2 +-
 arch/nios2/kernel/syscall_table.c |  1 +
 arch/openrisc/kernel/process.c    |  2 +-
 arch/parisc/kernel/process.c      |  2 +-
 arch/powerpc/kernel/process.c     |  2 +-
 arch/riscv/kernel/process.c       |  2 +-
 arch/s390/kernel/process.c        |  2 +-
 arch/sh/kernel/process_32.c       |  2 +-
 arch/sparc/kernel/process_32.c    |  2 +-
 arch/sparc/kernel/process_64.c    |  2 +-
 arch/um/kernel/process.c          |  2 +-
 arch/x86/include/asm/fpu/sched.h  |  2 +-
 arch/x86/include/asm/shstk.h      |  4 ++--
 arch/x86/kernel/fpu/core.c        |  2 +-
 arch/x86/kernel/process.c         |  2 +-
 arch/x86/kernel/shstk.c           |  2 +-
 arch/xtensa/kernel/process.c      |  2 +-
 block/blk-ioc.c                   |  2 +-
 fs/namespace.c                    |  2 +-
 include/linux/cgroup.h            |  4 ++--
 include/linux/cred.h              |  2 +-
 include/linux/iocontext.h         |  6 +++---
 include/linux/ipc_namespace.h     |  4 ++--
 include/linux/lsm_hook_defs.h     |  2 +-
 include/linux/mnt_namespace.h     |  2 +-
 include/linux/nsproxy.h           |  2 +-
 include/linux/pid_namespace.h     |  4 ++--
 include/linux/rseq.h              |  4 ++--
 include/linux/sched/task.h        |  2 +-
 include/linux/security.h          |  4 ++--
 include/linux/sem.h               |  4 ++--
 include/linux/time_namespace.h    |  4 ++--
 include/linux/uprobes.h           |  4 ++--
 include/linux/user_events.h       |  4 ++--
 include/linux/utsname.h           |  4 ++--
 include/net/net_namespace.h       |  4 ++--
 include/trace/events/task.h       |  6 +++---
 ipc/namespace.c                   |  2 +-
 ipc/sem.c                         |  2 +-
 kernel/cgroup/namespace.c         |  2 +-
 kernel/cred.c                     |  2 +-
 kernel/events/uprobes.c           |  2 +-
 kernel/fork.c                     | 10 +++++-----
 kernel/nsproxy.c                  |  4 ++--
 kernel/pid_namespace.c            |  2 +-
 kernel/sched/core.c               |  4 ++--
 kernel/sched/fair.c               |  2 +-
 kernel/sched/sched.h              |  4 ++--
 kernel/time/namespace.c           |  2 +-
 kernel/utsname.c                  |  2 +-
 net/core/net_namespace.c          |  2 +-
 security/apparmor/lsm.c           |  2 +-
 security/security.c               |  2 +-
 security/selinux/hooks.c          |  2 +-
 security/tomoyo/tomoyo.c          |  2 +-
 68 files changed, 95 insertions(+), 89 deletions(-)
---
base-commit: 1357b2649c026b51353c84ddd32bc963e8999603
change-id: 20250818-nios2-implement-clone3-7f252c20860b

Best regards,
-- 
Simon Schuster <schuster.simon@siemens-energy.com>



