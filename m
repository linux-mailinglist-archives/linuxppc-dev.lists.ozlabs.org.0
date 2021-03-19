Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C8046341FE5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Mar 2021 15:43:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F268L41HHz3dFx
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Mar 2021 01:43:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=Pp9i5eXC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::533;
 helo=mail-pg1-x533.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=Pp9i5eXC; dkim-atps=neutral
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F265y6x6zz3c1H
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Mar 2021 01:41:26 +1100 (AEDT)
Received: by mail-pg1-x533.google.com with SMTP id k24so3815170pgl.6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Mar 2021 07:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Yq2AQYTBwcMSkk50BfF3YUyk3WvoM0RKP8OIdZyLogM=;
 b=Pp9i5eXC89dTj73yMTNviANChtWGzOSQPPxpjROOV89DC1cJKniL80efegMN8c7zDo
 9JJVgrSAKabRDXm4ek/m0QR+cyxgSxOWNBnNYM+IqArsCERQHHAffp743QYuXRubCqJF
 KKJLKzUVNz29+1H/1okUU2NrfLm97jZ1fhxQg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Yq2AQYTBwcMSkk50BfF3YUyk3WvoM0RKP8OIdZyLogM=;
 b=qMjCCKf6cT4JHK6VtIUG5RED0z06oJIk9zU8HcGTd5dHO2c6huD1IxQ4meZGZHmrB1
 3pyHmjHQGft1aS5H9iMnsDIy/zw3A7RvcmqyYfqy6SUEa1CtxEBlztaLlGvOHNcXDegq
 mSAyQmr+Eqee94ln1mUrTaSio4wHq0xT8I5U244CAlk7i+9EFRrz77J73z5cGvFcKlLO
 O+NOSLIZIZs+Mnhh9g2DgUBGdKWJcHl2ckBrvS56mEArLWxcFKZw7GaIfMVxsy+Lcq8f
 VLvzpHZ5PdQqtj3N+fkSSxy2mJ/cE0HmbVcTk5sxRxqaM1m+B1dYEztJHR/EN0QnA18A
 UQgg==
X-Gm-Message-State: AOAM533S9DkbvgqE05zt7Y85jvMSJv/thFz9A6YK59nM5j+JE+Dt+4UB
 /ExcBhRcbYIZFuh3HneztDW+yw==
X-Google-Smtp-Source: ABdhPJzJzQ0B+ewWNBZMSXaoPb9f+KSB83OXkB72IsMoCXTL5bjXzymNNUc5j/qLGRplb0QmcZE4jQ==
X-Received: by 2002:aa7:92c7:0:b029:1ee:75b2:2dab with SMTP id
 k7-20020aa792c70000b02901ee75b22dabmr9622789pfa.61.1616164884381; 
 Fri, 19 Mar 2021 07:41:24 -0700 (PDT)
Received: from localhost
 (2001-44b8-111e-5c00-674e-5c6f-efc9-136d.static.ipv6.internode.on.net.
 [2001:44b8:111e:5c00:674e:5c6f:efc9:136d])
 by smtp.gmail.com with ESMTPSA id y29sm6058594pfp.206.2021.03.19.07.41.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 07:41:24 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, kasan-dev@googlegroups.com,
 christophe.leroy@csgroup.eu, aneesh.kumar@linux.ibm.com,
 bsingharora@gmail.com
Subject: [PATCH v11 5/6] powerpc/mm/kasan: rename kasan_init_32.c to init_32.c
Date: Sat, 20 Mar 2021 01:40:57 +1100
Message-Id: <20210319144058.772525-6-dja@axtens.net>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210319144058.772525-1-dja@axtens.net>
References: <20210319144058.772525-1-dja@axtens.net>
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

Suggested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
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
2.27.0

