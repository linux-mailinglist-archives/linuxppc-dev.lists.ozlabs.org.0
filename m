Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A76BF903
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Sep 2019 20:16:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46fNR05vNSzDqdw
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Sep 2019 04:16:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=chromium.org
 (client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com;
 envelope-from=keescook@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="bQqqzNyN";
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46fN0B1XVpzDqrq
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Sep 2019 03:56:26 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id w10so1954913pgj.7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Sep 2019 10:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=BEIxyBF1HkRa8rBbPvqIJ09n3nmPR/y1tjhfe0NMzTo=;
 b=bQqqzNyNY7DBO4nvgPSIP04+h5CJyVsKfEvjzJfmS/V4+ODZb0mTUfyJbfgKxlH+Zf
 EcxsjmRdikQWm28aLyIpEcu2zYGeo3BNR4PnBQVxsPQueeDIHFJzMBwlKseyYdE8oNqC
 7R3DrfnnX5WNs3WMSqS/eB2/JT0kHs051Pfd4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=BEIxyBF1HkRa8rBbPvqIJ09n3nmPR/y1tjhfe0NMzTo=;
 b=hUZtn758VLDkL6MrJV0IXTNJVphE2Vc4BeMsvmFgL2s1IMQ0e7rULC8B+VlDykvYNh
 0/z7WoNkNE9Evt/ZMwKrrvXtkzAlf+z8HUgej30KoQXBKSnV57C4mhOyFtpcXqrhGsim
 i/qVtf12oarRvrmLTw+4+/lNQpqPqk9S5PTjTO6ecC3K+tD1pEfy/xSj0aTFbGQK708z
 1I9J/NBhrpqEBJn8OVDaMdC4GbpW7NLGcnBqET7ZzTqaTzq6d+Sl0IdvVbS/Y0MHV/2s
 aAMj6gDmaa6gXvWqpikbwMdZGJF2RZBFxl1g4lumj2TBeOmScSXltIwiCzVDzcETggVF
 //lg==
X-Gm-Message-State: APjAAAXCbLTDqdLNPeDHe/KVE0ReEQbc4v8aI/zykbdKC3JodEiY4bQy
 mFvlKivOIbXg1FNsSmPFArYryg==
X-Google-Smtp-Source: APXvYqyF69hVmYXL8iit7KpAdlylDNRysPjFRUoiDKvaG1bVd3Zxp6WjhsfeNoA0ipdH698250+hQw==
X-Received: by 2002:a62:c102:: with SMTP id i2mr5308106pfg.7.1569520584303;
 Thu, 26 Sep 2019 10:56:24 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id h6sm3791790pfg.123.2019.09.26.10.56.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2019 10:56:21 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 07/29] x86: Restore "text" Program Header with dummy section
Date: Thu, 26 Sep 2019 10:55:40 -0700
Message-Id: <20190926175602.33098-8-keescook@chromium.org>
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

Instead of depending on markings in the section following NOTES to
restore the associated Program Header, use a dummy section, as done
in other architectures. This is preparation for moving NOTES into the
RO_DATA macro.

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

