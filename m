Return-Path: <linuxppc-dev+bounces-12023-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 97040B528D4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Sep 2025 08:34:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cMnpt2WrQz2ykc;
	Thu, 11 Sep 2025 16:34:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757572486;
	cv=none; b=On6ILcUBZA4iC9yLQH+HXsAkZmt1CsfWAfgqxehDoBXmMgEnnx+BhkZ1hgKWhLM/gFoqVwwveKX4mEOf8q20xIV1oq1sw/bdH4kCG/7EbtWJz2fZ/FVQRmqN3XYsTlgPMAsFd6zCOnUlXA3qmOY07PSbA3b0IFRAVtv+O/ko+oW6YIw1HXZjWzZhZrGfPMm6G389S65Ntphb4FqLTjowXvfCYyC6it+xgkmXACYBlAzl97QmJgxqfxItIwe91HmNZ4cQCQJm/q07eXSYFo8WiIYQQGVmDTonNgQicB7VwHOq3RERs0HGOU3PVL2iswelLQ0/OcNRzo6C1M621uyI9w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757572486; c=relaxed/relaxed;
	bh=Lfr1qPpuiB3AOwPU0ZFjKKYSXrWZllg4AtF3tp+3Wzs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Dp88ZDykK2gF7Qxat3fs1MH8EA2xm3Z3Wpws4Qfqvdff78Ks/ALLPLsiA3zy4v6PhZPKJX1IVAZL3I++SJefsQzQh5h8U/TyI7F8d5Vi1Qnwe6UTgajhOQF9rvlgK/xZrk5QofKqjq+z3p0Iz3bCktGqq/EVwNSJ7PnmpLgIUVHfzvA0HqlQZNLQ9tld5Gbp1FEQb7nLE8FMWQegdpIaItp8fy8p7SvyjjgXqEAYLmNwipEmkaC+Hr+IffBV8FGRQrOCN39uFlE7N9/FyFoFKcTNCNyHOiKF4gFHf5Smu+1ziZae0iDKA9rjHYccGySq7A70DmIZ5sdPyDPEX6xwqg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; dkim=pass (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=Rb52kiLt; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=Rb52kiLt; dkim-atps=neutral; spf=pass (client-ip=195.135.223.131; helo=smtp-out2.suse.de; envelope-from=jgross@suse.com; receiver=lists.ozlabs.org) smtp.mailfrom=suse.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=Rb52kiLt;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=Rb52kiLt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=195.135.223.131; helo=smtp-out2.suse.de; envelope-from=jgross@suse.com; receiver=lists.ozlabs.org)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cMnpr6Rq0z2xnn
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Sep 2025 16:34:44 +1000 (AEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5E2A8683E8;
	Thu, 11 Sep 2025 06:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1757572479; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Lfr1qPpuiB3AOwPU0ZFjKKYSXrWZllg4AtF3tp+3Wzs=;
	b=Rb52kiLtTg3v2u9zgMn3NUgzc+I9t7goexfTSG/6vAd6CFqdCGPPMNDDYCobdCdyrq5sS4
	THsDzUD4UF4y2fXBlIeYIVCPmZLL7CdaqepqR8WgmiYxUf4btn7G6HEQab08I1KrGeDcGm
	nmUC3Xv4HYwAo2tomf/WXQlFMXA6O8w=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1757572479; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Lfr1qPpuiB3AOwPU0ZFjKKYSXrWZllg4AtF3tp+3Wzs=;
	b=Rb52kiLtTg3v2u9zgMn3NUgzc+I9t7goexfTSG/6vAd6CFqdCGPPMNDDYCobdCdyrq5sS4
	THsDzUD4UF4y2fXBlIeYIVCPmZLL7CdaqepqR8WgmiYxUf4btn7G6HEQab08I1KrGeDcGm
	nmUC3Xv4HYwAo2tomf/WXQlFMXA6O8w=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 773761372E;
	Thu, 11 Sep 2025 06:34:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id KsszG31twmjuTAAAD6G6ig
	(envelope-from <jgross@suse.com>); Thu, 11 Sep 2025 06:34:37 +0000
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
	Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH 00/14] paravirt: cleanup and reorg
Date: Thu, 11 Sep 2025 08:34:19 +0200
Message-ID: <20250911063433.13783-1-jgross@suse.com>
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
X-Spamd-Result: default: False [-1.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_TWO(0.00)[2];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_CC(0.00)[suse.com,kernel.org,linutronix.de,redhat.com,alien8.de,linux.intel.com,zytor.com,microsoft.com,infradead.org,gmail.com,oracle.com,lists.xenproject.org,broadcom.com,armlinux.org.uk,arm.com,xen0n.name,linux.ibm.com,ellerman.id.au,csgroup.eu,sifive.com,dabbelt.com,eecs.berkeley.edu,ghiti.fr,linaro.org,goodmis.org,google.com,suse.de,lists.infradead.org,epam.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	TAGGED_RCPT(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid];
	RCPT_COUNT_GT_50(0.00)[56];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLfdszjqhz8kzzb9uwpzdm8png)];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Level: 
X-Spam-Score: -1.30
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

- Patches 6-12 are streamlining the paravirt clock interfaces by
  using a common implementation across architectures where possible
  and by moving the related code into common sched code, as this is
  where it should live.

