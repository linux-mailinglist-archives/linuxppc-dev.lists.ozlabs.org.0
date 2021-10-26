Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5DA43B334
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Oct 2021 15:32:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hdt5w19h7z3bgl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Oct 2021 00:32:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux-powerpc-org.20210112.gappssmtp.com header.i=@linux-powerpc-org.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=n1oz3mV0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux-powerpc.org (client-ip=2a00:1450:4864:20::334;
 helo=mail-wm1-x334.google.com; envelope-from=kda@linux-powerpc.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linux-powerpc-org.20210112.gappssmtp.com
 header.i=@linux-powerpc-org.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=n1oz3mV0; dkim-atps=neutral
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hdt5D1Y20z2yKZ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Oct 2021 00:31:26 +1100 (AEDT)
Received: by mail-wm1-x334.google.com with SMTP id
 b82-20020a1c8055000000b0032ccc728d63so915281wmd.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Oct 2021 06:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-powerpc-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:subject:date:message-id;
 bh=I+8uG2FYNkIrEOafWWHp60ANglgogN/grWleNrBH//s=;
 b=n1oz3mV0zFfTwE2xtJtRGCdRN6v/EQ2rXC16mfBzgNM5YRTlkwVrcKYRSgvTc7pHVt
 h5ZCvMPGILB5mZJ8Uj4PXFE6sg7BGhIcKL8VFU4z5fbnfwkfkJRWC26waFCoIR9nqZXx
 1NBR0LeaOvpYC875TP1Ea2CyOogtEzGGK+8DOdjBPl/YFDd2QR7/MKMBm3neOKynaftJ
 wvEhBTLN5gCNFd8rNugxY+eZYyfHr91JYpPu23+S71x+rZMDrWWidVnbadzXkB8tr6CS
 T6vLqtbfESf4r4oz9qidTgB2mmfxllp8NWcwbN1vzshJu+E4RETKgY9iF4MtWdIUoM7C
 4lWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=I+8uG2FYNkIrEOafWWHp60ANglgogN/grWleNrBH//s=;
 b=Q5rM/0zQOKPcotlS0Xve/lx+GiHhbAJPwugQo6Mjt5ScyWpqh1SQbhn+ONK4qxO+Yh
 HFUwvL9jjRTvmzslrOGC2xPIccWUup8ffpAt8MeaGTwtd9yup5h1SVgygyaYEZ2FnR/s
 YXS1t3GpRbIZj/KIn0ELnC4r5iCy9Pe9wawTjh01Xzm5Ub420Kref8ZoczWsO9+DeFiM
 v/6MYhbncB7iZJFw5mypM5EmJwP3XliCMvCH4bHBbwmjBjlpq7XXevSxMYs3RF2YYxzh
 aP5G+dGV5Qi4T8fFISP+H/9JUWgs3iLSamhBqeS7XrxotkNbS0cgwrvOOgryEgCtkkYW
 1CSA==
X-Gm-Message-State: AOAM533elj1ZZr7S/44rynMZWZ+ewVkM95jidDpgVuOlx9hiKyzR8OOn
 0A9m9rB9DMuTxHBFRzBSRALMp3kiYyiClk8xy18=
X-Google-Smtp-Source: ABdhPJyNURqbYwLmXGBclRu1AV4Q1tZ2fF6rlBeiHQdHrDZ7CScOmBux/B34lfFa8elomcQa2sDa/g==
X-Received: by 2002:a1c:750b:: with SMTP id o11mr27632285wmc.5.1635255080726; 
 Tue, 26 Oct 2021 06:31:20 -0700 (PDT)
Received: from localhost.localdomain ([5.35.48.193])
 by smtp.gmail.com with ESMTPSA id m9sm2219192wrx.39.2021.10.26.06.31.20
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 26 Oct 2021 06:31:20 -0700 (PDT)
From: Denis Kirjanov <kda@linux-powerpc.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/xmon: fix task state output
Date: Tue, 26 Oct 2021 16:31:08 +0300
Message-Id: <20211026133108.7113-1-kda@linux-powerpc.org>
X-Mailer: git-send-email 2.16.4
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

p_state is unsigned since the commit 2f064a59a11f

The patch also uses TASK_RUNNING instead of null.

Fixes: 2f064a59a11f ("sched: Change task_struct::state")
Signed-off-by: Denis Kirjanov <kda@linux-powerpc.org>
---
 arch/powerpc/xmon/xmon.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index dd8241c009e5..8b28ff9d98d1 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -3264,8 +3264,7 @@ static void show_task(struct task_struct *volatile tsk)
 	 * appropriate for calling from xmon. This could be moved
 	 * to a common, generic, routine used by both.
 	 */
-	state = (p_state == 0) ? 'R' :
-		(p_state < 0) ? 'U' :
+	state = (p_state == TASK_RUNNING) ? 'R' :
 		(p_state & TASK_UNINTERRUPTIBLE) ? 'D' :
 		(p_state & TASK_STOPPED) ? 'T' :
 		(p_state & TASK_TRACED) ? 'C' :
-- 
2.16.4

