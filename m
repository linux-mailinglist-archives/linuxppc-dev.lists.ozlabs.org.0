Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E8EBB46505B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Dec 2021 15:47:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J424r6HPDz3dg3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Dec 2021 01:47:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JP/KDNw1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::536;
 helo=mail-pg1-x536.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=JP/KDNw1; dkim-atps=neutral
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J41yV331bz3bfv
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Dec 2021 01:42:26 +1100 (AEDT)
Received: by mail-pg1-x536.google.com with SMTP id 71so23833593pgb.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Dec 2021 06:42:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/TWT/1VO2cM4mkWhFKaRQ6kP++Q2gMqGBqdMOR/cLj0=;
 b=JP/KDNw1TWsy2a1df1pKP/DyKBd78xQXu1B5wPrdCARWeCSs8tsd2Mph7tYwvRAOb5
 7keLAo1JIF+Ti481X0DVlBb4CrUMvWPCS6U/Vrq5UqigJd2sZAJY1P5wliWERxqwGhWc
 WUpCSbPUaWeqFAZjBKCg4EwucCQmXrhxcBzzcwwtwr3A4HNpXyO3Nr/KjLTFCOANsfTs
 FiTUMF9DisKY0y8KdE2wSavEzj715AxnAnvRbOj3oEN/Pmc0BkzXSLZfqXWOA7C+z5R4
 lBhQeJXExnlkY1r4MR7Vy/y10ZbfFfm244TvhunOpLG0UBhUXhCt+8dP9Isea2YlSSnI
 eN6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/TWT/1VO2cM4mkWhFKaRQ6kP++Q2gMqGBqdMOR/cLj0=;
 b=5lihWZfNIb20Xn2YqwYjR0hNY6Lnn9VV9JLhtpox1nmDnw13yPaJu7muLggskkKOML
 ujpFfL3sRHmgK3yXK/JGUR9whtcAPhSHMFE7hWSssm5NUW4fwGGk37YbnuIPzii9cCE5
 AC0s2fT3RQCTkn8CukcctLvhXFTaY1sG0/jILYkAq4W/M2vUnOMibKUQWHcv78rsw1vb
 aQvK/3+Hx6puPTW9Ua7DbD3sFasz+6A4i95O0ilDK8NI1oR7A2n7+Vxn5rxIytHHZCoI
 srqbfRUV4o055VLif90j4AbweXjSXlj+5Tt9VW9nzAkXEdkqUSa/FrJjeDnrBbshxoxb
 5Muw==
X-Gm-Message-State: AOAM533c8BmkT+8R74nNd8/Cc31BmSJZMLqvFvahjE28tVCqQw42akCw
 WAQ+fw0lIgOf/zZcN0KAnt74KBuJTQU=
X-Google-Smtp-Source: ABdhPJzqxGvmuhIx/JYCp99cIsHPbrgQFC3uq16YEkxloENsoCp3+75J2bmI6tvhvEdlhxP+SqcRcw==
X-Received: by 2002:a63:554:: with SMTP id 81mr4997582pgf.298.1638369744230;
 Wed, 01 Dec 2021 06:42:24 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (115-64-213-93.static.tpgi.com.au.
 [115.64.213.93])
 by smtp.gmail.com with ESMTPSA id e13sm29230pgb.8.2021.12.01.06.42.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 06:42:24 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 08/18] powerpc/64s: Make flush_and_reload_slb a no-op when
 radix is enabled
Date: Thu,  2 Dec 2021 00:41:43 +1000
Message-Id: <20211201144153.2456614-9-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211201144153.2456614-1-npiggin@gmail.com>
References: <20211201144153.2456614-1-npiggin@gmail.com>
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

The radix test can exclude slb_flush_all_realmode() from being called
because flush_and_reload_slb() is only expected to flush ERAT when
called by flush_erat(), which is only on pre-ISA v3.0 CPUs that do not
support radix.

This helps the later change to make hash support configurable to not
introduce runtime changes to radix mode behaviour.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/mce_power.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/mce_power.c b/arch/powerpc/kernel/mce_power.c
index c2f55fe7092d..cf5263b648fc 100644
--- a/arch/powerpc/kernel/mce_power.c
+++ b/arch/powerpc/kernel/mce_power.c
@@ -80,12 +80,12 @@ static bool mce_in_guest(void)
 #ifdef CONFIG_PPC_BOOK3S_64
 void flush_and_reload_slb(void)
 {
-	/* Invalidate all SLBs */
-	slb_flush_all_realmode();
-
 	if (early_radix_enabled())
 		return;
 
+	/* Invalidate all SLBs */
+	slb_flush_all_realmode();
+
 	/*
 	 * This probably shouldn't happen, but it may be possible it's
 	 * called in early boot before SLB shadows are allocated.
-- 
2.23.0

