Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 472073515D7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 17:06:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FB639257xz3dYT
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Apr 2021 02:06:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=X42s5iMI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630;
 helo=mail-pl1-x630.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=X42s5iMI; dkim-atps=neutral
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FB5zx6Nkqz3btM
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Apr 2021 02:03:57 +1100 (AEDT)
Received: by mail-pl1-x630.google.com with SMTP id w11so1157991ply.6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Apr 2021 08:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kcMSsKOd9XJdn7alZvC43Pwxot302AJo0nnXaxeTFDs=;
 b=X42s5iMIZ8VJmYhLjDMQ1fG68+zbh1OZGwNj581LTwHnZyFso7dfXWP5kG2pehaXKf
 cc1Aev+HMViY+WgaOyBKv2QBEtiz4/CK1/hPgBuOnn8jDCkA/LrLDs4CVZMOLGdT9y/I
 m7P3ku5KL4BFRoNG1JBoiaA8HR00t4FwR8cBBgjfxio2ObTrEjGVCgZBt35BIHNh08/E
 TirvTq6DEmXzU6dFW7XhBm0pWc4ttCH0S2a3EwbKwu8V6XvnUmQbf+4MfQnL9gFOvTRG
 DGPigADvIi27D9Eegmo+GHPYyXQt1BEuudpIbWtMEYL2vxz8hLQhCahA4H2YHy1eHAte
 89sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kcMSsKOd9XJdn7alZvC43Pwxot302AJo0nnXaxeTFDs=;
 b=QBO9U+jw9E6vUL1m72EIAIbbHec1yBlkqtMlz+KCY/wYA8clUwoJq2uMIdqyfR2KDr
 SraJdEpDgwU0vJBrZim9gygoPR5A1RyG5mlS5DDEiIaTfLQnusfmjWItDfQO0wca3XTn
 kgXSYX5BNRM7GhFCJ4WgODmCOiyiZldLMltJ63L7egYpIhWdgc2eNho5FKq+yxU+5wVy
 t1bOUGpjtO9g9jOzScaX/Lrsa6++hpx/oOsoYXh+D6fOhBuMfi5qKbWDk+imssT0E3uu
 sOH0Ki7326HQ/xdLIHpboBIIH7sBY0bzrbAjsKXIrDMS5MGpNUPt1l1Vea+bCEB1/wu2
 wQdw==
X-Gm-Message-State: AOAM532aQS8bWhxbKZYvCC//bvBJ01WPCwAwyIpz6Q+JsFsSz1FhpVpN
 y6aWbFaZwje1DitXVHqJJnApQ2vSxnw=
X-Google-Smtp-Source: ABdhPJzucCzWJyJxZ6llO8KDm+Iua3MGa/eX4OL0JhjyB/Zj+t6yc4J+MGXAJy02ZMDFx+UaSbesrQ==
X-Received: by 2002:a17:903:22c2:b029:e7:1f02:434c with SMTP id
 y2-20020a17090322c2b02900e71f02434cmr8391810plg.73.1617289435762; 
 Thu, 01 Apr 2021 08:03:55 -0700 (PDT)
Received: from bobo.ibm.com ([1.128.218.207])
 by smtp.gmail.com with ESMTPSA id l3sm5599632pju.44.2021.04.01.08.03.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 08:03:55 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v5 06/48] KVM: PPC: Book3S HV: remove unused kvmppc_h_protect
 argument
Date: Fri,  2 Apr 2021 01:02:43 +1000
Message-Id: <20210401150325.442125-7-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The va argument is not used in the function or set by its asm caller,
so remove it to be safe.

Acked-by: Paul Mackerras <paulus@ozlabs.org>
Reviewed-by: Daniel Axtens <dja@axtens.net>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/kvm_ppc.h  | 3 +--
 arch/powerpc/kvm/book3s_hv_rm_mmu.c | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_ppc.h b/arch/powerpc/include/asm/kvm_ppc.h
index 8aacd76bb702..9531b1c1b190 100644
--- a/arch/powerpc/include/asm/kvm_ppc.h
+++ b/arch/powerpc/include/asm/kvm_ppc.h
@@ -767,8 +767,7 @@ long kvmppc_h_remove(struct kvm_vcpu *vcpu, unsigned long flags,
                      unsigned long pte_index, unsigned long avpn);
 long kvmppc_h_bulk_remove(struct kvm_vcpu *vcpu);
 long kvmppc_h_protect(struct kvm_vcpu *vcpu, unsigned long flags,
-                      unsigned long pte_index, unsigned long avpn,
-                      unsigned long va);
+                      unsigned long pte_index, unsigned long avpn);
 long kvmppc_h_read(struct kvm_vcpu *vcpu, unsigned long flags,
                    unsigned long pte_index);
 long kvmppc_h_clear_ref(struct kvm_vcpu *vcpu, unsigned long flags,
diff --git a/arch/powerpc/kvm/book3s_hv_rm_mmu.c b/arch/powerpc/kvm/book3s_hv_rm_mmu.c
index 88da2764c1bb..7af7c70f1468 100644
--- a/arch/powerpc/kvm/book3s_hv_rm_mmu.c
+++ b/arch/powerpc/kvm/book3s_hv_rm_mmu.c
@@ -673,8 +673,7 @@ long kvmppc_h_bulk_remove(struct kvm_vcpu *vcpu)
 }
 
 long kvmppc_h_protect(struct kvm_vcpu *vcpu, unsigned long flags,
-		      unsigned long pte_index, unsigned long avpn,
-		      unsigned long va)
+		      unsigned long pte_index, unsigned long avpn)
 {
 	struct kvm *kvm = vcpu->kvm;
 	__be64 *hpte;
-- 
2.23.0

