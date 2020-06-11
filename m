Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 263EB1F676E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jun 2020 14:05:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49jMxd032TzDqsH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jun 2020 22:05:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49jMvj1wytzDqZF
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jun 2020 22:03:45 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05BC3YYF160965; Thu, 11 Jun 2020 08:03:42 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31k27s6bjs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Jun 2020 08:03:39 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05BC0r4m000874;
 Thu, 11 Jun 2020 12:02:08 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma02wdc.us.ibm.com with ESMTP id 31g2s8v99e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Jun 2020 12:02:08 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05BC26Om31785228
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Jun 2020 12:02:06 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E4CD76A051;
 Thu, 11 Jun 2020 12:02:07 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 457706A05F;
 Thu, 11 Jun 2020 12:02:06 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.62.196])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 11 Jun 2020 12:02:05 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: paulus@ozlabs.org, kvm-ppc@vger.kernel.org
Subject: [PATCH] powerpc/kvm/book3s64/nested: Fix kernel crash with nested kvm
Date: Thu, 11 Jun 2020 17:31:59 +0530
Message-Id: <20200611120159.680284-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-11_11:2020-06-10,
 2020-06-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 adultscore=0 clxscore=1015 bulkscore=0 mlxlogscore=684 malwarescore=0
 impostorscore=0 cotscore=-2147483648 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006110091
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

__pa() do check for addr value passed and if < PAGE_OFFSET
results in BUG.

 #define __pa(x)								\
({									\
	VIRTUAL_BUG_ON((unsigned long)(x) < PAGE_OFFSET);		\
	(unsigned long)(x) & 0x0fffffffffffffffUL;			\
})

kvmhv_copy_tofrom_guest_radix() use a NULL value for
to/from to indicate direction of copy. Avoid calling __pa() if the
value is NULL

kernel BUG at arch/powerpc/kvm/book3s_64_mmu_radix.c:43!
cpu 0x70: Vector: 700 (Program Check) at [c0000018a2187360]
    pc: c000000000161b30: __kvmhv_copy_tofrom_guest_radix+0x130/0x1f0
    lr: c000000000161d5c: kvmhv_copy_from_guest_radix+0x3c/0x80

....

[c0000018a2187670] c000000000161d5c kvmhv_copy_from_guest_radix+0x3c/0x80
[c0000018a21876b0] c00000000014feb8 kvmhv_load_from_eaddr+0x48/0xc0
[c0000018a21876e0] c000000000135828 kvmppc_ld+0x98/0x1e0
[c0000018a2187780] c00000000013bc20 kvmppc_load_last_inst+0x50/0x90
[c0000018a21877b0] c00000000015e9e8 kvmppc_hv_emulate_mmio+0x288/0x2b0
[c0000018a2187810] c000000000164888 kvmppc_book3s_radix_page_fault+0xd8/0x2b0
[c0000018a21878c0] c00000000015ed8c kvmppc_book3s_hv_page_fault+0x37c/0x1050
[c0000018a2187a00] c00000000015a518 kvmppc_vcpu_run_hv+0xbb8/0x1080
[c0000018a2187b20] c00000000013d204 kvmppc_vcpu_run+0x34/0x50
[c0000018a2187b40] c00000000013949c kvm_arch_vcpu_ioctl_run+0x2fc/0x410
[c0000018a2187bd0] c00000000012a2a4 kvm_vcpu_ioctl+0x2b4/0x8f0
[c0000018a2187d50] c0000000005b12a4 ksys_ioctl+0xf4/0x150
[c0000018a2187da0] c0000000005b1328 sys_ioctl+0x28/0x80
[c0000018a2187dc0] c000000000030584 system_call_exception+0x104/0x1d0
[c0000018a2187e20] c00000000000ca68 system_call_common+0xe8/0x214

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/kvm/book3s_64_mmu_radix.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kvm/book3s_64_mmu_radix.c b/arch/powerpc/kvm/book3s_64_mmu_radix.c
index 02219e28b1e4..84acb4769487 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_radix.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_radix.c
@@ -40,7 +40,8 @@ unsigned long __kvmhv_copy_tofrom_guest_radix(int lpid, int pid,
 	/* Can't access quadrants 1 or 2 in non-HV mode, call the HV to do it */
 	if (kvmhv_on_pseries())
 		return plpar_hcall_norets(H_COPY_TOFROM_GUEST, lpid, pid, eaddr,
-					  __pa(to), __pa(from), n);
+					  (to != NULL) ? __pa(to): 0,
+					  (from != NULL) ? __pa(from): 0, n);
 
 	quadrant = 1;
 	if (!pid)
-- 
2.26.2

