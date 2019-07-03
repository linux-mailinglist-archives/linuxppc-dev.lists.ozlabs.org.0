Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 88FF85E914
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2019 18:31:43 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45f67c4sJRzDqNj
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2019 02:31:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::443; helo=mail-pf1-x443.google.com;
 envelope-from=huangfq.daxian@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ok+LeUJj"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45f6240cMmzDqNn
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jul 2019 02:26:51 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id y15so1531599pfn.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Jul 2019 09:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=DwXdZfH7NtLLJZOhwaToNs2kvQsm5dpc9ZEnlVZ81ao=;
 b=Ok+LeUJj2lPf1HsKeEyTtdlTldW4e0txkESxkbuSYB163yEsIDqSTAjhXayR0fD+EV
 GSWfdpWdLoK82PwY4L0mzZNY0PpCDMA6eCUBmfBIRniDac+LWG9SfOVk9rhotc+aR6Oq
 yRUdGgy1VGRdyCublNV2ShM4jgfv+xI9tCNGkeOfjCmphfwltFq9oPGH11mzRRPWwCrI
 p2A9YXmD7TrU74ECiF1mzVYEz7RyBs19P29Kd2pETHGHtz34vZld+rQ04Ma9zCzJ0Y9t
 gzqKDUMbSLW/CNGgSEs5Ph40dW67pmcEWHIr1OUo14D2JXc5FRwsSz66uiGxqtMu7cky
 BMSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=DwXdZfH7NtLLJZOhwaToNs2kvQsm5dpc9ZEnlVZ81ao=;
 b=ZQsw0/9u1mKZT31/7L+09KAj0npL73KWrZhrXhF3ezrYUb8yYzkAsBs4d3AO28PVmV
 kCIC+M36r7xGISfJWPvXfYOOfN6n0rtL+WrTcxkXrH5Ter3aN1+NGfG7N9xorgfl0L3F
 TPM/6Ns4+wsUeaIWiXn3hrYEpX5dfzKHfFxk8dzC4sXU7k9p6mBqBSopJ0qF5ItHuac9
 DOIEk486tx9hksM53LUSt5aBOzKio8p35RUFwhyFJ2io1T8O7NePWXRRgFcWYZ2XDPwd
 sVfaaVUxg/J6iI3P3ZWUCVIaIDUL8RTf5ivF+8V8s+58k8ItYj/k8+JDY33h7VByB/QC
 p6WA==
X-Gm-Message-State: APjAAAVQfv0uSe93piU5OdKVYJW7GgakLqFrHk4fmHhCSBAPWMEh6jQ4
 13gzrjnbgYGsY6WmTDvSwdg=
X-Google-Smtp-Source: APXvYqwODgYtzkQrbBeDgDwBdaBOya0MZqxSr7qbHRHEnITOO4v8vuOS3u+VX9rs+L9DNlIsMYiSqQ==
X-Received: by 2002:a63:e251:: with SMTP id y17mr6999992pgj.8.1562171209687;
 Wed, 03 Jul 2019 09:26:49 -0700 (PDT)
Received: from hfq-skylake.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
 by smtp.googlemail.com with ESMTPSA id 191sm3148943pfu.177.2019.07.03.09.26.47
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 03 Jul 2019 09:26:49 -0700 (PDT)
From: Fuqian Huang <huangfq.daxian@gmail.com>
To: 
Subject: [PATCH v2 03/35] powerpc: Use kmemdup rather than duplicating its
 implementation
Date: Thu,  4 Jul 2019 00:26:43 +0800
Message-Id: <20190703162643.31999-1-huangfq.daxian@gmail.com>
X-Mailer: git-send-email 2.11.0
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
Cc: linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Fuqian Huang <huangfq.daxian@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

kmemdup is introduced to duplicate a region of memory in a neat way.
Rather than kmalloc/kzalloc + memcpy, which the programmer needs to
write the size twice (sometimes lead to mistakes), kmemdup improves
readability, leads to smaller code and also reduce the chances of mistakes.
Suggestion to use kmemdup rather than using kmalloc/kzalloc + memcpy.

Signed-off-by: Fuqian Huang <huangfq.daxian@gmail.com>
---
Changes in v2:
  - Fix a typo in commit message (memset -> memcpy)

 arch/powerpc/platforms/pseries/dlpar.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/dlpar.c b/arch/powerpc/platforms/pseries/dlpar.c
index 7488e40f5e47..20fe7b79e09e 100644
--- a/arch/powerpc/platforms/pseries/dlpar.c
+++ b/arch/powerpc/platforms/pseries/dlpar.c
@@ -383,11 +383,10 @@ void queue_hotplug_event(struct pseries_hp_errorlog *hp_errlog)
 	struct pseries_hp_work *work;
 	struct pseries_hp_errorlog *hp_errlog_copy;
 
-	hp_errlog_copy = kmalloc(sizeof(struct pseries_hp_errorlog),
+	hp_errlog_copy = kmemdup(hp_errlog, sizeof(struct pseries_hp_errorlog),
 				 GFP_KERNEL);
 	if (!hp_errlog_copy)
 	      return;
-	memcpy(hp_errlog_copy, hp_errlog, sizeof(struct pseries_hp_errorlog));
 
 	work = kmalloc(sizeof(struct pseries_hp_work), GFP_KERNEL);
 	if (work) {
-- 
2.11.0

