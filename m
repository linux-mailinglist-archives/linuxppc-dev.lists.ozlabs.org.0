Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5F842F757
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Oct 2021 17:51:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HW9jJ1mChz3dcn
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Oct 2021 02:51:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=kr6jGNeq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::532;
 helo=mail-pg1-x532.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=kr6jGNeq; dkim-atps=neutral
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HW9cQ2yvXz3c7m
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Oct 2021 02:46:46 +1100 (AEDT)
Received: by mail-pg1-x532.google.com with SMTP id e7so8987893pgk.2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Oct 2021 08:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r+n/orxsGE5Dy6sCMbDmnBv6aqkBCkukdq9o2NqgSIg=;
 b=kr6jGNeqmxPyi2KUv7eiBYpD0oK7CSr4Fq8ghTP/rW24pqGS5yVzU/1b83s4JJ0oV3
 M9yGniTyHzyOWhn+NcbAE8ybS4mk1LTQfQNOWjC2g584N+YDxyTjhoqNhiDMbWGE68Ge
 2ZkJMfVLTHoQIbYKrFG/iPO7A9MT8DttKk+IEwf/3+vhyE22XxmzXmOeGBNHA7pMQcCE
 QauaYP1tzUAcd/p6xfE23qOGMT+6isRTmOhxLvUWmUamMNHtyKUvRfwj/VXCDw9VO5TB
 IQpRIiMBQKMxAbw9NayjM4tnNR4KF2fY5hMVXEVJO9PHcLpFyEoK0BvJjEszFoWmqDHk
 kkkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r+n/orxsGE5Dy6sCMbDmnBv6aqkBCkukdq9o2NqgSIg=;
 b=jRMfVbFhAJGQ0xDGtkSuATxtVyhAu8IB+wvU5nGwRQfRR6Vn/5Cb5yg8Qd6TUNHxoX
 Rt+u60gOubIzaaQUuo/jrxxpXQAtNHCwQWEYnBmKj0Ef4/8NR9TktHbHLOhd1+lzIz49
 CXbcUo8zYUEHMqMVOacvlpOOE6Ycxh+VLXzfHqXA/1eJMQX7eSdpRtZmkAxokMoo0Vp9
 xi8iorN0h7WKs11u1yPDDI0FkLft1W1CTkCuk7ChLSmCiPMFUnWs5tcblGPFzf0erbav
 lpT7gnH4V+gl3ZFMNmwrKnY+IwBU8Al98HoJRUvG39uXVdi8kZ4kzASahYCZL06DJYwN
 mhTw==
X-Gm-Message-State: AOAM533GKCycOULPy9MEzvbs/Z1aG3E8KIxX5nkHmjoSLCAQfk2hLPfS
 UY1AmKJ5z2u6p8DcsMnBHGP00uYrwZw=
X-Google-Smtp-Source: ABdhPJypshXZzk01lgCt8An0P9vRiqBRXvsKlxBhe/Du9NpuncDS/U6lVOpyE0jCcbQnIj12tQaZkQ==
X-Received: by 2002:a62:27c7:0:b0:44d:b86:54f2 with SMTP id
 n190-20020a6227c7000000b0044d0b8654f2mr12549928pfn.68.1634312804535; 
 Fri, 15 Oct 2021 08:46:44 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (14-203-144-177.static.tpgi.com.au.
 [14.203.144.177])
 by smtp.gmail.com with ESMTPSA id y1sm5392092pfo.104.2021.10.15.08.46.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 08:46:44 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v1 06/11] powerpc/pseries: lparcfg don't include slb_size line
 in radix mode
Date: Sat, 16 Oct 2021 01:46:19 +1000
Message-Id: <20211015154624.922960-7-npiggin@gmail.com>
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

