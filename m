Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E0F2B9F28
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Nov 2020 01:17:29 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CccYx5bRvzDqq5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Nov 2020 11:17:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::742;
 helo=mail-qk1-x742.google.com; envelope-from=festevam@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=vTmM9AqA; dkim-atps=neutral
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CccWn4klVzDqpR
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Nov 2020 11:15:27 +1100 (AEDT)
Received: by mail-qk1-x742.google.com with SMTP id r7so7418387qkf.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Nov 2020 16:15:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=OJWY4ky/g1+RSJ3xkBdXjM8dFL5nU7Dn9gzwCm6klp8=;
 b=vTmM9AqA9ldi+pKe442NzcsFba4cC/C+KFg1zYrsXJmjLIyRMn7OvcgLmlNKYrP1RQ
 O7ikDUAkjtnim2reuTf9FaVn6q56egedvQNzAPY86WRNIj4xoPQ0q5/xG1/0FJ6JlBTR
 v4r1jqOBfN5riwXt29joUZsqwOE+N9Fy5Lnt/rI75eW/o01Dh1iM1HDYjCyY0ZaOfj7l
 0g/3pmOUclmh5dsNdB0pmANKsh3ft2A8U3FCgEoMv4hdHzKXKsnfz5SODcP1uPWRMYwc
 SwDwhvnQDgpS+BsPQVRClTskEX/+lgL+SMM0R7ABI5TLV3beVJCXyb7rzAhdzOwFyHUk
 sI1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=OJWY4ky/g1+RSJ3xkBdXjM8dFL5nU7Dn9gzwCm6klp8=;
 b=QobpXRnlkedLz8oxdaul4eqIQf4WdWvMyhZRApQCv/3EJW7N+TjSZsErXT1eDZxun1
 dVtp7p4mhg8729Ca5l4cnO6CTu5OssLy9/K3wCh1Ui0jD1J1IUYWMp/ZvI+OljYL1KP9
 Z/ZH1TWVco/RRhsQX1KwQ8ASF/X2GYwNbgTCXdLypPzLCu55XZt2np9/NOYIW397ewHi
 EQOyrv9co8gVFrv28M6E4RhV4rE9GETlsYmLF++rvC5g7w6O4Fmb61VI9Fg9LB3bZXjQ
 y+z+vBYr6IcWy4X4b8Xr4XsRUUl/xEoleeJgF0AcWe/ORqdcbogOzBVD8grVxopIsDIu
 2bZw==
X-Gm-Message-State: AOAM532/IeYDhiMyEDCC6k8G139uMNb6OgH+AwB6sPfgjzJJVbemBJ3M
 mvB3ZsYISyTsktU+D+3zOLg=
X-Google-Smtp-Source: ABdhPJzqXzKZ/YiJYxpmKK/dX/0R1bmGGfWT/09ZWlCl3uJ6rtIPEAEF8IDuDKlzNoaslLviCIKOfw==
X-Received: by 2002:a37:e47:: with SMTP id 68mr13367372qko.375.1605831324137; 
 Thu, 19 Nov 2020 16:15:24 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:482:997:9ce8:56e7:5368:ece8])
 by smtp.gmail.com with ESMTPSA id
 h65sm1016615qkd.95.2020.11.19.16.15.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 16:15:22 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: mchehab@kernel.org
Subject: [PATCH] media: fsl-viu: Use proper check for presence of {out,
 in}_be32()
Date: Thu, 19 Nov 2020 21:15:09 -0300
Message-Id: <20201120001509.15155-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: hverkuil@xs4all.nl, paulus@samba.org, Fabio Estevam <festevam@gmail.com>,
 geert@linux-m68k.org, linuxppc-dev@lists.ozlabs.org,
 linux-media@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Geert Uytterhoeven <geert@linux-m68k.org>

When compile-testing on m68k or microblaze:

    drivers/media/platform/fsl-viu.c:41:1: warning: "out_be32" redefined
    drivers/media/platform/fsl-viu.c:42:1: warning: "in_be32" redefined

Fix this by replacing the check for PowerPC by checks for the presence
of {out,in}_be32().

As PowerPC implements the be32 accessors using inline functions instead
of macros, identity definions are added for all accessors to make the
above checks work.

Fixes: 29d750686331a1a9 ("media: fsl-viu: allow building it with COMPILE_TEST")
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
[fabio: adapt to mainline]
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 arch/powerpc/include/asm/io.h    | 14 ++++++++++++++
 drivers/media/platform/fsl-viu.c |  5 +++--
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/io.h b/arch/powerpc/include/asm/io.h
index 58635960403c..fcb250db110d 100644
--- a/arch/powerpc/include/asm/io.h
+++ b/arch/powerpc/include/asm/io.h
@@ -194,6 +194,20 @@ static inline void out_be64(volatile u64 __iomem *addr, u64 val)
 #endif
 #endif /* __powerpc64__ */
 
+#define in_be16 in_be16
+#define in_be32 in_be32
+#define in_be64 in_be64
+#define in_le16 in_le16
+#define in_le32 in_le32
+#define in_le64 in_le64
+
+#define out_be16 out_be16
+#define out_be32 out_be32
+#define out_be64 out_be64
+#define out_le16 out_le16
+#define out_le32 out_le32
+#define out_le64 out_le64
+
 /*
  * Low level IO stream instructions are defined out of line for now
  */
diff --git a/drivers/media/platform/fsl-viu.c b/drivers/media/platform/fsl-viu.c
index 4f2a0f992905..bb6c291ed6dc 100644
--- a/drivers/media/platform/fsl-viu.c
+++ b/drivers/media/platform/fsl-viu.c
@@ -31,9 +31,10 @@
 #define DRV_NAME		"fsl_viu"
 #define VIU_VERSION		"0.5.1"
 
-/* Allow building this driver with COMPILE_TEST */
-#if !defined(CONFIG_PPC) && !defined(CONFIG_MICROBLAZE) && !defined(CONFIG_M68K)
+#ifndef out_be32
 #define out_be32(v, a)	iowrite32be(a, (void __iomem *)v)
+#endif
+#ifndef in_be32
 #define in_be32(a)	ioread32be((void __iomem *)a)
 #endif
 
-- 
2.17.1

