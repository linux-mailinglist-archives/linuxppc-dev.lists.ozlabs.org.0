Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E5025A431
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 05:59:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bh9Df0hYszDqfS
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 13:59:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1044;
 helo=mail-pj1-x1044.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=oT/juwHS; dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bh93r6n2czDqfD
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Sep 2020 13:51:52 +1000 (AEST)
Received: by mail-pj1-x1044.google.com with SMTP id q1so1694201pjd.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Sep 2020 20:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PlVEy4g/6lQIrdD1XcYlH8N/MJxXENO2H7A8geJceOY=;
 b=oT/juwHShzZsVFlPiiXJrnMsIXqSlOGVQHAbMOAX9eDVEaeVSTsmp8pkknOWPvcjM/
 RfF/egsNx7OtlleJ82GGOLx6TwoU3URs5uu6r5ksZM75tlWO4a7VY6xi6iQXcJbsw2OC
 QspfI/jqZISWreav63YjlceuVVAdHs4Bn6MmDZd1HKW6RAmNUzBMVKRxaVd1Y4ohfwK3
 C+kfojcfE+I3k1k3fWRO58wF0uv6LX7/HYvGd+92u+WYUuHto/va7JGOhVylrhWTdtBq
 h+D5nEdAxV/9T4cnjCnubay5t/bdhWDBvvvYNKNy+LZJK2v9SaT7wXWY6TdbIDnIP181
 M0cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PlVEy4g/6lQIrdD1XcYlH8N/MJxXENO2H7A8geJceOY=;
 b=oUSFXbgd80LsZeg68RypqEG7AZ32kEtyqrjLkV9n8H0sMFhXvyXZLIcUcUZfPqHUTy
 DuKVPx0qGJwxAZwtNXPL/M8uls8jGNJ1DuvrJjcdqqfj9TFIUDNMUejis+KRvB+1kpzC
 lfv5oPzORKRkNWZJ1hILEhf1F6P6aH/eK6qXHgzEZvfHFD7GRhTo4rZSnaYCnkJddJmH
 fn+qIRAwWBei3eIYFx63M3JxPAnry0PEcwWWVPvqu13YjEq6FWJH4eY+3hiXlHtdr8y/
 fmTX4a8VXcHtwp9sTZC2vIpBAPL97aPwik1rEz21IlbGEE3yloPE0J24HxbpGxGIeyQK
 5Eiw==
X-Gm-Message-State: AOAM533LtGk+xEI6n5rVCccCJE2jNhRnkvJ0Q5Y8ptqtQsahbyPeXWG6
 KFNe4fXl0gxLy8ABEP87j5UIxS7ZLMS/kQ==
X-Google-Smtp-Source: ABdhPJx1tpE1N1HZsUTdsfGpZQPUe76mDmcDeB20mpjsqGAORXQ1+VS7BZfFQlP05YigErds4lv6eQ==
X-Received: by 2002:a17:902:8f82:: with SMTP id
 z2mr370803plo.177.1599018709285; 
 Tue, 01 Sep 2020 20:51:49 -0700 (PDT)
Received: from localhost.ibm.com (194-193-34-182.tpgi.com.au. [194.193.34.182])
 by smtp.gmail.com with ESMTPSA id u15sm1190670pjx.50.2020.09.01.20.51.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2020 20:51:48 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/pci: Remove unimplemented prototypes
Date: Wed,  2 Sep 2020 13:51:38 +1000
Message-Id: <20200902035138.1762531-1-oohall@gmail.com>
X-Mailer: git-send-email 2.26.2
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

The corresponding definitions were deleted in commit 3d5134ee8341
("[POWERPC] Rewrite IO allocation & mapping on powerpc64") which
was merged a mere 13 years ago.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/include/asm/ppc-pci.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/powerpc/include/asm/ppc-pci.h b/arch/powerpc/include/asm/ppc-pci.h
index 7f4be5a05eb3..0745422a8e57 100644
--- a/arch/powerpc/include/asm/ppc-pci.h
+++ b/arch/powerpc/include/asm/ppc-pci.h
@@ -13,10 +13,6 @@
 
 extern unsigned long isa_io_base;
 
-extern void pci_setup_phb_io(struct pci_controller *hose, int primary);
-extern void pci_setup_phb_io_dynamic(struct pci_controller *hose, int primary);
-
-
 extern struct list_head hose_list;
 
 extern struct pci_dev *isa_bridge_pcidev;	/* may be NULL if no ISA bus */
-- 
2.26.2

