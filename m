Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 272AC251C6D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Aug 2020 17:38:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BbY791YHszDqFp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Aug 2020 01:38:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=CehPsFgN; dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BbXFV5XPdzDqMr
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Aug 2020 00:59:05 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id 17so7551599pfw.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Aug 2020 07:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Gv+PP/wjBFW/QutbN7MDl66u1IlF9/srIH5l1WMUz8Y=;
 b=CehPsFgNdfZPYRARvszK0iCwlAZvJIxorhXqUBbsMR1owd1LyaUhv6KkQvkxGhxABE
 h3c8oVY4EFa6rJUgIrnLjCkRStwzaM9eK3BEMzyYASBFUKLmA+35vORx8gBhNYtW5z1x
 3s4yU9gOSNIa2NA3S2uwFMPR+o6NS9XnTAPYFEUJ/a2tvEAtbBjA1Mmp8fT2zjJBaCkA
 4TWe+7FbzU6KUDpftLPy16UTk04L6fVCaWwJOTS0ymSpOh99vhufmMr4F4IOV+GRRGFF
 GHMVyMWmrmX2CZxkpNlbupR524BD2hb59sZczST12PHUj62mzy25W0DZVP/E9GAWUSNh
 X5zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Gv+PP/wjBFW/QutbN7MDl66u1IlF9/srIH5l1WMUz8Y=;
 b=dnVnQZ+i/MJwBQcPOAfTFep4cIQ2CcPpY5fTSzsVtSdk91WAuRYsAEAHSswW2iRgLb
 WmMzgcUggsX6Mg0FPMCU3RqJ8qB4RqYZLmDOXpXImzLA79+B6Z0rU/y3g21mRp2o5TPQ
 XwYEqn2OL+cygLBca4yXqRvoS834UT5kshoRYYaIhLJvvLG+RBMck5Q+gi1kVHxPhZGC
 JUfhRe6jgLY2DFoteXGQoxJ6NgwCIUGXSRmmGSXcV/NKNhZgumBX+SCnCE/XgPscjrEF
 yOlWCBq0pUbFWxi7pEk8jAgIph58+We58XR6ZyPHJpSsDQuwS25QRK2p6HkBCl0b+xdi
 gUQA==
X-Gm-Message-State: AOAM530N61YvuBahBUzOYMfQRVBMv35pJhphB+sUGkl3BPevdzQBk7GZ
 cIDBg4zx9CXuiI0eo9uc1P4=
X-Google-Smtp-Source: ABdhPJw/xmLmJIGKGVYgH1x/f+iaOst/Nn2dxedzrtxUqC/Tzcj9oxAGZQvDlxbNYOCi6LTdFZvEGg==
X-Received: by 2002:a62:6582:: with SMTP id z124mr7599734pfb.250.1598367542459; 
 Tue, 25 Aug 2020 07:59:02 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (61-68-212-105.tpgi.com.au. [61.68.212.105])
 by smtp.gmail.com with ESMTPSA id e29sm15755956pfj.92.2020.08.25.07.58.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2020 07:59:02 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v7 12/12] powerpc/64s/radix: Enable huge vmalloc mappings
Date: Wed, 26 Aug 2020 00:57:53 +1000
Message-Id: <20200825145753.529284-13-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200825145753.529284-1-npiggin@gmail.com>
References: <20200825145753.529284-1-npiggin@gmail.com>
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
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, Christoph Hellwig <hch@infradead.org>,
 Zefan Li <lizefan@huawei.com>, Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 2 ++
 arch/powerpc/Kconfig                            | 1 +
 2 files changed, 3 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index bdc1f33fd3d1..6f0b41289a90 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -3190,6 +3190,8 @@
 
 	nohugeiomap	[KNL,X86,PPC] Disable kernel huge I/O mappings.
 
+	nohugevmalloc	[PPC] Disable kernel huge vmalloc mappings.
+
 	nosmt		[KNL,S390] Disable symmetric multithreading (SMT).
 			Equivalent to smt=1.
 
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 1f48bbfb3ce9..9171d25ad7dc 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -175,6 +175,7 @@ config PPC
 	select GENERIC_TIME_VSYSCALL
 	select HAVE_ARCH_AUDITSYSCALL
 	select HAVE_ARCH_HUGE_VMAP		if PPC_BOOK3S_64 && PPC_RADIX_MMU
+	select HAVE_ARCH_HUGE_VMALLOC		if HAVE_ARCH_HUGE_VMAP
 	select HAVE_ARCH_JUMP_LABEL
 	select HAVE_ARCH_KASAN			if PPC32 && PPC_PAGE_SHIFT <= 14
 	select HAVE_ARCH_KASAN_VMALLOC		if PPC32 && PPC_PAGE_SHIFT <= 14
-- 
2.23.0

