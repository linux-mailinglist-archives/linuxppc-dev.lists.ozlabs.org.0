Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 04BC34631AC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Nov 2021 11:57:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J3K0r6lDxz3c63
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Nov 2021 21:57:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=NLGRHhZj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42f;
 helo=mail-pf1-x42f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=NLGRHhZj; dkim-atps=neutral
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J3K084dcFz3036
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Nov 2021 21:56:22 +1100 (AEDT)
Received: by mail-pf1-x42f.google.com with SMTP id o4so20180512pfp.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Nov 2021 02:56:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=s6xB31ZoAWQfj7qRgFmAi/Uh9kmO9NYR+h4TAZntYFQ=;
 b=NLGRHhZjTzpXwneAPYJHgAWDyUGce1pDheJRI73inwyplamwF3H5+ot3tB3OuzJDGP
 hOhG80wadJzC8Jj5+ovke5PAQ10rrNpqj+5HsM2ey7nTqj5OUNKjsxfYQ91fXw8yV0a9
 mBEUsHLWtouGP4hH7iRGg8GW6MrrW6WfleKfC2Zgxv1e8+CptoDfh6zkdKP6/MVkmkNR
 LnA3bgtkinNSG1Cu8riiMFzbxfJY2UCM0ROlVBPQE1l0g1gOjY9Gm5hAmLx5uAWlObl2
 ldoTAq6IbQ7ZE8SsFE3WbJ/mfKeSTX8BoAO/lIGPhx05VLZUPMFX5ZbelOefW6IGEZ1S
 gNUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=s6xB31ZoAWQfj7qRgFmAi/Uh9kmO9NYR+h4TAZntYFQ=;
 b=xGPrBkQTyfDY/sIMq8aGU6MPrblzYaAt1dWR8Wi37C51U/CCtfeP+KwLtV2gcgcxY2
 qz2IN/s1mFI9CIA3OiRh3wmc+LW2tZYulLLPdR5V55ceuIsM7mC+goDWgIoKHUESd+qX
 ozxSe0lhwIiCNr8WN2Rte0z7+If0g+UU4vUgGiRH1e2u4tXRpl1CpH/0+XJpt+Ua/HbZ
 MwAaKl6BA61mcZXPOnAIG8xuq+c5Ie6ziNhjXs6T5BLQTo8VoBIGY91SB0zdUB7ceJvs
 +u1R3moR4B5TVjrtGSM/foan4sfwePq7ab7XfDtVwS3aViA7RWNXry03eqaRE62JUCut
 oiWw==
X-Gm-Message-State: AOAM532ZdgxQjuh4+fKBpEOX04oD6oE0d8Ee4gakIMDTIMhi8HmfkTJ/
 EvGac4uj6T6qvQIT1Wf9++agMmUaLq0=
X-Google-Smtp-Source: ABdhPJwC5WJWH//BKz4vU2iDHylRef7YmSlTF8U8p0HYMqdYVTXMRKKQDomLtf20cjeLrGhv48aamg==
X-Received: by 2002:a05:6a00:14ce:b0:49f:dc1c:a0fb with SMTP id
 w14-20020a056a0014ce00b0049fdc1ca0fbmr46272716pfu.56.1638269777985; 
 Tue, 30 Nov 2021 02:56:17 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (115-64-213-93.static.tpgi.com.au.
 [115.64.213.93])
 by smtp.gmail.com with ESMTPSA id rm1sm2299629pjb.3.2021.11.30.02.56.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 02:56:17 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc: unrecoverable system reset crash fix
Date: Tue, 30 Nov 2021 20:56:03 +1000
Message-Id: <20211130105603.2042129-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
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

When the system reset interrupt (0x100 trap) calls die(), it does not
exit so it returns. Unrecoverable system reset cases don't expect this,
so it continues on and ends up going BUG later.

Change the 0x100 logic in die to just avoid kexec/fadump. Then a 0
signr can be used by a caller to avoid the exit/panic, which the main
0x100 die() call can use. The unrecoverable die() calls then exit and
don't return, as expected.

Fixes: d40b6768e45b ("powerpc/64s: sreset panic if there is no debugger or crash dump handlers")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/traps.c | 37 +++++++++++++++++++++++++------------
 1 file changed, 25 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index 11741703d26e..94b842d659ab 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -219,15 +219,15 @@ static void oops_end(unsigned long flags, struct pt_regs *regs,
 	raw_local_irq_restore(flags);
 
 	/*
-	 * system_reset_excption handles debugger, crash dump, panic, for 0x100
+	 * When system_reset_exception sets signr==0, it does not want crash
+	 * dump code to be called (it has already handled it).
 	 */
-	if (TRAP(regs) == INTERRUPT_SYSTEM_RESET)
-		return;
-
-	crash_fadump(regs, "die oops");
+	if (!(TRAP(regs) == INTERRUPT_SYSTEM_RESET && signr == 0)) {
+		crash_fadump(regs, "die oops");
 
-	if (kexec_should_crash(current))
-		crash_kexec(regs);
+		if (kexec_should_crash(current))
+			crash_kexec(regs);
+	}
 
 	if (!signr)
 		return;
@@ -287,7 +287,8 @@ void die(const char *str, struct pt_regs *regs, long err)
 	unsigned long flags;
 
 	/*
-	 * system_reset_excption handles debugger, crash dump, panic, for 0x100
+	 * When system_reset_exception calls die, it does not want the
+	 * debugger to be invoked (it has already handled it).
 	 */
 	if (TRAP(regs) != INTERRUPT_SYSTEM_RESET) {
 		if (debugger(regs))
@@ -462,8 +463,19 @@ DEFINE_INTERRUPT_HANDLER_NMI(system_reset_exception)
 
 	/* See if any machine dependent calls */
 	if (ppc_md.system_reset_exception) {
-		if (ppc_md.system_reset_exception(regs))
-			goto out;
+		if (ppc_md.system_reset_exception(regs)) {
+			/*
+			 * If this is unrecoverable, it will miss calling
+			 * the debugger due to the TRAP=0x100 logic in die(),
+			 * do it here.
+			 */
+			if (regs_is_unrecoverable(regs)) {
+				if (debugger(regs))
+					goto out;
+			} else {
+				goto out;
+			}
+		}
 	}
 
 	if (debugger(regs))
@@ -488,9 +500,10 @@ DEFINE_INTERRUPT_HANDLER_NMI(system_reset_exception)
 
 	/*
 	 * No debugger or crash dump registered, print logs then
-	 * panic.
+	 * panic. Pass 0 in the err argument to prevent the debugger
+	 * being invoked again, and to prevent die() from crashing.
 	 */
-	die("System Reset", regs, SIGABRT);
+	die("System Reset", regs, 0);
 
 	mdelay(2*MSEC_PER_SEC); /* Wait a little while for others to print */
 	add_taint(TAINT_DIE, LOCKDEP_NOW_UNRELIABLE);
-- 
2.23.0

