Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E977B3A3F3D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Jun 2021 11:41:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G1bSW336kz3c75
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Jun 2021 19:40:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Xfy2NCml;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031;
 helo=mail-pj1-x1031.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Xfy2NCml; dkim-atps=neutral
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G1bRd5pzjz3033
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Jun 2021 19:40:13 +1000 (AEST)
Received: by mail-pj1-x1031.google.com with SMTP id ei4so5387630pjb.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Jun 2021 02:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UiYyysxa8FbFF88sTCEIkeBaA7xaRxxxp+zb2ITpl2I=;
 b=Xfy2NCmlQagBB4n6bBcPNqLaKviq5lRJ1kUfKGah73ftrEFPh5D85RXIF/OvimJGPD
 PZ8VumOFGfz8OIWPy2i/HzWQcXrqmnAOPP7Pjlbj8xtmc0c/FH+jO4xCoFQBRbN3pdgK
 O2s6PnRJo1C/jAENvYdDS+mOWTzR/jwqtgoJ3ElX9WYxw2z6TFhIL4GNIVBSZ1ZfV3ea
 4bUxYzlqlAOWCsKh+dd/N6Y0acvPTRsXAWOpZcYyug8IV8d2p7LXBvhqBszbNzTwyk9C
 XQ/KovmpBaO6xHlfNp1gLn309TDgrV5sN3hVVBYKVptr7jV9hbewLhXx+VovYKhUWmNS
 d4Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UiYyysxa8FbFF88sTCEIkeBaA7xaRxxxp+zb2ITpl2I=;
 b=ewjMQ4PG/ZWsUY5c1RMKZJ29Bol1R5pajw4V9f4S18xioW6PhA52X+CYhB0JDlmq2V
 ZcDaBisqPSarJaiOJaDAaVnQRk0QWY3WkU/pLb+IotS6gs3Szw9ntUqbI2P0eBFFAeqU
 FCZBiZ7kvDV5TQZm/MOa4e7RHeXg+WB4tELxPEGC+IdtZeMgfMXPMq96A+AUjzUMmt6k
 6lHesmy3JJajwLz/BamdGQ2lF6G15WGdbXwgA/y+RYBURMfnZ3SI0czxkfengrI/euMS
 aScHB3W5fipic9/CugZHGoUqMRE89zF1LnnSld+CuF0bMv1lF3nT17b56SEe4FbyIICa
 YQZg==
X-Gm-Message-State: AOAM533r6lF4XcodhBbnTDzPiZEUciDi6eciw8UZkxD3SYNIJGu+e5os
 LxpArqstuwlRroN5YznLVLMJZXTOXck=
X-Google-Smtp-Source: ABdhPJwk6CVhwcQCCU3mNV8l1fIG+6nd8MCmX5/fhcDWE6sVG26WI4YDz1YS20xV//UgCqgQhqpz3A==
X-Received: by 2002:a17:902:ee8c:b029:fe:dc5f:564 with SMTP id
 a12-20020a170902ee8cb02900fedc5f0564mr3181764pld.71.1623404409647; 
 Fri, 11 Jun 2021 02:40:09 -0700 (PDT)
Received: from bobo.ibm.com (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id o139sm4981655pfd.96.2021.06.11.02.40.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 02:40:09 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 1/2] module: add elf_check_module_arch for module specific
 elf arch checks
Date: Fri, 11 Jun 2021 19:39:58 +1000
Message-Id: <20210611093959.821525-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210611093959.821525-1-npiggin@gmail.com>
References: <20210611093959.821525-1-npiggin@gmail.com>
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
Cc: =?UTF-8?q?Michal=20Such=C3=A1nek?= <msuchanek@suse.de>,
 linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 Jessica Yu <jeyu@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The elf_check_arch() function is used to test usermode binaries, but
kernel modules may have more specific requirements. powerpc would like
to test for ABI version compatibility.

Add an arch-overridable function elf_check_module_arch() that defaults
to elf_check_arch() and use it in elf_validity_check().

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
[np: split patch, added changelog]
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 include/linux/moduleloader.h | 5 +++++
 kernel/module.c              | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/include/linux/moduleloader.h b/include/linux/moduleloader.h
index 9e09d11ffe5b..fdc042a84562 100644
--- a/include/linux/moduleloader.h
+++ b/include/linux/moduleloader.h
@@ -13,6 +13,11 @@
  * must be implemented by each architecture.
  */
 
+// Allow arch to optionally do additional checking of module ELF header
+#ifndef elf_check_module_arch
+#define elf_check_module_arch elf_check_arch
+#endif
+
 /* Adjust arch-specific sections.  Return 0 on success.  */
 int module_frob_arch_sections(Elf_Ehdr *hdr,
 			      Elf_Shdr *sechdrs,
diff --git a/kernel/module.c b/kernel/module.c
index 7e78dfabca97..7c3f9b7478dc 100644
--- a/kernel/module.c
+++ b/kernel/module.c
@@ -2946,7 +2946,7 @@ static int elf_validity_check(struct load_info *info)
 
 	if (memcmp(info->hdr->e_ident, ELFMAG, SELFMAG) != 0
 	    || info->hdr->e_type != ET_REL
-	    || !elf_check_arch(info->hdr)
+	    || !elf_check_module_arch(info->hdr)
 	    || info->hdr->e_shentsize != sizeof(Elf_Shdr))
 		return -ENOEXEC;
 
-- 
2.23.0

