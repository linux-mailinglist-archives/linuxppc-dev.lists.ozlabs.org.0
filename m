Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2AC117F3E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Dec 2019 05:55:39 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47X76c3ZJDzDqSB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Dec 2019 15:55:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="WI2BC14z"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47X6xY58ypzDqTp
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Dec 2019 15:47:45 +1100 (AEDT)
Received: by mail-pf1-x441.google.com with SMTP id h14so8390191pfe.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Dec 2019 20:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EiQDn6/0oRuwTLnfNvzdiHGZKSMrLbDZhPom2rMZn7o=;
 b=WI2BC14zZiQ98S0DzLqneHxoV18dt5gpqrlVywoE5oHdg5Nlck/8qvJGmFxuUzZ160
 kjo1gTrn0FS/5oKF8n1ZyXpA2/u2Ffzxnhl4fBdAsjpQ5rGl9rvtZ7NjL/26AIget8jj
 UTKZNquTzxwyrmTm1IXBllkukRs5NwAkynJ+A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EiQDn6/0oRuwTLnfNvzdiHGZKSMrLbDZhPom2rMZn7o=;
 b=NoatugfoDckhO8KoOgXbHe8ZqGI5O3lXnUXkZLMJZRrS4c1ETuBR9iyVkgKlwnxB9r
 tc3F9B1VLfGSNMi0U7z5fWGQt/i/rSf/LMv5jtF9+f7POrGfLjIuZV2c2ZMXem8woXaR
 wGzFRE1voduFkiSCWpZIS5O9cZj2p56GRiKdc5BQ1NKvpDS7eWcZNajruZVgxcUal7vn
 VNb96emIH+/DxHF0wqUWhLybaCC3QMp4SEpdkIShI6p/CaJF1+2nWdb5TFfWT+xGoKHI
 9M+Ls90PiRL/LJbMZ9BqtYKIQJaiNJ1Am1lDaTfyWLojguKYJI8a256bjPjaLWW5Lnm4
 4JeA==
X-Gm-Message-State: APjAAAWu2tCwgEyRXmZuUdBNjUbMsBNPlQX0zRTuvhZh4NmvN/aIkAhS
 7ZqlxO7Gc7z4mgr/S2dnkU3DJw==
X-Google-Smtp-Source: APXvYqwENZz+Juyen/2aq5gIiV77utFbr37CGrm9NGV3YB5/lvZeMjOVCPCut/3HTEKuNdLqG8oHmw==
X-Received: by 2002:a63:5d03:: with SMTP id r3mr22623144pgb.306.1575953263265; 
 Mon, 09 Dec 2019 20:47:43 -0800 (PST)
Received: from localhost
 (2001-44b8-1113-6700-e460-0b66-7007-c654.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:e460:b66:7007:c654])
 by smtp.gmail.com with ESMTPSA id r6sm1166225pfh.91.2019.12.09.20.47.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2019 20:47:42 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kasan-dev@googlegroups.com,
 christophe.leroy@c-s.fr, aneesh.kumar@linux.ibm.com, bsingharora@gmail.com
Subject: [PATCH v2 3/4] kasan: Document support on 32-bit powerpc
Date: Tue, 10 Dec 2019 15:47:13 +1100
Message-Id: <20191210044714.27265-4-dja@axtens.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191210044714.27265-1-dja@axtens.net>
References: <20191210044714.27265-1-dja@axtens.net>
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

