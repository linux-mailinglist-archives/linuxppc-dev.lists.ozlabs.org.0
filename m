Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E20B120526
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2019 13:44:00 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 454V1p2qv1zDqcG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2019 21:43:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="fyEYQTsM"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 454Tx24XRYzDq9L
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 May 2019 21:39:50 +1000 (AEST)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 115322089E;
 Thu, 16 May 2019 11:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558006787;
 bh=+ZPCNg3ruihxdWeoGY0MhxzDP6Lb0DhGX7m8k9gKt40=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fyEYQTsMdX4VCkIj6Q6rPCr8xxaRu9yhF3dDZWjp4/7slOTZ5a2Ru1R3kApho6A26
 WVKySUqpIRFSgPDu/ZdagV/a4CD7fFzonteBDYHuzka3DKDY1IuqOJDhYfNVQE3YIB
 o4CB4xj/N/Ui6CtpNzf0JnNqbuchP+gmKf8ZwsQE=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.0 11/34] KVM: PPC: Book3S HV: Perserve PSSCR
 FAKE_SUSPEND bit on guest exit
Date: Thu, 16 May 2019 07:39:08 -0400
Message-Id: <20190516113932.8348-11-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190516113932.8348-1-sashal@kernel.org>
References: <20190516113932.8348-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 kvm-ppc@vger.kernel.org, Suraj Jitindar Singh <sjitindarsingh@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Suraj Jitindar Singh <sjitindarsingh@gmail.com>

[ Upstream commit 7cb9eb106d7a4efab6bcf30ec9503f1d703c77f5 ]

There is a hardware bug in some POWER9 processors where a treclaim in
fake suspend mode can cause an inconsistency in the XER[SO] bit across
the threads of a core, the workaround being to force the core into SMT4
when doing the treclaim.

The FAKE_SUSPEND bit (bit 10) in the PSSCR is used to control whether a
thread is in fake suspend or real suspend. The important difference here
being that thread reconfiguration is blocked in real suspend but not
fake suspend mode.

When we exit a guest which was in fake suspend mode, we force the core
into SMT4 while we do the treclaim in kvmppc_save_tm_hv().
However on the new exit path introduced with the function
kvmhv_run_single_vcpu() we restore the host PSSCR before calling
kvmppc_save_tm_hv() which means that if we were in fake suspend mode we
put the thread into real suspend mode when we clear the
PSSCR[FAKE_SUSPEND] bit. This means that we block thread reconfiguration
and the thread which is trying to get the core into SMT4 before it can
do the treclaim spins forever since it itself is blocking thread
reconfiguration. The result is that that core is essentially lost.

