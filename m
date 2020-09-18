Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A6826F9C1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Sep 2020 12:01:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bt8VT40DwzDqVH
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Sep 2020 20:01:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::642;
 helo=mail-ej1-x642.google.com; envelope-from=fazilyildiran@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=TKx+r8PC; dkim-atps=neutral
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bt8Gk3CCQzDqWL
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Sep 2020 19:50:54 +1000 (AEST)
Received: by mail-ej1-x642.google.com with SMTP id gr14so7326433ejb.1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Sep 2020 02:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yzURNuHz4G++YxGUWeyjPl4/b+EZGSxoT1bXkO8QmdY=;
 b=TKx+r8PC4YXw/oizLbp+Y7zgi+vq8xswtGQgK3O3+aINvD9kT9ALVSdziB8OOwpuiI
 BovMwvF4TwC1MnUPbVmhTtFKhYheC2H9OKWdUxgw9xxhQaXLkr0Pms0bkkWHJsm8SC6x
 mv+Ni7xukxXFNC6IqKLvufGQSmrVu0IoU/2w5D+mmxUd8rsykxZHbEjX9BGXZRcgt4Kr
 WjH8nJz4eApBDjXqJv/WULUsZCyLLOA30VQqCDSGw5m43YCrlOUlPNIgjNu2dpaZINKW
 thO//78/Ge6YAJCQgYoB4kpG2d1xvNyeqP4QnzsY/31PK+aXW2rFpU3LyMlNITCNdLjd
 eFmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yzURNuHz4G++YxGUWeyjPl4/b+EZGSxoT1bXkO8QmdY=;
 b=nkxb40LlVg74hRDM5Xu/CQDtMNpEJDZHsIKmCUW7Cq6n0PezIVbjDYTzfN/onqxOuu
 LQpBYamWDKG5UFVLGGEnSCLAz4ygwesIstGDJp2MIxsaLYUyf7taM591nqI1msApVhpV
 v1tpqqeKFtDzP3mQ0gFIljcrSJqaIIBMxkCrXyyFLEHT+NkaXpq4Kwx8SzN1EvXjbLcA
 IYuyjxbj0ah/zHAPov0aL3rvegxzhigVMFWl+msUoRBZco/kAYtbN14mA9fjRWkzg8Zt
 A5LIQZCQfBl7/njZjlsAUP0zwfoZuWDHf2hIui9GybPUbAIReNou9wUlZI8i/h8v3DiD
 DK+w==
X-Gm-Message-State: AOAM532+JRUkQGf2l1okStaFzbeQkVe8jZ5gmzz776v5BMXgrMaf1hDV
 nMe67ZT4yDgzCpl2FAPA2RjejT0Fwd23rw==
X-Google-Smtp-Source: ABdhPJx4bwzAn/1/haSTf8TEN3XO5VpGqorkQTRB11qwLjsHvplO6NuOQmWO/V6uY9yy5Z+Uike4yw==
X-Received: by 2002:a17:906:ce30:: with SMTP id
 sd16mr34503383ejb.53.1600422180692; 
 Fri, 18 Sep 2020 02:43:00 -0700 (PDT)
Received: from localhost.localdomain ([85.153.229.188])
 by smtp.gmail.com with ESMTPSA id dm22sm1798471edb.49.2020.09.18.02.42.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2020 02:42:59 -0700 (PDT)
From: Necip Fazil Yildiran <fazilyildiran@gmail.com>
To: fbarrat@linux.ibm.com
Subject: [PATCH] ocxl: fix kconfig dependency warning for OCXL
Date: Fri, 18 Sep 2020 12:41:49 +0300
Message-Id: <20200918094148.20525-1-fazilyildiran@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 18 Sep 2020 19:59:20 +1000
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
Cc: gregkh@linuxfoundation.org, Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 linux-kernel@vger.kernel.org, jeho@cs.utexas.edu, paul@pgazz.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When OCXL is enabled and HOTPLUG_PCI is disabled, it results in the
following Kbuild warning:

WARNING: unmet direct dependencies detected for HOTPLUG_PCI_POWERNV
  Depends on [n]: PCI [=y] && HOTPLUG_PCI [=n] && PPC_POWERNV [=y] && EEH [=y]
  Selected by [y]:
  - OCXL [=y] && PPC_POWERNV [=y] && PCI [=y] && EEH [=y]

The reason is that OCXL selects HOTPLUG_PCI_POWERNV without depending on
or selecting HOTPLUG_PCI while HOTPLUG_PCI_POWERNV is subordinate to
HOTPLUG_PCI.

HOTPLUG_PCI_POWERNV is a visible symbol with a set of dependencies.
Selecting it will lead to overlooking its other dependencies as well.

Let OCXL depend on HOTPLUG_PCI_POWERNV instead to avoid Kbuild issues.

Fixes: 49ce94b8677c ("ocxl: Add PCI hotplug dependency to Kconfig")
Signed-off-by: Necip Fazil Yildiran <fazilyildiran@gmail.com>
---
 drivers/misc/ocxl/Kconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/misc/ocxl/Kconfig b/drivers/misc/ocxl/Kconfig
index 6551007a066c..947294f6d7f4 100644
--- a/drivers/misc/ocxl/Kconfig
+++ b/drivers/misc/ocxl/Kconfig
@@ -9,9 +9,8 @@ config OCXL_BASE
 
 config OCXL
 	tristate "OpenCAPI coherent accelerator support"
-	depends on PPC_POWERNV && PCI && EEH
+	depends on PPC_POWERNV && PCI && EEH && HOTPLUG_PCI_POWERNV
 	select OCXL_BASE
-	select HOTPLUG_PCI_POWERNV
 	default m
 	help
 	  Select this option to enable the ocxl driver for Open
-- 
2.25.1

