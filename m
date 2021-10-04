Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C2542138C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Oct 2021 18:03:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNQW214j9z3c93
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 03:03:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=mgMJaoHk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::533;
 helo=mail-pg1-x533.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=mgMJaoHk; dkim-atps=neutral
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNQS96L4wz2ybD
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Oct 2021 03:01:13 +1100 (AEDT)
Received: by mail-pg1-x533.google.com with SMTP id v11so4375832pgb.8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Oct 2021 09:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5pcRvtdslqLe3269KSh6pekuy65GoxrcpKwBn7DAUtU=;
 b=mgMJaoHkilZlL1u7SJCBpMIDKwSglv7DrTVjNzZ0xMLUxtoN9IeiviAfkQNGQ3/Jkm
 LkUYA89+rjLF31E4UnH6SV0XBubItXuG5oB9MDuwhFEG2aRNuCw1jupWHsmV9n9N+zJ+
 AOcztA6hGqasVBtN/aDviQbGQNsFglTy+LXN2+BoK99ut1C1Gmx3rCxLnxwnf0Dw4IVP
 59rkyeQOEr+GH5O2Va2AaV+jEstiIPVz4aipnUDmUYs6I65td30rGBRB0ASwvSGv7KTk
 FREzPtoyYN7kbGDBblzBAM46mMmz2wyLuNZYlqrCdiCpFDCAgIcdKCYRjKhc4WSOKS3j
 4Izg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5pcRvtdslqLe3269KSh6pekuy65GoxrcpKwBn7DAUtU=;
 b=2vFNKZTOMGbKpLJHJXe3T4gUFzAbT/3MvoAAruV1Th3U9CGhmrUIOsScqfkETzkQ5c
 0FP/5HByNNNyMj1awZv/e7APpsqWH0G8oRQ0FVUrbKQfG8dLT/pPyhA66+vZBaAMomGg
 VUzcFBXmXFTwVd0IOElb+gBy7T5Wp5xUILeuniCmzfGdOWRM4fKVLCkPgq/wGXqRF7Uv
 +0y4D3r60PyRkoUB2nV+VireXKIo/OkPpYaR+l7VkJ2XBjtXRNTDaJ6IZtzRoKMsjfnX
 5eDE6hQSUdGchiz41HI4YH4f+lWJvddWFvAKzecEkkJTwtYUitKx44Q7KPweukPk/wj8
 HMug==
X-Gm-Message-State: AOAM532c/p1VWbCq3XpgWkoe1rjLVRN5NsNXKLWJpr0xM8Bu7K/ky1xm
 T64FAMw5RWtVwTmaZCh3Ykc=
X-Google-Smtp-Source: ABdhPJxbHxvVGtRL43v+pJW6MIX61tzQ8nXeti2cnql5N0HFZJE138rMYH782+IzzvUCqRmucJNo/A==
X-Received: by 2002:a05:6a00:cc9:b0:44c:2305:50de with SMTP id
 b9-20020a056a000cc900b0044c230550demr15931064pfv.79.1633363271367; 
 Mon, 04 Oct 2021 09:01:11 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (115-64-153-41.tpgi.com.au. [115.64.153.41])
 by smtp.gmail.com with ESMTPSA id 130sm15557223pfz.77.2021.10.04.09.01.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 09:01:11 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 04/52] KVM: PPC: Book3S HV P9: Use host timer accounting to
 avoid decrementer read
Date: Tue,  5 Oct 2021 02:00:01 +1000
Message-Id: <20211004160049.1338837-5-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There is no need to save away the host DEC value, as it is derived
from the host timer subsystem which maintains the next timer time,
so it can be restored from there.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/time.h |  5 +++++
 arch/powerpc/kernel/time.c      |  1 +
 arch/powerpc/kvm/book3s_hv.c    | 14 +++++++-------
 3 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/include/asm/time.h b/arch/powerpc/include/asm/time.h
index 8c2c3dd4ddba..fd09b4797fd7 100644
--- a/arch/powerpc/include/asm/time.h
+++ b/arch/powerpc/include/asm/time.h
@@ -111,6 +111,11 @@ static inline unsigned long test_irq_work_pending(void)
 
 DECLARE_PER_CPU(u64, decrementers_next_tb);
 
+static inline u64 timer_get_next_tb(void)
+{
+	return __this_cpu_read(decrementers_next_tb);
+}
+
 /* Convert timebase ticks to nanoseconds */
 unsigned long long tb_to_ns(unsigned long long tb_ticks);
 
diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
index 934d8ae66cc6..e84a087223ce 100644
--- a/arch/powerpc/kernel/time.c
+++ b/arch/powerpc/kernel/time.c
@@ -107,6 +107,7 @@ struct clock_event_device decrementer_clockevent = {
 EXPORT_SYMBOL(decrementer_clockevent);
 
 DEFINE_PER_CPU(u64, decrementers_next_tb);
+EXPORT_SYMBOL_GPL(decrementers_next_tb);
 static DEFINE_PER_CPU(struct clock_event_device, decrementers);
 
 #define XSEC_PER_SEC (1024*1024)
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 6a07a79f07d8..30d400bf161b 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3860,18 +3860,17 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 	struct kvmppc_vcore *vc = vcpu->arch.vcore;
 	struct p9_host_os_sprs host_os_sprs;
 	s64 dec;
-	u64 tb;
+	u64 tb, next_timer;
 	int trap, save_pmu;
 
 	WARN_ON_ONCE(vcpu->arch.ceded);
 
-	dec = mfspr(SPRN_DEC);
 	tb = mftb();
-	if (dec < 0)
+	next_timer = timer_get_next_tb();
+	if (tb >= next_timer)
 		return BOOK3S_INTERRUPT_HV_DECREMENTER;
-	local_paca->kvm_hstate.dec_expires = dec + tb;
-	if (local_paca->kvm_hstate.dec_expires < time_limit)
-		time_limit = local_paca->kvm_hstate.dec_expires;
+	if (next_timer < time_limit)
+		time_limit = next_timer;
 
 	save_p9_host_os_sprs(&host_os_sprs);
 
@@ -4050,7 +4049,8 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 	vc->entry_exit_map = 0x101;
 	vc->in_guest = 0;
 
-	set_dec(local_paca->kvm_hstate.dec_expires - mftb());
+	next_timer = timer_get_next_tb();
+	set_dec(next_timer - mftb());
 	/* We may have raced with new irq work */
 	if (test_irq_work_pending())
 		set_dec(1);
-- 
2.23.0

