Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 536BA2A81BF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Nov 2020 16:01:59 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CRmvS4dB3zDqyX
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Nov 2020 02:01:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1041;
 helo=mail-pj1-x1041.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=nzjz8qxB; dkim-atps=neutral
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CRmJd0zC7zDqyw
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Nov 2020 01:35:12 +1100 (AEDT)
Received: by mail-pj1-x1041.google.com with SMTP id k2so170000pjg.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Nov 2020 06:35:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hQKc3mZddlBjFFau4PhrTbdX/hPqrfOoQCDlvpXRRi0=;
 b=nzjz8qxBPjnKHNiNyYo0Z7wIT6RUWeTeMGanjqE9HJUOk+zR6nN0SkTyfU/X34kBHZ
 w/aLnBuoPNFe/9AkJxdbnO70BLHoKI/IH3JqT1xQWICv2qI6iX68XHSibrk45mJZD/MT
 ke9x7ePqilSuXR2FcUSW+NQdrMe4FjzxZvPWlBriFPAR5l3O3xR4dP3BRpEazFhRZiuD
 UGjdPshvhwX1VjTUoeDu+MY/kWJOAAXC6J5qZVUTV5IWh8HuwmNivtk+GakT9YaHtxAB
 1gvpfbAsyYtbrHUrVLTD6/kddotpCvS3BomyvzlALAKPnkQgXb6eR5VdJSUgWM7Szu7e
 KqTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hQKc3mZddlBjFFau4PhrTbdX/hPqrfOoQCDlvpXRRi0=;
 b=a57vBuAAwuuXsFoBLTUSxnxo5YnN6Y5gjFQ6lUXH2Dxox5hkE/6KM64r1WhnsCFHT9
 /aYPkQUPPQux+bSDFMKI1YYkVX/0Ffno1ugIsiaM2R89W5U1JKyWZWkuFMaPjEC9nqaT
 S8rYRTm//814u/Nz7JrBeRyvjpK9NRdqlSW29DkS5QNzvXMecVPHB1mpd5NctDj1iljk
 oEQNgylMZLjuptfsA0npIWc9q66OSlCn6QeLJN86iuTvQH0GjPZDph0iePOYxUL6gcJC
 +14nNlun0yz9dfGCe0QpPaqHeGV/QLI8jCqR/eCMD9LCgMRjQ/Z1zocP9/uWVUqksbTY
 4ULQ==
X-Gm-Message-State: AOAM530O+pUD4UwGnLRMAtIEjDd2KH8uRBzMo7Rg9Xx56jLckkv/XGQl
 pgLIxu7d2HdQlFC3FIGwz/NA2dhVI7zPsA==
X-Google-Smtp-Source: ABdhPJz6m3KE6aYQnIDTvT3mo9xHrM6MxyPETHE4bVKvk/vqKs3UkKGkoDNuYNG4D1KLujc97kZcYA==
X-Received: by 2002:a17:902:6b41:b029:d6:d063:f75 with SMTP id
 g1-20020a1709026b41b02900d6d0630f75mr2619941plt.39.1604586909445; 
 Thu, 05 Nov 2020 06:35:09 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (27-32-36-31.tpgi.com.au. [27.32.36.31])
 by smtp.gmail.com with ESMTPSA id n15sm2876771pgt.75.2020.11.05.06.35.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 06:35:08 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 09/18] powerpc/64: add context tracking to asynchronous
 interrupts
Date: Fri,  6 Nov 2020 00:34:22 +1000
Message-Id: <20201105143431.1874789-10-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201105143431.1874789-1-npiggin@gmail.com>
References: <20201105143431.1874789-1-npiggin@gmail.com>
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

Previously context tracking was not done for asynchronous interrupts,
(those that run in interrupt context), and if those would cause a
reschedule when they exit, then scheduling functions (schedule_user,
preempt_schedule_irq) call exception_enter/exit to fix this up and
exit user context.

This is a hack we would like to get away from, so do context tracking
for asynchronous interrupts too.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/interrupt.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index 62a362915adc..55f544dbf434 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -28,10 +28,12 @@ static inline void interrupt_exit_prepare(struct pt_regs *regs, struct interrupt
 
 static inline void interrupt_async_enter_prepare(struct pt_regs *regs, struct interrupt_state *state)
 {
+	interrupt_enter_prepare(regs, state);
 }
 
 static inline void interrupt_async_exit_prepare(struct pt_regs *regs, struct interrupt_state *state)
 {
+	interrupt_exit_prepare(regs, state);
 }
 
 struct interrupt_nmi_state {
-- 
2.23.0

