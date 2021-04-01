Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CB644351600
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 17:15:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FB6F05sY4z3dfb
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Apr 2021 02:15:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=hfyiHCMb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e;
 helo=mail-pl1-x62e.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=hfyiHCMb; dkim-atps=neutral
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FB6150hdTz3c0m
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Apr 2021 02:04:56 +1100 (AEDT)
Received: by mail-pl1-x62e.google.com with SMTP id l1so1144770plg.12
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Apr 2021 08:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u8vp9roVuaRmhfBRtCwb/lKR6w+iZpeDEIXPZDywVoQ=;
 b=hfyiHCMbXdtonpwpG1ansFgGIxJ9EjEmvStKFVtVkMmmCcOVrtKL/TWWQDh3eh9jyr
 ZTBcAIfCS5H5Itbzd8ARniWW9Yf0QfXwiy6ubkLOUl9IofTc45yWwXlsAnoDQg2ABSKv
 O/dZJUZsLt0Ol9wD/phH08OYNhwvF7Mmr70JSEVMQlGtqWA74WXGwjrpQJCB/T/BeoGe
 8wB+7whCnLI8TH111Y6LCo2efFhqdlgrgYkfSLgGohXByRexyOzWqb+Q5+gJDgwIqhXY
 VOz5EMmPc/KF1S78Z60eY9jkkIpZJA4FU+6+ORDms0bvFnSqCxu4jkA4pWpw6UgvX3AU
 oU5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u8vp9roVuaRmhfBRtCwb/lKR6w+iZpeDEIXPZDywVoQ=;
 b=OX2m3iHxD3dWBCpLcaHFQD+JpFZB4vQtyhP+1BE4XrXXfxx6CXTxsXyD8IURV7qtu4
 lHz32rcD7AZf4cInF+zI5X6HTTutp6G13+lhk2W0ITTHqfSWo+/P9kiyQ+Y9NFIESkRI
 uOzKjZDOLVEAInMYQK5anPoqdZN1bANktpQrCpo7JJxHlqpudPRFgVVjyDSGLMfoCdvi
 5FuB2e8epPBzz87i3K2LVP5CPEYHSPBXZ1QVCG3gEgUcUtsrVbHd99M3euLanAMXBnki
 HqqP0UbmC7znratBLUbU2H2Jm7vaSfXohqzI7y+f7/+nSvtDc2o/V1TcdOFQPmvi/ZOV
 Cfiw==
X-Gm-Message-State: AOAM533na3FyvdTEG902dgEMeZDkHMfTGBCOYmP1lbCqj2+WSO1Y2Pph
 v6pC/ULV1XwrItE42Dr2Xac=
X-Google-Smtp-Source: ABdhPJwtiAqSy7ggl5dRplnMo1pOdemOcDfqBG87KJseRlzov9cX6dEamRmHv7jHFxMGSDJE0mwxCw==
X-Received: by 2002:a17:902:c084:b029:e7:32bd:6bc6 with SMTP id
 j4-20020a170902c084b02900e732bd6bc6mr8272375pld.58.1617289494852; 
 Thu, 01 Apr 2021 08:04:54 -0700 (PDT)
Received: from bobo.ibm.com ([1.128.218.207])
 by smtp.gmail.com with ESMTPSA id l3sm5599632pju.44.2021.04.01.08.04.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 08:04:54 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v5 25/48] KVM: PPC: Book3S HV P9: Use host timer accounting to
 avoid decrementer read
Date: Fri,  2 Apr 2021 01:03:02 +1000
Message-Id: <20210401150325.442125-26-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210401150325.442125-1-npiggin@gmail.com>
References: <20210401150325.442125-1-npiggin@gmail.com>
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
 arch/powerpc/kvm/book3s_hv.c    | 14 +++++++-------
 3 files changed, 13 insertions(+), 7 deletions(-)

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
index fc42594c8223..8b9b38a8ce57 100644
--- a/arch/powerpc/kernel/time.c
+++ b/arch/powerpc/kernel/time.c
@@ -109,6 +109,7 @@ struct clock_event_device decrementer_clockevent = {
 EXPORT_SYMBOL(decrementer_clockevent);
 
 DEFINE_PER_CPU(u64, decrementers_next_tb);
+EXPORT_SYMBOL_GPL(decrementers_next_tb);
 static DEFINE_PER_CPU(struct clock_event_device, decrementers);
 
 #define XSEC_PER_SEC (1024*1024)
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 7afa2e7a2867..dc1232d2a198 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3697,16 +3697,15 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
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
+	if (next_timer < time_limit)
+		time_limit = next_timer;
 
 	vcpu->arch.ceded = 0;
 
@@ -3889,7 +3888,8 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 	vc->entry_exit_map = 0x101;
 	vc->in_guest = 0;
 
-	mtspr(SPRN_DEC, local_paca->kvm_hstate.dec_expires - mftb());
+	next_timer = timer_get_next_tb();
+	mtspr(SPRN_DEC, next_timer - mftb());
 	mtspr(SPRN_SPRG_VDSO_WRITE, local_paca->sprg_vdso);
 
 	kvmhv_load_host_pmu();
-- 
2.23.0

