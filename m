Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E5CAA1258C4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Dec 2019 01:43:29 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47dY5V52F0zDql2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Dec 2019 11:43:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="CuenhOgJ"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47dXxq40yczDqkf
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Dec 2019 11:36:47 +1100 (AEDT)
Received: by mail-pf1-x442.google.com with SMTP id 195so1287475pfw.11
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Dec 2019 16:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2sxbAlXpABK/W64yfjeUTt7MDV8jfwT8E3maFR+CaL8=;
 b=CuenhOgJpQr2nu4AdM2tW86k5v6/hCnF0GhwIuOz0ouFzJzdbtXuJyD22YYHOifcsJ
 9W5/842eIyhsVN7iaHJG1xs6VB1GSSQxmEgwvBfOXay9yRhrOifUNgCwX4EgHgcQ8jkh
 NqI+TkWQOjH0NbVXQy47gLC+t5Dz4QizhrJQU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2sxbAlXpABK/W64yfjeUTt7MDV8jfwT8E3maFR+CaL8=;
 b=peX5Q37DYNHM8TDqJz5ogFRSeKnapV3555D/hNtddBx2Mkdgh+Ls8qvFAMGW0+H8CK
 VLFjPqaziSzwL2MVqsMIZJ2IAO9uexkB+f0ndOPYz3EoV+t9AJ1aNEWegh4q/W7J6PM6
 9OozoWupmDswrQ84+hVYNdJQaczetB9X0qZGpVuqFi1dP87SUlYTuVZI169xWN48SomS
 7njv5p2Ama7U+xF7iWqxk9c5827bjmqvU3aZ5VCFheYkk97/XVyjd70joc+LkwePuShq
 rBeb8xpQK5knVvLGnD2dGcxdQoYdjF3BZXRM+S4Tg1kxkF7O8qiXrQt1jp+ZYsQ9kMFu
 lCGQ==
X-Gm-Message-State: APjAAAW2x0JO1DmRQoDWjPX93rAWRZHl2i9t1n4hzAmBs2gMs6GY8vMh
 bn9fHxBJ3DRzZV2hKkgIzHDYCQ==
X-Google-Smtp-Source: APXvYqznKl2qHe3h4t5NRUXtsuhY81bvYVDUMuRyRmPbFQfp/C8Q/PeVNQDr7G+aIxQpiuIiwvtwVw==
X-Received: by 2002:a63:1447:: with SMTP id 7mr6070116pgu.22.1576715805301;
 Wed, 18 Dec 2019 16:36:45 -0800 (PST)
Received: from localhost
 (2001-44b8-111e-5c00-b05d-cbfe-b2ee-de17.static.ipv6.internode.on.net.
 [2001:44b8:111e:5c00:b05d:cbfe:b2ee:de17])
 by smtp.gmail.com with ESMTPSA id e16sm4799301pff.181.2019.12.18.16.36.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2019 16:36:44 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, kasan-dev@googlegroups.com,
 christophe.leroy@c-s.fr, aneesh.kumar@linux.ibm.com, bsingharora@gmail.com
Subject: [PATCH v4 2/4] kasan: Document support on 32-bit powerpc
Date: Thu, 19 Dec 2019 11:36:28 +1100
Message-Id: <20191219003630.31288-3-dja@axtens.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191219003630.31288-1-dja@axtens.net>
References: <20191219003630.31288-1-dja@axtens.net>
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

