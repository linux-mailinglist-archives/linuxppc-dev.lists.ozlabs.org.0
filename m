Return-Path: <linuxppc-dev+bounces-1499-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F64697D95D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Sep 2024 19:48:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X9Kbq6gVmz2yVb;
	Sat, 21 Sep 2024 03:47:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::b49"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726854471;
	cv=none; b=acA4Bv2RHCNzB5oUnXNGMyfmpKMvvQYUu1p6A+56kwz8AN7dJ5HRzAeBvWTBHRIoJ7hVGZDSTIKJDVEhGKnf8U+hHvPz5yHF4x2LfXnzxRGndJR6m5/To1FnR4Sz/V3hw+TVlZtmqzwrNxVSABvGd4sQ0KNI9j7+4/JPTpFg4R2bX5n5mN76NES8fbyCD6qV9IQL9/sgghY7emlMx1Rsq7kgs0rhUz5AYmCeuYUiZV+7BXDfAGw9iWwbTof7ebRZSnihItSMnPqwqtu1zr8f+lDkqlVlbdJcRuMU/wDnWSrvyhQ0apZsAWukrc5EKT/fuXyEzYEBJQ289a4puBwD5A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726854471; c=relaxed/relaxed;
	bh=MVX2p+TpOgKO2VD1T0Sjf0Y9xYKj+teBBRpgO6spktE=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Cixu/ioUWBDYwYmF3kBkd1kChFBhQk18m5fTI/iPmVA1UOpUOpHwX3ESG8mnQi2Z1E6HaY1/XxdUsRHZ61+7m6Rqd/0Dgo0mx7yzaUczjCyApcaFhQGOcIenqjQ9xTruH6X2dyfuvackFoIjk9kVXnbSklKoKFGP6lSOKbxfaRoW9PBi/tM6cEPilcORFY0Xxj8hxZVYD9lP5t/rX/dv/d0cvtCAbERP1QzMh59miS4zrboZzvECVYZLHJd0U93VRMubaRJdIlTop1QUMTq2T7X9jb4t6pIqEJppAJiWzY5DCXFB7vcaSARaiZkeXOUnjqRAuldFc0guArgm5TlunA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=cShVZuJk; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3qlxtzgskdj8bnksnmkdvhrfnnfkd.bnlkhmtwoob-cdukhrsr.nyk9ar.nqf@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=cShVZuJk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--coltonlewis.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3qlxtzgskdj8bnksnmkdvhrfnnfkd.bnlkhmtwoob-cdukhrsr.nyk9ar.nqf@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X9Kbp4SHRz2yR3
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Sep 2024 03:47:49 +1000 (AEST)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e1a74f824f9so3987585276.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Sep 2024 10:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726854464; x=1727459264; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MVX2p+TpOgKO2VD1T0Sjf0Y9xYKj+teBBRpgO6spktE=;
        b=cShVZuJkOY6b99qcq+2H6rAY1F6Ij1COTZIOjwsF8ABQRy21H+v9yPOT7gcE+fk7lj
         U1RQgmo5tn33mrLp63bAqRAJ0lLpzClr5Lv47to0QDPI1OJAHekllgq+LEXpSbDFLQlH
         2OWk7K7qdgWe0KaToNLfkCyU/mmZtBD26x+SWFD2k7zB/F+8avRmnGx2Za3wpayQDlRX
         P7lvHoQ5mofq50xzVtBF+MbEndvZhaI/6uDO5yGbznIlfEo9eOlZ+VkNmihNwQHYON5W
         Vc+Xv8I/zGYHLq9wL8zbnrgzdy4pyeFgjbmoAA+MGWHyYpOEvZ9ED3umvrOL/enK4Xo5
         M2/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726854464; x=1727459264;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MVX2p+TpOgKO2VD1T0Sjf0Y9xYKj+teBBRpgO6spktE=;
        b=mjqJpV8Zk35p7zRE6CvHm4cPbQSbta/odQk3IohoRf5XdQ2hJlinvRql934j1nl+CB
         eLLHWA0LqrJfB5hvoH9u2RYClQoyIELFev5xcy6qTq478dLhYGtl91w3rZKl0B3NVLFg
         obFF1JmrOo6DV72AzdmVqjKgI6eJ6Bw6cbDNCKbzAi8zL8IoepssTm/0C6+KTFwJOcsj
         q9uZy5x8ByUmlb0qtAKGqii5bmIkT1WqWxKC65wlHCJhuWomOZeTHvKqWQJg4rGJzns3
         sKxqfvetFr/iRrGr+EYW9GH/OD8sqKEkUmilMnVOgpHKTUIpVzazwX4bnurEF60RaOaW
         KAvw==
X-Forwarded-Encrypted: i=1; AJvYcCUqTcgMZl+CO6BpKZegLw2ON5MnJVmh+rul7ckuDZDcwso1TLChB8YOFsd39mw/DhOY5L78BqGYRCjKJbs=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyBdG8WoxpPDAK7tgjmDOdSY30x3YPKgSvfWrskmtbG+vb79zuv
	IXUtX4Q2yTdL8FO9d8z9TXUM+Z4VzLdLlAbi68Vp1iBBPIOyFRtt/AJ6KevSgmu5nsU8h0mQZtn
	hJzIx1XFwJRzzYB9fOxYMWw==
X-Google-Smtp-Source: AGHT+IGdaBc0VukQd5fL8Bpn3emPCz2aUl7uHxwZYGGbbf8J5W3JOUJuoVEqVbJQELPzn/Ev3AqsKyGRg/+CmYTS0w==
X-Received: from coltonlewis-kvm.c.googlers.com ([fda3:e722:ac3:cc00:11b:3898:ac11:fa18])
 (user=coltonlewis job=sendgmr) by 2002:a25:abd0:0:b0:e1a:44fa:f09 with SMTP
 id 3f1490d57ef6-e2250c2162amr2899276.2.1726854464128; Fri, 20 Sep 2024
 10:47:44 -0700 (PDT)
Date: Fri, 20 Sep 2024 17:47:35 +0000
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
Message-ID: <20240920174740.781614-1-coltonlewis@google.com>
Subject: [PATCH v5 0/5] Correct perf sampling with Guest VMs
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

v5:
* Correct the same compilation failure on s390
  This time I made sure to download all the cross-toolchains of all
  architectures touched and compiled once for each arch.

v4:
https://lore.kernel.org/kvm/20240919190750.4163977-1-coltonlewis@google.com/

v3:
https://lore.kernel.org/kvm/20240912205133.4171576-1-coltonlewis@google.com/

v2:
https://lore.kernel.org/kvm/20240911222433.3415301-1-coltonlewis@google.com/

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
 arch/x86/events/core.c                       | 47 +++++++++++---------
 arch/x86/include/asm/perf_event.h            | 12 ++---
 include/linux/perf_event.h                   | 26 +++++++++--
 kernel/events/core.c                         | 27 ++++++++++-
 15 files changed, 95 insertions(+), 99 deletions(-)


base-commit: da3ea35007d0af457a0afc87e84fddaebc4e0b63
--
2.46.0.792.g87dc391469-goog

