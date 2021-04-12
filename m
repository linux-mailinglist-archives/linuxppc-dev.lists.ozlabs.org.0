Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 207A935B854
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Apr 2021 03:52:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FJWvn0XWKz3dCt
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Apr 2021 11:52:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=oaMIqZMu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032;
 helo=mail-pj1-x1032.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=oaMIqZMu; dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FJWqw0JhSz300c
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Apr 2021 11:49:15 +1000 (AEST)
Received: by mail-pj1-x1032.google.com with SMTP id
 e8-20020a17090a7288b029014e51f5a6baso905673pjg.2
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Apr 2021 18:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kcMSsKOd9XJdn7alZvC43Pwxot302AJo0nnXaxeTFDs=;
 b=oaMIqZMuF9h46PXHq2w5frutdhjVdbzFQ/RgtRuTZVsNH25Sql/BRImfJpf2DppH+j
 qrcUl+hm7A4MnjXqL07G7TbJAe3kwQG0DBJiDVNrEKZhFisbJOV3/48725lnxI6lQ80t
 6uBV3yhMmdYlqlJNvozEpRvCtdmlzMNOZhbynxjhOy9PyZk0wvkLGwGdopOE3aRadKrj
 3aGzBNzvLnoZfH4ZVkZPWzHDVOLcYF5+B1w21OsesRB0Ui0mJ5GRqYGGEwYJDbetXO/w
 DSIT9c5rrwu4Co2c88/CeDFnYFS9es9laG7oVlLkEdfb3rNNNpvDGR4Zy9cgzsB75oMG
 FtaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kcMSsKOd9XJdn7alZvC43Pwxot302AJo0nnXaxeTFDs=;
 b=tv7B4K0eC+gtuxZ8vtO6cxy4DNv9m44oUjbD9Iq54icU92p8IxK0FheLcSrxlosrXA
 1NH8G06U5z3Ug+ygSsfj0BQmrPctVZ8P2JzcFuIIaNTp51kfU0CNy+gy8GUtl0rxTKue
 QThkCVxj5W7dwpX4FtyEmErEvyexsPfa4GSTB2aLqgPVnWjHE4CrwkXEEfKpMcEd8C3P
 Mk1icZmkuDMom7gD7hOMuPm972d0FICdHogpgfaT2l9zoRWvGqzx9T4Vud2ClAzKBRSu
 foKVlOe+7EnHvJjkRtRIuekk/TfF7GZsqKDhGprxI7lmqdddvmIUF1NRyIDWIQXfRXKR
 BnXg==
X-Gm-Message-State: AOAM530dDIYhT3kpFIS5mFGaHb+jqzNMoXAOuhRxR2qLya1t1G83cggR
 xnhB5gfu8JA08mVoGuLOg+M=
X-Google-Smtp-Source: ABdhPJxkVMeKqonbtISJdYvssi+IxOxmxROFHYyGS5xTROxGG3Onv78B4DAmhk+vPzuVS+H+r0AYLQ==
X-Received: by 2002:a17:902:e886:b029:e7:386b:1b30 with SMTP id
 w6-20020a170902e886b02900e7386b1b30mr24255037plg.42.1618192153584; 
 Sun, 11 Apr 2021 18:49:13 -0700 (PDT)
Received: from bobo.ibm.com (193-116-90-211.tpgi.com.au. [193.116.90.211])
 by smtp.gmail.com with ESMTPSA id m9sm9502345pgt.65.2021.04.11.18.49.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Apr 2021 18:49:13 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v1 07/12] KVM: PPC: Book3S HV: remove unused kvmppc_h_protect
 argument
Date: Mon, 12 Apr 2021 11:48:40 +1000
Message-Id: <20210412014845.1517916-8-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210412014845.1517916-1-npiggin@gmail.com>
References: <20210412014845.1517916-1-npiggin@gmail.com>
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

