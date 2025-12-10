Return-Path: <linuxppc-dev+bounces-14713-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B4554CB2BCC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Dec 2025 11:49:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dRCCj24PMz2yFq;
	Wed, 10 Dec 2025 21:49:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765363793;
	cv=none; b=aNq/SBE4twEXl5iiCUuHN5OITgxBN9o1M2T4/Igt8/JPB3aHYSC5HoKVRTGMbxpY5EKWVB4wZ/Sx/syFr5SZ+lcrblxmBxz3cBmkx61tcpopU8RlK6PazAHT7qo0npBuqZihG3AvPKCKlDHqzRrlfIaCvo0LqGqE2Af09QVQu8zlz2nm/261KOGrld4PR2zOGc+sk9mL974WU/nJ2mp4rxUyu5BXPWsEPqEMY10lOJ1P4cnrau7PHo4YFN3LWq+Hj+1SusLeeuSc3ek0Nwztm460OYc+U1pyJ8HM5UpCtbOfal9gQmcVHHEoaw1cwFfjuu+pCC6ucSbymoah7w87Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765363793; c=relaxed/relaxed;
	bh=uvgcie8gijWMYgZk6qHBinxXNB2Tlz/k9niBSAbdhps=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ETe8h7W1BQCzFEOVgWnnQDDvcBH0PGPls1nK+AZvQ3ljLmV03uHFfRGHtxV8NKCCZz9GXjczGJxdWkUrDB/1B97IuA08cgzZagpQ2wHIbDXLgyYIntncnHh9g9b01EXMD9Ai8xl4+rWBBKQ7oZkYSpLEsU+slg9yQL4eB+2iMN8o5MnXjDq6XptLFu+Rhbt7nTD3LW3d/Fx4l0l5T5oqogHXmuqn3pMobSkvAvA4vctGvT25bA7T685CxUHJKYKp/1DAFBi0LaE6Cy1733cofcgXhbKVtTXKb/nZPRnd0XKl1WUhUkgdjQuzDrPwCzqp4OOKqnQmIj+NUUKuNIdETw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=f4irDu+w; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=f4irDu+w;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dRCCh1McXz2yD4
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Dec 2025 21:49:51 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5BA9vC2t016359;
	Wed, 10 Dec 2025 10:49:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=uvgcie8gijWMYgZk6qHBinxXNB2T
	lz/k9niBSAbdhps=; b=f4irDu+woBNnqqJnu+gzU/uDbywcMKFf/6UEi1N/3ReV
	IArCzVG3sFU0KBjLci1vzsvyclhO/dloY4MOdiDYpqRxdCE6JgZ0BSjwRArfOU85
	SAR8Uh3pHE3pM59ey2k221MPuyU5TiLrIqkt7EBVaM+yVqtV3v5dm/JQSL33EVW9
	1+MFBtEwmCXyolDrrVhaeJE+l6AcAMEToSBf9+jRlfIrESJ9f9/tXIqqyLQVXgXe
	NsDi7+JPday7PNv3NowjPxY0vUZjuaxfAg9gpxsItXKiju2pmGGGmG78eb5V8iCH
	S1bZ93Kb+VAUq5l+p6bk1iupxw+/6+72wQHAhEAXPw==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4avc53h96u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Dec 2025 10:49:47 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BA7VlI3026887;
	Wed, 10 Dec 2025 10:49:47 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4aw1h17t7x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Dec 2025 10:49:47 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5BAAnjmm15270444
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 10 Dec 2025 10:49:46 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CA8935804B;
	Wed, 10 Dec 2025 10:49:45 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EE0995805B;
	Wed, 10 Dec 2025 10:49:42 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com (unknown [9.90.171.232])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 10 Dec 2025 10:49:42 +0000 (GMT)
