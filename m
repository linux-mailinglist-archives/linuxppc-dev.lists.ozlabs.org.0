Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5393721AEDB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jul 2020 07:41:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B322f4WmdzDqVc
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jul 2020 15:40:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::341;
 helo=mail-wm1-x341.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=TjzZwRCl; dkim-atps=neutral
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B31gL2mSczDrJn
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jul 2020 15:24:13 +1000 (AEST)
Received: by mail-wm1-x341.google.com with SMTP id q15so4551316wmj.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Jul 2020 22:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3rI/j03qnMWqqmLPfrr2nACml6hNFpxMMQGfEK+4cKM=;
 b=TjzZwRClz3OoOmqVSYZyK5Knm/IXzScy5Khw7N6pf0suWF1xjZ9IhzYPUdRRk8nC/C
 OME2NxYlu8cQepRtKAf+eWRcxKEWeCw6HCG8LsvOP+UbYTeXEh72dAkWg2t6HwlQSeRo
 q/DnkJ9+ICIZXyYZ8oA121dCYKhBIwssaqgJ23o8aIPkxr85tG1m9VJaNw0TeC4AJNnB
 TFTYXrZBCkxiEjgQ4oMOxiCg6rGkUPOVfLWDPRThGv0qL2B5rKa2C8SsjaON52V0Sd8b
 vLJ+2+GHJkf6ThMCq/diQxngToG2J7IyGrIiAeatzDQVvs90h4N7FYoFLSJw8AJ6Puny
 7tkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3rI/j03qnMWqqmLPfrr2nACml6hNFpxMMQGfEK+4cKM=;
 b=WxH0MQhkW+ywO3qhDVl2xntMK7hbXHGeZ1OS3o0fp18rg0i+nxdBC5vkOf/reN96lK
 oF6ogyBZXq6pf/o4YAVBFJM2cOHEDv2EEkcHMxJO86UBmV+luQBBFf3Qh+fjqfu5xADT
 6pHfGFz5B4XmvwVMTt8txf1gGJm7oF/jdIDDNSB+05rBZsFc53fd3wMgXBpLRWRD3hg9
 q5bqUW2s4KXbC92VLVXReOWUgkdf7Ze1Bvmd2y4YI3BBfDiMDjQkrzlYhSjZyIiMKeU8
 8JNpwC3vgyKj5CpkM1AD5lgBJBphZu3pUZnL7t71+BC1ZddHt8hwx2422KCeV9FsGcj9
 l0Vw==
X-Gm-Message-State: AOAM531FxlOAglyMVF/DZ0l0nLJUn0u37SLB/886KMBtfzf+Gf0IEx2B
 AAZa3I5sRRabUBW0VDz9MJMp5Ht5qGQ=
X-Google-Smtp-Source: ABdhPJyO9LO7c3q0zL0zk6HB0crtQFc/Q63eB5AQBztfxnM2lxYrtlP6c/y2vJ/hf8RmNz1Am9lGdQ==
X-Received: by 2002:a1c:ac81:: with SMTP id v123mr3162665wme.159.1594358649769; 
 Thu, 09 Jul 2020 22:24:09 -0700 (PDT)
Received: from 192-168-1-18.tpgi.com.au ([220.240.245.68])
 by smtp.gmail.com with ESMTPSA id 92sm9090941wrr.96.2020.07.09.22.24.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2020 22:24:09 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 06/15] powerpc/powernv/sriov: Explain how SR-IOV works on
 PowerNV
Date: Fri, 10 Jul 2020 15:23:31 +1000
Message-Id: <20200710052340.737567-7-oohall@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200710052340.737567-1-oohall@gmail.com>
References: <20200710052340.737567-1-oohall@gmail.com>
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
Cc: Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SR-IOV support on PowerNV is a byzantine maze of hooks. I have no idea
how anyone is supposed to know how it works except through a lot of
stuffering. Write up some docs about the overall story to help out
the next sucker^Wperson who needs to tinker with it.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/platforms/powernv/pci-sriov.c | 130 +++++++++++++++++++++
 1 file changed, 130 insertions(+)

diff --git a/arch/powerpc/platforms/powernv/pci-sriov.c b/arch/powerpc/platforms/powernv/pci-sriov.c
index 080ea39f5a83..f4c74ab1284d 100644
--- a/arch/powerpc/platforms/powernv/pci-sriov.c
+++ b/arch/powerpc/platforms/powernv/pci-sriov.c
@@ -12,6 +12,136 @@
 /* for pci_dev_is_added() */
 #include "../../../../drivers/pci/pci.h"
 
