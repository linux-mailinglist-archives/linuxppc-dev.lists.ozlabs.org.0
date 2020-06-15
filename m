Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C86D11F8D90
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jun 2020 08:14:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49lgyw2jB9zDqMW
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jun 2020 16:14:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=lC4X4RdI; dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49lgxD6VvkzDqJB
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jun 2020 16:13:03 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id d4so130907pgk.4
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Jun 2020 23:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=j6d3hFCGtgzkqRlllyI9GjPHOCqs9ztI9yys9G6hxks=;
 b=lC4X4RdI7IGTVAiyb8yZ4b5qeUru9j3B38M4UnT+CKBfSIIaPhmSGc1xi4VoqaKV+5
 4Qr0GSHt7dOPDN2QWe/0bi6H8KIzv3h3bMF449G+yBeIjKpGJo8gJmJSIzaqOF7hHk9+
 Ivnv4mME99YRyXPV2sT7w2SEA32slYiB7KZ/l0edCW91iR0d31XbNWDu2ksCsHfOLt97
 PnWuHeZqWwsQgK0wiVZ1tykgZedA8Qj53e0rU+KF+2ggkPo9VIuhBNG8UG/Brt1s3Iyv
 fPlh6irrwwFsaXQnq84kVg66+1BZ0CgPcrgqMtIAouCy7jbU8uVOMLsJJ7rB3NNS5s1k
 d0ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=j6d3hFCGtgzkqRlllyI9GjPHOCqs9ztI9yys9G6hxks=;
 b=LS4yWpYPaKsQmX3iAPM63XmFJNJfL9mH/9s1Fe46BzCXkzsGfgnmvSGU3e9U96+TI+
 dP+IAPXp0D4heu5Lbk4VGHqr1K4PJeGH7FDyhsrj0fI+5xKinp0RaNw3tpWJvCSzzekS
 5npX55JFFQopJgGbVLa8d/7VbgrrzBxQs6QSRwu1XFCj71MuSq1US9ADLjApk22XtaB9
 7v87xBy0kw6d86gNEpi7FhZPv/IcisjBRI3lDy+gKg6BnRJTk8lcGC4Q0gNH3ji05VCe
 WFKRp5ZtihLro9cB9lKbGStW8ttMQFQqD+u8aTt/D3GegomClHQJNhSHuKnw4bXUwr5H
 L1Ug==
X-Gm-Message-State: AOAM5327T6YqxqEoWdOfDnUC8RqqzBGrn5AXmvcXPsLQYChGx4ibtIgz
 aPSrLZKzCi7nPdIQcGtR9vKxzJWa
X-Google-Smtp-Source: ABdhPJx5ZVHiEl2b86p4m2lu7zE8988GCMlcWu4RD5NyX5RHG/glqH/j686f7e8reSQcVUYHj9aiyw==
X-Received: by 2002:a62:dd04:: with SMTP id w4mr3676821pff.45.1592201579295;
 Sun, 14 Jun 2020 23:12:59 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (193-116-108-230.tpgi.com.au.
 [193.116.108.230])
 by smtp.gmail.com with ESMTPSA id d5sm12921905pfd.124.2020.06.14.23.12.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Jun 2020 23:12:58 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/64s: Fix KVM interrupt using wrong save area
Date: Mon, 15 Jun 2020 16:12:47 +1000
Message-Id: <20200615061247.1310763-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
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
Cc: Nicholas Piggin <npiggin@gmail.com>,
 Christian Zigotzky <chzigotzky@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The CTR register reload in the KVM interrupt path used the wrong save
area for SLB (and NMI) interrupts.

Fixes: 9600f261acaaa ("powerpc/64s/exception: Move KVM test to common code")
Reported-by: Christian Zigotzky <chzigotzky@xenosoft.de>
Tested-by: Christian Zigotzky <chzigotzky@xenosoft.de>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index e70ebb5c318c..fa080694e581 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -270,7 +270,7 @@ BEGIN_FTR_SECTION
 END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
 	.endif
 
-	ld	r10,PACA_EXGEN+EX_CTR(r13)
+	ld	r10,IAREA+EX_CTR(r13)
 	mtctr	r10
 BEGIN_FTR_SECTION
 	ld	r10,IAREA+EX_PPR(r13)
@@ -298,7 +298,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 
 	.if IKVM_SKIP
 89:	mtocrf	0x80,r9
-	ld	r10,PACA_EXGEN+EX_CTR(r13)
+	ld	r10,IAREA+EX_CTR(r13)
 	mtctr	r10
 	ld	r9,IAREA+EX_R9(r13)
 	ld	r10,IAREA+EX_R10(r13)
-- 
2.23.0

