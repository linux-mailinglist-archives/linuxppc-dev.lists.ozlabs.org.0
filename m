Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5802AE9269
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2019 22:54:22 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 472ljR6PqhzF3Z7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2019 08:54:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="e23Up0zA";
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 472kqN54bGzF34T
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Oct 2019 08:14:24 +1100 (AEDT)
Received: by mail-pg1-x541.google.com with SMTP id p12so10507585pgn.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Oct 2019 14:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Wn91QvvOWXGcdAukdBFPOsAS+V9wjbJFfxE/dszqFsM=;
 b=e23Up0zA+FknG/wy6VhmeVSbZB8QZjiX0vsAsUiCjELXoASbot+u6O/Ejby5OAZXcC
 D20Gb77Tr51mlHzmSwSoKEoW2ET0UoL8WLxGdBgnuf4w6xJFYBJGnW///YPOFqwXtqCa
 uskFEoYIZvG0NYVP/lEJT6kwVN4SzBgoCgvaY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Wn91QvvOWXGcdAukdBFPOsAS+V9wjbJFfxE/dszqFsM=;
 b=g61nFV5P3rMTqzwYbLBHGqzyXEKCrUzM9Y9+pWFKIQQhOP70fb0ETvG0y7tNcbmNgD
 la+3KbIlgzcmuLAfXJNMBWEVQ6sLTarNT1t3+OnR2c0GehyC79zgO5nqfHYARbagrtSm
 0xAlfVKOAS/jLqqa9vcXT+y4I57681a5oiYNwWzBmNvMchz+Yo5zUiPE6wg9vfNLrrKm
 BFSnOe+7/TberQ8bEPG9MmRbDB0leFX18juMhxxkeWLUFIoZltN+RSSxLJDKlk2AJfFM
 RHmG7SzjQli7FRRl4D/yVUVN9I81/to+efT8CuwfQgFBoppHHEmVZpIVhPREl+lFf9U7
 2dYQ==
X-Gm-Message-State: APjAAAV4mZE7AIt6yfOqahu/7zaih0wbONitW4EbjoFbsbrm6kvXWrNL
 /W3pPUkExjZcDhF2zt420Ys4hQ==
X-Google-Smtp-Source: APXvYqyvNm7i+bRgKLxrIbvnaiMusgEvUvRAV9KmH69+2MPaKK4I97mcIP1d4LNMzQRr44De1wfu9w==
X-Received: by 2002:a17:90a:854c:: with SMTP id
 a12mr9437017pjw.2.1572383661980; 
 Tue, 29 Oct 2019 14:14:21 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id k24sm149619pgl.6.2019.10.29.14.14.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2019 14:14:20 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Borislav Petkov <bp@alien8.de>
Subject: [PATCH v3 29/29] x86: Use INT3 instead of NOP for linker fill bytes
Date: Tue, 29 Oct 2019 14:13:51 -0700
Message-Id: <20191029211351.13243-30-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191029211351.13243-1-keescook@chromium.org>
References: <20191029211351.13243-1-keescook@chromium.org>
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
 Michal Simek <monstr@monstr.eu>, linux-ia64@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, linuxppc-dev@lists.ozlabs.org,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Andy Lutomirski <luto@kernel.org>,
 linux-alpha@vger.kernel.org, Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-c6x-dev@linux-c6x.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Instead of using 0x90 (NOP) to fill bytes between functions, which makes
it easier to sloppily target functions in function pointer overwrite
attacks, fill with 0xCC (INT3) to force a trap. Also drop the space
between "=" and the value to better match the binutils documentation
https://sourceware.org/binutils/docs/ld/Output-Section-Fill.html#Output-Section-Fill

Example "objdump -d" before:

...
ffffffff810001e0 <start_cpu0>:
ffffffff810001e0:       48 8b 25 e1 b1 51 01    mov 0x151b1e1(%rip),%rsp        # ffffffff8251b3c8 <initial_stack>
ffffffff810001e7:       e9 d5 fe ff ff          jmpq   ffffffff810000c1 <secondary_startup_64+0x91>
ffffffff810001ec:       90                      nop
ffffffff810001ed:       90                      nop
ffffffff810001ee:       90                      nop
ffffffff810001ef:       90                      nop

ffffffff810001f0 <__startup_64>:
...

After:

...
ffffffff810001e0 <start_cpu0>:
ffffffff810001e0:       48 8b 25 41 79 53 01    mov 0x1537941(%rip),%rsp        # ffffffff82537b28 <initial_stack>
ffffffff810001e7:       e9 d5 fe ff ff          jmpq   ffffffff810000c1 <secondary_startup_64+0x91>
ffffffff810001ec:       cc                      int3
ffffffff810001ed:       cc                      int3
ffffffff810001ee:       cc                      int3
ffffffff810001ef:       cc                      int3

ffffffff810001f0 <__startup_64>:
...

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 arch/x86/kernel/vmlinux.lds.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/vmlinux.lds.S b/arch/x86/kernel/vmlinux.lds.S
index b06d6e1188de..3a1a819da137 100644
--- a/arch/x86/kernel/vmlinux.lds.S
+++ b/arch/x86/kernel/vmlinux.lds.S
@@ -144,7 +144,7 @@ SECTIONS
 		*(.text.__x86.indirect_thunk)
 		__indirect_thunk_end = .;
 #endif
-	} :text = 0x9090
+	} :text =0xcccc
 
 	/* End of text section, which should occupy whole number of pages */
 	_etext = .;
-- 
2.17.1

