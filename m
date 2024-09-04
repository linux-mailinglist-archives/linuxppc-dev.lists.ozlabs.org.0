Return-Path: <linuxppc-dev+bounces-1027-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF5596CBFA
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2024 03:02:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wzh0b2vNSz2xks;
	Thu,  5 Sep 2024 11:02:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::b4a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725492830;
	cv=none; b=YaW2R5DsA327WGAdeWUn1vmG71BXaOi0v1zgoAQkLCG+D7DRd+m63MQaKzd8Awjp2ctZcjLzHJ+sV0FnAC3VAIa+y55QJj01X23vMxtxNv2AExSoJss7WigkNb7az0rOVWF2qKq1exjmNRodeNGF0Xt4D1AU+VELcmHMsTgoXQXFFhodPfBpvtJjLPjQTq9sv7/kiNHvyhh03sxXxIv0ywZL2mOghOTbLtNo4nJ6f+VVIOAPYFWna9L6u9reZS/qYpc4iZW3Tbpa5P70fRHfclBIQHjhtTvkbAFq14henjkQ2NAvFozV2PUoutonnCusKDh/V806zZuQEbWOPxSX+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725492830; c=relaxed/relaxed;
	bh=uykNh/T0V9CAowhkC/wpCZl/aNMVHh9r5kx7pi77vV0=;
	h=DKIM-Signature:Date:Mime-Version:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=m2cdbkhU+rGBMPdBsYrUU1SadOLUog7Udoimw4SJYzFc5JbWlvJRKFRTxReP/+dztAULONJS3oLnbCsnJFI4Avpty6tuNhzO/GFVx8f3P9vEGAjzMHNYzIyEbFlIFtWvfCcsLJVq9zp6acQQZdP+Ucz2SQSae3j6x847PCBdIsCfqraBbWuq6GwhgzBlp7KJq/686Xxb6300BV+EaUrRmlH1Hwwk/6O6lPD4Ws+8b2n2zE/+ewURx9X8RN44Xw4Y1RxlF+hkJJ2FbTFDCNpE3SeA6M4fehH0dMrE0toK2pQPpswTFD/PGJPapFxn+CTzA/ijM2QwIwX4xk0rNiYCgQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=i+BGmmog; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3we7yzgokdnyqgkjq29e658gg8d6.4gedafmphh4-56ndaklk.grd23k.gj8@flex--yosryahmed.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--yosryahmed.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=i+BGmmog;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--yosryahmed.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3we7yzgokdnyqgkjq29e658gg8d6.4gedafmphh4-56ndaklk.grd23k.gj8@flex--yosryahmed.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wzf2P5v7Bz2xb3
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Sep 2024 09:33:48 +1000 (AEST)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-e1ce191f74fso432100276.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Sep 2024 16:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725492826; x=1726097626; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uykNh/T0V9CAowhkC/wpCZl/aNMVHh9r5kx7pi77vV0=;
        b=i+BGmmoga17Z6dz1rn9yNSMHsLhK1xw+TSjXDGz5IklmEpV1ApogXZT6pQJ3BCHz0m
         3mRch248TpN1oObCKa9ZdQPv+UtEIgoP2VyIEiGuPUdC7KSLhzcj0VjEeK7roAEbpP+g
         d3uk8yrfVGzllLlaY44JPL6gEIXEm82LA/ChxKpEHwU2MmV/hQXyidZiSgQEW+6TDi1O
         fLQ4PcEAx4R3LL/ygyHidFzSNmeqdsz+D5Uklw0EfYhXigoXfKRccnQkrcKfWbfdU7xl
         bOc2jkxLuW10vFIb8Q5xrnIi4IaH3UBZw01eVbXabn5scQDoc3VNjH9deo3C6qpusBuS
         OdjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725492826; x=1726097626;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uykNh/T0V9CAowhkC/wpCZl/aNMVHh9r5kx7pi77vV0=;
        b=cq4PU+8OO9ohnl/bQh/s9FZQ0hkf4plQkIY9OD10TqIuWdIIAzy6JNlutTsjSNLgIJ
         wmKQI0zcc3iqd+mMSU/FEVK2siKNscPUaFvgMPARpjoEytpTJcJOaeAtipErda25+4Kk
         LxNjZhfhMzpX5qTaRTszTSFy9vyC8V5TEgterxuQZTQe35GmhDt+SgxbIzLCoqDbss+p
         yns2LGqfjG0yRCZ04RLwpvotl+256H9xYNXH+g2f1z9HghDRTBSLmYU0kyw1iwtZYYzd
         rqH2Ic994cIfNUNEo93MFw0rEpNvCxnc5EWjyts6NWpyo33Cq+I5z47I16ytWJUe/Jrx
         OaPw==
