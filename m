Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9DB78B693
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Aug 2023 19:36:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=LSfDnQfS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RZHm83YMLz3bwg
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Aug 2023 03:36:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=LSfDnQfS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--ndesaulniers.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=34nrszawkdhciyznvpgidzmnbjjbgz.xjhgdipskkx-yzqgdnon.jugvwn.jmb@flex--ndesaulniers.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RZHlC0J9Dz2xdX
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Aug 2023 03:35:33 +1000 (AEST)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-591138c0978so52317937b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Aug 2023 10:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1693244129; x=1693848929;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5ijH1Yj+j9athjXIVwqCI/o9Npfye5Ao5bEGt89oFfI=;
        b=LSfDnQfSUKz48f90QQBZmhSyqt5dobsqkR/EKhHwvn7cVZ6RGnJ7BAZYWqrmw9dJtU
         PWc76dswvUTsptSE+vwqgQHg4E432ogmrq+q9jLj70u8U96C6+WjNS3xOeXPzrLsekWc
         h+5Ab1nVa/LBJ09j++3Emcej8g4iyqkNZXbu7/KCLC3xAImMsYMC8+5PszWVpfzA5Cdi
         Waz4PymyiiyC7BitZhDiG1QM1DL879bDTFzSVtlmbdYDTJRBHSS9U1TkhlRi3EIQWl49
         sNObiy/uGZwtxLwJmPMcKYinBlccWoKy7DHNiwrTKjZKuhvVzTwjBzRYCLKs6+X7jGgn
         B4pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693244129; x=1693848929;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5ijH1Yj+j9athjXIVwqCI/o9Npfye5Ao5bEGt89oFfI=;
        b=klUWxQW6Bekj9Q8p9BPLuzT79978Yp2tnlGRIEud8H0w3KTR9MCxGYE10RNAFuKT1Z
         i2geQBPVUsWotyTvrE5iTLUchIUPkJQXbdzU8O1UoSTK+DH/pGuynO2h8BhkFvE96Gtn
         IqLUezg7/Ut0/BdAFZpdfwI3+W0w4mhxWLsPV5Ku5nq8OE2sU17oZ5wLcOiBI2DC3ZKV
         vylzct2W9Xwu1Yz2NSU5rAbdPhuIXxFf21RaQgH4ns/QclnXYWsMaOmcNX6DG/+xu6ns
         TAQU++YRi4i8QpBObRl7rJitRN6f/YdkSDFMlcT58aDy47NhBJN0P5OHS5gysBpRADQw
         WXmw==
X-Gm-Message-State: AOJu0Yw3WU8918YflFj8juNA9T2bjeMGvvHdbF3oX6kmSaxfpm7b4Gnq
	rSgNfYsXgjpNfvTVnuvcIOpwvIlGm/tlHnHDXk8=
X-Google-Smtp-Source: AGHT+IG+VaS3u5EP9g8Q/BufJIXYRNueFIz/Y8BPq0nGDiF/i3tXgC74dAg3Miss/xJpw/vbMjq4JXX5rEV9YpzFMGg=
X-Received: from ndesaulniers-desktop.svl.corp.google.com ([2620:15c:2d1:203:b64:7817:9989:9eba])
 (user=ndesaulniers job=sendgmr) by 2002:a81:af5a:0:b0:58c:8552:458d with SMTP
 id x26-20020a81af5a000000b0058c8552458dmr796397ywj.3.1693244128809; Mon, 28
 Aug 2023 10:35:28 -0700 (PDT)
Date: Mon, 28 Aug 2023 10:35:26 -0700
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAN3a7GQC/x2MQQqAIBAAvyJ7TlCTlL4SEWFr7cVkjQikvycdB
 2amQkEmLDCKCow3FTpTA90JCMeadpS0NQajTK+88TLnsDA2FfmSg3XWuKhsQA0tyYyRnn83ze/ 7AU72xYFeAAAA
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=eMOZeIQ4DYNKvsNmDNzVbQZqpdex34Aww3b8Ah957X4=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1693244127; l=1550;
 i=ndesaulniers@google.com; s=20230823; h=from:subject:message-id;
 bh=NZWt7Q1QVJ91SA9KKz/j+iZTrbry6bjB26P0pMnU6pg=; b=Lnj6TUFBIu7VQLLeAMH+ogFSMrSNMyHrSXXCmrtgK3wlnBjhUy65e3P0b8ELe49Ot/NrDh+ey
 mMP4H3R/vnDCbYmWUg1PYX7AhCj4SX0KW71DJ4i+pnvdz6PY03w3kZJ
X-Mailer: b4 0.12.3
Message-ID: <20230828-ppc_rerevert-v1-1-74f55b818907@google.com>
Subject: [PATCH] Revert "Revert "powerpc/xmon: Relax frame size for clang""
From: ndesaulniers@google.com
To: Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="utf-8"
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
Cc: kernel test robot <lkp@intel.com>, Tom Rix <trix@redhat.com>, llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This reverts commit 7f3c5d099b6f8452dc4dcfe4179ea48e6a13d0eb.

Turns out that this is reproducible still under specific compiler
versions (mea culpa: I did not test every supported version of clang),
and even a few randconfigs bots found.

We'll have to revisit this again in the future, for now back this out.

Reported-by: Nathan Chancellor <nathan@kernel.org>
Closes: https://github.com/ClangBuiltLinux/linux/issues/252#issuecomment-1690371256
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/llvm/202308260344.Vc4Giuk7-lkp@intel.com/
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 arch/powerpc/xmon/Makefile | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/powerpc/xmon/Makefile b/arch/powerpc/xmon/Makefile
index 7705aa74a24d..d334de392e6c 100644
--- a/arch/powerpc/xmon/Makefile
+++ b/arch/powerpc/xmon/Makefile
@@ -10,6 +10,12 @@ KCSAN_SANITIZE := n
 # Disable ftrace for the entire directory
 ccflags-remove-$(CONFIG_FUNCTION_TRACER) += $(CC_FLAGS_FTRACE)
 
+ifdef CONFIG_CC_IS_CLANG
+# clang stores addresses on the stack causing the frame size to blow
+# out. See https://github.com/ClangBuiltLinux/linux/issues/252
+KBUILD_CFLAGS += -Wframe-larger-than=4096
+endif
+
 ccflags-$(CONFIG_PPC64) := $(NO_MINIMAL_TOC)
 
 obj-y			+= xmon.o nonstdio.o spr_access.o xmon_bpts.o

---
base-commit: 2ee82481c392eec06a7ef28df61b7f0d8e45be2e
change-id: 20230828-ppc_rerevert-647427f04ce1

Best regards,
-- 
Nick Desaulniers <ndesaulniers@google.com>

