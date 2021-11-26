Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB38645E685
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Nov 2021 04:24:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J0g8D4txKz3cCw
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Nov 2021 14:24:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ZKoNWSV+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::535;
 helo=mail-pg1-x535.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=ZKoNWSV+; dkim-atps=neutral
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J0g6s1QTWz2yPT
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Nov 2021 14:23:00 +1100 (AEDT)
Received: by mail-pg1-x535.google.com with SMTP id 28so6893595pgq.8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Nov 2021 19:23:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DO433WuqOGDgpk9jbl8imWfj3x0wA3HT2dbvjJ6E+tc=;
 b=ZKoNWSV+Etv3ZtRJdkMmpxGg2nJYkM5tqgMm2tq/5YMNiQRaU9UtcustlAFq3pnLMR
 pbujUWFVGNZvnuQK5xC0q7my02rjsOcmukNozGvD+cmYDlzCmUpdO5ocljxkuD5kWK7L
 l5mDMfQMW25sJc/9cdLp7THrNlvRJsJojTu5dPcW+lIlgkHk+fx3p7zxsIyvFSzrG2Xo
 Ni1GhMEJq532HSHQ8+OLiLfUj5/V5ly3oJt19d2rdUZ9O7M8BG63F8l0R4MK1eFqRhJI
 OjndlRQkQNTIKoUCtq959QxzOEz+9GEhfjCXxMUn5FThq7lPNoi95K/ma0T44Y88tY10
 1cXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DO433WuqOGDgpk9jbl8imWfj3x0wA3HT2dbvjJ6E+tc=;
 b=LkZ7P5m6Y3WqPbWx7I3By5kYJFTHtmU4SslupdasJ1a/OJeFmXE3oWL7Z9ZOd4KymC
 5gWVDZEutaEaYiLUB5QrqJf0VdgCYJTdwpEIlj5yepYjFmX19iZ3x0GoqjRWDNq9pbTY
 cIWEud+4YcsH4EL1gmCD+iguF3PMtgnPi629Mrjcn/r/BTZYMqLGSoWVoJor//fZD1tF
 XDznnUZ8fa2N801HeZN9XA8qmls0VQLBfhpKcWhay/vqS8n2Rgh88QgCBMtipnmieO6S
 Vq3rxe4smMjpe0N6D3mUg65BZZ6g9PDF1ODTr17YVxX0vt+j8IgHIL7065kZFPqv3p18
 osYQ==
X-Gm-Message-State: AOAM530X//u8j8i91fETPZFbqYKQDrpSMw7kTkcsy/cxqpMfkrS2n0tO
 gfbXQDg+1MNAMflWwajYi+PhL25yXR0=
X-Google-Smtp-Source: ABdhPJz0Dqfj4hOHB0clyKD5ZP44o6u46wokJujnHUXl6V/8RsXgzFE6zcM4bOe2AdVqFO3+aW3DKw==
X-Received: by 2002:a62:e907:0:b0:4a0:3a71:9712 with SMTP id
 j7-20020a62e907000000b004a03a719712mr19029749pfh.73.1637896978550; 
 Thu, 25 Nov 2021 19:22:58 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (115-64-213-93.static.tpgi.com.au.
 [115.64.213.93])
 by smtp.gmail.com with ESMTPSA id l4sm5143386pfc.121.2021.11.25.19.22.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 19:22:58 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/3] powerpc/code-patching: warn on code patching failure
Date: Fri, 26 Nov 2021 13:22:48 +1000
Message-Id: <20211126032249.1652080-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211126032249.1652080-1-npiggin@gmail.com>
References: <20211126032249.1652080-1-npiggin@gmail.com>
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

Callers are supposed to handle this, but it is possible that they
don't or they do but don't make much noise about it. A failure is
probably an indication of a bigger problem somewhere so it is good
to warn once about it.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/lib/code-patching.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index 57e160963ab7..70247fc58b6e 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -161,6 +161,7 @@ static int do_patch_instruction(u32 *addr, struct ppc_inst instr)
 
 	text_poke_addr = (unsigned long)__this_cpu_read(text_poke_area)->addr;
 	if (map_patch_area(addr, text_poke_addr)) {
+		WARN_ON_ONCE(1);
 		err = -1;
 		goto out;
 	}
@@ -192,8 +193,10 @@ static bool skip_addr_verif = false;
 int patch_instruction(u32 *addr, struct ppc_inst instr)
 {
 	/* Make sure we aren't patching a freed init section */
-	if (!skip_addr_verif && !kernel_text_address((unsigned long)addr))
+	if (!skip_addr_verif && !kernel_text_address((unsigned long)addr)) {
+		WARN_ON_ONCE(1);
 		return 0;
+	}
 
 	return do_patch_instruction(addr, instr);
 }
-- 
2.23.0

