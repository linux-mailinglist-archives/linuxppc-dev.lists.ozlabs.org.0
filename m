Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 68EA23A0982
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Jun 2021 03:38:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G08rQ6XNFz3dD8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Jun 2021 11:38:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=i1AekHxP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102b;
 helo=mail-pj1-x102b.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=i1AekHxP; dkim-atps=neutral
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G08my231nz3bwS
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Jun 2021 11:35:14 +1000 (AEST)
Received: by mail-pj1-x102b.google.com with SMTP id ei4so407790pjb.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 08 Jun 2021 18:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AZZG6PKSjySYLLW68o8577fNnsN68RN1PxzzV9jCnBk=;
 b=i1AekHxPezDc0/JpUoTM/8r7AQoRbwICdUahnEGCAe629BHXJEAK+g0X1TU2oEk+xA
 YR/1HiexPqud3y8CuinfYstuXXsdNSijt3OLKjXxYUpdntGw5GmRJwRtuMKbOepBQZKM
 s54sh5IZCIODzQjtsf8QItrCjTzRWupgHPz6iStvJV3bkHX3uZwgDN6KGj1mwZ03TNkj
 Wjp5x+aKn2wwC4VOBHeR588qhIEv5D3WwP/U3zhYei0YG3/V3g6oChmO3Xr0utHtRcU8
 bPgjBK31GeHvCShZQB8JqyLM0Smr/BU5OZjpSjSTF9s5vhSEFn86Zi3DFom9Kv5Rq/z1
 l6wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AZZG6PKSjySYLLW68o8577fNnsN68RN1PxzzV9jCnBk=;
 b=ZEoqL7ucZjrAdh+3yWcgo9GOo4MPY0QYqGO7K5Du5rYTf7WtuvCqJx1gUaUFBm1miC
 R3oLiTQgqVKUFsnvn4ZR11aRTyPFZgA/1Btaxe0pBK7H3CF+z7ypYqR2EByYEcedp2bg
 gBqHmS+XUPNaNt0b1O7G4DbymUmXVUtfaEC6pbvuXaBMX+EBt6OmRCQB4h63YWWtZUtq
 5lQ9FDHmeO33fzeXtCCBa2QaXZznwQ8QFYXEpI8ymxfFjygjjXU3Z3nimdoyXR6531ge
 61h1eW1WiOxBjTXc3I6hIEG1M6orDpMPiOQlWLfKjMIqnQX7JeEOLhPYxV2kLdF2VeKC
 2a6A==
X-Gm-Message-State: AOAM530vmz7t9x3QL2mzxaxkDl318Kr45co0a3Ordu8JjQil/M0zs2QT
 AYtg42yynXDWbx5lmNZi+oibsXckTEQ=
X-Google-Smtp-Source: ABdhPJxeN8yHddc12lJ6o+EfXoyY5v8xfjvPe42mTrjlFxfoQDHOjwMRoJdkgrDQTce1xgLc/zebeA==
X-Received: by 2002:a17:902:dac3:b029:105:66fc:8ed7 with SMTP id
 q3-20020a170902dac3b029010566fc8ed7mr3039002plx.6.1623202510939; 
 Tue, 08 Jun 2021 18:35:10 -0700 (PDT)
Received: from tee480.ozlabs.ibm.com (110-175-254-242.static.tpgi.com.au.
 [110.175.254.242])
 by smtp.gmail.com with ESMTPSA id s10sm11369406pfk.186.2021.06.08.18.35.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 18:35:10 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v15 7/9] powerpc: Set ARCH_HAS_STRICT_MODULE_RWX
Date: Wed,  9 Jun 2021 11:34:29 +1000
Message-Id: <20210609013431.9805-8-jniethe5@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210609013431.9805-1-jniethe5@gmail.com>
References: <20210609013431.9805-1-jniethe5@gmail.com>
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
 aneesh.kumar@linux.ibm.com, naveen.n.rao@linux.ibm.com,
 Jordan Niethe <jniethe5@gmail.com>, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Russell Currey <ruscur@russell.cc>

To enable strict module RWX on powerpc, set:

    CONFIG_STRICT_MODULE_RWX=y

You should also have CONFIG_STRICT_KERNEL_RWX=y set to have any real
security benefit.

ARCH_HAS_STRICT_MODULE_RWX is set to require ARCH_HAS_STRICT_KERNEL_RWX.
This is due to a quirk in arch/Kconfig and arch/powerpc/Kconfig that
makes STRICT_MODULE_RWX *on by default* in configurations where
STRICT_KERNEL_RWX is *unavailable*.

Since this doesn't make much sense, and module RWX without kernel RWX
doesn't make much sense, having the same dependencies as kernel RWX
works around this problem.

Book3s/32 603 and 604 core processors are not able to write protect
kernel pages so do not set ARCH_HAS_STRICT_MODULE_RWX for Book3s/32.

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Russell Currey <ruscur@russell.cc>
[jpn: - predicate on !PPC_BOOK3S_604
      - make module_alloc() use PAGE_KERNEL protection]
Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v10: - Predicate on !PPC_BOOK3S_604
     - Make module_alloc() use PAGE_KERNEL protection
v11: - Neaten up
v13: Use strict_kernel_rwx_enabled()
v14: Make changes to module_alloc() its own commit
v15: - Force STRICT_KERNEL_RWX if STRICT_MODULE_RWX is selected
     - Predicate on !PPC_BOOK3S_32 instead
---
 arch/powerpc/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index abfe2e9225fa..72f307f1796b 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -142,6 +142,7 @@ config PPC
 	select ARCH_HAS_SCALED_CPUTIME		if VIRT_CPU_ACCOUNTING_NATIVE && PPC_BOOK3S_64
 	select ARCH_HAS_SET_MEMORY
 	select ARCH_HAS_STRICT_KERNEL_RWX	if ((PPC_BOOK3S_64 || PPC32) && !HIBERNATION)
+	select ARCH_HAS_STRICT_MODULE_RWX	if ARCH_HAS_STRICT_KERNEL_RWX && !PPC_BOOK3S_32
 	select ARCH_HAS_TICK_BROADCAST		if GENERIC_CLOCKEVENTS_BROADCAST
 	select ARCH_HAS_UACCESS_FLUSHCACHE
 	select ARCH_HAS_UBSAN_SANITIZE_ALL
@@ -267,6 +268,7 @@ config PPC
 	select PPC_DAWR				if PPC64
 	select RTC_LIB
 	select SPARSE_IRQ
+	select STRICT_KERNEL_RWX if STRICT_MODULE_RWX
 	select SYSCTL_EXCEPTION_TRACE
 	select THREAD_INFO_IN_TASK
 	select VIRT_TO_BUS			if !PPC64
-- 
2.25.1

