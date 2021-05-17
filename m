Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7166C38231E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 May 2021 05:37:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fk4ZD3Pq9z3cby
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 May 2021 13:37:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=F4Uf072+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52c;
 helo=mail-pg1-x52c.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=F4Uf072+; dkim-atps=neutral
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fk4Vg6B3mz30NR
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 May 2021 13:34:03 +1000 (AEST)
Received: by mail-pg1-x52c.google.com with SMTP id l70so3718455pga.1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 May 2021 20:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cNraGQoLc4iukBkSNLJN6zryOfDc3aP66V4objjPpD0=;
 b=F4Uf072+gMfkcjbiDrGR67z6YDfJ7FNKuVMPFxDCKftTj6u3+t41wH9FxoHDvc8cc+
 qO7iDfxR0ejDfnAh+cZsLFwbov1PEwRzGv5tmTSvvYZutWzAgQw/LPR24eYQbZ91qHpC
 1RzoaoGrx7p3xhmj21znSYndSFG2GlfVDoF//OSMvJDACeOVkLgINhPb4OWcPfnCUq/E
 hIbnzsccxsKAZKn+s/Yibt04mApOAtg3ixvr7I6jSjTcOPdt0Y0l8KkXTSmQVt6HV55A
 ZmE7tef2aZ29bxj82ev3VHdx7KvmDhbTmnuevMX8jjz55+d9f3T/bDRHGfJdC0MGnY3f
 AvIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cNraGQoLc4iukBkSNLJN6zryOfDc3aP66V4objjPpD0=;
 b=t2yM3NjDg/X0Oo64yhbgBBWjU2Uugl3NmXLqk2UZSKK+FMG5GcQz08A7BnWDWuKlUc
 pg+AcvYFwjx921du8eY/mUEYRqyTg7l3hTyqsqNSvB/5Fe/eLWw8oaZecu1fM17dF7fH
 MDnV7zP30hsTEX/15ExR+YNLLP5Ai9foTlJMYjXeKhtTZqXuElX1APReV3NmgvD46URU
 Q+0RB/819a66fmJlxQ42MZvb0q5jm7VfGD9PzoHoBpy86qoP4P3BYEkMp8DqRZIe9zxH
 dintYfP3eCKPTXkvlMctZxAtXMw0v5bEp9xEHB5sw/K7QoV+9LDUwde3Kh0ZJtSLMoEo
 HJtg==
X-Gm-Message-State: AOAM532MkqBaVrFHZVEPhbyFTiTZkN88lLfSu7MLGLK44GyYanBuHdbH
 moefu8AqqWWtN62YcljrKCZ54p8/FcY=
X-Google-Smtp-Source: ABdhPJwOCW5SqOHQwol8jigJJuelEmHuW7rwvcbUsO3YDv+t6mGfX7eATgAw4wmAK6zbtiFLJWbyBA==
X-Received: by 2002:a05:6a00:14cb:b029:2be:1466:5a28 with SMTP id
 w11-20020a056a0014cbb02902be14665a28mr38060025pfu.55.1621222441166; 
 Sun, 16 May 2021 20:34:01 -0700 (PDT)
Received: from tee480.ibm.com (159-196-117-139.9fc475.syd.nbn.aussiebb.net.
 [159.196.117.139])
 by smtp.gmail.com with ESMTPSA id s3sm9785418pgs.62.2021.05.16.20.33.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 May 2021 20:34:00 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v14 7/9] powerpc: Set ARCH_HAS_STRICT_MODULE_RWX
Date: Mon, 17 May 2021 13:28:08 +1000
Message-Id: <20210517032810.129949-8-jniethe5@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210517032810.129949-1-jniethe5@gmail.com>
References: <20210517032810.129949-1-jniethe5@gmail.com>
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

Book32s/32 processors with a hash mmu (i.e. 604 core) can not set memory
protection on a page by page basis so do not enable.

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
---
 arch/powerpc/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index cce0a137b046..cb5d9d862c35 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -140,6 +140,7 @@ config PPC
 	select ARCH_HAS_SCALED_CPUTIME		if VIRT_CPU_ACCOUNTING_NATIVE && PPC_BOOK3S_64
 	select ARCH_HAS_SET_MEMORY
 	select ARCH_HAS_STRICT_KERNEL_RWX	if ((PPC_BOOK3S_64 || PPC32) && !HIBERNATION)
+	select ARCH_HAS_STRICT_MODULE_RWX	if ARCH_HAS_STRICT_KERNEL_RWX && !PPC_BOOK3S_604
 	select ARCH_HAS_TICK_BROADCAST		if GENERIC_CLOCKEVENTS_BROADCAST
 	select ARCH_HAS_UACCESS_FLUSHCACHE
 	select ARCH_HAS_COPY_MC			if PPC64
-- 
2.25.1

