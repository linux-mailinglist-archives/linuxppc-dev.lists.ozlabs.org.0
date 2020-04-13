Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 734B11A6699
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Apr 2020 14:59:32 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4917xD1shqzDqMh
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Apr 2020 22:59:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1041;
 helo=mail-pj1-x1041.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=D3TacET4; dkim-atps=neutral
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4917qL6LH3zDqDT
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Apr 2020 22:54:20 +1000 (AEST)
Received: by mail-pj1-x1041.google.com with SMTP id np9so3790421pjb.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Apr 2020 05:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eLerIzKtSl3zsn2Oymq5fsiJKLq+NQe813C4SL5fbLw=;
 b=D3TacET4LkxgSZwrtk0YaO57GIAKjGq2FPxhPIibWo0sfykUkoRPbtT1f79Yc1c0me
 Jg6ubg805mJwW/UIK0xFjVnvaAhSuErW6yXPEECe9C+aijrMJqQi12GvPnicnJXPQkAD
 7s5ZhWNwDiR14hLg1/l5CXCsGNCCoW09+cbd+G7vLYprIu8mAYrfJt5Z7Ej+3+oEbWCm
 negw6h/cLHxbJGqVoj0xGCTjzWVbxBdALQozOIeVH71ZFyuZ+tbY4voNU7sWACEIebF3
 JVVOML3yuc3rFmdAauFn6vfYwVjRjOsHKMlXRUgQBOAmXItxjBRIE1V3smOcR1mge9fP
 +3Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eLerIzKtSl3zsn2Oymq5fsiJKLq+NQe813C4SL5fbLw=;
 b=AqwWhLO8SAEm/58f5CyKrxcF8jlI37U44IEtA+2zMe0b0foB5IQVckurgVmBlozngQ
 lcGhSamMtPrMDjxqfn+NI8kL33P/uo2ndsOzKu1Ll/eAT7xJ+O2xnJjNh8lUG4fdxVK2
 OH4Mu1WOk2Ti3EXuXcPHFNFpRsQItdKseDm7TMiGdXWaoj8wZ7YhOyvKcp/ygSPGxRlo
 C6FeXacpfrTui2saN6/hczXvKq8Z76O8i/FGOc4Vr/R6wtpQaX+2pniF047wFNj27Uy7
 L1wzmOTT134rZpzTg1Qphou0WuKEb3sdL7de6YZEKeKGnoZQCihcxL5e/14gXB+Dsud3
 klEg==
X-Gm-Message-State: AGi0PuamBFFpys+iW5A4HTDZyj8CKOxGGLACQCFlHvRTtm0Wmas09XPu
 K84MFt/1jE6yxe0hyQ7vAOY=
X-Google-Smtp-Source: APiQypIuKwevaVe7P950qwu0WviRlHpRByIKxXMptZO8oQOn38nAcJkm8e5eaH+Vq6duTZluVkSCtw==
X-Received: by 2002:a17:902:464:: with SMTP id
 91mr17811244ple.261.1586782456770; 
 Mon, 13 Apr 2020 05:54:16 -0700 (PDT)
Received: from bobo.ibm.com (60-241-117-97.tpgi.com.au. [60.241.117.97])
 by smtp.gmail.com with ESMTPSA id j24sm9235610pji.20.2020.04.13.05.54.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Apr 2020 05:54:15 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linux-mm@kvack.org
Subject: [PATCH v2 0/4] huge vmalloc mappings
Date: Mon, 13 Apr 2020 22:52:59 +1000
Message-Id: <20200413125303.423864-1-npiggin@gmail.com>
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
Cc: linux-arch@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 x86@kernel.org, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We can get a significant win with larger mappings for some of the big
global hashes.

Since RFC, relevant architectures have added p?d_leaf accessors so no
real arch changes required, and I changed it not to allocate huge
mappings for modules and a bunch of other fixes.

Nicholas Piggin (4):
  mm/vmalloc: fix vmalloc_to_page for huge vmap mappings
  mm: Move ioremap page table mapping function to mm/
  mm: HUGE_VMAP arch query functions cleanup
  mm/vmalloc: Hugepage vmalloc mappings

 arch/arm64/mm/mmu.c                      |   8 +-
 arch/powerpc/mm/book3s64/radix_pgtable.c |   6 +-
 arch/x86/mm/ioremap.c                    |   6 +-
 include/linux/io.h                       |   3 -
 include/linux/vmalloc.h                  |  15 +
 lib/ioremap.c                            | 203 +----------
 mm/vmalloc.c                             | 413 +++++++++++++++++++----
 7 files changed, 380 insertions(+), 274 deletions(-)

-- 
2.23.0

