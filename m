Return-Path: <linuxppc-dev+bounces-15169-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C54CEF61E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 02 Jan 2026 22:55:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4djcvW3Kvbz2xHt;
	Sat, 03 Jan 2026 08:55:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767358151;
	cv=none; b=XW59/nG2gHhHjdhiSRDy2im1mWbzH+bvethw+FgupmQlCgtnKjwaKSVdWPy5/cCiuFYnaWFAIVEahCZrgUHww7WADbnj0NVE+qLeUYwsgXo4bZNY9gvqqUmpBhxMduZIUIm37duLAanTfNsu73No89XnqIMRqcri9vEEjMbwsFLrRpn2KUfQqTy9ijJO36ej8a7434MjXRwtCW91izBFNiGVpOeDv1AI+DqXubUq+Yc9rZ6jrYtqy7ztFW3y5mvkEffY4AxIucaPRwGqfY6tr7CcZhwWURk8uOKiY1oDjwrn2E3dZZ4N/GLHFvaGEemZ8AUM1U/rA7HfdZ+OibFgHw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767358151; c=relaxed/relaxed;
	bh=0wfWJirMhWJX42Yu/+htNC9US6ZKbNc21fiMHrEP+Vs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IPb8+vv1a9w9OP/YhPs3UyqlFHzwcisYZGIFcDqYdzlN3s82uLmiZ8fVCZtPK4Bxm8jVvAxw6pv8HF/nOmMezXDHNVa4Sq8xNPvTyuBTdKEojaSBs9pyN76YvjvkJBJbY9gbsvdrz0iL/bry4sb3c3VOfC+a65rPiVKBlhvBYBcqtTkrv0GqOnmGwe/esF2W0Ip+wTWGIbb5O+tv+4The1mVM79SAtfnfgBXtpvWZPnXhqdmfB20NgwWbaCOdMLyowVqRKSyDv1jaFL8kbE28KRGig1TWWI3ZxO01MsK3vhWHDsA/HSKAxFZ9N0f9rHCenwCPA3QFOkGhlcOfqo2PQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aKjlJvH3; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B+9Izkp/; dkim-atps=neutral; spf=pass (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aKjlJvH3;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B+9Izkp/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4djNmk3RN5z2xTh
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Jan 2026 23:49:09 +1100 (AEDT)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029VwC2504476
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 2 Jan 2026 12:49:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=0wfWJirMhWJX42Yu/+htNC9US6ZKbNc21fi
	MHrEP+Vs=; b=aKjlJvH3CvMqWTQEol6Gf8rcqFc67Z9yisxLucZeHO/fmxOu4eS
	63FjNh07bHkvdi5aQniiUVELe1iQALOjRGztqLBITBzYHLrIoSbo44nF5s02vImq
	mof0LkyILVTROHF1NQgZG4ezsYOYQYdqkrb/NkW7fM5mZAA3OChgUxXwJD+WoRMF
	u25K94F/ITjGyE6LV9wHxwXH/foZabaqSy0Dtwm+CvJWAn1RI3KlUMtzWRYpfgwE
	1dJ77+VdnTBq+dq+vv48bBHB6gDnq+NYiX1oUaUNGgOEvaZdCO9a7GNG18drc8xe
	AhNkcJ+XkyQbJn1MFZ9ZnYNCIwFF/VRilGA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4be8bk8qgk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Jan 2026 12:49:07 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee1b7293e7so453107791cf.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Jan 2026 04:49:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767358146; x=1767962946; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0wfWJirMhWJX42Yu/+htNC9US6ZKbNc21fiMHrEP+Vs=;
        b=B+9Izkp/a1GOrV6r2Zwu89nZOR06vq9ZJltizybb1elqN8bFB6zcAJpLHpAnQF6AVZ
         LCM3N9GP7berHdLA6aPqa7Ep9IT8Jm6UdW6py+EZrvpiZsHkxC4RMl0vjD3FKyCTEYeI
         EIkjhsMsnu3iSYcfbOiMwMvVnp0I7Gs+l8kSxEsJG4EkuiIpkId6XbutsspjKKGO89A8
         C71z1qEGO1c9baqWgVd5caIVwjMXJ3iCkO3ztUL32sUttPdd1lF3tOr3Do6Ag0bbvuMW
         zmQrvbXbYwoastHQfRdlwqM0t7hyEhthOOr534d78hWLsCeyVWfZ9zVfUhV2IXa/HSII
         J1nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767358146; x=1767962946;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0wfWJirMhWJX42Yu/+htNC9US6ZKbNc21fiMHrEP+Vs=;
        b=ceT4Aq/i5KtUXaGZNFugGRsTCY8NalUNVJ5Nclc7qRccLDeG2notIaMYs8FbhTGttm
         oq5NdPfv/V51l0BhTn9Z+9koaPOzux3G+hKBbf+lszothnQywlei/QDFIcFfSOpE5/BY
         xfJvtozUKclYCa1Zb3aq3QbcLh+sU+sjfcxztP7ER6Psa6f6iwkx+2fouLME0tVlvvUi
         xwrlkzd6RWTw2eYmAz4EAG4oS4nudHLloC7qsbvWQ564zbBiyuRYcn0BNm13P3jdyl4K
         OqXoUzHN4L9d37JjNjAXkn6+JiTFC/gYnFhq+WsSOyi0Bl4Vksyws15YdI18aanwGYFE
         VuTg==
X-Forwarded-Encrypted: i=1; AJvYcCX7UsevPH3rtGPi2gTjV3YHTRI+KmZovLs5Ee+n5QgjKAtecpA0a69XJl8OoMVbxcrT47/khsY6YYC1ikU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwzqhDsA/OzwP1zi7mihGbp/zajS2ANyf9ydbWsZiomkTSLyF7z
	e0bHX6Cr6baqP6UhB+yJUIrXRMmFrlO8E6McTHNxbRMvjw1Xsxb55TToGrHg/BGUia6ZFjnAbY+
	/wYIyMGeQdFY1nQn7nh8eV4K9m4yeWAA3RT5KpIpOu6k6Y6xH00DDNvV+j45PktMQ9dVW
X-Gm-Gg: AY/fxX5aM+Q4WedDgdBElh0C8DGZQ0x05EM/JOk8hYfnxV8BkvNS7girdWnUfGQpemv
	nxANsO+sBfXrkOGHqFvMNrkwX/a8rjVqKWxnpu1mzkKEuOXdINDpIhcAujCBMVofcRoyL3xaCcf
	Rnp5IvgGV30Hx0HuroJCSBCQhTZRgqLs0zPH9Gj0L5CjfV+UcVkRrppZmm1H0wTgupGLP1fFV6D
	Qcv910j0IRpbM6BSrXS9oypsDfABJ9ABHIiBNRQT9M8+eriFo7/qupqqT4aBq+1R7lr+DYD7ECR
	jMTn1lZyCbCBVjTibz5OvZNfnas9JfZmm3PQVVOL+s41nzjw6TLPB+4J9zc8VNekxVDUwO4SxGM
	UpEaMOkCAG72p2nnr7rVAX4bFrQ==
X-Received: by 2002:ac8:5781:0:b0:4f1:b7a8:679c with SMTP id d75a77b69052e-4f4abd9e68cmr649277221cf.63.1767358146576;
        Fri, 02 Jan 2026 04:49:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGEbV5vWoAdJFjT40fh9m7OPDlEL8i6bYC8PZP+0GOYhR/fbRhbEkDnsbVfPIfQHknfCM/BZA==
X-Received: by 2002:ac8:5781:0:b0:4f1:b7a8:679c with SMTP id d75a77b69052e-4f4abd9e68cmr649277031cf.63.1767358146192;
        Fri, 02 Jan 2026 04:49:06 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa46c0sm84804526f8f.34.2026.01.02.04.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 04:49:05 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Tyrel Datwyler <tyreld@linux.ibm.com>, linux-pci@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/3] PCI: mvebu: Simplify with scoped for each OF child loop
