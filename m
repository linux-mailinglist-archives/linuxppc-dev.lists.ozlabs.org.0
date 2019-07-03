Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 565115DAB5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2019 03:24:35 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45dk0v6bGFzDqWf
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2019 11:24:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::641; helo=mail-pl1-x641.google.com;
 envelope-from=sjitindarsingh@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="eE9NuW60"; 
 dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45djwT2RCKzDqQV
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jul 2019 11:20:41 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id m7so241265pls.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 02 Jul 2019 18:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=OT+iSlP7qQxjao2KtTY/wuAA4aL+nqDFMX6/v/uNdu4=;
 b=eE9NuW60m15qwsjWlt+lK0mLNp+ZuO3yidTHutB9QGlwHs815nBPtwK3wKBDLwWOGd
 Txaa5TVWA64GJHXRg65hvqw14cbZhnm0035A4Vq4XU5pbjM/YYmEBPrzaPnHIARjzHn2
 fVilXLh/wJYHl/Zao7bK3hqeSywIeWQJ+CDu0tIM295inos+mE8DuNzyZm4kZ0R3oeFi
 D2961o3zGGlef3sNPnvL/x0B46zGnfYJ/kr3C7nHBCj1kmc6nEFhHdBY+JMGHu9owJSB
 N8/pwgcCVBRsZyt3RZwqZq/zEDun9qKdgKigNJt0nv58nVsaCyQSyp3mkMe0bfP2POFw
 Zp0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=OT+iSlP7qQxjao2KtTY/wuAA4aL+nqDFMX6/v/uNdu4=;
 b=nNiTMxS6KLCyhzV/GkRBoxALPnRZXzdQ3vDIZGGMxx+H1E92uGfzWYDwGUYx2Wob1z
 cgr4RA9pCLSO9r0er7Jzt2x9X8kyMCDaXI7fqVG9wDHu3WSo5IwH8ED+ijxePOayvwRZ
 Efy1Nai/yhHS93rmy7NSoYoCHNPuOl837/pSZFU3JITIjnBNdhjOA0jHyg0cVB6Xnynh
 vp4TdkXjEZodSl/ET7fttpNU9XcAF4ygVm01WLPhNwhvI/ddTEtOYyanqsixpzetVdyf
 eflPhU5Nr3AvvNinTfbQyLhuxblxK9sJhL4Who5loLPaRpHurhcT0T5gWIBIVXbfbe9e
 O9dg==
X-Gm-Message-State: APjAAAVP2KPtLtz8qTWkBkTug5cP+WX28qVnQEh4hIu32bBkTHrzat1q
 syOcM3i+t/yP5akn/VsZ7mDr+izG
X-Google-Smtp-Source: APXvYqxICivvyS9zvkcXp4qDw3wHK9lxCyuN+p62quvHg5No7Hz1ZHyE+PQInv9p7TP3BKnA+kzhSA==
X-Received: by 2002:a17:902:8d92:: with SMTP id
 v18mr39141154plo.211.1562116837371; 
 Tue, 02 Jul 2019 18:20:37 -0700 (PDT)
Received: from surajjs2.ozlabs.ibm.com.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id j11sm318058pfa.2.2019.07.02.18.20.31
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 02 Jul 2019 18:20:36 -0700 (PDT)
From: Suraj Jitindar Singh <sjitindarsingh@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/3] PPC: PMC: Set pmcregs_in_use in paca when running as LPAR
Date: Wed,  3 Jul 2019 11:20:21 +1000
Message-Id: <20190703012022.15644-2-sjitindarsingh@gmail.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20190703012022.15644-1-sjitindarsingh@gmail.com>
References: <20190703012022.15644-1-sjitindarsingh@gmail.com>
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
Cc: sjitindarsingh@gmail.com, kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The ability to run nested guests under KVM means that a guest can also
act as a hypervisor for it's own nested guest. Currently
ppc_set_pmu_inuse() assumes that either FW_FEATURE_LPAR is set,
indicating a guest environment, and so sets the pmcregs_in_use flag in
the lppaca, or that it isn't set, indicating a hypervisor environment,
and so sets the pmcregs_in_use flag in the paca.

The pmcregs_in_use flag in the lppaca is used to communicate this
information to a hypervisor and so must be set in a guest environment.
The pmcregs_in_use flag in the paca is used by KVM code to determine
whether the host state of the performance monitoring unit (PMU) must be
saved and restored when running a guest.

Thus when a guest also acts as a hypervisor it must set this bit in both
places since it needs to ensure both that the real hypervisor saves it's
pmu registers when it runs (requires pmcregs_in_use flag in lppaca), and
that it saves it's own pmu registers when running a nested guest
(requires pmcregs_in_use flag in paca).

Modify ppc_set_pmu_inuse() so that the pmcregs_in_use bit is set in both
the lppaca and the paca when a guest (LPAR) is running with the
capability of running it's own guests (CONFIG_KVM_BOOK3S_HV_POSSIBLE).

Fixes: 95a6432ce903 "KVM: PPC: Book3S HV: Streamlined guest entry/exit path on P9 for radix guests"

Signed-off-by: Suraj Jitindar Singh <sjitindarsingh@gmail.com>
---
 arch/powerpc/include/asm/pmc.h | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/pmc.h b/arch/powerpc/include/asm/pmc.h
index dc9a1ca70edf..c6bbe9778d3c 100644
--- a/arch/powerpc/include/asm/pmc.h
+++ b/arch/powerpc/include/asm/pmc.h
@@ -27,11 +27,10 @@ static inline void ppc_set_pmu_inuse(int inuse)
 #ifdef CONFIG_PPC_PSERIES
 		get_lppaca()->pmcregs_in_use = inuse;
 #endif
-	} else {
+	}
 #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
-		get_paca()->pmcregs_in_use = inuse;
+	get_paca()->pmcregs_in_use = inuse;
 #endif
-	}
 #endif
 }
 
-- 
2.13.6

