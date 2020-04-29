Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B0B1BD585
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 09:16:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49BqYn1TndzDr7Z
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 17:16:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=DUZ306f1; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49BqGX23WSzDr88
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Apr 2020 17:02:59 +1000 (AEST)
Received: by mail-pj1-x1043.google.com with SMTP id y6so400760pjc.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Apr 2020 00:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1gJQsv+td7LAishbi+4fS3xloo3KIU0B/zEwahN4Dn4=;
 b=DUZ306f1emJIcXiKkmLqtbFH7Xzkf/O+70BzdNfDkLN5wL88B5QxVqylnUeYXRmzez
 mwYnQTh0fjUx9lPIgfsvOqelGJjajyszICEcTdaS1a+axufugiwaugvb+zxVNvPbjNmq
 tuxGO/w5lupfYobzLpViM6WZr8eH5K4VlcXZ2Y9rBhDibwJMff3xGc1wYE8t8I+X/+7S
 YEgBWYz5X1KIJz0GtLw5c74443TJUYqBjygn9LcI6y9ZSrPEJG4ADEUerz+QzxLedm/Y
 ARpTHHP44SN/58swZ/JsrmLbgNoB1NKY+XLyKGsfTdTZ3FYkALR9rP7pCJj8Zim0+Qr5
 ukLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1gJQsv+td7LAishbi+4fS3xloo3KIU0B/zEwahN4Dn4=;
 b=qBje4aRisAH443ov/dBuXQcKplQpv7QXB8CKZKCk2PWAwWwPFr2jQ5O/5ndE46/BiL
 L+4WmkHCVlVpDBH/zR9NBZATNyVeGhs0vqu9prghnqWYV1qtX+OJGchew2WsCyPGlmkJ
 d59KF6J7Xbb7bXWu/yXb1Xa727naiXLoe61B9/Of2mNAqa5VGOZBC0L9uCrWVbZWxFT7
 7wkQ6tDR+IDSionawNn+Pg6VL2w46YFACN8HLjDE2SGP/hZh421d2nOEt1L+S2qBSxJG
 bor2gAlXIEdSQHPKWdBmcoRUBxyFRpfy+7Lj2c3MKt8qTN958bsr+i/mL2WuNp48mYUX
 fCDw==
X-Gm-Message-State: AGi0PuaeY2cpgwsBpjwKlSPNiO+Ux9Y788FuT+E9XsvcKjfHWh5uBh4Q
 jPEnfcyn3w4l0SKwnQ7Oz3w0vJIq
X-Google-Smtp-Source: APiQypLIR0omm9gYvT/UlWV3/iyL3CcmaMKHwoc+9nL2GhVf2+Pel3nouk4YXboNoYtPlA9vU30/Fg==
X-Received: by 2002:a17:902:a585:: with SMTP id
 az5mr19166839plb.334.1588143777077; 
 Wed, 29 Apr 2020 00:02:57 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([203.220.177.17])
 by smtp.gmail.com with ESMTPSA id t20sm3770826pjo.13.2020.04.29.00.02.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Apr 2020 00:02:56 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/64s: Fix early_init_mmu section mismatch
Date: Wed, 29 Apr 2020 17:02:47 +1000
Message-Id: <20200429070247.1678172-1-npiggin@gmail.com>
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

Christian reports:

  MODPOST vmlinux.o
  WARNING: modpost: vmlinux.o(.text.unlikely+0x1a0): Section mismatch in
  reference from the function .early_init_mmu() to the function
  .init.text:.radix__early_init_mmu()
  The function .early_init_mmu() references
  the function __init .radix__early_init_mmu().
  This is often because .early_init_mmu lacks a __init
  annotation or the annotation of .radix__early_init_mmu is wrong.

  WARNING: modpost: vmlinux.o(.text.unlikely+0x1ac): Section mismatch in
  reference from the function .early_init_mmu() to the function
  .init.text:.hash__early_init_mmu()
  The function .early_init_mmu() references
  the function __init .hash__early_init_mmu().
  This is often because .early_init_mmu lacks a __init
  annotation or the annotation of .hash__early_init_mmu is wrong.

The compiler is uninlining early_init_mmu and not putting it in an init
section because there is no annotation. Add it.

Reported-by: Christian Zigotzky <chzigotzky@xenosoft.de>
Tested-by: Christian Zigotzky <chzigotzky@xenosoft.de>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/book3s/64/mmu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/book3s/64/mmu.h b/arch/powerpc/include/asm/book3s/64/mmu.h
index bb3deb76c951..3ffe5f967483 100644
--- a/arch/powerpc/include/asm/book3s/64/mmu.h
+++ b/arch/powerpc/include/asm/book3s/64/mmu.h
@@ -208,7 +208,7 @@ void hash__early_init_devtree(void);
 void radix__early_init_devtree(void);
 extern void hash__early_init_mmu(void);
 extern void radix__early_init_mmu(void);
-static inline void early_init_mmu(void)
+static inline void __init early_init_mmu(void)
 {
 	if (radix_enabled())
 		return radix__early_init_mmu();
-- 
2.23.0

