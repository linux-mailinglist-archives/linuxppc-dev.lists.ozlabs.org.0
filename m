Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EE815808B5C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Dec 2023 16:04:45 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=z2Dpthw0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SmHcW33xDz3dKJ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Dec 2023 02:04:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=z2Dpthw0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com; envelope-from=alexghiti@rivosinc.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SmHbc5L7kz3cRy
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Dec 2023 02:03:54 +1100 (AEDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-40c032962c5so12431635e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 Dec 2023 07:03:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1701961431; x=1702566231; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nzUGYpwYAIocf74DCpTux4YFllX1H7F6zPZyiGHWp1Y=;
        b=z2Dpthw01bgfvp0Zaqtu8/Gxbm3qPfEVDrz2YZ5a6IE9ro/W17KLq2B7Ykq7VL2RBq
         +t+J43de/FokKCEBxUNKpah6ToBOs7t7QzkZZFqN9dWvMbVxFmpzc4zq4IgZsAV9QF/v
         vrDzRKapxeptZBNox+gDrVqCk2/hDEcS7aqhpH6L49xYmUJ+ILf3YoWMR/mehFSXf0yT
         EWgx0ddZPpl1FZuyznVTev4fjS7rmw/DFAZTKWIwAmZxO85MdLl33WYftxBFxwqo2zF9
         pUFcNBY0KPlgun3AuE510D/EaxhYoJK87jX81+91V3DTap02yFvaFm+sydUk8BQ8gguq
         6VTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701961431; x=1702566231;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nzUGYpwYAIocf74DCpTux4YFllX1H7F6zPZyiGHWp1Y=;
        b=cLmX/2NMd9nCTSjGJjfIxwepBNAbB0xWDAw5VoZJWIIdwnVCKHDtKXyVsO62PXMe0b
         V6bAt0nlFIxgNM4W+YNNmLV9siPD9yArs8m9np4KLcVVfRm3XjLnb6EaS97cZJ2MI4AC
         xbYPVaJisXmYKtOe8DED41QN96kHqOugVl6lm108mkp+gY+8YnWv+1Gov02NGylwbTXm
         WurwUQTMXg6aX9ElSHiUFsarDr5LLfuX9aHDP+0jtPMBsgjvgmaDxDU6MKinOR0aKV6S
         TiXMrkMI+EmWnPUuTqG9tRk7Z5x+hO3BFk/XtdlgHq89DbTi892g2oWYb2OO3Q2Pchfw
         7T0Q==
X-Gm-Message-State: AOJu0YzGoeUJMijzAat8AcmtLNB4SSVicsHTYxnEnm/i1V0NO97gS0D/
	zsP7438iS3Kh8TeKR0sKp63EXQ==
X-Google-Smtp-Source: AGHT+IEfU8bcWPltllq4UxddBOusN19bKPp7FZtm1tNb3JVSGuXfSF/1fbnNg3hbcLptFO8P4+JaSw==
X-Received: by 2002:a05:600c:198b:b0:40c:5ee:2dda with SMTP id t11-20020a05600c198b00b0040c05ee2ddamr1118146wmq.177.1701961430948;
        Thu, 07 Dec 2023 07:03:50 -0800 (PST)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id u13-20020a05600c19cd00b0040b42df75fcsm2187533wmq.39.2023.12.07.07.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 07:03:50 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ved Shanbhogue <ved@rivosinc.com>,
	Matt Evans <mev@rivosinc.com>,
	Dylan Jhong <dylan@andestech.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-mm@kvack.org
Subject: [PATCH RFC/RFT 0/4] Remove preventive sfence.vma
Date: Thu,  7 Dec 2023 16:03:44 +0100
Message-Id: <20231207150348.82096-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
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
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In RISC-V, after a new mapping is established, a sfence.vma needs to be
emitted for different reasons:

- if the uarch caches invalid entries, we need to invalidate it otherwise
  we would trap on this invalid entry,
- if the uarch does not cache invalid entries, a reordered access could fail
  to see the new mapping and then trap (sfence.vma acts as a fence).

We can actually avoid emitting those (mostly) useless and costly sfence.vma
by handling the traps instead:

- for new kernel mappings: only vmalloc mappings need to be taken care of,
  other new mapping are rare and already emit the required sfence.vma if
  needed.
  That must be achieved very early in the exception path as explained in
  patch 1, and this also fixes our fragile way of dealing with vmalloc faults.

- for new user mappings: that can be handled in the page fault path as done
  in patch 3.

Patch 2 is certainly a TEMP patch which allows to detect at runtime if a
uarch caches invalid TLB entries.

Patch 4 is a TEMP patch which allows to expose through debugfs the different
sfence.vma that are emitted, which can be used for benchmarking.

On our uarch that does not cache invalid entries and a 6.5 kernel, the
gains are measurable:

* Kernel boot:                  6%
* ltp - mmapstress01:           8%
* lmbench - lat_pagefault:      20%
* lmbench - lat_mmap:           5%

On uarchs that cache invalid entries, the results are more mitigated and
need to be explored more thoroughly (if anyone is interested!): that can
be explained by the extra page faults, which depending on "how much" the
uarch caches invalid entries, could kill the benefits of removing the
preventive sfence.vma.

Ved Shanbhogue has prepared a new extension to be used by uarchs that do
not cache invalid entries, which will certainly be used instead of patch 2.

Thanks to Ved and Matt Evans for triggering the discussion that led to
this patchset!

That's an RFC, so please don't mind the checkpatch warnings and dirty
comments. It applies on 6.6.

Any feedback, test or relevant benchmark are welcome :)

Alexandre Ghiti (4):
  riscv: Stop emitting preventive sfence.vma for new vmalloc mappings
  riscv: Add a runtime detection of invalid TLB entries caching
  riscv: Stop emitting preventive sfence.vma for new userspace mappings
  TEMP: riscv: Add debugfs interface to retrieve #sfence.vma

 arch/arm64/include/asm/pgtable.h              |   2 +-
 arch/mips/include/asm/pgtable.h               |   6 +-
 arch/powerpc/include/asm/book3s/64/tlbflush.h |   8 +-
 arch/riscv/include/asm/cacheflush.h           |  19 ++-
 arch/riscv/include/asm/pgtable.h              |  45 ++++---
 arch/riscv/include/asm/thread_info.h          |   5 +
 arch/riscv/include/asm/tlbflush.h             |   4 +
 arch/riscv/kernel/asm-offsets.c               |   5 +
 arch/riscv/kernel/entry.S                     |  94 +++++++++++++
 arch/riscv/kernel/sbi.c                       |  12 ++
 arch/riscv/mm/init.c                          | 126 ++++++++++++++++++
 arch/riscv/mm/tlbflush.c                      |  17 +++
 include/linux/pgtable.h                       |   8 +-
 mm/memory.c                                   |  12 +-
 14 files changed, 331 insertions(+), 32 deletions(-)

-- 
2.39.2

