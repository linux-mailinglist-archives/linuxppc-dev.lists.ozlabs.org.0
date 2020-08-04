Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FC223B20B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Aug 2020 03:00:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BLGdq6zmczDqLP
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Aug 2020 11:00:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Vujj0ICT; dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BLGVb65MszDqCx
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Aug 2020 10:54:31 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id z20so1187059plo.6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Aug 2020 17:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4XXXvZOGpACzchKlDIFqT76SOIxhqRVs89anrWz1bYU=;
 b=Vujj0ICTaIVs2I1H0ltAVF0XsP0+seDctwE4yX5M3ac2ctEaOK+KkEd2u/HElBSjQR
 Uv+WGbGHmX7TBbuO4JZkhA1bauXInkd1XyWccbDRDXfJu+zpW/9EdvuVCjg1Wwhr6Uak
 goIinUFvpoeeek3SNVWu1gTfOE31R49LwxAIB4pz25NeSnZ8Ejx8aew1ytvDmIn+3TQ9
 fNME2+zwcAT8xTBHMbucDcZudMXfluFF1PHWbxBFzPvYDHy6FQXgg8Rc7TFR9LVenTph
 osgSJEuNg15SKKTXqU40HmRhcMVJT8ela4XOzJRy3J8b/i0x8RaKR5+qncE471EwyeLZ
 oN4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4XXXvZOGpACzchKlDIFqT76SOIxhqRVs89anrWz1bYU=;
 b=kTOepC7TVDQ67yAuxFr8dOX/WhxUKvTDrQylXrXZw2ga1BxeRsTmAuSGrZ7vSjcfBy
 9Qv83NDIPb9ZZaXS315kcc98nSAE5iEUqtaemWxBei9pRZO+nsZWAHKyN0ymntX1CrBN
 FAnVt2t4nbgLtcyLRKuRuyUAL9R8PV1uEaP6i2boxR2MnTR1/kFdfua0iKjXqUZHW0PN
 IltzNbnLwki+RYVGiSeH/RR2O+3ZDtrWTf+f2t8eURZoBlqBCnQPEaMV84EiNW8STx5c
 ifAGTMPIqj3bvHrJ+p1dnOEShecq11rXED7AL5njEx1/IqrqXR7+tG1OKpvNjEh6CsKp
 Odzg==
X-Gm-Message-State: AOAM531jOdExcn4WNutVlWDIu3p8WX4xlSv6nl2DoMYF1RVY5jWg1dBt
 qdYgVQKgiNsWSPUXyMXlSAQsa7DQ
X-Google-Smtp-Source: ABdhPJyo4qo5VfsM57tztfdheWpfQPf/3CGJATZ7jGmPNajNmxjNBYvlS6VahML0o0Z3NjAfLOun8Q==
X-Received: by 2002:a17:90a:9516:: with SMTP id
 t22mr1701793pjo.134.1596502469279; 
 Mon, 03 Aug 2020 17:54:29 -0700 (PDT)
Received: from localhost.ibm.com ([120.17.110.210])
 by smtp.gmail.com with ESMTPSA id 80sm10381327pfy.147.2020.08.03.17.54.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2020 17:54:28 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/6] powerpc/powernv: Include asm/powernv.h from the local
 powernv.h
Date: Tue,  4 Aug 2020 10:54:06 +1000
Message-Id: <20200804005410.146094-3-oohall@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200804005410.146094-1-oohall@gmail.com>
References: <20200804005410.146094-1-oohall@gmail.com>
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
Cc: Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The asm/powernv.h header provides prototypes for functions which need to be
called by non-powernv platform code. Also include it in the powernv.h
that's local to the platform directory to squash some warnings about
non-static functions missing prototypes.

Also include powernv.h since from opal-memcons.c since it has the
prototypes for the memcons wrangling functions which are used for the opal
and ultravisor msglog.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/platforms/powernv/opal-msglog.c | 2 ++
 arch/powerpc/platforms/powernv/powernv.h     | 7 +++++++
 2 files changed, 9 insertions(+)

diff --git a/arch/powerpc/platforms/powernv/opal-msglog.c b/arch/powerpc/platforms/powernv/opal-msglog.c
index d26da19a611f..d3b6e135c18b 100644
--- a/arch/powerpc/platforms/powernv/opal-msglog.c
+++ b/arch/powerpc/platforms/powernv/opal-msglog.c
@@ -12,6 +12,8 @@
 #include <linux/types.h>
 #include <asm/barrier.h>
 
+#include "powernv.h"
+
 /* OPAL in-memory console. Defined in OPAL source at core/console.c */
 struct memcons {
 	__be64 magic;
diff --git a/arch/powerpc/platforms/powernv/powernv.h b/arch/powerpc/platforms/powernv/powernv.h
index 1aa51c4fa904..11df4e16a1cc 100644
--- a/arch/powerpc/platforms/powernv/powernv.h
+++ b/arch/powerpc/platforms/powernv/powernv.h
@@ -2,6 +2,13 @@
 #ifndef _POWERNV_H
 #define _POWERNV_H
 
+/*
+ * There's various hacks scattered throughout the generic powerpc arch code
+ * that needs to call into powernv platform stuff. The prototypes for those
+ * functions are in asm/powernv.h
+ */
+#include <asm/powernv.h>
+
 #ifdef CONFIG_SMP
 extern void pnv_smp_init(void);
 #else
-- 
2.26.2

