Return-Path: <linuxppc-dev+bounces-10247-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F774B055D3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jul 2025 11:05:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bhCvw0X1Xz3c6q;
	Tue, 15 Jul 2025 19:05:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752567334;
	cv=none; b=QWiTDww0TsZk0PafP5J+lLRBna+tD29Sg6v3tAduJYC6ivnoobuTJ26vhyuA3mlcSgh8d8IjoMY6o4HYAnnzmhiSHEj+KyvqKUrdTxhdfCAFo9YlzhnPRVFjHA/3K6WuUyYuCr9biTrNxNfpDz3V9Ja06tMkxILCE9q1z6i81a+dI8Ma43i0HQt1xSJqxOOUtg+4AopL2pojTOEW0TO62mbYr7y5FHyo8PXEV+/N1/FCXOO6UmbcmQ0Lq9bgjuVZX+igYHG0d/U1iw7BVcy0Vt950cvLuztiTfeMV99siL6h9KB4Ctj+UeUv6xRwWC2Yim5L4EP7geMJGDwbmK9nVA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752567334; c=relaxed/relaxed;
	bh=29osqCa8Dk0skNiIogmNa+iuqm6tKwJ5AW+ZWWEuekQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SiQ0ZvZlH/jCQdrhcvn1pF7QuqjAKwTcFdgfvr0OdCHvDQzY8TY5ldUz2vQJcjxStCJoEI9NKZvW9RAANDgBhxIqOKDvN4lD/ZvhmZBXnmPpj0+U0qlB3bCgO1AC/iJaL2t1aOxSgo/0SiKDRL8L4ZM0FCqLtIfoDoPH/kPRjAG0uP9dNc0CXhYID68IAnbS+Ie4Mxw2YhIlOdbZ9I9OnQyN+LbfGBzfePKFnf08ZMDqs5KMhfSzyf7Ileqq7yhpG/mhT1MEwxJqMk3aNSZ1cjsk004ce5va4981GxMuRzhOCZSctamNW4KJQDqVSo4SEyc/cVKCVS6HfO5sqYEruw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bWmZGFIF; dkim-atps=neutral; spf=pass (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=manivannan.sadhasivam@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bWmZGFIF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=manivannan.sadhasivam@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bhBnx28JBz2yZS
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jul 2025 18:15:32 +1000 (AEST)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56F5YgNt015971
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jul 2025 08:00:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	29osqCa8Dk0skNiIogmNa+iuqm6tKwJ5AW+ZWWEuekQ=; b=bWmZGFIFA6nB798K
	UoTaUZCPWOYAAIUoBB1pOdT8mI/IKXyCaq13eStFS/YSvJTfa6a4s9FuSMlxdlqc
	xSh/iFWmIzOLfk0kApSSy7BXPIjzOe2/Un3Si/McSi7l08zDwq6P1+6NvaSwKImo
	aFe1kFMwk4OiFN4EctFIxeXi9pSMMIxyXv/qt98xSeR+xZTuP9TNdhHmG9fQbazw
	tT8C96bPmUdB7HHnfXbFtS48AIwiKjmIPj03yMRwrWQHmXcpsi4iT0bhDBvyMvwK
	hp1xoYtQghsLpKqWsTtDYN8MNcotEuopEztMWKs8lflqBco1J0KQUvGiEeXqquc+
	DBSItw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufxaycws-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jul 2025 08:00:19 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ab5d2f4f29so41903001cf.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jul 2025 01:00:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752566418; x=1753171218;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=29osqCa8Dk0skNiIogmNa+iuqm6tKwJ5AW+ZWWEuekQ=;
        b=qnegh8F4l3fqrpVZeRFxmCW0slTNoLY9FWdOqzWRedtW3lbEURtnTK4G6EFFpI8cLA
         TWQQBjVEuNtJmGewi2JnNI2YCMScxLmIY5xBuFwLV4pBLKg1JBx9JnUU7j/c1IFQsYS7
         FEeBmTE+/S8oJue6qt+ETqV9WRb1cgCpuD/6JaJQ8LMG7rXjqsfDgezsfba10BF+cdbU
         j1Mj9OL+sWIhVZ9ffNfsxdTDVpYyysVtg/Ppvip1dAdmmnJoW+8EJRWQY76wbbrrCy/s
         q7g9Cu0Bw69cQ2tNTqzCF0SupziKh4gJhUP7rKC94mKaqUteYRL5tLGR0puu/6xRt6g7
         rvww==
X-Forwarded-Encrypted: i=1; AJvYcCUjOJBsOYkzof/GniqQItdTWpMDkoT2aVD7BHPeZi+1208Lrw77E6Rq7Rk4/ThEGGh3e57/VTdt/lEGS9E=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzLcRnmYrC0emE5w6tJUgeoqtfb5psqzvkCp1vB/OtYFMG+s8cP
	kHfOqUgw47SO26BG8mhvZD3G5L0RVQk5EkZfXQM+oec2ZvYL9y6+sGTMNwn0eNWUAnF9AlWQcGD
	Yx097bWOo5pbxEpOqGjaZxKVbgj/4BSUfDXZLTqQs49uKenohgSASviOEujH9jZvwLZ39
X-Gm-Gg: ASbGnctovpSrN8/BnO8R+oFApbjxuy+J2fgx+mfBLmmDyuNCj+p70SnuZbrw3BD800a
	wYRKx77ytCaHseHdwDMbYA0rnUhcFiOvBTpsfNVMS5iz508hrZOflolO3nGUtwFgOlx2G633fPn
	BGLI+a9IYBRBsj7cqPgy53SUoKohgMFZOf2gFrG1KikNA+5kyKwL+YyVNIPpH7+pUpE3CGnE1gX
	Ajb3sFXvfrpBdEWauPAKPpC3CvWo7IRsPNQwQG5jq6kKVMgGTgda2SkKqhcHui0zIHO1DPM2USC
	0kEBC6wh/uCYX72tDVqZuviV2X/HEMdD1DtpZYOFTQUTyeSMwqciRihhS5ot1jTB7mscEA==
X-Received: by 2002:a05:622a:18a4:b0:4ab:5f47:da5b with SMTP id d75a77b69052e-4ab5f47de9cmr131465811cf.8.1752566417905;
        Tue, 15 Jul 2025 01:00:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEzxAuZjlIsaIQYm8rUmtgg6lfPzyFqgOdBUY48IJRWVOd/+6pHo+ureD7f0u+Ea8Kb36AIOg==
X-Received: by 2002:a05:622a:18a4:b0:4ab:5f47:da5b with SMTP id d75a77b69052e-4ab5f47de9cmr131465031cf.8.1752566417355;
        Tue, 15 Jul 2025 01:00:17 -0700 (PDT)
Received: from [192.168.1.17] ([120.60.140.219])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ab3f1c9a2csm37792461cf.67.2025.07.15.01.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 01:00:16 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Date: Tue, 15 Jul 2025 13:29:18 +0530
Subject: [PATCH v5 1/4] PCI/ERR: Add support for resetting the Root Ports
 in a platform specific way
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
Message-Id: <20250715-pci-port-reset-v5-1-26a5d278db40@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2880;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=r0nAnKYpMV4ShS/A4tyT1tuVoZHwLxeeuNZjL60OQmQ=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBodgqBv1NxanE9ktG92zwVOS86zmTwrgRknu0BG
 EdgynZglOeJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaHYKgQAKCRBVnxHm/pHO
 9eGbB/9qWuKdG71Bkc05mHOvA3YhLiqRtMkImAXOhrGbspJBs2gazpPTUmbvvZugat5RiXiSKLl
 VnsanmUx9+DFNfHa/SpLum7wxWPkU3VMkcPHjLFBjRAMmGNrmfozcQBaQdfaI3zRwFG8YE1knma
 SoN8FMSVwaUXywfXWqQl8BC1zp1KjE1L/4Qcw1WdgOjylOYbCwYA863NFMBmoD72Spc8MCNVcQT
 H4c0QyA2IHkKCDLAB4Jgow/7A63z10vHSeCM4EwUwpGUU7gMHTJSjSZPLsBrP83G/8sA3qxt3m7
 wGzCBJF/tOljFQFAZpwnRRToBRyLWeULjVeiU54/GsfAvg+T
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Proofpoint-GUID: x5f-kJVRVhDxhZ7f5r2cRV2XqUiU8m8Z
X-Proofpoint-ORIG-GUID: x5f-kJVRVhDxhZ7f5r2cRV2XqUiU8m8Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDA3MiBTYWx0ZWRfX9UkPrRrHNpNr
 plQCUxajtLq5f2mCezqAPOvlj64X7rzniT3lbNdNlrgosQm3aBWzvyRZyfuPcXMEoxL5Df2pmkJ
 6OCKLC9+ST9nueKZReM9mKMwiJGyDDQkCa5GGKdnqkYoKLu2IyH3DSGBfocR1ZesqUgq+Kmrn2s
 eeYuFfQaXvX9ypebq3TilQ3lvprUeEeHc7M01X6QKENv6y7zsSrcK86Qkia6n2JJUT4cm9QGSzr
 uqR0fhPR8RCZ3j0vP1p1pSkngFG/DUldmAPCi7FR2DIHizjVj1HK88/Xx9tmRz9Vj5MjU0XHzcj
 2akCKCtjYbBf0HKyWRD5WZfxSL/c9GzV2WhzVdgiRSRZxaVOu/3//wLhtXuzAn4y4PbekYnxhOk
 8PZEMYHddpNkWqronQwwhPEcTWrkaHrvGUplH5PX/qOmV5odWgEZtYhPjLqPTwalNMArHZCp
X-Authority-Analysis: v=2.4 cv=Xc2JzJ55 c=1 sm=1 tr=0 ts=68760a93 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=HOswsyiB/7FCIMMjk980kA==:17
 a=lJ8DZ0MjVbnDIa4D:21 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=OSb3l-ukYRaLxMRXSjIA:9
 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_03,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 priorityscore=1501 adultscore=0 mlxlogscore=999
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1011 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507150072
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Manivannan Sadhasivam <mani@kernel.org>

Some host bridge devices require resetting the Root Ports in a platform
specific way to recover them from error conditions such as Fatal AER
errors, Link Down etc... So introduce pci_host_bridge::reset_root_port
callback and call it from pcibios_reset_secondary_bus() if available.

The 'reset_root_port' callback is responsible for resetting the given Root
Port referenced by the 'pci_dev' pointer in a platform specific way and
bring it back to the working state if possible. If any error occurs during
the reset operation, relevant errno should be returned.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 drivers/pci/pci.c      | 12 ++++++++++++
 drivers/pci/pcie/err.c |  5 -----
 include/linux/pci.h    |  1 +
 3 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index e9448d55113bdfd2263d8e2f6b3ec802f56b712e..82c56fbd58ca4aaafac4f1638e7e0225c07958cb 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -4964,7 +4964,19 @@ void pci_reset_secondary_bus(struct pci_dev *dev)
 
 void __weak pcibios_reset_secondary_bus(struct pci_dev *dev)
 {
+	struct pci_host_bridge *host = pci_find_host_bridge(dev->bus);
+	int ret;
+
+	if (host->reset_root_port) {
+		ret = host->reset_root_port(host, dev);
+		if (ret)
+			pci_err(dev, "Failed to reset Root Port: %d\n", ret);
+
+		return;
+	}
+
 	pci_reset_secondary_bus(dev);
+
 }
 
 /**
diff --git a/drivers/pci/pcie/err.c b/drivers/pci/pcie/err.c
index de6381c690f5c21f00021cdc7bde8d93a5c7db52..b834fc0d705938540d3d7d3d8739770c09fe7cf1 100644
--- a/drivers/pci/pcie/err.c
+++ b/drivers/pci/pcie/err.c
@@ -234,11 +234,6 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
 	}
 
 	if (status == PCI_ERS_RESULT_NEED_RESET) {
-		/*
-		 * TODO: Should call platform-specific
-		 * functions to reset slot before calling
-		 * drivers' slot_reset callbacks?
-		 */
 		status = PCI_ERS_RESULT_RECOVERED;
 		pci_dbg(bridge, "broadcast slot_reset message\n");
 		pci_walk_bridge(bridge, report_slot_reset, &status);
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 05e68f35f39238f8b9ce08df97b384d1c1e89bbe..e7c118a961910a307ec365f17b8fe4f2585267e8 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -599,6 +599,7 @@ struct pci_host_bridge {
 	void (*release_fn)(struct pci_host_bridge *);
 	int (*enable_device)(struct pci_host_bridge *bridge, struct pci_dev *dev);
 	void (*disable_device)(struct pci_host_bridge *bridge, struct pci_dev *dev);
+	int (*reset_root_port)(struct pci_host_bridge *bridge, struct pci_dev *dev);
 	void		*release_data;
 	unsigned int	ignore_reset_delay:1;	/* For entire hierarchy */
 	unsigned int	no_ext_tags:1;		/* No Extended Tags */

-- 
2.45.2


