Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ADEBBF92D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Sep 2019 20:29:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46fNk70mxBzDqwL
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Sep 2019 04:29:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=chromium.org
 (client-ip=2607:f8b0:4864:20::544; helo=mail-pg1-x544.google.com;
 envelope-from=keescook@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="odBS6czN";
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46fN0F60YlzDqqW
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Sep 2019 03:56:29 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id i30so1989111pgl.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Sep 2019 10:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=sVPOVPq0jGnDyk9BlFn1nbib25butANPcZ2psxH1XQk=;
 b=odBS6czNjAFbywCHRPpPNeXtF6OPc2mmJ7PZLPLZJwd6gvLuxf+a4qKWHGXqogA0yi
 p2vEtxVP/XOxYN9zPFrI5aP6IZ37YGa0bwxcd1Y/fvdWegAkmT28yuhfe+dV29/aNHth
 17TyUbj6jzLSgZ65Pr6zSq3TqTL6Z/E1LQYkg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=sVPOVPq0jGnDyk9BlFn1nbib25butANPcZ2psxH1XQk=;
 b=RHf4/p7GM8hF/JdK/hnUnhNa2w0UzSdzkzvoSQKiPPtTI8HArHYc+QZ9R3DlIhBrSI
 NMlgEkR/sp9QtThXJNPNttmbbXLPeEV0r1TXTJqXbSZ/O9Ne91Nn64mjr7C4yjrW6B06
 T4G0408gawFnYVOP6YEsNZvtkg46On+v/ki6R3kD/81z1Stye8r5txA5G730Rl2D1MCR
 H0X80EUfky6zf/Ib+DsfouRDQGfKF1BPSyRwT0eTEFQToBnaesLRIqXaxFDMkWT+0sKD
 CaghQcKbXktPstdxGO+UjWyGq9v5R2jRhvdltBhTsVdcdtxh3i+l3rNekjkidWM+s0TG
 mHJQ==
X-Gm-Message-State: APjAAAWKD9jbdtWgp7HMmQ+yNxcP14Qz9TucaujVzjQtGacVJpgEIvC0
 +JEJX4dbDA8tvFgKVDXDUJdRAg==
X-Google-Smtp-Source: APXvYqxubPgpOdgeHae/TiPTi3EhrP4iQjDpvLFArEZMN+uNbmRmza3nNTs+U0Mb+pu60jodhZwxMA==
X-Received: by 2002:a17:90a:2481:: with SMTP id
 i1mr4939410pje.77.1569520587801; 
 Thu, 26 Sep 2019 10:56:27 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id v19sm3224270pff.46.2019.09.26.10.56.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2019 10:56:26 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 18/29] arm64: Move EXCEPTION_TABLE to RO_DATA segment
Date: Thu, 26 Sep 2019 10:55:51 -0700
Message-Id: <20190926175602.33098-19-keescook@chromium.org>
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
 arch/arm64/kernel/vmlinux.lds.S | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.lds.S
index 81d94e371c95..c6ba2eee0ee8 100644
--- a/arch/arm64/kernel/vmlinux.lds.S
+++ b/arch/arm64/kernel/vmlinux.lds.S
@@ -5,6 +5,8 @@
  * Written by Martin Mares <mj@atrey.karlin.mff.cuni.cz>
  */
 
+#define RO_DATA_EXCEPTION_TABLE_ALIGN	8
+
 #include <asm-generic/vmlinux.lds.h>
 #include <asm/cache.h>
 #include <asm/kernel-pgtable.h>
@@ -135,8 +137,8 @@ SECTIONS
 	. = ALIGN(SEGMENT_ALIGN);
 	_etext = .;			/* End of text section */
 
-	RO_DATA(PAGE_SIZE)		/* everything from this point to     */
-	EXCEPTION_TABLE(8)		/* __init_begin will be marked RO NX */
+	/* everything from this point to __init_begin will be marked RO NX */
+	RO_DATA(PAGE_SIZE)
 
 	. = ALIGN(PAGE_SIZE);
 	idmap_pg_dir = .;
-- 
2.17.1

