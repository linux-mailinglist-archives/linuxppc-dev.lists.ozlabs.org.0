Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 971453EFC6E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Aug 2021 08:25:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GqHv13rJRz3bXV
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Aug 2021 16:25:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=F3ghc0DU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::42b;
 helo=mail-pf1-x42b.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=F3ghc0DU; dkim-atps=neutral
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GqHtH2KNtz3088
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Aug 2021 16:24:20 +1000 (AEST)
Received: by mail-pf1-x42b.google.com with SMTP id i133so1102453pfe.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Aug 2021 23:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dkCK961ZyttB0QG+MUzGRc9GbPNZyJOzxDRl3nXU6Gc=;
 b=F3ghc0DUnRIAuSynTOo4HhTisr9dY2clGPt7Tp2ELGFpLUMoqQjF17RYWes7eco0Fp
 HKzP4hJH6W8dElSRC/l4MPe4WbDo+9mFg+K8Li9eyi19QvOkLGzu4axj3QbMT/3x3/oK
 4mFZNJ8jfnCy22ecNEUEUkyyEwRPO3Ye/ohuI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dkCK961ZyttB0QG+MUzGRc9GbPNZyJOzxDRl3nXU6Gc=;
 b=aN1Ml3FThCOxgcmBVhhlhs5ilGpfVq7aHf/2jTDeg0tPlWYpTFdUX6QLxf5p2aCyyo
 8mVDND0K3MNDbSTuZImI1NS/iTBmSU7kMmWuQNQjQdhnvlL7SfleWwcVnJyeaprgSMIr
 80u4tV9+hE+0e6Fpd1XvX5aossDMLczTYWjqop5pwASo5+OGy5G3Gl1MfGkAdilJxBjI
 wyjxDxsUpT05l8gbq85BlC8g2dwf5XYMjNWavOz5AAVTbftt/b5z99DthvVTPV9GCgNl
 tU3ie6KlkiQJFqVVQjsy66S2XBFoTifoalzVz60O2/hogYE6RPXagUmWjkJtVzBO52Eh
 GRbg==
X-Gm-Message-State: AOAM530oYyTbbWQyNw0CSJKze4tL23Eoi0/tF3L/t7pSeF8bJUS3hKqw
 m2Ilu2Qg16r7iwuoiPPvw52wtA==
X-Google-Smtp-Source: ABdhPJzB6Fpw5lksE03mTikq/l8Ungtb52rwsKcOwzebsF0lTq2QR4kdwv8iqtPBdlFbyxw6WcuEBA==
X-Received: by 2002:aa7:8c19:0:b0:3e1:4b9e:cf89 with SMTP id
 c25-20020aa78c19000000b003e14b9ecf89mr7683859pfd.58.1629267857641; 
 Tue, 17 Aug 2021 23:24:17 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id t18sm4582599pfg.111.2021.08.17.23.24.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 23:24:15 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 57/63] powerpc/signal32: Use struct_group() to zero spe regs
Date: Tue, 17 Aug 2021 23:05:27 -0700
Message-Id: <20210818060533.3569517-58-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210818060533.3569517-1-keescook@chromium.org>
References: <20210818060533.3569517-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2908; h=from:subject;
 bh=uD1y/xoxNTfC/kMxy1YHPqDr4W4r5gvR6/3LUb/d/+Q=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhHKMqjnaaYE2W2OottJ48+Kv314H+c4/L+2RqMHXv
 r7V1BciJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYRyjKgAKCRCJcvTf3G3AJgmYD/
 4xOx64rrId3koq1dIVBd1c7qtDRXBXq8ocvbv6TiAzQ5OW2IJsAcesmEDGB0aarLTux96zhVYvPuEY
 ekfg39GKhCgEPeb5jXP+UH57m9qopfeReANE1S4LvEsOJWuHGa5N2yh0MVFMYdstmPHkfTVtOzOdnW
 4FpfS36c3/G650GjYZjHYGK93aUv37ocoMf05CH9DSjWcOrGk+21jowTwXALShjZMmIjz5FWSiAPe+
 +1eUzjLiqUeJOGZ7Lv40/p3giVTD2/7lEzVVufOf7KMLHvSJmrltr2bLt88CSW+0Qs2cDc8kDwit4g
 NSusBANylY1K/6uJsrHXOzr8UYkdtB6bsttgeE9V1+wOYhLMeNib3XArxbwXJKppaNHkpLdAyqOc1N
 hNWxNmFkEb7gLQI+lgaRv2CySpbhIO+o8h7UWzfZ9W2P7Sz8/0+TLD68DRwxBbPxMHy7FpShanbdlR
 HAvsXrcU8SaCn8kjeuW7pbNPk+pnaYiQiMH5cl3iCfgq1I13gvGVNmMUEdqsNskPE6H1JjH3DkRQLj
 i7n33M3844UZk+msL24HAJukYQmiAtXqJDGZb3S179NpLnEREMRQveIz0XRN96WDiRCpbvwy644xQe
 qmxn1RnVllos5p0W46DDS5Z/a2ezsgCPxronRiihYw6gD81m/cUYTrPKHDSw==
