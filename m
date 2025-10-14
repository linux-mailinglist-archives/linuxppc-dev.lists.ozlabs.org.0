Return-Path: <linuxppc-dev+bounces-12853-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57453BD9898
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Oct 2025 15:06:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cmDx21sYjz3cZ0;
	Wed, 15 Oct 2025 00:05:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760447158;
	cv=none; b=oOSB2BcTUmyYzw0nld/3VMtuXoffGgPx46CtzONHiZibeQjDQidcc/hyATOiWQqmMUP/2VsS+LosYlfjKlcu8BHPDEFVc+WyLtpDv0fuRFh2Fygfb8QHEudmp/5ft9cDDgOCEvnvvqfmpjGoUATo2mrDmtiAX5qXEQJwFuFj6tm9J63fF4WknMyyzy7vn+D0tG0ebMxl11QQYJNHvEi9r7xk7q0CJtOt3CFDk+BIbaWoR+/PfMIM79jsvYdnPbGisNfltECjR3wvGaw230E6I8avgAxbY8mfEv0ghj/ZLrJ1BGZwiZHZT8+UgkdKA3xpOHLyCw+dTv457xy50rSKPg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760447158; c=relaxed/relaxed;
	bh=1KptW+UoLghQMXOrNEBqzO3AErvEefbVuNoRlZvx97M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kr4WctgUqRw3DWX+8HKqB9Kxe6mIimc6k2N1rK8dCDkNlAFSyF/EahSTN9XxC1GCGAHfex4HEanrJELznqWZpMF7O6M4HBX82Z3h8xnjX9VdTa3vf2PmPsxSwr8tt/Exp5FxJdX79XSR40j+2Kr+TuvNJyi9RF4D5UhxTAoeiHrBeuRcV0/m/ZdlPVB9QbbOOWMs5fYD9FLCUu7s7hoMt35HXau9j0i/YnQMd2m50z/PRntb7W2xjRijL7ff80SKCHkp1pl2WO6Oxxfflsz/xDn+Sy8VkOneRHi80I4sMu36NsUcAlYL902vvdJgKbbyUfci+usG+xJ66naNcH/mzw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=oiNyH0Pr; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=IoJDo/mz; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=oiNyH0Pr;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=IoJDo/mz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4cmDx06JGpz3cBW
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Oct 2025 00:05:56 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1760447151;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1KptW+UoLghQMXOrNEBqzO3AErvEefbVuNoRlZvx97M=;
	b=oiNyH0PrK2xokgY/xRhYNh34O73m7EA1Pd8tkaIavxgzOcrBF7zJ4XwQGBgGA5DU2iz/p7
	zaGrtCdce56tduJqMybiZ6QG81A0ZQoupCxGlAwsyLQaqgfxVGfsM9/jLWqA5EKNwbRviH
	ZcWmsSCz6F37BEIeuvksoJuw7QI4dksDTXdACC039A6SeRr9w44U1McKyStTT7JU6BDLT9
	fu+6KJ/VYtPYJpN6wgaxmMvup8Sz40YT7m3JkJyhA2oGzQBYdyA04l/0xeG5lNAxGNdfi8
	Ol3MFMaZqs2RgzvuGUPde8NSabkiWpQDYKdLZ/OF0rB3VyPDWC6X3folzw0Qtg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1760447151;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1KptW+UoLghQMXOrNEBqzO3AErvEefbVuNoRlZvx97M=;
	b=IoJDo/mzsy5EWQOiAfu4TeoGsMkP1SmEZRcdfUfHvULsIDGeDHduiJKKAnuHzb9T9FPVhM
	9Bvuta2MxEAH+oDw==
Date: Tue, 14 Oct 2025 15:05:17 +0200
Subject: [PATCH v2 02/10] init: deduplicate cc-can-link.sh invocations
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251014-kbuild-userprogs-bits-v2-2-faeec46e887a@linutronix.de>
References: <20251014-kbuild-userprogs-bits-v2-0-faeec46e887a@linutronix.de>
In-Reply-To: <20251014-kbuild-userprogs-bits-v2-0-faeec46e887a@linutronix.de>
To: Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>, Nicolas Schier <nsc@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Masahiro Yamada <masahiroy@kernel.org>, linux-riscv@lists.infradead.org, 
 linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760447149; l=1820;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=cw6izJuCa9EwT35MsVWlQDliEz9mJYF0jA7XnDSqJhQ=;
 b=qMY3Zy0dOvDZ1jAtW9lSVtESua5rKfZ3bqAQERTzgb0DzSXGykCYkjWMB+HI0PnYvxaG/bwqb
 20TGDGAlQTbAqfhSInd0ke9McDq+UPb7BHmRRYxbey9/g06LyFjbTwr
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The command to invoke scripts/cc-can-link.sh is very long and new usages
are about to be added.

Add a helper variable to make the code easier to read and maintain.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 init/Kconfig            | 4 ++--
 scripts/Kconfig.include | 3 +++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/init/Kconfig b/init/Kconfig
index cab3ad28ca49e7ac930207c9cde8d431d55dc7af..7b722e714d5c5a0580467914b226dc0700ec0797 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -84,8 +84,8 @@ config RUSTC_LLVM_VERSION
 
 config CC_CAN_LINK
 	bool
-	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(USERCFLAGS) $(USERLDFLAGS) $(m64-flag)) if 64BIT
-	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(USERCFLAGS) $(USERLDFLAGS) $(m32-flag))
+	default $(cc_can_link_user,$(m64-flag)) if 64BIT
+	default $(cc_can_link_user,$(m32-flag))
 
 # Fixed in GCC 14, 13.3, 12.4 and 11.5
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=113921
diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
index 33193ca6e8030e659d6b321acaea1acd42c387a4..d42042b6c9e243b46d1626d892c0c986621ce462 100644
--- a/scripts/Kconfig.include
+++ b/scripts/Kconfig.include
@@ -65,6 +65,9 @@ cc-option-bit = $(if-success,$(CC) -Werror $(1) -E -x c /dev/null -o /dev/null,$
 m32-flag := $(cc-option-bit,-m32)
 m64-flag := $(cc-option-bit,-m64)
 
+# Test whether the compiler can link userspace applications
+cc_can_link_user = $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(USERCFLAGS) $(USERLDFLAGS) $(1))
+
 rustc-version := $(shell,$(srctree)/scripts/rustc-version.sh $(RUSTC))
 rustc-llvm-version := $(shell,$(srctree)/scripts/rustc-llvm-version.sh $(RUSTC))
 

-- 
2.51.0


