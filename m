Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 84863309575
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Jan 2021 14:43:56 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DSb5j1ks5zDr9H
	for <lists+linuxppc-dev@lfdr.de>; Sun, 31 Jan 2021 00:43:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636;
 helo=mail-pl1-x636.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Iym7L/0y; dkim-atps=neutral
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DSZLJ0NMCzDrTs
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 31 Jan 2021 00:09:43 +1100 (AEDT)
Received: by mail-pl1-x636.google.com with SMTP id s15so7086714plr.9
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Jan 2021 05:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lGZQY3HVe4NvG09B1IJ+kSm0pVYkFrtpHeArmNI2jx4=;
 b=Iym7L/0ytfuAHL1EK7VG82S+73OkyilI3HrQa6jttkgy0rl+VnH9ydnOZJiRI0FT+Y
 45owzLHNtgUJn26nYeFN5v1H32AAawQcfbFf1vdVUd8+B+QDMvctqdlRo71enCw+5yb8
 u9CGLpQ+CR4L05ib9ahdOfMgYZRFfVKXTJI0O1AZvvWTTpefoJAGCTyrdL0+vPJ0rxhM
 9/dCDj7VtVxcPMCBVFgU6JGHyH9EwIjRd3/kiH4SLO9z3iXs0iv03P7Wqjzetg3V7np5
 9jFwM4bgVt7ErzOHhZonO3hy2VezNV8imK85UGHkVWlJv+aCOUCHVQZuHGminnTH6yPI
 TgiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lGZQY3HVe4NvG09B1IJ+kSm0pVYkFrtpHeArmNI2jx4=;
 b=AdFkB4Wy4nqwTGaph7BTc2SWB0rO2wBOl7ZHx5B5sSrceKbg6vecRF9tC+x56v9OAC
 tne1t/qViwYCQIFdTbkLI0IZlV1/HkbpoSskPbICuEh9khtKgTNgC19XAr54lLi5fgLw
 zFzmfLEiPKk0u4fyPW2jRs8FbtTK0LzJymiBJz3lfi/Ze8emITPW4AHZ8v0JHlm+5xNP
 9slJOjsQbohxKaR1B3/ilvvWlr47GIYiDFyILCkVzf3emwtzIW5lOKBz/uwoF6cAmg0F
 hPGPrtCaY4yQ2mlhZ96QUQLCOJLiVN3EKCvO8eQ+1U8jhB94mmsEfFSBK1tIW/LUEsPD
 DjCg==
X-Gm-Message-State: AOAM533vMzFuqIyGAWf+7Lz97yW5uxfw2/shlVvGf+Oiob8aX96/8GHA
 WCS/lgFzvBV9ejxP0loTJ5jnRW+jUE8=
X-Google-Smtp-Source: ABdhPJw3bCKzJmmQNH4KoanmlJJyqtUt8bV6jDsgN2vpO+eZ1E3AMUL/pagaWNV0FU9foGYqk3/9Ew==
X-Received: by 2002:a17:902:47:b029:de:c58e:8257 with SMTP id
 65-20020a1709020047b02900dec58e8257mr9733767pla.61.1612012180910; 
 Sat, 30 Jan 2021 05:09:40 -0800 (PST)
Received: from bobo.ozlabs.ibm.com
 (192.156.221.203.dial.dynamic.acc50-nort-cbr.comindico.com.au.
 [203.221.156.192])
 by smtp.gmail.com with ESMTPSA id y16sm12102240pgg.20.2021.01.30.05.09.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Jan 2021 05:09:40 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v7 10/42] powerpc/32: transfer can avoid saving r4/r5 over
 trace call
Date: Sat, 30 Jan 2021 23:08:20 +1000
Message-Id: <20210130130852.2952424-11-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210130130852.2952424-1-npiggin@gmail.com>
References: <20210130130852.2952424-1-npiggin@gmail.com>
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
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Now that handlers get all registers from pt_regs, r4 and r5 are no
longer live here and may be clobbered.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/entry_32.S | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index 238eacfda7b0..d6ea3f2d6cc0 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -276,8 +276,7 @@ reenable_mmu:
 	 * We save a bunch of GPRs,
 	 * r3 can be different from GPR3(r1) at this point, r9 and r11
 	 * contains the old MSR and handler address respectively,
-	 * r4 & r5 can contain page fault arguments that need to be passed
-	 * along as well. r0, r6-r8, r12, CCR, CTR, XER etc... are left
+	 * r0, r4-r8, r12, CCR, CTR, XER etc... are left
 	 * clobbered as they aren't useful past this point.
 	 */
 
@@ -285,15 +284,11 @@ reenable_mmu:
 	stw	r9,8(r1)
 	stw	r11,12(r1)
 	stw	r3,16(r1)
-	stw	r4,20(r1)
-	stw	r5,24(r1)
 
 	/* If we are disabling interrupts (normal case), simply log it with
 	 * lockdep
 	 */
 1:	bl	trace_hardirqs_off
-	lwz	r5,24(r1)
-	lwz	r4,20(r1)
 	lwz	r3,16(r1)
 	lwz	r11,12(r1)
 	lwz	r9,8(r1)
-- 
2.23.0

