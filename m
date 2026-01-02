Return-Path: <linuxppc-dev+bounces-15171-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EB12DCEF624
	for <lists+linuxppc-dev@lfdr.de>; Fri, 02 Jan 2026 22:56:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4djcwC3jjQz2y6G;
	Sat, 03 Jan 2026 08:56:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767358153;
	cv=none; b=iTDLDG/hOMdVFOLWlLbp3sVti9c+T5boMZkttV8MRKjtS2gfKxGQYZakQ210MxO60b5F0Me6HiCFgmJwrWuvdLkE9W8I+K65FOrvDc78/7wrFuUSVupEq1tKurrA61H2Hn3FagJCUfBcMTbrhCnaf7RmfBhNTDGjghUHVKfyDYCAGAy6AgCDlaRiDlWMMeAXRt2rQmW4JjdggRRZji3sDB7d1kToNAE87JC18uazWmf0nS5R0r3GJd+8oFzj0NOFx756XSkne3hxx0zjFzfUqkkXMU6m6Mxw+yAclLv/RtBvyWszqOGzQN09Y9XukonFwbAs7r381tze2UqUXMKGMg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767358153; c=relaxed/relaxed;
	bh=QksCvkxz701havt6PNPEIVEdb5fJwkj5u5XA8V1I200=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EM1b/XaqZgGPec9L5+KHNqE18yDFt6rzpXsCtN6zntK7KnHKI3GsxDHyB1+4yrAmBmbQrCJimvQHyOx+mBqA6E03aLmvxw5bNW7Ar1ehap+34Uv6vfaUFii4PXDbEeXK1HsLZEG63A/kNYhXM3hGJdwwLv7CaAdBa5FKc9TIT2F63HO2XnAzJ+j6iAExl+2dW6uo7VdjSViu+LJUuc5G2f6EYCXxaWwslBqgBGO+EUTt+13fQiaJS2kLHmXEQk/Okp2+2Y4Fs48xVrB66j2cj28Oh5+I3F6TtQJSssDwj2SsXBFcaG2yQpnqeEC8cG4VozAA/QUn2eSKarG/jhtDTA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dU4hS1fc; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Mq6FW6yT; dkim-atps=neutral; spf=pass (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dU4hS1fc;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Mq6FW6yT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4djNmm439Zz2xTh
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Jan 2026 23:49:12 +1100 (AEDT)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029VwUq504469
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 2 Jan 2026 12:49:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=QksCvkxz701
	havt6PNPEIVEdb5fJwkj5u5XA8V1I200=; b=dU4hS1fcLRhHmIWtZNnbtgTX7pk
	ZzXVmsO1vjJPhVlHxpLuxYjo3VDgjAMJRobKj2x9eFm7HHsLNyQ6n99rnCUiK2jv
	rql1VmU3DjTqIjckCeQ7tNxZSWpVv5O+NFTkZ+/6Y+M4QnRsq1CAdVPumH7DDk+E
	JznvP8htggNi5Ouu8uFhDMpEHccd99+opAHU2cfKzfjzOZMj/SR5bwSQn8QlB0Z5
	z+v1yoQGh8GZx9JZm+D3guUcD3Ckpww9Us265+5ShxOTD0+vJc6ur6NLnmshOq19
	s9P7HZn9JwRBcA1LiKJQWfjIn9Orb58jcAhnd5fDQLrGlxOc76xQl8ypHKw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4be8bk8qgt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Jan 2026 12:49:10 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f4a5dba954so314064421cf.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Jan 2026 04:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767358150; x=1767962950; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QksCvkxz701havt6PNPEIVEdb5fJwkj5u5XA8V1I200=;
        b=Mq6FW6yT01ANjXUAt7skyNo1jD+L7vGHHFOdCYCgyjsiZhgMALEWSzVq6Q0t5ptYvd
         HE2Y9UlWtX4lfZaOU1Bi3NVYe8omhddgNvyzkl+73v1p0tDMxLVzZ3K3DkEw89heGSkB
         yf0ZwCiIamIsQy45Etaz6GyBwP2P2CSuOuGh0ycvYuDjU3BVdeBFTRk1oJBxmP33klC1
         McPZvIDw67fTcLlNE407N7/b6yQHd8jZxY6toVyD1FtvnIUSFIQLDWt1L2oT+lVNdfiC
         6me3Kws/u5ia7zRc9NS1UB1Kz410zKvWQNItfC0iBbIY7DXTXUlj5Bh0ovNQ8PxCX4LB
         8JHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767358150; x=1767962950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QksCvkxz701havt6PNPEIVEdb5fJwkj5u5XA8V1I200=;
        b=mDWKAaKsUYCCJLO1n7RGbZCSCaPskFr/P+1j/XnRPZ1AN3BPNf9OhUKSGoinM9GQ//
         X3i/DNIBNXReu5PV+NbPdVZ9DF5sMiRr0EG3HqNh+/55XKrdT0UyzdXLri+2Dz0qxVAR
         FZxVDYthtQj4Vkr6dTQQsgqIVz4Fdn/ejpd8hWvl7a9jWkUrZtikHGuPNp9s6+XEvvDA
         dErdThe9oW8Uahl5n1nJaSMnIMUew7dS5aJM+52lOcqh4gPcmgx+YCbvwJD/peIu41tE
         OVEiH6TJkPmQQzeB2YobI8P/jsYjRC8Qxub+V1T73qfSbfsMF8717I51t+yL701/KAsw
         2aCg==
X-Forwarded-Encrypted: i=1; AJvYcCXWMkgQHGv8Re3VBMHNFsNBDP23lI7SCdCphyFb1tTuE3IrrWHOdzSsUvdwSSmBmkx4CZoATpTeCfEvWC8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz6igQ0U0riBN2rUc2CeruyeKk9IsiexaM0TrvOp7oUAm5t/ET4
	14h0CI5wQyAqtzPXcL4b1VNays5pmh1eBtBz2pRMjvqzWeiODD0UqEr7OeWu3hsFI3cZOMmVWu/
	X5g42OlcC89kaUCdJgBlbq4JMf8OZXw2KNG0Yc1PZtH4JdWtmP6ngrWDv7dF+HuQ5G3Lz
X-Gm-Gg: AY/fxX7Z/gdNItGdCkH3YgA6YT45DTjpPGfc1m8aTdEe+76TKXNDbs24UX3nbzRkwoR
	wbuVCOOmq4psHKnRV9Hv9xF7K4Bp8wViAH1HLhdWo9wnUA88HQTm+dtpp74uj7SkGnDUWfyoD6a
	u0h/qhfxsVQiv37cT91prsaR8SM8CRxjzA7d74nhVX94KI70cHHdd1ipndnTo6JszSd/Zmbdq8A
	wCPZt/px2lqNmQWia/utrZMFYIWbcbMug9NGM9MD1GitPXdky7JA5GSnzEwl2WsSaEzE+9oihEE
	o0T8r7EQkEZMaiUvFsJEpds/C4V4KmE1Bz/gqKbA4XzSOV0PyCt6QVsNHbS7sJtEyDiHmcaQ35b
	PbtCQfXP4iUDlhPtmtWBcwiosWw==
X-Received: by 2002:ac8:5a15:0:b0:4ee:1f09:4c35 with SMTP id d75a77b69052e-4f4abd79a40mr632135161cf.52.1767358149764;
        Fri, 02 Jan 2026 04:49:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFL7+iaxfkh7ST1sRsRYoBVUtv2vCaZZf3cjrB67s/8mxAufKjDkRo2M13zTJGUPOHwVYM98A==
X-Received: by 2002:ac8:5a15:0:b0:4ee:1f09:4c35 with SMTP id d75a77b69052e-4f4abd79a40mr632134871cf.52.1767358149357;
        Fri, 02 Jan 2026 04:49:09 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa46c0sm84804526f8f.34.2026.01.02.04.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 04:49:08 -0800 (PST)
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
Subject: [PATCH 3/3] PCI: rpaphp: Simplify with scoped for each OF child loop
Date: Fri,  2 Jan 2026 13:49:03 +0100
Message-ID: <20260102124900.64528-6-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260102124900.64528-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260102124900.64528-4-krzysztof.kozlowski@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1128; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=2vSFBEundxLqzUF0iaxUlKJbfat6WpicJdQSaJWZB+I=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpV76+e1GWQ1mozRhfq+ap3krAimH8FTe2HB1j1
 lznowHd+NqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVe+vgAKCRDBN2bmhouD
 18j3D/49kYD6fP1TIJI0EqfcpxR44LRXjhjTjuIrdSKl2LOrzXCofrUqhS4sdhdgOT/Ur6opd9j
 BBH+FXCYkqMZI1ZFRbFjugQZRuJKrg8zyiONGWHryQ7lgSxqT2zDHwIiQ+L8CaDCcVDYs/DP5Zd
 0UlXdn6Lql5eVRemHSBxbvGNAzvclucJe1M4aTF6C/N4e9PhyL+GtgmfoUyBP/wBMegUnDLvrhw
 WdikoYBxWa+cBxtXw5QyX5pfQnndDbVKvTm1Ik63bSfk+o7DnXjWxdMCw3fPaDbr51iM9LwErtN
 nC+E18JUmHnLUq/CneetFJ93QmAqM9jW+OlAMaoTYeAg2to4ONPudWZsmp9Fr4D67FSwOLwSOTg
 jVEI6KZiDfF/VsgGtNrwwgP9p1WVHrOcGA4pNmf9JV+zgYMXpy0Uk0pBtCX9TabbUxSD1rr77xg
 SnJ5ZtD/BlQSgUE3ai9133y84tbVEzmXrK+o+YCM0fw59SQ2XDFDXB7QsMwk3t4qRD8ib3AlL2V
 7vbwcRM+SUwpO1ccJwLBXF88a33pdkxgSeyCnZU/uehlMTZKbLt1nSd66+7TqgAy220ryPGxum1
 2notKTa+Vgl2yTPDLOkA9Xbj5d2m3FDvuF+Ga89FlaPD3FQ5Dh5cx/4CrWZdva4lyo3+k6oo4rR TbU6COInLGlpNzQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDExMyBTYWx0ZWRfX+THjhOsyNBLn
 LrxvXsssWRwnhPuas85xvrgX914Gj4RUdMslYGV3COtG7OogVLQNmjQmek1WQfvZBxwh7k6Gr2L
 nm7BT4g0gHjKeGXMYPksTyQq4oXdwSKblOa7p7zTvOTxbQxFrhGKom9z8rTqN99fmgaqHYK3dew
 wKhA8FYvisEc4UOrTIb9uGQL5iPNxgzbdJnr04yTW1epRUuusz3bVF8IniM1kWWT0b84dy3FFhj
 WWmjS4crRB5TCYpKCRLoP3tuSgcMFfGzTxzwygLzpPrQRSybue4gCoI1OymDxdG+H+0YYBtsVeP
 bT9768dSa4prScgv+jROhKYQvJkXgcDAYDfPheY7ThetHHw4V+7ZVENLEyPqqdNPmG79HrjJRll
 ZUNajrUCLNz0EKipZsZkWUx0uV1W1eWHIlb61c9o64El7q1YhjIKF2P8eBOVn6kTIdvLWQw7Uab
 mEDqIVGakTTSpoxklbg==
X-Proofpoint-ORIG-GUID: OWTmIQ4wMb0teHF8QyA2CDE2bpMcthxA
X-Authority-Analysis: v=2.4 cv=d5/4CBjE c=1 sm=1 tr=0 ts=6957bec6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=d5zWgTKZ4CwGW_Y1MEAA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: OWTmIQ4wMb0teHF8QyA2CDE2bpMcthxA
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
 drivers/pci/hotplug/rpaphp_slot.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pci/hotplug/rpaphp_slot.c b/drivers/pci/hotplug/rpaphp_slot.c
index 779eab12e981..dc0e29c4fad3 100644
--- a/drivers/pci/hotplug/rpaphp_slot.c
+++ b/drivers/pci/hotplug/rpaphp_slot.c
@@ -82,7 +82,6 @@ EXPORT_SYMBOL_GPL(rpaphp_deregister_slot);
 int rpaphp_register_slot(struct slot *slot)
 {
 	struct hotplug_slot *php_slot = &slot->hotplug_slot;
-	struct device_node *child;
 	u32 my_index;
 	int retval;
 	int slotno = -1;
@@ -97,11 +96,10 @@ int rpaphp_register_slot(struct slot *slot)
 		return -EAGAIN;
 	}
 
-	for_each_child_of_node(slot->dn, child) {
+	for_each_child_of_node_scoped(slot->dn, child) {
 		retval = of_property_read_u32(child, "ibm,my-drc-index", &my_index);
 		if (my_index == slot->index) {
 			slotno = PCI_SLOT(PCI_DN(child)->devfn);
-			of_node_put(child);
 			break;
 		}
 	}
-- 
2.51.0


