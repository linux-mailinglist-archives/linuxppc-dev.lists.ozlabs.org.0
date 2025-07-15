Return-Path: <linuxppc-dev+bounces-10249-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F8DB055D6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jul 2025 11:06:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bhCwT1Qhcz3c7j;
	Tue, 15 Jul 2025 19:06:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752568541;
	cv=none; b=kYzu48i+XdMXf5yQOE2JkvupI3z8mib6IeyITj9DN02ZVvURcn1M1bSKiDcItcUDxNYWQ0oZ+yj2UG9P+Yz0FC1Ah5a7aaLS4sP3BZniKuvGkcx2TCVYocHPALzziBdV0sI0WsSdeldFezS4i7RsBjwvVmNYW5/mXwPeGzxdnMrjtpvcfWEvVkeOyUUtOHGLDnpodrguS/5vZWQlCMuho0JL21HOvL6JtULdTt2rDW/OiSv0+Io81B7/rrSgzjcHEEYcNk4ANiSfR44IIBsw96ewB2tao0BIOMXQ3Q5R6NueRgNE6Hmh+7fxJmPO+RqlyA+KxsRmR74iaeUpFpRjTw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752568541; c=relaxed/relaxed;
	bh=kEhIYqJbOaIa1Xc2HyDfChdym/dNhQN5pFztVZHEzbA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nYNbiL8WA8lfR3wfHv+y8saGpOKInx3YLAvz11/hGP+Fk2+7dywzwaHT9WAXWaMKq9jynFWobz+4Dc2WAafDimyXwcDyQ8LY8Xt6tFZ+zfJHyEm4t9qF8JDP9pdriZqIzliyd2HO3lGNRtWwiSY6BiT8FHl6fp9US3EssuhuIyC5k/ekN8gfVoIs849pHA+JhCNxlKBy+AX+To8SbJGfM9K+D2ZAN75TDxdj6L/awURY7zEJf+6xydOqdzABgXM4aFTJYaLa1lDiwI/fnOk8KchPxAhu/EYj4QtxrE4Uav/i5pOsNNSwAU9JWxL1fCa+nLS2261YO5BO80ENvHuzHg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V10h7ulx; dkim-atps=neutral; spf=pass (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=manivannan.sadhasivam@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V10h7ulx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=manivannan.sadhasivam@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bhCF903xFz3c5X
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jul 2025 18:35:40 +1000 (AEST)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56F62D4b012484
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jul 2025 08:00:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kEhIYqJbOaIa1Xc2HyDfChdym/dNhQN5pFztVZHEzbA=; b=V10h7ulxeguclmyH
	WE+NqBM6BeQc74JWzqoM7zCwesQYgpVJPJhsD/8Zn9CZjwHyyafjN0A4dp658lbr
	SvQYn9qm9Umt2easVTAtsETGHBKU/LYc4u9U78zQBg4DYVOgwrwK366bWoROGCK7
	2JlpQicAL+tmsdBG/5WcVrWYHwigxqvaZNiu47Zzc4F6zzgxjb3RAeuw2MSC0yIj
	zXoEijMd2Adm2SlK8Eb09O5k441W9fYMRwb2InR/+0+65s5VFjeR7aRBqQmSgdjI
	IY7wcRHrf7ALqBpqyra1nxxdC27cTsnthQH/qBhRLro/F1P6EXRC7msrwzYGIAO/
	J6NMbw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dyj40p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jul 2025 08:00:34 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d40f335529so1068333985a.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jul 2025 01:00:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752566433; x=1753171233;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kEhIYqJbOaIa1Xc2HyDfChdym/dNhQN5pFztVZHEzbA=;
        b=R4YSiv5G9RjiovliFdo0OMdoNcgG/6uSfX3Nv27Ge761hwgoO3JTBiV1I7X3SvvIFg
         fn6jkBbzQquAQcTq6wungiiXDRA+eGxoge1mRWcs9ZeD5OhVWS08/lrL9ahV2uoJgemr
         0m0t3ABOgi5m0VUfOhDWVWbJ3cSNENLzWzKdPhLToJfz2GfhdqTmI949nLR18ubte4WD
         uSclnqGWUxDOsobtnsHYpxpgK0NtwyUkchvano4kz8edWI9k0N8q61ARftKyl0M8E7UD
         xBQOrbMXJhevxeBQ8f9bqya6I0ViwsGDeOhIqp3WOLp1BLvHHqeEo4DnGev5znp/thsX
         1QfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWk+Eic9It982HZjVJF5i3amKsLhpUTTkUGUIf9IVBU3l4Wja/fZunjyk63AkpUW7b118UtTKGGM/rAmv4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzpGUTR+RVpgqe+0c8dh7DZWZ9Obarab6zfa8LWfStQRonQ8Pt9
	H6UIT6Rpurw1BGd+6KYmBAsXL3fc/Mq4dESzOrDEniQliRxM1LCvdlG4fgJ3ehVpyblffDSySpr
	ngtjOprUGvWCqldP+x/MgxfaqZwCNM/JlsjV7cj3HbankEVz1oWvltmfOCCUN4goOzUKj
X-Gm-Gg: ASbGncu32acG9o3E3Hhsrj40itUPkVPhv5grd6iZdM1/w2QdL/V2kNeKaZRZJSET+Ox
	EAtN8zs72lCZOfhzEOzQJGyM3eNML3DLurJ8UdcvbLqKxo25M1aq/SGtm58owddRSjlAcTQNCRK
	Csy/AFJH37HEYveg5zywkgWkAH3G0bo9sGB3oYtuXCHJTx6mZkxwva0pwJHNZKEvGa5QOYV1Wyi
	uiZMeATDIdINJEdg64vz9016AZnXhW7z0dHW6yC1TcSWeq6nSqyIbWe9GK5BO/+qEt08nfEQGRy
	0IL03cFOGrrLPja4UKEfTh4jJg1S+VrBZbds7HMtp0qUh86YlLX7C0MXimVDKO/XBQr/0A==
X-Received: by 2002:ac8:6907:0:b0:4ab:622b:fffb with SMTP id d75a77b69052e-4ab7f742dc4mr41248931cf.5.1752566433355;
        Tue, 15 Jul 2025 01:00:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH796r6lrIztsRgeIxSf9ms5hlmcL8dEtWpdycBQuSpvlLV+rRBV+Q2s2WU+1kv+eVUhKz0lw==
X-Received: by 2002:ac8:6907:0:b0:4ab:622b:fffb with SMTP id d75a77b69052e-4ab7f742dc4mr41248021cf.5.1752566432691;
        Tue, 15 Jul 2025 01:00:32 -0700 (PDT)
Received: from [192.168.1.17] ([120.60.140.219])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ab3f1c9a2csm37792461cf.67.2025.07.15.01.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 01:00:31 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Date: Tue, 15 Jul 2025 13:29:20 +0530
Subject: [PATCH v5 3/4] PCI: qcom: Add support for resetting the Root Port
 due to link down event
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
Message-Id: <20250715-pci-port-reset-v5-3-26a5d278db40@oss.qualcomm.com>
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
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8942;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=hcHUE0Es+rhE1k65uaN43jzCwIv2KxCfrP4I/tTARuY=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBodgqB1QE0utBqY/jYrvA6r/I4HDgTWPrqjaBa7
 NuYHzQIJeWJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaHYKgQAKCRBVnxHm/pHO
 9RqtB/4jqXKRNf4PwhYqoPJL9auiFCZf55Z05d3Hi72i2jKZ/jwqcR/hE7ZmwkjCJeSpDWy2Z9c
 XE0PdD0dGB2PX0gi03PtmZXx5DgVGOscG2SbLIaWM8B520UYAFXJ4kFtGq7DsFEd8QMLIsSTwOh
 NLpHt9hhJ7+gePNTmy8AXfv3xjOLnt1gcWT0Ac8u7EZP2ylznMv6XBYfMuBhg6ij5IMfed73BG8
 GmSweylGR5sBGMCVChkClYBC88UDi8aFzR3/NiLpAqiilRb43EB6dNgVkputG0R/+h1zlAIOO2g
 zj0SoVNnLN4DiUdxKZ2OcDH0gSugoamD2sY2hJMZfBRqJIhH
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Proofpoint-ORIG-GUID: BTItSjWhRGXKQOKEuhhOsPU7gYxVLfHO
X-Authority-Analysis: v=2.4 cv=RtXFLDmK c=1 sm=1 tr=0 ts=68760aa3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=HOswsyiB/7FCIMMjk980kA==:17
 a=NZ62LyZXjo_B3Dgd:21 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=y4pR3j7WNrOdjUP15kUA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDA3MiBTYWx0ZWRfX0Oyhb4LjxwGb
 PCKTKiNVQPEOXRKXPxXOQtP7eBg0Kk3vCfvvpiL74kqIDhrUvkVx7u1L1rqMU7D+8O8kI1EEJA0
 f6ocamj+YFlxz4Pt51hAAzkQLaNjzvcZObb0h+dnqd9COQJvpSo1dlnmhbKLPs60DcJCBxBq4ra
 C3JUxLA89j/MFHFEw+VTKFfo0XGO4zhYCLnKk9Mr1EYrU2FCn96IZPDUXBKyAL5UzcHcOKCg+m+
 vpUNJZGxVTn1yFeKPROu6OIMV/vkXgz4O8ANjsFdEYzx2X7/nWHhaP+6Is9OqYmqAR9DlTBMoCR
 JkwrBm+QZd+RFfZ8F5U74GAJlwngsSLJK01Snvp04Fs/JnNboqTG/uDjYGaglTRyYfow4wvU4Zy
 UrkxP2vvPBilpdhv8Qvyy25wuhq4G2QqZ8Ey4jjj+x8He8B42T6hLcsz1Yst8KTLjai0Math
X-Proofpoint-GUID: BTItSjWhRGXKQOKEuhhOsPU7gYxVLfHO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_03,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 clxscore=1011 mlxlogscore=999
 priorityscore=1501 phishscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507150072
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Manivannan Sadhasivam <mani@kernel.org>

The PCIe link can go down under circumstances such as the device firmware
crash, link instability, etc... When that happens, the PCIe Root Port needs
to be reset to make it operational again. Currently, the driver is not
handling the link down event, due to which the users have to restart the
machine to make PCIe link operational again. So fix it by detecting the
link down event and resetting the Root Port.

Since the Qcom PCIe controllers report the link down event through the
'global' IRQ, enable the link down event by setting PARF_INT_ALL_LINK_DOWN
bit in PARF_INT_ALL_MASK register.

In the case of the event, iterate through the available Root Ports and call
pci_host_handle_link_down() API with Root Port 'pci_dev' to let the PCI
core handle the link down condition. Note that both link up and link down
events could be set at a time when the handler runs. So always handle link
down first. Since Qcom PCIe controllers only support one Root Port per
controller instance, the API will be called only once. But the looping is
necessary as there is no PCI API available to fetch the Root Port instance
without the child 'pci_dev'.

The API will internally call, 'pci_host_bridge::reset_root_port()' callback
to reset the Root Port in a platform specific way. So implement the
callback to reset the Root Port by first resetting the PCIe core, followed
by reinitializing the resources and then finally starting the link again.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/Kconfig     |   1 +
 drivers/pci/controller/dwc/pcie-qcom.c | 120 ++++++++++++++++++++++++++++++---
 2 files changed, 113 insertions(+), 8 deletions(-)

diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
index d9f0386396edf66ad0e514a0f545ed24d89fcb6c..ce04ee6fbd99cbcce5d2f3a75ebd72a17070b7b7 100644
--- a/drivers/pci/controller/dwc/Kconfig
+++ b/drivers/pci/controller/dwc/Kconfig
@@ -296,6 +296,7 @@ config PCIE_QCOM
 	select PCIE_DW_HOST
 	select CRC8
 	select PCIE_QCOM_COMMON
+	select PCI_HOST_COMMON
 	help
 	  Say Y here to enable PCIe controller support on Qualcomm SoCs. The
 	  PCIe controller uses the DesignWare core plus Qualcomm-specific
diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index c789e3f856550bcfa1ce09962ba9c086d117de05..5f7b2b80aace742780e5bc5b479f4f64ab778453 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -34,6 +34,7 @@
 #include <linux/units.h>
 
 #include "../../pci.h"
+#include "../pci-host-common.h"
 #include "pcie-designware.h"
 #include "pcie-qcom-common.h"
 
@@ -55,6 +56,7 @@
 #define PARF_INT_ALL_STATUS			0x224
 #define PARF_INT_ALL_CLEAR			0x228
 #define PARF_INT_ALL_MASK			0x22c
+#define PARF_STATUS				0x230
 #define PARF_SID_OFFSET				0x234
 #define PARF_BDF_TRANSLATE_CFG			0x24c
 #define PARF_DBI_BASE_ADDR_V2			0x350
@@ -130,9 +132,14 @@
 
 /* PARF_LTSSM register fields */
 #define LTSSM_EN				BIT(8)
+#define SW_CLEAR_FLUSH_MODE			BIT(10)
+#define FLUSH_MODE				BIT(11)
 
 /* PARF_INT_ALL_{STATUS/CLEAR/MASK} register fields */
-#define PARF_INT_ALL_LINK_UP			BIT(13)
+#define INT_ALL_LINK_DOWN			1
+#define INT_ALL_LINK_UP				13
+#define PARF_INT_ALL_LINK_DOWN			BIT(INT_ALL_LINK_DOWN)
+#define PARF_INT_ALL_LINK_UP			BIT(INT_ALL_LINK_UP)
 #define PARF_INT_MSI_DEV_0_7			GENMASK(30, 23)
 
 /* PARF_NO_SNOOP_OVERRIDE register fields */
@@ -145,6 +152,9 @@
 /* PARF_BDF_TO_SID_CFG fields */
 #define BDF_TO_SID_BYPASS			BIT(0)
 
+/* PARF_STATUS fields */
+#define FLUSH_COMPLETED				BIT(8)
+
 /* ELBI_SYS_CTRL register fields */
 #define ELBI_SYS_CTRL_LT_ENABLE			BIT(0)
 
@@ -169,6 +179,7 @@
 						PCIE_CAP_SLOT_POWER_LIMIT_SCALE)
 
 #define PERST_DELAY_US				1000
