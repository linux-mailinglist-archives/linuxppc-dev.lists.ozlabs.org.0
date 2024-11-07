Return-Path: <linuxppc-dev+bounces-3013-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA009C0E42
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2024 20:04:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xks2D0wqlz3bqP;
	Fri,  8 Nov 2024 06:04:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::14a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731006276;
	cv=none; b=MeomrdruuL27Q2j1/JFP2oQYzqeBAuDZalMsSaqwsGB3HIVx3lfxX8r+Fp7rL7Taypuq2OUiQxILrM4D4dcwIU0NEik6dGBQfmEBBHXZ3qs1R528OIOmvXxmvM9mtMxSaZwSMQ2vSEYdj558QqjBnHb/tcHex7gw9CLMgd6iga01DiGh/i1C7Vfzyh5Q4KZ6GfTRHbkrd8fIg24NC38z0+iTCXNxMWBdnJ1NqORAG6LMyo0VQ1km+52O9u2lAPDjtkw3Lvu9NPZkb0evZeXJYqE8u+57kz81c/cBXHLRAKCa4+T9HKCC0gwa8R4LGczUgHZk8YABnW80WLGyX5Ovog==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731006276; c=relaxed/relaxed;
	bh=307d+oKSDEQceCQxX9m+tC9eleFe8W0Ggi8DlXu2swQ=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=RCCImn40OOoZguBZIbFShavrJNV6XzDOgev2TRSIiGNre8U39MlAzUW2+GysPMBYlx5KnMf1Df46E9AtdXohl+o79yUaI0TAz3itoqZsD6gp+DWOd/g5LNUrFa1W/icUGJ+ygNOkWuXlmEwr/vMHxJoJ1PjiZbOsbOuakcs+eh+G7ouDpAfWwT7BA92yrfTL8ANIMnL4z/jXhTHDO4qvXRzvN53pNdYiX8siX1zL3Kx/vYcDcOHmXMCvPB9sPQ53WtsjEK4Nv846cDzFCFhQkUvzGF180aSwhn921g/yAzBEiKp/MbYLxQaobla14F51KjM8iOURlfo6Jz7H7m7ifQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=FJ1dZTcb; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::14a; helo=mail-il1-x14a.google.com; envelope-from=3nw8tzwskdeoo0x50zxq8u4s00sxq.o0yxuz6911o-pq7xu454.0bxmn4.03s@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=FJ1dZTcb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--coltonlewis.bounces.google.com (client-ip=2607:f8b0:4864:20::14a; helo=mail-il1-x14a.google.com; envelope-from=3nw8tzwskdeoo0x50zxq8u4s00sxq.o0yxuz6911o-pq7xu454.0bxmn4.03s@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x14a.google.com (mail-il1-x14a.google.com [IPv6:2607:f8b0:4864:20::14a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xks28581Pz3bqC
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Nov 2024 06:04:31 +1100 (AEDT)
Received: by mail-il1-x14a.google.com with SMTP id e9e14a558f8ab-3a6b3808522so15179145ab.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 Nov 2024 11:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731006263; x=1731611063; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=307d+oKSDEQceCQxX9m+tC9eleFe8W0Ggi8DlXu2swQ=;
        b=FJ1dZTcbrDl5KohUI81F5gUjR14QrRFIOyUlxQxUAQuJiejC1c3KORjOousWw6Ytkt
         MnirwXew4N1e4xtIfXE8Hfe7kHK80RWHMWkQbF5iV8y/FWeXFuK1QIsxUz6+PbuXJclS
         s697BhTQDWphDyRlawnaxAS4P2HsplwHLzHE1rDigccITQ3LiLrKgjceLt2gKG3l5fM+
         NShp2jPPe5E9QdmNNb1s8wreD8WUxlZFMFoNq+2BGe2aAcNBbNMVvH1c+4sKYGLKYV4i
         Knm4Xo5O2htVYT4bfXjBGFs2AhiFTEdiSmGNHk3YjMst/9P7iSu64QwwNrgA4Eyl/fEk
         MNnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731006263; x=1731611063;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=307d+oKSDEQceCQxX9m+tC9eleFe8W0Ggi8DlXu2swQ=;
        b=Xj6WbgzsA514nag6gmujCSqFcx7V6OvKkzwZtFZ4/JG7h8Gp4hFB6WyIgKIHTioLXY
         bFoC7P7QNXcDRbBSuRP1R3MLnMbSFI7THrecrUahmxULegfNxzsCIcdwvkyTMRCW4uqo
         /sARYQNCk3x/nPcmKpd3d7hxIykxJGmGx8cRw4CvMWUs6AeDyO6lYRDfgxewV3wmaXLK
         J0E8b+Qxtrioi1N1wlSTf+amywLH2i7GhAJFF5/Ml4hgF4WY9xnmyyx9wQS5jU1OgbAS
         qvHHZmqcro+dJZvR9i44KCiXcb2zkaPo1smlVinFhg7BCcMTxF+t17Z1cqALdN1tIrEy
         8xJA==
X-Forwarded-Encrypted: i=1; AJvYcCXT1blI8//hHVda5G1U9aB/Ov3mihGlwQfFosaaHWRwEW2ufSw9Mt5nRGnKNLp+wvtokLGWn/s9c5YVdG4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz7A9DRy/gSLbtARgMBVA8YM1xMjnZb6LYD30IhddTlBMbyW3ce
	8nYTkSbc9cXrDfXYa+31m5dTt/aiaOzUNaGl1A7KvdwKY9rJ3No/lNLpND/1yy6EfNwzC3ZVkHr
	i9BPB+IPS7+6nNg4hzFvoXQ==
X-Google-Smtp-Source: AGHT+IEEjTpPYQzMBAhybW04MdjW8AF86rC0c7OtK7AUjaSX9oKv312D06txGG3KDB2dLThYbB5SuJMvIMPM40vk7Q==
X-Received: from coltonlewis-kvm.c.googlers.com ([fda3:e722:ac3:cc00:11b:3898:ac11:fa18])
 (user=coltonlewis job=sendgmr) by 2002:a05:6e02:1d88:b0:3a6:be9e:fb56 with
 SMTP id e9e14a558f8ab-3a6f1a44701mr21665ab.3.1731006263567; Thu, 07 Nov 2024
 11:04:23 -0800 (PST)
Date: Thu,  7 Nov 2024 19:03:31 +0000
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
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Message-ID: <20241107190336.2963882-1-coltonlewis@google.com>
Subject: [PATCH v7 0/5] Correct perf sampling with Guest VMs
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

v7:
* Refactor th misc_flags check in patch 4 and 5 for more clarity

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


base-commit: 59b723cd2adbac2a34fc8e12c74ae26ae45bf230
--
2.47.0.277.g8800431eea-goog

