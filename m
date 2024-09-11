Return-Path: <linuxppc-dev+bounces-1265-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C068C975D11
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2024 00:25:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X3wB248mrz2xjY;
	Thu, 12 Sep 2024 08:25:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::14a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726093514;
	cv=none; b=HSppalBBZrDJLTU5VGstrtkKajKuS4FZW7yPELf29ay6u+zAXKwVx6gtMvp71yHnqXPxTy8jb3+byQ1HdMChoN4MKV379rjxXJBtm0RdgfVLk9Jna3XwmRCRl8m46dprbal5jie1d43aj2Ezs9BV+rSpMu2XsXBnApG36H9U+cAHRGfqzDz97iJ7LvRus9R7OBdAKyIQbGZ5maEmzt4vVBPMTSY0CnKsfOqwyvhpHmLv8Pfcn9/4QtW5+rTyXwDqLT2xHnkOlajRWtBgFIjP31yHxJzJXPQs+HTOCa8Zj5bXkhlPZurq3wNKy6h2NVadyWLuEeVUtYhJGSftkzwV3A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726093514; c=relaxed/relaxed;
	bh=T+nODGyulHWxs0JnvJus4UAc0zy0GDYGIyi7bhZj7WY=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=j+zVbmrgnhXg7eD2Ml4g8hW5pK4yfx/nC5vL3db7+GVumXKkY7ZFU9P2UXrdrR37YPGjBM7vVb6mExuaKz7DX10LlSY5ayVb9h/M6AcPJ0o8iIZolQFGpMZZgie7ZOvcqEQ4XMfE5WeMH/BbrgVULPJ5LxJPWrKWIrSmUo4UzEK0wd6xIaqPWtvifAAKdplSjO2GzaabkrnQcYI05l1CKpPncrXWg7w+o8rrDAA5pfeEQWEcJeHlCw8QQQKVK/KlOePqwOa7oDRUHYje2bjiSFOkzIrH7MtqdW7KLjJcg1NQQHEFaY3uNZQ9PIO2MhGGge1RL0KrRzMUSfTzgYBV9g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=icmOUmEI; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::14a; helo=mail-il1-x14a.google.com; envelope-from=3xrjizgskdlweqnvqpngykuiqqing.eqonkpwzrre-fgxnkuvu.q1ncdu.qti@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=icmOUmEI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--coltonlewis.bounces.google.com (client-ip=2607:f8b0:4864:20::14a; helo=mail-il1-x14a.google.com; envelope-from=3xrjizgskdlweqnvqpngykuiqqing.eqonkpwzrre-fgxnkuvu.q1ncdu.qti@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x14a.google.com (mail-il1-x14a.google.com [IPv6:2607:f8b0:4864:20::14a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X3wB20yt4z2xJV
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2024 08:25:12 +1000 (AEST)
Received: by mail-il1-x14a.google.com with SMTP id e9e14a558f8ab-39f6f16ed00so7409925ab.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Sep 2024 15:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726093509; x=1726698309; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=T+nODGyulHWxs0JnvJus4UAc0zy0GDYGIyi7bhZj7WY=;
        b=icmOUmEIfcVD0p+bR7VzdPNYOOFlhqNQojKnA67LMkelaFRDAQCtbrJ4cmoQF6/Fc+
         kR2Ris46/Ct/MXA3+h+Gs832Mc33EQmJ1kFOWUYQbNN9KGTszaPTMLYQbQn8H9ntVfdE
         vxVxFhVt1f21F2tiHw83MLdYQ/LlRJjLnmYMm/ZqBGdNqLjaFIlI831ZLYyZJYq6D7Er
         IB+pxa9l2Ah+oxRAshtns5dTa6BrpmxbeFkppJCB5V7oE75EFWtQwN7NNyGtfQG33Qgh
         BSDE7kRakq7/3NXOyU5hDlNjKOsP13qSViCpex1EdVhU5O3X38/oTVe+yok58n+Btcho
         lCbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726093509; x=1726698309;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T+nODGyulHWxs0JnvJus4UAc0zy0GDYGIyi7bhZj7WY=;
        b=ZLs1At4X4HPPQvSPFDik3pv++Lzym3aVOQvy5zeYJAlSZqaTlhNzSpYQrFXBABfdQ5
         c1rxqaZ+KadkbVpmI65h+YfcPKE97r5h4WbdR0CEz5h44PNsb0qZk+ZOghIMaqulsDsO
         fYuBleBypv0SB9LUyxpePJdA1j4qf82DtxskT9wCrC7KDq1oOSYq04fMlmHXMaFfO9C+
         GZfKVsiaP5RKRu3WFykmZK5p5PDWvP1saaq+2fOYmab6Cr6Za008+HzpTQdRFUNYOJ9g
         J2ybRBPt6qibu9za1WgeHTpEyBQZvZwc1TTg0iSmOxRUf45mR7SBu/7FZI6sYe8OoUaR
         km9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUaXWxv1N2hg7o6rju73ipbrGleldEQ6WMhdc924A1DIiKfqJNAQhR6uSv6FilYJtd4Vl3lnn+auZEDHuw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzyTHyGJmkQuP/F7hF+IrpZQB0gYxZh3xZbYXnov0M3h0YWr/iW
	ljNpbsBUU8S7oqMVrCEq+XzxCAGIat2R7rpc3Sp0ZVhz/cz6BA8b3EemIVMtff/9zs5mG1MlHLl
	ieJVopjO3nHJZa4PXSdC4LA==
X-Google-Smtp-Source: AGHT+IGXXpOojFFO7Gu+zUTSei0211tStzLtWSxgCQLqddaqaDV88691OqMetcHXtFlM9KtKiGpFHXylg3PWPs5bQA==
X-Received: from coltonlewis-kvm.c.googlers.com ([fda3:e722:ac3:cc00:11b:3898:ac11:fa18])
 (user=coltonlewis job=sendgmr) by 2002:a05:6e02:2181:b0:3a0:80ae:71b6 with
 SMTP id e9e14a558f8ab-3a084976fe0mr327905ab.6.1726093509599; Wed, 11 Sep 2024
 15:25:09 -0700 (PDT)
Date: Wed, 11 Sep 2024 22:24:27 +0000
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.46.0.598.g6f2099f65c-goog
Message-ID: <20240911222433.3415301-1-coltonlewis@google.com>
Subject: [PATCH v2 0/5] Correct perf sampling with Guest VMs
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Oliver Upton <oliver.upton@linux.dev>, Sean Christopherson <seanjc@google.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Will Deacon <will@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"

v2:
  * Better explain commit messages
  * Fix incorrect type in patch 2
  * Fix missing argument in call to common_misc_flags() in patch 5
  * Rebase to 6.11-rc7 and include base commit in letter

v1:
https://lore.kernel.org/kvm/20240904204133.1442132-1-coltonlewis@google.com/

This series cleans up perf recording around guest events and improves
the accuracy of the resulting perf reports.

Perf was incorrectly counting any PMU overflow interrupt that occurred
while a VCPU was loaded as a guest event even when the events were not
truely guest events. This lead to much less accurate and useful perf
recordings.

See as an example the below reports of `perf record
dirty_log_perf_test -m 2 -v 4` before and after the series on ARM64.

Without series:

Samples: 15K of event 'instructions', Event count (approx.): 31830580924
Overhead  Command          Shared Object        Symbol
  54.54%  dirty_log_perf_  dirty_log_perf_test  [.] run_test
   5.39%  dirty_log_perf_  dirty_log_perf_test  [.] vcpu_worker
   0.89%  dirty_log_perf_  [kernel.vmlinux]     [k] release_pages
   0.70%  dirty_log_perf_  [kernel.vmlinux]     [k] free_pcppages_bulk
   0.62%  dirty_log_perf_  dirty_log_perf_test  [.] userspace_mem_region_find
   0.49%  dirty_log_perf_  dirty_log_perf_test  [.] sparsebit_is_set
   0.46%  dirty_log_perf_  dirty_log_perf_test  [.] _virt_pg_map
   0.46%  dirty_log_perf_  dirty_log_perf_test  [.] node_add
   0.37%  dirty_log_perf_  dirty_log_perf_test  [.] node_reduce
   0.35%  dirty_log_perf_  [kernel.vmlinux]     [k] free_unref_page_commit
   0.33%  dirty_log_perf_  [kernel.vmlinux]     [k] __kvm_pgtable_walk
   0.31%  dirty_log_perf_  [kernel.vmlinux]     [k] stage2_attr_walker
   0.29%  dirty_log_perf_  [kernel.vmlinux]     [k] unmap_page_range
   0.29%  dirty_log_perf_  dirty_log_perf_test  [.] test_assert
   0.26%  dirty_log_perf_  [kernel.vmlinux]     [k] __mod_memcg_lruvec_state
   0.24%  dirty_log_perf_  [kernel.vmlinux]     [k] kvm_s2_put_page

With series:

Samples: 15K of event 'instructions', Event count (approx.): 31830580924
Samples: 15K of event 'instructions', Event count (approx.): 30898031385
Overhead  Command          Shared Object        Symbol
  54.05%  dirty_log_perf_  dirty_log_perf_test  [.] run_test
   5.48%  dirty_log_perf_  [kernel.kallsyms]    [k] kvm_arch_vcpu_ioctl_run
   4.70%  dirty_log_perf_  dirty_log_perf_test  [.] vcpu_worker
   3.11%  dirty_log_perf_  [kernel.kallsyms]    [k] kvm_handle_guest_abort
   2.24%  dirty_log_perf_  [kernel.kallsyms]    [k] up_read
   1.98%  dirty_log_perf_  [kernel.kallsyms]    [k] __kvm_tlb_flush_vmid_ipa_nsh
   1.97%  dirty_log_perf_  [kernel.kallsyms]    [k] __pi_clear_page
   1.30%  dirty_log_perf_  [kernel.kallsyms]    [k] down_read
   1.13%  dirty_log_perf_  [kernel.kallsyms]    [k] release_pages
   1.12%  dirty_log_perf_  [kernel.kallsyms]    [k] __kvm_pgtable_walk
   1.08%  dirty_log_perf_  [kernel.kallsyms]    [k] folio_batch_move_lru
   1.06%  dirty_log_perf_  [kernel.kallsyms]    [k] __srcu_read_lock
   1.03%  dirty_log_perf_  [kernel.kallsyms]    [k] get_page_from_freelist
   1.01%  dirty_log_perf_  [kernel.kallsyms]    [k] __pte_offset_map_lock
   0.82%  dirty_log_perf_  [kernel.kallsyms]    [k] handle_mm_fault
   0.74%  dirty_log_perf_  [kernel.kallsyms]    [k] mas_state_walk

Colton Lewis (5):
  arm: perf: Drop unused functions
  perf: Hoist perf_instruction_pointer() and perf_misc_flags()
  powerpc: perf: Use perf_arch_instruction_pointer()
  x86: perf: Refactor misc flag assignments
  perf: Correct perf sampling with guest VMs

 arch/arm/include/asm/perf_event.h            |  7 ---
 arch/arm/kernel/perf_callchain.c             | 17 -------
 arch/arm64/include/asm/perf_event.h          |  4 --
 arch/arm64/kernel/perf_callchain.c           | 28 ------------
 arch/powerpc/include/asm/perf_event_server.h |  6 +--
 arch/powerpc/perf/callchain.c                |  2 +-
 arch/powerpc/perf/callchain_32.c             |  2 +-
 arch/powerpc/perf/callchain_64.c             |  2 +-
 arch/powerpc/perf/core-book3s.c              |  4 +-
 arch/s390/include/asm/perf_event.h           |  6 +--
 arch/s390/kernel/perf_event.c                |  4 +-
 arch/x86/events/core.c                       | 48 ++++++++++++--------
 arch/x86/include/asm/perf_event.h            | 12 +++--
 include/linux/perf_event.h                   | 26 +++++++++--
 kernel/events/core.c                         | 27 ++++++++++-
 15 files changed, 96 insertions(+), 99 deletions(-)


base-commit: da3ea35007d0af457a0afc87e84fddaebc4e0b63
--
2.46.0.598.g6f2099f65c-goog

