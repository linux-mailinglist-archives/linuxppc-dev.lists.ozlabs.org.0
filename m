Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 710E73454BF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 02:14:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4D173H9mz3cyR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 12:14:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=HiLjf44/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42e;
 helo=mail-pf1-x42e.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=HiLjf44/; dkim-atps=neutral
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F4Cnb1MPYz3bxK
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 12:04:35 +1100 (AEDT)
Received: by mail-pf1-x42e.google.com with SMTP id c204so12525166pfc.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Mar 2021 18:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oi3rFVg7s4YqpLlxvEO8J+wccg/jPuk5mshi+6/N23M=;
 b=HiLjf44/VHH2aT9EPQ+ThTqjMJk27ht24Ty6z1eCauzjy9dfsOpoPKJDGRm4G/ayFu
 I1JvgDzUDyfexo83K8b/rp/cMZMCYYpFWVyTxpfblqs1AC7eXd7QYAtkn8Jnzv2QQmYJ
 OvRhbr9LXqS88fXM9cPW1KWp3j759qqyHJaqEz6ZWGjgAwdR204khsTvw9p6j29xInGh
 3cBhefzo2VudXul4PC0GP1XfcBuq9yUjJrLrW+qhWKkEqNBSdYqB/cU3/9feS0xUzKWJ
 WfvuhZsz3Cs4voMIPW89Lib/pkw7P9OsxfGw9s6v/DQjVki3rGf97h/qISHIzyTR3oT6
 gdHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oi3rFVg7s4YqpLlxvEO8J+wccg/jPuk5mshi+6/N23M=;
 b=btUhqYoi7Dj98kkhzdNsAQG3G+6uVAp4kyTVIfQebznmQWqpxO6v60HXMg+GGVEUWY
 65/RG7uRJ+A0SU3SAdKIMhCQ2CDRUXqwy2F4h9KJuJo1UKgbP4JcelmtagR+FqF+Z8YG
 zxwfYFRWQGCqcuaAlx7biJ5Il2q7I4EECeL3ixs4xMTkmDwUqTCIuSUreeOVk06w/Sjv
 4IqxerMsnC0gjmzPLTYX/DVzu7808ZJZyQH2qWIOs1TObiaqS1a0Zs4VdrXfXh67WzEA
 ed2jir0sJoF4nKn20MxTPuXD5cmJm3N0oyKUC9M+5FDEACMJeRdlfhqyDKQcDDnaqfOw
 Fmwg==
X-Gm-Message-State: AOAM530wH27yEF+HxlouS988XI+2gCP2OVVYyt4ixdev6JKk7eKVE93M
 0A5mW7iKDNwJoVAfbQ0LV6S9t2mzwWY=
X-Google-Smtp-Source: ABdhPJxR2rjrIbqJLjRniFE/5WhegxWnBzygZusywztZ2QCEB/f4CoDOgA+wiR5aWh8tT/oRfcFwtw==
X-Received: by 2002:aa7:9a89:0:b029:1f6:26b9:bb73 with SMTP id
 w9-20020aa79a890000b02901f626b9bb73mr2047942pfi.78.1616461473422; 
 Mon, 22 Mar 2021 18:04:33 -0700 (PDT)
Received: from bobo.ibm.com ([58.84.78.96])
 by smtp.gmail.com with ESMTPSA id e7sm14491894pfc.88.2021.03.22.18.04.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 18:04:33 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v4 25/46] KVM: PPC: Book3S HV P9: Use host timer accounting to
 avoid decrementer read
Date: Tue, 23 Mar 2021 11:02:44 +1000
Message-Id: <20210323010305.1045293-26-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210323010305.1045293-1-npiggin@gmail.com>
References: <20210323010305.1045293-1-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There is no need to save away the host DEC value, as it is derived
from the host timer subsystem, which maintains the next timer time.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/time.h |  5 +++++
 arch/powerpc/kernel/time.c      |  1 +
 arch/powerpc/kvm/book3s_hv.c    | 12 ++++++------
 3 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/include/asm/time.h b/arch/powerpc/include/asm/time.h
index 68d94711811e..0128cd9769bc 100644
--- a/arch/powerpc/include/asm/time.h
+++ b/arch/powerpc/include/asm/time.h
@@ -101,6 +101,11 @@ extern void __init time_init(void);
 
 DECLARE_PER_CPU(u64, decrementers_next_tb);
 
+static inline u64 timer_get_next_tb(void)
+{
+	return __this_cpu_read(decrementers_next_tb);
+}
+
 /* Convert timebase ticks to nanoseconds */
 unsigned long long tb_to_ns(unsigned long long tb_ticks);
 
diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
index b67d93a609a2..c5d524622c17 100644
--- a/arch/powerpc/kernel/time.c
+++ b/arch/powerpc/kernel/time.c
@@ -108,6 +108,7 @@ struct clock_event_device decrementer_clockevent = {
 EXPORT_SYMBOL(decrementer_clockevent);
 
 DEFINE_PER_CPU(u64, decrementers_next_tb);
+EXPORT_SYMBOL_GPL(decrementers_next_tb);
 static DEFINE_PER_CPU(struct clock_event_device, decrementers);
 
 #define XSEC_PER_SEC (1024*1024)
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index bb30c5ab53d1..db807eebb3bd 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3686,16 +3686,16 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 	unsigned long host_amr = mfspr(SPRN_AMR);
 	unsigned long host_fscr = mfspr(SPRN_FSCR);
 	s64 dec;
-	u64 tb;
+	u64 tb, next_timer;
 	int trap, save_pmu;
 
-	dec = mfspr(SPRN_DEC);
 	tb = mftb();
-	if (dec < 0)
+	next_timer = timer_get_next_tb();
+	if (tb >= next_timer)
 		return BOOK3S_INTERRUPT_HV_DECREMENTER;
-	local_paca->kvm_hstate.dec_expires = dec + tb;
-	if (local_paca->kvm_hstate.dec_expires < time_limit)
-		time_limit = local_paca->kvm_hstate.dec_expires;
+	local_paca->kvm_hstate.dec_expires = next_timer;
+	if (next_timer < time_limit)
+		time_limit = next_timer;
 
 	vcpu->arch.ceded = 0;
 
-- 
2.23.0

