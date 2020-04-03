Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 268B319D92C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 16:33:13 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48v2Tx46QfzDqkS
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Apr 2020 01:33:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=vTjKq8Wa; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48v12B0FqrzDrcN
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Apr 2020 00:27:30 +1100 (AEDT)
Received: by mail-pf1-x444.google.com with SMTP id c138so3494284pfc.0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Apr 2020 06:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CLgv1Tr/4aXBIgB/GiWcfJX2n6o4COGZP8RD7C43ZRI=;
 b=vTjKq8WaW5kZOm4cp+07uOAaGHAzmnZvTx6U+A8ycnBwRe8Cz719Dr3hbblXUu7ffx
 CzP3X3O6BTfwA6YWrLE9IzydNCRGxjQMqLP7WF9bqyMdtrP6dsFff7LDL43ayd1saIci
 X7TLBKGTiN6OMA+aiKA9vyL6LPB+zX1MgAbrkIq35Os6e4Exsx3/nPimp8e/3L1F2xpy
 Bw2bUx4ydafRPYyY+s1a5JOTMLKIkZ1xJYddSJqJ1+Z1N/NIj2RSHHE81mVyEIpiEdYA
 IXlqMjMDDQJkn0yoFRvTP00xBpeBwkmPKoD7y2zyMDF8XvpH6ZsS1eF11M4kH1sZBNkg
 Rdwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CLgv1Tr/4aXBIgB/GiWcfJX2n6o4COGZP8RD7C43ZRI=;
 b=S7No5AqwhEcARpTdHNf4I4BYPWi5wkNSp5Pl0sZNU11rTN96Wgvy6JyjsnAWmXilcU
 tjCnUVs7xgzwYYd7uP8FiDGyeeYbnWKNqJ0jWihMLrc6GrrDxOu3ktglENiEh6Z+IVmV
 vLypekkiUj0MbZWNZRbznKNDm+Gbt7Cdf+A7MwBzqU/gMeR3dNmk1pbD/A+BmEUp0LmE
 kB0Nf9mKE+CIFcbHgCYUiAVYQBaZtJkUk+aBP74DwnyRkjMBZA298hp0METi62wm9kc5
 nzZ8XWdd/p3G7uJxeoNsO79CVv+mRF0+WQC+yjPa9pgEC7NAR/WrPziBldXsHaAyRivF
 QGEQ==
X-Gm-Message-State: AGi0PuZHDNf7Rdkx8tymJ59aP0TRKPCQ7bMIHAqmxOK9OyXPLDP2CpZq
 fqtz8qSa7yjxLr0o2w17pcSlez6z
X-Google-Smtp-Source: APiQypJ2DjFZa7w0LAnb8+5FfGFKJKMZWZYfh7h9cH1fzdkdUJrfPVTdKoHv/MTbXc2mHoNlSY/i0Q==
X-Received: by 2002:a63:6d87:: with SMTP id i129mr8294782pgc.54.1585920448013; 
 Fri, 03 Apr 2020 06:27:28 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (60-241-117-97.tpgi.com.au. [60.241.117.97])
 by smtp.gmail.com with ESMTPSA id o65sm5941422pfg.187.2020.04.03.06.27.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2020 06:27:27 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 14/14] powerpc: make unrecoverable NMIs die instead of panic
Date: Fri,  3 Apr 2020 23:26:22 +1000
Message-Id: <20200403132622.130394-15-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200403132622.130394-1-npiggin@gmail.com>
References: <20200403132622.130394-1-npiggin@gmail.com>
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

System Reset and Machine Check interrupts that are not recoverable due
to being nested or interrupting when RI=0 currently panic. This is
not necessary, and can often just kill the current context and recover.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/traps.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index ed7b7a6e2dc0..1f0277f8d40e 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -513,11 +513,11 @@ void system_reset_exception(struct pt_regs *regs)
 #ifdef CONFIG_PPC_BOOK3S_64
 	BUG_ON(get_paca()->in_nmi == 0);
 	if (get_paca()->in_nmi > 1)
-		nmi_panic(regs, "Unrecoverable nested System Reset");
+		die("Unrecoverable nested System Reset", regs, SIGABRT);
 #endif
 	/* Must die if the interrupt is not recoverable */
 	if (!(regs->msr & MSR_RI))
-		nmi_panic(regs, "Unrecoverable System Reset");
+		die("Unrecoverable System Reset", regs, SIGABRT);
 
 	if (saved_hsrrs) {
 		mtspr(SPRN_HSRR0, hsrr0);
@@ -858,7 +858,7 @@ void machine_check_exception(struct pt_regs *regs)
 bail:
 	/* Must die if the interrupt is not recoverable */
 	if (!(regs->msr & MSR_RI))
-		nmi_panic(regs, "Unrecoverable Machine check");
+		die("Unrecoverable Machine check", regs, SIGBUS);
 }
 
 void SMIException(struct pt_regs *regs)
-- 
2.23.0

