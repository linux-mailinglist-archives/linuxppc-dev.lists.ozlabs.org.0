Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F5B7FB222
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Nov 2023 07:52:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SfY6w0Kf7z3d9W
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Nov 2023 17:52:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=shingroup.cn (client-ip=18.169.211.239; helo=smtpbg151.qq.com; envelope-from=luming.yu@shingroup.cn; receiver=lists.ozlabs.org)
X-Greylist: delayed 453 seconds by postgrey-1.37 at boromir; Tue, 28 Nov 2023 17:52:13 AEDT
Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SfY6P2Kkbz3bt2
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Nov 2023 17:52:12 +1100 (AEDT)
X-QQ-mid: bizesmtp87t1701153823tkqoz2a2
Received: from HX09040029.powercore.com.cn ( [58.34.117.194])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 28 Nov 2023 14:43:40 +0800 (CST)
X-QQ-SSF: 01400000000000302000000A0000000
X-QQ-FEAT: rZJGTgY0+YO7EsZrHxvcRIiveH2oXURd51CPdA8OFs/LdrcmP73El4CyEsk7G
	0UiLBZ1Ds5Wq5Q13fzaCSpl9pdPE1lEMBROXPWcM75KL+QgnIuEfcmwhqSV2nHwaH86tNce
	BvRnVEuCkkkVZ6UQHSnu6mc95UjMs/g761i9Qz2s0ZIo3Y3QSptb8TXlOPuMQtkJVCCN6yK
	xlzM3a7t5+eOxC6jDxKLY0ZE5CRHhpP4jdD+XLuXg9y+c/zRqJ+Oc4arnzi2SCNjzsVuvoD
	RSecDodBqIhbgFlh7lyY/nLH2WM2OaoinLhbP8jWQ076A26jU8z05ywe+cLWFZBU0PqkzfA
	AaGSvLTK8GOQ3p4WI9mB4LFljniCi5DVZfmCnn50r2PzXKeB1j90fayy5IJ348j15XIuNec
X-QQ-GoodBg: 2
X-BIZMAIL-ID: 10265059360266172005
From: Luming Yu <luming.yu@shingroup.cn>
To: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu
Subject: [PATCH v1] powerpc/powernv/pci: fix PE in re-used pci_dn for pnv_pci_enable_device_hook
Date: Tue, 28 Nov 2023 14:43:38 +0800
Message-ID: <7E99D8C8296BB626+20231128064339.5038-1-luming.yu@shingroup.cn>
X-Mailer: git-send-email 2.42.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:shingroup.cn:qybglogicsvrgz:qybglogicsvrgz5a-1
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
Cc: shenghui.qu@shingroup.cn, Luming Yu <luming.yu@shingroup.cn>, dawei.li@shingroup.cn, ke.zhao@shingroup.cn, luming.yu@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

after hot remove a pcie deivce with pci_dn having pnp_php driver attached,
pci rescan with echo 1 > /sys/bus/pci/rescan could fail with error
message like:
pci 0020:0e:00.0: BAR 0: assigned [mem 0x3fe801820000-0x3fe80182ffff
64bit]
nvme nvme1: pci function 0020:0e:00.0
nvme 0020:0e:00.0 pci_enable_device() blocked, no PE assigned.

It appears that the pci_dn object is reused with only pe_number
clobbered in the case. And a simple call to pnv_ioda_setup_dev_PE should
get PE number back and solve the problem.

Signed-off-by: Luming Yu <luming.yu@shingroup.cn>
---
v0 -> v1:
-clean up garbage leaked in git format patch that stems from git clone and checkout 
-conflicts of files in local windows filesystem with weird cases and names quriks.
---
 arch/powerpc/platforms/powernv/pci-ioda.c     |  11 +-
 1 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index 28fac4770073..9d7add79ee3d 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -2325,11 +2325,18 @@ static resource_size_t pnv_pci_default_alignment(void)
 static bool pnv_pci_enable_device_hook(struct pci_dev *dev)
 {
 	struct pci_dn *pdn;
+	struct pnv_ioda_pe *pe;
 
 	pdn = pci_get_pdn(dev);
-	if (!pdn || pdn->pe_number == IODA_INVALID_PE) {
-		pci_err(dev, "pci_enable_device() blocked, no PE assigned.\n");
+	if (!pdn)
 		return false;
+
+	if (pdn->pe_number == IODA_INVALID_PE) {
+		pe = pnv_ioda_setup_dev_PE(dev);
+		if (!pe) {
+			pci_err(dev, "pci_enable_device() blocked, no PE assigned.\n");
+			return false;
+		}
 	}
 
 	return true;