X-Forwarded-Encrypted: i=1; AJvYcCX8neI+yHfLe6pn1uTkPSZeQmp/fISoDPcT7Rs7/BQIDVyOBPu0Vxma/atVJNs2F7b8e1jBlyLBXhyoFro=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzIZTb28cmmEtyAHEkhvipecUGEfoU9Vqb2LX2BQpfNPVWFqwNq
	CEN5ULM5i4h0NZvwtXIJvpDMtPvM4foHlRHT4RXWMB4QFmOUfG1FtY4mj8sPrfMdo0b+OcHqo7O
	8X8u4kBI/tciSIIM9Yg==
X-Google-Smtp-Source: AGHT+IHlWubTx6E8VrUfQXTNNaZkLgFaN+lTCKP4pMLyXKpV+FgOVAlLsacWjKzs0BxCPS5/R97jnhWicwTPqmYJ
X-Received: from yosry.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:29b4])
 (user=yosryahmed job=sendgmr) by 2002:a25:8592:0:b0:e0e:c9bc:3206 with SMTP
 id 3f1490d57ef6-e1d0e78ad12mr5832276.5.1725492825962; Wed, 04 Sep 2024
 16:33:45 -0700 (PDT)
Date: Wed,  4 Sep 2024 23:33:43 +0000
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
Message-ID: <20240904233343.933462-1-yosryahmed@google.com>
Subject: [PATCH v2] mm: z3fold: deprecate CONFIG_Z3FOLD
From: Yosry Ahmed <yosryahmed@google.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Vitaly Wool <vitaly.wool@konsulko.com>, Miaohe Lin <linmiaohe@huawei.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Nhat Pham <nphamcs@gmail.com>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Christoph Hellwig <hch@infradead.org>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Chris Down <chris@chrisdown.name>, 
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Yosry Ahmed <yosryahmed@google.com>
Content-Type: text/plain; charset="UTF-8"

The z3fold compressed pages allocator is rarely used, most users use
zsmalloc. The only disadvantage of zsmalloc in comparison is the
dependency on MMU, and zbud is a more common option for !MMU as it was
the default zswap allocator for a long time.

Historically, zsmalloc had worse latency than zbud and z3fold but
offered better memory savings. This is no longer the case as shown by
a simple recent analysis [1]. That analysis showed that z3fold does not
have any advantage over zsmalloc or zbud considering both performance
and memory usage. In a kernel build test on tmpfs in a limited cgroup,
z3fold took 3% more time and used 1.8% more memory. The latency of
zswap_load() was 7% higher, and that of zswap_store() was 10% higher.
Zsmalloc is better in all metrics.

Moreover, z3fold apparently has latent bugs, which was made noticeable
by a recent soft lockup bug report with z3fold [2]. Switching to
zsmalloc not only fixed the problem, but also reduced the swap usage
from 6~8G to 1~2G. Other users have also reported being bitten by
mistakenly enabling z3fold.

Other than hurting users, z3fold is repeatedly causing wasted
engineering effort. Apart from investigating the above bug, it came up
in multiple development discussions (e.g. [3]) as something we need to
handle, when there aren't any legit users (at least not intentionally).

The natural course of action is to deprecate z3fold, and remove in a few
cycles if no objections are raised from active users. Next on the list
should be zbud, as it offers marginal latency gains at the cost of huge
memory waste when compared to zsmalloc. That one will need to wait until
zsmalloc does not depend on MMU.

Rename the user-visible config option from CONFIG_Z3FOLD to
CONFIG_Z3FOLD_DEPRECATED so that users with CONFIG_Z3FOLD=y get a new
prompt with explanation during make oldconfig. Also, remove
CONFIG_Z3FOLD=y from defconfigs.

