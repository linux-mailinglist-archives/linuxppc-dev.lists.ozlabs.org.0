Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 546D21F67B7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jun 2020 14:14:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49jN7v5CMfzDqTg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jun 2020 22:14:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::344;
 helo=mail-wm1-x344.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=THGNoiMe; dkim-atps=neutral
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49jN4p3NHWzDqn4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jun 2020 22:11:37 +1000 (AEST)
Received: by mail-wm1-x344.google.com with SMTP id j198so6830297wmj.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jun 2020 05:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=woIpcWoOxisq6lDWP2VU1XmEG6oFPgJO+xWenBZ0qVs=;
 b=THGNoiMe32k7RdEyl+Ju+eyTWLMxImqMdCa5kVp2Vm8ZKb0z2JNkgIslRDtCgwMMkF
 ME3iroonx9CHtz432vfl7owu37Ukrp1Kn5Y7eWQyPubV6jtGoou+AtDCSNKExH/rGbiK
 qyNipGXSuWFBC8NlMvBEW52iwy3t30brqfApODQIReHPiTgd2fs/q9HRyaxpcvsYogMR
 CaGWAsnKMl4eVXprFGd3giYaPqISUPT//eqlJ+maIApNsGLyRAct0pLwkcoXlhwkfXBu
 jrWqTuQv6ZRqX4aZys/amWQja1Rjh/aQUtsnfl+6RM8lUqVkwwsItnw+GL4NBKikGYnI
 LJ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=woIpcWoOxisq6lDWP2VU1XmEG6oFPgJO+xWenBZ0qVs=;
 b=o733CAw4L1SgeWCdfmC5EY0bi3h76ax6u6IEFyTBZkGpGuDUcYH+olrjWl9m5fPomJ
 pKaunbQNd4X4GZSTyCDz+9sKaNdEBPYAhjO1H1vcW+SOXxT1upZ7MUYQmXRRPb1e0Gga
 Y6DO2B81vl+ZiDBpp7Uj09QU4Wf0kl0Zl7h+gQDCzj6K0MUvB1NbPUU75PI77h0szeJ5
 TFVu7R+HdoZYa83HfAIALb2M0TLFvVDfcnTN66Hn7r7q5L/SkSIvXBX+4Nb0I59pfXXL
 ncgqB9DpIx0/ZhDm3iwxqea0xDnI2qZvLG7xB8GTpvTzOrq4cDlsOBeOhhp4yZGz3kTs
 uLRA==
X-Gm-Message-State: AOAM530m4k4Ma9xyYd3eQ/M8rUOKPN+lv4RikwaCwb8C7EXvR1FfreIi
 UmwPpfNisraTO+QFB/PQmNYlwJlU
X-Google-Smtp-Source: ABdhPJwh5we7of40BNdoK7hZIYEjbCkSwEmu8fKC0bYDcGsMKLcyjbvyDRE7iUV7KGKtssMgdxUEbg==
X-Received: by 2002:a7b:cc85:: with SMTP id p5mr7656063wma.125.1591877490247; 
 Thu, 11 Jun 2020 05:11:30 -0700 (PDT)
Received: from bobo.ibm.com (193-116-110-116.tpgi.com.au. [193.116.110.116])
 by smtp.gmail.com with ESMTPSA id o8sm4071453wmb.20.2020.06.11.05.11.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2020 05:11:29 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/64: indirect function call use bctrl rather than blrl
 in ret_from_kernel_thread
Date: Thu, 11 Jun 2020 22:11:19 +1000
Message-Id: <20200611121119.1015740-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

blrl is not recommended to use as an indirect function call, as it may
corrupt the link stack predictor.

This is not a performance critical path but this should be fixed for
consistency.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/entry_64.S | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/entry_64.S b/arch/powerpc/kernel/entry_64.S
index 223c4f008e63..f59a17471d4d 100644
--- a/arch/powerpc/kernel/entry_64.S
+++ b/arch/powerpc/kernel/entry_64.S
@@ -400,12 +400,12 @@ _GLOBAL(ret_from_fork)
 _GLOBAL(ret_from_kernel_thread)
 	bl	schedule_tail
 	REST_NVGPRS(r1)
-	mtlr	r14
+	mtctr	r14
 	mr	r3,r15
 #ifdef PPC64_ELF_ABI_v2
 	mr	r12,r14
 #endif
-	blrl
+	bctrl
 	li	r3,0
 	b	.Lsyscall_exit
 
-- 
2.23.0

