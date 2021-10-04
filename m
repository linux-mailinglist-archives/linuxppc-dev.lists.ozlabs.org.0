Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8A242142A
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Oct 2021 18:33:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNR8r29wzz3dY4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 03:33:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=PQ/QJx0l;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42c;
 helo=mail-pf1-x42c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=PQ/QJx0l; dkim-atps=neutral
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNQV76kSBz3cRC
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Oct 2021 03:02:55 +1100 (AEDT)
Received: by mail-pf1-x42c.google.com with SMTP id g2so14901065pfc.6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Oct 2021 09:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nuVTSGJxHnIlv0kTLuX5DnMA5uRT7Y6LvkwGWm5jYwY=;
 b=PQ/QJx0lA7uR3YdVgf0IYhBobUcA59zS103cQx4nivXznPw0uOZyQu55O9Q6Qlo5Bh
 r/1Uf+N2GlqO7B/DW1oqqp+ogZvr61O720EVf+l3GlHUyXHKafz+YDcgQuK85HChktPi
 M3Wi6vgWw9OE6IQuhU1vxufXL8ALTMwpHyWmWqjDF++xoqa+lsrQr5L+tAfGBXQDhbJa
 ubR4gu6sBYkMB0TZsqZnqw1dkSLCQBOmOlQxwz36cU159cb3OTV1pCsOFaOpFB+lTmq4
 HGEdKOp7j1ErL+bgnufMcneP4iAwLiGcC9uC9bMEFBZLERRM2jsYdRBGwyxJQVhmbVw5
 ScLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nuVTSGJxHnIlv0kTLuX5DnMA5uRT7Y6LvkwGWm5jYwY=;
 b=gb8SiEIIPB0LReEO9mzMuD/CC6erCnCjScoeDFFM8LF5IRl7ZbUGRPmhh3IqFoBOVu
 xOf8dUcU+rpx8SvbB0Z9Zj0n+Ol+955AFWrln9TEA6YUyPwPtLtmE0gMgs6pu6gh/aL8
 iFlqVmemYzvRIrjQeA7KVYVVxKQkRwrj2L3/LsMj7mlfYnVYe9DAXxV8QPh/A3agyKJJ
 g9FeFrJyiDCVVtUu4r5e3TariMUhbnpvZG34qBO3/MLguffOSFUlEBk5m9r3Bdkuan29
 rcdVT7q/o9JsW5SJjfK4R7Zbu8bgUcQoJp9Dbn9XTkUH/KGTjC4CmH0RNcmU6kANj5gS
 naAw==
X-Gm-Message-State: AOAM533+bO8dJslm6O3QOSAb58Ys6k5qwPHzy5cPYeqP1my4qJIqWu+f
 dIjh/5NTSHOQxxA/E0Jc+CQKPYPc8Rk=
X-Google-Smtp-Source: ABdhPJwtq6ifviyS0m2a4kL00d7vB9BI9GC3qc5G52IEgsAUrkqJgvUOBLf/09hb57HFJQypT02h3g==
X-Received: by 2002:aa7:80d1:0:b029:399:ce3a:d617 with SMTP id
 a17-20020aa780d10000b0290399ce3ad617mr26833434pfn.16.1633363373616; 
 Mon, 04 Oct 2021 09:02:53 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (115-64-153-41.tpgi.com.au. [115.64.153.41])
 by smtp.gmail.com with ESMTPSA id 130sm15557223pfz.77.2021.10.04.09.02.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 09:02:53 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 47/52] KVM: PPC: Book3S HV P9: Add unlikely annotation for
 !mmu_ready
Date: Tue,  5 Oct 2021 02:00:44 +1000
Message-Id: <20211004160049.1338837-48-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211004160049.1338837-1-npiggin@gmail.com>
References: <20211004160049.1338837-1-npiggin@gmail.com>
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
index 0bbef4587f41..6e072e2e130a 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -4408,7 +4408,7 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 	vc->runner = vcpu;
 
 	/* See if the MMU is ready to go */
-	if (!kvm->arch.mmu_ready) {
+	if (unlikely(!kvm->arch.mmu_ready)) {
 		r = kvmhv_setup_mmu(vcpu);
 		if (r) {
 			run->exit_reason = KVM_EXIT_FAIL_ENTRY;
-- 
2.23.0

