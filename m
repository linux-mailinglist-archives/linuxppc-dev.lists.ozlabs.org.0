Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E602445DA7C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 13:55:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J0HsP5hcdz3dll
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 23:55:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=XYbEGCl7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a;
 helo=mail-pl1-x62a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=XYbEGCl7; dkim-atps=neutral
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J0HmY1zRVz3c6R
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Nov 2021 23:50:53 +1100 (AEDT)
Received: by mail-pl1-x62a.google.com with SMTP id y8so4501311plg.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Nov 2021 04:50:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r+n/orxsGE5Dy6sCMbDmnBv6aqkBCkukdq9o2NqgSIg=;
 b=XYbEGCl7P2zTPLe/6HwjrMqZB4EYAKRTPbtWLQlSItGICsndSwUVOzoXvhd49o8/lf
 iX73Lowl/V8JumBTtIs6cZkxPFUcklJwxjy1XWT3u7E8zWyZcBKLUMaRVjCw6agSYJ3I
 wM+9e8nF6w7AhWv87RsnU54dwgJSXmzOkvm31zKzm5S8T6VfxKHbOcsLwhqp7ipgRxVD
 skO4xPXfYSTAwlp8XQA7WCQXaR1xUNUObDSGzwq9lfLBJ6t+4EJeNryGjPdlWhIMXPyZ
 LNYC46oL+bxiutU9cacLmc0/Dh14CnfKEGV6aOyowr7VXgO8bKisTeuXNM1gO7+tjH9Z
 TTNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r+n/orxsGE5Dy6sCMbDmnBv6aqkBCkukdq9o2NqgSIg=;
 b=jjdyC4BoCvZpd0JVolhpZQBJADpEganGykRdnOMBiVWIg2T8Do37Rb4Mp7SF4CyphW
 9UvavmxPNPBOtVyzuTNdn7sMmWXeITqnVh4+8K7I4f4Vx4Xizmc78w8D9LHpJAuNu5Uj
 Kp8RFRWQ5sHQPx4HbOr0q664Y66AB6Uws87DYKxrJxP1tTSYlwcD2EhETV08M8fTFOlf
 q/TxQVIqPkGr41DKX1VxiRSLWyI692oeLK4jGO2BEUwayETNddghrAvUlb7rVeALM8pD
 97wbN277ixfxtoYdZdBmG/9DyhbKEBk56tFX7A46ioRNzfwPgOFX9WusZ9m6UXEMctQl
 C9/g==
X-Gm-Message-State: AOAM530U294QMn7YP6jDaHFOa8+dWvMTdC7SConacEgOKZPK9q2XrWzJ
 DfQXoU6nI/i4zCuT4Mjr2hBOH77YAmo=
X-Google-Smtp-Source: ABdhPJzA5iOGk+TI8mq8UipgzZbasB/H9tbywcQ3hOAPejoltJTaCs2LGpLek6mXCPvouCX10WMDQA==
X-Received: by 2002:a17:90b:1b06:: with SMTP id
 nu6mr6654839pjb.155.1637844651047; 
 Thu, 25 Nov 2021 04:50:51 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (115-64-213-93.static.tpgi.com.au.
 [115.64.213.93])
 by smtp.gmail.com with ESMTPSA id gc22sm7242851pjb.57.2021.11.25.04.50.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 04:50:50 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 06/17] powerpc/pseries: lparcfg don't include slb_size line
 in radix mode
Date: Thu, 25 Nov 2021 22:50:14 +1000
Message-Id: <20211125125025.1472060-7-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211125125025.1472060-1-npiggin@gmail.com>
References: <20211125125025.1472060-1-npiggin@gmail.com>
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

This avoids a change in behaviour in the later patch making hash
support configurable. This is possibly a user interface change, so
the alternative would be a hard-coded slb_size=0 here.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/platforms/pseries/lparcfg.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/lparcfg.c b/arch/powerpc/platforms/pseries/lparcfg.c
index f71eac74ea92..3354c00914fa 100644
--- a/arch/powerpc/platforms/pseries/lparcfg.c
+++ b/arch/powerpc/platforms/pseries/lparcfg.c
@@ -532,7 +532,8 @@ static int pseries_lparcfg_data(struct seq_file *m, void *v)
 		   lppaca_shared_proc(get_lppaca()));
 
 #ifdef CONFIG_PPC_BOOK3S_64
-	seq_printf(m, "slb_size=%d\n", mmu_slb_size);
+	if (!radix_enabled())
+		seq_printf(m, "slb_size=%d\n", mmu_slb_size);
 #endif
 	parse_em_data(m);
 	maxmem_data(m);
-- 
2.23.0

