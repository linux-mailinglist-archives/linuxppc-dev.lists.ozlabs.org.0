Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBA83250F7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Feb 2021 14:54:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DmZ6H4lj6z3fSl
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Feb 2021 00:54:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=mpNscLPS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102e;
 helo=mail-pj1-x102e.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=mpNscLPS; dkim-atps=neutral
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DmYyb2hM3z3cjc
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Feb 2021 00:48:07 +1100 (AEDT)
Received: by mail-pj1-x102e.google.com with SMTP id c19so3529380pjq.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Feb 2021 05:48:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q3MbbxrELn+TwojMnsr2Dw3fkqeHU+FUDlPMBwDlaCY=;
 b=mpNscLPSdgLzWsUAfE8EpRXRIM51BpyecMaKWajFv1yfnBmWJ17F6txO5IPVjUJ74L
 r5jJWJYgkwBGx10hHRj2advd8SPjai+3tWj3jnG48SQiYw/bHkdJ9czxHN8BWWnZjOI7
 7mfMQ/xwvhiz8ckx974mi2t3H1AhMbmjYI+XXPpXkt8OY6hz+g+dnCRT1MjHu5NvIy/v
 WTM4NrDFeV/p3R/4FF912bryse8S5F6W1CUXn/BKF5hnuUHMY0vcga/zvSXtyTfyWZDZ
 UguZpSvU4Q2Pdys1uOaG6Hf0aQxhBJp8qoqJJhGhNp500fCOdNpdYP3N1NKzOmt7P5GH
 md6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q3MbbxrELn+TwojMnsr2Dw3fkqeHU+FUDlPMBwDlaCY=;
 b=e0TO1lRVka2TxTDrfeOoAmcfumoHI/RJf6T/hHLjZMsvyzDheca7Kq2F906R3i+O2I
 ubCNIQkLO3oeJEKj8ugk7oiGYqZm9qWDQpfFW5eLCjNk+E3r56zw80x5+4a8VMfFk1LV
 gM/xk51tq01lBrE6EBIqgJgkc6OtqvdsE7baG/1+Cp9Uy63tF/pwsrfzZAkS0yyZQdZF
 Q6Ery7YEfShH5UYMdsrZ1BoaPTPy9kt3TyWg0xG2m1smLS0SVpLUzj4TJUNU+GrjkNow
 MqPSv+ivg86Nr+8IB0kaO5Um88LmGZBrwW+pULmsy/7pW2xDpxq6S0nxYlH4mUFL6f+2
 RZ2w==
X-Gm-Message-State: AOAM530PPjRvO4mPnxS7m0rHlunZVL29M1p2/kIPsc40DQkAQcrybmrB
 ITHUfQKAUNXXjkJuiqslWWI=
X-Google-Smtp-Source: ABdhPJxmjVYicu31+Ovtl+bVMxJEtCuzruCMimQ9v0cIdWxEQisZVMGiS7vRy4ElZuhl5mATjEWgpA==
X-Received: by 2002:a17:90a:3804:: with SMTP id
 w4mr3468161pjb.189.1614260885095; 
 Thu, 25 Feb 2021 05:48:05 -0800 (PST)
Received: from bobo.ibm.com (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id a9sm5925868pjq.17.2021.02.25.05.48.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 05:48:04 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v2 18/37] KVM: PPC: Book3S HV P9: Use large decrementer for
 HDEC
Date: Thu, 25 Feb 2021 23:46:33 +1000
Message-Id: <20210225134652.2127648-19-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210225134652.2127648-1-npiggin@gmail.com>
References: <20210225134652.2127648-1-npiggin@gmail.com>
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

On processors that don't suppress the HDEC exceptions when LPCR[HDICE]=0,
this could help reduce needless guest exits due to leftover exceptions on
entering the guest.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/time.h | 2 ++
 arch/powerpc/kvm/book3s_hv.c    | 3 ++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/time.h b/arch/powerpc/include/asm/time.h
index 8dd3cdb25338..68d94711811e 100644
--- a/arch/powerpc/include/asm/time.h
+++ b/arch/powerpc/include/asm/time.h
@@ -18,6 +18,8 @@
 #include <asm/vdso/timebase.h>
 
 /* time.c */
+extern u64 decrementer_max;
+
 extern unsigned long tb_ticks_per_jiffy;
 extern unsigned long tb_ticks_per_usec;
 extern unsigned long tb_ticks_per_sec;
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 63cc92c45c5d..913582bd848f 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3609,7 +3609,8 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_vcpu *vcpu, u64 time_limit,
 		vc->tb_offset_applied = 0;
 	}
 
-	mtspr(SPRN_HDEC, 0x7fffffff);
+	/* HDEC must be at least as large as DEC, so decrementer_max fits */
+	mtspr(SPRN_HDEC, decrementer_max);
 
 	switch_mmu_to_host_radix(kvm, host_pidr);
 
-- 
2.23.0

