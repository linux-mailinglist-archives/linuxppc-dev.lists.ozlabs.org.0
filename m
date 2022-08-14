Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F407592363
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Aug 2022 18:20:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M5N1x178Yz3cfD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Aug 2022 02:20:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AMxihQ/A;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AMxihQ/A;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M5N0q6VvHz3bfc
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Aug 2022 02:19:55 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 2EAC9B80AEE;
	Sun, 14 Aug 2022 16:19:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04349C433D6;
	Sun, 14 Aug 2022 16:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660493991;
	bh=c0oQWHbTvcNHrAYGEU4I81+4AJyeLsiRKKSH4gPd8po=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AMxihQ/Aqm9TtceJ7qzhRiouL0SDozJrwMIFbivhNxAk68zm3//k7o4o+LS0uqKKL
	 2WS/EjJsHpHVL6M8H2B397YACnhilgoxvDYLkMwi+WD6ZMHmOpT51hgzAWG1QpHmJb
	 zFWvv/FEC/1Jkajb+IUX6rBrmWf6bG+WUWWYynIPRS3LNunpJNPZ6jsffBwtdf80B4
	 HYI7uAQ8sSIoTDx1rA/HKvW1XPmt4PcDHQu2NnkcafSBlLRyHT1W8zb5crOsLRHJtH
	 0tD3Fu+QXZW+Wyydl11irM0cO3KPV1tMlZlLvojqIkr+wGMHkSWBMVIqYJ1y93Y86C
	 7AuM8WCXHecGg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.19 04/48] KVM: PPC: Book3S HV: Fix "rm_exit" entry in debugfs timings
Date: Sun, 14 Aug 2022 12:18:57 -0400
Message-Id: <20220814161943.2394452-4-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220814161943.2394452-1-sashal@kernel.org>
References: <20220814161943.2394452-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Fabiano Rosas <farosas@linux.ibm.com>

[ Upstream commit 9981bace85d816ed8724ac46e49285e8488d29e6 ]

At debugfs/kvm/<pid>/vcpu0/timings we show how long each part of the
code takes to run:

$ cat /sys/kernel/debug/kvm/*-*/vcpu0/timings
rm_entry: 123785 49398892 118 4898
rm_intr: 123780 6075890 22 390
rm_exit: 0 0 0 0                     <-- NOK
guest: 123780 46732919988 402 9997638
cede: 0 0 0 0                        <-- OK, no cede napping in P9

The "rm_exit" is always showing zero because it is the last one and
end_timing does not increment the counter of the previous entry.

We can fix it by calling accumulate_time again instead of
end_timing. That way the counter gets incremented. The rest of the
arithmetic can be ignored because there are no timing points after
this and the accumulators are reset before the next round.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20220525130554.2614394-2-farosas@linux.ibm.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/kvm/book3s_hv_p9_entry.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_p9_entry.c b/arch/powerpc/kvm/book3s_hv_p9_entry.c
index 112a09b33328..7f88be386b27 100644
--- a/arch/powerpc/kvm/book3s_hv_p9_entry.c
+++ b/arch/powerpc/kvm/book3s_hv_p9_entry.c
@@ -438,15 +438,6 @@ void restore_p9_host_os_sprs(struct kvm_vcpu *vcpu,
 EXPORT_SYMBOL_GPL(restore_p9_host_os_sprs);
 
 #ifdef CONFIG_KVM_BOOK3S_HV_EXIT_TIMING
-static void __start_timing(struct kvm_vcpu *vcpu, struct kvmhv_tb_accumulator *next)
-{
-	struct kvmppc_vcore *vc = vcpu->arch.vcore;
-	u64 tb = mftb() - vc->tb_offset_applied;
-
-	vcpu->arch.cur_activity = next;
-	vcpu->arch.cur_tb_start = tb;
-}
-
 static void __accumulate_time(struct kvm_vcpu *vcpu, struct kvmhv_tb_accumulator *next)
 {
 	struct kvmppc_vcore *vc = vcpu->arch.vcore;
@@ -478,8 +469,8 @@ static void __accumulate_time(struct kvm_vcpu *vcpu, struct kvmhv_tb_accumulator
 	curr->seqcount = seq + 2;
 }
 
-#define start_timing(vcpu, next) __start_timing(vcpu, next)
-#define end_timing(vcpu) __start_timing(vcpu, NULL)
+#define start_timing(vcpu, next) __accumulate_time(vcpu, next)
+#define end_timing(vcpu) __accumulate_time(vcpu, NULL)
 #define accumulate_time(vcpu, next) __accumulate_time(vcpu, next)
 #else
 #define start_timing(vcpu, next) do {} while (0)
-- 
2.35.1

