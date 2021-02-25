Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B82563250F8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Feb 2021 14:55:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DmZ6t53tYz3fPX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Feb 2021 00:55:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=I9SIJ+2J;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034;
 helo=mail-pj1-x1034.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=I9SIJ+2J; dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DmYyf4QGYz3d8T
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Feb 2021 00:48:10 +1100 (AEDT)
Received: by mail-pj1-x1034.google.com with SMTP id t9so3527385pjl.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Feb 2021 05:48:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IAvUmJ5x6WP1qzuhU/NEz1W7bJ05d4CA4Gd/jBet5Cc=;
 b=I9SIJ+2JSZBissr8WFV6oI788xYTeZUYkdHy2Fr7d3QjcaxD9ob+STuQ2EJnJoiJM/
 VSens5ZyguuoSXAG60mLHo1UzagDqGXhIyY6GUB6q8uY/XLVWozxhNCL8mjVtpHLceiB
 6oUdrEZ0s/TQclr1y4zjdzwUnzXNNc2XMUWPfrPi364Z5mi39rSQx5vqULiVXaemf36N
 zz1n59rK9ML+F9r632G1SxUGArcy1ysEGQzXUDiLkpvE26ej5RGw+VY4V8zS68+/+n7w
 cN85mExtgr7JiZ0deMVGstQVPWCd/XWs6W6GhfD5WASULvwXHOTouXUct6f/Mpcigqmd
 Rh2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IAvUmJ5x6WP1qzuhU/NEz1W7bJ05d4CA4Gd/jBet5Cc=;
 b=OxJun/4RDXLF+dbnA73YbmN6E6aFtS9C/uO4l2n/imGyd0mjbxTA7r7NvvgawbPFol
 9n4n/p9ofO7Tgfam9dNpnf73tgoQM4Z/qE8AUGQyM7nyf2vcTL7PXqEraK0sNMaDFucR
 W0jNG6oiYFzBIZlOAXH+K+sL7u9yNYFZLwe7UsBzA2T9yvRnzZe3R14r6XtAUVQus9b9
 8krZVIfrgWn5KhOTokN5D4RVqOtb27t59HtVTJWUis5lggIN740SvNzk41Ten2ntXLSU
 pLUCAPjrjcFZj601dO7VlTneCUjxLjx9NZighHt0jfEgABkSUhiEJ4QPVCDFXibLanpV
 Pl0g==
X-Gm-Message-State: AOAM53244wLZots8MB9vvW26yaebd6hWfZhslOQRECbjxLUn3t+fi62A
 DHZIt/6b7/EjJgYLUpUdWQOjVYVuDKw=
X-Google-Smtp-Source: ABdhPJwwyG9yKV5GO5sIoo2EFzuVqiNXSgeaLsc4YQlwyGDnXto2BpBBrTCwAO9r4VQwzIe2fKpiQQ==
X-Received: by 2002:a17:902:9349:b029:df:fab3:64b8 with SMTP id
 g9-20020a1709029349b02900dffab364b8mr2985259plp.72.1614260888800; 
 Thu, 25 Feb 2021 05:48:08 -0800 (PST)
Received: from bobo.ibm.com (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id a9sm5925868pjq.17.2021.02.25.05.48.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 05:48:07 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v2 19/37] KVM: PPC: Book3S HV P9: Use host timer accounting to
 avoid decrementer read
Date: Thu, 25 Feb 2021 23:46:34 +1000
Message-Id: <20210225134652.2127648-20-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210225134652.2127648-1-npiggin@gmail.com>
References: <20210225134652.2127648-1-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There is no need to save away the host DEC value, as it is derived
from the host timer subsystem, which maintains the next timer time.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/time.h |  5 +++++
 arch/powerpc/kvm/book3s_hv.c    | 12 ++++++------
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/include/asm/time.h b/arch/powerpc/include/asm/time.h
index 68d94711811e..0128cd9769bc 100644
--- a/arch/powerpc/include/asm/time.h
+++ b/arch/powerpc/include/asm/time.h
@@ -101,6 +101,11 @@ extern void __init time_init(void);
 
 DECLARE_PER_CPU(u64, decrementers_next_tb);
 
+static inline u64 timer_get_next_tb(void)
+{
+	return __this_cpu_read(decrementers_next_tb);
+}
+
 /* Convert timebase ticks to nanoseconds */
 unsigned long long tb_to_ns(unsigned long long tb_ticks);
 
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 913582bd848f..735ec40ece86 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3631,16 +3631,16 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 	unsigned long host_amr = mfspr(SPRN_AMR);
 	unsigned long host_fscr = mfspr(SPRN_FSCR);
 	s64 dec;
-	u64 tb;
+	u64 tb, next_timer;
 	int trap, save_pmu;
 
-	dec = mfspr(SPRN_DEC);
 	tb = mftb();
-	if (dec < 0)
+	next_timer = timer_get_next_tb();
+	if (tb >= next_timer)
 		return BOOK3S_INTERRUPT_HV_DECREMENTER;
-	local_paca->kvm_hstate.dec_expires = dec + tb;
-	if (local_paca->kvm_hstate.dec_expires < time_limit)
-		time_limit = local_paca->kvm_hstate.dec_expires;
+	local_paca->kvm_hstate.dec_expires = next_timer;
+	if (next_timer < time_limit)
+		time_limit = next_timer;
 
 	vcpu->arch.ceded = 0;
 
-- 
2.23.0

