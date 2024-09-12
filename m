Return-Path: <linuxppc-dev+bounces-1299-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B9D9772EE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2024 22:51:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X4V3f35htz2yYf;
	Fri, 13 Sep 2024 06:51:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::b4a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726174302;
	cv=none; b=YVjYVXsf+mjESar0ulKh7iovcyQ9Sblyz32nXS/oz4vEs8gEnmjSWX8sWbUzLJgpdJWDLIXzYPj20vGJB1iejcrrxaLedYMbrZtQD2PKvORZZrEs4ExSm6O5HO2+1XL03lUPwmcpcU/ZrNv3K4baTEtlQfrXp51rtI4M+sNkmqKPMwiV0ah0OibPm2HoWrdD5NKIDT0LSsy2mGSYLMVK4YLCjOvqgdN9a0soCBwzBdBX5WpA5WYRkq9pciO0sINvGAYNtm1H1bWeNrRGTV0Kv2XRUhVJbVF2u7MKI4QHfIEh0Wxm418+Lo6hvMshuPuL0FBqycpAlW0ebd/AJ7ETZA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726174302; c=relaxed/relaxed;
	bh=h7GxOQtGez9zo05dGUGsUVNGDqEVne28eAH8BDc6VWA=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=VWDIrvwSCozr51g0YSbYB9PQuo3UUYrehRGn3JZ8mvAHs2yJ1CFSLTxQr7PBM1LEKcmc0H4hHPbabmD6mhnTX8Uz7zavURqntEVdRDsxPOST5NK+LhQhs7l2aqV00mcgRs5VbIaRbrX93vFeMUMSJ8rgxSAQjdrmhIKEt01CTQ/y3fKaBSCNuPupd8jRYt3Ngw1GBOHI9DdbotmfbwY/CDMLSgCFgv3Xm/x1T5aiA0FO0d9NG51/rKPH3GZXjVbtLC0+azHfc0bliSagQTZidPH9ZQZcCd4q/cQLGbvmsza5AtvXdyJWmeCjxwzHRadg0TE1/qera+5PE5l24fIrpw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=HfkE4gQf; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3v1tjzgskdmos419431ucy8w44w1u.s421y3ad55s-tub1y898.4f1qr8.47w@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=HfkE4gQf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--coltonlewis.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3v1tjzgskdmos419431ucy8w44w1u.s421y3ad55s-tub1y898.4f1qr8.47w@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X4V3d5dDMz2yVX
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Sep 2024 06:51:41 +1000 (AEST)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-e165fc5d94fso2639696276.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2024 13:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726174296; x=1726779096; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=h7GxOQtGez9zo05dGUGsUVNGDqEVne28eAH8BDc6VWA=;
        b=HfkE4gQfQlizEKhuY8AsEGSPrnbqdkb5XRlh9icTLP2MWOFuze1DdwwDvnHT0pM29K
         RLybPFGHJTSdAHJpjmwjP1UWZwfkMKWPNXsn7xFdiu4i7xnHjfklB7c6L7qtDcZBYO4L
         XKcuB5SsIGVCZciLQMQf8qMR7pZf9Nmq9Xx5qbxVJ1QZQxIZv75cYpfdTIsWnvAspyRn
         VDDAUji+eYQSDubSlVGAbBYIEC/xq4wtD31kfo58Gm9D5hynuMMXt4mnAIIFB/y5IKVQ
         Ngt1L/mc+ZA4+MOhnIJ/heLnLkW80KTlcB7DiNYjR8X6aGi3ghAWZxR3L5b4hrfQuir6
         ebhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726174296; x=1726779096;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h7GxOQtGez9zo05dGUGsUVNGDqEVne28eAH8BDc6VWA=;
        b=GA3QVvYYW7POLHT+TBxRrMvngVAM2KNZ5FwJfDyxrTmNE7T/7qIZq6A1mW5weeNu31
         Yvg/QYKrrVSTuEdEEaHanQa7lcKb8WLETlpnZXNRjEsLKxCW6A3x2eYAAKx9gbfgbNVb
         emNGaBy7xIqwCXRqvgpZiOQCK6wNE3wNLeGdbCjVrEqLuPF/SVMFOvvQudfx3GM5SUmN
         Oy6aIIAS8wBuy43DN6TBuT8A9jSNFrnxnj0JM9HK3ud59FZyqE0vdBHuDtFxs7x/8+MR
         /C8WIGUEzS3ZIclPgDUtUAV+oSpS583NIHPGVCG41QOFbCq0InL1+MmhEtu9nrjB3Gpg
         Gk0w==
X-Forwarded-Encrypted: i=1; AJvYcCVXvocnDZkSFo1Twb21I51qC8CGHWVKq+F6y3r6JykQkFurrzcUCmAuobI+ggV02CGn3vbRMPzNF93+dhQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyN0F/2KNQtX7A4geQz81rdOv27A7ct1EobjdlIp5iyrpFTrksz
	foxFm0t5UpZ64x2RQNnEzrHDl6Coz5OZV4FyeLiFDdEXkj8BLyGTyugPoIcDmo/y8iXcC3IqcdU
	fGfHLV+xujBGvcXWgITr+sw==
X-Google-Smtp-Source: AGHT+IEKK4aKpKiP70M1q7RoK97ftYvX/6/8VPxfOowbkLjsgUfLaXZWPQb4Cz0o8Wq45udLHTwqEBExFDGaaK+o3A==
X-Received: from coltonlewis-kvm.c.googlers.com ([fda3:e722:ac3:cc00:11b:3898:ac11:fa18])
 (user=coltonlewis job=sendgmr) by 2002:a05:6902:1781:b0:e1a:6eac:3d0f with
 SMTP id 3f1490d57ef6-e1d9dc419efmr6874276.8.1726174295745; Thu, 12 Sep 2024
 13:51:35 -0700 (PDT)
Date: Thu, 12 Sep 2024 20:51:28 +0000
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.46.0.662.g92d0881bb0-goog
Message-ID: <20240912205133.4171576-1-coltonlewis@google.com>
Subject: [PATCH v3 0/5] Correct perf sampling with Guest VMs
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

v3:
  * Clarify final commit message further
  * Remove an unused variable in perf_arch_misc_flags()

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
2.46.0.662.g92d0881bb0-goog

