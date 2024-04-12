Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8148A34A8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Apr 2024 19:26:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LHLibPGV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VGNlK49tCz3vgD
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Apr 2024 03:26:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LHLibPGV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VGNkY4lN7z3dRt
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Apr 2024 03:25:40 +1000 (AEST)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-6ecf05fd12fso1084965b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Apr 2024 10:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712942737; x=1713547537; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HjzGIdwynrF1PNBlgazOQendQEVwSDRXROl5YwY+fIc=;
        b=LHLibPGV47MCSZSe9K9/BB7w5UesTOaClBbMXlFnJRkoXtC06oF9l4noNylyofVbFK
         ixmDv/ss1zNKXdRfoclVAGDz/ZJ2GFaxghAIlrqLXxI9ujd3ptTIZigs3UuAnO/VSBK0
         8sTZNpdcKKTSde5HBbbYWoW6pbysNzVQf387xwnMeIEqawg57qFhvdmsoh4QXdPwpbBP
         PlnvM/W/+Ff7qM7XIp5txIKa8D7UOrs+MYOwK+7LBOrU7gvfHYxN05q8+HDIr0YbyQxC
         TJYe1HO9oaLyvEJb4mCz9INjlLo4Z8H8V5qJHUEFHCfz0KAyOqc21O3P9030r5qcd4c2
         iuIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712942737; x=1713547537;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HjzGIdwynrF1PNBlgazOQendQEVwSDRXROl5YwY+fIc=;
        b=MJK79DqXvoIApAhN8NyApGsx8xZ+lL50PpDcZHEwXkUb0Jw3YH3dl0L8J8OC0+/TgR
         xLdHbcsjt38UKYNkHMDiT0/Cif3/Ud6ZpxapMe5mfbwPHoXKhpNsgbwGzoBexSCGtB9G
         JhX2CmAK5N4i+jWWb7BpnG/ZDIw1qY0o8ZooWVvXDSkNV4foSgqFfsLdWpoAtU58FcmL
         T41zHa+EVy/F7yLQec/MfISvPhcZmHOoiOA0DXfsMoogSEMW0AbAKS5/MfQNDjCJX+oT
         UfxeOhASeRDM4U/J6Eef/g2784WXIHbI2dtLjBYeFaL8HSnPthmxs0njCyEztS/0WDuk
         31gA==
X-Gm-Message-State: AOJu0YyqCJ+c7yFstyG0QqqKMLXWZLDwdjrtfeyoJdXAFNJ2Vcgfilim
	6Is0lA9OtqgSsgVMDmPNYYlGx1doDNBRrrJ8rYepDiwVLua1uW8fSY+jyw==
X-Google-Smtp-Source: AGHT+IGsqxwXPZXX8P+CZ3kVtCcZ/YExUQdy4GeceuZl0MgQ89bt98WxdeZy1XVN6W7HSCTaAxihwA==
X-Received: by 2002:a05:6a20:7347:b0:1a9:9cf2:69c0 with SMTP id v7-20020a056a20734700b001a99cf269c0mr4194908pzc.34.1712942736791;
        Fri, 12 Apr 2024 10:25:36 -0700 (PDT)
Received: from wheely.local0.net (27-32-61-172.tpgi.com.au. [27.32.61.172])
        by smtp.gmail.com with ESMTPSA id i14-20020a056a00004e00b006ed97aa7975sm3107658pfk.111.2024.04.12.10.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 10:25:36 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH] powerpc: Optimise barriers for fully ordered atomics
Date: Sat, 13 Apr 2024 03:25:26 +1000
Message-ID: <20240412172529.783268-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.43.0
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Fully ordered" atomics (RMW that return a value) are said to have a
full barrier before and after the atomic operation. This is implemented
as:

  hwsync
  larx
  ...
  stcx.
  bne-
  hwsync

This is slow on POWER processors because hwsync and stcx. require a
round-trip to the nest (~= L2 cache). The hwsyncs can be avoided with
the sequence:

  lwsync
  larx
  ...
  stcx.
  bne-
  isync

lwsync prevents all reorderings except store/load reordering, so the
larx could be execued ahead of a prior store becoming visible. However
the stcx. is a store, so it is ordered by the lwsync against all prior
access and if the value in memory had been modified since the larx, it
will fail. So the point at which the larx executes is not a concern
because the stcx. always verifies the memory was unchanged.

The isync prevents subsequent instructions being executed before the
stcx. executes, and stcx. is necessarily visible to the system after
it executes, so there is no opportunity for it (or prior stores, thanks
to lwsync) to become visible after a subsequent load or store.

This sequence requires only one L2 round-trip and so is around 2x faster
measured on a POWER10 with back-to-back atomic ops on cached memory.

[ Remains to be seen if this is always faster when there is other activity
going on, and if it's faster on non-POEWR CPUs or perhaps older ones
like 970 that might not optimise isync so much. ]

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/synch.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/synch.h b/arch/powerpc/include/asm/synch.h
index b0b4c64870d7..0b1718eb9a40 100644
--- a/arch/powerpc/include/asm/synch.h
+++ b/arch/powerpc/include/asm/synch.h
@@ -60,8 +60,8 @@ static inline void ppc_after_tlbiel_barrier(void)
 	MAKE_LWSYNC_SECTION_ENTRY(97, __lwsync_fixup);
 #define PPC_ACQUIRE_BARRIER	 "\n" stringify_in_c(__PPC_ACQUIRE_BARRIER)
 #define PPC_RELEASE_BARRIER	 stringify_in_c(LWSYNC) "\n"
-#define PPC_ATOMIC_ENTRY_BARRIER "\n" stringify_in_c(sync) "\n"
-#define PPC_ATOMIC_EXIT_BARRIER	 "\n" stringify_in_c(sync) "\n"
+#define PPC_ATOMIC_ENTRY_BARRIER "\n" stringify_in_c(LWSYNC) "\n"
+#define PPC_ATOMIC_EXIT_BARRIER	 "\n" stringify_in_c(isync) "\n"
 #else
 #define PPC_ACQUIRE_BARRIER
 #define PPC_RELEASE_BARRIER
-- 
2.43.0