X-Developer-Key: i=keescook@chromium.org; a=openpgp;
 fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
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
Cc: Kees Cook <keescook@chromium.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
 linux-wireless@vger.kernel.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-hardening@vger.kernel.org, linux-block@vger.kernel.org,
 clang-built-linux@googlegroups.com, netdev@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, dri-devel@lists.freedesktop.org,
 Sudeep Holla <sudeep.holla@arm.com>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kbuild@vger.kernel.org,
 kernel test robot <lkp@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In preparation for FORTIFY_SOURCE performing compile-time and run-time
field bounds checking for memset(), avoid intentionally writing across
neighboring fields.

Add a struct_group() for the spe registers so that memset() can correctly reason
about the size:

   In function 'fortify_memset_chk',
       inlined from 'restore_user_regs.part.0' at arch/powerpc/kernel/signal_32.c:539:3:
>> include/linux/fortify-string.h:195:4: error: call to '__write_overflow_field' declared with attribute warning: detected write beyond size of field (1st parameter); maybe use struct_group()? [-Werror=attribute-warning]
     195 |    __write_overflow_field();
         |    ^~~~~~~~~~~~~~~~~~~~~~~~

Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Sudeep Holla <sudeep.holla@arm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 arch/powerpc/include/asm/processor.h | 6 ++++--
 arch/powerpc/kernel/signal_32.c      | 6 +++---
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/asm/processor.h
index f348e564f7dd..05dc567cb9a8 100644
--- a/arch/powerpc/include/asm/processor.h
+++ b/arch/powerpc/include/asm/processor.h
@@ -191,8 +191,10 @@ struct thread_struct {
 	int		used_vsr;	/* set if process has used VSX */
 #endif /* CONFIG_VSX */
 #ifdef CONFIG_SPE
-	unsigned long	evr[32];	/* upper 32-bits of SPE regs */
-	u64		acc;		/* Accumulator */
+	struct_group(spe,
+		unsigned long	evr[32];	/* upper 32-bits of SPE regs */
+		u64		acc;		/* Accumulator */
+	);
 	unsigned long	spefscr;	/* SPE & eFP status */
 	unsigned long	spefscr_last;	/* SPEFSCR value on last prctl
 					   call or trap return */
diff --git a/arch/powerpc/kernel/signal_32.c b/arch/powerpc/kernel/signal_32.c
index 0608581967f0..77b86caf5c51 100644
--- a/arch/powerpc/kernel/signal_32.c
+++ b/arch/powerpc/kernel/signal_32.c
@@ -532,11 +532,11 @@ static long restore_user_regs(struct pt_regs *regs,
 	regs_set_return_msr(regs, regs->msr & ~MSR_SPE);
 	if (msr & MSR_SPE) {
 		/* restore spe registers from the stack */
-		unsafe_copy_from_user(current->thread.evr, &sr->mc_vregs,
-				      ELF_NEVRREG * sizeof(u32), failed);
+		unsafe_copy_from_user(&current->thread.spe, &sr->mc_vregs,
+				      sizeof(current->thread.spe), failed);
 		current->thread.used_spe = true;
 	} else if (current->thread.used_spe)
-		memset(current->thread.evr, 0, ELF_NEVRREG * sizeof(u32));
+		memset(&current->thread.spe, 0, sizeof(current->thread.spe));
 
 	/* Always get SPEFSCR back */
 	unsafe_get_user(current->thread.spefscr, (u32 __user *)&sr->mc_vregs + ELF_NEVRREG, failed);
-- 
2.30.2

