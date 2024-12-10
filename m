Return-Path: <linuxppc-dev+bounces-3896-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55CCA9EA5A7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Dec 2024 03:43:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y6jgC6nNTz305c;
	Tue, 10 Dec 2024 13:41:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4860:4864:20::4a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733798519;
	cv=none; b=VCvdOFsm1CZXUu7iqlZFN1BonmFyI5/JinH7i3XufbA8Ey/N/2+tE35d5Q3D2iEt61GFMzaEHFqopLvo/JMGAL0tLg7SCK+5bNBo33acsbfHFMw0nfebIcGChrNtNLnOK6+C21M7d7VfVab1oJgfo806RpHOWo/kqk1zNmOsmhCFqEsRkJDOdVjyIve+8w6uKHdeo+ExBOb/udSUlq7J4P3+kXQ8Fyrmdbss5ThBysVYTCzvLWCu3tXgAyCPKRjHVDKtUBvBGzpdvUgZ1/MR/2ES9gS/IqOo4E5DnhfnZs8yH/zWH5X486hlvfiZadituv63wKYjUMYx2OG875EsdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733798519; c=relaxed/relaxed;
	bh=QfykOM1fOarLfySIdaHc0pH2J2Kgj1GMXq62gJs/y4s=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mR8TssncM2Zx/eLxqwPd8jlx+RGjkQPWzYZ7JrwadT+vYUc+OIvZpIPiCxa+dYsQfM4YYQR7ceSehCNzugXc44YmiQBtdc/lq7iEdX4tO3gyV0OebeTWMU9whFVQ5mAceSHOy2nlrsA0G2fUWH1i4Qw/O8O3RXFjfkVo9TLC3mBSeHlayzqjDbD9aOadXKevfnQpBajWxOeZVcIpWzpht7EUHxjZNn94apAy7hMwahOCU/msw2qV89KWBPm8Spiv/KT3SqGIOVc7a3ZuBmc223mqKLAhKLfVUoPxlhmpA4hdxTtX5nE8SKsUOI94V0DiMGwXIB2pQh1wVYa71cp9qQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=eb4WBx/+; dkim-atps=neutral; spf=pass (client-ip=2001:4860:4864:20::4a; helo=mail-oa1-x4a.google.com; envelope-from=3bqpxzwskdgmlbmftitjohihpphmf.dpnmjovyqqd-efwmjtut.pambct.psh@flex--kaleshsingh.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--kaleshsingh.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=eb4WBx/+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--kaleshsingh.bounces.google.com (client-ip=2001:4860:4864:20::4a; helo=mail-oa1-x4a.google.com; envelope-from=3bqpxzwskdgmlbmftitjohihpphmf.dpnmjovyqqd-efwmjtut.pambct.psh@flex--kaleshsingh.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-oa1-x4a.google.com (mail-oa1-x4a.google.com [IPv6:2001:4860:4864:20::4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y6jgC0bX1z2ysv
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Dec 2024 13:41:58 +1100 (AEDT)
Received: by mail-oa1-x4a.google.com with SMTP id 586e51a60fabf-2975e172b3bso4105610fac.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Dec 2024 18:41:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733798511; x=1734403311; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=QfykOM1fOarLfySIdaHc0pH2J2Kgj1GMXq62gJs/y4s=;
        b=eb4WBx/+LdhAy4ANG2pkkspwY8MxqAhEofQKlQR3ij166tQ8ZNyZUWIKMiciwrBtoH
         uZV+HVF+w5/nd7OEitubrF2aYer1YdVDLWH0cn3agObiBOd4yLu3qRBXB2jYI/BOptJi
         vb4o2eaTTVW4qZJxLZR5Ko1/XfRYVa0OIpnREPoyPmo1KkMZzTqBPudUTnqCnCX57eyZ
         AGHTfeDuE5lB1GwcyxyIF2tLFQ+tJc/2QKAM09EGfz+vXPPndSKxuHpyDbxEZduMQIbJ
         M7xNrA30REoNvgBrjt0xeCFJqIWugSpnStmrL3PZJLMuALtar9dFP1841vQ9Ai0erM7W
         wH9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733798511; x=1734403311;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QfykOM1fOarLfySIdaHc0pH2J2Kgj1GMXq62gJs/y4s=;
        b=ne3FqgDOMPUrOhlEzSEFw8P/rIZ9JuWz6xKMx+PfRqOVLzXfJjwHd2MFee34hlmMtd
         eXUh5hiM3IzBMrOB+Pc8dC3LDDN6NJSPFdEOhDKuo9U6Bzq+VdZ/ADO6Weay/lsg1oka
         m2ooCk66kskJ1WUddezVae4yyPkXAmr5LmYfCNvYADNLS2dMf8cwtNf+Dgln6MnvPUVE
         Fn0ukGNh5HUVWzDBg3+YvrRZCzGvXpOOCfUFs2ZcafXWH59stjKaf5IqSg1WjuXOzgBx
         7H6/S1d31BPsa16sADpwRYZKMJdm35qO3tF5mxxk9PY9wY3CUIMSeqpelWc6vuk0k0aH
         p6bw==
X-Forwarded-Encrypted: i=1; AJvYcCUmcMDztKizn/h2Q07p1FoFWsUmlYXhkTm7/6gaToZiXze++CWMctGapLBG8c/miwpBOAQuL/Kjmk7Gh2U=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxhWG5xwHUblI2dKRUDDbLx2tInCRd/OrFQXftimXHz9c28faAB
	86OcLWufy0qz+Cg5iXPA6rFwPvPyhZ5fWQ4Sqb3ediNTBXWvNe2qqLJcamcwDvqd5mA1kq1pyeD
	uwixTDH+CGopbm4HejP519Q==
X-Google-Smtp-Source: AGHT+IGyaGimLFtOc8xFMrBxHlvoKkgipEDRsXSRpIYCtUs3FtGiq87tnN7DOlflNQnY8+3VkwfOeHU4ERQxyW4QXg==
X-Received: from oabps11.prod.google.com ([2002:a05:6870:9e0b:b0:296:5847:48e8])
 (user=kaleshsingh job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6870:3108:b0:29e:287e:3706 with SMTP id 586e51a60fabf-29f732d630amr9859551fac.17.1733798510837;
 Mon, 09 Dec 2024 18:41:50 -0800 (PST)
Date: Mon,  9 Dec 2024 18:41:17 -0800
In-Reply-To: <20241210024119.2488608-1-kaleshsingh@google.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
References: <20241210024119.2488608-1-kaleshsingh@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241210024119.2488608-16-kaleshsingh@google.com>
Subject: [PATCH mm-unstable 15/17] mm: powerpc: Introduce arch_mmap_hint()
From: Kalesh Singh <kaleshsingh@google.com>
To: akpm@linux-foundation.org, vbabka@suse.cz, yang@os.amperecomputing.com, 
	riel@surriel.com, david@redhat.com
Cc: linux@armlinux.org.uk, tsbogend@alpha.franken.de, 
	James.Bottomley@HansenPartnership.com, ysato@users.sourceforge.jp, 
	dalias@libc.org, glaubitz@physik.fu-berlin.de, davem@davemloft.net, 
	andreas@gaisler.com, tglx@linutronix.de, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, chris@zankel.net, 
	jcmvbkbc@gmail.com, bhelgaas@google.com, jason.andryuk@amd.com, 
	leitao@debian.org, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-mm@kvack.org, 
	kernel-team@android.com, android-mm@google.com, 
	Kalesh Singh <kaleshsingh@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Introduce powerpc arch_mmap_hint() and define HAVE_ARCH_MMAP_HINT.
This is a preparatory patch, no functional change is introduced.

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---
 arch/powerpc/include/asm/book3s/64/slice.h |  1 +
 arch/powerpc/mm/book3s64/slice.c           | 31 ++++++++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/arch/powerpc/include/asm/book3s/64/slice.h b/arch/powerpc/include/asm/book3s/64/slice.h
index 5fbe18544cbd..89f629080e90 100644
--- a/arch/powerpc/include/asm/book3s/64/slice.h
+++ b/arch/powerpc/include/asm/book3s/64/slice.h
@@ -10,6 +10,7 @@
 #endif
 #define HAVE_ARCH_UNMAPPED_AREA
 #define HAVE_ARCH_UNMAPPED_AREA_TOPDOWN
+#define HAVE_ARCH_MMAP_HINT
 #endif
 
 #define SLICE_LOW_SHIFT		28
diff --git a/arch/powerpc/mm/book3s64/slice.c b/arch/powerpc/mm/book3s64/slice.c
index bc9a39821d1c..70b95968301a 100644
--- a/arch/powerpc/mm/book3s64/slice.c
+++ b/arch/powerpc/mm/book3s64/slice.c
@@ -647,6 +647,37 @@ static int file_to_psize(struct file *file)
 }
 #endif
 
+static unsigned long slice_mmap_hint(unsigned long addr, unsigned long len,
+				     unsigned long flags, unsigned int psize)
+{
+	unsigned long hint_addr = slice_get_unmapped_area(addr, len, flags, psize, 0);
+
+	if (IS_ERR_VALUE(hint_addr) || hint_addr != PAGE_ALIGN(addr))
+		return 0;
+
+	return hint_addr;
+}
+
+unsigned long arch_mmap_hint(struct file *filp, unsigned long addr,
+			     unsigned long len, unsigned long pgoff,
+			     unsigned long flags)
+{
+	unsigned int psize;
+
+	if (!addr)
+		return 0;
+
+	if (radix_enabled())
+		return generic_mmap_hint(filp, addr, len, pgoff, flags);
+
+	if (filp && is_file_hugepages(filp))
+		psize = file_to_psize(filp);
+	else
+		psize = mm_ctx_user_psize(&current->mm->context);
+
+	return slice_mmap_hint(addr, len, flags, psize);
+}
+
 unsigned long arch_get_unmapped_area(struct file *filp,
 				     unsigned long addr,
 				     unsigned long len,
-- 
2.47.0.338.g60cca15819-goog


