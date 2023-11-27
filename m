Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C89417F980F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Nov 2023 04:57:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SdsH95JY7z3cjf
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Nov 2023 14:57:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=shingroup.cn (client-ip=43.155.80.173; helo=bg5.exmail.qq.com; envelope-from=luming.yu@shingroup.cn; receiver=lists.ozlabs.org)
X-Greylist: delayed 387 seconds by postgrey-1.37 at boromir; Mon, 27 Nov 2023 13:40:13 AEDT
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.155.80.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SdqZ556vrz30gH
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Nov 2023 13:40:13 +1100 (AEDT)
X-QQ-mid: bizesmtp64t1701052377tsjca7qc
Received: from HX09040029.powercore.com.cn ( [58.34.117.194])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 27 Nov 2023 10:32:54 +0800 (CST)
X-QQ-SSF: 01400000000000103000000A0000000
X-QQ-FEAT: CR3LFp2JE4lYlGZyt7s4Y2ErgzYu/i1VV9Xrg9Ot17hS0sZN4+BeicMF5VMkA
	boSUhErVjzKfj68SY7KvmYQK8jxsKVFlnBTCI3e22iIVQvlcW2rrQlLjCk8yr3kzLTWQo6T
	vDf5Aj5EOOJvaG8Hdm8w3iPApU+5vxAAH3875ZjfDTYId9QIkZ2JxD4FTXes+KKPv7TC6XQ
	AU6ysOaOytRKx9ugXKYWzO3vOE57p4XEFGeMgqQXnMcTGcArtGhFLtcIthhszqd2buHvppz
	QP3gxDvuvOXwTp7HVmQyScJeC7S7MRGEEbO/4WGZuU5PpMniuixJqr59OlQ0V/CZPMvglOu
	4yXyTHUDW4w0mERxPsra1GFbQxbe9MOMEuOHvBrzY+YDxp+f+HIa5lr8k7Ae6aM+zSPZJZx
	8GgbSAZFwgYIumQhd6tgHQ==
X-QQ-GoodBg: 2
X-BIZMAIL-ID: 16950061229270955396
From: Luming Yu <luming.yu@shingroup.cn>
To: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu
Subject: [PATCH] powerpc/powernv/pci: Do setup dev PE in pnv_pci_enable_device_hook
Date: Mon, 27 Nov 2023 10:32:39 +0800
Message-ID: <041F99FBF8A508A2+20231127023239.4157-1-luming.yu@shingroup.cn>
X-Mailer: git-send-email 2.42.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:shingroup.cn:qybglogicsvrgz:qybglogicsvrgz5a-1
X-Mailman-Approved-At: Mon, 27 Nov 2023 14:57:01 +1100
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
 arch/powerpc/platforms/powernv/pci-ioda.c     |  11 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/i2c/aux.c | 215 ------------------
 drivers/gpu/drm/nouveau/nvkm/subdev/i2c/aux.h |  46 ----
 include/soc/arc/aux.h                         |  59 -----
 4 files changed, 9 insertions(+), 322 deletions(-)
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/i2c/aux.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/i2c/aux.h
 delete mode 100644 include/soc/arc/aux.h

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
