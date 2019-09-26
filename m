Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 138B4BF9BC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Sep 2019 21:03:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46fPTG0fJZzDqRs
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Sep 2019 05:03:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=chromium.org
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=keescook@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="ftNNGKyt";
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46fNBd0ffYzDqfN
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Sep 2019 04:05:28 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id z12so1958934pgp.9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Sep 2019 11:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=UZe87vLT1sniPvXW68EajTgvCPzHcGOx1KtJdkMO+C4=;
 b=ftNNGKytJacyrySBqQdQBy+Wtbqo4hjOH8JbjKAUhiSKwHnh85Hu/NyJx15BBuO1wF
 yvNx/PBqQnIZ6l+s3uDBiFHBJFB+mgrq10000RAmGyv/9dd3TBhxlAe1FDs1ODYyqFBp
 20hAVjREm+IqibqFYhMmuhOtQ05fbch5Col5A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=UZe87vLT1sniPvXW68EajTgvCPzHcGOx1KtJdkMO+C4=;
 b=uRrjaozlFx0Pzql7urhCpLb82bWmd7/GKCa4HBnv/FwDkgjCEUHyGbTER3BSyMB+zf
 7H8zl1YM/QtEV+VcUbDp/Rwtfz+UDZaiPs25bLBoZT9eLfN8KsFtuhr9Cx8pUEqaGW1G
 sZoyKbSIHUXkBowKQorbpMefWsZhf+myJ0Joi/vX4Qq/XoCiooL3YxinOJwwOHzQFLXv
 9KaH/fRn0xMAi9AizPCb9eeB0veOP4VtZ/Yfjbk4oESm4+gdYcmCWVNDuhmtuFLqd4Rc
 gdu7oBEfZDE4ujEiWlxMsWILRLUipTt8mDNBU/9lLuQ447kr+Na8R7WHcruoy04uZu1/
 GT4g==
X-Gm-Message-State: APjAAAWPaUNMs1xeVH8nEkdXqY3vAQ+YUR+P+dL9lt10ImUbG68B65SP
 yd8hIWdWp6JGuwkM5jVX4xxC+Q==
X-Google-Smtp-Source: APXvYqxQ+qIP8fVJv40/72tfoaela/T+aeXyqhEWc1AJXKMb1mslUhfwVxI+PEohiV5y6ZiRW2Bx2Q==
X-Received: by 2002:a65:5689:: with SMTP id v9mr4732387pgs.228.1569521124506; 
 Thu, 26 Sep 2019 11:05:24 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id p17sm5229278pfn.50.2019.09.26.11.05.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2019 11:05:23 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 21/29] ia64: Move EXCEPTION_TABLE to RO_DATA segment
Date: Thu, 26 Sep 2019 10:55:54 -0700
Message-Id: <20190926175602.33098-22-keescook@chromium.org>
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
 arch/ia64/kernel/vmlinux.lds.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/ia64/kernel/vmlinux.lds.S b/arch/ia64/kernel/vmlinux.lds.S
index 0d86fc8e88d5..18a732597112 100644
--- a/arch/ia64/kernel/vmlinux.lds.S
+++ b/arch/ia64/kernel/vmlinux.lds.S
@@ -6,6 +6,7 @@
 #include <asm/thread_info.h>
 
 #define EMITS_PT_NOTE
+#define RO_DATA_EXCEPTION_TABLE_ALIGN	16
 
 #include <asm-generic/vmlinux.lds.h>
 
@@ -70,7 +71,6 @@ SECTIONS {
 	/*
 	 * Read-only data
 	 */
-	EXCEPTION_TABLE(16)
 
 	/* MCA table */
 	. = ALIGN(16);
-- 
2.17.1

