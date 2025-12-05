Return-Path: <linuxppc-dev+bounces-14646-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84975CA7D01
	for <lists+linuxppc-dev@lfdr.de>; Fri, 05 Dec 2025 14:46:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dNCM951KLz2xs4;
	Sat, 06 Dec 2025 00:45:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764942357;
	cv=none; b=CcMKUteQ7QZLc3+g+B2xS3T0tbIhI9vTQAJ1FMWda4jK2B3UXXOJm0xwYZnXG7u882GZ7kT58u6G53B8ACwaAje3M/fcuIScrpFjLkGs3xyzNP6WAvBMOWGbEZAcoQRFOYOfKXEqD3tdg3AfsEui+KfaJZs9QdRbnR6MX5w1gZBff9MsA/qZY/vJWFJFcpZCbeNx27d5hLaZ3fhj8jT8XWM2ihLOXLaujrVcUG/mYIs1zRlQyFbzQJg+x8pVZMtcZrXkF9BlYJI3LiwbK77Zmc0KgLZfRBDV9EFu3y141iAYrWmsf1ygh2TNbzR2Aj0wnhWXmaBC+9H8vEOgxD90OA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764942357; c=relaxed/relaxed;
	bh=p9hmBNxQUkuzT0SKqaKHPAP1Iy4lvJcC8IWiSb7QYoI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=onLpduH9W8b9J1D9Yu5mIa7fD1VlWOuA8rs5PSg7L8QknqgI5pAYyy+6l/WCk0Lx+X5M0MLaGl5s5wXe0Yg/60nHIDNOWZ9M9xpzeTeeTtqh1qtW20sEZi+cOUQBcCy41jLfeVVkPCMrJg1P5DlxrlJfsrxZNACOjfX8frnnbcN+0v0KcLK4ZMubBz2iw7j8cpTxmUM+ZxdhqB6IJbDpk29feia3gwp6sCQmkIlaBv+GNc1v9Qoh7O0iVtTkEev2c97r6GgX7G7hWNvpwE8Wm9YnQtEt654gZFT2WrjlWxfq6aS3O0RwAXNF/zr4+kFD3bFfqfdCW9jjwUzBhUXq5g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kPtcghAM; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nnmlinux@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kPtcghAM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nnmlinux@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dNCM84wPFz2xPT
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 06 Dec 2025 00:45:56 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5B58nf3f029716;
	Fri, 5 Dec 2025 13:45:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=p9hmBNxQUkuzT0SKqaKHPAP1Iy4lvJcC8IWiSb7QY
	oI=; b=kPtcghAMd2DBzFK9LJtXzizMDdys9o6bMIbu4P1Vt7d/SVqnfLrrdv4xz
	lStBaJGbZq3ehkXjTCMmK8vs065a9tukbLym32y0npHJtLeRPHGA6C411miwjK+u
	dykOgarMqFo9ZqhVyfDGTeca/Db663XaLvixzKRG3DqyEzx1NVkNhH/oGEfkfMu3
	RSEU/fnk/QJss+bmjXq90plQX1jum3wqfh5qyTM+MMQL7P+6f2aDozXeXPiHJDnk
	n3tUsonsmFe+1k+Xjk9yrUkol+HD2PlTjOPY8muKs944w7TX+Vgg/OhVa5DYhdMH
	VwSYxNxRLo0iBFNDZsOhnMZR1VZ6g==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aqq8v57vx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Dec 2025 13:45:45 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5B5DdBN5013930;
	Fri, 5 Dec 2025 13:45:45 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aqq8v57vv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Dec 2025 13:45:45 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5B5APiW1019075;
	Fri, 5 Dec 2025 13:45:44 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4arbhydj1w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Dec 2025 13:45:44 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5B5DjeKn50856288
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 5 Dec 2025 13:45:40 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9CE1820049;
	Fri,  5 Dec 2025 13:45:40 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 356192004B;
	Fri,  5 Dec 2025 13:45:38 +0000 (GMT)
Received: from ltcd48-lp3.ltc.tadn.ibm.com (unknown [9.5.7.39])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  5 Dec 2025 13:45:38 +0000 (GMT)
From: Narayana Murty N <nnmlinux@linux.ibm.com>
To: mahesh@linux.ibm.com, maddy@linux.ibm.com, mpe@ellerman.id.au,
        christophe.leroy@csgroup.eu, gregkh@linuxfoundation.org,
        oohall@gmail.com, npiggin@gmail.com
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        tyreld@linux.ibm.com, vaibhav@linux.ibm.com, sbhat@linux.ibm.com,
        ganeshgr@linux.ibm.com, sourabhjain@linux.ibm.com
