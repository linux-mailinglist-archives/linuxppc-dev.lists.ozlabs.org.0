Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F173C34A54A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Mar 2021 11:09:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F6Hl86g2Sz3bv8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Mar 2021 21:09:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.191; helo=szxga05-in.huawei.com;
 envelope-from=heying24@huawei.com; receiver=<UNKNOWN>)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F6Hkp4cgCz301y
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Mar 2021 21:09:18 +1100 (AEDT)
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4F6Hh93BMjzyPPH;
 Fri, 26 Mar 2021 18:07:05 +0800 (CST)
Received: from huawei.com (10.67.174.47) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.498.0; Fri, 26 Mar 2021
 18:08:58 +0800
From: He Ying <heying24@huawei.com>
To: <mpe@ellerman.id.au>, <benh@kernel.crashing.org>, <paulus@samba.org>,
 <corbet@lwn.net>, <ruscur@russell.cc>, <oohall@gmail.com>,
 <heying24@huawei.com>
Subject: [PATCH] docs: powerpc: Fix misspellings and grammar errors
Date: Fri, 26 Mar 2021 06:08:53 -0400
Message-ID: <20210326100853.173586-1-heying24@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.174.47]
X-CFilter-Loop: Reflected
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: He Ying <heying24@huawei.com>
---
 Documentation/powerpc/booting.rst                | 2 +-
 Documentation/powerpc/dawr-power9.rst            | 2 +-
 Documentation/powerpc/eeh-pci-error-recovery.rst | 2 +-
 Documentation/powerpc/elfnote.rst                | 2 +-
 Documentation/powerpc/firmware-assisted-dump.rst | 2 +-
 Documentation/powerpc/kaslr-booke32.rst          | 2 +-
 Documentation/powerpc/mpc52xx.rst                | 2 +-
 Documentation/powerpc/papr_hcalls.rst            | 4 ++--
 Documentation/powerpc/transactional_memory.rst   | 4 ++--
 9 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/Documentation/powerpc/booting.rst b/Documentation/powerpc/booting.rst
index 2d0ec2ff2b57..11aa440f98cc 100644
--- a/Documentation/powerpc/booting.rst
+++ b/Documentation/powerpc/booting.rst
@@ -94,7 +94,7 @@ should:
 
         a) add your platform support as a _boolean_ option in
         arch/powerpc/Kconfig, following the example of PPC_PSERIES,
-        PPC_PMAC and PPC_MAPLE. The later is probably a good
+        PPC_PMAC and PPC_MAPLE. The latter is probably a good
         example of a board support to start from.
 
         b) create your main platform file as
diff --git a/Documentation/powerpc/dawr-power9.rst b/Documentation/powerpc/dawr-power9.rst
index c96ab6befd9c..e55ac6a24b97 100644
--- a/Documentation/powerpc/dawr-power9.rst
+++ b/Documentation/powerpc/dawr-power9.rst
@@ -4,7 +4,7 @@ DAWR issues on POWER9
 
 On POWER9 the Data Address Watchpoint Register (DAWR) can cause a checkstop
 if it points to cache inhibited (CI) memory. Currently Linux has no way to
-disinguish CI memory when configuring the DAWR, so (for now) the DAWR is
+distinguish CI memory when configuring the DAWR, so (for now) the DAWR is
 disabled by this commit::
 
     commit 9654153158d3e0684a1bdb76dbababdb7111d5a0
diff --git a/Documentation/powerpc/eeh-pci-error-recovery.rst b/Documentation/powerpc/eeh-pci-error-recovery.rst
index 438a87ebc095..d6643a91bdf8 100644
--- a/Documentation/powerpc/eeh-pci-error-recovery.rst
+++ b/Documentation/powerpc/eeh-pci-error-recovery.rst
@@ -73,7 +73,7 @@ return all-ff's (0xff, 0xffff, 0xffffffff for 8/16/32-bit reads).
 This value was chosen because it is the same value you would
 get if the device was physically unplugged from the slot.
 This includes access to PCI memory, I/O space, and PCI config
-space.  Interrupts; however, will continued to be delivered.
+space.  Interrupts; however, will continue to be delivered.
 
 Detection and recovery are performed with the aid of ppc64
 firmware.  The programming interfaces in the Linux kernel
diff --git a/Documentation/powerpc/elfnote.rst b/Documentation/powerpc/elfnote.rst
index 06602248621c..3ec8d61e9a33 100644
--- a/Documentation/powerpc/elfnote.rst
+++ b/Documentation/powerpc/elfnote.rst
@@ -8,7 +8,7 @@ capabilities and information which can be used by a bootloader or userland.
 Types and Descriptors
 ---------------------
 
