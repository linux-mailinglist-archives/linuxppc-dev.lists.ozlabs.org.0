Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C650E353ABD
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Apr 2021 03:23:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FDCbX5Vndz3dNy
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Apr 2021 11:23:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=fx6TdocB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b;
 helo=mail-pl1-x62b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=fx6TdocB; dkim-atps=neutral
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FDCWw4SFJz30DS
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Apr 2021 11:20:28 +1000 (AEST)
Received: by mail-pl1-x62b.google.com with SMTP id h20so4926327plr.4
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 04 Apr 2021 18:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=akE4Bh1LcVOdXlv04bpZUL91EDUzw6Ofnv5OK5AoVW4=;
 b=fx6TdocBGKyQdc27E1MP56nhRztLfViwq3BfdM8VGfIXftWZABA+Q6lvINgWYNmV9x
 aziBchM584a8aqhbmu7wEQdg54s2bEjOJ79NwABJQ9Cu8dGe0AJF9GdIs+sfQG47m1ws
 Jgjfoq/FL3PFq6drpb97J2KLPptiJC0wVQMxdOyVeepfY8vZJ9XfQxqFaSO9p9OLmrAn
 xCONWeMESolgtslixD85tTAOJmAMh0qBaKbuwCv6Jcjk6nk1OKHcbE/RhluVjBUvtam4
 ov5cmCoOFr0dFD0HxGPStuj73wmophXwA1PdcMOzJzXy21RGiZ+Pva9+NrrTv3J37H1V
 gRNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=akE4Bh1LcVOdXlv04bpZUL91EDUzw6Ofnv5OK5AoVW4=;
 b=M4Z/aWiMCGMhqCaelGjnaxx38uXbaQtoOiaTvTpb/1VkQdrB2b6kMExeXvr9EQP+z9
 Y3qwniWJsTORnyFKbMpjskgXBjCBPv7SUdDKmeVh10fO+no7/Af6/W3+Vitxqau5RgQG
 qWgrMYm8l6FczYJnEzpFeFOVsExwUT3uss2TmMOYtqYKQbIZtG6AIH7GKKAF651N8+u4
 tklr7yQHh2T5Jv9KcDswlSRfGjSGbDsy9061xHWO1x3ybPSkruUE5XA7EpO5G3dDxz6F
 nQUHGpeiOdnuOAql/gIxQ/Q8dOJvCleBCywqoDXyjsbeWMKuWHsGDb2B647Xo5IVoBN1
 HJNA==
X-Gm-Message-State: AOAM530/K9sykbgLWesBX+Px/8nqVlbgn2zmT7iG6BpE+zSWO2kmyd2R
 hAkw8Vgwhh75nCAolw5Nm0U=
X-Google-Smtp-Source: ABdhPJxHQeAmERijeyNlHq0Dm/GtcKkz/yuE73BKtZcqomrio6nidKJ/aKwauhmBy2ZqUJTmiR71hQ==
X-Received: by 2002:a17:90b:4d0f:: with SMTP id
 mw15mr24359578pjb.92.1617585626383; 
 Sun, 04 Apr 2021 18:20:26 -0700 (PDT)
Received: from bobo.ibm.com ([1.132.215.134])
 by smtp.gmail.com with ESMTPSA id e3sm14062536pfm.43.2021.04.04.18.20.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Apr 2021 18:20:26 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v6 07/48] KVM: PPC: Book3S HV: Fix CONFIG_SPAPR_TCE_IOMMU=n
 default hcalls
Date: Mon,  5 Apr 2021 11:19:07 +1000
Message-Id: <20210405011948.675354-8-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This config option causes the warning in init_default_hcalls to fire
because the TCE handlers are in the default hcall list but not
implemented.

Acked-by: Paul Mackerras <paulus@ozlabs.org>
Reviewed-by: Daniel Axtens <dja@axtens.net>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 8bc2a5ee9ece..ed77aff9cdb6 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -5409,8 +5409,10 @@ static unsigned int default_hcall_list[] = {
 	H_READ,
 	H_PROTECT,
 	H_BULK_REMOVE,
+#ifdef CONFIG_SPAPR_TCE_IOMMU
 	H_GET_TCE,
 	H_PUT_TCE,
+#endif
 	H_SET_DABR,
 	H_SET_XDABR,
 	H_CEDE,
-- 
2.23.0

