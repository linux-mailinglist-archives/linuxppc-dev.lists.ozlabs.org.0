Return-Path: <linuxppc-dev+bounces-10246-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 67218B055D0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jul 2025 11:05:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bhCvl0sSzz3c5q;
	Tue, 15 Jul 2025 19:05:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752567213;
	cv=none; b=FlrIrNg3xmY0wskDov6EXxsLC0xjdjFpBlSiH7+Vrbm209C41xJkRx1L3kdKuuailsJxhCg3tzwZ6FGegw+rw74gRGV6mYR0n06PB9xqfDGDTMSKsAs8VA+nO50pJ9SvEy8JJAYMFWrjI9xwgkc7J2+HOEvP0nIiGnxPiKjbgBPPGXY+WTUKfwDeyh3DC6whsAceWKTpp/Y+CEra3whiQDaN0UEaIYmyI0NmfYiVkDuiKspw8Fmr8Q8tx798J1jhNKnLxB7NpfPIo/ASxj43ndeC/6/12H6o7frXaRvEYpipHID3bc8kQc1KYV1/VlLQTMh2qLDERhmNbnA4dbHG3g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752567213; c=relaxed/relaxed;
	bh=6GJz2i62juPlOyegqHrF3OvjXVoMZ+oRnuJpYKATWxs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZpCg0Un2xyOuKmrx+lcvqZKdJMK96EUq0oHXTSAuseMZ5fYrVASvRPuToc6Y7ypVkpJKS+FzJ+3vFYW30VnFXfpjLEKlomCfzTE4FuYaJiiD+c1wc2XC+aJZ39t/RATst9C4jDWkuPEKeS/Y4+KmUOY4Lvzp4M6pwKiIyqSAlebBVS2RyoBrILB/kxdY4hqDaYYYR1jVqdg2T/fodiUd0kuDF5JCHtAi9rYYFXBSv6GWBwtoMvkc/8sRWf5K8o1xQPsDzEnQUfL0NoN3cczhxp1VUU7NAg1wUV0NysjQNPzjAN2/aORjJ1a9H+rlJdRQn6MhRM0Q/Y0quyvPAsWang==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lidSIJqu; dkim-atps=neutral; spf=pass (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=manivannan.sadhasivam@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lidSIJqu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=manivannan.sadhasivam@oss.qualcomm.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 787 seconds by postgrey-1.37 at boromir; Tue, 15 Jul 2025 18:13:31 AEST
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bhBlb5H79z3c3x
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jul 2025 18:13:31 +1000 (AEST)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56EKpVu2006695
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jul 2025 08:00:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6GJz2i62juPlOyegqHrF3O
	vjXVoMZ+oRnuJpYKATWxs=; b=lidSIJquc1KSKJZMCNQdU9rsDZ+ozrxfqT6zlT
	AVs4GKmm3UWz+RhjDreJgGWdyQ/ia6ucP1mXJ/pTm+f3MKuuheD2e/IH4x7LeJrT
	kF33ucan0rMDJYONdb4SaHISi8BPIr7EU5f31B9XD80uhTYcaak0t3exfMbL94Hp
	P5vA7YMnvEbDA967+WmwPRjqpvuiaekygsOU8qgxDyxjsvq9NPCh5+5wJsSo1iSm
	XSTsZkuKKMwvDd4Bbo8B4gaAtXRyk+HcnzMasRNUtD2BuN4iaLkALvMwusyGucmK
	PPe6jyBC5rb1no204Hl2COEh1NNV4X4qpruYWs3tSbXWO32Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufu879wg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jul 2025 08:00:22 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ab3c757b2bso67259081cf.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jul 2025 01:00:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752566410; x=1753171210;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6GJz2i62juPlOyegqHrF3OvjXVoMZ+oRnuJpYKATWxs=;
        b=aUQEqViFEKjHniurj4tA4oqzMXVrP4ZDXh8wQKvtsj3u/tsXO15u+q0gWIYHoFf1dI
         7aPhvufMT/Jvajd2M5KqJNzku09CrX4unXQUqGP/WJ1eolxf0tNwKYK3Gotuzv3h/m+9
         42WIpJotcQUw9vfSQ1xjLPcjVlXrHppgX3u8igJsediMhKM5UcRo6FDmoCcYZo300TMy
         dERWWnx+j6Nb3qg+8w+6Ya1CR+XyQv9pY90cW0ze3vhEZf9rARBXaR/AOj6k98OfpTXP
         IYkBBSfN5EV0KyOu5inWlMNEINEskgIYhEvoWrCRLMkgk48/t9ahglT/rWVpUgxK8Sxk
         jXyg==
X-Forwarded-Encrypted: i=1; AJvYcCUg3Aa3UBtibYQ0qlTuUqqbZJ+5/I5JybGTmjdEcUdWs1XzHFAoKWU68hhYVZaNYVUa8KmUCGm6KOfmamE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzyBe2pQlqlgxcMvuO2rLZVdAgEAwVOUkD7FuahYNH4/L4fI3o6
	f+5uRctCuH5iFazZ0ju1bjlzjqFZ30hk6OteQzgz4M6Pn8v+eFs6vr3viHT09Efw2CDhtWY4aHl
	shUEDIdcw/BB5sBzevI+rUIlHsRSjiizTA9QbBTWGeRHFtYajCJjKL2/FjDnpE+HP4z9Y
X-Gm-Gg: ASbGncvCNv8LtZYnIOiRGGWfE/N/QVf8Z+mk8n8yhaB3b6zR9W3xOtjRwENrDUnDGO8
	afaBryY7UKlpgDn5wZsoa3CLzfoV/ZozBbBsPm/ThPPexScAZ6KyJBVpEEsceOIG0/LMz4wTc6v
	4NGx9bbxIl1VuL6mX+l+pzCAevosKMrqR78wQsqZkweAFBaxVZG2O9tzAhPGWt6pNcD2dv5On+p
	L8Z01jjG38N3SPLN8qvah2a6NALSwC3jkgjZ2PArGDoZ23EdMFKi7SAUQkMbQ6Bp/Rkgo5qzNE8
	80ncGkooijESErpVol2QpYUwtD+K8GEVYBE1PCH2Z8NZQ80QNSV9FZwobYbNNT1YOALBsg==
X-Received: by 2002:a05:622a:5a05:b0:4ab:5d87:91e8 with SMTP id d75a77b69052e-4ab825ac736mr25858551cf.31.1752566410160;
        Tue, 15 Jul 2025 01:00:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGodpYpCiKK+ig7+dAeyUiedid2AqDR6o8ee2iwMToEcOyeNts5u5xULe5KHTQAZiadcwUvmA==
X-Received: by 2002:a05:622a:5a05:b0:4ab:5d87:91e8 with SMTP id d75a77b69052e-4ab825ac736mr25858021cf.31.1752566409650;
        Tue, 15 Jul 2025 01:00:09 -0700 (PDT)
Received: from [192.168.1.17] ([120.60.140.219])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ab3f1c9a2csm37792461cf.67.2025.07.15.01.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 01:00:08 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: [PATCH v5 0/4] PCI: Add support for resetting the Root Ports in a
 platform specific way
Date: Tue, 15 Jul 2025 13:29:17 +0530
Message-Id: <20250715-pci-port-reset-v5-0-26a5d278db40@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAFUKdmgC/x3MMQqAMAxA0atIZgNtNRS9ijiIRs3SllREkN7d4
 viG/1/IrMIZxuYF5VuyxFBBbQPruYSDUbZqcMaR8ZYwrYIp6oXKmS/st4HsQN5Y10GNkvIuzz+
 c5lI+rsDLXGAAAAA=
X-Change-ID: 20250715-pci-port-reset-4d9519570123
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4400;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=8xT/TVIi8Lf5TLxzo4hzS0yvnnm7uBaiufG5Ui34iHA=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBodgqBRV9d193TvHdNlr2jxjHR5Q3V0is3e91iw
 OJ1a7jKZjiJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaHYKgQAKCRBVnxHm/pHO
 9Yu+B/4tQUVXiGfLVVZt4fAu/lYZmbtEfihDCXylY8XG/vbIBFfj6dhfaYWumgXGPGzRmnadOBW
 AjSCgaX9ZUU5+zhZI4QJTKeYjpQd0wUjXP420GLdSfoQ5o3u5/HprNyr+mG1R5XqhXJql2TKYoG
 otgfNjPLgJZRYCdQnmCHatx9vnKIi5IgdclRY2D++0J2UQxUgfjsJaNemfKB/qUvavyrtUdpyoM
 VB31LN9WMW7lIYy7SIu5saoxRxxh9B7vtTdB51HMlw1NvMA1P1N5UqSPwLxrlhKqaoow/D+2VcN
 pFbvCFrRU+PAoun5tqY3HLgLY9U/DQx6VFKlJxS+VxHElnKC
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDA3MiBTYWx0ZWRfX7ViqAy6Tpjav
 SPp7JkOikC3eYVA7yIYrny1VxSWFI4LlYL160A/qXn3O2P6Fb6bUMfKL6AmHmvdYwWxLSpi64lq
 XjXtK6h2aescLKCXk5aRKWkb++OI2qpxPv1tTsPHHGnR95iz+BHjrC5k8XK2TMb0IhTaTb8wJVe
 JjmcPuTqugbV+TsPQVFGzMLEdIaLydlr4a/MSar+YWeyYL7xmsrvn9QUvITuyMS3R31SVc6QgiI
 i6HxIedqHkUFkThaiYnMX2OXv+psxMA9dt3Cys3gbJtkoL/Cil3pr96I/ZINawfKm19cymKqB5Q
 rDN93Uo8oZeqJir9cCPr4qW7Nq5DpQvpLBDQ+YmIlWcQfoOHIin6nEYC4JpMu+zDq5F29HR5cdO
 nNhExqdgvfSxHuw1gOHruOJj10gNwt+fdY3wPKAR68lVS+5dJaeVKC6+BYQiejaGnSttm9d7
X-Proofpoint-ORIG-GUID: c1RtutWoNuq4z80qaNz-pNbIVego18vB
X-Proofpoint-GUID: c1RtutWoNuq4z80qaNz-pNbIVego18vB
X-Authority-Analysis: v=2.4 cv=f59IBPyM c=1 sm=1 tr=0 ts=68760a96 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=HOswsyiB/7FCIMMjk980kA==:17
 a=lJ8DZ0MjVbnDIa4D:21 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=pah7fRnKCyhbKptB6fkA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_03,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 lowpriorityscore=0 malwarescore=0 spamscore=0 mlxscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507150072
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi,

Currently, in the event of AER/DPC, PCI core will try to reset the slot (Root
Port) and its subordinate devices by invoking bridge control reset and FLR. But
in some cases like AER Fatal error, it might be necessary to reset the Root
Ports using the PCI host bridge drivers in a platform specific way (as indicated
by the TODO in the pcie_do_recovery() function in drivers/pci/pcie/err.c).
Otherwise, the PCI link won't be recovered successfully.

So this series adds a new callback 'pci_host_bridge::reset_root_port' for the
host bridge drivers to reset the Root Port when a fatal error happens.

Also, this series allows the host bridge drivers to handle PCI link down event
by resetting the Root Ports and recovering the bus. This is accomplished by the
help of the new 'pci_host_handle_link_down()' API. Host bridge drivers are
expected to call this API (preferrably from a threaded IRQ handler) with
relevant Root Port 'pci_dev' when a link down event is detected for the port.
The API will reuse the pcie_do_recovery() function to recover the link if AER
support is enabled, otherwise it will directly call the reset_root_port()
callback of the host bridge driver (if exists).

For reference, I've modified the pcie-qcom driver to call
pci_host_handle_link_down() API with Root Port 'pci_dev' after receiving the
LINK_DOWN global_irq event and populated 'pci_host_bridge::reset_root_port()'
callback to reset the Root Port. Since the Qcom PCIe controllers support only
a single Root Port (slot) per controller instance, the API is going to be
invoked only once. For multi Root Port controllers, the controller driver is
expected to detect the Root Port that received the link down event and call
the pci_host_handle_link_down() API with 'pci_dev' of that Root Port.

Testing
-------

I've lost access to my test setup now. So Krishna (Cced) will help with testing
on the Qcom platform and Wilfred or Niklas should be able to test it on Rockchip
platform. For the moment, this series is compile tested only.

Changes in v5:
* Reworked the pci_host_handle_link_down() to accept Root Port instead of
  resetting all Root Ports in the event of link down.
* Renamed 'reset_slot' to 'reset_root_port' to avoid confusion as both terms
  were used interchangibly and the series is intended to reset Root Port only.
* Added the Rockchip driver change to this series.
* Dropped the applied patches and review/tested tags due to rework.
* Rebased on top of v6.16-rc1.

Changes in v4:
- Handled link down first in the irq handler
- Updated ICC & OPP bandwidth after link up in reset_slot() callback
- Link to v3: https://lore.kernel.org/r/20250417-pcie-reset-slot-v3-0-59a10811c962@linaro.org

Changes in v3:
- Made the pci-host-common driver as a common library for host controller
  drivers
- Moved the reset slot code to pci-host-common library
- Link to v2: https://lore.kernel.org/r/20250416-pcie-reset-slot-v2-0-efe76b278c10@linaro.org

Changes in v2:
- Moved calling reset_slot() callback from pcie_do_recovery() to pcibios_reset_secondary_bus()
- Link to v1: https://lore.kernel.org/r/20250404-pcie-reset-slot-v1-0-98952918bf90@linaro.org

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
Manivannan Sadhasivam (3):
      PCI/ERR: Add support for resetting the Root Ports in a platform specific way
      PCI: host-common: Add link down handling for Root Ports
      PCI: qcom: Add support for resetting the Root Port due to link down event

Wilfred Mallawa (1):
      PCI: dw-rockchip: Add support to reset Root Port upon link down event

 drivers/pci/controller/dwc/Kconfig            |   2 +
 drivers/pci/controller/dwc/pcie-dw-rockchip.c |  91 ++++++++++++++++++-
 drivers/pci/controller/dwc/pcie-qcom.c        | 120 ++++++++++++++++++++++++--
 drivers/pci/controller/pci-host-common.c      |  33 +++++++
 drivers/pci/controller/pci-host-common.h      |   1 +
 drivers/pci/pci.c                             |  13 +++
 drivers/pci/pcie/err.c                        |   6 +-
 include/linux/pci.h                           |   1 +
 8 files changed, 252 insertions(+), 15 deletions(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250715-pci-port-reset-4d9519570123

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>


