Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4CD23E9585
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Aug 2021 18:06:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GlF7f3SPjz3dkx
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Aug 2021 02:06:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=sSj9xBVD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f;
 helo=mail-pl1-x62f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=sSj9xBVD; dkim-atps=neutral
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GlF2706rBz30L2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Aug 2021 02:02:06 +1000 (AEST)
Received: by mail-pl1-x62f.google.com with SMTP id n12so2616968plf.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Aug 2021 09:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FIn8UyB5857Vdy2BoINpCb9wuJq8s9gPoZz4Xu4yDfU=;
 b=sSj9xBVDl75/eJWzEvk+K430dQ484klUIfLlSJKCUM1/+lrQKcMJPCTQTFxMuqCrqf
 0tAmVtq9PfSgsGNX6X3ijzEQ7OI47EQqkDf85Fncb3jV4M+bOskM8vE6x1iKCdEn9qCB
 pHQICgZZO+usoUGkpxXcBhUzBaMgemEjTzLFm7j8b2EDCEmEe+gHXGXbXhQSObpxKrHS
 HdWd3Mr+X8+izi79Q/uPgfOvN4U9nIM/9D6YQHXvkwoUiwCGNJZpISRDszeUhZBm90I+
 Jhr5kMApD/D9VgdDPI5IGxTQTiAEa7FvTH+0W/ErEB/pgNCODbZ8+ebCb3GYcz6Tbv9s
 Zo5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FIn8UyB5857Vdy2BoINpCb9wuJq8s9gPoZz4Xu4yDfU=;
 b=sg4Z+UM+yFVtDIguJYlFiwtKMIu8GLz9fgR+zxy2/VqWxtNbc7c+s/xmaQUlBGa0be
 Gn8AETvIFAtEZm6cySYVe8q33pEepfbwke0t0YkjVmhc1ts7huf4bWt+t7woPKfBsB2i
 szOTYq9hjmGJkpWCFu24XlSUzet6t9gHnJmK/fy97g9EYQgY3CV2S5rx5TNyVeo5Gx27
 J3u6sM9BDgx4CoZF3XgW/Hwip3RL4rInS/g/8WoGqGXOx4W4rQIWOLQWNTq/5NpIoOob
 txhdS5sv10c0a7K/jyKeH43w5jE7UE+WPgNXnKhFbrH3YxY9Y7w7syOTePhxXv7ufBCc
 P5uA==
X-Gm-Message-State: AOAM530uiAY39FJJncwpbTBJcB90KlC+gLf+J9TSZIWoOqkrpCrwN92O
 NTkDeQBk6CKfXnyCePPskCY=
X-Google-Smtp-Source: ABdhPJyR4mhpDw1Ja1VVLy+V8qMCP6gtA2e92qPYuBlNIGCJ5bpg8E8h/gEebz/mYvoPFSpW5/uZYw==
X-Received: by 2002:a63:788e:: with SMTP id t136mr1275639pgc.374.1628697724765; 
 Wed, 11 Aug 2021 09:02:04 -0700 (PDT)
Received: from bobo.ibm.com ([118.210.97.79])
 by smtp.gmail.com with ESMTPSA id k19sm6596494pff.28.2021.08.11.09.02.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Aug 2021 09:02:04 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v2 08/60] KVM: PPC: Book3S HV Nested: save_hv_return_state
 does not require trap argument
Date: Thu, 12 Aug 2021 02:00:42 +1000
Message-Id: <20210811160134.904987-9-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>,
 Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Fabiano Rosas <farosas@linux.ibm.com>

vcpu is already anargument so vcpu->arch.trap can be used directly.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv_nested.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3s_hv_nested.c
index 5ad5014c6f68..ed8a2c9f5629 100644
--- a/arch/powerpc/kvm/book3s_hv_nested.c
+++ b/arch/powerpc/kvm/book3s_hv_nested.c
@@ -99,7 +99,7 @@ static void byteswap_hv_regs(struct hv_guest_state *hr)
 	hr->dawrx1 = swab64(hr->dawrx1);
 }
 
-static void save_hv_return_state(struct kvm_vcpu *vcpu, int trap,
+static void save_hv_return_state(struct kvm_vcpu *vcpu,
 				 struct hv_guest_state *hr)
 {
 	struct kvmppc_vcore *vc = vcpu->arch.vcore;
@@ -118,7 +118,7 @@ static void save_hv_return_state(struct kvm_vcpu *vcpu, int trap,
 	hr->pidr = vcpu->arch.pid;
 	hr->cfar = vcpu->arch.cfar;
 	hr->ppr = vcpu->arch.ppr;
-	switch (trap) {
+	switch (vcpu->arch.trap) {
 	case BOOK3S_INTERRUPT_H_DATA_STORAGE:
 		hr->hdar = vcpu->arch.fault_dar;
 		hr->hdsisr = vcpu->arch.fault_dsisr;
@@ -389,7 +389,7 @@ long kvmhv_enter_nested_guest(struct kvm_vcpu *vcpu)
 	delta_spurr = vcpu->arch.spurr - l2_hv.spurr;
 	delta_ic = vcpu->arch.ic - l2_hv.ic;
 	delta_vtb = vc->vtb - l2_hv.vtb;
-	save_hv_return_state(vcpu, vcpu->arch.trap, &l2_hv);
+	save_hv_return_state(vcpu, &l2_hv);
 
 	/* restore L1 state */
 	vcpu->arch.nested = NULL;
-- 
2.23.0

