Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA243454E8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 02:21:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4D9J6bJ5z3h7J
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 12:21:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=k1lc0eiP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1035;
 helo=mail-pj1-x1035.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=k1lc0eiP; dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F4CpQ0HH3z3cB1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 12:05:18 +1100 (AEDT)
Received: by mail-pj1-x1035.google.com with SMTP id
 q6-20020a17090a4306b02900c42a012202so9383590pjg.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Mar 2021 18:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3HOlzMOQTyMx3+oJJcmS0eDxUvWov/rK0Ppdfq9k4uM=;
 b=k1lc0eiPw3tpV/7pFHwxf8llaTStIBB1onC3gyCxio3XhdBXYN4ECk1ttrgEOsKnAK
 liFQjQ5SeHTEQzXLZKFTiXFcRfmg6D3QZ3TUCEq5S8bhGK2rCG9NwVC3Flp1XwXPsSZA
 N/4JbP2uFCBN+f+A9lofvw//p6KvkDW/Wt772RHP3yCso13EOqXGOa63vX8FF+uECa+A
 dAckUB1CaBl/hWj1KImteVlspTJFAhfg1esqhyH7csF7G1RjSf3luqiTR37QPxRA+njv
 toFrA7FHKbXhmHstj1ABu6Ypz2CCoGWsGFsypni8TbIgOCjaVb240pMQ0NIA+vXsCcMp
 +Wzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3HOlzMOQTyMx3+oJJcmS0eDxUvWov/rK0Ppdfq9k4uM=;
 b=dX+ASbC0BulmTg/FR50ddADshGpOrIMV+1lo7OFkfFgTmlHCA/yDX5YpxmNULuFP+9
 7Ue1275aieMT3NfyIudbZfH/dCFdhqAQ66216xO+SUOY0RCw0Zpnsa5nNtAkiA2GXgsy
 lr3acjA8B5gqIYEYm2wu1c6NjGuzcgoww1siVGz5iI8zJQFx/kvtk9mj66jxkMccCPea
 +wW3SoT4vc+0oW7OKh+AFEWCxoSsjls9MuL37xC2vmlNakeQ/R9ahZom5URQcp0TB9Pv
 ncBYWl7eI4bOgSIOU/+4H3bgU7k+xl2UNgorclIaTBRYLgDvjH9hJwQPCuKeeWSLX00u
 NjBw==
X-Gm-Message-State: AOAM530hdF71PNOtaX1y9f4zILbZmbSp2NppDDqIgIdD3FcOQ9N/106p
 elOm4jmIs+FbZABY4CV74zyB91BIWDw=
X-Google-Smtp-Source: ABdhPJyteIdH4M5PV71IhIZ7DJUhfYQnBfviAaAtPx0jfh7eSevP5rjryXeXQrWDt+Zak4sIzQF1dw==
X-Received: by 2002:a17:90a:1642:: with SMTP id
 x2mr1883961pje.88.1616461515524; 
 Mon, 22 Mar 2021 18:05:15 -0700 (PDT)
Received: from bobo.ibm.com ([58.84.78.96])
 by smtp.gmail.com with ESMTPSA id e7sm14491894pfc.88.2021.03.22.18.05.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 18:05:15 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v4 41/46] KVM: PPC: Book3S HV P9: Allow all P9 processors to
 enable nested HV
Date: Tue, 23 Mar 2021 11:03:00 +1000
Message-Id: <20210323010305.1045293-42-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

All radix guests go via the P9 path now, so there is no need to limit
nested HV to processors that support "mixed mode" MMU. Remove the
restriction.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 85a14ce0ea0e..0f3c1792ab86 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -5420,7 +5420,7 @@ static int kvmhv_enable_nested(struct kvm *kvm)
 {
 	if (!nested)
 		return -EPERM;
-	if (!cpu_has_feature(CPU_FTR_ARCH_300) || no_mixing_hpt_and_radix)
+	if (!cpu_has_feature(CPU_FTR_ARCH_300))
 		return -ENODEV;
 
 	/* kvm == NULL means the caller is testing if the capability exists */
-- 
2.23.0

