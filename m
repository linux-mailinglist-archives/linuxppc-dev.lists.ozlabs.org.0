Return-Path: <linuxppc-dev+bounces-12348-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15EB8B80427
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Sep 2025 16:52:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cRhZS5kBDz2xnk;
	Thu, 18 Sep 2025 00:52:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758120752;
	cv=none; b=jVv+WA9zem62OmeLbn4OzF+tnEQp0HINFAEc8QH3tHWbyyoI9zFD9JWUY8kRqDpKgjrIXCz5SYEW25Kg6I4H9XBW3vqtkgsTn746UHrbnSZip3dny2/Gk6rjojKvVup4IxPg2jVGKYTeMjnHIcDAXt4RtVmWb+8QPj+lQ6Y31Zvzlrc8pP71CjfP/vBA7ICH6qSMrAlDZgq9DI/wxoApa8cQiikXONTuBRkJBSmhO8OaQNibPRKMg/w+MWRD9G4BLm4Ma7YN6sDMHEI8SpTRnrt0H9aNEaehTON8L01rtu8syaMbIh86DQ0PpI+ECLIgVynXBWgVtZJ7PkYRe33meg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758120752; c=relaxed/relaxed;
	bh=L6BoEVB67MQVk+5t0IisdIC5veavG4aoIDsIXi8t0tU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Xpm5j6yQr2qseEwk3sLNEY+iDXebcIBY+FtjpPQamZrwtsckNJ9EN1Nez7kJvs7pmv7SwGORTa6xi1FRcHg3Ow3b9y9iNvE6Jvg1kzsTruHZt3hPMwTo87uuKxds+yHwExJd7OvdQaot7LQePG+9rqpDN1NrYj0AlzQ4Fh/VOFacLFCLGbnDQ+MAFeE+1nQkSdjd8whE+dV6WCoIEYXwldQSokWF3Qpm4bvE70VUfoaM6QV+hl8k9o9h4LjnBi7xbTwMdhMogecaHLwWFDsDKpiofmFId+J+ERzF0bXEyeG2HG/pWHBKMa2zv+P+DEwzGLcrQqqXbevNEMIpcobTmg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; dkim=pass (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=RPFv+dnZ; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=RPFv+dnZ; dkim-atps=neutral; spf=pass (client-ip=195.135.223.131; helo=smtp-out2.suse.de; envelope-from=jgross@suse.com; receiver=lists.ozlabs.org) smtp.mailfrom=suse.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=RPFv+dnZ;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=RPFv+dnZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=195.135.223.131; helo=smtp-out2.suse.de; envelope-from=jgross@suse.com; receiver=lists.ozlabs.org)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cRhZR1W6Jz2xgQ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Sep 2025 00:52:31 +1000 (AEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 55BE9206A3;
	Wed, 17 Sep 2025 14:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1758120744; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=L6BoEVB67MQVk+5t0IisdIC5veavG4aoIDsIXi8t0tU=;
	b=RPFv+dnZnlgFjOhg/ujMRqSYaNo/zqANG7tI0s/Iw6Ip6ZBA/XIabW52qG0IdUi7rRi96h
	eDh4aOQVlKU8OtBoS71gT9KEc1Evkqdq4Qw7PtF3neBDkjsLUxCwbDNE08dJl9Tltx9S+j
	q6avLnl0p/xCt0paRdDmxUh7jQqKo9c=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=RPFv+dnZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1758120744; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=L6BoEVB67MQVk+5t0IisdIC5veavG4aoIDsIXi8t0tU=;
	b=RPFv+dnZnlgFjOhg/ujMRqSYaNo/zqANG7tI0s/Iw6Ip6ZBA/XIabW52qG0IdUi7rRi96h
	eDh4aOQVlKU8OtBoS71gT9KEc1Evkqdq4Qw7PtF3neBDkjsLUxCwbDNE08dJl9Tltx9S+j
	q6avLnl0p/xCt0paRdDmxUh7jQqKo9c=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D37E71368D;
	Wed, 17 Sep 2025 14:52:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id KeoIMibLymiwEgAAD6G6ig
	(envelope-from <jgross@suse.com>); Wed, 17 Sep 2025 14:52:22 +0000
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-hyperv@vger.kernel.org,
	virtualization@lists.linux.dev,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>,
	Dexuan Cui <decui@microsoft.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Waiman Long <longman@redhat.com>,
	Jiri Kosina <jikos@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel@lists.xenproject.org,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Oleg Nesterov <oleg@redhat.com>
Subject: [PATCH v2 00/21] paravirt: cleanup and reorg
Date: Wed, 17 Sep 2025 16:51:59 +0200
Message-ID: <20250917145220.31064-1-jgross@suse.com>
X-Mailer: git-send-email 2.51.0
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
X-Spamd-Result: default: False [-1.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[suse.com,kernel.org,linutronix.de,redhat.com,alien8.de,linux.intel.com,zytor.com,microsoft.com,infradead.org,gmail.com,oracle.com,lists.xenproject.org,broadcom.com,armlinux.org.uk,arm.com,xen0n.name,linux.ibm.com,ellerman.id.au,csgroup.eu,sifive.com,dabbelt.com,eecs.berkeley.edu,ghiti.fr,linaro.org,goodmis.org,google.com,suse.de,lists.infradead.org,epam.com];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLkdkdrsxe9hqhhs5ask8616i6)];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	RCPT_COUNT_GT_50(0.00)[57];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.com:mid,suse.com:dkim];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Level: 
X-Rspamd-Queue-Id: 55BE9206A3
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -1.51
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Some cleanups and reorg of paravirt code and headers:

