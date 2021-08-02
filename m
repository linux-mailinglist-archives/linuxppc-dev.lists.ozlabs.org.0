Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC6C3DE343
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Aug 2021 01:51:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GdvtP331Lz3bXp
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Aug 2021 09:51:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tB94p91k;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=tB94p91k; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gdvsv2SCKz2yNG
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Aug 2021 09:51:30 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 172NYWhq191770; Mon, 2 Aug 2021 19:51:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=Zy8u+iZjJF5rgUIWtPjs5w51IfL+CHjjbvIEPBpoG5k=;
 b=tB94p91kxMeukDC0RwIMEkW4ZxiHMfwvun4CSxfNXOEjpRg+oup2W7VuEkRTZESjFKEg
 okRXIGuAHBrh0qjJa1CMuBEBj9inOmLZGCCwsoFJw77a+NfV6wG9QOqkVfCnIb8XKUPE
 zOCV8wWmD6m883dQknDizD05aXG7QztE5Razfi8ak9ZtQV011B84Gh94qWcKV1zYvd70
 ucQj+rKSP2NnXwoG3Gm2zECOd/hWDwk1OK+KwHcVChEJs0lR1ScWRwTBtuYVCobO6ibi
 csFhs+eVePl4o9XO/LH4abgPx2umrQ+0lrAIwgCwYQdHRg5ly+1r3xSD4kRF3ALYp8YC rw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3a5m024cky-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 Aug 2021 19:51:19 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 172NZrxL194627;
 Mon, 2 Aug 2021 19:51:18 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3a5m024cks-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 Aug 2021 19:51:18 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 172NhOYk018035;
 Mon, 2 Aug 2021 23:51:17 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma01dal.us.ibm.com with ESMTP id 3a4x5c282v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 Aug 2021 23:51:15 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 172Nnm7G28115318
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 2 Aug 2021 23:49:48 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4D81D112089;
 Mon,  2 Aug 2021 23:49:48 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D8DC1112080;
 Mon,  2 Aug 2021 23:49:45 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.147.189])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  2 Aug 2021 23:49:45 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH] KVM: PPC: Book3S HV: Fix kvmhv_copy_tofrom_guest_radix
Date: Mon,  2 Aug 2021 20:49:41 -0300
Message-Id: <20210802234941.2568493-1-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: XDu1sdXcRYa4geea3LgkH1NIsLRHQtNl
X-Proofpoint-GUID: 66lDNQhNt0HxsFdf703KzyF9NmB-7PQo
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-02_07:2021-08-02,
 2021-08-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 mlxlogscore=999 lowpriorityscore=0 clxscore=1011 priorityscore=1501
 mlxscore=0 malwarescore=0 phishscore=0 bulkscore=0 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108020149
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

This function was introduced along with nested HV guest support. It
uses the platform's Radix MMU quadrants[1] to provide a nested
hypervisor with fast access to its nested guests memory
(H_COPY_TOFROM_GUEST hypercall). It has also since been added as a
fast path for the kvmppc_ld/st routines which are used during
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
does not return the number of not copied bytes in case of failure, so
the destination memory is not being cleared anymore in
kvmhv_copy_from_guest_radix:

 ret = kvmhv_copy_tofrom_guest_radix(vcpu, eaddr, to, NULL, n);
 if (ret > 0)                            <-- always false!
        memset(to + (n - ret), 0, ret);

This patch fixes both issues by introducing two new functions that set
the quadrant bit of the effective address only after checking
access_ok and moving the memset closer to __copy_to_user_inatomic.

