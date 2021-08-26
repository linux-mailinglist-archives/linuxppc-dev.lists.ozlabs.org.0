Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA693F8770
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Aug 2021 14:29:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GwMc06c0mz3cB2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Aug 2021 22:29:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=c41ncWUj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52e;
 helo=mail-pg1-x52e.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=c41ncWUj; dkim-atps=neutral
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GwMYN26lhz2ynF
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Aug 2021 22:27:20 +1000 (AEST)
Received: by mail-pg1-x52e.google.com with SMTP id k24so2910329pgh.8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Aug 2021 05:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GKPA4su1Buqj4xjgmRngmGoWZggf3e4D6yOp0HD1SZk=;
 b=c41ncWUjSN+CjXeckhhtv3KJCBDwtCPxKZEzpBlhVcrDlKf7VTOHS1DAc+YzySgv3p
 ImCpDzpITy5nBOLTQyloZkkr5EpWhZ7nZKUHslcRcFTqkwJo3msK1SYfuK7bII+Ac/N+
 yCCT31Fxl9nXwcX8LOBUQzxA6V2CU0DQMTsAUiZLhjo1x8DLH5eZf2KRod0mArL5f+XS
 UvDEn3YNr6a++YVNHIDYaIslErv0hA/QfjnXYeVNgjXvloVSh4aybobWkZP11VtqNzT+
 UvHEahEnKHeGtpL/kfX6TX4mXWFzR3xJvx6C1FFuLlGRdowBPOpDQOYwIk/KHuYmg/X+
 TfIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=GKPA4su1Buqj4xjgmRngmGoWZggf3e4D6yOp0HD1SZk=;
 b=QHTDMFnQVqDm2QQQFP81vDzRZ/QADGHAtfaeDVI4KAZVUm/Iulty8CWT1Sd0JrMxIb
 pK9LSMBQ33airHi+2i0uOfKmO3y4uG7uBYdffKnHv/JwiEb8ihSI3kUnyxOGjbto33tY
 Kd5QWv0qKiM+NX+3ld4KqPlQk7M9woHeKmydQav1SsgmNmuYRpLUWPHsMORM45r+tu3E
 ZFmtJUc4w/Ojyb85zkr1JsjpAnNHxQ1VTWhBivaj2+bARSwVb36TW3vaHKiIg9cK7aaC
 9Nn+24yg1Yzb3ldAlo3JKS06egCNV9uUdU1LtRHZjNksa8ErdYRIPEdbDOemEvHOzJ/h
 pt3Q==
X-Gm-Message-State: AOAM533xVs6yK1hPt0pEXl3RgBGf4BgED6mP2UUBNAR0sg0z3PuznmgA
 XZIAbSGiIvrazbKabrlLeQU=
X-Google-Smtp-Source: ABdhPJy9QdGPIUjTGpW+6le301Q7uxWN3D7Fdf/3wDbQlolKkZg8Jw1C/ddkmmDQUvU0Mv8A2uO9Vg==
X-Received: by 2002:a62:b414:0:b029:317:52d:7fd5 with SMTP id
 h20-20020a62b4140000b0290317052d7fd5mr3562693pfn.30.1629980837765; 
 Thu, 26 Aug 2021 05:27:17 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.15])
 by smtp.gmail.com with ESMTPSA id o2sm3683188pgu.76.2021.08.26.05.27.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 05:27:16 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>,
 Anton Blanchard <anton@ozlabs.org>, Michael Neuling <mikey@neuling.org>
Subject: [PATCH 3/3] powerpc/configs/microwatt: Enable options for systemd
Date: Thu, 26 Aug 2021 21:56:53 +0930
Message-Id: <20210826122653.3236867-4-joel@jms.id.au>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210826122653.3236867-1-joel@jms.id.au>
References: <20210826122653.3236867-1-joel@jms.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When booting with systemd these options are required.

This increases the image by about 50KB, or 2%.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/powerpc/configs/microwatt_defconfig | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/configs/microwatt_defconfig b/arch/powerpc/configs/microwatt_defconfig
index 2f8b1fec9a16..4a4924cd056e 100644
--- a/arch/powerpc/configs/microwatt_defconfig
+++ b/arch/powerpc/configs/microwatt_defconfig
@@ -5,6 +5,7 @@ CONFIG_PREEMPT_VOLUNTARY=y
 CONFIG_TICK_CPU_ACCOUNTING=y
 CONFIG_LOG_BUF_SHIFT=16
 CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=12
+CONFIG_CGROUPS=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 CONFIG_KALLSYMS_ALL=y
@@ -77,8 +78,10 @@ CONFIG_SPI_SPIDEV=y
 CONFIG_EXT4_FS=y
 # CONFIG_FILE_LOCKING is not set
 # CONFIG_DNOTIFY is not set
-# CONFIG_INOTIFY_USER is not set
+CONFIG_AUTOFS_FS=y
+CONFIG_TMPFS=y
 # CONFIG_MISC_FILESYSTEMS is not set
+CONFIG_CRYPTO_SHA256=y
 # CONFIG_CRYPTO_HW is not set
 # CONFIG_XZ_DEC_X86 is not set
 # CONFIG_XZ_DEC_IA64 is not set
-- 
2.33.0

