Return-Path: <linuxppc-dev+bounces-3894-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1829EA59E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Dec 2024 03:43:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y6jg71vQxz301x;
	Tue, 10 Dec 2024 13:41:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::449"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733798515;
	cv=none; b=hGh/2KV0VTMlNQatHnwFN03GNiyPM70+sg1E1ZUeootdH1Hc3SCUs5EIsx/NSAYhPYtGL38kXtuck2h7q5M9gZlx1/JvOCulqV97Ufv3V4+rrwJpWLIqVGZnTW5hPbnXL2rjhaVZad9zxTKK6Bzj6E4HabSii3cfrn9O5rTL/ffY5n9YNG4Dht3LF8yKB/OrvFUOyHKeFCRTn8z8GRocvN1gP/N53i1UADMGsbh7nl2AaqaT1QMDv57bTEGKQwVfG3tKr3/szH7OGALbk2cXwnURxCK/ODod4X92bpq9LvrBGtZU0xFnSiE9g6z51P/fpzPrNdAH8TZDhb9Wis70Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733798515; c=relaxed/relaxed;
	bh=PpJ3voZ2zpkCxNiGYJ7mZV4beiWEDuh5gW+cJghhtIw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=N+KhlERBdNH80ExVBcDlldJf2en/T+6L9HeAo2aGB6adIolgEEUnzj1mdFObPCn+HWPTWRe6JuKc7loBUERTVodtGA1O+ITol8ST/d8m5V9J0AgFWsAmrtv3TtCUamqLCvBuDr4cTEhB3y3jiYAhvFnUTZObbNkZUA020ysOdby767Y9A7WjPHG5aHyv69glLvK3ITucBRZFstDRTaPZepK7rT4WvAED7JQ43BpFzVjIbc0sS74Z4pX9/PvaUMhcp/ef7yJeKjscvwUd9Yc1QOK6SObCku5Z87IXaq164fHov5OAjTO/7oBjuHD4UvVX8H4bgVibJXfIvS5IRbjA3Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=SHG6/fE9; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::449; helo=mail-pf1-x449.google.com; envelope-from=3ckpxzwskdgundohvkvlqjkjrrjoh.frpolqxassf-ghyolvwv.rcodev.ruj@flex--kaleshsingh.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--kaleshsingh.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=SHG6/fE9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--kaleshsingh.bounces.google.com (client-ip=2607:f8b0:4864:20::449; helo=mail-pf1-x449.google.com; envelope-from=3ckpxzwskdgundohvkvlqjkjrrjoh.frpolqxassf-ghyolvwv.rcodev.ruj@flex--kaleshsingh.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com [IPv6:2607:f8b0:4864:20::449])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y6jg62Gq4z2ysv
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Dec 2024 13:41:54 +1100 (AEDT)
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-725c882576aso2797418b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Dec 2024 18:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733798512; x=1734403312; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PpJ3voZ2zpkCxNiGYJ7mZV4beiWEDuh5gW+cJghhtIw=;
        b=SHG6/fE9IYg50Znv2wTQ65Wi1rpqdQ+QibFA7VZySyRCrTXfso3TkrEkG+vjySK3GY
         R7PFHGurTecZV7ju1JrK1+kPvOxNe2wWK2sgK9m/gq/Q3+05BcQeVxCTYjnjwFqOBSSr
         V3idcA1EgFAtV9+DRb4HMZNgh44bXrmGEKsploOcDDh8uLJ7G8ymnzKFVM9UJM+XEhob
         oHzc2BZGjGAPEE9/kPEdcNhs9++VdExBKa8WUMDgeH9Z5WB/HnLuhQFo/RB1IxkQ6w39
         eksiyDbqDmtocCS74fd79iHppzA8Y8fbzzgOdvJJTyqEQujUr25BEQ8ahNMnxAFuXcEF
         JqvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733798512; x=1734403312;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PpJ3voZ2zpkCxNiGYJ7mZV4beiWEDuh5gW+cJghhtIw=;
        b=saossXNu5AS4pwLkjJiZ0qOuLjrO8HpMH0rjkUWj73AvxeHeOhUxzEHFwwIBeMjXDG
         jFUu1CzddVTp1ogeZXvUCZFMgxSInrdagZUAC9ldiquPqjoDLCdriRptSbzQctBxyTTw
         u+dNV4kng1xOR1k44LnRilo1Kloeld6SM87qUwH1i8AzT6fe5FsvzxA0NBJCP6Ff4+QF
         eOSJ5QQRtlsca9pmQET9nkMSjkouzGIbY6l0Gs5n7HmjOMuh3cfE1KW0Hr+/LtEUVU0/
         QwYb2XBhvtdnq58chUffrtH1ynZEq4R14mFGv36OkKWDZBTQb6uiTSDPQnJMGTZeq9Xv
         LZAg==
X-Forwarded-Encrypted: i=1; AJvYcCUjnnjUU9s4nrF7ywYlRpUD3uzstKRZXK8c29aNbZcOGPA11Hmgg9UA5dJqImlxu69ouC3cmhNQjABbYfc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxjwtUalMg/bGL58Xyaj1NcH+dbrFDPkU8Jvoqi9EdvJVtWtIq3
	y/3RxYygwYcY10n5tOKJnD9IWwE4rnKl/U5hq9x0PPUtyX0d4C0gr/jJSZW29KIGUVzR7BvLTVy
	vLpGfkO5Dvkd8J7RlEHJxPQ==
X-Google-Smtp-Source: AGHT+IH+U5NNduIwURg0BoDlPsKnnOIwfCnZdS3eRXACF/uPNRGoE141bvOCCDVesMcVlUE6OG1mnMpg0Q9mT2r6sg==
X-Received: from pfu5.prod.google.com ([2002:a05:6a00:a385:b0:725:f376:f548])
 (user=kaleshsingh job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:3016:b0:725:c8ea:b320 with SMTP id d2e1a72fcca58-725c8eab756mr18454838b3a.14.1733798512543;
 Mon, 09 Dec 2024 18:41:52 -0800 (PST)
Date: Mon,  9 Dec 2024 18:41:18 -0800
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
Message-ID: <20241210024119.2488608-17-kaleshsingh@google.com>
Subject: [PATCH mm-unstable 16/17] mm: Fallback to generic_mmap_hint()
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

If an architecture doesn't provide arch_mmap_hint() fallback to
generic_mmap_hint().

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---
 mm/mmap.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/mm/mmap.c b/mm/mmap.c
index e97eb8bf4889..59bf7d127aa1 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -691,6 +691,15 @@ arch_get_unmapped_area(struct file *filp, unsigned long addr,
 }
 #endif
 
+#ifndef HAVE_ARCH_MMAP_HINT
+unsigned long arch_mmap_hint(struct file *filp, unsigned long addr,
+			     unsigned long len, unsigned long pgoff,
+			     unsigned long flags)
+{
+	return generic_mmap_hint(filp, addr, len, pgoff, flags);
+}
+#endif
+
 /*
  * This mmap-allocator allocates new areas top-down from below the
  * stack's low limit (the base):
-- 
2.47.0.338.g60cca15819-goog


