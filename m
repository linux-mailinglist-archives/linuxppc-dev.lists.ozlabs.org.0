Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C464A79DE
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Feb 2022 21:59:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JpvKv5pNBz3cC5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Feb 2022 07:58:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=fUSdWYOd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--wedsonaf.bounces.google.com
 (client-ip=2a00:1450:4864:20::649; helo=mail-ej1-x649.google.com;
 envelope-from=3thz6yqgkdiu5nm1xwjopxxpun.lxvurw36yyl-mn4ur121.x8ujk1.x0p@flex--wedsonaf.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=fUSdWYOd; dkim-atps=neutral
Received: from mail-ej1-x649.google.com (mail-ej1-x649.google.com
 [IPv6:2a00:1450:4864:20::649])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JpWF25tHGz301M
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Feb 2022 16:53:24 +1100 (AEDT)
Received: by mail-ej1-x649.google.com with SMTP id
 fx12-20020a170906b74c00b006bbeab42f06so3965401ejb.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Feb 2022 21:53:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=YEcxhso9sKjwZhJ6R9y6hnaWvi7Bzl1Na0XtKw+cwWk=;
 b=fUSdWYOdHeKUeMgW6YkmBxSB/53js0/Xi9yPMPIeXKRuuprd68oDxxw8HXs56pmzJG
 TbGOtSyTeaMoteeqDmLO5y7xP36mECmU8T0tPomihYtHDMaGXXCkcWYOyUfUasPNi835
 kDXwHeG0kcsd3Cn/KKcZGwYPIkWPIroW53VaM1DC8BSncx9oeWZCe29sgii32Q7ug5mh
 u/0Ws5Jq/MiYnvh1cosoRQlgXMdK8sVbo/KwcYTdIh7dVj2F9LN3w5Ss57bUGk40JoT7
 qzUrnoNpR1o7tJSkKNk5bZ0w15/js/EiMbtt8yYzNZnBSHucZmO1n+E+sZakSLGPxv1l
 VlXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=YEcxhso9sKjwZhJ6R9y6hnaWvi7Bzl1Na0XtKw+cwWk=;
 b=jQW6OaL/7NGnocl7lx0zI/ydUsLa+0Gj9Vnu247N/cOpZJmI0vccPkS/n4q5Y1LwMo
 rOeUvFlZ0yIHYrahmxN3DjM4hRlBxTGx7X5tqQ2bS+icgvHxjWqmXlgcakrUD8LWvf2K
 /sMYDU0i1HzcuG168qZdGR11gJsoQA3WBX+nQvTbUCo3lA3miJbHlRzAQqzhKrr5hPyN
 +TcgszEf4ogcbJ4LAswJxr4UHAK+V+TovjhWjHRuFrJ5aEo8oMHV1qmhYgk9tmYpLO3o
 8oTrJzV2JY+nH3GCayra/mqtWr7vlkRd8889vSNsSNQLuPlRz1qQWAVB0QZelpJlVZ6B
 ZGqg==
X-Gm-Message-State: AOAM531FaGMeX+l1kVPA6cEh7UyiObb7kc1875NnDsr84q+euARcLm01
 3CvDjK8lSgcCR0s+gnuUPj+Iw6dEw6Cq
X-Google-Smtp-Source: ABdhPJy+IHzyXutWJqA4hoUVM+uvXkIGkC09+jxx++EYw7o7QO1y6QxSCE62QHzHX7JdsiYBk8mn1cr2h8hxeQ==
X-Received: from wedsonaf2.lon.corp.google.com
 ([2a00:79e0:d:209:954b:6afb:eea6:ecc2])
 (user=wedsonaf job=sendgmr) by 2002:a50:ed16:: with SMTP id
 j22mr29245372eds.114.1643781198818; Tue, 01 Feb 2022 21:53:18 -0800 (PST)
Date: Wed,  2 Feb 2022 05:51:23 +0000
Message-Id: <20220202055123.2144842-1-wedsonaf@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.35.0.rc2.247.g8bbb082509-goog
Subject: [PATCH] powerpc/module_64: use module_init_section instead of
 patching names
From: Wedson Almeida Filho <wedsonaf@google.com>
To: mpe@ellerman.id.au
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 03 Feb 2022 07:58:06 +1100
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
Cc: Wedson Almeida Filho <wedsonaf@google.com>, paulus@samba.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Without this patch, module init sections are disabled by patching their
names in arch-specific code when they're loaded (which prevents code in
layout_sections from finding init sections). This patch uses the new
arch-specific module_init_section instead.

This allows modules that have .init_array sections to have the
initialisers properly called (on load, before init). Without this patch,
the initialisers are not called because .init_array is renamed to
_init_array, and thus isn't found by code in find_module_sections().

Signed-off-by: Wedson Almeida Filho <wedsonaf@google.com>
---
 arch/powerpc/kernel/module_64.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/kernel/module_64.c b/arch/powerpc/kernel/module_64.c
index 5d77d3f5fbb5..6a45e6ddbe58 100644
--- a/arch/powerpc/kernel/module_64.c
+++ b/arch/powerpc/kernel/module_64.c
@@ -277,6 +277,12 @@ static Elf64_Sym *find_dot_toc(Elf64_Shdr *sechdrs,
 	return NULL;
 }
 
+bool module_init_section(const char *name)
+{
+	/* We don't handle .init for the moment: always return false. */
+	return false;
+}
+
 int module_frob_arch_sections(Elf64_Ehdr *hdr,
 			      Elf64_Shdr *sechdrs,
 			      char *secstrings,
@@ -286,7 +292,6 @@ int module_frob_arch_sections(Elf64_Ehdr *hdr,
 
 	/* Find .toc and .stubs sections, symtab and strtab */
 	for (i = 1; i < hdr->e_shnum; i++) {
-		char *p;
 		if (strcmp(secstrings + sechdrs[i].sh_name, ".stubs") == 0)
 			me->arch.stubs_section = i;
 		else if (strcmp(secstrings + sechdrs[i].sh_name, ".toc") == 0) {
@@ -298,10 +303,6 @@ int module_frob_arch_sections(Elf64_Ehdr *hdr,
 			dedotify_versions((void *)hdr + sechdrs[i].sh_offset,
 					  sechdrs[i].sh_size);
 
-		/* We don't handle .init for the moment: rename to _init */
-		while ((p = strstr(secstrings + sechdrs[i].sh_name, ".init")))
-			p[0] = '_';
-
 		if (sechdrs[i].sh_type == SHT_SYMTAB)
 			dedotify((void *)hdr + sechdrs[i].sh_offset,
 				 sechdrs[i].sh_size / sizeof(Elf64_Sym),
-- 
2.35.0.rc2.247.g8bbb082509-goog

