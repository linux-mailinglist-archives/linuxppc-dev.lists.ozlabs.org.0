Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7423B52ED9C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 15:56:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L4Stv2GBJz3chD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 23:56:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=EhQvCQip;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canonical.com (client-ip=185.125.188.122;
 helo=smtp-relay-internal-0.canonical.com;
 envelope-from=juerg.haefliger@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=EhQvCQip; 
 dkim-atps=neutral
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L4QBQ2qF0z2yjC
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 May 2022 21:54:38 +1000 (AEST)
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id F37593F1EE
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 May 2022 11:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1653047675;
 bh=deCcyVhVyKD2/JPpSzZpMIDpYKyl3Ap6BwhEK9M4/s8=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=EhQvCQipQs6C679f5wbHaAWgWebqcJCgNVKPIWvN4tDLnhQrE3nKVBhmtHf4rEI/t
 2khAFnTHV8sJVgPswo7DBOl/WevCVJsN25jxjcf1hry5QyQCYipLDqnUQppAEuUbHS
 txnz9bMik8H2inBqBBt1zj2oCHXyB4VfHj+GsyhhJ0D88uIKFW0YdyG3crFxqPElCh
 7QLMQYbxtN2wif0RwYBjBL/oy6k28jU3RrMJB3TzNE95cGIfeAoY4gi2bnH4ViXFmj
 nvk/fAjoDt+hKI7HEncBbUuWVk8FgpzVgSI7zLzO1L/aC8wHfw+9sxK2OfidkuZyPB
 tjG2eHZK4lZ3w==
Received: by mail-ej1-f72.google.com with SMTP id
 sd38-20020a1709076e2600b006f3e54b1dbcso3905285ejc.4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 May 2022 04:54:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=deCcyVhVyKD2/JPpSzZpMIDpYKyl3Ap6BwhEK9M4/s8=;
 b=E2n5xgD/ff0e4A42+gL9PFq/gHObOg1EYInQJ0prFBSGi/lBIOaRmakqG21S69nqP8
 xZKXndgWDnhbpfg0LSlujhExsMUW404w0W9/BvMc16Y8RDec5szp8J7DbzL15byPLBnK
 /mGPEUg6x7Yw2WiMR5ZsIZ9Ydd3pjVkR50T8VCFhPFpiIyVjQTb2XhUj6KtQtJ4BUOza
 H96l76jleVCbEkIzXh6cdzsHerHMXu2ZiLfvGstGVSCKrTIgW18XIire0p8D98ZD3Zn3
 9lOqvtP3Ii51aPLYSr7+3Fd1h2tp83GMWYh7YSbOzr1bKhSKLDtKnsCbx8V32YiFVCA8
 dDgA==
X-Gm-Message-State: AOAM531tXeQCdYTgleFf7ZoG5c798Vc86CBULsufUrs7rLQynKZM+7dx
 3TjmxMT4DhXj2zP7V2iaUES/L9Zn7xuqBxa14mpM2PQ74z9L4ruk3CaFBY9Fud+mkvofEdDUZ2j
 ID28AG0fDK3FZwpV84jQaucMYisiE+92FinQLo1Bi5Gk=
X-Received: by 2002:a17:907:3daa:b0:6fe:88ab:fe8c with SMTP id
 he42-20020a1709073daa00b006fe88abfe8cmr8136294ejc.575.1653047674687; 
 Fri, 20 May 2022 04:54:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzGYb7iuTm8Rlzr8a4NeJlgaXcvtLbYBbdOK1XLz9DVlSPQcOFRtd66KjcfayizB1DjW9FI2A==
X-Received: by 2002:a17:907:3daa:b0:6fe:88ab:fe8c with SMTP id
 he42-20020a1709073daa00b006fe88abfe8cmr8136282ejc.575.1653047674537; 
 Fri, 20 May 2022 04:54:34 -0700 (PDT)
Received: from gollum.fritz.box ([194.191.244.86])
 by smtp.gmail.com with ESMTPSA id
 a12-20020aa7c80c000000b0042617ba637esm4231156edt.8.2022.05.20.04.54.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 04:54:34 -0700 (PDT)
From: Juerg Haefliger <juerg.haefliger@canonical.com>
X-Google-Original-From: Juerg Haefliger <juergh@canonical.com>
To: mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org,
 linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] KVM: PPC: Kconfig: Fix indentation
Date: Fri, 20 May 2022 13:54:31 +0200
Message-Id: <20220520115431.147593-1-juergh@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 20 May 2022 23:55:13 +1000
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
Cc: Juerg Haefliger <juergh@canonical.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The convention for indentation seems to be a single tab. Help text is
further indented by an additional two whitespaces. Fix the lines that
violate these rules.

Signed-off-by: Juerg Haefliger <juergh@canonical.com>
---
 arch/powerpc/kvm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kvm/Kconfig b/arch/powerpc/kvm/Kconfig
index ddd88179110a..fe84628bda64 100644
--- a/arch/powerpc/kvm/Kconfig
+++ b/arch/powerpc/kvm/Kconfig
@@ -149,7 +149,7 @@ config KVM_BOOK3S_HV_NESTED_PMU_WORKAROUND
 	  Old nested HV capable Linux guests have a bug where they don't
 	  reflect the PMU in-use status of their L2 guest to the L0 host
 	  while the L2 PMU registers are live. This can result in loss
-          of L2 PMU register state, causing perf to not work correctly in
+	  of L2 PMU register state, causing perf to not work correctly in
 	  L2 guests.
 
 	  Selecting this option for the L0 host implements a workaround for
-- 
2.32.0

