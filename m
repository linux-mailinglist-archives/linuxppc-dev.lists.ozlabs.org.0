Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D04256ACD78
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Mar 2023 20:03:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVnzk5DlYz3chn
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 06:03:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=A42BX/LP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--dmatlack.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3qzggzagkdfw7g4nf46eaiiaf8.6igfchorjj6-78pfcmnm.itf45m.ila@flex--dmatlack.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=A42BX/LP;
	dkim-atps=neutral
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PVnxn2Pq8z3cC5
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Mar 2023 06:02:05 +1100 (AEDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-536c8bcae3bso111940057b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Mar 2023 11:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1678129323;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=YtNaR+Rua5pfZ3i1GgJ4+hfSm+WXWk7IiLK4Wtb8+uM=;
        b=A42BX/LP2I7Yrldf83rjJjVVWP9EY7MIToR2w3fKfHNuwlJilnDlJG9Ga110/MBKfg
         bANY0GGZpHkSiBa5gtT3zYMm3kqQ6eoCd9XQbU1Nw97OaGmCCVTg5gCJq6SSBEjZs5D2
         WXuRcS2VBsFJxrimrp+JQlNpq+OFmS1Ohh71sBzmcc1MXrTW549F5OJ3aZCaRVfQfJrL
         Xl5df+WIcc/z0GU55ilZ3Am2ARcrEJpAjke5BrZTBJ9d+m4fByyPMgXYOtOtNovF1gQu
         M0K+F9OgIzJN5j3FpXghI6sTRl0hwMpb0KkZDbWtWBZRE7ORKqG1rS1sA7NOJROAsX6B
         zrWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678129323;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YtNaR+Rua5pfZ3i1GgJ4+hfSm+WXWk7IiLK4Wtb8+uM=;
        b=OvTgA99dMCsNx05oynMsZmGk8cLbVUY5YoNcQTWU/lqrcnqbImreoSHwJKBxyw3wzT
         LyL7X463NV5kOTxVVZVvPkgR8AgLym/0bGnRKaLaNkA5m3FbHFnYin0vNeOyK2N6pYFV
         FU07A/hfyFdBvLRRiicwHmz99lJy+4XYfTeJhR0O8KMHuhasIeZu8FTQJ2Qdb+7QIMFV
         dEKywqehZ+3uKeSYGuU37AfEYi3WqwY6OfsUuZ4j4bxcqvi6JAb9A15CavwxJC32/Iiz
         3LQH2g+FKq9nN05xo2SlJLBX7nsWBChfaDdkVih4P3MdtEcURhtLhdPH7ecljzG0BsY1
         xU1w==
X-Gm-Message-State: AO0yUKU8VK/9e4hbJXh19+4AUCgVfIkfmggiUl4EnGPSlAOgt3Jwb4tA
	nMLHmeYQaLHqLES4bUb1PESxPp9bBSjnIw==
X-Google-Smtp-Source: AK7set90Igml/rc2W0Ya1hk1eHjjJqlvHrIGVSaZmJTzp6vbZseA2XP1DWQDVsfl/YAYC2c0ne8CFj1tJ7LMiQ==
X-Received: from dmatlack-n2d-128.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1309])
 (user=dmatlack job=sendgmr) by 2002:a81:ad0d:0:b0:52e:b635:5496 with SMTP id
 l13-20020a81ad0d000000b0052eb6355496mr7126400ywh.2.1678129323101; Mon, 06 Mar
 2023 11:02:03 -0800 (PST)
Date: Mon,  6 Mar 2023 11:01:54 -0800
In-Reply-To: <20230306190156.434452-1-dmatlack@google.com>
Mime-Version: 1.0
References: <20230306190156.434452-1-dmatlack@google.com>
X-Mailer: git-send-email 2.40.0.rc0.216.gc4246ad0f0-goog
Message-ID: <20230306190156.434452-3-dmatlack@google.com>
Subject: [PATCH v2 2/4] KVM: Refactor designated initializer macros for struct _kvm_stats_desc
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

Refactor the macros that generate struct _kvm_stats_desc designated
initializers to cut down on duplication.

No functional change intended.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 include/linux/kvm_host.h | 75 +++++++++++++++++++---------------------
 1 file changed, 35 insertions(+), 40 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 02b1151c2753..6673ae757c4e 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1744,47 +1744,42 @@ struct _kvm_stats_desc {
 	char name[KVM_STATS_NAME_SIZE];
 };
 