Subject: [PATCH 0/4] powerpc/pseries: Add full RTAS-based error injection support
Date: Fri,  5 Dec 2025 03:45:06 -0600
Message-ID: <20251205094510.4671-1-nnmlinux@linux.ibm.com>
X-Mailer: git-send-email 2.51.1
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
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: doOAdvzRSZn34NGzkuEcGS1AqzteTjvU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI5MDAwOCBTYWx0ZWRfX2zHOGLTLWWEt
 UH/Qa0SUMEqB9aCEUJn8htsLy+lQwICOviT9qgtX550fZ0i9AOVg/Z2USXc6lWCTE//1NGonZKt
 rdebsJHDqXSytmZQ9at+TbwGMl6WbEQvv8VY6Bg4lJy3VgyUzag8DyDPZxXqqTc0ZxiAOY5CzBE
 wZpVP7bIAP9HmQrmwIsER1x5/HnK1S9RCO8z/xcAVEvcYp/MYh8rZX8F5C7fDlyCaq9e+M+wLAp
 TSYAt4DLxU9JrzfRNkpWsP4K7n8G+uYpWcQJkgbVOB26ihrsoZbWJmSOQ6o4Lg/R6Mhcp8BP/ei
 K4uQjDizPo/DIhmgEUj91F8IW316/wW6qBuazWCivkL0ErnXPoRjzgIPyqL816retIkbZnYg62F
 Eh9m5tAWn93JEF4k2ypnr0/hFKFZvg==
X-Authority-Analysis: v=2.4 cv=Scz6t/Ru c=1 sm=1 tr=0 ts=6932e209 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=ydrTdRBo0IZwANcyuhIA:9
X-Proofpoint-GUID: 5XDZzNZRqdGB8JNLsk_IiLRThRLZbtGt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_04,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 spamscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511290008
X-Spam-Status: No, score=0.4 required=3.0 tests=DATE_IN_PAST_03_06,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The series introduces complete support for RTAS-based hardware error
injection on pseries platforms. The implementation replaces the legacy
MMIO-based approach with a full PAPR-compliant workflow built around the
RTAS services:
	ibm,open-errinjct
	ibm,errinjct
	ibm,close-errinjct

The new pseries_eeh_err_inject() interface enables controlled injection
of synthetic PCI, memory, and cache/TLB faults for platform validation,
EEH testing, firmware diagnostics, and tooling (e.g., bpftrace-based
tracing).

Current testing scope:
At this stage, the feature can be triggered only from VFIO-passthrough
devices assigned to a guest, and from userspace-exposed VFIO devices
using the VFIO_EEH_PE_INJECT_ERR ioctl.

Key Highlights

Dynamic acquisition of all required RTAS tokens and correct
open/errinjct/close session handling as defined by PAPR. A 1KB
naturally-aligned, zero-initialized RTAS working buffer is populated
exactly per PAPR buffer definitions.

Support for a wide range of error types:

0x03 - recovered-special-event
0x04 - corrupted-page
0x07 - ioa-bus-error (32-bit)
0x0F - ioa-bus-error-64 (64-bit)
0x09 - corrupted-dcache-start
0x0A - corrupted-dcache-end
0x0B - corrupted-icache-start
0x0C - corrupted-icache-end
0x0D - corrupted-tlb-start
0x0E - corrupted-tlb-end

All RTAS parameters use proper big-endian formatting (cpu_to_be32()).
Robust status-handling, printk-based diagnostics, and thorough
validation for invalid or unsupported conditions.

Error-specific buffer population logic is factored into helpers for
clarity and maintainability.

Fully tested on PowerVM with firmware that supports RTAS error
injection, along with the companion QEMU support posted here:
https://lore.kernel.org/all/20251029150618.186803-1-nnmlinux@linux.ibm.com/

Signed-off-by: Narayana Murty N <nnmlinux@linux.ibm.com>

---
Change Log:
RFC v0: https://lore.kernel.org/all/20251107091009.43034-1-nnmlinux@linux.ibm.com/
 * Fixed PAPR ibm,open-errinjct output format (token,status order)
 * Added pr_fmt handling for EEH subsystem compatibility
 * Split into logical 4-patch series
 * Addressed all review feedback on validation + rtas.c

Narayana Murty N (4):
  powerpc/rtas: Handle special return format for
    RTAS_FN_IBM_OPEN_ERRINJCT
  powerpc/pseries: Add RTAS error injection buffer infrastructure
  powerpc/pseries: Add RTAS error injection validation helpers
  powerpc/pseries: Implement RTAS error injection via
    pseries_eeh_err_inject

 arch/powerpc/include/asm/rtas.h              |  21 +
 arch/powerpc/include/uapi/asm/eeh.h          |  18 +
 arch/powerpc/kernel/rtas.c                   |  42 +-
 arch/powerpc/platforms/pseries/eeh_pseries.c | 428 ++++++++++++++++++-
 4 files changed, 485 insertions(+), 24 deletions(-)

--
2.51.1

