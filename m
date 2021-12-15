Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE32B476BAA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 09:14:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JF4dh4M2lz3dq5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 19:14:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=cYfpjLZr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::835;
 helo=mail-qt1-x835.google.com; envelope-from=nnac123@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=cYfpjLZr; dkim-atps=neutral
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [IPv6:2607:f8b0:4864:20::835])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JDgK12NZ6z2ym7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Dec 2021 03:13:25 +1100 (AEDT)
Received: by mail-qt1-x835.google.com with SMTP id t34so22290565qtc.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Dec 2021 08:13:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EfdgsUzZ/16c/b/NEBn/Ws/owNgu6y53UoszdYTRpN0=;
 b=cYfpjLZr0xsac8U6D3RPh8SgAbGX0aliG8Srzn0Gpqljox4ivbck8q+ACvWvMyCWyx
 YQfPQTKuWg7htUBPj/icY2SCqXJna3PU7jW8cTnXXF5jEskigdCZ/3Td1Ft3AAsBPxC2
 6ZgfmWhYa56Fo3SZetk+FVAw6qapVFTBDwAQu+pzbzDUHxvUdV4ObYHT0vO3ULbGAKNn
 xzkNuQ2FPiKBdAKbd0ZYMs9eYYBkoFcXtLaIW8QfvmE1wdUUTE3yq5aAwHErZdGyEbXc
 FxdxKxw8RIciybTYDbeCbYt7qHaf/Nh0AVaobG3xHkgpRcq1by5Ewe0Qe7PEVnJKqHlZ
 a0fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EfdgsUzZ/16c/b/NEBn/Ws/owNgu6y53UoszdYTRpN0=;
 b=tv7l2HqaWXIiIl9LYDYIlb1uDUixagB5NOntse/yQ7YV0NbQSOx8nDoiX7L67Ufn2z
 JVv2slzdge4AIVYlZ4gd/kGGfrVwl2aUbkQgdIFLAPu5CgbTPskeyAUiP8dSabw1iFA0
 b6ikTQlIW1AptsRKYTzsnIoH5j56U6HsRMtQnRW+i0wQrwNRa2BW5TkVKfrqffJRlocx
 cnkzppYvG0qwps795wcoRyFt3ibOi0w0erEvLruzyk0QaR2/SBYgG07WuSpqWy2gHlNG
 HwckZ/PkYSCL5FMLpd7QjxlSPbBt6eoQqXsBGSH+V6/UkVHR/dfUFyL4wnL+qvE40SkN
 OQ9g==
X-Gm-Message-State: AOAM533VoKI92opNhG0bYfyKDVSPuwjQwAN2/FfpEYI3tSBzJr1r9Fo1
 Fk7nGOx2g99v+kGG/ExcVFq85O/jqfY=
X-Google-Smtp-Source: ABdhPJzjmihqpjOuqRLNue9ajV/A9Gv8TWKj/s0aYqHkcpG+RV5haKKLWTqeWVTgnx5ERSnA6RHprQ==
X-Received: by 2002:a05:622a:291:: with SMTP id
 z17mr12947897qtw.138.1639584802200; 
 Wed, 15 Dec 2021 08:13:22 -0800 (PST)
Received: from starship-12.hsd1.fl.comcast.net
 ([2601:589:4a00:1ed0:73:d0b0:acf1:e2d0])
 by smtp.gmail.com with ESMTPSA id t11sm1276436qkp.56.2021.12.15.08.13.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 08:13:21 -0800 (PST)
From: Nick Child <nnac123@gmail.com>
X-Google-Original-From: Nick Child <nick.child@ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 06/20] powerpc/xmon: Add __init attribute to eligible functions
Date: Wed, 15 Dec 2021 11:12:29 -0500
Message-Id: <20211215161243.16396-7-nick.child@ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211215161243.16396-1-nick.child@ibm.com>
References: <20211215161243.16396-1-nick.child@ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 16 Dec 2021 19:09:28 +1100
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
Cc: Nick Child <nick.child@ibm.com>, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

`xmon_register_spus` defined in 'arch/powerpc/xmon' is deserving of an
`__init` macro attribute. This functions is only called by other
initialization functions and therefore should inherit the attribute.
Also, change the function declaration in the header file to include `__init`.

Signed-off-by: Nick Child <nick.child@ibm.com>
---
 arch/powerpc/include/asm/xmon.h | 2 +-
 arch/powerpc/xmon/xmon.c        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/xmon.h b/arch/powerpc/include/asm/xmon.h
index 68bfb2361f03..3e5970a4f215 100644
--- a/arch/powerpc/include/asm/xmon.h
+++ b/arch/powerpc/include/asm/xmon.h
@@ -12,7 +12,7 @@
 
 #ifdef CONFIG_XMON
 extern void xmon_setup(void);
-extern void xmon_register_spus(struct list_head *list);
+extern void xmon_register_spus(struct list_head *list) __init;
 struct pt_regs;
 extern int xmon(struct pt_regs *excp);
 extern irqreturn_t xmon_irq(int, void *);
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index 83100c6524cc..e2a13e58dcea 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -4134,7 +4134,7 @@ struct spu_info {
 
 static struct spu_info spu_info[XMON_NUM_SPUS];
 
-void xmon_register_spus(struct list_head *list)
+void __init xmon_register_spus(struct list_head *list)
 {
 	struct spu *spu;
 
-- 
2.25.1

