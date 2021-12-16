Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2B4477FCC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 23:05:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JFR4R5lhHz3dp7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Dec 2021 09:05:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=RhQ8MwVT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::829;
 helo=mail-qt1-x829.google.com; envelope-from=nnac123@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=RhQ8MwVT; dkim-atps=neutral
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JFQzX2XrLz304V
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Dec 2021 09:00:56 +1100 (AEDT)
Received: by mail-qt1-x829.google.com with SMTP id j17so742636qtx.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Dec 2021 14:00:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mYtJGoUxy8eTpCz9aBNis7G8lKupFj/oGwaaWzNon+I=;
 b=RhQ8MwVTZqYqHdu1zDvEHDL5uk0X5TbQIovM5RC7m5PVAN4ltW5cWkq8x0p8/y9oGi
 iRwQeEk3nAG2ZL33NTufigL4JyrOnlENHpFrxMeCbOOq600LJeybusgSU0K69L3ZpVkl
 KRekVjqSZurrIfwx22FJpbwp593AOOzj/islimwnlXgAoBxwv2123LmbDeY0O+chHR+n
 eYyfTSLmfVESkDc2Bb9H+SKE1tSmezGT+6VQ2WLgxF2cuSNp8wu5NprVjSHzUV8YBp2v
 UoCQEa8TBmAoynLj8Cpwv+P9tjpg9R2UT3JL60KrvXIzynmlCOR0WWdob3jB6WViBBRF
 32Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mYtJGoUxy8eTpCz9aBNis7G8lKupFj/oGwaaWzNon+I=;
 b=DSv/1j/hGoAgXSk3OJYn5zKtVkhywOof7uhlfNNQDPMqc21Co7E6eZJCX8NulrnED8
 nom9/rWbKLPEuPmkPWwlOJSEqjFtJU565ayjDOmBuxkM1t2VqePMCkxLr1k0ZqLvxvUY
 nuLoR0w2E7S57h1+OziMAMheX4d3rL3xKHiN8MCk1kHkIIe7WBEI7OJKOrc3hBqLJ/0R
 FDCIOBNa2j+IYjGS2ZcwTWfgXnKBLmWbg5s/ECowGhGZoLcFYdPTYRsHEAkiayAzCYuE
 J2pvptmiLtZGGIzN2EZbR41nE41sMYh8hvWTPriP+/CMDAmciPsWGQV60O21lycL4BWh
 s4Zw==
X-Gm-Message-State: AOAM531wN1wJrUs8hvjaDcMYrRaE1APWpZK7LuLYn5khem6RXfY32SgA
 UeDZGQEelMm/+QsdD3OpcJmCryWvQbo=
X-Google-Smtp-Source: ABdhPJw+MwOMiZVzFuhkJBXkZk5Q6U/NPRLGwGYcvs0HklftoDNmjsAYubLSloLiRcMlFhXcchhTNQ==
X-Received: by 2002:a05:622a:1354:: with SMTP id
 w20mr6607qtk.566.1639692053173; 
 Thu, 16 Dec 2021 14:00:53 -0800 (PST)
Received: from starship-12.hsd1.fl.comcast.net
 ([2601:589:4a00:1ed0:dce6:135:603d:e519])
 by smtp.gmail.com with ESMTPSA id y21sm5478483qtw.10.2021.12.16.14.00.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 14:00:52 -0800 (PST)
From: Nick Child <nnac123@gmail.com>
X-Google-Original-From: Nick Child <nick.child@ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 06/20] powerpc/xmon: Add __init attribute to eligible
 functions
Date: Thu, 16 Dec 2021 17:00:21 -0500
Message-Id: <20211216220035.605465-7-nick.child@ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211216220035.605465-1-nick.child@ibm.com>
References: <20211216220035.605465-1-nick.child@ibm.com>
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
Cc: Nick Child <nick.child@ibm.com>, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

`xmon_register_spus` defined in 'arch/powerpc/xmon' is deserving of an
`__init` macro attribute. This functions is only called by other
initialization functions and therefore should inherit the attribute.
Also, change the function declaration in the header file to include
`__init`.

Signed-off-by: Nick Child <nick.child@ibm.com>
---
 arch/powerpc/include/asm/xmon.h | 2 +-
 arch/powerpc/xmon/xmon.c        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/xmon.h b/arch/powerpc/include/asm/xmon.h
index 68bfb2361f03..f2d44b44f46c 100644
--- a/arch/powerpc/include/asm/xmon.h
+++ b/arch/powerpc/include/asm/xmon.h
@@ -12,7 +12,7 @@
 
 #ifdef CONFIG_XMON
 extern void xmon_setup(void);
-extern void xmon_register_spus(struct list_head *list);
+void __init xmon_register_spus(struct list_head *list);
 struct pt_regs;
 extern int xmon(struct pt_regs *excp);
 extern irqreturn_t xmon_irq(int, void *);
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index f9ae0b398260..f51d7404a6ea 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -4136,7 +4136,7 @@ struct spu_info {
 
 static struct spu_info spu_info[XMON_NUM_SPUS];
 
-void xmon_register_spus(struct list_head *list)
+void __init xmon_register_spus(struct list_head *list)
 {
 	struct spu *spu;
 
-- 
2.25.1

