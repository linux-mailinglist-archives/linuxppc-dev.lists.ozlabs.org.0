Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D48C24CCF7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Aug 2020 06:47:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BXpsD3J7tzDr48
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Aug 2020 14:47:12 +1000 (AEST)
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
 header.s=20161025 header.b=c7SEuBm9; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BXppM1sStzDr2F
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Aug 2020 14:44:41 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id i10so434893pgk.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Aug 2020 21:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2FijGblDddjp78CZtsuopymeT4GIAirJaILJzMaKauU=;
 b=c7SEuBm9ZYiwMyDgcCjUP4zkcAqcJWkSnCZkOh9wB/Q1IQYWihz+hZnrfBEOh8YtOo
 7oKYdorv5eBuZ6kfHQNFNprGFy29TgABA5JyE/oEjJ7SqNA9UsflqSpOSQH6A6F0HgO4
 n1Ms4wHgOaegdSr9pxT+782mC2bPskftyVMT9UuR05WNlfA31jSh2BBdEfrIikfeKbGT
 7XnmmP3RgtcKmGKSgn73d5a2tMgGTfWoCkCTZCWirqaujLImDZBUJHgejXJwHDcuqYsO
 +931rfrU7AbK0Ggp/BlSjg9QxvFgq51FZw7CPgSBFVbsPK3EMHLVfEyg7WldxgZDwgzs
 czVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2FijGblDddjp78CZtsuopymeT4GIAirJaILJzMaKauU=;
 b=jkZVtEQ+Upqf0T+W1cAG4o792UbU2Tv9QqX4u3+U1YLDrczBYF1nuC44Tmcb2QBpv6
 uTsPjrQgVJkjphzmwsQGehthTia+HrsKdbHzVKpGqBbt/px5gF4kGiomwAmOTLb2oix6
 rUi3IiFRznjeXGoqB71FAIkyPsoP63rtsL94+nAVB9VtuBifhA81O1+Tjyd++dpSZa3f
 to1AeSreMKXsbcBSTg8Vqh6zLMkQTRBjhHt4bYnaefvLCUD2ZvY451xjD2R9aZZ3HUhC
 eNOx+0pen9Xw+QfDQLCgvd4GUksds/TA42vYE+oy9wkI0Kv6fETLbqt7lqXUuTUZPFuP
 k9Mw==
X-Gm-Message-State: AOAM530fXrkEDUG8u1mZLugDNTEd+UIu0+aP3+NFLo2S6UiDIEACRdhK
 rpdIDj6K9n0JZA1BMDNUhE4=
X-Google-Smtp-Source: ABdhPJw13X7rw0q4xbArvVS+WyTpffCFf61Owreem8v6Q4CEO1zlzy3RKePEZ/FsBQwm1kKEDBNCCQ==
X-Received: by 2002:a63:cf03:: with SMTP id j3mr1043772pgg.198.1597985077991; 
 Thu, 20 Aug 2020 21:44:37 -0700 (PDT)
Received: from bobo.ibm.com (61-68-212-105.tpgi.com.au. [61.68.212.105])
 by smtp.gmail.com with ESMTPSA id l9sm683374pgg.29.2020.08.20.21.44.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2020 21:44:37 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v5 0/8] huge vmalloc mappings
Date: Fri, 21 Aug 2020 14:44:19 +1000
Message-Id: <20200821044427.736424-1-npiggin@gmail.com>
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
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, Zefan Li <lizefan@huawei.com>,
 Jonathan Cameron <Jonathan.Cameron@Huawei.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

I made this powerpc-only for the time being. It shouldn't be too hard to
add support for other archs that define HUGE_VMAP. I have booted x86
with it enabled, just may not have audited everything.

Hi Andrew, would you care to put this in your tree?

Thanks,
Nick

Since v4:
- Fixed an off-by-page-order bug in v4
- Several minor cleanups.
- Added page order to /proc/vmallocinfo
- Added hugepage to alloc_large_system_hage output.
- Made an architecture config option, powerpc only for now.

Since v3:
- Fixed an off-by-one bug in a loop
- Fix !CONFIG_HAVE_ARCH_HUGE_VMAP build fail
- Hopefully this time fix the arm64 vmap stack bug, thanks Jonathan
  Cameron for debugging the cause of this (hopefully).

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
 arch/Kconfig                                  |   4 +
 arch/arm64/mm/mmu.c                           |  12 +-
 arch/powerpc/Kconfig                          |   1 +
 arch/powerpc/mm/book3s64/radix_pgtable.c      |  10 +-
 arch/x86/mm/ioremap.c                         |  12 +-
 include/linux/io.h                            |   9 -
 include/linux/vmalloc.h                       |  13 +
 init/main.c                                   |   1 -
 mm/ioremap.c                                  | 231 +--------
 mm/memory.c                                   |  60 ++-
 mm/page_alloc.c                               |   4 +-
 mm/vmalloc.c                                  | 456 +++++++++++++++---
 13 files changed, 476 insertions(+), 339 deletions(-)

-- 
2.23.0

