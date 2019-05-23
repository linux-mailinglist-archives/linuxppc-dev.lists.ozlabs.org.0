Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D2F2763A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2019 08:51:23 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 458gBw2thSzDqVn
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2019 16:51:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::341; helo=mail-wm1-x341.google.com;
 envelope-from=mathieu.malaterre@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="QEeOX5Zp"; 
 dkim-atps=neutral
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 458g9T35x9zDqTy
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 May 2019 16:50:04 +1000 (AEST)
Received: by mail-wm1-x341.google.com with SMTP id c77so4521007wmd.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 May 2019 23:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HmFIp9t60XLoWbjpmc3RIKG7TQwMK3zhK3suz8duCcY=;
 b=QEeOX5Zpege49oGEBr/MZw4gdpiibcLBcjULl5TUds3gk8zAdN8f1nfT1u+ph3fgaU
 /3l68la0eQiaGbHrv6tfi2qhOpJu//Dn5OToqvU2T/urx8hetpHMpLCC9TOMa2v+EuE2
 IkazlMnmKpYUetYUAYrn29xY3+m6WpLyo4vqtiV8rSDCeyCzk5MeM+lRRx5s3WY1/ity
 /uvsMq2tNu1qLCNNdgMX6Y9qpvzsDGL5TGYc8lDaVmE8ME8BjlbyS6E0vqN3ftwHzuvi
 ggFlgT9GEepD47JvSKsanvVRtIditNdwnIzS1RaaOnTomsrmj3dPVklO6NnxdviUPg2/
 ecZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=HmFIp9t60XLoWbjpmc3RIKG7TQwMK3zhK3suz8duCcY=;
 b=XuZ+AW+4OhWDiKPKvNLYE5lkihUngu1xhi9waPqs16gVwR3TYRxpWAyVleWs9jq2H1
 +ymRi55kgIKxbv16PEII7dig478XYjQmXhynzl2Bo0q0lcmyKT/aeRC0+Kw0CtUnOHU6
 qTrShoVD5yOivTnE6HfijSmpL+ZwmLNkRfN5kC15OxqvgD2tr2yu00xslwRxeRgbkjdo
 dHZtyqxaWGuGaHY/IIa3Vyw1Dvs+0xjQQlTJGRIG8bM75CGPqbxNAsPsTCADO8N84XXk
 9KQFBFI5FcUXs+qxi8qfLZm9bNzMvIxsgiaNJ9Mu+JXHO9k1vKy6W70r5KxtrDehhysw
 F1oQ==
X-Gm-Message-State: APjAAAVMYiPvlljB9Lz8InDwBS/k62eMqCREB45Yc+FmyZM/Zsa5WNX7
 EXe4A6iP6mqYOgco/wG05vI=
X-Google-Smtp-Source: APXvYqzRjJAfgOF0LfSB//bPT2XjMKpaZ04zbTcRKVPJSru3IHBGx1d8nHeZGLgkGQJbXV3P77YNBQ==
X-Received: by 2002:a05:600c:21d7:: with SMTP id
 x23mr10884971wmj.87.1558594199985; 
 Wed, 22 May 2019 23:49:59 -0700 (PDT)
Received: from macbookpro.malat.net ([2a01:e34:ee1e:860:6f23:82e6:aa2d:bbd1])
 by smtp.gmail.com with ESMTPSA id
 g6sm36004224wro.29.2019.05.22.23.49.59
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 22 May 2019 23:49:59 -0700 (PDT)
Received: by macbookpro.malat.net (Postfix, from userid 1000)
 id 9137C1146D73; Thu, 23 May 2019 08:49:57 +0200 (CEST)
From: Mathieu Malaterre <malat@debian.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc/32s: Include <linux/moduleloader.h> header file to
 fix a warning
Date: Thu, 23 May 2019 08:49:56 +0200
Message-Id: <20190523064956.29008-1-malat@debian.org>
X-Mailer: git-send-email 2.20.1
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
Cc: Mathieu Malaterre <malat@debian.org>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In commit 2edb16efc899 ("powerpc/32: Add KASAN support") support for
KASAN has been added. However building it as module leads to (warning
treated as error with W=1):

  arch/powerpc/mm/kasan/kasan_init_32.c:135:7: error: no previous prototype for 'module_alloc' [-Werror=missing-prototypes]

Make sure to include <linux/moduleloader.h> to provide the following
prototype: module_alloc.

Signed-off-by: Mathieu Malaterre <malat@debian.org>
---
 arch/powerpc/mm/kasan/kasan_init_32.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/mm/kasan/kasan_init_32.c b/arch/powerpc/mm/kasan/kasan_init_32.c
index 0d62be3cba47..0c31e440d094 100644
--- a/arch/powerpc/mm/kasan/kasan_init_32.c
+++ b/arch/powerpc/mm/kasan/kasan_init_32.c
@@ -7,6 +7,7 @@
 #include <linux/memblock.h>
 #include <linux/sched/task.h>
 #include <linux/vmalloc.h>
+#include <linux/moduleloader.h>
 #include <asm/pgalloc.h>
 #include <asm/code-patching.h>
 #include <mm/mmu_decl.h>
-- 
2.20.1

