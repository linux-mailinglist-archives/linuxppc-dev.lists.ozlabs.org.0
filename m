Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A20856787B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Jul 2019 06:52:09 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ly7p5RtdzDqwf
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Jul 2019 14:52:06 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ly1Q21x1zDqvZ
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Jul 2019 14:46:33 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6D4ffpL026809
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Jul 2019 00:46:31 -0400
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tq1q2u5b9-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Jul 2019 00:46:31 -0400
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bauerman@linux.ibm.com>;
 Sat, 13 Jul 2019 05:46:30 +0100
Received: from b03cxnp08028.gho.boulder.ibm.com (9.17.130.20)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Sat, 13 Jul 2019 05:46:24 +0100
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x6D4kNvL65143198
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 13 Jul 2019 04:46:23 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0AC34BE054;
 Sat, 13 Jul 2019 04:46:23 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 74BC8BE04F;
 Sat, 13 Jul 2019 04:46:18 +0000 (GMT)
Received: from morokweng.localdomain.com (unknown [9.85.135.203])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Sat, 13 Jul 2019 04:46:18 +0000 (GMT)
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: x86@kernel.org
Subject: [PATCH 3/3] fs/core/vmcore: Move sev_active() reference to x86 arch
 code
Date: Sat, 13 Jul 2019 01:45:54 -0300
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190713044554.28719-1-bauerman@linux.ibm.com>
References: <20190713044554.28719-1-bauerman@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19071304-0016-0000-0000-000009CD3344
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011418; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01231409; UDB=6.00648690; IPR=6.01012701; 
 MB=3.00027699; MTD=3.00000008; XFM=3.00000015; UTC=2019-07-13 04:46:28
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19071304-0017-0000-0000-000043FE838E
Message-Id: <20190713044554.28719-4-bauerman@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-13_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=38 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907130055
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
Cc: linux-s390@vger.kernel.org, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Robin Murphy <robin.murphy@arm.com>, Mike Anderson <andmike@linux.ibm.com>,
 Ram Pai <linuxram@us.ibm.com>, linux-kernel@vger.kernel.org,
 Alexey Dobriyan <adobriyan@gmail.com>, Halil Pasic <pasic@linux.ibm.com>,
 iommu@lists.linux-foundation.org, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Thomas Lendacky <Thomas.Lendacky@amd.com>,
 "H. Peter Anvin" <hpa@zytor.com>, linux-fsdevel@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>, Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Secure Encrypted Virtualization is an x86-specific feature, so it shouldn't
appear in generic kernel code because it forces non-x86 architectures to
define the sev_active() function, which doesn't make a lot of sense.

To solve this problem, add an x86 elfcorehdr_read() function to override
the generic weak implementation. To do that, it's necessary to make
read_from_oldmem() public so that it can be used outside of vmcore.c.

Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
---
 arch/x86/kernel/crash_dump_64.c |  5 +++++
 fs/proc/vmcore.c                |  8 ++++----
 include/linux/crash_dump.h      | 14 ++++++++++++++
 include/linux/mem_encrypt.h     |  1 -
 4 files changed, 23 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kernel/crash_dump_64.c b/arch/x86/kernel/crash_dump_64.c
index 22369dd5de3b..045e82e8945b 100644
--- a/arch/x86/kernel/crash_dump_64.c
+++ b/arch/x86/kernel/crash_dump_64.c
@@ -70,3 +70,8 @@ ssize_t copy_oldmem_page_encrypted(unsigned long pfn, char *buf, size_t csize,
 {
 	return __copy_oldmem_page(pfn, buf, csize, offset, userbuf, true);
 }
+
+ssize_t elfcorehdr_read(char *buf, size_t count, u64 *ppos)
+{
+	return read_from_oldmem(buf, count, ppos, 0, sev_active());
+}
diff --git a/fs/proc/vmcore.c b/fs/proc/vmcore.c
index 57957c91c6df..ca1f20bedd8c 100644
--- a/fs/proc/vmcore.c
+++ b/fs/proc/vmcore.c
@@ -100,9 +100,9 @@ static int pfn_is_ram(unsigned long pfn)
 }
 
 /* Reads a page from the oldmem device from given offset. */
-static ssize_t read_from_oldmem(char *buf, size_t count,
-				u64 *ppos, int userbuf,
-				bool encrypted)
+ssize_t read_from_oldmem(char *buf, size_t count,
+			 u64 *ppos, int userbuf,
+			 bool encrypted)
 {
 	unsigned long pfn, offset;
 	size_t nr_bytes;
@@ -166,7 +166,7 @@ void __weak elfcorehdr_free(unsigned long long addr)
  */
 ssize_t __weak elfcorehdr_read(char *buf, size_t count, u64 *ppos)
 {
-	return read_from_oldmem(buf, count, ppos, 0, sev_active());
+	return read_from_oldmem(buf, count, ppos, 0, false);
 }
 
 /*
diff --git a/include/linux/crash_dump.h b/include/linux/crash_dump.h
index f774c5eb9e3c..4664fc1871de 100644
--- a/include/linux/crash_dump.h
+++ b/include/linux/crash_dump.h
@@ -115,4 +115,18 @@ static inline int vmcore_add_device_dump(struct vmcoredd_data *data)
 	return -EOPNOTSUPP;
 }
 #endif /* CONFIG_PROC_VMCORE_DEVICE_DUMP */
+
+#ifdef CONFIG_PROC_VMCORE
+ssize_t read_from_oldmem(char *buf, size_t count,
+			 u64 *ppos, int userbuf,
+			 bool encrypted);
+#else
+static inline ssize_t read_from_oldmem(char *buf, size_t count,
+				       u64 *ppos, int userbuf,
+				       bool encrypted)
+{
+	return -EOPNOTSUPP;
+}
+#endif /* CONFIG_PROC_VMCORE */
+
 #endif /* LINUX_CRASHDUMP_H */
diff --git a/include/linux/mem_encrypt.h b/include/linux/mem_encrypt.h
index 0c5b0ff9eb29..5c4a18a91f89 100644
--- a/include/linux/mem_encrypt.h
+++ b/include/linux/mem_encrypt.h
@@ -19,7 +19,6 @@
 #else	/* !CONFIG_ARCH_HAS_MEM_ENCRYPT */
 
 static inline bool mem_encrypt_active(void) { return false; }
-static inline bool sev_active(void) { return false; }
 
 #endif	/* CONFIG_ARCH_HAS_MEM_ENCRYPT */
 

