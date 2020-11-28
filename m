Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6B82C6F42
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Nov 2020 08:18:57 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CjjXY4dmKzF0n4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Nov 2020 18:18:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Fpn8G7kd; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CjjHy2ZfhzDsxN
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Nov 2020 18:07:58 +1100 (AEDT)
Received: by mail-pl1-x642.google.com with SMTP id bj5so3710322plb.4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Nov 2020 23:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wFKWODpGu/PubPvfRrSmS5+gQNDkwPMyPfZCkrp8It0=;
 b=Fpn8G7kdWEIhdOiroQ//FL7vCrlUPWHCFn7U/aQveam1mvDa931KJrceH+zmbT162l
 7cWVgUtaLyhr/Bv/iJ21MWBLwllY0eIcWM+64Eeng/LoORDEx2dkEK9GzwK4aSc68fZV
 YIDL5sEn/nYaTwymCIxiJzia42gVr2s4MrcuI7ezX57k7Y6pjpeCimXu/bx69hVnghI0
 am3pOB3hyaviYAWmXhDV9nlevGoXlEbHnXyf8kUS2m8tRJaggumx+6ZyVtrQFVYk3QCg
 y5QL/D3RhP0EqKQaTA8Um3iGzZYx7fBf3UTNwCpheXvfe2vhGU96PRoUTo+DXcOZCLCr
 nsKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wFKWODpGu/PubPvfRrSmS5+gQNDkwPMyPfZCkrp8It0=;
 b=FSFwtsKDcoa2UBMH8EY1fgu8o+UnjaDFMQmTyqbsUGBTvS4Mu64fxM1XqFV6dnIvPj
 nikKHDTKYlGDmIvdmEdgXJ/vegw/R36+c6d8MKeaUf2DZfo/3IF3jAckwXzV8tWGHC3n
 0A4620cCiDazir+lPiYcyNP34YMGn9p0nvncLSzWJ8EH9tOqTNgFjPUMxlcLcp9rIyN2
 3+N6EY3vpluzxpeQpmsnn5Z84uy/HtHUpvj5LnT6vnjyi+be3MwKRdhCL2MaCmO30E4M
 L5voUyf8H0HjSZvcZN8Fmvevc9bIlvJ83+LeolqBPyNpJ3SiGOdiBp4+Hv/P0ZqWR6aG
 IR9Q==
X-Gm-Message-State: AOAM532DNkX8MUJANp0y4Lji+Cvns9F3oMdcHwg3marH/eJZunDsGBqk
 mo9+k0Gia6SxdOiraTv3XCRxzsLVDj8=
X-Google-Smtp-Source: ABdhPJyWNXOhiyXRWScL1SC7/bU+CgYAQJVy2HytEDXfzkvUbvMXuNycwtUOD6sQzoClX0UwwJpUgg==
X-Received: by 2002:a17:902:8691:b029:d7:e0f9:b1b with SMTP id
 g17-20020a1709028691b02900d7e0f90b1bmr10451568plo.37.1606547275503; 
 Fri, 27 Nov 2020 23:07:55 -0800 (PST)
Received: from bobo.ibm.com (193-116-103-132.tpgi.com.au. [193.116.103.132])
 by smtp.gmail.com with ESMTPSA id e31sm9087329pgb.16.2020.11.27.23.07.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2020 23:07:54 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 6/8] powerpc/64s/pseries: Add ERAT specific machine check
 handler
Date: Sat, 28 Nov 2020 17:07:26 +1000
Message-Id: <20201128070728.825934-7-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201128070728.825934-1-npiggin@gmail.com>
References: <20201128070728.825934-1-npiggin@gmail.com>
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
Cc: kvm-ppc@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Don't treat ERAT MCEs as SLB, don't save the SLB and use a specific
ERAT flush to recover it.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/mce.h       | 1 +
 arch/powerpc/kernel/mce_power.c      | 2 +-
 arch/powerpc/platforms/pseries/ras.c | 5 ++++-
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/mce.h b/arch/powerpc/include/asm/mce.h
index 89aa8248a57d..e6c27ae843dc 100644
--- a/arch/powerpc/include/asm/mce.h
+++ b/arch/powerpc/include/asm/mce.h
@@ -228,6 +228,7 @@ int mce_register_notifier(struct notifier_block *nb);
 int mce_unregister_notifier(struct notifier_block *nb);
 #ifdef CONFIG_PPC_BOOK3S_64
 void flush_and_reload_slb(void);
+void flush_erat(void);
 long __machine_check_early_realmode_p7(struct pt_regs *regs);
 long __machine_check_early_realmode_p8(struct pt_regs *regs);
 long __machine_check_early_realmode_p9(struct pt_regs *regs);
diff --git a/arch/powerpc/kernel/mce_power.c b/arch/powerpc/kernel/mce_power.c
index 1372ce3f7bdd..667104d4c455 100644
--- a/arch/powerpc/kernel/mce_power.c
+++ b/arch/powerpc/kernel/mce_power.c
@@ -97,7 +97,7 @@ void flush_and_reload_slb(void)
 }
 #endif
 
-static void flush_erat(void)
+void flush_erat(void)
 {
 #ifdef CONFIG_PPC_BOOK3S_64
 	if (!early_cpu_has_feature(CPU_FTR_ARCH_300)) {
diff --git a/arch/powerpc/platforms/pseries/ras.c b/arch/powerpc/platforms/pseries/ras.c
index b2b245b25edb..149cec2212e6 100644
--- a/arch/powerpc/platforms/pseries/ras.c
+++ b/arch/powerpc/platforms/pseries/ras.c
@@ -526,8 +526,11 @@ static int mce_handle_err_realmode(int disposition, u8 error_type)
 #ifdef CONFIG_PPC_BOOK3S_64
 	if (disposition == RTAS_DISP_NOT_RECOVERED) {
 		switch (error_type) {
-		case	MC_ERROR_TYPE_SLB:
 		case	MC_ERROR_TYPE_ERAT:
+			flush_erat();
+			disposition = RTAS_DISP_FULLY_RECOVERED;
+			break;
+		case	MC_ERROR_TYPE_SLB:
 			/*
 			 * Store the old slb content in paca before flushing.
 			 * Print this when we go to virtual mode.
-- 
2.23.0