1 - for more on quadrants see commit d7b456152230 ("KVM: PPC: Book3S
HV: Implement functions to access quadrants 1 & 2")

Fixes: def0bfdbd603 ("powerpc: use probe_user_read() and probe_user_write()")
Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 arch/powerpc/kvm/book3s_64_mmu_radix.c | 63 ++++++++++++++++++++------
 1 file changed, 49 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_64_mmu_radix.c b/arch/powerpc/kvm/book3s_64_mmu_radix.c
index b5905ae4377c..076a8e4a9135 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_radix.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_radix.c
@@ -30,12 +30,57 @@
  */
 static int p9_supported_radix_bits[4] = { 5, 9, 9, 13 };
 
+/* LPIDR and PIDR must have already been set */
+static long __copy_from_guest_quadrant(void *dst, void __user *src, size_t size,
+				       unsigned long quadrant)
+{
+	long ret = size;
+	mm_segment_t old_fs = force_uaccess_begin();
+
+	if (access_ok(src, size)) {
+		src += (quadrant << 62);
+
+		pagefault_disable();
+		ret = __copy_from_user_inatomic((void __user *)dst, src, size);
+		pagefault_enable();
+	}
+	force_uaccess_end(old_fs);
+
+	if (!ret)
+		return ret;
+
+	memset(dst + (size - ret), 0, ret);
+
+	return -EFAULT;
+}
+
+/* LPIDR and PIDR must have already been set */
+static long __copy_to_guest_quadrant(void __user *dst, void *src, size_t size,
+				     unsigned long quadrant)
+{
+	long ret = -EFAULT;
+	mm_segment_t old_fs = force_uaccess_begin();
+
+	if (access_ok(dst, size)) {
+		dst += (quadrant << 62);
+
+		pagefault_disable();
+		ret = __copy_to_user_inatomic(dst, (void __user *)src, size);
+		pagefault_enable();
+	}
+	force_uaccess_end(old_fs);
+
+	if (ret)
+		return -EFAULT;
+	return 0;
+}
+
 unsigned long __kvmhv_copy_tofrom_guest_radix(int lpid, int pid,
 					      gva_t eaddr, void *to, void *from,
 					      unsigned long n)
 {
 	int old_pid, old_lpid;
-	unsigned long quadrant, ret = n;
+	unsigned long quadrant, ret;
 	bool is_load = !!to;
 
 	/* Can't access quadrants 1 or 2 in non-HV mode, call the HV to do it */
@@ -47,10 +92,6 @@ unsigned long __kvmhv_copy_tofrom_guest_radix(int lpid, int pid,
 	quadrant = 1;
 	if (!pid)
 		quadrant = 2;
-	if (is_load)
-		from = (void *) (eaddr | (quadrant << 62));
-	else
-		to = (void *) (eaddr | (quadrant << 62));
 
 	preempt_disable();
 
@@ -66,9 +107,9 @@ unsigned long __kvmhv_copy_tofrom_guest_radix(int lpid, int pid,
 	isync();
 
 	if (is_load)
-		ret = copy_from_user_nofault(to, (const void __user *)from, n);
+		ret = __copy_from_guest_quadrant(to, (void __user *)eaddr, n, quadrant);
 	else
-		ret = copy_to_user_nofault((void __user *)to, from, n);
+		ret = __copy_to_guest_quadrant((void __user *)eaddr, from, n, quadrant);
 
 	/* switch the pid first to avoid running host with unallocated pid */
 	if (quadrant == 1 && pid != old_pid)
@@ -109,13 +150,7 @@ static long kvmhv_copy_tofrom_guest_radix(struct kvm_vcpu *vcpu, gva_t eaddr,
 long kvmhv_copy_from_guest_radix(struct kvm_vcpu *vcpu, gva_t eaddr, void *to,
 				 unsigned long n)
 {
-	long ret;
-
-	ret = kvmhv_copy_tofrom_guest_radix(vcpu, eaddr, to, NULL, n);
-	if (ret > 0)
-		memset(to + (n - ret), 0, ret);
-
-	return ret;
+	return kvmhv_copy_tofrom_guest_radix(vcpu, eaddr, to, NULL, n);
 }
 EXPORT_SYMBOL_GPL(kvmhv_copy_from_guest_radix);
 
-- 
2.29.2

