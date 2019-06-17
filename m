Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F3DF047AAE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jun 2019 09:19:56 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45S2fL2jLWzDqYb
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jun 2019 17:19:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com;
 envelope-from=sjitindarsingh@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="cLHMZq+n"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45S2ZV1gWJzDqWc
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jun 2019 17:16:34 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id s21so5249402pga.12
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jun 2019 00:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zjKqGeCIEa6FB3Sm3v6pR1efkyj+aWysDaWtinPLEwc=;
 b=cLHMZq+nfmqpshOFKY1CR4tK6pTClzUp+BchBDNdY28xWIWEq4lROtDTNCq3FDGY6D
 2t1xrDHJYDFo3FfZ8T25NcjAjBVMjkVW5t7XzkiOndntkruBcHu8+q+a8VyXTcYLgyrR
 DclkC6MDuzW3RCFckNCfWUOAiukl+AiDRkg/m2YB/saVX4ENzLQXNHPHlaep9LdQUNxp
 LKaNc1LgQeebRnpLyFDlzC++r68/LJaYga9M+KX+DWsKxX6Uqip2rAwA+mlvii2ZSjoF
 xJbUekb0vVKJ5hGnx4iKQYvS4PFrpbOFv60ShT2g5xj3KL9KJ46dbEuMS0DksM/i7p0+
 75KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zjKqGeCIEa6FB3Sm3v6pR1efkyj+aWysDaWtinPLEwc=;
 b=KqvluhcK0P7JnoLNEu6kwAkZtx6lAm9NrMzbjWZWo11BR3YWC9sB474Eca1nRj+rND
 Gr95zmU308EhF2LDHPnyBA7ysZIn7LDPIvDHYtaAQV2h4KHB3U9qhrnGP/wfVzs6mZIw
 At6T4MJhFDqT0wOsVMTXhPkmh/P2f+yG06Mz22dvsl1r2IbhbmWtlXySJt2lU3M/y8n0
 giyPzqcMVsUYquxebVW3sKXFptXNDtzysyXOlV+TlS1oyD7b4QgEA5kSa2S4zINO8vMh
 jcAV6OlXhyRLstlLCovXLC+r77wuVg70eUFY1tNfalIkMcdQZ3V5D388XLkRWtW9D9q3
 QpJg==
X-Gm-Message-State: APjAAAWMVbacONdO99AWiZf6sXn9I+R+czuKVUSWnc4rUw7Q66bO5om1
 FMH6JPHfaHgDK0hSHHmSQhnQjViK
X-Google-Smtp-Source: APXvYqy0hFoSPCg0H/L9ifwxk87CSSRMLWVAZjeAuR/qIX1Owiu9/pJR01YdKpDZ99z22u5hHF/1Zg==
X-Received: by 2002:aa7:8e46:: with SMTP id d6mr111684402pfr.91.1560755791080; 
 Mon, 17 Jun 2019 00:16:31 -0700 (PDT)
Received: from surajjs2.ozlabs.ibm.com.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id m31sm22163663pjb.6.2019.06.17.00.16.28
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 17 Jun 2019 00:16:30 -0700 (PDT)
From: Suraj Jitindar Singh <sjitindarsingh@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/2] KVM: PPC: Book3S HV: Fix r3 corruption in h_set_dabr()
Date: Mon, 17 Jun 2019 17:16:18 +1000
Message-Id: <20190617071619.19360-2-sjitindarsingh@gmail.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20190617071619.19360-1-sjitindarsingh@gmail.com>
References: <20190617071619.19360-1-sjitindarsingh@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: mikey@neuling.org, clg@kaod.org, kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Michael Neuling <mikey@neuling.org>

