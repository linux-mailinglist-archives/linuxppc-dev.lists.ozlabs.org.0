Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 274993CB0D3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jul 2021 04:44:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GQwYT0W6Bz3bmL
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jul 2021 12:44:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=pG7BChhl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52d;
 helo=mail-pg1-x52d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=pG7BChhl; dkim-atps=neutral
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GQwXX1Ybhz2yNJ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jul 2021 12:43:21 +1000 (AEST)
Received: by mail-pg1-x52d.google.com with SMTP id t9so8585011pgn.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jul 2021 19:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dgv35F0XGHEdY1CvtkrxQlnoalQMMI8wR2LzajycnMA=;
 b=pG7BChhlBdYYSyjrFwwqLogfRRcC2vYp7G4mdTUb6AlqbLezFtTBiZbmiAVLBu1ItX
 iUnhu5iaB10HxJE7Y0o7NhEv4MZgWQLe7Luqx8eXjfsFD/sUOa6BczzCE0N6W8eH8DQO
 ZTzXytFtRsuXVpoNBnNJ0H92ml6cMBxhQT7eHwNuHryOpShDBaG52wA6m1Y1V45cqaae
 ghEuwirHsXZhgmeBzjzeKTg+XyvNjJbM4Rwcsi2n969/1NzjdoB2Ozr4f8A01DtiRsHb
 WDy0lGG4I+2L9bCULEgscPjXRCA9Xk0TQIH615WRdzMjhZfnSvbI7Yn/MzyY77TVi+fi
 X9vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dgv35F0XGHEdY1CvtkrxQlnoalQMMI8wR2LzajycnMA=;
 b=T4cItdrWdXa/FTA1u4MD9mY/sYlNfzjybbpncaS7XM6dAeKU3yppX0C/XHrz+TXXSt
 ejg+mc58UtXO/ot9c6PuDUbxKCp32kU4KMaDUYpDpNadMBtdxLfjsVNbw3ue4t/wBz9L
 kI6NCsRkETfnC2bHbQY9599SoXxaliEc50TzswchsfkhPBd8IwCZZbVwGbiZvqG/6d3A
 qmQZA6itK7ck5GEa1uANCJEO/ua8JbhF1LLDLHZQSC9bbe9BUgQ/v5nUYvE0kb4zS1Xo
 Yis09JUAlYzIQS9v/IKpLcW6SMsSqzqqpooWiz0MRHYjxN0K1R/drNPiyehX8wMOc0Wv
 cbvQ==
X-Gm-Message-State: AOAM531s3UFZQXsago/fhidUR3EdmJyA638DIBtKJa7otFP/IPsiR/2D
 nL9k8ZToGCR2rLKU0eb/JaE=
X-Google-Smtp-Source: ABdhPJzMnUQRrmTDO8DdrYzLJ5ZbfwShPiH4t804ABkzx0ELRlEfwLmlhWpTTp4TG1R1iG5XofClyw==
X-Received: by 2002:a63:e0c:: with SMTP id d12mr5843650pgl.386.1626403399969; 
 Thu, 15 Jul 2021 19:43:19 -0700 (PDT)
Received: from bobo.ibm.com (27-33-83-114.tpgi.com.au. [27.33.83.114])
 by smtp.gmail.com with ESMTPSA id f3sm8298406pfk.206.2021.07.15.19.43.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jul 2021 19:43:19 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH 2/2] KVM: PPC: Fix kvm_arch_vcpu_ioctl vcpu_load leak
Date: Fri, 16 Jul 2021 12:43:10 +1000
Message-Id: <20210716024310.164448-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210716024310.164448-1-npiggin@gmail.com>
References: <20210716024310.164448-1-npiggin@gmail.com>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

vcpu_put is not called if the user copy fails. This can result in preempt
notifier corruption and crashes, among other issues.

Reported-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Fixes: b3cebfe8c1ca ("KVM: PPC: Move vcpu_load/vcpu_put down to each ioctl case in kvm_arch_vcpu_ioctl")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/powerpc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index be33b5321a76..b4e6f70b97b9 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -2048,9 +2048,9 @@ long kvm_arch_vcpu_ioctl(struct file *filp,
 	{
 		struct kvm_enable_cap cap;
 		r = -EFAULT;
-		vcpu_load(vcpu);
 		if (copy_from_user(&cap, argp, sizeof(cap)))
 			goto out;
+		vcpu_load(vcpu);
 		r = kvm_vcpu_ioctl_enable_cap(vcpu, &cap);
 		vcpu_put(vcpu);
 		break;
@@ -2074,9 +2074,9 @@ long kvm_arch_vcpu_ioctl(struct file *filp,
 	case KVM_DIRTY_TLB: {
 		struct kvm_dirty_tlb dirty;
 		r = -EFAULT;
-		vcpu_load(vcpu);
 		if (copy_from_user(&dirty, argp, sizeof(dirty)))
 			goto out;
+		vcpu_load(vcpu);
 		r = kvm_vcpu_ioctl_dirty_tlb(vcpu, &dirty);
 		vcpu_put(vcpu);
 		break;
-- 
2.23.0

