Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EFEE5FDCF4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Oct 2022 17:18:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MpCpY0NYjz30M2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Oct 2022 02:18:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=IIVQVzdo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52c; helo=mail-pg1-x52c.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=IIVQVzdo;
	dkim-atps=neutral
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MpCmY14dLz2xKV
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Oct 2022 02:16:59 +1100 (AEDT)
Received: by mail-pg1-x52c.google.com with SMTP id bh13so1826537pgb.4
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Oct 2022 08:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=srkRHuKuwv7oYoU04+9sNF92tvqVj+0dbPbJHoTVAOQ=;
        b=IIVQVzdo2Ul8QJpo4aEk3FXWuOwlkd7qwJi5tAQ7AeYgU1POMxbBF3m3sJzcrI9lQf
         AV4bOfOpm9vRNdZRrSJ+x1Qm4vsApsZ1y6rwyrODbfaXwCXd1qlekUvFpdpkmCNYKH9K
         3HS0aUGnIfdUJ8LQMabURu45nbtS3ROLoVs8AtSy6rdVB390kV6F+XQnlCP5lniU6hKz
         db8ro/yMnYAo+l7n7hG7De1RzPJfNQOo+s3KI9Sa0sKck+zod7ABzHF0xDzj9vqXG4Qj
         MqxtK71uaJ1ECC1Lo8NOPRO/XHMiQg+DGHfHnZnkvwp2Tj+IwdFN/on2Pew9DAVKOB/t
         G73g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=srkRHuKuwv7oYoU04+9sNF92tvqVj+0dbPbJHoTVAOQ=;
        b=jhhAc/5zbTIFlxSjdEYgmiVNkagi9h5geTU3HTIazh8jK1xW1wjxsJAFFMP0ec+JRm
         p/yNwyzNBPPOETBvewGxMIv2tRC2QpW4VavUoPukfLe9H0coC2FmC/e/3xSsjBm8UPsm
         K2G3PEjc9cZrH3nBevpNAE0S0Xlw+rNmNv+R0aEKLVEkHFmskPa6jyWwA1Jl4DLkffRl
         mNEsORdMCTNUzYS8aydTF+vo1NIiGuDJ4xMDiXWppAeGCXuoDXkyfgznj8p1teMSCBcg
         xcY6NQWZmaRftMbavtgcXpRuUButM7tvDRRsbyQaX+XgzwNKKodQH/xAKJNJaH4doV2+
         cTJg==
X-Gm-Message-State: ACrzQf267YZbWwd/AOGOYZH2dyGMFiUxvpTapXg2ulrcw3/V09polxNt
	z/WSGboES1rvYUzyO0xmR+lyQn32bII=
X-Google-Smtp-Source: AMsMyM4Sh6/GrAr3NftCforVvDZnN0fsbhGReVBW8G1NdlGm8sqzOw4j+7wiE7KGEFRtSzE5qe8RjQ==
X-Received: by 2002:a65:6e0e:0:b0:434:59e0:27d3 with SMTP id bd14-20020a656e0e000000b0043459e027d3mr299066pgb.185.1665674215424;
        Thu, 13 Oct 2022 08:16:55 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (61-68-62-130.tpgi.com.au. [61.68.62.130])
        by smtp.gmail.com with ESMTPSA id i15-20020a056a00224f00b00543a098a6ffsm2070977pfu.212.2022.10.13.08.16.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Oct 2022 08:16:54 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/3] powerpc/64s: Disable preemption in hash lazy mmu mode
Date: Fri, 14 Oct 2022 01:16:45 +1000
Message-Id: <20221013151647.1857994-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
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
Cc: Guenter Roeck <linux@roeck-us.net>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

apply_to_page_range on kernel pages does not disable preemption, which
is a requirement for hash's lazy mmu mode, which keeps track of the
TLBs to flush with a per-cpu array.

Reported-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/book3s/64/tlbflush-hash.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
index fab8332fe1ad..751921f6db46 100644
--- a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
+++ b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
@@ -32,6 +32,11 @@ static inline void arch_enter_lazy_mmu_mode(void)
 
 	if (radix_enabled())
 		return;
+	/*
+	 * apply_to_page_range can call us this preempt enabled when
+	 * operating on kernel page tables.
+	 */
+	preempt_disable();
 	batch = this_cpu_ptr(&ppc64_tlb_batch);
 	batch->active = 1;
 }
@@ -47,6 +52,7 @@ static inline void arch_leave_lazy_mmu_mode(void)
 	if (batch->index)
 		__flush_tlb_pending(batch);
 	batch->active = 0;
+	preempt_enable();
 }
 
 #define arch_flush_lazy_mmu_mode()      do {} while (0)
-- 
2.37.2

