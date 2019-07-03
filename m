Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C8F5E529
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2019 15:17:26 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45f1qR1X5tzDqGJ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2019 23:17:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::541; helo=mail-pg1-x541.google.com;
 envelope-from=huangfq.daxian@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="dr0lsFRi"; 
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45f1l73MW4zDqFL
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jul 2019 23:13:38 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id q4so1231903pgj.8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Jul 2019 06:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=/SnzKzwbJwdsQHXwXFz/daj/8JZPIhirrV+rjMpDDQs=;
 b=dr0lsFRiXjQ5piksHRyi/X873mKA7ZcleDGYjHaXJ5f6LYS/VE0e/SYvGVFJWfoKkj
 0cIiNUXi+RTrlmuHHb0sHzMy7BgSWHdi7jb4wBHHl8UZ1HqJK/ft+gWm2y3SQNXfk+XU
 QbUh0VxZr8zCCGesslE6GDDmJaE54z/Phatgo8UNnCbnhSTSgINB4WBtiG4VNVbws4wp
 9efLTJd/Fg82mtSy6ys1sDKZ3wzwr9O7A9JUj+nYaABvtOXSQpRzlMxlNwi3iaaP7qbG
 xgLdBcsi5QTE4TgK7Ikoudh1E04otuVlSb2U/SgRB07q5j6vqwTgTMLD5BvhHZQWDB3R
 W7lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=/SnzKzwbJwdsQHXwXFz/daj/8JZPIhirrV+rjMpDDQs=;
 b=RgI6ohK1fKLmkbb7f/CUEJ6aSS88R/l1LouHzADsAzBoLu8SQnUB+lj1ivmn8OVcQ4
 CoL0oOsgqba07K6nKPSEZVfHwG04y9mBZf0UFzDXvuriOIi5T8xx9viVJ+r5olwWVzh2
 dHEgytMClzaJC9B5Os1JTdz/nvVwZN25V+4ApXb8ojsnbL8AdYvZL+kTF3aeJ7P/vc3l
 RrZPoiUsX0Db/q9sAWSD4I89tt/eu6iOyeng8tGQMChrST4F+q37o4DKShe1LasN67r5
 ieaykRRULTt1LULZEwk3yMRIQ32OBF/jrXaf5ZnKzw6V+OTqraTKx2NdFkT++jk4huOk
 lYyQ==
X-Gm-Message-State: APjAAAWhnpXSEebLSqOICJYOWkV2FmhOzA2LqPdxwtmga6YVhhK6au9r
 Pdg9+CA8W95xUyPr4alTf/A=
X-Google-Smtp-Source: APXvYqzOfbchVfF3/6U0IzeocYcLu5dgpAA7P9Hm0M9qWQAd0ah06QF4dndiPFX5GsPWDHOl3mweYg==
X-Received: by 2002:a17:90a:b115:: with SMTP id
 z21mr12775207pjq.64.1562159615496; 
 Wed, 03 Jul 2019 06:13:35 -0700 (PDT)
Received: from hfq-skylake.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
 by smtp.googlemail.com with ESMTPSA id n89sm10811597pjc.0.2019.07.03.06.13.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 03 Jul 2019 06:13:35 -0700 (PDT)
From: Fuqian Huang <huangfq.daxian@gmail.com>
To: 
Subject: [PATCH 02/30] powerpc: Use kmemdup rather than duplicating its
 implementation
Date: Wed,  3 Jul 2019 21:13:27 +0800
Message-Id: <20190703131327.24762-1-huangfq.daxian@gmail.com>
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
Rather than kmalloc/kzalloc + memset, which the programmer needs to
write the size twice (sometimes lead to mistakes), kmemdup improves
readability, leads to smaller code and also reduce the chances of mistakes.
Suggestion to use kmemdup rather than using kmalloc/kzalloc + memset.

Add an allocation failure check.

Signed-off-by: Fuqian Huang <huangfq.daxian@gmail.com>
---
 arch/powerpc/platforms/pseries/dlpar.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/dlpar.c b/arch/powerpc/platforms/pseries/dlpar.c
index 437a74173db2..20fe7b79e09e 100644
--- a/arch/powerpc/platforms/pseries/dlpar.c
+++ b/arch/powerpc/platforms/pseries/dlpar.c
@@ -383,9 +383,10 @@ void queue_hotplug_event(struct pseries_hp_errorlog *hp_errlog)
 	struct pseries_hp_work *work;
 	struct pseries_hp_errorlog *hp_errlog_copy;
 
-	hp_errlog_copy = kmalloc(sizeof(struct pseries_hp_errorlog),
+	hp_errlog_copy = kmemdup(hp_errlog, sizeof(struct pseries_hp_errorlog),
 				 GFP_KERNEL);
-	memcpy(hp_errlog_copy, hp_errlog, sizeof(struct pseries_hp_errorlog));
+	if (!hp_errlog_copy)
+		return;
 
 	work = kmalloc(sizeof(struct pseries_hp_work), GFP_KERNEL);
 	if (work) {
-- 
2.11.0

