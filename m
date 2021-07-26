Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1EE3D51EF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jul 2021 05:57:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GY5j22Nr3z3dJy
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jul 2021 13:57:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=MHfKxkF5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62d;
 helo=mail-pl1-x62d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=MHfKxkF5; dkim-atps=neutral
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GY5ZK1NSPz3bXd
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Jul 2021 13:51:21 +1000 (AEST)
Received: by mail-pl1-x62d.google.com with SMTP id i10so6924664pla.3
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Jul 2021 20:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=shePQEuLHDgx7Ejl/VppXX+u34JQZkGKzR8cfPeQyKk=;
 b=MHfKxkF55s08XB75KxHKhdcaY5/fpLsPhhoMr0Wk4mmzkck0NIX6A04iWbCL0qy4vP
 vqyNVPXL3ULhDFHj7hjhE1K8DRg/EINisFXAdmuCcWea/3JG5XZHxdA8hbdAOjdm96ml
 T5rnyPRHKdCaCyDuFK8tHsQQ9DOFM6KjWsu3dXYei/FM1rfUw4+TaBCwwIZUBxWZqKjx
 zRraE7uZB4gm+cZ5wpg/03GfZsLWJJuKzwolXfW32s16b8ogttyx5LcPhVFUN7ZVOaZ0
 VshU77xzlPiwpi5A8qXEzjNCJZebgM+qab78CAm33neuN5ixq0nxVsLDbZYcpFDUgUlh
 4+3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=shePQEuLHDgx7Ejl/VppXX+u34JQZkGKzR8cfPeQyKk=;
 b=m5Ahjc6NZQE8HqatA7J/h9DOmubn4CAdk1RRwb3Fp88+omOCyYwu6U4m5xgtsROquC
 RTzS8pLWPSFOMJhNEqgNiiAZdoabloP/Z9L071EaiUlnuO9tguag0cOxq0WrIrguckIr
 /AVN1z+CXQUQjVQWrrtTUBJE+MLzftEX6RfP95dX3vPvuIqPfmMAl7hBw2QtsQyby/0w
 tG4TunFw8ZJx7jPu3Z6e+1Qs/5tUEjdNeCti76DK+R5aNMnPQuLuDEj1vPc9kFAZhFWK
 EIt7aLMcNG+MBcnmxltlhW7SQ91Jz2OGyMcitM1cP3QmJdf/xhbbFyBimiV45z6v4t36
 IR5g==
X-Gm-Message-State: AOAM532qEUGbdRLXkuTjqN2X9NsFoQx3xt4Rnd0SJAHdhat6FrjKQeoX
 RLAbSHllpFc08vEHWgjOzbU=
X-Google-Smtp-Source: ABdhPJxukfXi22mn2P1qUJcY5oYKgsPpb+58bBenCrGHt4BbANGyK8mJ1f5SFPmFlcI5ZbBGxNxY+w==
X-Received: by 2002:a17:902:c20c:b029:12a:edee:a7fa with SMTP id
 12-20020a170902c20cb029012aedeea7famr13124967pll.2.1627271478693; 
 Sun, 25 Jul 2021 20:51:18 -0700 (PDT)
Received: from bobo.ibm.com (220-244-190-123.tpgi.com.au. [220.244.190.123])
 by smtp.gmail.com with ESMTPSA id p33sm41140341pfw.40.2021.07.25.20.51.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jul 2021 20:51:18 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v1 14/55] KVM: PPC: Book3S HV: Don't always save PMU for guest
 capable of nesting
Date: Mon, 26 Jul 2021 13:49:55 +1000
Message-Id: <20210726035036.739609-15-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210726035036.739609-1-npiggin@gmail.com>
References: <20210726035036.739609-1-npiggin@gmail.com>
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

Revert the workaround added by commit 63279eeb7f93a ("KVM: PPC: Book3S
HV: Always save guest pmu for guest capable of nesting").

Nested capable guests running with the earlier commit ("KVM: PPC: Book3S
HV Nested: Indicate guest PMU in-use in VPA") will now indicate the PMU
in-use status of their guests, which means the parent does not need to
unconditionally save the PMU for nested capable guests.

This will cause the PMU to break for nested guests when running older
nested hypervisor guests under a kernel with this change. It's unclear
there's an easy way to avoid that, so this could wait for a release or
so for the fix to filter into stable kernels.

-134 cycles (8982) POWER9 virt-mode NULL hcall

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index e7f8cc04944b..ab89db561c85 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -4003,8 +4003,6 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 		vcpu->arch.vpa.dirty = 1;
 		save_pmu = lp->pmcregs_in_use;
 	}
-	/* Must save pmu if this guest is capable of running nested guests */
-	save_pmu |= nesting_enabled(vcpu->kvm);
 
 	kvmhv_save_guest_pmu(vcpu, save_pmu);
 #ifdef CONFIG_PPC_PSERIES
-- 
2.23.0

