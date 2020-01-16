Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CDC213D831
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 11:49:46 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47z1D66F3wzDqZW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 21:49:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=lpechacek@suse.cz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.cz
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47z0lC19NPzDqXR
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2020 21:28:03 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 83CFFACB8;
 Thu, 16 Jan 2020 10:27:59 +0000 (UTC)
Date: Thu, 16 Jan 2020 11:27:58 +0100
From: Libor Pechacek <lpechacek@suse.cz>
To: linuxppc-dev@lists.ozlabs.org, Nathan Fontenot <nfont@linux.vnet.ibm.com>
Subject: [PATCH] powerpc: drmem: avoid NULL pointer dereference when drmem is
 unavailable
Message-ID: <20200116102758.GC25138@fm.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Thu, 16 Jan 2020 21:48:09 +1100
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Michal Suchanek <msuchanek@suse.cz>, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Leonardo Bras <leonardo@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Allison Randal <allison@lohutok.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In KVM guests drmem structure is only zero initialized. Trying to
manipulate DLPAR parameters results in a crash in this environment.

$ echo "memory add count 1" > /sys/kernel/dlpar
Oops: Kernel access of bad area, sig: 11 [#1]
LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
Modules linked in: af_packet(E) rfkill(E) nvram(E) vmx_crypto(E)
gf128mul(E) e1000(E) virtio_balloon(E) rtc_generic(E) crct10dif_vpmsum(E)
btrfs(E) blake2b_generic(E) libcrc32c(E) xor(E) raid6_pq(E) virtio_rng(E)
virtio_blk(E) ohci_pci(E) ehci_pci(E) ohci_hcd(E) ehci_hcd(E)
crc32c_vpmsum(E) usbcore(E) virtio_pci(E) virtio_ring(E) virtio(E) sg(E)
dm_multipath(E) dm_mod(E) scsi_dh_rdac(E) scsi_dh_emc(E) scsi_dh_alua(E)
scsi_mod(E)
CPU: 1 PID: 4114 Comm: bash Kdump: loaded Tainted: G            E     5.5.0-rc6-2-default #1
NIP:  c0000000000ff294 LR: c0000000000ff248 CTR: 0000000000000000
REGS: c0000000fb9d3880 TRAP: 0300   Tainted: G            E      (5.5.0-rc6-2-default)
MSR:  8000000000009033 <SF,EE,ME,IR,DR,RI,LE>  CR: 28242428  XER: 20000000
CFAR: c0000000009a6c10 DAR: 0000000000000010 DSISR: 40000000 IRQMASK: 0
GPR00: c0000000000ff248 c0000000fb9d3b10 c000000001682e00 0000000000000033
GPR04: c0000000ff30bf90 c0000000ff394800 0000000000005110 ffffffffffffffe8
GPR08: 0000000000000000 0000000000000000 00000000fe1c0000 0000000000000000
GPR12: 0000000000002200 c00000003fffee00 0000000000000000 000000011cbc37c0
GPR16: 000000011cb27ed0 0000000000000000 000000011cb6dd10 0000000000000000
GPR20: 000000011cb7db28 000001003ce035f0 000000011cbc7828 000000011cbc6c70
GPR24: 000001003cf01210 0000000000000000 c0000000ffade4e0 c000000002d7216b
GPR28: 0000000000000001 c000000002d78560 0000000000000000 c0000000015458d0
NIP [c0000000000ff294] dlpar_memory+0x6e4/0xd00
LR [c0000000000ff248] dlpar_memory+0x698/0xd00
Call Trace:
[c0000000fb9d3b10] [c0000000000ff248] dlpar_memory+0x698/0xd00 (unreliable)
[c0000000fb9d3ba0] [c0000000000f5990] handle_dlpar_errorlog+0xc0/0x190
[c0000000fb9d3c10] [c0000000000f5c58] dlpar_store+0x198/0x4a0
[c0000000fb9d3cd0] [c000000000c4cb00] kobj_attr_store+0x30/0x50
[c0000000fb9d3cf0] [c0000000005a37b4] sysfs_kf_write+0x64/0x90
[c0000000fb9d3d10] [c0000000005a2c90] kernfs_fop_write+0x1b0/0x290
[c0000000fb9d3d60] [c0000000004a2bec] __vfs_write+0x3c/0x70
[c0000000fb9d3d80] [c0000000004a6560] vfs_write+0xd0/0x260
[c0000000fb9d3dd0] [c0000000004a69ac] ksys_write+0xdc/0x130
[c0000000fb9d3e20] [c00000000000b478] system_call+0x5c/0x68
Instruction dump:
ebc90000 1ce70018 38e7ffe8 7cfe3a14 7fbe3840 419dff14 fb610068 7fc9f378
39000000 4800000c 60000000 4195fef4 <81490010> 39290018 38c80001 7ea93840
---[ end trace cc2dd8152608c295 ]---

Taking closer look at the code, I can see that for_each_drmem_lmb is a
macro expanding into `for (lmb = &drmem_info->lmbs[0]; lmb <=
&drmem_info->lmbs[drmem_info->n_lmbs - 1]; lmb++)`. When drmem_info->lmbs
is NULL, the loop would iterate through the whole address range if it
weren't stopped by the NULL pointer dereference on the next line.

This patch aligns for_each_drmem_lmb and for_each_drmem_lmb_in_range macro
behavior with the common C semantics, where the end marker does not belong
to the scanned range, and alters get_lmb_range() semantics. As a side
effect, the wraparound observed in the crash is prevented.

Fixes: 6c6ea53725b3 ("powerpc/mm: Separate ibm, dynamic-memory data from DT format")
Cc: Michal Suchanek <msuchanek@suse.cz>
Cc: stable@vger.kernel.org
Signed-off-by: Libor Pechacek <lpechacek@suse.cz>
---
 arch/powerpc/include/asm/drmem.h                | 4 ++--
 arch/powerpc/platforms/pseries/hotplug-memory.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/drmem.h b/arch/powerpc/include/asm/drmem.h
index 3d76e1c388c2..28c3d936fdf3 100644
--- a/arch/powerpc/include/asm/drmem.h
+++ b/arch/powerpc/include/asm/drmem.h
@@ -27,12 +27,12 @@ struct drmem_lmb_info {
 extern struct drmem_lmb_info *drmem_info;
 
 #define for_each_drmem_lmb_in_range(lmb, start, end)		\
-	for ((lmb) = (start); (lmb) <= (end); (lmb)++)
+	for ((lmb) = (start); (lmb) < (end); (lmb)++)
 
 #define for_each_drmem_lmb(lmb)					\
 	for_each_drmem_lmb_in_range((lmb),			\
 		&drmem_info->lmbs[0],				\
-		&drmem_info->lmbs[drmem_info->n_lmbs - 1])
+		&drmem_info->lmbs[drmem_info->n_lmbs])
 
 /*
  * The of_drconf_cell_v1 struct defines the layout of the LMB data
diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/powerpc/platforms/pseries/hotplug-memory.c
index c126b94d1943..4ea6af002e27 100644
--- a/arch/powerpc/platforms/pseries/hotplug-memory.c
+++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
@@ -236,9 +236,9 @@ static int get_lmb_range(u32 drc_index, int n_lmbs,
 	if (!start)
 		return -EINVAL;
 
-	end = &start[n_lmbs - 1];
+	end = &start[n_lmbs];
 
-	last_lmb = &drmem_info->lmbs[drmem_info->n_lmbs - 1];
+	last_lmb = &drmem_info->lmbs[drmem_info->n_lmbs];
 	if (end > last_lmb)
 		return -EINVAL;
 
-- 
2.24.1


-- 
Libor Pechacek
SUSE Labs                                Remember to have fun...
