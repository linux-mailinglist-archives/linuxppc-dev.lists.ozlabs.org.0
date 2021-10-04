Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B71AD4213CE
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Oct 2021 18:15:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNQmC4NWmz3fMP
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 03:15:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=XITgc8RJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::433;
 helo=mail-pf1-x433.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=XITgc8RJ; dkim-atps=neutral
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNQSy2W6Yz3c4h
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Oct 2021 03:01:54 +1100 (AEDT)
Received: by mail-pf1-x433.google.com with SMTP id 187so10490320pfc.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Oct 2021 09:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+uifPGYlRIbN5mTHvUbZjtaaYYRvM7KqJ3vO8EmF4DI=;
 b=XITgc8RJByYf5tfAAvYEE3fH5jgqKB2ALbN1qiAbVXPBSv3UghC3UhFKAggSOwhafw
 nd9sbGhwE0w/Ce6sxG/M4VHE4EMtvxNJypiDXY/5Rr5wPcO59ioDlh+FDVev9c/un9zR
 ZOS6i7BAzbp76Vb7vJpA6JHPtpRUqxcQSpo1eyrH/YY3pWwD6H7uLBZfvrRVRZcqpQDS
 HihpwPE8PpWqiOQq/+UIirBaDJZfb6utgiZPv9rt3vhQpTBkz0JKHaOR3UksFClgl8PX
 2e664zqByaQX1VH0Dq17LnQdUKi6HxhZxhTD7l2Q+78gAa4qUgdvm/mEvYq5ALIlzwa2
 k6hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+uifPGYlRIbN5mTHvUbZjtaaYYRvM7KqJ3vO8EmF4DI=;
 b=BljN081gdaoI4gIIH5DCAPLBru2g2lUMDhZdhPpyk74p9QiaardHNTtavoP3cVqzZH
 Stp2O6gDkT/En2xihmGe5dAXySXgru+eXeKYRpPEfMwHb69JQqPoUnzPzzyMyYpS0mGJ
 JoNNqEpkqaaWMwBg6rSY7pr1jB0mqULgd4g2QzMUnkbLhxfXEinOHprXZ2AK9P+caAB7
 rakR2u17MPOQubK9c5pn/vAl909vPCJM7YOfZVCB+G2i0BI7NLZY+5bXAkdGVmy4mASv
 coCr3qmLD70pKnS5FavLLIX0AC1pD9wsjojakaRE4o3Sla7CwFIeKcYADjHJXnFq5gfD
 WUhQ==
X-Gm-Message-State: AOAM531Tbdvjtl2viOomFT0OlQmmQxn0EURJNVZr9qBgWDx4KGt7O7Yw
 JhWFEFjXsKShvIz+qEuE9ikf9hPPA80=
X-Google-Smtp-Source: ABdhPJyNq27FnsuPIjdFF/2bUzMcOMAx0XQUSvD/HRDWTzd9kWE+rNvvjQl1qezB9/4JVlhHsWfEMQ==
X-Received: by 2002:a63:ce52:: with SMTP id r18mr11325811pgi.350.1633363312287; 
 Mon, 04 Oct 2021 09:01:52 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (115-64-153-41.tpgi.com.au. [115.64.153.41])
 by smtp.gmail.com with ESMTPSA id 130sm15557223pfz.77.2021.10.04.09.01.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 09:01:52 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 21/52] KVM: PPC: Book3S HV P9: Add kvmppc_stop_thread to
 match kvmppc_start_thread
Date: Tue,  5 Oct 2021 02:00:18 +1000
Message-Id: <20211004160049.1338837-22-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211004160049.1338837-1-npiggin@gmail.com>
References: <20211004160049.1338837-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>, Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Small cleanup makes it a bit easier to match up entry and exit
operations.

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 7e8ddffd61c7..0a711d929531 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3070,6 +3070,13 @@ static void kvmppc_start_thread(struct kvm_vcpu *vcpu, struct kvmppc_vcore *vc)
 		kvmppc_ipi_thread(cpu);
 }
 
+/* Old path does this in asm */
+static void kvmppc_stop_thread(struct kvm_vcpu *vcpu)
+{
+	vcpu->cpu = -1;
+	vcpu->arch.thread_cpu = -1;
+}
+
 static void kvmppc_wait_for_nap(int n_threads)
 {
 	int cpu = smp_processor_id();
@@ -4297,8 +4304,6 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 		dec = (s32) dec;
 	tb = mftb();
 	vcpu->arch.dec_expires = dec + tb;
-	vcpu->cpu = -1;
-	vcpu->arch.thread_cpu = -1;
 
 	store_spr_state(vcpu);
 
@@ -4782,6 +4787,8 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	guest_exit_irqoff();
 
+	kvmppc_stop_thread(vcpu);
+
 	powerpc_local_irq_pmu_restore(flags);
 
 	cpumask_clear_cpu(pcpu, &kvm->arch.cpu_in_guest);
-- 
2.23.0

