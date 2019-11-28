Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B8C10CD77
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Nov 2019 18:07:42 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47P3wq5GL2zDqPj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Nov 2019 04:07:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rasmusvillemoes.dk (client-ip=2a00:1450:4864:20::241;
 helo=mail-lj1-x241.google.com; envelope-from=linux@rasmusvillemoes.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=rasmusvillemoes.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk
 header.b="MsBrXnDd"; dkim-atps=neutral
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47P13S6d7LzDr0B
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Nov 2019 01:58:12 +1100 (AEDT)
Received: by mail-lj1-x241.google.com with SMTP id m6so21460871ljc.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Nov 2019 06:58:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z0ILJLPvMSycr+N5z1WBGPbbOOzMeVGs3+El1NFG5gM=;
 b=MsBrXnDd/G1Zjj210ATgY6vuErblELNtwtEokGCaoA1MxxkLkU5DMXWZ/DqI4rkd5Z
 gETgTkCKjtmJ/BL1I8x41SvinDsW0tjkR9cfyiTi9zOlB2m8FMv18BEU617l2rIZlRYm
 JgqrkOdeLh5F0tEM8F/+7LQYmLCxUlP6KBeO0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z0ILJLPvMSycr+N5z1WBGPbbOOzMeVGs3+El1NFG5gM=;
 b=mOJx/fSldGrpYsN/KisbfjWyUpGvGX/QNkmFD03Mi7Zifb2JFD/ghcbL/VO0vRPS4d
 QubsBnl0V6PzyRyILS7ehZyMz6PgeVX6O5aubUZiOq+pYC4ToLz+5Ls1PmyTpwjeRCSo
 oU6nS6DbbxmYB0Uc1SESb0EwsFJj7l35VctbMkHLq6jHMm5W/AlYTedH0sIWXI6uzAo5
 4mYizDLcWrTzVr+ZjGkxvx7VcEIaiRrH53MkgEVlvCCuxJdM+Hq98AnqMvjPdK0s/SZp
 mvxWZKAvfIwEBKYcqnr8VjNuJUBSsP0xGvomxHLOsVrjGN1+udIO8pKCTXYGneAZETf4
 VeFg==
X-Gm-Message-State: APjAAAWAkLJqDFIKbzo7Jn4uLpabOZbiw6GOh/NcloPhGhBg3nZ5ZGQ7
 nD3NP23Nl+P0lTuITksLcvM59w==
X-Google-Smtp-Source: APXvYqzc2fQxY6lskiW/Z09onmsQDrBOExaD6v9SX5/irAT7oq304NVrn38+PRfo+mxcFltlRIIozA==
X-Received: by 2002:a2e:9f4d:: with SMTP id v13mr35084645ljk.78.1574953086759; 
 Thu, 28 Nov 2019 06:58:06 -0800 (PST)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id u2sm2456803lfl.18.2019.11.28.06.58.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Nov 2019 06:58:06 -0800 (PST)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v6 48/49] soc: fsl: qe: remove unused #include of asm/irq.h
 from ucc.c
Date: Thu, 28 Nov 2019 15:55:53 +0100
Message-Id: <20191128145554.1297-49-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191128145554.1297-1-linux@rasmusvillemoes.dk>
References: <20191128145554.1297-1-linux@rasmusvillemoes.dk>
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
Cc: kbuild test robot <lkp@intel.com>, Timur Tabi <timur@kernel.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org,
 Scott Wood <oss@buserror.net>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When allowing this driver to be built for ARM, the build fails (for
CONFIG_SMP=y) since ARM's asm/irq.h header is not self-contained:

  In file included from drivers/soc/fsl/qe/ucc.c:18:0:
>> arch/arm/include/asm/irq.h:34:50: error: unknown type name 'cpumask_t'
    extern void arch_trigger_cpumask_backtrace(const cpumask_t *mask,

But nothing in this file actually uses anything from asm/irq.h -
removing this #include generates identical object code, both on PPC32
and on ARM (the latter with a patch added to asm/irq.h to make the
build work in the first place).

Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 drivers/soc/fsl/qe/ucc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/soc/fsl/qe/ucc.c b/drivers/soc/fsl/qe/ucc.c
index da3d7e2dd837..90157acc5ba6 100644
--- a/drivers/soc/fsl/qe/ucc.c
+++ b/drivers/soc/fsl/qe/ucc.c
@@ -15,7 +15,6 @@
 #include <linux/spinlock.h>
 #include <linux/export.h>
 
-#include <asm/irq.h>
 #include <asm/io.h>
 #include <soc/fsl/qe/immap_qe.h>
 #include <soc/fsl/qe/qe.h>
-- 
2.23.0

