Return-Path: <linuxppc-dev+bounces-14373-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A22C71F17
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Nov 2025 04:16:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dBk6K0zRwz2ypW;
	Thu, 20 Nov 2025 14:16:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763608617;
	cv=none; b=ScoGAjP9VjSaIdlefelXkOKRWjxogxAMv0OMpDe60MecYJDTpCkuL6Liw2pLV8icsPhsSlQfwiAXjBFBxp/y/xI0kjHmK+9XoYyAK+/nyOEZ1h2HeS5gWYBIMP6GNI+EUI+DYgkr0uYxuMqlmVH+3CEoXvIJSQ4ZtrTu8X5zMGXw4KgEvNfgb8sKhpfBnYvxjYQ9hVzvJV7ofyPWxepT3DAsKYHXvddP8ClCDPGZmgU900HQn1RE+ckGcDiHnedKtneLoDluMGSpLBptAZEy2/Zfz8xEX/6PnGV7GirfpapMLbcLyfk2D8Mb4OlydhOwOo9lsxK/uofuCuPCMTplZg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763608617; c=relaxed/relaxed;
	bh=ok8V3IqyDaYaE1iLnLmOXB/io9JGqj1A+wDeTNRoU3w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=DDYt21nSgcNZw+52msQMDniRY2zB5d4/tpX7N1WmO9t88tEa7vweQP5dQM268WNKXcmD0tpDE4LzMcWSU24l9be/hHamC+ClmU1xFtr3eu2qX5zE5VmKiZMUm2DMpk5NG9NJh+mDHqW2XmLFXBieO8dSiwHUqZRBLStIx837TcwTtUFtP0gsZj1tf3fOOBXqYlaMgfMA4ZhCYNppLZTXh0KuP0krk3zGZTAxgIfISkK8N/uEuwFtq1lQEwT+khVp8mp7nIupchuo/Jkeurlgj/LNqveOAkOXBXnBNGzW+XcgH3tJkvFlngG4ee6ajv7zAMdjIXEtOF+eNqpAp5OkHg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=awqZiGr8; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=awqZiGr8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dBk6H5yLlz2yFy
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Nov 2025 14:16:55 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AJLl3et007066;
	Thu, 20 Nov 2025 03:16:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=ok8V3IqyDaYaE1iLnLmOXB/io9JG
	qj1A+wDeTNRoU3w=; b=awqZiGr8V9kLQLN3ZklniIqn4/7uHQlEM2pQvhuX6/4o
	rWqxm7k8rDvdTTmxacR+hjCkgk5gGK6q/73TkKEVDE8vGvwC3d5AHrOuVBIZSDM1
	iw8ZpPQOus04kaQyfBy1c5XxsXE7mbHzupOqKr8l2WOrUUs959zg5sCT5m5jMazi
	g57kt+2AQjxlyeypbgTEe18jIpZJ9a1jqcD6EwXPqMqdtGQG2Gi3bT4MCccbAIsM
	FdFmV9xw0KEkTY+zxTM9Gj0knErQuAR0QnsrPvkxfXmOu5GMXrvWEGKFP0QWk4ci
	RKfaUb8salWn06ZwdWlxUnKGKf1xTbrgI9dBkt1aAw==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejmstyys-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Nov 2025 03:16:50 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AK1jUbP022354;
	Thu, 20 Nov 2025 03:16:31 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4af4un49gm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Nov 2025 03:16:31 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AK3GUSa18940504
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 20 Nov 2025 03:16:30 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6238C58056;
	Thu, 20 Nov 2025 03:16:30 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E66D958052;
	Thu, 20 Nov 2025 03:16:27 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com (unknown [9.90.171.232])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 20 Nov 2025 03:16:27 +0000 (GMT)
From: Andrew Donnellan <ajd@linux.ibm.com>
Date: Thu, 20 Nov 2025 14:16:26 +1100
Subject: [PATCH] MAINTAINERS: Downgrade ocxl to Odd Fixes
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
Message-Id: <20251120-ocxl-odd-fixes-v1-1-8b766f114621@linux.ibm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3LQQqAIBBA0avErBtQIZWuEi2kmWogMhRCEO+et
 Hx8foXMSTjDPFRI/EqWeHfocYDtDPfBKNQNRplJa6MwbuXCSIS7FM5og3fBeiLjFPTpSfyH/ix
 rax+7wvjSYAAAAA==
X-Change-ID: 20251120-ocxl-odd-fixes-6a87a68dd270
To: Frederic Barrat <fbarrat@linux.ibm.com>,
        Christophe Lombard <clombard@linux.ibm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Cc: 
X-Mailer: b4 0.14.2
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: mQOndkO4UVKWxMhg4XEyVjWXazUKayCs
X-Authority-Analysis: v=2.4 cv=Rv3I7SmK c=1 sm=1 tr=0 ts=691e8822 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=voM4FWlXAAAA:8 a=7ZpWsS54KESwXlVTA3QA:9 a=QEXdDO2ut3YA:10
 a=IC2XNlieTeVoXbcui8wp:22
X-Proofpoint-GUID: mQOndkO4UVKWxMhg4XEyVjWXazUKayCs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMiBTYWx0ZWRfX4E2+h13gFSpX
 G0UtS7630kyrFwdP0cWphrx9s/KjTkXVbUG/hd4Ygci23PP2JdSyDt2oObSnmQ+9MfkEbaWtw1Y
 NmdOKK5sD0+fNLc3+ec6Vmv9m5GL5Nl9WtOuxO9d2YN+43otF1F0ByGUkb0RRCU4oKt16L5ia0G
 SU7Ex/DpNBOlXE36Hky3ewUiNNF4S84AiRFxsOZ/T6v0kcxsGPSE49FmpMGrcconDrGzeOG6uQB
 TuoLxGWwQywhNxp2mEQdNfKHUTPcMUH6c7fRLuMWGSGOVNYDjAQBQFeG67UNcCNEUR0Z6I12cKv
 wsxpQqgQFhN/AAT8AKiySj+RXrB7nCYt9UXjEIFBOyPasbLQkYGux/eiJeZ9bM1y/56AOkJj8Fu
 XUOMsCTdpw9w0H9v9SS/hBqfTOVgag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-20_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511150032
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

There hasn't been any substantive work on the ocxl driver since 2020, and
all patches since then have been minor fixes or part of treewide or
arch-wide changes. Frederic and I are no longer spending much time on this
driver.

Downgrade the status of the ocxl driver to Odd Fixes, to reflect the
current reality.

Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index ea8194ac8970d0e34421670b663347b4678a34de..3d558554f074916364b013855dc0a82cfb6e73f2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18755,7 +18755,7 @@ OCXL (Open Coherent Accelerator Processor Interface OpenCAPI) DRIVER
 M:	Frederic Barrat <fbarrat@linux.ibm.com>
 M:	Andrew Donnellan <ajd@linux.ibm.com>
 L:	linuxppc-dev@lists.ozlabs.org
-S:	Supported
+S:	Odd Fixes
 F:	Documentation/userspace-api/accelerators/ocxl.rst
 F:	arch/powerpc/include/asm/pnv-ocxl.h
 F:	arch/powerpc/platforms/powernv/ocxl.c

---
base-commit: 23cb64fb76257309e396ea4cec8396d4a1dbae68
change-id: 20251120-ocxl-odd-fixes-6a87a68dd270


--
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited


