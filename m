Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 812336ACD84
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Mar 2023 20:05:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVp1l2wqnz3fRq
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 06:05:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=UtpACFkT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--dmatlack.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3rdggzagkdf08h5og57fbjjbg9.7jhgdipskk7-89qgdnon.jug56n.jmb@flex--dmatlack.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=UtpACFkT;
	dkim-atps=neutral
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PVnxq29Ytz2yRV
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Mar 2023 06:02:07 +1100 (AEDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-536a5a0b6e3so112938677b3.10
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Mar 2023 11:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1678129324;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=XCoFR/ZEz+o/3af75F9xOrPS2psj7bAuPaV+hSWOgQo=;
        b=UtpACFkTBCbOuRJEDO4GIV5VZyNtvBXfzND3oU3x+MTJtqKf4RC+aJ4iEUgKvk/Gbv
         QwvfJnU9JToxEfS+WRcwSwlVT4IlfuPHxbDlaSiueIsWANa2Ta9bs7g2Xb/SoaztXvbW
         AcZzwTzgMy8MObXk877NToyNHzCNVG6tPs8bD3L2lDLtP1vJbpQNVe/QUw4MOneGcben
         A12+mWFZoMCKAD0Z64Pf8fB/rO0lgxgHvfoLNCDEimxkEwLixX3fA9CtbPgaW1lHLH/k
         mZfeAEacPOyAvkjV/89Ze4YmYA+t2BabNvI12wvTJZnOvTvidyImSKerp51EgZ1O07yo
         W1MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678129324;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XCoFR/ZEz+o/3af75F9xOrPS2psj7bAuPaV+hSWOgQo=;
        b=ttj6ijMnfgSp4v/SeL9bBGnTtT1cQ2Ti0zJem7CzgGA3MNbSXryn0MAPZsifX//CKT
         nIbaNVZfgbLBzR0Hmvdeh2J5kGN1oPD8zz2qsONK+svAuGDDxLFjcZJAV+KVmEYxKlzW
         +7KbsffKifyP27L6sTsgcR6Feb6z6HPrh5JPohfKPZuD8VjjQLwk7uk+fRVlctSQ7aHQ
         n7VyOvZvnH6WOOF6nFIUiPJQTbcg6PhuQlOUGmyUgt/hNOLEkB+yKTeQ7h9g91n3PEKt
         WIxQhH40D5gRELCFS0e/ZVgvzfB6IiCWQuIXQmjxElqAAWKVW6hv+dCEzsm7cDXKt1Jy
         xkaw==
X-Gm-Message-State: AO0yUKX2LMK3vcB3o/YXt6MVvjri29K8+2KDKyKGBiySE3R3OKOZCLue
	K1s7Rp2XqW0tw97revmmoX1kg55R3cn72A==
X-Google-Smtp-Source: AK7set//cZ5G8Yg9tzyC35+cBUfG5YD+QOMFZSqm+c6ivqgffhDJvoZQbaLGDxeXrS7rdZX3Y2pHJ1bn0bJjqg==
X-Received: from dmatlack-n2d-128.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1309])
 (user=dmatlack job=sendgmr) by 2002:a81:ac4b:0:b0:533:9ffb:cb12 with SMTP id
 z11-20020a81ac4b000000b005339ffbcb12mr7643877ywj.10.1678129324575; Mon, 06
 Mar 2023 11:02:04 -0800 (PST)
Date: Mon,  6 Mar 2023 11:01:55 -0800
In-Reply-To: <20230306190156.434452-1-dmatlack@google.com>
Mime-Version: 1.0
References: <20230306190156.434452-1-dmatlack@google.com>
X-Mailer: git-send-email 2.40.0.rc0.216.gc4246ad0f0-goog
Message-ID: <20230306190156.434452-4-dmatlack@google.com>
Subject: [PATCH v2 3/4] KVM: Allow custom names for KVM_STAT()
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-riscv@lists.infradead.org, Claudio Imbrenda <imbrenda@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Zenghui Yu <yuzenghui@huawei.com>, Palmer Dabbelt <palmer@dabbelt.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Jing Zhang <jingzhangos@google.com>, Eric Farman <farman@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Suzuki K Poulose <suzuki.poulose@arm.com>, Nicholas Piggin <npiggin@gmail.com>, Sathvika Vasireddy <sv@linux.ibm.com>, Atish Patra <atishp@atishpatra.org>, David Matlack <dmatlack@google.com>, linux-arm-kernel@lists.infradead.org, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Sean Christopherson <seanjc@google.com>, linux-mips@vger.kernel.org, Oli
 ver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, kvm-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Allow custom names to be specified for stats built on KVM_STAT() via a
new inner macro __KVM_STAT(). e.g.

  KVM_STAT(VM, CUMULATIVE, NONE, foo),
  __KVM_STAT(VM, CUMULATIVE, NONE, bar, "custom_name"),
  ...

Custom name support enables decoupling the userspace-visible stat names
from their internal representation in C. This can allow future commits
to refactor the various stats structs without impacting userspace tools
that read KVM stats.

This also allows stats to be stored in data structures such as arrays,
without needing unions to access specific stats. For example, the union
for pages_{4k,2m,1g} is no longer necessary. At Google, we have several
other out-of-tree stats that would benefit from this support.

