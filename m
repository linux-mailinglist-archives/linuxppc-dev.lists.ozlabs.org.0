Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C62D4E8384
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Mar 2022 19:47:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KQnyh60Tqz3fCX
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Mar 2022 05:47:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stuerz.xyz header.i=@stuerz.xyz header.a=rsa-sha256 header.s=mail header.b=NzOHGekH;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=stuerz.xyz header.i=@stuerz.xyz header.a=rsa-sha256 header.s=mail header.b=yJm8jOOp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stuerz.xyz (client-ip=2001:19f0:5:15da:5400:3ff:fecc:7379;
 helo=stuerz.xyz; envelope-from=benni@stuerz.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stuerz.xyz header.i=@stuerz.xyz header.a=rsa-sha256
 header.s=mail header.b=NzOHGekH; 
 dkim=pass (2048-bit key) header.d=stuerz.xyz header.i=@stuerz.xyz
 header.a=rsa-sha256 header.s=mail header.b=yJm8jOOp; 
 dkim-atps=neutral
Received: from stuerz.xyz (stuerz.xyz
 [IPv6:2001:19f0:5:15da:5400:3ff:fecc:7379])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KQlm34rMzz30BN
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Mar 2022 04:08:35 +1100 (AEDT)
Received: by stuerz.xyz (Postfix, from userid 114)
 id 468F0FBB8D; Sat, 26 Mar 2022 16:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=stuerz.xyz; s=mail;
 t=1648313990; bh=hqrYFkjwHXr5MkCmTzW0zUtSYcfIlAH4M2viTmK+ce0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NzOHGekHcRWuZ4H68rapfZbBmrqB6nsbrdOPjNSxt7h8WkRUT3D2lLjIJFRTIjfB3
 UgMiATq5eTVCXaOy2UZ2vJ94sDqSpZePYoniDGtML1oJyKaOnSog2nTRNdmus4huu1
 dNKNTHK/s44qXlrlWpPs4xe6WlRq0YWiRCCsHRsQRt+Dztdk6urqW44lP7OYdLe1nd
 iApLmLF5sd4XynYeSD7WhPsr05da2DKHrbLaeFnaE6APUcbkLSfnhSQ4vENwGp/qDb
 WIwfu6P9XdEyQtoiou9yk/fZ3gXOw5RrBCJBTphGCihX/Wg4bVDJOMPD5bWY31k1dT
 anoDgWlgp+dAg==
Received: from benni-fedora.. (unknown
 [IPv6:2a02:8109:a100:1a48:ff0:ef2f:d4da:17d8])
 by stuerz.xyz (Postfix) with ESMTPSA id B4FD6FB7D4;
 Sat, 26 Mar 2022 16:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=stuerz.xyz; s=mail;
 t=1648313987; bh=hqrYFkjwHXr5MkCmTzW0zUtSYcfIlAH4M2viTmK+ce0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=yJm8jOOpo7o5bJ/jnyWMMwZCEz0cp1ONDyucFrcaUR3MF3mVAicBbi+RDh7CMUk6b
 AyDPTwmRpd0XtTVVibZYv+GFO17TD/etO65ImQn1AFDB5Rst93WnLmQ26aVc+7IYzp
 +7kCFMqaTfUdoa765GsRs1bJ96ZWZETiepQrT7wGEtCCoxWejua9HAQCyk7dJKJh5O
 wuVo1XTIDTYs6bomi740IDuPOKzsYRmpgM59T/cdggq6jN4J+vjL83NtQNKgUJ1zre
 LWEzOV5Of6i4tJhdHMgudanVzcnBxhgC4dyUDk7gJTZs+N6Hn6Ykq5e3pYup83HrRK
 SBOFExwpFzDQA==
From: =?UTF-8?q?Benjamin=20St=C3=BCrz?= <benni@stuerz.xyz>
To: andrew@lunn.ch
Subject: [PATCH 04/22] x86: Replace comments with C99 initializers
Date: Sat, 26 Mar 2022 17:58:51 +0100
Message-Id: <20220326165909.506926-4-benni@stuerz.xyz>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220326165909.506926-1-benni@stuerz.xyz>
References: <20220326165909.506926-1-benni@stuerz.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 27 Mar 2022 05:40:34 +1100
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
Cc: linux-atm-general@lists.sourceforge.net, linux-ia64@vger.kernel.org,
 linus.walleij@linaro.org, dave.hansen@linux.intel.com,
 linux-pci@vger.kernel.org, robert.moore@intel.com, laforge@gnumonks.org,
 alim.akhtar@samsung.com, hpa@zytor.com, wcn36xx@lists.infradead.org,
 =?UTF-8?q?Benjamin=20St=C3=BCrz?= <benni@stuerz.xyz>, pkshih@realtek.com,
 linux-samsung-soc@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-edac@vger.kernel.org, dennis.dalessandro@cornelisnetworks.com,
 linux-rdma@vger.kernel.org, gregory.clement@bootlin.com,
 rafael.j.wysocki@intel.com, linux@armlinux.org.uk, krzk@kernel.org,
 jgg@ziepe.ca, mingo@redhat.com, 3chas3@gmail.com, linux-input@vger.kernel.org,
 kuba@kernel.org, pabeni@redhat.com, lenb@kernel.org,
 mike.marciniszyn@cornelisnetworks.com, rric@kernel.org, ajd@linux.ibm.com,
 arnd@arndb.de, kvalo@kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-gpio@vger.kernel.org, loic.poulain@linaro.org, bp@alien8.de,
 bhelgaas@google.com, tglx@linutronix.de, mchehab@kernel.org,
 linux-media@vger.kernel.org, linux@simtec.co.uk,
 linux-arm-kernel@lists.infradead.org, devel@acpica.org, isdn@linux-pingi.de,
 tony.luck@intel.com, nico@fluxnic.net, gregkh@linuxfoundation.org,
 dmitry.torokhov@gmail.com, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, davem@davemloft.net, james.morse@arm.com,
 netdev@vger.kernel.org, fbarrat@linux.ibm.com, sebastian.hesselbarth@gmail.com,
 pali@kernel.org, brgl@bgdev.pl
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This replaces comments with C99's designated
initializers because the kernel supports them now.

Signed-off-by: Benjamin Stürz <benni@stuerz.xyz>
---
 arch/x86/include/asm/kgdb.h   | 80 +++++++++++++++++------------------
 arch/x86/kernel/cpu/mtrr/if.c | 14 +++---
 2 files changed, 47 insertions(+), 47 deletions(-)

diff --git a/arch/x86/include/asm/kgdb.h b/arch/x86/include/asm/kgdb.h
index aacaf2502bd2..a9161e2f8b63 100644
--- a/arch/x86/include/asm/kgdb.h
+++ b/arch/x86/include/asm/kgdb.h
@@ -25,52 +25,52 @@
  */
 #ifdef CONFIG_X86_32
 enum regnames {
-	GDB_AX,			/* 0 */
-	GDB_CX,			/* 1 */
-	GDB_DX,			/* 2 */
-	GDB_BX,			/* 3 */
-	GDB_SP,			/* 4 */
-	GDB_BP,			/* 5 */
-	GDB_SI,			/* 6 */
-	GDB_DI,			/* 7 */
-	GDB_PC,			/* 8 also known as eip */
-	GDB_PS,			/* 9 also known as eflags */
-	GDB_CS,			/* 10 */
-	GDB_SS,			/* 11 */
-	GDB_DS,			/* 12 */
-	GDB_ES,			/* 13 */
-	GDB_FS,			/* 14 */
-	GDB_GS,			/* 15 */
+	GDB_AX = 0,
+	GDB_CX = 1,
+	GDB_DX = 2,
+	GDB_BX = 3,
+	GDB_SP = 4,
+	GDB_BP = 5,
+	GDB_SI = 6,
+	GDB_DI = 7,
+	GDB_PC = 8,			/* also known as eip */
+	GDB_PS = 9,			/* also known as eflags */
+	GDB_CS = 10,
+	GDB_SS = 11,
+	GDB_DS = 12,
+	GDB_ES = 13,
+	GDB_FS = 14,
+	GDB_GS = 15,
 };
 #define GDB_ORIG_AX		41
 #define DBG_MAX_REG_NUM		16
 #define NUMREGBYTES		((GDB_GS+1)*4)
 #else /* ! CONFIG_X86_32 */
 enum regnames {
-	GDB_AX,			/* 0 */
-	GDB_BX,			/* 1 */
-	GDB_CX,			/* 2 */
-	GDB_DX,			/* 3 */
-	GDB_SI,			/* 4 */
-	GDB_DI,			/* 5 */
-	GDB_BP,			/* 6 */
-	GDB_SP,			/* 7 */
-	GDB_R8,			/* 8 */
-	GDB_R9,			/* 9 */
-	GDB_R10,		/* 10 */
-	GDB_R11,		/* 11 */
-	GDB_R12,		/* 12 */
-	GDB_R13,		/* 13 */
-	GDB_R14,		/* 14 */
-	GDB_R15,		/* 15 */
-	GDB_PC,			/* 16 */
-	GDB_PS,			/* 17 */
-	GDB_CS,			/* 18 */
-	GDB_SS,			/* 19 */
-	GDB_DS,			/* 20 */
-	GDB_ES,			/* 21 */
-	GDB_FS,			/* 22 */
-	GDB_GS,			/* 23 */
+	GDB_AX   =  0,
+	GDB_BX   =  1,
+	GDB_CX   =  2,
+	GDB_DX   =  3,
+	GDB_SI   =  4,
+	GDB_DI   =  5,
+	GDB_BP   =  6,
+	GDB_SP   =  7,
+	GDB_R8   =  8,
+	GDB_R9   =  9,
+	GDB_R10  = 10,
+	GDB_R11  = 11,
+	GDB_R12  = 12,
+	GDB_R13  = 13,
+	GDB_R14  = 14,
+	GDB_R15  = 15,
+	GDB_PC   = 16,			/* also known as eip */
+	GDB_PS   = 17,			/* also known as eflags */
+	GDB_CS   = 18,
+	GDB_SS   = 19,
+	GDB_DS   = 20,
+	GDB_ES   = 21,
+	GDB_FS   = 22,
+	GDB_GS   = 23,
 };
 #define GDB_ORIG_AX		57
 #define DBG_MAX_REG_NUM		24
diff --git a/arch/x86/kernel/cpu/mtrr/if.c b/arch/x86/kernel/cpu/mtrr/if.c
index a5c506f6da7f..7664a672f414 100644
--- a/arch/x86/kernel/cpu/mtrr/if.c
+++ b/arch/x86/kernel/cpu/mtrr/if.c
@@ -18,13 +18,13 @@
 
 static const char *const mtrr_strings[MTRR_NUM_TYPES] =
 {
-	"uncachable",		/* 0 */
-	"write-combining",	/* 1 */
-	"?",			/* 2 */
-	"?",			/* 3 */
-	"write-through",	/* 4 */
-	"write-protect",	/* 5 */
-	"write-back",		/* 6 */
+	[0] = "uncachable",
+	[1] = "write-combining",
+	[2] = "?",
+	[3] = "?",
+	[4] = "write-through",
+	[5] = "write-protect",
+	[6] = "write-back",
 };
 
 const char *mtrr_attrib_to_str(int x)
-- 
2.35.1