+#define FLUSH_TIMEOUT_US			100
 
 #define QCOM_PCIE_CRC8_POLYNOMIAL		(BIT(2) | BIT(1) | BIT(0))
 
@@ -274,11 +285,14 @@ struct qcom_pcie {
 	struct icc_path *icc_cpu;
 	const struct qcom_pcie_cfg *cfg;
 	struct dentry *debugfs;
+	int global_irq;
 	bool suspended;
 	bool use_pm_opp;
 };
 
 #define to_qcom_pcie(x)		dev_get_drvdata((x)->dev)
+static int qcom_pcie_reset_root_port(struct pci_host_bridge *bridge,
+				  struct pci_dev *pdev);
 
 static void qcom_ep_reset_assert(struct qcom_pcie *pcie)
 {
@@ -1263,6 +1277,8 @@ static int qcom_pcie_host_init(struct dw_pcie_rp *pp)
 			goto err_assert_reset;
 	}
 
+	pp->bridge->reset_root_port = qcom_pcie_reset_root_port;
+
 	return 0;
 
 err_assert_reset:
@@ -1517,6 +1533,78 @@ static void qcom_pcie_icc_opp_update(struct qcom_pcie *pcie)
 	}
 }
 
+/*
+ * Qcom PCIe controllers only support one Root Port per controller instance. So
+ * this function ignores the 'pci_dev' associated with the Root Port and just
+ * resets the host bridge, which in turn resets the Root Port also.
+ */
+static int qcom_pcie_reset_root_port(struct pci_host_bridge *bridge,
+				  struct pci_dev *pdev)
+{
+	struct pci_bus *bus = bridge->bus;
+	struct dw_pcie_rp *pp = bus->sysdata;
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+	struct qcom_pcie *pcie = to_qcom_pcie(pci);
+	struct device *dev = pcie->pci->dev;
+	u32 val;
+	int ret;
+
+	/* Wait for the pending transactions to be completed */
+	ret = readl_relaxed_poll_timeout(pcie->parf + PARF_STATUS, val,
+					 val & FLUSH_COMPLETED, 10,
+					 FLUSH_TIMEOUT_US);
+	if (ret) {
+		dev_err(dev, "Flush completion failed: %d\n", ret);
+		goto err_host_deinit;
+	}
+
+	/* Clear the FLUSH_MODE to allow the core to be reset */
+	val = readl(pcie->parf + PARF_LTSSM);
+	val |= SW_CLEAR_FLUSH_MODE;
+	writel(val, pcie->parf + PARF_LTSSM);
+
+	/* Wait for the FLUSH_MODE to clear */
+	ret = readl_relaxed_poll_timeout(pcie->parf + PARF_LTSSM, val,
+					 !(val & FLUSH_MODE), 10,
+					 FLUSH_TIMEOUT_US);
+	if (ret) {
+		dev_err(dev, "Flush mode clear failed: %d\n", ret);
+		goto err_host_deinit;
+	}
+
+	qcom_pcie_host_deinit(pp);
+
+	ret = qcom_pcie_host_init(pp);
+	if (ret) {
+		dev_err(dev, "Host init failed\n");
+		return ret;
+	}
+
+	ret = dw_pcie_setup_rc(pp);
+	if (ret)
+		goto err_host_deinit;
+
+	/*
+	 * Re-enable global IRQ events as the PARF_INT_ALL_MASK register is
+	 * non-sticky.
+	 */
+	if (pcie->global_irq)
+		writel_relaxed(PARF_INT_ALL_LINK_UP | PARF_INT_ALL_LINK_DOWN |
+			       PARF_INT_MSI_DEV_0_7, pcie->parf + PARF_INT_ALL_MASK);
+
+	qcom_pcie_start_link(pci);
+	dw_pcie_wait_for_link(pci);
+
+	dev_dbg(dev, "Root Port reset completed\n");
+
+	return 0;
+
+err_host_deinit:
+	qcom_pcie_host_deinit(pp);
+
+	return ret;
+}
+
 static int qcom_pcie_link_transition_count(struct seq_file *s, void *data)
 {
 	struct qcom_pcie *pcie = (struct qcom_pcie *)dev_get_drvdata(s->private);
@@ -1559,11 +1647,24 @@ static irqreturn_t qcom_pcie_global_irq_thread(int irq, void *data)
 	struct qcom_pcie *pcie = data;
 	struct dw_pcie_rp *pp = &pcie->pci->pp;
 	struct device *dev = pcie->pci->dev;
-	u32 status = readl_relaxed(pcie->parf + PARF_INT_ALL_STATUS);
+	struct pci_dev *port;
+	unsigned long status = readl_relaxed(pcie->parf + PARF_INT_ALL_STATUS);
 
 	writel_relaxed(status, pcie->parf + PARF_INT_ALL_CLEAR);
 
-	if (FIELD_GET(PARF_INT_ALL_LINK_UP, status)) {
+	/*
+	 * It is possible that both Link Up and Link Down events might have
+	 * happended. So always handle Link Down first.
+	 */
+	if (test_and_clear_bit(INT_ALL_LINK_DOWN, &status)) {
+		dev_dbg(dev, "Received Link down event\n");
+		for_each_pci_bridge(port, pp->bridge->bus) {
+			if (pci_pcie_type(port) == PCI_EXP_TYPE_ROOT_PORT)
+				pci_host_handle_link_down(port);
+		}
+	}
+
+	if (test_and_clear_bit(INT_ALL_LINK_UP, &status)) {
 		dev_dbg(dev, "Received Link up event. Starting enumeration!\n");
 		/* Rescan the bus to enumerate endpoint devices */
 		pci_lock_rescan_remove();
@@ -1571,11 +1672,12 @@ static irqreturn_t qcom_pcie_global_irq_thread(int irq, void *data)
 		pci_unlock_rescan_remove();
 
 		qcom_pcie_icc_opp_update(pcie);
-	} else {
-		dev_WARN_ONCE(dev, 1, "Received unknown event. INT_STATUS: 0x%08x\n",
-			      status);
 	}
 
+	if (status)
+		dev_WARN_ONCE(dev, 1, "Received unknown event. INT_STATUS: 0x%08x\n",
+			      (u32) status);
+
 	return IRQ_HANDLED;
 }
 
@@ -1732,8 +1834,10 @@ static int qcom_pcie_probe(struct platform_device *pdev)
 			goto err_host_deinit;
 		}
 
-		writel_relaxed(PARF_INT_ALL_LINK_UP | PARF_INT_MSI_DEV_0_7,
-			       pcie->parf + PARF_INT_ALL_MASK);
+		writel_relaxed(PARF_INT_ALL_LINK_UP | PARF_INT_ALL_LINK_DOWN |
+			       PARF_INT_MSI_DEV_0_7, pcie->parf + PARF_INT_ALL_MASK);
+
+		pcie->global_irq = irq;
 	}
 
 	qcom_pcie_icc_opp_update(pcie);

-- 
2.45.2


