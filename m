Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FB063A07D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Nov 2022 05:18:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NLBzV0GZyz3f6V
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Nov 2022 15:18:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=npDM7XRV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=npDM7XRV;
	dkim-atps=neutral
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NLBwb2Xhbz3cL1
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Nov 2022 15:15:59 +1100 (AEDT)
Received: by mail-pj1-x1033.google.com with SMTP id 3-20020a17090a098300b00219041dcbe9so7892818pjo.3
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Nov 2022 20:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a7R9heIoAg42vgnWEBRYpJlNY18RAwQzKTaUAUkLcfg=;
        b=npDM7XRVYF8htHZG1hHMVYU6dbZokUzEHgDICho41UI7ruvizp8f5hWtlEupd95SMt
         XuXumM5OHkF/8ShVGEfDbhjS0s1r/BmJVwILKP13k0WCcez+pD8nmKZvm+3o+jZ6TVSV
         GIjsVf6tTEcw/P1yVt4f0j7PYRulu0a/6JJYPv0JiNH5hlFCZ9bjeNVHo7H1WY5AmjlC
         DfsA8MoCuk6kWG1ONRlC1ibTsRyQ9v97I3izrQhwytvGsMBG5f709C5FaaRa84HMRKMH
         ku2pe6sQ+Shf+3FYS9ktwK5hOioqrtvoyeCxf4F/R8cszxtqbti+0swV17RIXEPtbmfm
         wdMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a7R9heIoAg42vgnWEBRYpJlNY18RAwQzKTaUAUkLcfg=;
        b=piy9cBVYer+7qsYoOjv/CiqLtCOil4l26pdzuJza7J2exOfTFDFbv33MH2SgSKUpyV
         CqDyrlDNx5d2UORlt7QdAPFH97O7lh97ZKcu43fY24xZ7UguPXmlKBIoFIwR/y47bK2G
         diABX/Ij2mvrRnYLzsieNrXDNnQIFeHiZYRrl/7tcPTgdO4ECtJUMsu7Hql7MNT1LouP
         4lbcW8idJiDlnRo9rv7P+OUBDhH/kLkZTH81B3NeN/7njCrlEHY3J2OBEfKB0Sg/Gspr
         B8RnZWohaLgkldOCXz6A1FmdaVDXBdLwU7ly+1P62EP0G+UOI2v4m81K8K2YDDexrBU/
         5B6Q==
X-Gm-Message-State: ANoB5pkyGn0f2NGtetiK81JK/IYEch3kwNMBjFelMRH+eRUuJuTdIc6k
	6zogGMUr0XiLQmGcuDb5ZB4eG2tvJS4=
X-Google-Smtp-Source: AA0mqf5ld6vlEQt9yisUzJ+hVwunoUL0MM0ltj7rnkorwWz9iBCJwQtFUyRTib6MgmwFZT3d6NTDoQ==
X-Received: by 2002:a17:902:e80f:b0:186:f4ba:a817 with SMTP id u15-20020a170902e80f00b00186f4baa817mr35546670plg.97.1669608951177;
        Sun, 27 Nov 2022 20:15:51 -0800 (PST)
Received: from bobo.ozlabs.ibm.com ([220.240.231.60])
        by smtp.gmail.com with ESMTPSA id y28-20020aa79afc000000b0057489a78979sm6905670pfp.21.2022.11.27.20.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Nov 2022 20:15:50 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 1/4] module: add module_elf_check_arch for module-specific checks
Date: Mon, 28 Nov 2022 14:15:36 +1000
Message-Id: <20221128041539.1742489-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221128041539.1742489-1-npiggin@gmail.com>
References: <20221128041539.1742489-1-npiggin@gmail.com>
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
Cc: Luis Chamberlain <mcgrof@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Jessica Yu <jeyu@kernel.org>, =?UTF-8?q?Michal=20Such=C3=A1nek?= <msuchanek@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The elf_check_arch() function is also used to test compatibility of
usermode binaries. Kernel modules may have more specific requirements,
for example powerpc would like to test for ABI version compatibility.

Add a weak module_elf_check_arch() that defaults to true, and call it
from elf_validity_check().

Cc: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Jessica Yu <jeyu@kernel.org>
[np: added changelog, adjust name, rebase]
Acked-by: Luis Chamberlain <mcgrof@kernel.org>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 include/linux/moduleloader.h |  3 +++
 kernel/module/main.c         | 10 ++++++++++
 2 files changed, 13 insertions(+)

diff --git a/include/linux/moduleloader.h b/include/linux/moduleloader.h
index 9e09d11ffe5b..7b4587a19189 100644
--- a/include/linux/moduleloader.h
+++ b/include/linux/moduleloader.h
@@ -13,6 +13,9 @@
  * must be implemented by each architecture.
  */
 
+/* arch may override to do additional checking of ELF header architecture */
+bool module_elf_check_arch(Elf_Ehdr *hdr);
+
 /* Adjust arch-specific sections.  Return 0 on success.  */
 int module_frob_arch_sections(Elf_Ehdr *hdr,
 			      Elf_Shdr *sechdrs,
diff --git a/kernel/module/main.c b/kernel/module/main.c
index d02d39c7174e..7b3f6fb0d428 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -1674,6 +1674,11 @@ static int elf_validity_check(struct load_info *info)
 		       info->hdr->e_machine);
 		goto no_exec;
 	}
+	if (!module_elf_check_arch(info->hdr)) {
+		pr_err("Invalid module architecture in ELF header: %u\n",
+		       info->hdr->e_machine);
+		goto no_exec;
+	}
 	if (info->hdr->e_shentsize != sizeof(Elf_Shdr)) {
 		pr_err("Invalid ELF section header size\n");
 		goto no_exec;
@@ -2247,6 +2252,11 @@ static void flush_module_icache(const struct module *mod)
 			   (unsigned long)mod->core_layout.base + mod->core_layout.size);
 }
 
+bool __weak module_elf_check_arch(Elf_Ehdr *hdr)
+{
+	return true;
+}
+
 int __weak module_frob_arch_sections(Elf_Ehdr *hdr,
 				     Elf_Shdr *sechdrs,
 				     char *secstrings,
-- 
2.37.2

