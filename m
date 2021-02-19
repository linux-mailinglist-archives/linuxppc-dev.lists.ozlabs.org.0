Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 894B531F52B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Feb 2021 07:37:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dhhht4R98z3d2l
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Feb 2021 17:37:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Po25tvx9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f;
 helo=mail-pl1-x62f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Po25tvx9; dkim-atps=neutral
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dhhfq60fwz3cGZ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Feb 2021 17:36:03 +1100 (AEDT)
Received: by mail-pl1-x62f.google.com with SMTP id e9so2823152plh.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Feb 2021 22:36:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MUyPAZov5zQTnV51w9b67tKUx5lS5BqnjhtUfqOoQYw=;
 b=Po25tvx9obyveihZvKAQVz6emB+MZz+r16nFZv2QnLx85epXNG0mr68xSmKsY/15iT
 vZdqrb3VEY2b90qX9bc4Wa5NToOiSPdNmmNMatFWyiUhGv62rrebtxlp6AaWzbMLqr1e
 dX8qBBucDJnZ9NaFmPtQ4UXx/rT1XXXPH0ptUbl6QXs3OJ92dQIfaQqjkxA9aFXcOLYG
 OKcGZzoZKBv9RQ0C8T+L+UpTurrqeGvwRyNceG08vumRz2AT3ysJFq+AXtCWjMeprR5f
 to3EEkxixSy8/Ae3rUx+mDtpOj+GqpvjCmoud5u6E1if5FKh5RPN7IcPw1e7juCWokMq
 x57w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MUyPAZov5zQTnV51w9b67tKUx5lS5BqnjhtUfqOoQYw=;
 b=HZr4GQLnMcbEydeAWITbcK/kukeW4iTtF3RNXcj1Sd74RhRWCkPNHSnDE9mxxYT1Su
 D234LK0EDly0BwPTZzNwIk65xEhyDT0HjU4xfeKLbfuXlq2MIT8IFeWpes3m5lqN0qOc
 jF7Ohzj1spjnWiF8t01um6P45tvS1AhZgHqC86dbjcpm5f7efTLrqzQ2tO99xCn6CzKU
 7eMxDgs5Jwjjpb/gWRvDZGUTsQWkzWEq6kph67+CQ2fHZcW7DnKqsdZMRt1bRfFOiTyF
 m0BGlQgAULKAv+iAJd6036Bq8q5vD7LWCZNPei+Zl6oCIZmwdX/1XIsU4XjHgWMz8XwE
 7RhA==
X-Gm-Message-State: AOAM531Dzp6PhZxSl0wSUD8YryxyT9OtwK6dVH0J++14udHmd+G9twgy
 NB8vXGUTTHLowdkObRv29B8=
X-Google-Smtp-Source: ABdhPJyecnoYuWDxLso9pw/qesZLnH6rz6NAaN7IA1CH6YikLtJgcQydb/NU9cZqczVIn7juyRoyLg==
X-Received: by 2002:a17:90b:1805:: with SMTP id
 lw5mr7699203pjb.82.1613716561567; 
 Thu, 18 Feb 2021 22:36:01 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (14-201-150-91.tpgi.com.au. [14.201.150.91])
 by smtp.gmail.com with ESMTPSA id v16sm7813099pfu.76.2021.02.18.22.35.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Feb 2021 22:36:01 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH 04/13] KVM: PPC: Book3S 64: remove unused kvmppc_h_protect
 argument
Date: Fri, 19 Feb 2021 16:35:33 +1000
Message-Id: <20210219063542.1425130-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210219063542.1425130-1-npiggin@gmail.com>
References: <20210219063542.1425130-1-npiggin@gmail.com>
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

The va argument is not used in the function or set by its asm caller,
so remove it to be safe.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/kvm_ppc.h  | 3 +--
 arch/powerpc/kvm/book3s_hv_rm_mmu.c | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_ppc.h b/arch/powerpc/include/asm/kvm_ppc.h
index 0a056c64c317..45b7610773b1 100644
--- a/arch/powerpc/include/asm/kvm_ppc.h
+++ b/arch/powerpc/include/asm/kvm_ppc.h
@@ -765,8 +765,7 @@ long kvmppc_h_remove(struct kvm_vcpu *vcpu, unsigned long flags,
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
index f87237927096..956522b6ea15 100644
--- a/arch/powerpc/kvm/book3s_hv_rm_mmu.c
+++ b/arch/powerpc/kvm/book3s_hv_rm_mmu.c
@@ -667,8 +667,7 @@ long kvmppc_h_bulk_remove(struct kvm_vcpu *vcpu)
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

