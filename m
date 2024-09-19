Return-Path: <linuxppc-dev+bounces-1470-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2098497CDF5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Sep 2024 21:08:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X8lQw3QPpz2yLg;
	Fri, 20 Sep 2024 05:08:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1149"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726772888;
	cv=none; b=ox71pNHGooKyvLl5/DBWYb/6eXaVTrH3ZsQXa6KlIycKnsX60fYRcfvCLU1enJkwQhSmmWb0rhx+YaTKzfs0De71YKi557qMhm2LjsE38CNogFY11fp+w6gK7zRx98YlHK2lr+fw5Jc0jBJ5hzjom4w8E1rcSMyp8+MvG0WUPgD3U6nsT+7fNkAIlhYOimnNauA4LPxBNdaRkztTD1jkt60Yi8QGRqiWOg0pSMYy+El6d5QS0/f9hIVwb4QSgjRldN1MlK0PNU1zmhVvpgKmsraXaGq283pyzclTyJqNWaF6c/qJ6rgnUzhvUMgHldnk+lV6R4iI0IPLX+sFoxK6qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726772888; c=relaxed/relaxed;
	bh=eJHMpeXBqBHo2jYjVm7Wr4Ni+pZLeT1f/0a8PrV52GI=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=FOEw35reDa6Nq+Fqbv9/DpEMKBo60TtMz1hiKw1dopIcucII7b0Eynz/OqH5WnDycye9FEEdRLSOVy+P5YvZs81kgb8diHphVBWtdxlSLTQA+pROPh8K1HV/lFVZDiqLpUO1H47iF10GjVKZNMDjJZZLw0yHZA6vqxcXT7NZLyAqwdB5BCDgYHyf3DjzEADHSV4HrfkrtgSy/PqghiYQ9mtuTmd5UGCj+PsZwiM90qDmiZYmfvaOfYJDLCpGMiJ8pS/v07XjtV+gOc5DwcRMspC9rXj8y0JYDPiuJIWHx1a5oGhkROYQra2F74/95LFXmrBmbYYomj05oMxAMSnulQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Y1D0R8n8; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3k3bszgskdhaqczhcbzskwguccuzs.qcazwbilddq-rsjzwghg.cnzopg.cfu@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Y1D0R8n8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--coltonlewis.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3k3bszgskdhaqczhcbzskwguccuzs.qcazwbilddq-rsjzwghg.cnzopg.cfu@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X8lQv6R1cz2yFJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Sep 2024 05:08:06 +1000 (AEST)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6ddbaec823eso22373267b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Sep 2024 12:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726772883; x=1727377683; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eJHMpeXBqBHo2jYjVm7Wr4Ni+pZLeT1f/0a8PrV52GI=;
        b=Y1D0R8n8tJRZ+3H7/w1GnUJHRdgQzYj3GsHWsVQDu4sYX78NAjkKUBtQ3IptDwCGNi
         U0PVr98DlP5EfpdKCKRt8Iyo+CUznrda89c4Y4+hAVEDN5Ek+Gb4OSQ3BKw26R6eJk4G
         3WLulFvQ5RqS83WMN/ULhWPHc0FB0DMWsgWXcYQNKSJ7x8LknyVJNnMX8ilcF7UKmmsM
         YM8xbbAgF+Nh0B7190d3kZ1qIoSsWbplchWAxN61EHTBeK2T/BP78hKWUWmxbm/PjX2M
         AhW57FBtCYjDsgNK09BwCJhIxLa2WGnU5KyAyP3GAt0lyTxMlCDCY02Z/m4Mytnxh/nY
         QXng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726772883; x=1727377683;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eJHMpeXBqBHo2jYjVm7Wr4Ni+pZLeT1f/0a8PrV52GI=;
        b=C0GIu3tF8uIC/aLOdk5sPqjObxy4USd4akss3XVsdSuASjDg3iRu17CR3iNRU8imBW
         A3HrZgeb+B1QHc52S0yjbsKFkd8x342je2oTdU/DDVSTdp91/yEXMjpOkA8INbfbbasD
         gNCGQYXmByd6Z6/2IKyW9i1qTmljPL9dKeX7P5cJQpitSSAMdvR+LHhaZQb0ZbbMpdiP
         fICq9fqU5DoErjEYg6fcLqyY4n731eH3kQV5HlZUAfvTosBtanHRXs14SGlCWeh+xSk6
         xgglPHaWrr/Lsq6B8OT80GS4/BVA4E5kZWRVJ56Riwif0DZOY0jYRZDCT3Af1zFI8PeA
         P3Bw==
X-Forwarded-Encrypted: i=1; AJvYcCXxNBPjpbDGO/tsijg2yYVERD427tWkAkPyH9OXexFLXaBr1ePo9DqBqjub+M8RVS0B+N4z9Rhd5ctxuMw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwuUF2lq1ruBgVTdWhQmrEyfnoA6pFCOv7xl3hK/F5jpoqk+LMM
	z3EnsSY0A04+9zFp3S2l6s4mw8IXWxoHUHRXNGyeDx8w0qM5MG3Y7KizJOdbMcV4zGLOWFLvZ8Q
	0i0Vd/feZN1Jgw+IQh71mWQ==
X-Google-Smtp-Source: AGHT+IESgNg1xrjDzw5/X4AiZaC1nvZhQJSik+/rMadiupYuHwBrYqVfj2Vx3ImG/bKO/SiM3evLKhQtwAQgJ9v/bw==
X-Received: from coltonlewis-kvm.c.googlers.com ([fda3:e722:ac3:cc00:11b:3898:ac11:fa18])
 (user=coltonlewis job=sendgmr) by 2002:a05:690c:2910:b0:6dc:835c:9821 with
 SMTP id 00721157ae682-6dfef02138amr20507b3.5.1726772883478; Thu, 19 Sep 2024
 12:08:03 -0700 (PDT)
Date: Thu, 19 Sep 2024 19:07:45 +0000
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
Message-ID: <20240919190750.4163977-1-coltonlewis@google.com>
Subject: [PATCH v4 0/5] Correct perf sampling with Guest VMs
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

v4:
* Correct compilation failure on PowerPC

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

