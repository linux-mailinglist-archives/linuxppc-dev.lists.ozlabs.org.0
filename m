Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5AB7F615
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 13:39:17 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 460QDL4kJrzDqfs
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 21:39:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::643; helo=mail-pl1-x643.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="GVYtYAxC"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 460PMV364mzDqgj
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2019 21:00:22 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id c2so33486240plz.13
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Aug 2019 04:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ycxDcWZtlkCQ1tMVmSZA/ZfExudWUJUXlte1q489Imk=;
 b=GVYtYAxCu9h62disAps7RBRMbKlINqY/uwfzGwufKawYeBx47JsxYKutDmfVZgUAyv
 55b7cRkhOor7yHd4NO3dVzcXKoOin6Z1Ux51QsAnQMHZ1qx9bMtNyZfxVQx301JG7AQt
 rVgeMi80GfKjEiTPjvgDPx2BAwNJElu9GZktnszEcU+SiVngKAt2d6dBn29QwtX1osWD
 KiJ6uiEUHhrxTYPoqb3SYciAYjJIM3QRMcSSUDxSH1y5E8Zd15MwmY5QDNUq2Y0ZToXB
 48yKjtDDA7McmuHS12ep+5DF5Jk3i41WyRNFjExcKhFr7o1TUFl8g1dgpKQZ634++jR1
 iyeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ycxDcWZtlkCQ1tMVmSZA/ZfExudWUJUXlte1q489Imk=;
 b=ZD7WkF1m8zi79+rF8jwg2RX7IkzM3OxuI4xFrZ8zvdOnXR3NhTTXG9dWuGBqnBoe30
 EWbhvgMsggS5t3LZB7hYvXJxDjvRl+0eezLbf/X4xnDwbXA82i70anUEv/7YgfynB9+P
 DZaGOGwmGQgtjj4D+kcSXD4oJU1VgyEbshSTm9S1QgTy34IniKufas9dKdVE9ZL55jua
 upwc+RgIUPr8uggSE1lB0/CV5NLzq0Mxq9CG2PFuAI4uetsCfuTmbIuaXa4c/1nnZbcJ
 +I1ZUxXaFC+zTJyS1hfzcOtJzK4X0SjDytcJpj96ViElJhN2Rnqamg3ep4QxolWiELbg
 aQOg==
X-Gm-Message-State: APjAAAWsP3VwJ1NBRjTc2+rd6oT/1otm/gelnCpOvodMXfOFyYCXJe+u
 Ob/Lhi75SqZJyCYUMF1kf/94yy8n3Xg=
X-Google-Smtp-Source: APXvYqzQeCNsrNEB/lXUbBmHVkAvit64Y0k5cDae/RI6kXMRAl6lpVsuAhy5H9td5Vy7wI05E3bnMg==
X-Received: by 2002:a17:902:6b86:: with SMTP id
 p6mr133930154plk.14.1564743620410; 
 Fri, 02 Aug 2019 04:00:20 -0700 (PDT)
Received: from bobo.local0.net (193-116-68-11.tpgi.com.au. [193.116.68.11])
 by smtp.gmail.com with ESMTPSA id t96sm7377118pjb.1.2019.08.02.04.00.18
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 02 Aug 2019 04:00:19 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 17/44] powerpc/64s/exception: Fix DAR load for
 handle_page_fault error case
Date: Fri,  2 Aug 2019 20:56:42 +1000
Message-Id: <20190802105709.27696-18-npiggin@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190802105709.27696-1-npiggin@gmail.com>
References: <20190802105709.27696-1-npiggin@gmail.com>
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

This buglet goes back to before the 64/32 arch merge, but it does not
seem to have had practical consequences because bad_page_fault does
not use the 2nd argument, but rather regs->dar/nip.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 6b409d62d36c..f79f811ee131 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -2336,7 +2336,7 @@ handle_page_fault:
 	bl	save_nvgprs
 	mr	r5,r3
 	addi	r3,r1,STACK_FRAME_OVERHEAD
-	lwz	r4,_DAR(r1)
+	ld	r4,_DAR(r1)
 	bl	bad_page_fault
 	b	ret_from_except
 
-- 
2.22.0

