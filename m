Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D155D4F62C
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jun 2019 16:23:02 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45WHpD28nvzDqn4
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Jun 2019 00:23:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="OX1B+enj"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45WGL20jgBzDqbx
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jun 2019 23:16:58 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id t16so4964903pfe.11
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jun 2019 06:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EVytJtpPwz/cy+PU3uvzEmef2FVhbN4/V1vbquZmNE4=;
 b=OX1B+enj43IohZ9QRuS/aS9mj/uTJFGUfh1yrvkQZ8DkY48m7I8nKjyJig2geDWW+V
 l4poVXrfChfO90ZjQuBwcKxDJsIxOv/yrQwqYQQkKEKtS5SSMZk+RuxnrSPwQmL0q3ZA
 Ml3u4yaX3ydxvYf9RL0ioifJNFPWnM0RA4EjCPz8hUiVceoM8aNc3pddNXBoSLOy0A6o
 sg2QGF+YBpBArrPlih7BoB+zdoSvg7PQIpiaA2iJnfMdTEFh5nyzXWvjtlCFEkU7JA1p
 zAL0tarPUzK4CiX+6dcKdJzF/CgwGcNXKKvSehqTfzM/bscEs/Hpatoz6fZkAIdDOeWb
 Xrwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EVytJtpPwz/cy+PU3uvzEmef2FVhbN4/V1vbquZmNE4=;
 b=JKpjTZDyIB2WhpcOt56DZZUF9b8Tob96tdYGm3CzoE/wza+hvi49T0j4utj6BEcFTa
 qCDOlZz8VTvFIJqIvKXPtjj/WUP/R0dXMvrZSLR+O6C0exmtB6mJb3FKe9arAc8dt1Ox
 rt2XD7TDKQFQRw6dQUIuztxPTqrphfPFf1icjRQtHFCs4J+LlKVnZfGgUnC/WZ0wG9Qc
 O6zLiQs/qHjNq2t76nQQfMmoI+JaiGmpzk+ULCPnKpe1USXxgLrdhEss+jifZHzxwRZc
 60nPWnr0a5VyQU+MTo8f4bjJ1AM/oftfUnRww9FgwZ5nXftZxa4SfD6PXDR0tqZ34RDR
 wgow==
X-Gm-Message-State: APjAAAVDG/wS6vKY2SEPV2svJfHYaleIORqhIlX3o7f0TTvuWmnyzW/U
 CkwRSMAlmbKjDtlHsWd4mPc/KwztP5A=
X-Google-Smtp-Source: APXvYqxw+FogYvfAUWUIT0hWOpvgPj9YtUYKrX1OS5OMHbSD7SrkCl70VB66DtsjIMQKFh/W+jdMfQ==
X-Received: by 2002:a63:f70b:: with SMTP id x11mr23890644pgh.212.1561209416185; 
 Sat, 22 Jun 2019 06:16:56 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([1.144.136.2])
 by smtp.gmail.com with ESMTPSA id n1sm5192471pgv.15.2019.06.22.06.16.53
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 22 Jun 2019 06:16:55 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 20/25] powerpc/64s/exception: remove unused BRANCH_TO_COMMON
Date: Sat, 22 Jun 2019 23:15:30 +1000
Message-Id: <20190622131535.20996-21-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190622131535.20996-1-npiggin@gmail.com>
References: <20190622131535.20996-1-npiggin@gmail.com>
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

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 87be2c650bab..a96a8d225ad3 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -224,20 +224,12 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
 	bctr
 
 #ifdef CONFIG_RELOCATABLE
-#define BRANCH_TO_COMMON(reg, label)					\
-	__LOAD_HANDLER(reg, label);					\
-	mtctr	reg;							\
-	bctr
-
 #define BRANCH_LINK_TO_FAR(label)					\
 	__LOAD_FAR_HANDLER(r12, label);					\
 	mtctr	r12;							\
 	bctrl
 
 #else
-#define BRANCH_TO_COMMON(reg, label)					\
-	b	label
-
 #define BRANCH_LINK_TO_FAR(label)					\
 	bl	label
 #endif
-- 
2.20.1

