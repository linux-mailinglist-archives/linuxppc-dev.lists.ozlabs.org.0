Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9592418C715
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 06:37:46 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48kCGY5NmNzDrdJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 16:37:41 +1100 (AEDT)
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
 header.s=20161025 header.b=dSbc6/Jm; dkim-atps=neutral
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48kBsZ3Lz5zDrSF
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 16:19:30 +1100 (AEDT)
Received: by mail-pj1-x1041.google.com with SMTP id hg10so1976129pjb.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Mar 2020 22:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=+H54qxJPpdqIdmINWOLFwRUZ62EakrRU7Y6sQkZDKqM=;
 b=dSbc6/Jmv6fGESuwRUe+z0hBNkJnRc1Kor7djvuWozxnQWL/06Uyu4/QF0kO99RvcP
 C70j6WYLDmlZf+hY3mTCX1fwgwGIXspNxqbHcgyWCirih6aMn3kHUX8yfqzY4cULFm2T
 6H6ER4vxvM54MZknM2eB3MRimK6k6ktXbD8e9TyIFjEL2k8McoUvrHrSMZlqazPoGoHQ
 /LPwStR/I1nkhr9nNVp3piC/wOszMNO5lZmjwFEL7pZoSFr6UkADRNxHg9JnC0djVKnG
 pJfaFKXMqolxNGmni8cX+H1gDpd0eWBiAXBON93qtRg6KuSJnIXuZfkOx5MGwVtQGX7n
 9UUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=+H54qxJPpdqIdmINWOLFwRUZ62EakrRU7Y6sQkZDKqM=;
 b=BMcT1amHBgwGxbEiRSDmpdjjT0NtL6P89ehjX6Pr5yUsavW/9QfIPHBnnZJhJxiRTU
 O5qUMV4VogFx1Waz/2C1BGBJ4nykL3/pPKPIPNQq9BakyF5C8yb3jfAVxxtbdc7L18Rp
 1UbEUsp0BvISGiPWU7xUxr6X2t8YU8bNKQqyBSB0yIvLhgQIitlD+nZeuC0HKbFwUBwr
 zLtUh4O+4i4qWMM+4yQ5mc0cAefuArZPeSxQvMqrJgR75J/eVHYrdIA7jJQR/8kadmcn
 IlvhCYEBbx8ffbcCSlO7kob6ZUt9aMULIkpZR5YJ9F9ktn4mohJh2Gzqn7ebfzu1qJDI
 29zQ==
X-Gm-Message-State: ANhLgQ3yf37AE599eXteS7PxJ/UFGy6NhhM3DDR6Wl78dSTR2xEaH4ns
 R2UJy65Fp5emKDa40OnluSzgCpFmPfU=
X-Google-Smtp-Source: ADFU+vsZz07yP35RQ/5qfDCMzn9zpAqUT4Tc40XmIgYjBAK/11cfgvt1kRpEPex++g6uIQxB/ohdIw==
X-Received: by 2002:a17:902:a701:: with SMTP id
 w1mr6163826plq.165.1584681566990; 
 Thu, 19 Mar 2020 22:19:26 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id c207sm3988716pfb.47.2020.03.19.22.19.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2020 22:19:26 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 10/16] powerpc: Make test_translate_branch() independent of
 instruction length
Date: Fri, 20 Mar 2020 16:18:03 +1100
Message-Id: <20200320051809.24332-11-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200320051809.24332-1-jniethe5@gmail.com>
References: <20200320051809.24332-1-jniethe5@gmail.com>
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
Cc: alistair@popple.id.au, npiggin@gmail.com, bala24@linux.ibm.com,
 Jordan Niethe <jniethe5@gmail.com>, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

test_translate_branch() uses two pointers to instructions within a
buffer, p and q, to test patch_branch(). The pointer arithmetic done on
them assumes a size of 4. This will not work if the instruction length
changes. Instead do the arithmetic relative to the void * to the buffer.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v4: New to series
---
 arch/powerpc/lib/code-patching.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index 88ee03ff55f1..fa7f32adf029 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -563,7 +563,7 @@ static void __init test_branch_bform(void)
 static void __init test_translate_branch(void)
 {
 	unsigned long addr;
-	ppc_inst *p, *q;
+	void *p, *q;
 	void *buf;
 
 	buf = vmalloc(PAGE_ALIGN(0x2000000 + 1));
@@ -576,7 +576,7 @@ static void __init test_translate_branch(void)
 	addr = (unsigned long)p;
 	patch_branch(p, addr, 0);
 	check(instr_is_branch_to_addr(p, addr));
-	q = p + 1;
+	q = buf + 4;
 	patch_instruction(q, translate_branch(q, p));
 	check(instr_is_branch_to_addr(q, addr));
 
@@ -626,7 +626,7 @@ static void __init test_translate_branch(void)
 	addr = (unsigned long)p;
 	patch_instruction(p, create_cond_branch(p, addr, 0));
 	check(instr_is_branch_to_addr(p, addr));
-	q = p + 1;
+	q = buf + 4;
 	patch_instruction(q, translate_branch(q, p));
 	check(instr_is_branch_to_addr(q, addr));
 
-- 
2.17.1

