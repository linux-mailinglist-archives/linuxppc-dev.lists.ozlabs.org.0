Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F30BD1C6705
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 06:38:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49H3kq1dC5zDr1f
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 14:38:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=VdzIzAx2; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49H2fY0JJLzDqSW
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 May 2020 13:49:56 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id x15so350176pfa.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 05 May 2020 20:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=pl6kn/2Xq4vD/UtQ7fn2/wgdVtAN8yEE21ugAjTtXGU=;
 b=VdzIzAx2iroDhlghI2eiAniXmgiL1zS/9itRw1a6itcRKdsmyKLMqkyfhtaQukssbS
 lJByqjgwYe91zSkchciDK/b+BvOoquY4kr8MnjI7qF9tgTB0SF1X8C/tY1x+55vRQ2w0
 hZGRFpNnQImxk7NJY2t3vXX88cYdFOYbSQrF5gdj5qNF9ZAQkMIBNOPynfIU7ilNhgfj
 DyrhYL2u+WnKdDRHRJTnWtVcrToA28T3YVpa+PjxDl/REulm5FRO/IL9sYGEiQmwNPzY
 942MOwPyaaXhkMSI2+tpzd6bHvA0sp2sMgiRolvcS1U4itFAiVjPWqnpllXs49z/rPvQ
 ovlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=pl6kn/2Xq4vD/UtQ7fn2/wgdVtAN8yEE21ugAjTtXGU=;
 b=qYVO4yC7rpiCbjm8Q6edI9f2GKQ7CsG+kbHrkEX3TM7h+sSF19Z5k+1OlmohcEp6gd
 sskQBen/hp91+0UAMylgRbzv0E1zoL8sxD783mjXYpxjJVTeAjAfpHzJ7njYCXPR0MfV
 fpCaxmbEqOIcdlokWqvdBTwK4XUL+9fuFXw2Hb9T/PG9JaSr+gQhMU9VrxR4D6ZvL/GU
 C3Vh42/BFTzJ6lpHBFEz9S4vkp8FGG4JWAJwa2CgLUo/t0DQHGpN1jXyhR9Qmj3jHSUI
 0SEAI0G7paFlL5CYrYpPnZgtwIVErfp8oSfSQiRla9f7g/Lsg7mit97QOkStSsq0rFSR
 +eeA==
X-Gm-Message-State: AGi0PuZcAxjNoWkPreRctNgAC1v6dLEG75/APVWYCU3rcmxC5vvSt79Z
 05skss1TYNEEV+cAgQc0FgJRUnXjU/2LcA==
X-Google-Smtp-Source: APiQypIl8gNKH0avAHdJ11fdyAysZtPgNG7guXyrye5FguGaZWGzSHKdIVxzRoIzpEKShCqNHjvlMg==
X-Received: by 2002:a62:1549:: with SMTP id 70mr4912349pfv.43.1588736994382;
 Tue, 05 May 2020 20:49:54 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id k4sm465676pgg.88.2020.05.05.20.49.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 May 2020 20:49:53 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v8 30/30] powerpc sstep: Add support for prefixed fixed-point
 arithmetic
Date: Wed,  6 May 2020 13:40:50 +1000
Message-Id: <20200506034050.24806-31-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200506034050.24806-1-jniethe5@gmail.com>
References: <20200506034050.24806-1-jniethe5@gmail.com>
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
Cc: alistair@popple.id.au, npiggin@gmail.com, bala24@linux.ibm.com,
 naveen.n.rao@linux.vnet.ibm.com, Jordan Niethe <jniethe5@gmail.com>,
 dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This adds emulation support for the following prefixed Fixed-Point
Arithmetic instructions:
  * Prefixed Add Immediate (paddi)

Reviewed-by: Balamuruhan S <bala24@linux.ibm.com>
Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v3: Since we moved the prefixed loads/stores into the load/store switch
statement it no longer makes sense to have paddi in there, so move it
out.
---
 arch/powerpc/lib/sstep.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
index 6794a7672ad5..964fe7bbfce3 100644
--- a/arch/powerpc/lib/sstep.c
+++ b/arch/powerpc/lib/sstep.c
@@ -1337,6 +1337,26 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 
 	switch (opcode) {
 #ifdef __powerpc64__
+	case 1:
+		prefix_r = word & (1ul << 20);
+		ra = (suffix >> 16) & 0x1f;
+		rd = (suffix >> 21) & 0x1f;
+		op->reg = rd;
+		op->val = regs->gpr[rd];
+		suffixopcode = suffix >> 26;
+		prefixtype = (word >> 24) & 0x3;
+		switch (prefixtype) {
+		case 2:
+			if (prefix_r && ra)
+				return 0;
+			switch (suffixopcode) {
+			case 14:	/* paddi */
+				op->type = COMPUTE | PREFIXED;
+				op->val = mlsd_8lsd_ea(word, suffix, regs);
+				goto compute_done;
+			}
+		}
+		break;
 	case 2:		/* tdi */
 		if (rd & trap_compare(regs->gpr[ra], (short) word))
 			goto trap;
-- 
2.17.1