[1]https://lore.kernel.org/lkml/CAJD7tkbRF6od-2x_L8-A1QL3=2Ww13sCj4S3i4bNndqF+3+_Vg@mail.gmail.com/
[2]https://lore.kernel.org/lkml/EF0ABD3E-A239-4111-A8AB-5C442E759CF3@gmail.com/
[3]https://lore.kernel.org/lkml/CAJD7tkbnmeVugfunffSovJf9FAgy9rhBVt_tx=nxUveLUfqVsA@mail.gmail.com/

Acked-by: Chris Down <chris@chrisdown.name>
Acked-by: Nhat Pham <nphamcs@gmail.com>
Signed-off-by: Yosry Ahmed <yosryahmed@google.com>
---

I think it should actually be fine to remove z3fold without deprecating
it first, but I am doing the due diligence.

v1: https://lore.kernel.org/linux-mm/20240112193103.3798287-1-yosryahmed@google.com/
v1 -> v2:
- Make CONFIG_Z3FOLD_DEPRECATED a tristate option to match
  CONFIG_Z3FOLD.
- Update commit subject and log.

---
 arch/loongarch/configs/loongson3_defconfig |  1 -
 arch/powerpc/configs/ppc64_defconfig       |  1 -
 mm/Kconfig                                 | 14 ++++++++++++--
 3 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/arch/loongarch/configs/loongson3_defconfig b/arch/loongarch/configs/loongson3_defconfig
index b4252c357c8e2..75b366407a60a 100644
--- a/arch/loongarch/configs/loongson3_defconfig
+++ b/arch/loongarch/configs/loongson3_defconfig
@@ -96,7 +96,6 @@ CONFIG_ZPOOL=y
 CONFIG_ZSWAP=y
 CONFIG_ZSWAP_COMPRESSOR_DEFAULT_ZSTD=y
 CONFIG_ZBUD=y
-CONFIG_Z3FOLD=y
 CONFIG_ZSMALLOC=m
 # CONFIG_COMPAT_BRK is not set
 CONFIG_MEMORY_HOTPLUG=y
diff --git a/arch/powerpc/configs/ppc64_defconfig b/arch/powerpc/configs/ppc64_defconfig
index 544a65fda77bc..d39284489aa26 100644
--- a/arch/powerpc/configs/ppc64_defconfig
+++ b/arch/powerpc/configs/ppc64_defconfig
@@ -81,7 +81,6 @@ CONFIG_MODULE_SIG_SHA512=y
 CONFIG_PARTITION_ADVANCED=y
 CONFIG_BINFMT_MISC=m
 CONFIG_ZSWAP=y
-CONFIG_Z3FOLD=y
 CONFIG_ZSMALLOC=y
 # CONFIG_SLAB_MERGE_DEFAULT is not set
 CONFIG_SLAB_FREELIST_RANDOM=y
diff --git a/mm/Kconfig b/mm/Kconfig
index b23913d4e47e2..536679d726417 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -177,15 +177,25 @@ config ZBUD
 	  deterministic reclaim properties that make it preferable to a higher
 	  density approach when reclaim will be used.
 
-config Z3FOLD
-	tristate "3:1 compression allocator (z3fold)"
+config Z3FOLD_DEPRECATED
+	tristate "3:1 compression allocator (z3fold) (DEPRECATED)"
 	depends on ZSWAP
 	help
+	  Deprecated and scheduled for removal in a few cycles. If you have
+	  a good reason for using Z3FOLD over ZSMALLOC, please contact
+	  linux-mm@kvack.org and the zswap maintainers.
+
 	  A special purpose allocator for storing compressed pages.
 	  It is designed to store up to three compressed pages per physical
 	  page. It is a ZBUD derivative so the simplicity and determinism are
 	  still there.
 
+config Z3FOLD
+	tristate
+	default y if Z3FOLD_DEPRECATED=y
+	default m if Z3FOLD_DEPRECATED=m
+	depends on Z3FOLD_DEPRECATED
+
 config ZSMALLOC
 	tristate
 	prompt "N:1 compression allocator (zsmalloc)" if ZSWAP
-- 
2.46.0.469.g59c65b2a67-goog


