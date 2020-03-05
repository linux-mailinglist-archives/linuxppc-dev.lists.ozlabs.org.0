Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C971217B203
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Mar 2020 00:01:55 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48YR8J5lLfzDqs6
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Mar 2020 10:01:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.160.194;
 helo=mail-qt1-f194.google.com; envelope-from=niveditas98@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=alum.mit.edu
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
 [209.85.160.194])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48YDfR1Q5szDqgS
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Mar 2020 02:08:41 +1100 (AEDT)
Received: by mail-qt1-f194.google.com with SMTP id v22so4336698qtp.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Mar 2020 07:08:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m1v7KEH8H8EEgDnDnnlGNlXFsnNQAqOhZZNudokQ2Po=;
 b=bM+tLYTrLYWj5E1C1t5WAN+KJasLuftiNNDrc/AMrg6AFUBaXDGKrp+D6CC+D2JR56
 McVFie9NRt+YEw6Lo1GhmRNSLwP1eoxlRFvK6C8WsLTUBE9TlCQoAzylUl0Hb4H/cEIf
 kiunINxUilTP1+Pq+lVyOiua5XVZsKmpA/RF+uS1dMTg7M+2EdOSKPfl6lhFeu3L5syi
 4cazjfZdsbLPz4muNt88cKWk65xx3HEVLNu6LbU9qVgZ2nWyBFS/qu5Q21luTJeXZHkw
 gJQaE4XzNVP0iw8WAcMrgQ2UDk/0kXaUKY2syNxemn6bCCiKeIKqUaJyRpH7wTV5GCpn
 PK2A==
X-Gm-Message-State: ANhLgQ1JKEQaollBf8nkE8ghlu8PTVp+By7Wy4emiz9XUZQdFLtt/ZLA
 SCxRxYORPEep+HkAkkkTczM=
X-Google-Smtp-Source: ADFU+vuOS2xZwbWZs6qEQtovSh6AUFl9WlSPml+IgYmIWtqCd0kt/sKG334d9lzu+FpmW4dkIw7TEw==
X-Received: by 2002:ac8:4408:: with SMTP id j8mr7637069qtn.3.1583420918447;
 Thu, 05 Mar 2020 07:08:38 -0800 (PST)
Received: from rani.riverdale.lan ([2001:470:1f07:5f3::b55f])
 by smtp.gmail.com with ESMTPSA id n46sm266850qtb.48.2020.03.05.07.08.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 07:08:37 -0800 (PST)
From: Arvind Sankar <nivedita@alum.mit.edu>
To: Kees Cook <keescook@chromium.org>
Subject: [PATCH] powerpc/32: Stop printing the virtual memory layout
Date: Thu,  5 Mar 2020 10:08:37 -0500
Message-Id: <20200305150837.835083-1-nivedita@alum.mit.edu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <202003021038.8F0369D907@keescook>
References: <202003021038.8F0369D907@keescook>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 06 Mar 2020 10:00:06 +1100
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
Cc: Tycho Andersen <tycho@tycho.ws>, kernel-hardening@lists.openwall.com,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org, "Tobin C . Harding" <me@tobin.cc>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

For security, don't display the kernel's virtual memory layout.

Kees Cook points out:
"These have been entirely removed on other architectures, so let's
just do the same for ia32 and remove it unconditionally."

071929dbdd86 ("arm64: Stop printing the virtual memory layout")
1c31d4e96b8c ("ARM: 8820/1: mm: Stop printing the virtual memory layout")
31833332f798 ("m68k/mm: Stop printing the virtual memory layout")
fd8d0ca25631 ("parisc: Hide virtual kernel memory layout")
adb1fe9ae2ee ("mm/page_alloc: Remove kernel address exposure in free_reserved_area()")

Signed-off-by: Arvind Sankar <nivedita@alum.mit.edu>
---
 arch/powerpc/mm/mem.c | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index ef7b1119b2e2..df2c143b6bf7 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -331,23 +331,6 @@ void __init mem_init(void)
 #endif
 
 	mem_init_print_info(NULL);
-#ifdef CONFIG_PPC32
-	pr_info("Kernel virtual memory layout:\n");
-#ifdef CONFIG_KASAN
-	pr_info("  * 0x%08lx..0x%08lx  : kasan shadow mem\n",
-		KASAN_SHADOW_START, KASAN_SHADOW_END);
-#endif
-	pr_info("  * 0x%08lx..0x%08lx  : fixmap\n", FIXADDR_START, FIXADDR_TOP);
-#ifdef CONFIG_HIGHMEM
-	pr_info("  * 0x%08lx..0x%08lx  : highmem PTEs\n",
-		PKMAP_BASE, PKMAP_ADDR(LAST_PKMAP));
-#endif /* CONFIG_HIGHMEM */
-	if (ioremap_bot != IOREMAP_TOP)
-		pr_info("  * 0x%08lx..0x%08lx  : early ioremap\n",
-			ioremap_bot, IOREMAP_TOP);
-	pr_info("  * 0x%08lx..0x%08lx  : vmalloc & ioremap\n",
-		VMALLOC_START, VMALLOC_END);
-#endif /* CONFIG_PPC32 */
 }
 
 void free_initmem(void)
-- 
2.24.1