From: Andrew Donnellan <ajd@linux.ibm.com>
Date: Wed, 10 Dec 2025 21:49:34 +1100
Subject: [PATCH] MAINTAINERS: Update ocxl maintainer details
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
Message-Id: <20251210-ocxl-maintainer-status-v1-1-d73981866db9@linux.ibm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2MQQqDQAxFryJZN+AEqtirlC5GG22gHTUZiyDev
 aG6+Iv34b0NjFXY4FZsoPwVkzE5hEsB3SumgVGezkAlXUOgGsdufeMnSso+VrQc82LYNFRXoW3
 7khhcnpR7Wf/h++Ng5Xnxfj7Pff8BTqJ6bn0AAAA=
X-Change-ID: 20251127-ocxl-maintainer-status-992761bbf02e
To: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Mahesh Salgaonkar <mahesh@linux.ibm.com>,
        Frederic Barrat <fbarrat@linux.ibm.com>,
        Christophe Lombard <clombard@linux.ibm.com>,
        Vaibhav Jain <vaibhav@linux.ibm.com>
Cc: 
X-Mailer: b4 0.14.2
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA2MDAyMCBTYWx0ZWRfX4SJ+7bu1O3/8
 MTiFaU21tQmbuebUDIEJ9FzHKZmtsjlpZfKiy+Fchclqu6YEenJbhMs6IW70X1v//Y9sxN3CXRd
 FX0qNDTb7flvojfrfJ9ugBMG6emgmsMq1wjYPdaHpNIeoJZQZ1Ac9137EYtyalHYB6sPNadvNDo
 0X9DplsQOlgpWaKiFR+tOT+5K8g6nFTp1sbmULm8bnkQP6gjc9M//QwJ0M2mYglkWgg/vUm8rBV
 UdOySYdKs2IyE+MzSH0XjxCezvvxvsNjguPcmYLJtUQG5JMTx5yoVuWB2UldFF+/pKIg/F7yy0+
 8nRCgunRWbmAL5ZCE6HfFaYh20kGQ+yc86QOcR+6LyAe+VRe2q8cOgv63pqnophs+deV5bym26k
 ejd/o4AuaYNE0KRKd9AC/fnOPjluAA==
X-Authority-Analysis: v=2.4 cv=S/DUAYsP c=1 sm=1 tr=0 ts=6939504b cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=voM4FWlXAAAA:8 a=69LWc1rl86c1DZQ69rIA:9 a=QEXdDO2ut3YA:10
 a=IC2XNlieTeVoXbcui8wp:22
X-Proofpoint-ORIG-GUID: Ij1EV3Zxr3ga6mV7lY3C7fwEH1Uxsagk
X-Proofpoint-GUID: Ij1EV3Zxr3ga6mV7lY3C7fwEH1Uxsagk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2512060020
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

I am leaving IBM, and Fred isn't working on OpenCAPI either. Mahesh has
kindly agreed to take over as maintainer to review the odd fixes that
still come in, and he has plenty of powerpc-specific experience.

Add Mahesh as ocxl maintainer, remove Fred as a maintainer, and downgrade
myself to reviewer using my personal email address.

Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index aff3e162180d1c39b45ce0f046440d95509b8d9f..01007981fb2f2a23a4e748dbead45473f4d11591 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19002,8 +19002,8 @@ F:	drivers/net/dsa/ocelot/ocelot_ext.c
 F:	include/linux/mfd/ocelot.h
 
 OCXL (Open Coherent Accelerator Processor Interface OpenCAPI) DRIVER
-M:	Frederic Barrat <fbarrat@linux.ibm.com>
-M:	Andrew Donnellan <ajd@linux.ibm.com>
+M:	Mahesh J Salgaonkar <mahesh@linux.ibm.com>
+R:	Andrew Donnellan <andrew+kernel@donnellan.id.au>
 L:	linuxppc-dev@lists.ozlabs.org
 S:	Odd Fixes
 F:	Documentation/userspace-api/accelerators/ocxl.rst

---
base-commit: 0048fbb4011ec55c32d3148b2cda56433f273375
change-id: 20251127-ocxl-maintainer-status-992761bbf02e


--
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited


