Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4092CA83F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Dec 2020 17:28:25 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ClnbB3xrlzDqQG
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Dec 2020 03:28:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=bNqGOi6P; dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ClnL46s72zDqXL
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Dec 2020 03:17:00 +1100 (AEDT)
Received: by mail-pl1-x643.google.com with SMTP id l11so1423430plt.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Dec 2020 08:17:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s2vaNiCstBIb+WWFV0QIyynMgzg46gv0imUofC6H27w=;
 b=bNqGOi6Pb8cXVBRjb+IHzu2v9idq3SGrmXDH6tXU2y92TwY8fPJFE/1ljNTHCmgNNb
 P3nAOxBHWfSpzgMF8QuWDIz6eBzz09+UB7Z0DKgwf6pu5PUdVu01EdDbfq2RWwCnfRwB
 69VVIgRLfSY3qVdtfWZEiLuOFVsDUxcn5N8KI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s2vaNiCstBIb+WWFV0QIyynMgzg46gv0imUofC6H27w=;
 b=QueSgxel4XQfQGYOR8M9AnCz824b3ucGPN+OGETcgo1Adr2XxZO5QBao3pPwQ4+9x7
 xRUBGKNQbbpDFowOtYQbCPFx1TlWdhCdG1kBKOnfeGAVpL8dChCYyiDVhohqRBZw4XHc
 j6pW3y0u+h6nGzLv2R/BcGuzy+Dl/3SoA3kHbLF6jcFEF4b3MB1WIehAy6VkyKRBIBJg
 FlDxIKhnID6kcY9UuF4kb23hhLXg/lyvNcql08Y+2I/4ADgEYg8GwkjAFFE36Lnu0O8c
 Pgtwn5PdYDPKKHLAvxOhtlBneMbK4LgIlkV/84XqE1+r0U5aXvn4tmUq8DzJSMFfhDh3
 pxsA==
X-Gm-Message-State: AOAM530+yeFyZtkXlt2pTbbEUcGmKwIm1hCaobolKMpP6N9irgmvtepE
 oralwDybb8tFc2XxOpxcalTEqw==
X-Google-Smtp-Source: ABdhPJwScxtBHY4y6Tf+/sQF0B387gZklp4alOnvPWLxpndNFLBZZOLN05k7yFY2t7oWsub/0S+/yg==
X-Received: by 2002:a17:902:6b84:b029:d8:d13d:14e with SMTP id
 p4-20020a1709026b84b02900d8d13d014emr3544651plk.29.1606839417392; 
 Tue, 01 Dec 2020 08:16:57 -0800 (PST)
Received: from localhost
 (2001-44b8-111e-5c00-f932-2db6-916f-25e2.static.ipv6.internode.on.net.
 [2001:44b8:111e:5c00:f932:2db6:916f:25e2])
 by smtp.gmail.com with ESMTPSA id y5sm220594pfl.114.2020.12.01.08.16.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Dec 2020 08:16:56 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, kasan-dev@googlegroups.com,
 christophe.leroy@c-s.fr, aneesh.kumar@linux.ibm.com, bsingharora@gmail.com
Subject: [PATCH v9 5/6] powerpc/mm/kasan: rename kasan_init_32.c to init_32.c
Date: Wed,  2 Dec 2020 03:16:31 +1100
Message-Id: <20201201161632.1234753-6-dja@axtens.net>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201201161632.1234753-1-dja@axtens.net>
References: <20201201161632.1234753-1-dja@axtens.net>
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
index bb1a5408b86b..42fb628a44fd 100644
--- a/arch/powerpc/mm/kasan/Makefile
+++ b/arch/powerpc/mm/kasan/Makefile
@@ -2,6 +2,6 @@
 
 KASAN_SANITIZE := n
 
-obj-$(CONFIG_PPC32)           += kasan_init_32.o
+obj-$(CONFIG_PPC32)           += init_32.o
 obj-$(CONFIG_PPC_8xx)		+= 8xx.o
 obj-$(CONFIG_PPC_BOOK3S_32)	+= book3s_32.o
diff --git a/arch/powerpc/mm/kasan/kasan_init_32.c b/arch/powerpc/mm/kasan/init_32.c
similarity index 100%
rename from arch/powerpc/mm/kasan/kasan_init_32.c
rename to arch/powerpc/mm/kasan/init_32.c
-- 
2.25.1