This results in a trace such as:
[   93.512904] CPU: 7 PID: 13352 Comm: qemu-system-ppc Not tainted 5.0.0 #4
[   93.512905] NIP:  c000000000098a04 LR: c0000000000cc59c CTR: 0000000000000000
[   93.512908] REGS: c000003fffd2bd70 TRAP: 0100   Not tainted  (5.0.0)
[   93.512908] MSR:  9000000302883033 <SF,HV,VEC,VSX,FP,ME,IR,DR,RI,LE,TM[SE]>  CR: 22222444  XER: 00000000
[   93.512914] CFAR: c000000000098a5c IRQMASK: 3
[   93.512915] PACATMSCRATCH: 0000000000000001
[   93.512916] GPR00: 0000000000000001 c000003f6cc1b830 c000000001033100 0000000000000004
[   93.512928] GPR04: 0000000000000004 0000000000000002 0000000000000004 0000000000000007
[   93.512930] GPR08: 0000000000000000 0000000000000004 0000000000000000 0000000000000004
[   93.512932] GPR12: c000203fff7fc000 c000003fffff9500 0000000000000000 0000000000000000
[   93.512935] GPR16: 2000000000300375 000000000000059f 0000000000000000 0000000000000000
[   93.512951] GPR20: 0000000000000000 0000000000080053 004000000256f41f c000003f6aa88ef0
[   93.512953] GPR24: c000003f6aa89100 0000000000000010 0000000000000000 0000000000000000
[   93.512956] GPR28: c000003f9e9a0800 0000000000000000 0000000000000001 c000203fff7fc000
[   93.512959] NIP [c000000000098a04] pnv_power9_force_smt4_catch+0x1b4/0x2c0
[   93.512960] LR [c0000000000cc59c] kvmppc_save_tm_hv+0x40/0x88
[   93.512960] Call Trace:
[   93.512961] [c000003f6cc1b830] [0000000000080053] 0x80053 (unreliable)
[   93.512965] [c000003f6cc1b8a0] [c00800001e9cb030] kvmhv_p9_guest_entry+0x508/0x6b0 [kvm_hv]
[   93.512967] [c000003f6cc1b940] [c00800001e9cba44] kvmhv_run_single_vcpu+0x2dc/0xb90 [kvm_hv]
[   93.512968] [c000003f6cc1ba10] [c00800001e9cc948] kvmppc_vcpu_run_hv+0x650/0xb90 [kvm_hv]
[   93.512969] [c000003f6cc1bae0] [c00800001e8f620c] kvmppc_vcpu_run+0x34/0x48 [kvm]
[   93.512971] [c000003f6cc1bb00] [c00800001e8f2d4c] kvm_arch_vcpu_ioctl_run+0x2f4/0x400 [kvm]
[   93.512972] [c000003f6cc1bb90] [c00800001e8e3918] kvm_vcpu_ioctl+0x460/0x7d0 [kvm]
[   93.512974] [c000003f6cc1bd00] [c0000000003ae2c0] do_vfs_ioctl+0xe0/0x8e0
[   93.512975] [c000003f6cc1bdb0] [c0000000003aeb24] ksys_ioctl+0x64/0xe0
[   93.512978] [c000003f6cc1be00] [c0000000003aebc8] sys_ioctl+0x28/0x80
[   93.512981] [c000003f6cc1be20] [c00000000000b3a4] system_call+0x5c/0x70
[   93.512983] Instruction dump:
[   93.512986] 419dffbc e98c0000 2e8b0000 38000001 60000000 60000000 60000000 40950068
[   93.512993] 392bffff 39400000 79290020 39290001 <7d2903a6> 60000000 60000000 7d235214

To fix this we preserve the PSSCR[FAKE_SUSPEND] bit until we call
kvmppc_save_tm_hv() which will mean the core can get into SMT4 and
perform the treclaim. Note kvmppc_save_tm_hv() clears the
PSSCR[FAKE_SUSPEND] bit again so there is no need to explicitly do that.

Fixes: 95a6432ce9038 ("KVM: PPC: Book3S HV: Streamlined guest entry/exit path on P9 for radix guests")

Signed-off-by: Suraj Jitindar Singh <sjitindarsingh@gmail.com>
Signed-off-by: Paul Mackerras <paulus@ozlabs.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/kvm/book3s_hv.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 5a066fc299e17..f17065f2c962f 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3407,7 +3407,9 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_vcpu *vcpu, u64 time_limit,
 	vcpu->arch.shregs.sprg2 = mfspr(SPRN_SPRG2);
 	vcpu->arch.shregs.sprg3 = mfspr(SPRN_SPRG3);
 
-	mtspr(SPRN_PSSCR, host_psscr);
+	/* Preserve PSSCR[FAKE_SUSPEND] until we've called kvmppc_save_tm_hv */
+	mtspr(SPRN_PSSCR, host_psscr |
+	      (local_paca->kvm_hstate.fake_suspend << PSSCR_FAKE_SUSPEND_LG));
 	mtspr(SPRN_HFSCR, host_hfscr);
 	mtspr(SPRN_CIABR, host_ciabr);
 	mtspr(SPRN_DAWR, host_dawr);
-- 
2.20.1

