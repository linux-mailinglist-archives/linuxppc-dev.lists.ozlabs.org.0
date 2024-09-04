Return-Path: <linuxppc-dev+bounces-1021-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E29F296CA80
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2024 00:36:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wzclj6022z2yhG;
	Thu,  5 Sep 2024 08:36:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::d4a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725482551;
	cv=none; b=lPudiRwDCFYcxeP1YY+OC3pnjj7jE1KlRMBxXfgFSpAClxcDmF+5BjUz1NZvsmQBosBTXj1a8Gg74LRYwYfjVgmNvHvE3PlxzWghF1U5oYbpXBPDgUSBzNGEpZ+UaMer6MFkS+WsGAxGnqPNpxk0hBu0qe4Pa5bCnD6Z+8GXHKynvfkAdO0yIlbS//mvcWrLm/2tMmfIW/mfadlEDNVWMHfLTqNGjHTebEbIrqQC3LdvukhiQ4spk/sgQj4quad2/OptnZDo0XY7qI5l28tB4AhMDUNpulf4Y8wHXefNz+6XevmZ/Y4eVu1AfgXY/qM+t8AosziKaSFG2FhU1RHg8g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725482551; c=relaxed/relaxed;
	bh=ctqYquz1bwE1hQvpJznobcopye7Y9x/XQ0ajqPcWFZo=;
	h=DKIM-Signature:Date:Mime-Version:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=Pt8lu190KX4F1Z2yBnfSfyoqYHPBGSeZYuA/8mjpMhb/mKQ+HA9Dpp5rxIKsu+ISUGtfIrup5AW8XuEQxXnU3jpc0OHiyNaJdo0YHnK5UApt2J1ZhzNOLY2t0cAQGxyP9hMJLZf9ichZ1DGwpRagd5KwnMoE/SfBodZc5ePr4pzOcQvYq7Oxr+eUrUulOgwmPHB6kO0/06NgsZMYQFvd7bOBemjNJkpbTBsImWna2IK7Sy+Q5UCDgBxpIueGuwsQcpIFdkA9m26QYku7gz4d0ClazOdVKXZh6KznbsF8WTihK5m4NDfLdd1uz3gXgYigcCZDA66FqD8eETnY8mSBbg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=ZOSJ0LN2; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::d4a; helo=mail-io1-xd4a.google.com; envelope-from=3msbyzgskdf89liqlkibtfpdlldib.9ljifkrumm9-absifpqp.lwi78p.lod@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=ZOSJ0LN2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--coltonlewis.bounces.google.com (client-ip=2607:f8b0:4864:20::d4a; helo=mail-io1-xd4a.google.com; envelope-from=3msbyzgskdf89liqlkibtfpdlldib.9ljifkrumm9-absifpqp.lwi78p.lod@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-io1-xd4a.google.com (mail-io1-xd4a.google.com [IPv6:2607:f8b0:4864:20::d4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WzZDk2BRjz2y6G
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Sep 2024 06:42:29 +1000 (AEST)
Received: by mail-io1-xd4a.google.com with SMTP id ca18e2360f4ac-82a338f090eso764704639f.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Sep 2024 13:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725482546; x=1726087346; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ctqYquz1bwE1hQvpJznobcopye7Y9x/XQ0ajqPcWFZo=;
        b=ZOSJ0LN2KiLomPHwEdnlfv8U6SUWX1jHjR4IHyrdG1tJBDiKS7QDMrfCxEJpgYFbBV
         uC2PrzRSpQrICkNeudIDrmXJ4k1MOgYUsZBtJijr3eFfCNtsbBBqPWaOFxEPU1fVZJCV
         QYtLINFxSDLDq+0B0nbl1RaRe2w+H6CCByJ2/JyQN1hEX+YunFlvQaRbIJFjM62alvEY
         h7HYSNQNY1ygN1SwCFkhIU72DSzNliNZihhRJFGa46KWjUkkRm2OvGZoFNSlZdJEGuFo
         d/5fkhq3lSVAgNzd46UXI3VJd8QV1ekijNvvP4sRBaXk2wtnkzUaQvcK5SlQ12Te7yY4
         RKTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725482546; x=1726087346;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ctqYquz1bwE1hQvpJznobcopye7Y9x/XQ0ajqPcWFZo=;
        b=r/SN7f9kx+3IPnnH4KOe7NRqtxeoGGqghBy6A9Ka2/gNCwUFyZZnoxZakaRZ8Cffbm
         yuNgvwhwU+iuyRs9DPVMZYSMrtlO0GY4U7CnHn+s5dzx+UkpwZ58zUxs+g93/stfhv5K
         m0YMkM8KlTZJeV5LuG+F5CwKpKaEXDhjB8tvDF1bKWIHkq6ynEUWJwLIkOEaLoCD3PK0
         ytKO/OQp90u6yK0zOW5rMtYBLAn/fyqhB8xGbZ32PKI1vKYgSESui5GwfLWB5Y1XplGA
         bkzCjXwjKsChp4jekLnOiSFrtU7z6zh3/+5SNQh88qaWdDwX2SdamZnzcW2cwlseSYRR
         FQ5A==
X-Forwarded-Encrypted: i=1; AJvYcCWliwdMqXDDL73nOOyW4MTEi4yhbgOVc7WqKehlvMK+rqJ1QYSJGWeFZrdzhHW9PSah+mzlHGWCWOvDyaY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzsyjNw/ZBYXlHQcfc5EBtvtyP41by8xFC+8Mqoh2atTJSaC357
	61DOz3syNKyR1SYfxDARSuGMiAzM94RmLxQMI8k+rUjDUg2xh31sF4gRAh4aT/Ol6JKj3S1ZyeN
	xSD7ATGPIR3CtjWvcs7/4JA==
X-Google-Smtp-Source: AGHT+IEtsSJC9/om1b8HlFPuz7GXNfmJVWOiKxpoFqh5UO+7l+qZhOjL2xwg2jTs7pit3+eAfsD2jQ82kAHSW+Wrgw==
X-Received: from coltonlewis-kvm.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:14ce])
 (user=coltonlewis job=sendgmr) by 2002:a05:6602:15cd:b0:81f:8d10:6f00 with
 SMTP id ca18e2360f4ac-82a262ca171mr93032039f.2.1725482546134; Wed, 04 Sep
 2024 13:42:26 -0700 (PDT)
Date: Wed,  4 Sep 2024 20:41:28 +0000
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
Message-ID: <20240904204133.1442132-1-coltonlewis@google.com>
Subject: [PATCH 0/5] Correct perf sampling with guest VMs
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

This series cleans up perf recording around guest events and improves
the accuracy of the resulting perf reports.

Perf was incorrectly counting any PMU overflow interrupt that occured
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

--
2.46.0.469.g59c65b2a67-goog

