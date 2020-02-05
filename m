Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 76001152455
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Feb 2020 01:58:40 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48C38s1g8YzDqQy
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Feb 2020 11:58:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=maskray@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=JUhe3AKH; dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48C30D55vvzDqL4
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Feb 2020 11:51:00 +1100 (AEDT)
Received: by mail-pl1-x643.google.com with SMTP id t6so127911plj.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Feb 2020 16:51:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=xx/Hr3yEcha35uFKz8KW9UBIGlBl9yxxGD/Ht51bCag=;
 b=JUhe3AKHAQbOZIQ0eNn+wAM8JAgL0Ssx9uCzEIYHRsMQ5X+Oxe84h0ULRtw9jnbhS1
 T+NQdyQOkUOxlnuVOeguzvRKgEJbW6YZaI9iIez/rkX5ii3l5rskS2BnkS9K9JE4o0a3
 J4etdJCQERSWNak0CGgoPvV4l8mwHAk43v7RwzNKCD32NP0SMx6/vUM+7a1roJlRB7Cq
 jdiqC1oa/paLnFZ2aC+N96AtJqgW9819DHfnYO6oOTdG6AGnz4MSQmBaGCw8ajB6Lta1
 K98FJGKB2SiFy9IAuidogj8YOG4TnlbFZ+V6jGr/RVuf9kgNKKW2yR1542rv/e/CqpRv
 o07g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=xx/Hr3yEcha35uFKz8KW9UBIGlBl9yxxGD/Ht51bCag=;
 b=swDitbBgv4VXyO5GzUfsPu0Gy8+pfnk3Z3mKhbFDuJc4npafzL278hQxL/kaCFq+sR
 W/mOXHyhETIQwjLTxsCw/DJnBvRWFsQuqKV3ZNGc8US3NRu2tWI2OecH4AtVrzNQcKU2
 0SzMa80kbUKyDKg+fPMiZonp5dw+MiHT6GVwhyEYtpqCYSgksvF4ErdoOQtE2qD/hOks
 0tInQ/UQRjRxgZaAQkXq1DXxN9Z4Ewj3jVVwYNa2+8BcM0g+Y0SRIFtt1xguYuE3v4jJ
 FD4tvsb2O422r0DZ6OvzenaZk9Z7foxLUdKEZAUtr1+np1C9l7X+7ueawsbnVlkHQNJy
 MCRA==
X-Gm-Message-State: APjAAAWQT2IW6QhB3IP7qg/WV8ZgTZ6whEq0Gg4P72Ac6a+AGEwycam1
 G8BiUKDp7rSAc0H2gayJVATHfQ==
X-Google-Smtp-Source: APXvYqzPK07gRufHI/PmLMyzBB0+GO6DbDSzvLF2bYKCZP3DpDOUeUFN2CY18edqckMlDeHNn/MkJg==
X-Received: by 2002:a17:90a:cb11:: with SMTP id
 z17mr2406433pjt.122.1580863857220; 
 Tue, 04 Feb 2020 16:50:57 -0800 (PST)
Received: from google.com ([2620:15c:2ce:0:9efe:9f1:9267:2b27])
 by smtp.gmail.com with ESMTPSA id f81sm24626828pfa.118.2020.02.04.16.50.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2020 16:50:56 -0800 (PST)
Date: Tue, 4 Feb 2020 16:50:54 -0800
From: Fangrui Song <maskray@google.com>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH] powerpc/vdso32: mark __kernel_datapage_offset as STV_PROTECTED
Message-ID: <20200205005054.k72fuikf6rwrgfe4@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailman-Approved-At: Wed, 05 Feb 2020 11:57:17 +1100
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
Cc: clang-built-linux@googlegroups.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Fangrui Song <maskray@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

A PC-relative relocation (R_PPC_REL16_LO in this case) referencing a
preemptible symbol in a -shared link is not allowed.  GNU ld's powerpc
port is permissive and allows it [1], but lld will report an error after
https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/commit/?id=ec0895f08f99515194e9fcfe1338becf6f759d38

Make the symbol protected so that it is non-preemptible but still
exported.

[1]: https://sourceware.org/bugzilla/show_bug.cgi?id=25500

Link: https://github.com/ClangBuiltLinux/linux/issues/851
Signed-off-by: Fangrui Song <maskray@google.com>
---
 arch/powerpc/kernel/vdso32/datapage.S | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/vdso32/datapage.S b/arch/powerpc/kernel/vdso32/datapage.S
index 217bb630f8f9..2831a8676365 100644
--- a/arch/powerpc/kernel/vdso32/datapage.S
+++ b/arch/powerpc/kernel/vdso32/datapage.S
@@ -13,7 +13,8 @@
 #include <asm/vdso_datapage.h>
 
 	.text
-	.global	__kernel_datapage_offset;
+	.global	__kernel_datapage_offset
+	.protected	__kernel_datapage_offset
 __kernel_datapage_offset:
 	.long	0
 
-- 
2.25.0.341.g760bfbb309-goog

