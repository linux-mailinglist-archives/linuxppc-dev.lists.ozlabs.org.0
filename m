Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B8030DC2D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 15:07:32 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DW3R274mJzF4RG
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 01:07:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::429;
 helo=mail-pf1-x429.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=HGv0pMdL; dkim-atps=neutral
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DW0cF6lmbzDxTP
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Feb 2021 23:00:13 +1100 (AEDT)
Received: by mail-pf1-x429.google.com with SMTP id f63so16485092pfa.13
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Feb 2021 04:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qiaBVEZpA8Xo3CJyOAtaUaP2kzBvWdhYRuLo/mSWVKU=;
 b=HGv0pMdLzfcs9yqvkpK455qLVU8no2RvlmsDHwHuIvCfo5lqmg0y+tjFQR1wreuHHz
 BH+ZoqGxgZ3jJ82CX0cgyLetkWii90iNoED1V5dLaXxaQgTOLKqdeQjUNUC0q8T5DlWx
 lP6Do60cMbZ+X7p/O4Zbeh5ABfjzvqaNzH8z4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qiaBVEZpA8Xo3CJyOAtaUaP2kzBvWdhYRuLo/mSWVKU=;
 b=azRiO1HGliNG6EoUkZcjvt3pjdPaI8IOrAWt0GlR73GztXXAbJ6uluSwXHULqyB29p
 qVB+myPZ4lQVO0ZFADOBKUsMaJXyZYKtOcqLk312gYWLk7T/gdZQYwrS3kiI5iiszpW5
 GTSlOIVr/6cErOntk7W41la7SuEilfw1Rhvuu901KC8RzN26uYwwugmDJr9lVRjHGM9l
 Z+kaG/kiA1RoUaJz6IEZO0glEpYommG+N2uk75ZUWaHIxoaJSxv4S6lcrfsB3wF/K7CN
 4E8J4V4HGk/6COb4GtDQmwa2s+UWAQ+MaH0ve48CL57b0uQfK93n+QLcszXiPBrFOQ6l
 Vc5g==
X-Gm-Message-State: AOAM533qFfDCiSz1N6roMNBqf6mJdYi57Qrg8Xvx2a3hhE1JWpggLIGd
 4VxNdBLXRX1wmV36Pb4N0xdYXg==
X-Google-Smtp-Source: ABdhPJxFJ1tYSDB+nz4ocsXdc7DktJwVnAnbesODItHndkApfUngNGp46fA2hgEkXUBdkDxJapmh6w==
X-Received: by 2002:a65:408c:: with SMTP id t12mr3287866pgp.157.1612353610461; 
 Wed, 03 Feb 2021 04:00:10 -0800 (PST)
Received: from localhost
 (2001-44b8-1113-6700-1c59-4eca-f876-fd51.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:1c59:4eca:f876:fd51])
 by smtp.gmail.com with ESMTPSA id a19sm2226291pfg.75.2021.02.03.04.00.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 04:00:10 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, kasan-dev@googlegroups.com,
 christophe.leroy@csgroup.eu, aneesh.kumar@linux.ibm.com,
 bsingharora@gmail.com
Subject: [PATCH v10 4/6] kasan: Document support on 32-bit powerpc
Date: Wed,  3 Feb 2021 22:59:44 +1100
Message-Id: <20210203115946.663273-5-dja@axtens.net>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210203115946.663273-1-dja@axtens.net>
References: <20210203115946.663273-1-dja@axtens.net>
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

Document s390 support while we're at it.

Suggested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Daniel Axtens <dja@axtens.net>
---
 Documentation/dev-tools/kasan.rst |  7 +++++--
 Documentation/powerpc/kasan.txt   | 12 ++++++++++++
 2 files changed, 17 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/powerpc/kasan.txt

diff --git a/Documentation/dev-tools/kasan.rst b/Documentation/dev-tools/kasan.rst
index e022b7506e37..9cfc116cc6bf 100644
--- a/Documentation/dev-tools/kasan.rst
+++ b/Documentation/dev-tools/kasan.rst
@@ -22,7 +22,8 @@ out-of-bounds accesses for global variables is only supported since Clang 11.
 Tag-based KASAN is only supported in Clang.
 
 Currently generic KASAN is supported for the x86_64, arm, arm64, xtensa, s390
-and riscv architectures, and tag-based KASAN modes are supported only for arm64.
+and riscv architectures. It is also supported on 32-bit powerpc kernels.
+Tag-based KASAN modes are supported only for arm64.
 
 Usage
 -----
@@ -332,7 +333,9 @@ CONFIG_KASAN_VMALLOC
 ~~~~~~~~~~~~~~~~~~~~
 
 With ``CONFIG_KASAN_VMALLOC``, KASAN can cover vmalloc space at the
-cost of greater memory usage. Currently this is only supported on x86.
+cost of greater memory usage. Currently this supported on x86, s390
+and 32-bit powerpc. It is optional, except on 32-bit powerpc kernels
+with module support, where it is required.
 
 This works by hooking into vmalloc and vmap, and dynamically
 allocating real shadow memory to back the mappings.
diff --git a/Documentation/powerpc/kasan.txt b/Documentation/powerpc/kasan.txt
new file mode 100644
index 000000000000..26bb0e8bb18c
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
+Instrumentation of the vmalloc area is optional, unless built with modules,
+in which case it is required.
-- 
2.27.0

