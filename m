Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 744BA192641
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Mar 2020 11:55:18 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48nQ4g5DP2zDqJC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Mar 2020 21:55:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ffGwvcVh; dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48nPdh00dTzDql5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Mar 2020 21:35:19 +1100 (AEDT)
Received: by mail-pl1-x644.google.com with SMTP id g2so657483plo.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Mar 2020 03:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YqBOA8KZ0+WN1P0HnkLjWbY6i7lEA6O9z/TOKUZWzd8=;
 b=ffGwvcVhlwe7TwfeU5NU8W4N9FHL8vE7e6FmcFdsNLTpS4VM0/TylB5Dd1ms430Obb
 711MKHTtZQzI5wd4H0DeygWkJGJ+Ax04O3dr7Zx6KMmkUgV1bYeEHw+73JhmKczIbJ5t
 +JuaC17/+nKVay/q1+YyTQTyrNVM8gc+fO8YjVPOcZ2iblFYpvA594lwvQl4X8hiB9Zo
 9p00G2alZy9aJL7ObooOPf0yjldOXdLnJBzOnWD6/WwzCrt2cuMrtKGzuFHU2W5WGPN3
 vYTeTQFBftGU9RkgOhfkD9TdEFwhYh5iFc0tNWj2hjuvBS5/41QJlM3JM/GzX0woV+Vp
 9fJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YqBOA8KZ0+WN1P0HnkLjWbY6i7lEA6O9z/TOKUZWzd8=;
 b=p7+alqxB6qVatNN3J0wOX/p8RKIzhBAnS+qjqaab4O5eCi1fJ0Vg1zDEPgir6GuAuC
 uH3vKhWNWIY2GOdVkFjmhKXMktnryASKuQ+5F0jOnKwfDRnVXc4iCETfiCSnlCZXhVNV
 nX4CsHsGLoNNDTLteT/yLv69g6rtzRqJxJr9iezjK/SNkc4Ah5PAXQDFSPtPvA2RS7YW
 bqMmtbX5YjAQawQrWuxG4Xqrt6EPrcIMzWPUShp2CQQekSmDONv2ptHU3PHDN20niFZ9
 xngEkF5Up78IfFWp8rlmRuFYPjcoVQdzC1v642oDCQJpFO0Amho+nqiMhu4mnxh0XuhJ
 2QZw==
X-Gm-Message-State: ANhLgQ3jK7vJKBH4Sw53TKWAB0bvEeVoShYrPUC9H7P69+fVQSZp2jvl
 2jpFWoghqbW5U0uQuo1HSyAiRUwi
X-Google-Smtp-Source: ADFU+vtmYIKQXPFs7WzTxXJEWLnUWrPwN0HegKYQe2WSpv2ZKlAzBVQ/62BRqCDPPIrDNFWhv2g1xQ==
X-Received: by 2002:a17:90a:928c:: with SMTP id
 n12mr3021947pjo.45.1585132515867; 
 Wed, 25 Mar 2020 03:35:15 -0700 (PDT)
Received: from bobo.ibm.com (14-202-190-183.tpgi.com.au. [14.202.190.183])
 by smtp.gmail.com with ESMTPSA id b9sm16549701pgi.75.2020.03.25.03.35.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Mar 2020 03:35:15 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 09/12] powerpc/pseries: machine check use
 rtas_call_unlocked with args on stack
Date: Wed, 25 Mar 2020 20:34:07 +1000
Message-Id: <20200325103410.157573-10-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200325103410.157573-1-npiggin@gmail.com>
References: <20200325103410.157573-1-npiggin@gmail.com>
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

