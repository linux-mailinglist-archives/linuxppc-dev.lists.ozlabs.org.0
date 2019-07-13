Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD18678D0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Jul 2019 08:18:34 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45m03W5HTszDqck
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Jul 2019 16:18:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=bauerman@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45lzgb0MCSzDqvT
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Jul 2019 16:01:14 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6D5w3g6100603
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Jul 2019 02:01:12 -0400
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tq9m9r2n0-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Jul 2019 02:01:12 -0400
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bauerman@linux.ibm.com>;
 Sat, 13 Jul 2019 07:01:11 +0100
Received: from b03cxnp07028.gho.boulder.ibm.com (9.17.130.15)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Sat, 13 Jul 2019 07:01:08 +0100
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x6D616Ju38600968
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 13 Jul 2019 06:01:06 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C2AEAC605A;
 Sat, 13 Jul 2019 06:01:06 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C908AC6065;
 Sat, 13 Jul 2019 06:01:03 +0000 (GMT)
Received: from morokweng.localdomain.com (unknown [9.85.135.203])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Sat, 13 Jul 2019 06:01:03 +0000 (GMT)
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 08/13] powerpc/pseries/svm: Unshare all pages before
 kexecing a new kernel
Date: Sat, 13 Jul 2019 03:00:18 -0300
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190713060023.8479-1-bauerman@linux.ibm.com>
References: <20190713060023.8479-1-bauerman@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19071306-0004-0000-0000-00001526F198
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011419; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01231433; UDB=6.00648705; IPR=6.01012726; 
 MB=3.00027699; MTD=3.00000008; XFM=3.00000015; UTC=2019-07-13 06:01:10
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19071306-0005-0000-0000-00008C6EF538
Message-Id: <20190713060023.8479-9-bauerman@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-13_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907130070
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
Cc: Anshuman Khandual <anshuman.linux@gmail.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Mike Anderson <andmike@linux.ibm.com>,
 Ram Pai <linuxram@us.ibm.com>, linux-kernel@vger.kernel.org,
 Claudio Carvalho <cclaudio@linux.ibm.com>, Paul Mackerras <paulus@samba.org>,
 Christoph Hellwig <hch@lst.de>, Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Ram Pai <linuxram@us.ibm.com>

A new kernel deserves a clean slate. Any pages shared with the hypervisor
is unshared before invoking the new kernel. However there are exceptions.
If the new kernel is invoked to dump the current kernel, or if there is a
explicit request to preserve the state of the current kernel, unsharing
of pages is skipped.

NOTE: While testing crashkernel, make sure at least 256M is reserved for
crashkernel. Otherwise SWIOTLB allocation will fail and crash kernel will
fail to boot.

Signed-off-by: Ram Pai <linuxram@us.ibm.com>
Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
---
 arch/powerpc/include/asm/ultravisor-api.h | 1 +
 arch/powerpc/include/asm/ultravisor.h     | 6 ++++++
 arch/powerpc/kernel/machine_kexec_64.c    | 8 ++++++++
 3 files changed, 15 insertions(+)

diff --git a/arch/powerpc/include/asm/ultravisor-api.h b/arch/powerpc/include/asm/ultravisor-api.h
index c7513bbadf57..ab4f756cb91c 100644
--- a/arch/powerpc/include/asm/ultravisor-api.h
+++ b/arch/powerpc/include/asm/ultravisor-api.h
@@ -29,5 +29,6 @@
 #define UV_UNSHARE_PAGE			0xF134
 #define UV_PAGE_INVAL			0xF138
 #define UV_SVM_TERMINATE		0xF13C
+#define UV_UNSHARE_ALL_PAGES		0xF140
 
 #endif /* _ASM_POWERPC_ULTRAVISOR_API_H */
diff --git a/arch/powerpc/include/asm/ultravisor.h b/arch/powerpc/include/asm/ultravisor.h
index f7418b663a0e..80d4beaf61b8 100644
--- a/arch/powerpc/include/asm/ultravisor.h
+++ b/arch/powerpc/include/asm/ultravisor.h
@@ -106,6 +106,12 @@ static inline int uv_unshare_page(u64 pfn, u64 npages)
 	return ucall(UV_UNSHARE_PAGE, retbuf, pfn, npages);
 }
 
+static inline int uv_unshare_all_pages(void)
+{
+	unsigned long retbuf[UCALL_BUFSIZE];
+
+	return ucall(UV_UNSHARE_ALL_PAGES, retbuf);
+}
 #endif /* !__ASSEMBLY__ */
 
 #endif	/* _ASM_POWERPC_ULTRAVISOR_H */
diff --git a/arch/powerpc/kernel/machine_kexec_64.c b/arch/powerpc/kernel/machine_kexec_64.c
index 75692c327ba0..b3d87d32e8f7 100644
--- a/arch/powerpc/kernel/machine_kexec_64.c
+++ b/arch/powerpc/kernel/machine_kexec_64.c
@@ -31,6 +31,7 @@
 #include <asm/smp.h>
 #include <asm/hw_breakpoint.h>
 #include <asm/asm-prototypes.h>
+#include <asm/ultravisor.h>
 
 int default_machine_kexec_prepare(struct kimage *image)
 {
@@ -329,6 +330,13 @@ void default_machine_kexec(struct kimage *image)
 #ifdef CONFIG_PPC_PSERIES
 	kexec_paca.lppaca_ptr = NULL;
 #endif
+
+	if (is_secure_guest() && !(image->preserve_context ||
+				   image->type == KEXEC_TYPE_CRASH)) {
+		uv_unshare_all_pages();
+		printk("kexec: Unshared all shared pages.\n");
+	}
+
 	paca_ptrs[kexec_paca.paca_index] = &kexec_paca;
 
 	setup_paca(&kexec_paca);

