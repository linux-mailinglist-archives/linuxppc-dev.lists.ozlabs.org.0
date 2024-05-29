Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id 2EDBB8D3E25
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 May 2024 20:11:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=l/E19cZS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VqHPP31wQz7B0s
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 May 2024 04:06:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=l/E19cZS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--jthoughton.bounces.google.com (client-ip=2607:f8b0:4864:20::a49; helo=mail-vk1-xa49.google.com; envelope-from=3xm5xzgokdne6g4bh34gba3bb381.zb985ahkccz-01i85fgf.bm8xyf.be3@flex--jthoughton.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-vk1-xa49.google.com (mail-vk1-xa49.google.com [IPv6:2607:f8b0:4864:20::a49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VqHNf1JP0z78rH
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 May 2024 04:05:21 +1000 (AEST)
Received: by mail-vk1-xa49.google.com with SMTP id 71dfb90a1353d-4e4f02f0c5aso17768e0c.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 May 2024 11:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717005918; x=1717610718; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nPLVZGS8AMw+CagEZYqGOZQVma0bD0XI55fQjmFacis=;
        b=l/E19cZS+aTqVbFBUCOB9y43MwjjW4ifbz/dfMFpiWykR9MaSTn/ECjAgRjiUhrZL4
         h3reGuOek6r2QcauwrAxtVMLN2DJmfXd9c7oU9eFgQ2r1AjPkBRKp8+FDzjtiOx11/bU
         0Bl/4Tpf7lKHnzv6HK+4JRd+8ZP3dIHvp/9KVCuGgXqm+NOGABsqW1rtYaTguuNB1eXi
         cgfZ3Tgk/ytnqf19JQcejgKqKd6B6ZNQ5s0y/6hf6G9n7ptJ3L+SNCSPsDYiVPFZPwF0
         TX3rT6JX4W5Xd0P7TNK7b40FtxqzJlBK4SNDhrrT+dK6DjDNAfibUl5E0ktg2lff8NG6
         t9pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717005918; x=1717610718;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nPLVZGS8AMw+CagEZYqGOZQVma0bD0XI55fQjmFacis=;
        b=GLs3s9mznexRl7+2In6DdUdLt3Xa+OIEp02NWIQeprQ5XSi7qTEPoiO7qNbal8P4R7
         xHLpANsdiz7lachJX+/i3p6tyihDyUlm7MLnyu9p+1cxmTBhSNxQQkzOnKouK9YMmGdv
         8nfWwbMw0+ZVp+Dcvs5aIa1wUTp5SpFKTukbQZHUhQM/hFkfxO5AyycurG2MEu683rnl
         Up9I7+fi7l6MbgI65DG2Dh+jFTcE48eU6xMDCvWCd+vw9EoVs8wqkoDfEl57McPCZNKG
         oZ/Knk81mIwM7YOYAEguzXz8YugdDLAwnqGgFMP7aqlFqL8fnpgzLVEKbVGxNjzu9yW7
         zTag==
X-Forwarded-Encrypted: i=1; AJvYcCWFxrd2NIxpgG+H3A21qiNc2A/4Ktc9fEf8uq0GiGAU5BExqg+7H/lIsT8mzl7Y8rP5kPEL+HCeXYyzkK2Gyufw6non0n7bMFM3ALFVQA==
X-Gm-Message-State: AOJu0YwRIjYS18244QgCrH4TfXN2CCRr9pQM1E4m9tkhZqgUZK9bY1OV
	TKjT6XjDwiVURhz13kB8KojFh8vBvUQVSnsxCc8gjLErxjOE5QOwFBrOZJELbIFao/DD0nILbvh
	vIzp0Djlw7wVNEMl6cg==
X-Google-Smtp-Source: AGHT+IHYErK4IEAw4AodIy6/uS9D/1KylfkBeNLUgQvcCMlB4bZF6bJgSfUsGpPUaVK45i5PNzhTyn3VxbK8rZqg
X-Received: from jthoughton.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:2a4f])
 (user=jthoughton job=sendgmr) by 2002:a05:6122:2006:b0:4d8:797b:94e0 with
 SMTP id 71dfb90a1353d-4e4f0112182mr502860e0c.0.1717005918294; Wed, 29 May
 2024 11:05:18 -0700 (PDT)
Date: Wed, 29 May 2024 18:05:04 +0000
In-Reply-To: <20240529180510.2295118-1-jthoughton@google.com>
Mime-Version: 1.0
References: <20240529180510.2295118-1-jthoughton@google.com>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
Message-ID: <20240529180510.2295118-2-jthoughton@google.com>
Subject: [PATCH v4 1/7] mm/Kconfig: Add LRU_GEN_WALKS_SECONDARY_MMU
From: James Houghton <jthoughton@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, Paolo Bonzini <pbonzini@redhat.com>
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
Cc: James Houghton <jthoughton@google.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org, Raghavendra Rao Ananta <rananta@google.com>, linux-riscv@lists.infradead.org, Shuah Khan <shuah@kernel.org>, Yu Zhao <yuzhao@google.com>, Jonathan Corbet <corbet@lwn.net>, Anup Patel <anup@brainfault.org>, Huacai Chen <chenhuacai@kernel.org>, David Rientjes <rientjes@google.com>, Zenghui Yu <yuzenghui@huawei.com>, Axel Rasmussen <axelrasmussen@google.com>, linux-mips@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Ryan Roberts <ryan.roberts@arm.com>, Will Deacon <will@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, Shaoqin Huang <shahuang@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, Bibo Mao <maobibo@loongson.cn>, loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, David Matlack <dmatlack@google.
 com>, Palmer Dabbelt <palmer@dabbelt.com>, linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, Sean Christopherson <seanjc@google.com>, Ankit Agrawal <ankita@nvidia.com>, Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, kvm-riscv@lists.infradead.org, Marc Zyngier <maz@kernel.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add this option so that one building the kernel can choose whether or
not they want to support walking the secondary MMU.

We want users to be able to blindly enable all lru_gen features to have
the best possible performance most of the time. Walking the secondary
MMU is mainly useful for be able to do proactive reclaim, and it is
possible that doing this can harm VM performance.

This option should be enabled by users who run VMs and also care to do
proactive aging/reclaim with MGLRU.

With this config option enabled, a user can still disable the
new functionality at runtime through sysfs.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 mm/Kconfig | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/mm/Kconfig b/mm/Kconfig
index b4cb45255a54..3ac4b1dbf745 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -1222,6 +1222,14 @@ config LRU_GEN_STATS
 
 	  This option has a per-memcg and per-node memory overhead.
 
+config LRU_GEN_WALKS_SECONDARY_MMU
+	bool "Walk secondary MMUs when aging"
+	depends on LRU_GEN && LRU_GEN_WALKS_MMU
+	help
+	  This option allows multi-gen LRU to walk secondary MMU page tables
+	  when aging. This allows for proactive reclaim, but this can reduce
+	  overall performance (e.g. for a KVM VM).
+
 config LRU_GEN_WALKS_MMU
 	def_bool y
 	depends on LRU_GEN && ARCH_HAS_HW_PTE_YOUNG
-- 
2.45.1.288.g0e0cd299f1-goog

