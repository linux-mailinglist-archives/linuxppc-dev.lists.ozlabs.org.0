Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0173F39E2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Aug 2021 11:26:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GsCm7470dz3cW4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Aug 2021 19:25:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MiomNSBB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=MiomNSBB; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GsClN6tdtz306h
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Aug 2021 19:25:03 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17L92jfc000832; Sat, 21 Aug 2021 05:24:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=2Qbtkj7Dha+i0IY2pkHB/T9+tJrXIRNvSRTlgW6D59g=;
 b=MiomNSBBHCVRRw1Jxf7z3MvvA2I220eCf24YGwL0SVE+o/NtH6NuKTJM5nycTCaMdPk9
 OGUdSIwnKEEU0IRbeW+cz2zowiZCktPZuQtQpzIeJ7aX63qpeVyObE9FfCnypIaRutVh
 uzXVc5bJCdMx34XnMDc/oTB4Z/KSC8i9zq9QFUWx8n4DCxgqv+1OXGkhdd9aoaGjEer8
 7z/E2698BiAqg5nd4x2ovYZHaNjPgy5KcNT33WMNga2qNpVne/08bPHZUjYdl67mlULn
 XlQRIyPIPAs0tuFvNal1vAEPNkrg20LFllFuTF+8VGzAN34sjLd7I0GU/bnh2E+01hBM DA== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ajx35gs1v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 21 Aug 2021 05:24:44 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17L9CHof026222;
 Sat, 21 Aug 2021 09:24:42 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma01fra.de.ibm.com with ESMTP id 3ajs488ax0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 21 Aug 2021 09:24:42 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17L9Od2t55312820
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 21 Aug 2021 09:24:39 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6B26011C01C;
 Sat, 21 Aug 2021 09:24:39 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E0A1A11C013;
 Sat, 21 Aug 2021 09:24:35 +0000 (GMT)
Received: from saptagiri.in.ibm.com (unknown [9.85.90.43])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sat, 21 Aug 2021 09:24:35 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 0/3] powerpc/smp: Misc fixes
Date: Sat, 21 Aug 2021 14:54:16 +0530
Message-Id: <20210821092419.167454-1-srikar@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: b3hZU06pupbrsJ4sVBwOpY3c_TZBp7Q2
X-Proofpoint-ORIG-GUID: b3hZU06pupbrsJ4sVBwOpY3c_TZBp7Q2
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-21_03:2021-08-20,
 2021-08-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 adultscore=0 mlxlogscore=598 suspectscore=0 bulkscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108210052
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Gautham R Shenoy <ego@linux.vnet.ibm.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Valentin Schneider <valentin.schneider@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The 1st patch fixes a regression which causes a crash when booted with
nr_cpus=2.

The 2nd patch fixes a regression where lscpu on PowerVM reports more
number of sockets that that are available.

The 3rd patch updates the fallback when L2-cache properties are not
explicitly exposed to be the cpu_sibling_mask.

Cc: linuxppc-dev@lists.ozlabs.org
Cc: Nathan Lynch <nathanl@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Valentin Schneider <valentin.schneider@arm.com>
Cc: Gautham R Shenoy <ego@linux.vnet.ibm.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>
Srikar Dronamraju (3):
  powerpc/smp: Fix a crash while booting kvm guest with nr_cpus=2
  powerpc/smp: Update cpu_core_map on PowerVM lpars.
  powerpc/smp: Enable CACHE domain for shared processor

 arch/powerpc/kernel/smp.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

--
2.18.2