- The first 2 patches should be not controversial at all, as they
  remove just some no longer needed #include and struct forward
  declarations.

- The 3rd patch is removing CONFIG_PARAVIRT_DEBUG, which IMO has
  no real value, as it just changes a crash to a BUG() (the stack
  trace will basically be the same). As the maintainer of the main
  paravirt user (Xen) I have never seen this crash/BUG() to happen.

- The 4th patch is just a movement of code.

- I don't know for what reason asm/paravirt_api_clock.h was added,
  as all archs supporting it do it exactly in the same way. Patch
  5 is removing it.

- Patches 6-14 are streamlining the paravirt clock interfaces by
  using a common implementation across architectures where possible
  and by moving the related code into common sched code, as this is
  where it should live.

- Patches 15-20 are more like RFC material preparing the paravirt
  infrastructure to support multiple pv_ops function arrays.
  As a prerequisite for that it makes life in objtool much easier
  with dropping the Xen static initializers of the pv_ops sub-
  structures, which is done in patches 15-17.
  Patches 18-20 are doing the real preparations for multiple pv_ops
  arrays and using those arrays in multiple headers.

- Patch 21 is an example how the new scheme can look like using the
  PV-spinlocks.

Changes in V2:
- new patches 13-18 and 20
- complete rework of patch 21

