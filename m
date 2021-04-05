Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F09353AD5
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Apr 2021 03:31:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FDCmW5F8vz3g2J
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Apr 2021 11:31:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Y30UY1Og;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102e;
 helo=mail-pj1-x102e.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Y30UY1Og; dkim-atps=neutral
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FDCY75w6Qz3cD8
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Apr 2021 11:21:31 +1000 (AEST)
Received: by mail-pj1-x102e.google.com with SMTP id ha17so5269413pjb.2
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 04 Apr 2021 18:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/MfbnRN8dnuzRj+Aq/3W1T9BSSMMXrvqkGuD+Sv636E=;
 b=Y30UY1OgHfg+ZONfB5UWRtxeu1z7SAmRVSRRpwSWYu1X0M60zAQm/dxBMlFadC71Xn
 gFCwn0aAoi9Uz7cgoch+a4fOwIZt71Qj0R7R9Gz4T2voCbECnuPZQISATswKeUw7kBpn
 LO22W8C4/aUDRo15mnzq51q96lAbgtQ4POROIHidD+OeV60hA2ptBmJwu1nBbZcv3qYg
 EmLlAu1bKtBwHCrjsXywZXuJrkx0OyhUeZ8LkNv1DbzdjT+xfCMTyvC3gtCxZW7bL4Dj
 s4zHNWdxewjs0waBce7pteF4al5f/fLN4BLTiq2pnGnGXqGZ774f48hz0uGzIaMdJ71w
 kxag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/MfbnRN8dnuzRj+Aq/3W1T9BSSMMXrvqkGuD+Sv636E=;
 b=mgQkKz8qkn6z7ezaGozIFsi/+Br/gtWOPd2hghVZ68mzDziFh2h6YelWRP0rzftGYf
 Zx4lCweGUdj+QDf1yiDAXwSmhyf8H+OsTBaXQWEy1VWaZs6n97HR5nR+uZzhQ27He78w
 RjXW6+v9JCY2VazgEIMIQrAjzcXbLTr9q0YeB7Ms6Bqy6Ab+6l+yFEEssBwFF1gZ88Cy
 B/EkoGsnP6fN9vbraIjY9POZrt9cVaf+bulYkQXvhY2Jj2SOexOlm3L9BhCmwiVvgiAX
 wvuecWylHKtRbE4E9BJ7Ccl1xAAJ8AFdeEe1Wp2eKkQv6HCjiRR/3r4t1CBsw3sOnDT/
 7LTw==
X-Gm-Message-State: AOAM532plBhnIpkPOb2xbIXAcc7zATgyazKqdkgFLohUvWeaaOLwNCFp
 NN886PiuEeyUz13LeSfRZvPXSxgbHidC4A==
X-Google-Smtp-Source: ABdhPJxFZ92JUxArnB0Kjn4AsWGbEnW4X0TXT/LT+PNWX5v4UnSYf00JBDJV/2+536BmLm/nculj2Q==
X-Received: by 2002:a17:90a:9f8d:: with SMTP id
 o13mr23645774pjp.25.1617585689484; 
 Sun, 04 Apr 2021 18:21:29 -0700 (PDT)
Received: from bobo.ibm.com ([1.132.215.134])
 by smtp.gmail.com with ESMTPSA id e3sm14062536pfm.43.2021.04.04.18.21.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Apr 2021 18:21:29 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v6 25/48] KVM: PPC: Book3S HV P9: Use host timer accounting to
 avoid decrementer read
Date: Mon,  5 Apr 2021 11:19:25 +1000
Message-Id: <20210405011948.675354-26-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210405011948.675354-1-npiggin@gmail.com>
References: <20210405011948.675354-1-npiggin@gmail.com>
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
index 3029ffb4b792..5c4ccebce682 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3703,16 +3703,15 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
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
 
@@ -3895,7 +3894,8 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 	vc->entry_exit_map = 0x101;
 	vc->in_guest = 0;
 
-	mtspr(SPRN_DEC, local_paca->kvm_hstate.dec_expires - mftb());
+	next_timer = timer_get_next_tb();
+	mtspr(SPRN_DEC, next_timer - mftb());
 	mtspr(SPRN_SPRG_VDSO_WRITE, local_paca->sprg_vdso);
 
 	kvmhv_load_host_pmu();
-- 
2.23.0

