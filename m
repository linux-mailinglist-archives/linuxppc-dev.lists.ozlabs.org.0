Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0106A8CAD
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Mar 2023 00:01:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PSRRT0Rlzz3cQV
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Mar 2023 10:01:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GtgQ/XEz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GtgQ/XEz;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PSRQV15Ltz3cG1
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Mar 2023 10:00:17 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 322MC39E016367;
	Thu, 2 Mar 2023 23:00:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=LmIG/xh+ODxiJf6PyyaROeXNwg+LWK+uTXvRR2K0L8s=;
 b=GtgQ/XEz19Uh0eTXw0wSA/nhhies0/igGz+YxoLUPfoYdqj1wNmr9880AO4FvYaHC8QE
 BhAh35Jwx4Efo0bO7ffPuQhqmnP8XHDpbJ37qR2mh7fy+oEcolLGGTCgygg/Z/yJNh7n
 MLPCEU+YTs6kxsxMy7YzM2GEpDDU0Yoe/eGW5JQP+4XVURjSk8ovJr4bI9+VuA+l4f4q
 4t4hxLKq0gD/iLrKDcxkakvn59CtpaoLtm/CIz3cb4tVYMsGK4fY6vmWk8SSXylygbEZ
 LzdMzQLevwiWNqHBIM/qKm5L1+qSG79CCwf1PHiL61d7/gcYXg1VMoxn7/aOA44CVCPJ Xw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p34cpry5h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Mar 2023 23:00:12 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 322Mr9UL025865;
	Thu, 2 Mar 2023 23:00:11 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p34cpry46-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Mar 2023 23:00:11 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 322Ixvo4028906;
	Thu, 2 Mar 2023 23:00:09 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3nybcuedde-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Mar 2023 23:00:08 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 322N04Pd29884844
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 2 Mar 2023 23:00:04 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A30F520043;
	Thu,  2 Mar 2023 23:00:04 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 252D62004F;
	Thu,  2 Mar 2023 23:00:04 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  2 Mar 2023 23:00:04 +0000 (GMT)
Received: from bgray-lenovo-p15.ibm.com (unknown [9.177.66.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 89EB9600E5;
	Fri,  3 Mar 2023 09:59:59 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2] powerpc/64s: Fix __pte_needs_flush() false positive warning
Date: Fri,  3 Mar 2023 09:59:47 +1100
Message-Id: <20230302225947.81083-1-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: YBuQnRnZyQt4FSSYUGxig__I6LYH3tsW
X-Proofpoint-GUID: rkYiaZ064jzSHjC65EvanFqLHV4T2r5p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-02_15,2023-03-02_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 mlxlogscore=791 malwarescore=0 bulkscore=0
 clxscore=1015 phishscore=0 suspectscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303020195
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
Cc: Benjamin Gray <bgray@linux.ibm.com>, npiggin@gmail.com, ruscur@russell.cc
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Userspace PROT_NONE ptes set _PAGE_PRIVILEGED, triggering a false
positive debug assertion that __pte_flags_need_flush() is not called
on a kernel mapping.

Detect when it is a userspace PROT_NONE page by checking the required
bits of PAGE_NONE are set, and none of the RWX bits are set.
pte_protnone() is insufficient here because it always returns 0 when
CONFIG_NUMA_BALANCING=n.

Reported-by: Russell Currey <ruscur@russell.cc>
Fixes: b11931e9adc1 ("powerpc/64s: add pte_needs_flush and huge_pmd_needs_flush")
Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
---
v2: removed an auto-import that slipped in

MRE (CONFIG_DEBUG_VM must be enabled):

int main(int argc, char **argv)
{
	char *buf = mmap(NULL, getpagesize(), PROT_WRITE, MAP_SHARED | MAP_ANONYMOUS, -1, 0);
	buf[0] = '1';
	mprotect(buf, getpagesize(), PROT_NONE);
	return 0;
}
---
 arch/powerpc/include/asm/book3s/64/tlbflush.h | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush.h b/arch/powerpc/include/asm/book3s/64/tlbflush.h
index 2bbc0fcce04a..5e26c7f2c25a 100644
--- a/arch/powerpc/include/asm/book3s/64/tlbflush.h
+++ b/arch/powerpc/include/asm/book3s/64/tlbflush.h
@@ -148,6 +148,11 @@ static inline void flush_tlb_fix_spurious_fault(struct vm_area_struct *vma,
 	 */
 }
 
+static inline bool __pte_protnone(unsigned long pte)
+{
+	return (pte & (pgprot_val(PAGE_NONE) | _PAGE_RWX)) == pgprot_val(PAGE_NONE);
+}
+
 static inline bool __pte_flags_need_flush(unsigned long oldval,
 					  unsigned long newval)
 {
@@ -164,8 +169,8 @@ static inline bool __pte_flags_need_flush(unsigned long oldval,
 	/*
 	 * We do not expect kernel mappings or non-PTEs or not-present PTEs.
 	 */
-	VM_WARN_ON_ONCE(oldval & _PAGE_PRIVILEGED);
-	VM_WARN_ON_ONCE(newval & _PAGE_PRIVILEGED);
+	VM_WARN_ON_ONCE(!__pte_protnone(oldval) && oldval & _PAGE_PRIVILEGED);
+	VM_WARN_ON_ONCE(!__pte_protnone(newval) && newval & _PAGE_PRIVILEGED);
 	VM_WARN_ON_ONCE(!(oldval & _PAGE_PTE));
 	VM_WARN_ON_ONCE(!(newval & _PAGE_PTE));
 	VM_WARN_ON_ONCE(!(oldval & _PAGE_PRESENT));

base-commit: 90dbf76e470bc4b973052a8f26ea43bae30f9aec
-- 
2.39.2

