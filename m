Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF3F3E95C8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Aug 2021 18:18:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GlFPY4lgXz3fkt
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Aug 2021 02:18:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Pd2qjHpS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031;
 helo=mail-pj1-x1031.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Pd2qjHpS; dkim-atps=neutral
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GlF341Jd3z3bn7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Aug 2021 02:02:55 +1000 (AEST)
Received: by mail-pj1-x1031.google.com with SMTP id
 u21-20020a17090a8915b02901782c36f543so10327564pjn.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Aug 2021 09:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HcmzAMOblnFfBcnkC6E3lPv/DD88a8O4ehbqoWdwBuU=;
 b=Pd2qjHpS1RhttRymMp3KomvQpWIMnZCD8zlv5xyohfqa1X9sxUgMjoSHZFUuNRHmqR
 DYFRkVtXj84gCL+eBV17X5oanb6ZRkK16ElOGMcpaU9unbLSleHC2JWSDPuQkhAxLume
 xfceMY0v73942AMbAug3Bq9th6xSs+/6qra+F+NtHpf4W4+f28DOgW3vkQQQjSMpdNr0
 ZMYFRWqhIG6qz6B9ngqXihLJdCUnEifog/C4zq0aFxEjkoqnQatTr0TIM5hC10935xWU
 gRkPzOk8dqF3aMRbC13LfpHTN+4dsgkuTT2xDPH5KqlMeNWZOF25lOGK15Y3yhexr0WD
 TVbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HcmzAMOblnFfBcnkC6E3lPv/DD88a8O4ehbqoWdwBuU=;
 b=UQ6oqYmsu9ItLZMnVZJO7zcmMprjXc9xG5SnnGCVphLJ8IEaLUK4iKKq+ZU6u89jTn
 fLIYfGrvwIJUHiU+/trH3gq4334xae8MjjqYW3ltL20S209AmpxDee1bfYXGgXremoeX
 JW1T1TqSmSP5uYZ2257t7N6cHOvPiiRym7GRSfdnAojtvjdSDgEmgqLTA/q+afr3DYx4
 Cj5Wwgig4w9u2cLnNEIfuqb1hXpQZXLQ1cL3mabDypaZkDg9lohY3plESyqm0FQh9Xe0
 BQ/LIVGBi/AWt0Tu/pCYAmJ6Vwoxw07cHOlaZQJ17hVItW+6fB0JXTyIrgiPrFOGLuzt
 t/nQ==
X-Gm-Message-State: AOAM533MdP+qK5tbfQ4/+sCf6R50GKD6D2RS5bxjceVYOJ7LPVqyF2gl
 qyf3CweGVb48SODf/ZU7rN8=
X-Google-Smtp-Source: ABdhPJyPrzD2/ExAIrif/iw8efaaUMRHK8sWQ01m3JyACJBG7euhxP5u3TlZybgCnr2Sq0hBG1XMuw==
X-Received: by 2002:a17:902:7611:b029:12b:e55e:6ee8 with SMTP id
 k17-20020a1709027611b029012be55e6ee8mr4874557pll.4.1628697773972; 
 Wed, 11 Aug 2021 09:02:53 -0700 (PDT)
Received: from bobo.ibm.com ([118.210.97.79])
 by smtp.gmail.com with ESMTPSA id k19sm6596494pff.28.2021.08.11.09.02.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Aug 2021 09:02:53 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v2 26/60] KVM: PPC: Book3S HV P9: Move SPRG restore to
 restore_p9_host_os_sprs
Date: Thu, 12 Aug 2021 02:01:00 +1000
Message-Id: <20210811160134.904987-27-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210811160134.904987-1-npiggin@gmail.com>
References: <20210811160134.904987-1-npiggin@gmail.com>
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

Move the SPR update into its relevant helper function. This will
help with SPR scheduling improvements in later changes.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index f9942eeaefd3..ef8c41396883 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -4093,6 +4093,8 @@ static void save_p9_host_os_sprs(struct p9_host_os_sprs *host_os_sprs)
 static void restore_p9_host_os_sprs(struct kvm_vcpu *vcpu,
 				    struct p9_host_os_sprs *host_os_sprs)
 {
+	mtspr(SPRN_SPRG_VDSO_WRITE, local_paca->sprg_vdso);
+
 	mtspr(SPRN_PSPB, 0);
 	mtspr(SPRN_UAMOR, 0);
 
@@ -4292,8 +4294,6 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	timer_rearm_host_dec(tb);
 
-	mtspr(SPRN_SPRG_VDSO_WRITE, local_paca->sprg_vdso);
-
 	kvmppc_subcore_exit_guest();
 
 	return trap;
-- 
2.23.0

