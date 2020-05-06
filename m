Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C4EF81C66B3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 06:21:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49H3LK1yn0zDrT3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 14:20:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ubOe2RLP; dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49H2bf4jvvzDqNF
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 May 2020 13:47:26 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id t7so28452plr.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 05 May 2020 20:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=VOU8saIhvaxAs5BI67H10/PA/j/YiLomWmpDeBP0lc0=;
 b=ubOe2RLPSYgdvs97icpEQz90Cd7aGhhzZHhdHUCY7G+VPkQ9TFqv5wlRMIxrqIzZ2N
 9qPU27klhB/GpPEsF+L+aRFYsCoTGCcjbqjn9oWuK/oerWst9r+axqlBIZghle8Giw3w
 fYv3uCS07weUi/TlAgA25k00cCYqVaggvKsobOSY78s1yQzoBMnivBtE+id+7E9R9rBU
 Eg47tZoRz4OVj7ZQCs2xDQHbpPh8EPDuQBWsJxwbrw0cs1V4KUmZp95GqenQek8BjSEk
 /wrm3SCr5vrxPunAoQ3GtrNcuLPE1YUsa80lbJQ7jfnPYMC6H+yH4qLSz/J9dEp/d3Pf
 wv9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=VOU8saIhvaxAs5BI67H10/PA/j/YiLomWmpDeBP0lc0=;
 b=k24Qylx4pry8mNdmvFdeaBXQ14LUgGijuHwMfQ0X3LOHM2ZLGKlVre5emHLljJdh47
 pbmuvemhBwgFmY/LV3FcF6Z840i2spLTaIu1kxrZQOZWO/xizmbb92ZfwT23SPpGlfdA
 UelRM1XsdoB+FMaGJiaYNpJc/Cx+1pZSjqvhaJUzgKOcTI+Z/t/wTw7D6AL94VvGbto6
 Yd4dqyteAQXIyOj+dchYCt6TwwJ3ZC+y3Yk/mGSBV+/IJNOyBMQtkVXJ8tNcWkU2rUz5
 A3ZkItJJVQGeErInK1ozL3G9hJsnOqsFqxowCUWpT0zLUZrnmt3Xhm6/l6WsYEOIF1VN
 Us/Q==
X-Gm-Message-State: AGi0PuacawB1Sqe4MTcrQ/Vi4wZMWp13mszLGK7AqDQLiGNZwANSnvoz
 /owttIw50SPy83RkQTl2p3QiHr6Bd/8xjQ==
X-Google-Smtp-Source: APiQypJ8VIMvF9W/tt6TTDgEKmZ7l5rElRzCFnhVfatd9N7eSdlFG1zMhOmiDEP6lAQAwVxqaVnQJw==
X-Received: by 2002:a17:902:a706:: with SMTP id
 w6mr5868582plq.173.1588736843878; 
 Tue, 05 May 2020 20:47:23 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id k4sm465676pgg.88.2020.05.05.20.47.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 May 2020 20:47:23 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v8 20/30] powerpc: Make test_translate_branch() independent of
 instruction length
Date: Wed,  6 May 2020 13:40:40 +1000
Message-Id: <20200506034050.24806-21-jniethe5@gmail.com>
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

test_translate_branch() uses two pointers to instructions within a
buffer, p and q, to test patch_branch(). The pointer arithmetic done on
them assumes a size of 4. This will not work if the instruction length
changes. Instead do the arithmetic relative to the void * to the buffer.

Reviewed-by: Alistair Popple <alistair@popple.id.au>
Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v4: New to series
---
 arch/powerpc/lib/code-patching.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index 435fc8e9f45d..d946f7d6bb32 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -572,7 +572,7 @@ static void __init test_branch_bform(void)
 static void __init test_translate_branch(void)
 {
 	unsigned long addr;
-	struct ppc_inst *p, *q;
+	void *p, *q;
 	struct ppc_inst instr;
 	void *buf;
 
@@ -586,7 +586,7 @@ static void __init test_translate_branch(void)
 	addr = (unsigned long)p;
 	patch_branch(p, addr, 0);
 	check(instr_is_branch_to_addr(p, addr));
-	q = p + 1;
+	q = p + 4;
 	translate_branch(&instr, q, p);
 	patch_instruction(q, instr);
 	check(instr_is_branch_to_addr(q, addr));
@@ -642,7 +642,7 @@ static void __init test_translate_branch(void)
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