+/*
+ * The majority of the complexity in supporting SR-IOV on PowerNV comes from
+ * the need to put the MMIO space for each VF into a separate PE. Internally
+ * the PHB maps MMIO addresses to a specific PE using the "Memory BAR Table".
+ * The MBT historically only applied to the 64bit MMIO window of the PHB
+ * so it's common to see it referred to as the "M64BT".
+ *
+ * An MBT entry stores the mapped range as an <base>,<mask> pair. This forces
+ * the address range that we want to map to be power-of-two sized and aligned.
+ * For conventional PCI devices this isn't really an issue since PCI device BARs
+ * have the same requirement.
+ *
+ * For a SR-IOV BAR things are a little more awkward since size and alignment
+ * are not coupled. The alignment is set based on the the per-VF BAR size, but
+ * the total BAR area is: number-of-vfs * per-vf-size. The number of VFs
+ * isn't necessarily a power of two, so neither is the total size. To fix that
+ * we need to finesse (read: hack) the Linux BAR allocator so that it will
+ * allocate the SR-IOV BARs in a way that lets us map them using the MBT.
+ *
+ * The changes to size and alignment that we need to do depend on the "mode"
+ * of MBT entry that we use. We only support SR-IOV on PHB3 (IODA2) and above,
+ * so as a baseline we can assume that we have the following BAR modes
+ * available:
+ *
+ *   NB: $PE_COUNT is the number of PEs that the PHB supports.
+ *
+ * a) A segmented BAR that splits the mapped range into $PE_COUNT equally sized
+ *    segments. The n'th segment is mapped to the n'th PE.
+ * b) An un-segmented BAR that maps the whole address range to a specific PE.
+ *
+ *
+ * We prefer to use mode a) since it only requires one MBT entry per SR-IOV BAR
+ * For comparison b) requires one entry per-VF per-BAR, or:
+ * (num-vfs * num-sriov-bars) in total. To use a) we need the size of each segment
+ * to equal the size of the per-VF BAR area. So:
+ *
+ *	new_size = per-vf-size * number-of-PEs
+ *
+ * The alignment for the SR-IOV BAR also needs to be changed from per-vf-size
+ * to "new_size", calculated above. Implementing this is a convoluted process
+ * which requires several hooks in the PCI core:
+ *
+ * 1. In pcibios_add_device() we call pnv_pci_ioda_fixup_iov().
+ *
+ *    At this point the device has been probed and the device's BARs are sized,
+ *    but no resource allocations have been done. The SR-IOV BARs are sized
+ *    based on the maximum number of VFs supported by the device and we need
+ *    to increase that to new_size.
+ *
+ * 2. Later, when Linux actually assigns resources it tries to make the resource
+ *    allocations for each PCI bus as compact as possible. As a part of that it
+ *    sorts the BARs on a bus by their required alignment, which is calculated
+ *    using pci_resource_alignment().
+ *
+ *    For IOV resources this goes:
+ *    pci_resource_alignment()
+ *        pci_sriov_resource_alignment()
+ *            pcibios_sriov_resource_alignment()
+ *                pnv_pci_iov_resource_alignment()
+ *
+ *    Our hook overrides the default alignment, equal to the per-vf-size, with
+ *    new_size computed above.
+ *
+ * 3. When userspace enables VFs for a device:
+ *
+ *    sriov_enable()
+ *       pcibios_sriov_enable()
+ *           pnv_pcibios_sriov_enable()
+ *
+ *    This is where we actually allocate PE numbers for each VF and setup the
+ *    MBT mapping for each SR-IOV BAR. In steps 1) and 2) we setup an "arena"
+ *    where each MBT segment is equal in size to the VF BAR so we can shift
+ *    around the actual SR-IOV BAR location within this arena. We need this
+ *    ability because the PE space is shared by all devices on the same PHB.
+ *    When using mode a) described above segment 0 in maps to PE#0 which might
+ *    be already being used by another device on the PHB.
+ *
+ *    As a result we need allocate a contigious range of PE numbers, then shift
+ *    the address programmed into the SR-IOV BAR of the PF so that the address
+ *    of VF0 matches up with the segment corresponding to the first allocated
+ *    PE number. This is handled in pnv_pci_vf_resource_shift().
+ *
+ *    Once all that is done we return to the PCI core which then enables VFs,
+ *    scans them and creates pci_devs for each. The init process for a VF is
+ *    largely the same as a normal device, but the VF is inserted into the IODA
+ *    PE that we allocated for it rather than the PE associated with the bus.
+ *
+ * 4. When userspace disables VFs we unwind the above in
+ *    pnv_pcibios_sriov_disable(). Fortunately this is relatively simple since
+ *    we don't need to validate anything, just tear down the mappings and
+ *    move SR-IOV resource back to its "proper" location.
+ *
+ * That's how mode a) works. In theory mode b) (single PE mapping) is less work
+ * since we can map each individual VF with a separate BAR. However, there's a
+ * few limitations:
+ *
+ * 1) For IODA2 mode b) has a minimum alignment requirement of 32MB. This makes
+ *    it only usable for devices with very large per-VF BARs. Such devices are
+ *    similar to Big Foot. They definitely exist, but I've never seen one.
+ *
+ * 2) The number of MBT entries that we have is limited. PHB3 and PHB4 only
+ *    16 total and some are needed for. Most SR-IOV capable network cards can support
+ *    more than 16 VFs on each port.
+ *
+ * We use b) when using a) would use more than 1/4 of the entire 64 bit MMIO
+ * window of the PHB.
+ *
+ *
+ *
+ * PHB4 (IODA3) added a few new features that would be useful for SR-IOV. It
+ * allowed the MBT to map 32bit MMIO space in addition to 64bit which allows
+ * us to support SR-IOV BARs in the 32bit MMIO window. This is useful since
+ * the Linux BAR allocation will place any BAR marked as non-prefetchable into
+ * the non-prefetchable bridge window, which is 32bit only. It also added two
+ * new modes:
+ *
+ * c) A segmented BAR similar to a), but each segment can be individually
+ *    mapped to any PE. This is matches how the 32bit MMIO window worked on
+ *    IODA1&2.
+ *
+ * d) A segmented BAR with 8, 64, or 128 segments. This works similarly to a),
+ *    but with fewer segments and configurable base PE.
+ *
+ *    i.e. The n'th segment maps to the (n + base)'th PE.
+ *
+ *    The base PE is also required to be a multiple of the window size.
+ *
+ * Unfortunately, the OPAL API doesn't currently (as of skiboot v6.6) allow us
+ * to exploit any of the IODA3 features.
+ */
 
 static void pnv_pci_ioda_fixup_iov_resources(struct pci_dev *pdev)
 {
-- 
2.26.2