Juergen Gross (21):
  x86/paravirt: Remove not needed includes of paravirt.h
  x86/paravirt: Remove some unneeded struct declarations
  x86/paravirt: Remove PARAVIRT_DEBUG config option
  x86/paravirt: Move thunk macros to paravirt_types.h
  paravirt: Remove asm/paravirt_api_clock.h
  sched: Move clock related paravirt code to kernel/sched
  arm/paravirt: Use common code for paravirt_steal_clock()
  arm64/paravirt: Use common code for paravirt_steal_clock()
  loongarch/paravirt: Use common code for paravirt_steal_clock()
  riscv/paravirt: Use common code for paravirt_steal_clock()
  x86/paravirt: Use common code for paravirt_steal_clock()
  x86/paravirt: Move paravirt_sched_clock() related code into tsc.c
  x86/paravirt: Introduce new paravirt-base.h header
  x86/paravirt: Move pv_native_*() prototypes to paravirt.c
  x86/xen: Drop xen_irq_ops
  x86/xen: Drop xen_cpu_ops
  x86/xen: Drop xen_mmu_ops
  objtool: Allow multiple pv_ops arrays
  x86/paravirt: Allow pv-calls outside paravirt.h
  x86/paravirt: Specify pv_ops array in paravirt macros
  x86/pvlocks: Move paravirt spinlock functions into own header

 arch/Kconfig                                  |   3 +
 arch/arm/Kconfig                              |   1 +
 arch/arm/include/asm/paravirt.h               |  22 --
 arch/arm/include/asm/paravirt_api_clock.h     |   1 -
 arch/arm/kernel/Makefile                      |   1 -
 arch/arm/kernel/paravirt.c                    |  23 --
 arch/arm64/Kconfig                            |   1 +
 arch/arm64/include/asm/paravirt.h             |  14 -
 arch/arm64/include/asm/paravirt_api_clock.h   |   1 -
 arch/arm64/kernel/paravirt.c                  |  11 +-
 arch/loongarch/Kconfig                        |   1 +
 arch/loongarch/include/asm/paravirt.h         |  13 -
 .../include/asm/paravirt_api_clock.h          |   1 -
 arch/loongarch/kernel/paravirt.c              |  10 +-
 arch/powerpc/include/asm/paravirt.h           |   3 -
 arch/powerpc/include/asm/paravirt_api_clock.h |   2 -
 arch/powerpc/platforms/pseries/setup.c        |   4 +-
 arch/riscv/Kconfig                            |   1 +
 arch/riscv/include/asm/paravirt.h             |  14 -
 arch/riscv/include/asm/paravirt_api_clock.h   |   1 -
 arch/riscv/kernel/paravirt.c                  |  11 +-
 arch/x86/Kconfig                              |   8 +-
 arch/x86/entry/entry_64.S                     |   1 -
 arch/x86/entry/vsyscall/vsyscall_64.c         |   1 -
 arch/x86/hyperv/hv_spinlock.c                 |  11 +-
 arch/x86/include/asm/apic.h                   |   4 -
 arch/x86/include/asm/highmem.h                |   1 -
 arch/x86/include/asm/mmu_context.h            |   1 -
 arch/x86/include/asm/mshyperv.h               |   1 -
 arch/x86/include/asm/paravirt-base.h          |  29 ++
 arch/x86/include/asm/paravirt-spinlock.h      | 146 ++++++++
 arch/x86/include/asm/paravirt.h               | 331 +++++-------------
 arch/x86/include/asm/paravirt_api_clock.h     |   1 -
 arch/x86/include/asm/paravirt_types.h         | 269 +++++++-------
 arch/x86/include/asm/pgtable_32.h             |   1 -
 arch/x86/include/asm/ptrace.h                 |   2 +-
 arch/x86/include/asm/qspinlock.h              |  89 +----
 arch/x86/include/asm/spinlock.h               |   1 -
 arch/x86/include/asm/timer.h                  |   1 +
 arch/x86/include/asm/tlbflush.h               |   4 -
 arch/x86/kernel/Makefile                      |   2 +-
 arch/x86/kernel/apm_32.c                      |   1 -
 arch/x86/kernel/callthunks.c                  |   1 -
 arch/x86/kernel/cpu/bugs.c                    |   1 -
 arch/x86/kernel/cpu/vmware.c                  |   1 +
 arch/x86/kernel/kvm.c                         |  11 +-
 arch/x86/kernel/kvmclock.c                    |   1 +
 arch/x86/kernel/paravirt-spinlocks.c          |  24 +-
 arch/x86/kernel/paravirt.c                    |  42 +--
 arch/x86/kernel/tsc.c                         |  10 +-
 arch/x86/kernel/vsmp_64.c                     |   1 -
 arch/x86/kernel/x86_init.c                    |   1 -
 arch/x86/lib/cache-smp.c                      |   1 -
 arch/x86/mm/init.c                            |   1 -
 arch/x86/xen/enlighten_pv.c                   |  82 ++---
 arch/x86/xen/irq.c                            |  20 +-
 arch/x86/xen/mmu_pv.c                         | 100 ++----
 arch/x86/xen/spinlock.c                       |  11 +-
 arch/x86/xen/time.c                           |   2 +
 drivers/clocksource/hyperv_timer.c            |   2 +
 drivers/xen/time.c                            |   2 +-
 include/linux/sched/cputime.h                 |  18 +
 kernel/sched/core.c                           |   5 +
 kernel/sched/cputime.c                        |  13 +
 kernel/sched/sched.h                          |   3 +-
 tools/objtool/arch/x86/decode.c               |   8 +-
 tools/objtool/check.c                         |  78 ++++-
 tools/objtool/include/objtool/check.h         |   2 +
 68 files changed, 657 insertions(+), 828 deletions(-)
 delete mode 100644 arch/arm/include/asm/paravirt.h
 delete mode 100644 arch/arm/include/asm/paravirt_api_clock.h
 delete mode 100644 arch/arm/kernel/paravirt.c
 delete mode 100644 arch/arm64/include/asm/paravirt_api_clock.h
 delete mode 100644 arch/loongarch/include/asm/paravirt_api_clock.h
 delete mode 100644 arch/powerpc/include/asm/paravirt_api_clock.h
 delete mode 100644 arch/riscv/include/asm/paravirt_api_clock.h
 create mode 100644 arch/x86/include/asm/paravirt-base.h
 create mode 100644 arch/x86/include/asm/paravirt-spinlock.h
 delete mode 100644 arch/x86/include/asm/paravirt_api_clock.h

-- 
2.51.0


