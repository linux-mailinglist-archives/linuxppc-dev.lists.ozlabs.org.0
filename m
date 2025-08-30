Return-Path: <linuxppc-dev+bounces-11520-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 158FCB3C7B4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Aug 2025 05:55:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cDLqf3DP4z3050;
	Sat, 30 Aug 2025 13:54:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::102c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756526078;
	cv=none; b=m3gJJ+zoLHOx/wTspuXNkHyPyS6ZCnYR32oCivoAVanNAnW5R8Gg/R+z2i2VBVduviyeXR0FJjF+weObPgqArmphWgYoC2DreQbT/OiC7mjd+UZov29TY678NN4y/+FYqSQtFEl+OFPwtooa4plTKlO2LQx0Y3iO6xvZjXU8SSujKDo6VftXMKwztP7LJrr7xRk56wqSO9SOBrwHU1BEqUFUwdyaAyNSoala9TlVzsG2eX4boVRmfQ1tOlc54Nxjn3LDNRj0TkQAIWXl2Jkh13XLKGjT84bA4o7E3dyGMXuW4ZNuLhE3YO0VulN+Zclw1/Hoj0ChcXxkaiPlIMbo4A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756526078; c=relaxed/relaxed;
	bh=PHFGo9W7eW3FNHqfM+6lf2O3Swyw6p57AIvNgz1gl98=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eKfQEpv5SBEuTjQH9l8wLOY6zkq536xKwndlyO7JeJigNZSUknLbKy5RxFqcW/FkrNYIzxlmVmgFix90jpgttVcvNlBo4M/wxh8itUBcNMDjpgpwTiCF3bLWFZFtzrDOglTHbyrec5LReG15vYc8aNon/tlxg18qBmIroTrqzvKeiC1Hxz9/j6J3r+BY/o+LjBj+yfc5Ewv5suZ8x+Y0n38V8n+gFd4zj7H+++u51DjbVKtnt06rYPbqbqkgi6+lkmu6tPSwS/tpC5Wasj15lyDpzUYz4oAtm0dBxopXSnHfKvpStUDZWqHrCt+V9W9bIIJlUjM5h92vN89gsvgE3g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Ny+gl45+; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::102c; helo=mail-pj1-x102c.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Ny+gl45+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102c; helo=mail-pj1-x102c.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cDLqd6gD5z305D
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Aug 2025 13:54:37 +1000 (AEST)
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-32326e67c95so3027648a91.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Aug 2025 20:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756526075; x=1757130875; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PHFGo9W7eW3FNHqfM+6lf2O3Swyw6p57AIvNgz1gl98=;
        b=Ny+gl45+YCUyuhORBR+Cp8BWZqLOCYAd0paWIy7NXa8+rIAo7W/297i19UEaSh7R7l
         Aff5ztXull7W0prHtlEABOJ/hgedGwnp4iYoDi6n0CwvIzQaBe5D6iQkQ2Selo6wBlKG
         W5ndx7T8+4SLmr7ZoAqqzlpL2/PYNSa2YO6ku5iHaXBJalVZo+Gywpior2S801nooImn
         VM+qEjLd/xSGmtA8rFoaK2MpTh2R5svn6YzW3z9wNCwT8pUnctGuiTgO78mBIIwyM4w+
         EgV24Xj0PzlkeQkloz3pXCFGNk3mfivykctA1xQRXTe12hOZTiN2Opu+sNOMYgkc5D4/
         Bsfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756526075; x=1757130875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PHFGo9W7eW3FNHqfM+6lf2O3Swyw6p57AIvNgz1gl98=;
        b=ibzkKvnBPxFb9j539ZnNQSIV7sAuPNJNknrbQLBE+OIJWJMmLaRlnJIFJvlWJYucUr
         VbK7c257V64kt6JgNxu9wwIDkQahm7S8WhldVC9fbE2L5i/VE8uoCp1Yc9qoZJ73KCPX
         p/uVc8b2Lp9b3g+8xXj4q3ibVqKLWT4UP4peoj0PArdIB9iQNzT1Rlb8OI17/o4i1yeC
         dkaamiIb8NGSSnRHeuBnMhbOrlVWxIgETQqDSYNG+4h5wjNj9fyyDDLGixq8ZRTkixO4
         /29/S4/QCOI1wLN//8hjtWQOS1m+QcIhAcUvR7Htir8wnt3TG7ClgWb1Tm/7cFngM1VH
         EqEw==
X-Gm-Message-State: AOJu0Yx/K8S1almxZx8v/H3pDbLRLqGDJ2DJGKcB+VQgY6o2MxF92Cal
	dGimj7nBuMT3kFjvLm9AIdRsiyrLVIFLfUTc/IJMJU+xeuVJFR21nfoxlF5JbQ==
X-Gm-Gg: ASbGncvCaH724u1FMTrxy3fXL+/Yt2kSPplhRGMcEth2jorjzAskg7PQYimiA0wTtJO
	eq/G5sRWvw4rtI3YtV4MYlvxdXJOPovtMlNwMItyK7bq6r5yZ2shZaKTwR5Gyd3FulFa5H/QbUv
	oeMpICj+JbPCVOa43aUVFHs43xYRstL+b776L0SvbUpg1cDS+6R7aONCFXWBhHxgv8WWVio4GrL
	mmzZUFao9smsnwnWgA0D9Iu7rO6SLqqae6Ydg7H51YKtvPUiJbSqXYSiGJKF1MTGMM1s8npcWpl
	vgOhiTfER1u85FWr/qwuvY9Ir9Ip/9SoIuNrHLaLg2FX6LtwmcBsZkYWj34nYbeQ1ioyqEFOuL5
	lo4imeLfshib4qjgsi27pBBM7TA==
