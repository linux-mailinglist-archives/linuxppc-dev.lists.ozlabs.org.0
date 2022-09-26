Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C90055E98E3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 07:44:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MbWsc3y1Qz3c7h
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 15:44:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=O632LASm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52c; helo=mail-pg1-x52c.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=O632LASm;
	dkim-atps=neutral
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MbWrP0vSFz30NN
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 15:43:16 +1000 (AEST)
Received: by mail-pg1-x52c.google.com with SMTP id bh13so5615492pgb.4
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Sep 2022 22:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=fzntS4WX1i90+5q+5N/CxBpfx0CbxwrAKxxx53N9RCA=;
        b=O632LASm7es0XoQWWnlaV0jZXpOkevUkGYPI7jOzFnzIqJazBTo3/G3nB6GRX+8Tik
         gl5SAgQDRtLsnkSJugpOi6OMmYblbokbxEcWbvtwW73YX8pBsuvNvWvGgY+eQOSpfzej
         /5Tev82QT6TGGXVpgDrG1BFGkZ54pmH7auebBcoaeE0cdGKBZYiKPVjfVPISxv0TH3o6
         VGzK/6TAZNtoAqoouG+31B5wZp0Qq/9+Aw6Hlng1YmVYC/zM7U9xZpBeHNfeyRe6FrDR
         KlEjnZTk324Fu9QvNFiKQxYU1pUCHJjKHz8spBz7tEylrznKtgY6IJwVLaBK2pgScIaI
         CdNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=fzntS4WX1i90+5q+5N/CxBpfx0CbxwrAKxxx53N9RCA=;
        b=4IX89uRIXFkEFPsbBpa4wRAJ0omN9ko+nPatEmhRqH+933eiab9OEGQsQEfkGhacg+
         typpcMZzFIWDq2fj2Hp7ROZRe9bEQMceDSIqBCWbEKyjOxSyb6F2uAjyF2WSIbuXU9yr
         RsHsXKD4NvnrPZ0j+XlAGDEGN8KyjDfDPlvBIFbsluSaKfQDF46n88OalVvw8O5k7lU3
         zBmrKX1gNGfVwUpXMr+BBRg5aHKifyNTLFGYzXO7wRTe9sHc7Dq+YxeyWsQXyDc2kq8O
         R0P4j2VdOypZi+O2S8dHMAplVF61f/8HYZTtGPpLHeOOd3R4IJ/ZnQxE+DqMxLdMpPJz
         mr2w==
X-Gm-Message-State: ACrzQf1p9h+amaBFVkBlVqBOh+wcXaFU1WCgwZ7UDKw3StLrcsbgoqZq
	MyAQ50YFzGihy/Y5QJHGaELJ0yuUNyTrcA==
X-Google-Smtp-Source: AMsMyM4LkAV0CPkzfamxhGm2WsOJB67oHCncfgp8dC/Y3XoesJ5AuWTnLujSB750+/s5Jg/gu8MJ3g==
X-Received: by 2002:a05:6a00:22cb:b0:543:7003:21a1 with SMTP id f11-20020a056a0022cb00b00543700321a1mr21864402pfj.3.1664170994142;
        Sun, 25 Sep 2022 22:43:14 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (203-219-181-119.static.tpgi.com.au. [203.219.181.119])
        by smtp.gmail.com with ESMTPSA id o90-20020a17090a0a6300b002001c9bf22esm5676553pjo.8.2022.09.25.22.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Sep 2022 22:43:13 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 1/7] powerpc/64/interrupt: Fix false warning in context tracking due to idle state
Date: Mon, 26 Sep 2022 15:42:59 +1000
Message-Id: <20220926054305.2671436-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220926054305.2671436-1-npiggin@gmail.com>
References: <20220926054305.2671436-1-npiggin@gmail.com>
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 171476775d32 ("context_tracking: Convert state to atomic_t")
added a CONTEXT_IDLE state which can be encountered by interrupts from
kernel mode in the idle thread, causing a false positive warning.

Fixes: 171476775d32 ("context_tracking: Convert state to atomic_t")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/interrupt.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index 8069dbc4b8d1..b61555e30c7c 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -195,7 +195,8 @@ static inline void interrupt_enter_prepare(struct pt_regs *regs)
 		 * so avoid recursion.
 		 */
 		if (TRAP(regs) != INTERRUPT_PROGRAM) {
-			CT_WARN_ON(ct_state() != CONTEXT_KERNEL);
+			CT_WARN_ON(ct_state() != CONTEXT_KERNEL &&
+				   ct_state() != CONTEXT_IDLE);
 			if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
 				BUG_ON(is_implicit_soft_masked(regs));
 		}
-- 
2.37.2

