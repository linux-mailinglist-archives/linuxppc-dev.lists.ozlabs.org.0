Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 602AB44B9B3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Nov 2021 01:40:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HpmGw2F90z3cmg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Nov 2021 11:40:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=W8KpR1kT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034;
 helo=mail-pj1-x1034.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=W8KpR1kT; dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HpmCK4H1jz2yb5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Nov 2021 11:37:33 +1100 (AEDT)
Received: by mail-pj1-x1034.google.com with SMTP id
 gf14-20020a17090ac7ce00b001a7a2a0b5c3so107635pjb.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Nov 2021 16:37:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ffiIi7pnxS+eWhKlfZ45oaRwJIGH3NoD9FTVCvyTzjM=;
 b=W8KpR1kTzufuQk5FPNtU/1E7DR8oTWeiL8aXKWW8M7nzRpD+XVcvT2YRPXSnRM0LYf
 KIooYf/LbS9hVh7lZpXinxuKjOmEEUr58Rqg8NNW1wfp6p/u/3ReNSdzflVl8pu4vXcc
 O+P0cRjW13fkw7TXsq2sDlwfvEvI36D1ANiWzO/w+eeseJZCXtxr1oPkxwFpDiT3iy8y
 U8UlFgU1Ag/LRJkbGd7YCzwZmghBZRX1zfc0hcpmo3tsgV15sifQm/W+NXRjjd4DDR3z
 q96TAcTszSm1Lv7R8xMo8p5vmmVe4rSyVS+hg/XKlTgnJJmVsJCa41UDmvLl9v7B/OZM
 ThqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ffiIi7pnxS+eWhKlfZ45oaRwJIGH3NoD9FTVCvyTzjM=;
 b=vSjJocvo5PWDaijWmi+z9HM9uL51Kw2hvyjUzhYS6CZurwaM/tbnx8EH31wA0hzpsR
 Bas8d5fkQq+6soDMCBg76+Q+B4RqXAsbOWkFIdluU38DzGhIoFWYoLiGSXGIuV1OHkHb
 yHPJq0XnVkkA2yE+0w/KIP2KupAQFg09TGfgED9X597lq5kMVBVVFJErzYwgyYnsxoeB
 OkUNXSrQ/pJ4ifth42fsQC0YN/SQObHgaBlwI++oCzLS2o6On7pqawewk5a8bHyM7TA6
 evhCJyutN4shSMXuKWl3ljpFaoz08Hflaw5/scgYA8GluERtXtxGuDOPx/g+vfYNlGnR
 Yyiw==
X-Gm-Message-State: AOAM532LiMgp17wc0HeNE7XsbKEGDA8QMYT8eAq1q0ccffeNvZ6df4Ev
 3rK/EBwGUVndBdh3mRzKpt/VBm6LxfWc0w==
X-Google-Smtp-Source: ABdhPJzzxgBliXI7ZblPlqkWBXYEEvtNggNiKbMBcxfVo9XniIqc5ZKilIYQNuAFd2xVX9cUMofc1Q==
X-Received: by 2002:a17:902:b189:b0:143:8079:3d3b with SMTP id
 s9-20020a170902b18900b0014380793d3bmr1007956plr.71.1636504651684; 
 Tue, 09 Nov 2021 16:37:31 -0800 (PST)
Received: from tee480.ozlabs.ibm.com
 (159-196-117-139.9fc475.syd.nbn.aussiebb.net. [159.196.117.139])
 by smtp.gmail.com with ESMTPSA id t21sm15854074pgo.12.2021.11.09.16.37.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 16:37:31 -0800 (PST)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v7 4/5] powerpc: Use WARN_ON and fix check in poking_init
Date: Wed, 10 Nov 2021 11:37:16 +1100
Message-Id: <20211110003717.1150965-5-jniethe5@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211110003717.1150965-1-jniethe5@gmail.com>
References: <20211110003717.1150965-1-jniethe5@gmail.com>
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
Cc: Jordan Niethe <jniethe5@gmail.com>, cmr@bluescreens.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Christopher M. Riedl" <cmr@bluescreens.de>

The latest kernel docs list BUG_ON() as 'deprecated' and that they
should be replaced with WARN_ON() (or pr_warn()) when possible. The
BUG_ON() in poking_init() warrants a WARN_ON() rather than a pr_warn()
since the error condition is deemed "unreachable".

Also take this opportunity to fix the failure check in the WARN_ON():
cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, ...) returns a positive integer
on success and a negative integer on failure.

Signed-off-by: Christopher M. Riedl <cmr@bluescreens.de>
Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v7: no change
---
 arch/powerpc/lib/code-patching.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index d586bf9c7581..aa466e4930ec 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -99,16 +99,11 @@ static int text_area_cpu_down(unsigned int cpu)
 	return 0;
 }
 
-/*
- * Although BUG_ON() is rude, in this case it should only happen if ENOMEM, and
- * we judge it as being preferable to a kernel that will crash later when
- * someone tries to use patch_instruction().
- */
 void __init poking_init(void)
 {
-	BUG_ON(!cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
+	WARN_ON(cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
 		"powerpc/text_poke:online", text_area_cpu_up,
-		text_area_cpu_down));
+		text_area_cpu_down) < 0);
 }
 
 /*
-- 
2.25.1