Date: Fri,  2 Jan 2026 13:49:01 +0100
Message-ID: <20260102124900.64528-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1596; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=mJwqXFaTtAuCHQy2FvWbBjeBAAII8gsU4tM0L71n+OA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpV768w+9m0LylLR2oOecaNnHLaCLt8MzrFPJiF
 g4VrzeYvquJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVe+vAAKCRDBN2bmhouD
 1zafEACBlmhts5g2H8mb5E53KIC6QygvGQ04AnFOSCxB87xQPYgIrS/LwAV546fMLYetfx3a24m
 WpW3wy2tC2rkhs534KHv28oHdQBjgsO1goiYibvwbVojEHKnh7JDO+iGGM0HvmJNBhu0+2bHK8a
 1gKHZDRe8wDzDEPRaHuqE60BZVzDx73LP9Qhc8bHCF5bHsJBi8b2i2TmMVvOnThOAni+qbOj880
 +AtHOgRJsRIbbNtJve/h4YpQDf3PFfEoq3X/jMRK+2h/56jrdegcT7lOxWGogvoUZNgYWabwDM7
 d5WNJ3F11NfgAiSTfcoyBWXD8CiOBCLazxnk4aaeDN9JSd/6lEF8DsCaWPsjZTm+mwHKmsBA6Kx
 5vCrwYvNscWaeAwP58XoYDgVHBJbraCb352GxNvUGd7QeiYlmQKCkcbLRYSVhFox8sKM5adN04m
 vH2Chfn7oGEW1+CSnjuCSq20LbvEPZ3mBf+kjUUhhYkH+tlMvZ/xZyubNVShVgZERmNy/WkLwhX
 JP6UmdBsauAIg41Kl0Ul2DkShHP4q3P/03t6fwkzS3NOaux+diVe8MAoZWh+cw8T3kvhRBnduyh
 OhZFLmHp5V0m+BU/DrceWt3/eEhz7/Hs2y5CB/85mKAU7ThX/MgEhFwTi8zB97667nMLA4jTtqm Otj8IS7CICNtzGA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDExMyBTYWx0ZWRfXzigV09kGwr/W
 zrp7ji77vUCN9ae0rSKXfBH7IzeYMCfE/0v0mbWiBbm0DhG4j+JUoCXMH+/lHlzhnLCHwf+yPCK
 N1ON9V4RBwQ4Ucash6Jvsuby41i14uBZnMZQuDvi57v2x2Qtui9+H5Qp5Y8sSGxWwfwWQF/gd2M
 bmq7vVyoHaqAKzRIg+jxf4xb14qnBow4MgeCOYEvrL/lbl+68Z4wwLxXXKSZo5Z8okF1thEjGNo
 gFd6ENdtAgmNQiCEwrUg/NLxiKcNmgDeGJ+GQvK1x6nvOT5c5RnJLDdD+MnzT284q19UDH+4cXJ
 SJyIIm7XJo9EadhKMFjwSFEQnjquRkLXFQ/Ivu3Ghn6+5pBx+grp66R6o5v+frPqrazb2R53wMu
 PZK5mmcZZkNd51VUo9MPWME+qQAUq/EVdF7zpO7V2vLFZ4TSRgKqUoO4XyrS6VW2Mku1lBQv0Ug
 E1pshkew/BWEkjBZ0YA==