-The types to be used with the "PowerPC" namesapce are defined in [#f1]_.
+The types to be used with the "PowerPC" namespace are defined in [#f1]_.
 
 	1) PPC_ELFNOTE_CAPABILITIES
 
diff --git a/Documentation/powerpc/firmware-assisted-dump.rst b/Documentation/powerpc/firmware-assisted-dump.rst
index 6c0ae070ba67..e363fc48529a 100644
--- a/Documentation/powerpc/firmware-assisted-dump.rst
+++ b/Documentation/powerpc/firmware-assisted-dump.rst
@@ -207,7 +207,7 @@ Currently the dump will be copied from /proc/vmcore to a new file upon
 user intervention. The dump data available through /proc/vmcore will be
 in ELF format. Hence the existing kdump infrastructure (kdump scripts)
 to save the dump works fine with minor modifications. KDump scripts on
-major Distro releases have already been modified to work seemlessly (no
+major Distro releases have already been modified to work seamlessly (no
 user intervention in saving the dump) when FADump is used, instead of
 KDump, as dump mechanism.
 
diff --git a/Documentation/powerpc/kaslr-booke32.rst b/Documentation/powerpc/kaslr-booke32.rst
index 8b259fdfdf03..5681c1d1b65b 100644
--- a/Documentation/powerpc/kaslr-booke32.rst
+++ b/Documentation/powerpc/kaslr-booke32.rst
@@ -38,5 +38,5 @@ bit of the entropy to decide the index of the 64M zone. Then we chose a
 
                               kernstart_virt_addr
 
-To enable KASLR, set CONFIG_RANDOMIZE_BASE = y. If KASLR is enable and you
+To enable KASLR, set CONFIG_RANDOMIZE_BASE = y. If KASLR is enabled and you
 want to disable it at runtime, add "nokaslr" to the kernel cmdline.
diff --git a/Documentation/powerpc/mpc52xx.rst b/Documentation/powerpc/mpc52xx.rst
index 30260707c3fe..5243b1763fad 100644
--- a/Documentation/powerpc/mpc52xx.rst
+++ b/Documentation/powerpc/mpc52xx.rst
@@ -34,7 +34,7 @@ To compile/use :
 Some remarks:
 
  - The port is named mpc52xxx, and config options are PPC_MPC52xx. The MGT5100
-   is not supported, and I'm not sure anyone is interesting in working on it
+   is not supported, and I'm not sure anyone is interested in working on it
    so. I didn't took 5xxx because there's apparently a lot of 5xxx that have
    nothing to do with the MPC5200. I also included the 'MPC' for the same
    reason.
diff --git a/Documentation/powerpc/papr_hcalls.rst b/Documentation/powerpc/papr_hcalls.rst
index 48fcf1255a33..3d553e8a2937 100644
--- a/Documentation/powerpc/papr_hcalls.rst
+++ b/Documentation/powerpc/papr_hcalls.rst
@@ -40,7 +40,7 @@ and any in-arguments for the hcall are provided in registers *r4-r12*. If values
 have to be passed through a memory buffer, the data stored in that buffer should be
 in Big-endian byte order.
 
-Once control is returns back to the guest after hypervisor has serviced the
+Once control returns back to the guest after hypervisor has serviced the
 'HVCS' instruction the return value of the hcall is available in *r3* and any
 out values are returned in registers *r4-r12*. Again like in case of in-arguments,
 any out values stored in a memory buffer will be in Big-endian byte order.
@@ -147,7 +147,7 @@ corresponding opcode values please look into the arch specific header [4]_:
 | Out: *numBytesRead*
 | Return Value: *H_Success, H_Parameter, H_P2, H_P3, H_Hardware*
 
-Given a DRC Index of an NVDIMM, read N-bytes from the the metadata area
+Given a DRC Index of an NVDIMM, read N-bytes from the metadata area
 associated with it, at a specified offset and copy it to provided buffer.
 The metadata area stores configuration information such as label information,
 bad-blocks etc. The metadata area is located out-of-band of NVDIMM storage
diff --git a/Documentation/powerpc/transactional_memory.rst b/Documentation/powerpc/transactional_memory.rst
index b5b09bf00966..040a20675fd1 100644
--- a/Documentation/powerpc/transactional_memory.rst
+++ b/Documentation/powerpc/transactional_memory.rst
@@ -189,7 +189,7 @@ kernel aborted a transaction:
  ====================== ================================
 
 These can be checked by the user program's abort handler as TEXASR[0:7].  If
-bit 7 is set, it indicates that the error is consider persistent.  For example
+bit 7 is set, it indicates that the error is considered persistent.  For example
 a TM_CAUSE_ALIGNMENT will be persistent while a TM_CAUSE_RESCHED will not.
 
 GDB
@@ -271,4 +271,4 @@ with these lines:
 
 hrfid and mtmsrd have the same quirk.
 
-The Linux kernel uses this quirk in it's early exception handling.
+The Linux kernel uses this quirk in its early exception handling.
-- 
2.17.1

