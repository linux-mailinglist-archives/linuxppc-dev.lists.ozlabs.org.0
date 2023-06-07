Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D95B1725B56
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jun 2023 12:11:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QbjmY4TZ0z3dwS
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jun 2023 20:11:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=XcpHcOdN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=XcpHcOdN;
	dkim-atps=neutral
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qbjlf2Ycsz3bkM
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Jun 2023 20:10:36 +1000 (AEST)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1b065154b79so3294625ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Jun 2023 03:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686132631; x=1688724631;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UGNC/Z1yReKIYnoDosF1ViULwRIOYtWfSX977YwzCcc=;
        b=XcpHcOdNSk4wl3+ToWnekQfBr8B+ZZgFIhWRNnwJZq19TteBSXzOuy2VyKWCLX8dCP
         1FQ7dMHjnkB1tDA/OlAeFwcqy/DrAZb9BQJFzOTwxd65njfrBuAlEFo4gZcxFKlyhgJW
         /D6F3c9tIxigr8kXhWH7xGcEz+ZjPmI0ZB1DKE0mDs+NT2WC0QSpub9YBtP1YLGpTV1m
         zTkvAzzWoN5AiGqV1nI501ht2Eo6ZwX9o0yu+OO9FUC2jZOxkepzhdDF34vgE2S1gLjF
         DEZY/lklb83ZiVihozVn81DfWXE5JQpmmHOkmHLRaJKGnSR3MU4Pvbp346gZ/Ukr8eKr
         fQLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686132631; x=1688724631;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UGNC/Z1yReKIYnoDosF1ViULwRIOYtWfSX977YwzCcc=;
        b=KIJO0PCUYWcXil2Et3fKJbtdrnYgpu8/hOuJRrw2WyX53PDvM0nSsz/781q4509io7
         bbGJw0AjQkr6UiHIua2VGCwFbC4SPaskWVozT/HRmRsuqJol7rMgkNkSe9ViO2Cpcdli
         rxW7X4uXGvsf9fzpLv3ENyn58VypHIVoYXJi5Xo50lRZywXL0u5oeckd6dPg9XbzfOY8
         Ci3B3TEkb4fcvWR6aEhm7UArxcjXo1dvhDQTn7Nz0ruLkuk3rwsGvMHk1eIISp9jsgFD
         CCEmeyGg3vkmPriiXr7VW4Y8vPdhwRTVXdZr9uZFwy8by2agazbGBnrnPxSYffz3l1pd
         M0ZQ==
X-Gm-Message-State: AC+VfDx+0bfK7Z8gKWaX/89IxnlhXi354ROOi+8R6Oh0rrceCuGXweF6
	e6CdatTB6VaZ3fX+ekPscUPb0qqwkdk=
X-Google-Smtp-Source: ACHHUZ6Yf986UERMUHywtEs6+KUbtglSZoYqV6WE9aozeY++NsNf5NI2DB1Iehz5fItijTKs//ANHQ==
X-Received: by 2002:a17:903:442:b0:1ac:6fc3:6beb with SMTP id iw2-20020a170903044200b001ac6fc36bebmr5205605plb.9.1686132631283;
        Wed, 07 Jun 2023 03:10:31 -0700 (PDT)
Received: from wheely.local0.net (58-6-224-112.tpgi.com.au. [58.6.224.112])
        by smtp.gmail.com with ESMTPSA id n11-20020a170902e54b00b001b03b1e2e1bsm10081402plf.115.2023.06.07.03.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 03:10:30 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/64s: Fix VAS mm use after free
Date: Wed,  7 Jun 2023 20:10:24 +1000
Message-Id: <20230607101024.14559-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.40.1
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
Cc: Haren Myneni <haren@linux.ibm.com>, Sachin Sant <sachinp@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The refcount on mm is dropped before the coprocessor is detached.

Reported-by: Sachin Sant <sachinp@linux.ibm.com>
Fixes: 7bc6f71bdff5f ("powerpc/vas: Define and use common vas_window struct")
Fixes: b22f2d88e435c ("powerpc/pseries/vas: Integrate API with open/close windows")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
How's this for fixing your vas_deallocate_window warning at
radix_tlb.c:991 ?

I added a few new warnings in the TLB flush code recently which is
why these new warns are showing up.

Thanks,
Nick

 arch/powerpc/platforms/powernv/vas-window.c | 2 +-
 arch/powerpc/platforms/pseries/vas.c        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/vas-window.c b/arch/powerpc/platforms/powernv/vas-window.c
index 0072682531d8..b664838008c1 100644
--- a/arch/powerpc/platforms/powernv/vas-window.c
+++ b/arch/powerpc/platforms/powernv/vas-window.c
@@ -1310,8 +1310,8 @@ int vas_win_close(struct vas_window *vwin)
 	/* if send window, drop reference to matching receive window */
 	if (window->tx_win) {
 		if (window->user_win) {
-			put_vas_user_win_ref(&vwin->task_ref);
 			mm_context_remove_vas_window(vwin->task_ref.mm);
+			put_vas_user_win_ref(&vwin->task_ref);
 		}
 		put_rx_win(window->rxwin);
 	}
diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platforms/pseries/vas.c
index 513180467562..9a44a98ba342 100644
--- a/arch/powerpc/platforms/pseries/vas.c
+++ b/arch/powerpc/platforms/pseries/vas.c
@@ -507,8 +507,8 @@ static int vas_deallocate_window(struct vas_window *vwin)
 	vascaps[win->win_type].nr_open_windows--;
 	mutex_unlock(&vas_pseries_mutex);
 
-	put_vas_user_win_ref(&vwin->task_ref);
 	mm_context_remove_vas_window(vwin->task_ref.mm);
+	put_vas_user_win_ref(&vwin->task_ref);
 
 	kfree(win);
 	return 0;
-- 
2.40.1

