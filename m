Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9647142F766
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Oct 2021 17:52:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HW9km1YPCz3cXG
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Oct 2021 02:52:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=PNE6NwfI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52b;
 helo=mail-pg1-x52b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=PNE6NwfI; dkim-atps=neutral
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HW9cV6gtTz3c9p
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Oct 2021 02:46:50 +1100 (AEDT)
Received: by mail-pg1-x52b.google.com with SMTP id q5so8955829pgr.7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Oct 2021 08:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/TWT/1VO2cM4mkWhFKaRQ6kP++Q2gMqGBqdMOR/cLj0=;
 b=PNE6NwfIZT1A0Ypd6u8SVVq9d+TRuWvei0geMjhl8TptP2Ff2B3edRxXS4bKW55uKJ
 A1thBjSp65LGO7LXsa/lAvtB1UqmjyZCvS7af5Pb4L3O1r9ZXI74UhLffi/tn+VK+5dS
 v2/P787ev/1xOZyWe7uPRSHPWpHhUHLISHm4QOZF+SAvO6VzZu2wyl+BKF51qVkkTUkX
 Vq3r5CpTF0xLjSwPVlLNIthsNmkpSrWB5p79aZIWt3Nlwte2egHv598yIAoO75D8iXEv
 VaLoksVOD87ax9AvnfasUC8DGqBBCZT+a/5mBu6lnbX6jOvVfwbfLxRrPSv/7vAEu2cm
 w5yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/TWT/1VO2cM4mkWhFKaRQ6kP++Q2gMqGBqdMOR/cLj0=;
 b=ZgjUbA8n5bDFAtuBRBG0GticcOeMUKunQAs3flYNEK5fPWaXFQy6UOHj/0wdZCjMnD
 pAUqYmlsbjZn/ls2UU3hOy5NHos70YzWaF5jMKWVATqRDwwOuXJEbnXQo8qwsSG5FrtT
 Q2/VJl515XGZv73ipjX/qyqvjbTf9BadJbF9lCWtletKUEMpwr34NnqSq5866FFLsgJD
 h77VSrcNOQpzlCWrFCbcw0jskZ+4L90jAMveDJGUpqHGZf9P7QhhmamrcSVZq8p9Kw12
 aB2RCfkPYcFmqxQHgqQWwubduKAaElTjN/t464a6l5V6EteM0y56S9X2LU3FSSWOEP8E
 hrQQ==
X-Gm-Message-State: AOAM531a5i6BrvYc4ah6iK4Q9wRvtsY7hbdGeyEY8MEIG7XfmISzTxar
 /q73pq9nm1Xxjzr1bQSW15n3vxJybn4=
X-Google-Smtp-Source: ABdhPJxWQe3Ik4PS+VI75Wu5iXVfERbMiWQA7GUwpw2xAqjpk81/3JZmVO2UKFCXPoickZMMPND6MQ==
X-Received: by 2002:a05:6a00:24c1:b0:44d:3047:4229 with SMTP id
 d1-20020a056a0024c100b0044d30474229mr12479004pfv.70.1634312808866; 
 Fri, 15 Oct 2021 08:46:48 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (14-203-144-177.static.tpgi.com.au.
 [14.203.144.177])
 by smtp.gmail.com with ESMTPSA id y1sm5392092pfo.104.2021.10.15.08.46.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 08:46:48 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v1 08/11] powerpc/64s: Make flush_and_reload_slb a no-op when
 radix is enabled
Date: Sat, 16 Oct 2021 01:46:21 +1000
Message-Id: <20211015154624.922960-9-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211015154624.922960-1-npiggin@gmail.com>
References: <20211015154624.922960-1-npiggin@gmail.com>
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

