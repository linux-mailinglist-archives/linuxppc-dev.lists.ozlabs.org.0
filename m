Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 653AB1CBC3F
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 May 2020 03:57:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Jr1Y21D2zDr97
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 May 2020 11:57:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=lca.pw
 (client-ip=2607:f8b0:4864:20::741; helo=mail-qk1-x741.google.com;
 envelope-from=cai@lca.pw; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lca.pw header.i=@lca.pw header.a=rsa-sha256
 header.s=google header.b=n4IbKOUq; dkim-atps=neutral
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Jqzh1H8DzDqQD
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 May 2020 11:55:55 +1000 (AEST)
Received: by mail-qk1-x741.google.com with SMTP id t3so3569321qkg.1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 08 May 2020 18:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ta0PteIcwW15qxg0iw1q7p+MN971mzC3jqiLDOQYy+c=;
 b=n4IbKOUqGcnS8/tenHLhOAsDf89sBGM8dSXtmFP+ybHxg4EYnb+m/e6byWrDzDAjld
 e0DpAHZjEuclQ0NVAUepVuU51iWczGQ2FTiBYwFeuVwPEpFdVQheLF9jsIXaEcfb7YyW
 W22/opasUdo6to/eQ/kw7o8AQPT5ffNQ+2eDWUoJsPcZNTaKon180tEZPTylKHOYmeOo
 AhSy9IjtkyGRyAQk0RAz/fLPA883WV7RuZDaPEbnFALTcDkLVCeEoUBQchOmgrhoW9fK
 F1FYOX5fIwuv4pGWuYzvZAOgLMsaHNYAc7ZjphimK+O2CxvNfM6kLgXjTB5YorLMjrhT
 0Jcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ta0PteIcwW15qxg0iw1q7p+MN971mzC3jqiLDOQYy+c=;
 b=c0GhfKKpDqpXHoSG9pmpdtx3MbYiQyRAz/B09NpEstMOh1q8JEvJXKoMoCo4a7GUOO
 I8ycC6wkollVm7OBcKJTlz54UPkRRFXHDiZF4uGNX/oFAKmbek8k9QvgYfZgymWE3D3a
 J3FwSTGyMwmKD1LF7lKbMj65UOeFWDD+vhSc8c113pYvah+te4sTYNE2iBjuUkIWGXyT
 /+FOMgXemFj3B+EgX7p87onh0eQGrSbOAHbC9868GdfpU+9g+1LHGQQYK1kk3Uk0shd3
 Fn3Zs65uu4XpOvCuUwHrYRXIo+5so1WaKuHu7nehJlKD244yBqDrFOPdylZSLbQ5fe9U
 mS2A==
X-Gm-Message-State: AGi0PuYvrPgwBHusP3RbTfkz3YFOA9M6t8kqBCDJ0dhyFSQ83i8FytQZ
 L07OjZFXnFqbgu3V8HtI4Zox8g==
X-Google-Smtp-Source: APiQypKQBHrDo+HGP6aYmcnuQYXBuQav0/Pd15jIutiiHsPkw6w1O5tqiS3p8qDNYv6D4cZw+uNZ8A==
X-Received: by 2002:a37:7904:: with SMTP id u4mr5514676qkc.297.1588989352298; 
 Fri, 08 May 2020 18:55:52 -0700 (PDT)
Received: from ovpn-66-195.rdu2.redhat.com
 (pool-71-184-117-43.bstnma.fios.verizon.net. [71.184.117.43])
 by smtp.gmail.com with ESMTPSA id d26sm2571912qkk.69.2020.05.08.18.55.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 08 May 2020 18:55:51 -0700 (PDT)
From: Qian Cai <cai@lca.pw>
To: mpe@ellerman.id.au
Subject: [PATCH] powerpc/kvm: silence kmemleak false positives
Date: Fri,  8 May 2020 21:55:38 -0400
Message-Id: <20200509015538.3183-1-cai@lca.pw>
X-Mailer: git-send-email 2.21.0 (Apple Git-122.2)
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
Cc: linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org,
 Qian Cai <cai@lca.pw>, catalin.marinas@arm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

kvmppc_pmd_alloc() and kvmppc_pte_alloc() allocate some memory but then
pud_populate() and pmd_populate() will use __pa() to reference the newly
allocated memory. The same is in xive_native_provision_pages().

Since kmemleak is unable to track the physical memory resulting in false
positives, silence those by using kmemleak_ignore().

unreferenced object 0xc000201c382a1000 (size 4096):
  comm "qemu-kvm", pid 124828, jiffies 4295733767 (age 341.250s)
  hex dump (first 32 bytes):
    c0 00 20 09 f4 60 03 87 c0 00 20 10 72 a0 03 87  .. ..`.... .r...
    c0 00 20 0e 13 a0 03 87 c0 00 20 1b dc c0 03 87  .. ....... .....
  backtrace:
    [<000000004cc2790f>] kvmppc_create_pte+0x838/0xd20 [kvm_hv]
    kvmppc_pmd_alloc at arch/powerpc/kvm/book3s_64_mmu_radix.c:366
    (inlined by) kvmppc_create_pte at arch/powerpc/kvm/book3s_64_mmu_radix.c:590
    [<00000000d123c49a>] kvmppc_book3s_instantiate_page+0x2e0/0x8c0 [kvm_hv]
    [<00000000bb549087>] kvmppc_book3s_radix_page_fault+0x1b4/0x2b0 [kvm_hv]
    [<0000000086dddc0e>] kvmppc_book3s_hv_page_fault+0x214/0x12a0 [kvm_hv]
    [<000000005ae9ccc2>] kvmppc_vcpu_run_hv+0xc5c/0x15f0 [kvm_hv]
    [<00000000d22162ff>] kvmppc_vcpu_run+0x34/0x48 [kvm]
    [<00000000d6953bc4>] kvm_arch_vcpu_ioctl_run+0x314/0x420 [kvm]
    [<000000002543dd54>] kvm_vcpu_ioctl+0x33c/0x950 [kvm]
    [<0000000048155cd6>] ksys_ioctl+0xd8/0x130
    [<0000000041ffeaa7>] sys_ioctl+0x28/0x40
    [<000000004afc4310>] system_call_exception+0x114/0x1e0
    [<00000000fb70a873>] system_call_common+0xf0/0x278
unreferenced object 0xc0002001f0c03900 (size 256):
  comm "qemu-kvm", pid 124830, jiffies 4295735235 (age 326.570s)
  hex dump (first 32 bytes):
    c0 00 20 10 fa a0 03 87 c0 00 20 10 fa a1 03 87  .. ....... .....
    c0 00 20 10 fa a2 03 87 c0 00 20 10 fa a3 03 87  .. ....... .....
  backtrace:
    [<0000000023f675b8>] kvmppc_create_pte+0x854/0xd20 [kvm_hv]
    kvmppc_pte_alloc at arch/powerpc/kvm/book3s_64_mmu_radix.c:356
    (inlined by) kvmppc_create_pte at arch/powerpc/kvm/book3s_64_mmu_radix.c:593
    [<00000000d123c49a>] kvmppc_book3s_instantiate_page+0x2e0/0x8c0 [kvm_hv]
    [<00000000bb549087>] kvmppc_book3s_radix_page_fault+0x1b4/0x2b0 [kvm_hv]
    [<0000000086dddc0e>] kvmppc_book3s_hv_page_fault+0x214/0x12a0 [kvm_hv]
    [<000000005ae9ccc2>] kvmppc_vcpu_run_hv+0xc5c/0x15f0 [kvm_hv]
    [<00000000d22162ff>] kvmppc_vcpu_run+0x34/0x48 [kvm]
    [<00000000d6953bc4>] kvm_arch_vcpu_ioctl_run+0x314/0x420 [kvm]
    [<000000002543dd54>] kvm_vcpu_ioctl+0x33c/0x950 [kvm]
    [<0000000048155cd6>] ksys_ioctl+0xd8/0x130
    [<0000000041ffeaa7>] sys_ioctl+0x28/0x40
    [<000000004afc4310>] system_call_exception+0x114/0x1e0
    [<00000000fb70a873>] system_call_common+0xf0/0x278
unreferenced object 0xc000201b53e90000 (size 65536):
  comm "qemu-kvm", pid 124557, jiffies 4295650285 (age 364.370s)
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<00000000acc2fb77>] xive_native_alloc_vp_block+0x168/0x210
    xive_native_provision_pages at arch/powerpc/sysdev/xive/native.c:645
    (inlined by) xive_native_alloc_vp_block at arch/powerpc/sysdev/xive/native.c:674
    [<000000004d5c7964>] kvmppc_xive_compute_vp_id+0x20c/0x3b0 [kvm]
    [<0000000055317cd2>] kvmppc_xive_connect_vcpu+0xa4/0x4a0 [kvm]
    [<0000000093dfc014>] kvm_arch_vcpu_ioctl+0x388/0x508 [kvm]
    [<00000000d25aea0f>] kvm_vcpu_ioctl+0x15c/0x950 [kvm]
    [<0000000048155cd6>] ksys_ioctl+0xd8/0x130
    [<0000000041ffeaa7>] sys_ioctl+0x28/0x40
    [<000000004afc4310>] system_call_exception+0x114/0x1e0
    [<00000000fb70a873>] system_call_common+0xf0/0x278

Signed-off-by: Qian Cai <cai@lca.pw>
---
 arch/powerpc/kvm/book3s_64_mmu_radix.c | 16 ++++++++++++++--
 arch/powerpc/sysdev/xive/native.c      |  4 ++++
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_64_mmu_radix.c b/arch/powerpc/kvm/book3s_64_mmu_radix.c
index aa12cd4078b3..bc6c1aa3d0e9 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_radix.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_radix.c
@@ -353,7 +353,13 @@ static struct kmem_cache *kvm_pmd_cache;
 
 static pte_t *kvmppc_pte_alloc(void)
 {
-	return kmem_cache_alloc(kvm_pte_cache, GFP_KERNEL);
+	pte_t *pte;
+
+	pte = kmem_cache_alloc(kvm_pte_cache, GFP_KERNEL);
+	/* pmd_populate() will only reference _pa(pte). */
+	kmemleak_ignore(pte);
+
+	return pte;
 }
 
 static void kvmppc_pte_free(pte_t *ptep)
@@ -363,7 +369,13 @@ static void kvmppc_pte_free(pte_t *ptep)
 
 static pmd_t *kvmppc_pmd_alloc(void)
 {
-	return kmem_cache_alloc(kvm_pmd_cache, GFP_KERNEL);
+	pmd_t *pmd;
+
+	pmd = kmem_cache_alloc(kvm_pmd_cache, GFP_KERNEL);
+	/* pud_populate() will only reference _pa(pmd). */
+	kmemleak_ignore(pmd);
+
+	return pmd;
 }
 
 static void kvmppc_pmd_free(pmd_t *pmdp)
diff --git a/arch/powerpc/sysdev/xive/native.c b/arch/powerpc/sysdev/xive/native.c
index 5218fdc4b29a..2d19f28967a6 100644
--- a/arch/powerpc/sysdev/xive/native.c
+++ b/arch/powerpc/sysdev/xive/native.c
@@ -18,6 +18,7 @@
 #include <linux/delay.h>
 #include <linux/cpumask.h>
 #include <linux/mm.h>
+#include <linux/kmemleak.h>
 
 #include <asm/machdep.h>
 #include <asm/prom.h>
@@ -647,6 +648,9 @@ static bool xive_native_provision_pages(void)
 			pr_err("Failed to allocate provisioning page\n");
 			return false;
 		}
+		/* Kmemleak is unable to track the physical address. */
+		kmemleak_ignore(p);
+
 		opal_xive_donate_page(chip, __pa(p));
 	}
 	return true;
-- 
2.21.0 (Apple Git-122.2)