-#define STATS_DESC_COMMON(type, unit, base, exp, sz, bsz)		       \
-	.flags = type | unit | base |					       \
-		 BUILD_BUG_ON_ZERO(type & ~KVM_STATS_TYPE_MASK) |	       \
-		 BUILD_BUG_ON_ZERO(unit & ~KVM_STATS_UNIT_MASK) |	       \
-		 BUILD_BUG_ON_ZERO(base & ~KVM_STATS_BASE_MASK),	       \
-	.exponent = exp,						       \
-	.size = sz,							       \
-	.bucket_size = bsz
-
-#define VM_GENERIC_STATS_DESC(stat, type, unit, base, exp, sz, bsz)	       \
+/* Generates a designated initializer list for a struct _kvm_stats_desc. */
+#define _KVM_STATS_DESC(_struct, _field, _name, _type, _unit, _base,	       \
+			_exponent, _size, _bucket_size)			       \
+{									       \
 	{								       \
-		{							       \
-			STATS_DESC_COMMON(type, unit, base, exp, sz, bsz),     \
-			.offset = offsetof(struct kvm_vm_stat, generic.stat)   \
-		},							       \
-		.name = #stat,						       \
-	}
-#define VCPU_GENERIC_STATS_DESC(stat, type, unit, base, exp, sz, bsz)	       \
-	{								       \
-		{							       \
-			STATS_DESC_COMMON(type, unit, base, exp, sz, bsz),     \
-			.offset = offsetof(struct kvm_vcpu_stat, generic.stat) \
-		},							       \
-		.name = #stat,						       \
-	}
-#define VM_STATS_DESC(stat, type, unit, base, exp, sz, bsz)		       \
-	{								       \
-		{							       \
-			STATS_DESC_COMMON(type, unit, base, exp, sz, bsz),     \
-			.offset = offsetof(struct kvm_vm_stat, stat)	       \
-		},							       \
-		.name = #stat,						       \
-	}
-#define VCPU_STATS_DESC(stat, type, unit, base, exp, sz, bsz)		       \
-	{								       \
-		{							       \
-			STATS_DESC_COMMON(type, unit, base, exp, sz, bsz),     \
-			.offset = offsetof(struct kvm_vcpu_stat, stat)	       \
-		},							       \
-		.name = #stat,						       \
-	}
+		.flags = _type | _unit | _base |			       \
+			 BUILD_BUG_ON_ZERO(_type & ~KVM_STATS_TYPE_MASK) |     \
+			 BUILD_BUG_ON_ZERO(_unit & ~KVM_STATS_UNIT_MASK) |     \
+			 BUILD_BUG_ON_ZERO(_base & ~KVM_STATS_BASE_MASK),      \
+		.exponent = _exponent,					       \
+		.size = _size,						       \
+		.bucket_size = _bucket_size,				       \
+		.offset = offsetof(_struct, _field),			       \
+	},								       \
+	.name = _name,							       \
+}
+
+#define VM_GENERIC_STATS_DESC(_stat, _type, _unit, _base, _exponent, _size,    \
+			      _bucket_size)				       \
+	_KVM_STATS_DESC(struct kvm_vm_stat, generic._stat, #_stat, _type,      \
+			_unit, _base, _exponent, _size, _bucket_size)
+
+#define VCPU_GENERIC_STATS_DESC(_stat, _type, _unit, _base, _exponent, _size,  \
+				_bucket_size)				       \
+	_KVM_STATS_DESC(struct kvm_vcpu_stat, generic._stat, #_stat, _type,    \
+			_unit, _base, _exponent, _size, _bucket_size)
+
+#define VM_STATS_DESC(_stat, _type, _unit, _base, _exponent, _size,	       \
+		      _bucket_size)					       \
+	_KVM_STATS_DESC(struct kvm_vm_stat, _stat, #_stat, _type, _unit,       \
+			_base, _exponent, _size, _bucket_size)
+
+#define VCPU_STATS_DESC(_stat, _type, _unit, _base, _exponent, _size,	       \
+			_bucket_size)					       \
+	_KVM_STATS_DESC(struct kvm_vcpu_stat, _stat, #_stat, _type, _unit,     \
+			_base, _exponent, _size, _bucket_size)
 
 /* SCOPE: VM, VM_GENERIC, VCPU, VCPU_GENERIC */
 #define STATS_DESC(SCOPE, stat, type, unit, base, exp, sz, bsz)		       \
-- 
2.40.0.rc0.216.gc4246ad0f0-goog