X-Proofpoint-ORIG-GUID: wp04KE-P6fXKRfaPpipdNblrCpsVkcdE
X-Authority-Analysis: v=2.4 cv=d5/4CBjE c=1 sm=1 tr=0 ts=6957bec3 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=r4sBWMy-QYfdzbUQJWcA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: wp04KE-P6fXKRfaPpipdNblrCpsVkcdE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601020113
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/pci/controller/pci-mvebu.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/controller/pci-mvebu.c b/drivers/pci/controller/pci-mvebu.c
index a72aa57591c0..4d3c97b62fe0 100644
--- a/drivers/pci/controller/pci-mvebu.c
+++ b/drivers/pci/controller/pci-mvebu.c
@@ -1452,7 +1452,6 @@ static int mvebu_pcie_probe(struct platform_device *pdev)
 	struct mvebu_pcie *pcie;
 	struct pci_host_bridge *bridge;
 	struct device_node *np = dev->of_node;
-	struct device_node *child;
 	int num, i, ret;
 
 	bridge = devm_pci_alloc_host_bridge(dev, sizeof(struct mvebu_pcie));
@@ -1474,16 +1473,14 @@ static int mvebu_pcie_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	i = 0;
-	for_each_available_child_of_node(np, child) {
+	for_each_available_child_of_node_scoped(np, child) {
 		struct mvebu_pcie_port *port = &pcie->ports[i];
 
 		ret = mvebu_pcie_parse_port(pcie, port, child);
-		if (ret < 0) {
-			of_node_put(child);
+		if (ret < 0)
 			return ret;
-		} else if (ret == 0) {
+		else if (ret == 0)
 			continue;
-		}
 
 		port->dn = child;
 		i++;
@@ -1493,6 +1490,7 @@ static int mvebu_pcie_probe(struct platform_device *pdev)
 	for (i = 0; i < pcie->nports; i++) {
 		struct mvebu_pcie_port *port = &pcie->ports[i];
 		int irq = port->intx_irq;
+		struct device_node *child;
 
 		child = port->dn;
 		if (!child)
-- 
2.51.0


