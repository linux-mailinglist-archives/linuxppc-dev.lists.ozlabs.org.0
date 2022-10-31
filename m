Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0015C613569
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Oct 2022 13:09:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N1Bls5bZVz2xHT
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Oct 2022 23:09:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=iVH3xGKf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=iVH3xGKf;
	dkim-atps=neutral
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N1Bjz4BCjz3bnZ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Oct 2022 23:07:51 +1100 (AEDT)
Received: by mail-pl1-x633.google.com with SMTP id g24so10550408plq.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Oct 2022 05:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N8KXzElrk7eZcMvhOMGLSocH1L3elk+opngelcioVZk=;
        b=iVH3xGKfWj//tRC8mM1EDHEmdHABtRA8Pk7XmKUNly4hgpoPYEh/S/T7cSVvmsVZ9V
         EZCIICLmWJQwpFAUZ4Hh1SULQNKji2cPYa3jzPzxndTJivwgpcRuH4zA8ovmgpGzZc9b
         Q4dSuejOClokJ1UkY6ntHGI29r4injlv6Jam6f0Lc5kgkMQRK3gG/Z1phb5GSU16uha7
         gpTXWLzMDB14ykOoPDZyiiYpnbkXnZDls+w8cewlMBjcK9c8Y5IhrvwDZl7wahO8PrUA
         GSLu7V+XPYwbxchdEm/1ZJf08sZwJKetrWbh9h4jrZdoGjdmv2Ez4HuQXWT1VYA55ISF
         GzKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N8KXzElrk7eZcMvhOMGLSocH1L3elk+opngelcioVZk=;
        b=26B0/4NbqXBSKOnf4GXF8yqsVxB3vew6cJLCd/2aOSCzfi6LzIcq79VIRV9jc6ly3X
         t8zjNO1WEK9gO1IajI5X4eu2RBrYz7Evb6tNibSQjjQo//n9BgIZPNgZ7Q+XT4Ojnvpx
         ZojVEkNjABZtVUHlQbUnyavFJEKn3UU8s+OWPMdwd/PhEIzV4TkGMkxvSsUyhnUq6FPA
         3ce4xhmOgU/24ay8UPNwKB00m6UZEvrdca2wZaqTE9MCdtfSgVRNFUaqdjnc+vinTqga
         teEIQXXAcbDSi35RSS3dm3A11ck2D59iDfIx80DpkXtN35LP4jer9/N/JpMYvV231FvI
         Y5lw==
X-Gm-Message-State: ACrzQf1etjWHwK550/FichPn4VyvmJ9Cla+ec81Cn6Ryo5p1Tz1fh282
	51gQ7E7LWHafQzQHyfKBoPJgDkR9kh8=
X-Google-Smtp-Source: AMsMyM6MFVIN9ZCxpO8+Mlfo/DtTtXcUUJD5nQ8a+6f0AqXpe5QBHKUoFQkKe6J3rVoTNuJG6AvzXg==
X-Received: by 2002:a17:903:1c2:b0:187:feb:1f31 with SMTP id e2-20020a17090301c200b001870feb1f31mr10217779plh.92.1667218069206;
        Mon, 31 Oct 2022 05:07:49 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (193-116-106-251.tpgi.com.au. [193.116.106.251])
        by smtp.gmail.com with ESMTPSA id p17-20020a170902e75100b0017e64da44c5sm1595134plf.203.2022.10.31.05.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 05:07:48 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linux-modules@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 1/2] module: add module_elf_check_arch for module-specific checks
Date: Mon, 31 Oct 2022 22:07:32 +1000
Message-Id: <20221031120733.3956781-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221031120733.3956781-1-npiggin@gmail.com>
References: <20221031120733.3956781-1-npiggin@gmail.com>
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
Cc: Luis Chamberlain <mcgrof@kernel.org>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Jessica Yu <jeyu@kernel.org>
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

