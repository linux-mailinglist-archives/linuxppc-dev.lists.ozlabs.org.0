Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F017BB03A3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2019 20:29:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46T9Rj30XPzDr86
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2019 04:29:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::443; helo=mail-wr1-x443.google.com;
 envelope-from=natechancellor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="l4IwgBxd"; 
 dkim-atps=neutral
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46T9GW6Rg8zF3qw
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2019 04:21:55 +1000 (AEST)
Received: by mail-wr1-x443.google.com with SMTP id y19so25685941wrd.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Sep 2019 11:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dnHA0tTLl+z1GnDOySHFBaJDRWZSuAxJ6rG0Ra7iSAY=;
 b=l4IwgBxdpDu9T+w0ajDNbGXdRI/iTLFenWDpAybrqkf9KOke9unReQoJhRvEqmQJBT
 gLW2eUCAgo7wcwJ9v087jsMcLwrcXZxxXzPBJALi6HR55Gl913E7Gppc/IxD7/b2pIOn
 KvKPtLxM2XW6zp35aZEfLgpEzq7mc6D1RaSXnsalXAIHYM9Fc/9Wk5kP/PSmt3BZoBrs
 nh0uEfnoeliD8oalMkdN1iGBJRnipxgk02ZRm5gUg6Cm30TuakHxjU0zyQW6j2Hitivo
 oxShvouMpH53hDwhHGJkaZDQcxZe82dYFPziQEFBiBbfc91jghXaPaMbPVOGoGpRgQdI
 l1qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dnHA0tTLl+z1GnDOySHFBaJDRWZSuAxJ6rG0Ra7iSAY=;
 b=iDTPxQpYt1uYjDq2/rj2sZS8mvly952CKIL607G6YLpuN5pwcK/rQl+lBw/xtpxxMK
 p97O5iNaCs10AvLndWlgugmCzdtoekgGlYVHG1o4wtL1AQXMfWNQjm0FTkRy2exAfaR1
 mklU8Nhjiu+TfWrpir8KYBqyWGiWxBbezOSMZPYdjyy+xh3RhOhTLs/HdE1TYGkHfL9h
 9ajE4okGKpZRSsG6G0hbUOd1u/pBLfZt46wlJCxBWz8fGzqHna2PiUY1GPT7H8WuQ0d3
 ZgeVWXFAKNu3uGulnCvll6aQkeq13SwfwhZt3PrHt0pHEzLvLi+yom2eBLmCqrIcE/tX
 QyQg==
X-Gm-Message-State: APjAAAVKqjP4h02x6jDskGKeXsf65nKlzWDztNqi6RvwfaPj3glU7aLb
 pLBIXB3O71PUpksezjMPBTo=
X-Google-Smtp-Source: APXvYqyoWuVYmjzKgrryye+Nv4SeeKM8ayud6J5dQEp6fgy1G8ogFGzl/HLfIC0P9S2J/Dhwnhe+3g==
X-Received: by 2002:adf:804d:: with SMTP id 71mr3414246wrk.3.1568226112313;
 Wed, 11 Sep 2019 11:21:52 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f8:222:2f1b::2])
 by smtp.gmail.com with ESMTPSA id q9sm2356753wmq.15.2019.09.11.11.21.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2019 11:21:51 -0700 (PDT)
From: Nathan Chancellor <natechancellor@gmail.com>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v3 3/3] powerpc/prom_init: Use -ffreestanding to avoid a
 reference to bcmp
Date: Wed, 11 Sep 2019 11:20:52 -0700
Message-Id: <20190911182049.77853-4-natechancellor@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190911182049.77853-1-natechancellor@gmail.com>
References: <20190911182049.77853-1-natechancellor@gmail.com>
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

r370454 gives LLVM the ability to convert certain loops into a reference
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
Link: https://github.com/llvm/llvm-project/commit/5c9f3cfec78f9e9ae013de9a0d092a68e3e79e002
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---

New patch in the series so no previous version.

 arch/powerpc/kernel/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index 19f19c8c874b..aa78b3f6271e 100644
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

