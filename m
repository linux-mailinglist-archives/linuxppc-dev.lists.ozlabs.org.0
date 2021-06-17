Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D1DDE3AB7F1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 17:54:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5RSv4Cc1z3c1h
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 01:54:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=evu/l+h/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::532;
 helo=mail-pg1-x532.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=evu/l+h/; dkim-atps=neutral
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5RPW27t4z3bwG
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 01:51:42 +1000 (AEST)
Received: by mail-pg1-x532.google.com with SMTP id e22so5291155pgv.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jun 2021 08:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b7xs60IviUlfTA2KypqGNNeJ+U3ruKNU+swFqwPJGgI=;
 b=evu/l+h/5n2Yq+AgOps9LA0e0gPuTKR+zFIJCkhXXiO/7omrKFKMtPOk43djXPpB/A
 gILo30bYMxxEJymJJh296ExL2d60OrqgF9qRhYSK/ak4/0YEZBq0lJlvD2puTJR1EVUj
 Myjruao0UkqKH16Nl0uBVsj2hSeePiaySwdOvNFxlcCbiFgechJyoIPWqErLa3qxmQEU
 s/kpWgowjyF779Yb3afllIWYRVH910Cpy29GSttipB+c6AcFiiWHlBqIPbV/itoDPJsZ
 ALt+PGKjWnifH6PxqEebVlOgkpswZTjU+wtPqlmu6fsiM7+GrGpn9DSNia+jDCeRwRXw
 ZEYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b7xs60IviUlfTA2KypqGNNeJ+U3ruKNU+swFqwPJGgI=;
 b=VpdVap9SEvHAzzD3VTRWHp7AoDmFB1pRMD7omOMnBzFdUE/9sm8qDfevJJB1yaJXiF
 N3sKOh+OtaR7BmfO0BA9rnIK8UoB/A04CBs8QT/Aqq0DZjU0XhiLJMG7QWNHMmIlfpfm
 6AH7ujownm7Xd/1tIr8+ghl5tfxpVVePxx3wZd0kK2uBjeVcUdpw7QGnfkTIy38xqQq5
 TKJexXSvo9d/RTYznyphc1FMsXSIowdGpU9tGlf84MMxA9Xxpi1UcdFYZ60/uHnT+y3a
 GinO1taXxyS4krJ3HHjpLlnGUavvxp8zf6UK7qySyXbDhUBxzTJTyUAM8ZUCeSFk1k9A
 htXg==
X-Gm-Message-State: AOAM532sSldMPyeLWurWgztJwi1zwokz4tClHhFavBWCWhjMuy84K86v
 C6CudbBObZnHd9JN2H5cWtYhlk829WY=
X-Google-Smtp-Source: ABdhPJwpQOLXLbinX4ukJnLZsY4MgqS1O8lxCLWXhxdiaEcBo5TcEMy6FEj6uh3h2EO6TYWJ+it38g==
X-Received: by 2002:aa7:8392:0:b029:2db:4a7:d866 with SMTP id
 u18-20020aa783920000b02902db04a7d866mr468965pfm.66.1623945100026; 
 Thu, 17 Jun 2021 08:51:40 -0700 (PDT)
Received: from bobo.ibm.com (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id a15sm5749733pfl.100.2021.06.17.08.51.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 08:51:39 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 07/17] powerpc/64s: system call avoid setting MSR[RI] until
 we set MSR[EE]
Date: Fri, 18 Jun 2021 01:51:06 +1000
Message-Id: <20210617155116.2167984-8-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210617155116.2167984-1-npiggin@gmail.com>
References: <20210617155116.2167984-1-npiggin@gmail.com>
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

This extends the MSR[RI]=0 window a little further into the system
call in order to pair RI and EE enabling with a single mtmsrd.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 2 --
 arch/powerpc/kernel/interrupt_64.S   | 4 ++--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index a2ae14d0600e..b6e1c46c97d0 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1942,8 +1942,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_REAL_LE)
 	mtctr	r10
 	bctr
 	.else
-	li	r10,MSR_RI
-	mtmsrd 	r10,1			/* Set RI (EE=0) */
 #ifdef CONFIG_RELOCATABLE
 	__LOAD_HANDLER(r10, system_call_common)
 	mtctr	r10
diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/interrupt_64.S
index e17a77a2c1a1..ab6b99609d0e 100644
--- a/arch/powerpc/kernel/interrupt_64.S
+++ b/arch/powerpc/kernel/interrupt_64.S
@@ -283,9 +283,9 @@ END_BTB_FLUSH_SECTION
 	 * trace_hardirqs_off().
 	 */
 	li	r11,IRQS_ALL_DISABLED
-	li	r12,PACA_IRQ_HARD_DIS
+	li	r12,-1 /* Set MSR_EE and MSR_RI */
 	stb	r11,PACAIRQSOFTMASK(r13)
-	stb	r12,PACAIRQHAPPENED(r13)
+	mtmsrd	r12,1
 
 	/* Calling convention has r9 = orig r0, r10 = regs */
 	mr	r9,r0
-- 
2.23.0

