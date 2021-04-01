Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0053D3515F9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 17:13:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FB6Br6tjmz3fVx
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Apr 2021 02:13:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=QDrbaKKl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52e;
 helo=mail-pg1-x52e.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=QDrbaKKl; dkim-atps=neutral
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FB60r5sTJz3bsQ
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Apr 2021 02:04:44 +1100 (AEDT)
Received: by mail-pg1-x52e.google.com with SMTP id l76so1697900pga.6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Apr 2021 08:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c0MvDZ1F9X/SZ94TT66c0+OApX1YU3GVKikmjXf/RuQ=;
 b=QDrbaKKl4WJo116T3m5J+nThsFCCAJjbD08Ya/KCo3bhZr+RUNprwOenBM+8uA+h6W
 CLBaueG1oeu71aqam273bP/zbIuwLvvRd/QwThvZMYnol/TNSAozWKQV0ss1bnU3h7Gw
 Z1yF+oMMZxWXXK1HvVlkFHGZeLztPzKAbjpgS+gxgUj3G4A+1/GG0y103ux8ukXEqkDg
 q6jUY54mGVXL6W8sMKcvMCvuqbKnEIEgsoatjk/SctwypEHwJq+s3ZZJxMaFCrLc3g3v
 A4nFlNRTwp5P82bnJsARO6GX+i2nWdUAGxHBwKjRzM+89ibwcxdLVar/BkKkbgj2x1oZ
 aFQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c0MvDZ1F9X/SZ94TT66c0+OApX1YU3GVKikmjXf/RuQ=;
 b=O9YVqwTsy+687HDxTSurMuMtZmkcYZ3gwnQY5+LlC6Gcd6mcUDYxulaobX5haHQHzW
 oGD8QliBra6r411Ttqz35SCxwxxqRWv+5ne63VEayHnkQe4DjoC7oGQQKlrNM5pooV/S
 Eg+zVKixKc0oP6EcNinSLohZXdTFb9X6ITR5W5lxsIJnBZRmZsi6flRUCKja+FtNcbCr
 JniRwyxKmXIySg+xja3uOUX0cFNm+8fAFunXG1YqrBpRKqHbawvf4JzD4nBZMX3M56pr
 XZxKvNf9vhG9psh9g6X92e05owho+SsNw3M1Ig1T5takwEGYZ2/Q6fzdLrVKCavt7oVC
 Z6ag==
X-Gm-Message-State: AOAM531BlPKA4hFSQ4yJHVb1rMj9HxdTeapPApKHULdh40Jpofbmbr4+
 kc7DczW26tZzFgylq/mIQ57TY9D1ajs=
X-Google-Smtp-Source: ABdhPJwoe9nt/y+HVSAP7R7a6fwU0KO2dPmkum/E2dxR1CHVvxDjeD2Hs+X2glI01g4qufvlQHqo3Q==
X-Received: by 2002:aa7:9687:0:b029:22e:e5ce:95b6 with SMTP id
 f7-20020aa796870000b029022ee5ce95b6mr7902473pfk.53.1617289482652; 
 Thu, 01 Apr 2021 08:04:42 -0700 (PDT)
Received: from bobo.ibm.com ([1.128.218.207])
 by smtp.gmail.com with ESMTPSA id l3sm5599632pju.44.2021.04.01.08.04.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 08:04:42 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v5 21/48] KVM: PPC: Book3S HV P9: Move xive vcpu context
 management into kvmhv_p9_guest_entry
Date: Fri,  2 Apr 2021 01:02:58 +1000
Message-Id: <20210401150325.442125-22-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210401150325.442125-1-npiggin@gmail.com>
References: <20210401150325.442125-1-npiggin@gmail.com>
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
index 6ca47f26a397..2dc65d752f80 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3598,15 +3598,11 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	switch_mmu_to_guest_radix(kvm, vcpu, lpcr);
 
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
@@ -3789,7 +3785,10 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
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

