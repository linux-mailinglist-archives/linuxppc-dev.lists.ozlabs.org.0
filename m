Return-Path: <linuxppc-dev+bounces-4020-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2E09EDB72
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2024 00:29:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y7sH04fr2z30TL;
	Thu, 12 Dec 2024 10:28:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::449"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733959708;
	cv=none; b=m0A/WzJbcwsl3BGdTyXXh4aJDMJ4flNLcRf8dfIUYEIjKa/dIW5ZIBGH50SuoyIDBpaM8f0beoEu6FxUiTe9+vIsqFYC7zwK5nz2DSS5WED0DbKQCm5dMM/+RgrS7/xkx9qlgnLIBzLSh2ST4j5oonYO7e6OhqFXFU8q9gW/acLUOLQht8m+D9Btq4hXtaD5lFb5TQUTEiCaLpEmWKOk1MAqldxluiwQisDoRd61fRvDR24riBLZCWv4AvITVLiweSBtJldbAmnfMnSmN+2kxBWS2n8T9/gS1jtjcbf6OSjlVwr5I+f3HCe9U5KzxN1CMzrYuOEu4MJ1IWGwfmGhtg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733959708; c=relaxed/relaxed;
	bh=mzI/WChqoEagnx9fXIUsiKk2yVJ1VLNiv4KjzJVNd2U=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Myt2XqGCvaEsdrXj8h75OLk3/ML/eMkCgekO0+iw0bgAm3x8gEP709361IYo44Xu/cmsVHUo/3eTS/J2P3U8YfAGUOlIjU77TjPL24s2I4Xo3bXmLOd7/TAHZrHwAF3CL2C1dO89+xPN7kQw+ZC5+IUhym8qchj0BBiqK/vJaBTW6mt/JPol6iOD6d9uZ7R54zucF6SuQkXcBId/UPfVZHUhHX/IuuBt+08uSyU2+lKhCOJqouS/hSJF5R6nSERxqvkRiip68r7TzV9IcvgieTapeIe/FqgUVj49Y0Gh7bH2h0c/PDD+zlzAxp31MwgVLcIbpfw8njzM3+7c29/Ruw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=BWt2EFmS; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::449; helo=mail-pf1-x449.google.com; envelope-from=3gibazwskdaupfqjxmxnslmlttlqj.htrqnsz2uuh-ij0qnxyx.t4qfgx.twl@flex--kaleshsingh.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--kaleshsingh.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=BWt2EFmS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--kaleshsingh.bounces.google.com (client-ip=2607:f8b0:4864:20::449; helo=mail-pf1-x449.google.com; envelope-from=3gibazwskdaupfqjxmxnslmlttlqj.htrqnsz2uuh-ij0qnxyx.t4qfgx.twl@flex--kaleshsingh.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com [IPv6:2607:f8b0:4864:20::449])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y7sGz5Cfyz2xrb
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2024 10:28:27 +1100 (AEDT)
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-728e4e30163so19539b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Dec 2024 15:28:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733959706; x=1734564506; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mzI/WChqoEagnx9fXIUsiKk2yVJ1VLNiv4KjzJVNd2U=;
        b=BWt2EFmSsMeQgBk7nJ+b9XPl0/TE44TUixJMXOFWwO9BhzIz+7U8gpya+njO592raa
         sqzEJcA7QdRMC6HU6OZvSe1rqPvFFr3Gtl+XsIR1EhQrG5ExKmAKlZtnmyXQXcXzNuli
         SWH9Db/o8Pak903o9Pd4cmPT4uZ2nmKFFX5c8Pgm2lvdCKLdsU4p+hn34SV/qAii5lvf
         aepzjtCH9UfPFjXruzHcuadaxIriMe2vMJhuetH9iqvQEAt6B/FdEwgqsOftHBiJwrqu
         oWdAus39yWfcbZUkHXybYayECz9nrLCARizu65H8otA7SbIv1CJnKtGuWtQ2D3q3DMkw
         9OXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733959706; x=1734564506;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mzI/WChqoEagnx9fXIUsiKk2yVJ1VLNiv4KjzJVNd2U=;
        b=pwhLXK1Uaj3tdEx6m6dSD7Hbpv9CIzcwiHk3/rEgiXvYyC7bYbNDB4UwCdQsBSjTih
         UYmk/VjT2vkl+kXg1BDsQZrVPSQE7OZi/boccnh+snxqv5mAzbENbQzyCp+HNpAw4dUm
         0de83buziEcNtCX6W1heALLXSlLVmQtORGVnZF6GlfA97sAOjwS+Llyk2mGEiX7Z2Gx2
         ZQkEE5zaf7kPnf86jYVi0HVphOxGBnz+DSXwfPSnhpmKAQHYGkuFgqIjiRMA9TBKbwA+
         z4od+NelJGMjxBUcWg8xES8Ylfr0+HoOpv16o0uXz4Xk1LIen23HN9P5Un9U8YskdxAK
         GmJA==
X-Forwarded-Encrypted: i=1; AJvYcCX6abMfXXtLSPGqgdAMOZ22/dr9RBlMwsILWY36ceo+/TwldnHzyK5gu+PwiZOh3v9WvpCa78CXt/VNwTA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyyO9+z52hEF7liFrxAkbvpBtJi6QYvBQKz5Q8pfAbjQZBaQCKL
	7ICCtxchLlmFitlOPL3prAFVOTRk9bgjsIGeN9Hiyzstpf8l8dk8+idg0KzKu9B34Zw2i2toMqd
	4lp9oLUTEkujmBTcE6zr2Jg==
X-Google-Smtp-Source: AGHT+IGnJnRJXQZ5IIc8W3PGTGxBtDfE/sIYeRjCrJpkHMTtOgcOp40OoEyKbTRESGUAjOdqxtzUpt2F+EP39npdAw==
X-Received: from pfbcw14.prod.google.com ([2002:a05:6a00:450e:b0:728:e4d7:e3d3])
 (user=kaleshsingh job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:a10d:b0:1e1:aef4:9cdd with SMTP id adf61e73a8af0-1e1cea82ca5mr1784516637.1.1733959706098;
 Wed, 11 Dec 2024 15:28:26 -0800 (PST)
Date: Wed, 11 Dec 2024 15:27:53 -0800
In-Reply-To: <20241211232754.1583023-1-kaleshsingh@google.com>
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
References: <20241211232754.1583023-1-kaleshsingh@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241211232754.1583023-16-kaleshsingh@google.com>
Subject: [PATCH mm-unstable v2 15/16] mm: powerpc: Introduce arch_mmap_hint()
From: Kalesh Singh <kaleshsingh@google.com>
To: akpm@linux-foundation.org, vbabka@suse.cz, yang@os.amperecomputing.com, 
	riel@surriel.com, david@redhat.com, minchan@kernel.org, jyescas@google.com
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
index bc9a39821d1c..b4067c57c778 100644
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
+	if (IS_ERR_VALUE(hint_addr) || hint_addr == PAGE_ALIGN(addr))
+		return hint_addr;
+
+	return 0;
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


