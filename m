Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD3D368775
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Apr 2021 21:54:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FR7Rc0jL7z30Bq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Apr 2021 05:54:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=H17ya4YH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--ndesaulniers.bounces.google.com
 (client-ip=2607:f8b0:4864:20::449; helo=mail-pf1-x449.google.com;
 envelope-from=3x9sbyawkdbod34i0kbd84hi6ee6b4.2ecb8dknff2-34lb8iji.epb01i.eh6@flex--ndesaulniers.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=H17ya4YH; dkim-atps=neutral
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com
 [IPv6:2607:f8b0:4864:20::449])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FR7R95qYNz2yhk
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Apr 2021 05:54:11 +1000 (AEST)
Received: by mail-pf1-x449.google.com with SMTP id
 y22-20020aa794360000b029021ded907cf1so13593746pfo.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Apr 2021 12:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=ImTLyl0SxzL3xu48ASg//HlItmpFlRZGvY2fvaEcoU8=;
 b=H17ya4YHWRiQmMqm7Yud8M0j8f2kaYPakeRhU9xoRbPeNQSPlLudddQ63QwbMcP++y
 jgPxzgdPmCVWy0LctGN3XR4nay0rZceVuPUv4ofni/UFdp2Vkdd950pwtcJ+fSY00pIg
 WNqV0JXoYfBe14TGy4aaKHd6NU8ak11fLx+Vx4AUQSS4EH0iIR/5DzFlmYR2f9ziqk/h
 zh8wcfOe3XX3jHUW/YmUd9dEJe+UEggxzkOXmugt7qZB8z8gPt0q+XAHw3S+oIjoaO1s
 rlGQwviRsNED/AJ6ORy8ap2Z+8p/iD3Vv6BVbdp677KC65ZEPbgCPpxgq/0srRU7YIR/
 u/QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=ImTLyl0SxzL3xu48ASg//HlItmpFlRZGvY2fvaEcoU8=;
 b=tYZZ5rsAwg1kvFRxrQxVN4dpmd0WS7l9jjbQjqsdU7RH9t7QjJV80llV6s2LqV+ae0
 6Ah0K+HJx6rfXNcFJcM1XJEoRjVrCXopQqAh0bcIdUx4QJD1MWkXMC5wAf/I80PtOMSY
 HzJq+c1Io7kcRWpKFeuK8f5m3rR3tim9WKSA8l4B3w7eZGoX14dSUSdlEidjUKpYGivZ
 R4QDhIy19+QOQguprRKRz0RxS1rq2OPuWNa+3gp8K/pEMQKhSis/XtqP5VJNPWF55X9n
 iTjftx3ylxW4qYN66eOFdg6MFyxrc2OVsEuiw0v+QF+OixAeWI2pyHB8PFVZ8NU8AEfk
 oRFA==
X-Gm-Message-State: AOAM530pnEqrWJMh2fS5PDfDrUTWb2Aywv0IhYuf1dR1mxcNkYUIUX+r
 WDXKLC73FKNEVtaG0dqTKtE0qIZcLRoK9OqiZhw=
X-Google-Smtp-Source: ABdhPJwy0+XtlTuR9M3dXEQgxOOFMNcgRbs2eHZsHiG99vQoM4mzMjNVufkEnCeVeMuqN1Jiz+inq1aLOvfvQFaA3VU=
X-Received: from ndesaulniers1.mtv.corp.google.com
 ([2620:15c:211:202:9317:2762:871:5f48])
 (user=ndesaulniers job=sendgmr) by 2002:a17:902:8347:b029:e7:4a2d:6589 with
 SMTP id z7-20020a1709028347b02900e74a2d6589mr499050pln.64.1619121247911; Thu,
 22 Apr 2021 12:54:07 -0700 (PDT)
Date: Thu, 22 Apr 2021 12:54:02 -0700
Message-Id: <20210422195405.4053917-1-ndesaulniers@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
Subject: [PATCH] powerpc/powernv/pci: remove dead code from !CONFIG_EEH
From: Nick Desaulniers <ndesaulniers@google.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Nathan Chancellor <nathan@kernel.org>, Oliver O'Halloran <oohall@gmail.com>,
 Joe Perches <joe@perches.com>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

While looking at -Wundef warnings, the #if CONFIG_EEH stood out as a
possible candidate to convert to #ifdef CONFIG_EEH, but it seems that
based on Kconfig dependencies it's not possible to build this file
without CONFIG_EEH enabled.

Suggested-by: Nathan Chancellor <nathan@kernel.org>
Suggested-by: Joe Perches <joe@perches.com>
Link: https://github.com/ClangBuiltLinux/linux/issues/570
Link: https://lore.kernel.org/lkml/67f6cd269684c9aa8463ff4812c3b4605e6739c3.camel@perches.com/
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 arch/powerpc/platforms/powernv/pci.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci.c b/arch/powerpc/platforms/powernv/pci.c
index 9b9bca169275..591480a37b05 100644
--- a/arch/powerpc/platforms/powernv/pci.c
+++ b/arch/powerpc/platforms/powernv/pci.c
@@ -711,7 +711,6 @@ int pnv_pci_cfg_write(struct pci_dn *pdn,
 	return PCIBIOS_SUCCESSFUL;
 }
 
-#if CONFIG_EEH
 static bool pnv_pci_cfg_check(struct pci_dn *pdn)
 {
 	struct eeh_dev *edev = NULL;
@@ -734,12 +733,6 @@ static bool pnv_pci_cfg_check(struct pci_dn *pdn)
 
 	return true;
 }
-#else
-static inline pnv_pci_cfg_check(struct pci_dn *pdn)
-{
-	return true;
-}
-#endif /* CONFIG_EEH */
 
 static int pnv_pci_read_config(struct pci_bus *bus,
 			       unsigned int devfn,

base-commit: 16fc44d6387e260f4932e9248b985837324705d8
prerequisite-patch-id: 950233069fb22099a8ff8990f620f5c3586a3cbd
-- 
2.31.1.498.g6c1eba8ee3d-goog

