Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AAC43250B4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Feb 2021 14:47:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DmYyL0z4Gz3d4W
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Feb 2021 00:47:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=i3qCvJVz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634;
 helo=mail-pl1-x634.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=i3qCvJVz; dkim-atps=neutral
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DmYxV1RGgz3cJw
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Feb 2021 00:47:09 +1100 (AEDT)
Received: by mail-pl1-x634.google.com with SMTP id z7so3211015plk.7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Feb 2021 05:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cO00I9izdaV4ZgywXXN1ZhPvhTZLsxjfozyqUloYMJs=;
 b=i3qCvJVzCcy802+nvTxBiHekWsPWWkwBLd4OSSo9Y5NMCgrCrskQQfjoKVRNw5HivF
 S/c7t1ymihEz2eEWtuJtIaiONYmuAZxUVbZD3ztWfuitdn/E63hdnaR+rEV+naH1tg5U
 NHOEkMIsTXeOEuqsEvvtOzA10v83xTArUnMoq+o5hgii+5vEHAuD37XP3d7JpOvcRU8F
 fda7X6oj3xHFTnsm8jttHHil1BWy1jc9jDohcO77l2dCxc6eFQmR4laYrAytNn1zyid1
 5WmIVXHAOoBhV4xcAwpOo7VB96ATJIeWs4IoEXi9CZAc0i0rS9nX00gnac8dysrxIUyU
 cgPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cO00I9izdaV4ZgywXXN1ZhPvhTZLsxjfozyqUloYMJs=;
 b=SQYe0filL0feGun6eTdmQ6Boc+lvhzoOSwDzKzWNxdbz0kl5ubfYFr3fpxiFVdC+kB
 5TJjOKlzAQRh3CGWRvFe56XvW0C+cWMUAPq5o5cczqPQJnoZnDOVkeA3q9mmsvBDvkUc
 0uoKbWwpWRhlXR5I3lny4keoLJoXvlCswMU7DXLtBgOXTlrsdvrI+WxS+H5pTMhCC+uK
 TnfXkCaqLyxIyWF/89EI0iSZyB4cg715BQfbEKlUd0IiL9NKZ/AE1Z3DYZAb4BCuXPSU
 rT0rxAQKjCzJ6j7xAtA7KYz35Hj4Saazw2yl1/Y4NE2qPNeGlxgnDBdFAfq1UJjsoe1y
 Dkhw==
X-Gm-Message-State: AOAM530SaQI1x1jcCatz9QwhOpQSN+n/rMl+M03UM0FhvIHY4bF5JPlz
 3qhvlvwGs95Wm7/Kg4hjRfOYXZxF3RU=
X-Google-Smtp-Source: ABdhPJxXmN8PHnlMQg/qlEiR4RRkwJOHlBHBokTevTL+jVA25EQK2114P/4WHlVjDdD4tMGFMIHhkA==
X-Received: by 2002:a17:90b:1290:: with SMTP id
 fw16mr3369002pjb.99.1614260827569; 
 Thu, 25 Feb 2021 05:47:07 -0800 (PST)
Received: from bobo.ibm.com (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id a9sm5925868pjq.17.2021.02.25.05.47.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 05:47:07 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v2 01/37] KVM: PPC: Book3S 64: remove unused kvmppc_h_protect
 argument
Date: Thu, 25 Feb 2021 23:46:16 +1000
Message-Id: <20210225134652.2127648-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210225134652.2127648-1-npiggin@gmail.com>
References: <20210225134652.2127648-1-npiggin@gmail.com>
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

