Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF54B5184
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Sep 2019 17:29:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Xn8f4x66zF1lQ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Sep 2019 01:29:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=lca.pw
 (client-ip=2607:f8b0:4864:20::843; helo=mail-qt1-x843.google.com;
 envelope-from=cai@lca.pw; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lca.pw header.i=@lca.pw header.b="rVxhWBqZ"; 
 dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Xn143yWDzF44R
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Sep 2019 01:22:47 +1000 (AEST)
Received: by mail-qt1-x843.google.com with SMTP id g16so4847028qto.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Sep 2019 08:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=DdZlDwcFPhh8rvrDyAJz9Ugy4zGsw4IHuoR+wrsMaI4=;
 b=rVxhWBqZUXptSOUuNLwzM1QF914j9olYHZoIkK/w1mFyYdP8/hKVApoXbjxJzVEEMe
 bYigUq5wm7A8aUIEVwR3V3QgtfN4RiurGYNjghCz390nLgTPjYyUifJ5E3X9KrpnB5MH
 tusprRofm5unPUiBnSNB9gTWJo88OM+vsG4YjaBHC2hl1sRf1gC5YUmtMGnCRjXywtJF
 bVfmr8nfc55ak855MGlSC7regqhjFilJcxINM9Gd/MpmZSKm1i/tUa40zPrL8DyjV2Sc
 /fCKpLyVWb2+Kyoy9675rc1Kdfu/TkG1bjOcU0DUrxErpMV0Hpn0QH8kszCnRqKHk86U
 m2jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=DdZlDwcFPhh8rvrDyAJz9Ugy4zGsw4IHuoR+wrsMaI4=;
 b=NWKeNvG2MnpkNDkTgYsHIpGn7Ja/2WgOmm/8XsUCJhYWFESjGsGi8A3mLjvwUPh2+T
 ctSK68aIn6+5sAWNTfZAKmCrhE5YjfnwdymE7qwTAgvPI5S4y4Vtx1rwMhOuSZ2pUwqc
 WeDDJnAtLnKMK/qxfeiRLuKuwa1M7e6PU+n1XEsuRFEwdi6FPNLWOukm5/YGuIRNI3C0
 PrUCsR5/iaHzsf0+jboSys2W4gJgcldTPiL8Q8YEIzv/kxRNSfybRX//SzS6NHFE4ibG
 dsy6sxc5gf44wpyJa+mw7wyCKH2+eTefOBcAZYPLCEeKmJZuPPgVOzHjU3cFryb2UgpX
 Buig==
X-Gm-Message-State: APjAAAUjkLo2RmEQvTLmBcVNLz4OqEExCVN+29fSg3pVx5Q6roljncsi
 84SCzB1yZ2bPkcTCzh3IO/Fksg==
X-Google-Smtp-Source: APXvYqxgmEOqbhOFoKOE8dOOPpUk78ORIvn/Vj2ugt6BXuvvexABhWqWrEVBLAGoUFHtZBDZIjDSCw==
X-Received: by 2002:ac8:70d7:: with SMTP id g23mr4315285qtp.78.1568733763286; 
 Tue, 17 Sep 2019 08:22:43 -0700 (PDT)
Received: from qcai.nay.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id b16sm1697306qtk.65.2019.09.17.08.22.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 17 Sep 2019 08:22:42 -0700 (PDT)
From: Qian Cai <cai@lca.pw>
To: mpe@ellerman.id.au
Subject: [PATCH] powerpc/pkeys: remove unused pkey_allows_readwrite
Date: Tue, 17 Sep 2019 11:22:30 -0400
Message-Id: <1568733750-14580-1-git-send-email-cai@lca.pw>
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
Cc: linuxram@us.ibm.com, linux-kernel@vger.kernel.org, Qian Cai <cai@lca.pw>,
 paulus@samba.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

pkey_allows_readwrite() was first introduced in the commit 5586cf61e108
("powerpc: introduce execute-only pkey"), but the usage was removed
entirely in the commit a4fcc877d4e1 ("powerpc/pkeys: Preallocate
execute-only key").

Found by the "-Wunused-function" compiler warning flag.

Fixes: a4fcc877d4e1 ("powerpc/pkeys: Preallocate execute-only key")
Signed-off-by: Qian Cai <cai@lca.pw>
---
 arch/powerpc/mm/book3s64/pkeys.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/pkeys.c b/arch/powerpc/mm/book3s64/pkeys.c
index ae7fca40e5b3..59e0ebbd8036 100644
--- a/arch/powerpc/mm/book3s64/pkeys.c
+++ b/arch/powerpc/mm/book3s64/pkeys.c
@@ -307,16 +307,6 @@ void thread_pkey_regs_init(struct thread_struct *thread)
 	write_iamr(pkey_iamr_mask);
 }
 
-static inline bool pkey_allows_readwrite(int pkey)
-{
-	int pkey_shift = pkeyshift(pkey);
-
-	if (!is_pkey_enabled(pkey))
-		return true;
-
-	return !(read_amr() & ((AMR_RD_BIT|AMR_WR_BIT) << pkey_shift));
-}
-
 int __execute_only_pkey(struct mm_struct *mm)
 {
 	return mm->context.execute_only_pkey;
-- 
1.8.3.1