- Patches 13+14 are more like RFC material: patch 13 is doing some
  preparation work to enable patch 14 to move all spinlock related
  paravirt functions into qspinlock.h. If this approach is accepted,
  I'd like to continue with this work by moving most (or all?)
  paravirt functions from paravirt.h into the headers where their
  native counterparts are defined. This is meant to keep the native
  and paravirt function definitions together in one place and
  hopefully to be able to reduce the include hell with paravirt.

Juergen Gross (14):
  x86/paravirt: remove not needed includes of paravirt.h
  x86/paravirt: remove some unneeded struct declarations
  x86/paravirt: remove PARAVIRT_DEBUG config option
  x86/paravirt: move thunk macros to paravirt_types.h
  paravirt: remove asm/paravirt_api_clock.h
  sched: move clock related paravirt code to kernel/sched
  arm/paravirt: use common code for paravirt_steal_clock()
  arm64/paravirt: use common code for paravirt_steal_clock()
  loongarch/paravirt: use common code for paravirt_steal_clock()
  riscv/paravirt: use common code for paravirt_steal_clock()
  x86/paravirt: use common code for paravirt_steal_clock()
  x86/paravirt: move paravirt_sched_clock() related code into tsc.c
  x86/paravirt: allow pv-calls outside paravirt.h
  x86/pvlocks: move paravirt spinlock functions into qspinlock.h

 arch/Kconfig                                  |   3 +
 arch/arm/Kconfig                              |   1 +
 arch/arm/include/asm/paravirt.h               |  22 ---
 arch/arm/include/asm/paravirt_api_clock.h     |   1 -
 arch/arm/kernel/Makefile                      |   1 -
 arch/arm/kernel/paravirt.c                    |  23 ---
 arch/arm64/Kconfig                            |   1 +
 arch/arm64/include/asm/paravirt.h             |  14 --
 arch/arm64/include/asm/paravirt_api_clock.h   |   1 -
 arch/arm64/kernel/paravirt.c                  |  11 +-
 arch/loongarch/Kconfig                        |   1 +
 arch/loongarch/include/asm/paravirt.h         |  13 --
 .../include/asm/paravirt_api_clock.h          |   1 -
 arch/loongarch/kernel/paravirt.c              |  10 +-
 arch/powerpc/include/asm/paravirt.h           |   3 -
 arch/powerpc/include/asm/paravirt_api_clock.h |   2 -
 arch/powerpc/platforms/pseries/setup.c        |   4 +-
 arch/riscv/Kconfig                            |   1 +
 arch/riscv/include/asm/paravirt.h             |  14 --
 arch/riscv/include/asm/paravirt_api_clock.h   |   1 -
 arch/riscv/kernel/paravirt.c                  |  11 +-
 arch/x86/Kconfig                              |   8 +-
 arch/x86/entry/entry_64.S                     |   1 -
 arch/x86/entry/vsyscall/vsyscall_64.c         |   1 -
 arch/x86/hyperv/hv_spinlock.c                 |   1 -
 arch/x86/include/asm/apic.h                   |   4 -
 arch/x86/include/asm/highmem.h                |   1 -
 arch/x86/include/asm/mmu_context.h            |   1 -
 arch/x86/include/asm/mshyperv.h               |   1 -
 arch/x86/include/asm/paravirt.h               | 166 ------------------
 arch/x86/include/asm/paravirt_api_clock.h     |   1 -
 arch/x86/include/asm/paravirt_types.h         |  82 +++++++--
 arch/x86/include/asm/pgtable_32.h             |   1 -
 arch/x86/include/asm/qspinlock.h              |  49 +++++-
 arch/x86/include/asm/spinlock.h               |   1 -
 arch/x86/include/asm/timer.h                  |   1 +
 arch/x86/include/asm/tlbflush.h               |   4 -
 arch/x86/kernel/apm_32.c                      |   1 -
 arch/x86/kernel/callthunks.c                  |   1 -
 arch/x86/kernel/cpu/bugs.c                    |   1 -
 arch/x86/kernel/cpu/vmware.c                  |   1 +
 arch/x86/kernel/kvm.c                         |   1 +
 arch/x86/kernel/kvmclock.c                    |   1 +
 arch/x86/kernel/paravirt.c                    |  16 --
 arch/x86/kernel/tsc.c                         |  10 +-
 arch/x86/kernel/vsmp_64.c                     |   1 -
 arch/x86/kernel/x86_init.c                    |   1 -
 arch/x86/lib/cache-smp.c                      |   1 -
 arch/x86/mm/init.c                            |   1 -
 arch/x86/xen/spinlock.c                       |   1 -
 arch/x86/xen/time.c                           |   2 +
 drivers/clocksource/hyperv_timer.c            |   2 +
 drivers/xen/time.c                            |   2 +-
 include/linux/sched/cputime.h                 |  18 ++
 kernel/sched/core.c                           |   5 +
 kernel/sched/cputime.c                        |  13 ++
 kernel/sched/sched.h                          |   3 +-
 57 files changed, 182 insertions(+), 362 deletions(-)
 delete mode 100644 arch/arm/include/asm/paravirt.h
 delete mode 100644 arch/arm/include/asm/paravirt_api_clock.h
 delete mode 100644 arch/arm/kernel/paravirt.c
 delete mode 100644 arch/arm64/include/asm/paravirt_api_clock.h
 delete mode 100644 arch/loongarch/include/asm/paravirt_api_clock.h
 delete mode 100644 arch/powerpc/include/asm/paravirt_api_clock.h
 delete mode 100644 arch/riscv/include/asm/paravirt_api_clock.h
 delete mode 100644 arch/x86/include/asm/paravirt_api_clock.h

-- 
2.51.0


