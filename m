Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C04B13454A0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 02:06:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4Cqf5Gcsz3cYP
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 12:06:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=SWE1QWI1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42d;
 helo=mail-pf1-x42d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=SWE1QWI1; dkim-atps=neutral
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F4CmT6CsWz30Bf
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 12:03:37 +1100 (AEDT)
Received: by mail-pf1-x42d.google.com with SMTP id c17so5625579pfn.6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Mar 2021 18:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jg3hJJ3AY2PRkc+v0V7qcNrjz/l+y41Urd3AyMqPGgM=;
 b=SWE1QWI10AhCc9y8qwD3x90YQGTmiIud1M4CAKj9C7wM66nPX9am8/nrcs5BlBX8lX
 /ict70IatbGRWiIh36ZjP+T0s7w6sjHFyWNgm68Dl2U8J+FBCTUFuoHu7lQIhqbou7hR
 ml+IYIvvuuCNjfuTvBF+ObvQNpBpJQ66ltGM10FegddIjwqcK/WhXOo+VB4ams6KnQ4M
 lg07VIck/JOCj/XZryRQ9W/KnlXK92sy8SZZwv+MsgI8wCl7nMTDRgDK6wXBE/gGpNBa
 Tv+KsGYpwR6yijKqgCqFYuwYjS/EEwTzOOokhzMXBgYvy5v4/hq5sCh8GO5oamnbr91H
 19og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jg3hJJ3AY2PRkc+v0V7qcNrjz/l+y41Urd3AyMqPGgM=;
 b=m0et1yzLP2EAdlSnbPqJnY47oOZERBwz2P45sN+bI4hgI/FUcd9LjEfgle7EkYcF98
 zEt5juVtEJy2MRihs0DTLyKEYWbxhhX8LAWnwHoAIzHEeVSvyUfgEiRpFYS/XcefkeQF
 cZUV/R9Cnio0GVa7TW1xlSCH9c9VMoiUq3q2qRrf4kWGvgwxK4cUmocaY+HrfjoHZsmH
 kGnpauuW7/X7sgF/NSFyurow/p8ed0929E5DdaZa11gBrAyCNrGgi742Es7z8MGTQT5D
 o0gGEW7uGrMwOO/XeZL7tQL4tYzXTroulls9vLF0b+lymI7g2FrLXGTPKPM+2OMmCax1
 oX+A==
X-Gm-Message-State: AOAM530dVRS3RlKUBDv+g2m+yqwbk1tMhywdd3My3n+i8QezEJGguFlR
 CM6ZolfxroXfx7JAKX7YVcuVacDcuLE=
X-Google-Smtp-Source: ABdhPJzvuQhaH04pDc6YtgQ6MnkZPXqQZrr/Zhyytlbcus36SAz7DmWu8xFjZacz4nCnY+mwoVMu7Q==
X-Received: by 2002:a17:902:820e:b029:e6:f006:fcff with SMTP id
 x14-20020a170902820eb02900e6f006fcffmr1229901pln.60.1616461416065; 
 Mon, 22 Mar 2021 18:03:36 -0700 (PDT)
Received: from bobo.ibm.com ([58.84.78.96])
 by smtp.gmail.com with ESMTPSA id e7sm14491894pfc.88.2021.03.22.18.03.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 18:03:35 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v4 06/46] KVM: PPC: Book3S HV: remove unused kvmppc_h_protect
 argument
Date: Tue, 23 Mar 2021 11:02:25 +1000
Message-Id: <20210323010305.1045293-7-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The va argument is not used in the function or set by its asm caller,
so remove it to be safe.

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

