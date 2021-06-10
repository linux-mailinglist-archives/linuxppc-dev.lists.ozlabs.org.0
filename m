Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2DB3A2C89
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Jun 2021 15:10:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G148q0kCdz3c5d
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Jun 2021 23:10:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=FKdGz5Yd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102f;
 helo=mail-pj1-x102f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=FKdGz5Yd; dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G147m4dxKz3079
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Jun 2021 23:09:39 +1000 (AEST)
Received: by mail-pj1-x102f.google.com with SMTP id g4so3654287pjk.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Jun 2021 06:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KNM7LjNlG7D3yR4PH6b+cf+7c/bYLg6X4ID7/qjSGq4=;
 b=FKdGz5YdI9bOCvfvQxm5wCEvjQRBJkZzuqLjhxHxQMPb+LzxfBHhxOIBy3gSWICN1e
 l/YG8+K9xbodjRjkv6BEozDGyqDO8y1HEZpXT6MnbLLjTAM80oYFLSi16p10xbUGRb5f
 8FukY5Lw0U6zDoVYjo4YRaDTaEKQH08Cocq+7LUV5WNR8okHjjSqx8WNQdAbd6Ky2FAa
 HM/Iop7vlXKVUCSBHDITSkwR6TNTPiJpNXNmIVBZN2Ptp6FoodN9VQglwXZAj5Ln5gZ7
 qOpApi1t6iBKATVbsp3BCS8qqt5E96wantlNbaXQ9RpvUPWT9aKXiMx+wL8hvYhmpI6O
 xDVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KNM7LjNlG7D3yR4PH6b+cf+7c/bYLg6X4ID7/qjSGq4=;
 b=q+mJEPDayqtd6ISqxOcJwwNqc6qm2aCgau7OP2iwWORIXpnJXteZ/FImLS8gXY29FL
 HBvF0zSwDQYPUbsLISUOFPV8cldtcuvu3+DReIUiK5fRwd5eeJYUR/hUCZZaTtaWNV46
 ybserjCO5rA2cSFQyOJucrF97dzCqZSzYWrH0UkTdXc9mc4iRMQL+hsSDDQZJ0FpEomZ
 dhr73wkYti8FP2QN647rbFJ4KNIK992fHAUp8fXstETvpBS4wKgJcRL1AzcCQpJCwPut
 KtEzLV2D+UlTCLV2wyxg2Dl1jdV1J8M2sjRS6tXdHwBq+gwEhfjd65lW5BWPTVNvH7Xh
 eojQ==
X-Gm-Message-State: AOAM530yTNjDgxI6vk+jEFTBGga+hDgQRMdRRdn50HoQk4UKHwD0TaFD
 fYyNVhhWHH7gqByHGvd6fRxarG6By+M=
X-Google-Smtp-Source: ABdhPJw3diJBPB4XgLk0LPyp9Nn58m4zzL2E4DTJevcRJTUbfd/JZ0WSZD48dtHx7oxFD3MLgEw6CQ==
X-Received: by 2002:a17:90b:3a8c:: with SMTP id
 om12mr3376065pjb.103.1623330575825; 
 Thu, 10 Jun 2021 06:09:35 -0700 (PDT)
Received: from bobo.ibm.com (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id bv3sm7012173pjb.1.2021.06.10.06.09.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 06:09:35 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 01/11] powerpc: remove interrupt exit helpers unused
 argument
Date: Thu, 10 Jun 2021 23:09:11 +1000
Message-Id: <20210610130921.706938-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210610130921.706938-1-npiggin@gmail.com>
References: <20210610130921.706938-1-npiggin@gmail.com>
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

The msr argument is not used, remove it.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/asm-prototypes.h | 4 ++--
 arch/powerpc/kernel/interrupt.c           | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/asm-prototypes.h b/arch/powerpc/include/asm/asm-prototypes.h
index 1c7b75834e04..95492655462e 100644
--- a/arch/powerpc/include/asm/asm-prototypes.h
+++ b/arch/powerpc/include/asm/asm-prototypes.h
@@ -71,8 +71,8 @@ void __init machine_init(u64 dt_ptr);
 #endif
 long system_call_exception(long r3, long r4, long r5, long r6, long r7, long r8, unsigned long r0, struct pt_regs *regs);
 notrace unsigned long syscall_exit_prepare(unsigned long r3, struct pt_regs *regs, long scv);
-notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs, unsigned long msr);
-notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs, unsigned long msr);
+notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs);
+notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs);
 
 long ppc_fadvise64_64(int fd, int advice, u32 offset_high, u32 offset_low,
 		      u32 len_high, u32 len_low);
diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
index e0938ba298f2..38ae7057d6c2 100644
--- a/arch/powerpc/kernel/interrupt.c
+++ b/arch/powerpc/kernel/interrupt.c
@@ -352,7 +352,7 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
 	return ret;
 }
 
-notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs, unsigned long msr)
+notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs)
 {
 	unsigned long ti_flags;
 	unsigned long flags;
@@ -431,7 +431,7 @@ notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs, unsigned
 
 void preempt_schedule_irq(void);
 
-notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs, unsigned long msr)
+notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs)
 {
 	unsigned long flags;
 	unsigned long ret = 0;
-- 
2.23.0