X-Google-Smtp-Source: AGHT+IHGvPGfY1Eh9xgyGS4B/7DmMYIqJ7fgl+mSwic2lFnNCUiCLH7BqElvIv4cVFuD8lOlXnBNQg==
X-Received: by 2002:a17:90b:4f8c:b0:327:fd72:bd6a with SMTP id 98e67ed59e1d1-328156e2dd2mr1232775a91.29.1756526075521;
        Fri, 29 Aug 2025 20:54:35 -0700 (PDT)
Received: from dw-tp ([171.76.86.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-327da90ee17sm4279879a91.24.2025.08.29.20.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 20:54:34 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Donet Tom <donettom@linux.ibm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [RFC 8/8] powerpc/book3s64/slb: Add slb faults to vmstat
Date: Sat, 30 Aug 2025 09:21:47 +0530
Message-ID: <e05ac86618d8a52feccf5bac99da44b11871382c.1756522067.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1756522067.git.ritesh.list@gmail.com>
References: <cover.1756522067.git.ritesh.list@gmail.com>
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
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

There were good optimization written in past which reduces the number of
slb faults e.g. during context switches [1]. However if one wants to
measure total number of slb faults then there is no easy way of
measuring one e.g. number of slb faults during bootup.

This adds slb faults as part of vmstat counter to easily measure total
number of slb faults for book3s64.

Note: slb fault handling is defined as raw interrupt handler which says:
 * raw interrupt handlers must not enable or disable interrupts, or
 * schedule, tracing and instrumentation (ftrace, lockdep, etc) would
 * not be advisable either, although may be possible in a pinch, the
 * trace will look odd at least.

Hence adding a vmstat counter looks a plausible and safe option, to at-
least measure the number of slb kernel & user faults in the system.

[1]: https://lore.kernel.org/all/20181013131836.26764-4-mpe@ellerman.id.au/


Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Donet Tom <donettom@linux.ibm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org
Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/mm/book3s64/slb.c | 3 +++
 include/linux/vm_event_item.h  | 4 ++++
 mm/vmstat.c                    | 5 +++++
 3 files changed, 12 insertions(+)

diff --git a/arch/powerpc/mm/book3s64/slb.c b/arch/powerpc/mm/book3s64/slb.c
index 297ab0e93c1e..064427af63f7 100644
--- a/arch/powerpc/mm/book3s64/slb.c
+++ b/arch/powerpc/mm/book3s64/slb.c
@@ -22,6 +22,7 @@
 #include <linux/context_tracking.h>
 #include <linux/mm_types.h>
 #include <linux/pgtable.h>
+#include <linux/vmstat.h>

 #include <asm/udbg.h>
 #include <asm/text-patching.h>
@@ -780,6 +781,7 @@ DEFINE_INTERRUPT_HANDLER_RAW(do_slb_fault)
 #ifdef CONFIG_DEBUG_VM
 		local_paca->in_kernel_slb_handler = 0;
 #endif
+		count_vm_event(SLB_KERNEL_FAULTS);
 		return err;
 	} else {
 		struct mm_struct *mm = current->mm;
@@ -792,6 +794,7 @@ DEFINE_INTERRUPT_HANDLER_RAW(do_slb_fault)
 		if (!err)
 			preload_add(current_thread_info(), ea);

+		count_vm_event(SLB_USER_FAULTS);
 		return err;
 	}
 }
diff --git a/include/linux/vm_event_item.h b/include/linux/vm_event_item.h
index 9e15a088ba38..8aa34d0eee3b 100644
--- a/include/linux/vm_event_item.h
+++ b/include/linux/vm_event_item.h
@@ -156,6 +156,10 @@ enum vm_event_item { PGPGIN, PGPGOUT, PSWPIN, PSWPOUT,
 		DIRECT_MAP_LEVEL2_COLLAPSE,
 		DIRECT_MAP_LEVEL3_COLLAPSE,
 #endif
+#ifdef CONFIG_PPC_BOOK3S_64
+		SLB_KERNEL_FAULTS,
+		SLB_USER_FAULTS,
+#endif
 #ifdef CONFIG_PER_VMA_LOCK_STATS
 		VMA_LOCK_SUCCESS,
 		VMA_LOCK_ABORT,
diff --git a/mm/vmstat.c b/mm/vmstat.c
index 71cd1ceba191..8cd17a5fc72b 100644
--- a/mm/vmstat.c
+++ b/mm/vmstat.c
@@ -1464,6 +1464,11 @@ const char * const vmstat_text[] = {
 	[I(DIRECT_MAP_LEVEL2_COLLAPSE)]		= "direct_map_level2_collapses",
 	[I(DIRECT_MAP_LEVEL3_COLLAPSE)]		= "direct_map_level3_collapses",
 #endif
+#ifdef CONFIG_PPC_BOOK3S_64
+	"slb_kernel_faults",
+	"slb_user_faults",
+#endif
+
 #ifdef CONFIG_PER_VMA_LOCK_STATS
 	[I(VMA_LOCK_SUCCESS)]			= "vma_lock_success",
 	[I(VMA_LOCK_ABORT)]			= "vma_lock_abort",
--
2.50.1


