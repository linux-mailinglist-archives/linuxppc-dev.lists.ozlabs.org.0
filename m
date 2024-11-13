Return-Path: <linuxppc-dev+bounces-3155-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 857639C7BD0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2024 20:02:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XpXhX6TyVz2ykc;
	Thu, 14 Nov 2024 06:02:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::d4a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731524524;
	cv=none; b=Wr07VGYAQhfGzDycJOpqlu5FTVwEerYQ42UE5jiGhd8ru9ndcmcJB6BEVOvkHnVIT5LaBVOz28iXYpDc3It3koqEUXN4wyPwNQKW41MeylOfhqJt71o7NZoGD8vP5BAd1d+/sijDYjUVHqjWZKrL/BGtF+xqth0TlqEQgkyoSKa0hiGOjuaULTZw83FlVPlYH312w6TulQ/tOBju4nXIkMQY/AozKKJ1E+MOhsh2TdwgXd5mmLbViAiK+DJTOWegw6SISkRieVqIMFk1XMdpW5u6xtdBkROEq1wYx5+XK9mx3itej42Cmu5fj+YLa+IEbin1F/6Vq90xPUz2ldBG6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731524524; c=relaxed/relaxed;
	bh=PXcTglpRYSGUG70owXD7nOF+NHWPUf0sMel4JnLxMI0=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=AJbPT1gT7+eLA5h0EJ6C953PMGuw+F/vqiZ3lvPiXY4+vY5U9p2I3nI2L7gTOvab/G/hUuup/UE+P3WOFiMp779ru+67mIRh1sE0t5o/9MMWZkfeUzMDkCY2HlL1lPUBP5iLTICrANmSmCXEEjI/gt+QKwj2rbH+VlZWAbcz6HOQ5i85TIjuAdwtA5105D1nLBEN3vCMdNS+wM3ZSRTThKdS1lMBaTjnWRdeait/PQLrZWQN0srwJVjYnIHfNa1vXrEOBJSt9LoIoBKZAPm997f3xC6eGGLbLBuZTWk6bTWdp6XFMD10lJUxkpAZZfgR2GicX32HkcR4vkPRYWaTGg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=SvLcCCfv; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::d4a; helo=mail-io1-xd4a.google.com; envelope-from=3p_c0zwskdkomyvdyxvogscqyyqvo.mywvsxehzzm-nofvscdc.yjvklc.ybq@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=SvLcCCfv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--coltonlewis.bounces.google.com (client-ip=2607:f8b0:4864:20::d4a; helo=mail-io1-xd4a.google.com; envelope-from=3p_c0zwskdkomyvdyxvogscqyyqvo.mywvsxehzzm-nofvscdc.yjvklc.ybq@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-io1-xd4a.google.com (mail-io1-xd4a.google.com [IPv6:2607:f8b0:4864:20::d4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XpXhW3jtLz2yk7
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2024 06:02:01 +1100 (AEDT)
Received: by mail-io1-xd4a.google.com with SMTP id ca18e2360f4ac-83a9bd80875so770162439f.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2024 11:02:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731524519; x=1732129319; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PXcTglpRYSGUG70owXD7nOF+NHWPUf0sMel4JnLxMI0=;
        b=SvLcCCfvmjq4bpXnQpCFg0U0jKRqZATQ9me53f5JGYg4cc+B2e6NCDE0+Fw6fUJxsa
         j7pzetxu0YXtLnJeF84mSzOa7tEVKdy5C7bLUTD5HH1TffC3Cy1waGLXoK61uXKesoNq
         L64AxavooQT4o00c1s7QPDnJHmIEabNNVHbvm33q5VxzR+snlAC9DMoaABLhDMBmU7UI
         QRiTlqJj5HSHp4SEs08xKQZyLpftpzjXSn1qMbHydJPXzV8rcT8JVQ64ametqrabtomi
         PLpBWOHcW4ojqtWsTZXfq+vjmJICpzp5TpJhNB+pazuLM/fq2wUvYaGroivMq0blfiOY
         27yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731524519; x=1732129319;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PXcTglpRYSGUG70owXD7nOF+NHWPUf0sMel4JnLxMI0=;
        b=nBBtnJnjmkqVhG52wQXkPu3Ec9p+rpKvMb3cWZZCT/xjx41bdElii28scHbcsPMvsm
         59ac4l9dejmtuhRTIwMrbLAd22n9sgOYgrwqJ/0RGqHe2pQvnEwyd87CbAUMlM7tde4t
         0K2D9hoXAmOjCP+6KuJ1eBL8xVgbWTzVWbdPhcchKGpWDtQaUUPCgXRIfCvDypxsqGSZ
         dopO+4TYNXonk7lt7gvnjTuqUStfOnwOoBMXbCrqBipttDv8E5XhjZaWhHmIPErI7zwG
         NndmIgbJNkHHDXG/WzZmrkYfAeJFO0FO7e8mynnGzzMjoBW6zN4pBH00LACBYZmM1Jvp
         V3sg==
X-Forwarded-Encrypted: i=1; AJvYcCVcbqY+Da7yAHraPNka4buSEAYi9JZtvxRsntCP4a1bT1KttbCp8Dr1JLVa6AhR1qFfh303w6WHnaN0YqA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyFfx3wQIMzjImtz19h58GzyQMC7EO0VtY3+6nkrTSr5r2UENzP
	Z0V9VZoap3VKGYZqAG3jgvT/QVLostclxeSx7kmEda2AndAw15VZp3P4UJ/UW/hUv4FLFbKRJUd
	CAT3v56aTD9S813eE+lPmRw==
X-Google-Smtp-Source: AGHT+IFIUdSo/WNLK0PV98lBe9m4ohTkfvDAOqn44oZ30S/C6GtrbtwtcCTbX1AO1mQEzViQLH/wGxNpeNufHAxBww==
X-Received: from coltonlewis-kvm.c.googlers.com ([fda3:e722:ac3:cc00:11b:3898:ac11:fa18])
 (user=coltonlewis job=sendgmr) by 2002:a05:6602:255a:b0:83a:9936:d1a6 with
 SMTP id ca18e2360f4ac-83e4fb9178dmr1860539f.4.1731524519017; Wed, 13 Nov 2024
 11:01:59 -0800 (PST)
Date: Wed, 13 Nov 2024 19:01:50 +0000
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
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241113190156.2145593-1-coltonlewis@google.com>
Subject: [PATCH v8 0/5] Correct perf sampling with Guest VMs
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
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

v8:
* Improve patch 4 perf flags refactor
* Rebase to v6.12-rc7

v7:
https://lore.kernel.org/all/20241107190336.2963882-1-coltonlewis@google.com/

v6:
https://lore.kernel.org/all/20241105195603.2317483-1-coltonlewis@google.com/

v5:
https://lore.kernel.org/all/20240920174740.781614-1-coltonlewis@google.com/

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
 arch/arm/kernel/perf_callchain.c             | 17 ------
 arch/arm64/include/asm/perf_event.h          |  4 --
 arch/arm64/kernel/perf_callchain.c           | 28 ---------
 arch/powerpc/include/asm/perf_event_server.h |  6 +-
 arch/powerpc/perf/callchain.c                |  2 +-
 arch/powerpc/perf/callchain_32.c             |  2 +-
 arch/powerpc/perf/callchain_64.c             |  2 +-
 arch/powerpc/perf/core-book3s.c              |  4 +-
 arch/s390/include/asm/perf_event.h           |  6 +-
 arch/s390/kernel/perf_event.c                |  4 +-
 arch/x86/events/core.c                       | 64 +++++++++++++-------
 arch/x86/include/asm/perf_event.h            | 12 ++--
 include/linux/perf_event.h                   | 26 +++++++-
 kernel/events/core.c                         | 27 ++++++++-
 15 files changed, 111 insertions(+), 100 deletions(-)


base-commit: 2d5404caa8c7bb5c4e0435f94b28834ae5456623
--
2.47.0.338.g60cca15819-goog

