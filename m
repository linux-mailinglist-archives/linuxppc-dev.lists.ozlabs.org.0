Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 21EE92756E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2019 07:23:50 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 458dFv33zgzDqTs
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2019 15:23:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=axtens.net
 (client-ip=2607:f8b0:4864:20::642; helo=mail-pl1-x642.google.com;
 envelope-from=dja@axtens.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="XTURjqfJ"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 458dCK1bM1zDqRZ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 May 2019 15:21:32 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id g69so2183169plb.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 May 2019 22:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5ekkHWOem4di90lP6xcBDLaMXB0oWvbPWZ8H23b29xk=;
 b=XTURjqfJ3TPJtSpCmAY60c7piPxDfrKSR06Yr3sPjHyEe6er7sQLU6GS+OiLxAnhgU
 94bAuhLe76WLAXqmmRAOL8ZVKZW+DF5UmxWC9d0drBPpEYTqXM37nXG9nP4LT3+E8Hsz
 IrzBEtaqllJX8tTy4EKRh51e+ayYXhC863cYM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5ekkHWOem4di90lP6xcBDLaMXB0oWvbPWZ8H23b29xk=;
 b=KHraIQSsFwJRTwcEBfJlZr+AezaTKPo/3yaLzSiJZsGHrBecz3yzQmN2GLVdDZLLhK
 gBUTv7svEFgzS8cPb8mgHgBtKyt97kwuno9uZkijUU531hC+pWtSANR6ksBISg6vSyLs
 50990qnFWk0rw4C3BU13048hlVXyMJEuUcxnxFfx9ZYgr8bUgMonedxkr5TBzredGfn6
 C8XAwf5kPwn8hkNfkZaEsKgxk5t9xdACjQ4jNK1qe89HwISf2GDG0WeDK4Ux/gsH9coy
 PtyGDEFTHmwrPu+dah81VO9sb2R36SW/40Dkt9Yi95wJnma/Q/CuCyRzPJfcwJrJbJr4
 ZnYQ==
X-Gm-Message-State: APjAAAUjAiZqXeA+8nKFjwWX1gEmH+mKi8F70047I+1c2wfxLqtQHhLu
 P3mOh1H0cVsrpBUwg+fgAIZoog==
X-Google-Smtp-Source: APXvYqzqbuPYJXogdGhHhYoHpKwDd5oSUWobcj7pw0+4fw2ONNZSt7Sfjnr8pBPiT19ux7lbXKhJlg==
X-Received: by 2002:a17:902:b191:: with SMTP id
 s17mr72951266plr.262.1558588891187; 
 Wed, 22 May 2019 22:21:31 -0700 (PDT)
Received: from localhost (ppp167-251-205.static.internode.on.net.
 [59.167.251.205])
 by smtp.gmail.com with ESMTPSA id l7sm29300717pfl.9.2019.05.22.22.21.29
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 22 May 2019 22:21:30 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: aneesh.kumar@linux.ibm.com, christophe.leroy@c-s.fr, bsingharora@gmail.com
Subject: [RFC PATCH 1/7] kasan: do not open-code addr_has_shadow
Date: Thu, 23 May 2019 15:21:14 +1000
Message-Id: <20190523052120.18459-2-dja@axtens.net>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190523052120.18459-1-dja@axtens.net>
References: <20190523052120.18459-1-dja@axtens.net>
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
Cc: linuxppc-dev@lists.ozlabs.org, kasan-dev@googlegroups.com,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We have a couple of places checking for the existence of a shadow
mapping for an address by open-coding the inverse of the check in
addr_has_shadow.

Replace the open-coded versions with the helper. This will be
needed in future to allow architectures to override the layout
of the shadow mapping.

Reviewed-by: Andrew Donnellan <andrew.donnellan@au1.ibm.com>
Reviewed-by: Dmitry Vyukov <dvyukov@google.com>
Signed-off-by: Daniel Axtens <dja@axtens.net>
Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 mm/kasan/generic.c | 3 +--
 mm/kasan/tags.c    | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/mm/kasan/generic.c b/mm/kasan/generic.c
index 504c79363a34..9e5c989dab8c 100644
--- a/mm/kasan/generic.c
+++ b/mm/kasan/generic.c
@@ -173,8 +173,7 @@ static __always_inline void check_memory_region_inline(unsigned long addr,
 	if (unlikely(size == 0))
 		return;
 
-	if (unlikely((void *)addr <
-		kasan_shadow_to_mem((void *)KASAN_SHADOW_START))) {
+	if (unlikely(!addr_has_shadow((void *)addr))) {
 		kasan_report(addr, size, write, ret_ip);
 		return;
 	}
diff --git a/mm/kasan/tags.c b/mm/kasan/tags.c
index 63fca3172659..87ebee0a6aea 100644
--- a/mm/kasan/tags.c
+++ b/mm/kasan/tags.c
@@ -109,8 +109,7 @@ void check_memory_region(unsigned long addr, size_t size, bool write,
 		return;
 
 	untagged_addr = reset_tag((const void *)addr);
-	if (unlikely(untagged_addr <
-			kasan_shadow_to_mem((void *)KASAN_SHADOW_START))) {
+	if (unlikely(!addr_has_shadow(untagged_addr))) {
 		kasan_report(addr, size, write, ret_ip);
 		return;
 	}
-- 
2.19.1

