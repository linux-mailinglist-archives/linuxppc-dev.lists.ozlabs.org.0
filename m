Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5CD3E1E02
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Aug 2021 23:28:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GghYF270dz3dDC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Aug 2021 07:28:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=e8XQJ6gt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=e8XQJ6gt; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GghWZ26CPz3cc9
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Aug 2021 07:26:50 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 175LPuo2156657; Thu, 5 Aug 2021 17:26:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=qAcy4bZmcIeKrCL1oEuggo3xdZrcZMk1yAPqswiWuuk=;
 b=e8XQJ6gtYhnFScl2NRpMgqFzPFOQQnHSL49jpZkLip+g7MpX1X5lC3u1g93efV8O9DPu
 13PyVyEMfPF9SNASq2Bm0V5uhCI5OImLqizCJUmVTSru+KaBbUQylONg1O2RyxF44cEI
 wNr0kohL2OE0ZhqpKfqDLPh3oVGsrrukAlBvovw54Njfz2v29XMpyU8H0Tig0ID/UCp/
 8xKKDIgrW44euj02ZxV87/sV2KH0sehA/w4Mqw01JEc7texOzXCJAznCwwswmzJPyrSm
 oS9Cq1Vi+ZJwLsJAk39KlwyGXJznrlIPIz5QZCyCxef47GsgUxbOheiRUb6y7kWTukE8 Dg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a84mvpnnx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Aug 2021 17:26:39 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 175LQdd2158833;
 Thu, 5 Aug 2021 17:26:39 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a84mvpnkq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Aug 2021 17:26:38 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 175LMZrY029489;
 Thu, 5 Aug 2021 21:26:26 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma04wdc.us.ibm.com with ESMTP id 3a7yak94qx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Aug 2021 21:26:26 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 175LQQ8445089210
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 5 Aug 2021 21:26:26 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DDA7F11206D;
 Thu,  5 Aug 2021 21:26:25 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 77BAC112061;
 Thu,  5 Aug 2021 21:26:23 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.163.18.4])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu,  5 Aug 2021 21:26:23 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v2 1/3] KVM: PPC: Book3S HV: Fix copy_tofrom_guest routines
Date: Thu,  5 Aug 2021 18:26:14 -0300
Message-Id: <20210805212616.2641017-2-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210805212616.2641017-1-farosas@linux.ibm.com>
References: <20210805212616.2641017-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 8Aot_Q1mB1-TB6G4SrOFhy8HYdeG3YTS
X-Proofpoint-ORIG-GUID: 28-eg7G-4H_ZUI3cn1xfcx4ELReQ9XMR
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-05_10:2021-08-05,
 2021-08-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 priorityscore=1501 clxscore=1015 impostorscore=0 malwarescore=0
 adultscore=0 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2107140000 definitions=main-2108050124
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
Cc: linuxppc-dev@lists.ozlabs.org, christophe.leroy@c-s.fr, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The __kvmhv_copy_tofrom_guest_radix function was introduced along with
nested HV guest support. It uses the platform's Radix MMU quadrants to
provide a nested hypervisor with fast access to its nested guests
memory (H_COPY_TOFROM_GUEST hypercall). It has also since been added
as a fast path for the kvmppc_ld/st routines which are used during
instruction emulation.

The commit def0bfdbd603 ("powerpc: use probe_user_read() and
probe_user_write()") changed the low level copy function from
raw_copy_from_user to probe_user_read, which adds a check to
access_ok. In powerpc that is:

 static inline bool __access_ok(unsigned long addr, unsigned long size)
 {
         return addr < TASK_SIZE_MAX && size <= TASK_SIZE_MAX - addr;
 }

and TASK_SIZE_MAX is 0x0010000000000000UL for 64-bit, which means that
setting the two MSBs of the effective address (which correspond to the
quadrant) now cause access_ok to reject the access.

This was not caught earlier because the most common code path via
kvmppc_ld/st contains a fallback (kvm_read_guest) that is likely to
succeed for L1 guests. For nested guests there is no fallback.

Another issue is that probe_user_read (now __copy_from_user_nofault)
does not return the number of bytes not copied in case of failure, so
the destination memory is not being cleared anymore in
kvmhv_copy_from_guest_radix:

 ret = kvmhv_copy_tofrom_guest_radix(vcpu, eaddr, to, NULL, n);
 if (ret > 0)                            <-- always false!
         memset(to + (n - ret), 0, ret);

This patch fixes both issues by skipping access_ok and open-coding the
low level __copy_to/from_user_inatomic.

Fixes: def0bfdbd603 ("powerpc: use probe_user_read() and probe_user_write()")
Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 arch/powerpc/kvm/book3s_64_mmu_radix.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_64_mmu_radix.c b/arch/powerpc/kvm/book3s_64_mmu_radix.c
index b5905ae4377c..44eb7b1ef289 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_radix.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_radix.c
@@ -65,10 +65,12 @@ unsigned long __kvmhv_copy_tofrom_guest_radix(int lpid, int pid,
 	}
 	isync();
 
+	pagefault_disable();
 	if (is_load)
-		ret = copy_from_user_nofault(to, (const void __user *)from, n);
+		ret = __copy_from_user_inatomic(to, (const void __user *)from, n);
 	else
-		ret = copy_to_user_nofault((void __user *)to, from, n);
+		ret = __copy_to_user_inatomic((void __user *)to, from, n);
+	pagefault_enable();
 
 	/* switch the pid first to avoid running host with unallocated pid */
 	if (quadrant == 1 && pid != old_pid)
-- 
2.29.2

