Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7895BA59E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 06:09:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MTLFC38nMz3dp9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 14:09:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=b74pbhzZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=b74pbhzZ;
	dkim-atps=neutral
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MTLCL2CDkz2yWK
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Sep 2022 14:08:14 +1000 (AEST)
Received: by mail-pf1-x435.google.com with SMTP id w2so9766483pfb.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Sep 2022 21:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=425jscTdOENl/IcYfphn9Q48DiS+qua4nYw7KaUJl48=;
        b=b74pbhzZZxqqd69pmwTPIeN5arYMmb/aFh58pqIW6q17eeHxiHsFPFMI/tsZDIxK2d
         xjWS6szKaEx5adl0BHg9vovgIxHKIi6+jHr5m88M9wGZdyS+sUEgyiuBnqn0UZ5KXncw
         x3X8y1VWrfEJDsqqvQDgu3JPvceS4jJowPqLcgFhm4SSHu3tLRJuGERcAEOji6HEovzR
         jqfSgU2OnKxNRufLD0m0eW/xEzHmklX1cvPMmSN2ZZRBr2GmjTesvt33JNc/3HUbUTQ/
         dSkAmelqqABYnFgvQEa4PuYcBT+UuUI8dWIoVLr4WIndH0PYtFT2ZM88kBbvZlkq6Zk5
         dizA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=425jscTdOENl/IcYfphn9Q48DiS+qua4nYw7KaUJl48=;
        b=jJE84apnj0sSoVVxM9TGIlGwU83T3mrGVjE0jh9GkKJUDZMpC2kqGJxvdPZ22ZU2wE
         5z3UbsDC2D8lYhkwcY6TW9byge21xb6rNkvAHPxvEzmCgh930GrVbAi2J6QwA+YjfLNr
         4KFMGnOB8REhTPC1w/0TvXarlxNJSGuPLw75RTtGcZYCT4mbshQAjv8vVdA4+KtKSWOK
         kaGeK2cNa8YIt0r9Y9XnZjIH29hPnqWxbR7RA64hF8g8DT1DiYCDrtetYZQqE+W8gtOn
         DdjNko/j9gdELb3pSpWaGd9ngCC1lnfsb9JpeZwd9I9uO2XcB57lUuXLU06j5PRLvo9P
         pLOw==
X-Gm-Message-State: ACrzQf3G7wTUjFzSE6Ivj1PsBc5hQQAesFNIlgk0JZ+G+2c35e6jDe7p
	3402QgGmUHKnyspvy/hmZXzkp5ZZSYA=
X-Google-Smtp-Source: AMsMyM6jGFLUHGsC+BgYDEkxE8bRmj0ukLJNipfklQFTGpKyH3Ptjbnz5iCduKk3nX6HHBMTkqACiA==
X-Received: by 2002:a63:de58:0:b0:439:41e9:dda2 with SMTP id y24-20020a63de58000000b0043941e9dda2mr2770099pgi.331.1663301291358;
        Thu, 15 Sep 2022 21:08:11 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (193-116-127-167.tpgi.com.au. [193.116.127.167])
        by smtp.gmail.com with ESMTPSA id t6-20020a1709027fc600b0017534ffd491sm13696816plb.163.2022.09.15.21.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 21:08:10 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 2/7] powerpc/32/build: move got1/got2 sections out of text
Date: Fri, 16 Sep 2022 14:07:50 +1000
Message-Id: <20220916040755.2398112-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220916040755.2398112-1-npiggin@gmail.com>
References: <20220916040755.2398112-1-npiggin@gmail.com>
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

Following the example from the binutils default linker script, move
.got1 and .got2 out of .text, to just after RO_DATA.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/vmlinux.lds.S | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinux.lds.S
index d81e4392da26..607b17b1e785 100644
--- a/arch/powerpc/kernel/vmlinux.lds.S
+++ b/arch/powerpc/kernel/vmlinux.lds.S
@@ -122,14 +122,6 @@ SECTIONS
 		*(.sfpr);
 		MEM_KEEP(init.text)
 		MEM_KEEP(exit.text)
-
-#ifdef CONFIG_PPC32
-		*(.got1)
-		__got2_start = .;
-		*(.got2)
-		__got2_end = .;
-#endif /* CONFIG_PPC32 */
-
 	} :text
 
 	. = ALIGN(PAGE_SIZE);
@@ -139,7 +131,16 @@ SECTIONS
 	/* Read-only data */
 	RO_DATA(PAGE_SIZE)
 
-#ifdef CONFIG_PPC64
+#ifdef CONFIG_PPC32
+	.got1 : AT(ADDR(.got1) - LOAD_OFFSET) {
+		*(.got1)
+	}
+	.got2 : AT(ADDR(.got2) - LOAD_OFFSET) {
+		__got2_start = .;
+		*(.got2)
+		__got2_end = .;
+	}
+#else /* CONFIG_PPC32 */
 	SOFT_MASK_TABLE(8)
 	RESTART_TABLE(8)
 
@@ -190,7 +191,7 @@ SECTIONS
 		*(__rfi_flush_fixup)
 		__stop___rfi_flush_fixup = .;
 	}
-#endif /* CONFIG_PPC64 */
+#endif /* CONFIG_PPC32 */
 
 #ifdef CONFIG_PPC_BARRIER_NOSPEC
 	. = ALIGN(8);
-- 
2.37.2

