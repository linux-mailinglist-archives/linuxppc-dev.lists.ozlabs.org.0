Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8289452FAFB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 May 2022 13:12:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L51Cj2H7jz3bs0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 May 2022 21:12:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=qns+9z60;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=inria.fr (client-ip=192.134.164.104;
 helo=mail3-relais-sop.national.inria.fr; envelope-from=julia.lawall@inria.fr;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256
 header.s=dc header.b=qns+9z60; dkim-atps=neutral
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L51C06xmsz2ypf
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 May 2022 21:12:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inria.fr; s=dc;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ajlODn0UBCgHpmr/xDSe9adH/UaGKwJcJ/bx4WGDDLU=;
 b=qns+9z60FQq4RCGA7pZ29gmbZeEQ6FiACDHafewG8k9tJupBJ89ClEl1
 QOPMjAiwYj9OVI6vIPOZWZtYqxOrPRUwZ+Kg2pxU/ydEbqQjVG3AeKECF
 R7P/7Ghc3kEeyBdF2u3o/Qy7O7KJlokb8n4hFjyhVN6KPiZSonzZ1D4TF o=;
Authentication-Results: mail3-relais-sop.national.inria.fr;
 dkim=none (message not signed) header.i=none;
 spf=SoftFail smtp.mailfrom=Julia.Lawall@inria.fr;
 dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.91,242,1647298800"; d="scan'208";a="14727990"
Received: from i80.paris.inria.fr (HELO i80.paris.inria.fr.) ([128.93.90.48])
 by mail3-relais-sop.national.inria.fr with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2022 13:12:06 +0200
From: Julia Lawall <Julia.Lawall@inria.fr>
To: Frederic Barrat <fbarrat@linux.ibm.com>
Subject: [PATCH] cxl: fix typo in comment
Date: Sat, 21 May 2022 13:11:32 +0200
Message-Id: <20220521111145.81697-82-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 2.20.1
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
Cc: linuxppc-dev@lists.ozlabs.org, kernel-janitors@vger.kernel.org,
 Andrew Donnellan <ajd@linux.ibm.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Spelling mistake (triple letters) in comment.
Detected with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 include/misc/cxl.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/misc/cxl.h b/include/misc/cxl.h
index 0410412de16b..d8044299d654 100644
--- a/include/misc/cxl.h
+++ b/include/misc/cxl.h
@@ -30,7 +30,7 @@ unsigned int cxl_pci_to_cfg_record(struct pci_dev *dev);
 /*
  * Context lifetime overview:
  *
- * An AFU context may be inited and then started and stoppped multiple times
+ * An AFU context may be inited and then started and stopped multiple times
  * before it's released. ie.
  *    - cxl_dev_context_init()
  *      - cxl_start_context()

