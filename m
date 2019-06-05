Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E835936544
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2019 22:19:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45K0WN3kdWzDqX3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2019 06:19:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=lca.pw
 (client-ip=2607:f8b0:4864:20::841; helo=mail-qt1-x841.google.com;
 envelope-from=cai@lca.pw; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lca.pw header.i=@lca.pw header.b="KhvFchy6"; 
 dkim-atps=neutral
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45K0V91PdGzDqSQ
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jun 2019 06:18:23 +1000 (AEST)
Received: by mail-qt1-x841.google.com with SMTP id 14so93516qtf.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Jun 2019 13:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=eep8Xi7UqaO2aP4V8ZuSDtp+KDuR2Kw3YoepF8M+Ejo=;
 b=KhvFchy6WV2EGfCS0aKB8oaKfyjgeRmeyn5nergkSRaRclnHRr0EFgeHPHkV3yyjO4
 MTPwrCIXy50L0s7MQp+ilwKKfvjwr/zNgTQvTMn1Rb2rHDdUUeBz/07gqhGk9HGhynZ1
 s/faqm6zGOU1WwUU0J55rjchdzu2qMhuRNVVG3yVcOZj01qjQE+GXvnQFbPXgAg0v+LW
 c4bZMzOr3OMmCgbQPNKmZzGSs9lNqK20G76vSNLgUhzSMIfPEx/7IYxkjm1pSgHqg8nd
 H4/6yUbrfvKZn9lA8l0YybNIqV108wW+TRieMvtg3wXE9x/jIkVyGy3mlb41Z6Gaggi/
 QV9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=eep8Xi7UqaO2aP4V8ZuSDtp+KDuR2Kw3YoepF8M+Ejo=;
 b=pK7WdtspG5/fGeOhZJwhVgQxUQS9su8l74E/MqY6bhiLmCRPSOkGhllI1B9Mf7+Wy1
 S9AVRLTFLfKKv/cFWT54me7jxAdNnYE9JtB26Rj2Sq3L12f6cMGroJrPGi80sCH2+u/z
 ZMzf59bGX8R/79aGKGubGn7LqGdtG4uWFINM9tyRpjucAr/r1z5HudYlWTM/uoZV7Gfd
 /ckI159srOxtYP0Aey4H5m9FNa0g2UxgpxiVVhz/fqt/aL8qhV7NeUZbygNCnc1N4f6W
 uRdCQ15C8d1At+a5/ekRs23tpZxMsubVu1F2z1lE2tNANtYFzP5KXUePgiG971Y81ENP
 KxXA==
X-Gm-Message-State: APjAAAUVxrYcmq1agpTndn2kf+Do412C2Si13916L3KFvnVkkctrF7tP
 HnwInDevIPrc/9R2aRiTlsFxvw==
X-Google-Smtp-Source: APXvYqylnnxGRmwwDNBSxxHTCizpj0mUP+4/+2jTc7tjkZ0Todi8uSs1a4jq1v8xplv2rH3dQb9LMA==
X-Received: by 2002:ac8:1796:: with SMTP id o22mr34231264qtj.98.1559765898586; 
 Wed, 05 Jun 2019 13:18:18 -0700 (PDT)
Received: from qcai.nay.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id d7sm7840507qth.44.2019.06.05.13.18.17
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 05 Jun 2019 13:18:17 -0700 (PDT)
From: Qian Cai <cai@lca.pw>
To: mpe@ellerman.id.au
Subject: [PATCH] powerpc/setup_64: fix -Wempty-body warnings
Date: Wed,  5 Jun 2019 16:17:55 -0400
Message-Id: <1559765875-6328-1-git-send-email-cai@lca.pw>
X-Mailer: git-send-email 1.8.3.1
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
Cc: Qian Cai <cai@lca.pw>, paulus@samba.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

At the beginning of setup_64.c, it has,

  #ifdef DEBUG
  #define DBG(fmt...) udbg_printf(fmt)
  #else
  #define DBG(fmt...)
  #endif

where DBG() could be compiled away, and generate warnings,

arch/powerpc/kernel/setup_64.c: In function 'initialize_cache_info':
arch/powerpc/kernel/setup_64.c:579:49: warning: suggest braces around
empty body in an 'if' statement [-Wempty-body]
    DBG("Argh, can't find dcache properties !\n");
                                                 ^
arch/powerpc/kernel/setup_64.c:582:49: warning: suggest braces around
empty body in an 'if' statement [-Wempty-body]
    DBG("Argh, can't find icache properties !\n");

Signed-off-by: Qian Cai <cai@lca.pw>
---
 arch/powerpc/kernel/setup_64.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
index 44b4c432a273..23758834324f 100644
--- a/arch/powerpc/kernel/setup_64.c
+++ b/arch/powerpc/kernel/setup_64.c
@@ -575,12 +575,13 @@ void __init initialize_cache_info(void)
 	 * d-cache and i-cache sizes... -Peter
 	 */
 	if (cpu) {
-		if (!parse_cache_info(cpu, false, &ppc64_caches.l1d))
+		/* Add an extra brace to silence -Wempty-body warnings. */
+		if (!parse_cache_info(cpu, false, &ppc64_caches.l1d)) {
 			DBG("Argh, can't find dcache properties !\n");
-
-		if (!parse_cache_info(cpu, true, &ppc64_caches.l1i))
+		}
+		if (!parse_cache_info(cpu, true, &ppc64_caches.l1i)) {
 			DBG("Argh, can't find icache properties !\n");
-
+		}
 		/*
 		 * Try to find the L2 and L3 if any. Assume they are
 		 * unified and use the D-side properties.
-- 
1.8.3.1

