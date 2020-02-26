Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD5B16F68A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 05:39:56 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48S34Q4j8hzDqMt
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 15:39:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1041;
 helo=mail-pj1-x1041.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ZnQdTzFJ; dkim-atps=neutral
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48S2Np2slZzDqdp
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 15:08:58 +1100 (AEDT)
Received: by mail-pj1-x1041.google.com with SMTP id ep11so696670pjb.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2020 20:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=4APAJa04OqQvBuPh8qOA4vaLQx6bRHVlMgJ4rnMsd4U=;
 b=ZnQdTzFJxbVBw9H3jSJFBpP+s2Bx6MDuTiooWwm8Q4T4sc9YRvMuo9uZNQsh6Bye0E
 cRydNe/yQ3VrPRzJnku5ZWGGbBunvT66+5Z2H8whdyIEJ8tbXhrXHncBrbMo5ftoN4Sw
 qVwD4C0rUN4B9B7JptYgD2roWsFc/isfKRWfnAfyyZjc0W3ayq6knGTwRcHDyTukJich
 u1fgKLIW6tbZdUJ8su67HG+KBYwDWccZetQ6PCkgK7Evr5/YJv9vb7eyitfm7IhBL00u
 1dylLIr0LEI41ujC0Uag4Lhzx2G1+7/c1Va/h+eHNYPsSYbW2/3P4D6G5megCJPcqhFY
 XLpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=4APAJa04OqQvBuPh8qOA4vaLQx6bRHVlMgJ4rnMsd4U=;
 b=JhJOncpm7H7Lkk1gfSlLPTXK6YDjKJ3cbupzyShT5ESWQ7M1uov3NEwJ3OYolDXqSG
 Cz+9maMVtZejTa+udOAqPQdWvggabDjK9ZVIWcsEmI1SpMqxeEwGIUn8cxA1Q/fcoWOl
 +9TFk6yfIwMBwgzEk3MzbJ0bIrCB4ABYiQS0wLVE+hed2hSByPBAcOZhNHz7lLEMHWw2
 J/JJlDdOQsQrKEo+dvwH3PERyAC2/9v8pG43XhXCszkbvU6r6sjYtkyVBK/DrmKOKaiD
 fmwvg0Z868XtTJ/gPYP/Fb9+3+YWtYdFWtwrBYnql3cd9klfzvdfnd9xxR4/d1L0k3/L
 jlQQ==
X-Gm-Message-State: APjAAAWfKf7dqT/fpbgkGobA4uiGexr9BvilbDV8ge0ulLtoLmKnVHKc
 rNt54ddF8Z85NbF80sIGj5u2kAD3xSs=
X-Google-Smtp-Source: APXvYqzGRe3f+WlV86ZyehZjcScEY73zzQNiG8Z6bYhAIk9SloPUPvjA3Ot0/nO+n0jxr9KxQ+OBAg==
X-Received: by 2002:a17:902:41:: with SMTP id 59mr2059519pla.39.1582690135667; 
 Tue, 25 Feb 2020 20:08:55 -0800 (PST)
Received: from tee480.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id d4sm604681pjg.19.2020.02.25.20.08.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 20:08:55 -0800 (PST)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 14/14] powerpc: Add prefix support to
 mce_find_instr_ea_and_pfn()
Date: Wed, 26 Feb 2020 15:07:16 +1100
Message-Id: <20200226040716.32395-15-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200226040716.32395-1-jniethe5@gmail.com>
References: <20200226040716.32395-1-jniethe5@gmail.com>
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
Cc: alistair@popple.id.au, bala24@linux.ibm.com,
 Jordan Niethe <jniethe5@gmail.com>, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

mce_find_instr_ea_and_pfn analyses an instruction to determine the
effective address that caused the machine check. Update this to load and
pass the suffix to analyse_instr for prefixed instructions.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v2: - Rename sufx to suffix
---
 arch/powerpc/kernel/mce_power.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/mce_power.c b/arch/powerpc/kernel/mce_power.c
index 824eda536f5d..091bab4a5464 100644
--- a/arch/powerpc/kernel/mce_power.c
+++ b/arch/powerpc/kernel/mce_power.c
@@ -365,7 +365,7 @@ static int mce_find_instr_ea_and_phys(struct pt_regs *regs, uint64_t *addr,
 	 * in real-mode is tricky and can lead to recursive
 	 * faults
 	 */
-	int instr;
+	int instr, suffix = 0;
 	unsigned long pfn, instr_addr;
 	struct instruction_op op;
 	struct pt_regs tmp = *regs;
@@ -374,7 +374,9 @@ static int mce_find_instr_ea_and_phys(struct pt_regs *regs, uint64_t *addr,
 	if (pfn != ULONG_MAX) {
 		instr_addr = (pfn << PAGE_SHIFT) + (regs->nip & ~PAGE_MASK);
 		instr = *(unsigned int *)(instr_addr);
-		if (!analyse_instr(&op, &tmp, instr, PPC_NO_SUFFIX)) {
+		if (IS_PREFIX(instr))
+			suffix = *(unsigned int *)(instr_addr + 4);
+		if (!analyse_instr(&op, &tmp, instr, suffix)) {
 			pfn = addr_to_pfn(regs, op.ea);
 			*addr = op.ea;
 			*phys_addr = (pfn << PAGE_SHIFT);
-- 
2.17.1

