Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BCCD61C0D57
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 May 2020 06:25:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49CzgS6HnPzDqDq
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 May 2020 14:25:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1041;
 helo=mail-pj1-x1041.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=A6jiL+sq; dkim-atps=neutral
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49CysY2CRCzDqD8
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 May 2020 13:48:48 +1000 (AEST)
Received: by mail-pj1-x1041.google.com with SMTP id mq3so1867582pjb.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Apr 2020 20:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=vkvmVUwPESDi+ljnhMsUua9uPhKCYjAsoAblipkm/kQ=;
 b=A6jiL+squMU+2usizrg581HsiPoCj7DXB1rBkp0BDgYEf9r390F+GuqmLdNTnDP2iw
 j5TIvoBfd6hzPM5+KcvPg+CtM1kR/honUwLRey9Ku+XnHN1ARz5rFRxTE1OXjcll9giB
 QG2cykaZZcpT8vVT3CSuH1JA9wKi03ao+fSs6qidz7cj4onZwcTxiZHCwWjBaFzlVLHG
 UtobNYvP3I+DtveNtwZcIqkCZwSSJ3zawq1SSq3vlWm5fnUEcW9YY5rNnOZ5+3qrYMwj
 kdxYCqQZR/YmiYJc/3LR4mfTUY6rWsoArnQ4EwHWLixnqGpMneZIZTLRYSQIDagFjYvc
 2WIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=vkvmVUwPESDi+ljnhMsUua9uPhKCYjAsoAblipkm/kQ=;
 b=hOb+A+sxAhOs55wtRU58sccnBlq9lROVCDvyP1AkplNQyChORe9j1HKIra8AsP1YkF
 A0vsAIKSKobaTUitctwpytV3gBGsoINOeEK8Gg7cchdroMAO4Jo0PMsk/paqsN8h1vWr
 Jzgcslw6SJxWXoMZxx4LaSB5TWssh0ccjIOy3dbn1t0nQE9O09WWrjerB24zCDxRKGN6
 SvbJyFHGAewPwkj+IP/ICQq+QIyqKI+3VQDRgVWDqo8bDPbcpXKV+5m/EaQR6fNle/FO
 BDR1B0UjKwt/9fXn7F7AfsaZwZjvWXBtrmExV76XC7VvMqUF5+J3EPRSsTIO5Tyh7VvK
 2t0Q==
X-Gm-Message-State: AGi0PuZcjmEMnnCku1+Pn47XaEvx/5QOHCqXGy2GyRh1INneT30UGZpK
 F9kc5IXPVkjql9FXFR6vRmX+a/uOB0Ix/A==
X-Google-Smtp-Source: APiQypKFroipcAwrWUpociI30tN1VEnayQTk/KTCkBmz2GOLaB6klMI/Grq764J5yB8A9Ws4dzKQrw==
X-Received: by 2002:a17:902:b097:: with SMTP id
 p23mr2480279plr.195.1588304926085; 
 Thu, 30 Apr 2020 20:48:46 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id w28sm940082pgc.26.2020.04.30.20.48.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 20:48:45 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v7 20/28] powerpc: Make test_translate_branch() independent of
 instruction length
Date: Fri,  1 May 2020 13:42:12 +1000
Message-Id: <20200501034220.8982-21-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200501034220.8982-1-jniethe5@gmail.com>
References: <20200501034220.8982-1-jniethe5@gmail.com>
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

test_translate_branch() uses two pointers to instructions within a
buffer, p and q, to test patch_branch(). The pointer arithmetic done on
them assumes a size of 4. This will not work if the instruction length
changes. Instead do the arithmetic relative to the void * to the buffer.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v4: New to series
---
 arch/powerpc/lib/code-patching.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index 110f710500c8..5b2f66d06b1e 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -569,7 +569,7 @@ static void __init test_branch_bform(void)
 static void __init test_translate_branch(void)
 {
 	unsigned long addr;
-	struct ppc_inst *p, *q;
+	void *p, *q;
 	struct ppc_inst instr;
 	void *buf;
 
@@ -583,7 +583,7 @@ static void __init test_translate_branch(void)
 	addr = (unsigned long)p;
 	patch_branch(p, addr, 0);
 	check(instr_is_branch_to_addr(p, addr));
-	q = p + 1;
+	q = p + 4;
 	translate_branch(&instr, q, p);
 	patch_instruction(q, instr);
 	check(instr_is_branch_to_addr(q, addr));
@@ -639,7 +639,7 @@ static void __init test_translate_branch(void)
 	create_cond_branch(&instr, p, addr, 0);
 	patch_instruction(p, instr);
 	check(instr_is_branch_to_addr(p, addr));
-	q = p + 1;
+	q = buf + 4;
 	translate_branch(&instr, q, p);
 	patch_instruction(q, instr);
 	check(instr_is_branch_to_addr(q, addr));
-- 
2.17.1

