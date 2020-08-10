Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8165A2400E7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Aug 2020 04:30:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BQ0L859fTzDqQW
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Aug 2020 12:30:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=hXxOU2xG; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BQ0HY22b4zDqQH
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Aug 2020 12:27:50 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id o5so4077547pgb.2
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 09 Aug 2020 19:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lzxph7HUrtCsNObBpk/2q0N4xl2/b6fgaDXhZwZ8wdw=;
 b=hXxOU2xGFDWhSc6pBH4LsAl13Hv/3Opah9RgUAM9fODj01xKgQGx9kXp9H2xjHfJXv
 uwcKkzXB6aHmFRd6n4+U/gjboLnFEE2NScnQHOQDDjBiX4n2wpykdVdkeo0HMtl65w5u
 DmDY0E5v11yItK6r6dnORxOqWdSHbDcTpgXAjLgRGRqcxGRr9l/vynHLOxqahpp4WxbB
 /H9YBc1AlFkIITjMJ6FvsLneGyu+O5I8WaaqgbZDWHkioWhekTHr1EXZ719YBcJANixA
 RnaVSsoZ8wAMdOPuvFDqPHf4F/JSr2y6Tqn1xxogDiz4Ry4qQGAHDYgZmaCRHj4D/vX7
 rugg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lzxph7HUrtCsNObBpk/2q0N4xl2/b6fgaDXhZwZ8wdw=;
 b=LYHRIQdMaMwDR0wyfQxoMMXK1JX+fpO3JgLyF+y9PhIprYz5sSTaArcquqvHIUj9ut
 iPUM8XwW63vVyQcP8kttp74TWG0ZuuxFoUdbZCGi+huMTw8Fa6mz2YJ9gmA/b/2NKe9m
 u9Sf7KJn0alsBXBYeW4J62j1jzOKVWMIJzZLcahefiwpDyW6xG7/dksaBjcu+j3qZcsN
 4Q4XfcqJYr8dc2694cFMNdRtpBYsILwCfu8QwdHDvjT7jhg4p/No2sPvOLkcQunAVdZ/
 XQPcBKpVKYCUqIr4bkjrSGYhNjmGg1FSxhIWQ3E0fFsJ+B5dr0mFLE0ueuoZY/6u2MoP
 AiFg==
X-Gm-Message-State: AOAM53219EuL6+dF1Gko5iybYpoRJ8pwSl2NSmQUzHvFw/igdjTgNjyh
 Rsr1F0bK1xxYf0Sv+DuqxSU=
X-Google-Smtp-Source: ABdhPJyo1yMviqJeXAUhMHDnChq1lq67ZG7fUhEPURTQRtsv3hxzDLawTAFoRSCkbWkcDXxswkoPdA==
X-Received: by 2002:a62:77d2:: with SMTP id
 s201mr23249114pfc.213.1597026465676; 
 Sun, 09 Aug 2020 19:27:45 -0700 (PDT)
Received: from bobo.ibm.com (193-116-100-32.tpgi.com.au. [193.116.100.32])
 by smtp.gmail.com with ESMTPSA id l17sm21863475pff.126.2020.08.09.19.27.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Aug 2020 19:27:44 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linux-mm@kvack.org
Subject: [PATCH v3 0/8] huge vmalloc mappings
Date: Mon, 10 Aug 2020 12:27:24 +1000
Message-Id: <20200810022732.1150009-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linux-arch@vger.kernel.org, Zefan Li <lizefan@huawei.com>,
 Catalin Marinas <catalin.marinas@arm.com>, x86@kernel.org,
 linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>,
 linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Not tested on x86 or arm64, would appreciate a quick test there so I can
ask Andrew to put it in -mm. Other option is I can disable huge vmallocs
for them for the time being.

Since v2:
- Rebased on vmalloc cleanups, split series into simpler pieces.
- Fixed several compile errors and warnings
- Keep the page array and accounting in small page units because
  struct vm_struct is an interface (this should fix x86 vmap stack debug
  assert). [Thanks Zefan]

Nicholas Piggin (8):
  mm/vmalloc: fix vmalloc_to_page for huge vmap mappings
  mm: apply_to_pte_range warn and fail if a large pte is encountered
  mm/vmalloc: rename vmap_*_range vmap_pages_*_range
  lib/ioremap: rename ioremap_*_range to vmap_*_range
  mm: HUGE_VMAP arch support cleanup
  mm: Move vmap_range from lib/ioremap.c to mm/vmalloc.c
  mm/vmalloc: add vmap_range_noflush variant
  mm/vmalloc: Hugepage vmalloc mappings

 .../admin-guide/kernel-parameters.txt         |   2 +
 arch/arm64/mm/mmu.c                           |  10 +-
 arch/powerpc/mm/book3s64/radix_pgtable.c      |   8 +-
 arch/x86/mm/ioremap.c                         |  10 +-
 include/linux/io.h                            |   9 -
 include/linux/vmalloc.h                       |  13 +
 init/main.c                                   |   1 -
 mm/ioremap.c                                  | 231 +--------
 mm/memory.c                                   |  60 ++-
 mm/vmalloc.c                                  | 442 +++++++++++++++---
 10 files changed, 453 insertions(+), 333 deletions(-)

-- 
2.23.0

