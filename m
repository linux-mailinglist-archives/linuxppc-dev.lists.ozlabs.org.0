Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E20BB7131BF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 May 2023 03:47:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QSl5q5G8Zz3fWP
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 May 2023 11:47:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=BT+dRPt9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com; envelope-from=dianders@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=BT+dRPt9;
	dkim-atps=neutral
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QSl0L5kfXz3c9K
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 May 2023 11:42:26 +1000 (AEST)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-64d341bdedcso1167561b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 May 2023 18:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1685151745; x=1687743745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QrSnet5OHiffmIbqSfs7JuxPbvC81vL93khftEXYXiY=;
        b=BT+dRPt9LSQc3DlKLaKCfmyetEhgoJWmpfPImFeN4Zed3b/jcHaHA0DNeF4IWSNxJZ
         pQJPuH6IffGDZ6zcJvw+gKseGPHpDIJ1vf2pyqkdOHxYFk6spwySKVC18nfFTiPC4p1U
         vBzpXfaeufNjvxECgwzvl9XLbFJ2N0kpAe2ls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685151745; x=1687743745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QrSnet5OHiffmIbqSfs7JuxPbvC81vL93khftEXYXiY=;
        b=EzxD9PzS1F0Nc55p2uwnZNzI1zdZvMlHx9QlNTYbV6Q9kx69iQ8a7lBbBHSmKEN843
         zY/R3z/HtZ7sRQVRGZW6/F2w7oeDqksgPSAwlZAIPsfXvFXS75YK853KFmgBxbudB1Gn
         R431L1HTZGWD7+y3yTtMmVxHcwMma6FRBxoQJ0JfCSqkJpc6GcVu0VEYTLttowIJZXVm
         533dbMKjh5TvbvubPapIwkdFNgM15a/vYoQL9LbePpxxa/gaDYtIW7QwqPtFgx3Rrpo5
         aZmuZJW9FCvt6m9V81IY4Bz1sMJsuc3nphcC06ooTB3Ehz2bDiyleJXZpHU9lwhVjtmV
         0UyA==
X-Gm-Message-State: AC+VfDx27PI0crsCU86/1vuwuaJ1SD727Fc3AuM6e4KUFSPZ4a5Dpg5I
	ein/WjPE8yILS0IoQughm3jQ5g==
X-Google-Smtp-Source: ACHHUZ40Aya6L3K9wWALtZHzSbN8jGhO+EVfPlmtY3VStdyZv7cwbEJlQWNy+d0vp5EsQiqF5NEtCg==
X-Received: by 2002:a05:6a00:2386:b0:64d:1185:241a with SMTP id f6-20020a056a00238600b0064d1185241amr6871168pfc.5.1685151745069;
        Fri, 26 May 2023 18:42:25 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:4015:7255:c79a:26d7])
        by smtp.gmail.com with ESMTPSA id x25-20020aa79199000000b0063b8ddf77f7sm3202440pfa.211.2023.05.26.18.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 18:42:24 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Petr Mladek <pmladek@suse.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 05/10] watchdog/hardlockup: remove softlockup comment in touch_nmi_watchdog()
Date: Fri, 26 May 2023 18:41:35 -0700
Message-ID: <20230526184139.5.Ia593afc9eb12082d55ea6681dc2c5a89677f20a8@changeid>
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

In the patch ("watchdog/hardlockup: add comments to
touch_nmi_watchdog()") we adjusted some comments for
touch_nmi_watchdog(). The comment about the softlockup had a typo and
were also felt to be too obvious. Remove it.

Suggested-by: Petr Mladek <pmladek@suse.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 include/linux/nmi.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/include/linux/nmi.h b/include/linux/nmi.h
index 3a27169ec383..6c6a5ce77c66 100644
--- a/include/linux/nmi.h
+++ b/include/linux/nmi.h
@@ -140,10 +140,6 @@ static inline void touch_nmi_watchdog(void)
 	 */
 	arch_touch_nmi_watchdog();
 
-	/*
-	 * Touching the hardlock detector implcitily pets the
-	 * softlockup detector too
-	 */
 	touch_softlockup_watchdog();
 }
 
-- 
2.41.0.rc0.172.g3f132b7071-goog

