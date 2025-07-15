Return-Path: <linuxppc-dev+bounces-10248-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA758B055D5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jul 2025 11:06:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bhCwH3gP3z3c7N;
	Tue, 15 Jul 2025 19:06:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752567462;
	cv=none; b=NsK8NY7L9iePFlfs+pwpAK3VRzdHrWQ0aRZmMZKGMWNlUu4xgXNYhn+gN4jYoSe/fkINv7D21vZhQQn3UtzaBJzpeTvBYJWU15VyD8tkmVGcBftsE4gnoFVV4LUIJU2JuLOzZ3alsxFfzWhniFd811lvMTsFB3MsgwDVx+vHcKGU9oKg8mGOQu4JKoUxBoZhdT8EBwwsiufeAbezvTxTTbDBnM6spLUyUH3+Cjje83GGQd4dUVD0UQpSP00UoGFhQnaUCKxHUuNQJLNzvB5qrL15P0+uMiWzwv1ujfZZ+VS2DtpE+Yy5I4U0XuPba1JcSGqjLzwDkahhwyFtgwLc9A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752567462; c=relaxed/relaxed;
	bh=D6ysnD/5iAXxosW1Gzuf3XgySRMmYSlmh1bTJIzJ3VY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IryPKAAf3SU7porNJhtoqSXA+6FthKoePU32PqGZwtmWU99ipmL43GStTM/KArtaAxmd3wmkgXyxeOtw3PU7nHjUh+KkToxSUl2BG+3/tQtwBzJCAXDnyaFL0ys/yj/vspDp45lGEO3loMFynUVmCahov08P6GAr3Xr4rBGlwFdLK7YbrIuQt0wUGFtkhPqbrSPz1i4GTptzCurCDrpCVhOWdX9aVQSN1+0rCWpzMzp9R42FaPzCLNNNqmU18nLk4KwjwscP1ous6+9bck7bDbPGbZMg/TsShBwezLsX1sjJSbi5WXfne+VQFl9rWQgy2/o/74kVOGwQq53d6snTRw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZwZHT4u4; dkim-atps=neutral; spf=pass (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=manivannan.sadhasivam@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZwZHT4u4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=manivannan.sadhasivam@oss.qualcomm.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 1024 seconds by postgrey-1.37 at boromir; Tue, 15 Jul 2025 18:17:41 AEST
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bhBrP4pQdz3c5J
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jul 2025 18:17:40 +1000 (AEST)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56F5JrDY028090
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jul 2025 08:00:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D6ysnD/5iAXxosW1Gzuf3XgySRMmYSlmh1bTJIzJ3VY=; b=ZwZHT4u4Y9D5vKoY
	qVBb75HCNE2p/VMEbTcy8CWR+Qed8ESs1vEtbJzoSN2bqMyVm411H2IdHwiWRd5/
	1Fju0hiy6yk4y6VZM7BY+3Dn/FuEc0ygnKuNEeKmpSC5YDD/RFr87RgIz3Ds9/y5
	ZqyCfHDZREWn41SVsymlzgHQipQVzU+B7bLLZb3eJOYLQ5U5zAVnGOX15fwPqbVG
	Rbwq0fjYzZSDlWfgCYiuc+oc1l7Ae7Q2iWbnEmnUn4NIUu9b2/BvLG2iFIvLKuy7
	gqBlyQMKvMNNlIsswvzE6rGfogP+I5LSU72Ywtm08+fWFpG1YmBtBS+BRl9oZR3m
	0KSlTQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5drj3tk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jul 2025 08:00:42 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ab6cc9811aso21595611cf.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jul 2025 01:00:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752566441; x=1753171241;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D6ysnD/5iAXxosW1Gzuf3XgySRMmYSlmh1bTJIzJ3VY=;
        b=b1weHCi1O1Fw0WiI7y7lVdSzkO0R3fOv3UmCALRsrZOCkiOTPpTlZaDVyADBaXg9t8
         K2Vl0UK15aNacWTkYOV2eYOwMnRlGOb9rwTWSdBVkOy68TE1QITfK2d862u0Oa9u3l1F
         Ju72nvWbDaRAWYCAMPMu7FjcUAFlxq9+tY4aWVKeqoFSpCbJdlJZXFJaAaP6FSlxZ3pv
         CNIpSiv5Cz8tgAfk5Th5ur3NG/YWfKD3eSvUo1Hd0t6Vj5dziNA9lhRKd88DLh40Xtzb
         5rujnRZzmuxcpDUp1dt5LcGTvuIU94c5c+6Bw1gfmUmtTfVXDoJYLlS7bncFLXoSni3D
         hgmg==
X-Forwarded-Encrypted: i=1; AJvYcCUgtZARvyQBJDuw5Ua4IiiwafEhg42bxMiedutz9aw8r6xt8++A8IGXQyWnQnHH9e3KGk/Q3DXUabW9zIo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx4uDyQdTT2FH+8+sHmkblDBYkk+qkn2STtFxUf0sYYp+twE/49
	ZE+qGMdz8huhTCr3oAHhoZQ12lsNkrQ0lCz9lO0hhTw67nOSbAs/Q36swRYSSkGhKJEc8ksiwIn
	VTbPy85rgI0dBsw8QyYkJH3uIMGtvMl1Wz69BF8N2ozllZxr0HahjKcFZQ21aqKhAq8uv
X-Gm-Gg: ASbGncuBlu0E9f4YL+vMK9lmdpuYuDbPho/ymsz1lp1QX0WJdYj1nSi5pt/WaYJ+NbS
	d45StTM8CgiCKh4VrKZADhbzsscUkpRF+sT4gbVNNLsQ7GLrzw/Xjz4qMn5cJ3meKszdmfOOEkv
	gv1iL1fl4s+np+AvHASryUvG7CvX0kI5M1IT8szZOSwXmbuq4j6Vo0Uhf0EgWtN67AeuGV/KM6+
	MNu1s/O2+UD4LBQOIV1c/HU3PeV3fha4evizBvHt8U9Q6rZ0dsiLgvpLPPo9mKgarT7ZYUwKXX1
	HGH0iJgcTPW6pbI85AA/3whTkqWTVjHabHcfWSr/4YGqvFx7sOfTgUqmXL1eCHhYbUuNew==
X-Received: by 2002:ac8:5993:0:b0:4ab:8692:40a2 with SMTP id d75a77b69052e-4ab86924470mr12172201cf.31.1752566440927;
        Tue, 15 Jul 2025 01:00:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkpGQtILhnEHERJ673OeN0FgBmv4MnAjC8XdRghEvGrglotm8k2pXupnP9yiLQxNXhGkIZjw==
X-Received: by 2002:ac8:5993:0:b0:4ab:8692:40a2 with SMTP id d75a77b69052e-4ab86924470mr12171501cf.31.1752566440143;
        Tue, 15 Jul 2025 01:00:40 -0700 (PDT)
Received: from [192.168.1.17] ([120.60.140.219])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ab3f1c9a2csm37792461cf.67.2025.07.15.01.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 01:00:39 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Date: Tue, 15 Jul 2025 13:29:21 +0530
Subject: [PATCH v5 4/4] PCI: dw-rockchip: Add support to reset Root Port
 upon link down event
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250715-pci-port-reset-v5-4-26a5d278db40@oss.qualcomm.com>
References: <20250715-pci-port-reset-v5-0-26a5d278db40@oss.qualcomm.com>
In-Reply-To: <20250715-pci-port-reset-v5-0-26a5d278db40@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
        Oliver O'Halloran <oohall@gmail.com>, Will Deacon <will@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Niklas Cassel <cassel@kernel.org>,
        Wilfred Mallawa <wilfred.mallawa@wdc.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        mani@kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6494;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=qm+3CMghWKFd+O3bZU1o020L8vQ/E6aH1MlFdMAO6mw=;
 b=kA0DAAoBVZ8R5v6RzvUByyZiAGh2CoGjTk+bNihPn5Ta/emfi4VuEHDCY9gUDJj0zK6HfintK
 YkBMwQAAQoAHRYhBGelQyqBSMvYpFgnl1WfEeb+kc71BQJodgqBAAoJEFWfEeb+kc71TAsH/067
 9cJ5IPFpzCBL732ut1hn/o6zTxDftn8tPHzgztjQdxXSL/O/w5NfTpJru1GYf1pYtBStG6Cs/9I
 z3nXGJa6TVESRE4U5Y8Pmijj1eat+KDW3uwmJYOtLMjaIZsze1kEd/hyXr+bv/i3aoCTErIV6+2
 D+aHYAyvi/TcCiwVWkYYShMq0LRVqA3oVmYg6Hato/apcL3mkGEFe1pPZufa4qQg5pSLK//xvjJ
 ZnqdxrYYwKSz3h+16BVyCJAakAW7RbQEeJy+wd/SknKSkWBujr8gGp+zYZTX3xXbuwXuRh+PwXt
 iUjSv4gTmOayuOnyW+CuWYHdCwWO74tmRxmO6xY=
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Proofpoint-ORIG-GUID: BSwpUHWF7Dx5uLXykMaB_V624FFqvp8x
X-Authority-Analysis: v=2.4 cv=D4xHKuRj c=1 sm=1 tr=0 ts=68760aaa cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=HOswsyiB/7FCIMMjk980kA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=JF9118EUAAAA:8 a=EUspDBNiAAAA:8
 a=egBNXRPT3pT-oCRg218A:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=xVlTc564ipvMDusKsbsT:22
X-Proofpoint-GUID: BSwpUHWF7Dx5uLXykMaB_V624FFqvp8x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDA3MiBTYWx0ZWRfX4C4BrKVeFXIk
 IPjFDKtLy3Akj+W0oQX69FYYTAauXqA+c17CZU5xhVZg3Yw++0K52LqPJW6WiYSC+Y2YCd9PRfW
 /BsffjQhfCnnSw8CHF1kO0Caa7kXei0QyrqZhMD5AxyPVlW9aglDH/S+P/+Bo0jBffunpBU0SUX
 KJkSSBbWSONmiXoDWpL2OoWOOm9g+3fGqlbvkRxGPhLtyhQExy3vfNhqY+nbfpXDJayO5HxE4qT
 hibpcTenzFidtLDKMnOjXqMRr+GnZyZnzQfOEE6Z2B0K6xNuRuKhsnHbCTSPntbFyyA/weWrtSr
 rqYJrqwaBDY9KLZ3RTTOOQhmGzvzc8HQd5S8iOu/g2jsb3TE4I6QG2m2vY4WUNTxHwosqIyOQN8
 Ag4ZFKVLdbA0yJ1k2nkI7DlyiSJbo3U9hEuJACceHl8fQPq+6SB2ssrthVAp1moe15Y6DRsP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_03,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999 impostorscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507150072
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Wilfred Mallawa <wilfred.mallawa@wdc.com>

The PCIe link may go down in cases like firmware crashes or unstable
connections. When this occurs, the PCIe Root Port must be reset to restore
the functionality. However, the current driver lacks link down handling,
forcing users to reboot the system to recover.

This patch implements the `reset_root_port` callback for link down handling
for Rockchip DWC PCIe host controller. In which, the RC is reset,
reconfigured and link training initiated to recover from the link down
event.

This also by extension fixes issues with sysfs initiated bus resets. In
that, currently, when a sysfs initiated bus reset is issued, the endpoint
device is non-functional after (may link up with downgraded link status).
With the link down handling support, a sysfs initiated bus reset works as
intended. Testing conducted on a ROCK5B board with an M.2 NVMe drive.

Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
[mani: rebased on top of the new version of reset_root_port series]
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/Kconfig            |  1 +
 drivers/pci/controller/dwc/pcie-dw-rockchip.c | 91 ++++++++++++++++++++++++++-
 2 files changed, 90 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
index ce04ee6fbd99cbcce5d2f3a75ebd72a17070b7b7..01e2650242ccc345bdd0568d08219527f00ed395 100644
--- a/drivers/pci/controller/dwc/Kconfig
+++ b/drivers/pci/controller/dwc/Kconfig
@@ -348,6 +348,7 @@ config PCIE_ROCKCHIP_DW_HOST
 	depends on OF
 	select PCIE_DW_HOST
 	select PCIE_ROCKCHIP_DW
+	select PCI_HOST_COMMON
 	help
 	  Enables support for the DesignWare PCIe controller in the
 	  Rockchip SoC (except RK3399) to work in host mode.
diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
index 93171a3928794915ad1e8c03c017ce0afc1f9169..8f1a34c5fbabaacbd9624048ca4c4f8dc29f2171 100644
--- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
+++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
@@ -23,6 +23,7 @@
 #include <linux/reset.h>
 
 #include "../../pci.h"
+#include "../pci-host-common.h"
 #include "pcie-designware.h"
 
 /*
@@ -84,6 +85,9 @@ struct rockchip_pcie_of_data {
 	const struct pci_epc_features *epc_features;
 };
 
+static int rockchip_pcie_rc_reset_root_port(struct pci_host_bridge *bridge,
+				       struct pci_dev *pdev);
+
 static int rockchip_pcie_readl_apb(struct rockchip_pcie *rockchip, u32 reg)
 {
 	return readl_relaxed(rockchip->apb_base + reg);
@@ -257,6 +261,7 @@ static int rockchip_pcie_host_init(struct dw_pcie_rp *pp)
 					 rockchip);
 
 	rockchip_pcie_enable_l0s(pci);
+	pp->bridge->reset_root_port = rockchip_pcie_rc_reset_root_port;
 
 	return 0;
 }
@@ -448,6 +453,7 @@ static irqreturn_t rockchip_pcie_rc_sys_irq_thread(int irq, void *arg)
 	struct dw_pcie *pci = &rockchip->pci;
 	struct dw_pcie_rp *pp = &pci->pp;
 	struct device *dev = pci->dev;
+	struct pci_dev *port;
 	u32 reg;
 
 	reg = rockchip_pcie_readl_apb(rockchip, PCIE_CLIENT_INTR_STATUS_MISC);
@@ -456,6 +462,14 @@ static irqreturn_t rockchip_pcie_rc_sys_irq_thread(int irq, void *arg)
 	dev_dbg(dev, "PCIE_CLIENT_INTR_STATUS_MISC: %#x\n", reg);
 	dev_dbg(dev, "LTSSM_STATUS: %#x\n", rockchip_pcie_get_ltssm(rockchip));
 
+	if (reg & PCIE_LINK_REQ_RST_NOT_INT) {
+		dev_dbg(dev, "hot reset or link-down reset\n");
+		for_each_pci_bridge(port, pp->bridge->bus) {
+			if (pci_pcie_type(port) == PCI_EXP_TYPE_ROOT_PORT)
+				pci_host_handle_link_down(port);
+		}
+	}
+
 	if (reg & PCIE_RDLH_LINK_UP_CHGED) {
 		if (rockchip_pcie_link_up(pci)) {
 			dev_dbg(dev, "Received Link up event. Starting enumeration!\n");
@@ -537,8 +551,8 @@ static int rockchip_pcie_configure_rc(struct platform_device *pdev,
 		return ret;
 	}
 
-	/* unmask DLL up/down indicator */
-	val = HIWORD_UPDATE(PCIE_RDLH_LINK_UP_CHGED, 0);
+	/* unmask DLL up/down indicator and hot reset/link-down reset irq */
+	val = HIWORD_UPDATE(PCIE_RDLH_LINK_UP_CHGED | PCIE_LINK_REQ_RST_NOT_INT, 0);
 	rockchip_pcie_writel_apb(rockchip, val, PCIE_CLIENT_INTR_MASK_MISC);
 
 	return ret;
@@ -689,6 +703,79 @@ static int rockchip_pcie_probe(struct platform_device *pdev)
 	return ret;
 }
 
