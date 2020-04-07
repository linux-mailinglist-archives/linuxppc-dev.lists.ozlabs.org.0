Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF5B1A0683
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 07:23:32 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48xG5s1X85zDqlV
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 15:23:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=CF+jOCQ/; dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48xFzw2Rl1zDqdr
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Apr 2020 15:18:20 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id m13so1162544pgd.8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Apr 2020 22:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZtY2WfL1JPGj+fO1hNVGxKtL2inTNkP2M7UMo8aWaBA=;
 b=CF+jOCQ/+HZxkyS7J/G8FJ/nAMvhwHda6yqjcGxxRMRRexgpMJ1tfBxW7giReBvtl4
 n7R00xdllU9owZvI/+Gx2SdNJhRdOAdmhMIsSSjYaXZb17JsoVexf/fa41Hkd4mMaAm3
 J+MgI6/ZZYtLn9V5mQB5JBb9OFs4OgiQqoHSe31Y/K6EgrbwT8442IfWevlrg2FV/BGh
 +IN1lLj1H+qdxXsnZ6qsoROKzKkmGFrDDc8Nic4kcFyIOhNEh4mfKENLoWWBlUNWfBBB
 GYYgyWoqhrP6KknFMnt/BUVqNBk3jCzPoibeQrfwO61YuJlRp/q/Jf1aRRt1cVaiaT51
 Ffwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZtY2WfL1JPGj+fO1hNVGxKtL2inTNkP2M7UMo8aWaBA=;
 b=KVEckjG06JUduC6vn4sZohOhIko5oN9oJFVscsXnVvBG+nu4DAlk+rsRK+O1/kSds9
 OCwTvS724e56q1ha2r7z+e6Mu3DEvwXpOpEzf0Grrjaljb1bmQYkCCH5LchW0wAkwNLv
 bCSy6ZkrnGg+9ZdCwqUnDmiuFAqGbGRRiqbN7tMbxKXlzOYZYvDHUJdGk7CNP5QZxYDj
 EceWgh3zjsIlFLmgDR1unQPN2LMEdqpEMEjLnN+cDFmT1yUdvmP/fusRYFwB1jeuQz9J
 dZVDpuiS1dIsI6izyMgJ07L0/yd5en3ZFykl+3Hv1kJKkNWdjgiLAdjVVO89mglsQ1rE
 3RkA==
X-Gm-Message-State: AGi0PubRyVKsHdg1hAe37KSqfIUplhdt5vyRbNIngbbM6KatodsnxqSK
 a1VGnqRifg48PW37GlP/vhDTCzcM
X-Google-Smtp-Source: APiQypJT6EEU6sHKr7NKXUOvYB7rO/79wG4Eo8LovE6m4hWV8C1JU7q/X67Flln7G8+FLdIymrqbmg==
X-Received: by 2002:a63:8848:: with SMTP id l69mr326293pgd.288.1586236698323; 
 Mon, 06 Apr 2020 22:18:18 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (60-241-117-97.tpgi.com.au. [60.241.117.97])
 by smtp.gmail.com with ESMTPSA id y17sm12866486pfl.104.2020.04.06.22.18.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 22:18:17 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 02/15] powerpc/64s/exceptions: Fix in_mce accounting in
 unrecoverable path
Date: Tue,  7 Apr 2020 15:16:23 +1000
Message-Id: <20200407051636.648369-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200407051636.648369-1-npiggin@gmail.com>
References: <20200407051636.648369-1-npiggin@gmail.com>
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
 Ganesh Goudar <ganeshgr@linux.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Acked-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index bbf3109c5cba..3322000316ab 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1267,6 +1267,10 @@ END_FTR_SECTION_IFSET(CPU_FTR_HVMODE)
 	andc	r10,r10,r3
 	mtmsrd	r10
 
+	lhz	r12,PACA_IN_MCE(r13)
+	subi	r12,r12,1
+	sth	r12,PACA_IN_MCE(r13)
+
 	/* Invoke machine_check_exception to print MCE event and panic. */
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	machine_check_exception
-- 
2.23.0

