Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 66EA032EE2A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 16:16:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DsWXh30Dlz3gTf
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Mar 2021 02:16:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=B/hI0z2/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::530;
 helo=mail-pg1-x530.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=B/hI0z2/; dkim-atps=neutral
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DsWMB3lHzz3dWB
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Mar 2021 02:08:06 +1100 (AEDT)
Received: by mail-pg1-x530.google.com with SMTP id t25so1564312pga.2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Mar 2021 07:08:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QzXCzutKukC9Wg7gG7X4oitma3Q1T8uld96XlvQC3Po=;
 b=B/hI0z2/TUpmpqxB+Qyll0GHT+RKS9kLLrrKBq0y2QN3tdGeh27XjYH0wcPvUhwsu9
 EiytOTWgSd/nC1rKiB7h/+/OIcuscmg69ztw4M+aGt+xQHv9qXSmhu3IeZbtuH/OJbeC
 RO0IDpRx94Gzrqq+LMT4WY5uZGy8kqQcQntpMQ0PP8tj3ydUCGOeFcpbisjJ55zIAXM3
 VQ2RAlcCDmX1w+qdm9ppEZL5zJ8TkCNHu2yQjYYfnq0O8WXjG7t64c5a5DqZJo5qJnr8
 LOsTo+N+5hbj6VypaM7S7aZYk04KjryRNo6O0WPOD/v+tcBcDyGZBoNdhkkPFeRhcilX
 m+lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QzXCzutKukC9Wg7gG7X4oitma3Q1T8uld96XlvQC3Po=;
 b=s2iDVd+0BWo25wrSUHcYcPBxGFmvc59s7N3dQqL5JQwVzPakJXK477yDPjWNE7DBIm
 0I3Ly4bGO5qELZoAtEkb119DqlHYZiI3GHS0y78xzj/lqGjJm17RGO1eiemgBmVwUjAv
 B16VjzbXIqXOwfF9GLXrAYlTCGiSHsSlSmXFlFY5arMIngeCyoyN+iSdZHCBaD4u+MWp
 VVPUYnPOUb9WW5lkHbND337E2CmzTCZXv7rVffGDZZaGvY3JvQSJA74IZAAVbZFvShIZ
 RzoddCxfszBdAzKAVlfysUlKeDXHlC16K3agTC2EwI0dsp8/zAI0c/J8Y+QT8ws+OCeC
 rEZA==
X-Gm-Message-State: AOAM532euMdUsfSgB80St6eXSx+jVj8uEi/oUoIgMgt5omgsWlPJMt2t
 w1CRln4dHJDWnF/LsNg3eGmX7EpQhLk=
X-Google-Smtp-Source: ABdhPJyQpptMhLq5xAwh1XlV8bHuoF+2aAcPCC0YBYqpDhVuOYLFRSYLp68TZr2mr2oIElBtbWoHHA==
X-Received: by 2002:a63:a54f:: with SMTP id r15mr8223576pgu.430.1614956884242; 
 Fri, 05 Mar 2021 07:08:04 -0800 (PST)
Received: from bobo.ibm.com (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id m5sm1348982pfd.96.2021.03.05.07.08.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 07:08:03 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v3 22/41] KVM: PPC: Book3S HV P9: Use host timer accounting to
 avoid decrementer read
Date: Sat,  6 Mar 2021 01:06:19 +1000
Message-Id: <20210305150638.2675513-23-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210305150638.2675513-1-npiggin@gmail.com>
References: <20210305150638.2675513-1-npiggin@gmail.com>
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
index 24b0680f0ad7..c1965a9d8d00 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3645,16 +3645,16 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
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

