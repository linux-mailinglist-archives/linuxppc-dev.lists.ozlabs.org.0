Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F757131C7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 May 2023 03:49:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QSl8c1S3Zz3fms
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 May 2023 11:49:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Aa2FnlO7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com; envelope-from=dianders@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Aa2FnlO7;
	dkim-atps=neutral
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QSl0S0kFVz3fF1
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 May 2023 11:42:32 +1000 (AEST)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-64d2c865e4eso1233757b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 May 2023 18:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1685151750; x=1687743750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hhZKQ5chvzZjdXAK7yuxvuaTNwo4ZylkC6Gy3ujvEec=;
        b=Aa2FnlO7cA7GOt4jdHYmDdd1WDaYmdWhcVEaBF5A+6UaJVFXdOsQgbvTyfqoPjk4bh
         xDmNcaix5P9IJQEn4sRdp17S3cm+b5XkOk0LLoDg2dgEdaX2+JASBn14gthkz9JJvjeq
         /e8LlbDE1Czum9F+Yjho76XQANK+Ly3h8sjUk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685151750; x=1687743750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hhZKQ5chvzZjdXAK7yuxvuaTNwo4ZylkC6Gy3ujvEec=;
        b=Ppyo0ZvhAxSvohX840/3JV+ExkfNTsKyFwN7r3dZl8y9cOOAjzjRGtogHnjHDzHPRM
         NVlWt4mzY+eO+5ycb898ZdFujiNlKG0nmEtSLEHrw40Cxkp4BORjRup+diNQEN/6vCtY
         yc047QoAUw0S9en58RFqlZbT6//HSg+goLltpZ3B9IG3LSfPV1k0EztQT81RKAuobt38
         DfkIUp7TqVDX4jileBXzKrXncmDxe5xi1xs1SylPHwn17nbWzRVQWQTQj6eUb28bINxO
         4RiPHcKEoUVdy/GJqIm94KZHq7Ikf3imR8zoce4dloFUNqgkP8Lo82tfRbuZLgmVYrnp
         Pqkg==
X-Gm-Message-State: AC+VfDycGXBfIVDsUfqqW8BSoIj+vTb0n2nVxj9+Z+XJLoc10KBCTvBJ
	FmtqRsygkv+Q5B1+yGYW2wh1NNylLaxg5hnpM2s=
X-Google-Smtp-Source: ACHHUZ76rNf6n7Cx97qFMKMnLQrSEH7QLJeo9anNJyrNS+vARlA10YQ6Hwp4TAKjsYTO1yI+mRUWlQ==
X-Received: by 2002:a05:6a00:3911:b0:63d:2f13:200 with SMTP id fh17-20020a056a00391100b0063d2f130200mr6100546pfb.16.1685151750426;
        Fri, 26 May 2023 18:42:30 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:4015:7255:c79a:26d7])
        by smtp.gmail.com with ESMTPSA id x25-20020aa79199000000b0063b8ddf77f7sm3202440pfa.211.2023.05.26.18.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 18:42:29 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Petr Mladek <pmladek@suse.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 08/10] watchdog/buddy: Simplify the dependency for HARDLOCKUP_DETECTOR_PREFER_BUDDY
Date: Fri, 26 May 2023 18:41:38 -0700
Message-ID: <20230526184139.8.I49d5b483336b65b8acb1e5066548a05260caf809@changeid>
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

The dependency for HARDLOCKUP_DETECTOR_PREFER_BUDDY was more
complicated than it needed to be. If the "perf" detector is available
and we have SMP then we have a choice, so enable the config based on
just those two config items.

Suggested-by: Petr Mladek <pmladek@suse.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 lib/Kconfig.debug | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index c9df93402237..eb1edd5905bc 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -1065,7 +1065,7 @@ config HAVE_HARDLOCKUP_DETECTOR_NON_ARCH
 
 config HARDLOCKUP_DETECTOR_PREFER_BUDDY
 	bool "Prefer the buddy CPU hardlockup detector"
-	depends on HAVE_HARDLOCKUP_DETECTOR_NON_ARCH && HAVE_HARDLOCKUP_DETECTOR_PERF && SMP
+	depends on HAVE_HARDLOCKUP_DETECTOR_PERF && SMP
 	help
 	  Say Y here to prefer the buddy hardlockup detector over the perf one.
 
-- 
2.41.0.rc0.172.g3f132b7071-goog

