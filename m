Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 517F71F398
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2019 14:16:42 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 453tnz5pNkzDqVP
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2019 22:16:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::344; helo=mail-wm1-x344.google.com;
 envelope-from=mathieu.malaterre@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="rEZd9BQC"; 
 dkim-atps=neutral
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 453tfb5gBwzDqTC
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2019 22:10:15 +1000 (AEST)
Received: by mail-wm1-x344.google.com with SMTP id o189so2415394wmb.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2019 05:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CFKFwgLozVIM6dscXeJBqjWNwAotJvVX+KZD7JqTJhw=;
 b=rEZd9BQCMnveEHnW1EzvyB1mf4vdRdsj1KDivixg8uQO3ZRtnIPm9n7ribcAB6WmAG
 rYiqArIQw4TWQrCbePoK51atfLhI8UASv873PwpBgqGeraXUomT8Q9OVMKqgS7zhUtW+
 e6Um4yftwThM428E24xFoAy485veY5Sz6ep54y79hQmhvXUa6eqATSFqIkOP6TGCzmOj
 rUwVPTteu1AsINuyrk5rKeuqH/sqc0lcyoon80pHmoRcsaKJzA2ElDkRnpVtpDu/jfrG
 q4yz7DVm+2lRxc5346NALN5LG+Lg99spJProW6l2dzcESBAqDycAnG1Z/OD7wigZC6Vm
 QQHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=CFKFwgLozVIM6dscXeJBqjWNwAotJvVX+KZD7JqTJhw=;
 b=kTzKtJOTU/wH8Q05f8R/7RcQFjJ9p4xPo3U7xrAOQq69cEu39IaTonTHmMEvFN+KhL
 98y8JTX+8cMePYObANb8IRs/gLTgBxKwJaCga98I2PqLJ1jUWv6jlhecHj45ApzlpZRi
 /u8qe22Eu19UGrW+S5Kzgs6Cc0TzmUAQ4mhwhEfGRTWhRRks3KOeA6iaDz4TUTLwFZXB
 WRf3HNoQWzqJyF6IKUTFovtoTDFgnTBxZeNbeDEukwSfzRZI94Ioyb8NvjF2kXAOrUy+
 CKngdUH4F7WNA6fw+OXXKGglrolQnt+Rz7H4si7AwPrrJZsvs1vz2jOX6ASko1ZfyoEG
 WteA==
X-Gm-Message-State: APjAAAXAW7H3gkagxDRW3nlmmeV2/sI4+5YpDI6VmG1F3r7NUgQnm5I0
 cSpcfkIqr8Z3PFwYm573NX8=
X-Google-Smtp-Source: APXvYqyeRa0AATRlHj/RBPnO2Noo/rUCYItU5+6CIHDBuomet4LfUmlnkJB5oFmYAn07J0K50gSbdQ==
X-Received: by 2002:a1c:5f02:: with SMTP id t2mr22591116wmb.19.1557922212170; 
 Wed, 15 May 2019 05:10:12 -0700 (PDT)
Received: from macbookpro.malat.net (bru31-1-78-225-224-134.fbx.proxad.net.
 [78.225.224.134])
 by smtp.gmail.com with ESMTPSA id v1sm1847403wrd.47.2019.05.15.05.10.11
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 15 May 2019 05:10:11 -0700 (PDT)
Received: by macbookpro.malat.net (Postfix, from userid 1000)
 id 7FB421146D7B; Wed, 15 May 2019 14:10:10 +0200 (CEST)
From: Mathieu Malaterre <malat@debian.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc: Include <asm/pte-walk.h> header file to fix a warning
Date: Wed, 15 May 2019 14:10:08 +0200
Message-Id: <20190515121008.3992-1-malat@debian.org>
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
Cc: Mathieu Malaterre <malat@debian.org>, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Make sure to include <asm/pte-walk.h> to provide the following prototype:
__find_linux_pte.

Remove the following warning treated as error (W=1):

  arch/powerpc/mm/pgtable.c:316:8: error: no previous prototype for '__find_linux_pte' [-Werror=missing-prototypes]

Fixes: 0caed4de502c ("powerpc/mm: move __find_linux_pte() out of hugetlbpage.c")
Cc: Christophe Leroy <christophe.leroy@c-s.fr>
Signed-off-by: Mathieu Malaterre <malat@debian.org>
---
 arch/powerpc/mm/pgtable.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
index db4a6253df92..2aa042193ace 100644
--- a/arch/powerpc/mm/pgtable.c
+++ b/arch/powerpc/mm/pgtable.c
@@ -31,6 +31,7 @@
 #include <asm/tlbflush.h>
 #include <asm/tlb.h>
 #include <asm/hugetlb.h>
+#include <asm/pte-walk.h>
 
 static inline int is_exec_fault(void)
 {
-- 
2.20.1