No functional change intended.

Link: https://lore.kernel.org/all/20211019000459.3163029-1-jingzhangos@google.com/
Suggested-by: Jing Zhang <jingzhangos@google.com>
Signed-off-by: David Matlack <dmatlack@google.com>
---
 include/linux/kvm_host.h | 35 +++++++++++++++++++----------------
 1 file changed, 19 insertions(+), 16 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 6673ae757c4e..fa026e8997b2 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1761,40 +1761,43 @@ struct _kvm_stats_desc {
 	.name = _name,							       \
 }
 
-#define VM_GENERIC_STATS_DESC(_stat, _type, _unit, _base, _exponent, _size,    \
-			      _bucket_size)				       \
-	_KVM_STATS_DESC(struct kvm_vm_stat, generic._stat, #_stat, _type,      \
+#define VM_GENERIC_STATS_DESC(_stat, _name, _type, _unit, _base, _exponent,    \
+			      _size, _bucket_size)			       \
+	_KVM_STATS_DESC(struct kvm_vm_stat, generic._stat, _name, _type,       \
 			_unit, _base, _exponent, _size, _bucket_size)
 
-#define VCPU_GENERIC_STATS_DESC(_stat, _type, _unit, _base, _exponent, _size,  \
-				_bucket_size)				       \
-	_KVM_STATS_DESC(struct kvm_vcpu_stat, generic._stat, #_stat, _type,    \
+#define VCPU_GENERIC_STATS_DESC(_stat, _name, _type, _unit, _base, _exponent,  \
+				_size, _bucket_size)			       \
+	_KVM_STATS_DESC(struct kvm_vcpu_stat, generic._stat, _name, _type,     \
 			_unit, _base, _exponent, _size, _bucket_size)
 
-#define VM_STATS_DESC(_stat, _type, _unit, _base, _exponent, _size,	       \
+#define VM_STATS_DESC(_stat, _name, _type, _unit, _base, _exponent, _size,     \
 		      _bucket_size)					       \
-	_KVM_STATS_DESC(struct kvm_vm_stat, _stat, #_stat, _type, _unit,       \
+	_KVM_STATS_DESC(struct kvm_vm_stat, _stat, _name, _type, _unit,	       \
 			_base, _exponent, _size, _bucket_size)
 
-#define VCPU_STATS_DESC(_stat, _type, _unit, _base, _exponent, _size,	       \
+#define VCPU_STATS_DESC(_stat, _name, _type, _unit, _base, _exponent, _size,   \
 			_bucket_size)					       \
-	_KVM_STATS_DESC(struct kvm_vcpu_stat, _stat, #_stat, _type, _unit,     \
+	_KVM_STATS_DESC(struct kvm_vcpu_stat, _stat, _name, _type, _unit,      \
 			_base, _exponent, _size, _bucket_size)
 
 /* SCOPE: VM, VM_GENERIC, VCPU, VCPU_GENERIC */
-#define STATS_DESC(SCOPE, stat, type, unit, base, exp, sz, bsz)		       \
-	SCOPE##_STATS_DESC(stat, type, unit, base, exp, sz, bsz)
+#define STATS_DESC(SCOPE, stat, name, type, unit, base, exp, sz, bsz)	       \
+	SCOPE##_STATS_DESC(stat, name, type, unit, base, exp, sz, bsz)
 
-#define KVM_STAT(SCOPE, TYPE, UNIT, _stat)				       \
-	STATS_DESC(SCOPE, _stat, KVM_STATS_TYPE_##TYPE,			       \
+#define __KVM_STAT(SCOPE, TYPE, UNIT, _stat, _name)			       \
+	STATS_DESC(SCOPE, _stat, _name, KVM_STATS_TYPE_##TYPE,		       \
 		   KVM_STATS_UNIT_##UNIT, KVM_STATS_BASE_POW10, 0, 1, 0)
 
+#define KVM_STAT(SCOPE, TYPE, UNIT, _stat)				       \
+	__KVM_STAT(SCOPE, TYPE, UNIT, _stat, #_stat)
+
 #define KVM_STAT_NSEC(SCOPE, _stat)					       \
-	STATS_DESC(SCOPE, _stat, KVM_STATS_TYPE_CUMULATIVE,		       \
+	STATS_DESC(SCOPE, _stat, #_stat, KVM_STATS_TYPE_CUMULATIVE,	       \
 		   KVM_STATS_UNIT_SECONDS, KVM_STATS_BASE_POW10, -9, 1, 0)
 
 #define KVM_HIST_NSEC(SCOPE, TYPE, _stat, _size, _bucket_size)		       \
-	STATS_DESC(VCPU_GENERIC, _stat, KVM_STATS_TYPE_##TYPE##_HIST,	       \
+	STATS_DESC(VCPU_GENERIC, _stat, #_stat, KVM_STATS_TYPE_##TYPE##_HIST,  \
 		   KVM_STATS_UNIT_SECONDS, KVM_STATS_BASE_POW10, -9,	       \
 		   _size, _bucket_size)
 
-- 
2.40.0.rc0.216.gc4246ad0f0-goog