Commit c1fe190c0672 ("powerpc: Add force enable of DAWR on P9
option") screwed up some assembler and corrupted a pointer in
r3. This resulted in crashes like the below:

  [   44.374746] BUG: Kernel NULL pointer dereference at 0x000013bf
  [   44.374848] Faulting instruction address: 0xc00000000010b044
  [   44.374906] Oops: Kernel access of bad area, sig: 11 [#1]
  [   44.374951] LE PAGE_SIZE=64K MMU=Radix MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
  [   44.375018] Modules linked in: vhost_net vhost tap xt_CHECKSUM iptable_mangle xt_MASQUERADE iptable_nat nf_nat xt_conntrack nf_conntrack nf_defrag_ipv6 libcrc32c nf_defrag_ipv4 ipt_REJECT nf_reject_ipv4 xt_tcpudp bridge stp llc ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter bpfilter vmx_crypto crct10dif_vpmsum crc32c_vpmsum kvm_hv kvm sch_fq_codel ip_tables x_tables autofs4 virtio_net net_failover virtio_scsi failover
  [   44.375401] CPU: 8 PID: 1771 Comm: qemu-system-ppc Kdump: loaded Not tainted 5.2.0-rc4+ #3
  [   44.375500] NIP:  c00000000010b044 LR: c0080000089dacf4 CTR: c00000000010aff4
  [   44.375604] REGS: c00000179b397710 TRAP: 0300   Not tainted  (5.2.0-rc4+)
  [   44.375691] MSR:  800000000280b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 42244842  XER: 00000000
  [   44.375815] CFAR: c00000000010aff8 DAR: 00000000000013bf DSISR: 42000000 IRQMASK: 0
  [   44.375815] GPR00: c0080000089dd6bc c00000179b3979a0 c008000008a04300 ffffffffffffffff
  [   44.375815] GPR04: 0000000000000000 0000000000000003 000000002444b05d c0000017f11c45d0
  [   44.375815] GPR08: 078000003e018dfe 0000000000000028 0000000000000001 0000000000000075
  [   44.375815] GPR12: c00000000010aff4 c000000007ff6300 0000000000000000 0000000000000000
  [   44.375815] GPR16: 0000000000000000 c0000017f11d0000 00000000ffffffff c0000017f11ca7a8
  [   44.375815] GPR20: c0000017f11c42ec ffffffffffffffff 0000000000000000 000000000000000a
  [   44.375815] GPR24: fffffffffffffffc 0000000000000000 c0000017f11c0000 c000000001a77ed8
  [   44.375815] GPR28: c00000179af70000 fffffffffffffffc c0080000089ff170 c00000179ae88540
  [   44.376673] NIP [c00000000010b044] kvmppc_h_set_dabr+0x50/0x68
  [   44.376754] LR [c0080000089dacf4] kvmppc_pseries_do_hcall+0xa3c/0xeb0 [kvm_hv]
  [   44.376849] Call Trace:
  [   44.376886] [c00000179b3979a0] [c0000017f11c0000] 0xc0000017f11c0000 (unreliable)
  [   44.376982] [c00000179b397a10] [c0080000089dd6bc] kvmppc_vcpu_run_hv+0x694/0xec0 [kvm_hv]
  [   44.377084] [c00000179b397ae0] [c0080000093f8bcc] kvmppc_vcpu_run+0x34/0x48 [kvm]
  [   44.377185] [c00000179b397b00] [c0080000093f522c] kvm_arch_vcpu_ioctl_run+0x2f4/0x400 [kvm]
  [   44.377286] [c00000179b397b90] [c0080000093e3618] kvm_vcpu_ioctl+0x460/0x850 [kvm]
  [   44.377384] [c00000179b397d00] [c0000000004ba6c4] do_vfs_ioctl+0xe4/0xb40
  [   44.377464] [c00000179b397db0] [c0000000004bb1e4] ksys_ioctl+0xc4/0x110
  [   44.377547] [c00000179b397e00] [c0000000004bb258] sys_ioctl+0x28/0x80
  [   44.377628] [c00000179b397e20] [c00000000000b888] system_call+0x5c/0x70
  [   44.377712] Instruction dump:
  [   44.377765] 4082fff4 4c00012c 38600000 4e800020 e96280c0 896b0000 2c2b0000 3860ffff
  [   44.377862] 4d820020 50852e74 508516f6 78840724 <f88313c0> f8a313c8 7c942ba6 7cbc2ba6

Fix the bug by only changing r3 when we are returning immediately.

Fixes: c1fe190c0672 ("powerpc: Add force enable of DAWR on P9 option")
Signed-off-by: Michael Neuling <mikey@neuling.org>
Reported-by: Cédric Le Goater <clg@kaod.org>
--
mpe: This is for 5.2 fixes

v2: Review from Christophe Leroy
  - De-Mikey/Cedric-ify commit message
  - Add "Fixes:"
  - Other trivial commit messages changes
  - No code change
---
 arch/powerpc/kvm/book3s_hv_rmhandlers.S | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
index d885a5831daa..703cd6cd994d 100644
--- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
+++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
@@ -2500,8 +2500,10 @@ END_FTR_SECTION_IFSET(CPU_FTR_ARCH_207S)
 	LOAD_REG_ADDR(r11, dawr_force_enable)
 	lbz	r11, 0(r11)
 	cmpdi	r11, 0
+	bne	3f
 	li	r3, H_HARDWARE
-	beqlr
+	blr
+3:
 	/* Emulate H_SET_DABR/X on P8 for the sake of compat mode guests */
 	rlwimi	r5, r4, 5, DAWRX_DR | DAWRX_DW
 	rlwimi	r5, r4, 2, DAWRX_WT
-- 
2.13.6

