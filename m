Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F283F34E059
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Mar 2021 06:53:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F8cXw00Nsz3cDV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Mar 2021 15:53:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=kkOsfG1f;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::431;
 helo=mail-pf1-x431.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=kkOsfG1f; dkim-atps=neutral
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F8cVt3Y8Kz30GW
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Mar 2021 15:52:06 +1100 (AEDT)
Received: by mail-pf1-x431.google.com with SMTP id q5so11303641pfh.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Mar 2021 21:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f5qX0zwmUN7b3YCTuFi5vA9cPngeGg3OSEyHJ7gHbOI=;
 b=kkOsfG1fL75rLVS4Aog5SCn2gVwWWAcsvukt9LFGsGAAZFEk6eCOZk4SeetvwJz5bk
 8esBG2TVJYLguDaPp0Q4NLVlMCa+/kxplZ4Szb2CXzk3Zz0uFtiAjNRufTQig/WwcmR2
 jLxZIZ0Jg2IzHjtE6K3aWkws+i5ft6hqOzOCgtfXFWEI2a7pUFTuAFy6pVelap9HDaJL
 4IupaxW/bR7z7tp3e0Bgh/vOhf0toSyNM7XSo5gtusnbr0dMp4N+KSa8Q16Qi3VtsuZ6
 IH3N9N62vksox9I7v98fxXv/z1PGm2kgKhzaRGo7z7vU8XIYoUHS9NUcgW8xBetBhsHf
 Y97Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f5qX0zwmUN7b3YCTuFi5vA9cPngeGg3OSEyHJ7gHbOI=;
 b=O9MFZZ2Q3btF96wBGdzkWAMwcTpbbadH8zwGuFNgWXLWYtPR9/wQsmj4i51Puz/pMv
 uzMeKwvY0+aVpHPB45JCZ9k8wTMcoPlUl+A/VtcOVP2TjfNp7YKHURTBKkTh6FQxNTiT
 TaR3WpH7OVlAJCMKvRBxmFldOj0vquYrokFU7X+4RUk8pxyLJVQMcj+6bKPMsH/sXLf3
 wKSWphAidStu0YFcMjqMxhlu4o8l60Vq+WHWErbtqehALaSFkcGsQpTJuyvGdSpiBnW9
 /pNTWUaEEbCVmzdx2z2gtRepg8wQnjEFJ6hyynHtiq24uo4xFd3AOTiaX23qmZ3jHYG3
 kmtg==
X-Gm-Message-State: AOAM53379zj5FuZ7fnqU3GDYgMa79ihVjhfbcVa6Btqp6RJ1e8JAku2c
 bP/bkpMJ2i3U48yk6IJq6UrouC9pY6ldwg==
X-Google-Smtp-Source: ABdhPJwv9kGkS6hvWTn41UXPqS3dxQWD17XaHlldzhjAqNE1OgHBVq7MsELGJXdbaZqAQq7/bpbPKw==
X-Received: by 2002:a63:6a84:: with SMTP id
 f126mr26248615pgc.352.1617079923866; 
 Mon, 29 Mar 2021 21:52:03 -0700 (PDT)
Received: from tee480.ibm.com (159-196-117-139.9fc475.syd.nbn.aussiebb.net.
 [159.196.117.139])
 by smtp.gmail.com with ESMTPSA id a18sm14136574pfa.18.2021.03.29.21.51.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 21:52:03 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v10 04/10] powerpc/kprobes: Mark newly allocated probes as ROX
Date: Tue, 30 Mar 2021 15:51:26 +1100
Message-Id: <20210330045132.722243-5-jniethe5@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210330045132.722243-1-jniethe5@gmail.com>
References: <20210330045132.722243-1-jniethe5@gmail.com>
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
Cc: ajd@linux.ibm.com, cmr@codefail.de, npiggin@gmail.com,
 naveen.n.rao@linux.ibm.com, Jordan Niethe <jniethe5@gmail.com>, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Russell Currey <ruscur@russell.cc>

Add the arch specific insn page allocator for powerpc. This allocates
ROX pages if STRICT_KERNEL_RWX is enabled. These pages are only written
to with patch_instruction() which is able to write RO pages.

Reviewed-by: Daniel Axtens <dja@axtens.net>
Signed-off-by: Russell Currey <ruscur@russell.cc>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
[jpn: Reword commit message, switch to __vmalloc_node_range()]
Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v9: - vmalloc_exec() no longer exists
    - Set the page to RW before freeing it
v10: - use __vmalloc_node_range()
---
 arch/powerpc/kernel/kprobes.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.c
index 01ab2163659e..3ae27af9b094 100644
--- a/arch/powerpc/kernel/kprobes.c
+++ b/arch/powerpc/kernel/kprobes.c
@@ -25,6 +25,7 @@
 #include <asm/sections.h>
 #include <asm/inst.h>
 #include <linux/uaccess.h>
+#include <linux/vmalloc.h>
 
 DEFINE_PER_CPU(struct kprobe *, current_kprobe) = NULL;
 DEFINE_PER_CPU(struct kprobe_ctlblk, kprobe_ctlblk);
@@ -103,6 +104,19 @@ kprobe_opcode_t *kprobe_lookup_name(const char *name, unsigned int offset)
 	return addr;
 }
 
+void *alloc_insn_page(void)
+{
+	if (IS_ENABLED(CONFIG_STRICT_KERNEL_RWX)) {
+		return __vmalloc_node_range(PAGE_SIZE, 1, MODULES_VADDR, MODULES_END,
+				GFP_KERNEL, PAGE_KERNEL_ROX, VM_FLUSH_RESET_PERMS,
+				NUMA_NO_NODE, __builtin_return_address(0));
+	} else {
+		return __vmalloc_node_range(PAGE_SIZE, 1, MODULES_VADDR, MODULES_END,
+				GFP_KERNEL, PAGE_KERNEL_EXEC, VM_FLUSH_RESET_PERMS,
+				NUMA_NO_NODE, __builtin_return_address(0));
+	}
+}
+
 int arch_prepare_kprobe(struct kprobe *p)
 {
 	int ret = 0;
-- 
2.25.1

