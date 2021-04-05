Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11825353ABA
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Apr 2021 03:22:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FDCZX09Zmz3d1p
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Apr 2021 11:22:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=a4aZwsMy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029;
 helo=mail-pj1-x1029.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=a4aZwsMy; dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FDCWm4KMlz30GV
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Apr 2021 11:20:20 +1000 (AEST)
Received: by mail-pj1-x1029.google.com with SMTP id
 q6-20020a17090a4306b02900c42a012202so5050321pjg.5
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 04 Apr 2021 18:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r+tYArWWu4RNguNhduAefXr3uYY9Yl8n8bH2Jfs1pRM=;
 b=a4aZwsMyJMu0C2njYTAugBqlrA3Wtd9fBeEXZbaMVzQOqhS+VRBfLESrOHM1kj2r7H
 vmFtmrCzQ31NDpX0fzyY8EKDYYaGe0+1w0ED3QEeMuCZzW7SknzsWnHvnnrLircpqAwc
 rPb6x6I0KwMLWFWLAPmPH04RzAGG2S0niXJJ1rOF4EQb/fLFRPVKwtjOVAk821DfMJsB
 onLP78tagVcZCDjvieZJYCvfh8XDODx6koYytXN/NuEYRrHTTdKXn/lOD8h8CsFRFZGA
 YjVtgegcvRsVuG4w1KsIoqxxBPOiQNOPo8cVC7xY39RYeZ5Ovu+CPGAA3AHFlMCVJ1bM
 GiXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r+tYArWWu4RNguNhduAefXr3uYY9Yl8n8bH2Jfs1pRM=;
 b=AB8/7Jk5O2NTAlAIQLCr9QRyrdPqToAFecYonTpCgVV9MBEcGzcpXrPcGbWlpduDoh
 uYQ76QuIYlwZVlF1/bXeqNb5bNfLE8Q1+Yi1MuTj4WGMIEKmFFlWyQkyBV+wfXA3LmYQ
 9ZVKNI8Q3FPkRjJfnZX8kfxA3nHFeSieAEp4xCn5k/X6yO6YvBUZ13SoflSX23XF82AI
 uh6ZLC0S2eeUI7fPrpnEzjWhK4bw7zeIKpTmnHqfv3R5nAqNlmsiEQE/W/ePqixYJKHh
 KHqIDI8k2YwWfrGINS3WeMIU23oI8u2R9rm4xpM6EohCkjWFPUIcqMc+fVxLNyA6rn2/
 6MEw==
X-Gm-Message-State: AOAM533lFVzCYMSCpdJbcx4Cgw4aFpd57R/LAVNlynl7HCoWzM/ms5y8
 FMD3+QK++ZZydXzWZVuIoPw=
X-Google-Smtp-Source: ABdhPJxO8avvP6Fy4tA7YQlADYX9ZQy7YGylbO9U124A+gY/JoOQkUkjK0BQQdv2Uk4srQBOb+VDMw==
X-Received: by 2002:a17:90a:4309:: with SMTP id
 q9mr12625678pjg.40.1617585618454; 
 Sun, 04 Apr 2021 18:20:18 -0700 (PDT)
Received: from bobo.ibm.com ([1.132.215.134])
 by smtp.gmail.com with ESMTPSA id e3sm14062536pfm.43.2021.04.04.18.20.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Apr 2021 18:20:18 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v6 05/48] KVM: PPC: Book3S HV: Remove redundant mtspr PSPB
Date: Mon,  5 Apr 2021 11:19:05 +1000
Message-Id: <20210405011948.675354-6-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210405011948.675354-1-npiggin@gmail.com>
References: <20210405011948.675354-1-npiggin@gmail.com>
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
Cc: Daniel Axtens <dja@axtens.net>, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>, Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This SPR is set to 0 twice when exiting the guest.

Acked-by: Paul Mackerras <paulus@ozlabs.org>
Suggested-by: Fabiano Rosas <farosas@linux.ibm.com>
Reviewed-by: Daniel Axtens <dja@axtens.net>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index a6b5d79d9306..8bc2a5ee9ece 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3787,7 +3787,6 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 	mtspr(SPRN_DSCR, host_dscr);
 	mtspr(SPRN_TIDR, host_tidr);
 	mtspr(SPRN_IAMR, host_iamr);
-	mtspr(SPRN_PSPB, 0);
 
 	if (host_amr != vcpu->arch.amr)
 		mtspr(SPRN_AMR, host_amr);
-- 
2.23.0

