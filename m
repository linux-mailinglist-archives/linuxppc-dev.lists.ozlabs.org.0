Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8758638818A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 May 2021 22:41:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fl7Fl35f4z30Cn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 May 2021 06:41:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=H1+CLq87;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--ndesaulniers.bounces.google.com
 (client-ip=2607:f8b0:4864:20::f4a; helo=mail-qv1-xf4a.google.com;
 envelope-from=3wcakyawkdeeqghvdxoqlhuvjrrjoh.frpolqx0ssf-ghyolvwv.r2odev.ruj@flex--ndesaulniers.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=H1+CLq87; dkim-atps=neutral
Received: from mail-qv1-xf4a.google.com (mail-qv1-xf4a.google.com
 [IPv6:2607:f8b0:4864:20::f4a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fl7FD5S6Fz2xZ3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 May 2021 06:41:02 +1000 (AEST)
Received: by mail-qv1-xf4a.google.com with SMTP id
 w14-20020a056214012eb02901f3a4388530so55673qvs.17
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 May 2021 13:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=IfF2H1j3I1t32Qp6CZlQegbMzyiGyECr+WNser52IpQ=;
 b=H1+CLq87C5xK1VRznrjO+ht+yPAucXYxPJ5BM6bLjABg5c2lojiuq31aQ/OaYSx+Vf
 N4UxQ+D0dy8jCjOcy7LIDJbrk3Zln4nuigGUAVN3FcENOwcThk+afw1WTjRJL7hJ+3A8
 gcSirCtASOf8fIdxlSpjbop5rXxXYKH11QM3yUBu9B5Gt/2pmkkYFsUjOep6X89iubnU
 AcjqcYMa5GjIWoTdkUdNc5LLSQyy48gLemx2efyuRboWtFv4txbBIcnccFr+VjBbEPAX
 9XxOyWfTabF8/mXSc8sNRUxf55+e7LaoHC04RksFtW5n2TkuyxWyJ3dUlibMfyMRbAeh
 2QTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=IfF2H1j3I1t32Qp6CZlQegbMzyiGyECr+WNser52IpQ=;
 b=R2FI1LvTXyMdArs7rqA/qQr5NTWbl8Gnd4r4WnEOWQs8OZKmvpriV5yG1HzAm3s4y+
 O/9wGE09wsngrKyxNqFBgUe4UiRUqccxvjZaV0uffAHgunKpd8i+7CkFV8LcDZappp+v
 BBcsPZKV/UOn0y3i1GWFda0tvPRhuM84cgm8FIhupQYMwncZKBCYKVT1uqJpLTnKhrfe
 8jBOCTdHjdc6Hhgx2SCgPVxCpxlYQ6cqZKMkOJvYaIGdvovgU7tGYSft0zXS+z351Qni
 pCOslvhiI+6u6u4jJ6yrP6Ei2BJOim1rbUsE/89SZyFQZLbZhAbhudoYR9Jkek0yhVUu
 LlQg==
X-Gm-Message-State: AOAM5318IAXtPLl4+Z8KanYgyIeB88f0RBj/XXdyd0PSeM0mXPsgCgBW
 YmzpEA/9mLMvBb//CFRxI8fRnLgAY+7bwvBOpis=
X-Google-Smtp-Source: ABdhPJwL37MmHN+duACl9QYa5rSGSQ/1t1hbZdxtQ5vtPTJbJh7hWSFoOj8MSc1j7MlvRsj+NdUiwGaleaJgrPPWceg=
X-Received: from ndesaulniers1.mtv.corp.google.com
 ([2620:15c:211:202:c3e7:2f43:8f78:4b8f])
 (user=ndesaulniers job=sendgmr) by 2002:ad4:446c:: with SMTP id
 s12mr2008135qvt.34.1621370456656; Tue, 18 May 2021 13:40:56 -0700 (PDT)
Date: Tue, 18 May 2021 13:40:41 -0700
In-Reply-To: <87cztok1r5.fsf@mpe.ellerman.id.au>
Message-Id: <20210518204044.2390064-1-ndesaulniers@google.com>
Mime-Version: 1.0
References: <87cztok1r5.fsf@mpe.ellerman.id.au>
X-Mailer: git-send-email 2.31.1.751.gd2f1c929bd-goog
Subject: [PATCH v2] powerpc/powernv/pci: fix header guard
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
 Nathan Chancellor <nathan@kernel.org>, Paul Mackerras <paulus@samba.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Joe Perches <joe@perches.com>,
 Oliver O'Halloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

While looking at -Wundef warnings, the #if CONFIG_EEH stood out as a
possible candidate to convert to #ifdef CONFIG_EEH.

It seems that based on Kconfig dependencies it's not possible to build
this file without CONFIG_EEH enabled, but based on upstream discussion,
it's not clear yet that CONFIG_EEH should be enabled by default.

For now, simply fix the -Wundef warning.

Suggested-by: Nathan Chancellor <nathan@kernel.org>
Suggested-by: Joe Perches <joe@perches.com>
Link: https://github.com/ClangBuiltLinux/linux/issues/570
Link: https://lore.kernel.org/lkml/67f6cd269684c9aa8463ff4812c3b4605e6739c3.camel@perches.com/
Link: https://lore.kernel.org/lkml/CAOSf1CGoN5R0LUrU=Y=UWho1Z_9SLgCX8s3SbFJXwJXc5BYz4A@mail.gmail.com/
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 arch/powerpc/platforms/powernv/pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/powernv/pci.c b/arch/powerpc/platforms/powernv/pci.c
index b18468dc31ff..6bb3c52633fb 100644
--- a/arch/powerpc/platforms/powernv/pci.c
+++ b/arch/powerpc/platforms/powernv/pci.c
@@ -711,7 +711,7 @@ int pnv_pci_cfg_write(struct pci_dn *pdn,
 	return PCIBIOS_SUCCESSFUL;
 }
 
-#if CONFIG_EEH
+#ifdef CONFIG_EEH
 static bool pnv_pci_cfg_check(struct pci_dn *pdn)
 {
 	struct eeh_dev *edev = NULL;
-- 
2.31.1.751.gd2f1c929bd-goog

