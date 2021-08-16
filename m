Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2C73ED02D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Aug 2021 10:25:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gp6g71gkmz3cmC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Aug 2021 18:25:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Bqf1N9dH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f;
 helo=mail-pl1-x62f.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Bqf1N9dH; dkim-atps=neutral
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gp6dm3hSDz30GQ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Aug 2021 18:24:28 +1000 (AEST)
Received: by mail-pl1-x62f.google.com with SMTP id e19so19905196pla.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Aug 2021 01:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KsROo587+qUywH1jdAFJy4E7RhcZdUyJiBb0LnvzW6Y=;
 b=Bqf1N9dH2SdY59JXtefRr98iXsV/ZUeklQeqsBPlN6T1ZAW+4OKfdVC4wUgdrFNpcI
 XpKuMisWA18ZMuXqh3/kJj1w4Lqtchmo1tvArJ2VZie6YA1iQ962fn3VU2ph8Uu3dzsX
 kWvorj2T/SKa15zSEZu0a2OYleA/FMnZxcWNMqhYA9GXDekdmYWLhsubyRamMXuVneN7
 qBs3+Fu21qUT/R674ivPy+1jDr7leSB9P6xzURCQwoi3OBswIzM0hTy+CQUgMX4+0sN+
 1tbxPk1CX7GpDTtYkCE0hWhakBKAXNOrIzD88K0qdWxPJndzFeBqwWA+GCkufB9Tpduz
 NwXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=KsROo587+qUywH1jdAFJy4E7RhcZdUyJiBb0LnvzW6Y=;
 b=Ld+rylZOPU381dsK7QfGtcgy+3bEBGCdOw8ViJprVILncM1vtFV4bC5msMspeZzXHW
 Fh4nJ4yxb+0Ko6EBvo6UTL8bLo79Y8wlvPIlc8kdJYG5F/wKmT/TnRw+LGvl/IFLKmaE
 +Dqu8YI7hklqufpoIvOfPjnBhDlMiZCRzjJe6kGUOeW+G7FTnE8FuGg3GdJRo/NhIo/d
 2sWClLhedpCmFJS+QzScQyQVwTcGT/ObIqhINynvKx6UCsNkMABvm/IjD3126vxk0mH0
 caQd7Go1H8Uwz4ifoQY4f4CvUt9B8e0I64X4YgKBuFB7S53wWXG5rbAvMk3zcEK1eSok
 c2jg==
X-Gm-Message-State: AOAM531G78TDv6fpcVptY0JlDyBsKGYXzydP0c3XhWNmLhZVX00MmYD6
 b4RW5Tz21WQ5mA7Axv3tRtY=
X-Google-Smtp-Source: ABdhPJzfvD9NOO7s9sJOJCOmv/el5BCm0xPeCQj7QVr71F6aM4AVc8if6v3lOBwTyD5BOWPiApNpzQ==
X-Received: by 2002:a17:90b:33d1:: with SMTP id
 lk17mr4932854pjb.83.1629102266366; 
 Mon, 16 Aug 2021 01:24:26 -0700 (PDT)
Received: from voyager.lan ([45.124.203.15])
 by smtp.gmail.com with ESMTPSA id u24sm10542358pfm.85.2021.08.16.01.24.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 01:24:25 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Paul Mackerras <paulus@samba.org>, Michael Neuling <mikey@neuling.org>,
 Anton Blanchard <anton@ozlabs.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/3] powerpc/64s: Fix build when !PPC_BARRIER_NOSPEC
Date: Mon, 16 Aug 2021 17:54:01 +0930
Message-Id: <20210816082403.2293846-2-joel@jms.id.au>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210816082403.2293846-1-joel@jms.id.au>
References: <20210816082403.2293846-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When disabling PPC_BARRIER_NOSPEC the do_barrier_nospec_fixups_range
definition is still included, as well as a stub in asm/setup.h:

../arch/powerpc/lib/feature-fixups.c:502:6: error: redefinition of ‘do_barrier_nospec_fixu>
  502 | void do_barrier_nospec_fixups_range(bool enable, void *fixup_start, void *fixup_en>
      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../arch/powerpc/lib/feature-fixups.c:23:
../arch/powerpc/include/asm/setup.h:70:20: note: previous definition of ‘do_barrier_nospec>
   70 | static inline void do_barrier_nospec_fixups_range(bool enable, void *start, void *>
      |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

I assume the intent was to put the just do_barrier_nospec_fixups
behind PPC_BARRIER_NOSPEC and let the compiler drop _range when there
are no users. (There is a caller in module.c, but this is behind
PPC_BARRIER_NOSPEC).

This makes PPC_BOOK3S_64 match how the PPC_FSL_BOOK3E build works.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/powerpc/include/asm/setup.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/powerpc/include/asm/setup.h b/arch/powerpc/include/asm/setup.h
index 6c1a7d217d1a..71012284c044 100644
--- a/arch/powerpc/include/asm/setup.h
+++ b/arch/powerpc/include/asm/setup.h
@@ -66,8 +66,6 @@ extern bool barrier_nospec_enabled;
 
 #ifdef CONFIG_PPC_BARRIER_NOSPEC
 void do_barrier_nospec_fixups_range(bool enable, void *start, void *end);
-#else
-static inline void do_barrier_nospec_fixups_range(bool enable, void *start, void *end) { }
 #endif
 
 #ifdef CONFIG_PPC_FSL_BOOK3E
-- 
2.32.0

