Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE493454BA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 02:12:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4Cz65jZSz3fSt
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 12:12:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=PTWpeeYx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52f;
 helo=mail-pg1-x52f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=PTWpeeYx; dkim-atps=neutral
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F4CnP429dz3bs4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 12:04:25 +1100 (AEDT)
Received: by mail-pg1-x52f.google.com with SMTP id 32so3911680pgm.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Mar 2021 18:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R0taHWtZ3E1sIBfZp7RKQEQllxmUlSeRTBhAMSD5/is=;
 b=PTWpeeYxlnMfWsdDiJJlLHjl6ItViJZRy90Tqw3WEN+dxEUICdZk8fUxrDKdvBYRv7
 pIHvBS6m8YhZmpKozfiQyYM0u+Or2aVUQAxSIahppr2nBOvFYnmQqgwlrLBVSo2s0ebh
 DGwXIEldXTE9wovTryzlWbxsd0JtMPxIxQC0jKnfpQiioYYU+aIA0BskYtJvH9swIxQL
 0kRdT4D7/wvJ/bEHOeaOfAxwOAMmMIHWZ0MlloxqPHSAON3WGk/e4sf/Dg0OnpvuQueu
 cx5fVqKJ4PyG1cE/uto/4/Iz5fPmOGchdN6xKBUPKH3sz7ucmoUVcWKaMzZo5zpYI634
 qjqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R0taHWtZ3E1sIBfZp7RKQEQllxmUlSeRTBhAMSD5/is=;
 b=kbuP1njL0RK1X6EjEPeX12efu7DUvU0JHBOFXMXXUk09ViwQ3+e54itm5dMD2I5UyM
 uFF6UZLkeA3e+YJPDR5MGog28qnUNArfrFZauBLJ0SpYdg/Lcvvgx22C03rGQ6dekdS3
 gMWePSwj7DaMNu4YYGhajCgtR6ZnQUo4TleIYkzX+/+2fVG1RHDrbzB2o0fNZMOV2xMD
 /HhBIi2zGW9x+e7xXIBCxyUDAB3wxhnYR0ORswCGtxawlZYTE7M82bkF8W3wcxflICJW
 XHvFw3jKny1w2qSWaBa2pYVfbUJ+swJCHGqAJ7VfFNp4dRdEaqwCLBnnUIJ5n6PKcdU7
 SiYA==
X-Gm-Message-State: AOAM531r1YvXNqqeySoiwkkP7IUcK+m09HLOpeQIXC9riWrZHUBTDutC
 p2q9mb/a3xEV5yYtOsCQRLdWrRFYcRA=
X-Google-Smtp-Source: ABdhPJz6G+DNSChDQurd6Ngaqiw6IC125pC5Df6WNQiz+im5tFwF0fsEmXHtLWrjFU/SeuXpE4NZRg==
X-Received: by 2002:a17:902:8497:b029:e6:f01d:9c9f with SMTP id
 c23-20020a1709028497b02900e6f01d9c9fmr961709plo.7.1616461462559; 
 Mon, 22 Mar 2021 18:04:22 -0700 (PDT)
Received: from bobo.ibm.com ([58.84.78.96])
 by smtp.gmail.com with ESMTPSA id e7sm14491894pfc.88.2021.03.22.18.04.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 18:04:22 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v4 21/46] KVM: PPC: Book3S HV P9: Move xive vcpu context
 management into kvmhv_p9_guest_entry
Date: Tue, 23 Mar 2021 11:02:40 +1000
Message-Id: <20210323010305.1045293-22-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210323010305.1045293-1-npiggin@gmail.com>
References: <20210323010305.1045293-1-npiggin@gmail.com>
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
index d28fb76b08e1..fa7614c37e08 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3592,15 +3592,11 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_vcpu *vcpu, u64 time_limit,
 
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
@@ -3783,7 +3779,10 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
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

