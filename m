Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C50A192669
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Mar 2020 11:59:30 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48nQ9V3WjlzDqLL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Mar 2020 21:59:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=etw8z79e; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48nPdn0NBRzDqVT
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Mar 2020 21:35:24 +1100 (AEDT)
Received: by mail-pg1-x542.google.com with SMTP id h8so954052pgs.9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Mar 2020 03:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bszfcMFD4WTY8Bdq93sjyw77UEZjM/Uiw2Bs6VCx7Bc=;
 b=etw8z79eVnspKEZuxDpIiSgm2+sgLLsq3QrGLluakQbhM/lOdPUaI5BVhjwic2gZL/
 vpPzVPEW23CLbeKeOq9RXMDbld+TQq301QktFkQZDw6LQOFZerJ7/CylvWDBG3SaBwo9
 +rm/fBbYKtGotchywL6nc9s33uB+IPgDu2JMMrid3OMw6IOj+Bpo0BLp1Ae0Mf8UwYla
 OMIcmGUn0chC4ChBD1qILU7kNo/Bz2lfFi22HVQQCaFjHvqcNWr9WrzmLHs85HXPwc+L
 5fGMNxzMn6y4hS0Hcn25zgyfCfjMpcY04VhHZk1t/QwLVngwLCJLlkMQJ8u7+hZ1aG8E
 iPog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bszfcMFD4WTY8Bdq93sjyw77UEZjM/Uiw2Bs6VCx7Bc=;
 b=AYN0H+BYYSbdJy84vfDdDWFMjMzOesE7waWED1FzqL7VDMLTsmvevC5BRTnp8W7MZM
 HpOEHzh+24ycz82VlHrjXb2kXmFMiZzy710wr4cu2xBLVQa8D6iLZqthYF5Bvl0ynBa9
 rqzzMGj4rfkdsKklZ9mfziKs47qyl0wWjsd3pRjcAu/J4WUtRhI/nbRM0KuhLr0ujRRC
 LN3HFCgZJW4uHJheU28TjznjlSh42exxmkHeMS3VpliTNlmPJdynqHYxS05sijScqv6c
 SECt80CaMabk75kjI7aIVwKlfCWtGrvgneSD6qO3/Jxj73cPOcoQ9op+EM23tCuHMoF6
 NEYA==
X-Gm-Message-State: ANhLgQ1BG1PSPnfSnus+wfWzusKH7uQyohMwTWv++RuUOrDT5YWUnMMF
 KyUuId+H3fFJ22/Fe10TIRHKzATi
X-Google-Smtp-Source: ADFU+vsDbDB+KisHffSb1zFablLHXKCLEJJWL5CnzsyMma6XjnLL9bC9T6LGOY9bz4Tc+so/L0J5Ug==
X-Received: by 2002:a62:7dd7:: with SMTP id y206mr2839760pfc.79.1585132521995; 
 Wed, 25 Mar 2020 03:35:21 -0700 (PDT)
Received: from bobo.ibm.com (14-202-190-183.tpgi.com.au. [14.202.190.183])
 by smtp.gmail.com with ESMTPSA id b9sm16549701pgi.75.2020.03.25.03.35.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Mar 2020 03:35:21 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 11/12] powerpc/64s: machine check do not trace real-mode
 handler
Date: Wed, 25 Mar 2020 20:34:09 +1000
Message-Id: <20200325103410.157573-12-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200325103410.157573-1-npiggin@gmail.com>
References: <20200325103410.157573-1-npiggin@gmail.com>
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
Cc: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Rather than notrace annotations throughout a significant part of the
machine check code across kernel/ pseries/ and powernv/ which can
easily be broken and is infrequently tested, use paca->ftrace_enabled
to blanket-disable tracing of the real-mode non-maskable handler.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/mce.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/mce.c b/arch/powerpc/kernel/mce.c
index c1684be0d8b7..36e99adb8710 100644
--- a/arch/powerpc/kernel/mce.c
+++ b/arch/powerpc/kernel/mce.c
@@ -557,10 +557,13 @@ EXPORT_SYMBOL_GPL(machine_check_print_event_info);
  *
  * regs->nip and regs->msr contains srr0 and ssr1.
  */
-long machine_check_early(struct pt_regs *regs)
+long notrace machine_check_early(struct pt_regs *regs)
 {
 	long handled = 0;
 	bool nested = in_nmi();
+	u8 ftrace_enabled = local_paca->ftrace_enabled;
+
+	local_paca->ftrace_enabled = 0;
 	if (!nested)
 		nmi_enter();
 
@@ -574,6 +577,7 @@ long machine_check_early(struct pt_regs *regs)
 
 	if (!nested)
 		nmi_exit();
+	local_paca->ftrace_enabled = ftrace_enabled;
 
 	return handled;
 }
-- 
2.23.0

