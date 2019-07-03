Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A9B5DAC8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2019 03:26:45 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45dk3Q0Tx9zDqYj
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2019 11:26:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::643; helo=mail-pl1-x643.google.com;
 envelope-from=sjitindarsingh@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="RH/3iLds"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45djwV4pqQzDqQV
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jul 2019 11:20:42 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id w24so257150plp.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 02 Jul 2019 18:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=q3fFTelOhqkb1Mwuc5eMY9x9ha5lfJs2EAbdT9hPUxk=;
 b=RH/3iLdsxo433D8bqQwGL/9FPB5yF+k0fcF0uDWNdIqHFwBKMirdOH4am3QXNHJYSn
 rY4r/pfbR+HzWOa8YVSKaFR9ZO0LQC9H7zOEQB9tnIzDUuqEI0/DOQsr96nFf1b3qFyb
 6cXV24+vc/1EXm/XtkVqszJoIDg37R/TAYjbci2YtuwMMmUMcIx/WTBbAXc0Ia8zjZxb
 KlYMd6yImr8TLShte/YqPNUQ7PxXlM4kt6sNtxgzIpCoFrcMPe1vGPasbGwY0djwAzlE
 a+iINADzJwNendu1TCWNzcYc0hmoerC/E8aEh16OQx+UthQ07cWtau49tHUp+PXjmr6E
 MQ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=q3fFTelOhqkb1Mwuc5eMY9x9ha5lfJs2EAbdT9hPUxk=;
 b=XtvsYkIjJH5y0qFlNFB1ZrTQOX9t9Rn8ElV/wqT1rni7zNlDDbuFDVQmyq5unhtzTO
 uyoIBxoA7YRMiU9vhSXVsC3VfX3Hw4l84ismiEGAEHglWFaqGB+hn9jN2n0AtKrTLTge
 DBNcr0cWczEwmBMAgE0pAhIARjxjx6Glrd3rfe5RAoh13Ur8iuK8/sjEcVFTOudtJLdD
 Er11NEyNm6BSm6WYMJXPeFXtEyQc7eAVAKfH6l32nLGTjCAzCrEg8Q77BkfFwysjh7Qp
 35KJiGM/8NNX0/hssxOydQdteRJoVKwX22BQy4jaHY/jdbYjrdJAts2zBhwUIgPthbvj
 jKlA==
X-Gm-Message-State: APjAAAUEToovagtfVdKcDV0vK1bWN5RfRtLaJW2Hf3Kh2ei4aaiqIrkK
 y1GWmwEEVGTiF5HttPa066pkC/Zm
X-Google-Smtp-Source: APXvYqzkt5g7kNg6hKYTqsIuNXDzDhDUtUgqHARyXeeseHu6TWKvRfxy1H2TSr3uJ1aWKFKC5zKorA==
X-Received: by 2002:a17:902:684:: with SMTP id
 4mr38647623plh.138.1562116840189; 
 Tue, 02 Jul 2019 18:20:40 -0700 (PDT)
Received: from surajjs2.ozlabs.ibm.com.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id j11sm318058pfa.2.2019.07.02.18.20.37
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 02 Jul 2019 18:20:39 -0700 (PDT)
From: Suraj Jitindar Singh <sjitindarsingh@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/3] KVM: PPC: Book3S HV: Save and restore guest visible PSSCR
 bits on pseries
Date: Wed,  3 Jul 2019 11:20:22 +1000
Message-Id: <20190703012022.15644-3-sjitindarsingh@gmail.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20190703012022.15644-1-sjitindarsingh@gmail.com>
References: <20190703012022.15644-1-sjitindarsingh@gmail.com>
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
Cc: sjitindarsingh@gmail.com, kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The performance stop status and control register (PSSCR) is used to
control the power saving facilities of the processor. This register has
various fields, some of which can be modified only in hypervisor state,
and others which can be modified in both hypervisor and priviledged
non-hypervisor state. The bits which can be modified in priviledged
non-hypervisor state are referred to as guest visible.

Currently the L0 hypervisor saves and restores both it's own host value
as well as the guest value of the psscr when context switching between
the hypervisor and guest. However a nested hypervisor running it's own
nested guests (as indicated by kvmhv_on_pseries()) doesn't context
switch the psscr register. This means that if a nested (L2) guest
modified the psscr that the L1 guest hypervisor will run with this
value, and if the L1 guest hypervisor modified this value and then goes
to run the nested (L2) guest again that the L2 psscr value will be lost.

Fix this by having the (L1) nested hypervisor save and restore both its
host and the guest psscr value when entering and exiting a nested (L2)
guest. Note that only the guest visible parts of the psscr are context
switched since this is all the L1 nested hypervisor can access, this is
fine however as these are the only fields the L0 hypervisor provides
guest control of anyway and so all other fields are ignored.

This could also have been implemented by adding the psscr register to
the hv_regs passed to the L0 hypervisor as input to the H_ENTER_NESTED
hcall, however this would have meant updating the structure layout and
thus required modifications to both the L0 and L1 kernels. Whereas the
approach used doesn't require L0 kernel modifications while achieving
the same result.

Fixes: 95a6432ce903 "KVM: PPC: Book3S HV: Streamlined guest entry/exit path on P9 for radix guests"

Signed-off-by: Suraj Jitindar Singh <sjitindarsingh@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index b682a429f3ef..cde3f5a4b3e4 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3569,9 +3569,18 @@ int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 	mtspr(SPRN_DEC, vcpu->arch.dec_expires - mftb());
 
 	if (kvmhv_on_pseries()) {
+		/*
+		 * We need to save and restore the guest visible part of the
+		 * psscr (i.e. using SPRN_PSSCR_PR) since the hypervisor
+		 * doesn't do this for us. Note only required if pseries since
+		 * this is done in kvmhv_load_hv_regs_and_go() below otherwise.
+		 */
+		unsigned long host_psscr;
 		/* call our hypervisor to load up HV regs and go */
 		struct hv_guest_state hvregs;
 
+		host_psscr = mfspr(SPRN_PSSCR_PR);
+		mtspr(SPRN_PSSCR_PR, vcpu->arch.psscr);
 		kvmhv_save_hv_regs(vcpu, &hvregs);
 		hvregs.lpcr = lpcr;
 		vcpu->arch.regs.msr = vcpu->arch.shregs.msr;
@@ -3590,6 +3599,8 @@ int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 		vcpu->arch.shregs.msr = vcpu->arch.regs.msr;
 		vcpu->arch.shregs.dar = mfspr(SPRN_DAR);
 		vcpu->arch.shregs.dsisr = mfspr(SPRN_DSISR);
+		vcpu->arch.psscr = mfspr(SPRN_PSSCR_PR);
+		mtspr(SPRN_PSSCR_PR, host_psscr);
 
 		/* H_CEDE has to be handled now, not later */
 		if (trap == BOOK3S_INTERRUPT_SYSCALL && !vcpu->arch.nested &&
-- 
2.13.6

