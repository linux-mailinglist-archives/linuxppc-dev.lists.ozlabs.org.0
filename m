Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 492DD7131B9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 May 2023 03:45:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QSl3y1QcXz3fNP
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 May 2023 11:45:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=dGhxmHD/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com; envelope-from=dianders@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=dGhxmHD/;
	dkim-atps=neutral
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QSl0H1XfMz3c9K
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 May 2023 11:42:23 +1000 (AEST)
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-64d30ab1ef2so1217169b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 May 2023 18:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1685151741; x=1687743741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4pTZ8PdJlA6i+SWNusBTmTzOcCRT41PhrexiQIb/AKs=;
        b=dGhxmHD/CSkrIECymGSZJgjulMjULoIls2yt2guqhtavg8UVpzegqrUgkex1Az5eH9
         7o8tE1sfBCLwp5jGYATbBDjOwYfBLu2wLAWmL4Fu2votApVdW9ieYsPlWvXbTAoEZCRx
         IE9pmuxtKBeT5vr2dhEgDDxn0u6fSztfVGgQg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685151741; x=1687743741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4pTZ8PdJlA6i+SWNusBTmTzOcCRT41PhrexiQIb/AKs=;
        b=TXhJ6M1SyPncG6E29eYjR6geqHx4puSzLLV10uSenIwhBwtbMKVrepubalcnBQiZZN
         /LspbaO08ZkZu2nagOEpGQIZeaoj3azdeF17G50yHQCbv+NdK5ORqBQcU/ZjZFxdD3zf
         AyY2DQQIUlAuy+Ggp3Inb/cf1dUVXxDvVgrQiSmhOjXFy85VLBuTyroRg5GWKoDSZdtG
         X7M1NzbWIeRLfRltVt97sX9gSuFgHgqFTKsp1gUVyik/v5+82Sb3cSLPiy624R/bgTl9
         xy36fOaOe4tn1eJR1SfRij52HFoMEEFs3NqWoFRJBk0lWyTYTWvXJ0CUQAXsJXdNu2If
         is6w==
X-Gm-Message-State: AC+VfDygAU2rfEbyPOcz3bR5PQ126U0Sv6Xs5E6KTlbotSmOKwJkt6Qh
	2saqwogwD1eZVRUoNrvaxG8ytA==
X-Google-Smtp-Source: ACHHUZ5UUsITWZmTwpdRkqyumpngtWqGIdFge6BCERd9qHLdsT3GhYY3Nylr4mH6Rilg/sSJVj2BfQ==
X-Received: by 2002:a05:6a00:139c:b0:64c:ae1c:33ac with SMTP id t28-20020a056a00139c00b0064cae1c33acmr7231420pfg.25.1685151741546;
        Fri, 26 May 2023 18:42:21 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:4015:7255:c79a:26d7])
        by smtp.gmail.com with ESMTPSA id x25-20020aa79199000000b0063b8ddf77f7sm3202440pfa.211.2023.05.26.18.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 18:42:20 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Petr Mladek <pmladek@suse.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 03/10] watchdog/hardlockup: Don't use raw_cpu_ptr() in watchdog_hardlockup_kick()
Date: Fri, 26 May 2023 18:41:33 -0700
Message-ID: <20230526184139.3.I660e103077dcc23bb29aaf2be09cb234e0495b2d@changeid>
X-Mailer: git-send-email 2.41.0.rc0.172.g3f132b7071-goog
In-Reply-To: <20230527014153.2793931-1-dianders@chromium.org>
References: <20230527014153.2793931-1-dianders@chromium.org>
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
Cc: kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, linux-perf-users@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In the patch ("watchdog/hardlockup: add a "cpu" param to
watchdog_hardlockup_check()") there was no reason to use
raw_cpu_ptr(). Using this_cpu_ptr() works fine.

Suggested-by: Petr Mladek <pmladek@suse.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 kernel/watchdog.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/watchdog.c b/kernel/watchdog.c
index 62230f5b8878..32dac8028753 100644
--- a/kernel/watchdog.c
+++ b/kernel/watchdog.c
@@ -133,7 +133,7 @@ static bool is_hardlockup(unsigned int cpu)
 
 static unsigned long watchdog_hardlockup_kick(void)
 {
-	return atomic_inc_return(raw_cpu_ptr(&hrtimer_interrupts));
+	return atomic_inc_return(this_cpu_ptr(&hrtimer_interrupts));
 }
 
 void watchdog_hardlockup_check(unsigned int cpu, struct pt_regs *regs)
-- 
2.41.0.rc0.172.g3f132b7071-goog

