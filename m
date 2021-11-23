Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC1845A014
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 11:24:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hz0cj3r3Sz3dfq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 21:24:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=mQwHSTxV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52a;
 helo=mail-pg1-x52a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=mQwHSTxV; dkim-atps=neutral
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hyzxs5Fc9z3c6P
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Nov 2021 20:54:25 +1100 (AEDT)
Received: by mail-pg1-x52a.google.com with SMTP id h63so17793421pgc.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Nov 2021 01:54:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PUeqpH8nQmBsBDtR4Xm3OCHdiaFvPERF9uIjAm7T0jc=;
 b=mQwHSTxViHRIcn0INzOy19cI8aZmQXLKS1E1NXWMNesXhEAYOwP9WWdv7x2UfzTTZr
 PskzSJIyKLvNgX+j5YUio/C+ma0m97RMipPVVKMura9mYYhkrTr/zYp3VujjtVzZCI4q
 OvD4eX4nCl1qYgDJouRwn845TXE/je3be0VQV5D7Z3LfD1g9aXA505R5fu3WRcbx8JyD
 GWIlnjtcqVdiLjOhgFh3BzmoDc/dLLtXKf3EwBRghFD9fkg69iJ4+s9GiEWmYSpZySmU
 qxBwv5aeNPhrs66GovPP64BBcI9wIjVN2OVPGOL++/fJj9Cg114ngWR+P2AmNxv8IsaC
 ceEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PUeqpH8nQmBsBDtR4Xm3OCHdiaFvPERF9uIjAm7T0jc=;
 b=os/ghwqO4crSWuY2tnwi0s2FiUExc6bG0uGG8m5+TvIH7bWiyN75gajaLFpEdjyTha
 3D6EvC4lY+hxI25tM86XVUoblDbMNVnFwlK9tZ7w8b/e9MgFlXcXfDlriaiFCXF1vqC4
 7T4C35DFsK/QCMI4jfW1cPc1MK2CIvO1fX/OJIlCZfgbmmClwkJgYVkcKwJ03wKEl0ZQ
 2zeKEWpNsGzlraodZRanV0mh6G3QVkagZjn5+2Ym8dSrhWvq6LVMH1zfZ7jRQjjoF2hw
 Qc6TjEkIhPBhRWMT9fQo/R7bcufrM9Hw1fbOcSkG+FJ9Cuz9uIHznhp47jhUHZYKf/hQ
 CIkg==
X-Gm-Message-State: AOAM531xms+lLPJBnvdY/st0qIUqM5G3CTSgyTJn5bcfkurvmBL5newt
 lvFoXtsDQ9W5aZOH2AEoi+8sW2YcNbgOZA==
X-Google-Smtp-Source: ABdhPJzQb4PsqaIpBtCUw65DGpM2awHyPnwF6nKyQUG89Vmxo6p5K+l1JKlVva2GF0MUFwqUX2s1gw==
X-Received: by 2002:a63:8749:: with SMTP id i70mr2900534pge.158.1637661264090; 
 Tue, 23 Nov 2021 01:54:24 -0800 (PST)
Received: from bobo.ibm.com ([124.170.11.53])
 by smtp.gmail.com with ESMTPSA id j8sm12662176pfc.8.2021.11.23.01.54.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 01:54:23 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 48/53] KVM: PPC: Book3S HV P9: Add unlikely annotation for
 !mmu_ready
Date: Tue, 23 Nov 2021 19:52:26 +1000
Message-Id: <20211123095231.1036501-49-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211123095231.1036501-1-npiggin@gmail.com>
References: <20211123095231.1036501-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The mmu will almost always be ready.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index e532a7010dba..4056605d3367 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -4426,7 +4426,7 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 	vc->runner = vcpu;
 
 	/* See if the MMU is ready to go */
-	if (!kvm->arch.mmu_ready) {
+	if (unlikely(!kvm->arch.mmu_ready)) {
 		r = kvmhv_setup_mmu(vcpu);
 		if (r) {
 			run->exit_reason = KVM_EXIT_FAIL_ENTRY;
-- 
2.23.0

