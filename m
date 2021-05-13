Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CE61437F7C8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 May 2021 14:23:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FgrR05Pbjz3byG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 May 2021 22:23:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=E9KfwotH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::434;
 helo=mail-pf1-x434.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=E9KfwotH; dkim-atps=neutral
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FgrQ56Z8Fz2xv4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 May 2021 22:22:21 +1000 (AEST)
Received: by mail-pf1-x434.google.com with SMTP id v191so21538788pfc.8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 May 2021 05:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eGM6R89PIkkLJyjMzOWuMBkIHDUaBOLuaplgVGCT/7E=;
 b=E9KfwotHdvYEjj2A4qq8ORGAqRkO7GXAq0tT3p/PX/YzRcMvf1pqk577U+KLoGQrQv
 b5tsigYWaJ85KKNokHfFH1gPvNXvjYm3Lw2ddrXVDJXwNx+zC/YKkrWdzilG2WynLAeh
 Itf9f/7kBHpibqwCNsIgjhaCiioOrApaSOmB6TyXTg/rXeMf9PrgECMnls2BOFzZ5KX+
 JQJ2YtBZ7kDbHM20PCmnFmj4caLYrweEa0JPhLt83oZyeqC6G0R/lg9mpjXAKmNaCm13
 dIaUeq1r7GD++TBpHxLZ1XvwIswUoABNrDt5XlZQ9rqBKKOy7F6ULI3sX5yFnVDPPawJ
 2h2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eGM6R89PIkkLJyjMzOWuMBkIHDUaBOLuaplgVGCT/7E=;
 b=jMHbVMukjzzIghRXoKxRz/RqF2vajAd0Qg/uiu+eofrC4d3RXohdTeShlwosoibv8V
 gDjziGEOdShvDDsFQVYzgUgUNYbYQiyh5pUMPQ3fvSllBfZYZVX71v8UCZNhE02Qa7Ou
 McI+10/z/StnQqD8ut95Z2e1kkWW2YpPzBsWBkbP9bVkgkboIGJ2aSezsP2DTW6eIfIH
 p/a5qljhiQSsJGsP5ETitbm0u8sVMBQkKiwZ5UfsER8idFhA200ytdj6OcYlVmUt4Xtn
 oM1JNSWuIE7LQ7DSu84qrA7jjRhLI5LN36qj3rfkq6XOvSGgaK/OMKyy4cgMG4XpQUZt
 Fr7w==
X-Gm-Message-State: AOAM530hlZi5el6hzXLrrF4fdSCbghV+DoVANzeVRqsSsa0hAARl/6xW
 iK4+o4/OnEiLNz0M9Hx2Wrs=
X-Google-Smtp-Source: ABdhPJxAyTpU+8Q758bSn1GYBTv27JgQt2JQCrXyBX7dfbC28sizZ0ltNivT6CCp0329moU3l6ERbA==
X-Received: by 2002:a05:6a00:1c63:b029:2a8:b80a:1244 with SMTP id
 s35-20020a056a001c63b02902a8b80a1244mr33088578pfw.72.1620908538849; 
 Thu, 13 May 2021 05:22:18 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (14-201-155-8.tpgi.com.au. [14.201.155.8])
 by smtp.gmail.com with ESMTPSA id
 mp21sm6892416pjb.50.2021.05.13.05.22.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 05:22:18 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH 1/4] KVM: PPC: Book3S HV P9: Move xive vcpu context management
 into kvmhv_p9_guest_entry
Date: Thu, 13 May 2021 22:22:04 +1000
Message-Id: <20210513122207.1897664-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210513122207.1897664-1-npiggin@gmail.com>
References: <20210513122207.1897664-1-npiggin@gmail.com>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Move the xive management up so the low level register switching can be
pushed further down in a later patch. XIVE MMIO CI operations can run in
higher level code with machine checks, tracing, etc., available.

Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 8a31df067c65..68914b26017b 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3558,15 +3558,11 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_vcpu *vcpu, u64 time_limit,
 	 */
 	mtspr(SPRN_HDEC, hdec);
 
-	kvmppc_xive_push_vcpu(vcpu);
-
 	mtspr(SPRN_SRR0, vcpu->arch.shregs.srr0);
 	mtspr(SPRN_SRR1, vcpu->arch.shregs.srr1);
 
 	trap = __kvmhv_vcpu_entry_p9(vcpu);
 
-	kvmppc_xive_pull_vcpu(vcpu);
-
 	/* Advance host PURR/SPURR by the amount used by guest */
 	purr = mfspr(SPRN_PURR);
 	spurr = mfspr(SPRN_SPURR);
@@ -3764,7 +3760,10 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 			trap = 0;
 		}
 	} else {
+		kvmppc_xive_push_vcpu(vcpu);
 		trap = kvmhv_load_hv_regs_and_go(vcpu, time_limit, lpcr);
+		kvmppc_xive_pull_vcpu(vcpu);
+
 	}
 
 	vcpu->arch.slb_max = 0;
-- 
2.23.0

