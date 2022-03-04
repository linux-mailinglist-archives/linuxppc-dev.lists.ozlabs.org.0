Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8AA4CDC69
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Mar 2022 19:27:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K9GYm0V0jz30L3
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Mar 2022 05:27:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qPAkc5mq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=qPAkc5mq; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K9GXz6Jmjz30BP
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Mar 2022 05:27:14 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 224Hncxd009047; 
 Fri, 4 Mar 2022 18:27:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=8YEdMAu+BgpK3WuTgyt9W5PM9OYpH0hMCN2WdXYGr5Q=;
 b=qPAkc5mqkaw4J6GArWWes6n6eia6ue2utesUse6xeL5cC4wiCMiUiV/hVpo6u0GF0vOi
 UDljJHV8N5uL8BJ60borhd5qyus4bGcZ1Uww6R4jB04J+BPPkRzdAro3vwCv014WhflS
 z67GYAUz6PeMrv0dEfby43ExIcCnvdURs+xZwzNKrQ03MJMINloMzQMmgclxaxSXWprT
 MikkWwjBJXL90paB52wTs3VNCNJjuksByDAciQUy4STeSQZIzyqD0MjtlipgDoXh/dBJ
 DazrnnKN+Y1gfA3R6ZEhwkxK0m08WMEsZy46hTJhTPy91bItBBx7GT5xAbpv+pU7q2Mg Pg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ekqgsgpgx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Mar 2022 18:27:08 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 224IPilV006351;
 Fri, 4 Mar 2022 18:27:08 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ekqgsgpgf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Mar 2022 18:27:08 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 224IIepi015242;
 Fri, 4 Mar 2022 18:27:07 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma01wdc.us.ibm.com with ESMTP id 3ek4jyek9b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Mar 2022 18:27:07 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 224IR6WL12780192
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 4 Mar 2022 18:27:06 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F0083AE05C;
 Fri,  4 Mar 2022 18:27:05 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 949E8AE066;
 Fri,  4 Mar 2022 18:27:03 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.77.214])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri,  4 Mar 2022 18:27:03 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: kvm-ppc@vger.kernel.org
Subject: [RFC PATCH] KVM: PPC: Book3s HV: Allow setting GTSE for the nested
 guest
Date: Fri,  4 Mar 2022 15:26:57 -0300
Message-Id: <20220304182657.2489303-1-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: NxC_6zVl_oz2ZBrUVDXMFn28RTil2jMe
X-Proofpoint-ORIG-GUID: QERI_M8VbWzajLmj0KKYeTm1FkmaFFaC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-04_08,2022-03-04_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 phishscore=0 priorityscore=1501 spamscore=0 clxscore=1011 suspectscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 mlxscore=0 mlxlogscore=901
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203040090
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
Cc: aneesh.kumar@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We're currently getting a Program Interrupt inside the nested guest
kernel when running with GTSE disabled in the nested hypervisor. We
allow any guest a cmdline override of GTSE for migration purposes. The
nested guest does not know it needs to use the option and tries to run
'tlbie' with LPCR_GTSE=0.

The details are a bit more intricate:

QEMU always sets GTSE=1 in OV5 even before calling KVM. At prom_init,
guests use the OV5 value to set MMU_FTR_GTSE. This setting can be
overridden by 'radix_hcall_invalidate=on' in the kernel cmdline. The
option itself depends on the availability of
FW_FEATURE_RPT_INVALIDATE, which it tied to QEMU's cap-rpt-invalidate
capability.

The MMU_FTR_GTSE flag leads guests to set PROC_TABLE_GTSE in their
process tables and after H_REGISTER_PROC_TBL, both QEMU and KVM will
set LPCR_GTSE=1 for that guest. Unless the guest uses the cmdline
override, in which case:

  MMU_FTR_GTSE=0 -> PROC_TABLE_GTSE=0 -> LPCR_GTSE=0

We don't allow the nested hypervisor to set some LPCR bits for its
nested guests, so if the nested HV has LPCR_GTSE=0, its nested guests
will also have LPCR_GTSE=0. But since the only thing that can really
flip GTSE is the cmdline override, if a nested guest runs without it,
then the sequence goes:

  MMU_FTR_GTSE=1 -> PROC_TABLE_GTSE=1 -> LPCR_GTSE=0.

With LPCR_GTSE=0 the HW will treat 'tlbie' as HV privileged.

This patch allows a nested HV to set LPCR_GTSE for its nested guests
so the LPCR setting will match what the nested guest sees in OV5.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 arch/powerpc/kvm/book3s_hv_nested.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3s_hv_nested.c
index 9d373f8963ee..5b9008d89f90 100644
--- a/arch/powerpc/kvm/book3s_hv_nested.c
+++ b/arch/powerpc/kvm/book3s_hv_nested.c
@@ -262,7 +262,7 @@ static void load_l2_hv_regs(struct kvm_vcpu *vcpu,
 	 * Don't let L1 change LPCR bits for the L2 except these:
 	 */
 	mask = LPCR_DPFD | LPCR_ILE | LPCR_TC | LPCR_AIL | LPCR_LD |
-		LPCR_LPES | LPCR_MER;
+		LPCR_LPES | LPCR_MER | LPCR_GTSE;
 
 	/*
 	 * Additional filtering is required depending on hardware
-- 
2.34.1

