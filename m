Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FEF2291C1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 09:10:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBRSM5qK1zDq72
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 17:10:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1041;
 helo=mail-pj1-x1041.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=dhHwLv4c; dkim-atps=neutral
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBR9f4LfHzDqvR
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 16:57:42 +1000 (AEST)
Received: by mail-pj1-x1041.google.com with SMTP id 8so669170pjj.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jul 2020 23:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6RKYFxjNHum5BSaKU7MvqOLOxO9CB56bY6rOrYSQUc0=;
 b=dhHwLv4cIpePwMxw7A9xSSx1Fdn32SrLeS/NsMfNWKBaKk3C/hj31rrj8SRULM9iek
 vc+rkroU0gCcgHVINsIgwbtaWfoyIDBbrtia970xjfEpilkDJrfXO5dlu0vf6mKqm1Oz
 K1pxf2Ivq4MwXpqJtVr6XFbxAU8skhUaHhNYRy2TRKJUZnYpuLW5ZitqOK2m8IppXFs/
 CGju/JhhHCal3CwN0SPCMkVsPznKD/Lw3Cf6om5dUq4zedhYVBMFA1vbNOgNJdg5zfFs
 /sUbA752Z5pPrk7kBGof8Kk/XDzQXnjOldr06NLRPKOV9OfoOARQbSLI9QBpeXAp8rfJ
 58/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6RKYFxjNHum5BSaKU7MvqOLOxO9CB56bY6rOrYSQUc0=;
 b=fXrqQENY+ISbbQsmvPr5lP6N0UtsfLRTNBb0PTri77Z7nDkR3fS31Tym9k/AZyhbW8
 GqYmmDASTIuP9346U5Zjdcx+PE2i2biNjT3xUOIn0Lzpo+ZQNizh81YI+SQwfjCqIT/B
 v9wkmyv1L/me60LnEd5HbsJ2kGQE9pE5SmVMSG9hKWcYa8JeoghSYAnS+8Y4Dtw9o4YD
 YmGMrap67cZuc3bcj8dbcrs2c2vqlK7JhciOwIy88mh10COgz2ONUHIIH9+YURr7jkFl
 dSyF3RV0kQw/1LPwOULyWukUZkbyDORAI154nwgHD1UgmQbyScVgCbGAOXWdpfIP/j9M
 kzjA==
X-Gm-Message-State: AOAM531gxrZCFm/84v1TAK0DLJzvCrDkfsvE7u4mGs1DXmsbNek2BLIG
 YswIdk1rFyfUeHziRFhGxildIxt0Il8=
X-Google-Smtp-Source: ABdhPJzMgeCVvAIF6vOwN8m/ZSjX49TjHVClnvkug3tVSXuUs74YesddQT/hTssUkqsUm5hJ41axnA==
X-Received: by 2002:a17:90a:2683:: with SMTP id m3mr8963212pje.8.1595401059321; 
 Tue, 21 Jul 2020 23:57:39 -0700 (PDT)
Received: from localhost.ibm.com (203-219-159-24.tpgi.com.au. [203.219.159.24])
 by smtp.gmail.com with ESMTPSA id c14sm22645104pfj.82.2020.07.21.23.57.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 23:57:38 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 06/16] powerpc/powernv/sriov: Explain how SR-IOV works on
 PowerNV
Date: Wed, 22 Jul 2020 16:57:05 +1000
Message-Id: <20200722065715.1432738-6-oohall@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200722065715.1432738-1-oohall@gmail.com>
References: <20200722065715.1432738-1-oohall@gmail.com>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SR-IOV support on PowerNV is a byzantine maze of hooks. I have no idea
how anyone is supposed to know how it works except through a lot of
stuffering. Write up some docs about the overall story to help out
the next sucker^Wperson who needs to tinker with it.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
v2: no changes
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

