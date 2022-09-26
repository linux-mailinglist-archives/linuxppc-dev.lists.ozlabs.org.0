Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 629915E984B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 05:43:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MbTB83f3Rz3cdJ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 13:43:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=cDaVSHgP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=cDaVSHgP;
	dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MbT7f6Gy2z300V
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 13:41:18 +1000 (AEST)
Received: by mail-pj1-x1034.google.com with SMTP id i15-20020a17090a4b8f00b0020073b4ac27so5468841pjh.3
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Sep 2022 20:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=dI6VMwfWctaUGRbaIpsfr5t9rhZWAV5Jste8YsgCPgw=;
        b=cDaVSHgP1feRAT35fgEAgdkWWn9v/zqJBASAYQR8rXmVL/vhkRuEN7GzPRXwJa2YHP
         vKB4mEudAUZE+dKFizmpTUY5mH3Qn33GIGkhgvikNgEFopBNf4V8VxlusTzzskXoxW50
         nWe2N8gZEtVt9g36K4P0NOTN75Wi89n22cCjypSKc/Fw9d72VgdAmKQcyDujybQSxcWL
         zDuTTqYrwR1L5azt3cIeg0e6zwjNgGqAekUvN5UkiAQLyChrB9jbP05L5enXjHaQVntN
         kUHqT+qgQAjiwTDCr6hFyZYEsaT7V2KEUimemRDEE+MsK1x6CiEm1dw8feywimYktNsq
         arTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=dI6VMwfWctaUGRbaIpsfr5t9rhZWAV5Jste8YsgCPgw=;
        b=q1I71wscXYmFM8oACRRkhbS/xynAw7G4o0ytfFSeWQ0wUhQol+8aQgf4YYUPzOiRy1
         svALJmk/S/sMQF4V4PZugr7kF+vXPdqB1pAXZKS/Mwe8v4XWJhz+pFB1MfPK3fV+PhpH
         noUTI1gRav9eap/E8odp2prQRWteyFWP3SEnen3oMEOrRwHir6GYqJ/9Kexqd14942bb
         SZIUaWYzn18u45OklsvrUmhrHDSfTvcpC6Lsx3Bstnu/gJukfnVMMUi2uRSh9bo3qIoe
         dD0uedF8jiFCyG/hB04z2+vn7z9uGkfxInHmcuegAo9iU1G+KIA2UiX7URgYe9kKKDDs
         7Q6A==
X-Gm-Message-State: ACrzQf2Qg+1TlFC/+gcbdiRsK32+xTqNyxxNgD8KLmSG5MD38E2siD0H
	0UnX7Qf7EZMX70g2pTFpnY85tcmzWx4=
X-Google-Smtp-Source: AMsMyM5+9vKzIUYy9iA8PymVjlkFmreCAbJpeLHQSM0dAVAeeIC+Y+siDAsej3VlpFEWo7IZLQH0HQ==
X-Received: by 2002:a17:90b:692:b0:203:6c21:b4aa with SMTP id m18-20020a17090b069200b002036c21b4aamr33415571pjz.227.1664163676541;
        Sun, 25 Sep 2022 20:41:16 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (27-32-155-116.static.tpgi.com.au. [27.32.155.116])
        by smtp.gmail.com with ESMTPSA id a3-20020a170902710300b001746f66244asm10122907pll.18.2022.09.25.20.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Sep 2022 20:41:16 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 3/5] powerpc/64: switch asm helpers from GOT to TOC relative addressing
Date: Mon, 26 Sep 2022 13:40:55 +1000
Message-Id: <20220926034057.2360083-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220926034057.2360083-1-npiggin@gmail.com>
References: <20220926034057.2360083-1-npiggin@gmail.com>
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
index 2824a3e32aab..a66cfd76fa4d 100644
--- a/arch/powerpc/boot/ppc_asm.h
+++ b/arch/powerpc/boot/ppc_asm.h
@@ -86,7 +86,8 @@
 
 #ifdef CONFIG_PPC64_BOOT_WRAPPER
 #define LOAD_REG_ADDR(reg,name)			\
-	ld	reg,name@got(r2)
+	addis	reg,r2,name@toc@ha;		\
+	addi	reg,reg,name@toc@l
 #else
 #define LOAD_REG_ADDR(reg,name)			\
 	lis	reg,name@ha;			\
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

