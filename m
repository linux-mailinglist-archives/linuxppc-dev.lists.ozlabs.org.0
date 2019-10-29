Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 699B0E9217
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2019 22:33:27 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 472lFJ3krGzF3Fr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2019 08:33:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="M3a1uKei";
 dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 472kq75ZqSzF34M
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Oct 2019 08:14:11 +1100 (AEDT)
Received: by mail-pl1-x644.google.com with SMTP id q16so8054414pll.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Oct 2019 14:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=/BlCq1vuoPK6b90i9+3dEN0gsbsUxI5XzRVDtU+Y9n4=;
 b=M3a1uKeinpfYILyOgto01x3Z0/Do7xHci3ACE83vFIz62Z9cDjf3QuJSqLQlVdoz5I
 0rW3KKzQ7S0KkakxOpNlTmyhieiHv+YebhpWX4iC97xSOcSmbsnsoy8a6PUwi+eJhllx
 qwaZZ60pVF22RF1UdIfw2PTFkL9ZBlI7t+Doc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=/BlCq1vuoPK6b90i9+3dEN0gsbsUxI5XzRVDtU+Y9n4=;
 b=dHJQjHBYEOUzDTFhT0qTBJzcWcj7VkyVU6zMnDLfEzFMCKsJDtQFhf8yMKjoxWSU6J
 B7b0PjqfNNJDBpKy8HcBxSRnliPgf3XQ/rQ/r9ZecQRQVX//Kic7NJC0bAmWpLBJ4pK9
 r6TzAkmzWDe+QfGAx0nqqO2eFqpz8p5igWIW8rZ4QL3hRXkpHGvflG2m9lJKdi+yfdqx
 v9F4gb51q9ONB4ehq0aRy7VuSbbpHTaIeTa6ekBA43k1gstqXLtJA+QcdWbpSBvxfjZj
 plWgXBlqFVvyfAqdoQs7EsAMPgQ8s2DVJ9LRXJjcELM4ShbbKX6LFtJNmTsV5oHebIGO
 1G1g==
X-Gm-Message-State: APjAAAXt8QZq7h8Hy3/NNelvHl6AbHRbA7zM+gmlGLkOFfS9lGOE1U1H
 k2ALds4AO6aFw7i8WjB5yk3yQQ==
X-Google-Smtp-Source: APXvYqwBlr/dG9EoHmIzcD/284bTMRVUng+VSZNVn2USM8IUIAoIBLGaDuOHmKUNb6KZndWlR52IoQ==
X-Received: by 2002:a17:902:ab82:: with SMTP id f2mr774907plr.39.1572383649691; 
 Tue, 29 Oct 2019 14:14:09 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id z25sm41774pfa.88.2019.10.29.14.14.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2019 14:14:04 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Borislav Petkov <bp@alien8.de>
Subject: [PATCH v3 07/29] x86: Restore "text" Program Header with dummy section
Date: Tue, 29 Oct 2019 14:13:29 -0700
Message-Id: <20191029211351.13243-8-keescook@chromium.org>
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

In a linker script, if once places a section in one or more segments using
":PHDR", then the linker will place all subsequent allocatable sections,
which do not specify ":PHDR", into the same segments. In order to have
the NOTES section in both PT_LOAD (":text") and PT_NOTE (":note"), both
segments are marked, and the only way to to undo this to keep subsequent
sections out of PT_NOTE is to mark the following section with just the
single desired PT_LOAD (":text").

In preparation for having a common NOTES macro, perform the segment
assignment use a dummy section (as done by other architectures).

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 arch/x86/kernel/vmlinux.lds.S | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/vmlinux.lds.S b/arch/x86/kernel/vmlinux.lds.S
index e2feacf921a0..788e78978030 100644
--- a/arch/x86/kernel/vmlinux.lds.S
+++ b/arch/x86/kernel/vmlinux.lds.S
@@ -147,8 +147,9 @@ SECTIONS
 	} :text = 0x9090
 
 	NOTES :text :note
+	.dummy : { *(.dummy) } :text
 
-	EXCEPTION_TABLE(16) :text = 0x9090
+	EXCEPTION_TABLE(16)
 
 	/* .text should occupy whole number of pages */
 	. = ALIGN(PAGE_SIZE);
-- 
2.17.1

