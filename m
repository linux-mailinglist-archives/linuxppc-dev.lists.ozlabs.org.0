Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B70BF934
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Sep 2019 20:33:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46fNpq0M72zDqvR
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Sep 2019 04:33:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=chromium.org
 (client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com;
 envelope-from=keescook@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="XMqGnRk/";
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46fN0G742hzDqs6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Sep 2019 03:56:30 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id o10so1957669pgs.6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Sep 2019 10:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=boKac6TElydY4R3sQa+G+xBcabSsdI+sqtUCLKc0I3Y=;
 b=XMqGnRk/4L2zV+BAcfMhEdp30WQ7rnrwPghldhN5wojxU6yECwV0QZoiKh6iMFz9u/
 3s0+7zK9FZyUnOl5vKrLaXkQbtdXFR/JEp6wPtBe2BjahHGB5QibvDfI2zsDQKGVGwxT
 0FaowxFjLAW78Z95w7zWRvBJowS42QkoAtE9E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=boKac6TElydY4R3sQa+G+xBcabSsdI+sqtUCLKc0I3Y=;
 b=RC5BDVrpQKnv/wK02mhideULtOUtXqBNERQtvAPQYXH94LbeAV59EBfieicBbQu7/e
 oW7Dob/FA9WEVZfQ5c3Pd6IaE/8k8XIT9lTNsSM8kz0vsRY88VdBWfzapwwBvqNbu1Ik
 q8C9NhwtV0pWBhhrt0JYYpeb29DlrCedr35ieK2Lmtd+QTX8TEsPP+tE3eCooyEUn3x5
 u8avCKiw/b7uBh5fxmPV+PZqkvlZLizto5lJR0H7bwHyQFcPqA0NZRWtwYspBDEUsAAl
 cCU0zL64IY+UBLvzrZxD6KJWATEGEySWU71yVi0Jld+CNu9mBeBFjEe0jT+eltY6dwdX
 2Eng==
X-Gm-Message-State: APjAAAV0ZfX9hpdin5dKzPw4LBxTrXT++9stI7zV9TOY50by5mqkI2l2
 xS/ytxekBawvnFIZp0ZGFII8ig==
X-Google-Smtp-Source: APXvYqw3JiUTFBC2pu3wWAh2sSRbsTCox9kS4uccJrMuCcRqw869/J5FYUi7LMMoz7vy/oYtsvV+iA==
X-Received: by 2002:a62:6489:: with SMTP id y131mr5133495pfb.71.1569520588899; 
 Thu, 26 Sep 2019 10:56:28 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id m136sm7333082pga.94.2019.09.26.10.56.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2019 10:56:26 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 19/29] c6x: Move EXCEPTION_TABLE to RO_DATA segment
Date: Thu, 26 Sep 2019 10:55:52 -0700
Message-Id: <20190926175602.33098-20-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190926175602.33098-1-keescook@chromium.org>
References: <20190926175602.33098-1-keescook@chromium.org>
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Michal Simek <monstr@monstr.eu>, linux-alpha@vger.kernel.org,
 linux-ia64@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-xtensa@linux-xtensa.org,
 linux-kernel@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 linux-parisc@vger.kernel.org, Andy Lutomirski <luto@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>,
 linuxppc-dev@lists.ozlabs.org, linux-c6x-dev@linux-c6x.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The EXCEPTION_TABLE is read-only, so collapse it into RO_DATA.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 arch/c6x/kernel/vmlinux.lds.S | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/c6x/kernel/vmlinux.lds.S b/arch/c6x/kernel/vmlinux.lds.S
index a3547f9d415b..9a09aab63ab3 100644
--- a/arch/c6x/kernel/vmlinux.lds.S
+++ b/arch/c6x/kernel/vmlinux.lds.S
@@ -5,6 +5,9 @@
  *  Copyright (C) 2010, 2011 Texas Instruments Incorporated
  *  Mark Salter <msalter@redhat.com>
  */
+
+#define RO_DATA_EXCEPTION_TABLE_ALIGN	16
+
 #include <asm-generic/vmlinux.lds.h>
 #include <asm/thread_info.h>
 #include <asm/page.h>
@@ -80,8 +83,6 @@ SECTIONS
 		*(.gnu.warning)
 	}
 
-	EXCEPTION_TABLE(16)
-
 	RO_DATA(PAGE_SIZE)
 	.const :
 	{
-- 
2.17.1

