Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 032D052ED98
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 15:55:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L4StC6TqVz3bvX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 23:55:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=dUz4r1cF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canonical.com (client-ip=185.125.188.122;
 helo=smtp-relay-internal-0.canonical.com;
 envelope-from=juerg.haefliger@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=dUz4r1cF; 
 dkim-atps=neutral
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L4Q8B2Wvyz3bkB
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 May 2022 21:52:41 +1000 (AEST)
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 300543F1B6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 May 2022 11:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1653047553;
 bh=F3uWhU19tqPSpilnTv06Sntkt3xu6QI1J2QyXbNwKXI=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=dUz4r1cF3cM71ujz2lj/GKq0UlmDbaUTQZF8swsdfTA2wKp/AGLrISyZkQlumCFGm
 J4Cpg6P89/blJey1h0WxuKh4ALETLiFbaDmND9LS2/ipBsiDlXMJ6HfzSLUNNWQNzN
 gVfPL6soXyYx3HFQ9XbST6i3fKFcAG6N7KlOpoRcMDTnMKGZ83AB5ipa4IF1GQeyF3
 7ntCoye35WpHR6/fp7t89G0t77g+kpuxFLabOwWG/QfYOd2OfTIay08UpWMgQxhk3X
 Z6KnORqyaouduIKn6wKNKTfpHkJCzz5xMLT2BBRUKsG/MiW11Ijr3UBt32milnrm65
 c5G+sk2ibTkOw==
Received: by mail-ej1-f69.google.com with SMTP id
 go17-20020a1709070d9100b006f46e53a2a9so3909553ejc.10
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 May 2022 04:52:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F3uWhU19tqPSpilnTv06Sntkt3xu6QI1J2QyXbNwKXI=;
 b=S688en+pelc55Pvb59Xsscg9Y+cOYWfe1Qfxl+RxRG4QMxez36TK8uZpSgG5A1QU7o
 rArXWnTlfYJAHCz5grzhuu5rrxPuZYq3W7NHCecluoZg40K05l/f3WUXDKrKGn6+xvxY
 lKQVAqfH2SohuqRVwjgJREbrmcA1mo/m01ujg5OpkaImPMalykx9C9ESA0mX6U0POZOG
 nEplqpZONcW2lHPwFLIPvuCkbs/NJjF6TwydMR+/Gc/5pVhIdY7NQyLaG2+a8v6rdXT3
 y2wxy2F4w379S2Ga4WR4r1txmcxnLbTzOr9oTwHX5cdrWnlqOd50LiKodvc6E5As9Nq7
 WaYA==
X-Gm-Message-State: AOAM530uP0SNN9CstjMj7EIBSfqOEa05PgKGVvfDipKEJ6H0vLz9+4Ih
 307/1GDuh6BZ5UiwCTLaKCb72kXo1fiZm+GZqHmewrc5LqsBD2yfDe0lY2e0AvwbWUk2PeCs2Ns
 HtcP4Y7VfPzKsXH3YzFYogMKq9268nVR/Ta/hbxElwXc=
X-Received: by 2002:aa7:cf83:0:b0:42a:c73e:6d86 with SMTP id
 z3-20020aa7cf83000000b0042ac73e6d86mr10481222edx.251.1653047552915; 
 Fri, 20 May 2022 04:52:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz6JwgyP43Z2fUOMqs72r04gqZu8vQTIl8anLwpcnAq693ZcuMztCwn/3EFf3TvpdllczP3eQ==
X-Received: by 2002:aa7:cf83:0:b0:42a:c73e:6d86 with SMTP id
 z3-20020aa7cf83000000b0042ac73e6d86mr10481208edx.251.1653047552783; 
 Fri, 20 May 2022 04:52:32 -0700 (PDT)
Received: from gollum.fritz.box ([194.191.244.86])
 by smtp.gmail.com with ESMTPSA id
 d24-20020a056402145800b0042aa5a74598sm4186088edx.52.2022.05.20.04.52.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 04:52:32 -0700 (PDT)
From: Juerg Haefliger <juerg.haefliger@canonical.com>
X-Google-Original-From: Juerg Haefliger <juergh@canonical.com>
To: mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org,
 linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/powernv: Kconfig: Replace single quotes
Date: Fri, 20 May 2022 13:52:29 +0200
Message-Id: <20220520115229.147368-1-juergh@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 20 May 2022 23:55:13 +1000
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
Cc: Juerg Haefliger <juergh@canonical.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Replace single quotes with double quotes which seems to be the convention
for strings.

Signed-off-by: Juerg Haefliger <juergh@canonical.com>
---
 arch/powerpc/platforms/powernv/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/powernv/Kconfig b/arch/powerpc/platforms/powernv/Kconfig
index 161dfe024085..ecc4a5806b42 100644
--- a/arch/powerpc/platforms/powernv/Kconfig
+++ b/arch/powerpc/platforms/powernv/Kconfig
@@ -20,7 +20,7 @@ config PPC_POWERNV
 	default y
 
 config OPAL_PRD
-	tristate 'OPAL PRD driver'
+	tristate "OPAL PRD driver"
 	depends on PPC_POWERNV
 	help
 	  This enables the opal-prd driver, a facility to run processor
-- 
2.32.0

