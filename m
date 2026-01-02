Return-Path: <linuxppc-dev+bounces-15170-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 78CABCEF621
	for <lists+linuxppc-dev@lfdr.de>; Fri, 02 Jan 2026 22:56:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4djcw40KvVz2xSZ;
	Sat, 03 Jan 2026 08:56:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767358151;
	cv=none; b=JAwJecm+3Io1EDWaAZj9acxqheOFwvSxBzus4+XzGF42aHQjyJLvtAwkYlIDvVtMyZhS0Jsh5OeBMGAMnzg9D/jACGUdV/NqnYt2/RodJSbKOqMOvjKXs6qytACzzz6qFJ6TlX2CeObl6LVZg+GKIf8xZYnPgpy/My6ZBf12EckMXdOYPGwfhKJKeTofJkZrHnt12WuSEVGb2S7zMx4CWks9c3GmcZEO+EAKW0APyy3Yh3n6FUFiJxv+6HRQVdX8V5DEf0pSvNeY7u0Te8eY6wsGAcdDKZJhG75MXQo4JzVRCS5Y5tVNJHmFInklu86oq476YOnQRbc9esT6l3KaOA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767358151; c=relaxed/relaxed;
	bh=vjTE26x03AwqvTslfagsJJeuVhEuY8F5fXF0GXew3f0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LGfACHS1zG6CR45q8d0HtYZ6xxLT4NKPyrfmFO/IryeBJ4sjzIlxiUePrRbP3LolmQsJMBJw/02aUhZUinePuKpPY2o0FnuGVgd811iBoN2ou/uZDOm2iXBuxKQpfKheN7ZdAvAquFSjerkjE/GSGhU/Uu6cGdyH8yKhAr9axCMuk27h7njx53BLbZ8UKhMjEmStoSJN4TSi/IYr0GzcGwCJuTBLnEKwzM2NkHIKG2rieMQD832FWg8I2cOCsVSBOeqpM5EOsxeHWkxd+oooPCD/iy/k6TkAYno1/E93Z73JUL5gOikaCs3b/SQv+y93HmoffsWOznGXIFfAGRwIyg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XV+wnMwo; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Yf6r6UGu; dkim-atps=neutral; spf=pass (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XV+wnMwo;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Yf6r6UGu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4djNmk6rz6z2xpg
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Jan 2026 23:49:10 +1100 (AEDT)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029WEPB824541
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 2 Jan 2026 12:49:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=vjTE26x03Aw
	qvTslfagsJJeuVhEuY8F5fXF0GXew3f0=; b=XV+wnMwoxr/Ib/ravOGomuSzEFp
	WmXMh99S6r4ygpXH7eTK24e/S6jbNbndZhPEoh4PLriJbBdFLNhX1tLpg3/FYTcy
	2f1MjjOxorxsh+sMYSm1BE9bdnpdOYp3vgftxs7xXkCF82u2/i6YqTiCyCd/DEWO
	QxWpt9jtlDMELcorRpPCWH4cAvqcyht5fb5MYWehixPFBmh3bgOZcAieG9nnHwx7
	Iden0TAe8ly+/vhtDlIqkLc6MXmpEpRwPFVawmwgIfXtaoZbaN0EXT0fYMwzezuA
	wl/hVRE2QFRNCfCr+fSPiRjMMzpsRRU2hHS4i/b7mSKZg+rshLtr/zdj6IQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bd8533bwm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Jan 2026 12:49:09 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee0193a239so123618011cf.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Jan 2026 04:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767358148; x=1767962948; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vjTE26x03AwqvTslfagsJJeuVhEuY8F5fXF0GXew3f0=;
        b=Yf6r6UGuXDJJEO+8sOq7gSTK1fyM6b+AEaLFWv2s/EH2ljttQR3wwLqEEfaiqTMt7B
         GEv5Og23QkTyTUibYKIoFpGeu5ENvVLzo71bwQtdE2MFZFyOM0s2v3odJQvDwgKP7AsP
         LD5arlBfatQpDTOYtHW099CwKqgTpkOFBPi/qd1x5PXZQBPTMa05phhLeh4kuQT74ETL
         jebhJzzT09olBvHDJl1aCf3siw3Q8mjKt+U6T8WtUQx27KSxN/weCYiotgYMiTt2jMAx
         imDjnh1bYd61VgBbp8ZnvwqlfmF0WngHlUG4VSMGSIBoVOU775Y9kU3q2yaYsuHPHL+F
         c84Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767358148; x=1767962948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vjTE26x03AwqvTslfagsJJeuVhEuY8F5fXF0GXew3f0=;
        b=pNhFQ+t+X/n9wfRUg+Y9dQb8xyeFNhw1Jh3doL1LUxtlX8eN3CpOV877GJoFODpp3v
         OjukrHiSQYKIqVMTWzlB5Q10MYpYkFF2noiQq9gorlt3utxQ8eGEuFlaFGZYJhV7avCQ
         qchTxtMfDOq69NqkmfEsouVl3swDx5tWbu3LXXzkzrJ0fZd2/le9KdSZ/MbtwRMzVAV1
         eFRbhrpTTtWtF9zQ7HXbqhhkNJAkiKEDaos+lB/e3suCfF9MlJ3GJdS1ZXseMU6Zxeqo
         w6yVZyu7Sb9onjKH/07eVZD2tWTSlevu+pNPCJR7t8SbjT9L4xZ2CKP9MrITGkOJ4Qda
         H/gA==
X-Forwarded-Encrypted: i=1; AJvYcCVfMhAW/8uJ5eOvpjLbqNgYLst9MbrTpjb1DPnVOvWHOQyNsKVCBvL/ukpRDgnyHaHcl8n2o6Qzm9pYfbg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx+JwO7NVaaZCtj8iwcmtsuyq8x3T3ykf51v91co0Hr3D3SIjAX
	LqWdtnVWMV9a40f6nzmsjvmpLG/hJ3Oeb9/649/86cb4W/AWBR5zv5PQpCCU3ej1AYRnSs3yAu2
	qz50TgkN1yL3XS2tIa281Q0le0u4gvOhAiDB8JcBmKfI+ZKuYLlVciEW/9gJ43O8sEnAf
X-Gm-Gg: AY/fxX5vOMStZ2PXCwK34JfsSYGF1zu1lmYv+vDFrwqutqnmYs0tHupl12ErFnOnqou
	coRenP5I6lDRWNEhBUkGf1RQON+xVW2+oH7v0OO35cNZh3Y58pAmjJJaKej3PK1VXTuntLGGN2n
	X7H+vkS9CQrTFgUB9001XnIAjHn3g4fOGpfXVyh5yWQLU0DOwNdn5XlsESE1QW7qohiBP65qxTl
	mjvkAWwp76sV6om74+59i13yIQAcjrs9Y/5FMxR7MlConEn7BtsD210bYF6hi+WyV18viTm7f5b
	f6g922L/C6I7khhCH79eTPXaaLUDpPguK2RqBEjNK6aP/JACUlxSj9Yo7jE7DdlS++E/0Ep6ztt
	xAAu39bkWLgnJOp6lSrOU6QFPHQ==
X-Received: by 2002:ac8:6044:0:b0:4f4:c150:7d1c with SMTP id d75a77b69052e-4f4c3ebfe26mr430878071cf.53.1767358148090;
        Fri, 02 Jan 2026 04:49:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFKBazsH5X4TVMYBORJZLb3en+SDf+yLtdGDzkSzGie0Q2NHJUzyJIxfJhQBa1t41nJeqUE+g==
X-Received: by 2002:ac8:6044:0:b0:4f4:c150:7d1c with SMTP id d75a77b69052e-4f4c3ebfe26mr430877881cf.53.1767358147674;
        Fri, 02 Jan 2026 04:49:07 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa46c0sm84804526f8f.34.2026.01.02.04.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 04:49:07 -0800 (PST)
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
Subject: [PATCH 2/3] PCI: pnv_php: Simplify with scoped for each OF child loop
Date: Fri,  2 Jan 2026 13:49:02 +0100
Message-ID: <20260102124900.64528-5-krzysztof.kozlowski@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1212; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=EP/MtQj5p6JL4xc2pd12GnTgEgj4Ywj3gHAk3b10BJ8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpV769WyVeXeUs9nZiznyQRex29feWr3vh6I2J+
 GAlypK/zzOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVe+vQAKCRDBN2bmhouD
 1+ASD/9Bilw5E8KjrZdsekRLJEtn10r+Dy1sg1lurcuQ2ExEnV00xVAoiFkxiEPWLrh7WFhTzH6
 WIjL6h2BMk+/H4YjLx6Nwxdrv9TwjVjEeQdQ9GYU/3r2o2cwzEqxckEFVsXSXdga+h52imdboSI
 oCslonQk+20MxS7q8+1HYoG2zQIWR1EEzJ/7yyVwrLgxfzTssevfdMvicfwKjORPE/4wPdj79Er
 LR6EdBX5uyOla66gb/LjgLG6KyWSwIyQcNUlBCE20Ocdc2kAOrhYDlc8gWW/HGmg8o64xU8IFdP
 er8fJE+g6z7ylyIle9/xo3P6IrtdFQaEItU38JUfy8hqAGmzlSOD5ZHD0d7lQpRC+4cjJa0rnQa
 0t1LLkd+CLxXGI5dXQLNsFlsm7i80KjH8B65D75/JOyhulAiIAFKyNejTeVNBdjL3pplCfbguVb
 iTHZXyhdwuMBeVPwSk5FEZu8mxf6qiwy7CioBM553EJxRYvctbzyCy3bAJciImHywpGIGS64BH1
 M3gAtEr5vTRlywvdHCOeduhmY4vkev6aSpX8nm3bpjoyp6iSQCSaxxqPM1xkeG6hRIt6MG+Grz/
 Hil8lnwGcMH2xCN4qaRzjqwA5xjoMWcNV5PKd3d94YVcG97D7/jz7zEtYYOkiWLFK+QGn1vyURc K89KC2DkQR4aVcQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: VjHJUTrRy7HGhekV9oNMIS6wbSqW__Jy
X-Authority-Analysis: v=2.4 cv=fL80HJae c=1 sm=1 tr=0 ts=6957bec5 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=WsY6cfW8n5MRYgmDw1UA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: VjHJUTrRy7HGhekV9oNMIS6wbSqW__Jy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDExMyBTYWx0ZWRfXxqI9m5zR39LS
 fSpvUpTPCywzJ1/yGrsCMF1D2jrSl24Xp21tyciqvwlUezvz2PaKwW5Yv4E3j1xllUGv3wb7ShO
 rp5YqfuPVBACAIsDg0WgXYg5qGgvlRWbgLXFwcZknJGLkKgVKZEMNbweBxKtqDwdhapgVuE3Q5o
 b53batbKU0My1fdZLTR7BBSaPIFPd8C9siV+SUWOkOFOBnYvZ5ookbQdk6BYw0mhsIuOjBodB3E
 XGAw5agAfl3jHQ1pWQXzbLyZXABaoksTWIyOtK9nLIm/zdRBEAE2uEOPvyZ+7xY/W9LONixL2aU
 LDUeu6vmmg3Hoez0BhUWuAhekwGJMuot6CgTygFaTmnoj43tXc6Pg4xv3OfTx30OJb5k2ijxLAD
 4swBgrC2PiXC+IBPxi+HTjWglHJtN7t4XWRxetUidR7/kp+IXaqYUBy8e5ocK4GOmkNTA5U60v7
 UleiNo7ovWSgY8BCRVg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601020113
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/pci/hotplug/pnv_php.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/pci/hotplug/pnv_php.c b/drivers/pci/hotplug/pnv_php.c
index c5345bff9a55..0d80bee284e0 100644
--- a/drivers/pci/hotplug/pnv_php.c
+++ b/drivers/pci/hotplug/pnv_php.c
@@ -215,24 +215,19 @@ static void pnv_php_reverse_nodes(struct device_node *parent)
 static int pnv_php_populate_changeset(struct of_changeset *ocs,
 				      struct device_node *dn)
 {
-	struct device_node *child;
-	int ret = 0;
+	int ret;
 
-	for_each_child_of_node(dn, child) {
+	for_each_child_of_node_scoped(dn, child) {
 		ret = of_changeset_attach_node(ocs, child);
-		if (ret) {
-			of_node_put(child);
-			break;
-		}
+		if (ret)
+			return ret;
 
 		ret = pnv_php_populate_changeset(ocs, child);
-		if (ret) {
-			of_node_put(child);
-			break;
-		}
+		if (ret)
+			return ret;
 	}
 
-	return ret;
+	return 0;
 }
 
 static void *pnv_php_add_one_pdn(struct device_node *dn, void *data)
-- 
2.51.0