+static int rockchip_pcie_rc_reset_root_port(struct pci_host_bridge *bridge,
+					    struct pci_dev *pdev)
+{
+	struct pci_bus *bus = bridge->bus;
+	struct dw_pcie_rp *pp = bus->sysdata;
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+	struct rockchip_pcie *rockchip = to_rockchip_pcie(pci);
+	struct device *dev = rockchip->pci.dev;
+	u32 val;
+	int ret;
+
+	dw_pcie_stop_link(pci);
+	clk_bulk_disable_unprepare(rockchip->clk_cnt, rockchip->clks);
+	rockchip_pcie_phy_deinit(rockchip);
+
+	ret = reset_control_assert(rockchip->rst);
+	if (ret)
+		return ret;
+
+	ret = rockchip_pcie_phy_init(rockchip);
+	if (ret)
+		goto disable_regulator;
+
+	ret = reset_control_deassert(rockchip->rst);
+	if (ret)
+		goto deinit_phy;
+
+	ret = rockchip_pcie_clk_init(rockchip);
+	if (ret)
+		goto deinit_phy;
+
+	ret = pp->ops->init(pp);
+	if (ret) {
+		dev_err(dev, "Host init failed: %d\n", ret);
+		goto deinit_clk;
+	}
+
+	/* LTSSM enable control mode */
+	val = HIWORD_UPDATE_BIT(PCIE_LTSSM_ENABLE_ENHANCE);
+	rockchip_pcie_writel_apb(rockchip, val, PCIE_CLIENT_HOT_RESET_CTRL);
+
+	rockchip_pcie_writel_apb(rockchip, PCIE_CLIENT_RC_MODE, PCIE_CLIENT_GENERAL_CON);
+
+	ret = dw_pcie_setup_rc(pp);
+	if (ret) {
+		dev_err(dev, "Failed to setup RC: %d\n", ret);
+		goto deinit_clk;
+	}
+
+	/* unmask DLL up/down indicator and hot reset/link-down reset irq */
+	val = HIWORD_UPDATE(PCIE_RDLH_LINK_UP_CHGED | PCIE_LINK_REQ_RST_NOT_INT, 0);
+	rockchip_pcie_writel_apb(rockchip, val, PCIE_CLIENT_INTR_MASK_MISC);
+
+	ret = dw_pcie_start_link(pci);
+	if (ret)
+		goto deinit_clk;
+
+	/* Ignore errors, the link may come up later */
+	dw_pcie_wait_for_link(pci);
+	dev_dbg(dev, "Root Port reset completed\n");
+	return ret;
+
+deinit_clk:
+	clk_bulk_disable_unprepare(rockchip->clk_cnt, rockchip->clks);
+deinit_phy:
+	rockchip_pcie_phy_deinit(rockchip);
+disable_regulator:
+	if (rockchip->vpcie3v3)
+		regulator_disable(rockchip->vpcie3v3);
+
+	return ret;
+}
+
 static const struct rockchip_pcie_of_data rockchip_pcie_rc_of_data_rk3568 = {
 	.mode = DW_PCIE_RC_TYPE,
 };

-- 
2.45.2


