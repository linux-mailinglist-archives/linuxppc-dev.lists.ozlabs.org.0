Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B928D1A069D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 07:38:26 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48xGR32Wn7zDqZQ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 15:38:23 +1000 (AEST)
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
 header.s=20161025 header.b=YkcdIn0t; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48xG0S3X37zDqvP
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Apr 2020 15:18:48 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id a13so271799pfa.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Apr 2020 22:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4FEaht7zxwBjHD8wzIED7TDrVFdT0iycKSLrGAMohws=;
 b=YkcdIn0tcT+72BWwnUaqlNV6Ag60YiBFuaR6DCtSrsySMha7X2gj/p6mSLbKOC7hN0
 L5MKtFRZGJ4Lq94VdEvKiQ/gYi4Dq6JwfKFwJxqJIky1KLw/XfLqOGvKVYDX6oLp6ab8
 hdUfxGxBkxk3765mw8p53Fq74QVCn1z0VBi30ep/cmj1k3VO2klA95IVOl6LcFlhBRJt
 IFvz+qPHvuMLfpv48fRIZE2N370AEdn2KVUZMruW4QIAgjcabIXoLdYOYMLNHcOT4m03
 zcURCLT0qgE590mr0LJ1eP2yUs24afUpNIeaenGn8n38vLJ7deDy82XIYhNNAKdY5ctx
 zAeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4FEaht7zxwBjHD8wzIED7TDrVFdT0iycKSLrGAMohws=;
 b=PqvTt7hiOG7X58cdvpykof49iSDTVeVtaulOALmdCnJM3h1bBP0wixFPviZAfxjNmh
 mHe89ysHpn5JPY+Eo7FQru6EJt1y0YiS9u3JyGYgiQObDi11s+PBjXVFDeOIK6hC2Gr9
 Z7js2yR5ABo+c8J2Uh6ansjni00jQnhYX/snW8wR7IFdI26JFXCTGiHzZm03Nl2aJERr
 UwyhzILs/wFwojNZVFR0/7UVtuNVYdgPyBp/tWlnaQ4DEUzrEhsDGGC1PCcwwLRc+fKk
 YJRzi038cKOkXZL8JK+QlO/FHpTMO5Yklz6Peg4XRmhtuA/nxYvOpAZVSkdb5o/DYqjp
 bVGQ==
X-Gm-Message-State: AGi0PuZEwfXMBMEjqe4iGAoixtx6qlwfZzIs5k97YFeEn488sWcnhIRp
 /KFQvWVJcY8Z+m4yD7NMKkGzsJMB
X-Google-Smtp-Source: APiQypKhrzvAC7gCas+7eA9yD2dED2VpZoUQw1qABA6Vl3dJf7mH0llYo2WGATVv9g2riCYcfgB14w==
X-Received: by 2002:a63:a746:: with SMTP id w6mr367151pgo.76.1586236726383;
 Mon, 06 Apr 2020 22:18:46 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (60-241-117-97.tpgi.com.au. [60.241.117.97])
 by smtp.gmail.com with ESMTPSA id y17sm12866486pfl.104.2020.04.06.22.18.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 22:18:46 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 10/15] powerpc/pseries: machine check use
 rtas_call_unlocked with args on stack
Date: Tue,  7 Apr 2020 15:16:31 +1000
Message-Id: <20200407051636.648369-11-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200407051636.648369-1-npiggin@gmail.com>
References: <20200407051636.648369-1-npiggin@gmail.com>
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
index d65bc38bcb8f..4fd138ae26fd 100644
--- a/arch/powerpc/platforms/pseries/ras.c
+++ b/arch/powerpc/platforms/pseries/ras.c
@@ -468,7 +468,15 @@ static struct rtas_error_log *fwnmi_get_errinfo(struct pt_regs *regs)
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

