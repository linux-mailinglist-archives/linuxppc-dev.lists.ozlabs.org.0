Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DFEB82D90A2
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Dec 2020 21:45:09 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CvGjt0vgQzDqRg
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Dec 2020 07:45:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::441;
 helo=mail-wr1-x441.google.com; envelope-from=arielmarcovitch@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=qaaBc6mL; dkim-atps=neutral
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CvCsG4CF3zDqGl
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Dec 2020 05:36:14 +1100 (AEDT)
Received: by mail-wr1-x441.google.com with SMTP id a11so6479786wrr.13
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Dec 2020 10:36:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=tRMxD6v/l4OYj8cB5TYdPB+UxT0+Cs8k23OwIsOoa6w=;
 b=qaaBc6mL2Q1PG70ICvG9frD4YhqrsocLR/cM/kFR3jGKnrG+fif/zDFAmQi9hFcQlC
 Fytf+ZR/DEiH3A1Fj9bz1jElvbtYdQXhnDssenZ+ra82JclYBGMEUdD/zCCDG55uTmvo
 BgWtGXBs26X+tVaBS9MMwa9km2VNmHBhsIIU8azZPxIvArNNJptjjHghci2r91QhDERY
 efM59ssYeoxIVCTZ9GTgwjpqUkclGCFifQsmI6tK7gLZttB8eU8UwK/qomJLDt3jUpiv
 dIQJKrjfE/t9UnLwT8lAKn0vm08nuQve5+tmICg5MZv7uFKwqgEL4NW5/KAJWVNyLBdh
 99qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=tRMxD6v/l4OYj8cB5TYdPB+UxT0+Cs8k23OwIsOoa6w=;
 b=M93FORsLCH5Vq3POpwpcnU6xgK/i686Gv9cE/THOzXgPdqQxucU6bszMQHbu1PJMbE
 JLbEJWAMxvQBkiewm72s9pvN+uSSKwe9q8d6M/JFu0XMWemWBVa1r/lsE/dlEhPmKN+R
 4TvmDMgBK0+HdoXukWqjyaztVLZ8ILqiBfQZfdMBObXHo7txqV7k0pfF8IdvNlM2wsgM
 9uVYq9vcXBbC1i/DU8lwSkuB6UCDQH82Hw20vflzYVWNK8EwAJCZVzP8xdpiC7IoCImN
 uSovK3kxEG5kkf9Me2N1o8U2SCkPoz45Dx6FVslLZpASPOhFIqWMROxtYh5yJBE4zqb6
 Zk3w==
X-Gm-Message-State: AOAM532Y7Ay3xVcFarGGG0uptd8IzeTBNuWbpbRsGEpsOpi6TgYva+NI
 xXfhED3k4o/Vcp2Wzx4yDbQ=
X-Google-Smtp-Source: ABdhPJyCOGMk3hxPAqiAu4T7D/5s0amN+QVqbFuXJL6qvZltKjCzWpjAxNbfC0BKZvhdXjlJ78TPDg==
X-Received: by 2002:adf:b74d:: with SMTP id n13mr25371535wre.101.1607884569599; 
 Sun, 13 Dec 2020 10:36:09 -0800 (PST)
Received: from localhost.localdomain (bzq-109-64-2-78.red.bezeqint.net.
 [109.64.2.78])
 by smtp.gmail.com with ESMTPSA id x7sm19125928wmi.11.2020.12.13.10.36.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Dec 2020 10:36:09 -0800 (PST)
From: Ariel Marcovitch <arielmarcovitch@gmail.com>
X-Google-Original-From: Ariel Marcovitch <ariel.marcovitch@gmail.com>
To: mpe@ellerman.id.au
Subject: [PATCH] powerpc: fix alignment bug whithin the init sections
Date: Sun, 13 Dec 2020 20:35:56 +0200
Message-Id: <20201213183556.16976-1-ariel.marcovitch@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Mon, 14 Dec 2020 07:43:52 +1100
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
Cc: paulus@samba.org, linuxppc-dev@lists.ozlabs.org,
 Ariel Marcovitch <ariel.marcovitch@gmail.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a bug that can cause early crashes in configurations with a
.exit.text section smaller than a page and a .init.text section that
ends in the beginning of a physical page (this is kinda random, which
might explain why this wasn't really encountered before).

The init sections are ordered like this:
	.init.text
	.exit.text
	.init.data

Currently, these sections aren't page aligned.

Because the init code is mapped read-only at runtime and because the
.init.text section can potentially reside on the same physical page as
.init.data, the beginning of .init.data might be mapped read-only along
with .init.text.

Then when the kernel tries to modify a variable in .init.data (like
kthreadd_done, used in kernel_init()) the kernel panics.

To avoid this, I made these sections page aligned.

Fixes: 060ef9d89d18 ("powerpc32: PAGE_EXEC required for inittext")
Signed-off-by: Ariel Marcovitch <ariel.marcovitch@gmail.com>
---
 arch/powerpc/kernel/vmlinux.lds.S | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinux.lds.S
index 326e113d2e45..e3a7c90c03f4 100644
--- a/arch/powerpc/kernel/vmlinux.lds.S
+++ b/arch/powerpc/kernel/vmlinux.lds.S
@@ -179,6 +179,11 @@ SECTIONS
 #endif
 	} :text
 
+	/* .init.text is made RO and .exit.text is not, so we must
+	 * ensure these sections reside in separate physical pages.
+	 */
+	. = ALIGN(PAGE_SIZE);
+
 	/* .exit.text is discarded at runtime, not link time,
 	 * to deal with references from __bug_table
 	 */
@@ -186,6 +191,8 @@ SECTIONS
 		EXIT_TEXT
 	}
 
+	. = ALIGN(PAGE_SIZE);
+
 	.init.data : AT(ADDR(.init.data) - LOAD_OFFSET) {
 		INIT_DATA
 	}

base-commit: 1398820fee515873379809a6415930ad0764b2f6
-- 
2.17.1

