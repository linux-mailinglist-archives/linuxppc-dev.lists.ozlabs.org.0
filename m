Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6586B4E27B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2019 11:00:42 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45VXhl0NTzzDqfJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2019 19:00:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::443; helo=mail-wr1-x443.google.com;
 envelope-from=mathieu.malaterre@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="okEQYw/y"; 
 dkim-atps=neutral
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45VXfm3wmCzDqdD
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jun 2019 18:58:56 +1000 (AEST)
Received: by mail-wr1-x443.google.com with SMTP id d18so5765158wrs.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jun 2019 01:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yFfPvkWjkkrjWmIO9mwmRCrRTqpdUG3kSxHSiTlM+a8=;
 b=okEQYw/yOdLIiBcSL/MJhiUQ4KzzI4k0KswWUFAIRv4nTaOJl+uXH52wlUTTU7zJn6
 LFF93u/LnNl5csBdDYw5HuXsXzVb/Zryc3h99C/Rt6y4KO2k00VXji4RoU4EsdwhiRm9
 gvN5zgYdlZdLzFwBkF3MwQmSNGpWbdBew/jEu9MYaREdqB5z0h2tnl1UPM0E3BDrk3hy
 cysbQKPnrhSlU5Gmqe+sp0zVpzmpdo6nsivWnpGK8zmvkmLWIVvl1cCh7FdhNpnvjMG0
 /79YPwylaRi6XEGsbLsNbALUa0JTCzOGJ4hmpB/yzjMKaG7oi6jjtmCmGxl3dePP31h5
 3BzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=yFfPvkWjkkrjWmIO9mwmRCrRTqpdUG3kSxHSiTlM+a8=;
 b=e/rXyJAJRWcXd/lHi7hNdJMmjIS69MHwRP7L+IaLVfybCPULap+5DWkirx1sZTwOx2
 LbKquXR+0nOSJNa7iiw9kpefaBOW2uOKVS+3zWc8yTK4WhCP5oaWZtDkto+lmOWL4ASA
 au6HjwpUUEQo1PJCjoegCq427D6TfNIhB4MrV6P/97Vg1rRUxkBRZJlJOTVklbBzAu2/
 gkfwmumB3W8/y1Nmk4PZdoJDI2fMvlv6F/G0vFvoeoN9aGSBzDoACcl3/sqNMvUR07n5
 pf9KiH/ReQl/gr0UGn0rIcAeUIS/87jGy5Qr2deOdTq77OyM+aHjdoCGewmLqsQqHvje
 NG5Q==
X-Gm-Message-State: APjAAAVwjauoIqQuj6uq4G3eEZTGYab0Z4s7/PLImMEPnOFn5TwTiKRc
 OlNhc1JeU7GPJZLL9Kf0cYs=
X-Google-Smtp-Source: APXvYqwu3QJoLLix0JPme99XociPLUyVBqqIaJQwLHO3pMm10WMLt1XDSZpTcbpXbWyCXEyg7cJ/YA==
X-Received: by 2002:a5d:6190:: with SMTP id j16mr1576725wru.49.1561107530600; 
 Fri, 21 Jun 2019 01:58:50 -0700 (PDT)
Received: from macbookpro.malat.net (bru31-1-78-225-224-134.fbx.proxad.net.
 [78.225.224.134])
 by smtp.gmail.com with ESMTPSA id z5sm2059189wrh.16.2019.06.21.01.58.49
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 21 Jun 2019 01:58:50 -0700 (PDT)
Received: by macbookpro.malat.net (Postfix, from userid 1000)
 id 047AA11459C9; Fri, 21 Jun 2019 10:58:49 +0200 (CEST)
From: Mathieu Malaterre <malat@debian.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc/lib/xor_vmx: Relax frame size for clang
Date: Fri, 21 Jun 2019 10:58:22 +0200
Message-Id: <20190621085822.1527-1-malat@debian.org>
X-Mailer: git-send-email 2.20.1
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
Cc: Mathieu Malaterre <malat@debian.org>, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Joel Stanley <joel@jms.id.au>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When building with clang-8 the frame size limit is hit:

  ../arch/powerpc/lib/xor_vmx.c:119:6: error: stack frame size of 1200 bytes in function '__xor_altivec_5' [-Werror,-Wframe-larger-than=]

Follow the same approach as commit 9c87156cce5a ("powerpc/xmon: Relax
frame size for clang") until a proper fix is implemented upstream in
clang and relax requirement for clang.

Link: https://github.com/ClangBuiltLinux/linux/issues/563
Cc: Joel Stanley <joel@jms.id.au>
Signed-off-by: Mathieu Malaterre <malat@debian.org>
---
 arch/powerpc/lib/Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/powerpc/lib/Makefile b/arch/powerpc/lib/Makefile
index c55f9c27bf79..b3f7d64caaf0 100644
--- a/arch/powerpc/lib/Makefile
+++ b/arch/powerpc/lib/Makefile
@@ -58,5 +58,9 @@ obj-$(CONFIG_FTR_FIXUP_SELFTEST) += feature-fixups-test.o
 
 obj-$(CONFIG_ALTIVEC)	+= xor_vmx.o xor_vmx_glue.o
 CFLAGS_xor_vmx.o += -maltivec $(call cc-option,-mabi=altivec)
+ifdef CONFIG_CC_IS_CLANG
+# See https://github.com/ClangBuiltLinux/linux/issues/563
+CFLAGS_xor_vmx.o += -Wframe-larger-than=4096
+endif
 
 obj-$(CONFIG_PPC64) += $(obj64-y)
-- 
2.20.1

