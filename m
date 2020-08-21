Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 430E524D919
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Aug 2020 17:52:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BY5cf2RxSzDqHb
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Aug 2020 01:52:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ABKo10dj; dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BY4m52SzdzDqlD
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Aug 2020 01:13:41 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id d19so1125721pgl.10
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Aug 2020 08:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Gv+PP/wjBFW/QutbN7MDl66u1IlF9/srIH5l1WMUz8Y=;
 b=ABKo10djrnU4pGClhFKavAXdh54V4mnbGrFg88b4z5GAyvOzXK9Eatymo9uLkZeCkl
 2KeYeAal4TC74hqFqtqWVYr+S9XoSTUei+yPXR1nwbKG2HskYDeK468qveJL66dPV04W
 CRRc30oZdDSysRKYpri0vtoFTrTe8+adB1CPOGf48fZZSRnz4o0sJ5mf6x5a6cA0ofL4
 19YSrxZrL+fkPQUkLYIOkcXIc3/ENsTQpySXISI/iwWDCu4uxqzoye8zVjzI82fpwiuK
 4hZfxA7JJWC/dklgIjV7wahwIdIgahUUgl+QKLx6L3g/KymHmFwij0sKPdvlpJphHxxv
 4L4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Gv+PP/wjBFW/QutbN7MDl66u1IlF9/srIH5l1WMUz8Y=;
 b=ViAtF/uUk9At/JAIg+ivA45FKx0Z55AX3MQPW6EUEJcQ86wWkBm0cHrLCZASegyrH0
 6XIf107Foo85N7KtU3+gurC8VvCLK/w2QX0/SWvR9OJ8Hji6IpjY68iNL+OIhQpLpDmM
 N39hmYn/Tit5MNaSU56JiXgBZWRTlAd5f4a4G1SoGIEq0Ro8jV+2NaRbNjjnAD7sAQDN
 00TIdlHHQ79kl3q/cYQj6hTZTSiZqepL5C/jnE1EbC67yasKvhF14TFOwL4tmQlmrEt1
 dti3hGexQKfm1YOmEuePdwMp2gJ+USUkmDnuQ3M3EshKR/+ypJ94es5aSC0ubwUsYYhK
 cg+w==
X-Gm-Message-State: AOAM532xau8lQh7WBX2w1BxqtK6ySd/Zj6L6nPyxRKeJXI8mOezanxGx
 07AmW7BPubExPdqWnSc1oGa7Ze92ybw=
X-Google-Smtp-Source: ABdhPJwItWdQvR8DxTON4DygzvNWnRtG1VJd3vYg6XhNeG9Dmt4XVNKDtCB8WfPdSWvlVqPVfP71sA==
X-Received: by 2002:a63:584e:: with SMTP id i14mr2637896pgm.433.1598022815728; 
 Fri, 21 Aug 2020 08:13:35 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (61-68-212-105.tpgi.com.au. [61.68.212.105])
 by smtp.gmail.com with ESMTPSA id s8sm3126985pfc.122.2020.08.21.08.13.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2020 08:13:35 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v6 12/12] powerpc/64s/radix: Enable huge vmalloc mappings
Date: Sat, 22 Aug 2020 01:12:16 +1000
Message-Id: <20200821151216.1005117-13-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200821151216.1005117-1-npiggin@gmail.com>
References: <20200821151216.1005117-1-npiggin@gmail.com>
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

