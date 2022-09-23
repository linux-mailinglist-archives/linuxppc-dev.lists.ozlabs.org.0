Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C25C5E726E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 05:27:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYczM4ZbTz3f4t
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 13:27:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=I4FiatH+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=I4FiatH+;
	dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MYcwr1YQ6z3c7g
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Sep 2022 13:25:32 +1000 (AEST)
Received: by mail-pj1-x102a.google.com with SMTP id q9-20020a17090a178900b0020265d92ae3so4398483pja.5
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Sep 2022 20:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=D5nADImDKZ3Pix1vluG2CPfiSiauyaBk5+AT8KC3E6Q=;
        b=I4FiatH+VHro9K+1SB1PUkVWlDYmqpYl4h4hhymvuTOLKrWrXDkQNvpnj11njVJa0M
         V3MU1OJsT5aTaVak/kZk4YLclIJLgOyUNxT2zYSwgJDsYZnthgfwpBXz8jJTg6fWYhOc
         ySWFLN165vEDHfoFbFUUe4809IBeUzuQss8UMNJVtYSLRMpAFk8etEkdFpZFOjRmW80C
         Wc9J2e7dzqKddRgyMIVOFeWD9b880kyUBJFx4idCcIsV3SnvNj6GeDVVMeBHzq3AANRJ
         AhjdlVYWO1hRqHWfmz9MXK7oOlzopIn+XsS0itIrGpJGcj/5WiydBqK0nz2/Mc6AnFz2
         qsNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=D5nADImDKZ3Pix1vluG2CPfiSiauyaBk5+AT8KC3E6Q=;
        b=0JehaMu0Dx/bjXR7yrOCAmSq29AaoUcNaP26t2WtlDOH1m0MPTec1VO3x5rtcdTCw6
         xC/d0qVzq1JTNHeo1QbCdnlREB8Cj7Z5bNXajR7amZ+f/g+ffZa6pdANDILNLmGN9+tk
         K7rXu5Bezsui5qP6e4X21zEIVJcM1eLE7YwPIF8XMKWaPejq213o3C5vVSOX4X/VozwL
         SECLtStrqOMPldTp5brA72EHz9Znqrfu6fLrq0x/iZy8pGoMh07bk6svkqf/BpDOCyk9
         DMqcZMV4Ylx4wRqTcpjMK8AT3GsvULVXG5bliP/5V45cGCfW+qj/LGS7utwuIlNowtXu
         EFKA==
X-Gm-Message-State: ACrzQf31DRy61BqV9JdUmG4GaF0525H3YNOQMZKaIV1D/G109LSog980
	4IxNY0/vfwrk052usrMu5Jy4V2xkosC7sw==
X-Google-Smtp-Source: AMsMyM6xPQENdBDbem354Fd83ng8612Kr7tR8JPRfZEcxtgge6FQEX7UELxQtKhXY+EeerLzJ711Xw==
X-Received: by 2002:a17:902:e80e:b0:178:2ecb:16bb with SMTP id u14-20020a170902e80e00b001782ecb16bbmr6495239plg.152.1663903530047;
        Thu, 22 Sep 2022 20:25:30 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (27-32-155-116.static.tpgi.com.au. [27.32.155.116])
        by smtp.gmail.com with ESMTPSA id q3-20020a170902f78300b001752216ca51sm4895224pln.39.2022.09.22.20.25.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 20:25:29 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/5] powerpc/64: switch asm helpers from GOT to TOC relative addressing
Date: Fri, 23 Sep 2022 13:25:10 +1000
Message-Id: <20220923032512.535725-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220923032512.535725-1-npiggin@gmail.com>
References: <20220923032512.535725-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>, Alan Modra <amodra@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There is no need to use GOT addressing within the kernel.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/boot/ppc_asm.h        | 3 ++-
 arch/powerpc/include/asm/ppc_asm.h | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/boot/ppc_asm.h b/arch/powerpc/boot/ppc_asm.h
index f823f87b7357..afdd195528eb 100644
--- a/arch/powerpc/boot/ppc_asm.h
+++ b/arch/powerpc/boot/ppc_asm.h
@@ -90,7 +90,8 @@
 	addi	reg,reg,name@l
 #else
 #define LOAD_REG_ADDR(reg,name)			\
-	ld	reg,name@got(r2)
+	addis	reg,r2,name@toc@ha;		\
+	addi	reg,reg,name@toc@l
 #endif
 
 #endif /* _PPC64_PPC_ASM_H */
diff --git a/arch/powerpc/include/asm/ppc_asm.h b/arch/powerpc/include/asm/ppc_asm.h
index 83c02f5a7f2a..da570b197e82 100644
--- a/arch/powerpc/include/asm/ppc_asm.h
+++ b/arch/powerpc/include/asm/ppc_asm.h
@@ -315,7 +315,8 @@ GLUE(.,name):
 	rldimi	reg, tmp, 32, 0
 
 #define LOAD_REG_ADDR(reg,name)			\
-	ld	reg,name@got(r2)
+	addis	reg,r2,name@toc@ha;		\
+	addi	reg,reg,name@toc@l
 
 #define LOAD_REG_ADDRBASE(reg,name)	LOAD_REG_ADDR(reg,name)
 #define ADDROFF(name)			0
-- 
2.37.2

