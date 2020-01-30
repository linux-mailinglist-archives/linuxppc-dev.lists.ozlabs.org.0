Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC26514D673
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jan 2020 07:35:05 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 487Vvp5lQrzDqHg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jan 2020 17:35:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=gmZ7/Lis; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 487VrS09g4zDqTb
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jan 2020 17:32:07 +1100 (AEDT)
Received: by mail-pg1-x544.google.com with SMTP id x7so1099742pgl.11
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2020 22:32:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gEXjs1FrbcD5gLzXL1fIQJyJfAqzc45tktPCpDAfkAQ=;
 b=gmZ7/LisnwFDcu0oRGF1FDc/9qQuHo+zAE3604IbtSo4emoJjjNa2lR0hVMl4JHvhC
 YKftg5U+Z4wHmx+K33+Y5PxNu7iSmbIRG4BBAtFAF87OxABOoCb14mydQxMi5LCNaN1Q
 oJYwADLHbyrgvn6jrlNJBIm4oTFL97zxsU0xpaUyz4sExExeTrmKTpBlwed4qNFhp7R2
 C7yKOWCllBeJ3PEbjCLKLveUGB3/Vn2KtbAz7JLrgcqxO7WAqoO9V92OPNBqvCXTrC0R
 Jvc8VT85P0kDuvjHzCDZP2d+gf3Q5bEzCtSuA44RKM2SiJ/vUFDo1p7ZztZ13Ahbo8Px
 +c8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gEXjs1FrbcD5gLzXL1fIQJyJfAqzc45tktPCpDAfkAQ=;
 b=NutFb894cAuSayrA+NIxpcj9RlO7Z7t//pIgU5qrRq3zCAJ8VmTkwOR/yRa76zJWSf
 2FXkBN3IQbabpA7xrxSsBoryBTe2eZInxLVyPST/Wlt+9V1sTCeYrHTZFtxnSUhTUBTC
 SX9W4BD6CX7SikoMqMQAnMSBEvjdi8fJa0O3do4vZG0KoECWgHmLG2Q+GozX3nThnrpN
 low7QcCNbGE18x9REMriqr9EN5e/hHMOm5f1DRzMlUlO0GnuVd88vEa2S/fyq3dZ0r9f
 Eufg7hWEZEwZQefOB79meFjkAogMdHIj5/A1GTkNwqmX3trct0a7OpcotS+NC3UHxOQe
 qhdg==
X-Gm-Message-State: APjAAAUhQvSVPGptlyvzPc4gLPWxRqzvbImqGRuqPHUWJdzyfp5JVtM8
 Ni+sFh41OTrVk7k9g0UBA14Mhxeg
X-Google-Smtp-Source: APXvYqyYsQKlWJU6TeRoqWkSf4BHC+eUIoRzNDOpbui5FbpGfiHC6AY+ujJJlgSaUGcmW63Vl+f8Ng==
X-Received: by 2002:a63:2e07:: with SMTP id u7mr3061297pgu.295.1580365923936; 
 Wed, 29 Jan 2020 22:32:03 -0800 (PST)
Received: from wafer.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id 199sm784100pfu.71.2020.01.29.22.32.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2020 22:32:03 -0800 (PST)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/2] pseries/vio: Remove stray #ifdef CONFIG_PPC_PSERIES
Date: Thu, 30 Jan 2020 17:31:52 +1100
Message-Id: <20200130063153.19915-1-oohall@gmail.com>
X-Mailer: git-send-email 2.21.1
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

vio.c requires CONFIG_IBMVIO which in turn depends on PPC_PSERIES.
In other words, this ifdef is pointless. At a guess it's a carry-over
from pre-history.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/platforms/pseries/vio.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/vio.c b/arch/powerpc/platforms/pseries/vio.c
index f682b7b..37f1f25 100644
--- a/arch/powerpc/platforms/pseries/vio.c
+++ b/arch/powerpc/platforms/pseries/vio.c
@@ -1628,7 +1628,6 @@ const void *vio_get_attribute(struct vio_dev *vdev, char *which, int *length)
 }
 EXPORT_SYMBOL(vio_get_attribute);
 
-#ifdef CONFIG_PPC_PSERIES
 /* vio_find_name() - internal because only vio.c knows how we formatted the
  * kobject name
  */
@@ -1698,7 +1697,6 @@ int vio_disable_interrupts(struct vio_dev *dev)
 	return rc;
 }
 EXPORT_SYMBOL(vio_disable_interrupts);
-#endif /* CONFIG_PPC_PSERIES */
 
 static int __init vio_init(void)
 {
-- 
2.9.5

