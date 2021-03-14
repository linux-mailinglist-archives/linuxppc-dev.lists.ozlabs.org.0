Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3DD33A871
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Mar 2021 23:05:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DzDBn1QSYz3cV4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 09:05:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=bz8Q43KX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::729;
 helo=mail-qk1-x729.google.com; envelope-from=unixbhaskar@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=bz8Q43KX; dkim-atps=neutral
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DzDBL4WGhz30Lg
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Mar 2021 09:05:13 +1100 (AEDT)
Received: by mail-qk1-x729.google.com with SMTP id g185so29952937qkf.6
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Mar 2021 15:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZaPK4lEgxNRFwgYzDF7MyhZ1wZueaIxBKjRKIQkNhsg=;
 b=bz8Q43KX9TlYiBsvim1gpU1heQfrSJVuo3sciwnbrzK9sLsDS7z8OLcfn9sGntGuGU
 tY+bSe20WOA9kQnSbcLUxZ55p+lJ6+zVMYn00RByytGs0lnAFfhJXrOFcyGNtvSfKhdg
 bRrwAHdM2B2GqjuQMne351GBkdY1QquqNGcJg9r4iLPVAJgFkLP7t9OiU5wpMnAZZwN+
 RAKU4gCJAzyUCC9qsCJChjxfj08DkOAaS0GBCoZAjCJP4d8iFM6UoOCxYZSxptUBSNFk
 ebvEDr5y/XCqIiVpJjFiKtwYVPAitCmTy07zQDE9RzluChwzAlvOdQn/YiLcSxPUsCrb
 8Gvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZaPK4lEgxNRFwgYzDF7MyhZ1wZueaIxBKjRKIQkNhsg=;
 b=W4i+2oHKdla6pTpQWDFnTbdorV82H2w86ZbgdV7qkrLDpQMe7kulcXfc5+hpCAFq5e
 3QfqF0nRNDB7BJ1uSyWZ5Bo907Vhf1NV+hjdHZn0qRB7+lytu0X+qXhmeDA009NEIR7J
 Hwu/tD5KdvWTcz7fcx9nKZ7/dwKr25Nb7fVS3WrPuddura2h7B8xJ1/HKBBaTuxCLbdR
 NaCGIg7bJ5wezdYoJ6liAWB4mDcLHbofHKArVqKZscf566XvvwuFZcAC5JjCcpop+se4
 QByh3R4O8szOrzft8NohQj3Py4DVXtk5JjHIqGOL/3HdsmDqXV+N6F7oxEXxDAv1y3Fc
 SlMQ==
X-Gm-Message-State: AOAM530HwsTsZEs2Nv/ak5kPBZd/CFJ6zxdZdOb0iHxUSkwmu/nFHTOW
 tJkSUbJMwB/trjuuqgITQ3g=
X-Google-Smtp-Source: ABdhPJyytPEIUs/+P7hmkE51/n/lFxJxDU/MwToh6N4ZWlIOvBU0GxDcr5SoLikOznmMIiaHQOo+ng==
X-Received: by 2002:a37:a183:: with SMTP id
 k125mr22732511qke.332.1615759508632; 
 Sun, 14 Mar 2021 15:05:08 -0700 (PDT)
Received: from localhost.localdomain ([156.146.37.247])
 by smtp.gmail.com with ESMTPSA id v7sm10837297qkv.86.2021.03.14.15.05.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 15:05:08 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org,
 akpm@linux-foundation.org, rppt@kernel.org, unixbhaskar@gmail.com,
 oss@buserror.net, christophe.leroy@csgroup.eu,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc: kernel: Trivial spelling fixes throughout the file
 head_fsl_booke.S
Date: Mon, 15 Mar 2021 03:34:36 +0530
Message-Id: <20210314220436.3417083-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.30.2
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
Cc: rdunlap@infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Trivial spelling fixes throughout the file.

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 arch/powerpc/kernel/head_fsl_booke.S | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kernel/head_fsl_booke.S b/arch/powerpc/kernel/head_fsl_booke.S
index fdd4d274c245..c6fcfca0b0d7 100644
--- a/arch/powerpc/kernel/head_fsl_booke.S
+++ b/arch/powerpc/kernel/head_fsl_booke.S
@@ -113,7 +113,7 @@ _ENTRY(_start);

 1:
 	/*
-	 * We have the runtime (virutal) address of our base.
+	 * We have the runtime (virtual) address of our base.
 	 * We calculate our shift of offset from a 64M page.
 	 * We could map the 64M page we belong to at PAGE_OFFSET and
 	 * get going from there.
@@ -403,7 +403,7 @@ interrupt_base:
 	EXCEPTION(0x2900, AP_UNAVAIL, AuxillaryProcessorUnavailable, \
 		  unknown_exception, EXC_XFER_STD)

-	/* Decrementer Interrupt */
+	/* Decremented Interrupt */
 	DECREMENTER_EXCEPTION

 	/* Fixed Internal Timer Interrupt */
@@ -497,7 +497,7 @@ END_BTB_FLUSH_SECTION
 #endif
 #endif

-	bne	2f			/* Bail if permission/valid mismach */
+	bne	2f			/* Bail if permission/valid mismatch */

 	/* Jump to common tlb load */
 	b	finish_tlb_load
@@ -592,7 +592,7 @@ END_BTB_FLUSH_SECTION
 #endif
 #endif

-	bne	2f			/* Bail if permission mismach */
+	bne	2f			/* Bail if permission mismatch */

 	/* Jump to common TLB load point */
 	b	finish_tlb_load
--
2.30.2

