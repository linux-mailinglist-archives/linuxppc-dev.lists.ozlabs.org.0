Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E14A19D8C8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 16:16:25 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48v26Y46KqzDqZb
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Apr 2020 01:16:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1042;
 helo=mail-pj1-x1042.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=APY0EmTX; dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48v11w3vDNzDrdH
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Apr 2020 00:27:16 +1100 (AEDT)
Received: by mail-pj1-x1042.google.com with SMTP id l36so2985555pjb.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Apr 2020 06:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YqBOA8KZ0+WN1P0HnkLjWbY6i7lEA6O9z/TOKUZWzd8=;
 b=APY0EmTXTzjnJNtQbLqi5yw7Uu0OWD5YLtwGTtzKuAtIJWMCRbkqPf+CEG2QcSqFo2
 cTfoyKwKMzg0h9ZZmuZlgI4mMbAAPQVortAZR7UL8uVtYBhs76U3ArOKN5b5lZ+5lLha
 nW+PDsbqU4c191pwWnacLEQd8oGCu+gGYRHbEpA4r2wbsczhFbsnkzo7Khh5e1yUYUEm
 frlC/kYbOTgsnMrV5mW9RUaFyRgXlTu5Ru26/2UNzmYPQliiwEi7QyTgqJlDJdRwJveP
 Nl7ClDi5k97L3lJpK40rGfuRycd29gExDwxisjvL2y5gSar5gkYeOpghdRlKY3H/WSss
 PVtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YqBOA8KZ0+WN1P0HnkLjWbY6i7lEA6O9z/TOKUZWzd8=;
 b=F41DI2pH8SluueBwOtK/DJCB9dDTgc3vS6r/UFryKxX+6Bc0IP0NT6EwUPVzWgzVkg
 YSmf8mntk3ubBxf4J2KaGUpAxG0BejBbG2p6shru+sZslE98PJGaNYEPvVqqeQK9Zb/p
 jjQ0oZvWXXpQk8wIHduhCxLbI4/TZKsBizuUi6E9uEKW9sNH/k3MiEJSa+P/PVjq4lpu
 dCCRZhbNPDNDyR5x6waJ/OjLd9sUbk2cuufYtM3vPfva4AYYNsOkwf9tP3S5ACw5ZMij
 u15MG2zCToYQwX3XUxJlB5QvItxWtqyZJHl31c80stmhOeixsKiVUTEeJ07td56jztb8
 ZYCw==
X-Gm-Message-State: AGi0PuZeA6LHUDCmkblnqRqqZRL1P76j3OUxWUjQzSNaOka+y7DaX6vK
 ay8aGLEO9Oakq8O5KE9y8UFU39wU
X-Google-Smtp-Source: APiQypIwWxw2OKUfc4uuGR9M7tonkpJT+R3H5Afc5sBFh2HFofgh1Pz/gxvU2v/JUQCYtgJtzXWg2w==
X-Received: by 2002:a17:90a:252b:: with SMTP id
 j40mr9806105pje.189.1585920434559; 
 Fri, 03 Apr 2020 06:27:14 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (60-241-117-97.tpgi.com.au. [60.241.117.97])
 by smtp.gmail.com with ESMTPSA id o65sm5941422pfg.187.2020.04.03.06.27.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2020 06:27:14 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 10/14] powerpc/pseries: machine check use
 rtas_call_unlocked with args on stack
Date: Fri,  3 Apr 2020 23:26:18 +1000
Message-Id: <20200403132622.130394-11-npiggin@gmail.com>
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

With the previous patch, machine checks can use rtas_call_unlocked
which avoids the rtas spinlock which would deadlock if a machine
check hits while making an rtas call.

This also avoids the complex rtas error logging which has more rtas calls
and includes kmalloc (which can return memory beyond RMA, which would
also crash).

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/platforms/pseries/ras.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/ras.c b/arch/powerpc/platforms/pseries/ras.c
index 833ae34b7fec..6938261e4569 100644
--- a/arch/powerpc/platforms/pseries/ras.c
+++ b/arch/powerpc/platforms/pseries/ras.c
@@ -469,7 +469,15 @@ static struct rtas_error_log *fwnmi_get_errinfo(struct pt_regs *regs)
  */
 static void fwnmi_release_errinfo(void)
 {
-	int ret = rtas_call(ibm_nmi_interlock_token, 0, 1, NULL);
+	struct rtas_args rtas_args;
+	int ret;
+
+	/*
+	 * On pseries, the machine check stack is limited to under 4GB, so
+	 * args can be on-stack.
+	 */
+	rtas_call_unlocked(&rtas_args, ibm_nmi_interlock_token, 0, 1, NULL);
+	ret = be32_to_cpu(rtas_args.rets[0]);
 	if (ret != 0)
 		printk(KERN_ERR "FWNMI: nmi-interlock failed: %d\n", ret);
 }
-- 
2.23.0

