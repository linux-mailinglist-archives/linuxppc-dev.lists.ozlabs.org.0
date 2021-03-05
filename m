Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CBAC32EDDA
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 16:08:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DsWN50WTpz3dCs
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Mar 2021 02:08:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=ozRaWqyO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42f;
 helo=mail-pf1-x42f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ozRaWqyO; dkim-atps=neutral
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DsWKy0r5mz3dBT
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Mar 2021 02:07:01 +1100 (AEDT)
Received: by mail-pf1-x42f.google.com with SMTP id m6so2377866pfk.1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Mar 2021 07:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jg3hJJ3AY2PRkc+v0V7qcNrjz/l+y41Urd3AyMqPGgM=;
 b=ozRaWqyOXFZZIe1oKZ09TVdVMyI8dCsWfXfxYwP23i67RR8WLxy4ZKssAd0HkvE2En
 VzF4XioeJeg2CQzz1VdNqYjEqnHx5/7OWH6i6nCg96t9Pb+MOyYuG683mVRTq2gK6bs/
 gbCkBMVU5IZ4Vd1MWCIszhZc57wpxyF+ImiPgrgL8RCndp3W+81BVDFGR/h8bdrAiCV9
 3hNm7PF+iYbKnjEwtAv5q8GWqHJvGv9rA0m5yXnIS1WRL/FEj99JDcQ9GytMqoX01EbC
 LOVKO9C1Lb643BPkaWWcag0kXzZxHrsaLSEilTzUFt8Y2OXQhjTivC7OvKAsHsFRrHzg
 6kHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jg3hJJ3AY2PRkc+v0V7qcNrjz/l+y41Urd3AyMqPGgM=;
 b=TXh+oq1+44tUISMlccs5DXTFbxS2wFRsTOtt8fo5gOni3BtMb75yqIqOws2naV6nVj
 gqQiw+uUWjnHREG0TKeVFbhWmZnz76Em0/3rdr/Rru3Wj7aZ1DGGlDhc/2d/fqSMJFm7
 riL9zgw5dbDQsM8hW9GcevU4ebJLOOGzgCgib+zArZL79S4pa/fEbMZYjNTjCXzDVYyV
 o8NAPnv9cwlAnlldZ6A/eJ/1HV0NMH689jfyzdSw2BAZuuUJDD1jrpXSU6eMKtyDI4DE
 DNnBRbNOG6PWNYEAAZwjDObckI4ajbOqwinAJ33gcXV0a02w0yBYQCZ5EemMUrLkK9y/
 vgPg==
X-Gm-Message-State: AOAM531by+RQgxBnzagLIYTmFpu6W06qouOwEPPCHnhl0YSaPqOcbCEi
 AVU9bwjchVdcFdczibNTcpvE6i5CjsQ=
X-Google-Smtp-Source: ABdhPJzegQq0tsMJ2CKEU1yp/D4gqtyXoE40J4UK9COw6KOPhttFwmKagBrbcYSrwEIGWEnWBOlbhQ==
X-Received: by 2002:a65:52c6:: with SMTP id z6mr9126628pgp.132.1614956819808; 
 Fri, 05 Mar 2021 07:06:59 -0800 (PST)
Received: from bobo.ibm.com (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id m5sm1348982pfd.96.2021.03.05.07.06.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 07:06:59 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v3 04/41] KVM: PPC: Book3S HV: remove unused kvmppc_h_protect
 argument
Date: Sat,  6 Mar 2021 01:06:01 +1000
Message-Id: <20210305150638.2675513-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210305150638.2675513-1-npiggin@gmail.com>
References: <20210305150638.2675513-1-npiggin@gmail.com>
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

