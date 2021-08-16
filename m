Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 914F13ED02E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Aug 2021 10:26:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gp6gs2xnSz3dCf
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Aug 2021 18:26:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=czsVNgGx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102c;
 helo=mail-pj1-x102c.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=czsVNgGx; dkim-atps=neutral
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gp6ds1j3Sz30RV
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Aug 2021 18:24:33 +1000 (AEST)
Received: by mail-pj1-x102c.google.com with SMTP id
 n13-20020a17090a4e0d00b0017946980d8dso12151231pjh.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Aug 2021 01:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0/BQ5I59R5DvReXc9OPs6E0JDRNhr4UM8x2hWwNF/QE=;
 b=czsVNgGxtJ66p3SWs9L8qRacGPoxa3qns0K9P/5IErUUaw6RnGyatJgbpxr6aCdLRk
 Wb5z2ro45aF2X7x3iJrFt7Jh5VSiXiG19Odp/Iq5+ZSlOaeCTpPcRoFl/w3Ahu/jo3yK
 JJJG3B2ukq5kQfVSufycB+EhuO4DEceIk172+G3IalMZd587+E1jGt9qxFZQOjn8XSvF
 po3SsZHSqEMtHMvCVQ7Dot/W1XwexCfAuwOdmcg4TYlJGgmahMczZIdHw4sEOAlcP+ad
 6VRwM1B/I7GrerrdEo2jI2sJKXRguL+Jyfkg7N/i+zTpcr895VqCQ1ZZMAobbj0cSRlj
 Xl4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=0/BQ5I59R5DvReXc9OPs6E0JDRNhr4UM8x2hWwNF/QE=;
 b=ohN0Virpu25Id4XVak1zw2ps5Oz8ykbiN3MzcFcDvUbRqzto0d6YUgoOFTzby/tdcK
 vTKagxo2H/8YLzaaBLV4nT3fwguu71HA14i5gKqs2VipUsUXsWOU6n6grp3GP5ZV35gA
 YwkrDhxWy2JfPSU/TRbncCWCKAWgP3u4jbyxdzC3iGNdEhQNxVU20d6Q0euW6wWuQiHC
 XywBUur3xCWV2GG86k2yX45i2qyevqmD0m+cl/sJssjy0D02V2RV+IraCOvqiFNETjh1
 aePSPGNw5TisA6bP9obuHWouyhdUJUY9ax8QKyohTiOAiiER7nLb6Nfmcj+2niwoJU91
 TCVA==
X-Gm-Message-State: AOAM532fnm8jBt/uIMdwAsokQvKEc4cpbRdcMzldFZCOYfW8VhJHW53l
 rpa196o1aXmOv0Chvq3SoZk=
X-Google-Smtp-Source: ABdhPJxeoN3QyUpeWCld+aS4ckIZiPENGZSjmvs3wspn4a6QUXz3wLdpxgoYckhvdoxRe6D47xi6OQ==
X-Received: by 2002:a17:90a:f10:: with SMTP id
 16mr15821535pjy.80.1629102270769; 
 Mon, 16 Aug 2021 01:24:30 -0700 (PDT)
Received: from voyager.lan ([45.124.203.15])
 by smtp.gmail.com with ESMTPSA id u24sm10542358pfm.85.2021.08.16.01.24.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 01:24:30 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Paul Mackerras <paulus@samba.org>, Michael Neuling <mikey@neuling.org>,
 Anton Blanchard <anton@ozlabs.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/3] powerpc: Fix undefined static key
Date: Mon, 16 Aug 2021 17:54:02 +0930
Message-Id: <20210816082403.2293846-3-joel@jms.id.au>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210816082403.2293846-1-joel@jms.id.au>
References: <20210816082403.2293846-1-joel@jms.id.au>
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
Cc: Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When CONFIG_PPC_BARRIER_NOSPEC=n, security.c is not built leading to a
missing definition of uaccess_flush_key.

  LD      vmlinux.o
  MODPOST vmlinux.symvers
  MODINFO modules.builtin.modinfo
  GEN     modules.builtin
  LD      .tmp_vmlinux.kallsyms1
powerpc64le-linux-gnu-ld: arch/powerpc/kernel/align.o:(.toc+0x0): undefined reference to `uaccess_flush_key'
powerpc64le-linux-gnu-ld: arch/powerpc/kernel/signal_64.o:(.toc+0x0): undefined reference to `uaccess_flush_key'
powerpc64le-linux-gnu-ld: arch/powerpc/kernel/process.o:(.toc+0x0): undefined reference to `uaccess_flush_key'
powerpc64le-linux-gnu-ld: arch/powerpc/kernel/traps.o:(.toc+0x0): undefined reference to `uaccess_flush_key'
powerpc64le-linux-gnu-ld: arch/powerpc/kernel/hw_breakpoint_constraints.o:(.toc+0x0): undefined reference to `uaccess_flush_key'
powerpc64le-linux-gnu-ld: arch/powerpc/kernel/ptrace/ptrace.o:(.toc+0x0): more undefined references to `uaccess_flush_key' follow
make[1]: *** [Makefile:1176: vmlinux] Error 1

Hack one in to fix the build.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/powerpc/include/asm/security_features.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/powerpc/include/asm/security_features.h b/arch/powerpc/include/asm/security_features.h
index 792eefaf230b..46ade7927a4c 100644
--- a/arch/powerpc/include/asm/security_features.h
+++ b/arch/powerpc/include/asm/security_features.h
@@ -39,6 +39,9 @@ static inline bool security_ftr_enabled(u64 feature)
 	return !!(powerpc_security_features & feature);
 }
 
+#ifndef CONFIG_PPC_BARRIER_NOSPEC
+DEFINE_STATIC_KEY_FALSE(uaccess_flush_key);
+#endif
 
 // Features indicating support for Spectre/Meltdown mitigations
 
-- 
2.32.0

