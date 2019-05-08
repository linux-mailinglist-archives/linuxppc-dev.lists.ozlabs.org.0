Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 932D21707F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2019 07:48:58 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44zQWq5wgFzDqLD
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2019 15:48:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=anastas.io
 (client-ip=104.248.188.109; helo=alpha.anastas.io;
 envelope-from=shawn@anastas.io; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=anastas.io
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=anastas.io header.i=@anastas.io header.b="fpJCAPjE"; 
 dkim-atps=neutral
Received: from alpha.anastas.io (alpha.anastas.io [104.248.188.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44zQT55sjrzDqLD
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 May 2019 15:46:33 +1000 (AEST)
Received: from authenticated-user (alpha.anastas.io [104.248.188.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alpha.anastas.io (Postfix) with ESMTPSA id C3C847F8E9;
 Tue,  7 May 2019 21:41:57 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=anastas.io; s=mail;
 t=1557283318; bh=NkudzRVjZwK8lfclmmYkCIVdF6pby8ZJf/uHpomfJrM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fpJCAPjErySQROJkqZpixSeWqaUVJJzawqjQyqdW7t39zeEH9PmmI9DB7EO13UtOq
 RpvXSPxHjEJeEsH9agvTKzb3vu+FfzKagl3JIES2Rx8u1gbWs7/AJVJUZ6G/QP4erB
 xJQzpp98YWWDkhSIK4jmBTeslTgrpnoAckWamK/wCE26uNAVuU8IKTpcWG+rKDL/Ae
 GKemB1UcGQNg16WVprwBOypaaEtBPHf4W6M4HzTiAggjAffYTMb4bvP57GPVWRg4hL
 D7vc4WwWMoKzIPJuoSFoLPkXBotjjy27GDfW2Jf5RYi/+YdZrg8+S1n19Nat3pvvLj
 ClEDTEjvulaaA==
From: Shawn Anastasio <shawn@anastas.io>
To: bhelgaas@google.com
Subject: [PATCH 3/3] powerpc/pseries: Allow user-specified PCI resource
 alignment after init
Date: Tue,  7 May 2019 21:41:51 -0500
Message-Id: <20190508024151.5690-4-shawn@anastas.io>
In-Reply-To: <20190508024151.5690-1-shawn@anastas.io>
References: <20190508024151.5690-1-shawn@anastas.io>
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
Cc: sbobroff@linux.ibm.com, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, rppt@linux.ibm.com, xyjxie@linux.vnet.ibm.com,
 paulus@samba.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On pseries, custom PCI resource alignment specified with the commandline
argument pci=resource_alignment is disabled due to PCI resources being
managed by the firmware. However, in the case of PCI hotplug the
resources are managed by the kernel, so custom alignments should be
honored in these cases. This is done by only honoring custom
alignments after initial PCI initialization is done, to ensure that
all devices managed by the firmware are excluded.

Without this ability, sub-page BARs sometimes get mapped in between
page boundaries for hotplugged devices and are therefore unusable
with the VFIO framework. This change allows users to request
page alignment for devices they wish to access via VFIO using
the pci=resource_alignment commandline argument.

In the future, this could be extended to provide page-aligned
resources by default for hotplugged devices, similar to what is
done on powernv by commit 382746376993 ("powerpc/powernv: Override
pcibios_default_alignment() to force PCI devices to be page aligned")

Signed-off-by: Shawn Anastasio <shawn@anastas.io>
---
 arch/powerpc/include/asm/machdep.h     |  3 +++
 arch/powerpc/kernel/pci-common.c       |  9 +++++++++
 arch/powerpc/platforms/pseries/setup.c | 22 ++++++++++++++++++++++
 3 files changed, 34 insertions(+)

diff --git a/arch/powerpc/include/asm/machdep.h b/arch/powerpc/include/asm/machdep.h
index 2fbfaa9176ed..46eb62c0954e 100644
--- a/arch/powerpc/include/asm/machdep.h
+++ b/arch/powerpc/include/asm/machdep.h
@@ -179,6 +179,9 @@ struct machdep_calls {
 
 	resource_size_t (*pcibios_default_alignment)(void);
 
+	/* Called when determining PCI resource alignment */
+	int (*pcibios_ignore_alignment_request)(void);
+
 #ifdef CONFIG_PCI_IOV
 	void (*pcibios_fixup_sriov)(struct pci_dev *pdev);
 	resource_size_t (*pcibios_iov_resource_alignment)(struct pci_dev *, int resno);
diff --git a/arch/powerpc/kernel/pci-common.c b/arch/powerpc/kernel/pci-common.c
index ff4b7539cbdf..1a6ded45a701 100644
--- a/arch/powerpc/kernel/pci-common.c
+++ b/arch/powerpc/kernel/pci-common.c
@@ -238,6 +238,15 @@ resource_size_t pcibios_default_alignment(void)
 	return 0;
 }
 
+resource_size_t pcibios_ignore_alignment_request(void)
+{
+	if (ppc_md.pcibios_ignore_alignment_request)
+		return ppc_md.pcibios_ignore_alignment_request();
+
+	/* Fall back to default method of checking PCI_PROBE_ONLY */
+	return pci_has_flag(PCI_PROBE_ONLY);
+}
+
 #ifdef CONFIG_PCI_IOV
 resource_size_t pcibios_iov_resource_alignment(struct pci_dev *pdev, int resno)
 {
diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
index e4f0dfd4ae33..c6af2ed8ee0f 100644
--- a/arch/powerpc/platforms/pseries/setup.c
+++ b/arch/powerpc/platforms/pseries/setup.c
@@ -82,6 +82,8 @@ EXPORT_SYMBOL(CMO_PageSize);
 
 int fwnmi_active;  /* TRUE if an FWNMI handler is present */
 
+int initial_pci_init_done; /* TRUE if initial pcibios init has completed */
+
 static void pSeries_show_cpuinfo(struct seq_file *m)
 {
 	struct device_node *root;
@@ -749,6 +751,23 @@ static resource_size_t pseries_pci_iov_resource_alignment(struct pci_dev *pdev,
 }
 #endif
 
+static void pseries_after_init(void)
+{
+	initial_pci_init_done = 1;
+}
+
+static int pseries_ignore_alignment_request(void)
+{
+	if (initial_pci_init_done)
+		/*
+		 * Allow custom alignments after init for things
+		 * like PCI hotplugging.
+		 */
+		return 0;
+
+	return pci_has_flag(PCI_PROBE_ONLY);
+}
+
 static void __init pSeries_setup_arch(void)
 {
 	set_arch_panic_timeout(10, ARCH_PANIC_TIMEOUT);
@@ -797,6 +816,9 @@ static void __init pSeries_setup_arch(void)
 	}
 
 	ppc_md.pcibios_root_bridge_prepare = pseries_root_bridge_prepare;
+	ppc_md.pcibios_after_init = pseries_after_init;
+	ppc_md.pcibios_ignore_alignment_request =
+		pseries_ignore_alignment_request;
 }
 
 static void pseries_panic(char *str)
-- 
2.20.1

