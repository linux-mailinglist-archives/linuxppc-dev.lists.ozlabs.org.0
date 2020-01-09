Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE6D135398
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jan 2020 08:15:35 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47tcpD3YmXzDqBG
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jan 2020 18:15:32 +1100 (AEDT)
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
 header.s=google header.b=pDcMswX2; dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47tcf54w65zDqWs
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jan 2020 18:08:29 +1100 (AEDT)
Received: by mail-pl1-x643.google.com with SMTP id p27so2172667pli.10
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 Jan 2020 23:08:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2sxbAlXpABK/W64yfjeUTt7MDV8jfwT8E3maFR+CaL8=;
 b=pDcMswX2WqLuZ2zwtGNOX8ZMSnngOYELKXS2rxZtVn2Hc7xWg66Hj5z15rqh53IES9
 o+F/RvS9jzIeAGvcVkvywdpJF6qGZZY3AO4H6XlhPLZt4Lb11wRasFUfONJEfbCg/DRL
 B9pVhEjhJZcdZlwBqFEQch+Xg35ywvGnsJSZk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2sxbAlXpABK/W64yfjeUTt7MDV8jfwT8E3maFR+CaL8=;
 b=cevhOerGuvLNdzX7ZqWKtLoQdmcntVFagiL1Ac17MXqx2eAe+HrPjMsMTTgBWm5Xuu
 sD2/PpZTq0TlmiNW6LpZ5u7LeXUZPpoShwR46y/Cjk4Ud9A9CWzFzmv/2ox9HaIqs1Nc
 ls6UrAfBxgFkKvWmDHiGYu7lvcegCk6TLEMs+kH7AG8v8tufOr5+IrT0WF362yexz7Ci
 /NtURBeyEnqmQwMk482YgXlYEQ6eYCXzVEIqsDSnE25p6Fa68UtuoqBM5WyEONJCtO+v
 f81V+XGNSVxOJyOxNbKAWz/UXwzCrWg1fMZ64U5EjcUZjjj5DrbY5iXls/R3oghyd+Rb
 aOPQ==
X-Gm-Message-State: APjAAAXaZ4LfBlMLBkUBW/SgEECt/pLWFfnKooruoJbfdn1ZJxw/y4rQ
 0QKBAVh5dfIggw3DqtpG0dHW7g==
X-Google-Smtp-Source: APXvYqywxIqFoOPGMvB9RVsdlu3xJm9YODiUa7+jEutjKdj6cX8j6hc+1jzmzD4D81WIsNdHfBK2iw==
X-Received: by 2002:a17:902:788d:: with SMTP id
 q13mr9716939pll.210.1578553705849; 
 Wed, 08 Jan 2020 23:08:25 -0800 (PST)
Received: from localhost
 (2001-44b8-1113-6700-5cb3-ebc3-7dc6-a17b.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:5cb3:ebc3:7dc6:a17b])
 by smtp.gmail.com with ESMTPSA id 3sm6228356pfi.13.2020.01.08.23.08.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2020 23:08:25 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, kasan-dev@googlegroups.com,
 christophe.leroy@c-s.fr, aneesh.kumar@linux.ibm.com, bsingharora@gmail.com
Subject: [PATCH v5 2/4] kasan: Document support on 32-bit powerpc
Date: Thu,  9 Jan 2020 18:08:09 +1100
Message-Id: <20200109070811.31169-3-dja@axtens.net>
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

KASAN is supported on 32-bit powerpc and the docs should reflect this.

Suggested-by: Christophe Leroy <christophe.leroy@c-s.fr>
Reviewed-by: Christophe Leroy <christophe.leroy@c-s.fr>
Signed-off-by: Daniel Axtens <dja@axtens.net>
---
 Documentation/dev-tools/kasan.rst |  3 ++-
 Documentation/powerpc/kasan.txt   | 12 ++++++++++++
 2 files changed, 14 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/powerpc/kasan.txt

diff --git a/Documentation/dev-tools/kasan.rst b/Documentation/dev-tools/kasan.rst
index e4d66e7c50de..4af2b5d2c9b4 100644
--- a/Documentation/dev-tools/kasan.rst
+++ b/Documentation/dev-tools/kasan.rst
@@ -22,7 +22,8 @@ global variables yet.
 Tag-based KASAN is only supported in Clang and requires version 7.0.0 or later.
 
 Currently generic KASAN is supported for the x86_64, arm64, xtensa and s390
-architectures, and tag-based KASAN is supported only for arm64.
+architectures. It is also supported on 32-bit powerpc kernels. Tag-based KASAN
+is supported only on arm64.
 
 Usage
 -----
diff --git a/Documentation/powerpc/kasan.txt b/Documentation/powerpc/kasan.txt
new file mode 100644
index 000000000000..a85ce2ff8244
--- /dev/null
+++ b/Documentation/powerpc/kasan.txt
@@ -0,0 +1,12 @@
+KASAN is supported on powerpc on 32-bit only.
+
+32 bit support
+==============
+
+KASAN is supported on both hash and nohash MMUs on 32-bit.
+
+The shadow area sits at the top of the kernel virtual memory space above the
+fixmap area and occupies one eighth of the total kernel virtual memory space.
+
+Instrumentation of the vmalloc area is not currently supported, but modules
+are.
-- 
2.20.1

