Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3616D6ACD8B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Mar 2023 20:06:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVp2l4KfGz3fR2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 06:06:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Letr5LRp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--dmatlack.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3rjggzagkdf8aj7qi79hdlldib.9ljifkrumm9-absifpqp.lwi78p.lod@flex--dmatlack.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Letr5LRp;
	dkim-atps=neutral
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PVnxr5q3Xz2yRV
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Mar 2023 06:02:08 +1100 (AEDT)
Received: by mail-yb1-xb49.google.com with SMTP id m6-20020a056902118600b00aeb1e3dbd1bso11244157ybu.9
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Mar 2023 11:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1678129326;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Hy1Buh0DyhAQ1dsWc1I6Y0GrKiZLM4ytS70wq/2qiU0=;
        b=Letr5LRp7bS0YmkVINmE83RF8//+0ihwPomgSJZC4+dkD9sFUFEL35AQoxcfPpIbXW
         Y1mVJA34aQ9Fn9+jBPkAovdeUPbAGsum3MVzw575zB3u4rfwK4ZVePdw3VSiVo2j9C9v
         3XnoKl7fEhlmtkQ5DdG9/UhFj+tyVjNmSih/iYAuSQ6xwOtYmbjOYgHRAkzFRXa92dze
         ZQvrRjBbIKvFglVzBDH4EAw30eROHuzuIjsYKsJXNnWsAQHIog+eYwButoAe0B9OxSD2
         pOTz7b2aOyFjFOUOaTEw5+7DJRfnksutj0fbq9nxtjgFb7SGFFpwHZTOmxj6KpssL5px
         NozA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678129326;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hy1Buh0DyhAQ1dsWc1I6Y0GrKiZLM4ytS70wq/2qiU0=;
        b=e2+xTK1s9VOH6WsQpOefhWsNqGcxPjR7IIqUJeN+0OXnX51XpVBVYnKuv1dwLWuZQH
         B3c1iT9nvtZFo00pIMe8t1P/v6z1uP/0EPeZl5ch3IHDFPIeMkXv5iC+3UlCJVPEBRTu
         qSQ8RKO+Q3hvnm4IGOYSgZcEtsYu+tNsJ+w8lloXgX+RUDeMFZKld2dEWWB5XgUJm2ES
         EH11uwwZ2lrmiHimq9ZQr+iv/BSZ15QdA3KWRunSIJQTojmKVCC+/OrtkuSWTkq3mans
         BQ2SS9VryN575RhDzjIPsC/nruubfk60V/4d1xDID0VFp9r1pGSlj3CDvKtOsyVEdw8Y
         dUSg==
X-Gm-Message-State: AO0yUKVdorAPI0RRQGnqXbQpEs/ug5WGWCREubrCcUyWRE+UYSPStnbm
	xaSFoby1fOxXaqFlmxKjA/WuIxxaT9oxtA==
X-Google-Smtp-Source: AK7set9e2oV5ajrE5TnGPzkyECRcuaio2KGOJRsM0L6WhO9k90cawVld9W/AAFXa4Ih5X3b9O+P88E69HqyVhg==
X-Received: from dmatlack-n2d-128.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1309])
 (user=dmatlack job=sendgmr) by 2002:a81:b667:0:b0:534:d71f:14e6 with SMTP id
 h39-20020a81b667000000b00534d71f14e6mr7365447ywk.9.1678129326079; Mon, 06 Mar
 2023 11:02:06 -0800 (PST)
Date: Mon,  6 Mar 2023 11:01:56 -0800
In-Reply-To: <20230306190156.434452-1-dmatlack@google.com>
Mime-Version: 1.0
References: <20230306190156.434452-1-dmatlack@google.com>
X-Mailer: git-send-email 2.40.0.rc0.216.gc4246ad0f0-goog
Message-ID: <20230306190156.434452-5-dmatlack@google.com>
Subject: [PATCH v2 4/4] KVM: x86: Drop union for pages_{4k,2m,1g} stats
From: David Matlack <dmatlack@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-riscv@lists.infradead.org, Claudio Imbrenda <imbrenda@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Zenghui Yu <yuzenghui@huawei.com>, Palmer Dabbelt <palmer@dabbelt.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Suzuki K Poulose <suzuki.poulose@arm.com>, Nicholas Piggin <npiggin@gmail.com>, Sathvika Vasireddy <sv@linux.ibm.com>, Atish Patra <atishp@atishpatra.org>, David Matlack <dmatlack@google.com>, linux-arm-kernel@lists.infradead.org, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Sean Christopherson <seanjc@google.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, J
 ames Morse <james.morse@arm.com>, kvm-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Drop the union for the pages_{4k,2m,1g} stats. The union is no longer
necessary now that KVM supports choosing a custom name for stats.

Eliminating the union also would allow future commits to more easily
move pages[] into common code, e.g. if KVM ever gains support for a
common page table code.

An alternative would be to drop pages[] and have kvm_update_page_stats()
update pages_{4k,2m,1g} directly. But that's not a good direction to go
in since other architectures use other page sizes.

No functional change intended.

Link: https://lore.kernel.org/kvm/20221208193857.4090582-1-dmatlack@google.com/
Signed-off-by: David Matlack <dmatlack@google.com>
---
 arch/x86/include/asm/kvm_host.h | 9 +--------
 arch/x86/kvm/x86.c              | 6 +++---
 2 files changed, 4 insertions(+), 11 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 808c292ad3f4..a59e41355ef4 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1473,14 +1473,7 @@ struct kvm_vm_stat {
 	u64 mmu_recycled;
 	u64 mmu_cache_miss;
 	u64 mmu_unsync;
-	union {
-		struct {
-			atomic64_t pages_4k;
-			atomic64_t pages_2m;
-			atomic64_t pages_1g;
-		};
-		atomic64_t pages[KVM_NR_PAGE_SIZES];
-	};
+	atomic64_t pages[KVM_NR_PAGE_SIZES];
 	u64 nx_lpage_splits;
 	u64 max_mmu_page_hash_collisions;
 	u64 max_mmu_rmap_size;
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 072f5ba83170..101ad6b7e7b6 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -240,9 +240,9 @@ const struct _kvm_stats_desc kvm_vm_stats_desc[] = {
 	KVM_STAT(VM, CUMULATIVE, NONE, mmu_recycled),
 	KVM_STAT(VM, CUMULATIVE, NONE, mmu_cache_miss),
 	KVM_STAT(VM, INSTANT, NONE, mmu_unsync),
-	KVM_STAT(VM, INSTANT, NONE, pages_4k),
-	KVM_STAT(VM, INSTANT, NONE, pages_2m),
-	KVM_STAT(VM, INSTANT, NONE, pages_1g),
+	__KVM_STAT(VM, INSTANT, NONE, pages[PG_LEVEL_4K - 1], "pages_4k"),
+	__KVM_STAT(VM, INSTANT, NONE, pages[PG_LEVEL_2M - 1], "pages_2m"),
+	__KVM_STAT(VM, INSTANT, NONE, pages[PG_LEVEL_1G - 1], "pages_1g"),
 	KVM_STAT(VM, INSTANT, NONE, nx_lpage_splits),
 	KVM_STAT(VM, PEAK, NONE, max_mmu_rmap_size),
 	KVM_STAT(VM, PEAK, NONE, max_mmu_page_hash_collisions)
-- 
2.40.0.rc0.216.gc4246ad0f0-goog

