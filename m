Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3581CC6F3
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 May 2020 07:16:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49KXNR1v0zzDqSn
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 May 2020 15:16:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=lca.pw
 (client-ip=2607:f8b0:4864:20::742; helo=mail-qk1-x742.google.com;
 envelope-from=cai@lca.pw; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lca.pw header.i=@lca.pw header.a=rsa-sha256
 header.s=google header.b=HL7AJgTJ; dkim-atps=neutral
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49KXL42Xl5zDqyc
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 May 2020 15:14:17 +1000 (AEST)
Received: by mail-qk1-x742.google.com with SMTP id q7so6346797qkf.3
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 09 May 2020 22:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=b+gfzmKn75xZVao9M5VVI/l01MvP0LO2u2zGlstYALs=;
 b=HL7AJgTJdvCZts1tIX9IGGn3KtYcMg9tkA1NZ7BwqKRT/7bBb/NNSACm/S0i8V9iQ4
 VERDX+1KVy2X6DEXjxOOX7kPYFPbRRkHeQhyVjIUPsRqymHHJ805hCx2+hhApLZaxDKa
 cFu8FVfs3vu8QCc/DLXTIYC2JCMeuHXGXOJt7PCH6MhEe6d0yVB/PumQw2uvEUaMN6Ik
 iotklanOiwdStFRf5qI4SOiFpOrJAOYFiPB5Ao5LeBVa2EGodSIY+cTwYjBcQhRNw29d
 o/EqJ30QXj9jM6XBlJ2HYlbVVlnOeyzv4E6SClaNZQRh+EzOBqubB/JFh3Bd/CqChf/V
 0+KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=b+gfzmKn75xZVao9M5VVI/l01MvP0LO2u2zGlstYALs=;
 b=UCqKyPl/lsnET+qme8bLNuQ6EQUba2/23eKHPribdRCz7mqLd2dnrcRPy1aoV3JPys
 iga7Oe7ytmezb/hil1Dbjb3yEGgLrtpSl0pUd1gRnjjQxh39SRMIE66xytubSSbRC52p
 14BeqU/P92DIJpjdSat4jqWEX7uUc7D3qcNe9nu4KJHuob/KuNO3nkvTZwSL9w5KgS7c
 HfWQVE+6bsiqSKlYXI5xtlgNluRSNcy8WF4HT8xJc84QrfrKzNu2OMkPaHudlV33Hr4r
 k0yTA9fYtPtqVBXBsvQaLxeW6+kvvOaPUWq+jH0EY+jtAZwJ6zUbaoFt/KUuSvZMum5d
 MCWQ==
X-Gm-Message-State: AGi0PuYSaRABbzjBEw4sbOl5g9l7n1MUpV6E7rt6VMYlhmCQOA+QSiHV
 vMrAscMF8EXdsUz6l2V2Vebgag==
X-Google-Smtp-Source: APiQypJh4YYuN8boueA234dTZu1p5/7eCxYm6HOeG6TAlMAYpYnUQaSoIHfnA5GUkhCUbnD9Hm3TDA==
X-Received: by 2002:a05:620a:556:: with SMTP id
 o22mr10148196qko.434.1589087650989; 
 Sat, 09 May 2020 22:14:10 -0700 (PDT)
Received: from ovpn-112-80.rdu2.redhat.com
 (pool-71-184-117-43.bstnma.fios.verizon.net. [71.184.117.43])
 by smtp.gmail.com with ESMTPSA id n206sm5169417qke.20.2020.05.09.22.14.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 09 May 2020 22:14:10 -0700 (PDT)
From: Qian Cai <cai@lca.pw>
To: mpe@ellerman.id.au
Subject: [PATCH] powerpc/powernv/pci: fix a RCU-list lock
Date: Sun, 10 May 2020 01:13:47 -0400
Message-Id: <20200510051347.1906-1-cai@lca.pw>
X-Mailer: git-send-email 2.21.0 (Apple Git-122.2)
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
Cc: paulmck@kernel.org, aik@ozlabs.ru, linux-kernel@vger.kernel.org,
 paulus@samba.org, Qian Cai <cai@lca.pw>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

It is unsafe to traverse tbl->it_group_list without the RCU read lock.

 WARNING: suspicious RCU usage
 5.7.0-rc4-next-20200508 #1 Not tainted
 -----------------------------
 arch/powerpc/platforms/powernv/pci-ioda-tce.c:355 RCU-list traversed in non-reader section!!

 other info that might help us debug this:

 rcu_scheduler_active = 2, debug_locks = 1
 3 locks held by qemu-kvm/4305:
  #0: c000000bc3fe6988 (&container->group_lock){++++}-{3:3}, at: vfio_fops_unl_ioctl+0x108/0x410 [vfio]
  #1: c00800000fcc7400 (&vfio.iommu_drivers_lock){+.+.}-{3:3}, at: vfio_fops_unl_ioctl+0x148/0x410 [vfio]
  #2: c000000bc3fe4d68 (&container->lock){+.+.}-{3:3}, at: tce_iommu_attach_group+0x3c/0x4f0 [vfio_iommu_spapr_tce]

 stack backtrace:
 CPU: 4 PID: 4305 Comm: qemu-kvm Not tainted 5.7.0-rc4-next-20200508 #1
 Call Trace:
 [c0000010f29afa60] [c0000000007154c8] dump_stack+0xfc/0x174 (unreliable)
 [c0000010f29afab0] [c0000000001d8ff0] lockdep_rcu_suspicious+0x140/0x164
 [c0000010f29afb30] [c0000000000dae2c] pnv_pci_unlink_table_and_group+0x11c/0x200
 [c0000010f29afb70] [c0000000000d4a34] pnv_pci_ioda2_unset_window+0xc4/0x190
 [c0000010f29afbf0] [c0000000000d4b4c] pnv_ioda2_take_ownership+0x4c/0xd0
 [c0000010f29afc30] [c00800000fd60ee0] tce_iommu_attach_group+0x2c8/0x4f0 [vfio_iommu_spapr_tce]
 [c0000010f29afcd0] [c00800000fcc11a0] vfio_fops_unl_ioctl+0x238/0x410 [vfio]
 [c0000010f29afd50] [c0000000005430a8] ksys_ioctl+0xd8/0x130
 [c0000010f29afda0] [c000000000543128] sys_ioctl+0x28/0x40
 [c0000010f29afdc0] [c000000000038af4] system_call_exception+0x114/0x1e0
 [c0000010f29afe20] [c00000000000c8f0] system_call_common+0xf0/0x278

Signed-off-by: Qian Cai <cai@lca.pw>
---
 arch/powerpc/platforms/powernv/pci-ioda-tce.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/powerpc/platforms/powernv/pci-ioda-tce.c b/arch/powerpc/platforms/powernv/pci-ioda-tce.c
index 5dc6847d5f4c..6be9cf292b4e 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda-tce.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda-tce.c
@@ -352,6 +352,8 @@ void pnv_pci_unlink_table_and_group(struct iommu_table *tbl,
 
 	/* Remove link to a group from table's list of attached groups */
 	found = false;
+
+	rcu_read_lock();
 	list_for_each_entry_rcu(tgl, &tbl->it_group_list, next) {
 		if (tgl->table_group == table_group) {
 			list_del_rcu(&tgl->next);
@@ -360,6 +362,8 @@ void pnv_pci_unlink_table_and_group(struct iommu_table *tbl,
 			break;
 		}
 	}
+	rcu_read_unlock();
+
 	if (WARN_ON(!found))
 		return;
 
-- 
2.21.0 (Apple Git-122.2)

