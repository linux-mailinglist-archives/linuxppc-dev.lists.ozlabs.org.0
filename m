Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BEDE11D0E7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2019 16:23:57 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Ycyf3ghmzDr1Q
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2019 02:23:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="Oy/hnAfK"; 
 dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Ycpx48YHzDqkL
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2019 02:17:13 +1100 (AEDT)
Received: by mail-pj1-x1043.google.com with SMTP id l4so1158442pjt.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2019 07:17:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2sxbAlXpABK/W64yfjeUTt7MDV8jfwT8E3maFR+CaL8=;
 b=Oy/hnAfKot6VhCvK2GN/HZUavI/Bja8s76lKRFwKNBv0WIvnCj5sLr9ZUFoKKK76Dq
 AkA3a0Gw6AOkyVQzcYvoeV5MXxrSNx2unPqwyUoCbUMuiZl/g4FMJhMs0cyeCQ3Vydo+
 KwGV35RCEfpO49yPJJQpSRyKsjHcIIme8tAQQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2sxbAlXpABK/W64yfjeUTt7MDV8jfwT8E3maFR+CaL8=;
 b=r5LVc2X5zbjpqgE4A/fNVG1w/QRy81aLlRdf0egKedslFFi3OhlKwbU67+CNhPFfUG
 D9y9jMvulvQiwKLnWPLN6xKan1hYGV0TBKwfDpklG0e3HZDs9BzoklMPuMEN/vvujiDe
 kcTp471Z3YtLoanWbKHOFbBIje2fbpX03+Af00i1yciOM9ZzYzsJt5esMC5HuevWa+UV
 64IVz2HndeGhRTSUKFpAssiVy9J749SNPWeIkeANh96E+U3lBlYHNR2SImlvmLbPPMmE
 8rZgQAWbWSlm5mleMHBhaMYt1b87B+i0guXbwTWCdA6kxqQwPnYhyBhVEJrHufZUNP+R
 juVQ==
X-Gm-Message-State: APjAAAUPDS2gJauIEuC0Gw9zCTt0wj9E0pe/9SOYaThSOb5flpD5+z3o
 IdqLluTQWfIIkZMFXH0rJDLdpA==
X-Google-Smtp-Source: APXvYqzz48JuwP9N8SZ0OoCbH6UPHPyZNtr3T/0k0wqNH5ZMJMS9Q3ukSiv5ZYA0ARsYtgHZT5+GZQ==
X-Received: by 2002:a17:90a:8a98:: with SMTP id
 x24mr10744727pjn.113.1576163830706; 
 Thu, 12 Dec 2019 07:17:10 -0800 (PST)
Received: from localhost
 (2001-44b8-1113-6700-b116-2689-a4a9-76f8.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:b116:2689:a4a9:76f8])
 by smtp.gmail.com with ESMTPSA id j125sm7954574pfg.160.2019.12.12.07.17.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2019 07:17:09 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, kasan-dev@googlegroups.com,
 christophe.leroy@c-s.fr, aneesh.kumar@linux.ibm.com, bsingharora@gmail.com
Subject: [PATCH v3 2/3] kasan: Document support on 32-bit powerpc
Date: Fri, 13 Dec 2019 02:16:55 +1100
Message-Id: <20191212151656.26151-3-dja@axtens.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191212151656.26151-1-dja@axtens.net>
References: <20191212151656.26151-1-dja@axtens.net>
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

