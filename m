Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4821353A1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jan 2020 08:17:17 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47tcrB2szJzDqY6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jan 2020 18:17:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=TBrGHwgd; dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47tcf7492FzDqX9
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jan 2020 18:08:31 +1100 (AEDT)
Received: by mail-pl1-x644.google.com with SMTP id x17so2195648pln.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 Jan 2020 23:08:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jwvqhmbLPpvanCf4CYPj6H756JJZayFM0Q320MsSZZo=;
 b=TBrGHwgdiHUWcFzu5YWy2q+sBvAdh+cIpcnaPnFCmgw5aVB/ZjS6/zor5S/EXHzFEr
 wDya8GXeYBXfG6P/X2ma89hl/VywtdWGv25aTH8MdRCR5scwi5TKkHCADSFPVP/AHpvc
 O2u2y7VA5kPvTHcOc9AWdaIXo61AuIafawnq8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jwvqhmbLPpvanCf4CYPj6H756JJZayFM0Q320MsSZZo=;
 b=e91CvVMImuT4DzgDqofYkt/FRyc8E15Y2NGm2nJBcTogLP+ow/D/at+EyXVFvVMVhH
 sZjSGYvPx3MVzhbJNZuqa8pioLlEa7PK79w6aw9suqR8C7ZuLGusCotHVu8n2gzLIlaK
 nF5U0SlyVjEYAdREr2ctZGdsQ0+3e33eT3bMVAEqHP+Q4RkJlbyAirAQK+DeI/LUoJ87
 BxexcnPkAUDeOM8b+mbWLp5KdWEXg9Uzgcvy7w32ErKFV5VLR9pzzBYg7JVDZw5HfeZj
 CKSzDk+ywS9ZAiVDGNz4MLRobWEZPxEzmgzE5PYEH8DyvufWhGU6a3AC/tv1R/nhFZiE
 D8ag==
X-Gm-Message-State: APjAAAVhEDgPKhvu5mz7vJ1c7CGUKE2HzWzW8GULtifABaqnbK6Adg0B
 vbzU+zwQyFENi4Glj94EVM5REw==
X-Google-Smtp-Source: APXvYqwON3PZ7E29ypePrEmq0EIeeuv7pvxpkaaOGrcITDNPQdZ5KASM0AslhPi3zjBdfUq5zbE/Wg==
X-Received: by 2002:a17:90a:3643:: with SMTP id
 s61mr3623176pjb.44.1578553709799; 
 Wed, 08 Jan 2020 23:08:29 -0800 (PST)
Received: from localhost
 (2001-44b8-1113-6700-5cb3-ebc3-7dc6-a17b.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:5cb3:ebc3:7dc6:a17b])
 by smtp.gmail.com with ESMTPSA id e2sm6363942pfh.84.2020.01.08.23.08.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2020 23:08:29 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, kasan-dev@googlegroups.com,
 christophe.leroy@c-s.fr, aneesh.kumar@linux.ibm.com, bsingharora@gmail.com
Subject: [PATCH v5 3/4] powerpc/mm/kasan: rename kasan_init_32.c to init_32.c
Date: Thu,  9 Jan 2020 18:08:10 +1100
Message-Id: <20200109070811.31169-4-dja@axtens.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200109070811.31169-1-dja@axtens.net>
References: <20200109070811.31169-1-dja@axtens.net>
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
Cc: Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

kasan is already implied by the directory name, we don't need to
repeat it.

Suggested-by: Christophe Leroy <christophe.leroy@c-s.fr>
Signed-off-by: Daniel Axtens <dja@axtens.net>
---
 arch/powerpc/mm/kasan/Makefile                       | 2 +-
 arch/powerpc/mm/kasan/{kasan_init_32.c => init_32.c} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename arch/powerpc/mm/kasan/{kasan_init_32.c => init_32.c} (100%)

diff --git a/arch/powerpc/mm/kasan/Makefile b/arch/powerpc/mm/kasan/Makefile
index 6577897673dd..36a4e1b10b2d 100644
--- a/arch/powerpc/mm/kasan/Makefile
+++ b/arch/powerpc/mm/kasan/Makefile
@@ -2,4 +2,4 @@
 
 KASAN_SANITIZE := n
 
-obj-$(CONFIG_PPC32)           += kasan_init_32.o
+obj-$(CONFIG_PPC32)           += init_32.o
diff --git a/arch/powerpc/mm/kasan/kasan_init_32.c b/arch/powerpc/mm/kasan/init_32.c
similarity index 100%
rename from arch/powerpc/mm/kasan/kasan_init_32.c
rename to arch/powerpc/mm/kasan/init_32.c
-- 
2.20.1

