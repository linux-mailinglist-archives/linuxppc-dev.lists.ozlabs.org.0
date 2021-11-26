Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4757645E686
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Nov 2021 04:24:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J0g8y1SKzz3bj9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Nov 2021 14:24:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=BfmN6JwU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029;
 helo=mail-pj1-x1029.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=BfmN6JwU; dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J0g6t5tCyz2x9g
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Nov 2021 14:23:02 +1100 (AEDT)
Received: by mail-pj1-x1029.google.com with SMTP id
 y14-20020a17090a2b4e00b001a5824f4918so8949273pjc.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Nov 2021 19:23:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=siIOxxyhAn1KZ3ftKBh1iR9TL35DhB2z4dfXYlVCeX4=;
 b=BfmN6JwUaQ87LPPB/UXQORvjNTwJeGwm40XvON8jwo15PNFOhOxALRNxzRtCk91uZ/
 3znhZXB9PhpU42bJGTVk5H6cIVpRA3YgIagIuQ/Ad7ED4+PrPypyJexGnefLo6ImHTL2
 w7n9/EIoArk2j4kvOBvmXYr2oQWzBhSgRp3Vk05wIwvtek7BHH6iUJ3LKkpwCf3F/U2R
 aZ6jWcuHujvSywHn/wu3rzkoxRDhQ9RXb3YRK0EXLNN3xK7fLuT3Yg8CDx5Nm50KkYB1
 l8ScUalpG557y18f0+66OQRNnQS5hkeCXYtYey8nBeqhHsFjdZhzmtnbmtb6mUAObRpj
 Nwcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=siIOxxyhAn1KZ3ftKBh1iR9TL35DhB2z4dfXYlVCeX4=;
 b=zMpOS21oaikVKXP1K5mXlneB5T0fyvXLAClwO1czsFv9oHdOGm9x1qK6JjFcqxsa8Q
 Je6OVnVE/wuMnvabhd6XrHEzKJ+bvB5CYNicTSMgNxOpCLdFI7CgoS9tHut4vpMmcMsq
 4IJdWwz5Y+2Gv3Y+NL8qma+G7tUmI5U1/DmwE6sgcTdqhHqE8hWvS7ghEnqcX887UYac
 slTJOVka6oYhxzcGAsb72yk7agUBcGhkc1qfXnepCiaWmYtGiNag+rWiEEnITbOUnIjr
 hR0bFydgm9y2pbxtooy3aKB+gDG6+GdTu7rcWyxZpvP/haI5wK0wl/tKCUF8r20jXs3M
 RrPA==
X-Gm-Message-State: AOAM530UG7vUP7kk9GGcqbTwra8OFsEHVVwH8gN3dmMoKvBNonu2GGrX
 IqdAzaIyJVcdhIgG8wM3H9Doz76utRk=
X-Google-Smtp-Source: ABdhPJxdo6kqr0cmfu8gwRMlMtg9s+d7kBXHpeR8rWZYBxttPMq4XIV+H7n8HzqzKxAOzkfJyHAF8w==
X-Received: by 2002:a17:90a:9294:: with SMTP id
 n20mr12289803pjo.69.1637896980953; 
 Thu, 25 Nov 2021 19:23:00 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (115-64-213-93.static.tpgi.com.au.
 [115.64.213.93])
 by smtp.gmail.com with ESMTPSA id l4sm5143386pfc.121.2021.11.25.19.22.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 19:23:00 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/3] powerpc/code-patching: don't use the stack for code
 patching tests
Date: Fri, 26 Nov 2021 13:22:49 +1000
Message-Id: <20211126032249.1652080-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211126032249.1652080-1-npiggin@gmail.com>
References: <20211126032249.1652080-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use the existing test function for code patching tests instead of
writing to the stack. This means the address verification does not have
to be bypassed for these tests.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/lib/code-patching.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index 70247fc58b6e..babf6b22adef 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -422,9 +422,11 @@ static void __init test_branch_iform(void)
 {
 	int err;
 	struct ppc_inst instr;
-	u32 tmp[2];
-	u32 *iptr = tmp;
-	unsigned long addr = (unsigned long)tmp;
+	u32 *iptr;
+	unsigned long addr;
+
+	iptr = (u32 *)ppc_function_entry(test_trampoline);
+	addr = (unsigned long)iptr;
 
 	/* The simplest case, branch to self, no flags */
 	check(instr_is_branch_iform(ppc_inst(0x48000000)));
@@ -516,12 +518,12 @@ static void __init test_create_function_call(void)
 static void __init test_branch_bform(void)
 {
 	int err;
-	unsigned long addr;
 	struct ppc_inst instr;
-	u32 tmp[2];
-	u32 *iptr = tmp;
+	u32 *iptr;
+	unsigned long addr;
 	unsigned int flags;
 
+	iptr = (u32 *)ppc_function_entry(test_trampoline);
 	addr = (unsigned long)iptr;
 
 	/* The simplest case, branch to self, no flags */
@@ -603,6 +605,12 @@ static void __init test_translate_branch(void)
 	if (!buf)
 		return;
 
+	/*
+	 * Have to disable the address bounds check for patch_instruction
+	 * because we are patching vmalloc space here.
+	 */
+	skip_addr_verif = true;
+
 	/* Simple case, branch to self moved a little */
 	p = buf;
 	addr = (unsigned long)p;
@@ -715,6 +723,8 @@ static void __init test_translate_branch(void)
 	check(instr_is_branch_to_addr(p, addr));
 	check(instr_is_branch_to_addr(q, addr));
 
+	skip_addr_verif = false;
+
 	/* Free the buffer we were using */
 	vfree(buf);
 }
@@ -743,13 +753,11 @@ static int __init test_code_patching(void)
 {
 	printk(KERN_DEBUG "Running code patching self-tests ...\n");
 
-	skip_addr_verif = true;
 	test_branch_iform();
 	test_branch_bform();
 	test_create_function_call();
 	test_translate_branch();
 	test_prefixed_patching();
-	skip_addr_verif = false;
 
 	return 0;
 }
-- 
2.23.0

