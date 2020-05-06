Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FACA1C66F9
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 06:32:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49H3b11j7bzDr6D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 14:31:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1042;
 helo=mail-pj1-x1042.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=F3hqeYq3; dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49H2dL3mYPzDqpL
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 May 2020 13:48:54 +1000 (AEST)
Received: by mail-pj1-x1042.google.com with SMTP id ms17so218409pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 05 May 2020 20:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=F+nXp2PI7fY/ipnvxNBndeywOlwjFuKMd+Mjnoqed/g=;
 b=F3hqeYq3Vf41KBCMH7PSCS0AkIwWL7G40Ee/cyV3xfPNv77tbUezfvNrA8GqTM5YFs
 WKtr8xeh+Ts24zO66+apLDRtelqcSV8XwyOY7hb5sQly9UCrqfClfK0R3SkXOOyZojnR
 6rtntrQWZ9cGqCibN5hkZTKkqUomwAPgHGJ0pwCNJPeQfaLJ1q7NyhbdtE5BO7/wTfVL
 VC5cLvU57Gd6/bOhoo7Hz5F78kx+DJEzf/Yqc6hUL7LAwPlrf5u06gDg81fbB9TCWFl+
 7KR4USg4fwrB8JA1SfnqMC0f6+0IzoY5c0YXEqbpDqIl/mOEaIjjxAbe/TXb/iKcdlQ6
 tLLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=F+nXp2PI7fY/ipnvxNBndeywOlwjFuKMd+Mjnoqed/g=;
 b=dx4D2I+q6umsRZ1Hxg8OfBLVJYfVFaH2Pr9BRemuh6EHb4P1QNneip6n5Q5pb3+pyD
 q/iAkQvou1uVRZk8J9/ujzkLl7+IfYqqNvgwn/dIWJ8kUWN4qyduxQwboYshluuJ32bJ
 mkk1LBR1J69oseFuRthUVO+ZW85eHz2KWJE5UW+G6wk6NCuZpJFhPtjz18d1J9WidJoT
 CLczyHaBi3CBD6TW7X20qz/Rg6Vs69SgjVghDOGrOUOdIAx1i5OSR0PszrFx6EM7JFOh
 5PGKabS7rciMFqnu1c0sNjoAIEaCf6niJysl5+WciWY2hk+bQDMN9cdOTMZQ1G0Yx0tK
 g+nA==
X-Gm-Message-State: AGi0PubTmrnCE5E7Ob2M5xB+p63MxkDC7DmZHQ7tXJPDKHI6WTD+lw1f
 U0OrfIE2kv879dBOx3xQT/ev0TZB2QFAcw==
X-Google-Smtp-Source: APiQypLkfvWgxkwXa/5epZeFKaDcLkB9Z2fvt6K3j+DoHv8xmLqDHYE0aby0TvXAd6+o4aOX2d/3ow==
X-Received: by 2002:a17:90a:3568:: with SMTP id
 q95mr6807638pjb.47.1588736932409; 
 Tue, 05 May 2020 20:48:52 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id k4sm465676pgg.88.2020.05.05.20.48.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 May 2020 20:48:52 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v8 26/30] powerpc/xmon: Don't allow breakpoints on suffixes
Date: Wed,  6 May 2020 13:40:46 +1000
Message-Id: <20200506034050.24806-27-jniethe5@gmail.com>
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

Do not allow placing xmon breakpoints on the suffix of a prefix
instruction.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v8: Add this back from v3
---
 arch/powerpc/xmon/xmon.c | 29 +++++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index 647b3829c4eb..d082c35c6638 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -889,8 +889,8 @@ static struct bpt *new_breakpoint(unsigned long a)
 static void insert_bpts(void)
 {
 	int i;
-	struct ppc_inst instr;
-	struct bpt *bp;
+	struct ppc_inst instr, instr2;
+	struct bpt *bp, *bp2;
 
 	bp = bpts;
 	for (i = 0; i < NBPTS; ++i, ++bp) {
@@ -908,6 +908,31 @@ static void insert_bpts(void)
 			bp->enabled = 0;
 			continue;
 		}
+		/*
+		 * Check the address is not a suffix by looking for a prefix in
+		 * front of it.
+		 */
+		if (mread_instr(bp->address - 4, &instr2) == 8) {
+			printf("Breakpoint at %lx is on the second word of a "
+			       "prefixed instruction, disabling it\n",
+			       bp->address);
+			bp->enabled = 0;
+			continue;
+		}
+		/*
+		 * We might still be a suffix - if the prefix has already been
+		 * replaced by a breakpoint we won't catch it with the above
+		 * test.
+		 */
+		bp2 = at_breakpoint(bp->address - 4);
+		if (bp2 && ppc_inst_prefixed(ppc_inst_read(bp2->instr))) {
+			printf("Breakpoint at %lx is on the second word of a "
+			       "prefixed instruction, disabling it\n",
+			       bp->address);
+			bp->enabled = 0;
+			continue;
+		}
+
 		patch_instruction(bp->instr, instr);
 		patch_instruction((void *)bp->instr + ppc_inst_len(instr),
 				  ppc_inst(bpinstr));
-- 
2.17.1

