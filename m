Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 27AEF1EB55B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jun 2020 07:35:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49bgkJ3GsqzDqKD
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jun 2020 15:35:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49bgY21wykzDqSZ
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jun 2020 15:27:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=FL8B4yEP; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 49bgY045jTz8tRw
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jun 2020 15:27:48 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 49bgY01yclz9sSy; Tue,  2 Jun 2020 15:27:48 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::344;
 helo=mail-wm1-x344.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=FL8B4yEP; dkim-atps=neutral
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 49bgY00Ss7z9sSg
 for <linuxppc-dev@ozlabs.org>; Tue,  2 Jun 2020 15:27:47 +1000 (AEST)
Received: by mail-wm1-x344.google.com with SMTP id u26so1388200wmn.1
 for <linuxppc-dev@ozlabs.org>; Mon, 01 Jun 2020 22:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=wQ6s0Tonig3IHtEpnRDJ6uo2d5JJKdzwIDpa6lcIIII=;
 b=FL8B4yEPNcbiK0LgTgjPXnm6spjfNtwZlONYrge4dgDZ9z1S8id2XdZFSgUyGPB3Pg
 VzB9EHMREfsprDTzMk4/Px30rIYJgHA3xxzIC4q1Nsy4TTrmmgL2JeW2k45kwVgGmnSO
 OVAZQJ1/TIHrTmLvvWp6nWI+YeF6hmdmHJQwq7W5YdCgTBcYTJq5lKaNE33x0XAl1Fa8
 /hpXURwqvF4DIYpu3rMg1DxTiftLS0yzKQoKXlgdXk5kbyKIez4d57XCeHeOFXkBgxL2
 jMVB0bVNibwa9z/X7J1VUlq0b/NviMuC6//8oWzrKPpvRi+1/j4hnmU4t2eTiCbY6Y1c
 kCEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=wQ6s0Tonig3IHtEpnRDJ6uo2d5JJKdzwIDpa6lcIIII=;
 b=bM7+CA/bE87dBP2C2eh7okHo1CXOVQ7X2mgP4qI63Y3Snbh/DMuZcv0dtbG6hMlwLH
 7Dh5dRy8D0zWUU1M8pkmwF0cjMYAxrg+xdJ7YKFdDTpPat1Ox7VWdT5UxwwY06IlNyGU
 6mAfEBUMtfd15R2uMunw57gvCn2SqjF0ntTj/p+8eqlbvVMI5UbTNCfrm5m8P7tmrfe8
 Wx9lzHlJSLJVi/Z/Dtcd3rWroENdwOhpj9iJlP0/6jkEMny+wnS2WBJQrHNNbuc3SQ7z
 OVzCzx012ija79cb+ISIelXd5jpvDGnF54Rz1WwPUHqUgoUJda9+EEBi75G34izuOIsY
 oFgQ==
X-Gm-Message-State: AOAM531HWiZogIVZ4+kLZdyVcRGEswRWAXKA4LXEqadCZa5RenTFGxsb
 NvmJsUwAI2FJj6si6g5W/WYMeunD
X-Google-Smtp-Source: ABdhPJwpPXqtOP6DRvvqEBmy2Q3FyKOrUK+izXBcOWxRb7jnD9p7UHNmFmRwUh0YykKkJrEleygUug==
X-Received: by 2002:a7b:ce01:: with SMTP id m1mr2442986wmc.116.1591075664805; 
 Mon, 01 Jun 2020 22:27:44 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id a124sm1831336wmh.4.2020.06.01.22.27.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 22:27:44 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH 3/4] powerpc: Handle prefixed instructions in
 show_user_instructions()
Date: Tue,  2 Jun 2020 15:27:27 +1000
Message-Id: <20200602052728.18227-3-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200602052728.18227-1-jniethe5@gmail.com>
References: <20200602052728.18227-1-jniethe5@gmail.com>
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
Cc: Jordan Niethe <jniethe5@gmail.com>, alistair@popple.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently prefixed instructions are treated as two word instructions by
show_user_instructions(), treat them as a single instruction. '<' and
'>' are placed around the instruction at the NIP, and for prefixed
instructions this is placed around the prefix only. Make the '<' and '>'
wrap the prefix and suffix.

Currently showing a prefixed instruction looks like:
fbe1fff8 39200000 06000000 a3e30000 <04000000> f7e40000 ebe1fff8 4e800020

Make it look like:
0xfbe1fff8 0x39200000 0x06000000 0xa3e30000 <0x04000000 0xf7e40000> 0xebe1fff8 0x4e800020 0x00000000 0x00000000

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
 arch/powerpc/kernel/process.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 048d64c4e115..b3f73e398d00 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1292,7 +1292,8 @@ void show_user_instructions(struct pt_regs *regs)
 	unsigned long pc;
 	int n = NR_INSN_TO_PRINT;
 	struct seq_buf s;
-	char buf[96]; /* enough for 8 times 9 + 2 chars */
+	char buf[8 * sizeof("0x00000000 0x00000000") + 2];
+	struct ppc_inst instr;
 
 	pc = regs->nip - (NR_INSN_TO_PRINT * 3 / 4 * sizeof(int));
 
@@ -1303,14 +1304,15 @@ void show_user_instructions(struct pt_regs *regs)
 
 		seq_buf_clear(&s);
 
-		for (i = 0; i < 8 && n; i++, n--, pc += sizeof(int)) {
-			int instr;
+		for (i = 0; i < 8 && n; i++, n--, pc += ppc_inst_len(instr)) {
 
-			if (probe_user_read(&instr, (void __user *)pc, sizeof(instr))) {
+			if (probe_user_read_inst(&instr, (void __user *)pc)) {
 				seq_buf_printf(&s, "XXXXXXXX ");
+				instr = ppc_inst(PPC_INST_NOP);
 				continue;
 			}
-			seq_buf_printf(&s, regs->nip == pc ? "<%08x> " : "%08x ", instr);
+			seq_buf_printf(&s, regs->nip == pc ? "<%s> " : "%s ",
+				       ppc_inst_as_str(instr));
 		}
 
 		if (!seq_buf_has_overflowed(&s))
-- 
2.17.1

