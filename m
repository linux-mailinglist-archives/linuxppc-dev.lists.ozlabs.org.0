Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 063CFD59B7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2019 04:58:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46s3Ch5RYYzDqTY
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2019 13:58:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::244; helo=mail-oi1-x244.google.com;
 envelope-from=natechancellor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="DAHcZpcH"; 
 dkim-atps=neutral
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46s33f41m0zDqRy
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2019 13:51:26 +1100 (AEDT)
Received: by mail-oi1-x244.google.com with SMTP id m16so12555925oic.5
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Oct 2019 19:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ELg5bkMi+FoappyTCFIUx1Rg8zAW2tMRA+teB43Z1gY=;
 b=DAHcZpcHRxIEH+BjxCNkrpahqtOtpNE8Wov9Ku5GbbLrWCYS6wZZY8TxY5xsTvnRcI
 cx/tv3jnL40q4qAna6T/lHY6gVi2sQk9AMYAbtRLOt5DOGVB8MDmRowbngBngLe11bHw
 /W3qsCzLy6Q5QynUELtKB6qPYh4pb3q2CS7qxjMfjBbr+Swzlgc9B7GtkNilk3l/rIrG
 CxPEjXn8sulp19LAonhdDj+koKA2aU0diP1aofLiHm7E7SZqb/sbIiAn4xY29E7fVKWP
 6xnU+o2lELxjR137GkPGzDjV3Uwef9cz96XbN9OUWi8VAZrm2GCQrCRjkd2h99eFgc5h
 Cs3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ELg5bkMi+FoappyTCFIUx1Rg8zAW2tMRA+teB43Z1gY=;
 b=iUMRpiMYMYXB58Dpy3IcLcN7HaTGwgk6AtcpgpdyCOVyrXC8s8P2zz3b2w4G1bONLA
 1jQ/Q5hZzhGtUARPZ7hHmxXuUeVpIBvGa1y7wrL1QqM54BTTom5RnEEHN8GUF7CDnAcf
 5cd/AT5VwaVjud0acmRx42AJKIdwZEmnULN57bUBbeDTaOtmgtNQ/Mg+A0MS6XNztlC0
 q5qfQ+ZZC3hYCzt3m9JEZ3Or/49zijWVwkKGE6AqFhIeB7gE7GQPfGqV08+uwI6U9ioH
 UvbOU+h2MabP0wjWyrGorIG7sATskK3zSgp7JzmehWSXBrhLSSrk5pYczmjZFlYtQPPb
 d7Kw==
X-Gm-Message-State: APjAAAVuctsE3VKHG3Uo6tfXEj+nBqz7mEhtDg7nlIK/C6tI8QQ1oN1a
 roWznMd20QJ81geYTWtpbo4=
X-Google-Smtp-Source: APXvYqxidzN5tutwxdHg98hmZURUZDkArUJX8YnsN19/vfIrWs3pMFVf3dOO84FGEF13ujyo5Vsozg==
X-Received: by 2002:a54:418c:: with SMTP id 12mr22608906oiy.154.1571021484434; 
 Sun, 13 Oct 2019 19:51:24 -0700 (PDT)
Received: from localhost.localdomain ([2604:1380:4111:8b00::1])
 by smtp.gmail.com with ESMTPSA id 11sm5612491otg.62.2019.10.13.19.51.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Oct 2019 19:51:23 -0700 (PDT)
From: Nathan Chancellor <natechancellor@gmail.com>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v4 3/3] powerpc/prom_init: Use -ffreestanding to avoid a
 reference to bcmp
Date: Sun, 13 Oct 2019 19:51:01 -0700
Message-Id: <20191014025101.18567-4-natechancellor@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191014025101.18567-1-natechancellor@gmail.com>
References: <20190911182049.77853-1-natechancellor@gmail.com>
 <20191014025101.18567-1-natechancellor@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: clang-built-linux@googlegroups.com,
 Nathan Chancellor <natechancellor@gmail.com>,
 Nick Desaulniers <ndesaulniers@google.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

r374662 gives LLVM the ability to convert certain loops into a reference
to bcmp as an optimization; this breaks prom_init_check.sh:

  CALL    arch/powerpc/kernel/prom_init_check.sh
Error: External symbol 'bcmp' referenced from prom_init.c
make[2]: *** [arch/powerpc/kernel/Makefile:196: prom_init_check] Error 1

bcmp is defined in lib/string.c as a wrapper for memcmp so this could be
added to the whitelist. However, commit 450e7dd4001f ("powerpc/prom_init:
don't use string functions from lib/") copied memcmp as prom_memcmp to
avoid KASAN instrumentation so having bcmp be resolved to regular memcmp
would break that assumption. Furthermore, because the compiler is the
one that inserted bcmp, we cannot provide something like prom_bcmp.

To prevent LLVM from being clever with optimizations like this, use
-ffreestanding to tell LLVM we are not hosted so it is not free to make
transformations like this.

Link: https://github.com/ClangBuiltLinux/linux/issues/647
Link: https://github.com/llvm/llvm-project/commit/76cdcf25b883751d83402baea6316772aa73865c
Reviewed-by: Nick Desaulneris <ndesaulniers@google.com>
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---

v1 -> v3:

* New patch in the series

v3 -> v4:

* Rebase on v5.4-rc3.

* Add Nick's reviewed-by tag.

* Update the LLVM commit reference to the latest applied version (r374662)
  as it was originally committed as r370454, reverted in r370788, and
  reapplied as r374662.

 arch/powerpc/kernel/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index f1f362146135..7f0ee465dfb6 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -21,7 +21,7 @@ CFLAGS_prom_init.o += $(DISABLE_LATENT_ENTROPY_PLUGIN)
 CFLAGS_btext.o += $(DISABLE_LATENT_ENTROPY_PLUGIN)
 CFLAGS_prom.o += $(DISABLE_LATENT_ENTROPY_PLUGIN)
 
-CFLAGS_prom_init.o += $(call cc-option, -fno-stack-protector)
+CFLAGS_prom_init.o += $(call cc-option, -fno-stack-protector) -ffreestanding
 
 ifdef CONFIG_FUNCTION_TRACER
 # Do not trace early boot code
-- 
2.23.0

